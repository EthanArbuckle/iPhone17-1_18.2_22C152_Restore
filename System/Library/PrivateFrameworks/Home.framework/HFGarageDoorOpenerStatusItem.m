@interface HFGarageDoorOpenerStatusItem
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

@implementation HFGarageDoorOpenerStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D6F8]];
}

- (id)oneServiceTitleString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleGarageDoor_One", @"HFStatusTitleGarageDoor_One", 1);
}

- (id)oneOpenServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionGarageDoor_OneOpen", @"HFStatusDescriptionGarageDoor_OneOpen", 1);
}

- (id)multipleServiceTitleFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleGarageDoor_Multiple", @"HFStatusTitleGarageDoor_Multiple", 1);
}

- (id)oneObstructedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionGarageDoor_OneObstructed", @"HFStatusDescriptionGarageDoor_OneObstructed", 1);
}

- (id)oneOpeningServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionGarageDoor_OneOpening", @"HFStatusDescriptionGarageDoor_OneOpening", 1);
}

- (id)oneClosingServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionGarageDoor_OneClosing", @"HFStatusDescriptionGarageDoor_OneClosing", 1);
}

- (id)oneClosedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionGarageDoor_OneClosed", @"HFStatusDescriptionGarageDoor_OneClosed", 1);
}

- (id)multipleObstructedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionGarageDoor_MultipleObstructed", @"HFStatusDescriptionGarageDoor_MultipleObstructed", 1);
}

- (id)multipleOpenServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionGarageDoor_MultipleOpen", @"HFStatusDescriptionGarageDoor_MultipleOpen", 1);
}

- (id)multipleOpeningServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionGarageDoor_MultipleOpening", @"HFStatusDescriptionGarageDoor_MultipleOpening", 1);
}

- (id)multipleClosingServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionGarageDoor_MultipleClosing", @"HFStatusDescriptionGarageDoor_MultipleClosing", 1);
}

- (id)multipleClosedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionGarageDoor_MultipleClosed", @"HFStatusDescriptionGarageDoor_MultipleClosed", 1);
}

@end