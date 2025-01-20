@interface _MKPuckAnnotationView
+ (CGPoint)_calloutOffset;
+ (double)baseDiameter;
+ (double)innerDiameter;
+ (double)outerRingWidth;
+ (double)shadowBlur;
- (BOOL)_balloonCalloutShouldShowArrow;
- (BOOL)_displaysPuckAsAccuracy;
- (BOOL)_forceHeadingUp;
- (BOOL)_hideLargeAccuracyRing;
- (BOOL)_isLocationStale:(id)a3;
- (BOOL)_isSelectable;
- (BOOL)_shouldHidePuckWhenAccuracyVisible;
- (BOOL)_shouldPulseForLocation:(id)a3;
- (BOOL)_shouldShowAccuracyRing;
- (BOOL)_shouldShowDynamicLocationAnimations;
- (BOOL)_tracking;
- (BOOL)allowsAccuracyRing;
- (BOOL)allowsPulse;
- (BOOL)canShowHeadingIndicator;
- (BOOL)forcesConeIndicator;
- (BOOL)isAnimatingPresentationAccuracy;
- (BOOL)isEffectsEnabled;
- (BOOL)isOverrideStale;
- (BOOL)isStale;
- (BOOL)rotateInnerImageToMatchCourse;
- (BOOL)shouldDisplayHeading;
- (BOOL)shouldDisplayInaccurateHeading;
- (BOOL)shouldInnerPulse;
- (BOOL)shouldShowOuterRing;
- (CGPoint)calloutOffset;
- (CGRect)_mapkit_visibleRect;
- (CGRect)_significantBounds;
- (CGSize)collisionSize;
- (CLLocation)lastLocation;
- (UIColor)glyphTintColor;
- (UIEdgeInsets)_annotationTrackingInsets;
- (UIEdgeInsets)_defaultCollisionAlignmentRectInsets;
- (UIImage)glyphImage;
- (UIImage)innerImageMask;
- (_MKPuckAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (double)_accuracyRingStrokeOpacityThreshold;
- (double)_locationAccuracyInScreenPoints;
- (double)_minimumAccuracyRadius;
- (double)_minimumAccuracyUncertainty;
- (double)accuracyRingAlpha;
- (double)heading;
- (double)headingAccuracy;
- (double)locationAccuracy;
- (double)maxRadiusToShowAccuracyRing;
- (double)presentationAccuracy;
- (double)presentationCourse;
- (double)puckAlpha;
- (float)_selectionPriority;
- (float)opacity;
- (id)_animationToSynchronizePulse:(id *)a3;
- (id)_baseLayer;
- (id)_createFakePuckLayer;
- (id)_currentInnerColor;
- (id)_effectiveTintColor;
- (id)_innerPulseAnimation;
- (id)_layerToMatchAccuracyRing;
- (id)_pulseAnimation;
- (id)_pulseLayer;
- (id)_vkNavigationPuckMarker;
- (int64_t)_enforcedHeadingIndicatorStyle;
- (int64_t)collisionMode;
- (int64_t)headingIndicatorStyle;
- (int64_t)zoomDirection;
- (unint64_t)_innerPulseFrameWhenDisabled:(unint64_t)a3;
- (void)_createOrRemoveFaux3DRingsIfNecessary;
- (void)_pausePulse;
- (void)_removePulse;
- (void)_resetInnerPulseFrame;
- (void)_resetLayerToMatchAccuracyRing;
- (void)_resumePulse;
- (void)_setAccuracyRingStrokeOpacityThreshold:(double)a3;
- (void)_setAnimatingToCoordinate:(BOOL)a3;
- (void)_setDisplaysPuckAsAccuracy:(BOOL)a3;
- (void)_setForceHeadingUp:(BOOL)a3;
- (void)_setHeadingLayerHidden:(BOOL)a3;
- (void)_setMapDisplayStyle:(id)a3;
- (void)_setMapPitchRadians:(double)a3;
- (void)_setMapRotationRadians:(double)a3;
- (void)_setMapType:(unint64_t)a3;
- (void)_setMinimumAccuracyRadius:(double)a3;
- (void)_setMinimumAccuracyUncertainty:(double)a3;
- (void)_setPresentationCoordinate:(CLLocationCoordinate2D)a3;
- (void)_setPresentationCourse:(double)a3;
- (void)_setShouldHidePuckWhenAccuracyVisible:(BOOL)a3;
- (void)_setShouldShowDynamicLocationAnimations:(BOOL)a3;
- (void)_setTracking:(BOOL)a3;
- (void)_setVKNavigationPuckMarker:(id)a3;
- (void)_setupLayers;
- (void)_updateAccuracyAnimation;
- (void)_updateAccuracyColors;
- (void)_updateAccuracyOpacityForRadius:(double)a3 duration:(double)a4;
- (void)_updateBaseImage;
- (void)_updateFaux3DColors;
- (void)_updateFaux3DLayers;
- (void)_updateFromMap;
- (void)_updateGlyphImage;
- (void)_updateHeadingIndicators;
- (void)_updateHeadingLayerForStyleChange:(BOOL)a3;
- (void)_updateInnerCourseRotation;
- (void)_updateInnerImage;
- (void)_updateInnerMaskLayer;
- (void)_updateLayers;
- (void)_updateLegacyConfiguration;
- (void)_updatePuckVisibilityForRadius:(double)a3 previousRadius:(double)a4 duration:(double)a5;
- (void)_updatePulse;
- (void)_updatePulseAnimation;
- (void)_updatePulseColor;
- (void)_updateShadowImage;
- (void)_updateShowHeadingLayer;
- (void)_updateShowHeadingLayer:(BOOL)a3 animatedIfPossible:(BOOL)a4;
- (void)_updateShowHeadingLayerAnimatedIfPossible:(BOOL)a3;
- (void)_updateToReflectLocationAccuracyWithDuration:(double)a3 allowShowHideAnimation:(BOOL)a4;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)locationManagerFailedToUpdateLocation;
- (void)setAccuracyRingAlpha:(double)a3;
- (void)setAllowsAccuracyRing:(BOOL)a3;
- (void)setAllowsPulse:(BOOL)a3;
- (void)setAlpha:(double)a3;
- (void)setAnimatingPresentationAccuracy:(BOOL)a3;
- (void)setAnimatingToCoordinate:(BOOL)a3;
- (void)setCanShowHeadingIndicator:(BOOL)a3;
- (void)setCollisionMode:(int64_t)a3;
- (void)setDisplayPriority:(float)a3;
- (void)setEffectsEnabled:(BOOL)a3;
- (void)setForcesConeIndicator:(BOOL)a3;
- (void)setGlyphImage:(id)a3;
- (void)setGlyphTintColor:(id)a3;
- (void)setHeading:(double)a3;
- (void)setHeadingAccuracy:(double)a3;
- (void)setHeadingIndicatorStyle:(int64_t)a3;
- (void)setInnerImageMask:(id)a3;
- (void)setLocationAccuracy:(double)a3 duration:(double)a4;
- (void)setMaxRadiusToShowAccuracyRing:(double)a3;
- (void)setOpacity:(float)a3;
- (void)setOverrideIsStale:(BOOL)a3;
- (void)setPresentationAccuracy:(double)a3;
- (void)setPresentationCoordinate:(id)a3;
- (void)setPresentationCourse:(double)a3;
- (void)setPuckAlpha:(double)a3;
- (void)setPuckScale:(double)a3;
- (void)setRotateInnerImageToMatchCourse:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldDisplayHeading:(BOOL)a3;
- (void)setShouldDisplayInaccurateHeading:(BOOL)a3;
- (void)setShouldInnerPulse:(BOOL)a3;
- (void)setShouldShowOuterRing:(BOOL)a3;
- (void)setStale:(BOOL)a3;
- (void)setZoomDirection:(int64_t)a3;
- (void)tintColorDidChange;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)updateStateFromLocation:(id)a3 duration:(double)a4;
@end

@implementation _MKPuckAnnotationView

- (void)updateStateFromLocation:(id)a3 duration:(double)a4
{
  v5 = (CLLocation *)a3;
  [(_MKPuckAnnotationView *)self setStale:[(_MKPuckAnnotationView *)self _isLocationStale:v5]];
  lastLocation = self->_lastLocation;
  self->_lastLocation = v5;
  v7 = v5;

  [(CLLocation *)v7 horizontalAccuracy];
  -[_MKPuckAnnotationView setLocationAccuracy:duration:](self, "setLocationAccuracy:duration:");
  [(_MKPuckAnnotationView *)self _updateShowHeadingLayer];
  [(_MKPuckAnnotationView *)self _updateLayers];
  BOOL v8 = [(_MKPuckAnnotationView *)self _shouldPulseForLocation:self->_lastLocation];

  self->_shouldPulse = v8;

  [(_MKPuckAnnotationView *)self _updatePulse];
}

- (void)setStale:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_stale != a3)
  {
    BOOL v3 = a3;
    v5 = MKGetUserLocationViewLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = @"NO";
      if (v3) {
        v6 = @"YES";
      }
      int v7 = 138412290;
      BOOL v8 = v6;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "User location stale: %@", (uint8_t *)&v7, 0xCu);
    }

    self->_stale = v3;
    [(_MKPuckAccuracyLayer *)self->_accuracyLayer setStale:v3];
    [(_MKPuckAnnotationView *)self _updateLayers];
  }
}

- (void)setLocationAccuracy:(double)a3 duration:(double)a4
{
  if (vabdd_f64(a3, self->_locationAccuracy) >= 0.000001)
  {
    self->_locationAccuracy = a3;
    v6 = [(_MKPuckAnnotationView *)self window];
    if (v6)
    {
      BOOL animatingPresentationAccuracy = self->_animatingPresentationAccuracy;

      if (!animatingPresentationAccuracy)
      {
        [(_MKPuckAnnotationView *)self _updateToReflectLocationAccuracyWithDuration:1 allowShowHideAnimation:a4];
      }
    }
  }
}

- (void)_updateLayers
{
  BOOL isShowingStaleColor = self->_isShowingStaleColor;
  if (isShowingStaleColor != [(_MKPuckAnnotationView *)self isStale])
  {
    self->_BOOL isShowingStaleColor = [(_MKPuckAnnotationView *)self isStale];
    [(_MKPuckAnnotationView *)self _updateInnerImage];
    [(_MKPuckAnnotationView *)self _updateGlyphImage];
  }
}

- (BOOL)_shouldPulseForLocation:(id)a3
{
  id v4 = a3;
  if ([(_MKPuckAnnotationView *)self isStale])
  {
    BOOL v5 = 0;
  }
  else
  {
    unsigned int v6 = [v4 type];
    BOOL v5 = 0;
    if (v6 <= 0xA && ((1 << v6) & 0x40E) != 0)
    {
      if ([(_MKPuckAnnotationView *)self _hideLargeAccuracyRing]) {
        BOOL v5 = [(_MKPuckAnnotationView *)self _shouldShowAccuracyRing];
      }
      else {
        BOOL v5 = 1;
      }
    }
  }

  return v5;
}

- (BOOL)isStale
{
  return self->_stale;
}

- (BOOL)_isLocationStale:(id)a3
{
  if (!a3 || self->_overrideIsStale) {
    return 1;
  }
  else {
    return objc_msgSend(a3, "_navigation_isStale");
  }
}

- (void)_updateShowHeadingLayerAnimatedIfPossible:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_shouldDisplayHeading && self->_canShowHeadingIndicator && self->_hasValidHeading) {
    uint64_t v5 = [(_MKPuckAnnotationView *)self isStale] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }

  [(_MKPuckAnnotationView *)self _updateShowHeadingLayer:v5 animatedIfPossible:v3];
}

- (void)_updateShowHeadingLayer:(BOOL)a3 animatedIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  int v7 = self->_headingLayer == 0;
  uint64_t v8 = _MKModernPuckDesignEnabled();
  BOOL v9 = v8;
  if (v7 == v5 || self->_headingLayerTracksAccuracy != v8)
  {
    v10 = self->_headingLayer;
    if (v5)
    {
      int64_t v11 = [(_MKPuckAnnotationView *)self _enforcedHeadingIndicatorStyle];
      v12 = +[MKUserLocationHeadingLayerFactory headingLayerWithStyle:v11 userLocationView:self shouldMatchAccuracyRadius:v9];
      headingLayer = self->_headingLayer;
      self->_headingLayer = v12;

      [(id)objc_opt_class() baseDiameter];
      [(MKUserLocationHeadingIndicator *)self->_headingLayer setMinimumAccuracyRadius:v14 * 0.5];
      v15 = [(_MKPuckAnnotationView *)self traitCollection];
      [(MKUserLocationHeadingIndicator *)self->_headingLayer setTraitCollection:v15];

      [(MKUserLocationHeadingIndicator *)self->_headingLayer setMapType:[(MKAnnotationView *)self _mapType]];
      v16 = self->_headingLayer;
      v17 = [(_MKPuckAnnotationView *)self _effectiveTintColor];
      [(MKUserLocationHeadingIndicator *)v16 updateTintColor:v17];

      [(MKUserLocationHeadingIndicator *)self->_headingLayer updateHeadingAccuracy:self->_headingAccuracy previousAccuracy:self->_headingAccuracy];
      [(_MKPuckAnnotationView *)self _locationAccuracyInScreenPoints];
      -[MKUserLocationHeadingIndicator setAccuracyRadius:duration:](self->_headingLayer, "setAccuracyRadius:duration:");
      self->_headingLayerTracksAccuracy = v9;
      [(_MKPuckAnnotationView *)self _updateHeadingIndicators];
      v18 = self->_headingLayer;
      if (v11 == 2 || v9)
      {
        [(CALayer *)self->_headingContainerLayer addSublayer:self->_headingLayer];
        if (!v4) {
          goto LABEL_13;
        }
      }
      else
      {
        puckLayer = self->_puckLayer;
        v20 = [(_MKPuckAnnotationView *)self _baseLayer];
        [(CALayer *)puckLayer insertSublayer:v18 below:v20];

        if (!v4) {
          goto LABEL_13;
        }
      }
    }
    else
    {
      v21 = self->_headingLayer;
      self->_headingLayer = 0;

      if (!v4) {
        goto LABEL_13;
      }
    }
    if ([(MKUserLocationHeadingIndicator *)self->_headingLayer conformsToProtocol:&unk_1ED9FA5E0]&& ![(_MKPuckAnnotationView *)self isStale])
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __68___MKPuckAnnotationView__updateShowHeadingLayer_animatedIfPossible___block_invoke;
      v22[3] = &unk_1E54B86F0;
      v23 = v10;
      [(MKUserLocationHeadingIndicator *)v23 animateToSetVisible:0 completion:v22];
      [(MKUserLocationHeadingIndicator *)self->_headingLayer animateToSetVisible:1 completion:0];

      goto LABEL_14;
    }
LABEL_13:
    [(MKUserLocationHeadingIndicator *)v10 removeFromSuperlayer];
LABEL_14:
  }
}

- (void)_updateShowHeadingLayer
{
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)_MKPuckAnnotationView;
  [(_MKPuckAnnotationView *)&v5 tintColorDidChange];
  [(_MKPuckAnnotationView *)self _updateInnerImage];
  [(_MKPuckAnnotationView *)self _updateAccuracyColors];
  [(_MKPuckAnnotationView *)self _updatePulseColor];
  headingLayer = self->_headingLayer;
  BOOL v4 = [(_MKPuckAnnotationView *)self _effectiveTintColor];
  [(MKUserLocationHeadingIndicator *)headingLayer updateTintColor:v4];
}

- (int64_t)_enforcedHeadingIndicatorStyle
{
  if ([(_MKPuckAnnotationView *)self forcesConeIndicator]) {
    return 0;
  }
  else {
    return self->_headingIndicatorStyle;
  }
}

- (BOOL)forcesConeIndicator
{
  return self->_forcesConeIndicator;
}

- (int64_t)collisionMode
{
  if (_MKLinkedOnOrAfterReleaseSet(2824))
  {
    objc_super v5 = self;
    BOOL v3 = (objc_super *)&v5;
LABEL_5:
    v3->super_class = (Class)_MKPuckAnnotationView;
    return (int64_t)[(objc_super *)v3 collisionMode];
  }
  if (self->_hasExplicitCollisionMode)
  {
    v6.receiver = self;
    BOOL v3 = &v6;
    goto LABEL_5;
  }
  return 1;
}

- (void)_updateFromMap
{
  BOOL v3 = [(MKAnnotationView *)self _mapView];
  BOOL v4 = [v3 _mapLayer];
  [v4 altitude];
  double v6 = v5;
  int v7 = [(MKAnnotationView *)self _mapView];
  uint64_t v8 = [v7 _mapLayer];
  [v8 pitch];
  long double v10 = v6 / cos(v9 * 0.0174532925);

  if (vabdd_f64(v10, self->_mapCameraDistance) >= 0.00000011920929)
  {
    self->_mapCameraDistance = v10;
    [(_MKPuckAccuracyLayer *)self->_accuracyLayer setMapCameraDistance:(double)v10];
    if (self->_faux3DEnabled)
    {
      [(MKAnnotationView *)self _mapPitchRadians];
      if (v11 > 0.0) {
        [(_MKPuckAnnotationView *)self _updateFaux3DLayers];
      }
    }
  }
  id v12 = [(_MKPuckAnnotationView *)self window];
  [(_MKPuckAnnotationView *)self _updateToReflectLocationAccuracyWithDuration:v12 != 0 allowShowHideAnimation:0.0];
}

