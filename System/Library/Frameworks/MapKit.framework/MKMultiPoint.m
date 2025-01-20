@interface MKMultiPoint
- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect;
- (BOOL)_determineSelfIntersecting;
- (BOOL)_isSelfIntersecting;
- (BOOL)intersectsMapRect:(id)a3;
- (CGFloat)locationAtPointIndex:(NSUInteger)index;
- (CLLocationCoordinate2D)coordinate;
- (MKMapPoint)points;
- (MKMultiPoint)initWithCoder:(id)a3;
- (NSArray)locationsAtPointIndexes:(NSIndexSet *)indexes;
- (NSUInteger)pointCount;
- (double)_mapPointsLength;
- (double)elevations;
- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4;
- (void)_assignPoints:(id *)a3 count:(unint64_t)a4;
- (void)_calculateBounds;
- (void)_setBounds:(id)a3;
- (void)_setCoordinates:(const CLLocationCoordinate2D *)a3 count:(unint64_t)a4;
- (void)_setCoordinates:(const CLLocationCoordinate2D *)a3 elevations:(const double *)a4 count:(unint64_t)a5;
- (void)_setPoints:(id *)a3 count:(unint64_t)a4;
- (void)_wrapAroundTheDateline:(const CLLocationCoordinate2D *)a3 elevations:(const double *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getCoordinates:(CLLocationCoordinate2D *)coords range:(NSRange)range;
@end

@implementation MKMultiPoint

- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MKMultiPoint;
  v7 = [(MKMultiPoint *)&v15 init];
  if (!v7) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v13 = @"MultiPoint object must be a dictionary";
LABEL_10:
      _errorWithReason(v13);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_14;
  }
  v8 = [v6 objectForKeyedSubscript:@"type"];
  uint64_t v9 = _geoJSONGeometryType((uint64_t)v8);

  if (v9 != 2)
  {
    if (a4)
    {
      v13 = @"Input is not a MultiPoint GeoJSON object";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v10 = [v6 objectForKeyedSubscript:@"coordinates"];
  VerticesFromGeoJSON = _createVerticesFromGeoJSON(v10, a4);
  if (VerticesFromGeoJSON)
  {
    -[MKMultiPoint _assignPoints:count:](v7, "_assignPoints:count:", VerticesFromGeoJSON, [v10 count]);
    v12 = v7;
  }
  else
  {
    v12 = 0;
  }

LABEL_14:
  return v12;
}

- (void)dealloc
{
  points = self->_points;
  if (points) {
    free(points);
  }
  v4.receiver = self;
  v4.super_class = (Class)MKMultiPoint;
  [(MKMultiPoint *)&v4 dealloc];
}

- (MKMapPoint)points
{
  return (MKMapPoint *)self->_points;
}

- (double)elevations
{
  return self->_elevations;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect
{
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)_setBounds:(id)a3
{
  self->_boundingRect = ($B4107F3CF54D6A10AA3E39D325AB6F2C)a3;
}

- (void)_calculateBounds
{
  self->_boundingRect.origin.double x = MKMapRectBoundingMapPoints((uint64_t)self->_points, self->_pointCount);
  self->_boundingRect.origin.double y = v3;
  self->_boundingRect.size.double width = v4;
  self->_boundingRect.size.double height = v5;
}

- (void)_wrapAroundTheDateline:(const CLLocationCoordinate2D *)a3 elevations:(const double *)a4 count:(unint64_t)a5
{
  if (a5)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    p_double longitude = &a3->longitude;
    double v12 = 0.0;
    do
    {
      double longitude = a3[v9].longitude;
      if (vabdd_f64(longitude, *p_longitude) > 180.0)
      {
        if (longitude < *p_longitude) {
          double v12 = v12 + 268435456.0;
        }
        else {
          double v12 = v12 + -268435456.0;
        }
      }
      double v14 = MKTilePointForCoordinate(a3[v9].latitude, longitude, 21.0);
      objc_super v15 = &self->_points[v9];
      v15->var0 = v12 + v14;
      v15->var1 = v16;
      if (a4)
      {
        elevations = self->_elevations;
        if (elevations) {
          elevations[v10] = a4[v10];
        }
      }
      p_double longitude = &a3[v10++].longitude;
      ++v9;
    }
    while (a5 != v10);
  }
}

- (void)_setCoordinates:(const CLLocationCoordinate2D *)a3 elevations:(const double *)a4 count:(unint64_t)a5
{
  points = self->_points;
  if (points)
  {
    free(points);
    self->_points = 0;
  }
  elevations = self->_elevations;
  if (elevations)
  {
    free(elevations);
    self->_elevations = 0;
  }
  self->_pointCount = a5;
  if (a5)
  {
    self->_points = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16 * a5, 0xDD01F056uLL);
    if (a4) {
      self->_elevations = (double *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
    }
    [(MKMultiPoint *)self _wrapAroundTheDateline:a3 elevations:a4 count:a5];
  }
  else
  {
    self->_points = 0;
    self->_elevations = 0;
  }
  [(MKMultiPoint *)self _calculateBounds];

  [(MKMultiPoint *)self _pointsDidChange];
}

- (void)_setCoordinates:(const CLLocationCoordinate2D *)a3 count:(unint64_t)a4
{
}

- (void)_setPoints:(id *)a3 count:(unint64_t)a4
{
  points = self->_points;
  if (points)
  {
    free(points);
    self->_points = 0;
  }
  if (a4 >> 60)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v8 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16 * a4, 0x9C532C01uLL);
  self->_points = v8;
  memcpy(v8, a3, 16 * a4);
  self->_pointCount = a4;
  [(MKMultiPoint *)self _calculateBounds];

  [(MKMultiPoint *)self _pointsDidChange];
}

