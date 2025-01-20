@interface HUMosaicCameraErrorView
- (BOOL)visualEffectViewHidden;
- (HUMosaicCameraCellLayoutOptions)layoutOptions;
- (HUMosaicCameraErrorView)initWithFrame:(CGRect)a3;
- (NSMutableArray)constraints;
- (NSString)descriptionText;
- (NSString)titleText;
- (UIImageView)imageView;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIStackView)labelStackView;
- (UIVisualEffectView)visualEffectView;
- (void)layoutSubviews;
- (void)setConstraints:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setVisualEffectViewHidden:(BOOL)a3;
@end

@implementation HUMosaicCameraErrorView

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)HUMosaicCameraErrorView;
  [(HUMosaicCameraErrorView *)&v18 layoutSubviews];
  [(HUMosaicCameraCellLayoutOptions *)self->_layoutOptions descriptionInset];
  double v4 = v3;
  v5 = [(HUMosaicCameraErrorView *)self imageView];
  [v5 frame];
  CGRectGetMaxY(v19);
  v6 = [(HUMosaicCameraErrorView *)self labelStackView];
  [v6 frame];
  int v7 = NACGFloatGreaterThanOrEqualToFloat();

  if (v7)
  {
    [(HUMosaicCameraErrorView *)self bounds];
    double v9 = v8 * 0.3;
    v10 = [(HUMosaicCameraErrorView *)self labelStackView];
    [v10 frame];
    double v12 = v11 + v4 * -2.0;

    if (v9 >= v12) {
      double v9 = v12;
    }
    v13 = [(HUMosaicCameraErrorView *)self labelStackView];
    [v13 frame];
    double v15 = (v14 - v9) * 0.5;

    if ([(HUMosaicCameraErrorView *)self effectiveUserInterfaceLayoutDirection] == 1)
    {
      [(HUMosaicCameraErrorView *)self bounds];
      double v4 = v16 - v9 * 1.22 - v4;
    }
    v17 = [(HUMosaicCameraErrorView *)self imageView];
    objc_msgSend(v17, "setFrame:", v4, v15, v9 * 1.22, v9);
  }
}

