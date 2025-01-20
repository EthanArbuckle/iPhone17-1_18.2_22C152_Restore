@interface CUIStructuredThemeStore
- (BOOL)_formatStorageKeyArrayBytes:(void *)a3 length:(unint64_t)a4 fromKey:(const _renditionkeytoken *)a5;
- (BOOL)_subImageTexturingShouldBeSupported;
- (BOOL)assetExistsForKey:(const _renditionkeytoken *)a3;
- (BOOL)caAllowSubimageOfImage:(CGImage *)a3;
- (BOOL)canGetRenditionWithKey:(const _renditionkeytoken *)a3;
- (BOOL)containsLookupForName:(id)a3;
- (BOOL)getFontName:(id *)a3 baselineOffset:(double *)a4 forFontType:(id)a5;
- (BOOL)getPhysicalColor:(_colordef *)a3 withName:(id)a4;
- (BOOL)hasPhysicalColorWithName:(id)a3;
- (BOOL)imageNamedShouldFlip:(id)a3;
- (BOOL)localizationWorkaroundForKeyList:(const _renditionkeytoken *)a3 withLocale:(id)a4;
- (BOOL)mainBundle;
- (BOOL)usesCUISystemThemeRenditionKey;
- (CUIStructuredThemeStore)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (CUIStructuredThemeStore)initWithPath:(id)a3;
- (CUIStructuredThemeStore)initWithURL:(id)a3;
- (NSString)debugDescription;
- (const)keyAttributeIndex;
- (const)keyFormat;
- (const)renditionKeyForName:(id)a3;
- (const)renditionKeyForName:(id)a3 cursorHotSpot:(CGPoint *)a4;
- (const)renditionKeyFormat;
- (double)fontSizeForFontSizeType:(id)a3;
- (id)_newRenditionKeyDataFromKey:(const _renditionkeytoken *)a3;
- (id)aliasForName:(id)a3;
- (id)allImageNames;
- (id)appearances;
- (id)baseGradationKeySignatureForKey:(const _renditionkeytoken *)a3;
- (id)bundleID;
- (id)catalogGlobals;
- (id)convertRenditionKeyToKeyData:(const _renditionkeytoken *)a3;
- (id)copyKeySignatureForKey:(const _renditionkeytoken *)a3 withBytesNoCopy:(char *)a4 length:(unint64_t)a5;
- (id)copyLookupKeySignatureForKey:(const _renditionkeytoken *)a3;
- (id)debugDescriptionForKeyList:(const _renditionkeytoken *)a3;
- (id)defaultAppearanceName;
- (id)deploymentPlatformString;
- (id)imagesWithName:(id)a3;
- (id)keySignatureForKey:(const _renditionkeytoken *)a3;
- (id)localizations;
- (id)lookupAssetForKey:(const _renditionkeytoken *)a3;
- (id)mappedAliases;
- (id)nameForAppearanceIdentifier:(unsigned __int16)a3;
- (id)nameForLocalizationIdentifier:(unsigned __int16)a3;
- (id)renditionInfoForIdentifier:(unsigned __int16)a3;
- (id)renditionNameForKeyList:(_renditionkeytoken *)a3;
- (id)renditionWithKey:(const _renditionkeytoken *)a3;
- (id)renditionWithKey:(const _renditionkeytoken *)a3 usingKeySignature:(id)a4;
- (id)store;
- (id)themeStore;
- (int64_t)deploymentPlatform;
- (int64_t)maximumRenditionKeyTokenCount;
- (unint64_t)colorSpaceID;
- (unint64_t)themeIndex;
- (unsigned)appearanceIdentifierForName:(id)a3;
- (unsigned)authoredWithSchemaVersion;
- (unsigned)distilledInCoreUIVersion;
- (unsigned)documentFormatVersion;
- (unsigned)localizationIdentifierForName:(id)a3;
- (unsigned)thinnedWithCoreUIVersion;
- (void)_commonInit;
- (void)_updateKeyWithCompatibilityMapping:(_renditionkeytoken *)a3;
- (void)clearRenditionCache;
- (void)dealloc;
- (void)setBundleID:(id)a3;
- (void)setMainBundle:(BOOL)a3;
- (void)setThemeIndex:(unint64_t)a3;
@end

@implementation CUIStructuredThemeStore

- (id)copyLookupKeySignatureForKey:(const _renditionkeytoken *)a3
{
  memset(v7, 0, 92);
  CUIRenditionKeyCopy(v7, a3, 0x16u);
  return objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v6, CUICopyKeySignature(v6, 0x100uLL, (int *)a3, (uint64_t)-[CUIStructuredThemeStore keyFormat](self, "keyFormat"), (uint64_t *)-[CUIStructuredThemeStore keyAttributeIndex](self, "keyAttributeIndex")), 1);
}

- (BOOL)_formatStorageKeyArrayBytes:(void *)a3 length:(unint64_t)a4 fromKey:(const _renditionkeytoken *)a5
{
  v9 = [(CUIStructuredThemeStore *)self keyFormat];
  v10 = [(CUIStructuredThemeStore *)self keyAttributeIndex];
  if (!a3 || a4 < 2 * (unint64_t)v9->var2) {
    return 0;
  }
  v12 = (uint64_t *)v10;
  CUIRenditionKeyCopy(v14, a5, 0x16u);
  [(CUIStructuredThemeStore *)self _updateKeyWithCompatibilityMapping:v14];
  CUIFillCARKeyArrayForRenditionKey2((uint64_t)a3, v14, (uint64_t)v9, v12);
  if ([(CUICommonAssetStorage *)self->_store swapped])
  {
    uint64_t var2 = v9->var2;
    if (var2)
    {
      do
      {
        *(_WORD *)a3 = bswap32(*(unsigned __int16 *)a3) >> 16;
        a3 = (char *)a3 + 2;
        --var2;
      }
      while (var2);
    }
  }
  return 1;
}

