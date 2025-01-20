@interface GEORPIncidentAnnotationDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAnnotationType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIncidentId;
- (BOOL)hasIncidentLocation;
- (BOOL)hasIncidentType;
- (BOOL)hasUserLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)incidentLocation;
- (GEORPIncidentAnnotationDetails)init;
- (GEORPIncidentAnnotationDetails)initWithData:(id)a3;
- (GEORPIncidentAnnotationDetails)initWithDictionary:(id)a3;
- (GEORPIncidentAnnotationDetails)initWithJSON:(id)a3;
- (GEORPUserLocationDetails)userLocation;
- (NSString)incidentId;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)annotationTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)incidentTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsAnnotationType:(id)a3;
- (int)StringAsIncidentType:(id)a3;
- (int)annotationType;
- (int)incidentType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readIncidentId;
- (void)_readIncidentLocation;
- (void)_readUserLocation;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnnotationType:(int)a3;
- (void)setHasAnnotationType:(BOOL)a3;
- (void)setHasIncidentType:(BOOL)a3;
- (void)setIncidentId:(id)a3;
- (void)setIncidentLocation:(id)a3;
- (void)setIncidentType:(int)a3;
- (void)setUserLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPIncidentAnnotationDetails

- (GEORPIncidentAnnotationDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPIncidentAnnotationDetails;
  v2 = [(GEORPIncidentAnnotationDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPIncidentAnnotationDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPIncidentAnnotationDetails;
  v3 = [(GEORPIncidentAnnotationDetails *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUserLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPIncidentAnnotationDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasUserLocation
{
  return self->_userLocation != 0;
}

- (GEORPUserLocationDetails)userLocation
{
  -[GEORPIncidentAnnotationDetails _readUserLocation]((uint64_t)self);
  userLocation = self->_userLocation;

  return userLocation;
}

- (void)setUserLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (void)_readIncidentId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPIncidentAnnotationDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasIncidentId
{
  return self->_incidentId != 0;
}

- (NSString)incidentId
{
  -[GEORPIncidentAnnotationDetails _readIncidentId]((uint64_t)self);
  incidentId = self->_incidentId;

  return incidentId;
}

- (void)setIncidentId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_incidentId, a3);
}

- (int)annotationType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_annotationType;
  }
  else {
    return 1;
  }
}

- (void)setAnnotationType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_annotationType = a3;
}

- (void)setHasAnnotationType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasAnnotationType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)annotationTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DAC48[a3 - 1];
  }

  return v3;
}

- (int)StringAsAnnotationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ANNOTATION_TYPE_UNKNOWN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UP_VOTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DOWN_VOTE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AUTO_UP_VOTE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (int)incidentType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_incidentType;
  }
  else {
    return 0;
  }
}

- (void)setIncidentType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_incidentType = a3;
}

- (void)setHasIncidentType:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIncidentType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)incidentTypeAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DACF0[a3];
  }

  return v3;
}

- (int)StringAsIncidentType:(id)a3
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

- (void)_readIncidentLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPIncidentAnnotationDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasIncidentLocation
{
  return self->_incidentLocation != 0;
}

- (GEOLatLng)incidentLocation
{
  -[GEORPIncidentAnnotationDetails _readIncidentLocation]((uint64_t)self);
  incidentLocation = self->_incidentLocation;

  return incidentLocation;
}

