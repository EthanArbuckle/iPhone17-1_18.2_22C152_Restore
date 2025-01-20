@interface SGMIDomainCountingTable
+ (id)_escapedSQLIdentifier:(id)a3;
+ (id)domainByAppendingToken:(id)a3 toDomain:(id)a4;
+ (id)domainForStringTokens:(id)a3;
+ (id)stringTokensFromDomain:(id)a3;
+ (void)createTableNamed:(id)a3 inDatabase:(id)a4;
- (BOOL)_hasColumn:(id)a3;
- (BOOL)_removeColumnFromTotal:(id)a3;
- (BOOL)_zeroColumn:(id)a3;
- (SGMIDomainCountingTable)initWithDatabase:(id)a3 tableName:(id)a4;
- (id)_currentColumns;
- (id)_parentDomainsForDomain:(id)a3;
- (id)_readCurrentColumnsUncached;
- (id)firstNonZeroColumnForDomain:(id)a3 withColumns:(id)a4;
- (id)firstNonZeroColumnForDomains:(id)a3 withColumns:(id)a4;
- (id)nonZeroColumnsForDomain:(id)a3 withColumns:(id)a4;
- (id)nonZeroColumnsForDomains:(id)a3 withColumns:(id)a4;
- (id)totalsForDomains:(id)a3;
- (int64_t)countForColumn:(id)a3 domain:(id)a4;
- (int64_t)totalForDomain:(id)a3;
- (unint64_t)_domainSegmentCount:(id)a3;
- (unint64_t)numberOfRowsAssociatedWithDomain:(id)a3;
- (void)_addColumn:(id)a3;
- (void)_commitDomainsAndCounts:(id)a3 toColumn:(id)a4;
- (void)_deleteZeroRows;
- (void)_dropColumn:(id)a3;
- (void)_mergeColumn:(id)a3 intoColumn:(id)a4;
- (void)_recycleColumn:(id)a3 asColumn:(id)a4;
- (void)_updateSchemaVersion;
- (void)addColumn:(id)a3;
- (void)commitDomainsAndCounts:(id)a3 toColumn:(id)a4;
- (void)commitDomainsCountedSet:(id)a3 toColumn:(id)a4;
- (void)deleteAllRows;
- (void)deleteDomain:(id)a3;
- (void)deleteDomainSelection:(id)a3;
- (void)deleteDomainSelection:(id)a3 keepingDomainsPassingTest:(id)a4;
- (void)dropColumn:(id)a3;
- (void)enumerateChildrenOfDomain:(id)a3 depth:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateChildrenOfDomain:(id)a3 greaterThan:(id)a4 depth:(unint64_t)a5 limit:(id)a6 usingBlock:(id)a7;
- (void)mergeColumn:(id)a3 intoColumn:(id)a4;
- (void)recycleColumn:(id)a3 asColumn:(id)a4;
- (void)zeroColumn:(id)a3;
@end

@implementation SGMIDomainCountingTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_tableNameEscaped, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)deleteAllRows
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__SGMIDomainCountingTable_deleteAllRows__block_invoke;
  v3[3] = &unk_1E65BEF88;
  v3[4] = self;
  [(_PASSqliteDatabase *)db writeTransaction:v3];
}

void __40__SGMIDomainCountingTable_deleteAllRows__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  id v2 = (id)[[NSString alloc] initWithFormat:@"DELETE FROM %@", *(void *)(*(void *)(a1 + 32) + 24)];
  [v1 prepAndRunQuery:v2 onPrep:0 onRow:0 onError:0];
}

- (void)deleteDomain:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F93B20];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithDomain:v5];

  [(SGMIDomainCountingTable *)self deleteDomainSelection:v6];
}

- (void)deleteDomainSelection:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 allDomains];
    db = self->_db;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke;
    v8[3] = &unk_1E65BFD88;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    [(_PASSqliteDatabase *)db writeTransaction:v8];
  }
}

void __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v47 = a1;
  v1 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM %@ WHERE (domain >= ?1 || '.') AND (domain < ?1 || '/')", *(void *)(*(void *)(a1 + 32) + 24)];
  objc_msgSend(v1, "_pas_stringBackedByUTF8CString");
  id v46 = (id)objc_claimAutoreleasedReturnValue();

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v2 = *(id *)(v47 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v67 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        id v7 = *(void **)(*(void *)(v47 + 32) + 8);
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_2;
        v65[3] = &unk_1E65C0388;
        v65[4] = v6;
        [v7 prepAndRunQuery:v46 onPrep:v65 onRow:0 onError:0];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v3);
  }

  v8 = (void *)MEMORY[0x1CB79B230]();
  id v9 = [*(id *)(v47 + 32) _currentColumns];
  v10 = [v9 arrayByAddingObject:@"total"];

  unint64_t v45 = [v10 count];
  if (v45 >= 0x7FFFFFFF) {
    __assert_rtn("-[SGMIDomainCountingTable deleteDomainSelection:]_block_invoke", "SGMIFeatureStore.m", 874, "columnCount < INT_MAX");
  }
  v11 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_317);
  v12 = objc_msgSend(v11, "_pas_mappedArrayWithIndexedTransform:", &__block_literal_global_319);
  uint64_t v13 = *(void *)(*(void *)(v47 + 32) + 24);
  v72[0] = @"DELETE FROM";
  v72[1] = v13;
  v72[2] = @"WHERE domain = ? RETURNING";
  v14 = objc_msgSend(v11, "_pas_componentsJoinedByString:", @",");
  v72[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:4];
  objc_msgSend(v15, "_pas_componentsJoinedByString:", @" ");
  id v44 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v16 = *(void *)(*(void *)(v47 + 32) + 24);
  v71[0] = @"UPDATE";
  v71[1] = v16;
  v71[2] = @"SET";
  v17 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @",");
  v71[3] = v17;
  v71[4] = @"WHERE domain IN _pas_nsarray(:parentDomains)";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:5];
  objc_msgSend(v18, "_pas_componentsJoinedByString:", @" ");
  id v38 = (id)objc_claimAutoreleasedReturnValue();

  size_t v43 = 8 * v45;
  size_t v19 = (8 * v45) | 7;
  v56 = 0;
  v57 = 0;
  unint64_t v35 = v19;
  if (v19 > 0x4000)
  {
    int v32 = malloc_type_posix_memalign((void **)&v56, 8uLL, v43, 0x100004000313F17uLL);
    LOBYTE(v57) = 0;
    if (v32)
    {
      id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v33);
    }
    v20 = v56;
  }
  else
  {
    v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v20, v19);
  }
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_5;
  v64[3] = &__block_descriptor_48_e27___NSNumber_16__0__NSArray_8l;
  v64[4] = v45;
  v64[5] = v20;
  id v37 = (id)MEMORY[0x1CB79B4C0](v64);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v39 = *(id *)(v47 + 40);
  uint64_t v21 = [v39 countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v61;
    v41 = v55;
    uint64_t v42 = v22;
    v40 = v53;
    v36 = v49;
    uint64_t v23 = MEMORY[0x1E4F143A8];
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v61 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v25 = *(void *)(*((void *)&v60 + 1) + 8 * j);
        v26 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v27 = v47;
        v28 = [*(id *)(v47 + 32) _parentDomainsForDomain:v25];
        bzero(v20, v43);
        v56 = 0;
        v57 = (void **)&v56;
        uint64_t v58 = 0x2020000000;
        char v59 = 0;
        v29 = *(void **)(*(void *)(v27 + 32) + 8);
        v54[0] = v23;
        v54[1] = 3221225472;
        v55[0] = __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_6;
        v55[1] = &unk_1E65C0388;
        v55[2] = v25;
        v52[0] = v23;
        v52[1] = 3221225472;
        v53[0] = __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_7;
        v53[1] = &unk_1E65BF268;
        v53[2] = &v56;
        v53[3] = v45;
        v53[4] = v20;
        [v29 prepAndRunQuery:v44 onPrep:v54 onRow:v52 onError:0];
        if (*((unsigned char *)v57 + 24) && [v28 count])
        {
          v30 = *(void **)(*(void *)(v47 + 32) + 8);
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v49[0] = __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_8;
          v49[1] = &unk_1E65BF9E8;
          id v51 = v37;
          id v50 = v28;
          [v30 prepAndRunQuery:v38 onPrep:v48 onRow:0 onError:0];
        }
        _Block_object_dispose(&v56, 8);
      }
      uint64_t v21 = [v39 countByEnumeratingWithState:&v60 objects:v70 count:16];
    }
    while (v21);
  }
  BOOL v31 = v35 > 0x4000;

  if (v31) {
    free(v20);
  }
  [*(id *)(v47 + 32) _deleteZeroRows];
}

