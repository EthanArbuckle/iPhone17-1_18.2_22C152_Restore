@interface GEOSharedNavState
+ (BOOL)isValid:(id)a3;
+ (Class)etaInfoType;
+ (Class)waypointInfoType;
- (BOOL)arrived;
- (BOOL)closed;
- (BOOL)hasArrived;
- (BOOL)hasArrivedTimestamp;
- (BOOL)hasClosed;
- (BOOL)hasClosedTimestamp;
- (BOOL)hasClosureReason;
- (BOOL)hasCurrentWaypointIndex;
- (BOOL)hasDestinationInfo;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasGroupIdentifier;
- (BOOL)hasLastLocation;
- (BOOL)hasLocalUpdatedTimestamp;
- (BOOL)hasMuted;
- (BOOL)hasProtocolVersion;
- (BOOL)hasReferenceFrame;
- (BOOL)hasResumed;
- (BOOL)hasRouteInfo;
- (BOOL)hasSenderInfo;
- (BOOL)hasTransportType;
- (BOOL)hasUpdatedTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)muted;
- (BOOL)readFrom:(id)a3;
- (BOOL)resumed;
- (GEOMapItemStorage)destinationInfo;
- (GEOSharedNavLocationInfo)lastLocation;
- (GEOSharedNavRouteInfo)routeInfo;
- (GEOSharedNavSenderInfo)senderInfo;
- (GEOSharedNavState)init;
- (GEOSharedNavState)initWithData:(id)a3;
- (GEOSharedNavState)initWithDictionary:(id)a3;
- (GEOSharedNavState)initWithJSON:(id)a3;
- (NSMutableArray)etaInfos;
- (NSMutableArray)waypointInfos;
- (NSString)groupIdentifier;
- (PBUnknownFields)unknownFields;
- (double)arrivedTimestamp;
- (double)closedTimestamp;
- (double)localUpdatedTimestamp;
- (double)updatedTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)etaInfoAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)referenceFrameAsString:(int)a3;
- (id)waypointInfoAtIndex:(unint64_t)a3;
- (int)StringAsReferenceFrame:(id)a3;
- (int)referenceFrame;
- (unint64_t)etaInfosCount;
- (unint64_t)hash;
- (unint64_t)waypointInfosCount;
- (unsigned)closureReason;
- (unsigned)currentWaypointIndex;
- (unsigned)protocolVersion;
- (unsigned)transportType;
- (void)_addNoFlagsEtaInfo:(uint64_t)a1;
- (void)_addNoFlagsWaypointInfo:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDestinationInfo;
- (void)_readEtaInfos;
- (void)_readGroupIdentifier;
- (void)_readLastLocation;
- (void)_readRouteInfo;
- (void)_readSenderInfo;
- (void)_readWaypointInfos;
- (void)addEtaInfo:(id)a3;
- (void)addWaypointInfo:(id)a3;
- (void)clearEtaInfos;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearWaypointInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArrived:(BOOL)a3;
- (void)setArrivedTimestamp:(double)a3;
- (void)setClosed:(BOOL)a3;
- (void)setClosedTimestamp:(double)a3;
- (void)setClosureReason:(unsigned int)a3;
- (void)setCurrentWaypointIndex:(unsigned int)a3;
- (void)setDestinationInfo:(id)a3;
- (void)setEtaInfos:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setHasArrived:(BOOL)a3;
- (void)setHasArrivedTimestamp:(BOOL)a3;
- (void)setHasClosed:(BOOL)a3;
- (void)setHasClosedTimestamp:(BOOL)a3;
- (void)setHasClosureReason:(BOOL)a3;
- (void)setHasCurrentWaypointIndex:(BOOL)a3;
- (void)setHasLocalUpdatedTimestamp:(BOOL)a3;
- (void)setHasMuted:(BOOL)a3;
- (void)setHasProtocolVersion:(BOOL)a3;
- (void)setHasReferenceFrame:(BOOL)a3;
- (void)setHasResumed:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setHasUpdatedTimestamp:(BOOL)a3;
- (void)setLastLocation:(id)a3;
- (void)setLocalUpdatedTimestamp:(double)a3;
- (void)setMuted:(BOOL)a3;
- (void)setProtocolVersion:(unsigned int)a3;
- (void)setReferenceFrame:(int)a3;
- (void)setResumed:(BOOL)a3;
- (void)setRouteInfo:(id)a3;
- (void)setSenderInfo:(id)a3;
- (void)setTransportType:(unsigned int)a3;
- (void)setUpdatedTimestamp:(double)a3;
- (void)setWaypointInfos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSharedNavState

- (GEOSharedNavState)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSharedNavState;
  v2 = [(GEOSharedNavState *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSharedNavState)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSharedNavState;
  v3 = [(GEOSharedNavState *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDestinationInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 149) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinationInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasDestinationInfo
{
  return self->_destinationInfo != 0;
}

- (GEOMapItemStorage)destinationInfo
{
  -[GEOSharedNavState _readDestinationInfo]((uint64_t)self);
  destinationInfo = self->_destinationInfo;

  return destinationInfo;
}

- (void)setDestinationInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x204000u;
  objc_storeStrong((id *)&self->_destinationInfo, a3);
}

- (void)_readEtaInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 149) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)etaInfos
{
  -[GEOSharedNavState _readEtaInfos]((uint64_t)self);
  etaInfos = self->_etaInfos;

  return etaInfos;
}

- (void)setEtaInfos:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
  etaInfos = self->_etaInfos;
  self->_etaInfos = v4;
}

- (void)clearEtaInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
  etaInfos = self->_etaInfos;

  [(NSMutableArray *)etaInfos removeAllObjects];
}

- (void)addEtaInfo:(id)a3
{
  id v4 = a3;
  -[GEOSharedNavState _readEtaInfos]((uint64_t)self);
  -[GEOSharedNavState _addNoFlagsEtaInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
}

- (void)_addNoFlagsEtaInfo:(uint64_t)a1
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

- (unint64_t)etaInfosCount
{
  -[GEOSharedNavState _readEtaInfos]((uint64_t)self);
  etaInfos = self->_etaInfos;

  return [(NSMutableArray *)etaInfos count];
}

- (id)etaInfoAtIndex:(unint64_t)a3
{
  -[GEOSharedNavState _readEtaInfos]((uint64_t)self);
  etaInfos = self->_etaInfos;

  return (id)[(NSMutableArray *)etaInfos objectAtIndex:a3];
}

+ (Class)etaInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 150) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasRouteInfo
{
  return self->_routeInfo != 0;
}

- (GEOSharedNavRouteInfo)routeInfo
{
  -[GEOSharedNavState _readRouteInfo]((uint64_t)self);
  routeInfo = self->_routeInfo;

  return routeInfo;
}

- (void)setRouteInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x240000u;
  objc_storeStrong((id *)&self->_routeInfo, a3);
}

- (void)_readSenderInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 150) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSenderInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasSenderInfo
{
  return self->_senderInfo != 0;
}

