@interface CUICommonAssetStorage
+ (BOOL)isValidAssetStorageWithBytes:(const void *)a3 length:(unint64_t)a4;
+ (BOOL)isValidAssetStorageWithURL:(id)a3;
- (BOOL)_buildBitmapInfoIntoDictionary:(id)a3;
- (BOOL)_commonInitWithStorage:(_BOMStorage *)a3 forWritting:(BOOL)a4;
- (BOOL)assetExistsForKey:(id)a3;
- (BOOL)assetExistsForKeyData:(const void *)a3 length:(unint64_t)a4;
- (BOOL)enumerateColorsBlock:(id)a3;
- (BOOL)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (BOOL)getBaselineOffset:(float *)a3 forFontType:(id)a4;
- (BOOL)getColor:(_colordef *)a3 forName:(const char *)a4;
- (BOOL)getFontName:(id *)a3 baselineOffset:(float *)a4 forFontType:(id)a5;
- (BOOL)hasColorForName:(const char *)a3;
- (BOOL)swapped;
- (BOOL)usesCUISystemThemeRenditionKey;
- (BOOL)writeToPath:(id)a3 withTreePageSize:(unsigned int)a4;
- (CUICommonAssetStorage)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (CUICommonAssetStorage)initWithPath:(id)a3;
- (CUICommonAssetStorage)initWithPath:(id)a3 forWriting:(BOOL)a4;
- (NSData)globals;
- (NSDictionary)appearances;
- (_BOMStorage)_bomStorage;
- (_carextendedMetadata)extendedMetadata;
- (_carheader)header;
- (_renditionkeyfmt)keyfmt;
- (_renditionkeytoken)_swapRenditionKeyToken:(_renditionkeytoken)a3;
- (const)_fontValueForFontType:(id)a3;
- (const)keyAttributeIndex;
- (const)keyFormat;
- (const)mainVersionString;
- (const)renditionKeyForName:(const char *)a3 hotSpot:(CGPoint *)a4;
- (const)versionString;
- (float)fontSizeForFontSizeType:(id)a3;
- (id)_readAppearances;
- (id)allAssetKeys;
- (id)allRenditionNames;
- (id)assetForKey:(id)a3;
- (id)assetKeysMatchingBlock:(id)a3;
- (id)authoringTool;
- (id)catalogGlobalData;
- (id)deploymentPlatformString;
- (id)deploymentPlatformVersion;
- (id)description;
- (id)externalTags;
- (id)keyFormatData;
- (id)localizations;
- (id)nameForAppearanceIdentifier:(unsigned __int16)a3;
- (id)nameForLocalizationIdentifier:(unsigned __int16)a3;
- (id)path;
- (id)renditionInfoForIdentifier:(unsigned __int16)a3;
- (id)renditionNameForKeyBaseList:(const _renditionkeytoken *)a3;
- (id)renditionNameForKeyList:(_renditionkeytoken *)a3;
- (id)renditionNamesWithKeys;
- (id)thinningArguments;
- (id)uuid;
- (int)keySemantics;
- (int)validateBitmapInfo;
- (int)validateFile;
- (int)validatekeyformat;
- (int64_t)_storagefileTimestamp;
- (int64_t)deploymentPlatform;
- (int64_t)maximumRenditionKeyTokenCount;
- (int64_t)storageTimestamp;
- (os_unfair_lock_s)lock;
- (os_unfair_lock_s)renditionInfoCacheLock;
- (unsigned)appearanceIdentifierForName:(id)a3;
- (unsigned)associatedChecksum;
- (unsigned)colorSpaceID;
- (unsigned)distilledInCoreUIVersion;
- (unsigned)localizationIdentifierForName:(id)a3;
- (unsigned)renditionCount;
- (unsigned)schemaVersion;
- (unsigned)storageVersion;
- (unsigned)thinnedWithCoreUIVersion;
- (void)_addBitmapIndexForNameIdentifier:(unsigned __int16)a3 attribute:(int)a4 withValue:(unsigned __int16)a5 toDictionary:(id)a6;
- (void)_bringHeaderInfoUpToDate;
- (void)_initDefaultHeaderVersion:(double)a3 versionString:(const char *)a4;
- (void)_loadExtendedMetadata;
- (void)_swapHeader;
- (void)_swapKeyFormat;
- (void)_swapRenditionKeyArray:(unsigned __int16 *)a3;
- (void)appearancedb;
- (void)bitmapKeydb;
- (void)colordb;
- (void)dealloc;
- (void)enumerateBitmapIndexUsingBlock:(id)a3;
- (void)enumerateKeysAndObjectsWithoutIgnoringUsingBlock:(id)a3;
- (void)enumerateRenditionInfosUsingBlock:(id)a3;
- (void)facetKeysdb;
- (void)fontdb;
- (void)fontsizedb;
- (void)imagedb;
- (void)localizationdb;
- (void)setAppearancedb:(void *)a3;
- (void)setBitmapKeydb:(void *)a3;
- (void)setColordb:(void *)a3;
- (void)setExtendedMetadata:(_carextendedMetadata *)a3;
- (void)setExternalTags:(id)a3;
- (void)setFacetKeysdb:(void *)a3;
- (void)setFontdb:(void *)a3;
- (void)setFontsizedb:(void *)a3;
- (void)setGlobals:(id)a3;
- (void)setHeader:(_carheader *)a3;
- (void)setImagedb:(void *)a3;
- (void)setKeyfmt:(_renditionkeyfmt *)a3;
- (void)setLocalizationdb:(void *)a3;
@end

@implementation CUICommonAssetStorage

- (int64_t)deploymentPlatform
{
  id v2 = [(CUICommonAssetStorage *)self deploymentPlatformString];
  return CUIPlatformForPlatformString(v2);
}

- (id)deploymentPlatformString
{
  [(CUICommonAssetStorage *)self _loadExtendedMetadata];
  extendedMetadata = self->_extendedMetadata;
  if (!extendedMetadata || !extendedMetadata->var3[0]) {
    return 0;
  }
  return +[NSString stringWithUTF8String:extendedMetadata->var3];
}

- (void)_loadExtendedMetadata
{
  if (!self->_extendedMetadata)
  {
    uint64_t v3 = BOMTreeStorage((uint64_t)[(CUICommonAssetStorage *)self imagedb]);
    unsigned int NamedBlock = BOMStorageGetNamedBlock(v3, "EXTENDED_METADATA");
    if (NamedBlock)
    {
      unsigned int v11 = NamedBlock;
      if ((*((unsigned char *)self + 108) & 2) != 0)
      {
        self->_extendedMetadata = (_carextendedMetadata *)BOMStorageReadFromBlock(v3, NamedBlock, v5, v6, v7, v8, v9, v10);
      }
      else
      {
        unint64_t v12 = BOMStorageSizeOfBlock(v3, NamedBlock, v5, v6, v7, v8, v9, v10);
        v13 = (_carextendedMetadata *)malloc_type_calloc(1uLL, 0x404uLL, 0x100004084B5CCE0uLL);
        self->_extendedMetadata = v13;
        if (v12 >= 0x404) {
          size_t v17 = 1028;
        }
        else {
          size_t v17 = v12;
        }
        BOMStorageCopyFromBlockRange(v3, v11, 0, v17, v13, v14, v15, v16);
      }
    }
  }
}

- (const)keyAttributeIndex
{
  return &self->_keyfmtindex;
}

- (id)renditionInfoForIdentifier:(unsigned __int16)a3
{
  if (!self->_bitmapKeydb) {
    return 0;
  }
  unsigned int v3 = a3;
  uint64_t v30 = 0;
  os_unfair_lock_lock([(CUICommonAssetStorage *)self renditionInfoCacheLock]);
  uint64_t v5 = 0;
  renditionInfoCacheLookup = self->_renditionInfoCacheLookup;
  while (self->_renditionInfoCacheLookup[v5] != v3)
  {
    if (++v5 == 20)
    {
      uint64_t v7 = 0;
      goto LABEL_8;
    }
  }
  uint64_t v7 = (CUINamedRenditionInfo *)self->_renditionInfoCache[v5];
LABEL_8:
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self renditionInfoCacheLock]);
  if (!v7)
  {
    os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
    bitmapKeydb = self->_bitmapKeydb;
    if ((*((unsigned char *)self + 108) & 2) != 0) {
      unint64_t Value = BOMTreeReadValue((uint64_t)bitmapKeydb, (void *)v3, 2uLL, v8, v9, v10, v11, v12);
    }
    else {
      unint64_t Value = BOMTreeGetValue((uint64_t)bitmapKeydb, (void *)v3, 2uLL, v8, v9, v10, v11, v12);
    }
    uint64_t v7 = (CUINamedRenditionInfo *)Value;
    if (Value)
    {
      if (BOMTreeGetValueSize((uint64_t)self->_bitmapKeydb, (void *)v3, 2uLL, &v30, v15, v16, v17, v18))
      {
        uint64_t v7 = 0;
      }
      else
      {
        char v19 = *((unsigned char *)self + 108);
        id v20 = objc_alloc((Class)NSData);
        if ((v19 & 2) != 0) {
          id v21 = [v20 initWithBytesNoCopy:v7 length:v30 freeWhenDone:0];
        }
        else {
          id v21 = [v20 initWithBytes:v7 length:v30];
        }
        v22 = v21;
        uint64_t v7 = [[CUINamedRenditionInfo alloc] initWithData:v21 keyFormat:[(CUICommonAssetStorage *)self keyFormat] andPlatform:[(CUICommonAssetStorage *)self deploymentPlatform]];

        if (v7)
        {
          os_unfair_lock_lock([(CUICommonAssetStorage *)self renditionInfoCacheLock]);
          for (uint64_t i = 0; i != 20; ++i)
          {
            v24 = (char *)self + 2 * i;
            if (!*((_WORD *)v24 + 60))
            {
              *((_WORD *)v24 + 60) = v3;
              self->_renditionInfoCache[i] = v7;
              goto LABEL_26;
            }
          }
          uint64_t v25 = 0;
          v26 = &self->_renditionInfoCache[1];
          do
          {
            renditionInfoCacheLookup[v25] = renditionInfoCacheLookup[v25 + 1];
            id v27 = *(v26 - 1);
            *(v26 - 1) = *v26;
            id *v26 = 0;
            renditionInfoCacheLookup[v25 + 1] = 0;
            ++v26;
            ++v25;
          }
          while (v25 != 19);
          self->_renditionInfoCacheLookup[19] = v3;
          self->_renditionInfoCache[19] = v7;
LABEL_26:
          os_unfair_lock_unlock([(CUICommonAssetStorage *)self renditionInfoCacheLock]);
          v28 = v7;
        }
      }
    }
    os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  }
  return v7;
}

