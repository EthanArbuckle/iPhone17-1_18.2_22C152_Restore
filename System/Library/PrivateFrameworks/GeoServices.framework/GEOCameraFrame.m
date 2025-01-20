@interface GEOCameraFrame
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAltitude;
- (BOOL)hasLatitude;
- (BOOL)hasLongitude;
- (BOOL)hasPitch;
- (BOOL)hasRoll;
- (BOOL)hasYaw;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCameraFrame)initWithDictionary:(id)a3;
- (GEOCameraFrame)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (double)altitude;
- (double)latitude;
- (double)longitude;
- (double)pitch;
- (double)roll;
- (double)yaw;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setHasAltitude:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasPitch:(BOOL)a3;
- (void)setHasRoll:(BOOL)a3;
- (void)setHasYaw:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setPitch:(double)a3;
- (void)setRoll:(double)a3;
- (void)setYaw:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCameraFrame

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

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAltitude
{
  return *(unsigned char *)&self->_flags & 1;
}

- (double)yaw
{
  return self->_yaw;
}

- (void)setYaw:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_yaw = a3;
}

- (void)setHasYaw:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasYaw
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_pitch = a3;
}

- (void)setHasPitch:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasPitch
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)roll
{
  return self->_roll;
}

- (void)setRoll:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_roll = a3;
}

- (void)setHasRoll:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasRoll
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCameraFrame;
  v4 = [(GEOCameraFrame *)&v8 description];
  v5 = [(GEOCameraFrame *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCameraFrame _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_13;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 64);
  if ((v5 & 2) != 0)
  {
    v14 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    [v4 setObject:v14 forKey:@"latitude"];

    char v5 = *(unsigned char *)(a1 + 64);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)(a1 + 64) & 4) == 0)
  {
    goto LABEL_4;
  }
  v15 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  [v4 setObject:v15 forKey:@"longitude"];

  char v5 = *(unsigned char *)(a1 + 64);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  v16 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  [v4 setObject:v16 forKey:@"altitude"];

  char v5 = *(unsigned char *)(a1 + 64);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  v17 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  [v4 setObject:v17 forKey:@"yaw"];

  char v5 = *(unsigned char *)(a1 + 64);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_20:
  v18 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v4 setObject:v18 forKey:@"pitch"];

  if ((*(unsigned char *)(a1 + 64) & 0x10) != 0)
  {
LABEL_8:
    v6 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    [v4 setObject:v6 forKey:@"roll"];
  }
LABEL_9:
  v7 = *(void **)(a1 + 8);
  if (v7)
  {
    objc_super v8 = [v7 dictionaryRepresentation];
    v9 = v8;
    if (a2)
    {
      v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __44__GEOCameraFrame__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E53D8860;
      id v11 = v10;
      id v20 = v11;
      [v9 enumerateKeysAndObjectsUsingBlock:v19];
      id v12 = v11;

      v9 = v12;
    }
    [v4 setObject:v9 forKey:@"Unknown Fields"];
  }
LABEL_13:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCameraFrame _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOCameraFrame__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOCameraFrame)initWithDictionary:(id)a3
{
  return (GEOCameraFrame *)-[GEOCameraFrame _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"latitude"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v4 doubleValue];
        objc_msgSend(a1, "setLatitude:");
      }

      id v5 = [v3 objectForKeyedSubscript:@"longitude"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v5 doubleValue];
        objc_msgSend(a1, "setLongitude:");
      }

      v6 = [v3 objectForKeyedSubscript:@"altitude"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 doubleValue];
        objc_msgSend(a1, "setAltitude:");
      }

      v7 = [v3 objectForKeyedSubscript:@"yaw"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setYaw:");
      }

      objc_super v8 = [v3 objectForKeyedSubscript:@"pitch"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 doubleValue];
        objc_msgSend(a1, "setPitch:");
      }

      v9 = [v3 objectForKeyedSubscript:@"roll"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setRoll:");
      }
    }
  }

  return a1;
}