- (void)_updateToReflectLocationAccuracyWithDuration:(double)a3 allowShowHideAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  v34[2] = *MEMORY[0x1E4F143B8];
  [(_MKPuckAnnotationView *)self _locationAccuracyInScreenPoints];
  double v8 = v7;
  [(_MKPuckAccuracyLayer *)self->_accuracyLayer accuracy];
  double v10 = v9;
  double v11 = 0.0;
  if (v4)
  {
    if (v8 >= v9) {
      double v12 = v9;
    }
    else {
      double v12 = v8;
    }
    double minimumAccuracyRadius = self->_minimumAccuracyRadius;
    if (v12 >= minimumAccuracyRadius)
    {
      double v11 = a3;
    }
    else
    {
      if (v8 <= v10) {
        double v14 = v10;
      }
      else {
        double v14 = v8;
      }
      double v11 = a3;
      if (v14 >= minimumAccuracyRadius)
      {
        double v15 = v10 - v8;
        if (v10 - v8 < 0.0) {
          double v15 = -(v10 - v8);
        }
        double v11 = fmin(v15 / self->_maxRadiusToShowAccuracyRing, 1.0) * 0.75 + 0.25;
        a3 = v11;
      }
    }
  }
  if (vabdd_f64(v8, v10) >= 0.25)
  {
    [(_MKPuckAccuracyLayer *)self->_accuracyLayer setAccuracy:v8 duration:a3];
    [(MKUserLocationHeadingIndicator *)self->_headingLayer setAccuracyRadius:v8 duration:a3];
    [(_MKPuckAnnotationView *)self _updateAccuracyOpacityForRadius:v8 duration:a3];
    [(_MKPuckAnnotationView *)self _updatePuckVisibilityForRadius:v8 previousRadius:v10 duration:v11];
    uint64_t v16 = [(MKAnnotationView *)self _calloutView];
    if (v16)
    {
      v17 = (void *)v16;
      v18 = [(MKAnnotationView *)self _calloutView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v20 = [(MKAnnotationView *)self _calloutView];
        objc_msgSend(v20, "setShowsArrow:animated:", -[_MKPuckAnnotationView _balloonCalloutShouldShowArrow](self, "_balloonCalloutShouldShowArrow"), 1);
        [v20 updateWithNewCalloutOffset];
      }
    }
    v21 = [(_MKPuckAnnotationView *)self _layerToMatchAccuracyRing];
    if (v21)
    {
      if ([(_MKPuckAccuracyLayer *)self->_accuracyLayer isHidden])
      {
        [(_MKPuckAnnotationView *)self _resetLayerToMatchAccuracyRing];
      }
      else
      {
        v22 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
        v23 = (void *)MEMORY[0x1E4F29238];
        v24 = [v21 currentLayer];
        [v24 bounds];
        v25 = objc_msgSend(v23, "valueWithCGRect:");
        [v22 setFromValue:v25];

        v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v8 + v8, v8 + v8);
        [v22 setToValue:v26];

        v27 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"cornerRadius"];
        v28 = NSNumber;
        v29 = [v21 currentLayer];
        [v29 cornerRadius];
        v30 = objc_msgSend(v28, "numberWithDouble:");
        [v27 setFromValue:v30];

        v31 = [NSNumber numberWithDouble:v8];
        [v27 setToValue:v31];

        v32 = [MEMORY[0x1E4F39B38] animation];
        v34[0] = v22;
        v34[1] = v27;
        v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
        [v32 setAnimations:v33];

        [v32 setRemovedOnCompletion:1];
        [v32 setDuration:a3];
        [v21 addAnimation:v32 forKey:@"accuracy"];
        objc_msgSend(v21, "setBounds:", 0.0, 0.0, v8 + v8, v8 + v8);
        [v21 setCornerRadius:v8];
      }
    }
  }
}

- (double)_locationAccuracyInScreenPoints
{
  if (self->_animatingPresentationAccuracy)
  {
    double presentationAccuracy = self->_presentationAccuracy;
LABEL_4:
    [(MKAnnotationView *)self _pointsForDistance:1.0];
    double locationAccuracy = presentationAccuracy / v5;
    goto LABEL_5;
  }
  [(MKAnnotationView *)self _pointsForDistance:self->_locationAccuracy];
  double presentationAccuracy = v4;
  if (self->_animatingPresentationAccuracy) {
    goto LABEL_4;
  }
  double locationAccuracy = self->_locationAccuracy;
LABEL_5:
  [(id)objc_opt_class() baseDiameter];
  if (presentationAccuracy <= v7 * 0.5)
  {
    [(id)objc_opt_class() baseDiameter];
    double presentationAccuracy = v8 * 0.5;
  }
  if (presentationAccuracy >= self->_minimumAccuracyRadius && locationAccuracy >= self->_minimumAccuracyUncertainty) {
    return presentationAccuracy;
  }
  accuracyLayer = self->_accuracyLayer;

  [(_MKPuckAccuracyLayer *)accuracyLayer minimumRadius];
  return result;
}

+ (double)baseDiameter
{
  return 22.0;
}

- (void)_setMapRotationRadians:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView _setMapRotationRadians:](&v7, sel__setMapRotationRadians_);
  self->_mapRotation = a3 * 57.2957795;
  double v5 = +[MKThreadContext currentContext];
  objc_msgSend(v5, "_CA_setDisableActions:", 1);

  [(_MKPuckAnnotationView *)self _updateHeadingIndicators];
  [(_MKPuckAnnotationView *)self _updateInnerCourseRotation];
  double v6 = +[MKThreadContext currentContext];
  objc_msgSend(v6, "_CA_setDisableActions:", 0);
}

- (UIEdgeInsets)_defaultCollisionAlignmentRectInsets
{
  [(id)objc_opt_class() shadowBlur];
  double v3 = v2 + 1.0;
  [(id)objc_opt_class() shadowBlur];
  double v5 = v4;
  [(id)objc_opt_class() shadowBlur];
  double v7 = v6 + 1.0;
  [(id)objc_opt_class() shadowBlur];
  double v9 = v8;
  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  result.right = v9;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

+ (double)shadowBlur
{
  return 10.0;
}

- (void)_updateHeadingIndicators
{
  double v2 = 0.0;
  if (!self->_forceHeadingUp) {
    double v2 = self->_heading - self->_mapRotation;
  }
  [(MKUserLocationHeadingIndicator *)self->_headingLayer updateHeading:v2];
}

- (void)_updateInnerCourseRotation
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v24.m31 = v3;
  *(_OWORD *)&v24.m33 = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v24.m41 = v5;
  *(_OWORD *)&v24.m43 = v6;
  long long v7 = *MEMORY[0x1E4F39B10];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v24.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v24.m13 = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v24.m21 = v9;
  *(_OWORD *)&v24.m23 = v10;
  if (self->_rotateInnerImageToMatchCourse)
  {
    long long v14 = v3;
    long long v15 = v4;
    long long v16 = v5;
    long long v17 = v6;
    long long v18 = v7;
    long long v19 = v8;
    long long v20 = v9;
    long long v21 = v10;
    [(MKAnnotationView *)self _presentationCourse];
    double v12 = v11;
    [(MKAnnotationView *)self _mapRotationRadians];
    *(_OWORD *)&v23.m31 = v14;
    *(_OWORD *)&v23.m33 = v15;
    *(_OWORD *)&v23.m41 = v16;
    *(_OWORD *)&v23.m43 = v17;
    *(_OWORD *)&v23.m11 = v18;
    *(_OWORD *)&v23.m13 = v19;
    *(_OWORD *)&v23.m21 = v20;
    *(_OWORD *)&v23.m23 = v21;
    CATransform3DRotate(&v24, &v23, -(v13 - v12 * 0.0174532925), 0.0, 0.0, 1.0);
  }
  CATransform3D v22 = v24;
  [(CALayer *)self->_innerCircleLayer setTransform:&v22];
}

- (id)_layerToMatchAccuracyRing
{
  return self->_pulseLayer;
}

- (void)_setupLayers
{
  v85[5] = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() baseDiameter];
  double v4 = v3;
  [(id)objc_opt_class() shadowBlur];
  double v6 = v4 + v5 * 2.0;
  [(id)objc_opt_class() shadowBlur];
  double v8 = v4 + v7 * 2.0 + 2.0;
  long long v9 = [(_MKPuckAnnotationView *)self traitCollection];
  self->_useDarkAppearance = [v9 userInterfaceStyle] == 2;

  -[MKAnnotationView setBounds:](self, "setBounds:", 0.0, 0.0, v6, v8);
  long long v10 = [MEMORY[0x1E4F39BE8] layer];
  accuracyContainerLayer = self->_accuracyContainerLayer;
  self->_accuracyContainerLayer = v10;

  -[CALayer setBounds:](self->_accuracyContainerLayer, "setBounds:", 0.0, 0.0, 0.0, 0.0);
  [(_MKPuckAnnotationView *)self bounds];
  double MidX = CGRectGetMidX(v86);
  [(_MKPuckAnnotationView *)self bounds];
  -[CALayer setPosition:](self->_accuracyContainerLayer, "setPosition:", MidX, CGRectGetMidY(v87));
  [(CALayer *)self->_accuracyContainerLayer setAllowsGroupBlending:0];
  [(CALayer *)self->_accuracyContainerLayer setAllowsGroupOpacity:0];
  double v13 = [(_MKPuckAnnotationView *)self layer];
  [v13 addSublayer:self->_accuracyContainerLayer];

  long long v14 = +[_MKPuckAccuracyLayer layer];
  accuracyLayer = self->_accuracyLayer;
  self->_accuracyLayer = v14;

  [(_MKPuckAccuracyLayer *)self->_accuracyLayer setFaux3DEnabled:self->_faux3DEnabled];
  [(id)objc_opt_class() baseDiameter];
  double v17 = v16 * 0.5;
  [(_MKPuckAccuracyLayer *)self->_accuracyLayer setMinimumRadius:v16 * 0.5];
  v84[0] = @"bounds";
  long long v18 = [MEMORY[0x1E4F1CA98] null];
  v85[0] = v18;
  v84[1] = @"position";
  long long v19 = [MEMORY[0x1E4F1CA98] null];
  v85[1] = v19;
  v84[2] = @"cornerRadius";
  long long v20 = [MEMORY[0x1E4F1CA98] null];
  v85[2] = v20;
  v84[3] = @"transform";
  long long v21 = [MEMORY[0x1E4F1CA98] null];
  v85[3] = v21;
  v84[4] = @"hidden";
  CATransform3D v22 = [MEMORY[0x1E4F1CA98] null];
  v85[4] = v22;
  CATransform3D v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:5];
  [(_MKPuckAccuracyLayer *)self->_accuracyLayer setActions:v23];

  [(_MKPuckAccuracyLayer *)self->_accuracyLayer setZPosition:-10000.0];
  CATransform3D v24 = [(_MKPuckAnnotationView *)self traitCollection];
  [(_MKPuckAccuracyLayer *)self->_accuracyLayer setTraitCollection:v24];

  [(CALayer *)self->_accuracyContainerLayer addSublayer:self->_accuracyLayer];
  v25 = [MEMORY[0x1E4F39BE8] layer];
  puckContainerLayer = self->_puckContainerLayer;
  self->_puckContainerLayer = v25;

  -[CALayer setBounds:](self->_puckContainerLayer, "setBounds:", 0.0, 0.0, 0.0, 0.0);
  [(_MKPuckAnnotationView *)self bounds];
  double v27 = CGRectGetMidX(v88);
  [(_MKPuckAnnotationView *)self bounds];
  -[CALayer setPosition:](self->_puckContainerLayer, "setPosition:", v27, CGRectGetMidY(v89));
  [(CALayer *)self->_puckContainerLayer _mapkit_setActionsToRemoveDefaultImplicitActions];
  v28 = [(_MKPuckAnnotationView *)self layer];
  [v28 addSublayer:self->_puckContainerLayer];

  v29 = [MEMORY[0x1E4F39BE8] layer];
  puckLayer = self->_puckLayer;
  self->_puckLayer = v29;

  -[CALayer setBounds:](self->_puckLayer, "setBounds:", 0.0, 0.0, 0.0, 0.0);
  double v31 = *MEMORY[0x1E4F1DAD8];
  double v32 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  -[CALayer setPosition:](self->_puckLayer, "setPosition:", *MEMORY[0x1E4F1DAD8], v32);
  v82[0] = @"hidden";
  v33 = [MEMORY[0x1E4F1CA98] null];
  v83[0] = v33;
  v82[1] = @"opacity";
  v34 = [MEMORY[0x1E4F1CA98] null];
  v83[1] = v34;
  v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
  [(CALayer *)self->_puckLayer setActions:v35];

  [(CALayer *)self->_puckLayer setAllowsGroupBlending:0];
  [(CALayer *)self->_puckLayer setAllowsGroupOpacity:0];
  [(CALayer *)self->_puckContainerLayer addSublayer:self->_puckLayer];
  v36 = [MEMORY[0x1E4F39BE8] layer];
  headingContainerLayer = self->_headingContainerLayer;
  self->_headingContainerLayer = v36;

  -[CALayer setBounds:](self->_headingContainerLayer, "setBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  -[CALayer setPosition:](self->_headingContainerLayer, "setPosition:", v31, v32);
  [(CALayer *)self->_headingContainerLayer setActions:MEMORY[0x1E4F1CC08]];
  [(CALayer *)self->_headingContainerLayer setAllowsGroupBlending:0];
  [(CALayer *)self->_headingContainerLayer setAllowsGroupOpacity:0];
  [(CALayer *)self->_headingContainerLayer setZPosition:-10001.0];
  v38 = [(_MKPuckAnnotationView *)self layer];
  [v38 insertSublayer:self->_headingContainerLayer below:self->_accuracyLayer];

  v39 = [MEMORY[0x1E4F39BE8] layer];
  shadowLayer = self->_shadowLayer;
  self->_shadowLayer = v39;

  [(CALayer *)self->_shadowLayer setName:@"shadow"];
  -[CALayer setBounds:](self->_shadowLayer, "setBounds:", 0.0, 0.0, v6, v8);
  v80[0] = @"bounds";
  v41 = [MEMORY[0x1E4F1CA98] null];
  v80[1] = @"opacity";
  v81[0] = v41;
  v42 = [MEMORY[0x1E4F1CA98] null];
  v81[1] = v42;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:2];
  [(CALayer *)self->_shadowLayer setActions:v43];

  LODWORD(v44) = 1050253722;
  if (!self->_useDarkAppearance) {
    *(float *)&double v44 = 0.25;
  }
  [(CALayer *)self->_shadowLayer setOpacity:v44];
  [(CALayer *)self->_puckLayer addSublayer:self->_shadowLayer];
  v45 = [MEMORY[0x1E4F39BD0] layer];
  faux3DFaceLayer = self->_faux3DFaceLayer;
  self->_faux3DFaceLayer = v45;

  [(CAGradientLayer *)self->_faux3DFaceLayer setName:@"faux3DFace"];
  -[CAGradientLayer setStartPoint:](self->_faux3DFaceLayer, "setStartPoint:", 0.0, 0.5);
  -[CAGradientLayer setEndPoint:](self->_faux3DFaceLayer, "setEndPoint:", 1.0, 0.5);
  -[CAGradientLayer setBounds:](self->_faux3DFaceLayer, "setBounds:", 0.0, 0.0, v4, 0.0);
  v78[0] = @"bounds";
  v47 = [MEMORY[0x1E4F1CA98] null];
  v78[1] = @"transform";
  v79[0] = v47;
  v48 = [MEMORY[0x1E4F1CA98] null];
  v79[1] = v48;
  v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:2];
  [(CAGradientLayer *)self->_faux3DFaceLayer setActions:v49];

  [(CALayer *)self->_puckLayer addSublayer:self->_faux3DFaceLayer];
  v50 = [MEMORY[0x1E4F39BD0] layer];
  faux3DBaseBottomLayer = self->_faux3DBaseBottomLayer;
  self->_faux3DBaseBottomLayer = v50;

  [(CAGradientLayer *)self->_faux3DBaseBottomLayer setName:@"faux3DBaseBottom"];
  -[CAGradientLayer setStartPoint:](self->_faux3DBaseBottomLayer, "setStartPoint:", 0.0, 0.5);
  -[CAGradientLayer setEndPoint:](self->_faux3DBaseBottomLayer, "setEndPoint:", 1.0, 0.5);
  -[CAGradientLayer setBounds:](self->_faux3DBaseBottomLayer, "setBounds:", 0.0, 0.0, v4, v4);
  v76[0] = @"bounds";
  v52 = [MEMORY[0x1E4F1CA98] null];
  v76[1] = @"cornerRadius";
  v77[0] = v52;
  v53 = [MEMORY[0x1E4F1CA98] null];
  v77[1] = v53;
  v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:2];
  [(CAGradientLayer *)self->_faux3DBaseBottomLayer setActions:v54];

  [(CAGradientLayer *)self->_faux3DBaseBottomLayer setCornerRadius:v17];
  [(CALayer *)self->_puckLayer addSublayer:self->_faux3DBaseBottomLayer];
  v55 = [MEMORY[0x1E4F39BE8] layer];
  baseLayer = self->_baseLayer;
  self->_baseLayer = v55;

  [(CALayer *)self->_baseLayer setName:@"base"];
  -[CALayer setBounds:](self->_baseLayer, "setBounds:", 0.0, 0.0, v4, v4);
  v74[0] = @"bounds";
  v57 = [MEMORY[0x1E4F1CA98] null];
  v75[0] = v57;
  v74[1] = @"cornerRadius";
  v58 = [MEMORY[0x1E4F1CA98] null];
  v75[1] = v58;
  v74[2] = @"transform";
  v59 = [MEMORY[0x1E4F1CA98] null];
  v75[2] = v59;
  v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:3];
  [(CALayer *)self->_baseLayer setActions:v60];

  [(CALayer *)self->_puckLayer addSublayer:self->_baseLayer];
  [(id)objc_opt_class() innerDiameter];
  double v62 = v61;
  v63 = [MEMORY[0x1E4F39BE8] layer];
  innerCircleLayer = self->_innerCircleLayer;
  self->_innerCircleLayer = v63;

  [(CALayer *)self->_innerCircleLayer setName:@"inner"];
  -[CALayer setBounds:](self->_innerCircleLayer, "setBounds:", 0.0, 0.0, v62, v62);
  v72[0] = @"bounds";
  v65 = [MEMORY[0x1E4F1CA98] null];
  v73[0] = v65;
  v72[1] = @"cornerRadius";
  v66 = [MEMORY[0x1E4F1CA98] null];
  v73[1] = v66;
  v72[2] = @"contents";
  v67 = [MEMORY[0x1E4F1CA98] null];
  v73[2] = v67;
  v72[3] = @"backgroundColor";
  v68 = [MEMORY[0x1E4F1CA98] null];
  v73[3] = v68;
  v72[4] = @"mask";
  v69 = [MEMORY[0x1E4F1CA98] null];
  v73[4] = v69;
  v72[5] = @"transform";
  v70 = [MEMORY[0x1E4F1CA98] null];
  v73[5] = v70;
  v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:6];
  [(CALayer *)self->_innerCircleLayer setActions:v71];

  -[CALayer setPosition:](self->_innerCircleLayer, "setPosition:", v4 * 0.5, v4 * 0.5);
  [(CALayer *)self->_innerCircleLayer setAllowsEdgeAntialiasing:0];
  [(CALayer *)self->_baseLayer addSublayer:self->_innerCircleLayer];
  [(_MKPuckAnnotationView *)self _createOrRemoveFaux3DRingsIfNecessary];
  [(_MKPuckAnnotationView *)self _updateShadowImage];
  [(_MKPuckAnnotationView *)self _updateBaseImage];
  [(_MKPuckAnnotationView *)self _updateInnerMaskLayer];
  [(_MKPuckAnnotationView *)self _updateGlyphImage];
  [(_MKPuckAnnotationView *)self _updateAccuracyColors];
  [(_MKPuckAnnotationView *)self _updateFaux3DColors];
}

