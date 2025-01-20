@interface GEOActiveTileSet
+ (BOOL)isValid:(id)a3;
+ (Class)countryRegionAllowlistType;
+ (Class)deviceSKUAllowlistType;
+ (Class)sentinelTileType;
+ (Class)supportedLanguageType;
+ (id)buildDisputedBordersQueryItemsForCountry:(id)a3 region:(id)a4;
- (BOOL)hasBaseURL;
- (BOOL)hasChecksumType;
- (BOOL)hasLocalizationURL;
- (BOOL)hasRequestStyle;
- (BOOL)hasTimeToLiveSeconds;
- (BOOL)hasUpdateBehavior;
- (BOOL)hasUseAuthProxy;
- (BOOL)isAvailableForTileKey:(uint64_t)a3;
- (BOOL)isDisputedBordersAllowlistedForCountry:(id)a3 region:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentTileSet:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)useAuthProxy;
- (GEOActiveTileSet)init;
- (GEOActiveTileSet)initWithData:(id)a3;
- (GEOActiveTileSet)initWithDictionary:(id)a3;
- (GEOActiveTileSet)initWithJSON:(id)a3;
- (GEOTileSetRegion)availableTiles;
- (GEOTileSetRegion)availableTilesAtIndex:(SEL)a3;
- (NSMutableArray)countryRegionAllowlists;
- (NSMutableArray)deviceSKUAllowlists;
- (NSMutableArray)sentinelTiles;
- (NSMutableArray)supportedLanguages;
- (NSString)baseURL;
- (NSString)localizationURL;
- (PBUnknownFields)unknownFields;
- (id)_bestCountryRegionAllowlistMatchForCountry:(id)a3 region:(id)a4;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(char)a3 isJSON:;
- (id)bestLanguageWithOverrideLocale:(id)a3;
- (id)checksumTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)countryRegionAllowlistAtIndex:(unint64_t)a3;
- (id)dataForGenericTileType:(int)a3 configuration:(id)a4;
- (id)description;
- (id)deviceSKUAllowlistAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)disputedBordersOfflineKeySuffixForCountry:(id)a3 region:(id)a4;
- (id)disputedBordersQueryItemsForCountry:(id)a3 region:(id)a4;
- (id)initWithTileSet:(int)a3 version:(void *)a4 resourceManifest:;
- (id)jsonRepresentation;
- (id)requestStyleAsString:(int)a3;
- (id)scaleAsString:(int)a3;
- (id)sentinelTileAtIndex:(unint64_t)a3;
- (id)sizeAsString:(int)a3;
- (id)styleAsString:(int)a3;
- (id)supportedLanguageAtIndex:(unint64_t)a3;
- (id)updateBehaviorAsString:(int)a3;
- (int)StringAsChecksumType:(id)a3;
- (int)StringAsRequestStyle:(id)a3;
- (int)StringAsScale:(id)a3;
- (int)StringAsSize:(id)a3;
- (int)StringAsStyle:(id)a3;
- (int)StringAsUpdateBehavior:(id)a3;
- (int)checksumType;
- (int)requestStyle;
- (int)scale;
- (int)size;
- (int)style;
- (int)updateBehavior;
- (uint64_t)_reserveAvailableTiles:(uint64_t)a1;
- (unint64_t)availableTilesCount;
- (unint64_t)countryRegionAllowlistsCount;
- (unint64_t)deviceSKUAllowlistsCount;
- (unint64_t)hash;
- (unint64_t)sentinelTilesCount;
- (unint64_t)supportedLanguagesCount;
- (unsigned)largestZoomLevelLEQ:(unsigned int)a3 inRect:(id)a4;
- (unsigned)maximumZoomLevelForMapPoint:(id)a3;
- (unsigned)maximumZoomLevelInRect:(id)a3;
- (unsigned)minimumZoomLevelForMapPoint:(id)a3;
- (unsigned)minimumZoomLevelInRect:(id)a3;
- (unsigned)timeToLiveSeconds;
- (unsigned)version;
- (void)_addNoFlagsCountryRegionAllowlist:(uint64_t)a1;
- (void)_addNoFlagsDeviceSKUAllowlist:(uint64_t)a1;
- (void)_addNoFlagsSentinelTile:(uint64_t)a1;
- (void)_addNoFlagsSupportedLanguage:(uint64_t)a1;
- (void)_readAvailableTiles;
- (void)_readBaseURL;
- (void)_readCountryRegionAllowlists;
- (void)_readDeviceSKUAllowlists;
- (void)_readLocalizationURL;
- (void)_readSentinelTiles;
- (void)_readSupportedLanguages;
- (void)_resetBestLanguage;
- (void)addAvailableTiles:(GEOTileSetRegion *)a3;
- (void)addCountryRegionAllowlist:(id)a3;
- (void)addDeviceSKUAllowlist:(id)a3;
- (void)addSentinelTile:(id)a3;
- (void)addSupportedLanguage:(id)a3;
- (void)clearAvailableTiles;
- (void)clearCountryRegionAllowlists;
- (void)clearDeviceSKUAllowlists;
- (void)clearSentinelTiles;
- (void)clearSupportedLanguages;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAvailableTiles:(GEOTileSetRegion *)a3 count:(unint64_t)a4;
- (void)setBaseURL:(id)a3;
- (void)setChecksumType:(int)a3;
- (void)setCountryRegionAllowlists:(id)a3;
- (void)setDeviceSKUAllowlists:(id)a3;
- (void)setHasChecksumType:(BOOL)a3;
- (void)setHasRequestStyle:(BOOL)a3;
- (void)setHasTimeToLiveSeconds:(BOOL)a3;
- (void)setHasUpdateBehavior:(BOOL)a3;
- (void)setHasUseAuthProxy:(BOOL)a3;
- (void)setLocalizationURL:(id)a3;
- (void)setRequestStyle:(int)a3;
- (void)setScale:(int)a3;
- (void)setSentinelTiles:(id)a3;
- (void)setSize:(int)a3;
- (void)setStyle:(int)a3;
- (void)setSupportedLanguages:(id)a3;
- (void)setTimeToLiveSeconds:(unsigned int)a3;
- (void)setUpdateBehavior:(int)a3;
- (void)setUseAuthProxy:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOActiveTileSet

- (BOOL)hasTimeToLiveSeconds
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)timeToLiveSeconds
{
  return self->_timeToLiveSeconds;
}

- (int)size
{
  return self->_size;
}

- (int)style
{
  return self->_style;
}

- (int)scale
{
  return self->_scale;
}

- (unsigned)minimumZoomLevelInRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  if (![(GEOActiveTileSet *)self availableTilesCount]) {
    return 0;
  }
  unint64_t v8 = [(GEOActiveTileSet *)self availableTilesCount];
  v9 = [(GEOActiveTileSet *)self availableTiles];
  if (!v8) {
    return 100;
  }
  p_double var0 = &v9->var0;
  unsigned int v11 = 100;
  do
  {
    unsigned int v12 = p_var0[5];
    if (v12 <= 1) {
      unsigned int v12 = 1;
    }
    if (v12 >= p_var0[2]) {
      unsigned int v13 = p_var0[2];
    }
    else {
      unsigned int v13 = v12;
    }
    if (v13) {
      BOOL v14 = v13 >= v11;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14 && GEOTileSetRegionIntersectsMapRect(p_var0, v6, v5, var0, var1)) {
      unsigned int v11 = v13;
    }
    p_var0 += 6;
    --v8;
  }
  while (v8);
  return v11;
}

- (GEOTileSetRegion)availableTiles
{
  return self->_availableTiles;
}

- (unint64_t)availableTilesCount
{
  return self->_availableTilesCount;
}

- (void)_readAvailableTiles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAvailableTiles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unsigned)maximumZoomLevelInRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  unint64_t v8 = [(GEOActiveTileSet *)self availableTilesCount];
  if (!v8) {
    return 21;
  }
  unint64_t v9 = v8;
  v10 = [(GEOActiveTileSet *)self availableTiles];
  unsigned int var2 = 0;
  do
  {
    if (v10->var2 > var2 && GEOTileSetRegionIntersectsMapRect(&v10->var0, v6, v5, var0, var1)) {
      unsigned int var2 = v10->var2;
    }
    ++v10;
    --v9;
  }
  while (v9);
  return var2;
}

