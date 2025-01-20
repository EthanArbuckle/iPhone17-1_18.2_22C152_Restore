@interface GEOLogMsgEventParkedCar
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocation;
- (BOOL)hasLocationUncertainty;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)location;
- (GEOLogMsgEventParkedCar)initWithDictionary:(id)a3;
- (GEOLogMsgEventParkedCar)initWithJSON:(id)a3;
- (double)locationUncertainty;
- (double)timestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLocationUncertainty:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setLocationUncertainty:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventParkedCar

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (double)locationUncertainty
{
  return self->_locationUncertainty;
}

- (void)setLocationUncertainty:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_locationUncertainty = a3;
}

- (void)setHasLocationUncertainty:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLocationUncertainty
{
  return *(unsigned char *)&self->_flags & 1;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventParkedCar;
  v4 = [(GEOLogMsgEventParkedCar *)&v8 description];
  v5 = [(GEOLogMsgEventParkedCar *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventParkedCar _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 location];
    v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"location"];
    }
    char v8 = *(unsigned char *)(a1 + 32);
    if (v8)
    {
      v9 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
      if (a2) {
        v10 = @"locationUncertainty";
      }
      else {
        v10 = @"location_uncertainty";
      }
      [v4 setObject:v9 forKey:v10];

      char v8 = *(unsigned char *)(a1 + 32);
    }
    if ((v8 & 2) != 0)
    {
      v11 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      [v4 setObject:v11 forKey:@"timestamp"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventParkedCar _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventParkedCar)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventParkedCar *)-[GEOLogMsgEventParkedCar _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"location"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v8 = [(GEOLatLng *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOLatLng *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setLocation:v8];
      }
      if (a3) {
        v10 = @"locationUncertainty";
      }
      else {
        v10 = @"location_uncertainty";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 doubleValue];
        objc_msgSend(a1, "setLocationUncertainty:");
      }

      v12 = [v5 objectForKeyedSubscript:@"timestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 doubleValue];
        objc_msgSend(a1, "setTimestamp:");
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventParkedCar)initWithJSON:(id)a3
{
  return (GEOLogMsgEventParkedCar *)-[GEOLogMsgEventParkedCar _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventParkedCarIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventParkedCarReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOLatLng *)self->_location hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgEventParkedCar *)self readAll:0];
  if (self->_location) {
    objc_msgSend(v5, "setLocation:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)v5 + 1) = *(void *)&self->_locationUncertainty;
    *((unsigned char *)v5 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((void *)v5 + 3) = *(void *)&self->_timestamp;
    *((unsigned char *)v5 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOLatLng *)self->_location copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(double *)(v5 + 8) = self->_locationUncertainty;
    *(unsigned char *)(v5 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(double *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOLogMsgEventParkedCar *)self readAll:1];
  [v4 readAll:1];
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_locationUncertainty != *((double *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_timestamp != *((double *)v4 + 3)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventParkedCar *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_location hash];
  char flags = (char)self->_flags;
  if (flags)
  {
    double locationUncertainty = self->_locationUncertainty;
    double v7 = -locationUncertainty;
    if (locationUncertainty >= 0.0) {
      double v7 = self->_locationUncertainty;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((flags & 2) != 0)
  {
    double timestamp = self->_timestamp;
    double v12 = -timestamp;
    if (timestamp >= 0.0) {
      double v12 = self->_timestamp;
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
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  double v7 = (double *)a3;
  [v7 readAll:0];
  location = self->_location;
  uint64_t v5 = *((void *)v7 + 2);
  if (location)
  {
    if (v5) {
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOLogMsgEventParkedCar setLocation:](self, "setLocation:");
  }
  char v6 = *((unsigned char *)v7 + 32);
  if (v6)
  {
    self->_double locationUncertainty = v7[1];
    *(unsigned char *)&self->_flags |= 1u;
    char v6 = *((unsigned char *)v7 + 32);
  }
  if ((v6 & 2) != 0)
  {
    self->_double timestamp = v7[3];
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
}

@end