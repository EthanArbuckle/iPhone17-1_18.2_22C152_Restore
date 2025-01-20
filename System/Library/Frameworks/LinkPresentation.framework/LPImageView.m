@interface LPImageView
- (BOOL)shouldApplyBackground;
- (CGSize)imageSizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPImageView)initWithHost:(id)a3;
- (LPImageView)initWithHost:(id)a3 image:(id)a4 properties:(id)a5 style:(id)a6;
- (double)_effectiveCornerRadius;
- (id)_createImageViewWithImage:(id)a3;
- (id)_createOverlayViewWithOpacity:(double)a3;
- (int64_t)_filter;
- (int64_t)scalingModeForSize:(CGSize)a3;
- (void)_setImageViewScalingMode:(int64_t)a3;
- (void)_updateScalingMode;
- (void)_userInterfaceStyleDidChange:(id)a3;
- (void)ensureImageView;
- (void)installDarkeningViewIfNeeded;
- (void)layoutComponentView;
- (void)updateBorder;
- (void)updateCornerRadius;
- (void)updateShadowPath;
@end

@implementation LPImageView

- (LPImageView)initWithHost:(id)a3
{
  return 0;
}

- (LPImageView)initWithHost:(id)a3 image:(id)a4 properties:(id)a5 style:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)LPImageView;
  v14 = [(LPComponentView *)&v26 initWithHost:v10];
  p_isa = (id *)&v14->super.super.super.super.isa;
  v16 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_image, a4);
    objc_storeStrong(p_isa + 54, a5);
    objc_storeStrong(p_isa + 55, a6);
    objc_storeStrong(p_isa + 56, a6);
    if (+[LPSettings showDebugIndicators])
    {
      id v17 = [MEMORY[0x1E4FB1618] redColor];
      uint64_t v18 = [v17 CGColor];
      v19 = [(LPImageView *)v16 layer];
      [v19 setBorderColor:v18];

      v20 = [(LPImageView *)v16 layer];
      [v20 setBorderWidth:0.5];
    }
    v21 = self;
    v27[0] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    id v23 = (id)[(LPImageView *)v16 registerForTraitChanges:v22 withAction:sel__userInterfaceStyleDidChange_];

    v24 = v16;
  }

  return v16;
}

- (int64_t)_filter
{
  uint64_t v3 = LPImageViewFilterResolve(self->_image, self->_properties, self->_style);
  v4 = [(LPComponentView *)self host];
  int64_t v5 = [v4 componentView:self allowedImageFilterForFilter:v3];

  return v5;
}

