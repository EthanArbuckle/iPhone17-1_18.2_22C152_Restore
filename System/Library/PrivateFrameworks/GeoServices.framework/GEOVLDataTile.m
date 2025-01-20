@interface GEOVLDataTile
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCoord;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTileCoordinate)coord;
- (GEOVLDataTile)init;
- (GEOVLDataTile)initWithData:(id)a3;
- (GEOVLDataTile)initWithDictionary:(id)a3;
- (GEOVLDataTile)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)purposeDenylistsAsString:(int)a3;
- (int)StringAsPurposeDenylists:(id)a3;
- (int)purposeDenylistAtIndex:(unint64_t)a3;
- (int)purposeDenylists;
- (unint64_t)buildIndexsCount;
- (unint64_t)hash;
- (unint64_t)precisionIndexsCount;
- (unint64_t)purposeDenylistsCount;
- (unsigned)buildIndexAtIndex:(unint64_t)a3;
- (unsigned)buildIndexs;
- (unsigned)precisionIndexAtIndex:(unint64_t)a3;
- (unsigned)precisionIndexs;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readBuildIndexs;
- (void)_readCoord;
- (void)_readPrecisionIndexs;
- (void)_readPurposeDenylists;
- (void)addBuildIndex:(unsigned int)a3;
- (void)addPrecisionIndex:(unsigned int)a3;
- (void)addPurposeDenylist:(int)a3;
- (void)clearBuildIndexs;
- (void)clearPrecisionIndexs;
- (void)clearPurposeDenylists;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBuildIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCoord:(id)a3;
- (void)setPrecisionIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPurposeDenylists:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLDataTile

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOVLDataTile;
  [(GEOVLDataTile *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coord, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOVLDataTile)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOVLDataTile;
  v2 = [(GEOVLDataTile *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTileCoordinate)coord
{
  -[GEOVLDataTile _readCoord]((uint64_t)self);
  coord = self->_coord;

  return coord;
}

- (void)_readCoord
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLDataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoord_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (GEOVLDataTile)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOVLDataTile;
  id v3 = [(GEOVLDataTile *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)hasCoord
{
  return self->_coord != 0;
}

- (void)setCoord:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_coord, a3);
}

- (void)_readBuildIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLDataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBuildIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)buildIndexsCount
{
  return self->_buildIndexs.count;
}

- (unsigned)buildIndexs
{
  return self->_buildIndexs.list;
}

- (void)clearBuildIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedUInt32Clear();
}

- (void)addBuildIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (unsigned)buildIndexAtIndex:(unint64_t)a3
{
  -[GEOVLDataTile _readBuildIndexs]((uint64_t)self);
  p_buildIndexs = &self->_buildIndexs;
  unint64_t count = self->_buildIndexs.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_buildIndexs->list[a3];
}

- (void)setBuildIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147400](&self->_buildIndexs, a3, a4);
}

- (void)_readPrecisionIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLDataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrecisionIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)precisionIndexsCount
{
  return self->_precisionIndexs.count;
}

- (unsigned)precisionIndexs
{
  return self->_precisionIndexs.list;
}

- (void)clearPrecisionIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedUInt32Clear();
}

- (void)addPrecisionIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (unsigned)precisionIndexAtIndex:(unint64_t)a3
{
  -[GEOVLDataTile _readPrecisionIndexs]((uint64_t)self);
  p_precisionIndexs = &self->_precisionIndexs;
  unint64_t count = self->_precisionIndexs.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_precisionIndexs->list[a3];
}

- (void)setPrecisionIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147400](&self->_precisionIndexs, a3, a4);
}

- (void)_readPurposeDenylists
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLDataTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPurposeDenylists_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)purposeDenylistsCount
{
  return self->_purposeDenylists.count;
}

- (int)purposeDenylists
{
  return self->_purposeDenylists.list;
}

- (void)clearPurposeDenylists
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedInt32Clear();
}

