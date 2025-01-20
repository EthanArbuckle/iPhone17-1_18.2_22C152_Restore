@interface FPItemDecoration
+ (id)_decorationCache;
+ (id)_fetchFromCacheWithIdentifier:(id)a3 bundleIdentifier:(id)a4;
+ (id)_loadDecorationsFromPlist:(id)a3 bundleIdentifier:(id)a4 bundle:(__CFBundle *)a5;
+ (id)decorationWithIdentifier:(id)a3 bundleIdentifier:(id)a4;
+ (id)infoForItem:(id)a3 parentInfo:(id)a4;
+ (void)_invalidateCache;
+ (void)_loadBuiltinDecorationTypes;
+ (void)fetchInfoForItem:(id)a3 completionHandler:(id)a4;
+ (void)initialize;
- (BOOL)requiresFetchingInfoFirst;
- (FPItemDecoration)initWithPlistEntry:(id)a3 bundle:(__CFBundle *)a4 bundleIdentifier:(id)a5;
- (NSString)bundleIdentifier;
- (NSString)decorationIdentifier;
- (NSString)imageType;
- (NSString)type;
- (id)description;
- (id)labelWithInfo:(id)a3 error:(id *)a4;
- (id)labelWithInfo:(id)a3 error:(id *)a4 style:(unint64_t)a5;
- (id)labelWithItem:(id)a3 error:(id *)a4;
- (id)labelWithItem:(id)a3 error:(id *)a4 style:(unint64_t)a5;
- (id)labelsWithInfo:(id)a3 error:(id *)a4;
- (id)labelsWithItem:(id)a3 error:(id *)a4;
- (id)parentDependingKeys;
- (id)styleDependingKeys;
- (void)folderStatusForItem:(id)a3 completionHandler:(id)a4;
@end

@implementation FPItemDecoration

void __30__FPItemDecoration_initialize__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadBuiltinDecorationTypes];
  id v2 = +[FPProviderDomainChangesReceiver sharedChangesReceiver];
  id v1 = (id)[v2 addChangesHandler:&__block_literal_global_31];
}

uint64_t __30__FPItemDecoration_initialize__block_invoke_2()
{
  return +[FPItemDecoration _invalidateCache];
}

+ (void)_invalidateCache
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = [v2 _decorationCache];
  v4 = [v3 allKeys];
  v5 = (void *)[v4 mutableCopy];

  v6 = [MEMORY[0x1E4F28B50] bundleForClass:v2];
  v7 = [v6 bundleIdentifier];

  [v5 removeObject:v7];
  v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_INFO, "[INFO] Invalidating decoration cache for %@", (uint8_t *)&v9, 0xCu);
  }

  [v3 removeObjectsForKeys:v5];
  objc_sync_exit(v2);

  +[FPItemCollection refreshActiveCollectionsForDecorationChange];
}

+ (void)_loadBuiltinDecorationTypes
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  CFURLRef v4 = [v3 bundleURL];
  CFBundleRef v5 = CFBundleCreate(0, v4);

  v6 = [v3 objectForInfoDictionaryKey:@"NSFileProviderDecorations"];
  v7 = [v3 bundleIdentifier];
  v8 = [a1 _loadDecorationsFromPlist:v6 bundleIdentifier:v7 bundle:v5];

  if (v8)
  {
    int v9 = [a1 _decorationCache];
    v10 = [v3 bundleIdentifier];
    [v9 setObject:v8 forKey:v10];
  }
  else
  {
    int v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to load built-in decorations", v11, 2u);
    }
  }

  CFRelease(v5);
}

+ (id)_decorationCache
{
  if (_decorationCache_once != -1) {
    dispatch_once(&_decorationCache_once, &__block_literal_global_8);
  }
  id v2 = (void *)_decorationCache_cache;

  return v2;
}

+ (id)_loadDecorationsFromPlist:(id)a3 bundleIdentifier:(id)a4 bundle:(__CFBundle *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__FPItemDecoration__loadDecorationsFromPlist_bundleIdentifier_bundle___block_invoke;
  v24[3] = &unk_1E5AF1EC0;
  id v8 = v7;
  id v25 = v8;
  v26 = a5;
  int v9 = objc_msgSend(a3, "fp_map:", v24);
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "decorationIdentifier", (void)v20);
        [v10 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v13);
  }

  v18 = (void *)[v10 copy];

  return v18;
}

- (NSString)decorationIdentifier
{
  return self->_decorationIdentifier;
}