- (void)_addNoFlagsSupportedLanguage:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOActiveTileSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOActiveTileSet;
  v2 = [(GEOActiveTileSet *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (uint64_t)_reserveAvailableTiles:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 40);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (24 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 24 * v9, 0x79F00F76uLL);
    if (result)
    {
      *(void *)(a1 + 40) = v9;
      *(void *)(a1 + 24) = result;
      bzero((void *)(result + 24 * *(void *)(a1 + 32)), 24 * (v9 - *(void *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)_addNoFlagsCountryRegionAllowlist:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    unint64_t v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      unint64_t v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsSentinelTile:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    unint64_t v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      unint64_t v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (BOOL)hasBaseURL
{
  return self->_baseURL != 0;
}

- (void)_readBaseURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBaseURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unsigned)version
{
  return self->_version;
}

- (id)bestLanguageWithOverrideLocale:(id)a3
{
  id v4 = a3;
  if (v4
    || (objc_getAssociatedObject(self, &GEOActiveTileSetBestLanguageKey),
        (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    id v7 = v6;
    if (v4)
    {
      unint64_t v8 = (void *)MEMORY[0x1E4F1CA48];
      unint64_t v9 = [v4 localeIdentifier];
      id v7 = [v8 arrayWithObject:v9];

      [v7 addObjectsFromArray:v6];
    }
    v10 = (void *)MEMORY[0x1E4F1CA20];
    unsigned int v11 = [(GEOActiveTileSet *)self supportedLanguages];
    id v5 = [v10 mostPreferredLanguageOf:v11 withPreferredLanguages:v7 forUsage:1 options:0];

    if (!v4 && v5) {
      objc_setAssociatedObject(self, &GEOActiveTileSetBestLanguageKey, v5, (void *)0x303);
    }
  }

  return v5;
}

- (NSMutableArray)supportedLanguages
{
  -[GEOActiveTileSet _readSupportedLanguages]((uint64_t)self);
  supportedLanguages = self->_supportedLanguages;

  return supportedLanguages;
}

- (void)_readSupportedLanguages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedLanguages_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEOActiveTileSet *)self readAll:1];
  [v4 readAll:1];
  baseURL = self->_baseURL;
  if ((unint64_t)baseURL | (unint64_t)v4[6])
  {
    if (!-[NSString isEqual:](baseURL, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (self->_style != *((_DWORD *)v4 + 31)
    || self->_scale != *((_DWORD *)v4 + 29)
    || self->_size != *((_DWORD *)v4 + 30)
    || self->_version != *((_DWORD *)v4 + 34))
  {
    goto LABEL_15;
  }
  __int16 v6 = *((_WORD *)v4 + 72);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_timeToLiveSeconds != *((_DWORD *)v4 + 32)) {
      goto LABEL_15;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_15;
  }
  unint64_t availableTilesCount = self->_availableTilesCount;
  if ((const void *)availableTilesCount != v4[4]) {
    goto LABEL_15;
  }
  if (memcmp(self->_availableTiles, v4[3], 24 * availableTilesCount)) {
    goto LABEL_15;
  }
  sentinelTiles = self->_sentinelTiles;
  if ((unint64_t)sentinelTiles | (unint64_t)v4[10])
  {
    if (!-[NSMutableArray isEqual:](sentinelTiles, "isEqual:")) {
      goto LABEL_15;
    }
  }
  localizationURL = self->_localizationURL;
  if ((unint64_t)localizationURL | (unint64_t)v4[9])
  {
    if (!-[NSString isEqual:](localizationURL, "isEqual:")) {
      goto LABEL_15;
    }
  }
  supportedLanguages = self->_supportedLanguages;
  if ((unint64_t)supportedLanguages | (unint64_t)v4[11])
  {
    if (!-[NSMutableArray isEqual:](supportedLanguages, "isEqual:")) {
      goto LABEL_15;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v14 = *((_WORD *)v4 + 72);
  if ((flags & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_updateBehavior != *((_DWORD *)v4 + 33)) {
      goto LABEL_15;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_15;
  }
  countryRegionAllowlists = self->_countryRegionAllowlists;
  if ((unint64_t)countryRegionAllowlists | (unint64_t)v4[7])
  {
    if (!-[NSMutableArray isEqual:](countryRegionAllowlists, "isEqual:")) {
      goto LABEL_15;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v14 = *((_WORD *)v4 + 72);
  }
  if (flags)
  {
    if ((v14 & 1) == 0 || self->_checksumType != *((_DWORD *)v4 + 27)) {
      goto LABEL_15;
    }
  }
  else if (v14)
  {
    goto LABEL_15;
  }
  if ((flags & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_requestStyle != *((_DWORD *)v4 + 28)) {
      goto LABEL_15;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_15;
  }
  if ((flags & 0x10) == 0)
  {
    if ((v14 & 0x10) == 0) {
      goto LABEL_49;
    }
LABEL_15:
    char v8 = 0;
    goto LABEL_16;
  }
  if ((v14 & 0x10) == 0) {
    goto LABEL_15;
  }
  if (!self->_useAuthProxy)
  {
    if (!*((unsigned char *)v4 + 140)) {
      goto LABEL_49;
    }
    goto LABEL_15;
  }
  if (!*((unsigned char *)v4 + 140)) {
    goto LABEL_15;
  }
LABEL_49:
  deviceSKUAllowlists = self->_deviceSKUAllowlists;
  if ((unint64_t)deviceSKUAllowlists | (unint64_t)v4[8]) {
    char v8 = -[NSMutableArray isEqual:](deviceSKUAllowlists, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_16:

  return v8;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      char v8 = (int *)&readAll__recursiveTag_1065;
    }
    else {
      char v8 = (int *)&readAll__nonRecursiveTag_1066;
    }
    GEOActiveTileSetReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOActiveTileSetCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOActiveTileSet)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOActiveTileSet;
  BOOL v3 = [(GEOActiveTileSet *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  [(GEOActiveTileSet *)self clearAvailableTiles];
  v3.receiver = self;
  v3.super_class = (Class)GEOActiveTileSet;
  [(GEOActiveTileSet *)&v3 dealloc];
}

- (NSString)baseURL
{
  -[GEOActiveTileSet _readBaseURL]((uint64_t)self);
  baseURL = self->_baseURL;

  return baseURL;
}

- (void)setBaseURL:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (void)setStyle:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_style = a3;
}

- (id)styleAsString:(int)a3
{
  id v4 = @"RASTER_STANDARD";
  switch(a3)
  {
    case 0:
      goto LABEL_27;
    case 1:
      id v4 = @"VECTOR_STANDARD";
      break;
    case 2:
      id v4 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
      break;
    case 3:
      id v4 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
      break;
    case 4:
      id v4 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
      break;
    case 5:
      id v4 = @"RASTER_STANDARD_BACKGROUND";
      break;
    case 6:
      id v4 = @"RASTER_HYBRID";
      break;
    case 7:
      id v4 = @"RASTER_SATELLITE";
      break;
    case 8:
      id v4 = @"RASTER_TERRAIN";
      break;
    case 11:
      id v4 = @"VECTOR_BUILDINGS";
      break;
    case 12:
      id v4 = @"VECTOR_TRAFFIC";
      break;
    case 13:
      id v4 = @"VECTOR_POI";
      break;
    case 14:
      id v4 = @"SPUTNIK_METADATA";
      break;
    case 15:
      id v4 = @"SPUTNIK_C3M";
      break;
    case 16:
      id v4 = @"SPUTNIK_DSM";
      break;
    case 17:
      id v4 = @"SPUTNIK_DSM_GLOBAL";
      break;
    case 18:
      id v4 = @"VECTOR_REALISTIC";
      break;
    case 19:
      id v4 = @"VECTOR_LEGACY_REALISTIC";
      break;
    case 20:
      id v4 = @"VECTOR_ROADS";
      break;
    case 21:
      id v4 = @"RASTER_VEGETATION";
      break;
    case 22:
      id v4 = @"VECTOR_TRAFFIC_SKELETON";
      break;
    case 23:
      id v4 = @"RASTER_COASTLINE_MASK";
      break;
    case 24:
      id v4 = @"RASTER_HILLSHADE";
      break;
    case 25:
      id v4 = @"VECTOR_TRAFFIC_WITH_GREEN";
      break;
    case 26:
      id v4 = @"VECTOR_TRAFFIC_STATIC";
      break;
    case 27:
      id v4 = @"RASTER_COASTLINE_DROP_MASK";
      break;
    case 28:
      id v4 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
      break;
    case 29:
      id v4 = @"VECTOR_SPEED_PROFILES";
      break;
    case 30:
      id v4 = @"VECTOR_VENUES";
      break;
    case 31:
      id v4 = @"RASTER_DOWN_SAMPLED";
      break;
    case 32:
      id v4 = @"RASTER_COLOR_BALANCED";
      break;
    case 33:
      id v4 = @"RASTER_SATELLITE_NIGHT";
      break;
    case 34:
      id v4 = @"SPUTNIK_VECTOR_BORDER";
      break;
    case 35:
      id v4 = @"RASTER_SATELLITE_DIGITIZE";
      break;
    case 36:
      id v4 = @"RASTER_HILLSHADE_PARKS";
      break;
    case 37:
      id v4 = @"VECTOR_TRANSIT";
      break;
    case 38:
      id v4 = @"RASTER_STANDARD_BASE";
      break;
    case 39:
      id v4 = @"RASTER_STANDARD_LABELS";
      break;
    case 40:
      id v4 = @"RASTER_HYBRID_ROADS";
      break;
    case 41:
      id v4 = @"RASTER_HYBRID_LABELS";
      break;
    case 42:
      id v4 = @"FLYOVER_C3M_MESH";
      break;
    case 43:
      id v4 = @"FLYOVER_C3M_JPEG_TEXTURE";
      break;
    case 44:
      id v4 = @"FLYOVER_C3M_ASTC_TEXTURE";
      break;
    case 45:
      id v4 = @"RASTER_SATELLITE_ASTC";
      break;
    case 46:
      id v4 = @"RASTER_HYBRID_ROADS_AND_LABELS";
      break;
    case 47:
      id v4 = @"VECTOR_TRANSIT_SELECTION";
      break;
    case 48:
      id v4 = @"VECTOR_COVERAGE";
      break;
    case 52:
      id v4 = @"FLYOVER_METADATA";
      break;
    case 53:
      id v4 = @"VECTOR_ROAD_NETWORK";
      break;
    case 54:
      id v4 = @"VECTOR_LAND_COVER";
      break;
    case 55:
      id v4 = @"VECTOR_DEBUG";
      break;
    case 56:
      id v4 = @"VECTOR_STREET_POI";
      break;
    case 57:
      id v4 = @"MUNIN_METADATA";
      break;
    case 58:
      id v4 = @"VECTOR_SPR_MERCATOR";
      break;
    case 59:
      id v4 = @"VECTOR_SPR_MODELS";
      break;
    case 60:
      id v4 = @"VECTOR_SPR_MATERIALS";
      break;
    case 61:
      id v4 = @"VECTOR_SPR_METADATA";
      break;
    case 62:
      id v4 = @"VECTOR_TRACKS";
      break;
    case 63:
      id v4 = @"VECTOR_RESERVED_2";
      break;
    case 64:
      id v4 = @"VECTOR_STREET_LANDMARKS";
      break;
    case 65:
      id v4 = @"COARSE_LOCATION_POLYGONS";
      break;
    case 66:
      id v4 = @"VECTOR_SPR_ROADS";
      break;
    case 67:
      id v4 = @"VECTOR_SPR_STANDARD";
      break;
    case 68:
      id v4 = @"VECTOR_POI_V2";
      break;
    case 69:
      id v4 = @"VECTOR_POLYGON_SELECTION";
      break;
    case 70:
      id v4 = @"VL_METADATA";
      break;
    case 71:
      id v4 = @"VL_DATA";
      break;
    case 72:
      id v4 = @"PROACTIVE_APP_CLIP";
      break;
    case 73:
      id v4 = @"VECTOR_BUILDINGS_V2";
      break;
    case 74:
      id v4 = @"POI_BUSYNESS";
      break;
    case 75:
      id v4 = @"POI_DP_BUSYNESS";
      break;
    case 76:
      id v4 = @"SMART_INTERFACE_SELECTION";
      break;
    case 77:
      id v4 = @"VECTOR_ASSETS";
      break;
    case 78:
      id v4 = @"SPR_ASSET_METADATA";
      break;
    case 79:
      id v4 = @"VECTOR_SPR_POLAR";
      break;
    case 80:
      id v4 = @"SMART_DATA_MODE";
      break;
    case 81:
      id v4 = @"CELLULAR_PERFORMANCE_SCORE";
      break;
    case 82:
      id v4 = @"VECTOR_SPR_MODELS_OCCLUSION";
      break;
    case 83:
      id v4 = @"VECTOR_TOPOGRAPHIC";
      break;
    case 84:
      id v4 = @"VECTOR_POI_V2_UPDATE";
      break;
    case 85:
      id v4 = @"VECTOR_LIVE_DATA_UPDATES";
      break;
    case 86:
      id v4 = @"VECTOR_TRAFFIC_V2";
      break;
    case 87:
      id v4 = @"VECTOR_ROAD_SELECTION";
      break;
    case 88:
      id v4 = @"VECTOR_REGION_METADATA";
      break;
    case 89:
      id v4 = @"RAY_TRACING";
      break;
    case 90:
      id v4 = @"VECTOR_CONTOURS";
      break;
    case 91:
      id v4 = @"RASTER_SATELLITE_POLAR";
      break;
    case 92:
      id v4 = @"VMAP4_ELEVATION";
      break;
    case 93:
      id v4 = @"VMAP4_ELEVATION_POLAR";
      break;
    case 94:
      id v4 = @"CELLULAR_COVERAGE_PLMN";
      break;
    case 95:
      id v4 = @"RASTER_SATELLITE_POLAR_NIGHT";
      break;
    case 96:
      id v4 = @"UNUSED_96";
      break;
    case 97:
      id v4 = @"UNUSED_97";
      break;
    case 98:
      id v4 = @"UNUSED_98";
      break;
    case 99:
      id v4 = @"UNUSED_99";
      break;
    case 100:
      id v4 = @"UNUSED_100";
      break;
    case 101:
      id v4 = @"UNUSED_101";
      break;
    case 102:
      id v4 = @"UNUSED_102";
      break;
    case 103:
      id v4 = @"UNUSED_103";
      break;
    case 104:
      id v4 = @"UNUSED_104";
      break;
    case 105:
      id v4 = @"UNUSED_105";
      break;
    case 106:
      id v4 = @"UNUSED_106";
      break;
    case 107:
      id v4 = @"UNUSED_107";
      break;
    case 108:
      id v4 = @"UNUSED_108";
      break;
    case 109:
      id v4 = @"UNUSED_109";
      break;
    case 110:
      id v4 = @"UNUSED_110";
      break;
    case 111:
      id v4 = @"UNUSED_111";
      break;
    case 112:
      id v4 = @"UNUSED_112";
      break;
    case 113:
      id v4 = @"UNUSED_113";
      break;
    case 114:
      id v4 = @"UNUSED_114";
      break;
    case 115:
      id v4 = @"UNUSED_115";
      break;
    case 116:
      id v4 = @"UNUSED_116";
      break;
    case 117:
      id v4 = @"UNUSED_117";
      break;
    case 118:
      id v4 = @"UNUSED_118";
      break;
    case 119:
      id v4 = @"UNUSED_119";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_27:
      break;
  }
  return v4;
}

- (int)StringAsStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RASTER_STANDARD"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VECTOR_STANDARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RASTER_STANDARD_BACKGROUND"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RASTER_HYBRID"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RASTER_TERRAIN"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"VECTOR_BUILDINGS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"VECTOR_POI"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_METADATA"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_C3M"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_DSM"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_DSM_GLOBAL"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"VECTOR_REALISTIC"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"VECTOR_LEGACY_REALISTIC"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"VECTOR_ROADS"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"RASTER_VEGETATION"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_SKELETON"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"RASTER_COASTLINE_MASK"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"RASTER_HILLSHADE"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_WITH_GREEN"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_STATIC"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"RASTER_COASTLINE_DROP_MASK"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPEED_PROFILES"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"VECTOR_VENUES"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"RASTER_DOWN_SAMPLED"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"RASTER_COLOR_BALANCED"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_NIGHT"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_VECTOR_BORDER"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_DIGITIZE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"RASTER_HILLSHADE_PARKS"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRANSIT"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"RASTER_STANDARD_BASE"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"RASTER_STANDARD_LABELS"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"RASTER_HYBRID_ROADS"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"RASTER_HYBRID_LABELS"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"FLYOVER_C3M_MESH"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"FLYOVER_C3M_JPEG_TEXTURE"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"FLYOVER_C3M_ASTC_TEXTURE"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_ASTC"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"RASTER_HYBRID_ROADS_AND_LABELS"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRANSIT_SELECTION"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"VECTOR_COVERAGE"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"FLYOVER_METADATA"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"VECTOR_ROAD_NETWORK"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"VECTOR_LAND_COVER"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"VECTOR_DEBUG"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"VECTOR_STREET_POI"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"MUNIN_METADATA"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_MERCATOR"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_MODELS"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_MATERIALS"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_METADATA"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRACKS"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"VECTOR_RESERVED_2"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"VECTOR_STREET_LANDMARKS"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"COARSE_LOCATION_POLYGONS"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_ROADS"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_STANDARD"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"VECTOR_POI_V2"])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:@"VECTOR_POLYGON_SELECTION"])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:@"VL_METADATA"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"VL_DATA"])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_APP_CLIP"])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:@"VECTOR_BUILDINGS_V2"])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:@"POI_BUSYNESS"])
  {
    int v4 = 74;
  }
  else if ([v3 isEqualToString:@"POI_DP_BUSYNESS"])
  {
    int v4 = 75;
  }
  else if ([v3 isEqualToString:@"SMART_INTERFACE_SELECTION"])
  {
    int v4 = 76;
  }
  else if ([v3 isEqualToString:@"VECTOR_ASSETS"])
  {
    int v4 = 77;
  }
  else if ([v3 isEqualToString:@"SPR_ASSET_METADATA"])
  {
    int v4 = 78;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_POLAR"])
  {
    int v4 = 79;
  }
  else if ([v3 isEqualToString:@"SMART_DATA_MODE"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"CELLULAR_PERFORMANCE_SCORE"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_MODELS_OCCLUSION"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"VECTOR_TOPOGRAPHIC"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"VECTOR_POI_V2_UPDATE"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"VECTOR_LIVE_DATA_UPDATES"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_V2"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"VECTOR_ROAD_SELECTION"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"VECTOR_REGION_METADATA"])
  {
    int v4 = 88;
  }
  else if ([v3 isEqualToString:@"RAY_TRACING"])
  {
    int v4 = 89;
  }
  else if ([v3 isEqualToString:@"VECTOR_CONTOURS"])
  {
    int v4 = 90;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_POLAR"])
  {
    int v4 = 91;
  }
  else if ([v3 isEqualToString:@"VMAP4_ELEVATION"])
  {
    int v4 = 92;
  }
  else if ([v3 isEqualToString:@"VMAP4_ELEVATION_POLAR"])
  {
    int v4 = 93;
  }
  else if ([v3 isEqualToString:@"CELLULAR_COVERAGE_PLMN"])
  {
    int v4 = 94;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_POLAR_NIGHT"])
  {
    int v4 = 95;
  }
  else if ([v3 isEqualToString:@"UNUSED_96"])
  {
    int v4 = 96;
  }
  else if ([v3 isEqualToString:@"UNUSED_97"])
  {
    int v4 = 97;
  }
  else if ([v3 isEqualToString:@"UNUSED_98"])
  {
    int v4 = 98;
  }
  else if ([v3 isEqualToString:@"UNUSED_99"])
  {
    int v4 = 99;
  }
  else if ([v3 isEqualToString:@"UNUSED_100"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"UNUSED_101"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"UNUSED_102"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"UNUSED_103"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"UNUSED_104"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"UNUSED_105"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"UNUSED_106"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"UNUSED_107"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"UNUSED_108"])
  {
    int v4 = 108;
  }
  else if ([v3 isEqualToString:@"UNUSED_109"])
  {
    int v4 = 109;
  }
  else if ([v3 isEqualToString:@"UNUSED_110"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"UNUSED_111"])
  {
    int v4 = 111;
  }
  else if ([v3 isEqualToString:@"UNUSED_112"])
  {
    int v4 = 112;
  }
  else if ([v3 isEqualToString:@"UNUSED_113"])
  {
    int v4 = 113;
  }
  else if ([v3 isEqualToString:@"UNUSED_114"])
  {
    int v4 = 114;
  }
  else if ([v3 isEqualToString:@"UNUSED_115"])
  {
    int v4 = 115;
  }
  else if ([v3 isEqualToString:@"UNUSED_116"])
  {
    int v4 = 116;
  }
  else if ([v3 isEqualToString:@"UNUSED_117"])
  {
    int v4 = 117;
  }
  else if ([v3 isEqualToString:@"UNUSED_118"])
  {
    int v4 = 118;
  }
  else if ([v3 isEqualToString:@"UNUSED_119"])
  {
    int v4 = 119;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setScale:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_scale = a3;
}

- (id)scaleAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DFE10[a3];
  }

  return v3;
}

- (int)StringAsScale:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NODPI"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LODPI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HIDPI"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSize:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_size = a3;
}

- (id)sizeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DFE28[a3];
  }

  return v3;
}

- (int)StringAsSize:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PX128"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PX256"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PX512"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setVersion:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_version = a3;
}

- (void)setTimeToLiveSeconds:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_timeToLiveSeconds = a3;
}

