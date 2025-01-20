@interface RCWaveformRenderer
- ($F24F406B2B787EFB06265DBA3D28CBD5)highlightTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange;
- (BOOL)_canShowWhileLocked;
- (BOOL)_needsWaveformRendering;
- (BOOL)calcBlockShouldRefreshAllSlices;
- (BOOL)failedFirstRenderCalculationAttempt;
- (BOOL)frequentUpdatesSegmentUpdatesExpectedHint;
- (BOOL)isActiveDisplayLinkRequired;
- (BOOL)isCompactView;
- (BOOL)isEditMode;
- (BOOL)isOverview;
- (BOOL)isPaused;
- (BOOL)isPlayBarOnlyMode;
- (BOOL)isPlayback;
- (BOOL)isRecordWaveform;
- (BOOL)overviewRecordingWaveformRefresh;
- (BOOL)renderReadyForDraw;
- (BOOL)renderingQueueIsBusy;
- (BOOL)syncRenderOnMainThread;
- (BOOL)waitForFinalCalc;
- (CGRect)visibleRect;
- (NSArray)waveformAmpSlicesForRendering;
- (NSMutableDictionary)waveformSlices;
- (NSMutableIndexSet)waveformSliceIndexes;
- (RCWaveformDataSource)dataSource;
- (RCWaveformRenderer)initWithNibName:(id)a3 bundle:(id)a4;
- (RCWaveformRendererDelegate)rendererDelegate;
- (double)_duration;
- (double)_nonCachedContentWidthWithDuration:(double)a3;
- (double)_pointOffsetForTime:(double)a3;
- (double)_pointsPerSecond;
- (double)_timeForPointOffset:(double)a3;
- (double)_timeForPointOffset:(double)a3 withVisibleTimeRange:(id)a4;
- (double)contentWidth;
- (double)dataPointWidth;
- (double)horizontalOffsetAtTime:(double)a3;
- (double)horizontalOffsetAtTime:(double)a3 withVisibleTimeRange:(id)a4;
- (double)pointsPerSecondWithVisibleTimeRange:(id)a3;
- (double)spacingWidth;
- (double)timeAtHorizontalOffset:(double)a3;
- (double)timeAtHorizontalOffset:(double)a3 withVisibleTimeRange:(id)a4;
- (id).cxx_construct;
- (id)nextRenderBlock;
- (id)rasterizeTimeRange:(id)a3 imageSize:(CGSize)a4;
- (void)_clearRenderingState;
- (void)_draw:(double)a3;
- (void)_performOrDispatchToMainThread:(id)a3;
- (void)_renderTimeRangeOfSegments:(id)a3 withDuration:(double)a4 needsWaveformCalculation:(BOOL)a5;
- (void)_renderVisibleTimeRangeWithDuration:(double)a3;
- (void)_setNeedsRendering;
- (void)_setNeedsVisibleTimeRangeRendering;
- (void)_setNeedsVisibleTimeRangeRenderingFromFrameChange;
- (void)_startRendering;
- (void)_startUpdating;
- (void)_stopRendering;
- (void)_stopUpdating;
- (void)_updateOverviewUnitsPerSecond;
- (void)dealloc;
- (void)displayLinkDidUpdate:(id)a3 withTimeController:(id)a4;
- (void)loadView;
- (void)setActiveDisplayLinkRequired:(BOOL)a3;
- (void)setCalcBlockShouldRefreshAllSlices:(BOOL)a3;
- (void)setDataPointWidth:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setFailedFirstRenderCalculationAttempt:(BOOL)a3;
- (void)setFrequentUpdatesSegmentUpdatesExpectedHint:(BOOL)a3;
- (void)setHighlightTimeRange:(id)a3;
- (void)setIsCompactView:(BOOL)a3;
- (void)setIsEditMode:(BOOL)a3;
- (void)setIsOverview:(BOOL)a3;
- (void)setIsPlayBarOnlyMode:(BOOL)a3;
- (void)setIsPlayback:(BOOL)a3;
- (void)setIsRecordWaveform:(BOOL)a3;
- (void)setNextRenderBlock:(id)a3;
- (void)setOverviewRecordingWaveformRefresh:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRenderReadyForDraw:(BOOL)a3;
- (void)setRendererDelegate:(id)a3;
- (void)setRenderingQueueIsBusy:(BOOL)a3;
- (void)setSpacingWidth:(double)a3;
- (void)setSyncRenderOnMainThread:(BOOL)a3;
- (void)setVisibleTimeRange:(id)a3;
- (void)setWaitForFinalCalc:(BOOL)a3;
- (void)setWaveformAmpSlicesForRendering:(id)a3;
- (void)setWaveformSliceIndexes:(id)a3;
- (void)setWaveformSlices:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4;
- (void)waveformDataSourceDidFinishLoading:(id)a3;
- (void)waveformDataSourceRequiresUpdate:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation RCWaveformRenderer

- (RCWaveformRenderer)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)RCWaveformRenderer;
  v4 = [(RCWaveformRenderer *)&v10 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_spacingWidth = 0.0;
    v4->_dataPointWidth = 2.0;
    v4->_visibleTimeRange.beginTime = RCTimeRangeMake(0.0, 15.0);
    v5->_visibleTimeRange.endTime = v6;
    v5->_cachedContentWidth = 0.0;
    v5->_renderedTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)RCTimeRangeZero;
    v5->_renderingQueueIsBusy = 0;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.waveformRenderSegmentProcessing", 0);
    renderingQueue = v5->_renderingQueue;
    v5->_renderingQueue = (OS_dispatch_queue *)v7;

    v5->_lastVisibleTimeRange = v5->_visibleTimeRange;
    v5->_visibleTimeRangeVelocity = 0.0;
    v5->_isCompactView = 1;
  }
  return v5;
}

