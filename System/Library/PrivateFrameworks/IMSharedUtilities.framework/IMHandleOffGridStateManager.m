@interface IMHandleOffGridStateManager
+ (id)sharedInstance;
- (IMHandleOffGridStateManager)init;
- (NSDictionary)cachedOverrideDatesByHandleID;
- (NSMutableDictionary)currentSubscriptionCache;
- (NSMutableDictionary)lastKnownSubscriptionCache;
- (NSMutableDictionary)overrideDatesByHandleID;
- (NSMutableSet)pendingFetchesForCacheKeys;
- (OS_dispatch_queue)fetchQueue;
- (OS_dispatch_queue)queue;
- (SKStatusSubscription)personalSubscription;
- (SKStatusSubscriptionService)subscriptionService;
- (id)_cachedStatusSubscriptionForHandle:(id)a3;
- (id)_cachedStatusSubscriptionForIMHandle:(id)a3 fromCache:(id)a4 cacheDescription:(id)a5 cacheMiss:(BOOL *)a6;
- (id)_identifierFromStatusSubscription:(id)a3 handleID:(id)a4;
- (id)_overrideDateForHandleWithID:(id)a3;
- (id)_skHandleForHandle:(id)a3;
- (id)_subscriptionCacheKeyForHandle:(id)a3;
- (id)cachedStatusSubscriptionForHandle:(id)a3;
- (int64_t)_offGridModeFromStatusSubscription:(id)a3 handleID:(id)a4 onlyIfLaterThanDate:(id)a5;
- (int64_t)currentCacheGeneration;
- (int64_t)offGridModeForHandle:(id)a3;
- (int64_t)personalOffGridMode;
- (void)_clearCurrentSubscriptionCache;
- (void)_fetchUpdatedStatusAndUpdateCachesForHandle:(id)a3 lastKnownStatus:(id)a4 completion:(id)a5;
- (void)_fetchUpdatedStatusForHandle:(id)a3 completion:(id)a4;
- (void)_personalSubscriptionWithCompletion:(id)a3;
- (void)_postNotificationForUpdatedStatusWithSubscription:(id)a3;
- (void)_setCachedOverrideDatesByHandleID:(id)a3;
- (void)cachedOffGridModeAndLastPublisherForHandle:(id)a3 completion:(id)a4;
- (void)fetchUpdatedStatusForHandle:(id)a3 completion:(id)a4;
- (void)offGridModeForHandle:(id)a3 completion:(id)a4;
- (void)overrideStatusForHandleWithID:(id)a3 publishedBeforeDate:(id)a4;
- (void)personalOffGridModeWithCompletion:(id)a3;
- (void)setCurrentCacheGeneration:(int64_t)a3;
- (void)setCurrentSubscriptionCache:(id)a3;
- (void)setFetchQueue:(id)a3;
- (void)setLastKnownSubscriptionCache:(id)a3;
- (void)setOverrideDatesByHandleID:(id)a3;
- (void)setPendingFetchesForCacheKeys:(id)a3;
- (void)setPersonalSubscription:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSubscriptionService:(id)a3;
- (void)subscriptionInvitationReceived:(id)a3;
- (void)subscriptionReceivedStatusUpdate:(id)a3;
- (void)subscriptionServiceDaemonDisconnected:(id)a3;
- (void)subscriptionStateChanged:(id)a3;
@end

@implementation IMHandleOffGridStateManager

+ (id)sharedInstance
{
  if (qword_1EB4A6578 != -1) {
    dispatch_once(&qword_1EB4A6578, &unk_1EF2BF5A0);
  }
  v2 = (void *)qword_1EB4A6008;

  return v2;
}

