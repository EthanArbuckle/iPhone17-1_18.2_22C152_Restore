@interface GEOWaypointTyped
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDownloadedOfflineRegionState;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsCurrentLocation;
- (BOOL)hasIsLocationOfInterest;
- (BOOL)hasUniqueWaypointId;
- (BOOL)hasWaypointId;
- (BOOL)hasWaypointLocation;
- (BOOL)hasWaypointLocationSource;
- (BOOL)hasWaypointNameProperties;
- (BOOL)hasWaypointPlace;
- (BOOL)hasWaypointStatus;
- (BOOL)hasWaypointType;
- (BOOL)isCurrentLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocationOfInterest;
- (BOOL)readFrom:(id)a3;
- (GEOWaypointID)waypointId;
- (GEOWaypointLocation)waypointLocation;
- (GEOWaypointNameProperties)waypointNameProperties;
- (GEOWaypointPlace)waypointPlace;
- (GEOWaypointTyped)init;
- (GEOWaypointTyped)initWithData:(id)a3;
- (GEOWaypointTyped)initWithDictionary:(id)a3;
- (GEOWaypointTyped)initWithJSON:(id)a3;
- (GEOWaypointUUID)uniqueWaypointId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)downloadedOfflineRegionStateAsString:(int)a3;
- (id)jsonRepresentation;
- (id)locationForWaypoint;
- (id)loggingDescription;
- (id)waypointLocationSourceAsString:(int)a3;
- (id)waypointStatusAsString:(int)a3;
- (id)waypointTypeAsString:(int)a3;
- (int)StringAsDownloadedOfflineRegionState:(id)a3;
- (int)StringAsWaypointLocationSource:(id)a3;
- (int)StringAsWaypointStatus:(id)a3;
- (int)StringAsWaypointType:(id)a3;
- (int)downloadedOfflineRegionState;
- (int)waypointLocationSource;
- (int)waypointStatus;
- (int)waypointType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readUniqueWaypointId;
- (void)_readWaypointId;
- (void)_readWaypointLocation;
- (void)_readWaypointNameProperties;
- (void)_readWaypointPlace;
- (void)clearLocations;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDownloadedOfflineRegionState:(int)a3;
- (void)setHasDownloadedOfflineRegionState:(BOOL)a3;
- (void)setHasIsCurrentLocation:(BOOL)a3;
- (void)setHasIsLocationOfInterest:(BOOL)a3;
- (void)setHasWaypointLocationSource:(BOOL)a3;
- (void)setHasWaypointStatus:(BOOL)a3;
- (void)setHasWaypointType:(BOOL)a3;
- (void)setIsCurrentLocation:(BOOL)a3;
- (void)setIsLocationOfInterest:(BOOL)a3;
- (void)setUniqueWaypointId:(id)a3;
- (void)setWaypointId:(id)a3;
- (void)setWaypointLocation:(id)a3;
- (void)setWaypointLocationSource:(int)a3;
- (void)setWaypointNameProperties:(id)a3;
- (void)setWaypointPlace:(id)a3;
- (void)setWaypointStatus:(int)a3;
- (void)setWaypointType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWaypointTyped

- (GEOWaypointTyped)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWaypointTyped;
  v2 = [(GEOWaypointTyped *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)setWaypointType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_waypointType = a3;
}

- (void)setWaypointLocationSource:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_waypointLocationSource = a3;
}

- (void)setUniqueWaypointId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_uniqueWaypointId, a3);
}

- (void)setIsCurrentLocation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  self->_isCurrentLocation = a3;
}

- (void)setWaypointPlace:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_waypointPlace, a3);
}

- (void)setWaypointLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_waypointLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointPlace, 0);
  objc_storeStrong((id *)&self->_waypointNameProperties, 0);
  objc_storeStrong((id *)&self->_waypointLocation, 0);
  objc_storeStrong((id *)&self->_waypointId, 0);
  objc_storeStrong((id *)&self->_uniqueWaypointId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOWaypointLocation)waypointLocation
{
  -[GEOWaypointTyped _readWaypointLocation]((uint64_t)self);
  waypointLocation = self->_waypointLocation;

  return waypointLocation;
}