- (GEOSharedNavSenderInfo)senderInfo
{
  -[GEOSharedNavState _readSenderInfo]((uint64_t)self);
  senderInfo = self->_senderInfo;

  return senderInfo;
}

- (void)setSenderInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x280000u;
  objc_storeStrong((id *)&self->_senderInfo, a3);
}

- (void)_readGroupIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 150) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGroupIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasGroupIdentifier
{
  return self->_groupIdentifier != 0;
}

- (NSString)groupIdentifier
{
  -[GEOSharedNavState _readGroupIdentifier]((uint64_t)self);
  groupIdentifier = self->_groupIdentifier;

  return groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x210000u;
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (BOOL)arrived
{
  return self->_arrived;
}

- (void)setArrived:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200200u;
  self->_arrived = a3;
}

- (void)setHasArrived:(BOOL)a3
{
  if (a3) {
    int v3 = 2097664;
  }
  else {
    int v3 = 0x200000;
  }
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasArrived
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (BOOL)closed
{
  return self->_closed;
}

- (void)setClosed:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200400u;
  self->_closed = a3;
}

- (void)setHasClosed:(BOOL)a3
{
  if (a3) {
    int v3 = 2098176;
  }
  else {
    int v3 = 0x200000;
  }
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasClosed
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (int)referenceFrame
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x80) != 0) {
    return self->_referenceFrame;
  }
  else {
    return 0;
  }
}

- (void)setReferenceFrame:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x200080u;
  self->_referenceFrame = a3;
}

- (void)setHasReferenceFrame:(BOOL)a3
{
  if (a3) {
    int v3 = 2097280;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasReferenceFrame
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (id)referenceFrameAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E7E28[a3];
  }

  return v3;
}

- (int)StringAsReferenceFrame:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WGS84"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CHINA_SHIFTED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)muted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200800u;
  self->_muted = a3;
}

- (void)setHasMuted:(BOOL)a3
{
  if (a3) {
    int v3 = 2099200;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasMuted
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (double)updatedTimestamp
{
  return self->_updatedTimestamp;
}

- (void)setUpdatedTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x200008u;
  self->_updatedTimestamp = a3;
}

- (void)setHasUpdatedTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 2097160;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasUpdatedTimestamp
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x200100u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  if (a3) {
    int v3 = 2097408;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasTransportType
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x200040u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 2097216;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasProtocolVersion
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (double)localUpdatedTimestamp
{
  return self->_localUpdatedTimestamp;
}

- (void)setLocalUpdatedTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x200004u;
  self->_localUpdatedTimestamp = a3;
}

- (void)setHasLocalUpdatedTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 2097156;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasLocalUpdatedTimestamp
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readWaypointInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 150) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypointInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)waypointInfos
{
  -[GEOSharedNavState _readWaypointInfos]((uint64_t)self);
  waypointInfos = self->_waypointInfos;

  return waypointInfos;
}

- (void)setWaypointInfos:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
  waypointInfos = self->_waypointInfos;
  self->_waypointInfos = v4;
}

- (void)clearWaypointInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
  waypointInfos = self->_waypointInfos;

  [(NSMutableArray *)waypointInfos removeAllObjects];
}

- (void)addWaypointInfo:(id)a3
{
  id v4 = a3;
  -[GEOSharedNavState _readWaypointInfos]((uint64_t)self);
  -[GEOSharedNavState _addNoFlagsWaypointInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
}

- (void)_addNoFlagsWaypointInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      id v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)waypointInfosCount
{
  -[GEOSharedNavState _readWaypointInfos]((uint64_t)self);
  waypointInfos = self->_waypointInfos;

  return [(NSMutableArray *)waypointInfos count];
}

- (id)waypointInfoAtIndex:(unint64_t)a3
{
  -[GEOSharedNavState _readWaypointInfos]((uint64_t)self);
  waypointInfos = self->_waypointInfos;

  return (id)[(NSMutableArray *)waypointInfos objectAtIndex:a3];
}

+ (Class)waypointInfoType
{
  return (Class)objc_opt_class();
}

- (unsigned)currentWaypointIndex
{
  return self->_currentWaypointIndex;
}

- (void)setCurrentWaypointIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x200020u;
  self->_currentWaypointIndex = a3;
}

- (void)setHasCurrentWaypointIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 2097184;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFDFFFDF | v3);
}

- (BOOL)hasCurrentWaypointIndex
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readLastLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 150) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLastLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasLastLocation
{
  return self->_lastLocation != 0;
}

- (GEOSharedNavLocationInfo)lastLocation
{
  -[GEOSharedNavState _readLastLocation]((uint64_t)self);
  lastLocation = self->_lastLocation;

  return lastLocation;
}

- (void)setLastLocation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x220000u;
  objc_storeStrong((id *)&self->_lastLocation, a3);
}

- (BOOL)resumed
{
  return self->_resumed;
}

- (void)setResumed:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x201000u;
  self->_resumed = a3;
}

- (void)setHasResumed:(BOOL)a3
{
  if (a3) {
    int v3 = 2101248;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasResumed
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (unsigned)closureReason
{
  return self->_closureReason;
}

- (void)setClosureReason:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x200010u;
  self->_closureReason = a3;
}

- (void)setHasClosureReason:(BOOL)a3
{
  if (a3) {
    int v3 = 2097168;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasClosureReason
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (double)arrivedTimestamp
{
  return self->_arrivedTimestamp;
}

- (void)setArrivedTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x200001u;
  self->_arrivedTimestamp = a3;
}

- (void)setHasArrivedTimestamp:(BOOL)a3
{
  self->_$BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x200000);
}

- (BOOL)hasArrivedTimestamp
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)closedTimestamp
{
  return self->_closedTimestamp;
}

- (void)setClosedTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x200002u;
  self->_closedTimestamp = a3;
}

