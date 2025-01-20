@interface GEOTileGroup
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMuninVersionIndex;
- (BOOL)hasOfflineMetadataIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORegionalResourceIndex)regionalResourceIndexAtIndex:(unint64_t)a3;
- (GEORegionalResourceIndex)regionalResourceIndexs;
- (GEOTileGroup)init;
- (GEOTileGroup)initWithData:(id)a3;
- (GEOTileGroup)initWithDictionary:(id)a3;
- (GEOTileGroup)initWithJSON:(id)a3;
- (GEOTileSetRegion)hybridUnavailableRegionAtIndex:(SEL)a3;
- (GEOTileSetRegion)hybridUnavailableRegions;
- (GEOVersionedTileSet)tileSetAtIndex:(unint64_t)a3;
- (GEOVersionedTileSet)tileSets;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_reserveHybridUnavailableRegions:(uint64_t)a1;
- (uint64_t)_reserveRegionalResourceIndexs:(uint64_t)a1;
- (uint64_t)_reserveTileSets:(uint64_t)a1;
- (unint64_t)attributionIndexsCount;
- (unint64_t)fontIndexsCount;
- (unint64_t)hash;
- (unint64_t)hybridUnavailableRegionsCount;
- (unint64_t)iconIndexsCount;
- (unint64_t)regionalResourceIndexsCount;
- (unint64_t)resourceIndexsCount;
- (unint64_t)styleSheetIndexsCount;
- (unint64_t)textureIndexsCount;
- (unint64_t)tileSetsCount;
- (unint64_t)xmlIndexsCount;
- (unsigned)attributionIndexAtIndex:(unint64_t)a3;
- (unsigned)attributionIndexs;
- (unsigned)fontIndexAtIndex:(unint64_t)a3;
- (unsigned)fontIndexs;
- (unsigned)iconIndexAtIndex:(unint64_t)a3;
- (unsigned)iconIndexs;
- (unsigned)identifier;
- (unsigned)muninVersionIndex;
- (unsigned)offlineMetadataIndex;
- (unsigned)resourceIndexAtIndex:(unint64_t)a3;
- (unsigned)resourceIndexs;
- (unsigned)styleSheetIndexAtIndex:(unint64_t)a3;
- (unsigned)styleSheetIndexs;
- (unsigned)textureIndexAtIndex:(unint64_t)a3;
- (unsigned)textureIndexs;
- (unsigned)xmlIndexAtIndex:(unint64_t)a3;
- (unsigned)xmlIndexs;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readAttributionIndexs;
- (void)_readFontIndexs;
- (void)_readHybridUnavailableRegions;
- (void)_readIconIndexs;
- (void)_readRegionalResourceIndexs;
- (void)_readResourceIndexs;
- (void)_readStyleSheetIndexs;
- (void)_readTextureIndexs;
- (void)_readTileSets;
- (void)_readXmlIndexs;
- (void)addAttributionIndex:(unsigned int)a3;
- (void)addFontIndex:(unsigned int)a3;
- (void)addHybridUnavailableRegion:(GEOTileSetRegion *)a3;
- (void)addIconIndex:(unsigned int)a3;
- (void)addRegionalResourceIndex:(GEORegionalResourceIndex)a3;
- (void)addResourceIndex:(unsigned int)a3;
- (void)addStyleSheetIndex:(unsigned int)a3;
- (void)addTextureIndex:(unsigned int)a3;
- (void)addTileSet:(GEOVersionedTileSet)a3;
- (void)addXmlIndex:(unsigned int)a3;
- (void)clearAttributionIndexs;
- (void)clearFontIndexs;
- (void)clearHybridUnavailableRegions;
- (void)clearIconIndexs;
- (void)clearRegionalResourceIndexs;
- (void)clearResourceIndexs;
- (void)clearStyleSheetIndexs;
- (void)clearTextureIndexs;
- (void)clearTileSets;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearXmlIndexs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAttributionIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setFontIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasMuninVersionIndex:(BOOL)a3;
- (void)setHasOfflineMetadataIndex:(BOOL)a3;
- (void)setHybridUnavailableRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4;
- (void)setIconIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setIdentifier:(unsigned int)a3;
- (void)setMuninVersionIndex:(unsigned int)a3;
- (void)setOfflineMetadataIndex:(unsigned int)a3;
- (void)setRegionalResourceIndexs:(GEORegionalResourceIndex *)a3 count:(unint64_t)a4;
- (void)setResourceIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setStyleSheetIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTextureIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTileSets:(GEOVersionedTileSet *)a3 count:(unint64_t)a4;
- (void)setXmlIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOTileGroup

- (unsigned)identifier
{
  return self->_identifier;
}

- (GEOTileGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTileGroup;
  v2 = [(GEOTileGroup *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTileGroup)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTileGroup;
  v3 = [(GEOTileGroup *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  [(GEOTileGroup *)self clearTileSets];
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  [(GEOTileGroup *)self clearRegionalResourceIndexs];
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  [(GEOTileGroup *)self clearHybridUnavailableRegions];
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTileGroup;
  [(GEOTileGroup *)&v3 dealloc];
}

- (void)setIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_identifier = a3;
}

- (void)_readTileSets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileSets_tags_1294);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)tileSetsCount
{
  return self->_tileSetsCount;
}

- (GEOVersionedTileSet)tileSets
{
  return self->_tileSets;
}

