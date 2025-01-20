@interface CalEventOccurrenceCacheProcessEventOccurrencesInDateRange
@end

@implementation CalEventOccurrenceCacheProcessEventOccurrencesInDateRange

void ___CalEventOccurrenceCacheProcessEventOccurrencesInDateRange_block_invoke(uint64_t a1)
{
  if (__CalDatabaseBeginReadTransaction(*(void *)(*(void *)(a1 + 104) + 24), (uint64_t)"read at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:2671"))
  {
    if (*(unsigned char *)(a1 + 128))
    {
      uint64_t v2 = _CalEventOccurrenceCacheCreateOccurrenceCacheRange(*(void **)(a1 + 104));
      uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
      v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = v2;
    }
    v5 = _CalEventOccurrenceCacheGetCacheCalendar(*(void *)(a1 + 104));
    if (*(unsigned char *)(a1 + 129)) {
      goto LABEL_5;
    }
    uint64_t v44 = *(void *)(a1 + 104);
    _CalEventOccurrenceCacheLoadInfo(v44);
    id v45 = *(id *)(v44 + 40);
    id v46 = *(id *)(v44 + 48);
    id v47 = v45;
    id v48 = v46;
    v49 = [v5 timeZone];
    if (([v47 isAfterDate:*(void *)(a1 + 32)] & 1) == 0
      && ([v48 isBeforeDate:*(void *)(a1 + 40)] & 1) == 0)
    {
      if (([*(id *)(a1 + 48) isEqualToTimeZone:v49] & 1) == 0)
      {
        v50 = [*(id *)(a1 + 32) dateInTimeZone:v49 fromTimeZone:*(void *)(a1 + 48)];
        v51 = [*(id *)(a1 + 40) dateInTimeZone:v49 fromTimeZone:*(void *)(a1 + 48)];
        if ([v47 isAfterDate:v50])
        {

          goto LABEL_53;
        }
        int v54 = [v48 isBeforeDate:v51];

        if (v54) {
          goto LABEL_53;
        }
      }

LABEL_5:
      uint64_t RecordStore = _CalDatabaseGetRecordStore(*(void *)(*(void *)(a1 + 104) + 24));
      if (CDBLockingAssertionsEnabled) {
        BOOL v7 = RecordStore == 0;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7)
      {
        Context = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (Context) {
          os_unfair_lock_assert_owner(Context + 20);
        }
      }
      uint64_t Database = CPRecordStoreGetDatabase();
      if (Database)
      {
        uint64_t v10 = Database;
        *(void *)buf = @"SELECT event_id, IFNULL(occurrence_start_date, occurrence_date) AS fetched_occurrence_start_date, occurrence_end_date FROM OccurrenceCache";
        v61 = @"day >= ? AND day < ?";
        v62 = @"GROUP BY event_id, fetched_occurrence_start_date";
        uint64_t v63 = 0;
        LODWORD(v63) = *(_DWORD *)(a1 + 120);
        v11 = _CalFilterCopyQuery(*(void **)(a1 + 112));
        if (CDBLockingAssertionsEnabled)
        {
          if (*(void *)(v10 + 104))
          {
            v12 = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (v12) {
              os_unfair_lock_assert_owner(v12 + 20);
            }
          }
        }
        uint64_t v13 = CPSqliteDatabaseStatementForReading();
        if (v13)
        {
          v14 = (uint64_t **)v13;
          v15 = [v5 startOfDayForDate:*(void *)(a1 + 32)];
          v16 = *(void **)(a1 + 32);
          v17 = [v5 timeZone];
          v18 = [v16 dateInTimeZone:v17 fromTimeZone:*(void *)(a1 + 48)];

          v55 = v18;
          if ([v18 CalIsBeforeDate:v15])
          {
            uint64_t v19 = [v15 dateByAddingDays:-1 inCalendar:v5];

            v15 = (void *)v19;
          }
          v20 = [v5 components:30 fromDate:*(void *)(a1 + 40)];
          [v20 setHour:23];
          [v20 setMinute:59];
          [v20 setSecond:59];
          v21 = [v5 dateFromComponents:v20];
          v22 = *(void **)(a1 + 40);
          v23 = [v5 timeZone];
          v24 = [v22 dateInTimeZone:v23 fromTimeZone:*(void *)(a1 + 48)];

          if ([v24 CalIsAfterDate:v21])
          {
            uint64_t v25 = [v21 dateByAddingDays:1 inCalendar:v5];

            v21 = (void *)v25;
          }
          v26 = (sqlite3_stmt *)v14[1];
          [v15 timeIntervalSinceReferenceDate];
          sqlite3_bind_double(v26, 1, v27);
          v28 = (sqlite3_stmt *)v14[1];
          [v21 timeIntervalSinceReferenceDate];
          sqlite3_bind_double(v28, 2, v29);
          if (!*(_DWORD *)(a1 + 124)) {
            *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = CFSetCreateMutable(0, 0, 0);
          }
          *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = CFArrayCreateMutable(0, 0, 0);
          v30 = [*(id *)(a1 + 32) earlierDate:v55];
          v31 = [*(id *)(a1 + 40) laterDate:v24];
          uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
          *(void *)v56 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
          uint64_t v57 = v32;
          [v30 timeIntervalSinceReferenceDate];
          uint64_t v58 = v33;
          [v31 timeIntervalSinceReferenceDate];
          uint64_t v59 = v34;
          if (CDBLockingAssertionsEnabled)
          {
            if (*v14)
            {
              uint64_t v35 = **v14;
              if (v35)
              {
                if (*(void *)(v35 + 104))
                {
                  v36 = (const os_unfair_lock *)CPRecordStoreGetContext();
                  if (v36) {
                    os_unfair_lock_assert_owner(v36 + 20);
                  }
                }
              }
            }
          }
          CPSqliteStatementSendResults();
          if (CDBLockingAssertionsEnabled)
          {
            if (*v14)
            {
              uint64_t v37 = **v14;
              if (v37)
              {
                if (*(void *)(v37 + 104))
                {
                  v38 = (const os_unfair_lock *)CPRecordStoreGetContext();
                  if (v38) {
                    os_unfair_lock_assert_owner(v38 + 20);
                  }
                }
              }
            }
          }
          CPSqliteStatementReset();
          uint64_t v39 = [v5 timeZone];
          uint64_t v40 = *(void *)(*(void *)(a1 + 88) + 8);
          v41 = *(void **)(v40 + 40);
          *(void *)(v40 + 40) = v39;

          *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = _CalEventOccurrenceCacheCopyBatchOfEvents(*(void *)(a1 + 104), *(const __CFSet **)(*(void *)(*(void *)(a1 + 72) + 8)+ 24), *(const __CFArray **)(*(void *)(*(void *)(a1 + 80) + 8)+ 24), 0, *(_DWORD *)(a1 + 124), *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 88)+ 8)+ 40), *(void **)(a1 + 48));
          if (!*(_DWORD *)(a1 + 124))
          {
            CFArrayRef v42 = *(const __CFArray **)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
            v64.length = CFArrayGetCount(v42);
            v64.location = 0;
            CFArraySortValues(v42, v64, (CFComparatorFunction)_CompareCalEventOccurrences, *(void **)(*(void *)(a1 + 104) + 24));
          }
          v43 = *(const void **)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
          if (v43) {
            CFRelease(v43);
          }
        }
        else
        {
          v53 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v56 = 0;
            _os_log_impl(&dword_1A8E81000, v53, OS_LOG_TYPE_ERROR, "Failed to get SQL statement when fetching event occurrences", v56, 2u);
          }
        }
        if (v11) {
          CFRelease(v11);
        }
      }
      else
      {
        v52 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A8E81000, v52, OS_LOG_TYPE_ERROR, "Failed to get db handle when fetching event occurrences", buf, 2u);
        }
      }
      __CalDatabaseRollbackTransaction(*(void *)(*(void *)(a1 + 104) + 24), (uint64_t)"rollback at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:2782");
      goto LABEL_54;
    }
LABEL_53:
    __CalDatabaseRollbackTransaction(*(void *)(*(void *)(a1 + 104) + 24), (uint64_t)"rollback at /Library/Caches/com.apple.xbs/Sources/CalendarDatabase/CalendarDatabase/CalEventOccurrenceCache.m:2699");
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_54:
  }
}

__CFArray *___CalEventOccurrenceCacheProcessEventOccurrencesInDateRange_block_invoke_440(uint64_t a1)
{
  result = _CalEventOccurrenceCacheCopyBatchOfEvents(*(void *)(a1 + 80), 0, *(const __CFArray **)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(a1 + 88), *(_DWORD *)(a1 + 96), *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(void **)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

@end