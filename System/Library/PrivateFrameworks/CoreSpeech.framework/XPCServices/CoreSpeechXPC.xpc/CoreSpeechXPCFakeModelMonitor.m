@interface CoreSpeechXPCFakeModelMonitor
- (BOOL)shouldRollFakeModel;
- (CoreSpeechXPCFakeModelMonitor)init;
- (NSString)lastFakeModelUsedHash;
- (OS_dispatch_queue)queue;
- (int)fakeAssetRollNotificationRegistrationToken;
- (void)_registerForFakeAssetRollNotification;
- (void)setFakeAssetRollNotificationRegistrationToken:(int)a3;
- (void)setLastFakeModelUsedHash:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldRollFakeModel:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation CoreSpeechXPCFakeModelMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastFakeModelUsedHash, 0);
}

- (void)setFakeAssetRollNotificationRegistrationToken:(int)a3
{
  self->_fakeAssetRollNotificationRegistrationToken = a3;
}

- (int)fakeAssetRollNotificationRegistrationToken
{
  return self->_fakeAssetRollNotificationRegistrationToken;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setShouldRollFakeModel:(BOOL)a3
{
  self->_shouldRollFakeModel = a3;
}

- (BOOL)shouldRollFakeModel
{
  return self->_shouldRollFakeModel;
}

- (void)setLastFakeModelUsedHash:(id)a3
{
}

- (NSString)lastFakeModelUsedHash
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)_registerForFakeAssetRollNotification
{
  if (CSIsInternalBuild() && self->_fakeAssetRollNotificationRegistrationToken == -1)
  {
    int out_token = 0;
    objc_initWeak(&location, self);
    v3 = (const char *)[@"com.apple.corespeech.fakeasset.rolling" UTF8String];
    queue = self->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000035C8;
    handler[3] = &unk_10001C4E8;
    objc_copyWeak(&v8, &location);
    uint32_t v5 = notify_register_dispatch(v3, &out_token, (dispatch_queue_t)queue, handler);
    if (v5)
    {
      v6 = CSLogContextFacilityCoreSpeech;
      if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:
        objc_destroyWeak(&v8);
        objc_destroyWeak(&location);
        return;
      }
      *(_DWORD *)buf = 136315650;
      v12 = "-[CoreSpeechXPCFakeModelMonitor _registerForFakeAssetRollNotification]";
      __int16 v13 = 2112;
      CFStringRef v14 = @"com.apple.corespeech.fakeasset.rolling";
      __int16 v15 = 1024;
      uint32_t v16 = v5;
    }
    else
    {
      if (out_token != -1)
      {
        self->_fakeAssetRollNotificationRegistrationToken = out_token;
        goto LABEL_11;
      }
      v6 = CSLogContextFacilityCoreSpeech;
      if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136315650;
      v12 = "-[CoreSpeechXPCFakeModelMonitor _registerForFakeAssetRollNotification]";
      __int16 v13 = 2112;
      CFStringRef v14 = @"com.apple.corespeech.fakeasset.rolling";
      __int16 v15 = 1024;
      uint32_t v16 = 0;
    }
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Failed to register for notification %@ (status=%d)", buf, 0x1Cu);
    goto LABEL_11;
  }
}

- (void)stop
{
  int fakeAssetRollNotificationRegistrationToken = self->_fakeAssetRollNotificationRegistrationToken;
  self->_int fakeAssetRollNotificationRegistrationToken = -1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000371C;
  block[3] = &unk_10001C4C0;
  int v5 = fakeAssetRollNotificationRegistrationToken;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000037A4;
  block[3] = &unk_10001C750;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (CoreSpeechXPCFakeModelMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CoreSpeechXPCFakeModelMonitor;
  v2 = [(CoreSpeechXPCFakeModelMonitor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = dispatch_get_global_queue(33, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_int fakeAssetRollNotificationRegistrationToken = -1;
  }
  return v2;
}

@end