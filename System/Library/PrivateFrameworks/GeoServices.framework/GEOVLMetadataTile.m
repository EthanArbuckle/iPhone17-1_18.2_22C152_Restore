@interface GEOVLMetadataTile
+ (BOOL)isValid:(id)a3;
+ (Class)buildType;
+ (Class)precisionType;
+ (Class)tileType;
- (BOOL)hasCoord;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTileCoordinate)coord;
- (GEOVLMetadataTile)init;
- (GEOVLMetadataTile)initWithData:(id)a3;
- (GEOVLMetadataTile)initWithDictionary:(id)a3;
- (GEOVLMetadataTile)initWithJSON:(id)a3;
- (NSMutableArray)builds;
- (NSMutableArray)precisions;
- (NSMutableArray)tiles;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)buildAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)precisionAtIndex:(unint64_t)a3;
- (id)purposeDenylistsAsString:(int)a3;
- (id)tileAtIndex:(unint64_t)a3;
- (int)StringAsPurposeDenylists:(id)a3;
- (int)purposeDenylistAtIndex:(unint64_t)a3;
- (int)purposeDenylists;
- (unint64_t)buildsCount;
- (unint64_t)hash;
- (unint64_t)precisionsCount;
- (unint64_t)purposeDenylistsCount;
- (unint64_t)tilesCount;
- (void)_addNoFlagsBuild:(uint64_t)a1;
- (void)_addNoFlagsPrecision:(uint64_t)a1;
- (void)_addNoFlagsTile:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readBuilds;
- (void)_readCoord;
- (void)_readPrecisions;
- (void)_readPurposeDenylists;
- (void)_readTiles;
- (void)addBuild:(id)a3;
- (void)addPrecision:(id)a3;
- (void)addPurposeDenylist:(int)a3;
- (void)addTile:(id)a3;
- (void)clearBuilds;
- (void)clearPrecisions;
- (void)clearPurposeDenylists;
- (void)clearTiles;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBuilds:(id)a3;
- (void)setCoord:(id)a3;
- (void)setPrecisions:(id)a3;
- (void)setPurposeDenylists:(int *)a3 count:(unint64_t)a4;
- (void)setTiles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLMetadataTile

- (void)_addNoFlagsTile:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_addNoFlagsPrecision:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLMetadataTileReadAllFrom((uint64_t)self, a3, 0);
}

- (GEOVLMetadataTile)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOVLMetadataTile;
  id v3 = [(GEOVLMetadataTile *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (NSMutableArray)tiles
{
  -[GEOVLMetadataTile _readTiles]((uint64_t)self);
  tiles = self->_tiles;

  return tiles;
}

- (unint64_t)purposeDenylistsCount
{
  return self->_purposeDenylists.count;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOVLMetadataTile;
  [(GEOVLMetadataTile *)&v3 dealloc];
}

- (void)_readTiles
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
        GEOVLMetadataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTiles_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)_readPurposeDenylists
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLMetadataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPurposeDenylists_tags_192);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)_readPrecisions
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
        GEOVLMetadataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrecisions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_precisions, 0);
  objc_storeStrong((id *)&self->_coord, 0);
  objc_storeStrong((id *)&self->_builds, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOVLMetadataTile)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOVLMetadataTile;
  v2 = [(GEOVLMetadataTile *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_readCoord
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
        GEOVLMetadataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoord_tags_188);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCoord
{
  return self->_coord != 0;
}

- (GEOTileCoordinate)coord
{
  -[GEOVLMetadataTile _readCoord]((uint64_t)self);
  coord = self->_coord;

  return coord;
}

- (void)setCoord:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_coord, a3);
}

- (void)_readBuilds
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
        GEOVLMetadataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBuilds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)builds
{
  -[GEOVLMetadataTile _readBuilds]((uint64_t)self);
  builds = self->_builds;

  return builds;
}

- (void)setBuilds:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  builds = self->_builds;
  self->_builds = v4;
}

- (void)clearBuilds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  builds = self->_builds;

  [(NSMutableArray *)builds removeAllObjects];
}

- (void)addBuild:(id)a3
{
  id v4 = a3;
  -[GEOVLMetadataTile _readBuilds]((uint64_t)self);
  -[GEOVLMetadataTile _addNoFlagsBuild:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsBuild:(uint64_t)a1
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

- (unint64_t)buildsCount
{
  -[GEOVLMetadataTile _readBuilds]((uint64_t)self);
  builds = self->_builds;

  return [(NSMutableArray *)builds count];
}

- (id)buildAtIndex:(unint64_t)a3
{
  -[GEOVLMetadataTile _readBuilds]((uint64_t)self);
  builds = self->_builds;

  return (id)[(NSMutableArray *)builds objectAtIndex:a3];
}

+ (Class)buildType
{
  return (Class)objc_opt_class();
}

- (NSMutableArray)precisions
{
  -[GEOVLMetadataTile _readPrecisions]((uint64_t)self);
  precisions = self->_precisions;

  return precisions;
}

- (void)setPrecisions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  precisions = self->_precisions;
  self->_precisions = v4;
}

- (void)clearPrecisions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  precisions = self->_precisions;

  [(NSMutableArray *)precisions removeAllObjects];
}

