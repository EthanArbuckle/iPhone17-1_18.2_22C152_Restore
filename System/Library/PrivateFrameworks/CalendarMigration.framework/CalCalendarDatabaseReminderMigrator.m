@interface CalCalendarDatabaseReminderMigrator
+ (BOOL)_attemptMigrationForStore:(void *)a3 withContext:(id)a4;
+ (BOOL)_preCheckStoreForPossibleMigrationDisablingRemindersIfNeeded:(void *)a3 withContext:(id)a4 accountType:(int64_t *)a5 identifier:(id *)a6;
+ (BOOL)_shouldMigrateCalendarAsReminderList:(void *)a3;
+ (id)_attemptAccountMigrationForStore:(void *)a3 withContext:(id)a4 accountType:(int64_t *)a5;
+ (id)_colorStringForCalendar:(void *)a3;
+ (id)_identifierForCalendar:(void *)a3;
+ (id)_identifierForReminder:(void *)a3;
+ (id)_identifierForStore:(void *)a3;
+ (int64_t)_accountTypeForStore:(void *)a3;
+ (void)_migrateCalendarAsReminderList:(void *)a3 withContext:(id)a4 accountChangeItem:(id)a5 accountType:(int64_t)a6;
+ (void)_migrateReminder:(void *)a3 withContext:(id)a4 listChangeItem:(id)a5;
+ (void)_migrateReminderListsInStore:(void *)a3 withContext:(id)a4 accountChangeItem:(id)a5 accountType:(int64_t)a6;
+ (void)_migrateRemindersInCalendar:(void *)a3 withContext:(id)a4 listChangeItem:(id)a5;
+ (void)_removeRemindersDataAfterSuccessfulMigrationFromDatabase:(CalDatabase *)a3 withContext:(id)a4;
+ (void)_setWasMigratedAndClearSyncTokenInAllCalendarsForStore:(void *)a3 withContext:(id)a4;
+ (void)_visitCalendarForMigrationAsReminderList:(void *)a3 withContext:(id)a4 accountChangeItem:(id)a5 accountType:(int64_t)a6;
- (BOOL)_attemptMigrationForDatabase:(CalDatabase *)a3 inCalendarDirectory:(id)a4 withContext:(id)a5;
- (BOOL)_attemptMigrationWithCalendarDatabase:(CalDatabase *)a3;
- (BOOL)_attemptMigrationWithHomeDirectory:(id)a3;
- (BOOL)_performMigrationForCalendarDatabase:(CalDatabase *)a3 inCalendarDirectory:(id)a4 withContext:(id)a5;
- (BOOL)attemptMigrationWithCalendarDatabase:(CalDatabase *)a3;
- (BOOL)attemptMigrationWithHomeDirectory:(id)a3;
- (CalCalendarDatabaseReminderMigrator)initWithReminderKitProvider:(id)a3 defaultsProvider:(id)a4;
- (CalReminderKitProvider)reminderKitProvider;
- (CalReminderMigrationDefaultsProvider)defaultsProvider;
- (void)_performPreMigrationTasksInCalendarDirectory:(id)a3 withContext:(id)a4;
@end

@implementation CalCalendarDatabaseReminderMigrator

- (CalCalendarDatabaseReminderMigrator)initWithReminderKitProvider:(id)a3 defaultsProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CalCalendarDatabaseReminderMigrator;
  v9 = [(CalCalendarDatabaseReminderMigrator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reminderKitProvider, a3);
    objc_storeStrong((id *)&v10->_defaultsProvider, a4);
  }

  return v10;
}

- (BOOL)attemptMigrationWithHomeDirectory:(id)a3
{
  id v4 = a3;
  v5 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22133F000, v5, OS_LOG_TYPE_DEFAULT, "Beginning CalendarDatabase reminder migration", buf, 2u);
  }

  BOOL v6 = [(CalCalendarDatabaseReminderMigrator *)self _attemptMigrationWithHomeDirectory:v4];
  id v7 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_22133F000, v7, OS_LOG_TYPE_DEFAULT, "Finished CalendarDatabase reminder migration", v9, 2u);
  }

  return v6;
}

- (BOOL)attemptMigrationWithCalendarDatabase:(CalDatabase *)a3
{
  v5 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22133F000, v5, OS_LOG_TYPE_DEFAULT, "Beginning CalendarDatabase reminder migration", buf, 2u);
  }

  BOOL v6 = [(CalCalendarDatabaseReminderMigrator *)self _attemptMigrationWithCalendarDatabase:a3];
  id v7 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_22133F000, v7, OS_LOG_TYPE_DEFAULT, "Finished CalendarDatabase reminder migration", v9, 2u);
  }

  return v6;
}

