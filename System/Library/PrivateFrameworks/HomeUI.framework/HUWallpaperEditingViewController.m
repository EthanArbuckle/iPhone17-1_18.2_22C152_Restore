@interface HUWallpaperEditingViewController
- (BOOL)scrollViewHasBeenLoaded;
- (BOOL)statusBarHidden;
- (HFWallpaper)wallpaper;
- (HUWallpaperEditingViewController)initWithWallpaper:(id)a3 image:(id)a4 delegate:(id)a5;
- (HUWallpaperEditingViewControllerDelegate)delegate;
- (NSArray)layerFilters;
- (UIButton)cancelButton;
- (UIButton)setButton;
- (UIImage)image;
- (UIImageView)imageView;
- (UIScrollView)scrollView;
- (UIView)buttonContainerView;
- (UIView)buttonSeparatorView;
- (UIVisualEffectView)buttonBackgroundView;
- (_TtC6HomeUI12HUBlurButton)blurButton;
- (id)_convertDefaultBlurImage:(id)a3 toScale:(double)a4;
- (id)_createButtonConstraints;
- (id)_createButtonViews;
- (id)_croppedWallpaperInfo;
- (id)_screenScaleAdjustedImage:(id)a3;
- (id)transparentButtonWithTitle:(id)a3;
- (int64_t)preferredStatusBarUpdateAnimation;
- (void)_refreshBlurButton;
- (void)blurButtonPressed:(id)a3;
- (void)buttonPressed:(id)a3;
- (void)buttonTouchFinished:(id)a3;
- (void)buttonTouchStarted:(id)a3;
- (void)setBlurButton:(id)a3;
- (void)setButtonBackgroundView:(id)a3;
- (void)setButtonContainerView:(id)a3;
- (void)setButtonSeparatorView:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLayerFilters:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollViewHasBeenLoaded:(BOOL)a3;
- (void)setSetButton:(id)a3;
- (void)setStatusBarHidden:(BOOL)a3;
- (void)setWallpaper:(id)a3;
- (void)updateScrollViewScale;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUWallpaperEditingViewController

- (HUWallpaperEditingViewController)initWithWallpaper:(id)a3 image:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUWallpaperEditingViewController;
  v12 = [(HUWallpaperEditingViewController *)&v19 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeStrong((id *)&v13->_wallpaper, a3);
    if ([v9 type] == 4)
    {
      v14 = [MEMORY[0x1E4F42D90] mainScreen];
      [v14 scale];
      uint64_t v15 = -[HUWallpaperEditingViewController _convertDefaultBlurImage:toScale:](v13, "_convertDefaultBlurImage:toScale:", v10);
      image = v13->_image;
      v13->_image = (UIImage *)v15;
    }
    else
    {
      uint64_t v17 = [(HUWallpaperEditingViewController *)v13 _screenScaleAdjustedImage:v10];
      v14 = v13->_image;
      v13->_image = (UIImage *)v17;
    }
  }
  return v13;
}

- (id)_screenScaleAdjustedImage:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 scale];
  double v6 = v5;

  [v3 scale];
  if (v7 == v6)
  {
    id v10 = v3;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F42A80];
    id v9 = v3;
    objc_msgSend(v8, "imageWithCGImage:scale:orientation:", objc_msgSend(v9, "CGImage"), objc_msgSend(v9, "imageOrientation"), v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v11 = v10;

  return v11;
}

- (id)_convertDefaultBlurImage:(id)a3 toScale:(double)a4
{
  id v5 = a3;
  double v6 = [v5 imageAsset];
  double v7 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:1];
  v8 = [v6 imageWithTraitCollection:v7];

  id v9 = [v5 imageAsset];

  id v10 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
  id v11 = [v9 imageWithTraitCollection:v10];

  v12 = (void *)MEMORY[0x1E4F42A80];
  id v13 = v8;
  v14 = objc_msgSend(v12, "imageWithCGImage:scale:orientation:", objc_msgSend(v13, "CGImage"), objc_msgSend(v13, "imageOrientation"), a4);
  uint64_t v15 = (void *)MEMORY[0x1E4F42A80];
  id v16 = v11;
  uint64_t v17 = objc_msgSend(v15, "imageWithCGImage:scale:orientation:", objc_msgSend(v16, "CGImage"), objc_msgSend(v16, "imageOrientation"), a4);
  v18 = [v14 imageAsset];
  objc_super v19 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
  [v18 registerImage:v17 withTraitCollection:v19];

  return v14;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUWallpaperEditingViewController;
  [(HUWallpaperEditingViewController *)&v7 viewWillAppear:a3];
  [(HUWallpaperEditingViewController *)self setStatusBarHidden:1];
  v4 = [(HUWallpaperEditingViewController *)self navigationController];
  [v4 setNavigationBarHidden:1];

  double v5 = *MEMORY[0x1E4F43BF0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__HUWallpaperEditingViewController_viewWillAppear___block_invoke;
  v6[3] = &unk_1E6386018;
  v6[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:v5];
}

