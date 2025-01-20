@interface RCWaveformViewController
- ($F24F406B2B787EFB06265DBA3D28CBD5)_visibleTimeRangeForCurrentSelectionTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)highlightTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)setHighlightTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeByInsettingVisibleTimeRange:(id)a3 inset:(double)a4;
- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)waveformSelectionOverlay:(id)a3 willChangeSelectedTimeRange:(id)a4 isTrackingMin:(BOOL)a5 isTrackingMax:(BOOL)a6;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isScrubbing;
- (BOOL)_isScrubbingSelectionTimeRange;
- (BOOL)capturing;
- (BOOL)clipTimeMarkersToDuration;
- (BOOL)editing;
- (BOOL)isCompactView;
- (BOOL)isOverview;
- (BOOL)isPlayback;
- (BOOL)isSelectedTimeRangeEditingEnabled;
- (BOOL)isSelectionOverlayCurrentlyTracking;
- (BOOL)isZooming;
- (BOOL)playing;
- (BOOL)scrubbingEnabled;
- (BOOL)selectionOverlayShouldUseInsertMode;
- (BOOL)showPlayBarOnly;
- (BOOL)waveformSelectionOverlayNeedsExplicitAnimations;
- (CGRect)_frameForTimeMarkerView:(id)a3;
- (CGRect)waveformRectForLayoutBounds:(CGRect)a3;
- (RCTimeController)activeTimeController;
- (RCWaveformDataSource)dataSource;
- (RCWaveformViewController)initWithOverviewWaveform:(BOOL)a3 duration:(double)a4;
- (RCWaveformViewDelegate)delegate;
- (double)currentTime;
- (double)currentTimeIndicatorCoordinate;
- (double)desiredTimeDeltaForVisibleTimeRange;
- (double)duration;
- (double)maximumSelectionDuration;
- (double)pointsPerSecond;
- (double)waveformSelectionOverlay:(id)a3 offsetForTime:(double)a4;
- (double)waveformSelectionOverlay:(id)a3 timeForOffset:(double)a4;
- (double)waveformSelectionOverlay:(id)a3 willChangeAssetCurrentTime:(double)a4 isTracking:(BOOL)a5;
- (double)waveformSelectionOverlayGetCurrentTime:(id)a3;
- (id)rendererController;
- (unint64_t)currentTimeDisplayOptions;
- (void)_autoscrollOverlayIfNecessary;
- (void)_layoutTimeMarkerViewsForCurrentlyVisibleTimeRange;
- (void)_scrollViewPanGestureRecognized:(id)a3;
- (void)_scrubbingDidFinish;
- (void)_setSelectedTimeRange:(id)a3 updateVisibleTimeRange:(BOOL)a4 updateWaveformViewContentSizeAndOffset:(BOOL)a5 notifyDelegate:(BOOL)a6 animationDuration:(double)a7;
- (void)_setTimeMarkerViewUpdatesDisabled:(BOOL)a3;
- (void)_setTimeMarkerViewsNeedInitialLayout:(BOOL)a3;
- (void)_setVisibleTimeRange:(id)a3 animationDuration:(double)a4 completionBlock:(id)a5;
- (void)_updateAnnotationViews;
- (void)_updateBackgroundWaveformHighlight;
- (void)_updateCurrentTimeDisplay;
- (void)_updateSelectionOverlayWithAnimationDuration:(double)a3;
- (void)_updateVisibleAreaWithAnimationDuration:(double)a3;
- (void)_updateWaveformViewContentSizeAndOffset;
- (void)_updateWaveformViewContentSizeAndOffsetToSize:(double)a3;
- (void)dealloc;
- (void)enableWaveformScrolling:(BOOL)a3;
- (void)enableZooming:(BOOL)a3;
- (void)fixupScrollPositionToMatchIndicatorPositionTime;
- (void)reloadOverlayOffsets;
- (void)resetZoomScale;
- (void)scaleWaveform:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCapturing:(BOOL)a3;
- (void)setClipTimeMarkersToDuration:(BOOL)a3;
- (void)setCurrentTime:(double)a3;
- (void)setCurrentTimeDisplayOptions:(unint64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredTimeDeltaForVisibleTimeRange:(double)a3;
- (void)setDuration:(double)a3;
- (void)setEditing:(BOOL)a3;
- (void)setHighlightTimeRange:(id)a3;
- (void)setIsCompactView:(BOOL)a3;
- (void)setIsOverview:(BOOL)a3;
- (void)setIsPlayback:(BOOL)a3;
- (void)setMaximumSelectionDuration:(double)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setScrubbingEnabled:(BOOL)a3;
- (void)setSelectedTimeRange:(id)a3;
- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4;
- (void)setSelectedTimeRangeEditingEnabled:(BOOL)a3;
- (void)setSelectedTimeRangeScrubbingEnabled:(BOOL)a3;
- (void)setSelectionOverlayShouldUseInsertMode:(BOOL)a3;
- (void)setShowPlayBarOnly:(BOOL)a3;
- (void)setVisibleTimeRange:(id)a3;
- (void)setVisibleTimeRange:(id)a3 animationDuration:(double)a4;
- (void)stopScrolling;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBackgroundColor;
- (void)updateColors;
- (void)updateVisibleTimeRangeToFullDuration;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)waveformRenderer:(id)a3 contentWidthDidChange:(double)a4;
- (void)waveformSelectionOverlay:(id)a3 didFinishTrackingSelectionBeginTime:(BOOL)a4 endTime:(BOOL)a5 assetCurrentTime:(BOOL)a6;
- (void)waveformSelectionOverlay:(id)a3 willBeginTrackingSelectionBeginTime:(BOOL)a4 endTime:(BOOL)a5 assetCurrentTime:(BOOL)a6;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation RCWaveformViewController

- (RCWaveformViewController)initWithOverviewWaveform:(BOOL)a3 duration:(double)a4
{
  BOOL v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RCWaveformViewController;
  v6 = [(RCWaveformViewController *)&v18 init];
  if (v6)
  {
    v7 = objc_alloc_init(RCWaveformRenderer);
    rendererController = v6->_rendererController;
    v6->_rendererController = v7;

    [(RCWaveformRenderer *)v6->_rendererController setRendererDelegate:v6];
    v6->_isOverview = v5;
    if (a4 > 0.0 && v5) {
      double v9 = a4;
    }
    else {
      double v9 = 6.0;
    }
    v6->_visibleTimeRange.beginTime = RCTimeRangeMake(0.0, v9);
    v6->_visibleTimeRange.endTime = v10;
    [(RCWaveformRenderer *)v6->_rendererController setIsOverview:v5];
    v6->_highlightTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)RCTimeRangeInvalid;
    v6->_currentTimeDisplayOptions = 0;
    v6->_clipTimeMarkersToDuration = 1;
    uint64_t v11 = objc_opt_new();
    timeMarkerView = v6->_timeMarkerView;
    v6->_timeMarkerView = (UIView *)v11;

    v6->_isCompactView = 1;
    v6->_desiredTimeDeltaForVisibleTimeRange = 6.0;
    if (!v6->_isOverview)
    {
      int v13 = 3;
      v14 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
      timeMarkerViews = v6->_timeMarkerViews;
      v6->_timeMarkerViews = v14;

      do
      {
        v16 = objc_alloc_init(RCChronologicalAnnotationView);
        [(NSMutableArray *)v6->_timeMarkerViews addObject:v16];

        --v13;
      }
      while (v13);
    }
    [(RCWaveformViewController *)v6 addChildViewController:v6->_rendererController];
    [(RCWaveformRenderer *)v6->_rendererController didMoveToParentViewController:v6];
    v6->_pointsPerSecond = 100.0;
    v6->_pointsPerSecondScale = 1.0;
  }
  return v6;
}

- (void)dealloc
{
  [(RCWaveformScrollView *)self->_scrollView setDelegate:0];
  [(RCWaveformRenderer *)self->_rendererController setRendererDelegate:0];
  [(NSTimer *)self->_overlayAutoscrollTimer invalidate];
  overlayAutoscrollTimer = self->_overlayAutoscrollTimer;
  self->_overlayAutoscrollTimer = 0;

  rendererController = self->_rendererController;
  self->_rendererController = 0;

  v5.receiver = self;
  v5.super_class = (Class)RCWaveformViewController;
  [(RCWaveformViewController *)&v5 dealloc];
}

- (void)willMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RCWaveformViewController;
  -[RCWaveformViewController willMoveToParentViewController:](&v7, "willMoveToParentViewController:");
  if (!a3)
  {
    [(RCWaveformViewController *)self setDataSource:0];
    [(RCWaveformRenderer *)self->_rendererController willMoveToParentViewController:0];
    objc_super v5 = [(RCWaveformRenderer *)self->_rendererController view];
    [v5 removeFromSuperview];

    [(RCWaveformRenderer *)self->_rendererController removeFromParentViewController];
    rendererController = self->_rendererController;
    self->_rendererController = 0;
  }
}

- (RCWaveformDataSource)dataSource
{
  return [(RCWaveformRenderer *)self->_rendererController dataSource];
}

