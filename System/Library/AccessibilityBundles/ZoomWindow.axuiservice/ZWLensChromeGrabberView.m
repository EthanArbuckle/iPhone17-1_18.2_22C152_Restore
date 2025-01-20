@interface ZWLensChromeGrabberView
- (BOOL)isAccessibilityElement;
- (BOOL)isExpanded;
- (CAShapeLayer)etchLayer;
- (CAShapeLayer)outerBorderLayer;
- (ZWLensChromeGrabberView)initWithCoder:(id)a3;
- (ZWLensChromeGrabberView)initWithEdge:(int64_t)a3 startExpanded:(BOOL)a4;
- (ZWLensChromeGrabberView)initWithFrame:(CGRect)a3;
- (id)_grabberEtchPathForCurrentEdge;
- (id)_grabberPathForCurrentEdgeIncludingFlatEdge:(BOOL)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (int64_t)grabberEdge;
- (unint64_t)accessibilityTraits;
- (void)collapseGrabberAnimated:(BOOL)a3;
- (void)expandGrabberAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setEtchLayer:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setGrabberEdge:(int64_t)a3;
- (void)setOuterBorderLayer:(id)a3;
@end

@implementation ZWLensChromeGrabberView

- (ZWLensChromeGrabberView)initWithFrame:(CGRect)a3
{
  +[NSException raise:@"NotSupported", @"Use initWithEdge:startExpanded:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height format];

  return [(ZWLensChromeGrabberView *)self initWithEdge:2 startExpanded:1];
}

- (ZWLensChromeGrabberView)initWithCoder:(id)a3
{
  +[NSException raise:@"NotSupported" format:@"Use initWithEdge:startExpanded:"];

  return [(ZWLensChromeGrabberView *)self initWithEdge:2 startExpanded:1];
}

- (ZWLensChromeGrabberView)initWithEdge:(int64_t)a3 startExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  v26.receiver = self;
  v26.super_class = (Class)ZWLensChromeGrabberView;
  v6 = -[ZWLensChromeGrabberView initWithFrame:](&v26, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    [(ZWLensChromeGrabberView *)v6 setGrabberEdge:a3];
    v8 = +[CAShapeLayer layer];
    [(ZWLensChromeGrabberView *)v7 setOuterBorderLayer:v8];
    v9 = [(ZWLensChromeGrabberView *)v7 layer];
    [v9 addSublayer:v8];

    id v10 = +[UIColor clearColor];
    objc_msgSend(v8, "setFillColor:", objc_msgSend(v10, "CGColor"));

    ZWLensOuterColor();
    id v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v11, "CGColor"));

    double v12 = ZWLensOuterBorderWidth();
    [v8 setLineWidth:v12 + v12];
    v13 = +[CAShapeLayer layer];
    [(ZWLensChromeGrabberView *)v7 setEtchLayer:v13];
    v14 = [(ZWLensChromeGrabberView *)v7 layer];
    [v14 addSublayer:v13];

    id v15 = +[UIColor clearColor];
    objc_msgSend(v13, "setFillColor:", objc_msgSend(v15, "CGColor"));

    ZWLensOuterColor();
    id v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStrokeColor:", objc_msgSend(v16, "CGColor"));

    [v13 setLineWidth:ZWLensOuterBorderWidth()];
    [v13 setLineJoin:kCALineJoinBevel];
    if ([(ZWLensChromeGrabberView *)v7 grabberEdge])
    {
      v17 = [(ZWLensChromeGrabberView *)v7 grabberEdge];
      if (v17 == (unsigned char *)&dword_0 + 2) {
        uint64_t v18 = 7;
      }
      else {
        uint64_t v18 = 8;
      }
      if (v17 == (unsigned char *)&dword_0 + 2) {
        uint64_t v19 = 8;
      }
      else {
        uint64_t v19 = 7;
      }
    }
    else
    {
      uint64_t v19 = 8;
      uint64_t v18 = 7;
    }
    v20 = +[NSLayoutConstraint constraintWithItem:v7 attribute:v18 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:90.0];
    LODWORD(v21) = 1148829696;
    [v20 setPriority:v21];
    [(ZWLensChromeGrabberView *)v7 addConstraint:v20];
    v22 = +[NSLayoutConstraint constraintWithItem:v7 attribute:v19 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:20.0];

    LODWORD(v23) = 1148829696;
    [v22 setPriority:v23];
    [(ZWLensChromeGrabberView *)v7 addConstraint:v22];

    if (v4) {
      [(ZWLensChromeGrabberView *)v7 expandGrabberAnimated:0];
    }
    else {
      [(ZWLensChromeGrabberView *)v7 collapseGrabberAnimated:0];
    }
    v24 = ZWLensInnerColor();
    [(ZWLensChromeGrabberView *)v7 setBackgroundColor:v24];
  }
  return v7;
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)ZWLensChromeGrabberView;
  [(ZWLensChromeGrabberView *)&v31 layoutSubviews];
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  v3 = [(ZWLensChromeGrabberView *)self _grabberPathForCurrentEdgeIncludingFlatEdge:1];
  BOOL v4 = +[CAShapeLayer layer];
  id v5 = v3;
  objc_msgSend(v4, "setPath:", objc_msgSend(v5, "CGPath"));
  v6 = [(ZWLensChromeGrabberView *)self layer];
  [v6 setMask:v4];

  [(ZWLensChromeGrabberView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [(ZWLensChromeGrabberView *)self outerBorderLayer];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  id v16 = [(ZWLensChromeGrabberView *)self _grabberPathForCurrentEdgeIncludingFlatEdge:0];
  id v17 = [v16 CGPath];
  uint64_t v18 = [(ZWLensChromeGrabberView *)self outerBorderLayer];
  [v18 setPath:v17];

  [(ZWLensChromeGrabberView *)self bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  v27 = [(ZWLensChromeGrabberView *)self etchLayer];
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  id v28 = [(ZWLensChromeGrabberView *)self _grabberEtchPathForCurrentEdge];
  id v29 = [v28 CGPath];
  v30 = [(ZWLensChromeGrabberView *)self etchLayer];
  [v30 setPath:v29];

  +[CATransaction commit];
}

- (id)_grabberPathForCurrentEdgeIncludingFlatEdge:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ZWLensChromeGrabberView *)self grabberEdge])
  {
    int64_t v5 = [(ZWLensChromeGrabberView *)self grabberEdge];
    if (v5 == 2) {
      double v6 = 20.0;
    }
    else {
      double v6 = 90.0;
    }
    if (v5 == 2) {
      double v7 = 90.0;
    }
    else {
      double v7 = 20.0;
    }
  }
  else
  {
    double v6 = 20.0;
    double v7 = 90.0;
  }
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = v7;
  v24.size.height = v6;
  double MidX = CGRectGetMidX(v24);
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = v7;
  v25.size.height = v6;
  double MidY = CGRectGetMidY(v25);
  double v10 = +[UIBezierPath bezierPath];
  objc_msgSend(v10, "moveToPoint:", 0.0, 0.0);
  if ([(ZWLensChromeGrabberView *)self grabberEdge]
    && (char *)[(ZWLensChromeGrabberView *)self grabberEdge] != (char *)&dword_0 + 2)
  {
    objc_msgSend(v10, "addCurveToPoint:controlPoint1:controlPoint2:", v7 + 0.0, v6 * 0.5 + 0.0, 0.0, v6 * 0.25 + 0.0, v7 + 0.0, v6 * 0.25 + 0.0);
    double v15 = v6 * 3.0 * 0.25 + 0.0;
    double v12 = v10;
    double v13 = 0.0;
    double v14 = v6 + 0.0;
    double v11 = v7 + 0.0;
    double v16 = 0.0;
    double v17 = v15;
  }
  else
  {
    objc_msgSend(v10, "addCurveToPoint:controlPoint1:controlPoint2:", v7 * 0.5 + 0.0, v6 + 0.0, v7 * 0.25 + 0.0, 0.0, v7 * 0.25 + 0.0, v6 + 0.0);
    double v11 = v7 * 3.0 * 0.25 + 0.0;
    double v12 = v10;
    double v13 = v7 + 0.0;
    double v14 = 0.0;
    double v15 = v6 + 0.0;
    double v16 = v11;
    double v17 = 0.0;
  }
  objc_msgSend(v12, "addCurveToPoint:controlPoint1:controlPoint2:", v13, v14, v11, v15, v16, v17);
  if (v3) {
    [v10 closePath];
  }
  if (![(ZWLensChromeGrabberView *)self grabberEdge]
    || (char *)[(ZWLensChromeGrabberView *)self grabberEdge] == (char *)&dword_0 + 3)
  {
    long long v18 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v22.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v22.c = v18;
    *(_OWORD *)&v22.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v21.a = *(_OWORD *)&v22.a;
    *(_OWORD *)&v21.c = v18;
    *(_OWORD *)&v21.tx = *(_OWORD *)&v22.tx;
    CGAffineTransformTranslate(&v22, &v21, MidX, MidY);
    CGAffineTransform v20 = v22;
    CGAffineTransformRotate(&v21, &v20, 3.14159265);
    CGAffineTransform v22 = v21;
    CGAffineTransform v20 = v21;
    CGAffineTransformTranslate(&v21, &v20, -MidX, -MidY);
    CGAffineTransform v22 = v21;
    [v10 applyTransform:&v21];
  }

  return v10;
}

