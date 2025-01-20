@interface GEOTransitVehicleInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasArrivalTime;
- (BOOL)hasDepartureFrequencyMax;
- (BOOL)hasDepartureFrequencyMin;
- (BOOL)hasDepartureTime;
- (BOOL)hasLineIndex;
- (BOOL)hasPickupDropoffType;
- (BOOL)hasRouteLineArtworkIndex;
- (BOOL)hasTripMuid;
- (BOOL)hasVehicleNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitVehicleInfo)init;
- (GEOTransitVehicleInfo)initWithData:(id)a3;
- (GEOTransitVehicleInfo)initWithDictionary:(id)a3;
- (GEOTransitVehicleInfo)initWithJSON:(id)a3;
- (GEOTransitVehicleTime)arrivalTime;
- (GEOTransitVehicleTime)departureTime;
- (NSString)vehicleNumber;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)pickupDropoffTypeAsString:(int)a3;
- (int)StringAsPickupDropoffType:(id)a3;
- (int)pickupDropoffType;
- (unint64_t)clusteredRouteLineArtworkIndexsCount;
- (unint64_t)hash;
- (unint64_t)tripMuid;
- (unsigned)clusteredRouteLineArtworkIndexAtIndex:(unint64_t)a3;
- (unsigned)clusteredRouteLineArtworkIndexs;
- (unsigned)departureFrequencyMax;
- (unsigned)departureFrequencyMin;
- (unsigned)lineIndex;
- (unsigned)routeLineArtworkIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArrivalTime;
- (void)_readClusteredRouteLineArtworkIndexs;
- (void)_readDepartureTime;
- (void)_readVehicleNumber;
- (void)addClusteredRouteLineArtworkIndex:(unsigned int)a3;
- (void)clearClusteredRouteLineArtworkIndexs;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArrivalTime:(id)a3;
- (void)setClusteredRouteLineArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDepartureFrequencyMax:(unsigned int)a3;
- (void)setDepartureFrequencyMin:(unsigned int)a3;
- (void)setDepartureTime:(id)a3;
- (void)setHasDepartureFrequencyMax:(BOOL)a3;
- (void)setHasDepartureFrequencyMin:(BOOL)a3;
- (void)setHasLineIndex:(BOOL)a3;
- (void)setHasPickupDropoffType:(BOOL)a3;
- (void)setHasRouteLineArtworkIndex:(BOOL)a3;
- (void)setHasTripMuid:(BOOL)a3;
- (void)setLineIndex:(unsigned int)a3;
- (void)setPickupDropoffType:(int)a3;
- (void)setRouteLineArtworkIndex:(unsigned int)a3;
- (void)setTripMuid:(unint64_t)a3;
- (void)setVehicleNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitVehicleInfo

- (GEOTransitVehicleInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitVehicleInfo;
  v2 = [(GEOTransitVehicleInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitVehicleInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitVehicleInfo;
  v3 = [(GEOTransitVehicleInfo *)&v7 initWithData:a3];
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
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitVehicleInfo;
  [(GEOTransitVehicleInfo *)&v3 dealloc];
}

- (void)_readArrivalTime
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitVehicleInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArrivalTime_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasArrivalTime
{
  return self->_arrivalTime != 0;
}

- (GEOTransitVehicleTime)arrivalTime
{
  -[GEOTransitVehicleInfo _readArrivalTime]((uint64_t)self);
  arrivalTime = self->_arrivalTime;

  return arrivalTime;
}

- (void)setArrivalTime:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_arrivalTime, a3);
}

- (void)_readDepartureTime
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitVehicleInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDepartureTime_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasDepartureTime
{
  return self->_departureTime != 0;
}

- (GEOTransitVehicleTime)departureTime
{
  -[GEOTransitVehicleInfo _readDepartureTime]((uint64_t)self);
  departureTime = self->_departureTime;

  return departureTime;
}

- (void)setDepartureTime:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_departureTime, a3);
}

- (unsigned)lineIndex
{
  return self->_lineIndex;
}

- (void)setLineIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_lineIndex = a3;
}

- (void)setHasLineIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2056;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLineIndex
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)routeLineArtworkIndex
{
  return self->_routeLineArtworkIndex;
}

