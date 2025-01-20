@interface MKAnnotationView
+ (BOOL)_followsTerrain;
+ (BOOL)_isInitiallyHiddenWhenAdded;
+ (BOOL)_wantsViewBasedPositioning;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (Class)_mapkitLeafClass;
+ (Class)calloutViewClass;
+ (float)_defaultDisplayPriority;
+ (id)_compactCalloutAccessory;
+ (id)_disclosureCalloutButton;
+ (id)_fullCalloutAccessory;
+ (id)_openInMapsAccessory;
+ (id)_sheetAccessoryWithViewController:(id)a3;
+ (unint64_t)_selectedZIndex;
+ (unint64_t)_zIndex;
- ($6EFE6C6748B912A6EAC8A8E593ED1344)_mapDisplayStyle;
- (BOOL)_calloutPermitsSelectionAccessory;
- (BOOL)_canDisplayDisclosureInCallout;
- (BOOL)_canDisplayPlacemarkInCallout;
- (BOOL)_canShowSelectionAccessory:(id)a3;
- (BOOL)_hasAlternateOrientation;
- (BOOL)_isAnimatingToCoordinate;
- (BOOL)_isHiddenForReason:(unint64_t)a3;
- (BOOL)_isPendingSelectionAnimated;
- (BOOL)_isProvidingVKLabelContents;
- (BOOL)_isSelectable;
- (BOOL)_isTracking;
- (BOOL)_shouldDeselectWhenDragged;
- (BOOL)_shouldKeepCalloutVisible;
- (BOOL)_shouldShowCalloutIfSelected;
- (BOOL)_skipDrawingForSnapshots;
- (BOOL)_titleRequiresCustomFeature;
- (BOOL)_viewportCanDisplayCompactCalloutAccessory;
- (BOOL)_viewportCanDisplayFullCalloutAccessory;
- (BOOL)canShowCallout;
- (BOOL)isCollidingWithAnnotationView:(id)a3 previouslyCollided:(BOOL)a4;
- (BOOL)isDraggable;
- (BOOL)isEnabled;
- (BOOL)isHidden;
- (BOOL)isHighlighted;
- (BOOL)isPersistent;
- (BOOL)isProvidingCustomFeature;
- (BOOL)isSelected;
- (BOOL)shouldShowCallout;
- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3;
- (CGPoint)_anchorPoint;
- (CGPoint)_anchorPointForCalloutAnchorPosition:(int64_t)a3;
- (CGPoint)_bottomCalloutOffset;
- (CGPoint)_calculateMapOffsetForPresentationFrame:(CGRect)a3;
- (CGPoint)_offsetToAnnotationView:(id)a3;
- (CGPoint)_openInMapsAnchorPoint;
- (CGPoint)accessoryOffset;
- (CGPoint)calloutOffset;
- (CGPoint)centerOffset;
- (CGPoint)leftCalloutOffset;
- (CGPoint)rightCalloutOffset;
- (CGRect)_calculateAccessoryFrameForSize:(CGSize)a3 anchorPosition:(int64_t)a4 anchorPoint:(CGPoint)a5 pointerHeight:(double)a6;
- (CGRect)_calculatePresentationFrameForCalloutView:(id)a3;
- (CGRect)_calculatePresentationFrameForOpenInMapsView:(id)a3;
- (CGRect)_collisionFrame;
- (CGRect)_labelDisplayFrame;
- (CGRect)_mapkit_visibleRect;
- (CGRect)_significantFrame;
- (CGSize)_effectiveMapViewportSize;
- (CLLocationCoordinate2D)_presentationCoordinate;
- (CLLocationCoordinate2D)coordinate;
- (GEORouteMatch)_routeMatch;
- (MKAnnotationView)clusterAnnotationView;
- (MKAnnotationView)initWithAnnotation:(id)annotation reuseIdentifier:(NSString *)reuseIdentifier;
- (MKAnnotationView)initWithCoder:(NSCoder *)aDecoder;
- (MKAnnotationView)initWithFrame:(CGRect)a3;
- (MKAnnotationViewCollisionMode)collisionMode;
- (MKAnnotationViewDragState)dragState;
- (MKAnnotationViewZPriority)selectedZPriority;
- (MKAnnotationViewZPriority)zPriority;
- (MKCalloutView)_calloutView;
- (MKFeatureDisplayPriority)displayPriority;
- (MKSelectionAccessoryView)_selectionAccessoryView;
- (MKUsageCounter)_usageCounter;
- (MKUserLocationAnnotationViewProxy)_userLocationProxy;
- (NSString)clusteringIdentifier;
- (NSString)reuseIdentifier;
- (UIEdgeInsets)_annotationTrackingInsets;
- (UIEdgeInsets)_collisionAlignmentRectInsets;
- (UIEdgeInsets)_defaultCollisionAlignmentRectInsets;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImage)image;
- (UIView)detailCalloutAccessoryView;
- (UIView)leftCalloutAccessoryView;
- (UIView)rightCalloutAccessoryView;
- (VKAnchorWrapper)anchor;
- (_MKStaticMapView)_staticMapView;
- (double)_direction;
- (double)_horizontalAccessoryDisplayPadding;
- (double)_labelDisplayHeight;
- (double)_mapPitchRadians;
- (double)_mapRotationRadians;
- (double)_pointsForDistance:(double)a3;
- (double)_presentationCourse;
- (double)_verticalAccessoryDisplayPadding;
- (double)alpha;
- (float)_clampZPriority:(float)a3;
- (float)_defaultSelectedZPriority;
- (float)_defaultZPriority;
- (float)_effectiveZPriority;
- (float)_selectionPriority;
- (id)_annotationContainer;
- (id)_containerView;
- (id)_customFeatureAnnotation;
- (id)_effectiveSubtitle;
- (id)_effectiveTitleIsCollidable:(BOOL *)a3;
- (id)_getPopover:(id)a3;
- (id)_hitTest:(CGPoint)a3 view:(id)a4 withEvent:(id)a5;
- (id)_mapItem;
- (id)_mapView;
- (id)_presentationCoordinateChangedCallback;
- (id)_resolvedAccessoryFor:(id)a3;
- (id)_resolvedAutomaticCalloutStyle;
- (id)_resolvedAutomaticStyleWithViewController:(id)a3;
- (id)_urlForOpenInMaps;
- (id)_vkNavigationPuckMarker;
- (id)annotation;
- (id)customFeatureAnnotation;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)snapshotViewAfterScreenUpdates:(BOOL)a3;
- (int64_t)_calloutAnchorPositionForCurrentFrame;
- (int64_t)_calloutStyle;
- (int64_t)_effectiveCalloutStyle;
- (int64_t)compareForClustering:(id)a3;
- (int64_t)compareForCollision:(id)a3;
- (int64_t)subtitleVisibility;
- (int64_t)titleVisibility;
- (unint64_t)_allowedCalloutEdges;
- (unint64_t)_featureId;
- (unint64_t)_mapType;
- (unint64_t)_orientationCount;
- (unint64_t)_reasonToDeferSelectionAccessoryPresentationStyle:(id)a3;
- (unint64_t)_zIndex;
- (void)_addAnnotationObservation;
- (void)_commonInit;
- (void)_dismissCallout:(BOOL)a3;
- (void)_dismissPresentedSelectionAccessoryFromViewController:(id)a3 animated:(BOOL)a4;
- (void)_dismissSelectionAccessoryAnimated:(BOOL)a3;
- (void)_dismissSelectionAccessoryPresentation:(id)a3 animated:(BOOL)a4;
- (void)_dismissSelectionAccessoryViewAnimated:(BOOL)a3;
- (void)_enableRotationForHeadingMode:(double)a3;
- (void)_fetchMapItemForSelectionAccessoryView;
- (void)_invalidateCachedCoordinate;
- (void)_invalidateCustomFeatureForced:(BOOL)a3 coordinates:(CLLocationCoordinate2D *)a4 count:(unint64_t)a5;
- (void)_layoutCalloutSelectionAccessoryView:(id)a3;
- (void)_layoutOpenInMapsAccessory;
- (void)_mapVisibleCenteringRectChanged;
- (void)_metricsDidChange;
- (void)_mkObserveValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)_performHideAnimationIfNeeded;
- (void)_performOffsetAnimationIfNeeded;
- (void)_performStateUpdatesIfNeeded;
- (void)_presentSelectionAccessorySheetFromViewController:(id)a3 animated:(BOOL)a4;
- (void)_removeAnnotationObservation;
- (void)_removePopover;
- (void)_setAllowedCalloutEdges:(unint64_t)a3;
- (void)_setAnimatingToCoordinate:(BOOL)a3;
- (void)_setBottomCalloutOffset:(CGPoint)a3;
- (void)_setCalloutStyle:(int64_t)a3;
- (void)_setCalloutView:(id)a3;
- (void)_setCanDisplayDisclosureInCallout:(BOOL)a3;
- (void)_setCanDisplayPlacemarkInCallout:(BOOL)a3;
- (void)_setDirection:(double)a3;
- (void)_setDragState:(unint64_t)a3 animated:(BOOL)a4;
- (void)_setFeatureId:(unint64_t)a3;
- (void)_setHidden:(BOOL)a3 forReason:(unint64_t)a4 animated:(BOOL)a5;
- (void)_setHidden:(BOOL)a3 forReason:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_setHiddenForOffscreen:(BOOL)a3;
- (void)_setMapDisplayStyle:(id)a3;
- (void)_setMapPitchRadians:(double)a3;
- (void)_setMapRotationRadians:(double)a3;
- (void)_setMapType:(unint64_t)a3;
- (void)_setPendingSelectionAnimated:(BOOL)a3;
- (void)_setPositionOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)_setPresentationCoordinate:(CLLocationCoordinate2D)a3;
- (void)_setPresentationCoordinateChangedCallback:(id)a3;
- (void)_setPresentationCourse:(double)a3;
- (void)_setRotationRadians:(double)a3 withAnimation:(id)a4;
- (void)_setRouteMatch:(id)a3;
- (void)_setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)_setSelectedZPriority:(float)a3;
- (void)_setSelectionPriority:(float)a3;
- (void)_setShouldKeepCalloutVisible:(BOOL)a3;
- (void)_setSkipDrawingForSnapshots:(BOOL)a3;
- (void)_setStaticMapView:(id)a3;
- (void)_setTracking:(BOOL)a3;
- (void)_setUsageCounter:(id)a3;
- (void)_setZIndex:(unint64_t)a3;
- (void)_setZPriority:(float)a3;
- (void)_showCallout:(BOOL)a3;
- (void)_showCalloutSelectionAccessoryView:(id)a3 animated:(BOOL)a4;
- (void)_showDeferredSelectionAccessoryForReasonIfNeeded:(unint64_t)a3;
- (void)_showMapItemDetailCalloutAccessory:(id)a3 animated:(BOOL)a4;
- (void)_showMapItemDetailOpenInMapsAccessory:(id)a3 animated:(BOOL)a4;
- (void)_showMapItemDetailSheetAccessory:(id)a3 animated:(BOOL)a4;
- (void)_showSelectionAccessory:(id)a3 animated:(BOOL)a4;
- (void)_showSelectionAccessoryWithStyle:(id)a3 animated:(BOOL)a4;
- (void)_unhideForDisplay;
- (void)_updateAnchorPosition:(CGPoint)a3 alignToPixels:(BOOL)a4;
- (void)_updateEffectiveZPriority;
- (void)_updateFromMap;
- (void)_updateSelectionAccessoryIfNeededAnimated:(BOOL)a3;
- (void)_updateSelectionAccessoryViewContent;
- (void)_userTrackingModeDidChange:(id)a3;
- (void)configureCustomFeature:(id)a3;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)invalidateCustomFeatureForced:(BOOL)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)selectionAccessoryViewDidRequestDismissal:(id)a3;
- (void)setAccessoryOffset:(CGPoint)a3;
- (void)setAlpha:(double)a3;
- (void)setAnnotation:(id)annotation;
- (void)setAnnotationTrackingInsets:(UIEdgeInsets)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCalloutOffset:(CGPoint)calloutOffset;
- (void)setCanShowCallout:(BOOL)canShowCallout;
- (void)setCenterOffset:(CGPoint)centerOffset;
- (void)setClusterAnnotationView:(id)a3;
- (void)setClusteringIdentifier:(NSString *)clusteringIdentifier;
- (void)setCollisionMode:(MKAnnotationViewCollisionMode)collisionMode;
- (void)setDetailCalloutAccessoryView:(UIView *)detailCalloutAccessoryView;
- (void)setDisplayPriority:(MKFeatureDisplayPriority)displayPriority;
- (void)setDragState:(MKAnnotationViewDragState)dragState;
- (void)setDraggable:(BOOL)draggable;
- (void)setEnabled:(BOOL)enabled;
- (void)setHidden:(BOOL)a3;
- (void)setHighlighted:(BOOL)highlighted;
- (void)setImage:(UIImage *)image;
- (void)setLeftCalloutAccessoryView:(UIView *)leftCalloutAccessoryView;
- (void)setLeftCalloutOffset:(CGPoint)leftCalloutOffset;
- (void)setRightCalloutAccessoryView:(UIView *)rightCalloutAccessoryView;
- (void)setRightCalloutOffset:(CGPoint)rightCalloutOffset;
- (void)setSelected:(BOOL)selected;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)setSelectedZPriority:(MKAnnotationViewZPriority)selectedZPriority;
- (void)setSubtitleVisibility:(int64_t)a3;
- (void)setTitleVisibility:(int64_t)a3;
- (void)setZPriority:(MKAnnotationViewZPriority)zPriority;
@end

@implementation MKAnnotationView

- (id)_mapView
{
  v2 = [(MKAnnotationView *)self superview];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      v2 = (void *)v3;
    }
    while (v3);
  }

  return v2;
}

- (BOOL)isDraggable
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (MKAnnotationViewCollisionMode)collisionMode
{
  return self->_collisionMode;
}

- (MKCalloutView)_calloutView
{
  return self->_calloutView;
}

- (MKAnnotationViewDragState)dragState
{
  return self->_dragState;
}

- (double)_pointsForDistance:(double)a3
{
  v4 = [(MKAnnotationView *)self anchor];
  [v4 pointOffsetForDistanceOffset:a3];
  double v6 = v5;

  return v6;
}

- (VKAnchorWrapper)anchor
{
  anchor = self->_anchor;
  if (!anchor)
  {
    v4 = objc_alloc_init(_MKAnnotationViewAnchor);
    double v5 = self->_anchor;
    self->_anchor = v4;

    -[VKAnchorWrapper setFollowsTerrain:](self->_anchor, "setFollowsTerrain:", [(id)objc_opt_class() _followsTerrain]);
    [(_MKAnnotationViewAnchor *)self->_anchor setAnnotationView:self];
    anchor = self->_anchor;
  }

  return (VKAnchorWrapper *)anchor;
}

