@interface HMDCoreDataCloudTransformChangeSet
- (NSSet)deletedModelIDs;
- (id)description;
- (id)initWithHomeModelID:(void *)a3 clientIdentifier:(void *)a4 qualityOfService:;
- (id)inserts;
- (id)updates;
- (void)processChange:(id *)a1;
- (void)processDelete:(void *)a3 tombstone:;
- (void)processUpdate:(void *)a3 updatedProperties:;
@end

@implementation HMDCoreDataCloudTransformChangeSet

- (id)inserts
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)updates
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)processChange:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    v4 = [v3 changedObjectID];
    uint64_t v5 = [v7 changeType];
    if (v5 == 2)
    {
      v6 = [v7 tombstone];
      -[HMDCoreDataCloudTransformChangeSet processDelete:tombstone:](a1, v4, v6);
    }
    else
    {
      if (v5 != 1)
      {
        if (!v5) {
          [a1[1] addObject:v4];
        }
        goto LABEL_9;
      }
      v6 = [v7 updatedProperties];
      -[HMDCoreDataCloudTransformChangeSet processUpdate:updatedProperties:]((uint64_t)a1, v4, v6);
    }

LABEL_9:
    id v3 = v7;
  }
}

- (void)processUpdate:(void *)a3 updatedProperties:
{
  id v9 = a2;
  id v5 = a3;
  if (a1 && ([*(id *)(a1 + 8) containsObject:v9] & 1) == 0)
  {
    v6 = [*(id *)(a1 + 16) objectForKeyedSubscript:v9];
    id v7 = v6;
    if (v6)
    {
      [v6 unionSet:v5];
    }
    else
    {
      v8 = [MEMORY[0x263EFF9C0] setWithSet:v5];
      [*(id *)(a1 + 16) setObject:v8 forKeyedSubscript:v9];
    }
  }
}

- (void)processDelete:(void *)a3 tombstone:
{
  id v10 = a2;
  id v5 = a3;
  if (a1)
  {
    if ([a1[1] containsObject:v10])
    {
      [a1[1] removeObject:v10];
    }
    else
    {
      v6 = [v5 objectForKeyedSubscript:@"modelID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
      id v8 = v7;

      if (v8) {
        [a1[5] addObject:v8];
      }
      [a1[2] setObject:0 forKeyedSubscript:v10];
      if (v5) {
        id v9 = v5;
      }
      else {
        id v9 = (id)MEMORY[0x263EFFA78];
      }
      [a1[3] setObject:v9 forKeyedSubscript:v10];
    }
  }
}

- (id)initWithHomeModelID:(void *)a3 clientIdentifier:(void *)a4 qualityOfService:
{
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)HMDCoreDataCloudTransformChangeSet;
    id v10 = (id *)objc_msgSendSuper2(&v20, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 6, a2);
      objc_storeStrong(a1 + 8, a3);
      a1[7] = a4;
      uint64_t v11 = [MEMORY[0x263EFF9C0] set];
      id v12 = a1[1];
      a1[1] = (id)v11;

      uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
      id v14 = a1[2];
      a1[2] = (id)v13;

      uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
      id v16 = a1[3];
      a1[3] = (id)v15;

      uint64_t v17 = [MEMORY[0x263EFF9C0] set];
      id v18 = a1[5];
      a1[5] = (id)v17;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_homeModelID, 0);
  objc_storeStrong((id *)&self->_deletedModelIDs, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_inserts, 0);
}

- (NSSet)deletedModelIDs
{
  return &self->_deletedModelIDs->super;
}

- (id)description
{
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableSet count](self->_inserts, "count"));
  inserts = self->_inserts;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __49__HMDCoreDataCloudTransformChangeSet_description__block_invoke;
  v32[3] = &unk_264A1F4C8;
  id v33 = v3;
  id v5 = v3;
  [(NSMutableSet *)inserts hmf_enumerateWithAutoreleasePoolUsingBlock:v32];
  v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_updates, "count"));
  updates = self->_updates;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __49__HMDCoreDataCloudTransformChangeSet_description__block_invoke_2;
  v30[3] = &unk_264A1F4F0;
  id v31 = v6;
  id v8 = v6;
  [(NSMutableDictionary *)updates enumerateKeysAndObjectsUsingBlock:v30];
  id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_deletes, "count"));
  deletes = self->_deletes;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __49__HMDCoreDataCloudTransformChangeSet_description__block_invoke_3;
  v28[3] = &unk_264A1F518;
  id v29 = v9;
  id v11 = v9;
  [(NSMutableDictionary *)deletes enumerateKeysAndObjectsUsingBlock:v28];
  id v12 = NSString;
  uint64_t v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  int64_t qualityOfService = self->_qualityOfService;
  homeModelID = self->_homeModelID;
  uint64_t v17 = self->_clientIdentifier;
  id v18 = homeModelID;
  v19 = @"utilityQoS";
  objc_super v20 = @"userInitiatedQoS";
  v21 = @"userInteractiveQoS";
  if (qualityOfService != 33) {
    v21 = 0;
  }
  if (qualityOfService != 25) {
    objc_super v20 = v21;
  }
  if (qualityOfService != 17) {
    v19 = v20;
  }
  v22 = @"defaultQoS";
  v23 = @"backgroundQoS";
  if (qualityOfService != 9) {
    v23 = 0;
  }
  if (qualityOfService != -1) {
    v22 = v23;
  }
  if (qualityOfService <= 16) {
    v19 = v22;
  }
  v24 = v19;
  v25 = HMFBooleanToString();
  v26 = [v12 stringWithFormat:@"<%@ %@: clientIdentifier = %@, qos = %@, transform = %@, inserts = %@, updates = %@, deletes = %@>", v14, v18, v17, v24, v25, v5, v8, v11];

  return v26;
}

void __49__HMDCoreDataCloudTransformChangeSet_description__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hmd_debugIdentifier");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __49__HMDCoreDataCloudTransformChangeSet_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = NSString;
  id v6 = a2;
  MKFPropertyNamesFromDescriptions(a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v5 stringWithFormat:@"[%@]", v10];
  id v8 = *(void **)(a1 + 32);
  id v9 = objc_msgSend(v6, "hmd_debugIdentifier");

  [v8 setObject:v7 forKeyedSubscript:v9];
}

void __49__HMDCoreDataCloudTransformChangeSet_description__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hmd_debugIdentifier");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

@end