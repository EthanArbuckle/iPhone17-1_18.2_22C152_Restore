@interface GEOLogMsgEventPOIBusynessData
+ (BOOL)isValid:(id)a3;
+ (Class)poiPredictionsType;
- (BOOL)hasAltitude;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHorizontalAccuracy;
- (BOOL)hasLocation;
- (BOOL)hasTimestamp;
- (BOOL)hasVerticalAccuracy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)location;
- (GEOLogMsgEventPOIBusynessData)init;
- (GEOLogMsgEventPOIBusynessData)initWithData:(id)a3;
- (GEOLogMsgEventPOIBusynessData)initWithDictionary:(id)a3;
- (GEOLogMsgEventPOIBusynessData)initWithJSON:(id)a3;
- (NSMutableArray)poiPredictions;
- (double)altitude;
- (double)horizontalAccuracy;
- (double)timestamp;
- (double)verticalAccuracy;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)poiPredictionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)poiPredictionsCount;
- (void)_addNoFlagsPoiPredictions:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readLocation;
- (void)_readPoiPredictions;
- (void)addPoiPredictions:(id)a3;
- (void)clearPoiPredictions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAltitude:(double)a3;
- (void)setHasAltitude:(BOOL)a3;
- (void)setHasHorizontalAccuracy:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVerticalAccuracy:(BOOL)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setLocation:(id)a3;
- (void)setPoiPredictions:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setVerticalAccuracy:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventPOIBusynessData

- (GEOLogMsgEventPOIBusynessData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventPOIBusynessData;
  v2 = [(GEOLogMsgEventPOIBusynessData *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventPOIBusynessData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventPOIBusynessData;
  v3 = [(GEOLogMsgEventPOIBusynessData *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 68;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPOIBusynessDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_10);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLatLng)location
{
  -[GEOLogMsgEventPOIBusynessData _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_horizontalAccuracy = a3;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHorizontalAccuracy
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  self->_verticalAccuracy = a3;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 72;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasVerticalAccuracy
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasAltitude
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readPoiPredictions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPOIBusynessDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiPredictions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)poiPredictions
{
  -[GEOLogMsgEventPOIBusynessData _readPoiPredictions]((uint64_t)self);
  poiPredictions = self->_poiPredictions;

  return poiPredictions;
}

- (void)setPoiPredictions:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  poiPredictions = self->_poiPredictions;
  self->_poiPredictions = v4;
}

- (void)clearPoiPredictions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  poiPredictions = self->_poiPredictions;

  [(NSMutableArray *)poiPredictions removeAllObjects];
}

- (void)addPoiPredictions:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventPOIBusynessData _readPoiPredictions]((uint64_t)self);
  -[GEOLogMsgEventPOIBusynessData _addNoFlagsPoiPredictions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsPoiPredictions:(uint64_t)a1
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

- (unint64_t)poiPredictionsCount
{
  -[GEOLogMsgEventPOIBusynessData _readPoiPredictions]((uint64_t)self);
  poiPredictions = self->_poiPredictions;

  return [(NSMutableArray *)poiPredictions count];
}

- (id)poiPredictionsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventPOIBusynessData _readPoiPredictions]((uint64_t)self);
  poiPredictions = self->_poiPredictions;

  return (id)[(NSMutableArray *)poiPredictions objectAtIndex:a3];
}