FPItemDecoration *__70__FPItemDecoration__loadDecorationsFromPlist_bundleIdentifier_bundle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFURLRef v4 = [[FPItemDecoration alloc] initWithPlistEntry:v3 bundle:*(void *)(a1 + 40) bundleIdentifier:*(void *)(a1 + 32)];
  }
  else
  {
    CFBundleRef v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __70__FPItemDecoration__loadDecorationsFromPlist_bundleIdentifier_bundle___block_invoke_cold_1(a1, v5);
    }

    CFURLRef v4 = 0;
  }

  return v4;
}

- (FPItemDecoration)initWithPlistEntry:(id)a3 bundle:(__CFBundle *)a4 bundleIdentifier:(id)a5
{
  v44[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v35.receiver = self;
  v35.super_class = (Class)FPItemDecoration;
  v10 = [(FPItemDecoration *)&v35 init];
  id v11 = v10;
  if (!v10) {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v10->_bundleIdentifier, a5);
  uint64_t v12 = objc_opt_new();
  [v12 setCfBundle:a4];
  [v12 setTableNames:&unk_1EF6C3968];
  uint64_t v13 = [v8 objectForKey:@"Identifier"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FPItemDecoration initWithPlistEntry:bundle:bundleIdentifier:].cold.4();
    }
    goto LABEL_21;
  }
  decorationIdentifier = v11->_decorationIdentifier;
  v11->_decorationIdentifier = v13;

  uint64_t v13 = [v8 objectForKey:@"BadgeImageType"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v13)
  {
    v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FPItemDecoration initWithPlistEntry:bundle:bundleIdentifier:]();
    }
    goto LABEL_21;
  }
  imageType = v11->_imageType;
  v11->_imageType = v13;

  uint64_t v13 = [v8 objectForKey:@"Category"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FPItemDecoration initWithPlistEntry:bundle:bundleIdentifier:]();
    }
    goto LABEL_21;
  }
  type = v11->_type;
  v11->_type = v13;

  v44[0] = @"Badge";
  v44[1] = @"Sharing";
  v44[2] = @"FolderBadge";
  v44[3] = @"FolderStatus";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
  if (([(NSString *)v13 containsObject:v11->_type] & 1) == 0)
  {
    v15 = fp_current_or_default_log();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_21:

      v26 = 0;
      goto LABEL_22;
    }
    v27 = v11->_type;
    uint64_t v28 = [(NSString *)v13 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138413058;
    v37 = @"NSFileProviderDecorations";
    __int16 v38 = 2112;
    id v39 = v9;
    __int16 v40 = 2112;
    v41 = v27;
    __int16 v42 = 2112;
    v43 = v28;
    _os_log_error_impl(&dword_1A33AE000, v15, OS_LOG_TYPE_ERROR, "[ERROR] Malformed entry in %@ of bundle %@: type is %@. Valid types are (%@)", buf, 0x2Au);
LABEL_20:

    goto LABEL_21;
  }
  v15 = [v8 objectForKey:@"Label"];
  uint64_t v18 = +[FPStringFormat formatForPlistObject:v15 localizationLookup:v12];
  labelTitle = v11->_labelTitle;
  v11->_labelTitle = (FPStringFormat *)v18;

  if (!v11->_labelTitle)
  {
    uint64_t v28 = fp_current_or_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[FPItemDecoration initWithPlistEntry:bundle:bundleIdentifier:]((uint64_t)v9, v28);
    }
    goto LABEL_20;
  }
  long long v20 = [(FPItemDecoration *)v11 parentDependingKeys];
  long long v21 = [(FPItemDecoration *)v11 styleDependingKeys];
  long long v22 = [(FPStringFormat *)v11->_labelTitle keyPaths];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __63__FPItemDecoration_initWithPlistEntry_bundle_bundleIdentifier___block_invoke;
  v33[3] = &unk_1E5AF1EE8;
  id v34 = v20;
  id v30 = v20;
  long long v23 = objc_msgSend(v22, "fp_filter:", v33);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __63__FPItemDecoration_initWithPlistEntry_bundle_bundleIdentifier___block_invoke_2;
  v31[3] = &unk_1E5AF1EE8;
  id v32 = v21;
  id v24 = v21;
  id v25 = objc_msgSend(v22, "fp_filter:", v31);
  v11->_dependsOnParent = [v23 count] != 0;
  v11->_dependsOnStyle = v25 != 0;

LABEL_13:
  v26 = v11;
LABEL_22:

  return v26;
}

- (id)styleDependingKeys
{
  return &unk_1EF6C3998;
}

- (id)parentDependingKeys
{
  return &unk_1EF6C3980;
}

