@interface _BlastDoorDrawingStrokePoint
- (CGPoint)location;
- (_BlastDoorDrawingStrokePoint)init;
- (double)force;
- (double)velocity;
- (id)createDKStrokePoint;
- (void)setForce:(double)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setVelocity:(double)a3;
@end

@implementation _BlastDoorDrawingStrokePoint

- (_BlastDoorDrawingStrokePoint)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_BlastDoorDrawingStrokePoint;
  result = [(_BlastDoorDrawingStrokePoint *)&v3 init];
  if (result)
  {
    result->_location = (CGPoint)*MEMORY[0x1E4F1DAD8];
    result->_force = 0.0;
    result->_velocity = 0.0;
  }
  return result;
}

- (id)createDKStrokePoint
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  objc_super v3 = (void *)getDKDrawingStrokePointClass_softClass;
  uint64_t v11 = getDKDrawingStrokePointClass_softClass;
  if (!getDKDrawingStrokePointClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getDKDrawingStrokePointClass_block_invoke;
    v7[3] = &unk_1E5FF6880;
    v7[4] = &v8;
    __getDKDrawingStrokePointClass_block_invoke((uint64_t)v7);
    objc_super v3 = (void *)v9[3];
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = (void *)[[v4 alloc] init];
  [(_BlastDoorDrawingStrokePoint *)self location];
  objc_msgSend(v5, "setLocation:");
  [(_BlastDoorDrawingStrokePoint *)self force];
  objc_msgSend(v5, "setForce:");
  [(_BlastDoorDrawingStrokePoint *)self velocity];
  objc_msgSend(v5, "setVelocity:");
  return v5;
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