- (void)addPrecision:(id)a3
{
  id v4 = a3;
  -[GEOVLMetadataTile _readPrecisions]((uint64_t)self);
  -[GEOVLMetadataTile _addNoFlagsPrecision:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (unint64_t)precisionsCount
{
  -[GEOVLMetadataTile _readPrecisions]((uint64_t)self);
  precisions = self->_precisions;

  return [(NSMutableArray *)precisions count];
}

- (id)precisionAtIndex:(unint64_t)a3
{
  -[GEOVLMetadataTile _readPrecisions]((uint64_t)self);
  precisions = self->_precisions;

  return (id)[(NSMutableArray *)precisions objectAtIndex:a3];
}

+ (Class)precisionType
{
  return (Class)objc_opt_class();
}

- (void)setTiles:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  tiles = self->_tiles;
  self->_tiles = v4;
}

- (void)clearTiles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  tiles = self->_tiles;

  [(NSMutableArray *)tiles removeAllObjects];
}

- (void)addTile:(id)a3
{
  id v4 = a3;
  -[GEOVLMetadataTile _readTiles]((uint64_t)self);
  -[GEOVLMetadataTile _addNoFlagsTile:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (unint64_t)tilesCount
{
  -[GEOVLMetadataTile _readTiles]((uint64_t)self);
  tiles = self->_tiles;

  return [(NSMutableArray *)tiles count];
}

- (id)tileAtIndex:(unint64_t)a3
{
  -[GEOVLMetadataTile _readTiles]((uint64_t)self);
  tiles = self->_tiles;

  return (id)[(NSMutableArray *)tiles objectAtIndex:a3];
}

+ (Class)tileType
{
  return (Class)objc_opt_class();
}

- (int)purposeDenylists
{
  return self->_purposeDenylists.list;
}

- (void)clearPurposeDenylists
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  PBRepeatedInt32Clear();
}

- (void)addPurposeDenylist:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (int)purposeDenylistAtIndex:(unint64_t)a3
{
  -[GEOVLMetadataTile _readPurposeDenylists]((uint64_t)self);
  p_purposeDenylists = &self->_purposeDenylists;
  unint64_t count = self->_purposeDenylists.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_purposeDenylists->list[a3];
}

- (void)setPurposeDenylists:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  MEMORY[0x1F4147390](&self->_purposeDenylists, a3, a4);
}

- (id)purposeDenylistsAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E65D0[a3];
  }

  return v3;
}

