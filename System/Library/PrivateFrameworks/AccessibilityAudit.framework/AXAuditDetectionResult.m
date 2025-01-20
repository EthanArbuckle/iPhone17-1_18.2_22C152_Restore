@interface AXAuditDetectionResult
- (CGRect)detectionRegion;
- (int64_t)detectionType;
- (void)setDetectionRegion:(CGRect)a3;
- (void)setDetectionType:(int64_t)a3;
@end

@implementation AXAuditDetectionResult

- (CGRect)detectionRegion
{
  double x = self->_detectionRegion.origin.x;
  double y = self->_detectionRegion.origin.y;
  double width = self->_detectionRegion.size.width;
  double height = self->_detectionRegion.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDetectionRegion:(CGRect)a3
{
  self->_detectionRegion = a3;
}

- (int64_t)detectionType
{
  return self->_detectionType;
}

- (void)setDetectionType:(int64_t)a3
{
  self->_detectionType = a3;
}

@end