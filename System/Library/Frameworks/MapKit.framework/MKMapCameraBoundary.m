@interface MKMapCameraBoundary
+ (BOOL)supportsSecureCoding;
- ($DC1C8D958DDC8D67D0023B74A9319680)_clampedCoordinateRegionForCoordinateRegion:(SEL)a3;
- ($FD2884BA735A6398BD92EEF91FE53E55)_clampedMapRectForMapRect:(id)result;
- (BOOL)_containsCoordinate:(CLLocationCoordinate2D)a3;
- (BOOL)_isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMapCameraBoundary:(id)a3;
- (BOOL)isValidCoordinateRegion:(id *)a3;
- (BOOL)isValidMapRect:(id)a3;
- (CLLocationCoordinate2D)_clampedCoordinateForCoordinate:(CLLocationCoordinate2D)a3;
- (MKCoordinateRegion)region;
- (MKMapCameraBoundary)init;
- (MKMapCameraBoundary)initWithCoder:(NSCoder *)coder;
- (MKMapCameraBoundary)initWithCoordinateRegion:(MKCoordinateRegion)region;
- (MKMapCameraBoundary)initWithMapRect:(MKMapRect)mapRect;
- (MKMapRect)mapRect;
- (id)_vkRegionRestriction;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MKMapCameraBoundary

- (MKMapCameraBoundary)initWithMapRect:(MKMapRect)mapRect
{
  double height = mapRect.size.height;
  double width = mapRect.size.width;
  double y = mapRect.origin.y;
  double x = mapRect.origin.x;
  v30.receiver = self;
  v30.super_class = (Class)MKMapCameraBoundary;
  v7 = [(MKMapCameraBoundary *)&v30 init];
  v8 = v7;
  if (!v7)
  {
LABEL_19:
    v27 = v8;
    goto LABEL_20;
  }
  if (-[MKMapCameraBoundary isValidMapRect:](v7, "isValidMapRect:", x, y, width, height))
  {
    -[MKMapCameraBoundary _clampedMapRectForMapRect:](v8, "_clampedMapRectForMapRect:", x, y, width, height);
    double v13 = v9;
    double v14 = v10;
    double v15 = v11;
    double v16 = v12;
    v8->_mapRect.origin.double x = v9;
    v8->_mapRect.origin.double y = v10;
    v8->_mapRect.size.double width = v11;
    v8->_mapRect.size.double height = v12;
    if (v9 == 0.0
      && (v10 == 0.0 ? (BOOL v17 = v11 == 268435456.0) : (BOOL v17 = 0), v17 ? (v18 = v12 == 268435456.0) : (v18 = 0), v18))
    {
      v8->_region.center = (CLLocationCoordinate2D)MKCoordinateRegionWorld;
      v8->_region.span = ($2AEA816EAF9616B0E64737FB4BB06332)unk_18BD1C2B8;
      uint64_t v28 = [objc_alloc(MEMORY[0x1E4FB39E8]) initWithMapRegion:0];
      vkRestriction = v8->_vkRestriction;
      v8->_vkRestriction = (VKCameraRegionRestriction *)v28;
    }
    else
    {
      v8->_region = ($787999B08D62D8BBAAF19AF74A688926)MKCoordinateRegionForMapRect(*(MKMapRect *)&v9);
      if (v15 == 0.0) {
        double v15 = 0.00000001;
      }
      if (v16 == 0.0) {
        double v16 = 0.00000001;
      }
      id v19 = objc_alloc(MEMORY[0x1E4FB39E8]);
      vkRestriction = (VKCameraRegionRestriction *)objc_msgSend(objc_alloc(MEMORY[0x1E4F64700]), "initWithMapRect:", v13, v14, v15, v16);
      uint64_t v21 = [v19 initWithMapRegion:vkRestriction];
      v22 = v8->_vkRestriction;
      v8->_vkRestriction = (VKCameraRegionRestriction *)v21;
    }
    goto LABEL_19;
  }
  v23 = NSString;
  v24 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&x, *(void *)&y];
  v25 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&width, *(void *)&height];
  v26 = [v23 stringWithFormat:@"{%@, %@}", v24, v25];

  NSLog(&cfstr_InvalidMkmapre.isa, v26);
  v27 = 0;
LABEL_20:

  return v27;
}

