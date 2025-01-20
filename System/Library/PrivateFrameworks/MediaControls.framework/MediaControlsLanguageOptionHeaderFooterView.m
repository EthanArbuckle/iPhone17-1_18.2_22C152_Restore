@interface MediaControlsLanguageOptionHeaderFooterView
- (MediaControlsLanguageOptionHeaderFooterView)initWithReuseIdentifier:(id)a3;
- (UILabel)titleLabel;
- (void)setTitleLabel:(id)a3;
@end

@implementation MediaControlsLanguageOptionHeaderFooterView

- (MediaControlsLanguageOptionHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)MediaControlsLanguageOptionHeaderFooterView;
  v3 = [(MediaControlsLanguageOptionHeaderFooterView *)&v30 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    [(UILabel *)v3->_titleLabel setFont:v7];

    v8 = [(MediaControlsLanguageOptionHeaderFooterView *)v3 contentView];
    [v8 addSubview:v3->_titleLabel];

    v22 = (void *)MEMORY[0x1E4F28DC8];
    v28 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v29 = [(MediaControlsLanguageOptionHeaderFooterView *)v3 contentView];
    v27 = [v29 leadingAnchor];
    v26 = [v28 constraintEqualToAnchor:v27 constant:20.0];
    v31[0] = v26;
    v24 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v25 = [(MediaControlsLanguageOptionHeaderFooterView *)v3 contentView];
    v23 = [v25 trailingAnchor];
    v21 = [v24 constraintEqualToAnchor:v23 constant:20.0];
    v31[1] = v21;
    v20 = [(UILabel *)v3->_titleLabel firstBaselineAnchor];
    v9 = [(MediaControlsLanguageOptionHeaderFooterView *)v3 contentView];
    v10 = [v9 layoutMarginsGuide];
    v11 = [v10 topAnchor];
    v12 = [v20 constraintEqualToSystemSpacingBelowAnchor:v11 multiplier:1.5];
    v31[2] = v12;
    v13 = [(MediaControlsLanguageOptionHeaderFooterView *)v3 contentView];
    v14 = [v13 bottomAnchor];
    v15 = [(UILabel *)v3->_titleLabel lastBaselineAnchor];
    v16 = [v14 constraintEqualToSystemSpacingBelowAnchor:v15 multiplier:1.0];
    v31[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
    [v22 activateConstraints:v17];

    v18 = [MEMORY[0x1E4FB1618] clearColor];
    [(MediaControlsLanguageOptionHeaderFooterView *)v3 setTintColor:v18];
  }
  return v3;
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