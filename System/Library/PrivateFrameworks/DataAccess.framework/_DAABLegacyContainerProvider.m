@interface _DAABLegacyContainerProvider
- (BOOL)setLastSyncDateForContainer:(id)a3;
- (_DAABLegacyContainerProvider)initWithAddressBook:(void *)a3;
- (id)allContainers;
- (id)allContainersForAccountWithExternalIdentifier:(id)a3;
- (id)containerWithExternalIdentifier:(id)a3 forAccountWithExternalIdentifier:(id)a4;
- (id)createNewContainerWithType:(int)a3 name:(id)a4 externalIdentifier:(id)a5 constraintsPath:(id)a6 syncData:(id)a7 contentReadonly:(BOOL)a8 propertiesReadonly:(BOOL)a9 forAccount:(id)a10;
- (void)addressBook;
- (void)dealloc;
- (void)mergeAllRecordsIntoContainer:(id)a3 shouldInsertChangeHistoryRecords:(BOOL)a4;
- (void)setDefaultContainer:(id)a3 withLocalDBHelper:(id)a4 onlyIfNotSet:(BOOL)a5;
@end

@implementation _DAABLegacyContainerProvider

- (_DAABLegacyContainerProvider)initWithAddressBook:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_DAABLegacyContainerProvider;
  v4 = [(_DAABLegacyContainerProvider *)&v6 init];
  if (v4) {
    v4->_addressBook = (void *)CFRetain(a3);
  }
  return v4;
}

- (void)dealloc
{
  CFRelease(self->_addressBook);
  v3.receiver = self;
  v3.super_class = (Class)_DAABLegacyContainerProvider;
  [(_DAABLegacyContainerProvider *)&v3 dealloc];
}

- (id)containerWithExternalIdentifier:(id)a3 forAccountWithExternalIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_DAABLegacyContainerProvider *)self addressBook];
  v8 = (const void *)ABAddressBookCopySourceWithAccountAndExternalIdentifiers();

  if (v8)
  {
    v9 = [[DAABLegacyContainer alloc] initWithABSource:v8];
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)allContainers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(_DAABLegacyContainerProvider *)self addressBook];
  v2 = (void *)ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources();
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = [DAABLegacyContainer alloc];
        v11 = -[DAABLegacyContainer initWithABSource:](v10, "initWithABSource:", v9, (void)v13);
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)allContainersForAccountWithExternalIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_DAABLegacyContainerProvider *)self addressBook];
  uint64_t v5 = (void *)ABAddressBookCopyArrayOfAllSourcesWithAccountIdentifier();
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = [DAABLegacyContainer alloc];
        long long v14 = -[DAABLegacyContainer initWithABSource:](v13, "initWithABSource:", v12, (void)v16);
        [v6 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)createNewContainerWithType:(int)a3 name:(id)a4 externalIdentifier:(id)a5 constraintsPath:(id)a6 syncData:(id)a7 contentReadonly:(BOOL)a8 propertiesReadonly:(BOOL)a9 forAccount:(id)a10
{
  BOOL v23 = a8;
  id v15 = a10;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  v20 = (const void *)ABSourceCreate();
  [v15 legacyIdentifier];

  ABRecordSetIntValue();
  uint64_t v21 = [[DAABLegacyContainer alloc] initWithABSource:v20];
  [(DAABLegacyContainer *)v21 setType:a3];
  [(DAABLegacyContainer *)v21 setName:v19];

  [(DAABLegacyContainer *)v21 setExternalIdentifier:v18];
  [(DAABLegacyContainer *)v21 setConstraintsPath:v17];

  [(DAABLegacyContainer *)v21 setSyncData:v16];
  [(DAABLegacyContainer *)v21 setContentReadonly:v23];
  [(DAABLegacyContainer *)v21 setArePropertiesReadonly:a9];
  ABAddressBookAddRecord([(_DAABLegacyContainerProvider *)self addressBook], v20, 0);
  CFRelease(v20);
  return v21;
}

