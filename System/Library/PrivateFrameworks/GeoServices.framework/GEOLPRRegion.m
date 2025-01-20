@interface GEOLPRRegion
+ (BOOL)isValid:(id)a3;
+ (Class)displayNameType;
+ (Class)subRegionsType;
- (BOOL)hasInfo;
- (BOOL)hasRegionBoundingBox;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRBoundingBoxE7)regionBoundingBox;
- (GEOLPRRegion)init;
- (GEOLPRRegion)initWithData:(id)a3;
- (GEOLPRRegion)initWithDictionary:(id)a3;
- (GEOLPRRegion)initWithJSON:(id)a3;
- (GEOLPRRegionInfo)info;
- (NSMutableArray)displayNames;
- (NSMutableArray)subRegions;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayNameAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)subRegionsAtIndex:(unint64_t)a3;
- (unint64_t)displayNamesCount;
- (unint64_t)hash;
- (unint64_t)subRegionsCount;
- (void)_addNoFlagsDisplayName:(uint64_t)a1;
- (void)_addNoFlagsSubRegions:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDisplayNames;
- (void)_readInfo;
- (void)_readRegionBoundingBox;
- (void)_readSubRegions;
- (void)addDisplayName:(id)a3;
- (void)addSubRegions:(id)a3;
- (void)clearDisplayNames;
- (void)clearSubRegions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDisplayNames:(id)a3;
- (void)setInfo:(id)a3;
- (void)setRegionBoundingBox:(id)a3;
- (void)setSubRegions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRRegion

- (GEOLPRRegion)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRRegion;
  v2 = [(GEOLPRRegion *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRRegion)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRRegion;
  v3 = [(GEOLPRRegion *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)displayNames
{
  -[GEOLPRRegion _readDisplayNames]((uint64_t)self);
  displayNames = self->_displayNames;

  return displayNames;
}

- (void)setDisplayNames:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  displayNames = self->_displayNames;
  self->_displayNames = v4;
}

- (void)clearDisplayNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  displayNames = self->_displayNames;

  [(NSMutableArray *)displayNames removeAllObjects];
}

- (void)addDisplayName:(id)a3
{
  id v4 = a3;
  -[GEOLPRRegion _readDisplayNames]((uint64_t)self);
  -[GEOLPRRegion _addNoFlagsDisplayName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsDisplayName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)displayNamesCount
{
  -[GEOLPRRegion _readDisplayNames]((uint64_t)self);
  displayNames = self->_displayNames;

  return [(NSMutableArray *)displayNames count];
}

- (id)displayNameAtIndex:(unint64_t)a3
{
  -[GEOLPRRegion _readDisplayNames]((uint64_t)self);
  displayNames = self->_displayNames;

  return (id)[(NSMutableArray *)displayNames objectAtIndex:a3];
}

+ (Class)displayNameType
{
  return (Class)objc_opt_class();
}

- (void)_readSubRegions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubRegions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)subRegions
{
  -[GEOLPRRegion _readSubRegions]((uint64_t)self);
  subRegions = self->_subRegions;

  return subRegions;
}

- (void)setSubRegions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  subRegions = self->_subRegions;
  self->_subRegions = v4;
}

- (void)clearSubRegions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  subRegions = self->_subRegions;

  [(NSMutableArray *)subRegions removeAllObjects];
}

- (void)addSubRegions:(id)a3
{
  id v4 = a3;
  -[GEOLPRRegion _readSubRegions]((uint64_t)self);
  -[GEOLPRRegion _addNoFlagsSubRegions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsSubRegions:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)subRegionsCount
{
  -[GEOLPRRegion _readSubRegions]((uint64_t)self);
  subRegions = self->_subRegions;

  return [(NSMutableArray *)subRegions count];
}

- (id)subRegionsAtIndex:(unint64_t)a3
{
  -[GEOLPRRegion _readSubRegions]((uint64_t)self);
  subRegions = self->_subRegions;

  return (id)[(NSMutableArray *)subRegions objectAtIndex:a3];
}

+ (Class)subRegionsType
{
  return (Class)objc_opt_class();
}

- (void)_readInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInfo_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasInfo
{
  return self->_info != 0;
}

- (GEOLPRRegionInfo)info
{
  -[GEOLPRRegion _readInfo]((uint64_t)self);
  info = self->_info;

  return info;
}

- (void)setInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_info, a3);
}

