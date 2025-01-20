@interface EDSendLaterUpdateController
+ (OS_os_log)log;
- (EDMessageChangeHookResponder)hookResponder;
- (EDMessagePersistence)messagePersistence;
- (EDOutgoingMessageRepository)outgoingRepository;
- (EDQueryCreator)sendLaterQueryCreator;
- (EDSendLaterUpdateController)initWithHookRegistry:(id)a3 messagePersistence:(id)a4 outgoingRepository:(id)a5 alarmScheduler:(id)a6;
- (EDSendLaterUpdateControllerAlarmDateProvider)alarmDateProvider;
- (EFXPCAlarm)xpcAlarm;
- (NSDate)nextAlarmDate;
- (void)_alarmFired;
- (void)_updateAlarmUpdatedMessages:(id)a3 sendLaterDate:(id)a4;
- (void)persistenceDidUpdateSendLaterDate:(id)a3 messages:(id)a4 generationWindow:(id)a5;
- (void)resetSendLaterAlarmIfNeeded;
- (void)setNextAlarmDate:(id)a3;
- (void)setSendLaterQueryCreator:(id)a3;
- (void)setXpcAlarm:(id)a3;
@end

@implementation EDSendLaterUpdateController

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__EDSendLaterUpdateController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_88 != -1) {
    dispatch_once(&log_onceToken_88, block);
  }
  v2 = (void *)log_log_88;

  return (OS_os_log *)v2;
}

void __34__EDSendLaterUpdateController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_88;
  log_log_88 = (uint64_t)v1;
}

- (EDSendLaterUpdateController)initWithHookRegistry:(id)a3 messagePersistence:(id)a4 outgoingRepository:(id)a5 alarmScheduler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v35.receiver = self;
  v35.super_class = (Class)EDSendLaterUpdateController;
  v15 = [(EDSendLaterUpdateController *)&v35 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_messagePersistence, a4);
    objc_storeStrong((id *)&v16->_hookResponder, a3);
    objc_storeStrong((id *)&v16->_outgoingRepository, a5);
    v17 = objc_alloc_init(EDDefaultSendLaterUpdateControllerAlarmDateProvider);
    alarmDateProvider = v16->_alarmDateProvider;
    v16->_alarmDateProvider = (EDSendLaterUpdateControllerAlarmDateProvider *)v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.EmailDaemon.SendLaterUpdateController.messageScheduler", v19);
    alarmQueue = v16->_alarmQueue;
    v16->_alarmQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F60F48]) initWithScheduler:v14 eventName:@"EDSendLaterUpdateController.alarm" eventHandlerQueue:v16->_alarmQueue];
    xpcAlarm = v16->_xpcAlarm;
    v16->_xpcAlarm = (EFXPCAlarm *)v22;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v16);
    v24 = v16->_xpcAlarm;
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __105__EDSendLaterUpdateController_initWithHookRegistry_messagePersistence_outgoingRepository_alarmScheduler___block_invoke;
    v32 = &unk_1E6C04CF0;
    objc_copyWeak(&v33, &location);
    [(EFXPCAlarm *)v24 beginReceivingEventsWithHandler:&v29];
    v25 = [EDQueryCreator alloc];
    uint64_t v26 = -[EDQueryCreator initWithQueryType:](v25, "initWithQueryType:", *MEMORY[0x1E4F5FF18], v29, v30, v31, v32);
    sendLaterQueryCreator = v16->_sendLaterQueryCreator;
    v16->_sendLaterQueryCreator = (EDQueryCreator *)v26;

    [v11 registerMessageChangeHookResponder:v16];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __105__EDSendLaterUpdateController_initWithHookRegistry_messagePersistence_outgoingRepository_alarmScheduler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _alarmFired];
}

- (NSDate)nextAlarmDate
{
  v2 = [(EDSendLaterUpdateController *)self alarmDateProvider];
  id v3 = [v2 nextDate];

  return (NSDate *)v3;
}

- (void)setNextAlarmDate:(id)a3
{
  id v5 = a3;
  v4 = [(EDSendLaterUpdateController *)self alarmDateProvider];
  [v4 setNextDate:v5];
}