- (BOOL)_attemptMigrationWithHomeDirectory:(id)a3
{
  id v4 = a3;
  v5 = [(CalCalendarDatabaseReminderMigrator *)self reminderKitProvider];
  BOOL v6 = +[CalCalendarDatabaseReminderMigrationContext reminderMigrationContextWithReminderKitProvider:v5];

  if (v6)
  {
    id v7 = [v4 URLByAppendingPathComponent:@"Library/Calendar"];
    id v8 = [v7 path];
    v9 = [v8 stringByAppendingString:@"/"];

    id v10 = objc_alloc(MEMORY[0x263F2FE20]);
    v11 = [NSURL fileURLWithPath:v9];
    objc_super v12 = (void *)[v10 initWithDirectoryURL:v11];

    [v12 setOptions:13];
    uint64_t v13 = CalDatabaseCreateWithConfiguration();
    if (v13)
    {
      v14 = (const void *)v13;
      BOOL v15 = [(CalCalendarDatabaseReminderMigrator *)self _attemptMigrationForDatabase:v13 inCalendarDirectory:v7 withContext:v6];
      CFRelease(v14);
    }
    else
    {
      v16 = +[CalMigrationLog reminders];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CalCalendarDatabaseReminderMigrator _attemptMigrationWithHomeDirectory:]();
      }

      [v6 recordMigrationFailureWithDescription:@"Failed to open calendar database" inStage:1 underlyingError:0];
      [v6 finishMigrationWithSave:0];
      BOOL v15 = 0;
    }
  }
  else
  {
    id v7 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[CalCalendarDatabaseReminderMigrator _attemptMigrationWithHomeDirectory:]();
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_attemptMigrationWithCalendarDatabase:(CalDatabase *)a3
{
  v5 = [(CalCalendarDatabaseReminderMigrator *)self reminderKitProvider];
  BOOL v6 = +[CalCalendarDatabaseReminderMigrationContext reminderMigrationContextWithReminderKitProvider:v5];

  if (v6)
  {
    id v7 = CalDatabaseCopyDirectoryPathForDatabase();
    id v8 = [NSURL fileURLWithPath:v7];
    if (v8)
    {
      BOOL v9 = [(CalCalendarDatabaseReminderMigrator *)self _attemptMigrationForDatabase:a3 inCalendarDirectory:v8 withContext:v6];
    }
    else
    {
      id v10 = +[CalMigrationLog reminders];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CalCalendarDatabaseReminderMigrator _attemptMigrationWithCalendarDatabase:]();
      }

      [v6 recordMigrationFailureWithDescription:@"Failed to get path for database" inStage:1 underlyingError:0];
      [v6 finishMigrationWithSave:0];
      BOOL v9 = 0;
    }
  }
  else
  {
    id v7 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[CalCalendarDatabaseReminderMigrator _attemptMigrationWithHomeDirectory:]();
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_attemptMigrationForDatabase:(CalDatabase *)a3 inCalendarDirectory:(id)a4 withContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(CalCalendarDatabaseReminderMigrator *)self _performPreMigrationTasksInCalendarDirectory:v8 withContext:v9];
  if ([v9 shouldPerformMigration]) {
    BOOL v10 = [(CalCalendarDatabaseReminderMigrator *)self _performMigrationForCalendarDatabase:a3 inCalendarDirectory:v8 withContext:v9];
  }
  else {
    BOOL v10 = 0;
  }
  v11 = [(CalCalendarDatabaseReminderMigrator *)self defaultsProvider];
  [v11 setHavePerformedReminderMigrationCleanup:1];

  return v10;
}

- (void)_performPreMigrationTasksInCalendarDirectory:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CalCalendarDatabaseReminderMigrator *)self defaultsProvider];
  int v9 = [v8 shouldBackupBeforeMigration];

  BOOL v10 = +[CalMigrationLog reminders];
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22133F000, v10, OS_LOG_TYPE_INFO, "Defaults indicate to create a backup. Checking if the backup would be too large.", buf, 2u);
    }

    if (+[CalMigrationBackup shouldBackupCalendarDirectory:v6 withPrivacySafePathProvider:v7])
    {
      id v19 = 0;
      BOOL v12 = +[CalMigrationBackup backupCalendarDirectory:v6 intoArchiveNamed:@"ReminderMigrationBackup.zip" error:&v19];
      id v13 = v19;
      if (!v12)
      {
        v14 = +[CalMigrationLog reminders];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[CalCalendarDatabaseReminderMigrator _performPreMigrationTasksInCalendarDirectory:withContext:](v6);
        }

        BOOL v15 = [v6 path];
        [v7 recordMigrationFailureWithDescription:@"Failed to back up calendar directory" inStage:6 underlyingError:v13 relatedTo:v15];
LABEL_16:

        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22133F000, v10, OS_LOG_TYPE_INFO, "Defaults indicate not to create backup", buf, 2u);
    }
  }
  id v18 = 0;
  BOOL v16 = +[CalMigrationBackup removeExistingBackupWithArchiveName:@"ReminderMigrationBackup.zip" inCalendarDirectory:v6 error:&v18];
  id v13 = v18;
  if (!v16)
  {
    v17 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CalCalendarDatabaseReminderMigrator _performPreMigrationTasksInCalendarDirectory:withContext:](v6);
    }

    BOOL v15 = [v6 path];
    [v7 recordMigrationFailureWithDescription:@"Failed to remove existing backup" inStage:6 underlyingError:v13 relatedTo:v15 isFatal:0];
    goto LABEL_16;
  }
