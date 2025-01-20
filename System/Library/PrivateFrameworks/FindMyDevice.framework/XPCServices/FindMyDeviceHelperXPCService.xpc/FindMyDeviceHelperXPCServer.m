@interface FindMyDeviceHelperXPCServer
- (BOOL)isEntitled;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FMDAccessoryAudioController)accessoryAudioController;
- (FMDGenericAudioAccessory)currentAccessory;
- (FMDGenericAudioAccessory)waitingRoutableAccessory;
- (FMDMessageAudioController)messageAudioController;
- (NSTimer)stopSoundTimer;
- (id)_disableBiometricID;
- (id)getManagedLostModeFileURL;
- (id)getNeedsLocateAckLostModeFileURL;
- (void)_stopPlayingForAccessory:(id)a3 rampDownDuration:(double)a4 completion:(id)a5;
- (void)_stopSoundTimerFired:(id)a3;
- (void)_updateLostModeInfo:(id)a3 toFile:(id)a4 completion:(id)a5;
- (void)disableBiometricIDWithCompletion:(id)a3;
- (void)invalidateStopSoundTimer;
- (void)setAccessoryAudioController:(id)a3;
- (void)setCurrentAccessory:(id)a3;
- (void)setMessageAudioController:(id)a3;
- (void)setStopSoundTimer:(id)a3;
- (void)setTimeoutForDuration:(double)a3;
- (void)setWaitingRoutableAccessory:(id)a3;
- (void)startPlayingSoundForAccessory:(id)a3 duration:(double)a4 rampUpDuration:(double)a5 channels:(id)a6 completion:(id)a7;
- (void)startPlayingSoundForMessage:(id)a3 completion:(id)a4;
- (void)stopPlayingForAccessory:(id)a3 rampDownDuration:(double)a4 completion:(id)a5;
- (void)stopSoundMessageWithCompletion:(id)a3;
- (void)updateManagedLostModeInfo:(id)a3 completion:(id)a4;
- (void)updateNeedsLocateAckLostModeInfo:(id)a3 completion:(id)a4;
- (void)waitForRoutableAccessory:(id)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation FindMyDeviceHelperXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = sub_10000CD44();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received new XPC connection %@", buf, 0xCu);
  }

  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FindMyDeviceHelperXPCInterface];
  [v12 setClasses:v11 forSelector:"startPlayingSoundForAccessory:duration:rampUpDuration:channels:completion:" argumentIndex:0 ofReply:1];
  [v12 setClasses:v11 forSelector:"stopPlayingForAccessory:rampDownDuration:completion:" argumentIndex:0 ofReply:1];
  [v12 setClasses:v11 forSelector:"waitForRoutableAccessory:timeout:completion:" argumentIndex:0 ofReply:0];
  [v12 setClasses:v11 forSelector:"startPlayingSoundForMessage:completion:" argumentIndex:0 ofReply:1];
  [v12 setClasses:v11 forSelector:"stopSoundMessageWithCompletion:" argumentIndex:0 ofReply:1];
  [v12 setClasses:v11 forSelector:"didAddLocalFindableAccessory:completion:" argumentIndex:0 ofReply:1];
  [v12 setClasses:v11 forSelector:"didRemoveLocalFindableAccessory:completion:" argumentIndex:0 ofReply:1];
  [v5 setExportedInterface:v12];
  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)startPlayingSoundForAccessory:(id)a3 duration:(double)a4 rampUpDuration:(double)a5 channels:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v16 = +[NSXPCConnection currentConnection];
  v17 = [v16 valueForEntitlement:@"com.apple.icloud.FindMyDevice.FindMyDeviceHelperXPCService.access"];

  if (v17 && ([&__kCFBooleanTrue isEqual:v17] & 1) != 0)
  {
    v18 = sub_10000CD44();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v38 = v13;
      __int16 v39 = 2048;
      double v40 = a4;
      __int16 v41 = 2048;
      double v42 = a5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Start playing sound for accessory: %@ duration: %f rampUpDuration: %f", buf, 0x20u);
    }

    if (v13)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000DCA0;
      block[3] = &unk_10001D490;
      double v33 = a5;
      block[4] = self;
      id v30 = v13;
      id v31 = v14;
      double v34 = a4;
      id v32 = v15;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else if (v15)
    {
      id v26 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v35 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v36 = @"Accessory cannot be nil";
      v27 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      id v28 = [v26 initWithDomain:@"com.apple.icloud.FindMyDevice" code:1 userInfo:v27];
      (*((void (**)(id, id))v15 + 2))(v15, v28);
    }
  }
  else
  {
    v19 = NSStringFromSelector(a2);
    v20 = +[NSString stringWithFormat:@"Entitlement not found for %@", v19];

    id v21 = objc_alloc((Class)NSError);
    if (v20) {
      CFStringRef v22 = v20;
    }
    else {
      CFStringRef v22 = &stru_10001FD10;
    }
    NSErrorUserInfoKey v43 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v44 = v22;
    v23 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v24 = [v21 initWithDomain:@"com.apple.icloud.FindMyDevice" code:6 userInfo:v23];

    v25 = sub_10000CD44();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10001141C();
    }

    if (v15) {
      (*((void (**)(id, id))v15 + 2))(v15, v24);
    }
  }
}

