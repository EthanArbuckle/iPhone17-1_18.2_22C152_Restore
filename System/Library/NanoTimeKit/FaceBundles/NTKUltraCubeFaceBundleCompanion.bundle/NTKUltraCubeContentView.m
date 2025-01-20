@interface NTKUltraCubeContentView
+ (id)timeLabelFontForDevice:(id)a3 size:(double)a4 typeface:(unint64_t)a5 role:(unint64_t)a6;
+ (id)timeLabelStyleForDevice:(id)a3 font:(id)a4 baseline:(double)a5 faceBounds:(CGRect)a6;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isPaused;
- (BOOL)isTimeElementFront;
- (NTKUltraCubeContentEffect)contentEffect;
- (NTKUltraCubeContentView)initWithFrame:(CGRect)a3 role:(unint64_t)a4 typeface:(unint64_t)a5 device:(id)a6;
- (NTKUltraCubeImageContainerView)backgroundContainerView;
- (NTKUltraCubeImageContainerView)foregroundContainerView;
- (UIColor)timeElementShadowColor;
- (UIView)containerView;
- (UIView)midgroundView;
- (double)timeElementAlpha;
- (double)timeElementUnitBaseline;
- (double)timeElementUnitHeight;
- (id)_digitalTimeLabelStyle;
- (id)backgroundImage;
- (id)foregroundImage;
- (unint64_t)typeface;
- (void)_applyBackgroundColorRampFromPalette:(id)a3 toPalette:(id)a4 fraction:(double)a5;
- (void)_applyColorRampTo:(id)a3 colorMatrix:(id)a4 fromPalette:(id)a5 toPalette:(id)a6 fraction:(double)a7;
- (void)_applyContentEffect;
- (void)_applyForegroundColorRampFromPalette:(id)a3 toPalette:(id)a4 fraction:(double)a5;
- (void)_hideShadowsAndGradients;
- (void)_reorderViewsForPhoto;
- (void)_showShadowsAndGradients;
- (void)applyColorTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)applyCornerRadiusMask;
- (void)copyFiltersFromContentView:(id)a3;
- (void)invalidateDigitalTimeLabelStyle;
- (void)layoutSubviews;
- (void)setBackgroundContainerView:(id)a3;
- (void)setBackgroundContentAlpha:(double)a3;
- (void)setBackgroundContentRoll:(double)a3 pitch:(double)a4;
- (void)setBackgroundContentScale:(double)a3;
- (void)setBackgroundContentsMultiplyByWhite:(double)a3;
- (void)setBottomGradientAlpha:(double)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentEffect:(id)a3;
- (void)setContentsMultiplyByWhite:(double)a3;
- (void)setForegroundContainerView:(id)a3;
- (void)setForegroundContentAlpha:(double)a3;
- (void)setForegroundContentRoll:(double)a3 pitch:(double)a4;
- (void)setForegroundContentScale:(double)a3;
- (void)setForegroundContentsMultiplyByWhite:(double)a3 alpha:(double)a4;
- (void)setMidgroundView:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setPaused:(BOOL)a3;
- (void)setTimeElementAlpha:(double)a3;
- (void)setTimeElementUnitBaseline:(double)a3;
- (void)setTimeElementUnitHeight:(double)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTopGradientAlpha:(double)a3;
- (void)setTypeface:(unint64_t)a3;
- (void)updateForegroundImage:(id)a3 backgroundImage:(id)a4 timeElementShadowColor:(id)a5 topGradientView:(id)a6 bottomGradientView:(id)a7 isTimeElementFront:(BOOL)a8;
@end

@implementation NTKUltraCubeContentView

