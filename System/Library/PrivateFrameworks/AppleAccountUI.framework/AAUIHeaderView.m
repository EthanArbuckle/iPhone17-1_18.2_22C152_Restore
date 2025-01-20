@interface AAUIHeaderView
+ (BOOL)requiresConstraintBasedLayout;
- (AAUIHeaderView)initWithCoder:(id)a3;
- (AAUIHeaderView)initWithFrame:(CGRect)a3;
- (UIImageView)headerImageView;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_updateLabelFonts;
- (void)_updateStackViewSpacing;
- (void)setHeaderImage:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AAUIHeaderView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (AAUIHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIHeaderView;
  v3 = -[AAUIBuddyView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    _AAUIHeaderViewCommonInit(v3);
  }
  return v4;
}

- (AAUIHeaderView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIHeaderView;
  v3 = [(AAUIBuddyView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    _AAUIHeaderViewCommonInit(v3);
  }
  return v4;
}

- (void)setHeaderImage:(id)a3
{
  -[UIImageView setImage:](self->_headerImageView, "setImage:");
  headerImageView = self->_headerImageView;
  [(UIImageView *)headerImageView setHidden:a3 == 0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AAUIHeaderView;
  [(AAUIHeaderView *)&v4 traitCollectionDidChange:a3];
  [(AAUIHeaderView *)self _updateStackViewSpacing];
  [(AAUIHeaderView *)self _updateLabelFonts];
}

- (void)_updateStackViewSpacing
{
  v3 = [(AAUIHeaderView *)self traitCollection];
  if ([v3 horizontalSizeClass] == 2)
  {
    objc_super v4 = [(AAUIHeaderView *)self traitCollection];
    uint64_t v5 = [v4 verticalSizeClass];

    if (v5 == 2)
    {
      double v6 = 44.0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v6 = 36.0;
LABEL_6:
  stackView = self->_stackView;
  [(UIStackView *)stackView setSpacing:v6];
}

- (void)_updateLabelFonts
{
  titleLabel = self->_titleLabel;
  objc_super v4 = (void *)MEMORY[0x263F81708];
  uint64_t v5 = [(AAUIHeaderView *)self traitCollection];
  double v6 = objc_msgSend(v4, "aa_titleFontForTraitCollection:", v5);
  [(UILabel *)titleLabel setFont:v6];

  messageLabel = self->_messageLabel;
  v8 = (void *)MEMORY[0x263F81708];
  id v10 = [(AAUIHeaderView *)self traitCollection];
  v9 = objc_msgSend(v8, "aa_messageFontForTraitCollection:", v10);
  [(UILabel *)messageLabel setFont:v9];
}

- (id)viewForFirstBaselineLayout
{
  return self->_titleLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_messageLabel;
}

- (UIImageView)headerImageView
{
  return self->_headerImageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end