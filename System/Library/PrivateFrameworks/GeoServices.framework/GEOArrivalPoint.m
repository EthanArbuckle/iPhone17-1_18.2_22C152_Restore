@interface GEOArrivalPoint
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPoint;
- (BOOL)hasRadius;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOArrivalPoint)initWithDictionary:(id)a3;
- (GEOArrivalPoint)initWithJSON:(id)a3;
- (GEOLatLng)point;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)radius;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRadius:(BOOL)a3;
- (void)setPoint:(id)a3;
- (void)setRadius:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOArrivalPoint

- (BOOL)hasPoint
{
  return self->_point != 0;
}

- (GEOLatLng)point
{
  return self->_point;
}

- (void)setPoint:(id)a3
{
}

- (unsigned)radius
{
  return self->_radius;
}

- (void)setRadius:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasRadius
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOArrivalPoint;
  v4 = [(GEOArrivalPoint *)&v8 description];
  v5 = [(GEOArrivalPoint *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOArrivalPoint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 point];
    v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"point"];
    }
    if (*(unsigned char *)(a1 + 28))
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      [v4 setObject:v8 forKey:@"radius"];
    }
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __45__GEOArrivalPoint__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
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
  return -[GEOArrivalPoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOArrivalPoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOArrivalPoint)initWithDictionary:(id)a3
{
  return (GEOArrivalPoint *)-[GEOArrivalPoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"point"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v8 = [(GEOLatLng *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOLatLng *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setPoint:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"radius"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRadius:", objc_msgSend(v10, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOArrivalPoint)initWithJSON:(id)a3
{
  return (GEOArrivalPoint *)-[GEOArrivalPoint _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOArrivalPointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOArrivalPointReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_point)
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
  return [(GEOLatLng *)self->_point hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOArrivalPoint *)self readAll:0];
  if (self->_point) {
    objc_msgSend(v4, "setPoint:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 6) = self->_radius;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOLatLng *)self->_point copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_radius;
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
  [(GEOArrivalPoint *)self readAll:1];
  [v4 readAll:1];
  point = self->_point;
  if ((unint64_t)point | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](point, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_radius == *((_DWORD *)v4 + 6))
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
  [(GEOArrivalPoint *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_point hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_radius;
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
  point = self->_point;
  uint64_t v5 = *((void *)v6 + 2);
  if (point)
  {
    if (v5) {
      -[GEOLatLng mergeFrom:](point, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOArrivalPoint setPoint:](self, "setPoint:");
  }
  if (v6[7])
  {
    self->_radius = v6[6];
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
    [(GEOArrivalPoint *)self readAll:0];
    point = self->_point;
    [(GEOLatLng *)point clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_point, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end