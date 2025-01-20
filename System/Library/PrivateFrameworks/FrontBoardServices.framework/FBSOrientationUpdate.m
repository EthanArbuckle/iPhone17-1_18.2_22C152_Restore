@interface FBSOrientationUpdate
- (FBSOrientationUpdate)init;
- (FBSOrientationUpdate)initWithOrientation:(int64_t)a3 sequenceNumber:(unint64_t)a4 duration:(double)a5 rotationDirection:(int64_t)a6;
- (double)duration;
- (id)description;
- (int64_t)orientation;
- (int64_t)rotationDirection;
- (unint64_t)sequenceNumber;
- (void)setDuration:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setRotationDirection:(int64_t)a3;
- (void)setSequenceNumber:(unint64_t)a3;
@end

@implementation FBSOrientationUpdate

- (id)description
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (FBSOrientationUpdate)initWithOrientation:(int64_t)a3 sequenceNumber:(unint64_t)a4 duration:(double)a5 rotationDirection:(int64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)FBSOrientationUpdate;
  result = [(FBSOrientationUpdate *)&v11 init];
  if (result)
  {
    result->_orientation = a3;
    result->_sequenceNumber = a4;
    result->_duration = a5;
    result->_rotationDirection = a6;
  }
  return result;
}

- (FBSOrientationUpdate)init
{
  return [(FBSOrientationUpdate *)self initWithOrientation:0 sequenceNumber:0 duration:0 rotationDirection:0.0];
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)rotationDirection
{
  return self->_rotationDirection;
}

- (void)setRotationDirection:(int64_t)a3
{
  self->_rotationDirection = a3;
}

@end