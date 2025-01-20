@interface MTTimer(HFAdditions)
- (id)hf_targetAccessoryInHome:()HFAdditions;
- (uint64_t)hash;
- (uint64_t)isEqual:()HFAdditions;
@end

@implementation MTTimer(HFAdditions)

- (uint64_t)isEqual:()HFAdditions
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [a1 timerID];
    v9 = [v7 timerID];
    uint64_t v10 = objc_msgSend(v8, "hmf_isEqualToUUID:", v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (uint64_t)hash
{
  v1 = [a1 timerID];
  uint64_t v2 = [v1 hash];

  return v2;
}

- (id)hf_targetAccessoryInHome:()HFAdditions
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 siriContext];
  v6 = [v5 objectForKey:*MEMORY[0x263F33F30]];

  if (v6)
  {
    id v7 = [MEMORY[0x263F08BA0] componentsWithString:v6];
    v8 = [v7 scheme];
    if ([v8 isEqualToString:@"siri-hk-target"])
    {
      v9 = [v7 path];
      int v10 = [v9 isEqualToString:@"accessory"];

      if (v10)
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v11 = [v7 queryItems];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          v27 = v7;
          uint64_t v14 = *(void *)v31;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v31 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              v17 = [v16 name];
              int v18 = [@"identifier" isEqualToString:v17];

              if (v18)
              {
                v19 = [v16 value];
                if (v19)
                {
                  uint64_t v20 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v19];
                  if (v20)
                  {
                    v21 = (void *)v20;

                    goto LABEL_24;
                  }
                }
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
            if (v13) {
              continue;
            }
            break;
          }
          v21 = 0;
LABEL_24:
          id v7 = v27;
        }
        else
        {
          v21 = 0;
        }

        goto LABEL_27;
      }
    }
    else
    {
    }
    v21 = 0;
LABEL_27:
    v24 = [v4 accessories];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __49__MTTimer_HFAdditions__hf_targetAccessoryInHome___block_invoke;
    v28[3] = &unk_26408D968;
    id v29 = v21;
    id v25 = v21;
    v23 = objc_msgSend(v24, "na_firstObjectPassingTest:", v28);

    goto LABEL_28;
  }
  v22 = [a1 siriContext];

  if (!v22)
  {
    v23 = 0;
    goto LABEL_29;
  }
  id v7 = HFLogForCategory(4uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v36 = a1;
    __int16 v37 = 2112;
    id v38 = v4;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "No targetReference found for alarm: %@ in home: %@", buf, 0x16u);
  }
  v23 = 0;
LABEL_28:

LABEL_29:
  return v23;
}

@end