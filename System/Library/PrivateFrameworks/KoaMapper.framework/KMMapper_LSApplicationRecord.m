@interface KMMapper_LSApplicationRecord
+ (Class)externalObjectClass;
- (BOOL)addAlternativeNamesFor:(id)a3 forLanguage:(id)a4 error:(id *)a5;
- (KMMapper_LSApplicationRecord)init;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMMapper_LSApplicationRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCodeKey, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  v46[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [a4 objectForKey:self->_languageCodeKey];
  v10 = (void *)v9;
  if (v9)
  {
    uint64_t v44 = v9;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
    v12 = [v8 localizedNameWithPreferredLocalizations:v11];

    builder = self->_builder;
    v14 = [v8 bundleIdentifier];
    id v42 = 0;
    v15 = [(KVItemBuilder *)builder setItemType:3 itemId:v14 error:&v42];
    id v16 = v42;
    if (v15)
    {
      v36 = a5;
      v17 = self->_builder;
      [v8 bundleIdentifier];
      v37 = v41[2] = v16;
      v18 = -[KVItemBuilder addFieldWithType:value:error:](v17, "addFieldWithType:value:error:", 100);
      id v19 = v16;

      v38 = v12;
      if (v18)
      {
        v20 = self->_builder;
        [v8 bundleVersion];
        v35 = v41[1] = v19;
        v21 = -[KVItemBuilder addFieldWithType:value:error:](v20, "addFieldWithType:value:error:", 103);
        id v22 = v19;

        if (v21)
        {
          v23 = self->_builder;
          v41[0] = v22;
          v24 = [(KVItemBuilder *)v23 addFieldWithType:102 value:v12 error:v41];
          id v34 = v41[0];

          BOOL v25 = v24 == 0;
          id v22 = v34;
        }
        else
        {
          BOOL v25 = 1;
        }

        id v19 = v22;
      }
      else
      {
        BOOL v25 = 1;
      }

      if (!v25)
      {
        id v40 = v19;
        BOOL v30 = [(KMMapper_LSApplicationRecord *)self addAlternativeNamesFor:v8 forLanguage:v10 error:&v40];
        id v31 = v40;

        if (v30)
        {
          v32 = self->_builder;
          id v39 = v31;
          v33 = [(KVItemBuilder *)v32 buildItemWithError:&v39];
          id v16 = v39;

          v12 = v38;
          if (v33)
          {
            v43 = v33;
            v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
          }
          else
          {
            KMMapperSetBuilderError((uint64_t)v36, v16);
            v28 = 0;
          }
        }
        else
        {
          KMMapperSetBuilderError((uint64_t)v36, v31);
          v28 = 0;
          id v16 = v31;
          v12 = v38;
        }
        goto LABEL_15;
      }
      id v16 = v19;
      v12 = v38;
      a5 = v36;
    }
    else
    {
    }
    KMMapperSetBuilderError((uint64_t)a5, v16);
  }
  else
  {
    v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v45 = *MEMORY[0x263F07F80];
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"Expected additional field with type: %i", 4294967291);
    v46[0] = v12;
    id v16 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];
    v27 = [v26 errorWithDomain:@"com.apple.siri.koa.mapper" code:7 userInfo:v16];
    KVSetError();
  }
  v28 = 0;
LABEL_15:

  return v28;
}

- (BOOL)addAlternativeNamesFor:(id)a3 forLanguage:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__1911;
  v28[4] = __Block_byref_object_dispose__1912;
  id v29 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  BOOL v25 = __Block_byref_object_copy__1911;
  v26 = __Block_byref_object_dispose__1912;
  id v27 = 0;
  v10 = [v8 infoDictionary];
  v11 = [v10 objectForKey:@"INAlternativeAppNames" ofClass:objc_opt_class()];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__KMMapper_LSApplicationRecord_addAlternativeNamesFor_forLanguage_error___block_invoke;
  v16[3] = &unk_2646DBB40;
  v20 = v28;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  id v19 = self;
  v21 = &v22;
  [v11 enumerateObjectsUsingBlock:v16];
  v14 = (void *)v23[5];
  if (a5 && v14) {
    *a5 = v14;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v28, 8);

  return v14 == 0;
}

- (int64_t)targetItemType
{
  return 3;
}

- (KMMapper_LSApplicationRecord)init
{
  v8.receiver = self;
  v8.super_class = (Class)KMMapper_LSApplicationRecord;
  v2 = [(KMMapper_LSApplicationRecord *)&v8 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v2->_builder;
    v2->_builder = v3;

    uint64_t v5 = KVAdditionalFieldTypeToNumber();
    languageCodeKey = v2->_languageCodeKey;
    v2->_languageCodeKey = (NSNumber *)v5;
  }
  return v2;
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end