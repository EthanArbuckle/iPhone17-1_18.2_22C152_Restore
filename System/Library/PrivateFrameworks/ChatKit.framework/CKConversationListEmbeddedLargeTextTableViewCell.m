@interface CKConversationListEmbeddedLargeTextTableViewCell
+ (id)reuseIdentifier;
- (BOOL)avatarView:(id)a3 shouldShowContact:(id)a4;
- (CGRect)containerBounds;
- (UIEdgeInsets)marginInsets;
- (id)avatarView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setContainerBounds:(CGRect)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
@end

@implementation CKConversationListEmbeddedLargeTextTableViewCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)avatarView:(id)a3 shouldShowContact:(id)a4
{
  return 0;
}

- (id)avatarView
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CKConversationListEmbeddedLargeTextTableViewCell;
  v5 = -[CKConversationListEmbeddedLargeTextTableViewCell hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v6 = [(CKConversationListCell *)self closeButton];
  if (v5 == v6) {
    v7 = v5;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
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

- (UIEdgeInsets)marginInsets
{
  double top = self->_marginInsets.top;
  double left = self->_marginInsets.left;
  double bottom = self->_marginInsets.bottom;
  double right = self->_marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->_marginInsets = a3;
}

- (void)setContainerBounds:(CGRect)a3
{
  self->_containerBounds = a3;
}

@end