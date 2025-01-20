@interface _DKScreenSharingMonitor
+ (id)entitlements;
+ (id)eventStream;
- (AVOutputContext)outputContext;
- (BMScreenSharingStream)screenSharingStream;
- (_DKScreenSharingMonitor)init;
- (int64_t)currentMirroringDeviceCount;
- (void)deactivate;
- (void)mirroringDidChange:(id)a3;
- (void)registerForScreenMirroringNotifications;
- (void)setCurrentMirroringDeviceCount:(int64_t)a3;
- (void)setOutputContext:(id)a3;
- (void)setScreenSharingStream:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation _DKScreenSharingMonitor

+ (id)eventStream
{
  return @"ScreenSharing";
}

+ (id)entitlements
{
  return 0;
}

- (_DKScreenSharingMonitor)init
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)_DKScreenSharingMonitor;
  v2 = [(_DKMonitor *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFA7B8] sharedSystemScreenContext];
    outputContext = v2->_outputContext;
    v2->_outputContext = (AVOutputContext *)v3;

    v5 = (BMScreenSharingStream *)objc_alloc_init(MEMORY[0x263F2A910]);
    screenSharingStream = v2->_screenSharingStream;
    v2->_screenSharingStream = v5;

    v7 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v2->_outputContext;
      v9 = v2->_screenSharingStream;
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      __int16 v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_225002000, v7, OS_LOG_TYPE_INFO, "Enabling screen mirroring monitor with AVOutputContext: %@, screenSharingStream %@", buf, 0x16u);
    }
  }
  return v2;
}

- (void)start
{
  v3.receiver = self;
  v3.super_class = (Class)_DKScreenSharingMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsActivation]) {
    [(_DKScreenSharingMonitor *)self registerForScreenMirroringNotifications];
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKScreenSharingMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKScreenSharingMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  outputContext = self->_outputContext;
  self->_outputContext = 0;

  screenSharingStream = self->_screenSharingStream;
  self->_screenSharingStream = 0;
}

- (void)registerForScreenMirroringNotifications
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263EF9FA0];
  v5 = [(_DKScreenSharingMonitor *)self outputContext];
  [v3 addObserver:self selector:sel_mirroringDidChange_ name:v4 object:v5];

  v6 = [(_DKScreenSharingMonitor *)self outputContext];
  v7 = [v6 outputDevices];
  -[_DKScreenSharingMonitor setCurrentMirroringDeviceCount:](self, "setCurrentMirroringDeviceCount:", [v7 count]);

  v8 = [MEMORY[0x263F34FB8] contextChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[_DKScreenSharingMonitor currentMirroringDeviceCount](self, "currentMirroringDeviceCount"));
    int v10 = 138412290;
    objc_super v11 = v9;
    _os_log_impl(&dword_225002000, v8, OS_LOG_TYPE_INFO, "Registered for screen mirroring notifications with current device count: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (void)mirroringDidChange:(id)a3
{
  uint64_t v4 = [(_DKMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46___DKScreenSharingMonitor_mirroringDidChange___block_invoke;
  block[3] = &unk_264714788;
  block[4] = self;
  dispatch_async(v4, block);
}

- (AVOutputContext)outputContext
{
  return self->_outputContext;
}

- (void)setOutputContext:(id)a3
{
}

- (BMScreenSharingStream)screenSharingStream
{
  return self->_screenSharingStream;
}

- (void)setScreenSharingStream:(id)a3
{
}

- (int64_t)currentMirroringDeviceCount
{
  return self->_currentMirroringDeviceCount;
}

- (void)setCurrentMirroringDeviceCount:(int64_t)a3
{
  self->_currentMirroringDeviceCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenSharingStream, 0);
  objc_storeStrong((id *)&self->_outputContext, 0);
}

@end