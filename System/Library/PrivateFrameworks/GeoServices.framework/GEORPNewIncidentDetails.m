@interface GEORPNewIncidentDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIncidentLocation;
- (BOOL)hasType;
- (BOOL)hasUserLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPIncidentLocation)incidentLocation;
- (GEORPNewIncidentDetails)init;
- (GEORPNewIncidentDetails)initWithData:(id)a3;
- (GEORPNewIncidentDetails)initWithDictionary:(id)a3;
- (GEORPNewIncidentDetails)initWithJSON:(id)a3;
- (GEORPUserLocationDetails)userLocation;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readIncidentLocation;
- (void)_readUserLocation;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIncidentLocation:(id)a3;
- (void)setType:(int)a3;
- (void)setUserLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPNewIncidentDetails

- (GEORPNewIncidentDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPNewIncidentDetails;
  v2 = [(GEORPNewIncidentDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPNewIncidentDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPNewIncidentDetails;
  v3 = [(GEORPNewIncidentDetails *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DACF0[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ROAD_CLOSURE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LANE_CLOSURE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WEATHER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EVENT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ACCIDENT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"HAZARD"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ROADWORKS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RAMP_CLOSURE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TRAFFIC"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"WALKING_CLOSURE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MANEUVER_CLOSURE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"AREA_ADVISORY"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AREA_CLOSURE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CONGESTION_ZONE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SPEED_CHECK"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"NO_THOROUGHFARE_CLOSURE"])
  {
    int v4 = 17;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readUserLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPNewIncidentDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserLocation_tags_322);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasUserLocation
{
  return self->_userLocation != 0;
}

- (GEORPUserLocationDetails)userLocation
{
  -[GEORPNewIncidentDetails _readUserLocation]((uint64_t)self);
  userLocation = self->_userLocation;

  return userLocation;
}

- (void)setUserLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (void)_readIncidentLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPNewIncidentDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentLocation_tags_323);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasIncidentLocation
{
  return self->_incidentLocation != 0;
}

- (GEORPIncidentLocation)incidentLocation
{
  -[GEORPNewIncidentDetails _readIncidentLocation]((uint64_t)self);
  incidentLocation = self->_incidentLocation;

  return incidentLocation;
}

- (void)setIncidentLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_incidentLocation, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPNewIncidentDetails;
  int v4 = [(GEORPNewIncidentDetails *)&v8 description];
  v5 = [(GEORPNewIncidentDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPNewIncidentDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v5 = *(int *)(a1 + 44);
      if (v5 >= 0x12)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DACF0[v5];
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    objc_super v7 = [(id)a1 userLocation];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"userLocation";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"user_location";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 incidentLocation];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"incidentLocation";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"incident_location";
      }
      [v4 setObject:v13 forKey:v14];
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
  return -[GEORPNewIncidentDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPNewIncidentDetails)initWithDictionary:(id)a3
{
  return (GEORPNewIncidentDetails *)-[GEORPNewIncidentDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_62;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_62;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"ROAD_CLOSURE"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"LANE_CLOSURE"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"WEATHER"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"EVENT"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"ACCIDENT"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"HAZARD"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"ROADWORKS"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"RAMP_CLOSURE"])
    {
      uint64_t v8 = 8;
    }
    else if ([v7 isEqualToString:@"OTHER"])
    {
      uint64_t v8 = 9;
    }
    else if ([v7 isEqualToString:@"TRAFFIC"])
    {
      uint64_t v8 = 10;
    }
    else if ([v7 isEqualToString:@"WALKING_CLOSURE"])
    {
      uint64_t v8 = 11;
    }
    else if ([v7 isEqualToString:@"MANEUVER_CLOSURE"])
    {
      uint64_t v8 = 12;
    }
    else if ([v7 isEqualToString:@"AREA_ADVISORY"])
    {
      uint64_t v8 = 13;
    }
    else if ([v7 isEqualToString:@"AREA_CLOSURE"])
    {
      uint64_t v8 = 14;
    }
    else if ([v7 isEqualToString:@"CONGESTION_ZONE"])
    {
      uint64_t v8 = 15;
    }
    else if ([v7 isEqualToString:@"SPEED_CHECK"])
    {
      uint64_t v8 = 16;
    }
    else if ([v7 isEqualToString:@"NO_THOROUGHFARE_CLOSURE"])
    {
      uint64_t v8 = 17;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_44:
    [a1 setType:v8];
  }

  if (a3) {
    v9 = @"userLocation";
  }
  else {
    v9 = @"user_location";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [GEORPUserLocationDetails alloc];
    if (a3) {
      uint64_t v12 = [(GEORPUserLocationDetails *)v11 initWithJSON:v10];
    }
    else {
      uint64_t v12 = [(GEORPUserLocationDetails *)v11 initWithDictionary:v10];
    }
    v13 = (void *)v12;
    [a1 setUserLocation:v12];
  }
  if (a3) {
    v14 = @"incidentLocation";
  }
  else {
    v14 = @"incident_location";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [GEORPIncidentLocation alloc];
    if (a3) {
      uint64_t v17 = [(GEORPIncidentLocation *)v16 initWithJSON:v15];
    }
    else {
      uint64_t v17 = [(GEORPIncidentLocation *)v16 initWithDictionary:v15];
    }
    v18 = (void *)v17;
    [a1 setIncidentLocation:v17];
  }
LABEL_62:

  return a1;
}

- (GEORPNewIncidentDetails)initWithJSON:(id)a3
{
  return (GEORPNewIncidentDetails *)-[GEORPNewIncidentDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_325;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_326;
    }
    GEORPNewIncidentDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPUserLocationDetails *)self->_userLocation readAll:1];
    [(GEORPIncidentLocation *)self->_incidentLocation readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPNewIncidentDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPNewIncidentDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPNewIncidentDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPNewIncidentDetails *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_userLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_incidentLocation) {
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
  -[GEORPNewIncidentDetails _readIncidentLocation]((uint64_t)self);
  if ([(GEORPIncidentLocation *)self->_incidentLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPNewIncidentDetails _readUserLocation]((uint64_t)self);
  userLocation = self->_userLocation;

  return [(GEORPUserLocationDetails *)userLocation hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPNewIncidentDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 11) = self->_type;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  if (self->_userLocation)
  {
    objc_msgSend(v5, "setUserLocation:");
    int v4 = v5;
  }
  if (self->_incidentLocation)
  {
    objc_msgSend(v5, "setIncidentLocation:");
    int v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPNewIncidentDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPNewIncidentDetails *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 44) = self->_type;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  id v9 = [(GEORPUserLocationDetails *)self->_userLocation copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEORPIncidentLocation *)self->_incidentLocation copyWithZone:a3];
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEORPNewIncidentDetails *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_type != *((_DWORD *)v4 + 11)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  userLocation = self->_userLocation;
  if ((unint64_t)userLocation | *((void *)v4 + 3)
    && !-[GEORPUserLocationDetails isEqual:](userLocation, "isEqual:"))
  {
    goto LABEL_11;
  }
  incidentLocation = self->_incidentLocation;
  if ((unint64_t)incidentLocation | *((void *)v4 + 2)) {
    char v7 = -[GEORPIncidentLocation isEqual:](incidentLocation, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEORPNewIncidentDetails *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEORPUserLocationDetails *)self->_userLocation hash] ^ v3;
  return v4 ^ [(GEORPIncidentLocation *)self->_incidentLocation hash];
}

- (void)mergeFrom:(id)a3
{
  id v9 = (int *)a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  if (v9[12])
  {
    self->_type = v9[11];
    *(unsigned char *)&self->_flags |= 1u;
  }
  userLocation = self->_userLocation;
  uint64_t v6 = *((void *)v9 + 3);
  if (userLocation)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPUserLocationDetails mergeFrom:](userLocation, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPNewIncidentDetails setUserLocation:](self, "setUserLocation:");
  }
  unint64_t v4 = v9;
LABEL_9:
  incidentLocation = self->_incidentLocation;
  uint64_t v8 = *((void *)v4 + 2);
  if (incidentLocation)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEORPIncidentLocation mergeFrom:](incidentLocation, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEORPNewIncidentDetails setIncidentLocation:](self, "setIncidentLocation:");
  }
  unint64_t v4 = v9;
LABEL_15:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_incidentLocation, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end