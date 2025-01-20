@interface IMPendingReplicatedMessageCache
+ (id)sharedCache;
- (IMPendingReplicatedMessageCache)init;
- (NSCache)replicatedFallbackHistory;
- (NSMutableDictionary)pendingMessages;
- (NSTimer)timeoutTimer;
- (OS_dispatch_queue)queue;
- (id)releasedReplicatedGUIDForGUID:(id)a3;
- (void)_enforceCacheLimit;
- (void)_enforceTimeout;
- (void)_metricMatchingFailureWithReason:(id)a3;
- (void)_removePendingMessageWithGUID:(id)a3;
- (void)_scheduleTimeout;
- (void)addPendingMessageWithGUID:(id)a3 replicatedFallbackGUIDs:(id)a4 releaseBlock:(id)a5;
- (void)clearPendingMessageWithGUID:(id)a3;
- (void)releasePendingMessageWithGUID:(id)a3 serviceName:(id)a4 chat:(id)a5 completion:(id)a6;
- (void)setPendingMessages:(id)a3;
- (void)setReplicatedFallbackHistory:(id)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation IMPendingReplicatedMessageCache

+ (id)sharedCache
{
  if (qword_1EA8CA3D8 != -1) {
    dispatch_once(&qword_1EA8CA3D8, &unk_1F33906C0);
  }
  v2 = (void *)qword_1EA8CA3D0;

  return v2;
}

- (IMPendingReplicatedMessageCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)IMPendingReplicatedMessageCache;
  v2 = [(IMPendingReplicatedMessageCache *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Messages.IMPendingReplicatedMessageCache", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingMessages = v2->_pendingMessages;
    v2->_pendingMessages = v6;

    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    replicatedFallbackHistory = v2->_replicatedFallbackHistory;
    v2->_replicatedFallbackHistory = v8;

    [(NSCache *)v2->_replicatedFallbackHistory setCountLimit:1024];
  }
  return v2;
}

- (void)addPendingMessageWithGUID:(id)a3 replicatedFallbackGUIDs:(id)a4 releaseBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(IMPendingReplicatedMessageCache *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D96A7944;
  v15[3] = &unk_1E6B731A0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

- (void)releasePendingMessageWithGUID:(id)a3 serviceName:(id)a4 chat:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(IMPendingReplicatedMessageCache *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D96A7D80;
  block[3] = &unk_1E6B731F0;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_sync(v14, block);
}

- (void)clearPendingMessageWithGUID:(id)a3
{
  id v4 = a3;
  v5 = [(IMPendingReplicatedMessageCache *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D96A8098;
  v7[3] = &unk_1E6B73218;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)releasedReplicatedGUIDForGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1D96A81E8;
  id v16 = sub_1D96A81F8;
  id v17 = 0;
  v5 = [(IMPendingReplicatedMessageCache *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D96A8200;
  block[3] = &unk_1E6B73240;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_removePendingMessageWithGUID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(IMPendingReplicatedMessageCache *)self pendingMessages];
    id v6 = [v5 objectForKeyedSubscript:v4];

    id v7 = [(IMPendingReplicatedMessageCache *)self pendingMessages];
    [v7 setObject:0 forKeyedSubscript:v4];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = objc_msgSend(v6, "replicatedFallbackGUIDs", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
          id v13 = [(IMPendingReplicatedMessageCache *)self pendingMessages];
          [v13 setObject:0 forKeyedSubscript:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v9);
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [v6 replicatedFallbackGUIDs];
        *(_DWORD *)buf = 138412546;
        id v25 = v4;
        __int16 v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Removed pending replicated message %@ (fallback GUIDs: %@) from cache", buf, 0x16u);
      }
    }
    id v16 = [(IMPendingReplicatedMessageCache *)self pendingMessages];
    BOOL v17 = [v16 count] == 0;

    if (v17)
    {
      if (IMOSLoggingEnabled())
      {
        id v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "No more pending messages, invalidating timer for timeout enforcement", buf, 2u);
        }
      }
      v19 = [(IMPendingReplicatedMessageCache *)self timeoutTimer];
      [v19 invalidate];

      [(IMPendingReplicatedMessageCache *)self setTimeoutTimer:0];
    }
  }
}

