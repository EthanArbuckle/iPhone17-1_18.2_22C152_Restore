@interface CAMVideoConfigurationStatusIndicator
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_labelGeometryForSize:(SEL)a3 originX:(CGSize)a4 originY:(double)a5;
- (BOOL)_togglesFramerateForTouchAtLocation:(CGPoint)a3;
- (BOOL)_togglesResolutionForTouchAtLocation:(CGPoint)a3;
- (BOOL)_togglesResolutionOrFramerateForTouchAtLocation:(CGPoint)a3;
- (BOOL)shouldUseOutline;
- (CAMVideoConfigurationStatusIndicator)init;
- (CAMVideoConfigurationStatusIndicator)initWithLayoutStyle:(int64_t)a3;
- (CAMVideoConfigurationStatusIndicatorDelegate)touchDelegate;
- (CGSize)_framerateSize;
- (CGSize)_resolutionSize;
- (CGSize)_separatorSize;
- (CGSize)_sizingForLabel:(id)a3 minWidth:(double)a4 spacing:(double)a5;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImageView)_borderImageView;
- (UILabel)_framerateLabel;
- (UILabel)_resolutionLabel;
- (UILabel)_separatorLabel;
- (UIView)_framerateLabelSnapshot;
- (UIView)_resolutionLabelSnapshot;
- (double)_minTextWidth;
- (id)_framerateString;
- (id)_resolutionString;
- (id)_separatorString;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (id)imageNameForCurrentState;
- (int64_t)framerate;
- (int64_t)layoutStyle;
- (int64_t)resolution;
- (void)_handleTouchAtLocation:(CGPoint)a3;
- (void)_updateAppearanceAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)setFramerate:(int64_t)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setResolution:(int64_t)a3;
- (void)setResolution:(int64_t)a3 framerate:(int64_t)a4 animated:(BOOL)a5;
- (void)setTouchDelegate:(id)a3;
- (void)set_framerateLabelSnapshot:(id)a3;
- (void)set_framerateSize:(CGSize)a3;
- (void)set_resolutionLabelSnapshot:(id)a3;
- (void)set_resolutionSize:(CGSize)a3;
- (void)set_separatorSize:(CGSize)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation CAMVideoConfigurationStatusIndicator

- (CAMVideoConfigurationStatusIndicator)init
{
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = objc_msgSend(v3, "cam_initialLayoutStyle");

  return [(CAMVideoConfigurationStatusIndicator *)self initWithLayoutStyle:v4];
}

- (CAMVideoConfigurationStatusIndicator)initWithLayoutStyle:(int64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CAMVideoConfigurationStatusIndicator;
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = -[CAMControlStatusIndicator initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x263F001A8], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_layoutStyle = a3;
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v4, v5, v6, v7);
    resolutionLabel = v9->__resolutionLabel;
    v9->__resolutionLabel = (UILabel *)v10;

    [(UILabel *)v9->__resolutionLabel setNumberOfLines:1];
    v12 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v9->__resolutionLabel setTextColor:v12];

    [(UILabel *)v9->__resolutionLabel setTextAlignment:1];
    [(CAMVideoConfigurationStatusIndicator *)v9 addSubview:v9->__resolutionLabel];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v4, v5, v6, v7);
    separatorLabel = v9->__separatorLabel;
    v9->__separatorLabel = (UILabel *)v13;

    [(UILabel *)v9->__separatorLabel setNumberOfLines:1];
    v15 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v9->__separatorLabel setTextColor:v15];

    [(UILabel *)v9->__separatorLabel setTextAlignment:1];
    [(CAMVideoConfigurationStatusIndicator *)v9 addSubview:v9->__separatorLabel];
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v4, v5, v6, v7);
    framerateLabel = v9->__framerateLabel;
    v9->__framerateLabel = (UILabel *)v16;

    [(UILabel *)v9->__framerateLabel setNumberOfLines:1];
    v18 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v9->__framerateLabel setTextColor:v18];

    [(UILabel *)v9->__framerateLabel setTextAlignment:1];
    [(CAMVideoConfigurationStatusIndicator *)v9 addSubview:v9->__framerateLabel];
    [(CAMVideoConfigurationStatusIndicator *)v9 _updateAppearanceAnimated:0];
  }
  return v9;
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(CAMVideoConfigurationStatusIndicator *)self _updateAppearanceAnimated:0];
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  int64_t v3 = [(CAMVideoConfigurationStatusIndicator *)self layoutStyle];
  if ((unint64_t)(v3 - 2) >= 3)
  {
    if (v3 == 1)
    {
      double v8 = 2.0;
      double v5 = 4.0;
      double v6 = 8.0;
      double v7 = 8.0;
      goto LABEL_7;
    }
    if (v3)
    {
      double v8 = *MEMORY[0x263F834E8];
      double v7 = *(double *)(MEMORY[0x263F834E8] + 8);
      double v5 = *(double *)(MEMORY[0x263F834E8] + 16);
      double v6 = *(double *)(MEMORY[0x263F834E8] + 24);
      goto LABEL_7;
    }
  }
  [(CAMVideoConfigurationStatusIndicator *)self intrinsicContentSize];
  double v5 = (42.0 - v4) * 0.5;
  double v6 = 6.0;
  double v7 = 6.0;
  double v8 = v5;
