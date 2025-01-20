@interface GEORegionalResourceRegion
+ (BOOL)isValid:(id)a3;
+ (Class)attributionType;
+ (Class)iconChecksumType;
+ (Class)iconType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORegionalResourceRegion)init;
- (GEORegionalResourceRegion)initWithData:(id)a3;
- (GEORegionalResourceRegion)initWithDictionary:(id)a3;
- (GEORegionalResourceRegion)initWithJSON:(id)a3;
- (GEOTileSetRegion)tileRangeAtIndex:(SEL)a3;
- (GEOTileSetRegion)tileRanges;
- (NSMutableArray)attributions;
- (NSMutableArray)iconChecksums;
- (NSMutableArray)icons;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)attributionAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)iconAtIndex:(unint64_t)a3;
- (id)iconChecksumAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (uint64_t)_reserveTileRanges:(uint64_t)a1;
- (unint64_t)attributionsCount;
- (unint64_t)hash;
- (unint64_t)iconChecksumsCount;
- (unint64_t)iconsCount;
- (unint64_t)tileRangesCount;
- (void)_addNoFlagsAttribution:(uint64_t)a1;
- (void)_addNoFlagsIcon:(uint64_t)a1;
- (void)_addNoFlagsIconChecksum:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAttributions;
- (void)_readIconChecksums;
- (void)_readIcons;
- (void)_readTileRanges;
- (void)addAttribution:(id)a3;
- (void)addIcon:(id)a3;
- (void)addIconChecksum:(id)a3;
- (void)addTileRange:(GEOTileSetRegion *)a3;
- (void)clearAttributions;
- (void)clearIconChecksums;
- (void)clearIcons;
- (void)clearTileRanges;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAttributions:(id)a3;
- (void)setIconChecksums:(id)a3;
- (void)setIcons:(id)a3;
- (void)setTileRanges:(GEOTileSetRegion *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEORegionalResourceRegion

- (GEORegionalResourceRegion)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORegionalResourceRegion;
  v2 = [(GEORegionalResourceRegion *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORegionalResourceRegion)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORegionalResourceRegion;
  v3 = [(GEORegionalResourceRegion *)&v7 initWithData:a3];
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
  [(GEORegionalResourceRegion *)self clearTileRanges];
  v3.receiver = self;
  v3.super_class = (Class)GEORegionalResourceRegion;
  [(GEORegionalResourceRegion *)&v3 dealloc];
}

- (void)_readTileRanges
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORegionalResourceRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileRanges_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)tileRangesCount
{
  return self->_tileRangesCount;
}

- (GEOTileSetRegion)tileRanges
{
  return self->_tileRanges;
}

- (uint64_t)_reserveTileRanges:(uint64_t)a1
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
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 24 * v9, 0x416C091FuLL);
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

- (void)clearTileRanges
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_tileRangesSpace = 0;
  self->_tileRangesCount = 0;
  free(self->_tileRanges);
  self->_tileRanges = 0;
}

- (void)addTileRange:(GEOTileSetRegion *)a3
{
  -[GEORegionalResourceRegion _readTileRanges]((uint64_t)self);
  GEOTileSetRegion v5 = *a3;
  if (self && -[GEORegionalResourceRegion _reserveTileRanges:]((uint64_t)self, 1uLL)) {
    self->_tileRanges[self->_tileRangesCount++] = v5;
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (GEOTileSetRegion)tileRangeAtIndex:(SEL)a3
{
  -[GEORegionalResourceRegion _readTileRanges]((uint64_t)self);
  unint64_t tileRangesCount = self->_tileRangesCount;
  if (tileRangesCount <= a4)
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C4A8];
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a4, tileRangesCount);
    v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];
    [v12 raise];
  }
  v13 = &self->_tileRanges[a4];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(void *)&retstr->var4 = *(void *)&v13->var4;
  return result;
}

