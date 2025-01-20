@interface CUIPlaceholderCUIMutableCommonAssetStorage
- (BOOL)_saveBitmapInfo;
- (BOOL)_writeOutKeyFormatWithWorkaround;
- (BOOL)removeAssetName:(id)a3;
- (BOOL)removeAssetNameKey:(const void *)a3 withLength:(unint64_t)a4;
- (BOOL)setAsset:(id)a3 forKey:(const void *)a4 withLength:(unint64_t)a5;
- (BOOL)setAsset:(id)a3 forKey:(id)a4;
- (BOOL)updateBitmapInfo;
- (BOOL)useBitmapIndex;
- (BOOL)writeToDisk;
- (BOOL)writeToDiskAndCompact:(BOOL)a3;
- (CUIPlaceholderCUIMutableCommonAssetStorage)initWithPath:(id)a3;
- (void)_allocateExtendedMetadata;
- (void)dealloc;
- (void)removeAssetForKey:(const void *)a3 withLength:(unint64_t)a4;
- (void)removeAssetForKey:(id)a3;
- (void)setAppearanceIdentifier:(unsigned __int16)a3 forName:(id)a4;
- (void)setAssociatedChecksum:(unsigned int)a3;
- (void)setAuthoringTool:(id)a3;
- (void)setCatalogGlobalData:(id)a3;
- (void)setColor:(_rgbquad)a3 forName:(const char *)a4 excludeFromFilter:(BOOL)a5;
- (void)setColorSpaceID:(unsigned int)a3;
- (void)setDeploymentPlatform:(id)a3;
- (void)setDeploymentPlatformVersion:(id)a3;
- (void)setEnableLargeCarKeyWorkaround:(BOOL)a3;
- (void)setExternalTags:(id)a3;
- (void)setFontName:(id)a3 baselineOffset:(float)a4 forFontSelector:(id)a5;
- (void)setFontSize:(float)a3 forFontSizeSelector:(id)a4;
- (void)setKeyFormatData:(id)a3;
- (void)setKeySemantics:(int)a3;
- (void)setLocalizationIdentifier:(unsigned __int16)a3 forName:(id)a4;
- (void)setRenditionCount:(unsigned int)a3;
- (void)setRenditionKey:(const _renditionkeytoken *)a3 hotSpot:(CGPoint)a4 forName:(const char *)a5;
- (void)setSchemaVersion:(unsigned int)a3;
- (void)setStorageVersion:(unsigned int)a3;
- (void)setThinningArguments:(id)a3;
- (void)setUseBitmapIndex:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)setVersionString:(const char *)a3;
@end

@implementation CUIPlaceholderCUIMutableCommonAssetStorage

- (CUIPlaceholderCUIMutableCommonAssetStorage)initWithPath:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CUIPlaceholderCUIMutableCommonAssetStorage;
  v4 = [(CUIPlaceholderCUIMutableCommonAssetStorage *)&v21 init];
  if (v4)
  {
    uint64_t v5 = BOMStorageNewWithOptionsAndSys([a3 fileSystemRepresentation], 0, 0);
    if (v5)
    {
      v6 = (unsigned char *)v5;
      *((unsigned char *)v4 + 544) |= 1u;
      [(CUIPlaceholderCUICommonAssetStorage *)v4 _initDefaultHeaderVersion:"EMPTY\n" versionString:0.0];
      uint64_t v7 = BOMStorageNewNamedBlock((uint64_t)v6, "CARHEADER");
      if (v7)
      {
        uint64_t v8 = v7;
        v9 = [(CUIPlaceholderCUICommonAssetStorage *)v4 header];
        BOMStorageCopyToBlock((uint64_t)v6, v8, v9, 0x1B4uLL, v10, v11, v12, v13);
      }
      v14 = BOMTreeNewWithName((uint64_t)v6, "RENDITIONS");
      if (v14)
      {
        [(CUIPlaceholderCUICommonAssetStorage *)v4 setImagedb:v14];
        [(CUIPlaceholderCUICommonAssetStorage *)v4 setFacetKeysdb:BOMTreeNewWithName((uint64_t)v6, "FACETKEYS")];
        return v4;
      }
      _CUILog();
      BOMStorageFree(v6);
      [(CUIPlaceholderCUIMutableCommonAssetStorage *)&v20 release];
    }
    else
    {
      v15 = __error();
      v18 = strerror(*v15);
      _CUILog();
      [(CUIPlaceholderCUIMutableCommonAssetStorage *)&v19 release];
    }
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPlaceholderCUIMutableCommonAssetStorage;
  [(CUIPlaceholderCUICommonAssetStorage *)&v3 dealloc];
}