LABEL_7:
  result.right = v6;
  result.bottom = v5;
  result.left = v7;
  result.top = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(CAMVideoConfigurationStatusIndicator *)self _resolutionSize];
  double v4 = v3;
  double v6 = v5;
  [(CAMVideoConfigurationStatusIndicator *)self _separatorSize];
  double v8 = v7;
  double v10 = v9;
  [(CAMVideoConfigurationStatusIndicator *)self _framerateSize];
  double v13 = v4 + v8 + v12;
  if (v6 >= v10) {
    double v14 = v6;
  }
  else {
    double v14 = v10;
  }
  if (v14 >= v11) {
    double v11 = v14;
  }
  result.height = v11;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  v52.receiver = self;
  v52.super_class = (Class)CAMVideoConfigurationStatusIndicator;
  [(CAMControlStatusIndicator *)&v52 layoutSubviews];
  [(CAMVideoConfigurationStatusIndicator *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CAMVideoConfigurationStatusIndicator *)self intrinsicContentSize];
  UIRoundToViewScale();
  UIRoundToViewScale();
  if ((unint64_t)([(CAMControlStatusIndicator *)self orientation] - 3) <= 1)
  {
    double v11 = v10;
    double v12 = v8;
    double v13 = v6;
    double v14 = v4;
    [(CAMVideoConfigurationStatusIndicator *)self _resolutionSize];
    double v16 = v15;
    [(CAMVideoConfigurationStatusIndicator *)self _minTextWidth];
    double v18 = v17;
    [(CAMVideoConfigurationStatusIndicator *)self _minTextWidth];
    if (v16 - v19 <= 0.0)
    {
      double v4 = v14;
      double v6 = v13;
      double v8 = v12;
      double v10 = v11;
    }
    else
    {
      BOOL v20 = v18 <= 0.0;
      double v4 = v14;
      double v6 = v13;
      double v8 = v12;
      double v10 = v11;
      if (!v20) {
        UIRoundToViewScale();
      }
    }
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  [(CAMVideoConfigurationStatusIndicator *)self _resolutionSize];
  -[CAMVideoConfigurationStatusIndicator _labelGeometryForSize:originX:originY:](self, "_labelGeometryForSize:originX:originY:");
  v21 = [(CAMVideoConfigurationStatusIndicator *)self _resolutionLabel];
  long long v42 = v48;
  long long v43 = v49;
  long long v44 = v50;
  long long v45 = v51;
  long long v40 = v46;
  long long v41 = v47;
  CAMViewSetGeometry(v21, (uint64_t)&v40);

  v22 = [(CAMVideoConfigurationStatusIndicator *)self _resolutionLabelSnapshot];
  long long v42 = v48;
  long long v43 = v49;
  long long v44 = v50;
  long long v45 = v51;
  long long v40 = v46;
  long long v41 = v47;
  CAMViewSetGeometry(v22, (uint64_t)&v40);

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  [(CAMVideoConfigurationStatusIndicator *)self _separatorSize];
  -[CAMVideoConfigurationStatusIndicator _labelGeometryForSize:originX:originY:](self, "_labelGeometryForSize:originX:originY:");
  v23 = [(CAMVideoConfigurationStatusIndicator *)self _separatorLabel];
  long long v36 = v42;
  long long v37 = v43;
  long long v38 = v44;
  long long v39 = v45;
  long long v34 = v40;
  long long v35 = v41;
  CAMViewSetGeometry(v23, (uint64_t)&v34);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  [(CAMVideoConfigurationStatusIndicator *)self _framerateSize];
  -[CAMVideoConfigurationStatusIndicator _labelGeometryForSize:originX:originY:](self, "_labelGeometryForSize:originX:originY:");
  v24 = [(CAMVideoConfigurationStatusIndicator *)self _framerateLabel];
  long long v30 = v36;
  long long v31 = v37;
  long long v32 = v38;
  long long v33 = v39;
  long long v28 = v34;
  long long v29 = v35;
  CAMViewSetGeometry(v24, (uint64_t)&v28);

  v25 = [(CAMVideoConfigurationStatusIndicator *)self _framerateLabelSnapshot];
  long long v30 = v36;
  long long v31 = v37;
  long long v32 = v38;
  long long v33 = v39;
  long long v28 = v34;
  long long v29 = v35;
  CAMViewSetGeometry(v25, (uint64_t)&v28);

  v26 = [(CAMVideoConfigurationStatusIndicator *)self _borderImageView];

  if (v26)
  {
    v27 = [(CAMVideoConfigurationStatusIndicator *)self _borderImageView];
    objc_msgSend(v27, "setFrame:", v4, v6, v8, v10);
  }
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (id)imageNameForCurrentState
{
  return 0;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = [a3 anyObject];
  [v5 locationInView:self];
  -[CAMVideoConfigurationStatusIndicator _handleTouchAtLocation:](self, "_handleTouchAtLocation:");
}

- (void)setResolution:(int64_t)a3 framerate:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  if (self->_framerate == a4)
  {
    int64_t resolution = self->_resolution;
    if (resolution == a3) {
      return;
    }
    if (a5) {
      goto LABEL_7;
    }
  }
  else if (a5)
  {
    double v10 = [(CAMVideoConfigurationStatusIndicator *)self _framerateLabelSnapshot];
    [v10 removeFromSuperview];

    double v11 = [(CAMVideoConfigurationStatusIndicator *)self _framerateLabel];
    double v12 = +[CAMFrameworkUtilities snapshotForCrossFadingView:v11 fadeOutDuration:1 fadeOutDelay:0.15 fadeInDuration:0.0 fadeInDelay:0.125 embedSnapshot:0.1];
    [(CAMVideoConfigurationStatusIndicator *)self set_framerateLabelSnapshot:v12];

    int64_t resolution = self->_resolution;
LABEL_7:
    if (resolution != a3)
    {
      double v13 = [(CAMVideoConfigurationStatusIndicator *)self _resolutionLabelSnapshot];
      [v13 removeFromSuperview];

      double v14 = [(CAMVideoConfigurationStatusIndicator *)self _resolutionLabel];
      double v15 = +[CAMFrameworkUtilities snapshotForCrossFadingView:v14 fadeOutDuration:1 fadeOutDelay:0.15 fadeInDuration:0.0 fadeInDelay:0.125 embedSnapshot:0.1];
      [(CAMVideoConfigurationStatusIndicator *)self set_resolutionLabelSnapshot:v15];
    }
  }
  [(CAMVideoConfigurationStatusIndicator *)self setResolution:a3];
  [(CAMVideoConfigurationStatusIndicator *)self setFramerate:a4];
  [(CAMVideoConfigurationStatusIndicator *)self _updateAppearanceAnimated:v5];
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (a4)
  {
    [(CAMVideoConfigurationStatusIndicator *)self layoutIfNeeded];
    v7.receiver = self;
    v7.super_class = (Class)CAMVideoConfigurationStatusIndicator;
    [(CAMControlStatusIndicator *)&v7 setOrientation:a3 animated:0];
    [(CAMVideoConfigurationStatusIndicator *)self setNeedsLayout];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __64__CAMVideoConfigurationStatusIndicator_setOrientation_animated___block_invoke;
    v6[3] = &unk_263FA0208;
    v6[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:2 delay:v6 options:0 animations:0.3 completion:0.0];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMVideoConfigurationStatusIndicator;
    -[CAMControlStatusIndicator setOrientation:animated:](&v7, sel_setOrientation_animated_, a3);
    [(CAMVideoConfigurationStatusIndicator *)self setNeedsLayout];
  }
}

