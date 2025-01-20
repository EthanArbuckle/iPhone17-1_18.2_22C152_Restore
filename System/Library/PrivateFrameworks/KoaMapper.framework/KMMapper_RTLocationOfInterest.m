@interface KMMapper_RTLocationOfInterest
+ (Class)externalObjectClass;
- (KMMapper_RTLocationOfInterest)init;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMMapper_RTLocationOfInterest

- (void).cxx_destruct
{
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = [v7 identifier];
  v9 = [v8 UUIDString];

  builder = self->_builder;
  id v49 = 0;
  id v11 = (id)[(KVItemBuilder *)builder setItemType:12 itemId:v9 error:&v49];
  id v12 = v49;
  v13 = [v7 preferredName];
  if (v13)
  {
    v14 = self->_builder;
    id v48 = v12;
    v15 = [(KVItemBuilder *)v14 addFieldWithType:551 value:v13 error:&v48];
    id v16 = v48;

    if (!v15)
    {
      KMMapperSetBuilderError((uint64_t)a5, v16);
      v34 = 0;
      goto LABEL_25;
    }
    id v12 = v16;
  }
  v17 = [v7 mapItem];
  v18 = [v17 name];
  if (!v18) {
    goto LABEL_7;
  }
  v19 = self->_builder;
  id v47 = v12;
  v20 = [(KVItemBuilder *)v19 addFieldWithType:551 value:v18 error:&v47];
  id v16 = v47;

  if (v20)
  {
    id v12 = v16;
LABEL_7:
    v40 = v18;
    v21 = [v17 address];
    v22 = v21;
    if (v21)
    {
      v37 = v17;
      v38 = a5;
      v39 = v9;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v36 = v21;
      v23 = [v21 siriVocabularySpatialNames];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v44;
        while (2)
        {
          uint64_t v27 = 0;
          v28 = v12;
          do
          {
            if (*(void *)v44 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8 * v27);
            v30 = self->_builder;
            id v42 = v28;
            v31 = [(KVItemBuilder *)v30 addFieldWithType:552 value:v29 error:&v42];
            id v12 = v42;

            if (!v31)
            {
              KMMapperSetBuilderError((uint64_t)v38, v12);
              v34 = 0;
              v9 = v39;
              v22 = v36;
              v17 = v37;
              goto LABEL_23;
            }
            ++v27;
            v28 = v12;
          }
          while (v25 != v27);
          uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      a5 = v38;
      v9 = v39;
      v22 = v36;
      v17 = v37;
    }
    v32 = v12;
    v33 = self->_builder;
    id v41 = v12;
    v23 = [(KVItemBuilder *)v33 buildItemWithError:&v41];
    id v12 = v41;

    if (v23)
    {
      v50 = v23;
      v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
    }
    else
    {
      KMMapperSetBuilderError((uint64_t)a5, v12);
      v34 = 0;
    }
LABEL_23:

    id v16 = v12;
    v18 = v40;
    goto LABEL_24;
  }
  KMMapperSetBuilderError((uint64_t)a5, v16);
  v34 = 0;
LABEL_24:

LABEL_25:
  return v34;
}

- (int64_t)targetItemType
{
  return 12;
}

- (KMMapper_RTLocationOfInterest)init
{
  v6.receiver = self;
  v6.super_class = (Class)KMMapper_RTLocationOfInterest;
  v2 = [(KMMapper_RTLocationOfInterest *)&v6 init];
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