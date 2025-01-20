@interface NSDictionary(AVTSecureDecoding)
- (id)avt_mutableContainersCopy;
- (id)avt_objectForKey:()AVTSecureDecoding ofClass:didFail:error:;
- (id)avt_objectForKey:()AVTSecureDecoding ofClasses:didFail:error:;
@end

@implementation NSDictionary(AVTSecureDecoding)

- (id)avt_objectForKey:()AVTSecureDecoding ofClass:didFail:error:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v10 = [a1 objectForKeyedSubscript:v9];
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = NSString;
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = [v12 stringWithFormat:@"Unexpected class %@ for key %@", v14, v9];

    v16 = avt_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_20B819000, v16, OS_LOG_TYPE_DEFAULT, "Decoding error: %@", buf, 0xCu);
    }

    if (a6)
    {
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F08320];
      v21 = v15;
      v18 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      *a6 = [v17 errorWithDomain:@"AVTErrorDomain" code:3 userInfo:v18];
    }
    *a5 = 1;

    id v11 = 0;
  }
  else
  {
    id v11 = v10;
  }

  return v11;
}

- (id)avt_objectForKey:()AVTSecureDecoding ofClasses:didFail:error:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = [a1 objectForKeyedSubscript:v10];
  if (v12)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          if (objc_opt_isKindOfClass())
          {
            id v24 = v12;
            goto LABEL_16;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    v18 = NSString;
    v19 = (objc_class *)objc_opt_class();
    uint64_t v20 = NSStringFromClass(v19);
    id v13 = [v18 stringWithFormat:@"Unexpected class %@ for key %@", v20, v10, v26];

    v21 = avt_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v13;
      _os_log_impl(&dword_20B819000, v21, OS_LOG_TYPE_DEFAULT, "Decoding error: %@", buf, 0xCu);
    }

    if (a6)
    {
      v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v30 = *MEMORY[0x263F08320];
      id v31 = v13;
      v23 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      *a6 = [v22 errorWithDomain:@"AVTErrorDomain" code:3 userInfo:v23];
    }
    id v24 = 0;
    *a5 = 1;
LABEL_16:
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)avt_mutableContainersCopy
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__NSDictionary_AVTSecureDecoding__avt_mutableContainersCopy__block_invoke;
  v5[3] = &unk_2640205D0;
  id v3 = v2;
  id v6 = v3;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];

  return v3;
}

@end