- (NTKUltraCubeContentView)initWithFrame:(CGRect)a3 role:(unint64_t)a4 typeface:(unint64_t)a5 device:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)NTKUltraCubeContentView;
  v15 = -[NTKUltraCubeContentView initWithFrame:](&v36, "initWithFrame:", x, y, width, height);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_device, a6);
    v16->_role = a4;
    v16->_typeface = a5;
    v16->_isTimeElementFront = 1;
    v16->_timeElementUnitBaseline = 0.328125;
    v16->_timeElementUnitHeight = 0.241116751;
    uint64_t v17 = +[NTKDigitalTimeLabel labelWithOptions:1 forDevice:v16->_device];
    timeLabel = v16->_timeLabel;
    v16->_timeLabel = (NTKDigitalTimeLabel *)v17;

    [(NTKDigitalTimeLabel *)v16->_timeLabel setUsesLegibility:a4 == 0];
    v19 = v16->_timeLabel;
    v20 = +[UIColor whiteColor];
    [(NTKDigitalTimeLabel *)v19 setTextColor:v20];

    v21 = v16->_timeLabel;
    v22 = +[NTKTimeOffsetManager sharedManager];
    [v22 timeOffset];
    -[NTKDigitalTimeLabel setTimeOffset:](v21, "setTimeOffset:");

    [(NTKUltraCubeContentView *)v16 invalidateDigitalTimeLabelStyle];
    v23 = -[NTKUltraCubeImageContainerView initWithFrame:]([NTKUltraCubeImageContainerView alloc], "initWithFrame:", x, y, width, height);
    foregroundContainerView = v16->_foregroundContainerView;
    v16->_foregroundContainerView = v23;

    [(NTKUltraCubeImageContainerView *)v16->_foregroundContainerView setOpaque:0];
    v25 = -[NTKUltraCubeImageContainerView initWithFrame:]([NTKUltraCubeImageContainerView alloc], "initWithFrame:", x, y, width, height);
    backgroundContainerView = v16->_backgroundContainerView;
    v16->_backgroundContainerView = v25;

    [(NTKUltraCubeImageContainerView *)v16->_backgroundContainerView setOpaque:1];
    v27 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, y, width, height);
    containerView = v16->_containerView;
    v16->_containerView = v27;

    [(NTKUltraCubeContentView *)v16 addSubview:v16->_containerView];
    v29 = (NTKRoundedCornerOverlayView *)objc_msgSend(objc_alloc((Class)NTKRoundedCornerOverlayView), "initWithFrame:forDeviceCornerRadius:", v14, x, y, width, height);
    cornerView = v16->_cornerView;
    v16->_cornerView = v29;

    [(NTKUltraCubeContentView *)v16 _reorderViewsForPhoto];
    uint64_t v31 = NTKDefaultMonochromeColorMatrix();
    foregroundMonochromeColorMatridouble x = v16->_foregroundMonochromeColorMatrix;
    v16->_foregroundMonochromeColorMatridouble x = (NSValue *)v31;

    uint64_t v33 = NTKDefaultMonochromeColorMatrix();
    backgroundMonochromeColorMatridouble x = v16->_backgroundMonochromeColorMatrix;
    v16->_backgroundMonochromeColorMatridouble x = (NSValue *)v33;
  }
  return v16;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKUltraCubeContentView;
  [(NTKUltraCubeContentView *)&v3 layoutSubviews];
  [(NTKDigitalTimeLabel *)self->_timeLabel setFrameUsingCurrentStyle];
}

- (BOOL)accessibilityElementsHidden
{
  return self->_role == 1;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
}

- (void)setTimeOffset:(double)a3
{
}

- (double)timeElementAlpha
{
  [(NTKDigitalTimeLabel *)self->_timeLabel alpha];
  return result;
}

- (void)setTimeElementAlpha:(double)a3
{
}

