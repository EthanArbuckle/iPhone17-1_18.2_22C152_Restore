@interface HFCarbonMonoxideAlarmStatusItem
+ (id)serviceTypes;
- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3;
- (id)iconDescription;
- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3;
- (id)statusDescriptionAllNormal;
- (id)statusDescriptionMultipleTriggered:(unint64_t)a3;
- (id)statusDescriptionOneTriggered;
@end

@implementation HFCarbonMonoxideAlarmStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D688]];
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithPointSize:", a3, 24.0);
  v4 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"carbon.monoxide.cloud.fill" configuration:v3];

  return v4;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleCOAlarm", @"HFStatusTitleCOAlarm", 1);
}

- (id)iconDescription
{
  return @"CO";
}

- (id)statusDescriptionAllNormal
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionCOAlarm_Normal", @"HFStatusDescriptionCOAlarm_Normal", 1);
}

- (id)statusDescriptionOneTriggered
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionCOAlarm_Triggered", @"HFStatusDescriptionCOAlarm_Triggered", 1);
}

- (id)statusDescriptionMultipleTriggered:(unint64_t)a3
{
  return HFLocalizedStringWithFormat(@"HFStatusDescriptionCOAlarm_Multiple", @"%lu", a3, v3, v4, v5, v6, v7, a3);
}

@end