- (void)setUseBitmapIndex:(BOOL)a3
{
  *((unsigned char *)self + 544) = *((unsigned char *)self + 544) & 0xFE | a3;
}

- (BOOL)useBitmapIndex
{
  return *((unsigned char *)self + 544) & 1;
}

- (void)setKeyFormatData:(id)a3
{
  os_unfair_lock_lock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  uint64_t v5 = [(CUIPlaceholderCUICommonAssetStorage *)self keyfmt];
  if (v5) {
    free(v5);
  }
  -[CUIPlaceholderCUICommonAssetStorage setKeyfmt:](self, "setKeyfmt:", malloc_type_malloc([a3 length], 0x335F74BBuLL));
  objc_msgSend(a3, "getBytes:length:", -[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt"), objc_msgSend(a3, "length"));
  uint64_t v6 = BOMTreeStorage((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self imagedb]);
  if (!BOMStorageGetNamedBlock(v6, "KEYFORMAT"))
  {
    uint64_t v7 = BOMStorageNewNamedBlock(v6, "KEYFORMAT");
    uint64_t v8 = [(CUIPlaceholderCUICommonAssetStorage *)self keyfmt];
    v9 = [(CUIPlaceholderCUICommonAssetStorage *)self keyfmt];
    BOMStorageCopyToBlock(v6, v7, v8, 4 * (v9->var2 + 3), v10, v11, v12, v13);
  }
  v14 = [(CUIPlaceholderCUICommonAssetStorage *)self lock];

  os_unfair_lock_unlock(v14);
}

- (void)setKeySemantics:(int)a3
{
  if ([(CUIPlaceholderCUICommonAssetStorage *)self header]) {
    *(_DWORD *)([(CUIPlaceholderCUICommonAssetStorage *)self header] + 432) = a3;
  }
}

- (void)setStorageVersion:(unsigned int)a3
{
  if ([(CUIPlaceholderCUICommonAssetStorage *)self header]) {
    *(_DWORD *)([(CUIPlaceholderCUICommonAssetStorage *)self header] + 8) = a3;
  }
}

- (void)setVersionString:(const char *)a3
{
  uint64_t v5 = [(CUIPlaceholderCUICommonAssetStorage *)self header];
  if (a3 && v5)
  {
    uint64_t v6 = (char *)([(CUIPlaceholderCUICommonAssetStorage *)self header] + 148);
    strncpy(v6, a3, 0xFFuLL);
  }
}

- (void)setSchemaVersion:(unsigned int)a3
{
  if ([(CUIPlaceholderCUICommonAssetStorage *)self header]) {
    *(_DWORD *)([(CUIPlaceholderCUICommonAssetStorage *)self header] + 424) = a3;
  }
}

- (void)setRenditionCount:(unsigned int)a3
{
  if ([(CUIPlaceholderCUICommonAssetStorage *)self header]) {
    *(_DWORD *)([(CUIPlaceholderCUICommonAssetStorage *)self header] + 16) = a3;
  }
}

- (void)setUuid:(id)a3
{
  if ([(CUIPlaceholderCUICommonAssetStorage *)self header])
  {
    uint64_t v5 = [(CUIPlaceholderCUICommonAssetStorage *)self header] + 404;
    [a3 getUUIDBytes:v5];
  }
}

- (void)setAssociatedChecksum:(unsigned int)a3
{
  if ([(CUIPlaceholderCUICommonAssetStorage *)self header]) {
    *(_DWORD *)([(CUIPlaceholderCUICommonAssetStorage *)self header] + 420) = a3;
  }
}

- (void)setColorSpaceID:(unsigned int)a3
{
  if ([(CUIPlaceholderCUICommonAssetStorage *)self header]) {
    *(_DWORD *)([(CUIPlaceholderCUICommonAssetStorage *)self header] + 428) = a3;
  }
}

- (void)setEnableLargeCarKeyWorkaround:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 544) = *((unsigned char *)self + 544) & 0xFD | v3;
}

