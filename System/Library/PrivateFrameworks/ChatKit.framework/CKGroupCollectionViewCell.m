@interface CKGroupCollectionViewCell
+ (id)reuseIdentifier;
- (BOOL)shouldHighlight;
- (CKGroupCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIView)avatarView;
- (void)layoutSubviews;
- (void)setAvatarView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation CKGroupCollectionViewCell

+ (id)reuseIdentifier
{
  return @"CKGroupAvatarCollectionViewCell_reuseIdentifier";
}

- (CKGroupCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKGroupCollectionViewCell;
  v3 = -[CKGroupCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] clearColor];
    v5 = [(CKGroupCollectionViewCell *)v3 contentView];
    [v5 setBackgroundColor:v4];
  }
  return v3;
}

- (void)setAvatarView:(id)a3
{
  v5 = (UIView *)a3;
  avatarView = self->_avatarView;
  if (avatarView != v5)
  {
    v8 = v5;
    [(UIView *)avatarView removeFromSuperview];
    objc_storeStrong((id *)&self->_avatarView, a3);
    objc_super v7 = [(CKGroupCollectionViewCell *)self contentView];
    [v7 addSubview:self->_avatarView];

    [(CKGroupCollectionViewCell *)self setNeedsLayout];
    v5 = v8;
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CKGroupCollectionViewCell;
  [(CKGroupCollectionViewCell *)&v12 layoutSubviews];
  v3 = [(CKGroupCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;

  v6 = +[CKUIBehavior sharedBehaviors];
  [v6 groupAvatarViewSize];
  double v8 = v7;

  LODWORD(v9) = 1132068864;
  LODWORD(v10) = 1148846080;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_avatarView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, v8, v9, v10);
  -[UIView setFrame:](self->_avatarView, "setFrame:", (v5 - v11) * 0.5, 0.0, v11, v8);
}

- (BOOL)shouldHighlight
{
  return 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v6);
        }
        objc_super v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        v13 = [(CKGroupCollectionViewCell *)self contentView];
        [v12 locationInView:v13];
        double v15 = v14;
        double v17 = v16;

        v18 = [(CKGroupCollectionViewCell *)self contentView];
        objc_msgSend(v18, "convertPoint:toView:", self->_avatarView, v15, v17);
        double v20 = v19;
        double v22 = v21;

        v23 = -[UIView hitTest:withEvent:](self->_avatarView, "hitTest:withEvent:", v7, v20, v22);
        if (v23)
        {
          v24.receiver = self;
          v24.super_class = (Class)CKGroupCollectionViewCell;
          [(CKGroupCollectionViewCell *)&v24 touchesBegan:v6 withEvent:v7];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }
}

- (UIView)avatarView
{
  return self->_avatarView;
}

- (void).cxx_destruct
{
}

@end