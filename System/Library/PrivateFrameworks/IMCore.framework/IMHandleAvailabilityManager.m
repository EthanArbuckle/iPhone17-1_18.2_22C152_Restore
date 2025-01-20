@interface IMHandleAvailabilityManager
+ (id)sharedInstance;
- (IMHandleAvailabilityManager)init;
- (NSMutableDictionary)currentSubscriptionCache;
- (NSMutableDictionary)lastKnownSubscriptionCache;
- (NSMutableSet)pendingFetchesForCacheKeys;
- (OS_dispatch_queue)privateWorkQueue;
- (SKStatusSubscriptionService)subscriptionService;
- (id)_cachedStatusSubscriptionForIMHandle:(id)a3 fromCache:(id)a4 cacheDescription:(id)a5 cacheMiss:(BOOL *)a6;
- (id)_skHandleForIMHandle:(id)a3;
- (id)_skHandleForString:(id)a3;
- (id)_subscriptionCacheKeyForHandle:(id)a3;
- (id)availabilityStatusPublishedDateForHandle:(id)a3;
- (id)statusSubscriptionForHandle:(id)a3;
- (int64_t)_availablityFromStatusSubscription:(id)a3 handleID:(id)a4;
- (int64_t)availabilityForHandle:(id)a3;
- (int64_t)currentCacheGeneration;
- (void)_clearCurrentSubscriptionCache;
- (void)_postNotificationForUpdatedStatusWithSubscription:(id)a3;
- (void)beginObservingAvailabilityForHandle:(id)a3;
- (void)endObservingAvailabilityForHandle:(id)a3;
- (void)fetchPersonalAvailabilityWithCompletion:(id)a3;
- (void)fetchUpdatedStatusAndUpdateCachesForHandle:(id)a3 lastKnownStatus:(id)a4;
- (void)fetchUpdatedStatusForHandle:(id)a3 completion:(id)a4;
- (void)setCurrentCacheGeneration:(int64_t)a3;
- (void)setCurrentSubscriptionCache:(id)a3;
- (void)setLastKnownSubscriptionCache:(id)a3;
- (void)setPendingFetchesForCacheKeys:(id)a3;
- (void)setPrivateWorkQueue:(id)a3;
- (void)setSubscriptionService:(id)a3;
- (void)subscriptionInvitationReceived:(id)a3;
- (void)subscriptionReceivedStatusUpdate:(id)a3;
- (void)subscriptionServiceDaemonDisconnected:(id)a3;
- (void)subscriptionStateChanged:(id)a3;
@end

@implementation IMHandleAvailabilityManager

+ (id)sharedInstance
{
  if (qword_1EB3F2468 != -1) {
    dispatch_once(&qword_1EB3F2468, &unk_1EF8E58D8);
  }
  v2 = (void *)qword_1EB3F2488;

  return v2;
}

- (IMHandleAvailabilityManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)IMHandleAvailabilityManager;
  v2 = [(IMHandleAvailabilityManager *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    currentSubscriptionCache = v2->_currentSubscriptionCache;
    v2->_currentSubscriptionCache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lastKnownSubscriptionCache = v2->_lastKnownSubscriptionCache;
    v2->_lastKnownSubscriptionCache = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingFetchesForCacheKeys = v2->_pendingFetchesForCacheKeys;
    v2->_pendingFetchesForCacheKeys = v7;

    v2->_currentCacheGeneration = 0;
    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.Messages.IMHandleAvailabilityManager", v9);
    privateWorkQueue = v2->_privateWorkQueue;
    v2->_privateWorkQueue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

- (id)availabilityStatusPublishedDateForHandle:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_statusSubscriptionForHandle_(self, v5, (uint64_t)v4, v6);
  v11 = v7;
  if (v7)
  {
    v12 = objc_msgSend_currentStatus(v7, v8, v9, v10);
    v16 = v12;
    if (v12)
    {
      v17 = objc_msgSend_datePublished(v12, v13, v14, v15);
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v22 = 138412290;
          v23 = v17;
          _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Determined status was published on: %@", (uint8_t *)&v22, 0xCu);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v22 = 138412290;
          v23 = v11;
          _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Subscription has no published status, returning nil status creation date. Subscription: %@", (uint8_t *)&v22, 0xCu);
        }
      }
      v17 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Subscription cache miss, returning nil for sync call for status creation date", (uint8_t *)&v22, 2u);
      }
    }
    v17 = 0;
  }

  return v17;
}

