@interface OcelotManager
- (OcelotManager)init;
- (id)createMetricsEventsForEventType:(unsigned __int8)a3 context:(id)a4;
- (void)_handleNetworkStateDidChangeNotification:(id)a3;
- (void)_handleRepairBundleIDNotification:(id)a3;
- (void)decorateMetricsEvent:(id)a3 context:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation OcelotManager

- (OcelotManager)init
{
  v44.receiver = self;
  v44.super_class = (Class)OcelotManager;
  v2 = [(AppUsageBaseManager *)&v44 init];
  if (v2)
  {
    id v3 = sub_1002188DC();
    v2->_appStoreCacheUpdatedNotificationToken = -1;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.OcelotManager.background", v4);
    backgroundQueue = v2->_backgroundQueue;
    v2->_backgroundQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.appstored.OcelotManager.callout", v7);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.appstored.OcelotManager.dispatch", v10);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.appstored.OcelotManager.distNotification", v13);
    distNotificationQueue = v2->_distNotificationQueue;
    v2->_distNotificationQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = sub_1002D7794((uint64_t)v2);
    hardwareFamily = v2->_hardwareFamily;
    v2->_hardwareFamily = (NSString *)v16;

    uint64_t v18 = sub_1002D7870(v2);
    hardwareModel = v2->_hardwareModel;
    v2->_hardwareModel = (NSString *)v18;

    v20 = objc_alloc_init(UnfairLock);
    lock = v2->_lock;
    v2->_lock = v20;

    uint64_t v22 = sub_1002D78F4((__CFString *)v2);
    os = v2->_os;
    v2->_os = (NSString *)v22;

    uint64_t v24 = +[AMSDevice buildVersion];
    osBuild = v2->_osBuild;
    v2->_osBuild = (NSString *)v24;

    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.appstored.OcelotManager.sbsync", v26);
    sbsyncQueue = v2->_sbsyncQueue;
    v2->_sbsyncQueue = (OS_dispatch_queue *)v27;

    v29 = objc_alloc_init(TaskQueue);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = v29;

    v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v32 = dispatch_queue_create("com.apple.appstored.OcelotManager.topApps", v31);
    topAppsQueue = v2->_topAppsQueue;
    v2->_topAppsQueue = (OS_dispatch_queue *)v32;

    v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v35 = dispatch_queue_create("com.apple.appstored.OcelotManager.upsell", v34);
    upsellQueue = v2->_upsellQueue;
    v2->_upsellQueue = (OS_dispatch_queue *)v35;

    v37 = sub_1003DA6D4();
    unsigned __int8 v38 = [v37 isHRNMode];

    if ((v38 & 1) == 0)
    {
      v39 = +[NSNotificationCenter defaultCenter];
      [v39 addObserver:v2 selector:"_handleRepairBundleIDNotification:" name:@"com.apple.appstored.ASDRepairBundleID" object:0];

      v40 = v2->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10037AE34;
      block[3] = &unk_100521388;
      v43 = v2;
      dispatch_async(v40, block);
    }
  }
  return v2;
}

- (id)createMetricsEventsForEventType:(unsigned __int8)a3 context:(id)a4
{
  unsigned int v4 = a3;
  v6 = a4;
  v7 = objc_opt_new();
  dispatch_queue_t v8 = sub_1002D73A8(self, v4, v6);
  if ([v8 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v23 = v8;
    id obj = v8;
    id v9 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v28;
      uint64_t v24 = self;
      v25 = v7;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v12);
          dispatch_queue_t v14 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            if (v6) {
              v15 = (void *)v6[9];
            }
            else {
              v15 = 0;
            }
            id v16 = v15;
            v17 = sub_10022E5E8(v13);
            uint64_t v18 = sub_10022DD24((uint64_t)AppEvent, v4);
            *(_DWORD *)buf = 138412802;
            id v32 = v16;
            __int16 v33 = 2114;
            v34 = v17;
            __int16 v35 = 2114;
            v36 = v18;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%@] [%{public}@] Adding event for app with type: %{public}@", buf, 0x20u);

            self = v24;
            v7 = v25;
          }

          v19 = sub_1002D61A0(self, v13, v4, v6);
          [v7 addObject:v19];

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v20 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
        id v10 = v20;
      }
      while (v20);
    }

    dispatch_queue_t v8 = v23;
  }
  id v21 = [v7 copy];

  return v21;
}