- (void)_readRegionBoundingBox
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegionBoundingBox_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRegionBoundingBox
{
  return self->_regionBoundingBox != 0;
}

- (GEOLPRBoundingBoxE7)regionBoundingBox
{
  -[GEOLPRRegion _readRegionBoundingBox]((uint64_t)self);
  regionBoundingBox = self->_regionBoundingBox;

  return regionBoundingBox;
}

- (void)setRegionBoundingBox:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_regionBoundingBox, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRRegion;
  id v4 = [(GEOLPRRegion *)&v8 description];
  id v5 = [(GEOLPRRegion *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRRegion _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[2] count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v6 = a1[2];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v36 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"displayName";
      }
      else {
        v13 = @"display_name";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([a1[5] count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[5], "count"));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v15 = a1[5];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v32 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v31 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = objc_msgSend(v20, "dictionaryRepresentation", (void)v31);
            }
            objc_msgSend(v14, "addObject:", v21, (void)v31);
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"subRegions";
      }
      else {
        v22 = @"sub_regions";
      }
      objc_msgSend(v4, "setObject:forKey:", v14, v22, (void)v31);
    }
    v23 = [a1 info];
    v24 = v23;
    if (v23)
    {
      if (a2) {
        [v23 jsonRepresentation];
      }
      else {
      v25 = [v23 dictionaryRepresentation];
      }
      [v4 setObject:v25 forKey:@"info"];
    }
    v26 = [a1 regionBoundingBox];
    v27 = v26;
    if (v26)
    {
      if (a2)
      {
        v28 = [v26 jsonRepresentation];
        v29 = @"regionBoundingBox";
      }
      else
      {
        v28 = [v26 dictionaryRepresentation];
        v29 = @"region_bounding_box";
      }
      [v4 setObject:v28 forKey:v29];
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
  return -[GEOLPRRegion _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLPRRegion)initWithDictionary:(id)a3
{
  return (GEOLPRRegion *)-[GEOLPRRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"displayName";
      }
      else {
        id v6 = @"display_name";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v38 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v44 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOLocalizedString alloc];
                if (a3) {
                  uint64_t v15 = [(GEOLocalizedString *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOLocalizedString *)v14 initWithDictionary:v13];
                }
                uint64_t v16 = (void *)v15;
                [a1 addDisplayName:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }
          while (v10);
        }

        id v5 = v38;
      }

      if (a3) {
        uint64_t v17 = @"subRegions";
      }
      else {
        uint64_t v17 = @"sub_regions";
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v40;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v40 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v25 = [GEOLPRRegion alloc];
                if (a3) {
                  uint64_t v26 = [(GEOLPRRegion *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEOLPRRegion *)v25 initWithDictionary:v24];
                }
                v27 = (void *)v26;
                [a1 addSubRegions:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v21);
        }

        id v5 = v38;
      }

      v28 = [v5 objectForKeyedSubscript:@"info"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v29 = [GEOLPRRegionInfo alloc];
        if (a3) {
          uint64_t v30 = [(GEOLPRRegionInfo *)v29 initWithJSON:v28];
        }
        else {
          uint64_t v30 = [(GEOLPRRegionInfo *)v29 initWithDictionary:v28];
        }
        long long v31 = (void *)v30;
        [a1 setInfo:v30];
      }
      if (a3) {
        long long v32 = @"regionBoundingBox";
      }
      else {
        long long v32 = @"region_bounding_box";
      }
      long long v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v34 = [GEOLPRBoundingBoxE7 alloc];
        if (a3) {
          uint64_t v35 = [(GEOLPRBoundingBoxE7 *)v34 initWithJSON:v33];
        }
        else {
          uint64_t v35 = [(GEOLPRBoundingBoxE7 *)v34 initWithDictionary:v33];
        }
        long long v36 = (void *)v35;
        [a1 setRegionBoundingBox:v35];
      }
    }
  }

  return a1;
}