- (os_unfair_lock_s)renditionInfoCacheLock
{
  return &self->_renditionInfoCacheLock;
}

- (BOOL)swapped
{
  return *((unsigned char *)self + 108) & 1;
}

- (const)keyFormat
{
  if (self->_keyfmt) {
    return self->_keyfmt;
  }
  else {
    return (const _renditionkeyfmt *)CUIDefaultThemeRenditionKeyFormat(self->_header->var11, self->_header->var2, v2, v3, v4, v5, v6, v7);
  }
}

- (unsigned)storageVersion
{
  header = self->_header;
  if (header) {
    return header->var2;
  }
  else {
    return 1;
  }
}

- (BOOL)assetExistsForKeyData:(const void *)a3 length:(unint64_t)a4
{
  objc_msgSend(+[CUIRuntimeStatistics sharedRuntimeStatistics](CUIRuntimeStatistics, "sharedRuntimeStatistics"), "incrementStaticsProbe");
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  LOBYTE(a4) = BOMTreeValueExists((uint64_t)self->_imagedb, (void *)a3, a4, v7, v8, v9, v10, v11) != 0;
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return a4;
}

- (os_unfair_lock_s)lock
{
  return &self->_lock;
}

- (unsigned)distilledInCoreUIVersion
{
  header = self->_header;
  if (header)
  {
    LODWORD(v2) = header->var1;
    return (double)v2;
  }
  else
  {
    return floor(917.3);
  }
}

- (void)imagedb
{
  return self->_imagedb;
}

- (unsigned)appearanceIdentifierForName:(id)a3
{
  if ((*((unsigned char *)self + 108) & 4) != 0)
  {
    id v3 = [(NSDictionary *)[(CUICommonAssetStorage *)self appearances] objectForKey:a3];
    if (v3) {
      LOWORD(v3) = (unsigned __int16)[v3 unsignedIntegerValue];
    }
  }
  else
  {
    LOWORD(v3) = 0;
  }
  return (unsigned __int16)v3;
}

- (NSDictionary)appearances
{
  result = self->_appearances;
  if (!result)
  {
    result = (NSDictionary *)objc_msgSend(-[CUICommonAssetStorage _readAppearances](self, "_readAppearances"), "copy");
    self->_appearances = result;
  }
  return result;
}

- (id)path
{
  uint64_t v2 = BOMTreeStorage((uint64_t)self->_imagedb);
  id v3 = (const char *)BOMStorageFileName(v2);
  uint64_t v4 = +[NSFileManager defaultManager];
  size_t v5 = strlen(v3);
  return [(NSFileManager *)v4 stringWithFileSystemRepresentation:v3 length:v5];
}

- (const)renditionKeyForName:(const char *)a3 hotSpot:(CGPoint *)a4
{
  int v30 = 0;
  uint64_t v29 = 0;
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  double v7 = -1.0;
  if (!a3)
  {
    double v8 = -1.0;
LABEL_6:
    id v21 = +[NSMutableData dataWithBytes:&v30 length:4];
    goto LABEL_7;
  }
  double v8 = -1.0;
  if (!self->_facetKeysdb) {
    goto LABEL_6;
  }
  unsigned int v9 = [(CUICommonAssetStorage *)self swapped];
  size_t v10 = strlen(a3);
  if (BOMTreeGetValueSize((uint64_t)self->_facetKeysdb, (void *)a3, v10, &v29, v11, v12, v13, v14)) {
    goto LABEL_4;
  }
  if ((*((unsigned char *)self + 108) & 2) == 0
    || (unint64_t Value = BOMTreeReadValue((uint64_t)self->_facetKeysdb, (void *)a3, v10, v15, v16, v17, v18, v19)) == 0)
  {
    unint64_t Value = BOMTreeGetValue((uint64_t)self->_facetKeysdb, (void *)a3, v10, v15, v16, v17, v18, v19);
  }
  if (!Value || !v29)
  {
LABEL_4:
    os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
    return 0;
  }
  unsigned int v23 = *(unsigned __int16 *)Value;
  if (v9)
  {
    double v7 = (double)__rev16(v23);
    double v8 = (double)(bswap32(*(unsigned __int16 *)(Value + 2)) >> 16);
    LODWORD(v24) = bswap32(*(unsigned __int16 *)(Value + 4)) >> 16;
  }
  else
  {
    double v7 = (double)(__int16)v23;
    double v8 = (double)*(__int16 *)(Value + 2);
    LODWORD(v24) = *(unsigned __int16 *)(Value + 4);
  }
  id v21 = +[NSMutableData dataWithCapacity:4 * v24 + 4];
  __CFSetLastAllocationEventName();
  if (v24)
  {
    uint64_t v24 = v24;
    uint64_t v25 = (unsigned int *)(Value + 6);
    do
    {
      int v28 = 0;
      unsigned int v27 = *v25++;
      uint64_t v26 = v27;
      if (v9)
      {
        unint64_t Value = Value & 0xFFFFFFFF00000000 | v26;
        LODWORD(v26) = [(CUICommonAssetStorage *)self _swapRenditionKeyToken:Value];
      }
      int v28 = v26;
      [(NSMutableData *)v21 appendBytes:&v28 length:4];
      --v24;
    }
    while (v24);
  }
  [(NSMutableData *)v21 appendBytes:&v30 length:4];
  if (!v29) {
    goto LABEL_6;
  }
LABEL_7:
  if (a4)
  {
    a4->x = v7;
    a4->y = v8;
  }
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return (const _renditionkeytoken *)[(NSMutableData *)v21 bytes];
}

- (unsigned)renditionCount
{
  header = self->_header;
  if (header) {
    return header->var4;
  }
  else {
    return 0;
  }
}

- (CUICommonAssetStorage)initWithPath:(id)a3 forWriting:(BOOL)a4
{
  BOOL v4 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CUICommonAssetStorage;
  uint64_t v6 = [(CUICommonAssetStorage *)&v25 init];
  uint64_t v14 = v6;
  if (v6)
  {
    BOMExceptionHandlerSetDefault((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13, v24);
    uint64_t v15 = BOMStorageOpenWithSys((uint64_t)[a3 fileSystemRepresentation], v4, 0);
    if (!v15)
    {
      _CUILog(4, (uint64_t)"CoreUI: Error: CUICommonAssetStorage -initWithPath: Unable to read file at '%@'", v16, v17, v18, v19, v20, v21, (uint64_t)a3);
      goto LABEL_6;
    }
    v22 = (unsigned char *)v15;
    if (![(CUICommonAssetStorage *)v14 _commonInitWithStorage:v15 forWritting:v4])
    {
      BOMStorageFree(v22);
LABEL_6:

      return 0;
    }
  }
  return v14;
}

- (CUICommonAssetStorage)initWithPath:(id)a3
{
  return [(CUICommonAssetStorage *)self initWithPath:a3 forWriting:0];
}

- (id)localizations
{
  if (self->_localizationdb)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
    BOOL v4 = BOMTreeIteratorNew((uint64_t)self->_localizationdb, 0, 0, 0);
    if (!BOMTreeIteratorIsAtEnd((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11))
    {
      do
      {
        uint64_t v19 = (unsigned __int16 *)BOMTreeIteratorValue((uint64_t)v4, v12, v13, v14, v15, v16, v17, v18);
        if (v19)
        {
          uint64_t v27 = *v19;
          uint64_t v28 = BOMTreeIteratorKey((uint64_t)v4, v20, v21, v22, v23, v24, v25, v26);
          id v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v28, BOMTreeIteratorKeySize((uint64_t)v4, v29, v30, v31, v32, v33, v34, v35), 4);
          objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v27), v36);
        }
        BOMTreeIteratorNext((uint64_t)v4, v20, v21, v22, v23, v24, v25, v26);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v4, v37, v38, v39, v40, v41, v42, v43));
    }
    BOMTreeIteratorFree(v4);
    os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  }
  else
  {
    id v3 = 0;
  }
  if ([v3 count])
  {
    return v3;
  }
  else
  {

    return 0;
  }
}

