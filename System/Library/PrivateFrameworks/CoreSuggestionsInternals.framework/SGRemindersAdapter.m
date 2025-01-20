@interface SGRemindersAdapter
+ (BOOL)reminderHasDuplicate:(id)a3 usingStore:(id)a4;
+ (id)_remindersFoundInAppsListInREMStore:(id)a3;
+ (id)constructNotesForReminder:(id)a3;
+ (id)reminderPredicateForReminder:(id)a3;
+ (unint64_t)remindersCreatedBetweenStartDate:(id)a3 endDate:(id)a4;
- (BOOL)_deleteReminder:(id)a3 usingReminderStore:(id)a4;
- (BOOL)_saveReminder:(id)a3 usingReminderStore:(id)a4;
- (SGRemindersAdapter)initWithSGSqlEntityStore:(id)a3;
- (SGRemindersAdapter)initWithSGSqlEntityStore:(id)a3 andREMStore:(id)a4;
- (SGSqlEntityStore)store;
- (id)_remRemindersAssociatedWithStorageReminder:(id)a3 remStore:(id)a4;
- (id)_remRemindersAssociatedWithTitle:(id)a3 sourceUniqueIdentifier:(id)a4 usingStore:(id)a5;
- (id)sourceUniqueIdentifierForStorageReminder:(id)a3;
- (void)addReminder:(id)a3;
- (void)confirmReminderFromOtherDevice:(id)a3;
- (void)confirmReminderFromThisDevice:(id)a3;
- (void)orphanReminder:(id)a3;
- (void)rejectReminder:(id)a3;
- (void)rejectReminderFromOtherDevice:(id)a3;
- (void)rejectReminderFromThisDevice:(id)a3;
- (void)reminderAlarmTriggeredFromThisDevice:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation SGRemindersAdapter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_reminderStore, 0);
}

- (void)setStore:(id)a3
{
}

- (SGSqlEntityStore)store
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  return (SGSqlEntityStore *)WeakRetained;
}

- (id)_remRemindersAssociatedWithTitle:(id)a3 sourceUniqueIdentifier:(id)a4 usingStore:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v30 = a4;
  id v7 = a5;
  id v31 = (id)objc_opt_new();
  v29 = v7;
  [(id)objc_opt_class() _remindersFoundInAppsListInREMStore:v7];
  v28 = id v39 = 0;
  v8 = [v28 fetchRemindersWithError:&v39];
  id v27 = v39;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    unint64_t v12 = 0x1E4F28000uLL;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v35 + 1) + 8 * v13);
        v15 = *(void **)(v12 + 3520);
        uint64_t v16 = objc_opt_class();
        v17 = [v14 siriFoundInAppsData];
        id v34 = 0;
        v18 = [v15 unarchivedObjectOfClass:v16 fromData:v17 error:&v34];
        id v19 = v34;

        if (v18)
        {
          v20 = [v14 title];
          v21 = [v20 string];
          if ([v33 isEqualToString:v21])
          {
          }
          else
          {
            v23 = [v18 sourceUniqueIdentifier];
            int v24 = [v30 isEqualToString:v23];

            unint64_t v12 = 0x1E4F28000;
            if (!v24) {
              goto LABEL_14;
            }
          }
          [v31 addObject:v14];
        }
        else
        {
          v22 = sgRemindersLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v25 = [v14 objectID];
            *(_DWORD *)buf = 138412546;
            v41 = v25;
            __int16 v42 = 2112;
            id v43 = v19;
            _os_log_error_impl(&dword_1CA650000, v22, OS_LOG_TYPE_ERROR, "Unable to load metadata from reminder with id: %@ error: %@", buf, 0x16u);

            unint64_t v12 = 0x1E4F28000;
          }
        }
LABEL_14:

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v10);
  }

  return v31;
}

- (id)_remRemindersAssociatedWithStorageReminder:(id)a3 remStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 title];
  uint64_t v9 = [(SGRemindersAdapter *)self sourceUniqueIdentifierForStorageReminder:v7];

  uint64_t v10 = [(SGRemindersAdapter *)self _remRemindersAssociatedWithTitle:v8 sourceUniqueIdentifier:v9 usingStore:v6];

  return v10;
}

