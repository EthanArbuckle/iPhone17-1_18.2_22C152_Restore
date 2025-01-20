@interface GEOComposedRouteTrafficColorInfo
+ (BOOL)supportsSecureCoding;
- ($212C09783140BCCD23384160D545CE0D)routeCoordinate;
- (GEOComposedRouteTrafficColorInfo)initWithCoder:(id)a3;
- (double)offsetMeters;
- (id)_stringForColor:(unint64_t)a3;
- (id)description;
- (unint64_t)color;
- (void)encodeWithCoder:(id)a3;
- (void)setColor:(unint64_t)a3;
- (void)setOffsetMeters:(double)a3;
- (void)setRouteCoordinate:(id)a3;
@end

@implementation GEOComposedRouteTrafficColorInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteTrafficColorInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOComposedRouteTrafficColorInfo;
  v5 = [(GEOComposedRouteTrafficColorInfo *)&v11 init];
  if (v5)
  {
    v5->_color = [v4 decodeIntegerForKey:@"_color"];
    [v4 decodeDoubleForKey:@"_offsetMeters"];
    v5->_offsetMeters = v6;
    unint64_t v10 = 0;
    v7 = (const void *)[v4 decodeBytesForKey:@"_routeCoordinate" returnedLength:&v10];
    if (v10)
    {
      if (v7)
      {
        if (v10 >= 8) {
          size_t v8 = 8;
        }
        else {
          size_t v8 = v10;
        }
        memcpy(&v5->_routeCoordinate, v7, v8);
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t color = self->_color;
  id v5 = a3;
  [v5 encodeInteger:color forKey:@"_color"];
  [v5 encodeDouble:@"_offsetMeters" forKey:self->_offsetMeters];
  [v5 encodeBytes:&self->_routeCoordinate length:8 forKey:@"_routeCoordinate"];
}

- (id)description
{
  v2 = NSString;
  uint64_t v3 = (int)(float)(self->_routeCoordinate.offset * 100.0);
  double offsetMeters = self->_offsetMeters;
  uint64_t index = self->_routeCoordinate.index;
  double v6 = [(GEOComposedRouteTrafficColorInfo *)self _stringForColor:self->_color];
  v7 = [v2 stringWithFormat:@"[%u.%d | %gm] %@", index, v3, *(void *)&offsetMeters, v6];

  return v7;
}

- (id)_stringForColor:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Black";
  }
  else {
    return off_1E53E9940[a3 - 1];
  }
}

- (unint64_t)color
{
  return self->_color;
}

- (void)setColor:(unint64_t)a3
{
  self->_unint64_t color = a3;
}

- (double)offsetMeters
{
  return self->_offsetMeters;
}

- (void)setOffsetMeters:(double)a3
{
  self->_double offsetMeters = a3;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_routeCoordinate;
}

- (void)setRouteCoordinate:(id)a3
{
  self->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a3;
}

@end