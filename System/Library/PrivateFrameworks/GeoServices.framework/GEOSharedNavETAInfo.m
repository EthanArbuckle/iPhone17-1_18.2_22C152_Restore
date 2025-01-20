@interface GEOSharedNavETAInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEtaTimestamp;
- (BOOL)hasLatitude;
- (BOOL)hasLongitude;
- (BOOL)hasRemainingDistance;
- (BOOL)hasRemainingTime;
- (BOOL)hasWaypointIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSharedNavETAInfo)initWithDictionary:(id)a3;
- (GEOSharedNavETAInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (double)etaTimestamp;
- (double)latitude;
- (double)longitude;
- (double)remainingDistance;
- (double)remainingTime;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)waypointIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEtaTimestamp:(double)a3;
- (void)setHasEtaTimestamp:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasRemainingDistance:(BOOL)a3;
- (void)setHasRemainingTime:(BOOL)a3;
- (void)setHasWaypointIndex:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setRemainingDistance:(double)a3;
- (void)setRemainingTime:(double)a3;
- (void)setWaypointIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSharedNavETAInfo

- (double)remainingDistance
{
  return self->_remainingDistance;
}

- (void)setRemainingDistance:(double)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_remainingDistance = a3;
}

- (void)setHasRemainingDistance:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasRemainingDistance
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_remainingTime = a3;
}

- (void)setHasRemainingTime:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasRemainingTime
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLatitude
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLongitude
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)etaTimestamp
{
  return self->_etaTimestamp;
}

- (void)setEtaTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_etaTimestamp = a3;
}

- (void)setHasEtaTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEtaTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)waypointIndex
{
  return self->_waypointIndex;
}

- (void)setWaypointIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_waypointIndex = a3;
}

