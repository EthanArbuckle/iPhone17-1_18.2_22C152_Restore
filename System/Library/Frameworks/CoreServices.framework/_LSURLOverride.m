@interface _LSURLOverride
+ (id)booksStoreAuthorizationURL:(State *)a3;
+ (id)fmfURL:(State *)a3;
+ (id)fmipURL:(State *)a3;
+ (id)iCloudEmailPrefsURL:(State *)a3;
+ (id)iCloudFamilyURL:(State *)a3;
+ (id)iCloudSchoolworkURL:(State *)a3;
+ (id)iTunesStoreURL:(State *)a3;
+ (id)keynoteLiveURL:(State *)a3;
+ (id)keynoteLiveURL_noFragment:(State *)a3;
+ (id)new;
+ (void)addOverrideBlock:(id)a3;
+ (void)removeAllOverrideBlocks;
+ (void)resetPlatformFlag;
+ (void)setUseMacOverrides:(BOOL)a3;
- (NSURL)originalURL;
- (NSURL)overrideURL;
- (_LSURLOverride)init;
- (_LSURLOverride)initWithOriginalURL:(id)a3;
- (_LSURLOverride)initWithOriginalURL:(id)a3 checkingForAvailableApplications:(BOOL)a4;
@end

@implementation _LSURLOverride

- (_LSURLOverride)initWithOriginalURL:(id)a3 checkingForAvailableApplications:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v53.receiver = self;
  v53.super_class = (Class)_LSURLOverride;
  v8 = [(_LSURLOverride *)&v53 init];
  if (!v8) {
    goto LABEL_63;
  }
  v9 = (NSURLComponents *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v7 resolvingAgainstBaseURL:1];
  if (v9)
  {
    LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)&v48, v9, v4);
    v10 = (LaunchServices::URLOverrides *)_os_feature_enabled_impl();
    if (v10)
    {
      v11 = LaunchServices::URLOverrides::getLog(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:]();
      }
    }
    else
    {
      if (LaunchServices::URLOverrides::overrideBlocks)
      {
        v10 = (LaunchServices::URLOverrides *)[(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure];
        if (v10)
        {
          BOOL v46 = v4;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v14 = (id)LaunchServices::URLOverrides::overrideBlocks;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:buf count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v55;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v55 != v16) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v18 = *(void *)(*((void *)&v54 + 1) + 8 * i);
                (*(void (**)(uint64_t, id, void, void, void))(v18 + 16))(v18, v48, v49, v50, v52);
                v19 = (LaunchServices::URLOverrides *)objc_claimAutoreleasedReturnValue();
                v20 = (char *)v19;
                if (v19)
                {
                  v31 = LaunchServices::URLOverrides::getLog(v19);
                  BOOL v4 = v46;
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                  {
                    v42 = (void *)MEMORY[0x18530F950](v18);
                    v43 = [v48 URL];
                    *(_DWORD *)v65 = 138478339;
                    *(void *)&v65[4] = v42;
                    *(_WORD *)&v65[12] = 2113;
                    *(void *)&v65[14] = v43;
                    *(_WORD *)&v65[22] = 2113;
                    v66 = v20;
                    _os_log_debug_impl(&dword_182959000, v31, OS_LOG_TYPE_DEBUG, "Block %{private}@ overrode URL %{private}@ to %{private}@", v65, 0x20u);
                  }
                  goto LABEL_48;
                }
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:buf count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          BOOL v4 = v46;
        }
      }
      if (v49 || v50 || v51)
      {
        v22 = (LaunchServices::URLOverrides *)objc_opt_class();
        *(void *)v65 = sel_fmfURL_;
        *(void *)&v65[8] = sel_fmipURL_;
        *(void *)&v65[16] = sel_iTunesStoreURL_;
        v66 = sel_iCloudEmailPrefsURL_;
        int v23 = v49 | v50;
        v67 = sel_keynoteLiveURL_;
        v68 = sel_iCloudFamilyURL_;
        v24 = &v64;
        if (!v51) {
          v24 = 0;
        }
        v69 = sel_iCloudSchoolworkURL_;
        if (v23) {
          v25 = (SEL *)v65;
        }
        else {
          v25 = (SEL *)v24;
        }
        if (v23) {
          uint64_t v26 = 7;
        }
        else {
          uint64_t v26 = v51;
        }
        v64 = sel_booksStoreAuthorizationURL_;
        if (v26)
        {
          v27 = v22;
          while (1)
          {
            v28 = *v25;
            objc_msgSend(v27, *v25, &v48);
            v22 = (LaunchServices::URLOverrides *)objc_claimAutoreleasedReturnValue();
            v20 = (char *)v22;
            if (v22) {
              break;
            }
            ++v25;
            if (!--v26) {
              goto LABEL_39;
            }
          }
          v29 = LaunchServices::URLOverrides::getLog(v22);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v44 = NSStringFromSelector(v28);
            v45 = [v48 URL];
            *(_DWORD *)v58 = 138478339;
            v59 = v44;
            __int16 v60 = 2113;
            v61 = v45;
            __int16 v62 = 2113;
            v63 = v20;
            _os_log_debug_impl(&dword_182959000, v29, OS_LOG_TYPE_DEBUG, "Selector %{private}@ overrode URL %{private}@ to %{private}@", v58, 0x20u);
          }
        }
        else
        {
LABEL_39:
          v29 = LaunchServices::URLOverrides::getLog(v22);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v30 = [v48 URL];
            -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:].cold.5(v30, v58, v29);
          }
          v20 = 0;
        }