- (void)setRouteLineArtworkIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  self->_routeLineArtworkIndex = a3;
}

- (void)setHasRouteLineArtworkIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2080;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasRouteLineArtworkIndex
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (void)_readClusteredRouteLineArtworkIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitVehicleInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClusteredRouteLineArtworkIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)clusteredRouteLineArtworkIndexsCount
{
  return self->_clusteredRouteLineArtworkIndexs.count;
}

- (unsigned)clusteredRouteLineArtworkIndexs
{
  return self->_clusteredRouteLineArtworkIndexs.list;
}

- (void)clearClusteredRouteLineArtworkIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;

  PBRepeatedUInt32Clear();
}

- (void)addClusteredRouteLineArtworkIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (unsigned)clusteredRouteLineArtworkIndexAtIndex:(unint64_t)a3
{
  -[GEOTransitVehicleInfo _readClusteredRouteLineArtworkIndexs]((uint64_t)self);
  p_clusteredRouteLineArtworkIndexs = &self->_clusteredRouteLineArtworkIndexs;
  unint64_t count = self->_clusteredRouteLineArtworkIndexs.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_clusteredRouteLineArtworkIndexs->list[a3];
}

- (void)setClusteredRouteLineArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;

  MEMORY[0x1F4147400](&self->_clusteredRouteLineArtworkIndexs, a3, a4);
}

- (int)pickupDropoffType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0) {
    return self->_pickupDropoffType;
  }
  else {
    return 0;
  }
}

- (void)setPickupDropoffType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_pickupDropoffType = a3;
}

- (void)setHasPickupDropoffType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2064;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasPickupDropoffType
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (id)pickupDropoffTypeAsString:(int)a3
{
  v4 = @"REGULAR";
  switch(a3)
  {
    case 0:
      goto LABEL_16;
    case 1:
      v4 = @"NOT_AVAILABLE";
      break;
    case 2:
      v4 = @"PHONE_AGENCY";
      break;
    case 3:
      v4 = @"COORDINATE_WITH_DRIVER";
      break;
    default:
      if (a3 == 100)
      {
        v4 = @"STOP_SKIPPED";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:
      }
      break;
  }
  return v4;
}

- (int)StringAsPickupDropoffType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"REGULAR"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOT_AVAILABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PHONE_AGENCY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"COORDINATE_WITH_DRIVER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"STOP_SKIPPED"])
  {
    int v4 = 100;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)departureFrequencyMin
{
  return self->_departureFrequencyMin;
}

- (void)setDepartureFrequencyMin:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_departureFrequencyMin = a3;
}

- (void)setHasDepartureFrequencyMin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2052;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasDepartureFrequencyMin
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)departureFrequencyMax
{
  return self->_departureFrequencyMax;
}

- (void)setDepartureFrequencyMax:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_departureFrequencyMax = a3;
}

- (void)setHasDepartureFrequencyMax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2050;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDepartureFrequencyMax
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unint64_t)tripMuid
{
  return self->_tripMuid;
}

- (void)setTripMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_tripMuid = a3;
}

- (void)setHasTripMuid:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasTripMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readVehicleNumber
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitVehicleInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehicleNumber_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasVehicleNumber
{
  return self->_vehicleNumber != 0;
}

- (NSString)vehicleNumber
{
  -[GEOTransitVehicleInfo _readVehicleNumber]((uint64_t)self);
  vehicleNumber = self->_vehicleNumber;

  return vehicleNumber;
}

