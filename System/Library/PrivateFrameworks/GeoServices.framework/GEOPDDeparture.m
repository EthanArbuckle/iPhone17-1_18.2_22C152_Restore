@interface GEOPDDeparture
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAbsDepartureTime;
- (BOOL)hasAbsLiveDepartureTime;
- (BOOL)hasDisplayNameOverride;
- (BOOL)hasIsCanceled;
- (BOOL)hasRealTimeStatus;
- (BOOL)hasRealTimeStatusInfo;
- (BOOL)hasReferenceTripId;
- (BOOL)hasVehicleNumber;
- (BOOL)isCanceled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPastDeparture;
- (BOOL)isPastDepartureRelativeToDate:(id)a3 usingGracePeriod:(BOOL)a4;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)realTimeStatus;
- (GEOPDDeparture)init;
- (GEOPDDeparture)initWithData:(id)a3;
- (GEOPDDeparture)initWithDictionary:(id)a3;
- (GEOPDDeparture)initWithJSON:(id)a3;
- (GEOServerFormattedString)liveStatusString;
- (NSDate)departureDate;
- (NSDate)liveDepartureDate;
- (NSDate)scheduledDepartureDate;
- (NSString)description;
- (NSString)displayName;
- (NSString)displayNameOverride;
- (NSString)vehicleNumber;
- (PBUnknownFields)unknownFields;
- (double)absDepartureTime;
- (double)absLiveDepartureTime;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)realTimeStatusInfoAsString:(int)a3;
- (int)StringAsRealTimeStatusInfo:(id)a3;
- (int)realTimeStatusInfo;
- (int64_t)liveStatus;
- (unint64_t)hash;
- (unint64_t)referenceTripId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDisplayNameOverride;
- (void)_readRealTimeStatus;
- (void)_readVehicleNumber;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbsDepartureTime:(double)a3;
- (void)setAbsLiveDepartureTime:(double)a3;
- (void)setDisplayNameOverride:(id)a3;
- (void)setHasAbsDepartureTime:(BOOL)a3;
- (void)setHasAbsLiveDepartureTime:(BOOL)a3;
- (void)setHasIsCanceled:(BOOL)a3;
- (void)setHasRealTimeStatusInfo:(BOOL)a3;
- (void)setHasReferenceTripId:(BOOL)a3;
- (void)setIsCanceled:(BOOL)a3;
- (void)setRealTimeStatus:(id)a3;
- (void)setRealTimeStatusInfo:(int)a3;
- (void)setReferenceTripId:(unint64_t)a3;
- (void)setVehicleNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDDeparture

- (GEOPDDeparture)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDDeparture;
  v2 = [(GEOPDDeparture *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDDeparture)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDDeparture;
  v3 = [(GEOPDDeparture *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (double)absDepartureTime
{
  return self->_absDepartureTime;
}

- (void)setAbsDepartureTime:(double)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_absDepartureTime = a3;
}

- (void)setHasAbsDepartureTime:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasAbsDepartureTime
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readVehicleNumber
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVehicleNumber_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasVehicleNumber
{
  return self->_vehicleNumber != 0;
}

- (NSString)vehicleNumber
{
  -[GEOPDDeparture _readVehicleNumber]((uint64_t)self);
  vehicleNumber = self->_vehicleNumber;

  return vehicleNumber;
}

- (void)setVehicleNumber:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_vehicleNumber, a3);
}

- (double)absLiveDepartureTime
{
  return self->_absLiveDepartureTime;
}

- (void)setAbsLiveDepartureTime:(double)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_absLiveDepartureTime = a3;
}

- (void)setHasAbsLiveDepartureTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasAbsLiveDepartureTime
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  self->_isCanceled = a3;
}

- (void)setHasIsCanceled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 528;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasIsCanceled
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unint64_t)referenceTripId
{
  return self->_referenceTripId;
}

- (void)setReferenceTripId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_referenceTripId = a3;
}

