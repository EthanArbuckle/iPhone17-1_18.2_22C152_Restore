@interface HDNanoSyncRestoreSession
- (BOOL)isFinished;
- (HDNanoSyncRestoreSession)initWithSyncStore:(id)a3 sessionUUID:(id)a4;
- (HDNanoSyncStore)nanoSyncStore;
- (NSCalendar)calendar;
- (NSDate)startDate;
- (NSUUID)sessionUUID;
- (int64_t)sequenceNumber;
- (void)addCompletionHandler:(id)a3;
- (void)dealloc;
- (void)finishWithError:(id)a3;
- (void)scheduleTimeoutWithInterval:(double)a3 handler:(id)a4;
- (void)setSequenceNumber:(int64_t)a3;
@end

@implementation HDNanoSyncRestoreSession

- (HDNanoSyncRestoreSession)initWithSyncStore:(id)a3 sessionUUID:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDNanoSyncRestoreSession.m", 27, @"Invalid parameter not satisfying: %@", @"sessionUUID != nil" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)HDNanoSyncRestoreSession;
  v10 = [(HDNanoSyncRestoreSession *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_nanoSyncStore, a3);
    objc_storeStrong((id *)&v11->_sessionUUID, a4);
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    calendar = v11->_calendar;
    v11->_calendar = (NSCalendar *)v14;
  }
  return v11;
}

- (void)dealloc
{
  [(_HKExpiringCompletionTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDNanoSyncRestoreSession;
  [(HDNanoSyncRestoreSession *)&v3 dealloc];
}

- (void)finishWithError:(id)a3
{
}

- (void)addCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    completionHandlers = self->_completionHandlers;
    id v10 = v4;
    if (!completionHandlers)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = self->_completionHandlers;
      self->_completionHandlers = v6;

      completionHandlers = self->_completionHandlers;
    }
    id v8 = (void *)[v10 copy];
    id v9 = _Block_copy(v8);
    [(NSMutableArray *)completionHandlers addObject:v9];

    id v4 = v10;
  }
}

- (void)scheduleTimeoutWithInterval:(double)a3 handler:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HDNanoSyncRestoreSession.m", 69, @"Invalid parameter not satisfying: %@", @"handler != NULL" object file lineNumber description];
  }
  if (self->_timer)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDNanoSyncRestoreSession.m", 70, @"Invalid parameter not satisfying: %@", @"_timer == nil" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F2B8E0]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__HDNanoSyncRestoreSession_scheduleTimeoutWithInterval_handler___block_invoke;
  v13[3] = &unk_1E630D600;
  objc_copyWeak(&v14, &location);
  id v9 = (_HKExpiringCompletionTimer *)[v8 initWithCompletion:v13];
  timer = self->_timer;
  self->_timer = v9;

  [(_HKExpiringCompletionTimer *)self->_timer startWithTimeoutInterval:v7 handler:a3];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __64__HDNanoSyncRestoreSession_scheduleTimeoutWithInterval_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (id *)(a1 + 32);
  id v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  id v5 = v4;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (*((unsigned char *)WeakRetained + 8))
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:sel__finishWithError_, WeakRetained, @"HDNanoSyncRestoreSession.m", 48, @"Invalid parameter not satisfying: %@", @"_finished == NO" object file lineNumber description];

      v6 = WeakRetained;
    }
    *((unsigned char *)v6 + 8) = 1;
    id v7 = (void *)[v6[7] copy];
    [WeakRetained[7] removeAllObjects];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * i) + 16))();
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (HDNanoSyncStore)nanoSyncStore
{
  return self->_nanoSyncStore;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int64_t)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_nanoSyncStore, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end