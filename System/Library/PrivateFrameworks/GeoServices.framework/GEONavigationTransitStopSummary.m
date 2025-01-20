@interface GEONavigationTransitStopSummary
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCoordinate;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasStopID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)coordinate;
- (GEONavigationTransitStopSummary)initWithDictionary:(id)a3;
- (GEONavigationTransitStopSummary)initWithJSON:(id)a3;
- (GEONavigationTransitStopSummary)initWithTransitStop:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)stopID;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setHasStopID:(BOOL)a3;
- (void)setStopID:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONavigationTransitStopSummary

- (unint64_t)stopID
{
  return self->_stopID;
}

- (void)setStopID:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_stopID = a3;
}

- (void)setHasStopID:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasStopID
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (GEOLatLng)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONavigationTransitStopSummary;
  v4 = [(GEONavigationTransitStopSummary *)&v8 description];
  v5 = [(GEONavigationTransitStopSummary *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONavigationTransitStopSummary _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 24))
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      [v4 setObject:v5 forKey:@"stopID"];
    }
    v6 = [(id)a1 coordinate];
    v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      objc_super v8 = [v6 dictionaryRepresentation];
      }
      [v4 setObject:v8 forKey:@"coordinate"];
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
  return -[GEONavigationTransitStopSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONavigationTransitStopSummary)initWithDictionary:(id)a3
{
  return (GEONavigationTransitStopSummary *)-[GEONavigationTransitStopSummary _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"stopID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStopID:", objc_msgSend(v6, "unsignedLongLongValue"));
      }

      v7 = [v5 objectForKeyedSubscript:@"coordinate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v9 = [(GEOLatLng *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOLatLng *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setCoordinate:v9];
      }
    }
  }

  return a1;
}

- (GEONavigationTransitStopSummary)initWithJSON:(id)a3
{
  return (GEONavigationTransitStopSummary *)-[GEONavigationTransitStopSummary _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavigationTransitStopSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavigationTransitStopSummaryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_coordinate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOLatLng *)self->_coordinate hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEONavigationTransitStopSummary *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((void *)v5 + 2) = self->_stopID;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  if (self->_coordinate)
  {
    objc_msgSend(v5, "setCoordinate:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 16) = self->_stopID;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  id v7 = [(GEOLatLng *)self->_coordinate copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEONavigationTransitStopSummary *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_stopID != *((void *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((void *)v4 + 1)) {
    char v6 = -[GEOLatLng isEqual:](coordinate, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEONavigationTransitStopSummary *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_stopID;
  }
  else {
    unint64_t v3 = 0;
  }
  return [(GEOLatLng *)self->_coordinate hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (unint64_t *)a3;
  [v7 readAll:0];
  id v4 = v7;
  if (v7[3])
  {
    self->_stopID = v7[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
  coordinate = self->_coordinate;
  unint64_t v6 = v7[1];
  if (coordinate)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEONavigationTransitStopSummary setCoordinate:](self, "setCoordinate:");
  }
  id v4 = v7;
LABEL_9:
}

- (void).cxx_destruct
{
}

- (GEONavigationTransitStopSummary)initWithTransitStop:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GEONavigationTransitStopSummary *)self init];
  if (v5)
  {
    -[GEONavigationTransitStopSummary setStopID:](v5, "setStopID:", [v4 muid]);
    unint64_t v6 = [v4 latLng];
    [(GEONavigationTransitStopSummary *)v5 setCoordinate:v6];

    id v7 = v5;
  }

  return v5;
}

@end