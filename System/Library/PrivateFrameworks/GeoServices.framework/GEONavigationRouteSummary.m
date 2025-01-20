@interface GEONavigationRouteSummary
+ (BOOL)isValid:(id)a3;
+ (Class)waypointsType;
- (BOOL)hasDestination;
- (BOOL)hasDestinationName;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasNextDestinationName;
- (BOOL)hasOrigin;
- (BOOL)hasTransportType;
- (BOOL)hasTravelTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOComposedWaypoint)destination;
- (GEOComposedWaypoint)origin;
- (GEONavigationRouteSummary)init;
- (GEONavigationRouteSummary)initWithData:(id)a3;
- (GEONavigationRouteSummary)initWithDictionary:(id)a3;
- (GEONavigationRouteSummary)initWithJSON:(id)a3;
- (NSMutableArray)waypoints;
- (NSString)destinationName;
- (NSString)nextDestinationName;
- (double)travelTime;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)transportTypeAsString:(int)a3;
- (id)waypointsAtIndex:(unint64_t)a3;
- (int)StringAsTransportType:(id)a3;
- (int)transportType;
- (unint64_t)hash;
- (unint64_t)waypointsCount;
- (void)_addNoFlagsWaypoints:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readDestination;
- (void)_readDestinationName;
- (void)_readNextDestinationName;
- (void)_readOrigin;
- (void)_readWaypoints;
- (void)addWaypoints:(id)a3;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearWaypoints;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDestination:(id)a3;
- (void)setDestinationName:(id)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setHasTravelTime:(BOOL)a3;
- (void)setNextDestinationName:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setTravelTime:(double)a3;
- (void)setWaypoints:(id)a3;
- (void)updateRoute:(id)a3 destinationName:(id)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEONavigationRouteSummary

- (GEONavigationRouteSummary)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEONavigationRouteSummary;
  v2 = [(GEONavigationRouteSummary *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEONavigationRouteSummary)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEONavigationRouteSummary;
  v3 = [(GEONavigationRouteSummary *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)transportType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_transportType;
  }
  else {
    return 0;
  }
}

- (void)setTransportType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTransportType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E1200[a3];
  }

  return v3;
}

- (int)StringAsTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readDestinationName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONavigationRouteSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinationName_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDestinationName
{
  return self->_destinationName != 0;
}

- (NSString)destinationName
{
  -[GEONavigationRouteSummary _readDestinationName]((uint64_t)self);
  destinationName = self->_destinationName;

  return destinationName;
}

- (void)setDestinationName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_destinationName, a3);
}

- (double)travelTime
{
  return self->_travelTime;
}

- (void)setTravelTime:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_travelTime = a3;
}

- (void)setHasTravelTime:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasTravelTime
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readWaypoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONavigationRouteSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypoints_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)waypoints
{
  -[GEONavigationRouteSummary _readWaypoints]((uint64_t)self);
  waypoints = self->_waypoints;

  return waypoints;
}

- (void)setWaypoints:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  waypoints = self->_waypoints;
  self->_waypoints = v4;
}

- (void)clearWaypoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  waypoints = self->_waypoints;

  [(NSMutableArray *)waypoints removeAllObjects];
}

- (void)addWaypoints:(id)a3
{
  id v4 = a3;
  -[GEONavigationRouteSummary _readWaypoints]((uint64_t)self);
  -[GEONavigationRouteSummary _addNoFlagsWaypoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsWaypoints:(uint64_t)a1
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

- (unint64_t)waypointsCount
{
  -[GEONavigationRouteSummary _readWaypoints]((uint64_t)self);
  waypoints = self->_waypoints;

  return [(NSMutableArray *)waypoints count];
}

- (id)waypointsAtIndex:(unint64_t)a3
{
  -[GEONavigationRouteSummary _readWaypoints]((uint64_t)self);
  waypoints = self->_waypoints;

  return (id)[(NSMutableArray *)waypoints objectAtIndex:a3];
}

+ (Class)waypointsType
{
  return (Class)objc_opt_class();
}

- (void)_readNextDestinationName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONavigationRouteSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNextDestinationName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasNextDestinationName
{
  return self->_nextDestinationName != 0;
}

- (NSString)nextDestinationName
{
  -[GEONavigationRouteSummary _readNextDestinationName]((uint64_t)self);
  nextDestinationName = self->_nextDestinationName;

  return nextDestinationName;
}

- (void)setNextDestinationName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_nextDestinationName, a3);
}

