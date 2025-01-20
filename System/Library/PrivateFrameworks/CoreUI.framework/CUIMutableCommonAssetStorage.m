@interface CUIMutableCommonAssetStorage
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
- (CUIMutableCommonAssetStorage)initWithPath:(id)a3;
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

@implementation CUIMutableCommonAssetStorage

- (CUIMutableCommonAssetStorage)initWithPath:(id)a3
{
  v31.receiver = self;
  v31.super_class = (Class)CUIMutableCommonAssetStorage;
  v4 = [(CUIMutableCommonAssetStorage *)&v31 init];
  if (v4)
  {
    uint64_t v5 = BOMStorageNewWithOptionsAndSys((uint64_t)[a3 fileSystemRepresentation], 0, 0);
    if (v5)
    {
      v6 = (unsigned char *)v5;
      *((unsigned char *)v4 + 544) |= 1u;
      [(CUICommonAssetStorage *)v4 _initDefaultHeaderVersion:"@(#)PROGRAM:CoreUI  PROJECT:CoreUI-917.3\n" versionString:917.3];
      uint64_t v7 = BOMStorageNewNamedBlock((uint64_t)v6, "CARHEADER");
      if (v7)
      {
        uint64_t v8 = v7;
        v9 = [(CUICommonAssetStorage *)v4 header];
        BOMStorageCopyToBlock((uint64_t)v6, v8, v9, 0x1B4uLL, v10, v11, v12, v13);
      }
      v14 = BOMTreeNewWithName((uint64_t)v6, "RENDITIONS");
      if (v14)
      {
        [(CUICommonAssetStorage *)v4 setImagedb:v14];
        [(CUICommonAssetStorage *)v4 setFacetKeysdb:BOMTreeNewWithName((uint64_t)v6, "FACETKEYS")];
        return v4;
      }
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to create image store in %@", v15, v16, v17, v18, v19, v20, (uint64_t)a3);
      BOMStorageFree(v6);
      v30.receiver = v4;
      v30.super_class = (Class)CUIMutableCommonAssetStorage;
      [(CUIMutableCommonAssetStorage *)&v30 release];
    }
    else
    {
      v21 = __error();
      strerror(*v21);
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to create storage file %@ error '%s'", v22, v23, v24, v25, v26, v27, (uint64_t)a3);
      v29.receiver = v4;
      v29.super_class = (Class)CUIMutableCommonAssetStorage;
      [(CUIMutableCommonAssetStorage *)&v29 release];
    }
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIMutableCommonAssetStorage;
  [(CUICommonAssetStorage *)&v3 dealloc];
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
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  uint64_t v5 = [(CUICommonAssetStorage *)self keyfmt];
  if (v5) {
    free(v5);
  }
  -[CUICommonAssetStorage setKeyfmt:](self, "setKeyfmt:", malloc_type_malloc((size_t)[a3 length], 0x335F74BBuLL));
  objc_msgSend(a3, "getBytes:length:", -[CUICommonAssetStorage keyfmt](self, "keyfmt"), objc_msgSend(a3, "length"));
  uint64_t v6 = BOMTreeStorage((uint64_t)[(CUICommonAssetStorage *)self imagedb]);
  if (!BOMStorageGetNamedBlock(v6, "KEYFORMAT"))
  {
    uint64_t v7 = BOMStorageNewNamedBlock(v6, "KEYFORMAT");
    uint64_t v8 = [(CUICommonAssetStorage *)self keyfmt];
    v9 = [(CUICommonAssetStorage *)self keyfmt];
    BOMStorageCopyToBlock(v6, v7, v8, 4 * (v9->var2 + 3), v10, v11, v12, v13);
  }
  v14 = [(CUICommonAssetStorage *)self lock];
  os_unfair_lock_unlock(v14);
}

- (void)setKeySemantics:(int)a3
{
  if ([(CUICommonAssetStorage *)self header]) {
    *((_DWORD *)[(CUICommonAssetStorage *)self header] + 108) = a3;
  }
}

- (void)setStorageVersion:(unsigned int)a3
{
  if ([(CUICommonAssetStorage *)self header]) {
    *((_DWORD *)[(CUICommonAssetStorage *)self header] + 2) = a3;
  }
}

- (void)setVersionString:(const char *)a3
{
  uint64_t v5 = [(CUICommonAssetStorage *)self header];
  if (a3 && v5)
  {
    uint64_t v6 = (char *)[(CUICommonAssetStorage *)self header] + 148;
    strncpy(v6, a3, 0xFFuLL);
  }
}

- (void)setSchemaVersion:(unsigned int)a3
{
  if ([(CUICommonAssetStorage *)self header]) {
    *((_DWORD *)[(CUICommonAssetStorage *)self header] + 106) = a3;
  }
}

- (void)setRenditionCount:(unsigned int)a3
{
  if ([(CUICommonAssetStorage *)self header]) {
    *((_DWORD *)[(CUICommonAssetStorage *)self header] + 4) = a3;
  }
}

- (void)setUuid:(id)a3
{
  if ([(CUICommonAssetStorage *)self header])
  {
    uint64_t v5 = (char *)[(CUICommonAssetStorage *)self header] + 404;
    [a3 getUUIDBytes:v5];
  }
}

- (void)setAssociatedChecksum:(unsigned int)a3
{
  if ([(CUICommonAssetStorage *)self header]) {
    *((_DWORD *)[(CUICommonAssetStorage *)self header] + 105) = a3;
  }
}

- (void)setColorSpaceID:(unsigned int)a3
{
  if ([(CUICommonAssetStorage *)self header]) {
    *((_DWORD *)[(CUICommonAssetStorage *)self header] + 107) = a3;
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
  if (![(CUICommonAssetStorage *)self extendedMetadata])
  {
    [(CUICommonAssetStorage *)self setExtendedMetadata:malloc_type_calloc(1uLL, 0x404uLL, 0x100004084B5CCE0uLL)];
    *(_DWORD *)[(CUICommonAssetStorage *)self extendedMetadata] = 1096041805;
  }
}

- (void)setThinningArguments:(id)a3
{
  [(CUIMutableCommonAssetStorage *)self _allocateExtendedMetadata];
  if ([a3 length])
  {
    uint64_t v5 = (char *)[(CUICommonAssetStorage *)self extendedMetadata] + 4;
    uint64_t v6 = (const char *)[a3 UTF8String];
    strncpy(v5, v6, 0xFFuLL);
  }
}

- (void)setDeploymentPlatform:(id)a3
{
  [(CUIMutableCommonAssetStorage *)self _allocateExtendedMetadata];
  if ([a3 length])
  {
    uint64_t v5 = (char *)[(CUICommonAssetStorage *)self extendedMetadata] + 516;
    uint64_t v6 = (const char *)[a3 UTF8String];
    strncpy(v5, v6, 0xFFuLL);
  }
}

- (void)setDeploymentPlatformVersion:(id)a3
{
  [(CUIMutableCommonAssetStorage *)self _allocateExtendedMetadata];
  if ([a3 length])
  {
    uint64_t v5 = (char *)[(CUICommonAssetStorage *)self extendedMetadata] + 260;
    uint64_t v6 = (const char *)[a3 UTF8String];
    strncpy(v5, v6, 0xFFuLL);
  }
}

- (void)setAuthoringTool:(id)a3
{
  [(CUIMutableCommonAssetStorage *)self _allocateExtendedMetadata];
  if ([a3 length])
  {
    uint64_t v5 = (char *)[(CUICommonAssetStorage *)self extendedMetadata] + 772;
    uint64_t v6 = (const char *)[a3 UTF8String];
    strncpy(v5, v6, 0xFFuLL);
  }
}

- (BOOL)setAsset:(id)a3 forKey:(id)a4
{
  id v7 = [a4 bytes];
  id v8 = [a4 length];
  return [(CUIMutableCommonAssetStorage *)self setAsset:a3 forKey:v7 withLength:v8];
}

- (BOOL)setAsset:(id)a3 forKey:(const void *)a4 withLength:(unint64_t)a5
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  v9 = [(CUICommonAssetStorage *)self imagedb];
  id v10 = [a3 bytes];
  id v11 = [a3 length];
  int v15 = BOMTreeSetValue((uint64_t)v9, (void *)a4, a5, v10, (size_t)v11, v12, v13, v14);
  int v22 = v15;
  if (self->_bitmapInfo)
  {
    if (v15)
    {
LABEL_3:
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to add asset to store", v16, v17, v18, v19, v20, v21, v32);
      return v22 == 0;
    }
  }
  else
  {
    self->_bitmapInfo = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (v22) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = [(CUICommonAssetStorage *)self keyFormat];
  uint64_t var2 = v23->var2;
  if (var2)
  {
    uint64_t v25 = v23;
    var3 = v23->var3;
    uint64_t v27 = a4;
    while (1)
    {
      int v28 = *var3++;
      if (v28 == 17) {
        break;
      }
      ++v27;
      if (!--var2) {
        goto LABEL_13;
      }
    }
    uint64_t v29 = (unsigned __int16)*v27;
    if (*v27)
    {
      unint64_t v30 = 0;
      do
      {
        [(CUICommonAssetStorage *)self _addBitmapIndexForNameIdentifier:v29 attribute:v25->var3[v30] withValue:*((unsigned __int16 *)a4 + v30) toDictionary:self->_bitmapInfo];
        ++v30;
      }
      while (v30 < v25->var2);
    }
  }
LABEL_13:
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v22 == 0;
}

- (void)setCatalogGlobalData:(id)a3
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  [(CUICommonAssetStorage *)self setGlobals:a3];
  uint64_t v5 = [(CUICommonAssetStorage *)self lock];
  os_unfair_lock_unlock(v5);
}

- (void)setAppearanceIdentifier:(unsigned __int16)a3 forName:(id)a4
{
  unsigned __int16 v20 = a3;
  CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)a4);
  id v7 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xB48290CFuLL);
  CFStringGetFileSystemRepresentation((CFStringRef)a4, v7, MaximumSizeOfFileSystemRepresentation);
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  if (![(CUICommonAssetStorage *)self appearancedb])
  {
    uint64_t v8 = BOMTreeStorage((uint64_t)[(CUICommonAssetStorage *)self imagedb]);
    [(CUICommonAssetStorage *)self setAppearancedb:BOMTreeNewWithName(v8, "APPEARANCEKEYS")];
  }
  v9 = [(CUICommonAssetStorage *)self appearancedb];
  size_t v10 = strlen(v7);
  if (BOMTreeSetValue((uint64_t)v9, v7, v10, &v20, 2uLL, v11, v12, v13)) {
    _CUILog(4, (uint64_t)"CoreUI: Error: unable to add look identifier '%@' with value '%d' to store", v14, v15, v16, v17, v18, v19, (uint64_t)a4);
  }
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  free(v7);
}