- (void)ensureImageView
{
  if (!self->_imageView)
  {
    originalStyle = self->_originalStyle;
    uint64_t v4 = [(LPImageView *)self _filter];
    image = self->_image;
    [(UIView *)self _lp_backingScaleFactor];
    int64_t v7 = shouldUseIconPlatter(originalStyle, v4, image, v6);
    self->_platterReason = v7;
    if (v7)
    {
      v100 = (LPImageViewStyle *)[(LPImageViewStyle *)self->_style copy];
      v8 = +[LPTheme iconPlatterPaddingForReason:self->_platterReason];
      [v8 value];
      double v10 = v9;

      id v11 = [(LPImageViewStyle *)self->_originalStyle fixedSize];
      [v11 asSize];
      double v13 = v12;
      double v15 = v14;

      v16 = [[LPPointUnit alloc] initWithValue:(v15 - v10) * 0.5];
      id v17 = [(LPImageViewStyle *)v100 padding];
      [v17 setTop:v16];

      uint64_t v18 = [(LPImageViewStyle *)v100 padding];
      v19 = [v18 top];
      v20 = [(LPImageViewStyle *)v100 padding];
      [v20 setBottom:v19];

      v21 = [[LPPointUnit alloc] initWithValue:(v13 - v10) * 0.5];
      v22 = [(LPImageViewStyle *)v100 padding];
      [v22 setLeading:v21];

      id v23 = [(LPImageViewStyle *)v100 padding];
      v24 = [v23 leading];
      v25 = [(LPImageViewStyle *)v100 padding];
      [v25 setTrailing:v24];

      objc_super v26 = [[LPSize alloc] initWithSquareSize:v10];
      [(LPImageViewStyle *)v100 setFixedSize:v26];

      style = self->_style;
      self->_style = v100;
    }
    int64_t v28 = [(LPImageView *)self _filter];
    p_filteredImage = (id *)&self->_filteredImage;
    filteredImage = self->_filteredImage;
    self->_filteredImage = 0;

    unint64_t v31 = +[LPTestingOverrides forceImageLoadingScaleFactor];
    if (v31)
    {
      double v32 = (double)v31;
    }
    else
    {
      [(UIView *)self _lp_backingScaleFactor];
      double v32 = v33;
    }
    [(LPImagePresentationProperties *)self->_properties fixedSize];
    if (v35 == *MEMORY[0x1E4F1DB30] && v34 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      id v101 = [(LPImageViewStyle *)self->_style fixedSize];
      [v101 asSize];
      double v38 = v41;
      double v40 = v42;
    }
    else
    {
      [(LPImagePresentationProperties *)self->_properties fixedSize];
      double v38 = v37;
      double v40 = v39;
    }
    [(LPImageView *)self _effectiveCornerRadius];
    double v44 = v43;
    v45 = [(LPImagePresentationProperties *)self->_properties maskColor];
    v46 = v45;
    if (v45)
    {
      id v47 = v45;
    }
    else
    {
      id v47 = [(LPImageViewStyle *)self->_style maskColor];
    }
    id v102 = v47;

    v48 = [(LPImagePresentationProperties *)self->_properties backgroundColor];
    v49 = v48;
    if (v48)
    {
      id v50 = v48;
    }
    else
    {
      id v50 = [(LPImageViewStyle *)self->_style backgroundColor];
    }
    v51 = v50;

    v52 = [(LPImageViewStyle *)self->_style backgroundInset];
    [v52 value];
    double v54 = v53;

    switch(v28)
    {
      case 1:
      case 2:
      case 12:
      case 13:
        v55 = self->_image;
        goto LABEL_21;
      case 3:
        uint64_t v57 = squareImageWithCornerRadius(self->_image, v51, v38, v40, v44, v32, v54);
        id v58 = *p_filteredImage;
        id *p_filteredImage = (id)v57;

        v59 = [(LPImage *)self->_image _darkInterfaceAlternativeImage];

        if (!v59) {
          goto LABEL_33;
        }
        v60 = [(LPImage *)self->_image _darkInterfaceAlternativeImage];
        v61 = squareImageWithCornerRadius(v60, v51, v38, v40, v44, v32, v54);
        [*p_filteredImage _setDarkInterfaceAlternativeImage:v61];
        goto LABEL_46;
      case 4:
        uint64_t v62 = [(LPImage *)self->_image _asTemplate];
        id v63 = *p_filteredImage;
        id *p_filteredImage = (id)v62;

        if (!v102)
        {
          id v102 = [MEMORY[0x1E4FB1618] whiteColor];
        }
        goto LABEL_33;
      case 5:
        uint64_t v56 = appIconImage(self->_image, v38, v40, v32);
        goto LABEL_32;
      case 6:
        uint64_t v56 = messagesAppIconImage(self->_image, v38, v40, v32);
        goto LABEL_32;
      case 7:
        uint64_t v56 = appClipIconImage(self->_image, v38, v40, v32);
        goto LABEL_32;
      case 8:
      case 9:
      case 10:
        uint64_t v56 = bookCoverImage(self->_image, v28 == 10, v28 == 9, v32);
        goto LABEL_32;
      case 11:
        v64 = [(LPComponentView *)self host];
        char v65 = [v64 usesBackgroundForSymbolImagesForComponentView:self];

        v55 = self->_image;
        if (v65)
        {
LABEL_21:
          objc_storeStrong((id *)&self->_filteredImage, v55);
        }
        else
        {
          uint64_t v56 = [(LPImage *)self->_image filledVariant];
LABEL_32:
          id v66 = *p_filteredImage;
          id *p_filteredImage = (id)v56;
        }
        goto LABEL_33;
      case 14:
        uint64_t v97 = squareFittingImageWithCornerRadius(self->_image, v51, v38, v40, v44, v32, v54);
        id v98 = *p_filteredImage;
        id *p_filteredImage = (id)v97;

        v99 = [(LPImage *)self->_image _darkInterfaceAlternativeImage];

        if (!v99) {
          goto LABEL_33;
        }
        v60 = [(LPImage *)self->_image _darkInterfaceAlternativeImage];
        v61 = squareFittingImageWithCornerRadius(v60, v51, v38, v40, v44, v32, v54);
        [*p_filteredImage _setDarkInterfaceAlternativeImage:v61];
LABEL_46:

LABEL_33:
        if ([(LPImageView *)self shouldApplyBackground])
        {
          v67 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
          backgroundView = self->_backgroundView;
          self->_backgroundView = v67;

          [(UIView *)self->_backgroundView _lp_setBackgroundColor:v51];
          [(LPImageView *)self addSubview:self->_backgroundView];
        }
        v69 = [(LPImageView *)self _createImageViewWithImage:*p_filteredImage];
        imageView = self->_imageView;
        self->_imageView = v69;

        [(LPImageView *)self _updateScalingMode];
        v71 = self->_imageView;
        [(LPImageViewStyle *)self->_style opacity];
        -[UIImageView _lp_setOpacity:](v71, "_lp_setOpacity:");
        [(UIImageView *)self->_imageView _lp_setTintColor:v102];
        [(LPImageView *)self addSubview:self->_imageView];
        if (+[LPSettings showDebugIndicators])
        {
          id v72 = [MEMORY[0x1E4FB1618] greenColor];
          uint64_t v73 = [v72 CGColor];
          v74 = [(UIImageView *)self->_imageView layer];
          [v74 setBorderColor:v73];

          v75 = [(UIImageView *)self->_imageView layer];
          [v75 setBorderWidth:0.5];
        }
        if (v28 == 2) {
          [(LPImageView *)self installDarkeningViewIfNeeded];
        }
        v76 = [(LPImageViewStyle *)self->_style shadow];

        if (v76)
        {
          v77 = [(LPImageViewStyle *)self->_style shadow];
          [v77 radius];
          double v79 = v78;
          v80 = [(LPImageView *)self layer];
          [v80 setShadowRadius:v79];

          v81 = [(LPImageViewStyle *)self->_style shadow];
          v82 = [v81 offset];
          [v82 asSize];
          double v84 = v83;
          double v86 = v85;
          v87 = [(LPImageView *)self layer];
          objc_msgSend(v87, "setShadowOffset:", v84, v86);

          v88 = [(LPImageViewStyle *)self->_style shadow];
          [v88 opacity];
          double v90 = v89;
          v91 = [(LPImageView *)self layer];
          *(float *)&double v92 = v90;
          [v91 setShadowOpacity:v92];

          v93 = [(LPImageViewStyle *)self->_style shadow];
          id v94 = [v93 color];
          uint64_t v95 = [v94 CGColor];
          v96 = [(LPImageView *)self layer];
          [v96 setShadowColor:v95];

          [(LPImageView *)self updateShadowPath];
        }

        break;
      default:
        goto LABEL_33;
    }
  }
}