- (void)decorateMetricsEvent:(id)a3 context:(id)a4
{
  v6 = (id *)a3;
  v7 = (id *)a4;
  dispatch_queue_t v8 = +[NSUUID UUID];
  id v9 = [v8 UUIDString];

  v107 = v6;
  sub_1003F5498(v6, v9);
  if (v7)
  {
    id v10 = v7[4];
    if (v10 == (id)3 || v10 == (id)7)
    {
      [v6 setAnonymous:1];
      v12 = sub_1003F2EB8();
    }
    else
    {
      if (v10 != (id)4) {
        goto LABEL_12;
      }
      v12 = sub_1003F2F30();
    }
    v13 = v12;
    if (v12)
    {
      sub_1003F6290(v6, v12);
    }
  }
LABEL_12:
  osBuild = self->_osBuild;
  if (osBuild) {
    sub_1003F6380(v6, osBuild);
  }
  hardwareFamily = self->_hardwareFamily;
  if (hardwareFamily) {
    sub_1003F5ED0(v6, hardwareFamily);
  }
  hardwareModel = self->_hardwareModel;
  if (hardwareModel) {
    sub_1003F5F48(v6, hardwareModel);
  }
  os = self->_os;
  if (os) {
    sub_1003F61A0(v6, os);
  }
  if (v7) {
    id v18 = v7[16];
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  if (!v19)
  {
    if (v7) {
      id v20 = v7[9];
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;
    uint64_t v22 = sub_10037EDD8(self, v21);

    v23 = ASDLogHandleForCategory();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v24)
      {
        if (v7) {
          id v25 = v7[9];
        }
        else {
          id v25 = 0;
        }
        id v26 = v25;
        *(_DWORD *)buf = 138412546;
        id v124 = v26;
        __int16 v125 = 2112;
        v126 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%@] Setting cached subscribed accountID to: %@", buf, 0x16u);
      }
      v23 = +[ACAccountStore ams_sharedAccountStore];
      id v28 = [v23 ams_iTunesAccountWithDSID:v22];
      if (v7) {
        objc_setProperty_nonatomic_copy(v7, v27, v28, 128);
      }
    }
    else
    {
      if (!v24)
      {
LABEL_37:

        goto LABEL_38;
      }
      if (v7) {
        id v29 = v7[9];
      }
      else {
        id v29 = 0;
      }
      id v28 = v29;
      *(_DWORD *)buf = 138412290;
      id v124 = v28;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%@] Unable to determine the subscription status for the active account", buf, 0xCu);
    }

    goto LABEL_37;
  }