- (void)_allocateExtendedMetadata
{
  if (![(CUIPlaceholderCUICommonAssetStorage *)self extendedMetadata])
  {
    [(CUIPlaceholderCUICommonAssetStorage *)self setExtendedMetadata:malloc_type_calloc(1uLL, 0x404uLL, 0x100004084B5CCE0uLL)];
    *(_DWORD *)[(CUIPlaceholderCUICommonAssetStorage *)self extendedMetadata] = 1096041805;
  }
}

- (void)setThinningArguments:(id)a3
{
  [(CUIPlaceholderCUIMutableCommonAssetStorage *)self _allocateExtendedMetadata];
  if ([a3 length])
  {
    uint64_t v5 = (char *)([(CUIPlaceholderCUICommonAssetStorage *)self extendedMetadata] + 4);
    uint64_t v6 = (const char *)[a3 UTF8String];
    strncpy(v5, v6, 0xFFuLL);
  }
}

- (void)setDeploymentPlatform:(id)a3
{
  [(CUIPlaceholderCUIMutableCommonAssetStorage *)self _allocateExtendedMetadata];
  if ([a3 length])
  {
    uint64_t v5 = (char *)([(CUIPlaceholderCUICommonAssetStorage *)self extendedMetadata] + 516);
    uint64_t v6 = (const char *)[a3 UTF8String];
    strncpy(v5, v6, 0xFFuLL);
  }
}

- (void)setDeploymentPlatformVersion:(id)a3
{
  [(CUIPlaceholderCUIMutableCommonAssetStorage *)self _allocateExtendedMetadata];
  if ([a3 length])
  {
    uint64_t v5 = (char *)([(CUIPlaceholderCUICommonAssetStorage *)self extendedMetadata] + 260);
    uint64_t v6 = (const char *)[a3 UTF8String];
    strncpy(v5, v6, 0xFFuLL);
  }
}

- (void)setAuthoringTool:(id)a3
{
  [(CUIPlaceholderCUIMutableCommonAssetStorage *)self _allocateExtendedMetadata];
  if ([a3 length])
  {
    uint64_t v5 = (char *)([(CUIPlaceholderCUICommonAssetStorage *)self extendedMetadata] + 772);
    uint64_t v6 = (const char *)[a3 UTF8String];
    strncpy(v5, v6, 0xFFuLL);
  }
}

- (BOOL)setAsset:(id)a3 forKey:(id)a4
{
  uint64_t v7 = [a4 bytes];
  uint64_t v8 = [a4 length];

  return [(CUIPlaceholderCUIMutableCommonAssetStorage *)self setAsset:a3 forKey:v7 withLength:v8];
}