uint64_t __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

id __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 firstObject];
  unint64_t v5 = [v4 unsignedIntegerValue];

  if (v5 >= *(void *)(a1 + 32)) {
    __assert_rtn("-[SGMIDomainCountingTable deleteDomainSelection:]_block_invoke_5", "SGMIFeatureStore.m", 903, "index < columnCount");
  }
  uint64_t v6 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 40) + 8 * v5)];

  return v6;
}

uint64_t __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_7(void *a1, void *a2)
{
  uint64_t v2 = a1[5];
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
  if (v2)
  {
    unint64_t v5 = 0;
    uint64_t v6 = a1[6];
    do
    {
      uint64_t v7 = *(void *)(v6 + 8 * v5);
      uint64_t v8 = [a2 getIntegerForColumn:v5];
      uint64_t v6 = a1[6];
      *(void *)(v6 + 8 * v5++) = v8 + v7;
    }
    while (a1[5] > v5);
  }
  return *MEMORY[0x1E4F93C08];
}

void __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":block" toBlock:v3];
  [v4 bindNamedParam:":parentDomains" toNSArray:*(void *)(a1 + 32)];
}

id __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (objc_class *)NSString;
  id v5 = a2;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:@"%@=%@-_pas_block(:block,%tu)", v5, v5, a3];

  return v6;
}

id __49__SGMIDomainCountingTable_deleteDomainSelection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[SGMIDomainCountingTable _escapedSQLIdentifier:a2];
}

- (void)deleteDomainSelection:(id)a3 keepingDomainsPassingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 || [v6 count])
  {
    db = self->_db;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__SGMIDomainCountingTable_deleteDomainSelection_keepingDomainsPassingTest___block_invoke;
    v9[3] = &unk_1E65BFFF0;
    v9[4] = self;
    id v11 = v7;
    id v10 = v6;
    [(_PASSqliteDatabase *)db writeTransaction:v9];
  }
}

void __75__SGMIDomainCountingTable_deleteDomainSelection_keepingDomainsPassingTest___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__SGMIDomainCountingTable_deleteDomainSelection_keepingDomainsPassingTest___block_invoke_2;
  v15[3] = &unk_1E65BF220;
  v15[4] = *(void *)(a1 + 32);
  id v16 = *(id *)(a1 + 48);
  uint64_t v2 = (void (**)(void, void))MEMORY[0x1CB79B4C0](v15);
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = objc_msgSend(v3, "allDomains", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
          id v10 = (void *)MEMORY[0x1CB79B230]();
          v2[2](v2, v9);
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v2[2](v2, 0);
  }
}

void __75__SGMIDomainCountingTable_deleteDomainSelection_keepingDomainsPassingTest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__36771;
  uint64_t v18 = __Block_byref_object_dispose__36772;
  id v19 = 0;
  do
  {
    id v4 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = v15[5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__SGMIDomainCountingTable_deleteDomainSelection_keepingDomainsPassingTest___block_invoke_3;
    v10[3] = &unk_1E65BF1F8;
    long long v13 = &v14;
    id v8 = v5;
    id v11 = v8;
    id v12 = *(id *)(a1 + 40);
    [v6 enumerateChildrenOfDomain:v3 greaterThan:v7 depth:-1 limit:0 usingBlock:v10];
    uint64_t v9 = [v8 count];
    if (v9) {
      [*(id *)(a1 + 32) deleteDomainSelection:v8];
    }
  }
  while (v9);
  _Block_object_dispose(&v14, 8);
}

BOOL __75__SGMIDomainCountingTable_deleteDomainSelection_keepingDomainsPassingTest___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  BOOL v5 = 0;
  if (([*(id *)(a1 + 32) containsDomain:v4] & 1) == 0)
  {
    if (((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) != 0
      || ([*(id *)(a1 + 32) addDomain:v4],
          (unint64_t)[*(id *)(a1 + 32) count] <= 0x7F))
    {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (void)commitDomainsAndCounts:(id)a3 toColumn:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__SGMIDomainCountingTable_commitDomainsAndCounts_toColumn___block_invoke;
  v12[3] = &unk_1E65BF1A8;
  v12[4] = self;
  id v13 = v8;
  id v14 = v7;
  SEL v15 = a2;
  id v10 = v7;
  id v11 = v8;
  [(_PASSqliteDatabase *)db writeTransaction:v12];
}

uint64_t __59__SGMIDomainCountingTable_commitDomainsAndCounts_toColumn___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _hasColumn:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"SGMIFeatureStore.m", 784, @"Invalid parameter not satisfying: %@", @"[self _hasColumn:column]" object file lineNumber description];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 32);
  return [v4 _commitDomainsAndCounts:v2 toColumn:v3];
}

- (void)commitDomainsCountedSet:(id)a3 toColumn:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 allObjects];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__SGMIDomainCountingTable_commitDomainsCountedSet_toColumn___block_invoke;
  v12[3] = &unk_1E65BF1D0;
  id v13 = v6;
  id v9 = v6;
  id v10 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v12);
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v10 forKeys:v8];
  [(SGMIDomainCountingTable *)self commitDomainsAndCounts:v11 toColumn:v7];
}

uint64_t __60__SGMIDomainCountingTable_commitDomainsCountedSet_toColumn___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) countForObject:a2];
  return [v2 numberWithUnsignedInteger:v3];
}

- (void)mergeColumn:(id)a3 intoColumn:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__SGMIDomainCountingTable_mergeColumn_intoColumn___block_invoke;
  v12[3] = &unk_1E65BF1A8;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  [(_PASSqliteDatabase *)db writeTransaction:v12];
}

uint64_t __50__SGMIDomainCountingTable_mergeColumn_intoColumn___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _hasColumn:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"SGMIFeatureStore.m", 765, @"Invalid parameter not satisfying: %@", @"[self _hasColumn:donorColumn]" object file lineNumber description];
  }
  if (([*(id *)(a1 + 32) _hasColumn:*(void *)(a1 + 48)] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"SGMIFeatureStore.m", 766, @"Invalid parameter not satisfying: %@", @"[self _hasColumn:recipientColumn]" object file lineNumber description];
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 _mergeColumn:v3 intoColumn:v4];
}

- (void)recycleColumn:(id)a3 asColumn:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__SGMIDomainCountingTable_recycleColumn_asColumn___block_invoke;
  v12[3] = &unk_1E65BF1A8;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  [(_PASSqliteDatabase *)db writeTransaction:v12];
}