- (void)setLocalizationIdentifier:(unsigned __int16)a3 forName:(id)a4
{
  unsigned __int16 v20 = a3;
  CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)a4);
  id v7 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x4C7C2D5CuLL);
  CFStringGetFileSystemRepresentation((CFStringRef)a4, v7, MaximumSizeOfFileSystemRepresentation);
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  if (![(CUICommonAssetStorage *)self localizationdb])
  {
    uint64_t v8 = BOMTreeStorage((uint64_t)[(CUICommonAssetStorage *)self imagedb]);
    [(CUICommonAssetStorage *)self setLocalizationdb:BOMTreeNewWithName(v8, "LOCALIZATIONKEYS")];
  }
  v9 = [(CUICommonAssetStorage *)self localizationdb];
  size_t v10 = strlen(v7);
  if (BOMTreeSetValue((uint64_t)v9, v7, v10, &v20, 2uLL, v11, v12, v13)) {
    _CUILog(4, (uint64_t)"CoreUI: Error: unable to add localization identifier '%@' with value '%d' to store", v14, v15, v16, v17, v18, v19, (uint64_t)a4);
  }
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  free(v7);
}

- (BOOL)updateBitmapInfo
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);

  char v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_bitmapInfo = v3;
  BOOL v4 = [(CUICommonAssetStorage *)self _buildBitmapInfoIntoDictionary:v3];
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v4;
}

