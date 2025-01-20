@interface BLTSectionConfigurationItemFactory
+ (id)itemForSection:(id)a3 dictionary:(id)a4;
@end

@implementation BLTSectionConfigurationItemFactory

+ (id)itemForSection:(id)a3 dictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (itemForSection_dictionary__onceToken != -1) {
    dispatch_once(&itemForSection_dictionary__onceToken, &__block_literal_global_3);
  }
  v7 = (objc_class *)(id)[(id)itemForSection_dictionary___sectionToItemClassMap objectForKeyedSubscript:v5];
  if (!v7) {
    v7 = (objc_class *)objc_opt_class();
  }
  v8 = (void *)[[v7 alloc] initWithDictionary:v6];

  return v8;
}

void __64__BLTSectionConfigurationItemFactory_itemForSection_dictionary___block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  v2[0] = @"com.apple.cmas";
  v2[1] = @"com.apple.MobileSMS";
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)itemForSection_dictionary___sectionToItemClassMap;
  itemForSection_dictionary___sectionToItemClassMap = v0;
}

@end