- (GEOLPRRegion)initWithJSON:(id)a3
{
  return (GEOLPRRegion *)-[GEOLPRRegion _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_308;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_309;
    }
    GEOLPRRegionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRRegionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRRegionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRRegionIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRRegion *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_displayNames;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_subRegions;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (self->_info) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_regionBoundingBox) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v13 = (id *)a3;
  [(GEOLPRRegion *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 12) = self->_readerMarkPos;
  *((_DWORD *)v13 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLPRRegion *)self displayNamesCount])
  {
    [v13 clearDisplayNames];
    unint64_t v4 = [(GEOLPRRegion *)self displayNamesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLPRRegion *)self displayNameAtIndex:i];
        [v13 addDisplayName:v7];
      }
    }
  }
  if ([(GEOLPRRegion *)self subRegionsCount])
  {
    [v13 clearSubRegions];
    unint64_t v8 = [(GEOLPRRegion *)self subRegionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOLPRRegion *)self subRegionsAtIndex:j];
        [v13 addSubRegions:v11];
      }
    }
  }
  if (self->_info) {
    objc_msgSend(v13, "setInfo:");
  }
  uint64_t v12 = v13;
  if (self->_regionBoundingBox)
  {
    objc_msgSend(v13, "setRegionBoundingBox:");
    uint64_t v12 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLPRRegionReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRRegion *)self readAll:0];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unint64_t v8 = self->_displayNames;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        [v5 addDisplayName:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = self->_subRegions;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (void)v23);
        [v5 addSubRegions:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v14);
  }

  id v18 = [(GEOLPRRegionInfo *)self->_info copyWithZone:a3];
  long long v19 = (void *)v5[3];
  v5[3] = v18;

  id v20 = [(GEOLPRBoundingBoxE7 *)self->_regionBoundingBox copyWithZone:a3];
  long long v21 = (void *)v5[4];
  v5[4] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLPRRegion *)self readAll:1],
         [v4 readAll:1],
         displayNames = self->_displayNames,
         !((unint64_t)displayNames | v4[2]))
     || -[NSMutableArray isEqual:](displayNames, "isEqual:"))
    && ((subRegions = self->_subRegions, !((unint64_t)subRegions | v4[5]))
     || -[NSMutableArray isEqual:](subRegions, "isEqual:"))
    && ((info = self->_info, !((unint64_t)info | v4[3])) || -[GEOLPRRegionInfo isEqual:](info, "isEqual:")))
  {
    regionBoundingBox = self->_regionBoundingBox;
    if ((unint64_t)regionBoundingBox | v4[4]) {
      char v9 = -[GEOLPRBoundingBoxE7 isEqual:](regionBoundingBox, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEOLPRRegion *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_displayNames hash];
  uint64_t v4 = [(NSMutableArray *)self->_subRegions hash] ^ v3;
  unint64_t v5 = [(GEOLPRRegionInfo *)self->_info hash];
  return v4 ^ v5 ^ [(GEOLPRBoundingBoxE7 *)self->_regionBoundingBox hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOLPRRegion *)self addDisplayName:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v4[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOLPRRegion addSubRegions:](self, "addSubRegions:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v12);
  }

  info = self->_info;
  id v16 = v4[3];
  if (info)
  {
    if (v16) {
      -[GEOLPRRegionInfo mergeFrom:](info, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEOLPRRegion setInfo:](self, "setInfo:");
  }
  regionBoundingBox = self->_regionBoundingBox;
  id v18 = v4[4];
  if (regionBoundingBox)
  {
    if (v18) {
      -[GEOLPRBoundingBoxE7 mergeFrom:](regionBoundingBox, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[GEOLPRRegion setRegionBoundingBox:](self, "setRegionBoundingBox:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subRegions, 0);
  objc_storeStrong((id *)&self->_regionBoundingBox, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_displayNames, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end