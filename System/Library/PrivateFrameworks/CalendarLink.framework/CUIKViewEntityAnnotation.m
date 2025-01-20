@interface CUIKViewEntityAnnotation
- (CGRect)rect;
- (CUIKViewEntityAnnotation)initWithEvent:(id)a3 rect:(CGRect)a4 state:(unint64_t)a5;
- (EKEvent)event;
- (unint64_t)state;
@end

@implementation CUIKViewEntityAnnotation

- (CUIKViewEntityAnnotation)initWithEvent:(id)a3 rect:(CGRect)a4 state:(unint64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CUIKViewEntityAnnotation;
  v13 = [(CUIKViewEntityAnnotation *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_event, a3);
    v14->_rect.origin.CGFloat x = x;
    v14->_rect.origin.CGFloat y = y;
    v14->_rect.size.CGFloat width = width;
    v14->_rect.size.CGFloat height = height;
    v14->_state = a5;
  }

  return v14;
}

- (EKEvent)event
{
  return self->_event;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

@end