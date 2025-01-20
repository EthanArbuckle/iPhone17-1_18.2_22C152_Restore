@interface HFScheduleRule
+ (id)defaultRuleForType:(unint64_t)a3;
- (BOOL)isAllDayWeekDayRule;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWeekDayRule;
- (BOOL)isYearDayRule;
- (HFScheduleRule)initWithWeekDayRule:(id)a3;
- (HFScheduleRule)initWithYearDayRule:(id)a3;
- (HMWeekDayScheduleRule)weekDayRule;
- (HMYearDayScheduleRule)yearDayRule;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setWeekDayRule:(id)a3;
- (void)setYearDayRule:(id)a3;
@end

@implementation HFScheduleRule

+ (id)defaultRuleForType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v9 = 0;
      goto LABEL_10;
    case 2uLL:
      v5 = objc_msgSend(MEMORY[0x263EFF918], "hf_componentsWithHour:minute:", 0, 0);
      v6 = objc_msgSend(MEMORY[0x263EFF918], "hf_componentsWithHour:minute:", 23, 59);
      v7 = (void *)[objc_alloc(MEMORY[0x263F0E8D8]) initWithStartTime:v5 endTime:v6];
      v8 = [[HFScheduleRule alloc] initWithWeekDayRule:v7];
      break;
    case 1uLL:
      v4 = [MEMORY[0x263EFF910] date];
      v5 = objc_msgSend(v4, "hf_startOfDay");

      v6 = [MEMORY[0x263EFF910] distantFuture];
      v7 = (void *)[objc_alloc(MEMORY[0x263F0E8F0]) initWithValidFrom:v5 validUntil:v6];
      v8 = [[HFScheduleRule alloc] initWithYearDayRule:v7];
      break;
    default:
      v5 = [MEMORY[0x263F08690] currentHandler];
      v6 = [NSNumber numberWithUnsignedInteger:a3];
      [v5 handleFailureInMethod:a2, a1, @"HFScheduleRule.m", 44, @"Unknown schedule type [%@]", v6 object file lineNumber description];
      v9 = 0;
      goto LABEL_9;
  }
  v9 = v8;

LABEL_9:
LABEL_10:
  return v9;
}

- (HFScheduleRule)initWithWeekDayRule:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFScheduleRule.m", 51, @"Invalid parameter not satisfying: %@", @"weekDayRule" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HFScheduleRule;
  v7 = [(HFScheduleRule *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_weekDayRule, a3);
  }

  return v8;
}

- (HFScheduleRule)initWithYearDayRule:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFScheduleRule.m", 63, @"Invalid parameter not satisfying: %@", @"yearDayRule" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HFScheduleRule;
  v7 = [(HFScheduleRule *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_yearDayRule, a3);
  }

  return v8;
}

