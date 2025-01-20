@interface CARThemeAssetOverrider
+ (BOOL)_shouldForceUpdateAsset;
+ (id)_assetURLForVersion:(id)a3;
+ (id)_carplayLibraryDirectoryForAssetIdentifier:(id)a3;
+ (id)_carplayLibraryURL;
+ (id)_generatedAssetForSourceAssetURL:(id)a3 version:(id)a4;
+ (id)_overrideAssetSourceURLForAssetIdentifier:(id)a3;
+ (id)_readVersionFromAsset:(id)a3 assetIdentifier:(id)a4;
+ (id)overrideAssetNewerThanAssetVersion:(id)a3;
+ (void)postAssetErrorNotification:(id)a3 forAsset:(id)a4;
@end

@implementation CARThemeAssetOverrider

+ (id)overrideAssetNewerThanAssetVersion:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [v4 iOSContentVersion];
  v7 = [v4 accessoryContentVersion];
  v8 = [a1 _overrideAssetSourceURLForAssetIdentifier:v5];
  if (v8)
  {
    v9 = [a1 _readVersionFromAsset:v8 assetIdentifier:v5];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 iOSContentVersion];
      v12 = [v10 accessoryContentVersion];
      if ([a1 _shouldForceUpdateAsset])
      {
        uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v6, "integerValue") + 1);

        uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") + 1);

        v15 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v27 = v13;
          __int16 v28 = 2114;
          uint64_t v29 = v14;
          _os_log_impl(&dword_1ABB00000, v15, OS_LOG_TYPE_DEFAULT, "force updating asset versions to: iOS %{public}@, accessory %{public}@", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v13 = (uint64_t)v11;
        uint64_t v14 = (uint64_t)v12;
      }
      v24 = (void *)v14;
      v25 = (void *)v13;
      v18 = [[CARThemeAssetVersion alloc] initWithIdentifier:v5 iOSContentVersion:v13 accessoryContentVersion:v14];
      uint64_t v19 = [v4 compare:v18];
      v20 = CarThemeAssetsLogging();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19 == -1)
      {
        if (v21)
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v27 = (uint64_t)v18;
          _os_log_impl(&dword_1ABB00000, v20, OS_LOG_TYPE_DEFAULT, "preparing override asset: %{public}@", buf, 0xCu);
        }

        v20 = [a1 _generatedAssetForSourceAssetURL:v8 version:v18];
        if (v20)
        {
          v17 = [[CARThemeAsset alloc] initWithBaseURL:v20 version:v18];
          v22 = CarThemeAssetsLogging();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v27 = (uint64_t)v17;
            _os_log_impl(&dword_1ABB00000, v22, OS_LOG_TYPE_DEFAULT, "prepared override asset %@", buf, 0xCu);
          }
        }
        else
        {
          v22 = [[NSString alloc] initWithFormat:@"failed to prepare override asset"];
          [a1 postAssetErrorNotification:v22 forAsset:v5];
          v17 = 0;
        }
      }
      else
      {
        if (v21)
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v27 = (uint64_t)v4;
          _os_log_impl(&dword_1ABB00000, v20, OS_LOG_TYPE_DEFAULT, "asset is already the latest overall version: %{public}@", buf, 0xCu);
        }
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v16 = (void *)[[NSString alloc] initWithFormat:@"no asset source for %@", v5];
    [a1 postAssetErrorNotification:v16 forAsset:v5];

    v17 = 0;
  }

  return v17;
}

+ (id)_overrideAssetSourceURLForAssetIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4 || ![v4 length])
  {
    id v14 = 0;
    goto LABEL_18;
  }
  v6 = [a1 _carplayLibraryDirectoryForAssetIdentifier:v5];
  v7 = [v6 URLByAppendingPathComponent:@"CarPlayAccessory.assets.zip"];
  v8 = [v6 URLByAppendingPathComponent:@"CarPlayAccessory.assets"];
  if (v7
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v7 path],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v9 fileExistsAtPath:v10 isDirectory:0],
        v10,
        v9,
        v11))
  {
    v12 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      BOOL v21 = v7;
      uint64_t v13 = "using override zipped asset %@";
LABEL_12:
      _os_log_impl(&dword_1ABB00000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    if (!v8
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          v15 = objc_claimAutoreleasedReturnValue(),
          [v8 path],
          v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v15 fileExistsAtPath:v16 isDirectory:0],
          v16,
          v15,
          !v17))
    {
      v18 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[CARThemeAssetOverrider _overrideAssetSourceURLForAssetIdentifier:]();
      }

      id v14 = 0;
      goto LABEL_17;
    }
    v12 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      BOOL v21 = v8;
      uint64_t v13 = "using override asset folder %@";
      goto LABEL_12;
    }
  }

  id v14 = v6;
LABEL_17:

LABEL_18:
  return v14;
}

