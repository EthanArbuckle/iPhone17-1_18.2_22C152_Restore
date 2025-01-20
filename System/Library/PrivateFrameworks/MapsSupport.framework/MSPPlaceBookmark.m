@interface MSPPlaceBookmark
- (BOOL)hasDroppedPinCoordinate;
- (BOOL)hasDroppedPinFloorOrdinal;
- (BOOL)hasMapItemStorage;
- (BOOL)hasOrigin;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)droppedPinCoordinate;
- (GEOMapItemStorage)mapItemStorage;
- (NSString)title;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)originAsString:(int)a3;
- (int)StringAsOrigin:(id)a3;
- (int)droppedPinFloorOrdinal;
- (int)origin;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDroppedPinCoordinate:(id)a3;
- (void)setDroppedPinFloorOrdinal:(int)a3;
- (void)setHasDroppedPinFloorOrdinal:(BOOL)a3;
- (void)setHasOrigin:(BOOL)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setOrigin:(int)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPPlaceBookmark

- (BOOL)hasMapItemStorage
{
  return self->_mapItemStorage != 0;
}

- (int)origin
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_origin;
  }
  else {
    return 0;
  }
}

- (void)setOrigin:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOrigin
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)originAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"DROPPED_PIN";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"OTHER";
  }
  return v4;
}

- (int)StringAsOrigin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OTHER"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"DROPPED_PIN"];
  }

  return v4;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasDroppedPinCoordinate
{
  return self->_droppedPinCoordinate != 0;
}

- (void)setDroppedPinFloorOrdinal:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_droppedPinFloorOrdinal = a3;
}

- (void)setHasDroppedPinFloorOrdinal:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDroppedPinFloorOrdinal
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPPlaceBookmark;
  int v4 = [(MSPPlaceBookmark *)&v8 description];
  v5 = [(MSPPlaceBookmark *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  mapItemStorage = self->_mapItemStorage;
  if (mapItemStorage)
  {
    v5 = [(GEOMapItemStorage *)mapItemStorage dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"mapItemStorage"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int origin = self->_origin;
    if (origin)
    {
      if (origin == 1)
      {
        v7 = @"DROPPED_PIN";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_origin);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = @"OTHER";
    }
    [v3 setObject:v7 forKey:@"origin"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  droppedPinCoordinate = self->_droppedPinCoordinate;
  if (droppedPinCoordinate)
  {
    v10 = [(GEOLatLng *)droppedPinCoordinate dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"droppedPinCoordinate"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithInt:self->_droppedPinFloorOrdinal];
    [v3 setObject:v11 forKey:@"droppedPinFloorOrdinal"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v13 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPPlaceBookmarkReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_mapItemStorage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_droppedPinCoordinate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_mapItemStorage)
  {
    objc_msgSend(v4, "setMapItemStorage:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_origin;
    *((unsigned char *)v4 + 56) |= 2u;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    id v4 = v5;
  }
  if (self->_droppedPinCoordinate)
  {
    objc_msgSend(v5, "setDroppedPinCoordinate:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_droppedPinFloorOrdinal;
    *((unsigned char *)v4 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(GEOMapItemStorage *)self->_mapItemStorage copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_origin;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(GEOLatLng *)self->_droppedPinCoordinate copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_droppedPinFloorOrdinal;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  mapItemStorage = self->_mapItemStorage;
  if ((unint64_t)mapItemStorage | *((void *)v4 + 4))
  {
    if (!-[GEOMapItemStorage isEqual:](mapItemStorage, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_origin != *((_DWORD *)v4 + 10)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 6) && !-[NSString isEqual:](title, "isEqual:")) {
    goto LABEL_17;
  }
  droppedPinCoordinate = self->_droppedPinCoordinate;
  if ((unint64_t)droppedPinCoordinate | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](droppedPinCoordinate, "isEqual:")) {
      goto LABEL_17;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_droppedPinFloorOrdinal != *((_DWORD *)v4 + 6)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(GEOMapItemStorage *)self->_mapItemStorage hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_origin;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_title hash];
  uint64_t v6 = [(GEOLatLng *)self->_droppedPinCoordinate hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_droppedPinFloorOrdinal;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  mapItemStorage = self->_mapItemStorage;
  uint64_t v6 = *((void *)v4 + 4);
  id v9 = v4;
  if (mapItemStorage)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOMapItemStorage mergeFrom:](mapItemStorage, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MSPPlaceBookmark setMapItemStorage:](self, "setMapItemStorage:");
  }
  id v4 = v9;
LABEL_7:
  if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    self->_int origin = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 6))
  {
    -[MSPPlaceBookmark setTitle:](self, "setTitle:");
    id v4 = v9;
  }
  droppedPinCoordinate = self->_droppedPinCoordinate;
  uint64_t v8 = *((void *)v4 + 2);
  if (droppedPinCoordinate)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEOLatLng mergeFrom:](droppedPinCoordinate, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[MSPPlaceBookmark setDroppedPinCoordinate:](self, "setDroppedPinCoordinate:");
  }
  id v4 = v9;
LABEL_17:
  if (*((unsigned char *)v4 + 56))
  {
    self->_droppedPinFloorOrdinal = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }

  MEMORY[0x1F41817F8]();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (GEOMapItemStorage)mapItemStorage
{
  return self->_mapItemStorage;
}

- (void)setMapItemStorage:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (GEOLatLng)droppedPinCoordinate
{
  return self->_droppedPinCoordinate;
}

- (void)setDroppedPinCoordinate:(id)a3
{
}

- (int)droppedPinFloorOrdinal
{
  return self->_droppedPinFloorOrdinal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mapItemStorage, 0);
  objc_storeStrong((id *)&self->_droppedPinCoordinate, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end