- (void)updateForegroundImage:(id)a3 backgroundImage:(id)a4 timeElementShadowColor:(id)a5 topGradientView:(id)a6 bottomGradientView:(id)a7 isTimeElementFront:(BOOL)a8
{
  id v14 = (UIColor *)a5;
  v15 = (UIView *)a6;
  v16 = (UIView *)a7;
  topGradientView = self->_topGradientView;
  id v18 = a4;
  id v19 = a3;
  [(UIView *)topGradientView removeFromSuperview];
  [(UIView *)self->_bottomGradientView removeFromSuperview];
  v20 = self->_topGradientView;
  self->_topGradientView = v15;
  v21 = v15;

  bottomGradientView = self->_bottomGradientView;
  self->_bottomGradientView = v16;
  v23 = v16;

  self->_isTimeElementFront = a8;
  timeElementShadowColor = self->_timeElementShadowColor;
  self->_timeElementShadowColor = v14;
  v25 = v14;

  [(NTKUltraCubeImageContainerView *)self->_foregroundContainerView setHidden:v19 == 0];
  [(NTKUltraCubeImageContainerView *)self->_foregroundContainerView setImage:v19];
  NTKGenerateMonochromeColorMatrixFromImage();
  v26 = (NSValue *)objc_claimAutoreleasedReturnValue();

  foregroundMonochromeColorMatridouble x = self->_foregroundMonochromeColorMatrix;
  self->_foregroundMonochromeColorMatridouble x = v26;

  [(NTKUltraCubeImageContainerView *)self->_backgroundContainerView setHidden:v18 == 0];
  [(NTKUltraCubeImageContainerView *)self->_backgroundContainerView setImage:v18];
  NTKGenerateMonochromeColorMatrixFromImage();
  v28 = (NSValue *)objc_claimAutoreleasedReturnValue();

  backgroundMonochromeColorMatridouble x = self->_backgroundMonochromeColorMatrix;
  self->_backgroundMonochromeColorMatridouble x = v28;

  [(NTKUltraCubeContentView *)self _applyContentEffect];

  [(NTKUltraCubeContentView *)self _reorderViewsForPhoto];
}

- (BOOL)isPaused
{
  return [(NTKDigitalTimeLabel *)self->_timeLabel isFrozen];
}

- (void)setPaused:(BOOL)a3
{
}

- (id)foregroundImage
{
  return [(NTKUltraCubeImageContainerView *)self->_foregroundContainerView image];
}

- (id)backgroundImage
{
  return [(NTKUltraCubeImageContainerView *)self->_backgroundContainerView image];
}

- (void)copyFiltersFromContentView:(id)a3
{
  foregroundContainerView = self->_foregroundContainerView;
  id v5 = a3;
  v6 = [v5 foregroundContainerView];
  v7 = [v6 imageFilters];
  [(NTKUltraCubeImageContainerView *)foregroundContainerView setImageFilters:v7];

  backgroundContainerView = self->_backgroundContainerView;
  id v10 = [v5 backgroundContainerView];

  v9 = [v10 imageFilters];
  [(NTKUltraCubeImageContainerView *)backgroundContainerView setImageFilters:v9];
}

- (void)setForegroundContentScale:(double)a3
{
}

- (void)setBackgroundContentScale:(double)a3
{
}

- (void)setForegroundContentRoll:(double)a3 pitch:(double)a4
{
}

- (void)setBackgroundContentRoll:(double)a3 pitch:(double)a4
{
}

- (void)setContentsMultiplyByWhite:(double)a3
{
  [(NTKUltraCubeContentView *)self setForegroundContentsMultiplyByWhite:a3 alpha:1.0];

  [(NTKUltraCubeContentView *)self setBackgroundContentsMultiplyByWhite:a3];
}

- (void)setForegroundContentsMultiplyByWhite:(double)a3 alpha:(double)a4
{
}

- (void)setBackgroundContentsMultiplyByWhite:(double)a3
{
}

