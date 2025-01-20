@interface EKReminder
+ (Class)frozenClass;
+ (EKReminder)reminderWithEventStore:(EKEventStore *)eventStore;
+ (id)generateUniqueIDWithReminder:(id)a3 calendar:(id)a4;
+ (id)knownSingleValueKeysForComparison;
+ (void)_removeSnoozedAlarmsFromReminder:(id)a3 usingDueDate:(id)a4;
- (BOOL)_reset;
- (BOOL)dueDateAllDay;
- (BOOL)isCompleted;
- (BOOL)refresh;
- (BOOL)save:(id *)a3;
- (BOOL)validate:(id *)a3;
- (EKObjectID)parentID;
- (EKReminder)init;
- (EKReminder)initWithPersistentObject:(id)a3;
- (NSDate)completionDate;
- (NSDateComponents)dueDateComponents;
- (NSDateComponents)startDateComponents;
- (NSTimeZone)dueDateTimeZone;
- (id)_generateNewUniqueID;
- (id)bestDisplayAlarm;
- (id)committedConstraints;
- (id)constraints;
- (id)description;
- (id)dueDate;
- (id)externalURI;
- (id)firstAlertDate;
- (id)startDateComponentsRaw;
- (id)timeZone;
- (id)title;
- (unint64_t)displayOrder;
- (unint64_t)entityType;
- (void)_adjustAfterMovingOrCopyingFromOldCalendar:(id)a3 toNewCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5 savingItem:(id)a6;
- (void)_adjustPersistedStartDateComponentsForNewTimeZone:(id)a3;
- (void)clearParentID;
- (void)forceUpdateFrozenCalendar:(id)a3;
- (void)reset;
- (void)rollback;
- (void)setAllDay:(BOOL)a3;
- (void)setCompleted:(BOOL)completed;
- (void)setCompletionDate:(NSDate *)completionDate;
- (void)setDisplayOrder:(unint64_t)a3;
- (void)setDueDate:(id)a3;
- (void)setDueDateComponents:(NSDateComponents *)dueDateComponents;
- (void)setFirstAlertDate:(id)a3;
- (void)setParentID:(id)a3;
- (void)setStartDateComponents:(NSDateComponents *)startDateComponents;
- (void)setTimeZone:(id)a3;
- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4 pinsTriggerToStartDate:(BOOL)a5;
@end

@implementation EKReminder

- (void)forceUpdateFrozenCalendar:(id)a3
{
  id v5 = a3;
  v4 = [(EKObject *)self changeSet];
  if ([v4 hasUnsavedChangeForKey:@"calendar"]) {
    [v4 forceChangeValue:v5 forKey:@"calendar"];
  }
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownSingleValueKeysForComparison
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__EKReminder_knownSingleValueKeysForComparison__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownSingleValueKeysForComparison_onceToken_3 != -1) {
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_3, block);
  }
  v2 = (void *)knownSingleValueKeysForComparison_keys_3;

  return v2;
}

void __47__EKReminder_knownSingleValueKeysForComparison__block_invoke(uint64_t a1)
{
  v2 = (void *)knownSingleValueKeysForComparison_keys_3;
  knownSingleValueKeysForComparison_keys_3 = (uint64_t)&unk_1EF953180;

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___EKReminder;
  v3 = objc_msgSendSuper2(&v6, sel_knownSingleValueKeysForComparison);
  uint64_t v4 = [v3 arrayByAddingObjectsFromArray:knownSingleValueKeysForComparison_keys_3];
  id v5 = (void *)knownSingleValueKeysForComparison_keys_3;
  knownSingleValueKeysForComparison_keys_3 = v4;
}

+ (EKReminder)reminderWithEventStore:(EKEventStore *)eventStore
{
  v3 = eventStore;
  if (!v3)
  {
    uint64_t v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      +[EKReminder reminderWithEventStore:](v4);
    }
  }
  id v5 = [(EKEventStore *)v3 reminderStore];
  objc_super v6 = [v5 createNewReminder];

  return (EKReminder *)v6;
}

