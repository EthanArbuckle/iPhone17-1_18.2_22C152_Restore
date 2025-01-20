@interface CRKArrayDifferenceEngine
+ (id)configurationWithIncomingItemsIdentifierFunction:(id)a3 publishedItemsIdentifierFunction:(id)a4;
+ (id)identityConfiguration;
- (CRKArrayDifferenceConfiguration)configuration;
- (CRKArrayDifferenceEngine)initWithObject:(id)a3 keyPath:(id)a4 configuration:(id)a5;
- (void)setConfiguration:(id)a3;
- (void)updateWithNewArray:(id)a3;
@end

@implementation CRKArrayDifferenceEngine

- (CRKArrayDifferenceEngine)initWithObject:(id)a3 keyPath:(id)a4 configuration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CRKArrayDifferenceEngine;
  v11 = [(CRKArrayDifferenceEngine *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->mObject, v8);
    uint64_t v13 = [v9 copy];
    mKeyPath = v12->mKeyPath;
    v12->mKeyPath = (NSString *)v13;

    objc_storeStrong((id *)&v12->_configuration, a5);
  }

  return v12;
}

+ (id)identityConfiguration
{
  v2 = objc_opt_new();

  return v2;
}

+ (id)configurationWithIncomingItemsIdentifierFunction:(id)a3 publishedItemsIdentifierFunction:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setIncomingItemsIdentifierFunction:v6];

  [v7 setPublishedItemsIdentifierFunction:v5];

  return v7;
}

- (void)updateWithNewArray:(id)a3
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mObject);
  if (!WeakRetained)
  {
    v79 = [MEMORY[0x263F08690] currentHandler];
    [v79 handleFailureInMethod:a2 object:self file:@"CRKArrayDifferenceEngine.m" lineNumber:104 description:@"client must ensure that the object to be updated is kept alive"];
  }
  id v6 = [WeakRetained mutableArrayValueForKeyPath:self->mKeyPath];
  v7 = [(CRKArrayDifferenceEngine *)self configuration];
  uint64_t v8 = [v7 incomingItemsIdentifierFunction];
  id v9 = &off_224CC0000;
  v98 = v4;
  v96 = WeakRetained;
  v102 = v6;
  if (v8)
  {
    id v10 = (void *)v8;
    v11 = [(CRKArrayDifferenceEngine *)self configuration];
    v12 = [v11 publishedItemsIdentifierFunction];

    if (v12)
    {
      uint64_t v13 = [(CRKArrayDifferenceEngine *)self configuration];
      v14 = [v13 incomingItemsIdentifierFunction];

      v15 = [(CRKArrayDifferenceEngine *)self configuration];
      objc_super v16 = [v15 publishedItemsIdentifierFunction];

      v125[0] = MEMORY[0x263EF8330];
      v125[1] = 3221225472;
      v125[2] = __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke;
      v125[3] = &unk_2646F45A8;
      id v17 = v16;
      id v126 = v17;
      v18 = objc_msgSend(v6, "crk_mapUsingBlock:", v125);
      id v99 = [MEMORY[0x263EFFA08] setWithArray:v18];
      uint64_t v19 = [v99 count];
      v103 = v18;
      if (v19 != [v18 count])
      {
        v82 = [MEMORY[0x263F08690] currentHandler];
        [v82 handleFailureInMethod:a2, self, @"CRKArrayDifferenceEngine.m", 127, @"identifiers are not unique in the published array: %@", v6 object file lineNumber description];
      }
      v105 = self;
      v20 = objc_opt_new();
      long long v121 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      id v21 = v4;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v121 objects:v127 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v122;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v122 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v121 + 1) + 8 * i);
            v27 = v14[2](v14, v26);
            [v20 setObject:v26 forKeyedSubscript:v27];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v121 objects:v127 count:16];
        }
        while (v23);
      }

      v28 = (void *)MEMORY[0x263EFFA08];
      v29 = [v20 allKeys];
      v30 = [v28 setWithArray:v29];

      id v31 = v30;
      uint64_t v32 = [v31 count];
      self = v105;
      if (v32 != [v20 count])
      {
        v83 = [MEMORY[0x263F08690] currentHandler];
        [v83 handleFailureInMethod:a2, v105, @"CRKArrayDifferenceEngine.m", 135, @"identifiers are not unique in the incoming array: %@", v21 object file lineNumber description];
      }
      v119[0] = MEMORY[0x263EF8330];
      v119[1] = 3221225472;
      v119[2] = __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke_2;
      v119[3] = &unk_2646F4C98;
      id v120 = v20;
      id v33 = v20;
      v34 = (void *)MEMORY[0x22A620AF0](v119);
      v35 = v99;
      v36 = [v99 setByIntersectingSet:v31];

      v37 = v102;
      v38 = v31;
      id v9 = &off_224CC0000;
      goto LABEL_23;
    }
  }
  else
  {
  }
  v39 = [(CRKArrayDifferenceEngine *)self configuration];
  v40 = [v39 incomingItemsIdentifierFunction];

  if (v40)
  {
    v80 = [MEMORY[0x263F08690] currentHandler];
    [v80 handleFailureInMethod:a2 object:self file:@"CRKArrayDifferenceEngine.m" lineNumber:143 description:@"both identifier functions must be NULL or both must be non-NULL"];
  }
  v41 = [(CRKArrayDifferenceEngine *)self configuration];
  v42 = [v41 publishedItemsIdentifierFunction];

  if (v42)
  {
    v81 = [MEMORY[0x263F08690] currentHandler];
    [v81 handleFailureInMethod:a2 object:self file:@"CRKArrayDifferenceEngine.m" lineNumber:144 description:@"both identifier functions must be NULL or both must be non-NULL"];
  }
  v35 = +[CRKPointerSet setWithArray:v6];
  v38 = +[CRKPointerSet setWithArray:v4];
  v36 = objc_opt_new();
  id v17 = &__block_literal_global_67;
  v34 = &__block_literal_global_67;
  v14 = (void (**)(void *, void))&__block_literal_global_67;
  v37 = v6;
