@interface LSApplicationRecord(Intents)
- (id)in_counterpartIdentifiers;
- (id)in_documentTypes;
- (id)in_supportedIntents;
@end

@implementation LSApplicationRecord(Intents)

- (id)in_documentTypes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.maps.directionsrequest", @"com.appcubby.launchpro.lcpbackup", 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [a1 claimRecords];
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
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) typeIdentifiers];
        [v2 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v2 minusSet:v3];

  return v2;
}

- (id)in_counterpartIdentifiers
{
  id v2 = [a1 counterpartIdentifiers];

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F1CAD0];
    v4 = [a1 counterpartIdentifiers];
    uint64_t v5 = [v3 setWithArray:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)in_supportedIntents
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 applicationExtensionRecords];
  uint64_t v3 = [v2 allObjects];
  v4 = objc_msgSend((id)v3, "if_objectsPassingTest:", &__block_literal_global_104513);
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [a1 bundleIdentifier];
  LOBYTE(v3) = [v6 hasPrefix:@"com.apple.shortcuts"];

  if (v3)
  {
    uint64_t v7 = @"com.apple.WorkflowKit.ShortcutsIntents";
  }
  else
  {
    v8 = [a1 bundleIdentifier];
    int v9 = [v8 isEqualToString:@"com.apple.mobiletimer"];

    if (!v9) {
      goto LABEL_6;
    }
    uint64_t v7 = @"com.apple.mobiletimer-framework.MobileTimerIntents";
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v7 error:0];
  objc_msgSend(v5, "if_addObjectIfNonNil:", v10);

LABEL_6:
  v28 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a1);
  long long v11 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "if_extensionAttributesDictionary");
        v19 = [v18 objectForKeyedSubscript:@"IntentsSupported"];
        if ([v19 count])
        {
          v20 = [v17 extensionPointRecord];
          v21 = [v20 identifier];

          v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v19];
          [v11 setObject:v22 forKeyedSubscript:v21];

          [v28 addObjectsFromArray:v19];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v14);
  }

  v23 = (void *)MEMORY[0x1E4F1CA80];
  v24 = [v27 supportedIntents];
  v25 = [v23 setWithArray:v24];

  [v25 unionSet:v28];

  return v25;
}

@end