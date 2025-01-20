@interface CKConversationListCollectionViewToolbar
- (BOOL)shouldExpandHeight;
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)contractHeight;
- (void)expandHeight;
- (void)setShouldExpandHeight:(BOOL)a3;
@end

@implementation CKConversationListCollectionViewToolbar

- (CGSize)sizeThatFits:(CGSize)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKConversationListCollectionViewToolbar;
  -[CKConversationListCollectionViewToolbar sizeThatFits:](&v12, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  if ([(CKConversationListCollectionViewToolbar *)self shouldExpandHeight])
  {
    v8 = +[CKUIBehavior sharedBehaviors];
    [v8 expandedToolbarHeightForMiiC];
    double v7 = v9;
  }
  double v10 = v5;
  double v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setShouldExpandHeight:(BOOL)a3
{
  self->_shouldExpandHeight = a3;
}

- (void)expandHeight
{
  [(CKConversationListCollectionViewToolbar *)self setShouldExpandHeight:1];

  [(CKConversationListCollectionViewToolbar *)self sizeToFit];
}

- (void)contractHeight
{
  [(CKConversationListCollectionViewToolbar *)self setShouldExpandHeight:0];

  [(CKConversationListCollectionViewToolbar *)self sizeToFit];
}

- (BOOL)shouldExpandHeight
{
  return self->_shouldExpandHeight;
}

@end