- (void)setDataSource:(id)a3
{
  id v4 = a3;
  [(RCWaveformViewController *)self stopScrolling];
  [(RCWaveformRenderer *)self->_rendererController setDataSource:v4];

  [(RCWaveformViewController *)self _updateWaveformViewContentSizeAndOffset];

  [(RCWaveformViewController *)self _updateAnnotationViews];
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  [(RCWaveformViewController *)self isOverview];
  self->_scrubbingEnabled = 0;
  scrollView = self->_scrollView;

  [(RCWaveformScrollView *)scrollView setScrollEnabled:0];
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    [(RCWaveformRenderer *)self->_rendererController setFrequentUpdatesSegmentUpdatesExpectedHint:0];
    [(RCWaveformViewController *)self _updateSelectionOverlayWithAnimationDuration:0.0];
    [(RCWaveformViewController *)self _updateBackgroundWaveformHighlight];
  }
}

- (void)setCapturing:(BOOL)a3
{
  if (self->_capturing != a3)
  {
    BOOL v3 = a3;
    self->_capturing = a3;
    [(RCWaveformRenderer *)self->_rendererController setCalcBlockShouldRefreshAllSlices:1];
    [(RCWaveformRenderer *)self->_rendererController setIsRecordWaveform:v3];
    [(RCWaveformRenderer *)self->_rendererController setFrequentUpdatesSegmentUpdatesExpectedHint:v3];
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setIsRecording:v3];
    [(RCWaveformViewController *)self _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange];
    [(RCWaveformViewController *)self _updateBackgroundWaveformHighlight];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[RCWaveformRenderer setIsEditMode:](self->_rendererController, "setIsEditMode:");
  }
}

- (void)setIsPlayback:(BOOL)a3
{
  self->_isPlayback = a3;
  -[RCWaveformRenderer setIsPlayback:](self->_rendererController, "setIsPlayback:");

  [(RCWaveformViewController *)self updateBackgroundColor];
}

- (void)setCurrentTimeDisplayOptions:(unint64_t)a3
{
  if (self->_currentTimeDisplayOptions != a3)
  {
    self->_currentTimeDisplayOptions = a3;
    [(RCWaveformViewController *)self _updateCurrentTimeDisplay];
  }
}

- (void)setClipTimeMarkersToDuration:(BOOL)a3
{
  if (self->_clipTimeMarkersToDuration != a3) {
    self->_clipTimeMarkersToDuration = a3;
  }
  [(RCWaveformViewController *)self _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange];
}

- (CGRect)waveformRectForLayoutBounds:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_super v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v7 annotationViewHeight];
  double v9 = height - v8;

  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = v9;
  result.size.double height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (double)currentTimeIndicatorCoordinate
{
  [(RCWaveformSelectionOverlay *)self->_selectionOverlay currentTimeIndicatorCoordinate];
  return result;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
  [(RCWaveformViewController *)self _updateCurrentTimeDisplay];
}

- (void)setIsOverview:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_isOverview != a3) {
    self->_isOverview = a3;
  }
  if (a3)
  {
    [(RCWaveformRenderer *)self->_rendererController setIsOverview:1];
    [(RCWaveformRenderer *)self->_rendererController setIsCompactView:0];
    p_selectionOverlaCGFloat y = &self->_selectionOverlay;
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setHidden:0];
    [(UIView *)self->_selectionBackgroundView setHidden:0];
    v6 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v7 = [v6 shouldShowOverviewWaveform];

    double v8 = 20.0;
    if (!v7) {
      goto LABEL_11;
    }
    double v9 = RCLocalizedFrameworkString(@"AX_OVERVIEW_WAVEFORM");
  }
  else
  {
    double v10 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v11 = [v10 shouldShowOverviewWaveform];

    if (v11) {
      double v12 = @"AX_DETAIL_WAVEFORM";
    }
    else {
      double v12 = @"AX_WAVEFORM";
    }
    double v9 = RCLocalizedFrameworkString(v12);
    p_selectionOverlaCGFloat y = &self->_selectionOverlay;
    double v8 = 30.0;
  }
  [(RCWaveformSelectionOverlay *)*p_selectionOverlay setAccessibilityLabel:v9];

LABEL_11:
  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setAxSegment:v8];
  selectionOverlaCGFloat y = self->_selectionOverlay;

  [(RCWaveformSelectionOverlay *)selectionOverlay setIsOverView:v3];
}

- (void)setDuration:(double)a3
{
  if (self->_duration == a3) {
    return;
  }
  self->_duration = a3;
  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setAssetDuration:a3];
  if ([(RCWaveformSelectionOverlay *)self->_selectionOverlay isEditingEnabled])
  {
    double beginTime = self->_selectedTimeRange.beginTime;
    double endTime = self->_selectedTimeRange.endTime;
    if (endTime <= beginTime)
    {
      if (endTime <= a3 && beginTime <= a3)
      {
LABEL_14:
        if (!RCTimeRangeEqualToTimeRange(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime, beginTime, endTime))-[RCWaveformViewController _setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:](self, "_setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:", 0, 1, 0, beginTime, endTime, 0.0); {
        goto LABEL_16;
        }
      }
      double v8 = a3;
    }
    else
    {
      if (beginTime < a3)
      {
        if (endTime > a3) {
          self->_selectedTimeRange.double endTime = a3;
        }
        goto LABEL_14;
      }
      double v8 = 0.0;
    }
    double beginTime = RCTimeRangeMake(v8, a3);
    double endTime = v9;
    goto LABEL_14;
  }
LABEL_16:
  if (self->_clipTimeMarkersToDuration) {
    [(RCWaveformViewController *)self _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v10 = self->_timeMarkerViews;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "setContentDuration:", self->_duration, (void)v15);
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  [(RCWaveformViewController *)self _updateBackgroundWaveformHighlight];
}

- (void)updateVisibleTimeRangeToFullDuration
{
  double duration = self->_duration;
  id v4 = [(RCWaveformViewController *)self dataSource];
  [v4 duration];
  double v6 = v5;

  if (duration < v6) {
    double duration = v6;
  }
  unsigned int v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v7 overviewWaveformMinimumDurationToDisplayWhenRecording];
  double v9 = v8;

  unsigned int v10 = [(RCWaveformViewController *)self isPlayback];
  if (duration >= v9) {
    int v11 = 1;
  }
  else {
    int v11 = v10;
  }
  if (v11) {
    double v12 = duration;
  }
  else {
    double v12 = v9;
  }
  double v13 = RCTimeRangeMake(0.0, v12);
  double v15 = v14;
  [(RCWaveformViewController *)self setDesiredTimeDeltaForVisibleTimeRange:RCTimeRangeDelta(v13, v14)];

  -[RCWaveformViewController setVisibleTimeRange:animationDuration:](self, "setVisibleTimeRange:animationDuration:", v13, v15, 0.0);
}

- (void)setVisibleTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if ([(RCWaveformViewController *)self isOverview])
  {
    [(RCWaveformViewController *)self updateVisibleTimeRangeToFullDuration];
  }
  else
  {
    -[RCWaveformViewController setVisibleTimeRange:animationDuration:](self, "setVisibleTimeRange:animationDuration:", var0, var1, 0.0);
  }
}

- (void)setVisibleTimeRange:(id)a3 animationDuration:(double)a4
{
}

- (void)setHighlightTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  p_highlightTimeRange = &self->_highlightTimeRange;
  if (!RCTimeRangeEqualToTimeRange(self->_highlightTimeRange.beginTime, self->_highlightTimeRange.endTime, a3.var0, a3.var1))
  {
    p_highlightTimeRange->double beginTime = var0;
    p_highlightTimeRange->double endTime = var1;
    rendererController = self->_rendererController;
    -[RCWaveformRenderer setHighlightTimeRange:](rendererController, "setHighlightTimeRange:", var0, var1);
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)setHighlightTimeRange
{
  if (self->_rendererController)
  {
    [(RCWaveformRenderer *)self->_rendererController highlightTimeRange];
  }
  else
  {
    double beginTime = self->_highlightTimeRange.beginTime;
    double endTime = self->_highlightTimeRange.endTime;
  }
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeByInsettingVisibleTimeRange:(id)a3 inset:(double)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  -[RCWaveformRenderer pointsPerSecondWithVisibleTimeRange:](self->_rendererController, "pointsPerSecondWithVisibleTimeRange:");
  double v8 = 1.0 / v7 * a4;
  double v9 = var0 - v8;
  double v10 = var1 + v8;
  result.double var1 = v10;
  result.double var0 = v9;
  return result;
}

- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4
{
}

- (void)setSelectedTimeRange:(id)a3
{
}

- (void)setMaximumSelectionDuration:(double)a3
{
  self->_maximumSelectionDuration = a3;
  [(RCWaveformViewController *)self maximumSelectionDuration];
  selectionOverlaCGFloat y = self->_selectionOverlay;

  -[RCWaveformSelectionOverlay setSelectedTimeRangeMaximumDuration:](selectionOverlay, "setSelectedTimeRangeMaximumDuration:");
}

- (void)setSelectedTimeRangeEditingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_selectedTimeRangeEditingEnabled = a3;
  [(RCWaveformViewController *)self _updateWaveformViewContentSizeAndOffset];
  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setInsertMode:[(RCWaveformViewController *)self selectionOverlayShouldUseInsertMode]];
  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setEditingEnabled:v3];

  [(RCWaveformViewController *)self _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange];
}

