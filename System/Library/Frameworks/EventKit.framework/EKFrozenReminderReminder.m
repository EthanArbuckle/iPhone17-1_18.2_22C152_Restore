@interface EKFrozenReminderReminder
+ (Class)meltedClass;
- (BOOL)_applyChanges:(id)a3 error:(id *)a4;
- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)defaultAlarmRemoved;
- (BOOL)defaultAlarmWasDeleted;
- (BOOL)hasAttendees;
- (BOOL)hasNotes;
- (BOOL)hasRecurrenceRules;
- (id)URLString;
- (id)_copyToNewList:(id)a3 error:(id *)a4;
- (id)_reminder;
- (id)actionString;
- (id)alarms;
- (id)appLinkData;
- (id)attachmentsSet;
- (id)attendeesRaw;
- (id)calendar;
- (id)calendarItemExternalIdentifier;
- (id)calendarItemIdentifier;
- (id)clientLocation;
- (id)completionDate;
- (id)creationDate;
- (id)detachedItems;
- (id)dueDateComponents;
- (id)ekExceptionDates;
- (id)initNewReminderInStore:(id)a3;
- (id)lastModifiedDate;
- (id)notes;
- (id)organizer;
- (id)originalItem;
- (id)recurrenceRulesSet;
- (id)remObjectID;
- selfAttendee;
- (id)startDateComponents;
- (id)structuredLocation;
- (id)syncError;
- (id)timeZone;
- (id)travelStartLocation;
- (id)unlocalizedTitle;
- (unint64_t)priority;
- (void)_fixAlarmUUIDsForClone:(id)a3 from:(id)a4;
@end

@implementation EKFrozenReminderReminder

- (id)initNewReminderInStore:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(EKChangeSet);
  [(EKChangeSet *)v5 setSkipsPersistentObjectCopy:1];
  v6 = (void *)[getREMReminderClass() newObjectID];
  v7 = [v6 uuid];
  v8 = [v7 UUIDString];
  [(EKChangeSet *)v5 changeSingleValue:v8 forKey:@"UUID" basedOn:0];

  v11.receiver = self;
  v11.super_class = (Class)EKFrozenReminderReminder;
  v9 = [(EKFrozenReminderObject *)&v11 initWithREMObject:0 inStore:v4 withChanges:v5];

  return v9;
}

- (id)_reminder
{
  return self->super._remObject;
}

- (id)remObjectID
{
  v3 = [(EKFrozenReminderReminder *)self _reminder];

  if (v3)
  {
    id v4 = [(EKFrozenReminderReminder *)self _reminder];
    v5 = [v4 objectID];
  }
  else
  {
    id v4 = [(EKFrozenReminderReminder *)self calendarItemIdentifier];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
    v5 = [getREMReminderClass() objectIDWithUUID:v6];
  }

  return v5;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_applyChanges:(id)a3 error:(id *)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"unlocalizedTitle"])
  {
    v7 = [(EKChangeSet *)self->super._changeSet valueForSingleValueKey:@"unlocalizedTitle" basedOn:0];
    [v6 setTitleAsString:v7];
  }
  if (![(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"calendar"]) {
    goto LABEL_13;
  }
  v8 = [(EKFrozenReminderReminder *)self _reminder];
  v9 = [v8 list];

  v10 = [(EKChangeSet *)self->super._changeSet valueForSingleValueKey:@"calendar" basedOn:0];
  if (!v9) {
    goto LABEL_10;
  }
  objc_super v11 = [v9 account];
  if ([v11 type] != 3 && objc_msgSend(v11, "type") != 4)
  {
    v13 = [v10 _account];
    int v14 = [v11 isEqual:v13];

    if (!v14) {
      goto LABEL_8;
    }
LABEL_10:
    [v6 removeFromList];
    v15 = [v6 saveRequest];
    WeakRetained = [v10 updateListWithSaveRequest:v15 error:a4];

    if (!WeakRetained)
    {

      BOOL v64 = 0;
      goto LABEL_78;
    }
    [WeakRetained addReminderChangeItem:v6];
    goto LABEL_12;
  }

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)&self->super._reminderStore);
  [WeakRetained _reminderCopiedToNewList:self];
