@interface GEOLatLngE7
+ (BOOL)isValid:(id)a3;
+ (double)fromE7Coordinate:(int)a3;
+ (int)toE7Coordinate:(double)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)latLng;
- (GEOLatLngE7)initWithDictionary:(id)a3;
- (GEOLatLngE7)initWithE7Latitude:(int)a3 longitude:(int)a4;
- (GEOLatLngE7)initWithJSON:(id)a3;
- (GEOLatLngE7)initWithLatLng:(id)a3;
- (GEOLatLngE7)initWithLatitude:(double)a3 longitude:(double)a4;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)latE7;
- (int)lngE7;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLatE7:(int)a3;
- (void)setLngE7:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLatLngE7

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v4 + 16) = self->_latE7;
  *(_DWORD *)(v4 + 20) = self->_lngE7;
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && (-[GEOLatLngE7 readAll:](self, "readAll:", 1), [v4 readAll:1], self->_latE7 == v4[4])
    && self->_lngE7 == v4[5];

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteSfixed32Field();
  PBDataWriterWriteSfixed32Field();
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (GEOLatLngE7)initWithLatLng:(id)a3
{
  id v4 = a3;
  [v4 lat];
  double v6 = v5;
  [v4 lng];
  double v8 = v7;

  return [(GEOLatLngE7 *)self initWithLatitude:v6 longitude:v8];
}

- (GEOLatLngE7)initWithE7Latitude:(int)a3 longitude:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOLatLngE7;
  double v6 = [(GEOLatLngE7 *)&v10 init];
  double v7 = v6;
  if (v6)
  {
    [(GEOLatLngE7 *)v6 setLatE7:v5];
    [(GEOLatLngE7 *)v7 setLngE7:v4];
    double v8 = v7;
  }

  return v7;
}

- (GEOLatLngE7)initWithLatitude:(double)a3 longitude:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)GEOLatLngE7;
  double v6 = [(GEOLatLngE7 *)&v9 init];
  if (v6)
  {
    [(GEOLatLngE7 *)v6 setLatE7:+[GEOLatLngE7 toE7Coordinate:a3]];
    [(GEOLatLngE7 *)v6 setLngE7:+[GEOLatLngE7 toE7Coordinate:a4]];
    double v7 = v6;
  }

  return v6;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  +[GEOLatLngE7 fromE7Coordinate:[(GEOLatLngE7 *)self latE7]];
  double v4 = v3;
  +[GEOLatLngE7 fromE7Coordinate:[(GEOLatLngE7 *)self lngE7]];
  double v6 = v5;
  double v7 = v4;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

- (GEOLatLng)latLng
{
  double v3 = [GEOLatLng alloc];
  [(GEOLatLngE7 *)self coordinate];
  double v4 = -[GEOLatLng initWithCoordinate:](v3, "initWithCoordinate:");

  return v4;
}

+ (double)fromE7Coordinate:(int)a3
{
  return (double)a3 * 0.0000001;
}

+ (int)toE7Coordinate:(double)a3
{
  return (int)(a3 * 10000000.0);
}

- (int)latE7
{
  return self->_latE7;
}

- (void)setLatE7:(int)a3
{
  self->_latE7 = a3;
}

- (int)lngE7
{
  return self->_lngE7;
}

- (void)setLngE7:(int)a3
{
  self->_lngE7 = a3;
}

- (id)description
{
  double v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLatLngE7;
  double v4 = [(GEOLatLngE7 *)&v8 description];
  double v5 = [(GEOLatLngE7 *)self dictionaryRepresentation];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLatLngE7 _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    double v4 = [MEMORY[0x1E4F1CA60] dictionary];
    double v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
    [v4 setObject:v5 forKey:@"latE7"];

    double v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 20)];
    [v4 setObject:v6 forKey:@"lngE7"];

    double v7 = *(void **)(a1 + 8);
    if (v7)
    {
      objc_super v8 = [v7 dictionaryRepresentation];
      objc_super v9 = v8;
      if (a2)
      {
        objc_super v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __41__GEOLatLngE7__dictionaryRepresentation___block_invoke;
        v14[3] = &unk_1E53D8860;
        id v11 = v10;
        id v15 = v11;
        [v9 enumerateKeysAndObjectsUsingBlock:v14];
        id v12 = v11;

        objc_super v9 = v12;
      }
      [v4 setObject:v9 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLatLngE7 _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOLatLngE7__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    objc_super v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOLatLngE7)initWithDictionary:(id)a3
{
  return (GEOLatLngE7 *)-[GEOLatLngE7 _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      double v4 = [v3 objectForKeyedSubscript:@"latE7"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLatE7:", objc_msgSend(v4, "intValue"));
      }

      id v5 = [v3 objectForKeyedSubscript:@"lngE7"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLngE7:", objc_msgSend(v5, "intValue"));
      }
    }
  }

  return a1;
}

- (GEOLatLngE7)initWithJSON:(id)a3
{
  return (GEOLatLngE7 *)-[GEOLatLngE7 _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLatLngE7IsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLatLngE7ReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  double v4 = a3;
  [(GEOLatLngE7 *)self readAll:0];
  v4[4] = self->_latE7;
  v4[5] = self->_lngE7;
}

- (unint64_t)hash
{
  return (2654435761 * self->_lngE7) ^ (2654435761 * self->_latE7);
}

- (void)mergeFrom:(id)a3
{
  double v4 = (int *)a3;
  [v4 readAll:0];
  self->_latE7 = v4[4];
  int v5 = v4[5];

  self->_lngE7 = v5;
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
    [(GEOLatLngE7 *)self readAll:0];
  }
}

@end