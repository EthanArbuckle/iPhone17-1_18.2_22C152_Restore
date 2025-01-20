@interface _MKBalloonLabelMarkerView
- (BOOL)_balloonCalloutShouldOriginateFromSmallSize:(double *)a3;
- (BOOL)shouldShowCallout;
- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3;
- (UIColor)_balloonInnerStrokeColor;
- (UIColor)_balloonStrokeColor;
- (UIColor)_balloonTintColor;
- (UIImage)_balloonImage;
- (UIView)_balloonContentView;
- (_MKBalloonLabelMarkerView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (int64_t)_balloonCalloutStyle;
- (void)_addAnchorDotViewIfNeeded;
- (void)_configureBalloonForDataIconImageKeys:(id)a3 scale:(double)a4;
- (void)_resolveBalloonAttributesIfNecessary;
- (void)prepareForReuse;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
@end

@implementation _MKBalloonLabelMarkerView

- (_MKBalloonLabelMarkerView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_MKBalloonLabelMarkerView;
  v4 = [(_MKLabelMarkerView *)&v9 initWithAnnotation:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v4->_needsToResolveBalloonAttributes = 1;
    [(MKAnnotationView *)v4 _setCalloutStyle:1];
    v6 = [MEMORY[0x1E4F42F80] systemTraitsAffectingColorAppearance];
    id v7 = (id)[(_MKBalloonLabelMarkerView *)v5 registerForTraitChanges:v6 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v5;
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)_MKBalloonLabelMarkerView;
  [(MKAnnotationView *)&v7 prepareForReuse];
  self->_balloonCalloutStyle = 0;
  self->_balloonCalloutShouldOriginateFromSmallSize = 0;
  balloonFillColor = self->_balloonFillColor;
  self->_balloonFillColor = 0;

  balloonStrokeColor = self->_balloonStrokeColor;
  self->_balloonStrokeColor = 0;

  balloonImage = self->_balloonImage;
  self->_balloonImage = 0;

  balloonContentView = self->_balloonContentView;
  self->_balloonContentView = 0;

  self->_needsToResolveBalloonAttributes = 1;
  self->_smallBalloonScaleFactor = 1.0;
}

- (void)_resolveBalloonAttributesIfNecessary
{
  if (!self->_needsToResolveBalloonAttributes
    || ![(MKAnnotationView *)self _shouldShowCalloutIfSelected])
  {
    return;
  }
  self->_needsToResolveBalloonAttributes = 0;
  id v65 = [(MKAnnotationView *)self annotation];
  [(_MKBalloonLabelMarkerView *)self _currentScreenScale];
  double v4 = v3;
  v5 = [v65 styleAttributes];
  if (v5) {
    goto LABEL_10;
  }
  if ([v65 isTrafficIncident])
  {
    v6 = [v65 incident];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F645A0], "styleAttributesForTrafficIncidentType:", objc_msgSend(v6, "type"));
  }
  else
  {
    if (![v65 isRouteAnnotation])
    {
      v12 = 0;
      objc_super v9 = 0;
      v5 = 0;
      goto LABEL_43;
    }
    v8 = [v65 routeAnnotations];
    v6 = [v8 firstObject];

    uint64_t v7 = [v6 styleAttributes];
  }
  v5 = (void *)v7;

  if (!v5)
  {
    v12 = 0;
    objc_super v9 = 0;
LABEL_43:
    char v13 = 1;
    goto LABEL_14;
  }
LABEL_10:
  objc_super v9 = [MEMORY[0x1E4F645A0] styleAttributesForUnpickedFeatureWithAttributes:v5];
  if (v9)
  {
    v10 = [(_MKLabelMarkerView *)self mapView];
    v11 = [v10 _mapLayer];
    v12 = [v11 iconForStyleAttributes:v9 contentScale:8 size:1 transparent:v4];
  }
  else
  {
    v12 = 0;
  }
  char v13 = 0;
LABEL_14:
  self->_balloonCalloutShouldOriginateFromSmallSize = [v12 isBalloonShape];
  if (v13)
  {
    v14 = 0;
    v15 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v15 = [MEMORY[0x1E4F645A0] styleAttributesForCalloutWithAttributes:v5];

  if (v15)
  {
    v5 = [(_MKLabelMarkerView *)self mapView];
    v16 = [v5 _mapLayer];
    v14 = [v16 iconForStyleAttributes:v15 contentScale:8 size:1 transparent:v4];

    goto LABEL_18;
  }
  v14 = 0;
  char v13 = 1;
LABEL_19:
  self->_balloonCalloutStyle = objc_msgSend(v14, "calloutShape", v12) == 1;
  v17 = [v65 dataIconImageKeys];
  uint64_t v18 = [v17 count];

  uint64_t v19 = [v14 calloutFillColor];
  uint64_t v20 = [v14 calloutHaloColor];
  if (v19) {
    [MEMORY[0x1E4F428B8] colorWithCGColor:v19];
  }
  else {
  v21 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  balloonFillColor = self->_balloonFillColor;
  self->_balloonFillColor = v21;

  if (v20)
  {
    v23 = [MEMORY[0x1E4F428B8] colorWithCGColor:v20];
  }
  else
  {
    v23 = self->_balloonFillColor;
  }
  balloonStrokeColor = self->_balloonStrokeColor;
  self->_balloonStrokeColor = v23;

  self->_smallBalloonScaleFactor = 26.0 / *(double *)&_MKBalloonCalloutInnerDiameter;
  if (![v65 isCluster])
  {
    if ([v65 isTrafficIncident])
    {
      id v25 = [v65 incident];
      +[MKIconManager imageForTrafficIncidentType:size:forScale:](MKIconManager, "imageForTrafficIncidentType:size:forScale:", [v25 type], 4, v4);
      v33 = (UIImage *)objc_claimAutoreleasedReturnValue();
      balloonImage = self->_balloonImage;
      self->_balloonImage = v33;
    }
    else if ([v65 isRouteAnnotation])
    {
      v35 = +[MKIconManager imageForRouteAnnotationStyle:v15 size:4 forScale:v4];
      id v25 = self->_balloonImage;
      self->_balloonImage = v35;
    }
    else if (v18)
    {
      id v25 = [v65 dataIconImageKeys];
      [(_MKBalloonLabelMarkerView *)self _configureBalloonForDataIconImageKeys:v25 scale:v4];
    }
    else
    {
      v52 = v14;
      id v25 = v52;
      if (v52)
      {
        v52 = (UIImage *)[(UIImage *)v52 image];
        if (v52)
        {
          id v53 = objc_alloc(MEMORY[0x1E4F42A80]);
          uint64_t v54 = [v25 image];
          [v25 contentScale];
          v52 = (UIImage *)[v53 initWithCGImage:v54 scale:0 orientation:v55];
        }
      }
      v56 = self->_balloonImage;
      self->_balloonImage = v52;

      if (self->_balloonCalloutShouldOriginateFromSmallSize)
      {
        if (v13)
        {
          v57 = 0;
        }
        else
        {
          v58 = [(_MKLabelMarkerView *)self mapView];
          v59 = [v58 _mapLayer];
          v57 = [v59 iconForStyleAttributes:v15 contentScale:6 size:1 transparent:v4];
        }
        [v57 imageSize];
        double v62 = v61;
        if (v61 != *MEMORY[0x1E4F1DB30] || v60 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
        {
          [v57 contentScale];
          self->_smallBalloonScaleFactor = v62 / v63 / *(double *)&_MKBalloonCalloutInnerDiameter;
        }
      }
    }
    goto LABEL_36;
  }
  id v25 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v26 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v25 setLocale:v26];

  [v25 setNumberStyle:1];
  [v25 setRoundingMode:6];
  v27 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, *(double *)&_MKBalloonCalloutInnerDiameter, *(double *)&_MKBalloonCalloutInnerDiameter);
  v28 = objc_alloc_init(_MKUILabel);
  uint64_t v29 = [v14 calloutTextColor];
  uint64_t v30 = [v14 glyphColor];
  if (v29)
  {
    v31 = (void *)MEMORY[0x1E4F428B8];
    uint64_t v32 = v29;
  }
  else
  {
    uint64_t v32 = v30;
    v31 = (void *)MEMORY[0x1E4F428B8];
    if (!v32)
    {
      uint64_t v36 = [MEMORY[0x1E4F428B8] whiteColor];
      goto LABEL_35;
    }
  }
  uint64_t v36 = [v31 colorWithCGColor:v32];
LABEL_35:
  v37 = (void *)v36;
  [(_MKUILabel *)v28 setTextColor:v36];

  [(_MKUILabel *)v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v65, "clusterFeatureCount"));
  v39 = [v25 stringFromNumber:v38];
  [(_MKUILabel *)v28 setText:v39];

  v40 = [MEMORY[0x1E4F42A30] systemFontOfSize:36.0];
  [(_MKUILabel *)v28 setFont:v40];

  [(UIView *)v27 addSubview:v28];
  v41 = [(_MKUILabel *)v28 centerXAnchor];
  v42 = [(UIView *)v27 centerXAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  [v43 setActive:1];

  v44 = [(_MKUILabel *)v28 centerYAnchor];
  v45 = [(UIView *)v27 centerYAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  [v46 setActive:1];

  v47 = [(UIView *)v27 widthAnchor];
  v48 = [v47 constraintEqualToConstant:*(double *)&_MKBalloonCalloutInnerDiameter];
  [v48 setActive:1];

  v49 = [(UIView *)v27 heightAnchor];
  v50 = [v49 constraintEqualToConstant:*(double *)&_MKBalloonCalloutInnerDiameter];
  [v50 setActive:1];

  balloonContentView = self->_balloonContentView;
  self->_balloonContentView = v27;

LABEL_36:
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5 = a4;
  v6 = [(_MKBalloonLabelMarkerView *)self traitCollection];
  int v7 = [v6 hasDifferentColorAppearanceComparedToTraitCollection:v5];

  if (v7)
  {
    self->_needsToResolveBalloonAttributes = 1;
    if (self->_anchorDotView)
    {
      [(_MKBalloonLabelMarkerView *)self _resolveBalloonAttributesIfNecessary];
      v8 = [(UIColor *)self->_balloonStrokeColor CGColor];
      id v9 = [(UIView *)self->_anchorDotView layer];
      [v9 setBackgroundColor:v8];
    }
  }
}

- (int64_t)_balloonCalloutStyle
{
  return self->_balloonCalloutStyle;
}

- (BOOL)_balloonCalloutShouldOriginateFromSmallSize:(double *)a3
{
  [(_MKBalloonLabelMarkerView *)self _resolveBalloonAttributesIfNecessary];
  BOOL balloonCalloutShouldOriginateFromSmallSize = self->_balloonCalloutShouldOriginateFromSmallSize;
  if (a3 && self->_balloonCalloutShouldOriginateFromSmallSize) {
    *a3 = self->_smallBalloonScaleFactor;
  }
  return balloonCalloutShouldOriginateFromSmallSize;
}

- (UIColor)_balloonTintColor
{
  [(_MKBalloonLabelMarkerView *)self _resolveBalloonAttributesIfNecessary];
  balloonFillColor = self->_balloonFillColor;

  return balloonFillColor;
}

- (UIColor)_balloonStrokeColor
{
  [(_MKBalloonLabelMarkerView *)self _resolveBalloonAttributesIfNecessary];
  balloonStrokeColor = self->_balloonStrokeColor;

  return balloonStrokeColor;
}

- (UIColor)_balloonInnerStrokeColor
{
  return 0;
}

- (UIImage)_balloonImage
{
  [(_MKBalloonLabelMarkerView *)self _resolveBalloonAttributesIfNecessary];
  balloonImage = self->_balloonImage;

  return balloonImage;
}

- (UIView)_balloonContentView
{
  [(_MKBalloonLabelMarkerView *)self _resolveBalloonAttributesIfNecessary];
  balloonContentView = self->_balloonContentView;

  return balloonContentView;
}

- (BOOL)shouldShowCallout
{
  v2 = [(MKAnnotationView *)self annotation];
  if (([v2 suppressCallout] & 1) == 0 && (objc_msgSend(v2, "isRouteEta") & 1) == 0)
  {
    double v4 = [v2 featureAnnotation];
    if ([v4 conformsToProtocol:&unk_1ED9CBFE0]
      && ![v4 showsBalloonCallout]
      || [v2 isTransit]
      && ([v2 isTransitLine] & 1) == 0
      && ([v2 isOnRoute] & 1) != 0)
    {
      goto LABEL_15;
    }
    int v5 = [v2 featureType];
    LOBYTE(v3) = 0;
    if (v5 == 7 || v5 == 9) {
      goto LABEL_16;
    }
    int v6 = [v2 pickedLabelBalloonBehavior];
    if (v6 == 2)
    {
      LOBYTE(v3) = 1;
      goto LABEL_16;
    }
    if (v6 || (unsigned int v7 = [v2 featureType], v7 >= 0x13)) {
LABEL_15:
    }
      LOBYTE(v3) = 0;
    else {
      unsigned int v3 = (0x50668u >> v7) & 1;
    }
LABEL_16:

    goto LABEL_17;
  }
  LOBYTE(v3) = 0;
LABEL_17:

  return v3;
}

- (void)_addAnchorDotViewIfNeeded
{
  anchorDotView = self->_anchorDotView;
  if (!anchorDotView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(_MKBalloonLabelMarkerView *)self frame];
    double v6 = v5 * 0.5 + -3.0;
    [(_MKBalloonLabelMarkerView *)self frame];
    v8 = (UIView *)objc_msgSend(v4, "initWithFrame:", v6, v7 + -6.0, 6.0, 6.0);
    id v9 = self->_anchorDotView;
    self->_anchorDotView = v8;

    unint64_t balloonCalloutStyle = self->_balloonCalloutStyle;
    if (balloonCalloutStyle <= 4)
    {
      if (((1 << balloonCalloutStyle) & 0xD) != 0)
      {
        v11 = [(UIView *)self->_anchorDotView layer];
        v12 = v11;
        double v13 = 3.0;
      }
      else
      {
        v11 = [(UIView *)self->_anchorDotView layer];
        v12 = v11;
        double v13 = 1.80000007;
      }
      [v11 setCornerRadius:v13];
    }
    v14 = [(UIColor *)self->_balloonStrokeColor CGColor];
    v15 = [(UIView *)self->_anchorDotView layer];
    [v15 setBackgroundColor:v14];

    anchorDotView = self->_anchorDotView;
  }
  v16 = [(UIView *)anchorDotView superview];

  if (!v16)
  {
    v17 = self->_anchorDotView;
    [(_MKBalloonLabelMarkerView *)self addSubview:v17];
  }
}

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v40[2] = *MEMORY[0x1E4F143B8];
  [(_MKBalloonLabelMarkerView *)self _resolveBalloonAttributesIfNecessary];
  [(_MKLabelMarkerView *)self _updateAnchorOffset];
  double v5 = [(_MKBalloonLabelMarkerView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  memset(&v38, 0, sizeof(v38));
  if (v6 == 3)
  {
    CATransform3DMakeScale(&v38, 0.666666687, 0.666666687, 1.0);
  }
  else
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v38.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v38.m33 = v7;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v38.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v38.m43 = v8;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v38.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v38.m13 = v9;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v38.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v38.m23 = v10;
  }
  if ([(MKAnnotationView *)self isSelected]
    && [(MKAnnotationView *)self _shouldShowCalloutIfSelected])
  {
    [(_MKBalloonLabelMarkerView *)self _addAnchorDotViewIfNeeded];
    if (v6 == 3)
    {
      CGAffineTransformMakeScale(&v37, 0.666666687, 0.666666687);
    }
    else
    {
      long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v37.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v37.c = v22;
      *(_OWORD *)&v37.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    anchorDotView = self->_anchorDotView;
    CGAffineTransform v36 = v37;
    [(UIView *)anchorDotView setTransform:&v36];
    if (v3)
    {
      double v13 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
      [v13 setMass:3.0];
      [v13 setStiffness:1940.0];
      [v13 setDamping:91.4000015];
      [v13 setInitialVelocity:0.0];
      memset(&v35, 0, sizeof(v35));
      CATransform3DMakeScale(&v35, 0.100000001, 0.100000001, 1.0);
      CATransform3D v34 = v35;
      v24 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v34];
      [v13 setFromValue:v24];

      CATransform3D v34 = v38;
      id v25 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v34];
      [v13 setToValue:v25];

      v16 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      [v16 setFromValue:&unk_1ED97E8E0];
      [v16 setToValue:&unk_1ED97E8F8];
      [v16 setDuration:0.239999995];
      v17 = [MEMORY[0x1E4F39B38] animation];
      [v17 setRemovedOnCompletion:1];
      [v13 settlingDuration];
      objc_msgSend(v17, "setDuration:");
      v26 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
      [v17 setTimingFunction:v26];

      v40[0] = v13;
      v40[1] = v16;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
      [v17 setAnimations:v27];

      v28 = [(UIView *)self->_anchorDotView layer];
      LODWORD(v29) = 1.0;
      [v28 setOpacity:v29];

      v21 = [(UIView *)self->_anchorDotView layer];
      [v21 addAnimation:v17 forKey:@"show"];
      goto LABEL_15;
    }
  }
  else
  {
    v11 = self->_anchorDotView;
    if (v11)
    {
      long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v33[0] = *MEMORY[0x1E4F1DAB8];
      v33[1] = v12;
      v33[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(UIView *)v11 setTransform:v33];
      if (v3)
      {
        double v13 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
        memset(&v35, 0, sizeof(v35));
        CATransform3DMakeScale(&v35, 0.100000001, 0.100000001, 1.0);
        CATransform3D v34 = v38;
        v14 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v34];
        [v13 setFromValue:v14];

        CATransform3D v34 = v35;
        v15 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v34];
        [v13 setToValue:v15];

        v16 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
        [v16 setFromValue:&unk_1ED97E8F8];
        [v16 setToValue:&unk_1ED97E8E0];
        v17 = [MEMORY[0x1E4F39B38] animation];
        uint64_t v18 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
        [v17 setTimingFunction:v18];

        [v17 setDuration:0.133330002];
        v39[0] = v13;
        v39[1] = v16;
        uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
        [v17 setAnimations:v19];

        [v17 setRemovedOnCompletion:1];
        uint64_t v20 = [(UIView *)self->_anchorDotView layer];
        [v20 setOpacity:0.0];

        v21 = [(UIView *)self->_anchorDotView layer];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __63___MKBalloonLabelMarkerView_updateCalloutViewIfNeededAnimated___block_invoke;
        v32[3] = &unk_1E54B86F0;
        v32[4] = self;
        objc_msgSend(v21, "_mapkit_addAnimation:forKey:completion:", v17, @"hide", v32);
LABEL_15:

        goto LABEL_16;
      }
      [(UIView *)self->_anchorDotView removeFromSuperview];
    }
  }