- (int)StringAsPurposeDenylists:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VL_PURPOSE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VL_PURPOSE_LOCATION_REFINEMENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VL_PURPOSE_GEOTRACKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VL_PURPOSE_PEDESTRIAN_AR"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLMetadataTile;
  int v4 = [(GEOVLMetadataTile *)&v8 description];
  id v5 = [(GEOVLMetadataTile *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLMetadataTile _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 coord];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"coord"];
    }
    if ([*(id *)(a1 + 40) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v9 = *(id *)(a1 + 40);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v48 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = [v14 dictionaryRepresentation];
            }
            [v8 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
        }
        while (v11);
      }

      [v4 setObject:v8 forKey:@"build"];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v17 = *(id *)(a1 + 56);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v44 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v43 + 1) + 8 * j);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            v23 = [v22 dictionaryRepresentation];
            }
            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v19);
      }

      [v4 setObject:v16 forKey:@"precision"];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v25 = *(id *)(a1 + 64);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v51 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v40;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v40 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v39 + 1) + 8 * k);
            if (a2) {
              [v30 jsonRepresentation];
            }
            else {
            v31 = [v30 dictionaryRepresentation];
            }
            [v24 addObject:v31];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v51 count:16];
        }
        while (v27);
      }

      [v4 setObject:v24 forKey:@"tile"];
    }
    if (*(void *)(a1 + 24))
    {
      v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v33 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v34 = 0;
        do
        {
          uint64_t v35 = *(int *)(*v33 + 4 * v34);
          if (v35 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v35);
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v36 = off_1E53E65D0[v35];
          }
          [v32 addObject:v36];

          ++v34;
          v33 = (void *)(a1 + 16);
        }
        while (v34 < *(void *)(a1 + 24));
      }
      if (a2) {
        v37 = @"purposeDenylist";
      }
      else {
        v37 = @"purpose_denylist";
      }
      [v4 setObject:v32 forKey:v37];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLMetadataTile _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLMetadataTile)initWithDictionary:(id)a3
{
  return (GEOVLMetadataTile *)-[GEOVLMetadataTile _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = (void *)[a1 init];
    if (v6)
    {
      id v7 = [v5 objectForKeyedSubscript:@"coord"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOTileCoordinate alloc];
        if (a3) {
          uint64_t v9 = [(GEOTileCoordinate *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOTileCoordinate *)v8 initWithDictionary:v7];
        }
        uint64_t v10 = (void *)v9;
        [v6 setCoord:v9];
      }
      uint64_t v11 = [v5 objectForKeyedSubscript:@"build"];
      objc_opt_class();
      id v54 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        v52 = v11;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v67 objects:v74 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v68 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v67 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v18 = [GEOVLBuild alloc];
                if (a3) {
                  uint64_t v19 = [(GEOVLBuild *)v18 initWithJSON:v17];
                }
                else {
                  uint64_t v19 = [(GEOVLBuild *)v18 initWithDictionary:v17];
                }
                uint64_t v20 = (void *)v19;
                objc_msgSend(v6, "addBuild:", v19, v52);
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v67 objects:v74 count:16];
          }
          while (v14);
        }

        uint64_t v11 = v52;
        id v5 = v54;
      }

      v21 = [v5 objectForKeyedSubscript:@"precision"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        v52 = v21;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v63 objects:v73 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v64;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v64 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v63 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v28 = [GEOVLPrecision alloc];
                if (a3) {
                  uint64_t v29 = [(GEOVLPrecision *)v28 initWithJSON:v27];
                }
                else {
                  uint64_t v29 = [(GEOVLPrecision *)v28 initWithDictionary:v27];
                }
                v30 = (void *)v29;
                objc_msgSend(v6, "addPrecision:", v29, v52);
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v63 objects:v73 count:16];
          }
          while (v24);
        }

        v21 = v52;
        id v5 = v54;
      }

      v31 = [v5 objectForKeyedSubscript:@"tile"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        v52 = v31;
        id v32 = v31;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v59 objects:v72 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v60;
          do
          {
            for (uint64_t k = 0; k != v34; ++k)
            {
              if (*(void *)v60 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = *(void *)(*((void *)&v59 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v38 = [GEOVLDataTile alloc];
                if (a3) {
                  uint64_t v39 = [(GEOVLDataTile *)v38 initWithJSON:v37];
                }
                else {
                  uint64_t v39 = [(GEOVLDataTile *)v38 initWithDictionary:v37];
                }
                long long v40 = (void *)v39;
                objc_msgSend(v6, "addTile:", v39, v52);
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v59 objects:v72 count:16];
          }
          while (v34);
        }

        v31 = v52;
        id v5 = v54;
      }

      if (a3) {
        long long v41 = @"purposeDenylist";
      }
      else {
        long long v41 = @"purpose_denylist";
      }
      long long v42 = objc_msgSend(v5, "objectForKeyedSubscript:", v41, v52);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        v53 = v42;
        id v43 = v42;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v55 objects:v71 count:16];
        if (!v44) {
          goto LABEL_75;
        }
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v56;
        while (1)
        {
          for (uint64_t m = 0; m != v45; ++m)
          {
            if (*(void *)v56 != v46) {
              objc_enumerationMutation(v43);
            }
            long long v48 = *(void **)(*((void *)&v55 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v49 = v48;
              if ([v49 isEqualToString:@"VL_PURPOSE_UNKNOWN"])
              {
                uint64_t v50 = 0;
              }
              else if ([v49 isEqualToString:@"VL_PURPOSE_LOCATION_REFINEMENT"])
              {
                uint64_t v50 = 1;
              }
              else if ([v49 isEqualToString:@"VL_PURPOSE_GEOTRACKING"])
              {
                uint64_t v50 = 2;
              }
              else if ([v49 isEqualToString:@"VL_PURPOSE_PEDESTRIAN_AR"])
              {
                uint64_t v50 = 3;
              }
              else
              {
                uint64_t v50 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v50 = [v48 intValue];
            }
            objc_msgSend(v6, "addPurposeDenylist:", v50, v53);
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v55 objects:v71 count:16];
          if (!v45)
          {
LABEL_75:

            long long v42 = v53;
            id v5 = v54;
            break;
          }
        }
      }
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (GEOVLMetadataTile)initWithJSON:(id)a3
{
  return (GEOVLMetadataTile *)-[GEOVLMetadataTile _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_202;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_203;
    }
    GEOVLMetadataTileReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOVLMetadataTileCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLMetadataTileIsValid((char *)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3F) == 0))
  {
    uint64_t v20 = self->_reader;
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
    [(GEOVLMetadataTile *)self readAll:0];
    if (self->_coord) {
      PBDataWriterWriteSubmessage();
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    objc_super v6 = self->_builds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v7);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v10 = self->_precisions;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v11);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = self->_tiles;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v15);
    }

    p_purposeDenylists = &self->_purposeDenylists;
    if (p_purposeDenylists->count)
    {
      unint64_t v19 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v19;
      }
      while (v19 < p_purposeDenylists->count);
    }
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v19 = (id *)a3;
  [(GEOVLMetadataTile *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v19 + 1, self->_reader);
  *((_DWORD *)v19 + 18) = self->_readerMarkPos;
  *((_DWORD *)v19 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_coord) {
    objc_msgSend(v19, "setCoord:");
  }
  if ([(GEOVLMetadataTile *)self buildsCount])
  {
    [v19 clearBuilds];
    unint64_t v4 = [(GEOVLMetadataTile *)self buildsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOVLMetadataTile *)self buildAtIndex:i];
        [v19 addBuild:v7];
      }
    }
  }
  if ([(GEOVLMetadataTile *)self precisionsCount])
  {
    [v19 clearPrecisions];
    unint64_t v8 = [(GEOVLMetadataTile *)self precisionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOVLMetadataTile *)self precisionAtIndex:j];
        [v19 addPrecision:v11];
      }
    }
  }
  if ([(GEOVLMetadataTile *)self tilesCount])
  {
    [v19 clearTiles];
    unint64_t v12 = [(GEOVLMetadataTile *)self tilesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOVLMetadataTile *)self tileAtIndex:k];
        [v19 addTile:v15];
      }
    }
  }
  if ([(GEOVLMetadataTile *)self purposeDenylistsCount])
  {
    [v19 clearPurposeDenylists];
    unint64_t v16 = [(GEOVLMetadataTile *)self purposeDenylistsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
        objc_msgSend(v19, "addPurposeDenylist:", -[GEOVLMetadataTile purposeDenylistAtIndex:](self, "purposeDenylistAtIndex:", m));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOVLMetadataTileReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOVLMetadataTile *)self readAll:0];
  id v8 = [(GEOTileCoordinate *)self->_coord copyWithZone:a3];
  unint64_t v9 = (void *)v5[6];
  v5[6] = v8;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v10 = self->_builds;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * i) copyWithZone:a3];
        [v5 addBuild:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v11);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v15 = self->_precisions;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v15);
        }
        unint64_t v19 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * j) copyWithZone:a3];
        [v5 addPrecision:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v16);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v20 = self->_tiles;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v20);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * k), "copyWithZone:", a3, (void)v26);
        [v5 addTile:v24];
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v21);
  }

  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOVLMetadataTile *)self readAll:1],
         [v4 readAll:1],
         coord = self->_coord,
         !((unint64_t)coord | v4[6]))
     || -[GEOTileCoordinate isEqual:](coord, "isEqual:"))
    && ((builds = self->_builds, !((unint64_t)builds | v4[5]))
     || -[NSMutableArray isEqual:](builds, "isEqual:"))
    && ((precisions = self->_precisions, !((unint64_t)precisions | v4[7]))
     || -[NSMutableArray isEqual:](precisions, "isEqual:"))
    && ((tiles = self->_tiles, !((unint64_t)tiles | v4[8]))
     || -[NSMutableArray isEqual:](tiles, "isEqual:")))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOVLMetadataTile *)self readAll:1];
  unint64_t v3 = [(GEOTileCoordinate *)self->_coord hash];
  uint64_t v4 = [(NSMutableArray *)self->_builds hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_precisions hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_tiles hash];
  return v6 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  coord = self->_coord;
  id v6 = v4[6];
  if (coord)
  {
    if (v6) {
      -[GEOTileCoordinate mergeFrom:](coord, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOVLMetadataTile setCoord:](self, "setCoord:");
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v4[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEOVLMetadataTile *)self addBuild:*(void *)(*((void *)&v33 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v9);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v4[7];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        [(GEOVLMetadataTile *)self addPrecision:*(void *)(*((void *)&v29 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v4[8];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        -[GEOVLMetadataTile addTile:](self, "addTile:", *(void *)(*((void *)&v25 + 1) + 8 * k), (void)v25);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v19);
  }

  uint64_t v22 = [v4 purposeDenylistsCount];
  if (v22)
  {
    uint64_t v23 = v22;
    for (uint64_t m = 0; m != v23; ++m)
      -[GEOVLMetadataTile addPurposeDenylist:](self, "addPurposeDenylist:", objc_msgSend(v4, "purposeDenylistAtIndex:", m, (void)v25));
  }
}

@end