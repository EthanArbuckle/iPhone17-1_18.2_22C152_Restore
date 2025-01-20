@interface DTGPUCounterProfile
- (BOOL)isAPS;
- (BOOL)prepare;
- (BOOL)start:(unint64_t)a3 vendorFeatures:(id)a4;
- (DTGPUCounterProfile)initWithProfile:(unint64_t)a3 device:(id)a4;
- (MTLDevice)device;
- (NSArray)counters;
- (NSString)derivedCounterScriptPath;
- (NSString)profileName;
- (id)counterProfileForHost;
- (id)ringBufferCounts;
- (id)sampleSizes;
- (unint64_t)defaultSampleInterval;
- (unint64_t)profile;
- (void)addCounter:(id)a3;
- (void)setCounters:(id)a3;
- (void)setDefaultSampleInterval:(unint64_t)a3;
- (void)setDerivedCounterScriptPath:(id)a3;
- (void)setDevice:(id)a3;
- (void)setIsAPS:(BOOL)a3;
- (void)setProfileName:(id)a3;
@end

@implementation DTGPUCounterProfile

- (DTGPUCounterProfile)initWithProfile:(unint64_t)a3 device:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DTGPUCounterProfile;
  v8 = [(DTGPUCounterProfile *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_profile = a3;
    uint64_t v10 = objc_opt_new();
    counters = v9->_counters;
    v9->_counters = (NSMutableArray *)v10;

    objc_storeStrong((id *)&v9->_device, a4);
  }

  return v9;
}

- (void)addCounter:(id)a3
{
}

- (BOOL)prepare
{
  return 1;
}

- (BOOL)start:(unint64_t)a3 vendorFeatures:(id)a4
{
  return 1;
}

- (id)counterProfileForHost
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_counters;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) infoArray:v12];
        [v3 addObject:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v19 count:16];
    }
    while (v5);
  }

  v16 = &unk_26E5341D8;
  v17 = v3;
  v9 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v18 = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];

  return v10;
}

- (id)sampleSizes
{
  return &unk_26E533E90;
}

- (id)ringBufferCounts
{
  return &unk_26E533EA8;
}

- (BOOL)isAPS
{
  return 0;
}

- (unint64_t)profile
{
  return self->_profile;
}

- (NSArray)counters
{
  return &self->_counters->super;
}

- (void)setCounters:(id)a3
{
}

- (unint64_t)defaultSampleInterval
{
  return self->_defaultSampleInterval;
}

- (void)setDefaultSampleInterval:(unint64_t)a3
{
  self->_defaultSampleInterval = a3;
}

- (NSString)derivedCounterScriptPath
{
  return self->_derivedCounterScriptPath;
}

- (void)setDerivedCounterScriptPath:(id)a3
{
}

- (NSString)profileName
{
  return self->_profileName;
}

- (void)setProfileName:(id)a3
{
}

- (void)setIsAPS:(BOOL)a3
{
  self->_isAPS = a3;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_profileName, 0);
  objc_storeStrong((id *)&self->_derivedCounterScriptPath, 0);
  objc_storeStrong((id *)&self->_counters, 0);
}

@end