- (void)_setHidden:(BOOL)a3 forReason:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  char v7 = a4;
  BOOL v8 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  v11 = v10;
  unint64_t hiddenReasons = self->_hiddenReasons;
  int v13 = 1 << v7;
  if (v8)
  {
    self->_unint64_t hiddenReasons = hiddenReasons | v13;
    if (hiddenReasons) {
      goto LABEL_23;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v15 = hiddenReasons == 0;
    unint64_t v16 = hiddenReasons & ~v13;
    self->_unint64_t hiddenReasons = v16;
    BOOL v14 = v16 != 0;
    if (v15 != v14) {
      goto LABEL_23;
    }
  }
  if (v10)
  {
    hiddenCompletionBlocks = self->_hiddenCompletionBlocks;
    if (hiddenCompletionBlocks)
    {
      v18 = (void *)MEMORY[0x18C139AE0](v10);
      [(NSMutableArray *)hiddenCompletionBlocks addObject:v18];
    }
    else
    {
      v19 = (void *)MEMORY[0x1E4F1CA48];
      v18 = (void *)MEMORY[0x18C139AE0](v10);
      v20 = [v19 arrayWithObject:v18];
      v21 = self->_hiddenCompletionBlocks;
      self->_hiddenCompletionBlocks = v20;
    }
  }
  __int16 flags = (__int16)self->_flags;
  *(_WORD *)&self->___int16 flags = flags & 0xDFFF;
  if (v6)
  {
    *(_WORD *)&self->___int16 flags = flags | 0x2000;
  }
  else
  {
    double realAlpha = 0.0;
    if (!v14) {
      double realAlpha = self->_realAlpha;
    }
    v35.receiver = self;
    v35.super_class = (Class)MKAnnotationView;
    [(MKAnnotationView *)&v35 setAlpha:realAlpha];
    v34.receiver = self;
    v34.super_class = (Class)MKAnnotationView;
    [(MKAnnotationView *)&v34 setHidden:v14];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v24 = self->_hiddenCompletionBlocks;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(v24);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v30 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v30 + 1) + 8 * i));
        }
        uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v26);
    }

    [(NSMutableArray *)self->_hiddenCompletionBlocks removeAllObjects];
  }
  [(MKAnnotationView *)self invalidateCustomFeatureForced:[(MKAnnotationView *)self isProvidingCustomFeature]];
  v29 = [(MKAnnotationView *)self _annotationContainer];
  [v29 annotationViewDidChangeHidden:self];

LABEL_23:
}

- (void)_setHidden:(BOOL)a3 forReason:(unint64_t)a4 animated:(BOOL)a5
{
}

- (_MKStaticMapView)_staticMapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_staticMapView);

  return (_MKStaticMapView *)WeakRetained;
}

- (void)_updateAnchorPosition:(CGPoint)a3 alignToPixels:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  self->_anchorPoint = a3;
  [(MKAnnotationView *)self centerOffset];
  double v9 = x + v8;
  double v11 = y + v10;
  [(MKAnnotationView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v16 = v9 - v12 * 0.5;
  double v17 = v11 - v14 * 0.5;
  [(MKAnnotationView *)self _collisionAlignmentRectInsets];
  self->_collisionFrame.origin.double x = v18 + v16 + -5.0;
  self->_collisionFrame.origin.double y = v19 + v17 + -5.0;
  self->_collisionFrame.size.width = v13 - (v18 + v20) + 10.0;
  self->_collisionFrame.size.height = v15 - (v19 + v21) + 10.0;
  if (v4 && ![(MKAnnotationView *)self isHidden])
  {
    [(MKAnnotationView *)self _currentScreenScale];
    double v9 = MKIntegralCenterForViewWithScale(self, v9, v11, v22);
    double v11 = v23;
  }
  double v24 = fabs(v11);
  double v25 = INFINITY;
  if (fabs(v9) != INFINITY && v24 != INFINITY)
  {
    if (self->_wantsViewBasedPositioning) {
      goto LABEL_13;
    }
    if ([(MKAnnotationView *)self isSelected])
    {
      uint64_t v27 = [(MKAnnotationView *)self leftCalloutAccessoryView];
      if (v27
        || ([(MKAnnotationView *)self rightCalloutAccessoryView],
            (uint64_t v27 = objc_claimAutoreleasedReturnValue()) != 0))
      {

        goto LABEL_13;
      }
      long long v31 = [(MKAnnotationView *)self detailCalloutAccessoryView];

      if (v31)
      {
LABEL_13:
        [(MKAnnotationView *)self center];
        if (v29 == v9 && v28 == v11) {
          return;
        }
        -[MKAnnotationView setCenter:](self, "setCenter:", v9, v11);
LABEL_17:
        calloutView = self->_calloutView;
        [(MKCalloutView *)calloutView annotationViewFrameDidChange];
        return;
      }
    }
    id v32 = (id)[(MKAnnotationView *)self layer];
    [v32 position];
    if (v34 == v9 && v33 == v11) {
      return;
    }
    objc_msgSend(v32, "setPosition:", v9, v11);
    goto LABEL_17;
  }
}

- (BOOL)isHidden
{
  return self->_hiddenReasons != 0;
}

- (BOOL)isSelected
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (CGPoint)centerOffset
{
  double x = self->_centerOffset.x;
  double y = self->_centerOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIEdgeInsets)_collisionAlignmentRectInsets
{
  if (self->_subclassImplementsAlignmentRectInsets) {
    [(MKAnnotationView *)self alignmentRectInsets];
  }
  else {
    [(MKAnnotationView *)self _defaultCollisionAlignmentRectInsets];
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_setMapRotationRadians:(double)a3
{
  self->_mapRotationRadians = a3;
  double direction = self->_direction;
  if (direction > 0.0)
  {
    CGAffineTransformMakeRotation(&v5, -(a3 - direction * 0.0174532925));
    [(MKAnnotationView *)self setTransform:&v5];
  }
}

- (BOOL)isProvidingCustomFeature
{
  if ([(MKAnnotationView *)self isHidden])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    [(MKAnnotationView *)self displayPriority];
    if (v4 < 1000.0 || (BOOL v3 = [(MKAnnotationView *)self _titleRequiresCustomFeature])) {
      LOBYTE(v3) = [(MKAnnotationView *)self dragState] == MKAnnotationViewDragStateNone;
    }
  }
  return v3;
}

- (MKFeatureDisplayPriority)displayPriority
{
  return self->_displayPriority;
}

- (BOOL)_titleRequiresCustomFeature
{
  if ([(MKAnnotationView *)self titleVisibility] != 1
    || [(MKAnnotationView *)self subtitleVisibility] != 1)
  {
    return 1;
  }
  BOOL v3 = [(MKAnnotationView *)self _mapItem];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)titleVisibility
{
  return self->_titleVisibility;
}

- (int64_t)subtitleVisibility
{
  return self->_subtitleVisibility;
}

- (id)_mapItem
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(MKAnnotation *)self->_annotation _representedMapItem];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_invalidateCustomFeatureForced:(BOOL)a3 coordinates:(CLLocationCoordinate2D *)a4 count:(unint64_t)a5
{
  customFeatureAnnotation = self->_customFeatureAnnotation;
  if (customFeatureAnnotation) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = !a3;
  }
  if (!v6)
  {
    self->_customFeatureAnnotation = 0;

    if (a5)
    {
      p_longitude = &a4->longitude;
      do
      {
        if (*p_longitude >= -180.0 && *p_longitude <= 180.0)
        {
          double v11 = *(p_longitude - 1);
          if (v11 >= -90.0 && v11 <= 90.0)
          {
            GEOMapPointForCoordinate();
            uint64_t v23 = v12;
            uint64_t v24 = v13;
            GEOMapRectBoundingMapPoints();
            double v15 = v14;
            double v17 = v16;
            double v19 = v18;
            double v21 = v20;
            double v22 = [(MKAnnotationView *)self _annotationContainer];
            objc_msgSend(v22, "invalidateCustomFeatureDataSourceRect:", v15, v17, v19, v21);
          }
        }
        p_longitude += 2;
        --a5;
      }
      while (a5);
    }
  }
}

- (float)_effectiveZPriority
{
  float v3 = 1001.0;
  if ([(MKAnnotationView *)self dragState] != MKAnnotationViewDragStateStarting
    && [(MKAnnotationView *)self dragState] != MKAnnotationViewDragStateDragging
    && [(MKAnnotationView *)self dragState] != MKAnnotationViewDragStateEnding)
  {
    if ([(MKAnnotationView *)self isSelected])
    {
      [(MKAnnotationView *)self selectedZPriority];
      float v5 = v4;
      float v6 = 0.0;
      if (v5 > 0.0) {
        [(MKAnnotationView *)self selectedZPriority];
      }
    }
    else
    {
      [(MKAnnotationView *)self zPriority];
      float v8 = v7;
      float v6 = 0.0;
      if (v8 > 0.0) {
        [(MKAnnotationView *)self zPriority];
      }
    }
    return fminf(v6, 1000.0);
  }
  return v3;
}

- (MKAnnotationViewZPriority)zPriority
{
  return self->_zPriority;
}

- (CGPoint)_anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)invalidateCustomFeatureForced:(BOOL)a3
{
}

