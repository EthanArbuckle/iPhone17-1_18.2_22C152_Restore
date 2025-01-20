@interface NELaunchServices
+ (id)bundleProxyForIdentifier:(id)a3 uid:(unsigned int)a4 plugins:(id *)a5;
+ (id)lookupIdentifier:(id)a3 plugins:(id *)a4;
+ (id)pluginBundleProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6 uid:(unsigned int)a7;
+ (id)pluginClassToExtensionPoint:(int64_t)a3;
+ (id)pluginProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6;
@end

@implementation NELaunchServices

+ (id)lookupIdentifier:(id)a3 plugins:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F223F0] bundleProxyForIdentifier:v5];
  v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (v6)
  {
    v42 = a4;
    v8 = [v6 objectForInfoDictionaryKey:*MEMORY[0x1E4F1CC48] ofClass:objc_opt_class()];
    if (!v8)
    {
      v8 = [v7 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D008] ofClass:objc_opt_class()];
    }
    [v7 entitlementValueForKey:@"com.apple.security.application-groups" ofClass:objc_opt_class()];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v52 count:16];
    v11 = v9;
    if (v10)
    {
      uint64_t v12 = v10;
      v13 = v8;
      uint64_t v14 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v9);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v11 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v12 = [v9 countByEnumeratingWithState:&v47 objects:v52 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      v11 = v9;
LABEL_16:
      v8 = v13;
    }

    v16 = [NEBundleProxy alloc];
    v17 = [v7 bundleIdentifier];
    v18 = [v7 bundleURL];
    v19 = [v7 machOUUIDs];
    v20 = [(NEBundleProxy *)v16 initWithIdentifier:v17 url:v18 machOUUIDs:v19 name:v8 appGroups:v11];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v42)
    {
      if (isKindOfClass)
      {
        v22 = [v7 plugInKitPlugins];
        uint64_t v23 = [v22 count];

        if (v23)
        {
          v37 = v20;
          v38 = v11;
          v39 = v8;
          id v41 = v5;
          id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          v40 = v7;
          v25 = [v7 plugInKitPlugins];
          uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v44;
            do
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v44 != v28) {
                  objc_enumerationMutation(v25);
                }
                v30 = *(void **)(*((void *)&v43 + 1) + 8 * j);
                v31 = [NEBundleProxy alloc];
                v32 = [v30 bundleIdentifier];
                v33 = [v30 bundleURL];
                v34 = [v30 machOUUIDs];
                v35 = [(NEBundleProxy *)v31 initWithIdentifier:v32 url:v33 machOUUIDs:v34 name:0 appGroups:0];

                [v24 addObject:v35];
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v43 objects:v51 count:16];
            }
            while (v27);
          }

          id *v42 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v24];
          v7 = v40;
          id v5 = v41;
          v11 = v38;
          v8 = v39;
          v20 = v37;
        }
      }
    }
  }
  else
  {
    v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v5;
      _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "Failed to find %@ in LaunchServices", buf, 0xCu);
    }
    v20 = 0;
  }

  return v20;
}

+ (id)bundleProxyForIdentifier:(id)a3 uid:(unsigned int)a4 plugins:(id *)a5
{
  return +[NELaunchServices lookupIdentifier:a3 plugins:a5];
}

+ (id)pluginBundleProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6 uid:(unsigned int)a7
{
  v7 = +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:](NELaunchServices, "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:", a3, a4, a5, a6, *(void *)&a7);
  if (v7)
  {
    v8 = [NEBundleProxy alloc];
    id v9 = [v7 bundleIdentifier];
    uint64_t v10 = [v7 bundleURL];
    v11 = [v7 machOUUIDs];
    uint64_t v12 = [(NEBundleProxy *)v8 initWithIdentifier:v9 url:v10 machOUUIDs:v11 name:0 appGroups:0];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)pluginProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v9)
  {
    id v12 = [MEMORY[0x1E4F22458] pluginKitProxyForIdentifier:v9];
    goto LABEL_24;
  }
  v13 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v10];
  uint64_t v14 = v13;
  if (!v13)
  {
    uint64_t v26 = ne_log_obj();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
LABEL_22:

LABEL_23:
      id v12 = 0;
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    int64_t v38 = (int64_t)v10;
    uint64_t v27 = "Failed to find application with bundle identifier %@";
LABEL_31:
    _os_log_error_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
    goto LABEL_22;
  }
  uint64_t v15 = [v13 appState];
  if (!v15) {
    goto LABEL_21;
  }
  v16 = (void *)v15;
  v17 = [v14 appState];
  if (([v17 isInstalled] & 1) == 0)
  {

    goto LABEL_21;
  }
  v18 = [v14 appState];
  char v19 = [v18 isValid];

  if ((v19 & 1) == 0)
  {
LABEL_21:
    uint64_t v26 = ne_log_obj();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 138412290;
    int64_t v38 = (int64_t)v10;
    uint64_t v27 = "App %@ is not installed or is not valid";
    goto LABEL_31;
  }
  id v20 = v11;
  if (!v20)
  {
    id v20 = +[NELaunchServices pluginClassToExtensionPoint:a5];
    if (!v20)
    {
      v29 = ne_log_obj();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v38 = a5;
        _os_log_error_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_ERROR, "Failed to map plugin class %ld to an extension point", buf, 0xCu);
      }

      goto LABEL_23;
    }
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = [v14 plugInKitPlugins];
  id v12 = (id)[obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    v30 = v14;
    uint64_t v21 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v24 = objc_msgSend(v23, "protocol", v30);
        int v25 = [v24 isEqualToString:v20];

        if (v25)
        {
          id v12 = v23;
          goto LABEL_28;
        }
      }
      id v12 = (id)[obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v12) {
        continue;
      }
      break;
    }
LABEL_28:
    uint64_t v14 = v30;
  }

LABEL_24:

  return v12;
}

+ (id)pluginClassToExtensionPoint:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 5) {
    return 0;
  }
  else {
    return off_1E59918D0[a3 - 2];
  }
}

@end