LABEL_38:
  if (v7) {
    id v30 = v7[17];
  }
  else {
    id v30 = 0;
  }
  id v31 = v30;

  if (!v31)
  {
    id v32 = +[KatanaSubscriptionCoordinator shared];
    if (v7)
    {
      id v33 = v7[16];
      id v34 = v7[9];
    }
    else
    {
      id v33 = 0;
      id v34 = 0;
    }
    id v35 = v34;
    v37 = [v32 subscriptionInfoDictionaryWithAccount:v33 onlyReturnForPreviouslySubscribedAccount:0 logKey:v35];
    if (v7) {
      objc_setProperty_nonatomic_copy(v7, v36, v37, 136);
    }
  }
  if (!v7) {
    goto LABEL_94;
  }
  id v38 = v7[4];
  if (v38 == (id)3)
  {
    v105 = v9;
    id v58 = v7[12];
    v59 = +[AMSMetrics serverTimeFromDate:v58];

    v104 = v59;
    sub_1003F5D70(v107, v59);
    v60 = v7 + 3;
    id v61 = v7[3];

    if (!v61)
    {
      v62 = sub_100383030((uint64_t)self, v7);
      objc_setProperty_nonatomic_copy(v7, v63, v62, 24);
    }
    v106 = v7;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    v64 = sub_10030B11C();
    self;
    v65 = sub_10030CA3C(v64, @"allowed-anonymous-arcade-keys", &__NSArray0__struct);

    id v66 = [v65 countByEnumeratingWithState:&v112 objects:v121 count:16];
    if (v66)
    {
      id v67 = v66;
      uint64_t v68 = *(void *)v113;
      v69 = v7 + 17;
      do
      {
        for (i = 0; i != v67; i = (char *)i + 1)
        {
          if (*(void *)v113 != v68) {
            objc_enumerationMutation(v65);
          }
          uint64_t v71 = *(void *)(*((void *)&v112 + 1) + 8 * i);
          id v72 = *v60;
          if (v72)
          {
            v73 = v72;
            id v74 = *v60;
            v75 = objc_msgSend(v74, "objectForKeyedSubscript:", v71, v104);

            v76 = v60;
            if (v75) {
              goto LABEL_74;
            }
          }
          id v77 = *v69;
          v78 = [v77 objectForKeyedSubscript:v71];

          v76 = v69;
          if (v78)
          {
LABEL_74:
            id v79 = *v76;
            v80 = [v79 objectForKeyedSubscript:v71];
            [v107 setProperty:v80 forBodyKey:v71];
          }
        }
        id v67 = [v65 countByEnumeratingWithState:&v112 objects:v121 count:16];
      }
      while (v67);
    }

    goto LABEL_92;
  }
  if (v38 == (id)7)
  {
    v105 = v9;
    v106 = v7;
    id v82 = v7[3];
    v81 = v7 + 3;
    id v83 = v82;

    if (!v83)
    {
      v84 = sub_100383030((uint64_t)self, v106);
      objc_setProperty_nonatomic_copy(v106, v85, v84, 24);
    }
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    v86 = sub_10030B11C();
    self;
    v87 = sub_10030C674(v86, @"allowed-anonymous-arcade-account-keys", &off_10054E058, 0);

    id v88 = [v87 countByEnumeratingWithState:&v108 objects:v120 count:16];
    if (v88)
    {
      id v89 = v88;
      uint64_t v90 = *(void *)v109;
      do
      {
        for (j = 0; j != v89; j = (char *)j + 1)
        {
          if (*(void *)v109 != v90) {
            objc_enumerationMutation(v87);
          }
          uint64_t v92 = *(void *)(*((void *)&v108 + 1) + 8 * (void)j);
          id v93 = *v81;
          if (v93)
          {
            v94 = v93;
            id v95 = *v81;
            v96 = [v95 objectForKeyedSubscript:v92];

            v97 = v81;
            if (v96) {
              goto LABEL_88;
            }
          }
          id v98 = v106[17];
          v99 = [v98 objectForKeyedSubscript:v92];

          v97 = v106 + 17;
          if (v99)
          {
LABEL_88:
            id v100 = *v97;
            v101 = [v100 objectForKeyedSubscript:v92];
            [v107 setProperty:v101 forBodyKey:v92];
          }
        }
        id v89 = [v87 countByEnumeratingWithState:&v108 objects:v120 count:16];
      }
      while (v89);
    }

    [v107 removePropertiesForKeys:&off_10054E040];
LABEL_92:
    v7 = v106;
LABEL_93:
    id v9 = v105;
    goto LABEL_94;
  }
  if (v38 == (id)4)
  {
    sub_1003F6470(v6, (uint64_t)v7[10]);
    [v6 removePropertiesForKeys:&off_10054E028];
    v39 = v7 + 14;
    id v40 = v7[14];

    if (!v40)
    {
      v41 = sub_100383030((uint64_t)self, v7);
      objc_setProperty_nonatomic_copy(v7, v42, v41, 112);
    }
    id v43 = *v39;

    if (v43)
    {
      v105 = v9;
      objc_super v44 = sub_10030B11C();
      self;
      v45 = sub_10030CA3C(v44, @"allowed-payout-arcade-keys", &__NSArray0__struct);

      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v46 = [v45 countByEnumeratingWithState:&v116 objects:v122 count:16];
      if (v46)
      {
        id v47 = v46;
        uint64_t v48 = *(void *)v117;
        do
        {
          for (k = 0; k != v47; k = (char *)k + 1)
          {
            if (*(void *)v117 != v48) {
              objc_enumerationMutation(v45);
            }
            uint64_t v50 = *(void *)(*((void *)&v116 + 1) + 8 * (void)k);
            id v51 = *v39;
            v52 = [v51 objectForKeyedSubscript:v50];

            v53 = v7 + 14;
            if (!v52)
            {
              id v54 = v7[17];
              v55 = [v54 objectForKeyedSubscript:v50];

              v53 = v7 + 17;
              if (!v55) {
                continue;
              }
            }
            id v56 = *v53;
            v57 = [v56 objectForKeyedSubscript:v50];
            [v107 setProperty:v57 forBodyKey:v50];
          }
          id v47 = [v45 countByEnumeratingWithState:&v116 objects:v122 count:16];
        }
        while (v47);
      }

      goto LABEL_93;
    }
  }