- (int64_t)availabilityForHandle:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_ID(v4, v5, v6, v7);
  v11 = objc_msgSend_statusSubscriptionForHandle_(self, v9, (uint64_t)v4, v10);

  int64_t v13 = objc_msgSend__availablityFromStatusSubscription_handleID_(self, v12, (uint64_t)v11, (uint64_t)v8);
  return v13;
}

- (id)statusSubscriptionForHandle:(id)a3
{
  id v4 = a3;
  char v19 = 0;
  v8 = objc_msgSend_currentSubscriptionCache(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend__cachedStatusSubscriptionForIMHandle_fromCache_cacheDescription_cacheMiss_(self, v9, (uint64_t)v4, (uint64_t)v8, @"Current", &v19);

  if (v19)
  {
    uint64_t v14 = objc_msgSend_lastKnownSubscriptionCache(self, v11, v12, v13);
    uint64_t v16 = objc_msgSend__cachedStatusSubscriptionForIMHandle_fromCache_cacheDescription_cacheMiss_(self, v15, (uint64_t)v4, (uint64_t)v14, @"LastKnown", 0);

    objc_msgSend_fetchUpdatedStatusAndUpdateCachesForHandle_lastKnownStatus_(self, v17, (uint64_t)v4, v16);
    uint64_t v10 = (void *)v16;
  }

  return v10;
}

- (void)fetchUpdatedStatusAndUpdateCachesForHandle:(id)a3 lastKnownStatus:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v11 = objc_msgSend_currentStatus(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_statusUniqueIdentifier(v11, v12, v13, v14);

  v18 = objc_msgSend__subscriptionCacheKeyForHandle_(self, v16, (uint64_t)v6, v17);
  char v19 = self->_pendingFetchesForCacheKeys;
  objc_sync_enter(v19);
  if (objc_msgSend_containsObject_(self->_pendingFetchesForCacheKeys, v20, (uint64_t)v18, v21))
  {
    objc_sync_exit(v19);

    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v18;
        _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "We already have a pending subscription fetch for cache key: \"%@\". That fetch will notify if the subscription has changed. Taking no further action.", buf, 0xCu);
      }
    }
  }
  else
  {
    objc_msgSend_addObject_(self->_pendingFetchesForCacheKeys, v22, (uint64_t)v18, v23);
    objc_sync_exit(v19);

    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v18;
        _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "We do not have any pending fetches for cache key: \"%@\"", buf, 0xCu);
      }
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v29 = objc_msgSend_ID(v6, v26, v27, v28);
    v33 = objc_msgSend_currentCacheGeneration(self, v30, v31, v32);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_1A4C6A5D8;
    v36[3] = &unk_1E5B7F2E8;
    objc_copyWeak(v40, (id *)buf);
    v40[1] = v33;
    id v37 = v18;
    id v34 = v29;
    id v38 = v34;
    id v39 = v15;
    objc_msgSend_fetchUpdatedStatusForHandle_completion_(self, v35, (uint64_t)v6, (uint64_t)v36);

    objc_destroyWeak(v40);
    objc_destroyWeak((id *)buf);
  }
}