+ (Class)poiPredictionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventPOIBusynessData;
  id v4 = [(GEOLogMsgEventPOIBusynessData *)&v8 description];
  id v5 = [(GEOLogMsgEventPOIBusynessData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventPOIBusynessData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_25;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 76) & 4) != 0)
  {
    id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    [v4 setObject:v5 forKey:@"timestamp"];
  }
  objc_super v6 = [(id)a1 location];
  id v7 = v6;
  if (v6)
  {
    if (a2) {
      [v6 jsonRepresentation];
    }
    else {
    objc_super v8 = [v6 dictionaryRepresentation];
    }
    [v4 setObject:v8 forKey:@"location"];
  }
  char v9 = *(unsigned char *)(a1 + 76);
  if ((v9 & 2) != 0)
  {
    v20 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    [v4 setObject:v20 forKey:@"horizontalAccuracy"];

    char v9 = *(unsigned char *)(a1 + 76);
    if ((v9 & 8) == 0)
    {
LABEL_11:
      if ((v9 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)(a1 + 76) & 8) == 0)
  {
    goto LABEL_11;
  }
  v21 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  [v4 setObject:v21 forKey:@"verticalAccuracy"];

  if (*(unsigned char *)(a1 + 76))
  {
LABEL_12:
    v10 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    [v4 setObject:v10 forKey:@"altitude"];
  }
LABEL_13:
  if ([*(id *)(a1 + 40) count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (a2) {
            [v17 jsonRepresentation];
          }
          else {
          v18 = objc_msgSend(v17, "dictionaryRepresentation", (void)v22);
          }
          objc_msgSend(v11, "addObject:", v18, (void)v22);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }

    [v4 setObject:v11 forKey:@"poiPredictions"];
  }
LABEL_25:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventPOIBusynessData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventPOIBusynessData)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventPOIBusynessData *)-[GEOLogMsgEventPOIBusynessData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"timestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 doubleValue];
        objc_msgSend(a1, "setTimestamp:");
      }

      id v7 = [v5 objectForKeyedSubscript:@"location"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v9 = [(GEOLatLng *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOLatLng *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setLocation:v9];
      }
      v11 = [v5 objectForKeyedSubscript:@"horizontalAccuracy"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 doubleValue];
        objc_msgSend(a1, "setHorizontalAccuracy:");
      }

      id v12 = [v5 objectForKeyedSubscript:@"verticalAccuracy"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 doubleValue];
        objc_msgSend(a1, "setVerticalAccuracy:");
      }

      uint64_t v13 = [v5 objectForKeyedSubscript:@"altitude"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 doubleValue];
        objc_msgSend(a1, "setAltitude:");
      }

      uint64_t v14 = [v5 objectForKeyedSubscript:@"poiPredictions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v25 = v14;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v21 = [GEOLogMsgEventPOIPredictionData alloc];
                if (a3) {
                  uint64_t v22 = [(GEOLogMsgEventPOIPredictionData *)v21 initWithJSON:v20];
                }
                else {
                  uint64_t v22 = [(GEOLogMsgEventPOIPredictionData *)v21 initWithDictionary:v20];
                }
                long long v23 = (void *)v22;
                [a1 addPoiPredictions:v22];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v17);
        }

        uint64_t v14 = v25;
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventPOIBusynessData)initWithJSON:(id)a3
{
  return (GEOLogMsgEventPOIBusynessData *)-[GEOLogMsgEventPOIBusynessData _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3916;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3917;
    }
    GEOLogMsgEventPOIBusynessDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventPOIBusynessDataCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventPOIBusynessDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventPOIBusynessDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 0x70) == 0)
    {
      v11 = self->_reader;
      objc_sync_enter(v11);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      id v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v12];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_23;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventPOIBusynessData *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_location) {
    PBDataWriterWriteSubmessage();
  }
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 8) == 0) {
      goto LABEL_9;
    }
LABEL_20:
    PBDataWriterWriteDoubleField();
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_20;
  }
LABEL_9:
  if (flags) {
LABEL_10:
  }
    PBDataWriterWriteDoubleField();
LABEL_11:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_poiPredictions;
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

LABEL_23:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOLogMsgEventPOIBusynessData _readLocation]((uint64_t)self);
  location = self->_location;

  return [(GEOLatLng *)location hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v10 = (id *)a3;
  [(GEOLogMsgEventPOIBusynessData *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 16) = self->_readerMarkPos;
  *((_DWORD *)v10 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v10;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    v10[6] = *(id *)&self->_timestamp;
    *((unsigned char *)v10 + 76) |= 4u;
  }
  if (self->_location)
  {
    objc_msgSend(v10, "setLocation:");
    id v4 = v10;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 8) == 0) {
      goto LABEL_7;
    }
LABEL_17:
    v4[7] = *(id *)&self->_verticalAccuracy;
    *((unsigned char *)v4 + 76) |= 8u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v4[3] = *(id *)&self->_horizontalAccuracy;
  *((unsigned char *)v4 + 76) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_17;
  }
