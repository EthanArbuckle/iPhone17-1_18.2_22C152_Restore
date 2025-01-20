@interface CDSleepForAutoSu
@end

@implementation CDSleepForAutoSu

void __37___CDSleepForAutoSu_tuningDictionary__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) readConfigurationFromDefaults];
  uint64_t v2 = [*(id *)(a1 + 32) sanitizeTuningConfiguration:v4];
  v3 = (void *)tuningDictionary_tuningDict;
  tuningDictionary_tuningDict = v2;
}

@end