@interface LSRecord(IconServices)
+ (id)_is_resourceTokenForRecords:()IconServices;
+ (void)_is_getSequenceNumber:()IconServices andUUID:;
- (uint64_t)_is_canProvideIconResources;
- (uint64_t)_is_providesPrecomposedIconResources;
@end

@implementation LSRecord(IconServices)

+ (void)_is_getSequenceNumber:()IconServices andUUID:
{
  v6 = [MEMORY[0x1E4F22420] sharedDatabaseContext];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v6 canAccess])
  {
    objc_msgSend(MEMORY[0x1E4F29128], "_IF_nullUUID");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = &unk_1F064ABE8;
  }
  else
  {
    v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v9 = 0;
    [v7 getKnowledgeUUID:a4 andSequenceNumber:&v9];
    id v8 = v9;
  }
  *a3 = [v8 unsignedLongLongValue];
}

+ (id)_is_resourceTokenForRecords:()IconServices
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", 16 * objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "persistentIdentifier", (void)v13);
        [v4 appendData:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v4 copy];
  return v11;
}

- (uint64_t)_is_canProvideIconResources
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    v2 = [a1 iconDictionary];
    if ([v2 count])
    {
      uint64_t v3 = 1;
      goto LABEL_20;
    }
  }
  else
  {
    v2 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = legacyResourceNames();
    id v5 = expandedNamesFromResourceNames(v4);

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v18 = v2;
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v12 = [a1 URL];
          long long v13 = [v12 URLByAppendingPathComponent:v11];

          long long v14 = [MEMORY[0x1E4F28CB8] defaultManager];
          long long v15 = [v13 path];
          char v16 = [v14 fileExistsAtPath:v15];

          if (v16)
          {
            uint64_t v3 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      uint64_t v3 = 0;
LABEL_17:
      v2 = v18;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
LABEL_20:

  return v3;
}

- (uint64_t)_is_providesPrecomposedIconResources
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  v2 = [a1 iconDictionary];
  uint64_t v3 = +[ISDefaults sharedInstance];
  uint64_t v4 = [v3 defaultToTemplatizedAppIcons] ^ 1;

  uint64_t v5 = objc_msgSend(v2, "_IF_BOOLForKeys:defaultValue:", &unk_1F064B038, v4);
  return v5;
}

@end