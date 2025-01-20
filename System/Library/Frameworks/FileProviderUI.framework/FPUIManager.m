@interface FPUIManager
+ (BOOL)isAction:(id)a3 eligibleForItems:(id)a4;
+ (id)actionsForProviderDomain:(id)a3;
+ (id)authenticationActionForProviderDomain:(id)a3;
+ (id)createFPUIActionWithIdentifier:(id)a3 uiActionProviderIdentifier:(id)a4 fileProviderIdentifier:(id)a5 displayName:(id)a6 predicate:(id)a7 displayInline:(BOOL)a8 isNonUIAction:(BOOL)a9 fpProviderDomain:(id)a10;
+ (id)extensionMatchingDictionaryForItems:(id)a3 fpProviderDomain:(id)a4;
+ (id)valueForKey:(id)a3 inActionPlist:(id)a4;
+ (void)getExtensionRecordsForUseCase:(unint64_t)a3 uiExtensionRecord:(id *)a4 nonUIExtensionRecord:(id *)a5 forProviderDomain:(id)a6;
@end

@implementation FPUIManager

+ (id)authenticationActionForProviderDomain:(id)a3
{
  id v4 = a3;
  id v14 = 0;
  [a1 getExtensionRecordsForUseCase:0 uiExtensionRecord:&v14 nonUIExtensionRecord:0 forProviderDomain:v4];
  id v5 = v14;
  if (v5)
  {
    v6 = objc_msgSend(v5, "fpui_entitlementValueForKey:ofClass:", @"com.apple.private.fileproviderui.display-inline", objc_opt_class());
    uint64_t v7 = [v6 BOOLValue];

    v8 = [v5 bundleIdentifier];
    v9 = [v4 providerID];
    v10 = [MEMORY[0x263F08A98] predicateWithValue:1];
    LOBYTE(v13) = 0;
    v11 = +[FPUIManager createFPUIActionWithIdentifier:&stru_26E905938 uiActionProviderIdentifier:v8 fileProviderIdentifier:v9 displayName:&stru_26E905938 predicate:v10 displayInline:v7 isNonUIAction:v13 fpProviderDomain:v4];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)createFPUIActionWithIdentifier:(id)a3 uiActionProviderIdentifier:(id)a4 fileProviderIdentifier:(id)a5 displayName:(id)a6 predicate:(id)a7 displayInline:(BOOL)a8 isNonUIAction:(BOOL)a9 fpProviderDomain:(id)a10
{
  BOOL v10 = a8;
  id v16 = a10;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  LOBYTE(v24) = a9;
  v22 = [[FPUIAction alloc] initWithIdentifier:v21 uiActionProviderIdentifier:v20 fileProviderIdentifier:v19 displayName:v18 predicate:v17 displayInline:v10 isNonUIAction:v24 fpProviderDomain:v16];

  return v22;
}

+ (id)valueForKey:(id)a3 inActionPlist:(id)a4
{
  id v5 = a3;
  v6 = [a4 objectForKeyedSubscript:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    v8 = fpuiLogHandle;
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v8 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[FPUIManager valueForKey:inActionPlist:]((uint64_t)v5, v8);
    }
    id v7 = 0;
  }

  return v7;
}

