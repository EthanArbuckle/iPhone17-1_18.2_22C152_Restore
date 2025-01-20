@interface ISDefaults
+ (id)sharedInstance;
- (BOOL)_enable1016Icons;
- (BOOL)_enableAppIconOverrides;
- (BOOL)_ignoreDocumentClaimIcons;
- (BOOL)allowDocumentClaimIcons;
- (BOOL)defaultToTemplatizedAppIcons;
- (BOOL)disableLegacyIconSegmentation;
- (BOOL)enableAppIconOverides;
- (BOOL)enableBadgeOverhang;
- (BOOL)enableInstanceIDBasedTwoAppModel;
- (BOOL)isDarkIconColorEnhancementEnabled;
- (BOOL)isDarkIconDimmingEnabled;
- (BOOL)isDarkIconDimmingForDedicatedAssetsEnabled;
- (BOOL)isDarkIconSegmentationEnabled;
- (BOOL)isDebugGraphicIconColourEnabled;
- (BOOL)isFlagDimmedDedicatedAssetsEnabled;
- (BOOL)isUnsupportedDecorationDisabled;
- (BOOL)logMissingURLCacheProperties;
- (BOOL)preferSymbolAsTemplateVariant;
- (BOOL)simulateTintableAppearance;
- (BOOL)usePerstentCache;
- (ISDefaults)init;
- (NSNumber)_usePerstentCache;
- (NSString)cacheSaltString;
- (NSString)serviceName;
- (NSURL)_cacheURL;
- (NSURL)cacheURL;
- (double)prepareImageDelay;
- (id)debugGraphicIconColor;
- (id)debugISIconGraphicIconColor;
- (id)debugPreDefinedGraphicIconColor;
- (id)tintColor;
- (int64_t)forceApperance;
- (os_unfair_lock_s)lock;
- (void)cacheURL;
- (void)set_cacheURL:(id)a3;
- (void)set_usePerstentCache:(id)a3;
@end

@implementation ISDefaults

- (int64_t)forceApperance
{
  if (forceApperance_once != -1) {
    dispatch_once(&forceApperance_once, &__block_literal_global_56);
  }
  return forceApperance_appearance;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_18);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;
  return v2;
}

- (id)tintColor
{
  if (tintColor_once != -1) {
    dispatch_once(&tintColor_once, &__block_literal_global_51);
  }
  v2 = (void *)tintColor_ifcolor;
  return v2;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

void __23__ISDefaults_tintColor__block_invoke()
{
  if (os_variant_has_internal_content())
  {
    v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v1 = [v0 stringForKey:@"ISTintColor"];

    if (v1)
    {
      v2 = _ISColorForString(v1);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)&tintColor_ifcolor, v2);
      }
      else if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v3 = (int)[v2 intValue];
        uint64_t v4 = [objc_alloc(MEMORY[0x1E4F6F1C8]) initWithSystemColor:v3];
        v5 = (void *)tintColor_ifcolor;
        tintColor_ifcolor = v4;
      }
      else
      {
        v6 = _ISDefaultLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          __23__ISDefaults_tintColor__block_invoke_cold_1((uint64_t)v2, v6);
        }
      }
    }
  }
}

void __28__ISDefaults_forceApperance__block_invoke()
{
  if (os_variant_has_internal_content())
  {
    v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v3 = [v0 stringForKey:@"ISForceApperance"];

    v1 = v3;
    if (v3)
    {
      if ([v3 caseInsensitiveCompare:@"dark"]) {
        uint64_t v2 = 2 * ([v3 caseInsensitiveCompare:@"tintable"] == 0);
      }
      else {
        uint64_t v2 = 1;
      }
      forceApperance_appearance = v2;
      v1 = v3;
    }
  }
}

uint64_t __28__ISDefaults_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_2 = objc_alloc_init(ISDefaults);
  return MEMORY[0x1F41817F8]();
}

- (ISDefaults)init
{
  v14.receiver = self;
  v14.super_class = (Class)ISDefaults;
  uint64_t v2 = [(ISDefaults *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [NSString stringWithCString:"com.apple.iconservices" encoding:4];
    serviceName = v2->_serviceName;
    v2->_serviceName = (NSString *)v3;

    v5 = (__CFString *)MGCopyAnswer();
    v6 = (__CFString *)MGCopyAnswer();
    v7 = &stru_1F06391F0;
    if (v5) {
      v8 = v5;
    }
    else {
      v8 = &stru_1F06391F0;
    }
    if (v6) {
      v7 = v6;
    }
    v9 = [NSString stringWithFormat:@"%s%@%@", "02:45:40", v8, v7];
    v10 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithString:", v9);
    uint64_t v11 = [v10 UUIDString];

    cacheSaltString = v2->_cacheSaltString;
    v2->_cacheSaltString = (NSString *)v11;
  }
  return v2;
}

- (NSURL)cacheURL
{
  cacheURL = self->__cacheURL;
  if (!cacheURL)
  {
    uint64_t v12 = 1;
    uint64_t v4 = container_system_group_path_for_identifier();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v4 isDirectory:1 relativeToURL:0];
      v7 = [v6 URLByAppendingPathComponent:@"Library/Caches" isDirectory:1];

      free(v5);
    }
    else
    {
      v8 = _ISDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        [(ISDefaults *)&v12 cacheURL];
      }

      v7 = 0;
    }
    v9 = [v7 URLByAppendingPathComponent:@"com.apple.IconsCache" isDirectory:1];
    v10 = self->__cacheURL;
    self->__cacheURL = v9;

    cacheURL = self->__cacheURL;
  }
  return cacheURL;
}

