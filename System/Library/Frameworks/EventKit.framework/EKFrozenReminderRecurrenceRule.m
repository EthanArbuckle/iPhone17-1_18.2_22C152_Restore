@interface EKFrozenReminderRecurrenceRule
+ (Class)meltedClass;
+ (int)convertFromReminderKitFrequency:(int64_t)a3;
+ (int)convertFromReminderKitWeekday:(int64_t)a3;
+ (int64_t)convertToReminderKitFrequency:(int)a3;
+ (int64_t)convertToReminderKitWeekday:(int)a3;
- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4;
- (EKFrozenReminderRecurrenceRule)initWithAlternateUniverseObject:(id)a3 inEventStore:(id)a4 withUpdatedChildObjects:(id)a5;
- (EKFrozenReminderRecurrenceRule)initWithREMObject:(id)a3 inStore:(id)a4;
- (EKFrozenReminderRecurrenceRule)initWithREMObject:(id)a3 inStore:(id)a4 withChanges:(id)a5;
- (id)_recurrenceRule;
- (id)addUpdatedRecurrenceRule:(id)a3;
- (id)daysOfTheWeekFromREMRecurrenceRule;
- (id)endDate;
- (id)remDaysOfTheWeekFromEKDaysOfTheWeek:(id)a3;
- (id)remObjectID;
- (id)specifier;
- (id)uniqueIdentifier;
- (int)firstDayOfTheWeekRaw;
- (int)frequencyRaw;
- (int64_t)ekWeekdayToREMWeekday:(int64_t)a3;
- (int64_t)interval;
- (int64_t)remWeekdayToEKWeekday:(int64_t)a3;
- (unint64_t)count;
- (void)loadSpecifierDaysOfTheWeek:(id *)a3 daysOfTheMonth:(id *)a4 monthsOfTheYear:(id *)a5 weeksOfTheYear:(id *)a6 daysOfTheYear:(id *)a7 setPositions:(id *)a8;
@end

@implementation EKFrozenReminderRecurrenceRule

- (EKFrozenReminderRecurrenceRule)initWithREMObject:(id)a3 inStore:(id)a4
{
  return [(EKFrozenReminderRecurrenceRule *)self initWithREMObject:a3 inStore:a4 withChanges:0];
}

- (EKFrozenReminderRecurrenceRule)initWithREMObject:(id)a3 inStore:(id)a4 withChanges:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (EKChangeSet *)a5;
  v11 = v10;
  if (!v8)
  {
    if (!v10)
    {
      v11 = objc_alloc_init(EKChangeSet);
      [(EKChangeSet *)v11 setSkipsPersistentObjectCopy:1];
    }
    v12 = [(EKChangeSet *)v11 valueForSingleValueKey:@"uniqueIdentifier" basedOn:0];
    if (!v12)
    {
      v13 = [MEMORY[0x1E4F29128] UUID];
      v14 = [v13 UUIDString];
      [(EKChangeSet *)v11 changeSingleValue:v14 forKey:@"uniqueIdentifier" basedOn:0];
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)EKFrozenReminderRecurrenceRule;
  v15 = [(EKFrozenReminderObject *)&v17 initWithREMObject:v8 inStore:v9 withChanges:v11];

  return v15;
}

- (EKFrozenReminderRecurrenceRule)initWithAlternateUniverseObject:(id)a3 inEventStore:(id)a4 withUpdatedChildObjects:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(EKChangeSet);
  [(EKChangeSet *)v9 setSkipsPersistentObjectCopy:1];
  v10 = [v7 valueForKey:@"uniqueIdentifier"];
  if (v10) {
    [(EKChangeSet *)v9 changeSingleValue:v10 forKey:@"uniqueIdentifier" basedOn:0];
  }
  v11 = [v7 valueForKey:@"endDate"];
  [(EKChangeSet *)v9 changeSingleValue:v11 forKey:@"endDate" basedOn:0];

  v12 = [v7 valueForKey:@"count"];
  [(EKChangeSet *)v9 changeSingleValue:v12 forKey:@"count" basedOn:0];

  v13 = [v7 valueForKey:@"frequencyRaw"];
  [(EKChangeSet *)v9 changeSingleValue:v13 forKey:@"frequencyRaw" basedOn:0];

  v14 = [v7 valueForKey:@"interval"];
  [(EKChangeSet *)v9 changeSingleValue:v14 forKey:@"interval" basedOn:0];

  v15 = [v7 valueForKey:@"firstDayOfTheWeekRaw"];
  [(EKChangeSet *)v9 changeSingleValue:v15 forKey:@"firstDayOfTheWeekRaw" basedOn:0];

  v16 = [v7 valueForKey:@"specifier"];
  [(EKChangeSet *)v9 changeSingleValue:v16 forKey:@"specifier" basedOn:0];

  objc_super v17 = [v8 reminderStore];

  v18 = [(EKFrozenReminderRecurrenceRule *)self initWithREMObject:0 inStore:v17 withChanges:v9];
  return v18;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4
{
  v6 = [(EKFrozenReminderObject *)self path];
  id v7 = [v6 firstObject];

  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._reminderStore);
    id v9 = [WeakRetained remStore];

    id v16 = 0;
    v10 = [v9 fetchReminderWithObjectID:v7 error:&v16];
    id v11 = v16;
    BOOL v12 = v10 != 0;
    if (!v10)
    {
      v13 = +[EKReminderStore log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[EKFrozenReminderRecurrenceRule _applyChangesToSaveRequest:error:]();
      }

      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:5];
      }
    }
  }
  else
  {
    v14 = +[EKReminderStore log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[EKFrozenReminderRecurrenceRule _applyChangesToSaveRequest:error:]();
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithEKErrorCode:5];
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (id)uniqueIdentifier
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__EKFrozenReminderRecurrenceRule_uniqueIdentifier__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"uniqueIdentifier" backingValue:v4];

  return v2;
}