LABEL_48:
        v33 = LaunchServices::URLOverrides::getLog(v32);
        v34 = v33;
        if (v20)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138478083;
            v71 = v20;
            __int16 v72 = 2113;
            id v73 = v7;
            _os_log_impl(&dword_182959000, v34, OS_LOG_TYPE_DEFAULT, "URL %{private}@ overrides URL %{private}@", buf, 0x16u);
          }

          objc_storeStrong((id *)&v8->_originalURL, a3);
          uint64_t v35 = [v20 copy];
          overrideURL = v8->_overrideURL;
          v8->_overrideURL = (NSURL *)v35;

          if (!v4) {
            goto LABEL_62;
          }
          v37 = +[LSApplicationWorkspace defaultWorkspace];
          id v47 = 0;
          char v38 = [v37 isApplicationAvailableToOpenURL:v20 error:&v47];
          v39 = (_LSURLOverride *)v47;

          if (v38)
          {
LABEL_61:

LABEL_62:
LABEL_63:
            v8 = v8;
            v13 = v8;
            goto LABEL_64;
          }

          if (!v39)
          {
LABEL_60:
            v8 = 0;
            goto LABEL_61;
          }
          v34 = LaunchServices::URLOverrides::getLog(v40);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
            -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:]((uint64_t)v20);
          }
        }
        else
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:]();
          }
          v39 = v8;
        }

        goto LABEL_60;
      }
      v11 = LaunchServices::URLOverrides::getLog(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v21 = [v48 URL];
        -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:].cold.4(v21, v65, v11);
      }
    }

    v20 = 0;
    goto LABEL_48;
  }
  v12 = LaunchServices::URLOverrides::getLog(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v71 = (char *)v7;
    _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "URL %{private}@ could not be decomposed into its components. Cannot override.", buf, 0xCu);
  }

  v13 = 0;
LABEL_64:

  return v13;
}

- (_LSURLOverride)init
{
}

+ (id)new
{
}

- (_LSURLOverride)initWithOriginalURL:(id)a3
{
  return [(_LSURLOverride *)self initWithOriginalURL:a3 checkingForAvailableApplications:1];
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (NSURL)overrideURL
{
  return self->_overrideURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideURL, 0);

  objc_storeStrong((id *)&self->_originalURL, 0);
}

+ (void)addOverrideBlock:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = [NSString stringWithUTF8String:"+[_LSURLOverride(Tests) addOverrideBlock:]"];
    [v7 handleFailureInFunction:v8, @"LSURLOverride.mm", 154, @"Invalid parameter not satisfying: %@", @"block != nil" file lineNumber description];
  }
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    v3 = (void *)LaunchServices::URLOverrides::overrideBlocks;
    if (!LaunchServices::URLOverrides::overrideBlocks)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v5 = (void *)LaunchServices::URLOverrides::overrideBlocks;
      LaunchServices::URLOverrides::overrideBlocks = (uint64_t)v4;

      v3 = (void *)LaunchServices::URLOverrides::overrideBlocks;
    }
    v6 = (void *)MEMORY[0x18530F950](v9);
    [v3 addObject:v6];
  }
}