- (void)_alarmFired
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_alarmQueue);
  id v33 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  v34 = objc_msgSend(v3, "ef_dateWithTruncatedSeconds");

  uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_dateHoursAgo:", 12);
  v4 = [(EDSendLaterUpdateController *)self nextAlarmDate];
  if (objc_msgSend(v4, "ef_isLaterThanDate:", v29))
  {
    id v5 = [(EDSendLaterUpdateController *)self nextAlarmDate];
    int v6 = objc_msgSend(v5, "ef_isEarlierThanDate:", v34);

    if (v6)
    {
      uint64_t v7 = [(EDSendLaterUpdateController *)self nextAlarmDate];

      v8 = +[EDSendLaterUpdateController log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v46 = v7;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Send later alarm time has passed already, but is within the allowed delivery window. Send Later original date : %{public}@", buf, 0xCu);
      }

      v34 = (void *)v7;
    }
  }
  else
  {
  }
  v9 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v30 = objc_msgSend(v9, "ef_dateWithTruncatedSeconds");

  v32 = [v33 dateByAddingUnit:64 value:1 toDate:v30 options:0];
  v10 = +[EDSendLaterUpdateController log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v46 = (uint64_t)v34;
    __int16 v47 = 2114;
    v48 = v32;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Send later alarm fired. Send Later messages query start date: %{public}@ and end date:%{public}@", buf, 0x16u);
  }

  id v11 = [(EDSendLaterUpdateController *)self sendLaterQueryCreator];
  v31 = [v11 queryWithStartDate:v34 endDate:v32];

  id v12 = [(EDSendLaterUpdateController *)self messagePersistence];
  v28 = [v12 persistedMessagesMatchingQuery:v31 limit:0x7FFFFFFFFFFFFFFFLL];

  id v13 = +[EDSendLaterUpdateController log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v28 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v46 = v14;
    _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Send later alarm fired. Preparing %lu messages", buf, 0xCu);
  }

  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v28;
  uint64_t v15 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v41;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * v17);
        v19 = [(EDSendLaterUpdateController *)self outgoingRepository];
        dispatch_queue_t v20 = [v19 outgoingMessageFromPersistedMessage:v18];

        v21 = [(EDSendLaterUpdateController *)self outgoingRepository];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __42__EDSendLaterUpdateController__alarmFired__block_invoke;
        v37[3] = &unk_1E6C06350;
        id v38 = v36;
        uint64_t v39 = v18;
        [v21 deliverMessage:v20 usingMailDrop:0 isCancelable:0 completion:v37];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v15);
  }

  uint64_t v22 = [(EDSendLaterUpdateController *)self outgoingRepository];
  v23 = [v22 messageChangeManager];
  [v23 deleteMessages:obj];

  v24 = [v33 dateByAddingUnit:64 value:1 toDate:v34 options:0];
  [(EDSendLaterUpdateController *)self setNextAlarmDate:v24];

  v25 = +[EDSendLaterUpdateController log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = [v36 count];
    v27 = [(EDSendLaterUpdateController *)self nextAlarmDate];
    *(_DWORD *)buf = 134218242;
    uint64_t v46 = v26;
    __int16 v47 = 2114;
    v48 = v27;
    _os_log_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_DEFAULT, "Finished sending send later messages. %lu failed. Next alarm date: %{public}@", buf, 0x16u);
  }
  [(EDSendLaterUpdateController *)self _updateAlarmUpdatedMessages:0 sendLaterDate:0];
}

