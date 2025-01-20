@interface MKAnnotationContainerView
- ($52AE83AFA48F224E1564B783D639217F)currentComparisonContext;
- ($FD2884BA735A6398BD92EEF91FE53E55)_mapRectWithFraction:(double)a3 ofVisible:(id)a4;
- (BOOL)_updateAnnotationViewPositions;
- (BOOL)_updateAnnotationViews:(id)a3;
- (BOOL)_updatePriorityMapIfNeeded;
- (BOOL)_view:(id)a3 containsPoint:(CGPoint)a4;
- (BOOL)accessoryContainsPoint:(CGPoint)a3;
- (BOOL)calloutContainsPoint:(CGPoint)a3;
- (BOOL)hasDroppingPins;
- (BOOL)hasPendingAnimations;
- (BOOL)isClusteringEnabled;
- (BOOL)suppressCallout;
- (CGPoint)draggingAnnotationViewDropPoint;
- (CGPoint)draggingAnnotationViewDropPointForPoint:(CGPoint)a3;
- (CGPoint)pointForCoordinate:(CLLocationCoordinate2D)a3;
- (CGRect)_visibleCenteringRect;
- (CGRect)_visibleCenteringRectInView:(id)a3;
- (CGRect)_visibleRect;
- (CLLocationCoordinate2D)coordinateForAnnotationView:(id)a3;
- (MKAnnotationContainerView)initWithFrame:(CGRect)a3;
- (MKAnnotationContainerViewDelegate)delegate;
- (MKAnnotationView)draggingAnnotationView;
- (MKAnnotationView)userLocationView;
- (MKPinAnnotationView)bubblePin;
- (NSMutableOrderedSet)annotationViews;
- (UIEdgeInsets)accessoryPadding;
- (id)_annotationViewForSelectionAtPoint:(CGPoint)a3 avoidCurrent:(BOOL)a4 maxDistance:(double)a5;
- (id)_existingClusterViewsForClusterID:(id)a3;
- (id)annotationViewForPoint:(CGPoint)a3;
- (id)annotationsInMapRect:(id)a3;
- (id)clusterStyleAttributes;
- (id)globalAnnotations;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)mapType;
- (unsigned)sceneID;
- (unsigned)sceneState;
- (void)_addPrioritiesForAnnotationViewIfNeeded:(id)a3;
- (void)_draggingAnnotationViewDidPause:(id)a3;
- (void)_dropDraggingAnnotationViewAnimated:(BOOL)a3;
- (void)_dropPinsIfNeeded:(BOOL)a3;
- (void)_liftForDragging:(id)a3 mouseDownPoint:(CGPoint)a4;
- (void)_performStateUpdatesIfNeeded;
- (void)_updateAnnotationView:(id)a3;
- (void)_updateAnnotationViewsForReason:(int64_t)a3 updatePositions:(BOOL)a4;
- (void)_updateClusterableAnnotationViews:(id)a3 withID:(id)a4;
- (void)_updateCollidableAnnotationViews;
- (void)_updateZPositionForAnnotationView:(id)a3 inBounds:(CGRect)a4;
- (void)_willRemoveInternalAnnotationView:(id)a3;
- (void)addAnnotationView:(id)a3 allowAnimation:(BOOL)a4;
- (void)addObserver:(id)a3;
- (void)annotationViewDidChangeDisplayPriority:(id)a3;
- (void)annotationViewDidChangeHidden:(id)a3;
- (void)annotationViewDidChangeMetrics:(id)a3;
- (void)annotationViewDidChangeZPriority:(id)a3;
- (void)dealloc;
- (void)deselectAnnotationView:(id)a3 animated:(BOOL)a4;
- (void)draggingTouchMovedToPoint:(CGPoint)a3 edgeInsets:(UIEdgeInsets)a4;
- (void)dropPinsIfNeeded;
- (void)finishAddingAndRemovingAnnotationViews;
- (void)invalidateCustomFeatureDataSource;
- (void)invalidateCustomFeatureDataSourceRect:(id)a3;
- (void)pinDidDrop:(id)a3 animated:(BOOL)a4;
- (void)removeAnnotationView:(id)a3;
- (void)removeAnnotationViewsRotationAnimations;
- (void)removeObserver:(id)a3;
- (void)selectAnnotationView:(id)a3 animated:(BOOL)a4;
- (void)setAnnotationViewsRotationRadians:(double)a3 animation:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMapDisplayStyle:(id)a3;
- (void)setMapPitchRadians:(double)a3;
- (void)setMapType:(unint64_t)a3;
- (void)setSuppressCallout:(BOOL)a3;
- (void)setUserLocationView:(id)a3;
- (void)stopSuppressingUpdates;
- (void)suppressUpdates;
- (void)transitionTo:(int64_t)a3;
- (void)updateAnnotationViewsForReason:(int64_t)a3;
- (void)updateAnnotationViewsWithDelay;
- (void)updateCalloutStateForSelectedAnnotationView:(id)a3;
- (void)updateUserLocationView;
- (void)visibleCenteringRectChanged;
@end

@implementation MKAnnotationContainerView

- (void)visibleCenteringRectChanged
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_annotationViews;
  uint64_t v3 = [(NSMutableOrderedSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_mapVisibleCenteringRectChanged", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableOrderedSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)updateAnnotationViewsForReason:(int64_t)a3
{
}

- (void)_updateAnnotationViewsForReason:(int64_t)a3 updatePositions:(BOOL)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  if (!self->_suppress && !self->_isUpdating)
  {
    BOOL v5 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      self->_isUpdating = 1;
      if (v5 && ![(MKAnnotationContainerView *)self _updateAnnotationViewPositions])
      {
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_updateAnnotationViewsWithDelay object:0];
      }
      else
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        if (!a3)
        {
          [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_updateAnnotationViewsWithDelay object:0];
LABEL_13:
          self->_lastUpdate = Current;
          long long v10 = MKGetAnnotationsLog();
          os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);

          uint64_t v12 = MKGetAnnotationsLog();
          v13 = v12;
          unint64_t v14 = v11 - 1;
          if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18BAEC000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Clustering", (const char *)&unk_18BD3917F, buf, 2u);
          }

          clusterableAnnotationViews = self->_clusterableAnnotationViews;
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __77__MKAnnotationContainerView__updateAnnotationViewsForReason_updatePositions___block_invoke;
          v43[3] = &unk_1E54BEAC8;
          v43[4] = self;
          [(NSMutableDictionary *)clusterableAnnotationViews enumerateKeysAndObjectsUsingBlock:v43];
          v16 = MKGetAnnotationsLog();
          v17 = v16;
          if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18BAEC000, v17, OS_SIGNPOST_INTERVAL_END, v11, "Clustering", (const char *)&unk_18BD3917F, buf, 2u);
          }

          v18 = MKGetAnnotationsLog();
          v19 = v18;
          if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18BAEC000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Collision", (const char *)&unk_18BD3917F, buf, 2u);
          }

          [(MKAnnotationContainerView *)self _updateCollidableAnnotationViews];
          v20 = MKGetAnnotationsLog();
          v21 = v20;
          if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18BAEC000, v21, OS_SIGNPOST_INTERVAL_END, v11, "Collision", (const char *)&unk_18BD3917F, buf, 2u);
          }

          goto LABEL_29;
        }
        if (a3 == 3 || a3 == 1)
        {
          double v9 = Current - self->_lastUpdate;
          [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_updateAnnotationViewsWithDelay object:0];
          if (v9 >= 0.5) {
            goto LABEL_13;
          }
LABEL_28:
          double v22 = fmin(Current - self->_lastUpdate, 0.5);
          v47[0] = *MEMORY[0x1E4F1C4B0];
          v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
          [(MKAnnotationContainerView *)self performSelector:sel_updateAnnotationViewsWithDelay withObject:0 afterDelay:v23 inModes:v22];

LABEL_29:
          v24 = [(MKAnnotationContainerView *)self annotationViews];
          [(MKAnnotationContainerView *)self bounds];
          double v26 = v25;
          double v28 = v27;
          double v30 = v29;
          double v32 = v31;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v33 = v24;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v39 objects:v46 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v35; ++i)
              {
                if (*(void *)v40 != v36) {
                  objc_enumerationMutation(v33);
                }
                -[MKAnnotationContainerView _updateZPositionForAnnotationView:inBounds:](self, "_updateZPositionForAnnotationView:inBounds:", *(void *)(*((void *)&v39 + 1) + 8 * i), v26, v28, v30, v32, (void)v39);
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v39 objects:v46 count:16];
            }
            while (v35);
          }

          [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__performStateUpdatesIfNeeded object:0];
          uint64_t v45 = *MEMORY[0x1E4F1C4B0];
          v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
          [(MKAnnotationContainerView *)self performSelector:sel__performStateUpdatesIfNeeded withObject:0 afterDelay:v38 inModes:0.0];

          goto LABEL_37;
        }
        if (a3 != 2)
        {
          [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_updateAnnotationViewsWithDelay object:0];
          goto LABEL_28;
        }
      }
