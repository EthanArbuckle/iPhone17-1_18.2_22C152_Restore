@interface HDWorkoutPluginDaemonExtension
- (HDAlertSuppressor)alertSuppressor;
- (HDAppLauncher)appLauncher;
- (HDBackgroundWorkoutRunner)backgroundWorkoutRunner;
- (HDCarouselServicesManager)carouselServicesManager;
- (HDCoreMotionWorkoutInterface)coreMotionWorkoutInterface;
- (HDDaemon)daemon;
- (HDHeartRateRecoveryManager)heartRateRecoveryManager;
- (HDWorkoutPluginDaemonExtension)initWithDaemon:(id)a3;
@end

@implementation HDWorkoutPluginDaemonExtension

- (HDWorkoutPluginDaemonExtension)initWithDaemon:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HDWorkoutPluginDaemonExtension;
  v5 = [(HDWorkoutPluginDaemonExtension *)&v23 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v7 = [[HDAlertSuppressor alloc] initWithDaemon:v4];
    alertSuppressor = v6->_alertSuppressor;
    v6->_alertSuppressor = v7;

    v9 = [HDAppLauncher alloc];
    v10 = [v4 processStateManager];
    v11 = objc_msgSend(MEMORY[0x1E4F629E0], "hd_defaultService");
    uint64_t v12 = [(HDAppLauncher *)v9 initWithProcessStateManager:v10 openApplicationService:v11];
    appLauncher = v6->_appLauncher;
    v6->_appLauncher = (HDAppLauncher *)v12;

    v14 = [[HDBackgroundWorkoutRunner alloc] initWithDaemon:v4];
    backgroundWorkoutRunner = v6->_backgroundWorkoutRunner;
    v6->_backgroundWorkoutRunner = v14;

    v16 = objc_alloc_init(HDCarouselServicesManager);
    carouselServicesManager = v6->_carouselServicesManager;
    v6->_carouselServicesManager = v16;

    v18 = objc_alloc_init(HDCoreMotionWorkoutInterface);
    coreMotionWorkoutInterface = v6->_coreMotionWorkoutInterface;
    v6->_coreMotionWorkoutInterface = v18;

    v20 = objc_alloc_init(HDHeartRateRecoveryManager);
    heartRateRecoveryManager = v6->_heartRateRecoveryManager;
    v6->_heartRateRecoveryManager = v20;
  }
  return v6;
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (HDAlertSuppressor)alertSuppressor
{
  return self->_alertSuppressor;
}

- (HDAppLauncher)appLauncher
{
  return self->_appLauncher;
}

- (HDBackgroundWorkoutRunner)backgroundWorkoutRunner
{
  return self->_backgroundWorkoutRunner;
}

- (HDCarouselServicesManager)carouselServicesManager
{
  return self->_carouselServicesManager;
}

- (HDCoreMotionWorkoutInterface)coreMotionWorkoutInterface
{
  return self->_coreMotionWorkoutInterface;
}

- (HDHeartRateRecoveryManager)heartRateRecoveryManager
{
  return self->_heartRateRecoveryManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateRecoveryManager, 0);
  objc_storeStrong((id *)&self->_coreMotionWorkoutInterface, 0);
  objc_storeStrong((id *)&self->_carouselServicesManager, 0);
  objc_storeStrong((id *)&self->_backgroundWorkoutRunner, 0);
  objc_storeStrong((id *)&self->_appLauncher, 0);
  objc_storeStrong((id *)&self->_alertSuppressor, 0);

  objc_destroyWeak((id *)&self->_daemon);
}

@end