- (EKReminder)initWithPersistentObject:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKReminder;
  id v5 = [(EKObject *)&v9 initWithPersistentObject:v4];
  if (v5 && [v4 isNew])
  {
    objc_super v6 = [v4 eventStore];
    v7 = [v6 timeZone];
    [(EKReminder *)v5 setTimeZone:v7];
  }
  return v5;
}

- (unint64_t)entityType
{
  return 1;
}

- (EKReminder)init
{
  if ([MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E60901FFFFFFFFLL]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"You must use [EKReminder reminderWithEventStore:] to create a reminder"];
  }

  return 0;
}

- (id)title
{
  v4.receiver = self;
  v4.super_class = (Class)EKReminder;
  v2 = [(EKCalendarItem *)&v4 title];
  if (!v2) {
    v2 = &stru_1EF932508;
  }

  return v2;
}

- (id)externalURI
{
  v2 = [(EKReminder *)self reminderIdentifier];
  if (v2)
  {
    if (externalURI_onceToken != -1) {
      dispatch_once(&externalURI_onceToken, &__block_literal_global_45);
    }
    v3 = [v2 stringByAddingPercentEncodingWithAllowedCharacters:externalURI_allowedCharacters];
    objc_super v4 = [NSString stringWithFormat:@"%@://%@/%@", @"x-apple-reminderkit", @"REMCDReminder", v3];
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __25__EKReminder_externalURI__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@"/?&:$+,;=@"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)externalURI_allowedCharacters;
  externalURI_allowedCharacters = v1;
}

- (NSDate)completionDate
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:@"completionDate"];
}

- (void)setCompletionDate:(NSDate *)completionDate
{
  objc_super v4 = completionDate;
  if (v4)
  {
    id v5 = v4;
    objc_super v6 = (void *)MEMORY[0x1E4F1C9C8];
    [(NSDate *)v4 timeIntervalSinceReferenceDate];
    id v8 = [v6 dateWithTimeIntervalSinceReferenceDate:floor(v7)];
  }
  else
  {
    id v8 = 0;
  }
  [(EKObject *)self setSingleChangedValue:v8 forKey:@"completionDate"];
}

- (id)firstAlertDate
{
  return [(EKObject *)self singleChangedValueForKey:@"firstAlertDate"];
}

- (void)setFirstAlertDate:(id)a3
{
}

- (unint64_t)displayOrder
{
  v2 = [(EKObject *)self singleChangedValueForKey:@"displayOrder"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setDisplayOrder:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:@"displayOrder"];
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(EKReminder *)self title];
  objc_super v6 = [(EKReminder *)self dueDate];
  double v7 = [(EKReminder *)self completionDate];
  unint64_t v8 = [(EKCalendarItem *)self priority];
  objc_super v9 = [(EKCalendarItem *)self calendarItemIdentifier];
  v10 = [(EKCalendarItem *)self alarms];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {title = %@; dueDate = %@; completionDate = %@; priority = %ld; calendarItemIdentifier = %@; alarms = %@}",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
  v11 = v10);

  return v11;
}

- (void)setCompleted:(BOOL)completed
{
  if (completed)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [(EKReminder *)self setCompletionDate:v4];
  }
  else
  {
    [(EKReminder *)self setCompletionDate:0];
  }
}