- (BOOL)_deleteReminder:(id)a3 usingReminderStore:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F94C58];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithStore:v6];
  uint64_t v9 = [(id)objc_opt_class() _remindersFoundInAppsListInREMStore:v6];

  id v10 = (id)[v8 updateList:v9];
  uint64_t v11 = [v8 updateReminder:v7];

  [v11 removeFromList];
  id v16 = 0;
  char v12 = [v8 saveSynchronouslyWithError:&v16];
  id v13 = v16;
  if ((v12 & 1) == 0)
  {
    v14 = sgRemindersLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v13;
      _os_log_error_impl(&dword_1CA650000, v14, OS_LOG_TYPE_ERROR, "Unable to delete reminder in ReminderKit error: %@", buf, 0xCu);
    }
  }
  return v12;
}

- (BOOL)_saveReminder:(id)a3 usingReminderStore:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(id)objc_opt_class() _remindersFoundInAppsListInREMStore:self->_reminderStore];
  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F94C58]) initWithStore:self->_reminderStore];
    uint64_t v8 = [v7 updateList:v6];
    uint64_t v9 = [v5 title];
    v48 = (void *)v8;
    id v10 = [v7 addReminderWithTitle:v9 toListChangeItem:v8];

    id v11 = objc_alloc(MEMORY[0x1E4F5DB30]);
    char v12 = [v5 recordId];
    id v13 = [(SGRemindersAdapter *)self sourceUniqueIdentifierForStorageReminder:v5];
    uint64_t v14 = [v11 initWithRecordId:v12 sourceUniqueIdentifier:v13];

    id v50 = 0;
    v47 = (void *)v14;
    uint64_t v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v50];
    id v16 = v50;
    v46 = (void *)v15;
    if (v15)
    {
      [v10 setSiriFoundInAppsData:v15];
    }
    else
    {
      uint64_t v19 = sgRemindersLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v16;
        _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "Unable to serialize ReminderMetadata: %@", buf, 0xCu);
      }
    }
    v20 = [v5 dueDateComponents];

    if (v20)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F94A78]);
      v22 = [v5 dueDateComponents];
      v23 = (void *)[v21 initWithDateComponents:v22];

      id v24 = (id)[v10 addAlarmWithTrigger:v23];
      v25 = [v5 dueDateComponents];
      [v10 setDueDateComponents:v25];
    }
    v26 = [v5 dueLocation];

    if (v26)
    {
      id v27 = objc_alloc(MEMORY[0x1E4F94CD0]);
      v28 = [v5 dueLocation];
      v29 = [v28 label];
      id v30 = (void *)[v27 initWithTitle:v29];

      id v31 = [v5 dueLocation];
      [v31 latitude];
      objc_msgSend(v30, "setLatitude:");

      v32 = [v5 dueLocation];
      [v32 longitude];
      objc_msgSend(v30, "setLongitude:");

      id v33 = [v5 dueLocation];
      [v33 accuracy];
      objc_msgSend(v30, "setRadius:");

      int v34 = [v5 dueLocationTrigger];
      if (v34 == 1) {
        uint64_t v35 = 1;
      }
      else {
        uint64_t v35 = 2 * (v34 == 2);
      }
      long long v36 = (void *)[objc_alloc(MEMORY[0x1E4F94A80]) initWithStructuredLocation:v30 proximity:v35];
      id v37 = (id)[v10 addAlarmWithTrigger:v36];
    }
    long long v38 = [(id)objc_opt_class() constructNotesForReminder:v5];
    if (v38)
    {
      id v39 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v38];
      [v10 setNotes:v39];
    }
    v40 = [v5 origin];
    v41 = [v40 universalURL];

    __int16 v42 = sgRemindersLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v41;
      _os_log_impl(&dword_1CA650000, v42, OS_LOG_TYPE_INFO, "Saving Reminder with universal link: %@", buf, 0xCu);
    }

    if (v41)
    {
      id v43 = (void *)[objc_alloc(MEMORY[0x1E4F94D50]) initWithUniversalLink:v41];
      [v10 setUserActivity:v43];
    }
    id v49 = 0;
    char v18 = [v7 saveSynchronouslyWithError:&v49];
    v17 = v49;
    if ((v18 & 1) == 0)
    {
      v44 = sgRemindersLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v17;
        _os_log_error_impl(&dword_1CA650000, v44, OS_LOG_TYPE_ERROR, "Unable to save reminder in ReminderKit error: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v17 = sgRemindersLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v17, OS_LOG_TYPE_ERROR, "Unable to load RemindersFoundInApps list", buf, 2u);
    }
    char v18 = 0;
  }

  return v18;
}

