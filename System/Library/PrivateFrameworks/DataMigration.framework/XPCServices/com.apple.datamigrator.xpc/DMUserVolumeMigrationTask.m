@interface DMUserVolumeMigrationTask
+ (id)createTaskIfAppropriateWithEnvironment:(id)a3;
+ (void)_migrateSharedAndPrimaryUserVolumeWithUserManager:(id)a3;
- (NSString)name;
- (NSString)telemetryIdentifier;
- (double)estimatedDurationTimeInterval;
- (id)workBlock;
- (void)setEstimatedDurationTimeInterval:(double)a3;
- (void)setName:(id)a3;
- (void)setTelemetryIdentifier:(id)a3;
- (void)setWorkBlock:(id)a3;
@end

@implementation DMUserVolumeMigrationTask

+ (id)createTaskIfAppropriateWithEnvironment:(id)a3
{
  id v3 = a3;
  if ([v3 deviceModeIsSharediPad]
    && ![v3 userSessionIsLoginWindow])
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_alloc_init(DMUserVolumeMigrationTask);
    [(DMUserVolumeMigrationTask *)v4 setName:@"User volume migration"];
    [(DMUserVolumeMigrationTask *)v4 setEstimatedDurationTimeInterval:10.0];
    [(DMUserVolumeMigrationTask *)v4 setTelemetryIdentifier:@"com.apple.datamigrator.UserVolumeMigration"];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000F898;
    v6[3] = &unk_1000246D8;
    id v7 = v3;
    [(DMUserVolumeMigrationTask *)v4 setWorkBlock:v6];
  }

  return v4;
}

+ (void)_migrateSharedAndPrimaryUserVolumeWithUserManager:(id)a3
{
  id v3 = a3;
  _DMLogFunc();
  id v9 = 0;
  unsigned __int8 v4 = [v3 migrateSharedAndPrimaryUserVolumeWithError:&v9];
  id v5 = v9;
  v6 = v5;
  if (v4)
  {
    id v7 = v5;
  }
  else
  {
    do
    {
      _DMLogFunc();
      _DMLogFunc();
      id v9 = v6;
      unsigned int v8 = objc_msgSend(v3, "migrateSharedAndPrimaryUserVolumeWithError:", &v9, v6);
      id v7 = v9;

      v6 = v7;
    }
    while (!v8);
  }
  _DMLogFunc();
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