- (BOOL)_commonInitWithStorage:(_BOMStorage *)a3 forWritting:(BOOL)a4
{
  unsigned int NamedBlock = BOMStorageGetNamedBlock(a3, "CARHEADER");
  if (NamedBlock)
  {
    unsigned int v14 = NamedBlock;
    unint64_t v15 = BOMStorageSizeOfBlock((uint64_t)a3, NamedBlock, v8, v9, v10, v11, v12, v13);
    if (v15 >= 0x1B5)
    {
      uint64_t v191 = BOMStorageFileName(a3);
      _CUILog(4, (uint64_t)"CoreUI: Car file '%s' has a malformed header(%zu) sizeof CAR_HEADER_NAME > structure used to store data(%zu)", v16, v17, v18, v19, v20, v21, v191);
      return 0;
    }
    if (v15 == 436)
    {
      header = (_carheader *)malloc_type_malloc(0x1B4uLL, 0x7A26D82CuLL);
      self->_header = header;
    }
    else
    {
      if (a4)
      {
        uint64_t v192 = BOMStorageFileName(a3);
        _CUILog(4, (uint64_t)"CoreUI: Can't update header information for old version of CAR '%s'", v35, v36, v37, v38, v39, v40, v192);
        return 0;
      }
      [(CUICommonAssetStorage *)self _initDefaultHeaderVersion:"@(#)PROGRAM:CoreUI  PROJECT:CoreUI-917.3\n" versionString:917.3];
      header = self->_header;
    }
    BOMStorageCopyFromBlock((uint64_t)a3, v14, header, v30, v31, v32, v33, v34);
    if (self->_header->var0 == 1380013123)
    {
      [(CUICommonAssetStorage *)self _swapHeader];
      *((unsigned char *)self + 108) |= 1u;
    }
    [(CUICommonAssetStorage *)self _bringHeaderInfoUpToDate];
  }
  else
  {
    uint64_t v22 = BOMStorageFileName(a3);
    _CUILog(4, (uint64_t)"CoreUI: Car file '%s' has no header information.  Using default values", v23, v24, v25, v26, v27, v28, v22);
    [(CUICommonAssetStorage *)self _initDefaultHeaderVersion:"@(#)PROGRAM:CoreUI  PROJECT:CoreUI-917.3\n" versionString:917.3];
  }
  self->_thinnedWithCoreUIVersion = -1;
  unsigned int v41 = BOMStorageGetNamedBlock(a3, "CARGLOBALS");
  if (v41)
  {
    unsigned int v48 = v41;
    size_t v49 = BOMStorageSizeOfBlock((uint64_t)a3, v41, v42, v43, v44, v45, v46, v47);
    if (v49)
    {
      size_t v50 = v49;
      v51 = malloc_type_malloc(v49, 0xC52B9E1DuLL);
      BOMStorageCopyFromBlock((uint64_t)a3, v48, v51, v52, v53, v54, v55, v56);
      self->_globals = (NSData *)[objc_alloc((Class)NSData) initWithBytes:v51 length:v50];
      free(v51);
    }
  }
  unsigned int v57 = BOMStorageGetNamedBlock(a3, "KEYFORMAT");
  if (v57)
  {
    unsigned int v64 = v57;
    size_t v65 = BOMStorageSizeOfBlock((uint64_t)a3, v57, v58, v59, v60, v61, v62, v63);
    if (v65 < 0xC)
    {
      uint64_t v81 = BOMStorageFileName(a3);
      _CUILog(4, (uint64_t)"CoreUI: Car file '%s' has erroneous key format information keyformat is too short. Using CUISystemThemeRenditionKeyFormat", v82, v83, v84, v85, v86, v87, v81);
      p_keyfmt = (void **)&self->_keyfmt;
LABEL_26:
      *p_keyfmt = 0;
      goto LABEL_27;
    }
    size_t v66 = v65;
    v67 = (_renditionkeyfmt *)malloc_type_malloc(v65, 0xAFF191A0uLL);
    self->_keyfmt = v67;
    p_keyfmt = (void **)&self->_keyfmt;
    BOMStorageCopyFromBlock((uint64_t)a3, v64, v67, v69, v70, v71, v72, v73);
    if (*((unsigned char *)self + 108)) {
      [(CUICommonAssetStorage *)self _swapKeyFormat];
    }
    if (*(_DWORD *)*p_keyfmt != 1801874804)
    {
      uint64_t v193 = BOMStorageFileName(a3);
      _CUILog(4, (uint64_t)"CoreUI: Car file '%s' has erroneous key format information. Using CUISystemThemeRenditionKeyFormat", v88, v89, v90, v91, v92, v93, v193);
      goto LABEL_25;
    }
    if (4 * *((unsigned int *)*p_keyfmt + 2) + 12 != v66)
    {
      uint64_t v74 = BOMStorageFileName(a3);
      _CUILog(4, (uint64_t)"CoreUI: Car file '%s' has erroneous key format information keyformat #keys %d doesn't match size %d. Using CUISystemThemeRenditionKeyFormat", v75, v76, v77, v78, v79, v80, v74);
LABEL_25:
      free(*p_keyfmt);
      goto LABEL_26;
    }
  }
LABEL_27:
  unsigned int v94 = BOMStorageGetNamedBlock(a3, "KEYFORMATWORKAROUND");
  if (v94 && self->_keyfmt)
  {
    unsigned int v101 = v94;
    size_t v102 = BOMStorageSizeOfBlock((uint64_t)a3, v94, v95, v96, v97, v98, v99, v100);
    if (v102 < 0xC)
    {
      uint64_t v116 = BOMStorageFileName(a3);
      _CUILog(4, (uint64_t)"CoreUI: Car file '%s' KEY_FORMAT_WORKAROUND that is too short ignoring.", v117, v118, v119, v120, v121, v122, v116);
    }
    else
    {
      size_t v103 = v102;
      v104 = malloc_type_malloc(v102, 0x76DDFE77uLL);
      BOMStorageCopyFromBlock((uint64_t)a3, v101, v104, v105, v106, v107, v108, v109);
      keyfmt = self->_keyfmt;
      size_t var2 = keyfmt->var2;
      if (v103 >> 2 < var2) {
        size_t var2 = v103 >> 2;
      }
      if (var2)
      {
        var3 = keyfmt->var3;
        v113 = (unsigned int *)v104;
        do
        {
          unsigned int v115 = *v113++;
          unsigned int v114 = v115;
          if (v115) {
            unsigned int *var3 = v114;
          }
          ++var3;
          --var2;
        }
        while (var2);
      }
      free(v104);
    }
  }
  v123 = self->_keyfmt;
  if (v123) {
    CUIRenditionKeyInitializeAttributeIndexWithKeyFormat((uint64_t)&self->_keyfmtindex, (uint64_t)v123);
  }
  unsigned int v124 = BOMStorageGetNamedBlock(a3, "EXTERNAL_KEYS");
  if (v124)
  {
    unsigned int v131 = v124;
    size_t v132 = BOMStorageSizeOfBlock((uint64_t)a3, v124, v125, v126, v127, v128, v129, v130);
    v133 = malloc_type_malloc(v132, 0x701972C7uLL);
    BOMStorageCopyFromBlock((uint64_t)a3, v131, v133, v134, v135, v136, v137, v138);
    if (*v133 == 1163414603)
    {
      v139 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
      if (v133[2])
      {
        unsigned int v140 = 0;
        v141 = v133 + 3;
        do
        {
          id v142 = [objc_alloc((Class)NSString) initWithUTF8String:v141 + 2];
          [(NSSet *)v139 addObject:v142];

          v141 = (_DWORD *)((char *)v141 + v141[1] + 8);
          ++v140;
        }
        while (v140 < v133[2]);
      }
      self->_externalTags = v139;
    }
    else
    {
      uint64_t v143 = BOMStorageFileName(a3);
      _CUILog(4, (uint64_t)"CoreUI: Car file '%s' has erroneous external tags information ignoring", v144, v145, v146, v147, v148, v149, v143);
    }
    free(v133);
  }
  v150 = (void *)BOMTreeOpenWithName((uint64_t)a3, "RENDITIONS", a4);
  if (!v150)
  {
    uint64_t v194 = BOMStorageFileName(a3);
    _CUILog(4, (uint64_t)"CoreUI: Error: CUICommonAssetStorage No rendition tree found in '%s'", v152, v153, v154, v155, v156, v157, v194);
    return 0;
  }
  self->_imagedb = v150;
  self->_colordb = (void *)BOMTreeOpenWithName((uint64_t)a3, "COLORS", a4);
  self->_fontdb = (void *)BOMTreeOpenWithName((uint64_t)a3, "FONTS", a4);
  self->_fontsizedb = (void *)BOMTreeOpenWithName((uint64_t)a3, "FONTSIZES", a4);
  self->_facetKeysdb = (void *)BOMTreeOpenWithName((uint64_t)a3, "FACETKEYS", a4);
  self->_bitmapKeydb = (void *)BOMTreeOpenWithName((uint64_t)a3, "BITMAPKEYS", a4);
  self->_appearancedb = (void *)BOMTreeOpenWithName((uint64_t)a3, "APPEARANCEKEYS", a4);
  self->_localizationdb = (void *)BOMTreeOpenWithName((uint64_t)a3, "LOCALIZATIONKEYS", a4);
  if (BOMStorageIsOpenForWriting((uint64_t)a3) || !BOMStorageMemoryMapped((BOOL)a3)) {
    char v151 = *((unsigned char *)self + 108) & 0xFD;
  }
  else {
    char v151 = *((unsigned char *)self + 108) | 2;
  }
  *((unsigned char *)self + 108) = v151;
  bitmapKeydb = self->_bitmapKeydb;
  if (bitmapKeydb && !a4)
  {
    v160 = BOMTreeIteratorNew((uint64_t)bitmapKeydb, 0, 0, 0);
    v161 = (void *)MEMORY[0x1A62313E0]();
    if (!BOMTreeIteratorIsAtEnd((uint64_t)v160, v162, v163, v164, v165, v166, v167, v168))
    {
      uint64_t v176 = 22;
      do
      {
        [(CUICommonAssetStorage *)self renditionInfoForIdentifier:(unsigned __int16)BOMTreeIteratorKey((uint64_t)v160, v169, v170, v171, v172, v173, v174, v175)];
        if (!--v176) {
          break;
        }
        BOMTreeIteratorNext((uint64_t)v160, v177, v178, v179, v180, v181, v182, v183);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v160, v184, v185, v186, v187, v188, v189, v190));
    }
    BOMTreeIteratorFree(v160);
  }
  if (self->_appearancedb)
  {
    self->_appearances = (NSDictionary *)objc_msgSend(-[CUICommonAssetStorage _readAppearances](self, "_readAppearances"), "copy");
    *((unsigned char *)self + 108) = *((unsigned char *)self + 108) & 0xFB | (4
                                                            * CUIRenditionKeyHasIdentifier((uint64_t)[(CUICommonAssetStorage *)self keyFormat], 7));
  }
  *((unsigned char *)self + 108) = *((unsigned char *)self + 108) & 0xF7 | (8
                                                          * CUIRenditionKeyHasIdentifier((uint64_t)[(CUICommonAssetStorage *)self keyFormat], 13));
  return 1;
}

- (void)_bringHeaderInfoUpToDate
{
  header = self->_header;
  if (header->var2 <= 5) {
    header->var9 = 1;
  }
}

- (id)_readAppearances
{
  if (self->_appearancedb)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
    BOOL v4 = BOMTreeIteratorNew((uint64_t)self->_appearancedb, 0, 0, 0);
    if (!BOMTreeIteratorIsAtEnd((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11))
    {
      do
      {
        uint64_t v19 = (unsigned __int16 *)BOMTreeIteratorValue((uint64_t)v4, v12, v13, v14, v15, v16, v17, v18);
        if (v19)
        {
          uint64_t v27 = *v19;
          uint64_t v28 = BOMTreeIteratorKey((uint64_t)v4, v20, v21, v22, v23, v24, v25, v26);
          id v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v28, BOMTreeIteratorKeySize((uint64_t)v4, v29, v30, v31, v32, v33, v34, v35), 4);
          objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v27), v36);
        }
        BOMTreeIteratorNext((uint64_t)v4, v20, v21, v22, v23, v24, v25, v26);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v4, v37, v38, v39, v40, v41, v42, v43));
    }
    BOMTreeIteratorFree(v4);
    os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  }
  else
  {
    id v3 = 0;
  }
  if ([v3 count])
  {
    return v3;
  }
  else
  {

    return 0;
  }
}

- (BOOL)getColor:(_colordef *)a3 forName:(const char *)a4
{
  uint64_t v21 = 0;
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  if (a4
    && self->_colordb
    && ((int v23 = 0,
         memset(__s1, 0, sizeof(__s1)),
         __strlcpy_chk(),
         colordb = self->_colordb,
         (*((unsigned char *)self + 108) & 2) != 0)
      ? (unint64_t Value = BOMTreeReadValue((uint64_t)colordb, __s1, 0x84uLL, v7, v8, v9, v10, v11))
      : (unint64_t Value = BOMTreeGetValue((uint64_t)colordb, __s1, 0x84uLL, v7, v8, v9, v10, v11)),
        (unint64_t v18 = Value) != 0))
  {
    if (a3
      && !BOMTreeGetValueSize((uint64_t)self->_colordb, __s1, 0x84uLL, &v21, v14, v15, v16, v17)
      && v21 == 12)
    {
      uint64_t v19 = *(void *)v18;
      a3->size_t var2 = *(_rgbquad *)(v18 + 8);
      *(void *)&a3->var0 = v19;
      if (*((unsigned char *)self + 108))
      {
        a3->size_t var2 = (_rgbquad)bswap32(*(_DWORD *)&a3->var2);
        *(int8x8_t *)&a3->var0 = vrev32_s8(*(int8x8_t *)&a3->var0);
      }
    }
    os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
    return 1;
  }
  else
  {
    os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
    return 0;
  }
}