- (void)setVehicleNumber:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_vehicleNumber, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitVehicleInfo;
  int v4 = [(GEOTransitVehicleInfo *)&v8 description];
  v5 = [(GEOTransitVehicleInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitVehicleInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_44;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 arrivalTime];
  objc_super v6 = v5;
  if (v5)
  {
    if (a2)
    {
      objc_super v7 = [v5 jsonRepresentation];
      objc_super v8 = @"arrivalTime";
    }
    else
    {
      objc_super v7 = [v5 dictionaryRepresentation];
      objc_super v8 = @"arrival_time";
    }
    [v4 setObject:v7 forKey:v8];
  }
  v9 = [(id)a1 departureTime];
  v10 = v9;
  if (v9)
  {
    if (a2)
    {
      v11 = [v9 jsonRepresentation];
      v12 = @"departureTime";
    }
    else
    {
      v11 = [v9 dictionaryRepresentation];
      v12 = @"departure_time";
    }
    [v4 setObject:v11 forKey:v12];
  }
  __int16 v13 = *(_WORD *)(a1 + 112);
  if ((v13 & 8) != 0)
  {
    v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 100)];
    if (a2) {
      v15 = @"lineIndex";
    }
    else {
      v15 = @"line_index";
    }
    [v4 setObject:v14 forKey:v15];

    __int16 v13 = *(_WORD *)(a1 + 112);
  }
  if ((v13 & 0x20) != 0)
  {
    v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 108)];
    if (a2) {
      v17 = @"routeLineArtworkIndex";
    }
    else {
      v17 = @"route_line_artwork_index";
    }
    [v4 setObject:v16 forKey:v17];
  }
  if (*(void *)(a1 + 32))
  {
    v18 = PBRepeatedUInt32NSArray();
    if (a2) {
      v19 = @"clusteredRouteLineArtworkIndex";
    }
    else {
      v19 = @"clustered_route_line_artwork_index";
    }
    [v4 setObject:v18 forKey:v19];
  }
  __int16 v20 = *(_WORD *)(a1 + 112);
  if ((v20 & 0x10) != 0)
  {
    int v32 = *(_DWORD *)(a1 + 104);
    v33 = @"REGULAR";
    switch(v32)
    {
      case 0:
        break;
      case 1:
        v33 = @"NOT_AVAILABLE";
        break;
      case 2:
        v33 = @"PHONE_AGENCY";
        break;
      case 3:
        v33 = @"COORDINATE_WITH_DRIVER";
        break;
      default:
        if (v32 == 100)
        {
          v33 = @"STOP_SKIPPED";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 104));
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    if (a2) {
      v34 = @"pickupDropoffType";
    }
    else {
      v34 = @"pickup_dropoff_type";
    }
    [v4 setObject:v33 forKey:v34];

    __int16 v20 = *(_WORD *)(a1 + 112);
    if ((v20 & 4) == 0)
    {
LABEL_29:
      if ((v20 & 2) == 0) {
        goto LABEL_30;
      }
LABEL_62:
      v37 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
      if (a2) {
        v38 = @"departureFrequencyMax";
      }
      else {
        v38 = @"departure_frequency_max";
      }
      [v4 setObject:v37 forKey:v38];

      if ((*(_WORD *)(a1 + 112) & 1) == 0) {
        goto LABEL_35;
      }
      goto LABEL_31;
    }
  }
  else if ((v20 & 4) == 0)
  {
    goto LABEL_29;
  }
  v35 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 96)];
  if (a2) {
    v36 = @"departureFrequencyMin";
  }
  else {
    v36 = @"departure_frequency_min";
  }
  [v4 setObject:v35 forKey:v36];

  __int16 v20 = *(_WORD *)(a1 + 112);
  if ((v20 & 2) != 0) {
    goto LABEL_62;
  }
LABEL_30:
  if (v20)
  {
LABEL_31:
    v21 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
    if (a2) {
      v22 = @"tripMuid";
    }
    else {
      v22 = @"trip_muid";
    }
    [v4 setObject:v21 forKey:v22];
  }
LABEL_35:
  v23 = [(id)a1 vehicleNumber];
  if (v23)
  {
    if (a2) {
      v24 = @"vehicleNumber";
    }
    else {
      v24 = @"vehicle_number";
    }
    [v4 setObject:v23 forKey:v24];
  }

  v25 = *(void **)(a1 + 16);
  if (v25)
  {
    v26 = [v25 dictionaryRepresentation];
    v27 = v26;
    if (a2)
    {
      v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __51__GEOTransitVehicleInfo__dictionaryRepresentation___block_invoke;
      v39[3] = &unk_1E53D8860;
      id v29 = v28;
      id v40 = v29;
      [v27 enumerateKeysAndObjectsUsingBlock:v39];
      id v30 = v29;

      v27 = v30;
    }
    [v4 setObject:v27 forKey:@"Unknown Fields"];
  }
