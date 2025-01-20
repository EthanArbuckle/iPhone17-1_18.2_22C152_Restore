@interface EKREMCompletionStateReminderPredicate
- (BOOL)evaluateWithObject:(id)a3;
- (id)fetchMatchingRemindersInStore:(id)a3 allLists:(id)a4 error:(id *)a5;
- (id)initForCompletedRemindersWithCompletionDateStarting:(id)a3 ending:(id)a4 calendars:(id)a5;
- (id)initForIncompleteRemindersWithDueDateStarting:(id)a3 ending:(id)a4 calendars:(id)a5;
@end

@implementation EKREMCompletionStateReminderPredicate

- (id)initForIncompleteRemindersWithDueDateStarting:(id)a3 ending:(id)a4 calendars:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKREMCompletionStateReminderPredicate;
  v11 = [(EKREMReminderPredicate *)&v14 initWithCalendars:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_start, a3);
    objc_storeStrong((id *)&v12->_end, a4);
    v12->_completed = 0;
  }

  return v12;
}

- (id)initForCompletedRemindersWithCompletionDateStarting:(id)a3 ending:(id)a4 calendars:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKREMCompletionStateReminderPredicate;
  v11 = [(EKREMReminderPredicate *)&v14 initWithCalendars:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_start, a3);
    objc_storeStrong((id *)&v12->_end, a4);
    v12->_completed = 1;
  }

  return v12;
}

- (id)fetchMatchingRemindersInStore:(id)a3 allLists:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(EKREMReminderPredicate *)self remListIDsWithAllLists:a4];
  start = self->_start;
  end = self->_end;
  if (self->_completed) {
    [v8 fetchCompletedRemindersForEventKitBridgingWithCompletionDateFrom:start to:end withListIDs:v9 error:a5];
  }
  else {
  v12 = [v8 fetchIncompleteRemindersForEventKitBridgingWithDueDateFrom:start to:end withListIDs:v9 error:a5];
  }

  return v12;
}

- (BOOL)evaluateWithObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKREMCompletionStateReminderPredicate;
  if ([(EKREMReminderPredicate *)&v13 evaluateWithObject:v4])
  {
    id v5 = v4;
    if (self->_completed == [v5 isCompleted])
    {
      if (self->_start || self->_end)
      {
        if (self->_completed)
        {
          v6 = [v5 completionDate];
        }
        else
        {
          uint64_t v8 = [v5 dueDateComponents];
          if (!v8)
          {
            v6 = 0;
            goto LABEL_26;
          }
          id v9 = (void *)v8;
          id v10 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
          [v9 setCalendar:v10];

          v6 = [v9 date];
        }
        start = self->_start;
        if (self->_completed)
        {
          if (!start)
          {
LABEL_18:
            if (self->_end && (objc_msgSend(v6, "CalIsAfterOrSameAsDate:") & 1) != 0) {
              goto LABEL_26;
            }
LABEL_23:
            BOOL v7 = 1;
LABEL_27:

            goto LABEL_28;
          }
          if (objc_msgSend(v6, "CalIsBeforeDate:")) {
            goto LABEL_26;
          }
          goto LABEL_17;
        }
        if (!start) {
          goto LABEL_21;
        }
        if ((objc_msgSend(v6, "CalIsBeforeOrSameAsDate:") & 1) == 0)
        {
LABEL_17:
          if (self->_completed) {
            goto LABEL_18;
          }
LABEL_21:
          if (self->_end && objc_msgSend(v6, "CalIsAfterDate:")) {
            goto LABEL_26;
          }
          goto LABEL_23;
        }
LABEL_26:
        BOOL v7 = 0;
        goto LABEL_27;
      }
      BOOL v7 = 1;
    }
    else
    {
      BOOL v7 = 0;
    }
LABEL_28:

    goto LABEL_29;
  }
  BOOL v7 = 0;
LABEL_29:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

@end