- (void)_userInterfaceStyleDidChange:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(LPImage *)self->_filteredImage _darkInterfaceAlternativeImage];

  if (v4)
  {
    int64_t v5 = [v10 traitCollection];
    uint64_t v6 = [v5 userInterfaceStyle];
    filteredImage = self->_filteredImage;
    if (v6 == 2)
    {
      v8 = [(LPImage *)filteredImage _darkInterfaceAlternativeImage];
      double v9 = [v8 platformImage];
    }
    else
    {
      double v9 = [(LPImage *)filteredImage platformImage];
      v8 = v9;
    }
    [(UIImageView *)self->_imageView setImage:v9];
    if (v6 == 2) {
  }
    }
}

- (void)updateCornerRadius
{
  [(UIImageView *)self->_imageView frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIView *)self->_backgroundView frame];
  v51.origin.x = v11;
  v51.origin.y = v12;
  v51.size.width = v13;
  v51.size.height = v14;
  v49.origin.x = v4;
  v49.origin.y = v6;
  v49.size.width = v8;
  v49.size.height = v10;
  if (CGRectEqualToRect(v49, v51))
  {
    [(UIImageView *)self->_imageView frame];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    [(LPImageView *)self bounds];
    v52.origin.x = v23;
    v52.origin.y = v24;
    v52.size.width = v25;
    v52.size.height = v26;
    v50.origin.x = v16;
    v50.origin.y = v18;
    v50.size.width = v20;
    v50.size.height = v22;
    BOOL v27 = CGRectEqualToRect(v50, v52);
  }
  else
  {
    BOOL v27 = 0;
  }
  int64_t v28 = [(LPImageView *)self _filter];
  double v29 = 0.0;
  if (v28 == 11 || v28 == 13)
  {
    [(LPImageView *)self _effectiveCornerRadius];
    double v34 = v35;
    uint64_t v32 = 1;
  }
  else if (v28 == 12)
  {
    if (v27)
    {
      [(LPImageView *)self frame];
      double v31 = v30;
      [(LPImageView *)self frame];
      uint64_t v32 = 0;
      double v34 = fmin(v31, v33) * 0.5;
    }
    else
    {
      [(UIImageView *)self->_imageView frame];
      double v37 = v36;
      [(UIImageView *)self->_imageView frame];
      double v34 = fmin(v37, v38) * 0.5;
      [(UIView *)self->_backgroundView frame];
      double v40 = v39;
      [(UIView *)self->_backgroundView frame];
      uint64_t v32 = 0;
      double v29 = fmin(v40, v41) * 0.5;
    }
  }
  else
  {
    uint64_t v32 = 0;
    double v34 = 0.0;
  }
  if (self->_platterReason)
  {
    double v42 = +[LPTheme iconPlatterCornerRadius];
    [v42 value];
    double v34 = v43;
  }
  if (v29 == 0.0) {
    double v44 = v34;
  }
  else {
    double v44 = v29;
  }
  if (v27) {
    double v45 = v34;
  }
  else {
    double v45 = 0.0;
  }
  if (v27)
  {
    double v34 = 0.0;
    double v46 = 0.0;
  }
  else
  {
    double v46 = v44;
  }
  -[UIView _lp_setCornerRadius:continuous:](self, "_lp_setCornerRadius:continuous:", v32, v45, v44);
  [(UIImageView *)self->_imageView _lp_setCornerRadius:v32 continuous:v34];
  backgroundView = self->_backgroundView;

  [(UIView *)backgroundView _lp_setCornerRadius:v32 continuous:v46];
}

