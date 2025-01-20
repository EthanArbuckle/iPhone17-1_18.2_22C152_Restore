@interface CalDatabaseEnumerateUnconsumedObjectChangesForClient
@end

@implementation CalDatabaseEnumerateUnconsumedObjectChangesForClient

void ___CalDatabaseEnumerateUnconsumedObjectChangesForClient_block_invoke(uint64_t a1, uint64_t a2, int a3, int a4, void *a5, int a6)
{
  id v10 = a5;
  uint64_t v11 = 40;
  if (a4) {
    uint64_t v11 = 32;
  }
  id v12 = *(id *)(a1 + v11);
  if (a3 == 6)
  {
    id v13 = *(id *)(a1 + 48);

    v14 = (int *)(a1 + 72);
    if (*(_DWORD *)(a1 + 72))
    {
      id v12 = v13;
LABEL_9:
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = ___CalDatabaseEnumerateUnconsumedObjectChangesForClient_block_invoke_2;
      v20[3] = &unk_1E5D6D3A0;
      id v21 = v10;
      int v16 = *v14;
      int v22 = a6;
      int v23 = v16;
      v17 = (void *)MEMORY[0x1AD0E9DC0](v20);

      goto LABEL_12;
    }
    id v12 = v13;
  }
  else
  {
    v14 = (int *)(a1 + 72);
    int v15 = *(_DWORD *)(a1 + 72);
    if (a3 == 26 && v15) {
      goto LABEL_17;
    }
    if (v15) {
      goto LABEL_9;
    }
  }
  v17 = (void *)MEMORY[0x1AD0E9DC0](v10);
LABEL_12:
  uint64_t RecordStore = _CalDatabaseGetRecordStore(*(void *)(a1 + 64));
  if (CDBLockingAssertionsEnabled)
  {
    if (RecordStore)
    {
      Context = (const os_unfair_lock *)CPRecordStoreGetContext();
      if (Context) {
        os_unfair_lock_assert_owner(Context + 20);
      }
    }
  }
  CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithBindBlockAndProperties();

LABEL_17:
}

uint64_t ___CalDatabaseEnumerateUnconsumedObjectChangesForClient_block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v4 = *(sqlite3_stmt **)(a2 + 8);
  int v5 = *(_DWORD *)(a1 + 40);
  int v6 = *(_DWORD *)(a1 + 44);
  return sqlite3_bind_int(v4, v5, v6);
}

@end