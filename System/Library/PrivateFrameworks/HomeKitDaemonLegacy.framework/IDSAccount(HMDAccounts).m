@interface IDSAccount(HMDAccounts)
- (id)hmd_handles;
@end

@implementation IDSAccount(HMDAccounts)

- (id)hmd_handles
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [a1 handles];
  v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        if (!a1 || !v8) {
          goto LABEL_11;
        }
        uint64_t v9 = __shouldFilterHandle_onceToken;
        id v10 = v8;
        if (v9 != -1) {
          dispatch_once(&__shouldFilterHandle_onceToken, &__block_literal_global_1108);
        }
        uint64_t v11 = __shouldFilterHandle_blacklistedURIs;
        v12 = [v10 URI];
        LOBYTE(v11) = [(id)v11 containsObject:v12];

        if ((v11 & 1) == 0)
        {
LABEL_11:
          if ([v8 validationStatus] >= 3)
          {
            v13 = [HMDAccountHandle alloc];
            v14 = [v8 URI];
            v15 = -[HMDAccountHandle initWithURI:local:](v13, "initWithURI:local:", v14, [v8 isUserVisible] ^ 1);

            if (v15) {
              [v18 addObject:v15];
            }
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  v16 = (void *)[v18 copy];
  return v16;
}

@end