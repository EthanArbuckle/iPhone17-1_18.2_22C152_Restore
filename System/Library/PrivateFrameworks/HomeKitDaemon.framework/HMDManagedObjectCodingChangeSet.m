@interface HMDManagedObjectCodingChangeSet
- (BOOL)isEmpty;
- (HMDManagedObjectCodingChangeSet)initWithCodingModel:(id)a3 context:(id)a4 changes:(id)a5;
- (HMDManagedObjectCodingChangeSet)initWithCodingModel:(id)a3 context:(id)a4 transactions:(id)a5;
- (HMDManagedObjectCodingChangeSetSummary)summary;
- (int64_t)changeScopeForObjectWithID:(id)a3 attributeKeys:(id *)a4 relationshipKeys:(id *)a5;
- (void)synthesizeParentChildChanges:(void *)a3 forObject:(void *)a4 withDescription:(void *)a5 model:;
@end

@implementation HMDManagedObjectCodingChangeSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_changedObjects, 0);
}

- (HMDManagedObjectCodingChangeSetSummary)summary
{
  summary = self->_summary;
  if (!summary)
  {
    v4 = (void *)MEMORY[0x230FBD990]();
    v5 = [MEMORY[0x263EFF9C0] set];
    v6 = [MEMORY[0x263EFF9C0] set];
    v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_changedObjects, "count"));
    changedObjects = self->_changedObjects;
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __42__HMDManagedObjectCodingChangeSet_summary__block_invoke;
    v21 = &unk_264A268F0;
    v22 = self;
    id v23 = v7;
    id v24 = v5;
    id v25 = v6;
    id v9 = v6;
    id v10 = v5;
    id v11 = v7;
    [(NSMutableDictionary *)changedObjects enumerateKeysAndObjectsUsingBlock:&v18];
    v12 = objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_, v18, v19, v20, v21, v22);
    v13 = [v12 componentsJoinedByString:&stru_26E2EB898];

    v14 = [[HMDManagedObjectCodingChangeSetSummary alloc] initWithShortDescriptionForChangeSet:v13 insertedObjectNames:v10 modifiedObjectPropertyNames:v9];
    v15 = self->_summary;
    self->_summary = v14;

    summary = self->_summary;
  }
  v16 = summary;
  return v16;
}

void __42__HMDManagedObjectCodingChangeSet_summary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "hmd_debugIdentifier");
  v8 = [v7 componentsSeparatedByString:@"/"];
  id v9 = [v8 firstObject];

  if (v9)
  {
    if (v6 == @"<*>")
    {
      v33 = *(void **)(a1 + 40);
      v34 = [NSString stringWithFormat:@"\n<%@>: %@", v7, @"<*>"];
      [v33 addObject:v34];

      [*(id *)(a1 + 48) addObject:v9];
    }
    else if (v6)
    {
      id v36 = v5;
      id v10 = (void *)MEMORY[0x263EFF980];
      id v11 = -[HMDManagedObjectCodingChangeDetails changedAttributeKeys]((uint64_t)v6);
      uint64_t v12 = [v11 count];
      v13 = -[HMDManagedObjectCodingChangeDetails changedRelationshipKeys]((uint64_t)v6);
      v14 = objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v13, "count") + v12);

      v15 = -[HMDManagedObjectCodingChangeDetails changedAttributeKeys]((uint64_t)v6);
      v16 = [v15 allObjects];
      [v14 addObjectsFromArray:v16];

      v17 = -[HMDManagedObjectCodingChangeDetails changedRelationshipKeys]((uint64_t)v6);
      uint64_t v18 = [v17 allObjects];
      [v14 addObjectsFromArray:v18];

      uint64_t v19 = *(void **)(a1 + 40);
      v20 = NSString;
      v21 = [v14 componentsJoinedByString:@", "];
      v35 = v7;
      v22 = [v20 stringWithFormat:@"\n<%@>: %@", v7, v21];
      [v19 addObject:v22];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v23 = v14;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v38;
        do
        {
          uint64_t v27 = 0;
          do
          {
            if (*(void *)v38 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = [NSString stringWithFormat:@"%@_%@", v9, *(void *)(*((void *)&v37 + 1) + 8 * v27)];
            [*(id *)(a1 + 56) addObject:v28];

            ++v27;
          }
          while (v25 != v27);
          uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v25);
      }

      v7 = v35;
      id v5 = v36;
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x230FBD990]();
    id v30 = *(id *)(a1 + 32);
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v32;
      __int16 v44 = 2112;
      v45 = v7;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse object name from debug identifier: %@", buf, 0x16u);
    }
  }
}