- (void)setHasWaypointIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasWaypointIndex
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSharedNavETAInfo;
  v4 = [(GEOSharedNavETAInfo *)&v8 description];
  v5 = [(GEOSharedNavETAInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSharedNavETAInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_16;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 60);
  if ((v5 & 8) != 0)
  {
    v15 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    if (a2) {
      v16 = @"remainingDistance";
    }
    else {
      v16 = @"remaining_distance";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 60);
    if ((v5 & 0x10) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  if (a2) {
    v18 = @"remainingTime";
  }
  else {
    v18 = @"remaining_time";
  }
  [v4 setObject:v17 forKey:v18];

  char v5 = *(unsigned char *)(a1 + 60);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  v19 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
  [v4 setObject:v19 forKey:@"latitude"];

  char v5 = *(unsigned char *)(a1 + 60);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  v20 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  [v4 setObject:v20 forKey:@"longitude"];

  char v5 = *(unsigned char *)(a1 + 60);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
LABEL_29:
  v21 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  if (a2) {
    v22 = @"etaTimestamp";
  }
  else {
    v22 = @"eta_timestamp";
  }
  [v4 setObject:v21 forKey:v22];

  if ((*(unsigned char *)(a1 + 60) & 0x20) != 0)
  {
LABEL_8:
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
    if (a2) {
      v7 = @"waypointIndex";
    }
    else {
      v7 = @"waypoint_index";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_12:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __49__GEOSharedNavETAInfo__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E53D8860;
      id v12 = v11;
      id v24 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v23];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_16:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSharedNavETAInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOSharedNavETAInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEOSharedNavETAInfo)initWithDictionary:(id)a3
{
  return (GEOSharedNavETAInfo *)-[GEOSharedNavETAInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"remainingDistance";
      }
      else {
        v6 = @"remaining_distance";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setRemainingDistance:");
      }

      if (a3) {
        objc_super v8 = @"remainingTime";
      }
      else {
        objc_super v8 = @"remaining_time";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setRemainingTime:");
      }

      id v10 = [v5 objectForKeyedSubscript:@"latitude"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v10 doubleValue];
        objc_msgSend(a1, "setLatitude:");
      }

      v11 = [v5 objectForKeyedSubscript:@"longitude"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 doubleValue];
        objc_msgSend(a1, "setLongitude:");
      }

      if (a3) {
        id v12 = @"etaTimestamp";
      }
      else {
        id v12 = @"eta_timestamp";
      }
      id v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 doubleValue];
        objc_msgSend(a1, "setEtaTimestamp:");
      }

      if (a3) {
        v14 = @"waypointIndex";
      }
      else {
        v14 = @"waypoint_index";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setWaypointIndex:", objc_msgSend(v15, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOSharedNavETAInfo)initWithJSON:(id)a3
{
  return (GEOSharedNavETAInfo *)-[GEOSharedNavETAInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSharedNavETAInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSharedNavETAInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOSharedNavETAInfo *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[5] = *(void *)&self->_remainingDistance;
    *((unsigned char *)v5 + 60) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[6] = *(void *)&self->_remainingTime;
  *((unsigned char *)v5 + 60) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v5[3] = *(void *)&self->_latitude;
  *((unsigned char *)v5 + 60) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v5[4] = *(void *)&self->_longitude;
  *((unsigned char *)v5 + 60) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v5[2] = *(void *)&self->_etaTimestamp;
  *((unsigned char *)v5 + 60) |= 1u;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 14) = self->_waypointIndex;
    *((unsigned char *)v5 + 60) |= 0x20u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(double *)(v4 + 40) = self->_remainingDistance;
    *(unsigned char *)(v4 + 60) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v4 + 48) = self->_remainingTime;
  *(unsigned char *)(v4 + 60) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *(double *)(v4 + 24) = self->_latitude;
  *(unsigned char *)(v4 + 60) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *(double *)(v4 + 16) = self->_etaTimestamp;
    *(unsigned char *)(v4 + 60) |= 1u;
    if ((*(unsigned char *)&self->_flags & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_12:
  *(double *)(v4 + 32) = self->_longitude;
  *(unsigned char *)(v4 + 60) |= 4u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_13;
  }
LABEL_6:
  if ((flags & 0x20) != 0)
  {
LABEL_7:
    *(_DWORD *)(v4 + 56) = self->_waypointIndex;
    *(unsigned char *)(v4 + 60) |= 0x20u;
  }
LABEL_8:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  [(GEOSharedNavETAInfo *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_remainingDistance != *((double *)v4 + 5)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
LABEL_31:
    BOOL v5 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0 || self->_remainingTime != *((double *)v4 + 6)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_latitude != *((double *)v4 + 3)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_longitude != *((double *)v4 + 4)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_etaTimestamp != *((double *)v4 + 2)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 60) & 0x20) == 0;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x20) == 0 || self->_waypointIndex != *((_DWORD *)v4 + 14)) {
      goto LABEL_31;
    }
    BOOL v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  [(GEOSharedNavETAInfo *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    double remainingDistance = self->_remainingDistance;
    double v6 = -remainingDistance;
    if (remainingDistance >= 0.0) {
      double v6 = self->_remainingDistance;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((flags & 0x10) != 0)
  {
    double remainingTime = self->_remainingTime;
    double v11 = -remainingTime;
    if (remainingTime >= 0.0) {
      double v11 = self->_remainingTime;
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
  if ((flags & 2) != 0)
  {
    double latitude = self->_latitude;
    double v16 = -latitude;
    if (latitude >= 0.0) {
      double v16 = self->_latitude;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((flags & 4) != 0)
  {
    double longitude = self->_longitude;
    double v21 = -longitude;
    if (longitude >= 0.0) {
      double v21 = self->_longitude;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if (flags)
  {
    double etaTimestamp = self->_etaTimestamp;
    double v26 = -etaTimestamp;
    if (etaTimestamp >= 0.0) {
      double v26 = self->_etaTimestamp;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((flags & 0x20) != 0) {
    uint64_t v29 = 2654435761 * self->_waypointIndex;
  }
  else {
    uint64_t v29 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 60);
  if ((v4 & 8) != 0)
  {
    self->_double remainingDistance = *((double *)v5 + 5);
    *(unsigned char *)&self->_flags |= 8u;
    char v4 = *((unsigned char *)v5 + 60);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v5 + 60) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_double remainingTime = *((double *)v5 + 6);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v4 = *((unsigned char *)v5 + 60);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_double latitude = *((double *)v5 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v5 + 60);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_double longitude = *((double *)v5 + 4);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 60);
  if ((v4 & 1) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_double etaTimestamp = *((double *)v5 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v5 + 60) & 0x20) != 0)
  {
LABEL_7:
    self->_waypointIndex = *((_DWORD *)v5 + 14);
    *(unsigned char *)&self->_flags |= 0x20u;
  }
LABEL_8:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOSharedNavETAInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end