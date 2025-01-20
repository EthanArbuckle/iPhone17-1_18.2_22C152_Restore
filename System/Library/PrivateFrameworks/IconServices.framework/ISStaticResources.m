@interface ISStaticResources
+ (id)sharedInstance;
- (ISStaticResources)init;
- (NSCache)cache;
- (NSDictionary)_fileResourcesAssetNameMaps;
- (id)_assetCatalogResourceWithName:(id)a3 fromURL:(id)a4 cacheKey:(id)a5;
- (id)_fileExtensionAndUTIToAssetNameMap;
- (id)_findStaticImageWithKey:(id)a3;
- (id)debugGenericAppIconResource;
- (id)defaultMacDarkFolderResource;
- (id)defaultMacDataResource;
- (id)defaultMacFolderResource;
- (id)defaultMacUnknownFSObjectResource;
- (id)fallbackResourceForHint:(id)a3 descriptor:(id)a4 referenceObj:(id)a5;
- (id)genericAppClipIconResource;
- (id)genericAppIconResource;
- (id)genericAppIconResourceForPlatform:(unint64_t)a3;
- (id)resourceForKnownFileTypesFromHint:(id)a3;
- (void)_addStaticImage:(id)a3 withKey:(id)a4;
- (void)genericAppClipIconResource;
- (void)setCache:(id)a3;
- (void)set_fileResourcesAssetNameMaps:(id)a3;
@end

@implementation ISStaticResources

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __35__ISStaticResources_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(ISStaticResources);
  return MEMORY[0x1F41817F8]();
}

- (ISStaticResources)init
{
  v6.receiver = self;
  v6.super_class = (Class)ISStaticResources;
  v2 = [(ISStaticResources *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v2->_cache;
    v2->_cache = v3;
  }
  return v2;
}

- (id)fallbackResourceForHint:(id)a3 descriptor:(id)a4 referenceObj:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 shape] == 5 || objc_msgSend(v9, "shape") == 6)
  {
    v11 = _ISDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ISStaticResources fallbackResourceForHint:descriptor:referenceObj:]();
    }

    id v12 = [(ISStaticResources *)self genericAppClipIconResource];
  }
  else
  {
    v15 = _ISDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[ISStaticResources fallbackResourceForHint:descriptor:referenceObj:]();
    }

    v16 = +[ISPlatformInfo sharedInstance];
    -[ISStaticResources genericAppIconResourceForPlatform:](self, "genericAppIconResourceForPlatform:", [v16 nativePlatform]);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v12;
      objc_msgSend(v12, "setAppearance:", objc_msgSend(v9, "appearance"));
    }
  }
  if (!v12)
  {
    v13 = _ISDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v17 = 138412802;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_fault_impl(&dword_1AE771000, v13, OS_LOG_TYPE_FAULT, "Failed to resolve a fallback resource. Hint: %@, Descriptor: %@, Icon: %@", (uint8_t *)&v17, 0x20u);
    }
  }
  return v12;
}

- (id)_assetCatalogResourceWithName:(id)a3 fromURL:(id)a4 cacheKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ISStaticResources *)self cache];
  id v12 = [v11 objectForKey:v10];

  if (!v12)
  {
    id v16 = 0;
    id v12 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v9 imageName:v8 error:&v16];
    id v13 = v16;
    if (v12)
    {
      v14 = [(ISStaticResources *)self cache];
      [v14 setObject:v12 forKey:v10];
    }
    else
    {
      v14 = _ISDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ISStaticResources _assetCatalogResourceWithName:fromURL:cacheKey:]((uint64_t)v10, v13, v14);
      }
    }
  }
  return v12;
}

- (void)_addStaticImage:(id)a3 withKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ISStaticResources *)self cache];
  [v8 setObject:v7 forKey:v6];
}

- (id)_findStaticImageWithKey:(id)a3
{
  id v4 = a3;
  v5 = [(ISStaticResources *)self cache];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)genericAppIconResource
{
  v3 = +[ISPlatformInfo sharedInstance];
  id v4 = -[ISStaticResources genericAppIconResourceForPlatform:](self, "genericAppIconResourceForPlatform:", [v3 nativePlatform]);

  return v4;
}

- (id)genericAppIconResourceForPlatform:(unint64_t)a3
{
  int64_t v3 = a3;
  if (!a3)
  {
    v5 = +[ISPlatformInfo sharedInstance];
    int64_t v3 = [v5 nativePlatform];
  }
  if (v3 <= 7)
  {
    if ((unint64_t)(v3 - 1) < 2)
    {
      id v6 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
      id v7 = [v6 assetCatalogURL];

      id v8 = @"com.apple.application-bundle";
LABEL_10:
      id v10 = [(ISStaticResources *)self _assetCatalogResourceWithName:v8 fromURL:v7 cacheKey:v8];

      goto LABEL_18;
    }
    if (v3 != 4) {
      goto LABEL_12;
    }
LABEL_9:
    id v9 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
    id v7 = [v9 assetCatalogURL];

    id v8 = @"GenericAppIcon_iOS";
    goto LABEL_10;
  }
  switch(v3)
  {
    case 8:
      id v12 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
      id v13 = (void *)MEMORY[0x1E4F6F1F0];
      v14 = @"NanoDefaultIcon";
LABEL_17:
      id v10 = [v13 imageBagWithResourcesNamed:v14 fromBundle:v12];

      goto LABEL_18;
    case 16:
      id v12 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
      id v13 = (void *)MEMORY[0x1E4F6F1F0];
      v14 = @"VisionDefaultIcon";
      goto LABEL_17;
    case 32:
      goto LABEL_9;
  }
LABEL_12:
  v11 = _ISDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[ISStaticResources genericAppIconResourceForPlatform:](v3, v11);
  }

  id v10 = 0;