uint64_t __51__HUWallpaperEditingViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUWallpaperEditingViewController;
  [(HUWallpaperEditingViewController *)&v7 viewWillDisappear:a3];
  [(HUWallpaperEditingViewController *)self setStatusBarHidden:0];
  v4 = [(HUWallpaperEditingViewController *)self navigationController];
  [v4 setNavigationBarHidden:0];

  double v5 = *MEMORY[0x1E4F43BF0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__HUWallpaperEditingViewController_viewWillDisappear___block_invoke;
  v6[3] = &unk_1E6386018;
  v6[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:v5];
}

uint64_t __54__HUWallpaperEditingViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidLoad
{
  v103[1] = *MEMORY[0x1E4F143B8];
  v102.receiver = self;
  v102.super_class = (Class)HUWallpaperEditingViewController;
  [(HUWallpaperEditingViewController *)&v102 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F42DB0]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HUWallpaperEditingViewController *)self setScrollView:v4];

  double v5 = [(HUWallpaperEditingViewController *)self scrollView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v6 = [(HUWallpaperEditingViewController *)self scrollView];
  [v6 setShowsHorizontalScrollIndicator:0];

  objc_super v7 = [(HUWallpaperEditingViewController *)self scrollView];
  [v7 setShowsVerticalScrollIndicator:0];

  v8 = [MEMORY[0x1E4F428B8] systemBlackColor];
  id v9 = [(HUWallpaperEditingViewController *)self scrollView];
  [v9 setBackgroundColor:v8];

  id v10 = [(HUWallpaperEditingViewController *)self scrollView];
  [v10 setDelegate:self];

  id v11 = [(HUWallpaperEditingViewController *)self view];
  v12 = [(HUWallpaperEditingViewController *)self scrollView];
  [v11 addSubview:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F42AA0]);
  uint64_t v14 = [(HUWallpaperEditingViewController *)self image];
  uint64_t v15 = (void *)[v13 initWithImage:v14];
  [(HUWallpaperEditingViewController *)self setImageView:v15];

  id v16 = [(HUWallpaperEditingViewController *)self wallpaper];
  LOBYTE(v14) = [v16 isCustomType];

  if (v14)
  {
    uint64_t v17 = [(HUWallpaperEditingViewController *)self image];
    [v17 size];
    double v19 = v18;
    double v21 = v20;
    v22 = [(HUWallpaperEditingViewController *)self scrollView];
    objc_msgSend(v22, "setContentSize:", v19, v21);
  }
  else
  {
    v23 = [(HUWallpaperEditingViewController *)self imageView];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

    v24 = [(HUWallpaperEditingViewController *)self imageView];
    [v24 setContentMode:2];

    uint64_t v17 = [(HUWallpaperEditingViewController *)self scrollView];
    [v17 setUserInteractionEnabled:0];
  }

  v25 = [(HUWallpaperEditingViewController *)self scrollView];
  v26 = [(HUWallpaperEditingViewController *)self imageView];
  [v25 addSubview:v26];

  v27 = [(HUWallpaperEditingViewController *)self scrollView];
  [v27 setContentInsetAdjustmentBehavior:2];

  id v28 = [(HUWallpaperEditingViewController *)self _createButtonViews];
  v29 = [MEMORY[0x1E4F1CA48] array];
  v30 = [(HUWallpaperEditingViewController *)self scrollView];
  v31 = [v30 topAnchor];
  v32 = [(HUWallpaperEditingViewController *)self view];
  v33 = [v32 topAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  [v29 addObject:v34];

  v35 = [(HUWallpaperEditingViewController *)self scrollView];
  v36 = [v35 leadingAnchor];
  v37 = [(HUWallpaperEditingViewController *)self view];
  v38 = [v37 leadingAnchor];
  v39 = [v36 constraintEqualToAnchor:v38];
  [v29 addObject:v39];

  v40 = [(HUWallpaperEditingViewController *)self scrollView];
  v41 = [v40 trailingAnchor];
  v42 = [(HUWallpaperEditingViewController *)self view];
  v43 = [v42 trailingAnchor];
  v44 = [v41 constraintEqualToAnchor:v43];
  [v29 addObject:v44];

  v45 = [(HUWallpaperEditingViewController *)self scrollView];
  v46 = [v45 bottomAnchor];
  v47 = [(HUWallpaperEditingViewController *)self view];
  v48 = [v47 bottomAnchor];
  v49 = [v46 constraintEqualToAnchor:v48];
  [v29 addObject:v49];

  v50 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  v51 = [v50 leadingAnchor];
  v52 = [(HUWallpaperEditingViewController *)self view];
  v53 = [v52 leadingAnchor];
  v54 = [v51 constraintEqualToAnchor:v53];
  [v29 addObject:v54];

  v55 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  v56 = [v55 trailingAnchor];
  v57 = [(HUWallpaperEditingViewController *)self view];
  v58 = [v57 trailingAnchor];
  v59 = [v56 constraintEqualToAnchor:v58];
  [v29 addObject:v59];

  v60 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  v61 = [v60 bottomAnchor];
  v62 = [(HUWallpaperEditingViewController *)self view];
  v63 = [v62 bottomAnchor];
  v64 = [v61 constraintEqualToAnchor:v63];
  [v29 addObject:v64];

  v65 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  uint64_t v66 = [v65 topAnchor];
  v67 = [(HUWallpaperEditingViewController *)self view];
  v68 = [v67 safeAreaLayoutGuide];
  v69 = [v68 bottomAnchor];
  v70 = [(id)v66 constraintEqualToAnchor:v69 constant:-50.0];
  [v29 addObject:v70];

  v71 = [(HUWallpaperEditingViewController *)self wallpaper];
  LOBYTE(v66) = [v71 isCustomType];

  if ((v66 & 1) == 0)
  {
    v72 = [(HUWallpaperEditingViewController *)self imageView];
    v73 = [v72 topAnchor];
    v74 = [(HUWallpaperEditingViewController *)self view];
    v75 = [v74 topAnchor];
    v76 = [v73 constraintEqualToAnchor:v75];
    [v29 addObject:v76];

    v77 = [(HUWallpaperEditingViewController *)self imageView];
    v78 = [v77 bottomAnchor];
    v79 = [(HUWallpaperEditingViewController *)self buttonContainerView];
    v80 = [v79 bottomAnchor];
    v81 = [v78 constraintEqualToAnchor:v80];
    [v29 addObject:v81];

    v82 = [(HUWallpaperEditingViewController *)self imageView];
    v83 = [v82 leadingAnchor];
    v84 = [(HUWallpaperEditingViewController *)self view];
    v85 = [v84 safeAreaLayoutGuide];
    v86 = [v85 leadingAnchor];
    v87 = [v83 constraintEqualToAnchor:v86];
    [v29 addObject:v87];

    v88 = [(HUWallpaperEditingViewController *)self imageView];
    v89 = [v88 trailingAnchor];
    v90 = [(HUWallpaperEditingViewController *)self view];
    v91 = [v90 safeAreaLayoutGuide];
    v92 = [v91 trailingAnchor];
    v93 = [v89 constraintEqualToAnchor:v92];
    [v29 addObject:v93];
  }
  v94 = [(HUWallpaperEditingViewController *)self _createButtonConstraints];
  [v29 addObjectsFromArray:v94];

  [MEMORY[0x1E4F28DC8] activateConstraints:v29];
  v95 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v95 setValue:&unk_1F19B6100 forKey:*MEMORY[0x1E4F3A1D8]];
  [v95 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3A1B8]];
  v103[0] = v95;
  v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:1];
  [(HUWallpaperEditingViewController *)self setLayerFilters:v96];

  v97 = [(HUWallpaperEditingViewController *)self wallpaper];
  uint64_t v98 = [v97 type];
  if (v98 == 6)
  {
    v99 = [(HUWallpaperEditingViewController *)self layerFilters];
  }
  else
  {
    v99 = 0;
  }
  v100 = [(HUWallpaperEditingViewController *)self imageView];
  v101 = [v100 layer];
  [v101 setFilters:v99];

  if (v98 == 6) {
}
  }

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUWallpaperEditingViewController;
  [(HUWallpaperEditingViewController *)&v3 viewDidLayoutSubviews];
  if (![(HUWallpaperEditingViewController *)self scrollViewHasBeenLoaded])
  {
    [(HUWallpaperEditingViewController *)self updateScrollViewScale];
    [(HUWallpaperEditingViewController *)self setScrollViewHasBeenLoaded:1];
  }
}

