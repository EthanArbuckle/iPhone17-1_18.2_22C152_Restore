@interface BFFBackupDeviceController
- (BFFBackupDeviceController)initWithProximitySetupController:(id)a3;
- (BFFBackupDeviceControllerDelegate)delegate;
- (BOOL)backupFinished;
- (BOOL)backupStateUnknown;
- (BOOL)isBackingUp;
- (NSDate)completionDate;
- (NSError)error;
- (NSString)backingUpDeviceName;
- (NSString)backingUpDeviceUUID;
- (ProximitySetupController)proximitySetupController;
- (double)percentComplete;
- (double)timeRemaining;
- (void)connectionTerminated;
- (void)dealloc;
- (void)receivedBackupAction:(id)a3;
- (void)reset;
- (void)retryBackup;
- (void)setBackingUp:(BOOL)a3;
- (void)setBackingUpDeviceName:(id)a3;
- (void)setBackingUpDeviceUUID:(id)a3;
- (void)setBackupFinished:(BOOL)a3;
- (void)setBackupStateUnknown:(BOOL)a3;
- (void)setCompletionDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setPercentComplete:(double)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setTimeRemaining:(double)a3;
- (void)startBackupDevice:(id)a3 UUID:(id)a4;
@end

@implementation BFFBackupDeviceController

- (BFFBackupDeviceController)initWithProximitySetupController:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v10;
  id v10 = 0;
  v8.receiver = v3;
  v8.super_class = (Class)BFFBackupDeviceController;
  v4 = [(BFFBackupDeviceController *)&v8 init];
  id v10 = v4;
  objc_storeStrong(&v10, v4);
  if (v4)
  {
    [v10 setProximitySetupController:location[0]];
    id v5 = [v10 proximitySetupController];
    [v5 addObserver:v10];
  }
  v6 = (BFFBackupDeviceController *)v10;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v10, 0);
  return v6;
}

- (void)dealloc
{
  id v5 = self;
  SEL v4 = a2;
  v2 = [(BFFBackupDeviceController *)self proximitySetupController];
  [(ProximitySetupController *)v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)BFFBackupDeviceController;
  [(BFFBackupDeviceController *)&v3 dealloc];
}

- (void)startBackupDevice:(id)a3 UUID:(id)a4
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = 0;
  objc_storeStrong(&v28, a4);
  if ([(BFFBackupDeviceController *)v30 isBackingUp])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = oslog;
      os_log_type_t v6 = v26;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Remote device is already backing up; ignoring request to start...",
        buf,
        2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v24 = 1;
  }
  else
  {
    v7 = [(BFFBackupDeviceController *)v30 proximitySetupController];
    int v8 = [(ProximitySetupController *)v7 hasConnection];

    if (v8)
    {
      os_log_t v20 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v20;
        os_log_type_t v16 = v19;
        sub_10004B24C(v18);
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Starting backup for remote device...", (uint8_t *)v18, 2u);
      }
      objc_storeStrong((id *)&v20, 0);
      [(BFFBackupDeviceController *)v30 setBackingUp:1];
      [(BFFBackupDeviceController *)v30 setBackupFinished:0];
      [(BFFBackupDeviceController *)v30 setError:0];
      [(BFFBackupDeviceController *)v30 setCompletionDate:0];
      [(BFFBackupDeviceController *)v30 setPercentComplete:0.0];
      [(BFFBackupDeviceController *)v30 setTimeRemaining:0.0];
      [(BFFBackupDeviceController *)v30 setBackingUpDeviceName:location[0]];
      [(BFFBackupDeviceController *)v30 setBackingUpDeviceUUID:v28];
      v17 = [(BFFBackupDeviceController *)v30 proximitySetupController];
      [(ProximitySetupController *)v17 startiCloudBackup];

      int v24 = 0;
    }
    else
    {
      os_log_t v23 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v23;
        os_log_type_t v10 = v22;
        sub_10004B24C(v21);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unable to start backup on remote device; no proximity connection!",
          v21,
          2u);
      }
      objc_storeStrong((id *)&v23, 0);
      v11 = +[NSError errorWithDomain:@"BFFBackupDeviceErrorDomain" code:-1 userInfo:0];
      [(BFFBackupDeviceController *)v30 setError:v11];

      [(BFFBackupDeviceController *)v30 setBackupFinished:1];
      v12 = [(BFFBackupDeviceController *)v30 delegate];
      v13 = v30;
      v14 = [(BFFBackupDeviceController *)v30 error];
      [(BFFBackupDeviceControllerDelegate *)v12 backupDeviceController:v13 backupCompletedWithError:v14];

      int v24 = 1;
    }
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)retryBackup
{
  os_log_type_t v10 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    os_log_type_t v3 = v8;
    sub_10004B24C(v7);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Reattempting backup for remote device...", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  SEL v4 = v10;
  id v5 = [(BFFBackupDeviceController *)v10 backingUpDeviceName];
  os_log_type_t v6 = [(BFFBackupDeviceController *)v10 backingUpDeviceUUID];
  [(BFFBackupDeviceController *)v4 startBackupDevice:v5 UUID:v6];
}

