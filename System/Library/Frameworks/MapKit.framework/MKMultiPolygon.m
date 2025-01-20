@interface MKMultiPolygon
+ (BOOL)supportsSecureCoding;
- ($FD2884BA735A6398BD92EEF91FE53E55)_boundingMapRectForPolygons:(id)a3;
- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect;
- (CLLocationCoordinate2D)coordinate;
- (MKMultiPolygon)init;
- (MKMultiPolygon)initWithCoder:(id)a3;
- (MKMultiPolygon)initWithPolygons:(NSArray *)polygons;
- (NSArray)polygons;
- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MKMultiPolygon

- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v19 = @"MultiPolygon object must be a dictionary";
LABEL_17:
      _errorWithReason(v19);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
LABEL_18:
    v18 = 0;
    goto LABEL_25;
  }
  v7 = [v6 objectForKeyedSubscript:@"type"];
  uint64_t v8 = _geoJSONGeometryType((uint64_t)v7);

  if (v8 != 6)
  {
    if (a4)
    {
      v19 = @"Input is not a MultiPolygon object";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v9 = [v6 objectForKeyedSubscript:@"coordinates"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v21 = v9;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [[MKPolygon alloc] _initWithGeoJSONCoordinateArrays:*(void *)(*((void *)&v22 + 1) + 8 * v15) error:a4];
          if (!v16)
          {

            v18 = 0;
            goto LABEL_22;
          }
          v17 = v16;
          [v10 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    self = [(MKMultiPolygon *)self initWithPolygons:v10];
    v18 = self;
LABEL_22:

    v9 = v21;
  }
  else if (a4)
  {
    _errorWithReason(@"MultiPolygon coordinates must be an array");
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

LABEL_25:
  return v18;
}

- (MKMultiPolygon)initWithPolygons:(NSArray *)polygons
{
  v4 = polygons;
  v14.receiver = self;
  v14.super_class = (Class)MKMultiPolygon;
  v5 = [(MKMultiPolygon *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [(NSArray *)v4 copy];
    v7 = v5->_polygons;
    v5->_polygons = (NSArray *)v6;

    [(MKMultiPolygon *)v5 _boundingMapRectForPolygons:v4];
    v5->_boundingMapRect.origin.x = v8;
    v5->_boundingMapRect.origin.y = v9;
    v5->_boundingMapRect.size.width = v10;
    v5->_boundingMapRect.size.height = v11;
    uint64_t v12 = v5;
  }

  return v5;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_boundingMapRectForPolygons:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    double height = 0.0;
    double y = INFINITY;
    double width = 0.0;
    double x = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) boundingMapRect];
        v29.origin.double x = v12;
        v29.origin.double y = v13;
        v29.size.double width = v14;
        v29.size.double height = v15;
        v26.origin.double x = x;
        v26.origin.double y = y;
        v26.size.double width = width;
        v26.size.double height = height;
        MKMapRect v27 = MKMapRectUnion(v26, v29);
        double x = v27.origin.x;
        double y = v27.origin.y;
        double width = v27.size.width;
        double height = v27.size.height;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    double height = 0.0;
    double y = INFINITY;
    double width = 0.0;
    double x = INFINITY;
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.var1.var1 = v19;
  result.var1.var0 = v18;
  result.var0.var1 = v17;
  result.var0.var0 = v16;
  return result;
}

- (MKMultiPolygon)init
{
  return [(MKMultiPolygon *)self initWithPolygons:MEMORY[0x1E4F1CBF0]];
}

- (CLLocationCoordinate2D)coordinate
{
  __asm { FMOV            V2.2D, #0.5 }
  MKMapPoint v7 = (MKMapPoint)vaddq_f64((float64x2_t)self->_boundingMapRect.origin, vmulq_f64((float64x2_t)self->_boundingMapRect.size, _Q2));
  double y = v7.y;
  CLLocationCoordinate2D v11 = MKCoordinateForMapPoint(v7);
  double longitude = v11.longitude;
  double latitude = v11.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMultiPolygon)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MKMultiPolygon;
  uint64_t v5 = [(MKShape *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    double v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MKMultiPolygonPolygons"];
    polygons = v5->_polygons;
    v5->_polygons = (NSArray *)v9;

    [(MKMultiPolygon *)v5 _boundingMapRectForPolygons:v5->_polygons];
    v5->_boundingMapRect.origin.double x = v11;
    v5->_boundingMapRect.origin.double y = v12;
    v5->_boundingMapRect.size.double width = v13;
    v5->_boundingMapRect.size.double height = v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKMultiPolygon;
  id v4 = a3;
  [(MKShape *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_polygons, @"MKMultiPolygonPolygons", v5.receiver, v5.super_class);
}

- (NSArray)polygons
{
  return self->_polygons;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect
{
  double x = self->_boundingMapRect.origin.x;
  double y = self->_boundingMapRect.origin.y;
  double width = self->_boundingMapRect.size.width;
  double height = self->_boundingMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void).cxx_destruct
{
}

@end