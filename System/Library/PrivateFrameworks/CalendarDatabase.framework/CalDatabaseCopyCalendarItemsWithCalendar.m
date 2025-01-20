@interface CalDatabaseCopyCalendarItemsWithCalendar
@end

@implementation CalDatabaseCopyCalendarItemsWithCalendar

uint64_t ___CalDatabaseCopyCalendarItemsWithCalendar_block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(sqlite3_stmt **)(a2 + 8);
  int ID = CPRecordGetID();
  uint64_t result = sqlite3_bind_int(v4, 1, ID);
  int v7 = *(_DWORD *)(a1 + 40);
  if (v7 != -1)
  {
    v8 = *(sqlite3_stmt **)(a2 + 8);
    return sqlite3_bind_int(v8, 2, v7);
  }
  return result;
}

@end