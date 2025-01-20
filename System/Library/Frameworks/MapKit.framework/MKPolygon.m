@interface MKPolygon
+ (BOOL)supportsSecureCoding;
+ (MKPolygon)polygonWithCoordinates:(const CLLocationCoordinate2D *)coords count:(NSUInteger)count;
+ (MKPolygon)polygonWithCoordinates:(const CLLocationCoordinate2D *)coords count:(NSUInteger)count interiorPolygons:(NSArray *)interiorPolygons;
+ (MKPolygon)polygonWithPoints:(const MKMapPoint *)points count:(NSUInteger)count;
+ (MKPolygon)polygonWithPoints:(const MKMapPoint *)points count:(NSUInteger)count interiorPolygons:(NSArray *)interiorPolygons;
+ (id)_polygonWithMapRect:(id)a3;
+ (id)polygonEnclosingMapPoints:(id *)a3 count:(unint64_t)a4;
- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect;
- (BOOL)_determineSelfIntersecting;
- (BOOL)_isDefinitelyConvex;
- (BOOL)_isSimple;
- (BOOL)intersectsMapRect:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (MKPolygon)initWithCoder:(id)a3;
- (NSArray)interiorPolygons;
- (id)_initWithGeoJSONCoordinateArrays:(id)a3 error:(id *)a4;
- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4;
- (id)_initWithPointsNoCopy:(id *)a3 count:(unint64_t)a4 interiorPolygons:(id)a5;
- (void)_calculateBounds;
- (void)_determineSimple;
- (void)encodeWithCoder:(id)a3;
- (void)set_isDefinitelyConvex:(BOOL)a3;
@end

@implementation MKPolygon

- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v11 = @"Polygon object must be a dictionary";
LABEL_8:
      _errorWithReason(v11);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v7 = [v6 objectForKeyedSubscript:@"type"];
  uint64_t v8 = _geoJSONGeometryType((uint64_t)v7);

  if (v8 != 5)
  {
    if (a4)
    {
      v11 = @"Input is not a Polygon GeoJSON object";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v9 = [v6 objectForKeyedSubscript:@"coordinates"];
  self = (MKPolygon *)[(MKPolygon *)self _initWithGeoJSONCoordinateArrays:v9 error:a4];

  v10 = self;
LABEL_10:

  return v10;
}

- (id)_initWithGeoJSONCoordinateArrays:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((unint64_t)[v6 count] < 2)
      {
        v7 = 0;
      }
      else
      {
        v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count") - 1);
      }
      if ((unint64_t)[v6 count] < 2)
      {
LABEL_16:
        v11 = [v6 firstObject];
        VerticesFromGeoJSON = _createVerticesFromGeoJSON(v11, a4);
        if (VerticesFromGeoJSON)
        {
          self = (MKPolygon *)-[MKPolygon _initWithPointsNoCopy:count:interiorPolygons:](self, "_initWithPointsNoCopy:count:interiorPolygons:", VerticesFromGeoJSON, [v11 count], v7);
          v9 = self;
LABEL_19:

          goto LABEL_20;
        }
      }
      else
      {
        uint64_t v10 = 1;
        while (1)
        {
          v11 = [v6 objectAtIndexedSubscript:v10];
          v12 = _createVerticesFromGeoJSON(v11, a4);
          if (!v12) {
            break;
          }
          id v13 = -[MKPolygon _initWithPointsNoCopy:count:interiorPolygons:]([MKPolygon alloc], "_initWithPointsNoCopy:count:interiorPolygons:", v12, [v11 count], 0);
          [v7 addObject:v13];

          if (++v10 >= (unint64_t)[v6 count]) {
            goto LABEL_16;
          }
        }
      }
      v9 = 0;
      goto LABEL_19;
    }
    if (a4)
    {
      uint64_t v8 = @"Polygon geometry coordinates MUST be an array";
      goto LABEL_9;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_20;
  }
  if (!a4) {
    goto LABEL_10;
  }
  uint64_t v8 = @"Polygon geometry is missing value for 'coordinates'";
LABEL_9:
  _errorWithReason(v8);
  v9 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v9;
}

+ (MKPolygon)polygonWithPoints:(const MKMapPoint *)points count:(NSUInteger)count
{
  id v6 = objc_opt_class();

  return (MKPolygon *)[v6 polygonWithPoints:points count:count interiorPolygons:0];
}

+ (MKPolygon)polygonWithPoints:(const MKMapPoint *)points count:(NSUInteger)count interiorPolygons:(NSArray *)interiorPolygons
{
  v7 = interiorPolygons;
  uint64_t v8 = objc_alloc_init((Class)objc_opt_class());
  if (v7)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v7];
    uint64_t v10 = (void *)v8[16];
    v8[16] = v9;
  }
  [v8 _setPoints:points count:count];

  return (MKPolygon *)v8;
}

