@interface HFCarbonDioxideAlarmStatusItem
+ (id)serviceTypes;
- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3;
- (id)iconDescription;
- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3;
- (id)statusDescriptionAllNormal;
- (id)statusDescriptionMultipleTriggered:(unint64_t)a3;
- (id)statusDescriptionOneTriggered;
@end

@implementation HFCarbonDioxideAlarmStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D670]];
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithPointSize:", a3, 24.0);
  v4 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"carbon.dioxide.cloud.fill" configuration:v3];

  return v4;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleCO2Alarm", @"HFStatusTitleCO2Alarm", 1);
}

- (id)iconDescription
{
  return @"CO₂";
}

- (id)statusDescriptionAllNormal
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionCO2Alarm_Normal", @"HFStatusDescriptionCO2Alarm_Normal", 1);
}

- (id)statusDescriptionOneTriggered
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusDescriptionCO2Alarm_Triggered", @"HFStatusDescriptionCO2Alarm_Triggered", 1);
}

- (id)statusDescriptionMultipleTriggered:(unint64_t)a3
{
  return HFLocalizedStringWithFormat(@"HFStatusDescriptionCO2Alarm_Multiple", @"%lu", a3, v3, v4, v5, v6, v7, a3);
}

@end