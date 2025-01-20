@interface GEOPolyLocationShiftRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOLatLng)location;
- (GEOPolyLocationShiftRequest)initWithDictionary:(id)a3;
- (GEOPolyLocationShiftRequest)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPolyLocationShiftRequest

- (GEOLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPolyLocationShiftRequest;
  v4 = [(GEOPolyLocationShiftRequest *)&v8 description];
  v5 = [(GEOPolyLocationShiftRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPolyLocationShiftRequest _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 location];
    v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"location"];
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
  return -[GEOPolyLocationShiftRequest _dictionaryRepresentation:](self, 1);
}

- (GEOPolyLocationShiftRequest)initWithDictionary:(id)a3
{
  return (GEOPolyLocationShiftRequest *)-[GEOPolyLocationShiftRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"location"];
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
        [a1 setLocation:v8];
      }
    }
  }

  return a1;
}

- (GEOPolyLocationShiftRequest)initWithJSON:(id)a3
{
  return (GEOPolyLocationShiftRequest *)-[GEOPolyLocationShiftRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPolyLocationShiftRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPolyLocationShiftRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOLatLng *)self->_location hasGreenTeaWithValue:a3];
}

- (unsigned)requestTypeCode
{
  return 50;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOPolyLocationShiftRequest *)self readAll:0];
  [v4 setLocation:self->_location];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOLatLng *)self->_location copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOPolyLocationShiftRequest *)self readAll:1];
    [v4 readAll:1];
    location = self->_location;
    if ((unint64_t)location | v4[1]) {
      char v5 = -[GEOLatLng isEqual:](location, "isEqual:");
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
  [(GEOPolyLocationShiftRequest *)self readAll:1];
  location = self->_location;

  return [(GEOLatLng *)location hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  location = self->_location;
  uint64_t v6 = v4[1];

  if (location)
  {
    if (v6)
    {
      [(GEOLatLng *)location mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEOPolyLocationShiftRequest *)self setLocation:v6];
  }
}

- (void).cxx_destruct
{
}

@end