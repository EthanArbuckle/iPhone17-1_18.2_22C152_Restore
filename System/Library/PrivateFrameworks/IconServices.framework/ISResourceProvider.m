@interface ISResourceProvider
+ (ISResourceProvider)resourceProviderWithRecord:(id)a3 options:(unint64_t)a4;
+ (ISResourceProvider)resourceProviderWithTypeIdentifier:(id)a3 options:(unint64_t)a4;
+ (id)defaultAppIconResourceProvider;
+ (id)resourceWithBundleURL:(id)a3 iconDictionary:(id)a4 options:(unint64_t)a5;
+ (id)resourceWithRecord:(id)a3 options:(unint64_t)a4;
+ (id)resourceWithTypeCode:(unsigned int)a3 options:(unint64_t)a4;
+ (id)resourceWithTypeIdentifier:(id)a3 options:(unint64_t)a4;
- (BOOL)_findBackgroundResourceWithIconDictionary:(id)a3 bundle:(id)a4;
- (BOOL)_findBadgeResourceWithIconDictionary:(id)a3 bundle:(id)a4 record:(id)a5;
- (BOOL)_findCustomRecipeWithIconDictionary:(id)a3 bundle:(id)a4;
- (BOOL)_findTextResourceWithIconDictionary:(id)a3;
- (BOOL)_isAppleResource;
- (BOOL)allowAlterationsToResourceArt;
- (BOOL)allowNonDefaultAppearances;
- (BOOL)isDocumentBadge;
- (BOOL)isGenericProvider;
- (BOOL)isPrecomposed;
- (BOOL)placeholder;
- (BOOL)resolved;
- (IFSymbol)symbol;
- (ISCompositorRecipe)suggestedRecipe;
- (ISCompositorResource)badgeResource;
- (ISCompositorResource)iconResource;
- (ISCompositorResource)templateIconResource;
- (ISCustomRecipe)customRecipe;
- (ISResourceProvider)init;
- (ISResourceProvider)initWithResource:(id)a3 templateResource:(id)a4;
- (ISResourceProvider)initWithResources:(id)a3;
- (NSArray)sourceRecordIdentifiers;
- (NSData)resourceToken;
- (NSData)validationToken;
- (NSDictionary)decorationResources;
- (NSMutableDictionary)resourcesByResourceKey;
- (NSUUID)lsDatabaseUUID;
- (id)resourceNamed:(id)a3;
- (unint64_t)lsDatabaseSequenceNumber;
- (unint64_t)options;
- (unint64_t)platform;
- (unint64_t)resourceType;
- (void)configureProviderFromDescriptor:(id)a3;
- (void)resolveIconResource;
- (void)setAllowAlterationsToResourceArt:(BOOL)a3;
- (void)setAllowNonDefaultAppearances:(BOOL)a3;
- (void)setBadgeResource:(id)a3;
- (void)setCustomRecipe:(id)a3;
- (void)setDecorationResources:(id)a3;
- (void)setIconResource:(id)a3;
- (void)setIsGenericProvider:(BOOL)a3;
- (void)setLsDatabaseSequenceNumber:(unint64_t)a3;
- (void)setLsDatabaseUUID:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setPlatform:(unint64_t)a3;
- (void)setPlatformWithBundle:(id)a3;
- (void)setResolved:(BOOL)a3;
- (void)setResourceToken:(id)a3;
- (void)setResourceType:(unint64_t)a3;
- (void)setSourceRecordIdentifiers:(id)a3;
- (void)setSuggestedRecipe:(id)a3;
@end

@implementation ISResourceProvider

+ (ISResourceProvider)resourceProviderWithRecord:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[ISRecordResourceProvider alloc] initWithRecord:v5 options:a4];

  return (ISResourceProvider *)v6;
}

+ (ISResourceProvider)resourceProviderWithTypeIdentifier:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (ISResourceProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)ISResourceProvider;
  v2 = [(ISResourceProvider *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    resourcesByResourceKey = v2->_resourcesByResourceKey;
    v2->_resourcesByResourceKey = (NSMutableDictionary *)v3;

    v2->_resourceType = 0;
    v2->_isGenericProvider = 0;
    id v5 = +[ISPlatformInfo sharedInstance];
    v2->_platform = [v5 nativePlatform];

    *(_WORD *)&v2->_allowNonDefaultAppearances = 256;
  }
  return v2;
}

