@interface GEOArrivalParameters
+ (BOOL)isValid:(id)a3;
+ (Class)arrivalMapRegionsType;
+ (Class)arrivalPointsType;
- (BOOL)hasArrivalParametersEndOfRouteDistanceThreshold;
- (BOOL)hasEndOfRouteDistanceThreshold;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOArrivalParameters)init;
- (GEOArrivalParameters)initWithData:(id)a3;
- (GEOArrivalParameters)initWithDictionary:(id)a3;
- (GEOArrivalParameters)initWithJSON:(id)a3;
- (NSMutableArray)arrivalMapRegions;
- (NSMutableArray)arrivalPoints;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)arrivalMapRegionsAtIndex:(unint64_t)a3;
- (id)arrivalPointsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)arrivalMapRegionsCount;
- (unint64_t)arrivalPointsCount;
- (unint64_t)hash;
- (unsigned)arrivalParametersEndOfRouteDistanceThreshold;
- (unsigned)endOfRouteDistanceThreshold;
- (void)_addNoFlagsArrivalMapRegions:(uint64_t)a1;
- (void)_addNoFlagsArrivalPoints:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArrivalMapRegions;
- (void)_readArrivalPoints;
- (void)addArrivalMapRegions:(id)a3;
- (void)addArrivalPoints:(id)a3;
- (void)clearArrivalMapRegions;
- (void)clearArrivalPoints;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArrivalMapRegions:(id)a3;
- (void)setArrivalParametersEndOfRouteDistanceThreshold:(unsigned int)a3;
- (void)setArrivalPoints:(id)a3;
- (void)setEndOfRouteDistanceThreshold:(unsigned int)a3;
- (void)setHasArrivalParametersEndOfRouteDistanceThreshold:(BOOL)a3;
- (void)setHasEndOfRouteDistanceThreshold:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOArrivalParameters

- (GEOArrivalParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOArrivalParameters;
  v2 = [(GEOArrivalParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOArrivalParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOArrivalParameters;
  v3 = [(GEOArrivalParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)endOfRouteDistanceThreshold
{
  return self->_endOfRouteDistanceThreshold;
}

- (void)setEndOfRouteDistanceThreshold:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_endOfRouteDistanceThreshold = a3;
}

- (void)setHasEndOfRouteDistanceThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEndOfRouteDistanceThreshold
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readArrivalPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOArrivalParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArrivalPoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)arrivalPoints
{
  -[GEOArrivalParameters _readArrivalPoints]((uint64_t)self);
  arrivalPoints = self->_arrivalPoints;

  return arrivalPoints;
}

- (void)setArrivalPoints:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  arrivalPoints = self->_arrivalPoints;
  self->_arrivalPoints = v4;
}

- (void)clearArrivalPoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  arrivalPoints = self->_arrivalPoints;

  [(NSMutableArray *)arrivalPoints removeAllObjects];
}

- (void)addArrivalPoints:(id)a3
{
  id v4 = a3;
  -[GEOArrivalParameters _readArrivalPoints]((uint64_t)self);
  -[GEOArrivalParameters _addNoFlagsArrivalPoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsArrivalPoints:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)arrivalPointsCount
{
  -[GEOArrivalParameters _readArrivalPoints]((uint64_t)self);
  arrivalPoints = self->_arrivalPoints;

  return [(NSMutableArray *)arrivalPoints count];
}

- (id)arrivalPointsAtIndex:(unint64_t)a3
{
  -[GEOArrivalParameters _readArrivalPoints]((uint64_t)self);
  arrivalPoints = self->_arrivalPoints;

  return (id)[(NSMutableArray *)arrivalPoints objectAtIndex:a3];
}

+ (Class)arrivalPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readArrivalMapRegions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOArrivalParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArrivalMapRegions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)arrivalMapRegions
{
  -[GEOArrivalParameters _readArrivalMapRegions]((uint64_t)self);
  arrivalMapRegions = self->_arrivalMapRegions;

  return arrivalMapRegions;
}

- (void)setArrivalMapRegions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  arrivalMapRegions = self->_arrivalMapRegions;
  self->_arrivalMapRegions = v4;
}

- (void)clearArrivalMapRegions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  arrivalMapRegions = self->_arrivalMapRegions;

  [(NSMutableArray *)arrivalMapRegions removeAllObjects];
}