- (BOOL)isSelectionOverlayCurrentlyTracking
{
  return [(RCWaveformSelectionOverlay *)self->_selectionOverlay isCurrentlyTracking];
}

- (void)enableWaveformScrolling:(BOOL)a3
{
}

- (void)resetZoomScale
{
  self->_pointsPerSecond = 100.0;
  self->_pointsPerSecondScale = 1.0;
  double layoutWidth = self->_layoutWidth;
  [(RCWaveformViewController *)self pointsPerSecond];
  [(RCWaveformViewController *)self setDesiredTimeDeltaForVisibleTimeRange:layoutWidth / v4];
  [(RCWaveformViewController *)self _updateCurrentTimeDisplay];

  [(RCWaveformViewController *)self fixupScrollPositionToMatchIndicatorPositionTime];
}

- (double)pointsPerSecond
{
  return self->_pointsPerSecond * self->_pointsPerSecondScale;
}

- (void)scaleWaveform:(id)a3
{
  id v12 = a3;
  [v12 scale];
  if ([v12 state] == (char *)&def_3AC7C + 1 || objc_msgSend(v12, "state") == (char *)&def_3AC7C + 2)
  {
    [v12 scale];
    double v6 = v5 * self->_pointsPerSecondScale;
    self->_pointsPerSecondScale = v6;
    double v7 = 4.0;
    if (v6 > 4.0 || (double v7 = 0.01, v6 < 0.01)) {
      self->_pointsPerSecondScale = v7;
    }
    [v12 setScale:1.0];
    double layoutWidth = self->_layoutWidth;
    [(RCWaveformViewController *)self pointsPerSecond];
    [(RCWaveformViewController *)self setDesiredTimeDeltaForVisibleTimeRange:layoutWidth / v9];
    [(RCWaveformViewController *)self pointsPerSecond];
    double v11 = 100.0 / v10;
    if (v11 > 2.0) {
      double v11 = 2.0;
    }
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setSelectedTimeRangeMinimumDuration:v11];
    [(RCWaveformViewController *)self _updateCurrentTimeDisplay];
    [(RCWaveformViewController *)self fixupScrollPositionToMatchIndicatorPositionTime];
  }
}

- (void)enableZooming:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(RCWaveformViewController *)self isOverview])
  {
    pinchGesture = self->_pinchGesture;
    if (!pinchGesture)
    {
      [(RCWaveformScrollView *)self->_scrollView setBouncesZoom:0];
      [(RCWaveformScrollView *)self->_scrollView setMaximumZoomScale:2.0];
      [(RCWaveformScrollView *)self->_scrollView setMinimumZoomScale:0.5];
      double v6 = [(RCWaveformScrollView *)self->_scrollView pinchGestureRecognizer];
      double v7 = self->_pinchGesture;
      self->_pinchGesture = v6;

      [(UIPinchGestureRecognizer *)self->_pinchGesture addTarget:self action:"scaleWaveform:"];
      pinchGesture = self->_pinchGesture;
    }
    [(UIPinchGestureRecognizer *)pinchGesture setEnabled:v3];
  }
}

- (void)viewDidLayoutSubviews
{
  BOOL v3 = [(RCWaveformViewController *)self view];
  [v3 frame];
  CGFloat Width = CGRectGetWidth(v24);

  double v5 = [(RCWaveformViewController *)self view];
  [v5 frame];
  CGFloat Height = CGRectGetHeight(v25);

  if (self->_layoutWidth != Width || self->_layoutHeight != Height)
  {
    self->_double layoutWidth = Width;
    self->_layoutCGFloat Height = Height;
    [(RCWaveformScrollView *)self->_scrollView bounds];
    double v8 = v7;
    double v9 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v9 annotationViewHeight];
    double v11 = v8 - v10;
    [(RCWaveformScrollView *)self->_scrollView bounds];
    double v13 = v12;
    double v14 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v14 annotationViewHeight];
    -[UIView setFrame:](self->_timeMarkerView, "setFrame:", 0.0, v11, v13, v15);

    [(RCWaveformViewController *)self selectedTimeRange];
    if (RCTimeRangeDeltaWithUIPrecision(v16, v17) < 4.4408921e-16) {
      [(RCWaveformViewController *)self fixupScrollPositionToMatchIndicatorPositionTime];
    }
    long long v18 = [(RCWaveformViewController *)self view];
    [v18 frame];
    double v20 = v19;

    double v21 = 6.0;
    if (v20 > 0.0)
    {
      [(RCWaveformViewController *)self pointsPerSecond];
      double v21 = Width / v22;
    }
    [(RCWaveformViewController *)self setDesiredTimeDeltaForVisibleTimeRange:v21];
    [(RCWaveformViewController *)self _updateCurrentTimeDisplay];
    [(RCWaveformViewController *)self reloadOverlayOffsets];
  }
}

- (void)reloadOverlayOffsets
{
}

- (void)setIsCompactView:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isCompactView = a3;
  -[UIView setHidden:](self->_timeMarkerView, "setHidden:");
  BOOL v5 = v3 && !self->_showPlayBarOnly;
  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setHidden:v5];
  [(UIView *)self->_selectionBackgroundView setHidden:v3];
  [(UIView *)self->_backgroundWaveFormHighlightView setHidden:v3];
  [(RCWaveformRenderer *)self->_rendererController setIsCompactView:v3];
  [(RCWaveformViewController *)self updateBackgroundColor];
  id v6 = [(RCWaveformViewController *)self view];
  [v6 setNeedsLayout];
}

- (BOOL)isCompactView
{
  return self->_isCompactView;
}

- (void)setShowPlayBarOnly:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showPlayBarOnlCGFloat y = a3;
  -[RCWaveformSelectionOverlay setPlayBarOnly:](self->_selectionOverlay, "setPlayBarOnly:");
  if (self->_isCompactView && v3) {
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setHidden:0];
  }
  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setSelectionMode:v3];
  rendererController = self->_rendererController;

  [(RCWaveformRenderer *)rendererController setIsPlayBarOnlyMode:v3];
}