- (void)buttonPressed:(id)a3
{
  id v4 = a3;
  id v5 = [(HUWallpaperEditingViewController *)self setButton];

  double v6 = [(HUWallpaperEditingViewController *)self delegate];
  id v15 = v6;
  if (v5 == v4)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F69778]);
    v8 = [(HUWallpaperEditingViewController *)self wallpaper];
    uint64_t v9 = [v8 type];
    id v10 = [(HUWallpaperEditingViewController *)self wallpaper];
    id v11 = [v10 assetIdentifier];
    v12 = [(HUWallpaperEditingViewController *)self _croppedWallpaperInfo];
    id v13 = (void *)[v7 initWithType:v9 assetIdentifier:v11 cropInfo:v12];
    uint64_t v14 = [(HUWallpaperEditingViewController *)self image];
    [v15 wallpaperEditing:self didFinishWithWallpaper:v13 image:v14];
  }
  else
  {
    [v6 wallpaperEditingDidCancel:self];
  }
}

- (id)_croppedWallpaperInfo
{
  objc_super v3 = [(HUWallpaperEditingViewController *)self wallpaper];
  int v4 = [v3 isCustomType];

  if (v4)
  {
    id v5 = [(HUWallpaperEditingViewController *)self image];
    [v5 scale];
    double v7 = v6;
    v8 = [(HUWallpaperEditingViewController *)self scrollView];
    [v8 zoomScale];
    double v10 = v7 / v9;

    id v11 = [(HUWallpaperEditingViewController *)self scrollView];
    [v11 contentOffset];
    double v13 = v10 * v12;
    uint64_t v14 = [(HUWallpaperEditingViewController *)self scrollView];
    [v14 contentOffset];
    double v16 = v10 * v15;

    uint64_t v17 = [(HUWallpaperEditingViewController *)self scrollView];
    [v17 bounds];
    double v19 = v10 * v18;
    double v20 = [(HUWallpaperEditingViewController *)self scrollView];
    [v20 bounds];
    double v22 = v10 * v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F690B0]), "initWithSource:center:scale:", 0, round(v13 + v19 * 0.5), round(v16 + v22 * 0.5), v10);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)buttonTouchStarted:(id)a3
{
  id v3 = a3;
  int v4 = (void *)MEMORY[0x1E4F42FF0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__HUWallpaperEditingViewController_buttonTouchStarted___block_invoke;
  v6[3] = &unk_1E6386018;
  id v7 = v3;
  id v5 = v3;
  [v4 animateWithDuration:v6 animations:0.2];
}

uint64_t __55__HUWallpaperEditingViewController_buttonTouchStarted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.3];
}

