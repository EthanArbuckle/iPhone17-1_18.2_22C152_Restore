@interface IDSService(HMDAccounts)
- (BOOL)hmd_isActive;
- (id)hmd_handles;
- (id)hmd_preferredHandle;
- (uint64_t)hmd_registrationError;
- (uint64_t)hmd_registrationStatus;
@end

@implementation IDSService(HMDAccounts)

- (id)hmd_preferredHandle
{
  v2 = [a1 iCloudAccount];
  v3 = [v2 loginID];

  if (v3)
  {
    v4 = +[HMDAccountHandleFormatter defaultFormatter];
    v5 = [v4 accountHandleFromString:v3];
  }
  else
  {
    v5 = 0;
  }

  v6 = objc_msgSend(a1, "hmd_handles");
  v7 = (void *)[v6 mutableCopy];

  if (![v7 containsObject:v5]) {
    goto LABEL_6;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__IDSService_HMDAccounts__hmd_preferredHandle__block_invoke;
  v10[3] = &unk_264A214A0;
  id v11 = v5;
  v8 = objc_msgSend(v7, "hmf_objectPassingTest:", v10);

  if (!v8)
  {
LABEL_6:
    [v7 sortWithOptions:16 usingComparator:&__block_literal_global_140322];
    v8 = [v7 lastObject];
  }

  return v8;
}

- (id)hmd_handles
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9B0] orderedSet];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a1, "accounts", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hmd_handles");
        [v2 addObjectsFromArray:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = [v2 array];

  return v9;
}

- (uint64_t)hmd_registrationError
{
  v1 = [a1 iCloudAccount];
  uint64_t v2 = (int)[v1 registrationError];

  return v2;
}

- (uint64_t)hmd_registrationStatus
{
  v1 = [a1 iCloudAccount];
  uint64_t v2 = (int)[v1 registrationStatus];

  return v2;
}

- (BOOL)hmd_isActive
{
  v1 = [a1 iCloudAccount];
  if ([v1 isActive])
  {
    uint64_t v2 = [v1 loginID];
    BOOL v3 = v2 != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

@end