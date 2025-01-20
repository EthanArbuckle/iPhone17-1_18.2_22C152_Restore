@interface MUAmenityItemView
- (MUAmenityItemView)initWithFrame:(CGRect)a3;
- (MUAmenityItemViewModel)viewModel;
- (void)_contentSizeDidChange;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)setViewModel:(id)a3;
@end

@implementation MUAmenityItemView

- (MUAmenityItemView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUAmenityItemView;
  v3 = -[MKViewWithHairline initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUAmenityItemView *)v3 setAccessibilityIdentifier:@"AmenityItem"];
    [(MUAmenityItemView *)v4 _setupSubviews];
    [(MUAmenityItemView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupSubviews
{
  _createAmenityImageView();
  v3 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  imageView = self->_imageView;
  self->_imageView = v3;

  [(UIImageView *)self->_imageView setContentMode:1];
  v5 = self->_imageView;
  objc_super v6 = (void *)MEMORY[0x1E4FB1830];
  v7 = [MEMORY[0x1E4F30EA8] sharedManager];
  v8 = [v7 bodyFont];
  v9 = [v6 configurationWithFont:v8 scale:1];
  [(UIImageView *)v5 setPreferredSymbolConfiguration:v9];

  [(UIImageView *)self->_imageView setAccessibilityIdentifier:@"AmenityItemImage"];
  [(MUAmenityItemView *)self addSubview:self->_imageView];
  v10 = +[MUInfoCardStyle labelForProminence:0];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v10;

  [(MULabelViewProtocol *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [MEMORY[0x1E4F30EA8] sharedManager];
  v13 = [v12 bodyFont];
  [(MULabelViewProtocol *)self->_titleLabel setFont:v13];

  [(MULabelViewProtocol *)self->_titleLabel setNumberOfLines:0];
  [(MULabelViewProtocol *)self->_titleLabel setAccessibilityIdentifier:@"AmenityItemTitle"];
  [(MUAmenityItemView *)self addSubview:self->_titleLabel];
  id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 addObserver:self selector:sel__contentSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];
}

- (void)_setupConstraints
{
  v32[8] = *MEMORY[0x1E4F143B8];
  v3 = [(UIImageView *)self->_imageView widthAnchor];
  v4 = [MEMORY[0x1E4F30EA8] sharedManager];
  v5 = [v4 bodyFont];
  [v5 _scaledValueForValue:24.0];
  objc_msgSend(v3, "constraintEqualToConstant:");
  objc_super v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageWidthConstraint = self->_imageWidthConstraint;
  self->_imageWidthConstraint = v6;

  v22 = (void *)MEMORY[0x1E4F28DC8];
  v31 = [(UIImageView *)self->_imageView leadingAnchor];
  v30 = [(MUAmenityItemView *)self leadingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v32[0] = v29;
  v28 = [(UIImageView *)self->_imageView topAnchor];
  v27 = [(MUAmenityItemView *)self topAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v32[1] = v26;
  v25 = [(UIImageView *)self->_imageView bottomAnchor];
  v24 = [(MUAmenityItemView *)self bottomAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v8 = self->_imageWidthConstraint;
  v32[2] = v23;
  v32[3] = v8;
  v21 = [(MULabelViewProtocol *)self->_titleLabel leadingAnchor];
  v20 = [(UIImageView *)self->_imageView trailingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20 constant:10.0];
  v32[4] = v19;
  v9 = [(MULabelViewProtocol *)self->_titleLabel trailingAnchor];
  v10 = [(MUAmenityItemView *)self trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v32[5] = v11;
  v12 = [(MULabelViewProtocol *)self->_titleLabel topAnchor];
  v13 = [(MUAmenityItemView *)self topAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];
  v32[6] = v14;
  v15 = [(MULabelViewProtocol *)self->_titleLabel bottomAnchor];
  v16 = [(MUAmenityItemView *)self bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v32[7] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:8];
  [v22 activateConstraints:v18];
}

- (void)setViewModel:(id)a3
{
  v5 = (MUAmenityItemViewModel *)a3;
  p_viewModel = &self->_viewModel;
  if (self->_viewModel != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_viewModel, a3);
    p_viewModel = (MUAmenityItemViewModel **)[(MUAmenityItemView *)self _updateAppearance];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_viewModel, v5);
}

- (void)_updateAppearance
{
  v3 = [(MUAmenityItemViewModel *)self->_viewModel displayTitle];
  [(MULabelViewProtocol *)self->_titleLabel setText:v3];

  imageView = self->_imageView;
  viewModel = self->_viewModel;
  id v8 = [MEMORY[0x1E4F30EA8] sharedManager];
  objc_super v6 = [v8 bodyFont];
  v7 = [(MUAmenityItemViewModel *)viewModel symbolImageForFont:v6];
  [(UIImageView *)imageView setImage:v7];
}

- (void)_contentSizeDidChange
{
  v3 = [MEMORY[0x1E4F30EA8] sharedManager];
  v4 = [v3 bodyFont];
  [(MULabelViewProtocol *)self->_titleLabel setFont:v4];

  id v6 = [MEMORY[0x1E4F30EA8] sharedManager];
  v5 = [v6 bodyFont];
  [v5 _scaledValueForValue:24.0];
  -[NSLayoutConstraint setConstant:](self->_imageWidthConstraint, "setConstant:");
}

- (MUAmenityItemViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end