- (void)_assignPoints:(id *)a3 count:(unint64_t)a4
{
  self->_points = a3;
  self->_pointCount = a4;
  [(MKMultiPoint *)self _calculateBounds];

  [(MKMultiPoint *)self _pointsDidChange];
}

- (void)getCoordinates:(CLLocationCoordinate2D *)coords range:(NSRange)range
{
  unint64_t pointCount = self->_pointCount;
  unint64_t v5 = pointCount - range.location;
  if (pointCount > range.location)
  {
    NSUInteger length = range.length;
    NSUInteger v8 = 0;
    NSUInteger location = range.location;
    p_double longitude = &coords->longitude;
    do
    {
      if (v8 >= length) {
        break;
      }
      *(CLLocationCoordinate2D *)(p_longitude - 1) = MKCoordinateForMapPoint((MKMapPoint)self->_points[location]);
      ++v8;
      ++location;
      p_longitude += 2;
    }
    while (v5 != v8);
  }
}

- (CLLocationCoordinate2D)coordinate
{
  __asm { FMOV            V2.2D, #0.5 }
  MKMapPoint v7 = (MKMapPoint)vaddq_f64((float64x2_t)self->_boundingRect.origin, vmulq_f64((float64x2_t)self->_boundingRect.size, _Q2));
  double y = v7.y;
  CLLocationCoordinate2D v11 = MKCoordinateForMapPoint(v7);
  double longitude = v11.longitude;
  double latitude = v11.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (BOOL)intersectsMapRect:(id)a3
{
  return MKMapRectIntersectsMapRectWrappingMeridian(self->_boundingRect.origin.x, self->_boundingRect.origin.y, self->_boundingRect.size.width, self->_boundingRect.size.height, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
}

- (MKMultiPoint)initWithCoder:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MKMultiPoint;
  unint64_t v5 = [(MKShape *)&v16 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKMultiPointPointCount"];
    uint64_t v7 = [v6 unsignedIntegerValue];
    unint64_t v15 = 0;
    id v8 = v4;
    uint64_t v9 = [v8 decodeBytesForKey:@"MKMultiPointPoints" returnedLength:&v15];
    if (!v9 || v7 != v15 >> 4)
    {
      CLLocationCoordinate2D v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F1D138];
      v18[0] = @"points bytes were not the expected length";
      double v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1, v15);
      v13 = [v11 errorWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:v12];
      [v8 failWithError:v13];

      uint64_t v10 = 0;
      goto LABEL_7;
    }
    [(MKMultiPoint *)v5 _setPoints:v9 count:v7];
  }
  uint64_t v10 = v5;
LABEL_7:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MKMultiPoint;
  [(MKShape *)&v7 encodeWithCoder:v4];
  unint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_pointCount];
  [v4 encodeObject:v5 forKey:@"MKMultiPointPointCount"];

  unint64_t pointCount = self->_pointCount;
  if (pointCount) {
    [v4 encodeBytes:self->_points length:16 * pointCount forKey:@"MKMultiPointPoints"];
  }
}

- (double)_mapPointsLength
{
  return self->_mapPointsLength;
}

uint64_t __32__MKMultiPoint__mapPointsLength__block_invoke(uint64_t a1)
{
  v2 = (double *)[*(id *)(a1 + 32) points];
  uint64_t result = [*(id *)(a1 + 32) pointCount];
  uint64_t v4 = result - 1;
  if (result == 1)
  {
    double v8 = 0.0;
  }
  else
  {
    double v6 = *v2;
    double v5 = v2[1];
    objc_super v7 = v2 + 3;
    double v8 = 0.0;
    do
    {
      double v9 = *(v7 - 1);
      double v10 = *v7;
      double v8 = v8 + sqrt((*v7 - v5) * (*v7 - v5) + (v9 - v6) * (v9 - v6));
      v7 += 2;
      double v5 = v10;
      double v6 = v9;
      --v4;
    }
    while (v4);
  }
  *(double *)(*(void *)(a1 + 32) + 88) = v8;
  return result;
}

- (BOOL)_isSelfIntersecting
{
  return self->_selfIntersecting;
}

uint64_t __35__MKMultiPoint__isSelfIntersecting__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _determineSelfIntersecting];
  *(unsigned char *)(*(void *)(a1 + 32) + 104) = result;
  return result;
}