- (id)assetForKey:(id)a3
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  id v5 = [a3 bytes];
  id v6 = [a3 length];
  size_t size = 0;
  uint64_t v16 = 0;
  if (!BOMTreeGetValueSize((uint64_t)self->_imagedb, v5, (unint64_t)v6, (uint64_t *)&size, v7, v8, v9, v10))
  {
    if ((*((unsigned char *)self + 108) & 2) != 0
      && (uint64_t v17 = BOMTreeReadValue((uint64_t)self->_imagedb, v5, (unint64_t)v6, v11, v12, v13, v14, v15)) != 0)
    {
      unint64_t v18 = +[NSData dataWithBytesNoCopy:v17 length:size freeWhenDone:0];
    }
    else
    {
      unint64_t Value = BOMTreeGetValue((uint64_t)self->_imagedb, v5, (unint64_t)v6, v11, v12, v13, v14, v15);
      if (!Value
        || (uint64_t v20 = (const void *)Value,
            uint64_t v21 = malloc_type_malloc(size, 0x92DDF3A0uLL),
            __CFSetLastAllocationEventName(),
            !v21))
      {
        uint64_t v16 = 0;
        goto LABEL_10;
      }
      memcpy(v21, v20, size);
      unint64_t v18 = +[NSData dataWithBytesNoCopy:v21 length:size];
    }
    uint64_t v16 = v18;
  }
LABEL_10:
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v16;
}

- (void)dealloc
{
  id v3 = (unsigned char *)BOMTreeStorage((uint64_t)self->_imagedb);
  BOMTreeFree((uint64_t)self->_imagedb);
  BOMTreeFree((uint64_t)self->_colordb);
  BOMTreeFree((uint64_t)self->_fontdb);
  BOMTreeFree((uint64_t)self->_fontsizedb);
  BOMTreeFree((uint64_t)self->_facetKeysdb);
  BOMTreeFree((uint64_t)self->_bitmapKeydb);
  BOMTreeFree((uint64_t)self->_appearancedb);
  BOMTreeFree((uint64_t)self->_localizationdb);
  header = self->_header;
  if (header) {
    free(header);
  }
  keyfmt = self->_keyfmt;
  if (keyfmt) {
    free(keyfmt);
  }

  for (uint64_t i = 0; i != 20; ++i)
  {
    uint64_t v7 = (id *)(&self->super.isa + i);

    v7[20] = 0;
    self->_renditionInfoCacheLookup[i] = 0;
  }
  if (BOMStorageIsOpenForWriting((uint64_t)v3) || !BOMStorageMemoryMapped((BOOL)v3))
  {
    extendedMetadata = self->_extendedMetadata;
    if (extendedMetadata) {
      free(extendedMetadata);
    }
  }
  BOMStorageFree(v3);
  v9.receiver = self;
  v9.super_class = (Class)CUICommonAssetStorage;
  [(CUICommonAssetStorage *)&v9 dealloc];
}

- (unsigned)localizationIdentifierForName:(id)a3
{
  if ((*((unsigned char *)self + 108) & 8) == 0) {
    return 0;
  }
  CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)a3);
  uint64_t v7 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x5B2CED08uLL);
  if (CFStringGetFileSystemRepresentation((CFStringRef)a3, v7, MaximumSizeOfFileSystemRepresentation))
  {
    os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
    uint64_t v8 = [(CUICommonAssetStorage *)self localizationdb];
    size_t v9 = strlen(v7);
    unint64_t Value = (unsigned __int16 *)BOMTreeReadValue((uint64_t)v8, v7, v9, v10, v11, v12, v13, v14);
    if (Value) {
      unsigned __int16 v3 = *Value;
    }
    else {
      unsigned __int16 v3 = 0;
    }
    os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  }
  else
  {
    unsigned __int16 v3 = 0;
  }
  free(v7);
  return v3;
}

- (void)localizationdb
{
  return self->_localizationdb;
}

- (void)setExternalTags:(id)a3
{
  externalTags = self->_externalTags;
  if (externalTags != a3)
  {

    id v5 = self->_externalTags;
    id v6 = v5;
  }
}

- (void)_initDefaultHeaderVersion:(double)a3 versionString:(const char *)a4
{
  *((_DWORD *)self + 27) &= 0xFu;
  uint64_t v7 = (_carheader *)malloc_type_malloc(0x1B4uLL, 0x100004050C72333uLL);
  self->_header = v7;
  *(_OWORD *)&v7->var0 = 0u;
  *(_OWORD *)&v7->var4 = 0u;
  *(_OWORD *)&v7->var5[12] = 0u;
  *(_OWORD *)&v7->var5[28] = 0u;
  *(_OWORD *)&v7->var5[44] = 0u;
  *(_OWORD *)&v7->var5[60] = 0u;
  *(_OWORD *)&v7->var5[76] = 0u;
  *(_OWORD *)&v7->var5[92] = 0u;
  *(_OWORD *)&v7->var5[108] = 0u;
  *(_OWORD *)&v7->var5[124] = 0u;
  *(_OWORD *)&v7->var6[12] = 0u;
  *(_OWORD *)&v7->var6[28] = 0u;
  *(_OWORD *)&v7->var6[44] = 0u;
  *(_OWORD *)&v7->var6[60] = 0u;
  *(_OWORD *)&v7->var6[76] = 0u;
  *(_OWORD *)&v7->var6[92] = 0u;
  *(_OWORD *)&v7->var6[108] = 0u;
  *(_OWORD *)&v7->var6[124] = 0u;
  *(_OWORD *)&v7->var6[140] = 0u;
  *(_OWORD *)&v7->var6[156] = 0u;
  *(_OWORD *)&v7->var6[172] = 0u;
  *(_OWORD *)&v7->var6[188] = 0u;
  *(_OWORD *)&v7->var6[204] = 0u;
  *(_OWORD *)&v7->var6[220] = 0u;
  *(_OWORD *)&v7->var6[236] = 0u;
  *(_OWORD *)&v7->var6[252] = 0u;
  *(_OWORD *)&v7->var7[12] = 0u;
  v7->var11 = 0;
  header = self->_header;
  header->var0 = 1129595218;
  header->var1 = vcvtmd_u64_f64(a3);
  *(void *)&header->size_t var2 = 1;
  header->var4 = 0;
  strncpy(header->var5, a4, 0x80uLL);
  uuid_generate_random(self->_header->var7);
  *(_OWORD *)&self->_header->var8 = xmmword_1A139EBF0;
  *(void *)&self->_lock._os_unfair_lock_opaque = 0;
}

- (void)_swapHeader
{
  header = self->_header;
  *(int8x16_t *)&header->var1 = vrev32q_s8(*(int8x16_t *)&header->var1);
  header->var11 = bswap32(header->var11);
  *(int8x8_t *)&header->var8 = vrev32_s8(*(int8x8_t *)&header->var8);
}

- (void)_swapKeyFormat
{
  uint64_t v2 = 0;
  keyfmt = self->_keyfmt;
  do
  {
    *(unsigned int *)((char *)&keyfmt->var0 + v2) = bswap32(*(unsigned int *)((char *)&keyfmt->var0 + v2));
    v2 += 4;
  }
  while (v2 != 12);
  if (keyfmt->var2)
  {
    unint64_t v4 = 0;
    do
    {
      keyfmt->var3[v4] = bswap32(keyfmt->var3[v4]);
      ++v4;
    }
    while (v4 < keyfmt->var2);
  }
}

- (CUICommonAssetStorage)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v29.receiver = self;
  v29.super_class = (Class)CUICommonAssetStorage;
  id v6 = [(CUICommonAssetStorage *)&v29 init];
  uint64_t v14 = v6;
  if (v6)
  {
    BOMExceptionHandlerSetDefault((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)v29.receiver);
    uint64_t v20 = BOMStorageOpenInRAM((uint64_t)a3, a4, 0, v15, v16, v17, v18, v19);
    if (!v20)
    {
      _CUILog(4, (uint64_t)"CoreUI: Error: CUICommonAssetStorage -initWithBytes:length: unable to read bytes", v21, v22, v23, v24, v25, v26, (uint64_t)v29.receiver);
      goto LABEL_6;
    }
    uint64_t v27 = v20;
    if (![(CUICommonAssetStorage *)v14 _commonInitWithStorage:v20 forWritting:0])
    {
      BOMStorageFree(v27);
LABEL_6:

      return 0;
    }
  }
  return v14;
}