- (void)setHasTimeToLiveSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8196;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (void)clearAvailableTiles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_availableTilesSpace = 0;
  self->_unint64_t availableTilesCount = 0;
  free(self->_availableTiles);
  self->_availableTiles = 0;
}

- (void)addAvailableTiles:(GEOTileSetRegion *)a3
{
  -[GEOActiveTileSet _readAvailableTiles]((uint64_t)self);
  GEOTileSetRegion v5 = *a3;
  if (self && -[GEOActiveTileSet _reserveAvailableTiles:]((uint64_t)self, 1uLL)) {
    self->_availableTiles[self->_availableTilesCount++] = v5;
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (GEOTileSetRegion)availableTilesAtIndex:(SEL)a3
{
  -[GEOActiveTileSet _readAvailableTiles]((uint64_t)self);
  unint64_t availableTilesCount = self->_availableTilesCount;
  if (availableTilesCount <= a4)
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C4A8];
    unsigned int v11 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a4, availableTilesCount);
    unsigned int v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];
    [v12 raise];
  }
  unsigned int v13 = &self->_availableTiles[a4];
  *(_OWORD *)&retstr->double var0 = *(_OWORD *)&v13->var0;
  *(void *)&retstr->var4 = *(void *)&v13->var4;
  return result;
}

- (void)setAvailableTiles:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  [(GEOActiveTileSet *)self clearAvailableTiles];
  if (-[GEOActiveTileSet _reserveAvailableTiles:]((uint64_t)self, a4))
  {
    memcpy(self->_availableTiles, a3, 24 * a4);
    self->_unint64_t availableTilesCount = a4;
  }
}

- (void)_readSentinelTiles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSentinelTiles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)sentinelTiles
{
  -[GEOActiveTileSet _readSentinelTiles]((uint64_t)self);
  sentinelTiles = self->_sentinelTiles;

  return sentinelTiles;
}

- (void)setSentinelTiles:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  sentinelTiles = self->_sentinelTiles;
  self->_sentinelTiles = v4;
}

- (void)clearSentinelTiles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  sentinelTiles = self->_sentinelTiles;

  [(NSMutableArray *)sentinelTiles removeAllObjects];
}

- (void)addSentinelTile:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileSet _readSentinelTiles]((uint64_t)self);
  -[GEOActiveTileSet _addNoFlagsSentinelTile:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unint64_t)sentinelTilesCount
{
  -[GEOActiveTileSet _readSentinelTiles]((uint64_t)self);
  sentinelTiles = self->_sentinelTiles;

  return [(NSMutableArray *)sentinelTiles count];
}

- (id)sentinelTileAtIndex:(unint64_t)a3
{
  -[GEOActiveTileSet _readSentinelTiles]((uint64_t)self);
  sentinelTiles = self->_sentinelTiles;

  return (id)[(NSMutableArray *)sentinelTiles objectAtIndex:a3];
}

+ (Class)sentinelTileType
{
  return (Class)objc_opt_class();
}

- (void)_readLocalizationURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizationURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasLocalizationURL
{
  return self->_localizationURL != 0;
}

- (NSString)localizationURL
{
  -[GEOActiveTileSet _readLocalizationURL]((uint64_t)self);
  localizationURL = self->_localizationURL;

  return localizationURL;
}

- (void)setLocalizationURL:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_localizationURL, a3);
}

- (void)setSupportedLanguages:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  supportedLanguages = self->_supportedLanguages;
  self->_supportedLanguages = v4;
}

- (void)clearSupportedLanguages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  supportedLanguages = self->_supportedLanguages;

  [(NSMutableArray *)supportedLanguages removeAllObjects];
}

- (void)addSupportedLanguage:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileSet _readSupportedLanguages]((uint64_t)self);
  -[GEOActiveTileSet _addNoFlagsSupportedLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unint64_t)supportedLanguagesCount
{
  -[GEOActiveTileSet _readSupportedLanguages]((uint64_t)self);
  supportedLanguages = self->_supportedLanguages;

  return [(NSMutableArray *)supportedLanguages count];
}

- (id)supportedLanguageAtIndex:(unint64_t)a3
{
  -[GEOActiveTileSet _readSupportedLanguages]((uint64_t)self);
  supportedLanguages = self->_supportedLanguages;

  return (id)[(NSMutableArray *)supportedLanguages objectAtIndex:a3];
}

+ (Class)supportedLanguageType
{
  return (Class)objc_opt_class();
}

- (int)updateBehavior
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_updateBehavior;
  }
  else {
    return 1;
  }
}

- (void)setUpdateBehavior:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_updateBehavior = a3;
}

- (void)setHasUpdateBehavior:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8200;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasUpdateBehavior
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)updateBehaviorAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"TILE_UPDATE_BEHAVIOR_ETAG";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"TILE_UPDATE_BEHAVIOR_FLUSH";
  }
  return v4;
}

- (int)StringAsUpdateBehavior:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TILE_UPDATE_BEHAVIOR_FLUSH"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"TILE_UPDATE_BEHAVIOR_ETAG"];
  }

  return v4;
}

- (void)_readCountryRegionAllowlists
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryRegionAllowlists_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)countryRegionAllowlists
{
  -[GEOActiveTileSet _readCountryRegionAllowlists]((uint64_t)self);
  countryRegionAllowlists = self->_countryRegionAllowlists;

  return countryRegionAllowlists;
}

- (void)setCountryRegionAllowlists:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  countryRegionAllowlists = self->_countryRegionAllowlists;
  self->_countryRegionAllowlists = v4;
}

- (void)clearCountryRegionAllowlists
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  countryRegionAllowlists = self->_countryRegionAllowlists;

  [(NSMutableArray *)countryRegionAllowlists removeAllObjects];
}

- (void)addCountryRegionAllowlist:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileSet _readCountryRegionAllowlists]((uint64_t)self);
  -[GEOActiveTileSet _addNoFlagsCountryRegionAllowlist:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unint64_t)countryRegionAllowlistsCount
{
  -[GEOActiveTileSet _readCountryRegionAllowlists]((uint64_t)self);
  countryRegionAllowlists = self->_countryRegionAllowlists;

  return [(NSMutableArray *)countryRegionAllowlists count];
}

- (id)countryRegionAllowlistAtIndex:(unint64_t)a3
{
  -[GEOActiveTileSet _readCountryRegionAllowlists]((uint64_t)self);
  countryRegionAllowlists = self->_countryRegionAllowlists;

  return (id)[(NSMutableArray *)countryRegionAllowlists objectAtIndex:a3];
}

+ (Class)countryRegionAllowlistType
{
  return (Class)objc_opt_class();
}

- (int)checksumType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_checksumType;
  }
  else {
    return 0;
  }
}

- (void)setChecksumType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_checksumType = a3;
}

- (void)setHasChecksumType:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasChecksumType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)checksumTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"CHECKSUM_TYPE_APPENDED_MD5";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"CHECKSUM_TYPE_NONE";
  }
  return v4;
}

- (int)StringAsChecksumType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CHECKSUM_TYPE_NONE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"CHECKSUM_TYPE_APPENDED_MD5"];
  }

  return v4;
}

- (int)requestStyle
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_requestStyle;
  }
  else {
    return 0;
  }
}

- (void)setRequestStyle:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_requestStyle = a3;
}

- (void)setHasRequestStyle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8194;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasRequestStyle
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)requestStyleAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"REQUEST_STYLE_LEGACY";
  }
  return v4;
}

- (int)StringAsRequestStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"REQUEST_STYLE_LEGACY"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH"];
  }

  return v4;
}

- (BOOL)useAuthProxy
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 0x10) != 0 && self->_useAuthProxy;
}

- (void)setUseAuthProxy:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  self->_useAuthProxy = a3;
}

- (void)setHasUseAuthProxy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8208;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasUseAuthProxy
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)_readDeviceSKUAllowlists
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceSKUAllowlists_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)deviceSKUAllowlists
{
  -[GEOActiveTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  deviceSKUAllowlists = self->_deviceSKUAllowlists;

  return deviceSKUAllowlists;
}

- (void)setDeviceSKUAllowlists:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  deviceSKUAllowlists = self->_deviceSKUAllowlists;
  self->_deviceSKUAllowlists = v4;
}

- (void)clearDeviceSKUAllowlists
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  deviceSKUAllowlists = self->_deviceSKUAllowlists;

  [(NSMutableArray *)deviceSKUAllowlists removeAllObjects];
}

