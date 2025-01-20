@interface GTPMController
+ (id)stateFromWeightedAverage:(double)a3;
- (BOOL)serviceLaunched;
- (GTPMController)initWithGPUFamily:(id)a3;
- (NSXPCConnection)connectionToService;
- (double)getStateOccupancy;
- (void)_initGTPM;
- (void)clearStateOccupancy;
- (void)setConnectionToService:(id)a3;
- (void)setPerfState:(id)a3;
- (void)tearDown;
@end

@implementation GTPMController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_perfState, 0);

  objc_storeStrong((id *)&self->_gpuFamily, 0);
}

- (void)setConnectionToService:(id)a3
{
}

- (NSXPCConnection)connectionToService
{
  return self->_connectionToService;
}

- (double)getStateOccupancy
{
  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  unint64_t v16 = 0xBFF0000000000000;
  if ([(GTPMController *)self serviceLaunched])
  {
    objc_initWeak(&location, self);
    sleep(1u);
    connectionToService = self->_connectionToService;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __35__GTPMController_getStateOccupancy__block_invoke;
    v11[3] = &unk_746638;
    v11[4] = self;
    v4 = [(NSXPCConnection *)connectionToService remoteObjectProxyWithErrorHandler:v11];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __35__GTPMController_getStateOccupancy__block_invoke_2;
    v9[3] = &unk_746758;
    objc_copyWeak(&v10, &location);
    v9[4] = &v13;
    [v4 getOccupancyWithReply:v9];

    semaphore = self->_semaphore;
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(semaphore, v6);
    double v7 = v14[3];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    double v7 = v14[3];
  }
  _Block_object_dispose(&v13, 8);
  return v7;
}

intptr_t __35__GTPMController_getStateOccupancy__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(@"Can't Invoke Remote Object %@", a2);
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);

  return dispatch_semaphore_signal(v3);
}

void __35__GTPMController_getStateOccupancy__block_invoke_2(uint64_t a1, int a2, double a3)
{
  WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2) {
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    }
    double v7 = WeakRetained;
    dispatch_semaphore_signal(WeakRetained[4]);
    WeakRetained = v7;
  }
}

- (void)clearStateOccupancy
{
  if ([(GTPMController *)self serviceLaunched])
  {
    objc_initWeak(&location, self);
    connectionToService = self->_connectionToService;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __37__GTPMController_clearStateOccupancy__block_invoke;
    v9[3] = &unk_746638;
    v9[4] = self;
    v4 = [(NSXPCConnection *)connectionToService remoteObjectProxyWithErrorHandler:v9];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __37__GTPMController_clearStateOccupancy__block_invoke_2;
    v7[3] = &unk_746730;
    objc_copyWeak(&v8, &location);
    [v4 clearOccupancyWithReply:v7];

    semaphore = self->_semaphore;
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(semaphore, v6);
    NSLog(@"Occupancy Cleared semaphore");
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

intptr_t __37__GTPMController_clearStateOccupancy__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(@"Can't Invoke Remote Object %@", a2);
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);

  return dispatch_semaphore_signal(v3);
}

void __37__GTPMController_clearStateOccupancy__block_invoke_2(uint64_t a1)
{
  WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    dispatch_semaphore_signal(WeakRetained[4]);
    WeakRetained = v2;
  }
}

- (void)setPerfState:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(GTPMController *)self serviceLaunched])
    {
      id v5 = [v4 integerValue];
      if ((uint64_t)v5 >= 1)
      {
        int v6 = (int)v5;
        objc_initWeak(&location, self);
        connectionToService = self->_connectionToService;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = __31__GTPMController_setPerfState___block_invoke;
        v15[3] = &unk_746638;
        v15[4] = self;
        id v8 = [(NSXPCConnection *)connectionToService remoteObjectProxyWithErrorHandler:v15];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = __31__GTPMController_setPerfState___block_invoke_2;
        v11[3] = &unk_746708;
        objc_copyWeak(&v14, &location);
        id v12 = v4;
        uint64_t v13 = self;
        [v8 setState:(v6 - 1) withReply:v11];

        semaphore = self->_semaphore;
        dispatch_time_t v10 = dispatch_time(0, 10000000000);
        dispatch_semaphore_wait(semaphore, v10);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
  }
}

intptr_t __31__GTPMController_setPerfState___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(@"Can't Invoke Remote Object %@", a2);
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);

  return dispatch_semaphore_signal(v3);
}

void __31__GTPMController_setPerfState___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = [*(id *)(a1 + 32) copy];
    v3 = (void *)WeakRetained[3];
    WeakRetained[3] = v2;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 32));
  }
}

