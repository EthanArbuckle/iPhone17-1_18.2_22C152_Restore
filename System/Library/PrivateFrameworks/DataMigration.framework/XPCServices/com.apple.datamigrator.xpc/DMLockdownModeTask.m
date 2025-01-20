@interface DMLockdownModeTask
+ (id)createTaskIfAppropriateWithEnvironment:(id)a3;
+ (void)_enableLockdownModeIfNeededWithLockdownModeManager:(id)a3;
- (NSString)name;
- (NSString)telemetryIdentifier;
- (double)estimatedDurationTimeInterval;
- (id)workBlock;
- (void)setEstimatedDurationTimeInterval:(double)a3;
- (void)setName:(id)a3;
- (void)setTelemetryIdentifier:(id)a3;
- (void)setWorkBlock:(id)a3;
@end

@implementation DMLockdownModeTask

+ (id)createTaskIfAppropriateWithEnvironment:(id)a3
{
  id v3 = a3;
  if ([v3 deviceModeIsSharediPad])
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_alloc_init(DMLockdownModeTask);
    [(DMLockdownModeTask *)v4 setName:@"Lockdown mode"];
    [(DMLockdownModeTask *)v4 setEstimatedDurationTimeInterval:1.0];
    [(DMLockdownModeTask *)v4 setTelemetryIdentifier:@"com.apple.datamigrator.LockdownMode"];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100007460;
    v6[3] = &unk_1000246D8;
    id v7 = v3;
    [(DMLockdownModeTask *)v4 setWorkBlock:v6];
  }

  return v4;
}

+ (void)_enableLockdownModeIfNeededWithLockdownModeManager:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  _DMLogFunc();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000075BC;
  v7[3] = &unk_100024700;
  v5 = v4;
  v8 = v5;
  [v3 enableIfNeeded:1 completion:v7];

  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v5, v6)) {
    _DMLogFunc();
  }
}

- (id)workBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setWorkBlock:(id)a3
{
}

- (double)estimatedDurationTimeInterval
{
  return self->_estimatedDurationTimeInterval;
}

- (void)setEstimatedDurationTimeInterval:(double)a3
{
  self->_estimatedDurationTimeInterval = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)telemetryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTelemetryIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong(&self->_workBlock, 0);
}

@end