uint64_t __50__SGMIDomainCountingTable_recycleColumn_asColumn___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _hasColumn:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"SGMIFeatureStore.m", 755, @"Invalid parameter not satisfying: %@", @"[self _hasColumn:columnName]" object file lineNumber description];
  }
  if ([*(id *)(a1 + 32) _hasColumn:*(void *)(a1 + 48)])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"SGMIFeatureStore.m", 756, @"Invalid parameter not satisfying: %@", @"![self _hasColumn:newColumnName]" object file lineNumber description];
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 _recycleColumn:v3 asColumn:v4];
}

- (void)dropColumn:(id)a3
{
  id v5 = a3;
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__SGMIDomainCountingTable_dropColumn___block_invoke;
  v8[3] = &unk_1E65BFEB0;
  v8[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  [(_PASSqliteDatabase *)db writeTransaction:v8];
}

uint64_t __38__SGMIDomainCountingTable_dropColumn___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _hasColumn:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"SGMIFeatureStore.m", 746, @"Invalid parameter not satisfying: %@", @"[self _hasColumn:columnName]" object file lineNumber description];
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _dropColumn:v3];
}

- (void)zeroColumn:(id)a3
{
  id v5 = a3;
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__SGMIDomainCountingTable_zeroColumn___block_invoke;
  v8[3] = &unk_1E65BFEB0;
  v8[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  [(_PASSqliteDatabase *)db writeTransaction:v8];
}

uint64_t __38__SGMIDomainCountingTable_zeroColumn___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _hasColumn:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"SGMIFeatureStore.m", 734, @"Invalid parameter not satisfying: %@", @"[self _hasColumn:columnName]" object file lineNumber description];
  }
  uint64_t result = [*(id *)(a1 + 32) _zeroColumn:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _deleteZeroRows];
  }
  return result;
}

- (void)addColumn:(id)a3
{
  id v5 = a3;
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__SGMIDomainCountingTable_addColumn___block_invoke;
  v8[3] = &unk_1E65BFEB0;
  v8[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  [(_PASSqliteDatabase *)db writeTransaction:v8];
}

uint64_t __37__SGMIDomainCountingTable_addColumn___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _hasColumn:*(void *)(a1 + 40)])
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"SGMIFeatureStore.m", 725, @"Invalid parameter not satisfying: %@", @"![self _hasColumn:columnName]" object file lineNumber description];
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _addColumn:v3];
}

- (unint64_t)numberOfRowsAssociatedWithDomain:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SGMIDomainCountingTable_numberOfRowsAssociatedWithDomain___block_invoke;
  v9[3] = &unk_1E65C0700;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [(_PASSqliteDatabase *)db readTransaction:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __60__SGMIDomainCountingTable_numberOfRowsAssociatedWithDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = (void *)[[NSString alloc] initWithFormat:@"SELECT COUNT(*) AS n FROM %@ WHERE domain = :domain OR (domain >= :domain || '.' AND domain < :domain || '/')", *(void *)(*(void *)(a1 + 32) + 24)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__SGMIDomainCountingTable_numberOfRowsAssociatedWithDomain___block_invoke_2;
  v5[3] = &unk_1E65C0388;
  id v6 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__SGMIDomainCountingTable_numberOfRowsAssociatedWithDomain___block_invoke_3;
  v4[3] = &unk_1E65C03F8;
  v4[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:v3 onPrep:v5 onRow:v4 onError:0];
}

uint64_t __60__SGMIDomainCountingTable_numberOfRowsAssociatedWithDomain___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":domain" toNSString:*(void *)(a1 + 32)];
}

uint64_t __60__SGMIDomainCountingTable_numberOfRowsAssociatedWithDomain___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnAlias:"n"];
  return *MEMORY[0x1E4F93C10];
}

- (void)enumerateChildrenOfDomain:(id)a3 greaterThan:(id)a4 depth:(unint64_t)a5 limit:(id)a6 usingBlock:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (v13) {
    unint64_t v17 = [(SGMIDomainCountingTable *)self _domainSegmentCount:v13];
  }
  else {
    unint64_t v17 = 0;
  }
  db = self->_db;
  v24[0] = MEMORY[0x1E4F143A8];
  if (a5) {
    unint64_t v19 = a5;
  }
  else {
    unint64_t v19 = -1;
  }
  v24[1] = 3221225472;
  v24[2] = __88__SGMIDomainCountingTable_enumerateChildrenOfDomain_greaterThan_depth_limit_usingBlock___block_invoke;
  v24[3] = &unk_1E65BF180;
  id v25 = v13;
  v26 = self;
  id v27 = v15;
  id v28 = v14;
  unint64_t v31 = v19;
  SEL v32 = a2;
  id v29 = v16;
  unint64_t v30 = v17;
  id v20 = v16;
  id v21 = v14;
  id v22 = v15;
  id v23 = v13;
  [(_PASSqliteDatabase *)db readTransaction:v24];
}

void __88__SGMIDomainCountingTable_enumerateChildrenOfDomain_greaterThan_depth_limit_usingBlock___block_invoke(uint64_t a1)
{
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__36771;
  v32[4] = __Block_byref_object_dispose__36772;
  id v33 = 0;
  uint64_t v2 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v3 = [*(id *)(a1 + 32) stringByAppendingString:@"."];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = &stru_1F24EEF20;
  }
  id v15 = v4;

  id v5 = (void *)MEMORY[0x1CB79B230]();
  id v6 = [*(id *)(a1 + 32) stringByAppendingString:@"/"];
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  id v7 = [NSString alloc];
  if (*(void *)(a1 + 48)) {
    id v8 = @" LIMIT :limit";
  }
  else {
    id v8 = &stru_1F24EEF20;
  }
  id v9 = (void *)[v7 initWithFormat:@"SELECT domain AS d, total as t FROM %@ WHERE (d >= MAX(:firstChildOfPrefix, COALESCE(:skipTo, ''), COALESCE(:greaterThan, ''))) AND (d IS NOT :greaterThan) AND (d < :firstAfterPrefix) ORDER BY d ASC%@", *(void *)(*(void *)(a1 + 40) + 24), v8];
  do
  {
    id v10 = (void *)MEMORY[0x1CB79B230]();
    *((unsigned char *)v29 + 24) = 0;
    id v11 = *(void **)(*(void *)(a1 + 40) + 8);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__SGMIDomainCountingTable_enumerateChildrenOfDomain_greaterThan_depth_limit_usingBlock___block_invoke_2;
    v22[3] = &unk_1E65BF130;
    id v27 = v32;
    id v23 = *(id *)(a1 + 56);
    uint64_t v12 = v15;
    v24 = v12;
    id v13 = v6;
    id v25 = v13;
    id v26 = *(id *)(a1 + 48);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__SGMIDomainCountingTable_enumerateChildrenOfDomain_greaterThan_depth_limit_usingBlock___block_invoke_3;
    v16[3] = &unk_1E65BF158;
    uint64_t v14 = *(void *)(a1 + 40);
    long long v20 = *(_OWORD *)(a1 + 72);
    uint64_t v21 = *(void *)(a1 + 88);
    v16[4] = v14;
    uint64_t v18 = v32;
    unint64_t v19 = &v28;
    id v17 = *(id *)(a1 + 64);
    [v11 prepAndRunQuery:v9 onPrep:v22 onRow:v16 onError:0];
  }
  while (*((unsigned char *)v29 + 24));

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);
}