+ (void)removeAllOverrideBlocks
{
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    v2 = (void *)LaunchServices::URLOverrides::overrideBlocks;
    LaunchServices::URLOverrides::overrideBlocks = 0;
  }
}

+ (void)setUseMacOverrides:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    uint64_t v4 = [NSNumber numberWithBool:v3];
    v5 = (void *)LaunchServices::URLOverrides::gUseMacOverrides;
    LaunchServices::URLOverrides::gUseMacOverrides = v4;
  }
}

+ (void)resetPlatformFlag
{
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    v2 = (void *)LaunchServices::URLOverrides::gUseMacOverrides;
    LaunchServices::URLOverrides::gUseMacOverrides = 0;
  }
}

+ (id)fmfURL:(State *)a3
{
  uint64_t v4 = [a3->var0 host];
  v5 = [v4 lowercaseString];

  if ([v5 isEqualToString:@"fmfmail.icloud.com"])
  {
    v6 = [a3->var0 path];
    uint64_t v7 = [a3->var0 query];
    v8 = (void *)v7;
    if (v6 && v7)
    {
      id v9 = (void *)[v6 mutableCopy];
      [v9 appendString:@"?"];
      [v9 appendString:v8];
      uint64_t v10 = [v9 copy];

      v6 = (void *)v10;
    }
    if ([v6 hasPrefix:@"/"])
    {
      v11 = (void *)[a3->var0 copy];
      [v11 setScheme:@"fmf1"];
      v12 = [v11 URL];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)fmipURL:(State *)a3
{
  uint64_t v4 = [a3->var0 host];
  v5 = [v4 lowercaseString];

  if ([v5 isEqualToString:@"fmipmail.icloud.com"])
  {
    v6 = (void *)[a3->var0 copy];
    [v6 setScheme:@"fmip1"];
    uint64_t v7 = [v6 URL];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)iTunesStoreURL:(State *)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (a3->var6)
  {
    BOOL v3 = LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      +[_LSURLOverride(Functions) iTunesStoreURL:]();
    }
    uint64_t v4 = 0;
    goto LABEL_65;
  }
  uint64_t v59 = [a3->var0 scheme];
  v6 = [a3->var0 host];
  uint64_t v7 = [v6 lowercaseString];

  v58 = (void *)v7;
  v8 = [a3->var0 path];
  uint64_t v9 = [a3->var0 query];
  uint64_t v10 = (void *)v9;
  uint64_t v4 = 0;
  if (!v59 || !v7 || !v8) {
    goto LABEL_64;
  }
  unsigned __int8 v52 = (void *)v9;
  if (v9)
  {
    v11 = (void *)[v8 mutableCopy];
    [v11 appendString:@"?"];
    [v11 appendString:v10];
    uint64_t v12 = [v11 copy];

    v8 = (void *)v12;
  }
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:@"/var/mobile/Library/Caches/com.apple.itunesstored/url-resolution.plist"];
  if (v13)
  {
    id v14 = @"/var/mobile/Library/Caches/com.apple.itunesstored/url-resolution.plist";
  }
  else
  {
    v42 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MobileCoreServices"];
    id v14 = [v42 pathForResource:@"iTunesStoreURLPatterns" ofType:@"plist"];

    if (!v14 || (v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v14]) == 0)
    {
      uint64_t v4 = 0;
      goto LABEL_63;
    }
  }
  id v48 = v14;
  [v13 objectForKey:@"p2-url-resolution"];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  id v47 = v13;
  uint64_t v15 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (!v15)
  {
    uint64_t v4 = 0;
    goto LABEL_62;
  }
  uint64_t v50 = *(void *)v69;
  *(void *)&long long v16 = 138477827;
  long long v44 = v16;
  do
  {
    uint64_t v17 = 0;
    uint64_t v46 = v15;
    do
    {
      if (*(void *)v69 != v50) {
        objc_enumerationMutation(obj);
      }
      long long v55 = *(void **)(*((void *)&v68 + 1) + 8 * v17);
      uint64_t v18 = objc_msgSend(v55, "objectForKey:", @"scheme-mapping", v44);
      uint64_t v51 = v17;
      long long v57 = [v18 objectForKey:v59];

      if (a3->var1)
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4F29088]);
        [v19 setScheme:v57];
        v20 = +[LSApplicationWorkspace defaultWorkspace];
        v21 = [v19 URL];
        int v22 = [v20 isApplicationAvailableToOpenURL:v21 error:0];

        if (!v22)
        {
          v40 = LaunchServices::URLOverrides::getLog(v23);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v44;
            v75 = v57;
            _os_log_debug_impl(&dword_182959000, v40, OS_LOG_TYPE_DEBUG, "Skipping iTunes Store scheme %{private}@ because no app is installed to handle it", buf, 0xCu);
          }

          v24 = v19;
          goto LABEL_53;
        }
      }
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v24 = [v55 objectForKey:@"host-patterns"];
      long long v54 = v24;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v64 objects:v73 count:16];
      if (v25)
      {
        int v26 = 0;
        uint64_t v53 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v65 != v53) {
              objc_enumerationMutation(v24);
            }
            v28 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:*(void *)(*((void *)&v64 + 1) + 8 * i) options:1 error:0];
            BOOL v31 = objc_msgSend(v28, "rangeOfFirstMatchInString:options:range:", v58, 0, 0, objc_msgSend(v58, "length")) != 0x7FFFFFFFFFFFFFFFLL|| v29 != 0;
            v26 |= v31;
            if (v26)
            {
              long long v62 = 0u;
              long long v63 = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              unsigned __int8 v49 = v28;
              v32 = [v55 objectForKey:@"path-patterns"];
              int v45 = v26;
              uint64_t v33 = [v32 countByEnumeratingWithState:&v60 objects:v72 count:16];
              if (v33)
              {
                uint64_t v34 = *(void *)v61;
                while (2)
                {
                  for (uint64_t j = 0; j != v33; ++j)
                  {
                    if (*(void *)v61 != v34) {
                      objc_enumerationMutation(v32);
                    }
                    v36 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:*(void *)(*((void *)&v60 + 1) + 8 * j) options:1 error:0];
                    BOOL v39 = objc_msgSend(v36, "rangeOfFirstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length")) == 0x7FFFFFFFFFFFFFFFLL&& v37 == 0;

                    if (!v39)
                    {

                      v41 = (void *)[a3->var0 copy];
                      [v41 setScheme:v57];
                      uint64_t v4 = [v41 URL];

                      goto LABEL_62;
                    }
                  }
                  uint64_t v33 = [v32 countByEnumeratingWithState:&v60 objects:v72 count:16];
                  if (v33) {
                    continue;
                  }
                  break;
                }
              }

              int v26 = v45;
              v28 = v49;
            }

            v24 = v54;
          }
          uint64_t v25 = [v54 countByEnumeratingWithState:&v64 objects:v73 count:16];
        }
        while (v25);
      }