- (void)stopPlayingForAccessory:(id)a3 rampDownDuration:(double)a4 completion:(id)a5
{
  id v9 = a3;
  uint64_t v10 = (void (**)(id, id))a5;
  v11 = +[NSXPCConnection currentConnection];
  v12 = [v11 valueForEntitlement:@"com.apple.icloud.FindMyDevice.FindMyDeviceHelperXPCService.access"];

  if (v12 && ([&__kCFBooleanTrue isEqual:v12] & 1) != 0)
  {
    [(FindMyDeviceHelperXPCServer *)self _stopPlayingForAccessory:v9 rampDownDuration:v10 completion:a4];
  }
  else
  {
    id v13 = NSStringFromSelector(a2);
    id v14 = +[NSString stringWithFormat:@"Entitlement not found for %@", v13];

    id v15 = objc_alloc((Class)NSError);
    if (v14) {
      CFStringRef v16 = v14;
    }
    else {
      CFStringRef v16 = &stru_10001FD10;
    }
    NSErrorUserInfoKey v20 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v21 = v16;
    v17 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v18 = [v15 initWithDomain:@"com.apple.icloud.FindMyDevice" code:6 userInfo:v17];

    v19 = sub_10000CD44();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10001141C();
    }

    if (v10) {
      v10[2](v10, v18);
    }
  }
}

- (void)_stopPlayingForAccessory:(id)a3 rampDownDuration:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = sub_10000CD44();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v8;
    __int16 v22 = 2048;
    double v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Stop playing sound for accessory: %@ rampDownDuration: %f", buf, 0x16u);
  }

  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000E28C;
    v14[3] = &unk_10001D4E0;
    double v17 = a4;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
  }
  else if (v9)
  {
    id v11 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v18 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v19 = @"Accessory cannot be nil";
    v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v13 = [v11 initWithDomain:@"com.apple.icloud.FindMyDevice" code:1 userInfo:v12];
    (*((void (**)(id, id))v9 + 2))(v9, v13);
  }
}

- (void)waitForRoutableAccessory:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = sub_10000CD44();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v9;
    __int16 v31 = 2048;
    double v32 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Wait for routable accessories: %@ timeout: %f", buf, 0x16u);
  }

  v12 = +[NSXPCConnection currentConnection];
  id v13 = [v12 valueForEntitlement:@"com.apple.icloud.FindMyDevice.FindMyDeviceHelperXPCService.access"];

  if (v13 && ([&__kCFBooleanTrue isEqual:v13] & 1) != 0)
  {
    dispatch_time_t v14 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E694;
    block[3] = &unk_10001D4E0;
    double v26 = a4;
    double v23 = (__CFString *)v9;
    id v24 = self;
    id v25 = v10;
    dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);

    id v15 = v23;
  }
  else
  {
    id v16 = NSStringFromSelector(a2);
    id v15 = +[NSString stringWithFormat:@"Entitlement not found for %@", v16];

    id v17 = objc_alloc((Class)NSError);
    if (v15) {
      CFStringRef v18 = v15;
    }
    else {
      CFStringRef v18 = &stru_10001FD10;
    }
    NSErrorUserInfoKey v27 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v28 = v18;
    CFStringRef v19 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v20 = [v17 initWithDomain:@"com.apple.icloud.FindMyDevice" code:6 userInfo:v19];

    id v21 = sub_10000CD44();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10001141C();
    }

    if (v10) {
      (*((void (**)(id, id))v10 + 2))(v10, v20);
    }
  }
}

