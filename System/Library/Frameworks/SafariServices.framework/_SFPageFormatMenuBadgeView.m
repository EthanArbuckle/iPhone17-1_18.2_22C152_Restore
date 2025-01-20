@interface _SFPageFormatMenuBadgeView
+ (id)defaultComponentsArrangement;
- (_SFPageFormatMenuBadgeView)initWithText:(id)a3;
- (void)layoutSubviews;
- (void)setBadgeText:(id)a3;
@end

@implementation _SFPageFormatMenuBadgeView

- (_SFPageFormatMenuBadgeView)initWithText:(id)a3
{
  v35[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_SFPageFormatMenuBadgeView;
  v5 = -[_SFPageFormatMenuBadgeView initWithFrame:](&v34, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", @"settingsAlertDividerBackground");
    [(_SFPageFormatMenuBadgeView *)v5 setBackgroundColor:v6];

    [(_SFPageFormatMenuBadgeView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v7;

    [(UILabel *)v5->_titleLabel setText:v4];
    v9 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [(UILabel *)v5->_titleLabel setFont:v9];

    [(UILabel *)v5->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v5->_titleLabel setTextAlignment:1];
    [(UILabel *)v5->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v10) = 1144766464;
    [(UILabel *)v5->_titleLabel setContentHuggingPriority:0 forAxis:v10];
    LODWORD(v11) = 1144766464;
    [(UILabel *)v5->_titleLabel setContentCompressionResistancePriority:1 forAxis:v11];
    [(_SFPageFormatMenuBadgeView *)v5 addSubview:v5->_titleLabel];
    v12 = [(UILabel *)v5->_titleLabel topAnchor];
    [(_SFPageFormatMenuBadgeView *)v5 topAnchor];
    v13 = id v33 = v4;
    v14 = [v12 constraintEqualToAnchor:v13 constant:6.0];

    v29 = v14;
    LODWORD(v15) = 1144766464;
    [v14 setPriority:v15];
    v27 = (void *)MEMORY[0x1E4F28DC8];
    v32 = [(UILabel *)v5->_titleLabel leadingAnchor];
    v31 = [(_SFPageFormatMenuBadgeView *)v5 leadingAnchor];
    v30 = [v32 constraintEqualToAnchor:v31 constant:6.0];
    v35[0] = v30;
    v28 = [(_SFPageFormatMenuBadgeView *)v5 trailingAnchor];
    v16 = [(UILabel *)v5->_titleLabel trailingAnchor];
    v17 = [v28 constraintEqualToAnchor:v16 constant:6.0];
    v35[1] = v17;
    v35[2] = v14;
    v18 = [(UILabel *)v5->_titleLabel centerYAnchor];
    v19 = [(_SFPageFormatMenuBadgeView *)v5 centerYAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v35[3] = v20;
    v21 = [(_SFPageFormatMenuBadgeView *)v5 widthAnchor];
    v22 = [(_SFPageFormatMenuBadgeView *)v5 heightAnchor];
    v23 = [v21 constraintGreaterThanOrEqualToAnchor:v22];
    v35[4] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];
    [v27 activateConstraints:v24];

    id v4 = v33;
    v25 = v5;
  }
  return v5;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)_SFPageFormatMenuBadgeView;
  [(_SFPageFormatMenuBadgeView *)&v6 layoutSubviews];
  [(_SFPageFormatMenuBadgeView *)self bounds];
  double Width = CGRectGetWidth(v7);
  [(_SFPageFormatMenuBadgeView *)self bounds];
  double v4 = fmin(Width, CGRectGetHeight(v8)) * 0.5;
  v5 = [(_SFPageFormatMenuBadgeView *)self layer];
  [v5 setCornerRadius:v4];
}

+ (id)defaultComponentsArrangement
{
  return &unk_1EFBDF9A0;
}

- (void)setBadgeText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end