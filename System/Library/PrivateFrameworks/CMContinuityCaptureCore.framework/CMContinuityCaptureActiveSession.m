@interface CMContinuityCaptureActiveSession
- (BOOL)isInitiatedOnCommunalDevice;
- (CMContinuityCaptureActiveSession)initWithDevice:(id)a3 transport:(int64_t)a4 initiatedOnCommunalDevice:(BOOL)a5;
- (ContinuityCaptureTransportDevice)device;
- (NSDate)shieldSessionIDGeneratedTime;
- (NSString)shieldSessionID;
- (id)description;
- (int64_t)deviceModel;
- (int64_t)transport;
- (void)launchShieldUI;
- (void)setDevice:(id)a3;
- (void)setDeviceModel:(int64_t)a3;
- (void)setShieldSessionID:(id)a3;
- (void)setShieldSessionIDGeneratedTime:(id)a3;
- (void)setTransport:(int64_t)a3;
@end

@implementation CMContinuityCaptureActiveSession

- (CMContinuityCaptureActiveSession)initWithDevice:(id)a3 transport:(int64_t)a4 initiatedOnCommunalDevice:(BOOL)a5
{
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CMContinuityCaptureActiveSession;
  v10 = [(CMContinuityCaptureActiveSession *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a3);
    v11->_transport = a4;
    v11->_initiatedOnCommunalDevice = a5;
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sCameraStreamingPowerEventsByCameraType = v11->_sCameraStreamingPowerEventsByCameraType;
    v11->_sCameraStreamingPowerEventsByCameraType = v12;

    [(CMContinuityCaptureActiveSession *)v11 launchShieldUI];
    v14 = v11;
  }

  return v11;
}

- (void)launchShieldUI
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    device = self->_device;
    v5 = [(CMContinuityCaptureActiveSession *)self device];
    int v10 = 138413058;
    v11 = self;
    __int16 v12 = 2080;
    v13 = "-[CMContinuityCaptureActiveSession launchShieldUI]";
    __int16 v14 = 2114;
    v15 = device;
    __int16 v16 = 1024;
    int v17 = [v5 isPlacementStepSkipped];
    _os_log_impl(&dword_235FC2000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s %{public}@ (isPlacementStepSkipped:%d)", (uint8_t *)&v10, 0x26u);
  }
  if (FigGetCFPreferenceBooleanWithDefault()
    && (([(ContinuityCaptureTransportDevice *)self->_device wired] & 1) != 0
     || ([(ContinuityCaptureTransportDevice *)self->_device wifiP2pActive] & 1) != 0))
  {
    v6 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:2];
    v7 = (unsigned char *)[v6 mutableBytes];
    v8 = [(CMContinuityCaptureActiveSession *)self device];
    unsigned char *v7 = *v7 & 0xFE | [v8 isPlacementStepSkipped];

    id v9 = [(CMContinuityCaptureActiveSession *)self device];
    objc_msgSend(v9, "preLaunchShieldUIForTransport:data:", -[CMContinuityCaptureActiveSession transport](self, "transport"), v6);
  }
  else
  {
    v6 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = self;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%@ prelaunch shield disabled", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (ContinuityCaptureTransportDevice)device
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_device;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)transport
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t transport = v2->_transport;
  objc_sync_exit(v2);

  return transport;
}

- (void)setDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v4 = (ContinuityCaptureTransportDevice *)a3;
  v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(CMContinuityCaptureActiveSession *)self device];
    v7 = [(CMContinuityCaptureActiveSession *)self device];
    int v10 = 138413570;
    v11 = self;
    __int16 v12 = 2080;
    v13 = "-[CMContinuityCaptureActiveSession setDevice:]";
    __int16 v14 = 2112;
    v15 = v6;
    __int16 v16 = 2048;
    int v17 = v7;
    __int16 v18 = 2112;
    v19 = v4;
    __int16 v20 = 2048;
    v21 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s %@(%p) -> %@(%p)", (uint8_t *)&v10, 0x3Eu);
  }
  v8 = self;
  objc_sync_enter(v8);
  device = v8->_device;
  v8->_device = v4;

  objc_sync_exit(v8);
  [(CMContinuityCaptureActiveSession *)v8 launchShieldUI];
}

- (void)setTransport:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138413058;
    v8 = self;
    __int16 v9 = 2080;
    int v10 = "-[CMContinuityCaptureActiveSession setTransport:]";
    __int16 v11 = 1024;
    int v12 = [(CMContinuityCaptureActiveSession *)self transport];
    __int16 v13 = 1024;
    int v14 = a3;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s %d -> %d", (uint8_t *)&v7, 0x22u);
  }

  v6 = self;
  objc_sync_enter(v6);
  v6->_int64_t transport = a3;
  objc_sync_exit(v6);
}

- (NSString)shieldSessionID
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_shieldSessionID;
  objc_sync_exit(v2);

  return v3;
}

- (void)setShieldSessionID:(id)a3
{
  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  shieldSessionID = obj->_shieldSessionID;
  obj->_shieldSessionID = v4;

  objc_sync_exit(obj);
}

- (NSDate)shieldSessionIDGeneratedTime
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_shieldSessionIDGeneratedTime;
  objc_sync_exit(v2);

  return v3;
}

- (void)setShieldSessionIDGeneratedTime:(id)a3
{
  v4 = (NSDate *)a3;
  obj = self;
  objc_sync_enter(obj);
  shieldSessionIDGeneratedTime = obj->_shieldSessionIDGeneratedTime;
  obj->_shieldSessionIDGeneratedTime = v4;

  objc_sync_exit(obj);
}

- (void)setDeviceModel:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_deviceModel = a3;
  objc_sync_exit(obj);
}

- (int64_t)deviceModel
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t deviceModel = v2->_deviceModel;
  objc_sync_exit(v2);

  return deviceModel;
}

- (id)description
{
  v3 = NSString;
  device = self->_device;
  v5 = [(CMContinuityCaptureActiveSession *)self shieldSessionID];
  v6 = [v3 stringWithFormat:@"Device:%@ SID:%@ Transport:%d Model:%d", device, v5, self->_transport, -[CMContinuityCaptureActiveSession deviceModel](self, "deviceModel")];

  return v6;
}

- (BOOL)isInitiatedOnCommunalDevice
{
  return self->_initiatedOnCommunalDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sCameraStreamingPowerEventsByCameraType, 0);
  objc_storeStrong((id *)&self->_shieldSessionIDGeneratedTime, 0);
  objc_storeStrong((id *)&self->_shieldSessionID, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end