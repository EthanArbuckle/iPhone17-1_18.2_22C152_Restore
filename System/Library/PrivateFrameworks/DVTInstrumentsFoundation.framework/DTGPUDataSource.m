@interface DTGPUDataSource
- (BOOL)enableConsistentGPUPerformanceState:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)run;
- (DTGPUCounterProfile)collectingProfile;
- (DTGPUDataSource)initWithImportAPSDataPath:(id)a3 workQueue:(id)a4;
- (DTGPUDataSource)initWithMTLDevice:(id)a3 workQueue:(id)a4;
- (DTGPUDataSourceDelegate)delegate;
- (MTLDevice)device;
- (NSArray)supportedCounterProfiles;
- (NSDictionary)deviceInfoDict;
- (NSString)deviceName;
- (id).cxx_construct;
- (id)_queryDisplayInfoDict;
- (id)configure:(unsigned int)a3 interval:(unint64_t)a4 windowLimit:(unint64_t)a5;
- (id)currentConsistentGPUPerformanceState;
- (id)disableConsistentGPUPerformanceState;
- (unint64_t)minSampleInterval;
- (unint64_t)timestampOfFirstSample;
- (unint64_t)windowLimit;
- (void)_sampleCounters;
- (void)enableCliquePositionTracing:(BOOL)a3;
- (void)enableShaderProfiler:(BOOL)a3;
- (void)getRemainingData:(id)a3;
- (void)overideAPSConfig:(id)a3;
- (void)reset;
- (void)setAPSCounterConfig:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stop;
@end

@implementation DTGPUDataSource

- (DTGPUDataSource)initWithMTLDevice:(id)a3 workQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DTGPUDataSource;
  v8 = [(DTGPUDataSource *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workQueue, a4);
    objc_storeWeak((id *)&v9->_device, v6);
    while (1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v9->_device);
      char v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0) {
        break;
      }
      id v12 = objc_loadWeakRetained((id *)&v9->_device);
      v13 = [v12 baseObject];
      objc_storeWeak((id *)&v9->_device, v13);
    }
    v9->_isAGXDevice = [v6 supportsFamily:1001];
    uint64_t v14 = sub_23088BEE4(v6);
    perfStateControl = v9->_perfStateControl;
    v9->_perfStateControl = (DTGPUPerformanceStateControl *)v14;

    v9->_isAPS = 0;
  }

  return v9;
}

- (DTGPUDataSource)initWithImportAPSDataPath:(id)a3 workQueue:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DTGPUDataSource;
  v8 = [(DTGPUDataSource *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workQueue, a4);
    objc_storeWeak((id *)&v9->_device, 0);
    *(_WORD *)&v9->_isAGXDevice = 257;
    v9->_isAPS = 1;
    uint64_t v10 = +[DTGPUCounterProfile_GPURawCountersImport create:v6];
    char v11 = (void *)v10;
    if (v10)
    {
      v16[0] = v10;
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
      supportedCounterProfiles = v9->_supportedCounterProfiles;
      v9->_supportedCounterProfiles = (NSArray *)v12;
    }
    else
    {
      supportedCounterProfiles = v9->_supportedCounterProfiles;
      v9->_supportedCounterProfiles = (NSArray *)MEMORY[0x263EFFA68];
    }
  }
  return v9;
}