uint64_t __64__CAMVideoConfigurationStatusIndicator_setOrientation_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (id)_resolutionString
{
  unint64_t v2 = [(CAMVideoConfigurationStatusIndicator *)self resolution] - 1;
  if (v2 > 3)
  {
    double v3 = &stru_26BD78BA0;
  }
  else
  {
    CAMLocalizedFrameworkString(off_263FA0E48[v2], 0);
    double v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_separatorString
{
  return @"·";
}

- (id)_framerateString
{
  unint64_t v2 = [(CAMVideoConfigurationStatusIndicator *)self framerate] - 1;
  if (v2 > 6) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_209C78F98[v2];
  }
  double v4 = [(id)objc_opt_class() integerFormatter];
  BOOL v5 = [NSNumber numberWithInteger:v3];
  double v6 = [v4 stringFromNumber:v5];

  return v6;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_labelGeometryForSize:(SEL)a3 originX:(CGSize)a4 originY:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  double v10 = *MEMORY[0x263F001A8];
  double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
  UIRectGetCenter();
  double v13 = v12;
  double v15 = v14;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  CAMOrientationTransform([(CAMControlStatusIndicator *)self orientation], (uint64_t)&v18);
  v17[0] = v18;
  v17[1] = v19;
  v17[2] = v20;
  CAMViewGeometryMake((uint64_t)v17, (uint64_t)retstr, v13, v15, v10, v11, width, height);
  return result;
}

- (CGSize)_sizingForLabel:(id)a3 minWidth:(double)a4 spacing:(double)a5
{
  [a3 intrinsicContentSize];
  UICeilToViewScale();
  double v6 = v5;
  UICeilToViewScale();
  double v8 = v7;
  double v9 = v6;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (double)_minTextWidth
{
  int64_t v2 = [(CAMVideoConfigurationStatusIndicator *)self layoutStyle];
  double result = 30.0;
  if (v2 == 1) {
    return 0.0;
  }
  return result;
}

- (void)_updateAppearanceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v38[2] = *MEMORY[0x263EF8340];
  double v5 = +[CAMFont cameraMonospacedFontOfSize:14.0];
  double v6 = +[CAMFont cameraKerningForFont:v5];
  uint64_t v7 = *MEMORY[0x263F81510];
  v37[0] = *MEMORY[0x263F814F0];
  v37[1] = v7;
  v38[0] = v5;
  v38[1] = v6;
  double v8 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  if ([(CAMVideoConfigurationStatusIndicator *)self resolution])
  {
    id v9 = objc_alloc(MEMORY[0x263F086A0]);
    double v10 = [(CAMVideoConfigurationStatusIndicator *)self _resolutionString];
    double v11 = (void *)[v9 initWithString:v10 attributes:v8];
    double v12 = [(CAMVideoConfigurationStatusIndicator *)self _resolutionLabel];
    [v12 setAttributedText:v11];
  }
  id v13 = objc_alloc(MEMORY[0x263F086A0]);
  double v14 = [(CAMVideoConfigurationStatusIndicator *)self _separatorString];
  double v15 = (void *)[v13 initWithString:v14 attributes:v8];
  double v16 = [(CAMVideoConfigurationStatusIndicator *)self _separatorLabel];
  [v16 setAttributedText:v15];

  if ([(CAMVideoConfigurationStatusIndicator *)self framerate])
  {
    id v17 = objc_alloc(MEMORY[0x263F086A0]);
    long long v18 = [(CAMVideoConfigurationStatusIndicator *)self _framerateString];
    long long v19 = (void *)[v17 initWithString:v18 attributes:v8];
    long long v20 = [(CAMVideoConfigurationStatusIndicator *)self _framerateLabel];
    [v20 setAttributedText:v19];
  }
  int64_t v21 = [(CAMVideoConfigurationStatusIndicator *)self layoutStyle];
  [(CAMVideoConfigurationStatusIndicator *)self _minTextWidth];
  double v23 = v22;
  v24 = [(CAMVideoConfigurationStatusIndicator *)self _resolutionLabel];
  [(CAMVideoConfigurationStatusIndicator *)self _sizingForLabel:v24 minWidth:v23 spacing:13.0 - CAMPixelWidthForView(self)];
  -[CAMVideoConfigurationStatusIndicator set_resolutionSize:](self, "set_resolutionSize:");

  v25 = [(CAMVideoConfigurationStatusIndicator *)self _separatorLabel];
  [(CAMVideoConfigurationStatusIndicator *)self _sizingForLabel:v25 minWidth:16.0 spacing:0.0];
  -[CAMVideoConfigurationStatusIndicator set_separatorSize:](self, "set_separatorSize:");

  v26 = [(CAMVideoConfigurationStatusIndicator *)self _framerateLabel];
  [(CAMVideoConfigurationStatusIndicator *)self _sizingForLabel:v26 minWidth:v23 spacing:13.0 - CAMPixelWidthForView(self)];
  -[CAMVideoConfigurationStatusIndicator set_framerateSize:](self, "set_framerateSize:");

  v27 = [(CAMVideoConfigurationStatusIndicator *)self _borderImageView];

  if (v21 == 1)
  {
    if (!v27)
    {
      long long v28 = (void *)MEMORY[0x263F827E8];
      long long v29 = CAMCameraUIFrameworkBundle();
      long long v30 = [v28 imageNamed:@"CAMFramerateIndicatorBorder" inBundle:v29];

      [v30 size];
      long long v33 = objc_msgSend(v30, "resizableImageWithCapInsets:resizingMode:", 1, v31 * 0.5, v32 * 0.5, v31 * 0.5, v32 * 0.5);
      long long v34 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v33];
      borderImageView = self->__borderImageView;
      self->__borderImageView = v34;

      [(CAMVideoConfigurationStatusIndicator *)self addSubview:self->__borderImageView];
LABEL_10:
    }
  }
  else if (v27)
  {
    [(UIImageView *)self->__borderImageView removeFromSuperview];
    long long v30 = self->__borderImageView;
    self->__borderImageView = 0;
    goto LABEL_10;
  }
  [(CAMVideoConfigurationStatusIndicator *)self setNeedsLayout];
  long long v36 = [(CAMControlStatusIndicator *)self delegate];
  [v36 controlStatusIndicatorDidChangeIntrinsicContentSize:self animated:v3];
}

