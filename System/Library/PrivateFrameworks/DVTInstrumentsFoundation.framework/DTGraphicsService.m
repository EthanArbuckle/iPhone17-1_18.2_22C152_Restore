@interface DTGraphicsService
+ (void)registerCapabilities:(id)a3;
- (DTGraphicsService)initWithChannel:(id)a3;
- (id)_collectSampleForService;
- (id)availableStatistics;
- (id)currentFramesPerSecond:(double)a3;
- (id)driverNames;
- (id)queryGlobalStatistics;
- (id)queryPidStatistics;
- (id)valueForSwitch:(id)a3;
- (void)_collectData;
- (void)_releaseIOServices;
- (void)_setupIOServices;
- (void)dealloc;
- (void)queryCards;
- (void)setSamplingRate:(id)a3;
- (void)startSamplingAtTimeInterval:(id)a3;
- (void)startSamplingAtTimeInterval:(id)a3 processIdentifier:(id)a4;
- (void)stopSampling;
@end

@implementation DTGraphicsService

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  [v4 publishCapability:@"com.apple.instruments.server.services.graphics.opengl" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.graphics.opengl.immediate" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.graphics.opengl.deferred" withVersion:1 forClass:a1];
}

- (DTGraphicsService)initWithChannel:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DTGraphicsService;
  v3 = [(DTXService *)&v8 initWithChannel:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_samplingRate = 1000000;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    stopSamplingSemaphore = v4->_stopSamplingSemaphore;
    v4->_stopSamplingSemaphore = (OS_dispatch_semaphore *)v5;

    v4->_globalService = 0;
    v4->_perProcessService = 0;
    v4->_capFPS = 1;
    v4->_maxFPS = 60;
  }
  return v4;
}

- (void)dealloc
{
  [(DTGraphicsService *)self _releaseIOServices];
  v3.receiver = self;
  v3.super_class = (Class)DTGraphicsService;
  [(DTGraphicsService *)&v3 dealloc];
}

- (id)queryGlobalStatistics
{
  kern_return_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  CFMutableDictionaryRef properties;
  uint64_t vars8;

  io_registry_entry_t globalService = self->_globalService;
  if (globalService)
  {
    properties = 0;
    objc_super v3 = IORegistryEntryCreateCFProperties(globalService, &properties, 0, 0);
    if (v3)
    {
      printf("%s:%d: kernel error %d\n", "-[DTGraphicsService queryGlobalStatistics]", 90, v3);
      abort();
    }
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    [v4 addEntriesFromDictionary:CFDictionaryGetValue(properties, @"PerformanceStatistics")];
    CFDictionaryGetValue(properties, @"IOGLBundleName");
    dispatch_semaphore_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = XRVideoCardIdentifier;
      v7 = v4;
      objc_super v8 = v5;
    }
    else
    {
      objc_super v8 = XRVideoCardBuiltIn;
      v6 = XRVideoCardIdentifier;
      v7 = v4;
    }
    [v7 setObject:v8 forKey:v6];
    CFRelease(properties);
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"DTGraphicsServiceException" format:@"Global statics not found"];
    id v4 = 0;
  }
  return v4;
}

- (id)queryPidStatistics
{
  kern_return_t v8;
  void *v9;
  CFMutableDictionaryRef properties;
  io_iterator_t iterator;
  _OWORD v13[8];
  uint64_t v14;
  uint64_t vars8;

  v14 = *MEMORY[0x263EF8340];
  if (self->_perProcessService)
  {
    objc_super v3 = objc_opt_new();
    iterator = 0;
    MEMORY[0x230FC0C90](self->_perProcessService, "IOService", &iterator);
    uint64_t v4 = IOIteratorNext(iterator);
    if (v4)
    {
      uint64_t v5 = v4;
      do
      {
        memset(v13, 0, sizeof(v13));
        MEMORY[0x230FC0CA0](v5, v13);
        if (*(void *)&v13[0] == 0x58424D656C707041
          && *((void *)&v13[0] + 1) == 0x65696C4372657355
          && *(void *)((char *)v13 + 11) == 0x746E65696C4372)
        {
          properties = 0;
          objc_super v8 = IORegistryEntryCreateCFProperties(v5, &properties, 0, 0);
          if (v8)
          {
            printf("%s:%d: kernel error %d\n", "-[DTGraphicsService queryPidStatistics]", 126, v8);
            abort();
          }
          v9 = CFDictionaryGetValue(properties, @"PerformanceStatistics");
          if (v9) {
            [v3 addObject:v9];
          }
          CFRelease(properties);
        }
        IOObjectRelease(v5);
        uint64_t v5 = IOIteratorNext(iterator);
      }
      while (v5);
    }
    IOObjectRelease(iterator);
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"DTGraphicsServiceException" format:@"Per process statics not found"];
    objc_super v3 = 0;
  }
  return v3;
}

