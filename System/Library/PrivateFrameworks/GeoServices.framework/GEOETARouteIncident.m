@interface GEOETARouteIncident
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDistanceFromStartCm;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasRouteIncident;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOETARouteIncident)initWithDictionary:(id)a3;
- (GEOETARouteIncident)initWithJSON:(id)a3;
- (GEORouteIncident)routeIncident;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)distanceFromStartCm;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDistanceFromStartCm:(unsigned int)a3;
- (void)setHasDistanceFromStartCm:(BOOL)a3;
- (void)setRouteIncident:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOETARouteIncident

- (BOOL)hasRouteIncident
{
  return self->_routeIncident != 0;
}

- (GEORouteIncident)routeIncident
{
  return self->_routeIncident;
}

- (void)setRouteIncident:(id)a3
{
}

- (unsigned)distanceFromStartCm
{
  return self->_distanceFromStartCm;
}

- (void)setDistanceFromStartCm:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_distanceFromStartCm = a3;
}

- (void)setHasDistanceFromStartCm:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDistanceFromStartCm
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOETARouteIncident;
  v4 = [(GEOETARouteIncident *)&v8 description];
  v5 = [(GEOETARouteIncident *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETARouteIncident _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 routeIncident];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"routeIncident";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"route_incident";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(unsigned char *)(a1 + 28))
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v10 = @"distanceFromStartCm";
      }
      else {
        v10 = @"distance_from_start_cm";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __49__GEOETARouteIncident__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOETARouteIncident _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOETARouteIncident__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOETARouteIncident)initWithDictionary:(id)a3
{
  return (GEOETARouteIncident *)-[GEOETARouteIncident _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"routeIncident";
      }
      else {
        v6 = @"route_incident";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORouteIncident alloc];
        if (a3) {
          uint64_t v9 = [(GEORouteIncident *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEORouteIncident *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setRouteIncident:v9];
      }
      if (a3) {
        v11 = @"distanceFromStartCm";
      }
      else {
        v11 = @"distance_from_start_cm";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDistanceFromStartCm:", objc_msgSend(v12, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOETARouteIncident)initWithJSON:(id)a3
{
  return (GEOETARouteIncident *)-[GEOETARouteIncident _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETARouteIncidentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETARouteIncidentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_routeIncident)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEORouteIncident *)self->_routeIncident hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOETARouteIncident *)self readAll:0];
  if (self->_routeIncident) {
    objc_msgSend(v4, "setRouteIncident:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 6) = self->_distanceFromStartCm;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEORouteIncident *)self->_routeIncident copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_distanceFromStartCm;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOETARouteIncident *)self readAll:1];
  [v4 readAll:1];
  routeIncident = self->_routeIncident;
  if ((unint64_t)routeIncident | *((void *)v4 + 2))
  {
    if (!-[GEORouteIncident isEqual:](routeIncident, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_distanceFromStartCm == *((_DWORD *)v4 + 6))
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
  [(GEOETARouteIncident *)self readAll:1];
  unint64_t v3 = [(GEORouteIncident *)self->_routeIncident hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_distanceFromStartCm;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v6 = (unsigned int *)a3;
  [v6 readAll:0];
  routeIncident = self->_routeIncident;
  uint64_t v5 = *((void *)v6 + 2);
  if (routeIncident)
  {
    if (v5) {
      -[GEORouteIncident mergeFrom:](routeIncident, "mergeFrom:");
    }
  }
  else if (v5)
  {
    [(GEOETARouteIncident *)self setRouteIncident:"setRouteIncident:"];
  }
  if (v6[7])
  {
    self->_distanceFromStartCm = v6[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOETARouteIncident *)self readAll:0];
    routeIncident = self->_routeIncident;
    [(GEORouteIncident *)routeIncident clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeIncident, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end