- (IMHandleOffGridStateManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)IMHandleOffGridStateManager;
  v2 = [(IMHandleOffGridStateManager *)&v20 init];
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

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    overrideDatesByHandleID = v2->_overrideDatesByHandleID;
    v2->_overrideDatesByHandleID = v9;

    v2->_currentCacheGeneration = 0;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.Messages.IMHandleOffGridStateManager", v12);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.Messages.IMHandleOffGridStateManagerFetch", v16);
    fetchQueue = v2->_fetchQueue;
    v2->_fetchQueue = (OS_dispatch_queue *)v17;
  }
  return v2;
}

- (SKStatusSubscriptionService)subscriptionService
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  subscriptionService = self->_subscriptionService;
  if (!subscriptionService)
  {
    v4 = (SKStatusSubscriptionService *)objc_msgSend(objc_alloc((Class)MEMORY[0x1A6227910](@"SKStatusSubscriptionService", @"StatusKit")), "initWithStatusTypeIdentifier:", qword_1E94F7DC0);
    v5 = self->_subscriptionService;
    self->_subscriptionService = v4;

    [(SKStatusSubscriptionService *)self->_subscriptionService addDelegate:self queue:MEMORY[0x1E4F14428]];
    subscriptionService = self->_subscriptionService;
  }

  return subscriptionService;
}

- (int64_t)offGridModeForHandle:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  dispatch_queue_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A0804B24;
  block[3] = &unk_1E5A12550;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)offGridModeForHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A0804C90;
  block[3] = &unk_1E5A10DC8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (id)cachedStatusSubscriptionForHandle:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1A077785C;
  v16 = sub_1A077771C;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A0804E30;
  block[3] = &unk_1E5A12578;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)cachedOffGridModeAndLastPublisherForHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A0804F44;
  block[3] = &unk_1E5A10DC8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (void)fetchUpdatedStatusForHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A08050DC;
  block[3] = &unk_1E5A10DC8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (int64_t)personalOffGridMode
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A0805198;
  v5[3] = &unk_1E5A125A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)personalOffGridModeWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A08052A0;
  v7[3] = &unk_1E5A125F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)overrideStatusForHandleWithID:(id)a3 publishedBeforeDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A0805458;
  block[3] = &unk_1E5A12618;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
  dispatch_async(MEMORY[0x1E4F14428], &unk_1EF2C0760);
}

- (NSDictionary)cachedOverrideDatesByHandleID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1A077785C;
  id v10 = sub_1A077771C;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A08055F8;
  v5[3] = &unk_1E5A125A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (void)_setCachedOverrideDatesByHandleID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A08056F4;
  v7[3] = &unk_1E5A10080;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (id)_overrideDateForHandleWithID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(IMHandleOffGridStateManager *)self overrideDatesByHandleID];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_cachedStatusSubscriptionForHandle:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v10 = 0;
  v5 = [(IMHandleOffGridStateManager *)self currentSubscriptionCache];
  id v6 = [(IMHandleOffGridStateManager *)self _cachedStatusSubscriptionForIMHandle:v4 fromCache:v5 cacheDescription:@"Current" cacheMiss:&v10];

  if (v10)
  {
    id v7 = [(IMHandleOffGridStateManager *)self lastKnownSubscriptionCache];
    uint64_t v8 = [(IMHandleOffGridStateManager *)self _cachedStatusSubscriptionForIMHandle:v4 fromCache:v7 cacheDescription:@"LastKnown" cacheMiss:0];

    [(IMHandleOffGridStateManager *)self _fetchUpdatedStatusAndUpdateCachesForHandle:v4 lastKnownStatus:v8 completion:0];
    id v6 = (void *)v8;
  }

  return v6;
}

