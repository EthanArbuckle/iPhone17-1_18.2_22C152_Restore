@interface KMMapper_HMHome
+ (Class)externalObjectClass;
- (BOOL)_addItemWithItemId:(id)a3 assistantHomeKitId:(id)a4 fieldType:(int64_t)a5 name:(id)a6 error:(id *)a7;
- (KMMapper_HMHome)init;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMMapper_HMHome

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

- (BOOL)_addItemWithItemId:(id)a3 assistantHomeKitId:(id)a4 fieldType:(int64_t)a5 name:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a6;
  builder = self->_builder;
  id v29 = 0;
  v15 = [(KVItemBuilder *)builder setItemType:4 itemId:a3 error:&v29];
  id v16 = v29;
  if (!v15) {
    goto LABEL_6;
  }
  v17 = self->_builder;
  id v28 = v16;
  v18 = [(KVItemBuilder *)v17 addFieldWithType:a5 value:v13 error:&v28];
  id v19 = v28;

  if (!v18)
  {

    goto LABEL_8;
  }
  v20 = self->_builder;
  id v27 = v19;
  v21 = [(KVItemBuilder *)v20 addFieldWithType:158 value:v12 error:&v27];
  id v16 = v27;

  if (!v21)
  {
LABEL_6:
    id v19 = v16;
LABEL_8:
    KMMapperSetBuilderError((uint64_t)a7, v19);
    BOOL v24 = 0;
    goto LABEL_11;
  }
  v22 = self->_builder;
  id v26 = v16;
  v23 = [(KVItemBuilder *)v22 buildItemWithError:&v26];
  id v19 = v26;

  BOOL v24 = v23 != 0;
  if (v23) {
    [(NSMutableArray *)self->_items addObject:v23];
  }
  else {
    KMMapperSetBuilderError((uint64_t)a7, v19);
  }

LABEL_11:
  return v24;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  uint64_t v139 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  items = self->_items;
  self->_items = v8;

  v10 = [v7 uniqueIdentifier];
  v11 = [v10 UUIDString];
  id v12 = [v7 assistantIdentifier];
  id v13 = [v7 name];
  v108 = a5;
  BOOL v14 = [(KMMapper_HMHome *)self _addItemWithItemId:v11 assistantHomeKitId:v12 fieldType:150 name:v13 error:a5];

  if (!v14) {
    goto LABEL_73;
  }
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  v105 = v7;
  v15 = [v7 zones];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v129 objects:v138 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v130;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v130 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v129 + 1) + 8 * i);
        v21 = [v20 rooms];
        uint64_t v22 = [v21 count];

        if (v22)
        {
          v23 = [v20 uniqueIdentifier];
          BOOL v24 = [v23 UUIDString];
          v25 = [v20 assistantIdentifier];
          id v26 = [v20 name];
          BOOL v27 = [(KMMapper_HMHome *)self _addItemWithItemId:v24 assistantHomeKitId:v25 fieldType:151 name:v26 error:v108];

          if (!v27)
          {
LABEL_70:

LABEL_71:
            v91 = 0;
            id v7 = v105;
            goto LABEL_74;
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v129 objects:v138 count:16];
    }
    while (v17);
  }

  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  v15 = [v105 rooms];
  uint64_t v28 = [v15 countByEnumeratingWithState:&v125 objects:v137 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v126;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v126 != v30) {
          objc_enumerationMutation(v15);
        }
        v32 = *(void **)(*((void *)&v125 + 1) + 8 * j);
        v33 = [v32 uniqueIdentifier];
        v34 = [v33 UUIDString];
        v35 = [v32 assistantIdentifier];
        v36 = [v32 name];
        BOOL v37 = [(KMMapper_HMHome *)self _addItemWithItemId:v34 assistantHomeKitId:v35 fieldType:152 name:v36 error:v108];

        if (!v37) {
          goto LABEL_70;
        }
      }
      uint64_t v29 = [v15 countByEnumeratingWithState:&v125 objects:v137 count:16];
    }
    while (v29);
  }

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  v15 = [v105 serviceGroups];
  uint64_t v38 = [v15 countByEnumeratingWithState:&v121 objects:v136 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v122;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v122 != v40) {
          objc_enumerationMutation(v15);
        }
        v42 = *(void **)(*((void *)&v121 + 1) + 8 * k);
        v43 = [v42 services];
        uint64_t v44 = [v43 count];

        if (v44)
        {
          v45 = [v42 uniqueIdentifier];
          v46 = [v45 UUIDString];
          v47 = [v42 assistantIdentifier];
          v48 = [v42 name];
          BOOL v49 = [(KMMapper_HMHome *)self _addItemWithItemId:v46 assistantHomeKitId:v47 fieldType:154 name:v48 error:v108];

          if (!v49) {
            goto LABEL_70;
          }
        }
      }
      uint64_t v39 = [v15 countByEnumeratingWithState:&v121 objects:v136 count:16];
    }
    while (v39);
  }

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v7 = v105;
  obuint64_t j = [v105 actionSets];
  uint64_t v50 = [obj countByEnumeratingWithState:&v117 objects:v135 count:16];
  if (!v50) {
    goto LABEL_41;
  }
  uint64_t v51 = v50;
  uint64_t v106 = *(void *)v118;
  uint64_t v52 = *MEMORY[0x263F0B948];
  uint64_t v101 = *MEMORY[0x263F0B958];
  do
  {
    for (uint64_t m = 0; m != v51; ++m)
    {
      if (*(void *)v118 != v106) {
        objc_enumerationMutation(obj);
      }
      v54 = *(void **)(*((void *)&v117 + 1) + 8 * m);
      v55 = [v54 actionSetType];
      char v56 = [v55 isEqualToString:v52];

      if (v56) {
        continue;
      }
      v57 = [v54 actionSetType];
      if (([v57 isEqualToString:v101] & 1) == 0)
      {

LABEL_38:
        v60 = [v54 uniqueIdentifier];
        v61 = [v60 UUIDString];
        v62 = [v54 assistantIdentifier];
        v63 = [v54 name];
        BOOL v64 = [(KMMapper_HMHome *)self _addItemWithItemId:v61 assistantHomeKitId:v62 fieldType:155 name:v63 error:v108];

        if (v64) {
          continue;
        }

LABEL_73:
        v91 = 0;
        goto LABEL_74;
      }
      v58 = [v54 actions];
      uint64_t v59 = [v58 count];

      if (v59) {
        goto LABEL_38;
      }
    }
    uint64_t v51 = [obj countByEnumeratingWithState:&v117 objects:v135 count:16];
  }
  while (v51);
