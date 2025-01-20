@interface HMDBackingStoreCacheDeleteRecordOperation
- (HMDBackingStoreCacheDeleteRecordOperation)initWithGroup:(id)a3 recordNames:(id)a4 resultBlock:(id)a5;
- (HMDBackingStoreCacheGroup)group;
- (NSArray)recordNames;
- (id)mainReturningError;
- (void)setGroup:(id)a3;
- (void)setRecordNames:(id)a3;
@end

@implementation HMDBackingStoreCacheDeleteRecordOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordNames, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (void)setRecordNames:(id)a3
{
}

- (NSArray)recordNames
{
  return self->_recordNames;
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
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [(HMDBackingStoreOperation *)self store];
  v4 = [v3 local];
  v5 = [v4 _begin];

  if (v5) {
    goto LABEL_13;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = [(HMDBackingStoreCacheDeleteRecordOperation *)self recordNames];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v12 = [(HMDBackingStoreOperation *)self store];
        v13 = [v12 local];
        v14 = [(HMDBackingStoreCacheDeleteRecordOperation *)self group];
        v5 = objc_msgSend(v13, "_deleteRecordWithGroupID:recordName:", objc_msgSend(v14, "groupID"), v11);

        if (v5)
        {

          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v15 = [(HMDBackingStoreOperation *)self store];
  v16 = [v15 local];
  v5 = [v16 _commit];

  if (v5)
  {
LABEL_13:
    v17 = [(HMDBackingStoreOperation *)self store];
    v18 = [v17 local];
    [v18 _rollback];
  }
  id v19 = v5;

  return v19;
}

- (HMDBackingStoreCacheDeleteRecordOperation)initWithGroup:(id)a3 recordNames:(id)a4 resultBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDBackingStoreCacheDeleteRecordOperation;
  uint64_t v11 = [(HMDBackingStoreOperation *)&v15 initWithResultBlock:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_group, a3);
    objc_storeStrong((id *)&v12->_recordNames, a4);
    v13 = v12;
  }

  return v12;
}

@end