void __88__SGMIDomainCountingTable_enumerateChildrenOfDomain_greaterThan_depth_limit_usingBlock___block_invoke_2(void *a1, void *a2)
{
  id v4 = a2;
  [v4 bindNamedParam:":skipTo" toNSString:*(void *)(*(void *)(a1[8] + 8) + 40)];
  [v4 bindNamedParam:":greaterThan" toNSString:a1[4]];
  [v4 bindNamedParam:":firstChildOfPrefix" toNonnullNSString:a1[5]];
  if (a1[6]) {
    objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":firstAfterPrefix");
  }
  else {
    [v4 bindNamedParam:":firstAfterPrefix" toNonnullNSData:*MEMORY[0x1E4F93BF8]];
  }
  uint64_t v3 = v4;
  if (a1[7])
  {
    objc_msgSend(v4, "bindNamedParam:toInt64AsNonnullNSNumber:", ":limit");
    uint64_t v3 = v4;
  }
}

uint64_t __88__SGMIDomainCountingTable_enumerateChildrenOfDomain_greaterThan_depth_limit_usingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 nonnullNSStringForColumnAlias:"d"];
  if ((unint64_t)([*(id *)(a1 + 32) _domainSegmentCount:v4] - *(void *)(a1 + 64)) <= *(void *)(a1 + 72))
  {
    [v3 getIntegerForColumnAlias:"t"];
    int v12 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    id v13 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
    if (!v12) {
      id v13 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
    }
    uint64_t v11 = *v13;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v6 = [v4 rangeOfString:@"." options:6];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"SGMIFeatureStore.m", 677, @"Invalid parameter not satisfying: %@", @"lastDot != NSNotFound" object file lineNumber description];
    }
    id v7 = [v4 substringToIndex:v6];
    uint64_t v8 = [v7 stringByAppendingString:@"/"];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v11 = *MEMORY[0x1E4F93C10];
  }

  return v11;
}

- (void)enumerateChildrenOfDomain:(id)a3 depth:(unint64_t)a4 usingBlock:(id)a5
{
}

- (id)firstNonZeroColumnForDomain:(id)a3 withColumns:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:&v13 count:1];
  id v10 = -[SGMIDomainCountingTable firstNonZeroColumnForDomains:withColumns:](self, "firstNonZeroColumnForDomains:withColumns:", v9, v7, v13, v14);

  uint64_t v11 = [v10 objectForKeyedSubscript:v8];

  return v11;
}

- (id)firstNonZeroColumnForDomains:(id)a3 withColumns:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
  db = self->_db;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke;
  v17[3] = &unk_1E65BF0E8;
  id v18 = v8;
  unint64_t v19 = self;
  SEL v22 = a2;
  id v20 = v7;
  id v11 = v9;
  id v21 = v11;
  id v12 = v7;
  id v13 = v8;
  [(_PASSqliteDatabase *)db readTransaction:v17];
  uint64_t v14 = v21;
  id v15 = v11;

  return v15;
}

void __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        if (([*(id *)(a1 + 40) _hasColumn:*(void *)(*((void *)&v18 + 1) + 8 * v6)] & 1) == 0)
        {
          id v7 = [MEMORY[0x1E4F28B00] currentHandler];
          [v7 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"SGMIFeatureStore.m", 571, @"Invalid parameter not satisfying: %@", @"[self _hasColumn:column]" object file lineNumber description];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  if ([*(id *)(a1 + 48) count])
  {
    if ([*(id *)(a1 + 32) count])
    {
      id v8 = objc_msgSend(*(id *)(a1 + 32), "_pas_mappedArrayWithIndexedTransform:", &__block_literal_global_258_36826);
      id v9 = [NSString alloc];
      id v10 = objc_msgSend(v8, "_pas_componentsJoinedByString:", @" ");
      id v11 = (void *)[v9 initWithFormat:@"SELECT domain AS d, CASE %@ ELSE -1 END AS c FROM %@ WHERE domain IN _pas_nsarray(:domains)", v10, *(void *)(*(void *)(a1 + 40) + 24)];

      id v12 = *(void **)(*(void *)(a1 + 40) + 8);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke_3;
      v16[3] = &unk_1E65C0388;
      id v17 = *(id *)(a1 + 48);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke_4;
      v13[3] = &unk_1E65BFED8;
      id v14 = *(id *)(a1 + 32);
      id v15 = *(id *)(a1 + 56);
      [v12 prepAndRunQuery:v11 onPrep:v16 onRow:v13 onError:0];
    }
  }
}

uint64_t __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":domains" toNSArray:*(void *)(a1 + 32)];
}

uint64_t __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getIntegerForColumnAlias:"c"];
  if (v4 != -1)
  {
    uint64_t v5 = v4;
    uint64_t v6 = [v3 nonnullNSStringForColumnAlias:"d"];
    id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
  }
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

id __68__SGMIDomainCountingTable_firstNonZeroColumnForDomains_withColumns___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[SGMIDomainCountingTable _escapedSQLIdentifier:a2];
  uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"WHEN %@ THEN %tu", v4, a3];

  return v5;
}

- (id)nonZeroColumnsForDomain:(id)a3 withColumns:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v13 count:1];
  id v10 = -[SGMIDomainCountingTable nonZeroColumnsForDomains:withColumns:](self, "nonZeroColumnsForDomains:withColumns:", v9, v7, v13, v14);

  id v11 = [v10 objectForKeyedSubscript:v8];

  return v11;
}

- (id)nonZeroColumnsForDomains:(id)a3 withColumns:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
  db = self->_db;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke;
  v17[3] = &unk_1E65BF0E8;
  id v18 = v8;
  long long v19 = self;
  SEL v22 = a2;
  id v20 = v7;
  id v11 = v9;
  id v21 = v11;
  id v12 = v7;
  id v13 = v8;
  [(_PASSqliteDatabase *)db readTransaction:v17];
  uint64_t v14 = v21;
  id v15 = v11;

  return v15;
}

void __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) count];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        if (([*(id *)(a1 + 40) _hasColumn:*(void *)(*((void *)&v21 + 1) + 8 * v7)] & 1) == 0)
        {
          id v8 = [MEMORY[0x1E4F28B00] currentHandler];
          [v8 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"SGMIFeatureStore.m", 534, @"Invalid parameter not satisfying: %@", @"[self _hasColumn:column]" object file lineNumber description];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  if ([*(id *)(a1 + 48) count] && v2)
  {
    if (v2 >= 0x7FFFFFFF)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 64), *(void *)(a1 + 40), @"SGMIFeatureStore.m", 539, @"columnCount %tu is too big", v2);
    }
    id v9 = objc_msgSend(*(id *)(a1 + 32), "_pas_mappedArrayWithTransform:", &__block_literal_global_251);
    id v10 = [NSString alloc];
    id v11 = objc_msgSend(v9, "_pas_componentsJoinedByString:", @",");
    id v12 = (void *)[v10 initWithFormat:@"SELECT %@, domain FROM %@ WHERE domain IN _pas_nsarray(:domains)", v11, *(void *)(*(void *)(a1 + 40) + 24)];

    id v13 = *(void **)(*(void *)(a1 + 40) + 8);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_3;
    v19[3] = &unk_1E65C0388;
    id v20 = *(id *)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_4;
    v15[3] = &unk_1E65BF0C0;
    unint64_t v18 = v2;
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 32);
    [v13 prepAndRunQuery:v12 onPrep:v19 onRow:v15 onError:0];
  }
}

uint64_t __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":domains" toNSArray:*(void *)(a1 + 32)];
}

