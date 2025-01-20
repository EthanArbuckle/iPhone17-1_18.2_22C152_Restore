@interface MKLookAroundView
- (BOOL)_moveToStorefrontView:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)_pointContainedInCompassView:(CGPoint)a3;
- (BOOL)adequatelyDrawn;
- (BOOL)cancelPendingMove;
- (BOOL)hasEnteredLookAround;
- (BOOL)isCompassHidden;
- (BOOL)isLoading;
- (BOOL)lookAroundGestureControllerShouldReceive:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)moveToMapItem:(id)a3 wantsCloseUpView:(BOOL)a4 orMuninMarker:(id)a5 withHeading:(double)a6 completionHandler:(id)a7;
- (BOOL)navigatingEnabled;
- (BOOL)panningEnabled;
- (BOOL)showsPointLabels;
- (BOOL)showsRoadLabels;
- (BOOL)tapAtPoint:(CGPoint)a3;
- (BOOL)zoomingEnabled;
- (CLLocationCoordinate2D)centerCoordinate;
- (GEOMuninViewState)muninViewState;
- (MKLookAroundView)initWithCoder:(id)a3;
- (MKLookAroundView)initWithFrame:(CGRect)a3;
- (MKLookAroundViewDelegate)delegate;
- (MKMapItem)mapItem;
- (MKMapItem)revGeoMapItem;
- (MKPointOfInterestFilter)pointOfInterestFilter;
- (NSArray)imageResources;
- (NSArray)visiblePlaceMUIDs;
- (NSArray)visibleRoadLabels;
- (NSDate)collectionDate;
- (NSURL)sharingURL;
- (UIEdgeInsets)compassInsets;
- (UIView)overlayView;
- (VKLabelMarker)selectedLabelMarker;
- (VKMapView)lookAroundView;
- (VKMuninMarker)muninMarker;
- (double)presentationYaw;
- (id)_imageFromLookAroundView;
- (id)_locationInfoWithHeading:(double)a3;
- (id)_mapkit_locationSubtitle;
- (id)_mapkit_locationTitle;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)labelMarkerForCustomFeatureAnnotation:(id)a3;
- (void)_animateCanvasForBounds:(CGRect)a3;
- (void)_enterLookAroundForMapItem:(id)a3 wantsCloseUpView:(BOOL)a4 cameraFrameOverride:(id)a5;
- (void)_enterLookAroundForMuninMarker:(id)a3 withHeading:(double)a4;
- (void)_enterLookAroundForMuninViewState:(id)a3;
- (void)_handleCompassSelect;
- (void)_maps_initCommon;
- (void)_refineLabelMarker:(id)a3;
- (void)_resetViewState;
- (void)_reverseGeocodeCoordinate:(CLLocationCoordinate2D)a3;
- (void)_setInitialLocationInfo;
- (void)_updateCameraFrame;
- (void)_updateCompass;
- (void)_updateCompassInsets;
- (void)_updateLocationInfo;
- (void)_updateLocationInfoForCoordinate:(CLLocationCoordinate2D)a3 allowReverseGeocodeIfNeeded:(BOOL)a4;
- (void)addCustomFeatureDataSource:(id)a3;
- (void)dealloc;
- (void)deselectLabelMarker;
- (void)enterLookAroundWithEntryPoint:(id)a3;
- (void)jumpToCloseUpView;
- (void)jumpToStandOffView;
- (void)lookAroundGestureController:(id)a3 didTapAtPoint:(CGPoint)a4 areaAvailable:(BOOL)a5;
- (void)lookAroundGestureController:(id)a3 didTapLabelMarker:(id)a4;
- (void)lookAroundGestureController:(id)a3 didZoomWithDirection:(int64_t)a4 type:(int64_t)a5;
- (void)lookAroundGestureControllerDidPan:(id)a3;
- (void)lookAroundGestureControllerDidStartUserInteraction:(id)a3;
- (void)lookAroundGestureControllerDidStopUserInteraction:(id)a3;
- (void)mapLayer:(id)a3 nearestJunctionDidChange:(id)a4 currentRoad:(id)a5;
- (void)mapLayerDidChangeRegionAnimated:(BOOL)a3;
- (void)mapLayerDidChangeSceneState:(id)a3 withState:(unint64_t)a4;
- (void)mapLayerDidChangeVisibleRegion;
- (void)mapLayerWasUnableToAnimate;
- (void)mapLayerWillAnimateToLocation:(id)a3;
- (void)mapLayerWillChangeRegionAnimated:(BOOL)a3;
- (void)moveToCloseUpView;
- (void)moveToCloseUpViewAnimated:(BOOL)a3;
- (void)moveToStandOffView;
- (void)moveToStandOffViewAnimated:(BOOL)a3;
- (void)openInMapsWithCompletionHandler:(id)a3;
- (void)recordTriggerAction:(int)a3;
- (void)removeCustomFeatureDataSource:(id)a3;
- (void)reset;
- (void)selectLabelMarker:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3;
- (void)setCompassHidden:(BOOL)a3;
- (void)setCompassHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setCompassInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHasEnteredLookAround:(BOOL)a3;
- (void)setLookAroundView:(id)a3;
- (void)setNavigatingEnabled:(BOOL)a3;
- (void)setPanningEnabled:(BOOL)a3;
- (void)setPointOfInterestFilter:(id)a3;
- (void)setPresentationYaw:(double)a3;
- (void)setPresentationYaw:(double)a3 animated:(BOOL)a4;
- (void)setPresentationYaw:(double)a3 pitch:(double)a4 animated:(BOOL)a5;
- (void)setShowsPointLabels:(BOOL)a3;
- (void)setShowsRoadLabels:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setZoomingEnabled:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation MKLookAroundView

