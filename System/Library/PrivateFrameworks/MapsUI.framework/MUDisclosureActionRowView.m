@interface MUDisclosureActionRowView
- (MUDisclosureActionRowView)initWithFrame:(CGRect)a3;
- (MUDisclosureActionViewModelProviding)viewModel;
- (double)_imageWidth;
- (void)_buttonCellTapped;
- (void)_contentSizeDidChange;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)setViewModel:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation MUDisclosureActionRowView

- (MUDisclosureActionRowView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MUDisclosureActionRowView;
  v3 = -[MUPlaceSectionRowView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUDisclosureActionRowView *)v3 _setupSubviews];
    [(MUDisclosureActionRowView *)v4 _setupConstraints];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__contentSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v4;
}

- (void)_setupSubviews
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  titleValueLayoutGuide = self->_titleValueLayoutGuide;
  self->_titleValueLayoutGuide = v3;

  [(MUDisclosureActionRowView *)self addLayoutGuide:self->_titleValueLayoutGuide];
  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = *MEMORY[0x1E4FB28C8];
  v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_titleLabel setFont:v8];

  v9 = +[MUInfoCardStyle textColor];
  [(UILabel *)self->_titleLabel setTextColor:v9];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(MUDisclosureActionRowView *)self addSubview:self->_titleLabel];
  id v10 = objc_alloc(MEMORY[0x1E4FB1838]);
  v11 = (UIImageView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  imageView = self->_imageView;
  self->_imageView = v11;

  [(UIImageView *)self->_imageView setAccessibilityIdentifier:@"ImageView"];
  v13 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIImageView *)self->_imageView setBackgroundColor:v13];

  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUDisclosureActionRowView *)self addSubview:self->_imageView];
  v14 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:v7];
  id v15 = objc_alloc(MEMORY[0x1E4FB1838]);
  v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward" withConfiguration:v14];
  v17 = (UIImageView *)[v15 initWithImage:v16];
  disclosureView = self->_disclosureView;
  self->_disclosureView = v17;

  [(UIImageView *)self->_disclosureView setAccessibilityIdentifier:@"DisclosureView"];
  [(UIImageView *)self->_disclosureView setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(UIImageView *)self->_disclosureView setTintColor:v19];

  LODWORD(v20) = 1148846080;
  [(UIImageView *)self->_disclosureView setContentHuggingPriority:0 forAxis:v20];
  LODWORD(v21) = 1148846080;
  [(UIImageView *)self->_disclosureView setContentHuggingPriority:1 forAxis:v21];
  LODWORD(v22) = 1148846080;
  [(UIImageView *)self->_disclosureView setContentCompressionResistancePriority:0 forAxis:v22];
  LODWORD(v23) = 1148846080;
  [(UIImageView *)self->_disclosureView setContentCompressionResistancePriority:1 forAxis:v23];
  [(MUDisclosureActionRowView *)self addSubview:self->_disclosureView];
  [(MKViewWithHairline *)self setLeftHairlineInset:56.0];
  v24 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v24;

  [(MUDisclosureActionRowView *)self addGestureRecognizer:self->_tapGestureRecognizer];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer addTarget:self action:sel__buttonCellTapped];
  [(UIView *)self _mapsui_addSelectGestureRecognizerWithTarget:self action:sel__buttonCellTapped];
  v26 = self;
  v29[0] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  id v28 = (id)[(MUDisclosureActionRowView *)self registerForTraitChanges:v27 withAction:sel__updateForPlatterAvailability];
}

