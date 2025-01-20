@interface HMDUserActivityType3Detector
+ (unint64_t)contributorType;
- (BOOL)_moveToTransitionalStateWithTransitionInterval:(double)a3;
- (BOOL)_updateState:(unint64_t)a3;
- (BOOL)_updateStateWithFocus:(id)a3;
- (BOOL)_updateStateWithTransitionTime:(id)a3;
- (BOOL)evaluate;
- (BOOL)shouldIgnoreFocus:(id)a3;
- (BOOL)shouldIgnoreSchedule:(id)a3;
- (HMDBackgroundTaskManager)backgroundTaskManager;
- (HMDUserActivityType3Detector)initWithDataSource:(id)a3;
- (HMDUserActivityType3Detector)initWithIdentifier:(id)a3 dataSource:(id)a4 focusListener:(id)a5 scheduleListener:(id)a6 backgroundTaskManager:(id)a7 preferences:(id)a8;
- (HMDUserActivityType3FocusListener)focusListener;
- (HMDUserActivityType3ScheduleListener)scheduleListener;
- (HMFPreferences)preferences;
- (NSString)identifier;
- (int64_t)transitionIntervalInSeconds;
- (unint64_t)state;
- (void)configureWithCompletion:(id)a3;
- (void)evaluateAndSetInitialReport;
- (void)evaluateAndUpdateLatestReport;
- (void)focusDidTrigger;
- (void)handleTimerFiredNotification:(id)a3;
- (void)scheduleStateDidAutomaticallyUpdate;
- (void)setPreferences:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)submitLogEventWithOldState:(unint64_t)a3 logReason:(unint64_t)a4;
- (void)updateLatestReportWithReason:(unint64_t)a3;
- (void)userDidUpdateSchedule;
@end

@implementation HMDUserActivityType3Detector

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_preferences);
  objc_storeStrong((id *)&self->_backgroundTaskManager, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scheduleListener, 0);
  objc_storeStrong((id *)&self->_focusListener, 0);
}

- (void)setPreferences:(id)a3
{
}

- (HMFPreferences)preferences
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferences);
  return (HMFPreferences *)WeakRetained;
}