- (void)viewDidLoad
{
  v173.receiver = self;
  v173.super_class = (Class)RCWaveformViewController;
  [(RCWaveformViewController *)&v173 viewDidLoad];
  BOOL v3 = [RCWaveformScrollView alloc];
  double v4 = [(RCWaveformViewController *)self view];
  [v4 bounds];
  BOOL v5 = -[RCWaveformScrollView initWithFrame:](v3, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  [(RCWaveformScrollView *)self->_scrollView setAlwaysBounceHorizontal:1];
  [(RCWaveformScrollView *)self->_scrollView setDirectionalLockEnabled:1];
  double v7 = +[UIColor clearColor];
  [(RCWaveformScrollView *)self->_scrollView setBackgroundColor:v7];

  [(RCWaveformScrollView *)self->_scrollView setBounces:1];
  double v8 = [(RCWaveformViewController *)self view];
  [v8 bounds];
  -[RCWaveformScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, v9 * 0.5, 0.0, 0.0);

  [(RCWaveformScrollView *)self->_scrollView setDelegate:self];
  [(RCWaveformScrollView *)self->_scrollView setOpaque:0];
  [(RCWaveformScrollView *)self->_scrollView setScrollEnabled:1];
  [(RCWaveformScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(RCWaveformScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  double v10 = [(RCWaveformScrollView *)self->_scrollView panGestureRecognizer];
  [v10 addTarget:self action:"_scrollViewPanGestureRecognized:"];

  [(RCWaveformScrollView *)self->_scrollView addSubview:self->_timeMarkerView];
  [(UIView *)self->_timeMarkerView setHidden:[(RCWaveformViewController *)self isCompactView]];
  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  double v11 = self->_timeMarkerViews;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v169 objects:v179 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v170;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v170 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v169 + 1) + 8 * i);
        double v17 = +[RCRecorderStyleProvider sharedStyleProvider];
        [v17 annotationViewHeight];
        objc_msgSend(v16, "setFrame:", 0.0, 0.0, 0.0, v18);

        [(UIView *)self->_timeMarkerView addSubview:v16];
      }
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v169 objects:v179 count:16];
    }
    while (v13);
  }

  [(RCWaveformViewController *)self _setTimeMarkerViewsNeedInitialLayout:1];
  double left = UIEdgeInsetsZero.left;
  double right = UIEdgeInsetsZero.right;
  if ([(RCWaveformViewController *)self isOverview])
  {
    double bottom = UIEdgeInsetsZero.bottom;
  }
  else
  {
    double v22 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v22 annotationViewHeight];
    double bottom = v23;
  }
  CGRect v24 = [RCWaveformSelectionOverlay alloc];
  [(RCWaveformScrollView *)self->_scrollView bounds];
  v26 = -[RCWaveformSelectionOverlay initWithDelegate:height:selectionAreaInsets:](v24, "initWithDelegate:height:selectionAreaInsets:", self, v25, UIEdgeInsetsZero.top, left, bottom, right);
  selectionOverlaCGFloat y = self->_selectionOverlay;
  self->_selectionOverlaCGFloat y = v26;

  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setSelectedTimeRangeMinimumDuration:1.0];
  BOOL v28 = [(RCWaveformViewController *)self isOverview];
  v29 = self->_selectionOverlay;
  if (v28)
  {
    [(RCWaveformSelectionOverlay *)v29 setOverviewTrimHandleStyle:1];
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setBarMatchesKnobRadius:1];
    v30 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v30 overviewKnobWidthMultiplier];
    -[RCWaveformSelectionOverlay setKnobWidthMultiplier:](self->_selectionOverlay, "setKnobWidthMultiplier:");

    v31 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v31 overviewPlayheadWidthMultiplier];
  }
  else
  {
    [(RCWaveformSelectionOverlay *)v29 setOverviewTrimHandleStyle:0];
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay setBarMatchesKnobRadius:0];
    v32 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v32 knobWidthMultiplier];
    -[RCWaveformSelectionOverlay setKnobWidthMultiplier:](self->_selectionOverlay, "setKnobWidthMultiplier:");

    v31 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v31 playheadWidthMultiplier];
  }
  -[RCWaveformSelectionOverlay setPlayWidthMultiplier:](self->_selectionOverlay, "setPlayWidthMultiplier:");

  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setEnableTimeTrackingInView:v28];
  double v33 = 0.0;
  v34 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  selectionBackgroundView = self->_selectionBackgroundView;
  self->_selectionBackgroundView = v34;

  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setSelectionBackgroundView:self->_selectionBackgroundView];
  v36 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v36;

  v38 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  backgroundWaveFormHighlightView = self->_backgroundWaveFormHighlightView;
  self->_backgroundWaveFormHighlightView = v38;

  [(RCWaveformViewController *)self updateColors];
  if ([(RCWaveformViewController *)self isOverview])
  {
    v40 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v40 overviewWaveformCornerRadius];
    double v42 = v41;
    v43 = [(UIView *)self->_backgroundView layer];
    [v43 setCornerRadius:v42];

    v44 = [(UIView *)self->_backgroundView layer];
    [v44 setMasksToBounds:1];

    v45 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v45 overviewWaveformCornerRadius];
    double v47 = v46;
    v48 = [(UIView *)self->_backgroundWaveFormHighlightView layer];
    [v48 setCornerRadius:v47];

    v49 = [(UIView *)self->_backgroundWaveFormHighlightView layer];
    [v49 setMasksToBounds:1];

    v50 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v50 overviewWaveformCornerRadius];
    double v52 = v51;
    v53 = [(RCWaveformRenderer *)self->_rendererController view];
    v54 = [v53 layer];
    [v54 setCornerRadius:v52];

    v55 = [(RCWaveformRenderer *)self->_rendererController view];
    v56 = [v55 layer];
    [v56 setMasksToBounds:1];
  }
  v57 = [(RCWaveformViewController *)self view];
  [v57 addSubview:self->_backgroundView];

  if ([(RCWaveformViewController *)self isOverview])
  {
    v58 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v58 selectionOverlayBorderWidth];
    double v33 = v59;
  }
  [(UIView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  v60 = self->_backgroundView;
  v61 = [(RCWaveformViewController *)self view];
  v62 = +[NSLayoutConstraint constraintWithItem:v60 attribute:1 relatedBy:0 toItem:v61 attribute:1 multiplier:1.0 constant:0.0];

  LODWORD(v63) = 1144750080;
  [v62 setPriority:v63];
  v64 = self->_backgroundView;
  v65 = [(RCWaveformViewController *)self view];
  v66 = +[NSLayoutConstraint constraintWithItem:v64 attribute:2 relatedBy:0 toItem:v65 attribute:2 multiplier:1.0 constant:0.0];

  LODWORD(v67) = 1144750080;
  [v66 setPriority:v67];
  v68 = self->_backgroundView;
  v69 = [(RCWaveformViewController *)self view];
  v70 = +[NSLayoutConstraint constraintWithItem:v68 attribute:3 relatedBy:0 toItem:v69 attribute:3 multiplier:1.0 constant:v33];

  LODWORD(v71) = 1144750080;
  [v70 setPriority:v71];
  v72 = self->_backgroundView;
  v73 = [(RCWaveformViewController *)self view];
  v74 = +[NSLayoutConstraint constraintWithItem:v72 attribute:4 relatedBy:0 toItem:v73 attribute:4 multiplier:1.0 constant:-v33];

  LODWORD(v75) = 1144750080;
  [v74 setPriority:v75];
  v166 = v66;
  v167 = v62;
  v178[0] = v62;
  v178[1] = v66;
  v164 = v74;
  v165 = v70;
  v178[2] = v70;
  v178[3] = v74;
  v76 = +[NSArray arrayWithObjects:v178 count:4];
  +[NSLayoutConstraint activateConstraints:v76];

  v77 = [(RCWaveformRenderer *)self->_rendererController view];
  [v77 setUserInteractionEnabled:0];

  v78 = [(RCWaveformViewController *)self view];
  v79 = [(RCWaveformRenderer *)self->_rendererController view];
  [v78 addSubview:v79];

  v80 = [(RCWaveformRenderer *)self->_rendererController view];
  [v80 setTranslatesAutoresizingMaskIntoConstraints:0];

  v81 = [(RCWaveformRenderer *)self->_rendererController view];
  v82 = [(RCWaveformViewController *)self view];
  v83 = +[NSLayoutConstraint constraintWithItem:v81 attribute:1 relatedBy:0 toItem:v82 attribute:1 multiplier:1.0 constant:0.0];

  v168 = v83;
  LODWORD(v84) = 1144750080;
  [v83 setPriority:v84];
  v85 = [(RCWaveformRenderer *)self->_rendererController view];
  v86 = [(RCWaveformViewController *)self view];
  v87 = +[NSLayoutConstraint constraintWithItem:v85 attribute:2 relatedBy:0 toItem:v86 attribute:2 multiplier:1.0 constant:0.0];

  v88 = v87;
  LODWORD(v89) = 1144750080;
  [v87 setPriority:v89];
  v90 = [(RCWaveformRenderer *)self->_rendererController view];
  v91 = [(RCWaveformViewController *)self view];
  v92 = +[NSLayoutConstraint constraintWithItem:v90 attribute:3 relatedBy:0 toItem:v91 attribute:3 multiplier:1.0 constant:v33];

  v93 = v92;
  LODWORD(v94) = 1144750080;
  [v92 setPriority:v94];
  v95 = [(RCWaveformRenderer *)self->_rendererController view];
  v96 = [(RCWaveformViewController *)self view];
  v97 = +[NSLayoutConstraint constraintWithItem:v95 attribute:4 relatedBy:0 toItem:v96 attribute:4 multiplier:1.0 constant:0.0];
  renderViewBottomInsetConstraint = self->_renderViewBottomInsetConstraint;
  self->_renderViewBottomInsetConstraint = v97;

  [(NSLayoutConstraint *)self->_renderViewBottomInsetConstraint setConstant:-v33];
  LODWORD(v99) = 1144750080;
  [(NSLayoutConstraint *)self->_renderViewBottomInsetConstraint setPriority:v99];
  if (![(RCWaveformViewController *)self isCompactView])
  {
    [(NSLayoutConstraint *)self->_renderViewBottomInsetConstraint constant];
    double v101 = v100;
    v102 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v102 annotationViewHeight];
    [(NSLayoutConstraint *)self->_renderViewBottomInsetConstraint setConstant:v101 - v103];
  }
  v177[0] = v168;
  v177[1] = v88;
  v162 = v93;
  v163 = v88;
  v104 = self->_renderViewBottomInsetConstraint;
  v177[2] = v93;
  v177[3] = v104;
  v105 = +[NSArray arrayWithObjects:v177 count:4];
  +[NSLayoutConstraint activateConstraints:v105];

  v106 = [(RCWaveformViewController *)self view];
  [v106 addSubview:self->_scrollView];

  [(RCWaveformScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  v107 = self->_scrollView;
  v108 = [(RCWaveformViewController *)self view];
  v109 = +[NSLayoutConstraint constraintWithItem:v107 attribute:1 relatedBy:0 toItem:v108 attribute:1 multiplier:1.0 constant:0.0];

  v110 = v109;
  v161 = v109;
  LODWORD(v111) = 1144750080;
  [v109 setPriority:v111];
  v112 = self->_scrollView;
  v113 = [(RCWaveformViewController *)self view];
  v114 = +[NSLayoutConstraint constraintWithItem:v112 attribute:2 relatedBy:0 toItem:v113 attribute:2 multiplier:1.0 constant:0.0];

  v160 = v114;
  LODWORD(v115) = 1144750080;
  [v114 setPriority:v115];
  v116 = self->_scrollView;
  v117 = [(RCWaveformViewController *)self view];
  v118 = +[NSLayoutConstraint constraintWithItem:v116 attribute:3 relatedBy:0 toItem:v117 attribute:3 multiplier:1.0 constant:0.0];

  v159 = v118;
  LODWORD(v119) = 1144750080;
  [v118 setPriority:v119];
  v120 = self->_scrollView;
  v121 = [(RCWaveformViewController *)self view];
  v158 = +[NSLayoutConstraint constraintWithItem:v120 attribute:4 relatedBy:0 toItem:v121 attribute:4 multiplier:1.0 constant:0.0];

  LODWORD(v122) = 1144750080;
  [v158 setPriority:v122];
  v176[0] = v110;
  v176[1] = v114;
  v176[2] = v118;
  v176[3] = v158;
  v123 = +[NSArray arrayWithObjects:v176 count:4];
  +[NSLayoutConstraint activateConstraints:v123];

  v124 = [(RCWaveformViewController *)self view];
  [v124 sendSubviewToBack:self->_backgroundView];

  v125 = [(RCWaveformViewController *)self view];
  [v125 insertSubview:self->_backgroundWaveFormHighlightView above:self->_backgroundView];

  [(UIView *)self->_backgroundWaveFormHighlightView setTranslatesAutoresizingMaskIntoConstraints:0];
  v126 = self->_backgroundWaveFormHighlightView;
  v127 = [(RCWaveformViewController *)self view];
  v128 = +[NSLayoutConstraint constraintWithItem:v126 attribute:1 relatedBy:0 toItem:v127 attribute:1 multiplier:1.0 constant:0.0];
  backgroundWaveFormHighlightViewLeftAlignment = self->_backgroundWaveFormHighlightViewLeftAlignment;
  self->_backgroundWaveFormHighlightViewLeftAlignment = v128;

  LODWORD(v130) = 1144750080;
  [(NSLayoutConstraint *)self->_backgroundWaveFormHighlightViewLeftAlignment setPriority:v130];
  v131 = self->_backgroundWaveFormHighlightView;
  v132 = [(RCWaveformViewController *)self view];
  v133 = +[NSLayoutConstraint constraintWithItem:v131 attribute:2 relatedBy:0 toItem:v132 attribute:2 multiplier:1.0 constant:0.0];
  backgroundWaveFormHighlightViewRightAlignment = self->_backgroundWaveFormHighlightViewRightAlignment;
  self->_backgroundWaveFormHighlightViewRightAlignment = v133;

  LODWORD(v135) = 1144750080;
  [(NSLayoutConstraint *)self->_backgroundWaveFormHighlightViewRightAlignment setPriority:v135];
  v136 = self->_backgroundWaveFormHighlightView;
  v137 = [(RCWaveformViewController *)self view];
  v138 = +[NSLayoutConstraint constraintWithItem:v136 attribute:3 relatedBy:0 toItem:v137 attribute:3 multiplier:1.0 constant:v33];

  LODWORD(v139) = 1144750080;
  [v138 setPriority:v139];
  v140 = self->_backgroundWaveFormHighlightView;
  v141 = [(RCWaveformViewController *)self view];
  v142 = +[NSLayoutConstraint constraintWithItem:v140 attribute:4 relatedBy:0 toItem:v141 attribute:4 multiplier:1.0 constant:-v33];

  LODWORD(v143) = 1144750080;
  [v142 setPriority:v143];
  v144 = self->_backgroundWaveFormHighlightViewRightAlignment;
  v175[0] = self->_backgroundWaveFormHighlightViewLeftAlignment;
  v175[1] = v144;
  v175[2] = v138;
  v175[3] = v142;
  v145 = +[NSArray arrayWithObjects:v175 count:4];
  +[NSLayoutConstraint activateConstraints:v145];

  [(UIView *)self->_selectionBackgroundView setHidden:self->_isCompactView];
  v146 = [(RCWaveformViewController *)self view];
  [v146 insertSubview:self->_selectionBackgroundView above:self->_backgroundWaveFormHighlightView];

  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setHidden:self->_isCompactView];
  v147 = [(RCWaveformViewController *)self view];
  [v147 addSubview:self->_selectionOverlay];

  [(RCWaveformSelectionOverlay *)self->_selectionOverlay setTranslatesAutoresizingMaskIntoConstraints:0];
  v148 = +[NSLayoutConstraint constraintWithItem:self->_selectionOverlay attribute:1 relatedBy:0 toItem:self->_scrollView attribute:1 multiplier:1.0 constant:0.0];
  LODWORD(v149) = 1144750080;
  [v148 setPriority:v149];
  v150 = +[NSLayoutConstraint constraintWithItem:self->_selectionOverlay attribute:2 relatedBy:0 toItem:self->_scrollView attribute:2 multiplier:1.0 constant:0.0];
  LODWORD(v151) = 1144750080;
  [v150 setPriority:v151];
  v152 = +[NSLayoutConstraint constraintWithItem:self->_selectionOverlay attribute:3 relatedBy:0 toItem:self->_scrollView attribute:3 multiplier:1.0 constant:0.0];
  LODWORD(v153) = 1144750080;
  [v152 setPriority:v153];
  v154 = +[NSLayoutConstraint constraintWithItem:self->_selectionOverlay attribute:4 relatedBy:0 toItem:self->_scrollView attribute:4 multiplier:1.0 constant:0.0];
  LODWORD(v155) = 1144750080;
  [v154 setPriority:v155];
  v174[0] = v148;
  v174[1] = v150;
  v174[2] = v152;
  v174[3] = v154;
  v156 = +[NSArray arrayWithObjects:v174 count:4];
  +[NSLayoutConstraint activateConstraints:v156];

  [(RCWaveformViewController *)self _updateVisibleAreaWithAnimationDuration:0.0];
  [(RCWaveformViewController *)self _updateWaveformViewContentSizeAndOffset];
  [(RCWaveformViewController *)self setScrubbingEnabled:1];
  v157 = [(RCWaveformViewController *)self view];
  [v157 setNeedsLayout];
}

- (void)viewWillLayoutSubviews
{
  double v3 = 0.0;
  if ([(RCWaveformViewController *)self isOverview])
  {
    double v4 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v4 selectionOverlayBorderWidth];
    double v3 = -v5;
  }
  if (![(RCWaveformViewController *)self isCompactView])
  {
    id v6 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v6 annotationViewHeight];
    double v3 = v3 - v7;
  }
  [(NSLayoutConstraint *)self->_renderViewBottomInsetConstraint constant];
  if (v8 != v3) {
    [(NSLayoutConstraint *)self->_renderViewBottomInsetConstraint setConstant:v3];
  }
  [(RCWaveformViewController *)self _updateWaveformViewContentSizeAndOffset];

  [(RCWaveformViewController *)self _updateAnnotationViews];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_isScrubbingSelectionTimeRange
{
  if (self->_scrubbing)
  {
    BOOL v3 = [(RCWaveformViewController *)self isSelectedTimeRangeEditingEnabled];
    if (v3)
    {
      [(RCWaveformViewController *)self selectedTimeRange];
      LOBYTE(v3) = RCTimeRangeDeltaWithUIPrecision(v4, v5) != 0.0;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_isScrubbing
{
  return self->_scrubbing;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v15 = a3;
  unsigned __int8 v4 = [v15 isZooming];
  double v5 = v15;
  if ((v4 & 1) == 0)
  {
    id v6 = v15;
    [v6 beginIgnoringContentOffsetChanges];
    if (self->_scrubbing)
    {
      [v6 contentOffsetInPresentationLayer:0];
      double v8 = v7;
      [(RCWaveformRenderer *)self->_rendererController setFrequentUpdatesSegmentUpdatesExpectedHint:self->_scrubbing];
      [(RCWaveformRenderer *)self->_rendererController timeAtHorizontalOffset:v8];
      double v10 = v9;
      double desiredTimeDeltaForVisibleTimeRange = self->_desiredTimeDeltaForVisibleTimeRange;
      [(RCWaveformViewController *)self setVisibleTimeRange:RCTimeRangeMake(v9, v9 + desiredTimeDeltaForVisibleTimeRange)];
      if (self->_scrubbing)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v13 = objc_opt_respondsToSelector();

        if (v13)
        {
          id v14 = objc_loadWeakRetained((id *)&self->_delegate);
          [v14 waveformViewController:self didScrubToTime:0 finished:v10 + desiredTimeDeltaForVisibleTimeRange * 0.5];
        }
      }
    }
    [v6 endIgnoringContentOffsetChanges];

    double v5 = v15;
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a5->x;
  double desiredTimeDeltaForVisibleTimeRange = self->_desiredTimeDeltaForVisibleTimeRange;
  [(RCWaveformScrollView *)self->_scrollView bounds];
  CGFloat v9 = CGRectGetWidth(v16) * 0.5;
  [(RCWaveformViewController *)self currentTimeIndicatorCoordinate];
  double v11 = v9 - v10;
  double v12 = desiredTimeDeltaForVisibleTimeRange * -0.5;
  [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:v12];
  double v14 = v11 + v13;
  if (x >= v14)
  {
    [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:self->_duration + v12];
    double v14 = v11 + v15;
    if (x <= v14) {
      double v14 = x;
    }
  }
  a5->double x = v14;
}

- (void)_scrubbingDidFinish
{
  self->_scrubbing = 0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(RCWaveformViewController *)self _scrubbingDidFinish];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)stopScrolling
{
  self->_scrubbing = 0;
  [(RCWaveformScrollView *)self->_scrollView setScrollEnabled:0];
  scrollView = self->_scrollView;
  [(RCWaveformScrollView *)scrollView contentOffset];
  -[RCWaveformScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 0);
  [(RCWaveformScrollView *)self->_scrollView setScrollEnabled:self->_scrubbingEnabled];

  [(RCWaveformViewController *)self fixupScrollPositionToMatchIndicatorPositionTime];
}

- (void)waveformSelectionOverlay:(id)a3 willBeginTrackingSelectionBeginTime:(BOOL)a4 endTime:(BOOL)a5 assetCurrentTime:(BOOL)a6
{
  if (a4 || a5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained waveformViewControllerWillBeginEditingSelectedTimeRange:self];
  }
}

- (void)waveformSelectionOverlay:(id)a3 didFinishTrackingSelectionBeginTime:(BOOL)a4 endTime:(BOOL)a5 assetCurrentTime:(BOOL)a6
{
  BOOL v6 = a5;
  [(NSTimer *)self->_overlayAutoscrollTimer invalidate];
  overlayAutoscrollTimer = self->_overlayAutoscrollTimer;
  self->_overlayAutoscrollTimer = 0;

  if (a4 || v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained waveformViewControllerDidEndEditingSelectedTimeRange:self];
  }

  [(RCWaveformViewController *)self _updateWaveformViewContentSizeAndOffset];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)waveformSelectionOverlay:(id)a3 willChangeSelectedTimeRange:(id)a4 isTrackingMin:(BOOL)a5 isTrackingMax:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  -[RCWaveformViewController _setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:](self, "_setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:", 0, 0, 1, a4.var0, a4.var1, 0.0);
  if (!self->_overlayAutoscrollTimer && !self->_isOverview)
  {
    CGFloat v9 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_autoscrollOverlayIfNecessary" selector:0 userInfo:1 repeats:0.1];
    overlayAutoscrollTimer = self->_overlayAutoscrollTimer;
    self->_overlayAutoscrollTimer = v9;

    self->_overlayAutoscrollRateForSelectionTracking = 1.0;
    self->_overlayAutoscrollBaseDuration = self->_desiredTimeDeltaForVisibleTimeRange;
  }
  if (self->_selectedTimeRangeEditingEnabled && self->_isOverview && !self->_playing && !self->_scrubbing)
  {
    if (!v7 || v6)
    {
      if (!v6 || v7)
      {
        if (v7 && v6)
        {
          double MidTime = RCTimeRangeGetMidTime(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime);
          if (self->_currentTime != MidTime)
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            double v12 = WeakRetained;
            double v14 = self;
            double endTime = MidTime;
            goto LABEL_17;
          }
        }
      }
      else if (self->_currentTime != self->_selectedTimeRange.endTime)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        double v12 = WeakRetained;
        double endTime = self->_selectedTimeRange.endTime;
        goto LABEL_16;
      }
    }
    else if (self->_currentTime != self->_selectedTimeRange.beginTime)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      double v12 = WeakRetained;
      double endTime = self->_selectedTimeRange.beginTime;