+ (id)actionsForProviderDomain:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v45 = a3;
  v3 = fpuiLogHandle;
  if (!fpuiLogHandle)
  {
    FPUIInitLogging();
    v3 = fpuiLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[FPUIManager actionsForProviderDomain:]((uint64_t)v45, v3);
  }
  id v58 = 0;
  id v59 = 0;
  [a1 getExtensionRecordsForUseCase:1 uiExtensionRecord:&v59 nonUIExtensionRecord:&v58 forProviderDomain:v45];
  id v35 = v59;
  id v42 = v58;
  id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = v4;
  if (v35) {
    [v4 addObject:v35];
  }
  if (v42) {
    [v5 addObject:v42];
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v5;
  uint64_t v38 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v55 != v37) {
          objc_enumerationMutation(obj);
        }
        id v43 = *(id *)(*((void *)&v54 + 1) + 8 * i);
        v40 = objc_msgSend(v43, "fpui_extensionInfoForKey:ofClass:", @"NSExtensionFileProviderActions", objc_opt_class());
        if (v40)
        {
          v6 = [v43 URL];
          bundle = (__CFBundle *)_CFBundleCreateUnique();

          if (bundle)
          {
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v44 = v40;
            uint64_t v48 = [v44 countByEnumeratingWithState:&v50 objects:v60 count:16];
            if (!v48) {
              goto LABEL_55;
            }
            uint64_t v46 = *(void *)v51;
            while (1)
            {
              uint64_t v7 = 0;
              do
              {
                if (*(void *)v51 != v46) {
                  objc_enumerationMutation(v44);
                }
                uint64_t v8 = *(void *)(*((void *)&v50 + 1) + 8 * v7);
                v9 = [a1 valueForKey:@"NSExtensionFileProviderActionIdentifier" inActionPlist:v8];
                BOOL v10 = [a1 valueForKey:@"NSExtensionFileProviderActionName" inActionPlist:v8];
                v11 = [a1 valueForKey:@"NSExtensionFileProviderActionActivationRule" inActionPlist:v8];
                CFStringRef v12 = CFBundleCopyLocalizedString(bundle, v10, v10, @"Localizable");
                uint64_t v13 = (__CFString *)v12;
                if (v12) {
                  id v14 = (__CFString *)v12;
                }
                else {
                  id v14 = v10;
                }
                v15 = v14;

                if (v9) {
                  BOOL v16 = v10 == 0;
                }
                else {
                  BOOL v16 = 1;
                }
                if (!v16 && v11 != 0)
                {
                  id v18 = [MEMORY[0x263F08A98] predicateWithValue:1];
                  if ([v11 length])
                  {
                    id v19 = v11;
                    [v19 rangeOfString:@"%"];
                    if (v20) {
                      goto LABEL_33;
                    }
                    id v21 = [MEMORY[0x263F08A98] predicateWithFormat:v19];
                    if (!v21)
                    {
                      v27 = fpuiLogHandle;
                      if (!fpuiLogHandle)
                      {
                        FPUIInitLogging();
                        v27 = fpuiLogHandle;
                      }
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v62 = v19;
                        _os_log_error_impl(&dword_235BE4000, v27, OS_LOG_TYPE_ERROR, "couldn't get predicate from string: %@", buf, 0xCu);
                      }
LABEL_33:
                      id v21 = 0;
                    }
                  }
                  else
                  {
                    id v21 = v18;
                  }
                  if (v21)
                  {
                    v22 = [v43 bundleIdentifier];
                    v23 = [v45 providerID];
                    LOBYTE(v34) = v43 == v42;
                    uint64_t v24 = +[FPUIManager createFPUIActionWithIdentifier:v9 uiActionProviderIdentifier:v22 fileProviderIdentifier:v23 displayName:v15 predicate:v21 displayInline:0 isNonUIAction:v34 fpProviderDomain:v45];

                    [v41 addObject:v24];
                    v25 = fpuiLogHandle;
                    if (!fpuiLogHandle)
                    {
                      FPUIInitLogging();
                      v25 = fpuiLogHandle;
                    }
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      id v62 = v9;
                      _os_log_error_impl(&dword_235BE4000, v25, OS_LOG_TYPE_ERROR, "Found action for %{public}@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v26 = fpuiLogHandle;
                    if (!fpuiLogHandle)
                    {
                      FPUIInitLogging();
                      v26 = fpuiLogHandle;
                    }
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      id v62 = v9;
                      _os_log_error_impl(&dword_235BE4000, v26, OS_LOG_TYPE_ERROR, "Invalid activation rule for %{public}@", buf, 0xCu);
                    }
                  }
                }
                ++v7;
              }
              while (v48 != v7);
              uint64_t v28 = [v44 countByEnumeratingWithState:&v50 objects:v60 count:16];
              uint64_t v48 = v28;
              if (!v28)
              {
LABEL_55:

                CFRelease(bundle);
                goto LABEL_64;
              }
            }
          }
          v30 = fpuiLogHandle;
          if (!fpuiLogHandle)
          {
            FPUIInitLogging();
            v30 = fpuiLogHandle;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = v30;
            v32 = [v43 URL];
            *(_DWORD *)buf = 138543618;
            id v62 = v45;
            __int16 v63 = 2112;
            v64 = v32;
            _os_log_error_impl(&dword_235BE4000, v31, OS_LOG_TYPE_ERROR, "No extension bundle found for domain: %{public}@ at url %@", buf, 0x16u);
          }
        }
        else
        {
          v29 = fpuiLogHandle;
          if (!fpuiLogHandle)
          {
            FPUIInitLogging();
            v29 = fpuiLogHandle;
          }
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v62 = v45;
            _os_log_error_impl(&dword_235BE4000, v29, OS_LOG_TYPE_ERROR, "No action plists found for domain: %{public}@", buf, 0xCu);
          }
        }
