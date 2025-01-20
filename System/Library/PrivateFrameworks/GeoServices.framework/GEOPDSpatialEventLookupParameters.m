@interface GEOPDSpatialEventLookupParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSpatialEventLookupParameters)init;
- (GEOPDSpatialEventLookupParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_readCategoryFilters;
- (void)_readCenter;
- (void)addCategoryFilter:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setCenter:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSpatialEventLookupParameters

- (GEOPDSpatialEventLookupParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSpatialEventLookupParameters;
  v2 = [(GEOPDSpatialEventLookupParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSpatialEventLookupParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSpatialEventLookupParameters;
  v3 = [(GEOPDSpatialEventLookupParameters *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSpatialEventLookupParameters;
  [(GEOPDSpatialEventLookupParameters *)&v3 dealloc];
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 76));
    if ((*(unsigned char *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_8556);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
  }
}

- (void)setCenter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 88) |= 0x20u;
    *(unsigned char *)(a1 + 88) |= 0x40u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)_readCategoryFilters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 76));
    if ((*(unsigned char *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryFilters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
  }
}

- (void)addCategoryFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSpatialEventLookupParameters _readCategoryFilters](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 88) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
    *(unsigned char *)(a1 + 88) |= 0x40u;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSpatialEventLookupParameters;
  id v4 = [(GEOPDSpatialEventLookupParameters *)&v8 description];
  v5 = [(GEOPDSpatialEventLookupParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSpatialEventLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSpatialEventLookupParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    -[GEOPDSpatialEventLookupParameters _readCenter](a1);
    id v5 = *(id *)(a1 + 48);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"center"];
    }
    char v8 = *(unsigned char *)(a1 + 88);
    if ((v8 & 4) != 0)
    {
      v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 84)];
      [v4 setObject:v9 forKey:@"radius"];

      char v8 = *(unsigned char *)(a1 + 88);
    }
    if ((v8 & 2) != 0)
    {
      v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
      [v4 setObject:v10 forKey:@"count"];
    }
    if (*(void *)(a1 + 32))
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v12 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v13 = 0;
        do
        {
          uint64_t v14 = *(int *)(*v12 + 4 * v13);
          if (v14 >= 0xE)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = off_1E53E40F8[v14];
          }
          [v11 addObject:v15];

          ++v13;
          v12 = (void *)(a1 + 24);
        }
        while (v13 < *(void *)(a1 + 32));
      }
      if (a2) {
        v16 = @"categoryFilter";
      }
      else {
        v16 = @"category_filter";
      }
      [v4 setObject:v11 forKey:v16];
    }
    if (*(unsigned char *)(a1 + 88))
    {
      if (a2) {
        v17 = @"timeRange";
      }
      else {
        v17 = @"time_range";
      }
      v18 = _GEOPDTimeRangeDictionaryRepresentation((unsigned int *)(a1 + 56), a2);
      [v4 setObject:v18 forKey:v17];
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
        v26[2] = __63__GEOPDSpatialEventLookupParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDSpatialEventLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 76));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_8566;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_8567;
      }
      GEOPDSpatialEventLookupParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 48) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
  }
}

