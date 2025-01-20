@interface GEOURLCamera
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAltitude;
- (BOOL)hasHeading;
- (BOOL)hasLatitude;
- (BOOL)hasLongitude;
- (BOOL)hasPitch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOURLCamera)initWithDictionary:(id)a3;
- (GEOURLCamera)initWithJSON:(id)a3;
- (double)altitude;
- (double)heading;
- (double)latitude;
- (double)longitude;
- (double)pitch;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setHasAltitude:(BOOL)a3;
- (void)setHasHeading:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasPitch:(BOOL)a3;
- (void)setHeading:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setPitch:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOURLCamera

- (double)pitch
{
  return self->_pitch;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)heading
{
  return self->_heading;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setPitch:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_pitch = a3;
}

- (void)setLongitude:(double)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_longitude = a3;
}

- (void)setLatitude:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_latitude = a3;
}

- (void)setHeading:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_heading = a3;
}

- (void)setAltitude:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_altitude = a3;
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLCameraReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  if (*(unsigned char *)&self->_flags) {
LABEL_6:
  }
    PBDataWriterWriteDoubleField();
LABEL_7:
}

- (void)setHasLatitude:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLatitude
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasLongitude
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)setHasHeading:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHeading
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)setHasPitch:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasPitch
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAltitude
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOURLCamera;
  v4 = [(GEOURLCamera *)&v8 description];
  id v5 = [(GEOURLCamera *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v2 = 0;
    goto LABEL_13;
  }
  [(id)a1 readAll:1];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  char v3 = *(unsigned char *)(a1 + 48);
  if ((v3 & 4) != 0)
  {
    v4 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    [v2 setObject:v4 forKey:@"latitude"];

    char v3 = *(unsigned char *)(a1 + 48);
  }
  if ((v3 & 8) != 0)
  {
    id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    [v2 setObject:v5 forKey:@"longitude"];

    char v3 = *(unsigned char *)(a1 + 48);
    if ((v3 & 2) == 0)
    {
LABEL_6:
      if ((v3 & 0x10) == 0) {
        goto LABEL_7;
      }
LABEL_11:
      v7 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
      [v2 setObject:v7 forKey:@"pitch"];

      if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_6;
  }
  v6 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  [v2 setObject:v6 forKey:@"heading"];

  char v3 = *(unsigned char *)(a1 + 48);
  if ((v3 & 0x10) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if (v3)
  {
LABEL_12:
    objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
    [v2 setObject:v8 forKey:@"altitude"];
  }
LABEL_13:

  return v2;
}

- (GEOURLCamera)initWithDictionary:(id)a3
{
  return (GEOURLCamera *)-[GEOURLCamera _initWithDictionary:isJSON:](self, a3);
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

      v6 = [v3 objectForKeyedSubscript:@"heading"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 doubleValue];
        objc_msgSend(a1, "setHeading:");
      }

      v7 = [v3 objectForKeyedSubscript:@"pitch"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setPitch:");
      }

      objc_super v8 = [v3 objectForKeyedSubscript:@"altitude"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 doubleValue];
        objc_msgSend(a1, "setAltitude:");
      }
    }
  }

  return a1;
}

- (GEOURLCamera)initWithJSON:(id)a3
{
  return (GEOURLCamera *)-[GEOURLCamera _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOURLCameraIsValid((char *)a3);
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOURLCamera *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[3] = *(void *)&self->_latitude;
    *((unsigned char *)v5 + 48) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = *(void *)&self->_longitude;
  *((unsigned char *)v5 + 48) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v5[2] = *(void *)&self->_heading;
  *((unsigned char *)v5 + 48) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v5[5] = *(void *)&self->_pitch;
  *((unsigned char *)v5 + 48) |= 0x10u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    v5[1] = *(void *)&self->_altitude;
    *((unsigned char *)v5 + 48) |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((void *)result + 3) = *(void *)&self->_latitude;
    *((unsigned char *)result + 48) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = *(void *)&self->_longitude;
  *((unsigned char *)result + 48) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)result + 2) = *(void *)&self->_heading;
  *((unsigned char *)result + 48) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((void *)result + 5) = *(void *)&self->_pitch;
  *((unsigned char *)result + 48) |= 0x10u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_6:
  *((void *)result + 1) = *(void *)&self->_altitude;
  *((unsigned char *)result + 48) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  [(GEOURLCamera *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_latitude != *((double *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_longitude != *((double *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_heading != *((double *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x10) == 0 || self->_pitch != *((double *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_altitude != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  [(GEOURLCamera *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
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
  if ((flags & 8) != 0)
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
  if ((flags & 2) != 0)
  {
    double heading = self->_heading;
    double v16 = -heading;
    if (heading >= 0.0) {
      double v16 = self->_heading;
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
  if ((flags & 0x10) != 0)
  {
    double pitch = self->_pitch;
    double v21 = -pitch;
    if (pitch >= 0.0) {
      double v21 = self->_pitch;
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
    double altitude = self->_altitude;
    double v26 = -altitude;
    if (altitude >= 0.0) {
      double v26 = self->_altitude;
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
  return v9 ^ v4 ^ v14 ^ v19 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (double *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 48);
  if ((v4 & 4) != 0)
  {
    self->_double latitude = v5[3];
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 48);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if (((_BYTE)v5[6] & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_double longitude = v5[4];
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 48);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_double heading = v5[2];
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v5 + 48);
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_double pitch = v5[5];
  *(unsigned char *)&self->_flags |= 0x10u;
  if ((_BYTE)v5[6])
  {
LABEL_6:
    self->_double altitude = v5[1];
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_7:
}

@end