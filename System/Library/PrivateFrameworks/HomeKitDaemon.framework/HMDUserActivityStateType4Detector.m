@interface HMDUserActivityStateType4Detector
+ (unint64_t)contributorType;
- (CLLocation)homeLocation;
- (CLRegion)region;
- (HMDLocation)location;
- (HMDUserActivityStateType4Detector)initWithDataSource:(id)a3;
- (HMDUserActivityStateType4Detector)initWithDataSource:(id)a3 location:(id)a4;
- (int64_t)locationAuthorization;
- (unint64_t)_userType4StateFromRegionState:(int64_t)a3;
- (unint64_t)state;
- (void)_handleHomeLocationChangedNotification:(id)a3;
- (void)_handleLocationAuthorizationChangedNotification:(id)a3;
- (void)_registerForMessages;
- (void)_updateLocationAuthorization:(int64_t)a3 withReason:(unint64_t)a4 notifyDelegate:(BOOL)a5;
- (void)_updateState:(unint64_t)a3 withReason:(unint64_t)a4 notifyDelegate:(BOOL)a5;
- (void)configureWithCompletion:(id)a3;
- (void)deregisterForRegionUpdates;
- (void)didDetermineState:(int64_t)a3 forRegion:(id)a4;
- (void)registerForRegionUpdates;
- (void)setHomeLocation:(id)a3;
- (void)setLocationAuthorization:(int64_t)a3;
- (void)setRegion:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation HMDUserActivityStateType4Detector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_homeLocation, 0);
}

- (void)setRegion:(id)a3
{
}

- (CLRegion)region
{
  return self->_region;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setLocationAuthorization:(int64_t)a3
{
  self->_locationAuthorization = a3;
}

- (int64_t)locationAuthorization
{
  return self->_locationAuthorization;
}

- (HMDLocation)location
{
  return self->_location;
}

- (void)setHomeLocation:(id)a3
{
}

- (CLLocation)homeLocation
{
  return self->_homeLocation;
}

- (unint64_t)_userType4StateFromRegionState:(int64_t)a3
{
  unint64_t v3 = 2;
  if (a3 != 2) {
    unint64_t v3 = 3;
  }
  if (a3) {
    return v3;
  }
  else {
    return 4;
  }
}

- (void)didDetermineState:(int64_t)a3 forRegion:(id)a4
{
  id v6 = a4;
  v7 = [(HMDUserActivityStateDetector *)self dataSource];
  v8 = [v7 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__HMDUserActivityStateType4Detector_didDetermineState_forRegion___block_invoke;
  block[3] = &unk_264A2E458;
  block[4] = self;
  id v11 = v6;
  int64_t v12 = a3;
  id v9 = v6;
  dispatch_async(v8, block);
}

void __65__HMDUserActivityStateType4Detector_didDetermineState_forRegion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) region];
  if (v2)
  {
    id v8 = v2;
    unint64_t v3 = [*(id *)(a1 + 40) identifier];
    v4 = [v8 identifier];
    int v5 = [v3 isEqualToString:v4];

    v2 = v8;
    if (v5)
    {
      uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_userType4StateFromRegionState:", objc_msgSend(MEMORY[0x263F00A60], "hm_hmdRegionStateFromCLRegionState:", *(void *)(a1 + 48)));
      if ([*(id *)(a1 + 32) state])
      {
        if ([*(id *)(a1 + 32) state] == 1)
        {
          uint64_t v7 = 4;
        }
        else if ([*(id *)(a1 + 32) state] == 4)
        {
          uint64_t v7 = 4;
        }
        else
        {
          uint64_t v7 = 11;
        }
      }
      else
      {
        uint64_t v7 = 1;
      }
      [*(id *)(a1 + 32) _updateState:v6 withReason:v7 notifyDelegate:1];
      v2 = v8;
    }
  }
}