- (void)setHasClosedTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 2097154;
  }
  else {
    int v3 = 0x200000;
  }
  self->_$BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasClosedTimestamp
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSharedNavState;
  id v4 = [(GEOSharedNavState *)&v8 description];
  id v5 = [(GEOSharedNavState *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSharedNavState _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_90;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 destinationInfo];
  objc_super v6 = v5;
  if (v5)
  {
    if (a2)
    {
      id v7 = [v5 jsonRepresentation];
      objc_super v8 = @"destinationInfo";
    }
    else
    {
      id v7 = [v5 dictionaryRepresentation];
      objc_super v8 = @"destination_info";
    }
    [v4 setObject:v7 forKey:v8];
  }
  if ([*(id *)(a1 + 48) count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v79 objects:v84 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v80 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          if (a2) {
            [v15 jsonRepresentation];
          }
          else {
          v16 = [v15 dictionaryRepresentation];
          }
          [v9 addObject:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v79 objects:v84 count:16];
      }
      while (v12);
    }

    if (a2) {
      v17 = @"etaInfo";
    }
    else {
      v17 = @"eta_info";
    }
    [v4 setObject:v9 forKey:v17];
  }
  v18 = [(id)a1 routeInfo];
  v19 = v18;
  if (v18)
  {
    if (a2)
    {
      v20 = [v18 jsonRepresentation];
      v21 = @"routeInfo";
    }
    else
    {
      v20 = [v18 dictionaryRepresentation];
      v21 = @"route_info";
    }
    [v4 setObject:v20 forKey:v21];
  }
  v22 = [(id)a1 senderInfo];
  v23 = v22;
  if (v22)
  {
    if (a2)
    {
      v24 = [v22 jsonRepresentation];
      v25 = @"senderInfo";
    }
    else
    {
      v24 = [v22 dictionaryRepresentation];
      v25 = @"sender_info";
    }
    [v4 setObject:v24 forKey:v25];
  }
  v26 = [(id)a1 groupIdentifier];
  if (v26)
  {
    if (a2) {
      v27 = @"groupIdentifier";
    }
    else {
      v27 = @"group_identifier";
    }
    [v4 setObject:v26 forKey:v27];
  }

  int v28 = *(_DWORD *)(a1 + 148);
  if ((v28 & 0x200) != 0)
  {
    v46 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 144)];
    [v4 setObject:v46 forKey:@"arrived"];

    int v28 = *(_DWORD *)(a1 + 148);
    if ((v28 & 0x400) == 0)
    {
LABEL_39:
      if ((v28 & 0x80) == 0) {
        goto LABEL_40;
      }
      goto LABEL_74;
    }
  }
  else if ((v28 & 0x400) == 0)
  {
    goto LABEL_39;
  }
  v47 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 145)];
  [v4 setObject:v47 forKey:@"closed"];

  int v28 = *(_DWORD *)(a1 + 148);
  if ((v28 & 0x80) == 0)
  {
LABEL_40:
    if ((v28 & 0x800) == 0) {
      goto LABEL_41;
    }
    goto LABEL_108;
  }
LABEL_74:
  uint64_t v48 = *(int *)(a1 + 136);
  if (v48 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 136));
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v49 = off_1E53E7E28[v48];
  }
  if (a2) {
    v65 = @"referenceFrame";
  }
  else {
    v65 = @"reference_frame";
  }
  [v4 setObject:v49 forKey:v65];

  int v28 = *(_DWORD *)(a1 + 148);
  if ((v28 & 0x800) == 0)
  {
LABEL_41:
    if ((v28 & 8) == 0) {
      goto LABEL_42;
    }
    goto LABEL_109;
  }
LABEL_108:
  v66 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 146)];
  [v4 setObject:v66 forKey:@"muted"];

  int v28 = *(_DWORD *)(a1 + 148);
  if ((v28 & 8) == 0)
  {
LABEL_42:
    if ((v28 & 0x100) == 0) {
      goto LABEL_43;
    }
    goto LABEL_113;
  }
LABEL_109:
  v67 = [NSNumber numberWithDouble:*(double *)(a1 + 96)];
  if (a2) {
    v68 = @"updatedTimestamp";
  }
  else {
    v68 = @"updated_timestamp";
  }
  [v4 setObject:v67 forKey:v68];

  int v28 = *(_DWORD *)(a1 + 148);
  if ((v28 & 0x100) == 0)
  {
LABEL_43:
    if ((v28 & 0x40) == 0) {
      goto LABEL_44;
    }
    goto LABEL_117;
  }
LABEL_113:
  v69 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 140)];
  if (a2) {
    v70 = @"transportType";
  }
  else {
    v70 = @"transport_type";
  }
  [v4 setObject:v69 forKey:v70];

  int v28 = *(_DWORD *)(a1 + 148);
  if ((v28 & 0x40) == 0)
  {
LABEL_44:
    if ((v28 & 4) == 0) {
      goto LABEL_49;
    }
    goto LABEL_45;
  }
LABEL_117:
  v71 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 132)];
  if (a2) {
    v72 = @"protocolVersion";
  }
  else {
    v72 = @"protocol_version";
  }
  [v4 setObject:v71 forKey:v72];

  if ((*(_DWORD *)(a1 + 148) & 4) != 0)
  {
LABEL_45:
    v29 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
    if (a2) {
      v30 = @"localUpdatedTimestamp";
    }
    else {
      v30 = @"local_updated_timestamp";
    }
    [v4 setObject:v29 forKey:v30];
  }
LABEL_49:
  if ([*(id *)(a1 + 104) count])
  {
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v32 = *(id *)(a1 + 104);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v75 objects:v83 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v76;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v76 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v75 + 1) + 8 * j);
          if (a2) {
            [v37 jsonRepresentation];
          }
          else {
          v38 = [v37 dictionaryRepresentation];
          }
          [v31 addObject:v38];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v75 objects:v83 count:16];
      }
      while (v34);
    }

    if (a2) {
      v39 = @"waypointInfo";
    }
    else {
      v39 = @"waypoint_info";
    }
    [v4 setObject:v31 forKey:v39];
  }
  if ((*(unsigned char *)(a1 + 148) & 0x20) != 0)
  {
    v40 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 128)];
    if (a2) {
      v41 = @"currentWaypointIndex";
    }
    else {
      v41 = @"current_waypoint_index";
    }
    [v4 setObject:v40 forKey:v41];
  }
  v42 = [(id)a1 lastLocation];
  v43 = v42;
  if (v42)
  {
    if (a2)
    {
      v44 = [v42 jsonRepresentation];
      v45 = @"lastLocation";
    }
    else
    {
      v44 = [v42 dictionaryRepresentation];
      v45 = @"last_location";
    }
    [v4 setObject:v44 forKey:v45];
  }
  int v50 = *(_DWORD *)(a1 + 148);
  if ((v50 & 0x1000) != 0)
  {
    v60 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 147)];
    [v4 setObject:v60 forKey:@"resumed"];

    int v50 = *(_DWORD *)(a1 + 148);
    if ((v50 & 0x10) == 0)
    {
LABEL_80:
      if ((v50 & 1) == 0) {
        goto LABEL_81;
      }
      goto LABEL_98;
    }
  }
  else if ((v50 & 0x10) == 0)
  {
    goto LABEL_80;
  }
  v61 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 124)];
  if (a2) {
    v62 = @"closureReason";
  }
  else {
    v62 = @"closure_reason";
  }
  [v4 setObject:v61 forKey:v62];

  int v50 = *(_DWORD *)(a1 + 148);
  if ((v50 & 1) == 0)
  {
LABEL_81:
    if ((v50 & 2) == 0) {
      goto LABEL_86;
    }
    goto LABEL_82;
  }
LABEL_98:
  v63 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
  if (a2) {
    v64 = @"arrivedTimestamp";
  }
  else {
    v64 = @"arrived_timestamp";
  }
  [v4 setObject:v63 forKey:v64];

  if ((*(_DWORD *)(a1 + 148) & 2) != 0)
  {
LABEL_82:
    v51 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v52 = @"closedTimestamp";
    }
    else {
      v52 = @"closed_timestamp";
    }
    [v4 setObject:v51 forKey:v52];
  }