- (void)setColor:(_rgbquad)a3 forName:(const char *)a4 excludeFromFilter:(BOOL)a5
{
  BOOL v5 = a5;
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  if (![(CUICommonAssetStorage *)self colordb])
  {
    uint64_t v9 = BOMTreeStorage((uint64_t)[(CUICommonAssetStorage *)self imagedb]);
    [(CUICommonAssetStorage *)self setColordb:BOMTreeNewWithName(v9, "COLORS")];
  }
  if (a4 && [(CUICommonAssetStorage *)self colordb])
  {
    int v24 = 0;
    memset(v23, 0, sizeof(v23));
    __strlcpy_chk();
    HIDWORD(v20) = 1;
    BOOL v21 = v5;
    _rgbquad v22 = a3;
    size_t v10 = [(CUICommonAssetStorage *)self colordb];
    if (BOMTreeSetValue((uint64_t)v10, v23, 0x84uLL, (char *)&v20 + 4, 0xCuLL, v11, v12, v13)) {
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to add color to store", v14, v15, v16, v17, v18, v19, v20);
    }
    os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  }
}

- (void)setFontName:(id)a3 baselineOffset:(float)a4 forFontSelector:(id)a5
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  if ([(CUICommonAssetStorage *)self fontdb])
  {
    if (!a5) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v9 = BOMTreeStorage((uint64_t)[(CUICommonAssetStorage *)self imagedb]);
    [(CUICommonAssetStorage *)self setFontdb:BOMTreeNewWithName(v9, "FONTS")];
    if (!a5)
    {
LABEL_11:
      uint64_t v20 = [(CUICommonAssetStorage *)self lock];
      os_unfair_lock_unlock(v20);
      return;
    }
  }
  if (![(CUICommonAssetStorage *)self fontdb]) {
    goto LABEL_11;
  }
  memset(v23, 0, sizeof(v23));
  if (objc_msgSend(a5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v23, 128, 0, 1, 0, 0, objc_msgSend(a5, "length"), 0))
  {
    float v22 = 0.0;
    memset(v21, 0, sizeof(v21));
    [a3 length];
    if (objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v21, 128, 0, 1, 0))
    {
      float v22 = a4;
      size_t v10 = [(CUICommonAssetStorage *)self fontdb];
      if (BOMTreeSetValue((uint64_t)v10, v23, 0x80uLL, v21, 0x84uLL, v11, v12, v13)) {
        _CUILog(4, (uint64_t)"CoreUI: Error: unable to add font to store", v14, v15, v16, v17, v18, v19, 0);
      }
    }
  }
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
}

