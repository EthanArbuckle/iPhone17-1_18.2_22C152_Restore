@interface CAMSubsystems
- (BOOL)isConfiguredFromLaunchOptions;
- (CAMBurstController)burstController;
- (CAMCameraRollController)cameraRollController;
- (CAMIrisVideoController)irisVideoController;
- (CAMKeepAliveController)keepAliveController;
- (CAMLibrarySelectionController)librarySelectionController;
- (CAMLocationController)locationController;
- (CAMMotionController)motionController;
- (CAMNebulaDaemonProxyManager)nebulaDaemonProxyManager;
- (CAMPersistenceController)persistenceController;
- (CAMPowerController)powerController;
- (CAMProtectionController)protectionController;
- (CAMRemoteShutterController)remoteShutterController;
- (CAMSubsystems)init;
- (CAMSubsystems)initWithLaunchOptions:(id)a3;
- (CAMTimelapseController)timelapseController;
- (CAMViewfinderViewController)viewfinderViewController;
- (CUCaptureController)captureController;
@end

@implementation CAMSubsystems

- (CAMSubsystems)init
{
  return [(CAMSubsystems *)self initWithLaunchOptions:MEMORY[0x263EFFA78]];
}

- (CAMSubsystems)initWithLaunchOptions:(id)a3
{
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)CAMSubsystems;
  v5 = [(CAMSubsystems *)&v77 init];
  if (v5)
  {
    v76 = +[CAMCaptureCapabilities capabilities];
    if ([v76 hasSystemTelephonyOfAnyKind]) {
      id v6 = [[CAMCallStatusMonitor alloc] initDisabledForLaunch];
    }
    else {
      id v6 = 0;
    }
    id v68 = v4;
    v7 = [[CAMUserPreferenceOverrides alloc] initWithLaunchOptions:v4];
    v8 = +[CAMUserPreferences preferences];
    v75 = v6;
    v67 = v7;
    char v65 = objc_msgSend(v8, "readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:", v7, 0, objc_msgSend(v6, "isCallActive"), 0);
    uint64_t v9 = [v8 captureConfiguration];
    v73 = [v8 conflictingControlConfiguration];
    v10 = objc_alloc_init(CAMMotionController);
    v11 = objc_alloc_init(CAMLocationController);
    v12 = objc_alloc_init(CAMPowerController);
    v13 = objc_alloc_init(CAMProtectionController);
    v62 = objc_alloc_init(CAMKeepAliveController);
    v58 = objc_alloc_init(CAMCameraRollController);
    v14 = [[CAMRemoteShutterController alloc] initWithCaptureConfiguration:v9 motionController:v10];
    v72 = objc_alloc_init(CAMNebulaDaemonProxyManager);
    v15 = [[CAMBurstController alloc] initWithProtectionController:v13 powerController:v12 remoteShutterController:v14];
    v52 = [[CAMPersistenceController alloc] initWithLocationController:v11 burstController:v15 protectionController:v13 powerController:v12 irisVideoController:0];
    -[CAMBurstController setPersistenceController:](v15, "setPersistenceController:");
    +[CAMCaptureConfiguration captureGraphConfigurationUsingConfiguration:v9 outputToExternalStorage:0];
    v64 = v66 = v8;
    objc_msgSend(v8, "defaultZoomFactorForGraphConfiguration:captureOrientation:outputToExternalStorage:", v64, -[CAMMotionController captureOrientation](v10, "captureOrientation"), 0);
    v71 = v14;
    v50 = v14;
    v69 = v12;
    v63 = v13;
    v74 = (void *)v9;
    v16 = v10;
    v61 = v15;
    v18 = [[CUCaptureController alloc] initWithCaptureConfiguration:v9 zoomFactor:0 outputToExternalStorage:0 engineOptions:v11 locationController:v10 motionController:v15 burstController:v17 protectionController:v13 powerController:v12 irisVideoController:0 remoteShutterController:v50];
    v19 = objc_alloc_init(CAMStorageController);
    v20 = 0;
    if ([v76 librarySelectionSupported]) {
      v20 = [[CAMLibrarySelectionController alloc] initWithLocationProvider:v11];
    }
    v21 = [[CAMTimelapseController alloc] initWithCaptureController:v18 locationController:v11 motionController:v10 persistenceController:v52 storageController:v19 librarySelectionController:v20 nebulaDaemonProxyManager:v72];
    [MEMORY[0x263F82670] currentDevice];
    v22 = v20;
    v23 = v54 = v20;
    v60 = v19;
    uint64_t v24 = objc_msgSend(v23, "cam_initialLayoutStyle");

    v25 = -[CAMViewfinderViewController initWithCaptureController:captureConfiguration:conflictingControlConfiguration:locationController:motionController:timelapseController:keepAliveController:remoteShutterController:powerController:cameraRollController:librarySelectionController:callStatusMonitor:storageController:usingEmulationMode:initialLayoutStyle:options:]([CAMViewfinderViewController alloc], "initWithCaptureController:captureConfiguration:conflictingControlConfiguration:locationController:motionController:timelapseController:keepAliveController:remoteShutterController:powerController:cameraRollController:librarySelectionController:callStatusMonitor:storageController:usingEmulationMode:initialLayoutStyle:options:", v18, v74, v73, v11, v16, v21, v62, v71, v69, v58, v22, v75, v19, 0, v24,
            0);
    [(CAMRemoteShutterController *)v71 setDelegate:v25];
    [(CAMTimelapseController *)v21 restoreConfiguration];
    [(CUCaptureController *)v18 registerCaptureService:v52];
    viewfinderViewController = v5->_viewfinderViewController;
    v5->_viewfinderViewController = v25;
    v57 = v25;

    cameraRollController = v5->_cameraRollController;
    v5->_cameraRollController = v58;
    v59 = v58;

    captureController = v5->_captureController;
    v5->_captureController = v18;
    v56 = v18;

    timelapseController = v5->_timelapseController;
    v5->_timelapseController = v21;
    v55 = v21;

    persistenceController = v5->_persistenceController;
    v5->_persistenceController = v52;
    v31 = v52;

    motionController = v5->_motionController;
    v5->_motionController = v16;
    v53 = v16;

    locationController = v5->_locationController;
    v5->_locationController = v11;
    v51 = v11;

    powerController = v5->_powerController;
    v5->_powerController = v69;
    v70 = v69;

    burstController = v5->_burstController;
    v5->_burstController = v61;
    v36 = v61;

    keepAliveController = v5->_keepAliveController;
    v5->_keepAliveController = v62;
    v38 = v62;

    protectionController = v5->_protectionController;
    v5->_protectionController = v63;
    v40 = v63;

    remoteShutterController = v5->_remoteShutterController;
    v5->_remoteShutterController = v71;
    v42 = v71;

    librarySelectionController = v5->_librarySelectionController;
    v5->_librarySelectionController = v54;
    v44 = v54;

    nebulaDaemonProxyManager = v5->_nebulaDaemonProxyManager;
    v5->_nebulaDaemonProxyManager = v72;
    v46 = v72;

    irisVideoController = v5->_irisVideoController;
    v5->_irisVideoController = 0;

    v5->_configuredFromLaunchOptions = v65;
    v48 = v5;

    id v4 = v68;
  }

  return v5;
}