LABEL_86:
  v53 = *(void **)(a1 + 16);
  if (v53)
  {
    v54 = [v53 dictionaryRepresentation];
    v55 = v54;
    if (a2)
    {
      v56 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v54, "count"));
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __47__GEOSharedNavState__dictionaryRepresentation___block_invoke;
      v73[3] = &unk_1E53D8860;
      id v57 = v56;
      id v74 = v57;
      [v55 enumerateKeysAndObjectsUsingBlock:v73];
      id v58 = v57;

      v55 = v58;
    }
    [v4 setObject:v55 forKey:@"Unknown Fields"];
  }
LABEL_90:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSharedNavState _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOSharedNavState__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSharedNavState)initWithDictionary:(id)a3
{
  return (GEOSharedNavState *)-[GEOSharedNavState _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_138;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_138;
  }
  if (a3) {
    objc_super v6 = @"destinationInfo";
  }
  else {
    objc_super v6 = @"destination_info";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOMapItemStorage alloc];
    if (a3) {
      uint64_t v9 = [(GEOMapItemStorage *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEOMapItemStorage *)v8 initWithDictionary:v7];
    }
    id v10 = (void *)v9;
    [a1 setDestinationInfo:v9];
  }
  if (a3) {
    uint64_t v11 = @"etaInfo";
  }
  else {
    uint64_t v11 = @"eta_info";
  }
  uint64_t v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  id v76 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v81 objects:v86 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v82 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v81 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v19 = [GEOSharedNavETAInfo alloc];
            if (a3) {
              uint64_t v20 = [(GEOSharedNavETAInfo *)v19 initWithJSON:v18];
            }
            else {
              uint64_t v20 = [(GEOSharedNavETAInfo *)v19 initWithDictionary:v18];
            }
            v21 = (void *)v20;
            [a1 addEtaInfo:v20];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v81 objects:v86 count:16];
      }
      while (v15);
    }

    id v5 = v76;
  }

  if (a3) {
    v22 = @"routeInfo";
  }
  else {
    v22 = @"route_info";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = [GEOSharedNavRouteInfo alloc];
    if (a3) {
      uint64_t v25 = [(GEOSharedNavRouteInfo *)v24 initWithJSON:v23];
    }
    else {
      uint64_t v25 = [(GEOSharedNavRouteInfo *)v24 initWithDictionary:v23];
    }
    v26 = (void *)v25;
    [a1 setRouteInfo:v25];
  }
  if (a3) {
    v27 = @"senderInfo";
  }
  else {
    v27 = @"sender_info";
  }
  int v28 = [v5 objectForKeyedSubscript:v27];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = [GEOSharedNavSenderInfo alloc];
    if (a3) {
      uint64_t v30 = [(GEOSharedNavSenderInfo *)v29 initWithJSON:v28];
    }
    else {
      uint64_t v30 = [(GEOSharedNavSenderInfo *)v29 initWithDictionary:v28];
    }
    v31 = (void *)v30;
    [a1 setSenderInfo:v30];
  }
  if (a3) {
    id v32 = @"groupIdentifier";
  }
  else {
    id v32 = @"group_identifier";
  }
  uint64_t v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v34 = (void *)[v33 copy];
    [a1 setGroupIdentifier:v34];
  }
  uint64_t v35 = [v5 objectForKeyedSubscript:@"arrived"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setArrived:", objc_msgSend(v35, "BOOLValue"));
  }

  v36 = [v5 objectForKeyedSubscript:@"closed"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setClosed:", objc_msgSend(v36, "BOOLValue"));
  }

  if (a3) {
    v37 = @"referenceFrame";
  }
  else {
    v37 = @"reference_frame";
  }
  v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v39 = v38;
    if ([v39 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v40 = 0;
    }
    else if ([v39 isEqualToString:@"WGS84"])
    {
      uint64_t v40 = 1;
    }
    else if ([v39 isEqualToString:@"CHINA_SHIFTED"])
    {
      uint64_t v40 = 2;
    }
    else
    {
      uint64_t v40 = 0;
    }

    goto LABEL_67;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v40 = [v38 intValue];
LABEL_67:
    [a1 setReferenceFrame:v40];
  }

  v41 = [v5 objectForKeyedSubscript:@"muted"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMuted:", objc_msgSend(v41, "BOOLValue"));
  }

  if (a3) {
    v42 = @"updatedTimestamp";
  }
  else {
    v42 = @"updated_timestamp";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v43 doubleValue];
    objc_msgSend(a1, "setUpdatedTimestamp:");
  }

  if (a3) {
    v44 = @"transportType";
  }
  else {
    v44 = @"transport_type";
  }
  v45 = [v5 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTransportType:", objc_msgSend(v45, "unsignedIntValue"));
  }

  if (a3) {
    v46 = @"protocolVersion";
  }
  else {
    v46 = @"protocol_version";
  }
  v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setProtocolVersion:", objc_msgSend(v47, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v48 = @"localUpdatedTimestamp";
  }
  else {
    uint64_t v48 = @"local_updated_timestamp";
  }
  v49 = [v5 objectForKeyedSubscript:v48];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v49 doubleValue];
    objc_msgSend(a1, "setLocalUpdatedTimestamp:");
  }

  if (a3) {
    int v50 = @"waypointInfo";
  }
  else {
    int v50 = @"waypoint_info";
  }
  v51 = [v5 objectForKeyedSubscript:v50];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v52 = v51;
    uint64_t v53 = [v52 countByEnumeratingWithState:&v77 objects:v85 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v78;
      do
      {
        for (uint64_t j = 0; j != v54; ++j)
        {
          if (*(void *)v78 != v55) {
            objc_enumerationMutation(v52);
          }
          uint64_t v57 = *(void *)(*((void *)&v77 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v58 = [GEOSharedNavWaypointInfo alloc];
            if (a3) {
              uint64_t v59 = [(GEOSharedNavWaypointInfo *)v58 initWithJSON:v57];
            }
            else {
              uint64_t v59 = [(GEOSharedNavWaypointInfo *)v58 initWithDictionary:v57];
            }
            v60 = (void *)v59;
            [a1 addWaypointInfo:v59];
          }
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v77 objects:v85 count:16];
      }
      while (v54);
    }

    id v5 = v76;
  }

  if (a3) {
    v61 = @"currentWaypointIndex";
  }
  else {
    v61 = @"current_waypoint_index";
  }
  v62 = [v5 objectForKeyedSubscript:v61];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCurrentWaypointIndex:", objc_msgSend(v62, "unsignedIntValue"));
  }

  if (a3) {
    v63 = @"lastLocation";
  }
  else {
    v63 = @"last_location";
  }
  v64 = [v5 objectForKeyedSubscript:v63];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v65 = [GEOSharedNavLocationInfo alloc];
    if (a3) {
      uint64_t v66 = [(GEOSharedNavLocationInfo *)v65 initWithJSON:v64];
    }
    else {
      uint64_t v66 = [(GEOSharedNavLocationInfo *)v65 initWithDictionary:v64];
    }
    v67 = (void *)v66;
    [a1 setLastLocation:v66];
  }
  v68 = [v5 objectForKeyedSubscript:@"resumed"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setResumed:", objc_msgSend(v68, "BOOLValue"));
  }

  if (a3) {
    v69 = @"closureReason";
  }
  else {
    v69 = @"closure_reason";
  }
  v70 = [v5 objectForKeyedSubscript:v69];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setClosureReason:", objc_msgSend(v70, "unsignedIntValue"));
  }

  if (a3) {
    v71 = @"arrivedTimestamp";
  }
  else {
    v71 = @"arrived_timestamp";
  }
  v72 = [v5 objectForKeyedSubscript:v71];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v72 doubleValue];
    objc_msgSend(a1, "setArrivedTimestamp:");
  }

  if (a3) {
    v73 = @"closedTimestamp";
  }
  else {
    v73 = @"closed_timestamp";
  }
  id v74 = [v5 objectForKeyedSubscript:v73];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v74 doubleValue];
    objc_msgSend(a1, "setClosedTimestamp:");
  }

