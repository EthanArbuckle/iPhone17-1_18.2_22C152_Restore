@interface HDWorkoutEventCollector
+ (BOOL)isAvailableInCurrentHardware;
+ (BOOL)supportsWorkoutActivityType:(unint64_t)a3;
- (HDProfile)profile;
- (HDWorkoutEventCollector)initWithProfile:(id)a3 delegate:(id)a4;
- (HDWorkoutEventCollectorDelegate)delegate;
- (NSUUID)sessionId;
- (void)requestPendingEventsThroughDate:(id)a3 completion:(id)a4;
- (void)startWithSessionId:(id)a3;
- (void)stop;
@end

@implementation HDWorkoutEventCollector

+ (BOOL)isAvailableInCurrentHardware
{
  return 1;
}

- (HDWorkoutEventCollector)initWithProfile:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDWorkoutEventCollector;
  v8 = [(HDWorkoutEventCollector *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
  }

  return v9;
}

- (void)startWithSessionId:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = (NSUUID *)a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(NSUUID *)v4 UUIDString];
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%@: Starting with session ID %@", (uint8_t *)&v9, 0x16u);
  }
  sessionId = self->_sessionId;
  self->_sessionId = v4;
}

- (HDWorkoutEventCollectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDWorkoutEventCollectorDelegate *)WeakRetained;
}

- (void)stop
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    sessionId = self->_sessionId;
    v5 = v3;
    id v6 = [(NSUUID *)sessionId UUIDString];
    int v8 = 138412546;
    int v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%@: Stopping with session ID %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = self->_sessionId;
  self->_sessionId = 0;
}

+ (BOOL)supportsWorkoutActivityType:(unint64_t)a3
{
  return 1;
}

- (void)requestPendingEventsThroughDate:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, uint64_t, void))a4 + 2))(a4, 1, 0);
  }
}

- (NSUUID)sessionId
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_sessionId, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end