- (NSArray)supportedCounterProfiles
{
  p_supportedCounterProfiles = (id *)&self->_supportedCounterProfiles;
  supportedCounterProfiles = self->_supportedCounterProfiles;
  if (supportedCounterProfiles)
  {
LABEL_28:
    v5 = supportedCounterProfiles;
    goto LABEL_29;
  }
  v5 = (NSArray *)objc_opt_new();
  if (!self->_isAGXDevice
    || (id v6 = objc_loadWeakRetained((id *)&self->_device),
        +[DTGPUCounterProfile_GPURawCountersAPS create:v6 profile:13], id v7 = objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    p_device = &self->_device;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    uint64_t v12 = +[DTGPUCounterProfile_GPUStats create:WeakRetained];

    if (v12) {
      [(NSArray *)v5 addObject:v12];
    }
    id v13 = objc_loadWeakRetained((id *)&self->_device);
    uint64_t v14 = +[DTGPUCounterProfile_GPURawCounters create:v13 profile:3];

    if (v14) {
      [(NSArray *)v5 addObject:v14];
    }

    id v15 = objc_loadWeakRetained((id *)&self->_device);
    v16 = +[DTGPUCounterProfile_GPURawCounters create:v15 profile:4];

    if (v16) {
      [(NSArray *)v5 addObject:v16];
    }

    if (self->_isAGXDevice)
    {
      id v17 = objc_loadWeakRetained((id *)p_device);
      v18 = +[DTGPUCounterProfile_GPURawCounters create:v17 profile:1];

      if (v18) {
        [(NSArray *)v5 addObject:v18];
      }

      id v19 = objc_loadWeakRetained((id *)p_device);
      v20 = +[DTGPUCounterProfile_GPURawCounters create:v19 profile:2];

      if (v20) {
        [(NSArray *)v5 addObject:v20];
      }
    }
    else
    {
      v21 = [(DTGPUDataSource *)self device];
      v22 = [v21 vendorName];
      v20 = [v22 lowercaseString];

      if ([v20 rangeOfString:@"intel"] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v20 rangeOfString:@"amd"] != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v23 = objc_loadWeakRetained((id *)p_device);
          v24 = +[DTGPUCounterProfile_GPURawCounters create:v23 profile:12];

          if (v24) {
            [(NSArray *)v5 addObject:v24];
          }
        }
      }
      else
      {
        for (uint64_t i = 5; i != 12; ++i)
        {
          id v26 = objc_loadWeakRetained((id *)p_device);
          v27 = +[DTGPUCounterProfile_GPURawCounters create:v26 profile:i];

          if (v27) {
            [(NSArray *)v5 addObject:v27];
          }
        }
      }
    }

    id v28 = *p_supportedCounterProfiles;
    id *p_supportedCounterProfiles = v5;

    supportedCounterProfiles = (NSArray *)*p_supportedCounterProfiles;
    goto LABEL_28;
  }
  [(NSArray *)v5 addObject:v7];
  id v8 = objc_loadWeakRetained((id *)&self->_device);
  v9 = +[DTGPUCounterProfile_GPURawCountersAPS create:v8 profile:14];

  if (v9) {
    [(NSArray *)v5 addObject:v9];
  }
  self->_isAPS = 1;
  objc_storeStrong(p_supportedCounterProfiles, v5);

LABEL_29:
  return v5;
}

- (void)setAPSCounterConfig:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"Profile"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_supportedCounterProfiles;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          uint64_t v12 = v11;
          if (!v5
            || (uint64_t v13 = [v11 profile],
                v13 == [v5 unsignedIntValue]))
          {
            [v12 setAPSCounterConfig:v4];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (unint64_t)minSampleInterval
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_supportedCounterProfiles;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3)
  {

    return 50000;
  }
  uint64_t v4 = *(void *)v10;
  unint64_t v5 = -1;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v10 != v4) {
        objc_enumerationMutation(v2);
      }
      unint64_t v7 = [*(id *)(*((void *)&v9 + 1) + 8 * i) defaultSampleInterval:v9];
      if (v5 >= v7) {
        unint64_t v5 = v7;
      }
    }
    uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v3);

  if (v5 == -1) {
    return 50000;
  }
  return v5;
}

- (unint64_t)windowLimit
{
  return self->_windowLimit;
}

- (NSString)deviceName
{
  if (self->_isImportAPS)
  {
    v2 = @"Import Device";
  }
  else
  {
    BOOL isAGXDevice = self->_isAGXDevice;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    unint64_t v5 = WeakRetained;
    if (isAGXDevice) {
      [WeakRetained familyName];
    }
    else {
    v2 = [WeakRetained name];
    }
  }
  return (NSString *)v2;
}