- (void)_scheduleTimeout
{
  v3 = [(IMPendingReplicatedMessageCache *)self timeoutTimer];
  char v4 = [v3 isValid];

  if ((v4 & 1) == 0)
  {
    id location = 0;
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    uint64_t v9 = sub_1D96A8648;
    uint64_t v10 = &unk_1E6B73290;
    objc_copyWeak(&v11, &location);
    id v6 = [v5 scheduledTimerWithTimeInterval:1 repeats:&v7 block:1800.0];
    -[IMPendingReplicatedMessageCache setTimeoutTimer:](self, "setTimeoutTimer:", v6, v7, v8, v9, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_enforceTimeout
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      char v4 = [(IMPendingReplicatedMessageCache *)self pendingMessages];
      *(_DWORD *)buf = 134218240;
      uint64_t v24 = [v4 count];
      __int16 v25 = 2048;
      uint64_t v26 = 128;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Enforcing cache timeout, has %llu messages (limit %llu)", buf, 0x16u);
    }
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(IMPendingReplicatedMessageCache *)self pendingMessages];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1D96A89C8;
  v20[3] = &unk_1E6B732B8;
  id v7 = v5;
  id v21 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v20];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v17;
    *(void *)&long long v10 = 138412290;
    long long v15 = v10;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        if (IMOSLoggingEnabled())
        {
          uint64_t v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            uint64_t v24 = v13;
            _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Timing out message %@", buf, 0xCu);
          }
        }
        -[IMPendingReplicatedMessageCache _removePendingMessageWithGUID:](self, "_removePendingMessageWithGUID:", v13, v15, (void)v16);
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v9);
  }

  if ([v8 count]) {
    [(IMPendingReplicatedMessageCache *)self _metricMatchingFailureWithReason:@"Replicated Message Deferral Timeout"];
  }
}

- (void)_enforceCacheLimit
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(IMPendingReplicatedMessageCache *)self pendingMessages];
  unint64_t v4 = [v3 count];

  if (v4 >= 0x80)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = [(IMPendingReplicatedMessageCache *)self pendingMessages];
        *(_DWORD *)buf = 134218240;
        uint64_t v21 = [v6 count];
        __int16 v22 = 2048;
        uint64_t v23 = 128;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Enforcing cache limit, has %llu messages (limit %llu)", buf, 0x16u);
      }
    }
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:1];
    id v8 = [(IMPendingReplicatedMessageCache *)self pendingMessages];
    uint64_t v9 = [v8 allValues];
    long long v19 = v7;
    long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    uint64_t v11 = [v9 sortedArrayUsingDescriptors:v10];

    unint64_t v12 = 0;
    *(void *)&long long v13 = 138412290;
    long long v18 = v13;
    do
    {
      if (v12 >= objc_msgSend(v11, "count", v18)) {
        break;
      }
      uint64_t v14 = [v11 objectAtIndexedSubscript:v12];
      if (IMOSLoggingEnabled())
      {
        long long v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          long long v16 = [v14 messageGUID];
          *(_DWORD *)buf = v18;
          uint64_t v21 = (uint64_t)v16;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Evicting message %@", buf, 0xCu);
        }
      }
      long long v17 = [v14 messageGUID];
      [(IMPendingReplicatedMessageCache *)self _removePendingMessageWithGUID:v17];

      ++v12;
    }
    while (v12 != 25);
    [(IMPendingReplicatedMessageCache *)self _metricMatchingFailureWithReason:@"Replicated Message Cache Overflow"];
  }
}

- (void)_metricMatchingFailureWithReason:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F6E890];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 forceAutoBugCaptureWithSubType:v4 errorPayload:0];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)pendingMessages
{
  return self->_pendingMessages;
}

- (void)setPendingMessages:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (NSCache)replicatedFallbackHistory
{
  return self->_replicatedFallbackHistory;
}

- (void)setReplicatedFallbackHistory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replicatedFallbackHistory, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_pendingMessages, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end