@interface HFValveStatusItem
+ (id)serviceTypes;
- (id)multipleClosedServicesDescriptionString;
- (id)multipleClosingServicesDescriptionString;
- (id)multipleOpenServicesDescriptionString;
- (id)multipleOpeningServicesDescriptionString;
- (id)multipleServiceTitleFormatString;
- (id)oneClosedServiceDescriptionString;
- (id)oneClosingServiceDescriptionString;
- (id)oneOpenServiceDescriptionString;
- (id)oneOpeningServiceDescriptionString;
- (id)oneServiceTitleString;
@end

@implementation HFValveStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D880]];
}

- (id)oneServiceTitleString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleValve_One", @"HFStatusTitleValve_One", 1);
}

- (id)multipleServiceTitleFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleValve_Multiple", @"HFStatusTitleValve_Multiple", 1);
}

- (id)oneOpenServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionValve_OneRunning", @"HFStatusDescriptionValve_OneRunning", 1);
}

- (id)oneOpeningServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionValve_OneStarting", @"HFStatusDescriptionValve_OneStarting", 1);
}

- (id)oneClosingServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionValve_OneStopping", @"HFStatusDescriptionValve_OneStopping", 1);
}

- (id)oneClosedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionValve_OneOff", @"HFStatusDescriptionValve_OneOff", 1);
}

- (id)multipleOpenServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionValve_MultipleRunning", @"HFStatusDescriptionValve_MultipleRunning", 1);
}

- (id)multipleOpeningServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionValve_MultipleStarting", @"HFStatusDescriptionValve_MultipleStarting", 1);
}

- (id)multipleClosingServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionValve_MultipleStopping", @"HFStatusDescriptionValve_MultipleStopping", 1);
}

- (id)multipleClosedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionValve_MultipleOff", @"HFStatusDescriptionValve_MultipleOff", 1);
}

@end