- (BOOL)setAsset:(id)a3 forKey:(const void *)a4 withLength:(unint64_t)a5
{
  os_unfair_lock_lock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  int v9 = BOMTreeSetValue((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"), (void *)a4, a5, (const void *)[a3 bytes], objc_msgSend(a3, "length"));
  int v10 = v9;
  if (self->_bitmapInfo)
  {
    if (v9)
    {
LABEL_3:
      _CUILog();
      return v10 == 0;
    }
  }
  else
  {
    self->_bitmapInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = [(CUIPlaceholderCUICommonAssetStorage *)self keyFormat];
  uint64_t var2 = v11->var2;
  if (var2)
  {
    uint64_t v13 = v11;
    var3 = v11->var3;
    v15 = a4;
    while (1)
    {
      int v16 = *var3++;
      if (v16 == 17) {
        break;
      }
      ++v15;
      if (!--var2) {
        goto LABEL_13;
      }
    }
    uint64_t v17 = (unsigned __int16)*v15;
    if (*v15)
    {
      unint64_t v18 = 0;
      do
      {
        [(CUIPlaceholderCUICommonAssetStorage *)self _addBitmapIndexForNameIdentifier:v17 attribute:v13->var3[v18] withValue:*((unsigned __int16 *)a4 + v18) toDictionary:self->_bitmapInfo];
        ++v18;
      }
      while (v18 < v13->var2);
    }
  }
LABEL_13:
  os_unfair_lock_unlock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  return v10 == 0;
}

- (void)setCatalogGlobalData:(id)a3
{
  os_unfair_lock_lock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  [(CUIPlaceholderCUICommonAssetStorage *)self setGlobals:a3];
  uint64_t v5 = [(CUIPlaceholderCUICommonAssetStorage *)self lock];

  os_unfair_lock_unlock(v5);
}

- (void)setAppearanceIdentifier:(unsigned __int16)a3 forName:(id)a4
{
  unsigned int v5 = a3;
  unsigned __int16 v14 = a3;
  CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)a4);
  uint64_t v8 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xB48290CFuLL);
  CFStringGetFileSystemRepresentation((CFStringRef)a4, v8, MaximumSizeOfFileSystemRepresentation);
  os_unfair_lock_lock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  if (![(CUIPlaceholderCUICommonAssetStorage *)self appearancedb])
  {
    uint64_t v9 = BOMTreeStorage((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self imagedb]);
    [(CUIPlaceholderCUICommonAssetStorage *)self setAppearancedb:BOMTreeNewWithName(v9, "APPEARANCEKEYS")];
  }
  int v10 = [(CUIPlaceholderCUICommonAssetStorage *)self appearancedb];
  size_t v11 = strlen(v8);
  if (BOMTreeSetValue((uint64_t)v10, v8, v11, &v14, 2uLL))
  {
    id v12 = a4;
    uint64_t v13 = v5;
    _CUILog();
  }
  os_unfair_lock_unlock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  free(v8);
}

- (void)setLocalizationIdentifier:(unsigned __int16)a3 forName:(id)a4
{
  unsigned int v5 = a3;
  unsigned __int16 v14 = a3;
  CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)a4);
  uint64_t v8 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x4C7C2D5CuLL);
  CFStringGetFileSystemRepresentation((CFStringRef)a4, v8, MaximumSizeOfFileSystemRepresentation);
  os_unfair_lock_lock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  if (![(CUIPlaceholderCUICommonAssetStorage *)self localizationdb])
  {
    uint64_t v9 = BOMTreeStorage((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self imagedb]);
    [(CUIPlaceholderCUICommonAssetStorage *)self setLocalizationdb:BOMTreeNewWithName(v9, "LOCALIZATIONKEYS")];
  }
  int v10 = [(CUIPlaceholderCUICommonAssetStorage *)self localizationdb];
  size_t v11 = strlen(v8);
  if (BOMTreeSetValue((uint64_t)v10, v8, v11, &v14, 2uLL))
  {
    id v12 = a4;
    uint64_t v13 = v5;
    _CUILog();
  }
  os_unfair_lock_unlock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  free(v8);
}

- (BOOL)updateBitmapInfo
{
  os_unfair_lock_lock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);

  char v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_bitmapInfo = v3;
  BOOL v4 = [(CUIPlaceholderCUICommonAssetStorage *)self _buildBitmapInfoIntoDictionary:v3];
  os_unfair_lock_unlock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  return v4;
}