LABEL_16:
      double v14 = self;
LABEL_17:
      [WeakRetained waveformViewController:v14 didScrubToTime:1 finished:endTime];
    }
  }
  double beginTime = self->_selectedTimeRange.beginTime;
  double v16 = self->_selectedTimeRange.endTime;
  result.double var1 = v16;
  result.double var0 = beginTime;
  return result;
}

- (double)waveformSelectionOverlay:(id)a3 willChangeAssetCurrentTime:(double)a4 isTracking:(BOOL)a5
{
  if (self->_selectedTimeRangeEditingEnabled)
  {
    id v7 = a3;
    [v7 selectedTimeRange];
    double v9 = v8;
    [v7 selectedTimeRange];
    double v11 = v10;

    if (v11 <= a4) {
      double v12 = v11;
    }
    else {
      double v12 = a4;
    }
    if (v12 >= v9) {
      a4 = v12;
    }
    else {
      a4 = v9;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained waveformViewController:self didScrubToTime:0 finished:a4];

  return a4;
}

- (double)waveformSelectionOverlay:(id)a3 offsetForTime:(double)a4
{
  -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", a3, self->_visibleTimeRange.beginTime);
  double v7 = v6;
  [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:a4];
  return v8 - v7;
}

- (double)waveformSelectionOverlay:(id)a3 timeForOffset:(double)a4
{
  -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", a3, self->_visibleTimeRange.beginTime);
  rendererController = self->_rendererController;
  double v8 = v7 + a4;

  [(RCWaveformRenderer *)rendererController timeAtHorizontalOffset:v8];
  return result;
}

- (double)waveformSelectionOverlayGetCurrentTime:(id)a3
{
  return self->_currentTime;
}

- (BOOL)waveformSelectionOverlayNeedsExplicitAnimations
{
  return 1;
}

- (BOOL)isZooming
{
  return [(RCWaveformScrollView *)self->_scrollView isZooming];
}

- (void)waveformRenderer:(id)a3 contentWidthDidChange:(double)a4
{
  -[RCWaveformViewController _updateWaveformViewContentSizeAndOffsetToSize:](self, "_updateWaveformViewContentSizeAndOffsetToSize:", a3, a4);
  [(RCWaveformViewController *)self _updateSelectionOverlayWithAnimationDuration:0.0];
  [(RCWaveformViewController *)self _updateBackgroundWaveformHighlight];
  if (!self->_isOverview)
  {
    [(RCWaveformViewController *)self _updateCurrentTimeDisplay];
    [(RCWaveformViewController *)self fixupScrollPositionToMatchIndicatorPositionTime];
  }
}

- (RCTimeController)activeTimeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v3 = [WeakRetained activeTimeController];

  return (RCTimeController *)v3;
}

