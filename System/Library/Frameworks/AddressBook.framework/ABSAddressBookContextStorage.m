@interface ABSAddressBookContextStorage
- (ABSAddressBookContextStorage)init;
- (BOOL)addMemberRecord:(id)a3 toRecord:(id)a4;
- (BOOL)addRecord:(id)a3;
- (BOOL)deleteRecord:(id)a3;
- (BOOL)hasUnsavedChanges;
- (BOOL)recordUpdated:(id)a3;
- (BOOL)removeMemberRecord:(id)a3 fromRecord:(id)a4;
- (NSArray)recordsWithPendingMembershipAdditions;
- (NSArray)recordsWithPendingMembershipDeletions;
- (NSMutableArray)insertedRecords;
- (NSMutableDictionary)addedMemberships;
- (NSMutableDictionary)deletedMemberships;
- (NSMutableDictionary)deletedRecords;
- (NSMutableDictionary)records;
- (NSMutableDictionary)revertedRecords;
- (NSMutableDictionary)updatedRecords;
- (id)addedMembersForRecord:(id)a3;
- (id)cnImplFetched:(id)a3 creationBlock:(id)a4;
- (id)recordFetched:(id)a3;
- (id)removedMembersForRecord:(id)a3;
- (void)_resetIncludingLivingRecords:(BOOL)a3;
- (void)commitPendingChanges;
- (void)revert;
- (void)setHasUnsavedChanges:(BOOL)a3;
@end

@implementation ABSAddressBookContextStorage

- (ABSAddressBookContextStorage)init
{
  v19.receiver = self;
  v19.super_class = (Class)ABSAddressBookContextStorage;
  v2 = [(ABSAddressBookContextStorage *)&v19 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    addedMemberships = v2->_addedMemberships;
    v2->_addedMemberships = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    records = v2->_records;
    v2->_records = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    deletedRecords = v2->_deletedRecords;
    v2->_deletedRecords = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    updatedRecords = v2->_updatedRecords;
    v2->_updatedRecords = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    insertedRecords = v2->_insertedRecords;
    v2->_insertedRecords = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    deletedMemberships = v2->_deletedMemberships;
    v2->_deletedMemberships = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    revertedRecords = v2->_revertedRecords;
    v2->_revertedRecords = v15;

    v17 = v2;
  }

  return v2;
}

- (BOOL)addRecord:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6 = [(ABSAddressBookContextStorage *)self insertedRecords];
    [v6 addObject:v5];

    [(ABSAddressBookContextStorage *)self setHasUnsavedChanges:1];
  }
  return a3 != 0;
}

- (BOOL)recordUpdated:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "id"));
  v6 = [(ABSAddressBookContextStorage *)self records];
  id v7 = [v6 objectForKey:v5];

  BOOL v8 = v7 == v4;
  if (v7 == v4)
  {
    if (!v4)
    {
      BOOL v8 = 0;
      goto LABEL_5;
    }
    v9 = [(ABSAddressBookContextStorage *)self updatedRecords];
    [v9 setObject:v4 forKey:v5];

    [(ABSAddressBookContextStorage *)self setHasUnsavedChanges:1];
    id v7 = v4;
  }

LABEL_5:
  return v8;
}

- (id)cnImplFetched:(id)a3 creationBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if ([v6 iOSLegacyIdentifier] == -1)
  {
    v15 = +[ABSLog log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ABSAddressBookContextStorage cnImplFetched:creationBlock:](v15);
    }

    v10 = 0;
  }
  else
  {
    BOOL v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "iOSLegacyIdentifier"));
    v9 = [(ABSAddressBookContextStorage *)self records];
    v10 = [v9 objectForKey:v8];

    if (!v10)
    {
      v11 = [(ABSAddressBookContextStorage *)self revertedRecords];
      v12 = [v11 objectForKey:v8];

      if (v12)
      {
        v13 = [(ABSAddressBookContextStorage *)self revertedRecords];
        [v13 removeObjectForKey:v8];

        [v12 replaceRecordStorageWithCNObject:v6];
        id v14 = v12;
      }
      else
      {
        v7[2](v7, v6);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v14;
      v16 = [(ABSAddressBookContextStorage *)self records];
      [v16 setObject:v10 forKey:v8];
    }
  }

  return v10;
}

