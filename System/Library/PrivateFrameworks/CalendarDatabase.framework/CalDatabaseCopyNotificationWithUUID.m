@interface CalDatabaseCopyNotificationWithUUID
@end

@implementation CalDatabaseCopyNotificationWithUUID

uint64_t ___CalDatabaseCopyNotificationWithUUID_block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(sqlite3_stmt **)(a2 + 8);
  CStringFromCFString = (const char *)CalCreateCStringFromCFString(*(const __CFString **)(a1 + 32));
  sqlite3_bind_text(v4, 1, CStringFromCFString, -1, MEMORY[0x1E4F14838]);
  v6 = *(sqlite3_stmt **)(a2 + 8);
  int v7 = *(_DWORD *)(a1 + 40);
  return sqlite3_bind_int(v6, 2, v7);
}

@end