LABEL_16:
  v31.receiver = self;
  v31.super_class = (Class)_MKBalloonLabelMarkerView;
  return [(_MKLabelMarkerView *)&v31 updateCalloutViewIfNeededAnimated:v3];
}

- (void)_configureBalloonForDataIconImageKeys:(id)a3 scale:(double)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = [[MKVKImageSourceCalculationParameters alloc] initWithImageSourceKeys:v6 scale:a4];
  long long v8 = +[MKVKImageSourceKeyImageBuilder calculateImagesForParameters:v7];

  long long v9 = [v8 fullBleedColors];
  if ([v8 hasSameFullBleedColors])
  {
    long long v10 = [v9 firstObject];
    objc_storeStrong((id *)&self->_balloonFillColor, v10);
    balloonStrokeColor = self->_balloonStrokeColor;
    self->_balloonStrokeColor = v10;
  }
  else
  {
    long long v12 = [MEMORY[0x1E4F428B8] colorWithRed:0.305999994 green:0.361000001 blue:0.455000013 alpha:1.0];
    balloonFillColor = self->_balloonFillColor;
    self->_balloonFillColor = v12;

    v14 = [MEMORY[0x1E4F428B8] colorWithRed:0.305999994 green:0.361000001 blue:0.455000013 alpha:1.0];
    balloonStrokeColor = self->_balloonStrokeColor;
    self->_balloonStrokeColor = v14;
  }

  v15 = [v8 images];
  if ([v15 count] == 1 || self->_balloonCalloutStyle != 1)
  {
    v23 = [v15 firstObject];
    balloonImage = self->_balloonImage;
    self->_balloonImage = v23;
  }
  else if ((unint64_t)[v15 count] >= 2)
  {
    uint64_t v54 = self;
    v51 = v15;
    id v16 = v15;
    v52 = v9;
    id v17 = v9;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v18 = [v16 countByEnumeratingWithState:&v60 objects:v65 count:16];
    id v55 = v6;
    id v53 = v8;
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = 0;
      uint64_t v21 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v61 != v21) {
            objc_enumerationMutation(v16);
          }
          v20 += CGImageGetWidth((CGImageRef)[*(id *)(*((void *)&v60 + 1) + 8 * i) CGImage]);
        }
        uint64_t v19 = [v16 countByEnumeratingWithState:&v60 objects:v65 count:16];
      }
      while (v19);
    }
    else
    {
      uint64_t v20 = 0;
    }
    double v25 = a4 + a4;
    size_t v26 = v20 - (unint64_t)(v25 + v25);
    double v27 = ceil(*(double *)&_MKBalloonCalloutInnerDiameter * a4);
    size_t v28 = vcvtpd_u64_f64(*(double *)&_MKBalloonCalloutInnerDiameter * a4);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    space = DeviceRGB;
    objc_super v31 = CGBitmapContextCreate(0, v26, v28, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
    v67.size.width = (double)v26;
    v67.size.height = (double)(unint64_t)v27;
    v67.origin.x = 0.0;
    v67.origin.y = 0.0;
    CGContextClearRect(v31, v67);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v32 = v16;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = 0;
      double v36 = -v25;
      uint64_t v37 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v57 != v37) {
            objc_enumerationMutation(v32);
          }
          v39 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          if (v35 + j >= (unint64_t)objc_msgSend(v17, "count", space)) {
            [MEMORY[0x1E4F428B8] clearColor];
          }
          else {
          v40 = [v17 objectAtIndexedSubscript:v35 + j];
          }
          v41 = (CGImage *)[v39 CGImage];
          CGFloat Width = (double)CGImageGetWidth(v41);
          CGFloat Height = (double)CGImageGetHeight(v41);
          CGFloat v44 = -(Height - *(double *)&_MKBalloonCalloutInnerDiameter * a4) * 0.5;
          CGContextSaveGState(v31);
          id v45 = v40;
          CGContextSetFillColorWithColor(v31, (CGColorRef)[v45 CGColor]);
          v68.origin.x = v36;
          v68.origin.y = v44;
          v68.size.width = Width;
          v68.size.height = Height;
          CGContextFillRect(v31, v68);
          v69.origin.x = v36;
          v69.origin.y = v44;
          v69.size.width = Width;
          v69.size.height = Height;
          CGContextDrawImage(v31, v69, v41);
          CGContextRestoreGState(v31);
          double v36 = v36 + Width;
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v56 objects:v64 count:16];
        v35 += j;
      }
      while (v34);
    }

    Image = CGBitmapContextCreateImage(v31);
    v47 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:Image scale:0 orientation:a4];
    CGContextRelease(v31);
    CGColorSpaceRelease(space);
    CGImageRelease(Image);

    uint64_t v48 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v47];
    balloonContentView = v54->_balloonContentView;
    v54->_balloonContentView = (UIView *)v48;

    id v6 = v55;
    long long v9 = v52;
    long long v8 = v53;
    v15 = v51;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonContentView, 0);
  objc_storeStrong((id *)&self->_balloonImage, 0);
  objc_storeStrong((id *)&self->_balloonStrokeColor, 0);
  objc_storeStrong((id *)&self->_balloonFillColor, 0);

  objc_storeStrong((id *)&self->_anchorDotView, 0);
}

@end