- (id)recordFetched:(id)a3
{
  id v4 = a3;
  if ([v4 id] == -1)
  {
    NSLog(&cfstr_RecordWithInva.isa);
  }
  else
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "id"));
    if (v4)
    {
      id v6 = [(ABSAddressBookContextStorage *)self records];
      id v7 = [v6 objectForKey:v5];

      if (!v7)
      {
        BOOL v8 = [(ABSAddressBookContextStorage *)self revertedRecords];
        v9 = [v8 objectForKey:v5];

        if (v9)
        {
          v10 = [(ABSAddressBookContextStorage *)self revertedRecords];
          [v10 removeObjectForKey:v5];

          v11 = [v4 cnImpl];
          [v9 replaceRecordStorageWithCNObject:v11];

          id v12 = v9;
          id v4 = v12;
        }
        v13 = [(ABSAddressBookContextStorage *)self records];
        [v13 setObject:v4 forKey:v5];
      }
    }
  }

  return v4;
}

- (BOOL)deleteRecord:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "id"));
  id v6 = [(ABSAddressBookContextStorage *)self records];
  id v7 = [v6 objectForKey:v5];

  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v7)
  {
    v9 = [(ABSAddressBookContextStorage *)self insertedRecords];
    uint64_t v10 = [v9 indexOfObject:v4];

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = 0;
    }
    else
    {
      v11 = [(ABSAddressBookContextStorage *)self insertedRecords];
      id v7 = [v11 objectAtIndex:v10];

      uint64_t v8 = v10;
    }
  }
  BOOL v12 = v7 == v4;
  if (v7 != v4) {
    goto LABEL_12;
  }
  if (v4)
  {
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = [(ABSAddressBookContextStorage *)self records];
      [v13 removeObjectForKey:v5];

      id v14 = [(ABSAddressBookContextStorage *)self deletedRecords];
      [v14 setObject:v4 forKey:v5];
    }
    else
    {
      id v14 = [(ABSAddressBookContextStorage *)self insertedRecords];
      [v14 removeObjectAtIndex:v8];
    }

    [(ABSAddressBookContextStorage *)self setHasUnsavedChanges:1];
    id v7 = v4;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (BOOL)addMemberRecord:(id)a3 toRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "id"));
  v9 = [v6 CNIdentifierString];
  BOOL v10 = 0;
  if (v6 && v7)
  {
    v11 = [(ABSAddressBookContextStorage *)self records];
    id v12 = [v11 objectForKey:v8];

    if (v12 == v7)
    {
      v13 = [(ABSAddressBookContextStorage *)self addedMemberships];
      id v14 = [v13 objectForKey:v8];

      if (!v14)
      {
        id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        v15 = [(ABSAddressBookContextStorage *)self addedMemberships];
        [v15 setObject:v14 forKey:v8];
      }
      v16 = [v14 objectForKey:v9];
      BOOL v10 = v16 == 0;

      [v14 setObject:v6 forKey:v9];
      v17 = [(ABSAddressBookContextStorage *)self deletedMemberships];
      v18 = [v17 objectForKey:v8];

      [v18 removeObjectForKey:v9];
      [(ABSAddressBookContextStorage *)self setHasUnsavedChanges:1];
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (BOOL)removeMemberRecord:(id)a3 fromRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "id"));
  v9 = [v6 CNIdentifierString];
  BOOL v10 = 0;
  if (v6 && v7)
  {
    v11 = [(ABSAddressBookContextStorage *)self records];
    id v12 = [v11 objectForKey:v8];

    if (v12 == v7)
    {
      v13 = [(ABSAddressBookContextStorage *)self deletedMemberships];
      id v14 = [v13 objectForKey:v8];

      if (!v14)
      {
        id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        v15 = [(ABSAddressBookContextStorage *)self deletedMemberships];
        [v15 setObject:v14 forKey:v8];
      }
      v16 = [v14 objectForKey:v9];
      BOOL v10 = v16 == 0;

      [v14 setObject:v6 forKey:v9];
      v17 = [(ABSAddressBookContextStorage *)self addedMemberships];
      v18 = [v17 objectForKey:v8];

      [v18 removeObjectForKey:v9];
      [(ABSAddressBookContextStorage *)self setHasUnsavedChanges:1];
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (NSArray)recordsWithPendingMembershipAdditions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(ABSAddressBookContextStorage *)self addedMemberships];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__ABSAddressBookContextStorage_recordsWithPendingMembershipAdditions__block_invoke;
  v9[3] = &unk_264223E08;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v6 = v10;
  id v7 = (NSArray *)v5;

  return v7;
}

void __69__ABSAddressBookContextStorage_recordsWithPendingMembershipAdditions__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 records];
  id v7 = [v5 objectForKey:v4];

  id v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v7];
    id v6 = v7;
  }
}

- (NSArray)recordsWithPendingMembershipDeletions
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(ABSAddressBookContextStorage *)self deletedMemberships];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__ABSAddressBookContextStorage_recordsWithPendingMembershipDeletions__block_invoke;
  v9[3] = &unk_264223E08;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v6 = v10;
  id v7 = (NSArray *)v5;

  return v7;
}