- (void)_maps_initCommon
{
  v69[2] = *MEMORY[0x1E4F143B8];
  v3 = MKGetMKLookAroundLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LookAroundViewInitialization", (const char *)&unk_18BD3917F, buf, 2u);
  }

  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 nativeScale];
  double v6 = v5;

  [(MKLookAroundView *)self setOpaque:1];
  [(MKLookAroundView *)self setBackgroundColor:0];
  [(MKLookAroundView *)self setInsetsLayoutMarginsFromSafeArea:0];
  [(MKLookAroundView *)self setAccessibilityIgnoresInvertColors:1];
  [(MKLookAroundView *)self setAccessibilityIdentifier:@"LookAroundView"];
  [(MKLookAroundView *)self setNavigatingEnabled:1];
  [(MKLookAroundView *)self setPanningEnabled:1];
  [(MKLookAroundView *)self setZoomingEnabled:1];
  v7 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:0];
  transitionStartImageview = self->_transitionStartImageview;
  self->_transitionStartImageview = v7;

  v9 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:0];
  transitionEndImageview = self->_transitionEndImageview;
  self->_transitionEndImageview = v9;

  v11 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:0];
  transitionGridImageview = self->_transitionGridImageview;
  self->_transitionGridImageview = v11;

  v13 = [_MKLookAroundLayerHostingView alloc];
  [(MKLookAroundView *)self bounds];
  v14 = -[_MKLookAroundLayerHostingView initWithFrame:](v13, "initWithFrame:");
  hostView = self->_hostView;
  self->_hostView = v14;

  [(_MKLookAroundLayerHostingView *)self->_hostView setUserInteractionEnabled:0];
  [(MKLookAroundView *)self addSubview:self->_hostView];
  id v16 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(MKLookAroundView *)self bounds];
  v17 = (UIView *)objc_msgSend(v16, "initWithFrame:");
  overlayView = self->_overlayView;
  self->_overlayView = v17;

  [(UIView *)self->_overlayView setAccessibilityIdentifier:@"LookAroundOverlayView"];
  [(MKLookAroundView *)self addSubview:self->_overlayView];
  v19 = [MKCompassView alloc];
  double v20 = *MEMORY[0x1E4F1DB28];
  double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v24 = -[MKCompassView initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], v21, v22, v23);
  compassView = self->_compassView;
  self->_compassView = v24;

  [(MKCompassView *)self->_compassView setCompassViewSize:1 style:0];
  [(MKCompassView *)self->_compassView setTag:1002];
  -[MKCompassView _setTouchInsets:](self->_compassView, "_setTouchInsets:", -9.0, -9.0, -9.0, -9.0);
  [(MKCompassView *)self->_compassView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKCompassView *)self->_compassView setAccessibilityIdentifier:@"LookAroundCompassView"];
  [(UIView *)self->_overlayView addSubview:self->_compassView];
  v26 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleCompassSelect];
  compassSelectGestureRecognizer = self->_compassSelectGestureRecognizer;
  self->_compassSelectGestureRecognizer = v26;

  [(MKCompassView *)self->_compassView addGestureRecognizer:self->_compassSelectGestureRecognizer];
  v28 = [(MKCompassView *)self->_compassView topAnchor];
  v29 = [(UIView *)self->_overlayView safeAreaLayoutGuide];
  v30 = [v29 topAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  compassTopOrBottomConstraint = self->_compassTopOrBottomConstraint;
  self->_compassTopOrBottomConstraint = v31;

  v33 = [(MKCompassView *)self->_compassView trailingAnchor];
  v34 = [(UIView *)self->_overlayView safeAreaLayoutGuide];
  v35 = [v34 trailingAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  compassTrailingConstraint = self->_compassTrailingConstraint;
  self->_compassTrailingConstraint = v36;

  v38 = (void *)MEMORY[0x1E4F28DC8];
  v39 = self->_compassTrailingConstraint;
  v69[0] = self->_compassTopOrBottomConstraint;
  v69[1] = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
  [v38 activateConstraints:v40];

  v41 = [[MKLookAroundGestureController alloc] initWithLookAroundView:self];
  gestureController = self->_gestureController;
  self->_gestureController = v41;

  [(MKLookAroundGestureController *)self->_gestureController setDelegate:self];
  v66 = [MEMORY[0x1E4FB3A48] descriptorWithShouldRasterize:0 inBackground:0 contentScale:0 auditToken:1 mapViewPurpose:0 allowsAntialiasing:v6];
  v43 = (VKMapView *)[objc_alloc(MEMORY[0x1E4FB3A40]) initWithDescriptor:v66];
  lookAroundView = self->_lookAroundView;
  self->_lookAroundView = v43;

  [(VKMapView *)self->_lookAroundView setMapDelegate:self];
  [(VKMapView *)self->_lookAroundView setRendersInBackground:0];
  [(VKMapView *)self->_lookAroundView setMapType:7];
  v45 = +[MKSystemController sharedInstance];
  LODWORD(v40) = [v45 reduceMotionEnabled];

  if (v40) {
    [(VKMapView *)self->_lookAroundView setVirtualParallaxEnabled:0];
  }
  v46 = [(_MKLookAroundLayerHostingView *)self->_hostView layer];
  [v46 insertSublayer:self->_lookAroundView atIndex:0];

  [(_MKLookAroundLayerHostingView *)self->_hostView setLookAroundView:self->_lookAroundView];
  [(VKMapView *)self->_lookAroundView heading];
  -[MKCompassView setMapHeading:](self->_compassView, "setMapHeading:");
  [(VKMapView *)self->_lookAroundView setCameraDelegate:self];
  v47 = objc_alloc_init(MKHapticEngine);
  hapticEngine = self->_hapticEngine;
  self->_hapticEngine = v47;

  v49 = -[MKLookAroundBumpFlash initWithFrame:]([MKLookAroundBumpFlash alloc], "initWithFrame:", v20, v21, v22, v23);
  bumpFlashView = self->_bumpFlashView;
  self->_bumpFlashView = v49;

  [(MKLookAroundBumpFlash *)self->_bumpFlashView setAccessibilityIdentifier:@"LookAroundBumpFlash"];
  [(MKLookAroundBumpFlash *)self->_bumpFlashView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKLookAroundBumpFlash *)self->_bumpFlashView setUserInteractionEnabled:0];
  [(MKLookAroundView *)self addSubview:self->_bumpFlashView];
  v62 = (void *)MEMORY[0x1E4F28DC8];
  v65 = [(MKLookAroundBumpFlash *)self->_bumpFlashView topAnchor];
  v64 = [(MKLookAroundView *)self topAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v68[0] = v63;
  v51 = [(MKLookAroundBumpFlash *)self->_bumpFlashView leftAnchor];
  v52 = [(MKLookAroundView *)self leftAnchor];
  v53 = [v51 constraintEqualToAnchor:v52];
  v68[1] = v53;
  v54 = [(MKLookAroundBumpFlash *)self->_bumpFlashView bottomAnchor];
  v55 = [(MKLookAroundView *)self bottomAnchor];
  v56 = [v54 constraintEqualToAnchor:v55];
  v68[2] = v56;
  v57 = [(MKLookAroundBumpFlash *)self->_bumpFlashView rightAnchor];
  v58 = [(MKLookAroundView *)self rightAnchor];
  v59 = [v57 constraintEqualToAnchor:v58];
  v68[3] = v59;
  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:4];
  [v62 activateConstraints:v60];

  v61 = MKGetMKLookAroundLog();
  if (os_signpost_enabled(v61))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v61, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "LookAroundViewInitialization", (const char *)&unk_18BD3917F, buf, 2u);
  }
}

- (MKLookAroundView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKLookAroundView;
  v3 = [(MKLookAroundView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(MKLookAroundView *)v3 _maps_initCommon];
    double v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  [(VKMapView *)self->_lookAroundView setMapDelegate:0];
  [(VKMapView *)self->_lookAroundView setCameraDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MKLookAroundView;
  [(MKLookAroundView *)&v3 dealloc];
}

- (MKLookAroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)MKLookAroundView;
  objc_super v7 = -[MKLookAroundView initWithFrame:](&v11, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    [(MKLookAroundView *)v7 _maps_initCommon];
    -[VKMapView setFrame:](v8->_lookAroundView, "setFrame:", x, y, width, height);
    v9 = v8;
  }

  return v8;
}

- (VKMapView)lookAroundView
{
  return self->_lookAroundView;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (-[MKLookAroundView _pointContainedInCompassView:](self, "_pointContainedInCompassView:", x, y))
  {
    v8 = self->_compassView;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MKLookAroundView;
    -[MKLookAroundView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
    v8 = (MKCompassView *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundView;
  -[MKLookAroundView setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_);
  [(MKLookAroundGestureController *)self->_gestureController setNavigatingEnabled:v3];
  [(MKLookAroundGestureController *)self->_gestureController setPanningEnabled:v3];
  [(MKLookAroundGestureController *)self->_gestureController setZoomingEnabled:v3];
}

- (void)_animateCanvasForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MKLookAroundView *)self bounds];
  double v12 = v11;
  double v13 = v10;
  if (fabs(v11) < 0.000001 || fabs(v10) < 0.000001 || fabs(width) < 0.000001 || fabs(height) < 0.000001)
  {
    double v23 = MKGetMKLookAroundLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v23, OS_LOG_TYPE_ERROR, "Cannot animate to/from zero-sized bounds", buf, 2u);
    }

    -[_MKLookAroundLayerHostingView setFrame:](self->_hostView, "setFrame:", x, y, width, height);
    [(_MKLookAroundLayerHostingView *)self->_hostView setAlpha:1.0];
    -[UIView setFrame:](self->_overlayView, "setFrame:", x, y, width, height);
  }
  else
  {
    uint64_t v25 = v9;
    uint64_t v26 = v8;
    [(MKLookAroundView *)self frame];
    if (width <= v14) {
      [(MKLookAroundView *)self frame];
    }
    [(MKLookAroundView *)self frame];
    if (height <= v15) {
      [(MKLookAroundView *)self frame];
    }
    double v24 = v13;
    double v16 = v12 / v13;
    [(MKLookAroundView *)self bounds];
    [(MKLookAroundView *)self bounds];
    double MidY = CGRectGetMidY(v36);
    if (width > v12)
    {
      BOOL v18 = width / height < 1.0;
    }
    else
    {
      [(MKLookAroundView *)self bounds];
      [(MKLookAroundView *)self bounds];
      CGRectGetMidY(v38);
      BOOL v18 = 1;
    }
    if (v18) {
      double v19 = height;
    }
    else {
      double v19 = width;
    }
    double v20 = v19 / v16;
    BOOL v21 = [(MKLookAroundView *)self adequatelyDrawn];
    BOOL v22 = [(MKLookAroundView *)self hasEnteredLookAround];
    self->_changingViewSize = 1;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __44__MKLookAroundView__animateCanvasForBounds___block_invoke;
    v29[3] = &unk_1E54B86A0;
    BOOL v30 = v21;
    v29[4] = self;
    BOOL v31 = width > v12;
    *(double *)&v29[5] = v19;
    *(double *)&v29[6] = x;
    *(double *)&v29[7] = y;
    *(double *)&v29[8] = width;
    BOOL v32 = v22;
    BOOL v33 = width / height >= 1.0;
    *(double *)&v29[9] = height;
    v29[10] = v26;
    v29[11] = v25;
    *(double *)&v29[12] = v12;
    *(double *)&v29[13] = v24;
    objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_performWithoutAnimation:", v29);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __44__MKLookAroundView__animateCanvasForBounds___block_invoke_2;
    v28[3] = &unk_1E54B86C8;
    v28[4] = self;
    *(double *)&v28[5] = (width - v19) * 0.5;
    *(double *)&v28[6] = (height - v20) * 0.5;
    *(double *)&v28[7] = v19;
    *(double *)&v28[8] = v20;
    *(double *)&v28[9] = x;
    *(double *)&v28[10] = y;
    *(double *)&v28[11] = width;
    *(double *)&v28[12] = height;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __44__MKLookAroundView__animateCanvasForBounds___block_invoke_3;
    v27[3] = &unk_1E54B86F0;
    v27[4] = self;
    objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_animateWithDuration:animations:completion:", v28, v27, 0.0);
  }
}