LABEL_53:

      uint64_t v17 = v51 + 1;
    }
    while (v51 + 1 != v46);
    uint64_t v15 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
    uint64_t v4 = 0;
  }
  while (v15);
LABEL_62:

  id v14 = v48;
LABEL_63:

  uint64_t v10 = v52;
LABEL_64:

  BOOL v3 = v59;
LABEL_65:

  return v4;
}

+ (id)iCloudEmailPrefsURL:(State *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a3->var3)
  {
    uint64_t v4 = [a3->var0 host];
    v5 = [v4 lowercaseString];

    if ([v5 isEqualToString:@"setup.icloud.com"])
    {
      uint64_t v37 = [a3->var0 query];
      if (v37
        && (BOOL HasCaseInsensitivePrefix = LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix(&a3->var0, &cfstr_EmailPrefs.isa)))
      {
        BOOL var6 = a3->var6;
        v8 = LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)HasCaseInsensitivePrefix);
        BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
        if (var6)
        {
          if (v9) {
            +[_LSURLOverride(Functions) iCloudEmailPrefsURL:]();
          }

          uint64_t v10 = [a3->var0 path];
          if ([(__CFString *)v10 hasPrefix:@"/"])
          {
            uint64_t v11 = -[__CFString substringWithRange:](v10, "substringWithRange:", 1, [(__CFString *)v10 length] - 1);

            uint64_t v10 = (__CFString *)v11;
          }
          uint64_t v35 = v10;
          if (v10 && [(__CFString *)v10 length])
          {
            id v12 = objc_alloc_init(MEMORY[0x1E4F29088]);
            [v12 setScheme:@"x-apple.systempreferences"];
            if (LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix(&a3->var0, &cfstr_EmailPrefsFami.isa)) {
              v13 = @"com.apple.preferences.FamilySharingPrefPane";
            }
            else {
              v13 = @"com.apple.preferences.AppleIDPrefPane";
            }
            [v12 setPath:v13];
            id v14 = (void *)[(__CFString *)v10 mutableCopy];
            [v14 appendString:@"?"];
            [v14 appendString:v37];
            [v12 setQuery:v14];
            uint64_t v15 = [v12 URL];

LABEL_43:
          }
          else
          {
            uint64_t v15 = 0;
          }
        }
        else
        {
          if (v9) {
            +[_LSURLOverride(Functions) iCloudEmailPrefsURL:]();
          }

          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v16 = [a3->var0 queryItems];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v47 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v43;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v43 != v18) {
                  objc_enumerationMutation(v16);
                }
                v20 = [*(id *)(*((void *)&v42 + 1) + 8 * i) name];
                char v21 = [v20 isEqualToString:@"path"];

                if (v21)
                {

                  long long v40 = 0u;
                  long long v41 = 0u;
                  long long v38 = 0u;
                  long long v39 = 0u;
                  int v23 = [a3->var0 queryItems];
                  uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
                  if (v24)
                  {
                    uint64_t v25 = *(void *)v39;
                    uint64_t v35 = &stru_1ECB1A570;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v24; ++j)
                      {
                        if (*(void *)v39 != v25) {
                          objc_enumerationMutation(v23);
                        }
                        v27 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                        v28 = [v27 name];
                        uint64_t v29 = [v28 lowercaseString];
                        int v30 = [v29 isEqual:@"path"];

                        if (v30)
                        {
                          BOOL v31 = NSString;
                          v32 = [v27 value];
                          uint64_t v35 = [v31 stringWithFormat:@"ICLOUD_SERVICE/%@", v32];

                          goto LABEL_42;
                        }
                      }
                      uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
                      if (v24) {
                        continue;
                      }
                      break;
                    }
                  }
                  else
                  {
                    uint64_t v35 = &stru_1ECB1A570;
                  }