- (ISResourceProvider)initWithResource:(id)a3 templateResource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ISResourceProvider *)self init];
  v9 = v8;
  if (v8)
  {
    [(ISResourceProvider *)v8 setIconResource:v6];
    objc_storeStrong((id *)&v9->_templateIconResource, a4);
    resourceToken = v9->_resourceToken;
    v9->_resourceToken = 0;
  }
  return v9;
}

- (ISResourceProvider)initWithResources:(id)a3
{
  id v4 = a3;
  id v5 = [(ISResourceProvider *)self init];
  id v6 = v5;
  if (v5)
  {
    [(NSMutableDictionary *)v5->_resourcesByResourceKey addEntriesFromDictionary:v4];
    resourceToken = v6->_resourceToken;
    v6->_resourceToken = 0;
  }
  return v6;
}

- (void)setIconResource:(id)a3
{
}

- (ISCompositorResource)iconResource
{
  return (ISCompositorResource *)[(NSMutableDictionary *)self->_resourcesByResourceKey objectForKeyedSubscript:@"kISPrimaryResourceKey"];
}

- (void)setBadgeResource:(id)a3
{
}

- (ISCompositorResource)badgeResource
{
  return (ISCompositorResource *)[(NSMutableDictionary *)self->_resourcesByResourceKey objectForKeyedSubscript:@"kISBadgeResourceKey"];
}

- (id)resourceNamed:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_resourcesByResourceKey objectForKeyedSubscript:a3];
}

- (NSData)validationToken
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_resourceToken)
  {
    uint64_t v8 = 0;
    long long v6 = 0u;
    long long v7 = 0u;
    [(NSUUID *)self->_lsDatabaseUUID getUUIDBytes:&v6];
    *(void *)&long long v7 = self->_lsDatabaseSequenceNumber;
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithData:", self->_resourceToken);
    [v3 getUUIDBytes:(char *)&v7 + 8];
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v6 length:40];
  }
  else
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_is_validToken");
  }
  return (NSData *)v4;
}

- (IFSymbol)symbol
{
  return 0;
}

- (BOOL)_isAppleResource
{
  return 0;
}

- (BOOL)_findBadgeResourceWithIconDictionary:(id)a3 bundle:(id)a4 record:(id)a5
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v32[0] = @"UTTypeIconBadgeName";
  v32[1] = @"UTTypeGlyphName";
  v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = a3;
  v12 = [v10 arrayWithObjects:v32 count:2];
  v13 = objc_msgSend(v11, "_IF_stringForKeys:", v12);

  if (!v13)
  {
    LOBYTE(v17) = 0;
    if (!v9) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  v14 = [v8 assetCatalogURL];
  id v25 = 0;
  v15 = +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:platform:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:platform:error:", v14, v13, [v8 platform], &v25);
  id v16 = v25;

  LOBYTE(v17) = v15 != 0;
  if (v15)
  {
    v18 = [(ISResourceProvider *)self resourcesByResourceKey];
    [v18 setObject:v15 forKeyedSubscript:@"kISBadgeResourceKey"];
  }
  else
  {
    v18 = _ISDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v24 = [v8 bundleURL];
      *(_DWORD *)buf = 138412802;
      v27 = v24;
      __int16 v28 = 2112;
      v29 = v13;
      __int16 v30 = 2112;
      id v31 = v16;
      _os_log_debug_impl(&dword_1AE771000, v18, OS_LOG_TYPE_DEBUG, "Failed to find badge resource: %@ : %@ with error: %@", buf, 0x20u);
    }
  }

  if (v9)
  {
LABEL_9:
    if (!v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [[ISPersona alloc] initWithRecord:v9];
        BOOL v17 = [(ISPersona *)v19 isEnterprisePersona];
        if (v17)
        {
          v20 = [(ISPersona *)v19 resourceBadge];
          v21 = [(ISResourceProvider *)self resourcesByResourceKey];
          [v21 setObject:v20 forKeyedSubscript:@"kISBadgeResourceKey"];

          v22 = objc_opt_new();
          [(ISResourceProvider *)self setSuggestedRecipe:v22];
        }
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
  }
LABEL_15:

  return v17;
}