- (uint64_t)_reserveTileSets:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 224);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 232);
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
    if (8 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 216), 8 * v9, 0x62A81FEFuLL);
    if (result)
    {
      *(void *)(a1 + 232) = v9;
      *(void *)(a1 + 216) = result;
      bzero((void *)(result + 8 * *(void *)(a1 + 224)), 8 * (v9 - *(void *)(a1 + 224)));
      return 1;
    }
  }
  return result;
}

- (void)clearTileSets
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_tileSetsSpace = 0;
  self->_tileSetsCount = 0;
  free(self->_tileSets);
  self->_tileSets = 0;
}

- (void)addTileSet:(GEOVersionedTileSet)a3
{
  if (self && -[GEOTileGroup _reserveTileSets:]((uint64_t)self, 1uLL)) {
    self->_tileSets[self->_tileSetsCount++] = a3;
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (GEOVersionedTileSet)tileSetAtIndex:(unint64_t)a3
{
  -[GEOTileGroup _readTileSets]((uint64_t)self);
  unint64_t tileSetsCount = self->_tileSetsCount;
  if (tileSetsCount <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, tileSetsCount);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return self->_tileSets[a3];
}

- (void)setTileSets:(GEOVersionedTileSet *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  [(GEOTileGroup *)self clearTileSets];
  if (-[GEOTileGroup _reserveTileSets:]((uint64_t)self, a4))
  {
    memcpy(self->_tileSets, a3, 8 * a4);
    self->_unint64_t tileSetsCount = a4;
  }
}

- (void)_readStyleSheetIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleSheetIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)styleSheetIndexsCount
{
  return self->_styleSheetIndexs.count;
}

- (unsigned)styleSheetIndexs
{
  return self->_styleSheetIndexs.list;
}

- (void)clearStyleSheetIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedUInt32Clear();
}

- (void)addStyleSheetIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)styleSheetIndexAtIndex:(unint64_t)a3
{
  -[GEOTileGroup _readStyleSheetIndexs]((uint64_t)self);
  p_styleSheetIndexs = &self->_styleSheetIndexs;
  unint64_t count = self->_styleSheetIndexs.count;
  if (count <= a3)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_styleSheetIndexs->list[a3];
}

- (void)setStyleSheetIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147400](&self->_styleSheetIndexs, a3, a4);
}

- (void)_readTextureIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTextureIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)textureIndexsCount
{
  return self->_textureIndexs.count;
}

- (unsigned)textureIndexs
{
  return self->_textureIndexs.list;
}

- (void)clearTextureIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedUInt32Clear();
}

- (void)addTextureIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)textureIndexAtIndex:(unint64_t)a3
{
  -[GEOTileGroup _readTextureIndexs]((uint64_t)self);
  p_textureIndexs = &self->_textureIndexs;
  unint64_t count = self->_textureIndexs.count;
  if (count <= a3)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_textureIndexs->list[a3];
}

- (void)setTextureIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147400](&self->_textureIndexs, a3, a4);
}

- (void)_readFontIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFontIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)fontIndexsCount
{
  return self->_fontIndexs.count;
}

- (unsigned)fontIndexs
{
  return self->_fontIndexs.list;
}

- (void)clearFontIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedUInt32Clear();
}

- (void)addFontIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)fontIndexAtIndex:(unint64_t)a3
{
  -[GEOTileGroup _readFontIndexs]((uint64_t)self);
  p_fontIndexs = &self->_fontIndexs;
  unint64_t count = self->_fontIndexs.count;
  if (count <= a3)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_fontIndexs->list[a3];
}

- (void)setFontIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147400](&self->_fontIndexs, a3, a4);
}

- (void)_readIconIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIconIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)iconIndexsCount
{
  return self->_iconIndexs.count;
}

- (unsigned)iconIndexs
{
  return self->_iconIndexs.list;
}

- (void)clearIconIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedUInt32Clear();
}

- (void)addIconIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)iconIndexAtIndex:(unint64_t)a3
{
  -[GEOTileGroup _readIconIndexs]((uint64_t)self);
  p_iconIndexs = &self->_iconIndexs;
  unint64_t count = self->_iconIndexs.count;
  if (count <= a3)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_iconIndexs->list[a3];
}

- (void)setIconIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147400](&self->_iconIndexs, a3, a4);
}

- (void)_readRegionalResourceIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegionalResourceIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)regionalResourceIndexsCount
{
  return self->_regionalResourceIndexsCount;
}

- (GEORegionalResourceIndex)regionalResourceIndexs
{
  return self->_regionalResourceIndexs;
}

- (uint64_t)_reserveRegionalResourceIndexs:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 128);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 136);
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
    if (16 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 120), 16 * v9, 0xF0A10D9DuLL);
    if (result)
    {
      *(void *)(a1 + 136) = v9;
      *(void *)(a1 + 120) = result;
      bzero((void *)(result + 16 * *(void *)(a1 + 128)), 16 * (v9 - *(void *)(a1 + 128)));
      return 1;
    }
  }
  return result;
}

- (void)clearRegionalResourceIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_regionalResourceIndexsSpace = 0;
  self->_regionalResourceIndexsCount = 0;
  free(self->_regionalResourceIndexs);
  self->_regionalResourceIndexs = 0;
}