- (id)_annotationContainer
{
  double v2 = [(MKAnnotationView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    float v3 = v2;
  }
  else {
    float v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)_setUsageCounter:(id)a3
{
}

+ (BOOL)_followsTerrain
{
  return 1;
}

- (UIView)detailCalloutAccessoryView
{
  return self->_detailCalloutAccessoryView;
}

- (CGRect)_collisionFrame
{
  double x = self->_collisionFrame.origin.x;
  double y = self->_collisionFrame.origin.y;
  double width = self->_collisionFrame.size.width;
  double height = self->_collisionFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- ($6EFE6C6748B912A6EAC8A8E593ED1344)_mapDisplayStyle
{
  return ($6EFE6C6748B912A6EAC8A8E593ED1344)(*(unsigned int *)&self->_mapDisplayStyle.timePeriod | ((unint64_t)*(unsigned __int16 *)&self->_mapDisplayStyle.searchResultsType << 32));
}

- (unint64_t)_mapType
{
  return self->_mapType;
}

- (double)_mapPitchRadians
{
  return self->_mapPitchRadians;
}

- (void)_setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (MKUserLocationAnnotationViewProxy)_userLocationProxy
{
  userLocationProxdouble y = self->_userLocationProxy;
  if (!userLocationProxy)
  {
    id v4 = objc_alloc_init(MKUserLocationAnnotationViewProxy);
    float v5 = self->_userLocationProxy;
    self->_userLocationProxdouble y = v4;

    [(MKUserLocationAnnotationViewProxy *)self->_userLocationProxy setAnnotationView:self];
    userLocationProxdouble y = self->_userLocationProxy;
  }

  return userLocationProxy;
}

- (void)_setRouteMatch:(id)a3
{
}

- (void)_mapVisibleCenteringRectChanged
{
  calloutView = self->_calloutView;
  if (calloutView) {
    [(MKCalloutView *)calloutView annotationViewFrameDidChange];
  }
}

- (void)setCalloutOffset:(CGPoint)calloutOffset
{
  CGFloat y = calloutOffset.y;
  CGFloat x = calloutOffset.x;
  p_calloutOffset = &self->_calloutOffset;
  if (vabdd_f64(calloutOffset.x, self->_calloutOffset.x) >= 0.001
    || vabdd_f64(calloutOffset.y, self->_calloutOffset.y) >= 0.001)
  {
    [(MKAnnotationView *)self willChangeValueForKey:@"calloutOffset"];
    p_calloutOffset->CGFloat x = x;
    p_calloutOffset->CGFloat y = y;
    [(MKAnnotationView *)self didChangeValueForKey:@"calloutOffset"];
  }
}

- (MKAnnotationViewZPriority)selectedZPriority
{
  return self->_selectedZPriority;
}

- (UIEdgeInsets)alignmentRectInsets
{
  if (self->_clusteringIdentifier || self->_displayPriority < 1000.0)
  {
    [(MKAnnotationView *)self _defaultCollisionAlignmentRectInsets];
  }
  else
  {
    double v2 = 0.0;
    double v3 = 0.0;
    double v4 = 0.0;
    double v5 = 0.0;
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)canShowCallout
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (NSString)clusteringIdentifier
{
  return self->_clusteringIdentifier;
}

+ (BOOL)_isInitiallyHiddenWhenAdded
{
  BOOL v2 = _MKLinkedOnOrAfterReleaseSet(1796);
  if (v2)
  {
    if (_MKLinkedOnOrAfterReleaseSet(2053))
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      [(id)objc_opt_class() _defaultDisplayPriority];
      LOBYTE(v2) = v3 < 1000.0;
    }
  }
  return v2;
}

- (void)setAnnotation:(id)annotation
{
  float v6 = (MKAnnotation *)annotation;
  if (self->_annotation != v6)
  {
    objc_storeStrong((id *)&self->_annotation, annotation);
    [(MKAnnotationView *)self _invalidateCachedCoordinate];
    double v5 = [(MKAnnotationView *)self _vkNavigationPuckMarker];
    [v5 setAnnotation:v6];
  }
}

- (void)_invalidateCachedCoordinate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_coordinate = &self->_coordinate;
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  float v6 = [(MKAnnotationView *)self annotation];
  [v6 coordinate];
  p_coordinate->double latitude = v7;
  p_coordinate->double longitude = v8;

  if (vabdd_f64(p_coordinate->latitude, latitude) >= 0.00000000999999994
    || vabdd_f64(p_coordinate->longitude, longitude) >= 0.00000000999999994)
  {
    *(double *)double v9 = latitude;
    *(double *)&v9[1] = longitude;
    CLLocationCoordinate2D v10 = *p_coordinate;
    [(MKAnnotationView *)self _invalidateCustomFeatureForced:[(MKAnnotationView *)self isProvidingCustomFeature] coordinates:v9 count:2];
  }
}

- (id)annotation
{
  return self->_annotation;
}

- (void)_setAnimatingToCoordinate:(BOOL)a3
{
  if (self->_animatingToCoordinate != a3)
  {
    BOOL v3 = a3;
    [(MKAnnotationView *)self _presentationCoordinate];
    self->_animatingToCoordinate = v3;
    if (v3)
    {
      self->_presentationCoordinate.double latitude = v5;
      self->_presentationCoordinate.double longitude = v6;
    }
  }
}

- (CLLocationCoordinate2D)_presentationCoordinate
{
  BOOL v2 = &OBJC_IVAR___MKAnnotationView__presentationCoordinate;
  if (!self->_animatingToCoordinate)
  {
    BOOL v2 = &OBJC_IVAR___MKAnnotationView__coordinate;
    if (self->_tracking) {
      BOOL v2 = &OBJC_IVAR___MKAnnotationView__presentationCoordinate;
    }
  }
  BOOL v3 = (double *)((char *)self + *v2);
  double v4 = *v3;
  double v5 = v3[1];
  result.double longitude = v5;
  result.double latitude = v4;
  return result;
}

- (double)_presentationCourse
{
  return self->_presentationCourse;
}

- (BOOL)_isTracking
{
  return self->_tracking;
}

- (BOOL)_isAnimatingToCoordinate
{
  return self->_animatingToCoordinate;
}

- (MKAnnotationView)initWithAnnotation:(id)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
  id v6 = annotation;
  CLLocationDegrees v7 = reuseIdentifier;
  if (_MKLinkedOnOrAfterReleaseSet(1283))
  {
    v13.receiver = self;
    v13.super_class = (Class)MKAnnotationView;
    CLLocationDegrees v8 = -[MKAnnotationView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  else
  {
    CLLocationDegrees v8 = -[MKAnnotationView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  double v9 = v8;
  if (v8)
  {
    [(MKAnnotationView *)v8 _commonInit];
    [(MKAnnotationView *)v9 setAnnotation:v6];
    uint64_t v10 = [(NSString *)v7 copy];
    uint64_t v11 = v9->_reuseIdentifier;
    v9->_reuseIdentifier = (NSString *)v10;
  }
  return v9;
}

- (void)_commonInit
{
  self->_double realAlpha = 1.0;
  [(id)objc_opt_class() _defaultDisplayPriority];
  self->_displayPrioritCGFloat y = v3;
  self->_selectionPrioritCGFloat y = 1000.0;
  self->_titleVisibilitCGFloat y = 1;
  self->_subtitleVisibilitCGFloat y = 1;
  self->_allowedCalloutEdges = 1;
  double v4 = objc_opt_class();
  self->_subclassImplementsAlignmentRectInsets = objc_msgSend(v4, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_alignmentRectInsets, objc_msgSend((id)objc_opt_class(), "_mapkitLeafClass"));
  [(MKAnnotationView *)self _defaultZPriority];
  self->_zPrioritCGFloat y = v5;
  [(MKAnnotationView *)self _defaultSelectedZPriority];
  self->_selectedZPrioritCGFloat y = v6;
  self->_wantsViewBasedPositioning = [(id)objc_opt_class() _wantsViewBasedPositioning];
}

+ (float)_defaultDisplayPriority
{
  return 1000.0;
}

- (float)_defaultZPriority
{
  if ([(id)objc_opt_class() _zIndex] == 20) {
    return 500.0;
  }
  else {
    return (float)((float)(unint64_t)[(id)objc_opt_class() _zIndex] * 4.6566e-10) * 1000.0;
  }
}

- (float)_defaultSelectedZPriority
{
  if ([(id)objc_opt_class() _selectedZIndex] != 2147483646) {
    self->_selectedZPrioritCGFloat y = (float)((float)(unint64_t)[(id)objc_opt_class() _selectedZIndex]
  }
                                     * 4.6566e-10)
                             * 1000.0;
  return 1000.0;
}

+ (unint64_t)_zIndex
{
  return 20;
}

+ (BOOL)_wantsViewBasedPositioning
{
  return 0;
}

+ (unint64_t)_selectedZIndex
{
  return 2147483646;
}

+ (Class)_mapkitLeafClass
{
  return (Class)objc_opt_class();
}

- (double)alpha
{
  return self->_realAlpha;
}

- (int64_t)_calloutStyle
{
  return self->_calloutStyle;
}

- (void)_setCalloutStyle:(int64_t)a3
{
  self->_calloutStyle = a3;
}

- (void)_performStateUpdatesIfNeeded
{
  unint64_t hiddenReasons = self->_hiddenReasons;
  double v4 = [(MKAnnotationView *)self superview];

  if (v4 && (hiddenReasons & 0xFFFFFFFE) == 2) {
    [(MKAnnotationView *)self prepareForDisplay];
  }
  [(MKAnnotationView *)self _performOffsetAnimationIfNeeded];

  [(MKAnnotationView *)self _performHideAnimationIfNeeded];
}

- (void)_performOffsetAnimationIfNeeded
{
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    *(_WORD *)&self->_flags &= ~0x1000u;
    BOOL v2 = *(double *)(MEMORY[0x1E4F1DAD8] + 8) == self->_realOffset.y && *MEMORY[0x1E4F1DAD8] == self->_realOffset.x;
    double v3 = 0.3;
    if (v2) {
      double v3 = 0.5;
    }
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__MKAnnotationView__performOffsetAnimationIfNeeded__block_invoke;
    v4[3] = &unk_1E54B8188;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_animateFromCurrentStateWithDuration:animations:completion:", v4, &__block_literal_global_50, v3);
  }
}

- (void)_performHideAnimationIfNeeded
{
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    *(_WORD *)&self->_flags &= ~0x2000u;
    BOOL v3 = [(MKAnnotationView *)self isHidden];
    BOOL v4 = v3;
    double v5 = 0.3;
    if (!v3) {
      double v5 = 0.5;
    }
    if (self->_realOffset.y == *(double *)(MEMORY[0x1E4F1DAD8] + 8) && self->_realOffset.x == *MEMORY[0x1E4F1DAD8]) {
      double v7 = 0.4;
    }
    else {
      double v7 = v5;
    }
    v12.receiver = self;
    v12.super_class = (Class)MKAnnotationView;
    if ([(MKAnnotationView *)&v12 isHidden])
    {
      v11.receiver = self;
      v11.super_class = (Class)MKAnnotationView;
      [(MKAnnotationView *)&v11 setHidden:0];
    }
    v8[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __49__MKAnnotationView__performHideAnimationIfNeeded__block_invoke;
    v9[3] = &unk_1E54B8718;
    BOOL v10 = v4;
    v9[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__MKAnnotationView__performHideAnimationIfNeeded__block_invoke_2;
    v8[3] = &unk_1E54B86F0;
    objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_animateFromCurrentStateWithDuration:animations:completion:", v9, v8, v7);
  }
}

- (void)setZPriority:(MKAnnotationViewZPriority)zPriority
{
  -[MKAnnotationView _clampZPriority:](self, "_clampZPriority:");

  -[MKAnnotationView _setZPriority:](self, "_setZPriority:");
}

- (void)setCanShowCallout:(BOOL)canShowCallout
{
  if (canShowCallout) {
    __int16 v4 = 8;
  }
  else {
    __int16 v4 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v4;
  p_usageCounter = &self->_usageCounter;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usageCounter);
  if (WeakRetained)
  {
    __int16 flags = (__int16)self->_flags;

    if ((flags & 8) == 0)
    {
      id v8 = objc_loadWeakRetained((id *)p_usageCounter);
      [v8 countUsageOfTypeIfNeeded:46];
    }
  }
}

- (UIView)rightCalloutAccessoryView
{
  return self->_rightCalloutAccessoryView;
}

- (UIView)leftCalloutAccessoryView
{
  return self->_leftCalloutAccessoryView;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MKAnnotationView;
  [(MKAnnotationView *)&v4 layoutSubviews];
  if (self->_imageLayer)
  {
    BOOL v3 = [(MKAnnotationView *)self layer];
    [v3 bounds];
    -[CALayer setFrame:](self->_imageLayer, "setFrame:");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MKAnnotationView *)self _layoutOpenInMapsAccessory];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MKAnnotationView *)self _layoutCalloutSelectionAccessoryView:self->_selectionAccessoryView];
    }
  }
}

- (void)_unhideForDisplay
{
}

- (float)_clampZPriority:(float)a3
{
  float v3 = 1000.0;
  if (a3 <= 1000.0) {
    float v3 = a3;
  }
  BOOL v4 = a3 < 0.0;
  float result = 0.0;
  if (!v4) {
    return v3;
  }
  return result;
}

- (void)_setZPriority:(float)a3
{
  if (self->_zPriority != a3)
  {
    self->_zPrioritCGFloat y = a3;
    if (![(MKAnnotationView *)self isSelected])
    {
      id v4 = [(MKAnnotationView *)self _containerView];
      [v4 annotationViewDidChangeZPriority:self];
    }
  }
}

- (id)_containerView
{
  BOOL v2 = [(MKAnnotationView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MKAnnotationView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)MKAnnotationView;
  -[MKAnnotationView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    if (qword_1E91540B0 != -1) {
      dispatch_once(&qword_1E91540B0, &__block_literal_global_806);
    }
    if (_MergedGlobals_9) {
      [(MKAnnotationView *)self _metricsDidChange];
    }
  }
}

- (void)_metricsDidChange
{
  id v3 = [(MKAnnotationView *)self _annotationContainer];
  [v3 annotationViewDidChangeMetrics:self];

  BOOL v4 = [(MKAnnotationView *)self isProvidingCustomFeature];

  [(MKAnnotationView *)self invalidateCustomFeatureForced:v4];
}

- (void)_setPresentationCoordinateChangedCallback:(id)a3
{
}

- (void)didMoveToSuperview
{
  id v3 = [(MKAnnotationView *)self superview];
  if (v3)
  {
    double v5 = v3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v3 = v5;
    if ((isKindOfClass & 1) == 0)
    {
      [(MKAnnotationView *)self prepareForSnapshotting];
      id v3 = v5;
    }
  }
}

- (void)_setMapPitchRadians:(double)a3
{
  self->_mapPitchRadians = a3;
}

+ (Class)calloutViewClass
{
  return 0;
}

- (BOOL)shouldShowCallout
{
  id v3 = [(MKAnnotationView *)self annotation];
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [v3 title];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  if (_MKLinkedOnOrAfterReleaseSet(1540) && self->_detailCalloutAccessoryView) {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)_isSelectable
{
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    return 0;
  }
  if (_MKLinkedOnOrAfterReleaseSet(2053) || ![(MKAnnotationView *)self canShowCallout]) {
    return 1;
  }
  id v3 = [(MKAnnotation *)self->_annotation title];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [(MKAnnotationView *)self detailCalloutAccessoryView];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (UIEdgeInsets)_annotationTrackingInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setClusterAnnotationView:(id)a3
{
}

- (int64_t)compareForClustering:(id)a3
{
  annotation = self->_annotation;
  float v6 = (void *)*((void *)a3 + 80);
  if (!v6)
  {
    float v6 = [a3 annotation];
  }
  [(MKAnnotation *)annotation coordinate];
  double v8 = v7;
  double v10 = v9;
  [v6 coordinate];
  if (v8 < v11) {
    return -1;
  }
  if (v8 > v11) {
    return 1;
  }
  if (v10 < v12) {
    return -1;
  }
  if (v10 > v12) {
    return 1;
  }
  int64_t v14 = (char *)self - (unsigned char *)a3;
  if ((char *)self - (unsigned char *)a3 >= 1) {
    int64_t v14 = 1;
  }
  if (v14 < 0) {
    return -1;
  }
  else {
    return v14;
  }
}

- (int64_t)compareForCollision:(id)a3
{
  unsigned int v3 = (*(_WORD *)&self->_flags >> 2) & 1;
  unsigned int v4 = (*((unsigned __int16 *)a3 + 428) >> 2) & 1;
  if (v3 < v4) {
    return 1;
  }
  if (v3 > v4) {
    return -1;
  }
  displayPrioritdouble y = self->_displayPriority;
  float v8 = *((float *)a3 + 162);
  if (displayPriority < v8) {
    return 1;
  }
  if (displayPriority > v8) {
    return -1;
  }
  [(MKAnnotationView *)self _collisionFrame];
  double v10 = v9;
  [a3 _collisionFrame];
  if (v10 < v11) {
    return 1;
  }
  if (v10 > v11) {
    return -1;
  }
  int64_t v13 = (char *)self - (unsigned char *)a3;
  if ((char *)self - (unsigned char *)a3 >= 1) {
    int64_t v13 = 1;
  }
  if (v13 < 0) {
    return -1;
  }
  else {
    return v13;
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"calloutOffset"])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___MKAnnotationView;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (id)_disclosureCalloutButton
{
  double v2 = (void *)_disclosureCalloutButton__disclosureCalloutButton;
  if (!_disclosureCalloutButton__disclosureCalloutButton)
  {
    unsigned int v3 = [MEMORY[0x1E4F427E0] buttonWithType:2];
    id v4 = +[MKSystemController sharedInstance];
    int v5 = [v4 userInterfaceIdiom];

    if (v5)
    {
      float v6 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"ShowInfo.png");
      [v3 setImage:v6 forState:0];

      objc_super v7 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", @"ShowInfoPressed.png");
      [v3 setImage:v7 forState:1];
    }
    float v8 = (void *)_disclosureCalloutButton__disclosureCalloutButton;
    _disclosureCalloutButton__disclosureCalloutButton = (uint64_t)v3;

    double v2 = (void *)_disclosureCalloutButton__disclosureCalloutButton;
  }

  return v2;
}

- (CGPoint)_anchorPointForCalloutAnchorPosition:(int64_t)a3
{
  switch(a3)
  {
    case 4:
      [(MKAnnotationView *)self center];
      double v6 = v5;
      double v8 = v7;
      double v9 = [(MKAnnotationView *)self superview];
      -[MKAnnotationView convertPoint:fromView:](self, "convertPoint:fromView:", v9, v6, v8);
      double v11 = v10;
      double v13 = v12;

      [(MKAnnotationView *)self bounds];
      double v15 = -0.5;
LABEL_8:
      double v23 = v11 + v14 * v15;
      double MaxY = v13 + self->_accessoryOffset.y;
      break;
    case 3:
      [(MKAnnotationView *)self center];
      double v17 = v16;
      double v19 = v18;
      double v20 = [(MKAnnotationView *)self superview];
      -[MKAnnotationView convertPoint:fromView:](self, "convertPoint:fromView:", v20, v17, v19);
      double v11 = v21;
      double v13 = v22;

      [(MKAnnotationView *)self bounds];
      double v15 = 0.5;
      goto LABEL_8;
    case 1:
      if ([(MKAnnotationView *)self _isProvidingVKLabelContents])
      {
        [(MKAnnotationView *)self _labelDisplayFrame];
        double MaxY = CGRectGetMaxY(v27);
      }
      else
      {
        [(MKAnnotationView *)self bounds];
        double MaxY = v24;
      }
      [(MKAnnotationView *)self bounds];
      double v23 = CGRectGetMidX(v29) + self->_accessoryOffset.x;
      break;
    default:
      [(MKAnnotationView *)self bounds];
      double v23 = CGRectGetMidX(v28) + self->_accessoryOffset.x;
      double MaxY = 0.0;
      break;
  }
  double v25 = MaxY;
  result.double y = v25;
  result.double x = v23;
  return result;
}

- (CGPoint)_openInMapsAnchorPoint
{
  [(MKAnnotationView *)self _anchorPointForCalloutAnchorPosition:1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)_layoutOpenInMapsAccessory
{
  [(MKAnnotationView *)self _openInMapsAnchorPoint];
  double v4 = v3;
  double v6 = v5;
  [(MKSelectionAccessoryView *)self->_selectionAccessoryView bounds];
  -[MKAnnotationView _calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:](self, "_calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:", 1, v7, v8, v4, v6, 0.0);
  selectionAccessoryView = self->_selectionAccessoryView;

  -[MKSelectionAccessoryView setFrame:](selectionAccessoryView, "setFrame:");
}

- (void)_layoutCalloutSelectionAccessoryView:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 pointerEdge];
  [(MKAnnotationView *)self _anchorPointForCalloutAnchorPosition:v4];
  double v6 = v5;
  double v8 = v7;
  [v14 bounds];
  double v10 = v9;
  double v12 = v11;
  +[MKCalloutSelectionAccessoryView pointerHeight];
  -[MKAnnotationView _calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:](self, "_calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:", v4, v10, v12, v6, v8, v13);
  objc_msgSend(v14, "setFrame:");
}