- (BOOL)isCompleted
{
  v2 = [(EKReminder *)self completionDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)clearParentID
{
}

- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4 pinsTriggerToStartDate:(BOOL)a5
{
  id v24 = a3;
  double v7 = [MEMORY[0x1E4F1C9C8] date];
  [v24 setAcknowledgedDate:v7];
  unint64_t v8 = [(EKCalendarItem *)self calendar];
  objc_super v9 = [v8 constraints];
  unsigned int v10 = [v9 maxAlarmsAllowed];

  if (v10 > 1)
  {
    id v11 = [v24 duplicate];
  }
  else
  {
    id v11 = v24;
  }
  v12 = v11;
  v13 = [v7 dateByAddingTimeInterval:a4];
  v14 = [(EKReminder *)self dueDate];

  if (v14)
  {
    v15 = [(EKReminder *)self dueDate];
    [v13 timeIntervalSinceDate:v15];
    double v17 = v16;

    if (v17 > 0.0 && v17 < a4)
    {
      uint64_t v19 = [(EKReminder *)self dueDate];

      double v17 = 0.0;
      v13 = (void *)v19;
    }
    v20 = [v12 absoluteDate];

    if (v20)
    {
      [v12 setAbsoluteDate:v13];
    }
    else
    {
      v22 = [v12 structuredLocation];

      if (!v22) {
        [v12 setRelativeOffset:v17];
      }
    }
  }
  else
  {
    v21 = [v7 dateByAddingTimeInterval:a4];
    [v12 setAbsoluteDate:v21];
  }
  if (v10 >= 2)
  {
    v23 = [(EKCalendarItem *)self findOriginalAlarmStartingWith:v24];
    [v12 setOriginalAlarm:v23];
    [(EKCalendarItem *)self addAlarm:v12];
  }
}

- (id)committedConstraints
{
  v2 = [(EKObject *)self committedValueForKey:*MEMORY[0x1E4F56BB0]];
  BOOL v3 = [v2 constraints];

  return v3;
}

- (BOOL)validate:(id *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)EKReminder;
  BOOL v5 = -[EKCalendarItem validate:](&v18, sel_validate_);
  if (v5)
  {
    objc_super v6 = [(EKCalendarItem *)self calendar];
    char v7 = [v6 allowReminders];

    if (v7)
    {
      if ([(EKCalendarItem *)self hasRecurrenceRules]
        && ([(EKReminder(Shared) *)self dueDateComponents],
            unint64_t v8 = objc_claimAutoreleasedReturnValue(),
            v8,
            !v8))
      {
        if (a3)
        {
          uint64_t v12 = 18;
          goto LABEL_11;
        }
      }
      else
      {
        objc_super v9 = [(EKReminder *)self constraints];
        char v10 = [v9 supportsReminderLocations];

        if ((v10 & 1) != 0
          || ([(EKCalendarItem *)self structuredLocation],
              id v11 = objc_claimAutoreleasedReturnValue(),
              v11,
              !v11))
        {
          v14 = [(EKReminder *)self constraints];
          char v15 = [v14 supportsReminderActions];

          if ((v15 & 1) != 0
            || ([(EKCalendarItem *)self action],
                double v16 = objc_claimAutoreleasedReturnValue(),
                v16,
                !v16))
          {
            if ([(EKCalendarItem *)self priority] < 0xA)
            {
              LOBYTE(v5) = 1;
              return v5;
            }
            if (a3)
            {
              uint64_t v12 = 26;
              goto LABEL_11;
            }
          }
          else if (a3)
          {
            uint64_t v12 = 42;
            goto LABEL_11;
          }
        }
        else if (a3)
        {
          uint64_t v12 = 20;
LABEL_11:
          id v13 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:v12];
          LOBYTE(v5) = 0;
          *a3 = v13;
          return v5;
        }
      }
    }
    else if (a3)
    {
      uint64_t v12 = 23;
      goto LABEL_11;
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)save:(id *)a3
{
  if (![(EKObject *)self isNew])
  {
    uint64_t v4 = *MEMORY[0x1E4F56BB0];
    if ([(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56BB0]])
    {
      BOOL v5 = [(EKObject *)self committedValueForKey:v4];
      objc_super v6 = [(EKCalendarItem *)self calendar];
      [(EKReminder *)self _adjustAfterMovingOrCopyingFromOldCalendar:v5 toNewCalendar:v6 cachedConstraintsForOldCalendar:0 savingItem:self];
    }
  }
  [(EKCalendarItem *)self pinRecurrenceRuleToEndsOfFreqency];
  return 1;
}

- (void)_adjustAfterMovingOrCopyingFromOldCalendar:(id)a3 toNewCalendar:(id)a4 cachedConstraintsForOldCalendar:(id)a5 savingItem:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v12;
  char v15 = v14;
  if (!v14)
  {
    char v15 = [v10 constraints];
  }
  if ([v15 supportsAlarmProximity])
  {
    double v16 = [v11 constraints];
    char v17 = [v16 supportsAlarmProximity];

    if ((v17 & 1) == 0)
    {
      objc_super v18 = [(EKCalendarItem *)self alarms];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v25 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if ([v23 proximity]) {
              [v23 setProximity:0];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v20);
      }
    }
  }
}

