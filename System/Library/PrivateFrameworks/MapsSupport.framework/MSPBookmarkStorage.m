@interface MSPBookmarkStorage
- (BOOL)hasIdentifier;
- (BOOL)hasPlaceBookmark;
- (BOOL)hasPosition;
- (BOOL)hasRegionBookmark;
- (BOOL)hasRouteBookmark;
- (BOOL)hasTimestamp;
- (BOOL)hasTransitLineBookmark;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MSPPlaceBookmark)placeBookmark;
- (MSPRegionBookmark)regionBookmark;
- (MSPRouteBookmark)routeBookmark;
- (MSPTransitLineBookmark)transitLineBookmark;
- (NSString)identifier;
- (PBUnknownFields)unknownFields;
- (double)position;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPosition:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPlaceBookmark:(id)a3;
- (void)setPosition:(double)a3;
- (void)setRegionBookmark:(id)a3;
- (void)setRouteBookmark:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTransitLineBookmark:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPBookmarkStorage

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E617E990[a3 - 1];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ROUTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REGION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setPosition:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPosition
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
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
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasPlaceBookmark
{
  return self->_placeBookmark != 0;
}

- (BOOL)hasRouteBookmark
{
  return self->_routeBookmark != 0;
}

- (BOOL)hasRegionBookmark
{
  return self->_regionBookmark != 0;
}