LABEL_37:
      self->_isUpdating = 0;
    }
  }
}

- (BOOL)_updateAnnotationViewPositions
{
  return [(MKAnnotationContainerView *)self _updateAnnotationViews:self->_annotationViews];
}

- (void)setMapPitchRadians:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_mapPitchRadians != a3)
  {
    self->_mapPitchRadians = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = self->_annotationViews;
    uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "_setMapPitchRadians:", a3, (void)v9);
        }
        uint64_t v6 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)setAnnotationViewsRotationRadians:(double)a3 animation:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_annotationViews;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_setMapRotationRadians:", a3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)_updateAnnotationViews:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (self->_suppress) {
    return 0;
  }
  if (![a3 count]) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  unsigned int v32 = [WeakRetained annotationContainerShouldAlignToPixels:self];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    BOOL v3 = 0;
    uint64_t v10 = *(void *)v34;
    id v30 = WeakRetained;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(MKAnnotationView **)(*((void *)&v33 + 1) + 8 * i);
        if (v12 != self->_draggingAnnotationView
          && (unint64_t)([*(id *)(*((void *)&v33 + 1) + 8 * i) dragState] - 3) >= 2)
        {
          id v13 = [(MKAnnotationView *)v12 anchor];
          [v13 updateIfNeeded];
          [(MKAnnotationContainerView *)self bounds];
          objc_msgSend(v13, "pointInLayer:bound:", 0);
          double v15 = v14;
          double v17 = v16;
          if (objc_msgSend(WeakRetained, "annotationContainer:isAnnotationView:validForDisplayAtPoint:", self, v12))
          {
            [(MKAnnotationView *)v12 _setHidden:0 forReason:3 animated:0];
            if (v12 == self->_userLocationView)
            {
              [(MKAnnotationView *)v12 alpha];
              uint64_t v19 = v18;
              v20 = MKGetUserLocationViewLog();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                v21 = objc_opt_class();
                id v29 = v21;
                [(MKAnnotationView *)v12 frame];
                double v22 = NSStringFromCGRect(v51);
                log = v20;
                double v27 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v15, *(void *)&v17];
                double v28 = [(MKAnnotationView *)v12 annotation];
                [v28 coordinate];
                double v25 = [NSString stringWithFormat:@"%+.8f, %+.8f", v23, v24];
                *(_DWORD *)buf = 138413571;
                v38 = v21;
                __int16 v39 = 2113;
                long long v40 = v12;
                __int16 v41 = 2112;
                long long v42 = v22;
                __int16 v43 = 2048;
                uint64_t v44 = v19;
                __int16 v45 = 2113;
                v46 = v27;
                __int16 v47 = 2113;
                v48 = v25;
                _os_log_impl(&dword_18BAEC000, log, OS_LOG_TYPE_INFO, "Updating user location view <%@ %{private}@ frame: %@, alpha: %f> to position: %{private}@ for coordinate: %{private}@", buf, 0x3Eu);

                v20 = log;
              }

              id WeakRetained = v30;
            }
            -[MKAnnotationView _updateAnchorPosition:alignToPixels:](v12, "_updateAnchorPosition:alignToPixels:", v32, v15, v17);
            [(MKAnnotationView *)v12 _updateFromMap];
            [(MKAnnotationView *)v12 _didUpdatePosition];
            BOOL v3 = 1;
          }
          else
          {
            [(MKAnnotationView *)v12 _setHidden:1 forReason:3 animated:0];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v9);
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (NSMutableOrderedSet)annotationViews
{
  return self->_annotationViews;
}

- (void)_updateZPositionForAnnotationView:(id)a3 inBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (([a3 isHidden] & 1) == 0)
  {
    [(MKAnnotationContainerView *)self _updatePriorityMapIfNeeded];
    [a3 _effectiveZPriority];
    priorityMap = self->_priorityMap;
    long long v11 = objc_msgSend(NSNumber, "numberWithFloat:");
    long long v12 = [(MKPriorityToIndexMap *)priorityMap objectForKeyedSubscript:v11];
    uint64_t v13 = [v12 integerValue];

    [a3 _anchorPoint];
    double v15 = v14;
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    double v16 = v15 / CGRectGetHeight(v21) + (double)(100 * v13);
    double v17 = +[MKThreadContext currentContext];
    objc_msgSend(v17, "_CA_setDisableActions:", 1);

    uint64_t v18 = [a3 layer];
    [v18 setZPosition:v16];

    id v19 = +[MKThreadContext currentContext];
    objc_msgSend(v19, "_CA_setDisableActions:", 0);
  }
}

- (BOOL)_updatePriorityMapIfNeeded
{
  uint64_t v3 = [(NSMutableSet *)self->_prioritiesToAdd count];
  if (v3)
  {
    BOOL v4 = [(MKPriorityToIndexMap *)self->_priorityMap addPriorities:self->_prioritiesToAdd];
    [(NSMutableSet *)self->_prioritiesToAdd removeAllObjects];
    LOBYTE(v3) = v4;
  }
  return v3;
}

- (void)invalidateCustomFeatureDataSource
{
  uint64_t v3 = [(UIView *)self _mapKit_mapView];
  [v3 visibleMapRect];
  -[MKAnnotationContainerView _mapRectWithFraction:ofVisible:](self, "_mapRectWithFraction:ofVisible:", 3.0, v4, v5, v6, v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  -[MKAnnotationContainerView invalidateCustomFeatureDataSourceRect:](self, "invalidateCustomFeatureDataSourceRect:", v9, v11, v13, v15);
}

- (void)invalidateCustomFeatureDataSourceRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v8 = self->_customFeatureDataSourceObservers;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "dataSource:featuresDidChangeForRect:", self, v6, v5, var0, var1, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)finishAddingAndRemovingAnnotationViews
{
  [(MKAnnotationContainerView *)self updateAnnotationViewsForReason:0];

  [(MKAnnotationContainerView *)self invalidateCustomFeatureDataSource];
}

- (void)dropPinsIfNeeded
{
}

- (void)annotationViewDidChangeHidden:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(MKAnnotationContainerView *)self _updatePriorityMapIfNeeded];
  [(MKAnnotationContainerView *)self bounds];
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v14 = [(MKAnnotationContainerView *)self annotationViews];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          -[MKAnnotationContainerView _updateZPositionForAnnotationView:inBounds:](self, "_updateZPositionForAnnotationView:inBounds:", *(void *)(*((void *)&v19 + 1) + 8 * v18++), v10, v11, v12, v13);
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
  else
  {
    -[MKAnnotationContainerView _updateZPositionForAnnotationView:inBounds:](self, "_updateZPositionForAnnotationView:inBounds:", v4, v6, v7, v8, v9);
  }
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_mapRectWithFraction:(double)a3 ofVisible:(id)a4
{
  double var1 = a4.var1.var1;
  double var0 = a4.var1.var0;
  double v6 = INFINITY;
  if (a4.var0.var0 == INFINITY && a4.var0.var1 == INFINITY)
  {
    double v10 = INFINITY;
  }
  else
  {
    double v8 = -(a4.var1.var1 * a3);
    double v9 = -(var0 * a3);
    double v10 = a4.var0.var0 + v9;
    double v6 = a4.var0.var1 + v8;
    double var0 = var0 - v9 * 2.0;
    double var1 = a4.var1.var1 - v8 * 2.0;
  }
  v15.size.CGFloat width = 268435456.0;
  v15.origin.CGFloat x = 0.0;
  v15.origin.CGFloat y = 0.0;
  v15.size.CGFloat height = 268435456.0;
  double v11 = v10;
  double v12 = var0;
  $FD2884BA735A6398BD92EEF91FE53E55 result = ($FD2884BA735A6398BD92EEF91FE53E55)MKMapRectIntersection(v15, *(MKMapRect *)(&v6 - 1));
  double v13 = v10;
  double v14 = var0;
  result.var1.double var0 = v14;
  result.var0.double var0 = v13;
  return result;
}

