@interface HFDoorStatusItem
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

@implementation HFDoorStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D6A8]];
}

- (id)oneServiceTitleString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleDoor_One", @"HFStatusTitleDoor_One", 1);
}

- (id)multipleServiceTitleFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleDoor_Multiple", @"HFStatusTitleDoor_Multiple", 1);
}

- (id)oneObstructedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionDoor_OneObstructed", @"HFStatusDescriptionDoor_OneObstructed", 1);
}

- (id)oneOpenServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionDoor_OneOpen", @"HFStatusDescriptionDoor_OneOpen", 1);
}

- (id)oneOpeningServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionDoor_OneOpening", @"HFStatusDescriptionDoor_OneOpening", 1);
}

- (id)oneClosingServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionDoor_OneClosing", @"HFStatusDescriptionDoor_OneClosing", 1);
}

- (id)oneClosedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionDoor_OneClosed", @"HFStatusDescriptionDoor_OneClosed", 1);
}

- (id)multipleObstructedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionDoor_MultipleObstructed", @"HFStatusDescriptionDoor_MultipleObstructed", 1);
}

- (id)multipleOpenServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionDoor_MultipleOpen", @"HFStatusDescriptionDoor_MultipleOpen", 1);
}

- (id)multipleOpeningServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionDoor_MultipleOpening", @"HFStatusDescriptionDoor_MultipleOpening", 1);
}

- (id)multipleClosingServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionDoor_MultipleClosing", @"HFStatusDescriptionDoor_MultipleClosing", 1);
}

- (id)multipleClosedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionDoor_MultipleClosed", @"HFStatusDescriptionDoor_MultipleClosed", 1);
}

@end