- (void)setTimeoutForDuration:(double)a3
{
  id v5 = sub_10000CD44();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = +[NSThread currentThread];
    int v11 = 134218240;
    double v12 = a3;
    __int16 v13 = 1024;
    unsigned int v14 = [v6 isMainThread];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set timeout for duration: %f inMainThread: %d", (uint8_t *)&v11, 0x12u);
  }
  uint64_t v7 = [(FindMyDeviceHelperXPCServer *)self stopSoundTimer];
  [v7 invalidate];

  id v8 = +[NSTimer timerWithTimeInterval:self target:"_stopSoundTimerFired:" selector:0 userInfo:0 repeats:a3];
  [(FindMyDeviceHelperXPCServer *)self setStopSoundTimer:v8];

  id v9 = +[NSRunLoop currentRunLoop];
  id v10 = [(FindMyDeviceHelperXPCServer *)self stopSoundTimer];
  [v9 addTimer:v10 forMode:NSRunLoopCommonModes];
}

- (void)_stopSoundTimerFired:(id)a3
{
  v4 = sub_10000CD44();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stop sound timer fired", v6, 2u);
  }

  id v5 = [(FindMyDeviceHelperXPCServer *)self currentAccessory];
  [(FindMyDeviceHelperXPCServer *)self _stopPlayingForAccessory:v5 rampDownDuration:0 completion:0.5];
}

- (void)invalidateStopSoundTimer
{
  v3 = sub_10000CD44();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating stop sound timer", v5, 2u);
  }

  v4 = [(FindMyDeviceHelperXPCServer *)self stopSoundTimer];
  [v4 invalidate];

  [(FindMyDeviceHelperXPCServer *)self setStopSoundTimer:0];
}

- (FMDAccessoryAudioController)accessoryAudioController
{
  accessoryAudioController = self->_accessoryAudioController;
  if (!accessoryAudioController)
  {
    v4 = objc_alloc_init(FMDAccessoryAudioController);
    id v5 = self->_accessoryAudioController;
    self->_accessoryAudioController = v4;

    [(FMDAccessoryAudioController *)self->_accessoryAudioController setDelegate:self];
    accessoryAudioController = self->_accessoryAudioController;
  }

  return accessoryAudioController;
}

- (FMDMessageAudioController)messageAudioController
{
  messageAudioController = self->_messageAudioController;
  if (!messageAudioController)
  {
    v4 = objc_alloc_init(FMDMessageAudioController);
    id v5 = self->_messageAudioController;
    self->_messageAudioController = v4;

    messageAudioController = self->_messageAudioController;
  }

  return messageAudioController;
}

- (void)disableBiometricIDWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  v6 = sub_10000CD44();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    CFStringRef v19 = "-[FindMyDeviceHelperXPCServer disableBiometricIDWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  uint64_t v7 = +[NSXPCConnection currentConnection];
  id v8 = [v7 valueForEntitlement:@"com.apple.icloud.FindMyDevice.FindMyDeviceHelperXPCService.access"];

  if (v8 && ([&__kCFBooleanTrue isEqual:v8] & 1) != 0)
  {
    id v9 = [(FindMyDeviceHelperXPCServer *)self _disableBiometricID];
    if (v5) {
      v5[2](v5, v9);
    }
  }
  else
  {
    id v10 = NSStringFromSelector(a2);
    id v9 = +[NSString stringWithFormat:@"Entitlement not found for %@", v10];

    id v11 = objc_alloc((Class)NSError);
    if (v9) {
      CFStringRef v12 = v9;
    }
    else {
      CFStringRef v12 = &stru_10001FD10;
    }
    NSErrorUserInfoKey v16 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v17 = v12;
    __int16 v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v14 = [v11 initWithDomain:@"com.apple.icloud.FindMyDevice" code:6 userInfo:v13];

    id v15 = sub_10000CD44();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10001141C();
    }

    if (v5) {
      v5[2](v5, v14);
    }
  }
}