- (void)fetchUpdatedStatusForHandle:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (objc_msgSend_isInAppleStoreDemoMode(MEMORY[0x1E4F6E5D0], v8, v9, v10))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Not fetching subscription in Apple Store Demo mode.", buf, 2u);
      }
    }
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v15 = objc_msgSend_subscriptionService(self, v11, v12, v13);
    char v19 = objc_msgSend_ID(v6, v16, v17, v18);
    if (objc_msgSend_matchesLoginHandleForAnyAccount(v6, v20, v21, v22))
    {
      if (IMOSLoggingEnabled())
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v19;
          _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Handle %@ matches login handle. Fetching personal status subscription", buf, 0xCu);
        }
      }
      privateWorkQueue = self->_privateWorkQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A4C6AD88;
      block[3] = &unk_1E5B7F310;
      id v35 = v15;
      v36 = v7;
      dispatch_async(privateWorkQueue, block);

      id v27 = v35;
    }
    else
    {
      uint64_t v28 = objc_msgSend__skHandleForIMHandle_(self, v23, (uint64_t)v6, v24);
      if (IMOSLoggingEnabled())
      {
        v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v19;
          _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "Initiating a subscription fetch for handle: \"%@\"", buf, 0xCu);
        }
      }
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = sub_1A4C6AF00;
      v31[3] = &unk_1E5B7F338;
      id v32 = v28;
      v33 = v7;
      id v27 = v28;
      objc_msgSend_statusSubscriptionForHandle_completion_(v15, v30, (uint64_t)v27, (uint64_t)v31);
    }
  }
}

- (void)_postNotificationForUpdatedStatusWithSubscription:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4C6B180;
  block[3] = &unk_1E5B7ACD0;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (int64_t)_availablityFromStatusSubscription:(id)a3 handleID:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v9 = a4;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_currentStatus(v5, v6, v7, v8);
    uint64_t v14 = v10;
    if (!v10)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          int v37 = 138412290;
          id v38 = v9;
          _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Current status not found for handle \"%@\", returning unknown availability", (uint8_t *)&v37, 0xCu);
        }
      }
      int64_t v30 = 0;
      goto LABEL_39;
    }
    uint64_t v15 = objc_msgSend_statusUniqueIdentifier(v10, v11, v12, v13);
    id v16 = objc_alloc((Class)MEMORY[0x1A6263B40](@"AKAvailability", @"AvailabilityKit"));
    uint64_t v22 = objc_msgSend_initWithPublishedStatus_(v16, v17, (uint64_t)v14, v18);
    if (!v22)
    {
      id v32 = IMLogHandleForCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_1A4CBA1D4((uint64_t)v9, v32);
      }

      int64_t v30 = 0;
      goto LABEL_38;
    }
    if (objc_msgSend_isPersonalStatusSubscription(v5, v19, v20, v21))
    {
      int isAvailable = objc_msgSend_isAvailable(v22, v23, v24, v25);
      int v27 = IMOSLoggingEnabled();
      if (isAvailable)
      {
        if (v27)
        {
          uint64_t v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            int v37 = 138412546;
            id v38 = v9;
            __int16 v39 = 2112;
            v40 = v15;
            _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Personal status subscription for handleID \"%@\" says we are AVAILABLE from status %@", (uint8_t *)&v37, 0x16u);
          }
LABEL_27:

          goto LABEL_28;
        }
        goto LABEL_28;
      }
      if (v27)
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          int v37 = 138412546;
          id v38 = v9;
          __int16 v39 = 2112;
          v40 = v15;
          _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Personal status subscription for handleID \"%@\" says we are UNAVAILABLE from status %@", (uint8_t *)&v37, 0x16u);
        }
LABEL_36:
      }
    }
    else
    {
      int isAvailableToMe = objc_msgSend_isAvailableToMe(v22, v23, v24, v25);
      int v34 = IMOSLoggingEnabled();
      if (isAvailableToMe)
      {
        if (v34)
        {
          uint64_t v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            int v37 = 138412546;
            id v38 = v9;
            __int16 v39 = 2112;
            v40 = v15;
            _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "StatusKit indicates handle \"%@\" is AVAILABLE from status %@", (uint8_t *)&v37, 0x16u);
          }
          goto LABEL_27;
        }
LABEL_28:
        int64_t v30 = 1;
LABEL_38:

LABEL_39:
        goto LABEL_40;
      }
      if (v34)
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          int v37 = 138412546;
          id v38 = v9;
          __int16 v39 = 2112;
          v40 = v15;
          _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "StatusKit indicates handle \"%@\" is UNAVAILABLE from status %@", (uint8_t *)&v37, 0x16u);
        }
        goto LABEL_36;
      }
    }
    int64_t v30 = 2;
    goto LABEL_38;
  }
  if (IMOSLoggingEnabled())
  {
    v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      int v37 = 138412290;
      id v38 = v9;
      _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "Subscription not found for handle \"%@\", returning unknown availability", (uint8_t *)&v37, 0xCu);
    }
  }
  int64_t v30 = 0;
LABEL_40:

  return v30;
}

- (void)fetchPersonalAvailabilityWithCompletion:(id)a3
{
  id v4 = a3;
  privateWorkQueue = self->_privateWorkQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A4C6B6A0;
  v7[3] = &unk_1E5B7F310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(privateWorkQueue, v7);
}

- (void)beginObservingAvailabilityForHandle:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_isInAppleStoreDemoMode(MEMORY[0x1E4F6E5D0], v5, v6, v7))
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Not beginnign observing availability in Apple Store Demo mode.", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend_ID(v4, v8, v9, v10);
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v12;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Received request to begin observing availability for: %@", buf, 0xCu);
      }
    }
    id v16 = objc_msgSend_statusSubscriptionForHandle_(self, v13, (uint64_t)v4, v14);
    uint64_t v20 = v16;
    if (v16)
    {
      uint64_t v21 = objc_msgSend_subscriptionIdentifier(v16, v17, v18, v19);
      if (IMOSLoggingEnabled())
      {
        uint64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v35 = v21;
          __int16 v36 = 2112;
          int v37 = v12;
          _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "Retaining transient subscription assertion on subscription: \"%@\" for handle: \"%@\"", buf, 0x16u);
        }
      }
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = sub_1A4C6BAB8;
      v31[3] = &unk_1E5B7E128;
      id v32 = v21;
      id v33 = v12;
      id v23 = v21;
      objc_msgSend_retainTransientSubscriptionAssertionWithCompletion_(v20, v24, (uint64_t)v31, v25);
    }
    else if (IMOSLoggingEnabled())
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int64_t v30 = objc_msgSend_ID(v4, v27, v28, v29);
        *(_DWORD *)buf = 138412290;
        id v35 = v30;
        _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Could not find cached subscription for handle: \"%@\". Not observing availability (yet).", buf, 0xCu);
      }
    }
  }
}

- (void)endObservingAvailabilityForHandle:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v8 = objc_msgSend_isInAppleStoreDemoMode(MEMORY[0x1E4F6E5D0], v5, v6, v7);
  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Not ending observing availability in Apple Store Demo mode.", buf, 2u);
      }
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = objc_msgSend_ID(v4, v14, v15, v16);
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v17;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Received request to end observing availability for: %@", buf, 0xCu);
      }
    }
    uint64_t v18 = objc_msgSend_statusSubscriptionForHandle_(self, v10, (uint64_t)v4, v11);
    uint64_t v22 = v18;
    if (v18)
    {
      id v23 = objc_msgSend_subscriptionIdentifier(v18, v19, v20, v21);
      int v27 = objc_msgSend_ID(v4, v24, v25, v26);
      if (IMOSLoggingEnabled())
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v42 = v23;
          __int16 v43 = 2112;
          v44 = v27;
          _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Releasing transient subscription assertion on subscription: \"%@\" for handle: \"%@\"", buf, 0x16u);
        }
      }
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = sub_1A4C6BF30;
      v38[3] = &unk_1E5B7E128;
      id v39 = v27;
      id v40 = v23;
      id v29 = v23;
      id v30 = v27;
      objc_msgSend_releaseTransientSubscriptionAssertionWithCompletion_(v22, v31, (uint64_t)v38, v32);
    }
    else if (IMOSLoggingEnabled())
    {
      id v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        int v37 = objc_msgSend_ID(v4, v34, v35, v36);
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v37;
        _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Could not find cached subscription for handle: \"%@\". Not observing availability (yet).", buf, 0xCu);
      }
    }
  }
}