- (double)desiredTimeDeltaForVisibleTimeRange
{
  return self->_desiredTimeDeltaForVisibleTimeRange;
}

- (void)setDesiredTimeDeltaForVisibleTimeRange:(double)a3
{
  if (a3 <= 0.0) {
    a3 = 6.0;
  }
  if (self->_desiredTimeDeltaForVisibleTimeRange != a3) {
    self->_double desiredTimeDeltaForVisibleTimeRange = a3;
  }
}

- (void)updateColors
{
  BOOL v3 = [(RCWaveformViewController *)self traitCollection];
  unsigned __int8 v4 = [v3 isUserInterfaceStyleDark];

  [(RCWaveformViewController *)self updateBackgroundColor];
  double v5 = [(UIView *)self->_timeMarkerView subviews];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_279CC;
  v6[3] = &unk_6D8C0;
  unsigned __int8 v7 = v4;
  [v5 enumerateObjectsUsingBlock:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RCWaveformViewController;
  id v4 = a3;
  [(RCWaveformViewController *)&v8 traitCollectionDidChange:v4];
  id v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  double v6 = [(RCWaveformViewController *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    [(RCWaveformViewController *)self updateColors];
    [(RCWaveformRenderer *)self->_rendererController setCalcBlockShouldRefreshAllSlices:1];
  }
}

- (void)updateBackgroundColor
{
  id v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  BOOL v3 = [(RCWaveformViewController *)self traitCollection];
  id v4 = [v3 isUserInterfaceStyleDark];

  if ([(RCWaveformViewController *)self isCompactView]
    && ![(RCWaveformViewController *)self isOverview])
  {
    id v7 = [v9 waveformCompactBackgroundColor];
    [(UIView *)self->_backgroundView setBackgroundColor:v7];

    uint64_t v6 = [v9 waveformCompactHighlightedBackgroundColor];
  }
  else
  {
    id v5 = [v9 waveformPlaybackBackgroundColor:v4];
    [(UIView *)self->_backgroundView setBackgroundColor:v5];

    uint64_t v6 = [v9 waveformPlaybackHighlightedBackgroundColor:v4];
  }
  objc_super v8 = (void *)v6;
  [(UIView *)self->_backgroundWaveFormHighlightView setBackgroundColor:v6];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_visibleTimeRangeForCurrentSelectionTimeRange
{
  if ([(RCWaveformViewController *)self isOverview])
  {
    double beginTime = RCTimeRangeMake(0.0, self->_duration);
  }
  else
  {
    double beginTime = self->_visibleTimeRange.beginTime;
    double endTime = self->_visibleTimeRange.endTime;
  }
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (void)_setVisibleTimeRange:(id)a3 animationDuration:(double)a4 completionBlock:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = (void (**)(id, uint64_t))a5;
  if (RCTimeRangeDeltaWithUIPrecision(var0, var1) < 2.22044605e-16) {
    double var1 = var0 + 2.22044605e-16;
  }
  p_visibleTimeRange = &self->_visibleTimeRange;
  if (RCTimeRangeEqualToTimeRange(self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime, var0, var1))
  {
    [(RCWaveformViewController *)self _updateVisibleAreaWithAnimationDuration:0.0];
  }
  else
  {
    double v11 = RCTimeRangeDeltaWithUIPrecision(p_visibleTimeRange->beginTime, self->_visibleTimeRange.endTime);
    double v12 = RCTimeRangeDeltaWithUIPrecision(var0, var1);
    p_visibleTimeRange->double beginTime = var0;
    self->_visibleTimeRange.double endTime = var1;
    if (vabdd_f64(v11, v12) > 0.00000011920929) {
      [(RCWaveformViewController *)self _setTimeMarkerViewsNeedInitialLayout:1];
    }
    double v13 = [(RCWaveformViewController *)self view];
    id v14 = [v13 viewWithTag:92314];

    if (!v14)
    {
      id v14 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      [v14 setTag:92314];
      double v15 = +[UIColor clearColor];
      [v14 setBackgroundColor:v15];

      double v16 = [(RCWaveformViewController *)self view];
      [v16 addSubview:v14];
    }
    [v14 setAlpha:1.0];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_27F10;
    v22[3] = &unk_6D8E8;
    v22[4] = self;
    double v24 = a4;
    id v17 = v14;
    id v23 = v17;
    double v18 = objc_retainBlock(v22);
    double v19 = v18;
    if (a4 <= 0.0)
    {
      ((void (*)(void *))v18[2])(v18);
      if (v9) {
        v9[2](v9, 1);
      }
    }
    else
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_27F68;
      v20[3] = &unk_6D878;
      double v21 = v9;
      +[UIView animateWithDuration:0x20000 delay:v19 options:v20 animations:a4 completion:0.0];
    }
  }
}

- (void)_setSelectedTimeRange:(id)a3 updateVisibleTimeRange:(BOOL)a4 updateWaveformViewContentSizeAndOffset:(BOOL)a5 notifyDelegate:(BOOL)a6 animationDuration:(double)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v10 = a4;
  double v12 = fmax(a3.var0, 0.0);
  if (self->_duration >= a3.var1) {
    double var1 = a3.var1;
  }
  else {
    double var1 = self->_duration;
  }
  p_selectedTimeRange = &self->_selectedTimeRange;
  if (!RCTimeRangeEqualToTimeRange(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime, v12, var1))
  {
    p_selectedTimeRange->double beginTime = v12;
    p_selectedTimeRange->double endTime = var1;
    if (v8) {
      [(RCWaveformViewController *)self _updateWaveformViewContentSizeAndOffset];
    }
    if (v10)
    {
      if (self->_isOverview)
      {
        [(RCWaveformViewController *)self updateVisibleTimeRangeToFullDuration];
      }
      else
      {
        [(RCWaveformViewController *)self _visibleTimeRangeForCurrentSelectionTimeRange];
        double v16 = v15;
        double v18 = v17;
        if (!RCTimeRangeEqualToTimeRange(v15, v17, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime)) {
          -[RCWaveformViewController setVisibleTimeRange:animationDuration:](self, "setVisibleTimeRange:animationDuration:", v16, v18, a7);
        }
      }
    }
    [(RCWaveformViewController *)self _updateSelectionOverlayWithAnimationDuration:a7];
    [(RCWaveformViewController *)self _updateBackgroundWaveformHighlight];
    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "waveformViewController:didChangeToSelectedTimeRange:", self, p_selectedTimeRange->beginTime, p_selectedTimeRange->endTime);
    }
  }
}