- (void)_readOrigin
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONavigationRouteSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOrigin_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOrigin
{
  return self->_origin != 0;
}

- (GEOComposedWaypoint)origin
{
  -[GEONavigationRouteSummary _readOrigin]((uint64_t)self);
  origin = self->_origin;

  return origin;
}

- (void)setOrigin:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_origin, a3);
}

- (void)_readDestination
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONavigationRouteSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestination_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDestination
{
  return self->_destination != 0;
}

- (GEOComposedWaypoint)destination
{
  -[GEONavigationRouteSummary _readDestination]((uint64_t)self);
  destination = self->_destination;

  return destination;
}

- (void)setDestination:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_destination, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONavigationRouteSummary;
  id v4 = [(GEONavigationRouteSummary *)&v8 description];
  id v5 = [(GEONavigationRouteSummary *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONavigationRouteSummary _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 80) & 2) != 0)
    {
      uint64_t v5 = *(int *)(a1 + 76);
      if (v5 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E1200[v5];
      }
      [v4 setObject:v6 forKey:@"transportType"];
    }
    id v7 = [(id)a1 destinationName];
    if (v7) {
      [v4 setObject:v7 forKey:@"destinationName"];
    }

    if (*(unsigned char *)(a1 + 80))
    {
      objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      [v4 setObject:v8 forKey:@"travelTime"];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v10 = *(id *)(a1 + 56);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = [v15 dictionaryRepresentation];
            }
            [v9 addObject:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v12);
      }

      [v4 setObject:v9 forKey:@"waypoints"];
    }
    v17 = [(id)a1 nextDestinationName];
    if (v17) {
      [v4 setObject:v17 forKey:@"nextDestinationName"];
    }

    v18 = [(id)a1 origin];
    v19 = v18;
    if (v18)
    {
      if (a2) {
        [v18 jsonRepresentation];
      }
      else {
      v20 = [v18 dictionaryRepresentation];
      }
      [v4 setObject:v20 forKey:@"origin"];
    }
    v21 = [(id)a1 destination];
    v22 = v21;
    if (v21)
    {
      if (a2) {
        [v21 jsonRepresentation];
      }
      else {
      v23 = [v21 dictionaryRepresentation];
      }
      [v4 setObject:v23 forKey:@"destination"];
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
  return -[GEONavigationRouteSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONavigationRouteSummary)initWithDictionary:(id)a3
{
  return (GEONavigationRouteSummary *)-[GEONavigationRouteSummary _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_54;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_54;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"transportType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"TRANSIT"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"WALKING"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"BICYCLE"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"FERRY"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v8 = 6;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_22:
    [a1 setTransportType:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"destinationName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = (void *)[v9 copy];
    [a1 setDestinationName:v10];
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:@"travelTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 doubleValue];
    objc_msgSend(a1, "setTravelTime:");
  }

  uint64_t v12 = [v5 objectForKeyedSubscript:@"waypoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = v5;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v19 = [GEOComposedWaypoint alloc];
            if (a3) {
              uint64_t v20 = [(GEOComposedWaypoint *)v19 initWithJSON:v18];
            }
            else {
              uint64_t v20 = [(GEOComposedWaypoint *)v19 initWithDictionary:v18];
            }
            v21 = (void *)v20;
            [a1 addWaypoints:v20];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v15);
    }

    id v5 = v33;
  }

  v22 = [v5 objectForKeyedSubscript:@"nextDestinationName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = (void *)[v22 copy];
    [a1 setNextDestinationName:v23];
  }
  v24 = [v5 objectForKeyedSubscript:@"origin"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v25 = [GEOComposedWaypoint alloc];
    if (a3) {
      uint64_t v26 = [(GEOComposedWaypoint *)v25 initWithJSON:v24];
    }
    else {
      uint64_t v26 = [(GEOComposedWaypoint *)v25 initWithDictionary:v24];
    }
    long long v27 = (void *)v26;
    [a1 setOrigin:v26];
  }
  long long v28 = [v5 objectForKeyedSubscript:@"destination"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = [GEOComposedWaypoint alloc];
    if (a3) {
      uint64_t v30 = [(GEOComposedWaypoint *)v29 initWithJSON:v28];
    }
    else {
      uint64_t v30 = [(GEOComposedWaypoint *)v29 initWithDictionary:v28];
    }
    v31 = (void *)v30;
    [a1 setDestination:v30];
  }
LABEL_54:

  return a1;
}