- (void)_setupConstraints
{
  v47[14] = *MEMORY[0x1E4F143B8];
  v3 = [(UIImageView *)self->_imageView widthAnchor];
  [(MUDisclosureActionRowView *)self _imageWidth];
  objc_msgSend(v3, "constraintEqualToConstant:");
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageWidthConstraint = self->_imageWidthConstraint;
  self->_imageWidthConstraint = v4;

  v31 = (void *)MEMORY[0x1E4F28DC8];
  v47[0] = self->_imageWidthConstraint;
  v46 = [(UIImageView *)self->_imageView heightAnchor];
  v45 = [(UIImageView *)self->_imageView widthAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v47[1] = v44;
  v43 = [(UIImageView *)self->_imageView leadingAnchor];
  v42 = [(MUDisclosureActionRowView *)self leadingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:16.0];
  v47[2] = v41;
  v40 = [(UIImageView *)self->_imageView centerYAnchor];
  v39 = [(UILayoutGuide *)self->_titleValueLayoutGuide centerYAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v47[3] = v38;
  v37 = [(UILayoutGuide *)self->_titleValueLayoutGuide leadingAnchor];
  v36 = [(UIImageView *)self->_imageView trailingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36 constant:10.0];
  v47[4] = v35;
  v34 = [(UILayoutGuide *)self->_titleValueLayoutGuide topAnchor];
  v33 = [(MUDisclosureActionRowView *)self topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33 constant:16.0];
  v47[5] = v32;
  v30 = [(UILayoutGuide *)self->_titleValueLayoutGuide bottomAnchor];
  v29 = [(MUDisclosureActionRowView *)self bottomAnchor];
  id v28 = [v30 constraintEqualToAnchor:v29 constant:-16.0];
  v47[6] = v28;
  v27 = [(UIImageView *)self->_disclosureView leadingAnchor];
  v26 = [(UILayoutGuide *)self->_titleValueLayoutGuide trailingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26 constant:8.0];
  v47[7] = v25;
  v24 = [(UIImageView *)self->_disclosureView trailingAnchor];
  double v23 = [(MUDisclosureActionRowView *)self trailingAnchor];
  double v22 = [v24 constraintEqualToAnchor:v23 constant:-16.0];
  v47[8] = v22;
  double v21 = [(UIImageView *)self->_disclosureView centerYAnchor];
  double v20 = [(UILayoutGuide *)self->_titleValueLayoutGuide centerYAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v47[9] = v19;
  v18 = [(UILabel *)self->_titleLabel leadingAnchor];
  v17 = [(UILayoutGuide *)self->_titleValueLayoutGuide leadingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v47[10] = v16;
  v6 = [(UILabel *)self->_titleLabel topAnchor];
  uint64_t v7 = [(UILayoutGuide *)self->_titleValueLayoutGuide topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v47[11] = v8;
  v9 = [(UILabel *)self->_titleLabel trailingAnchor];
  id v10 = [(UILayoutGuide *)self->_titleValueLayoutGuide trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v47[12] = v11;
  v12 = [(UILabel *)self->_titleLabel bottomAnchor];
  v13 = [(UILayoutGuide *)self->_titleValueLayoutGuide bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v47[13] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:14];
  [v31 activateConstraints:v15];
}

- (double)_imageWidth
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 _scaledValueForValue:30.0];
  double v4 = v3;

  return v4;
}

- (void)setViewModel:(id)a3
{
  v5 = (MUDisclosureActionViewModelProviding *)a3;
  p_viewModel = &self->_viewModel;
  if (self->_viewModel != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_viewModel, a3);
    p_viewModel = (MUDisclosureActionViewModelProviding **)[(MUDisclosureActionRowView *)self _updateAppearance];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_viewModel, v5);
}

- (void)_updateAppearance
{
  double v3 = [(MUDisclosureActionViewModelProviding *)self->_viewModel titleString];
  [(UILabel *)self->_titleLabel set_mapsui_text:v3];

  double v4 = [(MUDisclosureActionViewModelProviding *)self->_viewModel image];
  [(UIImageView *)self->_imageView setImage:v4];

  id v5 = [(MUDisclosureActionViewModelProviding *)self->_viewModel imageTintColor];
  [(UIImageView *)self->_imageView setTintColor:v5];
}

- (void)_buttonCellTapped
{
  double v3 = [(MUDisclosureActionViewModelProviding *)self->_viewModel actionBlock];

  if (v3)
  {
    double v4 = [(MUDisclosureActionViewModelProviding *)self->_viewModel actionBlock];
    v4[2](v4, self);
  }
}

- (void)_contentSizeDidChange
{
  double v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_titleLabel setFont:v3];

  [(MUDisclosureActionRowView *)self _imageWidth];
  imageWidthConstraint = self->_imageWidthConstraint;
  -[NSLayoutConstraint setConstant:](imageWidthConstraint, "setConstant:");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUDisclosureActionRowView;
  [(MUPlaceSectionRowView *)&v5 touchesBegan:a3 withEvent:a4];
  [(MUPlaceSectionRowView *)self setSelected:1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUDisclosureActionRowView;
  [(MUPlaceSectionRowView *)&v5 touchesEnded:a3 withEvent:a4];
  [(MUPlaceSectionRowView *)self setSelected:0];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MUDisclosureActionRowView;
  [(MUPlaceSectionRowView *)&v5 touchesCancelled:a3 withEvent:a4];
  [(MUPlaceSectionRowView *)self setSelected:0];
}

- (MUDisclosureActionViewModelProviding)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleValueLayoutGuide, 0);
}

@end