- (GEOCameraFrame)initWithJSON:(id)a3
{
  return (GEOCameraFrame *)-[GEOCameraFrame _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCameraFrameIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCameraFrameReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
LABEL_7:
  }
    PBDataWriterWriteDoubleField();
LABEL_8:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOCameraFrame *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = *(void *)&self->_latitude;
    *((unsigned char *)v5 + 64) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = *(void *)&self->_longitude;
  *((unsigned char *)v5 + 64) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v5[2] = *(void *)&self->_altitude;
  *((unsigned char *)v5 + 64) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v5[7] = *(void *)&self->_yaw;
  *((unsigned char *)v5 + 64) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v5[5] = *(void *)&self->_pitch;
  *((unsigned char *)v5 + 64) |= 8u;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_7:
    v5[6] = *(void *)&self->_roll;
    *((unsigned char *)v5 + 64) |= 0x10u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(double *)(v4 + 24) = self->_latitude;
    *(unsigned char *)(v4 + 64) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v4 + 32) = self->_longitude;
  *(unsigned char *)(v4 + 64) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *(double *)(v4 + 16) = self->_altitude;
  *(unsigned char *)(v4 + 64) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *(double *)(v4 + 40) = self->_pitch;
    *(unsigned char *)(v4 + 64) |= 8u;
    if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_12:
  *(double *)(v4 + 56) = self->_yaw;
  *(unsigned char *)(v4 + 64) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((flags & 0x10) != 0)
  {
LABEL_7:
    *(double *)(v4 + 48) = self->_roll;
    *(unsigned char *)(v4 + 64) |= 0x10u;
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
  [(GEOCameraFrame *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_latitude != *((double *)v4 + 3)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
LABEL_31:
    BOOL v5 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_longitude != *((double *)v4 + 4)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_altitude != *((double *)v4 + 2)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x20) == 0 || self->_yaw != *((double *)v4 + 7)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_pitch != *((double *)v4 + 5)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 64) & 0x10) == 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0 || self->_roll != *((double *)v4 + 6)) {
      goto LABEL_31;
    }
    BOOL v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  [(GEOCameraFrame *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    double latitude = self->_latitude;
    double v6 = -latitude;
    if (latitude >= 0.0) {
      double v6 = self->_latitude;
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
  if ((flags & 4) != 0)
  {
    double longitude = self->_longitude;
    double v11 = -longitude;
    if (longitude >= 0.0) {
      double v11 = self->_longitude;
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
  if (flags)
  {
    double altitude = self->_altitude;
    double v16 = -altitude;
    if (altitude >= 0.0) {
      double v16 = self->_altitude;
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
  if ((flags & 0x20) != 0)
  {
    double yaw = self->_yaw;
    double v21 = -yaw;
    if (yaw >= 0.0) {
      double v21 = self->_yaw;
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
  if ((flags & 8) != 0)
  {
    double pitch = self->_pitch;
    double v26 = -pitch;
    if (pitch >= 0.0) {
      double v26 = self->_pitch;
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
  if ((flags & 0x10) != 0)
  {
    double roll = self->_roll;
    double v31 = -roll;
    if (roll >= 0.0) {
      double v31 = self->_roll;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (double *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 64);
  if ((v4 & 2) != 0)
  {
    self->_double latitude = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 64);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if (((_BYTE)v5[8] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_double longitude = v5[4];
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 64);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_double altitude = v5[2];
  *(unsigned char *)&self->_flags |= 1u;
  char v4 = *((unsigned char *)v5 + 64);
  if ((v4 & 0x20) == 0)
  {
LABEL_5:
    if ((v4 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_double yaw = v5[7];
  *(unsigned char *)&self->_flags |= 0x20u;
  char v4 = *((unsigned char *)v5 + 64);
  if ((v4 & 8) == 0)
  {
LABEL_6:
    if ((v4 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_double pitch = v5[5];
  *(unsigned char *)&self->_flags |= 8u;
  if (((_BYTE)v5[8] & 0x10) != 0)
  {
LABEL_7:
    self->_double roll = v5[6];
    *(unsigned char *)&self->_flags |= 0x10u;
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
    [(GEOCameraFrame *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end