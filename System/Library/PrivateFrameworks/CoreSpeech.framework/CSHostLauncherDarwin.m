@interface CSHostLauncherDarwin
+ (id)propertyDictForDarwin;
+ (id)sharedInstance;
- (BOOL)wakeHostForVoiceTrigger;
- (CSHostLauncherDarwin)init;
- (void)dealloc;
@end

@implementation CSHostLauncherDarwin

- (void).cxx_destruct
{
}

- (BOOL)wakeHostForVoiceTrigger
{
  v2 = +[CSUtils deviceIdentifier];
  v3 = [v2 dataUsingEncoding:4];

  if (v3)
  {
    char v12 = 1;
    v4 = +[NSMutableData dataWithBytes:&v12 length:1];
    id v5 = v3;
    objc_msgSend(v4, "appendBytes:length:", objc_msgSend(v5, "bytes"), 25);
    v6 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      id v8 = [v4 length];
      *(_DWORD *)buf = 136315650;
      v14 = "-[CSHostLauncherDarwin wakeHostForVoiceTrigger]";
      __int16 v15 = 2050;
      id v16 = v8;
      __int16 v17 = 2114;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Sending HID report (length = %{public}lu) to host with deviceId info (%{public}@)", buf, 0x20u);
    }
    id v9 = v4;
    [v9 bytes];
    [v9 length];
    IOHIDUserDeviceHandleReport();
  }
  else
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[CSHostLauncherDarwin wakeHostForVoiceTrigger]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Failed to fetch local deviceId, abort", buf, 0xCu);
    }
  }

  return v3 != 0;
}

- (void)dealloc
{
  device = self->_device;
  if (device) {
    IOHIDUserDeviceCancel(device);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSHostLauncherDarwin;
  [(CSHostLauncherDarwin *)&v4 dealloc];
}

- (CSHostLauncherDarwin)init
{
  if (!+[CSUtils isDarwinOS]) {
    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)CSHostLauncherDarwin;
  self = [(CSHostLauncherDarwin *)&v12 init];
  if (self)
  {
    v3 = (OS_dispatch_queue *)dispatch_queue_create("HID event callback queue", 0);
    hidCallbackQueue = self->_hidCallbackQueue;
    self->_hidCallbackQueue = v3;

    id v5 = +[CSHostLauncherDarwin propertyDictForDarwin];
    v6 = (__IOHIDUserDevice *)IOHIDUserDeviceCreate();
    self->_device = v6;
    if (v6)
    {
      IOHIDUserDeviceSetDispatchQueue(v6, (dispatch_queue_t)self->_hidCallbackQueue);
      device = self->_device;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1001109C8;
      handler[3] = &unk_100253AE0;
      v11 = self;
      IOHIDUserDeviceSetCancelHandler(device, handler);
      IOHIDUserDeviceActivate(self->_device);
      NSLog(@"Created HID device successfully");

      goto LABEL_5;
    }
    NSLog(@"Error : Failed in creating device");

LABEL_7:
    id v8 = 0;
    goto LABEL_8;
  }
LABEL_5:
  self = self;
  id v8 = self;
LABEL_8:

  return v8;
}

+ (id)propertyDictForDarwin
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDataRef v3 = CFDataCreate(kCFAllocatorDefault, byte_1001AC7E0, 25);
  if (v3) {
    CFDictionarySetValue(Mutable, @"ReportDescriptor", v3);
  }
  int valuePtr = 4000000;
  CFNumberRef v4 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (v4) {
    CFDictionarySetValue(Mutable, @"RequestTimeout", v4);
  }
  CFDictionarySetValue(Mutable, @"HIDRelaySupport", kCFBooleanTrue);
  CFDictionarySetValue(Mutable, @"HIDRelayUSBInterface", @"SiriHIDDevice");
  id v5 = [(__CFDictionary *)Mutable copy];

  return v5;
}

+ (id)sharedInstance
{
  if (qword_1002A3A30 != -1) {
    dispatch_once(&qword_1002A3A30, &stru_100251C90);
  }
  v2 = (void *)qword_1002A3A28;
  return v2;
}

@end