LABEL_7:
  if (flags)
  {
LABEL_8:
    v4[2] = *(id *)&self->_altitude;
    *((unsigned char *)v4 + 76) |= 1u;
  }
LABEL_9:
  if ([(GEOLogMsgEventPOIBusynessData *)self poiPredictionsCount])
  {
    [v10 clearPoiPredictions];
    unint64_t v6 = [(GEOLogMsgEventPOIBusynessData *)self poiPredictionsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(GEOLogMsgEventPOIBusynessData *)self poiPredictionsAtIndex:i];
        [v10 addPoiPredictions:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
      GEOLogMsgEventPOIBusynessDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_18;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventPOIBusynessData *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(double *)(v5 + 48) = self->_timestamp;
    *(unsigned char *)(v5 + 76) |= 4u;
  }
  id v9 = [(GEOLatLng *)self->_location copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(double *)(v5 + 24) = self->_horizontalAccuracy;
    *(unsigned char *)(v5 + 76) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_9:
      if ((flags & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_9;
  }
  *(double *)(v5 + 56) = self->_verticalAccuracy;
  *(unsigned char *)(v5 + 76) |= 8u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_10:
    *(double *)(v5 + 16) = self->_altitude;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
LABEL_11:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_poiPredictions;
  uint64_t v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v8);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v5 addPoiPredictions:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
LABEL_18:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  [(GEOLogMsgEventPOIBusynessData *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 76);
  if ((flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_timestamp != *((double *)v4 + 6)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    goto LABEL_27;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:"))
    {
LABEL_27:
      char v9 = 0;
      goto LABEL_28;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 76);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_horizontalAccuracy != *((double *)v4 + 3)) {
      goto LABEL_27;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_verticalAccuracy != *((double *)v4 + 7)) {
      goto LABEL_27;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_27;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_altitude != *((double *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if (v6)
  {
    goto LABEL_27;
  }
  poiPredictions = self->_poiPredictions;
  if ((unint64_t)poiPredictions | *((void *)v4 + 5)) {
    char v9 = -[NSMutableArray isEqual:](poiPredictions, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_28:

  return v9;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventPOIBusynessData *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    double timestamp = self->_timestamp;
    double v5 = -timestamp;
    if (timestamp >= 0.0) {
      double v5 = self->_timestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  unint64_t v8 = [(GEOLatLng *)self->_location hash];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    double horizontalAccuracy = self->_horizontalAccuracy;
    double v12 = -horizontalAccuracy;
    if (horizontalAccuracy >= 0.0) {
      double v12 = self->_horizontalAccuracy;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((flags & 8) != 0)
  {
    double verticalAccuracy = self->_verticalAccuracy;
    double v17 = -verticalAccuracy;
    if (verticalAccuracy >= 0.0) {
      double v17 = self->_verticalAccuracy;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if (flags)
  {
    double altitude = self->_altitude;
    double v22 = -altitude;
    if (altitude >= 0.0) {
      double v22 = self->_altitude;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  return v8 ^ v3 ^ v10 ^ v15 ^ v20 ^ [(NSMutableArray *)self->_poiPredictions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    self->_double timestamp = *((double *)v4 + 6);
    *(unsigned char *)&self->_flags |= 4u;
  }
  location = self->_location;
  uint64_t v6 = *((void *)v4 + 4);
  if (location)
  {
    if (v6) {
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOLogMsgEventPOIBusynessData setLocation:](self, "setLocation:");
  }
  char v7 = *((unsigned char *)v4 + 76);
  if ((v7 & 2) != 0)
  {
    self->_double horizontalAccuracy = *((double *)v4 + 3);
    *(unsigned char *)&self->_flags |= 2u;
    char v7 = *((unsigned char *)v4 + 76);
    if ((v7 & 8) == 0)
    {
LABEL_10:
      if ((v7 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) == 0)
  {
    goto LABEL_10;
  }
  self->_double verticalAccuracy = *((double *)v4 + 7);
  *(unsigned char *)&self->_flags |= 8u;
  if (*((unsigned char *)v4 + 76))
  {
LABEL_11:
    self->_double altitude = *((double *)v4 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_12:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v4 + 5);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOLogMsgEventPOIBusynessData addPoiPredictions:](self, "addPoiPredictions:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiPredictions, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end