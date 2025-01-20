@interface UIImageSymbolConfiguration(HKAdditions)
+ (id)hk_medicationTrackingSymbolConfiguration;
+ (uint64_t)hk_prefersMultiColorConfiguration;
@end

@implementation UIImageSymbolConfiguration(HKAdditions)

+ (uint64_t)hk_prefersMultiColorConfiguration
{
  return [MEMORY[0x1E4FB1830] configurationPreferringMulticolor];
}

+ (id)hk_medicationTrackingSymbolConfiguration
{
  v0 = (void *)MEMORY[0x1E4FB1830];
  v1 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_medicationTrackingKeyColor");
  v2 = [v0 configurationWithHierarchicalColor:v1];

  return v2;
}

@end