- (void)_setupIOServices
{
  kern_return_t MatchingServices;
  io_object_t v6;
  const char *v7;
  CFDictionaryRef v8;
  kern_return_t v9;
  io_object_t v10;
  CFDictionaryRef v11;
  kern_return_t v12;
  io_iterator_t existing;

  if (!self->_globalService)
  {
    CFDictionaryRef v3 = IOServiceMatching("IOAcceleratorES");
    if (!v3)
    {
      CFDictionaryRef v3 = IOServiceMatching("IOAcceleratorESLegacy");
      if (!v3) {
        CFDictionaryRef v3 = IOServiceMatching("AppleMBXDevice");
      }
    }
    existing = 0;
    mach_port_t v4 = *MEMORY[0x263F0EC88];
    MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], v3, &existing);
    if (MatchingServices)
    {
      printf("%s:%d: kernel error %d\n", "-[DTGraphicsService _setupIOServices]", 188, MatchingServices);
      goto LABEL_19;
    }
    v6 = IOIteratorNext(existing);
    self->_io_registry_entry_t globalService = v6;
    if (v6)
    {
      v7 = "IOAcceleratorES";
    }
    else
    {
      objc_super v8 = IOServiceMatching("AppleMBXDevice");
      v9 = IOServiceGetMatchingServices(v4, v8, &existing);
      if (v9)
      {
        printf("%s:%d: kernel error %d\n", "-[DTGraphicsService _setupIOServices]", 195, v9);
        goto LABEL_19;
      }
      v10 = IOIteratorNext(existing);
      self->_io_registry_entry_t globalService = v10;
      if (!v10) {
        return;
      }
      v7 = "AppleMBXDevice";
    }
    IOObjectRelease(existing);
    v11 = IOServiceMatching(v7);
    if (!v11) {
      v11 = IOServiceMatching("IOAcceleratorESLegacy");
    }
    v12 = IOServiceGetMatchingServices(v4, v11, &existing);
    if (!v12)
    {
      self->_perProcessService = IOIteratorNext(existing);
      IOObjectRelease(existing);
      return;
    }
    printf("%s:%d: kernel error %d\n", "-[DTGraphicsService _setupIOServices]", 215, v12);
LABEL_19:
    abort();
  }
}

- (void)_releaseIOServices
{
  io_object_t perProcessService = self->_perProcessService;
  if (perProcessService)
  {
    IOObjectRelease(perProcessService);
    self->_io_object_t perProcessService = 0;
  }
  io_object_t globalService = self->_globalService;
  if (globalService)
  {
    IOObjectRelease(globalService);
    self->_io_object_t globalService = 0;
  }
}