+ (id)_generatedAssetForSourceAssetURL:(id)a3 version:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 _assetURLForVersion:a4];
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v8 removeItemAtURL:v7 error:0];

  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10 = [v7 path];
  id v51 = 0;
  char v11 = [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v51];
  id v12 = v51;

  if (v11)
  {
    uint64_t v13 = [v6 URLByAppendingPathComponent:@"CarPlayAccessory.assets.zip"];
    id v14 = [v7 URLByAppendingPathComponent:@"CarPlayAccessory.assets.zip"];
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    v16 = [v13 path];
    int v17 = [v15 fileExistsAtPath:v16];

    if (v17)
    {
      v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v50 = 0;
      v42 = v13;
      char v19 = [v18 copyItemAtURL:v13 toURL:v14 error:&v50];
      int v20 = (CARZipArchiver *)v50;

      v40 = v14;
      id v41 = v12;
      v44 = v7;
      if ((v19 & 1) == 0)
      {
        v23 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v38 = [v42 path];
          v39 = [v14 path];
          *(_DWORD *)buf = 138412802;
          v55 = v38;
          __int16 v56 = 2112;
          v57 = v39;
          __int16 v58 = 2112;
          v59 = v20;
          _os_log_error_impl(&dword_1ABB00000, v23, OS_LOG_TYPE_ERROR, "failed to copy %@ to %@: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      BOOL v21 = [v6 URLByAppendingPathComponent:@"CarPlayAccessory.assets"];

      int v20 = objc_alloc_init(CARZipArchiver);
      if (![(CARZipArchiver *)v20 archiveDirectory:v21 toLocation:v14])
      {
        v36 = CarThemeAssetsLogging();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          +[CARThemeAssetOverrider _generatedAssetForSourceAssetURL:version:](v14, v36);
        }

        id v22 = 0;
        goto LABEL_28;
      }
      v40 = v14;
      id v41 = v12;
      v44 = v7;
      v42 = v21;
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v52[0] = @"CarPlayPhone.assets";
    v52[1] = @"Certificate.chain.pem";
    v52[2] = @"CarPlayAccessory.assets.sha256";
    v52[3] = @"AccessoryAdditions";
    id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:4];
    uint64_t v24 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v47 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          id v29 = v6;
          uint64_t v30 = [v6 URLByAppendingPathComponent:v28];
          v31 = [v44 URLByAppendingPathComponent:v28];
          v32 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v45 = 0;
          char v33 = [v32 copyItemAtURL:v30 toURL:v31 error:&v45];
          v34 = (CARZipArchiver *)v45;

          if ((v33 & 1) == 0)
          {
            v35 = CarThemeAssetsLogging();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v55 = v30;
              __int16 v56 = 2112;
              v57 = v31;
              __int16 v58 = 2112;
              v59 = v34;
              _os_log_error_impl(&dword_1ABB00000, v35, OS_LOG_TYPE_ERROR, "failed to copy %@ to %@, error: %@", buf, 0x20u);
            }
          }
          id v6 = v29;
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
      }
      while (v25);
    }

    v7 = v44;
    id v22 = v44;
    id v12 = v41;
    BOOL v21 = v42;
    id v14 = v40;
LABEL_28:

    goto LABEL_29;
  }
  BOOL v21 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    +[CARThemeAssetOverrider _generatedAssetForSourceAssetURL:version:](v7, (uint64_t)v12, v21);
  }
  id v22 = 0;
LABEL_29:

  return v22;
}

+ (BOOL)_shouldForceUpdateAsset
{
  CFBooleanRef v2 = (const __CFBoolean *)CFPreferencesCopyValue(@"AlwaysUpdateAsset", CRPreferencesNotMigratedDomain, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
  CFRelease(v3);
  return v5;
}

+ (id)_carplayLibraryURL
{
  CFBooleanRef v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  CFBooleanRef v3 = [v2 URLsForDirectory:5 inDomains:1];
  CFTypeID v4 = [v3 firstObject];

  BOOL v5 = [v4 URLByAppendingPathComponent:@"CarPlay" isDirectory:1];

  return v5;
}

+ (id)_carplayLibraryDirectoryForAssetIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 _carplayLibraryURL];
  id v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:1];
  v7 = [v6 URLByStandardizingPath];

  v8 = [v7 path];
  v9 = [v5 path];
  char v10 = [v8 hasPrefix:v9];

  if (v10)
  {
    id v11 = v7;
  }
  else
  {
    id v12 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[CARThemeAssetOverrider _carplayLibraryDirectoryForAssetIdentifier:]();
    }

    id v11 = 0;
  }

  return v11;
}

+ (id)_assetURLForVersion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 _carplayLibraryURL];
  id v6 = [v5 URLByAppendingPathComponent:@"CarPlayApp" isDirectory:1];
  v7 = [v4 identifier];
  v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:1];

  v9 = [v4 iOSContentVersion];
  char v10 = [v9 stringByReplacingOccurrencesOfString:@"." withString:@"_"];

  id v11 = NSString;
  id v12 = [v4 accessoryContentVersion];

  uint64_t v13 = [v11 stringWithFormat:@"Asset-%@-%lu", v10, objc_msgSend(v12, "unsignedIntegerValue")];

  id v14 = [v8 URLByAppendingPathComponent:v13 isDirectory:1];

  return v14;
}

