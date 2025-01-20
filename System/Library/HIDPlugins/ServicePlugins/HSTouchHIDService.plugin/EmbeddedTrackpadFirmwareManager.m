@interface EmbeddedTrackpadFirmwareManager
- (void)_handleGetPropertyEvent:(id)a3;
- (void)_handleHostStateEvent:(id)a3;
- (void)handleConsume:(id)a3;
- (void)handleSetPropertyEvent:(id)a3;
@end

@implementation EmbeddedTrackpadFirmwareManager

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    [(EmbeddedTrackpadFirmwareManager *)self _handleHostStateEvent:v4];
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v7)
    {
      [(EmbeddedTrackpadFirmwareManager *)self _handleGetPropertyEvent:v6];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)EmbeddedTrackpadFirmwareManager;
      [(TrackpadFirmwareManager *)&v8 handleConsume:v6];
    }
  }
}

- (void)handleSetPropertyEvent:(id)a3
{
  id v4 = a3;
  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v5 isEqualToString:@"DeviceOpenedByEventSystem"])
  {
    id v6 = (const void *)v4[5];
    [(TrackpadFirmwareManager *)self mtDeviceRef];
    io_registry_entry_t Service = MTDeviceGetService();
    IORegistryEntrySetCFProperty(Service, v5, v6);
  }
  v8.receiver = self;
  v8.super_class = (Class)EmbeddedTrackpadFirmwareManager;
  [(TrackpadFirmwareManager *)&v8 handleSetPropertyEvent:v4];
}

- (void)_handleGetPropertyEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v6 = v4 + 2;
  int v7 = *((char *)v4 + 39);
  if (v7 < 0)
  {
    if (v4[3] != 32) {
      goto LABEL_20;
    }
    id v6 = (void *)*v6;
  }
  else if (v7 != 32)
  {
    goto LABEL_20;
  }
  objc_super v8 = (void *)*v6;
  uint64_t v9 = v6[1];
  uint64_t v11 = v6[2];
  uint64_t v10 = v6[3];
  if (v8 == (void *)0x746E696F50444948
    && v9 == 0x656C656363417265
    && v11 == 0x754D6E6F69746172
    && v10 == 0x7265696C7069746CLL)
  {
    v15 = [(TrackpadFirmwareManager *)self extendedFeatures];
    unsigned __int8 v16 = [v15 unsignedIntValue];

    v17 = [(TrackpadFirmwareManager *)self productId];
    unsigned int v18 = [v17 intValue];

    if (v18 == 613 && (v16 & 1) == 0)
    {
      v19 = (void *)v5[5];
      v5[5] = &off_149A78;
    }
  }
LABEL_20:
  v20.receiver = self;
  v20.super_class = (Class)EmbeddedTrackpadFirmwareManager;
  [(TrackpadFirmwareManager *)&v20 handleConsume:v5];
}

- (void)_handleHostStateEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = MTLoggingPlugin();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316930;
      v23 = "[Debug] ";
      __int16 v24 = 2080;
      v25 = "";
      __int16 v26 = 2080;
      v27 = "-[EmbeddedTrackpadFirmwareManager _handleHostStateEvent:]";
      __int16 v28 = 2048;
      unint64_t v29 = [(TrackpadFirmwareManager *)self mtDeviceId];
      __int16 v30 = 1024;
      unsigned int v31 = [v4 coverClosed];
      __int16 v32 = 1024;
      unsigned int v33 = [v4 displayOff];
      __int16 v34 = 1024;
      unsigned int v35 = [v4 screenOrientation];
      __int16 v36 = 1024;
      unsigned int v37 = [v4 deviceOrientation];
      _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s [0x%llX] Notifying device of host state change coverClosed(%d) displayOff(%d) screenOrientation(%d) deviceOrientation(%d)", buf, 0x42u);
    }

    char v15 = -99;
    unsigned __int8 v16 = [v4 screenOrientation];
    unsigned __int8 v6 = [v4 coverClosed];
    if ([v4 displayOff]) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    char v17 = v7 | v6;
    unsigned __int8 v18 = [v4 deviceOrientation];
    int v19 = 0;
    char v20 = 0;
    if (![(TrackpadFirmwareManager *)self mtDeviceRef])
    {
      v12 = +[NSAssertionHandler currentHandler];
      v13 = +[NSString stringWithUTF8String:"IOReturn HSTPipeline::FirmwareUtil::SetReport(MTDeviceRef _Nonnull, const T &) [T = HSTPipeline::FirmwareInterface::FeatureReport::HostNotificationControl]"];
      [v12 handleFailureInFunction:v13, @"FirmwareUtil.h", 9, @"Invalid parameter not satisfying: %@", @"device" file lineNumber description];
    }
    unsigned int v8 = MTDeviceSetReport();
    if (v8)
    {
      uint64_t v9 = MTLoggingPlugin();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        unint64_t v10 = [(TrackpadFirmwareManager *)self mtDeviceId];
        *(_DWORD *)buf = 136316162;
        v23 = "[Error] ";
        __int16 v24 = 2080;
        v25 = "";
        __int16 v26 = 2080;
        v27 = "-[EmbeddedTrackpadFirmwareManager _handleHostStateEvent:]";
        __int16 v28 = 2048;
        unint64_t v29 = v10;
        __int16 v30 = 1024;
        unsigned int v31 = v8;
        _os_log_impl(&def_411C8, v9, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s [0x%llX] Failed to send host state notification to the device with error: 0x%08x", buf, 0x30u);
      }
    }
    v14.receiver = self;
    v14.super_class = (Class)EmbeddedTrackpadFirmwareManager;
    [(TrackpadFirmwareManager *)&v14 handleConsume:v4];
  }
  else
  {
    uint64_t v11 = MTLoggingPlugin();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v23 = "[Error] ";
      __int16 v24 = 2080;
      v25 = "";
      __int16 v26 = 2080;
      v27 = "-[EmbeddedTrackpadFirmwareManager _handleHostStateEvent:]";
      __int16 v28 = 2048;
      unint64_t v29 = [(TrackpadFirmwareManager *)self mtDeviceId];
      _os_log_impl(&def_411C8, v11, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s [0x%llX] Received invalid host state event", buf, 0x2Au);
    }

    v21.receiver = self;
    v21.super_class = (Class)EmbeddedTrackpadFirmwareManager;
    [(TrackpadFirmwareManager *)&v21 handleConsume:0];
  }
}

@end