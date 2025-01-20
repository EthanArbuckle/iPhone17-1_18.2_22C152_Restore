@interface BSSqliteDeferredPreparedSimpleStatement
@end

@implementation BSSqliteDeferredPreparedSimpleStatement

void __87___BSSqliteDeferredPreparedSimpleStatement_executeWithBindings_resultRowHandler_error___block_invoke(uint64_t *a1, sqlite3 *a2)
{
  v3 = *(void **)(a1[4] + 24);
  if (v3)
  {
    v5 = (const char *)[v3 UTF8String];
    pzTail = 0;
    ppStmt = 0;
    int v6 = strlen(v5);
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = sqlite3_prepare_v2(a2, v5, v6, &ppStmt, (const char **)&pzTail);
    if (!*(_DWORD *)(*(void *)(a1[5] + 8) + 24))
    {
      if (pzTail)
      {
        if (*pzTail)
        {
          v10 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], *(void *)(a1[4] + 24), pzTail);
        }
      }
      *(void *)(a1[4] + 16) = ppStmt;
      uint64_t v7 = a1[4];
      v8 = *(void **)(v7 + 24);
      *(void *)(v7 + 24) = 0;

      id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
      -[BSSqliteDatabaseConnection addObserver:]((uint64_t)WeakRetained, a1[4]);
    }
  }
}

@end