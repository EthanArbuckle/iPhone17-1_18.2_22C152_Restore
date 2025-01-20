@interface ATXAppProtectionInfo
- (BOOL)bundleIdIsHiddenByUserPreference:(id)a3;
- (BOOL)bundleIdIsLockedByUserPreference:(id)a3;
- (BOOL)bundleIdIsLockedOrHiddenByUserPreference:(id)a3;
- (id)hiddenBundleIDs;
- (id)hiddenOrLockedBundleIDs;
- (id)lockedBundleIDs;
@end

@implementation ATXAppProtectionInfo

- (BOOL)bundleIdIsHiddenByUserPreference:(id)a3
{
  v3 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:a3];
  char v4 = [v3 isHidden];

  return v4;
}

- (id)hiddenBundleIDs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4B7E0] hiddenApplications];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
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
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "bundleIdentifier", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)lockedBundleIDs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4B7E0] lockedApplications];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
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
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "bundleIdentifier", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)hiddenOrLockedBundleIDs
{
  v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(ATXAppProtectionInfo *)self hiddenBundleIDs];
  uint64_t v5 = [v3 setWithArray:v4];

  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = [(ATXAppProtectionInfo *)self lockedBundleIDs];
  v8 = [v6 setWithArray:v7];
  [v5 unionSet:v8];

  return v5;
}

- (BOOL)bundleIdIsLockedByUserPreference:(id)a3
{
  v3 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:a3];
  char v4 = [v3 isLocked];

  return v4;
}

- (BOOL)bundleIdIsLockedOrHiddenByUserPreference:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ATXAppProtectionInfo *)self bundleIdIsLockedByUserPreference:v4]
    || [(ATXAppProtectionInfo *)self bundleIdIsHiddenByUserPreference:v4];

  return v5;
}

@end