- (void)setHasReferenceTripId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 516;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasReferenceTripId
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readRealTimeStatus
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRealTimeStatus_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasRealTimeStatus
{
  return self->_realTimeStatus != 0;
}

- (GEOFormattedString)realTimeStatus
{
  -[GEOPDDeparture _readRealTimeStatus]((uint64_t)self);
  realTimeStatus = self->_realTimeStatus;

  return realTimeStatus;
}

- (void)setRealTimeStatus:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_realTimeStatus, a3);
}

- (int)realTimeStatusInfo
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_realTimeStatusInfo;
  }
  else {
    return 0;
  }
}

- (void)setRealTimeStatusInfo:(int)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  self->_realTimeStatusInfo = a3;
}

- (void)setHasRealTimeStatusInfo:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 520;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasRealTimeStatusInfo
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)realTimeStatusInfoAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E3838[a3];
  }

  return v3;
}

- (int)StringAsRealTimeStatusInfo:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SCHEDULED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ON_TIME"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DELAYS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readDisplayNameOverride
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayNameOverride_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDisplayNameOverride
{
  return self->_displayNameOverride != 0;
}

- (NSString)displayNameOverride
{
  -[GEOPDDeparture _readDisplayNameOverride]((uint64_t)self);
  displayNameOverride = self->_displayNameOverride;

  return displayNameOverride;
}

