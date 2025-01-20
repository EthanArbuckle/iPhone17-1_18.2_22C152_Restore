@interface CFPrefsConfigurationFileSource
- (CFPrefsConfigurationFileSource)initWithConfigurationPropertyList:(__CFDictionary *)a3 containingPreferences:(id)a4;
@end

@implementation CFPrefsConfigurationFileSource

- (CFPrefsConfigurationFileSource)initWithConfigurationPropertyList:(__CFDictionary *)a3 containingPreferences:(id)a4
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  v7.receiver = self;
  v7.super_class = (Class)CFPrefsConfigurationFileSource;
  v5 = [(CFPrefsSource *)&v7 initWithContainingPreferences:a4];
  if (v5) {
    CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)mergeFunc, v5);
  }
  return v5;
}

@end