@interface VCPPetsObservation
- (CGRect)bounds;
- (NSArray)keypoints;
- (int)petsType;
- (int)revision;
- (void)setBounds:(CGRect)a3;
- (void)setKeypoints:(id)a3;
- (void)setPetsType:(int)a3;
- (void)setRevision:(int)a3;
@end

@implementation VCPPetsObservation

- (NSArray)keypoints
{
  return self->_keypoints;
}

- (void)setKeypoints:(id)a3
{
}

- (int)petsType
{
  return self->_petsType;
}

- (void)setPetsType:(int)a3
{
  self->_petsType = a3;
}

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

- (int)revision
{
  return self->_revision;
}

- (void)setRevision:(int)a3
{
  self->_revision = a3;
}

- (void).cxx_destruct
{
}

@end