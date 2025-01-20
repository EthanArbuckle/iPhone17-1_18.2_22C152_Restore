@interface HFLeakAlarmStatusItem
+ (id)serviceTypes;
- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3;
- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3;
- (id)statusDescriptionAllNormal;
- (id)statusDescriptionMultipleTriggered:(unint64_t)a3;
- (id)statusDescriptionOneTriggered;
@end

@implementation HFLeakAlarmStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D758]];
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithPointSize:", a3, 24.0);
  v4 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"drop.fill" configuration:v3];

  return v4;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleLeakAlarm", @"HFStatusTitleLeakAlarm", 1);
}

- (id)statusDescriptionAllNormal
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLeakAlarm_Normal", @"HFStatusDescriptionLeakAlarm_Normal", 1);
}

- (id)statusDescriptionOneTriggered
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionLeakAlarm_Triggered", @"HFStatusDescriptionLeakAlarm_Triggered", 1);
}

- (id)statusDescriptionMultipleTriggered:(unint64_t)a3
{
  return HFLocalizedStringWithFormat(@"HFStatusDescriptionLeakAlarm_Multiple", @"%lu", a3, v3, v4, v5, v6, v7, a3);
}

@end