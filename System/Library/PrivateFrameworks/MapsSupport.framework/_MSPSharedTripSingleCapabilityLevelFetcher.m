@interface _MSPSharedTripSingleCapabilityLevelFetcher
- (_MSPSharedTripSingleCapabilityLevelFetcher)initWithContact:(id)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6;
- (void)_finishWithType:(unint64_t)a3;
- (void)_timeout;
- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4;
- (void)start;
@end

@implementation _MSPSharedTripSingleCapabilityLevelFetcher

- (_MSPSharedTripSingleCapabilityLevelFetcher)initWithContact:(id)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_MSPSharedTripSingleCapabilityLevelFetcher;
  v14 = [(_MSPSharedTripSingleCapabilityLevelFetcher *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contact, a3);
    uint64_t v16 = [v13 copy];
    id completion = v15->_completion;
    v15->_id completion = (id)v16;

    objc_storeStrong((id *)&v15->_keepAliveReference, v15);
    objc_storeStrong((id *)&v15->_callbackQueue, a5);
    double v18 = 10.0;
    if (a4 > 0.0) {
      double v18 = a4;
    }
    v15->_timeoutInterval = v18;
  }

  return v15;
}

- (void)start
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
  uint64_t v4 = [v3 capabilityLevelForContact:self->_contact];

  if (v4)
  {
    v5 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      contact = self->_contact;
      *(_DWORD *)buf = 138477827;
      v22 = contact;
      _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_INFO, "fetchCapabilityLevelForContact found existing capability for single destination %{private}@", buf, 0xCu);
    }

    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51___MSPSharedTripSingleCapabilityLevelFetcher_start__block_invoke;
    block[3] = &unk_1E617E078;
    block[4] = self;
    block[5] = v4;
    dispatch_async(callbackQueue, block);
  }
  else
  {
    double timeoutInterval = self->_timeoutInterval;
    v9 = self->_callbackQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51___MSPSharedTripSingleCapabilityLevelFetcher_start__block_invoke_2;
    v18[3] = &unk_1E617D930;
    v18[4] = self;
    v10 = +[GCDTimer scheduledTimerWithTimeInterval:v9 queue:v18 block:timeoutInterval];
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v10;

    id v12 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = self->_contact;
      double v14 = self->_timeoutInterval;
      *(_DWORD *)buf = 138478083;
      v22 = v13;
      __int16 v23 = 2048;
      double v24 = v14;
      _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_INFO, "fetchCapabilityLevelForContact enqueuing single destination %{private}@, timeout: %#.1lfs", buf, 0x16u);
    }

    v15 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
    [v15 registerObserver:self];

    uint64_t v16 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
    objc_super v20 = self->_contact;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v16 requestCapabilityLevelsForContacts:v17];
  }
}

- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  contact = self->_contact;
  id v6 = a4;
  v7 = [(MSPSharedTripContact *)contact stringValue];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    v9 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
    uint64_t v10 = [v9 capabilityLevelForContact:self->_contact];

    if (v10)
    {
      id v11 = MSPGetSharedTripCapabilityFetchingLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = self->_contact;
        *(_DWORD *)buf = 138478083;
        v17 = v12;
        __int16 v18 = 2048;
        uint64_t v19 = v10;
        _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_INFO, "fetchCapabilityLevelForContact response for contact %{private}@: %lu", buf, 0x16u);
      }

      id v13 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
      [v13 unregisterObserver:self];

      callbackQueue = self->_callbackQueue;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __105___MSPSharedTripSingleCapabilityLevelFetcher_capabilityLevelFetcher_didUpdateCapabilityLevelsForHandles___block_invoke;
      v15[3] = &unk_1E617E078;
      v15[4] = self;
      v15[5] = v10;
      dispatch_async(callbackQueue, v15);
    }
  }
}

- (void)_timeout
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    contact = self->_contact;
    int v7 = 138477827;
    int v8 = contact;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_INFO, "fetchCapabilityLevelForContact timed out waiting for contact %{private}@", (uint8_t *)&v7, 0xCu);
  }

  v5 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
  [v5 unregisterObserver:self];

  id v6 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
  -[_MSPSharedTripSingleCapabilityLevelFetcher _finishWithType:](self, "_finishWithType:", [v6 capabilityLevelForContact:self->_contact]);
}

- (void)_finishWithType:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id completion = self->_completion;
  id v6 = MSPGetSharedTripCapabilityFetchingLog();
  uint64_t v7 = (uint64_t)v6;
  if (completion)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (a3 > 4) {
        int v8 = @"Unknown";
      }
      else {
        int v8 = *(&off_1E617E098 + a3);
      }
      contact = self->_contact;
      int v15 = 138543619;
      uint64_t v16 = v8;
      __int16 v17 = 2113;
      __int16 v18 = contact;
      _os_log_impl(&dword_1B87E5000, (os_log_t)v7, OS_LOG_TYPE_INFO, "fetchCapabilityLevelForContact cleaning up and calling completion handler with type %{public}@ for contact %{private}@", (uint8_t *)&v15, 0x16u);
    }

    [(GCDTimer *)self->_timeoutTimer invalidate];
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0;

    id v12 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
    [v12 unregisterObserver:self];

    uint64_t v7 = MEMORY[0x1BA9C2AF0](self->_completion);
    id v13 = self->_completion;
    self->_id completion = 0;

    (*(void (**)(uint64_t, unint64_t))(v7 + 16))(v7, a3);
    keepAliveReference = self->_keepAliveReference;
    self->_keepAliveReference = 0;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    uint64_t v9 = self->_contact;
    int v15 = 138477827;
    uint64_t v16 = v9;
    _os_log_impl(&dword_1B87E5000, (os_log_t)v7, OS_LOG_TYPE_FAULT, "fetchCapabilityLevelForContact single-fetcher finish was called multiple times for contact %{private}@", (uint8_t *)&v15, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_keepAliveReference, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end