- (BOOL)hasTransitLineBookmark
{
  return self->_transitLineBookmark != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPBookmarkStorage;
  int v4 = [(MSPBookmarkStorage *)&v8 description];
  v5 = [(MSPBookmarkStorage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v4 = self->_type - 1;
    if (v4 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E617E990[v4];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_position];
    [v3 setObject:v8 forKey:@"position"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v9 forKey:@"timestamp"];
  }
  placeBookmark = self->_placeBookmark;
  if (placeBookmark)
  {
    v11 = [(MSPPlaceBookmark *)placeBookmark dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"placeBookmark"];
  }
  routeBookmark = self->_routeBookmark;
  if (routeBookmark)
  {
    v13 = [(MSPRouteBookmark *)routeBookmark dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"routeBookmark"];
  }
  regionBookmark = self->_regionBookmark;
  if (regionBookmark)
  {
    v15 = [(MSPRegionBookmark *)regionBookmark dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"regionBookmark"];
  }
  transitLineBookmark = self->_transitLineBookmark;
  if (transitLineBookmark)
  {
    v17 = [(MSPTransitLineBookmark *)transitLineBookmark dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"transitLineBookmark"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v19 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPBookmarkStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
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
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_placeBookmark)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_routeBookmark)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_regionBookmark)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_transitLineBookmark)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[18] = self->_type;
    *((unsigned char *)v4 + 76) |= 4u;
  }
  id v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 2) = *(void *)&self->_position;
    *((unsigned char *)v4 + 76) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 76) |= 2u;
  }
  if (self->_placeBookmark)
  {
    objc_msgSend(v6, "setPlaceBookmark:");
    id v4 = v6;
  }
  if (self->_routeBookmark)
  {
    objc_msgSend(v6, "setRouteBookmark:");
    id v4 = v6;
  }
  if (self->_regionBookmark)
  {
    objc_msgSend(v6, "setRegionBookmark:");
    id v4 = v6;
  }
  if (self->_transitLineBookmark)
  {
    objc_msgSend(v6, "setTransitLineBookmark:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_type;
    *(unsigned char *)(v5 + 76) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_identifier copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v6 + 16) = self->_position;
    *(unsigned char *)(v6 + 76) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v6 + 24) = self->_timestamp;
    *(unsigned char *)(v6 + 76) |= 2u;
  }
  id v10 = [(MSPPlaceBookmark *)self->_placeBookmark copyWithZone:a3];
  v11 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v10;

  id v12 = [(MSPRouteBookmark *)self->_routeBookmark copyWithZone:a3];
  v13 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v12;

  id v14 = [(MSPRegionBookmark *)self->_regionBookmark copyWithZone:a3];
  v15 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v14;

  id v16 = [(MSPTransitLineBookmark *)self->_transitLineBookmark copyWithZone:a3];
  v17 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v16;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 76);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_type != *((_DWORD *)v4 + 18)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    goto LABEL_28;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
    {
LABEL_28:
      char v12 = 0;
      goto LABEL_29;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 76);
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_position != *((double *)v4 + 2)) {
      goto LABEL_28;
    }
  }
  else if (v6)
  {
    goto LABEL_28;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_timestamp != *((double *)v4 + 3)) {
      goto LABEL_28;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_28;
  }
  placeBookmark = self->_placeBookmark;
  if ((unint64_t)placeBookmark | *((void *)v4 + 5) && !-[MSPPlaceBookmark isEqual:](placeBookmark, "isEqual:")) {
    goto LABEL_28;
  }
  routeBookmark = self->_routeBookmark;
  if ((unint64_t)routeBookmark | *((void *)v4 + 7))
  {
    if (!-[MSPRouteBookmark isEqual:](routeBookmark, "isEqual:")) {
      goto LABEL_28;
    }
  }
  regionBookmark = self->_regionBookmark;
  if ((unint64_t)regionBookmark | *((void *)v4 + 6))
  {
    if (!-[MSPRegionBookmark isEqual:](regionBookmark, "isEqual:")) {
      goto LABEL_28;
    }
  }
  transitLineBookmark = self->_transitLineBookmark;
  if ((unint64_t)transitLineBookmark | *((void *)v4 + 8)) {
    char v12 = -[MSPTransitLineBookmark isEqual:](transitLineBookmark, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_29:

  return v12;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_identifier hash];
  char has = (char)self->_has;
  if (has)
  {
    double position = self->_position;
    double v8 = -position;
    if (position >= 0.0) {
      double v8 = self->_position;
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
  if ((has & 2) != 0)
  {
    double timestamp = self->_timestamp;
    double v13 = -timestamp;
    if (timestamp >= 0.0) {
      double v13 = self->_timestamp;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  NSUInteger v16 = v4 ^ v3 ^ v6 ^ v11;
  unint64_t v17 = [(MSPPlaceBookmark *)self->_placeBookmark hash];
  unint64_t v18 = v16 ^ v17 ^ [(MSPRouteBookmark *)self->_routeBookmark hash];
  unint64_t v19 = [(MSPRegionBookmark *)self->_regionBookmark hash];
  return v18 ^ v19 ^ [(MSPTransitLineBookmark *)self->_transitLineBookmark hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  uint64_t v5 = v4;
  if ((v4[19] & 4) != 0)
  {
    self->_type = v4[18];
    *(unsigned char *)&self->_has |= 4u;
  }
  double v15 = v4;
  if (*((void *)v4 + 4))
  {
    -[MSPBookmarkStorage setIdentifier:](self, "setIdentifier:");
    uint64_t v5 = v15;
  }
  char v6 = *((unsigned char *)v5 + 76);
  if (v6)
  {
    self->_double position = *((double *)v5 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v5 + 76);
  }
  if ((v6 & 2) != 0)
  {
    self->_double timestamp = *((double *)v5 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
  placeBookmark = self->_placeBookmark;
  uint64_t v8 = *((void *)v5 + 5);
  if (placeBookmark)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[MSPPlaceBookmark mergeFrom:](placeBookmark, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[MSPBookmarkStorage setPlaceBookmark:](self, "setPlaceBookmark:");
  }
  uint64_t v5 = v15;
LABEL_15:
  routeBookmark = self->_routeBookmark;
  uint64_t v10 = *((void *)v5 + 7);
  if (routeBookmark)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[MSPRouteBookmark mergeFrom:](routeBookmark, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    [(MSPBookmarkStorage *)self setRouteBookmark:"setRouteBookmark:"];
  }
  uint64_t v5 = v15;
LABEL_21:
  regionBookmark = self->_regionBookmark;
  uint64_t v12 = *((void *)v5 + 6);
  if (regionBookmark)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[MSPRegionBookmark mergeFrom:](regionBookmark, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[MSPBookmarkStorage setRegionBookmark:](self, "setRegionBookmark:");
  }
  uint64_t v5 = v15;
LABEL_27:
  transitLineBookmark = self->_transitLineBookmark;
  uint64_t v14 = *((void *)v5 + 8);
  if (transitLineBookmark)
  {
    if (v14) {
      -[MSPTransitLineBookmark mergeFrom:](transitLineBookmark, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[MSPBookmarkStorage setTransitLineBookmark:](self, "setTransitLineBookmark:");
  }

  MEMORY[0x1F41817F8]();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)position
{
  return self->_position;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (MSPPlaceBookmark)placeBookmark
{
  return self->_placeBookmark;
}

- (void)setPlaceBookmark:(id)a3
{
}

- (MSPRouteBookmark)routeBookmark
{
  return self->_routeBookmark;
}

- (void)setRouteBookmark:(id)a3
{
}

- (MSPRegionBookmark)regionBookmark
{
  return self->_regionBookmark;
}

- (void)setRegionBookmark:(id)a3
{
}

- (MSPTransitLineBookmark)transitLineBookmark
{
  return self->_transitLineBookmark;
}

- (void)setTransitLineBookmark:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitLineBookmark, 0);
  objc_storeStrong((id *)&self->_routeBookmark, 0);
  objc_storeStrong((id *)&self->_regionBookmark, 0);
  objc_storeStrong((id *)&self->_placeBookmark, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end