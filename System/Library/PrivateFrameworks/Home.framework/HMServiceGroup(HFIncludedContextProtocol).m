@interface HMServiceGroup(HFIncludedContextProtocol)
- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:;
- (uint64_t)hf_hasSetForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol;
@end

@implementation HMServiceGroup(HFIncludedContextProtocol)

- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol
{
  v4 = [a1 services];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__HMServiceGroup_HFIncludedContextProtocol__hf_isOnForContextType___block_invoke;
  v7[3] = &__block_descriptor_40_e19_B16__0__HMService_8l;
  v7[4] = a3;
  uint64_t v5 = objc_msgSend(v4, "na_any:", v7);

  return v5;
}

- (uint64_t)hf_hasSetForContextType:()HFIncludedContextProtocol
{
  v4 = [a1 services];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__HMServiceGroup_HFIncludedContextProtocol__hf_hasSetForContextType___block_invoke;
  v7[3] = &__block_descriptor_40_e19_B16__0__HMService_8l;
  v7[4] = a3;
  uint64_t v5 = objc_msgSend(v4, "na_any:", v7);

  return v5;
}

- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol
{
  v4 = a1;
  if (a2 < 2)
  {
    if ((objc_msgSend(a1, "hf_isOnForContextType:", a2) & 1) == 0)
    {
      a3 = objc_msgSend(v4, "hf_hasSetForContextType:", a2) ^ 1;
      return a3 & 1;
    }
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    uint64_t v5 = 2;
    goto LABEL_9;
  }
  if (a2 != 3) {
    return a3 & 1;
  }
  if (!objc_msgSend(a1, "hf_hasSetForContextType:", 3))
  {
LABEL_7:
    a3 = 1;
    return a3 & 1;
  }
  a1 = v4;
  uint64_t v5 = 3;
LABEL_9:
  return objc_msgSend(a1, "hf_isOnForContextType:", v5);
}

- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol
{
  if (a3 != 1) {
    return 0;
  }
  v3 = [a1 services];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__HMServiceGroup_HFIncludedContextProtocol__hf_shouldHideForContextType___block_invoke;
  v6[3] = &__block_descriptor_40_e19_B16__0__HMService_8l;
  v6[4] = 1;
  uint64_t v4 = objc_msgSend(v3, "na_all:", v6);

  return v4;
}

- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v25 = a1;
    __int16 v26 = 2080;
    v27 = "-[HMServiceGroup(HFIncludedContextProtocol) hf_updateValue:forContextType:]";
    __int16 v28 = 1024;
    int v29 = a3;
    __int16 v30 = 2048;
    uint64_t v31 = a4;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", buf, 0x26u);
  }

  v8 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v9 = objc_msgSend(a1, "services", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "hf_updateValue:forContextType:", a3, a4);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  v15 = (void *)MEMORY[0x263F58190];
  v16 = [MEMORY[0x263F581B8] mainThreadScheduler];
  v17 = [v15 combineAllFutures:v8 ignoringErrors:0 scheduler:v16];

  return v17;
}

@end