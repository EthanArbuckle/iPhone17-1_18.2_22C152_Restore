@interface WFWeatherAttributionAccessResource
- (id)icon;
- (id)name;
- (unint64_t)status;
@end

@implementation WFWeatherAttributionAccessResource

- (id)name
{
  return WFLocalizedString(@"Weather data sources");
}

- (id)icon
{
  id v2 = objc_alloc(MEMORY[0x263F85308]);
  v3 = [(objc_class *)getWFAttributionClass() sharedAttribution];
  v4 = [v3 sourceAttributionImageForStyle:2];
  v5 = (void *)[v2 initWithPlatformImage:v4];

  v6 = [MEMORY[0x263F851A8] colorWithRed:0.121568628 green:0.301960796 blue:0.611764729 alpha:1.0];
  v7 = [v5 tintedImageWithColor:v6];

  return v7;
}

- (unint64_t)status
{
  return 4;
}

@end