- (BOOL)_findBackgroundResourceWithIconDictionary:(id)a3 bundle:(id)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v25[0] = @"UTTypeIconBackgroundName";
  v25[1] = @"CFBundleIconBackgroundName";
  long long v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a3;
  id v9 = [v7 arrayWithObjects:v25 count:2];
  v10 = objc_msgSend(v8, "_IF_stringForKeys:", v9);

  if (v10)
  {
    id v11 = [v6 assetCatalogURL];
    id v18 = 0;
    v12 = +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:platform:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:platform:error:", v11, v10, [v6 platform], &v18);
    id v13 = v18;

    BOOL v14 = v12 != 0;
    if (v12)
    {
      v15 = [(ISResourceProvider *)self resourcesByResourceKey];
      [v15 setObject:v12 forKeyedSubscript:@"kISBackgroundResourceKey"];
    }
    else
    {
      v15 = _ISDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        BOOL v17 = [v6 bundleURL];
        *(_DWORD *)buf = 138412802;
        v20 = v17;
        __int16 v21 = 2112;
        v22 = v10;
        __int16 v23 = 2112;
        id v24 = v13;
        _os_log_debug_impl(&dword_1AE771000, v15, OS_LOG_TYPE_DEBUG, "Failed to find background resource: %@ : %@ with error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_findCustomRecipeWithIconDictionary:(id)a3 bundle:(id)a4
{
  return 0;
}

- (BOOL)_findTextResourceWithIconDictionary:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"UTTypeIconText";
  v11[1] = @"CFBundleIconText";
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v11 count:2];
  long long v7 = objc_msgSend(v5, "_IF_stringForKeys:", v6);

  if (v7)
  {
    id v8 = [v7 uppercaseString];
    id v9 = [(ISResourceProvider *)self resourcesByResourceKey];
    [v9 setObject:v8 forKeyedSubscript:@"kISTextResourceKey"];
  }
  return v7 != 0;
}

- (void)setPlatformWithBundle:(id)a3
{
  id v5 = a3;
  if ([v5 platform])
  {
    -[ISResourceProvider setPlatform:](self, "setPlatform:", [v5 platform]);
  }
  else
  {
    id v4 = +[ISPlatformInfo sharedInstance];
    -[ISResourceProvider setPlatform:](self, "setPlatform:", [v4 nativePlatform]);
  }
}

- (void)configureProviderFromDescriptor:(id)a3
{
  id v6 = a3;
  [(ISResourceProvider *)self resolveIconResource];
  id v4 = [(ISResourceProvider *)self iconResource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v6 layoutDirection] == 4 && -[ISResourceProvider _isAppleResource](self, "_isAppleResource")) {
      [v5 setLayoutDirection:4];
    }
    if ([(ISResourceProvider *)self allowNonDefaultAppearances]) {
      objc_msgSend(v5, "setAppearance:", objc_msgSend(v6, "appearance"));
    }
  }
}