- (void)updateShadowPath
{
  double v3 = [(LPImageViewStyle *)self->_style shadow];

  if (!v3) {
    return;
  }
  int64_t v4 = [(LPImageView *)self _filter];
  if ((unint64_t)(v4 - 5) < 3
    || (int64_t v5 = v4,
        [(LPImage *)self->_image properties],
        id v46 = (id)objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v46 type],
        v46,
        v6 == 5)
    || ![(LPImageView *)self shouldApplyBackground]
    && [(LPImage *)self->_image _hasTransparency])
  {
    id v47 = [(LPImageView *)self layer];
    [v47 setShadowPath:0];

    if (!+[LPSettings showDebugIndicators]) {
      return;
    }
    id v48 = [MEMORY[0x1E4FB1618] redColor];
    uint64_t v7 = [v48 CGColor];
    CGFloat v8 = [(LPImageView *)self layer];
    [v8 setShadowColor:v7];
    goto LABEL_8;
  }
  if ([(LPImageView *)self shouldApplyBackground]) {
    [(LPImageView *)self bounds];
  }
  else {
    [(UIImageView *)self->_imageView frame];
  }
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  CGFloat v16 = v12;
  if (v5 == 3 || v5 == 13 || self->_platterReason)
  {
    [(LPImageView *)self _effectiveCornerRadius];
    CGFloat v18 = v17;
    [(LPImageView *)self _effectiveCornerRadius];
    CGFloat v20 = v19;
    v52.origin.x = v13;
    v52.origin.y = v14;
    v52.size.width = v15;
    v52.size.height = v16;
    CGPathRef v21 = CGPathCreateWithRoundedRect(v52, v18, v20, 0);
    CFTypeRef v22 = CFAutorelease(v21);
    id v49 = [(LPImageView *)self layer];
    [v49 setShadowPath:v22];
  }
  else if (v5 == 14)
  {
    id v50 = [(LPImage *)self->_image platformImage];
    [v50 size];
    double v27 = v26;
    double v29 = v28;
    [(LPImageView *)self bounds];
    sizeFittingInsideSizeMaintainingAspectRatio(v27, v29, v30, v31);
    double v33 = v32;
    double v35 = v34;

    [(LPImageView *)self bounds];
    CGFloat v37 = (v36 - v33) * 0.5;
    [(LPImageView *)self bounds];
    CGFloat v39 = (v38 - v35) * 0.5;
    [(LPImageView *)self _effectiveCornerRadius];
    CGFloat v41 = v40;
    [(LPImageView *)self _effectiveCornerRadius];
    CGFloat v43 = v42;
    v53.origin.x = v37;
    v53.origin.y = v39;
    v53.size.width = v33;
    v53.size.height = v35;
    CGPathRef v44 = CGPathCreateWithRoundedRect(v53, v41, v43, 0);
    CFTypeRef v45 = CFAutorelease(v44);
    id v49 = [(LPImageView *)self layer];
    [v49 setShadowPath:v45];
  }
  else
  {
    if (v5 == 12) {
      CGPathRef v24 = CGPathCreateWithEllipseInRect(*(CGRect *)&v9, 0);
    }
    else {
      CGPathRef v24 = CGPathCreateWithRect(*(CGRect *)&v9, 0);
    }
    CFTypeRef v25 = CFAutorelease(v24);
    id v49 = [(LPImageView *)self layer];
    [v49 setShadowPath:v25];
  }

  if (+[LPSettings showDebugIndicators])
  {
    id v48 = [MEMORY[0x1E4FB1618] greenColor];
    uint64_t v23 = [v48 CGColor];
    CGFloat v8 = [(LPImageView *)self layer];
    [v8 setShadowColor:v23];
LABEL_8:
  }
}