- (void)_reorderViewsForPhoto
{
  objc_super v3 = objc_opt_new();
  [v3 addObject:self->_cornerView];
  if (self->_isTimeElementFront)
  {
    [v3 addObject:self->_timeLabel];
    if (self->_topGradientView) {
      objc_msgSend(v3, "addObject:");
    }
    if (self->_bottomGradientView) {
      objc_msgSend(v3, "addObject:");
    }
    foregroundContainerView = self->_foregroundContainerView;
LABEL_10:
    [v3 addObject:foregroundContainerView];
    goto LABEL_11;
  }
  if (self->_bottomGradientView) {
    objc_msgSend(v3, "addObject:");
  }
  [v3 addObject:self->_foregroundContainerView];
  [v3 addObject:self->_timeLabel];
  foregroundContainerView = (NTKUltraCubeImageContainerView *)self->_topGradientView;
  if (foregroundContainerView) {
    goto LABEL_10;
  }
LABEL_11:
  [v3 addObject:self->_backgroundContainerView];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0;
      v11 = v8;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
        containerView = self->_containerView;
        if (v11)
        {
          [(UIView *)containerView insertSubview:v12 belowSubview:v11];
        }
        else
        {
          -[UIView addSubview:](containerView, "addSubview:", v12, (void)v14);
          [(UIView *)self->_containerView bringSubviewToFront:v12];
        }
        id v8 = v12;

        id v10 = (char *)v10 + 1;
        v11 = v8;
      }
      while (v7 != v10);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)setContentAlpha:(double)a3
{
  -[NTKUltraCubeImageContainerView setContentAlpha:](self->_backgroundContainerView, "setContentAlpha:");
  foregroundContainerView = self->_foregroundContainerView;

  [(NTKUltraCubeImageContainerView *)foregroundContainerView setContentAlpha:a3];
}

- (void)setForegroundContentAlpha:(double)a3
{
}

- (void)setBackgroundContentAlpha:(double)a3
{
}

- (void)setTopGradientAlpha:(double)a3
{
}

- (void)setBottomGradientAlpha:(double)a3
{
}

- (void)setMidgroundView:(id)a3
{
  id v5 = (UIView *)a3;
  p_midgroundView = &self->_midgroundView;
  midgroundView = self->_midgroundView;
  if (midgroundView != v5)
  {
    id v8 = v5;
    if (!v5 || midgroundView) {
      [(UIView *)midgroundView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_midgroundView, a3);
    id v5 = v8;
    if (*p_midgroundView)
    {
      midgroundView = (UIView *)[(UIView *)self->_containerView insertSubview:*p_midgroundView below:self->_timeLabel];
      id v5 = v8;
    }
  }

  _objc_release_x1(midgroundView, v5);
}

- (void)applyCornerRadiusMask
{
  [(CLKDevice *)self->_device screenCornerRadius];
  objc_super v3 = +[CAShapeLayer layer];
  maskingLayer = self->_maskingLayer;
  self->_maskingLayer = v3;

  id v5 = +[UIColor blackColor];
  -[CAShapeLayer setFillColor:](self->_maskingLayer, "setFillColor:", [v5 CGColor]);

  [(NTKUltraCubeContentView *)self bounds];
  -[CAShapeLayer setFrame:](self->_maskingLayer, "setFrame:");
  [(CAShapeLayer *)self->_maskingLayer bounds];
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  id v6 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_maskingLayer, "setPath:", [v6 CGPath]);

  id v7 = [(UIView *)self->_containerView layer];
  [v7 setMask:self->_maskingLayer];
}

- (void)setContentEffect:(id)a3
{
  objc_storeStrong((id *)&self->_contentEffect, a3);

  [(NTKUltraCubeContentView *)self _applyContentEffect];
}