- (CAMViewfinderViewController)viewfinderViewController
{
  return self->_viewfinderViewController;
}

- (CAMCameraRollController)cameraRollController
{
  return self->_cameraRollController;
}

- (CUCaptureController)captureController
{
  return self->_captureController;
}

- (CAMTimelapseController)timelapseController
{
  return self->_timelapseController;
}

- (CAMPersistenceController)persistenceController
{
  return self->_persistenceController;
}

- (CAMMotionController)motionController
{
  return self->_motionController;
}

- (CAMLocationController)locationController
{
  return self->_locationController;
}

- (CAMPowerController)powerController
{
  return self->_powerController;
}

- (CAMBurstController)burstController
{
  return self->_burstController;
}

- (CAMKeepAliveController)keepAliveController
{
  return self->_keepAliveController;
}

- (CAMProtectionController)protectionController
{
  return self->_protectionController;
}

- (CAMRemoteShutterController)remoteShutterController
{
  return self->_remoteShutterController;
}

- (CAMLibrarySelectionController)librarySelectionController
{
  return self->_librarySelectionController;
}

- (CAMNebulaDaemonProxyManager)nebulaDaemonProxyManager
{
  return self->_nebulaDaemonProxyManager;
}

- (CAMIrisVideoController)irisVideoController
{
  return self->_irisVideoController;
}

- (BOOL)isConfiguredFromLaunchOptions
{
  return self->_configuredFromLaunchOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irisVideoController, 0);
  objc_storeStrong((id *)&self->_nebulaDaemonProxyManager, 0);
  objc_storeStrong((id *)&self->_librarySelectionController, 0);
  objc_storeStrong((id *)&self->_remoteShutterController, 0);
  objc_storeStrong((id *)&self->_protectionController, 0);
  objc_storeStrong((id *)&self->_keepAliveController, 0);
  objc_storeStrong((id *)&self->_burstController, 0);
  objc_storeStrong((id *)&self->_powerController, 0);
  objc_storeStrong((id *)&self->_locationController, 0);
  objc_storeStrong((id *)&self->_motionController, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_timelapseController, 0);
  objc_storeStrong((id *)&self->_captureController, 0);
  objc_storeStrong((id *)&self->_cameraRollController, 0);
  objc_storeStrong((id *)&self->_viewfinderViewController, 0);
}

@end