+ (MKPolygon)polygonWithCoordinates:(const CLLocationCoordinate2D *)coords count:(NSUInteger)count
{
  id v6 = objc_opt_class();

  return (MKPolygon *)[v6 polygonWithCoordinates:coords count:count interiorPolygons:0];
}

+ (MKPolygon)polygonWithCoordinates:(const CLLocationCoordinate2D *)coords count:(NSUInteger)count interiorPolygons:(NSArray *)interiorPolygons
{
  v7 = interiorPolygons;
  uint64_t v8 = objc_alloc_init((Class)objc_opt_class());
  if (v7)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v7];
    uint64_t v10 = (void *)v8[16];
    v8[16] = v9;
  }
  [v8 _setCoordinates:coords count:count];

  return (MKPolygon *)v8;
}

- (id)_initWithPointsNoCopy:(id *)a3 count:(unint64_t)a4 interiorPolygons:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MKPolygon;
  uint64_t v9 = [(MKPolygon *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    interiorPolygons = v9->_interiorPolygons;
    v9->_interiorPolygons = (NSArray *)v10;

    [(MKMultiPoint *)v9 _assignPoints:a3 count:a4];
    v12 = v9;
  }

  return v9;
}

+ (id)polygonEnclosingMapPoints:(id *)a3 count:(unint64_t)a4
{
  Mutable = CFArrayCreateMutable(0, a4, 0);
  if (a4)
  {
    unint64_t v8 = a4;
    do
    {
      CFArrayAppendValue(Mutable, a3++);
      --v8;
    }
    while (v8);
  }
  ValueAtIndex = (double *)CFArrayGetValueAtIndex(Mutable, 0);
  if (CFArrayGetCount(Mutable) >= 1)
  {
    CFIndex v10 = 0;
    do
    {
      v11 = (double *)CFArrayGetValueAtIndex(Mutable, v10);
      if (*v11 < *ValueAtIndex) {
        ValueAtIndex = v11;
      }
      ++v10;
    }
    while (v10 < CFArrayGetCount(Mutable));
  }
  v12 = CFArrayCreateMutable(0, 2, 0);
  id v13 = ValueAtIndex;
  do
  {
    CFArrayAppendValue(v12, v13);
    if (!CFArrayGetCount(Mutable)) {
      break;
    }
    objc_super v14 = (double *)CFArrayGetValueAtIndex(Mutable, 0);
    if (CFArrayGetCount(Mutable) < 1)
    {
      v17 = v14;
    }
    else
    {
      CFIndex v15 = 0;
      do
      {
        v16 = (double *)CFArrayGetValueAtIndex(Mutable, v15);
        v17 = v16;
        double v18 = v13[1];
        double v19 = v14[1];
        BOOL v20 = *v13 == *v14 && v18 == v19;
        if (!v20 && (*v14 - *v13) * (v16[1] - v18) - (*v16 - *v13) * (v19 - v18) <= 0.0) {
          v17 = v14;
        }
        ++v15;
        objc_super v14 = v17;
      }
      while (v15 < CFArrayGetCount(Mutable));
    }
    if (CFArrayGetCount(v12) < 0 || CFArrayGetCount(v12) >= a4) {
      break;
    }
    BOOL v21 = *v17 == *ValueAtIndex && v17[1] == ValueAtIndex[1];
    id v13 = v17;
  }
  while (!v21);
  CFIndex Count = CFArrayGetCount(v12);
  v23 = malloc_type_malloc(16 * Count, 0x1000040451B5BE8uLL);
  v24 = v23;
  if (Count >= 1)
  {
    CFIndex v25 = 0;
    v26 = v23;
    do
      *v26++ = *(_OWORD *)CFArrayGetValueAtIndex(v12, v25++);
    while (Count != v25);
  }
  CFRelease(Mutable);
  CFRelease(v12);
  v27 = [a1 polygonWithPoints:v24 count:Count];
  objc_msgSend(v27, "set_isDefinitelyConvex:", 1);
  free(v24);

  return v27;
}

+ (id)_polygonWithMapRect:(id)a3
{
  v5[8] = *MEMORY[0x1E4F143B8];
  v5[0] = *(void *)&a3.var0.var0;
  v5[1] = *(void *)&a3.var0.var1;
  *(double *)&v5[2] = a3.var0.var0 + a3.var1.var0;
  v5[3] = *(void *)&a3.var0.var1;
  *(double *)&v5[4] = a3.var0.var0 + a3.var1.var0;
  *(double *)&v5[5] = a3.var0.var1 + a3.var1.var1;
  v5[6] = *(void *)&a3.var0.var0;
  *(double *)&v5[7] = a3.var0.var1 + a3.var1.var1;
  v3 = [(id)objc_opt_class() polygonWithPoints:v5 count:4];

  return v3;
}

