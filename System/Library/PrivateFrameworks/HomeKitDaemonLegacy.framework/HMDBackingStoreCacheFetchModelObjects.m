@interface HMDBackingStoreCacheFetchModelObjects
- (HMDBackingStoreCacheFetchModelObjects)initWithGroup:(id)a3 names:(id)a4 fetchResult:(id)a5;
- (HMDBackingStoreCacheFetchModelObjects)initWithGroup:(id)a3 parent:(id)a4 type:(id)a5 fetchResult:(id)a6;
- (HMDBackingStoreCacheFetchModelObjects)initWithGroup:(id)a3 uuids:(id)a4 fetchResult:(id)a5;
- (HMDBackingStoreCacheFetchModelObjects)initWithNames:(id)a3 fetchResult:(id)a4;
- (HMDBackingStoreCacheFetchModelObjects)initWithParent:(id)a3 type:(id)a4 fetchResult:(id)a5;
- (HMDBackingStoreCacheFetchModelObjects)initWithUUIDs:(id)a3 fetchResult:(id)a4;
- (HMDBackingStoreCacheGroup)group;
- (NSArray)names;
- (NSArray)uuids;
- (NSString)type;
- (NSUUID)parent;
- (id)fetchResult;
- (id)mainReturningError;
- (void)setFetchResult:(id)a3;
- (void)setGroup:(id)a3;
- (void)setNames:(id)a3;
- (void)setParent:(id)a3;
- (void)setType:(id)a3;
- (void)setUuids:(id)a3;
@end

@implementation HMDBackingStoreCacheFetchModelObjects

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_uuids, 0);
  objc_storeStrong(&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setParent:(id)a3
{
}

- (NSUUID)parent
{
  return self->_parent;
}

- (void)setNames:(id)a3
{
}

- (NSArray)names
{
  return self->_names;
}

- (void)setUuids:(id)a3
{
}

- (NSArray)uuids
{
  return self->_uuids;
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
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__16722;
  v28 = __Block_byref_object_dispose__16723;
  id v29 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__HMDBackingStoreCacheFetchModelObjects_mainReturningError__block_invoke;
  aBlock[3] = &unk_1E6A14E18;
  v23 = &v24;
  aBlock[4] = self;
  id v4 = v3;
  id v22 = v4;
  v5 = _Block_copy(aBlock);
  v6 = [(HMDBackingStoreCacheFetchModelObjects *)self names];

  if (v6)
  {
    v7 = [(HMDBackingStoreOperation *)self store];
    v8 = [v7 local];
    v9 = [(HMDBackingStoreCacheFetchModelObjects *)self group];
    uint64_t v10 = [v9 groupID];
    v11 = [(HMDBackingStoreCacheFetchModelObjects *)self names];
    [v8 _fetchRecordsWithGroupID:v10 names:v11 callback:v5];
  }
  else
  {
    v12 = [(HMDBackingStoreCacheFetchModelObjects *)self uuids];

    if (v12)
    {
      v7 = [(HMDBackingStoreOperation *)self store];
      v8 = [v7 local];
      v9 = [(HMDBackingStoreCacheFetchModelObjects *)self group];
      uint64_t v13 = [v9 groupID];
      v11 = [(HMDBackingStoreCacheFetchModelObjects *)self uuids];
      [v8 _fetchRecordsWithGroupID:v13 uuids:v11 callback:v5];
    }
    else
    {
      v14 = [(HMDBackingStoreCacheFetchModelObjects *)self parent];

      if (!v14) {
        goto LABEL_8;
      }
      v7 = [(HMDBackingStoreOperation *)self store];
      v8 = [v7 local];
      v9 = [(HMDBackingStoreCacheFetchModelObjects *)self group];
      uint64_t v15 = [v9 groupID];
      v11 = [(HMDBackingStoreCacheFetchModelObjects *)self parent];
      v16 = [(HMDBackingStoreCacheFetchModelObjects *)self type];
      [v8 _fetchRecordsWithGroupID:v15 parent:v11 type:v16 callback:v5];
    }
  }

LABEL_8:
  if (v25[5])
  {

    id v4 = 0;
  }
  v17 = [(HMDBackingStoreCacheFetchModelObjects *)self fetchResult];

  if (v17)
  {
    v18 = [(HMDBackingStoreCacheFetchModelObjects *)self fetchResult];
    ((void (**)(void, id, uint64_t))v18)[2](v18, v4, v25[5]);
  }
  id v19 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v19;
}

BOOL __59__HMDBackingStoreCacheFetchModelObjects_mainReturningError__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v14)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a6);
    BOOL v15 = 0;
  }
  else
  {
    BOOL v15 = 0;
    if (v11 && a3 && v12 && v13)
    {
      v16 = [HMDBackingStoreCacheFetchModelObjectResult alloc];
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v17 + 40);
      v18 = [(HMDBackingStoreCacheFetchModelObjectResult *)v16 initWithRecord:v11 data:v12 encoding:a3 error:&obj];
      objc_storeStrong((id *)(v17 + 40), obj);
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      BOOL v15 = v19 == 0;
      if (v19)
      {
        v20 = (void *)MEMORY[0x1D9452090]();
        id v21 = *(id *)(a1 + 32);
        id v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v23 = uint64_t v26 = v20;
          uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          *(_DWORD *)buf = 138543618;
          id v29 = v23;
          __int16 v30 = 2112;
          uint64_t v31 = v24;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@unable to decode result (%@)", buf, 0x16u);

          v20 = v26;
        }
      }
      else if (v18)
      {
        [*(id *)(a1 + 40) addObject:v18];
      }
    }
  }

  return v15;
}