- (void)dealloc
{
  [(RCWaveformRenderer *)self _stopRendering];
  [(RCWaveformDataSource *)self->_dataSource removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)RCWaveformRenderer;
  [(RCWaveformRenderer *)&v3 dealloc];
}

- (void)loadView
{
  objc_super v3 = -[RCView initWithFrame:]([RCView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  -[RCWaveformRenderer setView:](self, "setView:");
  [(RCView *)v3 setRenderer:self];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)RCWaveformRenderer;
  [(RCWaveformRenderer *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCWaveformRenderer;
  [(RCWaveformRenderer *)&v4 viewDidAppear:a3];
  if (self->_dataSource)
  {
    [(RCWaveformRenderer *)self _startUpdating];
    [(RCWaveformRenderer *)self _startRendering];
    if (self->_isOverview)
    {
      self->_overviewRecordingWaveformRefresh = 1;
      [(RCWaveformRenderer *)self _setNeedsVisibleTimeRangeRendering];
      [(RCWaveformRenderer *)self _setNeedsRendering];
      [(RCWaveformRenderer *)self _duration];
      -[RCWaveformRenderer _draw:](self, "_draw:");
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  if (self->_dataSource)
  {
    [(RCWaveformRenderer *)self _stopUpdating];
    [(RCWaveformRenderer *)self _stopRendering];
  }
  v4.receiver = self;
  v4.super_class = (Class)RCWaveformRenderer;
  [(RCWaveformRenderer *)&v4 viewWillDisappear:0];
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)RCWaveformRenderer;
  [(RCWaveformRenderer *)&v5 willMoveToParentViewController:v4];
  if (!v4)
  {
    [(RCWaveformRenderer *)self _stopUpdating];
    [(RCWaveformRenderer *)self _stopRendering];
  }
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)RCWaveformRenderer;
  [(RCWaveformRenderer *)&v2 viewDidLayoutSubviews];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)waveformDataSourceRequiresUpdate:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_BDD0;
  v3[3] = &unk_6D088;
  v3[4] = self;
  [(RCWaveformRenderer *)self _performOrDispatchToMainThread:v3];
}

- (void)_updateOverviewUnitsPerSecond
{
  if (!self->_isOverview)
  {
    [(RCWaveformRenderer *)self _pointsPerSecond];
    double v4 = v3;
    id v5 = [(RCWaveformDataSource *)self->_dataSource waveformGenerator];
    [v5 setOverviewUnitsPerSecond:(uint64_t)v4];
  }
}

- (void)setDataSource:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_BF70;
  v4[3] = &unk_6D0B0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(RCWaveformRenderer *)v5 _performOrDispatchToMainThread:v4];
}

- (void)setIsRecordWaveform:(BOOL)a3
{
  if (self->_isRecordWaveform != a3)
  {
    self->_isRecordWaveform = a3;
    [(RCWaveformRenderer *)self _setNeedsVisibleTimeRangeRendering];
    [(RCWaveformRenderer *)self _setNeedsRendering];
  }
}

- (void)setVisibleTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  p_visibleTimeRange = &self->_visibleTimeRange;
  if (!RCTimeRangeEqualToTimeRange(self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime, a3.var0, a3.var1))
  {
    if (self->_isOverview
      || (double v7 = RCTimeRangeDelta(p_visibleTimeRange->beginTime, p_visibleTimeRange->endTime),
          vabdd_f64(v7, RCTimeRangeDelta(var0, var1)) > 0.00000011920929))
    {
      self->_calcBlockShouldRefreshAllSlices = 1;
    }
    self->_needsVisibleRangeRendering = 1;
  }
  p_visibleTimeRange->beginTime = var0;
  p_visibleTimeRange->endTime = var1;
  if (self->_dataSource)
  {
    [(RCWaveformRenderer *)self _setNeedsVisibleTimeRangeRendering];
    [(RCWaveformRenderer *)self _setNeedsRendering];
    [(RCWaveformRenderer *)self _duration];
    -[RCWaveformRenderer _draw:](self, "_draw:");
  }
}

- (double)_duration
{
  [(RCWaveformDataSource *)self->_dataSource duration];
  double v4 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rendererDelegate);
  [WeakRetained duration];
  double v7 = v6;

  if (v4 >= v7) {
    return v4;
  }
  else {
    return v7;
  }
}

- (double)contentWidth
{
  return self->_cachedContentWidth;
}

