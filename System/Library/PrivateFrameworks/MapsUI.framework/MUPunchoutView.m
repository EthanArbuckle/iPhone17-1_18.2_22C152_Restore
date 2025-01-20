@interface MUPunchoutView
+ (double)_intrinsicWidth;
- (CGSize)intrinsicContentSize;
- (MUPunchoutView)initWithFrame:(CGRect)a3;
- (MUPunchoutViewModel)viewModel;
- (id)_attributedStringFromSymbol;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateLabelsWithAlpha:(double)a3;
- (void)beginAnimatingActivityIndicator;
- (void)endAnimatingActivityIndicatorWithError:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUPunchoutView

- (MUPunchoutView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUPunchoutView;
  v3 = -[MUPunchoutView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUPunchoutView *)v3 setAccessibilityIdentifier:@"PunchoutView"];
    [(MUPunchoutView *)v4 _setupSubviews];
    [(MUPunchoutView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupSubviews
{
  v3 = +[MUInfoCardStyle labelForProminence:1];
  moreOnLabel = self->_moreOnLabel;
  self->_moreOnLabel = v3;

  [(MULabelViewProtocol *)self->_moreOnLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[MUInfoCardStyle tintColor];
  [(MULabelViewProtocol *)self->_moreOnLabel setTextColor:v5];

  [(MULabelViewProtocol *)self->_moreOnLabel setTextAlignment:1];
  [(MULabelViewProtocol *)self->_moreOnLabel setAccessibilityIdentifier:@"ActionLabel"];
  [(MUPunchoutView *)self addSubview:self->_moreOnLabel];
  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  objc_super v6 = (UILabel *)objc_claimAutoreleasedReturnValue();
  vendorNameLabel = self->_vendorNameLabel;
  self->_vendorNameLabel = v6;

  [(UILabel *)self->_vendorNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_vendorNameLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_vendorNameLabel setNumberOfLines:0];
  v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  v9 = objc_msgSend(v8, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09B8]);
  [(UILabel *)self->_vendorNameLabel setFont:v9];

  v10 = +[MUInfoCardStyle tintColor];
  [(UILabel *)self->_vendorNameLabel setTextColor:v10];

  [(UILabel *)self->_vendorNameLabel setTextAlignment:1];
  [(UILabel *)self->_vendorNameLabel setAccessibilityIdentifier:@"TitleLabel"];
  [(MUPunchoutView *)self addSubview:self->_vendorNameLabel];
  v11 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  layoutGuide = self->_layoutGuide;
  self->_layoutGuide = v11;

  [(MUPunchoutView *)self addLayoutGuide:self->_layoutGuide];
  v13 = +[MUInfoCardStyle punchoutButtonPlatterColor];
  [(MUPunchoutView *)self setBackgroundColor:v13];

  id v14 = objc_alloc(MEMORY[0x1E4FB1400]);
  v15 = (UIActivityIndicatorView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  spinner = self->_spinner;
  self->_spinner = v15;

  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
  v17 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  menuButton = self->_menuButton;
  self->_menuButton = v17;

  [(UIButton *)self->_menuButton setShowsMenuAsPrimaryAction:1];
  [(UIButton *)self->_menuButton setPreferredMenuElementOrder:2];
  [(UIButton *)self->_menuButton setHidden:1];
  [(UIButton *)self->_menuButton setAccessibilityIdentifier:@"MenuButton"];
  v19 = self->_menuButton;
  [(MUPunchoutView *)self addSubview:v19];
}

- (void)_setupConstraints
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v29 = (void *)MEMORY[0x1E4F28DC8];
  v41 = [[MUEdgeLayout alloc] initWithItem:self->_menuButton container:self];
  v44[0] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  v40 = [(UILayoutGuide *)self->_layoutGuide centerYAnchor];
  v39 = [(MUPunchoutView *)self centerYAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v43[0] = v38;
  v37 = [(UILayoutGuide *)self->_layoutGuide leadingAnchor];
  v36 = [(MUPunchoutView *)self leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36 constant:16.0];
  v43[1] = v35;
  v34 = [(UILayoutGuide *)self->_layoutGuide trailingAnchor];
  v33 = [(MUPunchoutView *)self trailingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33 constant:-16.0];
  v43[2] = v32;
  v31 = [(UILayoutGuide *)self->_layoutGuide topAnchor];
  v30 = [(MUPunchoutView *)self topAnchor];
  v28 = [v31 constraintGreaterThanOrEqualToAnchor:v30];
  v43[3] = v28;
  v27 = [(UILayoutGuide *)self->_layoutGuide bottomAnchor];
  v26 = [(MUPunchoutView *)self bottomAnchor];
  v25 = [v27 constraintLessThanOrEqualToAnchor:v26];
  v43[4] = v25;
  v24 = [(MULabelViewProtocol *)self->_moreOnLabel leadingAnchor];
  v23 = [(UILayoutGuide *)self->_layoutGuide leadingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v43[5] = v22;
  v21 = [(MULabelViewProtocol *)self->_moreOnLabel topAnchor];
  v20 = [(UILayoutGuide *)self->_layoutGuide topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v43[6] = v19;
  v18 = [(MULabelViewProtocol *)self->_moreOnLabel trailingAnchor];
  v17 = [(UILayoutGuide *)self->_layoutGuide trailingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v43[7] = v16;
  v15 = [(MULabelViewProtocol *)self->_moreOnLabel bottomAnchor];
  id v14 = [(UILabel *)self->_vendorNameLabel topAnchor];
  v13 = [v15 constraintEqualToAnchor:v14 constant:-5.0];
  v43[8] = v13;
  v3 = [(UILabel *)self->_vendorNameLabel leadingAnchor];
  v4 = [(MULabelViewProtocol *)self->_moreOnLabel leadingAnchor];
  v5 = [v3 constraintEqualToAnchor:v4];
  v43[9] = v5;
  objc_super v6 = [(UILabel *)self->_vendorNameLabel trailingAnchor];
  v7 = [(MULabelViewProtocol *)self->_moreOnLabel trailingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v43[10] = v8;
  v9 = [(UILabel *)self->_vendorNameLabel bottomAnchor];
  v10 = [(UILayoutGuide *)self->_layoutGuide bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v43[11] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:12];
  objc_msgSend(v29, "_mapsui_activateLayouts:constraints:", v42, v12);
}

- (id)_attributedStringFromSymbol
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = [(MUPunchoutViewModel *)self->_viewModel symbolName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [(MUPunchoutViewModel *)self->_viewModel symbolName];
  }
  else
  {
    v5 = @"arrow.up.forward.fill";
  }
  objc_super v6 = objc_msgSend(MEMORY[0x1E4FB1818], "_mapsui_systemImageNamed:", v5);
  v7 = [v6 imageWithRenderingMode:2];

  id v8 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  [v8 setImage:v7];
  v9 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v8];
  v10 = (void *)[v9 mutableCopy];

  uint64_t v16 = *MEMORY[0x1E4FB06F8];
  v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  v12 = objc_msgSend(v11, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09D0]);
  v17[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  objc_msgSend(v10, "addAttributes:range:", v13, 0, objc_msgSend(v10, "length"));

  id v14 = (void *)[v10 copy];
  return v14;
}

- (CGSize)intrinsicContentSize
{
  [(id)objc_opt_class() _intrinsicWidth];
  double v3 = *MEMORY[0x1E4FB30D8];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)_intrinsicWidth
{
  return 106.0;
}

- (void)beginAnimatingActivityIndicator
{
  v11[2] = *MEMORY[0x1E4F143B8];
  [(MUPunchoutView *)self _updateLabelsWithAlpha:0.0];
  [(MUPunchoutView *)self addSubview:self->_spinner];
  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  double v3 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v4 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
  v5 = [(MUPunchoutView *)self centerXAnchor];
  objc_super v6 = [v4 constraintEqualToAnchor:v5];
  v11[0] = v6;
  v7 = [(UIActivityIndicatorView *)self->_spinner centerYAnchor];
  id v8 = [(MUPunchoutView *)self centerYAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v11[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  [v3 activateConstraints:v10];
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  [(UIActivityIndicatorView *)self->_spinner removeFromSuperview];
  [(MUPunchoutView *)self _updateLabelsWithAlpha:1.0];
}

- (void)_updateLabelsWithAlpha:(double)a3
{
  -[MULabelViewProtocol setAlpha:](self->_moreOnLabel, "setAlpha:");
  vendorNameLabel = self->_vendorNameLabel;
  [(UILabel *)vendorNameLabel setAlpha:a3];
}

- (void)setViewModel:(id)a3
{
  v5 = (MUPunchoutViewModel *)a3;
  p_viewModel = &self->_viewModel;
  if (self->_viewModel != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_viewModel, a3);
    p_viewModel = (MUPunchoutViewModel **)[(MUPunchoutView *)self _updateAppearance];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_viewModel, v5);
}

- (void)_updateAppearance
{
  double v3 = [(MUPunchoutView *)self _attributedStringFromSymbol];
  [(MULabelViewProtocol *)self->_moreOnLabel setAttributedText:v3];

  uint64_t v4 = [(MUPunchoutViewModel *)self->_viewModel punchoutText];
  [(UILabel *)self->_vendorNameLabel setText:v4];

  v5 = [(MUPunchoutViewModel *)self->_viewModel menu];
  [(UIButton *)self->_menuButton setMenu:v5];

  id v6 = [(MUPunchoutViewModel *)self->_viewModel menu];
  [(UIButton *)self->_menuButton setHidden:v6 == 0];
}

- (MUPunchoutViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_vendorNameLabel, 0);
  objc_storeStrong((id *)&self->_moreOnLabel, 0);
}

@end