- (NSDictionary)deviceInfoDict
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  p_device = &self->_device;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  if (WeakRetained)
  {
    id v32 = objc_loadWeakRetained((id *)p_device);
    unint64_t v5 = objc_opt_new();
    id v6 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    unint64_t v7 = [(DTGPUDataSource *)self supportedCounterProfiles];
    location = (id *)p_device;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v7);
          }
          long long v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v12 = [NSNumber numberWithUnsignedInteger:[v11 profile]];
          [v5 addObject:v12];

          uint64_t v13 = [v11 counterProfileForHost];
          [v6 addObject:v13];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v8);
    }

    v29 = [NSNumber numberWithUnsignedLongLong:objc_msgSend(v32, "sharedMemorySize")];
    CFProperty = (__CFString *)IORegistryEntryCreateCFProperty([v32 acceleratorPort], @"AGXTraceCodeVersion", 0, 0);
    long long v15 = @"0";
    if (CFProperty) {
      long long v15 = CFProperty;
    }
    id v28 = v15;
    v37[0] = @"accelerator-id";
    long long v16 = NSNumber;
    locationa = (id *)objc_loadWeakRetained(location);
    v27 = [v16 numberWithUnsignedLongLong:objc_msgSend(locationa, "registryID")];
    v38[0] = v27;
    v37[1] = @"vendor-name";
    v25 = [v32 vendorName];
    v38[1] = v25;
    v37[2] = @"family-name";
    id v26 = [v32 familyName];
    v38[2] = v26;
    v37[3] = @"product-name";
    long long v17 = [v32 productName];
    v38[3] = v17;
    v37[4] = @"device-name";
    v18 = [(DTGPUDataSource *)self deviceName];
    v38[4] = v18;
    v38[5] = v5;
    v37[5] = @"supported-counter-profiles";
    v37[6] = @"counter-profile-configs";
    v38[6] = v6;
    v37[7] = @"min-collection-interval";
    uint64_t v19 = [NSNumber numberWithUnsignedLongLong:-[DTGPUDataSource minSampleInterval](self, "minSampleInterval")];
    v38[7] = v19;
    v38[8] = MEMORY[0x263EFFA80];
    v37[8] = @"headless";
    v37[9] = @"removable";
    v38[9] = MEMORY[0x263EFFA80];
    v38[10] = MEMORY[0x263EFFA80];
    v37[10] = @"low-power";
    v37[11] = @"recommended-max-working-set-size";
    v38[11] = v29;
    v37[12] = @"mobile";
    v20 = [NSNumber numberWithBool:self->_isAGXDevice];
    v38[12] = v20;
    v37[13] = @"displays";
    v21 = [(DTGPUDataSource *)self _queryDisplayInfoDict];
    v38[13] = v21;
    v38[14] = v28;
    v37[14] = @"agx-tracecode-version";
    v37[15] = @"perf-state";
    v22 = [(DTGPUDataSource *)self currentConsistentGPUPerformanceState];
    v38[15] = v22;
    id v23 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:16];
  }
  else
  {
    id v23 = (void *)MEMORY[0x263EFFA78];
  }
  return (NSDictionary *)v23;
}

- (DTGPUCounterProfile)collectingProfile
{
  return self->_collectingProfile;
}

- (id)configure:(unsigned int)a3 interval:(unint64_t)a4 windowLimit:(unint64_t)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  p_collectingProfile = &self->_collectingProfile;
  if (self->_collectingProfile)
  {
    id v6 = 0;
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v10 = self->_supportedCounterProfiles;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v48;
      uint64_t v13 = a3;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          if ([v15 profile] == v13)
          {
            objc_storeStrong((id *)p_collectingProfile, v15);
            goto LABEL_13;
          }
        }
        uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v47 objects:v51 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    BOOL v16 = [(DTGPUCounterProfile *)*p_collectingProfile prepare];
    long long v17 = *p_collectingProfile;
    if (v16)
    {
      long long v17 = [(DTGPUCounterProfile *)*p_collectingProfile ringBufferCounts];
      v18 = [(DTGPUCounterProfile *)*p_collectingProfile sampleSizes];
      if ([v18 count]
        && [v17 count]
        && (uint64_t v19 = [v17 count], v19 == [v18 count])
      {
        self->_unint64_t windowLimit = a5;
        unint64_t v20 = [(DTGPUCounterProfile *)self->_collectingProfile defaultSampleInterval];
        self->_sampleInterval = v20;
        collectingProfile = self->_collectingProfile;
        if (collectingProfile)
        {
          unint64_t windowLimit = 1000000000;
          if (self->_windowLimit + 1 >= 2) {
            unint64_t windowLimit = self->_windowLimit;
          }
          unint64_t v23 = windowLimit / v20;
          if (v23 >= 0x4E20) {
            unint64_t v23 = 20000;
          }
          if (v23 <= 1) {
            uint64_t v24 = 1;
          }
          else {
            uint64_t v24 = v23;
          }
          begin = (void **)self->_sampleBuffers.__begin_;
          p_sampleBuffers = (uint64_t *)&self->_sampleBuffers;
          end = (void **)self->_sampleBuffers.__end_;
          while (end != begin)
          {
            end -= 3;
            v38[0] = end;
            sub_2308D6998(v38);
          }
          unint64_t v29 = 0;
          self->_sampleBuffers.__end_ = begin;
          while (v29 < [v17 count])
          {
            uint64_t v44 = 0;
            unint64_t v45 = 0;
            unint64_t v46 = 0;
            v30 = [v17 objectAtIndexedSubscript:v29];
            uint64_t v31 = [v30 unsignedIntegerValue];

            for (; v31; --v31)
            {
              id v32 = [v18 objectAtIndexedSubscript:v29];
              sub_2308D65A8((uint64_t)v38, [v32 unsignedIntValue], v24);
              sub_2308D65A8((uint64_t)&v41, 4, v24);

              unint64_t v33 = v45;
              if (v45 >= v46)
              {
                uint64_t v34 = sub_2308D6A88(&v44, (uint64_t)v38);
              }
              else
              {
                sub_2308D6BB0((uint64_t)&v46, v45, (uint64_t)v38);
                uint64_t v34 = v33 + 112;
              }
              unint64_t v45 = v34;
              if (__p)
              {
                v43 = __p;
                operator delete(__p);
              }
              if (v39)
              {
                uint64_t v40 = v39;
                operator delete(v39);
              }
            }
            long long v35 = (char *)self->_sampleBuffers.__end_;
            if (v35 >= self->_sampleBuffers.__end_cap_.__value_)
            {
              long long v36 = (void *)sub_2308D7020(p_sampleBuffers, &v44);
            }
            else
            {
              sub_2308D6FB8((uint64_t)p_sampleBuffers, &v44);
              long long v36 = v35 + 24;
            }
            self->_sampleBuffers.__end_ = v36;
            v38[0] = (void **)&v44;
            sub_2308D6998(v38);
            ++v29;
          }
          collectingProfile = *p_collectingProfile;
        }
        id v6 = collectingProfile;
      }
      else
      {
        v27 = *p_collectingProfile;
        *p_collectingProfile = 0;

        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
      *p_collectingProfile = 0;
    }
  }
  return v6;
}

