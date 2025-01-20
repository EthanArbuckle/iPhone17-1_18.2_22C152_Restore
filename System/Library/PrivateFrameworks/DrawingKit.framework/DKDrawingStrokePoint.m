@interface DKDrawingStrokePoint
- (CGPoint)location;
- (DKDrawingStrokePoint)init;
- (double)force;
- (double)velocity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setForce:(double)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setVelocity:(double)a3;
@end

@implementation DKDrawingStrokePoint

- (DKDrawingStrokePoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)DKDrawingStrokePoint;
  result = [(DKDrawingStrokePoint *)&v3 init];
  if (result)
  {
    result->_location = (CGPoint)*MEMORY[0x263F00148];
    result->_force = 0.0;
    result->_velocity = 0.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(DKDrawingStrokePoint);
  if (result)
  {
    *(CGPoint *)((char *)result + 24) = self->_location;
    *((void *)result + 1) = *(void *)&self->_force;
    *((void *)result + 2) = *(void *)&self->_velocity;
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(DKDrawingStrokePoint *)self location];
  v6 = NSStringFromCGPoint(v13);
  [(DKDrawingStrokePoint *)self force];
  uint64_t v8 = v7;
  [(DKDrawingStrokePoint *)self velocity];
  v10 = [v3 stringWithFormat:@"%@: location: %@  force: %f velocity: %f", v5, v6, v8, v9];

  return v10;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (double)force
{
  return self->_force;
}

- (void)setForce:(double)a3
{
  self->_force = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocitdouble y = a3;
}

@end