- (void)addArrivalMapRegions:(id)a3
{
  id v4 = a3;
  -[GEOArrivalParameters _readArrivalMapRegions]((uint64_t)self);
  -[GEOArrivalParameters _addNoFlagsArrivalMapRegions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsArrivalMapRegions:(uint64_t)a1
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

- (unint64_t)arrivalMapRegionsCount
{
  -[GEOArrivalParameters _readArrivalMapRegions]((uint64_t)self);
  arrivalMapRegions = self->_arrivalMapRegions;

  return [(NSMutableArray *)arrivalMapRegions count];
}

- (id)arrivalMapRegionsAtIndex:(unint64_t)a3
{
  -[GEOArrivalParameters _readArrivalMapRegions]((uint64_t)self);
  arrivalMapRegions = self->_arrivalMapRegions;

  return (id)[(NSMutableArray *)arrivalMapRegions objectAtIndex:a3];
}

+ (Class)arrivalMapRegionsType
{
  return (Class)objc_opt_class();
}

- (unsigned)arrivalParametersEndOfRouteDistanceThreshold
{
  return self->_arrivalParametersEndOfRouteDistanceThreshold;
}

- (void)setArrivalParametersEndOfRouteDistanceThreshold:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_arrivalParametersEndOfRouteDistanceThreshold = a3;
}

- (void)setHasArrivalParametersEndOfRouteDistanceThreshold:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasArrivalParametersEndOfRouteDistanceThreshold
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOArrivalParameters;
  id v4 = [(GEOArrivalParameters *)&v8 description];
  id v5 = [(GEOArrivalParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOArrivalParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      id v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
      if (a2) {
        objc_super v6 = @"endOfRouteDistanceThreshold";
      }
      else {
        objc_super v6 = @"end_of_route_distance_threshold";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 32) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v41 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"arrivalPoints";
      }
      else {
        v15 = @"arrival_points";
      }
      [v4 setObject:v7 forKey:v15];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v17 = *(id *)(a1 + 24);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v37 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v36 + 1) + 8 * j);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            v23 = [v22 dictionaryRepresentation];
            }
            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v19);
      }

      if (a2) {
        v24 = @"arrivalMapRegions";
      }
      else {
        v24 = @"arrival_map_regions";
      }
      [v4 setObject:v16 forKey:v24];
    }
    if (*(unsigned char *)(a1 + 60))
    {
      v25 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        v26 = @"arrivalParametersEndOfRouteDistanceThreshold";
      }
      else {
        v26 = @"arrival_parameters_end_of_route_distance_threshold";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = *(void **)(a1 + 16);
    if (v27)
    {
      v28 = [v27 dictionaryRepresentation];
      v29 = v28;
      if (a2)
      {
        v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __50__GEOArrivalParameters__dictionaryRepresentation___block_invoke;
        v34[3] = &unk_1E53D8860;
        id v31 = v30;
        id v35 = v31;
        [v29 enumerateKeysAndObjectsUsingBlock:v34];
        id v32 = v31;

        v29 = v32;
      }
      [v4 setObject:v29 forKey:@"Unknown Fields"];
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
  return -[GEOArrivalParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOArrivalParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOArrivalParameters)initWithDictionary:(id)a3
{
  return (GEOArrivalParameters *)-[GEOArrivalParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"endOfRouteDistanceThreshold";
      }
      else {
        objc_super v6 = @"end_of_route_distance_threshold";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEndOfRouteDistanceThreshold:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        id v8 = @"arrivalPoints";
      }
      else {
        id v8 = @"arrival_points";
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      id v33 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v39 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v16 = [GEOArrivalPoint alloc];
                if (a3) {
                  uint64_t v17 = [(GEOArrivalPoint *)v16 initWithJSON:v15];
                }
                else {
                  uint64_t v17 = [(GEOArrivalPoint *)v16 initWithDictionary:v15];
                }
                uint64_t v18 = (void *)v17;
                [a1 addArrivalPoints:v17];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
          }
          while (v12);
        }

        id v5 = v33;
      }

      if (a3) {
        uint64_t v19 = @"arrivalMapRegions";
      }
      else {
        uint64_t v19 = @"arrival_map_regions";
      }
      uint64_t v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v35 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v34 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v27 = [GEOArrivalRegion alloc];
                if (a3) {
                  uint64_t v28 = [(GEOArrivalRegion *)v27 initWithJSON:v26];
                }
                else {
                  uint64_t v28 = [(GEOArrivalRegion *)v27 initWithDictionary:v26];
                }
                v29 = (void *)v28;
                [a1 addArrivalMapRegions:v28];
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v23);
        }

        id v5 = v33;
      }

      if (a3) {
        v30 = @"arrivalParametersEndOfRouteDistanceThreshold";
      }
      else {
        v30 = @"arrival_parameters_end_of_route_distance_threshold";
      }
      id v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setArrivalParametersEndOfRouteDistanceThreshold:", objc_msgSend(v31, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOArrivalParameters)initWithJSON:(id)a3
{
  return (GEOArrivalParameters *)-[GEOArrivalParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_650;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_651;
    }
    GEOArrivalParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOArrivalParametersCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOArrivalParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOArrivalParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
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
    [(GEOArrivalParameters *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_arrivalPoints;
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
    id v10 = self->_arrivalMapRegions;
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

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  -[GEOArrivalParameters _readArrivalMapRegions]((uint64_t)self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_arrivalMapRegions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v20 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_18;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOArrivalParameters _readArrivalPoints]((uint64_t)self);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_arrivalPoints;
  uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3, (void)v16)) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_18:
    BOOL v14 = 1;
    goto LABEL_19;
  }