- (void)addRegionalResourceIndex:(GEORegionalResourceIndex)a3
{
  uint64_t v3 = *(void *)&a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  -[GEOTileGroup _readRegionalResourceIndexs]((uint64_t)self);
  if (self && -[GEOTileGroup _reserveRegionalResourceIndexs:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_regionalResourceIndexs[self->_regionalResourceIndexsCount];
    *(void *)&v6->var0 = v4;
    *(void *)&v6->var2 = v3;
    ++self->_regionalResourceIndexsCount;
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (GEORegionalResourceIndex)regionalResourceIndexAtIndex:(unint64_t)a3
{
  -[GEOTileGroup _readRegionalResourceIndexs]((uint64_t)self);
  unint64_t regionalResourceIndexsCount = self->_regionalResourceIndexsCount;
  if (regionalResourceIndexsCount <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, regionalResourceIndexsCount);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  v10 = &self->_regionalResourceIndexs[a3];
  uint64_t v11 = *(void *)&v10->var0;
  uint64_t v12 = *(void *)&v10->var2;
  result.var2 = v12;
  result.var3 = *($162FAC071EAEBA15A6F8D573D0754DF6 *)((char *)&v12 + 4);
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  return result;
}

- (void)setRegionalResourceIndexs:(GEORegionalResourceIndex *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  [(GEOTileGroup *)self clearRegionalResourceIndexs];
  if (-[GEOTileGroup _reserveRegionalResourceIndexs:]((uint64_t)self, a4))
  {
    memcpy(self->_regionalResourceIndexs, a3, 16 * a4);
    self->_unint64_t regionalResourceIndexsCount = a4;
  }
}

- (void)_readXmlIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readXmlIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)xmlIndexsCount
{
  return self->_xmlIndexs.count;
}

- (unsigned)xmlIndexs
{
  return self->_xmlIndexs.list;
}

- (void)clearXmlIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedUInt32Clear();
}

- (void)addXmlIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)xmlIndexAtIndex:(unint64_t)a3
{
  -[GEOTileGroup _readXmlIndexs]((uint64_t)self);
  p_xmlIndexs = &self->_xmlIndexs;
  unint64_t count = self->_xmlIndexs.count;
  if (count <= a3)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_xmlIndexs->list[a3];
}

- (void)setXmlIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147400](&self->_xmlIndexs, a3, a4);
}

- (void)_readAttributionIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributionIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)attributionIndexsCount
{
  return self->_attributionIndexs.count;
}

- (unsigned)attributionIndexs
{
  return self->_attributionIndexs.list;
}

- (void)clearAttributionIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedUInt32Clear();
}

- (void)addAttributionIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)attributionIndexAtIndex:(unint64_t)a3
{
  -[GEOTileGroup _readAttributionIndexs]((uint64_t)self);
  p_attributionIndexs = &self->_attributionIndexs;
  unint64_t count = self->_attributionIndexs.count;
  if (count <= a3)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_attributionIndexs->list[a3];
}

- (void)setAttributionIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147400](&self->_attributionIndexs, a3, a4);
}

- (void)_readHybridUnavailableRegions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHybridUnavailableRegions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)hybridUnavailableRegionsCount
{
  return self->_hybridUnavailableRegionsCount;
}

- (GEOTileSetRegion)hybridUnavailableRegions
{
  return self->_hybridUnavailableRegions;
}

- (uint64_t)_reserveHybridUnavailableRegions:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 80);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 88);
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
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 72), 24 * v9, 0x698C193uLL);
    if (result)
    {
      *(void *)(a1 + 88) = v9;
      *(void *)(a1 + 72) = result;
      bzero((void *)(result + 24 * *(void *)(a1 + 80)), 24 * (v9 - *(void *)(a1 + 80)));
      return 1;
    }
  }
  return result;
}

- (void)clearHybridUnavailableRegions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_hybridUnavailableRegionsSpace = 0;
  self->_hybridUnavailableRegionsCount = 0;
  free(self->_hybridUnavailableRegions);
  self->_hybridUnavailableRegions = 0;
}

- (void)addHybridUnavailableRegion:(GEOTileSetRegion *)a3
{
  -[GEOTileGroup _readHybridUnavailableRegions]((uint64_t)self);
  GEOTileSetRegion v5 = *a3;
  if (self && -[GEOTileGroup _reserveHybridUnavailableRegions:]((uint64_t)self, 1uLL)) {
    self->_hybridUnavailableRegions[self->_hybridUnavailableRegionsCount++] = v5;
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (GEOTileSetRegion)hybridUnavailableRegionAtIndex:(SEL)a3
{
  -[GEOTileGroup _readHybridUnavailableRegions]((uint64_t)self);
  unint64_t hybridUnavailableRegionsCount = self->_hybridUnavailableRegionsCount;
  if (hybridUnavailableRegionsCount <= a4)
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C4A8];
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a4, hybridUnavailableRegionsCount);
    uint64_t v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];
    [v12 raise];
  }
  v13 = &self->_hybridUnavailableRegions[a4];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(void *)&retstr->var4 = *(void *)&v13->var4;
  return result;
}

- (void)setHybridUnavailableRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  [(GEOTileGroup *)self clearHybridUnavailableRegions];
  if (-[GEOTileGroup _reserveHybridUnavailableRegions:]((uint64_t)self, a4))
  {
    memcpy(self->_hybridUnavailableRegions, a3, 24 * a4);
    self->_unint64_t hybridUnavailableRegionsCount = a4;
  }
}

- (void)_readResourceIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_WORD *)(a1 + 288) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResourceIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)resourceIndexsCount
{
  return self->_resourceIndexs.count;
}

- (unsigned)resourceIndexs
{
  return self->_resourceIndexs.list;
}

- (void)clearResourceIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedUInt32Clear();
}