LABEL_17:
}

- (BOOL)_performMigrationForCalendarDatabase:(CalDatabase *)a3 inCalendarDirectory:(id)a4 withContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = CalDatabaseCopyDefaultCalendarForNewTasksForReminderMigration();
  if (v10)
  {
    BOOL v11 = (const void *)v10;
    BOOL v12 = (void *)CalCalendarCopyUUID();
    [v9 setDefaultListOriginalIdentifier:v12];

    CFRelease(v11);
  }
  id v13 = (void *)CalDatabaseCopyOfAllStores();
  v14 = v13;
  if (v13)
  {
    BOOL v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    BOOL v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __108__CalCalendarDatabaseReminderMigrator__performMigrationForCalendarDatabase_inCalendarDirectory_withContext___block_invoke;
    v34[3] = &unk_2645A45A8;
    v34[4] = self;
    id v17 = v9;
    id v35 = v17;
    id v18 = v15;
    id v36 = v18;
    id v19 = v16;
    id v37 = v19;
    [v14 enumerateCalStoreRefsUsingBlock:v34];
    if ([v17 ensureAccountsExist:v19])
    {
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x2020000000;
      char v33 = 0;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __108__CalCalendarDatabaseReminderMigrator__performMigrationForCalendarDatabase_inCalendarDirectory_withContext___block_invoke_2;
      v27[3] = &unk_2645A45D0;
      v29 = &v30;
      v27[4] = self;
      id v20 = v17;
      id v28 = v20;
      [v18 enumerateCalStoreRefsUsingBlock:v27];
      if (*((unsigned char *)v31 + 24))
      {
        BOOL v21 = 1;
      }
      else
      {
        v24 = +[CalMigrationLog reminders];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl(&dword_22133F000, v24, OS_LOG_TYPE_DEFAULT, "No reminder data was migrated", v26, 2u);
        }

        BOOL v21 = *((unsigned char *)v31 + 24) != 0;
      }
      if ([v20 finishMigrationWithSave:v21])
      {
        if ([v20 shouldDeleteMigratedData]) {
          [(id)objc_opt_class() _removeRemindersDataAfterSuccessfulMigrationFromDatabase:a3 withContext:v20];
        }
        BOOL v23 = *((unsigned char *)v31 + 24) != 0;
      }
      else
      {
        BOOL v23 = 0;
      }

      _Block_object_dispose(&v30, 8);
    }
    else
    {
      [v17 finishMigrationWithSave:0];
      BOOL v23 = 0;
    }
  }
  else
  {
    v22 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[CalCalendarDatabaseReminderMigrator _performMigrationForCalendarDatabase:inCalendarDirectory:withContext:]();
    }

    [v9 recordMigrationFailureWithDescription:@"Failed to get array of stores" inStage:1 underlyingError:0];
    [v9 finishMigrationWithSave:0];
    BOOL v23 = 0;
  }

  return v23;
}

void __108__CalCalendarDatabaseReminderMigrator__performMigrationForCalendarDatabase_inCalendarDirectory_withContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v15[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v13 = 0;
  id v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = 0;
  int v8 = [v6 _preCheckStoreForPossibleMigrationDisablingRemindersIfNeeded:a3 withContext:v7 accountType:&v13 identifier:&v12];
  id v9 = v12;
  if (v8)
  {
    [*(id *)(a1 + 48) addObject:v5];
    if (v13 != 1)
    {
      v14[0] = @"identifier";
      v14[1] = @"type";
      v15[0] = v9;
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:");
      v15[1] = v10;
      BOOL v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

      [*(id *)(a1 + 56) addObject:v11];
    }
  }
}

uint64_t __108__CalCalendarDatabaseReminderMigrator__performMigrationForCalendarDatabase_inCalendarDirectory_withContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [(id)objc_opt_class() _attemptMigrationForStore:a3 withContext:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= result;
  return result;
}