- (void)_updateInnerMaskLayer
{
  if (self->_innerImageMask)
  {
    double v3 = [MEMORY[0x1E4F39BE8] layer];
    objc_msgSend(v3, "setContents:", -[UIImage CGImage](self->_innerImageMask, "CGImage"));
    [(UIImage *)self->_innerImageMask size];
    double v5 = v4;
    [(UIImage *)self->_innerImageMask size];
    objc_msgSend(v3, "setBounds:", 0.0, 0.0, v5, v6);
    [(CALayer *)self->_innerCircleLayer bounds];
    double MidX = CGRectGetMidX(v9);
    [(CALayer *)self->_innerCircleLayer bounds];
    objc_msgSend(v3, "setPosition:", MidX, CGRectGetMidY(v10));
    [(CALayer *)self->_innerCircleLayer setMask:v3];
  }
  else
  {
    [(CALayer *)self->_innerCircleLayer setMask:0];
  }

  [(_MKPuckAnnotationView *)self _updateInnerImage];
}

- (void)_updateGlyphImage
{
  if (self->_glyphImage)
  {
    if (self->_innerCircleLayer)
    {
      if (!self->_glyphLayer)
      {
        double v3 = [MEMORY[0x1E4F39BE8] layer];
        glyphLayer = self->_glyphLayer;
        self->_glyphLayer = v3;

        [(CALayer *)self->_glyphLayer _mapkit_setActionsToRemoveDefaultImplicitActions];
        [(CALayer *)self->_glyphLayer setContentsGravity:*MEMORY[0x1E4F3A3D8]];
        [(CALayer *)self->_innerCircleLayer addSublayer:self->_glyphLayer];
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __42___MKPuckAnnotationView__updateGlyphImage__block_invoke;
      v8[3] = &unk_1E54B8188;
      v8[4] = self;
      double v5 = (void *)MEMORY[0x18C139AE0](v8, a2);
      double v6 = [(_MKPuckAnnotationView *)self traitCollection];
      [v6 performAsCurrentTraitCollection:v5];
    }
  }
  else
  {
    [(CALayer *)self->_glyphLayer removeFromSuperlayer];
    double v7 = self->_glyphLayer;
    self->_glyphLayer = 0;
  }
}

- (void)_setMapType:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView _setMapType:](&v7, sel__setMapType_);
  [(_MKPuckAnnotationView *)self _updatePulseColor];
  [(_MKPuckAccuracyLayer *)self->_accuracyLayer setMapType:a3];
  [(MKUserLocationHeadingIndicator *)self->_headingLayer setMapType:a3];
  if (a3 == 107) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a3 - 1 >= 4) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 2;
  }
  [(_MKPuckAnnotationView *)self _setOverrideUserInterfaceStyle:v6];
}

- (void)_updatePulseColor
{
  unint64_t v3 = [(MKAnnotationView *)self _mapType];
  BOOL v4 = v3 - 1 < 4 || v3 == 107;
  char v5 = (char)[(MKAnnotationView *)self _mapDisplayStyle];
  uint64_t v6 = [(_MKPuckAnnotationView *)self _effectiveTintColor];
  if (v4 || v5 == 1)
  {
    objc_super v7 = [MEMORY[0x1E4F428B8] whiteColor];
    double v8 = objc_msgSend(v6, "_mapkit_blendedColorWithFraction:ofColor:", v7, 0.400000006);

    if (v8)
    {
      id v9 = v8;

      uint64_t v6 = v9;
    }
  }
  id v10 = v6;
  -[CALayer setBackgroundColor:](self->_pulseLayer, "setBackgroundColor:", [v10 CGColor]);
}

- (void)_updateBaseImage
{
  id v36 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  unint64_t v3 = [(_MKPuckAnnotationView *)self traitCollection];
  [MEMORY[0x1E4F42F80] setCurrentTraitCollection:v3];

  [(_MKPuckAnnotationView *)self _currentScreenScale];
  double v5 = fmax(v4, 1.0);
  [(id)objc_opt_class() baseDiameter];
  double v7 = v6 * v5;
  [(id)objc_opt_class() innerDiameter];
  double v9 = v8;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  double v12 = CGBitmapContextCreate(0, (unint64_t)v7, (unint64_t)v7, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSaveGState(v12);
  double v13 = 0.0;
  if ([(_MKPuckAnnotationView *)self shouldShowOuterRing])
  {
    [(id)objc_opt_class() outerRingWidth];
    if (v14 > 0.0)
    {
      [(id)objc_opt_class() outerRingWidth];
      double v13 = v15;
      if ([(_MKPuckAnnotationView *)self isStale]) {
        [MEMORY[0x1E4F428B8] colorWithDynamicProvider:&__block_literal_global_75];
      }
      else {
      id v16 = [(_MKPuckAnnotationView *)self _effectiveTintColor];
      }
      double v17 = (CGColor *)[v16 CGColor];

      CGContextSetFillColorWithColor(v12, v17);
      v38.origin.CGFloat x = round(v7 - v7) * 0.5;
      v38.origin.CGFloat y = v38.origin.x;
      v38.size.CGFloat width = v7;
      v38.size.CGFloat height = v7;
      CGContextFillEllipseInRect(v12, v38);
    }
  }
  double v18 = v5 * v9;
  long long v19 = _MKPuckAnnotationViewBaseColor([(MKAnnotationView *)self _mapType], self->_displaysPuckAsAccuracy);
  CGContextSaveGState(v12);
  double v20 = round(v7 - v7 + v13) * 0.5;
  double v21 = v7 - v13;
  id v22 = v19;
  CATransform3D v23 = (CGColor *)[v22 CGColor];
  double v35 = v18;
  if (self->_displaysPuckAsAccuracy)
  {
    CGFloat v24 = (v7 - v18) * 0.5;
    v39.origin.CGFloat x = v20;
    v39.origin.CGFloat y = v20;
    v39.size.CGFloat width = v21;
    v39.size.CGFloat height = v21;
    CGRect v40 = CGRectInset(v39, v24 * 0.5, v24 * 0.5);
    CGFloat x = v40.origin.x;
    CGFloat y = v40.origin.y;
    CGFloat width = v40.size.width;
    CGFloat height = v40.size.height;
    CGContextSetLineWidth(v12, v24);
    CGContextSetStrokeColorWithColor(v12, v23);
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    CGContextStrokeEllipseInRect(v12, v41);
  }
  else
  {
    CGContextSetFillColorWithColor(v12, v23);
    v42.origin.CGFloat x = v20;
    v42.origin.CGFloat y = v20;
    v42.size.CGFloat width = v7 - v13;
    v42.size.CGFloat height = v7 - v13;
    CGContextFillEllipseInRect(v12, v42);
  }
  CGContextRestoreGState(v12);
  if (self->_displaysPuckAsAccuracy)
  {
    v43.origin.CGFloat x = v20;
    v43.origin.CGFloat y = v20;
    v43.size.CGFloat width = v21;
    v43.size.CGFloat height = v21;
    CGRect v44 = CGRectInset(v43, (v7 - v35) * 0.5, (v7 - v35) * 0.5);
    CGFloat v29 = v44.origin.x;
    CGFloat v30 = v44.origin.y;
    CGFloat v31 = v44.size.width;
    CGFloat v32 = v44.size.height;
    CGContextSaveGState(v12);
    id v33 = [(_MKPuckAnnotationView *)self _currentInnerColor];
    CGContextSetFillColorWithColor(v12, (CGColorRef)[v33 CGColor]);

    v45.origin.CGFloat x = v29;
    v45.origin.CGFloat y = v30;
    v45.size.CGFloat width = v31;
    v45.size.CGFloat height = v32;
    CGContextFillEllipseInRect(v12, v45);
    CGContextRestoreGState(v12);
  }
  Image = CGBitmapContextCreateImage(v12);
  [(CALayer *)self->_baseLayer setContents:Image];
  CGImageRelease(Image);
  CGContextRelease(v12);
  [MEMORY[0x1E4F42F80] setCurrentTraitCollection:v36];
}

- (void)_updateInnerImage
{
  id v26 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  unint64_t v3 = [(_MKPuckAnnotationView *)self traitCollection];
  [MEMORY[0x1E4F42F80] setCurrentTraitCollection:v3];

  id v4 = [(_MKPuckAnnotationView *)self _currentInnerColor];
  double v5 = (CGColor *)[v4 CGColor];

  if (self->_innerImageMask)
  {
    [(CALayer *)self->_innerCircleLayer setContents:0];
    [(CALayer *)self->_innerCircleLayer setBackgroundColor:v5];
  }
  else
  {
    int v6 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters");
    double v7 = [(CALayer *)self->_innerCircleLayer contents];
    double v8 = CGImageRetain(v7);

    [(_MKPuckAnnotationView *)self _currentScreenScale];
    double v10 = fmax(v9, 1.0);
    [(id)objc_opt_class() innerDiameter];
    double v12 = v11 * v10;
    double v13 = v10 * (v11 * 10.0);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    id v16 = CGBitmapContextCreate(0, (unint64_t)v13, (unint64_t)v12, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
    CGColorSpaceRelease(DeviceRGB);
    CGContextSaveGState(v16);
    if (!self->_displaysPuckAsAccuracy)
    {
      double v17 = v12 * 0.5;
      for (unint64_t i = 1; i != 11; ++i)
      {
        CGContextSaveGState(v16);
        double v19 = v17 * ((double)i / 10.0 * 0.1875 + 0.8125);
        CGFloat v20 = v17 + (double)(i - 1) * v12 - v19;
        CGFloat v21 = v17 - v19;
        CGFloat v22 = v19 + v19;
        CGContextSetFillColorWithColor(v16, v5);
        v28.origin.CGFloat x = v20;
        v28.origin.CGFloat y = v21;
        v28.size.CGFloat width = v22;
        v28.size.CGFloat height = v22;
        CGContextFillEllipseInRect(v16, v28);
        CGContextRestoreGState(v16);
      }
    }
    CGContextRestoreGState(v16);
    Image = CGBitmapContextCreateImage(v16);
    [(CALayer *)self->_innerCircleLayer setContents:Image];
    [(CALayer *)self->_innerCircleLayer setBackgroundColor:0];
    CGContextRelease(v16);
    [(_MKPuckAnnotationView *)self _resetInnerPulseFrame];
    if (v6)
    {
      CGFloat v24 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"contents"];
      [v24 setFromValue:v8];
      [v24 setToValue:Image];
      [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
      objc_msgSend(v24, "setDuration:");
      v25 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_currentAnimationTimingFunction");
      [v24 setTimingFunction:v25];

      [v24 setRemovedOnCompletion:1];
      [(CALayer *)self->_innerCircleLayer addAnimation:v24 forKey:@"image"];
    }
    CGImageRelease(v8);
    CGImageRelease(Image);
    [MEMORY[0x1E4F42F80] setCurrentTraitCollection:v26];
  }
}

+ (double)innerDiameter
{
  return 16.0;
}

- (void)_resetInnerPulseFrame
{
  if (self->_shouldInnerPulse) {
    double v3 = 0.500000007;
  }
  else {
    double v3 = (double)[(_MKPuckAnnotationView *)self _innerPulseFrameWhenDisabled:10]
  }
       * 0.100000001;
  innerCircleLayer = self->_innerCircleLayer;

  -[CALayer setContentsRect:](innerCircleLayer, "setContentsRect:", v3, 0.0, 0.100000001, 1.0);
}

- (void)_updateShadowImage
{
  [(_MKPuckAnnotationView *)self _currentScreenScale];
  double v4 = fmax(v3, 1.0);
  [(id)objc_opt_class() baseDiameter];
  double v6 = v5;
  double v7 = v5 * v4;
  double v8 = 0.0;
  if ([(_MKPuckAnnotationView *)self shouldShowOuterRing])
  {
    [(id)objc_opt_class() outerRingWidth];
    if (v9 > 0.0)
    {
      [(id)objc_opt_class() outerRingWidth];
      double v8 = v10;
    }
  }
  [(id)objc_opt_class() shadowBlur];
  double v12 = v6 + v11 * 2.0;
  [(id)objc_opt_class() shadowBlur];
  double v14 = v6 + v13 * 2.0 + 2.0;
  double v15 = v4 * v12;
  double v16 = v4 * v14;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  double v19 = CGBitmapContextCreate(0, (unint64_t)v15, (unint64_t)v16, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSaveGState(v19);
  double v20 = round(v8 + v15 - v7) * 0.5;
  double v21 = round(v8 + v16 - v7) * 0.5;
  double v22 = v7 - v8;
  double v23 = v21 - v16;
  [(id)objc_opt_class() shadowBlur];
  CGFloat v25 = v4 * v24;
  objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"PuckShadowColor");
  id v26 = objc_claimAutoreleasedReturnValue();
  double v27 = (CGColor *)[v26 CGColor];
  v41.CGFloat width = 0.0;
  v41.CGFloat height = v16 - v4;
  CGContextSetShadowWithColor(v19, v41, v25, v27);

  if (self->_displaysPuckAsAccuracy)
  {
    [(id)objc_opt_class() innerDiameter];
    CGFloat v29 = (v7 - v4 * v28) * 0.5;
    v42.origin.CGFloat x = v20;
    v42.origin.CGFloat y = v23;
    v42.size.CGFloat width = v22;
    v42.size.CGFloat height = v22;
    CGRect v43 = CGRectInset(v42, v29 * 0.5, v29 * 0.5);
    CGFloat x = v43.origin.x;
    CGFloat y = v43.origin.y;
    CGFloat width = v43.size.width;
    CGFloat height = v43.size.height;
    CGContextSetLineWidth(v19, v29);
    CGContextSetRGBStrokeColor(v19, 1.0, 1.0, 1.0, 1.0);
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    CGContextStrokeEllipseInRect(v19, v44);
  }
  else
  {
    CGContextSetRGBFillColor(v19, 1.0, 0.0, 0.0, 1.0);
    v45.origin.CGFloat x = v20;
    v45.origin.CGFloat y = v23;
    v45.size.CGFloat width = v22;
    v45.size.CGFloat height = v22;
    CGContextFillEllipseInRect(v19, v45);
  }
  CGContextRestoreGState(v19);
  Image = CGBitmapContextCreateImage(v19);
  [(CALayer *)self->_shadowLayer setContents:Image];
  CGImageRelease(Image);
  CGContextRelease(v19);
  [(MKAnnotationView *)self _mapPitchRadians];
  if (self->_useDarkAppearance) {
    double v36 = 0.300000012;
  }
  else {
    double v36 = 0.25;
  }
  long double v37 = 1.0 - cos(v35);
  double v38 = v37 * 0.5 + (1.0 - v37) * v36;
  *(float *)&double v38 = v38;
  shadowLayer = self->_shadowLayer;

  [(CALayer *)shadowLayer setOpacity:v38];
}

- (BOOL)shouldShowOuterRing
{
  return self->_shouldShowOuterRing;
}

- (void)_updateAccuracyColors
{
  id v3 = [(_MKPuckAnnotationView *)self _effectiveTintColor];
  [(_MKPuckAccuracyLayer *)self->_accuracyLayer setTintColor:v3];
}

- (id)_currentInnerColor
{
  if ([(_MKPuckAnnotationView *)self isStale]) {
    [MEMORY[0x1E4F428B8] colorWithDynamicProvider:&__block_literal_global_75];
  }
  else {
  id v3 = [(_MKPuckAnnotationView *)self _effectiveTintColor];
  }
  if (self->_displaysPuckAsAccuracy)
  {
    if ([(_MKPuckAnnotationView *)self isStale])
    {
      double v4 = 0.449999988;
    }
    else
    {
      unint64_t v5 = [(MKAnnotationView *)self _mapType];
      if (v5 - 1 < 4 || v5 == 107) {
        double v4 = 0.400000006;
      }
      else {
        double v4 = 0.300000012;
      }
    }
    uint64_t v6 = [v3 colorWithAlphaComponent:v4];

    id v3 = (void *)v6;
  }

  return v3;
}

- (id)_effectiveTintColor
{
  double v2 = [(_MKPuckAnnotationView *)self tintColor];
  if (objc_msgSend(v2, "_mapkit_isWhite"))
  {
    uint64_t v3 = [MEMORY[0x1E4F428B8] systemBlueColor];

    double v2 = (void *)v3;
  }

  return v2;
}

- (void)_updateFaux3DColors
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (self->_faux3DEnabled)
  {
    uint64_t v3 = [MEMORY[0x1E4F42F80] currentTraitCollection];
    double v4 = [(_MKPuckAnnotationView *)self traitCollection];
    [MEMORY[0x1E4F42F80] setCurrentTraitCollection:v4];

    unint64_t v5 = objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"PuckFaux3DFaceHighlight");
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"PuckFaux3DFaceDark");
    objc_msgSend(v5, "_mapkit_blendedColorWithFraction:ofColor:", v6, 0.200000003);
    id v7 = objc_claimAutoreleasedReturnValue();
    v11[0] = [v7 CGColor];
    id v8 = v5;
    v11[1] = objc_msgSend(v8, "CGColor", v11[0]);
    id v9 = v6;
    v11[2] = [v9 CGColor];
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
    [(CAGradientLayer *)self->_faux3DFaceLayer setColors:v10];
    [(CAGradientLayer *)self->_faux3DFaceLayer setLocations:&unk_1ED97F488];
    [(CAGradientLayer *)self->_faux3DBaseBottomLayer setColors:v10];
    [(CAGradientLayer *)self->_faux3DBaseBottomLayer setLocations:&unk_1ED97F488];
    [MEMORY[0x1E4F42F80] setCurrentTraitCollection:v3];
  }
}

