@interface HFAirPurifierStatusItem
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

@implementation HFAirPurifierStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D618]];
}

- (id)oneAbnormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleAirPurifier_One", @"HFStatusTitleAirPurifier_One", 1);
}

- (id)oneNormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleAirPurifier_One", @"HFStatusTitleAirPurifier_One", 1);
}

- (id)multipleAbnormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleAirPurifier_Multiple", @"HFStatusTitleAirPurifier_Multiple", 1);
}

- (id)multipleNormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleAirPurifier_Multiple", @"HFStatusTitleAirPurifier_Multiple", 1);
}

- (id)oneAbnormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionAirPurifier_OneOn", @"HFStatusDescriptionAirPurifier_OneOn", 1);
}

- (id)oneNormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionAirPurifier_OneOff", @"HFStatusDescriptionAirPurifier_OneOff", 1);
}

- (id)multipleAbnormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionAirPurifier_MultipleOn", @"HFStatusDescriptionAirPurifier_MultipleOn", 1);
}

- (id)multipleNormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionAirPurifier_MultipleOff", @"HFStatusDescriptionAirPurifier_MultipleOff", 1);
}

@end