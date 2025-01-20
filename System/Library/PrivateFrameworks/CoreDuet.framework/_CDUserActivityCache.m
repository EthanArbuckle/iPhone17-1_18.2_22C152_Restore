@interface _CDUserActivityCache
- (BOOL)containsObjectForSourceID:(id)a3 bundleID:(id)a4 itemID:(id)a5;
- (_CDUserActivityCache)initWithKnowledgeStore:(id)a3;
- (id)hashArrayForSourceID:(id)a3 bundleID:(id)a4 itemID:(id)a5;
- (unsigned)count;
- (void)_populateAppActivityStream;
- (void)_populateAppLocationActivityStream;
- (void)addSourceID:(id)a3 bundleID:(id)a4 itemID:(id)a5;
- (void)populateCache;
@end

@implementation _CDUserActivityCache

- (_CDUserActivityCache)initWithKnowledgeStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CDUserActivityCache;
  v6 = [(_CDUserActivityCache *)&v12 init];
  if (v6)
  {
    LODWORD(v7) = 953267991;
    v8 = [MEMORY[0x1E4F93AB8] bloomFilterInMemoryWithNumberOfValuesN:13355 errorRateP:v7];
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v8];
    deletionCache = v6->_deletionCache;
    v6->_deletionCache = (_PASLock *)v9;

    objc_storeStrong((id *)&v6->_knowledgeStore, a3);
    v6->_count = 0;
  }
  return v6;
}

- (unsigned)count
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  deletionCache = self->_deletionCache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29___CDUserActivityCache_count__block_invoke;
  v5[3] = &unk_1E560FA40;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)deletionCache runWithLockAcquired:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)hashArrayForSourceID:(id)a3 bundleID:(id)a4 itemID:(id)a5
{
  uint64_t v8 = (__CFString *)a3;
  int v9 = (__CFString *)a4;
  id v10 = a5;
  if (v8) {
    v11 = v8;
  }
  else {
    v11 = &stru_1EDDE58B8;
  }
  objc_super v12 = v11;
  if (v9) {
    v13 = v9;
  }
  else {
    v13 = &stru_1EDDE58B8;
  }
  v14 = v13;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__16;
  v30 = __Block_byref_object_dispose__16;
  id v31 = 0;
  deletionCache = self->_deletionCache;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61___CDUserActivityCache_hashArrayForSourceID_bundleID_itemID___block_invoke;
  v21[3] = &unk_1E560FA68;
  v25 = &v26;
  v16 = v12;
  v22 = v16;
  v17 = v14;
  v23 = v17;
  id v18 = v10;
  id v24 = v18;
  [(_PASLock *)deletionCache runWithLockAcquired:v21];
  id v19 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v19;
}

- (void)addSourceID:(id)a3 bundleID:(id)a4 itemID:(id)a5
{
  uint64_t v6 = [(_CDUserActivityCache *)self hashArrayForSourceID:a3 bundleID:a4 itemID:a5];
  deletionCache = self->_deletionCache;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52___CDUserActivityCache_addSourceID_bundleID_itemID___block_invoke;
  v9[3] = &unk_1E560FA90;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  [(_PASLock *)deletionCache runWithLockAcquired:v9];
}

- (BOOL)containsObjectForSourceID:(id)a3 bundleID:(id)a4 itemID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(_CDUserActivityCache *)self hashArrayForSourceID:v8 bundleID:v9 itemID:v10];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  deletionCache = self->_deletionCache;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66___CDUserActivityCache_containsObjectForSourceID_bundleID_itemID___block_invoke;
  v15[3] = &unk_1E560FA40;
  v17 = &v18;
  id v13 = v11;
  id v16 = v13;
  [(_PASLock *)deletionCache runWithLockAcquired:v15];
  LOBYTE(deletionCache) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)deletionCache;
}

- (void)_populateAppActivityStream
{
  uint64_t v2 = 0;
  v36[1] = *MEMORY[0x1E4F143B8];
  do
  {
    context = (void *)MEMORY[0x192FB2F20](self, a2);
    unsigned int v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    v4 = +[_DKSystemEventStreams appActivityStream];
    v36[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    uint64_t v28 = v2;
    uint64_t v6 = +[_DKEventQuery eventQueryWithPredicate:v3 eventStreams:v5 offset:v2 limit:100 sortDescriptors:0];

    knowledgeStore = self->_knowledgeStore;
    id v34 = 0;
    uint64_t v26 = (void *)v6;
    id v8 = [(_DKKnowledgeQuerying *)knowledgeStore executeQuery:v6 error:&v34];
    id v24 = v34;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v10 = 0;
    if (isKindOfClass) {
      id v10 = v8;
    }
    v25 = v8;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "source", v24, v25);
          uint64_t v18 = [v17 sourceID];
          id v19 = [v16 source];
          uint64_t v20 = [v19 bundleID];
          char v21 = [v16 source];
          v22 = [v21 itemID];
          [(_CDUserActivityCache *)self addSourceID:v18 bundleID:v20 itemID:v22];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
    }
    uint64_t v2 = v28 + 100;

    unint64_t v23 = [v11 count];
  }
  while (v23 > 0x63);
}

- (void)_populateAppLocationActivityStream
{
  v14[1] = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  v4 = +[_DKSystemEventStreams appLocationActivityStream];
  v14[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v6 = +[_DKEventQuery eventQueryWithPredicate:v3 eventStreams:v5 offset:0 limit:0 sortDescriptors:0];

  double v7 = [[_DKBiomeQuery alloc] initWithDKEventQuery:v6];
  id v13 = 0;
  id v8 = [(_DKBiomeQuery *)v7 publisherForQueryWithError:&v13];
  id v9 = v13;
  id v10 = (void *)MEMORY[0x192FB2F20]();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58___CDUserActivityCache__populateAppLocationActivityStream__block_invoke_2;
  v12[3] = &unk_1E560FAB8;
  v12[4] = self;
  id v11 = (id)[v8 sinkWithCompletion:&__block_literal_global_49 receiveInput:v12];
}

- (void)populateCache
{
  unsigned int v3 = (void *)MEMORY[0x192FB2F20](self, a2);
  [(_CDUserActivityCache *)self _populateAppActivityStream];
  [(_CDUserActivityCache *)self _populateAppLocationActivityStream];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletionCache, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end