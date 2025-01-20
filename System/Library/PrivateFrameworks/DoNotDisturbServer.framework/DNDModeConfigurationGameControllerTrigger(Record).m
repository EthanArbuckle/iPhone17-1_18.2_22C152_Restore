@interface DNDModeConfigurationGameControllerTrigger(Record)
+ (uint64_t)newWithDictionaryRepresentation:()Record context:;
- (id)dictionaryRepresentationWithContext:()Record;
@end

@implementation DNDModeConfigurationGameControllerTrigger(Record)

+ (uint64_t)newWithDictionaryRepresentation:()Record context:
{
  v3 = objc_msgSend(a3, "bs_safeNumberForKey:", @"enabledSetting");
  uint64_t v4 = [v3 unsignedIntegerValue];

  id v5 = objc_alloc(MEMORY[0x1E4F5F670]);
  return [v5 initWithEnabledSetting:v4];
}

- (id)dictionaryRepresentationWithContext:()Record
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"class";
  v4[1] = @"enabledSetting";
  v5[0] = @"DNDModeConfigurationGameControllerTrigger";
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "enabledSetting"));
  v5[1] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

@end