- (CLLocationCoordinate2D)coordinate
{
  v4.receiver = self;
  v4.super_class = (Class)MKPolygon;
  [(MKMultiPoint *)&v4 coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (BOOL)intersectsMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (![(MKPolygon *)self _isDefinitelyConvex]
    || [(MKMultiPoint *)self pointCount] <= 2)
  {
    v27.receiver = self;
    v27.super_class = (Class)MKPolygon;
    if (!-[MKMultiPoint intersectsMapRect:](&v27, sel_intersectsMapRect_, v6, v5, var0, var1))
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      unint64_t v8 = self->_interiorPolygons;
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v36 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v8);
            }
            if (objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "intersectsMapRect:", v6, v5, var0, var1))
            {

              goto LABEL_25;
            }
          }
          uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v36 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      LOBYTE(v12) = 0;
      return v12;
    }
LABEL_25:
    LOBYTE(v12) = 1;
    return v12;
  }
  v29.x = v6;
  v29.y = v5;
  double v30 = v6 + var0;
  double v31 = v5;
  double v32 = v6 + var0;
  double v33 = v5 + var1;
  double v34 = v6;
  double v35 = v5 + var1;
  id v13 = self;
  if (!MKSeparatingAxisExistsBetweenPolygonsWithPoints([(MKMultiPoint *)v13 points], [(MKMultiPoint *)v13 pointCount], &v29, 4))
  {
    objc_super v14 = v13;
    if (!MKSeparatingAxisExistsBetweenPolygonsWithPoints(&v29, 4uLL, [(MKMultiPoint *)v14 points], [(MKMultiPoint *)v14 pointCount]))goto LABEL_25; {
  }
    }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  CFIndex v15 = v13->_interiorPolygons;
  uint64_t v12 = [(NSArray *)v15 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v12)
  {
    uint64_t v16 = *(void *)v20;
    while (2)
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v15);
        }
        if (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "intersectsMapRect:", v6, v5, var0, var1, (void)v19))
        {
          LOBYTE(v12) = 1;
          goto LABEL_27;
        }
      }
      uint64_t v12 = [(NSArray *)v15 countByEnumeratingWithState:&v19 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_27:

  return v12;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect
{
  v6.receiver = self;
  v6.super_class = (Class)MKPolygon;
  [(MKMultiPoint *)&v6 boundingMapRect];
  result.var1.double var1 = v5;
  result.var1.double var0 = v4;
  result.var0.double var1 = v3;
  result.var0.double var0 = v2;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKPolygon)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MKPolygon;
  double v5 = [(MKMultiPoint *)&v17 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKPolygonCentroidLatitude"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKPolygonCentroidLongitude"];
    [v6 doubleValue];
    CLLocationDegrees v9 = v8;
    [v7 doubleValue];
    v5->_centroid = CLLocationCoordinate2DMake(v9, v10);
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"MKPolygonInteriorPolygons"];
    interiorPolygons = v5->_interiorPolygons;
    v5->_interiorPolygons = (NSArray *)v14;

    v5->_isDefinitelyConvex = [v4 decodeBoolForKey:@"MKPolygonIsDefinitelyConvex"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MKPolygon;
  [(MKMultiPoint *)&v7 encodeWithCoder:v4];
  double v5 = [NSNumber numberWithDouble:self->_centroid.latitude];
  [v4 encodeObject:v5 forKey:@"MKPolygonCentroidLatitude"];

  objc_super v6 = [NSNumber numberWithDouble:self->_centroid.longitude];
  [v4 encodeObject:v6 forKey:@"MKPolygonCentroidLongitude"];

  [v4 encodeObject:self->_interiorPolygons forKey:@"MKPolygonInteriorPolygons"];
  [v4 encodeBool:self->_isDefinitelyConvex forKey:@"MKPolygonIsDefinitelyConvex"];
}

- (void)_calculateBounds
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v2 = self;
  double x = MKMapRectBoundingMapPoints((uint64_t)[(MKMultiPoint *)v2 points], [(MKMultiPoint *)v2 pointCount]);
  double y = v4;
  double width = v6;
  double height = v8;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  CLLocationDegrees v10 = v2->_interiorPolygons;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13), "boundingMapRect", (void)v18);
        v26.origin.double x = v14;
        v26.origin.double y = v15;
        v26.size.double width = v16;
        v26.size.double height = v17;
        v24.origin.double x = x;
        v24.origin.double y = y;
        v24.size.double width = width;
        v24.size.double height = height;
        MKMapRect v25 = MKMapRectUnion(v24, v26);
        double x = v25.origin.x;
        double y = v25.origin.y;
        double width = v25.size.width;
        double height = v25.size.height;
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  -[MKMultiPoint _setBounds:](v2, "_setBounds:", x, y, width, height);
}