- (void)setColor:(_rgbquad)a3 forName:(const char *)a4 excludeFromFilter:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  if (![(CUIPlaceholderCUICommonAssetStorage *)self colordb])
  {
    uint64_t v9 = BOMTreeStorage((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self imagedb]);
    [(CUIPlaceholderCUICommonAssetStorage *)self setColordb:BOMTreeNewWithName(v9, "COLORS")];
  }
  if (a4 && [(CUIPlaceholderCUICommonAssetStorage *)self colordb])
  {
    int v12 = 0;
    memset(v11, 0, sizeof(v11));
    __strlcpy_chk();
    v10[0] = 1;
    v10[1] = v5;
    v10[2] = a3;
    if (BOMTreeSetValue((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self colordb], v11, 0x84uLL, v10, 0xCuLL))_CUILog(); {
    os_unfair_lock_unlock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
    }
  }
}

- (void)setFontName:(id)a3 baselineOffset:(float)a4 forFontSelector:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  if ([(CUIPlaceholderCUICommonAssetStorage *)self fontdb])
  {
    if (!a5) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v9 = BOMTreeStorage((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self imagedb]);
    [(CUIPlaceholderCUICommonAssetStorage *)self setFontdb:BOMTreeNewWithName(v9, "FONTS")];
    if (!a5)
    {
LABEL_11:
      int v10 = [(CUIPlaceholderCUICommonAssetStorage *)self lock];
      os_unfair_lock_unlock(v10);
      return;
    }
  }
  if (![(CUIPlaceholderCUICommonAssetStorage *)self fontdb]) {
    goto LABEL_11;
  }
  memset(v13, 0, sizeof(v13));
  if (objc_msgSend(a5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v13, 128, 0, 1, 0, 0, objc_msgSend(a5, "length"), 0))
  {
    float v12 = 0.0;
    memset(v11, 0, sizeof(v11));
    if (objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v11, 128, 0, 1, 0, 0, objc_msgSend(a3, "length"), 0))
    {
      float v12 = a4;
      if (BOMTreeSetValue((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self fontdb], v13, 0x80uLL, v11, 0x84uLL))_CUILog(); {
    }
      }
  }
  os_unfair_lock_unlock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
}

- (void)setFontSize:(float)a3 forFontSizeSelector:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  if ([(CUIPlaceholderCUICommonAssetStorage *)self fontsizedb])
  {
    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v7 = BOMTreeStorage((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self imagedb]);
    [(CUIPlaceholderCUICommonAssetStorage *)self setFontsizedb:BOMTreeNewWithName(v7, "FONTSIZES")];
    if (!a4)
    {
LABEL_10:
      uint64_t v8 = [(CUIPlaceholderCUICommonAssetStorage *)self lock];
      os_unfair_lock_unlock(v8);
      return;
    }
  }
  if (![(CUIPlaceholderCUICommonAssetStorage *)self fontsizedb]) {
    goto LABEL_10;
  }
  memset(v10, 0, sizeof(v10));
  if (objc_msgSend(a4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v10, 128, 0, 1, 0, 0, objc_msgSend(a4, "length"), 0))
  {
    float v9 = a3;
    if (BOMTreeSetValue((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self fontsizedb], v10, 0x80uLL, &v9, 4uLL))_CUILog(); {
  }
    }
  os_unfair_lock_unlock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
}

