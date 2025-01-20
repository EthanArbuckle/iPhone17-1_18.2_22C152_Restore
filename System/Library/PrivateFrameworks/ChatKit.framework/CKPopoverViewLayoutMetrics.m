@interface CKPopoverViewLayoutMetrics
- (CGRect)frame;
- (CKPopoverViewLayoutMetrics)initWithState:(unint64_t)a3 frame:(CGRect)a4 coordinateSpace:(id)a5;
- (UICoordinateSpace)coordinateSpace;
- (unint64_t)state;
- (void)setCoordinateSpace:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation CKPopoverViewLayoutMetrics

- (CKPopoverViewLayoutMetrics)initWithState:(unint64_t)a3 frame:(CGRect)a4 coordinateSpace:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKPopoverViewLayoutMetrics;
  v13 = [(CKPopoverViewLayoutMetrics *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_state = a3;
    v13->_frame.origin.CGFloat x = x;
    v13->_frame.origin.CGFloat y = y;
    v13->_frame.size.CGFloat width = width;
    v13->_frame.size.CGFloat height = height;
    objc_storeStrong((id *)&v13->_coordinateSpace, a5);
  }

  return v14;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (UICoordinateSpace)coordinateSpace
{
  return self->_coordinateSpace;
}

- (void)setCoordinateSpace:(id)a3
{
}

- (void).cxx_destruct
{
}

@end