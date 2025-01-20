@interface DNDBypassSettings(Record)
+ (id)settingsForRecord:()Record;
- (DNDSMutableBypassSettingsRecord)makeRecord;
@end

@implementation DNDBypassSettings(Record)

+ (id)settingsForRecord:()Record
{
  v3 = (objc_class *)MEMORY[0x1E4F5F6D8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 immediateBypassEventSourceType];
  objc_msgSend(v5, "setImmediateBypassEventSourceType:", objc_msgSend(v6, "unsignedIntegerValue"));

  v7 = [v4 immediateBypassCNGroupIdentifier];
  [v5 setImmediateBypassCNGroupIdentifier:v7];

  v8 = [v4 repeatEventSourceBehaviorEnabledSetting];

  objc_msgSend(v5, "setRepeatEventSourceBehaviorEnabledSetting:", objc_msgSend(v8, "unsignedIntegerValue"));
  return v5;
}

- (DNDSMutableBypassSettingsRecord)makeRecord
{
  v2 = objc_alloc_init(DNDSMutableBypassSettingsRecord);
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "immediateBypassEventSourceType"));
  [(DNDSMutableBypassSettingsRecord *)v2 setImmediateBypassEventSourceType:v3];

  id v4 = [a1 immediateBypassCNGroupIdentifier];
  [(DNDSMutableBypassSettingsRecord *)v2 setImmediateBypassCNGroupIdentifier:v4];

  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "repeatEventSourceBehaviorEnabledSetting"));
  [(DNDSMutableBypassSettingsRecord *)v2 setRepeatEventSourceBehaviorEnabledSetting:v5];

  return v2;
}

@end