+ (BOOL)_preCheckStoreForPossibleMigrationDisablingRemindersIfNeeded:(void *)a3 withContext:(id)a4 accountType:(int64_t *)a5 identifier:(id *)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a4;
  *a5 = 0;
  *a6 = 0;
  BOOL v11 = [a1 _identifierForStore:a3];
  uint64_t v12 = [a1 _accountTypeForStore:a3];
  if (!v12)
  {
    id v19 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      BOOL v23 = v11;
      id v20 = "Skipping store %{public}@ with unknown account type";
LABEL_11:
      _os_log_impl(&dword_22133F000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v22, 0xCu);
    }
LABEL_12:

    [v10 addStoreToDisableReminders:a3];
LABEL_13:
    BOOL v18 = 0;
    goto LABEL_14;
  }
  int64_t v13 = v12;
  if ((CalStoreIsEnabled() & 1) == 0)
  {
    id v19 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      BOOL v23 = v11;
      id v20 = "Skipping store %{public}@ because it is disabled";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  [a1 _setWasMigratedAndClearSyncTokenInAllCalendarsForStore:a3 withContext:v10];
  char v14 = CalStoreAllowsTasksPrivate();
  BOOL v15 = +[CalMigrationLog reminders];
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if ((v14 & 1) == 0)
  {
    if (v16)
    {
      int v22 = 138543362;
      BOOL v23 = v11;
      _os_log_impl(&dword_22133F000, v15, OS_LOG_TYPE_DEFAULT, "Skipping store %{public}@ because it does not support reminders", (uint8_t *)&v22, 0xCu);
    }

    goto LABEL_13;
  }
  if (v16)
  {
    id v17 = [NSNumber numberWithInteger:v13];
    int v22 = 138543618;
    BOOL v23 = v11;
    __int16 v24 = 2114;
    v25 = v17;
    _os_log_impl(&dword_22133F000, v15, OS_LOG_TYPE_DEFAULT, "Including store %{public}@ with type %{public}@", (uint8_t *)&v22, 0x16u);
  }
  *a5 = v13;
  *a6 = v11;
  BOOL v18 = 1;
LABEL_14:

  return v18;
}

+ (BOOL)_attemptMigrationForStore:(void *)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v9 = 0;
  uint64_t v7 = [a1 _attemptAccountMigrationForStore:a3 withContext:v6 accountType:&v9];
  if (v7)
  {
    [v6 pushOrderedListItemsContext];
    [a1 _migrateReminderListsInStore:a3 withContext:v6 accountChangeItem:v7 accountType:v9];
    [v6 popOrderedListItemsContextAndSortListsInAccountChangeItem:v7];
  }

  return v7 != 0;
}

+ (id)_attemptAccountMigrationForStore:(void *)a3 withContext:(id)a4 accountType:(int64_t *)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  *a5 = 0;
  uint64_t v9 = [a1 _identifierForStore:a3];
  int64_t v10 = [a1 _accountTypeForStore:a3];
  *a5 = v10;
  if (v10 == 1)
  {
    BOOL v11 = [v8 localAccountChangeItem];
  }
  else
  {
    BOOL v11 = [v8 existingAccountChangeItemWithAccountIdentifier:v9];
    uint64_t v12 = (void *)CalStoreCopyName();
    [v11 setName:v12];

    [v11 setDaWasMigrated:1];
  }
  int v13 = CalStoreAllowsEvents();
  char v14 = +[CalMigrationLog reminders];
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      int v17 = 138543362;
      BOOL v18 = v9;
      _os_log_impl(&dword_22133F000, v14, OS_LOG_TYPE_INFO, "Adding %{public}@ to list of stores to disable reminders because has both data classes enabled", (uint8_t *)&v17, 0xCu);
    }

    [v8 addStoreToDisableReminders:a3];
  }
  else
  {
    if (v15)
    {
      int v17 = 138543362;
      BOOL v18 = v9;
      _os_log_impl(&dword_22133F000, v14, OS_LOG_TYPE_INFO, "Adding %{public}@ to list of stores to delete because only reminders are enabled", (uint8_t *)&v17, 0xCu);
    }

    [v8 addStoreToDelete:a3];
  }

  return v11;
}

+ (int64_t)_accountTypeForStore:(void *)a3
{
  unsigned int Type = CalStoreGetType();
  if (Type > 2) {
    return 0;
  }
  else {
    return qword_2213522B0[Type];
  }
}

