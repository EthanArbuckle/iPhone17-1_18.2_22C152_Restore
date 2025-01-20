@interface IMDowntimeController
+ (BOOL)isContactLimitsFeatureEnabled;
+ (id)fetchEmergencyNumbersSetWithProviderManager:(id)a3;
+ (id)sharedInstance;
- (BOOL)_allowedToShowConversationWithHandleIDs:(id)a3 sync:(BOOL)a4 context:(id *)a5 participantIDsHash:(id)a6 trackingChat:(id)a7;
- (BOOL)allowedToShowAppExtensionWithBundleIdentifier:(id)a3;
- (BOOL)allowedToShowConversationForChat:(id)a3 sync:(BOOL)a4;
- (BOOL)allowedToShowConversationWithHandleIDs:(id)a3 sync:(BOOL)a4 context:(id *)a5;
- (BOOL)allowedToShowConversationWithHandleIDs:(id)a3 sync:(BOOL)a4 context:(id *)a5 participantIDsHash:(id)a6;
- (BOOL)isDowntimeLimited;
- (BOOL)isEmergencyHandle:(id)a3;
- (BOOL)isRunningFromMacMessagesApp;
- (DMFApplicationPolicyMonitor)appPolicyMonitor;
- (IMCommLimitsPolicyCache)policyCache;
- (IMDowntimeController)init;
- (NSMutableDictionary)bundleIDPolicyMap;
- (OS_dispatch_queue)screenTimeDispatchQueue;
- (OS_dispatch_queue)setupDispatchQueue;
- (TUCallProviderManager)callProviderManager;
- (id)STConversation;
- (id)conversationContextForChat:(id)a3;
- (id)emergencyNumbers;
- (void)_addObserversToChat:(id)a3;
- (void)_doRegisterForScreenTimeNotifications;
- (void)_participantsForChatDidChange:(id)a3;
- (void)fetchScreenTimeAppPolicy;
- (void)getSTConversation:(id)a3;
- (void)initializeContext:(id)a3 participantIDsHash:(id)a4 trackingChat:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)providersChangedForProviderManager:(id)a3;
- (void)registerForScreenTimeNotifications;
- (void)setAppPolicyMonitor:(id)a3;
- (void)setBundleIDPolicyMap:(id)a3;
- (void)setCallProviderManager:(id)a3;
- (void)setEmergencyNumbers:(id)a3;
- (void)setIsRunningFromMacMessagesApp:(BOOL)a3;
- (void)setPolicyCache:(id)a3;
- (void)setScreenTimeDispatchQueue:(id)a3;
- (void)setSetupDispatchQueue:(id)a3;
@end

@implementation IMDowntimeController

- (void)_doRegisterForScreenTimeNotifications
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = qword_1EB3F2248;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "Registering for screentime state change notification %s", buf, 0xCu);
    }
  }
  v4 = (const char *)qword_1EB3F2248;
  if (!qword_1EB3F2248)
  {
    *(_OWORD *)buf = xmmword_1E5B7DE98;
    long long v19 = *(_OWORD *)off_1E5B7DEA8;
    uint64_t v20 = 635;
    v5 = NSString;
    uint64_t v6 = IMFileLocationTrimFileName();
    uint64_t v7 = v20;
    v10 = objc_msgSend_stringWithFormat_(NSString, v8, (uint64_t)&stru_1EF8E78C8, v9);
    v13 = objc_msgSend_stringWithFormat_(v5, v11, @"Unexpected nil '%@' in %s at %s:%d. %@", v12, @"IMSTManagementStateStateDidChangeNotificationName", "-[IMDowntimeController _doRegisterForScreenTimeNotifications]", v6, v7, v10);

    v14 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v14)
    {
      v14(v13);
    }
    else if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v16 = 138412290;
        v17 = v13;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", v16, 0xCu);
      }
    }
    v4 = (const char *)qword_1EB3F2248;
  }
  self->_needsNotificationsRegistering = 0;
  *(_DWORD *)buf = 0;
  notify_register_dispatch(v4, (int *)buf, MEMORY[0x1E4F14428], &unk_1EF8E5AB8);
}