- (void)_dropPinsIfNeeded:(BOOL)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  pinsToAnimate = self->_pinsToAnimate;
  if (a3)
  {
    if ([(NSMutableArray *)pinsToAnimate count])
    {
      [(MKAnnotationContainerView *)self _visibleCenteringRect];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      double v13 = self->_pinsToAnimate;
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        id v16 = 0;
        uint64_t v17 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v42 != v17) {
              objc_enumerationMutation(v13);
            }
            long long v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            [v19 frame];
            v50.origin.CGFloat x = v20;
            v50.origin.CGFloat y = v21;
            v50.size.CGFloat width = v22;
            v50.size.CGFloat height = v23;
            v49.origin.CGFloat x = v6;
            v49.origin.CGFloat y = v8;
            v49.size.CGFloat width = v10;
            v49.size.CGFloat height = v12;
            if (CGRectIntersectsRect(v49, v50))
            {
              if (!v16) {
                id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              [v16 addObject:v19];
            }
          }
          uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v15);
      }
      else
      {
        id v16 = 0;
      }

      [(NSMutableArray *)self->_pinsToAnimate removeAllObjects];
      if (v16)
      {
        if (![(NSMutableArray *)self->_awaitingDropPins count])
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained annotationContainerWillDropPins:self];
        }
        [(NSMutableArray *)self->_awaitingDropPins addObjectsFromArray:v16];
        objc_msgSend(v16, "_mapkit_sortUsingLongitude");
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v25 = v16;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v38;
          double v29 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v38 != v28) {
                objc_enumerationMutation(v25);
              }
              double v31 = *(void **)(*((void *)&v37 + 1) + 8 * j);
              double v36 = 0.0;
              id v32 = objc_loadWeakRetained((id *)&self->_delegate);
              long long v33 = [v31 annotation];
              [v33 coordinate];
              objc_msgSend(v32, "annotationContainer:pinDropDistanceForCoordinate:maxDistance:", self, &v36);
              double v35 = v34;

              [v31 _dropFromDistance:v35 maxDistance:v36 withDelay:v29];
              double v29 = v29 + 0.05;
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v27);
        }
      }
    }
  }
  else
  {
    [(NSMutableArray *)pinsToAnimate removeAllObjects];
  }
}

- (void)updateAnnotationViewsWithDelay
{
}

- (void)_updateCollidableAnnotationViews
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  collidableAnnotationViews = self->_collidableAnnotationViews;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __61__MKAnnotationContainerView__updateCollidableAnnotationViews__block_invoke;
  v34[3] = &unk_1E54BEB18;
  v34[4] = self;
  id v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:v34];
  double v5 = [(NSMutableSet *)collidableAnnotationViews filteredSetUsingPredicate:v4];

  CGFloat v6 = [(NSMutableDictionary *)self->_collidingAnnotationViews objectForKey:@"_MK_COLLISSIONS_"];
  uint64_t v28 = [[MKSpatialCollider alloc] initWithAnnotationViews:v5 previousCollissions:v6 options:3];
  double v7 = [MEMORY[0x1E4F1CA70] orderedSetWithSet:v5];
  [v7 sortUsingComparator:&__block_literal_global_91];
  if ([v7 count])
  {
    uint64_t v24 = v6;
    id v25 = v5;
    requiredPriorityAnnotationViews = self->_requiredPriorityAnnotationViews;
    double v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_56];
    CGFloat v10 = [(NSMutableArray *)requiredPriorityAnnotationViews filteredArrayUsingPredicate:v9];

    unint64_t v11 = 0;
    uint64_t v26 = v10;
    uint64_t v27 = v7;
    while (1)
    {
      if (![v7 count] && v11 >= objc_msgSend(v10, "count"))
      {

        CGFloat v6 = v24;
        double v5 = v25;
        goto LABEL_26;
      }
      unint64_t v12 = [v10 count];
      if (v11 < v12)
      {
        double v13 = (MKAnnotationView *)[v10 objectAtIndex:v11];
        unint64_t v14 = v11 + 1;
      }
      else
      {
        double v13 = (MKAnnotationView *)[v7 firstObject];
        unint64_t v14 = v11;
      }
      uint64_t v15 = [(MKSpatialCollider *)v28 viewsCollidingWithAnnotationView:v13 inCollidableList:v11 >= v12];
      id v16 = v15;
      if (!v15) {
        break;
      }
      unint64_t v29 = v14;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            CGFloat v21 = *(MKAnnotationView **)(*((void *)&v30 + 1) + 8 * i);
            if (v21 != v13)
            {
              [*(id *)(*((void *)&v30 + 1) + 8 * i) _setHidden:1 forReason:5 animated:1];
              if (self->_selectedAnnotationView == v21) {
                [(MKAnnotationContainerView *)self deselectAnnotationView:v21 animated:1];
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v18);
      }
      double v7 = v27;
      [v27 removeObjectsInArray:v16];
      CGFloat v10 = v26;
      unint64_t v14 = v29;
      if (v11 >= v12) {
        goto LABEL_23;
      }
LABEL_24:

      unint64_t v11 = v14;
    }
    if (v11 < v12) {
      goto LABEL_24;
    }
    [v7 removeObjectAtIndex:0];
LABEL_23:
    [(MKAnnotationView *)v13 _setHidden:0 forReason:5 animated:1];
    goto LABEL_24;
  }
LABEL_26:
  collidingAnnotationViews = self->_collidingAnnotationViews;
  CGFloat v23 = [(MKSpatialCollider *)v28 registeredCollissions];
  [(NSMutableDictionary *)collidingAnnotationViews setObject:v23 forKey:@"_MK_COLLISSIONS_"];
}

- (MKAnnotationContainerView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MKAnnotationContainerView;
  uint64_t v3 = -[MKAnnotationContainerView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    awaitingDropPins = v3->_awaitingDropPins;
    v3->_awaitingDropPins = v4;

    CGFloat v6 = [MKPriorityToIndexMap alloc];
    double v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1ED97F680, &unk_1ED97F690, &unk_1ED97F6A0, &unk_1ED97F6B0, 0);
    uint64_t v8 = [(MKPriorityToIndexMap *)v6 initWithPriorities:v7];
    priorityMap = v3->_priorityMap;
    v3->_priorityMap = (MKPriorityToIndexMap *)v8;

    CGFloat v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    prioritiesToAdd = v3->_prioritiesToAdd;
    v3->_prioritiesToAdd = v10;

    [(MKAnnotationContainerView *)v3 setAccessibilityIdentifier:@"AnnotationContainer"];
    unint64_t v12 = v3;
  }

  return v3;
}

- (void)_addPrioritiesForAnnotationViewIfNeeded:(id)a3
{
  id v18 = a3;
  [v18 zPriority];
  float v5 = v4;
  float v6 = 0.0;
  if (v5 > 0.0) {
    objc_msgSend(v18, "zPriority", 0.0);
  }
  float v7 = fminf(v6, 1000.0);
  if (![(MKPriorityToIndexMap *)self->_priorityMap containsPriority:v7])
  {
    prioritiesToAdd = self->_prioritiesToAdd;
    *(float *)&double v8 = v7;
    CGFloat v10 = [NSNumber numberWithFloat:v8];
    [(NSMutableSet *)prioritiesToAdd addObject:v10];
  }
  [v18 selectedZPriority];
  float v12 = v11;
  float v13 = 0.0;
  if (v12 > 0.0) {
    objc_msgSend(v18, "selectedZPriority", 0.0);
  }
  float v14 = fminf(v13, 1000.0);
  if (![(MKPriorityToIndexMap *)self->_priorityMap containsPriority:v14])
  {
    id v16 = self->_prioritiesToAdd;
    *(float *)&double v15 = v14;
    uint64_t v17 = [NSNumber numberWithFloat:v15];
    [(NSMutableSet *)v16 addObject:v17];
  }
}

- (void)setMapType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_mapType != a3)
  {
    self->_mapType = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    float v4 = [(MKAnnotationContainerView *)self annotationViews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) _setMapType:a3];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)sceneState
{
  return 1;
}

- (unsigned)sceneID
{
  return 0;
}

- (BOOL)isClusteringEnabled
{
  return 0;
}