void __44__MKLookAroundView__animateCanvasForBounds___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 112))
  {
    id v12 = [*(id *)(a1 + 32) _imageFromLookAroundView];
  }
  else
  {
    id v12 = 0;
  }
  if (*(unsigned char *)(a1 + 113))
  {
    double v2 = *(double *)(a1 + 40);
    double v3 = 0.0;
    double v4 = v2;
    double v5 = 0.0;
  }
  else
  {
    double v5 = *(double *)(a1 + 48);
    double v3 = *(double *)(a1 + 56);
    double v4 = *(double *)(a1 + 64);
    double v2 = *(double *)(a1 + 72);
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrame:", v5, v3, v4, v2);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "setFrame:", v5, v3, v4, v2);
  double v6 = *(void **)(*(void *)(a1 + 32) + 504);
  if (*(unsigned char *)(a1 + 114)) {
    [v6 forceCameraUpdateForFrameResize];
  }
  else {
    [v6 forceLayout];
  }
  id v7 = [*(id *)(a1 + 32) _imageFromLookAroundView];
  if (*(unsigned char *)(a1 + 113))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    [*(id *)(*(void *)(a1 + 32) + 504) forceCameraUpdateForFrameResize];
  }
  uint64_t v8 = 424;
  [*(id *)(*(void *)(a1 + 32) + 424) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 32) + 432) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 32) + 440) removeFromSuperview];
  if (*(unsigned char *)(a1 + 112))
  {
    objc_msgSend(*(id *)(a1 + 32), "_mapkit_insertSubview:aboveSubview:", *(void *)(*(void *)(a1 + 32) + 432), *(void *)(*(void *)(a1 + 32) + 408));
    [*(id *)(*(void *)(a1 + 32) + 432) setImage:v7];
    if (*(unsigned char *)(a1 + 115))
    {
      uint64_t v9 = 2;
    }
    else if (*(unsigned char *)(a1 + 113))
    {
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v9 = 1;
    }
    [*(id *)(*(void *)(a1 + 32) + 432) setImageContentMode:v9];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.25];
    objc_msgSend(*(id *)(a1 + 32), "_mapkit_insertSubview:aboveSubview:", *(void *)(*(void *)(a1 + 32) + 424), *(void *)(*(void *)(a1 + 32) + 432));
    [*(id *)(*(void *)(a1 + 32) + 424) setImage:v12];
    if (*(unsigned char *)(a1 + 115)) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    [*(id *)(*(void *)(a1 + 32) + 424) setImageContentMode:v11];
    double v10 = 1.0;
  }
  else
  {
    if (*(unsigned char *)(a1 + 114)) {
      goto LABEL_25;
    }
    objc_msgSend(*(id *)(a1 + 32), "_mapkit_insertSubview:aboveSubview:", *(void *)(*(void *)(a1 + 32) + 440), *(void *)(*(void *)(a1 + 32) + 408));
    [*(id *)(*(void *)(a1 + 32) + 440) setImage:v7];
    [*(id *)(*(void *)(a1 + 32) + 440) setImageContentMode:2];
    double v10 = 0.800000012;
    uint64_t v8 = 440;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + v8), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  [*(id *)(*(void *)(a1 + 32) + v8) setAlpha:v10];
LABEL_25:
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
}

uint64_t __44__MKLookAroundView__animateCanvasForBounds___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:1.0];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  double v2 = *(double *)(a1 + 72);
  double v3 = *(double *)(a1 + 80);
  double v4 = *(void **)(*(void *)(a1 + 32) + 440);
  double v5 = *(double *)(a1 + 88);
  double v6 = *(double *)(a1 + 96);

  return objc_msgSend(v4, "setFrame:", v2, v3, v5, v6);
}

uint64_t __44__MKLookAroundView__animateCanvasForBounds___block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__MKLookAroundView__animateCanvasForBounds___block_invoke_4;
  v3[3] = &unk_1E54B8188;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__MKLookAroundView__animateCanvasForBounds___block_invoke_5;
  v2[3] = &unk_1E54B86F0;
  v2[4] = v4;
  return objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_animateWithDuration:animations:completion:", v3, v2, 0.200000003);
}

uint64_t __44__MKLookAroundView__animateCanvasForBounds___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  double v2 = *(void **)(*(void *)(a1 + 32) + 432);

  return [v2 setAlpha:1.0];
}

unsigned char *__44__MKLookAroundView__animateCanvasForBounds___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrame:");
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "setFrame:");
  *(unsigned char *)(*(void *)(a1 + 32) + 416) = 0;
  [*(id *)(*(void *)(a1 + 32) + 424) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 32) + 432) removeFromSuperview];
  result = *(unsigned char **)(a1 + 32);
  if (result[417])
  {
    return (unsigned char *)[result setCompassHidden:0 animated:1];
  }
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MKLookAroundView *)self bounds];
  v15.origin.double x = v8;
  v15.origin.double y = v9;
  v15.size.double width = v10;
  v15.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v15))
  {
    if (width == self->_oldRect.size.height && height == self->_oldRect.size.width
      || !objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters")
      || ([(MKLookAroundView *)self bounds], CGRectIsEmpty(v14)))
    {
      self->_changingViewSize = 1;
      -[_MKLookAroundLayerHostingView setFrame:](self->_hostView, "setFrame:", x, y, width, height);
      -[UIView setFrame:](self->_overlayView, "setFrame:", x, y, width, height);
      if (self->_changingViewSize) {
        [(VKMapView *)self->_lookAroundView forceFrame];
      }
      self->_changingViewSize = 0;
    }
    else
    {
      -[MKLookAroundView _animateCanvasForBounds:](self, "_animateCanvasForBounds:", x, y, width, height);
    }
    self->_oldRect.origin.double x = x;
    self->_oldRect.origin.double y = y;
    self->_oldRect.size.double width = width;
    self->_oldRect.size.double height = height;
  }
  v12.receiver = self;
  v12.super_class = (Class)MKLookAroundView;
  -[MKLookAroundView setBounds:](&v12, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MKLookAroundView *)self bounds];
  v16.origin.double x = v8;
  v16.origin.double y = v9;
  v16.size.double width = v10;
  v16.size.double height = v11;
  v13.origin.double x = 0.0;
  v13.origin.double y = 0.0;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v16))
  {
    if (width == self->_oldRect.size.height && height == self->_oldRect.size.width
      || !objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters")
      || ([(MKLookAroundView *)self bounds], CGRectIsEmpty(v14)))
    {
      v15.origin.double x = 0.0;
      v15.origin.double y = 0.0;
      v15.size.double width = width;
      v15.size.double height = height;
      if (!CGRectIsEmpty(v15))
      {
        self->_changingViewSize = 1;
        -[_MKLookAroundLayerHostingView setFrame:](self->_hostView, "setFrame:", 0.0, 0.0, width, height);
        -[UIView setFrame:](self->_overlayView, "setFrame:", 0.0, 0.0, width, height);
        [(VKMapView *)self->_lookAroundView forceFrame];
        self->_changingViewSize = 0;
      }
    }
    else
    {
      -[MKLookAroundView _animateCanvasForBounds:](self, "_animateCanvasForBounds:", 0.0, 0.0, width, height);
    }
    self->_oldRect.origin.double x = 0.0;
    self->_oldRect.origin.double y = 0.0;
    self->_oldRect.size.double width = width;
    self->_oldRect.size.double height = height;
  }
  v12.receiver = self;
  v12.super_class = (Class)MKLookAroundView;
  -[MKLookAroundView setFrame:](&v12, sel_setFrame_, x, y, width, height);
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundView;
  -[MKLookAroundView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  [(VKMapView *)self->_lookAroundView enableViewDataLoading:a3 != 0];
}

- (BOOL)isCompassHidden
{
  return [(MKCompassView *)self->_compassView isHidden];
}

- (void)setCompassHidden:(BOOL)a3
{
}

- (void)setCompassHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = self->_compassView;
  CGFloat v8 = v7;
  if (a3 || !self->_changingViewSize)
  {
    self->_wantsCompassShown = 0;
    if ([(MKCompassView *)v7 isHidden]) {
      [(MKCompassView *)v8 setHidden:0];
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__MKLookAroundView_setCompassHidden_animated___block_invoke;
    v18[3] = &unk_1E54B8718;
    CGFloat v9 = v8;
    double v19 = v9;
    BOOL v20 = a3;
    CGFloat v10 = (void (**)(void))MEMORY[0x18C139AE0](v18);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    CGRect v14 = __46__MKLookAroundView_setCompassHidden_animated___block_invoke_2;
    CGRect v15 = &unk_1E54B8740;
    CGRect v16 = v9;
    BOOL v17 = a3;
    CGFloat v11 = (void (**)(void, void))MEMORY[0x18C139AE0](&v12);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_animateWithDuration:animations:completion:", v10, v11, 0.25, v12, v13, v14, v15);
    }
    else
    {
      v10[2](v10);
      v11[2](v11, 1);
    }
  }
  else
  {
    self->_wantsCompassShown = 1;
  }
}

uint64_t __46__MKLookAroundView_setCompassHidden_animated___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

uint64_t __46__MKLookAroundView_setCompassHidden_animated___block_invoke_2(uint64_t a1)
{
  double v2 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  [*(id *)(a1 + 32) setAlpha:v2];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  BOOL v4 = *(void **)(a1 + 32);

  return [v4 setHidden:v3];
}

- (void)setCompassInsets:(UIEdgeInsets)a3
{
  self->_compassInsets = a3;
  [(MKLookAroundView *)self _updateCompassInsets];
}

- (void)setNavigatingEnabled:(BOOL)a3
{
  self->_navigatingEnabled = a3;
  -[MKLookAroundGestureController setNavigatingEnabled:](self->_gestureController, "setNavigatingEnabled:");
}

- (void)setPanningEnabled:(BOOL)a3
{
  self->_panningEnabled = a3;
  -[MKLookAroundGestureController setPanningEnabled:](self->_gestureController, "setPanningEnabled:");
}