- (int64_t)changeScopeForObjectWithID:(id)a3 attributeKeys:(id *)a4 relationshipKeys:(id *)a5
{
  v7 = [(NSMutableDictionary *)self->_changedObjects objectForKeyedSubscript:a3];
  v8 = v7;
  if (v7 == @"<*>")
  {
    int64_t v9 = 3;
  }
  else if (v7)
  {
    if (a4)
    {
      -[HMDManagedObjectCodingChangeDetails changedAttributeKeys]((uint64_t)v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a5)
    {
      -[HMDManagedObjectCodingChangeDetails changedRelationshipKeys]((uint64_t)v8);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    int64_t v9 = 2;
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (BOOL)isEmpty
{
  return [(NSMutableDictionary *)self->_changedObjects count] == 0;
}

- (HMDManagedObjectCodingChangeSet)initWithCodingModel:(id)a3 context:(id)a4 transactions:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_transactions___block_invoke;
  v12[3] = &unk_264A268A0;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(HMDManagedObjectCodingChangeSet *)self initWithCodingModel:a3 context:a4 changes:v12];

  return v10;
}

void __76__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_transactions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_transactions___block_invoke_2;
  v6[3] = &unk_264A26878;
  id v8 = v9;
  id v5 = v3;
  id v7 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v6);

  _Block_object_dispose(v9, 8);
}

void __76__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_transactions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 transactionNumber];
  v4 = [v3 changes];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_transactions___block_invoke_3;
  v5[3] = &unk_264A26850;
  id v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v5);
}

uint64_t __76__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_transactions___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HMDManagedObjectCodingChangeSet)initWithCodingModel:(id)a3 context:(id)a4 changes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  v23.receiver = self;
  v23.super_class = (Class)HMDManagedObjectCodingChangeSet;
  id v11 = [(HMDManagedObjectCodingChangeSet *)&v23 init];
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __71__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_changes___block_invoke;
    v18[3] = &unk_264A26828;
    id v19 = v8;
    id v13 = (NSMutableDictionary *)v12;
    v20 = v13;
    v14 = v11;
    v21 = v14;
    id v22 = v9;
    v10[2](v10, v18);
    changedObjects = v14->_changedObjects;
    v14->_changedObjects = v13;
    v16 = v13;
  }
  return v11;
}

void __71__HMDManagedObjectCodingChangeSet_initWithCodingModel_context_changes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 changedObjectID];
  id v5 = *(void **)(a1 + 32);
  id v6 = [v4 entity];
  id v7 = [v5 descriptionForEntity:v6];

  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v8 = [v3 changeType];
  switch(v8)
  {
    case 2:
      id v9 = *(void **)(a1 + 40);
      id v10 = 0;
      goto LABEL_7;
    case 1:
      v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
      if (v17 != @"<*>")
      {
        uint64_t v11 = *(void *)(a1 + 48);
        id v12 = [v3 updatedProperties];
        id v13 = v7;
        if (v11)
        {
          uint64_t v22 = 0;
          objc_super v23 = &v22;
          uint64_t v24 = 0x2020000000;
          char v25 = 0;
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __97__HMDManagedObjectCodingChangeSet_populateChangeDetails_withUpdatedProperties_codingDescription___block_invoke;
          v18[3] = &unk_264A268C8;
          id v14 = v13;
          v20 = &v22;
          v21 = &v17;
          id v19 = v14;
          objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);
          int v15 = *((unsigned __int8 *)v23 + 24);

          _Block_object_dispose(&v22, 8);
          if (!v15) {
            goto LABEL_15;
          }
          [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:v4];
          id v16 = [*(id *)(a1 + 32) rootDescription];

          if (v14 == v16) {
            goto LABEL_15;
          }
          id v12 = [*(id *)(a1 + 56) existingObjectWithID:v4 error:0];
          if (v12) {
            -[HMDManagedObjectCodingChangeSet synthesizeParentChildChanges:forObject:withDescription:model:](*(void *)(a1 + 48), *(void **)(a1 + 40), v12, v14, *(void **)(a1 + 32));
          }
        }
        else
        {
        }
      }
