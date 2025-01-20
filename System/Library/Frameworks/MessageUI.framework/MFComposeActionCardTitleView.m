@interface MFComposeActionCardTitleView
+ (double)heightForTraitCollection:(id)a3;
- (MFComposeActionCardTitleView)initWithFrame:(CGRect)a3;
- (UIButton)closeButton;
- (UILabel)titleLabel;
- (void)_updateHeightForCurrentTraits;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MFComposeActionCardTitleView

- (MFComposeActionCardTitleView)initWithFrame:(CGRect)a3
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)MFComposeActionCardTitleView;
  v3 = -[_UINavigationBarTitleView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MFComposeActionCardTitleView *)v3 setAutoresizingMask:2];
    [(_UINavigationBarTitleView *)v4 setHideStandardTitle:1];
    id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v6;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2998] variant:1024];
    [(UILabel *)v4->_titleLabel setFont:v8];

    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    uint64_t v9 = [MEMORY[0x1E4FB14D0] buttonWithType:7];
    closeButton = v4->_closeButton;
    v4->_closeButton = (UIButton *)v9;

    [(UIButton *)v4->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFComposeActionCardTitleView *)v4 addSubview:v4->_titleLabel];
    [(MFComposeActionCardTitleView *)v4 addSubview:v4->_closeButton];
    v11 = (void *)MEMORY[0x1E4F28DC8];
    v27 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v25 = [(MFComposeActionCardTitleView *)v4 layoutMarginsGuide];
    v24 = [v25 leadingAnchor];
    v23 = objc_msgSend(v27, "constraintEqualToAnchor:constant:", 8.0);
    v29[0] = v23;
    v26 = [(UILabel *)v4->_titleLabel centerYAnchor];
    v22 = [(MFComposeActionCardTitleView *)v4 centerYAnchor];
    v21 = objc_msgSend(v26, "constraintEqualToAnchor:");
    v29[1] = v21;
    v12 = [(MFComposeActionCardTitleView *)v4 layoutMarginsGuide];
    v13 = [v12 trailingAnchor];
    v14 = [(UIButton *)v4->_closeButton trailingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:8.0];
    v29[2] = v15;
    v16 = [(UIButton *)v4->_closeButton centerYAnchor];
    v17 = [(MFComposeActionCardTitleView *)v4 centerYAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v29[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
    [v11 activateConstraints:v19];

    [(MFComposeActionCardTitleView *)v4 _updateHeightForCurrentTraits];
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeActionCardTitleView;
  [(MFComposeActionCardTitleView *)&v5 traitCollectionDidChange:v4];
  [(MFComposeActionCardTitleView *)self _updateHeightForCurrentTraits];
}

- (void)_updateHeightForCurrentTraits
{
  v3 = objc_opt_class();
  id v4 = [(MFComposeActionCardTitleView *)self traitCollection];
  objc_msgSend(v3, "heightForTraitCollection:");
  -[_UINavigationBarTitleView setHeight:](self, "setHeight:");
}

+ (double)heightForTraitCollection:(id)a3
{
  id v3 = a3;
  if ([v3 verticalSizeClass] == 1 && objc_msgSend(v3, "horizontalSizeClass") == 1) {
    uint64_t v4 = 0x4047000000000000;
  }
  else {
    uint64_t v4 = 0x404D000000000000;
  }
  double v5 = *(double *)&v4;

  return v5;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end