- (void)_readWaypointLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointTypedReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypointLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasWaypointLocation
{
  return self->_waypointLocation != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOWaypointTypedReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWaypointTyped *)self readAll:0];
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_waypointType;
    *(_WORD *)(v5 + 96) |= 8u;
  }
  id v9 = [(GEOWaypointID *)self->_waypointId copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOWaypointPlace *)self->_waypointPlace copyWithZone:a3];
  v12 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v11;

  id v13 = [(GEOWaypointLocation *)self->_waypointLocation copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    if ((flags & 0x20) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    *(unsigned char *)(v5 + 93) = self->_isLocationOfInterest;
    *(_WORD *)(v5 + 96) |= 0x20u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  *(unsigned char *)(v5 + 92) = self->_isCurrentLocation;
  *(_WORD *)(v5 + 96) |= 0x10u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0) {
    goto LABEL_18;
  }
LABEL_9:
  if ((flags & 4) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 84) = self->_waypointStatus;
    *(_WORD *)(v5 + 96) |= 4u;
  }
LABEL_11:
  id v16 = [(GEOWaypointNameProperties *)self->_waypointNameProperties copyWithZone:a3];
  v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  id v18 = [(GEOWaypointUUID *)self->_uniqueWaypointId copyWithZone:a3];
  v19 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v18;

  __int16 v20 = (__int16)self->_flags;
  if (v20)
  {
    *(_DWORD *)(v5 + 76) = self->_downloadedOfflineRegionState;
    *(_WORD *)(v5 + 96) |= 1u;
    __int16 v20 = (__int16)self->_flags;
  }
  if ((v20 & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_waypointLocationSource;
    *(_WORD *)(v5 + 96) |= 2u;
  }
  v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_16:

  return (id)v5;
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWaypointTypedIsDirty((uint64_t)self) & 1) == 0)
  {
    id v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    goto LABEL_28;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWaypointTyped *)self readAll:0];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  id v5 = v10;
  if (self->_waypointId)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v10;
  }
  if (self->_waypointPlace)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v10;
  }
  if (self->_waypointLocation)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v10;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    if ((flags & 0x20) == 0) {
      goto LABEL_13;
    }
LABEL_25:
    PBDataWriterWriteBOOLField();
    id v5 = v10;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  id v5 = v10;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0) {
    goto LABEL_25;
  }
LABEL_13:
  if ((flags & 4) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt32Field();
    id v5 = v10;
  }
LABEL_15:
  if (self->_waypointNameProperties)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v10;
  }
  if (self->_uniqueWaypointId)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v10;
  }
  __int16 v7 = (__int16)self->_flags;
  if (v7)
  {
    PBDataWriterWriteInt32Field();
    id v5 = v10;
    __int16 v7 = (__int16)self->_flags;
  }
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v5 = v10;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
LABEL_28:
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    __int16 v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_3790;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_3791;
    }
    GEOWaypointTypedReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWaypointTypedCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOWaypointTyped)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWaypointTyped;
  BOOL v3 = [(GEOWaypointTyped *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (int)waypointType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_waypointType;
  }
  else {
    return 2;
  }
}

- (void)setHasWaypointType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4104;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasWaypointType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)waypointTypeAsString:(int)a3
{
  if ((a3 - 2) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E72D0[a3 - 2];
  }

  return v3;
}

- (int)StringAsWaypointType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WAYPOINT_ID"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_PLACE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_LOCATION"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (void)_readWaypointId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointTypedReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypointId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasWaypointId
{
  return self->_waypointId != 0;
}

- (GEOWaypointID)waypointId
{
  -[GEOWaypointTyped _readWaypointId]((uint64_t)self);
  waypointId = self->_waypointId;

  return waypointId;
}

- (void)setWaypointId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_waypointId, a3);
}

- (void)_readWaypointPlace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointTypedReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypointPlace_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasWaypointPlace
{
  return self->_waypointPlace != 0;
}

- (GEOWaypointPlace)waypointPlace
{
  -[GEOWaypointTyped _readWaypointPlace]((uint64_t)self);
  waypointPlace = self->_waypointPlace;

  return waypointPlace;
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (void)setHasIsCurrentLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4112;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasIsCurrentLocation
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)isLocationOfInterest
{
  return self->_isLocationOfInterest;
}

- (void)setIsLocationOfInterest:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  self->_isLocationOfInterest = a3;
}

- (void)setHasIsLocationOfInterest:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4128;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasIsLocationOfInterest
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (int)waypointStatus
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_waypointStatus;
  }
  else {
    return 0;
  }
}

- (void)setWaypointStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_waypointStatus = a3;
}

- (void)setHasWaypointStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4100;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasWaypointStatus
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)waypointStatusAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E72E8[a3];
  }

  return v3;
}

- (int)StringAsWaypointStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_STATUS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ACTIVE_WAYPOINT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INSERT_WAYPOINT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DELETE_WAYPOINT"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readWaypointNameProperties
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointTypedReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypointNameProperties_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasWaypointNameProperties
{
  return self->_waypointNameProperties != 0;
}