- (BOOL)isWeekDayRule
{
  v2 = [(HFScheduleRule *)self weekDayRule];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isYearDayRule
{
  v2 = [(HFScheduleRule *)self yearDayRule];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isAllDayWeekDayRule
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  BOOL v4 = [(HFScheduleRule *)self isWeekDayRule];
  v5 = HFLogForCategory(0x46uLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      NSStringFromSelector(a2);
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      v8 = [(HFScheduleRule *)self weekDayRule];
      *(_DWORD *)buf = 138413058;
      v59 = self;
      __int16 v60 = 2112;
      v61 = v7;
      __int16 v62 = 2112;
      v63 = v8;
      __int16 v64 = 2112;
      v65 = self;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Attempting to determine all-day rule for weekDayRule [%@] from schedule rule [%@].", buf, 0x2Au);
    }
    aSelector = a2;

    v9 = objc_msgSend(MEMORY[0x263EFF910], "hf_sharedCalendar");
    v10 = [(HFScheduleRule *)self weekDayRule];
    objc_super v11 = [v10 startTime];
    v5 = [v9 dateFromComponents:v11];

    v12 = [v5 dateComponents];
    uint64_t v13 = [v12 hour];
    v57 = v12;
    uint64_t v51 = [v12 minute];
    v14 = objc_msgSend(MEMORY[0x263EFF910], "hf_sharedCalendar");
    v15 = [(HFScheduleRule *)self weekDayRule];
    v16 = [v15 endTime];
    v17 = [v14 dateFromComponents:v16];

    v18 = [v17 dateComponents];
    uint64_t v19 = [v18 hour];
    v55 = v18;
    uint64_t v20 = [v18 minute];
    v21 = [v5 hf_startOfDay];
    v22 = [v21 dateComponents];
    uint64_t v23 = [v22 hour];

    v54 = v21;
    v24 = [v21 dateComponents];
    uint64_t v25 = [v24 minute];

    v56 = v17;
    v26 = objc_msgSend(v17, "hf_endOfDay");
    v27 = [v26 dateComponents];
    uint64_t v28 = [v27 hour];

    v53 = v26;
    v29 = [v26 dateComponents];
    uint64_t v30 = [v29 minute];

    uint64_t v47 = v25;
    uint64_t v48 = v23;
    BOOL v31 = v13 == v23 && v51 == v25;
    uint64_t v32 = v20;
    uint64_t v33 = v19;
    BOOL v36 = v31 && v19 == v28 && v20 == v30;
    v37 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(aSelector);
      aSelectora = (char *)objc_claimAutoreleasedReturnValue();
      v46 = [NSNumber numberWithInteger:v13];
      v38 = [NSNumber numberWithInteger:v51];
      v39 = [NSNumber numberWithInteger:v33];
      v52 = [NSNumber numberWithInteger:v32];
      v40 = [NSNumber numberWithInteger:v48];
      v41 = [NSNumber numberWithInteger:v47];
      v42 = [NSNumber numberWithInteger:v28];
      v43 = [NSNumber numberWithInteger:v30];
      *(_DWORD *)buf = 138414850;
      v59 = self;
      __int16 v60 = 2112;
      v61 = aSelectora;
      __int16 v62 = 2112;
      v63 = v46;
      __int16 v64 = 2112;
      v65 = v38;
      __int16 v66 = 2112;
      v67 = v39;
      __int16 v68 = 2112;
      v69 = v52;
      __int16 v70 = 2112;
      v71 = v40;
      __int16 v72 = 2112;
      v73 = v41;
      __int16 v74 = 2112;
      v75 = v42;
      __int16 v76 = 2112;
      v77 = v43;
      __int16 v78 = 1024;
      BOOL v79 = v36;
      _os_log_impl(&dword_20B986000, v37, OS_LOG_TYPE_DEFAULT, "%@:%@ startHour = [%@], startMinute = [%@], endHour = [%@], endMinute = [%@] | startOfDayHour = [%@], startOfDayMinute = [%@], endOfDayHour = [%@], endOfDayMinute = [%@] | isAllDayRule = %{BOOL}d", buf, 0x6Cu);
    }
  }
  else
  {
    if (v6)
    {
      NSStringFromSelector(a2);
      v44 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v59 = self;
      __int16 v60 = 2112;
      v61 = v44;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Not a weekDayRule. Unabled to determine if schedule rule is an all-day rule.", buf, 0x16u);
    }
    LOBYTE(v36) = 0;
  }

  return v36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(HFScheduleRule *)self weekDayRule];
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  v8 = [(HFScheduleRule *)self yearDayRule];
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (HFScheduleRule *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = v6;

    if (v7)
    {
      if ([(HFScheduleRule *)v7 isWeekDayRule])
      {
        v8 = [(HFScheduleRule *)v5 weekDayRule];
        uint64_t v9 = [(HFScheduleRule *)self weekDayRule];
        char v10 = [v8 isEqual:v9];

        if (v10)
        {
          char v11 = 1;
LABEL_13:

          goto LABEL_14;
        }
      }
      if ([(HFScheduleRule *)v7 isYearDayRule])
      {
        v12 = [(HFScheduleRule *)v5 yearDayRule];
        uint64_t v13 = [(HFScheduleRule *)self yearDayRule];
        char v11 = [v12 isEqual:v13];

        goto LABEL_13;
      }
    }
    char v11 = 0;
    goto LABEL_13;
  }
  char v11 = 1;
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  BOOL v3 = [(HFScheduleRule *)self weekDayRule];
  uint64_t v4 = [v3 hash];
  v5 = [(HFScheduleRule *)self yearDayRule];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x263F58188] builderWithObject:self];
  uint64_t v4 = [(HFScheduleRule *)self weekDayRule];
  id v5 = (id)[v3 appendObject:v4 withName:@"weekDayRule"];

  unint64_t v6 = [(HFScheduleRule *)self yearDayRule];
  id v7 = (id)[v3 appendObject:v6 withName:@"yearDayRule"];

  v8 = [v3 build];

  return v8;
}

- (HMWeekDayScheduleRule)weekDayRule
{
  return self->_weekDayRule;
}

- (void)setWeekDayRule:(id)a3
{
}

- (HMYearDayScheduleRule)yearDayRule
{
  return self->_yearDayRule;
}

- (void)setYearDayRule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearDayRule, 0);
  objc_storeStrong((id *)&self->_weekDayRule, 0);
}

@end