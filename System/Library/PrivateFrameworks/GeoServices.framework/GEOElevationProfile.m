@interface GEOElevationProfile
+ (BOOL)isValid:(id)a3;
+ (Class)pointType;
+ (Class)segmentDescriptionType;
- (BOOL)hasElevationDescription;
- (BOOL)hasMinimumVisibleElevationRange;
- (BOOL)hasSumElevationGainCm;
- (BOOL)hasSumElevationLossCm;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOElevationProfile)init;
- (GEOElevationProfile)initWithData:(id)a3;
- (GEOElevationProfile)initWithDictionary:(id)a3;
- (GEOElevationProfile)initWithJSON:(id)a3;
- (GEOFormattedString)elevationDescription;
- (GEOMinimumVisibleElevationRange)minimumVisibleElevationRange;
- (NSMutableArray)points;
- (NSMutableArray)segmentDescriptions;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)pointAtIndex:(unint64_t)a3;
- (id)segmentDescriptionAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pointsCount;
- (unint64_t)segmentDescriptionsCount;
- (unsigned)sumElevationGainCm;
- (unsigned)sumElevationLossCm;
- (void)_addNoFlagsPoint:(uint64_t)a1;
- (void)_addNoFlagsSegmentDescription:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readElevationDescription;
- (void)_readMinimumVisibleElevationRange;
- (void)_readPoints;
- (void)_readSegmentDescriptions;
- (void)addPoint:(id)a3;
- (void)addSegmentDescription:(id)a3;
- (void)clearPoints;
- (void)clearSegmentDescriptions;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setElevationDescription:(id)a3;
- (void)setHasSumElevationGainCm:(BOOL)a3;
- (void)setHasSumElevationLossCm:(BOOL)a3;
- (void)setMinimumVisibleElevationRange:(id)a3;
- (void)setPoints:(id)a3;
- (void)setSegmentDescriptions:(id)a3;
- (void)setSumElevationGainCm:(unsigned int)a3;
- (void)setSumElevationLossCm:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOElevationProfile

- (GEOElevationProfile)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOElevationProfile;
  v2 = [(GEOElevationProfile *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOElevationProfile)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOElevationProfile;
  v3 = [(GEOElevationProfile *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOElevationProfileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)points
{
  -[GEOElevationProfile _readPoints]((uint64_t)self);
  points = self->_points;

  return points;
}

- (void)setPoints:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  points = self->_points;
  self->_points = v4;
}

- (void)clearPoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  points = self->_points;

  [(NSMutableArray *)points removeAllObjects];
}

- (void)addPoint:(id)a3
{
  id v4 = a3;
  -[GEOElevationProfile _readPoints]((uint64_t)self);
  -[GEOElevationProfile _addNoFlagsPoint:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsPoint:(uint64_t)a1
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

- (unint64_t)pointsCount
{
  -[GEOElevationProfile _readPoints]((uint64_t)self);
  points = self->_points;

  return [(NSMutableArray *)points count];
}

- (id)pointAtIndex:(unint64_t)a3
{
  -[GEOElevationProfile _readPoints]((uint64_t)self);
  points = self->_points;

  return (id)[(NSMutableArray *)points objectAtIndex:a3];
}

+ (Class)pointType
{
  return (Class)objc_opt_class();
}

- (unsigned)sumElevationGainCm
{
  return self->_sumElevationGainCm;
}

- (void)setSumElevationGainCm:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_sumElevationGainCm = a3;
}

- (void)setHasSumElevationGainCm:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasSumElevationGainCm
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)sumElevationLossCm
{
  return self->_sumElevationLossCm;
}

- (void)setSumElevationLossCm:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_sumElevationLossCm = a3;
}

- (void)setHasSumElevationLossCm:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSumElevationLossCm
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readMinimumVisibleElevationRange
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOElevationProfileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMinimumVisibleElevationRange_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMinimumVisibleElevationRange
{
  return self->_minimumVisibleElevationRange != 0;
}

- (GEOMinimumVisibleElevationRange)minimumVisibleElevationRange
{
  -[GEOElevationProfile _readMinimumVisibleElevationRange]((uint64_t)self);
  minimumVisibleElevationRange = self->_minimumVisibleElevationRange;

  return minimumVisibleElevationRange;
}

