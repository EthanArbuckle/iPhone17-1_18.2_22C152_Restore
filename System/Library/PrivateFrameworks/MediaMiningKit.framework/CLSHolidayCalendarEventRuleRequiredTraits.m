@interface CLSHolidayCalendarEventRuleRequiredTraits
+ (id)_locationTraitDebugStringForTrait:(unint64_t)a3;
+ (id)_peopleTraitDebugStringForTrait:(unint64_t)a3;
+ (unint64_t)importanceEnumForImportanceString:(id)a3;
- (BOOL)allowApproximateDateCalculation;
- (BOOL)evaluateWithTraits:(id)a3 evaluateLocationTraits:(BOOL)a4;
- (BOOL)isCelebration;
- (BOOL)mustContainMePerson;
- (BOOL)peopleCountRangeIsRequired;
- (CLSHolidayCalendarEventRuleRequiredTraits)initWithDescription:(id)a3;
- (NSDictionary)defaultScenesWithImportanceString;
- (id)description;
- (unint64_t)eventCategory;
- (unint64_t)importanceForScene:(id)a3;
- (unint64_t)minimumPeopleCount;
- (unint64_t)type;
- (void)setDefaultScenesWithImportanceString:(id)a3;
- (void)setEventCategory:(unint64_t)a3;
- (void)setMinimumPeopleCount:(unint64_t)a3;
- (void)setMustContainMePerson:(BOOL)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation CLSHolidayCalendarEventRuleRequiredTraits

- (void).cxx_destruct
{
}

- (void)setDefaultScenesWithImportanceString:(id)a3
{
}

- (NSDictionary)defaultScenesWithImportanceString
{
  return self->_defaultScenesWithImportanceString;
}

- (BOOL)allowApproximateDateCalculation
{
  return self->_allowApproximateDateCalculation;
}

- (void)setMinimumPeopleCount:(unint64_t)a3
{
  self->_minimumPeopleCount = a3;
}

- (unint64_t)minimumPeopleCount
{
  return self->_minimumPeopleCount;
}

- (void)setMustContainMePerson:(BOOL)a3
{
  self->_mustContainMePerson = a3;
}

- (BOOL)mustContainMePerson
{
  return self->_mustContainMePerson;
}

- (void)setEventCategory:(unint64_t)a3
{
  self->_eventCategory = a3;
}

- (unint64_t)eventCategory
{
  return self->_eventCategory;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)importanceForScene:(id)a3
{
  v3 = [(NSDictionary *)self->_defaultScenesWithImportanceString objectForKeyedSubscript:a3];
  unint64_t v4 = +[CLSHolidayCalendarEventRuleRequiredTraits importanceEnumForImportanceString:v3];

  return v4;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%p:%@> location %lu, people %lu, minimumPeopleCount %lu, mustContainMe %d, type %lu, category %lu", self, v5, -[CLSHolidayCalendarEventRuleTraits locationTrait](self, "locationTrait"), -[CLSHolidayCalendarEventRuleTraits peopleTrait](self, "peopleTrait"), self->_minimumPeopleCount, self->_mustContainMePerson, self->_type, self->_eventCategory];

  return v6;
}

- (BOOL)isCelebration
{
  return self->_type == 1;
}