- (void)setDisplayNameOverride:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_displayNameOverride, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDDeparture;
  int v4 = [(GEOPDDeparture *)&v8 description];
  v5 = [(GEOPDDeparture *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDeparture _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_50;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(_WORD *)(a1 + 92))
  {
    v5 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    if (a2) {
      objc_super v6 = @"absDepartureTime";
    }
    else {
      objc_super v6 = @"abs_departure_time";
    }
    [v4 setObject:v5 forKey:v6];
  }
  objc_super v7 = [(id)a1 vehicleNumber];
  if (v7)
  {
    if (a2) {
      objc_super v8 = @"vehicleNumber";
    }
    else {
      objc_super v8 = @"vehicle_number";
    }
    [v4 setObject:v7 forKey:v8];
  }

  __int16 v9 = *(_WORD *)(a1 + 92);
  if ((v9 & 2) == 0)
  {
    if ((v9 & 0x10) == 0) {
      goto LABEL_14;
    }
LABEL_26:
    v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 88)];
    if (a2) {
      v19 = @"isCanceled";
    }
    else {
      v19 = @"is_canceled";
    }
    [v4 setObject:v18 forKey:v19];

    if ((*(_WORD *)(a1 + 92) & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  v16 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  if (a2) {
    v17 = @"absLiveDepartureTime";
  }
  else {
    v17 = @"abs_live_departure_time";
  }
  [v4 setObject:v16 forKey:v17];

  __int16 v9 = *(_WORD *)(a1 + 92);
  if ((v9 & 0x10) != 0) {
    goto LABEL_26;
  }
LABEL_14:
  if ((v9 & 4) != 0)
  {
LABEL_15:
    v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
    if (a2) {
      v11 = @"referenceTripId";
    }
    else {
      v11 = @"reference_trip_id";
    }
    [v4 setObject:v10 forKey:v11];
  }
LABEL_19:
  v12 = [(id)a1 realTimeStatus];
  v13 = v12;
  if (v12)
  {
    if (a2)
    {
      v14 = [v12 jsonRepresentation];
      v15 = @"realTimeStatus";
    }
    else
    {
      v14 = [v12 dictionaryRepresentation];
      v15 = @"real_time_status";
    }
    [v4 setObject:v14 forKey:v15];
  }
  if ((*(_WORD *)(a1 + 92) & 8) != 0)
  {
    uint64_t v20 = *(int *)(a1 + 84);
    if (v20 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E53E3838[v20];
    }
    if (a2) {
      v22 = @"realTimeStatusInfo";
    }
    else {
      v22 = @"real_time_status_info";
    }
    [v4 setObject:v21 forKey:v22];
  }
  v23 = [(id)a1 displayNameOverride];
  if (v23)
  {
    if (a2) {
      v24 = @"displayNameOverride";
    }
    else {
      v24 = @"display_name_override";
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
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __44__GEOPDDeparture__dictionaryRepresentation___block_invoke;
      v32[3] = &unk_1E53D8860;
      id v29 = v28;
      id v33 = v29;
      [v27 enumerateKeysAndObjectsUsingBlock:v32];
      id v30 = v29;

      v27 = v30;
    }
    [v4 setObject:v27 forKey:@"Unknown Fields"];
  }
LABEL_50:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDDeparture _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPDDeparture__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    __int16 v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDDeparture)initWithDictionary:(id)a3
{
  return (GEOPDDeparture *)-[GEOPDDeparture _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_59;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_59;
  }
  if (a3) {
    objc_super v6 = @"absDepartureTime";
  }
  else {
    objc_super v6 = @"abs_departure_time";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 doubleValue];
    objc_msgSend(a1, "setAbsDepartureTime:");
  }

  if (a3) {
    objc_super v8 = @"vehicleNumber";
  }
  else {
    objc_super v8 = @"vehicle_number";
  }
  __int16 v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = (void *)[v9 copy];
    [a1 setVehicleNumber:v10];
  }
  if (a3) {
    v11 = @"absLiveDepartureTime";
  }
  else {
    v11 = @"abs_live_departure_time";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v12 doubleValue];
    objc_msgSend(a1, "setAbsLiveDepartureTime:");
  }

  if (a3) {
    v13 = @"isCanceled";
  }
  else {
    v13 = @"is_canceled";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsCanceled:", objc_msgSend(v14, "BOOLValue"));
  }

  if (a3) {
    v15 = @"referenceTripId";
  }
  else {
    v15 = @"reference_trip_id";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setReferenceTripId:", objc_msgSend(v16, "unsignedLongLongValue"));
  }

  if (a3) {
    v17 = @"realTimeStatus";
  }
  else {
    v17 = @"real_time_status";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [GEOFormattedString alloc];
    if (a3) {
      uint64_t v20 = [(GEOFormattedString *)v19 initWithJSON:v18];
    }
    else {
      uint64_t v20 = [(GEOFormattedString *)v19 initWithDictionary:v18];
    }
    v21 = (void *)v20;
    [a1 setRealTimeStatus:v20];
  }
  if (a3) {
    v22 = @"realTimeStatusInfo";
  }
  else {
    v22 = @"real_time_status_info";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v23;
    if ([v24 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v25 = 0;
    }
    else if ([v24 isEqualToString:@"SCHEDULED"])
    {
      uint64_t v25 = 1;
    }
    else if ([v24 isEqualToString:@"ON_TIME"])
    {
      uint64_t v25 = 2;
    }
    else if ([v24 isEqualToString:@"DELAYS"])
    {
      uint64_t v25 = 3;
    }
    else
    {
      uint64_t v25 = 0;
    }

    goto LABEL_52;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v25 = [v23 intValue];
LABEL_52:
    [a1 setRealTimeStatusInfo:v25];
  }

  if (a3) {
    v26 = @"displayNameOverride";
  }
  else {
    v26 = @"display_name_override";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v28 = (void *)[v27 copy];
    [a1 setDisplayNameOverride:v28];
  }
LABEL_59:

  return a1;
}

- (GEOPDDeparture)initWithJSON:(id)a3
{
  return (GEOPDDeparture *)-[GEOPDDeparture _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3728;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3729;
    }
    GEOPDDepartureReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOFormattedString *)self->_realTimeStatus readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDDepartureIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDepartureReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDDepartureIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_22;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDDeparture *)self readAll:0];
  if (*(_WORD *)&self->_flags) {
    PBDataWriterWriteDoubleField();
  }
  id v5 = v9;
  if (self->_vehicleNumber)
  {
    PBDataWriterWriteStringField();
    id v5 = v9;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 0x10) == 0) {
      goto LABEL_9;
    }
