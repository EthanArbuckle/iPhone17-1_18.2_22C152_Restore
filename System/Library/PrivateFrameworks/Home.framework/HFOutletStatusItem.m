@interface HFOutletStatusItem
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

@implementation HFOutletStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D7D0]];
}

- (id)oneAbnormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleOutlet_One", @"HFStatusTitleOutlet_One", 1);
}

- (id)oneNormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleOutlet_One", @"HFStatusTitleOutlet_One", 1);
}

- (id)multipleAbnormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleOutlet_Multiple", @"HFStatusTitleOutlet_Multiple", 1);
}

- (id)multipleNormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleOutlet_One", @"HFStatusTitleOutlet_One", 1);
}

- (id)oneAbnormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionOutlet_OneOn", @"HFStatusDescriptionOutlet_OneOn", 1);
}

- (id)oneNormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionOutlet_OneOff", @"HFStatusDescriptionOutlet_OneOff", 1);
}

- (id)multipleAbnormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionOutlet_MultipleOn", @"HFStatusDescriptionOutlet_MultipleOn", 1);
}

- (id)multipleNormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionOutlet_MultipleOff", @"HFStatusDescriptionOutlet_MultipleOff", 1);
}

@end