@interface GEOLPRLicensePlateRegion
+ (BOOL)isValid:(id)a3;
+ (Class)licensePlateInfoType;
+ (Class)regionType;
- (BOOL)hasMapRegion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRLicensePlateRegion)init;
- (GEOLPRLicensePlateRegion)initWithData:(id)a3;
- (GEOLPRLicensePlateRegion)initWithDictionary:(id)a3;
- (GEOLPRLicensePlateRegion)initWithJSON:(id)a3;
- (GEOMapRegionE7)mapRegion;
- (NSMutableArray)licensePlateInfos;
- (NSMutableArray)regions;
- (NSString)identifier;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)licensePlateInfoAtIndex:(unint64_t)a3;
- (id)regionAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)licensePlateInfosCount;
- (unint64_t)regionsCount;
- (void)_addNoFlagsLicensePlateInfo:(uint64_t)a1;
- (void)_addNoFlagsRegion:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLicensePlateInfos;
- (void)_readMapRegion;
- (void)_readRegions;
- (void)addLicensePlateInfo:(id)a3;
- (void)addRegion:(id)a3;
- (void)clearLicensePlateInfos;
- (void)clearRegions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLicensePlateInfos:(id)a3;
- (void)setMapRegion:(id)a3;
- (void)setRegions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRLicensePlateRegion

- (GEOLPRLicensePlateRegion)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLicensePlateRegion;
  v2 = [(GEOLPRLicensePlateRegion *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLicensePlateRegion)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLicensePlateRegion;
  v3 = [(GEOLPRLicensePlateRegion *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (NSString)identifier
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 1) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOLPRLicensePlateRegionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readIdentifier_tags_0);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  identifier = self->_identifier;

  return identifier;
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)_readMapRegion
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
        GEOLPRLicensePlateRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (GEOMapRegionE7)mapRegion
{
  -[GEOLPRLicensePlateRegion _readMapRegion]((uint64_t)self);
  mapRegion = self->_mapRegion;

  return mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readLicensePlateInfos
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
        GEOLPRLicensePlateRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLicensePlateInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)licensePlateInfos
{
  -[GEOLPRLicensePlateRegion _readLicensePlateInfos]((uint64_t)self);
  licensePlateInfos = self->_licensePlateInfos;

  return licensePlateInfos;
}

- (void)setLicensePlateInfos:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  licensePlateInfos = self->_licensePlateInfos;
  self->_licensePlateInfos = v4;
}

- (void)clearLicensePlateInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  licensePlateInfos = self->_licensePlateInfos;

  [(NSMutableArray *)licensePlateInfos removeAllObjects];
}

- (void)addLicensePlateInfo:(id)a3
{
  id v4 = a3;
  -[GEOLPRLicensePlateRegion _readLicensePlateInfos]((uint64_t)self);
  -[GEOLPRLicensePlateRegion _addNoFlagsLicensePlateInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsLicensePlateInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)licensePlateInfosCount
{
  -[GEOLPRLicensePlateRegion _readLicensePlateInfos]((uint64_t)self);
  licensePlateInfos = self->_licensePlateInfos;

  return [(NSMutableArray *)licensePlateInfos count];
}

- (id)licensePlateInfoAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateRegion _readLicensePlateInfos]((uint64_t)self);
  licensePlateInfos = self->_licensePlateInfos;

  return (id)[(NSMutableArray *)licensePlateInfos objectAtIndex:a3];
}

+ (Class)licensePlateInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readRegions
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
        GEOLPRLicensePlateRegionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegions_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)regions
{
  -[GEOLPRLicensePlateRegion _readRegions]((uint64_t)self);
  regions = self->_regions;

  return regions;
}

- (void)setRegions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  regions = self->_regions;
  self->_regions = v4;
}

- (void)clearRegions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  regions = self->_regions;

  [(NSMutableArray *)regions removeAllObjects];
}

- (void)addRegion:(id)a3
{
  id v4 = a3;
  -[GEOLPRLicensePlateRegion _readRegions]((uint64_t)self);
  -[GEOLPRLicensePlateRegion _addNoFlagsRegion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsRegion:(uint64_t)a1
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

- (unint64_t)regionsCount
{
  -[GEOLPRLicensePlateRegion _readRegions]((uint64_t)self);
  regions = self->_regions;

  return [(NSMutableArray *)regions count];
}

- (id)regionAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateRegion _readRegions]((uint64_t)self);
  regions = self->_regions;

  return (id)[(NSMutableArray *)regions objectAtIndex:a3];
}