- (void)addAnnotationView:(id)a3 allowAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6) {
    goto LABEL_50;
  }
  id v55 = v6;
  uint64_t v7 = [v6 annotation];
  int v8 = [v7 _isMKClusterAnnotation];

  if (v8)
  {
    long long v9 = [v55 annotation];
    long long v10 = [v9 clusteringIdentifier];

    long long v11 = [(MKAnnotationContainerView *)self _existingClusterViewsForClusterID:v10];
    goto LABEL_4;
  }
  long long v10 = [v55 clusteringIdentifier];
  if (v10)
  {
    float v13 = [v55 annotation];
    char v14 = [v13 _isMKClusterAnnotation];

    if ((v14 & 1) == 0)
    {
      clusterableAnnotationViews = self->_clusterableAnnotationViews;
      if (!clusterableAnnotationViews)
      {
        long long v32 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v33 = self->_clusterableAnnotationViews;
        self->_clusterableAnnotationViews = v32;

        clusterableAnnotationViews = self->_clusterableAnnotationViews;
      }
      long long v11 = [(NSMutableDictionary *)clusterableAnnotationViews objectForKey:v10];
      if (!v11)
      {
        long long v12 = [MEMORY[0x1E4F1CA80] setWithObject:v55];
        [(NSMutableDictionary *)self->_clusterableAnnotationViews setObject:v12 forKey:v10];
        goto LABEL_5;
      }
LABEL_4:
      long long v12 = v11;
      [v11 addObject:v55];
LABEL_5:
    }
  }

  [v55 displayPriority];
  if (v15 >= 1000.0)
  {
    p_requiredPriorityAnnotationViews = (void **)&self->_requiredPriorityAnnotationViews;
    requiredPriorityAnnotationViews = self->_requiredPriorityAnnotationViews;
    if (requiredPriorityAnnotationViews) {
      goto LABEL_14;
    }
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    p_requiredPriorityAnnotationViews = (void **)&self->_collidableAnnotationViews;
    requiredPriorityAnnotationViews = self->_collidableAnnotationViews;
    if (requiredPriorityAnnotationViews) {
      goto LABEL_14;
    }
    uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
  }
  uint64_t v19 = *p_requiredPriorityAnnotationViews;
  *p_requiredPriorityAnnotationViews = (void *)v18;

  requiredPriorityAnnotationViews = *p_requiredPriorityAnnotationViews;
LABEL_14:
  [requiredPriorityAnnotationViews addObject:v55];
  if (!self->_collidingAnnotationViews)
  {
    CGFloat v20 = [MEMORY[0x1E4F1CA60] dictionary];
    collidingAnnotationViews = self->_collidingAnnotationViews;
    self->_collidingAnnotationViews = v20;
  }
  [v55 _invalidateCachedCoordinate];
  [v55 _setMapType:self->_mapType];
  [v55 _setMapDisplayStyle:*(unsigned int *)&self->_mapDisplayStyle.timePeriod | ((unint64_t)*(unsigned __int16 *)&self->_mapDisplayStyle.searchResultsType << 32)];
  [v55 _setMapPitchRadians:self->_mapPitchRadians];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v55 _setDelegate:self], v4)) {
    int v22 = [v55 animatesDrop] ^ 1;
  }
  else {
    int v22 = 1;
  }
  if ([v55 canShowCallout] && objc_msgSend(v55, "clipsToBounds"))
  {
    uint64_t v49 = [NSString stringWithFormat:@"%@ cannot show callout with clipsToBounds enabled", v55];
    CGRect v50 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v51 = *MEMORY[0x1E4F1C3A8];
    goto LABEL_56;
  }
  BOOL v23 = _MKLinkedOnOrAfterReleaseSet(1539);
  int v24 = [v55 canShowCallout];
  if (!v23)
  {
    if (!v24) {
      goto LABEL_34;
    }
    uint64_t v26 = [v55 annotation];
    char v27 = objc_opt_respondsToSelector();

    if (v27) {
      goto LABEL_34;
    }
    uint64_t v28 = NSString;
    unint64_t v29 = [v55 annotation];
    uint64_t v30 = [v28 stringWithFormat:@"%@ must implement title when canShowCallout is YES on corresponding view %@", v29, v55];
LABEL_55:

    CGRect v50 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v51 = *MEMORY[0x1E4F1C3A8];
    uint64_t v49 = v30;
LABEL_56:
    id v54 = [v50 exceptionWithName:v51 reason:v49 userInfo:0];
    objc_exception_throw(v54);
  }
  if (v24)
  {
    id v25 = [v55 annotation];
    if (objc_opt_respondsToSelector())
    {

      goto LABEL_34;
    }
    double v34 = [v55 detailCalloutAccessoryView];

    if (v34) {
      goto LABEL_34;
    }
    v52 = NSString;
    unint64_t v29 = [v55 annotation];
    v53 = [v55 detailCalloutAccessoryView];
    uint64_t v30 = [v52 stringWithFormat:@"%@ must implement title, or view %@ must have a non-nil detailCalloutAccessoryView when canShowCallout is YES on corresponding view %@", v29, v53, v55];

    goto LABEL_55;
  }
LABEL_34:
  annotationViews = self->_annotationViews;
  if (!annotationViews)
  {
    uint64_t v36 = (NSMutableOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:10];
    long long v37 = self->_annotationViews;
    self->_annotationViews = v36;

    annotationViews = self->_annotationViews;
  }
  [(NSMutableOrderedSet *)annotationViews addObject:v55];
  if ([(id)objc_opt_class() _isInitiallyHiddenWhenAdded]) {
    [v55 _setHidden:1 forReason:1 animated:0];
  }
  [(MKAnnotationContainerView *)self addSubview:v55];
  long long v38 = [v55 clusteringIdentifier];
  if (v38)
  {
    clusteringAnnotationViews = self->_clusteringAnnotationViews;
    if (!clusteringAnnotationViews)
    {
      long long v40 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v41 = self->_clusteringAnnotationViews;
      self->_clusteringAnnotationViews = v40;

      clusteringAnnotationViews = self->_clusteringAnnotationViews;
    }
    long long v42 = [(NSMutableDictionary *)clusteringAnnotationViews objectForKey:v38];
    if (v42)
    {
      long long v43 = v42;
      [v42 addObject:v55];
    }
    else
    {
      long long v43 = [MEMORY[0x1E4F1CA80] setWithObject:v55];
      [(NSMutableDictionary *)self->_clusteringAnnotationViews setObject:v43 forKey:v38];
    }
  }
  [(MKAnnotationContainerView *)self _addPrioritiesForAnnotationViewIfNeeded:v55];
  long long v44 = +[MKThreadContext currentContext];
  objc_msgSend(v44, "_CA_setDisableActions:", 1);

  [(MKAnnotationContainerView *)self _updateAnnotationView:v55];
  __int16 v45 = +[MKThreadContext currentContext];
  objc_msgSend(v45, "_CA_setDisableActions:", 0);

  if (((!v4 | v22) & 1) == 0)
  {
    pinsToAnimate = self->_pinsToAnimate;
    if (!pinsToAnimate)
    {
      uint64_t v47 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v48 = self->_pinsToAnimate;
      self->_pinsToAnimate = v47;

      pinsToAnimate = self->_pinsToAnimate;
    }
    [(NSMutableArray *)pinsToAnimate addObject:v55];
  }

  id v6 = v55;
LABEL_50:
}

- (void)_updateAnnotationView:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = a3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(MKAnnotationContainerView *)self _updateAnnotationViews:v4];
}

- (MKAnnotationView)userLocationView
{
  return self->_userLocationView;
}

- (void)_performStateUpdatesIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableOrderedSet *)self->_annotationViews count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      BOOL v4 = (void *)[(NSMutableOrderedSet *)self->_annotationViews copy];
      [MEMORY[0x1E4F39CF8] begin];
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_performStateUpdatesIfNeeded", (void)v10);
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }

      [MEMORY[0x1E4F39CF8] commit];
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  customFeatureDataSourceObservers = self->_customFeatureDataSourceObservers;
  id v8 = v4;
  if (!customFeatureDataSourceObservers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_customFeatureDataSourceObservers;
    self->_customFeatureDataSourceObservers = v6;

    id v4 = v8;
    customFeatureDataSourceObservers = self->_customFeatureDataSourceObservers;
  }
  [(NSMutableArray *)customFeatureDataSourceObservers addObject:v4];
}

- (id)annotationsInMapRect:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_annotationViews;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isProvidingCustomFeature", (void)v13))
        {
          [v10 coordinate];
          GEOMapPointForCoordinate();
          if (GEOMapRectContainsPoint())
          {
            long long v11 = [v10 customFeatureAnnotation];
            [v4 addObject:v11];
          }
        }
      }
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)setUserLocationView:(id)a3
{
  id v5 = (MKAnnotationView *)a3;
  p_userLocationView = &self->_userLocationView;
  userLocationView = self->_userLocationView;
  if (userLocationView != v5)
  {
    if (userLocationView) {
      [(MKAnnotationView *)userLocationView _setPresentationCoordinateChangedCallback:0];
    }
    objc_storeStrong((id *)&self->_userLocationView, a3);
    if (*p_userLocationView)
    {
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __49__MKAnnotationContainerView_setUserLocationView___block_invoke;
      v8[3] = &unk_1E54B8CB0;
      objc_copyWeak(&v9, &location);
      [(MKAnnotationView *)*p_userLocationView _setPresentationCoordinateChangedCallback:v8];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_updateAnnotationViewsWithDelay object:0];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__performStateUpdatesIfNeeded object:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(MKAnnotationContainerView *)self annotationViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 _setDelegate:0];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(MKAnnotationContainerView *)self setUserLocationView:0];
  v10.receiver = self;
  v10.super_class = (Class)MKAnnotationContainerView;
  [(MKAnnotationContainerView *)&v10 dealloc];
}