- (void)setExternalTags:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)CUIPlaceholderCUIMutableCommonAssetStorage;
  uint64_t v26 = 0;
  [(CUIPlaceholderCUICommonAssetStorage *)&v25 setExternalTags:a3];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v27 = 1163414603;
  int v28 = objc_msgSend(-[CUIPlaceholderCUICommonAssetStorage externalTags](self, "externalTags"), "count");
  [v4 appendBytes:&v27 length:12];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(CUIPlaceholderCUICommonAssetStorage *)self externalTags];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        CFStringRef v10 = *(const __CFString **)(*((void *)&v21 + 1) + 8 * i);
        CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v10);
        float v12 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x6A76F08CuLL);
        CFStringGetFileSystemRepresentation(v10, v12, MaximumSizeOfFileSystemRepresentation);
        LODWORD(v26) = 1008;
        HIDWORD(v26) = strnlen(v12, MaximumSizeOfFileSystemRepresentation) + 1;
        [v4 appendBytes:&v26 length:8];
        [v4 appendBytes:v12 length:HIDWORD(v26)];
        free(v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v7);
  }
  uint64_t v13 = BOMTreeStorage((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self imagedb]);
  uint64_t NamedBlock = BOMStorageGetNamedBlock(v13, "EXTERNAL_KEYS");
  if (NamedBlock || (uint64_t NamedBlock = BOMStorageNewNamedBlock(v13, "EXTERNAL_KEYS"), NamedBlock))
  {
    v15 = (const void *)[v4 bytes];
    size_t v16 = [v4 length];
    BOMStorageCopyToBlock(v13, NamedBlock, v15, v16, v17, v18, v19, v20);
  }
}

- (void)removeAssetForKey:(id)a3
{
  uint64_t v5 = [a3 bytes];
  uint64_t v6 = [a3 length];

  [(CUIPlaceholderCUIMutableCommonAssetStorage *)self removeAssetForKey:v5 withLength:v6];
}

- (void)removeAssetForKey:(const void *)a3 withLength:(unint64_t)a4
{
  os_unfair_lock_lock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  uint64_t v7 = [(CUIPlaceholderCUICommonAssetStorage *)self imagedb];
  if (BOMTreeGetValue((uint64_t)v7, (void *)a3, a4, v8, v9, v10, v11, v12)
    && BOMTreeRemoveValue((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self imagedb], (void *)a3, a4))
  {
    _CUILog();
  }
  uint64_t v13 = [(CUIPlaceholderCUICommonAssetStorage *)self lock];

  os_unfair_lock_unlock(v13);
}

- (BOOL)removeAssetName:(id)a3
{
  uint64_t v5 = [a3 UTF8String];
  uint64_t v6 = [a3 length];

  return [(CUIPlaceholderCUIMutableCommonAssetStorage *)self removeAssetNameKey:v5 withLength:v6];
}

- (BOOL)removeAssetNameKey:(const void *)a3 withLength:(unint64_t)a4
{
  if (a3)
  {
    os_unfair_lock_lock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
    uint64_t v7 = [(CUIPlaceholderCUICommonAssetStorage *)self facetKeysdb];
    if (BOMTreeGetValue((uint64_t)v7, (void *)a3, a4, v8, v9, v10, v11, v12))
    {
      if (!BOMTreeRemoveValue((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self facetKeysdb], (void *)a3, a4))
      {
        BOOL v13 = 1;
        goto LABEL_8;
      }
      _CUILog();
    }
    BOOL v13 = 0;
LABEL_8:
    os_unfair_lock_unlock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
    return v13;
  }
  return 0;
}

- (void)setRenditionKey:(const _renditionkeytoken *)a3 hotSpot:(CGPoint)a4 forName:(const char *)a5
{
  double y = a4.y;
  double x = a4.x;
  os_unfair_lock_lock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  unsigned int v10 = CUIRenditionKeyTokenCount((uint64_t)a3);
  unsigned __int16 v16 = v10;
  __int16 v15 = (int)x;
  __int16 v14 = (int)y;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:4 * v10 + 6];
  [v11 appendBytes:&v15 length:2];
  [v11 appendBytes:&v14 length:2];
  [v11 appendBytes:&v16 length:2];
  [v11 appendBytes:a3 length:4 * v16];
  uint64_t v12 = [(CUIPlaceholderCUICommonAssetStorage *)self facetKeysdb];
  size_t v13 = strlen(a5);
  if (BOMTreeSetValue((uint64_t)v12, (void *)a5, v13, (const void *)[v11 bytes], objc_msgSend(v11, "length")))_CUILog(); {

  }
  os_unfair_lock_unlock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
}