- (void)setTileRanges:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  [(GEORegionalResourceRegion *)self clearTileRanges];
  if (-[GEORegionalResourceRegion _reserveTileRanges:]((uint64_t)self, a4))
  {
    memcpy(self->_tileRanges, a3, 24 * a4);
    self->_unint64_t tileRangesCount = a4;
  }
}

- (void)_readIcons
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORegionalResourceRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIcons_tags_1234);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)icons
{
  -[GEORegionalResourceRegion _readIcons]((uint64_t)self);
  icons = self->_icons;

  return icons;
}

- (void)setIcons:(id)a3
{
  unint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  icons = self->_icons;
  self->_icons = v4;
}

- (void)clearIcons
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  icons = self->_icons;

  [(NSMutableArray *)icons removeAllObjects];
}

- (void)addIcon:(id)a3
{
  id v4 = a3;
  -[GEORegionalResourceRegion _readIcons]((uint64_t)self);
  -[GEORegionalResourceRegion _addNoFlagsIcon:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsIcon:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)iconsCount
{
  -[GEORegionalResourceRegion _readIcons]((uint64_t)self);
  icons = self->_icons;

  return [(NSMutableArray *)icons count];
}

- (id)iconAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceRegion _readIcons]((uint64_t)self);
  icons = self->_icons;

  return (id)[(NSMutableArray *)icons objectAtIndex:a3];
}

+ (Class)iconType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORegionalResourceRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributions_tags_1235);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)attributions
{
  -[GEORegionalResourceRegion _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return attributions;
}

- (void)setAttributions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  attributions = self->_attributions;
  self->_attributions = v4;
}

- (void)clearAttributions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  attributions = self->_attributions;

  [(NSMutableArray *)attributions removeAllObjects];
}

- (void)addAttribution:(id)a3
{
  id v4 = a3;
  -[GEORegionalResourceRegion _readAttributions]((uint64_t)self);
  -[GEORegionalResourceRegion _addNoFlagsAttribution:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsAttribution:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)attributionsCount
{
  -[GEORegionalResourceRegion _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return [(NSMutableArray *)attributions count];
}

- (id)attributionAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceRegion _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return (id)[(NSMutableArray *)attributions objectAtIndex:a3];
}

+ (Class)attributionType
{
  return (Class)objc_opt_class();
}

- (void)_readIconChecksums
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORegionalResourceRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIconChecksums_tags_1236);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)iconChecksums
{
  -[GEORegionalResourceRegion _readIconChecksums]((uint64_t)self);
  iconChecksums = self->_iconChecksums;

  return iconChecksums;
}

- (void)setIconChecksums:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  iconChecksums = self->_iconChecksums;
  self->_iconChecksums = v4;
}

- (void)clearIconChecksums
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  iconChecksums = self->_iconChecksums;

  [(NSMutableArray *)iconChecksums removeAllObjects];
}

- (void)addIconChecksum:(id)a3
{
  id v4 = a3;
  -[GEORegionalResourceRegion _readIconChecksums]((uint64_t)self);
  -[GEORegionalResourceRegion _addNoFlagsIconChecksum:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsIconChecksum:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)iconChecksumsCount
{
  -[GEORegionalResourceRegion _readIconChecksums]((uint64_t)self);
  iconChecksums = self->_iconChecksums;

  return [(NSMutableArray *)iconChecksums count];
}

- (id)iconChecksumAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceRegion _readIconChecksums]((uint64_t)self);
  iconChecksums = self->_iconChecksums;

  return (id)[(NSMutableArray *)iconChecksums objectAtIndex:a3];
}