- (MKAnnotationView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (_MKLinkedOnOrAfterReleaseSet(1283))
  {
    double v8 = [(MKAnnotationView *)self initWithAnnotation:0 reuseIdentifier:0];
    -[MKAnnotationView setFrame:](v8, "setFrame:", x, y, width, height);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MKAnnotationView;
    double v8 = -[MKAnnotationView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(MKAnnotationView *)v8 _commonInit];
  }
  return v8;
}

- (MKAnnotationView)initWithCoder:(NSCoder *)aDecoder
{
  v6.receiver = self;
  v6.super_class = (Class)MKAnnotationView;
  double v3 = [(MKAnnotationView *)&v6 initWithCoder:aDecoder];
  uint64_t v4 = v3;
  if (v3) {
    [(MKAnnotationView *)v3 _commonInit];
  }
  return v4;
}

- (void)dealloc
{
  [(_MKKVOProxy *)self->_annotationObserver removeObserverForObject:self forKeyPath:@"annotation.title" context:MKAnnotationKVOContext];
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(MKUserLocationAnnotationViewProxy *)self->_userLocationProxy setAnnotationView:0];
  [(_MKAnnotationViewAnchor *)self->_anchor setAnnotationView:0];
  v4.receiver = self;
  v4.super_class = (Class)MKAnnotationView;
  [(MKAnnotationView *)&v4 dealloc];
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)prepareForReuse
{
  [(MKAnnotationView *)self _removePopover];
  [(MKAnnotationView *)self setSelected:0];
  self->_unint64_t hiddenReasons = 0;
  v8.receiver = self;
  v8.super_class = (Class)MKAnnotationView;
  [(MKAnnotationView *)&v8 setHidden:0];
  v7.receiver = self;
  v7.super_class = (Class)MKAnnotationView;
  [(MKAnnotationView *)&v7 setAlpha:1.0];
  self->_pendingSelectionAnimated = 0;
  [(id)objc_opt_class() _defaultDisplayPriority];
  self->_displayPrioritdouble y = v3;
  clusteringIdentifier = self->_clusteringIdentifier;
  self->_clusteringIdentifier = 0;

  objc_storeWeak((id *)&self->_clusterAnnotationView, 0);
  [(MKAnnotationView *)self _defaultZPriority];
  self->_zPrioritdouble y = v5;
  [(MKAnnotationView *)self _defaultSelectedZPriority];
  self->_selectedZPrioritdouble y = v6;
  objc_storeWeak((id *)&self->_staticMapView, 0);
  [(NSMutableArray *)self->_hiddenCompletionBlocks removeAllObjects];
  objc_storeWeak((id *)&self->_usageCounter, 0);
}

- (id)_getPopover:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  float v5 = objc_msgSend(v4, "subviews", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      double v11 = v8;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        NSClassFromString(&cfstr_Mkpopoverembed.isa);
        if (objc_opt_isKindOfClass())
        {
          id v8 = v4;

          goto LABEL_12;
        }
        id v8 = [(MKAnnotationView *)self _getPopover:v12];

        ++v10;
        double v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v8 = 0;
  }
LABEL_12:

  return v8;
}

- (void)_removePopover
{
  double v2 = [(MKAnnotationView *)self _getPopover:self];
  if (v2)
  {
    id v3 = v2;
    [v2 removeFromSuperview];
    double v2 = v3;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MKAnnotationView;
  id v8 = -[MKAnnotationView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  if (!v8)
  {
    id v8 = -[MKAnnotationView _hitTest:view:withEvent:](self, "_hitTest:view:withEvent:", self->_calloutView, v7, x, y);
    if (!v8)
    {
      id v8 = -[MKAnnotationView _hitTest:view:withEvent:](self, "_hitTest:view:withEvent:", self->_selectionAccessoryView, v7, x, y);
    }
  }

  return v8;
}

- (id)_hitTest:(CGPoint)a3 view:(id)a4 withEvent:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v9 superview];

  if (v11)
  {
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    uint64_t v12 = objc_msgSend(v9, "hitTest:withEvent:", v10);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(UIImage *)image
{
  float v5 = image;
  if (self->_image != v5)
  {
    long long v14 = v5;
    objc_storeStrong((id *)&self->_image, image);
    if (v14)
    {
      [(UIImage *)v14 size];
      double v7 = v6;
      [(UIImage *)v14 size];
      -[MKAnnotationView setBounds:](self, "setBounds:", 0.0, 0.0, v7, v8);
      p_imageLayer = &self->_imageLayer;
      if (!self->_imageLayer)
      {
        uint64_t v10 = [MEMORY[0x1E4F39BE8] layer];
        double v11 = *p_imageLayer;
        *p_imageLayer = (CALayer *)v10;

        uint64_t v12 = [(MKAnnotationView *)self layer];
        [v12 insertSublayer:*p_imageLayer atIndex:0];

        [(MKAnnotationView *)self setOpaque:0];
      }
    }
    else
    {
      p_imageLayer = &self->_imageLayer;
    }
    double v13 = [(MKAnnotationView *)self layer];
    [v13 bounds];
    -[CALayer setFrame:](*p_imageLayer, "setFrame:");

    [(CALayer *)*p_imageLayer setContents:[(UIImage *)v14 CGImage]];
    float v5 = v14;
  }
}

- (void)setDisplayPriority:(MKFeatureDisplayPriority)displayPriority
{
  if (self->_displayPriority != displayPriority)
  {
    self->_displayPrioritdouble y = displayPriority;
    [(MKAnnotationView *)self invalidateCustomFeatureForced:[(MKAnnotationView *)self isProvidingCustomFeature]];
    id v4 = [(MKAnnotationView *)self _containerView];
    [v4 annotationViewDidChangeDisplayPriority:self];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_usageCounter);
    if (WeakRetained)
    {
      double v6 = WeakRetained;
      float v7 = self->_displayPriority;
      [(id)objc_opt_class() _defaultDisplayPriority];
      float v9 = v8;

      if (v7 != v9)
      {
        id v10 = objc_loadWeakRetained((id *)&self->_usageCounter);
        [v10 countUsageOfTypeIfNeeded:42];
      }
    }
  }
}

- (void)setSelectedZPriority:(MKAnnotationViewZPriority)selectedZPriority
{
  -[MKAnnotationView _clampZPriority:](self, "_clampZPriority:");

  -[MKAnnotationView _setSelectedZPriority:](self, "_setSelectedZPriority:");
}

- (void)_setSelectedZPriority:(float)a3
{
  if (self->_selectedZPriority != a3)
  {
    self->_selectedZPrioritdouble y = a3;
    if ([(MKAnnotationView *)self isSelected])
    {
      id v4 = [(MKAnnotationView *)self _containerView];
      [v4 annotationViewDidChangeZPriority:self];
    }
  }
}

- (void)setClusteringIdentifier:(NSString *)clusteringIdentifier
{
  id v4 = clusteringIdentifier;
  float v5 = v4;
  if (self->_clusteringIdentifier != v4)
  {
    double v13 = v4;
    BOOL v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    float v5 = v13;
    if (!v6)
    {
      float v7 = (NSString *)[(NSString *)v13 copy];
      float v8 = self->_clusteringIdentifier;
      self->_clusteringIdentifier = v7;

      [(MKAnnotationView *)self invalidateCustomFeatureForced:[(MKAnnotationView *)self isProvidingCustomFeature]];
      p_usageCounter = &self->_usageCounter;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_usageCounter);
      float v5 = v13;
      if (WeakRetained)
      {
        double v11 = self->_clusteringIdentifier;

        float v5 = v13;
        if (v11)
        {
          id v12 = objc_loadWeakRetained((id *)p_usageCounter);
          [v12 countUsageOfTypeIfNeeded:45];

          float v5 = v13;
        }
      }
    }
  }
}

- (void)setCollisionMode:(MKAnnotationViewCollisionMode)collisionMode
{
  if (self->_collisionMode != collisionMode)
  {
    self->_collisionMode = collisionMode;
    [(MKAnnotationView *)self invalidateCustomFeatureForced:[(MKAnnotationView *)self isProvidingCustomFeature]];
    p_usageCounter = &self->_usageCounter;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_usageCounter);
    if (WeakRetained)
    {
      int64_t v6 = self->_collisionMode;

      if (v6)
      {
        id v7 = objc_loadWeakRetained((id *)p_usageCounter);
        [v7 countUsageOfTypeIfNeeded:44];
      }
    }
  }
}

- (void)setSelected:(BOOL)selected
{
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0xC000) == 0x4000)
  {
    if (selected) {
      __int16 v5 = 4;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->___int16 flags = flags & 0xFFFB | v5;
    BOOL v6 = !selected || [(MKAnnotationView *)self isProvidingCustomFeature];
    [(MKAnnotationView *)self invalidateCustomFeatureForced:v6];
  }
  else
  {
    *(_WORD *)&self->___int16 flags = flags & 0x3FFF | 0x8000;
    [(MKAnnotationView *)self _setSelected:selected animated:0];
  }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0xC000) == 0x4000)
  {
    if (selected) {
      __int16 v6 = 4;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->___int16 flags = flags & 0xFFFB | v6;
    BOOL v7 = !selected || [(MKAnnotationView *)self isProvidingCustomFeature];
    [(MKAnnotationView *)self invalidateCustomFeatureForced:v7];
  }
  else
  {
    *(_WORD *)&self->___int16 flags = flags & 0x3FFF | 0x8000;
    [(MKAnnotationView *)self _setSelected:selected animated:animated];
  }
}

- (void)_setSelected:(BOOL)a3 animated:(BOOL)a4
{
  __int16 flags = (__int16)self->_flags;
  if (((((flags & 4) == 0) ^ a3) & 1) == 0)
  {
    BOOL v7 = a3;
    if ((flags & 0xC000) != 0x8000)
    {
      *(_WORD *)&self->___int16 flags = flags & 0x3FFF | 0x4000;
      [(MKAnnotationView *)self setSelected:a3 animated:a4];
      __int16 flags = (__int16)self->_flags;
    }
    if (v7) {
      __int16 v8 = 4;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->___int16 flags = flags & 0xFFFB | v8;
    if (v7) {
      [(MKAnnotationView *)self _addAnnotationObservation];
    }
    else {
      [(MKAnnotationView *)self _removeAnnotationObservation];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__MKAnnotationView__setSelected_animated___block_invoke;
    v10[3] = &unk_1E54B8718;
    v10[4] = self;
    BOOL v11 = a4;
    float v9 = (void (**)(void))MEMORY[0x18C139AE0](v10);
    if (objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters")) {
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v9];
    }
    else {
      v9[2](v9);
    }

    __int16 flags = (__int16)self->_flags;
  }
  *(_WORD *)&self->___int16 flags = flags & 0x3FFF;
}

uint64_t __42__MKAnnotationView__setSelected_animated___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) updateCalloutViewIfNeededAnimated:*(unsigned __int8 *)(a1 + 40)]|| objc_msgSend(*(id *)(a1 + 32), "_calloutPermitsSelectionAccessory"))
  {
    [*(id *)(a1 + 32) _updateSelectionAccessoryIfNeededAnimated:*(unsigned __int8 *)(a1 + 40)];
  }
  double v2 = *(void **)(a1 + 32);

  return [v2 _updateEffectiveZPriority];
}

- (void)setDetailCalloutAccessoryView:(UIView *)detailCalloutAccessoryView
{
  p_detailCalloutAccessoryView = &self->_detailCalloutAccessoryView;
  id v10 = detailCalloutAccessoryView;
  if (*p_detailCalloutAccessoryView != v10)
  {
    [(MKAnnotationView *)self willChangeValueForKey:@"detailCalloutAccessoryView"];
    objc_storeStrong((id *)&self->_detailCalloutAccessoryView, detailCalloutAccessoryView);
    [(MKAnnotationView *)self didChangeValueForKey:@"detailCalloutAccessoryView"];
    [(MKAnnotationView *)self updateCalloutViewIfNeededAnimated:1];
    p_usageCounter = &self->_usageCounter;
    id WeakRetained = objc_loadWeakRetained((id *)p_usageCounter);
    if (WeakRetained)
    {
      __int16 v8 = *p_detailCalloutAccessoryView;

      if (v8)
      {
        id v9 = objc_loadWeakRetained((id *)p_usageCounter);
        [v9 countUsageOfTypeIfNeeded:47];
      }
    }
  }
}

- (void)setLeftCalloutAccessoryView:(UIView *)leftCalloutAccessoryView
{
  __int16 v5 = leftCalloutAccessoryView;
  if (self->_leftCalloutAccessoryView != v5)
  {
    __int16 v6 = v5;
    [(MKAnnotationView *)self willChangeValueForKey:@"leftCalloutAccessoryView"];
    objc_storeStrong((id *)&self->_leftCalloutAccessoryView, leftCalloutAccessoryView);
    [(MKAnnotationView *)self didChangeValueForKey:@"leftCalloutAccessoryView"];
    [(MKAnnotationView *)self updateCalloutViewIfNeededAnimated:1];
    __int16 v5 = v6;
  }
}

- (void)setRightCalloutAccessoryView:(UIView *)rightCalloutAccessoryView
{
  __int16 v5 = rightCalloutAccessoryView;
  if (self->_rightCalloutAccessoryView != v5)
  {
    __int16 v6 = v5;
    [(MKAnnotationView *)self willChangeValueForKey:@"rightCalloutAccessoryView"];
    objc_storeStrong((id *)&self->_rightCalloutAccessoryView, rightCalloutAccessoryView);
    [(MKAnnotationView *)self didChangeValueForKey:@"rightCalloutAccessoryView"];
    [(MKAnnotationView *)self updateCalloutViewIfNeededAnimated:1];
    __int16 v5 = v6;
  }
}

- (int64_t)_effectiveCalloutStyle
{
  uint64_t v3 = [(id)objc_opt_class() calloutViewClass];
  if (v3 && v3 == objc_opt_class()) {
    return 1;
  }
  else {
    return self->_calloutStyle;
  }
}