- (void)setZoomingEnabled:(BOOL)a3
{
  self->_zoomingEnabled = a3;
  -[MKLookAroundGestureController setZoomingEnabled:](self->_gestureController, "setZoomingEnabled:");
}

- (BOOL)showsRoadLabels
{
  return [(VKMapView *)self->_lookAroundView showsRoadLabels];
}

- (void)setShowsRoadLabels:(BOOL)a3
{
}

- (BOOL)showsPointLabels
{
  return [(VKMapView *)self->_lookAroundView showsPointLabels];
}

- (void)setShowsPointLabels:(BOOL)a3
{
  BOOL v3 = a3;
  -[VKMapView setShowsPointLabels:](self->_lookAroundView, "setShowsPointLabels:");
  if (v3)
  {
    pointOfInterestFilter = self->_pointOfInterestFilter;
    self->_pointOfInterestFilter = 0;

    lookAroundView = self->_lookAroundView;
    [(VKMapView *)lookAroundView setPointsOfInterestFilter:0];
  }
  else
  {
    id v7 = +[MKPointOfInterestFilter filterExcludingAllCategories];
    CGFloat v8 = self->_pointOfInterestFilter;
    self->_pointOfInterestFilter = v7;

    id v9 = [(MKPointOfInterestFilter *)self->_pointOfInterestFilter _geoPOICategoryFilter];
    [(VKMapView *)self->_lookAroundView setPointsOfInterestFilter:v9];
  }
}

- (CLLocationCoordinate2D)centerCoordinate
{
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    BOOL v3 = [(MKLookAroundView *)self muninViewState];
    BOOL v4 = [v3 cameraFrame];

    [v4 latitude];
    CLLocationDegrees v6 = v5;
    [v4 longitude];
    CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v6, v7);
    CLLocationDegrees latitude = v8.latitude;
    CLLocationDegrees longitude = v8.longitude;
  }
  else
  {
    CLLocationDegrees latitude = *MEMORY[0x1E4F1E750];
    CLLocationDegrees longitude = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  double v11 = latitude;
  double v12 = longitude;
  result.CLLocationDegrees longitude = v12;
  result.CLLocationDegrees latitude = v11;
  return result;
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    [(VKMapView *)self->_lookAroundView altitude];
    double v7 = v6;
    [(VKMapView *)self->_lookAroundView pitch];
    double v9 = v8;
    [(VKMapView *)self->_lookAroundView presentationYaw];
    lookAroundView = self->_lookAroundView;
    -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](lookAroundView, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, 0, latitude, longitude, v7, v10, v9, 0.0);
  }
}

- (double)presentationYaw
{
  if (![(MKLookAroundView *)self hasEnteredLookAround]) {
    return 0.0;
  }
  lookAroundView = self->_lookAroundView;

  [(VKMapView *)lookAroundView yaw];
  return result;
}

- (void)setPresentationYaw:(double)a3
{
  [(VKMapView *)self->_lookAroundView pitch];

  [(MKLookAroundView *)self setPresentationYaw:0 pitch:a3 animated:v5];
}

- (void)setPresentationYaw:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(VKMapView *)self->_lookAroundView pitch];

  [(MKLookAroundView *)self setPresentationYaw:v4 pitch:a3 animated:v7];
}

- (void)setPresentationYaw:(double)a3 pitch:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    [(VKMapView *)self->_lookAroundView centerCoordinate];
    double v10 = v9;
    [(VKMapView *)self->_lookAroundView centerCoordinate];
    double v12 = v11;
    [(VKMapView *)self->_lookAroundView altitude];
    double v14 = v13;
    double v15 = fmod(a3, 360.0);
    if (v15 >= 0.0) {
      double v16 = v15;
    }
    else {
      double v16 = v15 + 360.0;
    }
    if (v5) {
      double v17 = 0.25;
    }
    else {
      double v17 = 0.0;
    }
    lookAroundView = self->_lookAroundView;
    -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](lookAroundView, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, 0, v10, v12, v14, v16, a4, v17);
  }
}

- (void)setPointOfInterestFilter:(id)a3
{
  BOOL v4 = (MKPointOfInterestFilter *)a3;
  if (self->_pointOfInterestFilter != v4)
  {
    double v9 = v4;
    BOOL v5 = (MKPointOfInterestFilter *)[(MKPointOfInterestFilter *)v4 copy];
    pointOfInterestFilter = self->_pointOfInterestFilter;
    self->_pointOfInterestFilter = v5;

    if (v9) {
      uint64_t v7 = [(MKPointOfInterestFilter *)v9 _excludesAllCategories] ^ 1;
    }
    else {
      uint64_t v7 = 1;
    }
    [(VKMapView *)self->_lookAroundView setShowsPointLabels:v7];
    double v8 = [(MKPointOfInterestFilter *)v9 _geoPOICategoryFilter];
    [(VKMapView *)self->_lookAroundView setPointsOfInterestFilter:v8];

    BOOL v4 = v9;
  }
}

- (NSDate)collectionDate
{
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    BOOL v3 = [(VKMapView *)self->_lookAroundView currentMarker];
    BOOL v4 = [v3 collectionDate];
  }
  else
  {
    BOOL v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSURL)sharingURL
{
  mapItem = self->_mapItem;
  if (mapItem || (mapItem = self->_revGeoMapItem) != 0)
  {
    BOOL v4 = [(MKLookAroundView *)self muninViewState];
    BOOL v5 = [(MKMapItem *)mapItem _activityURLWithMuninViewState:v4];
  }
  else
  {
    uint64_t v7 = [MKPlacemark alloc];
    [(MKLookAroundView *)self centerCoordinate];
    BOOL v4 = -[MKPlacemark initWithCoordinate:](v7, "initWithCoordinate:");
    double v8 = [[MKMapItem alloc] initWithPlacemark:v4];
    double v9 = [(MKLookAroundView *)self muninViewState];
    BOOL v5 = [(MKMapItem *)v8 _activityURLWithMuninViewState:v9];
  }

  return (NSURL *)v5;
}

- (void)enterLookAroundWithEntryPoint:(id)a3
{
  id v8 = a3;
  -[MKLookAroundView recordTriggerAction:](self, "recordTriggerAction:", [v8 triggerAction]);
  uint64_t v4 = [v8 type];
  if (v4 == 2)
  {
    BOOL v5 = [v8 muninViewState];
    [(MKLookAroundView *)self _enterLookAroundForMuninViewState:v5];
  }
  else if (v4 == 1)
  {
    BOOL v5 = [v8 muninMarker];
    [v8 heading];
    -[MKLookAroundView _enterLookAroundForMuninMarker:withHeading:](self, "_enterLookAroundForMuninMarker:withHeading:", v5);
  }
  else
  {
    if (v4) {
      goto LABEL_8;
    }
    BOOL v5 = [v8 mapItem];
    uint64_t v6 = [v8 wantsCloseUpView];
    uint64_t v7 = [v8 cameraFrameOverride];
    [(MKLookAroundView *)self _enterLookAroundForMapItem:v5 wantsCloseUpView:v6 cameraFrameOverride:v7];
  }
LABEL_8:
}

- (void)_enterLookAroundForMapItem:(id)a3 wantsCloseUpView:(BOOL)a4 cameraFrameOverride:(id)a5
{
  id v30 = a3;
  id v9 = a5;
  if ([v30 _hasLookAroundStorefront])
  {
    [(MKLookAroundView *)self _resetViewState];
    double v10 = [v30 _geoMapItem];
    double v11 = [v10 _storefrontPresentationInfo];

    if (a4)
    {
      double v12 = [v11 closeUpView];
    }
    else
    {
      double v13 = [v11 standOffView];
      double v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v15 = [v11 closeUpView];
      }
      double v12 = v15;
    }
    self->_hasEnteredLookAround = 1;
    self->_moveToStorefrontViewInProgress = 0;
    requestedStorefrontView = self->_requestedStorefrontView;
    self->_requestedStorefrontView = 0;

    self->_wantsStorefrontCloseUpView = 0;
    [(VKMapView *)self->_lookAroundView cancelPendingMove];
    lookAroundView = self->_lookAroundView;
    if (v9)
    {
      [(VKMapView *)lookAroundView setMapType:11];
      id v18 = v9;
      [v18 latitude];
      double v20 = v19;
      [v18 longitude];
      double v22 = v21;
      double v23 = self->_lookAroundView;
      [v18 altitude];
      double v25 = v24;
      [v18 yaw];
      double v27 = v26;
      [v18 pitch];
      double v29 = v28;

      -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](v23, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, 0, v20, v22, v25, v27, v29, 0.0);
    }
    else
    {
      [(VKMapView *)lookAroundView enterMuninForStorefrontView:v12 secondaryStorefrontView:0];
      [(VKMapView *)self->_lookAroundView forceFrame];
    }
    objc_storeStrong((id *)&self->_mapItem, a3);
    [(MKLookAroundView *)self _updateCameraFrame];
    [(MKLookAroundView *)self _updateCompass];
    [(MKLookAroundView *)self _setInitialLocationInfo];
  }
}

- (void)_enterLookAroundForMuninMarker:(id)a3 withHeading:(double)a4
{
  id v6 = a3;
  [(MKLookAroundView *)self _resetViewState];
  self->_hasEnteredLookAround = 1;
  [(VKMapView *)self->_lookAroundView enterMuninForMarker:v6 withHeading:a4];

  [(MKLookAroundView *)self _updateCameraFrame];

  [(MKLookAroundView *)self _setInitialLocationInfo];
}

