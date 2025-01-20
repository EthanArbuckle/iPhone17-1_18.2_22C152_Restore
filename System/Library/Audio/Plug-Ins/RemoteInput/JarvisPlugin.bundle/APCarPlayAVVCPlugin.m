@interface APCarPlayAVVCPlugin
- (APCarPlayAVVCPlugin)initWithPluginDelegate:(id)a3;
- (NSArray)devices;
- (int)createNewDevice;
- (int)destroyDevice:(id)a3;
- (void)clientInit;
- (void)dealloc;
- (void)handleNotification:(__CFString *)a3 fromObject:(const void *)a4;
- (void)invalidate;
@end

@implementation APCarPlayAVVCPlugin

- (APCarPlayAVVCPlugin)initWithPluginDelegate:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)APCarPlayAVVCPlugin;
  v4 = [(APCarPlayAVVCPlugin *)&v22 init];
  v5 = v4;
  if (v4)
  {
    v4->_delegate = (AVAudioRemoteInputPluginDelegate *)a3;
    v6 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    v5->_devices = v6;
    if (v6
      && (dispatch_queue_t v7 = dispatch_queue_create("CarPlayAVVCPluginDevicesQueue", 0),
          (v5->_devicesQueue = (OS_dispatch_queue *)v7) != 0))
    {
      v5->_carPlayAVVCClient = 0;
      int v8 = _os_feature_enabled_impl();
      v5->_isAVOutputDeviceEnabled = v8;
      if (v8)
      {
        if (objc_msgSend(objc_msgSend(+[AVOutputContext sharedSystemRemoteDisplayContext](AVOutputContext, "sharedSystemRemoteDisplayContext"), "outputDevice"), "deviceType") == (char *)&dword_0 + 2)
        {
          if (dword_CC98 <= 50 && (dword_CC98 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          devicesQueue = v5->_devicesQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_2D74;
          block[3] = &unk_8388;
          block[4] = v5;
          dispatch_sync(devicesQueue, block);
        }
        objc_initWeak(&location, v5);
        v5->_sharedSystemRemoteDisplayContext = (AVOutputContext *)+[AVOutputContext sharedSystemRemoteDisplayContext];
        v13 = +[NSNotificationCenter defaultCenter];
        uint64_t v14 = AVOutputContextOutputDeviceDidChangeNotification;
        sharedSystemRemoteDisplayContext = v5->_sharedSystemRemoteDisplayContext;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_2D7C;
        v18[3] = &unk_83B0;
        objc_copyWeak(&v19, &location);
        v5->_observer = [(NSNotificationCenter *)v13 addObserverForName:v14 object:sharedSystemRemoteDisplayContext queue:0 usingBlock:v18];
        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
      else
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_2F60, kFigEndpointNotification_EndpointActivated, 0, (CFNotificationSuspensionBehavior)0);
        v10 = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(v10, v5, (CFNotificationCallback)sub_2F60, kFigEndpointNotification_EndpointDeactivated, 0, (CFNotificationSuspensionBehavior)0);
        v11 = v5->_devicesQueue;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_2F68;
        v17[3] = &unk_8388;
        v17[4] = v5;
        dispatch_sync(v11, v17);
      }
      if (dword_CC98 <= 50 && (dword_CC98 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      APSLogErrorAt();

      return 0;
    }
  }
  return v5;
}

- (void)invalidate
{
  if (self->_isAVOutputDeviceEnabled)
  {
    if (self->_observer)
    {
      [+[NSNotificationCenter defaultCenter] removeObserver:self->_observer];
      self->_observer = 0;
    }

    self->_sharedSystemRemoteDisplayContext = 0;
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kFigEndpointNotification_EndpointDeactivated, 0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v4, self, kFigEndpointNotification_EndpointActivated, 0);
  }
  devicesQueue = self->_devicesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3070;
  block[3] = &unk_8388;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)devicesQueue, block);
  v6 = self->_devicesQueue;
  if (v6)
  {
    dispatch_release((dispatch_object_t)v6);
    self->_devicesQueue = 0;
  }
  self->_delegate = 0;
}

- (void)dealloc
{
  carPlayAVVCClient = self->_carPlayAVVCClient;
  if (carPlayAVVCClient) {
    CFRelease(carPlayAVVCClient);
  }
  v4.receiver = self;
  v4.super_class = (Class)APCarPlayAVVCPlugin;
  [(APCarPlayAVVCPlugin *)&v4 dealloc];
}

- (int)createNewDevice
{
  [(APCarPlayAVVCPlugin *)self clientInit];
  if (self->_carPlayAVVCClient)
  {
    v3 = [[APCarPlayAVVCDevice alloc] initWithXPCClient:self->_carPlayAVVCClient];
    if (v3)
    {
      objc_super v4 = v3;
      [(NSMutableArray *)self->_devices addObject:v3];
      if (!self->_isAVOutputDeviceEnabled)
      {
        LocalCenter = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)sub_2F60, kFigEndpointNotification_EndpointDeactivated, v4, (CFNotificationSuspensionBehavior)0);
      }
      if (dword_CC98 <= 50 && (dword_CC98 != -1 || _LogCategory_Initialize()))
      {
        dispatch_queue_t v7 = v4;
        int v8 = [(APCarPlayAVVCDevice *)v4 deviceIdentifier];
        LogPrintF();
      }
      -[AVAudioRemoteInputPluginDelegate inputPlugin:didPublishDevice:](self->_delegate, "inputPlugin:didPublishDevice:", self, v4, v7, v8);
      return 0;
    }
    else
    {
      return -6718;
    }
  }
  else
  {
    APSLogErrorAt();
    return -6728;
  }
}

- (int)destroyDevice:(id)a3
{
  devices = self->_devices;
  if (devices && -[NSMutableArray containsObject:](devices, "containsObject:"))
  {
    if (dword_CC98 <= 50 && (dword_CC98 != -1 || _LogCategory_Initialize()))
    {
      id v8 = a3;
      id v9 = [a3 deviceIdentifier];
      LogPrintF();
    }
    -[AVAudioRemoteInputPluginDelegate inputPlugin:didUnpublishDevice:](self->_delegate, "inputPlugin:didUnpublishDevice:", self, a3, v8, v9);
    [(NSMutableArray *)self->_devices removeObject:a3];
    if (!self->_isAVOutputDeviceEnabled)
    {
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterRemoveObserver(LocalCenter, self, kFigEndpointNotification_EndpointDeactivated, a3);
    }
  }
  return 0;
}

- (void)handleNotification:(__CFString *)a3 fromObject:(const void *)a4
{
  if (dword_CC98 <= 30 && (dword_CC98 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatch_queue_t v7 = self;
  devicesQueue = self->_devicesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_34D0;
  block[3] = &unk_83D8;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)devicesQueue, block);
}

- (void)clientInit
{
  values = @"avvcDevice_ConnectionLost";
  keys = (void *)kFigXPCRemoteClientOption_DeathNoticeName;
  if (!self->_carPlayAVVCClient)
  {
    CFAllocatorRef Default = CFAllocatorGetDefault();
    CFDictionaryRef v3 = CFDictionaryCreate(Default, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (FigXPCRemoteClientCreate()
      && dword_CC98 <= 90
      && (dword_CC98 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v3) {
      CFRelease(v3);
    }
  }
}

- (NSArray)devices
{
  return &self->_devices->super;
}

@end