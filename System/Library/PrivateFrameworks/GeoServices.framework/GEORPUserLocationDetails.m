@interface GEORPUserLocationDetails
+ (BOOL)isValid:(id)a3;
+ (Class)deviceHistoricalLocationType;
- (BOOL)hasCurrentTime;
- (BOOL)hasCurrentUserLocation;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLastKnownRoadLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocation)currentUserLocation;
- (GEOLocation)lastKnownRoadLocation;
- (GEORPTimestamp)currentTime;
- (GEORPUserLocationDetails)init;
- (GEORPUserLocationDetails)initWithData:(id)a3;
- (GEORPUserLocationDetails)initWithDictionary:(id)a3;
- (GEORPUserLocationDetails)initWithJSON:(id)a3;
- (NSMutableArray)deviceHistoricalLocations;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceHistoricalLocationAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)deviceHistoricalLocationsCount;
- (unint64_t)hash;
- (void)_addNoFlagsDeviceHistoricalLocation:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCurrentTime;
- (void)_readCurrentUserLocation;
- (void)_readDeviceHistoricalLocations;
- (void)_readLastKnownRoadLocation;
- (void)addDeviceHistoricalLocation:(id)a3;
- (void)clearDeviceHistoricalLocations;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCurrentTime:(id)a3;
- (void)setCurrentUserLocation:(id)a3;
- (void)setDeviceHistoricalLocations:(id)a3;
- (void)setLastKnownRoadLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPUserLocationDetails

- (GEORPUserLocationDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPUserLocationDetails;
  v2 = [(GEORPUserLocationDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPUserLocationDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPUserLocationDetails;
  v3 = [(GEORPUserLocationDetails *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCurrentTime
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
        GEORPUserLocationDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCurrentTime_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCurrentTime
{
  return self->_currentTime != 0;
}

- (GEORPTimestamp)currentTime
{
  -[GEORPUserLocationDetails _readCurrentTime]((uint64_t)self);
  currentTime = self->_currentTime;

  return currentTime;
}

- (void)setCurrentTime:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_currentTime, a3);
}

- (void)_readCurrentUserLocation
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
        GEORPUserLocationDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCurrentUserLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCurrentUserLocation
{
  return self->_currentUserLocation != 0;
}

- (GEOLocation)currentUserLocation
{
  -[GEORPUserLocationDetails _readCurrentUserLocation]((uint64_t)self);
  currentUserLocation = self->_currentUserLocation;

  return currentUserLocation;
}

- (void)setCurrentUserLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_currentUserLocation, a3);
}

- (void)_readLastKnownRoadLocation
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
        GEORPUserLocationDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLastKnownRoadLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLastKnownRoadLocation
{
  return self->_lastKnownRoadLocation != 0;
}

- (GEOLocation)lastKnownRoadLocation
{
  -[GEORPUserLocationDetails _readLastKnownRoadLocation]((uint64_t)self);
  lastKnownRoadLocation = self->_lastKnownRoadLocation;

  return lastKnownRoadLocation;
}

- (void)setLastKnownRoadLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_lastKnownRoadLocation, a3);
}

- (void)_readDeviceHistoricalLocations
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
        GEORPUserLocationDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceHistoricalLocations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)deviceHistoricalLocations
{
  -[GEORPUserLocationDetails _readDeviceHistoricalLocations]((uint64_t)self);
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  return deviceHistoricalLocations;
}

- (void)setDeviceHistoricalLocations:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  self->_deviceHistoricalLocations = v4;
}

- (void)clearDeviceHistoricalLocations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  [(NSMutableArray *)deviceHistoricalLocations removeAllObjects];
}