- (void)buttonTouchFinished:(id)a3
{
  id v3 = a3;
  int v4 = (void *)MEMORY[0x1E4F42FF0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__HUWallpaperEditingViewController_buttonTouchFinished___block_invoke;
  v6[3] = &unk_1E6386018;
  id v7 = v3;
  id v5 = v3;
  [v4 animateWithDuration:v6 animations:0.2];
}

uint64_t __56__HUWallpaperEditingViewController_buttonTouchFinished___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)updateScrollViewScale
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v102 = [(HUWallpaperEditingViewController *)self wallpaper];
  if ([v102 type] != 3)
  {
    id v3 = [(HUWallpaperEditingViewController *)self wallpaper];
    if ([v3 type] == 4)
    {

      goto LABEL_4;
    }
    int v4 = [(HUWallpaperEditingViewController *)self wallpaper];
    uint64_t v5 = [v4 type];

    if (v5 == 5) {
      return;
    }
    [MEMORY[0x1E4F69778] contentSizeForWallpaper];
    double v7 = v6;
    double v9 = v8;
    double v10 = [(HUWallpaperEditingViewController *)self image];
    [v10 size];
    double v12 = v7 / v11;

    double v13 = [(HUWallpaperEditingViewController *)self image];
    [v13 size];
    double v15 = v9 / v14;

    if (v12 < 1.0 && v15 < 1.0)
    {
      double v22 = [(HUWallpaperEditingViewController *)self scrollView];
      [v22 setMaximumZoomScale:1.0];

      if (v12 < v15) {
        double v12 = v15;
      }
      double v18 = [(HUWallpaperEditingViewController *)self scrollView];
      [v18 setMinimumZoomScale:v12];
    }
    else
    {
      if (v12 < v15) {
        double v12 = v15;
      }
      uint64_t v17 = [(HUWallpaperEditingViewController *)self scrollView];
      [v17 setMaximumZoomScale:v12];

      double v18 = [(HUWallpaperEditingViewController *)self scrollView];
      [v18 maximumZoomScale];
      double v20 = v19;
      double v21 = [(HUWallpaperEditingViewController *)self scrollView];
      [v21 setMinimumZoomScale:v20];
    }
    v23 = [(HUWallpaperEditingViewController *)self scrollView];
    [v23 minimumZoomScale];
    double v25 = v24;
    v26 = [(HUWallpaperEditingViewController *)self scrollView];
    [v26 setZoomScale:v25];

    v27 = [(HUWallpaperEditingViewController *)self wallpaper];
    LODWORD(v26) = [v27 isCustomType];

    if (!v26)
    {
      v41 = [(HUWallpaperEditingViewController *)self wallpaper];
      uint64_t v42 = [v41 type];

      if (v42) {
        return;
      }
      id v102 = [(HUWallpaperEditingViewController *)self scrollView];
      [v102 setBouncesZoom:0];
      goto LABEL_4;
    }
    id v28 = [(HUWallpaperEditingViewController *)self scrollView];
    [v28 maximumZoomScale];
    [v28 setMaximumZoomScale:v29 + 1.0];

    v30 = [(HUWallpaperEditingViewController *)self wallpaper];
    v31 = [v30 cropInfo];

    if (v31)
    {
      v32 = [(HUWallpaperEditingViewController *)self image];
      [v32 scale];
      double v34 = v33;
      v35 = [(HUWallpaperEditingViewController *)self wallpaper];
      v36 = [v35 cropInfo];
      [v36 scale];
      double v38 = v34 / v37;

      v39 = [(HUWallpaperEditingViewController *)self scrollView];
      [v39 minimumZoomScale];
      if (v38 >= v40)
      {
        v43 = [(HUWallpaperEditingViewController *)self scrollView];
        [v43 maximumZoomScale];
        double v45 = v44;

        if (v38 <= v45)
        {
          v63 = [(HUWallpaperEditingViewController *)self wallpaper];
          v64 = [v63 cropInfo];
          [v64 center];
          double v66 = v65;
          v67 = [(HUWallpaperEditingViewController *)self wallpaper];
          v68 = [v67 cropInfo];
          [v68 scale];
          double v70 = v66 / v69;
          v71 = [(HUWallpaperEditingViewController *)self wallpaper];
          v72 = [v71 cropInfo];
          [v72 center];
          double v74 = v73;
          v75 = [(HUWallpaperEditingViewController *)self wallpaper];
          v76 = [v75 cropInfo];
          [v76 scale];
          double v78 = v74 / v77;

          v79 = [(HUWallpaperEditingViewController *)self scrollView];
          [v79 bounds];
          double v81 = round(v70 - v80 * 0.5);

          double v82 = 0.0;
          if (v81 < 0.0) {
            double v81 = 0.0;
          }
          v83 = [(HUWallpaperEditingViewController *)self scrollView];
          [v83 bounds];
          double v85 = round(v78 - v84 * 0.5);

          if (v85 >= 0.0) {
            double v82 = v85;
          }
          v86 = [(HUWallpaperEditingViewController *)self scrollView];
          [v86 setZoomScale:v38];

          v87 = [(HUWallpaperEditingViewController *)self scrollView];
          objc_msgSend(v87, "setContentOffset:", v81, v82);

          v56 = HFLogForCategory();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            v88 = [(HUWallpaperEditingViewController *)self scrollView];
            [v88 minimumZoomScale];
            uint64_t v90 = v89;
            v91 = [(HUWallpaperEditingViewController *)self scrollView];
            [v91 maximumZoomScale];
            uint64_t v93 = v92;
            v94 = [(HUWallpaperEditingViewController *)self scrollView];
            [v94 contentOffset];
            v95 = NSStringFromCGPoint(v113);
            *(_DWORD *)buf = 134218754;
            double v104 = v38;
            __int16 v105 = 2048;
            uint64_t v106 = v90;
            __int16 v107 = 2048;
            uint64_t v108 = v93;
            __int16 v109 = 2112;
            v110 = v95;
            _os_log_debug_impl(&dword_1BE345000, v56, OS_LOG_TYPE_DEBUG, "Setting scale %f (min: %f, max %f), offset %@", buf, 0x2Au);
          }
          goto LABEL_29;
        }
      }
      else
      {
      }
      v46 = HFLogForCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v96 = [(HUWallpaperEditingViewController *)self wallpaper];
        v97 = [(HUWallpaperEditingViewController *)self scrollView];
        [v97 minimumZoomScale];
        uint64_t v99 = v98;
        v100 = [(HUWallpaperEditingViewController *)self scrollView];
        [v100 maximumZoomScale];
        *(_DWORD *)buf = 138412802;
        double v104 = *(double *)&v96;
        __int16 v105 = 2048;
        uint64_t v106 = v99;
        __int16 v107 = 2048;
        uint64_t v108 = v101;
        _os_log_error_impl(&dword_1BE345000, v46, OS_LOG_TYPE_ERROR, "Crop scale (%@) doesn't fit within scroll scales (min: %f, max: %f)", buf, 0x20u);
      }
    }
    v47 = [(HUWallpaperEditingViewController *)self scrollView];
    [v47 zoomScale];
    double v49 = v48;

    v50 = [(HUWallpaperEditingViewController *)self image];
    [v50 size];
    double v52 = v49 * v51;
    v53 = [(HUWallpaperEditingViewController *)self image];
    [v53 size];
    double v55 = v49 * v54;

    v56 = [(HUWallpaperEditingViewController *)self scrollView];
    [v56 bounds];
    double v58 = round((v52 - v57) * 0.5);
    v59 = [(HUWallpaperEditingViewController *)self scrollView];
    [v59 bounds];
    double v61 = round((v55 - v60) * 0.5);
    v62 = [(HUWallpaperEditingViewController *)self scrollView];
    objc_msgSend(v62, "setContentOffset:", v58, v61);