LABEL_12:

LABEL_13:
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"creationDate"])
  {
    v16 = [(EKChangeSet *)self->super._changeSet valueForSingleValueKey:@"creationDate" basedOn:0];
    [v6 setCreationDate:v16];
  }
  [(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"structuredLocationWithoutPrediction"];
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"notes"])
  {
    v17 = [(EKChangeSet *)self->super._changeSet valueForSingleValueKey:@"notes" basedOn:0];
    [v6 setNotesAsString:v17];
  }
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"URLString"])
  {
    v18 = [(EKChangeSet *)self->super._changeSet valueForSingleValueKey:@"URLString" basedOn:0];
    if (v18)
    {
      v19 = [MEMORY[0x1E4F1CB10] URLWithString:v18];
    }
    else
    {
      v19 = 0;
    }
    [v6 setIcsUrl:v19];
  }
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"startDateComponents"])
  {
    v20 = [(EKFrozenReminderReminder *)self startDateComponents];
    [v6 setStartDateComponents:v20];
  }
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"dueDateComponents"])
  {
    v21 = [(EKFrozenReminderReminder *)self dueDateComponents];
    v22 = [v21 timeZone];

    if (!v22) {
      [v21 setCalendar:0];
    }
    v23 = [(EKFrozenReminderReminder *)self dueDateComponents];
    [v6 setDueDateComponents:v23];
  }
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"completionDate"])
  {
    v24 = [(EKFrozenReminderReminder *)self completionDate];
    [v6 setCompleted:v24 != 0];
    [v6 setCompletionDate:v24];
  }
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"priority"]) {
    objc_msgSend(v6, "setPriority:", -[EKFrozenReminderReminder priority](self, "priority"));
  }
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"uniqueID"])
  {
    v25 = [(EKFrozenReminderReminder *)self calendarItemExternalIdentifier];
    [v6 setDaCalendarItemUniqueIdentifier:v25];
  }
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedMultiValueRemovalForKey:@"allAlarmsSet"])
  {
    obuint64_t j = a4;
    v26 = [(EKChangeSet *)self->super._changeSet multiValueRemovals];
    v27 = [v26 objectForKeyedSubscript:@"allAlarmsSet"];

    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v82 objects:v90 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v83 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          v34 = [v33 alarms];
          uint64_t v35 = [v34 countByEnumeratingWithState:&v78 objects:v89 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v79;
            do
            {
              for (uint64_t j = 0; j != v36; ++j)
              {
                if (*(void *)v79 != v37) {
                  objc_enumerationMutation(v34);
                }
                [v6 removeAlarm:*(void *)(*((void *)&v78 + 1) + 8 * j)];
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v78 objects:v89 count:16];
            }
            while (v36);
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v82 objects:v90 count:16];
      }
      while (v30);
    }

    a4 = obj;
  }
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedMultiValueAdditionForKey:@"allAlarmsSet"])
  {
    v39 = [(EKChangeSet *)self->super._changeSet multiValueAdditions];
    v40 = [v39 objectForKeyedSubscript:@"allAlarmsSet"];

    v66 = self;
    if ([v40 count])
    {
      v41 = [(EKFrozenReminderReminder *)self remObjectID];
      v88 = v41;
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
    }
    else
    {
      v42 = 0;
    }
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obja = v40;
    uint64_t v43 = [obja countByEnumeratingWithState:&v74 objects:v87 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v75;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v75 != v45) {
            objc_enumerationMutation(obja);
          }
          v47 = *(void **)(*((void *)&v74 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v48 = [MEMORY[0x1E4F28B00] currentHandler];
            v49 = (objc_class *)objc_opt_class();
            NSStringFromClass(v49);
            v51 = v50 = a4;
            [v48 handleFailureInMethod:a2, v66, @"EKFrozenReminderReminder.m", 198, @"frozen alarm is of the wrong class: %@", v51 object file lineNumber description];

            a4 = v50;
          }
          [v47 setPath:v42];
          [v47 _applyChanges:v6 error:a4];
        }
        uint64_t v44 = [obja countByEnumeratingWithState:&v74 objects:v87 count:16];
      }
      while (v44);
    }

    self = v66;
  }
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"recurrenceRulesSet"])
  {
    [v6 removeAllRecurrenceRules];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v52 = [(EKFrozenReminderReminder *)self recurrenceRulesSet];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v70 objects:v86 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v71;
      do
      {
        for (uint64_t m = 0; m != v54; ++m)
        {
          if (*(void *)v71 != v55) {
            objc_enumerationMutation(v52);
          }
          id v57 = (id)[*(id *)(*((void *)&v70 + 1) + 8 * m) addUpdatedRecurrenceRule:v6];
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v70 objects:v86 count:16];
      }
      while (v54);
    }
  }
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"appLinkData"])
  {
    v58 = [(EKFrozenReminderReminder *)self appLinkData];
    v59 = (void *)[objc_alloc((Class)getREMUserActivityClass()) initWithUserActivityData:v58];
    [v6 setUserActivity:v59];
  }
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"actionString"])
  {
    v60 = (void *)MEMORY[0x1E4F1CB10];
    v61 = [(EKFrozenReminderReminder *)self actionString];
    v62 = [v60 URLWithString:v61];

    v63 = (void *)[objc_alloc((Class)getREMUserActivityClass()) initWithUniversalLink:v62];
    [v6 setUserActivity:v63];
  }
  BOOL v64 = 1;
