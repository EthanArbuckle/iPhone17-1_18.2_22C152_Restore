@interface LSApplicationRecord(Workflow)
+ (id)wf_bundleAllowList;
- (uint64_t)wf_iconIsDefaultVisible;
- (uint64_t)wf_isAvailableInContext:()Workflow;
- (uint64_t)wf_isLinkEnabled;
@end

@implementation LSApplicationRecord(Workflow)

- (uint64_t)wf_isAvailableInContext:()Workflow
{
  v5 = [a1 applicationState];
  char v31 = [v5 isInstalled];

  v6 = [a1 applicationState];
  char v30 = [v6 isRestricted];

  v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F855C8], *MEMORY[0x263F855C0], 0);
  v8 = [a1 bundleIdentifier];
  if (v8)
  {
    v9 = [MEMORY[0x263F251D0] hiddenAppBundleIdentifiers];
    v10 = [a1 bundleIdentifier];
    char v29 = [v9 containsObject:v10];
  }
  else
  {
    char v29 = 0;
  }

  v11 = [a1 compatibilityObject];
  v12 = [v11 bundleType];

  v32 = v7;
  if ([v12 isEqualToString:*MEMORY[0x263F01810]])
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    v14 = [a1 bundleIdentifier];
    if ([v7 containsObject:v14]) {
      LOBYTE(v13) = 1;
    }
    else {
      int v13 = objc_msgSend(a1, "wf_iconIsDefaultVisible") ^ 1;
    }
  }
  char v15 = [v12 isEqualToString:*MEMORY[0x263F01818]];
  v16 = [a1 appTags];
  char v17 = [v16 containsObject:@"hidden"];

  char v18 = [a1 isLaunchProhibited];
  v19 = [a1 bundleIdentifier];
  if ([v19 isEqualToString:@"com.apple.webapp"])
  {
    char v20 = 1;
  }
  else
  {
    v21 = [a1 bundleIdentifier];
    char v20 = [v21 isEqualToString:@"com.apple.webapp1"];
  }
  v22 = objc_msgSend(MEMORY[0x263F01878], "wf_bundleAllowList");
  v23 = [a1 bundleIdentifier];
  char v24 = [v22 containsObject:v23];

  if (a3 == 2)
  {
    char v26 = v31 ^ 1 | v30 | v13 | v29 | v20 | v18;
  }
  else
  {
    if (a3 == 1)
    {
      char v25 = v31 ^ 1 | v30;
    }
    else
    {
      if (a3)
      {
        char v27 = 0;
        goto LABEL_22;
      }
      char v25 = v31 ^ 1 | v30 | v13 | v29 | v20 | v18 | v17;
    }
    char v26 = v25 | v15;
  }
  char v27 = v26 ^ 1 | v24;
LABEL_22:

  return v27 & 1;
}

- (uint64_t)wf_iconIsDefaultVisible
{
  v1 = [a1 infoDictionary];
  v2 = [v1 objectForKey:@"SBIconVisibilityDefaultVisible" ofClass:objc_opt_class()];

  if (v2) {
    uint64_t v3 = [v2 BOOLValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

+ (id)wf_bundleAllowList
{
  if (wf_bundleAllowList_onceToken != -1) {
    dispatch_once(&wf_bundleAllowList_onceToken, &__block_literal_global_13765);
  }
  v0 = (void *)wf_bundleAllowList_allowlist;
  return v0;
}

- (uint64_t)wf_isLinkEnabled
{
  if (objc_opt_respondsToSelector() & 1) == 0 || ([a1 isLinkEnabled]) {
    return 1;
  }
  uint64_t v3 = [a1 applicationExtensionRecords];
  v4 = [v3 allObjects];
  v5 = objc_msgSend(v4, "if_firstObjectPassingTest:", &__block_literal_global_185);

  BOOL v2 = v5 != 0;
  return v2;
}

@end