- (void)addDeviceSKUAllowlist:(id)a3
{
  id v4 = a3;
  -[GEOActiveTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  -[GEOActiveTileSet _addNoFlagsDeviceSKUAllowlist:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsDeviceSKUAllowlist:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      __int16 v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)deviceSKUAllowlistsCount
{
  -[GEOActiveTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  deviceSKUAllowlists = self->_deviceSKUAllowlists;

  return [(NSMutableArray *)deviceSKUAllowlists count];
}

- (id)deviceSKUAllowlistAtIndex:(unint64_t)a3
{
  -[GEOActiveTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  deviceSKUAllowlists = self->_deviceSKUAllowlists;

  return (id)[(NSMutableArray *)deviceSKUAllowlists objectAtIndex:a3];
}

+ (Class)deviceSKUAllowlistType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOActiveTileSet;
  id v4 = [(GEOActiveTileSet *)&v8 description];
  id v5 = [(GEOActiveTileSet *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOActiveTileSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_178;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 baseURL];
  if (v5) {
    [v4 setObject:v5 forKey:@"baseURL"];
  }

  __int16 v6 = @"RASTER_STANDARD";
  switch(*(_DWORD *)(a1 + 124))
  {
    case 0:
      break;
    case 1:
      __int16 v6 = @"VECTOR_STANDARD";
      break;
    case 2:
      __int16 v6 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
      break;
    case 3:
      __int16 v6 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
      break;
    case 4:
      __int16 v6 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
      break;
    case 5:
      __int16 v6 = @"RASTER_STANDARD_BACKGROUND";
      break;
    case 6:
      __int16 v6 = @"RASTER_HYBRID";
      break;
    case 7:
      __int16 v6 = @"RASTER_SATELLITE";
      break;
    case 8:
      __int16 v6 = @"RASTER_TERRAIN";
      break;
    case 0xB:
      __int16 v6 = @"VECTOR_BUILDINGS";
      break;
    case 0xC:
      __int16 v6 = @"VECTOR_TRAFFIC";
      break;
    case 0xD:
      __int16 v6 = @"VECTOR_POI";
      break;
    case 0xE:
      __int16 v6 = @"SPUTNIK_METADATA";
      break;
    case 0xF:
      __int16 v6 = @"SPUTNIK_C3M";
      break;
    case 0x10:
      __int16 v6 = @"SPUTNIK_DSM";
      break;
    case 0x11:
      __int16 v6 = @"SPUTNIK_DSM_GLOBAL";
      break;
    case 0x12:
      __int16 v6 = @"VECTOR_REALISTIC";
      break;
    case 0x13:
      __int16 v6 = @"VECTOR_LEGACY_REALISTIC";
      break;
    case 0x14:
      __int16 v6 = @"VECTOR_ROADS";
      break;
    case 0x15:
      __int16 v6 = @"RASTER_VEGETATION";
      break;
    case 0x16:
      __int16 v6 = @"VECTOR_TRAFFIC_SKELETON";
      break;
    case 0x17:
      __int16 v6 = @"RASTER_COASTLINE_MASK";
      break;
    case 0x18:
      __int16 v6 = @"RASTER_HILLSHADE";
      break;
    case 0x19:
      __int16 v6 = @"VECTOR_TRAFFIC_WITH_GREEN";
      break;
    case 0x1A:
      __int16 v6 = @"VECTOR_TRAFFIC_STATIC";
      break;
    case 0x1B:
      __int16 v6 = @"RASTER_COASTLINE_DROP_MASK";
      break;
    case 0x1C:
      __int16 v6 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
      break;
    case 0x1D:
      __int16 v6 = @"VECTOR_SPEED_PROFILES";
      break;
    case 0x1E:
      __int16 v6 = @"VECTOR_VENUES";
      break;
    case 0x1F:
      __int16 v6 = @"RASTER_DOWN_SAMPLED";
      break;
    case 0x20:
      __int16 v6 = @"RASTER_COLOR_BALANCED";
      break;
    case 0x21:
      __int16 v6 = @"RASTER_SATELLITE_NIGHT";
      break;
    case 0x22:
      __int16 v6 = @"SPUTNIK_VECTOR_BORDER";
      break;
    case 0x23:
      __int16 v6 = @"RASTER_SATELLITE_DIGITIZE";
      break;
    case 0x24:
      __int16 v6 = @"RASTER_HILLSHADE_PARKS";
      break;
    case 0x25:
      __int16 v6 = @"VECTOR_TRANSIT";
      break;
    case 0x26:
      __int16 v6 = @"RASTER_STANDARD_BASE";
      break;
    case 0x27:
      __int16 v6 = @"RASTER_STANDARD_LABELS";
      break;
    case 0x28:
      __int16 v6 = @"RASTER_HYBRID_ROADS";
      break;
    case 0x29:
      __int16 v6 = @"RASTER_HYBRID_LABELS";
      break;
    case 0x2A:
      __int16 v6 = @"FLYOVER_C3M_MESH";
      break;
    case 0x2B:
      __int16 v6 = @"FLYOVER_C3M_JPEG_TEXTURE";
      break;
    case 0x2C:
      __int16 v6 = @"FLYOVER_C3M_ASTC_TEXTURE";
      break;
    case 0x2D:
      __int16 v6 = @"RASTER_SATELLITE_ASTC";
      break;
    case 0x2E:
      __int16 v6 = @"RASTER_HYBRID_ROADS_AND_LABELS";
      break;
    case 0x2F:
      __int16 v6 = @"VECTOR_TRANSIT_SELECTION";
      break;
    case 0x30:
      __int16 v6 = @"VECTOR_COVERAGE";
      break;
    case 0x34:
      __int16 v6 = @"FLYOVER_METADATA";
      break;
    case 0x35:
      __int16 v6 = @"VECTOR_ROAD_NETWORK";
      break;
    case 0x36:
      __int16 v6 = @"VECTOR_LAND_COVER";
      break;
    case 0x37:
      __int16 v6 = @"VECTOR_DEBUG";
      break;
    case 0x38:
      __int16 v6 = @"VECTOR_STREET_POI";
      break;
    case 0x39:
      __int16 v6 = @"MUNIN_METADATA";
      break;
    case 0x3A:
      __int16 v6 = @"VECTOR_SPR_MERCATOR";
      break;
    case 0x3B:
      __int16 v6 = @"VECTOR_SPR_MODELS";
      break;
    case 0x3C:
      __int16 v6 = @"VECTOR_SPR_MATERIALS";
      break;
    case 0x3D:
      __int16 v6 = @"VECTOR_SPR_METADATA";
      break;
    case 0x3E:
      __int16 v6 = @"VECTOR_TRACKS";
      break;
    case 0x3F:
      __int16 v6 = @"VECTOR_RESERVED_2";
      break;
    case 0x40:
      __int16 v6 = @"VECTOR_STREET_LANDMARKS";
      break;
    case 0x41:
      __int16 v6 = @"COARSE_LOCATION_POLYGONS";
      break;
    case 0x42:
      __int16 v6 = @"VECTOR_SPR_ROADS";
      break;
    case 0x43:
      __int16 v6 = @"VECTOR_SPR_STANDARD";
      break;
    case 0x44:
      __int16 v6 = @"VECTOR_POI_V2";
      break;
    case 0x45:
      __int16 v6 = @"VECTOR_POLYGON_SELECTION";
      break;
    case 0x46:
      __int16 v6 = @"VL_METADATA";
      break;
    case 0x47:
      __int16 v6 = @"VL_DATA";
      break;
    case 0x48:
      __int16 v6 = @"PROACTIVE_APP_CLIP";
      break;
    case 0x49:
      __int16 v6 = @"VECTOR_BUILDINGS_V2";
      break;
    case 0x4A:
      __int16 v6 = @"POI_BUSYNESS";
      break;
    case 0x4B:
      __int16 v6 = @"POI_DP_BUSYNESS";
      break;
    case 0x4C:
      __int16 v6 = @"SMART_INTERFACE_SELECTION";
      break;
    case 0x4D:
      __int16 v6 = @"VECTOR_ASSETS";
      break;
    case 0x4E:
      __int16 v6 = @"SPR_ASSET_METADATA";
      break;
    case 0x4F:
      __int16 v6 = @"VECTOR_SPR_POLAR";
      break;
    case 0x50:
      __int16 v6 = @"SMART_DATA_MODE";
      break;
    case 0x51:
      __int16 v6 = @"CELLULAR_PERFORMANCE_SCORE";
      break;
    case 0x52:
      __int16 v6 = @"VECTOR_SPR_MODELS_OCCLUSION";
      break;
    case 0x53:
      __int16 v6 = @"VECTOR_TOPOGRAPHIC";
      break;
    case 0x54:
      __int16 v6 = @"VECTOR_POI_V2_UPDATE";
      break;
    case 0x55:
      __int16 v6 = @"VECTOR_LIVE_DATA_UPDATES";
      break;
    case 0x56:
      __int16 v6 = @"VECTOR_TRAFFIC_V2";
      break;
    case 0x57:
      __int16 v6 = @"VECTOR_ROAD_SELECTION";
      break;
    case 0x58:
      __int16 v6 = @"VECTOR_REGION_METADATA";
      break;
    case 0x59:
      __int16 v6 = @"RAY_TRACING";
      break;
    case 0x5A:
      __int16 v6 = @"VECTOR_CONTOURS";
      break;
    case 0x5B:
      __int16 v6 = @"RASTER_SATELLITE_POLAR";
      break;
    case 0x5C:
      __int16 v6 = @"VMAP4_ELEVATION";
      break;
    case 0x5D:
      __int16 v6 = @"VMAP4_ELEVATION_POLAR";
      break;
    case 0x5E:
      __int16 v6 = @"CELLULAR_COVERAGE_PLMN";
      break;
    case 0x5F:
      __int16 v6 = @"RASTER_SATELLITE_POLAR_NIGHT";
      break;
    case 0x60:
      __int16 v6 = @"UNUSED_96";
      break;
    case 0x61:
      __int16 v6 = @"UNUSED_97";
      break;
    case 0x62:
      __int16 v6 = @"UNUSED_98";
      break;
    case 0x63:
      __int16 v6 = @"UNUSED_99";
      break;
    case 0x64:
      __int16 v6 = @"UNUSED_100";
      break;
    case 0x65:
      __int16 v6 = @"UNUSED_101";
      break;
    case 0x66:
      __int16 v6 = @"UNUSED_102";
      break;
    case 0x67:
      __int16 v6 = @"UNUSED_103";
      break;
    case 0x68:
      __int16 v6 = @"UNUSED_104";
      break;
    case 0x69:
      __int16 v6 = @"UNUSED_105";
      break;
    case 0x6A:
      __int16 v6 = @"UNUSED_106";
      break;
    case 0x6B:
      __int16 v6 = @"UNUSED_107";
      break;
    case 0x6C:
      __int16 v6 = @"UNUSED_108";
      break;
    case 0x6D:
      __int16 v6 = @"UNUSED_109";
      break;
    case 0x6E:
      __int16 v6 = @"UNUSED_110";
      break;
    case 0x6F:
      __int16 v6 = @"UNUSED_111";
      break;
    case 0x70:
      __int16 v6 = @"UNUSED_112";
      break;
    case 0x71:
      __int16 v6 = @"UNUSED_113";
      break;
    case 0x72:
      __int16 v6 = @"UNUSED_114";
      break;
    case 0x73:
      __int16 v6 = @"UNUSED_115";
      break;
    case 0x74:
      __int16 v6 = @"UNUSED_116";
      break;
    case 0x75:
      __int16 v6 = @"UNUSED_117";
      break;
    case 0x76:
      __int16 v6 = @"UNUSED_118";
      break;
    case 0x77:
      __int16 v6 = @"UNUSED_119";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 124));
      __int16 v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  [v4 setObject:v6 forKey:@"style"];

  uint64_t v7 = *(int *)(a1 + 116);
  if (v7 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 116));
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v8 = off_1E53DFE10[v7];
  }
  [v4 setObject:v8 forKey:@"scale"];

  uint64_t v9 = *(int *)(a1 + 120);
  if (v9 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 120));
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = off_1E53DFE28[v9];
  }
  [v4 setObject:v10 forKey:@"size"];

  unsigned int v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 136)];
  [v4 setObject:v11 forKey:@"version"];

  if ((*(_WORD *)(a1 + 144) & 4) != 0)
  {
    unsigned int v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 128)];
    [v4 setObject:v12 forKey:@"timeToLiveSeconds"];
  }
  if (*(void *)(a1 + 32))
  {
    unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 32))
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      do
      {
        v16 = _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 24) + v14));
        [v13 addObject:v16];

        ++v15;
        v14 += 24;
      }
      while (v15 < *(void *)(a1 + 32));
    }
    [v4 setObject:v13 forKey:@"availableTiles"];
  }
  if ([*(id *)(a1 + 80) count])
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v18 = *(id *)(a1 + 80);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v58 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          if (a2) {
            [v23 jsonRepresentation];
          }
          else {
          v24 = [v23 dictionaryRepresentation];
          }
          [v17 addObject:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v20);
    }

    [v4 setObject:v17 forKey:@"sentinelTile"];
  }
  v25 = [(id)a1 localizationURL];
  if (v25) {
    [v4 setObject:v25 forKey:@"localizationURL"];
  }

  if (*(void *)(a1 + 88))
  {
    v26 = [(id)a1 supportedLanguages];
    [v4 setObject:v26 forKey:@"supportedLanguage"];
  }
  if ((*(_WORD *)(a1 + 144) & 8) != 0)
  {
    int v27 = *(_DWORD *)(a1 + 132);
    if (v27)
    {
      if (v27 == 1)
      {
        v28 = @"TILE_UPDATE_BEHAVIOR_ETAG";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 132));
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v28 = @"TILE_UPDATE_BEHAVIOR_FLUSH";
    }
    [v4 setObject:v28 forKey:@"updateBehavior"];
  }
  if ([*(id *)(a1 + 56) count])
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v30 = *(id *)(a1 + 56);
    uint64_t v31 = [v30 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v54 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          if (a2) {
            [v35 jsonRepresentation];
          }
          else {
          v36 = [v35 dictionaryRepresentation];
          }
          [v29 addObject:v36];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v32);
    }

    [v4 setObject:v29 forKey:@"countryRegionAllowlist"];
  }
  __int16 v37 = *(_WORD *)(a1 + 144);
  if ((v37 & 1) == 0)
  {
    if ((v37 & 2) == 0) {
      goto LABEL_170;
    }
LABEL_187:
    int v49 = *(_DWORD *)(a1 + 112);
    if (v49)
    {
      if (v49 == 1)
      {
        v50 = @"REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 112));
        v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v50 = @"REQUEST_STYLE_LEGACY";
    }
    [v4 setObject:v50 forKey:@"requestStyle"];

    if ((*(_WORD *)(a1 + 144) & 0x10) == 0) {
      goto LABEL_172;
    }
    goto LABEL_171;
  }
  int v47 = *(_DWORD *)(a1 + 108);
  if (v47)
  {
    if (v47 == 1)
    {
      v48 = @"CHECKSUM_TYPE_APPENDED_MD5";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 108));
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v48 = @"CHECKSUM_TYPE_NONE";
  }
  [v4 setObject:v48 forKey:@"checksumType"];

  __int16 v37 = *(_WORD *)(a1 + 144);
  if ((v37 & 2) != 0) {
    goto LABEL_187;
  }