- (id)sourceUniqueIdentifierForStorageReminder:(id)a3
{
  v3 = [a3 duplicateKey];
  v4 = [v3 parentKey];
  id v5 = [v4 entityKey];
  id v6 = [v5 serialize];

  if (v6)
  {
    id v7 = [[SGMessageKey alloc] initWithSerialized:v6];
    uint64_t v8 = [(SGMessageKey *)v7 uniqueIdentifier];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)rejectReminder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(SGRemindersAdapter *)v5 _remRemindersAssociatedWithStorageReminder:v4 remStore:v5->_reminderStore];
  if ((unint64_t)[v6 count] < 2)
  {
    if ([v6 count] == 1)
    {
      id v7 = [v6 firstObject];
      [(SGRemindersAdapter *)v5 _deleteReminder:v7 usingReminderStore:v5->_reminderStore];
    }
    else
    {
      id v7 = sgRemindersLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "Didn't find any REMReminders to reject", v8, 2u);
      }
    }
  }
  else
  {
    id v7 = sgRemindersLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "Multiple reminders linked to one storage reminder", buf, 2u);
    }
  }

  objc_sync_exit(v5);
}

- (void)orphanReminder:(id)a3
{
  id v4 = a3;
  id v5 = sgRemindersLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Removing pseudo reminder because of parent deletion", v6, 2u);
  }

  [(SGRemindersAdapter *)self rejectReminder:v4];
}

- (void)rejectReminderFromOtherDevice:(id)a3
{
  id v4 = a3;
  id v5 = sgRemindersLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Rejecting reminder from other device", v6, 2u);
  }

  [(SGRemindersAdapter *)self rejectReminder:v4];
}

- (void)confirmReminderFromOtherDevice:(id)a3
{
  id v4 = a3;
  id v5 = sgRemindersLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Confirming reminder from other device", v6, 2u);
  }

  [(SGRemindersAdapter *)self rejectReminder:v4];
}

- (void)reminderAlarmTriggeredFromThisDevice:(id)a3
{
  id v4 = a3;
  id v5 = sgRemindersLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "SGRemindersAdapter: alarm triggered from this device", buf, 2u);
  }

  if ([v4 isAllDay])
  {
    id v6 = sgRemindersLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Not removing reminder since it's an allDay reminder", v7, 2u);
    }
  }
  else
  {
    [(SGRemindersAdapter *)self rejectReminder:v4];
  }
}

- (void)rejectReminderFromThisDevice:(id)a3
{
  id v4 = a3;
  id v5 = sgRemindersLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Rejecting reminder", v6, 2u);
  }

  [(SGRemindersAdapter *)self rejectReminder:v4];
}

- (void)confirmReminderFromThisDevice:(id)a3
{
  id v4 = a3;
  id v5 = sgRemindersLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Confirming reminder", v6, 2u);
  }

  [(SGRemindersAdapter *)self rejectReminderFromThisDevice:v4];
}