- (BOOL)_isSimple
{
  return self->_simple;
}

uint64_t __22__MKPolygon__isSimple__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _determineSimple];
}

- (void)_determineSimple
{
  double v2 = self;
  double v3 = [(MKPolygon *)self interiorPolygons];
  uint64_t v4 = [v3 count];

  if (v4) {
    goto LABEL_6;
  }
  double v2 = v2;
  double v5 = [(MKMultiPoint *)v2 points];
  unint64_t v6 = [(MKMultiPoint *)v2 pointCount];
  unint64_t v7 = v6 - 2;
  if (v6 <= 2) {
    goto LABEL_6;
  }
  double v9 = v5[2];
  double v8 = v5[3];
  double v10 = v8 - v5[1];
  double v11 = v9 - *v5;
  double v12 = 1.0 / sqrt(v11 * v11 + 0.0 + v10 * v10);
  double v13 = v10 * v12;
  double v14 = v11 * v12;
  double v15 = v5 + 5;
  while (1)
  {
    double v16 = v14;
    double v17 = v13;
    double v18 = v9;
    double v19 = v8;
    double v9 = *(v15 - 1);
    double v8 = *v15;
    double v20 = v9 - v18;
    double v21 = *v15 - v19;
    double v22 = 1.0 / sqrt(v20 * v20 + 0.0 + v21 * v21);
    double v14 = v20 * v22;
    double v13 = v21 * v22;
    if (fabs(v14 * v16 + 0.0 + v21 * v22 * v17 + -1.0) >= 2.22044605e-16) {
      break;
    }
    v15 += 2;
    if (!--v7) {
      goto LABEL_6;
    }
  }
  if ([(MKMultiPoint *)v2 _isSelfIntersecting]) {
LABEL_6:
  }
    v2->_simple = 0;
  else {
    v2->_simple = 1;
  }
}

- (BOOL)_determineSelfIntersecting
{
  double v2 = self;
  uint64_t v3 = [(MKMultiPoint *)v2 points];
  unint64_t v4 = [(MKMultiPoint *)v2 pointCount];
  if (v4 < 3) {
    return 0;
  }
  unint64_t v6 = v4;
  __p = 0;
  double v22 = 0;
  uint64_t v23 = 0;
  std::vector<gm::Matrix<double,2,1>>::reserve(&__p, v4);
  uint64_t v7 = 0;
  double v8 = v22;
  do
  {
    if (v8 >= v23)
    {
      double v9 = (char *)__p;
      uint64_t v10 = (v8 - (unsigned char *)__p) >> 4;
      unint64_t v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 60) {
        std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = v23 - (unsigned char *)__p;
      if ((v23 - (unsigned char *)__p) >> 3 > v11) {
        unint64_t v11 = v12 >> 3;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13)
      {
        double v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<gm::Matrix<double,2,1>>>((uint64_t)&v23, v13);
        double v9 = (char *)__p;
        double v8 = v22;
      }
      else
      {
        double v14 = 0;
      }
      double v15 = &v14[16 * v10];
      *(_OWORD *)double v15 = *(_OWORD *)(v3 + 16 * v7);
      double v16 = v15 + 16;
      if (v8 != v9)
      {
        do
        {
          *((_OWORD *)v15 - 1) = *((_OWORD *)v8 - 1);
          v15 -= 16;
          v8 -= 16;
        }
        while (v8 != v9);
        double v9 = (char *)__p;
      }
      __p = v15;
      double v22 = v16;
      uint64_t v23 = &v14[16 * v13];
      if (v9) {
        operator delete(v9);
      }
      double v8 = v16;
    }
    else
    {
      *(_OWORD *)double v8 = *(_OWORD *)(v3 + 16 * v7);
      v8 += 16;
    }
    double v22 = v8;
    ++v7;
  }
  while (v7 != v6);
  double v18 = __p;
  double v19 = v8;
  double v20 = v23;
  __p = 0;
  double v22 = 0;
  uint64_t v23 = 0;
  char isSelf = geo::Intersect::isSelfIntersecting<double>(&v18, 1);
  if (v18)
  {
    double v19 = v18;
    operator delete(v18);
  }
  if (__p)
  {
    double v22 = (char *)__p;
    operator delete(__p);
  }
  return isSelf;
}

- (NSArray)interiorPolygons
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)_isDefinitelyConvex
{
  return self->_isDefinitelyConvex;
}

- (void)set_isDefinitelyConvex:(BOOL)a3
{
  self->_isDefinitelyConvedouble x = a3;
}

- (void).cxx_destruct
{
}

@end