LABEL_170:
  if ((v37 & 0x10) != 0)
  {
LABEL_171:
    v38 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 140)];
    [v4 setObject:v38 forKey:@"useAuthProxy"];
  }
LABEL_172:
  if (*(void *)(a1 + 64))
  {
    v39 = [(id)a1 deviceSKUAllowlists];
    [v4 setObject:v39 forKey:@"deviceSKUAllowlist"];
  }
  v40 = *(void **)(a1 + 16);
  if (v40)
  {
    v41 = [v40 dictionaryRepresentation];
    v42 = v41;
    if (a2)
    {
      v43 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __46__GEOActiveTileSet__dictionaryRepresentation___block_invoke;
      v51[3] = &unk_1E53D8860;
      id v44 = v43;
      id v52 = v44;
      [v42 enumerateKeysAndObjectsUsingBlock:v51];
      id v45 = v44;

      v42 = v45;
    }
    [v4 setObject:v42 forKey:@"Unknown Fields"];
  }
LABEL_178:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOActiveTileSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOActiveTileSet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOActiveTileSet)initWithDictionary:(id)a3
{
  return (GEOActiveTileSet *)-[GEOActiveTileSet _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_359;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_359;
  }
  __int16 v6 = [v5 objectForKeyedSubscript:@"baseURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = (void *)[v6 copy];
    [a1 setBaseURL:v7];
  }
  objc_super v8 = [v5 objectForKeyedSubscript:@"style"];
  objc_opt_class();
  id v76 = v5;
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"RASTER_STANDARD"])
    {
      uint64_t v10 = 0;
    }
    else if ([v9 isEqualToString:@"VECTOR_STANDARD"])
    {
      uint64_t v10 = 1;
    }
    else if ([v9 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER"])
    {
      uint64_t v10 = 2;
    }
    else if ([v9 isEqualToString:@"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER"])
    {
      uint64_t v10 = 3;
    }
    else if ([v9 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER"])
    {
      uint64_t v10 = 4;
    }
    else if ([v9 isEqualToString:@"RASTER_STANDARD_BACKGROUND"])
    {
      uint64_t v10 = 5;
    }
    else if ([v9 isEqualToString:@"RASTER_HYBRID"])
    {
      uint64_t v10 = 6;
    }
    else if ([v9 isEqualToString:@"RASTER_SATELLITE"])
    {
      uint64_t v10 = 7;
    }
    else if ([v9 isEqualToString:@"RASTER_TERRAIN"])
    {
      uint64_t v10 = 8;
    }
    else if ([v9 isEqualToString:@"VECTOR_BUILDINGS"])
    {
      uint64_t v10 = 11;
    }
    else if ([v9 isEqualToString:@"VECTOR_TRAFFIC"])
    {
      uint64_t v10 = 12;
    }
    else if ([v9 isEqualToString:@"VECTOR_POI"])
    {
      uint64_t v10 = 13;
    }
    else if ([v9 isEqualToString:@"SPUTNIK_METADATA"])
    {
      uint64_t v10 = 14;
    }
    else if ([v9 isEqualToString:@"SPUTNIK_C3M"])
    {
      uint64_t v10 = 15;
    }
    else if ([v9 isEqualToString:@"SPUTNIK_DSM"])
    {
      uint64_t v10 = 16;
    }
    else if ([v9 isEqualToString:@"SPUTNIK_DSM_GLOBAL"])
    {
      uint64_t v10 = 17;
    }
    else if ([v9 isEqualToString:@"VECTOR_REALISTIC"])
    {
      uint64_t v10 = 18;
    }
    else if ([v9 isEqualToString:@"VECTOR_LEGACY_REALISTIC"])
    {
      uint64_t v10 = 19;
    }
    else if ([v9 isEqualToString:@"VECTOR_ROADS"])
    {
      uint64_t v10 = 20;
    }
    else if ([v9 isEqualToString:@"RASTER_VEGETATION"])
    {
      uint64_t v10 = 21;
    }
    else if ([v9 isEqualToString:@"VECTOR_TRAFFIC_SKELETON"])
    {
      uint64_t v10 = 22;
    }
    else if ([v9 isEqualToString:@"RASTER_COASTLINE_MASK"])
    {
      uint64_t v10 = 23;
    }
    else if ([v9 isEqualToString:@"RASTER_HILLSHADE"])
    {
      uint64_t v10 = 24;
    }
    else if ([v9 isEqualToString:@"VECTOR_TRAFFIC_WITH_GREEN"])
    {
      uint64_t v10 = 25;
    }
    else if ([v9 isEqualToString:@"VECTOR_TRAFFIC_STATIC"])
    {
      uint64_t v10 = 26;
    }
    else if ([v9 isEqualToString:@"RASTER_COASTLINE_DROP_MASK"])
    {
      uint64_t v10 = 27;
    }
    else if ([v9 isEqualToString:@"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL"])
    {
      uint64_t v10 = 28;
    }
    else if ([v9 isEqualToString:@"VECTOR_SPEED_PROFILES"])
    {
      uint64_t v10 = 29;
    }
    else if ([v9 isEqualToString:@"VECTOR_VENUES"])
    {
      uint64_t v10 = 30;
    }
    else if ([v9 isEqualToString:@"RASTER_DOWN_SAMPLED"])
    {
      uint64_t v10 = 31;
    }
    else if ([v9 isEqualToString:@"RASTER_COLOR_BALANCED"])
    {
      uint64_t v10 = 32;
    }
    else if ([v9 isEqualToString:@"RASTER_SATELLITE_NIGHT"])
    {
      uint64_t v10 = 33;
    }
    else if ([v9 isEqualToString:@"SPUTNIK_VECTOR_BORDER"])
    {
      uint64_t v10 = 34;
    }
    else if ([v9 isEqualToString:@"RASTER_SATELLITE_DIGITIZE"])
    {
      uint64_t v10 = 35;
    }
    else if ([v9 isEqualToString:@"RASTER_HILLSHADE_PARKS"])
    {
      uint64_t v10 = 36;
    }
    else if ([v9 isEqualToString:@"VECTOR_TRANSIT"])
    {
      uint64_t v10 = 37;
    }
    else if ([v9 isEqualToString:@"RASTER_STANDARD_BASE"])
    {
      uint64_t v10 = 38;
    }
    else if ([v9 isEqualToString:@"RASTER_STANDARD_LABELS"])
    {
      uint64_t v10 = 39;
    }
    else if ([v9 isEqualToString:@"RASTER_HYBRID_ROADS"])
    {
      uint64_t v10 = 40;
    }
    else if ([v9 isEqualToString:@"RASTER_HYBRID_LABELS"])
    {
      uint64_t v10 = 41;
    }
    else if ([v9 isEqualToString:@"FLYOVER_C3M_MESH"])
    {
      uint64_t v10 = 42;
    }
    else if ([v9 isEqualToString:@"FLYOVER_C3M_JPEG_TEXTURE"])
    {
      uint64_t v10 = 43;
    }
    else if ([v9 isEqualToString:@"FLYOVER_C3M_ASTC_TEXTURE"])
    {
      uint64_t v10 = 44;
    }
    else if ([v9 isEqualToString:@"RASTER_SATELLITE_ASTC"])
    {
      uint64_t v10 = 45;
    }
    else if ([v9 isEqualToString:@"RASTER_HYBRID_ROADS_AND_LABELS"])
    {
      uint64_t v10 = 46;
    }
    else if ([v9 isEqualToString:@"VECTOR_TRANSIT_SELECTION"])
    {
      uint64_t v10 = 47;
    }
    else if ([v9 isEqualToString:@"VECTOR_COVERAGE"])
    {
      uint64_t v10 = 48;
    }
    else if ([v9 isEqualToString:@"FLYOVER_METADATA"])
    {
      uint64_t v10 = 52;
    }
    else if ([v9 isEqualToString:@"VECTOR_ROAD_NETWORK"])
    {
      uint64_t v10 = 53;
    }
    else if ([v9 isEqualToString:@"VECTOR_LAND_COVER"])
    {
      uint64_t v10 = 54;
    }
    else if ([v9 isEqualToString:@"VECTOR_DEBUG"])
    {
      uint64_t v10 = 55;
    }
    else if ([v9 isEqualToString:@"VECTOR_STREET_POI"])
    {
      uint64_t v10 = 56;
    }
    else if ([v9 isEqualToString:@"MUNIN_METADATA"])
    {
      uint64_t v10 = 57;
    }
    else if ([v9 isEqualToString:@"VECTOR_SPR_MERCATOR"])
    {
      uint64_t v10 = 58;
    }
    else if ([v9 isEqualToString:@"VECTOR_SPR_MODELS"])
    {
      uint64_t v10 = 59;
    }
    else if ([v9 isEqualToString:@"VECTOR_SPR_MATERIALS"])
    {
      uint64_t v10 = 60;
    }
    else if ([v9 isEqualToString:@"VECTOR_SPR_METADATA"])
    {
      uint64_t v10 = 61;
    }
    else if ([v9 isEqualToString:@"VECTOR_TRACKS"])
    {
      uint64_t v10 = 62;
    }
    else if ([v9 isEqualToString:@"VECTOR_RESERVED_2"])
    {
      uint64_t v10 = 63;
    }
    else if ([v9 isEqualToString:@"VECTOR_STREET_LANDMARKS"])
    {
      uint64_t v10 = 64;
    }
    else if ([v9 isEqualToString:@"COARSE_LOCATION_POLYGONS"])
    {
      uint64_t v10 = 65;
    }
    else if ([v9 isEqualToString:@"VECTOR_SPR_ROADS"])
    {
      uint64_t v10 = 66;
    }
    else if ([v9 isEqualToString:@"VECTOR_SPR_STANDARD"])
    {
      uint64_t v10 = 67;
    }
    else if ([v9 isEqualToString:@"VECTOR_POI_V2"])
    {
      uint64_t v10 = 68;
    }
    else if ([v9 isEqualToString:@"VECTOR_POLYGON_SELECTION"])
    {
      uint64_t v10 = 69;
    }
    else if ([v9 isEqualToString:@"VL_METADATA"])
    {
      uint64_t v10 = 70;
    }
    else if ([v9 isEqualToString:@"VL_DATA"])
    {
      uint64_t v10 = 71;
    }
    else if ([v9 isEqualToString:@"PROACTIVE_APP_CLIP"])
    {
      uint64_t v10 = 72;
    }
    else if ([v9 isEqualToString:@"VECTOR_BUILDINGS_V2"])
    {
      uint64_t v10 = 73;
    }
    else if ([v9 isEqualToString:@"POI_BUSYNESS"])
    {
      uint64_t v10 = 74;
    }
    else if ([v9 isEqualToString:@"POI_DP_BUSYNESS"])
    {
      uint64_t v10 = 75;
    }
    else if ([v9 isEqualToString:@"SMART_INTERFACE_SELECTION"])
    {
      uint64_t v10 = 76;
    }
    else if ([v9 isEqualToString:@"VECTOR_ASSETS"])
    {
      uint64_t v10 = 77;
    }
    else if ([v9 isEqualToString:@"SPR_ASSET_METADATA"])
    {
      uint64_t v10 = 78;
    }
    else if ([v9 isEqualToString:@"VECTOR_SPR_POLAR"])
    {
      uint64_t v10 = 79;
    }
    else if ([v9 isEqualToString:@"SMART_DATA_MODE"])
    {
      uint64_t v10 = 80;
    }
    else if ([v9 isEqualToString:@"CELLULAR_PERFORMANCE_SCORE"])
    {
      uint64_t v10 = 81;
    }
    else if ([v9 isEqualToString:@"VECTOR_SPR_MODELS_OCCLUSION"])
    {
      uint64_t v10 = 82;
    }
    else if ([v9 isEqualToString:@"VECTOR_TOPOGRAPHIC"])
    {
      uint64_t v10 = 83;
    }
    else if ([v9 isEqualToString:@"VECTOR_POI_V2_UPDATE"])
    {
      uint64_t v10 = 84;
    }
    else if ([v9 isEqualToString:@"VECTOR_LIVE_DATA_UPDATES"])
    {
      uint64_t v10 = 85;
    }
    else if ([v9 isEqualToString:@"VECTOR_TRAFFIC_V2"])
    {
      uint64_t v10 = 86;
    }
    else if ([v9 isEqualToString:@"VECTOR_ROAD_SELECTION"])
    {
      uint64_t v10 = 87;
    }
    else if ([v9 isEqualToString:@"VECTOR_REGION_METADATA"])
    {
      uint64_t v10 = 88;
    }
    else if ([v9 isEqualToString:@"RAY_TRACING"])
    {
      uint64_t v10 = 89;
    }
    else if ([v9 isEqualToString:@"VECTOR_CONTOURS"])
    {
      uint64_t v10 = 90;
    }
    else if ([v9 isEqualToString:@"RASTER_SATELLITE_POLAR"])
    {
      uint64_t v10 = 91;
    }
    else if ([v9 isEqualToString:@"VMAP4_ELEVATION"])
    {
      uint64_t v10 = 92;
    }
    else if ([v9 isEqualToString:@"VMAP4_ELEVATION_POLAR"])
    {
      uint64_t v10 = 93;
    }
    else if ([v9 isEqualToString:@"CELLULAR_COVERAGE_PLMN"])
    {
      uint64_t v10 = 94;
    }
    else if ([v9 isEqualToString:@"RASTER_SATELLITE_POLAR_NIGHT"])
    {
      uint64_t v10 = 95;
    }
    else if ([v9 isEqualToString:@"UNUSED_96"])
    {
      uint64_t v10 = 96;
    }
    else if ([v9 isEqualToString:@"UNUSED_97"])
    {
      uint64_t v10 = 97;
    }
    else if ([v9 isEqualToString:@"UNUSED_98"])
    {
      uint64_t v10 = 98;
    }
    else if ([v9 isEqualToString:@"UNUSED_99"])
    {
      uint64_t v10 = 99;
    }
    else if ([v9 isEqualToString:@"UNUSED_100"])
    {
      uint64_t v10 = 100;
    }
    else if ([v9 isEqualToString:@"UNUSED_101"])
    {
      uint64_t v10 = 101;
    }
    else if ([v9 isEqualToString:@"UNUSED_102"])
    {
      uint64_t v10 = 102;
    }
    else if ([v9 isEqualToString:@"UNUSED_103"])
    {
      uint64_t v10 = 103;
    }
    else if ([v9 isEqualToString:@"UNUSED_104"])
    {
      uint64_t v10 = 104;
    }
    else if ([v9 isEqualToString:@"UNUSED_105"])
    {
      uint64_t v10 = 105;
    }
    else if ([v9 isEqualToString:@"UNUSED_106"])
    {
      uint64_t v10 = 106;
    }
    else if ([v9 isEqualToString:@"UNUSED_107"])
    {
      uint64_t v10 = 107;
    }
    else if ([v9 isEqualToString:@"UNUSED_108"])
    {
      uint64_t v10 = 108;
    }
    else if ([v9 isEqualToString:@"UNUSED_109"])
    {
      uint64_t v10 = 109;
    }
    else if ([v9 isEqualToString:@"UNUSED_110"])
    {
      uint64_t v10 = 110;
    }
    else if ([v9 isEqualToString:@"UNUSED_111"])
    {
      uint64_t v10 = 111;
    }
    else if ([v9 isEqualToString:@"UNUSED_112"])
    {
      uint64_t v10 = 112;
    }
    else if ([v9 isEqualToString:@"UNUSED_113"])
    {
      uint64_t v10 = 113;
    }
    else if ([v9 isEqualToString:@"UNUSED_114"])
    {
      uint64_t v10 = 114;
    }
    else if ([v9 isEqualToString:@"UNUSED_115"])
    {
      uint64_t v10 = 115;
    }
    else if ([v9 isEqualToString:@"UNUSED_116"])
    {
      uint64_t v10 = 116;
    }
    else if ([v9 isEqualToString:@"UNUSED_117"])
    {
      uint64_t v10 = 117;
    }
    else if ([v9 isEqualToString:@"UNUSED_118"])
    {
      uint64_t v10 = 118;
    }
    else if ([v9 isEqualToString:@"UNUSED_119"])
    {
      uint64_t v10 = 119;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_241;
    }
    uint64_t v10 = [v8 intValue];
  }
  [a1 setStyle:v10];
LABEL_241:

  unsigned int v11 = [v5 objectForKeyedSubscript:@"scale"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"NODPI"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"LODPI"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"HIDPI"])
    {
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_253;
    }
    uint64_t v13 = [v11 intValue];
  }
  [a1 setScale:v13];
LABEL_253:

  uint64_t v14 = [v5 objectForKeyedSubscript:@"size"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"PX128"])
    {
      uint64_t v16 = 0;
    }
    else if ([v15 isEqualToString:@"PX256"])
    {
      uint64_t v16 = 1;
    }
    else if ([v15 isEqualToString:@"PX512"])
    {
      uint64_t v16 = 2;
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_265;
    }
    uint64_t v16 = [v14 intValue];
  }
  [a1 setSize:v16];
