@interface GEORecentLocationHistory
+ (BOOL)isValid:(id)a3;
+ (Class)relativeLocationsType;
- (BOOL)hasBaseDistanceToDestination;
- (BOOL)hasBaseLocation;
- (BOOL)hasBaseTimestamp;
- (BOOL)hasEncodedDistancesToDestination;
- (BOOL)hasEncodedLats;
- (BOOL)hasEncodedLngs;
- (BOOL)hasLatlngCount;
- (BOOL)hasTimeResolution;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLngE7)baseLocation;
- (GEORecentLocationHistory)init;
- (GEORecentLocationHistory)initWithData:(id)a3;
- (GEORecentLocationHistory)initWithDictionary:(id)a3;
- (GEORecentLocationHistory)initWithJSON:(id)a3;
- (NSData)encodedDistancesToDestination;
- (NSData)encodedLats;
- (NSData)encodedLngs;
- (NSMutableArray)relativeLocations;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)relativeLocationsAtIndex:(unint64_t)a3;
- (int)relativeDistanceToDestinationAtIndex:(unint64_t)a3;
- (int)relativeDistanceToDestinations;
- (unint64_t)baseTimestamp;
- (unint64_t)hash;
- (unint64_t)relativeDistanceToDestinationsCount;
- (unint64_t)relativeLocationsCount;
- (unsigned)baseDistanceToDestination;
- (unsigned)latlngCount;
- (unsigned)timeResolution;
- (void)_addNoFlagsRelativeLocations:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readBaseLocation;
- (void)_readEncodedDistancesToDestination;
- (void)_readEncodedLats;
- (void)_readEncodedLngs;
- (void)_readRelativeDistanceToDestinations;
- (void)_readRelativeLocations;
- (void)addRelativeDistanceToDestination:(int)a3;
- (void)addRelativeLocations:(id)a3;
- (void)clearRelativeDistanceToDestinations;
- (void)clearRelativeLocations;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBaseDistanceToDestination:(unsigned int)a3;
- (void)setBaseLocation:(id)a3;
- (void)setBaseTimestamp:(unint64_t)a3;
- (void)setEncodedDistancesToDestination:(id)a3;
- (void)setEncodedLats:(id)a3;
- (void)setEncodedLngs:(id)a3;
- (void)setHasBaseDistanceToDestination:(BOOL)a3;
- (void)setHasBaseTimestamp:(BOOL)a3;
- (void)setHasLatlngCount:(BOOL)a3;
- (void)setHasTimeResolution:(BOOL)a3;
- (void)setLatlngCount:(unsigned int)a3;
- (void)setRelativeDistanceToDestinations:(int *)a3 count:(unint64_t)a4;
- (void)setRelativeLocations:(id)a3;
- (void)setTimeResolution:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORecentLocationHistory

- (GEORecentLocationHistory)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORecentLocationHistory;
  v2 = [(GEORecentLocationHistory *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORecentLocationHistory)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORecentLocationHistory;
  v3 = [(GEORecentLocationHistory *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEORecentLocationHistory;
  [(GEORecentLocationHistory *)&v3 dealloc];
}

- (void)_readBaseLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 120) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORecentLocationHistoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBaseLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasBaseLocation
{
  return self->_baseLocation != 0;
}

- (GEOLatLngE7)baseLocation
{
  -[GEORecentLocationHistory _readBaseLocation]((uint64_t)self);
  baseLocation = self->_baseLocation;

  return baseLocation;
}

- (void)setBaseLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_baseLocation, a3);
}

- (unint64_t)baseTimestamp
{
  return self->_baseTimestamp;
}

- (void)setBaseTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_baseTimestamp = a3;
}

- (void)setHasBaseTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasBaseTimestamp
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readRelativeLocations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 120) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORecentLocationHistoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRelativeLocations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)relativeLocations
{
  -[GEORecentLocationHistory _readRelativeLocations]((uint64_t)self);
  relativeLocations = self->_relativeLocations;

  return relativeLocations;
}

- (void)setRelativeLocations:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  relativeLocations = self->_relativeLocations;
  self->_relativeLocations = v4;
}