- (void)_applyContentEffect
{
  objc_super v3 = [(NTKUltraCubeContentEffect *)self->_contentEffect palette];
  unsigned __int8 v4 = [v3 isOriginalColor];

  contentEffect = self->_contentEffect;
  if (!contentEffect || (v4 & 1) != 0) {
    goto LABEL_6;
  }
  id v6 = [(NTKUltraCubeContentEffect *)contentEffect colorEffect];
  if (v6 != (unsigned char *)&dword_0 + 2)
  {
    if (v6 == (unsigned char *)&dword_0 + 1)
    {
      [(NTKUltraCubeContentView *)self _hideShadowsAndGradients];
      id v10 = [(NTKUltraCubeContentEffect *)self->_contentEffect palette];
      [(NTKUltraCubeContentView *)self _applyBackgroundColorRampFromPalette:0 toPalette:v10 fraction:1.0];

      uint64_t v7 = 144;
      goto LABEL_7;
    }
    if (v6) {
      return;
    }
LABEL_6:
    [(NTKUltraCubeContentView *)self _showShadowsAndGradients];
    [(NTKUltraCubeImageContainerView *)self->_foregroundContainerView removeColorRamp];
    uint64_t v7 = 152;
LABEL_7:
    id v8 = *(Class *)((char *)&self->super.super.super.isa + v7);
    [v8 removeColorRamp];
    return;
  }
  [(NTKUltraCubeContentView *)self _hideShadowsAndGradients];
  uint64_t v9 = [(NTKUltraCubeContentEffect *)self->_contentEffect palette];
  [(NTKUltraCubeContentView *)self _applyBackgroundColorRampFromPalette:0 toPalette:v9 fraction:1.0];

  id v11 = [(NTKUltraCubeContentEffect *)self->_contentEffect palette];
  [(NTKUltraCubeContentView *)self _applyForegroundColorRampFromPalette:0 toPalette:v11 fraction:1.0];
}

- (void)_applyForegroundColorRampFromPalette:(id)a3 toPalette:(id)a4 fraction:(double)a5
{
}

- (void)_applyBackgroundColorRampFromPalette:(id)a3 toPalette:(id)a4 fraction:(double)a5
{
}

- (void)_applyColorRampTo:(id)a3 colorMatrix:(id)a4 fromPalette:(id)a5 toPalette:(id)a6 fraction:(double)a7
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_2473C;
  v12[3] = &unk_49470;
  id v13 = a3;
  id v11 = v13;
  +[NTKPhotosColorPalette colorRampForMonochromeColorMatrix:a4 fromPalette:a5 toPalette:a6 transitionFraction:v12 completion:a7];
}

- (void)applyColorTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  contentEffect = self->_contentEffect;
  if (contentEffect)
  {
    if ([(NTKUltraCubeContentEffect *)contentEffect colorEffect])
    {
      [(NTKUltraCubeContentView *)self _applyBackgroundColorRampFromPalette:v10 toPalette:v8 fraction:a3];
      if ((char *)[(NTKUltraCubeContentEffect *)self->_contentEffect colorEffect] == (char *)&dword_0 + 2) {
        [(NTKUltraCubeContentView *)self _applyForegroundColorRampFromPalette:v10 toPalette:v8 fraction:a3];
      }
    }
  }
}

- (void)_hideShadowsAndGradients
{
  timeLabel = self->_timeLabel;
  unsigned __int8 v4 = +[UIColor colorWithWhite:0.0 alpha:0.3];
  [(NTKDigitalTimeLabel *)timeLabel setShadowColor:v4];

  [(UIView *)self->_topGradientView setHidden:1];
  bottomGradientView = self->_bottomGradientView;

  [(UIView *)bottomGradientView setHidden:1];
}

- (void)_showShadowsAndGradients
{
  [(NTKDigitalTimeLabel *)self->_timeLabel setShadowColor:self->_timeElementShadowColor];
  [(UIView *)self->_topGradientView setHidden:0];
  bottomGradientView = self->_bottomGradientView;

  [(UIView *)bottomGradientView setHidden:0];
}

- (void)setTypeface:(unint64_t)a3
{
  if (self->_typeface != a3)
  {
    self->_typeface = a3;
    [(NTKUltraCubeContentView *)self invalidateDigitalTimeLabelStyle];
  }
}

- (void)invalidateDigitalTimeLabelStyle
{
  timeLabel = self->_timeLabel;
  unsigned __int8 v4 = [(NTKUltraCubeContentView *)self _digitalTimeLabelStyle];
  [(NTKDigitalTimeLabel *)timeLabel setStyle:v4];

  [(NTKUltraCubeContentView *)self setNeedsLayout];
}