- (id)_grabberEtchPathForCurrentEdge
{
  if ([(ZWLensChromeGrabberView *)self grabberEdge])
  {
    int64_t v3 = [(ZWLensChromeGrabberView *)self grabberEdge];
    if (v3 == 2) {
      double v4 = 20.0;
    }
    else {
      double v4 = 90.0;
    }
    if (v3 == 2) {
      double v5 = 90.0;
    }
    else {
      double v5 = 20.0;
    }
  }
  else
  {
    double v4 = 20.0;
    double v5 = 90.0;
  }
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = v5;
  v20.size.height = v4;
  double MidX = CGRectGetMidX(v20);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v5;
  v21.size.height = v4;
  double MidY = CGRectGetMidY(v21);
  double v8 = +[UIBezierPath bezierPath];
  if ([(ZWLensChromeGrabberView *)self grabberEdge]
    && (char *)[(ZWLensChromeGrabberView *)self grabberEdge] != (char *)&dword_0 + 2)
  {
    double v11 = MidX + -10.0;
    double v13 = MidY + -10.0;
    double v10 = MidY + 10.0;
    double v12 = v8;
    double v9 = MidX + -10.0;
  }
  else
  {
    double v9 = MidX + -10.0;
    double v10 = MidY + -10.0;
    double v11 = MidX + 10.0;
    double v12 = v8;
    double v13 = MidY + -10.0;
  }
  objc_msgSend(v12, "moveToPoint:", v9, v13);
  objc_msgSend(v8, "addLineToPoint:", MidX, MidY);
  objc_msgSend(v8, "addLineToPoint:", v11, v10);
  if (![(ZWLensChromeGrabberView *)self grabberEdge]
    || (char *)[(ZWLensChromeGrabberView *)self grabberEdge] == (char *)&dword_0 + 3)
  {
    long long v14 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v18.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v18.c = v14;
    *(_OWORD *)&v18.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v17.a = *(_OWORD *)&v18.a;
    *(_OWORD *)&v17.c = v14;
    *(_OWORD *)&v17.tx = *(_OWORD *)&v18.tx;
    CGAffineTransformTranslate(&v18, &v17, MidX, MidY);
    CGAffineTransform v16 = v18;
    CGAffineTransformRotate(&v17, &v16, 3.14159265);
    CGAffineTransform v18 = v17;
    CGAffineTransform v16 = v17;
    CGAffineTransformTranslate(&v17, &v16, -MidX, -MidY);
    CGAffineTransform v18 = v17;
    [v8 applyTransform:&v17];
  }

  return v8;
}

