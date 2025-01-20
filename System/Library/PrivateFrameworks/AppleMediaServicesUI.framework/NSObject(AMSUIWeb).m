@interface NSObject(AMSUIWeb)
- (id)_sanitizedServerObject:()AMSUIWeb;
- (uint64_t)ams_sanitizeServerObject;
@end

@implementation NSObject(AMSUIWeb)

- (uint64_t)ams_sanitizeServerObject
{
  return [a1 _sanitizedServerObject:a1];
}

- (id)_sanitizedServerObject:()AMSUIWeb
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
LABEL_5:
    id v6 = v5;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = NSString;
    [v4 timeIntervalSince1970];
    objc_msgSend(v8, "stringWithFormat:", @"%lld", (uint64_t)v9);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = NSString;
    id v11 = [v4 base64EncodedStringWithOptions:0];
    id v6 = [v10 stringWithFormat:@"%@", v11];
LABEL_34:

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [a1 _sanitizedServerObject:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          if (v16) {
            [v6 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v13);
    }
    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v4;
    uint64_t v17 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v11);
          }
          v21 = [a1 _sanitizedServerObject:*(void *)(*((void *)&v27 + 1) + 8 * j)];
          if (v21) {
            [v6 addObject:v21];
          }
        }
        uint64_t v18 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v18);
    }
    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __45__NSObject_AMSUIWeb___sanitizedServerObject___block_invoke;
    v25[3] = &unk_2643E5DC0;
    v25[4] = a1;
    id v23 = v22;
    id v26 = v23;
    [v4 enumerateKeysAndObjectsUsingBlock:v25];
    v24 = v26;
    id v6 = v23;
  }
  else
  {
    id v6 = 0;
  }
LABEL_6:

  return v6;
}

@end