@interface HFWindowStatusItem
+ (id)serviceTypes;
- (id)multipleClosedServicesDescriptionString;
- (id)multipleClosingServicesDescriptionString;
- (id)multipleObstructedServicesDescriptionString;
- (id)multipleOpenServicesDescriptionString;
- (id)multipleOpeningServicesDescriptionString;
- (id)multipleServiceTitleFormatString;
- (id)oneClosedServiceDescriptionString;
- (id)oneClosingServiceDescriptionString;
- (id)oneObstructedServiceDescriptionString;
- (id)oneOpenServiceDescriptionString;
- (id)oneOpeningServiceDescriptionString;
- (id)oneServiceTitleString;
@end

@implementation HFWindowStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D8A8]];
}

- (id)oneServiceTitleString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleWindow_One", @"HFStatusTitleWindow_One", 1);
}

- (id)multipleServiceTitleFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleWindow_Multiple", @"HFStatusTitleWindow_Multiple", 1);
}

- (id)oneObstructedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionWindow_OneObstructed", @"HFStatusDescriptionWindow_OneObstructed", 1);
}

- (id)oneOpenServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionWindow_OneOpen", @"HFStatusDescriptionWindow_OneOpen", 1);
}

- (id)oneOpeningServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionWindow_OneOpening", @"HFStatusDescriptionWindow_OneOpening", 1);
}

- (id)oneClosingServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionWindow_OneClosing", @"HFStatusDescriptionWindow_OneClosing", 1);
}

- (id)oneClosedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionWindow_OneClosed", @"HFStatusDescriptionWindow_OneClosed", 1);
}

- (id)multipleObstructedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionWindow_MultipleObstructed", @"HFStatusDescriptionWindow_MultipleObstructed", 1);
}

- (id)multipleOpenServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionWindow_MultipleOpen", @"HFStatusDescriptionWindow_MultipleOpen", 1);
}

- (id)multipleOpeningServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionWindow_MultipleOpening", @"HFStatusDescriptionWindow_MultipleOpening", 1);
}

- (id)multipleClosingServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionWindow_MultipleClosing", @"HFStatusDescriptionWindow_MultipleClosing", 1);
}

- (id)multipleClosedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionWindow_MultipleClosed", @"HFStatusDescriptionWindow_MultipleClosed", 1);
}

@end