LABEL_18:
  return v10;
}

- (id)genericAppClipIconResource
{
  v2 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
  int64_t v3 = [MEMORY[0x1E4F6F1F0] imageBagWithResourcesNamed:@"AppClipDefaultIcon" fromBundle:v2];
  if (!v3)
  {
    id v4 = _ISDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ISStaticResources genericAppClipIconResource](v4);
    }
  }
  return v3;
}

- (id)debugGenericAppIconResource
{
  int64_t v3 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
  id v4 = [v3 assetCatalogURL];

  v5 = [(ISStaticResources *)self _assetCatalogResourceWithName:@"DebugGenericAppIcon" fromURL:v4 cacheKey:@"DebugGenericAppIcon"];

  return v5;
}

- (id)defaultMacFolderResource
{
  int64_t v3 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  id v4 = [v3 assetCatalogURL];

  v5 = [(ISStaticResources *)self _assetCatalogResourceWithName:@"Folder" fromURL:v4 cacheKey:@"defaultMacFolder"];

  return v5;
}

- (id)defaultMacDarkFolderResource
{
  int64_t v3 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  id v4 = [v3 assetCatalogURL];

  v5 = [(ISStaticResources *)self _assetCatalogResourceWithName:@"FolderDark" fromURL:v4 cacheKey:@"defaultMacDarkFolder"];

  return v5;
}

- (id)defaultMacDataResource
{
  int64_t v3 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
  id v4 = [v3 assetCatalogURL];

  v5 = [(ISStaticResources *)self _assetCatalogResourceWithName:@"public.data" fromURL:v4 cacheKey:@"defaultMacData"];

  return v5;
}

- (id)defaultMacUnknownFSObjectResource
{
  return 0;
}

- (id)_fileExtensionAndUTIToAssetNameMap
{
  int64_t v3 = [(ISStaticResources *)self cache];
  id v4 = [v3 objectForKey:@"StaticAssetNameMaps"];

  if (!v4)
  {
    v5 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
    id v6 = [v5 URLForResource:@"StaticAssetsInfo" withExtension:@"plist"];

    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v6];
    if (v4)
    {
      id v7 = [(ISStaticResources *)self cache];
      [v7 setObject:v4 forKey:@"StaticAssetNameMaps"];
    }
  }
  return v4;
}

- (id)resourceForKnownFileTypesFromHint:(id)a3
{
  id v4 = a3;
  v5 = [(ISStaticResources *)self _fileExtensionAndUTIToAssetNameMap];
  id v6 = [v5 objectForKey:@"ExtensionToUTI"];
  id v7 = [v6 objectForKey:v4];

  if (!v7) {
    id v7 = v4;
  }
  id v8 = [(ISStaticResources *)self _fileExtensionAndUTIToAssetNameMap];
  id v9 = [v8 objectForKey:@"UTIToAssetName"];
  id v10 = [v9 objectForKey:v7];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
    id v12 = [v11 assetCatalogURL];

    id v13 = [(ISStaticResources *)self _assetCatalogResourceWithName:v10 fromURL:v12 cacheKey:v10];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (NSCache)cache
{
  return (NSCache *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCache:(id)a3
{
}

- (NSDictionary)_fileResourcesAssetNameMaps
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_fileResourcesAssetNameMaps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__fileResourcesAssetNameMaps, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)fallbackResourceForHint:descriptor:referenceObj:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1AE771000, v0, v1, "%@ RETURNING AppClip PLACEHOLDER: %@");
}

- (void)fallbackResourceForHint:descriptor:referenceObj:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1AE771000, v0, v1, "%@ RETURNING App PLACEHOLDER: %@");
}

- (void)_assetCatalogResourceWithName:(uint64_t)a1 fromURL:(void *)a2 cacheKey:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1AE771000, a3, OS_LOG_TYPE_ERROR, "Failed to retrieve %@ resource. Error: %@", (uint8_t *)&v6, 0x16u);
}

- (void)genericAppIconResourceForPlatform:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE771000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve default app icon resource for platform: %lu", (uint8_t *)&v2, 0xCu);
}

- (void)genericAppClipIconResource
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1AE771000, log, OS_LOG_TYPE_ERROR, "Failed to retrieve default app clip icon assets", v1, 2u);
}

@end