- (void)registerForScreenTimeNotifications
{
  if (objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, a2, v2, v3))
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1A4B34A44;
    v12[3] = &unk_1E5B7DE78;
    v12[4] = self;
    v12[5] = &v13;
    objc_msgSend_getSTConversation_(self, v5, (uint64_t)v12, v6);
    if (*((unsigned char *)v14 + 24))
    {
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Delaying registering for screentime state change notification as setup is not finished.", v11, 2u);
        }
      }
    }
    else
    {
      objc_msgSend__doRegisterForScreenTimeNotifications(self, v7, v8, v9);
    }
    _Block_object_dispose(&v13, 8);
  }
}

- (void)setEmergencyNumbers:(id)a3
{
  v4 = (NSSet *)a3;
  os_unfair_lock_lock(&self->_stateLock);
  stateLock_emergencyNumbersSet = self->_stateLock_emergencyNumbersSet;
  self->_stateLock_emergencyNumbersSet = v4;

  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)providersChangedForProviderManager:(id)a3
{
  if (objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, a2, (uint64_t)a3, v3))
  {
    v5 = objc_opt_class();
    uint64_t v9 = objc_msgSend_callProviderManager(self, v6, v7, v8);
    objc_msgSend_fetchEmergencyNumbersSetWithProviderManager_(v5, v10, (uint64_t)v9, v11);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setEmergencyNumbers_(self, v12, (uint64_t)v14, v13);
  }
}

+ (id)fetchEmergencyNumbersSetWithProviderManager:(id)a3
{
  v4 = objc_msgSend_emergencyProvider(a3, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_emergencyHandles(v4, v5, v6, v7);
  uint64_t v11 = objc_msgSend___imArrayByApplyingBlock_(v8, v9, (uint64_t)&unk_1EF8E3C50, v10);

  id v14 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v12, (uint64_t)v11, v13);

  return v14;
}

- (IMDowntimeController)init
{
  v43.receiver = self;
  v43.super_class = (Class)IMDowntimeController;
  uint64_t v2 = [(IMDowntimeController *)&v43 init];
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Setting up screentime downtime controller", buf, 2u);
      }
    }
    if (objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, v3, v4, v5))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Contact Limits Feature Active", buf, 2u);
        }
      }
      v2->_stateLock._os_unfair_lock_opaque = 0;
      uint64_t v11 = objc_opt_new();
      objc_msgSend_setPolicyCache_(v2, v12, (uint64_t)v11, v13);

      dispatch_queue_t v14 = dispatch_queue_create("com.apple.messages.private.IMDowntimeController", 0);
      screenTimeDispatchQueue = v2->_screenTimeDispatchQueue;
      v2->_screenTimeDispatchQueue = (OS_dispatch_queue *)v14;

      dispatch_queue_t v16 = dispatch_queue_create("com.apple.messages.private.IMDowntimeController.setup", 0);
      setupDispatchQueue = v2->_setupDispatchQueue;
      v2->_setupDispatchQueue = (OS_dispatch_queue *)v16;

      v18 = (TUCallProviderManager *)objc_alloc_init(MEMORY[0x1E4FADAB0]);
      callProviderManager = v2->_callProviderManager;
      v2->_callProviderManager = v18;

      objc_msgSend_addDelegate_queue_(v2->_callProviderManager, v20, (uint64_t)v2, MEMORY[0x1E4F14428]);
      uint64_t v21 = v2->_setupDispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A4B00DA0;
      block[3] = &unk_1E5B7ACD0;
      v42 = v2;
      dispatch_async(v21, block);
    }
    uint64_t v22 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
    bundleIDPolicyMap = v2->_bundleIDPolicyMap;
    v2->_bundleIDPolicyMap = (NSMutableDictionary *)v22;

    *(void *)buf = 0;
    objc_initWeak((id *)buf, v2);
    v24 = dispatch_get_global_queue(-2, 0);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = sub_1A4AFE43C;
    v38[3] = &unk_1E5B7ADC8;
    objc_copyWeak(&v39, (id *)buf);
    dispatch_async(v24, v38);

    v28 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v25, v26, v27);
    v32 = objc_msgSend_mainQueue(MEMORY[0x1E4F28F08], v29, v30, v31);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_1A4B0709C;
    v36[3] = &unk_1E5B7B108;
    objc_copyWeak(&v37, (id *)buf);
    id v34 = (id)objc_msgSend_addObserverForName_object_queue_usingBlock_(v28, v33, @"__kIMBalloonPluginManagerInstalledAppsChangedNotification", 0, v32, v36);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (void)fetchScreenTimeAppPolicy
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_sharedInstance(IMBalloonPluginManager, a2, v2, v3);
  uint64_t v6 = objc_opt_new();
  uint64_t v10 = objc_msgSend_allPlugins(v5, v7, v8, v9);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1A4B2B510;
  v28[3] = &unk_1E5B7DEE8;
  id v11 = v6;
  id v29 = v11;
  objc_msgSend_enumerateObjectsUsingBlock_(v10, v12, (uint64_t)v28, v13);

  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v11;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Fetching application downtime policies for bundleIDs: %@", buf, 0xCu);
    }
  }
  v18 = objc_msgSend_appPolicyMonitor(self, v14, v15, v16);
  uint64_t v22 = objc_msgSend_allObjects(v11, v19, v20, v21);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1A4BFC804;
  v25[3] = &unk_1E5B7DF10;
  id v26 = v11;
  uint64_t v27 = self;
  id v23 = v11;
  objc_msgSend_requestPoliciesForBundleIdentifiers_completionHandler_(v18, v24, (uint64_t)v22, (uint64_t)v25);
}