- (BOOL)_saveBitmapInfo
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!self->_bitmapInfo || (*((unsigned char *)self + 544) & 1) == 0) {
    return 1;
  }
  if ([(CUIPlaceholderCUICommonAssetStorage *)self bitmapKeydb])
  {
    BOMTreeRemoveAndFree((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self bitmapKeydb]);
    [(CUIPlaceholderCUICommonAssetStorage *)self setBitmapKeydb:0];
  }
  if (![(CUIPlaceholderCUICommonAssetStorage *)self bitmapKeydb])
  {
    uint64_t v4 = BOMTreeStorage((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self imagedb]);
    [(CUIPlaceholderCUICommonAssetStorage *)self setBitmapKeydb:BOMTreeNewWithOptions(v4, 0, "BITMAPKEYS", 1024, 1)];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  bitmapInfo = self->_bitmapInfo;
  uint64_t v6 = [(NSMutableDictionary *)bitmapInfo countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_10:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(bitmapInfo);
      }
      unsigned int v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      unsigned __int16 v11 = [v10 integerValue];
      uint64_t v12 = (void *)[(NSMutableDictionary *)self->_bitmapInfo objectForKey:v10];
      if ([v12 numberOfBitsSet])
      {
        size_t v13 = (void *)[v12 archivedData];
        if (BOMTreeSetValue((uint64_t)-[CUIPlaceholderCUICommonAssetStorage bitmapKeydb](self, "bitmapKeydb"), (void *)v11, 2uLL, (const void *)[v13 bytes], objc_msgSend(v13, "length")))break; {
      }
        }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableDictionary *)bitmapInfo countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_10;
        }
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    if (!BOMTreeCommit((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self bitmapKeydb])) {
      return 1;
    }
  }
  return 0;
}

- (BOOL)_writeOutKeyFormatWithWorkaround
{
  uint64_t v3 = BOMTreeStorage((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self imagedb]);
  if (![(CUIPlaceholderCUICommonAssetStorage *)self keyfmt][8]) {
    return 0;
  }
  unint64_t v4 = 0;
  uint64_t v5 = 0;
  do
  {
    if (([(CUIPlaceholderCUICommonAssetStorage *)self keyfmt] + 4 * v4)[12] >= 0x18u)
    {
      if (!v5) {
        uint64_t v5 = malloc_type_calloc([(CUIPlaceholderCUICommonAssetStorage *)self keyfmt][8], 4uLL, 0x100004052888210uLL);
      }
      v5[v4] = ([(CUIPlaceholderCUICommonAssetStorage *)self keyfmt] + 4 * v4)[12];
    }
    ++v4;
  }
  while (v4 < [(CUIPlaceholderCUICommonAssetStorage *)self keyfmt][8]);
  if (!v5) {
    return 0;
  }
  uint64_t NamedBlock = BOMStorageGetNamedBlock(v3, "KEYFORMAT");
  uint64_t v7 = BOMStorageGetNamedBlock(v3, "KEYFORMATWORKAROUND");
  if (!v7) {
    uint64_t v7 = BOMStorageNewNamedBlock(v3, "KEYFORMATWORKAROUND");
  }
  uint64_t v8 = malloc_type_malloc(4 * [(CUIPlaceholderCUICommonAssetStorage *)self keyfmt][8] + 12, 0x6899F812uLL);
  memcpy(v8, [(CUIPlaceholderCUICommonAssetStorage *)self keyfmt], 4 * ([(CUIPlaceholderCUICommonAssetStorage *)self keyfmt][8] + 3));
  if ([(CUIPlaceholderCUICommonAssetStorage *)self keyfmt][8])
  {
    unint64_t v13 = 0;
    do
    {
      if (v5[v13]) {
        v8[v13 + 3] = 5;
      }
      ++v13;
    }
    while (v13 < [(CUIPlaceholderCUICommonAssetStorage *)self keyfmt][8]);
  }
  BOMStorageCopyToBlock(v3, NamedBlock, v8, 4 * (v8[2] + 3), v9, v10, v11, v12);
  BOMStorageCopyToBlock(v3, v7, v5, 4 * v8[2], v14, v15, v16, v17);
  free(v8);
  free(v5);
  return 1;
}

