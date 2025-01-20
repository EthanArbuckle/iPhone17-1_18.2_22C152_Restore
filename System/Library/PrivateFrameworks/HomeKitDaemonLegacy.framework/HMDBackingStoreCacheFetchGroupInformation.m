@interface HMDBackingStoreCacheFetchGroupInformation
- (HMDBackingStoreCacheFetchGroupInformation)initWithGroup:(id)a3 fetchResult:(id)a4;
- (HMDBackingStoreCacheGroup)group;
- (id)fetchResult;
- (id)mainReturningError;
- (void)setFetchResult:(id)a3;
- (void)setGroup:(id)a3;
@end

@implementation HMDBackingStoreCacheFetchGroupInformation

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
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16722;
  v16 = __Block_byref_object_dispose__16723;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__HMDBackingStoreCacheFetchGroupInformation_mainReturningError__block_invoke;
  v11[3] = &unk_1E6A07DA0;
  v11[4] = &v12;
  v11[5] = &v18;
  v3 = _Block_copy(v11);
  v4 = [(HMDBackingStoreOperation *)self store];
  v5 = [v4 local];
  v6 = [(HMDBackingStoreCacheFetchGroupInformation *)self group];
  objc_msgSend(v5, "_fetchRecordCountWithGroupID:callback:", objc_msgSend(v6, "groupID"), v3);

  v7 = [(HMDBackingStoreCacheFetchGroupInformation *)self fetchResult];

  if (v7)
  {
    v8 = [(HMDBackingStoreCacheFetchGroupInformation *)self fetchResult];
    v8[2](v8, v19[3], v13[5]);
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

BOOL __63__HMDBackingStoreCacheFetchGroupInformation_mainReturningError__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  else {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }

  return v6 == 0;
}

- (HMDBackingStoreCacheFetchGroupInformation)initWithGroup:(id)a3 fetchResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDBackingStoreCacheFetchGroupInformation;
  id v9 = [(HMDBackingStoreOperation *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_group, a3);
    v11 = _Block_copy(v8);
    id fetchResult = v10->_fetchResult;
    v10->_id fetchResult = v11;

    v13 = v10;
  }

  return v10;
}

@end