- (void)updateBorder
{
  double v3 = [(LPImageViewStyle *)self->_style borderWidth];

  if (v3)
  {
    if ((unint64_t)([(LPImageView *)self _filter] - 5) < 3
      || ([(LPImage *)self->_image properties],
          id v12 = (id)objc_claimAutoreleasedReturnValue(),
          uint64_t v4 = [v12 type],
          v12,
          v4 == 5)
      || ![(LPImageView *)self shouldApplyBackground]
      && [(LPImage *)self->_image _hasTransparency])
    {
      id v13 = [(UIImageView *)self->_imageView layer];
      [v13 setBorderWidth:0.0];

      id v14 = [(UIImageView *)self->_imageView layer];
      [v14 setBorderColor:0];

      id v15 = [(LPImageView *)self layer];
      [v15 setBorderWidth:0.0];

      id v16 = [(LPImageView *)self layer];
      [v16 setBorderColor:0];
    }
    else
    {
      BOOL v5 = [(LPImageView *)self shouldApplyBackground];
      id v17 = [(LPImageViewStyle *)self->_style borderWidth];
      [v17 value];
      double v7 = v6;
      if (v5)
      {
        CGFloat v8 = [(LPImageView *)self layer];
        [v8 setBorderWidth:v7];

        id v16 = [(LPImageViewStyle *)self->_style borderColor];
        uint64_t v9 = [v16 CGColor];
        [(LPImageView *)self layer];
      }
      else
      {
        double v11 = [(UIImageView *)self->_imageView layer];
        [v11 setBorderWidth:v7];

        id v16 = [(LPImageViewStyle *)self->_style borderColor];
        uint64_t v9 = [v16 CGColor];
        [(UIImageView *)self->_imageView layer];
      double v10 = };
      [v10 setBorderColor:v9];
    }
  }
}

- (void)layoutComponentView
{
  [(LPImageView *)self ensureImageView];
  [(LPImageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v46 = v9;
  double v10 = [(LPImageViewStyle *)self->_style padding];
  objc_msgSend(v10, "asInsetsForLTR:", -[UIImageView _lp_isLTR](self->_imageView, "_lp_isLTR"));
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = [(LPImage *)self->_image platformImage];
  int v20 = objc_msgSend(v19, "_lp_isSymbolImage");
  double v21 = v4 + v14;
  double v22 = v6 + v12;
  double v23 = v14 + v18;
  double v24 = v12 + v16;

  if (v20)
  {
    [(UIImageView *)self->_imageView alignmentRectInsets];
    double v21 = v21 + v26 - v25;
    double v22 = v22 + v28 - v27;
  }
  double v29 = v8 - v23;
  double v30 = v46 - v24;
  if (self->_currentScalingMode == 1)
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __34__LPImageView_layoutComponentView__block_invoke;
    v47[3] = &unk_1E5B062A0;
    v47[4] = self;
    *(double *)&v47[5] = v21;
    *(double *)&v47[6] = v22;
    *(double *)&v47[7] = v29;
    *(double *)&v47[8] = v46 - v24;
    double v31 = __34__LPImageView_layoutComponentView__block_invoke((uint64_t)v47);
    double v33 = v32;
    v48.origin.x = v21;
    v48.origin.y = v22;
    v48.size.width = v29;
    v48.size.height = v30;
    double MidX = CGRectGetMidX(v48);
    v49.origin.x = v21;
    v49.origin.y = v22;
    v49.size.width = v29;
    v49.size.height = v30;
    -[UIImageView setFrame:](self->_imageView, "setFrame:", MidX - v31 * 0.5, CGRectGetMidY(v49) - v33 * 0.5, v31, v33);
  }
  else
  {
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v21, v22, v29, v46 - v24);
  }
  [(UIImageView *)self->_imageView frame];
  -[UIView setFrame:](self->_overlayView, "setFrame:");
  if ([(LPImageView *)self shouldApplyBackground]
    && [(LPImageView *)self _filter] != 11)
  {
    [(LPImageView *)self bounds];
  }
  else
  {
    double v35 = [(LPImageViewStyle *)self->_style backgroundInset];
    [v35 value];
    double v37 = v36;

    [(LPImageView *)self bounds];
    double v39 = v37 + v38;
    double v41 = v37 + v40;
    double v43 = v42 - (v37 + v37);
    double v45 = v44 - (v37 + v37);
  }
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v39, v41, v43, v45);
  [(LPImageView *)self updateCornerRadius];
  [(LPImageView *)self _updateScalingMode];
  [(LPImageView *)self updateShadowPath];
  [(LPImageView *)self updateBorder];
}