+ (Class)iconChecksumType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORegionalResourceRegion;
  id v4 = [(GEORegionalResourceRegion *)&v8 description];
  id v5 = [(GEORegionalResourceRegion *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORegionalResourceRegion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 32))
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
      if (*(void *)(a1 + 32))
      {
        uint64_t v6 = 0;
        unint64_t v7 = 0;
        do
        {
          objc_super v8 = _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 24) + v6));
          [v5 addObject:v8];

          ++v7;
          v6 += 24;
        }
        while (v7 < *(void *)(a1 + 32));
      }
      [v4 setObject:v5 forKey:@"tileRange"];
    }
    if (*(void *)(a1 + 64))
    {
      unint64_t v9 = [(id)a1 icons];
      [v4 setObject:v9 forKey:@"icon"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v11 = *(id *)(a1 + 48);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            v17 = [v16 dictionaryRepresentation];
            }
            [v10 addObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v13);
      }

      [v4 setObject:v10 forKey:@"attribution"];
    }
    if (*(void *)(a1 + 56))
    {
      v18 = [(id)a1 iconChecksums];
      [v4 setObject:v18 forKey:@"iconChecksum"];
    }
    v19 = *(void **)(a1 + 16);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __55__GEORegionalResourceRegion__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORegionalResourceRegion _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEORegionalResourceRegion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORegionalResourceRegion)initWithDictionary:(id)a3
{
  return (GEORegionalResourceRegion *)-[GEORegionalResourceRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      uint64_t v6 = [v5 objectForKeyedSubscript:@"tileRange"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v56 objects:v63 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v57;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v57 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v54 = 0uLL;
                uint64_t v55 = 0;
                _GEOTileSetRegionFromDictionaryRepresentation(v12, &v54);
                long long v52 = v54;
                uint64_t v53 = v55;
                [a1 addTileRange:&v52];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v56 objects:v63 count:16];
          }
          while (v9);
        }
      }
      uint64_t v13 = [v5 objectForKeyedSubscript:@"icon"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v62 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v49;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v49 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v48 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v20 = (void *)[v19 copy];
                [a1 addIcon:v20];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v62 count:16];
          }
          while (v16);
        }
      }
      v21 = [v5 objectForKeyedSubscript:@"attribution"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v44 objects:v61 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v45;
          do
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v45 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v44 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v28 = [GEOAttribution alloc];
                if (a3) {
                  uint64_t v29 = [(GEOAttribution *)v28 initWithJSON:v27];
                }
                else {
                  uint64_t v29 = [(GEOAttribution *)v28 initWithDictionary:v27];
                }
                long long v30 = (void *)v29;
                [a1 addAttribution:v29];
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v44 objects:v61 count:16];
          }
          while (v24);
        }
      }
      long long v31 = [v5 objectForKeyedSubscript:@"iconChecksum"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v32 = v31;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v40 objects:v60 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v41;
          do
          {
            for (uint64_t m = 0; m != v34; ++m)
            {
              if (*(void *)v41 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = *(void **)(*((void *)&v40 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v38 = (void *)[v37 copy];
                [a1 addIconChecksum:v38];
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v40 objects:v60 count:16];
          }
          while (v34);
        }
      }
    }
  }

  return a1;
}

