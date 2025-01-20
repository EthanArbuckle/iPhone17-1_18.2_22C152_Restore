@interface MCProfileTitlePageTitleCell
- (MCProfileTitlePageTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)titleLabel;
- (void)layoutSubviews;
@end

@implementation MCProfileTitlePageTitleCell

- (MCProfileTitlePageTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)MCProfileTitlePageTitleCell;
  v4 = [(MCProfileTitlePageTitleCell *)&v14 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MCProfileTitlePageTitleCell *)v4 setUserInteractionEnabled:0];
    v6 = [(MCProfileTitlePageTitleCell *)v5 contentView];
    [v6 setClipsToBounds:0];

    v7 = [MEMORY[0x1E4F428B8] clearColor];
    [(MCProfileTitlePageTitleCell *)v5 setBackgroundColor:v7];

    uint64_t v8 = objc_opt_new();
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v8;

    v10 = v5->_titleLabel;
    v11 = [MEMORY[0x1E4F42A30] MCUIBoldTitleFontWithSize:34.0];
    [(UILabel *)v10 setFont:v11];

    [(UILabel *)v5->_titleLabel setTextAlignment:1];
    v12 = [(MCProfileTitlePageTitleCell *)v5 contentView];
    [v12 addSubview:v5->_titleLabel];
  }
  return v5;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)MCProfileTitlePageTitleCell;
  [(MCProfileTitlePageTitleCell *)&v12 layoutSubviews];
  v3 = [(MCProfileTitlePageTitleCell *)self titleLabel];
  v4 = [v3 superview];
  v5 = [(MCProfileTitlePageTitleCell *)self contentView];

  if (v4 == v5)
  {
    v6 = [(MCProfileTitlePageTitleCell *)self titleLabel];
    [(MCProfileTitlePageTitleCell *)self bounds];
    objc_msgSend(v6, "sizeThatFits:", CGRectGetWidth(v13), 1.79769313e308);
    double v8 = v7;

    [(MCProfileTitlePageTitleCell *)self bounds];
    CGFloat v9 = CGRectGetHeight(v14) - v8;
    [(MCProfileTitlePageTitleCell *)self bounds];
    double Width = CGRectGetWidth(v15);
    v11 = [(MCProfileTitlePageTitleCell *)self titleLabel];
    objc_msgSend(v11, "setFrame:", 0.0, v9, Width, v8);
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
}

@end