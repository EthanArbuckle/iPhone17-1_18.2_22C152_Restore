@interface MKUserLocationHeadingArrowLayer
- (BOOL)_shouldBeVisibleForAccuracy:(double)a3;
- (CGPath)_pathWhenVisible:(BOOL)a3;
- (CGPoint)_positionWhenVisible:(BOOL)a3;
- (MKUserLocationHeadingArrowLayer)initWithUserLocationView:(id)a3;
- (UITraitCollection)traitCollection;
- (_MKPuckAnnotationView)userLocationView;
- (double)_baseRadiusWhenVisible:(BOOL)a3;
- (double)_tipRadiusWhenVisible:(BOOL)a3;
- (double)headingRadians;
- (double)minimumAccuracyRadius;
- (id)_animationToSetVisible:(BOOL)a3;
- (id)_bezierPathWithBaseRadius:(double)a3 tipRadius:(double)a4 baseHalfAngle:(double)a5;
- (unint64_t)mapType;
- (void)animateToSetVisible:(BOOL)a3 completion:(id)a4;
- (void)setHeadingRadians:(double)a3;
- (void)setMapType:(unint64_t)a3;
- (void)setMinimumAccuracyRadius:(double)a3;
- (void)setTraitCollection:(id)a3;
- (void)updateHeading:(double)a3;
- (void)updateHeadingAccuracy:(double)a3 previousAccuracy:(double)a4;
- (void)updateTintColor:(id)a3;
@end

@implementation MKUserLocationHeadingArrowLayer

- (MKUserLocationHeadingArrowLayer)initWithUserLocationView:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKUserLocationHeadingArrowLayer;
  v5 = [(MKUserLocationHeadingArrowLayer *)&v12 init];
  if (v5)
  {
    GEOConfigGetDouble();
    v5->_maxUncertaintyAngleToShowArrow = v6;
    [(id)objc_opt_class() innerDiameter];
    double v8 = v7 * 0.5 + 1.0;
    v5->_baseRadius = v8;
    v5->_tipRadius = v8 + 5.0;
    v5->_baseHalfAngle = asin(9.0 / (v5->_baseRadius + v5->_baseRadius));
    -[MKUserLocationHeadingArrowLayer setBounds:](v5, "setBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), v5->_tipRadius + v5->_tipRadius, v5->_tipRadius + v5->_tipRadius);
    objc_storeWeak((id *)&v5->_userLocationView, v4);
    [(MKUserLocationHeadingArrowLayer *)v5 setName:@"heading"];
    -[MKUserLocationHeadingArrowLayer setAnchorPoint:](v5, "setAnchorPoint:", 0.5, 0.5);
    [(MKUserLocationHeadingArrowLayer *)v5 setZPosition:100.0];
    [(MKUserLocationHeadingArrowLayer *)v5 _positionWhenVisible:1];
    -[MKUserLocationHeadingArrowLayer setPosition:](v5, "setPosition:");
    [(MKUserLocationHeadingArrowLayer *)v5 setPath:[(MKUserLocationHeadingArrowLayer *)v5 _pathWhenVisible:1]];
    v9 = [v4 tintColor];
    [(MKUserLocationHeadingArrowLayer *)v5 updateTintColor:v9];

    [v4 heading];
    -[MKUserLocationHeadingArrowLayer updateHeading:](v5, "updateHeading:");
    v10 = v5;
  }

  return v5;
}

- (void)updateHeading:(double)a3
{
  CGFloat v4 = a3 * 0.0174532925;
  [(MKUserLocationHeadingArrowLayer *)self setHeadingRadians:a3 * 0.0174532925];
  memset(&v6, 0, sizeof(v6));
  CATransform3DMakeRotation(&v6, v4, 0.0, 0.0, 1.0);
  CATransform3D v5 = v6;
  [(MKUserLocationHeadingArrowLayer *)self setTransform:&v5];
}

- (void)updateHeadingAccuracy:(double)a3 previousAccuracy:(double)a4
{
  BOOL v5 = -[MKUserLocationHeadingArrowLayer _shouldBeVisibleForAccuracy:](self, "_shouldBeVisibleForAccuracy:", a3, a4);
  if (v5 == [(MKUserLocationHeadingArrowLayer *)self isHidden])
  {
    [(MKUserLocationHeadingArrowLayer *)self setHidden:0];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __74__MKUserLocationHeadingArrowLayer_updateHeadingAccuracy_previousAccuracy___block_invoke;
    v6[3] = &unk_1E54B8740;
    v6[4] = self;
    BOOL v7 = v5;
    [(MKUserLocationHeadingArrowLayer *)self animateToSetVisible:v5 completion:v6];
  }
}

uint64_t __74__MKUserLocationHeadingArrowLayer_updateHeadingAccuracy_previousAccuracy___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) setHidden:*(unsigned char *)(result + 40) == 0];
  }
  return result;
}

- (BOOL)_shouldBeVisibleForAccuracy:(double)a3
{
  return self->_maxUncertaintyAngleToShowArrow >= a3;
}

- (void)updateTintColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];

  [(MKUserLocationHeadingArrowLayer *)self setFillColor:v4];
}

