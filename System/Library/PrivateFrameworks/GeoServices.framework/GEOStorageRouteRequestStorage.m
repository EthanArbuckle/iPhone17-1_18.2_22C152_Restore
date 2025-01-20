@interface GEOStorageRouteRequestStorage
+ (BOOL)isValid:(id)a3;
+ (Class)waypointsType;
- (BOOL)hasAutomobileOptions;
- (BOOL)hasCyclingOptions;
- (BOOL)hasDestinationPersistentData;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasResumeRouteHandleStorage;
- (BOOL)hasRouteHandle;
- (BOOL)hasTransitOptions;
- (BOOL)hasTransportType;
- (BOOL)hasWalkingOptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAutomobileOptions)automobileOptions;
- (GEOCyclingOptions)cyclingOptions;
- (GEOStorageResumeRouteHandle)resumeRouteHandleStorage;
- (GEOStorageRouteRequestStorage)init;
- (GEOStorageRouteRequestStorage)initWithData:(id)a3;
- (GEOStorageRouteRequestStorage)initWithDictionary:(id)a3;
- (GEOStorageRouteRequestStorage)initWithJSON:(id)a3;
- (GEOTransitOptions)transitOptions;
- (GEOURLRouteHandle)routeHandle;
- (GEOWalkingOptions)walkingOptions;
- (NSData)destinationPersistentData;
- (NSMutableArray)waypoints;
- (PBUnknownFields)unknownFields;
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
- (void)_readAutomobileOptions;
- (void)_readCyclingOptions;
- (void)_readDestinationPersistentData;
- (void)_readResumeRouteHandleStorage;
- (void)_readRouteHandle;
- (void)_readTransitOptions;
- (void)_readWalkingOptions;
- (void)_readWaypoints;
- (void)addWaypoints:(id)a3;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearWaypoints;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAutomobileOptions:(id)a3;
- (void)setCyclingOptions:(id)a3;
- (void)setDestinationPersistentData:(id)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setResumeRouteHandleStorage:(id)a3;
- (void)setRouteHandle:(id)a3;
- (void)setTransitOptions:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setWalkingOptions:(id)a3;
- (void)setWaypoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOStorageRouteRequestStorage

- (GEOStorageRouteRequestStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOStorageRouteRequestStorage;
  v2 = [(GEOStorageRouteRequestStorage *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOStorageRouteRequestStorage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOStorageRouteRequestStorage;
  v3 = [(GEOStorageRouteRequestStorage *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWaypoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypoints_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)waypoints
{
  -[GEOStorageRouteRequestStorage _readWaypoints]((uint64_t)self);
  waypoints = self->_waypoints;

  return waypoints;
}

- (void)setWaypoints:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  waypoints = self->_waypoints;
  self->_waypoints = v4;
}

- (void)clearWaypoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  waypoints = self->_waypoints;

  [(NSMutableArray *)waypoints removeAllObjects];
}

- (void)addWaypoints:(id)a3
{
  id v4 = a3;
  -[GEOStorageRouteRequestStorage _readWaypoints]((uint64_t)self);
  -[GEOStorageRouteRequestStorage _addNoFlagsWaypoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsWaypoints:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      id v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)waypointsCount
{
  -[GEOStorageRouteRequestStorage _readWaypoints]((uint64_t)self);
  waypoints = self->_waypoints;

  return [(NSMutableArray *)waypoints count];
}

- (id)waypointsAtIndex:(unint64_t)a3
{
  -[GEOStorageRouteRequestStorage _readWaypoints]((uint64_t)self);
  waypoints = self->_waypoints;

  return (id)[(NSMutableArray *)waypoints objectAtIndex:a3];
}

+ (Class)waypointsType
{
  return (Class)objc_opt_class();
}

- (int)transportType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_transportType;
  }
  else {
    return 0;
  }
}

- (void)setTransportType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasTransportType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E0E10[a3];
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

- (void)_readRouteHandle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteHandle_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasRouteHandle
{
  return self->_routeHandle != 0;
}

- (GEOURLRouteHandle)routeHandle
{
  -[GEOStorageRouteRequestStorage _readRouteHandle]((uint64_t)self);
  routeHandle = self->_routeHandle;

  return routeHandle;
}

- (void)setRouteHandle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_routeHandle, a3);
}