- (BOOL)isValidMapRect:(id)a3
{
  BOOL v3 = a3.var0.var0 == INFINITY && a3.var0.var1 == INFINITY;
  BOOL result = 1;
  if (v3 && a3.var1.var1 == 0.0 && a3.var1.var0 == 0.0) {
    return 0;
  }
  return result;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_clampedMapRectForMapRect:(id)result
{
  double v3 = result.var0.var1 + result.var1.var1;
  if (result.var0.var1 + result.var1.var1 > 268435456.0) {
    result.var1.var1 = 268435456.0 - result.var0.var1;
  }
  if (result.var0.var1 < 0.0)
  {
    result.var1.var1 = v3;
    result.var0.var1 = 0.0;
  }
  if (result.var1.var1 < 0.0) {
    result.var1.var1 = 0.0;
  }
  double v4 = fmin(result.var1.var1, 268435456.0);
  if (result.var1.var0 < 0.0) {
    result.var1.var0 = 0.0;
  }
  double v5 = fmin(result.var1.var0, 268435456.0);
  if (v5 == 268435456.0) {
    result.var0.var0 = 0.0;
  }
  result.var1.var1 = v4;
  result.var1.var0 = v5;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMapCameraBoundary)init
{
  return -[MKMapCameraBoundary initWithMapRect:](self, "initWithMapRect:", 0.0, 0.0, 268435456.0, 268435456.0);
}

- (MKMapCameraBoundary)initWithCoordinateRegion:(MKCoordinateRegion)region
{
  double longitudeDelta = region.span.longitudeDelta;
  double latitudeDelta = region.span.latitudeDelta;
  double longitude = region.center.longitude;
  double latitude = region.center.latitude;
  v26.receiver = self;
  v26.super_class = (Class)MKMapCameraBoundary;
  v7 = [(MKMapCameraBoundary *)&v26 init];
  v8 = v7;
  if (!v7)
  {
LABEL_8:
    v22 = v8;
    goto LABEL_9;
  }
  if (-[MKMapCameraBoundary isValidCoordinateRegion:](v7, "isValidCoordinateRegion:", latitude, longitude, latitudeDelta, longitudeDelta))
  {
    -[MKMapCameraBoundary _clampedCoordinateRegionForCoordinateRegion:](v8, "_clampedCoordinateRegionForCoordinateRegion:", latitude, longitude, latitudeDelta, longitudeDelta);
    v8->_region.center.double latitude = v9;
    v8->_region.center.double longitude = v10;
    v8->_region.span.double latitudeDelta = v11;
    v8->_region.span.double longitudeDelta = v12;
    if (v9 == 0.0)
    {
      v8->_mapRect = ($B4107F3CF54D6A10AA3E39D325AB6F2C)MKMapRectWorld;
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4FB39E8]) initWithMapRegion:0];
      vkRestriction = v8->_vkRestriction;
      v8->_vkRestriction = (VKCameraRegionRestriction *)v23;
    }
    else
    {
      GEOMapRectForCoordinateRegion();
      v8->_mapRect.origin.double x = v13;
      v8->_mapRect.origin.double y = v14;
      v8->_mapRect.size.double width = v15;
      v8->_mapRect.size.double height = v16;
      vkRestriction = (VKCameraRegionRestriction *)objc_msgSend(objc_alloc(MEMORY[0x1E4F64700]), "initWithCoordinateRegion:", v8->_region.center.longitude, v8->_region.center.latitude, v8->_region.span.latitudeDelta, v8->_region.span.longitudeDelta);
      uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB39E8]) initWithMapRegion:vkRestriction];
      BOOL v18 = v8->_vkRestriction;
      v8->_vkRestriction = (VKCameraRegionRestriction *)v17;
    }
    goto LABEL_8;
  }
  id v19 = NSString;
  v20 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&latitude, *(void *)&longitude];
  uint64_t v21 = [v19 stringWithFormat:@"<center:%@ span:%+.8f, %+.8f>", v20, *(void *)&latitudeDelta, *(void *)&longitudeDelta];

  NSLog(&cfstr_InvalidMkcoord.isa, v21);
  v22 = 0;
LABEL_9:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double x = self->_mapRect.origin.x;
  double y = self->_mapRect.origin.y;
  double width = self->_mapRect.size.width;
  double height = self->_mapRect.size.height;

  return (id)objc_msgSend(v4, "initWithMapRect:", x, y, width, height);
}

- (BOOL)isValidCoordinateRegion:(id *)a3
{
  BOOL result = 0;
  if (v4 >= -180.0 && v4 <= 180.0 && v3 >= -90.0) {
    return v3 <= 90.0;
  }
  return result;
}

- ($DC1C8D958DDC8D67D0023B74A9319680)_clampedCoordinateRegionForCoordinateRegion:(SEL)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(MKMapCameraBoundary *)self isEqualToMapCameraBoundary:v4];

  return v5;
}

