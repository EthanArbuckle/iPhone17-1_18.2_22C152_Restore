@interface CKNotificationListener
- (BOOL)hasInitializedAPSConnection;
- (BOOL)isRegisteredForSubscriptionWithID:(id)a3 inDatabase:(id)a4;
- (BOOL)useOpportunisticPushTopics;
- (CKNotificationListener)init;
- (CKNotificationListener)initWithMachServiceName:(id)a3;
- (CKNotificationListener)initWithStrategy:(unint64_t)a3;
- (CKNotificationListener)initWithStrategy:(unint64_t)a3 machServiceName:(id)a4;
- (NSArray)notificationObservers;
- (NSString)description;
- (NSString)machServiceName;
- (OS_dispatch_queue)queue;
- (id)apsConnectionForEnvironment:(id)a3;
- (id)redactedDescription;
- (id)uniqueKeyForSubscriptionID:(id)a3 inDatabase:(id)a4;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)_registerForSubscriptionWithID:(id)a3 inDatabase:(id)a4 handler:(id)a5 completionHandler:(id)a6;
- (void)_unregisterForSubscriptionWithID:(id)a3 inDatabase:(id)a4 completionHandler:(id)a5;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
- (void)didReceiveIncomingPushWithPayload:(id)a3 withCompletionHandler:(id)a4;
- (void)handlePushNotificationWithPayload:(id)a3 completionHandler:(id)a4;
- (void)handlePushNotificationWithPayload:(id)a3 environment:(id)a4 completionHandler:(id)a5;
- (void)registerForSubscriptionWithID:(id)a3 inDatabase:(id)a4 handler:(id)a5;
- (void)setNotificationObservers:(id)a3;
- (void)setUseOpportunisticPushTopics:(BOOL)a3;
- (void)unregisterForSubscriptionWithID:(id)a3 inDatabase:(id)a4;
@end

@implementation CKNotificationListener

- (CKNotificationListener)init
{
  self;
  if (CKCurrentProcessIsDaemon())
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v3 = ck_log_facility_notification_listener;
    if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_debug_impl(&dword_18AF10000, v3, OS_LOG_TYPE_DEBUG, "Not running in an app, so we'll use our own APSConnection", v8, 2u);
    }
    uint64_t v5 = 0;
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v6 = ck_log_facility_notification_listener;
    if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18AF10000, v6, OS_LOG_TYPE_DEBUG, "Running in an app and choosing app strategy", buf, 2u);
    }
    uint64_t v5 = 1;
  }

  return (CKNotificationListener *)MEMORY[0x1F4181798](self, sel_initWithStrategy_, v5, v4);
}

- (CKNotificationListener)initWithStrategy:(unint64_t)a3
{
  return (CKNotificationListener *)MEMORY[0x1F4181798](self, sel_initWithStrategy_machServiceName_, a3, 0);
}

- (CKNotificationListener)initWithMachServiceName:(id)a3
{
  return (CKNotificationListener *)MEMORY[0x1F4181798](self, sel_initWithStrategy_machServiceName_, 0, a3);
}

