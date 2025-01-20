@interface CKAvatarContactNameCollectionReusableView
+ (id)reuseIdentifier;
+ (id)supplementaryViewKind;
- (BOOL)shouldDisplayTitle;
- (CKAvatarContactNameCollectionReusableView)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (int64_t)style;
- (void)configureWithEntity:(id)a3;
- (void)layoutSubviews;
- (void)setShouldDisplayTitle:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation CKAvatarContactNameCollectionReusableView

+ (id)reuseIdentifier
{
  return @"CKAvatarContactNameCollectionReusableView_reuseIdentifier";
}

+ (id)supplementaryViewKind
{
  return @"CKAvatarContactNameCollectionReusableView_supplementaryViewKind";
}

- (CKAvatarContactNameCollectionReusableView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CKAvatarContactNameCollectionReusableView;
  v3 = -[CKAvatarContactNameCollectionReusableView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKAvatarContactNameCollectionReusableView *)v3 setTitleLabel:v5];

    v6 = +[CKUIBehavior sharedBehaviors];
    v7 = [v6 avatarNameFont];
    v8 = [(CKAvatarContactNameCollectionReusableView *)v3 titleLabel];
    [v8 setFont:v7];

    v9 = +[CKUIBehavior sharedBehaviors];
    v10 = [v9 theme];
    v11 = [v10 primaryLabelColor];
    v12 = [(CKAvatarContactNameCollectionReusableView *)v3 titleLabel];
    [v12 setTextColor:v11];

    v13 = [(CKAvatarContactNameCollectionReusableView *)v3 titleLabel];
    [v13 setTextAlignment:1];

    [(CKAvatarContactNameCollectionReusableView *)v3 setShouldDisplayTitle:0];
    v14 = [(CKAvatarContactNameCollectionReusableView *)v3 titleLabel];
    [(CKAvatarContactNameCollectionReusableView *)v3 addSubview:v14];
  }
  return v3;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    if ((unint64_t)(a3 - 2) >= 2)
    {
      if (a3 == 1)
      {
        id v7 = +[CKUIBehavior sharedBehaviors];
        id v4 = [v7 theme];
        [v4 entryFieldDarkEffectButtonColor];
      }
      else
      {
        id v7 = +[CKUIBehavior sharedBehaviors];
        id v4 = [v7 theme];
        [v4 primaryLabelColor];
      v5 = };
      v6 = [(CKAvatarContactNameCollectionReusableView *)self titleLabel];
      [v6 setTextColor:v5];
    }
    else
    {
      id v7 = [MEMORY[0x1E4F428B8] whiteColor];
      id v4 = [(CKAvatarContactNameCollectionReusableView *)self titleLabel];
      [v4 setTextColor:v7];
    }
  }
}

- (void)configureWithEntity:(id)a3
{
  id v8 = a3;
  int v5 = [v8 isMe];
  if (v5)
  {
    v3 = CKFrameworkBundle();
    [v3 localizedStringForKey:@"ME" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  else
  {
    [v8 abbreviatedDisplayName];
  v6 = };
  id v7 = [(CKAvatarContactNameCollectionReusableView *)self titleLabel];
  [v7 setText:v6];

  if (v5)
  {

    v6 = v3;
  }

  [(CKAvatarContactNameCollectionReusableView *)self layoutIfNeeded];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CKAvatarContactNameCollectionReusableView;
  [(CKAvatarContactNameCollectionReusableView *)&v12 layoutSubviews];
  if ([(CKAvatarContactNameCollectionReusableView *)self shouldDisplayTitle])
  {
    [(CKAvatarContactNameCollectionReusableView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(CKAvatarContactNameCollectionReusableView *)self titleLabel];
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  }
}

- (void)setShouldDisplayTitle:(BOOL)a3
{
  if (self->_shouldDisplayTitle != a3)
  {
    self->_shouldDisplayTitle = a3;
    BOOL v4 = !a3;
    double v5 = [(CKAvatarContactNameCollectionReusableView *)self titleLabel];
    [v5 setHidden:v4];

    [(CKAvatarContactNameCollectionReusableView *)self setNeedsLayout];
    [(CKAvatarContactNameCollectionReusableView *)self layoutIfNeeded];
  }
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)shouldDisplayTitle
{
  return self->_shouldDisplayTitle;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end