LABEL_138:
  return a1;
}

- (GEOSharedNavState)initWithJSON:(id)a3
{
  return (GEOSharedNavState *)-[GEOSharedNavState _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3594;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3595;
    }
    GEOSharedNavStateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOSharedNavStateCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSharedNavStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSharedNavStateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOSharedNavStateIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v16 = self->_reader;
    objc_sync_enter(v16);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v17 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v17];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOSharedNavState *)self readAll:0];
    if (self->_destinationInfo) {
      PBDataWriterWriteSubmessage();
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_super v6 = self->_etaInfos;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);
    }

    if (self->_routeInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_senderInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_groupIdentifier) {
      PBDataWriterWriteStringField();
    }
    $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) != 0)
    {
      PBDataWriterWriteBOOLField();
      $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x400) != 0)
    {
      PBDataWriterWriteBOOLField();
      $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x80) != 0)
    {
      PBDataWriterWriteInt32Field();
      $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
      PBDataWriterWriteBOOLField();
      $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      PBDataWriterWriteDoubleField();
      $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x100) != 0)
    {
      PBDataWriterWriteUint32Field();
      $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x40) != 0)
    {
      PBDataWriterWriteUint32Field();
      $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 4) != 0) {
      PBDataWriterWriteDoubleField();
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = self->_waypointInfos;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v12);
    }

    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_lastLocation) {
      PBDataWriterWriteSubmessage();
    }
    $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v15 = self->_flags;
    if ((*(_WORD *)&v15 & 0x1000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v15 = self->_flags;
    }
    if ((*(unsigned char *)&v15 & 0x10) != 0)
    {
      PBDataWriterWriteUint32Field();
      $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v15 = self->_flags;
    }
    if (*(unsigned char *)&v15)
    {
      PBDataWriterWriteDoubleField();
      $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v15 = self->_flags;
    }
    if ((*(unsigned char *)&v15 & 2) != 0) {
      PBDataWriterWriteDoubleField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v18);
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOSharedNavState _readDestinationInfo]((uint64_t)self);
  if ([(GEOMapItemStorage *)self->_destinationInfo hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOSharedNavState _readLastLocation]((uint64_t)self);
  if ([(GEOSharedNavLocationInfo *)self->_lastLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOSharedNavState _readWaypointInfos]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v6 = self->_waypointInfos;
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
  uint64_t v16 = (id *)a3;
  [(GEOSharedNavState *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 28) = self->_readerMarkPos;
  *((_DWORD *)v16 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_destinationInfo) {
    objc_msgSend(v16, "setDestinationInfo:");
  }
  if ([(GEOSharedNavState *)self etaInfosCount])
  {
    [v16 clearEtaInfos];
    unint64_t v4 = [(GEOSharedNavState *)self etaInfosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOSharedNavState *)self etaInfoAtIndex:i];
        [v16 addEtaInfo:v7];
      }
    }
  }
  if (self->_routeInfo) {
    objc_msgSend(v16, "setRouteInfo:");
  }
  uint64_t v8 = v16;
  if (self->_senderInfo)
  {
    objc_msgSend(v16, "setSenderInfo:");
    uint64_t v8 = v16;
  }
  if (self->_groupIdentifier)
  {
    objc_msgSend(v16, "setGroupIdentifier:");
    uint64_t v8 = v16;
  }
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    *((unsigned char *)v8 + 144) = self->_arrived;
    *((_DWORD *)v8 + 37) |= 0x200u;
    $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_15:
      if ((*(unsigned char *)&flags & 0x80) == 0) {
        goto LABEL_16;
      }
      goto LABEL_40;
    }
  }
  else if ((*(_WORD *)&flags & 0x400) == 0)
  {
    goto LABEL_15;
  }
  *((unsigned char *)v8 + 145) = self->_closed;
  *((_DWORD *)v8 + 37) |= 0x400u;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&flags & 0x800) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v8 + 34) = self->_referenceFrame;
  *((_DWORD *)v8 + 37) |= 0x80u;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((unsigned char *)v8 + 146) = self->_muted;
  *((_DWORD *)v8 + 37) |= 0x800u;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  v8[12] = *(id *)&self->_updatedTimestamp;
  *((_DWORD *)v8 + 37) |= 8u;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_20;
    }
LABEL_44:
    *((_DWORD *)v8 + 33) = self->_protocolVersion;
    *((_DWORD *)v8 + 37) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_43:
  *((_DWORD *)v8 + 35) = self->_transportType;
  *((_DWORD *)v8 + 37) |= 0x100u;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    goto LABEL_44;
  }
LABEL_20:
  if ((*(unsigned char *)&flags & 4) != 0)
  {
LABEL_21:
    v8[9] = *(id *)&self->_localUpdatedTimestamp;
    *((_DWORD *)v8 + 37) |= 4u;
  }
LABEL_22:
  if ([(GEOSharedNavState *)self waypointInfosCount])
  {
    [v16 clearWaypointInfos];
    unint64_t v10 = [(GEOSharedNavState *)self waypointInfosCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        long long v13 = [(GEOSharedNavState *)self waypointInfoAtIndex:j];
        [v16 addWaypointInfo:v13];
      }
    }
  }
  long long v14 = v16;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    *((_DWORD *)v16 + 32) = self->_currentWaypointIndex;
    *((_DWORD *)v16 + 37) |= 0x20u;
  }
  if (self->_lastLocation)
  {
    objc_msgSend(v16, "setLastLocation:");
    long long v14 = v16;
  }
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x1000) != 0)
  {
    *((unsigned char *)v14 + 147) = self->_resumed;
    *((_DWORD *)v14 + 37) |= 0x1000u;
    $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v15 = self->_flags;
    if ((*(unsigned char *)&v15 & 0x10) == 0)
    {
LABEL_32:
      if ((*(unsigned char *)&v15 & 1) == 0) {
        goto LABEL_33;
      }
      goto LABEL_48;
    }
  }
  else if ((*(unsigned char *)&v15 & 0x10) == 0)
  {
    goto LABEL_32;
  }
  *((_DWORD *)v14 + 31) = self->_closureReason;
  *((_DWORD *)v14 + 37) |= 0x10u;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v15 = self->_flags;
  if ((*(unsigned char *)&v15 & 1) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v15 & 2) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_48:
  v14[3] = *(id *)&self->_arrivedTimestamp;
  *((_DWORD *)v14 + 37) |= 1u;
  if ((*(_DWORD *)&self->_flags & 2) != 0)
  {
LABEL_34:
    v14[4] = *(id *)&self->_closedTimestamp;
    *((_DWORD *)v14 + 37) |= 2u;
  }