- (void)_handleHomeLocationChangedNotification:(id)a3
{
  v4 = [(HMDUserActivityStateDetector *)self dataSource];
  int v5 = [v4 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__HMDUserActivityStateType4Detector__handleHomeLocationChangedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __76__HMDUserActivityStateType4Detector__handleHomeLocationChangedNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataSource];
  unint64_t v3 = [v2 home];
  v4 = [v3 homeLocationHandler];
  int v5 = [v4 location];
  [*(id *)(a1 + 32) setHomeLocation:v5];

  [*(id *)(a1 + 32) deregisterForRegionUpdates];
  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 registerForRegionUpdates];
}

- (void)_handleLocationAuthorizationChangedNotification:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDUserActivityStateDetector *)self dataSource];
  uint64_t v6 = [v5 queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__HMDUserActivityStateType4Detector__handleLocationAuthorizationChangedNotification___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __85__HMDUserActivityStateType4Detector__handleLocationAuthorizationChangedNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) userInfo];
  objc_msgSend(v2, "hmf_numberForKey:", @"HMDLocationAuthorizationKey");
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v3 = v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateLocationAuthorization:withReason:notifyDelegate:", objc_msgSend(v4, "integerValue"), 4, 1);
    unint64_t v3 = v4;
  }
}

- (void)_updateState:(unint64_t)a3 withReason:(unint64_t)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = [(HMDUserActivityStateDetector *)self dataSource];
  v10 = [v9 queue];
  dispatch_assert_queue_V2(v10);

  if ([(HMDUserActivityStateType4Detector *)self state] != a3)
  {
    [(HMDUserActivityStateType4Detector *)self setState:a3];
    switch([(HMDUserActivityStateType4Detector *)self state])
    {
      case 0uLL:
      case 4uLL:
        return;
      case 1uLL:
        v15 = objc_alloc_init(HMDUserActivityReportUnsetValue);
        [(HMDUserActivityStateDetector *)self setLatestReport:v15];
        goto LABEL_5;
      case 2uLL:
      case 3uLL:
        id v11 = [HMDUserActivityType4Report alloc];
        int64_t v12 = [(HMDUserActivityStateDetector *)self dataSource];
        v13 = [v12 home];
        v14 = [v13 currentUser];
        v15 = [(HMDUserActivityType4Report *)v11 initWithUser:v14 state:[(HMDUserActivityStateType4Detector *)self state] withReason:a4];

        v16 = [[HMDUserActivityReportSetValue alloc] initWithReport:v15];
        [(HMDUserActivityStateDetector *)self setLatestReport:v16];

LABEL_5:
        goto LABEL_6;
      default:
LABEL_6:
        if (v5)
        {
          v17 = [(HMDUserActivityStateDetector *)self latestReport];

          if (v17)
          {
            [(HMDUserActivityStateDetector *)self notifyDetectorStateChangedWithReason:a4];
          }
        }
        break;
    }
  }
}

- (void)_updateLocationAuthorization:(int64_t)a3 withReason:(unint64_t)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = [(HMDUserActivityStateDetector *)self dataSource];
  v10 = [v9 queue];
  dispatch_assert_queue_V2(v10);

  if ([(HMDUserActivityStateType4Detector *)self locationAuthorization] != a3)
  {
    [(HMDUserActivityStateType4Detector *)self setLocationAuthorization:a3];
    int64_t v11 = [(HMDUserActivityStateType4Detector *)self locationAuthorization];
    switch(v11)
    {
      case 2:
        [(HMDUserActivityStateType4Detector *)self _updateState:1 withReason:a4 notifyDelegate:v5];
        [(HMDUserActivityStateType4Detector *)self deregisterForRegionUpdates];
        break;
      case 1:
        [(HMDUserActivityStateType4Detector *)self registerForRegionUpdates];
        break;
      case 0:
        [(HMDUserActivityStateType4Detector *)self _updateState:4 withReason:a4 notifyDelegate:v5];
        break;
    }
  }
}

