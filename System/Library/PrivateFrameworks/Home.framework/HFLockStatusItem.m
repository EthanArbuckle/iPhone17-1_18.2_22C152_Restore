@interface HFLockStatusItem
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

@implementation HFLockStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D798]];
}

- (id)oneServiceTitleString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleLock_One", @"HFStatusTitleLock_One", 1);
}

- (id)oneOpenServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLock_OneUnlocked", @"HFStatusDescriptionLock_OneUnlocked", 1);
}

- (id)multipleServiceTitleFormatString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleLock_Multiple", @"HFStatusTitleLock_Multiple", 1);
}

- (id)oneObstructedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLock_OneJammed", @"HFStatusDescriptionLock_OneJammed", 1);
}

- (id)oneOpeningServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLock_OneUnlocking", @"HFStatusDescriptionLock_OneUnlocking", 1);
}

- (id)oneClosingServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLock_OneLocking", @"HFStatusDescriptionLock_OneLocking", 1);
}

- (id)oneClosedServiceDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLock_OneLocked", @"HFStatusDescriptionLock_OneLocked", 1);
}

- (id)multipleObstructedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLock_MultipleJammed", @"HFStatusDescriptionLock_MultipleJammed", 1);
}

- (id)multipleOpenServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLock_MultipleUnlocked", @"HFStatusDescriptionLock_MultipleUnlocked", 1);
}

- (id)multipleOpeningServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLock_MultipleUnlocking", @"HFStatusDescriptionLock_MultipleUnlocking", 1);
}

- (id)multipleClosingServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLock_MultipleLocking", @"HFStatusDescriptionLock_MultipleLocking", 1);
}

- (id)multipleClosedServicesDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLock_MultipleLocked", @"HFStatusDescriptionLock_MultipleLocked", 1);
}

@end