LABEL_265:

  v17 = [v5 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setVersion:", objc_msgSend(v17, "unsignedIntValue"));
  }

  id v18 = [v5 objectForKeyedSubscript:@"timeToLiveSeconds"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTimeToLiveSeconds:", objc_msgSend(v18, "unsignedIntValue"));
  }

  uint64_t v19 = [v5 objectForKeyedSubscript:@"availableTiles"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v97 objects:v105 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v98;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v98 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v95 = 0uLL;
            uint64_t v96 = 0;
            _GEOTileSetRegionFromDictionaryRepresentation(v25, &v95);
            long long v93 = v95;
            uint64_t v94 = v96;
            [a1 addAvailableTiles:&v93];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v97 objects:v105 count:16];
      }
      while (v22);
    }

    id v5 = v76;
  }

  v26 = [v5 objectForKeyedSubscript:@"sentinelTile"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v75 = v26;
    id v27 = v26;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v89 objects:v104 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v90;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v90 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v89 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v33 = [GEOSentinelTile alloc];
            if (a3) {
              uint64_t v34 = [(GEOSentinelTile *)v33 initWithJSON:v32];
            }
            else {
              uint64_t v34 = [(GEOSentinelTile *)v33 initWithDictionary:v32];
            }
            v35 = (void *)v34;
            objc_msgSend(a1, "addSentinelTile:", v34, v75);
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v89 objects:v104 count:16];
      }
      while (v29);
    }

    v26 = v75;
    id v5 = v76;
  }

  v36 = [v5 objectForKeyedSubscript:@"localizationURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v37 = (void *)[v36 copy];
    [a1 setLocalizationURL:v37];
  }
  v38 = [v5 objectForKeyedSubscript:@"supportedLanguage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v39 = v38;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v85 objects:v103 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v86;
      do
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v86 != v42) {
            objc_enumerationMutation(v39);
          }
          id v44 = *(void **)(*((void *)&v85 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v45 = (void *)[v44 copy];
            [a1 addSupportedLanguage:v45];
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v85 objects:v103 count:16];
      }
      while (v41);
    }
  }
  v46 = [v5 objectForKeyedSubscript:@"updateBehavior"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v47 = v46;
    if ([v47 isEqualToString:@"TILE_UPDATE_BEHAVIOR_FLUSH"]) {
      uint64_t v48 = 0;
    }
    else {
      uint64_t v48 = [v47 isEqualToString:@"TILE_UPDATE_BEHAVIOR_ETAG"];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_315;
    }
    uint64_t v48 = [v46 intValue];
  }
  objc_msgSend(a1, "setUpdateBehavior:", v48, v75);
LABEL_315:

  int v49 = [v5 objectForKeyedSubscript:@"countryRegionAllowlist"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v75 = v49;
    id v50 = v49;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v81 objects:v102 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v82;
      do
      {
        for (uint64_t m = 0; m != v52; ++m)
        {
          if (*(void *)v82 != v53) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = *(void *)(*((void *)&v81 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v56 = [GEOCountryRegionTuple alloc];
            if (a3) {
              uint64_t v57 = [(GEOCountryRegionTuple *)v56 initWithJSON:v55];
            }
            else {
              uint64_t v57 = [(GEOCountryRegionTuple *)v56 initWithDictionary:v55];
            }
            long long v58 = (void *)v57;
            objc_msgSend(a1, "addCountryRegionAllowlist:", v57, v75);
          }
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v81 objects:v102 count:16];
      }
      while (v52);
    }

    int v49 = v75;
    id v5 = v76;
  }

  long long v59 = [v5 objectForKeyedSubscript:@"checksumType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v60 = v59;
    if ([v60 isEqualToString:@"CHECKSUM_TYPE_NONE"]) {
      uint64_t v61 = 0;
    }
    else {
      uint64_t v61 = [v60 isEqualToString:@"CHECKSUM_TYPE_APPENDED_MD5"];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_337;
    }
    uint64_t v61 = [v59 intValue];
  }
  objc_msgSend(a1, "setChecksumType:", v61, v75);
LABEL_337:

  v62 = [v5 objectForKeyedSubscript:@"requestStyle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v63 = v62;
    if ([v63 isEqualToString:@"REQUEST_STYLE_LEGACY"]) {
      uint64_t v64 = 0;
    }
    else {
      uint64_t v64 = [v63 isEqualToString:@"REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH"];
    }

    goto LABEL_344;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v64 = [v62 intValue];
LABEL_344:
    objc_msgSend(a1, "setRequestStyle:", v64, v75);
  }

  v65 = [v5 objectForKeyedSubscript:@"useAuthProxy"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setUseAuthProxy:", objc_msgSend(v65, "BOOLValue"));
  }

  v66 = [v5 objectForKeyedSubscript:@"deviceSKUAllowlist"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v67 = v66;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v77 objects:v101 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v78;
      do
      {
        for (uint64_t n = 0; n != v69; ++n)
        {
          if (*(void *)v78 != v70) {
            objc_enumerationMutation(v67);
          }
          v72 = *(void **)(*((void *)&v77 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v73 = (void *)[v72 copy];
            [a1 addDeviceSKUAllowlist:v73];
          }
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v77 objects:v101 count:16];
      }
      while (v69);
    }
  }
  a1 = a1;

LABEL_359:
  return a1;
}

- (GEOActiveTileSet)initWithJSON:(id)a3
{
  return (GEOActiveTileSet *)-[GEOActiveTileSet _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOActiveTileSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOActiveTileSetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3FC0) == 0))
  {
    v25 = self->_reader;
    objc_sync_enter(v25);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v26 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v26];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v25);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOActiveTileSet *)self readAll:0];
    if (self->_baseURL) {
      PBDataWriterWriteStringField();
    }
    PBDataWriterWriteInt32Field();
    PBDataWriterWriteInt32Field();
    PBDataWriterWriteInt32Field();
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_availableTilesCount)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        uint64_t v43 = 0;
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v7;
        v6 += 24;
      }
      while (v7 < self->_availableTilesCount);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    objc_super v8 = self->_sentinelTiles;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v8);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v9);
    }

    if (self->_localizationURL) {
      PBDataWriterWriteStringField();
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = self->_supportedLanguages;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v12);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v46 count:16];
      }
      while (v13);
    }

    if ((*(_WORD *)&self->_flags & 8) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v16 = self->_countryRegionAllowlists;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v45 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v17; ++k)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v16);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v45 count:16];
      }
      while (v17);
    }

    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v21 = self->_deviceSKUAllowlists;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v27 objects:v44 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v28;
      do
      {
        for (uint64_t m = 0; m != v22; ++m)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v21);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v27 objects:v44 count:16];
      }
      while (v22);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v27);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = (id *)a3;
  [(GEOActiveTileSet *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 24) = self->_readerMarkPos;
  *((_DWORD *)v4 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_baseURL) {
    objc_msgSend(v4, "setBaseURL:");
  }
  *((_DWORD *)v4 + 31) = self->_style;
  *((_DWORD *)v4 + 29) = self->_scale;
  *((_DWORD *)v4 + 30) = self->_size;
  *((_DWORD *)v4 + 34) = self->_version;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v4 + 32) = self->_timeToLiveSeconds;
    *((_WORD *)v4 + 72) |= 4u;
  }
  if ([(GEOActiveTileSet *)self availableTilesCount])
  {
    [v4 clearAvailableTiles];
    unint64_t v5 = [(GEOActiveTileSet *)self availableTilesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        [(GEOActiveTileSet *)self availableTilesAtIndex:i];
        [v4 addAvailableTiles:v25];
      }
    }
  }
  if ([(GEOActiveTileSet *)self sentinelTilesCount])
  {
    [v4 clearSentinelTiles];
    unint64_t v8 = [(GEOActiveTileSet *)self sentinelTilesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        unsigned int v11 = [(GEOActiveTileSet *)self sentinelTileAtIndex:j];
        [v4 addSentinelTile:v11];
      }
    }
  }
  if (self->_localizationURL) {
    objc_msgSend(v4, "setLocalizationURL:");
  }
  if ([(GEOActiveTileSet *)self supportedLanguagesCount])
  {
    [v4 clearSupportedLanguages];
    unint64_t v12 = [(GEOActiveTileSet *)self supportedLanguagesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        id v15 = [(GEOActiveTileSet *)self supportedLanguageAtIndex:k];
        [v4 addSupportedLanguage:v15];
      }
    }
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_updateBehavior;
    *((_WORD *)v4 + 72) |= 8u;
  }
  if ([(GEOActiveTileSet *)self countryRegionAllowlistsCount])
  {
    [v4 clearCountryRegionAllowlists];
    unint64_t v16 = [(GEOActiveTileSet *)self countryRegionAllowlistsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(GEOActiveTileSet *)self countryRegionAllowlistAtIndex:m];
        [v4 addCountryRegionAllowlist:v19];
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 2) == 0) {
      goto LABEL_27;
    }