- (BOOL)_togglesResolutionOrFramerateForTouchAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CAMVideoConfigurationStatusIndicator *)self bounds];
  CGRect v10 = CGRectInset(v9, -15.0, -15.0);
  CGFloat v5 = x;
  CGFloat v6 = y;
  return CGRectContainsPoint(v10, *(CGPoint *)&v5);
}

- (BOOL)_togglesResolutionForTouchAtLocation:(CGPoint)a3
{
  double x = a3.x;
  BOOL v5 = -[CAMVideoConfigurationStatusIndicator _togglesResolutionOrFramerateForTouchAtLocation:](self, "_togglesResolutionOrFramerateForTouchAtLocation:", a3.x, a3.y);
  CGFloat v6 = [(CAMVideoConfigurationStatusIndicator *)self _separatorLabel];
  [v6 center];
  double v8 = v7;

  return x < v8 && v5;
}

- (BOOL)_togglesFramerateForTouchAtLocation:(CGPoint)a3
{
  double x = a3.x;
  BOOL v5 = -[CAMVideoConfigurationStatusIndicator _togglesResolutionOrFramerateForTouchAtLocation:](self, "_togglesResolutionOrFramerateForTouchAtLocation:", a3.x, a3.y);
  CGFloat v6 = [(CAMVideoConfigurationStatusIndicator *)self _separatorLabel];
  [v6 center];
  double v8 = v7;

  return x > v8 && v5;
}

