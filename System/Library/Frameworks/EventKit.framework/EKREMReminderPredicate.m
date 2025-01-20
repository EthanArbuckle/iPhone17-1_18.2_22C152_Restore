@interface EKREMReminderPredicate
- (BOOL)evaluateWithObject:(id)a3;
- (EKREMReminderPredicate)initWithCalendars:(id)a3;
- (id)fetchMatchingRemindersInStore:(id)a3 allLists:(id)a4 error:(id *)a5;
- (id)initForCalendarStoreWithCalendars:(id)a3;
- (id)predicateFormat;
- (id)remListIDsWithAllLists:(id)a3;
@end

@implementation EKREMReminderPredicate

- (EKREMReminderPredicate)initWithCalendars:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKREMReminderPredicate;
  v5 = [(EKREMReminderPredicate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    calendars = v5->_calendars;
    v5->_calendars = (NSArray *)v6;

    v5->noCalendarNoResult = 0;
  }

  return v5;
}

- (id)initForCalendarStoreWithCalendars:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKREMReminderPredicate;
  v5 = [(EKREMReminderPredicate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    calendars = v5->_calendars;
    v5->_calendars = (NSArray *)v6;

    v5->noCalendarNoResult = 1;
  }

  return v5;
}

- (id)remListIDsWithAllLists:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_calendars count] || self->noCalendarNoResult)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_calendars, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = self->_calendars;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "frozenObject", (void)v18);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v14 = [v11 frozenObject];
            v15 = [v14 remObjectID];
            [v5 addObject:v15];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    v16 = (void *)[v5 copy];
  }
  else
  {
    v16 = [v4 valueForKey:@"objectID"];
  }

  return v16;
}

- (id)fetchMatchingRemindersInStore:(id)a3 allLists:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(EKREMReminderPredicate *)self remListIDsWithAllLists:a4];
  v10 = [v8 fetchRemindersForEventKitBridgingWithListIDs:v9 error:a5];

  return v10;
}

- (BOOL)evaluateWithObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(NSArray *)self->_calendars count])
    {
      if (!self->_calendarIdentifierSet)
      {
        v5 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v6 = [(NSArray *)self->_calendars valueForKey:@"calendarIdentifier"];
        uint64_t v7 = [v5 setWithArray:v6];
        calendarIdentifierSet = self->_calendarIdentifierSet;
        self->_calendarIdentifierSet = v7;
      }
      uint64_t v9 = self->_calendarIdentifierSet;
      v10 = [v4 calendar];
      v11 = [v10 calendarIdentifier];
      char v12 = [(NSSet *)v9 containsObject:v11];
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)predicateFormat
{
  return @"ReminderPredicate";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarIdentifierSet, 0);

  objc_storeStrong((id *)&self->_calendars, 0);
}

@end