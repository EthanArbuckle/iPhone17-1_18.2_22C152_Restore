@interface GEOLocationShiftRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOLocationShiftRequest)initWithDictionary:(id)a3;
- (GEOLocationShiftRequest)initWithJSON:(id)a3;
- (GEOPixelPoint)pixel;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPixel:(GEOPixelPoint *)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLocationShiftRequest

- (GEOPixelPoint)pixel
{
  *retstr = *(GEOPixelPoint *)&self->_y;
  return self;
}

- (void)setPixel:(GEOPixelPoint *)a3
{
  uint64_t v3 = *(void *)&a3->_z;
  *(_OWORD *)&self->_pixel._x = *(_OWORD *)&a3->_x;
  *(void *)&self->_pixel._z = v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLocationShiftRequest;
  v4 = [(GEOLocationShiftRequest *)&v8 description];
  v5 = [(GEOLocationShiftRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v3 = _GEOPixelPointDictionaryRepresentation((uint64_t)a1 + 8);
    [v2 setObject:v3 forKey:@"pixel"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOLocationShiftRequest)initWithDictionary:(id)a3
{
  return (GEOLocationShiftRequest *)-[GEOLocationShiftRequest _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"pixel"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v8 = 0uLL;
        uint64_t v9 = 0;
        _GEOPixelPointFromDictionaryRepresentation(v4, (uint64_t)&v8);
        long long v6 = v8;
        uint64_t v7 = v9;
        [a1 setPixel:&v6];
      }
    }
  }

  return a1;
}

- (GEOLocationShiftRequest)initWithJSON:(id)a3
{
  return (GEOLocationShiftRequest *)-[GEOLocationShiftRequest _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocationShiftRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocationShiftRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterPlaceMark();
  GEOPixelPointWriteTo((uint64_t)&self->_pixel);
  PBDataWriterRecallMark();
}

- (unsigned)requestTypeCode
{
  return 46;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  v5 = (char *)a3;
  [(GEOLocationShiftRequest *)self readAll:0];
  uint64_t v4 = *(void *)&self->_pixel._z;
  *(_OWORD *)(v5 + 8) = *(_OWORD *)&self->_pixel._x;
  *((void *)v5 + 3) = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = *(void *)&self->_pixel._z;
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_pixel._x;
  *((void *)result + 3) = v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    [(GEOLocationShiftRequest *)self readAll:1];
    [v4 readAll:1];
    BOOL v7 = *(void *)&self->_pixel._x == v4[1]
      && *(void *)&self->_pixel._y == v4[2]
      && *(void *)&self->_pixel._z == v4[3];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEOLocationShiftRequest *)self readAll:1];

  return PBHashBytes();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (char *)a3;
  [v5 readAll:0];
  uint64_t v4 = *((void *)v5 + 3);
  *(_OWORD *)&self->_pixel._x = *(_OWORD *)(v5 + 8);
  *(void *)&self->_pixel._z = v4;
}

@end