- (id)_subscriptionCacheKeyForHandle:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_normalizedID(v3, v4, v5, v6);
  if (!objc_msgSend_length(v7, v8, v9, v10))
  {
    uint64_t v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1A4CBA354((uint64_t)v3, v11);
    }

    uint64_t v15 = objc_msgSend_ID(v3, v12, v13, v14);

    uint64_t v7 = (void *)v15;
  }

  return v7;
}

- (SKStatusSubscriptionService)subscriptionService
{
  subscriptionService = self->_subscriptionService;
  if (!subscriptionService)
  {
    id v4 = (objc_class *)MEMORY[0x1A6263B40](@"SKStatusSubscriptionService", @"StatusKit");
    id v5 = *(id *)MEMORY[0x1A6263B50]("AKAvailabilityStatusTypeIdentifier", @"AvailabilityKit");
    id v6 = [v4 alloc];
    uint64_t v9 = (SKStatusSubscriptionService *)objc_msgSend_initWithStatusTypeIdentifier_(v6, v7, (uint64_t)v5, v8);
    uint64_t v10 = self->_subscriptionService;
    self->_subscriptionService = v9;

    objc_msgSend_addDelegate_queue_(self->_subscriptionService, v11, (uint64_t)self, MEMORY[0x1E4F14428]);
    subscriptionService = self->_subscriptionService;
  }

  return subscriptionService;
}

- (id)_cachedStatusSubscriptionForIMHandle:(id)a3 fromCache:(id)a4 cacheDescription:(id)a5 cacheMiss:(BOOL *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v15 = objc_msgSend__subscriptionCacheKeyForHandle_(self, v13, (uint64_t)v10, v14);
  id v16 = v11;
  objc_sync_enter(v16);
  if (v15)
  {
    uint64_t v19 = objc_msgSend_objectForKey_(v16, v17, (uint64_t)v15, v18);
  }
  else
  {
    uint64_t v19 = 0;
  }
  objc_sync_exit(v16);

  if (!v19)
  {
    if (IMOSLoggingEnabled())
    {
      id v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        int v33 = 138412546;
        id v34 = v12;
        __int16 v35 = 2112;
        uint64_t v36 = v15;
        _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Subscription cache miss (%@) for key \"%@\"", (uint8_t *)&v33, 0x16u);
      }
    }
    if (a6)
    {
      id v20 = 0;
      *a6 = 1;
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (a6) {
    *a6 = 0;
  }
  MEMORY[0x1A6263B40](@"SKStatusSubscription", @"StatusKit");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_27:
        id v20 = 0;
        goto LABEL_28;
      }
      uint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        int v33 = 138412546;
        id v34 = v12;
        __int16 v35 = 2112;
        uint64_t v36 = v15;
        _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Subscription cache hit (%@), we do not have a subscription for key: \"%@\"", (uint8_t *)&v33, 0x16u);
      }
    }
    else
    {
      uint64_t v31 = IMLogHandleForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        int v33 = 138412802;
        id v34 = v12;
        __int16 v35 = 2112;
        uint64_t v36 = v15;
        __int16 v37 = 2112;
        uint64_t v38 = v19;
        _os_log_fault_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_FAULT, "Subscription cache hit (%@) for key \"%@\", but object in cache is of unknown type: \"%@\"", (uint8_t *)&v33, 0x20u);
      }
    }

    goto LABEL_27;
  }
  id v20 = v19;
  uint64_t v24 = objc_msgSend_currentStatus(v20, v21, v22, v23);
  uint64_t v28 = objc_msgSend_statusUniqueIdentifier(v24, v25, v26, v27);

  if (IMOSLoggingEnabled())
  {
    id v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      int v33 = 138412802;
      id v34 = v12;
      __int16 v35 = 2112;
      uint64_t v36 = v15;
      __int16 v37 = 2112;
      uint64_t v38 = v28;
      _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "Subscription cache hit (%@), found subscription for key: \"%@\" Status: %@", (uint8_t *)&v33, 0x20u);
    }
  }