void __63__GEOPDSpatialEventLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    char v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    char v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = [a1 init];
    if (v6)
    {
      objc_super v7 = [v5 objectForKeyedSubscript:@"center"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v8 = [GEOLatLng alloc];
        if (a3) {
          v9 = [(GEOLatLng *)v8 initWithJSON:v7];
        }
        else {
          v9 = [(GEOLatLng *)v8 initWithDictionary:v7];
        }
        id v10 = v9;
        -[GEOPDSpatialEventLookupParameters setCenter:](v6, v9);
      }
      v11 = [v5 objectForKeyedSubscript:@"radius"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v12 = [v11 intValue];
        *(unsigned char *)(v6 + 88) |= 0x40u;
        *(unsigned char *)(v6 + 88) |= 4u;
        *(_DWORD *)(v6 + 84) = v12;
      }

      unint64_t v13 = [v5 objectForKeyedSubscript:@"count"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v14 = [v13 intValue];
        *(unsigned char *)(v6 + 88) |= 0x40u;
        *(unsigned char *)(v6 + 88) |= 2u;
        *(_DWORD *)(v6 + 80) = v14;
      }

      if (a3) {
        v15 = @"categoryFilter";
      }
      else {
        v15 = @"category_filter";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v30 = a3;
        id v31 = v5;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        v29 = v16;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (!v18) {
          goto LABEL_43;
        }
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v35;
        while (1)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v23 = v22;
              if (([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_UNKNOWN"] & 1) == 0
                && ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_ARTSANDMUSEUMS"] & 1) == 0
                && ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_BUSINESSANDTECHNOLOGY"] & 1) == 0
                && ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_COMMUNITY"] & 1) == 0
                && ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_DANCE"] & 1) == 0
                && ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_EDUCATIONAL"] & 1) == 0
                && ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_FAMILYEVENTS"] & 1) == 0
                && ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_FESTIVALSANDFAIRS"] & 1) == 0
                && ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_MUSICCONCERTS"] & 1) == 0
                && ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_NIGHTLIFE"] & 1) == 0
                && ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_SPORTS"] & 1) == 0
                && ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_THEATER"] & 1) == 0
                && ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_TOURS"] & 1) == 0)
              {
                [v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_APPLEEVENT"];
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              [v22 intValue];
            }
            -[GEOPDSpatialEventLookupParameters addCategoryFilter:](v6);
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (!v19)
          {
LABEL_43:

            id v5 = v31;
            a3 = v30;
            v16 = v29;
            break;
          }
        }
      }

      if (a3) {
        id v24 = @"timeRange";
      }
      else {
        id v24 = @"time_range";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v33 = 0;
        uint64_t v32 = 0;
        _GEOPDTimeRangeFromDictionaryRepresentation(v25, (uint64_t)&v32, a3);
        uint64_t v26 = v32;
        *(unsigned char *)(v6 + 88) |= 0x40u;
        *(unsigned char *)(v6 + 88) |= 1u;
        int v27 = v33;
        *(void *)(v6 + 56) = v26;
        *(_DWORD *)(v6 + 64) = v27;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSpatialEventLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x70) == 0))
  {
    char v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSpatialEventLookupParameters readAll:]((uint64_t)self, 0);
    if (self->_center) {
      PBDataWriterWriteSubmessage();
    }
    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_categoryFilters.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_categoryFilters.count);
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterPlaceMark();
      GEOPDTimeRangeWriteTo((uint64_t)&self->_timeRange);
      PBDataWriterRecallMark();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSpatialEventLookupParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSpatialEventLookupParameters readAll:]((uint64_t)self, 0);
  id v9 = [(GEOLatLng *)self->_center copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_radius;
    *(unsigned char *)(v5 + 88) |= 4u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_count;
    *(unsigned char *)(v5 + 88) |= 2u;
  }
  PBRepeatedInt32Copy();
  if (*(unsigned char *)&self->_flags)
  {
    $B85216D09A238EDB5177F50F3CAD2EB5 has = self->_timeRange._has;
    *(void *)(v5 + 56) = *(void *)&self->_timeRange._duration;
    *($B85216D09A238EDB5177F50F3CAD2EB5 *)(v5 + 64) = has;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
  unint64_t v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned int *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  -[GEOPDSpatialEventLookupParameters readAll:]((uint64_t)self, 1);
  -[GEOPDSpatialEventLookupParameters readAll:]((uint64_t)v4, 1);
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 6))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v4[22] & 4) == 0 || self->_radius != v4[21]) {
      goto LABEL_21;
    }
  }
  else if ((v4[22] & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[22] & 2) == 0 || self->_count != v4[20]) {
      goto LABEL_21;
    }
  }
  else if ((v4[22] & 2) != 0)
  {
    goto LABEL_21;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_21:
    BOOL v6 = 0;
    goto LABEL_22;
  }
  BOOL v6 = (v4[22] & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[22] & 1) != 0
      && *(void *)&self->_timeRange._duration == *((void *)v4 + 7)
      && *(_DWORD *)&self->_timeRange._has == (unint64_t)v4[16])
    {
      BOOL v6 = 1;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_22:

  return v6;
}

- (unint64_t)hash
{
  -[GEOPDSpatialEventLookupParameters readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOLatLng *)self->_center hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_radius;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_count;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  uint64_t v6 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v7 = PBHashBytes();
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 88) |= 8u;
    *(unsigned char *)(a1 + 88) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSpatialEventLookupParameters readAll:](a1, 0);
      uint64_t v5 = *(void **)(a1 + 48);
      [v5 clearUnknownFields:1];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end