- (void)setIncidentLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_incidentLocation, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPIncidentAnnotationDetails;
  int v4 = [(GEORPIncidentAnnotationDetails *)&v8 description];
  v5 = [(GEORPIncidentAnnotationDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPIncidentAnnotationDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 userLocation];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"userLocation";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"user_location";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 incidentId];
    if (v9)
    {
      if (a2) {
        v10 = @"incidentId";
      }
      else {
        v10 = @"incident_id";
      }
      [v4 setObject:v9 forKey:v10];
    }

    char v11 = *(unsigned char *)(a1 + 60);
    if (v11)
    {
      unsigned int v12 = *(_DWORD *)(a1 + 52) - 1;
      if (v12 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E53DAC48[v12];
      }
      if (a2) {
        v14 = @"annotationType";
      }
      else {
        v14 = @"annotation_type";
      }
      [v4 setObject:v13 forKey:v14];

      char v11 = *(unsigned char *)(a1 + 60);
    }
    if ((v11 & 2) != 0)
    {
      uint64_t v15 = *(int *)(a1 + 56);
      if (v15 >= 0x12)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E53DACF0[v15];
      }
      if (a2) {
        v17 = @"incidentType";
      }
      else {
        v17 = @"incident_type";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [(id)a1 incidentLocation];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"incidentLocation";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"incident_location";
      }
      [v4 setObject:v20 forKey:v21];
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
  return -[GEORPIncidentAnnotationDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPIncidentAnnotationDetails)initWithDictionary:(id)a3
{
  return (GEORPIncidentAnnotationDetails *)-[GEORPIncidentAnnotationDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_87;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_87;
  }
  if (a3) {
    objc_super v6 = @"userLocation";
  }
  else {
    objc_super v6 = @"user_location";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEORPUserLocationDetails alloc];
    if (a3) {
      uint64_t v9 = [(GEORPUserLocationDetails *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEORPUserLocationDetails *)v8 initWithDictionary:v7];
    }
    v10 = (void *)v9;
    [a1 setUserLocation:v9];
  }
  if (a3) {
    char v11 = @"incidentId";
  }
  else {
    char v11 = @"incident_id";
  }
  unsigned int v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (void *)[v12 copy];
    [a1 setIncidentId:v13];
  }
  if (a3) {
    v14 = @"annotationType";
  }
  else {
    v14 = @"annotation_type";
  }
  uint64_t v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
    if ([v16 isEqualToString:@"ANNOTATION_TYPE_UNKNOWN"])
    {
      uint64_t v17 = 1;
    }
    else if ([v16 isEqualToString:@"UP_VOTE"])
    {
      uint64_t v17 = 2;
    }
    else if ([v16 isEqualToString:@"DOWN_VOTE"])
    {
      uint64_t v17 = 3;
    }
    else if ([v16 isEqualToString:@"AUTO_UP_VOTE"])
    {
      uint64_t v17 = 4;
    }
    else
    {
      uint64_t v17 = 1;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_33;
    }
    uint64_t v17 = [v15 intValue];
  }
  [a1 setAnnotationType:v17];
LABEL_33:

  if (a3) {
    v18 = @"incidentType";
  }
  else {
    v18 = @"incident_type";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v19;
    if ([v20 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v21 = 0;
    }
    else if ([v20 isEqualToString:@"ROAD_CLOSURE"])
    {
      uint64_t v21 = 1;
    }
    else if ([v20 isEqualToString:@"LANE_CLOSURE"])
    {
      uint64_t v21 = 2;
    }
    else if ([v20 isEqualToString:@"WEATHER"])
    {
      uint64_t v21 = 3;
    }
    else if ([v20 isEqualToString:@"EVENT"])
    {
      uint64_t v21 = 4;
    }
    else if ([v20 isEqualToString:@"ACCIDENT"])
    {
      uint64_t v21 = 5;
    }
    else if ([v20 isEqualToString:@"HAZARD"])
    {
      uint64_t v21 = 6;
    }
    else if ([v20 isEqualToString:@"ROADWORKS"])
    {
      uint64_t v21 = 7;
    }
    else if ([v20 isEqualToString:@"RAMP_CLOSURE"])
    {
      uint64_t v21 = 8;
    }
    else if ([v20 isEqualToString:@"OTHER"])
    {
      uint64_t v21 = 9;
    }
    else if ([v20 isEqualToString:@"TRAFFIC"])
    {
      uint64_t v21 = 10;
    }
    else if ([v20 isEqualToString:@"WALKING_CLOSURE"])
    {
      uint64_t v21 = 11;
    }
    else if ([v20 isEqualToString:@"MANEUVER_CLOSURE"])
    {
      uint64_t v21 = 12;
    }
    else if ([v20 isEqualToString:@"AREA_ADVISORY"])
    {
      uint64_t v21 = 13;
    }
    else if ([v20 isEqualToString:@"AREA_CLOSURE"])
    {
      uint64_t v21 = 14;
    }
    else if ([v20 isEqualToString:@"CONGESTION_ZONE"])
    {
      uint64_t v21 = 15;
    }
    else if ([v20 isEqualToString:@"SPEED_CHECK"])
    {
      uint64_t v21 = 16;
    }
    else if ([v20 isEqualToString:@"NO_THOROUGHFARE_CLOSURE"])
    {
      uint64_t v21 = 17;
    }
    else
    {
      uint64_t v21 = 0;
    }

    goto LABEL_77;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = [v19 intValue];
LABEL_77:
    [a1 setIncidentType:v21];
  }

  if (a3) {
    v22 = @"incidentLocation";
  }
  else {
    v22 = @"incident_location";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v25 = [(GEOLatLng *)v24 initWithJSON:v23];
    }
    else {
      uint64_t v25 = [(GEOLatLng *)v24 initWithDictionary:v23];
    }
    v26 = (void *)v25;
    [a1 setIncidentLocation:v25];
  }