- (void)addReminder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = +[SGSuggestHistory sharedSuggestHistory];
  int v7 = [v6 isValidNewReminder:v4];

  if (!v7)
  {
    char v12 = sgRemindersLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_INFO, "Reminder is not a valid new one, already exists in SGSuggestHistory", (uint8_t *)&v18, 2u);
    }
    goto LABEL_21;
  }
  uint64_t v8 = [v4 dueDateComponents];
  if (v8)
  {
    uint64_t v9 = [v4 dueDateComponents];
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    if (+[SGReminderDissector isReminderDueDateComponentsInPast:givenReferenceDate:allDay:](SGReminderDissector, "isReminderDueDateComponentsInPast:givenReferenceDate:allDay:", v9, v10, [v4 isAllDay]))
    {
      char v11 = [MEMORY[0x1E4F5DAF0] showPastEvents];

      if ((v11 & 1) == 0)
      {
        char v12 = sgRemindersLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v18) = 0;
          id v13 = "SGRemindersAdapter: Not adding reminder that has dueDate in the past";
LABEL_16:
          _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v18, 2u);
          goto LABEL_21;
        }
        goto LABEL_21;
      }
    }
    else
    {
    }
  }
  uint64_t v14 = [(SGRemindersAdapter *)v5 _remRemindersAssociatedWithStorageReminder:v4 remStore:v5->_reminderStore];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    char v12 = sgRemindersLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      id v13 = "SGRemindersAdapter: PseudoReminder found in Found in Apps list, not adding";
      goto LABEL_16;
    }
LABEL_21:

    goto LABEL_22;
  }
  if ([(id)objc_opt_class() reminderHasDuplicate:v4 usingStore:v5->_reminderStore])
  {
    char v12 = sgRemindersLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      id v13 = "SGRemindersAdapter: Duplicate found in user defined list, not adding";
      goto LABEL_16;
    }
    goto LABEL_21;
  }
  id v16 = sgRemindersLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = [v4 recordId];
    int v18 = 138412290;
    uint64_t v19 = v17;
    _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_INFO, "SGRemindersAdapter: Adding Reminder with recordId: %@", (uint8_t *)&v18, 0xCu);
  }
  if ([(SGRemindersAdapter *)v5 _saveReminder:v4 usingReminderStore:v5->_reminderStore])
  {
    char v12 = +[SGRTCLogging defaultLogger];
    [v12 logReminderInteractionFromReminder:v4 interface:0 actionType:1];
    goto LABEL_21;
  }
LABEL_22:
  objc_sync_exit(v5);
}

- (SGRemindersAdapter)initWithSGSqlEntityStore:(id)a3 andREMStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SGRemindersAdapter;
  uint64_t v8 = [(SGRemindersAdapter *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_store, v6);
    objc_storeStrong((id *)&v9->_reminderStore, a4);
  }

  return v9;
}

- (SGRemindersAdapter)initWithSGSqlEntityStore:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(SGRemindersAdapter *)self initWithSGSqlEntityStore:v4 andREMStore:v5];

  return v6;
}

