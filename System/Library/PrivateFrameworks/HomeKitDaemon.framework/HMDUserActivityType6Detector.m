@interface HMDUserActivityType6Detector
+ (unint64_t)contributorType;
- (BOOL)_shouldSuppressCurrentStateEvent:(id)a3;
- (HMDUserActivityType6CoreLocationTracker)coreLocationTracker;
- (HMDUserActivityType6Detector)initWithDataSource:(id)a3;
- (HMDUserActivityType6Detector)initWithDataSource:(id)a3 locationManager:(id)a4;
- (HMDUserActivityType6StateEvent)previousStateEvent;
- (NSDate)reportSuppressionTimerPreviousStateEnd;
- (NSString)reportSuppressedTimerIdentifier;
- (void)_evaluateCurrentStateEvent;
- (void)configureWithCompletion:(id)a3;
- (void)handleBackgroundTaskTimerFired:(id)a3;
- (void)setCoreLocationTracker:(id)a3;
- (void)setPreviousStateEvent:(id)a3;
- (void)setReportSuppressedTimerIdentifier:(id)a3;
- (void)setReportSuppressionTimerPreviousStateEnd:(id)a3;
- (void)stateUpdated;
- (void)updateLatestReportWithReason:(unint64_t)a3;
@end

@implementation HMDUserActivityType6Detector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportSuppressionTimerPreviousStateEnd, 0);
  objc_storeStrong((id *)&self->_reportSuppressedTimerIdentifier, 0);
  objc_storeStrong((id *)&self->_previousStateEvent, 0);
  objc_storeStrong((id *)&self->_coreLocationTracker, 0);
}

- (void)setReportSuppressionTimerPreviousStateEnd:(id)a3
{
}

- (NSDate)reportSuppressionTimerPreviousStateEnd
{
  return self->_reportSuppressionTimerPreviousStateEnd;
}

- (void)setReportSuppressedTimerIdentifier:(id)a3
{
}

- (NSString)reportSuppressedTimerIdentifier
{
  return self->_reportSuppressedTimerIdentifier;
}

- (void)setPreviousStateEvent:(id)a3
{
}

- (HMDUserActivityType6StateEvent)previousStateEvent
{
  return self->_previousStateEvent;
}

- (void)setCoreLocationTracker:(id)a3
{
}

- (HMDUserActivityType6CoreLocationTracker)coreLocationTracker
{
  return self->_coreLocationTracker;
}

- (void)handleBackgroundTaskTimerFired:(id)a3
{
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"HMD.BGTM.NK"];

  v6 = [(HMDUserActivityType6Detector *)self reportSuppressedTimerIdentifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    v8 = [(HMDUserActivityStateDetector *)self dataSource];
    v9 = [v8 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__HMDUserActivityType6Detector_handleBackgroundTaskTimerFired___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = self;
    dispatch_async(v9, block);
  }
}

uint64_t __63__HMDUserActivityType6Detector_handleBackgroundTaskTimerFired___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateCurrentStateEvent];
}

- (void)stateUpdated
{
  v3 = [(HMDUserActivityStateDetector *)self dataSource];
  v4 = [v3 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__HMDUserActivityType6Detector_stateUpdated__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __44__HMDUserActivityType6Detector_stateUpdated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateCurrentStateEvent];
}

- (void)_evaluateCurrentStateEvent
{
  v3 = [(HMDUserActivityStateDetector *)self dataSource];
  v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  v5 = [(HMDUserActivityType6Detector *)self coreLocationTracker];
  id v18 = [v5 currentStateEvent];

  LODWORD(v4) = [(HMDUserActivityType6Detector *)self _shouldSuppressCurrentStateEvent:v18];
  uint64_t v6 = [(HMDUserActivityType6Detector *)self previousStateEvent];
  int v7 = (void *)v6;
  if (!v4)
  {
    if (v6)
    {
      v11 = [(HMDUserActivityType6Detector *)self previousStateEvent];
      uint64_t v12 = [v11 state];
      if (v12 == [v18 state])
      {
        v13 = [(HMDUserActivityType6Detector *)self previousStateEvent];
        v14 = [v13 stateEnd];
        v15 = [v18 stateEnd];
        char v16 = HMFEqualObjects();

        if (v16) {
          goto LABEL_12;
        }
      }
      else
      {
      }
    }
    [(HMDUserActivityType6Detector *)self setPreviousStateEvent:v18];
    goto LABEL_11;
  }
  if (!v6
    || ([(HMDUserActivityType6Detector *)self previousStateEvent],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 state],
        v8,
        v7,
        v9 == 2))
  {
    v10 = [[HMDUserActivityType6StateEvent alloc] initWithState:3 stateEnd:0 changedTimestamp:0 withReason:11];
    [(HMDUserActivityType6Detector *)self setPreviousStateEvent:v10];

LABEL_11:
    v17 = [(HMDUserActivityType6Detector *)self previousStateEvent];
    -[HMDUserActivityType6Detector updateLatestReportWithReason:](self, "updateLatestReportWithReason:", [v17 reason]);
  }
LABEL_12:
}