uint64_t __63__FPItemDecoration_initWithPlistEntry_bundle_bundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(v3, "containsString:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9))
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __63__FPItemDecoration_initWithPlistEntry_bundle_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(v3, "hasPrefix:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9))
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __36__FPItemDecoration__decorationCache__block_invoke()
{
  _decorationCache_cache = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__FPItemDecoration_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_once != -1) {
    dispatch_once(&initialize_once, block);
  }
}

+ (id)_fetchFromCacheWithIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  objc_sync_enter(v8);
  long long v9 = [v8 _decorationCache];
  long long v10 = [v9 objectForKey:v7];
  if (!v10)
  {
    long long v11 = [MEMORY[0x1E4F22458] pluginKitProxyForIdentifier:v7];
    long long v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 bundleURL];
      Unique = (__CFBundle *)_CFBundleCreateUnique();
    }
    else
    {
      Unique = 0;
    }
    ValueForInfoDictionaryKey = (void *)CFBundleGetValueForInfoDictionaryKey(Unique, @"NSExtension");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [ValueForInfoDictionaryKey objectForKey:@"NSFileProviderDecorations"];
    }
    else
    {
      v16 = 0;
    }
    long long v10 = (void *)MEMORY[0x1E4F1CC08];
    if (v12)
    {
      if (Unique)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v10 = [v8 _loadDecorationsFromPlist:v16 bundleIdentifier:v7 bundle:Unique];
        }
      }
    }
    [v9 setObject:v10 forKey:v7];
    if (Unique) {
      CFRelease(Unique);
    }
  }
  v17 = [v10 objectForKeyedSubscript:v6];

  objc_sync_exit(v8);

  return v17;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p: %@>", objc_opt_class(), self, self->_decorationIdentifier];
}

+ (id)decorationWithIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return +[FPItemDecoration _fetchFromCacheWithIdentifier:a3 bundleIdentifier:a4];
}

- (BOOL)requiresFetchingInfoFirst
{
  return self->_dependsOnParent;
}

- (id)labelWithItem:(id)a3 error:(id *)a4
{
  return [(FPItemDecoration *)self labelWithItem:a3 error:a4 style:0];
}

- (id)labelWithItem:(id)a3 error:(id *)a4 style:(unint64_t)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v16 = @"item";
  id v8 = +[_FPItemDecorationValueResolver resolverForItem:a3 style:a5];
  v17[0] = v8;
  long long v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

  if (self->_dependsOnParent)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v11 = [(FPItemDecoration *)self decorationIdentifier];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = NSStringFromSelector(sel_labelWithInfo_error_);
    [v10 handleFailureInMethod:a2, self, @"FPItemDecoration.m", 273, @"Label for decoration %@ depends on parent. %@ %@ should be called for folder status.", v11, v12, v13 object file lineNumber description];
  }
  uint64_t v14 = [(FPStringFormat *)self->_labelTitle evaluateWithValuesByName:v9 error:a4];

  return v14;
}

- (id)labelWithInfo:(id)a3 error:(id *)a4
{
  return [(FPItemDecoration *)self labelWithInfo:a3 error:a4 style:0];
}

- (id)labelWithInfo:(id)a3 error:(id *)a4 style:(unint64_t)a5
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 count])
  {
    long long v9 = [_FPItemDecorationFallbackLookup alloc];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __46__FPItemDecoration_labelWithInfo_error_style___block_invoke;
    v19[3] = &__block_descriptor_40_e16__16__0__FPItem_8l;
    v19[4] = a5;
    long long v10 = objc_msgSend(v8, "fp_map:", v19);
    long long v11 = [(_FPItemDecorationFallbackLookup *)v9 initWithItems:v10];

    v20[0] = @"item";
    uint64_t v12 = [v8 firstObject];
    uint64_t v13 = +[_FPItemDecorationValueResolver resolverForItem:v12 style:a5];
    v21[0] = v13;
    v20[1] = @"rootItem";
    uint64_t v14 = [v8 lastObject];
    v15 = +[_FPItemDecorationValueResolver resolverForItem:v14 style:a5];
    v20[2] = @"parentItem";
    v21[1] = v15;
    v21[2] = v11;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

    v17 = [(FPStringFormat *)self->_labelTitle evaluateWithValuesByName:v16 error:a4];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

id __46__FPItemDecoration_labelWithInfo_error_style___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[_FPItemDecorationValueResolver resolverForItem:a2 style:*(void *)(a1 + 32)];
}