+ (void)_migrateReminderListsInStore:(void *)a3 withContext:(id)a4 accountChangeItem:(id)a5 accountType:(int64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void *)CalStoreCopyCalendars();
  if (v12)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __110__CalCalendarDatabaseReminderMigrator__migrateReminderListsInStore_withContext_accountChangeItem_accountType___block_invoke;
    void v15[3] = &unk_2645A45F8;
    id v18 = a1;
    id v16 = v10;
    id v17 = v11;
    int64_t v19 = a6;
    [v12 enumerateCalCalendarRefsUsingBlock:v15];

    int v13 = v16;
  }
  else
  {
    int v13 = [a1 _identifierForStore:a3];
    char v14 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[CalCalendarDatabaseReminderMigrator _migrateReminderListsInStore:withContext:accountChangeItem:accountType:]();
    }

    [v10 recordMigrationFailureWithDescription:@"Failed to get calendars from store" inStage:3 underlyingError:0 relatedTo:v13];
  }
}

uint64_t __110__CalCalendarDatabaseReminderMigrator__migrateReminderListsInStore_withContext_accountChangeItem_accountType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 48), "_shouldMigrateCalendarAsReminderList:");
  if (result)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    return [v8 _visitCalendarForMigrationAsReminderList:a3 withContext:v6 accountChangeItem:v7 accountType:v9];
  }
  return result;
}

+ (BOOL)_shouldMigrateCalendarAsReminderList:(void *)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (CalCalendarCanContainEntityType())
  {
    if (CalCalendarIsHidden())
    {
      id v5 = +[CalMigrationLog reminders];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = [a1 _identifierForCalendar:a3];
        int v9 = 138543362;
        id v10 = v6;
        uint64_t v7 = "Skipping calendar %{public}@ because it is hidden";
LABEL_19:
        _os_log_impl(&dword_22133F000, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v9, 0xCu);
      }
    }
    else if (CalCalendarIsInbox())
    {
      id v5 = +[CalMigrationLog reminders];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = [a1 _identifierForCalendar:a3];
        int v9 = 138543362;
        id v10 = v6;
        uint64_t v7 = "Skipping calendar %{public}@ because it is an inbox calendar";
        goto LABEL_19;
      }
    }
    else if (CalCalendarIsNotificationsCollection())
    {
      id v5 = +[CalMigrationLog reminders];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = [a1 _identifierForCalendar:a3];
        int v9 = 138543362;
        id v10 = v6;
        uint64_t v7 = "Skipping calendar %{public}@ because it is a notification collection";
        goto LABEL_19;
      }
    }
    else if (CalCalendarIsSharingInvitation())
    {
      id v5 = +[CalMigrationLog reminders];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = [a1 _identifierForCalendar:a3];
        int v9 = 138543362;
        id v10 = v6;
        uint64_t v7 = "Skipping calendar %{public}@ because it is a sharing invitation";
        goto LABEL_19;
      }
    }
    else
    {
      if (!CalCalendarIsSubscribed()) {
        return 1;
      }
      id v5 = +[CalMigrationLog reminders];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = [a1 _identifierForCalendar:a3];
        int v9 = 138543362;
        id v10 = v6;
        uint64_t v7 = "Skipping calendar %{public}@ because it is a subscribed calendar";
        goto LABEL_19;
      }
    }
  }
  else
  {
    id v5 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [a1 _identifierForCalendar:a3];
      int v9 = 138543362;
      id v10 = v6;
      uint64_t v7 = "Skipping calendar %{public}@ because it doesn't support reminders";
      goto LABEL_19;
    }
  }

  return 0;
}

+ (void)_visitCalendarForMigrationAsReminderList:(void *)a3 withContext:(id)a4 accountChangeItem:(id)a5 accountType:(int64_t)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v10 = a4;
  [a1 _migrateCalendarAsReminderList:a3 withContext:v10 accountChangeItem:a5 accountType:a6];
  uint64_t v11 = [a1 _identifierForCalendar:a3];
  LODWORD(a1) = CalCalendarCanContainEntityType();
  uint64_t v12 = +[CalMigrationLog reminders];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (a1)
  {
    if (v13)
    {
      int v14 = 138543362;
      BOOL v15 = v11;
      _os_log_impl(&dword_22133F000, v12, OS_LOG_TYPE_INFO, "Adding calendar %{public}@ to list of calendars to disable reminders because it supports both entity types", (uint8_t *)&v14, 0xCu);
    }

    [v10 addCalendarToDisableReminders:a3];
  }
  else
  {
    if (v13)
    {
      int v14 = 138543362;
      BOOL v15 = v11;
      _os_log_impl(&dword_22133F000, v12, OS_LOG_TYPE_INFO, "Adding calendar %{public}@ to list of calendars to delete because it only supports reminders", (uint8_t *)&v14, 0xCu);
    }

    [v10 addCalendarToDelete:a3];
  }
}