- (void)_fetchUpdatedStatusAndUpdateCachesForHandle:(id)a3 lastKnownStatus:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v11 = [v9 currentStatus];
  id v12 = [v11 statusUniqueIdentifier];

  id v13 = [(IMHandleOffGridStateManager *)self _subscriptionCacheKeyForHandle:v8];
  if ([(NSMutableSet *)self->_pendingFetchesForCacheKeys containsObject:v13])
  {
    if (!v10)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v13;
          _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "We already have a pending subscription fetch for cache key: \"%@\". That fetch will notify if the subscription has changed. Taking no further action.", buf, 0xCu);
        }
      }
      goto LABEL_13;
    }
  }
  else
  {
    [(NSMutableSet *)self->_pendingFetchesForCacheKeys addObject:v13];
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "We do not have any pending fetches for cache key: \"%@\"", buf, 0xCu);
    }
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v16 = [v8 ID];
  id v17 = [(IMHandleOffGridStateManager *)self _overrideDateForHandleWithID:v16];
  v18 = [(IMHandleOffGridStateManager *)self currentCacheGeneration];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1A0805C0C;
  v21[3] = &unk_1E5A12668;
  v21[4] = self;
  objc_copyWeak(v27, (id *)buf);
  v27[1] = v18;
  id v26 = v10;
  id v22 = v13;
  id v19 = v16;
  id v23 = v19;
  id v24 = v12;
  id v20 = v17;
  id v25 = v20;
  [(IMHandleOffGridStateManager *)self _fetchUpdatedStatusForHandle:v8 completion:v21];

  objc_destroyWeak(v27);
  objc_destroyWeak((id *)buf);
LABEL_13:
}

- (id)_cachedStatusSubscriptionForIMHandle:(id)a3 fromCache:(id)a4 cacheDescription:(id)a5 cacheMiss:(BOOL *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  queue = self->_queue;
  id v12 = a4;
  id v13 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v14 = [(IMHandleOffGridStateManager *)self _subscriptionCacheKeyForHandle:v13];

  uint64_t v15 = [v12 objectForKey:v14];

  if (v15)
  {
    if (a6) {
      *a6 = 0;
    }
    MEMORY[0x1A6227910](@"SKStatusSubscription", @"StatusKit");
    if (objc_opt_isKindOfClass())
    {
      id v16 = v15;
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v17 = IMLogHandleForCategory("IMHandleOffGridStateManager");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        int v19 = 138412802;
        id v20 = v10;
        __int16 v21 = 2112;
        id v22 = v14;
        __int16 v23 = 2112;
        id v24 = v15;
        _os_log_fault_impl(&dword_1A0772000, v17, OS_LOG_TYPE_FAULT, "Subscription cache hit (%@) for key \"%@\", but object in cache is of unknown type: \"%@\"", (uint8_t *)&v19, 0x20u);
      }
    }
  }
  else if (a6)
  {
    id v16 = 0;
    *a6 = 1;
    goto LABEL_13;
  }
  id v16 = 0;
LABEL_13:

  return v16;
}

- (void)_fetchUpdatedStatusForHandle:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [(IMHandleOffGridStateManager *)self subscriptionService];
  id v9 = [v6 ID];
  if ([v6 matchesLoginHandleForAnyAccount])
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v21 = v9;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Handle %@ matches login handle. Fetching personal status subscription", buf, 0xCu);
      }
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1A0806580;
    v18[3] = &unk_1E5A12690;
    id v19 = v7;
    id v11 = v7;
    [(IMHandleOffGridStateManager *)self _personalSubscriptionWithCompletion:v18];
    id v12 = v19;
  }
  else
  {
    id v13 = [(IMHandleOffGridStateManager *)self _skHandleForHandle:v9];
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v21 = v9;
        _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Initiating a subscription fetch for handle: \"%@\"", buf, 0xCu);
      }
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1A0806590;
    v15[3] = &unk_1E5A126B8;
    id v16 = v13;
    id v17 = v7;
    id v12 = v7;
    id v11 = v13;
    [v8 statusSubscriptionForHandle:v11 completion:v15];
  }
}

