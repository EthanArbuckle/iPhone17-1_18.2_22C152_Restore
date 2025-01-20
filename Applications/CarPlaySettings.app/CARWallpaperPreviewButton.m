@interface CARWallpaperPreviewButton
- (CARWallpaperPreviewButton)initWithFrame:(CGRect)a3;
- (UIView)focusHighlightView;
- (UIView)platterView;
- (UIVisualEffectView)darkMaterial;
- (UIVisualEffectView)lightMaterial;
- (void)_updateMaterialForInterfaceStyle:(int64_t)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setDarkMaterial:(id)a3;
- (void)setFocusHighlightView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLightMaterial:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CARWallpaperPreviewButton

- (CARWallpaperPreviewButton)initWithFrame:(CGRect)a3
{
  v84.receiver = self;
  v84.super_class = (Class)CARWallpaperPreviewButton;
  v3 = -[CARWallpaperPreviewButton initWithFrame:](&v84, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CARWallpaperPreviewButton *)v3 layer];
    [v5 setCornerRadius:18.0];

    v6 = [(CARWallpaperPreviewButton *)v4 layer];
    [v6 setMasksToBounds:1];

    uint64_t v7 = objc_opt_new();
    platterView = v4->_platterView;
    v4->_platterView = (UIView *)v7;

    [(UIView *)v4->_platterView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_platterView setUserInteractionEnabled:0];
    [(CARWallpaperPreviewButton *)v4 addSubview:v4->_platterView];
    v83 = +[UIBlurEffect effectWithBlurRadius:30.0];
    v9 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v83];
    lightMaterial = v4->_lightMaterial;
    v4->_lightMaterial = v9;

    [(UIVisualEffectView *)v4->_lightMaterial setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_platterView addSubview:v4->_lightMaterial];
    v82 = +[UIColorEffect colorEffectSaturate:3.0];
    v81 = +[UIBlurEffect effectWithBlurRadius:20.0];
    v11 = +[UIColor systemBlackColor];
    v80 = +[UIVisualEffect effectCompositingColor:v11 withMode:7 alpha:0.6];

    v12 = (UIVisualEffectView *)objc_alloc_init((Class)UIVisualEffectView);
    darkMaterial = v4->_darkMaterial;
    v4->_darkMaterial = v12;

    v90[0] = v82;
    v90[1] = v81;
    v90[2] = v80;
    v14 = +[NSArray arrayWithObjects:v90 count:3];
    [(UIVisualEffectView *)v4->_darkMaterial setBackgroundEffects:v14];

    [(UIVisualEffectView *)v4->_darkMaterial setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIVisualEffectView *)v4->_darkMaterial setUserInteractionEnabled:0];
    [(UIView *)v4->_platterView addSubview:v4->_darkMaterial];
    uint64_t v15 = objc_opt_new();
    focusHighlightView = v4->_focusHighlightView;
    v4->_focusHighlightView = (UIView *)v15;

    v17 = +[UIColor _carSystemFocusColor];
    [(UIView *)v4->_focusHighlightView setBackgroundColor:v17];

    [(UIView *)v4->_focusHighlightView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_focusHighlightView setUserInteractionEnabled:0];
    [(UIView *)v4->_focusHighlightView setHidden:1];
    [(CARWallpaperPreviewButton *)v4 addSubview:v4->_focusHighlightView];
    v18 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline addingSymbolicTraits:2 options:1];
    UIFontDescriptorTraitKey v88 = UIFontWeightTrait;
    v19 = +[NSNumber numberWithDouble:UIFontWeightBold];
    v89 = v19;
    v79 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];

    UIFontDescriptorAttributeName v86 = UIFontDescriptorTraitsAttribute;
    v87 = v79;
    v20 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    v78 = [v18 fontDescriptorByAddingAttributes:v20];

    v21 = +[UIFont fontWithDescriptor:v78 size:0.0];
    v22 = [(CARWallpaperPreviewButton *)v4 titleLabel];
    [v22 setFont:v21];

    v23 = +[UIColor labelColor];
    [(CARWallpaperPreviewButton *)v4 setTitleColor:v23 forState:0];

    v24 = +[UIColor _carSystemFocusLabelColor];
    [(CARWallpaperPreviewButton *)v4 setTitleColor:v24 forState:8];

    v25 = +[UIColor _carSystemFocusLabelColor];
    [(CARWallpaperPreviewButton *)v4 setTitleColor:v25 forState:1];

    v26 = +[UIColor _carSystemFocusLabelColor];
    [(CARWallpaperPreviewButton *)v4 setTitleColor:v26 forState:9];

    v77 = [(UIView *)v4->_platterView leadingAnchor];
    v76 = [(CARWallpaperPreviewButton *)v4 leadingAnchor];
    v75 = [v77 constraintEqualToAnchor:v76];
    v85[0] = v75;
    v74 = [(UIView *)v4->_platterView trailingAnchor];
    v73 = [(CARWallpaperPreviewButton *)v4 trailingAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v85[1] = v72;
    v71 = [(UIView *)v4->_platterView topAnchor];
    v70 = [(CARWallpaperPreviewButton *)v4 topAnchor];
    v69 = [v71 constraintEqualToAnchor:v70];
    v85[2] = v69;
    v68 = [(UIView *)v4->_platterView bottomAnchor];
    v67 = [(CARWallpaperPreviewButton *)v4 bottomAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v85[3] = v66;
    v65 = [(UIVisualEffectView *)v4->_lightMaterial leadingAnchor];
    v64 = [(UIView *)v4->_platterView leadingAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v85[4] = v63;
    v62 = [(UIVisualEffectView *)v4->_lightMaterial trailingAnchor];
    v61 = [(UIView *)v4->_platterView trailingAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v85[5] = v60;
    v59 = [(UIVisualEffectView *)v4->_lightMaterial topAnchor];
    v58 = [(UIView *)v4->_platterView topAnchor];
    v57 = [v59 constraintEqualToAnchor:v58];
    v85[6] = v57;
    v56 = [(UIVisualEffectView *)v4->_lightMaterial bottomAnchor];
    v55 = [(UIView *)v4->_platterView bottomAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v85[7] = v54;
    v53 = [(UIVisualEffectView *)v4->_darkMaterial leadingAnchor];
    v52 = [(UIView *)v4->_platterView leadingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v85[8] = v51;
    v50 = [(UIVisualEffectView *)v4->_darkMaterial trailingAnchor];
    v49 = [(UIView *)v4->_platterView trailingAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v85[9] = v48;
    v47 = [(UIVisualEffectView *)v4->_darkMaterial topAnchor];
    v46 = [(UIView *)v4->_platterView topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v85[10] = v45;
    v44 = [(UIVisualEffectView *)v4->_darkMaterial bottomAnchor];
    v43 = [(UIView *)v4->_platterView bottomAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v85[11] = v42;
    v41 = [(UIView *)v4->_focusHighlightView leadingAnchor];
    v40 = [(CARWallpaperPreviewButton *)v4 leadingAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v85[12] = v39;
    v38 = [(UIView *)v4->_focusHighlightView trailingAnchor];
    v27 = [(CARWallpaperPreviewButton *)v4 trailingAnchor];
    v28 = [v38 constraintEqualToAnchor:v27];
    v85[13] = v28;
    v29 = [(UIView *)v4->_focusHighlightView topAnchor];
    v30 = [(CARWallpaperPreviewButton *)v4 topAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v85[14] = v31;
    v32 = [(UIView *)v4->_focusHighlightView bottomAnchor];
    v33 = [(CARWallpaperPreviewButton *)v4 bottomAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    v85[15] = v34;
    v35 = +[NSArray arrayWithObjects:v85 count:16];
    +[NSLayoutConstraint activateConstraints:v35];

    v36 = [(CARWallpaperPreviewButton *)v4 traitCollection];
    -[CARWallpaperPreviewButton _updateMaterialForInterfaceStyle:](v4, "_updateMaterialForInterfaceStyle:", [v36 userInterfaceStyle]);
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CARWallpaperPreviewButton;
  [(CARWallpaperPreviewButton *)&v5 setHighlighted:a3];
  v4 = [(CARWallpaperPreviewButton *)self traitCollection];
  -[CARWallpaperPreviewButton _updateMaterialForInterfaceStyle:](self, "_updateMaterialForInterfaceStyle:", [v4 userInterfaceStyle]);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v7 = [a3 nextFocusedItem];
  BOOL v5 = v7 != self;
  v6 = [(CARWallpaperPreviewButton *)self focusHighlightView];
  [v6 setHidden:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CARWallpaperPreviewButton;
  [(CARWallpaperPreviewButton *)&v5 traitCollectionDidChange:a3];
  v4 = [(CARWallpaperPreviewButton *)self traitCollection];
  -[CARWallpaperPreviewButton _updateMaterialForInterfaceStyle:](self, "_updateMaterialForInterfaceStyle:", [v4 userInterfaceStyle]);
}

- (void)_updateMaterialForInterfaceStyle:(int64_t)a3
{
  unsigned int v5 = [(CARWallpaperPreviewButton *)self isHighlighted];
  uint64_t v6 = 1;
  if (v5) {
    uint64_t v6 = 2;
  }
  if (v6 == a3)
  {
    uint64_t v7 = +[UIColor whiteColor];
    v8 = [v7 colorWithAlphaComponent:0.7];
    v9 = [(CARWallpaperPreviewButton *)self platterView];
    [v9 setBackgroundColor:v8];

    v10 = [(CARWallpaperPreviewButton *)self lightMaterial];
    [v10 setHidden:0];

    v11 = [(CARWallpaperPreviewButton *)self darkMaterial];
    id v16 = v11;
    uint64_t v12 = 1;
  }
  else
  {
    v13 = +[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:0.6];
    v14 = [(CARWallpaperPreviewButton *)self platterView];
    [v14 setBackgroundColor:v13];

    uint64_t v15 = [(CARWallpaperPreviewButton *)self lightMaterial];
    [v15 setHidden:1];

    v11 = [(CARWallpaperPreviewButton *)self darkMaterial];
    id v16 = v11;
    uint64_t v12 = 0;
  }
  [v11 setHidden:v12];
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (UIVisualEffectView)darkMaterial
{
  return self->_darkMaterial;
}

- (void)setDarkMaterial:(id)a3
{
}

- (UIVisualEffectView)lightMaterial
{
  return self->_lightMaterial;
}

- (void)setLightMaterial:(id)a3
{
}

- (UIView)focusHighlightView
{
  return self->_focusHighlightView;
}

- (void)setFocusHighlightView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusHighlightView, 0);
  objc_storeStrong((id *)&self->_lightMaterial, 0);
  objc_storeStrong((id *)&self->_darkMaterial, 0);

  objc_storeStrong((id *)&self->_platterView, 0);
}

@end