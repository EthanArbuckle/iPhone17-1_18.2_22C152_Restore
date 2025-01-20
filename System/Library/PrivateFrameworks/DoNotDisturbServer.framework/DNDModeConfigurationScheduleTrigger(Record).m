@interface DNDModeConfigurationScheduleTrigger(Record)
+ (uint64_t)newWithDictionaryRepresentation:()Record context:;
- (id)dictionaryRepresentationWithContext:()Record;
@end

@implementation DNDModeConfigurationScheduleTrigger(Record)

+ (uint64_t)newWithDictionaryRepresentation:()Record context:
{
  id v3 = a3;
  v18 = objc_msgSend(v3, "bs_safeNumberForKey:", @"timePeriodStartTimeHour");
  v4 = objc_msgSend(v3, "bs_safeNumberForKey:", @"timePeriodStartTimeMinute");
  v5 = objc_msgSend(v3, "bs_safeNumberForKey:", @"timePeriodEndTimeHour");
  v6 = objc_msgSend(v3, "bs_safeNumberForKey:", @"timePeriodEndTimeMinute");
  v7 = objc_msgSend(v3, "bs_safeNumberForKey:", @"timePeriodWeekdays");
  v8 = objc_msgSend(v3, "bs_safeNumberForKey:", @"creationDate");
  v9 = objc_msgSend(v3, "bs_safeNumberForKey:", @"enabledSetting");

  uint64_t v10 = [v9 unsignedIntegerValue];
  id v11 = objc_alloc_init(MEMORY[0x1E4F5F720]);
  objc_msgSend(v11, "setHour:", objc_msgSend(v18, "unsignedIntegerValue"));
  objc_msgSend(v11, "setMinute:", objc_msgSend(v4, "unsignedIntegerValue"));
  id v12 = objc_alloc_init(MEMORY[0x1E4F5F720]);
  objc_msgSend(v12, "setHour:", objc_msgSend(v5, "unsignedIntegerValue"));
  objc_msgSend(v12, "setMinute:", objc_msgSend(v6, "unsignedIntegerValue"));
  id v13 = objc_alloc_init(MEMORY[0x1E4F5F728]);
  [v13 setStartTime:v11];
  [v13 setEndTime:v12];
  objc_msgSend(v13, "setWeekdays:", objc_msgSend(v7, "integerValue"));
  v14 = (void *)MEMORY[0x1E4F1C9C8];
  [v8 doubleValue];
  v15 = objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
  uint64_t v16 = [objc_alloc(MEMORY[0x1E4F5F688]) initWithTimePeriod:v13 creationDate:v15 enabledSetting:v10];

  return v16;
}

- (id)dictionaryRepresentationWithContext:()Record
{
  v28[8] = *MEMORY[0x1E4F143B8];
  v28[0] = @"DNDModeConfigurationScheduleTrigger";
  v27[0] = @"class";
  v27[1] = @"enabledSetting";
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "enabledSetting"));
  v28[1] = v26;
  v27[2] = @"timePeriodStartTimeHour";
  v2 = NSNumber;
  v25 = [a1 timePeriod];
  v24 = [v25 startTime];
  v23 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v24, "hour"));
  v28[2] = v23;
  v27[3] = @"timePeriodStartTimeMinute";
  id v3 = NSNumber;
  v22 = [a1 timePeriod];
  v21 = [v22 startTime];
  v20 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v21, "minute"));
  v28[3] = v20;
  v27[4] = @"timePeriodEndTimeHour";
  v4 = NSNumber;
  v19 = [a1 timePeriod];
  v5 = [v19 endTime];
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "hour"));
  v28[4] = v6;
  v27[5] = @"timePeriodEndTimeMinute";
  v7 = NSNumber;
  v8 = [a1 timePeriod];
  v9 = [v8 endTime];
  uint64_t v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "minute"));
  v28[5] = v10;
  v27[6] = @"timePeriodWeekdays";
  id v11 = NSNumber;
  id v12 = [a1 timePeriod];
  id v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "weekdays"));
  v28[6] = v13;
  v27[7] = @"creationDate";
  v14 = NSNumber;
  v15 = [a1 creationDate];
  [v15 timeIntervalSince1970];
  uint64_t v16 = objc_msgSend(v14, "numberWithDouble:");
  v28[7] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:8];

  return v17;
}

@end