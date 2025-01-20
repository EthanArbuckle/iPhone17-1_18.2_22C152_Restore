@interface ATXAppDisplayIdentifiers
+ (BOOL)isWidgetOrWebClipIdentifier:(id)a3;
+ (NSSet)allIdentifiers;
+ (NSSet)appIdentifiers;
@end

@implementation ATXAppDisplayIdentifiers

+ (NSSet)allIdentifiers
{
  v2 = (void *)SBSCopyDisplayIdentifiers();

  return (NSSet *)v2;
}

+ (NSSet)appIdentifiers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = objc_msgSend(a1, "allIdentifiers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([a1 isWidgetOrWebClipIdentifier:v9] & 1) == 0
          && ([v9 hasPrefix:@"com.apple.downloadingicon"] & 1) == 0)
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

+ (BOOL)isWidgetOrWebClipIdentifier:(id)a3
{
  v14[5] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length] == 36)
  {
    id v4 = v3;
  }
  else
  {
    if ([v3 length] != 32)
    {
      BOOL v12 = 0;
      goto LABEL_7;
    }
    uint64_t v5 = [v3 substringToIndex:8];
    uint64_t v6 = objc_msgSend(v3, "substringWithRange:", 8, 4, v5);
    v14[1] = v6;
    uint64_t v7 = objc_msgSend(v3, "substringWithRange:", 12, 4);
    v14[2] = v7;
    v8 = objc_msgSend(v3, "substringWithRange:", 16, 4);
    v14[3] = v8;
    v9 = [v3 substringFromIndex:20];
    v14[4] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];

    id v4 = [v10 componentsJoinedByString:@"-"];
  }
  long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
  BOOL v12 = v11 != 0;

LABEL_7:
  return v12;
}

@end