- (id)_generateNewUniqueID
{
  BOOL v3 = objc_opt_class();
  uint64_t v4 = [(EKCalendarItem *)self calendar];
  BOOL v5 = [v3 generateUniqueIDWithReminder:self calendar:v4];

  return v5;
}

- (BOOL)_reset
{
  v7.receiver = self;
  v7.super_class = (Class)EKReminder;
  BOOL v3 = [(EKObject *)&v7 _reset];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __20__EKReminder__reset__block_invoke;
    v6[3] = &unk_1E5B98120;
    v6[4] = self;
    LOBYTE(v3) = [(EKObject *)self _resetIfBackingObjectIsOfClass:v4 fetchResetFrozenObjectBlock:v6];
  }
  return v3;
}

id __20__EKReminder__reset__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) eventStore];
  BOOL v3 = [v2 reminderStore];
  uint64_t v4 = [*(id *)(a1 + 32) calendarItemIdentifier];
  BOOL v5 = [v3 backingReminderWithIdentifier:v4];

  return v5;
}

+ (void)_removeSnoozedAlarmsFromReminder:(id)a3 usingDueDate:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [v5 constraints];
  if ((int)[v7 maxAlarmsAllowed] >= 2)
  {

    if (v6) {
      goto LABEL_4;
    }
LABEL_25:
    long long v27 = [v5 dueDateComponents];
    v28 = [v5 eventStore];
    uint64_t v29 = [v28 timeZone];
    EKDateComponentsGetDate();
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
  unint64_t v8 = [v5 allAlarms];
  unint64_t v9 = [v8 count];

  if (v9 < 2) {
    goto LABEL_23;
  }
  if (!v6) {
    goto LABEL_25;
  }
LABEL_4:
  id v10 = (void *)MEMORY[0x1E4F1CA48];
  id v11 = [v5 allAlarms];
  id v12 = objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = [v5 allAlarms];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_super v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v19 = [v18 originalAlarm];

        if (!v19)
        {
          if (![v18 isAbsolute]) {
            continue;
          }
          uint64_t v20 = [v18 absoluteDate];
          uint64_t v21 = [v20 compare:v6];

          if (v21 != 1) {
            continue;
          }
        }
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v15);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v22 = v12;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(v5, "removeAlarm:", *(void *)(*((void *)&v30 + 1) + 8 * j), (void)v30);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v24);
  }

LABEL_23:
}

- (id)bestDisplayAlarm
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [(EKCalendarItem *)self alarms];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  if ([(EKCalendarItem *)self hasAlarms])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v6 = [(EKCalendarItem *)self allAlarms];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v40;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v39 + 1) + 8 * v11);
        id v13 = [v12 structuredLocation];

        if (v13)
        {
          id v33 = v12;
LABEL_55:
          id v15 = v33;

          goto LABEL_56;
        }
        uint64_t v14 = [v12 originalAlarm];

        if (v14)
        {
          char v9 = 1;
        }
        else
        {
          [v5 addObject:v12];
          if ((v9 & 1) == 0) {
            goto LABEL_12;
          }
        }
        if ((unint64_t)[v5 count] >= 2)
        {
          id v33 = [v5 objectAtIndex:0];
          goto LABEL_55;
        }
LABEL_12:
        if (v8 == ++v11)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
          if (v8) {
            goto LABEL_4;
          }

          if ((v9 & 1) != 0 && [v5 count])
          {
            id v15 = [v5 objectAtIndex:0];
            goto LABEL_56;
          }
          goto LABEL_18;
        }
      }
    }
  }