LABEL_35:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOSharedNavState *)self readAll:0];
    id v9 = [(GEOMapItemStorage *)self->_destinationInfo copyWithZone:a3];
    unint64_t v10 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v9;

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    unint64_t v11 = self->_etaInfos;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(v11);
          }
          $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v15 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) copyWithZone:a3];
          [(id)v5 addEtaInfo:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v12);
    }

    id v16 = [(GEOSharedNavRouteInfo *)self->_routeInfo copyWithZone:a3];
    uint64_t v17 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v16;

    id v18 = [(GEOSharedNavSenderInfo *)self->_senderInfo copyWithZone:a3];
    long long v19 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v18;

    uint64_t v20 = [(NSString *)self->_groupIdentifier copyWithZone:a3];
    long long v21 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v20;

    $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) != 0)
    {
      *(unsigned char *)(v5 + 144) = self->_arrived;
      *(_DWORD *)(v5 + 148) |= 0x200u;
      $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
      if ((*(_WORD *)&flags & 0x400) == 0)
      {
LABEL_14:
        if ((*(unsigned char *)&flags & 0x80) == 0) {
          goto LABEL_15;
        }
        goto LABEL_39;
      }
    }
    else if ((*(_WORD *)&flags & 0x400) == 0)
    {
      goto LABEL_14;
    }
    *(unsigned char *)(v5 + 145) = self->_closed;
    *(_DWORD *)(v5 + 148) |= 0x400u;
    $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x80) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&flags & 0x800) == 0) {
        goto LABEL_16;
      }
      goto LABEL_40;
    }
LABEL_39:
    *(_DWORD *)(v5 + 136) = self->_referenceFrame;
    *(_DWORD *)(v5 + 148) |= 0x80u;
    $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_16:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_41;
    }
LABEL_40:
    *(unsigned char *)(v5 + 146) = self->_muted;
    *(_DWORD *)(v5 + 148) |= 0x800u;
    $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&flags & 0x100) == 0) {
        goto LABEL_18;
      }
      goto LABEL_42;
    }
LABEL_41:
    *(double *)(v5 + 96) = self->_updatedTimestamp;
    *(_DWORD *)(v5 + 148) |= 8u;
    $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_18:
      if ((*(unsigned char *)&flags & 0x40) == 0) {
        goto LABEL_19;
      }
      goto LABEL_43;
    }
LABEL_42:
    *(_DWORD *)(v5 + 140) = self->_transportType;
    *(_DWORD *)(v5 + 148) |= 0x100u;
    $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x40) == 0)
    {
LABEL_19:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
LABEL_43:
    *(_DWORD *)(v5 + 132) = self->_protocolVersion;
    *(_DWORD *)(v5 + 148) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 4) == 0)
    {
LABEL_21:
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v23 = self->_waypointInfos;
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v34 != v25) {
              objc_enumerationMutation(v23);
            }
            v27 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "copyWithZone:", a3, (void)v33);
            [(id)v5 addWaypointInfo:v27];
          }
          uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v24);
      }

      if ((*(unsigned char *)&self->_flags & 0x20) != 0)
      {
        *(_DWORD *)(v5 + 128) = self->_currentWaypointIndex;
        *(_DWORD *)(v5 + 148) |= 0x20u;
      }
      id v28 = -[GEOSharedNavLocationInfo copyWithZone:](self->_lastLocation, "copyWithZone:", a3, (void)v33);
      v29 = *(void **)(v5 + 64);
      *(void *)(v5 + 64) = v28;

      $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v30 = self->_flags;
      if ((*(_WORD *)&v30 & 0x1000) != 0)
      {
        *(unsigned char *)(v5 + 147) = self->_resumed;
        *(_DWORD *)(v5 + 148) |= 0x1000u;
        $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v30 = self->_flags;
        if ((*(unsigned char *)&v30 & 0x10) == 0)
        {
LABEL_32:
          if ((*(unsigned char *)&v30 & 1) == 0) {
            goto LABEL_33;
          }
          goto LABEL_47;
        }
      }
      else if ((*(unsigned char *)&v30 & 0x10) == 0)
      {
        goto LABEL_32;
      }
      *(_DWORD *)(v5 + 124) = self->_closureReason;
      *(_DWORD *)(v5 + 148) |= 0x10u;
      $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v30 = self->_flags;
      if ((*(unsigned char *)&v30 & 1) == 0)
      {
LABEL_33:
        if ((*(unsigned char *)&v30 & 2) == 0)
        {
LABEL_35:
          v31 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v31;
          goto LABEL_36;
        }
LABEL_34:
        *(double *)(v5 + 32) = self->_closedTimestamp;
        *(_DWORD *)(v5 + 148) |= 2u;
        goto LABEL_35;
      }