- (void)clearRelativeLocations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  relativeLocations = self->_relativeLocations;

  [(NSMutableArray *)relativeLocations removeAllObjects];
}

- (void)addRelativeLocations:(id)a3
{
  id v4 = a3;
  -[GEORecentLocationHistory _readRelativeLocations]((uint64_t)self);
  -[GEORecentLocationHistory _addNoFlagsRelativeLocations:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsRelativeLocations:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)relativeLocationsCount
{
  -[GEORecentLocationHistory _readRelativeLocations]((uint64_t)self);
  relativeLocations = self->_relativeLocations;

  return [(NSMutableArray *)relativeLocations count];
}

- (id)relativeLocationsAtIndex:(unint64_t)a3
{
  -[GEORecentLocationHistory _readRelativeLocations]((uint64_t)self);
  relativeLocations = self->_relativeLocations;

  return (id)[(NSMutableArray *)relativeLocations objectAtIndex:a3];
}

+ (Class)relativeLocationsType
{
  return (Class)objc_opt_class();
}

- (unsigned)timeResolution
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_timeResolution;
  }
  else {
    return 1;
  }
}

- (void)setTimeResolution:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_timeResolution = a3;
}

- (void)setHasTimeResolution:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2056;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasTimeResolution
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)baseDistanceToDestination
{
  return self->_baseDistanceToDestination;
}

- (void)setBaseDistanceToDestination:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_baseDistanceToDestination = a3;
}

- (void)setHasBaseDistanceToDestination:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2050;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasBaseDistanceToDestination
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readRelativeDistanceToDestinations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 120) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORecentLocationHistoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRelativeDistanceToDestinations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)relativeDistanceToDestinationsCount
{
  return self->_relativeDistanceToDestinations.count;
}

- (int)relativeDistanceToDestinations
{
  return self->_relativeDistanceToDestinations.list;
}

- (void)clearRelativeDistanceToDestinations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;

  PBRepeatedInt32Clear();
}

- (void)addRelativeDistanceToDestination:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (int)relativeDistanceToDestinationAtIndex:(unint64_t)a3
{
  -[GEORecentLocationHistory _readRelativeDistanceToDestinations]((uint64_t)self);
  p_relativeDistanceToDestinations = &self->_relativeDistanceToDestinations;
  unint64_t count = self->_relativeDistanceToDestinations.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_relativeDistanceToDestinations->list[a3];
}

- (void)setRelativeDistanceToDestinations:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;

  MEMORY[0x1F4147390](&self->_relativeDistanceToDestinations, a3, a4);
}

- (unsigned)latlngCount
{
  return self->_latlngCount;
}

- (void)setLatlngCount:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_latlngCount = a3;
}

- (void)setHasLatlngCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2052;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasLatlngCount
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readEncodedLats
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 120) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORecentLocationHistoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEncodedLats_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasEncodedLats
{
  return self->_encodedLats != 0;
}

- (NSData)encodedLats
{
  -[GEORecentLocationHistory _readEncodedLats]((uint64_t)self);
  encodedLats = self->_encodedLats;

  return encodedLats;
}

- (void)setEncodedLats:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_encodedLats, a3);
}

- (void)_readEncodedLngs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 120) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORecentLocationHistoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEncodedLngs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasEncodedLngs
{
  return self->_encodedLngs != 0;
}

- (NSData)encodedLngs
{
  -[GEORecentLocationHistory _readEncodedLngs]((uint64_t)self);
  encodedLngs = self->_encodedLngs;

  return encodedLngs;
}

- (void)setEncodedLngs:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_encodedLngs, a3);
}

- (void)_readEncodedDistancesToDestination
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 120) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORecentLocationHistoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEncodedDistancesToDestination_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasEncodedDistancesToDestination
{
  return self->_encodedDistancesToDestination != 0;
}

- (NSData)encodedDistancesToDestination
{
  -[GEORecentLocationHistory _readEncodedDistancesToDestination]((uint64_t)self);
  encodedDistancesToDestination = self->_encodedDistancesToDestination;

  return encodedDistancesToDestination;
}