- (void)setFontSize:(float)a3 forFontSizeSelector:(id)a4
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  if ([(CUICommonAssetStorage *)self fontsizedb])
  {
    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v7 = BOMTreeStorage((uint64_t)[(CUICommonAssetStorage *)self imagedb]);
    [(CUICommonAssetStorage *)self setFontsizedb:BOMTreeNewWithName(v7, "FONTSIZES")];
    if (!a4)
    {
LABEL_10:
      uint64_t v18 = [(CUICommonAssetStorage *)self lock];
      os_unfair_lock_unlock(v18);
      return;
    }
  }
  if (![(CUICommonAssetStorage *)self fontsizedb]) {
    goto LABEL_10;
  }
  memset(v20, 0, sizeof(v20));
  [a4 length];
  if (objc_msgSend(a4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v20, 128, 0, 1, 0))
  {
    float v19 = a3;
    uint64_t v8 = [(CUICommonAssetStorage *)self fontsizedb];
    if (BOMTreeSetValue((uint64_t)v8, v20, 0x80uLL, &v19, 4uLL, v9, v10, v11)) {
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to add font size to store", v12, v13, v14, v15, v16, v17, 0);
    }
  }
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
}

- (void)setExternalTags:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CUIMutableCommonAssetStorage;
  uint64_t v26 = 0;
  [(CUICommonAssetStorage *)&v25 setExternalTags:a3];
  id v4 = objc_alloc_init((Class)NSMutableData);
  uint64_t v27 = 1163414603;
  unsigned int v28 = objc_msgSend(-[CUICommonAssetStorage externalTags](self, "externalTags"), "count");
  [v4 appendBytes:&v27 length:12];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(CUICommonAssetStorage *)self externalTags];
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        CFStringRef v10 = *(const __CFString **)(*((void *)&v21 + 1) + 8 * i);
        CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v10);
        uint64_t v12 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x6A76F08CuLL);
        CFStringGetFileSystemRepresentation(v10, v12, MaximumSizeOfFileSystemRepresentation);
        LODWORD(v26) = 1008;
        HIDWORD(v26) = strnlen(v12, MaximumSizeOfFileSystemRepresentation) + 1;
        [v4 appendBytes:&v26 length:8];
        [v4 appendBytes:v12 length:HIDWORD(v26)];
        free(v12);
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v7);
  }
  uint64_t v13 = BOMTreeStorage((uint64_t)[(CUICommonAssetStorage *)self imagedb]);
  uint64_t NamedBlock = BOMStorageGetNamedBlock(v13, "EXTERNAL_KEYS");
  if (NamedBlock || (uint64_t NamedBlock = BOMStorageNewNamedBlock(v13, "EXTERNAL_KEYS"), NamedBlock))
  {
    id v15 = [v4 bytes];
    id v16 = [v4 length];
    BOMStorageCopyToBlock(v13, NamedBlock, v15, (size_t)v16, v17, v18, v19, v20);
  }
}