LABEL_47:
      *(double *)(v5 + 24) = self->_arrivedTimestamp;
      *(_DWORD *)(v5 + 148) |= 1u;
      if ((*(_DWORD *)&self->_flags & 2) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
LABEL_20:
    *(double *)(v5 + 72) = self->_localUpdatedTimestamp;
    *(_DWORD *)(v5 + 148) |= 4u;
    goto LABEL_21;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*((unsigned char *)&self->_flags + 2) & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOSharedNavStateReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_36:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_95;
  }
  [(GEOSharedNavState *)self readAll:1];
  [v4 readAll:1];
  destinationInfo = self->_destinationInfo;
  if ((unint64_t)destinationInfo | *((void *)v4 + 5))
  {
    if (!-[GEOMapItemStorage isEqual:](destinationInfo, "isEqual:")) {
      goto LABEL_95;
    }
  }
  etaInfos = self->_etaInfos;
  if ((unint64_t)etaInfos | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](etaInfos, "isEqual:")) {
      goto LABEL_95;
    }
  }
  routeInfo = self->_routeInfo;
  if ((unint64_t)routeInfo | *((void *)v4 + 10))
  {
    if (!-[GEOSharedNavRouteInfo isEqual:](routeInfo, "isEqual:")) {
      goto LABEL_95;
    }
  }
  senderInfo = self->_senderInfo;
  if ((unint64_t)senderInfo | *((void *)v4 + 11))
  {
    if (!-[GEOSharedNavSenderInfo isEqual:](senderInfo, "isEqual:")) {
      goto LABEL_95;
    }
  }
  groupIdentifier = self->_groupIdentifier;
  if ((unint64_t)groupIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](groupIdentifier, "isEqual:")) {
      goto LABEL_95;
    }
  }
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
  int v11 = *((_DWORD *)v4 + 37);
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0) {
      goto LABEL_95;
    }
    if (self->_arrived)
    {
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_95;
      }
    }
    else if (*((unsigned char *)v4 + 144))
    {
      goto LABEL_95;
    }
  }
  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v11 & 0x400) == 0) {
      goto LABEL_95;
    }
    if (self->_closed)
    {
      if (!*((unsigned char *)v4 + 145)) {
        goto LABEL_95;
      }
    }
    else if (*((unsigned char *)v4 + 145))
    {
      goto LABEL_95;
    }
  }
  else if ((v11 & 0x400) != 0)
  {
    goto LABEL_95;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_referenceFrame != *((_DWORD *)v4 + 34)) {
      goto LABEL_95;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0) {
      goto LABEL_95;
    }
    if (self->_muted)
    {
      if (!*((unsigned char *)v4 + 146)) {
        goto LABEL_95;
      }
    }
    else if (*((unsigned char *)v4 + 146))
    {
      goto LABEL_95;
    }
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_95;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_updatedTimestamp != *((double *)v4 + 12)) {
      goto LABEL_95;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_transportType != *((_DWORD *)v4 + 35)) {
      goto LABEL_95;
    }
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_95;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_protocolVersion != *((_DWORD *)v4 + 33)) {
      goto LABEL_95;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_95;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_localUpdatedTimestamp != *((double *)v4 + 9)) {
      goto LABEL_95;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_95;
  }
  waypointInfos = self->_waypointInfos;
  if ((unint64_t)waypointInfos | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](waypointInfos, "isEqual:")) {
      goto LABEL_95;
    }
    $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    int v11 = *((_DWORD *)v4 + 37);
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_currentWaypointIndex != *((_DWORD *)v4 + 32)) {
      goto LABEL_95;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_95;
  }
  lastLocation = self->_lastLocation;
  if ((unint64_t)lastLocation | *((void *)v4 + 8))
  {
    if (!-[GEOSharedNavLocationInfo isEqual:](lastLocation, "isEqual:")) {
      goto LABEL_95;
    }
    $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
    int v11 = *((_DWORD *)v4 + 37);
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v11 & 0x1000) != 0)
    {
      if (self->_resumed)
      {
        if (!*((unsigned char *)v4 + 147)) {
          goto LABEL_95;
        }
        goto LABEL_80;
      }
      if (!*((unsigned char *)v4 + 147)) {
        goto LABEL_80;
      }
    }
LABEL_95:
    BOOL v14 = 0;
    goto LABEL_96;
  }
  if ((v11 & 0x1000) != 0) {
    goto LABEL_95;
  }
LABEL_80:
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_closureReason != *((_DWORD *)v4 + 31)) {
      goto LABEL_95;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_95;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v11 & 1) == 0 || self->_arrivedTimestamp != *((double *)v4 + 3)) {
      goto LABEL_95;
    }
  }
  else if (v11)
  {
    goto LABEL_95;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_closedTimestamp != *((double *)v4 + 4)) {
      goto LABEL_95;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = (v11 & 2) == 0;
  }
LABEL_96:

  return v14;
}