LABEL_28:

  return v20;
}

- (id)_skHandleForIMHandle:(id)a3
{
  id v5 = objc_msgSend_normalizedID(a3, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend__skHandleForString_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)_skHandleForString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)MEMORY[0x1A6263B40](@"SKHandle", @"StatusKit"));
  uint64_t v7 = objc_msgSend_initWithString_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

- (void)_clearCurrentSubscriptionCache
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = self->_pendingFetchesForCacheKeys;
  objc_sync_enter(v3);
  int64_t v7 = self->_currentCacheGeneration + 1;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      int64_t v13 = v7;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Clearing current subscription cache. New cache generation: %ld", (uint8_t *)&v12, 0xCu);
    }
  }
  self->_currentCacheGeneration = v7;
  objc_msgSend_removeAllObjects(self->_currentSubscriptionCache, v4, v5, v6);
  objc_msgSend_removeAllObjects(self->_pendingFetchesForCacheKeys, v9, v10, v11);
  objc_sync_exit(v3);
}

- (void)subscriptionInvitationReceived:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Subscription invitation received, clearing cache and notifying UI to subscribe, if necessary. %@", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_msgSend__clearCurrentSubscriptionCache(self, v5, v6, v7);
  int v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
  objc_msgSend___mainThreadPostNotificationName_object_(v12, v13, (uint64_t)IMHandleAvailabilityInvitationReceivedNotification, (uint64_t)v4);
}

- (void)subscriptionReceivedStatusUpdate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Status update received, clearing cache and notifying UI to display updated status, if necessary. %@", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_msgSend__clearCurrentSubscriptionCache(self, v5, v6, v7);
  int v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
  objc_msgSend___mainThreadPostNotificationName_object_(v12, v13, (uint64_t)IMHandleAvailabilityChangedNotification, (uint64_t)v4);
}

- (void)subscriptionStateChanged:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Status state changed, clearing cache and notifying UI to refetch all relevant state. %@", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_msgSend__clearCurrentSubscriptionCache(self, v5, v6, v7);
  int v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
  objc_msgSend___mainThreadPostNotificationName_object_(v12, v13, (uint64_t)IMHandleAvailabilityStateChangedNotification, (uint64_t)v4);
}

- (void)subscriptionServiceDaemonDisconnected:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v14 = 0;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Subscription service daemon was disconnected, (e.g. app is returning from backgrounded) clearing stale cached data and notifying UI to refetch if necessary", v14, 2u);
    }
  }
  objc_msgSend__clearCurrentSubscriptionCache(self, v5, v6, v7);
  int v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
  objc_msgSend___mainThreadPostNotificationName_object_(v12, v13, IMHandleAvailabilityDaemonDisconnectedNotification, 0);
}

- (NSMutableDictionary)currentSubscriptionCache
{
  return self->_currentSubscriptionCache;
}

- (void)setCurrentSubscriptionCache:(id)a3
{
}

- (NSMutableDictionary)lastKnownSubscriptionCache
{
  return self->_lastKnownSubscriptionCache;
}

- (void)setLastKnownSubscriptionCache:(id)a3
{
}

- (int64_t)currentCacheGeneration
{
  return self->_currentCacheGeneration;
}

- (void)setCurrentCacheGeneration:(int64_t)a3
{
  self->_currentCacheGeneration = a3;
}

- (NSMutableSet)pendingFetchesForCacheKeys
{
  return self->_pendingFetchesForCacheKeys;
}

- (void)setPendingFetchesForCacheKeys:(id)a3
{
}

- (void)setSubscriptionService:(id)a3
{
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionService, 0);
  objc_storeStrong((id *)&self->_pendingFetchesForCacheKeys, 0);
  objc_storeStrong((id *)&self->_lastKnownSubscriptionCache, 0);

  objc_storeStrong((id *)&self->_currentSubscriptionCache, 0);
}

@end