- (void)_enterLookAroundForMuninViewState:(id)a3
{
  uint64_t v4 = (GEOMuninViewState *)a3;
  [(MKLookAroundView *)self _resetViewState];
  self->_hasEnteredLookAround = 1;
  muninViewState = self->_muninViewState;
  self->_muninViewState = v4;
  id v6 = v4;

  [(VKMapView *)self->_lookAroundView setMapType:11];
  id v17 = [(GEOMuninViewState *)v6 cameraFrame];
  [v17 latitude];
  double v8 = v7;
  [v17 longitude];
  double v10 = v9;
  lookAroundView = self->_lookAroundView;
  [v17 altitude];
  double v13 = v12;
  [v17 yaw];
  double v15 = v14;
  [v17 pitch];
  -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](lookAroundView, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, 0, v8, v10, v13, v15, v16, 0.0);
}

- (void)reset
{
  [(MKLookAroundView *)self _resetViewState];
  [(VKMapView *)self->_lookAroundView setMapType:7];
  lookAroundView = self->_lookAroundView;

  [(VKMapView *)lookAroundView forceFrame];
}

- (BOOL)cancelPendingMove
{
  int v3 = [(MKLookAroundView *)self hasEnteredLookAround];
  if (v3)
  {
    lookAroundView = self->_lookAroundView;
    LOBYTE(v3) = [(VKMapView *)lookAroundView cancelPendingMove];
  }
  return v3;
}

- (VKMuninMarker)muninMarker
{
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    int v3 = [(VKMapView *)self->_lookAroundView currentMarker];
  }
  else
  {
    int v3 = 0;
  }

  return (VKMuninMarker *)v3;
}

- (void)openInMapsWithCompletionHandler:(id)a3
{
  id v6 = (void (**)(id, void))a3;
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    uint64_t v4 = +[MKSystemController sharedInstance];
    BOOL v5 = [(MKLookAroundView *)self sharingURL];
    [v4 openURL:v5 completionHandler:v6];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (VKLabelMarker)selectedLabelMarker
{
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    int v3 = [(VKMapView *)self->_lookAroundView selectedLabelMarker];
  }
  else
  {
    int v3 = 0;
  }

  return (VKLabelMarker *)v3;
}

- (BOOL)adequatelyDrawn
{
  BOOL v3 = [(MKLookAroundView *)self hasEnteredLookAround];
  if (v3) {
    LOBYTE(v3) = [(VKMapView *)self->_lookAroundView getSceneState] != 0;
  }
  return v3;
}

- (BOOL)isLoading
{
  return [(VKMapView *)self->_lookAroundView getSceneState] != 2
      && [(VKMapView *)self->_lookAroundView getSceneState] != 3
      && [(VKMapView *)self->_lookAroundView getSceneState] != 4;
}

- (BOOL)moveToMapItem:(id)a3 wantsCloseUpView:(BOOL)a4 orMuninMarker:(id)a5 withHeading:(double)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  double v14 = (void (**)(id, void))a7;
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    if ([v12 _hasLookAroundStorefront])
    {
      [(MKLookAroundView *)self _resetViewState];
      double v15 = [v12 _geoMapItem];
      double v16 = [v15 _storefrontPresentationInfo];

      if (a4)
      {
        id v17 = [v16 closeUpView];
      }
      else
      {
        double v20 = [v16 standOffView];
        double v21 = v20;
        if (v20)
        {
          id v22 = v20;
        }
        else
        {
          id v22 = [v16 closeUpView];
        }
        id v17 = v22;
      }
      self->_storefrontFullyDrawn = 0;
      self->_moveToStorefrontViewInProgress = 0;
      requestedStorefrontView = self->_requestedStorefrontView;
      self->_requestedStorefrontView = 0;

      self->_wantsStorefrontCloseUpView = 0;
      int v18 = [(MKLookAroundView *)self _moveToStorefrontView:v17 animated:0 completionHandler:v14];
      if (v18) {
        double v24 = v12;
      }
      else {
        double v24 = 0;
      }
      objc_storeStrong((id *)&self->_mapItem, v24);

      goto LABEL_21;
    }
    if (v13)
    {
      int v18 = [(VKMapView *)self->_lookAroundView moveToMarker:v13 withHeading:0 animated:v14 completionHandler:a6];
      if (v18) {
        double v19 = v12;
      }
      else {
        double v19 = 0;
      }
      objc_storeStrong((id *)&self->_mapItem, v19);
      goto LABEL_21;
    }
  }
  if (v14) {
    v14[2](v14, 0);
  }
  LOBYTE(v18) = 0;
LABEL_21:

  return v18;
}

- (BOOL)tapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(MKLookAroundView *)self hasEnteredLookAround];
  if (v6)
  {
    mapItem = self->_mapItem;
    self->_mapItem = 0;

    if (-[VKMapView tapAtPoint:](self->_lookAroundView, "tapAtPoint:", x, y))
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      [(MKHapticEngine *)self->_hapticEngine prepare];
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)jumpToCloseUpView
{
  BOOL v3 = [(MKMapItem *)self->_mapItem _geoMapItem];
  id v7 = [v3 _storefrontPresentationInfo];

  uint64_t v4 = [v7 closeUpView];

  if (v4)
  {
    lookAroundView = self->_lookAroundView;
    BOOL v6 = [v7 closeUpView];
    [(VKMapView *)lookAroundView enterMuninForStorefrontView:v6 secondaryStorefrontView:0];

    [(VKMapView *)self->_lookAroundView forceLayout];
  }
}

- (void)jumpToStandOffView
{
  BOOL v3 = [(MKMapItem *)self->_mapItem _geoMapItem];
  id v10 = [v3 _storefrontPresentationInfo];

  uint64_t v4 = [v10 standOffView];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v10 closeUpView];
  }
  id v7 = v6;

  double v8 = [v10 standOffView];
  if (v8)
  {
    double v9 = [v10 closeUpView];
  }
  else
  {
    double v9 = 0;
  }

  if (v7)
  {
    [(VKMapView *)self->_lookAroundView enterMuninForStorefrontView:v7 secondaryStorefrontView:v9];
    [(VKMapView *)self->_lookAroundView forceLayout];
  }
}

- (BOOL)_moveToStorefrontView:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    p_requestedStorefrontView = &self->_requestedStorefrontView;
    objc_storeStrong((id *)&self->_requestedStorefrontView, a3);
    if (self->_moveToStorefrontViewInProgress)
    {
      self->_wantsStorefrontCloseUpView = 0;
      char v12 = 1;
    }
    else
    {
      self->_moveToStorefrontViewInProgress = 1;
      id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 postNotificationName:@"MKLookAroundViewWillMoveToStorefront" object:self userInfo:0];
      objc_initWeak(&location, self);
      lookAroundView = self->_lookAroundView;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __69__MKLookAroundView__moveToStorefrontView_animated_completionHandler___block_invoke;
      v19[3] = &unk_1E54B8768;
      objc_copyWeak(&v23, &location);
      id v15 = v13;
      id v20 = v15;
      id v21 = v9;
      BOOL v24 = v6;
      id v16 = v10;
      id v22 = v16;
      char v12 = [(VKMapView *)lookAroundView moveToStorefrontView:v21 animated:v6 completionHandler:v19];
      if ((v12 & 1) == 0)
      {
        self->_moveToStorefrontViewInProgress = 0;
        id v17 = *p_requestedStorefrontView;
        *p_requestedStorefrontView = 0;

        if (v16) {
          (*((void (**)(id, uint64_t))v16 + 2))(v16, 1);
        }
      }

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

void __69__MKLookAroundView__moveToStorefrontView_animated_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 595) = 0;
    BOOL v6 = *(void **)(a1 + 32);
    char v12 = WeakRetained;
    id v7 = objc_loadWeakRetained(v4);
    [v6 postNotificationName:@"MKLookAroundViewDidMoveToStorefront" object:v7 userInfo:0];

    id v8 = v12[77];
    id v9 = v8;
    if (!v8 || v8 == *(id *)(a1 + 40))
    {
      id v10 = v12[77];
      v12[77] = 0;

      uint64_t v11 = *(void *)(a1 + 48);
      if (v11) {
        (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, a2);
      }
    }
    else
    {
      [v12 _moveToStorefrontView:v8 animated:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 48)];
    }

    WeakRetained = v12;
  }
}

- (void)moveToCloseUpView
{
}

- (void)moveToCloseUpViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    BOOL v5 = [(MKMapItem *)self->_mapItem _geoMapItem];
    id v9 = [v5 _storefrontPresentationInfo];

    BOOL v6 = [v9 closeUpView];

    id v7 = v9;
    if (v6)
    {
      if (self->_storefrontFullyDrawn || !v3)
      {
        id v8 = [v9 closeUpView];
        [(MKLookAroundView *)self _moveToStorefrontView:v8 animated:v3 completionHandler:0];

        id v7 = v9;
      }
      else
      {
        self->_wantsStorefrontCloseUpView = 1;
      }
    }
  }
}

- (void)moveToStandOffView
{
}

