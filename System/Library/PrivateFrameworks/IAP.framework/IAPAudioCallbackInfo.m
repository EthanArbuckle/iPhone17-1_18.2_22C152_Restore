@interface IAPAudioCallbackInfo
+ (id)sharedInstance;
- (IAPAudioCallbackInfo)init;
- (void)_deviceStateChanged:(id)a3;
- (void)_handleiAPDaemonDied:(id)a3;
- (void)_pauseOnHeadphoneDisconnectChanged:(id)a3;
- (void)_volumeChanged:(id)a3;
- (void)_volumeControlSupportChanged:(id)a3;
- (void)clearDeviceStateChangedCallback;
- (void)clearPauseOnHeadphoneDisconnectChangedCallback;
- (void)clearVolumeChangedCallback;
- (void)clearVolumeControlSupportChangedCallback;
- (void)dealloc;
- (void)setupDeviceStateChangedCallback:(void *)a3 withContext:(void *)a4 andRunLoop:(__CFRunLoop *)a5;
- (void)setupPauseOnHeadphoneDisconnectChangedCallback:(void *)a3 withContext:(void *)a4 andRunLoop:(__CFRunLoop *)a5;
- (void)setupVolumeChangedCallback:(void *)a3 withContext:(void *)a4 andRunLoop:(__CFRunLoop *)a5;
- (void)setupVolumeControlSupportChangedCallback:(void *)a3 withContext:(void *)a4 andRunLoop:(__CFRunLoop *)a5;
@end

@implementation IAPAudioCallbackInfo

- (void)_handleiAPDaemonDied:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3), "postNotificationName:object:", @"IAPAudioDeviceStateChangedNotification", 0);
  v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"IAPAudioVolumeControlSupportChangedNotification" object:0];
}

- (IAPAudioCallbackInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)IAPAudioCallbackInfo;
  v2 = [(IAPAudioCallbackInfo *)&v4 init];
  if (v2)
  {
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__handleiAPDaemonDied_, @"kIAPDServerDiedNotification", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__handleiAPDaemonDied_, @"kIAP2ServerDiedNotification", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", @"kIAPDServerDiedNotification");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", @"kIAP2ServerDiedNotification");

  v3.receiver = self;
  v3.super_class = (Class)IAPAudioCallbackInfo;
  [(IAPAudioCallbackInfo *)&v3 dealloc];
}

+ (id)sharedInstance
{
  if (+[IAPAudioCallbackInfo sharedInstance]::once != -1) {
    dispatch_once(&+[IAPAudioCallbackInfo sharedInstance]::once, &__block_literal_global_1);
  }
  return (id)+[IAPAudioCallbackInfo sharedInstance]::sharedInstance;
}

IAPAudioCallbackInfo *__38__IAPAudioCallbackInfo_sharedInstance__block_invoke()
{
  result = objc_alloc_init(IAPAudioCallbackInfo);
  +[IAPAudioCallbackInfo sharedInstance]::sharedInstance = (uint64_t)result;
  return result;
}

- (void)setupDeviceStateChangedCallback:(void *)a3 withContext:(void *)a4 andRunLoop:(__CFRunLoop *)a5
{
  [(NSLock *)self->_lock lock];
  self->_deviceStateChangedCallback = a3;
  self->_deviceStateChangedContext = a4;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel__deviceStateChanged_, @"IAPAudioDeviceStateChangedNotification", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)IAPAudioDeviceStateChangedNotificationCallBack, @"IAPAudioDeviceStateChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, self, (CFNotificationCallback)AccessoryDigitalAudioNotificationCallBack, @"com.apple.accessories.audio.stateChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)clearDeviceStateChangedCallback
{
  [(NSLock *)self->_lock lock];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"IAPAudioDeviceStateChangedNotification", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"IAPAudioDeviceStateChangedNotification", 0);
  objc_super v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, 0, @"com.apple.accessories.audio.stateChanged", 0);
  self->_deviceStateChangedCallback = 0;
  self->_deviceStateChangedContext = 0;
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)setupVolumeChangedCallback:(void *)a3 withContext:(void *)a4 andRunLoop:(__CFRunLoop *)a5
{
  [(NSLock *)self->_lock lock];
  self->_volumeChangedCallback = a3;
  self->_volumeChangedContext = a4;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)IAPAudioVolumeChangedNotificationCallBack, @"IAPAudioVolumeChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)clearVolumeChangedCallback
{
  [(NSLock *)self->_lock lock];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"IAPAudioVolumeChangedNotification", 0);
  self->_volumeChangedCallback = 0;
  self->_volumeChangedContext = 0;
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)setupPauseOnHeadphoneDisconnectChangedCallback:(void *)a3 withContext:(void *)a4 andRunLoop:(__CFRunLoop *)a5
{
  [(NSLock *)self->_lock lock];
  self->_pauseOnHeadphoneDisconnectChangedCallback = a3;
  self->_pauseOnHeadphoneDisconnectChangedContext = a4;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)IAPAudioShouldPauseOnHeadphoneDisconnectChangedNotificationCallBack, @"IAPAudioShouldPauseOnHeadphoneDisconnectChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)clearPauseOnHeadphoneDisconnectChangedCallback
{
  [(NSLock *)self->_lock lock];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"IAPAudioShouldPauseOnHeadphoneDisconnectChangedNotification", 0);
  self->_pauseOnHeadphoneDisconnectChangedCallback = 0;
  self->_pauseOnHeadphoneDisconnectChangedContext = 0;
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)setupVolumeControlSupportChangedCallback:(void *)a3 withContext:(void *)a4 andRunLoop:(__CFRunLoop *)a5
{
  [(NSLock *)self->_lock lock];
  self->_volumeControlSupportChangedCallback = a3;
  self->_volumeControlSupportChangedContext = a4;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel__volumeControlSupportChanged_, @"IAPAudioVolumeControlSupportChangedNotification", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)IAPAudioVolumeControlSupportChangedNotificationCallBack, @"IAPAudioVolumeControlSupportChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)clearVolumeControlSupportChangedCallback
{
  [(NSLock *)self->_lock lock];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"IAPAudioVolumeControlSupportChangedNotification", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"IAPAudioVolumeControlSupportChangedNotification", 0);
  self->_volumeControlSupportChangedCallback = 0;
  self->_volumeControlSupportChangedContext = 0;
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)_deviceStateChanged:(id)a3
{
}

- (void)_volumeChanged:(id)a3
{
}

- (void)_pauseOnHeadphoneDisconnectChanged:(id)a3
{
}

- (void)_volumeControlSupportChanged:(id)a3
{
}

@end