- (CKNotificationListener)initWithStrategy:(unint64_t)a3 machServiceName:(id)a4
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  v7 = a4;
  v94.receiver = self;
  v94.super_class = (Class)CKNotificationListener;
  v8 = [(CKNotificationListener *)&v94 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.cloudkit.notification-listener", v9);
    isa = v8[1].isa;
    v8[1].isa = v10;

    dispatch_queue_set_specific((dispatch_queue_t)v8[1].isa, &v8[1], (void *)1, 0);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.cloudkit.notification-listener.callback", v12);
    info = (void *)v8[1].info;
    v8[1].info = (uint64_t)v13;

    uint64_t v18 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v15, v16, v17);
    length = (void *)v8->length;
    v8->length = v18;

    uint64_t v23 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v20, v21, v22);
    data = v8[1].data;
    v8[1].data = (char *)v23;

    v8[1].length = a3;
    uint64_t v28 = objc_msgSend_copy(v7, v25, v26, v27);
    v29 = v8->data;
    v8->data = (char *)v28;

    LOBYTE(v8->info) = 0;
    uint64_t v33 = v8[1].length;
    if (v33)
    {
      if (v33 == 1)
      {
        v34 = objc_msgSend_bundleRecordForCurrentProcess(MEMORY[0x1E4F223F8], v30, v31, v32);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v38 = objc_msgSend_sharedManager(CKProcessScopedStateManager, v35, v36, v37);
          v42 = objc_msgSend_untrustedEntitlements(v38, v39, v40, v41);
          v46 = objc_msgSend_apsEnvironmentEntitlement(v42, v43, v44, v45);
          v50 = objc_msgSend_lowercaseString(v46, v47, v48, v49);

          if (v50)
          {
            uint64_t v54 = *MEMORY[0x1E4F4E1D0];
            uint64_t v4 = objc_msgSend_lowercaseString((void *)*MEMORY[0x1E4F4E1D0], v51, v52, v53);
            if (objc_msgSend_isEqualToString_(v50, v55, (uint64_t)v4, v56))
            {
            }
            else
            {
              while (1)
              {
                uint64_t v69 = *MEMORY[0x1E4F4E1C8];
                v70 = objc_msgSend_lowercaseString((void *)*MEMORY[0x1E4F4E1C8], v57, v58, v59);
                char isEqualToString = objc_msgSend_isEqualToString_(v50, v71, (uint64_t)v70, v72);

                if (isEqualToString) {
                  break;
                }
                if (ck_log_initialization_predicate != -1) {
                  dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                }
                v87 = ck_log_facility_ck;
                if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138413058;
                  v96 = @"aps-environment";
                  __int16 v97 = 2112;
                  uint64_t v98 = v54;
                  __int16 v99 = 2112;
                  uint64_t v100 = v69;
                  __int16 v101 = 2112;
                  v102 = v50;
                  _os_log_error_impl(&dword_18AF10000, v87, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF CLOUDKIT: CloudKit push notifications require the '%@' entitlement to be '%@' or '%@'. Current value='%@'", buf, 0x2Au);
                }
                v90 = objc_msgSend_stringWithFormat_(NSString, v88, @"BUG IN CLIENT OF CLOUDKIT: CloudKit push notifications require the '%@' entitlement to be '%@' or '%@'. Current value='%@'", v89, @"aps-environment", v54, v69, v50);
                objc_msgSend_UTF8String(v90, v91, v92, v93);
                _os_crash();
                __break(1u);
LABEL_31:
                dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
LABEL_10:
                v7 = ck_log_facility_ck;
                v8 = @"aps-connection-initiate";
                if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v96 = @"aps-connection-initiate";
                  _os_log_error_impl(&dword_18AF10000, v7, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF CLOUDKIT: Not entitled to listen to push notifications. Please add the '%@' entitlement.", buf, 0xCu);
                }
                v65 = objc_msgSend_stringWithFormat_(NSString, v63, @"BUG IN CLIENT OF CLOUDKIT: Not entitled to listen to push notifications. Please add the '%@' entitlement.", v64, @"aps-connection-initiate");
                objc_msgSend_UTF8String(v65, v66, v67, v68);
                _os_crash();
                __break(1u);
              }
            }
          }
          v74 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v51, v52, v53);
          v78 = objc_msgSend_infoDictionary(v74, v75, v76, v77);
          v81 = objc_msgSend_objectForKeyedSubscript_(v78, v79, @"UIBackgroundModes", v80);

          if ((objc_msgSend_containsObject_(v81, v82, @"remote-notification", v83) & 1) == 0)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            v84 = ck_log_facility_notification_listener;
            if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_18AF10000, v84, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF CLOUDKIT: CloudKit push notifications require the 'remote-notification' background mode in your info plist.", buf, 2u);
            }
          }
        }
      }
    }
    else
    {
      v50 = objc_msgSend_sharedManager(CKProcessScopedStateManager, v30, v31, v32);
      v34 = objc_msgSend_untrustedEntitlements(v50, v60, v61, v62);
      uint64_t v54 = sub_18AF2E5CC(v34);

      if ((v54 & 1) == 0)
      {
        if (ck_log_initialization_predicate == -1) {
          goto LABEL_10;
        }
        goto LABEL_31;
      }
    }
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v85 = ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v96 = v8;
    _os_log_impl(&dword_18AF10000, v85, OS_LOG_TYPE_INFO, "Init notification listener %@", buf, 0xCu);
  }

  return (CKNotificationListener *)v8;
}