- (void)_handleTouchAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = [(CAMVideoConfigurationStatusIndicator *)self touchDelegate];
  int v7 = [v6 videoConfigurationStatusIndicatorShouldRespondToTap:self];

  if (v7)
  {
    if (-[CAMVideoConfigurationStatusIndicator _togglesResolutionForTouchAtLocation:](self, "_togglesResolutionForTouchAtLocation:", x, y))
    {
      id v8 = [(CAMVideoConfigurationStatusIndicator *)self touchDelegate];
      [v8 videoConfigurationStatusIndicatorDidTapResolution:self];
    }
    else
    {
      if (!-[CAMVideoConfigurationStatusIndicator _togglesFramerateForTouchAtLocation:](self, "_togglesFramerateForTouchAtLocation:", x, y))return; {
      id v8 = [(CAMVideoConfigurationStatusIndicator *)self touchDelegate];
      }
      [v8 videoConfigurationStatusIndicatorDidTapFramerate:self];
    }
  }
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  [a3 locationOfAccessibilityGestureInView:self];
  double v5 = v4;
  double v7 = v6;
  if (-[CAMVideoConfigurationStatusIndicator _togglesResolutionForTouchAtLocation:](self, "_togglesResolutionForTouchAtLocation:"))
  {
    uint64_t v8 = [(CAMVideoConfigurationStatusIndicator *)self _resolutionString];
  }
  else
  {
    if (!-[CAMVideoConfigurationStatusIndicator _togglesFramerateForTouchAtLocation:](self, "_togglesFramerateForTouchAtLocation:", v5, v7))
    {
      CGRect v9 = 0;
      goto LABEL_8;
    }
    uint64_t v8 = [(CAMVideoConfigurationStatusIndicator *)self _framerateString];
  }
  CGRect v9 = (void *)v8;
  if (v8)
  {
    id v10 = objc_alloc(MEMORY[0x263F823C0]);
    double v11 = objc_msgSend(v10, "initWithTitle:image:imageInsets:scaleImage:", v9, 0, 0, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    goto LABEL_9;
  }
LABEL_8:
  double v11 = 0;
LABEL_9:

  return v11;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  [a3 locationOfAccessibilityGestureInView:self];
  -[CAMVideoConfigurationStatusIndicator _handleTouchAtLocation:](self, "_handleTouchAtLocation:");
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (CAMVideoConfigurationStatusIndicatorDelegate)touchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchDelegate);
  return (CAMVideoConfigurationStatusIndicatorDelegate *)WeakRetained;
}