- (void)_createOrRemoveFaux3DRingsIfNecessary
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_faux3DEnabled && self->_displaysPuckAsAccuracy)
  {
    uint64_t v3 = [MEMORY[0x1E4F39BE8] layer];
    faux3DHighlightMask = self->_faux3DHighlightMask;
    self->_faux3DHighlightMask = v3;

    [(CAGradientLayer *)self->_faux3DFaceLayer bounds];
    -[CALayer setFrame:](self->_faux3DHighlightMask, "setFrame:");
    [(CAGradientLayer *)self->_faux3DFaceLayer setMask:self->_faux3DHighlightMask];
    [(id)objc_opt_class() baseDiameter];
    double v6 = v5;
    [(id)objc_opt_class() innerDiameter];
    double v8 = (v6 - v7) * 0.5;
    unint64_t v9 = vcvtpd_u64_f64(12.0 / v8);
    double v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
    if (v9)
    {
      double v11 = *MEMORY[0x1E4F1DAD8];
      double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      do
      {
        double v13 = [MEMORY[0x1E4F39BE8] layer];
        objc_msgSend(v13, "setBounds:", 0.0, 0.0, v6, v6);
        objc_msgSend(v13, "setAnchorPoint:", v11, v12);
        objc_msgSend(v13, "setPosition:", v11, v12);
        [v13 bounds];
        [v13 setCornerRadius:v14 * 0.5];
        [v13 setBorderWidth:v8];
        id v15 = [MEMORY[0x1E4F428B8] blackColor];
        objc_msgSend(v13, "setBorderColor:", objc_msgSend(v15, "CGColor"));

        objc_msgSend(v13, "_mapkit_setActionsToRemoveDefaultImplicitActions");
        [v13 setHidden:1];
        [(NSArray *)v10 addObject:v13];
        [(CALayer *)self->_faux3DHighlightMask insertSublayer:v13 above:self->_shadowLayer];

        --v9;
      }
      while (v9);
    }
    faux3DHighlightMaskRings = self->_faux3DHighlightMaskRings;
    self->_faux3DHighlightMaskRings = v10;
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v17 = self->_faux3DHighlightMaskRings;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "removeFromSuperlayer", (void)v24);
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v19);
    }

    [(CAGradientLayer *)self->_faux3DFaceLayer setMask:0];
    double v22 = self->_faux3DHighlightMask;
    self->_faux3DHighlightMask = 0;

    double v23 = self->_faux3DHighlightMaskRings;
    self->_faux3DHighlightMaskRings = 0;
  }
}

- (void)_setMapDisplayStyle:(id)a3
{
  uint64_t v3 = *(void *)&a3.var0;
  if ((([(MKAnnotationView *)self _mapDisplayStyle] ^ *(void *)&a3.var0) & 0x1FFFFFFFFFFLL) != 0)
  {
    BOOL v5 = [(MKAnnotationView *)self _mapDisplayStyle] == 1;
    v6.receiver = self;
    v6.super_class = (Class)_MKPuckAnnotationView;
    [(MKAnnotationView *)&v6 _setMapDisplayStyle:v3 & 0xFFFFFFFFFFFFLL];
    if ((((v3 != 1) ^ v5) & 1) == 0)
    {
      [(_MKPuckAnnotationView *)self _updatePulseColor];
      [(_MKPuckAnnotationView *)self _updateInnerImage];
    }
  }
}

- (id)_vkNavigationPuckMarker
{
  return self->_navigationPuckMarker;
}

- (void)_setVKNavigationPuckMarker:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (VKNavigationPuck *)a3;
  p_navigationPuckMarker = (id *)&self->_navigationPuckMarker;
  if (self->_navigationPuckMarker != v5)
  {
    double v7 = MKGetUserLocationViewLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = *p_navigationPuckMarker;
      int v10 = 138412802;
      double v11 = self;
      __int16 v12 = 2112;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_INFO, "Updating VK navigation puck marker for view: %@. Current: %@, New: %@", (uint8_t *)&v10, 0x20u);
    }

    objc_storeStrong((id *)&self->_navigationPuckMarker, a3);
    unint64_t v9 = [(MKAnnotationView *)self annotation];
    [*p_navigationPuckMarker setAnnotation:v9];

    objc_msgSend(*p_navigationPuckMarker, "setAnimatingToCoordinate:", -[MKAnnotationView _isAnimatingToCoordinate](self, "_isAnimatingToCoordinate"));
    [(MKAnnotationView *)self _presentationCoordinate];
    [(MKAnnotationView *)self _presentationCoordinate];
    VKLocationCoordinate2DMake();
    objc_msgSend(*p_navigationPuckMarker, "setPresentationCoordinate:");
    [(MKAnnotationView *)self _presentationCourse];
    objc_msgSend(*p_navigationPuckMarker, "setPresentationCourse:");
    objc_msgSend(*p_navigationPuckMarker, "setTracking:", -[MKAnnotationView _isTracking](self, "_isTracking"));
  }
}

- (void)_setAnimatingToCoordinate:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView _setAnimatingToCoordinate:](&v5, sel__setAnimatingToCoordinate_);
  [(VKNavigationPuck *)self->_navigationPuckMarker setAnimatingToCoordinate:v3];
}

- (BOOL)shouldDisplayInaccurateHeading
{
  return self->_shouldDisplayInaccurateHeading;
}

- (void)setEffectsEnabled:(BOOL)a3
{
  if (self->_effectsEnabled != a3)
  {
    BOOL v3 = a3;
    self->_effectsEnabled = a3;
    [(_MKPuckAnnotationView *)self _updatePulse];
    if (v3)
    {
      [(CALayer *)self->_innerCircleLayer timeOffset];
      double v6 = v5;
      LODWORD(v5) = 1.0;
      [(CALayer *)self->_innerCircleLayer setSpeed:v5];
      [(CALayer *)self->_innerCircleLayer setTimeOffset:0.0];
      [(CALayer *)self->_innerCircleLayer setBeginTime:0.0];
      [(CALayer *)self->_innerCircleLayer convertTime:0 fromLayer:CACurrentMediaTime()];
      double v8 = v7 - v6;
      innerCircleLayer = self->_innerCircleLayer;
      [(CALayer *)innerCircleLayer setBeginTime:v8];
    }
    else
    {
      [(CALayer *)self->_innerCircleLayer convertTime:0 fromLayer:CACurrentMediaTime()];
      double v11 = v10;
      [(CALayer *)self->_innerCircleLayer setSpeed:0.0];
      __int16 v12 = self->_innerCircleLayer;
      [(CALayer *)v12 setTimeOffset:v11];
    }
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)_MKPuckAnnotationView;
  [(_MKPuckAnnotationView *)&v3 didMoveToWindow];
  [(_MKPuckAnnotationView *)self _updatePulse];
  [(_MKPuckAnnotationView *)self _updatePulseAnimation];
  [(_MKPuckAnnotationView *)self _updateAccuracyAnimation];
  [(_MKPuckAnnotationView *)self _updateShadowImage];
  [(_MKPuckAnnotationView *)self _updateBaseImage];
  [(_MKPuckAnnotationView *)self _updateInnerImage];
  [(_MKPuckAnnotationView *)self _updateToReflectLocationAccuracyWithDuration:0 allowShowHideAnimation:0.0];
}

- (void)_updatePulse
{
  if (self->_shouldPulse && self->_allowsPulse)
  {
    if ([(_MKPuckAnnotationView *)self isEffectsEnabled])
    {
      [(_MKPuckAnnotationView *)self _resumePulse];
    }
    else
    {
      [(_MKPuckAnnotationView *)self _pausePulse];
    }
  }
  else
  {
    [(_MKPuckAnnotationView *)self _removePulse];
  }
}

- (void)_removePulse
{
  objc_super v3 = [(CALayer *)self->_pulseLayer superlayer];

  if (v3)
  {
    BOOL v4 = [(_MKPuckAnnotationView *)self _hideLargeAccuracyRing];
    pulseLayer = self->_pulseLayer;
    if (v4)
    {
      double v6 = [(CALayer *)pulseLayer animationForKey:@"fadePulse"];
      if (!v6)
      {
        double v7 = [(CALayer *)self->_pulseLayer animationForKey:@"outerPulse"];
        if (v7)
        {
          double v8 = CACurrentMediaTime();
          [v7 beginTime];
          double v10 = v8 - v9;
          [v7 timeOffset];
          long double v12 = v10 + v11;
          [v7 duration];
          double v14 = fmod(v12, v13);
          double v6 = [(_MKPuckAnnotationView *)self _pulseAnimation];
          [v6 setRepeatCount:0.0];
          [v6 setRemovedOnCompletion:1];
          [v6 setBeginTime:-v14];
          [v6 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
          [(CALayer *)self->_pulseLayer removeAnimationForKey:@"outerPulse"];
          id v15 = self->_pulseLayer;
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __37___MKPuckAnnotationView__removePulse__block_invoke;
          v17[3] = &unk_1E54B86F0;
          v17[4] = self;
          [(CALayer *)v15 _mapkit_addAnimation:v6 forKey:@"fadePulse" completion:v17];
        }
        else
        {
          [(CALayer *)self->_pulseLayer removeFromSuperlayer];
          double v6 = 0;
        }
      }
    }
    else
    {
      [(CALayer *)pulseLayer removeAnimationForKey:@"outerPulse"];
      uint64_t v16 = self->_pulseLayer;
      [(CALayer *)v16 removeFromSuperlayer];
    }
  }
}

- (void)_updateAccuracyAnimation
{
  BOOL shouldShowDynamicLocationAnimations = self->_shouldShowDynamicLocationAnimations;
  accuracyLayer = self->_accuracyLayer;
  if (shouldShowDynamicLocationAnimations) {
    [(_MKPuckAccuracyLayer *)accuracyLayer startAnimationsIfNecessary];
  }
  else {
    [(_MKPuckAccuracyLayer *)accuracyLayer stopAnimations];
  }
}

- (id)_innerPulseAnimation
{
  double v2 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"contentsRect"];
  objc_super v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  for (unint64_t i = 0; i != 10; ++i)
  {
    double v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", (double)i * 0.100000001, 0.0, 0.100000001, 1.0);
    [v3 addObject:v5];
  }
  [v2 setValues:v3];
  [v2 setCalculationMode:*MEMORY[0x1E4F39D78]];
  [v2 setDuration:1.5];
  [v2 setAutoreverses:1];
  LODWORD(v6) = 2139095040;
  [v2 setRepeatCount:v6];
  double v7 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
  [v2 setTimingFunction:v7];

  [v2 setRemovedOnCompletion:0];
  [v2 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v2 setFrameInterval:0.0250000004];

  return v2;
}

- (void)_updatePulseAnimation
{
  if (self->_shouldInnerPulse && self->_shouldShowDynamicLocationAnimations)
  {
    objc_super v3 = [(CALayer *)self->_innerCircleLayer animationForKey:@"pulse"];

    if (!v3)
    {
      id v26 = [(_MKPuckAnnotationView *)self _innerPulseAnimation];
      double v5 = [(CALayer *)self->_pulseLayer animationForKey:@"outerPulse"];

      if (v5)
      {
        double v6 = [(CALayer *)self->_pulseLayer animationForKey:@"outerPulse"];
        double v7 = (void *)[v6 copy];

        pulseLayer = self->_pulseLayer;
        innerCircleLayer = self->_innerCircleLayer;
        id v10 = v7;
        double v11 = pulseLayer;
        id v12 = v26;
        if (v12)
        {
          long double v13 = innerCircleLayer;
          int v14 = [v12 autoreverses];
          [v12 duration];
          if (v14) {
            double v16 = v15 + v15;
          }
          else {
            double v16 = v15;
          }
          [(CALayer *)v13 convertTime:0 fromLayer:CACurrentMediaTime()];
          double v18 = v17;
          [v12 beginTime];
          double v20 = v19;
          [v12 timeOffset];
          double v22 = fmod(v18 - (v20 + v21), v16);
          [v12 beginTime];
          -[CALayer convertTime:toLayer:](v13, "convertTime:toLayer:", v11);
          long double v24 = v23;

          [v10 duration];
          objc_msgSend(v10, "setBeginTime:", (double)fmod(v24, v25));
          [v10 setTimeOffset:v16 - v22];
          [v10 setDuration:v16];
        }

        [(CALayer *)self->_pulseLayer addAnimation:v10 forKey:@"outerPulse"];
      }
      [(CALayer *)self->_innerCircleLayer addAnimation:v26 forKey:@"pulse"];
    }
  }
  else
  {
    BOOL v4 = self->_innerCircleLayer;
    [(CALayer *)v4 removeAnimationForKey:@"pulse"];
  }
}

- (void)setShouldDisplayInaccurateHeading:(BOOL)a3
{
  if (self->_shouldDisplayInaccurateHeading != a3)
  {
    self->_shouldDisplayInaccurateHeading = a3;
    [(MKUserLocationHeadingIndicator *)self->_headingLayer updateHeadingAccuracy:self->_headingAccuracy previousAccuracy:self->_headingAccuracy];
  }
}

- (void)_updatePuckVisibilityForRadius:(double)a3 previousRadius:(double)a4 duration:(double)a5
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  BOOL v9 = self->_shouldHidePuckWhenAccuracyVisible
    && ([(_MKPuckAccuracyLayer *)self->_accuracyLayer isHidden] & 1) == 0
    && self->_minimumAccuracyRadius <= a3;
  if (self->_animatingPresentationAccuracy)
  {
    [(MKAnnotationView *)self _pointsForDistance:1.0];
    double locationAccuracy = a3 / v10;
  }
  else
  {
    double locationAccuracy = self->_locationAccuracy;
  }
  minimumAccuracyUncertaintCGFloat y = self->_minimumAccuracyUncertainty;
  [(CALayer *)self->_puckLayer opacity];
  char v14 = !v9;
  if (locationAccuracy < minimumAccuracyUncertainty) {
    char v14 = 1;
  }
  if (v14)
  {
    BOOL v16 = 0;
    BOOL v15 = fabsf(v13) < 0.000001;
  }
  else
  {
    BOOL v15 = 0;
    BOOL v16 = v13 > 0.0;
    if (v13 > 0.0) {
      goto LABEL_15;
    }
  }
  if (!v15) {
    return;
  }