+ (Class)regionType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRLicensePlateRegion;
  id v4 = [(GEOLPRLicensePlateRegion *)&v8 description];
  id v5 = [(GEOLPRLicensePlateRegion *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLicensePlateRegion _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 identifier];
    if (v5) {
      [v4 setObject:v5 forKey:@"identifier"];
    }

    objc_super v6 = [a1 mapRegion];
    id v7 = v6;
    if (v6)
    {
      if (a2)
      {
        objc_super v8 = [v6 jsonRepresentation];
        v9 = @"mapRegion";
      }
      else
      {
        objc_super v8 = [v6 dictionaryRepresentation];
        v9 = @"map_region";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if ([a1[3] count])
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v11 = a1[3];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v33 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            v17 = [v16 dictionaryRepresentation];
            }
            [v10 addObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v13);
      }

      if (a2) {
        v18 = @"licensePlateInfo";
      }
      else {
        v18 = @"license_plate_info";
      }
      [v4 setObject:v10 forKey:v18];
    }
    if ([a1[5] count])
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[5], "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v20 = a1[5];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v28 + 1) + 8 * j);
            if (a2) {
              [v25 jsonRepresentation];
            }
            else {
            v26 = objc_msgSend(v25, "dictionaryRepresentation", (void)v28);
            }
            objc_msgSend(v19, "addObject:", v26, (void)v28);
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v22);
      }

      [v4 setObject:v19 forKey:@"region"];
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
  return -[GEOLPRLicensePlateRegion _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLPRLicensePlateRegion)initWithDictionary:(id)a3
{
  return (GEOLPRLicensePlateRegion *)-[GEOLPRLicensePlateRegion _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[v6 copy];
        [a1 setIdentifier:v7];
      }
      if (a3) {
        objc_super v8 = @"mapRegion";
      }
      else {
        objc_super v8 = @"map_region";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = [GEOMapRegionE7 alloc];
        if (a3) {
          uint64_t v11 = [(GEOMapRegionE7 *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOMapRegionE7 *)v10 initWithDictionary:v9];
        }
        uint64_t v12 = (void *)v11;
        [a1 setMapRegion:v11];
      }
      if (a3) {
        uint64_t v13 = @"licensePlateInfo";
      }
      else {
        uint64_t v13 = @"license_plate_info";
      }
      uint64_t v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      id v35 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v41 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v21 = [GEOLPRLicensePlateInfo alloc];
                if (a3) {
                  uint64_t v22 = [(GEOLPRLicensePlateInfo *)v21 initWithJSON:v20];
                }
                else {
                  uint64_t v22 = [(GEOLPRLicensePlateInfo *)v21 initWithDictionary:v20];
                }
                uint64_t v23 = (void *)v22;
                [a1 addLicensePlateInfo:v22];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
          }
          while (v17);
        }

        id v5 = v35;
      }

      v24 = [v5 objectForKeyedSubscript:@"region"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v37 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v36 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v31 = [GEOLPRRestrictionRegion alloc];
                if (a3) {
                  uint64_t v32 = [(GEOLPRRestrictionRegion *)v31 initWithJSON:v30];
                }
                else {
                  uint64_t v32 = [(GEOLPRRestrictionRegion *)v31 initWithDictionary:v30];
                }
                long long v33 = (void *)v32;
                [a1 addRegion:v32];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v27);
        }

        id v5 = v35;
      }
    }
  }

  return a1;
}

- (GEOLPRLicensePlateRegion)initWithJSON:(id)a3
{
  return (GEOLPRLicensePlateRegion *)-[GEOLPRLicensePlateRegion _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_486;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_487;
    }
    GEOLPRLicensePlateRegionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRLicensePlateRegionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLicensePlateRegionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLicensePlateRegionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRLicensePlateRegionIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRLicensePlateRegion *)self readAll:0];
    PBDataWriterWriteStringField();
    if (self->_mapRegion) {
      PBDataWriterWriteSubmessage();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_licensePlateInfos;
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
    v10 = self->_regions;
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
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOLPRLicensePlateRegion *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 12) = self->_readerMarkPos;
  *((_DWORD *)v12 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [v12 setIdentifier:self->_identifier];
  if (self->_mapRegion) {
    objc_msgSend(v12, "setMapRegion:");
  }
  if ([(GEOLPRLicensePlateRegion *)self licensePlateInfosCount])
  {
    [v12 clearLicensePlateInfos];
    unint64_t v4 = [(GEOLPRLicensePlateRegion *)self licensePlateInfosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLPRLicensePlateRegion *)self licensePlateInfoAtIndex:i];
        [v12 addLicensePlateInfo:v7];
      }
    }
  }
  if ([(GEOLPRLicensePlateRegion *)self regionsCount])
  {
    [v12 clearRegions];
    unint64_t v8 = [(GEOLPRLicensePlateRegion *)self regionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOLPRLicensePlateRegion *)self regionAtIndex:j];
        [v12 addRegion:v11];
      }
    }
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
      GEOLPRLicensePlateRegionReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRLicensePlateRegion *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(GEOMapRegionE7 *)self->_mapRegion copyWithZone:a3];
  uint64_t v11 = (void *)v5[4];
  v5[4] = v10;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v12 = self->_licensePlateInfos;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        [v5 addLicensePlateInfo:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v13);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v17 = self->_regions;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v17);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (void)v23);
        [v5 addRegion:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLPRLicensePlateRegion *)self readAll:1],
         [v4 readAll:1],
         identifier = self->_identifier,
         !((unint64_t)identifier | v4[2]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((mapRegion = self->_mapRegion, !((unint64_t)mapRegion | v4[4]))
     || -[GEOMapRegionE7 isEqual:](mapRegion, "isEqual:"))
    && ((licensePlateInfos = self->_licensePlateInfos, !((unint64_t)licensePlateInfos | v4[3]))
     || -[NSMutableArray isEqual:](licensePlateInfos, "isEqual:")))
  {
    regions = self->_regions;
    if ((unint64_t)regions | v4[5]) {
      char v9 = -[NSMutableArray isEqual:](regions, "isEqual:");
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
  [(GEOLPRLicensePlateRegion *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = [(GEOMapRegionE7 *)self->_mapRegion hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_licensePlateInfos hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_regions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEOLPRLicensePlateRegion setIdentifier:](self, "setIdentifier:");
  }
  mapRegion = self->_mapRegion;
  id v6 = v4[4];
  if (mapRegion)
  {
    if (v6) {
      -[GEOMapRegionE7 mergeFrom:](mapRegion, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOLPRLicensePlateRegion setMapRegion:](self, "setMapRegion:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v4[3];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEOLPRLicensePlateRegion *)self addLicensePlateInfo:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v4[5];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[GEOLPRLicensePlateRegion addRegion:](self, "addRegion:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_licensePlateInfos, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end