- (unint64_t)hash
{
  [(GEOSharedNavState *)self readAll:1];
  unint64_t v43 = [(GEOMapItemStorage *)self->_destinationInfo hash];
  uint64_t v42 = [(NSMutableArray *)self->_etaInfos hash];
  unint64_t v41 = [(GEOSharedNavRouteInfo *)self->_routeInfo hash];
  unint64_t v40 = [(GEOSharedNavSenderInfo *)self->_senderInfo hash];
  NSUInteger v39 = [(NSString *)self->_groupIdentifier hash];
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    uint64_t v38 = 2654435761 * self->_arrived;
    if ((*(_WORD *)&flags & 0x400) != 0)
    {
LABEL_3:
      uint64_t v37 = 2654435761 * self->_closed;
      if ((*(unsigned char *)&flags & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v38 = 0;
    if ((*(_WORD *)&flags & 0x400) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v37 = 0;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
LABEL_4:
    uint64_t v36 = 2654435761 * self->_referenceFrame;
    if ((*(_WORD *)&flags & 0x800) != 0) {
      goto LABEL_5;
    }
LABEL_13:
    uint64_t v35 = 0;
    if ((*(unsigned char *)&flags & 8) != 0) {
      goto LABEL_6;
    }
LABEL_14:
    unint64_t v8 = 0;
    goto LABEL_17;
  }
LABEL_12:
  uint64_t v36 = 0;
  if ((*(_WORD *)&flags & 0x800) == 0) {
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v35 = 2654435761 * self->_muted;
  if ((*(unsigned char *)&flags & 8) == 0) {
    goto LABEL_14;
  }
LABEL_6:
  double updatedTimestamp = self->_updatedTimestamp;
  double v5 = -updatedTimestamp;
  if (updatedTimestamp >= 0.0) {
    double v5 = self->_updatedTimestamp;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_17:
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    uint64_t v33 = 2654435761 * self->_transportType;
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v33 = 0;
    if ((*(unsigned char *)&flags & 0x40) != 0)
    {
LABEL_19:
      uint64_t v31 = 2654435761 * self->_protocolVersion;
      goto LABEL_22;
    }
  }
  uint64_t v31 = 0;
LABEL_22:
  unint64_t v34 = v8;
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    double localUpdatedTimestamp = self->_localUpdatedTimestamp;
    double v11 = -localUpdatedTimestamp;
    if (localUpdatedTimestamp >= 0.0) {
      double v11 = self->_localUpdatedTimestamp;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  uint64_t v14 = [(NSMutableArray *)self->_waypointInfos hash];
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    uint64_t v15 = 2654435761 * self->_currentWaypointIndex;
  }
  else {
    uint64_t v15 = 0;
  }
  unint64_t v16 = [(GEOSharedNavLocationInfo *)self->_lastLocation hash];
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v17 = self->_flags;
  if ((*(_WORD *)&v17 & 0x1000) == 0)
  {
    uint64_t v18 = 0;
    if ((*(unsigned char *)&v17 & 0x10) != 0) {
      goto LABEL_35;
    }
LABEL_41:
    uint64_t v19 = 0;
    if (*(unsigned char *)&v17) {
      goto LABEL_36;
    }
LABEL_42:
    unint64_t v24 = 0;
    goto LABEL_45;
  }
  uint64_t v18 = 2654435761 * self->_resumed;
  if ((*(unsigned char *)&v17 & 0x10) == 0) {
    goto LABEL_41;
  }
LABEL_35:
  uint64_t v19 = 2654435761 * self->_closureReason;
  if ((*(unsigned char *)&v17 & 1) == 0) {
    goto LABEL_42;
  }
LABEL_36:
  double arrivedTimestamp = self->_arrivedTimestamp;
  double v21 = -arrivedTimestamp;
  if (arrivedTimestamp >= 0.0) {
    double v21 = self->_arrivedTimestamp;
  }
  long double v22 = floor(v21 + 0.5);
  double v23 = (v21 - v22) * 1.84467441e19;
  unint64_t v24 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0) {
      v24 += (unint64_t)v23;
    }
  }
  else
  {
    v24 -= (unint64_t)fabs(v23);
  }
LABEL_45:
  if ((*(unsigned char *)&v17 & 2) != 0)
  {
    double closedTimestamp = self->_closedTimestamp;
    double v27 = -closedTimestamp;
    if (closedTimestamp >= 0.0) {
      double v27 = self->_closedTimestamp;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  return v42 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v24 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  destinationInfo = self->_destinationInfo;
  uint64_t v6 = *((void *)v4 + 5);
  if (destinationInfo)
  {
    if (v6) {
      -[GEOMapItemStorage mergeFrom:](destinationInfo, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOSharedNavState setDestinationInfo:](self, "setDestinationInfo:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = *((id *)v4 + 6);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEOSharedNavState *)self addEtaInfo:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  routeInfo = self->_routeInfo;
  uint64_t v13 = *((void *)v4 + 10);
  if (routeInfo)
  {
    if (v13) {
      -[GEOSharedNavRouteInfo mergeFrom:](routeInfo, "mergeFrom:");
    }
  }
  else if (v13)
  {
    [(GEOSharedNavState *)self setRouteInfo:"setRouteInfo:"];
  }
  senderInfo = self->_senderInfo;
  uint64_t v15 = *((void *)v4 + 11);
  if (senderInfo)
  {
    if (v15) {
      -[GEOSharedNavSenderInfo mergeFrom:](senderInfo, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEOSharedNavState setSenderInfo:](self, "setSenderInfo:");
  }
  if (*((void *)v4 + 7)) {
    -[GEOSharedNavState setGroupIdentifier:](self, "setGroupIdentifier:");
  }
  int v16 = *((_DWORD *)v4 + 37);
  if ((v16 & 0x200) != 0)
  {
    self->_arrived = *((unsigned char *)v4 + 144);
    *(_DWORD *)&self->_flags |= 0x200u;
    int v16 = *((_DWORD *)v4 + 37);
    if ((v16 & 0x400) == 0)
    {
LABEL_27:
      if ((v16 & 0x80) == 0) {
        goto LABEL_28;
      }
      goto LABEL_48;
    }
  }
  else if ((v16 & 0x400) == 0)
  {
    goto LABEL_27;
  }
  self->_closed = *((unsigned char *)v4 + 145);
  *(_DWORD *)&self->_flags |= 0x400u;
  int v16 = *((_DWORD *)v4 + 37);
  if ((v16 & 0x80) == 0)
  {
LABEL_28:
    if ((v16 & 0x800) == 0) {
      goto LABEL_29;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_referenceFrame = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_flags |= 0x80u;
  int v16 = *((_DWORD *)v4 + 37);
  if ((v16 & 0x800) == 0)
  {
LABEL_29:
    if ((v16 & 8) == 0) {
      goto LABEL_30;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_muted = *((unsigned char *)v4 + 146);
  *(_DWORD *)&self->_flags |= 0x800u;
  int v16 = *((_DWORD *)v4 + 37);
  if ((v16 & 8) == 0)
  {
LABEL_30:
    if ((v16 & 0x100) == 0) {
      goto LABEL_31;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_double updatedTimestamp = *((double *)v4 + 12);
  *(_DWORD *)&self->_flags |= 8u;
  int v16 = *((_DWORD *)v4 + 37);
  if ((v16 & 0x100) == 0)
  {
LABEL_31:
    if ((v16 & 0x40) == 0) {
      goto LABEL_32;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_transportType = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_flags |= 0x100u;
  int v16 = *((_DWORD *)v4 + 37);
  if ((v16 & 0x40) == 0)
  {
LABEL_32:
    if ((v16 & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_52:
  self->_protocolVersion = *((_DWORD *)v4 + 33);
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((*((_DWORD *)v4 + 37) & 4) != 0)
  {
LABEL_33:
    self->_double localUpdatedTimestamp = *((double *)v4 + 9);
    *(_DWORD *)&self->_flags |= 4u;
  }
LABEL_34:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = *((id *)v4 + 13);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        -[GEOSharedNavState addWaypointInfo:](self, "addWaypointInfo:", *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }

  if ((*((unsigned char *)v4 + 148) & 0x20) != 0)
  {
    self->_currentWaypointIndex = *((_DWORD *)v4 + 32);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
  lastLocation = self->_lastLocation;
  uint64_t v23 = *((void *)v4 + 8);
  if (lastLocation)
  {
    if (v23) {
      -[GEOSharedNavLocationInfo mergeFrom:](lastLocation, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[GEOSharedNavState setLastLocation:](self, "setLastLocation:");
  }
  int v24 = *((_DWORD *)v4 + 37);
  if ((v24 & 0x1000) != 0)
  {
    self->_resumed = *((unsigned char *)v4 + 147);
    *(_DWORD *)&self->_flags |= 0x1000u;
    int v24 = *((_DWORD *)v4 + 37);
    if ((v24 & 0x10) == 0)
    {
LABEL_58:
      if ((v24 & 1) == 0) {
        goto LABEL_59;
      }
LABEL_64:
      self->_double arrivedTimestamp = *((double *)v4 + 3);
      *(_DWORD *)&self->_flags |= 1u;
      if ((*((_DWORD *)v4 + 37) & 2) == 0) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
  }
  else if ((v24 & 0x10) == 0)
  {
    goto LABEL_58;
  }
  self->_closureReason = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_flags |= 0x10u;
  int v24 = *((_DWORD *)v4 + 37);
  if (v24) {
    goto LABEL_64;
  }
LABEL_59:
  if ((v24 & 2) != 0)
  {
LABEL_60:
    self->_double closedTimestamp = *((double *)v4 + 4);
    *(_DWORD *)&self->_flags |= 2u;
  }
LABEL_61:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      double v5 = reader;
      objc_sync_enter(v5);
      GEOSharedNavStateReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3599);
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
  *(_DWORD *)&self->_flags |= 0x202000u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOSharedNavState *)self readAll:0];
    [(GEOMapItemStorage *)self->_destinationInfo clearUnknownFields:1];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = self->_etaInfos;
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

    [(GEOSharedNavRouteInfo *)self->_routeInfo clearUnknownFields:1];
    [(GEOSharedNavSenderInfo *)self->_senderInfo clearUnknownFields:1];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long double v12 = self->_waypointInfos;
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

    [(GEOSharedNavLocationInfo *)self->_lastLocation clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointInfos, 0);
  objc_storeStrong((id *)&self->_senderInfo, 0);
  objc_storeStrong((id *)&self->_routeInfo, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_etaInfos, 0);
  objc_storeStrong((id *)&self->_destinationInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end