- (BOOL)writeToDiskAndCompact:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_lock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  uint64_t v5 = BOMTreeStorage((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self imagedb]);
  uint64_t NamedBlock = BOMStorageGetNamedBlock(v5, "CARHEADER");
  uint64_t v7 = [(CUIPlaceholderCUICommonAssetStorage *)self header];
  BOMStorageCopyToBlock(v5, NamedBlock, v7, 0x1B4uLL, v8, v9, v10, v11);
  if ([(CUIPlaceholderCUICommonAssetStorage *)self extendedMetadata])
  {
    uint64_t v12 = BOMStorageGetNamedBlock(v5, "EXTENDED_METADATA");
    if (!v12) {
      uint64_t v12 = BOMStorageNewNamedBlock(v5, "EXTENDED_METADATA");
    }
    unint64_t v13 = [(CUIPlaceholderCUICommonAssetStorage *)self extendedMetadata];
    BOMStorageCopyToBlock(v5, v12, v13, 0x404uLL, v14, v15, v16, v17);
  }
  if ([(NSData *)[(CUIPlaceholderCUICommonAssetStorage *)self globals] length])
  {
    uint64_t v18 = BOMStorageGetNamedBlock(v5, "CARGLOBALS");
    if (!v18) {
      uint64_t v18 = BOMStorageNewNamedBlock(v5, "CARGLOBALS");
    }
    uint64_t v19 = [(NSData *)[(CUIPlaceholderCUICommonAssetStorage *)self globals] bytes];
    size_t v20 = [(NSData *)[(CUIPlaceholderCUICommonAssetStorage *)self globals] length];
    BOMStorageCopyToBlock(v5, v18, v19, v20, v21, v22, v23, v24);
  }
  if ((*((unsigned char *)self + 544) & 2) != 0) {
    [(CUIPlaceholderCUIMutableCommonAssetStorage *)self _writeOutKeyFormatWithWorkaround];
  }
  BOOL v25 = !BOMTreeCommit((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self imagedb])
     && (![(CUIPlaceholderCUICommonAssetStorage *)self colordb]
      || !BOMTreeCommit((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self colordb]))
     && (![(CUIPlaceholderCUICommonAssetStorage *)self fontdb]
      || !BOMTreeCommit((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self fontdb]))
     && (![(CUIPlaceholderCUICommonAssetStorage *)self fontsizedb]
      || !BOMTreeCommit((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self fontsizedb]))
     && (![(CUIPlaceholderCUICommonAssetStorage *)self facetKeysdb]
      || !BOMTreeCommit((uint64_t)[(CUIPlaceholderCUICommonAssetStorage *)self facetKeysdb]))
     && (!self->_bitmapInfo || [(CUIPlaceholderCUIMutableCommonAssetStorage *)self _saveBitmapInfo])
     && (!v3 || !BOMStorageCompact(v5))
     && BOMStorageCommit(v5) == 0;
  os_unfair_lock_unlock([(CUIPlaceholderCUICommonAssetStorage *)self lock]);
  return v25;
}

- (BOOL)writeToDisk
{
  return [(CUIPlaceholderCUIMutableCommonAssetStorage *)self writeToDiskAndCompact:0];
}

@end