- (void)dealloc
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v3 = ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = self;
    _os_log_impl(&dword_18AF10000, v3, OS_LOG_TYPE_INFO, "Dealloc notification listener %@", buf, 0xCu);
  }
  if (self->_strategy == 1)
  {
    v7 = objc_msgSend_sharedPushRegistry(CKPKPushRegistry, v4, v5, v6);
    objc_msgSend_removeDelegate_(v7, v8, (uint64_t)self, v9);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  dispatch_queue_t v10 = objc_msgSend_notificationObservers(self, v4, v5, v6);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v10);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v20 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v13, v14, v15);
        objc_msgSend_removeObserver_(v20, v21, v19, v22);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v16);
  }

  v23.receiver = self;
  v23.super_class = (Class)CKNotificationListener;
  [(CKNotificationListener *)&v23 dealloc];
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v6 = a3;
  if (self) {
    objc_msgSend_numberWithUnsignedInteger_(NSNumber, v4, self->_strategy, v5);
  }
  else {
  v7 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v4, 0, v5);
  }
  objc_msgSend_addProperty_value_shouldRedact_(v6, v8, @"strategy", (uint64_t)v7, 0);

  uint64_t v12 = objc_msgSend_machServiceName(self, v9, v10, v11);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v6, v13, @"machServiceName", (uint64_t)v12, 0);

  uint64_t v17 = objc_msgSend_queue(self, v14, v15, v16);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_18B04E1D4;
  v20[3] = &unk_1E5461F80;
  p_queue = &self->_queue;
  v20[4] = self;
  id v21 = v6;
  id v19 = v6;
  ck_call_or_dispatch_sync_if_not_key(v17, p_queue, v20);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKNotificationListener *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKNotificationListener *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (BOOL)hasInitializedAPSConnection
{
  uint64_t v4 = self;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v5 = objc_msgSend_queue(self, a2, v2, v3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B04E32C;
  v7[3] = &unk_1E5460080;
  v7[4] = v4;
  v7[5] = &v8;
  dispatch_sync(v5, v7);

  LOBYTE(v4) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

- (BOOL)useOpportunisticPushTopics
{
  uint64_t v4 = self;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v5 = objc_msgSend_queue(self, a2, v2, v3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_18B04E470;
  v7[3] = &unk_1E5460080;
  v7[4] = v4;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v5, &v4->_queue, v7);

  LOBYTE(v4) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

- (void)setUseOpportunisticPushTopics:(BOOL)a3
{
  if (self && self->_strategy)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    objc_msgSend_raise_format_(v6, v10, v7, @"Cannot use opportunistic push topics for %@ outside of a daemon.", v9);
  }
  char v11 = objc_msgSend_queue(self, a2, a3, v3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B04E57C;
  block[3] = &unk_1E5461FA8;
  block[4] = self;
  BOOL v13 = a3;
  dispatch_sync(v11, block);
}

- (void)registerForSubscriptionWithID:(id)a3 inDatabase:(id)a4 handler:(id)a5
{
}

- (void)_registerForSubscriptionWithID:(id)a3 inDatabase:(id)a4 handler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = objc_msgSend_container(v11, v14, v15, v16);
  id v72 = 0;
  char v18 = _CKCheckArgument((uint64_t)"database", v11, 0, 0, 0, &v72);
  id v19 = v72;
  id v20 = v19;
  if ((v18 & 1) == 0) {
    goto LABEL_6;
  }

  id v71 = 0;
  char v21 = _CKCheckArgument((uint64_t)"container", v17, 0, 0, 0, &v71);
  id v22 = v71;
  id v20 = v22;
  if ((v21 & 1) == 0) {
    goto LABEL_6;
  }

  id v70 = 0;
  char v23 = _CKCheckArgument((uint64_t)"subscriptionID", v10, 0, 0, 0, &v70);
  id v24 = v70;
  id v20 = v24;
  if ((v23 & 1) == 0
    || (v24,
        long long v25 = _Block_copy(v12),
        id v69 = 0,
        char v26 = _CKCheckArgument((uint64_t)"handler", v25, 0, 0, 0, &v69),
        id v20 = v69,
        v25,
        (v26 & 1) == 0))
  {
LABEL_6:
    uint64_t v44 = [CKException alloc];
    uint64_t v48 = objc_msgSend_code(v20, v45, v46, v47);
    uint64_t v52 = objc_msgSend_localizedDescription(v20, v49, v50, v51);
    id v54 = (id)objc_msgSend_initWithCode_format_(v44, v53, v48, @"%@", v52);

    objc_exception_throw(v54);
  }

  long long v27 = _os_activity_create(&dword_18AF10000, "client/notification-listener-register", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v27, &state);
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = sub_18AF13BB4;
  v66[4] = sub_18AF13870;
  id v67 = 0;
  uint64_t v31 = objc_msgSend_queue(self, v28, v29, v30);
  dispatch_suspend(v31);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = sub_18B04EC90;
  v63[3] = &unk_1E5461FD0;
  v65 = v66;
  uint64_t v32 = v31;
  uint64_t v64 = v32;
  objc_msgSend_pushEnvironmentWithCompletionHandler_(v17, v33, (uint64_t)v63, v34);
  v38 = objc_msgSend_queue(self, v35, v36, v37);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B04ED04;
  block[3] = &unk_1E5461FF8;
  id v56 = v10;
  id v57 = v11;
  uint64_t v58 = self;
  id v59 = v17;
  id v61 = v13;
  uint64_t v62 = v66;
  id v60 = v12;
  id v39 = v13;
  id v40 = v12;
  id v41 = v17;
  id v42 = v11;
  id v43 = v10;
  dispatch_async(v38, block);

  _Block_object_dispose(v66, 8);
  os_activity_scope_leave(&state);
}

- (void)unregisterForSubscriptionWithID:(id)a3 inDatabase:(id)a4
{
}

- (void)_unregisterForSubscriptionWithID:(id)a3 inDatabase:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v42 = 0;
  char v11 = _CKCheckArgument((uint64_t)"database", v9, 0, 0, 0, &v42);
  id v12 = v42;
  id v13 = v12;
  if ((v11 & 1) == 0
    || (v12,
        id v41 = 0,
        char v14 = _CKCheckArgument((uint64_t)"subscriptionID", v8, 0, 0, 0, &v41),
        id v15 = v41,
        id v13 = v15,
        (v14 & 1) == 0))
  {
    id v24 = [CKException alloc];
    uint64_t v28 = objc_msgSend_code(v13, v25, v26, v27);
    uint64_t v32 = objc_msgSend_localizedDescription(v13, v29, v30, v31);
    id v34 = (id)objc_msgSend_initWithCode_format_(v24, v33, v28, @"%@", v32);

    objc_exception_throw(v34);
  }

  uint64_t v16 = _os_activity_create(&dword_18AF10000, "client/notification-listener-unregister", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  id v20 = objc_msgSend_queue(self, v17, v18, v19);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B04F21C;
  block[3] = &unk_1E5462020;
  id v36 = v8;
  id v37 = v9;
  v38 = self;
  id v39 = v10;
  id v21 = v10;
  id v22 = v9;
  id v23 = v8;
  dispatch_async(v20, block);

  os_activity_scope_leave(&state);
}

- (BOOL)isRegisteredForSubscriptionWithID:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  char v11 = objc_msgSend_queue(self, v8, v9, v10);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B04F488;
  v15[3] = &unk_1E5462048;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  uint64_t v18 = &v19;
  id v12 = v7;
  id v13 = v6;
  dispatch_sync(v11, v15);

  LOBYTE(v7) = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return (char)v7;
}

- (id)uniqueKeyForSubscriptionID:(id)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_container(v5, v7, v8, v9);
  char v14 = objc_msgSend_containerIdentifier(v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_containerID(v10, v15, v16, v17);
  uint64_t v22 = objc_msgSend_environment(v18, v19, v20, v21);

  id v23 = NSString;
  uint64_t v27 = objc_msgSend_databaseScope(v5, v24, v25, v26);

  uint64_t v30 = objc_msgSend_stringWithFormat_(v23, v28, @"%@-%d-%d-%@", v29, v14, v22, v27, v6);

  id v34 = objc_msgSend_options(v10, v31, v32, v33);
  v38 = objc_msgSend_accountOverrideInfo(v34, v35, v36, v37);

  id v42 = objc_msgSend_email(v38, v39, v40, v41);

  if (v42)
  {
    uint64_t v46 = objc_msgSend_email(v38, v43, v44, v45);
  }
  else
  {
    uint64_t v49 = objc_msgSend_accountID(v38, v43, v44, v45);

    if (v49)
    {
      uint64_t v46 = objc_msgSend_accountID(v38, v50, v51, v52);
    }
    else
    {
      uint64_t v53 = objc_msgSend_altDSID(v38, v50, v51, v52);

      if (!v53) {
        goto LABEL_9;
      }
      uint64_t v46 = objc_msgSend_altDSID(v38, v54, v55, v56);
    }
  }
  id v57 = (void *)v46;
  if (v46)
  {
    uint64_t v58 = objc_msgSend_stringByAppendingFormat_(v30, v47, @"-%@", v48, v46);

    uint64_t v30 = (void *)v58;
  }
LABEL_9:

  return v30;
}

- (id)apsConnectionForEnvironment:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_18AF13BB4;
  uint64_t v19 = sub_18AF13870;
  id v20 = 0;
  uint64_t v8 = objc_msgSend_queue(self, v5, v6, v7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B04F7F8;
  block[3] = &unk_1E5462070;
  id v13 = v4;
  char v14 = &v15;
  void block[4] = self;
  id v9 = v4;
  dispatch_sync(v8, block);

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v7 = ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138543362;
    id v9 = v6;
    _os_log_debug_impl(&dword_18AF10000, v7, OS_LOG_TYPE_DEBUG, "APS connection received public token: %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  int v8 = (void *)ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = v8;
    id v23 = objc_msgSend_topic(v7, v20, v21, v22);
    objc_msgSend_userInfo(v7, v24, v25, v26);
    uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2112;
    v35 = v27;
    _os_log_debug_impl(&dword_18AF10000, v19, OS_LOG_TYPE_DEBUG, "%p APS connection received incoming message on topic %@: %@", buf, 0x20u);
  }
  uint64_t v12 = objc_msgSend_userInfo(v7, v9, v10, v11);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v35 = sub_18AF13BB4;
  uint64_t v36 = sub_18AF13870;
  id v37 = (id)*MEMORY[0x1E4F4E1D0];
  if (self) {
    apsConnections = self->_apsConnections;
  }
  else {
    apsConnections = 0;
  }
  char v14 = apsConnections;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  uint64_t v30 = sub_18B05080C;
  uint64_t v31 = &unk_1E5462110;
  id v15 = v6;
  id v32 = v15;
  uint64_t v33 = buf;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v14, v16, (uint64_t)&v28, v17);

  objc_msgSend_handlePushNotificationWithPayload_environment_completionHandler_(self, v18, (uint64_t)v12, *(void *)(*(void *)&buf[8] + 40), 0, v28, v29, v30, v31);
  _Block_object_dispose(buf, 8);
}