LABEL_44:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitVehicleInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOTransitVehicleInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOTransitVehicleInfo)initWithDictionary:(id)a3
{
  return (GEOTransitVehicleInfo *)-[GEOTransitVehicleInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_83;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_83;
  }
  if (a3) {
    objc_super v6 = @"arrivalTime";
  }
  else {
    objc_super v6 = @"arrival_time";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOTransitVehicleTime alloc];
    if (a3) {
      uint64_t v9 = [(GEOTransitVehicleTime *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEOTransitVehicleTime *)v8 initWithDictionary:v7];
    }
    id v10 = (void *)v9;
    [a1 setArrivalTime:v9];
  }
  if (a3) {
    v11 = @"departureTime";
  }
  else {
    v11 = @"departure_time";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v13 = [GEOTransitVehicleTime alloc];
    if (a3) {
      uint64_t v14 = [(GEOTransitVehicleTime *)v13 initWithJSON:v12];
    }
    else {
      uint64_t v14 = [(GEOTransitVehicleTime *)v13 initWithDictionary:v12];
    }
    v15 = (void *)v14;
    [a1 setDepartureTime:v14];
  }
  if (a3) {
    v16 = @"lineIndex";
  }
  else {
    v16 = @"line_index";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLineIndex:", objc_msgSend(v17, "unsignedIntValue"));
  }

  if (a3) {
    v18 = @"routeLineArtworkIndex";
  }
  else {
    v18 = @"route_line_artwork_index";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRouteLineArtworkIndex:", objc_msgSend(v19, "unsignedIntValue"));
  }

  if (a3) {
    __int16 v20 = @"clusteredRouteLineArtworkIndex";
  }
  else {
    __int16 v20 = @"clustered_route_line_artwork_index";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v22 = v21;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v43 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(a1, "addClusteredRouteLineArtworkIndex:", objc_msgSend(v27, "unsignedIntValue", (void)v42));
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v24);
    }
  }
  if (a3) {
    v28 = @"pickupDropoffType";
  }
  else {
    v28 = @"pickup_dropoff_type";
  }
  id v29 = objc_msgSend(v5, "objectForKeyedSubscript:", v28, (void)v42);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v29;
    if ([v30 isEqualToString:@"REGULAR"])
    {
      uint64_t v31 = 0;
    }
    else if ([v30 isEqualToString:@"NOT_AVAILABLE"])
    {
      uint64_t v31 = 1;
    }
    else if ([v30 isEqualToString:@"PHONE_AGENCY"])
    {
      uint64_t v31 = 2;
    }
    else if ([v30 isEqualToString:@"COORDINATE_WITH_DRIVER"])
    {
      uint64_t v31 = 3;
    }
    else if ([v30 isEqualToString:@"STOP_SKIPPED"])
    {
      uint64_t v31 = 100;
    }
    else
    {
      uint64_t v31 = 0;
    }

    goto LABEL_61;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v31 = [v29 intValue];
LABEL_61:
    [a1 setPickupDropoffType:v31];
  }

  if (a3) {
    int v32 = @"departureFrequencyMin";
  }
  else {
    int v32 = @"departure_frequency_min";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDepartureFrequencyMin:", objc_msgSend(v33, "unsignedIntValue"));
  }

  if (a3) {
    v34 = @"departureFrequencyMax";
  }
  else {
    v34 = @"departure_frequency_max";
  }
  v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDepartureFrequencyMax:", objc_msgSend(v35, "unsignedIntValue"));
  }

  if (a3) {
    v36 = @"tripMuid";
  }
  else {
    v36 = @"trip_muid";
  }
  v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTripMuid:", objc_msgSend(v37, "unsignedLongLongValue"));
  }

  if (a3) {
    v38 = @"vehicleNumber";
  }
  else {
    v38 = @"vehicle_number";
  }
  v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v40 = (void *)[v39 copy];
    [a1 setVehicleNumber:v40];
  }
LABEL_83:

  return a1;
}

