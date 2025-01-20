@interface MSPDroppedPin
- (BOOL)hasFloorOrdinal;
- (BOOL)hasLatLng;
- (BOOL)hasMapRegion;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)latLng;
- (GEOMapRegion)mapRegion;
- (PBUnknownFields)unknownFields;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)floorOrdinal;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFloorOrdinal:(int)a3;
- (void)setHasFloorOrdinal:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLatLng:(id)a3;
- (void)setMapRegion:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPDroppedPin

- (BOOL)hasLatLng
{
  return self->_latLng != 0;
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFloorOrdinal:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_floorOrdinal = a3;
}

- (void)setHasFloorOrdinal:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFloorOrdinal
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPDroppedPin;
  v4 = [(MSPDroppedPin *)&v8 description];
  v5 = [(MSPDroppedPin *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  latLng = self->_latLng;
  if (latLng)
  {
    v5 = [(GEOLatLng *)latLng dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"latLng"];
  }
  mapRegion = self->_mapRegion;
  if (mapRegion)
  {
    v7 = [(GEOMapRegion *)mapRegion dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"mapRegion"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v9 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = [NSNumber numberWithInt:self->_floorOrdinal];
    [v3 setObject:v10 forKey:@"floorOrdinal"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v12 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPDroppedPinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_latLng)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_mapRegion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_latLng)
  {
    objc_msgSend(v4, "setLatLng:");
    id v4 = v6;
  }
  if (self->_mapRegion)
  {
    objc_msgSend(v6, "setMapRegion:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 2) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_floorOrdinal;
    *((unsigned char *)v4 + 48) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(GEOLatLng *)self->_latLng copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_floorOrdinal;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  latLng = self->_latLng;
  if ((unint64_t)latLng | *((void *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](latLng, "isEqual:")) {
      goto LABEL_15;
    }
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 5))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_timestamp != *((double *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_floorOrdinal != *((_DWORD *)v4 + 6)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(GEOLatLng *)self->_latLng hash];
  uint64_t v4 = [(GEOMapRegion *)self->_mapRegion hash];
  char has = (char)self->_has;
  if (has)
  {
    double timestamp = self->_timestamp;
    double v8 = -timestamp;
    if (timestamp >= 0.0) {
      double v8 = self->_timestamp;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_floorOrdinal;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  latLng = self->_latLng;
  uint64_t v6 = *((void *)v4 + 4);
  id v10 = v4;
  if (latLng)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOLatLng mergeFrom:](latLng, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MSPDroppedPin setLatLng:](self, "setLatLng:");
  }
  id v4 = v10;
LABEL_7:
  mapRegion = self->_mapRegion;
  uint64_t v8 = *((void *)v4 + 5);
  if (mapRegion)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[MSPDroppedPin setMapRegion:](self, "setMapRegion:");
  }
  id v4 = v10;
LABEL_13:
  char v9 = *((unsigned char *)v4 + 48);
  if (v9)
  {
    self->_double timestamp = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v9 = *((unsigned char *)v4 + 48);
  }
  if ((v9 & 2) != 0)
  {
    self->_floorOrdinal = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }

  MEMORY[0x1F41817F8]();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (GEOLatLng)latLng
{
  return self->_latLng;
}

- (void)setLatLng:(id)a3
{
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)floorOrdinal
{
  return self->_floorOrdinal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_latLng, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end