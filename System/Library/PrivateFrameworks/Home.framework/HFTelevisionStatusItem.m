@interface HFTelevisionStatusItem
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

@implementation HFTelevisionStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D850]];
}

- (id)oneAbnormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleTelevision_One", @"HFStatusTitleTelevision_One", 1);
}

- (id)oneNormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleTelevision_One", @"HFStatusTitleTelevision_One", 1);
}

- (id)multipleAbnormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleTelevision_Multiple", @"HFStatusTitleTelevision_Multiple", 1);
}

- (id)multipleNormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleTelevision_Multiple", @"HFStatusTitleTelevision_Multiple", 1);
}

- (id)oneAbnormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionTelevision_OneOn", @"HFStatusDescriptionTelevision_OneOn", 1);
}

- (id)oneNormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionTelevision_OneOff", @"HFStatusDescriptionTelevision_OneOff", 1);
}

- (id)multipleAbnormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionTelevision_MultipleOn", @"HFStatusDescriptionTelevision_MultipleOn", 1);
}

- (id)multipleNormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionTelevision_MultipleOff", @"HFStatusDescriptionTelevision_MultipleOff", 1);
}

@end