- (void)enableShaderProfiler:(BOOL)a3
{
  self->_enableShaderProfiler = a3;
}

- (void)enableCliquePositionTracing:(BOOL)a3
{
  self->_enableCliquePositionTracing = a3;
}

- (void)overideAPSConfig:(id)a3
{
}

- (BOOL)run
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = v3;
  if (self->_enableShaderProfiler) {
    [v3 setObject:&unk_26E533FF8 forKeyedSubscript:@"ShaderProfiler"];
  }
  apsConfig = self->_apsConfig;
  if (apsConfig) {
    [v4 setObject:apsConfig forKeyedSubscript:@"APSConfig"];
  }
  BOOL v6 = [(DTGPUCounterProfile *)self->_collectingProfile start:self->_sampleInterval vendorFeatures:v4];
  if (v6)
  {
    self->_stopTime = 0;
    objc_initWeak(&location, self);
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2308D4AB4;
    block[3] = &unk_264B8F588;
    objc_copyWeak(&v10, &location);
    block[4] = self;
    dispatch_async(workQueue, block);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    [(DTGPUCounterProfile *)self->_collectingProfile stop];
  }

  return v6;
}

- (void)stop
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308D4DC8;
  block[3] = &unk_264B8F5B0;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

- (void)getRemainingData:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308D4EC8;
  v7[3] = &unk_264B8F600;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (void)reset
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308D5340;
  block[3] = &unk_264B8F5B0;
  block[4] = self;
  dispatch_sync(workQueue, block);
  id v4 = [(DTGPUDataSource *)self disableConsistentGPUPerformanceState];
}

- (void)_sampleCounters
{
  BOOL isAPS = self->_isAPS;
  collectingProfile = self->_collectingProfile;
  if (isAPS)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_2308D5484;
    v7[3] = &unk_264B8F628;
    v7[4] = self;
    [(DTGPUCounterProfile *)collectingProfile sampleAPS:v7];
  }
  else
  {
    unint64_t sampleInterval = self->_sampleInterval;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_2308D5528;
    v6[3] = &unk_264B8F678;
    v6[4] = self;
    [(DTGPUCounterProfile *)collectingProfile sampleCounters:sampleInterval callback:v6];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(DTGPUDataSource *)self device];
    unint64_t v7 = [v5 device];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)timestampOfFirstSample
{
  begin = self->_sampleBuffers.__begin_;
  if (begin == self->_sampleBuffers.__end_) {
    return 0;
  }
  uint64_t v3 = (void *)*begin;
  id v4 = (void *)begin[1];
  if ((void *)*begin == v4) {
    return -1;
  }
  unint64_t v6 = -1;
  do
  {
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t windowLimit = self->_windowLimit;
    uint64_t v8 = mach_absolute_time();
    sub_2308D5CD0(v3, windowLimit, v8, &v11, &v10);
    if (v11 && *v11 < v6) {
      unint64_t v6 = *v11;
    }
    v3 += 14;
  }
  while (v3 != v4);
  return v6;
}