- (GEONavigationRouteSummary)initWithJSON:(id)a3
{
  return (GEONavigationRouteSummary *)-[GEONavigationRouteSummary _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_292;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_293;
    }
    GEONavigationRouteSummaryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEONavigationRouteSummaryCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavigationRouteSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavigationRouteSummaryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEONavigationRouteSummaryIsDirty((uint64_t)self) & 1) == 0)
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEONavigationRouteSummary *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_destinationName) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_waypoints;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_nextDestinationName) {
      PBDataWriterWriteStringField();
    }
    if (self->_origin) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_destination) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEONavigationRouteSummary _readDestination]((uint64_t)self);
  if ([(GEOComposedWaypoint *)self->_destination hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEONavigationRouteSummary _readOrigin]((uint64_t)self);
  if ([(GEOComposedWaypoint *)self->_origin hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEONavigationRouteSummary _readWaypoints]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v6 = self->_waypoints;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v5 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 0;
LABEL_14:

  return v5;
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEONavigationRouteSummary *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 16) = self->_readerMarkPos;
  *((_DWORD *)v9 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v9 + 19) = self->_transportType;
    *((unsigned char *)v9 + 80) |= 2u;
  }
  if (self->_destinationName) {
    objc_msgSend(v9, "setDestinationName:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    v9[6] = *(id *)&self->_travelTime;
    *((unsigned char *)v9 + 80) |= 1u;
  }
  if ([(GEONavigationRouteSummary *)self waypointsCount])
  {
    [v9 clearWaypoints];
    unint64_t v4 = [(GEONavigationRouteSummary *)self waypointsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEONavigationRouteSummary *)self waypointsAtIndex:i];
        [v9 addWaypoints:v7];
      }
    }
  }
  if (self->_nextDestinationName) {
    objc_msgSend(v9, "setNextDestinationName:");
  }
  uint64_t v8 = v9;
  if (self->_origin)
  {
    objc_msgSend(v9, "setOrigin:");
    uint64_t v8 = v9;
  }
  if (self->_destination)
  {
    objc_msgSend(v9, "setDestination:");
    uint64_t v8 = v9;
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
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEONavigationRouteSummaryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEONavigationRouteSummary *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_transportType;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_destinationName copyWithZone:a3];
  id v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 48) = self->_travelTime;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = self->_waypoints;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        [(id)v5 addWaypoints:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSString *)self->_nextDestinationName copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  id v18 = [(GEOComposedWaypoint *)self->_origin copyWithZone:a3];
  v19 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v18;

  id v20 = [(GEOComposedWaypoint *)self->_destination copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v20;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEONavigationRouteSummary *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 80);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_transportType != *((_DWORD *)v4 + 19)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_23;
  }
  destinationName = self->_destinationName;
  if ((unint64_t)destinationName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](destinationName, "isEqual:"))
    {
LABEL_23:
      char v12 = 0;
      goto LABEL_24;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 80);
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_travelTime != *((double *)v4 + 6)) {
      goto LABEL_23;
    }
  }
  else if (v6)
  {
    goto LABEL_23;
  }
  waypoints = self->_waypoints;
  if ((unint64_t)waypoints | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](waypoints, "isEqual:"))
  {
    goto LABEL_23;
  }
  nextDestinationName = self->_nextDestinationName;
  if ((unint64_t)nextDestinationName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](nextDestinationName, "isEqual:")) {
      goto LABEL_23;
    }
  }
  origin = self->_origin;
  if ((unint64_t)origin | *((void *)v4 + 5))
  {
    if (!-[GEOComposedWaypoint isEqual:](origin, "isEqual:")) {
      goto LABEL_23;
    }
  }
  destination = self->_destination;
  if ((unint64_t)destination | *((void *)v4 + 3)) {
    char v12 = -[GEOComposedWaypoint isEqual:](destination, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_24:

  return v12;
}

- (unint64_t)hash
{
  [(GEONavigationRouteSummary *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_transportType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_destinationName hash];
  if (*(unsigned char *)&self->_flags)
  {
    double travelTime = self->_travelTime;
    double v7 = -travelTime;
    if (travelTime >= 0.0) {
      double v7 = self->_travelTime;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  NSUInteger v10 = v4 ^ v3 ^ v5;
  uint64_t v11 = [(NSMutableArray *)self->_waypoints hash];
  NSUInteger v12 = v10 ^ v11 ^ [(NSString *)self->_nextDestinationName hash];
  unint64_t v13 = [(GEOComposedWaypoint *)self->_origin hash];
  return v12 ^ v13 ^ [(GEOComposedWaypoint *)self->_destination hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 19);
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 2)) {
    -[GEONavigationRouteSummary setDestinationName:](self, "setDestinationName:");
  }
  if (*((unsigned char *)v4 + 80))
  {
    self->_double travelTime = *((double *)v4 + 6);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = *((id *)v4 + 7);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEONavigationRouteSummary addWaypoints:](self, "addWaypoints:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 4)) {
    -[GEONavigationRouteSummary setNextDestinationName:](self, "setNextDestinationName:");
  }
  origin = self->_origin;
  uint64_t v11 = *((void *)v4 + 5);
  if (origin)
  {
    if (v11) {
      -[GEOComposedWaypoint mergeFrom:](origin, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEONavigationRouteSummary setOrigin:](self, "setOrigin:");
  }
  destination = self->_destination;
  uint64_t v13 = *((void *)v4 + 3);
  if (destination)
  {
    if (v13) {
      -[GEOComposedWaypoint mergeFrom:](destination, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEONavigationRouteSummary setDestination:](self, "setDestination:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_nextDestinationName, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)updateRoute:(id)a3 destinationName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[GEONavigationRouteSummary setTransportType:](self, "setTransportType:", [v7 transportType]);
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA48];
  double v9 = [v7 waypoints];
  NSUInteger v10 = [v8 arrayWithArray:v9];
  [(GEONavigationRouteSummary *)self setWaypoints:v10];

  uint64_t v11 = [(GEONavigationRouteSummary *)self waypoints];
  NSUInteger v12 = [v11 firstObject];
  [(GEONavigationRouteSummary *)self setOrigin:v12];

  uint64_t v13 = [(GEONavigationRouteSummary *)self waypoints];
  long long v14 = [v13 lastObject];
  [(GEONavigationRouteSummary *)self setDestination:v14];

  [(GEONavigationRouteSummary *)self setDestinationName:v6];
  unsigned int v15 = [v7 expectedTime];

  [(GEONavigationRouteSummary *)self setTravelTime:(double)v15];
}

@end