- (void)animateToSetVisible:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  CATransform3D v6 = [(MKUserLocationHeadingArrowLayer *)self _animationToSetVisible:v4];
  if (v6)
  {
    [(CALayer *)self _mapkit_removeAnimationImmediatelyForKey:@"headingHideAnimation"];
    [(CALayer *)self _mapkit_removeAnimationImmediatelyForKey:@"headingShowAnimation"];
    [(MKUserLocationHeadingArrowLayer *)self _positionWhenVisible:v4];
    -[MKUserLocationHeadingArrowLayer setPosition:](self, "setPosition:");
    [(MKUserLocationHeadingArrowLayer *)self setPath:[(MKUserLocationHeadingArrowLayer *)self _pathWhenVisible:v4]];
    if (v4) {
      BOOL v7 = @"headingShowAnimation";
    }
    else {
      BOOL v7 = @"headingHideAnimation";
    }
    [(CALayer *)self _mapkit_addAnimation:v6 forKey:v7 completion:v8];
  }
}

- (id)_animationToSetVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v14[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"path"];
  objc_msgSend(v5, "setFromValue:", -[MKUserLocationHeadingArrowLayer _pathWhenVisible:](self, "_pathWhenVisible:", v3 ^ 1));
  objc_msgSend(v5, "setToValue:", -[MKUserLocationHeadingArrowLayer _pathWhenVisible:](self, "_pathWhenVisible:", v3));
  [v5 setDamping:2.0];
  [v5 setDuration:0.300000012];
  CATransform3D v6 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
  BOOL v7 = (void *)MEMORY[0x1E4F29238];
  [(MKUserLocationHeadingArrowLayer *)self _positionWhenVisible:v3 ^ 1];
  id v8 = objc_msgSend(v7, "valueWithCGPoint:");
  [v6 setFromValue:v8];

  v9 = (void *)MEMORY[0x1E4F29238];
  [(MKUserLocationHeadingArrowLayer *)self _positionWhenVisible:v3];
  v10 = objc_msgSend(v9, "valueWithCGPoint:");
  [v6 setToValue:v10];

  [v6 setDuration:0.300000012];
  v11 = [MEMORY[0x1E4F39B38] animation];
  v14[0] = v5;
  v14[1] = v6;
  objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v11 setAnimations:v12];

  [v11 setDuration:0.300000012];

  return v11;
}

- (CGPath)_pathWhenVisible:(BOOL)a3
{
  BOOL v3 = a3;
  -[MKUserLocationHeadingArrowLayer _baseRadiusWhenVisible:](self, "_baseRadiusWhenVisible:");
  double v6 = v5;
  [(MKUserLocationHeadingArrowLayer *)self _tipRadiusWhenVisible:v3];
  id v8 = [(MKUserLocationHeadingArrowLayer *)self _bezierPathWithBaseRadius:v6 tipRadius:v7 baseHalfAngle:self->_baseHalfAngle];
  v9 = (CGPath *)[v8 CGPath];

  return v9;
}

- (id)_bezierPathWithBaseRadius:(double)a3 tipRadius:(double)a4 baseHalfAngle:(double)a5
{
  [(MKUserLocationHeadingArrowLayer *)self bounds];
  double MidX = CGRectGetMidX(v14);
  [(MKUserLocationHeadingArrowLayer *)self bounds];
  double MidY = CGRectGetMidY(v15);
  v11 = [MEMORY[0x1E4F427D0] bezierPath];
  objc_msgSend(v11, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, a3, 4.71238898 - a5, a5 + 4.71238898);
  objc_msgSend(v11, "addLineToPoint:", MidX, MidY - a4);
  [v11 closePath];

  return v11;
}

- (CGPoint)_positionWhenVisible:(BOOL)a3
{
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (!a3)
  {
    double baseRadius = self->_baseRadius;
    [(MKUserLocationHeadingArrowLayer *)self _baseRadiusWhenVisible:0];
    double v8 = baseRadius - v7;
    __double2 v9 = __sincos_stret(self->_headingRadians);
    double v4 = v4 - v8 * v9.__sinval;
    double v3 = v3 + v8 * v9.__cosval;
  }
  double v10 = v4;
  double v11 = v3;
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)_baseRadiusWhenVisible:(BOOL)a3
{
  if (a3) {
    return self->_baseRadius;
  }
  +[_MKPuckAnnotationView innerDiameter];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userLocationView);
  UIRoundToViewScale();
  double v7 = v6;

  return v7;
}

- (double)_tipRadiusWhenVisible:(BOOL)a3
{
  if (a3) {
    return self->_tipRadius;
  }
  -[MKUserLocationHeadingArrowLayer _baseRadiusWhenVisible:](self, "_baseRadiusWhenVisible:");
  return result;
}

- (_MKPuckAnnotationView)userLocationView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userLocationView);

  return (_MKPuckAnnotationView *)WeakRetained;
}

- (double)headingRadians
{
  return self->_headingRadians;
}

- (void)setHeadingRadians:(double)a3
{
  self->_headingRadians = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (double)minimumAccuracyRadius
{
  return self->_minimumAccuracyRadius;
}

- (void)setMinimumAccuracyRadius:(double)a3
{
  self->_minimumAccuracyRadius = a3;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userLocationView);

  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end