- (void)addResourceIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unsigned)resourceIndexAtIndex:(unint64_t)a3
{
  -[GEOTileGroup _readResourceIndexs]((uint64_t)self);
  p_resourceIndexs = &self->_resourceIndexs;
  unint64_t count = self->_resourceIndexs.count;
  if (count <= a3)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_resourceIndexs->list[a3];
}

- (void)setResourceIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147400](&self->_resourceIndexs, a3, a4);
}

- (unsigned)muninVersionIndex
{
  return self->_muninVersionIndex;
}

- (void)setMuninVersionIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_muninVersionIndex = a3;
}

- (void)setHasMuninVersionIndex:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasMuninVersionIndex
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)offlineMetadataIndex
{
  return self->_offlineMetadataIndex;
}

- (void)setOfflineMetadataIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_offlineMetadataIndex = a3;
}

- (void)setHasOfflineMetadataIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8194;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasOfflineMetadataIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTileGroup;
  unint64_t v4 = [(GEOTileGroup *)&v8 description];
  GEOTileSetRegion v5 = [(GEOTileGroup *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTileGroup _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    GEOTileSetRegion v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 276)];
    [v4 setObject:v5 forKey:@"identifier"];

    if (*(void *)(a1 + 224))
    {
      unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 224)];
      if (*(void *)(a1 + 224))
      {
        uint64_t v7 = 0;
        unint64_t v8 = 0;
        do
        {
          unint64_t v9 = _GEOVersionedTileSetDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 216) + v7));
          [v6 addObject:v9];

          ++v8;
          v7 += 8;
        }
        while (v8 < *(void *)(a1 + 224));
      }
      [v4 setObject:v6 forKey:@"tileSet"];
    }
    if (*(void *)(a1 + 176))
    {
      uint64_t v10 = PBRepeatedUInt32NSArray();
      [v4 setObject:v10 forKey:@"styleSheetIndex"];
    }
    if (*(void *)(a1 + 200))
    {
      uint64_t v11 = PBRepeatedUInt32NSArray();
      [v4 setObject:v11 forKey:@"textureIndex"];
    }
    if (*(void *)(a1 + 56))
    {
      uint64_t v12 = PBRepeatedUInt32NSArray();
      [v4 setObject:v12 forKey:@"fontIndex"];
    }
    if (*(void *)(a1 + 104))
    {
      v13 = PBRepeatedUInt32NSArray();
      [v4 setObject:v13 forKey:@"iconIndex"];
    }
    if (*(void *)(a1 + 128))
    {
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 128)];
      if (*(void *)(a1 + 128))
      {
        uint64_t v15 = 0;
        unint64_t v16 = 0;
        do
        {
          v17 = _GEORegionalResourceIndexDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 120) + v15));
          [v14 addObject:v17];

          ++v16;
          v15 += 16;
        }
        while (v16 < *(void *)(a1 + 128));
      }
      [v4 setObject:v14 forKey:@"regionalResourceIndex"];
    }
    if (*(void *)(a1 + 248))
    {
      v18 = PBRepeatedUInt32NSArray();
      [v4 setObject:v18 forKey:@"xmlIndex"];
    }
    if (*(void *)(a1 + 32))
    {
      v19 = PBRepeatedUInt32NSArray();
      [v4 setObject:v19 forKey:@"attributionIndex"];
    }
    if (*(void *)(a1 + 80))
    {
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 80)];
      if (*(void *)(a1 + 80))
      {
        uint64_t v21 = 0;
        unint64_t v22 = 0;
        do
        {
          v23 = _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 72) + v21));
          [v20 addObject:v23];

          ++v22;
          v21 += 24;
        }
        while (v22 < *(void *)(a1 + 80));
      }
      [v4 setObject:v20 forKey:@"hybridUnavailableRegion"];
    }
    if (*(void *)(a1 + 152))
    {
      v24 = PBRepeatedUInt32NSArray();
      [v4 setObject:v24 forKey:@"resourceIndex"];
    }
    __int16 v25 = *(_WORD *)(a1 + 288);
    if (v25)
    {
      v26 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 280)];
      [v4 setObject:v26 forKey:@"muninVersionIndex"];

      __int16 v25 = *(_WORD *)(a1 + 288);
    }
    if ((v25 & 2) != 0)
    {
      v27 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 284)];
      [v4 setObject:v27 forKey:@"offlineMetadataIndex"];
    }
    v28 = *(void **)(a1 + 16);
    if (v28)
    {
      v29 = [v28 dictionaryRepresentation];
      v30 = v29;
      if (a2)
      {
        v31 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v29, "count"));
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __42__GEOTileGroup__dictionaryRepresentation___block_invoke;
        v35[3] = &unk_1E53D8860;
        id v32 = v31;
        id v36 = v32;
        [v30 enumerateKeysAndObjectsUsingBlock:v35];
        id v33 = v32;

        v30 = v33;
      }
      [v4 setObject:v30 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTileGroup _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEOTileGroup__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    unint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    unint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOTileGroup)initWithDictionary:(id)a3
{
  return (GEOTileGroup *)-[GEOTileGroup _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      unint64_t v4 = [v3 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIdentifier:", objc_msgSend(v4, "unsignedIntValue"));
      }

      id v5 = [v3 objectForKeyedSubscript:@"tileSet"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        id v6 = v5;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v118 objects:v131 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v119;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v119 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void **)(*((void *)&v118 + 1) + 8 * v10);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                *(void *)&long long v84 = 0;
                _GEOVersionedTileSetFromDictionaryRepresentation(v11, &v84);
                [a1 addTileSet:(void)v84];
              }
              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v6 countByEnumeratingWithState:&v118 objects:v131 count:16];
          }
          while (v8);
        }
      }
      uint64_t v12 = [v3 objectForKeyedSubscript:@"styleSheetIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v114 objects:v130 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v115;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v115 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v114 + 1) + 8 * v17);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addStyleSheetIndex:", objc_msgSend(v18, "unsignedIntValue"));
              }
              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v114 objects:v130 count:16];
          }
          while (v15);
        }
      }
      v19 = [v3 objectForKeyedSubscript:@"textureIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v110 objects:v129 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v111;
          do
          {
            uint64_t v24 = 0;
            do
            {
              if (*(void *)v111 != v23) {
                objc_enumerationMutation(v20);
              }
              __int16 v25 = *(void **)(*((void *)&v110 + 1) + 8 * v24);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addTextureIndex:", objc_msgSend(v25, "unsignedIntValue"));
              }
              ++v24;
            }
            while (v22 != v24);
            uint64_t v22 = [v20 countByEnumeratingWithState:&v110 objects:v129 count:16];
          }
          while (v22);
        }
      }
      v26 = [v3 objectForKeyedSubscript:@"fontIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v106 objects:v128 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v107;
          do
          {
            uint64_t v31 = 0;
            do
            {
              if (*(void *)v107 != v30) {
                objc_enumerationMutation(v27);
              }
              id v32 = *(void **)(*((void *)&v106 + 1) + 8 * v31);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addFontIndex:", objc_msgSend(v32, "unsignedIntValue"));
              }
              ++v31;
            }
            while (v29 != v31);
            uint64_t v29 = [v27 countByEnumeratingWithState:&v106 objects:v128 count:16];
          }
          while (v29);
        }
      }
      id v33 = [v3 objectForKeyedSubscript:@"iconIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id v34 = v33;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v102 objects:v127 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v103;
          do
          {
            uint64_t v38 = 0;
            do
            {
              if (*(void *)v103 != v37) {
                objc_enumerationMutation(v34);
              }
              v39 = *(void **)(*((void *)&v102 + 1) + 8 * v38);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addIconIndex:", objc_msgSend(v39, "unsignedIntValue"));
              }
              ++v38;
            }
            while (v36 != v38);
            uint64_t v36 = [v34 countByEnumeratingWithState:&v102 objects:v127 count:16];
          }
          while (v36);
        }
      }
      v40 = [v3 objectForKeyedSubscript:@"regionalResourceIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        id v41 = v40;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v98 objects:v126 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v99;
          do
          {
            uint64_t v45 = 0;
            do
            {
              if (*(void *)v99 != v44) {
                objc_enumerationMutation(v41);
              }
              v46 = *(void **)(*((void *)&v98 + 1) + 8 * v45);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v84 = 0uLL;
                _GEORegionalResourceIndexFromDictionaryRepresentation(v46, (uint64_t)&v84);
                [a1 addRegionalResourceIndex:v84];
              }
              ++v45;
            }
            while (v43 != v45);
            uint64_t v43 = [v41 countByEnumeratingWithState:&v98 objects:v126 count:16];
          }
          while (v43);
        }
      }
      v47 = [v3 objectForKeyedSubscript:@"xmlIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v48 = v47;
        uint64_t v49 = [v48 countByEnumeratingWithState:&v94 objects:v125 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v95;
          do
          {
            uint64_t v52 = 0;
            do
            {
              if (*(void *)v95 != v51) {
                objc_enumerationMutation(v48);
              }
              v53 = *(void **)(*((void *)&v94 + 1) + 8 * v52);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addXmlIndex:", objc_msgSend(v53, "unsignedIntValue"));
              }
              ++v52;
            }
            while (v50 != v52);
            uint64_t v50 = [v48 countByEnumeratingWithState:&v94 objects:v125 count:16];
          }
          while (v50);
        }
      }
      v54 = [v3 objectForKeyedSubscript:@"attributionIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id v55 = v54;
        uint64_t v56 = [v55 countByEnumeratingWithState:&v90 objects:v124 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = *(void *)v91;
          do
          {
            uint64_t v59 = 0;
            do
            {
              if (*(void *)v91 != v58) {
                objc_enumerationMutation(v55);
              }
              v60 = *(void **)(*((void *)&v90 + 1) + 8 * v59);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addAttributionIndex:", objc_msgSend(v60, "unsignedIntValue"));
              }
              ++v59;
            }
            while (v57 != v59);
            uint64_t v57 = [v55 countByEnumeratingWithState:&v90 objects:v124 count:16];
          }
          while (v57);
        }
      }
      v61 = [v3 objectForKeyedSubscript:@"hybridUnavailableRegion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        id v62 = v61;
        uint64_t v63 = [v62 countByEnumeratingWithState:&v86 objects:v123 count:16];
        if (v63)
        {
          uint64_t v64 = v63;
          uint64_t v65 = *(void *)v87;
          do
          {
            uint64_t v66 = 0;
            do
            {
              if (*(void *)v87 != v65) {
                objc_enumerationMutation(v62);
              }
              v67 = *(void **)(*((void *)&v86 + 1) + 8 * v66);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v84 = 0uLL;
                uint64_t v85 = 0;
                _GEOTileSetRegionFromDictionaryRepresentation(v67, &v84);
                long long v82 = v84;
                uint64_t v83 = v85;
                [a1 addHybridUnavailableRegion:&v82];
              }
              ++v66;
            }
            while (v64 != v66);
            uint64_t v64 = [v62 countByEnumeratingWithState:&v86 objects:v123 count:16];
          }
          while (v64);
        }
      }
      v68 = [v3 objectForKeyedSubscript:@"resourceIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v69 = v68;
        uint64_t v70 = [v69 countByEnumeratingWithState:&v78 objects:v122 count:16];
        if (v70)
        {
          uint64_t v71 = v70;
          uint64_t v72 = *(void *)v79;
          do
          {
            uint64_t v73 = 0;
            do
            {
              if (*(void *)v79 != v72) {
                objc_enumerationMutation(v69);
              }
              v74 = *(void **)(*((void *)&v78 + 1) + 8 * v73);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addResourceIndex:", objc_msgSend(v74, "unsignedIntValue", (void)v78));
              }
              ++v73;
            }
            while (v71 != v73);
            uint64_t v71 = [v69 countByEnumeratingWithState:&v78 objects:v122 count:16];
          }
          while (v71);
        }
      }
      v75 = [v3 objectForKeyedSubscript:@"muninVersionIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuninVersionIndex:", objc_msgSend(v75, "unsignedIntValue"));
      }

      v76 = [v3 objectForKeyedSubscript:@"offlineMetadataIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setOfflineMetadataIndex:", objc_msgSend(v76, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOTileGroup)initWithJSON:(id)a3
{
  return (GEOTileGroup *)-[GEOTileGroup _initWithDictionary:isJSON:](self, a3);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_1328;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1329;
    }
    GEOTileGroupReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTileGroupIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTileGroupReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3FF8) == 0))
  {
    id v20 = self->_reader;
    objc_sync_enter(v20);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v21 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v21];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v20);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTileGroup *)self readAll:0];
    PBDataWriterWriteUint32Field();
    if (self->_tileSetsCount)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        PBDataWriterPlaceMark();
        PBDataWriterWriteUint32Field();
        PBDataWriterWriteUint32Field();
        PBDataWriterRecallMark();
        ++v7;
        v6 += 8;
      }
      while (v7 < self->_tileSetsCount);
    }
    if (self->_styleSheetIndexs.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < self->_styleSheetIndexs.count);
    }
    if (self->_textureIndexs.count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v9 < self->_textureIndexs.count);
    }
    if (self->_fontIndexs.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v10;
      }
      while (v10 < self->_fontIndexs.count);
    }
    if (self->_iconIndexs.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v11;
      }
      while (v11 < self->_iconIndexs.count);
    }
    if (self->_regionalResourceIndexsCount)
    {
      uint64_t v12 = 0;
      unint64_t v13 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEORegionalResourceIndexWriteTo((uint64_t)&self->_regionalResourceIndexs[v12]);
        PBDataWriterRecallMark();
        ++v13;
        ++v12;
      }
      while (v13 < self->_regionalResourceIndexsCount);
    }
    if (self->_xmlIndexs.count)
    {
      unint64_t v14 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v14;
      }
      while (v14 < self->_xmlIndexs.count);
    }
    if (self->_attributionIndexs.count)
    {
      unint64_t v15 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v15;
      }
      while (v15 < self->_attributionIndexs.count);
    }
    if (self->_hybridUnavailableRegionsCount)
    {
      uint64_t v16 = 0;
      unint64_t v17 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v17;
        v16 += 24;
      }
      while (v17 < self->_hybridUnavailableRegionsCount);
    }
    if (self->_resourceIndexs.count)
    {
      unint64_t v18 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v18;
      }
      while (v18 < self->_resourceIndexs.count);
    }
    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (void)copyTo:(id)a3
{
  id v4 = (id *)a3;
  [(GEOTileGroup *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 66) = self->_readerMarkPos;
  *((_DWORD *)v4 + 67) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_DWORD *)v4 + 69) = self->_identifier;
  if ([(GEOTileGroup *)self tileSetsCount])
  {
    [v4 clearTileSets];
    unint64_t v5 = [(GEOTileGroup *)self tileSetsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v4, "addTileSet:", -[GEOTileGroup tileSetAtIndex:](self, "tileSetAtIndex:", i));
    }
  }
  if ([(GEOTileGroup *)self styleSheetIndexsCount])
  {
    [v4 clearStyleSheetIndexs];
    unint64_t v8 = [(GEOTileGroup *)self styleSheetIndexsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v4, "addStyleSheetIndex:", -[GEOTileGroup styleSheetIndexAtIndex:](self, "styleSheetIndexAtIndex:", j));
    }
  }
  if ([(GEOTileGroup *)self textureIndexsCount])
  {
    [v4 clearTextureIndexs];
    unint64_t v11 = [(GEOTileGroup *)self textureIndexsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        objc_msgSend(v4, "addTextureIndex:", -[GEOTileGroup textureIndexAtIndex:](self, "textureIndexAtIndex:", k));
    }
  }
  if ([(GEOTileGroup *)self fontIndexsCount])
  {
    [v4 clearFontIndexs];
    unint64_t v14 = [(GEOTileGroup *)self fontIndexsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        objc_msgSend(v4, "addFontIndex:", -[GEOTileGroup fontIndexAtIndex:](self, "fontIndexAtIndex:", m));
    }
  }
  if ([(GEOTileGroup *)self iconIndexsCount])
  {
    [v4 clearIconIndexs];
    unint64_t v17 = [(GEOTileGroup *)self iconIndexsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
        objc_msgSend(v4, "addIconIndex:", -[GEOTileGroup iconIndexAtIndex:](self, "iconIndexAtIndex:", n));
    }
  }
  if ([(GEOTileGroup *)self regionalResourceIndexsCount])
  {
    [v4 clearRegionalResourceIndexs];
    unint64_t v20 = [(GEOTileGroup *)self regionalResourceIndexsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (iuint64_t i = 0; ii != v21; ++ii)
      {
        uint64_t v23 = [(GEOTileGroup *)self regionalResourceIndexAtIndex:ii];
        objc_msgSend(v4, "addRegionalResourceIndex:", v23, v24);
      }
    }
  }
  if ([(GEOTileGroup *)self xmlIndexsCount])
  {
    [v4 clearXmlIndexs];
    unint64_t v25 = [(GEOTileGroup *)self xmlIndexsCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (juint64_t j = 0; jj != v26; ++jj)
        objc_msgSend(v4, "addXmlIndex:", -[GEOTileGroup xmlIndexAtIndex:](self, "xmlIndexAtIndex:", jj));
    }
  }
  if ([(GEOTileGroup *)self attributionIndexsCount])
  {
    [v4 clearAttributionIndexs];
    unint64_t v28 = [(GEOTileGroup *)self attributionIndexsCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (kuint64_t k = 0; kk != v29; ++kk)
        objc_msgSend(v4, "addAttributionIndex:", -[GEOTileGroup attributionIndexAtIndex:](self, "attributionIndexAtIndex:", kk));
    }
  }
  if ([(GEOTileGroup *)self hybridUnavailableRegionsCount])
  {
    [v4 clearHybridUnavailableRegions];
    unint64_t v31 = [(GEOTileGroup *)self hybridUnavailableRegionsCount];
    if (v31)
    {
      unint64_t v32 = v31;
      for (muint64_t m = 0; mm != v32; ++mm)
      {
        [(GEOTileGroup *)self hybridUnavailableRegionAtIndex:mm];
        [v4 addHybridUnavailableRegion:v38];
      }
    }
  }
  if ([(GEOTileGroup *)self resourceIndexsCount])
  {
    [v4 clearResourceIndexs];
    unint64_t v34 = [(GEOTileGroup *)self resourceIndexsCount];
    if (v34)
    {
      unint64_t v35 = v34;
      for (nuint64_t n = 0; nn != v35; ++nn)
        objc_msgSend(v4, "addResourceIndex:", -[GEOTileGroup resourceIndexAtIndex:](self, "resourceIndexAtIndex:", nn));
    }
  }
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *((_DWORD *)v4 + 70) = self->_muninVersionIndex;
    *((_WORD *)v4 + 144) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 71) = self->_offlineMetadataIndex;
    *((_WORD *)v4 + 144) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v6 = reader;
    objc_sync_enter(v6);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTileGroupReadAllFrom(v4, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v7 = (id)v4;
      objc_sync_exit(v6);

      goto LABEL_16;
    }
    objc_sync_exit(v6);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTileGroup *)self readAll:0];
  *(_DWORD *)(v4 + 276) = self->_identifier;
  unint64_t tileSetsCount = self->_tileSetsCount;
  if (tileSetsCount)
  {
    -[GEOTileGroup _reserveTileSets:](v4, tileSetsCount);
    memcpy(*(void **)(v4 + 216), self->_tileSets, 8 * self->_tileSetsCount);
    *(void *)(v4 + 224) = self->_tileSetsCount;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  unint64_t regionalResourceIndexsCount = self->_regionalResourceIndexsCount;
  if (regionalResourceIndexsCount)
  {
    -[GEOTileGroup _reserveRegionalResourceIndexs:](v4, regionalResourceIndexsCount);
    memcpy(*(void **)(v4 + 120), self->_regionalResourceIndexs, 16 * self->_regionalResourceIndexsCount);
    *(void *)(v4 + 128) = self->_regionalResourceIndexsCount;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  unint64_t hybridUnavailableRegionsCount = self->_hybridUnavailableRegionsCount;
  if (hybridUnavailableRegionsCount)
  {
    -[GEOTileGroup _reserveHybridUnavailableRegions:](v4, hybridUnavailableRegionsCount);
    memcpy(*(void **)(v4 + 72), self->_hybridUnavailableRegions, 24 * self->_hybridUnavailableRegionsCount);
    *(void *)(v4 + 80) = self->_hybridUnavailableRegionsCount;
  }
  PBRepeatedUInt32Copy();
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v4 + 280) = self->_muninVersionIndex;
    *(_WORD *)(v4 + 288) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 284) = self->_offlineMetadataIndex;
    *(_WORD *)(v4 + 288) |= 2u;
  }
  unint64_t v12 = self->_unknownFields;
  id v7 = *(id *)(v4 + 16);
  *(void *)(v4 + 16) = v12;