- (MKAnnotationContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKAnnotationContainerViewDelegate *)WeakRetained;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapDisplayStyle:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((((*(unsigned int *)&self->_mapDisplayStyle.timePeriod | ((unint64_t)*(unsigned __int16 *)&self->_mapDisplayStyle.searchResultsType << 32)) ^ *(void *)&a3.var0) & 0x1FFFFFFFFFFLL) != 0)
  {
    uint64_t v3 = *(void *)&a3.var0;
    self->_mapDisplayStyle = ($4CDE9EFBD0E8DAF50B82D23E2BCF9383)a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(MKAnnotationContainerView *)self annotationViews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = v3 & 0xFFFFFFFFFFFFLL;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) _setMapDisplayStyle:v7];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)calloutContainsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = self;
  uint64_t v6 = [(MKAnnotationView *)self->_selectedAnnotationView _calloutView];
  LOBYTE(v5) = -[MKAnnotationContainerView _view:containsPoint:](v5, "_view:containsPoint:", v6, x, y);

  return (char)v5;
}

- (BOOL)accessoryContainsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = self;
  uint64_t v6 = [(MKAnnotationView *)self->_selectedAnnotationView _selectionAccessoryView];
  LOBYTE(v5) = -[MKAnnotationContainerView _view:containsPoint:](v5, "_view:containsPoint:", v6, x, y);

  return (char)v5;
}

- (BOOL)_view:(id)a3 containsPoint:(CGPoint)a4
{
  if (!a3) {
    return 0;
  }
  double y = a4.y;
  double x = a4.x;
  selectedAnnotationView = self->_selectedAnnotationView;
  id v8 = a3;
  -[MKAnnotationContainerView convertPoint:toView:](self, "convertPoint:toView:", selectedAnnotationView, x, y);
  id v9 = -[MKAnnotationView hitTest:withEvent:](self->_selectedAnnotationView, "hitTest:withEvent:", 0);
  LOBYTE(selectedAnnotationView) = [v9 isDescendantOfView:v8];

  return (char)selectedAnnotationView;
}

- (CGRect)_visibleCenteringRect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained visibleCenteringRectInView:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)_visibleCenteringRectInView:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained visibleCenteringRectInView:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)_visibleRect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained visibleRectInView:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (MKPinAnnotationView)bubblePin
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    selectedAnnotationView = self->_selectedAnnotationView;
  }
  else {
    selectedAnnotationView = 0;
  }

  return (MKPinAnnotationView *)selectedAnnotationView;
}

- (void)removeAnnotationViewsRotationAnimations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(MKAnnotationContainerView *)self annotationViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) layer];
        [v7 removeAnimationForKey:0x1ED920088];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)setSuppressCallout:(BOOL)a3
{
  if (self->_suppressCallout != a3)
  {
    self->_suppressCallout = a3;
    [(MKAnnotationView *)self->_selectedAnnotationView updateCalloutViewIfNeededAnimated:1];
  }
}

- (void)updateCalloutStateForSelectedAnnotationView:(id)a3
{
  uint64_t v4 = (MKAnnotationView *)a3;
  if (!self->_suppressCallout && self->_selectedAnnotationView == v4)
  {
    uint64_t v5 = v4;
    [(MKAnnotationView *)v4 updateCalloutViewIfNeededAnimated:1];
    uint64_t v4 = v5;
  }
}

- (void)deselectAnnotationView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (MKAnnotationView *)a3;
  if (v6)
  {
    annotationViewToSelect = self->_annotationViewToSelect;
    self->_annotationViewToSelect = 0;
    double v16 = v6;

    uint64_t v6 = v16;
    selectedAnnotationView = self->_selectedAnnotationView;
    if (selectedAnnotationView) {
      BOOL v9 = selectedAnnotationView == v16;
    }
    else {
      BOOL v9 = 0;
    }
    if (!v9) {
      goto LABEL_13;
    }
    [(MKAnnotationView *)v16 _setSelected:0 animated:v4];
    long long v10 = [(MKAnnotationView *)v16 annotation];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v12 = [(UIView *)self _mapKit_mapView];
      uint64_t v13 = [(MKAnnotationView *)v16 annotation];
      [v12 removeAnnotation:v13];
    }
    double v14 = self->_selectedAnnotationView;
    self->_selectedAnnotationView = 0;

    [(MKAnnotationContainerView *)self updateAnnotationViewsForReason:0];
  }
  else
  {
    double v15 = self->_selectedAnnotationView;
    if (!v15) {
      goto LABEL_13;
    }
    double v16 = 0;
    [(MKAnnotationContainerView *)self deselectAnnotationView:v15 animated:v4];
  }
  uint64_t v6 = v16;
LABEL_13:
}

uint64_t __77__MKAnnotationContainerView__updateAnnotationViewsForReason_updatePositions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateClusterableAnnotationViews:a3 withID:a2];
}

- (CLLocationCoordinate2D)coordinateForAnnotationView:(id)a3
{
  BOOL v4 = [a3 layer];
  [v4 position];
  double v6 = v5;
  double v8 = v7;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "convertPoint:toCoordinateFromView:", self, v6, v8);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.longitude = v15;
  result.latitude = v14;
  return result;
}

- (CGPoint)pointForCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "convertCoordinate:toPointToView:", self, latitude, longitude);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)updateUserLocationView
{
  if (self->_userLocationView) {
    -[MKAnnotationContainerView _updateAnnotationView:](self, "_updateAnnotationView:");
  }
}

- (id)_annotationViewForSelectionAtPoint:(CGPoint)a3 avoidCurrent:(BOOL)a4 maxDistance:(double)a5
{
  BOOL v6 = a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  double v10 = [(MKAnnotationContainerView *)self annotationViews];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v11)
  {

    if (!v6) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  uint64_t v12 = v11;
  double v13 = 0;
  uint64_t v14 = *(void *)v43;
  double v15 = 0.0;
  float v16 = 1000.0;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v43 != v14) {
        objc_enumerationMutation(v10);
      }
      uint64_t v18 = *(MKAnnotationView **)(*((void *)&v42 + 1) + 8 * i);
      if ([(MKAnnotationView *)v18 _isSelectable]
        && ![(MKAnnotationView *)v18 isHidden]
        && (!v6 || self->_selectedAnnotationView != v18))
      {
        [(MKAnnotationView *)v18 _significantBounds];
        -[MKAnnotationContainerView convertRect:fromView:](self, "convertRect:fromView:", v18);
        MKDistanceBetweenPointAndRect(x, y, v19, v20, v21, v22);
        if (v23 <= a5)
        {
          double v24 = v23;
          if (!v13) {
            goto LABEL_20;
          }
          [(MKAnnotationView *)v13 _selectionPriority];
          float v26 = v25;
          [(MKAnnotationView *)v18 _selectionPriority];
          if (v26 <= v27)
          {
            [(MKAnnotationView *)v13 _selectionPriority];
            float v29 = v28;
            [(MKAnnotationView *)v18 _selectionPriority];
            if (vabds_f32(v29, v30) >= 0.000001 || v24 <= v15)
            {
              if (vabdd_f64(v15, v24) >= 0.000001 || ([(MKAnnotationView *)v18 zPriority], v16 <= v32))
              {
LABEL_20:
                long long v33 = v18;

                [(MKAnnotationView *)v33 zPriority];
                float v16 = v34;
                double v15 = v24;
                double v13 = v33;
              }
            }
          }
        }
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
  }
  while (v12);

  if (!v13 && v6)
  {
LABEL_27:
    selectedAnnotationView = self->_selectedAnnotationView;
    if (selectedAnnotationView)
    {
      [(MKAnnotationView *)selectedAnnotationView frame];
      MKDistanceBetweenPointAndRect(x, y, v36, v37, v38, v39);
      if (v40 <= a5)
      {
        double v13 = self->_selectedAnnotationView;
        goto LABEL_31;
      }
    }
LABEL_29:
    double v13 = 0;
  }
LABEL_31:

  return v13;
}

