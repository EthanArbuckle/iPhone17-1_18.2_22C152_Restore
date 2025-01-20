@interface PADFace
- (CGRect)bounds;
- (PADPose)facePose;
- (void)setBounds:(CGRect)a3;
- (void)setFacePose:(id)a3;
@end

@implementation PADFace

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (PADPose)facePose
{
  return self->_facePose;
}

- (void)setFacePose:(id)a3
{
}

- (void).cxx_destruct
{
}

@end