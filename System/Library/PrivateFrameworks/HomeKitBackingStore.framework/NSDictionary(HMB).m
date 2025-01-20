@interface NSDictionary(HMB)
+ (id)hmbDictionaryFromOPACKData:()HMB error:;
- (id)hmbDescription;
- (id)hmbOPACKDataFromDictionaryWithError:()HMB;
@end

@implementation NSDictionary(HMB)

- (id)hmbOPACKDataFromDictionaryWithError:()HMB
{
  int v7 = 0;
  uint64_t v4 = MEMORY[0x1D944C960](a1, 8, &v7);
  v5 = (void *)v4;
  if (a3 && !v4)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
  }
  return v5;
}

- (id)hmbDescription
{
  v2 = (void *)[@"{" mutableCopy];
  v3 = objc_msgSend(a1, "na_map:", &__block_literal_global_206);
  uint64_t v4 = [v3 componentsJoinedByString:@", "];
  [v2 appendString:v4];

  [v2 appendString:@"}"];
  v5 = (void *)[v2 copy];

  return v5;
}

+ (id)hmbDictionaryFromOPACKData:()HMB error:
{
  if (a3)
  {
    v5 = (void *)OPACKDecodeData();
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
      id v9 = v8;

      if (!a4 || v9) {
        goto LABEL_15;
      }
      v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    }
    else
    {
      if (!a4)
      {
        id v9 = 0;
        goto LABEL_15;
      }
      v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:0 userInfo:0];
    }
    id v9 = 0;
    *a4 = v10;
LABEL_15:

    goto LABEL_16;
  }
  id v9 = 0;
  if (a4) {
    *a4 = 0;
  }
LABEL_16:
  return v9;
}

@end