- (id)annotationViewForPoint:(CGPoint)a3
{
  return -[MKAnnotationContainerView _annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:](self, "_annotationViewForSelectionAtPoint:avoidCurrent:maxDistance:", 0, a3.x, a3.y, 10.0);
}

- (void)_liftForDragging:(id)a3 mouseDownPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v11 = a3;
  self->_clickedOnAnnotationView = 1;
  self->_mouseDownPoint.CGFloat x = x;
  self->_mouseDownPoint.CGFloat y = y;
  objc_storeStrong((id *)&self->_draggingAnnotationView, a3);
  self->_didDragAnnotationView = 0;
  [v11 setDragState:1 animated:1];
  [v11 center];
  self->_draggingAnnotationViewCenter.CGFloat x = v8;
  self->_draggingAnnotationViewCenter.CGFloat y = v9;
  if ([v11 collisionMode] != 2
    || ([v11 clusteringIdentifier],
        double v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    [(MKAnnotationContainerView *)self updateAnnotationViewsForReason:0];
  }
}

- (void)_draggingAnnotationViewDidPause:(id)a3
{
  self->_previousMouseDragTimeStamp = 0.0;
}

- (void)draggingTouchMovedToPoint:(CGPoint)a3 edgeInsets:(UIEdgeInsets)a4
{
  draggingAnnotationView = self->_draggingAnnotationView;
  if (draggingAnnotationView)
  {
    double y = a3.y;
    double x = a3.x;
    if ([(MKAnnotationView *)draggingAnnotationView dragState] == MKAnnotationViewDragStateDragging|| [(MKAnnotationView *)self->_draggingAnnotationView dragState] == MKAnnotationViewDragStateStarting)
    {
      double v8 = x - self->_mouseDownPoint.x;
      double v9 = y - self->_mouseDownPoint.y;
      if (v8 != 0.0 || v9 != 0.0)
      {
        self->_didDragAnnotationView = 1;
        -[MKAnnotationView setCenter:](self->_draggingAnnotationView, "setCenter:", v8 + self->_draggingAnnotationViewCenter.x, v9 + self->_draggingAnnotationViewCenter.y);
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v11 = v10;
        double previousMouseDragTimeStamp = self->_previousMouseDragTimeStamp;
        if (previousMouseDragTimeStamp > 0.0)
        {
          -[MKAnnotationView _didDragWithVelocity:](self->_draggingAnnotationView, "_didDragWithVelocity:", (x - self->_previousMouseDragPoint.x) / (v11 - previousMouseDragTimeStamp), (y - self->_previousMouseDragPoint.y) / (v11 - previousMouseDragTimeStamp));
          [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__draggingAnnotationViewDidPause_ object:self->_draggingAnnotationView];
          [(MKAnnotationContainerView *)self performSelector:sel__draggingAnnotationViewDidPause_ withObject:self->_draggingAnnotationView afterDelay:0.2];
        }
        self->_double previousMouseDragTimeStamp = v11;
        self->_previousMouseDragPoint.double x = x;
        self->_previousMouseDragPoint.double y = y;
      }
    }
  }
}

- (CGPoint)draggingAnnotationViewDropPoint
{
  BOOL didDragAnnotationView = self->_didDragAnnotationView;
  draggingAnnotationView = self->_draggingAnnotationView;
  if (didDragAnnotationView)
  {
    [(MKAnnotationView *)draggingAnnotationView center];
    double v6 = v5;
    double v8 = v7;
    [(MKAnnotationView *)self->_draggingAnnotationView _draggingDropOffset];
    double v10 = v6 - v9;
    double v12 = v8 - v11;
  }
  else
  {
    [(MKAnnotationView *)draggingAnnotationView coordinate];
    double v14 = v13;
    double v16 = v15;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "convertCoordinate:toPointToView:", self, v14, v16);
    double v10 = v18;
    double v12 = v19;
  }
  double v20 = v10;
  double v21 = v12;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (CGPoint)draggingAnnotationViewDropPointForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(MKAnnotationView *)self->_draggingAnnotationView centerOffset];
  double v6 = x - v5;
  double v8 = y - v7;
  result.double y = v8;
  result.double x = v6;
  return result;
}

- (void)_dropDraggingAnnotationViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_didDragAnnotationView)
  {
    [(MKAnnotationContainerView *)self draggingAnnotationViewDropPoint];
    double v6 = v5;
    double v8 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "convertPoint:toCoordinateFromView:", self, v6, v8);
    double v11 = v10;
    double v13 = v12;

    v23.double latitude = v11;
    v23.double longitude = v13;
    if (CLLocationCoordinate2DIsValid(v23))
    {
      double v14 = [(MKAnnotationView *)self->_draggingAnnotationView annotation];
      objc_msgSend(v14, "setCoordinate:", v11, v13);
    }
    uint64_t v15 = 4;
  }
  else
  {
    uint64_t v15 = 3;
  }
  [(MKAnnotationView *)self->_draggingAnnotationView setDragState:v15 animated:v3];
  if (_MKLinkedOnOrAfterReleaseSet(2053)
    && (!_MKLinkedOnOrAfterReleaseSet(2310)
     || ![self->_draggingAnnotationView _mapkit_implementationOfSelector:sel_setDragState_animated_ isFromSubclassOfClass:objc_opt_class()]))
  {
    [(MKAnnotationView *)self->_draggingAnnotationView setDragState:0 animated:v3];
  }
  double v21 = self->_draggingAnnotationView;
  draggingAnnotationView = self->_draggingAnnotationView;
  self->_draggingAnnotationView = 0;

  double v17 = v21;
  if (self->_annotationViewToSelect == v21)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v17 = v21;
    if ((isKindOfClass & 1) == 0)
    {
      [(MKAnnotationContainerView *)self selectAnnotationView:self->_annotationViewToSelect animated:v3];
      annotationViewToSelect = self->_annotationViewToSelect;
      self->_annotationViewToSelect = 0;

      double v17 = v21;
    }
  }
  if ([(MKAnnotationView *)v17 collisionMode] != MKAnnotationViewCollisionModeNone
    || ([(MKAnnotationView *)v21 clusteringIdentifier],
        double v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v20))
  {
    [(MKAnnotationContainerView *)self updateAnnotationViewsForReason:0];
  }
}

- (void)pinDidDrop:(id)a3 animated:(BOOL)a4
{
  uint64_t v5 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_awaitingDropPins, "indexOfObjectIdenticalTo:", a3, a4);
  awaitingDropPins = self->_awaitingDropPins;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(NSMutableArray *)awaitingDropPins count]) {
      return;
    }
  }
  else
  {
    -[NSMutableArray removeObjectAtIndex:](awaitingDropPins, "removeObjectAtIndex:");
    if ([(NSMutableArray *)self->_awaitingDropPins count]) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained annotationContainerDidDropPins:self];
  }
  annotationViewToSelect = self->_annotationViewToSelect;
  if (annotationViewToSelect)
  {
    self->_annotationViewToSelect = 0;
    double v9 = annotationViewToSelect;

    [(MKAnnotationContainerView *)self selectAnnotationView:v9 animated:1];
  }
}

- (UIEdgeInsets)accessoryPadding
{
  +[MKPinAnnotationView _perceivedSize];
  double v3 = v2;
  double v5 = v4 + v4;
  double v6 = v2 + 50.0;
  double v7 = v5;
  result.right = v5;
  result.bottom = v3;
  result.left = v7;
  result.top = v6;
  return result;
}

- (BOOL)hasDroppingPins
{
  return [(NSMutableArray *)self->_awaitingDropPins count] != 0;
}

- (BOOL)hasPendingAnimations
{
  if (![(MKAnnotationContainerView *)self hasDroppingPins])
  {
    double v6 = [(MKAnnotationContainerView *)self bubblePin];
    if (!v6
      || ([(MKAnnotationContainerView *)self bubblePin],
          double v2 = objc_claimAutoreleasedReturnValue(),
          [v2 superview],
          (double v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      draggingAnnotationView = self->_draggingAnnotationView;
      BOOL v5 = draggingAnnotationView != 0;
      if (draggingAnnotationView
        && [(MKAnnotationView *)draggingAnnotationView dragState] != MKAnnotationViewDragStateStarting)
      {
        BOOL v5 = [(MKAnnotationView *)self->_draggingAnnotationView dragState] == MKAnnotationViewDragStateEnding;
      }
      if (!v6) {
        goto LABEL_11;
      }
    }
    else
    {
      BOOL v5 = 1;
    }

LABEL_11:
    return v5;
  }
  return 1;
}

void __49__MKAnnotationContainerView_setUserLocationView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateUserLocationView];
}

