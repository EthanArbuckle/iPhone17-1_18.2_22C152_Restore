@interface NSArray(HMFDeprecated)
- (id)describeElements:()HMFDeprecated;
- (id)secureDescriptionWithIndent:()HMFDeprecated newLine:blacklistedKeys:;
- (uint64_t)secureDescriptionWithBlacklistKeys:()HMFDeprecated;
@end

@implementation NSArray(HMFDeprecated)

- (id)secureDescriptionWithIndent:()HMFDeprecated newLine:blacklistedKeys:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v8 = a3;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F28E78] string];
  v11 = @"\n";
  if (!a4) {
    v11 = &stru_1EEF0F5E0;
  }
  v12 = v11;
  v25 = v12;
  if (v8)
  {
    objc_msgSend(v10, "appendFormat:", @"%@%@(\n"), v12, v8, v12;
    [(__CFString *)v8 indentationByLevels:1];
  }
  else
  {
    objc_msgSend(v10, "appendFormat:", @"%@(\n"), v12;
    +[HMFStringIndentation indentation];
  v13 = };
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = a1;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v26 + 1) + 8 * v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v20 = [v19 secureDescriptionWithIndent:v13 newLine:0 blacklistedKeys:v9];
LABEL_14:
          v21 = (void *)v20;
          [v10 appendString:v20];
          goto LABEL_15;
        }
        if ([v19 conformsToProtocol:&unk_1EEF248E0]
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v20 = [v19 shortDescription];
          goto LABEL_14;
        }
        v21 = [v19 description];
        [v10 appendFormat:@"%@%@", v13, v21];
LABEL_15:

        [v10 appendString:@",\n"];
        ++v18;
      }
      while (v16 != v18);
      uint64_t v22 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      uint64_t v16 = v22;
    }
    while (v22);
  }

  v23 = &stru_1EEF0F5E0;
  if (v8) {
    v23 = v8;
  }
  [v10 appendFormat:@"%@"], v23);

  return v10;
}

- (uint64_t)secureDescriptionWithBlacklistKeys:()HMFDeprecated
{
  return [a1 secureDescriptionWithIndent:0 newLine:0 blacklistedKeys:a3];
}

- (id)describeElements:()HMFDeprecated
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = [MEMORY[0x1E4F28E78] string];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v5, "appendString:", @"\r", (void)v14);
        v12 = v4[2](v4, v11);
        [v5 appendString:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

@end