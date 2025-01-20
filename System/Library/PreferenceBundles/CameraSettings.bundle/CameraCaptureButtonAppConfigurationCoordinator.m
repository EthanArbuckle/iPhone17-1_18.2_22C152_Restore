@interface CameraCaptureButtonAppConfigurationCoordinator
- (BOOL)isBundleIDCameraTTCAuthorized:(id)a3;
- (BSInvalidatable)_associatedAppObserver;
- (BSInvalidatable)_eligibleAppsObserver;
- (CameraCaptureButtonAppConfigurationCoordinator)init;
- (CameraCaptureButtonAppConfigurationCoordinatorDelegate)cameraSettingsDelegate;
- (CameraCaptureButtonAppConfigurationCoordinatorDelegate)delegate;
- (NSSet)_authorizedAppsBundleIDs;
- (NSSet)eligibleAppsBundleIDs;
- (NSString)associatedAppBundleID;
- (SBSCaptureButtonAppConfigurationCoordinator)_appConfigurationController;
- (void)_setAssociatedAppBundleID:(id)a3 notifySpringBoard:(BOOL)a4 notifyDelegate:(BOOL)a5;
- (void)_setAuthorizedAppsBundleIDs:(id)a3;
- (void)_setEligibleAppsBundleIDs:(id)a3;
- (void)_setEligibleAppsBundleIDs:(id)a3 withAuthorizedBundleIds:(id)a4;
- (void)dealloc;
- (void)setAssociatedAppBundleID:(id)a3;
- (void)setCameraSettingsDelegate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CameraCaptureButtonAppConfigurationCoordinator

- (CameraCaptureButtonAppConfigurationCoordinator)init
{
  v28.receiver = self;
  v28.super_class = (Class)CameraCaptureButtonAppConfigurationCoordinator;
  v2 = [(CameraCaptureButtonAppConfigurationCoordinator *)&v28 init];
  v3 = v2;
  if (v2)
  {
    associatedAppBundleID = v2->_associatedAppBundleID;
    v2->_associatedAppBundleID = (NSString *)@"com.apple.camera";

    uint64_t v5 = +[NSSet setWithObject:v3->_associatedAppBundleID];
    eligibleAppsBundleIDs = v3->_eligibleAppsBundleIDs;
    v3->_eligibleAppsBundleIDs = (NSSet *)v5;

    uint64_t v7 = +[NSSet setWithObject:v3->_associatedAppBundleID];
    authorizedAppsBundleIDs = v3->__authorizedAppsBundleIDs;
    v3->__authorizedAppsBundleIDs = (NSSet *)v7;

    v9 = (SBSCaptureButtonAppConfigurationCoordinator *)objc_alloc_init((Class)SBSCaptureButtonAppConfigurationCoordinator);
    appConfigurationController = v3->__appConfigurationController;
    v3->__appConfigurationController = v9;

    objc_initWeak(&location, v3);
    char v11 = objc_opt_respondsToSelector();
    v12 = v3->__appConfigurationController;
    if (v11)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_546C;
      v25[3] = &unk_20668;
      v13 = &v26;
      objc_copyWeak(&v26, &location);
      uint64_t v14 = [(SBSCaptureButtonAppConfigurationCoordinator *)v12 addObserverForEligibleCaptureAppsUpdatesUsingBlock:v25];
    }
    else
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_55FC;
      v23[3] = &unk_20668;
      v13 = &v24;
      objc_copyWeak(&v24, &location);
      uint64_t v14 = [(SBSCaptureButtonAppConfigurationCoordinator *)v12 addObserverForEligibleAppsUpdatesUsingBlock:v23];
    }
    eligibleAppsObserver = v3->__eligibleAppsObserver;
    v3->__eligibleAppsObserver = (BSInvalidatable *)v14;

    objc_destroyWeak(v13);
    v16 = v3->__appConfigurationController;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_5658;
    v21[3] = &unk_20690;
    objc_copyWeak(&v22, &location);
    uint64_t v17 = [(SBSCaptureButtonAppConfigurationCoordinator *)v16 addObserverForAssociatedAppUpdatesUsingBlock:v21];
    associatedAppObserver = v3->__associatedAppObserver;
    v3->__associatedAppObserver = (BSInvalidatable *)v17;

    v19 = v3;
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->__eligibleAppsObserver invalidate];
  [(BSInvalidatable *)self->__associatedAppObserver invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CameraCaptureButtonAppConfigurationCoordinator;
  [(CameraCaptureButtonAppConfigurationCoordinator *)&v3 dealloc];
}