- (void)updateNeedsLocateAckLostModeInfo:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, id))a4;
  id v9 = sub_10000CD44();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v33 = "-[FindMyDeviceHelperXPCServer updateNeedsLocateAckLostModeInfo:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FindMyDeviceHelperXPCServer *)self isEntitled])
  {
    if (v7)
    {
      if ([v7 lostModeType] == (id)5)
      {
        id v10 = [(FindMyDeviceHelperXPCServer *)self getNeedsLocateAckLostModeFileURL];
        [(FindMyDeviceHelperXPCServer *)self _updateLostModeInfo:v7 toFile:v10 completion:v8];
        goto LABEL_25;
      }
      id v21 = [v7 lostModeType];
      __int16 v22 = NSStringFromSelector(a2);
      id v10 = +[NSString stringWithFormat:@"LostMode type (%ld) passed to %@ is not valid", v21, v22];

      id v23 = objc_alloc((Class)NSError);
      if (v10) {
        CFStringRef v24 = v10;
      }
      else {
        CFStringRef v24 = &stru_10001FD10;
      }
      NSErrorUserInfoKey v26 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v27 = v24;
      id v25 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v15 = [v23 initWithDomain:@"com.apple.icloud.FindMyDevice" code:1 userInfo:v25];

      NSErrorUserInfoKey v16 = sub_10000CD44();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10001141C();
      }
    }
    else
    {
      CFStringRef v17 = NSStringFromSelector(a2);
      id v10 = +[NSString stringWithFormat:@"LostMode info not passed to %@", v17];

      id v18 = objc_alloc((Class)NSError);
      if (v10) {
        CFStringRef v19 = v10;
      }
      else {
        CFStringRef v19 = &stru_10001FD10;
      }
      NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v29 = v19;
      id v20 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v15 = [v18 initWithDomain:@"com.apple.icloud.FindMyDevice" code:1 userInfo:v20];

      NSErrorUserInfoKey v16 = sub_10000CD44();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10001141C();
      }
    }
  }
  else
  {
    id v11 = NSStringFromSelector(a2);
    id v10 = +[NSString stringWithFormat:@"Entitlement not found for %@", v11];

    id v12 = objc_alloc((Class)NSError);
    if (v10) {
      CFStringRef v13 = v10;
    }
    else {
      CFStringRef v13 = &stru_10001FD10;
    }
    NSErrorUserInfoKey v30 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v31 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v15 = [v12 initWithDomain:@"com.apple.icloud.FindMyDevice" code:6 userInfo:v14];

    NSErrorUserInfoKey v16 = sub_10000CD44();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10001141C();
    }
  }

  if (v8) {
    v8[2](v8, v15);
  }

LABEL_25:
}

