@interface HKCoreTelephonySatelliteClient
- (BOOL)isSatelliteSupportedForEmergencyDemo;
- (CTStewieState)cachedStewieState;
- (CTStewieStateMonitor)stewieStateMonitor;
- (HKCoreTelephonySatelliteClient)init;
- (HKCoreTelephonySatelliteClient)initWithDelegate:(id)a3 queue:(id)a4;
- (HKCoreTelephonySatelliteClientDelegate)delegate;
- (void)setCachedStewieState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStewieStateMonitor:(id)a3;
- (void)stateChanged:(id)a3;
@end

@implementation HKCoreTelephonySatelliteClient

- (HKCoreTelephonySatelliteClient)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKCoreTelephonySatelliteClient;
  v8 = [(HKCoreTelephonySatelliteClient *)&v16 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_queue, a4);
    objc_storeWeak((id *)&v9->_delegate, v6);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F23A60]) initWithDelegate:v9 queue:v9->_queue];
    stewieStateMonitor = v9->_stewieStateMonitor;
    v9->_stewieStateMonitor = (CTStewieStateMonitor *)v10;

    [(CTStewieStateMonitor *)v9->_stewieStateMonitor start];
    v12 = [(CTStewieStateMonitor *)v9->_stewieStateMonitor getState];
    uint64_t v13 = [v12 copy];
    cachedStewieState = v9->_cachedStewieState;
    v9->_cachedStewieState = (CTStewieState *)v13;
  }
  return v9;
}

- (HKCoreTelephonySatelliteClient)init
{
  v3 = HKCreateSerialDispatchQueue(self, @"HKCoreTelephonySatelliteClient");
  v4 = [(HKCoreTelephonySatelliteClient *)self initWithDelegate:0 queue:v3];

  return v4;
}

- (void)stateChanged:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (CTStewieState *)[v5 copy];

  cachedStewieState = self->_cachedStewieState;
  self->_cachedStewieState = v6;

  os_unfair_lock_unlock(p_lock);
  _HKInitializeLogging();
  v8 = (void *)HKLogMedicalID;
  if (os_log_type_enabled((os_log_t)HKLogMedicalID, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)v12 = 138412290;
    *(void *)&v12[4] = objc_opt_class();
    id v10 = *(id *)&v12[4];
    _os_log_impl(&dword_19C023000, v9, OS_LOG_TYPE_DEFAULT, "[%@][Satellite Support] Satellite support changed", v12, 0xCu);
  }
  v11 = [(HKCoreTelephonySatelliteClient *)self delegate];
  [v11 satelliteSupportChanged:self];
}

- (BOOL)isSatelliteSupportedForEmergencyDemo
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = [(CTStewieState *)self->_cachedStewieState isDemoAllowedForService:1];
  os_unfair_lock_unlock(p_lock);
  _HKInitializeLogging();
  id v5 = (void *)HKLogMedicalID;
  if (os_log_type_enabled((os_log_t)HKLogMedicalID, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    int v9 = 138412546;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 1024;
    int v12 = v4;
    id v7 = v10;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[%@][Satellite Support] Fetched satellite support as: %d", (uint8_t *)&v9, 0x12u);
  }
  return v4;
}

- (HKCoreTelephonySatelliteClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HKCoreTelephonySatelliteClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CTStewieState)cachedStewieState
{
  return self->_cachedStewieState;
}

- (void)setCachedStewieState:(id)a3
{
}

- (CTStewieStateMonitor)stewieStateMonitor
{
  return self->_stewieStateMonitor;
}

- (void)setStewieStateMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stewieStateMonitor, 0);
  objc_storeStrong((id *)&self->_cachedStewieState, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end