- (DMFApplicationPolicyMonitor)appPolicyMonitor
{
  return self->_appPolicyMonitor;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v13 = a4;
  if ((void *)qword_1E965C428 == a6)
  {
    if (objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, v10, v11, v12))
    {
      id v14 = v13;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_1A4B147B0;
      v15[3] = &unk_1E5B7B130;
      v15[4] = self;
      id v16 = v14;
      dispatch_async(MEMORY[0x1E4F14428], v15);
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)IMDowntimeController;
    [(IMDowntimeController *)&v17 observeValueForKeyPath:a3 ofObject:v13 change:a5 context:a6];
  }
}

- (BOOL)_allowedToShowConversationWithHandleIDs:(id)a3 sync:(BOOL)a4 context:(id *)a5 participantIDsHash:(id)a6 trackingChat:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, v15, v16, v17))
  {
    v58 = a5;
    if (v13)
    {
      id v21 = v13;
    }
    else
    {
      IMHashOfHashesForStringArray(v12, v18, v19, v20);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v23 = v21;
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x3032000000;
    v77 = sub_1A4B3455C;
    v78 = sub_1A4B34394;
    id v79 = 0;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    char v73 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A4B1497C;
    aBlock[3] = &unk_1E5B7DE50;
    id v63 = v12;
    id v59 = v23;
    id v64 = v59;
    v65 = self;
    v67 = &v70;
    v68 = &v74;
    BOOL v69 = v10;
    id v24 = v14;
    id v66 = v24;
    v25 = (uint64_t (**)(void *, void *, uint64_t))_Block_copy(aBlock);
    id v29 = objc_msgSend_emergencyNumbers(self, v26, v27, v28);
    uint64_t v33 = objc_msgSend_STConversation(self, v30, v31, v32);
    id v37 = (void *)v33;
    if (v29 && v33)
    {
      char v22 = v25[2](v25, v29, v33);
    }
    else
    {
      if (v10)
      {
        dispatch_sync((dispatch_queue_t)self->_setupDispatchQueue, &unk_1EF8E3C70);
        v44 = objc_msgSend_emergencyNumbers(self, v41, v42, v43);
        v48 = objc_msgSend_STConversation(self, v45, v46, v47);
        char v22 = v25[2](v25, v44, (uint64_t)v48);
      }
      else
      {
        v49 = objc_msgSend_policyCache(self, v34, v35, v36);
        objc_msgSend_addSentinelContextForParticipantIDsHash_(v49, v50, (uint64_t)v59, v51);

        setupDispatchQueue = self->_setupDispatchQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1A4AFB1D8;
        block[3] = &unk_1E5B7B220;
        void block[4] = self;
        v61 = v25;
        dispatch_async(setupDispatchQueue, block);
        char v22 = 1;
        v44 = v61;
      }
    }
    if (v58) {
      id *v58 = (id) v75[5];
    }
    if (v24)
    {
      if (*((unsigned char *)v71 + 24))
      {
        v53 = (void *)v75[5];
        if (v53)
        {
          uint64_t v54 = objc_msgSend_allowedByScreenTime(v53, v38, v39, v40);
          objc_msgSend_setAllowedByScreenTime_(v24, v55, v54, v56);
        }
      }
    }

    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v74, 8);
  }
  else
  {
    char v22 = 1;
  }

  return v22;
}