LABEL_42:

                  id v33 = objc_alloc(MEMORY[0x1E4F1CB10]);
                  id v12 = [@"settings-navigation://com.apple.Settings.AppleAccount/" stringByAppendingString:v35];
                  uint64_t v15 = (void *)[v33 initWithString:v12];
                  goto LABEL_43;
                }
              }
              uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v47 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          id v22 = objc_alloc(MEMORY[0x1E4F1CB10]);
          v36 = [@"settings-navigation://com.apple.Settings.AppleAccount?" stringByAppendingString:v37];
          uint64_t v15 = objc_msgSend(v22, "initWithString:");
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

+ (id)keynoteLiveURL:(State *)a3
{
  if (LaunchServices::URLOverrides::State::isNooverride(&a3->var0))
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(a1, "keynoteLiveURL_noFragment:", a3);
  }

  return v5;
}

+ (id)keynoteLiveURL_noFragment:(State *)a3
{
  BOOL v3 = !a3->var3 || !a3->var5;
  if (v3 || !LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix(&a3->var0, &cfstr_KeynoteLive.isa))
  {
    BOOL v9 = 0;
  }
  else
  {
    v5 = (void *)[a3->var0 copy];
    [v5 setScheme:@"com.apple.iwork.keynote-live"];
    v6 = +[LSApplicationWorkspace defaultWorkspace];
    uint64_t v7 = [v5 URL];
    int v8 = [v6 isApplicationAvailableToOpenURL:v7 error:0];

    if (v8)
    {
      BOOL v9 = [v5 URL];
    }
    else
    {
      uint64_t v10 = [a3->var0 host];
      uint64_t v11 = [v10 caseInsensitiveCompare:@"www.icloud.com"];

      if (v11)
      {
        BOOL v9 = 0;
      }
      else
      {
        id v12 = [a3->var0 path];
        v13 = [v12 lastPathComponent];

        id v14 = objc_alloc_init(MEMORY[0x1E4F29088]);
        [v14 setScheme:@"x-keynote-live"];
        [v14 setHost:v13];
        BOOL v9 = [v14 URL];
      }
    }
  }

  return v9;
}

