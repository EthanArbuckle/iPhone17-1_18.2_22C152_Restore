@interface CKSharedContentsCollectionViewCell
+ (id)reuseIdentifier;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isEditing;
- (CKSharedContentsCollectionViewCell)initWithFrame:(CGRect)a3;
- (CKSharedContentsCollectionViewCellDelegate)delegate;
- (UIImage)previewImage;
- (UIImageView)checkmarkView;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (void)copy:(id)a3;
- (void)delete:(id)a3;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)more:(id)a3;
- (void)saveAttachment:(id)a3;
- (void)setCheckmarkView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setPreviewImage:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setupTapGestureRecognizer;
- (void)toggleCheckmarkViewWithEnabled:(BOOL)a3;
@end

@implementation CKSharedContentsCollectionViewCell

+ (id)reuseIdentifier
{
  return @"CKSharedContentsCollectionViewCell_reuseIdentifier";
}

- (CKSharedContentsCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKSharedContentsCollectionViewCell;
  v3 = -[CKSharedAssetCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CKSharedContentsCollectionViewCell *)v3 setupTapGestureRecognizer];
  }
  return v4;
}

- (void)setupTapGestureRecognizer
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_handleTap_];
  [v4 setDelegate:self];
  v3 = [(CKSharedContentsCollectionViewCell *)self contentView];
  [v3 addGestureRecognizer:v4];

  [(CKSharedContentsCollectionViewCell *)self setTapGestureRecognizer:v4];
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)CKSharedContentsCollectionViewCell;
  [(CKSharedAssetCollectionViewCell *)&v22 layoutSubviews];
  v3 = [(CKSharedAssetCollectionViewCell *)self previewView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = [(CKSharedContentsCollectionViewCell *)self checkmarkView];
  if (v12)
  {
    objc_msgSend(v12, "setHighlighted:", -[CKSharedContentsCollectionViewCell isSelected](self, "isSelected"));
    [v12 bounds];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v23.origin.x = v5;
    v23.origin.y = v7;
    v23.size.width = v9;
    v23.size.height = v11;
    double Width = CGRectGetWidth(v23);
    v24.origin.x = v14;
    v24.origin.y = v16;
    v24.size.width = v18;
    v24.size.height = v20;
    objc_msgSend(v12, "setFrame:", Width - CGRectGetWidth(v24), 0.0, v18, v20);
  }
}

- (void)copy:(id)a3
{
  id v5 = [(CKSharedContentsCollectionViewCell *)self delegate];
  [v5 performAction:a2 forSharedContentsCollectionViewCell:self];
}

- (void)delete:(id)a3
{
  id v5 = [(CKSharedContentsCollectionViewCell *)self delegate];
  [v5 performAction:a2 forSharedContentsCollectionViewCell:self];
}

- (void)more:(id)a3
{
  id v5 = [(CKSharedContentsCollectionViewCell *)self delegate];
  [v5 performAction:a2 forSharedContentsCollectionViewCell:self];
}

- (void)saveAttachment:(id)a3
{
  id v5 = [(CKSharedContentsCollectionViewCell *)self delegate];
  [v5 performAction:a2 forSharedContentsCollectionViewCell:self];
}

- (void)handleTap:(id)a3
{
  id v4 = [(CKSharedContentsCollectionViewCell *)self delegate];
  [v4 sharedContentsCollectionViewCellDidTap:self];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKSharedContentsCollectionViewCell;
  -[CKSharedContentsCollectionViewCell setSelected:](&v6, sel_setSelected_);
  id v5 = [(CKSharedContentsCollectionViewCell *)self checkmarkView];
  [v5 setHighlighted:v3];
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[CKSharedContentsCollectionViewCell toggleCheckmarkViewWithEnabled:](self, "toggleCheckmarkViewWithEnabled:");
    [(CKSharedContentsCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)toggleCheckmarkViewWithEnabled:(BOOL)a3
{
  if (a3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    id v5 = [MEMORY[0x1E4F42A80] ckImageNamed:@"BlueCheckUnselected"];
    objc_super v6 = [MEMORY[0x1E4F42A80] ckImageNamed:@"BlueCheckSelected"];
    id v9 = (id)[v4 initWithImage:v5 highlightedImage:v6];

    CGFloat v7 = [(CKSharedContentsCollectionViewCell *)self contentView];
    [v7 addSubview:v9];

    [(CKSharedContentsCollectionViewCell *)self setCheckmarkView:v9];
  }
  else
  {
    double v8 = [(CKSharedContentsCollectionViewCell *)self checkmarkView];
    [v8 removeFromSuperview];

    [(CKSharedContentsCollectionViewCell *)self setCheckmarkView:0];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a3;
  id v6 = [(CKSharedContentsCollectionViewCell *)self tapGestureRecognizer];

  if (v6 == v5) {
    return ![(CKSharedContentsCollectionViewCell *)self isEditing];
  }
  else {
    return 1;
  }
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (void)setPreviewImage:(id)a3
{
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
}

- (CKSharedContentsCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKSharedContentsCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_checkmarkView, 0);

  objc_storeStrong((id *)&self->_previewImage, 0);
}

@end