- (void)addPurposeDenylist:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (int)purposeDenylistAtIndex:(unint64_t)a3
{
  -[GEOVLDataTile _readPurposeDenylists]((uint64_t)self);
  p_purposeDenylists = &self->_purposeDenylists;
  unint64_t count = self->_purposeDenylists.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
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
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

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
  v8.super_class = (Class)GEOVLDataTile;
  int v4 = [(GEOVLDataTile *)&v8 description];
  v5 = [(GEOVLDataTile *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLDataTile _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 coord];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"coord"];
    }
    if (a1[3])
    {
      objc_super v8 = PBRepeatedUInt32NSArray();
      if (a2) {
        v9 = @"buildIndex";
      }
      else {
        v9 = @"build_index";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if (a1[6])
    {
      v10 = PBRepeatedUInt32NSArray();
      if (a2) {
        v11 = @"precisionIndex";
      }
      else {
        v11 = @"precision_index";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if (a1[9])
    {
      v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v13 = a1 + 8;
      if (a1[9])
      {
        unint64_t v14 = 0;
        do
        {
          uint64_t v15 = *(int *)(*v13 + 4 * v14);
          if (v15 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = off_1E53E65D0[v15];
          }
          [v12 addObject:v16];

          ++v14;
          v13 = a1 + 8;
        }
        while (v14 < a1[9]);
      }
      if (a2) {
        v17 = @"purposeDenylist";
      }
      else {
        v17 = @"purpose_denylist";
      }
      [v4 setObject:v12 forKey:v17];
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
  return -[GEOVLDataTile _dictionaryRepresentation:](self, 1);
}

- (GEOVLDataTile)initWithDictionary:(id)a3
{
  return (GEOVLDataTile *)-[GEOVLDataTile _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = (void *)[a1 init];
    if (v6)
    {
      objc_super v7 = [v5 objectForKeyedSubscript:@"coord"];
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
        v10 = (void *)v9;
        [v6 setCoord:v9];
      }
      if (a3) {
        v11 = @"buildIndex";
      }
      else {
        v11 = @"build_index";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v54 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v49 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(v6, "addBuildIndex:", objc_msgSend(v18, "unsignedIntValue"));
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v48 objects:v54 count:16];
          }
          while (v15);
        }
      }
      if (a3) {
        v19 = @"precisionIndex";
      }
      else {
        v19 = @"precision_index";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v45 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v44 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(v6, "addPrecisionIndex:", objc_msgSend(v26, "unsignedIntValue"));
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v44 objects:v53 count:16];
          }
          while (v23);
        }
      }
      if (a3) {
        v27 = @"purposeDenylist";
      }
      else {
        v27 = @"purpose_denylist";
      }
      v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v38 = v28;
        id v39 = v5;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (!v30) {
          goto LABEL_61;
        }
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v41;
        while (1)
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v41 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v40 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v35 = v34;
              if ([v35 isEqualToString:@"VL_PURPOSE_UNKNOWN"])
              {
                uint64_t v36 = 0;
              }
              else if ([v35 isEqualToString:@"VL_PURPOSE_LOCATION_REFINEMENT"])
              {
                uint64_t v36 = 1;
              }
              else if ([v35 isEqualToString:@"VL_PURPOSE_GEOTRACKING"])
              {
                uint64_t v36 = 2;
              }
              else if ([v35 isEqualToString:@"VL_PURPOSE_PEDESTRIAN_AR"])
              {
                uint64_t v36 = 3;
              }
              else
              {
                uint64_t v36 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v36 = [v34 intValue];
            }
            objc_msgSend(v6, "addPurposeDenylist:", v36, v38, v39, (void)v40);
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v40 objects:v52 count:16];
          if (!v31)
          {
LABEL_61:

            v28 = v38;
            id v5 = v39;
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

- (GEOVLDataTile)initWithJSON:(id)a3
{
  return (GEOVLDataTile *)-[GEOVLDataTile _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_48;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_48;
    }
    GEOVLDataTileReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOTileCoordinate *)self->_coord readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLDataTileIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLDataTileReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1F) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v12 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
    id v5 = v12;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOVLDataTile *)self readAll:0];
    if (self->_coord) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v12;
    if (self->_buildIndexs.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v5 = v12;
        ++v6;
      }
      while (v6 < self->_buildIndexs.count);
    }
    if (self->_precisionIndexs.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v5 = v12;
        ++v7;
      }
      while (v7 < self->_precisionIndexs.count);
    }
    p_purposeDenylists = &self->_purposeDenylists;
    if (p_purposeDenylists->count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v12;
        ++v9;
      }
      while (v9 < p_purposeDenylists->count);
    }
  }
}