- (BOOL)_determineSelfIntersecting
{
  v2 = self;
  uint64_t v3 = [(MKMultiPoint *)v2 points];
  unint64_t v4 = [(MKMultiPoint *)v2 pointCount];
  if (v4 < 3) {
    return 0;
  }
  unint64_t v6 = v4;
  __p = 0;
  v19 = 0;
  v20 = 0;
  std::vector<gm::Matrix<double,2,1>>::reserve(&__p, v4);
  uint64_t v7 = 0;
  double v8 = v19;
  do
  {
    if (v8 >= v20)
    {
      double v10 = (char *)__p;
      uint64_t v11 = (v8 - (unsigned char *)__p) >> 4;
      unint64_t v12 = v11 + 1;
      if ((unint64_t)(v11 + 1) >> 60) {
        std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v13 = v20 - (unsigned char *)__p;
      if ((v20 - (unsigned char *)__p) >> 3 > v12) {
        unint64_t v12 = v13 >> 3;
      }
      if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v12;
      }
      if (v14)
      {
        unint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<gm::Matrix<double,2,1>>>((uint64_t)&v20, v14);
        double v10 = (char *)__p;
        double v8 = v19;
      }
      else
      {
        unint64_t v15 = 0;
      }
      objc_super v16 = &v15[16 * v11];
      *(_OWORD *)objc_super v16 = *(_OWORD *)(v3 + 16 * v7);
      double v9 = v16 + 16;
      if (v8 != v10)
      {
        do
        {
          *((_OWORD *)v16 - 1) = *((_OWORD *)v8 - 1);
          v16 -= 16;
          v8 -= 16;
        }
        while (v8 != v10);
        double v10 = (char *)__p;
      }
      __p = v16;
      v19 = v9;
      v20 = &v15[16 * v14];
      if (v10) {
        operator delete(v10);
      }
    }
    else
    {
      *(_OWORD *)double v8 = *(_OWORD *)(v3 + 16 * v7);
      double v9 = v8 + 16;
    }
    v19 = v9;
    ++v7;
    double v8 = v9;
  }
  while (v7 != v6);
  char isSelf = geo::Intersect::isSelfIntersecting<double>(&__p, 0);
  if (__p)
  {
    v19 = (char *)__p;
    operator delete(__p);
  }
  return isSelf;
}

- (CGFloat)locationAtPointIndex:(NSUInteger)index
{
  NSUInteger pointCount = self->_pointCount;
  if (pointCount <= index)
  {
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:@"Invalid index" userInfo:0];
    objc_exception_throw(v14);
  }
  NSUInteger v6 = pointCount - 1;
  if (v6 >= index) {
    NSUInteger v6 = index;
  }
  if (v6)
  {
    points = self->_points;
    double var0 = points->var0;
    double var1 = points->var1;
    p_double var1 = &points[1].var1;
    double v9 = 0.0;
    do
    {
      double v10 = *(p_var1 - 1);
      double v11 = *p_var1;
      double v9 = v9 + sqrt((*p_var1 - var1) * (*p_var1 - var1) + (v10 - var0) * (v10 - var0));
      p_var1 += 2;
      double var1 = v11;
      double var0 = v10;
      --v6;
    }
    while (v6);
  }
  else
  {
    double v9 = 0.0;
  }
  [(MKMultiPoint *)self _mapPointsLength];
  return v9 / v12;
}

- (NSArray)locationsAtPointIndexes:(NSIndexSet *)indexes
{
  unint64_t v4 = indexes;
  if ([(NSIndexSet *)v4 count] && [(NSIndexSet *)v4 lastIndex] >= self->_pointCount)
  {
    id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:@"Invalid index" userInfo:0];
    objc_exception_throw(v16);
  }
  [(MKMultiPoint *)self _mapPointsLength];
  double v6 = v5;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSIndexSet count](v4, "count"));
  if ([(NSIndexSet *)v4 containsIndex:0]) {
    [v7 addObject:&unk_1ED97EBC8];
  }
  uint64_t v8 = 0;
  double v9 = 0.0;
  for (unint64_t i = 1; ; ++i)
  {
    unint64_t v11 = [(NSIndexSet *)v4 lastIndex];
    unint64_t v12 = self->_pointCount - 1;
    if (v11 < v12) {
      unint64_t v12 = [(NSIndexSet *)v4 lastIndex];
    }
    if (i > v12) {
      break;
    }
    uint64_t v13 = &self->_points[v8];
    double v9 = v9
       + sqrt((v13[1].var1 - v13->var1) * (v13[1].var1 - v13->var1) + (v13[1].var0 - v13->var0)
                                                                    * (v13[1].var0 - v13->var0));
    if ([(NSIndexSet *)v4 containsIndex:i])
    {
      id v14 = [NSNumber numberWithDouble:v9 / v6];
      [v7 addObject:v14];
    }
    ++v8;
  }

  return (NSArray *)v7;
}

- (NSUInteger)pointCount
{
  return self->_pointCount;
}

@end