+ (id)iCloudFamilyURL:(State *)a3
{
  if (a3->var6)
  {
    BOOL v3 = LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      +[_LSURLOverride(Functions) iCloudFamilyURL:]();
    }

    uint64_t v4 = 0;
  }
  else
  {
    v6 = [a3->var0 host];
    uint64_t v7 = [v6 lowercaseString];

    if ([v7 isEqual:@"setup.icloud.com"])
    {
      int v8 = [a3->var0 path];
      if ([v8 isEqual:@"/family/messages"])
      {
        BOOL v9 = (void *)[a3->var0 copy];
        [v9 setScheme:@"family"];
        [v9 setHost:@"messages"];
        [v9 setPath:0];
        uint64_t v4 = [v9 URL];
      }
      else
      {
        uint64_t v4 = 0;
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

+ (id)iCloudSchoolworkURL:(State *)a3
{
  if (a3->var6)
  {
    BOOL v3 = LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      +[_LSURLOverride(Functions) iCloudSchoolworkURL:].cold.4();
    }
    goto LABEL_15;
  }
  if (!a3->var5)
  {
    BOOL v3 = LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      +[_LSURLOverride(Functions) iCloudSchoolworkURL:](v3, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_15;
  }
  v5 = [a3->var0 fragment];
  v6 = [v5 pathComponents];
  BOOL v3 = [v6 mutableCopy];

  if (!v3 || (uint64_t v7 = (LaunchServices::URLOverrides *)[v3 count], (unint64_t)v7 <= 1))
  {
    int v8 = LaunchServices::URLOverrides::getLog(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[_LSURLOverride(Functions) iCloudSchoolworkURL:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
LABEL_14:

LABEL_15:
    id v33 = 0;
    goto LABEL_16;
  }
  int v23 = [v3 objectAtIndexedSubscript:0];
  uint64_t v24 = [v23 caseInsensitiveCompare:@"schoolwork"];

  if (v24)
  {
    int v8 = LaunchServices::URLOverrides::getLog(v25);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[_LSURLOverride(Functions) iCloudSchoolworkURL:](v8, v26, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_14;
  }
  uint64_t v35 = (void *)[a3->var0 copy];
  [v35 setScheme:@"schoolwork"];
  [v35 setHost:@"schoolwork"];
  [v3 replaceObjectAtIndex:0 withObject:&stru_1ECB1A570];
  v36 = [v3 componentsJoinedByString:@"/"];
  [v35 setPath:v36];

  [v35 setFragment:0];
  id v33 = [v35 URL];

LABEL_16:

  return v33;
}

+ (id)booksStoreAuthorizationURL:(State *)a3
{
  if (a3->var6)
  {
    if (a3->var4)
    {
      uint64_t v4 = [a3->var0 host];
      int v5 = [v4 isEqual:@"www.audible.com"];

      if (v5)
      {
        v6 = (void *)[a3->var0 copy];
        [v6 setScheme:@"ibooks"];
        uint64_t v7 = [v6 URL];

        goto LABEL_9;
      }
    }
  }
  else
  {
    int v8 = LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)a1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[_LSURLOverride(Functions) booksStoreAuthorizationURL:]();
    }
  }
  uint64_t v7 = 0;
LABEL_9:

  return v7;
}

- (void)initWithOriginalURL:checkingForAvailableApplications:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "No override for URL %{private}@", v2, v3, v4, v5, v6);
}

- (void)initWithOriginalURL:(uint64_t)a1 checkingForAvailableApplications:.cold.2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138478083;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_4_2();
  _os_log_debug_impl(&dword_182959000, v1, OS_LOG_TYPE_DEBUG, "Error determining if app is available to open URL %{private}@: %{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)initWithOriginalURL:checkingForAvailableApplications:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_7(&dword_182959000, v0, v1, "URL overrides are disabled via feature flag.", v2, v3, v4, v5, v6);
}

- (void)initWithOriginalURL:(os_log_t)log checkingForAvailableApplications:.cold.4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138477827;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_182959000, log, OS_LOG_TYPE_DEBUG, "URL %{private}@ was not an HTTP(S) or ITMS URL. Skipping URL overrides.", buf, 0xCu);
}

- (void)initWithOriginalURL:(os_log_t)log checkingForAvailableApplications:.cold.5(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138477827;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_182959000, log, OS_LOG_TYPE_DEBUG, "Nothing overrode URL %{private}@", buf, 0xCu);
}

@end