- (id)_digitalTimeLabelStyle
{
  [(NTKUltraCubeContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = +[NTKUltraCubeContentView timeLabelFontForDevice:self->_device size:self->_typeface typeface:self->_role role:round(self->_timeElementUnitHeight * v9)];
  v12 = +[NTKUltraCubeContentView timeLabelStyleForDevice:font:baseline:faceBounds:](NTKUltraCubeContentView, "timeLabelStyleForDevice:font:baseline:faceBounds:", self->_device, v11, self->_timeElementUnitBaseline, v4, v6, v8, v10);

  return v12;
}

+ (id)timeLabelStyleForDevice:(id)a3 font:(id)a4 baseline:(double)a5 faceBounds:(CGRect)a6
{
  double width = a6.size.width;
  double v7 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, a4, a3, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, 0.0, round(a6.size.height * a5));
  double v8 = [v7 layoutRule];
  [v8 referenceFrame];
  double v10 = v9;
  double v12 = v11;

  id v13 = [v7 layoutRule];
  objc_msgSend(v13, "setReferenceFrame:", 0.0, v10, width, v12);

  long long v14 = [v7 layoutRule];
  [v14 setHorizontalLayout:1];

  return v7;
}

+ (id)timeLabelFontForDevice:(id)a3 size:(double)a4 typeface:(unint64_t)a5 role:(unint64_t)a6
{
  unsigned int v9 = NTKEnableAODVibrancy() ^ 1;
  if (a6 == 1) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  if (a5)
  {
    if (a5 == 2)
    {
      double v11 = round(a4 * 0.9);
      +[NTKUltraCubeFontLoader tokyoFontDescriptorOutlined:v10];
    }
    else
    {
      double v11 = round(a4 * 0.95);
      +[NTKUltraCubeFontLoader sfNumeralsFontDescriptorOutlined:v10];
    uint64_t v12 = };
  }
  else
  {
    double v11 = round(a4 * 0.9);
    uint64_t v12 = +[NTKUltraCubeFontLoader nyNumeralsFontDescriptorOutlined:v10];
  }
  id v13 = (void *)v12;
  long long v14 = +[CLKFont fontWithDescriptor:v12 size:v11];

  return v14;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)midgroundView
{
  return self->_midgroundView;
}

- (NTKUltraCubeContentEffect)contentEffect
{
  return self->_contentEffect;
}

- (UIColor)timeElementShadowColor
{
  return self->_timeElementShadowColor;
}

- (BOOL)isTimeElementFront
{
  return self->_isTimeElementFront;
}

- (double)timeElementUnitHeight
{
  return self->_timeElementUnitHeight;
}

- (void)setTimeElementUnitHeight:(double)a3
{
  self->_timeElementUnitHeight = a3;
}

- (double)timeElementUnitBaseline
{
  return self->_timeElementUnitBaseline;
}

- (void)setTimeElementUnitBaseline:(double)a3
{
  self->_timeElementUnitBaseline = a3;
}

- (unint64_t)typeface
{
  return self->_typeface;
}

- (NTKUltraCubeImageContainerView)foregroundContainerView
{
  return self->_foregroundContainerView;
}

- (void)setForegroundContainerView:(id)a3
{
}

- (NTKUltraCubeImageContainerView)backgroundContainerView
{
  return self->_backgroundContainerView;
}

- (void)setBackgroundContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundContainerView, 0);
  objc_storeStrong((id *)&self->_foregroundContainerView, 0);
  objc_storeStrong((id *)&self->_timeElementShadowColor, 0);
  objc_storeStrong((id *)&self->_contentEffect, 0);
  objc_storeStrong((id *)&self->_midgroundView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_maskingLayer, 0);
  objc_storeStrong((id *)&self->_cornerView, 0);
  objc_storeStrong((id *)&self->_bottomGradientView, 0);
  objc_storeStrong((id *)&self->_topGradientView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_backgroundMonochromeColorMatrix, 0);
  objc_storeStrong((id *)&self->_foregroundMonochromeColorMatrix, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end