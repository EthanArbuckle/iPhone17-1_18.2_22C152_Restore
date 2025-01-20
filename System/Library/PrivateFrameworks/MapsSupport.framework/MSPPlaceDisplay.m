@interface MSPPlaceDisplay
- (BOOL)hasPlaceMapItemStorage;
- (BOOL)hasSupersededSearchIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapItemStorage)placeMapItemStorage;
- (NSString)supersededSearchIdentifier;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPlaceMapItemStorage:(id)a3;
- (void)setSupersededSearchIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPPlaceDisplay

- (BOOL)hasPlaceMapItemStorage
{
  return self->_placeMapItemStorage != 0;
}

- (BOOL)hasSupersededSearchIdentifier
{
  return self->_supersededSearchIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPPlaceDisplay;
  v4 = [(MSPPlaceDisplay *)&v8 description];
  v5 = [(MSPPlaceDisplay *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  placeMapItemStorage = self->_placeMapItemStorage;
  if (placeMapItemStorage)
  {
    v5 = [(GEOMapItemStorage *)placeMapItemStorage dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"placeMapItemStorage"];
  }
  supersededSearchIdentifier = self->_supersededSearchIdentifier;
  if (supersededSearchIdentifier) {
    [v3 setObject:supersededSearchIdentifier forKey:@"supersededSearchIdentifier"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    objc_super v8 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPPlaceDisplayReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_placeMapItemStorage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_supersededSearchIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_placeMapItemStorage)
  {
    objc_msgSend(v4, "setPlaceMapItemStorage:");
    id v4 = v5;
  }
  if (self->_supersededSearchIdentifier)
  {
    objc_msgSend(v5, "setSupersededSearchIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(GEOMapItemStorage *)self->_placeMapItemStorage copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_supersededSearchIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((placeMapItemStorage = self->_placeMapItemStorage, !((unint64_t)placeMapItemStorage | v4[2]))
     || -[GEOMapItemStorage isEqual:](placeMapItemStorage, "isEqual:")))
  {
    supersededSearchIdentifier = self->_supersededSearchIdentifier;
    if ((unint64_t)supersededSearchIdentifier | v4[3]) {
      char v7 = -[NSString isEqual:](supersededSearchIdentifier, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(GEOMapItemStorage *)self->_placeMapItemStorage hash];
  return [(NSString *)self->_supersededSearchIdentifier hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  placeMapItemStorage = self->_placeMapItemStorage;
  uint64_t v6 = v4[2];
  char v7 = v4;
  if (placeMapItemStorage)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOMapItemStorage mergeFrom:](placeMapItemStorage, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MSPPlaceDisplay setPlaceMapItemStorage:](self, "setPlaceMapItemStorage:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[3]) {
    -[MSPPlaceDisplay setSupersededSearchIdentifier:](self, "setSupersededSearchIdentifier:");
  }

  MEMORY[0x1F41817F8]();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (GEOMapItemStorage)placeMapItemStorage
{
  return self->_placeMapItemStorage;
}

- (void)setPlaceMapItemStorage:(id)a3
{
}

- (NSString)supersededSearchIdentifier
{
  return self->_supersededSearchIdentifier;
}

- (void)setSupersededSearchIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supersededSearchIdentifier, 0);
  objc_storeStrong((id *)&self->_placeMapItemStorage, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end