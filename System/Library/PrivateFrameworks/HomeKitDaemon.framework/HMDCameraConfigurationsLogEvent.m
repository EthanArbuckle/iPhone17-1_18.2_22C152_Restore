@interface HMDCameraConfigurationsLogEvent
- (HMDCameraConfigurationsLogEvent)initWithHomes:(id)a3;
- (NSArray)homeSettingsConfigurations;
@end

@implementation HMDCameraConfigurationsLogEvent

- (void).cxx_destruct
{
}

- (NSArray)homeSettingsConfigurations
{
  return self->_homeSettingsConfigurations;
}

- (HMDCameraConfigurationsLogEvent)initWithHomes:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDCameraConfigurationsLogEvent;
  v5 = [(HMMLogEvent *)&v22 init];
  if (v5)
  {
    v6 = [MEMORY[0x263EFF980] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          v13 = [HMDCameraHomeSettingsConfiguration alloc];
          v14 = -[HMDCameraHomeSettingsConfiguration initWithHome:](v13, "initWithHome:", v12, (void)v18);
          [v6 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
    homeSettingsConfigurations = v5->_homeSettingsConfigurations;
    v5->_homeSettingsConfigurations = (NSArray *)v15;
  }
  return v5;
}

@end