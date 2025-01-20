@interface CPUIBannerViewButton
+ (id)_chevronImageForTraitCollection:(id)a3;
+ (id)buttonWithChevronImage;
+ (id)buttonWithOK;
+ (id)buttonWithText:(id)a3;
- (BOOL)wantsChevronImage;
- (CPUIBannerViewButton)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)imageCenterConstraint;
- (UIImageView)imageView;
- (UILabel)textLabel;
- (UIView)highlightView;
- (void)_setupImagesIfNecessary;
- (void)_updateFontIfNecessary;
- (void)_updateImageConstraint;
- (void)setHighlightView:(id)a3;
- (void)setImageCenterConstraint:(id)a3;
- (void)setImageView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTextLabel:(id)a3;
- (void)setWantsChevronImage:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPUIBannerViewButton

- (CPUIBannerViewButton)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CPUIBannerViewButton;
  v3 = -[CPUIBannerViewButton initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    [(CPUIBannerViewButton *)v3 bounds];
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    [(UIView *)v5 setBackgroundColor:v6];

    [(CPUIBannerViewButton *)v3 addSubview:v5];
    highlightView = v3->_highlightView;
    v3->_highlightView = v5;
    v8 = v5;

    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    [(UIImageView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v9 setHidden:1];
    [(CPUIBannerViewButton *)v3 addSubview:v9];
    imageView = v3->_imageView;
    v3->_imageView = v9;
  }
  return v3;
}

+ (id)buttonWithOK
{
  v3 = CPUILocalizedStringForKey(@"BANNER_OKAY");
  id v4 = [a1 buttonWithText:v3];

  return v4;
}

