@interface GEOPDSpatialEventLookupResponse
+ (BOOL)isValid:(id)a3;
+ (Class)eventDateTimeType;
- (BOOL)hasCenter;
- (BOOL)hasEventId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPoiId;
- (BOOL)hasTimezone;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)center;
- (GEOPDMapsIdentifier)eventId;
- (GEOPDMapsIdentifier)poiId;
- (GEOPDSpatialEventLookupResponse)init;
- (GEOPDSpatialEventLookupResponse)initWithData:(id)a3;
- (GEOPDSpatialEventLookupResponse)initWithDictionary:(id)a3;
- (GEOPDSpatialEventLookupResponse)initWithJSON:(id)a3;
- (GEOTimezone)timezone;
- (NSMutableArray)eventDateTimes;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)categorysAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventDateTimeAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (int)StringAsCategorys:(id)a3;
- (int)categoryAtIndex:(unint64_t)a3;
- (int)categorys;
- (unint64_t)categorysCount;
- (unint64_t)eventDateTimesCount;
- (unint64_t)hash;
- (void)_addNoFlagsEventDateTime:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCategorys;
- (void)_readCenter;
- (void)_readEventDateTimes;
- (void)_readEventId;
- (void)_readPoiId;
- (void)_readTimezone;
- (void)addCategory:(int)a3;
- (void)addEventDateTime:(id)a3;
- (void)clearCategorys;
- (void)clearEventDateTimes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCategorys:(int *)a3 count:(unint64_t)a4;
- (void)setCenter:(id)a3;
- (void)setEventDateTimes:(id)a3;
- (void)setEventId:(id)a3;
- (void)setPoiId:(id)a3;
- (void)setTimezone:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSpatialEventLookupResponse

- (GEOPDSpatialEventLookupResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSpatialEventLookupResponse;
  v2 = [(GEOPDSpatialEventLookupResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSpatialEventLookupResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSpatialEventLookupResponse;
  v3 = [(GEOPDSpatialEventLookupResponse *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOPDSpatialEventLookupResponse;
  [(GEOPDSpatialEventLookupResponse *)&v3 dealloc];
}

- (void)_readEventId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEventId_tags_8581);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasEventId
{
  return self->_eventId != 0;
}

- (GEOPDMapsIdentifier)eventId
{
  -[GEOPDSpatialEventLookupResponse _readEventId]((uint64_t)self);
  eventId = self->_eventId;

  return eventId;
}

- (void)setEventId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_eventId, a3);
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_8582);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasCenter
{
  return self->_center != 0;
}

- (GEOLatLng)center
{
  -[GEOPDSpatialEventLookupResponse _readCenter]((uint64_t)self);
  center = self->_center;

  return center;
}

- (void)setCenter:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (void)_readCategorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategorys_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (unint64_t)categorysCount
{
  return self->_categorys.count;
}

- (int)categorys
{
  return self->_categorys.list;
}

- (void)clearCategorys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;

  PBRepeatedInt32Clear();
}

- (void)addCategory:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (int)categoryAtIndex:(unint64_t)a3
{
  -[GEOPDSpatialEventLookupResponse _readCategorys]((uint64_t)self);
  p_categorys = &self->_categorys;
  unint64_t count = self->_categorys.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_categorys->list[a3];
}

- (void)setCategorys:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;

  MEMORY[0x1F4147390](&self->_categorys, a3, a4);
}

- (id)categorysAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E40F8[a3];
  }

  return v3;
}

- (int)StringAsCategorys:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_ARTSANDMUSEUMS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_BUSINESSANDTECHNOLOGY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_COMMUNITY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_DANCE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_EDUCATIONAL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_FAMILYEVENTS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_FESTIVALSANDFAIRS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_MUSICCONCERTS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_NIGHTLIFE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_SPORTS"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_THEATER"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_TOURS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_APPLEEVENT"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readEventDateTimes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEventDateTimes_tags_8583);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)eventDateTimes
{
  -[GEOPDSpatialEventLookupResponse _readEventDateTimes]((uint64_t)self);
  eventDateTimes = self->_eventDateTimes;

  return eventDateTimes;
}

