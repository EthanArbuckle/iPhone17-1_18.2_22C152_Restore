@interface GEOPDHikeGeometry
+ (BOOL)isValid:(id)a3;
+ (GEOPDHikeGeometry)hikeGeometryWithPlaceData:(id)a3;
- (BOOL)hasRoutingPathLeg;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDHikeGeometry)initWithDictionary:(id)a3;
- (GEOPDHikeGeometry)initWithJSON:(id)a3;
- (NSData)routingPathLeg;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRoutingPathLeg:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDHikeGeometry

+ (GEOPDHikeGeometry)hikeGeometryWithPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__GEOPDHikeGeometry_PlaceDataExtras__hikeGeometryWithPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:106 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOPDHikeGeometry *)v4;
}

void __64__GEOPDHikeGeometry_PlaceDataExtras__hikeGeometryWithPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  v5 = -[GEOPDComponentValue hikeGeometry](a2);
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5);
    v5 = v6;
    *a3 = 1;
  }
}

- (BOOL)hasRoutingPathLeg
{
  return self->_routingPathLeg != 0;
}

- (NSData)routingPathLeg
{
  return self->_routingPathLeg;
}

- (void)setRoutingPathLeg:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDHikeGeometry;
  id v4 = [(GEOPDHikeGeometry *)&v8 description];
  v5 = [(GEOPDHikeGeometry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDHikeGeometry _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 routingPathLeg];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        uint64_t v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"routingPathLeg"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"routing_path_leg"];
      }
    }

    objc_super v8 = (void *)a1[1];
    if (v8)
    {
      uint64_t v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __47__GEOPDHikeGeometry__dictionaryRepresentation___block_invoke;
        v15[3] = &unk_1E53D8860;
        id v12 = v11;
        id v16 = v12;
        [v10 enumerateKeysAndObjectsUsingBlock:v15];
        id v13 = v12;

        v10 = v13;
      }
      [v4 setObject:v10 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDHikeGeometry _dictionaryRepresentation:](self, 1);
}

void __47__GEOPDHikeGeometry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDHikeGeometry)initWithDictionary:(id)a3
{
  return (GEOPDHikeGeometry *)-[GEOPDHikeGeometry _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"routingPathLeg";
      }
      else {
        v6 = @"routing_path_leg";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
        [a1 setRoutingPathLeg:v8];
      }
    }
  }

  return a1;
}

- (GEOPDHikeGeometry)initWithJSON:(id)a3
{
  return (GEOPDHikeGeometry *)-[GEOPDHikeGeometry _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDHikeGeometryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDHikeGeometryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_routingPathLeg)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOPDHikeGeometry *)self readAll:0];
  if (self->_routingPathLeg) {
    objc_msgSend(v4, "setRoutingPathLeg:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_routingPathLeg copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOPDHikeGeometry *)self readAll:1];
    [v4 readAll:1];
    routingPathLeg = self->_routingPathLeg;
    if ((unint64_t)routingPathLeg | v4[2]) {
      char v5 = -[NSData isEqual:](routingPathLeg, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEOPDHikeGeometry *)self readAll:1];
  routingPathLeg = self->_routingPathLeg;

  return [(NSData *)routingPathLeg hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = v4[2];

  if (v5)
  {
    [(GEOPDHikeGeometry *)self setRoutingPathLeg:v5];
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
    [(GEOPDHikeGeometry *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingPathLeg, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end