- (void)_registerForMessages
{
  unint64_t v3 = [(HMDUserActivityStateDetector *)self dataSource];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  BOOL v5 = [(HMDUserActivityStateDetector *)self dataSource];
  uint64_t v6 = [v5 notificationCenter];
  [v6 addObserver:self selector:sel__handleLocationAuthorizationChangedNotification_ name:@"HMDLocationAuthorizationChangedNotification" object:0];

  id v11 = [(HMDUserActivityStateDetector *)self dataSource];
  id v7 = [v11 notificationCenter];
  id v8 = [(HMDUserActivityStateDetector *)self dataSource];
  id v9 = [v8 home];
  v10 = [v9 homeLocationHandler];
  [v7 addObserver:self selector:sel__handleHomeLocationChangedNotification_ name:@"HMDLocationForHomeChanged" object:v10];
}

- (void)deregisterForRegionUpdates
{
  v9[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HMDUserActivityStateDetector *)self dataSource];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  BOOL v5 = [(HMDUserActivityStateType4Detector *)self region];
  if (v5)
  {
    uint64_t v6 = [(HMDUserActivityStateType4Detector *)self location];
    v9[0] = v5;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __63__HMDUserActivityStateType4Detector_deregisterForRegionUpdates__block_invoke;
    v8[3] = &unk_264A2F3E8;
    v8[4] = self;
    [v6 deregisterForRegionUpdate:v7 completionHandler:v8];

    [(HMDUserActivityStateType4Detector *)self setRegion:0];
  }
}

- (void)registerForRegionUpdates
{
  v21[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HMDUserActivityStateDetector *)self dataSource];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  BOOL v5 = [(HMDUserActivityStateType4Detector *)self region];
  if (!v5)
  {
    uint64_t v6 = [(HMDUserActivityStateType4Detector *)self homeLocation];
    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x263F00A28]);
      [v6 coordinate];
      double v9 = v8;
      double v11 = v10;
      int64_t v12 = [MEMORY[0x263F08C38] UUID];
      v13 = [v12 UUIDString];
      v14 = objc_msgSend(v7, "initWithCenter:radius:identifier:nearbyAllowed:", v13, 0, v9, v11, 321869.0);
      [(HMDUserActivityStateType4Detector *)self setRegion:v14];

      v15 = [(HMDUserActivityStateType4Detector *)self region];
      [v15 setNotifyOnExit:1];

      v16 = [(HMDUserActivityStateType4Detector *)self region];
      [v16 setNotifyOnEntry:1];

      v17 = [(HMDUserActivityStateType4Detector *)self location];
      v18 = [(HMDUserActivityStateType4Detector *)self region];
      v21[0] = v18;
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __61__HMDUserActivityStateType4Detector_registerForRegionUpdates__block_invoke;
      v20[3] = &unk_264A2F3E8;
      v20[4] = self;
      [v17 registerForRegionUpdate:v19 withDelegate:self completionHandler:v20];
    }
  }
}

- (void)configureWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDUserActivityStateDetector *)self dataSource];
  uint64_t v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(HMDUserActivityStateDetector *)self dataSource];
  double v8 = [v7 home];
  double v9 = [v8 homeLocationHandler];
  double v10 = [v9 location];
  homeLocation = self->_homeLocation;
  self->_homeLocation = v10;

  [(HMDUserActivityStateType4Detector *)self _registerForMessages];
  int64_t v12 = [(HMDUserActivityStateType4Detector *)self location];
  -[HMDUserActivityStateType4Detector _updateLocationAuthorization:withReason:notifyDelegate:](self, "_updateLocationAuthorization:withReason:notifyDelegate:", [v12 locationAuthorized], 1, 0);

  v14 = _Block_copy(v4);
  v13 = v14;
  if (v14)
  {
    (*((void (**)(void *))v14 + 2))(v14);
    v13 = v14;
  }
}

- (HMDUserActivityStateType4Detector)initWithDataSource:(id)a3 location:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDUserActivityStateType4Detector;
  double v8 = [(HMDUserActivityStateDetector *)&v11 initWithDataSource:a3];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_location, a4);
    v9->_locationAuthorization = 0;
    v9->_state = 0;
  }

  return v9;
}

- (HMDUserActivityStateType4Detector)initWithDataSource:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[HMDLocation sharedManager];
  uint64_t v6 = [(HMDUserActivityStateType4Detector *)self initWithDataSource:v4 location:v5];

  return v6;
}

+ (unint64_t)contributorType
{
  return 4;
}

@end