- (BOOL)isEqualToMapCameraBoundary:(id)a3
{
  [a3 mapRect];
  if (self->_mapRect.origin.x != v7 || self->_mapRect.origin.y != v4) {
    return 0;
  }
  if (self->_mapRect.size.height == v6) {
    return self->_mapRect.size.width == v5;
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  vkRestriction = self->_vkRestriction;
  id v6 = v4;
  if (vkRestriction)
  {
    [v4 encodeObject:vkRestriction forKey:@"MKMapCameraBoundaryVKRestriction"];
    id v4 = v6;
  }
  [v4 encodeDouble:@"MKMapCameraBoundaryRegionLatitude" forKey:self->_region.center.latitude];
  [v6 encodeDouble:@"MKMapCameraBoundaryRegionLongitude" forKey:self->_region.center.longitude];
  [v6 encodeDouble:@"MKMapCameraBoundaryRegionLatitudeSpan" forKey:self->_region.span.latitudeDelta];
  [v6 encodeDouble:@"MKMapCameraBoundaryRegionLongitudeSpan" forKey:self->_region.span.longitudeDelta];
  [v6 encodeDouble:@"MKMapCameraBoundaryMapRectX" forKey:self->_mapRect.origin.x];
  [v6 encodeDouble:@"MKMapCameraBoundaryMapRectY" forKey:self->_mapRect.origin.y];
  [v6 encodeDouble:@"MKMapCameraBoundaryMapRectWidth" forKey:self->_mapRect.size.width];
  [v6 encodeDouble:@"MKMapCameraBoundaryMapRectHeight" forKey:self->_mapRect.size.height];
}

- (MKMapCameraBoundary)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v24.receiver = self;
  v24.super_class = (Class)MKMapCameraBoundary;
  double v5 = [(MKMapCameraBoundary *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"MKMapCameraBoundaryVKRestriction"];
    if (!v6)
    {
      v22 = 0;
      goto LABEL_6;
    }
    vkRestriction = v5->_vkRestriction;
    v5->_vkRestriction = (VKCameraRegionRestriction *)v6;

    [(NSCoder *)v4 decodeDoubleForKey:@"MKMapCameraBoundaryMapRectX"];
    double v9 = v8;
    [(NSCoder *)v4 decodeDoubleForKey:@"MKMapCameraBoundaryMapRectY"];
    double v11 = v10;
    [(NSCoder *)v4 decodeDoubleForKey:@"MKMapCameraBoundaryMapRectWidth"];
    double v13 = v12;
    [(NSCoder *)v4 decodeDoubleForKey:@"MKMapCameraBoundaryMapRectHeight"];
    v5->_mapRect.origin.double x = v9;
    v5->_mapRect.origin.double y = v11;
    v5->_mapRect.size.double width = v13;
    v5->_mapRect.size.double height = v14;
    [(NSCoder *)v4 decodeDoubleForKey:@"MKMapCameraBoundaryRegionLatitude"];
    CLLocationDegrees v16 = v15;
    [(NSCoder *)v4 decodeDoubleForKey:@"MKMapCameraBoundaryRegionLongitude"];
    CLLocationCoordinate2D v18 = CLLocationCoordinate2DMake(v16, v17);
    [(NSCoder *)v4 decodeDoubleForKey:@"MKMapCameraBoundaryRegionLatitudeSpan"];
    double v20 = v19;
    [(NSCoder *)v4 decodeDoubleForKey:@"MKMapCameraBoundaryRegionLongitudeSpan"];
    v5->_region.center = v18;
    v5->_region.span.double latitudeDelta = v20;
    v5->_region.span.double longitudeDelta = v21;
  }
  v22 = v5;
LABEL_6:

  return v22;
}

- (BOOL)_isEmpty
{
  vkRestriction = self->_vkRestriction;
  if (vkRestriction) {
    return [(VKCameraRegionRestriction *)vkRestriction isEmpty];
  }
  else {
    return 1;
  }
}

- (id)_vkRegionRestriction
{
  return self->_vkRestriction;
}

- (BOOL)_containsCoordinate:(CLLocationCoordinate2D)a3
{
  return -[VKCameraRegionRestriction containsCoordinate:](self->_vkRestriction, "containsCoordinate:", a3.latitude, a3.longitude);
}

- (CLLocationCoordinate2D)_clampedCoordinateForCoordinate:(CLLocationCoordinate2D)a3
{
  -[VKCameraRegionRestriction clampedCoordinate:](self->_vkRestriction, "clampedCoordinate:", a3.latitude, a3.longitude);

  CLLocationCoordinate2D v7 = CLLocationCoordinate2DMake(v3, v4);
  double longitude = v7.longitude;
  double latitude = v7.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (MKMapRect)mapRect
{
  double x = self->_mapRect.origin.x;
  double y = self->_mapRect.origin.y;
  double width = self->_mapRect.size.width;
  double height = self->_mapRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (MKCoordinateRegion)region
{
  double latitude = self->_region.center.latitude;
  double longitude = self->_region.center.longitude;
  double latitudeDelta = self->_region.span.latitudeDelta;
  double longitudeDelta = self->_region.span.longitudeDelta;
  result.span.double longitudeDelta = longitudeDelta;
  result.span.double latitudeDelta = latitudeDelta;
  result.center.double longitude = longitude;
  result.center.double latitude = latitude;
  return result;
}

- (void).cxx_destruct
{
}

@end