void __69__ABSAddressBookContextStorage_recordsWithPendingMembershipDeletions__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 records];
  id v7 = [v5 objectForKey:v4];

  id v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v7];
    id v6 = v7;
  }
}

- (id)addedMembersForRecord:(id)a3
{
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "id"));
  id v5 = [(ABSAddressBookContextStorage *)self addedMemberships];
  id v6 = [v5 objectForKey:v4];
  id v7 = [v6 allValues];

  return v7;
}

- (id)removedMembersForRecord:(id)a3
{
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "id"));
  id v5 = [(ABSAddressBookContextStorage *)self deletedMemberships];
  id v6 = [v5 objectForKey:v4];
  id v7 = [v6 allValues];

  return v7;
}

- (void)_resetIncludingLivingRecords:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ABSAddressBookContextStorage *)self deletedRecords];
  [v5 removeAllObjects];

  id v6 = [(ABSAddressBookContextStorage *)self insertedRecords];
  [v6 removeAllObjects];

  id v7 = [(ABSAddressBookContextStorage *)self updatedRecords];
  [v7 removeAllObjects];

  uint64_t v8 = [(ABSAddressBookContextStorage *)self deletedMemberships];
  [v8 removeAllObjects];

  v9 = [(ABSAddressBookContextStorage *)self addedMemberships];
  [v9 removeAllObjects];

  if (v3)
  {
    id v10 = [(ABSAddressBookContextStorage *)self records];
    [v10 removeAllObjects];
  }

  [(ABSAddressBookContextStorage *)self setHasUnsavedChanges:0];
}

- (void)commitPendingChanges
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v3 = [(ABSAddressBookContextStorage *)self insertedRecords];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v8 id] != -1)
        {
          v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "id"));
          id v10 = [(ABSAddressBookContextStorage *)self records];
          [v10 setObject:v8 forKey:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = [(ABSAddressBookContextStorage *)self deletedRecords];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        if ([v16 intValue] != -1)
        {
          v17 = [(ABSAddressBookContextStorage *)self records];
          [v17 removeObjectForKey:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  [(ABSAddressBookContextStorage *)self _resetIncludingLivingRecords:0];
}

- (void)revert
{
  BOOL v3 = [(ABSAddressBookContextStorage *)self records];
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_8];

  uint64_t v4 = [(ABSAddressBookContextStorage *)self revertedRecords];
  uint64_t v5 = [(ABSAddressBookContextStorage *)self records];
  [v4 addEntriesFromDictionary:v5];

  uint64_t v6 = [(ABSAddressBookContextStorage *)self deletedRecords];
  [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_7_0];

  id v7 = [(ABSAddressBookContextStorage *)self revertedRecords];
  uint64_t v8 = [(ABSAddressBookContextStorage *)self deletedRecords];
  [v7 addEntriesFromDictionary:v8];

  [(ABSAddressBookContextStorage *)self _resetIncludingLivingRecords:1];
}

uint64_t __38__ABSAddressBookContextStorage_revert__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 replaceRecordStorageWithCNObject:0];
}

uint64_t __38__ABSAddressBookContextStorage_revert__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 replaceRecordStorageWithCNObject:0];
}

- (NSMutableDictionary)records
{
  return self->_records;
}

- (NSMutableDictionary)deletedRecords
{
  return self->_deletedRecords;
}

- (NSMutableArray)insertedRecords
{
  return self->_insertedRecords;
}

- (NSMutableDictionary)updatedRecords
{
  return self->_updatedRecords;
}

- (BOOL)hasUnsavedChanges
{
  return self->_hasUnsavedChanges;
}

- (void)setHasUnsavedChanges:(BOOL)a3
{
  self->_hasUnsavedChanges = a3;
}

- (NSMutableDictionary)deletedMemberships
{
  return self->_deletedMemberships;
}

- (NSMutableDictionary)addedMemberships
{
  return self->_addedMemberships;
}

- (NSMutableDictionary)revertedRecords
{
  return self->_revertedRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revertedRecords, 0);
  objc_storeStrong((id *)&self->_addedMemberships, 0);
  objc_storeStrong((id *)&self->_deletedMemberships, 0);
  objc_storeStrong((id *)&self->_updatedRecords, 0);
  objc_storeStrong((id *)&self->_insertedRecords, 0);
  objc_storeStrong((id *)&self->_deletedRecords, 0);

  objc_storeStrong((id *)&self->_records, 0);
}

- (void)cnImplFetched:(os_log_t)log creationBlock:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_214A03000, log, OS_LOG_TYPE_ERROR, "Record with invalid id attempted merge into ABS context cache", v1, 2u);
}

@end