- (void)removeAssetForKey:(id)a3
{
  id v5 = [a3 bytes];
  id v6 = [a3 length];
  [(CUIMutableCommonAssetStorage *)self removeAssetForKey:v5 withLength:v6];
}

- (void)removeAssetForKey:(const void *)a3 withLength:(unint64_t)a4
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  id v7 = [(CUICommonAssetStorage *)self imagedb];
  if (BOMTreeGetValue((uint64_t)v7, (void *)a3, a4, v8, v9, v10, v11, v12))
  {
    uint64_t v13 = [(CUICommonAssetStorage *)self imagedb];
    if (BOMTreeRemoveValue((uint64_t)v13, (void *)a3, a4, v14, v15, v16)) {
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to remove asset from store", v17, v18, v19, v20, v21, v22, v24);
    }
  }
  long long v23 = [(CUICommonAssetStorage *)self lock];
  os_unfair_lock_unlock(v23);
}

- (BOOL)removeAssetName:(id)a3
{
  id v5 = [a3 UTF8String];
  id v6 = [a3 length];
  return [(CUIMutableCommonAssetStorage *)self removeAssetNameKey:v5 withLength:v6];
}

- (BOOL)removeAssetNameKey:(const void *)a3 withLength:(unint64_t)a4
{
  if (a3)
  {
    os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
    id v7 = [(CUICommonAssetStorage *)self facetKeysdb];
    if (BOMTreeGetValue((uint64_t)v7, (void *)a3, a4, v8, v9, v10, v11, v12))
    {
      uint64_t v13 = [(CUICommonAssetStorage *)self facetKeysdb];
      if (!BOMTreeRemoveValue((uint64_t)v13, (void *)a3, a4, v14, v15, v16))
      {
        BOOL v23 = 1;
        goto LABEL_8;
      }
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to remove rendition key from store", v17, v18, v19, v20, v21, v22, v25);
    }
    BOOL v23 = 0;
LABEL_8:
    os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
    return v23;
  }
  return 0;
}