- (double)horizontalOffsetAtTime:(double)a3
{
  -[RCWaveformRenderer horizontalOffsetAtTime:withVisibleTimeRange:](self, "horizontalOffsetAtTime:withVisibleTimeRange:", a3, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  return result;
}

- (double)horizontalOffsetAtTime:(double)a3 withVisibleTimeRange:(id)a4
{
  -[RCWaveformRenderer pointsPerSecondWithVisibleTimeRange:](self, "pointsPerSecondWithVisibleTimeRange:", a4.var0, a4.var1);
  return v5 * a3;
}

- (double)_pointsPerSecond
{
  -[RCWaveformRenderer pointsPerSecondWithVisibleTimeRange:](self, "pointsPerSecondWithVisibleTimeRange:", self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  return result;
}

- (double)pointsPerSecondWithVisibleTimeRange:(id)a3
{
  double v3 = 1.0;
  if (a3.var1 - a3.var0 >= 4.4408921e-16)
  {
    double v5 = [(RCWaveformRenderer *)self view];
    [v5 bounds];
    double v7 = v6;

    if (v7 >= 1.0)
    {
      v8 = [(RCWaveformRenderer *)self view];
      [v8 bounds];
      double v10 = v9;
      v11 = [(RCWaveformRenderer *)self rendererDelegate];
      [v11 desiredTimeDeltaForVisibleTimeRange];
      double v3 = v10 / v12;
    }
  }
  return v3;
}

- (double)timeAtHorizontalOffset:(double)a3
{
  -[RCWaveformRenderer timeAtHorizontalOffset:withVisibleTimeRange:](self, "timeAtHorizontalOffset:withVisibleTimeRange:", a3, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  return result;
}

- (double)timeAtHorizontalOffset:(double)a3 withVisibleTimeRange:(id)a4
{
  -[RCWaveformRenderer _timeForPointOffset:withVisibleTimeRange:](self, "_timeForPointOffset:withVisibleTimeRange:", a3, a4.var0, a4.var1);
  return result;
}

- (CGRect)visibleRect
{
  p_visibleTimeRange = &self->_visibleTimeRange;
  [(RCWaveformRenderer *)self horizontalOffsetAtTime:self->_visibleTimeRange.beginTime];
  double v5 = v4;
  [(RCWaveformRenderer *)self horizontalOffsetAtTime:p_visibleTimeRange->endTime];
  double v7 = v6;
  v8 = [(RCWaveformRenderer *)self view];
  [v8 bounds];
  double v10 = v9;

  double v11 = 0.0;
  double v12 = rint(v5);
  double v13 = rint(v7) - v12;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (id)rasterizeTimeRange:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double var1 = a3.var1;
  double var0 = a3.var0;
  [(RCWaveformDataSource *)self->_dataSource duration];
  if (v9 >= var1) {
    double v10 = var1;
  }
  else {
    double v10 = v9;
  }
  double v11 = [(RCWaveformRenderer *)self view];
  double v12 = [v11 window];

  if (v12)
  {
    id v13 = 0;
  }
  else
  {
    double v14 = +[UIScreen mainScreen];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;

    id v19 = objc_alloc((Class)UIWindow);
    if (v16 >= v18) {
      double v20 = v16;
    }
    else {
      double v20 = v18;
    }
    id v13 = objc_msgSend(v19, "initWithFrame:", v20 + v20, v20 + v20, width, height);
    v21 = [(RCWaveformRenderer *)self view];
    [v13 addSubview:v21];

    [v13 setHidden:0];
  }
  v22 = [(RCWaveformRenderer *)self view];
  [v22 frame];
  double v50 = v24;
  double v51 = v23;
  double v26 = v25;
  double v28 = v27;

  [(RCWaveformRenderer *)self visibleTimeRange];
  double v48 = v30;
  double v49 = v29;
  double y = CGPointZero.y;
  v32 = [(RCWaveformRenderer *)self view];
  objc_msgSend(v32, "setFrame:", CGPointZero.x, y, width, height);

  -[RCWaveformRenderer setVisibleTimeRange:](self, "setVisibleTimeRange:", fmax(var0, 0.0), v10);
  v33 = +[NSRunLoop mainRunLoop];
  objc_msgSend(v33, "rc_runUntilNextDisplayLinkEventWithTimeout:", 0.5);

  v34 = [(RCWaveformRenderer *)self view];
  [v34 bounds];
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  v39 = +[UIScreen mainScreen];
  [v39 scale];
  CGFloat v41 = v40;
  v53.double width = v36;
  v53.double height = v38;
  UIGraphicsBeginImageContextWithOptions(v53, 0, v41);

  v42 = [(RCWaveformRenderer *)self view];
  v43 = [(RCWaveformRenderer *)self view];
  [v43 bounds];
  objc_msgSend(v42, "drawViewHierarchyInRect:afterScreenUpdates:", 1);

  v44 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v45 = [(RCWaveformRenderer *)self view];
  objc_msgSend(v45, "setFrame:", v51, v50, v26, v28);

  -[RCWaveformRenderer setVisibleTimeRange:](self, "setVisibleTimeRange:", v49, v48);
  if (v13)
  {
    v46 = [(RCWaveformRenderer *)self view];
    [v46 removeFromSuperview];

    [v13 setHidden:1];
  }

  return v44;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
  if (a3)
  {
    [(RCWaveformRenderer *)self _stopUpdating];
    [(RCWaveformRenderer *)self _stopRendering];
  }
  else
  {
    [(RCWaveformRenderer *)self _startUpdating];
    [(RCWaveformRenderer *)self _startRendering];
  }
}

- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_C858;
  v5[3] = &unk_6D0B0;
  double v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(RCWaveformRenderer *)v6 _performOrDispatchToMainThread:v5];
}

- (void)waveformDataSourceDidFinishLoading:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_C9A4;
  v3[3] = &unk_6D088;
  v3[4] = self;
  [(RCWaveformRenderer *)self _performOrDispatchToMainThread:v3];
}

