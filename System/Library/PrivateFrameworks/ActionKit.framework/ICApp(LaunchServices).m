@interface ICApp(LaunchServices)
+ (id)appWithIdentifier:()LaunchServices name:;
- (id)applicationProxy;
- (void)initWithApplicationProxy:()LaunchServices;
@end

@implementation ICApp(LaunchServices)

- (id)applicationProxy
{
  v2 = objc_getAssociatedObject(a1, sel_applicationProxy);
  if (!v2)
  {
    v3 = (void *)MEMORY[0x263F01868];
    v4 = [a1 bundleIdentifier];
    v2 = [v3 applicationProxyForIdentifier:v4];
  }
  v5 = [v2 appState];
  if ([v5 isInstalled]) {
    v6 = v2;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void)initWithApplicationProxy:()LaunchServices
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 applicationIdentifier];

  if (v5)
  {
    v6 = [v4 objectForInfoDictionaryKey:@"CFBundleURLTypes" ofClass:objc_opt_class()];
    id v7 = objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_28340);

    v8 = [v4 claimedDocumentContentTypes];
    v9 = [v8 allObjects];

    v10 = [v7 firstObject];
    v11 = [v10 objectForKeyedSubscript:@"CFBundleURLSchemes"];
    v12 = [v11 firstObject];

    v13 = objc_opt_new();
    v14 = [v4 localizedName];

    if (v14)
    {
      v15 = [v4 localizedName];
      [v13 setObject:v15 forKeyedSubscript:@"Name"];
    }
    if (v12)
    {
      uint64_t v21 = *MEMORY[0x263F86818];
      v22 = v12;
      v16 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      v23[0] = v16;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      [v13 setObject:v17 forKeyedSubscript:@"URLSchemes"];
    }
    if (v9) {
      [v13 setObject:v9 forKeyedSubscript:@"DocumentTypes"];
    }
    v18 = [v4 applicationIdentifier];
    a1 = (void *)[a1 initWithIdentifier:v18 definition:v13];

    if (a1)
    {
      objc_setAssociatedObject(a1, sel_applicationProxy, v4, (void *)1);
      id v19 = a1;
    }

    v5 = a1;
  }

  return v5;
}

+ (id)appWithIdentifier:()LaunchServices name:
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    if (!v7)
    {
      v12 = 0;
      goto LABEL_12;
    }
    id v10 = [MEMORY[0x263F86828] sharedRegistry];
    v13 = [v10 apps];
    v14 = [v13 filteredArrayForKey:@"localizedShortName" value:v8];
    v12 = [v14 firstObject];

    goto LABEL_10;
  }
  v9 = [MEMORY[0x263F86828] sharedRegistry];
  id v10 = [v9 appWithIdentifier:v6];

  v11 = [v10 definition];

  if (!v11)
  {
    v13 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v6];
    v15 = [v13 appState];
    int v16 = [v15 isInstalled];

    if (v16) {
      v12 = (void *)[[a1 alloc] initWithApplicationProxy:v13];
    }
    else {
      v12 = 0;
    }
LABEL_10:

    goto LABEL_11;
  }
  id v10 = v10;
  v12 = v10;
LABEL_11:

LABEL_12:
  return v12;
}

@end