- (void)_autoscrollOverlayIfNecessary
{
  int64_t v3 = [(RCWaveformSelectionOverlay *)self->_selectionOverlay beginTimeIndicatorSelectionAffinity];
  int64_t v4 = [(RCWaveformSelectionOverlay *)self->_selectionOverlay endTimeIndicatorSelectionAffinity];
  double desiredTimeDeltaForVisibleTimeRange = self->_desiredTimeDeltaForVisibleTimeRange;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_282AC;
  v9[3] = &unk_6D910;
  *(double *)&v9[5] = desiredTimeDeltaForVisibleTimeRange;
  v9[4] = self;
  uint64_t v6 = objc_retainBlock(v9);
  p_visibleTimeRange = &self->_visibleTimeRange;
  if ((((uint64_t (*)(void *, const __CFString *, int64_t, void, uint64_t, double))v6[2])(v6, @"[min-marker, max]", v3, 0, 1, self->_visibleTimeRange.endTime - self->_selectedTimeRange.beginTime) & 1) == 0&& (((uint64_t (*)(void *, const __CFString *, int64_t, void, uint64_t, double))v6[2])(v6, @"[min-marker, min]", v3, 0, 0xFFFFFFFFLL, self->_selectedTimeRange.beginTime - p_visibleTimeRange->beginTime) & 1) == 0&& (((uint64_t (*)(void *, const __CFString *, int64_t, uint64_t, uint64_t, double))v6[2])(v6, @"[max-marker, max]", v4, 1, 1,
          self->_visibleTimeRange.endTime - self->_selectedTimeRange.endTime) & 1) == 0
    && (((uint64_t (*)(void *, const __CFString *, int64_t, uint64_t, uint64_t, double))v6[2])(v6, @"[max-marker, min]", v4, 1, 0xFFFFFFFFLL, self->_selectedTimeRange.endTime - p_visibleTimeRange->beginTime) & 1) == 0)
  {
    [(NSTimer *)self->_overlayAutoscrollTimer invalidate];
    overlayAutoscrollTimer = self->_overlayAutoscrollTimer;
    self->_overlayAutoscrollTimer = 0;
  }
}

