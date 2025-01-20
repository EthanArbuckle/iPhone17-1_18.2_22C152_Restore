@interface CalStoreMoveAsideLocalStore
@end

@implementation CalStoreMoveAsideLocalStore

uint64_t ___CalStoreMoveAsideLocalStore_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)&v20[5] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", a2, @"%i%i", 0, *(unsigned int *)(a1 + 40), 1);
  uint64_t v4 = *(void *)(a1 + 32);
  if (CDBLockingAssertionsEnabled) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (*(void *)v4)
    {
      if (*(void *)(*(void *)v4 + 104))
      {
        Context = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (Context) {
          os_unfair_lock_assert_owner(Context + 20);
        }
      }
    }
  }
  v7 = (uint64_t **)CPSqliteConnectionStatementForSQL();
  if (v7)
  {
    v8 = v7;
    if (CDBLockingAssertionsEnabled)
    {
      if (*v7)
      {
        uint64_t v9 = **v7;
        if (v9)
        {
          if (*(void *)(v9 + 104))
          {
            v10 = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (v10) {
              os_unfair_lock_assert_owner(v10 + 20);
            }
          }
        }
      }
    }
    int v11 = CPSqliteStatementPerform();
    if (CDBLockingAssertionsEnabled)
    {
      if (*v8)
      {
        uint64_t v12 = **v8;
        if (v12)
        {
          if (*(void *)(v12 + 104))
          {
            v13 = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (v13) {
              os_unfair_lock_assert_owner(v13 + 20);
            }
          }
        }
      }
    }
    CPSqliteStatementReset();
    if (v11) {
      BOOL v14 = v11 == 101;
    }
    else {
      BOOL v14 = 1;
    }
    uint64_t v15 = v14;
    if (v11)
    {
      if (v11 != 101)
      {
        v16 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          v20[0] = v11;
          LOWORD(v20[1]) = 2114;
          *(void *)((char *)&v20[1] + 2) = v3;
          _os_log_impl(&dword_1A8E81000, v16, OS_LOG_TYPE_ERROR, "Unexpected result %i for sql \"%{public}@\"", buf, 0x12u);
        }
      }
    }
  }
  else
  {
    v17 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v20 = v3;
      _os_log_impl(&dword_1A8E81000, v17, OS_LOG_TYPE_ERROR, "Couldn't get statement for sql \"%{public}@\"", buf, 0xCu);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

@end