LABEL_23:
  v97 = [v38 setBySubtractingSet:v35];
  v100 = v35;
  v95 = v38;
  v43 = [v35 setBySubtractingSet:v38];
  v44 = objc_opt_new();
  v45 = objc_opt_new();
  v111[0] = MEMORY[0x263EF8330];
  uint64_t v46 = *((void *)v9 + 408);
  v111[1] = v46;
  v111[2] = __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke_3;
  v111[3] = &unk_2646F4CC0;
  id v94 = v17;
  id v117 = v94;
  id v47 = v43;
  id v112 = v47;
  id v48 = v44;
  id v113 = v48;
  v114 = self;
  id v49 = v36;
  id v115 = v49;
  id v50 = v34;
  id v118 = v50;
  id v101 = v45;
  id v116 = v101;
  [v37 enumerateObjectsUsingBlock:v111];
  v51 = v37;
  if ([v48 count]) {
    [v37 removeObjectsAtIndexes:v48];
  }
  v52 = v97;
  v53 = v98;
  if ([v97 count] || objc_msgSend(v101, "count"))
  {
    id v91 = v50;
    id v92 = v47;
    id v93 = v49;
    v54 = [(CRKArrayDifferenceEngine *)self configuration];
    v55 = [v54 liftingFunction];
    v56 = v55;
    if (!v55) {
      v55 = &__block_literal_global_67;
    }
    v57 = (void *)MEMORY[0x22A620AF0](v55);

    v107[0] = MEMORY[0x263EF8330];
    v107[1] = v46;
    v107[2] = __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke_4;
    v107[3] = &unk_2646F4CE8;
    id v108 = v97;
    v109 = v14;
    id v90 = v57;
    id v110 = v90;
    v58 = objc_msgSend(v98, "crk_mapUsingBlock:", v107);
    v59 = [(CRKArrayDifferenceEngine *)self configuration];
    v60 = [v59 publishedItemsComparator];

    if (v60)
    {
      id v89 = v48;
      id v61 = v101;
      v88 = v58;
      [v61 addObjectsFromArray:v58];
      v62 = [(CRKArrayDifferenceEngine *)self configuration];
      v63 = [v62 publishedItemsComparator];
      id v87 = v61;
      v64 = [v61 sortedArrayUsingComparator:v63];

      v65 = [MEMORY[0x263EFF8C0] arrayWithArray:v51];
      if ([v65 count])
      {
        unint64_t v66 = 0;
        unint64_t v67 = 0;
        uint64_t v68 = 0;
        v104 = v65;
        v106 = v64;
        do
        {
          if (v66 >= [v64 count]) {
            break;
          }
          v69 = [v65 objectAtIndexedSubscript:v67];
          v70 = [v64 objectAtIndexedSubscript:v66];
          v71 = self;
          v72 = [(CRKArrayDifferenceEngine *)self configuration];
          v73 = [v72 publishedItemsComparator];
          uint64_t v74 = ((uint64_t (**)(void, void *, void *))v73)[2](v73, v69, v70);

          if ((unint64_t)(v74 + 1) > 1)
          {
            [v102 insertObject:v70 atIndex:v68];
            ++v66;
          }
          else
          {
            ++v67;
          }
          ++v68;

          v65 = v104;
          self = v71;
          v64 = v106;
        }
        while (v67 < [v104 count]);
      }
      else
      {
        unint64_t v67 = 0;
        unint64_t v66 = 0;
      }
      if (v66 < [v64 count])
      {
        if (v67 != [v65 count])
        {
          v85 = [MEMORY[0x263F08690] currentHandler];
          [v85 handleFailureInMethod:a2, self, @"CRKArrayDifferenceEngine.m", 223, @"we must have exhausted the original elements, otherwise the merge pass above is busted" object file lineNumber description];
        }
        v77 = objc_msgSend(v64, "subarrayWithRange:", v66, objc_msgSend(v64, "count") - v66);
        v78 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", objc_msgSend(v102, "count"), objc_msgSend(v77, "count"));
        [v102 insertObjects:v77 atIndexes:v78];
      }
      v52 = v97;
      v53 = v98;
      v51 = v102;
      id v50 = v91;
      v76 = v88;
      id v48 = v89;
      v75 = v87;
    }
    else
    {
      if ([v101 count])
      {
        v84 = [MEMORY[0x263F08690] currentHandler];
        [v84 handleFailureInMethod:a2 object:self file:@"CRKArrayDifferenceEngine.m" lineNumber:195 description:@"should not have any items to reinsert when comparator is NULL"];
      }
      v75 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", objc_msgSend(v51, "count"), objc_msgSend(v58, "count"));
      [v51 insertObjects:v58 atIndexes:v75];
      v76 = v58;
      id v50 = v91;
    }

    id v47 = v92;
    id v49 = v93;
  }
}