- (void)expandGrabberAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(ZWLensChromeGrabberView *)self setExpanded:1];
  double v4 = 0.0;
  if (v3) {
    double v4 = ZWDefaultFadeAnimationDuration();
  }

  +[UIView animateWithDuration:&__block_literal_global_0 animations:v4];
}

- (void)collapseGrabberAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(ZWLensChromeGrabberView *)self setExpanded:0];
  double v5 = 0.0;
  if (v3) {
    double v5 = ZWDefaultFadeAnimationDuration();
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __51__ZWLensChromeGrabberView_collapseGrabberAnimated___block_invoke;
  v6[3] = &unk_78CA8;
  v6[4] = self;
  +[UIView animateWithDuration:v6 animations:v5];
}

id __51__ZWLensChromeGrabberView_collapseGrabberAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (BOOL)isAccessibilityElement
{
  [(ZWLensChromeGrabberView *)self alpha];
  if (v3 <= 0.0) {
    return 0;
  }
  else {
    return [(ZWLensChromeGrabberView *)self isHidden] ^ 1;
  }
}

- (id)accessibilityLabel
{
  unint64_t v2 = [(ZWLensChromeGrabberView *)self grabberEdge];
  if (v2 <= 3)
  {
    double v3 = ZWLocString(off_78D38[v2]);
  }

  return v3;
}

- (id)accessibilityHint
{
  return ZWLocString(@"ZW_GRABBER_HINT");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (int64_t)grabberEdge
{
  return self->_grabberEdge;
}

- (void)setGrabberEdge:(int64_t)a3
{
  self->_grabberEdge = a3;
}

- (CAShapeLayer)outerBorderLayer
{
  return self->_outerBorderLayer;
}

- (void)setOuterBorderLayer:(id)a3
{
}

- (CAShapeLayer)etchLayer
{
  return self->_etchLayer;
}

- (void)setEtchLayer:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etchLayer, 0);

  objc_storeStrong((id *)&self->_outerBorderLayer, 0);
}

@end