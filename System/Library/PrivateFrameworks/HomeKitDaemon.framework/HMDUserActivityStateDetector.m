@interface HMDUserActivityStateDetector
+ (unint64_t)contributorType;
- (HMDHomeActivityStateManagerDataSource)dataSource;
- (HMDUserActivityReportValue)latestReport;
- (HMDUserActivityStateDetector)initWithDataSource:(id)a3;
- (HMDUserActivityStateDetectorStateChangeDelegate)stateChangeDelegate;
- (void)configureWithCompletion:(id)a3;
- (void)notifyDetectorStateChangedWithReason:(unint64_t)a3;
- (void)setLatestReport:(id)a3;
- (void)setStateChangeDelegate:(id)a3;
@end

@implementation HMDUserActivityStateDetector

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateChangeDelegate);
  objc_storeStrong((id *)&self->_latestReport, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setStateChangeDelegate:(id)a3
{
}

- (HMDUserActivityStateDetectorStateChangeDelegate)stateChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateChangeDelegate);
  return (HMDUserActivityStateDetectorStateChangeDelegate *)WeakRetained;
}

- (void)setLatestReport:(id)a3
{
}

- (HMDUserActivityReportValue)latestReport
{
  return self->_latestReport;
}

- (HMDHomeActivityStateManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)notifyDetectorStateChangedWithReason:(unint64_t)a3
{
  v5 = [(HMDUserActivityStateDetector *)self dataSource];
  v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(HMDUserActivityStateDetector *)self stateChangeDelegate];
  if (v7) {
    objc_msgSend(v7, "handleStateChangeForDetectorOfType:withReason:", objc_msgSend((id)objc_opt_class(), "contributorType"), a3);
  }
}

- (void)configureWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMDUserActivityStateDetector)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDUserActivityStateDetector;
  uint64_t v6 = [(HMDUserActivityStateDetector *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

+ (unint64_t)contributorType
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end