- (void)setTouchDelegate:(id)a3
{
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (void)setResolution:(int64_t)a3
{
  self->_int64_t resolution = a3;
}

- (int64_t)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(int64_t)a3
{
  self->_framerate = a3;
}

- (UILabel)_resolutionLabel
{
  return self->__resolutionLabel;
}

- (UIView)_resolutionLabelSnapshot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__resolutionLabelSnapshot);
  return (UIView *)WeakRetained;
}

- (void)set_resolutionLabelSnapshot:(id)a3
{
}

- (UILabel)_separatorLabel
{
  return self->__separatorLabel;
}

- (UILabel)_framerateLabel
{
  return self->__framerateLabel;
}

- (UIView)_framerateLabelSnapshot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__framerateLabelSnapshot);
  return (UIView *)WeakRetained;
}

- (void)set_framerateLabelSnapshot:(id)a3
{
}

- (CGSize)_resolutionSize
{
  double width = self->__resolutionSize.width;
  double height = self->__resolutionSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_resolutionSize:(CGSize)a3
{
  self->__resolutionSize = a3;
}

- (CGSize)_separatorSize
{
  double width = self->__separatorSize.width;
  double height = self->__separatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_separatorSize:(CGSize)a3
{
  self->__separatorSize = a3;
}

- (CGSize)_framerateSize
{
  double width = self->__framerateSize.width;
  double height = self->__framerateSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_framerateSize:(CGSize)a3
{
  self->__framerateSize = a3;
}

- (UIImageView)_borderImageView
{
  return self->__borderImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__borderImageView, 0);
  objc_destroyWeak((id *)&self->__framerateLabelSnapshot);
  objc_storeStrong((id *)&self->__framerateLabel, 0);
  objc_storeStrong((id *)&self->__separatorLabel, 0);
  objc_destroyWeak((id *)&self->__resolutionLabelSnapshot);
  objc_storeStrong((id *)&self->__resolutionLabel, 0);
  objc_destroyWeak((id *)&self->_touchDelegate);
}

@end