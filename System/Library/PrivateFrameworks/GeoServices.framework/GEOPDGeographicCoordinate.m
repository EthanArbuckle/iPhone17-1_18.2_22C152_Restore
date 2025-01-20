@interface GEOPDGeographicCoordinate
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAltitude;
- (BOOL)hasLatitude;
- (BOOL)hasLongitude;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGeographicCoordinate)initWithDictionary:(id)a3;
- (GEOPDGeographicCoordinate)initWithJSON:(id)a3;
- (double)altitude;
- (double)latitude;
- (double)longitude;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setHasAltitude:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGeographicCoordinate

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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGeographicCoordinate;
  v4 = [(GEOPDGeographicCoordinate *)&v8 description];
  v5 = [(GEOPDGeographicCoordinate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v2 = 0;
    goto LABEL_9;
  }
  [(id)a1 readAll:1];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  char v3 = *(unsigned char *)(a1 + 32);
  if ((v3 & 2) == 0)
  {
    if ((*(unsigned char *)(a1 + 32) & 4) == 0) {
      goto LABEL_4;
    }
LABEL_7:
    v5 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    [v2 setObject:v5 forKey:@"longitude"];

    if ((*(unsigned char *)(a1 + 32) & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v4 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  [v2 setObject:v4 forKey:@"latitude"];

  char v3 = *(unsigned char *)(a1 + 32);
  if ((v3 & 4) != 0) {
    goto LABEL_7;
  }
LABEL_4:
  if (v3)
  {
LABEL_8:
    v6 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
    [v2 setObject:v6 forKey:@"altitude"];
  }
LABEL_9:

  return v2;
}

- (GEOPDGeographicCoordinate)initWithDictionary:(id)a3
{
  return (GEOPDGeographicCoordinate *)-[GEOPDGeographicCoordinate _initWithDictionary:isJSON:](self, a3);
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

      v5 = [v3 objectForKeyedSubscript:@"longitude"];
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
    }
  }

  return a1;
}

- (GEOPDGeographicCoordinate)initWithJSON:(id)a3
{
  return (GEOPDGeographicCoordinate *)-[GEOPDGeographicCoordinate _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDGeographicCoordinateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGeographicCoordinateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [(GEOPDGeographicCoordinate *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[2] = *(void *)&self->_latitude;
    *((unsigned char *)v5 + 32) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[3] = *(void *)&self->_longitude;
  *((unsigned char *)v5 + 32) |= 4u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    v5[1] = *(void *)&self->_altitude;
    *((unsigned char *)v5 + 32) |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_latitude;
    *((unsigned char *)result + 32) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 3) = *(void *)&self->_longitude;
  *((unsigned char *)result + 32) |= 4u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 1) = *(void *)&self->_altitude;
  *((unsigned char *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOPDGeographicCoordinate *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_latitude != *((double *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_longitude != *((double *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_altitude != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPDGeographicCoordinate *)self readAll:1];
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
  return v9 ^ v4 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (double *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 2) != 0)
  {
    self->_double latitude = v5[2];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 32);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (((_BYTE)v5[4] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_double longitude = v5[3];
  *(unsigned char *)&self->_flags |= 4u;
  if ((_BYTE)v5[4])
  {
LABEL_4:
    self->_double altitude = v5[1];
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_5:
}

@end