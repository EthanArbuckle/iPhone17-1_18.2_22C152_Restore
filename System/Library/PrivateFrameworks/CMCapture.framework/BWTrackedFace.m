@interface BWTrackedFace
- (CGRect)detectionRect;
- (CGRect)trackingRect;
- (float)distance;
- (float)size;
- (float)trackingDistance;
- (id)detectionID;
- (id)trackingID;
- (void)dealloc;
- (void)initWithDetectionID:(void *)a1;
- (void)setDetectionRect:(CGRect)a3;
- (void)setTrackingDistance:(float)a3;
- (void)setTrackingID:(id)a3;
- (void)setTrackingRect:(CGRect)a3;
@end

@implementation BWTrackedFace

- (void)initWithDetectionID:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)BWTrackedFace;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
  {
    v3[7] = a2;
    *((_DWORD *)v3 + 24) = 1095761920;
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWTrackedFace;
  [(BWTrackedFace *)&v3 dealloc];
}

- (CGRect)detectionRect
{
  double x = self->_detectionRect.origin.x;
  double y = self->_detectionRect.origin.y;
  double width = self->_detectionRect.size.width;
  double height = self->_detectionRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDetectionRect:(CGRect)a3
{
  self->_detectionRect = a3;
  if (a3.size.width <= a3.size.height) {
    double height = a3.size.height;
  }
  else {
    double height = a3.size.width;
  }
  float v4 = height;
  float v5 = self->_sizeToDistanceMultiplier / v4;
  self->_size = v4;
  self->_distance = v5;
}

- (float)trackingDistance
{
  return self->_trackingDistance;
}

- (void)setTrackingDistance:(float)a3
{
  self->_trackingDistance = a3;
  self->_distance = a3;
  float size = self->_size;
  if (size != 0.0) {
    self->_sizeToDistanceMultiplier = size * a3;
  }
}

- (id)trackingID
{
  return self->_trackingID;
}

- (void)setTrackingID:(id)a3
{
}

- (CGRect)trackingRect
{
  double x = self->_trackingRect.origin.x;
  double y = self->_trackingRect.origin.y;
  double width = self->_trackingRect.size.width;
  double height = self->_trackingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTrackingRect:(CGRect)a3
{
  self->_trackingRect = a3;
}

- (id)detectionID
{
  return self->_detectionID;
}

- (float)size
{
  return self->_size;
}

- (float)distance
{
  return self->_distance;
}

@end