+ (id)buttonWithText:(id)a3
{
  v49[10] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F828E0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setText:v5];

  [v7 setTextAlignment:1];
  [v7 sizeToFit];
  id v8 = objc_alloc((Class)a1);
  [v7 frame];
  CGFloat v9 = CGRectGetWidth(v51) + 12.0;
  [v7 frame];
  v10 = objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, v9, CGRectGetHeight(v52) + 8.0);
  [v10 setTextLabel:v7];
  [v10 addSubview:v7];
  [v10 _updateFontIfNecessary];
  v11 = [v10 highlightView];
  objc_super v12 = [v11 layer];
  [v12 setCornerRadius:6.0];

  v13 = [v11 layer];
  [v13 setCornerCurve:*MEMORY[0x263F15A20]];

  v14 = [MEMORY[0x263F825C8] clearColor];
  [v10 setBackgroundColor:v14];

  [v10 setSelected:0];
  v36 = (void *)MEMORY[0x263F08938];
  v48 = [v10 leftAnchor];
  v47 = [v7 leftAnchor];
  v46 = [v48 constraintEqualToAnchor:v47 constant:-6.0];
  v49[0] = v46;
  v45 = [v10 rightAnchor];
  v44 = [v7 rightAnchor];
  v43 = [v45 constraintEqualToAnchor:v44 constant:6.0];
  v49[1] = v43;
  v42 = [v10 topAnchor];
  v41 = [v7 topAnchor];
  v40 = [v42 constraintEqualToAnchor:v41 constant:-4.0];
  v49[2] = v40;
  v39 = [v10 bottomAnchor];
  v38 = [v7 bottomAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 constant:4.0];
  v49[3] = v37;
  v35 = [v10 centerXAnchor];
  v34 = [v7 centerXAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v49[4] = v33;
  v31 = [v10 centerYAnchor];
  v30 = [v7 centerYAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v49[5] = v29;
  v28 = [v11 leftAnchor];
  v27 = [v10 leftAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v49[6] = v26;
  v25 = [v11 rightAnchor];
  v24 = [v10 rightAnchor];
  v15 = [v25 constraintEqualToAnchor:v24];
  v49[7] = v15;
  v32 = v11;
  v16 = [v11 topAnchor];
  v17 = [v10 topAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v49[8] = v18;
  v19 = [v11 bottomAnchor];
  v20 = [v10 bottomAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v49[9] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:10];
  [v36 activateConstraints:v22];

  return v10;
}

+ (id)buttonWithChevronImage
{
  v35[8] = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(objc_alloc((Class)a1), "initWithFrame:", 0.0, 0.0, 29.0, 29.0);
  v3 = [v2 imageView];
  [v3 setHidden:0];

  [v2 setWantsChevronImage:1];
  id v4 = [MEMORY[0x263F825C8] clearColor];
  [v2 setBackgroundColor:v4];

  id v5 = [v2 highlightView];
  id v6 = [v5 layer];
  [v6 setCornerRadius:14.5];

  v7 = [v2 imageView];
  id v8 = [v7 centerXAnchor];
  CGFloat v9 = [v2 centerXAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v2 setImageCenterConstraint:v10];

  v25 = (void *)MEMORY[0x263F08938];
  v34 = [v2 imageView];
  v33 = [v34 centerYAnchor];
  v32 = [v2 centerYAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v35[0] = v31;
  v30 = [v2 imageCenterConstraint];
  v35[1] = v30;
  v29 = [v5 widthAnchor];
  v28 = [v29 constraintEqualToConstant:29.0];
  v35[2] = v28;
  v27 = [v5 heightAnchor];
  v26 = [v27 constraintEqualToConstant:29.0];
  v35[3] = v26;
  v24 = [v2 leftAnchor];
  v23 = [v5 leftAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v35[4] = v22;
  v21 = [v2 rightAnchor];
  v20 = [v5 rightAnchor];
  v11 = [v21 constraintEqualToAnchor:v20];
  v35[5] = v11;
  objc_super v12 = [v2 topAnchor];
  v13 = [v5 topAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v35[6] = v14;
  v15 = [v2 bottomAnchor];
  v16 = [v5 bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v35[7] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:8];
  [v25 activateConstraints:v18];

  [v2 _setupImagesIfNecessary];
  [v2 _updateImageConstraint];
  [v2 setSelected:0];

  return v2;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPUIBannerViewButton;
  -[CPUIBannerViewButton setSelected:](&v9, sel_setSelected_);
  id v5 = [(CPUIBannerViewButton *)self highlightView];
  [v5 setHidden:!v3];

  if (v3) {
    [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  }
  else {
  id v6 = [MEMORY[0x263F825C8] _carSystemFocusColor];
  }
  v7 = [(CPUIBannerViewButton *)self imageView];
  [v7 setTintColor:v6];

  id v8 = [(CPUIBannerViewButton *)self textLabel];
  [v8 setTextColor:v6];

  [(CPUIBannerViewButton *)self _setupImagesIfNecessary];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPUIBannerViewButton;
  [(CPUIBannerViewButton *)&v4 traitCollectionDidChange:a3];
  [(CPUIBannerViewButton *)self _updateFontIfNecessary];
  [(CPUIBannerViewButton *)self _setupImagesIfNecessary];
  [(CPUIBannerViewButton *)self _updateImageConstraint];
}

- (void)_setupImagesIfNecessary
{
  if ([(CPUIBannerViewButton *)self wantsChevronImage])
  {
    BOOL v3 = objc_opt_class();
    objc_super v4 = [(CPUIBannerViewButton *)self traitCollection];
    id v6 = [v3 _chevronImageForTraitCollection:v4];

    id v5 = [(CPUIBannerViewButton *)self imageView];
    [v5 setImage:v6];
  }
}

- (void)_updateFontIfNecessary
{
  v17[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(CPUIBannerViewButton *)self textLabel];

  if (v3)
  {
    objc_super v4 = (void *)MEMORY[0x263F81720];
    uint64_t v5 = *MEMORY[0x263F83580];
    id v6 = [(CPUIBannerViewButton *)self traitCollection];
    v7 = [v4 preferredFontDescriptorWithTextStyle:v5 compatibleWithTraitCollection:v6];

    uint64_t v16 = *MEMORY[0x263F81850];
    id v8 = [NSNumber numberWithDouble:*MEMORY[0x263F81800]];
    v17[0] = v8;
    objc_super v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];

    uint64_t v14 = *MEMORY[0x263F817A0];
    v15 = v9;
    v10 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v11 = [v7 fontDescriptorByAddingAttributes:v10];

    objc_super v12 = [MEMORY[0x263F81708] fontWithDescriptor:v11 size:0.0];
    v13 = [(CPUIBannerViewButton *)self textLabel];
    [v13 setFont:v12];
  }
}

- (void)_updateImageConstraint
{
  BOOL v3 = [(CPUIBannerViewButton *)self traitCollection];
  uint64_t v4 = [v3 layoutDirection];

  double v5 = 0.0;
  if (v4 == 1)
  {
    id v6 = [(CPUIBannerViewButton *)self traitCollection];
    [v6 displayScale];
    if (v7 <= 2.0) {
      double v5 = -2.5;
    }
    else {
      double v5 = -2.0;
    }
  }
  id v8 = [(CPUIBannerViewButton *)self imageCenterConstraint];
  [v8 setConstant:v5];
}

+ (id)_chevronImageForTraitCollection:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x263F81720];
  uint64_t v4 = *MEMORY[0x263F83580];
  id v5 = a3;
  id v6 = [v3 preferredFontDescriptorWithTextStyle:v4];
  double v7 = [MEMORY[0x263F81708] fontWithDescriptor:v6 size:0.0];
  uint64_t v19 = *MEMORY[0x263F81850];
  id v8 = [NSNumber numberWithDouble:*MEMORY[0x263F81838]];
  v20[0] = v8;
  objc_super v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];

  uint64_t v17 = *MEMORY[0x263F817A0];
  v18 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v11 = [v6 fontDescriptorByAddingAttributes:v10];

  objc_super v12 = (void *)MEMORY[0x263F82818];
  [v7 pointSize];
  v13 = objc_msgSend(v12, "configurationWithPointSize:weight:scale:", 9, 1);
  uint64_t v14 = [v13 configurationWithTraitCollection:v5];

  v15 = [MEMORY[0x263F827E8] systemImageNamed:@"chevron.forward" withConfiguration:v14];

  return v15;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (BOOL)wantsChevronImage
{
  return self->_wantsChevronImage;
}

- (void)setWantsChevronImage:(BOOL)a3
{
  self->_wantsChevronImage = a3;
}

- (NSLayoutConstraint)imageCenterConstraint
{
  return self->_imageCenterConstraint;
}

- (void)setImageCenterConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCenterConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end