- (HMDBackgroundTaskManager)backgroundTaskManager
{
  return self->_backgroundTaskManager;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (HMDUserActivityType3ScheduleListener)scheduleListener
{
  return self->_scheduleListener;
}

- (HMDUserActivityType3FocusListener)focusListener
{
  return self->_focusListener;
}

- (void)updateLatestReportWithReason:(unint64_t)a3
{
  v5 = [(HMDUserActivityStateDetector *)self dataSource];
  v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  v7 = [HMDUserActivityType3Report alloc];
  v8 = [(HMDUserActivityStateDetector *)self dataSource];
  v9 = [v8 home];
  v10 = [v9 currentUser];
  v12 = [(HMDUserActivityType3Report *)v7 initWithUser:v10 state:[(HMDUserActivityType3Detector *)self state] withReason:a3];

  v11 = [[HMDUserActivityReportSetValue alloc] initWithReport:v12];
  [(HMDUserActivityStateDetector *)self setLatestReport:v11];

  [(HMDUserActivityStateDetector *)self notifyDetectorStateChangedWithReason:a3];
}

- (void)evaluateAndUpdateLatestReport
{
  if ([(HMDUserActivityType3Detector *)self evaluate])
  {
    [(HMDUserActivityType3Detector *)self updateLatestReportWithReason:11];
  }
}

- (void)evaluateAndSetInitialReport
{
  [(HMDUserActivityType3Detector *)self evaluate];
  [(HMDUserActivityType3Detector *)self updateLatestReportWithReason:1];
}

- (void)submitLogEventWithOldState:(unint64_t)a3 logReason:(unint64_t)a4
{
  v7 = [[HMDUserActivityType3StateLogEvent alloc] initWithState:[(HMDUserActivityType3Detector *)self state] oldState:a3 logReason:a4];
  v5 = [(HMDUserActivityStateDetector *)self dataSource];
  v6 = [v5 logEventSubmitter];
  [v6 submitLogEvent:v7];
}

- (BOOL)_updateState:(unint64_t)a3
{
  unint64_t v5 = [(HMDUserActivityType3Detector *)self state];
  if (v5 != a3)
  {
    if (a3 != 3)
    {
      v6 = [(HMDUserActivityType3Detector *)self backgroundTaskManager];
      v7 = [(HMDUserActivityType3Detector *)self identifier];
      int v8 = [v6 hasOutstandingTaskWithIdentifier:v7];

      if (v8)
      {
        v9 = [(HMDUserActivityType3Detector *)self backgroundTaskManager];
        v10 = [(HMDUserActivityType3Detector *)self identifier];
        [v9 cancelTaskWithIdentifier:v10 onObserver:self];
      }
    }
    [(HMDUserActivityType3Detector *)self setState:a3];
  }
  return v5 != a3;
}

- (void)focusDidTrigger
{
  v3 = [(HMDUserActivityStateDetector *)self dataSource];
  v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  unint64_t v5 = [(HMDUserActivityType3Detector *)self focusListener];
  v9 = [v5 focus];

  unint64_t v6 = [(HMDUserActivityType3Detector *)self state];
  [(HMDUserActivityType3Detector *)self evaluateAndUpdateLatestReport];
  v7 = v9;
  if (v9)
  {
    int v8 = [v9 isUserActionTriggered];
    v7 = v9;
    if (v8)
    {
      [(HMDUserActivityType3Detector *)self submitLogEventWithOldState:v6 logReason:3];
      v7 = v9;
    }
  }
}

- (BOOL)shouldIgnoreFocus:(id)a3
{
  if (a3) {
    return [a3 isUserActionTriggered] ^ 1;
  }
  else {
    return 1;
  }
}

- (void)userDidUpdateSchedule
{
  v3 = [(HMDUserActivityStateDetector *)self dataSource];
  v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  unint64_t v5 = [(HMDUserActivityType3Detector *)self scheduleListener];
  id v7 = [v5 schedule];

  unint64_t v6 = [(HMDUserActivityType3Detector *)self state];
  [(HMDUserActivityType3Detector *)self evaluateAndUpdateLatestReport];
  if (v7) {
    [(HMDUserActivityType3Detector *)self submitLogEventWithOldState:v6 logReason:2];
  }
}

- (void)scheduleStateDidAutomaticallyUpdate
{
  v3 = [(HMDUserActivityStateDetector *)self dataSource];
  v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  unint64_t v5 = [(HMDUserActivityType3Detector *)self scheduleListener];
  id v7 = [v5 schedule];

  unint64_t v6 = [(HMDUserActivityType3Detector *)self state];
  [(HMDUserActivityType3Detector *)self evaluateAndUpdateLatestReport];
  if (v7) {
    [(HMDUserActivityType3Detector *)self submitLogEventWithOldState:v6 logReason:1];
  }
}

- (BOOL)shouldIgnoreSchedule:(id)a3
{
  id v3 = a3;
  v4 = v3;
  BOOL v5 = !v3 || ![v3 state] || objc_msgSend(v4, "stateChangedReason") == 0;

  return v5;
}

- (int64_t)transitionIntervalInSeconds
{
  v2 = [(HMDUserActivityType3Detector *)self preferences];
  id v3 = [v2 preferenceForKey:@"HMDUserActivityType3TransitionIntervalInSeconds"];
  v4 = [v3 numberValue];

  if (v4) {
    int64_t v5 = [v4 integerValue];
  }
  else {
    int64_t v5 = 1200;
  }

  return v5;
}

- (void)handleTimerFiredNotification:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(HMDUserActivityStateDetector *)self dataSource];
  unint64_t v6 = [v5 queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__HMDUserActivityType3Detector_handleTimerFiredNotification___block_invoke;
  v8[3] = &unk_264A2F820;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __61__HMDUserActivityType3Detector_handleTimerFiredNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  id v5 = [v2 objectForKeyedSubscript:@"HMD.BGTM.NK"];

  id v3 = [*(id *)(a1 + 40) identifier];
  int v4 = [v5 isEqualToString:v3];

  if (v4 && [*(id *)(a1 + 40) state] == 3) {
    [*(id *)(a1 + 40) evaluateAndUpdateLatestReport];
  }
}