- (void)setEventDateTimes:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  eventDateTimes = self->_eventDateTimes;
  self->_eventDateTimes = v4;
}

- (void)clearEventDateTimes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  eventDateTimes = self->_eventDateTimes;

  [(NSMutableArray *)eventDateTimes removeAllObjects];
}

- (void)addEventDateTime:(id)a3
{
  id v4 = a3;
  -[GEOPDSpatialEventLookupResponse _readEventDateTimes]((uint64_t)self);
  -[GEOPDSpatialEventLookupResponse _addNoFlagsEventDateTime:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsEventDateTime:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)eventDateTimesCount
{
  -[GEOPDSpatialEventLookupResponse _readEventDateTimes]((uint64_t)self);
  eventDateTimes = self->_eventDateTimes;

  return [(NSMutableArray *)eventDateTimes count];
}

- (id)eventDateTimeAtIndex:(unint64_t)a3
{
  -[GEOPDSpatialEventLookupResponse _readEventDateTimes]((uint64_t)self);
  eventDateTimes = self->_eventDateTimes;

  return (id)[(NSMutableArray *)eventDateTimes objectAtIndex:a3];
}

+ (Class)eventDateTimeType
{
  return (Class)objc_opt_class();
}

- (void)_readTimezone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimezone_tags_8584);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTimezone
{
  return self->_timezone != 0;
}

- (GEOTimezone)timezone
{
  -[GEOPDSpatialEventLookupResponse _readTimezone]((uint64_t)self);
  timezone = self->_timezone;

  return timezone;
}

- (void)setTimezone:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_timezone, a3);
}

- (void)_readPoiId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasPoiId
{
  return self->_poiId != 0;
}

- (GEOPDMapsIdentifier)poiId
{
  -[GEOPDSpatialEventLookupResponse _readPoiId]((uint64_t)self);
  poiId = self->_poiId;

  return poiId;
}

