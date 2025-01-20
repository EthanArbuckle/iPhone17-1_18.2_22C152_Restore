@interface KMMapper_SAAppInfo
+ (Class)externalObjectClass;
- (KMMapper_SAAppInfo)init;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMMapper_SAAppInfo

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  v11 = [v10 appIdentifyingInfo];
  v12 = [v11 bundleId];

  builder = self->_builder;
  id v50 = 0;
  v14 = [(KVItemBuilder *)builder setItemType:3 itemId:v12 error:&v50];
  id v15 = v50;
  v16 = v15;
  if (!v14)
  {
    id v19 = v15;
LABEL_20:
    KMMapperSetBuilderError((uint64_t)a5, v19);
    v36 = 0;
    goto LABEL_21;
  }
  v17 = self->_builder;
  id v49 = v16;
  v18 = [(KVItemBuilder *)v17 addFieldWithType:100 value:v12 error:&v49];
  id v19 = v49;

  if (!v18)
  {

    goto LABEL_20;
  }
  v41 = v12;
  v20 = self->_builder;
  v21 = [v10 displayAppName];
  id v48 = v19;
  v22 = [(KVItemBuilder *)v20 addFieldWithType:102 value:v21 error:&v48];
  id v23 = v48;

  if (!v22)
  {
    id v19 = v23;
    v12 = v41;
    goto LABEL_20;
  }
  v38 = a5;
  id v39 = v10;
  id v40 = v9;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v24 = [v10 appNameSynonyms];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v30 = [v29 phrase];
        if ([v30 length])
        {
          v31 = self->_builder;
          v32 = [v29 phrase];
          id v43 = v23;
          v33 = [(KVItemBuilder *)v31 addFieldWithType:104 value:v32 error:&v43];
          id v19 = v43;

          if (!v33)
          {
            KMMapperSetBuilderError((uint64_t)v38, v19);

            v36 = 0;
            id v10 = v39;
            id v9 = v40;
            v12 = v41;
            goto LABEL_21;
          }
          id v23 = v19;
        }
        else
        {
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }

  v34 = self->_builder;
  id v42 = v23;
  v35 = [(KVItemBuilder *)v34 buildItemWithError:&v42];
  id v19 = v42;

  if (v35)
  {
    v51 = v35;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
  }
  else
  {
    KMMapperSetBuilderError((uint64_t)v38, v19);
    v36 = 0;
  }
  id v10 = v39;
  id v9 = v40;
  v12 = v41;

LABEL_21:
  return v36;
}

- (int64_t)targetItemType
{
  return 3;
}

- (KMMapper_SAAppInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)KMMapper_SAAppInfo;
  v2 = [(KMMapper_SAAppInfo *)&v6 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v2->_builder;
    v2->_builder = v3;
  }
  return v2;
}

@end