LABEL_15:
  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke;
  v128[3] = &unk_1E54B8188;
  v128[4] = self;
  double v17 = (void (**)(void))MEMORY[0x18C139AE0](v128);
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke_2;
  v127[3] = &unk_1E54BC770;
  v127[4] = self;
  double v18 = (void (**)(void))MEMORY[0x18C139AE0](v127);
  if (v16)
  {
    v17[2](v17);
    if (a5 > 0.0)
    {
      v116 = v18;
      v118 = v17;
      double v19 = v18[2](v18);
      v114 = self->_puckTransitionContainer;
      objc_storeStrong((id *)&self->_puckTransitionLayer, v19);
      id v20 = v19;
      [v20 bounds];
      if (20.0 / (a3 + v21 * -0.5) > 0.400000006
        || ([v20 bounds], double v23 = 0.150000006, 20.0 / (a3 + v22 * -0.5) > 0.150000006))
      {
        [v20 bounds];
        double v23 = 0.400000006;
        if (20.0 / (a3 + v24 * -0.5) <= 0.400000006)
        {
          [v20 bounds];
          double v23 = 20.0 / (a3 + v25 * -0.5);
        }
      }
      id v26 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
      long long v27 = (void *)MEMORY[0x1E4F29238];
      [v20 bounds];
      double v28 = objc_msgSend(v27, "valueWithCGRect:");
      [v26 setFromValue:v28];

      uint64_t v29 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, a3 + a3, a3 + a3);
      [v26 setToValue:v29];

      CGFloat v30 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"cornerRadius"];
      CGFloat v31 = NSNumber;
      [v20 cornerRadius];
      CGFloat v32 = objc_msgSend(v31, "numberWithDouble:");
      [v30 setFromValue:v32];

      id v33 = [NSNumber numberWithDouble:a3];
      [v30 setToValue:v33];

      v34 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
      [v34 setValues:&unk_1ED97F4D0];
      v137 = &unk_1ED97E910;
      long double v35 = [NSNumber numberWithDouble:v23];
      v138 = v35;
      double v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v137 count:2];
      [v34 setKeyTimes:v36];

      long double v37 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"borderWidth"];
      double v38 = NSNumber;
      [v20 borderWidth];
      CGRect v39 = objc_msgSend(v38, "numberWithDouble:");
      v134 = v39;
      CGRect v40 = [NSNumber numberWithDouble:4.0];
      v135 = v40;
      CGSize v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:2];
      [v37 setValues:v41];

      CGRect v42 = [v34 keyTimes];
      [v37 setKeyTimes:v42];

      CGRect v43 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"shadowPath"];
      objc_msgSend(v43, "setFromValue:", objc_msgSend(v20, "shadowPath"));
      v141.origin.CGFloat x = 0.0;
      v141.origin.CGFloat y = 0.0;
      v141.size.CGFloat width = a3 + a3;
      v141.size.CGFloat height = a3 + a3;
      CGRect v44 = CGPathCreateWithEllipseInRect(v141, 0);
      CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v44, 0, 4.0, kCGLineCapRound, kCGLineJoinRound, 0.0);
      [v43 setToValue:CopyByStrokingPath];
      CGPathRelease(CopyByStrokingPath);
      CGPathRelease(v44);
      v46 = [MEMORY[0x1E4F39B38] animation];
      v129 = v26;
      v130 = v30;
      v131 = v34;
      v132 = v37;
      v133 = v43;
      v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:5];
      [v46 setAnimations:v47];

      [v46 setDuration:a5];
      [v46 setRemovedOnCompletion:1];

      if (self->_displaysPuckAsAccuracy)
      {
        id v48 = v20;
        [v48 bounds];
        if (20.0 / (a3 + v49 * -0.5) > 0.400000006
          || ([v48 bounds], double v51 = 0.150000006, 20.0 / (a3 + v50 * -0.5) > 0.150000006))
        {
          [v48 bounds];
          double v51 = 0.400000006;
          if (20.0 / (a3 + v52 * -0.5) <= 0.400000006)
          {
            [v48 bounds];
            double v51 = 20.0 / (a3 + v53 * -0.5);
          }
        }
        v54 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
        [v54 setValues:&unk_1ED97F4E8];
        v129 = &unk_1ED97E910;
        v55 = [NSNumber numberWithDouble:v51];
        v130 = v55;
        v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:2];
        [v54 setKeyTimes:v56];

        [v54 setDuration:a5];
        [v54 setFillMode:*MEMORY[0x1E4F39FA0]];
        [v54 setRemovedOnCompletion:1];
      }
      else
      {
        v54 = 0;
      }
      v123[0] = MEMORY[0x1E4F143A8];
      v123[1] = 3221225472;
      v123[2] = __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke_3;
      v123[3] = &unk_1E54B9068;
      id v101 = v20;
      id v124 = v101;
      v102 = v114;
      v125 = v102;
      v126 = self;
      objc_msgSend(v101, "_mapkit_addAnimation:forKey:completion:", v46, @"show/hide", v123);
      if (v54) {
        [(_MKPuckAccuracyLayer *)self->_accuracyLayer addAnimation:v54 forKey:@"show/hide"];
      }

      double v18 = v116;
      double v17 = v118;
    }
    v103 = +[MKThreadContext currentContext];
    objc_msgSend(v103, "_CA_setDisableActions:", 1);

    [(CALayer *)self->_puckLayer setOpacity:0.0];
    pulseLayer = self->_pulseLayer;
    uint64_t v100 = 1;
    goto LABEL_45;
  }
  if (v15)
  {
    if (a5 > 0.0)
    {
      v119 = v17;
      v17[2](v17);
      v117 = v18;
      v57 = v18[2](v18);
      v115 = self->_puckTransitionContainer;
      objc_storeStrong((id *)&self->_puckTransitionLayer, v57);
      id v58 = v57;
      [v58 bounds];
      if (20.0 / (a4 + v59 * -0.5) > 0.400000006
        || ([v58 bounds], double v61 = 0.150000006, 20.0 / (a4 + v60 * -0.5) > 0.150000006))
      {
        [v58 bounds];
        double v61 = 0.400000006;
        if (20.0 / (a4 + v62 * -0.5) <= 0.400000006)
        {
          [v58 bounds];
          double v61 = 20.0 / (a4 + v63 * -0.5);
        }
      }
      v64 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
      v65 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, a4 + a4, a4 + a4);
      v112 = v64;
      [v64 setFromValue:v65];

      v66 = (void *)MEMORY[0x1E4F29238];
      [v58 bounds];
      v67 = objc_msgSend(v66, "valueWithCGRect:");
      [v64 setToValue:v67];

      v68 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"cornerRadius"];
      v69 = [NSNumber numberWithDouble:a4];
      v110 = v68;
      [v68 setFromValue:v69];

      v70 = NSNumber;
      [v58 cornerRadius];
      v71 = objc_msgSend(v70, "numberWithDouble:");
      [v68 setToValue:v71];

      v72 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
      [v72 setValues:&unk_1ED97F500];
      v137 = &unk_1ED97E910;
      v73 = [NSNumber numberWithDouble:1.0 - v61];
      v138 = v73;
      v139 = &unk_1ED97E928;
      v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v137 count:3];
      [v72 setKeyTimes:v74];

      v75 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"borderWidth"];
      v76 = [NSNumber numberWithDouble:4.0];
      v134 = v76;
      v77 = [NSNumber numberWithDouble:4.0];
      v135 = v77;
      v78 = NSNumber;
      [v58 borderWidth];
      v79 = objc_msgSend(v78, "numberWithDouble:");
      v136 = v79;
      v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:3];
      [v75 setValues:v80];

      v81 = [v72 keyTimes];
      [v75 setKeyTimes:v81];

      v82 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"shadowPath"];
      objc_msgSend(v82, "setToValue:", objc_msgSend(v58, "shadowPath"));
      v142.origin.CGFloat x = 0.0;
      v142.origin.CGFloat y = 0.0;
      v142.size.CGFloat width = a4 + a4;
      v142.size.CGFloat height = a4 + a4;
      v83 = CGPathCreateWithEllipseInRect(v142, 0);
      v84 = CGPathCreateCopyByStrokingPath(v83, 0, 4.0, kCGLineCapRound, kCGLineJoinRound, 0.0);
      [v82 setFromValue:v84];
      CGPathRelease(v84);
      CGPathRelease(v83);
      [MEMORY[0x1E4F39B38] animation];
      CGRect v86 = v85 = v58;
      v129 = v112;
      v130 = v110;
      v131 = v72;
      v132 = v75;
      v133 = v82;
      CGRect v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:5];
      [v86 setAnimations:v87];

      [v86 setDuration:a5];
      uint64_t v113 = *MEMORY[0x1E4F39FB0];
      objc_msgSend(v86, "setFillMode:");
      v111 = v86;
      [v86 setRemovedOnCompletion:0];

      if (self->_displaysPuckAsAccuracy)
      {
        id v88 = v85;
        [v88 bounds];
        if (20.0 / (a4 + v89 * -0.5) > 0.400000006
          || ([v88 bounds], double v91 = 0.150000006, 20.0 / (a4 + v90 * -0.5) > 0.150000006))
        {
          [v88 bounds];
          double v91 = 0.400000006;
          if (20.0 / (a4 + v92 * -0.5) <= 0.400000006)
          {
            [v88 bounds];
            double v91 = 20.0 / (a4 + v93 * -0.5);
          }
        }
        v94 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
        [v94 setValues:&unk_1ED97F518];
        v129 = &unk_1ED97E910;
        v95 = [NSNumber numberWithDouble:1.0 - v91];
        v130 = v95;
        v131 = &unk_1ED97E928;
        v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:3];
        [v94 setKeyTimes:v96];

        [v94 setDuration:a5];
        [v94 setFillMode:*MEMORY[0x1E4F39FA0]];
        [v94 setRemovedOnCompletion:0];
      }
      else
      {
        v94 = 0;
      }
      [v85 setOpacity:0.0];
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke_4;
      v120[3] = &unk_1E54B9068;
      v120[4] = self;
      id v104 = v85;
      id v121 = v104;
      v105 = v115;
      v122 = v105;
      objc_msgSend(v104, "_mapkit_addAnimation:forKey:completion:", v111, @"show/hide", v120);
      v106 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      [v106 setDuration:a5];
      [v106 setFromValue:&unk_1ED97E910];
      [v106 setToValue:&unk_1ED97E910];
      [v106 setRemovedOnCompletion:1];
      [v106 setFillMode:v113];
      [(CALayer *)self->_puckLayer addAnimation:v106 forKey:@"show/hide"];
      if (v94) {
        [(_MKPuckAccuracyLayer *)self->_accuracyLayer addAnimation:v94 forKey:@"show/hide"];
      }
      v107 = +[MKThreadContext currentContext];
      objc_msgSend(v107, "_CA_setDisableActions:", 1);

      LODWORD(v108) = 1.0;
      [(CALayer *)self->_puckLayer setOpacity:v108];
      v109 = +[MKThreadContext currentContext];
      objc_msgSend(v109, "_CA_setDisableActions:", 0);

      double v18 = v117;
      double v17 = v119;
      goto LABEL_46;
    }
    v97 = +[MKThreadContext currentContext];
    objc_msgSend(v97, "_CA_setDisableActions:", 1);

    v17[2](v17);
    LODWORD(v98) = 1.0;
    [(CALayer *)self->_puckLayer setOpacity:v98];
    pulseLayer = self->_pulseLayer;
    uint64_t v100 = 0;
LABEL_45:
    [(CALayer *)pulseLayer setHidden:v100];
    id v104 = +[MKThreadContext currentContext];
    objc_msgSend(v104, "_CA_setDisableActions:", 0);
LABEL_46:

    [(_MKPuckAnnotationView *)self _updateShowHeadingLayerAnimatedIfPossible:1];
  }
}

- (void)setShouldDisplayHeading:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  self->_shouldDisplayHeading = a3;
  if (!a3) {
    self->_hasValidHeading = 0;
  }
  double v5 = MKGetUserLocationViewLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = @"NO";
    if (v3) {
      double v6 = @"YES";
    }
    int v7 = 138412290;
    double v8 = v6;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "Set should display heading: %@", (uint8_t *)&v7, 0xCu);
  }

  [(_MKPuckAnnotationView *)self _updateShowHeadingLayerAnimatedIfPossible:1];
}

- (void)setHeadingAccuracy:(double)a3
{
  headingAccuracCGFloat y = self->_headingAccuracy;
  double v4 = a3 - headingAccuracy;
  if (a3 - headingAccuracy < 0.0) {
    double v4 = -(a3 - headingAccuracy);
  }
  if (v4 > 1.0 || a3 < 0.0 == headingAccuracy >= 0.0)
  {
    self->_headingAccuracCGFloat y = a3;
    -[MKUserLocationHeadingIndicator updateHeadingAccuracy:previousAccuracy:](self->_headingLayer, "updateHeadingAccuracy:previousAccuracy:");
  }
}

- (void)setHeading:(double)a3
{
  if (self->_hasValidHeading)
  {
    double v3 = a3 - self->_heading;
    if (v3 < 0.0) {
      double v3 = -v3;
    }
    if (v3 > 1.0)
    {
      self->_heading = a3;
      [(_MKPuckAnnotationView *)self _updateHeadingIndicators];
    }
  }
  else
  {
    self->_heading = a3;
    self->_hasValidHeading = 1;
    [(_MKPuckAnnotationView *)self _updateShowHeadingLayerAnimatedIfPossible:1];
  }
}

- (void)setForcesConeIndicator:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_forcesConeIndicator != a3)
  {
    BOOL v3 = a3;
    double v5 = MKGetUserLocationViewLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double v6 = @"NO";
      if (v3) {
        double v6 = @"YES";
      }
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "Set force heading cone indicator: %@", (uint8_t *)&v8, 0xCu);
    }

    int64_t v7 = [(_MKPuckAnnotationView *)self _enforcedHeadingIndicatorStyle];
    self->_forcesConeIndicator = v3;
    if (v7 != [(_MKPuckAnnotationView *)self _enforcedHeadingIndicatorStyle]) {
      [(_MKPuckAnnotationView *)self _updateHeadingLayerForStyleChange:0];
    }
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)_MKPuckAnnotationView;
  [(MKAnnotationView *)&v6 layoutSubviews];
  [(_MKPuckAnnotationView *)self bounds];
  double MidX = CGRectGetMidX(v7);
  [(_MKPuckAnnotationView *)self bounds];
  -[CALayer setPosition:](self->_accuracyContainerLayer, "setPosition:", MidX, CGRectGetMidY(v8));
  [(_MKPuckAnnotationView *)self bounds];
  double v4 = CGRectGetMidX(v9);
  [(_MKPuckAnnotationView *)self bounds];
  -[CALayer setPosition:](self->_puckContainerLayer, "setPosition:", v4, CGRectGetMidY(v10));
  [(_MKPuckAnnotationView *)self bounds];
  double v5 = CGRectGetMidX(v11);
  [(_MKPuckAnnotationView *)self bounds];
  -[CALayer setPosition:](self->_headingContainerLayer, "setPosition:", v5, CGRectGetMidY(v12));
}