void __42__EDSendLaterUpdateController__alarmFired__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 status];
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    id v5 = +[EDSendLaterUpdateController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = [v3 error];
      uint64_t v7 = objc_msgSend(v6, "ef_publicDescription");
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 2048;
      uint64_t v11 = v4;
      _os_log_error_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_ERROR, "Error sending an email from mail: %{public}@, delivery status: %ld", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    id v5 = +[EDSendLaterUpdateController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully sent message", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)_updateAlarmUpdatedMessages:(id)a3 sendLaterDate:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = +[EDSendLaterUpdateController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 134218242;
    uint64_t v30 = [v6 count];
    __int16 v31 = 2114;
    id v32 = v7;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Schedule %lu messages for %{public}@", (uint8_t *)&v29, 0x16u);
  }

  v9 = [(EDSendLaterUpdateController *)self nextAlarmDate];
  __int16 v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1C9C8] now];
  }
  uint64_t v12 = v11;

  id v13 = +[EDSendLaterUpdateController log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138543362;
    uint64_t v30 = (uint64_t)v12;
    _os_log_impl(&dword_1DB39C000, v13, OS_LOG_TYPE_DEFAULT, "Updated start date: %{public}@", (uint8_t *)&v29, 0xCu);
  }

  uint64_t v14 = [(EDSendLaterUpdateController *)self sendLaterQueryCreator];
  uint64_t v15 = [v14 queryWithStartDate:v12 endDate:0];

  uint64_t v16 = [(EDSendLaterUpdateController *)self messagePersistence];
  uint64_t v17 = [v16 persistedMessagesMatchingQuery:v15 limit:1];

  uint64_t v18 = +[EDSendLaterUpdateController log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v17 count];
    int v29 = 134217984;
    uint64_t v30 = v19;
    _os_log_impl(&dword_1DB39C000, v18, OS_LOG_TYPE_DEFAULT, "Queried messages count: %lu", (uint8_t *)&v29, 0xCu);
  }

  if ([v17 count])
  {
    dispatch_queue_t v20 = [v17 firstObject];
    v21 = [v20 sendLaterDate];
  }
  else
  {
    v21 = 0;
  }
  uint64_t v22 = +[EDSendLaterUpdateController log];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138543362;
    uint64_t v30 = (uint64_t)v21;
    _os_log_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEFAULT, "Earliest message send later date: %{public}@", (uint8_t *)&v29, 0xCu);
  }

  uint64_t v23 = [v6 count];
  if (v7 && v23)
  {
    v24 = +[EDSendLaterUpdateController log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138543618;
      uint64_t v30 = (uint64_t)v21;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_1DB39C000, v24, OS_LOG_TYPE_DEFAULT, "Current earliest message send later date:%{public}@ and send later date:%{public}@", (uint8_t *)&v29, 0x16u);
    }

    if (!v21 || objc_msgSend(v7, "ef_isEarlierThanDate:", v21))
    {
      id v25 = v6;

      id v26 = v7;
      uint64_t v17 = v25;
      v21 = v26;
    }
  }
  v27 = [(EDSendLaterUpdateController *)self xpcAlarm];
  [v27 setNextFireDate:v21 isUserVisible:1];

  v28 = +[EDSendLaterUpdateController log];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138543362;
    uint64_t v30 = (uint64_t)v21;
    _os_log_impl(&dword_1DB39C000, v28, OS_LOG_TYPE_DEFAULT, "After scheduling xpc alarm at: %{public}@", (uint8_t *)&v29, 0xCu);
  }

  [(EDSendLaterUpdateController *)self setNextAlarmDate:v21];
}

- (void)resetSendLaterAlarmIfNeeded
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(EDSendLaterUpdateController *)self alarmDateProvider];
  uint64_t v4 = [v3 nextDate];

  id v5 = +[EDSendLaterUpdateController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Next alarm date from EDDefaultSendLaterUpdateControllerAlarmDateProvider: %{public}@.", (uint8_t *)&v8, 0xCu);
  }

  if (v4)
  {
    id v6 = +[EDSendLaterUpdateController log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Reset send later next alarm to %{public}@.", (uint8_t *)&v8, 0xCu);
    }

    id v7 = [(EDSendLaterUpdateController *)self xpcAlarm];
    [v7 setNextFireDate:v4 isUserVisible:1];
  }
}

- (void)persistenceDidUpdateSendLaterDate:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  alarmQueue = self->_alarmQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__EDSendLaterUpdateController_persistenceDidUpdateSendLaterDate_messages_generationWindow___block_invoke;
  block[3] = &unk_1E6BFF7A8;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(alarmQueue, block);
}

void __91__EDSendLaterUpdateController_persistenceDidUpdateSendLaterDate_messages_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) nextAlarmDate];
  id v3 = +[EDSendLaterUpdateController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = (uint64_t)v2;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "After persistence updated. Current next alarm date: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  if (!v2 || !*(void *)(a1 + 40) || (objc_msgSend(v2, "isEqualToDate:") & 1) == 0)
  {
    uint64_t v4 = +[EDSendLaterUpdateController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 48) count];
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 134218242;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Send later alarm needs update for %lu messages. New date:%{public}@", (uint8_t *)&v7, 0x16u);
    }

    [*(id *)(a1 + 32) _updateAlarmUpdatedMessages:*(void *)(a1 + 48) sendLaterDate:*(void *)(a1 + 40)];
  }
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDOutgoingMessageRepository)outgoingRepository
{
  return self->_outgoingRepository;
}

- (EDMessageChangeHookResponder)hookResponder
{
  return self->_hookResponder;
}

- (EDQueryCreator)sendLaterQueryCreator
{
  return self->_sendLaterQueryCreator;
}

- (void)setSendLaterQueryCreator:(id)a3
{
}

- (EDSendLaterUpdateControllerAlarmDateProvider)alarmDateProvider
{
  return self->_alarmDateProvider;
}

- (EFXPCAlarm)xpcAlarm
{
  return self->_xpcAlarm;
}

- (void)setXpcAlarm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcAlarm, 0);
  objc_storeStrong((id *)&self->_alarmDateProvider, 0);
  objc_storeStrong((id *)&self->_sendLaterQueryCreator, 0);
  objc_storeStrong((id *)&self->_hookResponder, 0);
  objc_storeStrong((id *)&self->_outgoingRepository, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);

  objc_storeStrong((id *)&self->_alarmQueue, 0);
}

@end