+ (void)_migrateCalendarAsReminderList:(void *)a3 withContext:(id)a4 accountChangeItem:(id)a5 accountType:(int64_t)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v27 = a5;
  int v9 = [v8 saveRequest];
  id v10 = [v9 addListWithName:@"Reminders" toAccountChangeItem:v27];

  uint64_t v11 = (void *)CalCalendarCopyTitle();
  if (v11) {
    [v10 setName:v11];
  }
  uint64_t v12 = [a1 _colorStringForCalendar:a3];
  if (v12)
  {
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x2050000000;
    BOOL v13 = (void *)getREMColorClass_softClass;
    uint64_t v32 = getREMColorClass_softClass;
    if (!getREMColorClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __getREMColorClass_block_invoke;
      v34 = &unk_2645A4398;
      id v35 = &v29;
      __getREMColorClass_block_invoke((uint64_t)buf);
      BOOL v13 = (void *)v30[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v29, 8);
    BOOL v15 = +[CalReminderMigrationReminderKitUtils hexColorStringByRemovingAlphaFromHexString:v12];
    uint64_t v16 = [v14 colorWithHexString:v15];
    [v10 setColor:v16];
  }
  uint64_t DisplayOrder = CalCalendarGetDisplayOrder();
  id v18 = (void *)CalCalendarCopyUUID();
  int64_t v19 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v10 name];
    BOOL v21 = [v10 objectID];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v34) = DisplayOrder;
    _os_log_impl(&dword_22133F000, v19, OS_LOG_TYPE_DEFAULT, "Recording migrated list \"%@\" (%{public}@) with old order %i", buf, 0x1Cu);
  }
  int v22 = [NSNumber numberWithInt:DisplayOrder];
  [v8 recordAddedListChangeItem:v10 withOriginalIdentifier:v18 order:v22];

  BOOL v23 = (void *)CalCalendarCopyExternalID();
  [v10 setExternalIdentifier:v23];

  __int16 v24 = (void *)CalCalendarCopyPushKey();
  [v10 setDaPushKey:v24];

  if (a6 == 4)
  {
    v25 = (void *)CalCalendarCopyExternalModificationTag();
    [v10 setExternalModificationTag:v25];
  }
  [a1 _migrateRemindersInCalendar:a3 withContext:v8 listChangeItem:v10];
}

+ (void)_migrateRemindersInCalendar:(void *)a3 withContext:(id)a4 listChangeItem:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)CalCalendarCopyTasks();
  if (v10)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __94__CalCalendarDatabaseReminderMigrator__migrateRemindersInCalendar_withContext_listChangeItem___block_invoke;
    v13[3] = &unk_2645A4620;
    id v16 = a1;
    id v14 = v8;
    id v15 = v9;
    [v10 enumerateCalTaskRefsUsingBlock:v13];

    uint64_t v11 = v14;
  }
  else
  {
    uint64_t v11 = [a1 _identifierForCalendar:a3];
    uint64_t v12 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[CalCalendarDatabaseReminderMigrator _migrateRemindersInCalendar:withContext:listChangeItem:]();
    }

    [v8 recordMigrationFailureWithDescription:@"Failed to get reminders from calendar" inStage:3 underlyingError:0 relatedTo:v11];
  }
}

uint64_t __94__CalCalendarDatabaseReminderMigrator__migrateRemindersInCalendar_withContext_listChangeItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) _migrateReminder:a3 withContext:*(void *)(a1 + 32) listChangeItem:*(void *)(a1 + 40)];
}

+ (void)_migrateReminder:(void *)a3 withContext:(id)a4 listChangeItem:(id)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  v23[0] = a3;
  id v9 = (void *)MEMORY[0x263EFF8C0];
  id v10 = a5;
  uint64_t v11 = [v9 arrayWithObjects:v23 count:1];
  uint64_t v12 = (void *)CalCreateiCalendarDataFromCalEntities();
  BOOL v13 = [v8 saveRequest];
  id v22 = 0;
  id v14 = [v13 importRemindersFromICSData:v12 insertIntoListChangeItem:v10 error:&v22];

  id v15 = v22;
  id v16 = [a1 _identifierForReminder:a3];
  if (!v14)
  {
    BOOL v21 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[CalCalendarDatabaseReminderMigrator _migrateReminder:withContext:listChangeItem:]((uint64_t)v16, (uint64_t)v15, v21);
    }

    id v18 = @"Failed to import ICS data";
    int64_t v19 = v8;
    id v20 = v15;
    goto LABEL_9;
  }
  if (![v14 count])
  {
    id v17 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[CalCalendarDatabaseReminderMigrator _migrateReminder:withContext:listChangeItem:]();
    }

    id v18 = @"Imported 0 reminders from ICS data for a reminder";
    int64_t v19 = v8;
    id v20 = 0;
LABEL_9:
    [v19 recordMigrationFailureWithDescription:v18 inStage:4 underlyingError:v20 relatedTo:v16];
  }
}