- (void)updateManagedLostModeInfo:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, id))a4;
  id v9 = sub_10000CD44();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v33 = "-[FindMyDeviceHelperXPCServer updateManagedLostModeInfo:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FindMyDeviceHelperXPCServer *)self isEntitled])
  {
    if (v7)
    {
      if ([v7 lostModeType] == (id)3)
      {
        id v10 = [(FindMyDeviceHelperXPCServer *)self getManagedLostModeFileURL];
        [(FindMyDeviceHelperXPCServer *)self _updateLostModeInfo:v7 toFile:v10 completion:v8];
        goto LABEL_25;
      }
      id v21 = [v7 lostModeType];
      __int16 v22 = NSStringFromSelector(a2);
      id v10 = +[NSString stringWithFormat:@"LostMode type (%ld) passed to %@ is not valid", v21, v22];

      id v23 = objc_alloc((Class)NSError);
      if (v10) {
        CFStringRef v24 = v10;
      }
      else {
        CFStringRef v24 = &stru_10001FD10;
      }
      NSErrorUserInfoKey v26 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v27 = v24;
      id v25 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v15 = [v23 initWithDomain:@"com.apple.icloud.FindMyDevice" code:1 userInfo:v25];

      NSErrorUserInfoKey v16 = sub_10000CD44();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10001141C();
      }
    }
    else
    {
      CFStringRef v17 = NSStringFromSelector(a2);
      id v10 = +[NSString stringWithFormat:@"LostMode info not passed to %@", v17];

      id v18 = objc_alloc((Class)NSError);
      if (v10) {
        CFStringRef v19 = v10;
      }
      else {
        CFStringRef v19 = &stru_10001FD10;
      }
      NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v29 = v19;
      id v20 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v15 = [v18 initWithDomain:@"com.apple.icloud.FindMyDevice" code:1 userInfo:v20];

      NSErrorUserInfoKey v16 = sub_10000CD44();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10001141C();
      }
    }
  }
  else
  {
    id v11 = NSStringFromSelector(a2);
    id v10 = +[NSString stringWithFormat:@"Entitlement not found for %@", v11];

    id v12 = objc_alloc((Class)NSError);
    if (v10) {
      CFStringRef v13 = v10;
    }
    else {
      CFStringRef v13 = &stru_10001FD10;
    }
    NSErrorUserInfoKey v30 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v31 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v15 = [v12 initWithDomain:@"com.apple.icloud.FindMyDevice" code:6 userInfo:v14];

    NSErrorUserInfoKey v16 = sub_10000CD44();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10001141C();
    }
  }

  if (v8) {
    v8[2](v8, v15);
  }

LABEL_25:
}

- (void)startPlayingSoundForMessage:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, id))a4;
  id v9 = sub_10000CD44();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    CFStringRef v24 = "-[FindMyDeviceHelperXPCServer startPlayingSoundForMessage:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FindMyDeviceHelperXPCServer *)self isEntitled])
  {
    id v10 = [(FindMyDeviceHelperXPCServer *)self messageAudioController];
    id v11 = +[NSXPCConnection currentConnection];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000FA20;
    v19[3] = &unk_10001C530;
    id v20 = v10;
    id v12 = v10;
    [v11 setInvalidationHandler:v19];

    [(__CFString *)v12 playSoundWithMessage:v7 completion:v8];
    id v13 = v20;
  }
  else
  {
    id v14 = NSStringFromSelector(a2);
    id v12 = +[NSString stringWithFormat:@"Entitlement not found for %@", v14];

    id v15 = objc_alloc((Class)NSError);
    if (v12) {
      CFStringRef v16 = v12;
    }
    else {
      CFStringRef v16 = &stru_10001FD10;
    }
    NSErrorUserInfoKey v21 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v22 = v16;
    CFStringRef v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v13 = [v15 initWithDomain:@"com.apple.icloud.FindMyDevice" code:6 userInfo:v17];

    id v18 = sub_10000CD44();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10001141C();
    }

    if (v8) {
      v8[2](v8, v13);
    }
  }
}

- (void)stopSoundMessageWithCompletion:(id)a3
{
  id v5 = (void (**)(id, id))a3;
  v6 = sub_10000CD44();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    CFStringRef v17 = "-[FindMyDeviceHelperXPCServer stopSoundMessageWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([(FindMyDeviceHelperXPCServer *)self isEntitled])
  {
    id v7 = [(FindMyDeviceHelperXPCServer *)self messageAudioController];
    [(__CFString *)v7 stopSoundWithCompletion:v5];
  }
  else
  {
    id v8 = NSStringFromSelector(a2);
    id v7 = +[NSString stringWithFormat:@"Entitlement not found for %@", v8];

    id v9 = objc_alloc((Class)NSError);
    if (v7) {
      CFStringRef v10 = v7;
    }
    else {
      CFStringRef v10 = &stru_10001FD10;
    }
    NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v15 = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v12 = [v9 initWithDomain:@"com.apple.icloud.FindMyDevice" code:6 userInfo:v11];

    id v13 = sub_10000CD44();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10001141C();
    }

    if (v5) {
      v5[2](v5, v12);
    }
  }
}