- (void)initializeContext:(id)a3 participantIDsHash:(id)a4 trackingChat:(id)a5
{
  id v22 = a3;
  id v8 = a5;
  id v9 = a4;
  id v13 = objc_msgSend_policyCache(self, v10, v11, v12);
  objc_msgSend_addTrackingForConversationContext_forParticipantIDsHash_(v13, v14, (uint64_t)v22, (uint64_t)v9);

  objc_msgSend_addObserver_forKeyPath_options_context_(v22, v15, (uint64_t)self, @"allowedByScreenTime", 5, qword_1E965C428);
  if (v8)
  {
    uint64_t v19 = objc_msgSend_allowedByScreenTime(v22, v16, v17, v18);
    objc_msgSend_setAllowedByScreenTime_(v8, v20, v19, v21);
  }
}

- (BOOL)allowedToShowConversationForChat:(id)a3 sync:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int isContactLimitsFeatureEnabled = objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, v7, v8, v9);
  LOBYTE(v14) = 1;
  if (v6 && isContactLimitsFeatureEnabled)
  {
    uint64_t v15 = objc_msgSend_participants(v6, v11, v12, v13);
    uint64_t v19 = objc_msgSend_count(v15, v16, v17, v18);

    if (v19
      && (v4
       || (objc_msgSend_policyCache(self, v20, v21, v22),
           id v23 = objc_claimAutoreleasedReturnValue(),
           char isFetchingCommLimitsPolicyForChat = objc_msgSend_isFetchingCommLimitsPolicyForChat_(v23, v24, (uint64_t)v6, v25), v23, (isFetchingCommLimitsPolicyForChat & 1) == 0)))
    {
      uint64_t v27 = objc_msgSend_policyCache(self, v20, v21, v22);
      uint64_t v30 = objc_msgSend_conversationContextForChat_(v27, v28, (uint64_t)v6, v29);

      if (v30)
      {
        LOBYTE(v14) = objc_msgSend_allowedByScreenTime(v30, v31, v32, v33);
      }
      else
      {
        id v34 = objc_msgSend_participantHandleIDs(v6, v31, v32, v33);
        v38 = IMHashOfHashesForStringArray(v34, v35, v36, v37);

        uint64_t v42 = objc_msgSend_policyCache(self, v39, v40, v41);
        objc_msgSend_addTrackingForChat_participantIDsHash_(v42, v43, (uint64_t)v6, (uint64_t)v38);

        objc_msgSend__addObserversToChat_(self, v44, (uint64_t)v6, v45);
        v49 = objc_msgSend_participantHandleIDs(v6, v46, v47, v48);
        int v14 = objc_msgSend__allowedToShowConversationWithHandleIDs_sync_context_participantIDsHash_trackingChat_(self, v50, (uint64_t)v49, v4, 0, v38, v6);

        if (IMOSLoggingEnabled())
        {
          uint64_t v51 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            v52 = @"NO";
            int v54 = 138412802;
            id v55 = v6;
            __int16 v56 = 2112;
            if (v14) {
              v52 = @"YES";
            }
            v57 = v52;
            __int16 v58 = 2112;
            id v59 = v38;
            _os_log_impl(&dword_1A4AF7000, v51, OS_LOG_TYPE_INFO, "Subscribed to Comm Limit policy for chat: %@ allowed: %@ participantIDsHash: %@", (uint8_t *)&v54, 0x20u);
          }
        }
      }
    }
    else
    {
      LOBYTE(v14) = 1;
    }
  }

  return v14;
}

