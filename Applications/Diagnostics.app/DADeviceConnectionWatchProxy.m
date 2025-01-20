@interface DADeviceConnectionWatchProxy
- (DADeviceConnectionWatchProxy)initWithState:(id)a3 nanoDevice:(id)a4;
- (NRActiveDeviceAssertion)activeDeviceAssertion;
- (NRDevice)nanoDevice;
- (id)destination;
- (void)connect;
- (void)dealloc;
- (void)deviceDidBecomeActive:(id)a3;
- (void)deviceDidBecomeInactive:(id)a3;
- (void)end;
- (void)quickSwitchToNRDevice:(id)a3 completion:(id)a4;
- (void)setActiveDeviceAssertion:(id)a3;
- (void)setNanoDevice:(id)a3;
- (void)start;
@end

@implementation DADeviceConnectionWatchProxy

- (DADeviceConnectionWatchProxy)initWithState:(id)a3 nanoDevice:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DADeviceConnectionWatchProxy;
  v8 = [(DADeviceConnectionIDSProxy *)&v13 initWithState:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nanoDevice, a4);
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v9 selector:"deviceDidBecomeActive:" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v9 selector:"deviceDidBecomeInactive:" name:NRPairedDeviceRegistryDeviceDidBecomeInactive object:0];
  }
  return v9;
}

- (id)destination
{
  objc_initWeak(&location, self);
  p_destination = &self->_destination;
  destination = self->_destination;
  if (!destination)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = sub_1000076DC;
    v18 = sub_1000076EC;
    id v19 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v6 = [(DADeviceConnectionIDSProxy *)self messenger];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000076F4;
    v10[3] = &unk_10014B178;
    objc_copyWeak(&v13, &location);
    v12 = &v14;
    id v7 = v5;
    v11 = v7;
    [v6 availableDestinationsWithCompletion:v10];

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)p_destination, (id)v15[5]);

    objc_destroyWeak(&v13);
    _Block_object_dispose(&v14, 8);

    destination = *p_destination;
  }
  v8 = destination;
  objc_destroyWeak(&location);

  return v8;
}

- (void)connect
{
  v3 = +[NRPairedDeviceRegistry sharedInstance];
  v4 = [v3 getActivePairedDevice];

  dispatch_semaphore_t v5 = [(DADeviceConnectionWatchProxy *)self nanoDevice];
  v6 = [v5 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned int v7 = [v6 BOOLValue];

  if (v7)
  {
    v8 = +[NRPairedDeviceRegistry sharedInstance];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000079B0;
    v14[3] = &unk_10014B1A0;
    v14[4] = self;
    v9 = [v8 getAllDevicesWithArchivedAltAccountDevicesMatching:v14];
    uint64_t v10 = [v9 firstObject];

    v4 = (void *)v10;
  }
  v11 = [(DADeviceConnectionWatchProxy *)self nanoDevice];
  unsigned int v12 = [v4 isEqual:v11];

  if (v12)
  {
    v13.receiver = self;
    v13.super_class = (Class)DADeviceConnectionWatchProxy;
    [(DADeviceConnectionIDSProxy *)&v13 connect];
  }
}

- (void)start
{
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100007BF8;
  v16[3] = &unk_10014B1C8;
  v16[4] = self;
  v3 = objc_retainBlock(v16);
  v4 = +[NRPairedDeviceRegistry sharedInstance];
  dispatch_semaphore_t v5 = [v4 getActivePairedDevice];

  v6 = [(DADeviceConnectionWatchProxy *)self nanoDevice];
  unsigned int v7 = [v6 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    v9 = +[NRPairedDeviceRegistry sharedInstance];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100007C3C;
    v15[3] = &unk_10014B1A0;
    v15[4] = self;
    uint64_t v10 = [v9 getAllDevicesWithArchivedAltAccountDevicesMatching:v15];
    uint64_t v11 = [v10 firstObject];

    dispatch_semaphore_t v5 = (void *)v11;
  }
  unsigned int v12 = [(DADeviceConnectionWatchProxy *)self nanoDevice];
  unsigned int v13 = [v5 isEqual:v12] ^ 1 | v8;

  if (v13 == 1)
  {
    uint64_t v14 = [(DADeviceConnectionWatchProxy *)self nanoDevice];
    [(DADeviceConnectionWatchProxy *)self quickSwitchToNRDevice:v14 completion:v3];
  }
  else
  {
    ((void (*)(void *, uint64_t))v3[2])(v3, 1);
  }
}

- (void)end
{
  v11.receiver = self;
  v11.super_class = (Class)DADeviceConnectionWatchProxy;
  [(DADeviceConnectionIDSProxy *)&v11 end];
  v3 = [(DADeviceConnectionWatchProxy *)self activeDeviceAssertion];

  if (v3)
  {
    v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_semaphore_t v5 = [(DADeviceConnectionWatchProxy *)self activeDeviceAssertion];
      v6 = [v5 device];
      *(_DWORD *)buf = 138412290;
      unsigned int v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating Active Device Assertion for Device: %@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    dispatch_time_t v7 = dispatch_time(0, 2000000000);
    unsigned int v8 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007E4C;
    block[3] = &unk_10014B1F0;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_after(v7, v8, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

- (void)quickSwitchToNRDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Switching to Watch: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v9 = +[NRPairedDeviceRegistry sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008114;
  v12[3] = &unk_10014B240;
  objc_copyWeak(&v15, (id *)buf);
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v9 setActivePairedDevice:v10 withActiveDeviceAssertionHandler:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)deviceDidBecomeActive:(id)a3
{
  v4 = [a3 userInfo];
  dispatch_semaphore_t v5 = [v4 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];
  id v6 = [(DADeviceConnectionWatchProxy *)self nanoDevice];
  unsigned int v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = [(DADeviceConnectionIDSProxy *)self state];
    [v8 removeErrorCode:7];
  }
}

- (void)deviceDidBecomeInactive:(id)a3
{
  v4 = [a3 userInfo];
  dispatch_semaphore_t v5 = [v4 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];
  id v6 = [(DADeviceConnectionWatchProxy *)self nanoDevice];
  unsigned int v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v11 = [(DADeviceConnectionIDSProxy *)self state];
    if ([v11 phase])
    {
      id v8 = [(DADeviceConnectionIDSProxy *)self state];
      id v9 = [v8 phase];

      if (v9 == (id)1) {
        return;
      }
      id v10 = [(DADeviceConnectionIDSProxy *)self state];
      [v10 setPhase:1];

      id v11 = [(DADeviceConnectionIDSProxy *)self state];
      [v11 addErrorCode:7 userInfo:0];
    }
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DADeviceConnectionWatchProxy;
  [(DADeviceConnectionWatchProxy *)&v4 dealloc];
}

- (NRDevice)nanoDevice
{
  return self->_nanoDevice;
}

- (void)setNanoDevice:(id)a3
{
}

- (NRActiveDeviceAssertion)activeDeviceAssertion
{
  return self->_activeDeviceAssertion;
}

- (void)setActiveDeviceAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDeviceAssertion, 0);
  objc_storeStrong((id *)&self->_nanoDevice, 0);

  objc_storeStrong((id *)&self->_destination, 0);
}

@end