- (double)_nonCachedContentWidthWithDuration:(double)a3
{
  [(RCWaveformRenderer *)self _pointsPerSecond];
  return ceil(v4 * a3);
}

- (void)_startUpdating
{
  if (![(RCWaveformRenderer *)self isPaused])
  {
    [(RCWaveformRenderer *)self _setNeedsVisibleTimeRangeRendering];
    dataSource = self->_dataSource;
    [(RCWaveformDataSource *)dataSource addObserver:self];
  }
}

- (void)_stopUpdating
{
}

- (void)_setNeedsRendering
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_CAD0;
  v2[3] = &unk_6D088;
  v2[4] = self;
  [(RCWaveformRenderer *)self _performOrDispatchToMainThread:v2];
}

- (void)_setNeedsVisibleTimeRangeRenderingFromFrameChange
{
  if (self->_isOverview && self->_isRecordWaveform) {
    self->_overviewRecordingWaveformRefresh = 1;
  }
}

- (void)_setNeedsVisibleTimeRangeRendering
{
  if (!self->_needsVisibleRangeRendering
    && [(RCWaveformRenderer *)self _needsWaveformRendering])
  {
    self->_needsVisibleRangeRendering = 1;
    [(RCWaveformRenderer *)self _startRendering];
  }
}

- (void)_startRendering
{
  if (!self->displayLinkConnected)
  {
    double v3 = +[RCDisplayLinkManager sharedManager];
    [v3 addDisplayLinkObserver:self];

    self->displayLinkConnected = 1;
  }
}

- (void)_stopRendering
{
  if (self->displayLinkConnected)
  {
    double v3 = +[RCDisplayLinkManager sharedManager];
    [v3 removeDisplayLinkObserver:self];

    self->displayLinkConnected = 0;
  }
}

- (void)setActiveDisplayLinkRequired:(BOOL)a3
{
  if (self->_activeDisplayLinkRequired != a3)
  {
    self->_activeDisplayLinkRequired = a3;
    if (a3) {
      [(RCWaveformRenderer *)self _startRendering];
    }
    else {
      [(RCWaveformRenderer *)self _stopRendering];
    }
  }
}

- (void)displayLinkDidUpdate:(id)a3 withTimeController:(id)a4
{
  double v5 = [(RCWaveformRenderer *)self view];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(RCWaveformRenderer *)self view];
  double v11 = [v10 window];

  if (v11 && v7 != 0.0 && v9 != 0.0)
  {
    if (!self->_isOverview) {
      self->_visibleTimeRangeVelocitdouble y = (self->_visibleTimeRange.beginTime + self->_visibleTimeRange.endTime) * 0.5
    }
                                      - (self->_lastVisibleTimeRange.beginTime + self->_lastVisibleTimeRange.endTime)
                                      * 0.5;
    self->_lastVisibleTimeRange = self->_visibleTimeRange;
    [(RCWaveformRenderer *)self _duration];
    -[RCWaveformRenderer _draw:](self, "_draw:");
  }
}

- (void)_draw:(double)a3
{
  if (a3 > 0.0) {
    -[RCWaveformRenderer _renderVisibleTimeRangeWithDuration:](self, "_renderVisibleTimeRangeWithDuration:");
  }
}

- (void)_clearRenderingState
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_CE7C;
  v4[3] = &unk_6D088;
  void v4[4] = self;
  double v3 = objc_retainBlock(v4);
  dispatch_sync((dispatch_queue_t)self->_renderingQueue, v3);
}

