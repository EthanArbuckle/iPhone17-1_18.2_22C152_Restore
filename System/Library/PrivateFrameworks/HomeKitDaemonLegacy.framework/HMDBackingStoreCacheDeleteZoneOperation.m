@interface HMDBackingStoreCacheDeleteZoneOperation
- (HMDBackingStoreCacheDeleteZoneOperation)initWithZone:(id)a3 resultBlock:(id)a4;
- (HMDBackingStoreCacheZone)zone;
- (id)creationBlock;
- (id)mainReturningError;
- (void)setCreationBlock:(id)a3;
- (void)setZone:(id)a3;
@end

@implementation HMDBackingStoreCacheDeleteZoneOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong(&self->_creationBlock, 0);
}

- (void)setZone:(id)a3
{
}

- (HMDBackingStoreCacheZone)zone
{
  return self->_zone;
}

- (void)setCreationBlock:(id)a3
{
}

- (id)creationBlock
{
  return self->_creationBlock;
}

- (id)mainReturningError
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__16722;
  v67 = __Block_byref_object_dispose__16723;
  id v68 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HMDBackingStoreCacheDeleteZoneOperation_mainReturningError__block_invoke;
  aBlock[3] = &unk_1E6A07D78;
  v62 = &v63;
  id v50 = v3;
  id v61 = v50;
  v49 = _Block_copy(aBlock);
  v4 = [(HMDBackingStoreOperation *)self store];
  v5 = [v4 local];
  uint64_t v6 = [v5 _begin];
  v7 = (void *)v64[5];
  v64[5] = v6;

  if (v64[5])
  {
    v8 = [(HMDBackingStoreOperation *)self store];
    v9 = [v8 local];
    [v9 _rollback];
  }
  else
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v11 = [(HMDBackingStoreCacheDeleteZoneOperation *)self zone];
    id obj = [v11 groups];

    uint64_t v47 = [obj countByEnumeratingWithState:&v56 objects:v70 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v57;
      while (2)
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v57 != v48) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          [v50 removeAllObjects];
          v13 = [(HMDBackingStoreOperation *)self store];
          v14 = [v13 local];
          objc_msgSend(v14, "_fetchRecordsWithGroupID:callback:", objc_msgSend(v12, "groupID"), v49);

          if (v64[5]) {
            goto LABEL_24;
          }
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v15 = v50;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v69 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v53;
LABEL_12:
            uint64_t v18 = 0;
            while (1)
            {
              if (*(void *)v53 != v17) {
                objc_enumerationMutation(v15);
              }
              uint64_t v19 = *(void *)(*((void *)&v52 + 1) + 8 * v18);
              v20 = [(HMDBackingStoreOperation *)self store];
              v21 = [v20 local];
              uint64_t v22 = objc_msgSend(v21, "_deleteRecordWithGroupID:recordName:", objc_msgSend(v12, "groupID"), v19);
              v23 = (void *)v64[5];
              v64[5] = v22;

              if (v64[5]) {
                break;
              }
              if (v16 == ++v18)
              {
                uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v69 count:16];
                if (v16) {
                  goto LABEL_12;
                }
                break;
              }
            }
          }

          if (v64[5]) {
            goto LABEL_24;
          }
          v24 = [(HMDBackingStoreOperation *)self store];
          v25 = [v24 local];
          uint64_t v26 = objc_msgSend(v25, "_deleteGroupWithID:", objc_msgSend(v12, "groupID"));
          v27 = (void *)v64[5];
          v64[5] = v26;

          if (v64[5])
          {
LABEL_24:
            v35 = [(HMDBackingStoreOperation *)self store];
            v36 = [v35 local];
            [v36 _rollback];

            id v10 = (id)v64[5];
            goto LABEL_25;
          }
        }
        uint64_t v47 = [obj countByEnumeratingWithState:&v56 objects:v70 count:16];
        if (v47) {
          continue;
        }
        break;
      }
    }

    v28 = [(HMDBackingStoreOperation *)self store];
    v29 = [v28 local];
    v30 = [(HMDBackingStoreCacheDeleteZoneOperation *)self zone];
    uint64_t v31 = objc_msgSend(v29, "_deleteZoneWithID:", objc_msgSend(v30, "zoneID"));
    v32 = (void *)v64[5];
    v64[5] = v31;

    if (v64[5])
    {
      v33 = [(HMDBackingStoreOperation *)self store];
      v34 = [v33 local];
      [v34 _rollback];
    }
    else
    {
      v38 = [(HMDBackingStoreOperation *)self store];
      v39 = [v38 local];
      uint64_t v40 = [v39 _commit];
      v41 = (void *)v64[5];
      v64[5] = v40;

      if (v64[5])
      {
        v42 = [(HMDBackingStoreOperation *)self store];
        v43 = [v42 local];
        [v43 _rollback];
      }
      else
      {
        v42 = [(HMDBackingStoreOperation *)self store];
        v43 = [v42 local];
        v44 = [v43 zoneCache];
        v45 = [(HMDBackingStoreCacheDeleteZoneOperation *)self zone];
        [v44 removeObject:v45];
      }
    }
  }
  id v10 = (id)v64[5];
LABEL_25:

  _Block_object_dispose(&v63, 8);
  return v10;
}

uint64_t __61__HMDBackingStoreCacheDeleteZoneOperation_mainReturningError__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v16 = a2;
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v23 || *(void *)(v24 + 40))
  {
    objc_storeStrong((id *)(v24 + 40), a10);
    uint64_t v25 = 0;
  }
  else
  {
    if (v16) {
      [*(id *)(a1 + 32) addObject:v16];
    }
    uint64_t v25 = 1;
  }

  return v25;
}

- (HMDBackingStoreCacheDeleteZoneOperation)initWithZone:(id)a3 resultBlock:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDBackingStoreCacheDeleteZoneOperation;
  v8 = [(HMDBackingStoreOperation *)&v12 initWithResultBlock:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_zone, a3);
    id v10 = v9;
  }

  return v9;
}

@end