+ (BOOL)isContactLimitsFeatureEnabled
{
  return 1;
}

- (IMCommLimitsPolicyCache)policyCache
{
  return self->_policyCache;
}

+ (id)sharedInstance
{
  if (qword_1EB3F24D8 != -1) {
    dispatch_once(&qword_1EB3F24D8, &unk_1EF8E5A38);
  }
  uint64_t v2 = (void *)qword_1EB3F2538;

  return v2;
}

- (OS_dispatch_queue)screenTimeDispatchQueue
{
  return self->_screenTimeDispatchQueue;
}

- (id)emergencyNumbers
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  BOOL v4 = self->_stateLock_emergencyNumbersSet;
  os_unfair_lock_unlock(p_stateLock);

  return v4;
}

- (void)_addObserversToChat:(id)a3
{
  if (a3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F28EB8];
    id v5 = a3;
    objc_msgSend_defaultCenter(v4, v6, v7, v8);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObserver_name_object_(v11, v9, (uint64_t)self, @"__kIMChatParticipantsDidChangeNotification", v5);
    objc_msgSend_addObserver_selector_name_object_(v11, v10, (uint64_t)self, (uint64_t)sel__participantsForChatDidChange_, @"__kIMChatParticipantsDidChangeNotification", v5);
  }
}

- (id)STConversation
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1A4B3455C;
  BOOL v10 = sub_1A4B34394;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A4B15788;
  v5[3] = &unk_1E5B7DDD8;
  v5[4] = &v6;
  objc_msgSend_getSTConversation_(self, a2, (uint64_t)v5, v2);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)getSTConversation:(id)a3
{
  p_stateLock = &self->_stateLock;
  id v5 = (void (**)(id, STConversation *))a3;
  os_unfair_lock_lock(p_stateLock);
  v5[2](v5, self->_stateLock_STConversation);

  os_unfair_lock_unlock(p_stateLock);
}

- (void)setPolicyCache:(id)a3
{
}