- (GEORegionalResourceRegion)initWithJSON:(id)a3
{
  return (GEORegionalResourceRegion *)-[GEORegionalResourceRegion _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_1240;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1241;
    }
    GEORegionalResourceRegionReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORegionalResourceRegionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORegionalResourceRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORegionalResourceRegionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
  {
    v20 = self->_reader;
    objc_sync_enter(v20);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v21 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v21];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v20);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORegionalResourceRegion *)self readAll:0];
    if (self->_tileRangesCount)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        uint64_t v34 = 0;
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v7;
        v6 += 24;
      }
      while (v7 < self->_tileRangesCount);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v8 = self->_icons;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v30 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v8);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v30 objects:v37 count:16];
      }
      while (v9);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v12 = self->_attributions;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v12);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v13);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v16 = self->_iconChecksums;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t k = 0; k != v17; ++k)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v16);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v35 count:16];
      }
      while (v17);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v22);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = (id *)a3;
  [(GEORegionalResourceRegion *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 18) = self->_readerMarkPos;
  *((_DWORD *)v4 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORegionalResourceRegion *)self tileRangesCount])
  {
    [v4 clearTileRanges];
    unint64_t v5 = [(GEORegionalResourceRegion *)self tileRangesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        [(GEORegionalResourceRegion *)self tileRangeAtIndex:i];
        [v4 addTileRange:v20];
      }
    }
  }
  if ([(GEORegionalResourceRegion *)self iconsCount])
  {
    [v4 clearIcons];
    unint64_t v8 = [(GEORegionalResourceRegion *)self iconsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        id v11 = [(GEORegionalResourceRegion *)self iconAtIndex:j];
        [v4 addIcon:v11];
      }
    }
  }
  if ([(GEORegionalResourceRegion *)self attributionsCount])
  {
    [v4 clearAttributions];
    unint64_t v12 = [(GEORegionalResourceRegion *)self attributionsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEORegionalResourceRegion *)self attributionAtIndex:k];
        [v4 addAttribution:v15];
      }
    }
  }
  if ([(GEORegionalResourceRegion *)self iconChecksumsCount])
  {
    [v4 clearIconChecksums];
    unint64_t v16 = [(GEORegionalResourceRegion *)self iconChecksumsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        v19 = [(GEORegionalResourceRegion *)self iconChecksumAtIndex:m];
        [v4 addIconChecksum:v19];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORegionalResourceRegionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORegionalResourceRegion *)self readAll:0];
  unint64_t tileRangesCount = self->_tileRangesCount;
  if (tileRangesCount)
  {
    -[GEORegionalResourceRegion _reserveTileRanges:](v5, tileRangesCount);
    memcpy(*(void **)(v5 + 24), self->_tileRanges, 24 * self->_tileRangesCount);
    *(void *)(v5 + 32) = self->_tileRangesCount;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  unint64_t v9 = self->_icons;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addIcon:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v10);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v14 = self->_attributions;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addAttribution:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v15);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v19 = self->_iconChecksums;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * k), "copyWithZone:", a3, (void)v25);
        [(id)v5 addIconChecksum:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v20);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEORegionalResourceRegion *)self readAll:1],
        [v4 readAll:1],
        unint64_t tileRangesCount = self->_tileRangesCount,
        tileRangesCount == *((void *)v4 + 4))
    && !memcmp(self->_tileRanges, *((const void **)v4 + 3), 24 * tileRangesCount)
    && ((icons = self->_icons, !((unint64_t)icons | *((void *)v4 + 8)))
     || -[NSMutableArray isEqual:](icons, "isEqual:"))
    && ((attributions = self->_attributions, !((unint64_t)attributions | *((void *)v4 + 6)))
     || -[NSMutableArray isEqual:](attributions, "isEqual:")))
  {
    iconChecksums = self->_iconChecksums;
    if ((unint64_t)iconChecksums | *((void *)v4 + 7)) {
      char v6 = -[NSMutableArray isEqual:](iconChecksums, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  [(GEORegionalResourceRegion *)self readAll:1];
  uint64_t v3 = PBHashBytes();
  uint64_t v4 = [(NSMutableArray *)self->_icons hash];
  uint64_t v5 = v4 ^ [(NSMutableArray *)self->_attributions hash];
  return v5 ^ [(NSMutableArray *)self->_iconChecksums hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 tileRangesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (v4) {
        [v4 tileRangeAtIndex:i];
      }
      else {
        memset(v35, 0, sizeof(v35));
      }
      [(GEORegionalResourceRegion *)self addTileRange:v35];
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v4[8];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        [(GEORegionalResourceRegion *)self addIcon:*(void *)(*((void *)&v31 + 1) + 8 * j)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v4[6];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        [(GEORegionalResourceRegion *)self addAttribution:*(void *)(*((void *)&v27 + 1) + 8 * k)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v15);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = v4[7];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t m = 0; m != v20; ++m)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        -[GEORegionalResourceRegion addIconChecksum:](self, "addIconChecksum:", *(void *)(*((void *)&v23 + 1) + 8 * m), (void)v23);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v36 count:16];
    }
    while (v20);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORegionalResourceRegionReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_1245);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORegionalResourceRegion *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v7 = self->_attributions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_iconChecksums, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end