- (BOOL)_shouldShowCalloutIfSelected
{
  if ((self->_allowedCalloutEdges & 0xF) != 0
    && ([(MKAnnotationView *)self _effectiveCalloutStyle] != 1
     || [(MKAnnotationView *)self conformsToProtocol:&unk_1ED9DF828])
    && [(MKAnnotationView *)self _allowedToShowCallout]
    && [(MKAnnotationView *)self shouldShowCallout])
  {
    uint64_t v3 = [(MKAnnotationView *)self _containerView];
    int v4 = [v3 suppressCallout] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_calloutPermitsSelectionAccessory
{
  return [(MKAnnotationView *)self _effectiveCalloutStyle] == 1;
}

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MKAnnotationView *)self isSelected]
    && [(MKAnnotationView *)self _shouldShowCalloutIfSelected])
  {
    if (![(MKCalloutView *)self->_calloutView isVisible]) {
      [(MKAnnotationView *)self _showCallout:v3];
    }
    LOBYTE(v5) = 1;
  }
  else if ([(MKCalloutView *)self->_calloutView isVisible] {
         || (BOOL v5 = [(MKCalloutView *)self->_calloutView hasPendingVisibility]))
  }
  {
    [(MKAnnotationView *)self setHighlighted:0];
    [(MKAnnotationView *)self _dismissCallout:v3];
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)_updateSelectionAccessoryIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MKAnnotationView *)self isSelected];
  activeSelectionAccessordouble y = self->_activeSelectionAccessory;
  if (v5)
  {
    if (!activeSelectionAccessory)
    {
      BOOL v7 = [(MKAnnotationView *)self _mapView];
      __int16 v8 = [v7 delegate];
      if (objc_opt_respondsToSelector()) {
        int v9 = [v8 mapViewShouldDelaySelectionAccessoryPresentation:v7];
      }
      else {
        int v9 = 0;
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __62__MKAnnotationView__updateSelectionAccessoryIfNeededAnimated___block_invoke;
      v14[3] = &unk_1E54BB2C0;
      id v15 = v8;
      long long v16 = self;
      id v17 = v7;
      BOOL v18 = v3;
      id v10 = v7;
      id v11 = v8;
      id v12 = (void (**)(void))MEMORY[0x18C139AE0](v14);
      double v13 = v12;
      if (v9) {
        dispatch_async(MEMORY[0x1E4F14428], v12);
      }
      else {
        v12[2](v12);
      }
    }
  }
  else if (activeSelectionAccessory)
  {
    [(MKAnnotationView *)self _dismissSelectionAccessoryAnimated:v3];
  }
}

void __62__MKAnnotationView__updateSelectionAccessoryIfNeededAnimated___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    double v2 = *(void **)(a1 + 40);
    id v3 = [*(id *)(a1 + 32) mapView:*(void *)(a1 + 48) selectionAccessoryForAnnotation:v2[80]];
    [v2 _showSelectionAccessory:v3 animated:*(unsigned __int8 *)(a1 + 56)];
  }
}

- (id)_resolvedAccessoryFor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 _mapItemDetailPresentationStyle];
  uint64_t v6 = [v5 _style];

  BOOL v7 = v4;
  if (!v6)
  {
    __int16 v8 = [v4 _mapItemDetailPresentationStyle];
    int v9 = [v8 _presentationViewController];
    BOOL v7 = [(MKAnnotationView *)self _resolvedAutomaticStyleWithViewController:v9];
  }
  id v10 = [v7 _mapItemDetailPresentationStyle];
  uint64_t v11 = [v10 _style];

  if (v11 == 1)
  {
    id v12 = [v7 _mapItemDetailPresentationStyle];
    double v13 = v12;
    if (!v12 || ![v12 _calloutStyle])
    {
      uint64_t v14 = [(MKAnnotationView *)self _resolvedAutomaticCalloutStyle];

      BOOL v7 = (void *)v14;
    }
  }

  return v7;
}

- (id)_resolvedAutomaticStyleWithViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MKSystemController sharedInstance];
  int v6 = [v5 userInterfaceIdiom];

  if (v6)
  {
    if ([(MKAnnotationView *)self _viewportCanDisplayFullCalloutAccessory])
    {
      uint64_t v7 = [(id)objc_opt_class() _fullCalloutAccessory];
      goto LABEL_10;
    }
LABEL_6:
    BOOL v8 = [(MKAnnotationView *)self _viewportCanDisplayCompactCalloutAccessory];
    int v9 = objc_opt_class();
    if (v8) {
      [v9 _compactCalloutAccessory];
    }
    else {
    uint64_t v7 = [v9 _openInMapsAccessory];
    }
    goto LABEL_10;
  }
  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v7 = [(id)objc_opt_class() _sheetAccessoryWithViewController:v4];
LABEL_10:
  id v10 = (void *)v7;

  return v10;
}

- (id)_resolvedAutomaticCalloutStyle
{
  id v3 = +[MKSystemController sharedInstance];
  int v4 = [v3 userInterfaceIdiom];

  if (v4
    && [(MKAnnotationView *)self _viewportCanDisplayFullCalloutAccessory])
  {
    BOOL v5 = [(id)objc_opt_class() _fullCalloutAccessory];
  }
  else
  {
    BOOL v5 = [(id)objc_opt_class() _compactCalloutAccessory];
  }

  return v5;
}

- (CGSize)_effectiveMapViewportSize
{
  double v2 = [(MKAnnotationView *)self _mapView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  [v2 _edgeInsets];
  double v9 = v4 - (v7 + v8);
  double v12 = v6 - (v10 + v11);

  double v13 = v9;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (BOOL)_viewportCanDisplayFullCalloutAccessory
{
  [(MKAnnotationView *)self _effectiveMapViewportSize];
  return v3 >= 400.0 && v2 >= 750.0;
}

- (BOOL)_viewportCanDisplayCompactCalloutAccessory
{
  [(MKAnnotationView *)self _effectiveMapViewportSize];
  return v3 >= 150.0 && v2 >= 300.0;
}

+ (id)_fullCalloutAccessory
{
  double v2 = +[MKMapItemDetailSelectionAccessoryPresentationStyle calloutWithCalloutStyle:1];
  double v3 = +[MKSelectionAccessory mapItemDetailWithPresentationStyle:v2];

  return v3;
}

+ (id)_compactCalloutAccessory
{
  double v2 = +[MKMapItemDetailSelectionAccessoryPresentationStyle calloutWithCalloutStyle:2];
  double v3 = +[MKSelectionAccessory mapItemDetailWithPresentationStyle:v2];

  return v3;
}

+ (id)_openInMapsAccessory
{
  double v2 = +[MKMapItemDetailSelectionAccessoryPresentationStyle openInMaps];
  double v3 = +[MKSelectionAccessory mapItemDetailWithPresentationStyle:v2];

  return v3;
}

+ (id)_sheetAccessoryWithViewController:(id)a3
{
  double v3 = +[MKMapItemDetailSelectionAccessoryPresentationStyle sheetPresentedFromViewController:a3];
  double v4 = +[MKSelectionAccessory mapItemDetailWithPresentationStyle:v3];

  return v4;
}

- (unint64_t)_reasonToDeferSelectionAccessoryPresentationStyle:(id)a3
{
  if (([a3 _style] | 2) != 3) {
    return 0;
  }
  if ([(MKAnnotationView *)self _isProvidingVKLabelContents]) {
    return 2;
  }
  return 0;
}

- (void)_showDeferredSelectionAccessoryForReasonIfNeeded:(unint64_t)a3
{
  if ([(_MKDeferredSelectionAccessoryPresentation *)self->_deferredSelectionAccessory reason] == a3)
  {
    double v4 = [(MKSelectionAccessory *)self->_resolvedSelectionAccessory _mapItemDetailPresentationStyle];
    [(MKAnnotationView *)self _showSelectionAccessoryWithStyle:v4 animated:[(_MKDeferredSelectionAccessoryPresentation *)self->_deferredSelectionAccessory animated]];

    deferredSelectionAccessordouble y = self->_deferredSelectionAccessory;
    self->_deferredSelectionAccessordouble y = 0;
  }
}

- (BOOL)_canShowSelectionAccessory:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4 && ![v4 _style])
  {
    double v8 = [(MKAnnotationView *)self _mapItem];

    if (v8)
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_showSelectionAccessory:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  if ([(MKAnnotationView *)self _canShowSelectionAccessory:v14])
  {
    double v7 = [(MKAnnotationView *)self _resolvedAccessoryFor:v14];
    double v8 = [(MKSelectionAccessory *)v7 _mapItemDetailPresentationStyle];
    unint64_t v9 = [(MKAnnotationView *)self _reasonToDeferSelectionAccessoryPresentationStyle:v8];
    if (v9)
    {
      unint64_t v10 = v9;
      double v11 = [[_MKDeferredSelectionAccessoryPresentation alloc] initWithReason:v9 animated:v4];
      deferredSelectionAccessordouble y = self->_deferredSelectionAccessory;
      self->_deferredSelectionAccessordouble y = v11;

      [(_MKDeferredSelectionAccessoryPresentation *)self->_deferredSelectionAccessory setReady:v10 == 1];
    }
    else
    {
      [(MKAnnotationView *)self _showSelectionAccessoryWithStyle:v8 animated:v4];
    }
    objc_storeStrong((id *)&self->_activeSelectionAccessory, a3);
    resolvedSelectionAccessordouble y = self->_resolvedSelectionAccessory;
    self->_resolvedSelectionAccessordouble y = v7;
  }

  MEMORY[0x1F4181820]();
}

- (void)_showSelectionAccessoryWithStyle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  uint64_t v6 = [v9 _style];
  if (v6 == 1)
  {
    [(MKAnnotationView *)self _showMapItemDetailCalloutAccessory:v9 animated:v4];
    goto LABEL_8;
  }
  if (v6 == 3)
  {
    [(MKAnnotationView *)self _showMapItemDetailOpenInMapsAccessory:v9 animated:v4];
    goto LABEL_8;
  }
  BOOL v7 = v6 == 2;
  double v8 = v9;
  if (v7)
  {
    [(MKAnnotationView *)self _showMapItemDetailSheetAccessory:v9 animated:v4];
LABEL_8:
    double v8 = v9;
  }
}

- (void)_showMapItemDetailSheetAccessory:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  uint64_t v6 = [v8 _presentationViewController];

  if (v6)
  {
    BOOL v7 = [v8 _presentationViewController];
    [(MKAnnotationView *)self _presentSelectionAccessorySheetFromViewController:v7 animated:v4];
  }
}

- (double)_labelDisplayHeight
{
  BOOL v2 = [(MKAnnotationView *)self _isProvidingVKLabelContents];
  double result = 0.0;
  if (v2) {
    return 25.0;
  }
  return result;
}