- (id)_queryDisplayInfoDict
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v32 = (id)objc_opt_new();
  [MEMORY[0x263F15778] displays];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v50 objects:v67 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v51 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if (([v5 isSupported] & 1) != 0 && [v5 displayType] != 3)
        {
          [v5 bounds];
          if (v6 != 0.0)
          {
            [v5 bounds];
            if (v7 != 0.0)
            {
              uint64_t v8 = [v5 displayId];
              if ([v5 displayId]) {
                unsigned int v9 = [v5 displayId] - 1;
              }
              else {
                unsigned int v9 = [v5 displayId];
              }
              uint64_t v44 = [v5 displayType];
              long long v48 = 0u;
              long long v49 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              unint64_t v10 = [v5 availableModes];
              uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v66 count:16];
              unsigned int v42 = v9;
              uint64_t v12 = 0;
              if (v11)
              {
                uint64_t v13 = *(void *)v47;
                do
                {
                  for (uint64_t j = 0; j != v11; ++j)
                  {
                    if (*(void *)v47 != v13) {
                      objc_enumerationMutation(v10);
                    }
                    [*(id *)(*((void *)&v46 + 1) + 8 * j) refreshRate];
                    int v16 = vcvtpd_s64_f64(v15);
                    if ((int)v12 <= v16) {
                      uint64_t v12 = v16;
                    }
                    else {
                      uint64_t v12 = v12;
                    }
                  }
                  uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v66 count:16];
                }
                while (v11);
              }

              v55[0] = @"accelerator-id";
              uint64_t v40 = [NSNumber numberWithUnsignedLongLong:0];
              v56 = v40;
              v55[1] = @"display-id";
              uint64_t v57 = [NSNumber numberWithUnsignedInt:v8];
              v55[2] = @"device-name";
              uint64_t v41 = (void *)v57;
              if (v44)
              {
                unint64_t v33 = [v5 deviceName];
                long long v17 = v33;
              }
              else
              {
                long long v17 = @"Built-In Display";
              }
              v58 = v17;
              v55[3] = @"framebuffer-index";
              v43 = [NSNumber numberWithUnsignedInt:v42];
              v59 = v43;
              v55[4] = @"pixel-width";
              v18 = NSNumber;
              [v5 bounds];
              v39 = [v18 numberWithDouble:v19];
              v60 = v39;
              v55[5] = @"pixel-height";
              unint64_t v20 = NSNumber;
              [v5 bounds];
              v37 = [v20 numberWithDouble:v21];
              v61 = v37;
              v55[6] = @"resolution";
              v22 = NSNumber;
              v38 = [v5 currentMode];
              long long v35 = [v22 numberWithUnsignedLong:[v38 width]];
              v54[0] = v35;
              unint64_t v23 = NSNumber;
              long long v36 = [v5 currentMode];
              uint64_t v34 = [v23 numberWithUnsignedLong:[v36 height]];
              v54[1] = v34;
              uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
              v62 = v24;
              v55[7] = @"built-in";
              v25 = [NSNumber numberWithBool:v44 == 0];
              v63 = v25;
              v55[8] = @"max-refresh-rate";
              id v26 = [NSNumber numberWithInt:v12];
              v64 = v26;
              v55[9] = @"is-main-display";
              v27 = NSNumber;
              id v28 = [MEMORY[0x263F15778] mainDisplay];
              unint64_t v29 = [v27 numberWithBool:v5 == v28];
              v65 = v29;
              v30 = [NSDictionary dictionaryWithObjects:&v56 forKeys:v55 count:10];

              if (v44) {
              [v32 addObject:v30];
              }
            }
          }
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v50 objects:v67 count:16];
    }
    while (v2);
  }

  return v32;
}

- (id)currentConsistentGPUPerformanceState
{
  uint64_t v2 = [(DTGPUPerformanceStateControl *)self->_perfStateControl currentState];
  if (!v2) {
    uint64_t v2 = (void *)MEMORY[0x263EFFA78];
  }
  return v2;
}

- (BOOL)enableConsistentGPUPerformanceState:(unint64_t)a3
{
  return MEMORY[0x270F9A6D0](self->_perfStateControl, sel_enable_);
}

- (id)disableConsistentGPUPerformanceState
{
  return (id)[(DTGPUPerformanceStateControl *)self->_perfStateControl disable];
}

- (MTLDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  return (MTLDevice *)WeakRetained;
}

- (DTGPUDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DTGPUDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_perfStateControl, 0);
  objc_storeStrong((id *)&self->_supportedCounterProfiles, 0);
  p_sampleBuffers = &self->_sampleBuffers;
  sub_2308D766C((void ***)&p_sampleBuffers);
  objc_storeStrong((id *)&self->_apsConfig, 0);
  objc_storeStrong((id *)&self->_collectingProfile, 0);
  objc_storeStrong((id *)&self->_dispatchTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  return self;
}

@end