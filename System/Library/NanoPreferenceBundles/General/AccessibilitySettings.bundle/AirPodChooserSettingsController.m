@interface AirPodChooserSettingsController
- (id)_deviceConnected:(id)a3;
- (id)specifiers;
@end

@implementation AirPodChooserSettingsController

- (id)specifiers
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v22 = (int)*MEMORY[0x263F5FDB8];
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    v5 = (void *)MEMORY[0x263F5FC40];
    v6 = AXAirPodsLocalizedStringForKey();
    uint64_t v7 = [v5 groupSpecifierWithName:v6];

    v21 = (void *)v7;
    [v4 addObject:v7];
    v8 = [(AirPodChooserSettingsController *)self specifier];
    v9 = [v8 propertyForKey:@"AirPods"];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x263F5FC40];
          v16 = [v14 name];
          v17 = [v15 preferenceSpecifierNamed:v16 target:self set:0 get:sel__deviceConnected_ detail:objc_opt_class() cell:2 edit:0];

          v28 = v14;
          v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
          [v17 setProperty:v18 forKey:@"AirPods"];

          [v4 addObject:v17];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v11);
    }

    v19 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v22);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v22) = (Class)v4;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v22);
  }

  return v3;
}

- (id)_deviceConnected:(id)a3
{
  v3 = [a3 propertyForKey:@"AirPods"];
  id v4 = [v3 firstObject];

  if ([v4 connected])
  {
    AXAirPodsLocalizedStringForKey();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_26FAF8CF0;
  }

  return v5;
}

@end