- (BOOL)canGetRenditionWithKey:(const _renditionkeytoken *)a3
{
  id v5 = +[CUIRuntimeStatistics sharedRuntimeStatistics];
  [v5 incrementStatisticLookup];
  id v6 = [(CUICommonAssetStorage *)self->_store renditionInfoForIdentifier:CUIRenditionKeyValueForAttribute(&a3->identifier, 17)];
  if (v6)
  {
    id v7 = v6;
    if (!self->_attributePresent) {
      self->_attributePresent = [v6 methodForSelector:sel_attributePresent_withValue_];
    }
    v8 = [(CUIStructuredThemeStore *)self keyAttributeIndex];
    unsigned int v9 = CUIRenditionKeyTokenCount((uint64_t)a3);
    unsigned int nkeys = v8->nkeys;
    if (nkeys >= v9 ? v9 : v8->nkeys)
    {
      unsigned int v12 = v9;
      unint64_t v13 = 0;
      p_value = &a3->value;
      do
      {
        if ((v8->keymask & (1 << *(p_value - 1))) != 0)
        {
          if (!((unsigned int (*)(id, char *))self->_attributePresent)(v7, sel_attributePresent_withValue_))
          {
            [v5 incrementStatisticDidShortCircuitImageLookup];
            return 0;
          }
          unsigned int nkeys = v8->nkeys;
        }
        p_value += 2;
        ++v13;
        if (nkeys >= v12) {
          unint64_t v15 = v12;
        }
        else {
          unint64_t v15 = nkeys;
        }
      }
      while (v13 < v15);
    }
  }
  id v16 = [(CUIStructuredThemeStore *)self copyKeySignatureForKey:a3 withBytesNoCopy:&v20 length:256];
  os_unfair_lock_lock(&self->_cacheLock);
  id v17 = [(NSMutableDictionary *)self->_cache objectForKey:v16];
  os_unfair_lock_unlock(&self->_cacheLock);
  if (v17)
  {

    return 1;
  }
  else
  {
    BOOL v18 = [(CUIStructuredThemeStore *)self assetExistsForKey:a3];

    if (v5 && !v18)
    {
      [v5 incrementMissedLookup];
      return 0;
    }
  }
  return v18;
}

- (const)keyAttributeIndex
{
  result = (const _renditionkeyattributeindex *)self->_store;
  if (result) {
    return (const _renditionkeyattributeindex *)[(_renditionkeyattributeindex *)(id)result keyAttributeIndex];
  }
  return result;
}

- (id)renditionWithKey:(const _renditionkeytoken *)a3 usingKeySignature:(id)a4
{
  id v7 = (void *)MEMORY[0x1A62313E0](self, a2);
  if (a4) {
    id v8 = a4;
  }
  else {
    a4 = [(CUIStructuredThemeStore *)self copyKeySignatureForKey:a3 withBytesNoCopy:v31 length:256];
  }
  os_unfair_lock_lock(&self->_cacheLock);
  unsigned int v9 = (CUIThemeRendition *)[(NSMutableDictionary *)self->_cache objectForKey:a4];
  os_unfair_lock_unlock(&self->_cacheLock);
  if (!v9)
  {
    unsigned int v9 = [(CUIStructuredThemeStore *)self lookupAssetForKey:a3];
    if (v9)
    {
      if (CUILogRenditionLogEnabled())
      {
        v10 = CUILogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = [(CUICommonAssetStorage *)self->_store path];
          *(_DWORD *)buf = 138543874;
          id v26 = v11;
          __int16 v27 = 2050;
          id v28 = [(CUIThemeRendition *)v9 bytes];
          __int16 v29 = 2114;
          id v30 = a4;
          _os_log_impl(&dword_1A12EB000, v10, OS_LOG_TYPE_INFO, "CoreUI-l %{public}@ %{public}p %{public}@", buf, 0x20u);
        }
      }
      unsigned int v9 = [[CUIThemeRendition alloc] initWithCSIData:v9 forKey:a3 version:[(CUIStructuredThemeStore *)self distilledInCoreUIVersion]];
      if ([(CUIStructuredThemeStore *)self distilledInCoreUIVersion] <= 0x178
        && [(CUIThemeRendition *)v9 pixelFormat] == 1246774599)
      {
        [(CUIThemeRendition *)v9 setOpacity:1.0];
      }
      [(CUIThemeRendition *)v9 _setStructuredThemeStore:self];
      if (!v9)
      {
        id v12 = objc_msgSend(-[CUIStructuredThemeStore store](self, "store"), "path");
        _CUILog(4, (uint64_t)"CoreUI: Error calling -[CUIThemeRendition initWithCSIData:forKey: inVersion:] failed catalog '%@'", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
      }
    }
    os_unfair_lock_lock(&self->_cacheLock);
    cache = self->_cache;
    if (cache && v9)
    {
      uint64_t v20 = (CUIThemeRendition *)[(NSMutableDictionary *)cache objectForKey:a4];
      if (v20)
      {
        v21 = v20;
        if (v9 != v20)
        {
          v22 = v9;
          unsigned int v9 = v21;
        }
      }
      else
      {
        id v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", objc_msgSend(a4, "UTF8String"));
        [(NSMutableDictionary *)self->_cache setObject:v9 forKey:v23];
      }
    }
    os_unfair_lock_unlock(&self->_cacheLock);
  }

  return v9;
}

- (id)copyKeySignatureForKey:(const _renditionkeytoken *)a3 withBytesNoCopy:(char *)a4 length:(unint64_t)a5
{
  uint64_t v6 = CUICopyKeySignature(a4, a5, (int *)a3, (uint64_t)[(CUIStructuredThemeStore *)self keyFormat], (uint64_t *)[(CUIStructuredThemeStore *)self keyAttributeIndex]);
  id v7 = objc_alloc((Class)NSString);
  return [v7 initWithBytesNoCopy:a4 length:v6 encoding:1 freeWhenDone:0];
}

