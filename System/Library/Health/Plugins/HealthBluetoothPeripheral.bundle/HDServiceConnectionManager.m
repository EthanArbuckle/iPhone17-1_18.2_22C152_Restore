@interface HDServiceConnectionManager
- (HDServiceConnectionManager)init;
- (HDServiceConnectionManager)initWithProfile:(id)a3 serviceManager:(id)a4 btleDataCollector:(id)a5;
- (id)diagnosticDescription;
- (void)connectToService:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)disconnectFromService:(id)a3;
- (void)disconnectFromServices;
- (void)profileDidBecomeReady:(id)a3;
@end

@implementation HDServiceConnectionManager

- (HDServiceConnectionManager)initWithProfile:(id)a3 serviceManager:(id)a4 btleDataCollector:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDServiceConnectionManager;
  v11 = [(HDServiceConnectionManager *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_serviceManager, a4);
    objc_storeWeak((id *)&v12->_btleHeartRateDataCollector, v10);
    uint64_t v13 = HKCreateSerialDispatchQueue();
    deviceQueue = v12->_deviceQueue;
    v12->_deviceQueue = (OS_dispatch_queue *)v13;

    *(_WORD *)&v12->_connecting = 0;
    uint64_t v15 = +[NSMutableDictionary dictionary];
    activeServices = v12->_activeServices;
    v12->_activeServices = (NSMutableDictionary *)v15;

    [v8 registerProfileReadyObserver:v12 queue:0];
  }

  return v12;
}

- (HDServiceConnectionManager)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (void)disconnectFromServices
{
}

- (void)disconnectFromService:(id)a3
{
}

- (void)connectToService:(id)a3
{
}

- (void)dealloc
{
  v3 = +[HDDiagnosticManager sharedDiagnosticManager];
  [v3 removeObject:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained database];
  [v5 removeProtectedDataObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)HDServiceConnectionManager;
  [(HDServiceConnectionManager *)&v6 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  v4 = +[HDDiagnosticManager sharedDiagnosticManager];
  [v4 addObject:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_super v6 = [WeakRetained database];
  [v6 addProtectedDataObserver:self queue:self->_deviceQueue];

  sub_2A560(self);

  sub_2A154((uint64_t)self);
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_deviceQueue);
  if (v4)
  {
    sub_2A154((uint64_t)self);
  }
}

- (id)diagnosticDescription
{
  uint64_t v3 = objc_opt_class();
  if (self->_connecting) {
    BOOL v4 = "YES";
  }
  else {
    BOOL v4 = "NO";
  }
  v5 = "enabled";
  if (!self->_BTLEEnabled) {
    v5 = "disabled";
  }
  return +[NSString stringWithFormat:@"<%@:%p connecting:%s, BTLE:%s, services:%@>", v3, self, v4, v5, self->_activeServices];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceQueue, 0);
  objc_storeStrong((id *)&self->_activeServices, 0);
  objc_destroyWeak((id *)&self->_btleHeartRateDataCollector);
  objc_storeStrong((id *)&self->_serviceManager, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end