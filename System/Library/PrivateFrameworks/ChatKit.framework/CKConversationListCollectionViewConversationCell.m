@interface CKConversationListCollectionViewConversationCell
+ (Class)conversationCellClassForCurrentSizeCategory;
+ (Class)embeddedTableViewCellClass;
+ (double)cellHeightForDisplayScale:(double)a3;
+ (id)identifierForConversation:(id)a3;
+ (id)reuseIdentifier;
- (BOOL)avatarView:(id)a3 shouldShowContact:(id)a4;
- (BOOL)shouldHidePreviewSummary;
- (CKConversationListCollectionViewCellDelegate)delegate;
- (CKConversationListCollectionViewConversationCell)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)marginInsets;
- (_CKCollectionViewTapGestureRecognizer)avatarViewTapGestureRecognizer;
- (double)widthForDeterminingAvatarVisibility;
- (id)avatarView;
- (id)summaryLabelTextColor;
- (void)avatarHeaderWasTappedForConversation:(id)a3 inCell:(id)a4;
- (void)didHoverOverCell:(id)a3;
- (void)dragStateDidChange:(int64_t)a3;
- (void)forceUnreadIndicatorVisibility:(BOOL)a3 forConversation:(id)a4 animated:(BOOL)a5;
- (void)layoutSubviews;
- (void)selectedDeleteButtonForConversation:(id)a3 inCell:(id)a4;
- (void)setAvatarViewTapGestureRecognizer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setShouldHidePreviewSummary:(BOOL)a3;
- (void)updateContentsForConversation:(id)a3;
- (void)updateContentsForConversation:(id)a3 fastPreview:(BOOL)a4;
@end

@implementation CKConversationListCollectionViewConversationCell

- (CKConversationListCollectionViewConversationCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKConversationListCollectionViewConversationCell;
  v3 = -[CKConversationListEmbeddedCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKConversationListCollectionViewConversationCell *)v3 embeddedConversationTableViewCell];
    [v5 setDelegate:v4];

    v6 = [(CKConversationListCollectionViewConversationCell *)v4 embeddedConversationTableViewCell];
    [(CKConversationListCollectionViewConversationCell *)v4 bounds];
    objc_msgSend(v6, "setContainerBounds:");

    v7 = +[CKUIBehavior sharedBehaviors];
    int v8 = [v7 showsHoverToDeleteButton];

    if (v8)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v4 action:sel_didHoverOverCell_];
      [(CKConversationListCollectionViewConversationCell *)v4 addGestureRecognizer:v9];
    }
  }
  return v4;
}

- (void)updateContentsForConversation:(id)a3 fastPreview:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CKConversationListCollectionViewConversationCell *)self embeddedConversationTableViewCell];
  [v7 updateContentsForConversation:v6 fastPreview:v4];
}

- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CKConversationListCollectionViewConversationCell;
  -[CKConversationListEmbeddedCollectionViewCell setEditingMode:animated:](&v8, sel_setEditingMode_animated_);
  id v7 = [(CKConversationListCollectionViewConversationCell *)self embeddedConversationTableViewCell];
  [v7 setEditingPins:a3 == 2 animated:v4];
}

- (_CKCollectionViewTapGestureRecognizer)avatarViewTapGestureRecognizer
{
  return self->_avatarViewTapGestureRecognizer;
}

- (void)setDelegate:(id)a3
{
}

- (void)layoutSubviews
{
  v3 = [(CKConversationListCollectionViewConversationCell *)self embeddedConversationTableViewCell];
  [(CKConversationListCollectionViewConversationCell *)self bounds];
  objc_msgSend(v3, "setContainerBounds:");

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListCollectionViewConversationCell;
  [(CKConversationListCollectionViewConversationCell *)&v4 layoutSubviews];
}

- (id)avatarView
{
  v2 = [(CKConversationListCollectionViewConversationCell *)self embeddedConversationTableViewCell];
  v3 = [v2 avatarView];

  return v3;
}

