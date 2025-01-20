@interface MKPolyline
+ (BOOL)supportsSecureCoding;
+ (MKPolyline)polylineWithCoordinates:(const CLLocationCoordinate2D *)a3 elevations:(const double *)a4 count:(unint64_t)a5 elevationCorrection:(BOOL)a6;
+ (MKPolyline)polylineWithCoordinates:(const CLLocationCoordinate2D *)coords count:(NSUInteger)count;
+ (MKPolyline)polylineWithPoints:(const MKMapPoint *)points count:(NSUInteger)count;
- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect;
- (BOOL)_requiresModernMap;
- (BOOL)intersectsMapRect:(id)a3;
- (BOOL)needsElevationCorrection;
- (CLLocationCoordinate2D)coordinate;
- (MKPolyline)initWithCoder:(id)a3;
- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4;
- (id)_initWithGeoJSONPoints:(id)a3 error:(id *)a4;
- (void)_calculateBounds;
- (void)encodeWithCoder:(id)a3;
- (void)setNeedsElevationCorrection:(BOOL)a3;
@end

@implementation MKPolyline

- (id)_initWithGeoJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v11 = @"LineString object must be a dictionary";
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

  if (v8 != 3)
  {
    if (a4)
    {
      v11 = @"Input is not a LineString GeoJSON object";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v9 = [v6 objectForKeyedSubscript:@"coordinates"];
  self = (MKPolyline *)[(MKPolyline *)self _initWithGeoJSONPoints:v9 error:a4];

  v10 = self;
LABEL_10:

  return v10;
}

- (id)_initWithGeoJSONPoints:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKPolyline;
  v7 = [(MKPolyline *)&v10 init];
  if (v7)
  {
    VerticesFromGeoJSON = _createVerticesFromGeoJSON(v6, a4);
    if (VerticesFromGeoJSON)
    {
      -[MKMultiPoint _assignPoints:count:](v7, "_assignPoints:count:", VerticesFromGeoJSON, [v6 count]);
      VerticesFromGeoJSON = v7;
    }
  }
  else
  {
    VerticesFromGeoJSON = 0;
  }

  return VerticesFromGeoJSON;
}

+ (MKPolyline)polylineWithPoints:(const MKMapPoint *)points count:(NSUInteger)count
{
  id v6 = objc_alloc_init((Class)objc_opt_class());
  [v6 _setPoints:points count:count];

  return (MKPolyline *)v6;
}

+ (MKPolyline)polylineWithCoordinates:(const CLLocationCoordinate2D *)coords count:(NSUInteger)count
{
  id v6 = objc_opt_class();

  return (MKPolyline *)[v6 polylineWithCoordinates:coords elevations:0 count:count elevationCorrection:0];
}

+ (MKPolyline)polylineWithCoordinates:(const CLLocationCoordinate2D *)a3 elevations:(const double *)a4 count:(unint64_t)a5 elevationCorrection:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  [v10 _setCoordinates:a3 elevations:a4 count:a5];
  [v10 setNeedsElevationCorrection:v6];

  return (MKPolyline *)v10;
}

- (void)_calculateBounds
{
  v3 = (void *)MEMORY[0x18C139870](self, a2);
  v4 = self;
  uint64_t v5 = [(MKMultiPoint *)v4 points];
  uint64_t v6 = [(MKMultiPoint *)v4 pointCount];
  if (v6)
  {
    double v7 = MKMapRectBoundingMapPoints(v5, v6);
  }
  else
  {
    double v9 = 0.0;
    double v8 = INFINITY;
    double v7 = INFINITY;
    double v10 = 0.0;
  }
  -[MKMultiPoint _setBounds:](v4, "_setBounds:", v7, v8, v9, v10);
}

- (CLLocationCoordinate2D)coordinate
{
  v4.receiver = self;
  v4.super_class = (Class)MKPolyline;
  [(MKMultiPoint *)&v4 coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (BOOL)intersectsMapRect:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKPolyline;
  return -[MKMultiPoint intersectsMapRect:](&v4, sel_intersectsMapRect_, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
}

- ($FD2884BA735A6398BD92EEF91FE53E55)boundingMapRect
{
  v6.receiver = self;
  v6.super_class = (Class)MKPolyline;
  [(MKMultiPoint *)&v6 boundingMapRect];
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (BOOL)_requiresModernMap
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKPolyline)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKPolyline;
  return [(MKMultiPoint *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MKPolyline;
  [(MKMultiPoint *)&v3 encodeWithCoder:a3];
}

- (BOOL)needsElevationCorrection
{
  return *(&self->super._selfIntersecting + 1);
}

- (void)setNeedsElevationCorrection:(BOOL)a3
{
  *(&self->super._selfIntersecting + 1) = a3;
}

@end