- (void)_willRemoveInternalAnnotationView:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v5;
    [v4 _setDelegate:0];
    [v4 _stopDrop];
    [(NSMutableArray *)self->_awaitingDropPins removeObjectIdenticalTo:v4];
  }
}

- (void)removeAnnotationView:(id)a3
{
  id v4 = (MKAnnotationView *)a3;
  if ([v4 _mapkit_isInternalAnnotationView]) {
    [(MKAnnotationContainerView *)self _willRemoveInternalAnnotationView:v4];
  }
  if (self->_annotationViewToSelect == v4)
  {
    self->_annotationViewToSelect = 0;
  }
  id v5 = [(MKAnnotationView *)v4 clusteringIdentifier];
  if (v5)
  {
    double v6 = [(MKAnnotationView *)v4 annotation];
    int v7 = [v6 _isMKClusterAnnotation];

    if (v7)
    {
      double v8 = [(NSMutableDictionary *)self->_existingClusterAnnotationViews objectForKey:v5];
      [v8 removeObject:v4];
    }
    else
    {
      double v9 = [(NSMutableDictionary *)self->_clusterableAnnotationViews objectForKey:v5];
      [v9 removeObject:v4];

      double v8 = [(MKAnnotationView *)v4 clusterAnnotationView];
      if (v8)
      {
        double v10 = [(MKAnnotationContainerView *)self delegate];
        [v10 annotationContainer:self requestRemovingClusterAnnotationView:v8 updateVisible:1];
      }
    }
  }
  [(MKAnnotationView *)v4 displayPriority];
  if (v11 >= 1000.0)
  {
    [(NSMutableArray *)self->_requiredPriorityAnnotationViews removeObject:v4];
  }
  else
  {
    [(NSMutableSet *)self->_collidableAnnotationViews removeObject:v4];
    [(NSMutableDictionary *)self->_collidingAnnotationViews removeAllObjects];
  }
  double v12 = +[MKThreadContext currentContext];
  objc_msgSend(v12, "_CA_setDisableActions:", 1);

  double v13 = [(MKAnnotationView *)v4 layer];
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v20[0] = *MEMORY[0x1E4F1DAB8];
  v20[1] = v14;
  v20[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v13 setAffineTransform:v20];

  uint64_t v15 = [(MKAnnotationView *)v4 layer];
  [v15 removeAnimationForKey:0x1ED920088];

  double v16 = +[MKThreadContext currentContext];
  objc_msgSend(v16, "_CA_setDisableActions:", 0);

  [(MKAnnotationView *)v4 removeFromSuperview];
  if (self->_selectedAnnotationView == v4) {
    [(MKAnnotationContainerView *)self deselectAnnotationView:v4 animated:0];
  }
  [(NSMutableOrderedSet *)self->_annotationViews removeObject:v4];
  [(NSMutableArray *)self->_pinsToAnimate removeObject:v4];
  double v17 = [(MKAnnotationView *)v4 clusteringIdentifier];
  if (v17)
  {
    double v18 = [(NSMutableDictionary *)self->_clusteringAnnotationViews objectForKey:v17];
    double v19 = v18;
    if (v18) {
      [v18 removeObject:v4];
    }
  }
}

- (void)selectAnnotationView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v12 = (MKAnnotationView *)a3;
  annotationViewToSelect = self->_annotationViewToSelect;
  self->_annotationViewToSelect = 0;

  BOOL v8 = [(MKAnnotationView *)v12 _isSelectable];
  double v9 = v12;
  if (v8)
  {
    if ([(MKAnnotationContainerView *)self hasPendingAnimations] && v4)
    {
      objc_storeStrong((id *)&self->_annotationViewToSelect, a3);
    }
    else
    {
      selectedAnnotationView = self->_selectedAnnotationView;
      if (selectedAnnotationView == v12)
      {
        BOOL v11 = [(MKAnnotationView *)v12 isSelected];
        double v9 = v12;
        if (v11) {
          goto LABEL_10;
        }
        selectedAnnotationView = self->_selectedAnnotationView;
      }
      [(MKAnnotationView *)selectedAnnotationView setHighlighted:0];
      [(MKAnnotationView *)v12 setHighlighted:0];
      [(MKAnnotationView *)v12 _setSelected:1 animated:v4];
      objc_storeStrong((id *)&self->_selectedAnnotationView, a3);
      [(MKAnnotationContainerView *)self updateAnnotationViewsForReason:0];
    }
    double v9 = v12;
  }
LABEL_10:
}

- ($52AE83AFA48F224E1564B783D639217F)currentComparisonContext
{
  double v3 = self;
  *(void *)&retstr->var5 = 0;
  *(_OWORD *)&retstr->var2.double y = 0u;
  *(_OWORD *)&retstr->var3.double y = 0u;
  *(_OWORD *)&retstr->double var0 = 0u;
  *(_OWORD *)&retstr->var1.double longitude = 0u;
  id v5 = [(MKAnnotationContainerView *)self window];
  if (v5
    && (CGFloat v22 = v5,
        id WeakRetained = objc_loadWeakRetained((id *)&v3->_delegate),
        char v7 = [WeakRetained annotationContainerIsRotated:v3],
        WeakRetained,
        id v5 = v22,
        (v7 & 1) != 0))
  {
    [v22 bounds];
    double v10 = v8 + v9;
    double v13 = v11 + v12;
    -[MKAnnotationContainerView convertPoint:fromView:](v3, "convertPoint:fromView:", v22);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    -[MKAnnotationContainerView convertPoint:fromView:](v3, "convertPoint:fromView:", v22, v13, v10);
    id v5 = v22;
    retstr->double var0 = 3;
    retstr->double var1 = (CLLocationCoordinate2D)MKCoordinateInvalid;
    retstr->var2.double x = v15;
    retstr->var2.double y = v17;
    retstr->var3.double x = v18;
    retstr->var3.double y = v19;
  }
  else
  {
    double v3 = 0;
    retstr->double var0 = 0;
    retstr->double var1 = (CLLocationCoordinate2D)MKCoordinateInvalid;
    CGPoint v20 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    retstr->var2 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    retstr->var3 = v20;
  }
  retstr->var4 = v3;
  retstr->var5 = 1;

  return result;
}

