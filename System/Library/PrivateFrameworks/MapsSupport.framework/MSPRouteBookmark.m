@interface MSPRouteBookmark
- (BOOL)hasRouteRequestStorage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOStorageRouteRequestStorage)routeRequestStorage;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRouteRequestStorage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPRouteBookmark

- (BOOL)hasRouteRequestStorage
{
  return self->_routeRequestStorage != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPRouteBookmark;
  v4 = [(MSPRouteBookmark *)&v8 description];
  v5 = [(MSPRouteBookmark *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  routeRequestStorage = self->_routeRequestStorage;
  if (routeRequestStorage)
  {
    v5 = [(GEOStorageRouteRequestStorage *)routeRequestStorage dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"routeRequestStorage"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v7 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPRouteBookmarkReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_routeRequestStorage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  routeRequestStorage = self->_routeRequestStorage;
  if (routeRequestStorage) {
    [a3 setRouteRequestStorage:routeRequestStorage];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(GEOStorageRouteRequestStorage *)self->_routeRequestStorage copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    routeRequestStorage = self->_routeRequestStorage;
    if ((unint64_t)routeRequestStorage | v4[2]) {
      char v6 = -[GEOStorageRouteRequestStorage isEqual:](routeRequestStorage, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(GEOStorageRouteRequestStorage *)self->_routeRequestStorage hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  routeRequestStorage = self->_routeRequestStorage;
  uint64_t v6 = v4[2];
  if (routeRequestStorage)
  {
    if (v6) {
      -[GEOStorageRouteRequestStorage mergeFrom:](routeRequestStorage, "mergeFrom:");
    }
  }
  else if (v6)
  {
    [(MSPRouteBookmark *)self setRouteRequestStorage:"setRouteRequestStorage:"];
  }

  MEMORY[0x1F41817F8]();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  return self->_routeRequestStorage;
}

- (void)setRouteRequestStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeRequestStorage, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end