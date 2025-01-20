@interface CLPLOGENTRYVISIONLSLLocation
- (BOOL)hasAltitude;
- (BOOL)hasCoordinate;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPLOGENTRYVISIONLSLLocationCoordinate)coordinate;
- (CLPLOGENTRYVISIONTimeStamp)timestamp;
- (double)altitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setCoordinate:(id)a3;
- (void)setHasAltitude:(BOOL)a3;
- (void)setTimestamp:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLOGENTRYVISIONLSLLocation

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (void)setAltitude:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAltitude
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLOGENTRYVISIONLSLLocation;
  v4 = [(CLPLOGENTRYVISIONLSLLocation *)&v8 description];
  v5 = [(CLPLOGENTRYVISIONLSLLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  coordinate = self->_coordinate;
  if (coordinate)
  {
    v5 = [(CLPLOGENTRYVISIONLSLLocationCoordinate *)coordinate dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"coordinate"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithDouble:self->_altitude];
    [v3 setObject:v6 forKey:@"altitude"];
  }
  timestamp = self->_timestamp;
  if (timestamp)
  {
    objc_super v8 = [(CLPLOGENTRYVISIONTimeStamp *)timestamp dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"timestamp"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONLSLLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_coordinate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_timestamp)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_coordinate)
  {
    objc_msgSend(v4, "setCoordinate:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_altitude;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_timestamp)
  {
    objc_msgSend(v5, "setTimestamp:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPLOGENTRYVISIONLSLLocationCoordinate *)self->_coordinate copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_altitude;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v8 = [(CLPLOGENTRYVISIONTimeStamp *)self->_timestamp copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((void *)v4 + 2))
  {
    if (!-[CLPLOGENTRYVISIONLSLLocationCoordinate isEqual:](coordinate, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_altitude != *((double *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  timestamp = self->_timestamp;
  if ((unint64_t)timestamp | *((void *)v4 + 3)) {
    char v7 = -[CLPLOGENTRYVISIONTimeStamp isEqual:](timestamp, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CLPLOGENTRYVISIONLSLLocationCoordinate *)self->_coordinate hash];
  if (*(unsigned char *)&self->_has)
  {
    double altitude = self->_altitude;
    double v6 = -altitude;
    if (altitude >= 0.0) {
      double v6 = self->_altitude;
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
  return v4 ^ v3 ^ [(CLPLOGENTRYVISIONTimeStamp *)self->_timestamp hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  coordinate = self->_coordinate;
  uint64_t v6 = *((void *)v4 + 2);
  id v9 = v4;
  if (coordinate)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CLPLOGENTRYVISIONLSLLocationCoordinate mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CLPLOGENTRYVISIONLSLLocation setCoordinate:](self, "setCoordinate:");
  }
  id v4 = v9;
LABEL_7:
  if (*((unsigned char *)v4 + 32))
  {
    self->_double altitude = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  timestamp = self->_timestamp;
  uint64_t v8 = *((void *)v4 + 3);
  if (timestamp)
  {
    if (v8) {
      -[CLPLOGENTRYVISIONTimeStamp mergeFrom:](timestamp, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CLPLOGENTRYVISIONLSLLocation setTimestamp:](self, "setTimestamp:");
  }

  MEMORY[0x1F41817F8]();
}

- (CLPLOGENTRYVISIONLSLLocationCoordinate)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
}

- (double)altitude
{
  return self->_altitude;
}

- (CLPLOGENTRYVISIONTimeStamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_coordinate, 0);
}

@end