- (void)tearDown
{
  if (self && self->_connected)
  {
    self->_connected = 0;
    id v2 = [(NSXPCConnection *)self->_connectionToService remoteObjectProxyWithErrorHandler:&__block_literal_global_7361];
    [v2 setControlMode:0 withReply:&__block_literal_global_82];
  }
}

void __26__GTPMController_tearDown__block_invoke(id a1, NSError *a2)
{
}

- (BOOL)serviceLaunched
{
  if (self->_connected) {
    return 1;
  }
  if (self->_initialized) {
    return 0;
  }
  [(GTPMController *)self _initGTPM];
  return self->_connected;
}

- (void)_initGTPM
{
  self->_initialized = 1;
  if (self)
  {
    if (self->_connectionToService)
    {
      objc_initWeak(&location, self);
      connectionToService = self->_connectionToService;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = __27__GTPMController__initGTPM__block_invoke;
      v10[3] = &unk_746638;
      v10[4] = self;
      id v4 = [(NSXPCConnection *)connectionToService remoteObjectProxyWithErrorHandler:v10];
      gpuFamily = self->_gpuFamily;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = __27__GTPMController__initGTPM__block_invoke_2;
      v8[3] = &unk_746660;
      objc_copyWeak(&v9, &location);
      [v4 initGPU:gpuFamily withReply:v8];

      semaphore = self->_semaphore;
      dispatch_time_t v7 = dispatch_time(0, 10000000000);
      dispatch_semaphore_wait(semaphore, v7);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

intptr_t __27__GTPMController__initGTPM__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(@"Can't Invoke Remote Object %@", a2);
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);

  return dispatch_semaphore_signal(v3);
}

void __27__GTPMController__initGTPM__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2
      && ([WeakRetained[1] containsString:@"Intel"]
       && ([v7 containsString:@"IG"] & 1) != 0
       || [v6[1] containsString:@"AMD"]
       && [v7 containsString:@"EG"]))
    {
      *((unsigned char *)v6 + 21) = 1;
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)v6[4]);
  }
}

- (GTPMController)initWithGPUFamily:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GTPMController;
  id v5 = [(GTPMController *)&v23 init];
  if (v5)
  {
    int v6 = (NSString *)[v4 copy];
    gpuFamily = v5->_gpuFamily;
    v5->_gpuFamily = v6;

    if (([v4 containsString:@"Intel"] & 1) != 0
      || [v4 containsString:@"AMD"])
    {
      if ([v4 containsString:@"Intel"])
      {
        id v8 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.gputools.GTPMService"];
        connectionToService = v5->_connectionToService;
        v5->_connectionToService = v8;
        int v10 = 1;
        v11 = &protocolRef_GTPMServiceProtocol;
      }
      else
      {
        if (![v4 containsString:@"AMD"])
        {
LABEL_9:
          objc_initWeak(&location, v5);
          v17 = _NSConcreteStackBlock;
          uint64_t v18 = 3221225472;
          v19 = __36__GTPMController_initWithGPUFamily___block_invoke;
          v20 = &unk_746610;
          objc_copyWeak(&v21, &location);
          [(NSXPCConnection *)v5->_connectionToService setInterruptionHandler:&v17];
          [(NSXPCConnection *)v5->_connectionToService resume];
          dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
          semaphore = v5->_semaphore;
          v5->_semaphore = (OS_dispatch_semaphore *)v14;

          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
          goto LABEL_10;
        }
        id v12 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.gputools.GTAMDPMService"];
        connectionToService = v5->_connectionToService;
        v5->_connectionToService = v12;
        int v10 = 2;
        v11 = &protocolRef_GTAMDPMServiceProtocol;
      }

      uint64_t v13 = +[NSXPCInterface interfaceWithProtocol:*v11];
      [(NSXPCConnection *)v5->_connectionToService setRemoteObjectInterface:v13];

      v5->_gpuVendor = v10;
      goto LABEL_9;
    }
  }
LABEL_10:

  return v5;
}

void __36__GTPMController_initWithGPUFamily___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  NSLog(@"Service crashed, trying to restart the service %p", WeakRetained);

  v3 = objc_loadWeakRetained(v1);
  if (v3) {
    v3[10] = 0;
  }
}

+ (id)stateFromWeightedAverage:(double)a3
{
  if (a3 < -2.22044605e-16 || vabdd_f64(a3, floor(a3)) > 2.22044605e-16) {
    return @"mixed";
  }
  unsigned int v4 = (a3 + 2.22044605e-16);
  if (v4 > 2) {
    return @"none";
  }
  else {
    return off_7469A8[v4];
  }
}

@end