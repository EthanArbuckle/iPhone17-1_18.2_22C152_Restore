@interface UTType(FPCaching)
+ (id)fp_cachedTypeWithIdentifier:()FPCaching alreadyAvailableType:;
+ (uint64_t)fp_cachedTypeWithIdentifier:()FPCaching;
@end

@implementation UTType(FPCaching)

+ (id)fp_cachedTypeWithIdentifier:()FPCaching alreadyAvailableType:
{
  id v5 = a3;
  id v6 = a4;
  if (fp_cachedTypeWithIdentifier_alreadyAvailableType__onceToken != -1) {
    dispatch_once(&fp_cachedTypeWithIdentifier_alreadyAvailableType__onceToken, &__block_literal_global_63);
  }
  if (!fp_cachedTypeWithIdentifier_alreadyAvailableType__hasFastSequenceNumber) {
    goto LABEL_12;
  }
  v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v23 = 0;
  [v7 getKnowledgeUUID:0 andSequenceNumber:&v23];
  id v8 = v23;
  id v9 = v23;

  v10 = (void *)fp_cachedTypeWithIdentifier_alreadyAvailableType__lastDatabaseGeneration;
  if (!fp_cachedTypeWithIdentifier_alreadyAvailableType__lastDatabaseGeneration)
  {
    objc_storeStrong((id *)&fp_cachedTypeWithIdentifier_alreadyAvailableType__lastDatabaseGeneration, v8);
    v10 = (void *)fp_cachedTypeWithIdentifier_alreadyAvailableType__lastDatabaseGeneration;
  }
  if (([v10 isEqual:v9] & 1) == 0)
  {
    [(id)fp_cachedTypeWithIdentifier_alreadyAvailableType__cache removeAllObjects];
    objc_storeStrong((id *)&fp_cachedTypeWithIdentifier_alreadyAvailableType__lastDatabaseGeneration, v8);
  }

  if (fp_cachedTypeWithIdentifier_alreadyAvailableType__hasFastSequenceNumber)
  {
    id v11 = [(id)fp_cachedTypeWithIdentifier_alreadyAvailableType__cache objectForKey:v5];
    if (!v11)
    {
      if (v6)
      {
        [(id)fp_cachedTypeWithIdentifier_alreadyAvailableType__cache setObject:v6 forKey:v5];
        id v11 = v6;
      }
      else
      {
        uint64_t v20 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v5];
        v21 = (void *)v20;
        v22 = (void *)*MEMORY[0x1E4F44408];
        if (v20) {
          v22 = (void *)v20;
        }
        id v11 = v22;

        [(id)fp_cachedTypeWithIdentifier_alreadyAvailableType__cache setObject:v11 forKey:v5];
      }
    }
  }
  else
  {
LABEL_12:
    id v12 = [(id)fp_cachedTypeWithIdentifier_alreadyAvailableType__cache objectForKey:v5];
    if (!v12) {
      id v12 = v6;
    }
    uint64_t v13 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v5];
    v14 = (void *)v13;
    v15 = (void *)*MEMORY[0x1E4F44408];
    if (v13) {
      v15 = (void *)v13;
    }
    id v16 = v15;

    if (!v12 || (char v17 = [v16 isEqual:v12], v18 = v12, (v17 & 1) == 0))
    {
      [(id)fp_cachedTypeWithIdentifier_alreadyAvailableType__cache setObject:v16 forKey:v5];
      v18 = v16;
    }
    id v11 = v18;
  }

  return v11;
}

+ (uint64_t)fp_cachedTypeWithIdentifier:()FPCaching
{
  return objc_msgSend(a1, "fp_cachedTypeWithIdentifier:alreadyAvailableType:", a3, 0);
}

@end