- (void)handlePushNotificationWithPayload:(id)a3 completionHandler:(id)a4
{
}

- (void)handlePushNotificationWithPayload:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)os_transaction_create();
  id v15 = objc_msgSend_queue(self, v12, v13, v14);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_18B0509D4;
  v21[3] = &unk_1E54621D8;
  p_queue = &self->_queue;
  id v22 = v8;
  id v23 = self;
  id v24 = v9;
  id v25 = v11;
  id v26 = v10;
  id v17 = v10;
  id v18 = v11;
  id v19 = v9;
  id v20 = v8;
  ck_call_or_dispatch_async_if_not_key(v15, p_queue, v21);
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v6 = ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_debug_impl(&dword_18AF10000, v6, OS_LOG_TYPE_DEBUG, "APS connection status changed to connected=%d", (uint8_t *)v7, 8u);
  }
}

- (void)connectionDidReconnect:(id)a3
{
  id v3 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  BOOL v4 = ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_debug_impl(&dword_18AF10000, v4, OS_LOG_TYPE_DEBUG, "APS connection did reconnect", v5, 2u);
  }
}

- (void)didReceiveIncomingPushWithPayload:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v8 = ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_18AF10000, v8, OS_LOG_TYPE_DEFAULT, "%@ received push with payload %@", buf, 0x16u);
  }
  uint64_t v12 = objc_msgSend_dictionaryPayload(v6, v9, v10, v11);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B051B0C;
  v15[3] = &unk_1E5462200;
  id v16 = v7;
  id v13 = v7;
  objc_msgSend_handlePushNotificationWithPayload_completionHandler_(self, v14, (uint64_t)v12, (uint64_t)v15);
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSArray)notificationObservers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNotificationObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_apsConnections, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_subscriptionInfos, 0);

  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end