LABEL_78:

  return v64;
}

- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(EKFrozenReminderReminder *)self _reminder];
  if ([(EKFrozenReminderObject *)self isNew])
  {
    v8 = [(EKFrozenReminderReminder *)self calendar];
    uint64_t v9 = [v8 updateListWithSaveRequest:v6 error:a4];
    if (!v9)
    {
      BOOL v17 = 0;
      goto LABEL_9;
    }
    v10 = (void *)v9;
    uint64_t v11 = [(EKFrozenReminderReminder *)self unlocalizedTitle];
    v12 = (void *)v11;
    v13 = &stru_1EF932508;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    int v14 = v13;

    v15 = [(EKFrozenReminderReminder *)self remObjectID];
    uint64_t v16 = [v6 addReminderWithTitle:v14 toListChangeItem:v10 reminderObjectID:v15];

    v8 = (void *)v16;
  }
  else
  {
    v8 = [v6 updateReminder:v7];
  }
  BOOL v17 = [(EKFrozenReminderReminder *)self _applyChanges:v8 error:a4];
LABEL_9:

  return v17;
}

- (id)_copyToNewList:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(EKFrozenReminderReminder *)self _reminder];
  v8 = [v6 updateReminder:v7];

  uint64_t v9 = [(EKChangeSet *)self->super._changeSet valueForSingleValueKey:@"calendar" basedOn:0];
  v10 = [v9 updateListWithSaveRequest:v6 error:a4];
  if (v10)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    uint64_t v11 = (void *)getREMReminderChangeItemClass_softClass;
    uint64_t v22 = getREMReminderChangeItemClass_softClass;
    if (!getREMReminderChangeItemClass_softClass)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __getREMReminderChangeItemClass_block_invoke;
      v18[3] = &unk_1E5B969D8;
      v18[4] = &v19;
      __getREMReminderChangeItemClass_block_invoke((uint64_t)v18);
      uint64_t v11 = (void *)v20[3];
    }
    v12 = v11;
    _Block_object_dispose(&v19, 8);
    v13 = (void *)[[v12 alloc] initWithReminderChangeItem:v8 insertIntoListChangeItem:v10];
    [v6 _trackReminderChangeItem:v13];
    [(EKFrozenReminderReminder *)self _fixAlarmUUIDsForClone:v13 from:v8];
    [v8 removeFromList];
    int v14 = [v13 objectID];
    v15 = [v14 uuid];
    uint64_t v16 = [v15 UUIDString];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (void)_fixAlarmUUIDsForClone:(id)a3 from:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 alarms];
  v38 = v5;
  v7 = [v5 alarms];
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v54 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        int v14 = +[EKFrozenReminderAlarm semanticIdentifierFromREMAlarm:v13];
        v15 = [v8 objectForKeyedSubscript:v14];
        if (!v15)
        {
          v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          [v8 setObject:v15 forKeyedSubscript:v14];
        }
        uint64_t v16 = [v13 alarmUID];
        [v15 addObject:v16];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v10);
  }

  v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v39 = v7;
  uint64_t v17 = [v39 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v50 != v19) {
          objc_enumerationMutation(v39);
        }
        uint64_t v21 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        uint64_t v22 = +[EKFrozenReminderAlarm semanticIdentifierFromREMAlarm:v21];
        v23 = [v8 objectForKeyedSubscript:v22];
        v24 = [v21 alarmUID];
        v25 = [v23 firstObject];
        if (v25)
        {
          [v41 setObject:v25 forKeyedSubscript:v24];
          if ((unint64_t)[v23 count] >= 2) {
            [v23 removeObjectAtIndex:0];
          }
        }
        else
        {
          v26 = +[EKReminderStore log];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v59 = v22;
            _os_log_error_impl(&dword_1A4E47000, v26, OS_LOG_TYPE_ERROR, "Couldn't find old alarm matching semantic ID %@; if it existed it will be disconnected from any extant EKObject instances",
              buf,
              0xCu);
          }
        }
      }
      uint64_t v18 = [v39 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v18);
  }

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __56__EKFrozenReminderReminder__fixAlarmUUIDsForClone_from___block_invoke;
  v47[3] = &unk_1E5B96A48;
  id v42 = v41;
  id v48 = v42;
  v27 = (void (**)(void, void))MEMORY[0x1A6266730](v47);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v28 = v39;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v44;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v43 + 1) + 8 * k);
        v34 = [v33 alarmUID];
        uint64_t v35 = ((void (**)(void, void *))v27)[2](v27, v34);
        [v33 setAlarmUID:v35];

        uint64_t v36 = [v33 originalAlarmUID];
        uint64_t v37 = ((void (**)(void, void *))v27)[2](v27, v36);
        [v33 setOriginalAlarmUID:v37];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v43 objects:v57 count:16];
    }
    while (v30);
  }
}