uint64_t __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 nonnullNSStringForColumn:*(unsigned int *)(a1 + 48)];
  uint64_t v5 = *(void **)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_5;
  v10[3] = &unk_1E65BF098;
  id v11 = v3;
  id v6 = v3;
  uint64_t v7 = objc_msgSend(v5, "_pas_filteredArrayWithIndexedTest:", v10);
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v4];

  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v8;
}

BOOL __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getIntegerForColumn:") != 0;
}

id __64__SGMIDomainCountingTable_nonZeroColumnsForDomains_withColumns___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[SGMIDomainCountingTable _escapedSQLIdentifier:a2];
}

- (unint64_t)_domainSegmentCount:(id)a3
{
  id v3 = (__CFString *)a3;
  uint64_t v4 = self;

  if (!v4) {
    goto LABEL_28;
  }
  memset(v22, 0, sizeof(v22));
  CFIndex Length = CFStringGetLength(v3);
  CFStringRef theString = v3;
  uint64_t v26 = 0;
  CFIndex v27 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  long long v24 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  }
  int64_t v28 = 0;
  int64_t v29 = 0;
  id v25 = CStringPtr;
  if (Length >= 1)
  {
    uint64_t v8 = 0;
    int64_t v9 = 0;
    int64_t v10 = 0;
    unint64_t v11 = 1;
    uint64_t v12 = 64;
    do
    {
      if ((unint64_t)v10 >= 4) {
        uint64_t v13 = 4;
      }
      else {
        uint64_t v13 = v10;
      }
      CFIndex v14 = v27;
      if (v27 > v10)
      {
        if (v24)
        {
          UniChar v15 = v24[v10 + v26];
        }
        else if (v25)
        {
          UniChar v15 = v25[v26 + v10];
        }
        else
        {
          if (v29 <= v10 || v9 > v10)
          {
            uint64_t v17 = v13 + v8;
            uint64_t v18 = v12 - v13;
            int64_t v19 = v10 - v13;
            CFIndex v20 = v19 + 64;
            if (v19 + 64 >= v27) {
              CFIndex v20 = v27;
            }
            int64_t v28 = v19;
            int64_t v29 = v20;
            if (v27 >= v18) {
              CFIndex v14 = v18;
            }
            v30.length = v14 + v17;
            v30.location = v19 + v26;
            CFStringGetCharacters(theString, v30, (UniChar *)v22);
            int64_t v9 = v28;
          }
          UniChar v15 = *((_WORD *)v22 + v10 - v9);
        }
        if (v15 == 46) {
          ++v11;
        }
      }
      ++v10;
      --v8;
      ++v12;
    }
    while (Length != v10);
  }
  else
  {
LABEL_28:
    unint64_t v11 = 1;
  }

  return v11;
}

- (int64_t)countForColumn:(id)a3 domain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0;
  CFIndex v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  db = self->_db;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__SGMIDomainCountingTable_countForColumn_domain___block_invoke;
  v14[3] = &unk_1E65BF070;
  v14[4] = self;
  id v10 = v7;
  id v15 = v10;
  SEL v18 = a2;
  id v11 = v8;
  id v16 = v11;
  uint64_t v17 = &v19;
  [(_PASSqliteDatabase *)db readTransaction:v14];
  int64_t v12 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __49__SGMIDomainCountingTable_countForColumn_domain___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _hasColumn:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"SGMIFeatureStore.m", 505, @"Invalid parameter not satisfying: %@", @"[self _hasColumn:column]" object file lineNumber description];
  }
  unint64_t v2 = +[SGMIDomainCountingTable _escapedSQLIdentifier:*(void *)(a1 + 40)];
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"SELECT %@ FROM %@ WHERE domain = ?", v2, *(void *)(*(void *)(a1 + 32) + 24)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SGMIDomainCountingTable_countForColumn_domain___block_invoke_2;
  v7[3] = &unk_1E65C0388;
  id v8 = *(id *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__SGMIDomainCountingTable_countForColumn_domain___block_invoke_3;
  v6[3] = &unk_1E65C03F8;
  v6[4] = *(void *)(a1 + 56);
  [v3 prepAndRunQuery:v4 onPrep:v7 onRow:v6 onError:0];
}

uint64_t __49__SGMIDomainCountingTable_countForColumn_domain___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __49__SGMIDomainCountingTable_countForColumn_domain___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

- (int64_t)totalForDomain:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v20[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v7 = [(SGMIDomainCountingTable *)self totalsForDomains:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__SGMIDomainCountingTable_totalForDomain___block_invoke;
  v11[3] = &unk_1E65BF048;
  id v8 = v5;
  id v12 = v8;
  uint64_t v13 = self;
  CFIndex v14 = &v16;
  SEL v15 = a2;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];

  int64_t v9 = v17[3];
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __42__SGMIDomainCountingTable_totalForDomain___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if (([a2 isEqual:a1[4]] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a1[7], a1[5], @"SGMIFeatureStore.m", 494, @"Invalid parameter not satisfying: %@", @"[d isEqual:domain]" object file lineNumber description];
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v8 integerValue];
  *a4 = 1;
}

- (id)totalsForDomains:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
    db = self->_db;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__SGMIDomainCountingTable_totalsForDomains___block_invoke;
    v11[3] = &unk_1E65C0688;
    void v11[4] = self;
    id v12 = v4;
    id v7 = v5;
    id v13 = v7;
    [(_PASSqliteDatabase *)db readTransaction:v11];
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

void __44__SGMIDomainCountingTable_totalsForDomains___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = (void *)[[NSString alloc] initWithFormat:@"SELECT domain AS d, total AS t FROM %@ WHERE domain IN _pas_nsarray(:domains)", *(void *)(*(void *)(a1 + 32) + 24)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__SGMIDomainCountingTable_totalsForDomains___block_invoke_2;
  v6[3] = &unk_1E65C0388;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SGMIDomainCountingTable_totalsForDomains___block_invoke_3;
  v4[3] = &unk_1E65BFF78;
  id v5 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:v3 onPrep:v6 onRow:v4 onError:0];
}

uint64_t __44__SGMIDomainCountingTable_totalsForDomains___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":domains" toNSArray:*(void *)(a1 + 32)];
}

uint64_t __44__SGMIDomainCountingTable_totalsForDomains___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 nonnullNSStringForColumnAlias:"d"];
  id v5 = [v3 int64AsNonnullNSNumberForColumnAlias:"t"];

  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
  id v6 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v6;
}

- (void)_commitDomainsAndCounts:(id)a3 toColumn:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = (void *)[v6 mutableCopy];
    id v9 = objc_opt_new();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke;
    v21[3] = &unk_1E65BEFD8;
    v21[4] = self;
    id v10 = v9;
    id v22 = v10;
    id v11 = v6;
    id v23 = v11;
    id v12 = v8;
    id v24 = v12;
    [v11 enumerateKeysAndObjectsUsingBlock:v21];
    db = self->_db;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_2;
    v16[3] = &unk_1E65BF020;
    void v16[4] = self;
    id v17 = v11;
    id v18 = v10;
    id v19 = v7;
    id v20 = v12;
    id v14 = v12;
    id v15 = v10;
    [(_PASSqliteDatabase *)db writeTransaction:v16];
  }
}

