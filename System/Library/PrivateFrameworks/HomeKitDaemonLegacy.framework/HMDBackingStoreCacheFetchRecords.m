@interface HMDBackingStoreCacheFetchRecords
- (BOOL)recursive;
- (HMDBackingStoreCacheFetchRecords)initWithGroup:(id)a3 parentUuids:(id)a4 fetchResult:(id)a5;
- (HMDBackingStoreCacheFetchRecords)initWithGroup:(id)a3 records:(id)a4 fetchResult:(id)a5;
- (HMDBackingStoreCacheFetchRecords)initWithGroup:(id)a3 uuids:(id)a4 fetchResult:(id)a5;
- (HMDBackingStoreCacheGroup)group;
- (NSArray)parentUuids;
- (NSArray)recordNames;
- (NSArray)uuids;
- (id)fetchResult;
- (id)mainReturningError;
- (void)setFetchResult:(id)a3;
- (void)setGroup:(id)a3;
- (void)setParentUuids:(id)a3;
- (void)setRecordNames:(id)a3;
- (void)setRecursive:(BOOL)a3;
- (void)setUuids:(id)a3;
@end

@implementation HMDBackingStoreCacheFetchRecords

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentUuids, 0);
  objc_storeStrong((id *)&self->_uuids, 0);
  objc_storeStrong((id *)&self->_recordNames, 0);
  objc_storeStrong(&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (void)setParentUuids:(id)a3
{
}

- (NSArray)parentUuids
{
  return self->_parentUuids;
}

- (void)setUuids:(id)a3
{
}

- (NSArray)uuids
{
  return self->_uuids;
}

- (void)setRecordNames:(id)a3
{
}

- (NSArray)recordNames
{
  return self->_recordNames;
}

- (void)setFetchResult:(id)a3
{
}

- (id)fetchResult
{
  return self->_fetchResult;
}

- (void)setGroup:(id)a3
{
}

- (HMDBackingStoreCacheGroup)group
{
  return self->_group;
}

- (void)setRecursive:(BOOL)a3
{
  self->_recursive = a3;
}

- (BOOL)recursive
{
  return self->_recursive;
}

- (id)mainReturningError
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__16722;
  v37 = __Block_byref_object_dispose__16723;
  id v38 = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HMDBackingStoreCacheFetchRecords_mainReturningError__block_invoke;
  aBlock[3] = &unk_1E6A07DC8;
  objc_copyWeak(&v31, &location);
  v30 = &v33;
  id v5 = v3;
  id v28 = v5;
  id v6 = v4;
  id v29 = v6;
  v7 = _Block_copy(aBlock);
  v8 = [(HMDBackingStoreCacheFetchRecords *)self uuids];

  if (v8)
  {
    v9 = [(HMDBackingStoreOperation *)self store];
    v10 = [v9 local];
    v11 = [(HMDBackingStoreCacheFetchRecords *)self group];
    uint64_t v12 = [v11 groupID];
    v13 = [(HMDBackingStoreCacheFetchRecords *)self uuids];
    [v10 _fetchRecordsWithGroupID:v12 uuids:v13 callback:v7];
LABEL_5:

    goto LABEL_6;
  }
  v14 = [(HMDBackingStoreCacheFetchRecords *)self recordNames];

  if (v14)
  {
    v9 = [(HMDBackingStoreOperation *)self store];
    v10 = [v9 local];
    v11 = [(HMDBackingStoreCacheFetchRecords *)self group];
    uint64_t v15 = [v11 groupID];
    v13 = [(HMDBackingStoreCacheFetchRecords *)self recordNames];
    [v10 _fetchRecordsWithGroupID:v15 names:v13 callback:v7];
    goto LABEL_5;
  }
  v20 = [(HMDBackingStoreCacheFetchRecords *)self parentUuids];
  uint64_t v21 = [v20 copy];
  uint64_t v22 = MEMORY[0x1E4F1CBF0];
  while (1)
  {
    v9 = (void *)v21;

    if (![v9 count]) {
      break;
    }
    [v6 removeAllObjects];
    v23 = [(HMDBackingStoreOperation *)self store];
    v24 = [v23 local];
    v25 = [(HMDBackingStoreCacheFetchRecords *)self group];
    objc_msgSend(v24, "_fetchRecordsWithGroupID:parentUuids:callback:", objc_msgSend(v25, "groupID"), v9, v7);

    if (v34[5] || ![(HMDBackingStoreCacheFetchRecords *)self recursive]) {
      break;
    }
    uint64_t v26 = [v6 count];
    v20 = v9;
    uint64_t v21 = v22;
    if (v26)
    {
      uint64_t v21 = [v6 copy];
      v20 = v9;
    }
  }
LABEL_6:

  if (v34[5])
  {

    id v5 = 0;
  }
  v16 = [(HMDBackingStoreCacheFetchRecords *)self fetchResult];

  if (v16)
  {
    v17 = [(HMDBackingStoreCacheFetchRecords *)self fetchResult];
    ((void (**)(void, id, uint64_t))v17)[2](v17, v5, v34[5]);
  }
  id v18 = (id)v34[5];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v33, 8);

  return v18;
}

BOOL __54__HMDBackingStoreCacheFetchRecords_mainReturningError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v14)
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    id v17 = v14;
    id v18 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v17;
  }
  else
  {
    id v28 = v11;
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v11 error:0];
    v19 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSString:", v13);
    v27 = *(void **)(a1 + 32);
    v20 = [HMDBackingStoreCacheFetchRecordResult alloc];
    uint64_t v21 = [WeakRetained group];
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F1A2D8]) initWithCoder:v18];
    uint64_t v23 = a3;
    v24 = (void *)v22;
    v25 = [(HMDBackingStoreCacheFetchRecordResult *)v20 initWithGroup:v21 record:v22 data:v12 encoding:v23 uuid:v19];
    [v27 addObject:v25];

    if (v19) {
      [*(id *)(a1 + 40) addObject:v19];
    }

    id v11 = v28;
  }

  return v14 == 0;
}

- (HMDBackingStoreCacheFetchRecords)initWithGroup:(id)a3 records:(id)a4 fetchResult:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDBackingStoreCacheFetchRecords;
  id v12 = [(HMDBackingStoreOperation *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    objc_storeStrong((id *)&v13->_recordNames, a4);
    id v14 = _Block_copy(v11);
    id fetchResult = v13->_fetchResult;
    v13->_id fetchResult = v14;

    uint64_t v16 = v13;
  }

  return v13;
}

- (HMDBackingStoreCacheFetchRecords)initWithGroup:(id)a3 parentUuids:(id)a4 fetchResult:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDBackingStoreCacheFetchRecords;
  id v12 = [(HMDBackingStoreOperation *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    objc_storeStrong((id *)&v13->_parentUuids, a4);
    id v14 = _Block_copy(v11);
    id fetchResult = v13->_fetchResult;
    v13->_id fetchResult = v14;

    uint64_t v16 = v13;
  }

  return v13;
}

- (HMDBackingStoreCacheFetchRecords)initWithGroup:(id)a3 uuids:(id)a4 fetchResult:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDBackingStoreCacheFetchRecords;
  id v12 = [(HMDBackingStoreOperation *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    objc_storeStrong((id *)&v13->_uuids, a4);
    id v14 = _Block_copy(v11);
    id fetchResult = v13->_fetchResult;
    v13->_id fetchResult = v14;

    uint64_t v16 = v13;
  }

  return v13;
}

@end