@interface NSDictionary(KMMapper_AppGlobalVocabulary)
- (id)_collectionValueForKey:()KMMapper_AppGlobalVocabulary collectonType:expectedObjectsType:keyRequired:error:;
- (id)arrayValueForKey:()KMMapper_AppGlobalVocabulary expectedObjectsType:keyRequired:error:;
- (id)setValueForKey:()KMMapper_AppGlobalVocabulary expectedObjectsType:keyRequired:error:;
- (id)stringValueForKey:()KMMapper_AppGlobalVocabulary error:;
@end

@implementation NSDictionary(KMMapper_AppGlobalVocabulary)

- (id)stringValueForKey:()KMMapper_AppGlobalVocabulary error:
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      goto LABEL_7;
    }
    v7 = (void *)MEMORY[0x263F087E8];
    v8 = [NSString stringWithFormat:@"Value for key %@ is not a string", v4, *MEMORY[0x263F07F80]];
    v16 = v8;
    v9 = NSDictionary;
    v10 = &v16;
    v11 = &v15;
  }
  else
  {
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F07F80];
    v8 = [NSString stringWithFormat:@"No value associated with key: %@", v4];
    v18[0] = v8;
    v9 = NSDictionary;
    v10 = (void **)v18;
    v11 = &v17;
  }
  v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
  v13 = [v7 errorWithDomain:@"com.apple.siri.koa.mapper" code:9 userInfo:v12];
  KVSetError();

  id v6 = 0;
LABEL_7:

  return v6;
}

- (id)_collectionValueForKey:()KMMapper_AppGlobalVocabulary collectonType:expectedObjectsType:keyRequired:error:
{
  v44[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = [a1 objectForKey:v10];
  if (!v11)
  {
    if (a6)
    {
      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v43 = *MEMORY[0x263F07F80];
      v19 = [NSString stringWithFormat:@"No value associated with key: %@", v10];
      v44[0] = v19;
      v20 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
      v21 = [v18 errorWithDomain:@"com.apple.siri.koa.mapper" code:9 userInfo:v20];
      KVSetError();
    }
LABEL_17:
    id v17 = 0;
    goto LABEL_18;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v41 = *MEMORY[0x263F07F80];
    v23 = NSString;
    NSStringFromClass(a4);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v24 = [v23 stringWithFormat:@"Value for key %@ is not of expected class %@", v10, v12];
    v42 = v24;
    v25 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    v26 = [v22 errorWithDomain:@"com.apple.siri.koa.mapper" code:9 userInfo:v25];
    KVSetError();

LABEL_16:
    goto LABEL_17;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v27 = (void *)MEMORY[0x263F087E8];
          uint64_t v38 = *MEMORY[0x263F07F80];
          v28 = NSString;
          v29 = NSStringFromClass(a5);
          v30 = [v28 stringWithFormat:@"Object in collection for key %@ is not of expected class %@", v10, v29, v34];
          v39 = v30;
          v31 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          v32 = [v27 errorWithDomain:@"com.apple.siri.koa.mapper" code:9 userInfo:v31];
          KVSetError();

          goto LABEL_16;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v17 = v12;
LABEL_18:

  return v17;
}

- (id)setValueForKey:()KMMapper_AppGlobalVocabulary expectedObjectsType:keyRequired:error:
{
  id v10 = a3;
  v11 = [a1 _collectionValueForKey:v10 collectonType:objc_opt_class() expectedObjectsType:a4 keyRequired:a5 error:a6];

  return v11;
}

- (id)arrayValueForKey:()KMMapper_AppGlobalVocabulary expectedObjectsType:keyRequired:error:
{
  id v10 = a3;
  v11 = [a1 _collectionValueForKey:v10 collectonType:objc_opt_class() expectedObjectsType:a4 keyRequired:a5 error:a6];

  return v11;
}

@end