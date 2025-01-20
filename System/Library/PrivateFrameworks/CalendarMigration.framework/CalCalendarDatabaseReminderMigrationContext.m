@interface CalCalendarDatabaseReminderMigrationContext
+ (id)reminderMigrationContextWithReminderKitProvider:(id)a3;
- (BOOL)_isCalendarOwnedByExistingStoreToDelete:(void *)a3;
- (NSArray)calendarsToClearSyncToken;
- (NSArray)calendarsToDelete;
- (NSArray)calendarsToDisableReminders;
- (NSArray)storesToDelete;
- (NSArray)storesToDisableReminders;
- (NSArray)storesToSetWasMigrated;
- (id)privacySafePathForURLInCalendarDirectory:(id)a3;
- (void)_removeCalendarsToDeleteInStore:(void *)a3;
- (void)addCalendarToClearSyncToken:(void *)a3;
- (void)addCalendarToDelete:(void *)a3;
- (void)addCalendarToDisableReminders:(void *)a3;
- (void)addStoreToDelete:(void *)a3;
- (void)addStoreToDisableReminders:(void *)a3;
- (void)addStoreToSetWasMigrated:(void *)a3;
@end

@implementation CalCalendarDatabaseReminderMigrationContext

+ (id)reminderMigrationContextWithReminderKitProvider:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithReminderKitProvider:v4];

  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    v7 = (void *)v5[14];
    v5[14] = v6;

    uint64_t v8 = objc_opt_new();
    v9 = (void *)v5[15];
    v5[15] = v8;

    uint64_t v10 = objc_opt_new();
    v11 = (void *)v5[16];
    v5[16] = v10;

    uint64_t v12 = objc_opt_new();
    v13 = (void *)v5[17];
    v5[17] = v12;

    uint64_t v14 = objc_opt_new();
    v15 = (void *)v5[19];
    v5[19] = v14;

    uint64_t v16 = objc_opt_new();
    v17 = (void *)v5[18];
    v5[18] = v16;

    if (([v5 _tryBeginMigration] & 1) == 0)
    {

      v5 = 0;
    }
  }
  return v5;
}

- (NSArray)storesToDisableReminders
{
  v2 = (void *)[(NSMutableArray *)self->_storesToDisableReminders copy];
  return (NSArray *)v2;
}

- (void)addStoreToDisableReminders:(void *)a3
{
}

- (NSArray)storesToDelete
{
  v2 = (void *)[(NSMutableArray *)self->_storesToDelete copy];
  return (NSArray *)v2;
}

- (void)addStoreToDelete:(void *)a3
{
  -[NSMutableArray addObject:](self->_storesToDelete, "addObject:");
  [(CalCalendarDatabaseReminderMigrationContext *)self _removeCalendarsToDeleteInStore:a3];
  storesToSetWasMigrated = self->_storesToSetWasMigrated;
  [(NSMutableArray *)storesToSetWasMigrated removeObject:a3];
}

- (NSArray)storesToSetWasMigrated
{
  v2 = (void *)[(NSMutableArray *)self->_storesToSetWasMigrated copy];
  return (NSArray *)v2;
}

- (void)addStoreToSetWasMigrated:(void *)a3
{
  if ((-[NSMutableArray containsObject:](self->_storesToDelete, "containsObject:") & 1) == 0)
  {
    storesToSetWasMigrated = self->_storesToSetWasMigrated;
    [(NSMutableArray *)storesToSetWasMigrated addObject:a3];
  }
}

- (NSArray)calendarsToDisableReminders
{
  v2 = (void *)[(NSMutableArray *)self->_calendarsToDisableReminders copy];
  return (NSArray *)v2;
}

- (void)addCalendarToDisableReminders:(void *)a3
{
}

- (NSArray)calendarsToClearSyncToken
{
  v2 = (void *)[(NSMutableArray *)self->_calendarsToClearSyncToken copy];
  return (NSArray *)v2;
}

- (void)addCalendarToClearSyncToken:(void *)a3
{
}

- (NSArray)calendarsToDelete
{
  v2 = (void *)[(NSMutableArray *)self->_calendarsToDelete copy];
  return (NSArray *)v2;
}

- (void)addCalendarToDelete:(void *)a3
{
  if (!-[CalCalendarDatabaseReminderMigrationContext _isCalendarOwnedByExistingStoreToDelete:](self, "_isCalendarOwnedByExistingStoreToDelete:"))
  {
    calendarsToDelete = self->_calendarsToDelete;
    [(NSMutableArray *)calendarsToDelete addObject:a3];
  }
}

- (void)_removeCalendarsToDeleteInStore:(void *)a3
{
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](self->_calendarsToDelete, "count"));
  calendarsToDelete = self->_calendarsToDelete;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__CalCalendarDatabaseReminderMigrationContext__removeCalendarsToDeleteInStore___block_invoke;
  v10[3] = &unk_2645A4560;
  uint64_t v12 = a3;
  v7 = v5;
  v11 = v7;
  [(NSMutableArray *)calendarsToDelete enumerateCalCalendarRefsUsingBlock:v10];
  uint64_t v8 = self->_calendarsToDelete;
  self->_calendarsToDelete = v7;
  v9 = v7;
}

void __79__CalCalendarDatabaseReminderMigrationContext__removeCalendarsToDeleteInStore___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (const void *)CalCalendarCopyStore();
  if (v3 != *(const void **)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v4];
  }
  if (v3) {
    CFRelease(v3);
  }
}

- (BOOL)_isCalendarOwnedByExistingStoreToDelete:(void *)a3
{
  uint64_t v4 = CalCalendarCopyStore();
  if (!v4) {
    return 0;
  }
  v5 = (const void *)v4;
  char v6 = [(NSMutableArray *)self->_storesToDelete containsObject:v4];
  CFRelease(v5);
  return v6;
}

- (id)privacySafePathForURLInCalendarDirectory:(id)a3
{
  return (id)[a3 path];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarsToDelete, 0);
  objc_storeStrong((id *)&self->_calendarsToClearSyncToken, 0);
  objc_storeStrong((id *)&self->_calendarsToDisableReminders, 0);
  objc_storeStrong((id *)&self->_storesToSetWasMigrated, 0);
  objc_storeStrong((id *)&self->_storesToDelete, 0);
  objc_storeStrong((id *)&self->_storesToDisableReminders, 0);
}

@end