- (_MKPuckAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)_MKPuckAnnotationView;
  CGRect v8 = [(MKAnnotationView *)&v44 initWithAnnotation:v6 reuseIdentifier:v7];
  CGRect v9 = v8;
  if (v8)
  {
    [(MKAnnotationView *)v8 setCanShowCallout:1];
    v9->_shouldHidePuckWhenAccuracyVisible = 0;
    v9->_canShowHeadingIndicator = 1;
    v9->_allowsAccuracyRing = 1;
    v9->_effectsEnabled = 1;
    v9->_BOOL shouldShowDynamicLocationAnimations = 1;
    v9->_shouldDisplayInaccurateHeading = 1;
    v9->_puckScale = 1.0;
    v9->super._collisionMode = 2;
    uint64_t v10 = [MEMORY[0x1E4F428B8] whiteColor];
    glyphTintColor = v9->_glyphTintColor;
    v9->_glyphTintColor = (UIColor *)v10;

    [(id)objc_opt_class() _calloutOffset];
    [(MKAnnotationView *)v9 setCalloutOffset:"setCalloutOffset:"];
    objc_initWeak(&location, v9);
    id v12 = MEMORY[0x1E4F14428];
    v41[1] = (id)MEMORY[0x1E4F143A8];
    v41[2] = (id)3221225472;
    v41[3] = __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke;
    v41[4] = &unk_1E54BC6F8;
    objc_copyWeak(&v42, &location);
    uint64_t v13 = _GEOConfigAddBlockListenerForKey();
    id newPuckConfigListener = v9->_newPuckConfigListener;
    v9->_id newPuckConfigListener = (id)v13;

    [(_MKPuckAnnotationView *)v9 _updateLegacyConfiguration];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_2;
    v40[3] = &unk_1E54B8CB0;
    objc_copyWeak(v41, &location);
    BOOL v15 = (void *)MEMORY[0x18C139AE0](v40);
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    long double v37 = __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_3;
    double v38 = &unk_1E54BC720;
    id v16 = v15;
    id v39 = v16;
    uint64_t v17 = _GEOConfigAddBlockListenerForKey();
    id faux3DPuckConfigListener = v9->_faux3DPuckConfigListener;
    v9->_id faux3DPuckConfigListener = (id)v17;

    v33[1] = (id)MEMORY[0x1E4F143A8];
    v33[2] = (id)3221225472;
    v33[3] = __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_4;
    v33[4] = &unk_1E54BC748;
    id v19 = v16;
    id v34 = v19;
    uint64_t v20 = MapsFeature_AddBlockListener();
    id shelbyvilleConfigListener = v9->_shelbyvilleConfigListener;
    v9->_id shelbyvilleConfigListener = (id)v20;

    int v22 = _MKLinkedOnOrAfterReleaseSet(3081);
    if (v22) {
      LOBYTE(v22) = GEOConfigGetBOOL();
    }
    v9->_faux3DEnabled = v22;
    v32[1] = (id)MEMORY[0x1E4F143A8];
    v32[2] = (id)3221225472;
    v32[3] = __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_5;
    v32[4] = &unk_1E54BC6F8;
    objc_copyWeak(v33, &location);
    uint64_t v23 = _GEOConfigAddBlockListenerForKey();
    id minAccuracyConfigListener = v9->_minAccuracyConfigListener;
    v9->_id minAccuracyConfigListener = (id)v23;

    GEOConfigGetDouble();
    v9->_double minimumAccuracyRadius = v25;
    objc_copyWeak(v32, &location);
    uint64_t v26 = _GEOConfigAddBlockListenerForKey();
    id minUncertaintyConfigListener = v9->_minUncertaintyConfigListener;
    v9->_id minUncertaintyConfigListener = (id)v26;

    GEOConfigGetDouble();
    v9->_minimumAccuracyUncertaintCGFloat y = v28;
    [(_MKPuckAnnotationView *)v9 _setupLayers];
    [(_MKPuckAnnotationView *)v9 setShouldInnerPulse:1];
    uint64_t v29 = [MEMORY[0x1E4F42F80] systemTraitsAffectingColorAppearance];
    id v30 = (id)[(_MKPuckAnnotationView *)v9 registerForTraitChanges:v29 withAction:sel_traitEnvironment_didChangeTraitCollection_];

    [(MKAnnotationView *)v9 setZPriority:0.0];
    objc_destroyWeak(v32);
    objc_destroyWeak(v33);

    objc_destroyWeak(v41);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)setShouldInnerPulse:(BOOL)a3
{
  if (self->_shouldInnerPulse != a3)
  {
    self->_shouldInnerPulse = a3;
    [(_MKPuckAnnotationView *)self _updatePulseAnimation];
    [(_MKPuckAnnotationView *)self _resetInnerPulseFrame];
  }
}

- (void)_updateLegacyConfiguration
{
  self->_allowsPulse = _MKModernPuckDesignEnabled() ^ 1;
  -[_MKPuckAnnotationView setHeadingIndicatorStyle:](self, "setHeadingIndicatorStyle:");
  accuracyLayer = self->_accuracyLayer;

  [(_MKPuckAccuracyLayer *)accuracyLayer updateLegacyConfiguration];
}

- (void)setHeadingIndicatorStyle:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_headingIndicatorStyle != a3)
  {
    double v5 = MKGetUserLocationViewLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 134217984;
      int64_t v8 = a3;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "Set heading indicator style: %ld", (uint8_t *)&v7, 0xCu);
    }

    int64_t v6 = [(_MKPuckAnnotationView *)self _enforcedHeadingIndicatorStyle];
    self->_headingIndicatorStyle = a3;
    if (v6 != [(_MKPuckAnnotationView *)self _enforcedHeadingIndicatorStyle]) {
      [(_MKPuckAnnotationView *)self _updateHeadingLayerForStyleChange:a3 == 2];
    }
  }
}

- (void)_setShouldHidePuckWhenAccuracyVisible:(BOOL)a3
{
  if (self->_shouldHidePuckWhenAccuracyVisible != a3)
  {
    self->_shouldHidePuckWhenAccuracyVisible = a3;
    [(_MKPuckAnnotationView *)self _locationAccuracyInScreenPoints];
    double v5 = v4;
    [(_MKPuckAccuracyLayer *)self->_accuracyLayer currentAccuracy];
    [(_MKPuckAnnotationView *)self _updatePuckVisibilityForRadius:v5 previousRadius:v6 duration:0.25];
  }
}

- (void)_setForceHeadingUp:(BOOL)a3
{
  if (self->_forceHeadingUp != a3)
  {
    self->_forceHeadingUp = a3;
    [(_MKPuckAnnotationView *)self _updateHeadingIndicators];
  }
}

- (void)_updateAccuracyOpacityForRadius:(double)a3 duration:(double)a4
{
  double minimumAccuracyRadius = self->_minimumAccuracyRadius;
  double maxRadiusToShowAccuracyRing = self->_maxRadiusToShowAccuracyRing;
  uint64_t v9 = [(CALayer *)self->_accuracyContainerLayer currentLayer];
  [v9 opacity];
  double v11 = v10;

  double v12 = 1.0;
  float v13 = 1.0;
  if (maxRadiusToShowAccuracyRing >= minimumAccuracyRadius && maxRadiusToShowAccuracyRing >= 0.1)
  {
    double v14 = fmax((a3 - minimumAccuracyRadius) / (maxRadiusToShowAccuracyRing - minimumAccuracyRadius), 0.0);
    if (v14 >= 1.0) {
      double v15 = 0.0;
    }
    else {
      double v15 = 1.0 - v14;
    }
    float v13 = v15;
    double v16 = fmax((a3 - self->_accuracyRingStrokeOpacityThreshold)/ (maxRadiusToShowAccuracyRing - self->_accuracyRingStrokeOpacityThreshold), 0.0);
    if (v16 >= 1.0) {
      double v17 = 0.0;
    }
    else {
      double v17 = 1.0 - v16;
    }
    float v18 = v17;
    double v12 = v18;
  }
  if (vabdd_f64(v13, v11) >= 0.01)
  {
    [(_MKPuckAccuracyLayer *)self->_accuracyLayer setFillOpacity:v13 duration:a4];
    [(_MKPuckAccuracyLayer *)self->_accuracyLayer setStrokeOpacity:v12 duration:a4];
    [(CALayer *)self->_headingContainerLayer removeAnimationForKey:@"accuracyOpacity"];
    if (a4 > 0.0)
    {
      double v21 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      int v22 = [NSNumber numberWithDouble:v11];
      [v21 setFromValue:v22];

      *(float *)&double v23 = v13;
      double v24 = [NSNumber numberWithFloat:v23];
      [v21 setToValue:v24];

      [v21 setDuration:a4];
      [v21 setRemovedOnCompletion:1];
      [(CALayer *)self->_headingContainerLayer addAnimation:v21 forKey:@"accuracyOpacity"];
    }
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    *(float *)&double v25 = v13;
    [(CALayer *)self->_headingContainerLayer setOpacity:v25];
    uint64_t v26 = (void *)MEMORY[0x1E4F39CF8];
    [v26 commit];
  }
  else
  {
    [(CALayer *)self->_headingContainerLayer opacity];
    double v20 = vabds_f32(v13, v19);
    if (v20 >= 0.01)
    {
      headingContainerLayer = self->_headingContainerLayer;
      *(float *)&double v20 = v13;
      [(CALayer *)headingContainerLayer setOpacity:v20];
    }
  }
}

- (void)setMaxRadiusToShowAccuracyRing:(double)a3
{
  self->_double maxRadiusToShowAccuracyRing = a3;
  [(_MKPuckAnnotationView *)self _locationAccuracyInScreenPoints];

  -[_MKPuckAnnotationView _updateAccuracyOpacityForRadius:duration:](self, "_updateAccuracyOpacityForRadius:duration:");
}

- (void)_setAccuracyRingStrokeOpacityThreshold:(double)a3
{
  if (vabdd_f64(self->_accuracyRingStrokeOpacityThreshold, a3) >= 0.00000011920929)
  {
    self->_accuracyRingStrokeOpacityThreshold = a3;
    [(_MKPuckAnnotationView *)self _locationAccuracyInScreenPoints];
    -[_MKPuckAnnotationView _updateAccuracyOpacityForRadius:duration:](self, "_updateAccuracyOpacityForRadius:duration:");
  }
}

+ (CGPoint)_calloutOffset
{
  [a1 shadowBlur];
  double v3 = v2;
  double v4 = 0.0;
  result.CGFloat y = v3;
  result.CGFloat x = v4;
  return result;
}

- (void)setAllowsAccuracyRing:(BOOL)a3
{
  if (self->_allowsAccuracyRing != a3)
  {
    self->_allowsAccuracyRing = a3;
    if (self->_shouldHidePuckWhenAccuracyVisible && a3)
    {
      [(_MKPuckAnnotationView *)self _locationAccuracyInScreenPoints];
      double v5 = v4;
    }
    else
    {
      [(id)objc_opt_class() baseDiameter];
      double v5 = v6 * 0.5;
    }
    [(_MKPuckAccuracyLayer *)self->_accuracyLayer setHidden:!self->_allowsAccuracyRing];
    [(_MKPuckAccuracyLayer *)self->_accuracyLayer currentAccuracy];
    [(_MKPuckAnnotationView *)self _updatePuckVisibilityForRadius:v5 previousRadius:v7 duration:0.25];
    [(_MKPuckAnnotationView *)self _updateAccuracyOpacityForRadius:v5 duration:0.0];
  }
}

- (void)_setMapPitchRadians:(double)a3
{
  v19.receiver = self;
  v19.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView _setMapPitchRadians:](&v19, sel__setMapPitchRadians_);
  double v5 = +[MKThreadContext currentContext];
  objc_msgSend(v5, "_CA_setDisableActions:", 1);

  CATransform3DMakeRotation(&v18, a3, 1.0, 0.0, 0.0);
  accuracyContainerLayer = self->_accuracyContainerLayer;
  CATransform3D v17 = v18;
  [(CALayer *)accuracyContainerLayer setTransform:&v17];
  CATransform3DMakeRotation(&v16, a3, 1.0, 0.0, 0.0);
  headingContainerLayer = self->_headingContainerLayer;
  CATransform3D v15 = v16;
  [(CALayer *)headingContainerLayer setTransform:&v15];
  if (self->_shouldHidePuckWhenAccuracyVisible || self->_faux3DEnabled)
  {
    CATransform3DMakeRotation(&v14, a3, 1.0, 0.0, 0.0);
    puckLayer = self->_puckLayer;
    CATransform3D v13 = v14;
    [(CALayer *)puckLayer setTransform:&v13];
    CATransform3DMakeRotation(&v12, a3, 1.0, 0.0, 0.0);
    puckTransitionContainer = self->_puckTransitionContainer;
    CATransform3D v11 = v12;
    [(CALayer *)puckTransitionContainer setTransform:&v11];
  }
  [(_MKPuckAccuracyLayer *)self->_accuracyLayer setMapPitchRadians:a3];
  [(_MKPuckAnnotationView *)self _updateFaux3DLayers];
  float v10 = +[MKThreadContext currentContext];
  objc_msgSend(v10, "_CA_setDisableActions:", 0);
}

- (void)_updateFaux3DLayers
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  BOOL faux3DEnabled = self->_faux3DEnabled;
  faux3DFaceLayer = self->_faux3DFaceLayer;
  if (faux3DEnabled)
  {
    if ([(CAGradientLayer *)faux3DFaceLayer isHidden]) {
      [(CAGradientLayer *)self->_faux3DFaceLayer setHidden:0];
    }
    [(CAGradientLayer *)self->_faux3DBaseBottomLayer setHidden:self->_displaysPuckAsAccuracy];
    [(MKAnnotationView *)self _mapPitchRadians];
    double v6 = v5;
    double mapCameraDistance = self->_mapCameraDistance;
    double v8 = 1.0 - cos(v5);
    double v9 = 23000.0;
    if (mapCameraDistance <= 23000.0) {
      double v9 = mapCameraDistance;
    }
    if (v9 <= 1440.0) {
      double v10 = 1.0;
    }
    else {
      double v10 = (v9 + -1440.0) / -21560.0 + 1.0;
    }
    double v11 = v10 * 12.0 + (1.0 - v10) * 0.0;
    CATransform3DMakeTranslation(&v73, 0.0, -(v8 * v11), 0.0);
    baseLayer = self->_baseLayer;
    CATransform3D v72 = v73;
    [(CALayer *)baseLayer setTransform:&v72];
    CATransform3D v13 = self->_baseLayer;
    if (v13)
    {
      [(CALayer *)v13 transform];
    }
    else
    {
      long long v71 = 0u;
      long long v70 = 0u;
      long long v69 = 0u;
      long long v68 = 0u;
      long long v67 = 0u;
      long long v66 = 0u;
      long long v65 = 0u;
      long long v64 = 0u;
    }
    puckTransitionLayer = self->_puckTransitionLayer;
    double v17 = v8 * v11;
    v63[5] = v69;
    v63[6] = v70;
    v63[7] = v71;
    v63[0] = v64;
    v63[1] = v65;
    v63[2] = v66;
    v63[3] = v67;
    v63[4] = v68;
    [(CALayer *)puckTransitionLayer setTransform:v63];
    CATransform3DMakeTranslation(&v62, 0.0, v8 + v8, 0.0);
    shadowLayer = self->_shadowLayer;
    CATransform3D v61 = v62;
    [(CALayer *)shadowLayer setTransform:&v61];
    double v19 = 0.300000012;
    if (!self->_useDarkAppearance) {
      double v19 = 0.25;
    }
    double v20 = v8 * 0.5 + (1.0 - v8) * v19;
    *(float *)&double v20 = v20;
    [(CALayer *)self->_shadowLayer setOpacity:v20];
    if (self->_displaysPuckAsAccuracy)
    {
      [(CALayer *)self->_baseLayer frame];
      double v22 = v21;
      double v24 = v23;
    }
    else
    {
      [(CAGradientLayer *)self->_faux3DFaceLayer bounds];
      double v22 = v25 * -0.5;
      double v24 = -1.0 - v17;
      [(CAGradientLayer *)self->_faux3DFaceLayer bounds];
    }
    -[CAGradientLayer setFrame:](self->_faux3DFaceLayer, "setFrame:", v22, v24);
    if (fabs(v6) >= 0.000001)
    {
      if (self->_displaysPuckAsAccuracy)
      {
        uint64_t v26 = [(NSArray *)self->_faux3DHighlightMaskRings objectAtIndexedSubscript:0];
        [v26 borderWidth];
        double v28 = v27;

        [(CAGradientLayer *)self->_faux3DFaceLayer bounds];
        double v30 = v29;
        CGFloat v31 = [(NSArray *)self->_faux3DHighlightMaskRings firstObject];
        [v31 bounds];
        double v33 = v32;

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v34 = self->_faux3DHighlightMaskRings;
        uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v57 objects:v82 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          char v37 = 0;
          double v38 = v30 - v33;
          double v39 = v38 - v17 + v28 * -0.5;
          uint64_t v40 = *(void *)v58;
          do
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v58 != v40) {
                objc_enumerationMutation(v34);
              }
              id v42 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              double v39 = v28 + v39;
              if (v39 >= v38)
              {
                if (v37)
                {
                  char v37 = 1;
                  [*(id *)(*((void *)&v57 + 1) + 8 * i) setHidden:1];
                }
                else
                {
                  [*(id *)(*((void *)&v57 + 1) + 8 * i) setHidden:0];
                  CATransform3DMakeTranslation(&v56, 0.0, v38, 0.0);
                  CATransform3D v55 = v56;
                  [v42 setTransform:&v55];
                  char v37 = 1;
                }
              }
              else
              {
                [*(id *)(*((void *)&v57 + 1) + 8 * i) setHidden:0];
                CATransform3DMakeTranslation(&v54, 0.0, v39, 0.0);
                CATransform3D v53 = v54;
                [v42 setTransform:&v53];
              }
            }
            uint64_t v36 = [(NSArray *)v34 countByEnumeratingWithState:&v57 objects:v82 count:16];
          }
          while (v36);
        }
      }
      else
      {
        [(CAGradientLayer *)self->_faux3DFaceLayer setHidden:0];
        [(CAGradientLayer *)self->_faux3DBaseBottomLayer setHidden:0];
        [(CAGradientLayer *)self->_faux3DFaceLayer bounds];
        double v44 = v43 * -0.5;
        [(CAGradientLayer *)self->_faux3DFaceLayer bounds];
        -[CAGradientLayer setFrame:](self->_faux3DFaceLayer, "setFrame:", v44, -1.0 - v17);
      }
    }
    else
    {
      [(CAGradientLayer *)self->_faux3DFaceLayer setHidden:1];
      [(CAGradientLayer *)self->_faux3DBaseBottomLayer setHidden:1];
    }
  }
  else
  {
    [(CAGradientLayer *)faux3DFaceLayer setHidden:1];
    [(CAGradientLayer *)self->_faux3DBaseBottomLayer setHidden:1];
    CATransform3D v14 = self->_baseLayer;
    long long v52 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v78 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v51 = v78;
    long long v79 = v52;
    long long v50 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v80 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v49 = v80;
    long long v81 = v50;
    long long v48 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v75[0] = *MEMORY[0x1E4F39B10];
    long long v47 = v75[0];
    v75[1] = v48;
    long long v46 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v76 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v45 = v76;
    long long v77 = v46;
    [(CALayer *)v14 setTransform:v75];
    CATransform3D v15 = self->_shadowLayer;
    v74[4] = v51;
    v74[5] = v52;
    v74[6] = v49;
    v74[7] = v50;
    v74[0] = v47;
    v74[1] = v48;
    v74[2] = v45;
    void v74[3] = v46;
    [(CALayer *)v15 setTransform:v74];
  }
}

