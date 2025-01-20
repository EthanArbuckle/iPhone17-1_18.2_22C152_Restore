@interface FMDBluetoothDiscoveryCoordinator
- (BOOL)isDiscoveryActive;
- (FMDBluetoothDiscoveryCoordinator)initWithDiscovery:(id)a3;
- (FMDDeviceDiscovering)discovery;
- (FMDDispatchTimer)discoveryTimer;
- (NSDate)discoveryEndDate;
- (NSMutableArray)activeTokens;
- (OS_dispatch_queue)serialQueue;
- (id)didDiscoverDevice;
- (id)didEndDiscovery;
- (id)didLoseDevice;
- (id)didStartDiscovery;
- (id)newDiscovery;
- (void)didEndDiscoveryWithError:(id)a3;
- (void)discoveryRequestedStart:(id)a3;
- (void)discoveryRequestedStop:(id)a3;
- (void)scanningTimerFired;
- (void)setActiveTokens:(id)a3;
- (void)setDidDiscoverDevice:(id)a3;
- (void)setDidEndDiscovery:(id)a3;
- (void)setDidLoseDevice:(id)a3;
- (void)setDidStartDiscovery:(id)a3;
- (void)setDiscovery:(id)a3;
- (void)setDiscoveryEndDate:(id)a3;
- (void)setDiscoveryTimer:(id)a3;
- (void)setIsDiscoveryActive:(BOOL)a3;
- (void)setSerialQueue:(id)a3;
- (void)startDiscoveryTimerWithDuration:(double)a3;
- (void)updateDisccovery;
@end

@implementation FMDBluetoothDiscoveryCoordinator