+ (id)_readVersionFromAsset:(id)a3 assetIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 URLByAppendingPathComponent:@"Info.plist"];
  id v24 = 0;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v7 error:&v24];
  id v9 = v24;
  char v10 = v9;
  if (v8)
  {
    id v11 = v7;
    id v12 = v9;
    goto LABEL_6;
  }
  uint64_t v13 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    +[CARThemeAssetOverrider _readVersionFromAsset:assetIdentifier:]();
  }

  id v14 = [v5 URLByAppendingPathComponent:@"CarPlayPhone.assets" isDirectory:1];
  id v11 = [v14 URLByAppendingPathComponent:@"Info.plist"];

  id v23 = v10;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v11 error:&v23];
  id v12 = v23;

  if (v8)
  {
LABEL_6:
    objc_opt_class();
    id v15 = [v8 objectForKey:@"iOSContentVersion"];
    if (v15 && (objc_opt_isKindOfClass() & 1) != 0) {
      v16 = (__CFString *)v15;
    }
    else {
      v16 = 0;
    }

    objc_opt_class();
    id v17 = [v8 objectForKey:@"AccessoryContentVersion"];
    if (v17 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    if (!v16) {
      v16 = @"0";
    }
    if (!v18)
    {
      int v20 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[CARThemeAssetOverrider _readVersionFromAsset:assetIdentifier:](v20);
      }

      id v18 = [v8 objectForKey:*MEMORY[0x1E4F1D020]];
      if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        char v19 = 0;
        goto LABEL_26;
      }
      uint64_t v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "integerValue"));

      if (v21) {
        id v18 = (id)v21;
      }
      else {
        id v18 = &unk_1F0318128;
      }
    }
    char v19 = [[CARThemeAssetVersion alloc] initWithIdentifier:v6 iOSContentVersion:v16 accessoryContentVersion:v18];
LABEL_26:

    goto LABEL_27;
  }
  v8 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[CARThemeAssetOverrider _readVersionFromAsset:assetIdentifier:]();
  }
  char v19 = 0;
LABEL_27:

  return v19;
}

+ (void)postAssetErrorNotification:(id)a3 forAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    +[CARThemeAssetOverrider postAssetErrorNotification:forAsset:]();
  }

  if (CRIsInternalInstall())
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v8 setDateFormat:@"dd/MM HH:mm:ss"];
    id v9 = [NSString alloc];
    char v10 = [MEMORY[0x1E4F1C9C8] date];
    id v11 = [v8 stringFromDate:v10];
    id v12 = (void *)[v9 initWithFormat:@"🚨🚙 Asset Discovery ERROR: %@", v11];

    id v13 = [NSString alloc];
    if (v6) {
      id v14 = (void *)[v13 initWithFormat:@"CDS Asset Identifier:\n%@ \nError:\n%@ ", v6, v5];
    }
    else {
      id v14 = (void *)[v13 initWithFormat:@"CDS Asset Identifier is MISSING!\nError:\n%@", v5, v16];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__CARThemeAssetOverrider_postAssetErrorNotification_forAsset___block_invoke;
    v17[3] = &unk_1E5E3A938;
    id v18 = v14;
    id v15 = v14;
    CRPostBannerToPhone(v12, v15, v17);
  }
}

void __62__CARThemeAssetOverrider_postAssetErrorNotification_forAsset___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  CFBooleanRef v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1ABB00000, v2, OS_LOG_TYPE_DEFAULT, "Posting Asset Error Message %@", (uint8_t *)&v4, 0xCu);
  }
}

+ (void)_overrideAssetSourceURLForAssetIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "No assets found in asset folder %@", v2, v3, v4, v5, v6);
}

+ (void)_generatedAssetForSourceAssetURL:(void *)a1 version:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 path];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "failed to create %@", v4, 0xCu);
}

+ (void)_generatedAssetForSourceAssetURL:(NSObject *)a3 version:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 path];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1ABB00000, a3, OS_LOG_TYPE_ERROR, "failed to create %@: %@", (uint8_t *)&v6, 0x16u);
}

+ (void)_carplayLibraryDirectoryForAssetIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "invalid asset identifier %@", v2, v3, v4, v5, v6);
}

+ (void)_readVersionFromAsset:assetIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_3(&dword_1ABB00000, v0, v1, "failed to read %@: %@");
}

+ (void)_readVersionFromAsset:(os_log_t)log assetIdentifier:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1ABB00000, log, OS_LOG_TYPE_ERROR, "asset doesn't have AccessoryContentVersion, using CFBundleVersion", v1, 2u);
}

+ (void)postAssetErrorNotification:forAsset:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

@end