- (void)setMinimumVisibleElevationRange:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_minimumVisibleElevationRange, a3);
}

- (void)_readSegmentDescriptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOElevationProfileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSegmentDescriptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)segmentDescriptions
{
  -[GEOElevationProfile _readSegmentDescriptions]((uint64_t)self);
  segmentDescriptions = self->_segmentDescriptions;

  return segmentDescriptions;
}

- (void)setSegmentDescriptions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  segmentDescriptions = self->_segmentDescriptions;
  self->_segmentDescriptions = v4;
}

- (void)clearSegmentDescriptions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  segmentDescriptions = self->_segmentDescriptions;

  [(NSMutableArray *)segmentDescriptions removeAllObjects];
}

- (void)addSegmentDescription:(id)a3
{
  id v4 = a3;
  -[GEOElevationProfile _readSegmentDescriptions]((uint64_t)self);
  -[GEOElevationProfile _addNoFlagsSegmentDescription:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsSegmentDescription:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)segmentDescriptionsCount
{
  -[GEOElevationProfile _readSegmentDescriptions]((uint64_t)self);
  segmentDescriptions = self->_segmentDescriptions;

  return [(NSMutableArray *)segmentDescriptions count];
}

- (id)segmentDescriptionAtIndex:(unint64_t)a3
{
  -[GEOElevationProfile _readSegmentDescriptions]((uint64_t)self);
  segmentDescriptions = self->_segmentDescriptions;

  return (id)[(NSMutableArray *)segmentDescriptions objectAtIndex:a3];
}

+ (Class)segmentDescriptionType
{
  return (Class)objc_opt_class();
}

- (void)_readElevationDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOElevationProfileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readElevationDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasElevationDescription
{
  return self->_elevationDescription != 0;
}

- (GEOFormattedString)elevationDescription
{
  -[GEOElevationProfile _readElevationDescription]((uint64_t)self);
  elevationDescription = self->_elevationDescription;

  return elevationDescription;
}

- (void)setElevationDescription:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_elevationDescription, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOElevationProfile;
  id v4 = [(GEOElevationProfile *)&v8 description];
  id v5 = [(GEOElevationProfile *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOElevationProfile _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 40) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v49 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"point"];
    }
    char v13 = *(unsigned char *)(a1 + 76);
    if (v13)
    {
      v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        v15 = @"sumElevationGainCm";
      }
      else {
        v15 = @"sum_elevation_gain_cm";
      }
      [v4 setObject:v14 forKey:v15];

      char v13 = *(unsigned char *)(a1 + 76);
    }
    if ((v13 & 2) != 0)
    {
      v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
      if (a2) {
        v17 = @"sumElevationLossCm";
      }
      else {
        v17 = @"sum_elevation_loss_cm";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [(id)a1 minimumVisibleElevationRange];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"minimumVisibleElevationRange";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"minimum_visible_elevation_range";
      }
      [v4 setObject:v20 forKey:v21];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v23 = *(id *)(a1 + 48);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v45 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v44 + 1) + 8 * j);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            v29 = [v28 dictionaryRepresentation];
            }
            [v22 addObject:v29];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v25);
      }

      if (a2) {
        v30 = @"segmentDescription";
      }
      else {
        v30 = @"segment_description";
      }
      [v4 setObject:v22 forKey:v30];
    }
    v31 = [(id)a1 elevationDescription];
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        v33 = [v31 jsonRepresentation];
        v34 = @"elevationDescription";
      }
      else
      {
        v33 = [v31 dictionaryRepresentation];
        v34 = @"elevation_description";
      }
      [v4 setObject:v33 forKey:v34];
    }
    v35 = *(void **)(a1 + 16);
    if (v35)
    {
      v36 = [v35 dictionaryRepresentation];
      v37 = v36;
      if (a2)
      {
        v38 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __49__GEOElevationProfile__dictionaryRepresentation___block_invoke;
        v42[3] = &unk_1E53D8860;
        id v39 = v38;
        id v43 = v39;
        [v37 enumerateKeysAndObjectsUsingBlock:v42];
        id v40 = v39;

        v37 = v40;
      }
      [v4 setObject:v37 forKey:@"Unknown Fields"];
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
  return -[GEOElevationProfile _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOElevationProfile__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOElevationProfile)initWithDictionary:(id)a3
{
  return (GEOElevationProfile *)-[GEOElevationProfile _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"point"];
      objc_opt_class();
      id v42 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v52 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v48 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v47 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v13 = [GEOPoint alloc];
                if (a3) {
                  uint64_t v14 = [(GEOPoint *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOPoint *)v13 initWithDictionary:v12];
                }
                v15 = (void *)v14;
                [a1 addPoint:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v47 objects:v52 count:16];
          }
          while (v9);
        }

        id v5 = v42;
      }

      if (a3) {
        v16 = @"sumElevationGainCm";
      }
      else {
        v16 = @"sum_elevation_gain_cm";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSumElevationGainCm:", objc_msgSend(v17, "unsignedIntValue"));
      }

      if (a3) {
        v18 = @"sumElevationLossCm";
      }
      else {
        v18 = @"sum_elevation_loss_cm";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSumElevationLossCm:", objc_msgSend(v19, "unsignedIntValue"));
      }

      if (a3) {
        v20 = @"minimumVisibleElevationRange";
      }
      else {
        v20 = @"minimum_visible_elevation_range";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [GEOMinimumVisibleElevationRange alloc];
        if (a3) {
          uint64_t v23 = [(GEOMinimumVisibleElevationRange *)v22 initWithJSON:v21];
        }
        else {
          uint64_t v23 = [(GEOMinimumVisibleElevationRange *)v22 initWithDictionary:v21];
        }
        uint64_t v24 = (void *)v23;
        [a1 setMinimumVisibleElevationRange:v23];
      }
      if (a3) {
        uint64_t v25 = @"segmentDescription";
      }
      else {
        uint64_t v25 = @"segment_description";
      }
      uint64_t v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v44;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v44 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void *)(*((void *)&v43 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v33 = [GEOElevationSegmentDescription alloc];
                if (a3) {
                  uint64_t v34 = [(GEOElevationSegmentDescription *)v33 initWithJSON:v32];
                }
                else {
                  uint64_t v34 = [(GEOElevationSegmentDescription *)v33 initWithDictionary:v32];
                }
                v35 = (void *)v34;
                [a1 addSegmentDescription:v34];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v29);
        }

        id v5 = v42;
      }

      if (a3) {
        v36 = @"elevationDescription";
      }
      else {
        v36 = @"elevation_description";
      }
      v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v38 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v39 = [(GEOFormattedString *)v38 initWithJSON:v37];
        }
        else {
          uint64_t v39 = [(GEOFormattedString *)v38 initWithDictionary:v37];
        }
        id v40 = (void *)v39;
        [a1 setElevationDescription:v39];
      }
    }
  }

  return a1;
}

