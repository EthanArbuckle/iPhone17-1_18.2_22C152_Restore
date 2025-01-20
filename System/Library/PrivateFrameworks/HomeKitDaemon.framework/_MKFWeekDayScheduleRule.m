@interface _MKFWeekDayScheduleRule
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)initWeekDayScheduleRuleWithModelID:(id)a3 startTime:(id)a4 endTime:(id)a5 daysOfTheWeek:(id)a6 context:(id)a7;
+ (id)populateWeekDayScheduleRuleFromDictionary:(id)a3 existingLocalModels:(id)a4 context:(id)a5;
- (BOOL)isValid;
- (MKFWeekDayScheduleRuleDatabaseID)databaseID;
- (id)dictionaryRepresentation;
- (id)weekDayScheduleRule;
- (void)updateFromWeekDayScheduleRule:(id)a3;
@end

@implementation _MKFWeekDayScheduleRule

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFWeekDayScheduleRule"];
}

- (MKFWeekDayScheduleRuleDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFWeekDayScheduleRuleDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (id)dictionaryRepresentation
{
  v10[4] = *MEMORY[0x263EF8340];
  v9[0] = @"mi";
  v3 = [(_MKFWeekDayScheduleRule *)self modelID];
  v10[0] = v3;
  v9[1] = @"st";
  v4 = [(_MKFWeekDayScheduleRule *)self startTime];
  v10[1] = v4;
  v9[2] = @"et";
  v5 = [(_MKFWeekDayScheduleRule *)self endTime];
  v10[2] = v5;
  v9[3] = @"dow";
  v6 = [(_MKFWeekDayScheduleRule *)self daysOfTheWeek];
  v10[3] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (BOOL)isValid
{
  v3 = [(_MKFWeekDayScheduleRule *)self modelID];
  if (v3)
  {
    v4 = [(_MKFWeekDayScheduleRule *)self daysOfTheWeek];
    if (v4)
    {
      v5 = [(_MKFWeekDayScheduleRule *)self startTime];
      if (v5)
      {
        v6 = [(_MKFWeekDayScheduleRule *)self endTime];
        BOOL v7 = v6 == 0;
      }
      else
      {
        BOOL v7 = 1;
      }
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return !v7;
}

- (void)updateFromWeekDayScheduleRule:(id)a3
{
  id v4 = a3;
  v5 = [v4 startTime];
  v6 = HMSecondsFromDateComponent();
  [(_MKFWeekDayScheduleRule *)self setStartTime:v6];

  BOOL v7 = [v4 endTime];
  v8 = HMSecondsFromDateComponent();
  [(_MKFWeekDayScheduleRule *)self setEndTime:v8];

  v9 = NSNumber;
  uint64_t v10 = [v4 daysOfTheWeek];

  id v11 = [v9 numberWithUnsignedInteger:v10];
  [(_MKFWeekDayScheduleRule *)self setDaysOfTheWeek:v11];
}

- (id)weekDayScheduleRule
{
  id v3 = objc_alloc(MEMORY[0x263F0E8D8]);
  id v4 = [(_MKFWeekDayScheduleRule *)self startTime];
  v5 = HMDateComponentFromSecondsOfDay();
  v6 = [(_MKFWeekDayScheduleRule *)self endTime];
  BOOL v7 = HMDateComponentFromSecondsOfDay();
  v8 = [(_MKFWeekDayScheduleRule *)self daysOfTheWeek];
  v9 = objc_msgSend(v3, "initWithStartTime:endTime:daysOfTheWeek:", v5, v7, objc_msgSend(v8, "unsignedIntValue"));

  return v9;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E5C7A08;
}

+ (id)populateWeekDayScheduleRuleFromDictionary:(id)a3 existingLocalModels:(id)a4 context:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectForKeyedSubscript:@"st"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  v14 = [v8 objectForKeyedSubscript:@"et"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  v17 = [v8 objectForKeyedSubscript:@"dow"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  v20 = [v8 objectForKeyedSubscript:@"mi"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  id v22 = v21;

  if (v22 && v13 && v16 && v19)
  {
    v23 = [v9 objectForKeyedSubscript:v22];
    if (!v23)
    {
      v23 = [a1 initWeekDayScheduleRuleWithModelID:v22 startTime:v13 endTime:v16 daysOfTheWeek:v19 context:v10];
    }
    v24 = [v23 startTime];
    char v25 = HMFEqualObjects();

    if ((v25 & 1) == 0) {
      [v23 setStartTime:v13];
    }
    v26 = [v23 endTime];
    char v27 = HMFEqualObjects();

    if ((v27 & 1) == 0) {
      [v23 setEndTime:v16];
    }
    v28 = [v23 daysOfTheWeek];
    char v29 = HMFEqualObjects();

    if ((v29 & 1) == 0) {
      [v23 setDaysOfTheWeek:v19];
    }
  }
  else
  {
    id v36 = v9;
    id v30 = v10;
    v31 = (void *)MEMORY[0x230FBD990]();
    id v32 = a1;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v38 = v34;
      __int16 v39 = 2112;
      id v40 = v8;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Cannot create week day schedule rule from dictionary : %@", buf, 0x16u);
    }
    v23 = 0;
    id v10 = v30;
    id v9 = v36;
  }

  return v23;
}

+ (id)initWeekDayScheduleRuleWithModelID:(id)a3 startTime:(id)a4 endTime:(id)a5 daysOfTheWeek:(id)a6 context:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [[_MKFWeekDayScheduleRule alloc] initWithContext:v11];

  [(_MKFWeekDayScheduleRule *)v16 setModelID:v15];
  [(_MKFWeekDayScheduleRule *)v16 setStartTime:v14];

  [(_MKFWeekDayScheduleRule *)v16 setEndTime:v13];
  [(_MKFWeekDayScheduleRule *)v16 setDaysOfTheWeek:v12];

  return v16;
}

@end