- (BOOL)peopleCountRangeIsRequired
{
  return self->_minimumPeopleCount != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)evaluateWithTraits:(id)a3 evaluateLocationTraits:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4
    && [(CLSHolidayCalendarEventRuleTraits *)self locationTrait]
    && [v6 locationTrait])
  {
    unint64_t v7 = [(CLSHolidayCalendarEventRuleTraits *)self locationTrait];
    BOOL v8 = ([v6 locationTrait] & v7) != 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  if (-[CLSHolidayCalendarEventRuleTraits peopleTrait](self, "peopleTrait") && [v6 peopleTrait])
  {
    unint64_t v9 = [(CLSHolidayCalendarEventRuleTraits *)self peopleTrait];
    BOOL v10 = ([v6 peopleTrait] & v9) != 0;
  }
  else
  {
    BOOL v10 = 1;
  }
  if ([(CLSHolidayCalendarEventRuleRequiredTraits *)self peopleCountRangeIsRequired]
    && [v6 numberOfPeople] != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v12 = [v6 numberOfPeople];
    BOOL v11 = v12 >= [(CLSHolidayCalendarEventRuleRequiredTraits *)self minimumPeopleCount];
  }
  else
  {
    BOOL v11 = 1;
  }
  if ([(CLSHolidayCalendarEventRuleRequiredTraits *)self mustContainMePerson]) {
    int v13 = [v6 containsMePerson];
  }
  else {
    int v13 = 1;
  }
  if (((v8 && v10) & v11 & v13 & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67111936;
    BOOL v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = [v6 locationTrait];
    __int16 v19 = 2048;
    unint64_t v20 = [(CLSHolidayCalendarEventRuleTraits *)self locationTrait];
    __int16 v21 = 1024;
    BOOL v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = [v6 peopleTrait];
    __int16 v25 = 2048;
    unint64_t v26 = [(CLSHolidayCalendarEventRuleTraits *)self peopleTrait];
    __int16 v27 = 1024;
    BOOL v28 = v11;
    __int16 v29 = 2048;
    uint64_t v30 = [v6 numberOfPeople];
    __int16 v31 = 2048;
    unint64_t v32 = [(CLSHolidayCalendarEventRuleRequiredTraits *)self minimumPeopleCount];
    __int16 v33 = 1024;
    int v34 = v13;
    __int16 v35 = 1024;
    int v36 = [v6 containsMePerson];
    __int16 v37 = 1024;
    BOOL v38 = [(CLSHolidayCalendarEventRuleRequiredTraits *)self mustContainMePerson];
    _os_log_debug_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Traits failed: location %d (given %lu, needed %lu), people %d (given %lu, needed %lu), minimumPeopleCount %d (given %lu, needed %lu), mustContainMe %d (given %d, needed %d)", buf, 0x62u);
  }

  return (v8 && v10) & v11 & v13;
}

- (CLSHolidayCalendarEventRuleRequiredTraits)initWithDescription:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CLSHolidayCalendarEventRuleRequiredTraits;
  v5 = [(CLSHolidayCalendarEventRuleTraits *)&v18 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"eventType"];
    v5->_type = [v6 unsignedIntegerValue];

    unint64_t v7 = [v4 objectForKeyedSubscript:@"eventCategory"];
    v5->_eventCategory = [v7 unsignedIntegerValue];

    BOOL v8 = [v4 objectForKeyedSubscript:@"peopleTrait"];
    uint64_t v9 = [v8 unsignedIntegerValue];

    [(CLSHolidayCalendarEventRuleTraits *)v5 setPeopleTrait:v9];
    BOOL v10 = [v4 objectForKeyedSubscript:@"minimumPeopleCount"];
    v5->_minimumPeopleCount = [v10 unsignedIntegerValue];
    BOOL v11 = [v4 objectForKeyedSubscript:@"locationTrait"];
    uint64_t v12 = [v11 unsignedIntegerValue];

    [(CLSHolidayCalendarEventRuleTraits *)v5 setLocationTrait:v12];
    uint64_t v13 = [v4 objectForKeyedSubscript:@"scenes"];
    defaultScenesWithImportanceString = v5->_defaultScenesWithImportanceString;
    v5->_defaultScenesWithImportanceString = (NSDictionary *)v13;

    v15 = [v4 objectForKeyedSubscript:@"mustContainMe"];
    v5->_mustContainMePerson = [v15 BOOLValue];

    BOOL v16 = [v4 objectForKeyedSubscript:@"allowApproximateDateCalculation"];
    v5->_allowApproximateDateCalculation = [v16 BOOLValue];
  }
  return v5;
}

+ (unint64_t)importanceEnumForImportanceString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"edgeCase"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"medium"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"important"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"imperative"])
  {
    unint64_t v4 = 4;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)_peopleTraitDebugStringForTrait:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [&unk_1F28F2CC0 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(&unk_1F28F2CC0);
          }
          uint64_t v9 = [*(id *)(*((void *)&v16 + 1) + 8 * v8) unsignedIntegerValue];
          if ((v9 & a3) != 0)
          {
            if (v9 > 15)
            {
              if (v9 == 127) {
                BOOL v10 = @"Any";
              }
              else {
                BOOL v10 = 0;
              }
              if (v9 == 64) {
                BOOL v10 = @"father";
              }
              if (v9 == 32) {
                BOOL v11 = @"mother";
              }
              else {
                BOOL v11 = 0;
              }
              if (v9 == 16) {
                BOOL v11 = @"acquaintance";
              }
              if (v9 <= 63) {
                BOOL v10 = v11;
              }
            }
            else
            {
              BOOL v10 = 0;
              switch(v9)
              {
                case 0:
                  BOOL v10 = @"ignore";
                  break;
                case 1:
                  BOOL v10 = @"favorite";
                  break;
                case 2:
                  BOOL v10 = @"family";
                  break;
                case 4:
                  BOOL v10 = @"friend";
                  break;
                case 8:
                  BOOL v10 = @"coworker";
                  break;
                default:
                  break;
              }
            }
            uint64_t v12 = v10;
            [v4 addObject:v12];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v13 = [&unk_1F28F2CC0 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v6 = v13;
      }
      while (v13);
    }
    v14 = [v4 componentsJoinedByString:@", "];
  }
  else
  {
    v14 = @"ignore";
  }
  return v14;
}

+ (id)_locationTraitDebugStringForTrait:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [&unk_1F28F2CA8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(&unk_1F28F2CA8);
          }
          uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) unsignedIntegerValue];
          if ((v9 & a3) != 0)
          {
            if (v9 > 15)
            {
              if (v9 == 63) {
                BOOL v10 = @"Any";
              }
              else {
                BOOL v10 = 0;
              }
              if (v9 == 32) {
                BOOL v10 = @"out of superset country";
              }
              if (v9 == 16) {
                BOOL v10 = @"out of extended area";
              }
            }
            else
            {
              BOOL v10 = 0;
              switch(v9)
              {
                case 0:
                  BOOL v10 = @"ignore";
                  break;
                case 1:
                  BOOL v10 = @"in superset city";
                  break;
                case 2:
                  BOOL v10 = @"in superset extended area";
                  break;
                case 4:
                  BOOL v10 = @"in superset country";
                  break;
                case 8:
                  BOOL v10 = @"out of superset city";
                  break;
                default:
                  break;
              }
            }
            BOOL v11 = v10;
            [v4 addObject:v11];
          }
        }
        uint64_t v6 = [&unk_1F28F2CA8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
    uint64_t v12 = [v4 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v12 = @"ignore";
  }
  return v12;
}

@end