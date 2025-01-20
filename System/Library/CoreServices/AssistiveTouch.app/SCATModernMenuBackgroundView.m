@interface SCATModernMenuBackgroundView
- (BOOL)scatPerformAction:(int)a3;
- (BOOL)scatSupportsAction:(int)a3;
- (BOOL)shouldRoundMenuCorners;
- (CGPath)_copyMenuPathWithNoTipForRect:(CGRect)a3;
- (CGPath)_copyMenuPathWithTipForRect:(CGRect)a3;
- (CGPath)menuBorderPath;
- (CGPath)scatPath;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 includeTip:(BOOL)a4;
- (SCATModernMenuBackgroundContainerView)containerView;
- (SCATModernMenuBackgroundView)initWithFrame:(CGRect)a3;
- (UIVisualEffectView)backdropView;
- (double)_adjustedXAnchorPositionToClearCornersOfRect:(CGRect)a3;
- (double)_menuCornerRadius;
- (double)_menuTipBase;
- (double)_menuTipBaseCornerRadius;
- (double)_menuTipCornerRadius;
- (double)_menuTipHeight;
- (double)normalizedHorizontalTipCenter;
- (id)scatOverrideCursorTheme;
- (id)scatSpeakableDescription;
- (int64_t)tip;
- (void)_updateBackdropWithPath:(CGPath *)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackdropView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setMenuBorderPath:(CGPath *)a3;
- (void)setNormalizedHorizontalTipCenter:(double)a3;
- (void)setShouldRoundMenuCorners:(BOOL)a3;
- (void)setTip:(int64_t)a3;
@end

@implementation SCATModernMenuBackgroundView

