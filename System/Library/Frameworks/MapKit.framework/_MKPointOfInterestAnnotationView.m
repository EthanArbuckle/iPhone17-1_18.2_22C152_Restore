@interface _MKPointOfInterestAnnotationView
- (BOOL)_isMetroArea;
- (BOOL)shouldShowCallout;
- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3;
- (MKMapView)mapView;
- (UIColor)_balloonStrokeColor;
- (UIColor)_balloonTintColor;
- (UIImage)_balloonImage;
- (_MKPointOfInterestAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (int64_t)_balloonCalloutStyle;
- (int64_t)_baseImageType;
- (void)_addAnchorDotView;
- (void)_resolveBalloonAttributes;
- (void)_updateAnchorOffset;
- (void)_updateFromMap;
- (void)setAnnotation:(id)a3;
- (void)setMapView:(id)a3;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
@end

@implementation _MKPointOfInterestAnnotationView

- (_MKPointOfInterestAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_MKPointOfInterestAnnotationView;
  v4 = [(_MKMapFeatureAnnotationView *)&v9 initWithAnnotation:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    -[MKAnnotationView setBounds:](v4, "setBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(MKAnnotationView *)v5 setCanShowCallout:1];
    [(MKAnnotationView *)v5 _setCalloutStyle:1];
    [(MKAnnotationView *)v5 setCollisionMode:1];
    v6 = [MEMORY[0x1E4F42F80] systemTraitsAffectingColorAppearance];
    id v7 = (id)[(_MKPointOfInterestAnnotationView *)v5 registerForTraitChanges:v6 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v5;
}

- (BOOL)shouldShowCallout
{
  v2 = [(MKAnnotationView *)self annotation];
  BOOL v3 = [v2 featureType] == 0;

  return v3;
}

- (void)setAnnotation:(id)a3
{
  if (self->super.super._annotation != a3)
  {
    v3.receiver = self;
    v3.super_class = (Class)_MKPointOfInterestAnnotationView;
    -[MKAnnotationView setAnnotation:](&v3, sel_setAnnotation_);
  }
}

- (void)_updateFromMap
{
  v5.receiver = self;
  v5.super_class = (Class)_MKPointOfInterestAnnotationView;
  [(MKAnnotationView *)&v5 _updateFromMap];
  objc_super v3 = [(MKAnnotationView *)self annotation];
  v4 = [v3 marker];

  [v4 calloutAnchorPointWithSnapToPixels:1];
  -[_MKPointOfInterestAnnotationView setCenter:](self, "setCenter:");
}

- (void)_updateAnchorOffset
{
  objc_super v3 = [(MKAnnotationView *)self annotation];
  id v4 = [v3 marker];

  [v4 calloutAnchorRect];
  -[MKAnnotationView setCalloutOffset:](self, "setCalloutOffset:", CGRectGetMidX(v6), -8.0);
}

- (void)_resolveBalloonAttributes
{
  objc_super v3 = [(MKAnnotationView *)self annotation];
  id v31 = [v3 marker];

  id v4 = [(MKAnnotationView *)self annotation];
  if (![v4 featureType])
  {
    [(_MKPointOfInterestAnnotationView *)self _currentScreenScale];
    double v6 = v5;
    id v7 = [v31 styleAttributes];
    v8 = [MEMORY[0x1E4F645A0] styleAttributesForCalloutWithAttributes:v7];

    if (v8)
    {
      objc_super v9 = [(_MKPointOfInterestAnnotationView *)self mapView];
      v10 = [v9 _mapLayer];
      v11 = [v10 iconForStyleAttributes:v8 contentScale:8 size:1 transparent:v6];
    }
    else
    {
      v11 = 0;
    }
    if ([v11 calloutShape] == 1)
    {
      [(MKAnnotationView *)self setCollisionMode:0];
      if ([(_MKPointOfInterestAnnotationView *)self _isMetroArea])
      {
        int v12 = [v8 isSystemTransit];
        int64_t v13 = 4;
        if (v12) {
          int64_t v13 = 1;
        }
      }
      else
      {
        int64_t v13 = 1;
      }
    }
    else if ([(_MKPointOfInterestAnnotationView *)self _isMetroArea])
    {
      int v14 = [v8 isLandmarkPOI];
      int64_t v13 = 3;
      if (v14) {
        int64_t v13 = 0;
      }
    }
    else
    {
      int64_t v13 = 0;
    }
    self->_balloonCalloutStyle = v13;
    uint64_t v15 = [v11 calloutFillColor];
    uint64_t v16 = [v11 calloutHaloColor];
    if (v15) {
      [MEMORY[0x1E4F428B8] colorWithCGColor:v15];
    }
    else {
    v17 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    balloonFillColor = self->_balloonFillColor;
    self->_balloonFillColor = v17;

    if (v16)
    {
      v19 = [MEMORY[0x1E4F428B8] colorWithCGColor:v16];
    }
    else
    {
      v19 = self->_balloonFillColor;
    }
    balloonStrokeColor = self->_balloonStrokeColor;
    self->_balloonStrokeColor = v19;

    if ([v8 isLandmarkPOI])
    {
      if (![(_MKPointOfInterestAnnotationView *)self _isMetroArea]
        || (id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView),
            int v22 = [WeakRetained _isHybridMap],
            WeakRetained,
            v22))
      {
        v23 = [MEMORY[0x1E4F428B8] whiteColor];
        v24 = self->_balloonFillColor;
        self->_balloonFillColor = v23;
      }
    }
    v25 = v11;
    v26 = v25;
    if (v25)
    {
      v25 = (UIImage *)[(UIImage *)v25 image];
      if (v25)
      {
        id v27 = objc_alloc(MEMORY[0x1E4F42A80]);
        uint64_t v28 = [(UIImage *)v26 image];
        [(UIImage *)v26 contentScale];
        v25 = (UIImage *)[v27 initWithCGImage:v28 scale:0 orientation:v29];
      }
    }
    balloonImage = self->_balloonImage;
    self->_balloonImage = v25;
  }
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5 = a4;
  double v6 = [(_MKPointOfInterestAnnotationView *)self traitCollection];
  int v7 = [v6 hasDifferentColorAppearanceComparedToTraitCollection:v5];

  if (v7 && self->_anchorDotView)
  {
    [(_MKPointOfInterestAnnotationView *)self _resolveBalloonAttributes];
    anchorDotView = self->_anchorDotView;
    objc_super v9 = [[_MKMarkerAnnotationBaseImageContent alloc] initWithFillColor:self->_balloonStrokeColor strokeColor:0 strokeWidth:3 blendMode:[(_MKPointOfInterestAnnotationView *)self _baseImageType] baseImageType:0.0];
    [(_MKMarkerAnnotationBaseImageView *)anchorDotView _setBaseImageContent:v9];
  }
}

- (BOOL)_isMetroArea
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  char v3 = [WeakRetained _isShowingCuratedElevatedGround];

  return v3;
}

- (int64_t)_balloonCalloutStyle
{
  return self->_balloonCalloutStyle;
}

- (UIColor)_balloonTintColor
{
  return self->_balloonFillColor;
}

- (UIColor)_balloonStrokeColor
{
  return self->_balloonStrokeColor;
}

- (UIImage)_balloonImage
{
  return self->_balloonImage;
}

- (void)_addAnchorDotView
{
  char v3 = [_MKMarkerAnnotationBaseImageView alloc];
  [(_MKPointOfInterestAnnotationView *)self frame];
  double v5 = v4 * 0.5 + -3.0;
  [(_MKPointOfInterestAnnotationView *)self frame];
  int v7 = -[_MKMarkerAnnotationBaseImageView initWithFrame:](v3, "initWithFrame:", v5, v6 + -6.0, 6.0, 6.0);
  anchorDotView = self->_anchorDotView;
  self->_anchorDotView = v7;

  objc_super v9 = [(_MKMarkerAnnotationBaseImageView *)self->_anchorDotView layer];
  [v9 setCornerRadius:3.0];

  v10 = self->_anchorDotView;
  v11 = [[_MKMarkerAnnotationBaseImageContent alloc] initWithFillColor:self->_balloonStrokeColor strokeColor:0 strokeWidth:3 blendMode:[(_MKPointOfInterestAnnotationView *)self _baseImageType] baseImageType:0.0];
  [(_MKMarkerAnnotationBaseImageView *)v10 _setBaseImageContent:v11];

  int v12 = self->_anchorDotView;

  [(_MKPointOfInterestAnnotationView *)self addSubview:v12];
}

- (int64_t)_baseImageType
{
  char v3 = [(MKAnnotationView *)self annotation];
  double v4 = [v3 marker];

  double v5 = [v4 styleAttributes];
  if ([(_MKPointOfInterestAnnotationView *)self _isMetroArea]
    && ([v5 isLandmarkPOI] & 1) == 0)
  {
    int64_t v6 = [v5 isSystemTransit] ^ 1;
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v40[2] = *MEMORY[0x1E4F143B8];
  [(_MKPointOfInterestAnnotationView *)self _resolveBalloonAttributes];
  [(_MKPointOfInterestAnnotationView *)self _updateAnchorOffset];
  if ([(MKAnnotationView *)self isSelected])
  {
    [(_MKPointOfInterestAnnotationView *)self _addAnchorDotView];
    anchorDotView = self->_anchorDotView;
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v38[0] = *MEMORY[0x1E4F1DAB8];
    v38[1] = v6;
    v38[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(_MKMarkerAnnotationBaseImageView *)anchorDotView setTransform:v38];
    if (v3)
    {
      int v7 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
      [v7 setMass:3.0];
      [v7 setStiffness:1940.0];
      [v7 setDamping:91.4000015];
      [v7 setInitialVelocity:0.0];
      memset(&v37, 0, sizeof(v37));
      CATransform3DMakeScale(&v37, 0.100000001, 0.100000001, 1.0);
      CATransform3D v36 = v37;
      v8 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v36];
      [v7 setFromValue:v8];

      long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      *(_OWORD *)&v36.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      *(_OWORD *)&v36.m33 = v9;
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      *(_OWORD *)&v36.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      *(_OWORD *)&v36.m43 = v10;
      long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)&v36.m11 = *MEMORY[0x1E4F39B10];
      *(_OWORD *)&v36.m13 = v11;
      long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      *(_OWORD *)&v36.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      *(_OWORD *)&v36.m23 = v12;
      int64_t v13 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v36];
      [v7 setToValue:v13];

      int v14 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      [v14 setFromValue:&unk_1ED97EB98];
      [v14 setToValue:&unk_1ED97EBB0];
      [v14 setDuration:0.239999995];
      uint64_t v15 = [MEMORY[0x1E4F39B38] animation];
      [v15 setRemovedOnCompletion:1];
      [v7 settlingDuration];
      objc_msgSend(v15, "setDuration:");
      uint64_t v16 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
      [v15 setTimingFunction:v16];

      v40[0] = v7;
      v40[1] = v14;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
      [v15 setAnimations:v17];

      v18 = [(_MKMarkerAnnotationBaseImageView *)self->_anchorDotView layer];
      LODWORD(v19) = 1.0;
      [v18 setOpacity:v19];

      v20 = [(_MKMarkerAnnotationBaseImageView *)self->_anchorDotView layer];
      [v20 addAnimation:v15 forKey:@"show"];
LABEL_7:
    }
  }
  else
  {
    v21 = self->_anchorDotView;
    if (v21)
    {
      long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v35[0] = *MEMORY[0x1E4F1DAB8];
      v35[1] = v22;
      v35[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(_MKMarkerAnnotationBaseImageView *)v21 setTransform:v35];
      if (!v3)
      {
        [(_MKMarkerAnnotationBaseImageView *)self->_anchorDotView removeFromSuperview];
        goto LABEL_9;
      }
      int v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
      memset(&v37, 0, sizeof(v37));
      CATransform3DMakeScale(&v37, 0.100000001, 0.100000001, 1.0);
      long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      *(_OWORD *)&v36.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      *(_OWORD *)&v36.m33 = v23;
      long long v24 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      *(_OWORD *)&v36.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      *(_OWORD *)&v36.m43 = v24;
      long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)&v36.m11 = *MEMORY[0x1E4F39B10];
      *(_OWORD *)&v36.m13 = v25;
      long long v26 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      *(_OWORD *)&v36.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      *(_OWORD *)&v36.m23 = v26;
      id v27 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v36];
      [v7 setFromValue:v27];

      CATransform3D v36 = v37;
      uint64_t v28 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v36];
      [v7 setToValue:v28];

      int v14 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      [v14 setFromValue:&unk_1ED97EBB0];
      [v14 setToValue:&unk_1ED97EB98];
      uint64_t v15 = [MEMORY[0x1E4F39B38] animation];
      float v29 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
      [v15 setTimingFunction:v29];

      [v15 setDuration:0.133330002];
      v39[0] = v7;
      v39[1] = v14;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
      [v15 setAnimations:v30];

      [v15 setRemovedOnCompletion:1];
      id v31 = [(_MKMarkerAnnotationBaseImageView *)self->_anchorDotView layer];
      [v31 setOpacity:0.0];

      v20 = [(_MKMarkerAnnotationBaseImageView *)self->_anchorDotView layer];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __70___MKPointOfInterestAnnotationView_updateCalloutViewIfNeededAnimated___block_invoke;
      v34[3] = &unk_1E54B86F0;
      v34[4] = self;
      objc_msgSend(v20, "_mapkit_addAnimation:forKey:completion:", v15, @"hide", v34);
      goto LABEL_7;
    }
  }
LABEL_9:
  v33.receiver = self;
  v33.super_class = (Class)_MKPointOfInterestAnnotationView;
  return [(MKAnnotationView *)&v33 updateCalloutViewIfNeededAnimated:v3];
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void)setMapView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_balloonImage, 0);
  objc_storeStrong((id *)&self->_balloonStrokeColor, 0);
  objc_storeStrong((id *)&self->_balloonFillColor, 0);

  objc_storeStrong((id *)&self->_anchorDotView, 0);
}

@end