- (void)reset
{
}

- (void)receivedBackupAction:(id)a3
{
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] finishedBackup])
  {
    [(BFFBackupDeviceController *)v35 setBackingUp:0];
    [(BFFBackupDeviceController *)v35 setBackupFinished:1];
    id v3 = [location[0] completionDate];
    [(BFFBackupDeviceController *)v35 setCompletionDate:v3];

    id v4 = [location[0] error];
    [(BFFBackupDeviceController *)v35 setError:v4];

    id v5 = [(BFFBackupDeviceController *)v35 error];
    if (v5)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        char v28 = 0;
        char v26 = 0;
        char v24 = 0;
        char v22 = 0;
        char v20 = 0;
        char v18 = 0;
        if (_BYIsInternalInstall())
        {
          v9 = [(BFFBackupDeviceController *)v35 error];
          v29 = v9;
          char v28 = 1;
        }
        else
        {
          v27 = [(BFFBackupDeviceController *)v35 error];
          char v26 = 1;
          if (v27)
          {
            v25 = [(BFFBackupDeviceController *)v35 error];
            char v24 = 1;
            os_log_t v23 = [(NSError *)v25 domain];
            char v22 = 1;
            v21 = [(BFFBackupDeviceController *)v35 error];
            char v20 = 1;
            v9 = +[NSString stringWithFormat:@"<Error domain: %@, code %ld>", v23, [(NSError *)v21 code]];
            os_log_type_t v19 = v9;
            char v18 = 1;
          }
          else
          {
            v9 = 0;
          }
        }
        sub_10004BB7C((uint64_t)v36, (uint64_t)v9);
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Backup failed with error: %{public}@", v36, 0xCu);
        if (v18) {

        }
        if (v20) {
        if (v22)
        }

        if (v24) {
        if (v26)
        }

        if (v28) {
      }
        }
      objc_storeStrong((id *)&oslog, 0);
    }
    else
    {
      id v33 = (id)_BYLoggingFacility();
      os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v6 = v33;
        os_log_type_t v7 = v32;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Backup finished successfully!", buf, 2u);
      }
      objc_storeStrong(&v33, 0);
      os_log_type_t v8 = [(BFFBackupDeviceController *)v35 proximitySetupController];
      [(ProximitySetupController *)v8 setupFinished];
    }
    os_log_type_t v10 = [(BFFBackupDeviceController *)v35 delegate];
    v11 = v35;
    v12 = [(BFFBackupDeviceController *)v35 error];
    [(BFFBackupDeviceControllerDelegate *)v10 backupDeviceController:v11 backupCompletedWithError:v12];
  }
  else
  {
    [location[0] percentComplete];
    -[BFFBackupDeviceController setPercentComplete:](v35, "setPercentComplete:");
    id v13 = [location[0] timeRemaining];
    [(BFFBackupDeviceController *)v35 setTimeRemaining:(double)(unint64_t)v13];
    v14 = [(BFFBackupDeviceController *)v35 delegate];
    [(BFFBackupDeviceController *)v35 percentComplete];
    double v16 = v15;
    [(BFFBackupDeviceController *)v35 timeRemaining];
    [(BFFBackupDeviceControllerDelegate *)v14 backupProgress:(unint64_t)v17 estimatedTimeRemaining:v16];
  }
  objc_storeStrong(location, 0);
}

- (void)connectionTerminated
{
  os_log_type_t v10 = self;
  v9[1] = (id)a2;
  if ([(BFFBackupDeviceController *)self isBackingUp])
  {
    [(BFFBackupDeviceController *)v10 setBackingUp:0];
    [(BFFBackupDeviceController *)v10 setBackupFinished:1];
    [(BFFBackupDeviceController *)v10 setBackupStateUnknown:1];
    v2 = +[NSError errorWithDomain:@"BFFBackupDeviceErrorDomain" code:-1 userInfo:0];
    [(BFFBackupDeviceController *)v10 setError:v2];

    id v3 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    os_log_type_t v7 = sub_1001C2CF0;
    os_log_type_t v8 = &unk_1002B0D20;
    v9[0] = v10;
    dispatch_async(v3, &block);

    objc_storeStrong(v9, 0);
  }
}

- (BFFBackupDeviceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFBackupDeviceControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isBackingUp
{
  return self->_backingUp;
}

- (void)setBackingUp:(BOOL)a3
{
  self->_backingUp = a3;
}

- (BOOL)backupFinished
{
  return self->_backupFinished;
}

- (void)setBackupFinished:(BOOL)a3
{
  self->_backupFinished = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (NSDate)completionDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCompletionDate:(id)a3
{
}

- (BOOL)backupStateUnknown
{
  return self->_backupStateUnknown;
}

- (void)setBackupStateUnknown:(BOOL)a3
{
  self->_backupStateUnknown = a3;
}

- (NSString)backingUpDeviceName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBackingUpDeviceName:(id)a3
{
}

- (NSString)backingUpDeviceUUID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBackingUpDeviceUUID:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return (ProximitySetupController *)objc_getProperty(self, a2, 72, 1);
}

- (void)setProximitySetupController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end