- (double)widthForDeterminingAvatarVisibility
{
  v2 = [(CKConversationListCollectionViewConversationCell *)self delegate];
  [v2 widthForDeterminingAvatarVisibility];
  double v4 = v3;

  return v4;
}

- (CKConversationListCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKConversationListCollectionViewCellDelegate *)WeakRetained;
}

- (void)setAvatarViewTapGestureRecognizer:(id)a3
{
}

+ (id)reuseIdentifier
{
  v2 = (void *)[a1 conversationCellClassForCurrentSizeCategory];

  return (id)[v2 reuseIdentifier];
}

+ (Class)conversationCellClassForCurrentSizeCategory
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 isAccessibilityPreferredContentSizeCategory];

  double v3 = objc_opt_class();

  return (Class)v3;
}

+ (Class)embeddedTableViewCellClass
{
  return +[CKConversationListCollectionViewConversationCell conversationCellClassForCurrentSizeCategory];
}

+ (id)identifierForConversation:(id)a3
{
  double v3 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v3);
}

+ (double)cellHeightForDisplayScale:(double)a3
{
  double v4 = (void *)[a1 conversationCellClassForCurrentSizeCategory];

  [v4 cellHeightForDisplayScale:a3];
  return result;
}

- (BOOL)shouldHidePreviewSummary
{
  v2 = [(CKConversationListCollectionViewConversationCell *)self embeddedConversationTableViewCell];
  char v3 = [v2 shouldHidePreviewSummary];

  return v3;
}

- (void)setShouldHidePreviewSummary:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKConversationListCollectionViewConversationCell *)self embeddedConversationTableViewCell];
  [v4 setShouldHidePreviewSummary:v3];
}

- (void)updateContentsForConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewConversationCell *)self embeddedConversationTableViewCell];
  [v5 updateContentsForConversation:v4];
}

- (BOOL)avatarView:(id)a3 shouldShowContact:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(CKConversationListCollectionViewConversationCell *)self embeddedConversationTableViewCell];
  char v9 = [v8 avatarView:v7 shouldShowContact:v6];

  return v9;
}

- (void)forceUnreadIndicatorVisibility:(BOOL)a3 forConversation:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = [(CKConversationListCollectionViewConversationCell *)self embeddedConversationTableViewCell];
  [v9 forceUnreadIndicatorVisibility:v6 forConversation:v8 animated:v5];
}

- (void)avatarHeaderWasTappedForConversation:(id)a3 inCell:(id)a4
{
  id v5 = a3;
  id v6 = [(CKConversationListCollectionViewConversationCell *)self delegate];
  [v6 avatarHeaderWasTappedForConversation:v5];
}

- (void)selectedDeleteButtonForConversation:(id)a3 inCell:(id)a4
{
  id v5 = a3;
  id v6 = [(CKConversationListCollectionViewConversationCell *)self delegate];
  [v6 selectedDeleteButtonForConversation:v5 inCell:self];
}

- (void)didHoverOverCell:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListCollectionViewConversationCell *)self embeddedConversationTableViewCell];
  [v5 didHoverOverCell:v4];
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  self->_marginInsets = a3;
  id v7 = [(CKConversationListCollectionViewConversationCell *)self embeddedConversationTableViewCell];
  objc_msgSend(v7, "setMarginInsets:", top, left, bottom, right);
}

- (id)summaryLabelTextColor
{
  v2 = [(CKConversationListCollectionViewConversationCell *)self embeddedConversationTableViewCell];
  BOOL v3 = [v2 summaryLabelTextColor];

  return v3;
}

- (void)dragStateDidChange:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKConversationListCollectionViewConversationCell;
  [(CKConversationListCollectionViewConversationCell *)&v6 dragStateDidChange:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v5 = [WeakRetained listCellIsBeingDisplayedAsGhostedCellInPinnedSection:self];

  if (v5) {
    [(CKConversationListCollectionViewConversationCell *)self setAlpha:0.0];
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarViewTapGestureRecognizer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end