- (void)resolveIconResource
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ISResourceProvider *)self iconResource];

  if (!v3)
  {
    id v4 = _ISDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = self;
      _os_log_impl(&dword_1AE771000, v4, OS_LOG_TYPE_INFO, "Failed to resolve an icon resource for %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (unint64_t)lsDatabaseSequenceNumber
{
  return self->_lsDatabaseSequenceNumber;
}

- (void)setLsDatabaseSequenceNumber:(unint64_t)a3
{
  self->_lsDatabaseSequenceNumber = a3;
}

- (NSUUID)lsDatabaseUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLsDatabaseUUID:(id)a3
{
}

- (NSData)resourceToken
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResourceToken:(id)a3
{
}

- (NSArray)sourceRecordIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSourceRecordIdentifiers:(id)a3
{
}

- (ISCompositorResource)templateIconResource
{
  return (ISCompositorResource *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)decorationResources
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDecorationResources:(id)a3
{
}

- (BOOL)isGenericProvider
{
  return self->_isGenericProvider;
}

- (void)setIsGenericProvider:(BOOL)a3
{
  self->_isGenericProvider = a3;
}

- (BOOL)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (ISCompositorRecipe)suggestedRecipe
{
  return (ISCompositorRecipe *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSuggestedRecipe:(id)a3
{
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(unint64_t)a3
{
  self->_platform = a3;
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(unint64_t)a3
{
  self->_resourceType = a3;
}

- (BOOL)allowNonDefaultAppearances
{
  return self->_allowNonDefaultAppearances;
}

- (void)setAllowNonDefaultAppearances:(BOOL)a3
{
  self->_allowNonDefaultAppearances = a3;
}

- (BOOL)allowAlterationsToResourceArt
{
  return self->_allowAlterationsToResourceArt;
}

- (void)setAllowAlterationsToResourceArt:(BOOL)a3
{
  self->_allowAlterationsToResourceArt = a3;
}

- (NSMutableDictionary)resourcesByResourceKey
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (ISCustomRecipe)customRecipe
{
  return (ISCustomRecipe *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCustomRecipe:(id)a3
{
}

- (BOOL)resolved
{
  return self->_resolved;
}

- (void)setResolved:(BOOL)a3
{
  self->_resolved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customRecipe, 0);
  objc_storeStrong((id *)&self->_resourcesByResourceKey, 0);
  objc_storeStrong((id *)&self->_suggestedRecipe, 0);
  objc_storeStrong((id *)&self->_decorationResources, 0);
  objc_storeStrong((id *)&self->_templateIconResource, 0);
  objc_storeStrong((id *)&self->_sourceRecordIdentifiers, 0);
  objc_storeStrong((id *)&self->_resourceToken, 0);
  objc_storeStrong((id *)&self->_lsDatabaseUUID, 0);
}

+ (id)resourceWithRecord:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  if (!v5 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    id v9 = 0;
    goto LABEL_17;
  }
  id v6 = [v5 iconDictionary];
  if ([v6 count])
  {
    if (a4 & 1) != 0 && (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [v5 declaringBundleRecord];
      id v8 = [v7 URL];
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v10 = [v5 iconResourceBundleURL];
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          id v8 = 0;
          goto LABEL_15;
        }
        uint64_t v10 = [v5 URL];
      }
      id v8 = (void *)v10;
    }
LABEL_15:
    id v9 = +[ISResourceProvider resourceWithBundleURL:v8 iconDictionary:v6 options:a4];

    goto LABEL_16;
  }
  id v9 = 0;
LABEL_16:

LABEL_17:
  return v9;
}

+ (id)resourceWithBundleURL:(id)a3 iconDictionary:(id)a4 options:(unint64_t)a5
{
  v58[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(v8, "_IF_dictionaryForKey:", 0x1F063A070);
  if (v9)
  {
    uint64_t v10 = +[ISGraphicSymbolResource graphicSymbolResourceWithRecipe:v9 url:v7];
    if (v10)
    {
      id v11 = (void *)v10;
      v12 = 0;
LABEL_56:

      goto LABEL_57;
    }
  }
  v58[0] = @"CFBundleIconName";
  v58[1] = @"UTTypeIconName";
  v58[2] = @"UTTypeGlyphName";
  v58[3] = @"CFBundleGlyphName";
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
  BOOL v14 = objc_msgSend(v8, "_IF_stringForKeys:", v13);

  if (v14)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C0]) initWithURL:v7];
    v15 = [v12 assetCatalogURL];
    uint64_t v49 = 0;
    id v11 = +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:platform:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:platform:error:", v15, v14, [v12 platform], &v49);

    if (v11)
    {
      [v11 isPrecomposed];

      goto LABEL_56;
    }
  }
  else
  {
    v12 = 0;
  }
  v57[0] = @"CFBundleIconFile";
  v57[1] = @"UTTypeIconFile";
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  BOOL v17 = objc_msgSend(v8, "_IF_stringForKeys:", v16);

  if (v17
    && ([v17 pathExtension],
        id v18 = objc_claimAutoreleasedReturnValue(),
        char v19 = [v18 isEqualToString:@"icns"],
        v18,
        (v19 & 1) == 0))
  {
    unint64_t v47 = a5;
    if (!v12) {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C0]) initWithURL:v7];
    }
    v27 = [v12 assetCatalogURL];
    id v48 = 0;
    id v11 = +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:platform:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:platform:error:", v27, v17, [v12 platform], &v48);
    id v28 = v48;

    if (v11)
    {
      [v11 isPrecomposed];
    }
    else
    {
      v44 = _ISDefaultLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v52 = v7;
        __int16 v53 = 2112;
        id v54 = v17;
        __int16 v55 = 2112;
        unint64_t v56 = (unint64_t)v28;
        _os_log_debug_impl(&dword_1AE771000, v44, OS_LOG_TYPE_DEBUG, "Failed to find resource: %@ : %@ with error: %@", buf, 0x20u);
      }
    }
    a5 = v47;
    if (v11) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  v50[0] = @"CFBundleIconFile";
  v50[1] = @"UTTypeIconFile";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  __int16 v21 = objc_msgSend(v8, "_IF_stringForKeys:", v20);

  if (!v21) {
    goto LABEL_14;
  }
  v22 = [v21 pathExtension];
  uint64_t v23 = [v22 length];

  if (v23) {
    goto LABEL_14;
  }
  if (!v12) {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C0]) initWithURL:v7];
  }
  uint64_t v30 = [v12 URLForResource:v21 withExtension:@"pdf"];
  if (v30)
  {
    id v31 = (void *)v30;
    unint64_t v32 = a5;
    v33 = (void *)[objc_alloc(MEMORY[0x1E4F6F1F8]) initWithURL:v30];
    id v11 = [v33 firstPage];

    a5 = v32;
    if (v11) {
      goto LABEL_56;
    }
  }
  else
  {
LABEL_14:
  }
  id v24 = objc_msgSend(v8, "_IF_arrayForKey:", @"CFBundleIconFiles");
  if (![v24 count])
  {
    uint64_t v29 = objc_msgSend(v8, "_IF_arrayForKey:", @"UTTypeIconFiles");

    id v24 = (void *)v29;
    if (v12) {
      goto LABEL_17;
    }
LABEL_30:
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C0]) initWithURL:v7];
    goto LABEL_17;
  }
  if (!v12) {
    goto LABEL_30;
  }