LABEL_16:

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  [(GEOTileGroup *)self readAll:1];
  [v4 readAll:1];
  if (self->_identifier != *((_DWORD *)v4 + 69)) {
    goto LABEL_26;
  }
  unint64_t tileSetsCount = self->_tileSetsCount;
  if ((const void *)tileSetsCount != v4[28]) {
    goto LABEL_26;
  }
  if (memcmp(self->_tileSets, v4[27], 8 * tileSetsCount)) {
    goto LABEL_26;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_26;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_26;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_26;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_26;
  }
  unint64_t regionalResourceIndexsCount = self->_regionalResourceIndexsCount;
  if ((const void *)regionalResourceIndexsCount != v4[16]) {
    goto LABEL_26;
  }
  if (memcmp(self->_regionalResourceIndexs, v4[15], 16 * regionalResourceIndexsCount)) {
    goto LABEL_26;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_26;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_26;
  }
  unint64_t hybridUnavailableRegionsCount = self->_hybridUnavailableRegionsCount;
  if ((const void *)hybridUnavailableRegionsCount != v4[10]
    || memcmp(self->_hybridUnavailableRegions, v4[9], 24 * hybridUnavailableRegionsCount)
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_26;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 144);
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_muninVersionIndex != *((_DWORD *)v4 + 70)) {
      goto LABEL_26;
    }
  }
  else if (v9)
  {
LABEL_26:
    BOOL v10 = 0;
    goto LABEL_27;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_offlineMetadataIndex != *((_DWORD *)v4 + 71)) {
      goto LABEL_26;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = (v9 & 2) == 0;
  }
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  [(GEOTileGroup *)self readAll:1];
  unsigned int identifier = self->_identifier;
  uint64_t v16 = PBHashBytes();
  uint64_t v3 = PBRepeatedUInt32Hash();
  uint64_t v4 = PBRepeatedUInt32Hash();
  uint64_t v5 = PBRepeatedUInt32Hash();
  uint64_t v6 = PBRepeatedUInt32Hash();
  uint64_t v7 = PBHashBytes();
  uint64_t v8 = PBRepeatedUInt32Hash();
  uint64_t v9 = PBRepeatedUInt32Hash();
  uint64_t v10 = PBHashBytes();
  uint64_t v11 = PBRepeatedUInt32Hash();
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    uint64_t v13 = 2654435761 * self->_muninVersionIndex;
  }
  else {
    uint64_t v13 = 0;
  }
  if ((flags & 2) != 0) {
    uint64_t v14 = 2654435761 * self->_offlineMetadataIndex;
  }
  else {
    uint64_t v14 = 0;
  }
  return v16 ^ v3 ^ v4 ^ (2654435761 * identifier) ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  [v4 readAll:0];
  self->_unsigned int identifier = v4[69];
  uint64_t v5 = [v4 tileSetsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEOTileGroup addTileSet:](self, "addTileSet:", [v4 tileSetAtIndex:i]);
  }
  uint64_t v8 = [v4 styleSheetIndexsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[GEOTileGroup addStyleSheetIndex:](self, "addStyleSheetIndex:", [v4 styleSheetIndexAtIndex:j]);
  }
  uint64_t v11 = [v4 textureIndexsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[GEOTileGroup addTextureIndex:](self, "addTextureIndex:", [v4 textureIndexAtIndex:k]);
  }
  uint64_t v14 = [v4 fontIndexsCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t m = 0; m != v15; ++m)
      -[GEOTileGroup addFontIndex:](self, "addFontIndex:", [v4 fontIndexAtIndex:m]);
  }
  uint64_t v17 = [v4 iconIndexsCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t n = 0; n != v18; ++n)
      -[GEOTileGroup addIconIndex:](self, "addIconIndex:", [v4 iconIndexAtIndex:n]);
  }
  uint64_t v20 = [v4 regionalResourceIndexsCount];
  if (v20)
  {
    uint64_t v21 = v20;
    for (iuint64_t i = 0; ii != v21; ++ii)
    {
      uint64_t v23 = [v4 regionalResourceIndexAtIndex:ii];
      -[GEOTileGroup addRegionalResourceIndex:](self, "addRegionalResourceIndex:", v23, v24);
    }
  }
  uint64_t v25 = [v4 xmlIndexsCount];
  if (v25)
  {
    uint64_t v26 = v25;
    for (juint64_t j = 0; jj != v26; ++jj)
      -[GEOTileGroup addXmlIndex:](self, "addXmlIndex:", [v4 xmlIndexAtIndex:jj]);
  }
  uint64_t v28 = [v4 attributionIndexsCount];
  if (v28)
  {
    uint64_t v29 = v28;
    for (kuint64_t k = 0; kk != v29; ++kk)
      -[GEOTileGroup addAttributionIndex:](self, "addAttributionIndex:", [v4 attributionIndexAtIndex:kk]);
  }
  uint64_t v31 = [v4 hybridUnavailableRegionsCount];
  if (v31)
  {
    uint64_t v32 = v31;
    for (muint64_t m = 0; mm != v32; ++mm)
    {
      if (v4) {
        [v4 hybridUnavailableRegionAtIndex:mm];
      }
      else {
        memset(v38, 0, sizeof(v38));
      }
      [(GEOTileGroup *)self addHybridUnavailableRegion:v38];
    }
  }
  uint64_t v34 = [v4 resourceIndexsCount];
  if (v34)
  {
    uint64_t v35 = v34;
    for (nuint64_t n = 0; nn != v35; ++nn)
      -[GEOTileGroup addResourceIndex:](self, "addResourceIndex:", [v4 resourceIndexAtIndex:nn]);
  }
  __int16 v37 = *((_WORD *)v4 + 144);
  if (v37)
  {
    self->_muninVersionIndex = v4[70];
    *(_WORD *)&self->_flags |= 1u;
    __int16 v37 = *((_WORD *)v4 + 144);
  }
  if ((v37 & 2) != 0)
  {
    self->_offlineMetadataIndex = v4[71];
    *(_WORD *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTileGroupReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_1333);
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
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2004u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTileGroup *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end