LABEL_94:
  if (os_variant_has_internal_content())
  {
    v102 = sub_1003F2DC8();

    if (v102)
    {
      v103 = sub_1003F2DC8();
      sub_1003F6308(v107, v103);
    }
  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Arcade] Remote handle did activate", v4, 2u);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  unsigned int v4 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Arcade] Remote handle did deactivate", v8, 2u);
  }

  if (self)
  {
    sharedSBSRemoteHandle = self->_sharedSBSRemoteHandle;
    if (sharedSBSRemoteHandle)
    {
      [(SBSRemoteAlertHandle *)sharedSBSRemoteHandle unregisterObserver:self];
      v6 = self;
      objc_sync_enter(v6);
      v7 = self->_sharedSBSRemoteHandle;
      self->_sharedSBSRemoteHandle = 0;

      objc_sync_exit(v6);
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_alertSemaphore);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138543362;
    id v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[Arcade] Remote handle did invalidate with error: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if (self)
  {
    sharedSBSRemoteHandle = self->_sharedSBSRemoteHandle;
    if (sharedSBSRemoteHandle)
    {
      [(SBSRemoteAlertHandle *)sharedSBSRemoteHandle unregisterObserver:self];
      dispatch_queue_t v8 = self;
      objc_sync_enter(v8);
      id v9 = self->_sharedSBSRemoteHandle;
      self->_sharedSBSRemoteHandle = 0;

      objc_sync_exit(v8);
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_alertSemaphore);
}

- (void)_handleNetworkStateDidChangeNotification:(id)a3
{
  unsigned int v4 = sub_100259614();
  unsigned int v5 = [v4 isConnected];

  if (v5)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    v7 = sub_100259614();
    [v6 removeObserver:self name:@"NetworkStateDidChangeNotification" object:v7];

    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003840C0;
    block[3] = &unk_100521388;
    void block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_handleRepairBundleIDNotification:(id)a3
{
  id v4 = a3;
  distNotificationQueue = self->_distNotificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100384594;
  block[3] = &unk_100521388;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(distNotificationQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedSBSRemoteHandle, 0);
  objc_storeStrong((id *)&self->_alertSemaphore, 0);
  objc_storeStrong((id *)&self->_upsellQueue, 0);
  objc_storeStrong((id *)&self->_topAppsQueue, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_sbsyncQueue, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_os, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_hardwareFamily, 0);
  objc_storeStrong((id *)&self->_distNotificationQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_cachedSubscribedStateString, 0);
  objc_storeStrong((id *)&self->_cachedSubscribedState, 0);
  objc_storeStrong((id *)&self->_cachedSubscribedAccountID, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
}

@end