- (BOOL)_hideLargeAccuracyRing
{
  return self->_maxRadiusToShowAccuracyRing > 0.0;
}

- (void)dealloc
{
  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  MapsFeatureFlag_RemoveBlockListener();
  v3.receiver = self;
  v3.super_class = (Class)_MKPuckAnnotationView;
  [(MKAnnotationView *)&v3 dealloc];
}

- (void)setAlpha:(double)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long double v5 = MKGetUserLocationViewLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v8 = a3;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "MKPuckAnnotationView setting alpha: %f", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)_MKPuckAnnotationView;
  [(MKAnnotationView *)&v6 setAlpha:a3];
}

- (BOOL)_isSelectable
{
  if (self->_shouldHidePuckWhenAccuracyVisible)
  {
    [(CALayer *)self->_puckLayer opacity];
    if (fabsf(v3) < 0.01)
    {
      [(_MKPuckAccuracyLayer *)self->_accuracyLayer presentationFillOpacity];
      if (v4 < 0.100000001) {
        return 0;
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)_MKPuckAnnotationView;
  return [(MKAnnotationView *)&v6 _isSelectable];
}

- (float)_selectionPriority
{
  v8.receiver = self;
  v8.super_class = (Class)_MKPuckAnnotationView;
  [(MKAnnotationView *)&v8 _selectionPriority];
  float v4 = v3;
  if (v3 != 1000.0) {
    return v4;
  }
  if (!self->_shouldHidePuckWhenAccuracyVisible) {
    return v4;
  }
  [(CALayer *)self->_puckLayer opacity];
  double v6 = fabsf(v5);
  float result = 0.0;
  if (v6 >= 0.000001) {
    return v4;
  }
  return result;
}

- (CGRect)_significantBounds
{
  if (self->_shouldHidePuckWhenAccuracyVisible
    && ([(CALayer *)self->_puckLayer opacity], fabsf(v3) < 0.000001))
  {
    accuracyLayer = self->_accuracyLayer;
    [(_MKPuckAccuracyLayer *)accuracyLayer significantBounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    CATransform3D v13 = [(_MKPuckAnnotationView *)self layer];
    -[_MKPuckAccuracyLayer convertRect:toLayer:](accuracyLayer, "convertRect:toLayer:", v13, v6, v8, v10, v12);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)_MKPuckAnnotationView;
    [(MKAnnotationView *)&v30 _significantBounds];
    double v15 = v22;
    double v17 = v23;
    double v19 = v24;
    double v21 = v25;
  }
  double v26 = v15;
  double v27 = v17;
  double v28 = v19;
  double v29 = v21;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (UIEdgeInsets)_annotationTrackingInsets
{
  if (_MKModernPuckDesignEnabled())
  {
    float v3 = [(MKAnnotationView *)self _annotationContainer];
    float v4 = [(MKAnnotationView *)self _annotationContainer];
    [v3 _visibleCenteringRectInView:v4];
    double v6 = v5;
    double v8 = v7;

    BOOL v9 = [(_MKPuckAnnotationView *)self shouldDisplayHeading];
    double v10 = 0.100000001;
    if (v9) {
      double v10 = 0.200000003;
    }
    if (v6 >= v8) {
      double v11 = v8;
    }
    else {
      double v11 = v6;
    }
    double v12 = fmin(v11 * v10, 64.0);
    double v13 = v12;
    double v14 = v12;
    double v15 = v12;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F437F8];
    double v13 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)setCollisionMode:(int64_t)a3
{
  self->_hasExplicitCollisionMode = 1;
  v3.receiver = self;
  v3.super_class = (Class)_MKPuckAnnotationView;
  [(MKAnnotationView *)&v3 setCollisionMode:a3];
}

- (void)setDisplayPriority:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView setDisplayPriority:](&v5, sel_setDisplayPriority_);
  if (!_MKLinkedOnOrAfterReleaseSet(2824) && !self->_hasExplicitCollisionMode)
  {
    int64_t v4 = 2;
    if (self->super._displayPriority < 1000.0) {
      int64_t v4 = 1;
    }
    self->super._collisionMode = v4;
  }
}

- (id)_createFakePuckLayer
{
  objc_super v3 = [MEMORY[0x1E4F39BE8] layer];
  int64_t v4 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  objc_super v5 = [(_MKPuckAnnotationView *)self traitCollection];
  [MEMORY[0x1E4F42F80] setCurrentTraitCollection:v5];

  [(id)objc_opt_class() baseDiameter];
  double v7 = v6;
  [(id)objc_opt_class() innerDiameter];
  double puckScale = self->_puckScale;
  double v10 = v7 * puckScale;
  double v11 = (v7 - v8) * 0.5 * puckScale;
  [(MKAnnotationView *)self _mapPitchRadians];
  long double v13 = v12;
  [v3 setName:@"accuracyTransition"];
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, v10, v10);
  [v3 bounds];
  [v3 setCornerRadius:CGRectGetWidth(v26) * 0.5];
  [v3 setBorderWidth:v11];
  float v14 = 0.0;
  [v3 setOpacity:0.0];
  _MKPuckAnnotationViewBaseColor([(MKAnnotationView *)self _mapType], self->_displaysPuckAsAccuracy);
  id v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v15, "CGColor"));

  id v16 = [(_MKPuckAnnotationView *)self _currentInnerColor];
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v16, "CGColor"));

  [v3 setMasksToBounds:0];
  objc_msgSend(v3, "setShadowOffset:", 0.0, 1.0);
  [(id)objc_opt_class() shadowBlur];
  [v3 setShadowRadius:v17 * 0.5];
  objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"PuckShadowColor");
  id v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShadowColor:", objc_msgSend(v18, "CGColor"));

  double v19 = fabs(v13);
  if (v19 < 0.000001)
  {
    if (self->_useDarkAppearance) {
      double v20 = 0.300000012;
    }
    else {
      double v20 = 0.25;
    }
    long double v21 = 1.0 - cos(v13);
    double v19 = v21 * 0.5 + (1.0 - v21) * v20;
    float v14 = v19;
  }
  *(float *)&double v19 = v14;
  [v3 setShadowOpacity:v19];
  objc_msgSend(v3, "_mapkit_setActionsToRemoveDefaultImplicitActions");
  [v3 bounds];
  double v22 = CGPathCreateWithEllipseInRect(v27, 0);
  CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v22, 0, 4.0, kCGLineCapRound, kCGLineJoinRound, 0.0);
  [v3 setShadowPath:CopyByStrokingPath];
  CGPathRelease(CopyByStrokingPath);
  CGPathRelease(v22);
  [MEMORY[0x1E4F42F80] setCurrentTraitCollection:v4];

  return v3;
}

- (void)setRotateInnerImageToMatchCourse:(BOOL)a3
{
  if (self->_rotateInnerImageToMatchCourse != a3)
  {
    self->_rotateInnerImageToMatchCourse = a3;
    [(_MKPuckAnnotationView *)self _updateInnerCourseRotation];
  }
}

- (void)_setDisplaysPuckAsAccuracy:(BOOL)a3
{
  if (self->_displaysPuckAsAccuracy != a3)
  {
    self->_displaysPuckAsAccuracCGFloat y = a3;
    [(_MKPuckAnnotationView *)self _updateBaseImage];
    [(_MKPuckAnnotationView *)self _updateInnerImage];
    [(_MKPuckAnnotationView *)self _createOrRemoveFaux3DRingsIfNecessary];
    [(_MKPuckAnnotationView *)self _updateFaux3DColors];
    [(_MKPuckAnnotationView *)self _updateFaux3DLayers];
  }
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  objc_super v5 = [(_MKPuckAnnotationView *)self traitCollection];
  self->_useDarkAppearance = [v5 userInterfaceStyle] == 2;

  [(_MKPuckAnnotationView *)self _updateAccuracyColors];
  [(_MKPuckAnnotationView *)self _updateFaux3DColors];
  [(_MKPuckAnnotationView *)self _updateBaseImage];
  [(_MKPuckAnnotationView *)self _updateGlyphImage];
  double v6 = [(_MKPuckAnnotationView *)self traitCollection];
  [(MKUserLocationHeadingIndicator *)self->_headingLayer setTraitCollection:v6];

  double v7 = [(_MKPuckAnnotationView *)self traitCollection];
  [(_MKPuckAccuracyLayer *)self->_accuracyLayer setTraitCollection:v7];

  [(_MKPuckAnnotationView *)self _accessibilitySetInterfaceStyleIntent:1];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_MKPuckAnnotationView;
  [(MKAnnotationView *)&v6 setSelected:a3 animated:a4];
  [(_MKPuckAnnotationView *)self _setHeadingLayerHidden:v4];
}

- (CGRect)_mapkit_visibleRect
{
  [(_MKPuckAnnotationView *)self bounds];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  if (([(_MKPuckAccuracyLayer *)self->_accuracyLayer isHidden] & 1) == 0)
  {
    [(_MKPuckAccuracyLayer *)self->_accuracyLayer frame];
    v30.origin.CGFloat x = v11;
    v30.origin.CGFloat y = v12;
    v30.size.CGFloat width = v13;
    v30.size.CGFloat height = v14;
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    CGRect v26 = CGRectUnion(v25, v30);
    CGFloat x = v26.origin.x;
    CGFloat y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat height = v26.size.height;
  }
  id v15 = [(MKAnnotationView *)self _calloutView];

  if (v15)
  {
    id v16 = [(MKAnnotationView *)self _calloutView];
    [v16 frame];
    v31.origin.CGFloat x = v17;
    v31.origin.CGFloat y = v18;
    v31.size.CGFloat width = v19;
    v31.size.CGFloat height = v20;
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    CGRect v28 = CGRectUnion(v27, v31);
    CGFloat x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
  }
  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (float)opacity
{
  double v2 = [(_MKPuckAnnotationView *)self layer];
  [v2 opacity];
  float v4 = v3;

  return v4;
}

- (void)setOpacity:(float)a3
{
  id v5 = [(_MKPuckAnnotationView *)self layer];
  *(float *)&double v4 = a3;
  [v5 setOpacity:v4];
}

- (double)puckAlpha
{
  [(CALayer *)self->_puckLayer opacity];
  return v2;
}

- (void)setPuckAlpha:(double)a3
{
  *(float *)&a3 = a3;
  [(CALayer *)self->_puckLayer setOpacity:a3];
}

- (void)setPuckScale:(double)a3
{
  if (vabdd_f64(a3, self->_puckScale) >= 0.00000011920929)
  {
    self->_double puckScale = a3;
    double v4 = fabs(a3 + -1.0);
    memset(&v38, 0, sizeof(v38));
    if (v4 >= 0.00000011920929)
    {
      CATransform3DMakeScale(&v38, a3, a3, 1.0);
    }
    else
    {
      long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      *(_OWORD *)&v38.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      *(_OWORD *)&v38.m33 = v5;
      long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      *(_OWORD *)&v38.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      *(_OWORD *)&v38.m43 = v6;
      long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)&v38.m11 = *MEMORY[0x1E4F39B10];
      *(_OWORD *)&v38.m13 = v7;
      long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      *(_OWORD *)&v38.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      *(_OWORD *)&v38.m23 = v8;
    }
    double v9 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
    double v10 = (void *)MEMORY[0x1E4F29238];
    CGFloat v11 = [(CALayer *)self->_puckContainerLayer currentLayer];
    CGFloat v12 = v11;
    if (v11) {
      [v11 transform];
    }
    else {
      memset(v37, 0, sizeof(v37));
    }
    CGFloat v13 = objc_msgSend(v10, "valueWithCATransform3D:", v37, 0.00000011920929);
    [v9 setFromValue:v13];

    CATransform3D v36 = v38;
    CGFloat v14 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v36];
    [v9 setToValue:v14];

    [v9 setDuration:0.2];
    [v9 setFillMode:*MEMORY[0x1E4F39FA8]];
    [v9 setRemovedOnCompletion:v4 < 0.00000011920929];
    [(CALayer *)self->_puckContainerLayer removeAnimationForKey:@"scale"];
    [(CALayer *)self->_puckContainerLayer addAnimation:v9 forKey:@"scale"];
    if (self->_faux3DEnabled)
    {
      id v15 = v9;
    }
    else
    {
      id v15 = (void *)[v9 copy];

      id v16 = (void *)MEMORY[0x1E4F29238];
      CGFloat v17 = [(CALayer *)self->_puckLayer currentLayer];
      CGFloat v18 = v17;
      if (v17) {
        [v17 transform];
      }
      else {
        memset(v35, 0, sizeof(v35));
      }
      CGFloat v19 = [v16 valueWithCATransform3D:v35];
      [v15 setFromValue:v19];

      CGFloat v20 = (void *)MEMORY[0x1E4F29238];
      if (v4 >= 0.00000011920929)
      {
        long long v22 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
        long long v31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
        long long v32 = v22;
        long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
        long long v33 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
        long long v34 = v23;
        long long v24 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
        long long v27 = *MEMORY[0x1E4F39B10];
        long long v28 = v24;
        long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
        long long v29 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
        long long v30 = v25;
      }
      else
      {
        puckLayer = self->_puckLayer;
        if (puckLayer)
        {
          [(CALayer *)puckLayer transform];
        }
        else
        {
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
        }
      }
      CGRect v26 = [v20 valueWithCATransform3D:&v27];
      [v15 setToValue:v26];

      [(CALayer *)self->_puckLayer removeAnimationForKey:@"scale"];
      [(CALayer *)self->_puckLayer addAnimation:v15 forKey:@"scale"];
    }
  }
}

+ (double)outerRingWidth
{
  return 0.0;
}

- (id)_baseLayer
{
  return self->_baseLayer;
}

- (void)setShouldShowOuterRing:(BOOL)a3
{
  if (self->_shouldShowOuterRing != a3)
  {
    self->_shouldShowOuterRing = a3;
    [(_MKPuckAnnotationView *)self _updateShadowImage];
    [(_MKPuckAnnotationView *)self _updateBaseImage];
  }
}

- (void)setInnerImageMask:(id)a3
{
  long long v5 = (UIImage *)a3;
  if (self->_innerImageMask != v5)
  {
    long long v6 = v5;
    objc_storeStrong((id *)&self->_innerImageMask, a3);
    [(_MKPuckAnnotationView *)self _updateInnerMaskLayer];
    long long v5 = v6;
  }
}

- (void)setGlyphImage:(id)a3
{
  long long v5 = (UIImage *)a3;
  if (self->_glyphImage != v5)
  {
    long long v6 = v5;
    objc_storeStrong((id *)&self->_glyphImage, a3);
    [(_MKPuckAnnotationView *)self _updateGlyphImage];
    long long v5 = v6;
  }
}

- (void)setGlyphTintColor:(id)a3
{
  if (self->_glyphTintColor != a3)
  {
    double v4 = (UIColor *)[a3 copy];
    glyphTintColor = self->_glyphTintColor;
    self->_glyphTintColor = v4;

    [(_MKPuckAnnotationView *)self _updateGlyphImage];
  }
}

- (void)locationManagerFailedToUpdateLocation
{
  [(_MKPuckAnnotationView *)self setStale:[(_MKPuckAnnotationView *)self _isLocationStale:0]];
  [(_MKPuckAnnotationView *)self _updateShowHeadingLayer];
  [(_MKPuckAnnotationView *)self _updateLayers];
  self->_shouldPulse = [(_MKPuckAnnotationView *)self _shouldPulseForLocation:self->_lastLocation];

  [(_MKPuckAnnotationView *)self _updatePulse];
}

- (void)_setMinimumAccuracyRadius:(double)a3
{
  self->_double minimumAccuracyRadius = a3;
  [(_MKPuckAnnotationView *)self _updateFromMap];
}

- (double)_minimumAccuracyUncertainty
{
  return self->_minimumAccuracyUncertainty;
}

- (void)_setMinimumAccuracyUncertainty:(double)a3
{
  self->_minimumAccuracyUncertaintCGFloat y = a3;
  [(_MKPuckAnnotationView *)self _updateFromMap];
}

- (BOOL)_shouldShowAccuracyRing
{
  if (![(_MKPuckAnnotationView *)self _hideLargeAccuracyRing]) {
    return 1;
  }
  [(_MKPuckAnnotationView *)self _locationAccuracyInScreenPoints];
  return v3 < self->_maxRadiusToShowAccuracyRing;
}

- (void)setAccuracyRingAlpha:(double)a3
{
  self->_accuracyRingAlpha = a3;
  [(_MKPuckAnnotationView *)self _locationAccuracyInScreenPoints];

  -[_MKPuckAnnotationView _updateAccuracyOpacityForRadius:duration:](self, "_updateAccuracyOpacityForRadius:duration:");
}