- (void)setPoiId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_poiId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSpatialEventLookupResponse;
  id v4 = [(GEOPDSpatialEventLookupResponse *)&v8 description];
  id v5 = [(GEOPDSpatialEventLookupResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSpatialEventLookupResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 eventId];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"eventId";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"event_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 center];
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"center"];
    }
    if (*(void *)(a1 + 32))
    {
      v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v13 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v14 = 0;
        do
        {
          uint64_t v15 = *(int *)(*v13 + 4 * v14);
          if (v15 >= 0xE)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = off_1E53E40F8[v15];
          }
          [v12 addObject:v16];

          ++v14;
          v13 = (void *)(a1 + 24);
        }
        while (v14 < *(void *)(a1 + 32));
      }
      [v4 setObject:v12 forKey:@"category"];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v18 = *(id *)(a1 + 56);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v43 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v20);
      }

      if (a2) {
        v25 = @"eventDateTime";
      }
      else {
        v25 = @"event_date_time";
      }
      [v4 setObject:v17 forKey:v25];
    }
    v26 = [(id)a1 timezone];
    v27 = v26;
    if (v26)
    {
      if (a2) {
        [v26 jsonRepresentation];
      }
      else {
      v28 = [v26 dictionaryRepresentation];
      }
      [v4 setObject:v28 forKey:@"timezone"];
    }
    v29 = [(id)a1 poiId];
    v30 = v29;
    if (v29)
    {
      if (a2)
      {
        v31 = [v29 jsonRepresentation];
        v32 = @"poiId";
      }
      else
      {
        v31 = [v29 dictionaryRepresentation];
        v32 = @"poi_id";
      }
      [v4 setObject:v31 forKey:v32];
    }
    v33 = *(void **)(a1 + 16);
    if (v33)
    {
      v34 = [v33 dictionaryRepresentation];
      v35 = v34;
      if (a2)
      {
        v36 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __61__GEOPDSpatialEventLookupResponse__dictionaryRepresentation___block_invoke;
        v40[3] = &unk_1E53D8860;
        id v37 = v36;
        id v41 = v37;
        [v35 enumerateKeysAndObjectsUsingBlock:v40];
        id v38 = v37;

        v35 = v38;
      }
      [v4 setObject:v35 forKey:@"Unknown Fields"];
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
  return -[GEOPDSpatialEventLookupResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __61__GEOPDSpatialEventLookupResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDSpatialEventLookupResponse)initWithDictionary:(id)a3
{
  return (GEOPDSpatialEventLookupResponse *)-[GEOPDSpatialEventLookupResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = (void *)[a1 init];
    if (v6)
    {
      if (a3) {
        id v7 = @"eventId";
      }
      else {
        id v7 = @"event_id";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [GEOPDMapsIdentifier alloc];
        if (a3) {
          uint64_t v10 = [(GEOPDMapsIdentifier *)v9 initWithJSON:v8];
        }
        else {
          uint64_t v10 = [(GEOPDMapsIdentifier *)v9 initWithDictionary:v8];
        }
        v11 = (void *)v10;
        [v6 setEventId:v10];
      }
      v12 = [v5 objectForKeyedSubscript:@"center"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v14 = [(GEOLatLng *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOLatLng *)v13 initWithDictionary:v12];
        }
        uint64_t v15 = (void *)v14;
        [v6 setCenter:v14];
      }
      v16 = [v5 objectForKeyedSubscript:@"category"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v46 = a3;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v45 = v16;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (!v18) {
          goto LABEL_58;
        }
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v52;
        while (1)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v52 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v23 = v22;
              if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_UNKNOWN"])
              {
                uint64_t v24 = 0;
              }
              else if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_ARTSANDMUSEUMS"])
              {
                uint64_t v24 = 1;
              }
              else if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_BUSINESSANDTECHNOLOGY"])
              {
                uint64_t v24 = 2;
              }
              else if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_COMMUNITY"])
              {
                uint64_t v24 = 3;
              }
              else if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_DANCE"])
              {
                uint64_t v24 = 4;
              }
              else if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_EDUCATIONAL"])
              {
                uint64_t v24 = 5;
              }
              else if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_FAMILYEVENTS"])
              {
                uint64_t v24 = 6;
              }
              else if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_FESTIVALSANDFAIRS"])
              {
                uint64_t v24 = 7;
              }
              else if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_MUSICCONCERTS"])
              {
                uint64_t v24 = 8;
              }
              else if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_NIGHTLIFE"])
              {
                uint64_t v24 = 9;
              }
              else if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_SPORTS"])
              {
                uint64_t v24 = 10;
              }
              else if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_THEATER"])
              {
                uint64_t v24 = 11;
              }
              else if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_TOURS"])
              {
                uint64_t v24 = 12;
              }
              else if ([v23 isEqualToString:@"SPATIAL_EVENT_LOOKUP_CATEGORY_APPLEEVENT"])
              {
                uint64_t v24 = 13;
              }
              else
              {
                uint64_t v24 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v24 = [v22 intValue];
            }
            [v6 addCategory:v24];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v51 objects:v56 count:16];
          if (!v19)
          {
LABEL_58:

            a3 = v46;
            v16 = v45;
            break;
          }
        }
      }

      if (a3) {
        v25 = @"eventDateTime";
      }
      else {
        v25 = @"event_date_time";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v48;
          do
          {
            uint64_t v31 = 0;
            do
            {
              if (*(void *)v48 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v47 + 1) + 8 * v31);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v33 = [GEOPDDateTimeRange alloc];
                if (v33) {
                  v34 = (void *)-[GEOPDDateTimeRange _initWithDictionary:isJSON:](v33, v32, a3);
                }
                else {
                  v34 = 0;
                }
                [v6 addEventDateTime:v34];
              }
              ++v31;
            }
            while (v29 != v31);
            uint64_t v35 = [v27 countByEnumeratingWithState:&v47 objects:v55 count:16];
            uint64_t v29 = v35;
          }
          while (v35);
        }
      }
      v36 = [v5 objectForKeyedSubscript:@"timezone"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v37 = [GEOTimezone alloc];
        if (v37) {
          id v38 = -[GEOTimezone _initWithDictionary:isJSON:](v37, v36);
        }
        else {
          id v38 = 0;
        }
        [v6 setTimezone:v38];
      }
      if (a3) {
        v39 = @"poiId";
      }
      else {
        v39 = @"poi_id";
      }
      v40 = [v5 objectForKeyedSubscript:v39];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v41 = [GEOPDMapsIdentifier alloc];
        if (a3) {
          uint64_t v42 = [(GEOPDMapsIdentifier *)v41 initWithJSON:v40];
        }
        else {
          uint64_t v42 = [(GEOPDMapsIdentifier *)v41 initWithDictionary:v40];
        }
        long long v43 = (void *)v42;
        [v6 setPoiId:v42];
      }
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (GEOPDSpatialEventLookupResponse)initWithJSON:(id)a3
{
  return (GEOPDSpatialEventLookupResponse *)-[GEOPDSpatialEventLookupResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_8585;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_8586;
    }
    GEOPDSpatialEventLookupResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDSpatialEventLookupResponseCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDSpatialEventLookupResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSpatialEventLookupResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 1u))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDSpatialEventLookupResponse *)self readAll:0];
    if (self->_eventId) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_center) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_categorys.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_categorys.count);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_eventDateTimes;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    if (self->_timezone) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_poiId) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPDSpatialEventLookupResponse _readCenter]((uint64_t)self);
  if ([(GEOLatLng *)self->_center hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDSpatialEventLookupResponse _readEventId]((uint64_t)self);
  if ([(GEOPDMapsIdentifier *)self->_eventId hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDSpatialEventLookupResponse _readPoiId]((uint64_t)self);
  poiId = self->_poiId;

  return [(GEOPDMapsIdentifier *)poiId hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v12 = (id *)a3;
  [(GEOPDSpatialEventLookupResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 22) = self->_readerMarkPos;
  *((_DWORD *)v12 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_eventId) {
    objc_msgSend(v12, "setEventId:");
  }
  if (self->_center) {
    objc_msgSend(v12, "setCenter:");
  }
  if ([(GEOPDSpatialEventLookupResponse *)self categorysCount])
  {
    [v12 clearCategorys];
    unint64_t v4 = [(GEOPDSpatialEventLookupResponse *)self categorysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v12, "addCategory:", -[GEOPDSpatialEventLookupResponse categoryAtIndex:](self, "categoryAtIndex:", i));
    }
  }
  if ([(GEOPDSpatialEventLookupResponse *)self eventDateTimesCount])
  {
    [v12 clearEventDateTimes];
    unint64_t v7 = [(GEOPDSpatialEventLookupResponse *)self eventDateTimesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(GEOPDSpatialEventLookupResponse *)self eventDateTimeAtIndex:j];
        [v12 addEventDateTime:v10];
      }
    }
  }
  if (self->_timezone) {
    objc_msgSend(v12, "setTimezone:");
  }
  v11 = v12;
  if (self->_poiId)
  {
    objc_msgSend(v12, "setPoiId:");
    v11 = v12;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSpatialEventLookupResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDSpatialEventLookupResponse *)self readAll:0];
  id v8 = [(GEOPDMapsIdentifier *)self->_eventId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  id v10 = [(GEOLatLng *)self->_center copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  PBRepeatedInt32Copy();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v12 = self->_eventDateTimes;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        [(id)v5 addEventDateTime:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  id v17 = [(GEOTimezone *)self->_timezone copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v17;

  id v19 = [(GEOPDMapsIdentifier *)self->_poiId copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v19;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDSpatialEventLookupResponse *)self readAll:1],
         [v4 readAll:1],
         eventId = self->_eventId,
         !((unint64_t)eventId | v4[8]))
     || -[GEOPDMapsIdentifier isEqual:](eventId, "isEqual:"))
    && ((center = self->_center, !((unint64_t)center | v4[6])) || -[GEOLatLng isEqual:](center, "isEqual:"))
    && PBRepeatedInt32IsEqual()
    && ((eventDateTimes = self->_eventDateTimes, !((unint64_t)eventDateTimes | v4[7]))
     || -[NSMutableArray isEqual:](eventDateTimes, "isEqual:"))
    && ((timezone = self->_timezone, !((unint64_t)timezone | v4[10]))
     || -[GEOTimezone isEqual:](timezone, "isEqual:")))
  {
    poiId = self->_poiId;
    if ((unint64_t)poiId | v4[9]) {
      char v10 = -[GEOPDMapsIdentifier isEqual:](poiId, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  [(GEOPDSpatialEventLookupResponse *)self readAll:1];
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_eventId hash];
  unint64_t v4 = [(GEOLatLng *)self->_center hash] ^ v3;
  uint64_t v5 = PBRepeatedInt32Hash();
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_eventDateTimes hash];
  unint64_t v7 = [(GEOTimezone *)self->_timezone hash];
  return v6 ^ v7 ^ [(GEOPDMapsIdentifier *)self->_poiId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  eventId = self->_eventId;
  id v6 = v4[8];
  if (eventId)
  {
    if (v6) {
      -[GEOPDMapsIdentifier mergeFrom:](eventId, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOPDSpatialEventLookupResponse setEventId:](self, "setEventId:");
  }
  center = self->_center;
  id v8 = v4[6];
  if (center)
  {
    if (v8) {
      -[GEOLatLng mergeFrom:](center, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEOPDSpatialEventLookupResponse setCenter:](self, "setCenter:");
  }
  uint64_t v9 = [v4 categorysCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
      -[GEOPDSpatialEventLookupResponse addCategory:](self, "addCategory:", [v4 categoryAtIndex:i]);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v4[7];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        -[GEOPDSpatialEventLookupResponse addEventDateTime:](self, "addEventDateTime:", *(void *)(*((void *)&v22 + 1) + 8 * j), (void)v22);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  timezone = self->_timezone;
  uint64_t v18 = v4[10];
  if (timezone)
  {
    if (v18)
    {
      id v19 = (void *)v18[2];
      if (v19) {
        -[GEOTimezone setIdentifier:]((uint64_t)timezone, v19);
      }
    }
  }
  else if (v18)
  {
    -[GEOPDSpatialEventLookupResponse setTimezone:](self, "setTimezone:");
  }
  poiId = self->_poiId;
  id v21 = v4[9];
  if (poiId)
  {
    if (v21) {
      -[GEOPDMapsIdentifier mergeFrom:](poiId, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[GEOPDSpatialEventLookupResponse setPoiId:](self, "setPoiId:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDSpatialEventLookupResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8590);
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDSpatialEventLookupResponse *)self readAll:0];
    [(GEOPDMapsIdentifier *)self->_eventId clearUnknownFields:1];
    [(GEOLatLng *)self->_center clearUnknownFields:1];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unint64_t v7 = self->_eventDateTimes;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
          if (v12)
          {
            uint64_t v13 = *(void **)(v12 + 8);
            *(void *)(v12 + 8) = 0;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    timezone = self->_timezone;
    if (timezone)
    {
      uint64_t v15 = timezone->_unknownFields;
      timezone->_unknownFields = 0;
    }
    -[GEOPDMapsIdentifier clearUnknownFields:](self->_poiId, "clearUnknownFields:", 1, (void)v16);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_poiId, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_eventDateTimes, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end