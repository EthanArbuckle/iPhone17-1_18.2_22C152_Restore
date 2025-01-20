@interface MCProfileTitlePageSectionHeaderView
- (MCProfileTitlePageSectionHeaderView)initWithFrame:(CGRect)a3;
- (NSString)text;
- (UILabel)label;
- (UIView)separatorLine;
- (void)layoutSubviews;
- (void)setLabel:(id)a3;
- (void)setSeparatorLine:(id)a3;
- (void)setText:(id)a3;
@end

@implementation MCProfileTitlePageSectionHeaderView

- (MCProfileTitlePageSectionHeaderView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MCProfileTitlePageSectionHeaderView;
  v3 = -[MCProfileTitlePageSectionHeaderView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    label = v3->_label;
    v3->_label = (UILabel *)v4;

    uint64_t v6 = objc_opt_new();
    separatorLine = v3->_separatorLine;
    v3->_separatorLine = (UIView *)v6;

    v8 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v3->_separatorLine setBackgroundColor:v8];

    [(MCProfileTitlePageSectionHeaderView *)v3 addSubview:v3->_label];
    [(MCProfileTitlePageSectionHeaderView *)v3 addSubview:v3->_separatorLine];
  }
  return v3;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)MCProfileTitlePageSectionHeaderView;
  [(MCProfileTitlePageSectionHeaderView *)&v15 layoutSubviews];
  [(MCProfileTitlePageSectionHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MCProfileTitlePageSectionHeaderView *)self label];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(MCProfileTitlePageSectionHeaderView *)self bounds];
  CGFloat v12 = CGRectGetHeight(v16) + -1.0;
  [(MCProfileTitlePageSectionHeaderView *)self bounds];
  double Width = CGRectGetWidth(v17);
  v14 = [(MCProfileTitlePageSectionHeaderView *)self separatorLine];
  objc_msgSend(v14, "setFrame:", 0.0, v12, Width, 1.0);
}

- (void)setText:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    double v4 = (NSString *)[v8 copy];
    text = self->_text;
    self->_text = v4;

    double v6 = self->_text;
    double v7 = [(MCProfileTitlePageSectionHeaderView *)self label];
    [v7 setText:v6];
  }
}

- (NSString)text
{
  return self->_text;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIView)separatorLine
{
  return self->_separatorLine;
}

- (void)setSeparatorLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorLine, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end