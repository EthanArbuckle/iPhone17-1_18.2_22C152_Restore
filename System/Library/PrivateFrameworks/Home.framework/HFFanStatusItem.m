@interface HFFanStatusItem
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

@implementation HFFanStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x263F0E708], "hf_fanServiceTypes");
}

- (id)oneAbnormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleFan_One", @"HFStatusTitleFan_One", 1);
}

- (id)oneNormalServiceFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleFan_One", @"HFStatusTitleFan_One", 1);
}

- (id)multipleAbnormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleFan_Multiple", @"HFStatusTitleFan_Multiple", 1);
}

- (id)multipleNormalServicesFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleFan_Multiple", @"HFStatusTitleFan_Multiple", 1);
}

- (id)oneAbnormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionFan_OneOn", @"HFStatusDescriptionFan_OneOn", 1);
}

- (id)oneNormalServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionFan_OneOff", @"HFStatusDescriptionFan_OneOff", 1);
}

- (id)multipleAbnormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionFan_MultipleOn", @"HFStatusDescriptionFan_MultipleOn", 1);
}

- (id)multipleNormalServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionFan_MultipleOff", @"HFStatusDescriptionFan_MultipleOff", 1);
}

@end