id __50__EKFrozenReminderRecurrenceRule_uniqueIdentifier__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) remObjectID];
  v2 = [v1 uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)remObjectID
{
  v3 = [(EKFrozenReminderRecurrenceRule *)self _recurrenceRule];

  if (v3)
  {
    v4 = [(EKFrozenReminderRecurrenceRule *)self _recurrenceRule];
    v5 = [v4 objectID];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_recurrenceRule
{
  return self->super._remObject;
}

- (id)addUpdatedRecurrenceRule:(id)a3
{
  id v4 = a3;
  int64_t v21 = +[EKFrozenReminderRecurrenceRule convertToReminderKitFrequency:[(EKFrozenReminderRecurrenceRule *)self frequencyRaw]];
  int64_t v19 = [(EKFrozenReminderRecurrenceRule *)self interval];
  uint64_t v18 = objc_msgSend((id)objc_opt_class(), "convertToReminderKitWeekday:", -[EKFrozenReminderRecurrenceRule firstDayOfTheWeekRaw](self, "firstDayOfTheWeekRaw"));
  id v27 = 0;
  v28[0] = 0;
  id v25 = 0;
  id v26 = 0;
  id v23 = 0;
  id v24 = 0;
  [(EKFrozenReminderRecurrenceRule *)self loadSpecifierDaysOfTheWeek:v28 daysOfTheMonth:&v27 monthsOfTheYear:&v26 weeksOfTheYear:&v25 daysOfTheYear:&v24 setPositions:&v23];
  id v20 = v28[0];
  id v22 = v27;
  id v5 = v26;
  id v6 = v25;
  id v7 = v24;
  id v17 = v23;
  unint64_t v8 = [(EKFrozenReminderRecurrenceRule *)self count];
  if (v8)
  {
    id v9 = [getREMRecurrenceEndClass() recurrenceEndWithOccurrenceCount:v8];
  }
  else
  {
    v10 = [(EKFrozenReminderRecurrenceRule *)self endDate];
    if (v10)
    {
      id v9 = [getREMRecurrenceEndClass() recurrenceEndWithEndDate:v10];
    }
    else
    {
      id v9 = 0;
    }
  }
  id v11 = (void *)[getREMRecurrenceRuleClass() newObjectID];
  id v12 = objc_alloc((Class)getREMRecurrenceRuleClass());
  v13 = [v4 accountID];
  v14 = [v4 objectID];
  v15 = (void *)[v12 initRecurrenceRuleWithObjectID:v11 accountID:v13 reminderID:v14 frequency:v21 interval:v19 firstDayOfTheWeek:v18 daysOfTheWeek:v20 daysOfTheMonth:v22 monthsOfTheYear:v5 weeksOfTheYear:v6 daysOfTheYear:v7 setPositions:v17 end:v9];

  [v4 addRecurrenceRule:v15];

  return v15;
}

- (id)endDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__EKFrozenReminderRecurrenceRule_endDate__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"endDate" backingValue:v4];

  return v2;
}

id __41__EKFrozenReminderRecurrenceRule_endDate__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _recurrenceRule];
  v2 = [v1 recurrenceEnd];
  v3 = [v2 endDate];

  return v3;
}

- (unint64_t)count
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__EKFrozenReminderRecurrenceRule_count__block_invoke;
  v5[3] = &unk_1E5B96908;
  v5[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"count" backingValue:v5];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