- (FMDBluetoothDiscoveryCoordinator)initWithDiscovery:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FMDBluetoothDiscoveryCoordinator;
  v5 = [(FMDBluetoothDiscoveryCoordinator *)&v16 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("FMDBluetoothDiscoveryCoordinatorQueue", 0);
    [(FMDBluetoothDiscoveryCoordinator *)v5 setSerialQueue:v6];

    v7 = +[NSMutableArray array];
    [(FMDBluetoothDiscoveryCoordinator *)v5 setActiveTokens:v7];

    [(FMDBluetoothDiscoveryCoordinator *)v5 setDiscovery:v4];
    objc_initWeak(&location, v5);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100010058;
    v13[3] = &unk_100021620;
    objc_copyWeak(&v14, &location);
    [v4 setDidDiscoverDevice:v13];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000100D4;
    v11[3] = &unk_100021620;
    objc_copyWeak(&v12, &location);
    [v4 setDidLoseDevice:v11];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010150;
    v9[3] = &unk_100021648;
    objc_copyWeak(&v10, &location);
    [v4 setDidEndDiscovery:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (id)newDiscovery
{
  v3 = objc_alloc_init(FMDBluetoothDiscoveryToken);
  [(FMDBluetoothDiscoveryToken *)v3 setDelegate:self];
  id v4 = sub_100006668();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator generating token %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (void)discoveryRequestedStop:(id)a3
{
  id v4 = a3;
  v5 = sub_100006668();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator discoveryRequestedStop %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  int v6 = [(FMDBluetoothDiscoveryCoordinator *)self serialQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000103EC;
  v8[3] = &unk_1000216F0;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)discoveryRequestedStart:(id)a3
{
  id v4 = a3;
  v5 = sub_100006668();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator discoveryRequestedStart %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  int v6 = [(FMDBluetoothDiscoveryCoordinator *)self serialQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010634;
  v8[3] = &unk_1000216F0;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)didEndDiscoveryWithError:(id)a3
{
  id v4 = a3;
  v5 = sub_100006668();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator discoveryEnded - clearing tokens", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  int v6 = [(FMDBluetoothDiscoveryCoordinator *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010818;
  block[3] = &unk_100021598;
  objc_copyWeak(&v10, buf);
  dispatch_async(v6, block);

  [(FMDBluetoothDiscoveryCoordinator *)self setIsDiscoveryActive:0];
  id v7 = [(FMDBluetoothDiscoveryCoordinator *)self didEndDiscovery];

  if (v7)
  {
    v8 = [(FMDBluetoothDiscoveryCoordinator *)self didEndDiscovery];
    ((void (**)(void, id))v8)[2](v8, v4);
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)startDiscoveryTimerWithDuration:(double)a3
{
  v5 = [(FMDBluetoothDiscoveryCoordinator *)self discoveryTimer];
  [v5 cancel];

  int v6 = +[NSDate dateWithTimeIntervalSinceNow:a3];
  [(FMDBluetoothDiscoveryCoordinator *)self setDiscoveryEndDate:v6];

  objc_initWeak(&location, self);
  id v7 = [FMDDispatchTimer alloc];
  id v8 = &_dispatch_main_q;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100010A8C;
  id v14 = &unk_100021598;
  objc_copyWeak(&v15, &location);
  id v9 = [(FMDDispatchTimer *)v7 initWithQueue:&_dispatch_main_q timeout:&v11 completion:a3];
  -[FMDBluetoothDiscoveryCoordinator setDiscoveryTimer:](self, "setDiscoveryTimer:", v9, v11, v12, v13, v14);

  id v10 = [(FMDBluetoothDiscoveryCoordinator *)self discoveryTimer];
  [v10 start];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)scanningTimerFired
{
  v3 = sub_100006668();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100013638(v3);
  }

  objc_initWeak(&location, self);
  id v4 = [(FMDBluetoothDiscoveryCoordinator *)self serialQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100010BC0;
  v5[3] = &unk_100021598;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)updateDisccovery
{
  v3 = [(FMDBluetoothDiscoveryCoordinator *)self activeTokens];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(FMDBluetoothDiscoveryCoordinator *)self activeTokens];
    id v6 = [v5 sortedArrayUsingComparator:&stru_100021770];

    id v7 = sub_100006668();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      double v25 = *(double *)&v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator active tokens %@", (uint8_t *)&v24, 0xCu);
    }

    id v8 = [v6 firstObject];
    id v9 = [(FMDBluetoothDiscoveryCoordinator *)self discoveryEndDate];
    [v9 timeIntervalSinceNow];
    double v11 = v10;
    uint64_t v12 = [v8 endDate];
    [v12 timeIntervalSinceNow];
    double v14 = v13;

    id v15 = sub_100006668();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      double v25 = *(double *)&v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator updating discovery with token %@", (uint8_t *)&v24, 0xCu);
    }

    if (v14 < 0.0 || v14 > 600.0)
    {
      v22 = sub_100006668();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        double v25 = *(double *)&v8;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator discovery expired, stopping discovery %@", (uint8_t *)&v24, 0xCu);
      }

      [(FMDBluetoothDiscoveryCoordinator *)self discoveryRequestedStop:v8];
    }
    else if (v14 <= v11)
    {
      v23 = sub_100006668();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134217984;
        double v25 = v11;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator discovery already running %f", (uint8_t *)&v24, 0xCu);
      }
    }
    else
    {
      if (![(FMDBluetoothDiscoveryCoordinator *)self isDiscoveryActive])
      {
        objc_super v16 = [(FMDBluetoothDiscoveryCoordinator *)self didStartDiscovery];

        if (v16)
        {
          v17 = [(FMDBluetoothDiscoveryCoordinator *)self didStartDiscovery];
          v17[2]();
        }
      }
      v18 = sub_100006668();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134217984;
        double v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscoveryCoordinator discovery will run %f", (uint8_t *)&v24, 0xCu);
      }

      [(FMDBluetoothDiscoveryCoordinator *)self startDiscoveryTimerWithDuration:v14];
      v19 = [(FMDBluetoothDiscoveryCoordinator *)self discovery];
      [v19 startDiscovery];

      [(FMDBluetoothDiscoveryCoordinator *)self setIsDiscoveryActive:1];
    }
  }
  else
  {
    v20 = sub_100006668();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_10001367C(v20);
    }

    v21 = [(FMDBluetoothDiscoveryCoordinator *)self discovery];
    [v21 stopDiscovery];

    [(FMDBluetoothDiscoveryCoordinator *)self setIsDiscoveryActive:0];
  }
}

- (BOOL)isDiscoveryActive
{
  return self->_isDiscoveryActive;
}

- (void)setIsDiscoveryActive:(BOOL)a3
{
  self->_isDiscoveryActive = a3;
}

- (id)didEndDiscovery
{
  return self->_didEndDiscovery;
}

- (void)setDidEndDiscovery:(id)a3
{
}

- (id)didStartDiscovery
{
  return self->_didStartDiscovery;
}

- (void)setDidStartDiscovery:(id)a3
{
}

- (id)didDiscoverDevice
{
  return self->_didDiscoverDevice;
}

- (void)setDidDiscoverDevice:(id)a3
{
}

- (id)didLoseDevice
{
  return self->_didLoseDevice;
}

- (void)setDidLoseDevice:(id)a3
{
}

- (FMDDeviceDiscovering)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (NSMutableArray)activeTokens
{
  return self->_activeTokens;
}

- (void)setActiveTokens:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSDate)discoveryEndDate
{
  return self->_discoveryEndDate;
}

- (void)setDiscoveryEndDate:(id)a3
{
}

- (FMDDispatchTimer)discoveryTimer
{
  return self->_discoveryTimer;
}

- (void)setDiscoveryTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryTimer, 0);
  objc_storeStrong((id *)&self->_discoveryEndDate, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_activeTokens, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong(&self->_didLoseDevice, 0);
  objc_storeStrong(&self->_didDiscoverDevice, 0);
  objc_storeStrong(&self->_didStartDiscovery, 0);

  objc_storeStrong(&self->_didEndDiscovery, 0);
}

@end