+ (id)constructNotesForReminder:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 origin];
  id v5 = [v4 localizedApplicationName];

  id v6 = +[SGContactStoreFactory contactStore];
  id v7 = [v3 contactIdentifier];
  uint64_t v8 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1000];
  v23[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v18 = 0;
  id v10 = +[SGContactsInterface unifiedContactWithIdentifier:v7 keysToFetch:v9 usingContactStore:v6 error:&v18];
  id v11 = v18;

  if (v10
    && ([MEMORY[0x1E4F1B910] stringFromContact:v10 style:1000],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v13 = (void *)v12;
    uint64_t v14 = +[SGFoundInAppsStrings foundInAppsStringLongVersionForAppName:v5 contactName:v12];

    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v14 = sgRemindersLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v3 loggingIdentifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      id v22 = v11;
      _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "SGRemindersAdapter - [SGStorageReminder (%{public}@)] constructNotesForReminder: Unable to fetch contact: %{public}@", buf, 0x16u);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

+ (unint64_t)remindersCreatedBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__SGRemindersAdapter_remindersCreatedBetweenStartDate_endDate___block_invoke;
  v12[3] = &unk_1E65B6A40;
  id v8 = v5;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  uint64_t v15 = &v16;
  [v7 enumerateAllRemindersWithBlock:v12];
  unint64_t v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __63__SGRemindersAdapter_remindersCreatedBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v14 = a2;
  id v5 = [v14 creationDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  if (v7 >= v8)
  {
    id v9 = [v14 creationDate];
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;
    [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    double v13 = v12;

    if (v11 <= v13) {
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
  }
  else
  {
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 0x33uLL) {
    *a3 = 1;
  }
}

+ (BOOL)reminderHasDuplicate:(id)a3 usingStore:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    id v7 = (id)objc_opt_new();
  }
  double v8 = [a1 reminderPredicateForReminder:v6];
  id v47 = 0;
  id v9 = [v7 fetchRemindersMatchingPredicateDescriptor:v8 sortDescriptors:0 options:0 error:&v47];
  id v10 = v47;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v38 = v10;
    id v39 = v8;
    id v40 = v7;
    uint64_t v13 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v16 = (void *)MEMORY[0x1CB79B230]();
        if (([v15 isCompleted] & 1) == 0)
        {
          v17 = [v15 title];
          uint64_t v18 = [v17 string];
          uint64_t v19 = [v6 title];
          int v20 = [v18 isEqualToString:v19];

          if (v20)
          {
            uint64_t v35 = sgRemindersLogHandle();
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
LABEL_22:
              double v8 = v39;
              id v7 = v40;
              id v10 = v38;

              BOOL v34 = 1;
              goto LABEL_23;
            }
            *(_WORD *)buf = 0;
            long long v36 = "SGRemindersAdapter: Duplicate reminder found based on exact title match";
LABEL_25:
            _os_log_debug_impl(&dword_1CA650000, v35, OS_LOG_TYPE_DEBUG, v36, buf, 2u);
            goto LABEL_22;
          }
          __int16 v21 = [v15 dueDateComponents];
          id v22 = [v6 dueDateComponents];
          int v23 = [v21 isEqual:v22];

          if (v23)
          {
            id v24 = [v6 title];
            v25 = [v15 title];
            v26 = [v25 string];
            unint64_t v27 = +[SGLevenshtein distanceBetweenStrings:v24 and:v26];

            v28 = [v6 title];
            unint64_t v29 = [v28 length];

            id v30 = [v15 title];
            id v31 = [v30 string];
            unint64_t v32 = [v31 length];

            unint64_t v33 = v29 <= v32 ? v32 : v29;
            if ((double)v27 / (double)v33 < 0.5)
            {
              uint64_t v35 = sgRemindersLogHandle();
              if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_22;
              }
              *(_WORD *)buf = 0;
              long long v36 = "SGRemindersAdapter: Duplicate reminder found based on dueDate and edit distance of title";
              goto LABEL_25;
            }
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    BOOL v34 = 0;
    double v8 = v39;
    id v7 = v40;
    id v10 = v38;
  }
  else
  {
    BOOL v34 = 0;
  }
LABEL_23:

  return v34;
}

+ (id)reminderPredicateForReminder:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v3 = [v28 title];
  id v4 = +[SGReminderMessage searchTokensForReminderTitle:v3];

  id v5 = objc_opt_new();
  id v6 = [MEMORY[0x1E4F94C40] predicateDescriptorForRemindersWithCompleted:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = [MEMORY[0x1E4F94C40] predicateDescriptorForRemindersWithTitleContains:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        uint64_t v12 = (void *)MEMORY[0x1E4F94C40];
        v35[0] = v6;
        v35[1] = v11;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
        id v14 = [v12 andPredicateDescriptorWithDescriptors:v13];

        [v5 addObject:v14];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v8);
  }

  uint64_t v15 = [v28 dueDateComponents];
  uint64_t v16 = [v15 date];

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E4F94C40];
    uint64_t v18 = [v28 dueDateComponents];
    uint64_t v19 = [v18 date];
    int v20 = [v28 dueDateComponents];
    __int16 v21 = [v20 date];
    id v22 = [v17 predicateDescriptorForRemindersWithDueDateBetween:v19 and:v21];

    int v23 = (void *)MEMORY[0x1E4F94C40];
    v34[0] = v6;
    v34[1] = v22;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    v25 = [v23 andPredicateDescriptorWithDescriptors:v24];

    [v5 addObject:v25];
  }
  v26 = [MEMORY[0x1E4F94C40] orPredicateDescriptorWithDescriptors:v5];

  return v26;
}

+ (id)_remindersFoundInAppsListInREMStore:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  id v3 = [a3 fetchSiriFoundInAppsListWithError:&v7];
  id v4 = v7;
  if (!v3)
  {
    id v5 = sgRemindersLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "Unable to retrieve found in apps list: %@", buf, 0xCu);
    }
  }
  return v3;
}

@end