- (void)setRenditionKey:(const _renditionkeytoken *)a3 hotSpot:(CGPoint)a4 forName:(const char *)a5
{
  double y = a4.y;
  double x = a4.x;
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  if (!a5) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CUICommonAssetStorage.m" lineNumber:2723 description:@"Can't use NULL facetName"];
  }
  unsigned int v11 = CUIRenditionKeyTokenCount((uint64_t)a3);
  if (!v11) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CUICommonAssetStorage.m" lineNumber:2727 description:@"Bad Rendition Key List"];
  }
  unsigned __int16 v29 = v11;
  __int16 v28 = (int)x;
  __int16 v27 = (int)y;
  id v12 = [objc_alloc((Class)NSMutableData) initWithCapacity:4 * v11 + 6];
  [v12 appendBytes:&v28 length:2];
  [v12 appendBytes:&v27 length:2];
  [v12 appendBytes:&v29 length:2];
  [v12 appendBytes:a3 length:4 * v29];
  uint64_t v13 = [(CUICommonAssetStorage *)self facetKeysdb];
  size_t v14 = strlen(a5);
  id v15 = [v12 bytes];
  id v16 = [v12 length];
  if (BOMTreeSetValue((uint64_t)v13, (void *)a5, v14, v15, (size_t)v16, v17, v18, v19)) {
    _CUILog(4, (uint64_t)"CoreUI: Error: unable to add renditionkey to store", v20, v21, v22, v23, v24, v25, v26);
  }

  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
}

- (BOOL)_saveBitmapInfo
{
  if (!self->_bitmapInfo || (*((unsigned char *)self + 544) & 1) == 0) {
    return 1;
  }
  if ([(CUICommonAssetStorage *)self bitmapKeydb])
  {
    BOMTreeRemoveAndFree((uint64_t)[(CUICommonAssetStorage *)self bitmapKeydb]);
    [(CUICommonAssetStorage *)self setBitmapKeydb:0];
  }
  if (![(CUICommonAssetStorage *)self bitmapKeydb])
  {
    uint64_t v4 = BOMTreeStorage((uint64_t)[(CUICommonAssetStorage *)self imagedb]);
    [(CUICommonAssetStorage *)self setBitmapKeydb:BOMTreeNewWithOptions(v4, 0, "BITMAPKEYS", 1024, 1)];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  bitmapInfo = self->_bitmapInfo;
  id v6 = [(NSMutableDictionary *)bitmapInfo countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
LABEL_10:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(bitmapInfo);
      }
      uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
      unsigned __int16 v11 = (unsigned __int16)[v10 integerValue];
      id v12 = [(NSMutableDictionary *)self->_bitmapInfo objectForKey:v10];
      if ([v12 numberOfBitsSet])
      {
        id v13 = [v12 archivedData];
        size_t v14 = [(CUICommonAssetStorage *)self bitmapKeydb];
        id v15 = [v13 bytes];
        id v16 = [v13 length];
        if (BOMTreeSetValue((uint64_t)v14, (void *)v11, 2uLL, v15, (size_t)v16, v17, v18, v19)) {
          break;
        }
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableDictionary *)bitmapInfo countByEnumeratingWithState:&v20 objects:v24 count:16];
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
    if (!BOMTreeCommit((uint64_t)[(CUICommonAssetStorage *)self bitmapKeydb])) {
      return 1;
    }
  }
  return 0;
}

