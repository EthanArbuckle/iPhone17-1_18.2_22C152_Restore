@interface KMMapper_AppGlobalVocabulary
+ (Class)externalObjectClass;
- (BOOL)_addItemWithItemId:(id)a3 fieldType:(int64_t)a4 values:(id)a5 error:(id *)a6;
- (KMMapper_AppGlobalVocabulary)init;
- (id)_resolveFieldTypeFromIntentSlotName:(id)a3;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMMapper_AppGlobalVocabulary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentSlotToFieldTypeMap, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

- (id)_resolveFieldTypeFromIntentSlotName:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@"."];
  if ((unint64_t)[v4 count] >= 2)
  {
    v6 = [v4 objectAtIndex:0];
    v7 = [v4 objectAtIndex:1];
    if ([v6 length] && objc_msgSend(v7, "length"))
    {
      v8 = [(NSDictionary *)self->_intentSlotToFieldTypeMap objectForKey:v6];
      v5 = [v8 objectForKey:v7];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_addItemWithItemId:(id)a3 fieldType:(int64_t)a4 values:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a5;
  builder = self->_builder;
  id v35 = 0;
  v12 = [(KVItemBuilder *)builder setItemType:14 itemId:a3 error:&v35];
  id v13 = v35;

  if (v12)
  {
    v28 = a6;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      while (2)
      {
        uint64_t v18 = 0;
        v19 = v13;
        do
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * v18);
          v21 = self->_builder;
          id v30 = v19;
          v22 = [(KVItemBuilder *)v21 addFieldWithType:a4 value:v20 error:&v30];
          id v13 = v30;

          if (!v22)
          {
            KMMapperSetBuilderError((uint64_t)v28, v13);

            goto LABEL_14;
          }
          ++v18;
          v19 = v13;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    v23 = v13;

    v24 = self->_builder;
    id v29 = v13;
    v25 = [(KVItemBuilder *)v24 buildItemWithError:&v29];
    id v13 = v29;

    BOOL v26 = v25 != 0;
    if (v25) {
      [(NSMutableArray *)self->_items addObject:v25];
    }
    else {
      KMMapperSetBuilderError((uint64_t)v28, v13);
    }
  }
  else
  {
    KMMapperSetBuilderError((uint64_t)a6, v13);
LABEL_14:
    BOOL v26 = 0;
  }

  return v26;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  items = self->_items;
  self->_items = v8;

  v56 = v7;
  id v10 = [v7 arrayValueForKey:*MEMORY[0x263F10228] expectedObjectsType:objc_opt_class() keyRequired:1 error:a5];
  v55 = v10;
  if (v10)
  {
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    obuint64_t j = v10;
    uint64_t v52 = [obj countByEnumeratingWithState:&v103 objects:v113 count:16];
    if (v52)
    {
      uint64_t v54 = *(void *)v104;
      uint64_t v53 = *MEMORY[0x263F10208];
      uint64_t v51 = *MEMORY[0x263F10238];
      uint64_t v66 = *MEMORY[0x263F10218];
      uint64_t v60 = *MEMORY[0x263F10230];
      uint64_t v77 = *MEMORY[0x263F10220];
      uint64_t v76 = *MEMORY[0x263F10210];
      v61 = self;
      v78 = a5;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v104 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v58 = v11;
          v12 = *(void **)(*((void *)&v103 + 1) + 8 * v11);
          v67 = objc_opt_new();
          id v13 = [v12 arrayValueForKey:v53 expectedObjectsType:objc_opt_class() keyRequired:1 error:a5];
          if (v13)
          {
            long long v101 = 0u;
            long long v102 = 0u;
            long long v99 = 0u;
            long long v100 = 0u;
            id v62 = v13;
            uint64_t v14 = [v62 countByEnumeratingWithState:&v99 objects:v112 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v100;
              do
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v100 != v16) {
                    objc_enumerationMutation(v62);
                  }
                  uint64_t v18 = [(KMMapper_AppGlobalVocabulary *)self _resolveFieldTypeFromIntentSlotName:*(void *)(*((void *)&v99 + 1) + 8 * i)];
                  if (v18) {
                    [v67 addObject:v18];
                  }
                }
                uint64_t v15 = [v62 countByEnumeratingWithState:&v99 objects:v112 count:16];
              }
              while (v15);
            }

            a5 = v78;
            uint64_t v19 = [v12 arrayValueForKey:v51 expectedObjectsType:objc_opt_class() keyRequired:1 error:v78];
            if (v19)
            {
              uint64_t v20 = (void *)v19;
              id v63 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              long long v95 = 0u;
              long long v96 = 0u;
              long long v97 = 0u;
              long long v98 = 0u;
              id v59 = v20;
              uint64_t v68 = [v59 countByEnumeratingWithState:&v95 objects:v111 count:16];
              if (v68)
              {
                uint64_t v64 = *(void *)v96;
                do
                {
                  for (uint64_t j = 0; j != v68; ++j)
                  {
                    if (*(void *)v96 != v64) {
                      objc_enumerationMutation(v59);
                    }
                    v22 = *(void **)(*((void *)&v95 + 1) + 8 * j);
                    v23 = [v22 stringValueForKey:v66 error:a5];
                    if ([v23 length])
                    {
                      uint64_t v72 = j;
                      id v24 = [v63 objectForKey:v23];
                      if (!v24)
                      {
                        id v24 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                        [v24 addObject:v23];
                        [v63 setObject:v24 forKey:v23];
                      }
                      v70 = v23;
                      id v74 = [v22 arrayValueForKey:v60 expectedObjectsType:objc_opt_class() keyRequired:1 error:a5];
                      if (v74)
                      {
                        long long v93 = 0u;
                        long long v94 = 0u;
                        long long v91 = 0u;
                        long long v92 = 0u;
                        uint64_t v25 = [v74 countByEnumeratingWithState:&v91 objects:v110 count:16];
                        if (v25)
                        {
                          uint64_t v26 = v25;
                          uint64_t v27 = *(void *)v92;
                          do
                          {
                            for (uint64_t k = 0; k != v26; ++k)
                            {
                              if (*(void *)v92 != v27) {
                                objc_enumerationMutation(v74);
                              }
                              id v29 = *(void **)(*((void *)&v91 + 1) + 8 * k);
                              id v30 = [v29 stringValueForKey:v77 error:a5];
                              if ([v30 length]) {
                                [v24 addObject:v30];
                              }
                              long long v31 = [v29 arrayValueForKey:v76 expectedObjectsType:objc_opt_class() keyRequired:0 error:a5];
                              long long v87 = 0u;
                              long long v88 = 0u;
                              long long v89 = 0u;
                              long long v90 = 0u;
                              uint64_t v32 = [v31 countByEnumeratingWithState:&v87 objects:v109 count:16];
                              if (v32)
                              {
                                uint64_t v33 = v32;
                                uint64_t v34 = *(void *)v88;
                                do
                                {
                                  for (uint64_t m = 0; m != v33; ++m)
                                  {
                                    if (*(void *)v88 != v34) {
                                      objc_enumerationMutation(v31);
                                    }
                                    v36 = *(void **)(*((void *)&v87 + 1) + 8 * m);
                                    if ([v36 length]) {
                                      [v24 addObject:v36];
                                    }
                                  }
                                  uint64_t v33 = [v31 countByEnumeratingWithState:&v87 objects:v109 count:16];
                                }
                                while (v33);
                              }

                              a5 = v78;
                            }
                            uint64_t v26 = [v74 countByEnumeratingWithState:&v91 objects:v110 count:16];
                          }
                          while (v26);
                        }
                      }

                      self = v61;
                      v23 = v70;
                      uint64_t j = v72;
                    }
                  }
                  uint64_t v68 = [v59 countByEnumeratingWithState:&v95 objects:v111 count:16];
                }
                while (v68);
              }

              long long v85 = 0u;
              long long v86 = 0u;
              long long v83 = 0u;
              long long v84 = 0u;
              id v37 = v67;
              uint64_t v69 = [v37 countByEnumeratingWithState:&v83 objects:v108 count:16];
              if (v69)
              {
                uint64_t v38 = *(void *)v84;
                v73 = v37;
                uint64_t v65 = *(void *)v84;
                do
                {
                  uint64_t v39 = 0;
                  do
                  {
                    if (*(void *)v84 != v38) {
                      objc_enumerationMutation(v37);
                    }
                    uint64_t v71 = v39;
                    id v75 = (id)KVFieldTypeFromNumber();
                    long long v79 = 0u;
                    long long v80 = 0u;
                    long long v81 = 0u;
                    long long v82 = 0u;
                    id v40 = v63;
                    uint64_t v41 = [v40 countByEnumeratingWithState:&v79 objects:v107 count:16];
                    if (v41)
                    {
                      uint64_t v42 = v41;
                      uint64_t v43 = *(void *)v80;
                      while (2)
                      {
                        for (uint64_t n = 0; n != v42; ++n)
                        {
                          if (*(void *)v80 != v43) {
                            objc_enumerationMutation(v40);
                          }
                          uint64_t v45 = *(void *)(*((void *)&v79 + 1) + 8 * n);
                          v46 = [v40 setValueForKey:v45 expectedObjectsType:objc_opt_class() keyRequired:1 error:a5];
                          v47 = [NSString stringWithFormat:@"%u#%@", (unsigned __int16)v75, v45];
                          BOOL v48 = [(KMMapper_AppGlobalVocabulary *)self _addItemWithItemId:v47 fieldType:v75 values:v46 error:a5];

                          if (!v48)
                          {

                            v49 = 0;
                            goto LABEL_70;
                          }
                          self = v61;
                        }
                        uint64_t v42 = [v40 countByEnumeratingWithState:&v79 objects:v107 count:16];
                        if (v42) {
                          continue;
                        }
                        break;
                      }
                    }

                    uint64_t v39 = v71 + 1;
                    id v37 = v73;
                    uint64_t v38 = v65;
                  }
                  while (v71 + 1 != v69);
                  uint64_t v69 = [v73 countByEnumeratingWithState:&v83 objects:v108 count:16];
                }
                while (v69);
              }
            }
          }

          uint64_t v11 = v58 + 1;
        }
        while (v58 + 1 != v52);
        uint64_t v52 = [obj countByEnumeratingWithState:&v103 objects:v113 count:16];
      }
      while (v52);
    }
  }
  v49 = self->_items;
LABEL_70:

  return v49;
}

- (int64_t)targetItemType
{
  return 14;
}

- (KMMapper_AppGlobalVocabulary)init
{
  v20[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)KMMapper_AppGlobalVocabulary;
  v2 = [(KMMapper_AppGlobalVocabulary *)&v16 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v2->_builder;
    v2->_builder = v3;

    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    uint64_t v19 = v6;
    v17[0] = @"playlistTitle";
    id v7 = KVFieldTypeToNumber();
    v18[0] = v7;
    v17[1] = @"musicArtistName";
    v8 = KVFieldTypeToNumber();
    v18[1] = v8;
    v17[2] = @"audiobookTitle";
    v9 = KVFieldTypeToNumber();
    v18[2] = v9;
    v17[3] = @"audiobookAuthor";
    id v10 = KVFieldTypeToNumber();
    v18[3] = v10;
    v17[4] = @"showTitle";
    uint64_t v11 = KVFieldTypeToNumber();
    v18[4] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];
    v20[0] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    intentSlotToFieldTypeMap = v2->_intentSlotToFieldTypeMap;
    v2->_intentSlotToFieldTypeMap = (NSDictionary *)v13;
  }
  return v2;
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end