- (GEOWaypointNameProperties)waypointNameProperties
{
  -[GEOWaypointTyped _readWaypointNameProperties]((uint64_t)self);
  waypointNameProperties = self->_waypointNameProperties;

  return waypointNameProperties;
}

- (void)setWaypointNameProperties:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_waypointNameProperties, a3);
}

- (void)_readUniqueWaypointId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointTypedReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUniqueWaypointId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasUniqueWaypointId
{
  return self->_uniqueWaypointId != 0;
}

- (GEOWaypointUUID)uniqueWaypointId
{
  -[GEOWaypointTyped _readUniqueWaypointId]((uint64_t)self);
  uniqueWaypointId = self->_uniqueWaypointId;

  return uniqueWaypointId;
}

- (int)downloadedOfflineRegionState
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_downloadedOfflineRegionState;
  }
  else {
    return 0;
  }
}

- (void)setDownloadedOfflineRegionState:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_downloadedOfflineRegionState = a3;
}

- (void)setHasDownloadedOfflineRegionState:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasDownloadedOfflineRegionState
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)downloadedOfflineRegionStateAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"DOWNLOADED_OFFLINE_REGION_STATE_OUTSIDE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"DOWNLOADED_OFFLINE_REGION_STATE_UNKNOWN";
  }
  return v4;
}

- (int)StringAsDownloadedOfflineRegionState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DOWNLOADED_OFFLINE_REGION_STATE_UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"DOWNLOADED_OFFLINE_REGION_STATE_OUTSIDE"];
  }

  return v4;
}

- (int)waypointLocationSource
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_waypointLocationSource;
  }
  else {
    return 0;
  }
}

- (void)setHasWaypointLocationSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4098;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasWaypointLocationSource
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)waypointLocationSourceAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E7308[a3];
  }

  return v3;
}

- (int)StringAsWaypointLocationSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WAYPOINT_LOCATION_SOURCE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_LOCATION_SOURCE_USER_CURRENT_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_LOCATION_SOURCE_PERSON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_LOCATION_SOURCE_APPLE_CURATED_ROUTE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_LOCATION_SOURCE_USER_CREATED_ROUTE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWaypointTyped;
  int v4 = [(GEOWaypointTyped *)&v8 description];
  id v5 = [(GEOWaypointTyped *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypointTyped _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_76;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(_WORD *)(a1 + 96) & 8) != 0)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 88) - 2;
    if (v5 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 88));
      objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v6 = off_1E53E72D0[v5];
    }
    if (a2) {
      objc_super v7 = @"waypointType";
    }
    else {
      objc_super v7 = @"waypoint_type";
    }
    [v4 setObject:v6 forKey:v7];
  }
  objc_super v8 = [(id)a1 waypointId];
  id v9 = v8;
  if (v8)
  {
    if (a2)
    {
      id v10 = [v8 jsonRepresentation];
      id v11 = @"waypointId";
    }
    else
    {
      id v10 = [v8 dictionaryRepresentation];
      id v11 = @"waypoint_id";
    }
    [v4 setObject:v10 forKey:v11];
  }
  v12 = [(id)a1 waypointPlace];
  id v13 = v12;
  if (v12)
  {
    if (a2)
    {
      v14 = [v12 jsonRepresentation];
      v15 = @"waypointPlace";
    }
    else
    {
      v14 = [v12 dictionaryRepresentation];
      v15 = @"waypoint_place";
    }
    [v4 setObject:v14 forKey:v15];
  }
  id v16 = [(id)a1 waypointLocation];
  v17 = v16;
  if (v16)
  {
    if (a2)
    {
      id v18 = [v16 jsonRepresentation];
      v19 = @"waypointLocation";
    }
    else
    {
      id v18 = [v16 dictionaryRepresentation];
      v19 = @"waypoint_location";
    }
    [v4 setObject:v18 forKey:v19];
  }
  __int16 v20 = *(_WORD *)(a1 + 96);
  if ((v20 & 0x10) == 0)
  {
    if ((v20 & 0x20) == 0) {
      goto LABEL_27;
    }
LABEL_33:
    v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 93)];
    if (a2) {
      v24 = @"isLocationOfInterest";
    }
    else {
      v24 = @"is_location_of_interest";
    }
    [v4 setObject:v23 forKey:v24];

    if ((*(_WORD *)(a1 + 96) & 4) == 0) {
      goto LABEL_44;
    }
    goto LABEL_37;
  }
  v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 92)];
  if (a2) {
    v22 = @"isCurrentLocation";
  }
  else {
    v22 = @"is_current_location";
  }
  [v4 setObject:v21 forKey:v22];

  __int16 v20 = *(_WORD *)(a1 + 96);
  if ((v20 & 0x20) != 0) {
    goto LABEL_33;
  }