id __39__EKFrozenReminderRecurrenceRule_count__block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  v2 = [*(id *)(a1 + 32) _recurrenceRule];
  unint64_t v3 = [v2 recurrenceEnd];
  id v4 = objc_msgSend(v1, "numberWithUnsignedInteger:", objc_msgSend(v3, "occurrenceCount"));

  return v4;
}

- (int)frequencyRaw
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__EKFrozenReminderRecurrenceRule_frequencyRaw__block_invoke;
  v5[3] = &unk_1E5B96908;
  v5[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"frequencyRaw" backingValue:v5];
  int v3 = [v2 unsignedIntegerValue];

  return v3;
}

id __46__EKFrozenReminderRecurrenceRule_frequencyRaw__block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  v2 = [*(id *)(a1 + 32) _recurrenceRule];
  int v3 = objc_msgSend(v1, "numberWithUnsignedInt:", +[EKFrozenReminderRecurrenceRule convertFromReminderKitFrequency:](EKFrozenReminderRecurrenceRule, "convertFromReminderKitFrequency:", objc_msgSend(v2, "frequency")));

  return v3;
}

+ (int)convertFromReminderKitFrequency:(int64_t)a3
{
  if ((unint64_t)a3 < 5) {
    return dword_1A4F8FF20[a3];
  }
  id v4 = +[EKReminderStore log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[EKFrozenReminderRecurrenceRule convertFromReminderKitFrequency:]();
  }

  return 1;
}

+ (int64_t)convertToReminderKitFrequency:(int)a3
{
  int64_t result = (a3 - 1);
  if (result >= 4)
  {
    uint64_t v4 = *(void *)&a3;
    id v5 = +[EKReminderStore log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[EKFrozenReminderRecurrenceRule convertToReminderKitFrequency:](v4, v5, v6, v7, v8, v9, v10, v11);
    }

    return 0;
  }
  return result;
}

- (int64_t)interval
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__EKFrozenReminderRecurrenceRule_interval__block_invoke;
  v5[3] = &unk_1E5B96908;
  v5[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"interval" backingValue:v5];
  int64_t v3 = [v2 integerValue];

  return v3;
}

id __42__EKFrozenReminderRecurrenceRule_interval__block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  v2 = [*(id *)(a1 + 32) _recurrenceRule];
  int64_t v3 = objc_msgSend(v1, "numberWithInteger:", objc_msgSend(v2, "interval"));

  return v3;
}

- (int)firstDayOfTheWeekRaw
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__EKFrozenReminderRecurrenceRule_firstDayOfTheWeekRaw__block_invoke;
  v5[3] = &unk_1E5B96908;
  v5[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"firstDayOfTheWeekRaw" backingValue:v5];
  int v3 = [v2 integerValue];

  return v3;
}

id __54__EKFrozenReminderRecurrenceRule_firstDayOfTheWeekRaw__block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  v2 = [*(id *)(a1 + 32) _recurrenceRule];
  int v3 = objc_msgSend(v1, "numberWithUnsignedInt:", +[EKFrozenReminderRecurrenceRule convertFromReminderKitWeekday:](EKFrozenReminderRecurrenceRule, "convertFromReminderKitWeekday:", objc_msgSend(v2, "firstDayOfTheWeek")));

  return v3;
}

+ (int)convertFromReminderKitWeekday:(int64_t)a3
{
  if ((unint64_t)a3 < 8) {
    return dword_1A4F8FF34[a3];
  }
  uint64_t v4 = +[EKReminderStore log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[EKFrozenReminderRecurrenceRule convertFromReminderKitWeekday:]();
  }

  return 7;
}

+ (int64_t)convertToReminderKitWeekday:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 < 8) {
    return qword_1A4F8FF58[a3];
  }
  id v5 = +[EKReminderStore log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[EKFrozenReminderRecurrenceRule convertToReminderKitWeekday:](v3, v5, v6, v7, v8, v9, v10, v11);
  }

  return 0;
}

- (int64_t)ekWeekdayToREMWeekday:(int64_t)a3
{
  return a3;
}

- (int64_t)remWeekdayToEKWeekday:(int64_t)a3
{
  return a3;
}

