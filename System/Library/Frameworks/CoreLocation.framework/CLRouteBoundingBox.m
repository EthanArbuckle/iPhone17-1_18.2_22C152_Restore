@interface CLRouteBoundingBox
+ (BOOL)supportsSecureCoding;
- (CLRouteBoundingBox)initWithCoder:(id)a3;
- (CLRouteBoundingBox)initWithMinLatitude:(double)a3 maxLatitude:(double)a4 minLongitude:(double)a5 maxLongitude:(double)a6 nRows:(int)a7 nColumns:(int)a8;
- (double)maxLatitude;
- (double)maxLongitude;
- (double)minLatitude;
- (double)minLongitude;
- (id)copyWithZone:(_NSZone *)a3;
- (int)nColumns;
- (int)nRows;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLRouteBoundingBox

- (CLRouteBoundingBox)initWithMinLatitude:(double)a3 maxLatitude:(double)a4 minLongitude:(double)a5 maxLongitude:(double)a6 nRows:(int)a7 nColumns:(int)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CLRouteBoundingBox;
  result = [(CLRouteBoundingBox *)&v15 init];
  if (result)
  {
    result->_minLatitude = a3;
    result->_maxLatitude = a4;
    result->_minLongitude = a5;
    result->_maxLongitude = a6;
    result->_nRows = a7;
    result->_nColumns = a8;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CLRouteBoundingBox alloc];
  double minLatitude = self->_minLatitude;
  double maxLatitude = self->_maxLatitude;
  double minLongitude = self->_minLongitude;
  double maxLongitude = self->_maxLongitude;
  uint64_t nRows = self->_nRows;
  uint64_t nColumns = self->_nColumns;

  return [(CLRouteBoundingBox *)v4 initWithMinLatitude:nRows maxLatitude:nColumns minLongitude:minLatitude maxLongitude:maxLatitude nRows:minLongitude nColumns:maxLongitude];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [(CLRouteBoundingBox *)self minLatitude];
  objc_msgSend(a3, "encodeDouble:forKey:", @"minLatitude");
  [(CLRouteBoundingBox *)self maxLatitude];
  objc_msgSend(a3, "encodeDouble:forKey:", @"maxLatitude");
  [(CLRouteBoundingBox *)self minLongitude];
  objc_msgSend(a3, "encodeDouble:forKey:", @"minLongitude");
  [(CLRouteBoundingBox *)self maxLongitude];
  objc_msgSend(a3, "encodeDouble:forKey:", @"maxLongitude");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLRouteBoundingBox nRows](self, "nRows"), @"nRows");
  uint64_t v5 = [(CLRouteBoundingBox *)self nColumns];

  [a3 encodeInt:v5 forKey:@"nColumns"];
}

- (CLRouteBoundingBox)initWithCoder:(id)a3
{
  v4 = [CLRouteBoundingBox alloc];
  [a3 decodeDoubleForKey:@"minLatitude"];
  double v6 = v5;
  [a3 decodeDoubleForKey:@"maxLatitude"];
  double v8 = v7;
  [a3 decodeDoubleForKey:@"minLongitude"];
  double v10 = v9;
  [a3 decodeDoubleForKey:@"maxLongitude"];
  double v12 = v11;
  uint64_t v13 = [a3 decodeIntForKey:@"nRows"];
  uint64_t v14 = [a3 decodeIntForKey:@"nColumns"];

  return [(CLRouteBoundingBox *)v4 initWithMinLatitude:v13 maxLatitude:v14 minLongitude:v6 maxLongitude:v8 nRows:v10 nColumns:v12];
}

- (double)minLatitude
{
  return self->_minLatitude;
}

- (double)maxLatitude
{
  return self->_maxLatitude;
}

- (double)minLongitude
{
  return self->_minLongitude;
}

- (double)maxLongitude
{
  return self->_maxLongitude;
}

- (int)nRows
{
  return self->_nRows;
}

- (int)nColumns
{
  return self->_nColumns;
}

@end