LABEL_18:
  if ([v5 count])
  {
    uint64_t v16 = [(EKReminder(Shared) *)self dueDateComponents];
    char v17 = [(EKObject *)self eventStore];
    objc_super v18 = [v17 timeZone];
    uint64_t v19 = EKDateComponentsGetDate();

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v20 = v5;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v15 = 0;
      uint64_t v23 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (v15)
          {
            if (objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "isAbsolute", (void)v35))
            {
              [v25 absoluteDate];
            }
            else
            {
              [v25 relativeOffset];
              objc_msgSend(v19, "dateByAddingTimeInterval:");
            long long v26 = };
            if ([v15 isAbsolute])
            {
              [v15 absoluteDate];
            }
            else
            {
              [v15 relativeOffset];
              objc_msgSend(v19, "dateByAddingTimeInterval:");
            long long v27 = };
            if ([v26 isEqualToDate:v19])
            {
              id v32 = v25;

              id v15 = v32;
              goto LABEL_56;
            }
            if ([v19 compare:v27] == -1 && objc_msgSend(v19, "compare:", v26) != -1) {
              goto LABEL_44;
            }
            if ([v19 compare:v27] == -1 || objc_msgSend(v19, "compare:", v26) != -1)
            {
              [v19 timeIntervalSinceDate:v26];
              if (v28 >= 0.0) {
                double v29 = v28;
              }
              else {
                double v29 = -v28;
              }
              [v19 timeIntervalSinceDate:v27];
              if (v30 < 0.0) {
                double v30 = -v30;
              }
              if (v29 < v30)
              {
LABEL_44:
                id v31 = v25;

                id v15 = v31;
              }
            }
          }
          else
          {
            id v15 = v25;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }
LABEL_56:

  return v15;
}

- (id)constraints
{
  BOOL v3 = [(EKObject *)self eventStore];
  uint64_t v4 = [v3 cachedConstraintsForReminder:self];

  return v4;
}

+ (id)generateUniqueIDWithReminder:(id)a3 calendar:(id)a4
{
  uint64_t v4 = objc_msgSend(a4, "constraints", a3);
  int v5 = [v4 requiresMSFormattedUID];

  if (v5) {
    _EKMSUUIDString();
  }
  else {
  id v6 = EKUUIDString();
  }

  return v6;
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (void)setStartDateComponents:(NSDateComponents *)startDateComponents
{
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (void)setDueDateComponents:(NSDateComponents *)dueDateComponents
{
}

- (EKObjectID)parentID
{
  return self->_parentID;
}

- (void)setParentID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_dueDateComponents, 0);

  objc_storeStrong((id *)&self->_startDateComponents, 0);
}

id __41__EKReminder_Shared__startDateComponents__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) singleChangedValueForKey:@"startDateComponents"];
  BOOL v3 = (void *)[v2 copy];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) dueDateTimeZone];
    if (v4)
    {
      int v5 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
      [v3 setTimeZone:v5];

      id v6 = [v3 date];
      uint64_t v7 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      id v8 = [v7 componentsInTimeZone:v4 fromDate:v6];
      [v8 setTimeZone:v4];
    }
    else
    {
      [v3 setTimeZone:0];
      id v8 = v3;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)startDateComponentsRaw
{
  return [(EKObject *)self singleChangedValueForKey:@"startDateComponents"];
}

- (NSTimeZone)dueDateTimeZone
{
  v2 = [(EKReminder(Shared) *)self dueDateComponents];
  BOOL v3 = [v2 timeZone];

  return (NSTimeZone *)v3;
}

- (BOOL)dueDateAllDay
{
  v2 = [(EKReminder(Shared) *)self dueDateComponents];
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = [v2 hour] == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)dueDate
{
  BOOL v3 = [(EKReminder *)self dueDateTimeZone];

  BOOL v4 = [(EKReminder(Shared) *)self dueDateComponents];
  int v5 = v4;
  if (v3)
  {
    id v6 = [v4 date];
  }
  else
  {
    uint64_t v7 = [(EKObject *)self eventStore];
    id v8 = [v7 timeZone];
    id v6 = EKDateComponentsGetDate();
  }

  return v6;
}

- (void)setDueDate:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v10 = (id)[v6 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v7 = [(EKObject *)self eventStore];
  id v8 = [v7 timeZone];
  [v10 setTimeZone:v8];

  char v9 = [v10 components:2097278 fromDate:v5];

  [v9 setCalendar:v10];
  [(EKReminder(Shared) *)self setDueDateComponents:v9];
}