- (void)copyTo:(id)a3
{
  id v13 = (id *)a3;
  [(GEOVLDataTile *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 24) = self->_readerMarkPos;
  *((_DWORD *)v13 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_coord) {
    objc_msgSend(v13, "setCoord:");
  }
  if ([(GEOVLDataTile *)self buildIndexsCount])
  {
    [v13 clearBuildIndexs];
    unint64_t v4 = [(GEOVLDataTile *)self buildIndexsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v13, "addBuildIndex:", -[GEOVLDataTile buildIndexAtIndex:](self, "buildIndexAtIndex:", i));
    }
  }
  if ([(GEOVLDataTile *)self precisionIndexsCount])
  {
    [v13 clearPrecisionIndexs];
    unint64_t v7 = [(GEOVLDataTile *)self precisionIndexsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v13, "addPrecisionIndex:", -[GEOVLDataTile precisionIndexAtIndex:](self, "precisionIndexAtIndex:", j));
    }
  }
  if ([(GEOVLDataTile *)self purposeDenylistsCount])
  {
    [v13 clearPurposeDenylists];
    unint64_t v10 = [(GEOVLDataTile *)self purposeDenylistsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
        objc_msgSend(v13, "addPurposeDenylist:", -[GEOVLDataTile purposeDenylistAtIndex:](self, "purposeDenylistAtIndex:", k));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  unint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOVLDataTile *)self readAll:0];
    id v8 = [(GEOTileCoordinate *)self->_coord copyWithZone:a3];
    unint64_t v9 = (void *)v5[11];
    v5[11] = v8;

    PBRepeatedUInt32Copy();
    PBRepeatedUInt32Copy();
    PBRepeatedInt32Copy();
    return v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOVLDataTileReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOVLDataTile *)self readAll:1],
         [v4 readAll:1],
         coord = self->_coord,
         !((unint64_t)coord | v4[11]))
     || -[GEOTileCoordinate isEqual:](coord, "isEqual:"))
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual())
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
  [(GEOVLDataTile *)self readAll:1];
  unint64_t v3 = [(GEOTileCoordinate *)self->_coord hash];
  uint64_t v4 = PBRepeatedUInt32Hash();
  uint64_t v5 = v4 ^ PBRepeatedUInt32Hash();
  return v5 ^ PBRepeatedInt32Hash() ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = a3;
  [v16 readAll:0];
  uint64_t v4 = v16;
  coord = self->_coord;
  uint64_t v6 = v16[11];
  if (coord)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOTileCoordinate mergeFrom:](coord, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOVLDataTile setCoord:](self, "setCoord:");
  }
  uint64_t v4 = v16;
LABEL_7:
  uint64_t v7 = [v4 buildIndexsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[GEOVLDataTile addBuildIndex:](self, "addBuildIndex:", [v16 buildIndexAtIndex:i]);
  }
  uint64_t v10 = [v16 precisionIndexsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[GEOVLDataTile addPrecisionIndex:](self, "addPrecisionIndex:", [v16 precisionIndexAtIndex:j]);
  }
  uint64_t v13 = [v16 purposeDenylistsCount];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t k = 0; k != v14; ++k)
      -[GEOVLDataTile addPurposeDenylist:](self, "addPurposeDenylist:", [v16 purposeDenylistAtIndex:k]);
  }
}

@end