LABEL_27:
  if ((v20 & 4) != 0)
  {
LABEL_37:
    uint64_t v25 = *(int *)(a1 + 84);
    if (v25 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1E53E72E8[v25];
    }
    if (a2) {
      v27 = @"waypointStatus";
    }
    else {
      v27 = @"waypoint_status";
    }
    [v4 setObject:v26 forKey:v27];
  }
LABEL_44:
  v28 = [(id)a1 waypointNameProperties];
  v29 = v28;
  if (v28)
  {
    if (a2)
    {
      v30 = [v28 jsonRepresentation];
      v31 = @"waypointNameProperties";
    }
    else
    {
      v30 = [v28 dictionaryRepresentation];
      v31 = @"waypoint_name_properties";
    }
    [v4 setObject:v30 forKey:v31];
  }
  v32 = [(id)a1 uniqueWaypointId];
  v33 = v32;
  if (v32)
  {
    if (a2)
    {
      v34 = [v32 jsonRepresentation];
      v35 = @"uniqueWaypointId";
    }
    else
    {
      v34 = [v32 dictionaryRepresentation];
      v35 = @"unique_waypoint_id";
    }
    [v4 setObject:v34 forKey:v35];
  }
  __int16 v36 = *(_WORD *)(a1 + 96);
  if (v36)
  {
    int v37 = *(_DWORD *)(a1 + 76);
    if (v37)
    {
      if (v37 == 1)
      {
        v38 = @"DOWNLOADED_OFFLINE_REGION_STATE_OUTSIDE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 76));
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v38 = @"DOWNLOADED_OFFLINE_REGION_STATE_UNKNOWN";
    }
    if (a2) {
      v39 = @"downloadedOfflineRegionState";
    }
    else {
      v39 = @"downloaded_offline_region_state";
    }
    [v4 setObject:v38 forKey:v39];

    __int16 v36 = *(_WORD *)(a1 + 96);
  }
  if ((v36 & 2) != 0)
  {
    uint64_t v40 = *(int *)(a1 + 80);
    if (v40 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 80));
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = off_1E53E7308[v40];
    }
    if (a2) {
      v42 = @"waypointLocationSource";
    }
    else {
      v42 = @"waypoint_location_source";
    }
    [v4 setObject:v41 forKey:v42];
  }
  v43 = *(void **)(a1 + 16);
  if (v43)
  {
    v44 = [v43 dictionaryRepresentation];
    v45 = v44;
    if (a2)
    {
      v46 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __46__GEOWaypointTyped__dictionaryRepresentation___block_invoke;
      v50[3] = &unk_1E53D8860;
      id v47 = v46;
      id v51 = v47;
      [v45 enumerateKeysAndObjectsUsingBlock:v50];
      id v48 = v47;

      v45 = v48;
    }
    [v4 setObject:v45 forKey:@"Unknown Fields"];
  }
LABEL_76:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWaypointTyped _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOWaypointTyped__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOWaypointTyped)initWithDictionary:(id)a3
{
  return (GEOWaypointTyped *)-[GEOWaypointTyped _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"waypointType";
      }
      else {
        objc_super v6 = @"waypoint_type";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"WAYPOINT_ID"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"WAYPOINT_PLACE"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"WAYPOINT_LOCATION"])
        {
          uint64_t v9 = 4;
        }
        else
        {
          uint64_t v9 = 2;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_18;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setWaypointType:v9];