LABEL_35:
    *((_DWORD *)v4 + 28) = self->_requestStyle;
    *((_WORD *)v4 + 72) |= 2u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  *((_DWORD *)v4 + 27) = self->_checksumType;
  *((_WORD *)v4 + 72) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_35;
  }
LABEL_27:
  if ((flags & 0x10) != 0)
  {
LABEL_28:
    *((unsigned char *)v4 + 140) = self->_useAuthProxy;
    *((_WORD *)v4 + 72) |= 0x10u;
  }
LABEL_29:
  if ([(GEOActiveTileSet *)self deviceSKUAllowlistsCount])
  {
    [v4 clearDeviceSKUAllowlists];
    unint64_t v21 = [(GEOActiveTileSet *)self deviceSKUAllowlistsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        v24 = [(GEOActiveTileSet *)self deviceSKUAllowlistAtIndex:n];
        [v4 addDeviceSKUAllowlist:v24];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOActiveTileSetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_44;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOActiveTileSet *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_baseURL copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  *(_DWORD *)(v5 + 124) = self->_style;
  *(_DWORD *)(v5 + 116) = self->_scale;
  *(_DWORD *)(v5 + 120) = self->_size;
  *(_DWORD *)(v5 + 136) = self->_version;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_timeToLiveSeconds;
    *(_WORD *)(v5 + 144) |= 4u;
  }
  unint64_t availableTilesCount = self->_availableTilesCount;
  if (availableTilesCount)
  {
    -[GEOActiveTileSet _reserveAvailableTiles:](v5, availableTilesCount);
    memcpy(*(void **)(v5 + 24), self->_availableTiles, 24 * self->_availableTilesCount);
    *(void *)(v5 + 32) = self->_availableTilesCount;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  unint64_t v12 = self->_sentinelTiles;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v12);
        }
        unint64_t v16 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addSentinelTile:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [(NSString *)self->_localizationURL copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v17;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v19 = self->_supportedLanguages;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addSupportedLanguage:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v20);
  }

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_updateBehavior;
    *(_WORD *)(v5 + 144) |= 8u;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v24 = self->_countryRegionAllowlists;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(v24);
        }
        long long v28 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addCountryRegionAllowlist:v28];
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v25);
  }

  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 2) == 0) {
      goto LABEL_34;
    }
LABEL_46:
    *(_DWORD *)(v5 + 112) = self->_requestStyle;
    *(_WORD *)(v5 + 144) |= 2u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  *(_DWORD *)(v5 + 108) = self->_checksumType;
  *(_WORD *)(v5 + 144) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_46;
  }
LABEL_34:
  if ((flags & 0x10) != 0)
  {
LABEL_35:
    *(unsigned char *)(v5 + 140) = self->_useAuthProxy;
    *(_WORD *)(v5 + 144) |= 0x10u;
  }
LABEL_36:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v30 = self->_deviceSKUAllowlists;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v53 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v38;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(v30);
        }
        long long v34 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * m), "copyWithZone:", a3, (void)v37);
        [(id)v5 addDeviceSKUAllowlist:v34];
      }
      uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v53 count:16];
    }
    while (v31);
  }

  long long v35 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v35;
LABEL_44:

  return (id)v5;
}

- (unint64_t)hash
{
  [(GEOActiveTileSet *)self readAll:1];
  NSUInteger v21 = [(NSString *)self->_baseURL hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v20 = 2654435761 * self->_timeToLiveSeconds;
  }
  else {
    uint64_t v20 = 0;
  }
  versiouint64_t n = self->_version;
  uint64_t scale = self->_scale;
  uint64_t style = self->_style;
  uint64_t size = self->_size;
  uint64_t v5 = PBHashBytes();
  uint64_t v6 = [(NSMutableArray *)self->_sentinelTiles hash];
  NSUInteger v7 = [(NSString *)self->_localizationURL hash];
  uint64_t v8 = [(NSMutableArray *)self->_supportedLanguages hash];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v9 = 2654435761 * self->_updateBehavior;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [(NSMutableArray *)self->_countryRegionAllowlists hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    uint64_t v12 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v13 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v14 = 0;
    return (2654435761 * v19) ^ v21 ^ (2654435761 * v17) ^ (2654435761 * size) ^ (2654435761 * version) ^ v20 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ [(NSMutableArray *)self->_deviceSKUAllowlists hash];
  }
  uint64_t v12 = 2654435761 * self->_checksumType;
  if ((flags & 2) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v13 = 2654435761 * self->_requestStyle;
  if ((flags & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v14 = 2654435761 * self->_useAuthProxy;
  return (2654435761 * v19) ^ v21 ^ (2654435761 * v17) ^ (2654435761 * size) ^ (2654435761 * version) ^ v20 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ [(NSMutableArray *)self->_deviceSKUAllowlists hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 6)) {
    -[GEOActiveTileSet setBaseURL:](self, "setBaseURL:");
  }
  self->_uint64_t style = *((_DWORD *)v4 + 31);
  self->_uint64_t scale = *((_DWORD *)v4 + 29);
  self->_uint64_t size = *((_DWORD *)v4 + 30);
  self->_versiouint64_t n = *((_DWORD *)v4 + 34);
  if ((*((unsigned char *)v4 + 144) & 4) != 0)
  {
    self->_timeToLiveSeconds = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_flags |= 4u;
  }
  uint64_t v5 = [v4 availableTilesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      [v4 availableTilesAtIndex:i];
      [(GEOActiveTileSet *)self addAvailableTiles:v45];
    }
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v8 = *((id *)v4 + 10);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v8);
        }
        [(GEOActiveTileSet *)self addSentinelTile:*(void *)(*((void *)&v41 + 1) + 8 * j)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v10);
  }

  if (*((void *)v4 + 9)) {
    -[GEOActiveTileSet setLocalizationURL:](self, "setLocalizationURL:");
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = *((id *)v4 + 11);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v13);
        }
        [(GEOActiveTileSet *)self addSupportedLanguage:*(void *)(*((void *)&v37 + 1) + 8 * k)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v48 count:16];
    }
    while (v15);
  }

  if ((*((_WORD *)v4 + 72) & 8) != 0)
  {
    self->_updateBehavior = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_flags |= 8u;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = *((id *)v4 + 7);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v47 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t m = 0; m != v20; ++m)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        [(GEOActiveTileSet *)self addCountryRegionAllowlist:*(void *)(*((void *)&v33 + 1) + 8 * m)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v47 count:16];
    }
    while (v20);
  }

  __int16 v23 = *((_WORD *)v4 + 72);
  if (v23)
  {
    self->_checksumType = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_flags |= 1u;
    __int16 v23 = *((_WORD *)v4 + 72);
    if ((v23 & 2) == 0)
    {
LABEL_35:
      if ((v23 & 0x10) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
  else if ((v23 & 2) == 0)
  {
    goto LABEL_35;
  }
  self->_requestStyle = *((_DWORD *)v4 + 28);
  *(_WORD *)&self->_flags |= 2u;
  if ((*((_WORD *)v4 + 72) & 0x10) != 0)
  {
LABEL_36:
    self->_useAuthProxy = *((unsigned char *)v4 + 140);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_37:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v24 = *((id *)v4 + 8);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v46 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t n = 0; n != v26; ++n)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v24);
        }
        -[GEOActiveTileSet addDeviceSKUAllowlist:](self, "addDeviceSKUAllowlist:", *(void *)(*((void *)&v29 + 1) + 8 * n), (void)v29);
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v46 count:16];
    }
    while (v26);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOActiveTileSetReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_1070);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2020u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOActiveTileSet *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    NSUInteger v7 = self->_sentinelTiles;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = self->_countryRegionAllowlists;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_sentinelTiles, 0);
  objc_storeStrong((id *)&self->_localizationURL, 0);
  objc_storeStrong((id *)&self->_deviceSKUAllowlists, 0);
  objc_storeStrong((id *)&self->_countryRegionAllowlists, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (unsigned)minimumZoomLevelForMapPoint:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  unint64_t v6 = [(GEOActiveTileSet *)self availableTilesCount];
  if (!v6) {
    return 0;
  }
  unint64_t v7 = v6;
  uint64_t v8 = [(GEOActiveTileSet *)self availableTiles];
  unsigned int v9 = 100;
  do
  {
    unsigned int var5 = v8->var5;
    if (var5 <= 1) {
      unsigned int var5 = 1;
    }
    if (var5 >= v8->var2) {
      unsigned int var2 = v8->var2;
    }
    else {
      unsigned int var2 = var5;
    }
    if (var2) {
      BOOL v12 = var2 >= v9;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12 && RegionContainsPoint(&v8->var0, var0, var1)) {
      unsigned int v9 = var2;
    }
    ++v8;
    --v7;
  }
  while (v7);
  return v9;
}

- (unsigned)maximumZoomLevelForMapPoint:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  unint64_t v6 = [(GEOActiveTileSet *)self availableTilesCount];
  if (!v6) {
    return 21;
  }
  unint64_t v7 = v6;
  uint64_t v8 = [(GEOActiveTileSet *)self availableTiles];
  unsigned int var2 = 0;
  do
  {
    if (v8->var2 > var2 && RegionContainsPoint(&v8->var0, var0, var1)) {
      unsigned int var2 = v8->var2;
    }
    ++v8;
    --v7;
  }
  while (v7);
  return var2;
}

- (unsigned)largestZoomLevelLEQ:(unsigned int)a3 inRect:(id)a4
{
  double var1 = a4.var1.var1;
  double var0 = a4.var1.var0;
  double v6 = a4.var0.var1;
  double v7 = a4.var0.var0;
  unint64_t v10 = [(GEOActiveTileSet *)self availableTilesCount];
  if (!v10) {
    return a3;
  }
  unint64_t v11 = v10;
  BOOL v12 = [(GEOActiveTileSet *)self availableTiles];
  unsigned int v13 = 0;
  do
  {
    if (v12->var5 <= a3
      && v12->var2 >= v13
      && GEOTileSetRegionIntersectsMapRect(&v12->var0, v7, v6, var0, var1))
    {
      unsigned int var2 = v12->var2;
      unsigned int v13 = var2 >= a3 ? a3 : v12->var2;
      if (var2 >= a3) {
        break;
      }
    }
    ++v12;
    --v11;
  }
  while (v11);
  return v13;
}

- (BOOL)isAvailableForTileKey:(uint64_t)a3
{
  uint64_t v5 = [a1 availableTilesCount];
  if (!v5) {
    return 1;
  }
  uint64_t v6 = v5;
  double v7 = (unsigned int *)[a1 availableTiles];
  uint64_t v8 = v6 - 1;
  do
  {
    uint64_t v9 = v8;
    BOOL result = GEOTileSetRegionContainsTileKey(v7, a3);
    if (result) {
      break;
    }
    uint64_t v8 = v9 - 1;
    v7 += 6;
  }
  while (v9);
  return result;
}

- (id)dataForGenericTileType:(int)a3 configuration:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v7 = [(GEOActiveTileSet *)self sentinelTiles];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v12 type] == a3)
        {
          unsigned int v13 = GEOResourcesPath(v6);
          uint64_t v14 = [v12 resourceName];
          uint64_t v15 = [v13 stringByAppendingPathComponent:v14];

          if ([v15 length])
          {
            uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v15];

            goto LABEL_13;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v16 = 0;
LABEL_13:

  return v16;
}

- (id)_bestCountryRegionAllowlistMatchForCountry:(id)a3 region:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v25 = (unint64_t)a4;
  uint64_t v26 = (void *)v6;
  if (v6 | v25)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = [(GEOActiveTileSet *)self countryRegionAllowlists];
    uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          BOOL v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v12 hasCountryCode])
          {
            unsigned int v13 = [v12 countryCode];
            int v14 = [v26 isEqualToString:v13];
          }
          else
          {
            int v14 = 0;
          }
          if ([v12 hasRegion])
          {
            uint64_t v15 = [v12 region];
            int v16 = [(id)v25 isEqualToString:v15];

            if (v14 & v16)
            {
              id v22 = v12;

              goto LABEL_28;
            }
          }
          else
          {
            int v16 = 0;
          }
          if ([v12 hasCountryCode])
          {
            long long v17 = [v12 countryCode];
            int v18 = [v17 isEqualToString:@"*"];
          }
          else
          {
            int v18 = 1;
          }
          if ([v12 hasRegion])
          {
            long long v19 = [v12 region];
            int v20 = [v19 isEqualToString:@"*"];
          }
          else
          {
            int v20 = 1;
          }
          if (((v18 | v14) & (v20 | v16)) == 1)
          {
            id v21 = v12;

            id v9 = v21;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    id v9 = v9;
    id v22 = v9;
LABEL_28:
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (BOOL)isDisputedBordersAllowlistedForCountry:(id)a3 region:(id)a4
{
  id v4 = [(GEOActiveTileSet *)self _bestCountryRegionAllowlistMatchForCountry:a3 region:a4];

  return v4 != 0;
}

+ (id)buildDisputedBordersQueryItemsForCountry:(id)a3 region:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  if (v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F290C8] queryItemWithName:@"country" value:v5];
    [v7 addObject:v8];
  }
  if (v6)
  {
    id v9 = [MEMORY[0x1E4F290C8] queryItemWithName:@"region" value:v6];
    [v7 addObject:v9];
  }

  return v7;
}