+ (void)_removeRemindersDataAfterSuccessfulMigrationFromDatabase:(CalDatabase *)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v7 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22133F000, v7, OS_LOG_TYPE_INFO, "Removing reminders data from CalendarDatabase", buf, 2u);
  }

  id v8 = [v6 storesToSetWasMigrated];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke;
  v22[3] = &unk_2645A4648;
  v22[4] = &v24;
  v22[5] = a1;
  [v8 enumerateCalStoreRefsUsingBlock:v22];

  id v9 = [v6 storesToDelete];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_44;
  v21[3] = &unk_2645A4648;
  v21[4] = &v24;
  v21[5] = a1;
  [v9 enumerateCalStoreRefsUsingBlock:v21];

  id v10 = [v6 calendarsToDelete];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_45;
  v20[3] = &unk_2645A4648;
  v20[4] = &v24;
  v20[5] = a1;
  [v10 enumerateCalCalendarRefsUsingBlock:v20];

  uint64_t v11 = [v6 storesToDisableReminders];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_46;
  v19[3] = &unk_2645A4648;
  v19[4] = &v24;
  v19[5] = a1;
  [v11 enumerateCalStoreRefsUsingBlock:v19];

  uint64_t v12 = [v6 calendarsToDisableReminders];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_47;
  v18[3] = &unk_2645A4670;
  v18[5] = a1;
  v18[6] = a3;
  v18[4] = &v24;
  [v12 enumerateCalCalendarRefsUsingBlock:v18];

  BOOL v13 = [v6 calendarsToClearSyncToken];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_48;
  v17[3] = &unk_2645A4648;
  v17[4] = &v24;
  v17[5] = a1;
  [v13 enumerateCalCalendarRefsUsingBlock:v17];

  if (!*((unsigned char *)v25 + 24))
  {
    id v14 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v15 = "No reminders data needed to be removed";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_14;
  }
  if (CalDatabaseSave())
  {
    CalDatabaseClearAllChangeHistoryForAllClients();
    id v14 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v15 = "Finished removing reminders data from CalendarDatabase";
LABEL_9:
      _os_log_impl(&dword_22133F000, v14, OS_LOG_TYPE_INFO, v15, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  id v16 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    +[CalCalendarDatabaseReminderMigrator _removeRemindersDataAfterSuccessfulMigrationFromDatabase:withContext:]();
  }

  [v6 recordMigrationFailureWithDescription:@"Failed to save database after removing reminders data" inStage:6 underlyingError:0];
LABEL_14:
  _Block_object_dispose(&v24, 8);
}

uint64_t __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 40) _identifierForStore:a3];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22133F000, v5, OS_LOG_TYPE_INFO, "Setting WasMigrated on store %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t result = CalStoreSetWasMigrated();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 40) _identifierForStore:a3];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22133F000, v5, OS_LOG_TYPE_INFO, "Deleting store %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t result = CalRemoveStore();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_45(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 40) _identifierForCalendar:a3];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22133F000, v5, OS_LOG_TYPE_INFO, "Deleting calendar %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t result = CalRemoveCalendar();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_46(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 40) _identifierForStore:a3];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22133F000, v5, OS_LOG_TYPE_INFO, "Disabling reminders in store %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t result = CalStoreSetAllowsTasksPrivate();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_47(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 40) _identifierForCalendar:a3];
    int v10 = 138543362;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22133F000, v5, OS_LOG_TYPE_INFO, "Disabling reminders in calendar %{public}@", (uint8_t *)&v10, 0xCu);
  }
  CalCalendarSetCanContainEntityType();
  uint64_t v7 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = [*(id *)(a1 + 40) _identifierForCalendar:a3];
    int v10 = 138543362;
    uint64_t v11 = v8;
    _os_log_impl(&dword_22133F000, v7, OS_LOG_TYPE_INFO, "Removing existing reminders from calendar %{public}@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t result = CalDatabaseRemoveAllCalendarItemsWithCalendarAndEntityType();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 40) _identifierForCalendar:a3];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22133F000, v5, OS_LOG_TYPE_INFO, "Clearing sync token in calendar %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t result = CalCalendarSetSyncToken();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

+ (void)_setWasMigratedAndClearSyncTokenInAllCalendarsForStore:(void *)a3 withContext:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = [a1 _identifierForStore:a3];
    *(_DWORD *)buf = 138543362;
    id v16 = v8;
    _os_log_impl(&dword_22133F000, v7, OS_LOG_TYPE_INFO, "Adding store %{public}@ to list of stores to set wasMigrated", buf, 0xCu);
  }
  [v6 addStoreToSetWasMigrated:a3];
  id v9 = (void *)CalStoreCopyCalendars();
  if (v9)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __106__CalCalendarDatabaseReminderMigrator__setWasMigratedAndClearSyncTokenInAllCalendarsForStore_withContext___block_invoke;
    v12[3] = &unk_2645A4560;
    id v14 = a1;
    id v13 = v6;
    [v9 enumerateCalCalendarRefsUsingBlock:v12];
    uint64_t v10 = v13;
  }
  else
  {
    uint64_t v10 = [a1 _identifierForStore:a3];
    uint64_t v11 = +[CalMigrationLog reminders];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CalCalendarDatabaseReminderMigrator _migrateReminderListsInStore:withContext:accountChangeItem:accountType:]();
    }

    [v6 recordMigrationFailureWithDescription:@"Failed to get calendars from store" inStage:1 underlyingError:0 relatedTo:v10];
  }
}