LABEL_29:
    return;
  }
LABEL_4:
}

- (id)_createButtonViews
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [(HUWallpaperEditingViewController *)self setButtonContainerView:v8];

  double v9 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v10 = [(HUWallpaperEditingViewController *)self view];
  double v11 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  [v10 addSubview:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F43028]);
  double v13 = [MEMORY[0x1E4F427D8] effectWithStyle:1];
  double v14 = (void *)[v12 initWithEffect:v13];
  [(HUWallpaperEditingViewController *)self setButtonBackgroundView:v14];

  double v15 = [(HUWallpaperEditingViewController *)self buttonBackgroundView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v16 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  uint64_t v17 = [(HUWallpaperEditingViewController *)self buttonBackgroundView];
  [v16 addSubview:v17];

  double v18 = _HULocalizedStringWithDefaultValue(@"HUWallpaperPickerCancelButton", @"HUWallpaperPickerCancelButton", 1);
  double v19 = [(HUWallpaperEditingViewController *)self transparentButtonWithTitle:v18];
  [(HUWallpaperEditingViewController *)self setCancelButton:v19];

  double v20 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  double v21 = [(HUWallpaperEditingViewController *)self cancelButton];
  [v20 addSubview:v21];

  double v22 = _HULocalizedStringWithDefaultValue(@"HUWallpaperPickerSetButton", @"HUWallpaperPickerSetButton", 1);
  v23 = [(HUWallpaperEditingViewController *)self transparentButtonWithTitle:v22];
  [(HUWallpaperEditingViewController *)self setSetButton:v23];

  double v24 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  double v25 = [(HUWallpaperEditingViewController *)self setButton];
  [v24 addSubview:v25];

  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v4, v5, v6, v7);
  [(HUWallpaperEditingViewController *)self setButtonSeparatorView:v26];

  v27 = [(HUWallpaperEditingViewController *)self buttonSeparatorView];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v28 = [MEMORY[0x1E4F428B8] darkGrayColor];
  double v29 = [(HUWallpaperEditingViewController *)self buttonSeparatorView];
  [v29 setBackgroundColor:v28];

  v30 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  v31 = [(HUWallpaperEditingViewController *)self buttonSeparatorView];
  [v30 addSubview:v31];

  v32 = [(HUWallpaperEditingViewController *)self wallpaper];
  LODWORD(v31) = [v32 isCustomType];

  if (v31)
  {
    double v33 = objc_alloc_init(_TtC6HomeUI12HUBlurButton);
    [(HUWallpaperEditingViewController *)self setBlurButton:v33];

    double v34 = [(HUWallpaperEditingViewController *)self blurButton];
    [v34 setTranslatesAutoresizingMaskIntoConstraints:0];

    v35 = [(HUWallpaperEditingViewController *)self blurButton];
    [v35 addTarget:self action:sel_blurButtonPressed_ forControlEvents:64];

    v36 = [(HUWallpaperEditingViewController *)self view];
    double v37 = [(HUWallpaperEditingViewController *)self blurButton];
    [v36 addSubview:v37];

    [(HUWallpaperEditingViewController *)self _refreshBlurButton];
    double v38 = [(HUWallpaperEditingViewController *)self blurButton];
    [v38 sizeToFit];
  }

  return [(HUWallpaperEditingViewController *)self buttonContainerView];
}