void __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a3 integerValue];
  id v7 = (uint64_t *)MEMORY[0x1E4F1C3C8];
  if (v6 < 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"You can't commit a negative count"];
  }
  id v8 = objc_msgSend(a1[4], "_parentDomainsForDomain:", v5, v5);
  [a1[5] addObjectsFromArray:v8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    uint64_t v12 = *v7;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v15 = [a1[6] objectForKeyedSubscript:v14];

        if (v15) {
          [MEMORY[0x1E4F1CA00] raise:v12 format:@"You can't commit counts to both a parent and its child (you can't commit 1 to both foo and foo.bar)"];
        }
        uint64_t v16 = [a1[7] objectForKeyedSubscript:v14];
        uint64_t v17 = [v16 integerValue];

        id v18 = [NSNumber numberWithInteger:v17 + v6];
        [a1[7] setObject:v18 forKeyedSubscript:v14];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
}

void __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_2(uint64_t a1)
{
  v17[12] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"SELECT 1 FROM _pas_nsdictionary(:domainsAndCounts) WHERE EXISTS (SELECT domain FROM %@ WHERE (domain >= key || '.') AND (domain < key || '/'))", *(void *)(*(void *)(a1 + 32) + 24)];
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_3;
  v15[3] = &unk_1E65C0388;
  id v16 = *(id *)(a1 + 40);
  [v3 prepAndRunQuery:v2 onPrep:v15 onRow:&__block_literal_global_189 onError:0];
  id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT 1 FROM _pas_nsset(:parentDomains) WHERE EXISTS (SELECT domain FROM %1$@ WHERE domain = value) AND NOT EXISTS (SELECT domain FROM %1$@ WHERE (domain >= value || '.') AND (domain < value || '/'))", *(void *)(*(void *)(a1 + 32) + 24));
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_5;
  v13[3] = &unk_1E65C0388;
  id v14 = *(id *)(a1 + 48);
  [v5 prepAndRunQuery:v4 onPrep:v13 onRow:&__block_literal_global_198 onError:0];
  uint64_t v6 = +[SGMIDomainCountingTable _escapedSQLIdentifier:*(void *)(a1 + 56)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 24);
  v17[0] = @"INSERT INTO";
  v17[1] = v7;
  v17[2] = CFSTR("(domain,");
  v17[3] = v6;
  void v17[4] = @", total");
  v17[5] = @"SELECT key, value, value FROM _pas_nsdictionary(:domainsAndCascadedCounts) WHERE value != 0";
  v17[6] = @"ON CONFLICT(domain)";
  v17[7] = @"DO UPDATE SET";
  v17[8] = v6;
  v17[9] = @"=";
  v17[10] = v6;
  v17[11] = @"+ excluded.total, total = total + excluded.total";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:12];
  uint64_t v9 = objc_msgSend(v8, "_pas_componentsJoinedByString:", @" ");

  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_7;
  v11[3] = &unk_1E65C0388;
  id v12 = *(id *)(a1 + 64);
  [v10 prepAndRunQuery:v9 onPrep:v11 onRow:0 onError:0];
}

uint64_t __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":domainsAndCounts" toNSDictionary:*(void *)(a1 + 32)];
}

uint64_t __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":parentDomains" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":domainsAndCascadedCounts" toNSDictionary:*(void *)(a1 + 32)];
}

void __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  __break(1u);
}

void __60__SGMIDomainCountingTable__commitDomainsAndCounts_toColumn___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  __break(1u);
}

- (id)_parentDomainsForDomain:(id)a3
{
  id v3 = (__CFString *)a3;
  id v4 = self;

  if (!v4) {
    goto LABEL_30;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  CFIndex Length = CFStringGetLength(v3);
  CFStringRef theString = v3;
  uint64_t v44 = 0;
  CFIndex v45 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  uint64_t v42 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  }
  int64_t v46 = 0;
  int64_t v47 = 0;
  size_t v43 = CStringPtr;
  if (Length >= 1)
  {
    uint64_t v15 = 0;
    id v16 = 0;
    int64_t v17 = 0;
    uint64_t v18 = 64;
    do
    {
      if ((unint64_t)v17 >= 4) {
        uint64_t v19 = 4;
      }
      else {
        uint64_t v19 = v17;
      }
      CFIndex v20 = v45;
      if (v45 > v17)
      {
        if (v42)
        {
          UniChar v21 = v42[v17 + v44];
        }
        else if (v43)
        {
          UniChar v21 = v43[v44 + v17];
        }
        else
        {
          int64_t v22 = v46;
          if (v47 <= v17 || v46 > v17)
          {
            uint64_t v24 = v19 + v15;
            uint64_t v25 = v18 - v19;
            int64_t v26 = v17 - v19;
            CFIndex v27 = v26 + 64;
            if (v26 + 64 >= v45) {
              CFIndex v27 = v45;
            }
            int64_t v46 = v26;
            int64_t v47 = v27;
            if (v45 >= v25) {
              CFIndex v20 = v25;
            }
            v48.length = v20 + v24;
            v48.location = v26 + v44;
            CFStringGetCharacters(theString, v48, (UniChar *)&v33);
            int64_t v22 = v46;
          }
          UniChar v21 = *((_WORD *)&v33 + v17 - v22);
        }
        if (v21 == 46)
        {
          int64_t v28 = (void *)MEMORY[0x1CB79B230](CStringPtr, v6, v7, v8, v9, v10, v11, v12, v33, *((void *)&v33 + 1), v34, *((void *)&v34 + 1), v35, *((void *)&v35 + 1), v36, *((void *)&v36 + 1));
          if (!v16) {
            id v16 = objc_opt_new();
          }
          int64_t v29 = [(__CFString *)v3 substringToIndex:v17];
          [v16 addObject:v29];
        }
      }
      ++v17;
      --v15;
      ++v18;
    }
    while (Length != v17);
  }
  else
  {
LABEL_30:
    id v16 = 0;
  }

  if (v16) {
    CFRange v30 = v16;
  }
  else {
    CFRange v30 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v31 = v30;

  return v31;
}

- (void)_deleteZeroRows
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__SGMIDomainCountingTable__deleteZeroRows__block_invoke;
  v3[3] = &unk_1E65BEF88;
  v3[4] = self;
  [(_PASSqliteDatabase *)db writeTransaction:v3];
}

void __42__SGMIDomainCountingTable__deleteZeroRows__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  id v2 = (id)[[NSString alloc] initWithFormat:@"DELETE FROM %@ WHERE total IS 0", *(void *)(*(void *)(a1 + 32) + 24)];
  [v1 prepAndRunQuery:v2 onPrep:0 onRow:0 onError:0];
}

- (void)_recycleColumn:(id)a3 asColumn:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[SGMIDomainCountingTable _escapedSQLIdentifier:v6];
  uint64_t v9 = +[SGMIDomainCountingTable _escapedSQLIdentifier:v7];

  db = self->_db;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__SGMIDomainCountingTable__recycleColumn_asColumn___block_invoke;
  v14[3] = &unk_1E65C0638;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v6;
  [(_PASSqliteDatabase *)db writeTransaction:v14];
}

uint64_t __51__SGMIDomainCountingTable__recycleColumn_asColumn___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _zeroColumn:*(void *)(a1 + 40)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = (void *)[[NSString alloc] initWithFormat:@"ALTER TABLE %@ RENAME COLUMN %@ TO %@", *(void *)(*(void *)(a1 + 32) + 24), *(void *)(a1 + 48), *(void *)(a1 + 56)];
  [v2 prepAndRunQuery:v3 onPrep:0 onRow:0 onError:0];

  id v4 = *(void **)(a1 + 32);
  return [v4 _deleteZeroRows];
}