- (GEOElevationProfile)initWithJSON:(id)a3
{
  return (GEOElevationProfile *)-[GEOElevationProfile _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_2054;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_2055;
    }
    GEOElevationProfileReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOElevationProfileCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOElevationProfileIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOElevationProfileReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOElevationProfileIsDirty((uint64_t)self) & 1) == 0)
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOElevationProfile *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = self->_points;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_minimumVisibleElevationRange) {
      PBDataWriterWriteSubmessage();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v11 = self->_segmentDescriptions;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }

    if (self->_elevationDescription) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v13 = (id *)a3;
  [(GEOElevationProfile *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 14) = self->_readerMarkPos;
  *((_DWORD *)v13 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOElevationProfile *)self pointsCount])
  {
    [v13 clearPoints];
    unint64_t v4 = [(GEOElevationProfile *)self pointsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOElevationProfile *)self pointAtIndex:i];
        [v13 addPoint:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v13 + 17) = self->_sumElevationGainCm;
    *((unsigned char *)v13 + 76) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v13 + 18) = self->_sumElevationLossCm;
    *((unsigned char *)v13 + 76) |= 2u;
  }
  if (self->_minimumVisibleElevationRange) {
    objc_msgSend(v13, "setMinimumVisibleElevationRange:");
  }
  if ([(GEOElevationProfile *)self segmentDescriptionsCount])
  {
    [v13 clearSegmentDescriptions];
    unint64_t v9 = [(GEOElevationProfile *)self segmentDescriptionsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(GEOElevationProfile *)self segmentDescriptionAtIndex:j];
        [v13 addSegmentDescription:v12];
      }
    }
  }
  if (self->_elevationDescription) {
    objc_msgSend(v13, "setElevationDescription:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOElevationProfileReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOElevationProfile *)self readAll:0];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v9 = self->_points;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addPoint:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 68) = self->_sumElevationGainCm;
    *(unsigned char *)(v5 + 76) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_sumElevationLossCm;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  id v15 = [(GEOMinimumVisibleElevationRange *)self->_minimumVisibleElevationRange copyWithZone:a3];
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v17 = self->_segmentDescriptions;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v17);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "copyWithZone:", a3, (void)v26);
        [(id)v5 addSegmentDescription:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v18);
  }

  id v22 = [(GEOFormattedString *)self->_elevationDescription copyWithZone:a3];
  long long v23 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v22;

  long long v24 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v24;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEOElevationProfile *)self readAll:1];
  [v4 readAll:1];
  points = self->_points;
  if ((unint64_t)points | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](points, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_sumElevationGainCm != *((_DWORD *)v4 + 17)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_sumElevationLossCm != *((_DWORD *)v4 + 18)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_20;
  }
  minimumVisibleElevationRange = self->_minimumVisibleElevationRange;
  if ((unint64_t)minimumVisibleElevationRange | *((void *)v4 + 4)
    && !-[GEOMinimumVisibleElevationRange isEqual:](minimumVisibleElevationRange, "isEqual:"))
  {
    goto LABEL_20;
  }
  segmentDescriptions = self->_segmentDescriptions;
  if ((unint64_t)segmentDescriptions | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](segmentDescriptions, "isEqual:")) {
      goto LABEL_20;
    }
  }
  elevationDescription = self->_elevationDescription;
  if ((unint64_t)elevationDescription | *((void *)v4 + 3)) {
    char v9 = -[GEOFormattedString isEqual:](elevationDescription, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  [(GEOElevationProfile *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_points hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_sumElevationGainCm;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_sumElevationLossCm;
LABEL_6:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(GEOMinimumVisibleElevationRange *)self->_minimumVisibleElevationRange hash];
  uint64_t v7 = [(NSMutableArray *)self->_segmentDescriptions hash];
  return v6 ^ v7 ^ [(GEOFormattedString *)self->_elevationDescription hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOElevationProfile *)self addPoint:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 76);
  if (v10)
  {
    self->_sumElevationGainCm = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 1u;
    char v10 = *((unsigned char *)v4 + 76);
  }
  if ((v10 & 2) != 0)
  {
    self->_sumElevationLossCm = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_flags |= 2u;
  }
  minimumVisibleElevationRange = self->_minimumVisibleElevationRange;
  uint64_t v12 = *((void *)v4 + 4);
  if (minimumVisibleElevationRange)
  {
    if (v12) {
      -[GEOMinimumVisibleElevationRange mergeFrom:](minimumVisibleElevationRange, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEOElevationProfile setMinimumVisibleElevationRange:](self, "setMinimumVisibleElevationRange:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = *((id *)v4 + 6);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        -[GEOElevationProfile addSegmentDescription:](self, "addSegmentDescription:", *(void *)(*((void *)&v20 + 1) + 8 * j), (void)v20);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  elevationDescription = self->_elevationDescription;
  uint64_t v19 = *((void *)v4 + 3);
  if (elevationDescription)
  {
    if (v19) {
      -[GEOFormattedString mergeFrom:](elevationDescription, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[GEOElevationProfile setElevationDescription:](self, "setElevationDescription:");
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
      GEOElevationProfileReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2059);
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
  *(unsigned char *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOElevationProfile *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_points;
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

    [(GEOMinimumVisibleElevationRange *)self->_minimumVisibleElevationRange clearUnknownFields:1];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = self->_segmentDescriptions;
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

    [(GEOFormattedString *)self->_elevationDescription clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentDescriptions, 0);
  objc_storeStrong((id *)&self->_points, 0);
  objc_storeStrong((id *)&self->_minimumVisibleElevationRange, 0);
  objc_storeStrong((id *)&self->_elevationDescription, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end