LABEL_15:

      break;
    case 0:
      id v9 = *(void **)(a1 + 40);
      id v10 = @"<*>";
LABEL_7:
      [v9 setObject:v10 forKeyedSubscript:v4];
      break;
  }
LABEL_16:
}

- (void)synthesizeParentChildChanges:(void *)a3 forObject:(void *)a4 withDescription:(void *)a5 model:
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  uint64_t v27 = a1;
  if (a1)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v12 = [a4 parentRelationships];
    uint64_t v31 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v31)
    {
      id v29 = v10;
      uint64_t v30 = *(void *)v33;
      v28 = v12;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v33 != v30) {
            objc_enumerationMutation(v12);
          }
          id v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          int v15 = [v14 name];
          id v16 = [v10 valueForKey:v15];

          if (v16)
          {
            v17 = v11;
            uint64_t v18 = [v11 descriptionForManagedObject:v16];
            id v19 = [v14 inverseRelationship];
            v20 = [v18 descriptionForRelationship:v19];
            v21 = [v20 codingKey];

            uint64_t v22 = [v16 objectID];
            objc_super v23 = [v9 objectForKeyedSubscript:v22];
            if (v23 == @"<*>")
            {
              uint64_t v24 = (HMDManagedObjectCodingChangeDetails *)@"<*>";
            }
            else
            {
              uint64_t v24 = (HMDManagedObjectCodingChangeDetails *)v23;
              if (v23)
              {
                -[HMDManagedObjectCodingChangeDetails addChangedRelationshipCodingKey:]((uint64_t)v23, v21);
              }
              else
              {
                uint64_t v24 = objc_alloc_init(HMDManagedObjectCodingChangeDetails);
                [v9 setObject:v24 forKeyedSubscript:v22];
                -[HMDManagedObjectCodingChangeDetails addChangedRelationshipCodingKey:]((uint64_t)v24, v21);
                [v17 rootDescription];
                v26 = id v25 = v9;

                if (v18 != v26) {
                  -[HMDManagedObjectCodingChangeSet synthesizeParentChildChanges:forObject:withDescription:model:](v27, v25, v16, v18, v17);
                }
                id v9 = v25;
                id v12 = v28;
                id v10 = v29;
              }
            }

            id v11 = v17;
          }
        }
        uint64_t v31 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v31);
    }
  }
}

uint64_t __97__HMDManagedObjectCodingChangeSet_populateChangeDetails_withUpdatedProperties_codingDescription___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [*(id *)(a1 + 32) descriptionForAttribute:v19];
    if (v3)
    {
      uint64_t v4 = **(void **)(a1 + 48);
      if (!v4)
      {
        id v5 = objc_alloc_init(HMDManagedObjectCodingChangeDetails);
        id v6 = *(void ***)(a1 + 48);
        id v7 = *v6;
        void *v6 = v5;

        uint64_t v8 = *(uint64_t **)(a1 + 48);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        uint64_t v4 = *v8;
      }
      id v9 = [v3 codingKey];
      if (v4)
      {
        id v10 = *(void **)(v4 + 8);
        if (v10)
        {
          [v10 addObject:v9];
        }
        else
        {
          uint64_t v16 = [MEMORY[0x263EFF9C0] setWithObject:v9];
          v17 = *(void **)(v4 + 8);
          *(void *)(v4 + 8) = v16;
        }
      }

LABEL_15:
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    id v3 = [*(id *)(a1 + 32) descriptionForRelationship:v19];
    if (v3)
    {
      uint64_t v11 = **(void **)(a1 + 48);
      if (!v11)
      {
        id v12 = objc_alloc_init(HMDManagedObjectCodingChangeDetails);
        id v13 = *(void ***)(a1 + 48);
        id v14 = *v13;
        NSMutableDictionary *v13 = v12;

        int v15 = *(uint64_t **)(a1 + 48);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        uint64_t v11 = *v15;
      }
      id v9 = [v3 codingKey];
      -[HMDManagedObjectCodingChangeDetails addChangedRelationshipCodingKey:](v11, v9);
      goto LABEL_15;
    }
  }

LABEL_17:
  return MEMORY[0x270F9A790]();
}

@end