- (HMDBackingStoreCacheFetchModelObjects)initWithGroup:(id)a3 parent:(id)a4 type:(id)a5 fetchResult:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDBackingStoreCacheFetchModelObjects;
  id v13 = [(HMDBackingStoreOperation *)&v19 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_group, a3);
    BOOL v15 = _Block_copy(v12);
    id fetchResult = v14->_fetchResult;
    v14->_id fetchResult = v15;

    objc_storeStrong((id *)&v14->_parent, a4);
    uint64_t v17 = v14;
  }

  return v14;
}

- (HMDBackingStoreCacheFetchModelObjects)initWithParent:(id)a3 type:(id)a4 fetchResult:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDBackingStoreCacheFetchModelObjects;
  id v10 = [(HMDBackingStoreOperation *)&v15 init];
  if (v10)
  {
    id v11 = _Block_copy(v9);
    id fetchResult = v10->_fetchResult;
    v10->_id fetchResult = v11;

    objc_storeStrong((id *)&v10->_parent, a3);
    id v13 = v10;
  }

  return v10;
}

- (HMDBackingStoreCacheFetchModelObjects)initWithGroup:(id)a3 names:(id)a4 fetchResult:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDBackingStoreCacheFetchModelObjects;
  id v12 = [(HMDBackingStoreOperation *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    id v14 = _Block_copy(v11);
    id fetchResult = v13->_fetchResult;
    v13->_id fetchResult = v14;

    objc_storeStrong((id *)&v13->_names, a4);
    v16 = v13;
  }

  return v13;
}

- (HMDBackingStoreCacheFetchModelObjects)initWithNames:(id)a3 fetchResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDBackingStoreCacheFetchModelObjects;
  id v9 = [(HMDBackingStoreOperation *)&v14 init];
  if (v9)
  {
    id v10 = _Block_copy(v8);
    id fetchResult = v9->_fetchResult;
    v9->_id fetchResult = v10;

    objc_storeStrong((id *)&v9->_names, a3);
    id v12 = v9;
  }

  return v9;
}

- (HMDBackingStoreCacheFetchModelObjects)initWithGroup:(id)a3 uuids:(id)a4 fetchResult:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDBackingStoreCacheFetchModelObjects;
  id v12 = [(HMDBackingStoreOperation *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    objc_super v14 = _Block_copy(v11);
    id fetchResult = v13->_fetchResult;
    v13->_id fetchResult = v14;

    objc_storeStrong((id *)&v13->_uuids, a4);
    v16 = v13;
  }

  return v13;
}

- (HMDBackingStoreCacheFetchModelObjects)initWithUUIDs:(id)a3 fetchResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDBackingStoreCacheFetchModelObjects;
  id v9 = [(HMDBackingStoreOperation *)&v14 init];
  if (v9)
  {
    id v10 = _Block_copy(v8);
    id fetchResult = v9->_fetchResult;
    v9->_id fetchResult = v10;

    objc_storeStrong((id *)&v9->_uuids, a3);
    id v12 = v9;
  }

  return v9;
}

@end