- (void)setAppPolicyMonitor:(id)a3
{
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (BOOL)allowedToShowConversationWithHandleIDs:(id)a3 sync:(BOOL)a4 context:(id *)a5
{
  return MEMORY[0x1F4181798](self, sel_allowedToShowConversationWithHandleIDs_sync_context_participantIDsHash_, a3, a4);
}

- (BOOL)allowedToShowConversationWithHandleIDs:(id)a3 sync:(BOOL)a4 context:(id *)a5 participantIDsHash:(id)a6
{
  return objc_msgSend__allowedToShowConversationWithHandleIDs_sync_context_participantIDsHash_trackingChat_(self, a2, (uint64_t)a3, a4, a5, a6, 0);
}

- (BOOL)isDowntimeLimited
{
  id v5 = IMHashOfHashesForStringArray(&unk_1EF9146B0, a2, v2, v3);
  uint64_t v9 = objc_msgSend_policyCache(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_contextForParticipantIDsHash_(v9, v10, (uint64_t)v5, v11);

  if (!v12
    || (objc_msgSend_null(MEMORY[0x1E4F1CA98], v13, v14, v15),
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v12 == v16))
  {
    id v21 = objc_alloc((Class)qword_1EB3F2238);
    id v24 = objc_msgSend_initWithBundleIdentifier_(v21, v22, @"com.apple.MobileSMS", v23);
    uint64_t v27 = objc_msgSend_allowableByContactsHandles_(v24, v25, (uint64_t)&unk_1EF9146B0, v26);
    objc_msgSend_initializeContext_participantIDsHash_trackingChat_(self, v28, (uint64_t)v27, (uint64_t)v5, 0);
    char v20 = objc_msgSend_applicationCurrentlyLimited(v27, v29, v30, v31);
  }
  else
  {
    char v20 = objc_msgSend_applicationCurrentlyLimited(v12, v17, v18, v19);
  }

  return v20;
}

- (BOOL)isEmergencyHandle:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  uint64_t v9 = objc_msgSend_whitespaceAndNewlineCharacterSet(v4, v6, v7, v8);
  uint64_t v12 = objc_msgSend_stringByTrimmingCharactersInSet_(v5, v10, (uint64_t)v9, v11);

  uint64_t v16 = objc_msgSend_controlCharacterSet(MEMORY[0x1E4F28B88], v13, v14, v15);
  uint64_t v19 = objc_msgSend_stringByTrimmingCharactersInSet_(v12, v17, (uint64_t)v16, v18);

  uint64_t v23 = objc_msgSend_emergencyNumbers(self, v20, v21, v22);
  LOBYTE(v16) = objc_msgSend_containsObject_(v23, v24, (uint64_t)v19, v25);

  return (char)v16;
}

- (void)_participantsForChatDidChange:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, v5, v6, v7))
  {
    uint64_t v13 = objc_msgSend_object(v4, v8, v9, v10);
    if (v13)
    {
      uint64_t v14 = objc_msgSend_conversationContextForChat_(self, v11, (uint64_t)v13, v12);
      uint64_t v18 = objc_msgSend_policyCache(self, v15, v16, v17);
      objc_msgSend_removeTrackingForChat_(v18, v19, (uint64_t)v13, v20);

      objc_msgSend_removeObserver_forKeyPath_context_(v14, v21, (uint64_t)self, @"allowedByScreenTime", qword_1E965C428);
      objc_msgSend_allowedToShowConversationForChat_sync_(self, v22, (uint64_t)v13, 0);
    }
    else
    {
      uint64_t v23 = IMLogHandleForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB8F00((uint64_t)v4, v23);
      }
    }
  }
}

- (id)conversationContextForChat:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_policyCache(self, v8, v9, v10);
    uint64_t v14 = objc_msgSend_conversationContextForChat_(v11, v12, (uint64_t)v4, v13);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)allowedToShowAppExtensionWithBundleIdentifier:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v4 = a3;
  uint64_t v8 = objc_msgSend_bundleIDPolicyMap(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10);

  if (v11) {
    BOOL v15 = objc_msgSend_integerValue(v11, v12, v13, v14) == 0;
  }
  else {
    BOOL v15 = 1;
  }

  return v15;
}

- (void)setCallProviderManager:(id)a3
{
}

- (void)setScreenTimeDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)setupDispatchQueue
{
  return self->_setupDispatchQueue;
}

- (void)setSetupDispatchQueue:(id)a3
{
}

- (NSMutableDictionary)bundleIDPolicyMap
{
  return self->_bundleIDPolicyMap;
}

- (void)setBundleIDPolicyMap:(id)a3
{
}

- (BOOL)isRunningFromMacMessagesApp
{
  return self->_isRunningFromMacMessagesApp;
}

- (void)setIsRunningFromMacMessagesApp:(BOOL)a3
{
  self->_isRunningFromMacMessagesApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_bundleIDPolicyMap, 0);
  objc_storeStrong((id *)&self->_policyCache, 0);
  objc_storeStrong((id *)&self->_setupDispatchQueue, 0);
  objc_storeStrong((id *)&self->_screenTimeDispatchQueue, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_stateLock_emergencyNumbersSet, 0);

  objc_storeStrong((id *)&self->_stateLock_STConversation, 0);
}

@end