- (CGRect)_labelDisplayFrame
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = [(MKAnnotationView *)self annotation];
    BOOL v4 = [v3 marker];

    double v5 = [(MKAnnotationView *)self _mapView];
    [v4 screenBounds];
    objc_msgSend(v5, "convertRect:toView:", self);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else if ([(MKAnnotationView *)self _isProvidingVKLabelContents])
  {
    id v14 = [(MKAnnotationView *)self _mapView];
    id v15 = (void *)v14[83];
    long long v16 = [(MKAnnotationView *)self customFeatureAnnotation];
    id v17 = [(MKAnnotationView *)self _annotationContainer];
    BOOL v18 = [v15 labelMarkerForCustomFeatureAnnotation:v16 dataSource:v17];

    [v18 screenCollisionBounds];
    double v23 = v22;
    if (v20 == -INFINITY || v21 == -INFINITY)
    {
      double v7 = *MEMORY[0x1E4F1DB28];
      double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      double v25 = v19;
      double v26 = v20;
      double v27 = v21;
      CGRect v28 = [(MKAnnotationView *)self _mapView];
      objc_msgSend(v28, "convertRect:toView:", self, v23, v25, v26, v27);
      double v7 = v29;
      double v9 = v30;
      double v11 = v31;
      double v13 = v32;
    }
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v33 = v7;
  double v34 = v9;
  double v35 = v11;
  double v36 = v13;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (double)_verticalAccessoryDisplayPadding
{
  return 6.0;
}

- (double)_horizontalAccessoryDisplayPadding
{
  return 25.0;
}

- (id)_urlForOpenInMaps
{
  double v3 = [(MKAnnotationView *)self _mapItem];
  if (v3)
  {
    BOOL v4 = +[MKMapItem urlForMapItem:v3 options:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = [(MKAnnotation *)self->_annotation marker];
      double v6 = [v5 identifier];
      BOOL v4 = (void *)[v6 muid];

      if (v4)
      {
        double v7 = (void *)MEMORY[0x1E4F1CB10];
        double v8 = objc_msgSend(NSString, "stringWithFormat:", @"maps://?auid=%llu", v4);
        BOOL v4 = [v7 URLWithString:v8];
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }

  return v4;
}

- (void)_showMapItemDetailOpenInMapsAccessory:(id)a3 animated:(BOOL)a4
{
  double v5 = [(MKAnnotationView *)self _urlForOpenInMaps];
  if (v5)
  {
    double v6 = [[MKOpenInMapsSelectionAccessoryView alloc] initWithURL:v5];
    objc_storeStrong((id *)&self->_selectionAccessoryView, v6);
    [(MKAnnotationView *)self _calculatePresentationFrameForOpenInMapsView:v6];
    -[MKAnnotationView _calculateMapOffsetForPresentationFrame:](self, "_calculateMapOffsetForPresentationFrame:");
    double v9 = v8;
    double v10 = v7;
    if (v8 == *MEMORY[0x1E4F1DAD8] && v7 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
    {
      [(MKAnnotationView *)self addSubview:v6];
    }
    else
    {
      double v12 = [(MKAnnotationView *)self _mapView];
      double v13 = [(MKAnnotationView *)self _annotationContainer];
      [(MKAnnotationView *)self coordinate];
      double v15 = v14;
      double v17 = v16;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __67__MKAnnotationView__showMapItemDetailOpenInMapsAccessory_animated___block_invoke;
      v18[3] = &unk_1E54B8248;
      double v19 = v6;
      double v20 = self;
      objc_msgSend(v12, "annotationContainer:scrollToRevealCalloutWithOffset:annotationCoordinate:completionHandler:", v13, v18, v9, v10, v15, v17);
    }
  }
}

void *__67__MKAnnotationView__showMapItemDetailOpenInMapsAccessory_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CGRect result = *(void **)(a1 + 40);
  if (v2 == result[115]) {
    return objc_msgSend(result, "addSubview:");
  }
  return result;
}

- (CGRect)_calculatePresentationFrameForOpenInMapsView:(id)a3
{
  id v4 = a3;
  [(MKAnnotationView *)self _frameForSelectionAdjustment];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(MKAnnotationView *)self _openInMapsAnchorPoint];
  double v14 = v13;
  double v16 = v15;
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v18 = v17;
  double v20 = v19;

  -[MKAnnotationView _calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:](self, "_calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:", 1, v18, v20, v14, v16, 0.0);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v29 = [(MKAnnotationView *)self superview];
  -[MKAnnotationView convertRect:toView:](self, "convertRect:toView:", v29, v22, v24, v26, v28);
  v45.origin.CGFloat x = v30;
  v45.origin.double y = v31;
  v45.size.CGFloat width = v32;
  v45.size.double height = v33;
  v42.origin.CGFloat x = v6;
  v42.origin.double y = v8;
  v42.size.CGFloat width = v10;
  v42.size.double height = v12;
  CGRect v43 = CGRectUnion(v42, v45);
  CGFloat x = v43.origin.x;
  double y = v43.origin.y;
  CGFloat width = v43.size.width;
  double height = v43.size.height;

  double v38 = y + -10.0;
  double v39 = height + 20.0;
  double v40 = x;
  double v41 = width;
  result.size.double height = v39;
  result.size.CGFloat width = v41;
  result.origin.double y = v38;
  result.origin.CGFloat x = v40;
  return result;
}

- (int64_t)_calloutAnchorPositionForCurrentFrame
{
  double v3 = [(MKAnnotationView *)self _mapView];
  [v3 bounds];
  double v5 = v4;
  CGFloat v6 = [(MKAnnotationView *)self _mapView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  [(MKAnnotationView *)self frame];
  if (v5 >= 500.0)
  {
    if (v8 - CGRectGetMaxX(*(CGRect *)&v11) <= v11) {
      int64_t v15 = 4;
    }
    else {
      int64_t v15 = 3;
    }
  }
  else if (v10 - CGRectGetMaxY(*(CGRect *)&v11) > v12)
  {
    int64_t v15 = 1;
  }
  else
  {
    int64_t v15 = 2;
  }

  return v15;
}

- (void)_showMapItemDetailCalloutAccessory:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  uint64_t v6 = [v11 _calloutStyle];
  if (v6 == 2)
  {
    double v8 = [MKCompactDeveloperPlaceCardSelectionAccessoryView alloc];
    double v7 = -[MKViewSwitchingSelectionAccessoryView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  else
  {
    if (v6 != 1) {
      goto LABEL_6;
    }
    double v7 = [[MKFullDeveloperPlaceCardSelectionAccessoryView alloc] initAsAccessory];
  }
  double v9 = v7;
  double v10 = -[MKCalloutSelectionAccessoryView initWithSelectionAccessoryView:style:pointerEdge:pointerUnitLocation:]([MKCalloutSelectionAccessoryView alloc], "initWithSelectionAccessoryView:style:pointerEdge:pointerUnitLocation:", v7, [v11 _calloutStyle], -[MKAnnotationView _calloutAnchorPositionForCurrentFrame](self, "_calloutAnchorPositionForCurrentFrame"), 0.5);
  [(MKAnnotationView *)self _showCalloutSelectionAccessoryView:v10 animated:v4];

LABEL_6:
}

- (void)_dismissSelectionAccessoryAnimated:(BOOL)a3
{
  activeSelectionAccessordouble y = self->_activeSelectionAccessory;
  if (activeSelectionAccessory)
  {
    BOOL v5 = a3;
    if (![(MKSelectionAccessory *)activeSelectionAccessory _style])
    {
      [(MKMapItemRequest *)self->_selectionAccessoryMapItemRequest cancel];
      selectionAccessoryMapItemRequest = self->_selectionAccessoryMapItemRequest;
      self->_selectionAccessoryMapItemRequest = 0;

      deferredSelectionAccessordouble y = self->_deferredSelectionAccessory;
      if (deferredSelectionAccessory)
      {
        self->_deferredSelectionAccessordouble y = 0;
      }
      else
      {
        deferredSelectionAccessordouble y = [(MKSelectionAccessory *)self->_resolvedSelectionAccessory _mapItemDetailPresentationStyle];
        if ([deferredSelectionAccessory _style] == 2) {
          [(MKAnnotationView *)self _dismissSelectionAccessoryPresentation:deferredSelectionAccessory animated:v5];
        }
        else {
          [(MKAnnotationView *)self _dismissSelectionAccessoryViewAnimated:v5];
        }
      }

      double v8 = self->_activeSelectionAccessory;
      self->_activeSelectionAccessordouble y = 0;

      resolvedSelectionAccessordouble y = self->_resolvedSelectionAccessory;
      self->_resolvedSelectionAccessordouble y = 0;
    }
  }
}

- (void)_presentSelectionAccessorySheetFromViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [[MKFullDeveloperPlaceCardSelectionAccessoryView alloc] initAsAccessory];
  selectionAccessoryView = self->_selectionAccessoryView;
  self->_selectionAccessoryView = v7;
  double v12 = v7;

  [(MKSelectionAccessoryView *)self->_selectionAccessoryView setDelegate:self];
  [(MKAnnotationView *)self _updateSelectionAccessoryViewContent];
  double v9 = [[MKPresentableSelectionAccessoryViewController alloc] initWithSelectionAccessoryView:v12];
  [(MKPresentableSelectionAccessoryViewController *)v9 setModalPresentationStyle:2];
  double v10 = [(MKPresentableSelectionAccessoryViewController *)v9 sheetPresentationController];
  [v10 setDelegate:self];

  [v6 presentViewController:v9 animated:v4 completion:0];
  selectionAccessoryViewController = self->_selectionAccessoryViewController;
  self->_selectionAccessoryViewController = v9;
}

- (void)_dismissPresentedSelectionAccessoryFromViewController:(id)a3 animated:(BOOL)a4
{
  [a3 dismissViewControllerAnimated:a4 completion:0];
  selectionAccessoryView = self->_selectionAccessoryView;
  self->_selectionAccessoryView = 0;

  selectionAccessoryViewController = self->_selectionAccessoryViewController;
  self->_selectionAccessoryViewController = 0;
}

- (void)selectionAccessoryViewDidRequestDismissal:(id)a3
{
  id v4 = [(MKAnnotationView *)self _mapView];
  [v4 deselectAnnotation:self->_annotation animated:1];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = [(MKAnnotationView *)self _mapView];
  [v4 deselectAnnotation:self->_annotation animated:1];
}

- (void)_showCalloutSelectionAccessoryView:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_selectionAccessoryView, a3);
  [(MKAnnotationView *)self _calculatePresentationFrameForCalloutView:v6];
  -[MKAnnotationView _calculateMapOffsetForPresentationFrame:](self, "_calculateMapOffsetForPresentationFrame:");
  double v8 = v7;
  double v10 = v9;
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __64__MKAnnotationView__showCalloutSelectionAccessoryView_animated___block_invoke;
  v25[3] = &unk_1E54B8C68;
  objc_copyWeak(&v27, &location);
  id v11 = v6;
  id v26 = v11;
  uint64_t v12 = MEMORY[0x18C139AE0](v25);
  double v13 = (void *)v12;
  if (v8 == *MEMORY[0x1E4F1DAD8] && v10 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }
  else
  {
    int64_t v15 = [(MKAnnotationView *)self _mapView];
    double v16 = [(MKAnnotationView *)self _annotationContainer];
    [(MKAnnotationView *)self coordinate];
    double v18 = v17;
    double v20 = v19;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__MKAnnotationView__showCalloutSelectionAccessoryView_animated___block_invoke_2;
    v21[3] = &unk_1E54B9240;
    id v22 = v11;
    double v23 = self;
    id v24 = v13;
    objc_msgSend(v15, "annotationContainer:scrollToRevealCalloutWithOffset:annotationCoordinate:completionHandler:", v16, v21, v8, v10, v18, v20);
  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __64__MKAnnotationView__showCalloutSelectionAccessoryView_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained addSubview:*(void *)(a1 + 32)];

  id v4 = objc_loadWeakRetained(v2);
  [v4 _updateSelectionAccessoryViewContent];
}

void *__64__MKAnnotationView__showCalloutSelectionAccessoryView_animated___block_invoke_2(void *result)
{
  if (result[4] == *(void *)(result[5] + 920)) {
    return (void *)(*(uint64_t (**)(void))(result[6] + 16))();
  }
  return result;
}

- (CGRect)_calculatePresentationFrameForCalloutView:(id)a3
{
  id v4 = a3;
  [(MKAnnotationView *)self _frameForSelectionAdjustment];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  uint64_t v13 = [v4 calloutStyle];
  if (v13 == 2)
  {
    double v14 = MKCompactDeveloperPlaceCardLoadingView;
  }
  else
  {
    if (v13 != 1)
    {
      double v16 = *MEMORY[0x1E4F1DB30];
      double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_7;
    }
    double v14 = MKFullDeveloperPlaceCardLoadingView;
  }
  [(__objc2_class *)v14 contentSize];
  double v16 = v15;
  double v18 = v17;
LABEL_7:
  -[MKAnnotationView _anchorPointForCalloutAnchorPosition:](self, "_anchorPointForCalloutAnchorPosition:", [v4 pointerEdge]);
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = [v4 pointerEdge];
  +[MKCalloutSelectionAccessoryView pointerHeight];
  -[MKAnnotationView _calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:](self, "_calculateAccessoryFrameForSize:anchorPosition:anchorPoint:pointerHeight:", v23, v16, v18, v20, v22, v24);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  CGFloat v33 = [(MKAnnotationView *)self superview];
  -[MKAnnotationView convertRect:toView:](self, "convertRect:toView:", v33, v26, v28, v30, v32);
  v49.origin.CGFloat x = v34;
  v49.origin.double y = v35;
  v49.size.CGFloat width = v36;
  v49.size.double height = v37;
  v46.origin.CGFloat x = v6;
  v46.origin.double y = v8;
  v46.size.CGFloat width = v10;
  v46.size.double height = v12;
  CGRect v47 = CGRectUnion(v46, v49);
  CGFloat x = v47.origin.x;
  double y = v47.origin.y;
  CGFloat width = v47.size.width;
  double height = v47.size.height;

  double v42 = x;
  double v43 = y + -40.0;
  double v44 = width;
  double v45 = height + 60.0;
  result.size.double height = v45;
  result.size.CGFloat width = v44;
  result.origin.double y = v43;
  result.origin.CGFloat x = v42;
  return result;
}

- (CGPoint)_calculateMapOffsetForPresentationFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v8 = [(MKAnnotationView *)self _containerView];
  double v9 = [(MKAnnotationView *)self _containerView];
  [v8 _visibleCenteringRectInView:v9];
  double v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  CGFloat rect = height;
  double v34 = *MEMORY[0x1E4F1DAD8];
  CGFloat v30 = v15;
  double v32 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v36.origin.double x = v11;
  v36.origin.CGFloat y = v13;
  v36.size.CGFloat width = v15;
  CGFloat v29 = v17;
  v36.size.CGFloat height = v17;
  v45.origin.double x = x;
  double v18 = y;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  if (CGRectContainsRect(v36, v45)) {
    goto LABEL_10;
  }
  CGFloat v19 = x;
  if (x >= v11)
  {
    v37.origin.double x = x;
    v37.origin.CGFloat y = v18;
    CGFloat v21 = width;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = rect;
    double MaxX = CGRectGetMaxX(v37);
    v38.origin.double x = v11;
    v38.origin.CGFloat y = v13;
    CGFloat v23 = v29;
    CGFloat v22 = v30;
    v38.size.CGFloat width = v30;
    v38.size.CGFloat height = v29;
    BOOL v24 = MaxX <= CGRectGetMaxX(v38);
    double v20 = v34;
    if (!v24)
    {
      v39.origin.double x = x;
      v39.origin.CGFloat y = v18;
      v39.size.CGFloat width = v21;
      v39.size.CGFloat height = rect;
      double v25 = CGRectGetMaxX(v39);
      v40.origin.double x = v11;
      v40.origin.CGFloat y = v13;
      v40.size.CGFloat width = v30;
      v40.size.CGFloat height = v29;
      double v20 = v25 - CGRectGetMaxX(v40);
    }
  }
  else
  {
    double v20 = x - v11;
    CGFloat v21 = width;
    CGFloat v23 = v29;
    CGFloat v22 = v30;
  }
  if (v18 >= v13)
  {
    double v34 = v20;
    v41.origin.double x = v19;
    v41.origin.CGFloat y = v18;
    v41.size.CGFloat width = v21;
    v41.size.CGFloat height = rect;
    double MaxY = CGRectGetMaxY(v41);
    v42.origin.double x = v11;
    v42.origin.CGFloat y = v13;
    v42.size.CGFloat width = v22;
    v42.size.CGFloat height = v23;
    if (MaxY > CGRectGetMaxY(v42))
    {
      v43.origin.double x = v19;
      v43.origin.CGFloat y = v18;
      v43.size.CGFloat width = v21;
      v43.size.CGFloat height = rect;
      double v27 = CGRectGetMaxY(v43);
      v44.origin.double x = v11;
      v44.origin.CGFloat y = v13;
      v44.size.CGFloat width = v22;
      v44.size.CGFloat height = v23;
      double v26 = v27 - CGRectGetMaxY(v44);
      double v20 = v34;
      goto LABEL_11;
    }
LABEL_10:
    double v20 = v34;
    double v26 = v32;
    goto LABEL_11;
  }
  double v26 = v18 - v13;
LABEL_11:
  result.CGFloat y = v26;
  result.double x = v20;
  return result;
}

- (CGRect)_calculateAccessoryFrameForSize:(CGSize)a3 anchorPosition:(int64_t)a4 anchorPoint:(CGPoint)a5 pointerHeight:(double)a6
{
  double height = a3.height;
  double width = a3.width;
  double y = a5.y;
  double x = a5.x;
  switch(a4)
  {
    case 1:
      v21.origin.double x = 0.0;
      v21.origin.double y = 0.0;
      v21.size.double width = width;
      v21.size.double height = height;
      double v12 = x - CGRectGetMidX(v21);
      [(MKAnnotationView *)self _verticalAccessoryDisplayPadding];
      double v14 = y + v13 + a6;
      break;
    case 2:
      v22.origin.double x = 0.0;
      v22.origin.double y = 0.0;
      v22.size.double width = width;
      v22.size.double height = height;
      double v12 = x - CGRectGetMidX(v22);
      [(MKAnnotationView *)self _verticalAccessoryDisplayPadding];
      double v14 = y - v15 - a6 - height;
      break;
    case 3:
      [(MKAnnotationView *)self _horizontalAccessoryDisplayPadding];
      double v12 = x + v16;
      goto LABEL_7;
    case 4:
      [(MKAnnotationView *)self _horizontalAccessoryDisplayPadding];
      double v12 = x - v17 - width;
LABEL_7:
      v23.origin.double y = 0.0;
      v23.origin.double x = v12;
      v23.size.double width = width;
      v23.size.double height = height;
      double v14 = y - CGRectGetMidY(v23);
      break;
    default:
      double v14 = 0.0;
      double v12 = 0.0;
      break;
  }
  double v18 = v12;
  double v19 = width;
  double v20 = height;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v14;
  result.origin.double x = v18;
  return result;
}

- (void)_dismissSelectionAccessoryPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  CGFloat v6 = [v8 _presentationViewController];

  if (v6)
  {
    double v7 = [v8 _presentationViewController];
    [(MKAnnotationView *)self _dismissPresentedSelectionAccessoryFromViewController:v7 animated:v4];
  }
}

- (void)_dismissSelectionAccessoryViewAnimated:(BOOL)a3
{
  BOOL v4 = [(MKSelectionAccessoryView *)self->_selectionAccessoryView superview];

  if (v4) {
    [(MKSelectionAccessoryView *)self->_selectionAccessoryView removeFromSuperview];
  }
  selectionAccessoryView = self->_selectionAccessoryView;
  self->_selectionAccessoryView = 0;

  selectionAccessoryViewController = self->_selectionAccessoryViewController;
  self->_selectionAccessoryViewController = 0;
}