- (void)queryCards
{
  context[1] = *MEMORY[0x263EF8340];
  if (!self->_availableGlobalStatistics)
  {
    CFDictionaryRef v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    availableGlobalStatistics = self->_availableGlobalStatistics;
    self->_availableGlobalStatistics = v3;

    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    availableProcessStatistics = self->_availableProcessStatistics;
    self->_availableProcessStatistics = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    driverNames = self->_driverNames;
    self->_driverNames = v7;

    [(DTGraphicsService *)self _setupIOServices];
    v9 = [(DTGraphicsService *)self queryGlobalStatistics];
    if (v9)
    {
      [(NSMutableArray *)self->_driverNames addObject:XRVideoCardBuiltIn];
      size_t v10 = [v9 count];
      v11 = (void *)((char *)context - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      bzero(v11, 8 * v10);
      context[0] = v11;
      CFDictionaryApplyFunction((CFDictionaryRef)v9, (CFDictionaryApplierFunction)sub_2308DB158, context);
      qsort(v11, v10, 8uLL, (int (__cdecl *)(const void *, const void *))sub_2308DB190);
      for (; v10; --v10)
      {
        v12 = [NSString stringWithFormat:@"%s", *v11];
        if (([(NSMutableArray *)self->_availableGlobalStatistics containsObject:v12] & 1) == 0) {
          [(NSMutableArray *)self->_availableGlobalStatistics addObject:v12];
        }

        ++v11;
      }
    }
  }
}

- (id)availableStatistics
{
  v10[2] = *MEMORY[0x263EF8340];
  if (!self->_availableGlobalStatistics)
  {
    [(DTGraphicsService *)self queryCards];
    [(NSMutableArray *)self->_availableGlobalStatistics addObject:@"CoreAnimationFramesPerSecond"];
    availableGlobalStatistics = self->_availableGlobalStatistics;
    v9[0] = @"global";
    v9[1] = @"process";
    availableProcessStatistics = self->_availableProcessStatistics;
    v10[0] = availableGlobalStatistics;
    v10[1] = availableProcessStatistics;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    availableStatistics = self->_availableStatistics;
    self->_availableStatistics = v5;
  }
  v7 = self->_availableStatistics;
  return v7;
}

- (id)driverNames
{
  driverNames = self->_driverNames;
  if (!driverNames)
  {
    [(DTGraphicsService *)self queryCards];
    driverNames = self->_driverNames;
  }
  return driverNames;
}

- (void)setSamplingRate:(id)a3
{
  self->_samplingRate = (unint64_t)(float)((float)((float)[a3 integerValue] / 10.0) * 1000000.0);
}

- (void)startSamplingAtTimeInterval:(id)a3
{
}

- (void)startSamplingAtTimeInterval:(id)a3 processIdentifier:(id)a4
{
  id v5 = a4;
  self->_capFPS = CARenderServerGetDebugOption() ^ 1;
  self->_maxFPS = 60;
  [(DTGraphicsService *)self _setupIOServices];
  self->_doCollectData = 1;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  self->_lastTimeStampInSeconds = v6;
  self->_startTime = v6;
  int v7 = [v5 intValue];

  self->_targetPid = v7;
  uint64_t v8 = MEMORY[0x263F08B88];
  MEMORY[0x270F9A6D0](v8, sel_detachNewThreadSelector_toTarget_withObject_);
}

- (void)stopSampling
{
  if (self->_doCollectData)
  {
    self->_doCollectData = 0;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_stopSamplingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    [(DTGraphicsService *)self _releaseIOServices];
  }
}

- (id)valueForSwitch:(id)a3
{
  return (id)[NSNumber numberWithBool:0];
}

- (id)_collectSampleForService
{
  CFDictionaryRef v3 = objc_opt_new();
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v5 = v4 - self->_startTime;
  double v6 = [NSNumber numberWithUnsignedLongLong:(unint64_t)(v5 * 1000000.0)];
  [v3 setObject:v6 forKey:XRVideoCardRunTimeStamp];
  int v7 = [(DTGraphicsService *)self queryGlobalStatistics];
  [v3 addEntriesFromDictionary:v7];

  if (self->_targetPid >= 1)
  {
    v28 = v6;
    v29 = v3;
    uint64_t v8 = [(DTGraphicsService *)self queryPidStatistics];
    v9 = objc_opt_new();
    uint64_t v10 = [v8 count];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      v31 = v8;
      v32 = self;
      uint64_t v30 = v10;
      do
      {
        v13 = [v8 objectAtIndex:v12];
        v14 = [v13 objectForKey:@"OwningPID"];
        int v15 = [v14 intValue];
        int targetPid = self->_targetPid;

        if (v15 == targetPid)
        {
          if ([v9 count])
          {
            uint64_t v33 = v12;
            v17 = [v9 allKeys];
            uint64_t v18 = [v17 count];
            if (v18)
            {
              uint64_t v19 = v18;
              for (uint64_t i = 0; i != v19; ++i)
              {
                v21 = [v17 objectAtIndex:i];
                v22 = [v9 objectForKey:v21];
                v23 = [v13 objectForKey:v21];
                if (v23)
                {
                  v24 = [NSNumber numberWithInt:[v23 intValue] + [v22 intValue]];
                  [v9 setObject:v24 forKey:v21];
                }
              }
            }

            uint64_t v8 = v31;
            self = v32;
            uint64_t v11 = v30;
            uint64_t v12 = v33;
          }
          else
          {
            [v9 addEntriesFromDictionary:v13];
          }
        }

        ++v12;
      }
      while (v12 != v11);
    }
    CFDictionaryRef v3 = v29;
    [v29 addEntriesFromDictionary:v9];

    double v6 = v28;
  }
  v25 = [(DTGraphicsService *)self currentFramesPerSecond:v5];
  if (v25) {
    [v3 setObject:v25 forKey:@"CoreAnimationFramesPerSecond"];
  }
  v26 = [MEMORY[0x263F38CA0] messageWithObject:v3];

  return v26;
}

- (void)_collectData
{
  self->_lastFPSCount = CARenderServerGetFrameCounter();
  while (self->_doCollectData)
  {
    CFDictionaryRef v3 = (void *)MEMORY[0x230FC2180]();
    double v4 = [(DTGraphicsService *)self _collectSampleForService];
    if (v4)
    {
      double v5 = [(DTXService *)self channel];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_2308DB8A0;
      v6[3] = &unk_264B8F770;
      v6[4] = self;
      [v5 sendMessage:v4 replyHandler:v6];
    }
    usleep(self->_samplingRate);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_stopSamplingSemaphore);
}

- (id)currentFramesPerSecond:(double)a3
{
  unsigned int FrameCounter = CARenderServerGetFrameCounter();
  double v6 = (float)(FrameCounter - self->_lastFPSCount) / (a3 - self->_lastTimeStampInSeconds);
  self->_lastFPSCount = FrameCounter;
  self->_lastTimeStampInSeconds = a3;
  if (!self->_capFPS || (uint64_t maxFPS = self->_maxFPS, maxFPS >= v6)) {
    uint64_t maxFPS = v6;
  }
  uint64_t v8 = NSNumber;
  return (id)[v8 numberWithUnsignedInt:maxFPS];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopSamplingSemaphore, 0);
  objc_storeStrong((id *)&self->_driverNames, 0);
  objc_storeStrong((id *)&self->_availableStatistics, 0);
  objc_storeStrong((id *)&self->_availableProcessStatistics, 0);
  objc_storeStrong((id *)&self->_availableGlobalStatistics, 0);
}

@end