- (void)_setTimeMarkerViewUpdatesDisabled:(BOOL)a3
{
  self->_timeMarkerViewsUpdatesDisabled = a3;
  if (a3)
  {
    int64_t v4 = [(RCWaveformViewController *)self view];
    double v5 = 0.200000003;
  }
  else
  {
    int64_t v4 = self->_timeMarkerView;
    double v5 = 1.0;
  }
  timeMarkerViews = self->_timeMarkerViews;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_286B4;
  v9[3] = &unk_6D938;
  BOOL v10 = v4;
  BOOL v7 = v4;
  [(NSMutableArray *)timeMarkerViews enumerateObjectsUsingBlock:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_28744;
  v8[3] = &unk_6D800;
  v8[4] = self;
  *(double *)&v8[5] = v5;
  +[UIView animateWithDuration:v8 animations:0.5];
}

- (void)_updateBackgroundWaveformHighlight
{
  [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:self->_visibleTimeRange.beginTime];
  double v4 = v3;
  [(UIView *)self->_backgroundView bounds];
  double v9 = 0.0;
  double v10 = 0.0;
  if (v7 > 0.0)
  {
    double v11 = v5;
    CGFloat v12 = v6;
    double v13 = v7;
    CGFloat v14 = v8;
    [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:0.0];
    double v10 = v15 - v4;
    v27.origin.double x = v11;
    v27.origin.CGFloat y = v12;
    v27.size.CGFloat width = v13;
    v27.size.double height = v14;
    double MinX = CGRectGetMinX(v27);
    if (v10 < MinX) {
      double v10 = MinX;
    }
    v28.origin.double x = v11;
    v28.origin.CGFloat y = v12;
    v28.size.CGFloat width = v13;
    v28.size.double height = v14;
    double MaxX = CGRectGetMaxX(v28);
    if (v10 >= MaxX) {
      double v10 = MaxX;
    }
    [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:self->_duration];
    double v19 = v18;
    v29.origin.double x = v11;
    v29.origin.CGFloat y = v12;
    v29.size.CGFloat width = v13;
    v29.size.double height = v14;
    double v20 = CGRectGetMaxX(v29);
    v30.origin.double x = v11;
    v30.origin.CGFloat y = v12;
    v30.size.CGFloat width = v13;
    v30.size.double height = v14;
    double v5 = CGRectGetMinX(v30);
    double v21 = 0.0;
    if (!self->_capturing)
    {
      double v22 = v19 - v4;
      if (v19 - v4 >= v20) {
        double v22 = v20;
      }
      if (v22 >= v5) {
        double v5 = v22;
      }
      double v21 = v11 + v13 - v5;
    }
    double v9 = -v21;
  }
  [(NSLayoutConstraint *)self->_backgroundWaveFormHighlightViewLeftAlignment constant];
  if (v10 != v23) {
    [(NSLayoutConstraint *)self->_backgroundWaveFormHighlightViewLeftAlignment setConstant:v10];
  }
  [(NSLayoutConstraint *)self->_backgroundWaveFormHighlightViewRightAlignment constant];
  if (v9 != v24)
  {
    backgroundWaveFormHighlightViewRightAlignment = self->_backgroundWaveFormHighlightViewRightAlignment;
    [(NSLayoutConstraint *)backgroundWaveFormHighlightViewRightAlignment setConstant:v9];
  }
}

- (void)_updateWaveformViewContentSizeAndOffsetToSize:(double)a3
{
  double v5 = [(RCWaveformViewController *)self view];
  [v5 bounds];
  double v7 = v6 * 0.5 + a3;

  if (self->_isPlayback
    || self->_isOverview
    || !self->_selectedTimeRangeEditingEnabled
    || [(RCWaveformSelectionOverlay *)self->_selectionOverlay isCurrentlyTracking])
  {
    double v8 = [(RCWaveformViewController *)self view];
    [v8 bounds];
    double v10 = v9;

    if (v7 >= v10) {
      double v10 = v7;
    }
    p_scrollView = &self->_scrollView;
    [(RCWaveformScrollView *)self->_scrollView bounds];
    -[RCWaveformScrollView setContentSize:](self->_scrollView, "setContentSize:", v10, v12);
    id v22 = [(RCWaveformViewController *)self view];
    [v22 bounds];
    double v14 = v13 * 0.5;
    double v15 = 0.0;
  }
  else
  {
    [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:self->_selectedTimeRange.beginTime];
    double v17 = v16;
    [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:self->_selectedTimeRange.endTime];
    double v19 = v18;
    p_scrollView = &self->_scrollView;
    [(RCWaveformScrollView *)self->_scrollView bounds];
    -[RCWaveformScrollView setContentSize:](self->_scrollView, "setContentSize:", v7, v20);
    id v22 = [(RCWaveformViewController *)self view];
    [v22 bounds];
    double v14 = v21 * 0.5 - v17;
    double v15 = -(a3 - v19);
  }
  -[RCWaveformScrollView setContentInset:](*p_scrollView, "setContentInset:", 0.0, v14, 0.0, v15);
}

- (void)_updateWaveformViewContentSizeAndOffset
{
  [(RCWaveformRenderer *)self->_rendererController contentWidth];

  -[RCWaveformViewController _updateWaveformViewContentSizeAndOffsetToSize:](self, "_updateWaveformViewContentSizeAndOffsetToSize:");
}

- (void)_updateAnnotationViews
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_28C04;
  v2[3] = &unk_6D490;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)fixupScrollPositionToMatchIndicatorPositionTime
{
  -[RCWaveformRenderer horizontalOffsetAtTime:withVisibleTimeRange:](self->_rendererController, "horizontalOffsetAtTime:withVisibleTimeRange:", self->_visibleTimeRange.beginTime, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  double v4 = v3;
  [(RCWaveformScrollView *)self->_scrollView contentOffsetInPresentationLayer:1];
  if (vabdd_f64(v5, v4) > 0.00000011920929)
  {
    [(RCWaveformScrollView *)self->_scrollView visibleBounds];
    if (v6 > 0.00000011920929)
    {
      -[RCWaveformScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v4, 0.0);
      [(RCWaveformViewController *)self _updateVisibleAreaWithAnimationDuration:0.0];
      [(RCWaveformViewController *)self _updateCurrentTimeDisplay];
    }
  }
}

- (void)_updateVisibleAreaWithAnimationDuration:(double)a3
{
  -[RCWaveformRenderer setVisibleTimeRange:](self->_rendererController, "setVisibleTimeRange:", self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  if (!self->_scrubbing)
  {
    [(RCWaveformRenderer *)self->_rendererController horizontalOffsetAtTime:self->_visibleTimeRange.beginTime];
    double v6 = RCRoundCoord(v5);
    [(RCWaveformScrollView *)self->_scrollView visibleBounds];
    v10.origin.double x = v6;
    v10.origin.CGFloat y = v9.origin.y;
    v10.size.CGFloat width = v6;
    v10.size.double height = v9.size.height;
    BOOL v7 = CGRectIntersectsRect(v9, v10);
    if (a3 == 0.0 || !v7)
    {
      -[RCWaveformScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 0, v6, 0.0);
    }
    else
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_291D4;
      v8[3] = &unk_6D7D8;
      v8[4] = self;
      *(double *)&v8[5] = v6;
      void v8[6] = 0;
      +[UIView animateWithDuration:131076 delay:v8 options:0 animations:a3 completion:0.0];
    }
  }
  [(RCWaveformViewController *)self _updateAnnotationViews];
}

- (void)_updateSelectionOverlayWithAnimationDuration:(double)a3
{
  if (!self->_scrubbing
    || [(RCWaveformViewController *)self _isScrubbingSelectionTimeRange])
  {
    [(RCWaveformSelectionOverlay *)self->_selectionOverlay selectedTimeRange];
    double v6 = v5;
    double v8 = v7;
    if (RCTimeRangeDeltaWithUIPrecision(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime) == 0.0)
    {
      double beginTime = RCTimeRangeMake(self->_currentTime, self->_currentTime);
      double endTime = v11;
    }
    else
    {
      double beginTime = self->_selectedTimeRange.beginTime;
      double endTime = self->_selectedTimeRange.endTime;
    }
    if (RCTimeRangeEqualToTimeRange(v6, v8, beginTime, endTime))
    {
      [(RCWaveformViewController *)self reloadOverlayOffsets];
      [(RCWaveformSelectionOverlay *)self->_selectionOverlay setNeedsLayout];
    }
    else
    {
      -[RCWaveformSelectionOverlay setSelectedTimeRange:withAnimationDuration:](self->_selectionOverlay, "setSelectedTimeRange:withAnimationDuration:", beginTime, endTime, a3);
    }
    double currentTime = -1.0;
    if (self->_currentTimeDisplayOptions == 2) {
      double currentTime = self->_currentTime;
    }
    selectionOverlaCGFloat y = self->_selectionOverlay;
    [(RCWaveformSelectionOverlay *)selectionOverlay setAssetCurrentTime:currentTime];
  }
}

- (void)_updateCurrentTimeDisplay
{
  if ([(RCWaveformViewController *)self isOverview])
  {
    [(RCWaveformViewController *)self updateVisibleTimeRangeToFullDuration];
    [(RCWaveformViewController *)self _updateSelectionOverlayWithAnimationDuration:0.0];
    [(RCWaveformViewController *)self _updateBackgroundWaveformHighlight];
  }
  else
  {
    double desiredTimeDeltaForVisibleTimeRange = self->_desiredTimeDeltaForVisibleTimeRange;
    if (self->_isCompactView
      && [(RCWaveformRenderer *)self->_rendererController isRecordWaveform]
      && ![(RCWaveformRenderer *)self->_rendererController isPlayBarOnlyMode])
    {
      double currentTime = self->_currentTime;
      double v5 = currentTime - desiredTimeDeltaForVisibleTimeRange;
    }
    else
    {
      double v4 = self->_currentTime;
      double v5 = v4 - desiredTimeDeltaForVisibleTimeRange * 0.5;
      double currentTime = desiredTimeDeltaForVisibleTimeRange * 0.5 + v4;
    }
    double v7 = RCTimeRangeMake(v5, currentTime);
    [(RCWaveformViewController *)self setVisibleTimeRange:v7];
  }
}

- (CGRect)_frameForTimeMarkerView:(id)a3
{
  rendererController = self->_rendererController;
  id v5 = a3;
  [v5 visibleTimeRange];
  -[RCWaveformRenderer horizontalOffsetAtTime:](rendererController, "horizontalOffsetAtTime:");
  double v7 = RCRoundCoord(v6);
  double v8 = self->_rendererController;
  [v5 visibleTimeRange];
  double v10 = v9;

  [(RCWaveformRenderer *)v8 horizontalOffsetAtTime:v10];
  double v12 = RCRoundCoord(v11) - v7;
  if (v12 >= 1.0) {
    double v13 = v12;
  }
  else {
    double v13 = 1.0;
  }
  double v14 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v14 annotationViewHeight];
  double v16 = v15;

  double v17 = 0.0;
  double v18 = v7;
  double v19 = v13;
  double v20 = v16;
  result.size.double height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v17;
  result.origin.double x = v18;
  return result;
}

- (void)_setTimeMarkerViewsNeedInitialLayout:(BOOL)a3
{
  if (self->_timeMarkerViewsNeedInitialLayout) {
    a3 = 1;
  }
  self->_timeMarkerViewsNeedInitialLayout = a3;
}

- (void)_layoutTimeMarkerViewsForCurrentlyVisibleTimeRange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_29584;
  v2[3] = &unk_6D490;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)_scrollViewPanGestureRecognized:(id)a3
{
  if ([a3 state] == (char *)&def_3AC7C + 1) {
    self->_scrubbing = 1;
  }
}

- (id)rendererController
{
  return self->_rendererController;
}

- (RCWaveformViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCWaveformViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPlayback
{
  return self->_isPlayback;
}

- (BOOL)scrubbingEnabled
{
  return self->_scrubbingEnabled;
}

- (BOOL)playing
{
  return self->_playing;
}

- (BOOL)capturing
{
  return self->_capturing;
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)isOverview
{
  return self->_isOverview;
}

- (unint64_t)currentTimeDisplayOptions
{
  return self->_currentTimeDisplayOptions;
}

- (BOOL)clipTimeMarkersToDuration
{
  return self->_clipTimeMarkersToDuration;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (double)duration
{
  return self->_duration;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange
{
  double beginTime = self->_visibleTimeRange.beginTime;
  double endTime = self->_visibleTimeRange.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)highlightTimeRange
{
  double beginTime = self->_highlightTimeRange.beginTime;
  double endTime = self->_highlightTimeRange.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange
{
  double beginTime = self->_selectedTimeRange.beginTime;
  double endTime = self->_selectedTimeRange.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (double)maximumSelectionDuration
{
  return self->_maximumSelectionDuration;
}

- (BOOL)isSelectedTimeRangeEditingEnabled
{
  return self->_selectedTimeRangeEditingEnabled;
}

- (void)setSelectedTimeRangeScrubbingEnabled:(BOOL)a3
{
  self->_selectedTimeRangeScrubbingEnabled = a3;
}

- (BOOL)selectionOverlayShouldUseInsertMode
{
  return self->_selectionOverlayShouldUseInsertMode;
}

- (void)setSelectionOverlayShouldUseInsertMode:(BOOL)a3
{
  self->_selectionOverlayShouldUseInsertMode = a3;
}

- (BOOL)showPlayBarOnly
{
  return self->_showPlayBarOnly;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_renderViewBottomInsetConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundWaveFormHighlightViewRightAlignment, 0);
  objc_storeStrong((id *)&self->_backgroundWaveFormHighlightViewLeftAlignment, 0);
  objc_storeStrong((id *)&self->_overlayAutoscrollTimer, 0);
  objc_storeStrong((id *)&self->_timeMarkerViews, 0);
  objc_storeStrong((id *)&self->_selectionBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundWaveFormHighlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_timeMarkerView, 0);
  objc_storeStrong((id *)&self->_selectionOverlay, 0);
  objc_storeStrong((id *)&self->_rendererController, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end