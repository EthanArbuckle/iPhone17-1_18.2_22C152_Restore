@interface EKReminder(Shared)
- (NSDateComponents)dueDateComponents;
- (NSDateComponents)startDateComponents;
- (void)setDueDateComponents:()Shared;
- (void)setStartDateComponents:()Shared;
@end

@implementation EKReminder(Shared)

- (NSDateComponents)startDateComponents
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__EKReminder_Shared__startDateComponents__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  v2 = [(EKObject *)self cachedValueForKey:@"startDateComponents" populateBlock:v4];

  return (NSDateComponents *)v2;
}

- (void)setStartDateComponents:()Shared
{
  id v4 = a3;
  if (!v4)
  {
    v19 = 0;
    id v20 = 0;
    goto LABEL_16;
  }
  v5 = v4;
  v6 = [v4 calendar];
  v7 = v6;
  v8 = (void *)MEMORY[0x1E4F1C318];
  if (v6)
  {
    v9 = [v6 calendarIdentifier];
    char v10 = [v9 isEqualToString:*v8];

    if ((v10 & 1) == 0)
    {
      v21 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v22 = *MEMORY[0x1E4F1C3C8];
      v23 = @"Calendar must be nil or Gregorian";
LABEL_20:
      id v24 = [v21 exceptionWithName:v22 reason:v23 userInfo:0];
      objc_exception_throw(v24);
    }
  }
  if ([v5 year] == 0x7FFFFFFFFFFFFFFFLL
    || [v5 month] == 0x7FFFFFFFFFFFFFFFLL
    || [v5 day] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    v23 = @"Invalid date components: must have at least a year, a month, and a day";
    goto LABEL_20;
  }
  -[EKReminder setAllDay:](self, "setAllDay:", [v5 hour] == 0x7FFFFFFFFFFFFFFFLL);
  id v25 = (id)[v5 copy];

  if ([v25 second] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)[v25 copy];

    objc_msgSend(v11, "setSecond:", (uint64_t)(double)objc_msgSend(v11, "second"));
    id v25 = v11;
  }
  v12 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*v8];
  v13 = [v25 calendar];

  if (!v13) {
    [v25 setCalendar:v12];
  }
  v14 = [v25 date];
  v15 = [v25 timeZone];
  [(EKReminder *)self setTimeZone:v15];

  v16 = [v25 timeZone];
  [(EKObject *)self setSingleChangedValue:v16 forKey:@"timeZone"];

  v17 = [(EKReminder *)self dueDateTimeZone];
  if (v17)
  {
    v18 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    v19 = [v12 componentsInTimeZone:v18 fromDate:v14];
  }
  else
  {
    v19 = [v12 components:1048830 fromDate:v14];
  }

  id v20 = v25;
LABEL_16:
  id v26 = v20;
  [(EKObject *)self setCachedValue:v20 forKey:@"startDateComponents"];
  [(EKObject *)self setSingleChangedValue:v19 forKey:@"startDateComponents"];
}

- (NSDateComponents)dueDateComponents
{
  return (NSDateComponents *)[(EKObject *)self singleChangedValueForKey:@"dueDateComponents"];
}

- (void)setDueDateComponents:()Shared
{
  id v4 = a3;
  if (!v4)
  {
    [(EKObject *)self setSingleChangedValue:0 forKey:@"dueDateComponents"];
    uint64_t v22 = 0;
    goto LABEL_29;
  }
  v5 = v4;
  v6 = [v4 calendar];
  v7 = v6;
  v8 = (void *)MEMORY[0x1E4F1C318];
  if (v6)
  {
    v9 = [v6 calendarIdentifier];
    char v10 = [v9 isEqualToString:*v8];

    if ((v10 & 1) == 0)
    {
      id v25 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v26 = *MEMORY[0x1E4F1C3C8];
      v27 = @"Calendar must be nil or Gregorian";
LABEL_33:
      id v28 = [v25 exceptionWithName:v26 reason:v27 userInfo:0];
      objc_exception_throw(v28);
    }
  }
  v11 = (void *)[v5 copy];

  uint64_t v12 = [v11 hour];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    [v11 setTimeZone:0];
  }
  if (!v7)
  {
    v13 = [v11 timeZone];
    if (!v13)
    {
      v14 = [(EKObject *)self eventStore];
      v13 = [v14 timeZone];
    }
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:*v8];
    [v7 setTimeZone:v13];
    [v11 setCalendar:v7];
  }
  if ([v11 year] == 0x7FFFFFFFFFFFFFFFLL
    || [v11 month] == 0x7FFFFFFFFFFFFFFFLL
    || [v11 day] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v25 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v26 = *MEMORY[0x1E4F1C3C8];
    v27 = @"Invalid date components: must have at least a year, a month, and a day";
    goto LABEL_33;
  }
  if ([v11 second] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = (void *)[v11 copy];

    objc_msgSend(v15, "setSecond:", (uint64_t)(double)objc_msgSend(v15, "second"));
    v11 = v15;
  }
  v16 = [(EKReminder(Shared) *)self startDateComponents];

  if (v12 == 0x7FFFFFFFFFFFFFFFLL || !v16)
  {
    v19 = v7;
    id v29 = v11;
  }
  else
  {
    v17 = [(EKReminder *)self timeZone];
    v18 = [v11 date];
    v19 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*v8];

    if (v17)
    {
      [v19 setTimeZone:v17];
      id v20 = [v19 components:1048830 fromDate:v18];
      id v29 = v20;
      v21 = v17;
    }
    else
    {
      id v20 = [v19 components:1048830 fromDate:v18];
      id v29 = v20;
      v21 = 0;
    }
    [v20 setTimeZone:v21];

    v23 = [(EKReminder(Shared) *)self dueDateComponents];

    if (!v23) {
      [(EKReminder *)self _adjustPersistedStartDateComponentsForNewTimeZone:v17];
    }
  }
  [(EKObject *)self setSingleChangedValue:v29 forKey:@"dueDateComponents"];
  uint64_t v22 = v29;
  if (v29)
  {
    id v24 = [(EKReminder(Shared) *)self startDateComponents];

    if (!v24) {
      [(EKReminder(Shared) *)self setStartDateComponents:v29];
    }
    uint64_t v22 = v29;
  }
LABEL_29:
}

@end