- (void)_resetLayerToMatchAccuracyRing
{
  v19[2] = *MEMORY[0x1E4F143B8];
  pulseLayer = self->_pulseLayer;
  if (pulseLayer)
  {
    [(CALayer *)pulseLayer bounds];
    v21.origin.CGFloat x = v4;
    v21.origin.CGFloat y = v5;
    v21.size.CGFloat width = v6;
    v21.size.CGFloat height = v7;
    v20.size.CGFloat width = 120.0;
    v20.origin.CGFloat x = 0.0;
    v20.origin.CGFloat y = 0.0;
    v20.size.CGFloat height = 120.0;
    if (!CGRectEqualToRect(v20, v21))
    {
      long long v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
      double v9 = (void *)MEMORY[0x1E4F29238];
      double v10 = [(CALayer *)self->_pulseLayer currentLayer];
      [v10 bounds];
      CGFloat v11 = objc_msgSend(v9, "valueWithCGRect:");
      [v8 setFromValue:v11];

      CGFloat v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, 120.0, 120.0);
      [v8 setToValue:v12];

      CGFloat v13 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"cornerRadius"];
      CGFloat v14 = NSNumber;
      id v15 = [(CALayer *)self->_pulseLayer currentLayer];
      [v15 cornerRadius];
      id v16 = objc_msgSend(v14, "numberWithDouble:");
      [v13 setFromValue:v16];

      [v13 setToValue:&unk_1ED97E010];
      CGFloat v17 = [MEMORY[0x1E4F39B38] animation];
      v19[0] = v8;
      v19[1] = v13;
      CGFloat v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      [v17 setAnimations:v18];

      [v17 setRemovedOnCompletion:1];
      [(CALayer *)self->_pulseLayer removeAnimationForKey:@"accuracy"];
      [(CALayer *)self->_pulseLayer addAnimation:v17 forKey:@"reset"];
      -[CALayer setBounds:](self->_pulseLayer, "setBounds:", 0.0, 0.0, 120.0, 120.0);
      [(CALayer *)self->_pulseLayer setCornerRadius:60.0];
    }
  }
}

- (void)setAnimatingPresentationAccuracy:(BOOL)a3
{
  [(_MKPuckAccuracyLayer *)self->_accuracyLayer currentAccuracy];
  self->_double presentationAccuracy = v5;
  self->_BOOL animatingPresentationAccuracy = a3;
}

- (double)presentationAccuracy
{
  if (self->_animatingPresentationAccuracy) {
    return self->_presentationAccuracy;
  }
  [(_MKPuckAccuracyLayer *)self->_accuracyLayer currentAccuracy];
  return result;
}

- (void)setPresentationAccuracy:(double)a3
{
  self->_double presentationAccuracy = a3;
  id v4 = [(_MKPuckAnnotationView *)self window];
  [(_MKPuckAnnotationView *)self _updateToReflectLocationAccuracyWithDuration:v4 != 0 allowShowHideAnimation:0.0];
}

- (BOOL)_balloonCalloutShouldShowArrow
{
  if (!self->_shouldHidePuckWhenAccuracyVisible) {
    return 1;
  }
  [(_MKPuckAnnotationView *)self _locationAccuracyInScreenPoints];
  return v2 <= 50.0;
}

- (CGPoint)calloutOffset
{
  if (self->_shouldHidePuckWhenAccuracyVisible)
  {
    [(CALayer *)self->_puckLayer opacity];
    if (fabsf(v3) >= 0.000001)
    {
      [(MKAnnotationView *)&v6 calloutOffset];
    }
    else
    {
      [(_MKPuckAnnotationView *)self frame];
      double v4 = CGRectGetHeight(v9) * 0.5;
      double v5 = 0.0;
    }
  }
  else
  {
    [(MKAnnotationView *)&v7 calloutOffset];
  }
  result.CGFloat y = v4;
  result.CGFloat x = v5;
  return result;
}

- (void)_setShouldShowDynamicLocationAnimations:(BOOL)a3
{
  if (self->_shouldShowDynamicLocationAnimations != a3)
  {
    self->_BOOL shouldShowDynamicLocationAnimations = a3;
    [(_MKPuckAnnotationView *)self _updatePulseAnimation];
    [(_MKPuckAnnotationView *)self _resetInnerPulseFrame];
    [(_MKPuckAnnotationView *)self _updateAccuracyAnimation];
  }
}

- (unint64_t)_innerPulseFrameWhenDisabled:(unint64_t)a3
{
  if (a3) {
    return a3 - 1;
  }
  else {
    return 0;
  }
}

- (id)_pulseLayer
{
  v12[3] = *MEMORY[0x1E4F143B8];
  pulseLayer = self->_pulseLayer;
  if (!pulseLayer)
  {
    double v4 = [MEMORY[0x1E4F39BE8] layer];
    double v5 = self->_pulseLayer;
    self->_pulseLayer = v4;

    -[CALayer setBounds:](self->_pulseLayer, "setBounds:", 0.0, 0.0, 120.0, 120.0);
    [(CALayer *)self->_pulseLayer setCornerRadius:60.0];
    v11[0] = @"bounds";
    objc_super v6 = [MEMORY[0x1E4F1CA98] null];
    v12[0] = v6;
    v11[1] = @"cornerRadius";
    objc_super v7 = [MEMORY[0x1E4F1CA98] null];
    v12[1] = v7;
    v11[2] = @"transform";
    long long v8 = [MEMORY[0x1E4F1CA98] null];
    v12[2] = v8;
    CGRect v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
    [(CALayer *)self->_pulseLayer setActions:v9];

    [(CALayer *)self->_pulseLayer setZPosition:-9999.0];
    [(CALayer *)self->_pulseLayer setOpacity:0.0];
    [(_MKPuckAnnotationView *)self _updatePulseColor];
    pulseLayer = self->_pulseLayer;
  }

  return pulseLayer;
}

- (id)_animationToSynchronizePulse:(id *)a3
{
  if (a3) {
    *a3 = self->_innerCircleLayer;
  }
  innerCircleLayer = self->_innerCircleLayer;

  return [(CALayer *)innerCircleLayer animationForKey:@"pulse"];
}

- (id)_pulseAnimation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  double v2 = [MEMORY[0x1E4F39B48] animationWithKeyPath:0x1ED919508];
  [v2 setFromValue:&unk_1ED97E910];
  [v2 setToValue:&unk_1ED97E928];
  float v3 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v3 setKeyTimes:&unk_1ED97F4A0];
  [v3 setValues:&unk_1ED97F4B8];
  double v4 = [MEMORY[0x1E4F39B38] animation];
  v9[0] = v2;
  v9[1] = v3;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  [v4 setAnimations:v5];

  [v4 setDuration:3.0];
  objc_super v6 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
  [v4 setTimingFunction:v6];

  [v4 setFrameInterval:0.0250000004];
  LODWORD(v7) = 2139095040;
  [v4 setRepeatCount:v7];
  [v4 setRemovedOnCompletion:0];

  return v4;
}

- (void)_resumePulse
{
  float v3 = [(_MKPuckAnnotationView *)self _pulseLayer];
  [v3 removeAnimationForKey:@"fadePulse"];
  double v4 = [v3 animationForKey:@"outerPulse"];
  if (!v4)
  {
    [v3 removeFromSuperlayer];
    [(CALayer *)self->_accuracyContainerLayer insertSublayer:v3 atIndex:0];
    double v5 = [(_MKPuckAnnotationView *)self _pulseAnimation];
    id v28 = 0;
    objc_super v6 = [(_MKPuckAnnotationView *)self _animationToSynchronizePulse:&v28];
    id v7 = v28;
    long long v8 = [(_MKPuckAnnotationView *)self _pulseLayer];
    id v9 = v5;
    id v10 = v6;
    id v11 = v7;
    if (v10)
    {
      int v12 = [v10 autoreverses];
      [v10 duration];
      if (v12) {
        double v14 = v13 + v13;
      }
      else {
        double v14 = v13;
      }
      [v11 convertTime:0 fromLayer:CACurrentMediaTime()];
      double v16 = v15;
      [v10 beginTime];
      double v18 = v17;
      [v10 timeOffset];
      double v20 = fmod(v16 - (v18 + v19), v14);
      [v10 beginTime];
      objc_msgSend(v11, "convertTime:toLayer:", v8);
      long double v22 = v21;
      [v9 duration];
      objc_msgSend(v9, "setBeginTime:", (double)fmod(v22, v23));
      [v9 setTimeOffset:v14 - v20];
      [v9 setDuration:v14];
    }

    [v3 addAnimation:v9 forKey:@"outerPulse"];
  }
  [v3 speed];
  if (fabsf(v24) < 0.000001)
  {
    [v3 timeOffset];
    double v26 = v25;
    LODWORD(v25) = 1.0;
    [v3 setSpeed:v25];
    [v3 setTimeOffset:0.0];
    [v3 setBeginTime:0.0];
    [v3 convertTime:0 fromLayer:CACurrentMediaTime()];
    [v3 setBeginTime:v27 - v26];
  }
}

- (void)_pausePulse
{
  pulseLayer = self->_pulseLayer;
  if (pulseLayer)
  {
    [(CALayer *)pulseLayer speed];
    if (fabsf(v4 + -1.0) < 0.000001)
    {
      [(CALayer *)self->_pulseLayer convertTime:0 fromLayer:CACurrentMediaTime()];
      double v6 = v5;
      [(CALayer *)self->_pulseLayer setSpeed:0.0];
      id v7 = self->_pulseLayer;
      [(CALayer *)v7 setTimeOffset:v6];
    }
  }
}

- (void)setAllowsPulse:(BOOL)a3
{
  if (self->_allowsPulse != a3)
  {
    self->_allowsPulse = a3;
    [(_MKPuckAnnotationView *)self _updatePulse];
  }
}

- (void)setCanShowHeadingIndicator:(BOOL)a3
{
  self->_canShowHeadingIndicator = a3;
  [(_MKPuckAnnotationView *)self _updateShowHeadingLayer];
}

- (void)_updateHeadingLayerForStyleChange:(BOOL)a3
{
  [(_MKPuckAnnotationView *)self _updateShowHeadingLayer:0 animatedIfPossible:1];

  [(_MKPuckAnnotationView *)self _updateShowHeadingLayerAnimatedIfPossible:1];
}

- (void)_setHeadingLayerHidden:(BOOL)a3
{
}

- (void)_setTracking:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView _setTracking:](&v5, sel__setTracking_);
  [(VKNavigationPuck *)self->_navigationPuckMarker setTracking:v3];
}

- (BOOL)_tracking
{
  v3.receiver = self;
  v3.super_class = (Class)_MKPuckAnnotationView;
  return [(MKAnnotationView *)&v3 _isTracking];
}

- (void)setPresentationCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v6 = MKGetUserLocationViewLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412803;
    long long v8 = self;
    __int16 v9 = 2049;
    double v10 = var0;
    __int16 v11 = 2049;
    double v12 = var1;
    _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_INFO, "[VKPuckAnimatorTarget] MKPuckAnnotationView %@ setPresentationCoordinate: (%{private}f, %{private}f)", (uint8_t *)&v7, 0x20u);
  }

  -[_MKPuckAnnotationView _setPresentationCoordinate:](self, "_setPresentationCoordinate:", var0, var1);
}

- (void)_setPresentationCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(MKAnnotationView *)self _presentationCoordinate];
  if (vabdd_f64(latitude, v7) >= 0.00000000999999994 || vabdd_f64(longitude, v6) >= 0.00000000999999994)
  {
    long long v8 = MKGetUserLocationViewLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412803;
      double v12 = self;
      __int16 v13 = 2049;
      double v14 = latitude;
      __int16 v15 = 2049;
      double v16 = longitude;
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_INFO, "MKPuckAnnotationView %@ _setPresentationCoordinate: (%{private}f, %{private}f)", buf, 0x20u);
    }

    v10.receiver = self;
    v10.super_class = (Class)_MKPuckAnnotationView;
    -[MKAnnotationView _setPresentationCoordinate:](&v10, sel__setPresentationCoordinate_, latitude, longitude);
    navigationPuckMarker = self->_navigationPuckMarker;
    VKLocationCoordinate2DMake();
    -[VKNavigationPuck setPresentationCoordinate:](navigationPuckMarker, "setPresentationCoordinate:");
  }
}

- (void)setAnimatingToCoordinate:(BOOL)a3
{
  BOOL v3 = a3;
  -[_MKPuckAnnotationView _setAnimatingToCoordinate:](self, "_setAnimatingToCoordinate:");
  navigationPuckMarker = self->_navigationPuckMarker;

  [(VKNavigationPuck *)navigationPuckMarker setAnimatingToCoordinate:v3];
}

- (void)_setPresentationCourse:(double)a3
{
  [(MKAnnotationView *)self _presentationCourse];
  double v6 = a3 - v5;
  [(MKAnnotationView *)self _presentationCourse];
  double v8 = a3 - v7;
  if (v6 < 0.0) {
    double v8 = -v8;
  }
  if (v8 >= 2.0)
  {
    v9.receiver = self;
    v9.super_class = (Class)_MKPuckAnnotationView;
    [(MKAnnotationView *)&v9 _setPresentationCourse:a3];
    [(_MKPuckAnnotationView *)self _updateInnerCourseRotation];
  }
}

- (CGSize)collisionSize
{
  [(MKAnnotationView *)self _collisionFrame];
  double v3 = v2;
  double v5 = v4;
  result.CGFloat height = v5;
  result.CGFloat width = v3;
  return result;
}

- (int64_t)zoomDirection
{
  return self->_zoomDirection;
}

- (void)setZoomDirection:(int64_t)a3
{
  self->_zoomDirection = a3;
}

- (BOOL)allowsPulse
{
  return self->_allowsPulse;
}

- (BOOL)canShowHeadingIndicator
{
  return self->_canShowHeadingIndicator;
}

- (BOOL)shouldDisplayHeading
{
  return self->_shouldDisplayHeading;
}

- (double)heading
{
  return self->_heading;
}

- (double)headingAccuracy
{
  return self->_headingAccuracy;
}

- (BOOL)allowsAccuracyRing
{
  return self->_allowsAccuracyRing;
}

- (double)maxRadiusToShowAccuracyRing
{
  return self->_maxRadiusToShowAccuracyRing;
}

- (double)_accuracyRingStrokeOpacityThreshold
{
  return self->_accuracyRingStrokeOpacityThreshold;
}

- (BOOL)isOverrideStale
{
  return self->_overrideIsStale;
}

- (void)setOverrideIsStale:(BOOL)a3
{
  self->_overrideIsStale = a3;
}

- (BOOL)isEffectsEnabled
{
  return self->_effectsEnabled;
}

- (double)presentationCourse
{
  return self->_presentationCourse;
}

- (void)setPresentationCourse:(double)a3
{
  self->_presentationCourse = a3;
}

- (double)locationAccuracy
{
  return self->_locationAccuracy;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (double)accuracyRingAlpha
{
  return self->_accuracyRingAlpha;
}

- (double)_minimumAccuracyRadius
{
  return self->_minimumAccuracyRadius;
}

- (BOOL)_shouldShowDynamicLocationAnimations
{
  return self->_shouldShowDynamicLocationAnimations;
}

- (int64_t)headingIndicatorStyle
{
  return self->_headingIndicatorStyle;
}

- (BOOL)shouldInnerPulse
{
  return self->_shouldInnerPulse;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (UIColor)glyphTintColor
{
  return self->_glyphTintColor;
}

- (UIImage)innerImageMask
{
  return self->_innerImageMask;
}

- (BOOL)rotateInnerImageToMatchCourse
{
  return self->_rotateInnerImageToMatchCourse;
}

- (BOOL)_forceHeadingUp
{
  return self->_forceHeadingUp;
}

- (BOOL)_shouldHidePuckWhenAccuracyVisible
{
  return self->_shouldHidePuckWhenAccuracyVisible;
}

- (BOOL)isAnimatingPresentationAccuracy
{
  return self->_animatingPresentationAccuracy;
}

- (BOOL)_displaysPuckAsAccuracy
{
  return self->_displaysPuckAsAccuracy;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_minUncertaintyConfigListener, 0);
  objc_storeStrong(&self->_shelbyvilleConfigListener, 0);
  objc_storeStrong(&self->_faux3DPuckConfigListener, 0);
  objc_storeStrong(&self->_newPuckConfigListener, 0);
  objc_storeStrong(&self->_minAccuracyConfigListener, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_headingLayer, 0);
  objc_storeStrong((id *)&self->_accuracyLayer, 0);
  objc_storeStrong((id *)&self->_pulseLayer, 0);
  objc_storeStrong((id *)&self->_navigationPuckMarker, 0);
  objc_storeStrong((id *)&self->_headingContainerLayer, 0);
  objc_storeStrong((id *)&self->_accuracyContainerLayer, 0);
  objc_storeStrong((id *)&self->_innerCircleLayer, 0);
  objc_storeStrong((id *)&self->_faux3DHighlightMaskRings, 0);
  objc_storeStrong((id *)&self->_faux3DHighlightMask, 0);
  objc_storeStrong((id *)&self->_faux3DBaseBottomLayer, 0);
  objc_storeStrong((id *)&self->_faux3DFaceLayer, 0);
  objc_storeStrong((id *)&self->_puckTransitionLayer, 0);
  objc_storeStrong((id *)&self->_puckTransitionContainer, 0);
  objc_storeStrong((id *)&self->_baseLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_puckContainerLayer, 0);
  objc_storeStrong((id *)&self->_innerImageMask, 0);
  objc_storeStrong((id *)&self->_glyphLayer, 0);
  objc_storeStrong((id *)&self->_glyphTintColor, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);

  objc_storeStrong((id *)&self->_puckLayer, 0);
}

@end