- (BOOL)_shouldSuppressCurrentStateEvent:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserActivityStateDetector *)self dataSource];
  uint64_t v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  if ([v4 state] != 2) {
    goto LABEL_4;
  }
  int v7 = [(HMDUserActivityStateDetector *)self dataSource];
  v8 = [v7 currentDate];

  uint64_t v9 = [v4 stateEnd];
  [v9 timeIntervalSinceDate:v8];
  double v11 = v10;

  if (v11 <= 7200.0)
  {

LABEL_4:
    uint64_t v12 = [(HMDUserActivityStateDetector *)self dataSource];
    v13 = [v12 backgroundTaskManager];
    v14 = [(HMDUserActivityType6Detector *)self reportSuppressedTimerIdentifier];
    [v13 cancelTaskWithIdentifier:v14 onObserver:self];

    [(HMDUserActivityType6Detector *)self setReportSuppressionTimerPreviousStateEnd:0];
    BOOL v15 = 0;
    goto LABEL_9;
  }
  uint64_t v16 = [(HMDUserActivityType6Detector *)self reportSuppressionTimerPreviousStateEnd];
  if (!v16) {
    goto LABEL_7;
  }
  v17 = (void *)v16;
  id v18 = [(HMDUserActivityType6Detector *)self reportSuppressionTimerPreviousStateEnd];
  v19 = [v4 stateEnd];
  char v20 = HMFEqualObjects();

  if ((v20 & 1) == 0)
  {
LABEL_7:
    v21 = [v4 stateEnd];
    [(HMDUserActivityType6Detector *)self setReportSuppressionTimerPreviousStateEnd:v21];

    v22 = [v8 dateByAddingTimeInterval:v11 + -7200.0];
    v23 = [(HMDUserActivityStateDetector *)self dataSource];
    v24 = [v23 backgroundTaskManager];
    v25 = [(HMDUserActivityType6Detector *)self reportSuppressedTimerIdentifier];
    uint64_t v27 = 0;
    [v24 scheduleTaskWithIdentifier:v25 fireDate:v22 onObserver:self selector:sel_handleBackgroundTaskTimerFired_ error:&v27];
  }
  BOOL v15 = 1;
LABEL_9:

  return v15;
}

- (void)updateLatestReportWithReason:(unint64_t)a3
{
  v5 = [(HMDUserActivityStateDetector *)self dataSource];
  uint64_t v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  int v7 = [(HMDUserActivityStateDetector *)self dataSource];
  id v19 = [v7 home];

  if (v19)
  {
    v8 = [(HMDUserActivityType6Detector *)self previousStateEvent];
    if ([v8 state] == 2)
    {
      uint64_t v9 = [(HMDUserActivityType6Detector *)self previousStateEvent];
      double v10 = [v9 stateEnd];

      if (!v10) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    double v11 = [(HMDUserActivityType6Detector *)self previousStateEvent];
    uint64_t v12 = [HMDUserActivityType6Report alloc];
    v13 = [v19 currentUser];
    uint64_t v14 = [v11 state];
    BOOL v15 = [v11 stateEnd];
    uint64_t v16 = [v11 changedTimestamp];
    v17 = [(HMDUserActivityType6Report *)v12 initWithUser:v13 state:v14 stateEnd:v15 withReason:a3 changedTimestamp:v16 lastUpdateTimestamp:0];

    id v18 = [[HMDUserActivityReportSetValue alloc] initWithReport:v17];
    [(HMDUserActivityStateDetector *)self setLatestReport:v18];

    [(HMDUserActivityStateDetector *)self notifyDetectorStateChangedWithReason:a3];
  }
LABEL_7:
}

- (void)configureWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserActivityStateDetector *)self dataSource];
  uint64_t v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  int v7 = [(HMDUserActivityType6Detector *)self coreLocationTracker];
  [v7 configureWithDelegate:self];

  v8 = [(HMDUserActivityType6Detector *)self coreLocationTracker];
  uint64_t v9 = [v8 currentStateEvent];
  [(HMDUserActivityType6Detector *)self setPreviousStateEvent:v9];

  [(HMDUserActivityType6Detector *)self updateLatestReportWithReason:1];
  double v11 = _Block_copy(v4);

  double v10 = v11;
  if (v11)
  {
    (*((void (**)(void *))v11 + 2))(v11);
    double v10 = v11;
  }
}

- (HMDUserActivityType6Detector)initWithDataSource:(id)a3 locationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMDUserActivityType6Detector;
  v8 = [(HMDUserActivityStateDetector *)&v18 initWithDataSource:v6];
  if (v8)
  {
    uint64_t v9 = [[HMDUserActivityType6CoreLocationTracker alloc] initWithDataSource:v6 locationManager:v7];
    coreLocationTracker = v8->_coreLocationTracker;
    v8->_coreLocationTracker = v9;

    double v11 = NSString;
    uint64_t v12 = [v6 home];
    v13 = [v12 uuid];
    uint64_t v14 = [v13 UUIDString];
    uint64_t v15 = [v11 stringWithFormat:@"HMDUserActivityType6Detector.ReportSuppressedTimer.%@", v14];
    reportSuppressedTimerIdentifier = v8->_reportSuppressedTimerIdentifier;
    v8->_reportSuppressedTimerIdentifier = (NSString *)v15;
  }
  return v8;
}

- (HMDUserActivityType6Detector)initWithDataSource:(id)a3
{
  id v4 = a3;
  v5 = +[HMDLocation sharedManager];
  id v6 = [(HMDUserActivityType6Detector *)self initWithDataSource:v4 locationManager:v5];

  return v6;
}

+ (unint64_t)contributorType
{
  return 3;
}

@end