- (void)setTimeZone:(id)a3
{
  id v16 = a3;
  uint64_t v4 = [(EKReminder *)self timeZone];
  if ([(EKReminder *)self isAllDay])
  {

    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = (unint64_t)v16;
  }
  id v17 = (id)v5;
  if (v4 | v5 && ([(id)v4 isEqual:v5] & 1) == 0)
  {
    id v6 = [(EKReminder(Shared) *)self startDateComponents];
    uint64_t v7 = [(EKReminder(Shared) *)self dueDateComponents];
    id v8 = v7;
    if (v7)
    {
      char v9 = [v7 date];
      uint64_t v10 = [v8 hour];
      uint64_t v11 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v12 = 1048606;
      }
      else {
        uint64_t v12 = 1048830;
      }
      if (v17)
      {
        [v11 setTimeZone:v17];
        id v13 = [v11 components:v12 fromDate:v9];
        uint64_t v14 = v13;
        id v15 = v17;
      }
      else
      {
        id v13 = [v11 components:v12 fromDate:v9];
        uint64_t v14 = v13;
        id v15 = 0;
      }
      [v13 setTimeZone:v15];
      [(EKObject *)self setSingleChangedValue:v14 forKey:@"dueDateComponents"];
    }
    if (v6)
    {
      [v6 setTimeZone:v17];
      [(EKObject *)self setSingleChangedValue:v17 forKey:@"timeZone"];
      [(EKReminder(Shared) *)self setStartDateComponents:v6];
    }
  }
}

- (id)timeZone
{
  BOOL v3 = [(EKReminder(Shared) *)self dueDateComponents];
  uint64_t v4 = v3;
  if (v3) {
    [v3 timeZone];
  }
  else {
  unint64_t v5 = [(EKObject *)self singleChangedValueForKey:@"timeZone"];
  }

  return v5;
}

- (void)setAllDay:(BOOL)a3
{
  BOOL v3 = a3;
  id v11 = [(EKReminder(Shared) *)self dueDateComponents];
  BOOL v5 = [v11 hour] == 0x7FFFFFFFFFFFFFFFLL;
  id v6 = v11;
  int v7 = !v5;
  if (v11 && ((v7 ^ v3) & 1) == 0)
  {
    id v8 = [v11 date];
    char v9 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    uint64_t v10 = [v9 components:1048606 fromDate:v8];
    [v10 setTimeZone:0];
    [(EKReminder(Shared) *)self setDueDateComponents:v10];

    id v6 = v11;
  }
}

- (void)_adjustPersistedStartDateComponentsForNewTimeZone:(id)a3
{
  BOOL v5 = [(EKReminder *)self startDateComponentsRaw];
  if (v5)
  {
    id v13 = v5;
    id v6 = [(EKReminder *)self dueDateTimeZone];
    if ((a3 == 0) == (v6 != 0))
    {
      if ([v13 hour] == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v7 = 1048606;
      }
      else {
        uint64_t v7 = 1048830;
      }
      id v8 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      if (a3)
      {
        char v9 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
        [v13 setTimeZone:v9];

        uint64_t v10 = [v13 date];
        id v11 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
        [v8 setTimeZone:v11];

        uint64_t v12 = [v8 components:v7 fromDate:v10];
      }
      else
      {
        uint64_t v10 = [v13 date];
        uint64_t v12 = [v8 components:v7 fromDate:v10];
        [v12 setTimeZone:0];
      }

      [(EKObject *)self setSingleChangedValue:v12 forKey:@"startDateComponents"];
      [(EKObject *)self clearCachedValueForKey:@"startDateComponents"];
    }
    BOOL v5 = v13;
  }
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)EKReminder;
  [(EKObject *)&v3 reset];
  [(EKObject *)self clearCachedValueForKey:@"startDateComponents"];
}

- (void)rollback
{
  v3.receiver = self;
  v3.super_class = (Class)EKReminder;
  [(EKObject *)&v3 rollback];
  [(EKObject *)self clearCachedValueForKey:@"startDateComponents"];
}

- (BOOL)refresh
{
  v5.receiver = self;
  v5.super_class = (Class)EKReminder;
  BOOL v3 = [(EKObject *)&v5 refresh];
  if (v3) {
    [(EKObject *)self clearCachedValueForKey:@"startDateComponents"];
  }
  return v3;
}

+ (void)reminderWithEventStore:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "API MISUSE: nil event store used in initialization of EKReminder instance", v1, 2u);
}

@end