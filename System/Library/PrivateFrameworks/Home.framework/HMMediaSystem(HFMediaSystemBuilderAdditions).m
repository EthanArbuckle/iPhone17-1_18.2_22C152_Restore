@interface HMMediaSystem(HFMediaSystemBuilderAdditions)
- (id)hf_accessoryForRole:()HFMediaSystemBuilderAdditions;
- (id)hf_roleForAccessory:()HFMediaSystemBuilderAdditions;
@end

@implementation HMMediaSystem(HFMediaSystemBuilderAdditions)

- (id)hf_accessoryForRole:()HFMediaSystemBuilderAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = objc_msgSend(a1, "components", 0);
  v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 role];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          v12 = [v9 mediaProfile];
          v6 = [v12 accessory];

          goto LABEL_11;
        }
      }
      v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)hf_roleForAccessory:()HFMediaSystemBuilderAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = objc_msgSend(a1, "components", 0);
  v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 mediaProfile];
        char v11 = [v10 accessory];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          v6 = [v9 role];
          goto LABEL_11;
        }
      }
      v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end