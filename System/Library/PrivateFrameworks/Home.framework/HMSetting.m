@interface HMSetting
@end

@implementation HMSetting

id __62__HMSetting_HFAdditions__hf_debugDescriptionForValue_keyPath___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = [v2 value];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  v6 = [v5 objectForKey:@"MTAlarms"];
  v7 = [v6 firstObject];
  v8 = [v7 objectForKey:@"$MTAlarm"];

  uint64_t v9 = [v8 objectForKey:@"MTAlarmID"];
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = @"(null)";
  }
  v12 = v11;

  v13 = [v8 objectForKey:@"MTAlarmEnabled"];
  uint64_t v14 = [v13 description];
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = @"(null)";
  }
  v17 = v16;

  v18 = NSString;
  v19 = [v2 identifier];
  v20 = [v18 stringWithFormat:@"Item UUID: %@, Alarm UUID:'%@', enabled:'%@'", v19, v12, v17];

  return v20;
}

@end