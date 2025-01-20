@interface FMDExtSoundController
- (FMDAccessoryAudioController)accessoryAudioController;
- (FMDGenericAudioAccessory)currentAccessory;
- (NSTimer)stopSoundTimer;
- (void)_stopSoundTimerFired:(id)a3;
- (void)invalidateStopSoundTimer;
- (void)setAccessoryAudioController:(id)a3;
- (void)setCurrentAccessory:(id)a3;
- (void)setStopSoundTimer:(id)a3;
- (void)setTimeoutForDuration:(double)a3;
- (void)startPlayingSoundForAccessory2:(id)a3 duration:(double)a4 rampUpDuration:(double)a5 channels:(id)a6 completion:(id)a7;
- (void)startPlayingSoundForAccessory:(id)a3 duration:(double)a4 rampUpDuration:(double)a5 channels:(id)a6 completion:(id)a7;
- (void)stopPlayingForAccessory2:(id)a3 rampDownDuration:(double)a4 completion:(id)a5;
- (void)stopPlayingSoundForAccessory:(id)a3 rampDownDuration:(double)a4 completion:(id)a5;
@end

@implementation FMDExtSoundController

- (void)startPlayingSoundForAccessory:(id)a3 duration:(double)a4 rampUpDuration:(double)a5 channels:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  v14 = +[FMNSXPCConnectionCache sharedCache];
  v15 = +[FMNSXPCConnectionConfiguration helperConfiguration];
  v16 = [v14 resumeConnectionWithConfiguration:v15];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100003C98;
  v24[3] = &unk_1000204D8;
  id v17 = v11;
  id v25 = v17;
  [v16 addFailureBlock:v24];
  v18 = [v16 remoteObjectProxy];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100003D34;
  v21[3] = &unk_100020500;
  id v22 = v16;
  id v23 = v17;
  id v19 = v16;
  id v20 = v17;
  [v18 startPlayingSoundForAccessory:v13 duration:v12 rampUpDuration:v21 channels:a4 completion:a5];
}

- (void)stopPlayingSoundForAccessory:(id)a3 rampDownDuration:(double)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = +[FMNSXPCConnectionCache sharedCache];
  v10 = +[FMNSXPCConnectionConfiguration helperConfiguration];
  id v11 = [v9 resumeConnectionWithConfiguration:v10];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100003F88;
  v19[3] = &unk_1000204D8;
  id v12 = v7;
  id v20 = v12;
  [v11 addFailureBlock:v19];
  id v13 = [v11 remoteObjectProxy];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100004024;
  v16[3] = &unk_100020500;
  id v17 = v11;
  id v18 = v12;
  id v14 = v11;
  id v15 = v12;
  [v13 stopPlayingForAccessory:v8 rampDownDuration:v16 completion:a4];
}

- (void)startPlayingSoundForAccessory2:(id)a3 duration:(double)a4 rampUpDuration:(double)a5 channels:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = sub_100006A90();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v28 = v12;
    __int16 v29 = 2048;
    double v30 = a4;
    __int16 v31 = 2048;
    double v32 = a5;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Start playing sound for accessory: %@ duration: %f rampUpDuration: %f", buf, 0x20u);
  }

  if (v12)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100004304;
    v19[3] = &unk_100020578;
    double v23 = a5;
    void v19[4] = self;
    id v20 = v12;
    id v21 = v13;
    double v24 = a4;
    id v22 = v14;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);
  }
  else if (v14)
  {
    id v16 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v25 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v26 = @"Accessory cannot be nil";
    id v17 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v18 = [v16 initWithDomain:@"com.apple.icloud.FindMyDevice" code:1 userInfo:v17];
    (*((void (**)(id, id))v14 + 2))(v14, v18);
  }
}

- (void)stopPlayingForAccessory2:(id)a3 rampDownDuration:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = sub_100006A90();
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
    v14[2] = sub_100004708;
    v14[3] = &unk_1000205C8;
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
    id v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v13 = [v11 initWithDomain:@"com.apple.icloud.FindMyDevice" code:1 userInfo:v12];
    (*((void (**)(id, id))v9 + 2))(v9, v13);
  }
}

- (FMDAccessoryAudioController)accessoryAudioController
{
  accessoryAudioController = self->_accessoryAudioController;
  if (!accessoryAudioController)
  {
    v4 = objc_alloc_init(FMDAccessoryAudioController);
    v5 = self->_accessoryAudioController;
    self->_accessoryAudioController = v4;

    [(FMDAccessoryAudioController *)self->_accessoryAudioController setDelegate:self];
    accessoryAudioController = self->_accessoryAudioController;
  }

  return accessoryAudioController;
}

- (void)setTimeoutForDuration:(double)a3
{
  v5 = sub_100006A90();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = +[NSThread currentThread];
    int v11 = 134218240;
    double v12 = a3;
    __int16 v13 = 1024;
    unsigned int v14 = [v6 isMainThread];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set timeout for duration: %f inMainThread: %d", (uint8_t *)&v11, 0x12u);
  }
  id v7 = [(FMDExtSoundController *)self stopSoundTimer];
  [v7 invalidate];

  id v8 = +[NSTimer timerWithTimeInterval:self target:"_stopSoundTimerFired:" selector:0 userInfo:0 repeats:a3];
  [(FMDExtSoundController *)self setStopSoundTimer:v8];

  id v9 = +[NSRunLoop currentRunLoop];
  v10 = [(FMDExtSoundController *)self stopSoundTimer];
  [v9 addTimer:v10 forMode:NSRunLoopCommonModes];
}

- (void)_stopSoundTimerFired:(id)a3
{
  v4 = sub_100006A90();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stop sound timer fired", v6, 2u);
  }

  v5 = [(FMDExtSoundController *)self currentAccessory];
  [(FMDExtSoundController *)self stopPlayingSoundForAccessory:v5 rampDownDuration:&stru_100020608 completion:0.5];
}

- (void)invalidateStopSoundTimer
{
  v3 = sub_100006A90();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating stop sound timer", v5, 2u);
  }

  v4 = [(FMDExtSoundController *)self stopSoundTimer];
  [v4 invalidate];

  [(FMDExtSoundController *)self setStopSoundTimer:0];
}

- (void)setAccessoryAudioController:(id)a3
{
}

- (FMDGenericAudioAccessory)currentAccessory
{
  return self->_currentAccessory;
}

- (void)setCurrentAccessory:(id)a3
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
  objc_storeStrong((id *)&self->_currentAccessory, 0);

  objc_storeStrong((id *)&self->_accessoryAudioController, 0);
}

@end