@interface DMTWiFiAutoJoinValidator
- (BOOL)validateProfile:(id)a3 error:(id *)a4;
@end

@implementation DMTWiFiAutoJoinValidator

- (BOOL)validateProfile:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = objc_msgSend(a3, "payloadsOfType:", @"com.apple.wifi.managed", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v14 + 1) + 8 * v9);
        int v11 = [v10 autoJoin];

        if (v11)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (!a4) {
    return 0;
  }
  DMTErrorWithCodeAndUserInfo(72, &unk_26E115840);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  BOOL result = 0;
  *a4 = v12;
  return result;
}

@end