uint64_t __106__CalCalendarDatabaseReminderMigrator__setWasMigratedAndClearSyncTokenInAllCalendarsForStore_withContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = +[CalMigrationLog reminders];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [*(id *)(a1 + 40) _identifierForCalendar:a3];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22133F000, v5, OS_LOG_TYPE_INFO, "Adding calendar %{public}@ to list of calendars to clear sync token", (uint8_t *)&v8, 0xCu);
  }
  return [*(id *)(a1 + 32) addCalendarToClearSyncToken:a3];
}

+ (id)_identifierForStore:(void *)a3
{
  v3 = (void *)CalStoreCopyUUID();
  return v3;
}

+ (id)_identifierForCalendar:(void *)a3
{
  v3 = (void *)CalCalendarCopyUUID();
  return v3;
}

+ (id)_identifierForReminder:(void *)a3
{
  v3 = (void *)CalCalendarItemCopyUUID();
  return v3;
}

+ (id)_colorStringForCalendar:(void *)a3
{
  v3 = (void *)CalCalendarCopySymbolicColorName();
  if (!v3
    || (EKSymbolicColorToRGBMapping(),
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:v3],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    id v5 = (void *)CalCalendarCopyColorStringForDisplay();
  }

  return v5;
}

- (CalReminderKitProvider)reminderKitProvider
{
  return self->_reminderKitProvider;
}

- (CalReminderMigrationDefaultsProvider)defaultsProvider
{
  return self->_defaultsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsProvider, 0);
  objc_storeStrong((id *)&self->_reminderKitProvider, 0);
}

- (void)_attemptMigrationWithHomeDirectory:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  _os_log_fault_impl(&dword_22133F000, v0, OS_LOG_TYPE_FAULT, "Failed to get a migration context. Aborting migration.", v1, 2u);
}

- (void)_attemptMigrationWithHomeDirectory:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2(&dword_22133F000, v0, v1, "Failed to open calendar database. Will not attempt migration.", v2, v3, v4, v5, v6);
}

- (void)_attemptMigrationWithCalendarDatabase:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2(&dword_22133F000, v0, v1, "Failed to get path for database. Aborting migration.", v2, v3, v4, v5, v6);
}

- (void)_attemptMigrationForDatabase:inCalendarDirectory:withContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_22133F000, v0, OS_LOG_TYPE_FAULT, "Exception thrown during migration: %@", v1, 0xCu);
}

- (void)_performPreMigrationTasksInCalendarDirectory:(void *)a1 withContext:.cold.1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_22133F000, v2, v3, "Failed to back up calendar directory %@. error = %@", v4, v5, v6, v7, v8);
}

- (void)_performPreMigrationTasksInCalendarDirectory:(void *)a1 withContext:.cold.2(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_22133F000, v2, v3, "Failed to remove existing backup in calendar directory %@. error = %@", v4, v5, v6, v7, v8);
}

- (void)_performMigrationForCalendarDatabase:inCalendarDirectory:withContext:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2(&dword_22133F000, v0, v1, "Failed to get array of stores. Aborting migration.", v2, v3, v4, v5, v6);
}

+ (void)_migrateReminderListsInStore:withContext:accountChangeItem:accountType:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22133F000, v0, v1, "Failed to get calendars from store %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_migrateRemindersInCalendar:withContext:listChangeItem:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22133F000, v0, v1, "Failed to get reminders from calendar %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_migrateReminder:(uint64_t)a1 withContext:(uint64_t)a2 listChangeItem:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22133F000, log, OS_LOG_TYPE_ERROR, "Failed to import ICS data for reminder %{public}@. error = %@", (uint8_t *)&v3, 0x16u);
}

+ (void)_migrateReminder:withContext:listChangeItem:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22133F000, v0, v1, "Imported 0 reminders from ICS data for reminder %{public}@.", v2, v3, v4, v5, v6);
}

+ (void)_removeRemindersDataAfterSuccessfulMigrationFromDatabase:withContext:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2(&dword_22133F000, v0, v1, "Failed to save database after removing reminders data", v2, v3, v4, v5, v6);
}

@end