- (void)_renderTimeRangeOfSegments:(id)a3 withDuration:(double)a4 needsWaveformCalculation:(BOOL)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_82DD8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_82DD8))
  {
    v101 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v101 waveformWaveWidth];
    uint64_t v103 = v102;

    qword_82DD0 = v103;
    __cxa_guard_release(&qword_82DD8);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_82DE8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_82DE8))
  {
    v104 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v104 waveformHorizontalSpacing];
    uint64_t v106 = v105;

    qword_82DE0 = v106;
    __cxa_guard_release(&qword_82DE8);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_82DF8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_82DF8))
  {
    v107 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v107 overviewWaveformWaveWidth];
    uint64_t v109 = v108;

    qword_82DF0 = v109;
    __cxa_guard_release(&qword_82DF8);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_82E08, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_82E08))
  {
    v110 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v110 overviewWaveformHorizontalSpacing];
    uint64_t v112 = v111;

    qword_82E00 = v112;
    __cxa_guard_release(&qword_82E08);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_82E18, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_82E18))
  {
    v113 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v113 maximumDecibelDisplayRange];
    *(float *)&double v114 = v114;
    double v115 = RCNormalizedDecibelValue(*(float *)&v114);

    qword_82E10 = *(void *)&v115;
    __cxa_guard_release(&qword_82E18);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_82E28, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_82E28))
  {
    *(double *)&qword_82E20 = 1.0 / *(double *)&qword_82E10;
    __cxa_guard_release(&qword_82E28);
  }
  if (self->_isOverview) {
    double v10 = &qword_82E00;
  }
  else {
    double v10 = &qword_82DE0;
  }
  double v11 = *(double *)v10;
  double v12 = [(RCWaveformRenderer *)self view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;

  double v17 = RCTimeRangeDeltaWithUIPrecision(self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  if (v17 > 0.0)
  {
    double v18 = v17;
    if (v14 != 100.0 || v16 != 100.0)
    {
      if (self->_calcBlockShouldRefreshAllSlices)
      {
        id v19 = [(RCWaveformRenderer *)self waveformAmpSlicesForRendering];
        BOOL v20 = [v19 count] == 0;
      }
      else
      {
        BOOL v20 = 0;
      }
      double v125 = v11;
      v21 = [(RCWaveformRenderer *)self view];
      [v21 frame];
      double v122 = v22;

      double v23 = +[RCRecorderStyleProvider sharedStyleProvider];
      [v23 waveformWaveVerticalPadding];
      double v25 = v24;

      if (self->_isOverview)
      {
        double v26 = +[RCRecorderStyleProvider sharedStyleProvider];
        [v26 overviewWaveformWaveVerticalPadding];
      }
      else
      {
        if (!self->_isCompactView) {
          goto LABEL_21;
        }
        double v26 = +[RCRecorderStyleProvider sharedStyleProvider];
        [v26 compactWaveformWaveVerticalPadding];
      }
      double v25 = v27;

LABEL_21:
      double v120 = v14;
      double v28 = v14 / v125 / v18;
      double v29 = 1.0 / v28;
      [(RCWaveformRenderer *)self _duration];
      double v121 = a4;
      double v123 = var0;
      if (self->_isOverview)
      {
        double v31 = var1;
        double v32 = 1.0 / v28;
        if (var0 >= a4) {
          double v33 = a4;
        }
        else {
          double v33 = var0;
        }
        if (v33 >= 0.0) {
          double v34 = v33;
        }
        else {
          double v34 = 0.0;
        }
        double v35 = v31;
        if (v31 >= a4) {
          double v36 = a4;
        }
        else {
          double v36 = v31;
        }
        if (v36 >= 0.0) {
          double v37 = v36;
        }
        else {
          double v37 = 0.0;
        }
      }
      else
      {
        if (var0 >= v30) {
          double v38 = v30;
        }
        else {
          double v38 = var0;
        }
        if (v38 >= 0.0) {
          double v34 = v38;
        }
        else {
          double v34 = 0.0;
        }
        double v35 = var1;
        if (var1 + v29 < v30) {
          double v30 = var1 + v29;
        }
        if (v30 >= 0.0) {
          double v37 = v30;
        }
        else {
          double v37 = 0.0;
        }
        double v32 = 1.0 / v28;
        [(RCWaveformDataSource *)self->_dataSource setDurationPerWaveformSlice:1.0 / v28];
      }
      uint64_t v39 = (uint64_t)rint(v28 * v34);
      uint64_t v40 = (uint64_t)rint(v28 * v37);
      uint64_t v41 = v40 - v39;
      if (v40 == v39)
      {
        v42 = OSLogForCategory(@"Default");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          sub_45E88(v42);
        }

        return;
      }
      $93AB83F55FD8EAABF5C634313E89AB95 visibleTimeRange = self->_visibleTimeRange;
      BOOL calcBlockShouldRefreshAllSlices = self->_calcBlockShouldRefreshAllSlices;
      BOOL location = self->_isRecordWaveform;
      self->_BOOL calcBlockShouldRefreshAllSlices = 0;
      int isRecordWaveform = self->_isRecordWaveform;
      int recordDidSwitch = self->_rendererState.recordDidSwitch;
      BOOL v45 = isRecordWaveform != recordDidSwitch;
      if (isRecordWaveform != recordDidSwitch) {
        self->_rendererState.int recordDidSwitch = isRecordWaveform;
      }
      double v46 = v25;
      double v47 = v32;
      if (self->_isRecordWaveform)
      {
        CFTimeInterval v48 = CACurrentMediaTime();
        double v49 = v32 * 0.5;
        if (!self->_isOverview) {
          double v49 = v32;
        }
        if (isRecordWaveform == recordDidSwitch
          && v48 - self->_rendererState.lastRenderTime < v49
          && !self->_overviewRecordingWaveformRefresh)
        {
          double v56 = v123;
          if (self->_isOverview)
          {
            if (![(RCWaveformRenderer *)self renderReadyForDraw]) {
              return;
            }
            BOOL isOverview = self->_isOverview;
          }
          else
          {
            BOOL isOverview = 0;
          }
          [(RCWaveformDataSource *)self->_dataSource timeRangeToHighlight];
          double v51 = v99;
          double v53 = v100;
          BOOL v45 = 0;
          if (!isOverview) {
            goto LABEL_62;
          }
          goto LABEL_61;
        }
        self->_rendererState.lastRenderTime = v48;
        self->_overviewRecordingWaveformRefresh = 0;
        [(RCWaveformDataSource *)self->_dataSource timeRangeToHighlight];
        double v51 = v50;
        double v53 = v52;
        BOOL v45 = 1;
      }
      else
      {
        [(RCWaveformDataSource *)self->_dataSource timeRangeToHighlight];
        double v51 = v54;
        double v53 = v55;
      }
      double v56 = v123;
LABEL_61:
      if (a5)
      {
LABEL_63:
        v143[1] = 3221225472;
        v143[0] = _NSConcreteStackBlock;
        v143[2] = sub_DDF4;
        v143[3] = &unk_6D0D8;
        v143[4] = self;
        *(double *)&v143[5] = v56;
        *(double *)&v143[6] = v35;
        v143[7] = v39;
        v143[8] = v41;
        BOOL v145 = calcBlockShouldRefreshAllSlices;
        *(double *)&v143[9] = v47;
        *(double *)&v143[10] = 2.0 / v16 * 0.5;
        BOOL v146 = location;
        BOOL v147 = v45;
        *(double *)&v143[11] = v51;
        *(double *)&v143[12] = v53;
        BOOL v148 = v20;
        $93AB83F55FD8EAABF5C634313E89AB95 v144 = visibleTimeRange;
        v57 = objc_retainBlock(v143);
        if (self->_syncRenderOnMainThread
          || (id WeakRetained = objc_loadWeakRetained((id *)&self->_rendererDelegate),
              unsigned int v59 = [WeakRetained isZooming],
              WeakRetained,
              v59))
        {
          [(RCWaveformRenderer *)self setNextRenderBlock:0];
          dispatch_sync((dispatch_queue_t)self->_renderingQueue, v57);
        }
        else if ([(RCWaveformRenderer *)self renderingQueueIsBusy])
        {
          [(RCWaveformRenderer *)self setNextRenderBlock:v57];
        }
        else
        {
          [(RCWaveformRenderer *)self setNextRenderBlock:0];
          dispatch_async((dispatch_queue_t)self->_renderingQueue, v57);
        }

LABEL_67:
        v60 = [(RCWaveformRenderer *)self view];
        v61 = [v60 waveformLayer];

        v62 = [(RCWaveformRenderer *)self waveformAmpSlicesForRendering];
        if (self->_isOverview)
        {
          unsigned int v63 = [(RCWaveformRenderer *)self renderReadyForDraw];
          if (!v61) {
            goto LABEL_108;
          }
        }
        else
        {
          unsigned int v63 = 1;
          if (!v61)
          {
LABEL_108:

            return;
          }
        }
        if ([v62 count]) {
          unsigned int v64 = v63;
        }
        else {
          unsigned int v64 = 0;
        }
        if (v64 == 1)
        {
          v65 = [(RCWaveformRenderer *)self traitCollection];
          id v66 = [v65 isUserInterfaceStyleDark];

          v67 = +[RCRecorderStyleProvider sharedStyleProvider];
          v68 = v67;
          v119 = v67;
          if (self->_isRecordWaveform)
          {
            uint64_t v69 = [v67 waveformRecordingColor];
            id v70 = [v68 waveformStandardColor:v66];
            v71 = (void *)v69;
          }
          else
          {
            id v70 = [v67 waveformStandardColor:v66];
            v71 = v70;
          }
          v124 = v70;
          if (self->_isOverview)
          {
            if (v66) {
              +[UIColor blackColor];
            }
            else {
            v73 = +[UIColor whiteColor];
            }
            if (v71)
            {
              v74 = [v71 colorWithAlphaComponent:0.8];

              uint64_t v76 = sub_E578(v75, v73, v74);

              v71 = (void *)v76;
            }
            if (v124)
            {
              v77 = [v124 colorWithAlphaComponent:0.8];

              uint64_t v79 = sub_E578(v78, v73, v77);

              v124 = (void *)v79;
            }
            else
            {
              v124 = 0;
            }
          }
          +[RCVisualWaveformAmpSlice setPrimaryColor:v71];
          +[RCVisualWaveformAmpSlice setSecondaryColor:v124];
          double v80 = v51;
          $93AB83F55FD8EAABF5C634313E89AB95 waveformAmpSlicesForRenderingTimeRange = self->_waveformAmpSlicesForRenderingTimeRange;
          locationa = (id *)&self->_rendererDelegate;
          id v81 = objc_loadWeakRetained((id *)&self->_rendererDelegate);
          [v81 currentTime];
          double v83 = v82;
          double v84 = v122 * 0.5 - v46;
          unint64_t v85 = vcvtmd_u64_f64(v80 / v47);

          if (v53 >= v83) {
            double v86 = v53;
          }
          else {
            double v86 = v83;
          }
          uint64_t v138 = 0;
          v139 = &v138;
          uint64_t v140 = 0x2020000000;
          BOOL waveformAmpSlicesForRenderingRecordStateChanged = self->_waveformAmpSlicesForRenderingRecordStateChanged;
          v128[0] = _NSConcreteStackBlock;
          v128[1] = 3221225472;
          v128[2] = sub_E68C;
          v128[3] = &unk_6D100;
          $93AB83F55FD8EAABF5C634313E89AB95 v129 = waveformAmpSlicesForRenderingTimeRange;
          double v130 = v120;
          double v131 = v125;
          double v132 = v122 * 0.5;
          double v133 = v84;
          v128[4] = self;
          v128[5] = &v138;
          double v134 = v80;
          double v135 = v53;
          unint64_t v136 = v85;
          unint64_t v137 = vcvtpd_u64_f64(v86 / v47);
          v87 = objc_retainBlock(v128);
          if (self->_isOverview) {
            v88 = &qword_82DF0;
          }
          else {
            v88 = &qword_82DD0;
          }
          double v89 = *(double *)v88;
          +[CATransaction begin];
          +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
          if (self->_isOverview)
          {
            [v61 transform];
            if (!CATransform3DIsIdentity(&v127))
            {
              long long v90 = *(_OWORD *)&CATransform3DIdentity.m33;
              v126[4] = *(_OWORD *)&CATransform3DIdentity.m31;
              v126[5] = v90;
              long long v91 = *(_OWORD *)&CATransform3DIdentity.m43;
              v126[6] = *(_OWORD *)&CATransform3DIdentity.m41;
              v126[7] = v91;
              long long v92 = *(_OWORD *)&CATransform3DIdentity.m13;
              v126[0] = *(_OWORD *)&CATransform3DIdentity.m11;
              v126[1] = v92;
              long long v93 = *(_OWORD *)&CATransform3DIdentity.m23;
              v126[2] = *(_OWORD *)&CATransform3DIdentity.m21;
              v126[3] = v93;
              [v61 setTransform:v126];
              v94 = [(RCWaveformRenderer *)self view];
              [v94 bounds];
              objc_msgSend(v61, "setFrame:");
            }
          }
          ((void (*)(void *, void *, void *, double))v87[2])(v87, v62, v61, v89);
          +[CATransaction commit];
          self->_renderedTimeRange = waveformAmpSlicesForRenderingTimeRange;
          if (*((unsigned char *)v139 + 24)) {
            self->_BOOL waveformAmpSlicesForRenderingRecordStateChanged = 0;
          }
          self->_BOOL calcBlockShouldRefreshAllSlices = 0;
          [(RCWaveformRenderer *)self setRenderReadyForDraw:0];
          [(RCWaveformRenderer *)self setWaitForFinalCalc:0];
          [(RCWaveformRenderer *)self _nonCachedContentWidthWithDuration:v121];
          if (self->_cachedContentWidth != v95)
          {
            self->_cachedContentWidth = v95;
            id v96 = objc_loadWeakRetained(locationa);
            char v97 = objc_opt_respondsToSelector();

            if (v97)
            {
              id v98 = objc_loadWeakRetained(locationa);
              [v98 waveformRenderer:self contentWidthDidChange:self->_cachedContentWidth];
            }
          }

          _Block_object_dispose(&v138, 8);
        }
        goto LABEL_108;
      }
LABEL_62:
      if (![(RCWaveformRenderer *)self failedFirstRenderCalculationAttempt]) {
        goto LABEL_67;
      }
      goto LABEL_63;
    }
  }
}