- (void)moveToStandOffViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    BOOL v5 = [(MKMapItem *)self->_mapItem _geoMapItem];
    id v8 = [v5 _storefrontPresentationInfo];

    BOOL v6 = [v8 standOffView];

    if (v6)
    {
      id v7 = [v8 standOffView];
      [(MKLookAroundView *)self _moveToStorefrontView:v7 animated:v3 completionHandler:0];
    }
  }
}

- (void)selectLabelMarker:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    if (v4)
    {
      BOOL v5 = NSString;
      BOOL v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      id v8 = [v5 stringWithFormat:@"<%@: %p>", v7, v4];
    }
    else
    {
      id v8 = @"nil";
    }
    id v9 = MKGetMKLookAroundLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      id v15 = self;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_DEBUG, "<MKLookAroundView: %p> -selectLabelMarker:%@", buf, 0x16u);
    }

    if (v4 && [v4 hasBusinessID])
    {
      mapItem = self->_mapItem;
      self->_mapItem = 0;

      [(MKLookAroundView *)self _refineLabelMarker:v4];
      objc_initWeak((id *)buf, self);
      lookAroundView = self->_lookAroundView;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __38__MKLookAroundView_selectLabelMarker___block_invoke;
      v12[3] = &unk_1E54B8790;
      objc_copyWeak(&v13, (id *)buf);
      [(VKMapView *)lookAroundView selectLabelMarker:v4 completion:v12];
      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __38__MKLookAroundView_selectLabelMarker___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if (a2)
    {
      id v4 = [WeakRetained selectedLabelMarker];
      if (v4)
      {
        BOOL v5 = [v6 delegate];
        [v5 lookAroundView:v6 didSelectLabelMarker:v4];
      }
    }
    else
    {
      [WeakRetained deselectLabelMarker];
    }
    id WeakRetained = v6;
  }
}

- (void)deselectLabelMarker
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    BOOL v3 = MKGetMKLookAroundLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134217984;
      id v8 = self;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "<MKLookAroundView: %p> -deselectLabelMarker", (uint8_t *)&v7, 0xCu);
    }

    mapItem = self->_mapItem;
    self->_mapItem = 0;

    BOOL v5 = [(VKMapView *)self->_lookAroundView selectedLabelMarker];
    if (v5)
    {
      [(VKMapView *)self->_lookAroundView deselectLabelMarker];
      id v6 = [(MKLookAroundView *)self delegate];
      [v6 lookAroundView:self didDeselectLabelMarker:v5];
    }
  }
}

- (void)recordTriggerAction:(int)a3
{
  if (a3)
  {
    BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
    startTime = self->_startTime;
    self->_startTime = v5;

    self->_triggerAction = a3;
  }
}

- (id)labelMarkerForCustomFeatureAnnotation:(id)a3
{
  id v4 = a3;
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    BOOL v5 = [(VKMapView *)self->_lookAroundView labelMarkerForCustomFeatureAnnotation:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)addCustomFeatureDataSource:(id)a3
{
}

- (void)removeCustomFeatureDataSource:(id)a3
{
}

- (void)lookAroundGestureControllerDidStartUserInteraction:(id)a3
{
  id v4 = [(MKLookAroundView *)self delegate];
  [v4 lookAroundViewDidStartUserInteraction:self];
}

- (void)lookAroundGestureControllerDidStopUserInteraction:(id)a3
{
  id v4 = [(MKLookAroundView *)self delegate];
  [v4 lookAroundViewDidStopUserInteraction:self];
}

- (void)lookAroundGestureController:(id)a3 didTapLabelMarker:(id)a4
{
  id v5 = a4;
  id v6 = [(MKLookAroundView *)self delegate];
  [v6 lookAroundView:self didTapLabelMarker:v5];
}

- (void)lookAroundGestureController:(id)a3 didTapAtPoint:(CGPoint)a4 areaAvailable:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  id v9 = [(MKLookAroundView *)self delegate];
  objc_msgSend(v9, "lookAroundView:didTapAtPoint:areaAvailable:", self, v5, x, y);
}

- (void)lookAroundGestureController:(id)a3 didZoomWithDirection:(int64_t)a4 type:(int64_t)a5
{
  id v8 = [(MKLookAroundView *)self delegate];
  [v8 lookAroundView:self didZoomWithDirection:a4 type:a5];
}

- (void)lookAroundGestureControllerDidPan:(id)a3
{
  id v4 = [(MKLookAroundView *)self delegate];
  [v4 lookAroundViewDidPan:self];
}

- (BOOL)lookAroundGestureControllerShouldReceive:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  id v6 = [(MKLookAroundView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(MKLookAroundView *)self delegate];
    char v9 = [v8 lookAroundView:self shouldReceiveTouch:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)mapLayerDidChangeVisibleRegion
{
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    [(MKLookAroundView *)self _updateCameraFrame];
    [(MKLookAroundView *)self _updateCompass];
    BOOL v3 = [(MKLookAroundView *)self muninViewState];
    id v7 = [v3 cameraFrame];

    [v7 latitude];
    double v5 = v4;
    [v7 longitude];
    -[MKLookAroundView _updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:](self, "_updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:", 0, v5, v6);
  }
}

- (void)mapLayerWillChangeRegionAnimated:(BOOL)a3
{
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    if (!self->_didStartRegionChange && !self->_didChangeCameraFrame)
    {
      self->_didStartRegionChange = 1;
      double v4 = [(MKLookAroundView *)self delegate];
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        id v6 = [(MKLookAroundView *)self delegate];
        [v6 lookAroundViewWillChangeRegion:self];
      }
    }
  }
}

- (void)mapLayerDidChangeRegionAnimated:(BOOL)a3
{
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    if (self->_didStartRegionChange)
    {
      self->_didStartRegionChange = 0;
      self->_didChangeCameraFrame = 0;
      double v4 = [(MKLookAroundView *)self delegate];
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        id v6 = [(MKLookAroundView *)self delegate];
        [v6 lookAroundViewDidChangeRegion:self];
      }
    }
    [(MKLookAroundView *)self _updateCameraFrame];
    [(MKLookAroundView *)self _updateCompass];
    id v7 = [(MKLookAroundView *)self muninViewState];
    id v11 = [v7 cameraFrame];

    [v11 latitude];
    double v9 = v8;
    [v11 longitude];
    -[MKLookAroundView _updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:](self, "_updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:", 1, v9, v10);
  }
}

- (void)mapLayer:(id)a3 nearestJunctionDidChange:(id)a4 currentRoad:(id)a5
{
  id v34 = a4;
  id v7 = a5;
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    uint64_t v8 = [v34 name];
    if (v8
      && (double v9 = (void *)v8,
          [v34 name],
          double v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 length],
          v10,
          v9,
          v11))
    {
      char v12 = NSString;
      id v13 = _MKLocalizedStringFromThisBundle(@"%@");
      double v14 = [v34 name];
      objc_msgSend(v12, "stringWithFormat:", v13, v14);
      id v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      lastJunctionName = self->_lastJunctionName;
      self->_lastJunctionName = v15;
    }
    else
    {
      id v17 = [v7 roadName];
      if ([v17 length])
      {
        uint64_t v18 = [v34 roads];
        unint64_t v19 = [v18 count];

        if (v19 >= 2)
        {
          id v13 = [v7 roadName];
          id v20 = [v34 roads];
          id v21 = [v20 objectAtIndexedSubscript:0];
          id v22 = [v21 roadName];
          id v23 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v22, "isEqualToString:", v13));
          BOOL v24 = [v23 roadName];

          if ([v24 length])
          {
            double v25 = NSString;
            double v26 = _MKLocalizedStringFromThisBundle(@"%@ & %@");
            objc_msgSend(v25, "stringWithFormat:", v26, v13, v24);
            double v27 = (NSString *)objc_claimAutoreleasedReturnValue();
            double v28 = self->_lastJunctionName;
            self->_lastJunctionName = v27;
          }
          else
          {
            double v26 = self->_lastJunctionName;
            self->_lastJunctionName = 0;
          }

          goto LABEL_13;
        }
      }
      else
      {
      }
      id v13 = self->_lastJunctionName;
      self->_lastJunctionName = 0;
    }
LABEL_13:

    double v29 = [(MKLookAroundView *)self muninViewState];
    id v30 = [v29 cameraFrame];

    [v30 latitude];
    double v32 = v31;
    [v30 longitude];
    -[MKLookAroundView _updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:](self, "_updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:", 0, v32, v33);
  }
}

- (void)mapLayerWillAnimateToLocation:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    -[MKLookAroundView _updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:](self, "_updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:", 1, var0, var1);
    id v6 = [(MKLookAroundView *)self delegate];
    [v6 lookAroundViewWillChangeLocationInfo:self];
  }
}

- (void)mapLayerWasUnableToAnimate
{
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    [(MKHapticEngine *)self->_hapticEngine playFailure];
    [(MKLookAroundBumpFlash *)self->_bumpFlashView flash];
    BOOL v3 = MKGetMKLookAroundLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v4 = 0;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_ERROR, "MKLookAroundView - No path available to target point", v4, 2u);
    }
  }
}