- (BOOL)_zeroColumn:(id)a3
{
  id v4 = a3;
  id v5 = +[SGMIDomainCountingTable _escapedSQLIdentifier:v4];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__SGMIDomainCountingTable__zeroColumn___block_invoke;
  v9[3] = &unk_1E65C0700;
  v9[4] = self;
  id v7 = v5;
  id v10 = v7;
  id v11 = &v12;
  [(_PASSqliteDatabase *)db writeTransaction:v9];
  LOBYTE(db) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)db;
}

void __39__SGMIDomainCountingTable__zeroColumn___block_invoke(void *a1)
{
  id v2 = *(void **)(a1[4] + 8);
  id v3 = (void *)[[NSString alloc] initWithFormat:@"UPDATE %@ SET total = total - %@, %@ = 0 WHERE %@ IS NOT 0 RETURNING 1", *(void *)(a1[4] + 24), a1[5], a1[5], a1[5]];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SGMIDomainCountingTable__zeroColumn___block_invoke_2;
  v4[3] = &unk_1E65C03F8;
  void v4[4] = a1[6];
  [v2 prepAndRunQuery:v3 onPrep:0 onRow:v4 onError:0];
}

uint64_t __39__SGMIDomainCountingTable__zeroColumn___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C08];
}

- (void)_dropColumn:(id)a3
{
  id v4 = a3;
  id v5 = +[SGMIDomainCountingTable _escapedSQLIdentifier:v4];
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__SGMIDomainCountingTable__dropColumn___block_invoke;
  v9[3] = &unk_1E65C0688;
  v9[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [(_PASSqliteDatabase *)db writeTransaction:v9];
}

void __39__SGMIDomainCountingTable__dropColumn___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _removeColumnFromTotal:*(void *)(a1 + 40)]) {
    [*(id *)(a1 + 32) _deleteZeroRows];
  }
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = (id)[[NSString alloc] initWithFormat:@"ALTER TABLE %@ DROP COLUMN %@", *(void *)(*(void *)(a1 + 32) + 24), *(void *)(a1 + 48)];
  [v2 prepAndRunQuery:v3 onPrep:0 onRow:0 onError:0];
}

- (BOOL)_removeColumnFromTotal:(id)a3
{
  id v4 = a3;
  id v5 = +[SGMIDomainCountingTable _escapedSQLIdentifier:v4];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__SGMIDomainCountingTable__removeColumnFromTotal___block_invoke;
  v9[3] = &unk_1E65C0700;
  v9[4] = self;
  id v7 = v5;
  id v10 = v7;
  id v11 = &v12;
  [(_PASSqliteDatabase *)db writeTransaction:v9];
  LOBYTE(db) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)db;
}

void __50__SGMIDomainCountingTable__removeColumnFromTotal___block_invoke(void *a1)
{
  id v2 = *(void **)(a1[4] + 8);
  id v3 = (void *)[[NSString alloc] initWithFormat:@"UPDATE %@ SET total = total - %@ WHERE %@ IS NOT 0 RETURNING 1", *(void *)(a1[4] + 24), a1[5], a1[5]];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SGMIDomainCountingTable__removeColumnFromTotal___block_invoke_2;
  v4[3] = &unk_1E65C03F8;
  void v4[4] = a1[6];
  [v2 prepAndRunQuery:v3 onPrep:0 onRow:v4 onError:0];
}

uint64_t __50__SGMIDomainCountingTable__removeColumnFromTotal___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return *MEMORY[0x1E4F93C08];
}

- (void)_mergeColumn:(id)a3 intoColumn:(id)a4
{
  id v6 = a4;
  id v7 = +[SGMIDomainCountingTable _escapedSQLIdentifier:a3];
  id v8 = +[SGMIDomainCountingTable _escapedSQLIdentifier:v6];

  db = self->_db;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__SGMIDomainCountingTable__mergeColumn_intoColumn___block_invoke;
  v12[3] = &unk_1E65C0688;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  [(_PASSqliteDatabase *)db writeTransaction:v12];
}

void __51__SGMIDomainCountingTable__mergeColumn_intoColumn___block_invoke(void *a1)
{
  v8[14] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[5];
  id v3 = *(void **)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 24);
  v8[0] = @"UPDATE";
  v8[1] = v4;
  v8[2] = @"SET";
  v8[3] = v2;
  v8[4] = @"=";
  void v8[5] = v2;
  uint64_t v5 = a1[6];
  v8[6] = @"+";
  v8[7] = v5;
  v8[8] = @",";
  v8[9] = v5;
  v8[10] = @"= 0";
  v8[11] = @"WHERE";
  v8[12] = v5;
  v8[13] = @"IS NOT 0";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:14];
  id v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @" ");
  [v3 prepAndRunQuery:v7 onPrep:0 onRow:0 onError:0];
}

- (void)_addColumn:(id)a3
{
  uint64_t v4 = +[SGMIDomainCountingTable _escapedSQLIdentifier:a3];
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SGMIDomainCountingTable__addColumn___block_invoke;
  v7[3] = &unk_1E65BFD88;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(_PASSqliteDatabase *)db writeTransaction:v7];
}

void __38__SGMIDomainCountingTable__addColumn___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
  id v2 = (id)[[NSString alloc] initWithFormat:@"ALTER TABLE %@ ADD COLUMN %@ DEFAULT 0 NOT NULL", *(void *)(*(void *)(a1 + 32) + 24), *(void *)(a1 + 40)];
  [v1 prepAndRunQuery:v2 onPrep:0 onRow:0 onError:0];
}

- (id)_readCurrentColumnsUncached
{
  id v3 = objc_opt_new();
  db = self->_db;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __54__SGMIDomainCountingTable__readCurrentColumnsUncached__block_invoke;
  uint64_t v12 = &unk_1E65BFD88;
  id v13 = self;
  id v5 = v3;
  id v14 = v5;
  id v6 = (void *)MEMORY[0x1CB79B230]([(_PASSqliteDatabase *)db readTransaction:&v9]);
  id v7 = objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_36929, v9, v10, v11, v12, v13);

  return v7;
}

void __54__SGMIDomainCountingTable__readCurrentColumnsUncached__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = (void *)[[NSString alloc] initWithFormat:@"PRAGMA table_info(%@)", *(void *)(*(void *)(a1 + 32) + 24)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__SGMIDomainCountingTable__readCurrentColumnsUncached__block_invoke_2;
  v4[3] = &unk_1E65BFF78;
  id v5 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:v3 onPrep:0 onRow:v4 onError:0];
}

uint64_t __54__SGMIDomainCountingTable__readCurrentColumnsUncached__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumn:1];
  if (([v3 isEqual:@"domain"] & 1) == 0
    && ([v3 isEqual:@"total"] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (BOOL)_hasColumn:(id)a3
{
  id v4 = a3;
  id v5 = [(SGMIDomainCountingTable *)self _currentColumns];
  uint64_t v6 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v5, "count"), 0, &__block_literal_global_36929);

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_currentColumns
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__36771;
  uint64_t v10 = __Block_byref_object_dispose__36772;
  id v11 = 0;
  db = self->_db;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SGMIDomainCountingTable__currentColumns__block_invoke;
  v5[3] = &unk_1E65C0728;
  void v5[4] = self;
  v5[5] = &v6;
  [(_PASSqliteDatabase *)db readTransaction:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __42__SGMIDomainCountingTable__currentColumns__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SGMIDomainCountingTable__currentColumns__block_invoke_2;
  v4[3] = &unk_1E65BEFB0;
  long long v1 = *(_OWORD *)(a1 + 32);
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  long long v5 = v1;
  return [v2 runWithLockAcquired:v4];
}

void __42__SGMIDomainCountingTable__currentColumns__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  [*(id *)(a1 + 32) _updateSchemaVersion];
  uint64_t v3 = [v9 currentColumns];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v6 = [*(id *)(a1 + 32) _readCurrentColumnsUncached];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [v9 setCurrentColumns:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

- (void)_updateSchemaVersion
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__SGMIDomainCountingTable__updateSchemaVersion__block_invoke;
  v3[3] = &unk_1E65BEF88;
  v3[4] = self;
  [(_PASSqliteDatabase *)db readTransaction:v3];
}

uint64_t __47__SGMIDomainCountingTable__updateSchemaVersion__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SGMIDomainCountingTable__updateSchemaVersion__block_invoke_2;
  v4[3] = &unk_1E65BFF78;
  void v4[4] = v1;
  return [v2 prepAndRunQuery:@"PRAGMA schema_version" onPrep:0 onRow:v4 onError:0];
}

