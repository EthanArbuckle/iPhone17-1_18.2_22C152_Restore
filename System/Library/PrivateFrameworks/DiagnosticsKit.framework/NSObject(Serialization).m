@interface NSObject(Serialization)
- (id)dropNonSerializableDataWithError:()Serialization;
- (uint64_t)isJSONSerializable;
- (uint64_t)isSecureCodable;
@end

@implementation NSObject(Serialization)

- (id)dropNonSerializableDataWithError:()Serialization
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if ([a1 isJSONSerializable]) {
    goto LABEL_2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [MEMORY[0x263EFF980] array];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v45 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v44 + 1) + 8 * i) dropNonSerializableDataWithError:a3];
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v9);
    }
LABEL_36:

    if ([v6 count]) {
      v29 = v6;
    }
    else {
      v29 = 0;
    }
    id v5 = v29;

    goto LABEL_40;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = a1;
    v14 = [MEMORY[0x263EFF9A0] dictionary];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v15 = [v13 allKeys];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v51 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v40 + 1) + 8 * j);
          v21 = [v13 objectForKeyedSubscript:v20];
          v22 = [v21 dropNonSerializableDataWithError:a3];
          [v14 setObject:v22 forKeyedSubscript:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v51 count:16];
      }
      while (v17);
    }

    if ([v14 count]) {
      v23 = v14;
    }
    else {
      v23 = 0;
    }
    id v5 = v23;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [MEMORY[0x263EFF9C0] set];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v7 = a1;
      uint64_t v24 = [v7 countByEnumeratingWithState:&v36 objects:v50 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v37;
        do
        {
          for (uint64_t k = 0; k != v25; ++k)
          {
            if (*(void *)v37 != v26) {
              objc_enumerationMutation(v7);
            }
            v28 = [*(id *)(*((void *)&v36 + 1) + 8 * k) dropNonSerializableDataWithError:a3];
            if (v28) {
              [v6 addObject:v28];
            }
          }
          uint64_t v25 = [v7 countByEnumeratingWithState:&v36 objects:v50 count:16];
        }
        while (v25);
      }
      goto LABEL_36;
    }
    if ([a1 isSecureCodable])
    {
LABEL_2:
      id v5 = a1;
      goto LABEL_40;
    }
    v31 = NSString;
    v32 = DKErrorLocalizedDescriptionForCode(-1009);
    v33 = objc_msgSend(v31, "stringWithFormat:", v32, a1);

    if (a3)
    {
      v34 = (void *)MEMORY[0x263F087E8];
      uint64_t v48 = *MEMORY[0x263F08320];
      v49 = v33;
      v35 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      *a3 = [v34 errorWithDomain:@"DKErrorDomain" code:-1009 userInfo:v35];
    }
    id v5 = 0;
  }
LABEL_40:
  return v5;
}

- (uint64_t)isSecureCodable
{
  return [a1 conformsToProtocol:&unk_26F0E59B0];
}

- (uint64_t)isJSONSerializable
{
  return [MEMORY[0x263F08900] isValidJSONObject:a1];
}

@end