id __56__EKFrozenReminderReminder__fixAlarmUUIDsForClone_from___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = v3;
  }
  id v7 = v6;

  return v7;
}

- (id)calendarItemIdentifier
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__EKFrozenReminderReminder_calendarItemIdentifier__block_invoke;
  v4[3] = &unk_1E5B96988;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"UUID" backingValue:v4];

  return v2;
}

id __50__EKFrozenReminderReminder_calendarItemIdentifier__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _reminder];
  v2 = [v1 objectID];
  id v3 = [v2 uuid];
  uint64_t v4 = [v3 UUIDString];

  return v4;
}

- (id)calendar
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__EKFrozenReminderReminder_calendar__block_invoke;
  v4[3] = &unk_1E5B969B0;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"calendar" backingValue:v4];

  return v2;
}

id __36__EKFrozenReminderReminder_calendar__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _reminder];
  id v3 = [v2 list];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  id v5 = [WeakRetained frozenObjectForReminderObject:v3];

  return v5;
}

- (id)calendarItemExternalIdentifier
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__EKFrozenReminderReminder_calendarItemExternalIdentifier__block_invoke;
  v4[3] = &unk_1E5B96988;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"uniqueID" backingValue:v4];

  return v2;
}

id __58__EKFrozenReminderReminder_calendarItemExternalIdentifier__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _reminder];
  v2 = [v1 daCalendarItemUniqueIdentifier];

  return v2;
}

- (id)unlocalizedTitle
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__EKFrozenReminderReminder_unlocalizedTitle__block_invoke;
  v4[3] = &unk_1E5B96988;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"unlocalizedTitle" backingValue:v4];

  return v2;
}

id __44__EKFrozenReminderReminder_unlocalizedTitle__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _reminder];
  v2 = [v1 titleAsString];

  return v2;
}

- (id)structuredLocation
{
  return [(EKFrozenReminderObject *)self valueForSingleValueKey:@"structuredLocationWithoutPrediction" backingValue:&__block_literal_global_1];
}