LABEL_17:
  BOOL v14 = 0;
LABEL_19:

  return v14;
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOArrivalParameters *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 10) = self->_readerMarkPos;
  *((_DWORD *)v12 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v12 + 14) = self->_endOfRouteDistanceThreshold;
    *((unsigned char *)v12 + 60) |= 2u;
  }
  if ([(GEOArrivalParameters *)self arrivalPointsCount])
  {
    [v12 clearArrivalPoints];
    unint64_t v4 = [(GEOArrivalParameters *)self arrivalPointsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOArrivalParameters *)self arrivalPointsAtIndex:i];
        [v12 addArrivalPoints:v7];
      }
    }
  }
  if ([(GEOArrivalParameters *)self arrivalMapRegionsCount])
  {
    [v12 clearArrivalMapRegions];
    unint64_t v8 = [(GEOArrivalParameters *)self arrivalMapRegionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOArrivalParameters *)self arrivalMapRegionsAtIndex:j];
        [v12 addArrivalMapRegions:v11];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v12 + 13) = self->_arrivalParametersEndOfRouteDistanceThreshold;
    *((unsigned char *)v12 + 60) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOArrivalParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOArrivalParameters *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_endOfRouteDistanceThreshold;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v9 = self->_arrivalPoints;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addArrivalPoints:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v14 = self->_arrivalMapRegions;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        [(id)v5 addArrivalMapRegions:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_arrivalParametersEndOfRouteDistanceThreshold;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  long long v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEOArrivalParameters *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_endOfRouteDistanceThreshold != *((_DWORD *)v4 + 14)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  arrivalPoints = self->_arrivalPoints;
  if ((unint64_t)arrivalPoints | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](arrivalPoints, "isEqual:"))
  {
    goto LABEL_15;
  }
  arrivalMapRegions = self->_arrivalMapRegions;
  if ((unint64_t)arrivalMapRegions | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](arrivalMapRegions, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_arrivalParametersEndOfRouteDistanceThreshold != *((_DWORD *)v4 + 13)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  [(GEOArrivalParameters *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_endOfRouteDistanceThreshold;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_arrivalPoints hash];
  uint64_t v5 = [(NSMutableArray *)self->_arrivalMapRegions hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_arrivalParametersEndOfRouteDistanceThreshold;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    self->_endOfRouteDistanceThreshold = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_flags |= 2u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOArrivalParameters *)self addArrivalPoints:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOArrivalParameters addArrivalMapRegions:](self, "addArrivalMapRegions:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*((unsigned char *)v4 + 60))
  {
    self->_arrivalParametersEndOfRouteDistanceThreshold = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOArrivalParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_655);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOArrivalParameters *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_arrivalPoints;
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
    uint64_t v12 = self->_arrivalMapRegions;
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
  objc_storeStrong((id *)&self->_arrivalPoints, 0);
  objc_storeStrong((id *)&self->_arrivalMapRegions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end