- (BOOL)_moveToTransitionalStateWithTransitionInterval:(double)a3
{
  if (a3 >= 60.0) {
    double v4 = a3;
  }
  else {
    double v4 = a3 + 60.0;
  }
  id v5 = [(HMDUserActivityStateDetector *)self dataSource];
  unint64_t v6 = [v5 currentDate];
  id v7 = [v6 dateByAddingTimeInterval:v4];

  int v8 = [(HMDUserActivityType3Detector *)self backgroundTaskManager];
  id v9 = [(HMDUserActivityType3Detector *)self identifier];
  v10 = [v8 expectedFireDateForTaskWithIdentifier:v9];

  if (HMFEqualObjects())
  {
    v11 = self;
    uint64_t v12 = 3;
  }
  else
  {
    v13 = [(HMDUserActivityType3Detector *)self backgroundTaskManager];
    v14 = [(HMDUserActivityType3Detector *)self identifier];
    uint64_t v18 = 0;
    int v15 = [v13 scheduleTaskWithIdentifier:v14 fireDate:v7 onObserver:self selector:sel_handleTimerFiredNotification_ error:&v18];

    if (v15) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 2;
    }
    v11 = self;
  }
  BOOL v16 = [(HMDUserActivityType3Detector *)v11 _updateState:v12];

  return v16;
}

- (BOOL)_updateStateWithTransitionTime:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserActivityStateDetector *)self dataSource];
  unint64_t v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(HMDUserActivityStateDetector *)self dataSource];
  int v8 = [v7 currentDate];

  [v8 timeIntervalSinceDate:v4];
  double v10 = v9;

  if (v10 >= 0.0)
  {
    if (v10 >= (double)[(HMDUserActivityType3Detector *)self transitionIntervalInSeconds]) {
      BOOL v12 = [(HMDUserActivityType3Detector *)self _updateState:2];
    }
    else {
      BOOL v12 = [(HMDUserActivityType3Detector *)self _moveToTransitionalStateWithTransitionInterval:(double)[(HMDUserActivityType3Detector *)self transitionIntervalInSeconds]- v10];
    }
    BOOL v11 = v12;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_updateStateWithFocus:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  id v5 = v4;
  if (([v4 isUserActionTriggered] & 1) == 0)
  {
LABEL_8:
    _HMFPreconditionFailure();
    JUMPOUT(0x23026B254);
  }
  if ([v5 isEnabled])
  {
    unint64_t v6 = [v5 updatedTime];
    BOOL v7 = [(HMDUserActivityType3Detector *)self _updateStateWithTransitionTime:v6];
  }
  else
  {
    BOOL v7 = [(HMDUserActivityType3Detector *)self _updateState:5];
  }

  return v7;
}

- (BOOL)evaluate
{
  id v3 = [(HMDUserActivityStateDetector *)self dataSource];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HMDUserActivityType3Detector *)self focusListener];
  unint64_t v6 = [v5 focus];

  BOOL v7 = [(HMDUserActivityType3Detector *)self scheduleListener];
  int v8 = [v7 schedule];

  BOOL v9 = [(HMDUserActivityType3Detector *)self shouldIgnoreFocus:v6];
  BOOL v10 = [(HMDUserActivityType3Detector *)self shouldIgnoreSchedule:v8];
  if (v9 && v10)
  {
    BOOL v11 = self;
    uint64_t v12 = 1;
LABEL_4:
    BOOL v13 = [(HMDUserActivityType3Detector *)v11 _updateState:v12];
LABEL_10:
    BOOL v18 = v13;
LABEL_11:

    return v18;
  }
  if (v9) {
    goto LABEL_6;
  }
  if (v10) {
    goto LABEL_9;
  }
  v14 = [v8 stateChangedTime];
  int v15 = [v6 updatedTime];
  [v14 timeIntervalSinceDate:v15];
  double v17 = v16;

  if (v17 < 0.0)
  {
LABEL_9:
    BOOL v13 = [(HMDUserActivityType3Detector *)self _updateStateWithFocus:v6];
    goto LABEL_10;
  }
  if ([v8 stateChangedReason] == 2) {
    goto LABEL_6;
  }
  if ([v8 stateChangedReason] != 1)
  {
    _HMFPreconditionFailure();
    goto LABEL_22;
  }
  if (([v6 isEnabled] & 1) == 0)
  {
LABEL_6:
    BOOL v13 = [(HMDUserActivityType3Detector *)self _updateStateWithSchedule:v8];
    goto LABEL_10;
  }
  if (v17 >= 0.0)
  {
    if (v17 < (double)[(HMDUserActivityType3Detector *)self transitionIntervalInSeconds])
    {
      v20 = [v6 updatedTime];
      BOOL v18 = [(HMDUserActivityType3Detector *)self _updateStateWithTransitionTime:v20];

      goto LABEL_11;
    }
    if ([v8 state] == 3)
    {
      BOOL v11 = self;
      uint64_t v12 = 5;
    }
    else
    {
      BOOL v11 = self;
      uint64_t v12 = 2;
    }
    goto LABEL_4;
  }