- (void)_updateSelectionAccessoryViewContent
{
  uint64_t v3 = [(MKAnnotationView *)self _mapItem];
  id v4 = (id)v3;
  if (v3) {
    [(MKSelectionAccessoryView *)self->_selectionAccessoryView displayMapItem:v3];
  }
  else {
    [(MKAnnotationView *)self _fetchMapItemForSelectionAccessoryView];
  }
}

- (void)_fetchMapItemForSelectionAccessoryView
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_selectionAccessoryMapItemRequest)
  {
    objc_initWeak(&location, self);
    uint64_t v3 = self->_annotation;
    id v4 = [[MKMapItemRequest alloc] initWithMapFeatureAnnotation:v3];
    selectionAccessoryMapItemRequest = self->_selectionAccessoryMapItemRequest;
    self->_selectionAccessoryMapItemRequest = v4;

    CGFloat v6 = self->_selectionAccessoryMapItemRequest;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__MKAnnotationView__fetchMapItemForSelectionAccessoryView__block_invoke;
    v7[3] = &unk_1E54BB2E8;
    objc_copyWeak(&v8, &location);
    [(MKMapItemRequest *)v6 getMapItemWithCompletionHandler:v7];
    objc_destroyWeak(&v8);

    objc_destroyWeak(&location);
  }
}

void __58__MKAnnotationView__fetchMapItemForSelectionAccessoryView__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    double v5 = (void *)*((void *)WeakRetained + 115);
    if (v6) {
      [v5 displayMapItem:v6];
    }
    else {
      [v5 displayError];
    }
  }
}

- (void)_showCallout:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_calloutView)
  {
    [(MKAnnotationView *)self _effectiveCalloutStyle];
    objc_opt_class();
    double v5 = (MKCalloutView *)[objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue()) initWithAnnotationView:self];
    calloutView = self->_calloutView;
    self->_calloutView = v5;
  }
  double v7 = [(MKAnnotationView *)self _mapView];
  id v8 = [v7 _calloutShowAnimationGroup];

  if (v8) {
    dispatch_group_enter(v8);
  }
  double v9 = self->_calloutView;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__MKAnnotationView__showCallout___block_invoke;
  v11[3] = &unk_1E54B8188;
  double v12 = v8;
  double v10 = v8;
  [(MKCalloutView *)v9 showAnimated:v3 completionBlock:v11];
}

void __33__MKAnnotationView__showCallout___block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

- (void)_dismissCallout:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = self->_calloutView;
  if (v5)
  {
    calloutView = self->_calloutView;
    self->_calloutView = 0;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__MKAnnotationView__dismissCallout___block_invoke;
    v7[3] = &unk_1E54B8188;
    id v8 = v5;
    [(MKCalloutView *)v8 dismissAnimated:v3 completionBlock:v7];
  }
}

uint64_t __36__MKAnnotationView__dismissCallout___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setCenterOffset:(CGPoint)centerOffset
{
  self->_centerOffset = centerOffset;
  if (qword_1E91540B8 != -1) {
    dispatch_once(&qword_1E91540B8, &__block_literal_global_809);
  }
  if (byte_1E91540A9)
  {
    [(MKAnnotationView *)self _metricsDidChange];
  }
}

- (CGPoint)calloutOffset
{
  double x = self->_calloutOffset.x;
  double y = self->_calloutOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)_setDirection:(double)a3
{
  self->_double direction = a3;
  CGAffineTransformMakeRotation(&v4, -(self->_mapRotationRadians - a3 * 0.0174532925));
  [(MKAnnotationView *)self setTransform:&v4];
}

- (void)_setPresentationCoordinate:(CLLocationCoordinate2D)a3
{
  self->_presentationCoordinate = a3;
  CGAffineTransform v4 = [(MKAnnotationView *)self _presentationCoordinateChangedCallback];

  if (v4)
  {
    double v5 = [(MKAnnotationView *)self _presentationCoordinateChangedCallback];
    v5[2]();
  }
}

- (BOOL)_shouldDeselectWhenDragged
{
  return 1;
}

- (void)_setTracking:(BOOL)a3
{
  if (self->_tracking != a3)
  {
    BOOL v3 = a3;
    [(MKAnnotationView *)self _presentationCoordinate];
    self->_tracking = v3;
    if (v3)
    {
      self->_presentationCoordinate.double latitude = v5;
      self->_presentationCoordinate.double longitude = v6;
    }
  }
}

- (CGRect)_mapkit_visibleRect
{
  [(MKAnnotationView *)self _significantBounds];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  double v11 = [(MKAnnotationView *)self _calloutView];

  if (v11)
  {
    double v12 = [(MKAnnotationView *)self _calloutView];
    [v12 frame];
    v24.origin.CGFloat x = v13;
    v24.origin.CGFloat y = v14;
    v24.size.CGFloat width = v15;
    v24.size.CGFloat height = v16;
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRect v22 = CGRectUnion(v21, v24);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGRect)_significantFrame
{
  [(MKAnnotationView *)self _significantBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(MKAnnotationView *)self frame];
  double v12 = v4 + v11;
  double v14 = v6 + v13;
  double v15 = v8;
  double v16 = v10;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)isEnabled
{
  return (*(_WORD *)&self->_flags & 2) == 0;
}

- (void)setEnabled:(BOOL)enabled
{
  if (enabled) {
    __int16 v3 = 0;
  }
  else {
    __int16 v3 = 2;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)isHighlighted
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)setHighlighted:(BOOL)highlighted
{
  if (highlighted) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (void)setDraggable:(BOOL)draggable
{
  if (draggable) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
  if (draggable)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_usageCounter);
    [WeakRetained countUsageOfTypeIfNeeded:43];
  }
}

- (void)setDragState:(MKAnnotationViewDragState)dragState
{
}

- (void)_setDragState:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t dragState = self->_dragState;
  self->_unint64_t dragState = a3;
  [(MKAnnotationView *)self _updateEffectiveZPriority];
  if (a3 == 1 || !a3 && dragState) {
    [(MKAnnotationView *)self invalidateCustomFeatureForced:a3 != 1];
  }
  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v7 = (void *)MEMORY[0x1E4F1C9E8];
  double v8 = [NSNumber numberWithUnsignedInteger:dragState];
  double v9 = [NSNumber numberWithUnsignedInteger:a3];
  double v10 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, @"oldValue", v9, @"newValue", 0);
  [v11 postNotificationName:@"MKAnnotationViewDragStateChangedNotification" object:self userInfo:v10];
}

- (BOOL)_canDisplayDisclosureInCallout
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (void)_setCanDisplayDisclosureInCallout:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)_canDisplayPlacemarkInCallout
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (void)_setCanDisplayPlacemarkInCallout:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)isPersistent
{
  return 0;
}

- (unint64_t)_zIndex
{
  return self->_zIndex;
}

- (void)_setZIndex:(unint64_t)a3
{
  if (self->_zIndex != a3)
  {
    self->_zIndeCGFloat x = a3;
    *(float *)&double v3 = (float)((float)a3 * 4.6566e-10) * 1000.0;
    [(MKAnnotationView *)self setZPriority:v3];
  }
}

- (void)_updateEffectiveZPriority
{
  id v3 = [(MKAnnotationView *)self _containerView];
  [v3 annotationViewDidChangeZPriority:self];
}

- (id)snapshotViewAfterScreenUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  [(MKAnnotationView *)self prepareForSnapshotting];

  return [(MKAnnotationView *)self snapshotViewAfterScreenUpdates:v3];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters");

  [(MKAnnotationView *)self _setHidden:v3 forReason:0 animated:v5];
}

- (void)_setHiddenForOffscreen:(BOOL)a3
{
}

- (void)setAlpha:(double)a3
{
  self->_double realAlpha = a3;
  v3.receiver = self;
  v3.super_class = (Class)MKAnnotationView;
  -[MKAnnotationView setAlpha:](&v3, sel_setAlpha_);
}

- (BOOL)_isHiddenForReason:(unint64_t)a3
{
  return (self->_hiddenReasons & (1 << a3)) != 0;
}

id __49__MKAnnotationView__performHideAnimationIfNeeded__block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = *(double *)(*(void *)(a1 + 32) + 512);
  }
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)MKAnnotationView;
  return objc_msgSendSuper2(&v3, sel_setAlpha_, v1);
}

uint64_t __49__MKAnnotationView__performHideAnimationIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  v13.receiver = v2;
  v13.super_class = (Class)MKAnnotationView;
  objc_msgSendSuper2(&v13, sel_setHidden_, [v2 isHidden]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 504);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * i));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 504), "removeAllObjects", (void)v9);
}

uint64_t __51__MKAnnotationView__performOffsetAnimationIfNeeded__block_invoke(uint64_t a1)
{
  memset(&v4, 0, sizeof(v4));
  double v1 = *(CGFloat **)(a1 + 32);
  CGAffineTransformMakeTranslation(&v4, v1[65], v1[66]);
  CGAffineTransform v3 = v4;
  return [(CGFloat *)v1 setTransform:&v3];
}

- (void)_setPositionOffset:(CGPoint)a3 animated:(BOOL)a4
{
  if (self->_realOffset.x != a3.x || self->_realOffset.y != a3.y)
  {
    self->_realOffset = a3;
    __int16 flags = (__int16)self->_flags;
    *(_WORD *)&self->___int16 flags = flags & 0xEFFF;
    if (a4)
    {
      *(_WORD *)&self->___int16 flags = flags | 0x1000;
    }
    else
    {
      memset(&v8, 0, sizeof(v8));
      CGAffineTransformMakeTranslation(&v8, a3.x, a3.y);
      CGAffineTransform v7 = v8;
      [(MKAnnotationView *)self setTransform:&v7];
    }
  }
}

- (CGPoint)_offsetToAnnotationView:(id)a3
{
  [(MKAnnotationView *)self center];
  double v5 = v4;
  double v7 = v6;
  [a3 center];
  double v9 = v8 - v5;
  double v11 = v10 - v7;
  result.CGFloat y = v11;
  result.CGFloat x = v9;
  return result;
}

- (void)_enableRotationForHeadingMode:(double)a3
{
  double v5 = [(MKAnnotationView *)self _contentLayer];
  double v6 = v5;
  if (v5) {
    [v5 affineTransform];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  if (CGAffineTransformIsIdentity(&v8)) {
    goto LABEL_7;
  }
  __int16 flags = (__int16)self->_flags;

  if ((flags & 0x200) == 0)
  {
    *(_WORD *)&self->_flags |= 0x100u;
    double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__userTrackingModeDidChange_ name:0x1ED91A608 object:0];
LABEL_7:
  }
  -[MKAnnotationView _setRotationRadians:withAnimation:](self, "_setRotationRadians:withAnimation:", 0, a3, *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx);
}

- (void)_userTrackingModeDidChange:(id)a3
{
  double v4 = [a3 object];
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    id v7 = v4;
    BOOL v5 = [v4 userTrackingMode] == 2;
    double v4 = v7;
    if (v5)
    {
      NSLog(&cfstr_ACustomTransfo.isa, self);
      double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 removeObserver:self name:0x1ED91A608 object:0];

      double v4 = v7;
    }
  }
}

- (void)_setRotationRadians:(double)a3 withAnimation:(id)a4
{
  id v6 = a4;
  if (vabdd_f64(a3, self->_rotationRadians) >= 0.000001 && (*(_WORD *)&self->_flags & 0x300) != 0x100)
  {
    CGAffineTransformMakeRotation(&v11, a3);
    id v7 = [(MKAnnotationView *)self _contentLayer];
    CGAffineTransform v10 = v11;
    [v7 setAffineTransform:&v10];

    *(_WORD *)&self->_flags |= 0x200u;
    self->_rotationRadians = a3;
    CGAffineTransform v8 = [(MKAnnotationView *)self _contentLayer];
    double v9 = v8;
    if (v6) {
      [v8 addAnimation:v6 forKey:@"rotation"];
    }
    else {
      [v8 removeAnimationForKey:@"rotation"];
    }
  }
}

- (BOOL)_hasAlternateOrientation
{
  return [(MKAnnotationView *)self _orientationCount] > 1;
}

- (unint64_t)_orientationCount
{
  return 1;
}

- (id)_vkNavigationPuckMarker
{
  return 0;
}

- (void)_updateFromMap
{
  if (_MKLinkedOnOrAfterReleaseSet(3852))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_titleVisibilitCGFloat y = 1;
      self->_subtitleVisibilitCGFloat y = 1;
    }
  }
}

- (id)_customFeatureAnnotation
{
  return 0;
}

- (void)_addAnnotationObservation
{
  if (!self->_annotationObserver)
  {
    CGAffineTransform v3 = [[_MKKVOProxy alloc] initWithDelegate:self];
    annotationObserver = self->_annotationObserver;
    self->_annotationObserver = v3;

    BOOL v5 = self->_annotationObserver;
    uint64_t v6 = MKAnnotationKVOContext;
    [(_MKKVOProxy *)v5 addObserverForObject:self forKeyPath:@"annotation.title" options:0 context:v6];
  }
}

- (void)_removeAnnotationObservation
{
  annotationObserver = self->_annotationObserver;
  if (annotationObserver)
  {
    [(_MKKVOProxy *)annotationObserver removeObserverForObject:self forKeyPath:@"annotation.title" context:MKAnnotationKVOContext];
    double v4 = self->_annotationObserver;
    self->_annotationObserver = 0;
  }
}

- (void)_mkObserveValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)MKAnnotationKVOContext == a6)
  {
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3, a4, a5))
    {
      [(MKAnnotationView *)self updateCalloutViewIfNeededAnimated:1];
    }
    else
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __70__MKAnnotationView__mkObserveValueForKeyPath_ofObject_change_context___block_invoke;
      v7[3] = &unk_1E54B8CB0;
      objc_copyWeak(&v8, &location);
      dispatch_async(MEMORY[0x1E4F14428], v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __70__MKAnnotationView__mkObserveValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateCalloutViewIfNeededAnimated:1];
}

