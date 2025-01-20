@interface _MKFYearDayScheduleRule
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)populateYearDayScheduleRuleFromDictionary:(id)a3 existingLocalModels:(id)a4 context:(id)a5;
- (BOOL)isValid;
- (MKFYearDayScheduleRuleDatabaseID)databaseID;
- (id)dictionaryRepresentation;
- (id)yearDayScheduleRule;
@end

@implementation _MKFYearDayScheduleRule

- (MKFYearDayScheduleRuleDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFYearDayScheduleRuleDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (id)dictionaryRepresentation
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"mi";
  v3 = [(_MKFYearDayScheduleRule *)self modelID];
  v9[0] = v3;
  v8[1] = @"st";
  v4 = [(_MKFYearDayScheduleRule *)self startDate];
  v9[1] = v4;
  v8[2] = @"et";
  v5 = [(_MKFYearDayScheduleRule *)self endDate];
  v9[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (BOOL)isValid
{
  v3 = [(_MKFYearDayScheduleRule *)self modelID];
  if (v3)
  {
    v4 = [(_MKFYearDayScheduleRule *)self startDate];
    if (v4)
    {
      v5 = [(_MKFYearDayScheduleRule *)self endDate];
      BOOL v6 = v5 == 0;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return !v6;
}

- (id)yearDayScheduleRule
{
  id v3 = objc_alloc(MEMORY[0x263F08798]);
  v4 = [(_MKFYearDayScheduleRule *)self startDate];
  v5 = [(_MKFYearDayScheduleRule *)self endDate];
  BOOL v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];

  v7 = (void *)[objc_alloc(MEMORY[0x263F0E8F0]) initWithDateInterval:v6];
  return v7;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E579450;
}

+ (id)populateYearDayScheduleRuleFromDictionary:(id)a3 existingLocalModels:(id)a4 context:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 objectForKeyedSubscript:@"st"];
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

  v17 = [v8 objectForKeyedSubscript:@"mi"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  if (v19 && v13 && v16)
  {
    v20 = [v9 objectForKeyedSubscript:v19];
    if (!v20)
    {
      v20 = [[_MKFYearDayScheduleRule alloc] initWithContext:v10];
      [(_MKFYearDayScheduleRule *)v20 setModelID:v19];
      [(_MKFYearDayScheduleRule *)v20 setStartDate:v13];
      [(_MKFYearDayScheduleRule *)v20 setEndDate:v16];
    }
    v21 = [(_MKFYearDayScheduleRule *)v20 startDate];
    char v22 = HMFEqualObjects();

    if ((v22 & 1) == 0) {
      [(_MKFYearDayScheduleRule *)v20 setStartDate:v13];
    }
    v23 = [(_MKFYearDayScheduleRule *)v20 endDate];
    char v24 = HMFEqualObjects();

    if ((v24 & 1) == 0) {
      [(_MKFYearDayScheduleRule *)v20 setEndDate:v16];
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    id v26 = a1;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      int v30 = 138543618;
      v31 = v28;
      __int16 v32 = 2112;
      id v33 = v8;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot create year day schedule rule from dictionary : %@", (uint8_t *)&v30, 0x16u);
    }
    v20 = 0;
  }

  return v20;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFYearDayScheduleRule"];
}

@end