- (void)blurButtonPressed:(id)a3
{
  double v4 = [(HUWallpaperEditingViewController *)self wallpaper];
  uint64_t v5 = [v4 type];

  if (v5 == 1) {
    uint64_t v6 = 6;
  }
  else {
    uint64_t v6 = 1;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F69778]);
  double v8 = [(HUWallpaperEditingViewController *)self wallpaper];
  double v9 = [v8 assetIdentifier];
  double v10 = [(HUWallpaperEditingViewController *)self wallpaper];
  double v11 = [v10 cropInfo];
  id v15 = (id)[v7 initWithType:v6 assetIdentifier:v9 cropInfo:v11];

  [(HUWallpaperEditingViewController *)self setWallpaper:v15];
  if (v5 == 1)
  {
    id v12 = [(HUWallpaperEditingViewController *)self layerFilters];
  }
  else
  {
    id v12 = 0;
  }
  double v13 = [(HUWallpaperEditingViewController *)self imageView];
  double v14 = [v13 layer];
  [v14 setFilters:v12];

  if (v5 == 1) {
  [(HUWallpaperEditingViewController *)self _refreshBlurButton];
  }
}

- (void)_refreshBlurButton
{
  id v3 = [(HUWallpaperEditingViewController *)self wallpaper];
  uint64_t v4 = [v3 type];

  if (v4 == 6) {
    uint64_t v5 = @"HUWallpaperBlurOn";
  }
  else {
    uint64_t v5 = @"HUWallpaperBlurOff";
  }
  _HULocalizedStringWithDefaultValue(v5, v5, 1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(HUWallpaperEditingViewController *)self blurButton];
  [v6 setTitle:v7 forState:0];
}

