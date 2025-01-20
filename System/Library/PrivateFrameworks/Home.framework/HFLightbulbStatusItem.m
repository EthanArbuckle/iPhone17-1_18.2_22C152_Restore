@interface HFLightbulbStatusItem
+ (id)serviceTypes;
- (id)multipleAbnormalServicesDescriptionString;
- (id)multipleAbnormalServicesFormatString;
- (id)multipleNormalServicesDescriptionString;
- (id)multipleNormalServicesFormatString;
- (id)oneAbnormalServiceDescriptionString;
- (id)oneAbnormalServiceFormatString;
- (id)oneNormalServiceDescriptionString;
- (id)oneNormalServiceFormatString;
@end

@implementation HFLightbulbStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D780]];
}

- (id)oneAbnormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleLightbulb_One", @"HFStatusTitleLightbulb_One", 1);
}

- (id)oneNormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleLightbulb_One", @"HFStatusTitleLightbulb_One", 1);
}

- (id)multipleAbnormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleLightbulb_Multiple", @"HFStatusTitleLightbulb_Multiple", 1);
}

- (id)multipleNormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleLightbulb_Multiple", @"HFStatusTitleLightbulb_Multiple", 1);
}

- (id)oneAbnormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLightbulb_OneOn", @"HFStatusDescriptionLightbulb_OneOn", 1);
}

- (id)oneNormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLightbulb_OneOff", @"HFStatusDescriptionLightbulb_OneOff", 1);
}

- (id)multipleAbnormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLightbulb_MultipleOn", @"HFStatusDescriptionLightbulb_MultipleOn", 1);
}

- (id)multipleNormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLightbulb_MultipleOff", @"HFStatusDescriptionLightbulb_MultipleOff", 1);
}

@end