- (BOOL)_needsWaveformRendering
{
  if (self->_calcBlockShouldRefreshAllSlices) {
    return 1;
  }
  double beginTime = self->_waveformAmpSlicesForRenderingTimeRange.beginTime;
  double endTime = self->_waveformAmpSlicesForRenderingTimeRange.endTime;
  BOOL waveformAmpSlicesForRenderingRecordStateChanged = self->_waveformAmpSlicesForRenderingRecordStateChanged;
  double v7 = [(RCWaveformRenderer *)self waveformAmpSlicesForRendering];
  id v8 = [v7 count];
  BOOL v9 = v8 == 0;
  if (!waveformAmpSlicesForRenderingRecordStateChanged && v8 != 0) {
    BOOL v9 = RCTimeRangeEqualToTimeRange(self->_renderedTimeRange.beginTime, self->_renderedTimeRange.endTime, beginTime, endTime);
  }
  BOOL v2 = !v9;

  return v2;
}

- (void)_renderVisibleTimeRangeWithDuration:(double)a3
{
  if ([(RCWaveformRenderer *)self _needsWaveformRendering]
    || self->_needsVisibleRangeRendering)
  {
    LOBYTE(v5) = 0;
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    unsigned int v5 = ![(RCWaveformRenderer *)self renderReadyForDraw];
  }
  if (self->_dataSource)
  {
    if (self->_paused) {
      LOBYTE(v5) = 1;
    }
    if ((v5 & 1) == 0)
    {
      [(RCWaveformRenderer *)self visibleTimeRange];
      double v8 = v7;
      double v10 = v9;
      if (!self->_isOverview)
      {
        [(RCWaveformRenderer *)self _updateOverviewUnitsPerSecond];
        visibleTimeRangeVelocitdouble y = self->_visibleTimeRangeVelocity;
        double v12 = fabs(visibleTimeRangeVelocity);
        if (v12 > 10.0) {
          double v12 = 10.0;
        }
        if (visibleTimeRangeVelocity <= 0.0)
        {
          if (visibleTimeRangeVelocity < 0.0) {
            double v8 = v8 - v12;
          }
        }
        else
        {
          double v10 = v10 + v12;
        }
      }
      -[RCWaveformRenderer _renderTimeRangeOfSegments:withDuration:needsWaveformCalculation:](self, "_renderTimeRangeOfSegments:withDuration:needsWaveformCalculation:", v6, v8, v10, a3);
      self->_needsVisibleRangeRendering = 0;
    }
  }
}

