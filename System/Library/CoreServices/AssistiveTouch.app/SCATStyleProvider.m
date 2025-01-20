@interface SCATStyleProvider
+ (id)sharedStyleProvider;
+ (int64_t)theme;
- (BOOL)_useVibrantBlendMode;
- (CGImage)bezelItemBackgroundImage;
- (CGImage)bezelItemSelectedBackgroundImage;
- (CGPath)gridCenterPointPathWithAvailableFrame:(CGRect)a3;
- (CGRect)bezelItemBackgroundImageContentsCenter;
- (CGRect)gridCenterPointFrameWithAvailableFrame:(CGRect)a3;
- (CGSize)gridShadowOffset;
- (CGSize)previewShadowOffset;
- (double)_gridImageShadowBlur;
- (double)arrowHeadBaseAngle;
- (double)arrowHeadBaseOffset;
- (double)arrowHeadBaseRadius;
- (double)arrowHeadTipOffset;
- (double)controlArrowHeadLargeSideLength;
- (double)controlArrowHeadSmallSideLength;
- (double)controlArrowOutlineThickness;
- (double)controlArrowThickness;
- (double)cursorBackgroundBorderWidth;
- (double)cursorContainerOpacity;
- (double)cursorElementPadding;
- (double)cursorForegroundBorderWidth;
- (double)cursorHighVisibilityMultiplier;
- (double)cursorRoundedRectCornerRadius;
- (double)grayFingerInnerCircleInnerRadius;
- (double)grayFingerInnerCircleOuterRadius;
- (double)grayFingerInnerRadius;
- (double)grayFingerOuterRadius;
- (double)gridLineThickness;
- (double)menuKnockoutBorderOpacity;
- (double)menuPageControlHighlightedBorderLineWidth;
- (double)minimumGridSquareWidth;
- (double)pointPickerPromptCornerRadius;
- (double)pointPickerPromptPadding;
- (double)previewLineThickness;
- (double)previewOutlineThickness;
- (double)previewShadowBlur;
- (double)rotation90ControlNearestRadius;
- (double)rotationControlAngleAwayFromMidAngle;
- (double)rotationControlCurveRadius;
- (double)rotationControlLength;
- (double)scannerCursorOutlineThickness;
- (double)scannerCursorThickness;
- (id)atvMenuFocusedItemColor;
- (id)atvMenuUnfocusedItemColor;
- (id)controlArrowColor;
- (id)controlArrowHighlightedColor;
- (id)controlArrowOutlineColor;
- (id)grayFingerInnerFill;
- (id)gridCenterPointImageWithAvailableSize:(CGSize)a3;
- (id)gridColor;
- (id)gridShadowColor;
- (id)menuKnockoutColor;
- (id)menuPageControlHighlightedBorderColor;
- (id)pointPickerPromptFont;
- (id)pointPickerPromptTextColor;
- (id)previewColor;
- (id)previewOutlineColor;
- (id)previewShadowColor;
- (id)rotation90ControlFont;
- (id)scannerBlueColor;
- (int64_t)menuKnockoutBorderOverlayBlendMode;
- (int64_t)pointPickerPromptBackdropStyle;
- (void)_drawCrosshairWithSize:(CGSize)a3 lineThickness:(double)a4;
- (void)dealloc;
- (void)unloadResources;
@end

@implementation SCATStyleProvider

+ (int64_t)theme
{
  return 0;
}

+ (id)sharedStyleProvider
{
  if (qword_1001F0BA8 != -1) {
    dispatch_once(&qword_1001F0BA8, &stru_1001AE140);
  }
  v2 = (void *)qword_1001F0BA0;

  return v2;
}

- (void)dealloc
{
  [(SCATStyleProvider *)self unloadResources];
  v3.receiver = self;
  v3.super_class = (Class)SCATStyleProvider;
  [(SCATStyleProvider *)&v3 dealloc];
}

- (id)scannerBlueColor
{
  return +[UIColor colorWithRed:0.250980392 green:0.670588235 blue:0.992156863 alpha:1.0];
}

- (id)menuKnockoutColor
{
  return +[UIColor whiteColor];
}

- (double)menuKnockoutBorderOpacity
{
  return 0.3;
}

