@interface DRFlockLayoutInput
- (CGRect)containerBounds;
- (DRSessionViewModel)model;
- (unint64_t)maxItemCount;
- (void)setContainerBounds:(CGRect)a3;
- (void)setMaxItemCount:(unint64_t)a3;
- (void)setModel:(id)a3;
@end

@implementation DRFlockLayoutInput

- (unint64_t)maxItemCount
{
  return self->_maxItemCount;
}

- (void)setMaxItemCount:(unint64_t)a3
{
  self->_maxItemCount = a3;
}

- (DRSessionViewModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (CGRect)containerBounds
{
  double x = self->_containerBounds.origin.x;
  double y = self->_containerBounds.origin.y;
  double width = self->_containerBounds.size.width;
  double height = self->_containerBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContainerBounds:(CGRect)a3
{
  self->_containerBounds = a3;
}

- (void).cxx_destruct
{
}

@end