- (SCATModernMenuBackgroundView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCATModernMenuBackgroundView;
  v3 = -[SCATModernMenuBackgroundView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[SCATModernMenuBackgroundContainerView initWithFrame:]([SCATModernMenuBackgroundContainerView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    [(SCATModernMenuBackgroundView *)v3 setContainerView:v4];
    [(SCATModernMenuBackgroundView *)v3 addSubview:v4];
    v5 = +[UIBlurEffect effectWithStyle:9];
    v6 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v5];
    backdropView = v3->_backdropView;
    v3->_backdropView = v6;
  }
  return v3;
}

- (void)dealloc
{
  [(SCATModernMenuBackgroundView *)self setMenuBorderPath:0];
  v3.receiver = self;
  v3.super_class = (Class)SCATModernMenuBackgroundView;
  [(SCATModernMenuBackgroundView *)&v3 dealloc];
}

- (void)setTip:(int64_t)a3
{
  if (self->_tip != a3)
  {
    self->_tip = a3;
    [(SCATModernMenuBackgroundView *)self setNeedsLayout];
  }
}

- (void)setNormalizedHorizontalTipCenter:(double)a3
{
  if (self->_normalizedHorizontalTipCenter != a3)
  {
    [(SCATModernMenuBackgroundView *)self setNeedsLayout];
    self->_normalizedHorizontalTipCenter = a3;
  }
}

- (CGPath)menuBorderPath
{
  return self->_menuBorderPath;
}

- (void)setMenuBorderPath:(CGPath *)a3
{
  if (a3) {
    CGPathRetain(a3);
  }
  menuBorderPath = self->_menuBorderPath;
  if (menuBorderPath) {
    CGPathRelease(menuBorderPath);
  }
  self->_menuBorderPath = a3;
}

- (CGSize)sizeThatFits:(CGSize)a3 includeTip:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(SCATModernMenuBackgroundView *)self containerView];
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v8 = v7;
  double v10 = v9;

  if (v4)
  {
    [(SCATModernMenuBackgroundView *)self _menuTipHeight];
    double v10 = v10 + v11;
  }
  double v12 = v8;
  double v13 = v10;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(SCATModernMenuBackgroundView *)self tip] != 0;

  -[SCATModernMenuBackgroundView sizeThatFits:includeTip:](self, "sizeThatFits:includeTip:", v6, width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  int64_t tip = self->_tip;
  [(SCATModernMenuBackgroundView *)self bounds];
  if (tip) {
    BOOL v4 = -[SCATModernMenuBackgroundView _copyMenuPathWithTipForRect:](self, "_copyMenuPathWithTipForRect:");
  }
  else {
    BOOL v4 = -[SCATModernMenuBackgroundView _copyMenuPathWithNoTipForRect:](self, "_copyMenuPathWithNoTipForRect:");
  }
  v5 = v4;
  [(SCATModernMenuBackgroundView *)self setMenuBorderPath:v4];
  [(SCATModernMenuBackgroundView *)self _updateBackdropWithPath:v5];
  CGPathRelease(v5);
  [(SCATModernMenuBackgroundView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if ((id)[(SCATModernMenuBackgroundView *)self tip] == (id)1)
  {
    [(SCATModernMenuBackgroundView *)self _menuTipHeight];
    double v9 = v9 + v14;
  }
  else if ((id)[(SCATModernMenuBackgroundView *)self tip] != (id)2)
  {
    goto LABEL_8;
  }
  [(SCATModernMenuBackgroundView *)self _menuTipHeight];
  double v13 = v13 - v15;
LABEL_8:
  id v16 = [(SCATModernMenuBackgroundView *)self containerView];
  objc_msgSend(v16, "setFrame:", v7, v9, v11, v13);
}

- (double)_menuCornerRadius
{
  unsigned int v2 = [(SCATModernMenuBackgroundView *)self shouldRoundMenuCorners];
  double result = 0.0;
  if (v2) {
    return 10.0;
  }
  return result;
}

- (double)_menuTipBase
{
  return 25.0;
}

- (double)_menuTipHeight
{
  return 15.0;
}

- (double)_menuTipCornerRadius
{
  return 4.0;
}

- (double)_menuTipBaseCornerRadius
{
  return 8.0;
}

- (void)_updateBackdropWithPath:(CGPath *)a3
{
  id v6 = (id)objc_opt_new();
  [(SCATModernMenuBackgroundView *)self bounds];
  objc_msgSend(v6, "setFrame:");
  [v6 setPath:a3];
  v5 = [(UIVisualEffectView *)self->_backdropView layer];
  [v5 setMask:v6];
}

- (double)_adjustedXAnchorPositionToClearCornersOfRect:(CGRect)a3
{
  double width = a3.size.width;
  [(SCATModernMenuBackgroundView *)self normalizedHorizontalTipCenter];
  double v6 = width * v5;
  [(SCATModernMenuBackgroundView *)self _menuCornerRadius];
  double v8 = v7;
  [(SCATModernMenuBackgroundView *)self _menuTipBase];
  double v10 = v9;
  [(SCATModernMenuBackgroundView *)self _menuTipBaseCornerRadius];
  double v12 = v10 * 0.5 + v8 + v11;
  if (v6 >= v12)
  {
    double v13 = width - v8 - v11 - v10 * 0.5;
    double v12 = v6;
    if (v6 > v13) {
      return v13;
    }
  }
  return v12;
}

- (CGPath)_copyMenuPathWithTipForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    _AXLogWithFacility();
    return CGPathCreateMutable();
  }
  else
  {
    -[SCATModernMenuBackgroundView _adjustedXAnchorPositionToClearCornersOfRect:](self, "_adjustedXAnchorPositionToClearCornersOfRect:", x, y, width, height);
    double v10 = v9;
    [(SCATModernMenuBackgroundView *)self _menuCornerRadius];
    double v12 = v11;
    [(SCATModernMenuBackgroundView *)self _menuTipBase];
    double v23 = v13;
    [(SCATModernMenuBackgroundView *)self _menuTipHeight];
    double v15 = v14;
    [(SCATModernMenuBackgroundView *)self _menuTipCornerRadius];
    CGFloat v24 = y;
    double v17 = v16;
    [(SCATModernMenuBackgroundView *)self _menuTipBaseCornerRadius];
    double v19 = v18;
    v20 = +[UIBezierPath bezierPath];
    objc_msgSend(v20, "moveToPoint:", 0.0, v12 + v15);
    objc_msgSend(v20, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, 0.0, v15, v12, v12);
    objc_msgSend(v20, "addLineToPoint:", v10 - v23 * 0.5 - v19, v15);
    objc_msgSend(v20, "ax_addArcWithFirstPoint:secondPoint:cornerRadius:", v10 - v23 * 0.5, v15, v10 - v17, v17, v19);
    objc_msgSend(v20, "ax_addArcWithFirstPoint:secondPoint:cornerRadius:", v10, 0.0, v10 + v17, v17, v17);
    objc_msgSend(v20, "ax_addArcWithFirstPoint:secondPoint:cornerRadius:", v10 + v23 * 0.5, v15, v10 + v23 * 0.5 + v19, v15, v19);
    objc_msgSend(v20, "addLineToPoint:", width - v12, v15);
    objc_msgSend(v20, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, width, v15, v12, v12);
    objc_msgSend(v20, "addLineToPoint:", width, height - v12);
    objc_msgSend(v20, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, width, height, v12, v12);
    objc_msgSend(v20, "addLineToPoint:", v12, height);
    objc_msgSend(v20, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, 0.0, height, v12, v12);
    [v20 closePath];
    memset(&transform, 0, sizeof(transform));
    CGAffineTransformMakeTranslation(&transform, x, v24);
    if (self->_tip == 2)
    {
      CGAffineTransform v25 = transform;
      CGAffineTransformTranslate(&v26, &v25, 0.0, height);
      CGAffineTransform transform = v26;
      CGAffineTransform v25 = v26;
      CGAffineTransformScale(&v26, &v25, 1.0, -1.0);
      CGAffineTransform transform = v26;
    }
    id v21 = v20;
    v22 = CGPathCreateCopyByTransformingPath((CGPathRef)[v21 CGPath], &transform);

    return v22;
  }
}