- (void)setDefaultContainer:(id)a3 withLocalDBHelper:(id)a4 onlyIfNotSet:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  uint64_t v8 = [(_DAABLegacyContainerProvider *)self addressBook];
  uint64_t v9 = [v7 asSource];

  MEMORY[0x1F4106D10](v8, v9, v5);
}

- (void)mergeAllRecordsIntoContainer:(id)a3 shouldInsertChangeHistoryRecords:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = (const void *)[v6 asSource];
    uint64_t v9 = DALoggingwithCategory();
    uint64_t v10 = v9;
    if (v8)
    {
      os_log_type_t v11 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
      if (os_log_type_enabled(v9, v11))
      {
        *(_DWORD *)buf = 67240192;
        BOOL v25 = v4;
        _os_log_impl(&dword_1BA384000, v10, v11, "About to mergeAllRecordsIntoContainer, shouldInsertChangeHistoryRecords: %{public}d ", buf, 8u);
      }

      [(_DAABLegacyContainerProvider *)self addressBook];
      if (ABAddressBookGetCountOfRecordsOutsideSource() >= 1)
      {
        [(_DAABLegacyContainerProvider *)self addressBook];
        CFArrayRef v12 = (const __CFArray *)ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources();
        if (v12)
        {
          CFArrayRef v13 = v12;
          CFIndex Count = CFArrayGetCount(v12);
          ABRecordID RecordID = ABRecordGetRecordID(v8);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __94___DAABLegacyContainerProvider_mergeAllRecordsIntoContainer_shouldInsertChangeHistoryRecords___block_invoke;
          v21[3] = &unk_1E6211C90;
          BOOL v23 = v4;
          ABRecordID v22 = RecordID;
          v21[4] = self;
          v21[5] = Count;
          v21[6] = v13;
          v21[7] = v8;
          uint64_t v16 = MEMORY[0x1BA9EA500](v21);
          id v17 = (void *)v16;
          if (v4)
          {
            [(_DAABLegacyContainerProvider *)self addressBook];
            ABChangeHistoryInsertUpdatesForRecordsFromBlockWithClientIdentifier();
          }
          else
          {
            (*(void (**)(uint64_t))(v16 + 16))(v16);
          }
          CFRelease(v13);
        }
      }
    }
    else
    {
      os_log_type_t v20 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
      if (os_log_type_enabled(v9, v20))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BA384000, v10, v20, "Could not derive an ABSource from DAContainer in -mergeAllRecordsIntoContainer:shouldInsertChangeHistoryRecords, aborting merge", buf, 2u);
      }
    }
  }
  else
  {
    id v18 = DALoggingwithCategory();
    os_log_type_t v19 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v18, v19))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA384000, v18, v19, "Nil container passed to -mergeAllRecordsIntoContainer:shouldInsertChangeHistoryRecords, aborting merge", buf, 2u);
    }
  }
}

- (BOOL)setLastSyncDateForContainer:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v5 = (const void *)[v3 asSource];
  ABPropertyID v6 = *MEMORY[0x1E4F49E30];
  id v7 = (void *)ABRecordCopyValue(v5, *MEMORY[0x1E4F49E30]);
  uint64_t v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  BOOL v10 = os_log_type_enabled(v8, v9);
  if (v7)
  {
    if (v10)
    {
      int v12 = 138543362;
      CFArrayRef v13 = v4;
      _os_log_impl(&dword_1BA384000, v8, v9, "Another sync finishing %{public}@, not setting lastSyncDate", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      int v12 = 138543362;
      CFArrayRef v13 = v4;
      _os_log_impl(&dword_1BA384000, v8, v9, "First sync finishing %{public}@, setting lastSyncDate", (uint8_t *)&v12, 0xCu);
    }

    ABRecordSetValue((ABRecordRef)[v3 asSource], v6, v4, 0);
  }

  return v7 == 0;
}

- (void)addressBook
{
  return self->_addressBook;
}

@end