uint64_t __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

void __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v21 = a2;
  id v5 = (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  if ([*(id *)(a1 + 32) containsObject:v5]) {
    goto LABEL_2;
  }
  id v6 = [*(id *)(a1 + 48) configuration];
  uint64_t v7 = [v6 updateBlock];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    int v9 = [*(id *)(a1 + 56) containsObject:v5];

    if (v9)
    {
      id v10 = (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
      v11 = [*(id *)(a1 + 48) configuration];
      v12 = [v11 updateBlock];
      int v13 = ((uint64_t (**)(void, id, void *))v12)[2](v12, v21, v10);

      v14 = [*(id *)(a1 + 48) configuration];
      v15 = [v14 publishedItemsComparator];

      if (v15 && v13)
      {
        [*(id *)(a1 + 64) addObject:v21];
        [*(id *)(a1 + 40) addIndex:a3];
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v10 = [*(id *)(a1 + 48) configuration];
  objc_super v16 = [v10 updateBlock];
  if (v16)
  {

LABEL_11:
    goto LABEL_12;
  }
  id v17 = [*(id *)(a1 + 48) configuration];
  uint64_t v18 = [v17 publishedItemsComparator];
  if (!v18)
  {

    goto LABEL_11;
  }
  uint64_t v19 = (void *)v18;
  int v20 = [*(id *)(a1 + 56) containsObject:v5];

  if (v20)
  {
    [*(id *)(a1 + 64) addObject:v21];
LABEL_2:
    [*(id *)(a1 + 40) addIndex:a3];
  }
LABEL_12:
}

id __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  id v5 = (*(void (**)(void))(a1[5] + 16))();
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (CRKArrayDifferenceConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->mKeyPath, 0);

  objc_destroyWeak((id *)&self->mObject);
}

@end