double __34__LPImageView_layoutComponentView__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 440) filter] == 3
    || [*(id *)(*(void *)(a1 + 32) + 440) requireFixedSize])
  {
    v2 = [*(id *)(*(void *)(a1 + 32) + 440) fixedSize];
    [v2 asSize];
    sizeFittingInsideSizeMaintainingAspectRatio(v3, v4, *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 432) fixedSize];
    double v9 = v8;
    double v11 = v10;
    double v12 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v14 = [*(id *)(*(void *)(a1 + 32) + 416) platformImage];
    v2 = v14;
    if (v9 == v12 && v11 == v13)
    {
      [v14 size];
      sizeFittingInsideSizeMaintainingAspectRatio(v22, v23, *(double *)(a1 + 56), *(double *)(a1 + 64));
    }
    else
    {
      [v14 size];
      double v17 = v16;
      double v19 = v18;
      [*(id *)(*(void *)(a1 + 32) + 432) fixedSize];
      sizeFittingInsideSizeMaintainingAspectRatio(v17, v19, v20, v21);
    }
  }
  double v6 = v5;

  return v6;
}

- (BOOL)shouldApplyBackground
{
  if ([(LPImagePresentationProperties *)self->_properties shouldApplyBackground]
    || [(LPImageViewStyle *)self->_style shouldApplyBackground]
    || self->_platterReason)
  {
    return 1;
  }
  if ([(LPImageView *)self _filter] != 11) {
    return 0;
  }
  double v5 = [(LPComponentView *)self host];
  char v3 = [v5 usesBackgroundForSymbolImagesForComponentView:self];

  return v3;
}

- (void)installDarkeningViewIfNeeded
{
  if (!self->_overlayView)
  {
    [(LPImageViewStyle *)self->_style darkeningAmount];
    -[LPImageView _createOverlayViewWithOpacity:](self, "_createOverlayViewWithOpacity:");
    char v3 = (UIView *)objc_claimAutoreleasedReturnValue();
    overlayView = self->_overlayView;
    self->_overlayView = v3;

    [(UIImageView *)self->_imageView addSubview:self->_overlayView];
    unint64_t v5 = [(LPImageView *)self _filter];
    if (v5 <= 0xD && ((1 << v5) & 0x2808) != 0)
    {
      [(LPImageView *)self _effectiveCornerRadius];
      -[UIView _lp_setCornerRadius:](self, "_lp_setCornerRadius:");
    }
  }
}

- (int64_t)scalingModeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int64_t v6 = [(LPImageViewStyle *)self->_style scalingMode];
  if ([(LPImagePresentationProperties *)self->_properties scalingMode]) {
    int64_t v6 = [(LPImagePresentationProperties *)self->_properties scalingMode];
  }
  double v7 = [(LPImage *)self->_image properties];
  uint64_t v8 = [v7 type];

  if ((unint64_t)(v8 - 1) < 6) {
    int64_t v9 = 1;
  }
  else {
    int64_t v9 = v6;
  }
  double v10 = [(LPImageViewStyle *)self->_style minimumSize];

  if (v10) {
    BOOL v11 = v9 == 1;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    double v21 = [(LPImageViewStyle *)self->_style padding];
    objc_msgSend(v21, "asInsetsForLTR:", -[UIView _lp_isLTR](self, "_lp_isLTR"));
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    -[LPImageView imageSizeThatFits:](self, "imageSizeThatFits:", width - (v25 + v29), height - (v23 + v27));
    double v31 = v30;
    double v33 = v32;
    double v34 = [(LPImageViewStyle *)self->_style minimumSize];
    double v35 = [v34 width];
    [v35 value];
    if (ceil(v31) < v36)
    {
    }
    else
    {
      double v37 = [(LPImageViewStyle *)self->_style minimumSize];
      double v38 = [v37 height];
      [v38 value];
      double v40 = v39;

      if (ceil(v33) >= v40) {
        return 1;
      }
    }
    return 2;
  }
  if (v9 == 3)
  {
    double v12 = [(LPImage *)self->_filteredImage platformImage];
    [v12 size];
    double v14 = v13;
    [(UIImageView *)self->_imageView frame];
    if (v14 > v15)
    {
    }
    else
    {
      double v16 = [(LPImage *)self->_filteredImage platformImage];
      [v16 size];
      double v18 = v17;
      [(UIImageView *)self->_imageView frame];
      double v20 = v19;

      if (v18 <= v20) {
        return 3;
      }
    }
    return 1;
  }
  return v9;
}

- (CGSize)imageSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(LPImageViewStyle *)self->_style fixedSize];
  if (v6)
  {
    double v7 = (void *)v6;
    if ([(LPImageViewStyle *)self->_style filter] == 3
      || [(LPImageViewStyle *)self->_style filter] == 11
      || [(LPImageViewStyle *)self->_style requireFixedSize])
    {

LABEL_6:
      uint64_t v8 = [(LPImageViewStyle *)self->_style fixedSize];
      [v8 asSize];
      sizeFittingInsideSizeMaintainingAspectRatio(v9, v10, width, height);
      double v12 = v11;
      double v14 = v13;

      double v15 = v12;
      double v16 = v14;
      goto LABEL_16;
    }
    BOOL v17 = [(LPImagePresentationProperties *)self->_properties requireFixedSize];

    if (v17) {
      goto LABEL_6;
    }
  }
  double v18 = [(LPImage *)self->_image platformImage];
  [v18 size];
  double v20 = v19;
  double v22 = v21;

  BOOL v23 = [(LPImage *)self->_image _isFallbackIcon];
  double v24 = fmax(v20, v22);
  if (v23) {
    double v25 = v24;
  }
  else {
    double v25 = v20;
  }
  if (!v23) {
    double v24 = v22;
  }

  sizeFittingInsideSizeMaintainingAspectRatio(v25, v24, width, height);
