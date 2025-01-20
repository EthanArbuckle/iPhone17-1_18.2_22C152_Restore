@interface CM2DSkeletonTransform
- (BOOL)visible;
- (double)position;
- (float)confidence;
- (int)type;
- (void)setConfidence:(float)a3;
- (void)setPosition:(CM2DSkeletonTransform *)self;
- (void)setType:(int)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation CM2DSkeletonTransform

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (double)position
{
  return *(double *)(a1 + 24);
}

- (void)setPosition:(CM2DSkeletonTransform *)self
{
  *(void *)&self->_position[4] = v2;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

@end