- (SKStatusSubscription)personalSubscription
{
  personalSubscription = self->_personalSubscription;
  if (!personalSubscription)
  {
    id v4 = [(IMHandleOffGridStateManager *)self subscriptionService];
    v5 = [v4 personalStatusSubscription];
    id v6 = self->_personalSubscription;
    self->_personalSubscription = v5;

    personalSubscription = self->_personalSubscription;
  }

  return personalSubscription;
}

- (void)_personalSubscriptionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  v5 = [(IMHandleOffGridStateManager *)self subscriptionService];
  id v6 = v5;
  personalSubscription = self->_personalSubscription;
  if (personalSubscription)
  {
    v4[2](v4, personalSubscription);
  }
  else
  {
    fetchQueue = self->_fetchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A08068D8;
    block[3] = &unk_1E5A10DC8;
    id v11 = v5;
    id v12 = self;
    id v13 = v4;
    id v9 = 0;
    dispatch_async(fetchQueue, block);
  }
}

- (int64_t)_offGridModeFromStatusSubscription:(id)a3 handleID:(id)a4 onlyIfLaterThanDate:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    id v10 = [v7 currentStatus];
    id v11 = v10;
    if (!v10)
    {
      if (IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v27 = 138412290;
          id v28 = v8;
          _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Current status not found for handle \"%@\", returning unknown off grid mode", (uint8_t *)&v27, 0xCu);
        }
      }
      int64_t v18 = 0;
      goto LABEL_38;
    }
    id v12 = [v10 statusPayload];
    id v13 = [v12 payloadDictionary];
    if (![v13 count])
    {
      id v20 = IMLogHandleForCategory("IMHandleOffGridStateManager");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1A09F0A0C();
      }

      goto LABEL_24;
    }
    uint64_t v14 = [v13 objectForKeyedSubscript:@"m"];
    uint64_t v15 = [v14 integerValue];

    if (v15 == 2)
    {
      if (!v9
        || ([v11 datePublished],
            __int16 v21 = objc_claimAutoreleasedReturnValue(),
            [v9 laterDate:v21],
            id v22 = (id)objc_claimAutoreleasedReturnValue(),
            v22,
            v21,
            v22 != v9))
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            int v27 = 138412290;
            id v28 = v8;
            _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "Off grid mode enabled for \"%@\"", (uint8_t *)&v27, 0xCu);
          }
        }
        int64_t v18 = 2;
        goto LABEL_37;
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_36;
      }
      id v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v26 = [v11 datePublished];
        int v27 = 138412802;
        id v28 = v8;
        __int16 v29 = 2112;
        v30 = v26;
        __int16 v31 = 2112;
        id v32 = v9;
        _os_log_impl(&dword_1A0772000, v24, OS_LOG_TYPE_INFO, "Off grid mode enabled for \"%@\" but newer override date, returning disabled (published: %@ override: %@)", (uint8_t *)&v27, 0x20u);
      }
    }
    else
    {
      if (v15 != 1)
      {
        if (!v15 && IMOSLoggingEnabled())
        {
          id v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            int v27 = 138412290;
            id v28 = v8;
            _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Off grid mode unknown for \"%@\"", (uint8_t *)&v27, 0xCu);
          }
        }
LABEL_24:
        int64_t v18 = 0;
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      if (!IMOSLoggingEnabled())
      {
LABEL_36:
        int64_t v18 = 1;
        goto LABEL_37;
      }
      id v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v27 = 138412290;
        id v28 = v8;
        _os_log_impl(&dword_1A0772000, v24, OS_LOG_TYPE_INFO, "Off grid mode disabled for \"%@\"", (uint8_t *)&v27, 0xCu);
      }
    }

    goto LABEL_36;
  }
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v8;
      _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "Subscription not found for handle \"%@\", returning unknown off grid mode", (uint8_t *)&v27, 0xCu);
    }
  }
  int64_t v18 = 0;
LABEL_39:

  return v18;
}