- (BOOL)usePerstentCache
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->__usePerstentCache)
  {
    uint64_t v4 = getenv("IS_USE_PERSISTENT_CACHE");
    if (v4)
    {
      v5 = [NSNumber numberWithInt:atoi(v4) > 0];
    }
    else
    {
      v5 = (NSNumber *)MEMORY[0x1E4F1CC38];
    }
    usePerstentCache = self->__usePerstentCache;
    self->__usePerstentCache = v5;
  }
  os_unfair_lock_unlock(p_lock);
  v7 = self->__usePerstentCache;
  return [(NSNumber *)v7 BOOLValue];
}

- (BOOL)defaultToTemplatizedAppIcons
{
  return 1;
}

- (BOOL)allowDocumentClaimIcons
{
  return 0;
}

- (BOOL)preferSymbolAsTemplateVariant
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableAppIconOverides
{
  return (_os_feature_enabled_impl() & 1) != 0 || self->__enableAppIconOverrides;
}

- (double)prepareImageDelay
{
  int v2 = pthread_main_np();
  double result = 0.0;
  if (v2 == 1)
  {
    if (prepareImageDelay_onceToken != -1) {
      dispatch_once(&prepareImageDelay_onceToken, &__block_literal_global_29);
    }
    return *(double *)&prepareImageDelay_delay;
  }
  return result;
}

void __31__ISDefaults_prepareImageDelay__block_invoke()
{
  id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v1 doubleForKey:@"IconServicesMainThreadPrepareDelay"];
  prepareImageDelay_delay = v0;
}

- (BOOL)logMissingURLCacheProperties
{
  return 0;
}

- (BOOL)isDebugGraphicIconColourEnabled
{
  if (isDebugGraphicIconColourEnabled_once != -1) {
    dispatch_once(&isDebugGraphicIconColourEnabled_once, &__block_literal_global_35);
  }
  return isDebugGraphicIconColourEnabled_result;
}

void __45__ISDefaults_isDebugGraphicIconColourEnabled__block_invoke()
{
  if (os_variant_has_internal_content())
  {
    uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v1 = [v0 BOOLForKey:@"ISDebugGraphicIcons"];

    if (v1) {
      isDebugGraphicIconColourEnabled_double result = 1;
    }
  }
}

- (id)debugGraphicIconColor
{
  if (debugGraphicIconColor_once != -1) {
    dispatch_once(&debugGraphicIconColor_once, &__block_literal_global_40);
  }
  int v2 = (void *)debugGraphicIconColor_color;
  return v2;
}

uint64_t __35__ISDefaults_debugGraphicIconColor__block_invoke()
{
  debugGraphicIconColor_color = [objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:84.0 green:92.0 blue:0.0 alpha:255.0];
  return MEMORY[0x1F41817F8]();
}

- (id)debugPreDefinedGraphicIconColor
{
  if (debugPreDefinedGraphicIconColor_once != -1) {
    dispatch_once(&debugPreDefinedGraphicIconColor_once, &__block_literal_global_43);
  }
  int v2 = (void *)debugPreDefinedGraphicIconColor_color;
  return v2;
}

uint64_t __45__ISDefaults_debugPreDefinedGraphicIconColor__block_invoke()
{
  debugPreDefinedGraphicIconColor_color = [objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:84.0 green:0.0 blue:42.0 alpha:255.0];
  return MEMORY[0x1F41817F8]();
}

- (id)debugISIconGraphicIconColor
{
  if (debugISIconGraphicIconColor_once != -1) {
    dispatch_once(&debugISIconGraphicIconColor_once, &__block_literal_global_45);
  }
  int v2 = (void *)debugISIconGraphicIconColor_color;
  return v2;
}

uint64_t __41__ISDefaults_debugISIconGraphicIconColor__block_invoke()
{
  debugISIconGraphicIconColor_color = [objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.33 green:1.0 blue:16.0 alpha:1.0];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)enableInstanceIDBasedTwoAppModel
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableBadgeOverhang
{
  return _os_feature_enabled_impl();
}

- (BOOL)simulateTintableAppearance
{
  return _os_feature_enabled_impl();
}

- (BOOL)disableLegacyIconSegmentation
{
  return _os_feature_enabled_impl();
}

- (BOOL)isDarkIconSegmentationEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isDarkIconColorEnhancementEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isDarkIconDimmingEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isDarkIconDimmingForDedicatedAssetsEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isFlagDimmedDedicatedAssetsEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isUnsupportedDecorationDisabled
{
  if (isUnsupportedDecorationDisabled_once != -1) {
    dispatch_once(&isUnsupportedDecorationDisabled_once, &__block_literal_global_73);
  }
  return isUnsupportedDecorationDisabled_result;
}

void __45__ISDefaults_isUnsupportedDecorationDisabled__block_invoke()
{
  if (os_variant_has_internal_content())
  {
    uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v1 = [v0 BOOLForKey:@"ISDisableUnsupportedDecoration"];

    if (v1) {
      isUnsupportedDecorationDisabled_double result = 1;
    }
  }
}

- (NSString)cacheSaltString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)_usePerstentCache
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)set_usePerstentCache:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BOOL)_enableAppIconOverrides
{
  return self->__enableAppIconOverrides;
}

- (BOOL)_enable1016Icons
{
  return self->__enable1016Icons;
}

- (BOOL)_ignoreDocumentClaimIcons
{
  return self->__ignoreDocumentClaimIcons;
}

- (NSURL)_cacheURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_cacheURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cacheURL, 0);
  objc_storeStrong((id *)&self->__usePerstentCache, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_cacheSaltString, 0);
}

- (void)cacheURL
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1AE771000, a2, OS_LOG_TYPE_FAULT, "Failed to get cache path with error: %llu.", (uint8_t *)&v3, 0xCu);
}

void __23__ISDefaults_tintColor__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "Unexpected color %@", (uint8_t *)&v2, 0xCu);
}

@end