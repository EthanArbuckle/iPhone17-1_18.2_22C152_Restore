@interface MTAlarm(HFAdditions)
- (id)hf_targetAccessoryInHome:()HFAdditions;
- (uint64_t)hash;
- (uint64_t)isEqual:()HFAdditions;
@end

@implementation MTAlarm(HFAdditions)

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
    v8 = [a1 alarmID];
    v9 = [v7 alarmID];
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
  v1 = [a1 alarmID];
  uint64_t v2 = [v1 hash];

  return v2;
}

- (id)hf_targetAccessoryInHome:()HFAdditions
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 siriContext];
  v6 = [v5 objectForKey:*MEMORY[0x263F33D98]];

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
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v11 = [v7 queryItems];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          v26 = v6;
          uint64_t v14 = *(void *)v30;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v30 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
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

                    goto LABEL_22;
                  }
                }
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
            if (v13) {
              continue;
            }
            break;
          }
          v21 = 0;
LABEL_22:
          v6 = v26;
        }
        else
        {
          v21 = 0;
        }

        goto LABEL_25;
      }
    }
    else
    {
    }
    v21 = 0;
LABEL_25:
    v23 = [v4 accessories];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __49__MTAlarm_HFAdditions__hf_targetAccessoryInHome___block_invoke;
    v27[3] = &unk_26408D968;
    id v28 = v21;
    id v24 = v21;
    v22 = objc_msgSend(v23, "na_firstObjectPassingTest:", v27);

    goto LABEL_26;
  }
  id v7 = HFLogForCategory(4uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v35 = a1;
    __int16 v36 = 2112;
    id v37 = v4;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "No targetReference found for alarm: %@ in home: %@", buf, 0x16u);
  }
  v22 = 0;
LABEL_26:

  return v22;
}

@end