LABEL_18:

      if (a3) {
        id v10 = @"waypointId";
      }
      else {
        id v10 = @"waypoint_id";
      }
      id v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOWaypointID alloc];
        if (a3) {
          uint64_t v13 = [(GEOWaypointID *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOWaypointID *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setWaypointId:v13];
      }
      if (a3) {
        v15 = @"waypointPlace";
      }
      else {
        v15 = @"waypoint_place";
      }
      id v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [GEOWaypointPlace alloc];
        if (a3) {
          uint64_t v18 = [(GEOWaypointPlace *)v17 initWithJSON:v16];
        }
        else {
          uint64_t v18 = [(GEOWaypointPlace *)v17 initWithDictionary:v16];
        }
        v19 = (void *)v18;
        [a1 setWaypointPlace:v18];
      }
      if (a3) {
        __int16 v20 = @"waypointLocation";
      }
      else {
        __int16 v20 = @"waypoint_location";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [GEOWaypointLocation alloc];
        if (a3) {
          uint64_t v23 = [(GEOWaypointLocation *)v22 initWithJSON:v21];
        }
        else {
          uint64_t v23 = [(GEOWaypointLocation *)v22 initWithDictionary:v21];
        }
        v24 = (void *)v23;
        [a1 setWaypointLocation:v23];
      }
      if (a3) {
        uint64_t v25 = @"isCurrentLocation";
      }
      else {
        uint64_t v25 = @"is_current_location";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsCurrentLocation:", objc_msgSend(v26, "BOOLValue"));
      }

      if (a3) {
        v27 = @"isLocationOfInterest";
      }
      else {
        v27 = @"is_location_of_interest";
      }
      v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsLocationOfInterest:", objc_msgSend(v28, "BOOLValue"));
      }

      if (a3) {
        v29 = @"waypointStatus";
      }
      else {
        v29 = @"waypoint_status";
      }
      v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = v30;
        if ([v31 isEqualToString:@"UNKNOWN_STATUS"])
        {
          uint64_t v32 = 0;
        }
        else if ([v31 isEqualToString:@"ACTIVE_WAYPOINT"])
        {
          uint64_t v32 = 1;
        }
        else if ([v31 isEqualToString:@"INSERT_WAYPOINT"])
        {
          uint64_t v32 = 2;
        }
        else if ([v31 isEqualToString:@"DELETE_WAYPOINT"])
        {
          uint64_t v32 = 3;
        }
        else
        {
          uint64_t v32 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_69;
        }
        uint64_t v32 = [v30 intValue];
      }
      [a1 setWaypointStatus:v32];
LABEL_69:

      if (a3) {
        v33 = @"waypointNameProperties";
      }
      else {
        v33 = @"waypoint_name_properties";
      }
      v34 = [v5 objectForKeyedSubscript:v33];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = [GEOWaypointNameProperties alloc];
        if (a3) {
          uint64_t v36 = [(GEOWaypointNameProperties *)v35 initWithJSON:v34];
        }
        else {
          uint64_t v36 = [(GEOWaypointNameProperties *)v35 initWithDictionary:v34];
        }
        int v37 = (void *)v36;
        [a1 setWaypointNameProperties:v36];
      }
      if (a3) {
        v38 = @"uniqueWaypointId";
      }
      else {
        v38 = @"unique_waypoint_id";
      }
      v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v40 = [GEOWaypointUUID alloc];
        if (v40) {
          v41 = (void *)-[GEOWaypointUUID _initWithDictionary:isJSON:]((uint64_t)v40, v39);
        }
        else {
          v41 = 0;
        }
        [a1 setUniqueWaypointId:v41];
      }
      if (a3) {
        v42 = @"downloadedOfflineRegionState";
      }
      else {
        v42 = @"downloaded_offline_region_state";
      }
      v43 = [v5 objectForKeyedSubscript:v42];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v44 = v43;
        if ([v44 isEqualToString:@"DOWNLOADED_OFFLINE_REGION_STATE_UNKNOWN"]) {
          uint64_t v45 = 0;
        }
        else {
          uint64_t v45 = [v44 isEqualToString:@"DOWNLOADED_OFFLINE_REGION_STATE_OUTSIDE"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_95;
        }
        uint64_t v45 = [v43 intValue];
      }
      [a1 setDownloadedOfflineRegionState:v45];
LABEL_95:

      if (a3) {
        v46 = @"waypointLocationSource";
      }
      else {
        v46 = @"waypoint_location_source";
      }
      id v47 = [v5 objectForKeyedSubscript:v46];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v48 = v47;
        if ([v48 isEqualToString:@"WAYPOINT_LOCATION_SOURCE_UNKNOWN"])
        {
          uint64_t v49 = 0;
        }
        else if ([v48 isEqualToString:@"WAYPOINT_LOCATION_SOURCE_USER_CURRENT_LOCATION"])
        {
          uint64_t v49 = 1;
        }
        else if ([v48 isEqualToString:@"WAYPOINT_LOCATION_SOURCE_PERSON"])
        {
          uint64_t v49 = 2;
        }
        else if ([v48 isEqualToString:@"WAYPOINT_LOCATION_SOURCE_APPLE_CURATED_ROUTE"])
        {
          uint64_t v49 = 3;
        }
        else if ([v48 isEqualToString:@"WAYPOINT_LOCATION_SOURCE_USER_CREATED_ROUTE"])
        {
          uint64_t v49 = 4;
        }
        else
        {
          uint64_t v49 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_114:

          goto LABEL_115;
        }
        uint64_t v49 = [v47 intValue];
      }
      [a1 setWaypointLocationSource:v49];
      goto LABEL_114;
    }
  }