LABEL_16:
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(LPImageViewStyle *)self->_style padding];
  objc_msgSend(v6, "asInsetsForLTR:", -[UIView _lp_isLTR](self, "_lp_isLTR"));
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  -[LPImageView imageSizeThatFits:](self, "imageSizeThatFits:", width - (v10 + v14), height - (v8 + v12));
  double v16 = ceil(v15);
  double v18 = ceil(v17);
  uint64_t v19 = [(LPImageViewStyle *)self->_style minimumSize];
  if (v19)
  {
    double v20 = (void *)v19;
    BOOL v21 = [(LPImageViewStyle *)self->_style requireFixedSize];

    if (!v21)
    {
      double v22 = [(LPImageViewStyle *)self->_style minimumSize];
      BOOL v23 = [v22 width];
      [v23 value];
      double v25 = v24;

      double v26 = [(LPImageViewStyle *)self->_style minimumSize];
      double v27 = [v26 height];
      [v27 value];
      double v16 = fmax(v16, v25);
      double v18 = fmax(v18, v28);
    }
  }
  uint64_t v29 = [(LPImageViewStyle *)self->_style maximumSize];
  if (v29)
  {
    double v30 = (void *)v29;
    BOOL v31 = [(LPImageViewStyle *)self->_style requireFixedSize];

    if (!v31)
    {
      double v32 = [(LPImageViewStyle *)self->_style maximumSize];
      double v33 = [v32 width];
      [v33 value];
      double v35 = v34;

      double v36 = [(LPImageViewStyle *)self->_style maximumSize];
      double v37 = [v36 height];
      [v37 value];
      double v16 = fmin(v16, v35);
      double v18 = fmin(v18, v38);
    }
  }
  double v39 = v16 - (-v14 - v10);
  double v40 = v18 - (-v12 - v8);
  result.double height = v40;
  result.double width = v39;
  return result;
}

- (id)_createOverlayViewWithOpacity:(double)a3
{
  unint64_t v5 = [(LPComponentView *)self host];
  uint64_t v6 = [v5 appearanceForComponentView:self];

  unsigned int v7 = objc_msgSend(v6, "_lp_prefersDarkInterface");
  double v8 = [MEMORY[0x1E4FB1618] colorWithWhite:(double)v7 alpha:a3];
  id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  objc_msgSend(v9, "_lp_setBackgroundColor:", v8);
  objc_msgSend(v9, "_lp_disableAutomaticVibrancy");

  return v9;
}

- (void)_updateScalingMode
{
  [(LPImageView *)self bounds];
  int64_t v5 = -[LPImageView scalingModeForSize:](self, "scalingModeForSize:", v3, v4);
  if (v5 != self->_currentScalingMode)
  {
    self->_currentScalingMode = v5;
    [(LPImageView *)self _setImageViewScalingMode:v5];
  }
}

- (double)_effectiveCornerRadius
{
  double v3 = [(LPImageViewStyle *)self->_style cornerRadius];
  [v3 value];
  double v5 = v4;
  uint64_t v6 = [(LPComponentView *)self host];
  [v6 minimumCornerRadiusForComponentView:self];
  double v8 = fmax(v5, v7);

  return v8;
}

- (id)_createImageViewWithImage:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 _darkInterfaceAlternativeImage];
  if (v6)
  {
    double v3 = [(LPImageView *)self traitCollection];
    if ([v3 userInterfaceStyle] == 2)
    {
      double v7 = [v5 _darkInterfaceAlternativeImage];
      double v8 = [v7 platformImage];

LABEL_5:
      goto LABEL_6;
    }
  }
  double v8 = [v5 platformImage];
  if (v6) {
    goto LABEL_5;
  }
