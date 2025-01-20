@interface MSPDirectionsSearch
- (BOOL)hasNavigationInterrupted;
- (BOOL)hasRouteRequestStorage;
- (BOOL)isEqual:(id)a3;
- (BOOL)navigationInterrupted;
- (BOOL)readFrom:(id)a3;
- (GEOStorageRouteRequestStorage)routeRequestStorage;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNavigationInterrupted:(BOOL)a3;
- (void)setNavigationInterrupted:(BOOL)a3;
- (void)setRouteRequestStorage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPDirectionsSearch

- (BOOL)hasRouteRequestStorage
{
  return self->_routeRequestStorage != 0;
}

- (void)setNavigationInterrupted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_navigationInterrupted = a3;
}

- (void)setHasNavigationInterrupted:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNavigationInterrupted
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPDirectionsSearch;
  v4 = [(MSPDirectionsSearch *)&v8 description];
  v5 = [(MSPDirectionsSearch *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_navigationInterrupted];
    [v3 setObject:v6 forKey:@"navigationInterrupted"];
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
  return MSPDirectionsSearchReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_routeRequestStorage)
  {
    id v5 = v4;
    objc_msgSend(v4, "setRouteRequestStorage:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_navigationInterrupted;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(GEOStorageRouteRequestStorage *)self->_routeRequestStorage copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_navigationInterrupted;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  routeRequestStorage = self->_routeRequestStorage;
  if ((unint64_t)routeRequestStorage | *((void *)v4 + 2))
  {
    if (!-[GEOStorageRouteRequestStorage isEqual:](routeRequestStorage, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_navigationInterrupted)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(GEOStorageRouteRequestStorage *)self->_routeRequestStorage hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_navigationInterrupted;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  routeRequestStorage = self->_routeRequestStorage;
  uint64_t v6 = *((void *)v4 + 2);
  if (routeRequestStorage)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[GEOStorageRouteRequestStorage mergeFrom:](routeRequestStorage, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    [(MSPDirectionsSearch *)self setRouteRequestStorage:"setRouteRequestStorage:"];
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 28))
  {
    self->_navigationInterrupted = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
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

- (BOOL)navigationInterrupted
{
  return self->_navigationInterrupted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeRequestStorage, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end