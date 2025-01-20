@interface DNDBehaviorSettings(Record)
+ (id)settingsForRecord:()Record;
- (DNDSMutableBehaviorSettingsRecord)makeRecord;
@end

@implementation DNDBehaviorSettings(Record)

+ (id)settingsForRecord:()Record
{
  v3 = (objc_class *)MEMORY[0x1E4F5F6D0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 interruptionBehaviorSetting];

  objc_msgSend(v5, "setInterruptionBehaviorSetting:", objc_msgSend(v6, "unsignedIntegerValue"));
  return v5;
}

- (DNDSMutableBehaviorSettingsRecord)makeRecord
{
  v2 = objc_alloc_init(DNDSMutableBehaviorSettingsRecord);
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "interruptionBehaviorSetting"));
  [(DNDSMutableBehaviorSettingsRecord *)v2 setInterruptionBehaviorSetting:v3];

  return v2;
}

@end