LABEL_22:
  v21 = (HMDUserActivityType3Detector *)_HMFPreconditionFailure();
  [(HMDUserActivityType3Detector *)v21 configureWithCompletion:v23];
  return result;
}

- (void)configureWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserActivityStateDetector *)self dataSource];
  unint64_t v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  [(HMDUserActivityType3Detector *)self setState:1];
  BOOL v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  int v8 = [(HMDUserActivityType3Detector *)self focusListener];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56__HMDUserActivityType3Detector_configureWithCompletion___block_invoke;
  v19[3] = &unk_264A2F7F8;
  BOOL v9 = v7;
  v20 = v9;
  [v8 configureWithCompletion:v19];

  dispatch_group_enter(v9);
  BOOL v10 = [(HMDUserActivityType3Detector *)self scheduleListener];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __56__HMDUserActivityType3Detector_configureWithCompletion___block_invoke_2;
  v17[3] = &unk_264A2F7F8;
  BOOL v18 = v9;
  BOOL v11 = v9;
  [v10 configureWithCompletion:v17];

  uint64_t v12 = [(HMDUserActivityStateDetector *)self dataSource];
  BOOL v13 = [v12 queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__HMDUserActivityType3Detector_configureWithCompletion___block_invoke_3;
  v15[3] = &unk_264A2F870;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  dispatch_group_notify(v11, v13, v15);
}

void __56__HMDUserActivityType3Detector_configureWithCompletion___block_invoke(uint64_t a1)
{
}

void __56__HMDUserActivityType3Detector_configureWithCompletion___block_invoke_2(uint64_t a1)
{
}

void __56__HMDUserActivityType3Detector_configureWithCompletion___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 focusListener];
  [v3 setDelegate:v2];

  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 scheduleListener];
  [v5 setDelegate:v4];

  [*(id *)(a1 + 32) evaluateAndSetInitialReport];
  unint64_t v6 = (void (**)(void))_Block_copy(*(const void **)(a1 + 40));
  if (v6)
  {
    BOOL v7 = v6;
    v6[2]();
    unint64_t v6 = v7;
  }
}

- (HMDUserActivityType3Detector)initWithIdentifier:(id)a3 dataSource:(id)a4 focusListener:(id)a5 scheduleListener:(id)a6 backgroundTaskManager:(id)a7 preferences:(id)a8
{
  id v22 = a3;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDUserActivityType3Detector;
  BOOL v18 = [(HMDUserActivityStateDetector *)&v23 initWithDataSource:a4];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_focusListener, a5);
    objc_storeStrong((id *)&v19->_scheduleListener, a6);
    objc_storeStrong((id *)&v19->_backgroundTaskManager, a7);
    objc_storeWeak((id *)&v19->_preferences, v17);
  }

  return v19;
}

- (HMDUserActivityType3Detector)initWithDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [v4 home];
  unint64_t v6 = [v5 uuid];
  BOOL v7 = [v6 UUIDString];

  int v8 = [[HMDUserActivityType3FocusListener alloc] initWithIdentifier:v7 dataSource:v4];
  BOOL v9 = [[HMDUserActivityType3ScheduleListener alloc] initWithIdentifier:v7 dataSource:v4];
  BOOL v10 = [v4 backgroundTaskManager];
  BOOL v11 = [v4 preferences];
  uint64_t v12 = [(HMDUserActivityType3Detector *)self initWithIdentifier:v7 dataSource:v4 focusListener:v8 scheduleListener:v9 backgroundTaskManager:v10 preferences:v11];

  return v12;
}

+ (unint64_t)contributorType
{
  return 2;
}

@end