- (void)addDeviceHistoricalLocation:(id)a3
{
  id v4 = a3;
  -[GEORPUserLocationDetails _readDeviceHistoricalLocations]((uint64_t)self);
  -[GEORPUserLocationDetails _addNoFlagsDeviceHistoricalLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsDeviceHistoricalLocation:(uint64_t)a1
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

- (unint64_t)deviceHistoricalLocationsCount
{
  -[GEORPUserLocationDetails _readDeviceHistoricalLocations]((uint64_t)self);
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  return [(NSMutableArray *)deviceHistoricalLocations count];
}

- (id)deviceHistoricalLocationAtIndex:(unint64_t)a3
{
  -[GEORPUserLocationDetails _readDeviceHistoricalLocations]((uint64_t)self);
  deviceHistoricalLocations = self->_deviceHistoricalLocations;

  return (id)[(NSMutableArray *)deviceHistoricalLocations objectAtIndex:a3];
}

+ (Class)deviceHistoricalLocationType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPUserLocationDetails;
  id v4 = [(GEORPUserLocationDetails *)&v8 description];
  id v5 = [(GEORPUserLocationDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPUserLocationDetails _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 currentTime];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"currentTime";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"current_time";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 currentUserLocation];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"currentUserLocation";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"current_user_location";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 lastKnownRoadLocation];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"lastKnownRoadLocation";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"last_known_road_location";
      }
      [v4 setObject:v15 forKey:v16];
    }
    if ([a1[4] count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = a1[4];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = objc_msgSend(v23, "dictionaryRepresentation", (void)v27);
            }
            objc_msgSend(v17, "addObject:", v24, (void)v27);
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v20);
      }

      if (a2) {
        v25 = @"deviceHistoricalLocation";
      }
      else {
        v25 = @"device_historical_location";
      }
      objc_msgSend(v4, "setObject:forKey:", v17, v25, (void)v27);
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
  return -[GEORPUserLocationDetails _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORPUserLocationDetails)initWithDictionary:(id)a3
{
  return (GEORPUserLocationDetails *)-[GEORPUserLocationDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"currentTime";
      }
      else {
        objc_super v6 = @"current_time";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORPTimestamp alloc];
        if (a3) {
          uint64_t v9 = [(GEORPTimestamp *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEORPTimestamp *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setCurrentTime:v9];
      }
      if (a3) {
        v11 = @"currentUserLocation";
      }
      else {
        v11 = @"current_user_location";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOLocation alloc];
        if (a3) {
          uint64_t v14 = [(GEOLocation *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOLocation *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setCurrentUserLocation:v14];
      }
      if (a3) {
        v16 = @"lastKnownRoadLocation";
      }
      else {
        v16 = @"last_known_road_location";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = [GEOLocation alloc];
        if (a3) {
          uint64_t v19 = [(GEOLocation *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOLocation *)v18 initWithDictionary:v17];
        }
        uint64_t v20 = (void *)v19;
        [a1 setLastKnownRoadLocation:v19];
      }
      if (a3) {
        uint64_t v21 = @"deviceHistoricalLocation";
      }
      else {
        uint64_t v21 = @"device_historical_location";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v33 = v5;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v35 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v29 = [GEOLocation alloc];
                if (a3) {
                  uint64_t v30 = [(GEOLocation *)v29 initWithJSON:v28];
                }
                else {
                  uint64_t v30 = [(GEOLocation *)v29 initWithDictionary:v28];
                }
                v31 = (void *)v30;
                [a1 addDeviceHistoricalLocation:v30];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v25);
        }

        id v5 = v33;
      }
    }
  }

  return a1;
}