- (BOOL)_useVibrantBlendMode
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 _graphicsQuality];

  BOOL v4 = !UIAccessibilityIsReduceTransparencyEnabled();
  return v3 != (id)10 && v4;
}

- (int64_t)menuKnockoutBorderOverlayBlendMode
{
  if ([(SCATStyleProvider *)self _useVibrantBlendMode]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)atvMenuFocusedItemColor
{
  return +[UIColor whiteColor];
}

- (id)atvMenuUnfocusedItemColor
{
  return +[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
}

- (double)scannerCursorThickness
{
  v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 assistiveTouchScannerCursorHighVisibilityEnabled];

  double result = 3.0;
  if (v3) {
    return 12.0;
  }
  return result;
}

- (double)scannerCursorOutlineThickness
{
  v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 assistiveTouchScannerCursorHighVisibilityEnabled];

  double result = 6.0;
  if (v3) {
    return 15.0;
  }
  return result;
}

- (double)cursorForegroundBorderWidth
{
  return 2.0;
}

- (double)cursorBackgroundBorderWidth
{
  return 2.0;
}

- (double)cursorHighVisibilityMultiplier
{
  return 4.0;
}

- (double)cursorRoundedRectCornerRadius
{
  unsigned int v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 assistiveTouchScannerCursorHighVisibilityEnabled];

  double result = 8.0;
  if (v4)
  {
    [(SCATStyleProvider *)self cursorHighVisibilityMultiplier];
    return v6 * 0.5 * 8.0;
  }
  return result;
}

- (double)cursorContainerOpacity
{
  return 0.3;
}

- (double)cursorElementPadding
{
  return 9.0;
}

- (double)menuPageControlHighlightedBorderLineWidth
{
  return 1.0;
}

- (id)menuPageControlHighlightedBorderColor
{
  return +[UIColor whiteColor];
}

- (id)pointPickerPromptTextColor
{
  return +[UIColor whiteColor];
}

- (double)pointPickerPromptPadding
{
  return 20.0;
}

- (id)pointPickerPromptFont
{
  return +[UIFont systemFontOfSize:20.0];
}

- (int64_t)pointPickerPromptBackdropStyle
{
  return 11060;
}

- (double)pointPickerPromptCornerRadius
{
  return 10.0;
}

- (id)gridColor
{
  return +[UIColor colorWithWhite:1.0 alpha:0.5];
}

- (id)gridShadowColor
{
  return +[UIColor colorWithWhite:0.0 alpha:0.5];
}

- (CGSize)gridShadowOffset
{
  double v2 = 2.0;
  double v3 = 2.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)gridLineThickness
{
  return 2.0;
}

- (double)_gridImageShadowBlur
{
  return 2.0;
}

- (void)_drawCrosshairWithSize:(CGSize)a3 lineThickness:(double)a4
{
  double height = a3.height;
  CGFloat width = a3.width;
  CGFloat v7 = (a3.width - a4) * 0.5;
  uint64_t v8 = 0;
  double v9 = height;
  UIRectFill(*(CGRect *)(&a4 - 2));
  uint64_t v11 = 0;
  CGFloat v12 = width;
  double v13 = a4;

  double v10 = (height - a4) * 0.5;
  UIRectFill(*(CGRect *)&v11);
}

- (CGRect)gridCenterPointFrameWithAvailableFrame:(CGRect)a3
{
  if (a3.size.width >= a3.size.height) {
    double height = a3.size.height;
  }
  else {
    double height = a3.size.width;
  }
  CGFloat v4 = fmin(height * 0.6, 100.0);
  v5.origin.x = a3.origin.x + (a3.size.width - v4) * 0.5;
  v5.origin.y = a3.origin.y + (a3.size.height - v4) * 0.5;
  v5.size.CGFloat width = v4;
  v5.size.double height = v4;
  return CGRectIntegral(v5);
}

- (CGPath)gridCenterPointPathWithAvailableFrame:(CGRect)a3
{
  -[SCATStyleProvider gridCenterPointFrameWithAvailableFrame:](self, "gridCenterPointFrameWithAvailableFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3 * 0.5;
  *(float *)&double v3 = v3 * 0.5;
  +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v5 * 0.5, roundf(*(float *)&v3), 0.0, 6.28318531);
  id v6 = objc_claimAutoreleasedReturnValue();
  CGFloat v7 = (CGPath *)[v6 CGPath];

  return v7;
}