LABEL_19:
    PBDataWriterWriteBOOLField();
    id v5 = v9;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  PBDataWriterWriteDoubleField();
  id v5 = v9;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_19;
  }
LABEL_9:
  if ((flags & 4) != 0)
  {
LABEL_10:
    PBDataWriterWriteUint64Field();
    id v5 = v9;
  }
LABEL_11:
  if (self->_realTimeStatus)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v9;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v5 = v9;
  }
  if (self->_displayNameOverride)
  {
    PBDataWriterWriteStringField();
    id v5 = v9;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
LABEL_22:
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOPDDeparture *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 18) = self->_readerMarkPos;
  *((_DWORD *)v6 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v6;
  if (*(_WORD *)&self->_flags)
  {
    v6[3] = *(id *)&self->_absDepartureTime;
    *((_WORD *)v6 + 46) |= 1u;
  }
  if (self->_vehicleNumber)
  {
    objc_msgSend(v6, "setVehicleNumber:");
    int v4 = v6;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v4[4] = *(id *)&self->_absLiveDepartureTime;
    *((_WORD *)v4 + 46) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_7:
      if ((flags & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 88) = self->_isCanceled;
  *((_WORD *)v4 + 46) |= 0x10u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_8:
    v4[7] = self->_referenceTripId;
    *((_WORD *)v4 + 46) |= 4u;
  }
LABEL_9:
  if (self->_realTimeStatus)
  {
    objc_msgSend(v6, "setRealTimeStatus:");
    int v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_realTimeStatusInfo;
    *((_WORD *)v4 + 46) |= 8u;
  }
  if (self->_displayNameOverride)
  {
    objc_msgSend(v6, "setDisplayNameOverride:");
    int v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDDepartureReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDDeparture *)self readAll:0];
  if (*(_WORD *)&self->_flags)
  {
    *(double *)(v5 + 24) = self->_absDepartureTime;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_vehicleNumber copyWithZone:a3];
  id v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 0x10) == 0) {
      goto LABEL_9;
    }
LABEL_16:
    *(unsigned char *)(v5 + 88) = self->_isCanceled;
    *(_WORD *)(v5 + 92) |= 0x10u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  *(double *)(v5 + 32) = self->_absLiveDepartureTime;
  *(_WORD *)(v5 + 92) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_16;
  }
LABEL_9:
  if ((flags & 4) != 0)
  {
LABEL_10:
    *(void *)(v5 + 56) = self->_referenceTripId;
    *(_WORD *)(v5 + 92) |= 4u;
  }
LABEL_11:
  id v12 = [(GEOFormattedString *)self->_realTimeStatus copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_realTimeStatusInfo;
    *(_WORD *)(v5 + 92) |= 8u;
  }
  uint64_t v14 = [(NSString *)self->_displayNameOverride copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  [(GEOPDDeparture *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 46);
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_absDepartureTime != *((double *)v4 + 3)) {
      goto LABEL_38;
    }
  }
  else if (v6)
  {
    goto LABEL_38;
  }
  vehicleNumber = self->_vehicleNumber;
  if ((unint64_t)vehicleNumber | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](vehicleNumber, "isEqual:")) {
      goto LABEL_38;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 46);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_absLiveDepartureTime != *((double *)v4 + 4)) {
      goto LABEL_38;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_38;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0) {
      goto LABEL_38;
    }
    if (self->_isCanceled)
    {
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 88))
    {
      goto LABEL_38;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_38;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_referenceTripId != *((void *)v4 + 7)) {
      goto LABEL_38;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_38;
  }
  realTimeStatus = self->_realTimeStatus;
  if ((unint64_t)realTimeStatus | *((void *)v4 + 6))
  {
    if (-[GEOFormattedString isEqual:](realTimeStatus, "isEqual:"))
    {
      __int16 flags = (__int16)self->_flags;
      __int16 v6 = *((_WORD *)v4 + 46);
      goto LABEL_31;
    }
LABEL_38:
    char v10 = 0;
    goto LABEL_39;
  }
