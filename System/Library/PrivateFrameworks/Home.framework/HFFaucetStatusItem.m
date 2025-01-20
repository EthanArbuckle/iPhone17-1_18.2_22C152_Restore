@interface HFFaucetStatusItem
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

@implementation HFFaucetStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D6D8]];
}

- (id)oneServiceTitleString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleFaucet_One", @"HFStatusTitleFaucet_One", 1);
}

- (id)multipleServiceTitleFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleFaucet_Multiple", @"HFStatusTitleFaucet_Multiple", 1);
}

- (id)oneOpenServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionFaucet_OneRunning", @"HFStatusDescriptionFaucet_OneRunning", 1);
}

- (id)oneOpeningServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionFaucet_OneStarting", @"HFStatusDescriptionFaucet_OneStarting", 1);
}

- (id)oneClosingServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionFaucet_OneStopping", @"HFStatusDescriptionFaucet_OneStopping", 1);
}

- (id)oneClosedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionFaucet_OneOff", @"HFStatusDescriptionFaucet_OneOff", 1);
}

- (id)multipleOpenServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionFaucet_MultipleRunning", @"HFStatusDescriptionFaucet_MultipleRunning", 1);
}

- (id)multipleOpeningServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionFaucet_MultipleStarting", @"HFStatusDescriptionFaucet_MultipleStarting", 1);
}

- (id)multipleClosingServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionFaucet_MultipleStopping", @"HFStatusDescriptionFaucet_MultipleStopping", 1);
}

- (id)multipleClosedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionFaucet_MultipleOff", @"HFStatusDescriptionFaucet_MultipleOff", 1);
}

@end