LABEL_41:

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  v65 = [v105 accessories];
  uint64_t v100 = [v65 countByEnumeratingWithState:&v113 objects:v134 count:16];
  if (!v100) {
    goto LABEL_69;
  }
  uint64_t v66 = *(void *)v114;
  uint64_t v97 = *MEMORY[0x263F0B0A0];
  uint64_t v95 = *MEMORY[0x263F0B030];
  uint64_t v94 = *MEMORY[0x263F0B010];
  uint64_t v93 = *MEMORY[0x263F0B130];
  uint64_t v98 = *(void *)v114;
  v99 = v65;
  while (2)
  {
    uint64_t v67 = 0;
    while (2)
    {
      if (*(void *)v114 != v66) {
        objc_enumerationMutation(v65);
      }
      uint64_t v102 = v67;
      v68 = *(void **)(*((void *)&v113 + 1) + 8 * v67);
      uint64_t v69 = [v68 name];
      v70 = [v68 category];
      id obja = [v70 categoryType];

      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      v71 = [v68 services];
      uint64_t v72 = [v71 countByEnumeratingWithState:&v109 objects:v133 count:16];
      if (v72)
      {
        uint64_t v73 = v72;
        v96 = v68;
        char v74 = 0;
        uint64_t v75 = *(void *)v110;
        v107 = v71;
        while (2)
        {
          for (uint64_t n = 0; n != v73; ++n)
          {
            if (*(void *)v110 != v75) {
              objc_enumerationMutation(v71);
            }
            v77 = *(void **)(*((void *)&v109 + 1) + 8 * n);
            if ([v77 isUserInteractive])
            {
              uint64_t v78 = [v77 name];
              if (v78 | v69)
              {
                v79 = (void *)v78;
                v80 = [v77 name];
                char v81 = [v80 isEqual:v69];

                if ((v81 & 1) == 0)
                {
                  v82 = [v77 uniqueIdentifier];
                  v83 = [v82 UUIDString];
                  v84 = [v77 assistantIdentifier];
                  v85 = [v77 name];
                  BOOL v86 = [(KMMapper_HMHome *)self _addItemWithItemId:v83 assistantHomeKitId:v84 fieldType:153 name:v85 error:v108];

                  if (!v86)
                  {

                    v65 = v99;
                    goto LABEL_78;
                  }
                }
                char v74 = 1;
                v71 = v107;
              }
              else
              {
                char v74 = 1;
              }
            }
          }
          uint64_t v73 = [v71 countByEnumeratingWithState:&v109 objects:v133 count:16];
          if (v73) {
            continue;
          }
          break;
        }

        v65 = v99;
        v68 = v96;
        if (v74) {
          goto LABEL_66;
        }
      }
      else
      {
      }
      if (([obja isEqual:v97] & 1) != 0
        || ([obja isEqual:v95] & 1) != 0
        || ([obja isEqual:v94] & 1) != 0
        || [obja isEqual:v93])
      {
LABEL_66:
        v87 = [v68 uniqueIdentifier];
        v88 = [v87 UUIDString];
        v89 = [v68 assistantIdentifier];
        BOOL v90 = [(KMMapper_HMHome *)self _addItemWithItemId:v88 assistantHomeKitId:v89 fieldType:157 name:v69 error:v108];

        if (!v90)
        {
LABEL_78:

          goto LABEL_71;
        }
      }

      uint64_t v67 = v102 + 1;
      id v7 = v105;
      uint64_t v66 = v98;
      if (v102 + 1 != v100) {
        continue;
      }
      break;
    }
    uint64_t v100 = [v65 countByEnumeratingWithState:&v113 objects:v134 count:16];
    if (v100) {
      continue;
    }
    break;
  }
LABEL_69:

  v91 = self->_items;
LABEL_74:

  return v91;
}

- (int64_t)targetItemType
{
  return 4;
}

- (KMMapper_HMHome)init
{
  v6.receiver = self;
  v6.super_class = (Class)KMMapper_HMHome;
  v2 = [(KMMapper_HMHome *)&v6 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v2->_builder;
    v2->_builder = v3;
  }
  return v2;
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end