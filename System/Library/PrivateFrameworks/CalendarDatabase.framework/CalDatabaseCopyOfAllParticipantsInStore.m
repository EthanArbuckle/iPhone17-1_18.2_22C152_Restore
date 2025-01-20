@interface CalDatabaseCopyOfAllParticipantsInStore
@end

@implementation CalDatabaseCopyOfAllParticipantsInStore

uint64_t ___CalDatabaseCopyOfAllParticipantsInStore_block_invoke(uint64_t a1, uint64_t a2)
{
  return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(a1 + 32));
}

uint64_t ___CalDatabaseCopyOfAllParticipantsInStore_block_invoke_2(uint64_t a1, uint64_t a2)
{
  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, *(_DWORD *)(a1 + 40));
  v3 = *(sqlite3_stmt **)(a2 + 8);
  int ID = CPRecordGetID();
  return sqlite3_bind_int(v3, 2, ID);
}

@end