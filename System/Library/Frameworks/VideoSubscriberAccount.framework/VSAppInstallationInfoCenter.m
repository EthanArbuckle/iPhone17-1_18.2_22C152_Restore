@interface VSAppInstallationInfoCenter
- (VSOptional)installedAppBundleIDs;
@end

@implementation VSAppInstallationInfoCenter

- (VSOptional)installedAppBundleIDs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = (void *)MEMORY[0x1E0173AA0]();
  [MEMORY[0x1E4F223C8] enumeratorWithOptions:128];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1E0173AA0](v5);
        v11 = objc_msgSend(v9, "bundleIdentifier", (void)v14);
        if (v11) {
          [v2 addObject:v11];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }

  v12 = +[VSOptional optionalWithObject:v2];

  return (VSOptional *)v12;
}

@end