LABEL_87:

  return a1;
}

- (GEORPIncidentAnnotationDetails)initWithJSON:(id)a3
{
  return (GEORPIncidentAnnotationDetails *)-[GEORPIncidentAnnotationDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_4;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_4;
    }
    GEORPIncidentAnnotationDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPUserLocationDetails *)self->_userLocation readAll:1];
    [(GEOLatLng *)self->_incidentLocation readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPIncidentAnnotationDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPIncidentAnnotationDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPIncidentAnnotationDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPIncidentAnnotationDetails *)self readAll:0];
    if (self->_userLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_incidentId) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
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
  -[GEORPIncidentAnnotationDetails _readIncidentLocation]((uint64_t)self);
  if ([(GEOLatLng *)self->_incidentLocation hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPIncidentAnnotationDetails _readUserLocation]((uint64_t)self);
  userLocation = self->_userLocation;

  return [(GEORPUserLocationDetails *)userLocation hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEORPIncidentAnnotationDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 10) = self->_readerMarkPos;
  *((_DWORD *)v6 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_userLocation) {
    objc_msgSend(v6, "setUserLocation:");
  }
  if (self->_incidentId) {
    objc_msgSend(v6, "setIncidentId:");
  }
  char flags = (char)self->_flags;
  id v5 = v6;
  if (flags)
  {
    *((_DWORD *)v6 + 13) = self->_annotationType;
    *((unsigned char *)v6 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 14) = self->_incidentType;
    *((unsigned char *)v6 + 60) |= 2u;
  }
  if (self->_incidentLocation)
  {
    objc_msgSend(v6, "setIncidentLocation:");
    id v5 = v6;
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPIncidentAnnotationDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPIncidentAnnotationDetails *)self readAll:0];
  id v9 = [(GEORPUserLocationDetails *)self->_userLocation copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_incidentId copyWithZone:a3];
  unsigned int v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 52) = self->_annotationType;
    *(unsigned char *)(v5 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_incidentType;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  id v14 = [(GEOLatLng *)self->_incidentLocation copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v14;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEORPIncidentAnnotationDetails *)self readAll:1];
  [v4 readAll:1];
  userLocation = self->_userLocation;
  if ((unint64_t)userLocation | *((void *)v4 + 4))
  {
    if (!-[GEORPUserLocationDetails isEqual:](userLocation, "isEqual:")) {
      goto LABEL_18;
    }
  }
  incidentId = self->_incidentId;
  if ((unint64_t)incidentId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](incidentId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_annotationType != *((_DWORD *)v4 + 13)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_incidentType != *((_DWORD *)v4 + 14)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_18;
  }
  incidentLocation = self->_incidentLocation;
  if ((unint64_t)incidentLocation | *((void *)v4 + 3)) {
    char v8 = -[GEOLatLng isEqual:](incidentLocation, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  [(GEORPIncidentAnnotationDetails *)self readAll:1];
  unint64_t v3 = [(GEORPUserLocationDetails *)self->_userLocation hash];
  NSUInteger v4 = [(NSString *)self->_incidentId hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v5 = 2654435761 * self->_annotationType;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(GEOLatLng *)self->_incidentLocation hash];
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_incidentType;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(GEOLatLng *)self->_incidentLocation hash];
}

- (void)mergeFrom:(id)a3
{
  v10 = a3;
  [v10 readAll:0];
  NSUInteger v4 = v10;
  userLocation = self->_userLocation;
  uint64_t v6 = v10[4];
  if (userLocation)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEORPUserLocationDetails mergeFrom:](userLocation, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEORPIncidentAnnotationDetails setUserLocation:](self, "setUserLocation:");
  }
  NSUInteger v4 = v10;
LABEL_7:
  if (v4[2])
  {
    -[GEORPIncidentAnnotationDetails setIncidentId:](self, "setIncidentId:");
    NSUInteger v4 = v10;
  }
  char v7 = *((unsigned char *)v4 + 60);
  if (v7)
  {
    self->_annotationType = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
    char v7 = *((unsigned char *)v4 + 60);
  }
  if ((v7 & 2) != 0)
  {
    self->_incidentType = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_flags |= 2u;
  }
  incidentLocation = self->_incidentLocation;
  uint64_t v9 = v4[3];
  if (incidentLocation)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[GEOLatLng mergeFrom:](incidentLocation, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[GEORPIncidentAnnotationDetails setIncidentLocation:](self, "setIncidentLocation:");
  }
  NSUInteger v4 = v10;
LABEL_19:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_incidentLocation, 0);
  objc_storeStrong((id *)&self->_incidentId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end