- (void)_updateLostModeInfo:(id)a3 toFile:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  CFStringRef v10 = (void (**)(id, id))a5;
  unsigned int v11 = [v8 lostModeEnabled];
  id v12 = sub_10000CD44();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    v45 = self;
    if (v13) {
      sub_10001160C();
    }

    v53[0] = @"lostModeEnabled";
    NSErrorUserInfoKey v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 lostModeEnabled]);
    v54[0] = v14;
    v53[1] = @"lostModeType";
    CFStringRef v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 lostModeType]);
    v54[1] = v15;
    v53[2] = @"disableSlideToUnlock";
    CFStringRef v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 disableSlideToUnlock]);
    v54[2] = v16;
    v53[3] = @"lostModeMessage";
    uint64_t v17 = [v8 message];
    v46 = v9;
    id v18 = (void *)v17;
    if (v17) {
      CFStringRef v19 = (const __CFString *)v17;
    }
    else {
      CFStringRef v19 = &stru_10001FD10;
    }
    v54[3] = v19;
    v53[4] = @"lostModeOwnerNumber";
    uint64_t v20 = [v8 phoneNumber];
    NSErrorUserInfoKey v21 = (void *)v20;
    if (v20) {
      CFStringRef v22 = (const __CFString *)v20;
    }
    else {
      CFStringRef v22 = &stru_10001FD10;
    }
    v54[4] = v22;
    v53[5] = @"lostModeFacetimeCapable";
    id v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 facetimeCapable]);
    v54[5] = v23;
    v53[6] = @"lostModeFootnoteTextPrefKey";
    uint64_t v24 = [v8 footnoteText];
    id v25 = (void *)v24;
    if (v24) {
      CFStringRef v26 = (const __CFString *)v24;
    }
    else {
      CFStringRef v26 = &stru_10001FD10;
    }
    v54[6] = v26;
    CFStringRef v27 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:7];

    id v9 = v46;
    NSErrorUserInfoKey v28 = [v46 URLByDeletingLastPathComponent];
    CFStringRef v29 = [v28 path];
    NSErrorUserInfoKey v30 = +[NSFileManager defaultManager];
    unsigned __int8 v31 = [v30 fileExistsAtPath:v29];

    if ((v31 & 1) == 0)
    {
      double v32 = +[NSFileManager defaultManager];
      id v50 = 0;
      [v32 createDirectoryAtPath:v29 withIntermediateDirectories:1 attributes:0 error:&v50];
      id v33 = v50;

      if (v33)
      {
        double v34 = sub_10000CD44();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_100011590();
        }

        id v9 = v46;
      }
    }
    NSErrorUserInfoKey v35 = +[NSPropertyListSerialization dataWithPropertyList:v27 format:200 options:0 error:0];
    id v49 = 0;
    [v35 writeToURL:v9 options:268435457 error:&v49];
    id v36 = v49;
    if (!v36)
    {
      v37 = +[NSNumber numberWithBool:1];
      id v48 = 0;
      [v9 setResourceValue:v37 forKey:NSURLIsExcludedFromBackupKey error:&v48];
      id v38 = v48;

      if (v38)
      {
        __int16 v39 = sub_10000CD44();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_1000114EC(v46, (uint64_t)v38, v39);
        }
      }
      double v40 = sub_10000CD44();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v8;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Lost mode info written on disk - %@", buf, 0xCu);
      }

      id v36 = [(FindMyDeviceHelperXPCServer *)v45 _disableBiometricID];

      id v9 = v46;
    }
  }
  else
  {
    if (v13) {
      sub_1000116C4();
    }

    CFStringRef v27 = +[NSFileManager defaultManager];
    __int16 v41 = [v9 path];
    unsigned int v42 = [v27 fileExistsAtPath:v41];

    if (v42)
    {
      NSErrorUserInfoKey v43 = sub_10000CD44();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        sub_100011680(v43);
      }

      id v47 = 0;
      [v27 removeItemAtURL:v9 error:&v47];
      id v36 = v47;
    }
    else
    {
      id v36 = 0;
    }
  }

  CFStringRef v44 = +[FMDFMIPSharedStateManager sharedInstance];
  [v44 recalculateLostMode];

  if (v10) {
    v10[2](v10, v36);
  }
}

