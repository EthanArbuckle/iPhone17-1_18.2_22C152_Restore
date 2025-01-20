@interface CKConversationListNewMessageCollectionViewCell
+ (Class)embeddedTableViewCellClass;
+ (id)reuseIdentifier;
- (CKConversationListCollectionViewCellDelegate)delegate;
- (CKConversationListNewMessageCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)widthForDeterminingAvatarVisibility;
- (void)didHoverOverCell:(id)a3;
- (void)selectedDeleteButtonForConversation:(id)a3 inCell:(id)a4;
- (void)setDelegate:(id)a3;
- (void)updateContentsForConversation:(id)a3;
- (void)updateFontSize;
@end

@implementation CKConversationListNewMessageCollectionViewCell

+ (id)reuseIdentifier
{
  return +[CKConversationListNewMessageCell identifier];
}

+ (Class)embeddedTableViewCellClass
{
  return (Class)objc_opt_class();
}

- (CKConversationListNewMessageCollectionViewCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKConversationListNewMessageCollectionViewCell;
  v3 = -[CKConversationListEmbeddedCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKConversationListNewMessageCollectionViewCell *)v3 embeddedNewMessageTableViewCell];
    [v5 setDelegate:v4];

    v6 = +[CKUIBehavior sharedBehaviors];
    int v7 = [v6 showsHoverToDeleteButtonForNewCompose];

    if (v7)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v4 action:sel_didHoverOverCell_];
      [(CKConversationListNewMessageCollectionViewCell *)v4 addGestureRecognizer:v8];
    }
  }
  return v4;
}

- (void)didHoverOverCell:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversationListNewMessageCollectionViewCell *)self embeddedNewMessageTableViewCell];
  [v5 didHoverOverCell:v4];
}

- (void)updateFontSize
{
  id v2 = [(CKConversationListNewMessageCollectionViewCell *)self embeddedNewMessageTableViewCell];
  [v2 updateFontSize];
}

- (void)updateContentsForConversation:(id)a3
{
  id v6 = a3;
  id v4 = [(CKConversationListEmbeddedCollectionViewCell *)self embeddedTableViewCell];

  if (v4)
  {
    id v5 = [(CKConversationListEmbeddedCollectionViewCell *)self embeddedTableViewCell];
    [v5 updateContentsForConversation:v6];
  }
}

- (double)widthForDeterminingAvatarVisibility
{
  id v2 = [(CKConversationListNewMessageCollectionViewCell *)self delegate];
  [v2 widthForDeterminingAvatarVisibility];
  double v4 = v3;

  return v4;
}

- (void)selectedDeleteButtonForConversation:(id)a3 inCell:(id)a4
{
  id v5 = a3;
  id v6 = [(CKConversationListNewMessageCollectionViewCell *)self delegate];
  [v6 selectedDeleteButtonForConversation:v5 inCell:self];
}

- (CKConversationListCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKConversationListCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end