- (void)mapLayerDidChangeSceneState:(id)a3 withState:(unint64_t)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v7 = v6;
    if (a4)
    {
      if (!self->_didTriggerAdequatelyDrawnNotification)
      {
        [v6 postNotificationName:@"MKLookAroundViewDidBecomeAdequatelyDrawn" object:self];
        self->_didTriggerAdequatelyDrawnNotification = 1;
        uint64_t v8 = [(UIImageView *)self->_transitionGridImageview superview];

        if (v8)
        {
          v20[4] = self;
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __58__MKLookAroundView_mapLayerDidChangeSceneState_withState___block_invoke;
          v21[3] = &unk_1E54B8188;
          v21[4] = self;
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __58__MKLookAroundView_mapLayerDidChangeSceneState_withState___block_invoke_2;
          v20[3] = &unk_1E54B86F0;
          objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_animateWithDuration:animations:completion:", v21, v20, 0.200000003);
        }
      }
      if (a4 - 1 < 2) {
        goto LABEL_26;
      }
      if (a4 == 3)
      {
LABEL_17:
        unint64_t v13 = a4 - 3;
        if (self->_didChangeCameraFrame && !self->_didStartRegionChange)
        {
          self->_didChangeCameraFrame = 0;
          double v14 = [(MKLookAroundView *)self delegate];
          char v15 = objc_opt_respondsToSelector();

          if (v15)
          {
            __int16 v16 = [(MKLookAroundView *)self delegate];
            [v16 lookAroundViewDidChangeRegion:self];
          }
        }
        id v22 = @"hasFailedTiles";
        id v17 = [NSNumber numberWithBool:v13 < 2];
        v23[0] = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
        [v7 postNotificationName:@"MKLookAroundViewDidBecomeFullyDrawn" object:self userInfo:v18];

        goto LABEL_23;
      }
      if (a4 == 4)
      {
LABEL_26:
        if (!self->_hasValidViewState)
        {
          [(MKLookAroundView *)self mapLayerDidChangeVisibleRegion];
          self->_hasValidViewState = 1;
        }
        if ([(MKMapItem *)self->_mapItem _hasLookAroundStorefront])
        {
          self->_storefrontFullyDrawn = 1;
          if (self->_wantsStorefrontCloseUpView)
          {
            self->_wantsStorefrontCloseUpView = 0;
            [(MKLookAroundView *)self moveToCloseUpView];
          }
        }
        if (self->_triggerAction)
        {
          [(NSDate *)self->_startTime timeIntervalSinceNow];
          double v10 = (void *)MEMORY[0x1E4F63E30];
          uint64_t triggerAction = self->_triggerAction;
          char v12 = [NSNumber numberWithDouble:v9 * -1000.0];
          LODWORD(v19) = 0;
          [v10 captureDisplayAnalyticWithDisplayActionTrigger:triggerAction requiredResourcesAvailable:0 totalTime:v12 requestedImageCount:0 renderedImageCount:0 movementDistance:0 meanImageSpacing:0 displayEvent:v19];

          self->_uint64_t triggerAction = 0;
        }
        if (a4 - 2 > 2) {
          goto LABEL_23;
        }
        goto LABEL_17;
      }
    }
    else
    {
      self->_didTriggerAdequatelyDrawnNotification = 0;
    }
LABEL_23:
  }
}

uint64_t __58__MKLookAroundView_mapLayerDidChangeSceneState_withState___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:0.0];
}

uint64_t __58__MKLookAroundView_mapLayerDidChangeSceneState_withState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 440) removeFromSuperview];
}

- (void)_handleCompassSelect
{
}

- (id)_locationInfoWithHeading:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = self->_lastGroundViews;
  char v5 = (void *)[(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "isHeadingInRange:", a3, (void)v10))
        {
          char v5 = [v8 locationInfo];
          goto LABEL_11;
        }
      }
      char v5 = (void *)[(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)_pointContainedInCompassView:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  BOOL result = 0;
  if (![(MKLookAroundView *)self isCompassHidden])
  {
    [(MKCompassView *)self->_compassView frame];
    CGRect v9 = CGRectInset(v8, -9.0, -9.0);
    v7.CGFloat x = x;
    v7.CGFloat y = y;
    if (CGRectContainsPoint(v9, v7)) {
      return 1;
    }
  }
  return result;
}

- (void)_refineLabelMarker:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 coordinate];
  double v6 = v5;
  [v4 coordinate];
  CGRect v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F646B8]), "initWithMUID:coordinate:", objc_msgSend(v4, "businessID"), v6, v7);
  CGRect v9 = [[MKMapItemIdentifier alloc] initWithGEOMapItemIdentifier:v8];
  [(MKMapServiceTicket *)self->_refineTicket cancel];
  long long v10 = +[MKMapService sharedService];
  v20[0] = v9;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  long long v12 = [v10 ticketForIdentifiers:v11 traits:0];
  refineTicket = self->_refineTicket;
  self->_refineTicket = v12;

  objc_initWeak(&location, self);
  double v14 = self->_refineTicket;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __39__MKLookAroundView__refineLabelMarker___block_invoke;
  v16[3] = &unk_1E54B87E0;
  objc_copyWeak(&v18, &location);
  id v15 = v4;
  id v17 = v15;
  [(MKMapServiceTicket *)v14 submitWithHandler:v16 networkActivity:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __39__MKLookAroundView__refineLabelMarker___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    CGRect v8 = MKGetMKLookAroundLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_ERROR, "Error: Identifier refinement ticket failed: %@", buf, 0xCu);
    }
  }
  else if ([v5 count])
  {
    CGRect v9 = [v5 firstObject];
    objc_initWeak((id *)buf, WeakRetained);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__MKLookAroundView__refineLabelMarker___block_invoke_2;
    block[3] = &unk_1E54B87B8;
    objc_copyWeak(&v14, (id *)buf);
    id v12 = *(id *)(a1 + 32);
    id v13 = v9;
    id v10 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __39__MKLookAroundView__refineLabelMarker___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    BOOL v3 = [WeakRetained selectedLabelMarker];
    id v4 = *(void **)(a1 + 32);

    if (v3 == v4)
    {
      objc_storeStrong(v6 + 75, *(id *)(a1 + 40));
      [v6 _updateLocationInfo];
    }
    id v5 = v6[68];
    v6[68] = 0;

    id WeakRetained = v6;
  }
}

- (void)_resetViewState
{
  self->_hasValidViewState = 0;
  self->_lastCoordinate = (CLLocationCoordinate2D)MKCoordinateInvalid;
  lastGroundViews = self->_lastGroundViews;
  self->_lastGroundViews = 0;

  lastJunctionName = self->_lastJunctionName;
  self->_lastJunctionName = 0;

  mapItem = self->_mapItem;
  self->_mapItem = 0;

  revGeoMapItem = self->_revGeoMapItem;
  self->_revGeoMapItem = 0;

  [(MKMapServiceTicket *)self->_refineTicket cancel];
  refineTicket = self->_refineTicket;
  self->_refineTicket = 0;

  [(MKMapServiceTicket *)self->_revGeoTicket cancel];
  revGeoTicket = self->_revGeoTicket;
  self->_revGeoTicket = 0;

  self->_storefrontFullyDrawn = 0;
}

- (void)_reverseGeocodeCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  self->_lastCoordinate = a3;
  [(MKMapServiceTicket *)self->_revGeoTicket cancel];
  id v6 = +[MKMapService sharedService];
  objc_msgSend(v6, "ticketForReverseGeocodeCoordinate:traits:", 0, latitude, longitude);
  double v7 = (MKMapServiceTicket *)objc_claimAutoreleasedReturnValue();
  revGeoTicket = self->_revGeoTicket;
  self->_revGeoTicket = v7;

  objc_initWeak(&location, self);
  CGRect v9 = self->_revGeoTicket;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__MKLookAroundView__reverseGeocodeCoordinate___block_invoke;
  v10[3] = &unk_1E54B8830;
  objc_copyWeak(&v11, &location);
  [(MKMapServiceTicket *)v9 submitWithHandler:v10 networkActivity:0];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __46__MKLookAroundView__reverseGeocodeCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    CGRect v8 = MKGetMKLookAroundLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_ERROR, "Error: ReverseGeocodeCoordinate ticket failed: %@", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if ([v5 count])
  {
    CGRect v9 = [v5 firstObject];
    id v10 = [MEMORY[0x1E4F1CA48] array];
    id v11 = [v9 _geoMapItem];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__MKLookAroundView__reverseGeocodeCoordinate___block_invoke_2;
    v18[3] = &unk_1E54B8808;
    id v12 = v10;
    id v19 = v12;
    [v11 iterateGroundViewsWithBlock:v18];

    objc_initWeak((id *)buf, WeakRetained);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__MKLookAroundView__reverseGeocodeCoordinate___block_invoke_3;
    v14[3] = &unk_1E54B87B8;
    objc_copyWeak(&v17, (id *)buf);
    id v15 = v12;
    id v16 = v9;
    id v13 = v9;
    CGRect v8 = v12;
    dispatch_async(MEMORY[0x1E4F14428], v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);

LABEL_6:
  }
}

void __46__MKLookAroundView__reverseGeocodeCoordinate___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, double a5, double a6)
{
  id v10 = *(void **)(a1 + 32);
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id v14 = [[MKLookAroundGroundViewInfo alloc] initWithStartHeading:v13 endHeading:v12 localityName:v11 locationName:a5 secondaryLocationName:a6];

  [v10 addObject:v14];
}