- (id)_disableBiometricID
{
  v2 = sub_10000CD44();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Disabling Biometry ID...", buf, 2u);
  }

  v3 = objc_alloc_init(EmbeddedOSSupport);
  v4 = [(EmbeddedOSSupport *)v3 disableBiometricID];

  id v5 = sub_10000CD44();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100011738();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Disabled Biometry ID success.", v8, 2u);
  }

  return v4;
}

- (id)getManagedLostModeFileURL
{
  v2 = (void *)qword_1000277C0;
  if (!qword_1000277C0)
  {
    id v3 = objc_alloc((Class)FMSharedFileContainer);
    id v4 = [v3 initWithIdentifier:off_1000273D8];
    id v5 = [v4 url];
    uint64_t v6 = objc_msgSend(v5, "fm_preferencesPathURLForDomain:", off_1000273C8);
    id v7 = (void *)qword_1000277C0;
    qword_1000277C0 = v6;

    v2 = (void *)qword_1000277C0;
  }

  return v2;
}

- (id)getNeedsLocateAckLostModeFileURL
{
  v2 = (void *)qword_1000277C8;
  if (!qword_1000277C8)
  {
    id v3 = objc_alloc((Class)FMSharedFileContainer);
    id v4 = [v3 initWithIdentifier:off_1000273D8];
    id v5 = [v4 url];
    uint64_t v6 = objc_msgSend(v5, "fm_preferencesPathURLForDomain:", off_1000273D0);
    id v7 = (void *)qword_1000277C8;
    qword_1000277C8 = v6;

    v2 = (void *)qword_1000277C8;
  }

  return v2;
}

- (BOOL)isEntitled
{
  v2 = +[NSXPCConnection currentConnection];
  id v3 = [v2 valueForEntitlement:@"com.apple.icloud.FindMyDevice.FindMyDeviceHelperXPCService.access"];

  if (v3) {
    unsigned __int8 v4 = [&__kCFBooleanTrue isEqual:v3];
  }
  else {
    unsigned __int8 v4 = 0;
  }
  id v5 = +[NSXPCConnection currentConnection];
  uint64_t v6 = [v5 valueForEntitlement:@"com.apple.icloud.findmydeviced.access"];

  if (v6) {
    unsigned __int8 v7 = [&__kCFBooleanTrue isEqual:v6];
  }
  else {
    unsigned __int8 v7 = 0;
  }
  char v8 = v4 | v7;

  return v8;
}

- (void)setAccessoryAudioController:(id)a3
{
}

- (void)setMessageAudioController:(id)a3
{
}

- (FMDGenericAudioAccessory)currentAccessory
{
  return self->_currentAccessory;
}

- (void)setCurrentAccessory:(id)a3
{
}

- (FMDGenericAudioAccessory)waitingRoutableAccessory
{
  return self->_waitingRoutableAccessory;
}

- (void)setWaitingRoutableAccessory:(id)a3
{
}

- (NSTimer)stopSoundTimer
{
  return self->_stopSoundTimer;
}

- (void)setStopSoundTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopSoundTimer, 0);
  objc_storeStrong((id *)&self->_waitingRoutableAccessory, 0);
  objc_storeStrong((id *)&self->_currentAccessory, 0);
  objc_storeStrong((id *)&self->_messageAudioController, 0);

  objc_storeStrong((id *)&self->_accessoryAudioController, 0);
}

@end