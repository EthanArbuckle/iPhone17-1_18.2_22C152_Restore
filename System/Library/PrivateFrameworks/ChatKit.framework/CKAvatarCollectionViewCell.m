@interface CKAvatarCollectionViewCell
+ (id)reuseIdentifier;
- (CKAvatarCollectionViewCell)initWithFrame:(CGRect)a3;
- (CKAvatarView)avatarView;
- (void)configureWithEntity:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAvatarView:(id)a3;
@end

@implementation CKAvatarCollectionViewCell

+ (id)reuseIdentifier
{
  return @"CKAvatarCollectionViewCell_reuseIdentifier";
}

- (void)prepareForReuse
{
  v3 = [(CKAvatarCollectionViewCell *)self avatarView];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(CKAvatarCollectionViewCell *)self avatarView];
    [v5 setAllowStaleRendering:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)CKAvatarCollectionViewCell;
  [(CKAvatarCollectionViewCell *)&v6 prepareForReuse];
}

- (CKAvatarCollectionViewCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKAvatarCollectionViewCell;
  v3 = -[CKAvatarCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    char v4 = +[CKUIBehavior sharedBehaviors];
    v5 = [v4 theme];
    objc_super v6 = [v5 messageAcknowledgmentPickerBackgroundColor];
    v7 = [(CKAvatarCollectionViewCell *)v3 contentView];
    [v7 setBackgroundColor:v6];

    v8 = objc_alloc_init(CKAvatarView);
    [(CKAvatarCollectionViewCell *)v3 setAvatarView:v8];

    v9 = [(CKAvatarCollectionViewCell *)v3 contentView];
    v10 = [(CKAvatarCollectionViewCell *)v3 avatarView];
    [v9 addSubview:v10];
  }
  return v3;
}

- (void)configureWithEntity:(id)a3
{
  id v9 = a3;
  char v4 = [(CKAvatarCollectionViewCell *)self avatarView];
  v5 = [v9 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
  if (v5)
  {
    objc_super v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    if ([v6 avatarViewAllowsStaleRendering])
    {
      int v7 = [v4 isDisplayingContent];

      if (v7) {
        [v4 setAllowStaleRendering:1];
      }
    }
    else
    {
    }
    v8 = [v5 identifier];
    objc_msgSend(v4, "_ck_setContextToken:", v8);

    [v4 setContact:v5];
  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)CKAvatarCollectionViewCell;
  [(CKAvatarCollectionViewCell *)&v17 layoutSubviews];
  v3 = [(CKAvatarCollectionViewCell *)self contentView];
  [v3 bounds];
  CGFloat v4 = CGRectGetWidth(v18) * 0.5;
  v5 = [(CKAvatarCollectionViewCell *)self contentView];
  objc_super v6 = [v5 layer];
  [v6 setCornerRadius:v4];

  int v7 = [(CKAvatarCollectionViewCell *)self contentView];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(CKAvatarCollectionViewCell *)self avatarView];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end