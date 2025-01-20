@interface HMDBackingStoreCacheFetchRecordMappings
- (HMDBackingStoreCacheFetchRecordMappings)initWithGroup:(id)a3 fetchResult:(id)a4;
- (HMDBackingStoreCacheGroup)group;
- (id)fetchResult;
- (id)mainReturningError;
- (void)setFetchResult:(id)a3;
- (void)setGroup:(id)a3;
@end

@implementation HMDBackingStoreCacheFetchRecordMappings

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_group, 0);
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

- (id)mainReturningError
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__16722;
  v25 = __Block_byref_object_dispose__16723;
  id v26 = 0;
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __61__HMDBackingStoreCacheFetchRecordMappings_mainReturningError__block_invoke;
  v16 = &unk_1E6A07DF0;
  objc_copyWeak(&v19, &location);
  v18 = &v21;
  id v4 = v3;
  id v17 = v4;
  v5 = _Block_copy(&v13);
  v6 = [(HMDBackingStoreOperation *)self store];
  v7 = [v6 local];
  v8 = [(HMDBackingStoreCacheFetchRecordMappings *)self group];
  objc_msgSend(v7, "_fetchRecordMapWithGroupID:callback:", objc_msgSend(v8, "groupID"), v5);

  if (v22[5])
  {

    id v4 = 0;
  }
  v9 = [(HMDBackingStoreCacheFetchRecordMappings *)self fetchResult];

  if (v9)
  {
    v10 = [(HMDBackingStoreCacheFetchRecordMappings *)self fetchResult];
    ((void (**)(void, id, uint64_t))v10)[2](v10, v4, v22[5]);
  }
  id v11 = (id)v22[5];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v21, 8);

  return v11;
}

BOOL __61__HMDBackingStoreCacheFetchRecordMappings_mainReturningError__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v15)
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    id v18 = v15;
    id v19 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v18;
LABEL_5:

    goto LABEL_6;
  }
  if (v11)
  {
    v25 = *(void **)(a1 + 32);
    v20 = [HMDBackingStoreCacheFetchRecordMappingResult alloc];
    id v19 = [WeakRetained group];
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSString:", v12);
    v22 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSString:", v13);
    uint64_t v23 = [(HMDBackingStoreCacheFetchRecordMappingResult *)v20 initWithGroup:v19 recordName:v11 uuid:v21 parentUuid:v22 type:v14];
    [v25 addObject:v23];

    goto LABEL_5;
  }
LABEL_6:

  return v15 != 0;
}

- (HMDBackingStoreCacheFetchRecordMappings)initWithGroup:(id)a3 fetchResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDBackingStoreCacheFetchRecordMappings;
  v9 = [(HMDBackingStoreOperation *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_group, a3);
    id v11 = _Block_copy(v8);
    id fetchResult = v10->_fetchResult;
    v10->_id fetchResult = v11;

    id v13 = v10;
  }

  return v10;
}

@end