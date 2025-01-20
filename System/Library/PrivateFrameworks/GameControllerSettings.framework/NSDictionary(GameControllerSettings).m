@interface NSDictionary(GameControllerSettings)
+ (id)_gcs_jsonObjectForSerializableDictionary:()GameControllerSettings;
+ (id)_gcs_serializableDictionaryForDictionaryJsonObject:()GameControllerSettings;
+ (id)_gcs_serializableDictionaryForJsonObject:()GameControllerSettings withValuesOfClass:;
- (GCSElement)_gcs_gscElementForJSONKey:()GameControllerSettings;
- (GCSProfile)_gcs_gscProfileForJSONKey:()GameControllerSettings;
- (id)_gcs_arrayForJSONKey:()GameControllerSettings;
- (id)_gcs_dateForJSONKey:()GameControllerSettings;
- (id)_gcs_dictionaryForJSONKey:()GameControllerSettings;
- (id)_gcs_numberForJSONKey:()GameControllerSettings;
- (id)_gcs_stringForJSONKey:()GameControllerSettings;
- (id)_gcs_uuidForJSONKey:()GameControllerSettings;
- (id)jsonObject;
- (void)initWithJSONObject:()GameControllerSettings;
@end

@implementation NSDictionary(GameControllerSettings)

- (void)initWithJSONObject:()GameControllerSettings
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v4;
    id v5 = v4;
    v6 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v12;
            v14 = [v7 objectForKeyedSubscript:v13];
            if ([v14 conformsToProtocol:&unk_26D329F50]) {
              [v6 setObject:v14 forKeyedSubscript:v13];
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    v15 = (void *)[a1 initWithDictionary:v6];
    a1 = v15;
    if (v15) {
      id v16 = v15;
    }

    v17 = a1;
    id v4 = v19;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)jsonObject
{
  id v11 = (id)objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [a1 allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = [a1 objectForKey:v7];
          if ([v8 conformsToProtocol:&unk_26D329F50])
          {
            uint64_t v9 = [v8 jsonObject];
            [v11 setObject:v9 forKeyedSubscript:v7];
          }
          else if ([v8 conformsToProtocol:&unk_26D32B7A8])
          {
            [v11 setObject:v8 forKeyedSubscript:v7];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  return v11;
}

+ (id)_gcs_jsonObjectForSerializableDictionary:()GameControllerSettings
{
  id v3 = a3;
  uint64_t v4 = +[NSMutableDictionary dictionaryWithCapacity:](&off_26D32CA00, "dictionaryWithCapacity:", [v3 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          long long v12 = objc_msgSend(v5, "objectForKeyedSubscript:", v11, (void)v15);
          if ([v12 conformsToProtocol:&unk_26D32B7A8])
          {
            [v4 setObject:v12 forKeyedSubscript:v11];
          }
          else
          {
            long long v13 = [v12 jsonObject];
            if (v13) {
              [v4 setObject:v13 forKeyedSubscript:v11];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)_gcs_serializableDictionaryForJsonObject:()GameControllerSettings withValuesOfClass:
{
  id v5 = a3;
  +[NSMutableDictionary dictionaryWithCapacity:](&off_26D32CA00, "dictionaryWithCapacity:", [v5 count]);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    uint64_t v10 = &selRef_name;
    id v11 = &selRef_name;
    long long v12 = &selRef_name;
    do
    {
      uint64_t v13 = 0;
      uint64_t v26 = v8;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v14 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;
          long long v16 = [v6 objectForKeyedSubscript:v15];
          if ([(objc_class *)a4 conformsToProtocol:v11[74]]
            && (objc_opt_isKindOfClass() & 1) != 0)
          {
            [v27 setObject:v16 forKeyedSubscript:v15];
          }
          else if (-[objc_class conformsToProtocol:](a4, "conformsToProtocol:", v12[73], v26))
          {
            uint64_t v17 = [[a4 alloc] initWithJSONObject:v16];
            long long v18 = a4;
            uint64_t v19 = v9;
            id v20 = v6;
            long long v21 = v10;
            long long v22 = v11;
            long long v23 = v12;
            v24 = (void *)v17;
            [v27 setObject:v17 forKeyedSubscript:v15];

            long long v12 = v23;
            id v11 = v22;
            uint64_t v10 = v21;
            id v6 = v20;
            uint64_t v9 = v19;
            a4 = v18;
            uint64_t v8 = v26;
          }
        }
        ++v13;
      }
      while (v8 != v13);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }

  return v27;
}

+ (id)_gcs_serializableDictionaryForDictionaryJsonObject:()GameControllerSettings
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = (void *)[objc_alloc((Class)&off_26D32B850) initWithJSONObject:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)_gcs_stringForJSONKey:()GameControllerSettings
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)_gcs_numberForJSONKey:()GameControllerSettings
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)_gcs_dictionaryForJSONKey:()GameControllerSettings
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)_gcs_arrayForJSONKey:()GameControllerSettings
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)_gcs_dateForJSONKey:()GameControllerSettings
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = (void *)[objc_alloc((Class)&off_26D32BE30) initWithJSONObject:v1];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)_gcs_uuidForJSONKey:()GameControllerSettings
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = (void *)[objc_alloc((Class)&off_26D32B350) initWithJSONObject:v1];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (GCSElement)_gcs_gscElementForJSONKey:()GameControllerSettings
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = [[GCSElement alloc] initWithJSONObject:v1];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (GCSProfile)_gcs_gscProfileForJSONKey:()GameControllerSettings
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = [[GCSProfile alloc] initWithJSONObject:v1];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

@end