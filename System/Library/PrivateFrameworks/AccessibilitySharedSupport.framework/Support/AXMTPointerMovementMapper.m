@interface AXMTPointerMovementMapper
- (AXMTPointerMovementMapper)initWithScreenBounds:(CGRect)a3;
- (CGRect)screenBounds;
- (double)accelerationFactor;
- (id)processPointInNormalizedTrackingSpace:(CGPoint)a3;
- (void)setAccelerationFactor:(double)a3;
- (void)setScreenBounds:(CGRect)a3;
@end

@implementation AXMTPointerMovementMapper

- (AXMTPointerMovementMapper)initWithScreenBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)AXMTPointerMovementMapper;
  v7 = [(AXMTPointerMovementMapper *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_screenBounds.origin.CGFloat x = x;
    v7->_screenBounds.origin.CGFloat y = y;
    v7->_screenBounds.size.CGFloat width = width;
    v7->_screenBounds.size.CGFloat height = height;
    [(AXMTPointerMovementMapper *)v7 reset];
  }
  return v8;
}

- (id)processPointInNormalizedTrackingSpace:(CGPoint)a3
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInternalInconsistencyException, @"You must override %@ in a subclass", v3 format];

  return 0;
}

- (CGRect)screenBounds
{
  double x = self->_screenBounds.origin.x;
  double y = self->_screenBounds.origin.y;
  double width = self->_screenBounds.size.width;
  double height = self->_screenBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setScreenBounds:(CGRect)a3
{
  self->_screenBounds = a3;
}

- (double)accelerationFactor
{
  return self->_accelerationFactor;
}

- (void)setAccelerationFactor:(double)a3
{
  self->_accelerationFactor = a3;
}

@end