- (void)setAssociatedAppBundleID:(id)a3
{
}

- (BOOL)isBundleIDCameraTTCAuthorized:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CameraCaptureButtonAppConfigurationCoordinator *)self _authorizedAppsBundleIDs];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)_setAssociatedAppBundleID:(id)a3 notifySpringBoard:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v9 = (NSString *)a3;
  v10 = v9;
  if (self->_associatedAppBundleID != v9 && !-[NSString isEqualToString:](v9, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_associatedAppBundleID, a3);
    if (v5)
    {
      char v11 = [(CameraCaptureButtonAppConfigurationCoordinator *)self delegate];
      [v11 cameraCaptureButtonAppConfigurationCoordinator:self didChangeAssociatedAppBundleID:v10];

      v12 = [(CameraCaptureButtonAppConfigurationCoordinator *)self cameraSettingsDelegate];
      [v12 cameraCaptureButtonAppConfigurationCoordinator:self didChangeAssociatedAppBundleID:v10];
    }
    if (v6)
    {
      v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        v16 = v10;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Calling setAssociatedAppBundleIdentifier: %{public}@", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v14 = [(CameraCaptureButtonAppConfigurationCoordinator *)self _appConfigurationController];
      [v14 setAssociatedAppBundleIdentifier:v10];
    }
  }
}

- (void)_setEligibleAppsBundleIDs:(id)a3
{
}

- (void)_setEligibleAppsBundleIDs:(id)a3 withAuthorizedBundleIds:(id)a4
{
  v10 = (NSSet *)a3;
  uint64_t v7 = (NSSet *)a4;
  if (self->_eligibleAppsBundleIDs != v10 && !-[NSSet isEqualToSet:](v10, "isEqualToSet:")
    || self->__authorizedAppsBundleIDs != v7 && !-[NSSet isEqualToSet:](v7, "isEqualToSet:"))
  {
    objc_storeStrong((id *)&self->_eligibleAppsBundleIDs, a3);
    objc_storeStrong((id *)&self->__authorizedAppsBundleIDs, a4);
    v8 = [(CameraCaptureButtonAppConfigurationCoordinator *)self delegate];
    [v8 cameraCaptureButtonAppConfigurationCoordinator:self didChangeEligibleAppsBundleIDs:v10];

    v9 = [(CameraCaptureButtonAppConfigurationCoordinator *)self cameraSettingsDelegate];
    [v9 cameraCaptureButtonAppConfigurationCoordinator:self didChangeEligibleAppsBundleIDs:v10];
  }
}

- (CameraCaptureButtonAppConfigurationCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CameraCaptureButtonAppConfigurationCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CameraCaptureButtonAppConfigurationCoordinatorDelegate)cameraSettingsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraSettingsDelegate);

  return (CameraCaptureButtonAppConfigurationCoordinatorDelegate *)WeakRetained;
}

- (void)setCameraSettingsDelegate:(id)a3
{
}

- (NSString)associatedAppBundleID
{
  return self->_associatedAppBundleID;
}

- (NSSet)eligibleAppsBundleIDs
{
  return self->_eligibleAppsBundleIDs;
}

- (SBSCaptureButtonAppConfigurationCoordinator)_appConfigurationController
{
  return self->__appConfigurationController;
}

- (BSInvalidatable)_eligibleAppsObserver
{
  return self->__eligibleAppsObserver;
}

- (BSInvalidatable)_associatedAppObserver
{
  return self->__associatedAppObserver;
}

- (NSSet)_authorizedAppsBundleIDs
{
  return self->__authorizedAppsBundleIDs;
}

- (void)_setAuthorizedAppsBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__authorizedAppsBundleIDs, 0);
  objc_storeStrong((id *)&self->__associatedAppObserver, 0);
  objc_storeStrong((id *)&self->__eligibleAppsObserver, 0);
  objc_storeStrong((id *)&self->__appConfigurationController, 0);
  objc_storeStrong((id *)&self->_eligibleAppsBundleIDs, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleID, 0);
  objc_destroyWeak((id *)&self->_cameraSettingsDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end