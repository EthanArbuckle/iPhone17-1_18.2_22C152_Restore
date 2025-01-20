@interface CKConversationListEmbeddedStandardTableViewCell
+ (id)reuseIdentifier;
- (CGRect)containerBounds;
- (CKConversationListEmbeddedStandardTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIEdgeInsets)marginInsets;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)prepareForReuse;
- (void)setContainerBounds:(CGRect)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
@end

@implementation CKConversationListEmbeddedStandardTableViewCell

- (void)setContainerBounds:(CGRect)a3
{
  self->_containerBounds = a3;
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (CKConversationListEmbeddedStandardTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CKConversationListEmbeddedStandardTableViewCell;
  v4 = [(CKConversationListStandardCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(CKConversationListStandardCell *)v4 avatarView];
    [v6 setAsynchronousRendering:1];

    v7 = [(CKConversationListStandardCell *)v5 avatarView];
    [v7 setShowsContactOnTap:0];

    v8 = [(CKConversationListStandardCell *)v5 avatarView];
    [v8 setBypassActionValidation:1];
  }
  return v5;
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

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKConversationListEmbeddedStandardTableViewCell;
  [(CKConversationListStandardCell *)&v4 prepareForReuse];
  v3 = [(CKConversationListCell *)self summaryLabel];
  [v3 setAttributedText:0];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CKConversationListEmbeddedStandardTableViewCell;
  -[CKConversationListEmbeddedStandardTableViewCell hitTest:withEvent:](&v11, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  int v7 = CKIsRunningInMacCatalyst();
  if (!v7
    && ([(CKConversationListStandardCell *)self avatarView],
        id v4 = (id)objc_claimAutoreleasedReturnValue(),
        v6 == v4))
  {
    id v4 = v6;
    id v9 = v4;
  }
  else
  {
    id v8 = [(CKConversationListCell *)self closeButton];
    if (v6 == v8) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }

    if (v7) {
      goto LABEL_10;
    }
  }

LABEL_10:

  return v9;
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

@end