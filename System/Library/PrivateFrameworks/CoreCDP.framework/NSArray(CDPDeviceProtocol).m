@interface NSArray(CDPDeviceProtocol)
- (uint64_t)hasMixedSecretType;
- (uint64_t)prevailingLocalSecretType;
@end

@implementation NSArray(CDPDeviceProtocol)

- (uint64_t)prevailingLocalSecretType
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (![a1 count]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = a1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = 1;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v2);
      }
      v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
      if (objc_msgSend(v8, "conformsToProtocol:", &unk_26C98B2E8, (void)v10))
      {
        if ([v8 localSecretType] == 1) {
          break;
        }
      }
      if (v4 == ++v7)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_4;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    uint64_t v6 = 2;
  }

  return v6;
}

- (uint64_t)hasMixedSecretType
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([a1 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v2 = a1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      int v5 = 0;
      int v6 = 0;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v2);
          }
          v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v9, "conformsToProtocol:", &unk_26C98B2E8, (void)v12))
          {
            if (v5 & v6)
            {
              LOBYTE(v5) = 1;
              LOBYTE(v6) = 1;
              goto LABEL_18;
            }
            if ([v9 localSecretType] == 1) {
              int v5 = 1;
            }
            else {
              v6 |= [v9 localSecretType] == 2;
            }
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
      LOBYTE(v6) = 0;
    }
LABEL_18:

    char v10 = v5 & v6;
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

@end