- (id)labelsWithInfo:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  BOOL dependsOnStyle = self->_dependsOnStyle;
  long long v17 = 0u;
  long long v18 = 0u;
  if (dependsOnStyle) {
    long long v9 = &unk_1EF6C39C8;
  }
  else {
    long long v9 = &unk_1EF6C39B0;
  }
  long long v19 = 0uLL;
  long long v20 = 0uLL;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = -[FPItemDecoration labelWithInfo:error:style:](self, "labelWithInfo:error:style:", v6, a4, objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "unsignedIntegerValue", (void)v17));
        if (v14) {
          [v7 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
  if (objc_msgSend(v7, "count", (void)v17)) {
    id v15 = v7;
  }
  else {
    id v15 = 0;
  }

  return v15;
}

- (id)labelsWithItem:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  BOOL dependsOnStyle = self->_dependsOnStyle;
  long long v21 = 0u;
  long long v22 = 0u;
  if (dependsOnStyle) {
    long long v9 = &unk_1EF6C39F8;
  }
  else {
    long long v9 = &unk_1EF6C39E0;
  }
  long long v23 = 0uLL;
  long long v24 = 0uLL;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v20 = 0;
        id v15 = -[FPItemDecoration labelWithItem:error:style:](self, "labelWithItem:error:style:", v6, &v20, [v14 unsignedIntegerValue]);
        id v16 = v20;
        long long v17 = v16;
        if (v15)
        {
          [v7 addObject:v15];
        }
        else if (a4 && v16)
        {
          *a4 = v16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }
  if ([v7 count]) {
    id v18 = v7;
  }
  else {
    id v18 = 0;
  }

  return v18;
}

- (void)folderStatusForItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__FPItemDecoration_folderStatusForItem_completionHandler___block_invoke;
  v8[3] = &unk_1E5AF1F30;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  +[FPItemDecoration fetchInfoForItem:a3 completionHandler:v8];
}

void __58__FPItemDecoration_folderStatusForItem_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v8 = 0;
    id v6 = [v5 labelWithInfo:a2 error:&v8];
    id v7 = v8;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)fetchInfoForItem:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = +[FPItemManager defaultManager];
  id v7 = [v6 itemID];

  [v8 _fetchHierarchyForItemID:v7 recursively:1 completionHandler:v5];
}

+ (id)infoForItem:(id)a3 parentInfo:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"FPItemDecoration.m" lineNumber:365 description:@"parentInfo has wrong type"];
  }
  v13[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v10 = [v9 arrayByAddingObjectsFromArray:v8];

  return v10;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)imageType
{
  return self->_imageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_labelTitle, 0);

  objc_storeStrong((id *)&self->_decorationIdentifier, 0);
}

void __70__FPItemDecoration__loadDecorationsFromPlist_bundleIdentifier_bundle___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412546;
  id v4 = @"NSFileProviderDecorations";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Malformed entry in %@ entry of bundle %@", (uint8_t *)&v3, 0x16u);
}

- (void)initWithPlistEntry:(uint64_t)a1 bundle:(NSObject *)a2 bundleIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  int v3 = @"Label";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Malformed entry in %@ of bundle %@", (uint8_t *)&v2, 0x16u);
}

- (void)initWithPlistEntry:bundle:bundleIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_3_2();
  id v0 = (id)objc_opt_class();
  objc_opt_class();
  OUTLINED_FUNCTION_1_1();
  id v2 = OUTLINED_FUNCTION_0_3(v1);
  OUTLINED_FUNCTION_2_2(&dword_1A33AE000, v3, v4, "[ERROR] Malformed entry in %@ of bundle %@: object for key %@ should have class %@, but has %@", v5, v6, v7, v8, 2u);
}

- (void)initWithPlistEntry:bundle:bundleIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_3_2();
  id v0 = (id)objc_opt_class();
  objc_opt_class();
  OUTLINED_FUNCTION_1_1();
  id v2 = OUTLINED_FUNCTION_0_3(v1);
  OUTLINED_FUNCTION_2_2(&dword_1A33AE000, v3, v4, "[ERROR] Malformed entry in %@ of bundle %@: object for key %@ should have class %@, but has %@", v5, v6, v7, v8, 2u);
}

- (void)initWithPlistEntry:bundle:bundleIdentifier:.cold.4()
{
  OUTLINED_FUNCTION_3_2();
  id v0 = (id)objc_opt_class();
  objc_opt_class();
  OUTLINED_FUNCTION_1_1();
  id v2 = OUTLINED_FUNCTION_0_3(v1);
  OUTLINED_FUNCTION_2_2(&dword_1A33AE000, v3, v4, "[ERROR] Malformed entry in %@ of bundle %@: object for key %@ should have class %@, but has %@", v5, v6, v7, v8, 2u);
}

@end