- (void)_readAutomobileOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutomobileOptions_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasAutomobileOptions
{
  return self->_automobileOptions != 0;
}

- (GEOAutomobileOptions)automobileOptions
{
  -[GEOStorageRouteRequestStorage _readAutomobileOptions]((uint64_t)self);
  automobileOptions = self->_automobileOptions;

  return automobileOptions;
}

- (void)setAutomobileOptions:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_automobileOptions, a3);
}

- (void)_readTransitOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitOptions_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTransitOptions
{
  return self->_transitOptions != 0;
}

- (GEOTransitOptions)transitOptions
{
  -[GEOStorageRouteRequestStorage _readTransitOptions]((uint64_t)self);
  transitOptions = self->_transitOptions;

  return transitOptions;
}

- (void)setTransitOptions:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_transitOptions, a3);
}

- (void)_readWalkingOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalkingOptions_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasWalkingOptions
{
  return self->_walkingOptions != 0;
}

- (GEOWalkingOptions)walkingOptions
{
  -[GEOStorageRouteRequestStorage _readWalkingOptions]((uint64_t)self);
  walkingOptions = self->_walkingOptions;

  return walkingOptions;
}

- (void)setWalkingOptions:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_walkingOptions, a3);
}

- (void)_readCyclingOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCyclingOptions_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasCyclingOptions
{
  return self->_cyclingOptions != 0;
}

- (GEOCyclingOptions)cyclingOptions
{
  -[GEOStorageRouteRequestStorage _readCyclingOptions]((uint64_t)self);
  cyclingOptions = self->_cyclingOptions;

  return cyclingOptions;
}

- (void)setCyclingOptions:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  objc_storeStrong((id *)&self->_cyclingOptions, a3);
}

- (void)_readResumeRouteHandleStorage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResumeRouteHandleStorage_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasResumeRouteHandleStorage
{
  return self->_resumeRouteHandleStorage != 0;
}

- (GEOStorageResumeRouteHandle)resumeRouteHandleStorage
{
  -[GEOStorageRouteRequestStorage _readResumeRouteHandleStorage]((uint64_t)self);
  resumeRouteHandleStorage = self->_resumeRouteHandleStorage;

  return resumeRouteHandleStorage;
}

- (void)setResumeRouteHandleStorage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_resumeRouteHandleStorage, a3);
}

- (void)_readDestinationPersistentData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinationPersistentData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDestinationPersistentData
{
  return self->_destinationPersistentData != 0;
}

- (NSData)destinationPersistentData
{
  -[GEOStorageRouteRequestStorage _readDestinationPersistentData]((uint64_t)self);
  destinationPersistentData = self->_destinationPersistentData;

  return destinationPersistentData;
}