void __46__MKLookAroundView__reverseGeocodeCoordinate___block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if ([a1[4] count])
    {
      uint64_t v3 = [a1[4] copy];
      id v4 = (void *)*((void *)v6 + 66);
      *((void *)v6 + 66) = v3;

      objc_storeStrong((id *)v6 + 76, a1[5]);
      [v6 _updateLocationInfo];
    }
    id v5 = (void *)*((void *)v6 + 69);
    *((void *)v6 + 69) = 0;

    id WeakRetained = v6;
  }
}

- (void)_updateCameraFrame
{
  uint64_t v3 = [(MKLookAroundView *)self muninViewState];
  id v15 = [v3 cameraFrame];

  id v4 = objc_opt_new();
  [(VKMapView *)self->_lookAroundView centerCoordinate];
  objc_msgSend(v4, "setLatitude:");
  [(VKMapView *)self->_lookAroundView centerCoordinate];
  [v4 setLongitude:v5];
  [(VKMapView *)self->_lookAroundView altitude];
  objc_msgSend(v4, "setAltitude:");
  [(VKMapView *)self->_lookAroundView yaw];
  double v7 = fmod(v6, 360.0);
  if (v7 < 0.0) {
    double v7 = v7 + 360.0;
  }
  [v4 setYaw:v7];
  [(VKMapView *)self->_lookAroundView pitch];
  objc_msgSend(v4, "setPitch:");
  [v4 setRoll:0.0];
  if (([v4 isEqual:v15] & 1) == 0)
  {
    CGRect v8 = objc_opt_new();
    [v8 setCameraFrame:v4];
    CGRect v9 = [(MKLookAroundView *)self muninViewState];
    id v10 = [v9 locationInfo];
    [v8 setLocationInfo:v10];

    objc_storeStrong((id *)&self->_muninViewState, v8);
    if (!self->_didChangeCameraFrame && !self->_didStartRegionChange)
    {
      self->_didChangeCameraFrame = 1;
      id v11 = [(MKLookAroundView *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        id v13 = [(MKLookAroundView *)self delegate];
        [v13 lookAroundViewWillChangeRegion:self];
      }
    }
    id v14 = [(MKLookAroundView *)self delegate];
    [v14 lookAroundView:self didChangeCameraFrame:v4];
  }
}

- (void)_updateCompass
{
  [(VKMapView *)self->_lookAroundView heading];
  compassView = self->_compassView;

  -[MKCompassView setMapHeading:](compassView, "setMapHeading:");
}

- (void)_updateCompassInsets
{
  p_compassInsets = &self->_compassInsets;
  [(NSLayoutConstraint *)self->_compassTopOrBottomConstraint setConstant:self->_compassInsets.top];
  uint64_t v4 = [(MKLookAroundView *)self effectiveUserInterfaceLayoutDirection];
  uint64_t v5 = 24;
  if (v4 == 1) {
    uint64_t v5 = 8;
  }
  [(NSLayoutConstraint *)self->_compassTrailingConstraint setConstant:-*(double *)((char *)&p_compassInsets->top + v5)];

  [(MKLookAroundView *)self setNeedsLayout];
}

- (void)_setInitialLocationInfo
{
  uint64_t v3 = [(MKLookAroundView *)self muninViewState];
  id v7 = [v3 cameraFrame];

  [v7 latitude];
  double v5 = v4;
  [v7 longitude];
  -[MKLookAroundView _updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:](self, "_updateLocationInfoForCoordinate:allowReverseGeocodeIfNeeded:", 1, v5, v6);
}

- (void)_updateLocationInfo
{
  uint64_t v3 = [(MKLookAroundView *)self muninViewState];
  id v20 = [v3 locationInfo];

  double v4 = (void *)[v20 copy];
  double v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  id v7 = v6;

  CGRect v8 = [(MKLookAroundView *)self muninViewState];
  CGRect v9 = [v8 cameraFrame];
  [v9 yaw];
  uint64_t v10 = -[MKLookAroundView _locationInfoWithHeading:](self, "_locationInfoWithHeading:");
  id v11 = (void *)v10;
  if (v10) {
    char v12 = (void *)v10;
  }
  else {
    char v12 = v7;
  }
  id v13 = v12;

  if (self->_lastJunctionName)
  {
    id v14 = (void *)[v13 copy];

    [v14 setLocationName:self->_lastJunctionName];
    id v13 = v14;
  }
  if (([v13 isEqual:v20] & 1) == 0)
  {
    id v15 = objc_opt_new();
    id v16 = [(MKLookAroundView *)self muninViewState];
    id v17 = [v16 cameraFrame];
    [v15 setCameraFrame:v17];

    [v15 setLocationInfo:v13];
    muninViewState = self->_muninViewState;
    self->_muninViewState = (GEOMuninViewState *)v15;

    id v19 = [(MKLookAroundView *)self delegate];
    [v19 lookAroundView:self didChangeLocationInfo:v13];
  }
}

- (void)_updateLocationInfoForCoordinate:(CLLocationCoordinate2D)a3 allowReverseGeocodeIfNeeded:(BOOL)a4
{
  if (vabdd_f64(a3.latitude, self->_lastCoordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(a3.longitude, self->_lastCoordinate.longitude) >= 0.00000000999999994)
  {
    if (a4) {
      -[MKLookAroundView _reverseGeocodeCoordinate:](self, "_reverseGeocodeCoordinate:");
    }
  }
  else if (!self->_revGeoTicket)
  {
    [(MKLookAroundView *)self _updateLocationInfo];
  }
}

- (NSArray)visiblePlaceMUIDs
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v4 = [(VKMapView *)self->_lookAroundView labelMarkers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          CGRect v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v9 featureType] == 14 && objc_msgSend(v9, "featureID"))
          {
            uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "featureID"));
            [v3 addObject:v10];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    id v11 = (void *)[v3 copy];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v11;
}

- (NSArray)visibleRoadLabels
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v4 = [(VKMapView *)self->_lookAroundView labelMarkers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          CGRect v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v9 featureType] == 15) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    uint64_t v10 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v10;
}

- (NSArray)imageResources
{
  if ([(MKLookAroundView *)self hasEnteredLookAround])
  {
    id v3 = [(VKMapView *)self->_lookAroundView onscreenImageResources];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v3;
}

- (id)_imageFromLookAroundView
{
  [(VKMapView *)self->_lookAroundView frame];
  v8.double width = v3;
  v8.double height = v4;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  [(VKMapView *)self->_lookAroundView renderInContext:UIGraphicsGetCurrentContext()];
  uint64_t v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v5;
}

- (void)setLookAroundView:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (UIEdgeInsets)compassInsets
{
  double top = self->_compassInsets.top;
  double left = self->_compassInsets.left;
  double bottom = self->_compassInsets.bottom;
  double right = self->_compassInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)hasEnteredLookAround
{
  return self->_hasEnteredLookAround;
}

- (void)setHasEnteredLookAround:(BOOL)a3
{
  self->_hasEnteredLookAround = a3;
}

- (BOOL)navigatingEnabled
{
  return self->_navigatingEnabled;
}

- (BOOL)panningEnabled
{
  return self->_panningEnabled;
}

- (BOOL)zoomingEnabled
{
  return self->_zoomingEnabled;
}

- (MKLookAroundViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKLookAroundViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return self->_pointOfInterestFilter;
}

- (GEOMuninViewState)muninViewState
{
  return self->_muninViewState;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (MKMapItem)revGeoMapItem
{
  return self->_revGeoMapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muninViewState, 0);
  objc_storeStrong((id *)&self->_pointOfInterestFilter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hapticEngine, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_requestedStorefrontView, 0);
  objc_storeStrong((id *)&self->_revGeoMapItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_revGeoTicket, 0);
  objc_storeStrong((id *)&self->_refineTicket, 0);
  objc_storeStrong((id *)&self->_lastJunctionName, 0);
  objc_storeStrong((id *)&self->_lastGroundViews, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_gestureController, 0);
  objc_storeStrong((id *)&self->_bumpFlashView, 0);
  objc_storeStrong((id *)&self->_compassSelectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_compassTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_compassTopOrBottomConstraint, 0);
  objc_storeStrong((id *)&self->_compassView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_transitionGridImageview, 0);
  objc_storeStrong((id *)&self->_transitionEndImageview, 0);
  objc_storeStrong((id *)&self->_transitionStartImageview, 0);

  objc_storeStrong((id *)&self->_hostView, 0);
}

- (id)_mapkit_locationTitle
{
  double v2 = [(MKLookAroundView *)self muninViewState];
  CGFloat v3 = [v2 locationInfo];

  CGFloat v4 = [v3 locationName];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [v3 locationName];
  }
  else
  {
    uint64_t v6 = &stru_1ED919588;
  }

  return v6;
}

- (id)_mapkit_locationSubtitle
{
  double v2 = [(MKLookAroundView *)self muninViewState];
  CGFloat v3 = [v2 locationInfo];

  CGFloat v4 = [v3 secondaryLocationName];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [v3 secondaryLocationName];
  }
  else
  {
    uint64_t v6 = &stru_1ED919588;
  }
  uint64_t v7 = [v3 localityName];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    if ([(__CFString *)v6 length])
    {
      uint64_t v9 = [(__CFString *)v6 stringByAppendingString:@", "];

      uint64_t v6 = (__CFString *)v9;
    }
    uint64_t v10 = [v3 localityName];
    uint64_t v11 = [(__CFString *)v6 stringByAppendingString:v10];

    uint64_t v6 = (__CFString *)v11;
  }

  return v6;
}

@end