LABEL_64:
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    }
    while (v38);
  }

  return v41;
}

+ (BOOL)isAction:(id)a3 eligibleForItems:(id)a4
{
  id v17 = a1;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v18 = a4;
  v6 = [v5 predicate];
  if (v6)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v18;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) == 0 || [v11 isKnownByTheProvider])
          {
            CFStringRef v12 = objc_msgSend(v5, "fileProviderIdentifier", v17);
            uint64_t v13 = [v11 providerID];
            int v14 = [v12 isEqualToString:v13];

            if (v14) {
              continue;
            }
          }
          char v15 = 0;
          goto LABEL_15;
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v7 = [v17 extensionMatchingDictionaryForItems:v7 fpProviderDomain:0];
    char v15 = [v6 evaluateWithObject:v7];
LABEL_15:
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

+ (void)getExtensionRecordsForUseCase:(unint64_t)a3 uiExtensionRecord:(id *)a4 nonUIExtensionRecord:(id *)a5 forProviderDomain:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a6;
  BOOL v10 = [v9 providerID];
  int v11 = [v10 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];

  if (v11
    || ([v9 providerID],
        CFStringRef v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"],
        v12,
        v13))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x263F01858], "fpui_extensionRecordForIdentifier:useCase:isUIExtension:", @"com.apple.CloudDocs.MobileDocumentsFileProviderUI", a3, 1);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v14 = (void *)MEMORY[0x263F01858];
    char v15 = [v9 extensionBundleURL];
    BOOL v16 = objc_msgSend(v14, "fpui_extensionRecordForURL:useCase:isUIExtension:", v15, a3, 0);

    if (v16)
    {
      if (a5) {
        *a5 = v16;
      }
      id v17 = [v9 providerID];
      int v18 = [v17 isEqualToString:@"com.apple.SMBClientProvider.FileProvider"];

      if (v18)
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x263F01858], "fpui_extensionRecordForIdentifier:useCase:isUIExtension:", @"com.apple.FileProviderUI.ServerAuthUIExtension", a3, 1);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        long long v19 = objc_msgSend(v16, "fpui_containingApplicationRecord");
        if (v19)
        {
          v29 = v19;
          uint64_t v28 = a4;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id obj = [v19 applicationExtensionRecords];
          uint64_t v20 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v32;
            while (2)
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v32 != v22) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v24 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                v25 = objc_msgSend(v24, "fpui_extensionInfoForKey:ofClass:", @"NSExtensionPointIdentifier", objc_opt_class());
                if ([v25 isEqualToString:@"com.apple.fileprovider-actionsui"])
                {
                  uint64_t v26 = objc_msgSend(MEMORY[0x263F01858], "fpui_extensionRecordByFiltering:useCase:isUIExtension:", v24, a3, 1);
                  if (v26)
                  {
                    v27 = (void *)v26;
                    if (v28) {
                      *uint64_t v28 = v24;
                    }

                    goto LABEL_25;
                  }
                }
              }
              uint64_t v21 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
              if (v21) {
                continue;
              }
              break;
            }
          }
LABEL_25:

          long long v19 = v29;
        }
      }
    }
  }
}

+ (id)extensionMatchingDictionaryForItems:(id)a3 fpProviderDomain:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = (void *)MEMORY[0x237DF0850](v9);
        int v14 = FPExtensionMatchingDictionaryForItem();
        objc_msgSend(v7, "addObject:", v14, (void)v17);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v10 = v9;
    }
    while (v9);
  }

  char v15 = objc_opt_new();
  [v15 setObject:v7 forKey:@"fileproviderItems"];

  return v15;
}

+ (void)valueForKey:(uint64_t)a1 inActionPlist:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = objc_opt_class();
  _os_log_error_impl(&dword_235BE4000, v3, OS_LOG_TYPE_ERROR, "Invalid value for %{public}@ got %{public}@ expected string", (uint8_t *)&v4, 0x16u);
}

+ (void)actionsForProviderDomain:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_235BE4000, a2, OS_LOG_TYPE_DEBUG, "Getting actionsForProviderDomain: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)isAction:(os_log_t)log eligibleForItems:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_235BE4000, log, OS_LOG_TYPE_ERROR, "Predicate evaluation threw an exception. Predicate: %@, Exception: %@", (uint8_t *)&v3, 0x16u);
}

@end