@interface MKRouteStepPolyline
- (BOOL)_requiresModernMap;
- (CLLocationCoordinate2D)coordinate;
- (id)_initWithRoute:(id)a3 range:(_NSRange)a4;
- (void)dealloc;
@end

@implementation MKRouteStepPolyline

- (id)_initWithRoute:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKRouteStepPolyline;
  id v9 = [(MKRouteStepPolyline *)&v12 init];
  if (!v9) {
    goto LABEL_5;
  }
  if (location + length <= [v8 pointCount])
  {
    objc_storeStrong((id *)v9 + 14, a3);
    objc_msgSend(v9, "_assignPoints:count:", objc_msgSend(*((id *)v9 + 14), "points") + 16 * location, length);
LABEL_5:
    id v10 = v9;
    goto LABEL_6;
  }
  id v10 = 0;
LABEL_6:

  return v10;
}

- (void)dealloc
{
  [(MKMultiPoint *)self _assignPoints:0 count:0];
  v3.receiver = self;
  v3.super_class = (Class)MKRouteStepPolyline;
  [(MKMultiPoint *)&v3 dealloc];
}

- (CLLocationCoordinate2D)coordinate
{
  if ([(MKMultiPoint *)self pointCount])
  {
    objc_super v3 = self;
    CLLocationCoordinate2D v6 = MKCoordinateForMapPoint(*([(MKMultiPoint *)v3 points]
                                 + 16 * [(MKMultiPoint *)v3 pointCount]
                                 - 16));
    double longitude = v6.longitude;
    double latitude = v6.latitude;
  }
  else
  {
    double latitude = *MEMORY[0x1E4F1E750];
    double longitude = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (BOOL)_requiresModernMap
{
  return [*(id *)&self->super._needsElevationCorrection _requiresModernMap];
}

- (void).cxx_destruct
{
}

@end