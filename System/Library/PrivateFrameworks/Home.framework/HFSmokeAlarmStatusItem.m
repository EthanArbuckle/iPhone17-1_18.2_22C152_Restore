@interface HFSmokeAlarmStatusItem
+ (id)serviceTypes;
- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3;
- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3;
- (id)statusDescriptionAllNormal;
- (id)statusDescriptionMultipleTriggered:(unint64_t)a3;
- (id)statusDescriptionOneTriggered;
@end

@implementation HFSmokeAlarmStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D7F8]];
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithPointSize:", a3, 24.0);
  v4 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"smoke.fill" configuration:v3];

  return v4;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleSmokeAlarm", @"HFStatusTitleSmokeAlarm", 1);
}

- (id)statusDescriptionAllNormal
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionSmokeAlarm_Normal", @"HFStatusDescriptionSmokeAlarm_Normal", 1);
}

- (id)statusDescriptionOneTriggered
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionSmokeAlarm_Triggered", @"HFStatusDescriptionSmokeAlarm_Triggered", 1);
}

- (id)statusDescriptionMultipleTriggered:(unint64_t)a3
{
  return HFLocalizedStringWithFormat(@"HFStatusDescriptionSmokeAlarm_Multiple", @"%lu", a3, v3, v4, v5, v6, v7, a3);
}

@end