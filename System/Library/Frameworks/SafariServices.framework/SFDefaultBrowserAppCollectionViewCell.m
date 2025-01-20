@interface SFDefaultBrowserAppCollectionViewCell
+ (CGSize)estimatedSizeForBounds:(CGSize)a3 withTraits:(id)a4;
+ (NSString)reuseIdentifier;
- (ASCLockupView)lockupView;
- (SFDefaultBrowserAppCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)setLockupView:(id)a3;
@end

@implementation SFDefaultBrowserAppCollectionViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"BrowserAppCollectionViewCell";
}

+ (CGSize)estimatedSizeForBounds:(CGSize)a3 withTraits:(id)a4
{
  ASCLockupViewSizeGetEstimatedSize();
  double v6 = v5 + 22.0;
  BOOL v7 = v5 < 90.0;
  double v8 = 112.0;
  if (v7) {
    double v8 = v6;
  }
  result.height = v8;
  result.width = v4;
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SFDefaultBrowserAppCollectionViewCell;
  double v4 = [(SFDefaultBrowserAppCollectionViewCell *)&v11 preferredLayoutAttributesFittingAttributes:a3];
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  v9 = [(SFDefaultBrowserAppCollectionViewCell *)self traitCollection];
  +[SFDefaultBrowserAppCollectionViewCell estimatedSizeForBounds:withTraits:](SFDefaultBrowserAppCollectionViewCell, "estimatedSizeForBounds:withTraits:", v9, v6, v8);
  objc_msgSend(v4, "setSize:");

  return v4;
}

- (SFDefaultBrowserAppCollectionViewCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SFDefaultBrowserAppCollectionViewCell;
  v3 = -[SFDefaultBrowserAppCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(SFDefaultBrowserAppCollectionViewCell *)v3 setSelectedBackgroundView:v4];

    double v5 = [MEMORY[0x1E4FB1618] clearColor];
    double v6 = [(SFDefaultBrowserAppCollectionViewCell *)v3 selectedBackgroundView];
    [v6 setBackgroundColor:v5];

    double v7 = v3;
  }

  return v3;
}

- (void)setLockupView:(id)a3
{
  v29[4] = *MEMORY[0x1E4F143B8];
  double v5 = (ASCLockupView *)a3;
  p_lockupView = &self->_lockupView;
  lockupView = self->_lockupView;
  if (lockupView != v5)
  {
    [(ASCLockupView *)lockupView removeFromSuperview];
    objc_storeStrong((id *)&self->_lockupView, a3);
    if (v5)
    {
      [(ASCLockupView *)*p_lockupView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(ASCLockupView *)*p_lockupView setMaximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
      v28 = self;
      double v8 = [(SFDefaultBrowserAppCollectionViewCell *)self contentView];
      [v8 setContentMode:4];
      objc_msgSend(v8, "setDirectionalLayoutMargins:", 11.0, 18.0, 11.0, 0.0);
      [v8 addSubview:*p_lockupView];
      v27 = v8;
      objc_super v9 = [v8 layoutMarginsGuide];
      v21 = (void *)MEMORY[0x1E4F28DC8];
      v26 = [(ASCLockupView *)*p_lockupView topAnchor];
      v25 = [v9 topAnchor];
      v24 = [v26 constraintEqualToAnchor:v25];
      v29[0] = v24;
      v23 = [(ASCLockupView *)*p_lockupView bottomAnchor];
      v22 = [v9 bottomAnchor];
      v10 = [v23 constraintEqualToAnchor:v22];
      v29[1] = v10;
      objc_super v11 = [(ASCLockupView *)*p_lockupView leadingAnchor];
      v12 = [v9 leadingAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      v29[2] = v13;
      v14 = [(ASCLockupView *)*p_lockupView trailingAnchor];
      v15 = [v9 trailingAnchor];
      v16 = [v14 constraintEqualToAnchor:v15];
      v29[3] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
      [v21 activateConstraints:v17];

      v18 = [(ASCLockupView *)v5 subviews];
      v19 = [v18 firstObject];

      if (v19) {
        uint64_t v20 = [v19 effectiveUserInterfaceLayoutDirection];
      }
      else {
        uint64_t v20 = 0;
      }
      [(SFDefaultBrowserAppCollectionViewCell *)v28 setSemanticContentAttribute:v20];
    }
  }
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void).cxx_destruct
{
}

@end