- (void)setDestinationPersistentData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_destinationPersistentData, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOStorageRouteRequestStorage;
  int v4 = [(GEOStorageRouteRequestStorage *)&v8 description];
  id v5 = [(GEOStorageRouteRequestStorage *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStorageRouteRequestStorage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 80) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v6 = *(id *)(a1 + 80);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v46 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"waypoints"];
    }
    if (*(_WORD *)(a1 + 104))
    {
      uint64_t v13 = *(int *)(a1 + 100);
      if (v13 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 100));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = off_1E53E0E10[v13];
      }
      [v4 setObject:v14 forKey:@"transportType"];
    }
    v15 = [(id)a1 routeHandle];
    v16 = v15;
    if (v15)
    {
      if (a2) {
        [v15 jsonRepresentation];
      }
      else {
      v17 = [v15 dictionaryRepresentation];
      }
      [v4 setObject:v17 forKey:@"routeHandle"];
    }
    v18 = [(id)a1 automobileOptions];
    v19 = v18;
    if (v18)
    {
      if (a2) {
        [v18 jsonRepresentation];
      }
      else {
      v20 = [v18 dictionaryRepresentation];
      }
      [v4 setObject:v20 forKey:@"automobileOptions"];
    }
    v21 = [(id)a1 transitOptions];
    v22 = v21;
    if (v21)
    {
      if (a2) {
        [v21 jsonRepresentation];
      }
      else {
      v23 = [v21 dictionaryRepresentation];
      }
      [v4 setObject:v23 forKey:@"transitOptions"];
    }
    v24 = [(id)a1 walkingOptions];
    v25 = v24;
    if (v24)
    {
      if (a2) {
        [v24 jsonRepresentation];
      }
      else {
      v26 = [v24 dictionaryRepresentation];
      }
      [v4 setObject:v26 forKey:@"walkingOptions"];
    }
    v27 = [(id)a1 cyclingOptions];
    v28 = v27;
    if (v27)
    {
      if (a2) {
        [v27 jsonRepresentation];
      }
      else {
      v29 = [v27 dictionaryRepresentation];
      }
      [v4 setObject:v29 forKey:@"cyclingOptions"];
    }
    v30 = [(id)a1 resumeRouteHandleStorage];
    v31 = v30;
    if (v30)
    {
      if (a2) {
        [v30 jsonRepresentation];
      }
      else {
      v32 = [v30 dictionaryRepresentation];
      }
      [v4 setObject:v32 forKey:@"resumeRouteHandleStorage"];
    }
    v33 = [(id)a1 destinationPersistentData];
    v34 = v33;
    if (v33)
    {
      if (a2)
      {
        v35 = [v33 base64EncodedStringWithOptions:0];
        [v4 setObject:v35 forKey:@"destinationPersistentData"];
      }
      else
      {
        [v4 setObject:v33 forKey:@"destinationPersistentData"];
      }
    }

    v36 = *(void **)(a1 + 16);
    if (v36)
    {
      v37 = [v36 dictionaryRepresentation];
      v38 = v37;
      if (a2)
      {
        v39 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __59__GEOStorageRouteRequestStorage__dictionaryRepresentation___block_invoke;
        v43[3] = &unk_1E53D8860;
        id v40 = v39;
        id v44 = v40;
        [v38 enumerateKeysAndObjectsUsingBlock:v43];
        id v41 = v40;

        v38 = v41;
      }
      [v4 setObject:v38 forKey:@"Unknown Fields"];
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
  return -[GEOStorageRouteRequestStorage _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOStorageRouteRequestStorage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStorageRouteRequestStorage)initWithDictionary:(id)a3
{
  return (GEOStorageRouteRequestStorage *)-[GEOStorageRouteRequestStorage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_70;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_70;
  }
  id v6 = [v5 objectForKeyedSubscript:@"waypoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v46 = v5;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v51 count:16];
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
            uint64_t v13 = [GEOComposedWaypoint alloc];
            if (a3) {
              uint64_t v14 = [(GEOComposedWaypoint *)v13 initWithJSON:v12];
            }
            else {
              uint64_t v14 = [(GEOComposedWaypoint *)v13 initWithDictionary:v12];
            }
            v15 = (void *)v14;
            [a1 addWaypoints:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v9);
    }

    id v5 = v46;
  }

  v16 = [v5 objectForKeyedSubscript:@"transportType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v16;
    if ([v17 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v18 = 0;
    }
    else if ([v17 isEqualToString:@"TRANSIT"])
    {
      uint64_t v18 = 1;
    }
    else if ([v17 isEqualToString:@"WALKING"])
    {
      uint64_t v18 = 2;
    }
    else if ([v17 isEqualToString:@"BICYCLE"])
    {
      uint64_t v18 = 3;
    }
    else if ([v17 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v18 = 4;
    }
    else if ([v17 isEqualToString:@"FERRY"])
    {
      uint64_t v18 = 5;
    }
    else if ([v17 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v18 = 6;
    }
    else
    {
      uint64_t v18 = 0;
    }

    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [v16 intValue];
LABEL_36:
    [a1 setTransportType:v18];
  }

  v19 = [v5 objectForKeyedSubscript:@"routeHandle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = [GEOURLRouteHandle alloc];
    if (a3) {
      uint64_t v21 = [(GEOURLRouteHandle *)v20 initWithJSON:v19];
    }
    else {
      uint64_t v21 = [(GEOURLRouteHandle *)v20 initWithDictionary:v19];
    }
    v22 = (void *)v21;
    [a1 setRouteHandle:v21];
  }
  v23 = [v5 objectForKeyedSubscript:@"automobileOptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = [GEOAutomobileOptions alloc];
    if (a3) {
      uint64_t v25 = [(GEOAutomobileOptions *)v24 initWithJSON:v23];
    }
    else {
      uint64_t v25 = [(GEOAutomobileOptions *)v24 initWithDictionary:v23];
    }
    v26 = (void *)v25;
    [a1 setAutomobileOptions:v25];
  }
  v27 = [v5 objectForKeyedSubscript:@"transitOptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v28 = [GEOTransitOptions alloc];
    if (a3) {
      uint64_t v29 = [(GEOTransitOptions *)v28 initWithJSON:v27];
    }
    else {
      uint64_t v29 = [(GEOTransitOptions *)v28 initWithDictionary:v27];
    }
    v30 = (void *)v29;
    [a1 setTransitOptions:v29];
  }
  v31 = [v5 objectForKeyedSubscript:@"walkingOptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = [GEOWalkingOptions alloc];
    if (a3) {
      uint64_t v33 = [(GEOWalkingOptions *)v32 initWithJSON:v31];
    }
    else {
      uint64_t v33 = [(GEOWalkingOptions *)v32 initWithDictionary:v31];
    }
    v34 = (void *)v33;
    [a1 setWalkingOptions:v33];
  }
  v35 = [v5 objectForKeyedSubscript:@"cyclingOptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36 = [GEOCyclingOptions alloc];
    if (a3) {
      uint64_t v37 = [(GEOCyclingOptions *)v36 initWithJSON:v35];
    }
    else {
      uint64_t v37 = [(GEOCyclingOptions *)v36 initWithDictionary:v35];
    }
    v38 = (void *)v37;
    [a1 setCyclingOptions:v37];
  }
  v39 = [v5 objectForKeyedSubscript:@"resumeRouteHandleStorage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v40 = [GEOStorageResumeRouteHandle alloc];
    if (a3) {
      uint64_t v41 = [(GEOStorageResumeRouteHandle *)v40 initWithJSON:v39];
    }
    else {
      uint64_t v41 = [(GEOStorageResumeRouteHandle *)v40 initWithDictionary:v39];
    }
    v42 = (void *)v41;
    [a1 setResumeRouteHandleStorage:v41];
  }
  v43 = [v5 objectForKeyedSubscript:@"destinationPersistentData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v43 options:0];
    [a1 setDestinationPersistentData:v44];
  }
LABEL_70:

  return a1;
}

- (GEOStorageRouteRequestStorage)initWithJSON:(id)a3
{
  return (GEOStorageRouteRequestStorage *)-[GEOStorageRouteRequestStorage _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_185;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_186;
    }
    GEOStorageRouteRequestStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOStorageRouteRequestStorageCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStorageRouteRequestStorageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStorageRouteRequestStorageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOStorageRouteRequestStorageIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
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
    [(GEOStorageRouteRequestStorage *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_waypoints;
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

    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_routeHandle) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_automobileOptions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_transitOptions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_walkingOptions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_cyclingOptions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_resumeRouteHandleStorage) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_destinationPersistentData) {
      PBDataWriterWriteDataField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOStorageRouteRequestStorage _readResumeRouteHandleStorage]((uint64_t)self);
  if ([(GEOStorageResumeRouteHandle *)self->_resumeRouteHandleStorage hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEOStorageRouteRequestStorage _readWaypoints]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_waypoints;
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
          goto LABEL_13;
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
LABEL_13:

  return v5;
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOStorageRouteRequestStorage *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 22) = self->_readerMarkPos;
  *((_DWORD *)v9 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOStorageRouteRequestStorage *)self waypointsCount])
  {
    [v9 clearWaypoints];
    unint64_t v4 = [(GEOStorageRouteRequestStorage *)self waypointsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOStorageRouteRequestStorage *)self waypointsAtIndex:i];
        [v9 addWaypoints:v7];
      }
    }
  }
  uint64_t v8 = v9;
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v9 + 25) = self->_transportType;
    *((_WORD *)v9 + 52) |= 1u;
  }
  if (self->_routeHandle)
  {
    objc_msgSend(v9, "setRouteHandle:");
    uint64_t v8 = v9;
  }
  if (self->_automobileOptions)
  {
    objc_msgSend(v9, "setAutomobileOptions:");
    uint64_t v8 = v9;
  }
  if (self->_transitOptions)
  {
    objc_msgSend(v9, "setTransitOptions:");
    uint64_t v8 = v9;
  }
  if (self->_walkingOptions)
  {
    objc_msgSend(v9, "setWalkingOptions:");
    uint64_t v8 = v9;
  }
  if (self->_cyclingOptions)
  {
    objc_msgSend(v9, "setCyclingOptions:");
    uint64_t v8 = v9;
  }
  if (self->_resumeRouteHandleStorage)
  {
    objc_msgSend(v9, "setResumeRouteHandleStorage:");
    uint64_t v8 = v9;
  }
  if (self->_destinationPersistentData)
  {
    objc_msgSend(v9, "setDestinationPersistentData:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOStorageRouteRequestStorageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOStorageRouteRequestStorage *)self readAll:0];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v9 = self->_waypoints;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
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
        long long v13 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (void)v30);
        [(id)v5 addWaypoints:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v10);
  }

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 100) = self->_transportType;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  id v14 = -[GEOURLRouteHandle copyWithZone:](self->_routeHandle, "copyWithZone:", a3, (void)v30);
  long long v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  id v16 = [(GEOAutomobileOptions *)self->_automobileOptions copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  id v18 = [(GEOTransitOptions *)self->_transitOptions copyWithZone:a3];
  v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  id v20 = [(GEOWalkingOptions *)self->_walkingOptions copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v20;

  id v22 = [(GEOCyclingOptions *)self->_cyclingOptions copyWithZone:a3];
  v23 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v22;

  id v24 = [(GEOStorageResumeRouteHandle *)self->_resumeRouteHandleStorage copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v24;

  uint64_t v26 = [(NSData *)self->_destinationPersistentData copyWithZone:a3];
  v27 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v26;

  v28 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v28;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEOStorageRouteRequestStorage *)self readAll:1];
  [v4 readAll:1];
  waypoints = self->_waypoints;
  if ((unint64_t)waypoints | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](waypoints, "isEqual:")) {
      goto LABEL_23;
    }
  }
  __int16 v6 = *((_WORD *)v4 + 52);
  if (*(_WORD *)&self->_flags)
  {
    if ((v6 & 1) == 0 || self->_transportType != *((_DWORD *)v4 + 25)) {
      goto LABEL_23;
    }
  }
  else if (v6)
  {
LABEL_23:
    char v14 = 0;
    goto LABEL_24;
  }
  routeHandle = self->_routeHandle;
  if ((unint64_t)routeHandle | *((void *)v4 + 7) && !-[GEOURLRouteHandle isEqual:](routeHandle, "isEqual:")) {
    goto LABEL_23;
  }
  automobileOptions = self->_automobileOptions;
  if ((unint64_t)automobileOptions | *((void *)v4 + 3))
  {
    if (!-[GEOAutomobileOptions isEqual:](automobileOptions, "isEqual:")) {
      goto LABEL_23;
    }
  }
  transitOptions = self->_transitOptions;
  if ((unint64_t)transitOptions | *((void *)v4 + 8))
  {
    if (!-[GEOTransitOptions isEqual:](transitOptions, "isEqual:")) {
      goto LABEL_23;
    }
  }
  walkingOptions = self->_walkingOptions;
  if ((unint64_t)walkingOptions | *((void *)v4 + 9))
  {
    if (!-[GEOWalkingOptions isEqual:](walkingOptions, "isEqual:")) {
      goto LABEL_23;
    }
  }
  cyclingOptions = self->_cyclingOptions;
  if ((unint64_t)cyclingOptions | *((void *)v4 + 4))
  {
    if (!-[GEOCyclingOptions isEqual:](cyclingOptions, "isEqual:")) {
      goto LABEL_23;
    }
  }
  resumeRouteHandleStorage = self->_resumeRouteHandleStorage;
  if ((unint64_t)resumeRouteHandleStorage | *((void *)v4 + 6))
  {
    if (!-[GEOStorageResumeRouteHandle isEqual:](resumeRouteHandleStorage, "isEqual:")) {
      goto LABEL_23;
    }
  }
  destinationPersistentData = self->_destinationPersistentData;
  if ((unint64_t)destinationPersistentData | *((void *)v4 + 5)) {
    char v14 = -[NSData isEqual:](destinationPersistentData, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_24:

  return v14;
}

- (unint64_t)hash
{
  [(GEOStorageRouteRequestStorage *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_waypoints hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_transportType;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(GEOURLRouteHandle *)self->_routeHandle hash];
  unint64_t v7 = v5 ^ v6 ^ [(GEOAutomobileOptions *)self->_automobileOptions hash];
  unint64_t v8 = [(GEOTransitOptions *)self->_transitOptions hash];
  unint64_t v9 = v8 ^ [(GEOWalkingOptions *)self->_walkingOptions hash];
  unint64_t v10 = v7 ^ v9 ^ [(GEOCyclingOptions *)self->_cyclingOptions hash];
  unint64_t v11 = [(GEOStorageResumeRouteHandle *)self->_resumeRouteHandleStorage hash];
  return v10 ^ v11 ^ [(NSData *)self->_destinationPersistentData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = *((id *)v4 + 10);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOStorageRouteRequestStorage addWaypoints:](self, "addWaypoints:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  if (*((_WORD *)v4 + 52))
  {
    self->_transportType = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 1u;
  }
  routeHandle = self->_routeHandle;
  uint64_t v11 = *((void *)v4 + 7);
  if (routeHandle)
  {
    if (v11) {
      -[GEOURLRouteHandle mergeFrom:](routeHandle, "mergeFrom:");
    }
  }
  else if (v11)
  {
    [(GEOStorageRouteRequestStorage *)self setRouteHandle:"setRouteHandle:"];
  }
  automobileOptions = self->_automobileOptions;
  uint64_t v13 = *((void *)v4 + 3);
  if (automobileOptions)
  {
    if (v13) {
      -[GEOAutomobileOptions mergeFrom:](automobileOptions, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOStorageRouteRequestStorage setAutomobileOptions:](self, "setAutomobileOptions:");
  }
  transitOptions = self->_transitOptions;
  uint64_t v15 = *((void *)v4 + 8);
  if (transitOptions)
  {
    if (v15) {
      -[GEOTransitOptions mergeFrom:](transitOptions, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEOStorageRouteRequestStorage setTransitOptions:](self, "setTransitOptions:");
  }
  walkingOptions = self->_walkingOptions;
  uint64_t v17 = *((void *)v4 + 9);
  if (walkingOptions)
  {
    if (v17) {
      -[GEOWalkingOptions mergeFrom:](walkingOptions, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEOStorageRouteRequestStorage setWalkingOptions:](self, "setWalkingOptions:");
  }
  cyclingOptions = self->_cyclingOptions;
  uint64_t v19 = *((void *)v4 + 4);
  if (cyclingOptions)
  {
    if (v19) {
      -[GEOCyclingOptions mergeFrom:](cyclingOptions, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[GEOStorageRouteRequestStorage setCyclingOptions:](self, "setCyclingOptions:");
  }
  resumeRouteHandleStorage = self->_resumeRouteHandleStorage;
  uint64_t v21 = *((void *)v4 + 6);
  if (resumeRouteHandleStorage)
  {
    if (v21) {
      -[GEOStorageResumeRouteHandle mergeFrom:](resumeRouteHandleStorage, "mergeFrom:");
    }
  }
  else if (v21)
  {
    [(GEOStorageRouteRequestStorage *)self setResumeRouteHandleStorage:"setResumeRouteHandleStorage:"];
  }
  if (*((void *)v4 + 5)) {
    -[GEOStorageRouteRequestStorage setDestinationPersistentData:](self, "setDestinationPersistentData:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOStorageRouteRequestStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_190);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x402u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOStorageRouteRequestStorage *)self readAll:0];
    [(GEOAutomobileOptions *)self->_automobileOptions clearUnknownFields:1];
    [(GEOTransitOptions *)self->_transitOptions clearUnknownFields:1];
    [(GEOWalkingOptions *)self->_walkingOptions clearUnknownFields:1];
    [(GEOCyclingOptions *)self->_cyclingOptions clearUnknownFields:1];
    resumeRouteHandleStorage = self->_resumeRouteHandleStorage;
    [(GEOStorageResumeRouteHandle *)resumeRouteHandleStorage clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_routeHandle, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandleStorage, 0);
  objc_storeStrong((id *)&self->_destinationPersistentData, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end