- (BOOL)_writeOutKeyFormatWithWorkaround
{
  uint64_t v3 = BOMTreeStorage((uint64_t)[(CUICommonAssetStorage *)self imagedb]);
  if (!*((_DWORD *)[(CUICommonAssetStorage *)self keyfmt] + 2)) {
    return 0;
  }
  unint64_t v4 = 0;
  id v5 = 0;
  do
  {
    if (*((_DWORD *)[(CUICommonAssetStorage *)self keyfmt] + v4 + 3) >= 0x18u)
    {
      if (!v5) {
        id v5 = malloc_type_calloc(*((unsigned int *)[(CUICommonAssetStorage *)self keyfmt] + 2), 4uLL, 0x100004052888210uLL);
      }
      v5[v4] = *((_DWORD *)[(CUICommonAssetStorage *)self keyfmt] + v4 + 3);
    }
    ++v4;
  }
  while (v4 < *((unsigned int *)[(CUICommonAssetStorage *)self keyfmt] + 2));
  if (!v5) {
    return 0;
  }
  uint64_t NamedBlock = BOMStorageGetNamedBlock(v3, "KEYFORMAT");
  uint64_t v7 = BOMStorageGetNamedBlock(v3, "KEYFORMATWORKAROUND");
  if (!v7) {
    uint64_t v7 = BOMStorageNewNamedBlock(v3, "KEYFORMATWORKAROUND");
  }
  uint64_t v8 = malloc_type_malloc(4 * *((unsigned int *)[(CUICommonAssetStorage *)self keyfmt] + 2) + 12, 0x6899F812uLL);
  memcpy(v8, [(CUICommonAssetStorage *)self keyfmt], 4 * (*((_DWORD *)[(CUICommonAssetStorage *)self keyfmt] + 2) + 3));
  if (*((_DWORD *)[(CUICommonAssetStorage *)self keyfmt] + 2))
  {
    unint64_t v13 = 0;
    do
    {
      if (v5[v13]) {
        v8[v13 + 3] = 5;
      }
      ++v13;
    }
    while (v13 < *((unsigned int *)[(CUICommonAssetStorage *)self keyfmt] + 2));
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
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  uint64_t v5 = BOMTreeStorage((uint64_t)[(CUICommonAssetStorage *)self imagedb]);
  uint64_t NamedBlock = BOMStorageGetNamedBlock(v5, "CARHEADER");
  uint64_t v7 = [(CUICommonAssetStorage *)self header];
  BOMStorageCopyToBlock(v5, NamedBlock, v7, 0x1B4uLL, v8, v9, v10, v11);
  if ([(CUICommonAssetStorage *)self extendedMetadata])
  {
    uint64_t v12 = BOMStorageGetNamedBlock(v5, "EXTENDED_METADATA");
    if (!v12) {
      uint64_t v12 = BOMStorageNewNamedBlock(v5, "EXTENDED_METADATA");
    }
    unint64_t v13 = [(CUICommonAssetStorage *)self extendedMetadata];
    BOMStorageCopyToBlock(v5, v12, v13, 0x404uLL, v14, v15, v16, v17);
  }
  if ([(NSData *)[(CUICommonAssetStorage *)self globals] length])
  {
    uint64_t v18 = BOMStorageGetNamedBlock(v5, "CARGLOBALS");
    if (!v18) {
      uint64_t v18 = BOMStorageNewNamedBlock(v5, "CARGLOBALS");
    }
    uint64_t v19 = [(NSData *)[(CUICommonAssetStorage *)self globals] bytes];
    size_t v20 = [(NSData *)[(CUICommonAssetStorage *)self globals] length];
    BOMStorageCopyToBlock(v5, v18, v19, v20, v21, v22, v23, v24);
  }
  if ((*((unsigned char *)self + 544) & 2) != 0) {
    [(CUIMutableCommonAssetStorage *)self _writeOutKeyFormatWithWorkaround];
  }
  BOOL v25 = !BOMTreeCommit((uint64_t)[(CUICommonAssetStorage *)self imagedb])
     && (![(CUICommonAssetStorage *)self colordb]
      || !BOMTreeCommit((uint64_t)[(CUICommonAssetStorage *)self colordb]))
     && (![(CUICommonAssetStorage *)self fontdb]
      || !BOMTreeCommit((uint64_t)[(CUICommonAssetStorage *)self fontdb]))
     && (![(CUICommonAssetStorage *)self fontsizedb]
      || !BOMTreeCommit((uint64_t)[(CUICommonAssetStorage *)self fontsizedb]))
     && (![(CUICommonAssetStorage *)self facetKeysdb]
      || !BOMTreeCommit((uint64_t)[(CUICommonAssetStorage *)self facetKeysdb]))
     && (!self->_bitmapInfo || [(CUIMutableCommonAssetStorage *)self _saveBitmapInfo])
     && (!v3 || !BOMStorageCompact(v5))
     && BOMStorageCommit(v5) == 0;
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v25;
}

- (BOOL)writeToDisk
{
  return [(CUIMutableCommonAssetStorage *)self writeToDiskAndCompact:0];
}

@end