+ (BOOL)isValidAssetStorageWithBytes:(const void *)a3 length:(unint64_t)a4
{
  int v38 = 0;
  memset(v37, 0, sizeof(v37));
  BOMExceptionHandlerSet(0, (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7, 0);
  uint64_t v15 = (uint64_t)BOMStorageOpenInRAM((uint64_t)a3, a4, 0, v10, v11, v12, v13, v14);
  if (v15)
  {
    uint64_t v23 = (unsigned char *)v15;
    unsigned int NamedBlock = BOMStorageGetNamedBlock(v15, "CARHEADER");
    if (NamedBlock)
    {
      if ((unint64_t)BOMStorageSizeOfBlock((uint64_t)v23, NamedBlock, v24, v25, v26, v27, v28, v29) > 0x1B4)
      {
        LOBYTE(NamedBlock) = 0;
      }
      else
      {
        BOMStorageCopyFromBlock((uint64_t)v23, NamedBlock, v37, v31, v32, v33, v34, v35);
        LOBYTE(NamedBlock) = LODWORD(v37[0]) == 1129595218;
      }
    }
    uint64_t v15 = BOMStorageFree(v23);
  }
  else
  {
    LOBYTE(NamedBlock) = 0;
  }
  BOMExceptionHandlerSetDefault(v15, v16, v17, v18, v19, v20, v21, v22, *(uint64_t *)&v37[0]);
  return NamedBlock;
}

+ (BOOL)isValidAssetStorageWithURL:(id)a3
{
  int v30 = 0;
  memset(v29, 0, sizeof(v29));
  uint64_t v4 = (long long *)BomSys_defaultNoMMAP();
  BOMExceptionHandlerSet(0, v5, v6, v7, v8, v9, v10, v11, 0);
  uint64_t v12 = BOMStorageOpenWithSys((uint64_t)[a3 fileSystemRepresentation], 0, v4);
  if (v12)
  {
    uint64_t v20 = (unsigned char *)v12;
    unsigned int NamedBlock = BOMStorageGetNamedBlock(v12, "CARHEADER");
    if (NamedBlock)
    {
      BOMStorageCopyFromBlock((uint64_t)v20, NamedBlock, v29, v22, v23, v24, v25, v26);
      BOOL v27 = LODWORD(v29[0]) == 1129595218;
    }
    else
    {
      BOOL v27 = 0;
    }
    uint64_t v12 = BOMStorageFree(v20);
  }
  else
  {
    BOOL v27 = 0;
  }
  BOMExceptionHandlerSetDefault(v12, v13, v14, v15, v16, v17, v18, v19, *(uint64_t *)&v29[0]);
  return v27;
}

- (_BOMStorage)_bomStorage
{
  return (_BOMStorage *)BOMTreeStorage((uint64_t)self->_imagedb);
}

- (id)description
{
  unsigned __int16 v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = BOMTreeStorage((uint64_t)self->_imagedb);
  return +[NSString stringWithFormat:@"<%@:%p '%s'>", v4, self, BOMStorageFileName(v5)];
}

- (unsigned)schemaVersion
{
  header = self->_header;
  if (header) {
    return header->var9;
  }
  else {
    return 1;
  }
}

- (int64_t)_storagefileTimestamp
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  if (!_storagefileTimestamp_tstamp)
  {
    uint64_t v3 = BOMTreeStorage((uint64_t)self->_imagedb);
    uint64_t v4 = (const char *)BOMStorageFileName(v3);
    memset(&v6, 0, sizeof(v6));
    stat(v4, &v6);
    _storagefileTimestamp_tstamp = v6.st_mtimespec.tv_sec;
  }
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return _storagefileTimestamp_tstamp;
}

- (int64_t)storageTimestamp
{
  header = self->_header;
  if (header && (int64_t var3 = header->var3, var3)) {
    return var3;
  }
  else {
    return [(CUICommonAssetStorage *)self _storagefileTimestamp];
  }
}

- (int)keySemantics
{
  return self->_header->var11;
}

- (id)keyFormatData
{
  [(CUICommonAssetStorage *)self keyFormat];
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
}

- (id)catalogGlobalData
{
  globals = self->_globals;
  if (globals)
  {
    id v3 = [(NSData *)globals copy];
    return v3;
  }
  else
  {
    return +[NSData data];
  }
}

- (int64_t)maximumRenditionKeyTokenCount
{
  keyfmt = self->_keyfmt;
  if (keyfmt) {
    return keyfmt->var2;
  }
  else {
    return 21;
  }
}

- (BOOL)usesCUISystemThemeRenditionKey
{
  return self->_header->var11 == 1;
}

- (const)versionString
{
  header = self->_header;
  if (header) {
    return header->var6;
  }
  else {
    return 0;
  }
}

- (const)mainVersionString
{
  header = self->_header;
  if (header) {
    return header->var5;
  }
  else {
    return 0;
  }
}

- (unsigned)thinnedWithCoreUIVersion
{
  unsigned int result = self->_thinnedWithCoreUIVersion;
  if (result == -1)
  {
    id v4 = [(CUICommonAssetStorage *)self thinningArguments];
    unsigned int result = 0x7FFFFFFF;
    self->_thinnedWithCoreUIVersion = 0x7FFFFFFF;
    if (v4)
    {
      unsigned int v6 = 0;
      if ([v4 hasPrefix:@"carutil"])
      {
        uint64_t v5 = +[NSScanner scannerWithString:v4];
        [(NSScanner *)v5 scanUpToCharactersFromSet:+[NSCharacterSet decimalDigitCharacterSet] intoString:0];
        if ([(NSScanner *)v5 scanInt:&v6]) {
          self->_thinnedWithCoreUIVersion = v6;
        }
      }
      return self->_thinnedWithCoreUIVersion;
    }
  }
  return result;
}

- (id)uuid
{
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:self->_header->var7];
  return v2;
}

- (unsigned)associatedChecksum
{
  header = self->_header;
  if (header) {
    return header->var8;
  }
  else {
    return 0;
  }
}

- (unsigned)colorSpaceID
{
  header = self->_header;
  if (header) {
    return header->var10;
  }
  else {
    return 0;
  }
}

- (id)thinningArguments
{
  [(CUICommonAssetStorage *)self _loadExtendedMetadata];
  extendedMetadata = self->_extendedMetadata;
  if (!extendedMetadata) {
    return 0;
  }
  return +[NSString stringWithUTF8String:extendedMetadata->var1];
}

- (id)deploymentPlatformVersion
{
  [(CUICommonAssetStorage *)self _loadExtendedMetadata];
  extendedMetadata = self->_extendedMetadata;
  if (!extendedMetadata) {
    return 0;
  }
  return +[NSString stringWithUTF8String:extendedMetadata->var2];
}

- (id)authoringTool
{
  [(CUICommonAssetStorage *)self _loadExtendedMetadata];
  extendedMetadata = self->_extendedMetadata;
  if (!extendedMetadata) {
    return 0;
  }
  return +[NSString stringWithUTF8String:extendedMetadata->var4];
}

- (void)_swapRenditionKeyArray:(unsigned __int16 *)a3
{
  uint64_t v4 = [(CUICommonAssetStorage *)self maximumRenditionKeyTokenCount];
  if (v4 >= 1)
  {
    do
    {
      *a3 = bswap32(*a3) >> 16;
      ++a3;
      --v4;
    }
    while (v4);
  }
}

- (BOOL)assetExistsForKey:(id)a3
{
  id v5 = [a3 bytes];
  id v6 = [a3 length];
  return [(CUICommonAssetStorage *)self assetExistsForKeyData:v5 length:v6];
}

- (id)allAssetKeys
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __37__CUICommonAssetStorage_allAssetKeys__block_invoke;
  v5[3] = &unk_1E5A58418;
  v5[4] = v3;
  [(CUICommonAssetStorage *)self assetKeysMatchingBlock:v5];
  return v3;
}

uint64_t __37__CUICommonAssetStorage_allAssetKeys__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [[CUIRenditionKey alloc] initWithKeyList:a2];
  [*(id *)(a1 + 32) addObject:v3];

  return 0;
}