- (id)gridCenterPointImageWithAvailableSize:(CGSize)a3
{
  if (a3.width >= a3.height) {
    a3.CGFloat width = a3.height;
  }
  double v4 = a3.width * 0.6;
  p_cachedGridCenterPointImage = &self->_cachedGridCenterPointImage;
  double v6 = a3.width * 0.6;
  if (a3.width * 0.6 >= 100.0)
  {
    if (*p_cachedGridCenterPointImage)
    {
      CGFloat v7 = *p_cachedGridCenterPointImage;
      goto LABEL_10;
    }
    double v6 = 100.0;
  }
  uint64_t v8 = +[SCATStyleProvider sharedStyleProvider];
  double v9 = +[UIScreen mainScreen];
  [v9 scale];
  CGFloat v11 = v10;
  v18.CGFloat width = v6;
  v18.double height = v6;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v11);

  CGFloat v12 = +[UIColor whiteColor];
  [v12 set];

  [v8 scannerCursorOutlineThickness];
  -[SCATStyleProvider _drawCrosshairWithSize:lineThickness:](self, "_drawCrosshairWithSize:lineThickness:", v6, v6, v13);
  v14 = [v8 scannerBlueColor];
  [v14 set];

  [v8 scannerCursorThickness];
  -[SCATStyleProvider _drawCrosshairWithSize:lineThickness:](self, "_drawCrosshairWithSize:lineThickness:", v6, v6, v15);
  UIGraphicsGetImageFromCurrentImageContext();
  CGFloat v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (v4 >= 100.0) {
    objc_storeStrong((id *)p_cachedGridCenterPointImage, v7);
  }
  UIGraphicsEndImageContext();

LABEL_10:

  return v7;
}

- (double)minimumGridSquareWidth
{
  return 10.0;
}

- (id)previewColor
{
  return +[UIColor colorWithWhite:0.8 alpha:1.0];
}

- (id)previewOutlineColor
{
  return +[UIColor colorWithWhite:0.0 alpha:0.5];
}

- (double)previewOutlineThickness
{
  return 1.0;
}

- (id)previewShadowColor
{
  return +[UIColor colorWithWhite:0.0 alpha:0.1];
}

- (double)previewShadowBlur
{
  return 2.0;
}

- (CGSize)previewShadowOffset
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.double height = v3;
  result.CGFloat width = v2;
  return result;
}

- (double)previewLineThickness
{
  return 3.0;
}

- (double)arrowHeadBaseOffset
{
  return 5.0;
}

- (double)arrowHeadBaseAngle
{
  return 0.785398163;
}

- (double)arrowHeadBaseRadius
{
  return 10.0;
}

- (double)arrowHeadTipOffset
{
  return 10.0;
}

- (id)controlArrowColor
{
  return +[UIColor colorWithWhite:0.6 alpha:1.0];
}

- (id)controlArrowHighlightedColor
{
  return +[UIColor whiteColor];
}

- (double)controlArrowThickness
{
  int IsPad = AXDeviceIsPad();
  double result = 2.0;
  if (IsPad) {
    return 3.0;
  }
  return result;
}

- (id)controlArrowOutlineColor
{
  return +[UIColor colorWithWhite:0.0 alpha:0.8];
}

- (double)controlArrowOutlineThickness
{
  int IsPad = AXDeviceIsPad();
  double result = 2.0;
  if (IsPad) {
    return 3.0;
  }
  return result;
}

- (double)controlArrowHeadLargeSideLength
{
  int IsPad = AXDeviceIsPad();
  double result = 12.0;
  if (IsPad) {
    return 18.0;
  }
  return result;
}

- (double)controlArrowHeadSmallSideLength
{
  int IsPad = AXDeviceIsPad();
  double result = 7.0;
  if (IsPad) {
    return 10.5;
  }
  return result;
}

- (double)grayFingerInnerRadius
{
  int IsPad = AXDeviceIsPad();
  double result = 25.5;
  if (!IsPad) {
    return 17.0;
  }
  return result;
}

