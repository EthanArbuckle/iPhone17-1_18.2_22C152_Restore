@interface CARWallpaperCellView
- (BOOL)canBecomeFocused;
- (BOOL)isCellFocused;
- (BOOL)isCellHighlighted;
- (BOOL)isCellSelected;
- (CARSession)carSession;
- (CARWallpaperCellView)initWithWallpaper:(id)a3 wallpaperPreferences:(id)a4;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (CRSUIWallpaper)wallpaper;
- (CRSUIWallpaperPreferences)wallpaperPreferences;
- (UIImage)backgroundImage;
- (UIView)focusRingView;
- (void)setBackgroundImage:(id)a3;
- (void)setCarSession:(id)a3;
- (void)setCellFocused:(BOOL)a3;
- (void)setCellHighlighted:(BOOL)a3;
- (void)setCellSelected:(BOOL)a3;
- (void)setFocusRingView:(id)a3;
- (void)setWallpaper:(id)a3;
- (void)setWallpaperPreferences:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CARWallpaperCellView

- (CARWallpaperCellView)initWithWallpaper:(id)a3 wallpaperPreferences:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v81.receiver = self;
  v81.super_class = (Class)CARWallpaperCellView;
  v9 = -[CARWallpaperCellView initWithFrame:](&v81, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_wallpaper, a3);
    objc_storeStrong((id *)&v10->_wallpaperPreferences, a4);
    v11 = objc_opt_new();
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v12 = +[UIColor _carSystemFocusColor];
    id v13 = [v12 CGColor];
    v14 = [v11 layer];
    [v14 setBorderColor:v13];

    v15 = [v11 layer];
    [v15 setBorderWidth:2.0];

    v16 = [v11 layer];
    [v16 setCornerRadius:9.0];

    v17 = [v11 layer];
    [v17 setMasksToBounds:1];

    [v11 setHidden:1];
    [(CARWallpaperCellView *)v10 addSubview:v11];
    v80 = v11;
    [(CARWallpaperCellView *)v10 setFocusRingView:v11];
    v18 = objc_opt_new();
    v19 = +[UIColor lightGrayColor];
    id v20 = [v19 colorWithAlphaComponent:0.5];
    id v21 = [v20 CGColor];
    v22 = [v18 layer];
    [v22 setBorderColor:v21];

    v23 = [v18 layer];
    [v23 setBorderWidth:1.0];

    v24 = [v18 layer];
    [v24 setCornerRadius:6.0];

    v25 = [v18 layer];
    [v25 setMasksToBounds:1];

    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CARWallpaperCellView *)v10 addSubview:v18];
    id v78 = v8;
    v26 = [v8 dataProvider];
    id v79 = v7;
    v27 = [v26 resolveWallpaper:v7];

    v77 = v27;
    if (v27)
    {
      v28 = [(CARWallpaperCellView *)v10 traitCollection];
      uint64_t v29 = [v27 thumbnailWithCompatibleTraitCollection:v28];

      if (v29)
      {
        id v30 = [objc_alloc((Class)UIImageView) initWithImage:v29];
      }
      else
      {
        id v30 = [v27 view];
      }
      id v31 = v30;
      v73 = (void *)v29;
      v75 = v10;
      if (!v30)
      {
        id v31 = objc_alloc_init((Class)UIView);
        v32 = +[UIColor blackColor];
        [v31 setBackgroundColor:v32];
      }
      [v31 setClipsToBounds:1];
      [v31 setContentMode:2];
      [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v18 addSubview:v31];
      v71 = [v31 leadingAnchor];
      v69 = [v18 leadingAnchor];
      v67 = [v71 constraintEqualToAnchor:v69];
      v83[0] = v67;
      v65 = [v31 trailingAnchor];
      v63 = [v18 trailingAnchor];
      v60 = [v65 constraintEqualToAnchor:v63];
      v83[1] = v60;
      v33 = [v31 topAnchor];
      v34 = [v18 topAnchor];
      v35 = [v33 constraintEqualToAnchor:v34];
      v83[2] = v35;
      v36 = [v31 bottomAnchor];
      v37 = [v18 bottomAnchor];
      [v36 constraintEqualToAnchor:v37];
      v39 = v38 = v18;
      v83[3] = v39;
      v40 = +[NSArray arrayWithObjects:v83 count:4];
      +[NSLayoutConstraint activateConstraints:v40];

      v18 = v38;
      v10 = v75;
    }
    v76 = [v80 leadingAnchor];
    v74 = [(CARWallpaperCellView *)v10 leadingAnchor];
    v72 = [v76 constraintEqualToAnchor:v74];
    v82[0] = v72;
    v70 = [v80 trailingAnchor];
    v68 = [(CARWallpaperCellView *)v10 trailingAnchor];
    v66 = [v70 constraintEqualToAnchor:v68];
    v82[1] = v66;
    v64 = [v80 topAnchor];
    v62 = [(CARWallpaperCellView *)v10 topAnchor];
    v61 = [v64 constraintEqualToAnchor:v62];
    v82[2] = v61;
    v59 = [v80 bottomAnchor];
    v58 = [(CARWallpaperCellView *)v10 bottomAnchor];
    v57 = [v59 constraintEqualToAnchor:v58];
    v82[3] = v57;
    v55 = [v18 leadingAnchor];
    v54 = [(CARWallpaperCellView *)v10 leadingAnchor];
    v53 = [v55 constraintEqualToAnchor:v54 constant:4.0];
    v82[4] = v53;
    v52 = [v18 trailingAnchor];
    v41 = [(CARWallpaperCellView *)v10 trailingAnchor];
    [v52 constraintEqualToAnchor:v41 constant:-4.0];
    v43 = v42 = v18;
    v82[5] = v43;
    v56 = v42;
    v44 = [v42 topAnchor];
    v45 = [(CARWallpaperCellView *)v10 topAnchor];
    v46 = [v44 constraintEqualToAnchor:v45 constant:4.0];
    v82[6] = v46;
    v47 = [v42 bottomAnchor];
    v48 = [(CARWallpaperCellView *)v10 bottomAnchor];
    v49 = [v47 constraintEqualToAnchor:v48 constant:-4.0];
    v82[7] = v49;
    v50 = +[NSArray arrayWithObjects:v82 count:8];
    +[NSLayoutConstraint activateConstraints:v50];

    id v8 = v78;
    id v7 = v79;
  }

  return v10;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  CGFloat width = a3.width;
  v5 = [(CARWallpaperCellView *)self carSession];
  v6 = [v5 configuration];
  id v7 = [v6 screens];
  id v8 = [v7 bs_firstObjectPassingTest:&stru_1000922B0];

  v9 = [v8 currentViewArea];
  [v9 safeFrame];

  v10 = [(CARWallpaperCellView *)self traitCollection];
  [v10 displayScale];
  UIRoundToScale();
  double v12 = v11;

  double v13 = width;
  double v14 = v12;
  result.height = v14;
  result.CGFloat width = v13;
  return result;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4 = +[UIColor _carSystemFocusColor];
  v5 = [(CARWallpaperCellView *)self traitCollection];
  v6 = [v4 resolvedColorWithTraitCollection:v5];

  id v10 = v6;
  id v7 = [v10 CGColor];
  id v8 = [(CARWallpaperCellView *)self focusRingView];
  v9 = [v8 layer];
  [v9 setBorderColor:v7];
}

- (void)setCellFocused:(BOOL)a3
{
  self->_cellFocused = a3;
  BOOL v3 = !a3;
  id v4 = [(CARWallpaperCellView *)self focusRingView];
  [v4 setHidden:v3];
}

- (BOOL)isCellFocused
{
  return self->_cellFocused;
}

- (BOOL)isCellHighlighted
{
  return self->cellHighlighted;
}

- (void)setCellHighlighted:(BOOL)a3
{
  self->cellHighlighted = a3;
}

- (BOOL)isCellSelected
{
  return self->cellSelected;
}

- (void)setCellSelected:(BOOL)a3
{
  self->cellSelected = a3;
}

- (CARSession)carSession
{
  return self->_carSession;
}

- (void)setCarSession:(id)a3
{
}

- (CRSUIWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (void)setWallpaper:(id)a3
{
}

- (CRSUIWallpaperPreferences)wallpaperPreferences
{
  return self->_wallpaperPreferences;
}

- (void)setWallpaperPreferences:(id)a3
{
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (UIView)focusRingView
{
  return self->_focusRingView;
}

- (void)setFocusRingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusRingView, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_wallpaperPreferences, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);

  objc_storeStrong((id *)&self->_carSession, 0);
}

@end