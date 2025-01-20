@interface NSDateFormatter(FULocaleAndTimeZoneObserving)
- (void)fu_observeTimeZoneAndLocaleChanges;
@end

@implementation NSDateFormatter(FULocaleAndTimeZoneObserving)

- (void)fu_observeTimeZoneAndLocaleChanges
{
  objc_initWeak(&location, val);
  v1 = [MEMORY[0x263F08A00] defaultCenter];
  v2 = [MEMORY[0x263F08A48] mainQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__NSDateFormatter_FULocaleAndTimeZoneObserving__fu_observeTimeZoneAndLocaleChanges__block_invoke;
  v10[3] = &unk_2644A8100;
  objc_copyWeak(&v11, &location);
  id v3 = (id)[v1 addObserverForName:@"FitnessUnitPreferencesDidChangeNotification" object:0 queue:v2 usingBlock:v10];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  v5 = [MEMORY[0x263F08A48] mainQueue];
  uint64_t v6 = *MEMORY[0x263EFF5D0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__NSDateFormatter_FULocaleAndTimeZoneObserving__fu_observeTimeZoneAndLocaleChanges__block_invoke_2;
  v8[3] = &unk_2644A8100;
  objc_copyWeak(&v9, &location);
  id v7 = (id)[v4 addObserverForName:v6 object:0 queue:v5 usingBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

@end