- (GEOTransitVehicleInfo)initWithJSON:(id)a3
{
  return (GEOTransitVehicleInfo *)-[GEOTransitVehicleInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_2240;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2241;
    }
    GEOTransitVehicleInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOTransitVehicleTime *)self->_arrivalTime readAll:1];
    [(GEOTransitVehicleTime *)self->_departureTime readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitVehicleInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitVehicleInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0xF80) == 0)
    {
      uint64_t v9 = self->_reader;
      objc_sync_enter(v9);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      id v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v10];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v9);
      goto LABEL_29;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitVehicleInfo *)self readAll:0];
  if (self->_arrivalTime) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_departureTime) {
    PBDataWriterWriteSubmessage();
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_clusteredRouteLineArtworkIndexs.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clusteredRouteLineArtworkIndexs.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_clusteredRouteLineArtworkIndexs.count);
    }
    PBDataWriterRecallMark();
  }
  __int16 v8 = (__int16)self->_flags;
  if ((v8 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v8 = (__int16)self->_flags;
    if ((v8 & 4) == 0)
    {
LABEL_18:
      if ((v8 & 2) == 0) {
        goto LABEL_19;
      }
LABEL_26:
      PBDataWriterWriteUint32Field();
      if ((*(_WORD *)&self->_flags & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((v8 & 4) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  __int16 v8 = (__int16)self->_flags;
  if ((v8 & 2) != 0) {
    goto LABEL_26;
  }
LABEL_19:
  if (v8) {
LABEL_20:
  }
    PBDataWriterWriteUint64Field();
LABEL_21:
  if (self->_vehicleNumber) {
    PBDataWriterWriteStringField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
LABEL_29:
}

- (void)copyTo:(id)a3
{
  id v10 = (id *)a3;
  [(GEOTransitVehicleInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 20) = self->_readerMarkPos;
  *((_DWORD *)v10 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_arrivalTime) {
    objc_msgSend(v10, "setArrivalTime:");
  }
  if (self->_departureTime) {
    objc_msgSend(v10, "setDepartureTime:");
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v10 + 25) = self->_lineIndex;
    *((_WORD *)v10 + 56) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 0x20) != 0)
  {
    *((_DWORD *)v10 + 27) = self->_routeLineArtworkIndex;
    *((_WORD *)v10 + 56) |= 0x20u;
  }
  if ([(GEOTransitVehicleInfo *)self clusteredRouteLineArtworkIndexsCount])
  {
    [v10 clearClusteredRouteLineArtworkIndexs];
    unint64_t v5 = [(GEOTransitVehicleInfo *)self clusteredRouteLineArtworkIndexsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v10, "addClusteredRouteLineArtworkIndex:", -[GEOTransitVehicleInfo clusteredRouteLineArtworkIndexAtIndex:](self, "clusteredRouteLineArtworkIndexAtIndex:", i));
    }
  }
  __int16 v8 = (__int16)self->_flags;
  uint64_t v9 = v10;
  if ((v8 & 0x10) != 0)
  {
    *((_DWORD *)v10 + 26) = self->_pickupDropoffType;
    *((_WORD *)v10 + 56) |= 0x10u;
    __int16 v8 = (__int16)self->_flags;
    if ((v8 & 4) == 0)
    {
LABEL_15:
      if ((v8 & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_25;
    }
  }
  else if ((v8 & 4) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v10 + 24) = self->_departureFrequencyMin;
  *((_WORD *)v10 + 56) |= 4u;
  __int16 v8 = (__int16)self->_flags;
  if ((v8 & 2) == 0)
  {
LABEL_16:
    if ((v8 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_25:
  *((_DWORD *)v10 + 23) = self->_departureFrequencyMax;
  *((_WORD *)v10 + 56) |= 2u;
  if (*(_WORD *)&self->_flags)
  {
LABEL_17:
    v10[8] = self->_tripMuid;
    *((_WORD *)v10 + 56) |= 1u;
  }
LABEL_18:
  if (self->_vehicleNumber)
  {
    objc_msgSend(v10, "setVehicleNumber:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitVehicleInfo *)self readAll:0];
    id v9 = [(GEOTransitVehicleTime *)self->_arrivalTime copyWithZone:a3];
    id v10 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v9;

    id v11 = [(GEOTransitVehicleTime *)self->_departureTime copyWithZone:a3];
    v12 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v11;

    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      *(_DWORD *)(v5 + 100) = self->_lineIndex;
      *(_WORD *)(v5 + 112) |= 8u;
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      *(_DWORD *)(v5 + 108) = self->_routeLineArtworkIndex;
      *(_WORD *)(v5 + 112) |= 0x20u;
    }
    PBRepeatedUInt32Copy();
    __int16 v14 = (__int16)self->_flags;
    if ((v14 & 0x10) != 0)
    {
      *(_DWORD *)(v5 + 104) = self->_pickupDropoffType;
      *(_WORD *)(v5 + 112) |= 0x10u;
      __int16 v14 = (__int16)self->_flags;
      if ((v14 & 4) == 0)
      {
LABEL_11:
        if ((v14 & 2) == 0) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
    else if ((v14 & 4) == 0)
    {
      goto LABEL_11;
    }
    *(_DWORD *)(v5 + 96) = self->_departureFrequencyMin;
    *(_WORD *)(v5 + 112) |= 4u;
    __int16 v14 = (__int16)self->_flags;
    if ((v14 & 2) == 0)
    {
LABEL_12:
      if ((v14 & 1) == 0)
      {
LABEL_14:
        uint64_t v15 = [(NSString *)self->_vehicleNumber copyWithZone:a3];
        v16 = *(void **)(v5 + 72);
        *(void *)(v5 + 72) = v15;

        v17 = self->_unknownFields;
        id v8 = *(id *)(v5 + 16);
        *(void *)(v5 + 16) = v17;
        goto LABEL_15;
      }
LABEL_13:
      *(void *)(v5 + 64) = self->_tripMuid;
      *(_WORD *)(v5 + 112) |= 1u;
      goto LABEL_14;
    }
LABEL_18:
    *(_DWORD *)(v5 + 92) = self->_departureFrequencyMax;
    *(_WORD *)(v5 + 112) |= 2u;
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  unint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOTransitVehicleInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_15:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  [(GEOTransitVehicleInfo *)self readAll:1];
  [v4 readAll:1];
  arrivalTime = self->_arrivalTime;
  if ((unint64_t)arrivalTime | *((void *)v4 + 6))
  {
    if (!-[GEOTransitVehicleTime isEqual:](arrivalTime, "isEqual:")) {
      goto LABEL_39;
    }
  }
  departureTime = self->_departureTime;
  if ((unint64_t)departureTime | *((void *)v4 + 7))
  {
    if (!-[GEOTransitVehicleTime isEqual:](departureTime, "isEqual:")) {
      goto LABEL_39;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 56);
  if ((flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_lineIndex != *((_DWORD *)v4 + 25)) {
      goto LABEL_39;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_routeLineArtworkIndex != *((_DWORD *)v4 + 27)) {
      goto LABEL_39;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_39;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_39:
    char v12 = 0;
    goto LABEL_40;
  }
  __int16 v9 = (__int16)self->_flags;
  __int16 v10 = *((_WORD *)v4 + 56);
  if ((v9 & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_pickupDropoffType != *((_DWORD *)v4 + 26)) {
      goto LABEL_39;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_39;
  }
  if ((v9 & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_departureFrequencyMin != *((_DWORD *)v4 + 24)) {
      goto LABEL_39;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_departureFrequencyMax != *((_DWORD *)v4 + 23)) {
      goto LABEL_39;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_39;
  }
  if (v9)
  {
    if ((v10 & 1) == 0 || self->_tripMuid != *((void *)v4 + 8)) {
      goto LABEL_39;
    }
  }
  else if (v10)
  {
    goto LABEL_39;
  }
  vehicleNumber = self->_vehicleNumber;
  if ((unint64_t)vehicleNumber | *((void *)v4 + 9)) {
    char v12 = -[NSString isEqual:](vehicleNumber, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_40:

  return v12;
}

- (unint64_t)hash
{
  [(GEOTransitVehicleInfo *)self readAll:1];
  unint64_t v3 = [(GEOTransitVehicleTime *)self->_arrivalTime hash];
  unint64_t v4 = [(GEOTransitVehicleTime *)self->_departureTime hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v6 = 2654435761 * self->_lineIndex;
    if ((flags & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((flags & 0x20) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_routeLineArtworkIndex;
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  uint64_t v8 = PBRepeatedUInt32Hash();
  __int16 v9 = (__int16)self->_flags;
  if ((v9 & 0x10) != 0)
  {
    uint64_t v10 = 2654435761 * self->_pickupDropoffType;
    if ((v9 & 4) != 0)
    {
LABEL_8:
      uint64_t v11 = 2654435761 * self->_departureFrequencyMin;
      if ((v9 & 2) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v12 = 0;
      if (v9) {
        goto LABEL_10;
      }
LABEL_14:
      unint64_t v13 = 0;
      return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(NSString *)self->_vehicleNumber hash];
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((v9 & 4) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v11 = 0;
  if ((v9 & 2) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v12 = 2654435761 * self->_departureFrequencyMax;
  if ((v9 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  unint64_t v13 = 2654435761u * self->_tripMuid;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(NSString *)self->_vehicleNumber hash];
}

- (void)mergeFrom:(id)a3
{
  id v15 = a3;
  [v15 readAll:0];
  id v4 = v15;
  arrivalTime = self->_arrivalTime;
  uint64_t v6 = *((void *)v15 + 6);
  if (arrivalTime)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOTransitVehicleTime mergeFrom:](arrivalTime, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOTransitVehicleInfo setArrivalTime:](self, "setArrivalTime:");
  }
  id v4 = v15;
LABEL_7:
  departureTime = self->_departureTime;
  uint64_t v8 = *((void *)v4 + 7);
  if (departureTime)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOTransitVehicleTime mergeFrom:](departureTime, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOTransitVehicleInfo setDepartureTime:](self, "setDepartureTime:");
  }
  id v4 = v15;
LABEL_13:
  __int16 v9 = *((_WORD *)v4 + 56);
  if ((v9 & 8) != 0)
  {
    self->_lineIndex = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 8u;
    __int16 v9 = *((_WORD *)v4 + 56);
  }
  if ((v9 & 0x20) != 0)
  {
    self->_routeLineArtworkIndex = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_flags |= 0x20u;
  }
  uint64_t v10 = [v4 clusteredRouteLineArtworkIndexsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t i = 0; i != v11; ++i)
      -[GEOTransitVehicleInfo addClusteredRouteLineArtworkIndex:](self, "addClusteredRouteLineArtworkIndex:", [v15 clusteredRouteLineArtworkIndexAtIndex:i]);
  }
  unint64_t v13 = v15;
  __int16 v14 = *((_WORD *)v15 + 56);
  if ((v14 & 0x10) != 0)
  {
    self->_pickupDropoffType = *((_DWORD *)v15 + 26);
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v14 = *((_WORD *)v15 + 56);
    if ((v14 & 4) == 0)
    {
LABEL_22:
      if ((v14 & 2) == 0) {
        goto LABEL_23;
      }
      goto LABEL_32;
    }
  }
  else if ((v14 & 4) == 0)
  {
    goto LABEL_22;
  }
  self->_departureFrequencyMin = *((_DWORD *)v15 + 24);
  *(_WORD *)&self->_flags |= 4u;
  __int16 v14 = *((_WORD *)v15 + 56);
  if ((v14 & 2) == 0)
  {
LABEL_23:
    if ((v14 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_32:
  self->_departureFrequencyMax = *((_DWORD *)v15 + 23);
  *(_WORD *)&self->_flags |= 2u;
  if (*((_WORD *)v15 + 56))
  {
LABEL_24:
    self->_tripMuid = *((void *)v15 + 8);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_25:
  if (*((void *)v15 + 9))
  {
    -[GEOTransitVehicleInfo setVehicleNumber:](self, "setVehicleNumber:");
    unint64_t v13 = v15;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x40) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTransitVehicleInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2245);
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
  *(_WORD *)&self->_flags |= 0x840u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitVehicleInfo *)self readAll:0];
    [(GEOTransitVehicleTime *)self->_arrivalTime clearUnknownFields:1];
    departureTime = self->_departureTime;
    [(GEOTransitVehicleTime *)departureTime clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleNumber, 0);
  objc_storeStrong((id *)&self->_departureTime, 0);
  objc_storeStrong((id *)&self->_arrivalTime, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end