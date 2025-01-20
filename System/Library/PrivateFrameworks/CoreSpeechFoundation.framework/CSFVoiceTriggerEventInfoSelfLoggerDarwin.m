@interface CSFVoiceTriggerEventInfoSelfLoggerDarwin
- (CSFCircularEventsCacheBuffer)cancelledEvents;
- (CSFCircularEventsCacheBuffer)firstPassEvents;
- (CSFCircularEventsCacheBuffer)rejectEvents;
- (CSFVoiceTriggerEventInfoSelfLoggerDarwin)init;
- (OS_dispatch_queue)queue;
- (void)fetchAndClearCachedVoiceTriggerEventsWithCompletion:(id)a3;
- (void)logCancelledEventWithMHUUID:(id)a3;
- (void)logRejectEventWithVTEI:(id)a3 withMHUUID:(id)a4 withSecondPassResult:(unint64_t)a5;
- (void)logStartEventWithFirstPassStartedInfo:(id)a3 withMHUUID:(id)a4;
- (void)setCancelledEvents:(id)a3;
- (void)setFirstPassEvents:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRejectEvents:(id)a3;
@end

@implementation CSFVoiceTriggerEventInfoSelfLoggerDarwin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelledEvents, 0);
  objc_storeStrong((id *)&self->_rejectEvents, 0);
  objc_storeStrong((id *)&self->_firstPassEvents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setCancelledEvents:(id)a3
{
}

- (CSFCircularEventsCacheBuffer)cancelledEvents
{
  return self->_cancelledEvents;
}

- (void)setRejectEvents:(id)a3
{
}

- (CSFCircularEventsCacheBuffer)rejectEvents
{
  return self->_rejectEvents;
}

- (void)setFirstPassEvents:(id)a3
{
}

- (CSFCircularEventsCacheBuffer)firstPassEvents
{
  return self->_firstPassEvents;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)logCancelledEventWithMHUUID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__CSFVoiceTriggerEventInfoSelfLoggerDarwin_logCancelledEventWithMHUUID___block_invoke;
    v7[3] = &unk_1E6201030;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __72__CSFVoiceTriggerEventInfoSelfLoggerDarwin_logCancelledEventWithMHUUID___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) cancelledEvents];
  v2 = [*(id *)(a1 + 40) UUIDString];
  [v3 addEventToCacheBuffer:v2];
}

- (void)logRejectEventWithVTEI:(id)a3 withMHUUID:(id)a4 withSecondPassResult:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __99__CSFVoiceTriggerEventInfoSelfLoggerDarwin_logRejectEventWithVTEI_withMHUUID_withSecondPassResult___block_invoke;
    v12[3] = &unk_1E6200E68;
    id v13 = v8;
    v15 = self;
    unint64_t v16 = a5;
    id v14 = v10;
    dispatch_async(queue, v12);
  }
}

void __99__CSFVoiceTriggerEventInfoSelfLoggerDarwin_logRejectEventWithVTEI_withMHUUID_withSecondPassResult___block_invoke(uint64_t a1)
{
  id v5 = (id)[*(id *)(a1 + 32) mutableCopy];
  v2 = [*(id *)(a1 + 40) UUIDString];
  [v5 setValue:v2 forKey:@"kCSFSelfLoggingMHUUID"];

  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  [v5 setValue:v3 forKey:@"kCSFSelfLoggingSecondPassResult"];

  id v4 = [*(id *)(a1 + 48) rejectEvents];
  [v4 addEventToCacheBuffer:v5];
}

- (void)logStartEventWithFirstPassStartedInfo:(id)a3 withMHUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__CSFVoiceTriggerEventInfoSelfLoggerDarwin_logStartEventWithFirstPassStartedInfo_withMHUUID___block_invoke;
    block[3] = &unk_1E6200E38;
    id v11 = v6;
    id v12 = v8;
    id v13 = self;
    dispatch_async(queue, block);
  }
}

void __93__CSFVoiceTriggerEventInfoSelfLoggerDarwin_logStartEventWithFirstPassStartedInfo_withMHUUID___block_invoke(id *a1)
{
  id v4 = (id)[a1[4] mutableCopy];
  v2 = [a1[5] UUIDString];
  [v4 setValue:v2 forKey:@"kCSFSelfLoggingMHUUID"];

  id v3 = [a1[6] firstPassEvents];
  [v3 addEventToCacheBuffer:v4];
}

- (void)fetchAndClearCachedVoiceTriggerEventsWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__CSFVoiceTriggerEventInfoSelfLoggerDarwin_fetchAndClearCachedVoiceTriggerEventsWithCompletion___block_invoke;
  v7[3] = &unk_1E62012B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __96__CSFVoiceTriggerEventInfoSelfLoggerDarwin_fetchAndClearCachedVoiceTriggerEventsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) firstPassEvents];
    id v4 = [v3 eventsArray];
    id v5 = [*(id *)(a1 + 32) rejectEvents];
    id v6 = [v5 eventsArray];
    id v7 = [*(id *)(a1 + 32) cancelledEvents];
    id v8 = [v7 eventsArray];
    (*(void (**)(uint64_t, void *, void *, void *))(v2 + 16))(v2, v4, v6, v8);
  }
  id v9 = [*(id *)(a1 + 32) firstPassEvents];
  [v9 clearBuffer];

  v10 = [*(id *)(a1 + 32) rejectEvents];
  [v10 clearBuffer];

  id v11 = [*(id *)(a1 + 32) cancelledEvents];
  [v11 clearBuffer];
}

- (CSFVoiceTriggerEventInfoSelfLoggerDarwin)init
{
  if (+[CSUtils isDarwinOS])
  {
    v15.receiver = self;
    v15.super_class = (Class)CSFVoiceTriggerEventInfoSelfLoggerDarwin;
    id v3 = [(CSFVoiceTriggerEventInfoSelfLoggerDarwin *)&v15 init];
    if (v3)
    {
      id v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
      dispatch_queue_t v5 = dispatch_queue_create("CSFVoiceTriggerEventInfoSelfLoggerDarwin Queue", v4);
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v5;

      id v7 = objc_alloc_init(CSFCircularEventsCacheBuffer);
      firstPassEvents = v3->_firstPassEvents;
      v3->_firstPassEvents = v7;

      id v9 = objc_alloc_init(CSFCircularEventsCacheBuffer);
      rejectEvents = v3->_rejectEvents;
      v3->_rejectEvents = v9;

      id v11 = objc_alloc_init(CSFCircularEventsCacheBuffer);
      cancelledEvents = v3->_cancelledEvents;
      v3->_cancelledEvents = v11;
    }
    self = v3;
    id v13 = self;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

@end