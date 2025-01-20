@interface AXMTFaceKitFaceTrackerFaceInfo
- (AXMTFaceKitFaceTrackerFaceInfo)initWithFaceMetadata:(id)a3;
- (CGRect)boundingBoxInNormalizedCoordinates;
- (double)roll;
- (int64_t)identifier;
- (void)setBoundingBoxInNormalizedCoordinates:(CGRect)a3;
- (void)setIdentifier:(int64_t)a3;
- (void)setRoll:(double)a3;
@end

@implementation AXMTFaceKitFaceTrackerFaceInfo

- (AXMTFaceKitFaceTrackerFaceInfo)initWithFaceMetadata:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)AXMTFaceKitFaceTrackerFaceInfo;
    v5 = [(AXMTFaceKitFaceTrackerFaceInfo *)&v8 init];
    if (v5)
    {
      -[AXMTFaceKitFaceTrackerFaceInfo setIdentifier:](v5, "setIdentifier:", [v4 faceID]);
      [v4 bounds];
      -[AXMTFaceKitFaceTrackerFaceInfo setBoundingBoxInNormalizedCoordinates:](v5, "setBoundingBoxInNormalizedCoordinates:");
      [v4 rollAngle];
      -[AXMTFaceKitFaceTrackerFaceInfo setRoll:](v5, "setRoll:");
    }
    self = v5;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (CGRect)boundingBoxInNormalizedCoordinates
{
  double x = self->_boundingBoxInNormalizedCoordinates.origin.x;
  double y = self->_boundingBoxInNormalizedCoordinates.origin.y;
  double width = self->_boundingBoxInNormalizedCoordinates.size.width;
  double height = self->_boundingBoxInNormalizedCoordinates.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingBoxInNormalizedCoordinates:(CGRect)a3
{
  self->_boundingBoxInNormalizedCoordinates = a3;
}

- (double)roll
{
  return self->_roll;
}

- (void)setRoll:(double)a3
{
  self->_roll = a3;
}

@end