- (double)grayFingerOuterRadius
{
  [(SCATStyleProvider *)self grayFingerInnerRadius];
  double v4 = v3;
  [(SCATStyleProvider *)self controlArrowThickness];
  return v4 + v5;
}

- (id)grayFingerInnerFill
{
  return +[UIColor colorWithWhite:0.0 alpha:0.6];
}

- (double)grayFingerInnerCircleOuterRadius
{
  [(SCATStyleProvider *)self grayFingerInnerCircleInnerRadius];
  double v4 = v3;
  [(SCATStyleProvider *)self controlArrowThickness];
  return v4 + v5;
}

- (double)grayFingerInnerCircleInnerRadius
{
  int IsPad = AXDeviceIsPad();
  double result = 2.0;
  if (IsPad) {
    return 3.0;
  }
  return result;
}

- (double)rotationControlCurveRadius
{
  int IsPad = AXDeviceIsPad();
  double result = 43.5;
  if (!IsPad) {
    return 29.0;
  }
  return result;
}

- (double)rotationControlLength
{
  [(SCATStyleProvider *)self rotationControlCurveRadius];
  return v2 * 1.57079633;
}

- (double)rotationControlAngleAwayFromMidAngle
{
  return 0.785398163;
}

- (double)rotation90ControlNearestRadius
{
  int IsPad = AXDeviceIsPad();
  double result = 34.0;
  if (IsPad) {
    return 51.0;
  }
  return result;
}

- (id)rotation90ControlFont
{
  return +[UIFont boldSystemFontOfSize:14.0];
}

- (CGImage)bezelItemBackgroundImage
{
  double result = self->_bezelItemBackgroundImage;
  if (!result)
  {
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    id v7 = +[UIColor colorWithRed:0.117647059 green:0.117647059 blue:0.117647059 alpha:1.0];
    uint64_t v8 = (CGColor *)[v7 CGColor];
    id v9 = +[UIColor colorWithRed:0.117647059 green:0.117647059 blue:0.117647059 alpha:1.0];
    self->_bezelItemBackgroundImage = sub_1000BFA78(v8, (CGColor *)[v9 CGColor], 0.0, 0.0, 200.0, 200.0, CGRectZero.origin.x, y, width, height, 1.0, 5.0, 3.5);

    return self->_bezelItemBackgroundImage;
  }
  return result;
}

- (CGImage)bezelItemSelectedBackgroundImage
{
  double result = self->_bezelItemSelectedBackgroundImage;
  if (!result)
  {
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    id v7 = +[UIColor colorWithRed:0.352941185 green:0.352941176 blue:0.352941176 alpha:1.0];
    uint64_t v8 = (CGColor *)[v7 CGColor];
    id v9 = +[UIColor colorWithRed:0.352941185 green:0.352941176 blue:0.352941176 alpha:1.0];
    self->_bezelItemSelectedBackgroundImage = sub_1000BFA78(v8, (CGColor *)[v9 CGColor], 0.0, 0.0, 200.0, 200.0, CGRectZero.origin.x, y, width, height, 1.0, 5.0, 3.5);

    return self->_bezelItemSelectedBackgroundImage;
  }
  return result;
}

- (CGRect)bezelItemBackgroundImageContentsCenter
{
  double v2 = 0.03;
  double v3 = 0.94;
  double v4 = 0.03;
  double v5 = 0.94;
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v4;
  result.origin.x = v2;
  return result;
}

- (void)unloadResources
{
  bezelItemBackgroundImage = self->_bezelItemBackgroundImage;
  if (bezelItemBackgroundImage)
  {
    CGImageRelease(bezelItemBackgroundImage);
    self->_bezelItemBackgroundImage = 0;
  }
  bezelItemSelectedBackgroundImage = self->_bezelItemSelectedBackgroundImage;
  if (bezelItemSelectedBackgroundImage)
  {
    CGImageRelease(bezelItemSelectedBackgroundImage);
    self->_bezelItemSelectedBackgroundImage = 0;
  }
  cachedGridCenterPointImage = self->_cachedGridCenterPointImage;
  self->_cachedGridCenterPointImage = 0;
}

- (void).cxx_destruct
{
}

@end