- (id)_createButtonConstraints
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(HUWallpaperEditingViewController *)self buttonBackgroundView];
  uint64_t v5 = [v4 leadingAnchor];
  uint64_t v6 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  id v7 = [v6 leadingAnchor];
  double v8 = [v5 constraintEqualToAnchor:v7];
  [v3 addObject:v8];

  double v9 = [(HUWallpaperEditingViewController *)self buttonBackgroundView];
  double v10 = [v9 trailingAnchor];
  double v11 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  id v12 = [v11 trailingAnchor];
  double v13 = [v10 constraintEqualToAnchor:v12];
  [v3 addObject:v13];

  double v14 = [(HUWallpaperEditingViewController *)self buttonBackgroundView];
  id v15 = [v14 topAnchor];
  double v16 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  uint64_t v17 = [v16 topAnchor];
  double v18 = [v15 constraintEqualToAnchor:v17];
  [v3 addObject:v18];

  double v19 = [(HUWallpaperEditingViewController *)self buttonBackgroundView];
  double v20 = [v19 bottomAnchor];
  double v21 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  double v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v3 addObject:v23];

  double v24 = [(HUWallpaperEditingViewController *)self buttonSeparatorView];
  double v25 = [v24 centerXAnchor];
  v26 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  v27 = [v26 centerXAnchor];
  id v28 = [v25 constraintEqualToAnchor:v27];
  [v3 addObject:v28];

  double v29 = [(HUWallpaperEditingViewController *)self buttonSeparatorView];
  v30 = [v29 widthAnchor];
  v31 = [v30 constraintEqualToConstant:1.0];
  [v3 addObject:v31];

  v32 = [(HUWallpaperEditingViewController *)self buttonSeparatorView];
  double v33 = [v32 topAnchor];
  double v34 = [(HUWallpaperEditingViewController *)self buttonContainerView];
  v35 = [v34 topAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  [v3 addObject:v36];

  double v37 = [(HUWallpaperEditingViewController *)self buttonSeparatorView];
  double v38 = [v37 bottomAnchor];
  v39 = [(HUWallpaperEditingViewController *)self view];
  double v40 = [v39 safeAreaLayoutGuide];
  v41 = [v40 bottomAnchor];
  uint64_t v42 = [v38 constraintEqualToAnchor:v41];
  [v3 addObject:v42];

  v43 = (void *)MEMORY[0x1E4F28DC8];
  double v44 = _NSDictionaryOfVariableBindings(&cfstr_CancelbuttonSe_0.isa, self->_cancelButton, self->_setButton, 0);
  double v45 = [v43 constraintsWithVisualFormat:@"|[_cancelButton(==_setButton)][_setButton]|" options:0 metrics:0 views:v44];
  id v77 = v3;
  [v3 addObjectsFromArray:v45];

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v46 = [(HUWallpaperEditingViewController *)self cancelButton];
  v82[0] = v46;
  v76 = self;
  v47 = [(HUWallpaperEditingViewController *)self setButton];
  v82[1] = v47;
  double v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];

  id obj = v48;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v78 objects:v83 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v79 != v51) {
          objc_enumerationMutation(obj);
        }
        v53 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        double v54 = [v53 topAnchor];
        double v55 = [(HUWallpaperEditingViewController *)v76 buttonContainerView];
        v56 = [v55 topAnchor];
        double v57 = [v54 constraintEqualToAnchor:v56];
        [v77 addObject:v57];

        double v58 = [v53 bottomAnchor];
        v59 = [(HUWallpaperEditingViewController *)v76 view];
        double v60 = [v59 safeAreaLayoutGuide];
        double v61 = [v60 bottomAnchor];
        v62 = [v58 constraintEqualToAnchor:v61];
        [v77 addObject:v62];
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v78 objects:v83 count:16];
    }
    while (v50);
  }

  v63 = [(HUWallpaperEditingViewController *)v76 blurButton];

  if (v63)
  {
    v64 = [(HUWallpaperEditingViewController *)v76 blurButton];
    double v65 = [v64 centerXAnchor];
    double v66 = [(HUWallpaperEditingViewController *)v76 view];
    v67 = [v66 centerXAnchor];
    v68 = [v65 constraintEqualToAnchor:v67];
    [v77 addObject:v68];

    double v69 = [(HUWallpaperEditingViewController *)v76 blurButton];
    double v70 = [v69 bottomAnchor];
    v71 = [(HUWallpaperEditingViewController *)v76 buttonContainerView];
    v72 = [v71 topAnchor];
    double v73 = [v70 constraintEqualToAnchor:v72 constant:-40.0];
    [v77 addObject:v73];
  }

  return v77;
}

