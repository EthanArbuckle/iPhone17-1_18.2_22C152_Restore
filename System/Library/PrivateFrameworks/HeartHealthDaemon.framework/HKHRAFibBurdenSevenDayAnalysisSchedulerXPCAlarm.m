@interface HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm
- (HKHRAFibBurdenSevenDayAnalysisSchedulerAlarmDelegate)delegate;
- (HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm)initWithProfile:(id)a3;
- (HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm)initWithScheduler:(id)a3 profile:(id)a4 userDefaults:(id)a5 queue:(id)a6 dateGenerator:(id)a7 shouldAutomaticallyStart:(BOOL)a8;
- (id)_determineNextEventDateComponents;
- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4;
- (void)_queue_beginReceivingAlarmEvents;
- (void)_queue_scheduleEvent;
- (void)_scheduleEventWithCompletion:(id)a3;
- (void)_stop;
- (void)_unitTest_beginReceivingAlarmEvents;
- (void)profileDidBecomeReady:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm

- (HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm)initWithProfile:(id)a3
{
  id v4 = a3;
  v5 = HKCreateSerialDispatchQueue();
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F65BE0]) initWithProfile:v4 clientIdentifier:@"HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm" eventHandlerQueue:v5];
  v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v8 = [(HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm *)self initWithScheduler:v6 profile:v4 userDefaults:v7 queue:v5 dateGenerator:&__block_literal_global_12 shouldAutomaticallyStart:1];

  return v8;
}

uint64_t __67__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm_initWithProfile___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm)initWithScheduler:(id)a3 profile:(id)a4 userDefaults:(id)a5 queue:(id)a6 dateGenerator:(id)a7 shouldAutomaticallyStart:(BOOL)a8
{
  BOOL v8 = a8;
  id v25 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm;
  v19 = [(HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_scheduler, a3);
    objc_storeWeak((id *)&v20->_profile, v15);
    objc_storeStrong((id *)&v20->_defaults, a5);
    objc_storeStrong((id *)&v20->_queue, a6);
    uint64_t v21 = MEMORY[0x1D943B130](v18);
    id dateGenerator = v20->_dateGenerator;
    v20->_id dateGenerator = (id)v21;

    if (v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v20->_profile);
      [WeakRetained registerProfileReadyObserver:v20 queue:v20->_queue];
    }
  }

  return v20;
}

- (void)profileDidBecomeReady:(id)a3
{
  [(HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm *)self _queue_beginReceivingAlarmEvents];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained database];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm_profileDidBecomeReady___block_invoke;
  v7[3] = &unk_1E69B41B8;
  v7[4] = self;
  [v5 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v7];
}

uint64_t __73__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleEventWithCompletion:0];
}

- (void)_unitTest_beginReceivingAlarmEvents
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__unitTest_beginReceivingAlarmEvents__block_invoke;
  block[3] = &unk_1E69B41B8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __86__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__unitTest_beginReceivingAlarmEvents__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__unitTest_beginReceivingAlarmEvents__block_invoke_2;
  v3[3] = &unk_1E69B4CA0;
  objc_copyWeak(&v4, &location);
  [v2 beginReceivingEventsWithHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __86__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__unitTest_beginReceivingAlarmEvents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_queue_alarm:didReceiveDueEvents:", v6, v5);
}

- (void)_stop
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = HKHRAFibBurdenLogForCategory();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

  if (v4)
  {
    id v5 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_INFO, "[%@] Stopping observation", (uint8_t *)&v6, 0xCu);
    }
  }
  [(HDRestorableAlarm *)self->_scheduler invalidate];
}

- (void)_queue_beginReceivingAlarmEvents
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  scheduler = self->_scheduler;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__queue_beginReceivingAlarmEvents__block_invoke;
  v4[3] = &unk_1E69B4CA0;
  objc_copyWeak(&v5, &location);
  [(HDRestorableAlarm *)scheduler beginReceivingEventsWithHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __83__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__queue_beginReceivingAlarmEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_queue_alarm:didReceiveDueEvents:", v6, v5);
}

- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  id v5 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = self;
    _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Alarm fired, rescheduling and firing", (uint8_t *)&v7, 0xCu);
  }

  [(HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm *)self _scheduleEventWithCompletion:0];
  id v6 = [(HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm *)self delegate];
  [v6 initialAnalysisAlarmDidFireWithAlarm:self];
}

- (void)_scheduleEventWithCompletion:(id)a3
{
  id v4 = a3;
  scheduler = self->_scheduler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__scheduleEventWithCompletion___block_invoke;
  v7[3] = &unk_1E69B4CC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HDRestorableAlarm *)scheduler checkForDueEventsWithCompletion:v7];
}

void __80__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__scheduleEventWithCompletion___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if ((a3 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v9 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __80__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__scheduleEventWithCompletion___block_invoke_cold_1(a1, (uint64_t)v8, v9);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleEvent");
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

- (void)_queue_scheduleEvent
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, a2, a3, "[%@] Error while scheduling events: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (id)_determineNextEventDateComponents
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponentsWithDefaults();
  id v4 = [v3 calendar];
  id v5 = (*((void (**)(void))self->_dateGenerator + 2))();
  id v6 = [v4 nextDateAfterDate:v5 matchingComponents:v3 options:1024];

  _HKInitializeLogging();
  id v7 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Scheduling alarm to trigger analysis at %@", (uint8_t *)&v12, 0x16u);
  }

  id v8 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  uint64_t v9 = [v8 components:252 fromDate:v6];
  [v9 setCalendar:v8];
  uint64_t v10 = [v8 timeZone];
  [v9 setTimeZone:v10];

  return v9;
}

- (HKHRAFibBurdenSevenDayAnalysisSchedulerAlarmDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (HKHRAFibBurdenSevenDayAnalysisSchedulerAlarmDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong(&self->_dateGenerator, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __80__HKHRAFibBurdenSevenDayAnalysisSchedulerXPCAlarm__scheduleEventWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138543618;
  *(void *)&void v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, a2, a3, "[%{public}@] Error checking for due events before rescheduling: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end