- (void)setEncodedDistancesToDestination:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_encodedDistancesToDestination, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORecentLocationHistory;
  id v4 = [(GEORecentLocationHistory *)&v8 description];
  id v5 = [(GEORecentLocationHistory *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORecentLocationHistory _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 baseLocation];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"baseLocation";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"base_location";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(_WORD *)(a1 + 120))
    {
      v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
      if (a2) {
        v10 = @"baseTimestamp";
      }
      else {
        v10 = @"base_timestamp";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if ([*(id *)(a1 + 88) count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v12 = *(id *)(a1 + 88);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v48 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            v18 = [v17 dictionaryRepresentation];
            }
            [v11 addObject:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v14);
      }

      if (a2) {
        v19 = @"relativeLocations";
      }
      else {
        v19 = @"relative_locations";
      }
      [v4 setObject:v11 forKey:v19];
    }
    __int16 v20 = *(_WORD *)(a1 + 120);
    if ((v20 & 8) != 0)
    {
      v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 116)];
      if (a2) {
        v22 = @"timeResolution";
      }
      else {
        v22 = @"time_resolution";
      }
      [v4 setObject:v21 forKey:v22];

      __int16 v20 = *(_WORD *)(a1 + 120);
    }
    if ((v20 & 2) != 0)
    {
      v23 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 108)];
      if (a2) {
        v24 = @"baseDistanceToDestination";
      }
      else {
        v24 = @"base_distance_to_destination";
      }
      [v4 setObject:v23 forKey:v24];
    }
    if (*(void *)(a1 + 32))
    {
      v25 = PBRepeatedInt32NSArray();
      if (a2) {
        v26 = @"relativeDistanceToDestination";
      }
      else {
        v26 = @"relative_distance_to_destination";
      }
      [v4 setObject:v25 forKey:v26];
    }
    if ((*(_WORD *)(a1 + 120) & 4) != 0)
    {
      v27 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 112)];
      if (a2) {
        v28 = @"latlngCount";
      }
      else {
        v28 = @"latlng_count";
      }
      [v4 setObject:v27 forKey:v28];
    }
    v29 = [(id)a1 encodedLats];
    v30 = v29;
    if (v29)
    {
      if (a2)
      {
        v31 = [v29 base64EncodedStringWithOptions:0];
        [v4 setObject:v31 forKey:@"encodedLats"];
      }
      else
      {
        [v4 setObject:v29 forKey:@"encoded_lats"];
      }
    }

    v32 = [(id)a1 encodedLngs];
    v33 = v32;
    if (v32)
    {
      if (a2)
      {
        v34 = [v32 base64EncodedStringWithOptions:0];
        [v4 setObject:v34 forKey:@"encodedLngs"];
      }
      else
      {
        [v4 setObject:v32 forKey:@"encoded_lngs"];
      }
    }

    v35 = [(id)a1 encodedDistancesToDestination];
    v36 = v35;
    if (v35)
    {
      if (a2)
      {
        v37 = [v35 base64EncodedStringWithOptions:0];
        [v4 setObject:v37 forKey:@"encodedDistancesToDestination"];
      }
      else
      {
        [v4 setObject:v35 forKey:@"encoded_distances_to_destination"];
      }
    }

    v38 = *(void **)(a1 + 16);
    if (v38)
    {
      v39 = [v38 dictionaryRepresentation];
      v40 = v39;
      if (a2)
      {
        v41 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v39, "count"));
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __54__GEORecentLocationHistory__dictionaryRepresentation___block_invoke;
        v45[3] = &unk_1E53D8860;
        id v42 = v41;
        id v46 = v42;
        [v40 enumerateKeysAndObjectsUsingBlock:v45];
        id v43 = v42;

        v40 = v43;
      }
      [v4 setObject:v40 forKey:@"Unknown Fields"];
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
  return -[GEORecentLocationHistory _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEORecentLocationHistory__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORecentLocationHistory)initWithDictionary:(id)a3
{
  return (GEORecentLocationHistory *)-[GEORecentLocationHistory _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"baseLocation";
      }
      else {
        objc_super v6 = @"base_location";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOLatLngE7 alloc];
        if (a3) {
          uint64_t v9 = [(GEOLatLngE7 *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOLatLngE7 *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setBaseLocation:v9];
      }
      if (a3) {
        v11 = @"baseTimestamp";
      }
      else {
        v11 = @"base_timestamp";
      }
      id v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBaseTimestamp:", objc_msgSend(v12, "unsignedLongLongValue"));
      }

      if (a3) {
        uint64_t v13 = @"relativeLocations";
      }
      else {
        uint64_t v13 = @"relative_locations";
      }
      uint64_t v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v48 = v14;
        id v49 = v5;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v54 objects:v59 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v55 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v54 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v21 = [GEOLatLngE7 alloc];
                if (a3) {
                  uint64_t v22 = [(GEOLatLngE7 *)v21 initWithJSON:v20];
                }
                else {
                  uint64_t v22 = [(GEOLatLngE7 *)v21 initWithDictionary:v20];
                }
                v23 = (void *)v22;
                objc_msgSend(a1, "addRelativeLocations:", v22, v48, v49);
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v54 objects:v59 count:16];
          }
          while (v17);
        }

        uint64_t v14 = v48;
        id v5 = v49;
      }

      if (a3) {
        v24 = @"timeResolution";
      }
      else {
        v24 = @"time_resolution";
      }
      v25 = objc_msgSend(v5, "objectForKeyedSubscript:", v24, v48, v49);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTimeResolution:", objc_msgSend(v25, "unsignedIntValue"));
      }

      if (a3) {
        v26 = @"baseDistanceToDestination";
      }
      else {
        v26 = @"base_distance_to_destination";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBaseDistanceToDestination:", objc_msgSend(v27, "unsignedIntValue"));
      }

      if (a3) {
        v28 = @"relativeDistanceToDestination";
      }
      else {
        v28 = @"relative_distance_to_destination";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v30 = v29;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v51;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v51 != v33) {
                objc_enumerationMutation(v30);
              }
              v35 = *(void **)(*((void *)&v50 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addRelativeDistanceToDestination:", objc_msgSend(v35, "intValue"));
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v50 objects:v58 count:16];
          }
          while (v32);
        }
      }
      if (a3) {
        v36 = @"latlngCount";
      }
      else {
        v36 = @"latlng_count";
      }
      v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLatlngCount:", objc_msgSend(v37, "unsignedIntValue"));
      }

      if (a3) {
        v38 = @"encodedLats";
      }
      else {
        v38 = @"encoded_lats";
      }
      v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v39 options:0];
        [a1 setEncodedLats:v40];
      }
      if (a3) {
        v41 = @"encodedLngs";
      }
      else {
        v41 = @"encoded_lngs";
      }
      id v42 = [v5 objectForKeyedSubscript:v41];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v43 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v42 options:0];
        [a1 setEncodedLngs:v43];
      }
      if (a3) {
        v44 = @"encodedDistancesToDestination";
      }
      else {
        v44 = @"encoded_distances_to_destination";
      }
      v45 = [v5 objectForKeyedSubscript:v44];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v46 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v45 options:0];
        [a1 setEncodedDistancesToDestination:v46];
      }
    }
  }

  return a1;
}

