@interface CLPLOGENTRYVISIONVLLocation
- (BOOL)hasCoordinate;
- (BOOL)hasHorizontalAccuracy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPLOGENTRYVISIONSimdDoubleM)coordinate;
- (double)horizontalAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setHasHorizontalAccuracy:(BOOL)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLOGENTRYVISIONVLLocation

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (void)setHorizontalAccuracy:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_horizontalAccuracy = a3;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHorizontalAccuracy
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLOGENTRYVISIONVLLocation;
  v4 = [(CLPLOGENTRYVISIONVLLocation *)&v8 description];
  v5 = [(CLPLOGENTRYVISIONVLLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  coordinate = self->_coordinate;
  if (coordinate)
  {
    v5 = [(CLPLOGENTRYVISIONSimdDoubleM *)coordinate dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"coordinate"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithDouble:self->_horizontalAccuracy];
    [v3 setObject:v6 forKey:@"horizontal_accuracy"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONVLLocationReadFrom((uint64_t)self, (uint64_t)a3);
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_coordinate)
  {
    id v5 = v4;
    objc_msgSend(v4, "setCoordinate:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_horizontalAccuracy;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPLOGENTRYVISIONSimdDoubleM *)self->_coordinate copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_horizontalAccuracy;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((void *)v4 + 2))
  {
    if (!-[CLPLOGENTRYVISIONSimdDoubleM isEqual:](coordinate, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_horizontalAccuracy == *((double *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CLPLOGENTRYVISIONSimdDoubleM *)self->_coordinate hash];
  if (*(unsigned char *)&self->_has)
  {
    double horizontalAccuracy = self->_horizontalAccuracy;
    double v6 = -horizontalAccuracy;
    if (horizontalAccuracy >= 0.0) {
      double v6 = self->_horizontalAccuracy;
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
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  coordinate = self->_coordinate;
  uint64_t v6 = *((void *)v4 + 2);
  if (coordinate)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[CLPLOGENTRYVISIONSimdDoubleM mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[CLPLOGENTRYVISIONVLLocation setCoordinate:](self, "setCoordinate:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 24))
  {
    self->_double horizontalAccuracy = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }

  MEMORY[0x1F41817F8]();
}

- (CLPLOGENTRYVISIONSimdDoubleM)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void).cxx_destruct
{
}

@end