uint64_t __46__EKFrozenReminderReminder_structuredLocation__block_invoke()
{
  return 0;
}

- (id)notes
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__EKFrozenReminderReminder_notes__block_invoke;
  v4[3] = &unk_1E5B96988;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"notes" backingValue:v4];

  return v2;
}

id __33__EKFrozenReminderReminder_notes__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _reminder];
  v2 = [v1 notesAsString];

  return v2;
}

- (id)URLString
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__EKFrozenReminderReminder_URLString__block_invoke;
  v4[3] = &unk_1E5B96988;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"URLString" backingValue:v4];

  return v2;
}

id __37__EKFrozenReminderReminder_URLString__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _reminder];
  v2 = [v1 icsUrl];
  id v3 = [v2 absoluteString];

  return v3;
}

- (id)lastModifiedDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__EKFrozenReminderReminder_lastModifiedDate__block_invoke;
  v4[3] = &unk_1E5B96A90;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"lastModifiedDate" backingValue:v4];

  return v2;
}

id __44__EKFrozenReminderReminder_lastModifiedDate__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _reminder];
  v2 = [v1 lastModifiedDate];

  return v2;
}

- (id)creationDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__EKFrozenReminderReminder_creationDate__block_invoke;
  v4[3] = &unk_1E5B96A90;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"creationDate" backingValue:v4];

  return v2;
}

id __40__EKFrozenReminderReminder_creationDate__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _reminder];
  v2 = [v1 creationDate];

  return v2;
}

- (id)alarms
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = [(EKFrozenReminderReminder *)self _reminder];
  uint64_t v4 = [v3 alarms];

  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v55 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        uint64_t v11 = [v10 alarmUID];
        if (v11) {
          v12 = (__CFString *)v11;
        }
        else {
          v12 = &stru_1EF932508;
        }
        v13 = [v10 alarmUID];
        int v14 = [v5 objectForKeyedSubscript:v13];

        if (!v14)
        {
          int v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          [v5 setObject:v14 forKeyedSubscript:v12];
        }
        [v14 addObject:v10];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v7);
  }

  v15 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(obj, "count"));
  if ([obj count])
  {
    uint64_t v16 = [(EKFrozenReminderReminder *)self remObjectID];
    v60 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
  }
  else
  {
    uint64_t v17 = 0;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v18 = v5;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v45 = *(void *)v51;
    id v40 = v18;
    do
    {
      uint64_t v21 = 0;
      uint64_t v41 = v20;
      do
      {
        if (*(void *)v51 != v45) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = *(void **)(*((void *)&v50 + 1) + 8 * v21);
        v23 = objc_msgSend(v18, "objectForKeyedSubscript:", v22, v40);
        if ([v22 length])
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->super._reminderStore);
          v25 = v23;
          v26 = WeakRetained;
          v27 = v25;
          objc_msgSend(WeakRetained, "frozenAlarmForREMAlarms:");
          id v28 = (id)objc_claimAutoreleasedReturnValue();

          if (v17) {
            [v28 setPath:v17];
          }
          [v15 addObject:v28];
        }
        else
        {
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = v23;
          id v28 = v23;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v42 = v21;
            uint64_t v31 = *(void *)v47;
            do
            {
              for (uint64_t j = 0; j != v30; ++j)
              {
                if (*(void *)v47 != v31) {
                  objc_enumerationMutation(v28);
                }
                uint64_t v33 = *(void *)(*((void *)&v46 + 1) + 8 * j);
                id v34 = objc_loadWeakRetained((id *)&self->super._reminderStore);
                uint64_t v35 = [v34 frozenObjectForReminderObject:v33];

                if (v17) {
                  [v35 setPath:v17];
                }
                [v15 addObject:v35];
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
            }
            while (v30);
            id v18 = v40;
            uint64_t v20 = v41;
            uint64_t v21 = v42;
          }
          v27 = v44;
        }

        ++v21;
      }
      while (v21 != v20);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v20);
  }

  changeSet = self->super._changeSet;
  if (changeSet)
  {
    id v37 = [(EKChangeSet *)changeSet valuesForMultiValueKey:@"allAlarmsSet" basedOnSet:v15];
  }
  else
  {
    id v37 = v15;
  }
  v38 = v37;

  return v38;
}