LABEL_31:
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_realTimeStatusInfo != *((_DWORD *)v4 + 21)) {
      goto LABEL_38;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_38;
  }
  displayNameOverride = self->_displayNameOverride;
  if ((unint64_t)displayNameOverride | *((void *)v4 + 5)) {
    char v10 = -[NSString isEqual:](displayNameOverride, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_39:

  return v10;
}

- (unint64_t)hash
{
  [(GEOPDDeparture *)self readAll:1];
  if (*(_WORD *)&self->_flags)
  {
    double absDepartureTime = self->_absDepartureTime;
    double v5 = -absDepartureTime;
    if (absDepartureTime >= 0.0) {
      double v5 = self->_absDepartureTime;
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
  NSUInteger v8 = [(NSString *)self->_vehicleNumber hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    double absLiveDepartureTime = self->_absLiveDepartureTime;
    double v12 = -absLiveDepartureTime;
    if (absLiveDepartureTime >= 0.0) {
      double v12 = self->_absLiveDepartureTime;
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
  if ((flags & 0x10) != 0)
  {
    uint64_t v15 = 2654435761 * self->_isCanceled;
    if ((flags & 4) != 0) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((flags & 4) != 0)
    {
LABEL_19:
      unint64_t v16 = 2654435761u * self->_referenceTripId;
      goto LABEL_22;
    }
  }
  unint64_t v16 = 0;
LABEL_22:
  unint64_t v17 = [(GEOFormattedString *)self->_realTimeStatus hash];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v18 = 2654435761 * self->_realTimeStatusInfo;
  }
  else {
    uint64_t v18 = 0;
  }
  return v8 ^ v3 ^ v10 ^ v15 ^ v16 ^ v17 ^ v18 ^ [(NSString *)self->_displayNameOverride hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v8 = (double *)a3;
  [v8 readAll:0];
  id v4 = v8;
  if (*((_WORD *)v8 + 46))
  {
    self->_double absDepartureTime = v8[3];
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((void *)v8 + 8))
  {
    -[GEOPDDeparture setVehicleNumber:](self, "setVehicleNumber:");
    id v4 = v8;
  }
  __int16 v5 = *((_WORD *)v4 + 46);
  if ((v5 & 2) != 0)
  {
    self->_double absLiveDepartureTime = v4[4];
    *(_WORD *)&self->_flags |= 2u;
    __int16 v5 = *((_WORD *)v4 + 46);
    if ((v5 & 0x10) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_7;
  }
  self->_isCanceled = *((unsigned char *)v4 + 88);
  *(_WORD *)&self->_flags |= 0x10u;
  if ((*((_WORD *)v4 + 46) & 4) != 0)
  {
LABEL_8:
    self->_referenceTripId = (unint64_t)v4[7];
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_9:
  realTimeStatus = self->_realTimeStatus;
  uint64_t v7 = *((void *)v4 + 6);
  if (realTimeStatus)
  {
    if (!v7) {
      goto LABEL_18;
    }
    -[GEOFormattedString mergeFrom:](realTimeStatus, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_18;
    }
    -[GEOPDDeparture setRealTimeStatus:](self, "setRealTimeStatus:");
  }
  id v4 = v8;
LABEL_18:
  if ((*((_WORD *)v4 + 46) & 8) != 0)
  {
    self->_realTimeStatusInfo = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 8u;
  }
  if (*((void *)v4 + 5))
  {
    -[GEOPDDeparture setDisplayNameOverride:](self, "setDisplayNameOverride:");
    id v4 = v8;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      __int16 v5 = reader;
      objc_sync_enter(v5);
      GEOPDDepartureReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3733);
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
  *(_WORD *)&self->_flags |= 0x220u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDDeparture *)self readAll:0];
    realTimeStatus = self->_realTimeStatus;
    [(GEOFormattedString *)realTimeStatus clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleNumber, 0);
  objc_storeStrong((id *)&self->_realTimeStatus, 0);
  objc_storeStrong((id *)&self->_displayNameOverride, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (NSString)displayName
{
  if ([(GEOPDDeparture *)self hasDisplayNameOverride])
  {
    BOOL v3 = [(GEOPDDeparture *)self displayNameOverride];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSString *)v3;
}

- (NSDate)departureDate
{
  BOOL v3 = [(GEOPDDeparture *)self liveDepartureDate];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(GEOPDDeparture *)self scheduledDepartureDate];
  }
  long double v6 = v5;

  return (NSDate *)v6;
}

- (NSDate)scheduledDepartureDate
{
  if ([(GEOPDDeparture *)self hasAbsDepartureTime])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1C9C8];
    [(GEOPDDeparture *)self absDepartureTime];
    id v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)liveDepartureDate
{
  if ([(GEOPDDeparture *)self hasAbsLiveDepartureTime])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1C9C8];
    [(GEOPDDeparture *)self absLiveDepartureTime];
    id v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (int64_t)liveStatus
{
  if ([(GEOPDDeparture *)self hasRealTimeStatusInfo])
  {
    int v3 = [(GEOPDDeparture *)self realTimeStatusInfo];
    if (v3 < 4) {
      return qword_18A63E840[v3];
    }
  }
  if ([(GEOPDDeparture *)self isCanceled]) {
    return 5;
  }
  if (![(GEOPDDeparture *)self hasAbsLiveDepartureTime]) {
    return 0;
  }
  if (![(GEOPDDeparture *)self hasAbsDepartureTime]) {
    return 1;
  }
  [(GEOPDDeparture *)self absDepartureTime];
  double v6 = v5;
  [(GEOPDDeparture *)self absLiveDepartureTime];
  double v8 = v7;
  double v9 = v6 - GEOConfigGetDouble(GeoServicesConfig_DepartureCutoffGracePeriodNetworkDefault, (uint64_t)off_1E9114298);
  if (v6 + 60.0 >= v8 && v9 <= v8) {
    return 2;
  }
  [(GEOPDDeparture *)self absLiveDepartureTime];
  double v12 = v11;
  [(GEOPDDeparture *)self absDepartureTime];
  if (v12 <= v13) {
    return 3;
  }
  else {
    return 4;
  }
}

- (GEOServerFormattedString)liveStatusString
{
  if ([(GEOPDDeparture *)self hasRealTimeStatus])
  {
    int v3 = [(GEOPDDeparture *)self realTimeStatus];
  }
  else
  {
    int v3 = 0;
  }

  return (GEOServerFormattedString *)v3;
}

- (BOOL)isPastDeparture
{
  int v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(self) = [(GEOPDDeparture *)self isPastDepartureRelativeToDate:v3 usingGracePeriod:1];

  return (char)self;
}

- (BOOL)isPastDepartureRelativeToDate:(id)a3 usingGracePeriod:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(GEOPDDeparture *)self departureDate];
  double v8 = v7;
  if (v7
    && (!v4
     || (([v7 timeIntervalSinceNow],
          double v10 = v9,
          double v11 = -GEOConfigGetDouble(GeoServicesConfig_DepartureCutoffGracePeriodNetworkDefault, (uint64_t)off_1E9114298),
          v10 < 60.0)
       ? (BOOL v12 = v10 <= v11)
       : (BOOL v12 = 1),
         v12)))
  {
    [v8 timeIntervalSinceDate:v6];
    BOOL v14 = v13 < 0.0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

@end