- (id)daysOfTheWeekFromREMRecurrenceRule
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(EKFrozenReminderRecurrenceRule *)self _recurrenceRule];
  uint64_t v4 = [v3 daysOfTheWeek];

  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [EKRecurrenceDayOfWeek alloc];
        v13 = -[EKRecurrenceDayOfWeek initWithDayOfTheWeek:weekNumber:](v12, "initWithDayOfTheWeek:weekNumber:", -[EKFrozenReminderRecurrenceRule remWeekdayToEKWeekday:](self, "remWeekdayToEKWeekday:", objc_msgSend(v11, "dayOfTheWeek", (void)v15)), objc_msgSend(v11, "weekNumber"));
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)remDaysOfTheWeekFromEKDaysOfTheWeek:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    v14 = v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v22 = 0;
        id v23 = &v22;
        uint64_t v24 = 0x2050000000;
        uint64_t v10 = (void *)getREMRecurrenceDayOfWeekClass_softClass;
        uint64_t v25 = getREMRecurrenceDayOfWeekClass_softClass;
        if (!getREMRecurrenceDayOfWeekClass_softClass)
        {
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v21[0] = __getREMRecurrenceDayOfWeekClass_block_invoke;
          v21[1] = &unk_1E5B969D8;
          v21[2] = &v22;
          __getREMRecurrenceDayOfWeekClass_block_invoke((uint64_t)v20);
          uint64_t v10 = (void *)v23[3];
        }
        uint64_t v11 = v10;
        _Block_object_dispose(&v22, 8);
        id v12 = objc_msgSend([v11 alloc], "initWithDayOfTheWeek:weekNumber:", -[EKFrozenReminderRecurrenceRule ekWeekdayToREMWeekday:](self, "ekWeekdayToREMWeekday:", objc_msgSend(v9, "dayOfTheWeek", v14)), objc_msgSend(v9, "weekNumber"));
        [v5 addObject:v12];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v6);
  }

  return v5;
}

- (id)specifier
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__EKFrozenReminderRecurrenceRule_specifier__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"specifier" backingValue:v4];

  return v2;
}

id __43__EKFrozenReminderRecurrenceRule_specifier__block_invoke(uint64_t a1)
{
  v2 = [[EKRecurrenceHelper alloc] initWithSpecifier:0];
  uint64_t v3 = [*(id *)(a1 + 32) daysOfTheWeekFromREMRecurrenceRule];
  [(EKRecurrenceHelper *)v2 setDaysOfTheWeek:v3];

  id v4 = [*(id *)(a1 + 32) _recurrenceRule];
  id v5 = [v4 daysOfTheMonth];
  [(EKRecurrenceHelper *)v2 setDaysOfTheMonth:v5];

  uint64_t v6 = [v4 daysOfTheYear];
  [(EKRecurrenceHelper *)v2 setDaysOfTheYear:v6];

  uint64_t v7 = [v4 weeksOfTheYear];
  [(EKRecurrenceHelper *)v2 setWeeksOfTheYear:v7];

  uint64_t v8 = [v4 monthsOfTheYear];
  [(EKRecurrenceHelper *)v2 setMonthsOfTheYear:v8];

  uint64_t v9 = [v4 setPositions];
  [(EKRecurrenceHelper *)v2 setSetPositions:v9];

  uint64_t v10 = [(EKRecurrenceHelper *)v2 specifier];

  return v10;
}

- (void)loadSpecifierDaysOfTheWeek:(id *)a3 daysOfTheMonth:(id *)a4 monthsOfTheYear:(id *)a5 weeksOfTheYear:(id *)a6 daysOfTheYear:(id *)a7 setPositions:(id *)a8
{
  long long v15 = [EKRecurrenceHelper alloc];
  long long v16 = [(EKFrozenReminderRecurrenceRule *)self specifier];
  long long v19 = [(EKRecurrenceHelper *)v15 initWithSpecifier:v16];

  long long v17 = [(EKRecurrenceHelper *)v19 daysOfTheWeek];
  id v18 = [(EKFrozenReminderRecurrenceRule *)self remDaysOfTheWeekFromEKDaysOfTheWeek:v17];
  *a3 = v18;
  *a4 = [(EKRecurrenceHelper *)v19 daysOfTheMonth];
  *a5 = [(EKRecurrenceHelper *)v19 monthsOfTheYear];
  *a6 = [(EKRecurrenceHelper *)v19 weeksOfTheYear];
  *a7 = [(EKRecurrenceHelper *)v19 daysOfTheYear];
  *a8 = [(EKRecurrenceHelper *)v19 setPositions];
}

- (void)_applyChangesToSaveRequest:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Rule to be saved doesn't have a parent reminder: %@", v2, v3, v4, v5, v6);
}

- (void)_applyChangesToSaveRequest:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Couldn't fetch reminder to be saved: %@", v2, v3, v4, v5, v6);
}

+ (void)convertFromReminderKitFrequency:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Unknown REMFrequency: %li", v2, v3, v4, v5, v6);
}

+ (void)convertToReminderKitFrequency:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)convertFromReminderKitWeekday:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Unknown REMWeekday: %li", v2, v3, v4, v5, v6);
}

+ (void)convertToReminderKitWeekday:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end