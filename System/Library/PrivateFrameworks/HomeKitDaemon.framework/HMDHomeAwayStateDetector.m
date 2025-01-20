@interface HMDHomeAwayStateDetector
+ (unint64_t)contributorType;
- (HMDHomeAwayStateDetector)initWithDataSource:(id)a3;
- (unint64_t)state;
- (void)_registerForNotifications;
- (void)configureWithCompletion:(id)a3;
- (void)determineStateWithReason:(unint64_t)a3;
- (void)handleHomeLocationChanged:(id)a3;
- (void)handleLocationAuthorizationChanged:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)updateLatestReportWithReason:(unint64_t)a3;
- (void)updateState:(unint64_t)a3 withReason:(unint64_t)a4;
@end

@implementation HMDHomeAwayStateDetector

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)handleLocationAuthorizationChanged:(id)a3
{
  v4 = [(HMDUserActivityStateDetector *)self dataSource];
  v5 = [v4 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMDHomeAwayStateDetector_handleLocationAuthorizationChanged___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __63__HMDHomeAwayStateDetector_handleLocationAuthorizationChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) determineStateWithReason:4];
}

- (void)handleHomeLocationChanged:(id)a3
{
  v4 = [(HMDUserActivityStateDetector *)self dataSource];
  v5 = [v4 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HMDHomeAwayStateDetector_handleHomeLocationChanged___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __54__HMDHomeAwayStateDetector_handleHomeLocationChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) determineStateWithReason:11];
}

- (void)updateLatestReportWithReason:(unint64_t)a3
{
  v5 = [(HMDUserActivityStateDetector *)self dataSource];
  v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  if ([(HMDHomeAwayStateDetector *)self state])
  {
    if ([(HMDHomeAwayStateDetector *)self state] == 1)
    {
      v7 = objc_alloc_init(HMDUserActivityReportUnsetValue);
      [(HMDUserActivityStateDetector *)self setLatestReport:v7];
    }
    else
    {
      v8 = [HMDUserActivityHomeAwayReport alloc];
      v9 = [(HMDUserActivityStateDetector *)self dataSource];
      v10 = [v9 home];
      v11 = [v10 currentUser];
      v7 = [(HMDUserActivityHomeAwayReport *)v8 initWithUser:v11 state:[(HMDHomeAwayStateDetector *)self state] fromDevice:0 reason:a3];

      v12 = [[HMDUserActivityReportSetValue alloc] initWithReport:v7];
      [(HMDUserActivityStateDetector *)self setLatestReport:v12];
    }
    [(HMDUserActivityStateDetector *)self notifyDetectorStateChangedWithReason:a3];
  }
}

- (void)determineStateWithReason:(unint64_t)a3
{
  v5 = [(HMDUserActivityStateDetector *)self dataSource];
  v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  v7 = [(HMDUserActivityStateDetector *)self dataSource];
  v8 = [v7 location];
  uint64_t v9 = [v8 locationAuthorized];

  if (v9)
  {
    v10 = [(HMDUserActivityStateDetector *)self dataSource];
    v11 = [v10 location];
    uint64_t v12 = [v11 locationAuthorized];

    if (v12 == 1)
    {
      v13 = [(HMDUserActivityStateDetector *)self dataSource];
      v14 = [v13 home];
      uint64_t v15 = [v14 homeLocation];

      if ((unint64_t)(v15 - 1) > 2) {
        return;
      }
      uint64_t v16 = qword_2303E46A0[v15 - 1];
    }
    else
    {
      uint64_t v16 = 1;
    }
    [(HMDHomeAwayStateDetector *)self updateState:v16 withReason:a3];
  }
}

- (void)updateState:(unint64_t)a3 withReason:(unint64_t)a4
{
  v7 = [(HMDUserActivityStateDetector *)self dataSource];
  v8 = [v7 queue];
  dispatch_assert_queue_V2(v8);

  if ([(HMDHomeAwayStateDetector *)self state] != a3)
  {
    unint64_t v9 = [(HMDHomeAwayStateDetector *)self state];
    [(HMDHomeAwayStateDetector *)self setState:a3];
    if (v9) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v10 = 1;
    }
    [(HMDHomeAwayStateDetector *)self updateLatestReportWithReason:v10];
  }
}

- (void)_registerForNotifications
{
  v3 = [(HMDUserActivityStateDetector *)self dataSource];
  v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  v5 = [(HMDUserActivityStateDetector *)self dataSource];
  v6 = [v5 notificationCenter];
  v7 = [(HMDUserActivityStateDetector *)self dataSource];
  v8 = [v7 home];
  [v6 addObserver:self selector:sel_handleHomeLocationChanged_ name:@"HMDHomeLocationChangedNotification" object:v8];

  id v10 = [(HMDUserActivityStateDetector *)self dataSource];
  unint64_t v9 = [v10 notificationCenter];
  [v9 addObserver:self selector:sel_handleLocationAuthorizationChanged_ name:@"HMDLocationAuthorizationChangedNotification" object:0];
}

- (void)configureWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserActivityStateDetector *)self dataSource];
  v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  [(HMDHomeAwayStateDetector *)self _registerForNotifications];
  [(HMDHomeAwayStateDetector *)self determineStateWithReason:1];
  v8 = _Block_copy(v4);

  v7 = v8;
  if (v8)
  {
    (*((void (**)(void *))v8 + 2))(v8);
    v7 = v8;
  }
}

- (HMDHomeAwayStateDetector)initWithDataSource:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDHomeAwayStateDetector;
  result = [(HMDUserActivityStateDetector *)&v4 initWithDataSource:a3];
  if (result) {
    result->_state = 0;
  }
  return result;
}

+ (unint64_t)contributorType
{
  return 1;
}

@end