LABEL_17:
  if ([v24 count] && v12)
  {
    id v11 = [MEMORY[0x1E4F6F1F0] imageBagWithResourcesNames:v24 fromBundle:v12];

    if (v11) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  uint64_t v25 = objc_msgSend(v8, "_IF_stringForKey:", @"CFBundleIconFile");
  v26 = (void *)v25;
  if (v12)
  {
    if (!v25) {
      goto LABEL_38;
    }
  }
  else
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C0]) initWithURL:v7];
    if (!v26) {
      goto LABEL_38;
    }
  }
  v34 = [v26 stringByDeletingPathExtension];
  id v11 = [MEMORY[0x1E4F6F1F0] imageBagWithResourcesNamed:v34 fromBundle:v12];

  if (v11) {
    goto LABEL_56;
  }
LABEL_38:
  unint64_t v35 = a5;
  v36 = objc_msgSend(v8, "_IF_stringForKey:", @"CFBundleIconFile");
  if (!v12) {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C0]) initWithURL:v7];
  }
  v37 = [v36 stringByDeletingPathExtension];
  v38 = [v36 pathExtension];
  v39 = v38;
  if (v37
    && [v38 length]
    && ([v12 URLForResource:v37 withExtension:v39], (uint64_t v40 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v41 = (void *)v40;
    id v11 = [MEMORY[0x1E4F6F1E8] imageWithContentsOfURL:v40];
  }
  else
  {
    id v11 = 0;
  }

  if (v11) {
    goto LABEL_56;
  }
  if (!v12) {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C0]) initWithURL:v7];
  }
  v42 = (void *)MEMORY[0x1E4F6F1F0];
  v43 = legacyResourceNames();
  id v11 = [v42 imageBagWithResourcesNames:v43 fromBundle:v12];

  if (!v11)
  {
    id v9 = _ISDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v46 = [v7 path];
      *(_DWORD *)buf = 138412802;
      id v52 = v46;
      __int16 v53 = 2112;
      id v54 = v8;
      __int16 v55 = 2048;
      unint64_t v56 = v35;
      _os_log_error_impl(&dword_1AE771000, v9, OS_LOG_TYPE_ERROR, "Failed to find resource for %@. IconDictionary: %@ - %lu", buf, 0x20u);
    }
    id v11 = 0;
    goto LABEL_56;
  }
LABEL_57:

  return v11;
}

+ (id)resourceWithTypeIdentifier:(id)a3 options:(unint64_t)a4
{
  return 0;
}

+ (id)resourceWithTypeCode:(unsigned int)a3 options:(unint64_t)a4
{
  return 0;
}

+ (id)defaultAppIconResourceProvider
{
  v2 = +[ISStaticResources sharedInstance];
  uint64_t v3 = [v2 genericAppIconResource];

  id v4 = [[ISResourceProvider alloc] initWithResource:v3 templateResource:0];
  [(ISResourceProvider *)v4 setResourceType:1];
  [(ISResourceProvider *)v4 setIsGenericProvider:1];
  [(ISResourceProvider *)v4 setAllowNonDefaultAppearances:1];
  [(ISResourceProvider *)v4 setAllowAlterationsToResourceArt:1];

  return v4;
}

- (BOOL)isPrecomposed
{
  v2 = [(ISResourceProvider *)self iconResource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [v2 isPrecomposed];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v3 = 0;
    }
    else
    {
      objc_opt_class();
      char v3 = objc_opt_isKindOfClass() ^ 1;
    }
  }

  return v3 & 1;
}

- (BOOL)isDocumentBadge
{
  return ([(ISResourceProvider *)self options] & 3) != 0;
}

@end