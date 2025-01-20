@interface HMDBackingStoreLogDropOperationsWithUUID
- (HMDBackingStoreLogDropOperationsWithUUID)initWithUUID:(id)a3 pushingTo:(unint64_t)a4 resultBlock:(id)a5;
- (NSUUID)uuid;
- (id)mainReturningError;
- (int64_t)compareValue;
- (int64_t)maskValue;
- (void)setCompareValue:(int64_t)a3;
- (void)setMaskValue:(int64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation HMDBackingStoreLogDropOperationsWithUUID

- (void).cxx_destruct
{
}

- (void)setCompareValue:(int64_t)a3
{
  self->_compareValue = a3;
}

- (int64_t)compareValue
{
  return self->_compareValue;
}

- (void)setMaskValue:(int64_t)a3
{
  self->_maskValue = a3;
}

- (int64_t)maskValue
{
  return self->_maskValue;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)mainReturningError
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__190227;
  v42 = __Block_byref_object_dispose__190228;
  id v43 = 0;
  v4 = [(HMDBackingStoreOperation *)self store];
  v5 = [v4 local];
  v6 = [(HMDBackingStoreOperation *)self store];
  v7 = [v6 root];
  int64_t v8 = [(HMDBackingStoreLogDropOperationsWithUUID *)self maskValue];
  int64_t v9 = [(HMDBackingStoreLogDropOperationsWithUUID *)self compareValue];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __62__HMDBackingStoreLogDropOperationsWithUUID_mainReturningError__block_invoke;
  v35[3] = &unk_264A250F0;
  v37 = &v38;
  v35[4] = self;
  id v10 = v3;
  id v36 = v10;
  [v5 _selectLogWithRoot:v7 after:0 mask:v8 compare:v9 callback:v35];

  v11 = (void *)v39[5];
  if (v11) {
    goto LABEL_3;
  }
  v12 = [(HMDBackingStoreOperation *)self store];
  v13 = [v12 local];
  uint64_t v14 = [v13 _begin];
  v15 = (void *)v39[5];
  v39[5] = v14;

  v11 = (void *)v39[5];
  if (v11)
  {
LABEL_3:
    id v16 = v11;
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v10;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v23 = [(HMDBackingStoreOperation *)self store];
          v24 = [v23 local];
          uint64_t v25 = objc_msgSend(v24, "_deleteLog:", objc_msgSend(v22, "unsignedIntegerValue"));
          v26 = (void *)v39[5];
          v39[5] = v25;

          if (v39[5])
          {
            v29 = [(HMDBackingStoreOperation *)self store];
            v30 = [v29 local];
            [v30 _rollback];

            id v16 = (id)v39[5];
            goto LABEL_4;
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v44 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    v27 = [(HMDBackingStoreOperation *)self store];
    v28 = [v27 local];
    id v16 = [v28 _commit];
  }
LABEL_4:

  _Block_object_dispose(&v38, 8);
  return v16;
}

BOOL __62__HMDBackingStoreLogDropOperationsWithUUID_mainReturningError__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v14 = a8;
  if (v14)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a8);
  }
  else
  {
    id v23 = 0;
    v15 = +[HMDBackingStoreModelObject objectFromData:a7 encoding:a6 error:&v23];
    id v16 = v23;
    [v15 setObjectChangeType:a5];
    if (v16
      || ([v15 uuid],
          v17 = objc_claimAutoreleasedReturnValue(),
          [*(id *)(a1 + 32) uuid],
          id v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v17 isEqual:v18],
          v18,
          v17,
          v19))
    {
      uint64_t v20 = *(void **)(a1 + 40);
      v21 = [NSNumber numberWithLongLong:a2];
      [v20 addObject:v21];
    }
  }

  return v14 != 0;
}

- (HMDBackingStoreLogDropOperationsWithUUID)initWithUUID:(id)a3 pushingTo:(unint64_t)a4 resultBlock:(id)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDBackingStoreLogDropOperationsWithUUID;
  id v10 = [(HMDBackingStoreOperation *)&v14 initWithResultBlock:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_uuid, a3);
    v11->_maskValue = a4;
    v11->_compareValue = a4;
    v12 = v11;
  }

  return v11;
}

@end