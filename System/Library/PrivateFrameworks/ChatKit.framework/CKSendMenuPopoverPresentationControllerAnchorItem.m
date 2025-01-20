@interface CKSendMenuPopoverPresentationControllerAnchorItem
- (CGRect)anchorRect;
- (CKSendMenuPopoverPresentationControllerAnchorItem)initWithView:(id)a3 rect:(CGRect)a4;
- (UIView)anchorView;
- (void)setAnchorRect:(CGRect)a3;
- (void)setAnchorView:(id)a3;
@end

@implementation CKSendMenuPopoverPresentationControllerAnchorItem

- (CKSendMenuPopoverPresentationControllerAnchorItem)initWithView:(id)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKSendMenuPopoverPresentationControllerAnchorItem;
  v11 = [(CKSendMenuPopoverPresentationControllerAnchorItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_anchorRect.origin.CGFloat x = x;
    v11->_anchorRect.origin.CGFloat y = y;
    v11->_anchorRect.size.CGFloat width = width;
    v11->_anchorRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v11->_anchorView, a3);
  }

  return v12;
}

- (UIView)anchorView
{
  return self->_anchorView;
}

- (void)setAnchorView:(id)a3
{
}

- (CGRect)anchorRect
{
  double x = self->_anchorRect.origin.x;
  double y = self->_anchorRect.origin.y;
  double width = self->_anchorRect.size.width;
  double height = self->_anchorRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAnchorRect:(CGRect)a3
{
  self->_anchorRect = a3;
}

- (void).cxx_destruct
{
}

@end