uint64_t __47__SGMIDomainCountingTable__updateSchemaVersion__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getIntegerForColumn:0];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SGMIDomainCountingTable__updateSchemaVersion__block_invoke_3;
  v6[3] = &__block_descriptor_40_e44_v16__0__SGMIDomainCountingTableGuardedData_8l;
  void v6[4] = v3;
  [v4 runWithLockAcquired:v6];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __47__SGMIDomainCountingTable__updateSchemaVersion__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setSchemaVersion:*(void *)(a1 + 32)];
}

- (SGMIDomainCountingTable)initWithDatabase:(id)a3 tableName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SGMIDomainCountingTable;
  id v9 = [(SGMIDomainCountingTable *)&v18 init];
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
    objc_storeStrong((id *)&v9->_db, a3);
    objc_storeStrong((id *)&v9->_tableName, a4);
    uint64_t v11 = +[SGMIDomainCountingTable _escapedSQLIdentifier:v8];
    tableNameEscaped = v9->_tableNameEscaped;
    v9->_tableNameEscaped = (NSString *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v14 = objc_opt_new();
    uint64_t v15 = [v13 initWithGuardedData:v14];
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v15;
  }

  return v9;
}

+ (void)createTableNamed:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _escapedSQLIdentifier:v7];
  id v9 = [v7 stringByAppendingString:@"_zeroTotalIdx"];

  uint64_t v10 = [a1 _escapedSQLIdentifier:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__SGMIDomainCountingTable_createTableNamed_inDatabase___block_invoke;
  v14[3] = &unk_1E65C0688;
  id v15 = v6;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v6;
  [v13 writeTransaction:v14];
}

void __55__SGMIDomainCountingTable_createTableNamed_inDatabase___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = (void *)[[NSString alloc] initWithFormat:@"CREATE TABLE %@ (domain TEXT PRIMARY KEY NOT NULL, total INT NOT NULL) WITHOUT ROWID", a1[5]];
  [v2 prepAndRunQuery:v3 onPrep:0 onRow:0 onError:0];

  uint64_t v4 = (void *)a1[4];
  id v5 = (id)[[NSString alloc] initWithFormat:@"CREATE INDEX %@ ON %@ (domain) WHERE total IS 0", a1[6], a1[5]];
  [v4 prepAndRunQuery:v5 onPrep:0 onRow:0 onError:0];
}

+ (id)_escapedSQLIdentifier:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  uint64_t v4 = self;

  if (!v4) {
    goto LABEL_31;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v29 = 0u;
  CFIndex Length = CFStringGetLength(v3);
  CFStringRef theString = v3;
  uint64_t v39 = 0;
  CFIndex v40 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  long long v37 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  }
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  long long v38 = CStringPtr;
  if (Length >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    char v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 64;
    while (1)
    {
      uint64_t v13 = (unint64_t)v11 >= 4 ? 4 : v11;
      CFIndex v14 = v40;
      if (v40 <= v11) {
        break;
      }
      if (v37)
      {
        UniChar v15 = v37[v11 + v39];
      }
      else if (v38)
      {
        UniChar v15 = v38[v39 + v11];
      }
      else
      {
        if (v42 <= v11 || v9 > v11)
        {
          uint64_t v17 = v13 + v8;
          uint64_t v18 = v12 - v13;
          uint64_t v19 = v11 - v13;
          CFIndex v20 = v19 + 64;
          if (v19 + 64 >= v40) {
            CFIndex v20 = v40;
          }
          uint64_t v41 = v19;
          uint64_t v42 = v20;
          if (v40 >= v18) {
            CFIndex v14 = v18;
          }
          v44.length = v14 + v17;
          v44.location = v19 + v39;
          CFStringGetCharacters(theString, v44, buffer);
          uint64_t v9 = v41;
        }
        UniChar v15 = buffer[v11 - v9];
      }
      switch(v15)
      {
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          if ((v10 & 1) == 0) {
            goto LABEL_28;
          }
          break;
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'L':
        case 'M':
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'R':
        case 'S':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case 'X':
        case 'Y':
        case 'Z':
        case '_':
        case 'a':
        case 'b':
        case 'c':
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'q':
        case 'r':
        case 's':
        case 't':
        case 'u':
        case 'v':
        case 'w':
        case 'x':
        case 'y':
        case 'z':
          break;
        default:
          goto LABEL_28;
      }
      ++v11;
      --v8;
      ++v12;
      char v10 = 1;
      if (Length == v11) {
        goto LABEL_31;
      }
    }
LABEL_28:
    UniChar v21 = (void *)MEMORY[0x1CB79B230]();
    if ([(__CFString *)v3 rangeOfString:&stru_1F250EAA0 options:2] != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v26 = [(__CFString *)v3 dataUsingEncoding:10];
      CFIndex v27 = [v26 base64EncodedStringWithOptions:0];

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid SQL identifier (cannot contain interior null). b64 utf16: %@", v27 format];
    }
    id v22 = [NSString alloc];
    long long v23 = [(__CFString *)v3 stringByReplacingOccurrencesOfString:@"\", @"\"\", 2, 0, [(__CFString *)v3 length] withString options range];
    uint64_t v24 = (__CFString *)[v22 initWithFormat:@"\"%@\"", v23];
  }
  else
  {
LABEL_31:

    uint64_t v24 = v3;
  }

  return v24;
}

+ (id)domainByAppendingToken:(id)a3 toDomain:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v15[0] = a4;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:&v14 count:1];
  char v10 = objc_msgSend(a1, "domainForStringTokens:", v9, v14, v15[0]);
  v15[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

  uint64_t v12 = objc_msgSend(v11, "_pas_componentsJoinedByString:", @".");

  return v12;
}

+ (id)stringTokensFromDomain:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1CB79B230]();
  id v5 = [v3 componentsSeparatedByString:@"."];
  id v6 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_84);

  return v6;
}

id __50__SGMIDomainCountingTable_stringTokensFromDomain___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", @"^^", @".", 2, 0, objc_msgSend(v2, "length"));

  uint64_t v4 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @"^ ", @"^", 2, 0, objc_msgSend(v3, "length"));

  return v4;
}

+ (id)domainForStringTokens:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1CB79B230]();
  id v5 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_70_36984);
  id v6 = objc_msgSend(v5, "_pas_componentsJoinedByString:", @".");

  return v6;
}

id __49__SGMIDomainCountingTable_domainForStringTokens___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", @"^", @"^ ", 2, 0, objc_msgSend(v2, "length"));

  uint64_t v4 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @".", @"^^", 2, 0, objc_msgSend(v3, "length"));

  return v4;
}

@end