- (id)startDateComponents
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__EKFrozenReminderReminder_startDateComponents__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"startDateComponents" backingValue:v4];

  return v2;
}

id __47__EKFrozenReminderReminder_startDateComponents__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _reminder];
  v2 = [v1 startDateComponents];
  id v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v2 setCalendar:v3];

  return v2;
}

- (id)dueDateComponents
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__EKFrozenReminderReminder_dueDateComponents__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"dueDateComponents" backingValue:v4];

  return v2;
}

id __45__EKFrozenReminderReminder_dueDateComponents__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _reminder];
  v2 = [v1 dueDateComponents];
  id v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v2 setCalendar:v3];

  return v2;
}

- (id)timeZone
{
  return 0;
}

- (id)completionDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__EKFrozenReminderReminder_completionDate__block_invoke;
  v4[3] = &unk_1E5B96A90;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"completionDate" backingValue:v4];

  return v2;
}

id __42__EKFrozenReminderReminder_completionDate__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _reminder];
  v2 = [v1 completionDate];

  return v2;
}

- (unint64_t)priority
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__EKFrozenReminderReminder_priority__block_invoke;
  v5[3] = &unk_1E5B96AB8;
  v5[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"priority" backingValue:v5];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

id __36__EKFrozenReminderReminder_priority__block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  v2 = [*(id *)(a1 + 32) _reminder];
  unint64_t v3 = objc_msgSend(v1, "numberWithUnsignedInteger:", objc_msgSend(v2, "priority"));

  return v3;
}

- (id)appLinkData
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__EKFrozenReminderReminder_appLinkData__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"appLinkData" backingValue:v4];

  return v2;
}

id __39__EKFrozenReminderReminder_appLinkData__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _reminder];
  v2 = [v1 userActivity];
  unint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 userActivityData];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)actionString
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__EKFrozenReminderReminder_actionString__block_invoke;
  v4[3] = &unk_1E5B96908;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"actionString" backingValue:v4];

  return v2;
}

id __40__EKFrozenReminderReminder_actionString__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _reminder];
  v2 = [v1 userActivity];
  unint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 universalLink];
    id v5 = [v4 absoluteString];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)hasRecurrenceRules
{
  v2 = [(EKFrozenReminderReminder *)self recurrenceRulesSet];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasAttendees
{
  return 0;
}

- (BOOL)hasNotes
{
  v2 = [(EKFrozenReminderReminder *)self notes];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)attendeesRaw
{
  return 0;
}

- (id)recurrenceRulesSet
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKFrozenReminderReminder *)self _reminder];
  uint64_t v4 = [v3 recurrenceRules];

  id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [EKFrozenReminderRecurrenceRule alloc];
        id WeakRetained = objc_loadWeakRetained((id *)&self->super._reminderStore);
        v13 = [(EKFrozenReminderRecurrenceRule *)v11 initWithREMObject:v10 inStore:WeakRetained];

        [v5 addObject:v13];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  changeSet = self->super._changeSet;
  if (changeSet)
  {
    id v15 = [(EKChangeSet *)changeSet valuesForMultiValueKey:@"recurrenceRulesSet" basedOnSet:v5];
  }
  else
  {
    id v15 = v5;
  }
  uint64_t v16 = v15;

  return v16;
}

- (id)clientLocation
{
  return 0;
}

- (id)organizer
{
  return 0;
}

- selfAttendee
{
  return 0;
}

- (id)originalItem
{
  return 0;
}

- (id)travelStartLocation
{
  return 0;
}

- (id)attachmentsSet
{
  return 0;
}

- (id)detachedItems
{
  return 0;
}

- (id)ekExceptionDates
{
  return 0;
}

- (id)syncError
{
  return 0;
}

- (BOOL)defaultAlarmRemoved
{
  return 0;
}

- (BOOL)defaultAlarmWasDeleted
{
  return 0;
}

@end