- (const)keyFormat
{
  store = self->_store;
  if (store)
  {
    return [(CUICommonAssetStorage *)store keyFormat];
  }
  else
  {
    if ((keyFormat_didWarn & 1) == 0)
    {
      keyFormat_didWarn = 1;
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      _CUILog(1, (uint64_t)"%@ where the _store ivar hasn't been initialized won't behave well.", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
      if (([(CUIStructuredThemeStore *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
      {
        uint64_t v14 = NSStringFromSelector(a2);
        _CUILog(1, (uint64_t)"Subclasses of CUIStructuredThemeStore that don't use _store should override %@", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
      }
    }
    return (const _renditionkeyfmt *)CUISystemThemeRenditionKeyFormat();
  }
}

- (void)_updateKeyWithCompatibilityMapping:(_renditionkeytoken *)a3
{
  if ([(CUICommonAssetStorage *)self->_store storageVersion] <= 4)
  {
    int v4 = CUIRenditionKeyIndexForAttribute(&a3->identifier, 14);
    if ((v4 & 0x80000000) == 0)
    {
      id v5 = &a3[v4];
      v5->identifier = 7;
      if (v5->value) {
        __int16 v6 = 3;
      }
      else {
        __int16 v6 = 0;
      }
      v5->value = v6;
    }
  }
}

- (BOOL)assetExistsForKey:(const _renditionkeytoken *)a3
{
  *(_OWORD *)uint64_t v12 = 0u;
  id v5 = [(CUIStructuredThemeStore *)self keyFormat];
  size_t var2 = v5->var2;
  if (var2 < 0x16)
  {
    id v7 = &v11;
    uint64_t v8 = 42;
  }
  else
  {
    id v7 = (long long *)malloc_type_calloc(var2, 2uLL, 0x1000040BDFB0063uLL);
    uint64_t v8 = 2 * v5->var2;
  }
  if ([(CUIStructuredThemeStore *)self _formatStorageKeyArrayBytes:v7 length:v8 fromKey:a3])
  {
    BOOL v9 = [(CUICommonAssetStorage *)self->_store assetExistsForKeyData:v7 length:2 * v5->var2];
  }
  else
  {
    BOOL v9 = 0;
  }
  if (v5->var2 >= 0x16) {
    free(v7);
  }
  return v9;
}

- (unsigned)distilledInCoreUIVersion
{
  return [(CUICommonAssetStorage *)self->_store distilledInCoreUIVersion];
}

- (int64_t)deploymentPlatform
{
  return [(CUICommonAssetStorage *)self->_store deploymentPlatform];
}

- (id)renditionInfoForIdentifier:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(CUIStructuredThemeStore *)self themeStore];
  return [v4 renditionInfoForIdentifier:v3];
}

- (id)themeStore
{
  return self->_store;
}

- (BOOL)localizationWorkaroundForKeyList:(const _renditionkeytoken *)a3 withLocale:(id)a4
{
  if (!objc_msgSend(-[CUIStructuredThemeStore bundleID](self, "bundleID"), "isEqualToString:", @"com.apple.CoreGlyphs"))return 0; {
  if (!a4)
  }
    a4 = +[NSLocale currentLocale];
  id v7 = [a4 languageCode];
  if (([v7 isEqualToString:@"ar"] & 1) == 0
    && ![v7 isEqualToString:@"hi"])
  {
    return 0;
  }
  if (!objc_msgSend(objc_msgSend(a4, "numberingSystem"), "isEqualToString:", @"latn")) {
    return 0;
  }
  if (localizationWorkaroundForKeyList_withLocale____onceToken != -1) {
    dispatch_once(&localizationWorkaroundForKeyList_withLocale____onceToken, &__block_literal_global_11);
  }
  id v8 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedShort:", CUIRenditionKeyValueForAttribute(&a3->identifier, 17));
  os_unfair_lock_lock(&self->_cacheLock);
  id v9 = [(NSCache *)self->_nameCache objectForKey:v8];
  if (!v9)
  {
    id v9 = [(CUICommonAssetStorage *)self->_store renditionNameForKeyBaseList:a3];
    nameCache = self->_nameCache;
    if (!nameCache)
    {
      nameCache = (NSCache *)objc_alloc_init((Class)NSCache);
      self->_nameCache = nameCache;
    }
    [(NSCache *)nameCache setObject:v9 forKey:v8];
  }
  os_unfair_lock_unlock(&self->_cacheLock);

  return ([(id)localizationWorkaroundForKeyList_withLocale____symbolsWithDigits containsObject:v9] & 1) != 0;
}

- (id)bundleID
{
  return self->_bundleID;
}

- (const)renditionKeyForName:(id)a3
{
  return [(CUIStructuredThemeStore *)self renditionKeyForName:a3 cursorHotSpot:0];
}

- (const)renditionKeyForName:(id)a3 cursorHotSpot:(CGPoint *)a4
{
  if (a3)
  {
    if (a4)
    {
      id v7 = [a3 mutableCopy];
      [v7 appendString:NSStringFromPoint(*a4)];
    }
    else
    {
      id v7 = a3;
    }
    CFNullRef v9 = [(NSCache *)self->_namedRenditionKeyCache objectForKey:v7];
    if (v9)
    {
      if (v9 == kCFNull) {
        id v8 = 0;
      }
      else {
        id v8 = (const _renditionkeytoken *)[(__CFNull *)v9 bytes];
      }
      goto LABEL_16;
    }
    CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)a3);
    long long v11 = malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xB1B95B1DuLL);
    if (CFStringGetFileSystemRepresentation((CFStringRef)a3, (char *)v11, MaximumSizeOfFileSystemRepresentation))
    {
      id v8 = [(CUICommonAssetStorage *)self->_store renditionKeyForName:v11 hotSpot:a4];
      free(v11);
      if (v8)
      {
        uint64_t v12 = +[NSData dataWithBytes:v8 length:4 * CUIRenditionKeyTokenCount((uint64_t)v8) + 4];
LABEL_15:
        [(NSCache *)self->_namedRenditionKeyCache setObject:v12 forKey:v7];
LABEL_16:

        return v8;
      }
    }
    else
    {
      free(v11);
    }
    id v8 = 0;
    uint64_t v12 = (NSData *)kCFNull;
    goto LABEL_15;
  }
  return 0;
}

- (unsigned)appearanceIdentifierForName:(id)a3
{
  return [(CUICommonAssetStorage *)self->_store appearanceIdentifierForName:a3];
}

- (id)renditionWithKey:(const _renditionkeytoken *)a3
{
  return [(CUIStructuredThemeStore *)self renditionWithKey:a3 usingKeySignature:0];
}

- (id)appearances
{
  return [(CUICommonAssetStorage *)self->_store appearances];
}

- (id)localizations
{
  return [(CUICommonAssetStorage *)self->_store localizations];
}

- (id)aliasForName:(id)a3
{
  id v5 = [(CUIStructuredThemeStore *)self bundleID];
  if (!self->_aliasDictionary)
  {
    id v6 = v5;
    if ([v5 hasPrefix:@"com.apple.CoreGlyphs"])
    {
      id v7 = +[NSBundle bundleWithIdentifier:v6];
      if (v7) {
        self->_aliasDictionary = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", -[NSBundle URLForResource:withExtension:](v7, "URLForResource:withExtension:", @"name_aliases", @"strings"), 0);
      }
    }
  }
  aliasDictionary = self->_aliasDictionary;
  return [(NSDictionary *)aliasDictionary objectForKey:a3];
}

- (unsigned)localizationIdentifierForName:(id)a3
{
  return [(CUICommonAssetStorage *)self->_store localizationIdentifierForName:a3];
}

- (BOOL)imageNamedShouldFlip:(id)a3
{
  if (dyld_program_sdk_at_least()) {
    return 0;
  }
  id v6 = [(CUIStructuredThemeStore *)self bundleID];
  if (!self->_legacyFlippableSet)
  {
    id v7 = v6;
    if ([v6 hasPrefix:@"com.apple.CoreGlyphs"])
    {
      id v8 = +[NSBundle bundleWithIdentifier:v7];
      if (v8)
      {
        id v9 = objc_msgSend(objc_alloc((Class)NSArray), "initWithContentsOfURL:error:", -[NSBundle URLForResource:withExtension:](v8, "URLForResource:withExtension:", @"legacy_flippable", @"plist"), 0);
        if (v9) {
          self->_legacyFlippableSet = (NSSet *)[objc_alloc((Class)NSSet) initWithArray:v9];
        }
      }
    }
  }
  legacyFlippableSet = self->_legacyFlippableSet;
  return [(NSSet *)legacyFlippableSet containsObject:a3];
}

- (BOOL)caAllowSubimageOfImage:(CGImage *)a3
{
  size_t Height = CGImageGetHeight(a3);
  if (CGImageGetBytesPerRow(a3) * Height < vm_page_size) {
    return 1;
  }
  return [(CUIStructuredThemeStore *)self _subImageTexturingShouldBeSupported];
}

- (BOOL)_subImageTexturingShouldBeSupported
{
  unsigned int v3 = objc_msgSend(-[CUIStructuredThemeStore themeStore](self, "themeStore"), "renditionCount");
  id v4 = +[NSSet setWithObjects:@"com.facebook.Facebook", @"com.toyopagroup.picaboo", 0];
  return (*((unsigned char *)self + 64) & 1) != 0 && ![(NSSet *)v4 containsObject:self->_bundleID]
      || v3 - 1 < 0x63;
}

- (void)setThemeIndex:(unint64_t)a3
{
  self->_themeIndex = a3;
}

- (CUIStructuredThemeStore)initWithPath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CUIStructuredThemeStore;
  id v4 = [(CUIStructuredThemeStore *)&v7 init];
  if (v4)
  {
    id v5 = [[CUICommonAssetStorage alloc] initWithPath:a3];
    v4->_store = v5;
    if (v5)
    {
      [(CUIStructuredThemeStore *)v4 _commonInit];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)_commonInit
{
  id v3 = [(CUICommonAssetStorage *)self->_store path];
  *(void *)&self->_cacheLock._os_unfair_lock_opaque = 0;
  self->_themeIndex = -1;
  self->_cache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_namedRenditionKeyCache = (NSCache *)objc_alloc_init((Class)NSCache);
  -[NSCache setName:](self->_namedRenditionKeyCache, "setName:", [@"com.apple.coreui-namecache-" stringByAppendingString:v3]);
  [(NSCache *)self->_namedRenditionKeyCache setEvictsObjectsWithDiscardedContent:0];
  namedRenditionKeyCache = self->_namedRenditionKeyCache;
  [(NSCache *)namedRenditionKeyCache setCountLimit:500];
}

- (void)setMainBundle:(BOOL)a3
{
  *((unsigned char *)self + 64) = *((unsigned char *)self + 64) & 0xFE | a3;
}

- (void)setBundleID:(id)a3
{
  if (self->_bundleID != a3) {
    self->_bundleID = (NSString *)[a3 copy];
  }
}

- (CUIStructuredThemeStore)initWithURL:(id)a3
{
  id v4 = [a3 path];
  return [(CUIStructuredThemeStore *)self initWithPath:v4];
}

- (BOOL)getPhysicalColor:(_colordef *)a3 withName:(id)a4
{
  p_storeLock = &self->_storeLock;
  os_unfair_lock_lock(&self->_storeLock);
  LOBYTE(a4) = -[CUICommonAssetStorage getColor:forName:](self->_store, "getColor:forName:", a3, [a4 UTF8String]);
  os_unfair_lock_unlock(p_storeLock);
  return (char)a4;
}

- (id)lookupAssetForKey:(const _renditionkeytoken *)a3
{
  id v4 = [(CUIStructuredThemeStore *)self _newRenditionKeyDataFromKey:a3];
  id v5 = [(CUICommonAssetStorage *)self->_store assetForKey:v4];

  if (v5 && [(CUICommonAssetStorage *)self->_store swapped])
  {
    id v5 = [v5 mutableCopy];
    id v6 = (char *)[v5 bytes];
    *(int8x16_t *)(v6 + 4) = vrev32q_s8(*(int8x16_t *)(v6 + 4));
    *(int8x8_t *)(v6 + 20) = vrev32_s8(*(int8x8_t *)(v6 + 20));
    unsigned int v7 = bswap32(*((_DWORD *)v6 + 8));
    *((_DWORD *)v6 + 7) = *((_DWORD *)v6 + 7) & 0xF | (16 * bswap32(*((_DWORD *)v6 + 7) >> 4));
    *((_DWORD *)v6 + 8) = v7;
    *((_WORD *)v6 + 18) = bswap32(*((unsigned __int16 *)v6 + 18)) >> 16;
    *((_WORD *)v6 + 19) = bswap32(*((unsigned __int16 *)v6 + 19)) >> 16;
    unsigned int v8 = *((_DWORD *)v6 + 42);
    unsigned int v9 = bswap32(v8);
    unsigned int v10 = bswap32(*((_DWORD *)v6 + 43));
    *((_DWORD *)v6 + 42) = v9;
    *((_DWORD *)v6 + 43) = v10;
    long long v11 = (unsigned int *)(v6 + 176);
    if (v10 + 1 > 1) {
      uint64_t v12 = v10 + 1;
    }
    else {
      uint64_t v12 = 1;
    }
    uint64_t v13 = (unsigned int *)(v6 + 176);
    do
    {
      *uint64_t v13 = bswap32(*v13);
      ++v13;
      --v12;
    }
    while (v12);
    uint64_t v14 = &v11[v10 + 1];
    uint64_t v15 = (unsigned int *)((char *)v14 + v9);
    if (v8)
    {
      do
      {
        unsigned int v16 = bswap32(*v14);
        unsigned int v17 = bswap32(v14[1]);
        *uint64_t v14 = v16;
        v14[1] = v17;
        if (v16 == 1003)
        {
          unsigned int v21 = v14[2];
          LODWORD(v22) = bswap32(v21);
          v14[2] = v22;
          if (v21)
          {
            if (v22 <= 1) {
              uint64_t v22 = 1;
            }
            else {
              uint64_t v22 = v22;
            }
            id v23 = (int8x8_t *)(v14 + 7);
            do
            {
              *(int8x16_t *)v23[-2].i8 = vrev32q_s8(*(int8x16_t *)v23[-2].i8);
              *id v23 = vrev32_s8(*v23);
              v23 += 3;
              --v22;
            }
            while (v22);
          }
        }
        else if (v16 == 1001)
        {
          unsigned int v18 = v14[2];
          LODWORD(v19) = bswap32(v18);
          v14[2] = v19;
          if (v18)
          {
            uint64_t v20 = (int8x16_t *)(v14 + 3);
            if (v19 <= 1) {
              uint64_t v19 = 1;
            }
            else {
              uint64_t v19 = v19;
            }
            do
            {
              *uint64_t v20 = vrev32q_s8(*v20);
              ++v20;
              --v19;
            }
            while (v19);
          }
        }
        uint64_t v14 = (unsigned int *)((char *)v14 + v17 + 8);
      }
      while (v14 < v15);
      unsigned int v10 = *((_DWORD *)v6 + 43);
    }
    if (v10)
    {
      uint64_t v24 = v10;
      do
      {
        unsigned int v25 = *v11++;
        id v26 = (char *)v15 + v25;
        *((_DWORD *)v26 + 3) = bswap32(*((_DWORD *)v26 + 3));
        *(int8x8_t *)(v26 + 4) = vrev32_s8(*(int8x8_t *)(v26 + 4));
        --v24;
      }
      while (v24);
    }
  }
  __int16 v27 = [v5 bytes];
  if (v27 && *v27 != 1129599817 && v27[1] <= 1u)
  {
    id v28 = objc_msgSend(-[CUIStructuredThemeStore store](self, "store"), "path");
    _CUILog(4, (uint64_t)"CoreUI: -[CUIStructuredThemeStore lookupAssetForKey:] got invalid CSIData for AssetCatalog '%@'", v29, v30, v31, v32, v33, v34, (uint64_t)v28);
    return 0;
  }
  return v5;
}

- (id)_newRenditionKeyDataFromKey:(const _renditionkeytoken *)a3
{
  *(_OWORD *)unsigned int v17 = 0u;
  id v5 = [(CUIStructuredThemeStore *)self keyFormat];
  size_t var2 = v5->var2;
  if (var2 < 0x16)
  {
    unsigned int v7 = &v16;
    uint64_t v8 = 42;
  }
  else
  {
    unsigned int v7 = (long long *)malloc_type_calloc(var2, 2uLL, 0x1000040BDFB0063uLL);
    uint64_t v8 = 2 * v5->var2;
  }
  unsigned __int8 v9 = [(CUIStructuredThemeStore *)self _formatStorageKeyArrayBytes:v7 length:v8 fromKey:a3];
  unsigned int v10 = v5->var2;
  if (v9)
  {
    id v11 = objc_alloc((Class)NSData);
    uint64_t v12 = 2 * v5->var2;
    if (v10 < 0x16) {
      id v13 = [v11 initWithBytes:v7 length:v12];
    }
    else {
      id v13 = [v11 initWithBytesNoCopy:v7 length:v12 freeWhenDone:1];
    }
    uint64_t v14 = v13;
    __CFSetLastAllocationEventName();
  }
  else
  {
    if (v10 >= 0x16) {
      free(v7);
    }
    return 0;
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIStructuredThemeStore;
  [(CUIStructuredThemeStore *)&v3 dealloc];
}

- (void)clearRenditionCache
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  id v4 = self->_cache;
  self->_cache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  os_unfair_lock_unlock(p_cacheLock);
}

- (unint64_t)colorSpaceID
{
  store = self->_store;
  if (store) {
    return [(CUICommonAssetStorage *)store colorSpaceID];
  }
  else {
    return 1;
  }
}

- (int64_t)maximumRenditionKeyTokenCount
{
  store = self->_store;
  if (store)
  {
    return [(CUICommonAssetStorage *)store maximumRenditionKeyTokenCount];
  }
  else
  {
    if ((maximumRenditionKeyTokenCount_didWarn & 1) == 0)
    {
      maximumRenditionKeyTokenCount_didWarn = 1;
      id v6 = (objc_class *)objc_opt_class();
      unsigned int v7 = NSStringFromClass(v6);
      _CUILog(1, (uint64_t)"%@ where the _store ivar hasn't been initialized won't behave well.", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
      if (([(CUIStructuredThemeStore *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
      {
        uint64_t v14 = NSStringFromSelector(a2);
        _CUILog(1, (uint64_t)"Subclasses of CUIStructuredThemeStore that don't use _store should override %@", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
      }
    }
    return 21;
  }
}

- (BOOL)usesCUISystemThemeRenditionKey
{
  store = self->_store;
  if (store)
  {
    return [(CUICommonAssetStorage *)store usesCUISystemThemeRenditionKey];
  }
  else
  {
    if ((usesCUISystemThemeRenditionKey_didWarn & 1) == 0)
    {
      usesCUISystemThemeRenditionKey_didWarn = 1;
      id v6 = (objc_class *)objc_opt_class();
      unsigned int v7 = NSStringFromClass(v6);
      _CUILog(1, (uint64_t)"%@ where the _store ivar hasn't been initialized won't behave well.", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
      if (([(CUIStructuredThemeStore *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
      {
        uint64_t v14 = NSStringFromSelector(a2);
        _CUILog(1, (uint64_t)"Subclasses of CUIStructuredThemeStore that don't use _store should override %@", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
      }
    }
    return 1;
  }
}

- (id)baseGradationKeySignatureForKey:(const _renditionkeytoken *)a3
{
  CUICopyKeySignatureWithPrefix(v4, 0x100uLL, (int *)a3, (uint64_t)[(CUIStructuredThemeStore *)self keyFormat], (uint64_t *)[(CUIStructuredThemeStore *)self keyAttributeIndex], 0);
  return +[NSString stringWithCString:v4 encoding:1];
}

- (id)keySignatureForKey:(const _renditionkeytoken *)a3
{
  CUICopyKeySignature(v4, 0x100uLL, (int *)a3, (uint64_t)[(CUIStructuredThemeStore *)self keyFormat], (uint64_t *)[(CUIStructuredThemeStore *)self keyAttributeIndex]);
  return +[NSString stringWithCString:v4 encoding:1];
}

- (CUIStructuredThemeStore)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CUIStructuredThemeStore;
  id v6 = [(CUIStructuredThemeStore *)&v9 init];
  if (v6)
  {
    unsigned int v7 = [[CUICommonAssetStorage alloc] initWithBytes:a3 length:a4];
    v6->_store = v7;
    if (v7)
    {
      [(CUIStructuredThemeStore *)v6 _commonInit];
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (unsigned)documentFormatVersion
{
  return [(CUICommonAssetStorage *)self->_store storageVersion];
}

- (unsigned)thinnedWithCoreUIVersion
{
  return [(CUICommonAssetStorage *)self->_store thinnedWithCoreUIVersion];
}

- (unsigned)authoredWithSchemaVersion
{
  return [(CUICommonAssetStorage *)self->_store schemaVersion];
}

- (id)defaultAppearanceName
{
  id v2 = [(CUICommonAssetStorage *)self->_store deploymentPlatformString];
  if ([v2 isEqualToString:kCUIPlatformMac[0]]) {
    return @"NSAppearanceNameSystem";
  }
  else {
    return @"UIAppearanceAny";
  }
}

- (BOOL)hasPhysicalColorWithName:(id)a3
{
  p_storeLock = &self->_storeLock;
  os_unfair_lock_lock(&self->_storeLock);
  LOBYTE(a3) = -[CUICommonAssetStorage hasColorForName:](self->_store, "hasColorForName:", [a3 UTF8String]);
  os_unfair_lock_unlock(p_storeLock);
  return (char)a3;
}

- (BOOL)getFontName:(id *)a3 baselineOffset:(double *)a4 forFontType:(id)a5
{
  p_storeLock = &self->_storeLock;
  os_unfair_lock_lock(&self->_storeLock);
  float v12 = 0.0;
  BOOL v10 = [(CUICommonAssetStorage *)self->_store getFontName:a3 baselineOffset:&v12 forFontType:a5];
  os_unfair_lock_unlock(p_storeLock);
  if (a4 && v10) {
    *a4 = v12;
  }
  return v10;
}

- (double)fontSizeForFontSizeType:(id)a3
{
  p_storeLock = &self->_storeLock;
  os_unfair_lock_lock(&self->_storeLock);
  [(CUICommonAssetStorage *)self->_store fontSizeForFontSizeType:a3];
  double v7 = v6;
  os_unfair_lock_unlock(p_storeLock);
  return v7;
}

- (id)convertRenditionKeyToKeyData:(const _renditionkeytoken *)a3
{
  id v3 = [(CUIStructuredThemeStore *)self _newRenditionKeyDataFromKey:a3];
  return v3;
}

- (const)renditionKeyFormat
{
  int v3 = [(CUICommonAssetStorage *)self->_store keySemantics];
  unsigned int v4 = [(CUICommonAssetStorage *)self->_store storageVersion];
  return (const _renditionkeyfmt *)CUIDefaultThemeRenditionKeyFormat(v3, v4, v5, v6, v7, v8, v9, v10);
}

- (id)debugDescriptionForKeyList:(const _renditionkeytoken *)a3
{
  uint64_t v5 = [(CUIStructuredThemeStore *)self renditionKeyFormat];
  if (v5 == (const _renditionkeyfmt *)CUISystemThemeRenditionKeyFormat())
  {
    uint64_t v9 = CUIRenditionKeyValueForAttribute(&a3->identifier, 1);
    uint64_t v10 = +[NSString stringWithFormat:@"%ld", v9];
    uint64_t v11 = CUIRenditionKeyValueForAttribute(&a3->identifier, 2);
    float v12 = +[NSString stringWithFormat:@"%ld", v11];
    unsigned int v13 = CUIRenditionKeyValueForAttribute(&a3->identifier, 3);
    uint64_t v14 = v13;
    switch(v13)
    {
      case 0u:
        uint64_t v15 = +[NSString stringWithFormat:@"%ld - kCoreThemeSizeRegular", 0];
        goto LABEL_17;
      case 1u:
        uint64_t v15 = +[NSString stringWithFormat:@"%ld - kCoreThemeSizeSmall", 1];
        goto LABEL_17;
      case 2u:
        uint64_t v15 = +[NSString stringWithFormat:@"%ld - kCoreThemeSizeMini", 2];
        goto LABEL_17;
      case 3u:
        uint64_t v15 = +[NSString stringWithFormat:@"%ld - kCoreThemeSizeLarge", 3];
LABEL_17:
        id v28 = v15;
        if (!v15) {
          goto LABEL_18;
        }
        goto LABEL_19;
      default:
LABEL_18:
        id v28 = +[NSString stringWithFormat:@"%ld - Unknown size value", v14];
LABEL_19:
        unsigned int v29 = CUIRenditionKeyValueForAttribute(&a3->identifier, 4);
        uint64_t v72 = v29;
        if (v29 > 5) {
          uint64_t v30 = +[NSString stringWithFormat:@"%ld - Unnamed direction value", v29];
        }
        else {
          uint64_t v30 = +[NSString stringWithFormat:@"%s", gThemeDirections[3 * v29 + 2]];
        }
        v64 = v30;
        unsigned int v31 = CUIRenditionKeyValueForAttribute(&a3->identifier, 6);
        uint64_t v71 = v31;
        if (v31 > 2) {
          uint64_t v32 = +[NSString stringWithFormat:@"%ld - Unnamed on/off/mixed value", v31];
        }
        else {
          uint64_t v32 = +[NSString stringWithFormat:@"%s", gThemeValues[3 * v31 + 2]];
        }
        v63 = v32;
        unsigned int v33 = CUIRenditionKeyValueForAttribute(&a3->identifier, 10);
        uint64_t v70 = v33;
        if (v33 > 4) {
          uint64_t v34 = +[NSString stringWithFormat:@"%ld - Unnamed state value", v33];
        }
        else {
          uint64_t v34 = +[NSString stringWithFormat:@"%s", gThemeStates[3 * v33 + 2]];
        }
        v62 = v34;
        unsigned int v35 = CUIRenditionKeyValueForAttribute(&a3->identifier, 18);
        uint64_t v69 = v35;
        if (v35 > 2) {
          v36 = +[NSString stringWithFormat:@"%ld - Unnamed on/off/mixed previousValue", v35];
        }
        else {
          v36 = +[NSString stringWithFormat:@"%s", gThemeValues[3 * v35 + 2]];
        }
        v61 = v36;
        unsigned int v37 = CUIRenditionKeyValueForAttribute(&a3->identifier, 19);
        uint64_t v74 = v9;
        uint64_t v68 = v37;
        if (v37 > 4) {
          v38 = +[NSString stringWithFormat:@"%ld - Unnamed previousState value", v37];
        }
        else {
          v38 = +[NSString stringWithFormat:@"%s", gThemeStates[3 * v37 + 2]];
        }
        v60 = v38;
        unsigned int v39 = CUIRenditionKeyValueForAttribute(&a3->identifier, 14);
        uint64_t v40 = v39;
        v66 = v12;
        v41 = self;
        if (v39 > 2) {
          v42 = +[NSString stringWithFormat:@"%ld - Unnamed presentation state value", v39];
        }
        else {
          v42 = +[NSString stringWithFormat:@"%s", gThemePresentationStates[3 * v39 + 2]];
        }
        v59 = v42;
        unsigned int v43 = CUIRenditionKeyValueForAttribute(&a3->identifier, 11);
        uint64_t v44 = v43;
        v67 = v10;
        uint64_t v73 = v14;
        v65 = v28;
        if (v43 > 4) {
          v45 = +[NSString stringWithFormat:@"%ld - Unnamed drawing layer value", v43];
        }
        else {
          v45 = +[NSString stringWithFormat:@"%s", gThemeDrawingLayers[3 * v43 + 2]];
        }
        v46 = v45;
        id v47 = [(NSDictionary *)[+[NSProcessInfo processInfo] environment] objectForKey:@"CUISuppressMissingAssetLogs"];
        unsigned int v48 = CUIRenditionKeyValueForAttribute(&a3->identifier, 8);
        unsigned int v49 = CUIRenditionKeyValueForAttribute(&a3->identifier, 9);
        unsigned int v50 = CUIRenditionKeyValueForAttribute(&a3->identifier, 12);
        unsigned int v51 = CUIRenditionKeyValueForAttribute(&a3->identifier, 17);
        id v52 = [(CUIStructuredThemeStore *)v41 bundleID];
        if (v47) {
          id result = +[NSString stringWithFormat:@"(%ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld) in %@", v74, v11, v73, v72, v71, v48, v49, v70, v68, v69, v40, v44, v50, v51, v52];
        }
        else {
          id result = +[NSString stringWithFormat:@"\n\tElement: %@\n\tPart: %@\n\tSize: %@\n\tDirection: %@\n\tValue: %@\n\tDimension 1: %d\n\tDimension 2: %d\n\tState: %@\n\tPrevious State: %@\n\tPrevious Value: %@\n\tPresentation State: %@\n\tDrawing Layer: %@\n\tScale: %d\n\tIdentifier: %d\nin theme store associated with bundle: %@", v67, v66, v65, v64, v63, v48, v49, v62, v60, v61, v59, v46, v50, v51, v52];
        }
        break;
    }
  }
  else
  {
    unsigned int v6 = CUIRenditionKeyValueForAttribute(&a3->identifier, 12);
    unsigned int v7 = CUIRenditionKeyValueForAttribute(&a3->identifier, 15);
    if (v7 > 6) {
      uint64_t v8 = +[NSString stringWithFormat:@"%ld - Unnamed idiom", v7];
    }
    else {
      uint64_t v8 = +[NSString stringWithFormat:@"%s", gThemeIdioms[3 * v7 + 2]];
    }
    uint64_t v16 = v8;
    uint64_t v17 = v6;
    uint64_t v18 = CUIRenditionKeyValueForAttribute(&a3->identifier, 16);
    uint64_t v19 = CUIRenditionKeyValueForAttribute(&a3->identifier, 17);
    uint64_t v20 = +[NSString stringWithFormat:@"%ld", CUIRenditionKeyValueForAttribute(&a3->identifier, 1)];
    unsigned int v21 = +[NSString stringWithFormat:@"%ld", CUIRenditionKeyValueForAttribute(&a3->identifier, 2)];
    unsigned int v22 = CUIRenditionKeyValueForAttribute(&a3->identifier, 10);
    if (v22 > 4) {
      id v23 = +[NSString stringWithFormat:@"%ld - Unnamed state value", v22];
    }
    else {
      id v23 = +[NSString stringWithFormat:@"%s", gThemeStates[3 * v22 + 2]];
    }
    uint64_t v24 = v23;
    unsigned int v25 = CUIRenditionKeyValueForAttribute(&a3->identifier, 6);
    if (v25 > 2) {
      id v26 = +[NSString stringWithFormat:@"%ld - Unnamed on/off/mixed value", v25];
    }
    else {
      id v26 = +[NSString stringWithFormat:@"%s", gThemeValues[3 * v25 + 2]];
    }
    return +[NSString stringWithFormat:@"\n\tIdiom: %@\n\tSubtype: %ld\n\tName Identifier: %ld\n\tScale: %ld\n\tElement: %@\n\tPart: %@\n\tState: %@\n\tValue: %@\nin theme store associated with bundle: %@", v16, v18, v19, v17, v20, v21, v24, v26, [(CUIStructuredThemeStore *)self bundleID], v53, v54, v55, v56, v57, v58];
  }
  return result;
}

- (id)renditionNameForKeyList:(_renditionkeytoken *)a3
{
  return [(CUICommonAssetStorage *)self->_store renditionNameForKeyList:a3];
}

- (id)allImageNames
{
  return [(CUICommonAssetStorage *)self->_store allRenditionNames];
}

- (BOOL)containsLookupForName:(id)a3
{
  return [(CUIStructuredThemeStore *)self renditionKeyForName:a3 cursorHotSpot:0] != 0;
}

- (id)imagesWithName:(id)a3
{
  id v5 = +[NSMutableArray array];
  unsigned int v6 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)[(CUIStructuredThemeStore *)self renditionKeyForName:a3], 17);
  store = self->_store;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __42__CUIStructuredThemeStore_imagesWithName___block_invoke;
  v9[3] = &unk_1E5A585D0;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = v5;
  v9[7] = v6;
  [(CUICommonAssetStorage *)store assetKeysMatchingBlock:v9];
  return v5;
}

uint64_t __42__CUIStructuredThemeStore_imagesWithName___block_invoke(uint64_t a1, unsigned __int16 *a2)
{
  if (*(void *)(a1 + 56) == CUIRenditionKeyValueForAttribute(a2, 17))
  {
    unsigned int v4 = [[CUIRenditionKey alloc] initWithKeyList:a2];
    id v5 = [*(id *)(a1 + 32) copyLookupKeySignatureForKey:a2];
    id v6 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "renditionWithKey:usingKeySignature:", a2, v5), "type");
    if ((unint64_t)v6 < 6)
    {
LABEL_5:
      uint64_t v8 = OBJC_CLASS___CUINamedImage_ptr;
    }
    else
    {
      id v7 = 0;
      switch((unint64_t)v6)
      {
        case 0x3E8uLL:
          uint64_t v8 = OBJC_CLASS___CUINamedData_ptr;
          break;
        case 0x3E9uLL:
          uint64_t v8 = OBJC_CLASS___CUINamedExternalLink_ptr;
          break;
        case 0x3EAuLL:
          uint64_t v8 = OBJC_CLASS___CUINamedLayerStack_ptr;
          break;
        case 0x3EBuLL:
        case 0x3EDuLL:
        case 0x3EEuLL:
        case 0x3EFuLL:
        case 0x3F0uLL:
        case 0x3F1uLL:
        case 0x3F3uLL:
        case 0x3F4uLL:
          goto LABEL_8;
        case 0x3ECuLL:
          goto LABEL_5;
        case 0x3F2uLL:
          uint64_t v8 = OBJC_CLASS___CUINamedMultisizeImageSet_ptr;
          break;
        case 0x3F5uLL:
          uint64_t v8 = OBJC_CLASS___CUINamedRecognitionGroup_ptr;
          break;
        default:
          if (v6 != (id)1018) {
            goto LABEL_8;
          }
          uint64_t v8 = OBJC_CLASS___CUINamedSolidLayerStack_ptr;
          break;
      }
    }
    id v7 = [objc_alloc(*v8) initWithName:*(void *)(a1 + 40) usingRenditionKey:v4 fromTheme:*(void *)(*(void *)(a1 + 32) + 32)];
    if (v7) {
      [*(id *)(a1 + 48) addObject:v7];
    }
LABEL_8:
  }
  return 0;
}

- (id)catalogGlobals
{
  id result = [(CUICommonAssetStorage *)self->_store catalogGlobalData];
  if (result)
  {
    id v3 = result;
    id result = [result length];
    if (result)
    {
      uint64_t v6 = 0;
      uint64_t v4 = objc_opt_class();
      uint64_t v5 = objc_opt_class();
      id result = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, objc_opt_class(), 0), v3, &v6);
      if (v6) {
        return 0;
      }
    }
  }
  return result;
}

- (id)nameForAppearanceIdentifier:(unsigned __int16)a3
{
  return [(CUICommonAssetStorage *)self->_store nameForAppearanceIdentifier:a3];
}

- (id)nameForLocalizationIdentifier:(unsigned __int16)a3
{
  return [(CUICommonAssetStorage *)self->_store nameForLocalizationIdentifier:a3];
}

- (BOOL)mainBundle
{
  return *((unsigned char *)self + 64) & 1;
}

id __71__CUIStructuredThemeStore_localizationWorkaroundForKeyList_withLocale___block_invoke()
{
  id result = [objc_alloc((Class)NSSet) initWithArray:&unk_1EF4A6C00];
  localizationWorkaroundForKeyList_withLocale____symbolsWithDigits = (uint64_t)result;
  return result;
}

- (id)mappedAliases
{
  [(CUIStructuredThemeStore *)self aliasForName:&stru_1EF488038];
  id result = self->_aliasDictionary;
  if (result)
  {
    return [result allKeys];
  }
  return result;
}

- (unint64_t)themeIndex
{
  return self->_themeIndex;
}

- (id)deploymentPlatformString
{
  return [(CUICommonAssetStorage *)self->_store deploymentPlatformString];
}

- (id)store
{
  return self->_store;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p, bundleID:'%@' path:'%@'>", NSStringFromClass(v3), self, -[CUIStructuredThemeStore bundleID](self, "bundleID"), objc_msgSend(-[CUIStructuredThemeStore store](self, "store"), "path"));
}

@end