- (BOOL)isCollidingWithAnnotationView:(id)a3 previouslyCollided:(BOOL)a4
{
  double x = self->_collisionFrame.origin.x;
  double y = self->_collisionFrame.origin.y;
  double width = self->_collisionFrame.size.width;
  double height = self->_collisionFrame.size.height;
  double v11 = *((double *)a3 + 82);
  CGFloat v10 = *((double *)a3 + 83);
  double v12 = *((double *)a3 + 84);
  double v13 = *((double *)a3 + 85);
  if (!a4)
  {
    CGRect v72 = CGRectInset(self->_collisionFrame, 5.0, 5.0);
    double x = v72.origin.x;
    double y = v72.origin.y;
    double width = v72.size.width;
    double height = v72.size.height;
    v72.origin.double x = v11;
    v72.origin.double y = v10;
    v72.size.double width = v12;
    v72.size.double height = v13;
    CGRect v73 = CGRectInset(v72, 5.0, 5.0);
    double v11 = v73.origin.x;
    CGFloat v10 = v73.origin.y;
    double v12 = v73.size.width;
    double v13 = v73.size.height;
  }
  int64_t collisionMode = self->_collisionMode;
  uint64_t v15 = *((void *)a3 + 88);
  if (collisionMode == 2 || v15 == 2) {
    return 0;
  }
  if (collisionMode != v15)
  {
    if (v15 == 1) {
      double v20 = v12;
    }
    else {
      double v20 = width;
    }
    double v21 = v10;
    if (v15 == 1) {
      CGFloat v22 = v13;
    }
    else {
      CGFloat v22 = height;
    }
    double v23 = v12;
    if (v15 == 1) {
      CGFloat v24 = v21;
    }
    else {
      CGFloat v24 = y;
    }
    double v25 = v13;
    if (v15 == 1) {
      CGFloat v26 = v11;
    }
    else {
      CGFloat v26 = x;
    }
    if (v15 == 1) {
      double v25 = height;
    }
    CGFloat recta = v25;
    double v27 = v11;
    if (v15 == 1) {
      CGFloat v28 = width;
    }
    else {
      CGFloat v28 = v23;
    }
    if (v15 == 1)
    {
      CGFloat v29 = x;
    }
    else
    {
      double y = v21;
      CGFloat v29 = v27;
    }
    double v30 = v20;
    CGFloat v31 = v26;
    CGFloat v32 = v24;
    CGFloat v33 = v22;
    double MidX = CGRectGetMidX(*(CGRect *)(&v20 - 2));
    v81.origin.double x = v26;
    v81.origin.double y = v24;
    double v67 = v22;
    v81.size.double width = v30;
    v81.size.double height = v22;
    double MidY = CGRectGetMidY(v81);
    v82.origin.double x = v29;
    v82.origin.double y = y;
    v82.size.double width = v28;
    v82.size.double height = recta;
    v71.double x = MidX;
    v71.double y = MidY;
    if (CGRectContainsPoint(v82, v71)) {
      return 1;
    }
    v83.origin.double x = v29;
    v83.origin.double y = y;
    v83.size.double width = v28;
    v83.size.double height = recta;
    double MinX = CGRectGetMinX(v83);
    v84.origin.double x = v29;
    v84.origin.double y = y;
    v84.size.double width = v28;
    v84.size.double height = recta;
    double v37 = fmin(fmax(MidX, MinX), CGRectGetMaxX(v84));
    v85.origin.double x = v29;
    v85.origin.double y = y;
    v85.size.double width = v28;
    v85.size.double height = recta;
    double MinY = CGRectGetMinY(v85);
    v86.origin.double x = v29;
    v86.origin.double y = y;
    v86.size.double width = v28;
    v86.size.double height = recta;
    double v39 = fmin(fmax(MidY, MinY), CGRectGetMaxY(v86));
    double v40 = (MidX - v37) * (MidX - v37) + (MidY - v39) * (MidY - v39);
    double v41 = v67;
    if (v30 < v67) {
      double v41 = v30;
    }
    return v40 < v41 * 0.5 * (v41 * 0.5);
  }
  if (collisionMode)
  {
    v74.origin.double x = x;
    v74.origin.double y = y;
    v74.size.double width = width;
    v74.size.double height = height;
    double v65 = CGRectGetMidX(v74);
    v75.origin.double x = x;
    v75.origin.double y = y;
    v75.size.double width = width;
    v75.size.double height = height;
    double v64 = CGRectGetMidY(v75);
    v76.origin.double x = v11;
    v76.origin.double y = v10;
    v76.size.double width = v12;
    v76.size.double height = v13;
    double v63 = CGRectGetMidX(v76);
    v77.origin.double x = v11;
    v77.origin.double y = v10;
    CGFloat v66 = v12;
    CGFloat rect = v13;
    v77.size.double width = v12;
    v77.size.double height = v13;
    double v62 = CGRectGetMidY(v77);
    v78.origin.double x = x;
    v78.origin.double y = y;
    v78.size.double width = width;
    v78.size.double height = height;
    CGFloat v18 = CGRectGetWidth(v78) * 0.5;
    v79.origin.double x = x;
    v79.origin.double y = y;
    v79.size.double width = width;
    v79.size.double height = height;
    if (v18 >= CGRectGetHeight(v79) * 0.5)
    {
      v87.origin.double x = x;
      v87.origin.double y = y;
      v87.size.double width = width;
      v87.size.double height = height;
      double v19 = CGRectGetHeight(v87);
    }
    else
    {
      v80.origin.double x = x;
      v80.origin.double y = y;
      v80.size.double width = width;
      v80.size.double height = height;
      double v19 = CGRectGetWidth(v80);
    }
    double v51 = v19 * 0.5;
    v88.origin.double x = v11;
    v88.origin.double y = v10;
    v88.size.double width = v66;
    v88.size.double height = rect;
    CGFloat v52 = CGRectGetWidth(v88) * 0.5;
    v89.origin.double x = v11;
    v89.origin.double y = v10;
    v89.size.double width = v66;
    v89.size.double height = rect;
    CGFloat v53 = CGRectGetHeight(v89);
    CGFloat v54 = rect;
    if (v52 >= v53 * 0.5)
    {
      double v59 = v11;
      CGFloat v60 = v10;
      CGFloat v61 = v66;
      double v58 = CGRectGetHeight(*(CGRect *)(&v54 - 3));
    }
    else
    {
      double v55 = v11;
      CGFloat v56 = v10;
      CGFloat v57 = v66;
      double v58 = CGRectGetWidth(*(CGRect *)(&v54 - 3));
    }
    return (v65 - v63) * (v65 - v63) + (v64 - v62) * (v64 - v62) < (v51 + v58 * 0.5) * (v51 + v58 * 0.5);
  }
  double v43 = x;
  double v44 = y;
  double v45 = width;
  double v46 = height;
  double v47 = v11;
  CGFloat v48 = v10;
  double v49 = v12;
  double v50 = v13;

  return CGRectIntersectsRect(*(CGRect *)&v43, *(CGRect *)&v47);
}

- (UIEdgeInsets)_defaultCollisionAlignmentRectInsets
{
  double v2 = -5.0;
  double v3 = -5.0;
  double v4 = -5.0;
  double v5 = -5.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setTitleVisibility:(int64_t)a3
{
  if (self->_titleVisibility != a3)
  {
    self->_titleVisibilitdouble y = a3;
    [(MKAnnotationView *)self invalidateCustomFeatureForced:1];
  }
}

- (void)setSubtitleVisibility:(int64_t)a3
{
  if (self->_subtitleVisibility != a3)
  {
    self->_subtitleVisibilitdouble y = a3;
    [(MKAnnotationView *)self invalidateCustomFeatureForced:1];
  }
}

- (id)customFeatureAnnotation
{
  customFeatureAnnotation = self->_customFeatureAnnotation;
  if (!customFeatureAnnotation)
  {
    double v4 = (_MKAnnotationViewCustomFeatureAnnotation *)objc_opt_new();
    double v5 = self->_customFeatureAnnotation;
    self->_customFeatureAnnotation = v4;

    [(_MKAnnotationViewCustomFeatureAnnotation *)self->_customFeatureAnnotation setAnnotationView:self];
    customFeatureAnnotation = self->_customFeatureAnnotation;
  }

  return customFeatureAnnotation;
}

- (BOOL)_isProvidingVKLabelContents
{
  titleVisibilitdouble y = self->_titleVisibility;
  if (titleVisibility != 1)
  {
    double v4 = [(MKAnnotationView *)self _effectiveTitleIsCollidable:0];
    if (v4)
    {
      char isKindOfClass = 1;
LABEL_12:

      return isKindOfClass & 1;
    }
  }
  subtitleVisibilitdouble y = self->_subtitleVisibility;
  if (subtitleVisibility == 1
    || ([(MKAnnotationView *)self _effectiveSubtitle],
        (id v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (subtitleVisibility == 1) {
      goto LABEL_10;
    }
    id v7 = 0;
  }
  else
  {
    char isKindOfClass = 1;
  }

LABEL_10:
  if (titleVisibility != 1)
  {
    double v4 = 0;
    goto LABEL_12;
  }
  return isKindOfClass & 1;
}

- (id)_effectiveTitleIsCollidable:(BOOL *)a3
{
  if (![(MKAnnotationView *)self isSelected]
    || ![(MKAnnotationView *)self canShowCallout])
  {
    double v5 = [(MKAnnotationView *)self annotation];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      titleVisibilitdouble y = self->_titleVisibility;
      if (titleVisibility == 2)
      {
LABEL_9:
        double v9 = [(MKAnnotationView *)self annotation];
        CGFloat v10 = [v9 title];

        goto LABEL_11;
      }
      if (!titleVisibility)
      {
        BOOL v8 = [(MKAnnotationView *)self isSelected];
        if (a3 && !v8) {
          *a3 = 1;
        }
        goto LABEL_9;
      }
    }
  }
  CGFloat v10 = 0;
LABEL_11:

  return v10;
}

- (id)_effectiveSubtitle
{
  double v3 = [(MKAnnotationView *)self annotation];
  if ((![(MKAnnotationView *)self isSelected]
     || ![(MKAnnotationView *)self canShowCallout])
    && (objc_opt_respondsToSelector() & 1) != 0
    && ((subtitleVisibilitdouble y = self->_subtitleVisibility, subtitleVisibility == 2)
     || !subtitleVisibility
     && ([(MKAnnotationView *)self isSelected] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))))
  {
    double v5 = [v3 subtitle];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)configureCustomFeature:(id)a3
{
  id v4 = a3;
  char v8 = 0;
  double v5 = [(MKAnnotationView *)self _effectiveTitleIsCollidable:&v8];
  char v6 = [(MKAnnotationView *)self _effectiveSubtitle];
  if ([v5 length]) {
    [v4 setText:v5 locale:0];
  }
  if ([v6 length]) {
    [v4 setAnnotationText:v6 locale:0];
  }
  if ([v6 length] || objc_msgSend(v5, "length"))
  {
    if (v8) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    [v4 setTextDisplayMode:v7];
  }
  if ([(_MKDeferredSelectionAccessoryPresentation *)self->_deferredSelectionAccessory reason] == 2) {
    [(_MKDeferredSelectionAccessoryPresentation *)self->_deferredSelectionAccessory setReady:1];
  }
}

- (double)_direction
{
  return self->_direction;
}

- (id)_presentationCoordinateChangedCallback
{
  return self->_presentationCoordinateChangedCallback;
}

- (void)_setPresentationCourse:(double)a3
{
  self->_presentationCourse = a3;
}

- (void)_setCalloutView:(id)a3
{
}

- (BOOL)_shouldKeepCalloutVisible
{
  return self->_shouldKeepCalloutVisible;
}

- (void)_setShouldKeepCalloutVisible:(BOOL)a3
{
  self->_shouldKeepCalloutVisible = a3;
}

- (CGPoint)leftCalloutOffset
{
  double x = self->_leftCalloutOffset.x;
  double y = self->_leftCalloutOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLeftCalloutOffset:(CGPoint)leftCalloutOffset
{
  self->_leftCalloutOffset = leftCalloutOffset;
}

- (CGPoint)rightCalloutOffset
{
  double x = self->_rightCalloutOffset.x;
  double y = self->_rightCalloutOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRightCalloutOffset:(CGPoint)rightCalloutOffset
{
  self->_rightCalloutOffset = rightCalloutOffset;
}

- (CGPoint)_bottomCalloutOffset
{
  double x = self->_bottomCalloutOffset.x;
  double y = self->_bottomCalloutOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setBottomCalloutOffset:(CGPoint)a3
{
  self->_bottomCalloutOffset = a3;
}

- (unint64_t)_allowedCalloutEdges
{
  return self->_allowedCalloutEdges;
}

- (void)_setAllowedCalloutEdges:(unint64_t)a3
{
  self->_allowedCalloutEdges = a3;
}

- (GEORouteMatch)_routeMatch
{
  return self->_routeMatch;
}

- (double)_mapRotationRadians
{
  return self->_mapRotationRadians;
}

- (void)_setMapDisplayStyle:(id)a3
{
  self->_mapDisplayStyle = ($4CDE9EFBD0E8DAF50B82D23E2BCF9383)a3;
}

- (float)_selectionPriority
{
  return self->_selectionPriority;
}

- (void)_setSelectionPriority:(float)a3
{
  self->_selectionPrioritdouble y = a3;
}

- (void)_setStaticMapView:(id)a3
{
}

- (BOOL)_isPendingSelectionAnimated
{
  return self->_pendingSelectionAnimated;
}

- (void)_setPendingSelectionAnimated:(BOOL)a3
{
  self->_pendingSelectionAnimated = a3;
}

- (BOOL)_skipDrawingForSnapshots
{
  return self->_skipDrawingForSnapshots;
}

- (void)_setSkipDrawingForSnapshots:(BOOL)a3
{
  self->_skipDrawingForSnapshots = a3;
}

- (MKAnnotationView)clusterAnnotationView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clusterAnnotationView);

  return (MKAnnotationView *)WeakRetained;
}

- (CGPoint)accessoryOffset
{
  double x = self->_accessoryOffset.x;
  double y = self->_accessoryOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAccessoryOffset:(CGPoint)a3
{
  self->_accessoryOffset = a3;
}

- (MKSelectionAccessoryView)_selectionAccessoryView
{
  return self->_selectionAccessoryView;
}

- (MKUsageCounter)_usageCounter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usageCounter);

  return (MKUsageCounter *)WeakRetained;
}

- (void)setAnnotationTrackingInsets:(UIEdgeInsets)a3
{
  self->_annotationTrackingInsets = a3;
}

- (unint64_t)_featureId
{
  return self->_featureId;
}

- (void)_setFeatureId:(unint64_t)a3
{
  self->_featureId = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_usageCounter);
  objc_storeStrong((id *)&self->_selectionAccessoryView, 0);
  objc_destroyWeak((id *)&self->_staticMapView);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_destroyWeak((id *)&self->_clusterAnnotationView);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_detailCalloutAccessoryView, 0);
  objc_storeStrong((id *)&self->_rightCalloutAccessoryView, 0);
  objc_storeStrong((id *)&self->_leftCalloutAccessoryView, 0);
  objc_storeStrong((id *)&self->_calloutView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_clusteringIdentifier, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_selectionAccessoryViewController, 0);
  objc_storeStrong((id *)&self->_selectionAccessoryMapItemRequest, 0);
  objc_storeStrong((id *)&self->_deferredSelectionAccessory, 0);
  objc_storeStrong((id *)&self->_resolvedSelectionAccessory, 0);
  objc_storeStrong((id *)&self->_activeSelectionAccessory, 0);
  objc_storeStrong((id *)&self->_customFeatureAnnotation, 0);
  objc_storeStrong((id *)&self->_annotationObserver, 0);
  objc_storeStrong((id *)&self->_hiddenCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_userLocationProxy, 0);

  objc_storeStrong(&self->_presentationCoordinateChangedCallback, 0);
}

@end