- (GEORecentLocationHistory)initWithJSON:(id)a3
{
  return (GEORecentLocationHistory *)-[GEORecentLocationHistory _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_4732;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_4733;
    }
    GEORecentLocationHistoryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORecentLocationHistoryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORecentLocationHistoryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORecentLocationHistoryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0xFE0) == 0))
  {
    id v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORecentLocationHistory *)self readAll:0];
    if (self->_baseLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v6 = self->_relativeLocations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_relativeDistanceToDestinations.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < self->_relativeDistanceToDestinations.count);
    }
    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_encodedLats) {
      PBDataWriterWriteDataField();
    }
    if (self->_encodedLngs) {
      PBDataWriterWriteDataField();
    }
    if (self->_encodedDistancesToDestination) {
      PBDataWriterWriteDataField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v13 = (id *)a3;
  [(GEORecentLocationHistory *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 24) = self->_readerMarkPos;
  *((_DWORD *)v13 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_baseLocation) {
    objc_msgSend(v13, "setBaseLocation:");
  }
  if (*(_WORD *)&self->_flags)
  {
    v13[7] = self->_baseTimestamp;
    *((_WORD *)v13 + 60) |= 1u;
  }
  if ([(GEORecentLocationHistory *)self relativeLocationsCount])
  {
    [v13 clearRelativeLocations];
    unint64_t v4 = [(GEORecentLocationHistory *)self relativeLocationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORecentLocationHistory *)self relativeLocationsAtIndex:i];
        [v13 addRelativeLocations:v7];
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v13 + 29) = self->_timeResolution;
    *((_WORD *)v13 + 60) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v13 + 27) = self->_baseDistanceToDestination;
    *((_WORD *)v13 + 60) |= 2u;
  }
  if ([(GEORecentLocationHistory *)self relativeDistanceToDestinationsCount])
  {
    [v13 clearRelativeDistanceToDestinations];
    unint64_t v9 = [(GEORecentLocationHistory *)self relativeDistanceToDestinationsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        objc_msgSend(v13, "addRelativeDistanceToDestination:", -[GEORecentLocationHistory relativeDistanceToDestinationAtIndex:](self, "relativeDistanceToDestinationAtIndex:", j));
    }
  }
  id v12 = v13;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v13 + 28) = self->_latlngCount;
    *((_WORD *)v13 + 60) |= 4u;
  }
  if (self->_encodedLats)
  {
    objc_msgSend(v13, "setEncodedLats:");
    id v12 = v13;
  }
  if (self->_encodedLngs)
  {
    objc_msgSend(v13, "setEncodedLngs:");
    id v12 = v13;
  }
  if (self->_encodedDistancesToDestination)
  {
    objc_msgSend(v13, "setEncodedDistancesToDestination:");
    id v12 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORecentLocationHistoryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORecentLocationHistory *)self readAll:0];
  id v9 = [(GEOLatLngE7 *)self->_baseLocation copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  if (*(_WORD *)&self->_flags)
  {
    *(void *)(v5 + 56) = self->_baseTimestamp;
    *(_WORD *)(v5 + 120) |= 1u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v11 = self->_relativeLocations;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (void)v25);
        [(id)v5 addRelativeLocations:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_timeResolution;
    *(_WORD *)(v5 + 120) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_baseDistanceToDestination;
    *(_WORD *)(v5 + 120) |= 2u;
  }
  PBRepeatedInt32Copy();
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_latlngCount;
    *(_WORD *)(v5 + 120) |= 4u;
  }
  uint64_t v17 = -[NSData copyWithZone:](self->_encodedLats, "copyWithZone:", a3, (void)v25);
  uint64_t v18 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v17;

  uint64_t v19 = [(NSData *)self->_encodedLngs copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v19;

  uint64_t v21 = [(NSData *)self->_encodedDistancesToDestination copyWithZone:a3];
  uint64_t v22 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v21;

  v23 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v23;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  [(GEORecentLocationHistory *)self readAll:1];
  [v4 readAll:1];
  baseLocation = self->_baseLocation;
  if ((unint64_t)baseLocation | *((void *)v4 + 6))
  {
    if (!-[GEOLatLngE7 isEqual:](baseLocation, "isEqual:")) {
      goto LABEL_34;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 60);
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_baseTimestamp != *((void *)v4 + 7)) {
      goto LABEL_34;
    }
  }
  else if (v7)
  {
    goto LABEL_34;
  }
  relativeLocations = self->_relativeLocations;
  if ((unint64_t)relativeLocations | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](relativeLocations, "isEqual:")) {
      goto LABEL_34;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v7 = *((_WORD *)v4 + 60);
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_timeResolution != *((_DWORD *)v4 + 29)) {
      goto LABEL_34;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_baseDistanceToDestination != *((_DWORD *)v4 + 27)) {
      goto LABEL_34;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_34;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_34:
    char v13 = 0;
    goto LABEL_35;
  }
  __int16 v9 = *((_WORD *)v4 + 60);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_latlngCount != *((_DWORD *)v4 + 28)) {
      goto LABEL_34;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_34;
  }
  encodedLats = self->_encodedLats;
  if ((unint64_t)encodedLats | *((void *)v4 + 9) && !-[NSData isEqual:](encodedLats, "isEqual:")) {
    goto LABEL_34;
  }
  encodedLngs = self->_encodedLngs;
  if ((unint64_t)encodedLngs | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](encodedLngs, "isEqual:")) {
      goto LABEL_34;
    }
  }
  encodedDistancesToDestination = self->_encodedDistancesToDestination;
  if ((unint64_t)encodedDistancesToDestination | *((void *)v4 + 8)) {
    char v13 = -[NSData isEqual:](encodedDistancesToDestination, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_35:

  return v13;
}

- (unint64_t)hash
{
  [(GEORecentLocationHistory *)self readAll:1];
  unint64_t v3 = [(GEOLatLngE7 *)self->_baseLocation hash];
  if (*(_WORD *)&self->_flags) {
    unint64_t v4 = 2654435761u * self->_baseTimestamp;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_relativeLocations hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_timeResolution;
    if ((flags & 2) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((flags & 2) != 0)
    {
LABEL_6:
      uint64_t v8 = 2654435761 * self->_baseDistanceToDestination;
      goto LABEL_9;
    }
  }
  uint64_t v8 = 0;
LABEL_9:
  uint64_t v9 = PBRepeatedInt32Hash();
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v10 = 2654435761 * self->_latlngCount;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSData *)self->_encodedLats hash];
  uint64_t v12 = [(NSData *)self->_encodedLngs hash];
  return v11 ^ v12 ^ [(NSData *)self->_encodedDistancesToDestination hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  baseLocation = self->_baseLocation;
  uint64_t v6 = *((void *)v4 + 6);
  if (baseLocation)
  {
    if (v6) {
      -[GEOLatLngE7 mergeFrom:](baseLocation, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORecentLocationHistory setBaseLocation:](self, "setBaseLocation:");
  }
  if (*((_WORD *)v4 + 60))
  {
    self->_baseTimestamp = *((void *)v4 + 7);
    *(_WORD *)&self->_flags |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = *((id *)v4 + 11);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEORecentLocationHistory addRelativeLocations:](self, "addRelativeLocations:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  __int16 v12 = *((_WORD *)v4 + 60);
  if ((v12 & 8) != 0)
  {
    self->_timeResolution = *((_DWORD *)v4 + 29);
    *(_WORD *)&self->_flags |= 8u;
    __int16 v12 = *((_WORD *)v4 + 60);
  }
  if ((v12 & 2) != 0)
  {
    self->_baseDistanceToDestination = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_flags |= 2u;
  }
  uint64_t v13 = objc_msgSend(v4, "relativeDistanceToDestinationsCount", (void)v16);
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t j = 0; j != v14; ++j)
      -[GEORecentLocationHistory addRelativeDistanceToDestination:](self, "addRelativeDistanceToDestination:", [v4 relativeDistanceToDestinationAtIndex:j]);
  }
  if ((*((_WORD *)v4 + 60) & 4) != 0)
  {
    self->_latlngCount = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_flags |= 4u;
  }
  if (*((void *)v4 + 9)) {
    -[GEORecentLocationHistory setEncodedLats:](self, "setEncodedLats:");
  }
  if (*((void *)v4 + 10)) {
    -[GEORecentLocationHistory setEncodedLngs:](self, "setEncodedLngs:");
  }
  if (*((void *)v4 + 8)) {
    -[GEORecentLocationHistory setEncodedDistancesToDestination:](self, "setEncodedDistancesToDestination:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORecentLocationHistoryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4737);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x810u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORecentLocationHistory *)self readAll:0];
    [(GEOLatLngE7 *)self->_baseLocation clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_relativeLocations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeLocations, 0);
  objc_storeStrong((id *)&self->_encodedLngs, 0);
  objc_storeStrong((id *)&self->_encodedLats, 0);
  objc_storeStrong((id *)&self->_encodedDistancesToDestination, 0);
  objc_storeStrong((id *)&self->_baseLocation, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end