LABEL_115:

  return a1;
}

- (GEOWaypointTyped)initWithJSON:(id)a3
{
  return (GEOWaypointTyped *)-[GEOWaypointTyped _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointTypedIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointTypedReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOWaypointTyped _readWaypointId]((uint64_t)self);
  if ([(GEOWaypointID *)self->_waypointId hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOWaypointTyped _readWaypointLocation]((uint64_t)self);
  if ([(GEOWaypointLocation *)self->_waypointLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOWaypointTyped _readWaypointPlace]((uint64_t)self);
  waypointPlace = self->_waypointPlace;

  return [(GEOWaypointPlace *)waypointPlace hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOWaypointTyped *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v6 + 22) = self->_waypointType;
    *((_WORD *)v6 + 48) |= 8u;
  }
  if (self->_waypointId) {
    objc_msgSend(v6, "setWaypointId:");
  }
  if (self->_waypointPlace) {
    objc_msgSend(v6, "setWaypointPlace:");
  }
  if (self->_waypointLocation) {
    objc_msgSend(v6, "setWaypointLocation:");
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((unsigned char *)v6 + 92) = self->_isCurrentLocation;
    *((_WORD *)v6 + 48) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_11:
      if ((flags & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *((unsigned char *)v6 + 93) = self->_isLocationOfInterest;
  *((_WORD *)v6 + 48) |= 0x20u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_12:
    *((_DWORD *)v6 + 21) = self->_waypointStatus;
    *((_WORD *)v6 + 48) |= 4u;
  }
LABEL_13:
  if (self->_waypointNameProperties) {
    objc_msgSend(v6, "setWaypointNameProperties:");
  }
  if (self->_uniqueWaypointId) {
    objc_msgSend(v6, "setUniqueWaypointId:");
  }
  __int16 v5 = (__int16)self->_flags;
  if (v5)
  {
    *((_DWORD *)v6 + 19) = self->_downloadedOfflineRegionState;
    *((_WORD *)v6 + 48) |= 1u;
    __int16 v5 = (__int16)self->_flags;
  }
  if ((v5 & 2) != 0)
  {
    *((_DWORD *)v6 + 20) = self->_waypointLocationSource;
    *((_WORD *)v6 + 48) |= 2u;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  [(GEOWaypointTyped *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_waypointType != *((_DWORD *)v4 + 22)) {
      goto LABEL_47;
    }
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_47;
  }
  waypointId = self->_waypointId;
  if ((unint64_t)waypointId | *((void *)v4 + 4) && !-[GEOWaypointID isEqual:](waypointId, "isEqual:")) {
    goto LABEL_47;
  }
  waypointPlace = self->_waypointPlace;
  if ((unint64_t)waypointPlace | *((void *)v4 + 7))
  {
    if (!-[GEOWaypointPlace isEqual:](waypointPlace, "isEqual:")) {
      goto LABEL_47;
    }
  }
  waypointLocation = self->_waypointLocation;
  if ((unint64_t)waypointLocation | *((void *)v4 + 5))
  {
    if (!-[GEOWaypointLocation isEqual:](waypointLocation, "isEqual:")) {
      goto LABEL_47;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v10 = *((_WORD *)v4 + 48);
  if ((flags & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0) {
      goto LABEL_47;
    }
    if (self->_isCurrentLocation)
    {
      if (!*((unsigned char *)v4 + 92)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)v4 + 92))
    {
      goto LABEL_47;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v10 & 0x20) != 0)
    {
      if (self->_isLocationOfInterest)
      {
        if (!*((unsigned char *)v4 + 93)) {
          goto LABEL_47;
        }
        goto LABEL_29;
      }
      if (!*((unsigned char *)v4 + 93)) {
        goto LABEL_29;
      }
    }
LABEL_47:
    BOOL v15 = 0;
    goto LABEL_48;
  }
  if ((v10 & 0x20) != 0) {
    goto LABEL_47;
  }
LABEL_29:
  if ((flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_waypointStatus != *((_DWORD *)v4 + 21)) {
      goto LABEL_47;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_47;
  }
  waypointNameProperties = self->_waypointNameProperties;
  if ((unint64_t)waypointNameProperties | *((void *)v4 + 6)
    && !-[GEOWaypointNameProperties isEqual:](waypointNameProperties, "isEqual:"))
  {
    goto LABEL_47;
  }
  uniqueWaypointId = self->_uniqueWaypointId;
  if ((unint64_t)uniqueWaypointId | *((void *)v4 + 3))
  {
    if (!-[GEOWaypointUUID isEqual:](uniqueWaypointId, "isEqual:")) {
      goto LABEL_47;
    }
  }
  __int16 v13 = (__int16)self->_flags;
  __int16 v14 = *((_WORD *)v4 + 48);
  if (v13)
  {
    if ((v14 & 1) == 0 || self->_downloadedOfflineRegionState != *((_DWORD *)v4 + 19)) {
      goto LABEL_47;
    }
  }
  else if (v14)
  {
    goto LABEL_47;
  }
  BOOL v15 = (v14 & 2) == 0;
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_waypointLocationSource != *((_DWORD *)v4 + 20)) {
      goto LABEL_47;
    }
    BOOL v15 = 1;
  }
LABEL_48:

  return v15;
}

- (unint64_t)hash
{
  [(GEOWaypointTyped *)self readAll:1];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v16 = 2654435761 * self->_waypointType;
  }
  else {
    uint64_t v16 = 0;
  }
  unint64_t v3 = [(GEOWaypointID *)self->_waypointId hash];
  unint64_t v4 = [(GEOWaypointPlace *)self->_waypointPlace hash];
  unint64_t v5 = [(GEOWaypointLocation *)self->_waypointLocation hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    uint64_t v7 = 0;
    if ((flags & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v8 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v7 = 2654435761 * self->_isCurrentLocation;
  if ((flags & 0x20) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_isLocationOfInterest;
  if ((flags & 4) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_waypointStatus;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v9 = 0;
LABEL_11:
  unint64_t v10 = [(GEOWaypointNameProperties *)self->_waypointNameProperties hash];
  unint64_t v11 = [(GEOWaypointUUID *)self->_uniqueWaypointId hash];
  __int16 v12 = (__int16)self->_flags;
  if (v12)
  {
    uint64_t v13 = 2654435761 * self->_downloadedOfflineRegionState;
    if ((v12 & 2) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v14 = 0;
    return v3 ^ v16 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
  }
  uint64_t v13 = 0;
  if ((v12 & 2) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_waypointLocationSource;
  return v3 ^ v16 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  v17 = (int *)a3;
  [v17 readAll:0];
  unint64_t v4 = v17;
  if ((v17[24] & 8) != 0)
  {
    self->_waypointType = v17[22];
    *(_WORD *)&self->_flags |= 8u;
  }
  waypointId = self->_waypointId;
  uint64_t v6 = *((void *)v17 + 4);
  if (waypointId)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOWaypointID mergeFrom:](waypointId, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOWaypointTyped setWaypointId:](self, "setWaypointId:");
  }
  unint64_t v4 = v17;
LABEL_9:
  waypointPlace = self->_waypointPlace;
  uint64_t v8 = *((void *)v4 + 7);
  if (waypointPlace)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOWaypointPlace mergeFrom:](waypointPlace, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOWaypointTyped setWaypointPlace:](self, "setWaypointPlace:");
  }
  unint64_t v4 = v17;
LABEL_15:
  waypointLocation = self->_waypointLocation;
  uint64_t v10 = *((void *)v4 + 5);
  if (waypointLocation)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOWaypointLocation mergeFrom:](waypointLocation, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOWaypointTyped setWaypointLocation:](self, "setWaypointLocation:");
  }
  unint64_t v4 = v17;
LABEL_21:
  __int16 v11 = *((_WORD *)v4 + 48);
  if ((v11 & 0x10) != 0)
  {
    self->_isCurrentLocation = *((unsigned char *)v4 + 92);
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v11 = *((_WORD *)v4 + 48);
    if ((v11 & 0x20) == 0)
    {
LABEL_23:
      if ((v11 & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((v11 & 0x20) == 0)
  {
    goto LABEL_23;
  }
  self->_isLocationOfInterest = *((unsigned char *)v4 + 93);
  *(_WORD *)&self->_flags |= 0x20u;
  if ((v4[24] & 4) != 0)
  {
LABEL_24:
    self->_waypointStatus = v4[21];
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_25:
  waypointNameProperties = self->_waypointNameProperties;
  uint64_t v13 = *((void *)v4 + 6);
  if (waypointNameProperties)
  {
    if (!v13) {
      goto LABEL_34;
    }
    -[GEOWaypointNameProperties mergeFrom:](waypointNameProperties, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_34;
    }
    -[GEOWaypointTyped setWaypointNameProperties:](self, "setWaypointNameProperties:");
  }
  unint64_t v4 = v17;
LABEL_34:
  uniqueWaypointId = self->_uniqueWaypointId;
  BOOL v15 = (void *)*((void *)v4 + 3);
  if (uniqueWaypointId)
  {
    if (!v15) {
      goto LABEL_40;
    }
    -[GEOWaypointUUID mergeFrom:]((uint64_t)uniqueWaypointId, v15);
  }
  else
  {
    if (!v15) {
      goto LABEL_40;
    }
    [(GEOWaypointTyped *)self setUniqueWaypointId:*((void *)v4 + 3)];
  }
  unint64_t v4 = v17;
LABEL_40:
  __int16 v16 = *((_WORD *)v4 + 48);
  if (v16)
  {
    self->_downloadedOfflineRegionState = v4[19];
    *(_WORD *)&self->_flags |= 1u;
    __int16 v16 = *((_WORD *)v4 + 48);
  }
  if ((v16 & 2) != 0)
  {
    self->_waypointLocationSource = v4[20];
    *(_WORD *)&self->_flags |= 2u;
  }

  MEMORY[0x1F4181870]();
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
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOWaypointTypedReadSpecified((uint64_t)self, (unint64_t)self->_reader, unknownFields_tags_3795);
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
  *(_WORD *)&self->_flags |= 0x1040u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOWaypointTyped *)self readAll:0];
    [(GEOWaypointID *)self->_waypointId clearUnknownFields:1];
    [(GEOWaypointPlace *)self->_waypointPlace clearUnknownFields:1];
    [(GEOWaypointLocation *)self->_waypointLocation clearUnknownFields:1];
    [(GEOWaypointNameProperties *)self->_waypointNameProperties clearUnknownFields:1];
    uniqueWaypointId = self->_uniqueWaypointId;
    if (uniqueWaypointId)
    {
      uint64_t v8 = uniqueWaypointId->_unknownFields;
      uniqueWaypointId->_unknownFields = 0;
    }
  }
}

- (id)locationForWaypoint
{
  if ([(GEOWaypointTyped *)self waypointType] == 3)
  {
    BOOL v3 = [(GEOWaypointTyped *)self waypointPlace];
    uint64_t v4 = [v3 center];
LABEL_7:
    uint64_t v6 = (void *)v4;
    goto LABEL_8;
  }
  if ([(GEOWaypointTyped *)self waypointType] == 4)
  {
    BOOL v3 = [(GEOWaypointTyped *)self waypointLocation];
    unint64_t v5 = [v3 location];
    uint64_t v6 = [v5 latLng];

LABEL_8:
    goto LABEL_9;
  }
  if ([(GEOWaypointTyped *)self waypointType] == 2)
  {
    BOOL v3 = [(GEOWaypointTyped *)self waypointId];
    uint64_t v4 = [v3 locationHint];
    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_9:

  return v6;
}

- (id)loggingDescription
{
  int v4 = [(GEOWaypointTyped *)self waypointType];
  if (v4 == 2)
  {
    __int16 v12 = [(GEOWaypointTyped *)self waypointId];
    uint64_t v7 = [v12 locationHint];

    uint64_t v13 = NSString;
    [v7 lat];
    uint64_t v15 = v14;
    [v7 lng];
    uint64_t v17 = v16;
    uint64_t v18 = [(GEOWaypointTyped *)self waypointId];
    uint64_t v19 = [v18 muid];
    __int16 v20 = [(GEOWaypointTyped *)self waypointId];
    v21 = [v20 placeNameHint];
    v2 = [v13 stringWithFormat:@"%f, %f | WAYPOINT_ID | muid: %llu | %@", v15, v17, v19, v21];
  }
  else
  {
    if (v4 == 3)
    {
      v22 = [(GEOWaypointTyped *)self waypointPlace];
      uint64_t v7 = [v22 center];

      uint64_t v23 = NSString;
      [v7 lat];
      uint64_t v25 = v24;
      [v7 lng];
      [v23 stringWithFormat:@"%f, %f | WAYPOINT_PLACE", v25, v26];
    }
    else
    {
      if (v4 != 4) {
        goto LABEL_9;
      }
      unint64_t v5 = [(GEOWaypointTyped *)self waypointLocation];
      uint64_t v6 = [v5 location];
      uint64_t v7 = [v6 latLng];

      uint64_t v8 = NSString;
      [v7 lat];
      uint64_t v10 = v9;
      [v7 lng];
      [v8 stringWithFormat:@"%f, %f | WAYPOINT_LOCATION", v10, v11];
    v2 = };
  }

LABEL_9:

  return v2;
}

- (void)clearLocations
{
}

@end