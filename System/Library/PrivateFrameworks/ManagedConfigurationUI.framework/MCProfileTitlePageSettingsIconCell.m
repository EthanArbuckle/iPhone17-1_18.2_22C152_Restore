@interface MCProfileTitlePageSettingsIconCell
- (MCProfileTitlePageSettingsIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)iconImageView;
- (void)layoutSubviews;
@end

@implementation MCProfileTitlePageSettingsIconCell

- (MCProfileTitlePageSettingsIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MCProfileTitlePageSettingsIconCell;
  v4 = [(MCProfileTitlePageSettingsIconCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MCProfileTitlePageSettingsIconCell *)v4 setUserInteractionEnabled:0];
    v6 = [(MCProfileTitlePageSettingsIconCell *)v5 contentView];
    [v6 setClipsToBounds:0];

    v7 = [MEMORY[0x1E4F428B8] clearColor];
    [(MCProfileTitlePageSettingsIconCell *)v5 setBackgroundColor:v7];

    uint64_t v8 = objc_opt_new();
    iconImageView = v5->_iconImageView;
    v5->_iconImageView = (UIImageView *)v8;

    v10 = [(MCProfileTitlePageSettingsIconCell *)v5 contentView];
    [v10 addSubview:v5->_iconImageView];
  }
  return v5;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)MCProfileTitlePageSettingsIconCell;
  [(MCProfileTitlePageSettingsIconCell *)&v9 layoutSubviews];
  v3 = [(MCProfileTitlePageSettingsIconCell *)self iconImageView];
  v4 = [v3 superview];
  v5 = [(MCProfileTitlePageSettingsIconCell *)self contentView];

  if (v4 == v5)
  {
    [(MCProfileTitlePageSettingsIconCell *)self bounds];
    double Height = CGRectGetHeight(v10);
    [(MCProfileTitlePageSettingsIconCell *)self bounds];
    CGFloat v7 = (CGRectGetWidth(v11) - Height) * 0.5;
    uint64_t v8 = [(MCProfileTitlePageSettingsIconCell *)self iconImageView];
    objc_msgSend(v8, "setFrame:", v7, 0.0, Height, Height);
  }
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void).cxx_destruct
{
}

@end