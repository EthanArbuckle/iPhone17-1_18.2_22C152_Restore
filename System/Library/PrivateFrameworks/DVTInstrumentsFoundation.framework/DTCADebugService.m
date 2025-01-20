@interface DTCADebugService
+ (void)registerCapabilities:(id)a3;
- (BOOL)_switchNamed:(id)a3 toDebugOption:(unsigned int *)a4;
- (DTCADebugService)initWithChannel:(id)a3;
- (NSMutableDictionary)enabledSwitches;
- (id)availableStatistics;
- (id)driverNames;
- (id)valueForSwitch:(id)a3;
- (void)_collectData;
- (void)cleanup;
- (void)cleanupSwitches;
- (void)dealloc;
- (void)setEnabledSwitches:(id)a3;
- (void)setValue:(id)a3 forSwitchName:(id)a4;
@end

@implementation DTCADebugService

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  [v4 publishCapability:@"com.apple.instruments.server.services.graphics.coreanimation" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.graphics.coreanimation.immediate" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.graphics.coreanimation.deferred" withVersion:1 forClass:a1];
}

- (DTCADebugService)initWithChannel:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DTCADebugService;
  v3 = [(DTGraphicsService *)&v7 initWithChannel:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    enabledSwitches = v3->_enabledSwitches;
    v3->_enabledSwitches = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (void)dealloc
{
  [(DTCADebugService *)self cleanupSwitches];
  v3.receiver = self;
  v3.super_class = (Class)DTCADebugService;
  [(DTGraphicsService *)&v3 dealloc];
}

- (void)cleanupSwitches
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v3 = [(DTCADebugService *)self enabledSwitches];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        int v10 = 0;
        if ([(DTCADebugService *)self _switchNamed:v8 toDebugOption:&v10]) {
          CARenderServerSetDebugOption();
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = [(DTCADebugService *)self enabledSwitches];
  [v9 removeAllObjects];
}

- (id)availableStatistics
{
  if (!self->super._availableGlobalStatistics)
  {
    [MEMORY[0x263EFF980] arrayWithObjects:@"FramesPerSecond", nil];
    objc_super v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    availableGlobalStatistics = self->super._availableGlobalStatistics;
    self->super._availableGlobalStatistics = v3;

    [NSDictionary dictionaryWithObjectsAndKeys:self->super._availableGlobalStatistics, @"global", nil];
    uint64_t v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    availableStatistics = self->super._availableStatistics;
    self->super._availableStatistics = v5;
  }
  uint64_t v7 = self->super._availableStatistics;
  return v7;
}

- (id)driverNames
{
  driverNames = self->super._driverNames;
  if (!driverNames)
  {
    [MEMORY[0x263EFF980] arrayWithObjects:XRVideoCardBuiltIn, nil];
    uint64_t v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->super._driverNames;
    self->super._driverNames = v4;

    driverNames = self->super._driverNames;
  }
  return driverNames;
}

- (void)cleanup
{
  [(DTCADebugService *)self cleanupSwitches];
  v3.receiver = self;
  v3.super_class = (Class)DTCADebugService;
  [(DTGraphicsService *)&v3 cleanup];
}

- (BOOL)_switchNamed:(id)a3 toDebugOption:(unsigned int *)a4
{
  id v5 = a3;
  if (!a4) {
    sub_23093E6F8();
  }
  uint64_t v6 = v5;
  if ([v5 isEqual:@"flashUpdatedRegions"])
  {
    unsigned int v7 = 0;
LABEL_6:
    LOBYTE(v8) = 1;
    goto LABEL_7;
  }
  if ([v6 isEqual:@"colorCopiedImages"])
  {
    unsigned int v7 = 1;
    goto LABEL_6;
  }
  if ([v6 isEqual:@"colorBlendedLayers"])
  {
    LOBYTE(v8) = 1;
    unsigned int v7 = 2;
  }
  else if ([v6 isEqual:@"colorMisalignedImages"])
  {
    LOBYTE(v8) = 1;
    unsigned int v7 = 14;
  }
  else if ([v6 isEqual:@"colorImmediately"])
  {
    LOBYTE(v8) = 1;
    unsigned int v7 = 3;
  }
  else if ([v6 isEqual:@"colorOpenGLFastPathBlue"])
  {
    LOBYTE(v8) = 1;
    unsigned int v7 = 18;
  }
  else if ([v6 isEqual:@"colorOffscreenRenderedYellow"])
  {
    LOBYTE(v8) = 1;
    unsigned int v7 = 17;
  }
  else if ([v6 isEqual:@"colorCached"])
  {
    LOBYTE(v8) = 1;
    unsigned int v7 = 19;
  }
  else
  {
    int v8 = [v6 isEqual:@"colorFormats"];
    if (v8) {
      unsigned int v7 = 20;
    }
    else {
      unsigned int v7 = 0;
    }
  }
LABEL_7:
  *a4 = v7;

  return v8;
}

- (id)valueForSwitch:(id)a3
{
  id v4 = a3;
  int v9 = 0;
  if ([(DTCADebugService *)self _switchNamed:v4 toDebugOption:&v9])
  {
    uint64_t v5 = [NSNumber numberWithBool:CARenderServerGetDebugOption()];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)DTCADebugService;
    uint64_t v5 = [(DTGraphicsService *)&v8 valueForSwitch:v4];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (void)setValue:(id)a3 forSwitchName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v11 = 0;
  if ([(DTCADebugService *)self _switchNamed:v7 toDebugOption:&v11])
  {
    int v8 = [v6 BOOLValue];
    CARenderServerSetDebugOption();
    int v9 = [(DTCADebugService *)self enabledSwitches];
    int v10 = v9;
    if (v8) {
      [v9 setValue:v6 forKey:v7];
    }
    else {
      [v9 removeObjectForKey:v7];
    }
  }
}

- (void)_collectData
{
  self->super._lastFPSCount = CARenderServerGetFrameCounter();
  if (MGGetBoolAnswer()) {
    unsigned int v3 = 120;
  }
  else {
    unsigned int v3 = 60;
  }
  self->super._maxFPS = v3;
  while (self->super._doCollectData)
  {
    id v4 = (void *)MEMORY[0x230FC2180]();
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v6 = v5 - self->super._startTime;
    id v7 = [NSNumber numberWithUnsignedLongLong:(unint64_t)(v6 * 1000000.0)];
    int v8 = [(DTGraphicsService *)self currentFramesPerSecond:v6];
    int v9 = [MEMORY[0x263EFF9A0] dictionary];
    int v10 = v9;
    if (v8) {
      [v9 setObject:v8 forKey:@"FramesPerSecond"];
    }
    [v10 setObject:XRVideoCardRunTimeStamp forKey:v7];
    [v10 setObject:XRVideoCardIdentifier forKey:XRVideoCardBuiltIn];
    int v11 = [MEMORY[0x263F38CA0] messageWithObject:v10];
    long long v12 = [(DTXService *)self channel];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_2308FAA9C;
    v13[3] = &unk_264B8F770;
    v13[4] = self;
    [v12 sendMessage:v11 replyHandler:v13];

    usleep(self->super._samplingRate);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->super._stopSamplingSemaphore);
}

- (NSMutableDictionary)enabledSwitches
{
  return self->_enabledSwitches;
}

- (void)setEnabledSwitches:(id)a3
{
}

- (void).cxx_destruct
{
}

@end