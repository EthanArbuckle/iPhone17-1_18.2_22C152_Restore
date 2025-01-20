@interface CalEventPrepareForSave
@end

@implementation CalEventPrepareForSave

void ___CalEventPrepareForSave_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (CDBLockingAssertionsEnabled) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    if (*(void *)v2)
    {
      if (*(void *)(*(void *)v2 + 104))
      {
        Context = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (Context) {
          os_unfair_lock_assert_owner(Context + 20);
        }
      }
    }
  }
  uint64_t v5 = CPSqliteConnectionStatementForSQL();
  if (v5)
  {
    v6 = (uint64_t **)v5;
    CStringFromCFString = (const char *)CalCreateCStringFromCFString(*(const __CFString **)(a1 + 40));
    v8 = (const char *)CalCreateCStringFromCFString(*(const __CFString **)(a1 + 48));
    v9 = (sqlite3_stmt *)v6[1];
    int ID = CPRecordGetID();
    sqlite3_bind_int(v9, 1, ID);
    sqlite3_bind_int((sqlite3_stmt *)v6[1], 2, 1);
    v11 = (sqlite3_stmt *)v6[1];
    int EntityType = _CalCalendarItemGetEntityType(*(void *)(a1 + 56));
    sqlite3_bind_int(v11, 3, EntityType);
    v13 = (sqlite3_stmt *)v6[1];
    uint64_t Store = CPRecordGetStore();
    if (CDBLockingAssertionsEnabled) {
      BOOL v15 = Store == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      v16 = (const os_unfair_lock *)CPRecordStoreGetContext();
      if (v16) {
        os_unfair_lock_assert_owner(v16 + 20);
      }
    }
    int LastSequenceNumber = CPRecordStoreGetLastSequenceNumber();
    sqlite3_bind_int(v13, 4, LastSequenceNumber);
    sqlite3_bind_int((sqlite3_stmt *)v6[1], 5, *(_DWORD *)(a1 + 64));
    sqlite3_bind_int((sqlite3_stmt *)v6[1], 6, *(_DWORD *)(a1 + 68));
    sqlite3_bind_int((sqlite3_stmt *)v6[1], 7, *(_DWORD *)(a1 + 72));
    v18 = (void (__cdecl *)(void *))MEMORY[0x1E4F14838];
    sqlite3_bind_text((sqlite3_stmt *)v6[1], 8, CStringFromCFString, -1, MEMORY[0x1E4F14838]);
    sqlite3_bind_text((sqlite3_stmt *)v6[1], 9, v8, -1, v18);
    if (CDBLockingAssertionsEnabled)
    {
      if (*v6)
      {
        uint64_t v19 = **v6;
        if (v19)
        {
          if (*(void *)(v19 + 104))
          {
            v20 = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (v20) {
              os_unfair_lock_assert_owner(v20 + 20);
            }
          }
        }
      }
    }
    CPSqliteStatementPerform();
    if (CDBLockingAssertionsEnabled)
    {
      if (*v6)
      {
        uint64_t v21 = **v6;
        if (v21)
        {
          if (*(void *)(v21 + 104))
          {
            v22 = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (v22) {
              os_unfair_lock_assert_owner(v22 + 20);
            }
          }
        }
      }
    }
    CPSqliteStatementReset();
  }
  CFRelease(@"INSERT INTO CalendarItemChanges (record, type, entity_type, sequence_number, store_id, calendar_id, old_calendar_id, external_id, old_external_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
  v23 = *(const void **)(a1 + 40);
  if (v23) {
    CFRelease(v23);
  }
  v24 = *(const void **)(a1 + 48);
  if (v24)
  {
    CFRelease(v24);
  }
}

@end