- (GEORPUserLocationDetails)initWithJSON:(id)a3
{
  return (GEORPUserLocationDetails *)-[GEORPUserLocationDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_401;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_402;
    }
    GEORPUserLocationDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPUserLocationDetailsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPUserLocationDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPUserLocationDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPUserLocationDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPUserLocationDetails *)self readAll:0];
    if (self->_currentTime) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_currentUserLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_lastKnownRoadLocation) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_deviceHistoricalLocations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEORPUserLocationDetails _readCurrentUserLocation]((uint64_t)self);
  if ([(GEOLocation *)self->_currentUserLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPUserLocationDetails _readDeviceHistoricalLocations]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_deviceHistoricalLocations;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (void)v11))
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[GEORPUserLocationDetails _readLastKnownRoadLocation]((uint64_t)self);
  return [(GEOLocation *)self->_lastKnownRoadLocation hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORPUserLocationDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_currentTime) {
    objc_msgSend(v8, "setCurrentTime:");
  }
  if (self->_currentUserLocation) {
    objc_msgSend(v8, "setCurrentUserLocation:");
  }
  if (self->_lastKnownRoadLocation) {
    objc_msgSend(v8, "setLastKnownRoadLocation:");
  }
  if ([(GEORPUserLocationDetails *)self deviceHistoricalLocationsCount])
  {
    [v8 clearDeviceHistoricalLocations];
    unint64_t v4 = [(GEORPUserLocationDetails *)self deviceHistoricalLocationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPUserLocationDetails *)self deviceHistoricalLocationAtIndex:i];
        [v8 addDeviceHistoricalLocation:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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
      GEORPUserLocationDetailsReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPUserLocationDetails *)self readAll:0];
  id v8 = [(GEORPTimestamp *)self->_currentTime copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(GEOLocation *)self->_currentUserLocation copyWithZone:a3];
  long long v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(GEOLocation *)self->_lastKnownRoadLocation copyWithZone:a3];
  long long v13 = (void *)v5[5];
  v5[5] = v12;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v14 = self->_deviceHistoricalLocations;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (void)v20);
        [v5 addDeviceHistoricalLocation:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPUserLocationDetails *)self readAll:1],
         [v4 readAll:1],
         currentTime = self->_currentTime,
         !((unint64_t)currentTime | v4[2]))
     || -[GEORPTimestamp isEqual:](currentTime, "isEqual:"))
    && ((currentUserLocation = self->_currentUserLocation, !((unint64_t)currentUserLocation | v4[3]))
     || -[GEOLocation isEqual:](currentUserLocation, "isEqual:"))
    && ((lastKnownRoadLocation = self->_lastKnownRoadLocation, !((unint64_t)lastKnownRoadLocation | v4[5]))
     || -[GEOLocation isEqual:](lastKnownRoadLocation, "isEqual:")))
  {
    deviceHistoricalLocations = self->_deviceHistoricalLocations;
    if ((unint64_t)deviceHistoricalLocations | v4[4]) {
      char v9 = -[NSMutableArray isEqual:](deviceHistoricalLocations, "isEqual:");
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
  [(GEORPUserLocationDetails *)self readAll:1];
  unint64_t v3 = [(GEORPTimestamp *)self->_currentTime hash];
  unint64_t v4 = [(GEOLocation *)self->_currentUserLocation hash] ^ v3;
  unint64_t v5 = [(GEOLocation *)self->_lastKnownRoadLocation hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_deviceHistoricalLocations hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  currentTime = self->_currentTime;
  id v6 = v4[2];
  if (currentTime)
  {
    if (v6) {
      -[GEORPTimestamp mergeFrom:](currentTime, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPUserLocationDetails setCurrentTime:](self, "setCurrentTime:");
  }
  currentUserLocation = self->_currentUserLocation;
  id v8 = v4[3];
  if (currentUserLocation)
  {
    if (v8) {
      -[GEOLocation mergeFrom:](currentUserLocation, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEORPUserLocationDetails setCurrentUserLocation:](self, "setCurrentUserLocation:");
  }
  lastKnownRoadLocation = self->_lastKnownRoadLocation;
  id v10 = v4[5];
  if (lastKnownRoadLocation)
  {
    if (v10) {
      -[GEOLocation mergeFrom:](lastKnownRoadLocation, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[GEORPUserLocationDetails setLastKnownRoadLocation:](self, "setLastKnownRoadLocation:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v4[4];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[GEORPUserLocationDetails addDeviceHistoricalLocation:](self, "addDeviceHistoricalLocation:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownRoadLocation, 0);
  objc_storeStrong((id *)&self->_deviceHistoricalLocations, 0);
  objc_storeStrong((id *)&self->_currentUserLocation, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end