@interface CADStatsReminders
+ (id)eventName;
- (BOOL)wantsReminders;
- (id)desiredReminderRange;
- (id)reminderDictionaries;
- (void)prepareWithContext:(id)a3;
- (void)processReminders:(id)a3;
@end

@implementation CADStatsReminders

+ (id)eventName
{
  return @"cadstats.Reminder";
}

- (void)prepareWithContext:(id)a3
{
  v4 = (NSMutableArray *)objc_opt_new();
  reminderInfos = self->_reminderInfos;
  self->_reminderInfos = v4;

  id v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = (NSDate *)objc_opt_new();
  now = self->_now;
  self->_now = v6;

  id v8 = objc_alloc(MEMORY[0x1E4F576D0]);
  v9 = [v13 dateByAddingUnit:16 value:-1 toDate:self->_now options:1024];
  v10 = [v13 dateByAddingUnit:16 value:14 toDate:self->_now options:1024];
  v11 = (CalDateRange *)[v8 initWithStartDate:v9 endDate:v10];
  desiredReminderRange = self->_desiredReminderRange;
  self->_desiredReminderRange = v11;
}

- (BOOL)wantsReminders
{
  return 1;
}

- (id)desiredReminderRange
{
  return self->_desiredReminderRange;
}

- (void)processReminders:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (unsigned char *)objc_opt_new();
        v8[8] = CalEventIsAllDay();
        v8[9] = CalCalendarItemHasRecurrenceRules();

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)reminderDictionaries
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_reminderInfos, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_reminderInfos;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v19[0] = &unk_1F151D9C8;
        v18[0] = @"instance";
        v18[1] = @"isAllDay";
        long long v9 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v8 + 8)];
        v19[1] = v9;
        v18[2] = @"hasRecurrenceRules";
        long long v10 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(v8 + 9)];
        v19[2] = v10;
        long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
        [v3 addObject:v11];
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredReminderRange, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_reminderInfos, 0);
}

@end