- (CGPath)_copyMenuPathWithNoTipForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    _AXLogWithFacility();
    return CGPathCreateMutable();
  }
  else
  {
    [(SCATModernMenuBackgroundView *)self _menuCornerRadius];
    double v10 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v9);
    memset(&transform, 0, sizeof(transform));
    CGAffineTransformMakeTranslation(&transform, x, y);
    id v11 = v10;
    double v12 = CGPathCreateCopyByTransformingPath((CGPathRef)[v11 CGPath], &transform);

    return v12;
  }
}

- (id)scatSpeakableDescription
{
  return sub_100040EC8(@"EXIT_MENU");
}

- (CGPath)scatPath
{
  return [(SCATModernMenuBackgroundView *)self menuBorderPath];
}

- (BOOL)scatSupportsAction:(int)a3
{
  return a3 == 2010;
}

- (BOOL)scatPerformAction:(int)a3
{
  if (a3 == 2010)
  {
    BOOL v4 = +[SCATScannerManager sharedManager];
    double v5 = [v4 menu];

    [v5 handleMenuWasActivatedByScanner];
    double v6 = +[HNDAccessibilityManager sharedManager];
    [v6 refreshElements];
  }
  return a3 == 2010;
}

- (id)scatOverrideCursorTheme
{
  return &off_1001BBBC8;
}

- (SCATModernMenuBackgroundContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIVisualEffectView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (int64_t)tip
{
  return self->_tip;
}

- (double)normalizedHorizontalTipCenter
{
  return self->_normalizedHorizontalTipCenter;
}

- (BOOL)shouldRoundMenuCorners
{
  return self->_shouldRoundMenuCorners;
}

- (void)setShouldRoundMenuCorners:(BOOL)a3
{
  self->_shouldRoundMenuCorners = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);

  objc_storeStrong((id *)&self->_containerView, 0);
}

@end