- (id)disputedBordersQueryItemsForCountry:(id)a3 region:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(GEOActiveTileSet *)self _bestCountryRegionAllowlistMatchForCountry:v6 region:v7];
  id v9 = v8;
  if (v8)
  {
    if ([v8 hasCountryCode]
      && ([v9 countryCode],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 length],
          v10,
          v11))
    {
      id v12 = v6;
    }
    else
    {
      id v12 = 0;
    }
    if ([v9 hasRegion])
    {
      unsigned int v13 = [v9 region];
      id v14 = (id)[v13 length];

      if (v14) {
        id v14 = v7;
      }
    }
    else
    {
      id v14 = 0;
    }
    uint64_t v15 = +[GEOActiveTileSet buildDisputedBordersQueryItemsForCountry:v12 region:v14];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (id)disputedBordersOfflineKeySuffixForCountry:(id)a3 region:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(GEOActiveTileSet *)self _bestCountryRegionAllowlistMatchForCountry:v6 region:v7];
  id v9 = v8;
  if (v8)
  {
    if ([v8 hasCountryCode]
      && ([v9 countryCode],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 length],
          v10,
          v11))
    {
      id v12 = (__CFString *)v6;
    }
    else
    {
      id v12 = @"ZZ";
    }
    if ([v9 hasRegion]
      && ([v9 region],
          unsigned int v13 = objc_claimAutoreleasedReturnValue(),
          uint64_t v14 = [v13 length],
          v13,
          v14))
    {
      uint64_t v15 = (__CFString *)v7;
    }
    else
    {
      uint64_t v15 = @"ZZ";
    }
    if ([(__CFString *)v12 length] || [(__CFString *)v15 length])
    {
      uint64_t v16 = [(__CFString *)v12 length];
      uint64_t v17 = [(__CFString *)v15 length];
      int v18 = [MEMORY[0x1E4F28E78] stringWithCapacity:v16 + v17 + 2];
      [v18 appendString:v12];
      [v18 appendString:@"_@"];
      [v18 appendString:v15];
    }
    else
    {
      int v18 = 0;
    }
  }
  else
  {
    int v18 = 0;
  }

  return v18;
}

- (BOOL)isEquivalentTileSet:(id)a3
{
  id v4 = (GEOActiveTileSet *)a3;
  id v5 = v4;
  BOOL v10 = 1;
  if (v4 != self)
  {
    if (!v4
      || (int v6 = [(GEOActiveTileSet *)self scale], v6 != [(GEOActiveTileSet *)v5 scale])
      || (int v7 = [(GEOActiveTileSet *)self size], v7 != [(GEOActiveTileSet *)v5 size])
      || (int v8 = [(GEOActiveTileSet *)self style], v8 != [(GEOActiveTileSet *)v5 style])
      || (unsigned int v9 = [(GEOActiveTileSet *)self version], v9 != [(GEOActiveTileSet *)v5 version]))
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (void)_resetBestLanguage
{
}

- (id)initWithTileSet:(int)a3 version:(void *)a4 resourceManifest:
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a1
    && (v93.receiver = a1,
        v93.super_class = (Class)GEOActiveTileSet,
        (id v9 = objc_msgSendSuper2(&v93, sel_init)) != 0))
  {
    BOOL v10 = v9;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v11 = [v7 validVersions];
    id v12 = (id)[v11 countByEnumeratingWithState:&v89 objects:v101 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v90;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v90 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(_DWORD **)(*((void *)&v89 + 1) + 8 * (void)v14);
          if (v15)
          {
            if (v15[21] == a3)
            {
              uint64_t v17 = v15;

              int v18 = [v7 baseURL];
              [v10 setBaseURL:v18];

              objc_msgSend(v10, "setStyle:", objc_msgSend(v7, "style"));
              objc_msgSend(v10, "setScale:", objc_msgSend(v7, "scale"));
              objc_msgSend(v10, "setSize:", objc_msgSend(v7, "size"));
              if ([v7 hasUpdateBehavior]) {
                objc_msgSend(v10, "setUpdateBehavior:", objc_msgSend(v7, "updateBehavior"));
              }
              if ([v7 hasChecksumType]) {
                objc_msgSend(v10, "setChecksumType:", objc_msgSend(v7, "checksumType"));
              }
              if ([v7 hasRequestStyle]) {
                objc_msgSend(v10, "setRequestStyle:", objc_msgSend(v7, "requestStyle"));
              }
              if ([v7 hasUseAuthProxy]) {
                objc_msgSend(v10, "setUseAuthProxy:", objc_msgSend(v7, "useAuthProxy"));
              }
              id v67 = v7;
              [v10 setVersion:v17[21]];
              if ((v17[24] & 2) != 0) {
                [v10 setTimeToLiveSeconds:v17[23]];
              }
              -[GEOTileSetVersion _readAvailableTiles]((uint64_t)v17);
              uint64_t v19 = *((void *)v17 + 3);
              -[GEOTileSetVersion _readAvailableTiles]((uint64_t)v17);
              [v10 setAvailableTiles:v19 count:*((void *)v17 + 4)];
              -[GEOTileSetVersion _readGenericTiles]((uint64_t)v17);
              id v68 = v8;
              if (*((void *)v17 + 7))
              {
                for (unint64_t i = 0; i < *((void *)v17 + 7); ++i)
                {
                  uint64_t v21 = -[GEOTileSetVersion genericTileAtIndex:]((uint64_t)v17, i);
                  if ((v22 & 0x100000000) != 0)
                  {
                    uint64_t v23 = v21;
                    uint64_t v24 = v22;
                    if ([v8 resourcesCount] <= (unint64_t)v21)
                    {
                      uint64_t v53 = objc_msgSend(NSString, "stringWithFormat:", @"Generic tile's resource index %i outside of list length %lu", v23, objc_msgSend(v8, "resourcesCount"));
                      v65 = GEOGetResourceManifestLog();
                      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        long long v100 = v53;
                        _os_log_impl(&dword_188D96000, v65, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
                      }

                      id v12 = 0;
                      goto LABEL_85;
                    }
                    unint64_t v25 = [v8 resourceAtIndex:v23];
                    uint64_t v26 = objc_alloc_init(GEOSentinelTile);
                    long long v27 = v26;
                    if ((v24 & 0x400000000) != 0) {
                      uint64_t v28 = v24;
                    }
                    else {
                      uint64_t v28 = 1;
                    }
                    [(GEOSentinelTile *)v26 setType:v28];
                    long long v29 = [v25 filename];
                    [(GEOSentinelTile *)v27 setResourceName:v29];

                    [v10 addSentinelTile:v27];
                    id v8 = v68;
                  }
                  -[GEOTileSetVersion _readGenericTiles]((uint64_t)v17);
                }
              }
              long long v30 = [v7 localizationURL];
              [v10 setLocalizationURL:v30];

              if (v17[24])
              {
                long long v87 = 0u;
                long long v88 = 0u;
                long long v85 = 0u;
                long long v86 = 0u;
                long long v31 = [v7 supportedLanguages];
                id v32 = (id)[v31 countByEnumeratingWithState:&v85 objects:v98 count:16];
                if (v32)
                {
                  uint64_t v33 = *(void *)v86;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v32; uint64_t j = (char *)j + 1)
                    {
                      if (*(void *)v86 != v33) {
                        objc_enumerationMutation(v31);
                      }
                      long long v35 = *(void **)(*((void *)&v85 + 1) + 8 * (void)j);
                      if ([v35 identifier] == v17[22])
                      {
                        id v32 = v35;
                        goto LABEL_47;
                      }
                    }
                    id v32 = (id)[v31 countByEnumeratingWithState:&v85 objects:v98 count:16];
                    if (v32) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_47:

                long long v83 = 0u;
                long long v84 = 0u;
                long long v81 = 0u;
                long long v82 = 0u;
                long long v36 = [v32 languages];
                uint64_t v37 = [v36 countByEnumeratingWithState:&v81 objects:v97 count:16];
                if (v37)
                {
                  uint64_t v38 = v37;
                  uint64_t v39 = *(void *)v82;
                  do
                  {
                    for (uint64_t k = 0; k != v38; ++k)
                    {
                      if (*(void *)v82 != v39) {
                        objc_enumerationMutation(v36);
                      }
                      [v10 addSupportedLanguage:*(void *)(*((void *)&v81 + 1) + 8 * k)];
                    }
                    uint64_t v38 = [v36 countByEnumeratingWithState:&v81 objects:v97 count:16];
                  }
                  while (v38);
                }
              }
              long long v79 = 0u;
              long long v80 = 0u;
              long long v77 = 0u;
              long long v78 = 0u;
              long long v41 = [v7 countryRegionAllowlists];
              uint64_t v42 = [v41 countByEnumeratingWithState:&v77 objects:v96 count:16];
              if (v42)
              {
                uint64_t v43 = v42;
                uint64_t v44 = *(void *)v78;
                do
                {
                  for (uint64_t m = 0; m != v43; ++m)
                  {
                    if (*(void *)v78 != v44) {
                      objc_enumerationMutation(v41);
                    }
                    long long v46 = *(void **)(*((void *)&v77 + 1) + 8 * m);
                    long long v47 = objc_alloc_init(GEOCountryRegionTuple);
                    [v46 copyTo:v47];
                    long long v48 = [(GEOCountryRegionTuple *)v47 countryCode];
                    long long v49 = [v48 uppercaseString];
                    [(GEOCountryRegionTuple *)v47 setCountryCode:v49];

                    uint64_t v50 = [(GEOCountryRegionTuple *)v47 region];
                    long long v51 = [v50 uppercaseString];
                    [(GEOCountryRegionTuple *)v47 setRegion:v51];

                    [v10 addCountryRegionAllowlist:v47];
                  }
                  uint64_t v43 = [v41 countByEnumeratingWithState:&v77 objects:v96 count:16];
                }
                while (v43);
              }

              long long v52 = _getValue(GeoServicesConfig__debug_TileSetSKURegionsAllowlistOverride, (uint64_t)off_1E9114AB8, 1, 0, 0, 0);
              uint64_t v53 = v52;
              if (v52)
              {
                long long v75 = 0uLL;
                long long v76 = 0uLL;
                long long v73 = 0uLL;
                long long v74 = 0uLL;
                uint64_t v54 = [v52 countByEnumeratingWithState:&v73 objects:v95 count:16];
                id v7 = v67;
                if (v54)
                {
                  uint64_t v55 = v54;
                  uint64_t v56 = *(void *)v74;
                  do
                  {
                    for (uint64_t n = 0; n != v55; ++n)
                    {
                      if (*(void *)v74 != v56) {
                        objc_enumerationMutation(v53);
                      }
                      uint64_t v58 = *(void *)(*((void *)&v73 + 1) + 8 * n);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        [v10 addDeviceSKUAllowlist:v58];
                      }
                    }
                    uint64_t v55 = [v53 countByEnumeratingWithState:&v73 objects:v95 count:16];
                  }
                  while (v55);
                }
              }
              else
              {
                long long v71 = 0uLL;
                long long v72 = 0uLL;
                long long v69 = 0uLL;
                long long v70 = 0uLL;
                id v7 = v67;
                long long v59 = [v67 deviceSKUAllowlists];
                uint64_t v60 = [v59 countByEnumeratingWithState:&v69 objects:v94 count:16];
                if (v60)
                {
                  uint64_t v61 = v60;
                  uint64_t v62 = *(void *)v70;
                  do
                  {
                    for (iunint64_t i = 0; ii != v61; ++ii)
                    {
                      if (*(void *)v70 != v62) {
                        objc_enumerationMutation(v59);
                      }
                      uint64_t v64 = [*(id *)(*((void *)&v69 + 1) + 8 * ii) uppercaseString];
                      [v10 addDeviceSKUAllowlist:v64];
                    }
                    uint64_t v61 = [v59 countByEnumeratingWithState:&v69 objects:v94 count:16];
                  }
                  while (v61);
                }
              }
              id v12 = v10;
              id v8 = v68;
LABEL_85:

              goto LABEL_86;
            }
          }
          else if (!a3)
          {
            id v12 = 0;
            goto LABEL_15;
          }
          uint64_t v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        uint64_t v16 = [v11 countByEnumeratingWithState:&v89 objects:v101 count:16];
        id v12 = (id)v16;
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_15:
    uint64_t v17 = v11;
LABEL_86:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

@end