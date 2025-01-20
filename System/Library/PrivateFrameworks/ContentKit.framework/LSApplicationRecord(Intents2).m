@interface LSApplicationRecord(Intents2)
- (id)in2_supportedIntents;
@end

@implementation LSApplicationRecord(Intents2)

- (id)in2_supportedIntents
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = [a1 applicationExtensionRecords];
  uint64_t v3 = [v2 allObjects];
  v4 = objc_msgSend((id)v3, "if_objectsPassingTest:", &__block_literal_global_194_13754);
  v5 = (void *)[v4 mutableCopy];

  v6 = [a1 bundleIdentifier];
  LOBYTE(v3) = [v6 hasPrefix:*MEMORY[0x263F0F808]];

  if (v3)
  {
    v7 = @"com.apple.WorkflowKit.ShortcutsIntents";
  }
  else
  {
    v8 = [a1 bundleIdentifier];
    int v9 = [v8 isEqualToString:@"com.apple.mobiletimer"];

    if (!v9) {
      goto LABEL_6;
    }
    v7 = @"com.apple.mobiletimer-framework.MobileTimerIntents";
  }
  v10 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v7 error:0];
  objc_msgSend(v5, "if_addObjectIfNonNil:", v10);

LABEL_6:
  v29 = objc_msgSend(MEMORY[0x263EFF9C0], "set", a1);
  v11 = [MEMORY[0x263EFF9A0] dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    uint64_t v16 = *MEMORY[0x263F0F750];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "if_extensionAttributesDictionary");
        v20 = [v19 objectForKeyedSubscript:v16];
        if ([v20 count])
        {
          v21 = [v18 extensionPointRecord];
          v22 = [v21 identifier];

          v23 = [MEMORY[0x263EFFA08] setWithArray:v20];
          [v11 setObject:v23 forKeyedSubscript:v22];

          [v29 addObjectsFromArray:v20];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }

  v24 = (void *)MEMORY[0x263EFF9C0];
  v25 = [v28 supportedIntents];
  v26 = [v24 setWithArray:v25];

  [v26 unionSet:v29];
  return v26;
}

@end