- (void)setVisualEffectViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUMosaicCameraErrorView *)self visualEffectView];
  [v4 setHidden:v3];
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  v5 = [(HUMosaicCameraErrorView *)self titleLabel];
  [v5 setText:v4];

  id v6 = [(HUMosaicCameraErrorView *)self titleLabel];
  [v6 setHidden:v4 == 0];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setDescriptionText:(id)a3
{
  id v4 = a3;
  v5 = [(HUMosaicCameraErrorView *)self descriptionLabel];
  [v5 setText:v4];

  id v6 = [(HUMosaicCameraErrorView *)self descriptionLabel];
  [v6 setHidden:v4 == 0];
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (HUMosaicCameraErrorView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v67[11] = *MEMORY[0x1E4F143B8];
  v66.receiver = self;
  v66.super_class = (Class)HUMosaicCameraErrorView;
  v5 = -[HUMosaicCameraErrorView initWithFrame:](&v66, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
    visualEffectView = v5->_visualEffectView;
    v5->_visualEffectView = (UIVisualEffectView *)v6;

    double v8 = objc_msgSend(MEMORY[0x1E4F43020], "hu_gridCellBackgroundOffEffects");
    [(UIVisualEffectView *)v5->_visualEffectView setBackgroundEffects:v8];

    [(UIVisualEffectView *)v5->_visualEffectView _setGroupName:@"HUMosiacCameraCell-VisualEffect"];
    [(UIVisualEffectView *)v5->_visualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUMosaicCameraErrorView *)v5 addSubview:v5->_visualEffectView];
    double v9 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_cameraErrorImage");
    uint64_t v10 = [v9 imageWithRenderingMode:2];

    v65 = (void *)v10;
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v10];
    imageView = v5->_imageView;
    v5->_imageView = (UIImageView *)v11;

    [(UIImageView *)v5->_imageView setAlpha:0.6];
    [(UIImageView *)v5->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUMosaicCameraErrorView *)v5 addSubview:v5->_imageView];
    v13 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4F42E20]);
    labelStackView = v5->_labelStackView;
    v5->_labelStackView = v13;

    uint64_t v15 = 1;
    [(UIStackView *)v5->_labelStackView setAxis:1];
    [(UIStackView *)v5->_labelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUMosaicCameraErrorView *)v5 addSubview:v5->_labelStackView];
    unint64_t v16 = HUViewSizeSubclassForViewSize(width, height);
    if (v16 <= 0xA) {
      uint64_t v15 = qword_1BEA1A1F8[v16];
    }
    uint64_t v17 = +[HUMosaicCameraCellLayoutOptions defaultOptionsForCellSizeSubclass:v15 viewSizeSubclass:v16];
    layoutOptions = v5->_layoutOptions;
    v5->_layoutOptions = (HUMosaicCameraCellLayoutOptions *)v17;

    CGRect v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v19;

    v21 = [(HUGridCellLayoutOptions *)v5->_layoutOptions font];
    [(UILabel *)v5->_titleLabel setFont:v21];

    v22 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UILabel *)v5->_titleLabel setColor:v22];

    [(UILabel *)v5->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UIStackView *)v5->_labelStackView addArrangedSubview:v5->_titleLabel];
    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = v23;

    v25 = [(HUMosaicCameraCellLayoutOptions *)v5->_layoutOptions secondaryLabelFont];
    [(UILabel *)v5->_descriptionLabel setFont:v25];

    v26 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.6];
    [(UILabel *)v5->_descriptionLabel setColor:v26];

    [(UILabel *)v5->_descriptionLabel setAdjustsFontForContentSizeCategory:1];
    [(UIStackView *)v5->_labelStackView addArrangedSubview:v5->_descriptionLabel];
    v64 = [(UIVisualEffectView *)v5->_visualEffectView centerXAnchor];
    v63 = [(HUMosaicCameraErrorView *)v5 centerXAnchor];
    v62 = [v64 constraintEqualToAnchor:v63];
    v67[0] = v62;
    v61 = [(UIVisualEffectView *)v5->_visualEffectView centerYAnchor];
    v60 = [(HUMosaicCameraErrorView *)v5 centerYAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v67[1] = v59;
    v58 = [(UIVisualEffectView *)v5->_visualEffectView widthAnchor];
    v57 = [(HUMosaicCameraErrorView *)v5 widthAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v67[2] = v56;
    v55 = [(UIVisualEffectView *)v5->_visualEffectView heightAnchor];
    v54 = [(HUMosaicCameraErrorView *)v5 heightAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    v67[3] = v53;
    v52 = [(UIImageView *)v5->_imageView heightAnchor];
    v51 = [(HUMosaicCameraErrorView *)v5 heightAnchor];
    v50 = [v52 constraintEqualToAnchor:v51 multiplier:0.3];
    v67[4] = v50;
    v49 = [(UIImageView *)v5->_imageView widthAnchor];
    v48 = [(UIImageView *)v5->_imageView heightAnchor];
    v47 = [v49 constraintEqualToAnchor:v48 multiplier:1.22];
    v67[5] = v47;
    v46 = [(UIImageView *)v5->_imageView centerXAnchor];
    v45 = [(HUMosaicCameraErrorView *)v5 centerXAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v67[6] = v44;
    v43 = [(UIImageView *)v5->_imageView centerYAnchor];
    v42 = [(HUMosaicCameraErrorView *)v5 centerYAnchor];
    [(HUMosaicCameraCellLayoutOptions *)v5->_layoutOptions descriptionInset];
    v40 = [v43 constraintEqualToAnchor:v42 constant:-v27];
    v67[7] = v40;
    v28 = [(UIStackView *)v5->_labelStackView bottomAnchor];
    v29 = [(HUMosaicCameraErrorView *)v5 bottomAnchor];
    [(HUMosaicCameraCellLayoutOptions *)v5->_layoutOptions descriptionInset];
    v31 = [v28 constraintEqualToAnchor:v29 constant:-v30];
    v67[8] = v31;
    v32 = [(UIStackView *)v5->_labelStackView leadingAnchor];
    v33 = [(HUMosaicCameraErrorView *)v5 leadingAnchor];
    [(HUMosaicCameraCellLayoutOptions *)v5->_layoutOptions descriptionInset];
    v34 = objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33);
    v67[9] = v34;
    v35 = [(UIStackView *)v5->_labelStackView trailingAnchor];
    v36 = [(HUMosaicCameraErrorView *)v5 trailingAnchor];
    [(HUMosaicCameraCellLayoutOptions *)v5->_layoutOptions descriptionInset];
    v38 = [v35 constraintEqualToAnchor:v36 constant:-v37];
    v67[10] = v38;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:11];

    [MEMORY[0x1E4F28DC8] activateConstraints:v41];
  }
  return v5;
}

- (NSString)titleText
{
  v2 = [(HUMosaicCameraErrorView *)self titleLabel];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (NSString)descriptionText
{
  v2 = [(HUMosaicCameraErrorView *)self descriptionLabel];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (BOOL)visualEffectViewHidden
{
  v2 = [(HUMosaicCameraErrorView *)self visualEffectView];
  char v3 = [v2 isHidden];

  return v3;
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (HUMosaicCameraCellLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end