LABEL_6:

  id v9 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  objc_msgSend(v8, "_lp_pixelSize");
  double v11 = v10;
  double v13 = v12;
  if (([v8 isSymbolImage] & 1) == 0 && !sizeFitsWithinSize(v11, v13, 1024.0, 1024.0))
  {
    double v14 = [(LPComponentView *)self host];
    int v15 = [v14 allowsAsynchronousImageDecodingForComponentView:self];

    if (v15)
    {
      sizeFittingInsideSizeMaintainingAspectRatio(v11, v13, 1024.0, 1024.0);
      double v17 = v16;
      double v19 = v18;
      objc_initWeak(&location, v9);
      [(LPImageView *)self setHidden:1];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __41__LPImageView__createImageViewWithImage___block_invoke;
      v45[3] = &unk_1E5B062F0;
      v45[4] = self;
      objc_copyWeak(&v46, &location);
      objc_msgSend(v8, "prepareThumbnailOfSize:completionHandler:", v45, v17, v19);

      objc_destroyWeak(&v46);
      objc_destroyWeak(&location);
      double v8 = 0;
    }
  }
  [v9 setImage:v8];
  [v9 setUserInteractionEnabled:1];
  double v20 = [v5 properties];
  BOOL v21 = [v20 accessibilityText];
  [v9 setAccessibilityLabel:v21];

  double v22 = [(LPImageViewStyle *)self->_style fixedFallbackImageFont];

  if (v22)
  {
    BOOL v23 = (void *)MEMORY[0x1E4FB1830];
    double v24 = [(LPImageViewStyle *)self->_style fixedFallbackImageFont];
    double v25 = [v23 configurationWithFont:v24];
    double v26 = (void *)MEMORY[0x1E4FB1830];
    double v27 = [(LPImageViewStyle *)self->_style fixedFallbackImageScale];
    double v28 = objc_msgSend(v26, "configurationWithScale:", objc_msgSend(v27, "integerValue"));
    uint64_t v29 = [v25 configurationByApplyingConfiguration:v28];
    [v9 setPreferredSymbolConfiguration:v29];

    goto LABEL_20;
  }
  double v30 = [(LPImageViewStyle *)self->_style fixedFallbackImageSize];
  if (v30
    || ([(LPImageViewStyle *)self->_style fixedFallbackImageWeight],
        (double v30 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    double v44 = [(LPImageViewStyle *)self->_style fixedFallbackImageFontTextStyle];

    if (!v44)
    {
      double v24 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:3];
      [v9 setPreferredSymbolConfiguration:v24];
      goto LABEL_20;
    }
  }
  BOOL v31 = (void *)MEMORY[0x1E4FB1830];
  double v32 = [(LPImageViewStyle *)self->_style fixedFallbackImageSize];
  [v32 value];
  double v24 = objc_msgSend(v31, "configurationWithPointSize:");

  double v33 = [(LPImageViewStyle *)self->_style fixedFallbackImageWeight];

  if (v33)
  {
    double v34 = (void *)MEMORY[0x1E4FB1830];
    double v35 = [(LPImageViewStyle *)self->_style fixedFallbackImageWeight];
    double v36 = objc_msgSend(v34, "configurationWithWeight:", objc_msgSend(v35, "integerValue"));
    uint64_t v37 = [v24 configurationByApplyingConfiguration:v36];

    double v24 = (void *)v37;
  }
  double v38 = [(LPImageViewStyle *)self->_style fixedFallbackImageFontTextStyle];

  if (v38)
  {
    double v39 = (void *)MEMORY[0x1E4FB1830];
    double v40 = [(LPImageViewStyle *)self->_style fixedFallbackImageFontTextStyle];
    double v41 = [v39 configurationWithTextStyle:v40];
    uint64_t v42 = [v24 configurationByApplyingConfiguration:v41];

    double v24 = (void *)v42;
  }
  [v9 setPreferredSymbolConfiguration:v24];
LABEL_20:

  return v9;
}

void __41__LPImageView__createImageViewWithImage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__LPImageView__createImageViewWithImage___block_invoke_2;
  block[3] = &unk_1E5B062C8;
  block[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v7, (id *)(a1 + 40));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v7);
}

void __41__LPImageView__createImageViewWithImage___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 472);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (v2 == WeakRetained)
  {
    [*(id *)(a1 + 32) setHidden:0];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(*(void *)(a1 + 32) + 472);
    [v5 setImage:v4];
  }
}

- (void)_setImageViewScalingMode:(int64_t)a3
{
  if (a3 == 1)
  {
    p_imageView = &self->_imageView;
    BOOL v6 = 1;
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:");
    if ([(LPImageView *)self _filter] != 12) {
      BOOL v6 = [(LPImageView *)self _filter] == 13;
    }
  }
  else
  {
    if (a3 == 3)
    {
      p_imageView = &self->_imageView;
      imageView = self->_imageView;
      a3 = 4;
    }
    else
    {
      if (a3 != 2) {
        return;
      }
      p_imageView = &self->_imageView;
      imageView = self->_imageView;
    }
    [(UIImageView *)imageView setContentMode:a3];
    BOOL v6 = 1;
  }
  id v7 = *p_imageView;

  [(UIImageView *)v7 setClipsToBounds:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_originalStyle, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_filteredImage, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end