- (id)assetKeysMatchingBlock:(id)a3
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  id v5 = [(CUICommonAssetStorage *)self keyFormat];
  long long v52 = 0u;
  memset(v53, 0, 28);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  unsigned int var2 = v5->var2;
  if (var2 < 0x18)
  {
    uint64_t v7 = (unsigned __int16 *)&v49;
  }
  else
  {
    uint64_t v7 = (unsigned __int16 *)malloc_type_calloc(var2 + 2, 4uLL, 0x100004052888210uLL);
    unsigned int var2 = v5->var2;
  }
  uint64_t v8 = BOMTreeIteratorNew((uint64_t)self->_imagedb, 0, 2 * var2, 0);
  id v23 = 0;
  if (!BOMTreeIteratorIsAtEnd((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15))
  {
    id v23 = 0;
    do
    {
      uint64_t v24 = BOMTreeIteratorKey((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);
      uint64_t v32 = BOMTreeIteratorKeySize((uint64_t)v8, v25, v26, v27, v28, v29, v30, v31);
      if ([(CUICommonAssetStorage *)self swapped])
      {
        [(CUICommonAssetStorage *)self _swapRenditionKeyArray:v24];
      }
      CUIFillRenditionKeyForCARKeyArray(v7, v24, (uint64_t)v5);
      os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
      int v33 = (*((uint64_t (**)(id, unsigned __int16 *, const _renditionkeyfmt *))a3 + 2))(a3, v7, v5);
      os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
      if (v33)
      {
        if (!v23) {
          id v23 = objc_alloc_init((Class)NSMutableSet);
        }
        objc_msgSend(v23, "addObject:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v24, v32));
      }
      if ([(CUICommonAssetStorage *)self swapped]) {
        [(CUICommonAssetStorage *)self _swapRenditionKeyArray:v24];
      }
      BOMTreeIteratorNext((uint64_t)v8, v34, v35, v36, v37, v38, v39, v40);
    }
    while (!BOMTreeIteratorIsAtEnd((uint64_t)v8, v41, v42, v43, v44, v45, v46, v47));
  }
  BOMTreeIteratorFree(v8);
  if (v7 != (unsigned __int16 *)&v49) {
    free(v7);
  }
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v23;
}

- (BOOL)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  id v5 = [(CUICommonAssetStorage *)self keyFormat];
  id v6 = (unsigned __int16 *)malloc_type_calloc(v5->var2 + 1, 4uLL, 0x100004052888210uLL);
  uint64_t v7 = BOMTreeIteratorNew((uint64_t)self->_imagedb, 0, 0, 0);
  id v8 = objc_alloc_init((Class)NSAutoreleasePool);
  if (!BOMTreeIteratorIsAtEnd((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15))
  {
    uint64_t v82 = (uint64_t)v5;
    unint64_t v24 = 0;
    char v23 = 1;
    while (1)
    {
      uint64_t v83 = 0;
      if (v24 >= 0x3E9)
      {
        [v8 drain];
        id v8 = objc_alloc_init((Class)NSAutoreleasePool);
        unint64_t v24 = 0;
      }
      uint64_t v83 = 0;
      uint64_t v25 = (void *)BOMTreeIteratorKey((uint64_t)v7, v16, v17, v18, v19, v20, v21, v22);
      unint64_t v33 = BOMTreeIteratorKeySize((uint64_t)v7, v26, v27, v28, v29, v30, v31, v32);
      if (!v25)
      {
        char v23 = 0;
        goto LABEL_24;
      }
      if ((*((unsigned char *)self + 108) & 2) != 0)
      {
        unint64_t v51 = v33;
        uint64_t Value = BOMTreeReadValue((uint64_t)self->_imagedb, v25, v33, v36, v37, v38, v39, v40);
        if (!BOMTreeGetValueSize((uint64_t)self->_imagedb, v25, v51, &v83, v53, v54, v55, v56))
        {
          id v57 = objc_alloc((Class)NSData);
          id v50 = [v57 initWithBytesNoCopy:Value length:v83 freeWhenDone:0];
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v48 = BOMTreeIteratorValue((uint64_t)v7, v34, v35, v36, v37, v38, v39, v40);
        if (v48)
        {
          uint64_t v83 = BOMTreeIteratorValueSize((uint64_t)v7, v41, v42, v43, v44, v45, v46, v47);
          id v49 = objc_alloc((Class)NSData);
          id v50 = [v49 initWithBytes:v48 length:v83];
LABEL_12:
          uint64_t v58 = v50;
          goto LABEL_15;
        }
        _CUILog(4, (uint64_t)"CoreUI: %s invalid value skipping", v42, v43, v44, v45, v46, v47, (uint64_t)"-[CUICommonAssetStorage enumerateKeysAndObjectsUsingBlock:]");
        char v23 = 0;
      }
      uint64_t v58 = 0;
LABEL_15:
      uint64_t v59 = [v58 bytes];
      if (!v59)
      {
        _CUILog(4, (uint64_t)"CoreUI: %s can't get size of value skipping [data size:%d ptr:%p]", v60, v61, v62, v63, v64, v65, (uint64_t)"-[CUICommonAssetStorage enumerateKeysAndObjectsUsingBlock:]");
LABEL_20:
        char v23 = 0;
        goto LABEL_21;
      }
      if (*v59 != 1129599817)
      {
        _CUILog(4, (uint64_t)"CoreUI: %s skipping invalid CSIHeader [signature:%d]", v60, v61, v62, v63, v64, v65, (uint64_t)"-[CUICommonAssetStorage enumerateKeysAndObjectsUsingBlock:]");
        goto LABEL_20;
      }
      CUIFillRenditionKeyForCARKeyArray(v6, (uint64_t)v25, v82);
      os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
      size_t v66 = (void *)MEMORY[0x1A62313E0]();
      (*((void (**)(id, unsigned __int16 *, void *))a3 + 2))(a3, v6, v58);
      os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
LABEL_21:

      BOMTreeIteratorNext((uint64_t)v7, v67, v68, v69, v70, v71, v72, v73);
      ++v24;
      if (BOMTreeIteratorIsAtEnd((uint64_t)v7, v74, v75, v76, v77, v78, v79, v80)) {
        goto LABEL_24;
      }
    }
  }
  char v23 = 1;
LABEL_24:
  free(v6);
  BOMTreeIteratorFree(v7);
  [v8 drain];
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v23 & 1;
}

- (void)enumerateKeysAndObjectsWithoutIgnoringUsingBlock:(id)a3
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  id v5 = [(CUICommonAssetStorage *)self keyFormat];
  id v6 = (unsigned __int16 *)malloc_type_calloc(v5->var2 + 1, 4uLL, 0x100004052888210uLL);
  uint64_t v7 = BOMTreeIteratorNew((uint64_t)self->_imagedb, 0, 0, 0);
  id v8 = objc_alloc_init((Class)NSAutoreleasePool);
  if (!BOMTreeIteratorIsAtEnd((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15))
  {
    uint64_t v80 = (uint64_t)v5;
    unint64_t v23 = 0;
    do
    {
      uint64_t v81 = 0;
      if (v23 >= 0x3E9)
      {
        [v8 drain];
        id v8 = objc_alloc_init((Class)NSAutoreleasePool);
        unint64_t v23 = 0;
      }
      unint64_t v24 = (void *)BOMTreeIteratorKey((uint64_t)v7, v16, v17, v18, v19, v20, v21, v22);
      unint64_t v32 = BOMTreeIteratorKeySize((uint64_t)v7, v25, v26, v27, v28, v29, v30, v31);
      if ((*((unsigned char *)self + 108) & 2) != 0)
      {
        unint64_t v50 = v32;
        uint64_t Value = BOMTreeReadValue((uint64_t)self->_imagedb, v24, v32, v35, v36, v37, v38, v39);
        if (BOMTreeGetValueSize((uint64_t)self->_imagedb, v24, v50, &v81, v52, v53, v54, v55))
        {
          uint64_t v56 = 0;
          goto LABEL_11;
        }
        id v57 = objc_alloc((Class)NSData);
        id v49 = [v57 initWithBytesNoCopy:Value length:v81 freeWhenDone:0];
      }
      else
      {
        uint64_t v40 = BOMTreeIteratorValue((uint64_t)v7, v33, v34, v35, v36, v37, v38, v39);
        uint64_t v81 = BOMTreeIteratorValueSize((uint64_t)v7, v41, v42, v43, v44, v45, v46, v47);
        id v48 = objc_alloc((Class)NSData);
        id v49 = [v48 initWithBytes:v40 length:v81];
      }
      uint64_t v56 = v49;
LABEL_11:
      uint64_t v58 = [v56 bytes];
      if (!v58)
      {
        _CUILog(4, (uint64_t)"CoreUI: %s can't get size of value skipping", v59, v60, v61, v62, v63, v64, (uint64_t)"-[CUICommonAssetStorage enumerateKeysAndObjectsWithoutIgnoringUsingBlock:]");
LABEL_16:
        uint64_t v65 = 0;
        goto LABEL_17;
      }
      if (*v58 != 1129599817)
      {
        _CUILog(4, (uint64_t)"CoreUI: %s skipping invalid CSIHeader", v59, v60, v61, v62, v63, v64, (uint64_t)"-[CUICommonAssetStorage enumerateKeysAndObjectsWithoutIgnoringUsingBlock:]");
        goto LABEL_16;
      }
      CUIFillRenditionKeyForCARKeyArray(v6, (uint64_t)v24, v80);
      uint64_t v65 = v56;
LABEL_17:
      os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
      (*((void (**)(id, unsigned __int16 *, void *))a3 + 2))(a3, v6, v65);
      os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);

      BOMTreeIteratorNext((uint64_t)v7, v66, v67, v68, v69, v70, v71, v72);
      ++v23;
    }
    while (!BOMTreeIteratorIsAtEnd((uint64_t)v7, v73, v74, v75, v76, v77, v78, v79));
  }
  free(v6);
  BOMTreeIteratorFree(v7);
  [v8 drain];
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
}

- (BOOL)enumerateColorsBlock:(id)a3
{
  colordb = self->_colordb;
  if (colordb)
  {
    id v5 = BOMTreeIteratorNew((uint64_t)colordb, 0, 0, 0);
    if (!BOMTreeIteratorIsAtEnd((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12))
    {
      do
      {
        uint64_t v20 = BOMTreeIteratorKey((uint64_t)v5, v13, v14, v15, v16, v17, v18, v19);
        uint64_t v28 = BOMTreeIteratorValue((uint64_t)v5, v21, v22, v23, v24, v25, v26, v27);
        id v29 = [objc_alloc((Class)NSString) initWithUTF8String:v20 + 4];
        (*((void (**)(id, id, void, void, void, void))a3 + 2))(a3, v29, BYTE2(*(_DWORD *)(v28 + 8)), BYTE1(*(_DWORD *)(v28 + 8)), *(_DWORD *)(v28 + 8), HIBYTE(*(_DWORD *)(v28 + 8)));

        BOMTreeIteratorNext((uint64_t)v5, v30, v31, v32, v33, v34, v35, v36);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v5, v37, v38, v39, v40, v41, v42, v43));
    }
    BOMTreeIteratorFree(v5);
  }
  return 1;
}

- (void)enumerateRenditionInfosUsingBlock:(id)a3
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  id v5 = [(CUICommonAssetStorage *)self keyFormat];
  uint64_t v6 = BOMTreeIteratorNew((uint64_t)self->_bitmapKeydb, 0, 0, 0);
  id v55 = objc_alloc_init((Class)NSAutoreleasePool);
  if (!BOMTreeIteratorIsAtEnd((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13))
  {
    do
    {
      unsigned __int16 v21 = BOMTreeIteratorKey((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
      uint64_t v29 = BOMTreeIteratorValue((uint64_t)v6, v22, v23, v24, v25, v26, v27, v28);
      uint64_t v37 = BOMTreeIteratorValueSize((uint64_t)v6, v30, v31, v32, v33, v34, v35, v36);
      if (v29 && v37)
      {
        id v45 = [objc_alloc((Class)NSData) initWithBytes:v29 length:v37];
        uint64_t v46 = [[CUINamedRenditionInfo alloc] initWithData:v45 keyFormat:v5 andPlatform:[(CUICommonAssetStorage *)self deploymentPlatform]];
        if (v46) {
          (*((void (**)(id, void, CUINamedRenditionInfo *))a3 + 2))(a3, v21, v46);
        }
      }
      BOMTreeIteratorNext((uint64_t)v6, v38, v39, v40, v41, v42, v43, v44);
    }
    while (!BOMTreeIteratorIsAtEnd((uint64_t)v6, v47, v48, v49, v50, v51, v52, v53));
  }
  BOMTreeIteratorFree(v6);
  [v55 drain];
  uint64_t v54 = [(CUICommonAssetStorage *)self lock];
  os_unfair_lock_unlock(v54);
}

- (_renditionkeytoken)_swapRenditionKeyToken:(_renditionkeytoken)a3
{
  return (_renditionkeytoken)__rev16(*(_DWORD *)&a3);
}

- (id)allRenditionNames
{
  id v3 = +[NSMutableArray array];
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  facetKeysdb = self->_facetKeysdb;
  if (facetKeysdb)
  {
    id v5 = BOMTreeIteratorNew((uint64_t)facetKeysdb, 0, 0, 0);
    uint64_t v13 = v5;
    if (v5 && !BOMTreeIteratorIsAtEnd((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12))
    {
      do
      {
        uint64_t v21 = BOMTreeIteratorKeySize((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
        uint64_t v29 = BOMTreeIteratorKey((uint64_t)v13, v22, v23, v24, v25, v26, v27, v28);
        if (v21)
        {
          id v37 = [objc_alloc((Class)NSString) initWithBytes:v29 length:v21 encoding:4];
          if (v37)
          {
            uint64_t v38 = v37;
            [v3 addObject:v37];
          }
        }
        BOMTreeIteratorNext((uint64_t)v13, v30, v31, v32, v33, v34, v35, v36);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v13, v39, v40, v41, v42, v43, v44, v45));
    }
    BOMTreeIteratorFree(v13);
  }
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v3;
}

- (id)renditionNameForKeyList:(_renditionkeytoken *)a3
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  facetKeysdb = self->_facetKeysdb;
  if (facetKeysdb)
  {
    uint64_t v13 = BOMTreeIteratorNew((uint64_t)facetKeysdb, 0, 0, 0);
    if (v13)
    {
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v13, v6, v7, v8, v9, v10, v11, v12))
      {
        uint64_t v21 = BOMTreeIteratorKeySize((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
        uint64_t v29 = BOMTreeIteratorKey((uint64_t)v13, v22, v23, v24, v25, v26, v27, v28);
        uint64_t v37 = BOMTreeIteratorValue((uint64_t)v13, v30, v31, v32, v33, v34, v35, v36);
        int v45 = *(unsigned __int16 *)(v37 + 4);
        if (*(_WORD *)(v37 + 4))
        {
          uint64_t v46 = v37;
          uint64_t v47 = 0;
          uint64_t v48 = (unsigned __int16 *)(v37 + 8);
          while (1)
          {
            int v49 = *v48;
            if (v49 != CUIRenditionKeyValueForAttribute(&a3->identifier, *(v48 - 1))) {
              break;
            }
            v48 += 2;
            if (++v47 >= (unint64_t)*(unsigned __int16 *)(v46 + 4))
            {
              if (v45)
              {
                id v50 = [objc_alloc((Class)NSString) initWithBytes:v29 length:v21 encoding:4];
                if (v50)
                {
                  id v51 = v50;
                  goto LABEL_12;
                }
              }
              break;
            }
          }
        }
        BOMTreeIteratorNext((uint64_t)v13, v38, v39, v40, v41, v42, v43, v44);
      }
    }
    id v51 = 0;
LABEL_12:
    BOMTreeIteratorFree(v13);
  }
  else
  {
    id v51 = 0;
  }
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v51;
}

- (id)renditionNamesWithKeys
{
  id v3 = +[NSMutableDictionary dictionary];
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  facetKeysdb = self->_facetKeysdb;
  if (facetKeysdb)
  {
    id v5 = BOMTreeIteratorNew((uint64_t)facetKeysdb, 0, 0, 0);
    uint64_t v13 = v5;
    if (v5 && !BOMTreeIteratorIsAtEnd((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12))
    {
      do
      {
        uint64_t v21 = BOMTreeIteratorValue((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
        uint64_t v29 = BOMTreeIteratorKeySize((uint64_t)v13, v22, v23, v24, v25, v26, v27, v28);
        id v37 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", BOMTreeIteratorKey((uint64_t)v13, v30, v31, v32, v33, v34, v35, v36), v29, 4);
        id v38 = +[NSMutableString string];
        if (*(_WORD *)(v21 + 4))
        {
          unint64_t v39 = 0;
          uint64_t v40 = (unsigned __int16 *)(v21 + 8);
          do
          {
            objc_msgSend(v38, "appendFormat:", @"%s:%d", CUIThemeAttributeNameToString(*(v40 - 1)), *v40);
            unsigned int v41 = *(unsigned __int16 *)(v21 + 4);
            if (v39 != v41 - 1)
            {
              [v38 appendString:@","];
              unsigned int v41 = *(unsigned __int16 *)(v21 + 4);
            }
            v40 += 2;
            ++v39;
          }
          while (v39 < v41);
        }
        [v3 setObject:v38 forKey:v37];

        BOMTreeIteratorNext((uint64_t)v13, v42, v43, v44, v45, v46, v47, v48);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v13, v49, v50, v51, v52, v53, v54, v55));
    }
    BOMTreeIteratorFree(v13);
  }
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v3;
}

- (id)renditionNameForKeyBaseList:(const _renditionkeytoken *)a3
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  facetKeysdb = self->_facetKeysdb;
  if (!facetKeysdb)
  {
    id v51 = 0;
    goto LABEL_16;
  }
  uint64_t v6 = BOMTreeIteratorNew((uint64_t)facetKeysdb, 0, 0, 0);
  uint64_t v14 = v6;
  if (!v6 || BOMTreeIteratorIsAtEnd((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13))
  {
LABEL_13:
    id v51 = 0;
    goto LABEL_14;
  }
  while (2)
  {
    uint64_t v22 = BOMTreeIteratorValue((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
    unsigned __int16 v30 = *(_WORD *)(v22 + 4);
    if (!v30) {
      goto LABEL_12;
    }
    uint64_t v31 = v22;
    uint64_t v32 = 0;
    uint64_t v33 = (unsigned __int16 *)(v22 + 8);
    while (*(v33 - 1) != 17)
    {
LABEL_9:
      v33 += 2;
      if (++v32 >= (unint64_t)v30) {
        goto LABEL_12;
      }
    }
    int v34 = *v33;
    if (v34 != CUIRenditionKeyValueForAttribute(&a3->identifier, 17))
    {
      unsigned __int16 v30 = *(_WORD *)(v31 + 4);
      goto LABEL_9;
    }
    uint64_t v35 = BOMTreeIteratorKeySize((uint64_t)v14, v23, v24, v25, v26, v27, v28, v29);
    id v43 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", BOMTreeIteratorKey((uint64_t)v14, v36, v37, v38, v39, v40, v41, v42), v35, 4);
    if (!v43)
    {
LABEL_12:
      BOMTreeIteratorNext((uint64_t)v14, v23, v24, v25, v26, v27, v28, v29);
      if (BOMTreeIteratorIsAtEnd((uint64_t)v14, v44, v45, v46, v47, v48, v49, v50)) {
        goto LABEL_13;
      }
      continue;
    }
    break;
  }
  id v51 = v43;
LABEL_14:
  BOMTreeIteratorFree(v14);
LABEL_16:
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v51;
}

- (BOOL)hasColorForName:(const char *)a3
{
  if (!a3 || !self->_colordb) {
    return 0;
  }
  LODWORD(v12) = 0;
  __strlcpy_chk();
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  BOOL v9 = BOMTreeValueExists((uint64_t)self->_colordb, &v11, 0x84uLL, v4, v5, v6, v7, v8) != 0;
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v9;
}

- (const)_fontValueForFontType:(id)a3
{
  if (!a3 || !self->_fontdb) {
    return 0;
  }
  memset(__s1, 0, sizeof(__s1));
  unsigned int v8 = objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __s1, 128, 0, 1, 0, 0, objc_msgSend(a3, "length"), 0);
  unsigned int result = 0;
  if (v8)
  {
    uint64_t v16 = 0;
    int ValueSize = BOMTreeGetValueSize((uint64_t)self->_fontdb, __s1, 0x80uLL, &v16, v4, v5, v6, v7);
    unsigned int result = 0;
    if (!ValueSize && v16 == 132) {
      return (const FontValue *)BOMTreeGetValue((uint64_t)self->_fontdb, __s1, 0x80uLL, v10, v11, v12, v13, v14);
    }
  }
  return result;
}

- (BOOL)getFontName:(id *)a3 baselineOffset:(float *)a4 forFontType:(id)a5
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  BOOL v9 = [(CUICommonAssetStorage *)self _fontValueForFontType:a5];
  if (v9)
  {
    if (a3) {
      *a3 = [objc_alloc((Class)NSString) initWithBytes:v9 length:strlen(v9->var0) encoding:1];
    }
    if (a4) {
      *a4 = v9->var1;
    }
  }
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v9 != 0;
}

- (BOOL)getBaselineOffset:(float *)a3 forFontType:(id)a4
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  uint64_t v7 = [(CUICommonAssetStorage *)self _fontValueForFontType:a4];
  if (a3 && v7) {
    *a3 = v7->var1;
  }
  BOOL v8 = v7 != 0;
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v8;
}

- (float)fontSizeForFontSizeType:(id)a3
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  if (a3
    && self->_fontsizedb
    && (memset(__s1, 0, sizeof(__s1)),
        (objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __s1, 128, 0, 1, 0, 0, objc_msgSend(a3, "length"), 0) & 1) != 0)&& (uint64_t v17 = 0, !BOMTreeGetValueSize((uint64_t)self->_fontsizedb, __s1, 0x80uLL, &v17, v5, v6, v7, v8))&& v17 == 4&& (Value = BOMTreeGetValue((uint64_t)self->_fontsizedb, __s1, 0x80uLL, v9, v10, v11, v12, v13)) != 0)
  {
    uint64_t v15 = (float *)Value;
    os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
    return *v15;
  }
  else
  {
    os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
    return 0.0;
  }
}

- (id)externalTags
{
  return self->_externalTags;
}

- (void)enumerateBitmapIndexUsingBlock:(id)a3
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  uint64_t v5 = [(CUICommonAssetStorage *)self keyFormat];
  int64_t v6 = [(CUICommonAssetStorage *)self deploymentPlatform];
  bitmapKeydb = self->_bitmapKeydb;
  if (bitmapKeydb)
  {
    uint64_t v8 = BOMTreeIteratorNew((uint64_t)bitmapKeydb, 0, 0, 0);
    if (!BOMTreeIteratorIsAtEnd((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15))
    {
      do
      {
        uint64_t v23 = BOMTreeIteratorKey((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);
        uint64_t v31 = BOMTreeIteratorValue((uint64_t)v8, v24, v25, v26, v27, v28, v29, v30);
        id v39 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", v31, BOMTreeIteratorValueSize((uint64_t)v8, v32, v33, v34, v35, v36, v37, v38), 0);
        uint64_t v40 = [[CUINamedRenditionInfo alloc] initWithData:v39 keyFormat:v5 andPlatform:v6];
        os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
        (*((void (**)(id, uint64_t, CUINamedRenditionInfo *))a3 + 2))(a3, v23, v40);
        os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);

        BOMTreeIteratorNext((uint64_t)v8, v41, v42, v43, v44, v45, v46, v47);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v8, v48, v49, v50, v51, v52, v53, v54));
    }
    BOMTreeIteratorFree(v8);
  }
  uint64_t v55 = [(CUICommonAssetStorage *)self lock];
  os_unfair_lock_unlock(v55);
}

- (void)_addBitmapIndexForNameIdentifier:(unsigned __int16)a3 attribute:(int)a4 withValue:(unsigned __int16)a5 toDictionary:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v11 = [objc_alloc((Class)NSNumber) initWithInt:a3];
  uint64_t v10 = (CUINamedRenditionInfo *)objc_msgSend(a6, "objectForKey:");
  if (!v10)
  {
    uint64_t v10 = [[CUINamedRenditionInfo alloc] initWithKeyFormat:[(CUICommonAssetStorage *)self keyFormat] andPlatform:[(CUICommonAssetStorage *)self deploymentPlatform]];
    [a6 setObject:v10 forKey:v11];
  }
  [(CUINamedRenditionInfo *)v10 setAttributePresent:v8 withValue:v7];
}

- (BOOL)_buildBitmapInfoIntoDictionary:(id)a3
{
  uint64_t v5 = [(CUICommonAssetStorage *)self keyFormat];
  self->_header->var4 = 0;
  int64_t v6 = BOMTreeIteratorNew((uint64_t)self->_imagedb, 0, 0, 0);
  if (BOMTreeIteratorIsAtEnd((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13))
  {
    BOOL v21 = 1;
  }
  else
  {
    do
    {
      uint64_t v22 = BOMTreeIteratorKey((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
      BOOL v21 = v22 != 0;
      if (!v22) {
        break;
      }
      uint64_t v30 = v22;
      uint64_t var2 = v5->var2;
      int64_t var3 = v5->var3;
      uint64_t v33 = (_WORD *)v22;
      if (var2)
      {
        while (1)
        {
          int v34 = *var3++;
          if (v34 == 17) {
            break;
          }
          ++v33;
          if (!--var2) {
            goto LABEL_11;
          }
        }
        uint64_t v35 = (unsigned __int16)*v33;
        if (*v33)
        {
          unint64_t v36 = 0;
          do
          {
            [(CUICommonAssetStorage *)self _addBitmapIndexForNameIdentifier:v35 attribute:v5->var3[v36] withValue:*(unsigned __int16 *)(v30 + 2 * v36) toDictionary:a3];
            ++v36;
          }
          while (v36 < v5->var2);
        }
      }
LABEL_11:
      ++self->_header->var4;
      BOMTreeIteratorNext((uint64_t)v6, v23, v24, v25, v26, v27, v28, v29);
    }
    while (!BOMTreeIteratorIsAtEnd((uint64_t)v6, v37, v38, v39, v40, v41, v42, v43));
  }
  BOMTreeIteratorFree(v6);
  return v21;
}

- (int)validateBitmapInfo
{
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  int64_t v3 = [(CUICommonAssetStorage *)self deploymentPlatform];
  if (self->_bitmapKeydb)
  {
    int64_t v4 = v3;
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [(CUICommonAssetStorage *)self _buildBitmapInfoIntoDictionary:v5];
    int64_t v6 = BOMTreeIteratorNew((uint64_t)self->_bitmapKeydb, 0, 0, 0);
    if (BOMTreeIteratorIsAtEnd((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13))
    {
      BOMTreeIteratorFree(v6);
    }
    else
    {
      int v22 = 1;
      do
      {
        uint64_t v23 = BOMTreeIteratorKey((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
        uint64_t v31 = BOMTreeIteratorValue((uint64_t)v6, v24, v25, v26, v27, v28, v29, v30);
        id v39 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v31, BOMTreeIteratorValueSize((uint64_t)v6, v32, v33, v34, v35, v36, v37, v38));
        uint64_t v40 = [[CUINamedRenditionInfo alloc] initWithData:v39 keyFormat:[(CUICommonAssetStorage *)self keyFormat] andPlatform:v4];
        id v41 = [objc_alloc((Class)NSNumber) initWithInt:v23];
        id v42 = [v5 objectForKey:v41];
        if (v42 && [(CUINamedRenditionInfo *)v40 isEqualToNamedRenditionInfo:v42]) {
          [v5 removeObjectForKey:v41];
        }
        else {
          int v22 = 0;
        }

        BOMTreeIteratorNext((uint64_t)v6, v43, v44, v45, v46, v47, v48, v49);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v6, v50, v51, v52, v53, v54, v55, v56));
      BOMTreeIteratorFree(v6);
      if (!v22)
      {
        int v21 = 0;
        goto LABEL_13;
      }
    }
    int v21 = [v5 count] == 0;
LABEL_13:

    goto LABEL_14;
  }
  int v21 = -1;
LABEL_14:
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v21;
}

- (int)validatekeyformat
{
  if (!BOMStorageGetNamedBlock([(CUICommonAssetStorage *)self _bomStorage], "KEYFORMATWORKAROUND"))return -1; {
  unsigned int NamedBlock = BOMStorageGetNamedBlock([(CUICommonAssetStorage *)self _bomStorage], "KEYFORMAT");
  }
  if (!NamedBlock) {
    return 0;
  }
  unsigned int v4 = NamedBlock;
  id v5 = [(CUICommonAssetStorage *)self _bomStorage];
  size_t v12 = BOMStorageSizeOfBlock((uint64_t)v5, v4, v6, v7, v8, v9, v10, v11);
  uint64_t v13 = (unsigned int *)malloc_type_malloc(v12, 0xB514310EuLL);
  uint64_t v14 = [(CUICommonAssetStorage *)self _bomStorage];
  BOMStorageCopyFromBlock((uint64_t)v14, v4, v13, v15, v16, v17, v18, v19);
  uint64_t v20 = v13[2];
  if (v20)
  {
    int v21 = v13 + 3;
    while (1)
    {
      unsigned int v22 = *v21++;
      if (v22 >= 0x18) {
        break;
      }
      if (!--v20) {
        goto LABEL_7;
      }
    }
    int v23 = 0;
  }
  else
  {
LABEL_7:
    int v23 = 1;
  }
  free(v13);
  return v23;
}

- (int)validateFile
{
  return ![(CUICommonAssetStorage *)self enumerateKeysAndObjectsUsingBlock:&__block_literal_global_8];
}

- (id)nameForAppearanceIdentifier:(unsigned __int16)a3
{
  if (!self->_appearancedb) {
    return &stru_1EF488038;
  }
  int v3 = a3;
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  id v5 = BOMTreeIteratorNew((uint64_t)self->_appearancedb, 0, 0, 0);
  uint64_t v20 = &stru_1EF488038;
  if (!BOMTreeIteratorIsAtEnd((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12))
  {
    while (1)
    {
      int v21 = (unsigned __int16 *)BOMTreeIteratorValue((uint64_t)v5, v13, v14, v15, v16, v17, v18, v19);
      if (v21)
      {
        if (*v21 == v3) {
          break;
        }
      }
      BOMTreeIteratorNext((uint64_t)v5, v22, v23, v24, v25, v26, v27, v28);
      if (BOMTreeIteratorIsAtEnd((uint64_t)v5, v29, v30, v31, v32, v33, v34, v35)) {
        goto LABEL_9;
      }
    }
    uint64_t v36 = BOMTreeIteratorKey((uint64_t)v5, v22, v23, v24, v25, v26, v27, v28);
    uint64_t v20 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v36, BOMTreeIteratorKeySize((uint64_t)v5, v37, v38, v39, v40, v41, v42, v43), 4);
    uint64_t v44 = v20;
  }
LABEL_9:
  BOMTreeIteratorFree(v5);
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v20;
}

- (id)nameForLocalizationIdentifier:(unsigned __int16)a3
{
  if (!self->_localizationdb) {
    return &stru_1EF488038;
  }
  int v3 = a3;
  os_unfair_lock_lock([(CUICommonAssetStorage *)self lock]);
  id v5 = BOMTreeIteratorNew((uint64_t)self->_localizationdb, 0, 0, 0);
  uint64_t v20 = &stru_1EF488038;
  if (!BOMTreeIteratorIsAtEnd((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12))
  {
    while (1)
    {
      int v21 = (unsigned __int16 *)BOMTreeIteratorValue((uint64_t)v5, v13, v14, v15, v16, v17, v18, v19);
      if (v21)
      {
        if (*v21 == v3) {
          break;
        }
      }
      BOMTreeIteratorNext((uint64_t)v5, v22, v23, v24, v25, v26, v27, v28);
      if (BOMTreeIteratorIsAtEnd((uint64_t)v5, v29, v30, v31, v32, v33, v34, v35)) {
        goto LABEL_9;
      }
    }
    uint64_t v36 = BOMTreeIteratorKey((uint64_t)v5, v22, v23, v24, v25, v26, v27, v28);
    uint64_t v20 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v36, BOMTreeIteratorKeySize((uint64_t)v5, v37, v38, v39, v40, v41, v42, v43), 4);
    uint64_t v44 = v20;
  }
LABEL_9:
  BOMTreeIteratorFree(v5);
  os_unfair_lock_unlock([(CUICommonAssetStorage *)self lock]);
  return v20;
}

- (BOOL)writeToPath:(id)a3 withTreePageSize:(unsigned int)a4
{
  uint64_t v6 = BOMTreeStorage((uint64_t)self->_imagedb);
  uint64_t v7 = BOMStorageNewWithOptionsAndSys((uint64_t)[a3 fileSystemRepresentation], 0, 0);
  if (!v7)
  {
    _CUILog(4, (uint64_t)"CoreUI: Error: CUICommonAssetStorage -writeToPath:withTreePageSize: write file at '%@'", v8, v9, v10, v11, v12, v13, (uint64_t)a3);
    return 0;
  }
  uint64_t v14 = v7;
  if (!__copyBlock(v6, v7, "CARHEADER")
    || !__copyBlock(v6, v14, "CARGLOBALS")
    || !__copyBlock(v6, v14, "KEYFORMAT")
    || !__copyBlock(v6, v14, "KEYFORMATWORKAROUND")
    || !__copyBlock(v6, v14, "EXTERNAL_KEYS")
    || !__copyBlock(v6, v14, "EXTENDED_METADATA")
    || !__copyTree(v6, v14, "RENDITIONS", a4)
    || !__copyTree(v6, v14, "COLORS", a4)
    || !__copyTree(v6, v14, "FONTS", a4)
    || !__copyTree(v6, v14, "FONTSIZES", a4)
    || !__copyTree(v6, v14, "BEZELS", a4)
    || !__copyTree(v6, v14, "FACETKEYS", a4)
    || !__copyTree(v6, v14, "BITMAPKEYS", a4)
    || !__copyTree(v6, v14, "APPEARANCEKEYS", a4))
  {
    return 0;
  }
  return __copyTree(v6, v14, "LOCALIZATIONKEYS", a4);
}

- (_carheader)header
{
  return self->_header;
}

- (void)setHeader:(_carheader *)a3
{
  self->_header = a3;
}

- (_carextendedMetadata)extendedMetadata
{
  return self->_extendedMetadata;
}

- (void)setExtendedMetadata:(_carextendedMetadata *)a3
{
  self->_extendedMetadata = a3;
}

- (_renditionkeyfmt)keyfmt
{
  return self->_keyfmt;
}

- (void)setKeyfmt:(_renditionkeyfmt *)a3
{
  self->_keyfmt = a3;
}

- (void)setImagedb:(void *)a3
{
  self->_imagedb = a3;
}

- (void)colordb
{
  return self->_colordb;
}

- (void)setColordb:(void *)a3
{
  self->_colordb = a3;
}

- (void)fontdb
{
  return self->_fontdb;
}

- (void)setFontdb:(void *)a3
{
  self->_fontdb = a3;
}

- (void)fontsizedb
{
  return self->_fontsizedb;
}

- (void)setFontsizedb:(void *)a3
{
  self->_fontsizedb = a3;
}

- (void)facetKeysdb
{
  return self->_facetKeysdb;
}

- (void)setFacetKeysdb:(void *)a3
{
  self->_facetKeysdb = a3;
}

- (void)bitmapKeydb
{
  return self->_bitmapKeydb;
}

- (void)setBitmapKeydb:(void *)a3
{
  self->_bitmapKeydb = a3;
}

- (void)appearancedb
{
  return self->_appearancedb;
}

- (void)setAppearancedb:(void *)a3
{
  self->_appearancedb = a3;
}

- (void)setLocalizationdb:(void *)a3
{
  self->_localizationdb = a3;
}

- (NSData)globals
{
  return self->_globals;
}

- (void)setGlobals:(id)a3
{
}

@end