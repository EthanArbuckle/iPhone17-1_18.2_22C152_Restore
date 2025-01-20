@interface NSBundle(HealthKit)
+ (id)hk_findContainedBundleWithIdentifier:()HealthKit directoryURL:;
- (id)hk_extensionPointIdentifier;
- (id)hk_findContainedBundleWithIdentifier:()HealthKit;
- (uint64_t)hk_displayName;
- (uint64_t)hk_localizedClinicalReadAuthorizationUsageDescription;
- (uint64_t)hk_localizedReadAuthorizationUsageDescription;
- (uint64_t)hk_localizedResearchStudyUsageDescription;
- (uint64_t)hk_localizedWriteAuthorizationUsageDescription;
- (uint64_t)hk_name;
@end

@implementation NSBundle(HealthKit)

- (uint64_t)hk_localizedReadAuthorizationUsageDescription
{
  return [a1 objectForInfoDictionaryKey:@"NSHealthShareUsageDescription"];
}

- (uint64_t)hk_localizedWriteAuthorizationUsageDescription
{
  return [a1 objectForInfoDictionaryKey:@"NSHealthUpdateUsageDescription"];
}

- (uint64_t)hk_localizedClinicalReadAuthorizationUsageDescription
{
  return [a1 objectForInfoDictionaryKey:@"NSHealthClinicalHealthRecordsShareUsageDescription"];
}

- (uint64_t)hk_localizedResearchStudyUsageDescription
{
  return [a1 objectForInfoDictionaryKey:@"NSHealthResearchStudyUsageDescription"];
}

- (id)hk_extensionPointIdentifier
{
  v1 = [a1 objectForInfoDictionaryKey:@"NSExtension"];
  v2 = [v1 objectForKey:@"NSExtensionPointIdentifier"];

  return v2;
}

- (uint64_t)hk_displayName
{
  return [a1 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D008]];
}

- (uint64_t)hk_name
{
  return [a1 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D008]];
}

- (id)hk_findContainedBundleWithIdentifier:()HealthKit
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 URLsForResourcesWithExtension:@"bundle" subdirectory:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithURL:", *(void *)(*((void *)&v14 + 1) + 8 * v9), (void)v14);
      v11 = [v10 bundleIdentifier];
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

+ (id)hk_findContainedBundleWithIdentifier:()HealthKit directoryURL:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  [v7 enumeratorAtURL:v6 includingPropertiesForKeys:0 options:7 errorHandler:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v20 = v7;
    id v21 = v6;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "pathExtension", v20, v21, (void)v22);
        int v15 = [v14 isEqualToString:@"bundle"];

        if (v15)
        {
          long long v16 = [MEMORY[0x1E4F28B50] bundleWithURL:v13];
          long long v17 = [v16 bundleIdentifier];
          char v18 = [v17 isEqualToString:v5];

          if (v18) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
    long long v16 = 0;
LABEL_12:
    id v7 = v20;
    id v6 = v21;
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

@end