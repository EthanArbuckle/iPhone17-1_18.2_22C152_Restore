@interface MCUISettingsWatchManager
+ (BOOL)_isWatchYorktownEnrolled:(id)a3;
+ (BOOL)hasAnyYorktownEnrolledWatches;
@end

@implementation MCUISettingsWatchManager

+ (BOOL)hasAnyYorktownEnrolledWatches
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!MCUIIsiPhone()) {
    return 0;
  }
  v3 = [MEMORY[0x1E4F79EF0] sharedInstance];
  v4 = [MEMORY[0x1E4F79EF0] setupCompletedDevicesSelectorBlock];
  v5 = [v3 getAllDevicesWithArchivedDevicesMatching:v4];

  if ([v5 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(a1, "_isWatchYorktownEnrolled:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
          {
            BOOL v11 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 0;
LABEL_14:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)_isWatchYorktownEnrolled:(id)a3
{
  v3 = [a3 valueForProperty:*MEMORY[0x1E4F79DE0]];
  v4 = v3;
  if (v3) {
    BOOL v5 = (~[v3 unsignedIntegerValue] & 3) == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

@end