- (void)annotationViewDidChangeZPriority:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  -[MKAnnotationContainerView _addPrioritiesForAnnotationViewIfNeeded:](self, "_addPrioritiesForAnnotationViewIfNeeded:");
  BOOL v5 = [(MKAnnotationContainerView *)self _updatePriorityMapIfNeeded];
  [(MKAnnotationContainerView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v14 = [(MKAnnotationContainerView *)self annotationViews];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          -[MKAnnotationContainerView _updateZPositionForAnnotationView:inBounds:](self, "_updateZPositionForAnnotationView:inBounds:", *(void *)(*((void *)&v19 + 1) + 8 * i), v7, v9, v11, v13);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
  else
  {
    -[MKAnnotationContainerView _updateZPositionForAnnotationView:inBounds:](self, "_updateZPositionForAnnotationView:inBounds:", a3);
  }
}

- (void)annotationViewDidChangeMetrics:(id)a3
{
  [(MKAnnotationContainerView *)self _updateAnnotationView:a3];

  [(MKAnnotationContainerView *)self _updateAnnotationViewsForReason:3 updatePositions:0];
}

- (void)annotationViewDidChangeDisplayPriority:(id)a3
{
  [a3 displayPriority];
  requiredPriorityAnnotationViews = self->_requiredPriorityAnnotationViews;
  if (v6 == 1000.0)
  {
    [(NSMutableArray *)requiredPriorityAnnotationViews addObject:a3];
    [(NSMutableSet *)self->_collidableAnnotationViews removeObject:a3];
    if ([a3 _isHiddenForReason:5]) {
      [a3 _setHidden:0 forReason:5 animated:1];
    }
  }
  else
  {
    [(NSMutableArray *)requiredPriorityAnnotationViews removeObject:a3];
    [(NSMutableSet *)self->_collidableAnnotationViews addObject:a3];
  }

  [(MKAnnotationContainerView *)self updateAnnotationViewsForReason:0];
}

- (void)transitionTo:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = self->_annotationViews;
  uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "_transitionTo:", a3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  selectedAnnotationView = self->_selectedAnnotationView;
  if (!selectedAnnotationView
    || (-[MKAnnotationContainerView convertPoint:toView:](self, "convertPoint:toView:", self->_selectedAnnotationView, x, y), -[MKAnnotationView hitTest:withEvent:](selectedAnnotationView, "hitTest:withEvent:", v7), (long long v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)MKAnnotationContainerView;
    long long v9 = -[MKAnnotationContainerView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  }

  return v9;
}

- (void)suppressUpdates
{
  self->_suppress = 1;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_updateAnnotationViewsWithDelay object:0];
}

- (void)stopSuppressingUpdates
{
  self->_suppress = 0;
}

- (id)_existingClusterViewsForClusterID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_existingClusterAnnotationViews objectForKey:v4];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    existingClusterAnnotationViews = self->_existingClusterAnnotationViews;
    if (!existingClusterAnnotationViews)
    {
      id v7 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v8 = self->_existingClusterAnnotationViews;
      self->_existingClusterAnnotationViews = v7;

      existingClusterAnnotationViews = self->_existingClusterAnnotationViews;
    }
    [(NSMutableDictionary *)existingClusterAnnotationViews setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)_updateClusterableAnnotationViews:(id)a3 withID:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  CGFloat v38 = [(MKAnnotationContainerView *)self _existingClusterViewsForClusterID:a4];
  CGFloat v39 = [(NSMutableDictionary *)self->_collidingAnnotationViews objectForKey:a4];
  uint64_t v6 = [[MKSpatialCollider alloc] initWithAnnotationViews:a3 previousCollissions:v39 options:1];
  [(MKAnnotationContainerView *)self bounds];
  CGRect v67 = CGRectInset(v66, -100.0, -100.0);
  CGFloat x = v67.origin.x;
  CGFloat y = v67.origin.y;
  CGFloat width = v67.size.width;
  CGFloat height = v67.size.height;
  long long v41 = v6;
  if ([(MKSpatialCollider *)v6 viewCount])
  {
    unint64_t v11 = 0;
    do
    {
      obuint64_t j = [(MKSpatialCollider *)v41 viewsCollidingWithAnnotationViewAtIndex:v11];
      if (obj)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        double v13 = [WeakRetained annotationContainer:self requestAddingClusterForAnnotationViews:obj];

        [v13 setClusteringIdentifier:a4];
        unint64_t v14 = [(MKSpatialCollider *)v41 insertAnnotationView:v13];
        if (v11 >= v14) {
          unint64_t v11 = v14;
        }
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v15 = obj;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v58 objects:v64 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v59 != v17) {
                objc_enumerationMutation(v15);
              }
              long long v19 = *(MKAnnotationView **)(*((void *)&v58 + 1) + 8 * i);
              long long v20 = [(MKAnnotationView *)v19 clusterAnnotationView];
              BOOL v21 = v20 == v13;

              if (!v21)
              {
                [(MKAnnotationView *)v19 frame];
                v71.origin.CGFloat x = x;
                v71.origin.CGFloat y = y;
                v71.size.CGFloat width = width;
                v71.size.CGFloat height = height;
                BOOL v22 = CGRectIntersectsRect(v68, v71);
                [(MKAnnotationView *)v19 setClusterAnnotationView:v13];
                [(MKAnnotationView *)v19 _setHidden:1 forReason:4 animated:v22];
                [(MKAnnotationView *)v19 _offsetToAnnotationView:v13];
                -[MKAnnotationView _setPositionOffset:animated:](v19, "_setPositionOffset:animated:", v22);
                if (self->_selectedAnnotationView == v19) {
                  [(MKAnnotationContainerView *)self deselectAnnotationView:v19 animated:v22];
                }
              }
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v58 objects:v64 count:16];
          }
          while (v16);
        }
      }
      else
      {
        ++v11;
      }
    }
    while (v11 < [(MKSpatialCollider *)v41 viewCount]);
  }
  CLLocationCoordinate2D v23 = (void *)[v38 mutableCopy];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obja = v41;
  uint64_t v24 = [(MKSpatialCollider *)obja countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v55;
    double v26 = *MEMORY[0x1E4F1DAD8];
    double v27 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(obja);
        }
        float v29 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        [v23 removeObject:v29];
        [v29 setClusterAnnotationView:0];
        if ([v29 _isHiddenForReason:4])
        {
          [v29 frame];
          v72.origin.CGFloat x = x;
          v72.origin.CGFloat y = y;
          v72.size.CGFloat width = width;
          v72.size.CGFloat height = height;
          BOOL v30 = CGRectIntersectsRect(v69, v72);
          [v29 _setHidden:0 forReason:4 animated:v30];
          objc_msgSend(v29, "_setPositionOffset:animated:", v30, v26, v27);
        }
      }
      uint64_t v24 = [(MKSpatialCollider *)obja countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v24);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v42 = v23;
  uint64_t v31 = [v42 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v51 != v32) {
          objc_enumerationMutation(v42);
        }
        float v34 = *(MKAnnotationView **)(*((void *)&v50 + 1) + 8 * k);
        [(MKAnnotationView *)v34 frame];
        v73.origin.CGFloat x = x;
        v73.origin.CGFloat y = y;
        v73.size.CGFloat width = width;
        v73.size.CGFloat height = height;
        if (CGRectIntersectsRect(v70, v73))
        {
          objc_initWeak(&location, v34);
          objc_initWeak(&from, self);
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __70__MKAnnotationContainerView__updateClusterableAnnotationViews_withID___block_invoke;
          v45[3] = &unk_1E54BEAF0;
          objc_copyWeak(&v46, &from);
          objc_copyWeak(&v47, &location);
          [(MKAnnotationView *)v34 _setHidden:1 forReason:4 animated:1 completion:v45];
          if (self->_selectedAnnotationView == v34) {
            [(MKAnnotationContainerView *)self deselectAnnotationView:v34 animated:1];
          }
          objc_destroyWeak(&v47);
          objc_destroyWeak(&v46);
          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
        }
        else
        {
          id v35 = objc_loadWeakRetained((id *)&self->_delegate);
          [v35 annotationContainer:self requestRemovingClusterAnnotationView:v34 updateVisible:0];
        }
      }
      uint64_t v31 = [v42 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v31);
  }

  collidingAnnotationViews = self->_collidingAnnotationViews;
  CGFloat v37 = [(MKSpatialCollider *)obja registeredCollissions];
  [(NSMutableDictionary *)collidingAnnotationViews setObject:v37 forKey:a4];
}

void __70__MKAnnotationContainerView__updateClusterableAnnotationViews_withID___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 57);
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    [v3 annotationContainer:v5 requestRemovingClusterAnnotationView:v4 updateVisible:0];

    id WeakRetained = v5;
  }
}

BOOL __61__MKAnnotationContainerView__updateCollidableAnnotationViews__block_invoke(uint64_t a1, void *a2)
{
  return a2[88] != 2
      && ([a2 _isHiddenForReason:4] & 1) == 0
      && *(void *)(*(void *)(a1 + 32) + 464) != (void)a2;
}

uint64_t __61__MKAnnotationContainerView__updateCollidableAnnotationViews__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareForCollision:");
}

uint64_t __61__MKAnnotationContainerView__updateCollidableAnnotationViews__block_invoke_3(uint64_t a1, void *a2)
{
  if (a2[88] == 2 || ([a2 _isHiddenForReason:4] & 1) != 0) {
    return 0;
  }
  else {
    return [a2 _isHiddenForReason:0] ^ 1;
  }
}

- (BOOL)suppressCallout
{
  return self->_suppressCallout;
}

- (MKAnnotationView)draggingAnnotationView
{
  return self->_draggingAnnotationView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prioritiesToAdd, 0);
  objc_storeStrong((id *)&self->_priorityMap, 0);
  objc_storeStrong((id *)&self->_existingClusterAnnotationViews, 0);
  objc_storeStrong((id *)&self->_collidingAnnotationViews, 0);
  objc_storeStrong((id *)&self->_collidableAnnotationViews, 0);
  objc_storeStrong((id *)&self->_requiredPriorityAnnotationViews, 0);
  objc_storeStrong((id *)&self->_clusterableAnnotationViews, 0);
  objc_storeStrong((id *)&self->_pinsToAnimate, 0);
  objc_storeStrong((id *)&self->_userLocationView, 0);
  objc_storeStrong((id *)&self->_draggingAnnotationView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_annotationViewToSelect, 0);
  objc_storeStrong((id *)&self->_selectedAnnotationView, 0);
  objc_storeStrong((id *)&self->_awaitingDropPins, 0);
  objc_storeStrong((id *)&self->_customFeatureDataSourceObservers, 0);
  objc_storeStrong((id *)&self->_clusteringAnnotationViews, 0);

  objc_storeStrong((id *)&self->_annotationViews, 0);
}

- (void)removeObserver:(id)a3
{
}

- (id)clusterStyleAttributes
{
  return 0;
}

- (id)globalAnnotations
{
  return 0;
}

@end