- (id)_identifierFromStatusSubscription:(id)a3 handleID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [v5 currentStatus];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 statusPayload];
      id v10 = [v9 payloadDictionary];
      if ([v10 count]
        && ([v10 objectForKeyedSubscript:@"id"],
            id v11 = objc_claimAutoreleasedReturnValue(),
            v11,
            v11))
      {
        id v12 = [v10 objectForKeyedSubscript:@"id"];
      }
      else
      {
        uint64_t v14 = IMLogHandleForCategory("IMHandleOffGridStateManager");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1A09F0A74();
        }

        id v12 = 0;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v17 = 138412290;
          id v18 = v6;
          _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Current status not found for handle \"%@\", returning unknown identifier", (uint8_t *)&v17, 0xCu);
        }
      }
      id v12 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v6;
        _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Subscription not found for handle \"%@\", no identifier to return", (uint8_t *)&v17, 0xCu);
      }
    }
    id v12 = 0;
  }

  return v12;
}

- (void)subscriptionInvitationReceived:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Subscription invitation received, notifying UI to subscribe, if necessary. %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(IMHandleOffGridStateManager *)self _clearCurrentSubscriptionCache];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v6, "__mainThreadPostNotificationName:object:", IMHandleOffGridInvitationReceivedNotification, v4);
}

- (void)subscriptionReceivedStatusUpdate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Status update received, notifying UI to display updated status, if necessary. %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(IMHandleOffGridStateManager *)self _clearCurrentSubscriptionCache];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v6, "__mainThreadPostNotificationName:object:", IMHandleOffGridChangedNotification, v4);
}

- (void)subscriptionStateChanged:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Status state changed, notifying UI to refetch all relevant state. %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(IMHandleOffGridStateManager *)self _clearCurrentSubscriptionCache];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v6, "__mainThreadPostNotificationName:object:", IMHandleOffGridStateChangedNotification, v4);
}

- (void)subscriptionServiceDaemonDisconnected:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Subscription service daemon was disconnected, (e.g. app is returning from backgrounded) notifying UI to refetch if necessary", v7, 2u);
    }
  }
  [(IMHandleOffGridStateManager *)self _clearCurrentSubscriptionCache];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v6, "__mainThreadPostNotificationName:object:", IMHandleOffGridDaemonDisconnectedNotification, 0);
}

- (void)_postNotificationForUpdatedStatusWithSubscription:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A0807548;
  block[3] = &unk_1E5A11D40;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (id)_subscriptionCacheKeyForHandle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 normalizedID];
  if (![v4 length])
  {
    id v5 = IMLogHandleForCategory("IMHandleOffGridStateManager");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1A09F0ADC();
    }

    uint64_t v6 = [v3 ID];

    id v4 = (void *)v6;
  }

  return v4;
}

- (id)_skHandleForHandle:(id)a3
{
  id v3 = MEMORY[0x1A62278F0](a3, a2);
  id v4 = objc_msgSend(objc_alloc((Class)MEMORY[0x1A6227910](@"SKHandle", @"StatusKit")), "initWithString:", v3);

  return v4;
}

- (void)_clearCurrentSubscriptionCache
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A0807728;
  block[3] = &unk_1E5A11D40;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)fetchQueue
{
  return self->_fetchQueue;
}

- (void)setFetchQueue:(id)a3
{
}

- (void)setPersonalSubscription:(id)a3
{
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

- (NSMutableDictionary)overrideDatesByHandleID
{
  return self->_overrideDatesByHandleID;
}

- (void)setOverrideDatesByHandleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDatesByHandleID, 0);
  objc_storeStrong((id *)&self->_subscriptionService, 0);
  objc_storeStrong((id *)&self->_pendingFetchesForCacheKeys, 0);
  objc_storeStrong((id *)&self->_lastKnownSubscriptionCache, 0);
  objc_storeStrong((id *)&self->_currentSubscriptionCache, 0);
  objc_storeStrong((id *)&self->_personalSubscription, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end