- (id)transparentButtonWithTitle:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F427E0];
  id v5 = a3;
  uint64_t v6 = [v4 buttonWithType:0];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438F8]];
  double v8 = [v6 titleLabel];
  [v8 setFont:v7];

  [v6 setTitle:v5 forState:0];
  double v9 = [MEMORY[0x1E4F428B8] systemBlackColor];
  [v6 setTitleColor:v9 forState:0];

  [v6 addTarget:self action:sel_buttonPressed_ forControlEvents:64];
  [v6 addTarget:self action:sel_buttonTouchStarted_ forControlEvents:64];
  [v6 addTarget:self action:sel_buttonTouchStarted_ forControlEvents:1];
  [v6 addTarget:self action:sel_buttonTouchStarted_ forControlEvents:16];
  [v6 addTarget:self action:sel_buttonTouchFinished_ forControlEvents:256];
  [v6 addTarget:self action:sel_buttonTouchFinished_ forControlEvents:32];

  return v6;
}

- (HUWallpaperEditingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUWallpaperEditingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)statusBarHidden
{
  return self->_statusBarHidden;
}

- (void)setStatusBarHidden:(BOOL)a3
{
  self->_statusBarHidden = a3;
}

- (BOOL)scrollViewHasBeenLoaded
{
  return self->_scrollViewHasBeenLoaded;
}

- (void)setScrollViewHasBeenLoaded:(BOOL)a3
{
  self->_scrollViewHasBeenLoaded = a3;
}

- (HFWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (void)setWallpaper:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIView)buttonContainerView
{
  return self->_buttonContainerView;
}

- (void)setButtonContainerView:(id)a3
{
}

- (UIView)buttonSeparatorView
{
  return self->_buttonSeparatorView;
}

- (void)setButtonSeparatorView:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIButton)setButton
{
  return self->_setButton;
}

- (void)setSetButton:(id)a3
{
}

- (UIVisualEffectView)buttonBackgroundView
{
  return self->_buttonBackgroundView;
}

- (void)setButtonBackgroundView:(id)a3
{
}

- (_TtC6HomeUI12HUBlurButton)blurButton
{
  return self->_blurButton;
}

- (void)setBlurButton:(id)a3
{
}

- (NSArray)layerFilters
{
  return self->_layerFilters;
}

- (void)setLayerFilters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerFilters, 0);
  objc_storeStrong((id *)&self->_blurButton, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundView, 0);
  objc_storeStrong((id *)&self->_setButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_buttonSeparatorView, 0);
  objc_storeStrong((id *)&self->_buttonContainerView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end