- (double)_pointOffsetForTime:(double)a3
{
  unsigned int v5 = [(RCWaveformRenderer *)self view];
  [v5 bounds];
  double v7 = v6;

  double v8 = [(RCWaveformRenderer *)self rendererDelegate];
  [v8 desiredTimeDeltaForVisibleTimeRange];
  double v10 = v9;

  double result = 0.0;
  if (v10 > 0.0) {
    return v7 / v10 * a3;
  }
  return result;
}

- (double)_timeForPointOffset:(double)a3 withVisibleTimeRange:(id)a4
{
  -[RCWaveformRenderer pointsPerSecondWithVisibleTimeRange:](self, "pointsPerSecondWithVisibleTimeRange:", a4.var0, a4.var1);
  double v6 = a3 / v5;
  BOOL v7 = v5 == 0.0;
  double result = 0.0;
  if (!v7) {
    return v6;
  }
  return result;
}

- (double)_timeForPointOffset:(double)a3
{
  -[RCWaveformRenderer _timeForPointOffset:withVisibleTimeRange:](self, "_timeForPointOffset:withVisibleTimeRange:", a3, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  return result;
}

- (void)_performOrDispatchToMainThread:(id)a3
{
  block = (void (**)(void))a3;
  if (+[NSThread isMainThread]) {
    block[2](block);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (RCWaveformDataSource)dataSource
{
  return self->_dataSource;
}

- (RCWaveformRendererDelegate)rendererDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rendererDelegate);

  return (RCWaveformRendererDelegate *)WeakRetained;
}

- (void)setRendererDelegate:(id)a3
{
}

- (BOOL)frequentUpdatesSegmentUpdatesExpectedHint
{
  return self->_frequentUpdatesSegmentUpdatesExpectedHint;
}

- (void)setFrequentUpdatesSegmentUpdatesExpectedHint:(BOOL)a3
{
  self->_frequentUpdatesSegmentUpdatesExpectedHint = a3;
}

- (BOOL)isRecordWaveform
{
  return self->_isRecordWaveform;
}

- (BOOL)isEditMode
{
  return self->_isEditMode;
}

- (void)setIsEditMode:(BOOL)a3
{
  self->_isEditMode = a3;
}

- (BOOL)isPlayback
{
  return self->_isPlayback;
}

- (void)setIsPlayback:(BOOL)a3
{
  self->_isPlayback = a3;
}

- (BOOL)isCompactView
{
  return self->_isCompactView;
}

- (void)setIsCompactView:(BOOL)a3
{
  self->_isCompactView = a3;
}

- (BOOL)isOverview
{
  return self->_isOverview;
}

- (void)setIsOverview:(BOOL)a3
{
  self->_BOOL isOverview = a3;
}

- (BOOL)isPlayBarOnlyMode
{
  return self->_isPlayBarOnlyMode;
}

- (void)setIsPlayBarOnlyMode:(BOOL)a3
{
  self->_isPlayBarOnlyMode = a3;
}

- (BOOL)calcBlockShouldRefreshAllSlices
{
  return self->_calcBlockShouldRefreshAllSlices;
}

- (void)setCalcBlockShouldRefreshAllSlices:(BOOL)a3
{
  self->_BOOL calcBlockShouldRefreshAllSlices = a3;
}

- (BOOL)syncRenderOnMainThread
{
  return self->_syncRenderOnMainThread;
}

- (void)setSyncRenderOnMainThread:(BOOL)a3
{
  self->_syncRenderOnMainThread = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isActiveDisplayLinkRequired
{
  return self->_activeDisplayLinkRequired;
}

- (double)spacingWidth
{
  return self->_spacingWidth;
}

- (void)setSpacingWidth:(double)a3
{
  self->_spacingWidth = a3;
}

- (double)dataPointWidth
{
  return self->_dataPointWidth;
}

- (void)setDataPointWidth:(double)a3
{
  self->_dataPointWidth = a3;
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

- (void)setHighlightTimeRange:(id)a3
{
  self->_highlightTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
}

- (BOOL)overviewRecordingWaveformRefresh
{
  return self->_overviewRecordingWaveformRefresh;
}

- (void)setOverviewRecordingWaveformRefresh:(BOOL)a3
{
  self->_overviewRecordingWaveformRefresh = a3;
}

- (BOOL)renderingQueueIsBusy
{
  return self->_renderingQueueIsBusy;
}

- (void)setRenderingQueueIsBusy:(BOOL)a3
{
  self->_renderingQueueIsBusdouble y = a3;
}

- (BOOL)renderReadyForDraw
{
  return self->_renderReadyForDraw;
}

- (void)setRenderReadyForDraw:(BOOL)a3
{
  self->_renderReadyForDraw = a3;
}

- (BOOL)failedFirstRenderCalculationAttempt
{
  return self->_failedFirstRenderCalculationAttempt;
}

- (void)setFailedFirstRenderCalculationAttempt:(BOOL)a3
{
  self->_failedFirstRenderCalculationAttempt = a3;
}

- (BOOL)waitForFinalCalc
{
  return self->_waitForFinalCalc;
}

- (void)setWaitForFinalCalc:(BOOL)a3
{
  self->_waitForFinalCalc = a3;
}

- (id)nextRenderBlock
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setNextRenderBlock:(id)a3
{
}

- (NSArray)waveformAmpSlicesForRendering
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setWaveformAmpSlicesForRendering:(id)a3
{
}

- (NSMutableDictionary)waveformSlices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void)setWaveformSlices:(id)a3
{
}

- (NSMutableIndexSet)waveformSliceIndexes
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 208, 1);
}

- (void)setWaveformSliceIndexes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformSliceIndexes, 0);
  objc_storeStrong((id *)&self->_waveformSlices, 0);
  objc_storeStrong((id *)&self->_waveformAmpSlicesForRendering, 0);
  objc_storeStrong(&self->_nextRenderBlock, 0);
  objc_destroyWeak((id *)&self->_rendererDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_renderingQueue, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 120) = 0;
  *((void *)self + 16) = 0;
  return self;
}

@end