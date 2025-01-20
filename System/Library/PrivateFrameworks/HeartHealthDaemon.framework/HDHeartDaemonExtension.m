@interface HDHeartDaemonExtension
- (HDHeartDaemonExtension)initWithHealthDaemon:(id)a3 heartNotificationsUserDefaults:(id)a4;
- (void)daemonReady:(id)a3;
- (void)performPostInstallUpdateTaskForManager:(id)a3 completion:(id)a4;
@end

@implementation HDHeartDaemonExtension

- (HDHeartDaemonExtension)initWithHealthDaemon:(id)a3 heartNotificationsUserDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDHeartDaemonExtension;
  v8 = [(HDHeartDaemonExtension *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_healthDaemon, v6);
    objc_storeStrong((id *)&v9->_heartNotificationsUserDefaults, a4);
    [v6 registerDaemonReadyObserver:v9 queue:0];
  }

  return v9;
}

- (void)daemonReady:(id)a3
{
  id v4 = [a3 postInstallUpdateManager];
  [v4 registerUpdateTaskHandler:self queue:0];
}

- (void)performPostInstallUpdateTaskForManager:(id)a3 completion:(id)a4
{
  HDMigrateHeartRateNotificationsUserDefaultsIfNecessary(self->_heartNotificationsUserDefaults);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if ([v4 count]) {
    HKSynchronizeNanoPreferencesUserDefaults();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartNotificationsUserDefaults, 0);

  objc_destroyWeak((id *)&self->_healthDaemon);
}

@end