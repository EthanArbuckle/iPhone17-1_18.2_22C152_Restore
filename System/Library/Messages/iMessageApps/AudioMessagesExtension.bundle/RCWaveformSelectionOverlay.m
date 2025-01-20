@interface RCWaveformSelectionOverlay
- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange;
- (BOOL)__shouldDisplayBeginTimeText;
- (BOOL)__shouldDisplayEndTimeText;
- (BOOL)_axIsShowingSelectionBars;
- (BOOL)_beginTrackingSelectionBar:(id)a3 selectionBarType:(int64_t)a4 withTouch:(id)a5;
- (BOOL)_drawsSelectionForWidth:(double)a3;
- (BOOL)_shouldDisplayBeginTimeText;
- (BOOL)_shouldDisplayEndTimeText;
- (BOOL)_shouldOffsetSelectionBarTypeForThumb:(int64_t)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)barMatchesKnobRadius;
- (BOOL)changeAXValue;
- (BOOL)enablePlayBarTracking;
- (BOOL)enableTimeTrackingInView;
- (BOOL)insertMode;
- (BOOL)isAccessibilityElement;
- (BOOL)isCurrentlyTracking;
- (BOOL)isEditingEnabled;
- (BOOL)isOverView;
- (BOOL)isRecording;
- (BOOL)overviewTrimHandleStyle;
- (BOOL)playBarOnly;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_alternateBeginTimeRectWithSizedTextLayer:(id)a3;
- (CGRect)_alternateEndTimeRectWithSizedTextLayer:(id)a3;
- (CGRect)_beginTimeRectWithSizedTextLayer:(id)a3 isOffsetForThumb:(BOOL *)a4;
- (CGRect)_endTimeRectWithSizedTextLayer:(id)a3 isOffsetForThumb:(BOOL *)a4;
- (CGRect)_middleTimeRectWithFont:(id)a3;
- (CGRect)_selectionBoundsIncludingKnobs;
- (CGRect)_selectionBoundsIncludingKnobsUsingMultiplier:(double)a3;
- (CGRect)_selectionRectForSelectedTimeRange:(id)a3;
- (CGRect)selectionRect;
- (RCWaveformSelectionOverlay)initWithCoder:(id)a3;
- (RCWaveformSelectionOverlay)initWithDelegate:(id)a3 height:(double)a4 selectionAreaInsets:(UIEdgeInsets)a5;
- (RCWaveformSelectionOverlay)initWithFrame:(CGRect)a3;
- (RCWaveformSelectionOverlayDelegate)delegate;
- (UIButton)resetRegionButton;
- (UIView)selectionBackgroundView;
- (double)_effectiveSelectionWidth;
- (double)_minimumOverlaySelectionWidth;
- (double)_minimumOverlayWidth;
- (double)_xAdjustmentAmount;
- (double)assetCurrentTime;
- (double)assetDuration;
- (double)axSegment;
- (double)currentTimeIndicatorCoordinate;
- (double)knobWidthMultiplier;
- (double)playWidthMultiplier;
- (double)selectedTimeRangeMaximumDuration;
- (double)selectedTimeRangeMinimumDuration;
- (double)trackedAssetCurrentTime;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_hitSelectionForPoint:(CGPoint)a3;
- (id)_touchTrackingInfoForSelectionBarTye:(int64_t)a3;
- (id)accessibilityElements;
- (id)accessibilityValue;
- (int64_t)beginTimeIndicatorSelectionAffinity;
- (int64_t)endTimeIndicatorSelectionAffinity;
- (int64_t)selectionMode;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityIncreaseValue:(BOOL)a3 bySegment:(double)a4;
- (void)_clearStaleTouches;
- (void)_clearSublayers;
- (void)_createSublayersIfNeeded;
- (void)_setWantsAnimatedLayoutDuration:(double)a3;
- (void)_updateSelectedTimeRangeForTrackedTouchesAnimated:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)layoutSubviews;
- (void)reloadSelectionOffsets;
- (void)setAssetCurrentTime:(double)a3;
- (void)setAssetDuration:(double)a3;
- (void)setAxSegment:(double)a3;
- (void)setBarMatchesKnobRadius:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingEnabled:(BOOL)a3;
- (void)setEnablePlayBarTracking:(BOOL)a3;
- (void)setEnableTimeTrackingInView:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInsertMode:(BOOL)a3;
- (void)setIsOverView:(BOOL)a3;
- (void)setIsRecording:(BOOL)a3;
- (void)setKnobWidthMultiplier:(double)a3;
- (void)setOverviewTrimHandleStyle:(BOOL)a3;
- (void)setPlayBarOnly:(BOOL)a3;
- (void)setPlayWidthMultiplier:(double)a3;
- (void)setResetRegionButton:(id)a3;
- (void)setSelectedTimeRange:(id)a3;
- (void)setSelectedTimeRange:(id)a3 withAnimationDuration:(double)a4;
- (void)setSelectedTimeRangeMaximumDuration:(double)a3;
- (void)setSelectedTimeRangeMinimumDuration:(double)a3;
- (void)setSelectionBackgroundView:(id)a3;
- (void)setSelectionMode:(int64_t)a3;
- (void)setSelectionRect:(CGRect)a3;
- (void)setTrackedAssetCurrentTime:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation RCWaveformSelectionOverlay

- (RCWaveformSelectionOverlay)initWithFrame:(CGRect)a3
{
  return 0;
}

- (RCWaveformSelectionOverlay)initWithCoder:(id)a3
{
  return [(RCWaveformSelectionOverlay *)self init];
}

- (RCWaveformSelectionOverlay)initWithDelegate:(id)a3 height:(double)a4 selectionAreaInsets:(UIEdgeInsets)a5
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  id v11 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RCWaveformSelectionOverlay;
  v12 = -[RCWaveformSelectionOverlay initWithFrame:](&v22, "initWithFrame:", 0.0, 0.0, 0.0, a4);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    v13->_selectionAreaInsets.CGFloat top = top;
    v13->_selectionAreaInsets.CGFloat left = left;
    v13->_selectionAreaInsets.CGFloat bottom = bottom;
    v13->_selectionAreaInsets.CGFloat right = right;
    v13->_selectionRect.origin.x = 0.0;
    v13->_selectionRect.origin.y = 0.0;
    v13->_selectionRect.size.width = 0.0;
    v13->_selectionRect.size.height = 177.0;
    uint64_t v14 = +[NSMutableDictionary dictionary];
    trackedTouches = v13->_trackedTouches;
    v13->_trackedTouches = (NSMutableDictionary *)v14;

    -[RCWaveformSelectionOverlay sizeThatFits:](v13, "sizeThatFits:", 0.0, a4);
    double v17 = v16;
    double v19 = v18;
    [(RCWaveformSelectionOverlay *)v13 setMultipleTouchEnabled:1];
    -[RCWaveformSelectionOverlay setFrame:](v13, "setFrame:", 0.0, 0.0, v17, v19);
    [(RCWaveformSelectionOverlay *)v13 setOpaque:0];
    [(RCWaveformSelectionOverlay *)v13 setUserInteractionEnabled:1];
    v20 = +[UIColor clearColor];
    [(RCWaveformSelectionOverlay *)v13 setBackgroundColor:v20];

    [(RCWaveformSelectionOverlay *)v13 setIsRecording:0];
    v13->_trackedAssetCurrentTime = -1.0;
  }

  return v13;
}

- (void)setSelectionRect:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_selectionRect = &self->_selectionRect;
  if (!CGRectEqualToRect(self->_selectionRect, a3))
  {
    if (p_selectionRect->size.height != height) {
      [(RCWaveformSelectionOverlay *)self _clearSublayers];
    }
    p_selectionRect->origin.CGFloat x = x;
    p_selectionRect->origin.CGFloat y = y;
    p_selectionRect->size.CGFloat width = width;
    p_selectionRect->size.double height = height;
    [(RCWaveformSelectionOverlay *)self setNeedsLayout];
  }
}

- (void)setSelectedTimeRange:(id)a3 withAnimationDuration:(double)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  p_selectedTimeRange = &self->_selectedTimeRange;
  if (!RCTimeRangeEqualToTimeRange(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime, a3.var0, a3.var1))
  {
    p_selectedTimeRange->beginTime = var0;
    p_selectedTimeRange->endTime = var1;
    [(RCWaveformSelectionOverlay *)self reloadSelectionOffsets];
    [(RCWaveformSelectionOverlay *)self _setWantsAnimatedLayoutDuration:a4];
  }
}

- (void)setSelectedTimeRange:(id)a3
{
}

- (void)reloadSelectionOffsets
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained waveformSelectionOverlayGetCurrentTime:self];
  self->_assetCurrentTime = v4;

  if (self->_assetCurrentTime >= 0.0
    || self->_trackedAssetCurrentTime >= 0.0
    || RCTimeRangeDeltaWithUIPrecision(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime) > 0.00000011920929)
  {
    double beginTime = self->_selectedTimeRange.beginTime;
    double endTime = self->_selectedTimeRange.endTime;
  }
  else
  {
    RCTimeRangeMake(self->_assetCurrentTime, self->_assetCurrentTime);
  }
  -[RCWaveformSelectionOverlay _selectionRectForSelectedTimeRange:](self, "_selectionRectForSelectedTimeRange:", beginTime, endTime);

  -[RCWaveformSelectionOverlay setSelectionRect:](self, "setSelectionRect:");
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(RCWaveformSelectionOverlay *)self frame];
  if (v8 == height)
  {
    v9.receiver = self;
    v9.super_class = (Class)RCWaveformSelectionOverlay;
    -[RCWaveformSelectionOverlay setFrame:](&v9, "setFrame:", x, y, width, height);
  }
  else
  {
    [(RCWaveformSelectionOverlay *)self _clearSublayers];
    v10.receiver = self;
    v10.super_class = (Class)RCWaveformSelectionOverlay;
    -[RCWaveformSelectionOverlay setFrame:](&v10, "setFrame:", x, y, width, height);
    [(RCWaveformSelectionOverlay *)self reloadSelectionOffsets];
  }
  [(RCWaveformSelectionOverlay *)self setNeedsLayout];
}

- (void)setTrackedAssetCurrentTime:(double)a3
{
  if (self->_trackedAssetCurrentTime != a3)
  {
    self->_trackedAssetCurrentTime = a3;
    [(RCWaveformSelectionOverlay *)self setNeedsLayout];
  }
}

- (void)setAssetCurrentTime:(double)a3
{
  if (self->_assetCurrentTime != a3)
  {
    self->_assetCurrentTime = a3;
    if (self->_trackedAssetCurrentTime < 0.0) {
      [(RCWaveformSelectionOverlay *)self setNeedsLayout];
    }
  }
}

- (void)setAssetDuration:(double)a3
{
  self->_assetDuration = a3;
  [(RCWaveformSelectionOverlay *)self setNeedsLayout];
}

- (void)setSelectionMode:(int64_t)a3
{
  if (self->_selectionMode != a3)
  {
    self->_selectionMode = a3;
    [(RCWaveformSelectionOverlay *)self _clearSublayers];
    [(RCWaveformSelectionOverlay *)self setNeedsLayout];
  }
}

- (double)currentTimeIndicatorCoordinate
{
  [(RCWaveformSelectionOverlay *)self layoutIfNeeded];
  [(RCOverlayBarLayer *)self->_currentTimeBar frame];

  return CGRectGetMidX(*(CGRect *)&v3);
}

- (int64_t)beginTimeIndicatorSelectionAffinity
{
  v2 = [(RCWaveformSelectionOverlay *)self _touchTrackingInfoForSelectionBarTye:0];
  id v3 = [v2 selectionAffinity];

  return (int64_t)v3;
}

- (int64_t)endTimeIndicatorSelectionAffinity
{
  v2 = [(RCWaveformSelectionOverlay *)self _touchTrackingInfoForSelectionBarTye:1];
  id v3 = [v2 selectionAffinity];

  return (int64_t)v3;
}

- (void)setIsRecording:(BOOL)a3
{
  if (self->_isRecording != a3)
  {
    self->_isRecording = a3;
    [(RCWaveformSelectionOverlay *)self setNeedsLayout];
  }
}

- (void)_clearSublayers
{
  [(RCOverlayBarLayer *)self->_beginTimeSelection removeFromSuperlayer];
  beginTimeSelection = self->_beginTimeSelection;
  self->_beginTimeSelection = 0;

  [(RCOverlayBarLayer *)self->_endTimeSelection removeFromSuperlayer];
  endTimeSelection = self->_endTimeSelection;
  self->_endTimeSelection = 0;

  [(CALayer *)self->_middleSelectionOverlay removeFromSuperlayer];
  middleSelectionOverladouble y = self->_middleSelectionOverlay;
  self->_middleSelectionOverladouble y = 0;

  [(CALayer *)self->_corneredDimOverlayContainer removeFromSuperlayer];
  corneredDimOverlayContainer = self->_corneredDimOverlayContainer;
  self->_corneredDimOverlayContainer = 0;

  [(RCOverlayBarLayer *)self->_currentTimeBar removeFromSuperlayer];
  currentTimeBar = self->_currentTimeBar;
  self->_currentTimeBar = 0;

  [(RCOverlayBarLayer *)self->_compactCurrentTimeBar removeFromSuperlayer];
  compactCurrentTimeBar = self->_compactCurrentTimeBar;
  self->_compactCurrentTimeBar = 0;

  self->_sublayersCreated = 0;
}

- (void)_createSublayersIfNeeded
{
  if (!self->_sublayersCreated)
  {
    id v45 = +[RCRecorderStyleProvider sharedStyleProvider];
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    if (!self->_middleSelectionOverlay)
    {
      id v3 = (CALayer *)objc_alloc_init((Class)CALayer);
      middleSelectionOverladouble y = self->_middleSelectionOverlay;
      self->_middleSelectionOverladouble y = v3;

      if (self->_overviewTrimHandleStyle)
      {
        id v5 = [v45 selectionOverlayEndpointBarColor];
        -[CALayer setBorderColor:](self->_middleSelectionOverlay, "setBorderColor:", [v5 CGColor]);

        [v45 selectionOverlayBorderWidth];
        -[CALayer setBorderWidth:](self->_middleSelectionOverlay, "setBorderWidth:");
      }
    }
    if (!self->_corneredDimOverlayContainer)
    {
      v6 = (CALayer *)objc_alloc_init((Class)CALayer);
      corneredDimOverlayContainer = self->_corneredDimOverlayContainer;
      self->_corneredDimOverlayContainer = v6;

      id v8 = +[UIColor clearColor];
      -[CALayer setBackgroundColor:](self->_corneredDimOverlayContainer, "setBackgroundColor:", [v8 CGColor]);

      if (self->_overviewTrimHandleStyle)
      {
        [v45 overviewWaveformCornerRadius];
        -[CALayer setCornerRadius:](self->_corneredDimOverlayContainer, "setCornerRadius:");
        [(CALayer *)self->_corneredDimOverlayContainer setMasksToBounds:1];
      }
    }
    [(RCWaveformSelectionOverlay *)self knobWidthMultiplier];
    -[RCWaveformSelectionOverlay _selectionBoundsIncludingKnobsUsingMultiplier:](self, "_selectionBoundsIncludingKnobsUsingMultiplier:");
    double v10 = v9;
    if (!self->_beginTimeSelection)
    {
      BOOL overviewTrimHandleStyle = self->_overviewTrimHandleStyle;
      v12 = [RCOverlayBarLayer alloc];
      v13 = [v45 selectionOverlayEndpointBarColor];
      [(RCWaveformSelectionOverlay *)self knobWidthMultiplier];
      if (overviewTrimHandleStyle)
      {
        v15 = [(RCOverlayBarLayer *)v12 initWithColor:v13 selectionExtentIncludingKnobs:0 topKnob:0 bottomKnob:1 widthMultiplier:v10 barWidthMatchesKnobs:v14];
        beginTimeSelection = self->_beginTimeSelection;
        self->_beginTimeSelection = v15;

        v13 = +[UIImage imageNamed:@"Trim_Chevron_Left"];
        [(RCOverlayBarLayer *)self->_beginTimeSelection setBarGlyph:v13];
      }
      else
      {
        double v17 = [(RCOverlayBarLayer *)v12 initWithColor:v13 selectionExtentIncludingKnobs:1 topKnob:1 bottomKnob:0 widthMultiplier:v10 barWidthMatchesKnobs:v14];
        double v18 = self->_beginTimeSelection;
        self->_beginTimeSelection = v17;
      }
    }
    if (!self->_endTimeSelection)
    {
      BOOL v19 = self->_overviewTrimHandleStyle;
      v20 = [RCOverlayBarLayer alloc];
      v21 = [v45 selectionOverlayEndpointBarColor];
      [(RCWaveformSelectionOverlay *)self knobWidthMultiplier];
      if (v19)
      {
        v23 = [(RCOverlayBarLayer *)v20 initWithColor:v21 selectionExtentIncludingKnobs:0 topKnob:0 bottomKnob:1 widthMultiplier:v10 barWidthMatchesKnobs:v22];
        endTimeSelection = self->_endTimeSelection;
        self->_endTimeSelection = v23;

        v21 = +[UIImage imageNamed:@"Trim_Chevron_Right"];
        [(RCOverlayBarLayer *)self->_endTimeSelection setBarGlyph:v21];
      }
      else
      {
        v25 = [(RCOverlayBarLayer *)v20 initWithColor:v21 selectionExtentIncludingKnobs:1 topKnob:1 bottomKnob:0 widthMultiplier:v10 barWidthMatchesKnobs:v22];
        v26 = self->_endTimeSelection;
        self->_endTimeSelection = v25;
      }
    }
    if (!self->_currentTimeBar)
    {
      [(RCWaveformSelectionOverlay *)self playWidthMultiplier];
      -[RCWaveformSelectionOverlay _selectionBoundsIncludingKnobsUsingMultiplier:](self, "_selectionBoundsIncludingKnobsUsingMultiplier:");
      double v28 = v27;
      v29 = [RCOverlayBarLayer alloc];
      v30 = [v45 playbackPositionBarColor];
      [(RCWaveformSelectionOverlay *)self playWidthMultiplier];
      v32 = [(RCOverlayBarLayer *)v29 initWithColor:v30 selectionExtentIncludingKnobs:1 topKnob:1 bottomKnob:[(RCWaveformSelectionOverlay *)self barMatchesKnobRadius] widthMultiplier:v28 barWidthMatchesKnobs:v31];
      currentTimeBar = self->_currentTimeBar;
      self->_currentTimeBar = v32;
    }
    if (!self->_compactCurrentTimeBar)
    {
      v34 = +[RCRecorderStyleProvider sharedStyleProvider];
      [v34 compactStyleTimeBarDefaultHeight];
      double v36 = v35;

      v37 = +[RCRecorderStyleProvider sharedStyleProvider];
      [v37 compactStylePlayheadMultiplier];
      double v39 = v38;

      v40 = [RCOverlayBarLayer alloc];
      v41 = +[RCRecorderStyleProvider sharedStyleProvider];
      v42 = [v41 playbackPositionBarColor];
      v43 = [(RCOverlayBarLayer *)v40 initWithColor:v42 selectionExtentIncludingKnobs:0 topKnob:0 bottomKnob:1 widthMultiplier:v36 barWidthMatchesKnobs:v39];
      compactCurrentTimeBar = self->_compactCurrentTimeBar;
      self->_compactCurrentTimeBar = v43;
    }
    +[CATransaction commit];
    self->_sublayersCreated = 1;
  }
}

- (void)_setWantsAnimatedLayoutDuration:(double)a3
{
  if (a3 <= 0.0)
  {
    char requestedNonAnimatedLayout = 1;
  }
  else
  {
    self->_requestedAnimatedLayoutDuration = a3;
    char requestedNonAnimatedLayout = self->_requestedNonAnimatedLayout;
  }
  self->_char requestedNonAnimatedLayout = requestedNonAnimatedLayout;
  [(RCWaveformSelectionOverlay *)self setNeedsLayout];
}

- (void)setEditingEnabled:(BOOL)a3
{
  if (self->_editingEnabled != a3)
  {
    self->_editingEnabled = a3;
    [(RCWaveformSelectionOverlay *)self setNeedsLayout];
    [(RCWaveformSelectionOverlay *)self layoutIfNeeded];
  }
}

- (void)setInsertMode:(BOOL)a3
{
  if (self->_insertMode != a3)
  {
    self->_insertMode = a3;
    [(RCWaveformSelectionOverlay *)self setNeedsLayout];
    [(RCWaveformSelectionOverlay *)self layoutIfNeeded];
  }
}

- (void)layoutSubviews
{
  BOOL v3 = self->_requestedAnimatedLayoutDuration > 0.0 && !self->_requestedNonAnimatedLayout;
  double v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v4 animationDragCoefficient];
  double v6 = v5;

  double v7 = v6 * self->_requestedAnimatedLayoutDuration;
  id v8 = +[RCRecorderStyleProvider sharedStyleProvider];
  if (v3)
  {
    +[CATransaction begin];
    +[CATransaction setAnimationDuration:v7];
  }
  self->_requestedAnimatedLayoutDuration = 0.0;
  self->_char requestedNonAnimatedLayout = 0;
  v167[0] = _NSConcreteStackBlock;
  v167[1] = 3221225472;
  v167[2] = sub_66B8;
  v167[3] = &unk_6CEF0;
  v167[4] = self;
  *(double *)&v167[5] = v6;
  *(double *)&v167[6] = v7;
  BOOL v168 = v3;
  double v9 = objc_retainBlock(v167);
  [(RCWaveformSelectionOverlay *)self _createSublayersIfNeeded];
  [(RCWaveformSelectionOverlay *)self _selectionBoundsIncludingKnobs];
  double x = v170.origin.x;
  double y = v170.origin.y;
  double width = v170.size.width;
  double height = v170.size.height;
  if (CGRectIsEmpty(v170)
    || (v171.origin.x = x, v171.origin.y = y, v171.size.width = width, v171.size.double height = height, CGRectIsInfinite(v171))
    || fabs(x) == INFINITY
    || fabs(y) == INFINITY
    || fabs(width) == INFINITY
    || fabs(height) == INFINITY)
  {
    if (v3) {
      +[CATransaction commit];
    }
  }
  else
  {
    if ([(RCWaveformSelectionOverlay *)self playBarOnly])
    {
      unsigned int v151 = 0;
      double v14 = 0.0;
    }
    else
    {
      unsigned int v151 = [(RCWaveformSelectionOverlay *)self isEditingEnabled];
      double v14 = 0.0;
      if (v151) {
        double v14 = 1.0;
      }
    }
    double v150 = v14;
    [(RCWaveformSelectionOverlay *)self selectedTimeRange];
    double v16 = v15;
    double v154 = v17;
    double v18 = RCTimeRangeDeltaWithUIPrecision(v15, v17);
    BOOL v19 = v18 == 0.0 && self->_insertMode;
    BOOL v20 = v18 > 0.0 || !self->_insertMode;
    BOOL overviewTrimHandleStyle = self->_overviewTrimHandleStyle;
    -[CALayer setZPosition:](self->_middleSelectionOverlay, "setZPosition:", 1.0, *(void *)&v18);
    if (overviewTrimHandleStyle) {
      double v22 = 3.0;
    }
    else {
      double v22 = 2.0;
    }
    if (overviewTrimHandleStyle) {
      double v23 = 2.0;
    }
    else {
      double v23 = 3.0;
    }
    [(RCOverlayBarLayer *)self->_currentTimeBar setZPosition:v22];
    [(RCOverlayBarLayer *)self->_compactCurrentTimeBar setZPosition:v22];
    [(RCOverlayBarLayer *)self->_beginTimeSelection setZPosition:v23];
    [(RCOverlayBarLayer *)self->_endTimeSelection setZPosition:v23];
    [(CALayer *)self->_corneredDimOverlayContainer setZPosition:0.5];
    [(RCWaveformSelectionOverlay *)self _selectionHighlightBounds];
    double v161 = v24;
    double rect = v25;
    [(RCOverlayBarLayer *)self->_beginTimeSelection frame];
    double v27 = v26;
    double v157 = v28;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v30 = WeakRetained;
    double assetDuration = self->_assetDuration;
    if (v16 < assetDuration) {
      double assetDuration = v16;
    }
    if (assetDuration < 0.0) {
      double assetDuration = 0.0;
    }
    [WeakRetained waveformSelectionOverlay:self offsetForTime:assetDuration];
    double v33 = v32;

    BOOL v160 = v20;
    double v152 = v33;
    if (self->_overviewTrimHandleStyle)
    {
      if (v19 || v20)
      {
        [(RCOverlayBarLayer *)self->_endTimeSelection frame];
        double v35 = v34;
        [(RCOverlayBarLayer *)self->_beginTimeSelection setMasksToBounds:0];
        double v157 = rect;
        double v36 = v161;
        double MinY = v161;
        double v38 = v35;
      }
      else
      {
        [(RCOverlayBarLayer *)self->_beginTimeSelection setMasksToBounds:1];
        double v38 = 1.0;
        double v157 = rect;
        double v36 = v161;
        double MinY = v161;
        double v35 = 1.0;
      }
    }
    else
    {
      double v38 = v27;
      double v35 = v27 * 0.5;
      v172.origin.double x = x;
      v172.origin.double y = y;
      v172.size.double width = width;
      v172.size.double height = height;
      double MinY = CGRectGetMinY(v172);
      double v36 = v161;
    }
    v39.n128_f64[0] = RCRoundCoord(v152 - v35);
    if (v19) {
      v40.n128_f64[0] = 0.0;
    }
    else {
      v40.n128_f64[0] = v150;
    }
    ((void (*)(void *, RCOverlayBarLayer *, void, void, __n128, double, double, double, __n128))v9[2])(v9, self->_beginTimeSelection, 0, 0, v39, MinY, v38, v157, v40);
    [(RCOverlayBarLayer *)self->_endTimeSelection frame];
    double v158 = v41;
    double v153 = v42;
    id v43 = objc_loadWeakRetained((id *)&self->_delegate);
    v44 = v43;
    double v45 = self->_assetDuration;
    if (v154 < v45) {
      double v45 = v154;
    }
    if (v45 < 0.0) {
      double v45 = 0.0;
    }
    [v43 waveformSelectionOverlay:self offsetForTime:v45];
    double v47 = v46;

    double v48 = rect;
    if (!self->_overviewTrimHandleStyle)
    {
      double v47 = v47 + v158 * -0.5;
      v173.origin.double x = x;
      v173.origin.double y = y;
      v173.size.double width = width;
      v173.size.double height = height;
      double v36 = CGRectGetMinY(v173);
      double v48 = v153;
    }
    v49.n128_f64[0] = RCRoundCoord(v47);
    if (v20) {
      v50.n128_f64[0] = v150;
    }
    else {
      v50.n128_f64[0] = 0.0;
    }
    ((void (*)(void *, RCOverlayBarLayer *, void, void, __n128, double, double, double, __n128))v9[2])(v9, self->_endTimeSelection, 0, 0, v49, v36, v158, v48, v50);
    [(RCWaveformSelectionOverlay *)self playWidthMultiplier];
    -[RCWaveformSelectionOverlay _selectionBoundsIncludingKnobsUsingMultiplier:](self, "_selectionBoundsIncludingKnobsUsingMultiplier:");
    CGFloat v52 = v51;
    CGFloat v54 = v53;
    CGFloat v56 = v55;
    CGFloat v58 = v57;
    double trackedAssetCurrentTime = self->_trackedAssetCurrentTime;
    if (trackedAssetCurrentTime < 0.0)
    {
      id v60 = objc_loadWeakRetained((id *)&self->_delegate);
      [v60 waveformSelectionOverlayGetCurrentTime:self];
      double trackedAssetCurrentTime = v61;
    }
    double v62 = self->_assetDuration;
    if (trackedAssetCurrentTime < v62) {
      double v62 = trackedAssetCurrentTime;
    }
    if (v62 >= 0.0) {
      double v63 = v62;
    }
    else {
      double v63 = 0.0;
    }
    [(RCOverlayBarLayer *)self->_currentTimeBar frame];
    double v65 = v64;
    double v67 = v66;
    id v68 = objc_loadWeakRetained((id *)&self->_delegate);
    [v68 waveformSelectionOverlay:self offsetForTime:v63];
    double v70 = v69;

    +[RCOverlayBarLayer selectionKnobRadius];
    double v72 = v71;
    [(RCWaveformSelectionOverlay *)self playWidthMultiplier];
    double v74 = RCRoundCoord(v70 - v72 * v73);
    if (self->_overviewTrimHandleStyle)
    {
      [v8 overviewPlayheadHeightInset];
      CGFloat v76 = -v75;
      v174.origin.double x = v74;
      v174.origin.double y = v161;
      v174.size.double width = v65;
      v174.size.double height = rect;
      CGRect v175 = CGRectInset(v174, 0.0, v76);
      double v74 = v175.origin.x;
      double v77 = v175.origin.y;
      double v65 = v175.size.width;
      double v67 = v175.size.height;
    }
    else
    {
      v176.origin.double x = v52;
      v176.origin.double y = v54;
      v176.size.double width = v56;
      v176.size.double height = v58;
      double v77 = CGRectGetMinY(v176);
    }
    if (v70 < 0.0) {
      double v78 = 0.0;
    }
    else {
      double v78 = 1.0;
    }
    v79 = [(RCWaveformSelectionOverlay *)self layer];
    v80 = [v79 animationForKey:@"bounds.origin"];

    location = (id *)&self->_delegate;
    v159 = v80;
    if ([v80 isMemberOfClass:objc_opt_class()]) {
      id v81 = v80;
    }
    else {
      id v81 = 0;
    }
    [(RCOverlayBarLayer *)self->_currentTimeBar position];
    double v83 = v82;
    double v85 = v84;
    v86 = [(RCWaveformSelectionOverlay *)self delegate];
    unsigned int v87 = [v86 waveformSelectionOverlayNeedsExplicitAnimations];

    [(RCOverlayBarLayer *)self->_currentTimeBar frame];
    v155 = v81;
    if (v87 && v81)
    {
      double v89 = v74 - v83;
      if (v74 - v83 < 0.0) {
        double v89 = -(v74 - v83);
      }
      if (v89 > v88)
      {
        +[CATransaction begin];
        BOOL v90 = v3;
        id v91 = v159;
        v92 = +[CASpringAnimation animationWithKeyPath:@"position"];
        [v91 duration];
        objc_msgSend(v92, "setDuration:");
        v93 = [v91 timingFunction];
        [v92 setTimingFunction:v93];

        [v91 damping];
        objc_msgSend(v92, "setDamping:");
        [v91 stiffness];
        objc_msgSend(v92, "setStiffness:");
        [v91 mass];
        double v95 = v94;

        BOOL v3 = v90;
        [v92 setMass:v95];
        [(RCOverlayBarLayer *)self->_currentTimeBar position];
        v96 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
        [v92 setFromValue:v96];

        -[RCOverlayBarLayer setPosition:](self->_currentTimeBar, "setPosition:", v74, v77);
        [(RCOverlayBarLayer *)self->_currentTimeBar addAnimation:v92 forKey:@"position"];
        +[CATransaction commit];
      }
    }
    else if (v83 != v74 || v85 != v77)
    {
      ((void (*)(void *, RCOverlayBarLayer *, void, void, double, double, double, double, double))v9[2])(v9, self->_currentTimeBar, 0, 0, v74, v77, v65, v67, v78);
    }
    [(RCWaveformSelectionOverlay *)self bounds];
    CGFloat v98 = v97;
    CGFloat v100 = v99;
    CGFloat v102 = v101;
    [(RCOverlayBarLayer *)self->_compactCurrentTimeBar frame];
    CGFloat v103 = CGRectGetWidth(v177);
    v178.origin.double x = v98;
    v178.origin.double y = v100;
    v178.size.double width = v103;
    v178.size.double height = v102;
    CGFloat v104 = CGRectGetWidth(v178);
    double v105 = RCRoundCoord(v70 + v104 * -0.5);
    [v8 compactStyleTimeBarHeightInset];
    CGFloat v107 = v106;
    v179.origin.double x = v105;
    v179.origin.double y = v100;
    v179.size.double width = v103;
    v179.size.double height = v102;
    CGRect v180 = CGRectInset(v179, 0.0, v107);
    ((void (*)(void *, RCOverlayBarLayer *, void, void, CGPoint, __n128, CGSize, __n128, double))v9[2])(v9, self->_compactCurrentTimeBar, 0, 0, v180.origin, *(__n128 *)&v180.origin.y, v180.size, *(__n128 *)&v180.size.height, v78);
    int64_t selectionMode = self->_selectionMode;
    BOOL v109 = selectionMode == 1;
    [(RCOverlayBarLayer *)self->_compactCurrentTimeBar setHidden:selectionMode != 1];
    [(RCOverlayBarLayer *)self->_currentTimeBar setHidden:v109];
    if (self->_insertMode)
    {
      v110 = [v8 recordPositionBarColor];
      [(RCOverlayBarLayer *)self->_beginTimeSelection setColor:v110];

      v111 = [v8 recordPositionBarColor];
      [(RCOverlayBarLayer *)self->_endTimeSelection setColor:v111];

      v112 = [v8 replaceSelectionOverlayColor];
      id v113 = objc_loadWeakRetained((id *)&self->_selectionBackgroundView);
      [v113 setBackgroundColor:v112];

      [v8 recordPositionBarColor];
    }
    else
    {
      v114 = [v8 selectionOverlayEndpointBarColor];
      [(RCOverlayBarLayer *)self->_beginTimeSelection setColor:v114];

      v115 = [v8 selectionOverlayEndpointBarColor];
      [(RCOverlayBarLayer *)self->_endTimeSelection setColor:v115];

      v116 = [v8 selectionOverlayColor];
      id v117 = objc_loadWeakRetained((id *)&self->_selectionBackgroundView);
      [v117 setBackgroundColor:v116];

      [v8 selectionOverlayEndpointBarColor];
    }
    id v118 = objc_claimAutoreleasedReturnValue();
    -[CALayer setBorderColor:](self->_middleSelectionOverlay, "setBorderColor:", [v118 CGColor]);

    if (self->_isRecording || self->_insertMode && (double v119 = v149, v149 == 0.0))
    {
      v120 = [v8 recordPositionBarColor];
      [(RCOverlayBarLayer *)self->_currentTimeBar setColor:v120];

      uint64_t v121 = [v8 recordPositionBarColor];
    }
    else
    {
      v148 = objc_msgSend(v8, "playbackPositionBarColor", v119);
      [(RCOverlayBarLayer *)self->_currentTimeBar setColor:v148];

      uint64_t v121 = [v8 playbackPositionBarColor];
    }
    v122 = (void *)v121;
    [(RCOverlayBarLayer *)self->_compactCurrentTimeBar setColor:v121];

    [(RCOverlayBarLayer *)self->_beginTimeSelection frame];
    double MidX = CGRectGetMidX(v181);
    [(RCOverlayBarLayer *)self->_endTimeSelection frame];
    double v124 = CGRectGetMidX(v182) - MidX;
    double v125 = RCRoundCoord(MidX);
    double v126 = RCRoundCoord(v124);
    middleSelectionOverladouble y = self->_middleSelectionOverlay;
    CGFloat v128 = 0.0;
    double v129 = 0.0;
    v130.n128_u64[0] = 0;
    if ((v151 & v160) == 1)
    {
      [v8 selectionOverlayAlpha];
      v130.n128_u64[0] = v131;
      double v129 = 1.0;
    }
    ((void (*)(void *, CALayer *, void, void, double, double, double, double, __n128))v9[2])(v9, middleSelectionOverlay, 0, 0, v125, v161, v126, rect, v130);
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    id v132 = objc_loadWeakRetained((id *)&self->_selectionBackgroundView);
    objc_msgSend(v132, "setFrame:", v125, v161, v126, rect);

    id v133 = objc_loadWeakRetained((id *)&self->_selectionBackgroundView);
    [v133 setAlpha:v129];

    if ([(RCWaveformSelectionOverlay *)self overviewTrimHandleStyle])
    {
      [v8 selectionOverlayBorderWidth];
      CGFloat v128 = v134;
    }
    id v135 = objc_loadWeakRetained(location);
    [v135 waveformSelectionOverlay:self offsetForTime:0.0];
    double v137 = v136;

    id v138 = objc_loadWeakRetained(location);
    [v138 waveformSelectionOverlay:self offsetForTime:self->_assetDuration];
    double v140 = v139;

    v183.origin.double x = v125;
    v183.origin.double y = v161;
    v183.size.double width = v126;
    v183.size.double height = rect;
    CGRect v184 = CGRectInset(v183, 0.0, v128);
    ((void (*)(void *, CALayer *, void, void, double, __n128, double, __n128, double))v9[2])(v9, self->_corneredDimOverlayContainer, 0, 0, v137, *(__n128 *)&v184.origin.y, v140 - v137, *(__n128 *)&v184.size.height, v129);
    v185.origin.double x = v125 - v137;
    v185.origin.double y = v161;
    v185.size.double width = v126;
    v185.size.double height = rect;
    +[CATransaction commit];
    if (+[UIApplication shouldMakeUIForDefaultPNG])
    {
      long long v165 = 0u;
      long long v166 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      v141 = [(RCWaveformSelectionOverlay *)self layer];
      v142 = [v141 sublayers];

      id v143 = [v142 countByEnumeratingWithState:&v163 objects:v169 count:16];
      if (v143)
      {
        id v144 = v143;
        uint64_t v145 = *(void *)v164;
        do
        {
          for (i = 0; i != v144; i = (char *)i + 1)
          {
            if (*(void *)v164 != v145) {
              objc_enumerationMutation(v142);
            }
            [*(id *)(*((void *)&v163 + 1) + 8 * i) setHidden:1];
          }
          id v144 = [v142 countByEnumeratingWithState:&v163 objects:v169 count:16];
        }
        while (v144);
      }

      [(RCOverlayBarLayer *)self->_currentTimeBar setHidden:0];
      LODWORD(v147) = 1.0;
      [(RCOverlayBarLayer *)self->_currentTimeBar setOpacity:v147];
    }
    if (v3) {
      +[CATransaction commit];
    }
  }
}

- (id)_hitSelectionForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  double x = a3.x;
  double v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_6D88;
  v25[3] = &unk_6CF18;
  v25[4] = self;
  *(double *)&v25[5] = x;
  *(CGFloat *)&v25[6] = y;
  double v7 = objc_retainBlock(v25);
  if (self->_editingEnabled)
  {
    if (x >= 0.0)
    {
      [(RCWaveformSelectionOverlay *)self frame];
      double v8 = 0.0;
      if (x > v9)
      {
        [(RCWaveformSelectionOverlay *)self frame];
        double v8 = x - v10;
      }
    }
    else
    {
      double v8 = fabs(x);
    }
    p_endTimeSelection = &self->_endTimeSelection;
    endTimeSelection = self->_endTimeSelection;
    [v6 selectionHitTestSlop];
    if (((uint64_t (*)(void *, RCOverlayBarLayer *))v7[2])(v7, endTimeSelection)) {
      goto LABEL_16;
    }
    beginTimeSelection = self->_beginTimeSelection;
    [v6 selectionHitTestSlop];
    if (((uint64_t (*)(void *, RCOverlayBarLayer *, double, double))v7[2])(v7, beginTimeSelection, 0.0, v14))
    {
      p_endTimeSelection = &self->_beginTimeSelection;
LABEL_16:
      double v23 = *p_endTimeSelection;
      goto LABEL_18;
    }
    double v15 = *p_endTimeSelection;
    [v6 selectionHitTestSlop];
    if (((uint64_t (*)(void *, RCOverlayBarLayer *, double, double))v7[2])(v7, v15, 0.0, v8 + v16)) {
      goto LABEL_16;
    }
    double v17 = self->_beginTimeSelection;
    [v6 selectionHitTestSlop];
    p_endTimeSelection = &self->_beginTimeSelection;
    if (((uint64_t (*)(void *, RCOverlayBarLayer *, double, double))v7[2])(v7, v17, v8 + v18, 0.0)) {
      goto LABEL_16;
    }
    if ([(RCWaveformSelectionOverlay *)self enablePlayBarTracking])
    {
      if (v8 == 0.0)
      {
        p_endTimeSelection = &self->_currentTimeBar;
        currentTimeBar = self->_currentTimeBar;
        [v6 selectionHitTestSlop];
        double v21 = v20;
        [v6 selectionHitTestSlop];
        if (((uint64_t (*)(void *, RCOverlayBarLayer *, double, double))v7[2])(v7, currentTimeBar, v21, v22))goto LABEL_16; {
      }
        }
    }
  }
  if ([(RCWaveformSelectionOverlay *)self enableTimeTrackingInView])
  {
    p_endTimeSelection = &self->_currentTimeBar;
    goto LABEL_16;
  }
  double v23 = 0;
LABEL_18:

  return v23;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double v4 = -[RCWaveformSelectionOverlay _hitSelectionForPoint:](self, "_hitSelectionForPoint:", a4, a3.x, a3.y);
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)_beginTrackingSelectionBar:(id)a3 selectionBarType:(int64_t)a4 withTouch:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  trackedTouches = self->_trackedTouches;
  id v11 = +[NSValue valueWithPointer:v9];
  v12 = [(NSMutableDictionary *)trackedTouches objectForKey:v11];

  if (!v12)
  {
    v13 = [(RCWaveformSelectionOverlay *)self _touchTrackingInfoForSelectionBarTye:a4];

    if (!v13)
    {
      [v9 locationInView:self];
      -[RCWaveformSelectionOverlay _hitSelectionForPoint:](self, "_hitSelectionForPoint:");
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 == v8)
      {
        [(RCWaveformSelectionOverlay *)self selectionRect];
        if (a4 == 2)
        {
          [(RCWaveformSelectionOverlay *)self currentTimeIndicatorCoordinate];
        }
        else if (a4 == 1)
        {
          double MaxX = CGRectGetMaxX(*(CGRect *)&v17);
        }
        else
        {
          double v21 = 0.0;
          if (a4)
          {
LABEL_13:
            double v23 = objc_alloc_init(RCSelectionTouchTrackingInfo);
            double v24 = [(RCWaveformSelectionOverlay *)self superview];
            [v9 locationInView:v24];
            [(RCSelectionTouchTrackingInfo *)v23 setTrackingOffset:v21 - v25];

            [(RCSelectionTouchTrackingInfo *)v23 setSelectionBarType:a4];
            [(RCSelectionTouchTrackingInfo *)v23 setTouch:v9];
            double v26 = self->_trackedTouches;
            double v27 = +[NSValue valueWithPointer:v9];
            [(NSMutableDictionary *)v26 setObject:v23 forKey:v27];

            BOOL v15 = 1;
            goto LABEL_5;
          }
          double MaxX = CGRectGetMinX(*(CGRect *)&v17);
        }
        double v21 = MaxX;
        goto LABEL_13;
      }
    }
  }
  BOOL v15 = 0;
LABEL_5:

  return v15;
}

- (void)_updateSelectedTimeRangeForTrackedTouchesAnimated:(BOOL)a3
{
  double v4 = 0.0;
  if (a3) {
    double v4 = 0.5;
  }
  [(RCWaveformSelectionOverlay *)self _setWantsAnimatedLayoutDuration:v4];
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  CGFloat MinX = 0.0;
  [(RCWaveformSelectionOverlay *)self selectionRect];
  CGFloat MinX = CGRectGetMinX(v59);
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  CGFloat MaxX = 0.0;
  [(RCWaveformSelectionOverlay *)self selectionRect];
  CGFloat MaxX = CGRectGetMaxX(v60);
  double beginTime = self->_selectedTimeRange.beginTime;
  double endTime = self->_selectedTimeRange.endTime;
  uint64_t v53 = 0x2020000000;
  double v54 = beginTime;
  uint64_t v51 = 0;
  CGFloat v52 = (double *)&v51;
  uint64_t v47 = 0;
  double v48 = (double *)&v47;
  uint64_t v49 = 0x2020000000;
  double v50 = endTime;
  uint64_t v43 = 0;
  v44 = (double *)&v43;
  uint64_t v45 = 0x2020000000;
  unint64_t v46 = 0xBFF0000000000000;
  uint64_t v39 = 0;
  __n128 v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v35 = 0;
  double v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v31 = 0;
  double v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  double v7 = [(NSMutableDictionary *)self->_trackedTouches allValues];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_74B4;
  v21[3] = &unk_6CF80;
  double v23 = &v39;
  double v24 = v57;
  v21[4] = self;
  double v22 = &stru_6CF58;
  double v25 = &v51;
  double v26 = &v47;
  double v27 = &v35;
  double v28 = v55;
  v29 = &v31;
  v30 = &v43;
  [v7 enumerateObjectsUsingBlock:v21];

  double v8 = RCTimeRangeMake(v52[3], v48[3]);
  double v10 = v9;
  if (!RCTimeRangeEqualToTimeRange(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime, v8, v9))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "waveformSelectionOverlay:willChangeSelectedTimeRange:isTrackingMin:isTrackingMax:", self, *((unsigned __int8 *)v40 + 24), *((unsigned __int8 *)v36 + 24), v8, v10);
    double v13 = v12;
    double v15 = v14;

    if (v13 >= 0.0) {
      -[RCWaveformSelectionOverlay setSelectedTimeRange:](self, "setSelectedTimeRange:", v13, v15);
    }
  }
  if (*((unsigned char *)v32 + 24))
  {
    double v16 = v44[3];
    if (v16 != self->_assetCurrentTime || v16 != self->_trackedAssetCurrentTime)
    {
      double assetDuration = 0.0;
      if (v16 < 0.0 || (double assetDuration = self->_assetDuration, v16 > assetDuration)) {
        v44[3] = assetDuration;
      }
      id v18 = objc_loadWeakRetained((id *)&self->_delegate);
      [v18 waveformSelectionOverlay:self willChangeAssetCurrentTime:1 isTracking:v44[3]];
      *((void *)v44 + 3) = v19;

      [(RCWaveformSelectionOverlay *)self setTrackedAssetCurrentTime:v44[3]];
      [(RCWaveformSelectionOverlay *)self setAssetCurrentTime:v44[3]];
    }
  }
  else
  {
    double trackedAssetCurrentTime = self->_trackedAssetCurrentTime;
    [(RCWaveformSelectionOverlay *)self setTrackedAssetCurrentTime:-1.0];
    if (trackedAssetCurrentTime >= 0.0) {
      [(RCWaveformSelectionOverlay *)self setAssetCurrentTime:trackedAssetCurrentTime];
    }
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);
}

- (void)_clearStaleTouches
{
  BOOL v3 = +[NSMutableArray array];
  trackedTouches = self->_trackedTouches;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_789C;
  v7[3] = &unk_6CFA8;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)trackedTouches enumerateKeysAndObjectsUsingBlock:v7];
  if ([v5 count])
  {
    [(NSMutableDictionary *)self->_trackedTouches removeObjectsForKeys:v5];
    if (![(NSMutableDictionary *)self->_trackedTouches count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained waveformSelectionOverlay:self didFinishTrackingSelectionBeginTime:1 endTime:1 assetCurrentTime:1];
    }
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_isRecording
    && (self->_editingEnabled || [(RCWaveformSelectionOverlay *)self enableTimeTrackingInView]))
  {
    id v22 = v7;
    [(RCWaveformSelectionOverlay *)self _clearStaleTouches];
    id v21 = [(NSMutableDictionary *)self->_trackedTouches count];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if (![(RCWaveformSelectionOverlay *)self _beginTrackingSelectionBar:self->_beginTimeSelection selectionBarType:0 withTouch:v13]&& ![(RCWaveformSelectionOverlay *)self _beginTrackingSelectionBar:self->_endTimeSelection selectionBarType:1 withTouch:v13])
          {
            [(RCWaveformSelectionOverlay *)self _beginTrackingSelectionBar:self->_currentTimeBar selectionBarType:2 withTouch:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    id v7 = v22;
    if (v21 != [(NSMutableDictionary *)self->_trackedTouches count])
    {
      [(RCWaveformSelectionOverlay *)self _updateSelectedTimeRangeForTrackedTouchesAnimated:[(RCWaveformSelectionOverlay *)self rc_canAnimate]];
      if ([(NSMutableDictionary *)self->_trackedTouches count])
      {
        if (!v21)
        {
          double v14 = [(RCWaveformSelectionOverlay *)self _touchTrackingInfoForSelectionBarTye:0];
          BOOL v15 = v14 != 0;

          double v16 = [(RCWaveformSelectionOverlay *)self _touchTrackingInfoForSelectionBarTye:1];
          BOOL v17 = v16 != 0;

          id v18 = [(RCWaveformSelectionOverlay *)self _touchTrackingInfoForSelectionBarTye:2];
          BOOL v19 = v18 != 0;

          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained waveformSelectionOverlay:self willBeginTrackingSelectionBeginTime:v15 endTime:v17 assetCurrentTime:v19];
        }
      }
    }
  }
}

- (BOOL)isCurrentlyTracking
{
  return [(NSMutableDictionary *)self->_trackedTouches count] != 0;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)self->_trackedTouches allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_7D88;
  v13[3] = &unk_6CFD0;
  id v14 = v5;
  id v7 = v5;
  id v8 = [v6 indexesOfObjectsPassingTest:v13];

  if ([v8 count])
  {
    [(RCWaveformSelectionOverlay *)self _updateSelectedTimeRangeForTrackedTouchesAnimated:0];
    id v9 = [(RCWaveformSelectionOverlay *)self _touchTrackingInfoForSelectionBarTye:2];

    if ([(RCWaveformSelectionOverlay *)self enableTimeTrackingInView])
    {
      if (v9)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained waveformSelectionOverlay:self didFinishTrackingSelectionBeginTime:0 endTime:0 assetCurrentTime:1];
      }
    }
  }
  [(RCWaveformSelectionOverlay *)self _touchTrackingInfoForSelectionBarTye:0];

  uint64_t v11 = [(RCWaveformSelectionOverlay *)self _accessibilityValueForKey:@"LastSpokenTime"];
  double v12 = UIAXTimeStringForDuration();
  if (([v11 isEqualToString:v12] & 1) == 0)
  {
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v12);
    [(RCWaveformSelectionOverlay *)self _accessibilitySetRetainedValue:v12 forKey:@"LastSpokenTime"];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  BOOL v19 = [(RCWaveformSelectionOverlay *)self _touchTrackingInfoForSelectionBarTye:0];

  id v18 = [(RCWaveformSelectionOverlay *)self _touchTrackingInfoForSelectionBarTye:1];

  BOOL v17 = [(RCWaveformSelectionOverlay *)self _touchTrackingInfoForSelectionBarTye:2];

  id v6 = [(NSMutableDictionary *)self->_trackedTouches count];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        trackedTouches = self->_trackedTouches;
        uint64_t v13 = +[NSValue valueWithPointer:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        [(NSMutableDictionary *)trackedTouches removeObjectForKey:v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  if (v6 != [(NSMutableDictionary *)self->_trackedTouches count])
  {
    [(RCWaveformSelectionOverlay *)self _updateSelectedTimeRangeForTrackedTouchesAnimated:[(RCWaveformSelectionOverlay *)self rc_canAnimate]];
    if (![(NSMutableDictionary *)self->_trackedTouches count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained waveformSelectionOverlay:self didFinishTrackingSelectionBeginTime:v19 != 0 endTime:v18 != 0 assetCurrentTime:v17 != 0];

      if (v19) {
        goto LABEL_11;
      }
LABEL_13:
      id v14 = @"WAVEFORM_SELECTION_CHANGED_END_TIME";
      goto LABEL_14;
    }
  }
  if (!v19) {
    goto LABEL_13;
  }
LABEL_11:
  id v14 = @"WAVEFORM_SELECTION_CHANGED_START_TIME";
LABEL_14:
  double v16 = RCLocalizedFrameworkString(v14);
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v16);
  [(RCWaveformSelectionOverlay *)self _accessibilityRemoveValueForKey:@"LastSpokenTime"];
}

- (double)_effectiveSelectionWidth
{
  return self->_selectionRect.size.width;
}

- (double)_xAdjustmentAmount
{
  BOOL overviewTrimHandleStyle = self->_overviewTrimHandleStyle;
  +[RCOverlayBarLayer selectionKnobRadius];
  double v5 = v4;
  [(RCWaveformSelectionOverlay *)self knobWidthMultiplier];
  if (overviewTrimHandleStyle) {
    double v6 = v6 + v6;
  }
  return -(v5 * v6);
}

- (CGRect)_selectionBoundsIncludingKnobsUsingMultiplier:(double)a3
{
  [(RCWaveformSelectionOverlay *)self selectionRect];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  +[RCOverlayBarLayer selectionKnobRadius];
  double v14 = v13 * a3;
  BOOL v15 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v15 selectionHighlightToKnobInset];
  double v17 = v16 + v14 * 2.0;

  [(RCWaveformSelectionOverlay *)self _xAdjustmentAmount];
  double v19 = v18;
  v28.origin.double x = v6;
  v28.origin.CGFloat y = v8;
  v28.size.double width = v10;
  v28.size.double height = v12;
  double v20 = v19 + CGRectGetMinX(v28);
  v29.origin.double x = v6;
  v29.origin.CGFloat y = v8;
  v29.size.double width = v10;
  v29.size.double height = v12;
  CGFloat v21 = CGRectGetMaxX(v29) - v19;
  v30.origin.double x = v6;
  v30.origin.CGFloat y = v8;
  v30.size.double width = v10;
  v30.size.double height = v12;
  CGFloat v22 = CGRectGetMinY(v30) - v17;
  v31.origin.double x = v6;
  v31.origin.CGFloat y = v8;
  v31.size.double width = v10;
  v31.size.double height = v12;
  CGFloat MaxY = CGRectGetMaxY(v31);
  double v24 = v21 - v20;
  double v25 = v17 + MaxY - v22;
  double v26 = v20;
  double v27 = v22;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.CGFloat y = v27;
  result.origin.double x = v26;
  return result;
}

- (CGRect)_selectionBoundsIncludingKnobs
{
  [(RCWaveformSelectionOverlay *)self knobWidthMultiplier];

  -[RCWaveformSelectionOverlay _selectionBoundsIncludingKnobsUsingMultiplier:](self, "_selectionBoundsIncludingKnobsUsingMultiplier:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_selectionRectForSelectedTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  double v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained waveformSelectionOverlay:self offsetForTime:var0];
  double v9 = v8 + self->_selectionAreaInsets.left;

  id v10 = objc_loadWeakRetained((id *)&self->_delegate);
  [v10 waveformSelectionOverlay:self offsetForTime:var1];
  double v12 = v11 - self->_selectionAreaInsets.right;

  [(RCWaveformSelectionOverlay *)self bounds];
  double MinY = CGRectGetMinY(v27);
  double top = self->_selectionAreaInsets.top;
  [v6 selectionHighlightToKnobInset];
  double v16 = MinY + top + v15;
  [(RCWaveformSelectionOverlay *)self bounds];
  double MaxY = CGRectGetMaxY(v28);
  double bottom = self->_selectionAreaInsets.bottom;
  [v6 selectionHighlightToKnobInset];
  double v20 = MaxY - (bottom + v19);
  double v21 = v12 - v9;
  double v22 = v20 - v16;

  double v23 = v9;
  double v24 = v16;
  double v25 = v21;
  double v26 = v22;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.CGFloat y = v24;
  result.origin.double x = v23;
  return result;
}

- (BOOL)_drawsSelectionForWidth:(double)a3
{
  [(RCWaveformSelectionOverlay *)self _minimumOverlaySelectionWidth];
  return v4 <= a3;
}

- (double)_minimumOverlaySelectionWidth
{
  +[RCOverlayBarLayer selectionKnobRadius];
  return v2 * 4.0;
}

- (double)_minimumOverlayWidth
{
  +[RCOverlayBarLayer selectionKnobRadius];
  return v2 + v2;
}

- (CGRect)_middleTimeRectWithFont:(id)a3
{
  id v4 = a3;
  [(RCWaveformSelectionOverlay *)self bounds];
  double v6 = v5;
  double v29 = v7;
  [(RCWaveformSelectionOverlay *)self _selectionHighlightBounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v4 lineHeight];
  *(float *)&double v16 = v16;
  double v17 = ceilf(*(float *)&v16);
  double v18 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v18 selectionMiddleTimeBaselineInset];
  double v20 = v19;
  [v4 descender];
  double v22 = v21;

  float v23 = v20 + v22;
  double v24 = rintf(v23);

  v30.origin.double x = v9;
  v30.origin.CGFloat y = v11;
  v30.size.double width = v13;
  v30.size.double height = v15;
  double v25 = CGRectGetMaxY(v30) - v17 - v24;
  double v26 = v6;
  double v27 = v29;
  double v28 = v17;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.CGFloat y = v25;
  result.origin.double x = v26;
  return result;
}

- (id)_touchTrackingInfoForSelectionBarTye:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMutableDictionary *)self->_trackedTouches allValues];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        CGFloat v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 selectionBarType] == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)__shouldDisplayBeginTimeText
{
  double v3 = [(RCWaveformSelectionOverlay *)self _touchTrackingInfoForSelectionBarTye:0];
  if (v3)
  {
    char v4 = 1;
  }
  else
  {
    p_selectedTimeRange = &self->_selectedTimeRange;
    char v4 = RCTimeRangeDeltaWithUIPrecision(p_selectedTimeRange->beginTime, p_selectedTimeRange->endTime) > 0.001
      && p_selectedTimeRange->beginTime != 0.0;
  }

  return v4;
}

- (BOOL)__shouldDisplayEndTimeText
{
  char v3 = 1;
  char v4 = [(RCWaveformSelectionOverlay *)self _touchTrackingInfoForSelectionBarTye:1];
  if (!v4) {
    char v3 = RCTimeRangeDeltaWithUIPrecision(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime) > 0.001
  }
      && vabdd_f64(self->_selectedTimeRange.endTime, self->_assetDuration) > 0.001;

  return v3;
}

- (BOOL)_shouldDisplayBeginTimeText
{
  if ([(RCWaveformSelectionOverlay *)self __shouldDisplayBeginTimeText]) {
    return 1;
  }

  return [(RCWaveformSelectionOverlay *)self __shouldDisplayEndTimeText];
}

- (BOOL)_shouldOffsetSelectionBarTypeForThumb:(int64_t)a3
{
  return 0;
}

- (CGRect)_beginTimeRectWithSizedTextLayer:(id)a3 isOffsetForThumb:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 font];
  double v8 = +[RCRecorderStyleProvider sharedStyleProvider];
  [(RCWaveformSelectionOverlay *)self _selectionBoundsIncludingKnobs];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  unsigned int v17 = [(RCWaveformSelectionOverlay *)self _shouldOffsetSelectionBarTypeForThumb:0];
  BOOL v18 = v17;
  if (v17) {
    [v8 selectionTimeInsetWhenSelected];
  }
  else {
    [v8 selectionTimeInsetNormal];
  }
  double v47 = v19;
  [v8 selectionTimeBaseLineOffset];
  double v21 = v20;
  [v7 ascender];
  double v23 = v22;
  v48.origin.double x = v10;
  v48.origin.CGFloat y = v12;
  v48.size.double width = v14;
  v48.size.double height = v16;
  double MinX = CGRectGetMinX(v48);
  v49.origin.double x = v10;
  v49.origin.CGFloat y = v12;
  v49.size.double width = v14;
  v49.size.double height = v16;
  double MinY = CGRectGetMinY(v49);
  [v6 frame];
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;

  v50.origin.double x = v27;
  v50.origin.CGFloat y = v29;
  v50.size.double width = v31;
  v50.size.double height = v33;
  double Width = CGRectGetWidth(v50);
  [v7 lineHeight];
  if (a4) {
    *a4 = v18;
  }
  float v36 = v47;
  float v37 = v21 + v23;
  float v38 = v35;
  double v39 = rint(MinX + rintf(v36));
  double v40 = rint(MinY - rintf(v37));
  double v41 = ceil(Width);
  double v42 = ceilf(v38);

  double v43 = v39;
  double v44 = v40;
  double v45 = v41;
  double v46 = v42;
  result.size.double height = v46;
  result.size.double width = v45;
  result.origin.CGFloat y = v44;
  result.origin.double x = v43;
  return result;
}

- (CGRect)_alternateBeginTimeRectWithSizedTextLayer:(id)a3
{
  id v4 = a3;
  [(RCWaveformSelectionOverlay *)self _selectionBoundsIncludingKnobs];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(RCWaveformSelectionOverlay *)self _beginTimeRectWithSizedTextLayer:v4 isOffsetForThumb:0];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  CGFloat v20 = v19;

  v27.origin.double x = v14;
  v27.origin.CGFloat y = v16;
  v27.size.double width = v18;
  v27.size.double height = v20;
  double MinX = CGRectGetMinX(v27);
  v28.origin.double x = v6;
  v28.origin.CGFloat y = v8;
  v28.size.double width = v10;
  v28.size.double height = v12;
  double v22 = MinX - CGRectGetMinX(v28);
  v29.origin.double x = v6;
  v29.origin.CGFloat y = v8;
  v29.size.double width = v10;
  v29.size.double height = v12;
  double v23 = CGRectGetMinX(v29) - v22 - v18;
  double v24 = v16;
  double v25 = v18;
  double v26 = v20;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.CGFloat y = v24;
  result.origin.double x = v23;
  return result;
}

- (BOOL)_shouldDisplayEndTimeText
{
  if ([(RCWaveformSelectionOverlay *)self __shouldDisplayBeginTimeText]) {
    return 1;
  }

  return [(RCWaveformSelectionOverlay *)self __shouldDisplayEndTimeText];
}

- (CGRect)_endTimeRectWithSizedTextLayer:(id)a3 isOffsetForThumb:(BOOL *)a4
{
  id v6 = a3;
  double v7 = [v6 font];
  CGFloat v8 = +[RCRecorderStyleProvider sharedStyleProvider];
  [(RCWaveformSelectionOverlay *)self _selectionBoundsIncludingKnobs];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  unsigned int v17 = [(RCWaveformSelectionOverlay *)self _shouldOffsetSelectionBarTypeForThumb:1];
  BOOL v18 = v17;
  if (v17) {
    [v8 selectionTimeInsetWhenSelected];
  }
  else {
    [v8 selectionTimeInsetNormal];
  }
  double v49 = v19;
  [v8 selectionTimeBaseLineOffset];
  double v48 = v20;
  [v7 ascender];
  double v47 = v21;
  v50.origin.double x = v10;
  v50.origin.CGFloat y = v12;
  v50.size.double width = v14;
  v50.size.double height = v16;
  double MaxX = CGRectGetMaxX(v50);
  [v6 frame];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;

  v51.origin.double x = v23;
  v51.origin.CGFloat y = v25;
  v51.size.double width = v27;
  v51.size.double height = v29;
  double Width = CGRectGetWidth(v51);
  v52.origin.double x = v10;
  v52.origin.CGFloat y = v12;
  v52.size.double width = v14;
  v52.size.double height = v16;
  double MinY = CGRectGetMinY(v52);
  [v7 lineHeight];
  if (a4) {
    *a4 = v18;
  }
  float v33 = v49;
  double v34 = MaxX - rintf(v33);
  float v35 = v48 + v47;
  double v36 = MinY - rintf(v35);
  float v37 = v32;
  double v38 = rint(v34 - Width);
  double v39 = rint(v36);
  double v40 = ceil(v34 - (v34 - Width));
  double v41 = ceilf(v37);

  double v42 = v38;
  double v43 = v39;
  double v44 = v40;
  double v45 = v41;
  result.size.double height = v45;
  result.size.double width = v44;
  result.origin.CGFloat y = v43;
  result.origin.double x = v42;
  return result;
}

- (CGRect)_alternateEndTimeRectWithSizedTextLayer:(id)a3
{
  id v4 = a3;
  [(RCWaveformSelectionOverlay *)self _selectionBoundsIncludingKnobs];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(RCWaveformSelectionOverlay *)self _endTimeRectWithSizedTextLayer:v4 isOffsetForThumb:0];
  CGFloat rect = v13;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v27.origin.double x = v6;
  v27.origin.CGFloat y = v8;
  v27.size.double width = v10;
  v27.size.double height = v12;
  double MaxX = CGRectGetMaxX(v27);
  v28.origin.double x = rect;
  v28.origin.CGFloat y = v15;
  v28.size.double width = v17;
  v28.size.double height = v19;
  double v21 = MaxX - CGRectGetMaxX(v28);
  v29.origin.double x = v6;
  v29.origin.CGFloat y = v8;
  v29.size.double width = v10;
  v29.size.double height = v12;
  double v22 = CGRectGetMaxX(v29) + v21;
  double v23 = v15;
  double v24 = v17;
  double v25 = v19;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.CGFloat y = v23;
  result.origin.double x = v22;
  return result;
}

- (BOOL)changeAXValue
{
  return 1;
}

- (BOOL)_axIsShowingSelectionBars
{
  return self->_editingEnabled;
}

- (BOOL)isAccessibilityElement
{
  return ![(RCWaveformSelectionOverlay *)self _axIsShowingSelectionBars];
}

- (id)accessibilityElements
{
  char v3 = [(RCWaveformSelectionOverlay *)self _accessibilityValueForKey:@"kUIAccessibilityStorageKeyChildren"];
  if (!v3)
  {
    id v4 = [[AXWaveformSelectionBarElement alloc] initWithAccessibilityContainer:self];
    [(AXWaveformSelectionBarElement *)v4 setAdjustsStartTime:1];
    double v5 = [[AXWaveformSelectionBarElement alloc] initWithAccessibilityContainer:self];
    v7[0] = v4;
    v7[1] = v5;
    char v3 = +[NSArray arrayWithObjects:v7 count:2];
    [(RCWaveformSelectionOverlay *)self _accessibilitySetRetainedValue:v3 forKey:@"kUIAccessibilityStorageKeyChildren"];
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)RCWaveformSelectionOverlay;
  unint64_t v3 = [(RCWaveformSelectionOverlay *)&v7 accessibilityTraits];
  unsigned int v4 = [(RCWaveformSelectionOverlay *)self changeAXValue];
  UIAccessibilityTraits v5 = UIAccessibilityTraitAdjustable;
  if (!v4) {
    UIAccessibilityTraits v5 = 0;
  }
  return v5 | v3;
}

- (id)accessibilityValue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained waveformSelectionOverlayGetCurrentTime:self];

  return (id)UIAXTimeStringForDuration();
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  BOOL v5 = [(RCWaveformSelectionOverlay *)self changeAXValue];
  if (v5)
  {
    BOOL v5 = [(RCWaveformSelectionOverlay *)self isAccessibilityElement];
    if (v5)
    {
      double v6 = 8.0;
      if (!self->_isOverView) {
        double v6 = 20.0;
      }
      if (a3 == 4)
      {
        objc_super v7 = self;
        uint64_t v8 = 1;
      }
      else
      {
        if (a3 != 3)
        {
          LOBYTE(v5) = 0;
          return v5;
        }
        objc_super v7 = self;
        uint64_t v8 = 0;
      }
      [(RCWaveformSelectionOverlay *)v7 _accessibilityIncreaseValue:v8 bySegment:v6];
      UIAccessibilityNotifications v9 = UIAccessibilityAnnouncementNotification;
      CGFloat v10 = [(RCWaveformSelectionOverlay *)self accessibilityValue];
      UIAccessibilityPostNotification(v9, v10);

      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)_accessibilityIncreaseValue:(BOOL)a3 bySegment:(double)a4
{
  BOOL v4 = a3;
  if (a4 == 0.0) {
    a4 = 20.0;
  }
  double v6 = self->_assetDuration / a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained waveformSelectionOverlayGetCurrentTime:self];
  double v10 = v9;

  double v11 = -v6;
  if (v4) {
    double v11 = v6;
  }
  double v12 = v11 + v10;
  if (v12 == self->_assetCurrentTime && v12 == self->_trackedAssetCurrentTime)
  {
    double assetDuration = v12;
  }
  else
  {
    double assetDuration = 0.0;
    if (v12 >= 0.0)
    {
      double assetDuration = v12;
      if (v12 > self->_assetDuration) {
        double assetDuration = self->_assetDuration;
      }
    }
  }
  id v14 = objc_loadWeakRetained((id *)p_delegate);
  [v14 waveformSelectionOverlay:self willChangeAssetCurrentTime:1 isTracking:assetDuration];
}

- (void)accessibilityIncrement
{
  if ([(RCWaveformSelectionOverlay *)self changeAXValue])
  {
    [(RCWaveformSelectionOverlay *)self axSegment];
    -[RCWaveformSelectionOverlay _accessibilityIncreaseValue:bySegment:](self, "_accessibilityIncreaseValue:bySegment:", 1);
  }
}

- (void)accessibilityDecrement
{
  if ([(RCWaveformSelectionOverlay *)self changeAXValue])
  {
    [(RCWaveformSelectionOverlay *)self axSegment];
    -[RCWaveformSelectionOverlay _accessibilityIncreaseValue:bySegment:](self, "_accessibilityIncreaseValue:bySegment:", 0);
  }
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(RCWaveformSelectionOverlay *)self _axIsShowingSelectionBars]
    || ([(RCWaveformSelectionOverlay *)self bounds], v13.x = x, v13.double y = y, !CGRectContainsPoint(v14, v13)))
  {
    v11.receiver = self;
    v11.super_class = (Class)RCWaveformSelectionOverlay;
    -[RCWaveformSelectionOverlay _accessibilityHitTest:withEvent:](&v11, "_accessibilityHitTest:withEvent:", v7, x, y);
    uint64_t v8 = (RCWaveformSelectionOverlay *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = self;
  }
  double v9 = v8;

  return v9;
}

- (RCWaveformSelectionOverlayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCWaveformSelectionOverlayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange
{
  double beginTime = self->_selectedTimeRange.beginTime;
  double endTime = self->_selectedTimeRange.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (double)selectedTimeRangeMinimumDuration
{
  return self->_selectedTimeRangeMinimumDuration;
}

- (void)setSelectedTimeRangeMinimumDuration:(double)a3
{
  self->_selectedTimeRangeMinimumDuration = a3;
}

- (double)selectedTimeRangeMaximumDuration
{
  return self->_selectedTimeRangeMaximumDuration;
}

- (void)setSelectedTimeRangeMaximumDuration:(double)a3
{
  self->_selectedTimeRangeMaximumDuration = a3;
}

- (double)assetCurrentTime
{
  return self->_assetCurrentTime;
}

- (double)assetDuration
{
  return self->_assetDuration;
}

- (CGRect)selectionRect
{
  double x = self->_selectionRect.origin.x;
  double y = self->_selectionRect.origin.y;
  double width = self->_selectionRect.size.width;
  double height = self->_selectionRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)axSegment
{
  return self->_axSegment;
}

- (void)setAxSegment:(double)a3
{
  self->_axSegment = a3;
}

- (BOOL)isEditingEnabled
{
  return self->_editingEnabled;
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (BOOL)insertMode
{
  return self->_insertMode;
}

- (BOOL)enablePlayBarTracking
{
  return self->_enablePlayBarTracking;
}

- (void)setEnablePlayBarTracking:(BOOL)a3
{
  self->_enablePlayBarTracking = a3;
}

- (BOOL)enableTimeTrackingInView
{
  return self->_enableTimeTrackingInView;
}

- (void)setEnableTimeTrackingInView:(BOOL)a3
{
  self->_enableTimeTrackingInView = a3;
}

- (BOOL)barMatchesKnobRadius
{
  return self->_barMatchesKnobRadius;
}

- (void)setBarMatchesKnobRadius:(BOOL)a3
{
  self->_barMatchesKnobRadius = a3;
}

- (BOOL)overviewTrimHandleStyle
{
  return self->_overviewTrimHandleStyle;
}

- (void)setOverviewTrimHandleStyle:(BOOL)a3
{
  self->_BOOL overviewTrimHandleStyle = a3;
}

- (double)knobWidthMultiplier
{
  return self->_knobWidthMultiplier;
}

- (void)setKnobWidthMultiplier:(double)a3
{
  self->_knobWidthMultiplier = a3;
}

- (double)playWidthMultiplier
{
  return self->_playWidthMultiplier;
}

- (void)setPlayWidthMultiplier:(double)a3
{
  self->_playWidthMultiplier = a3;
}

- (BOOL)playBarOnly
{
  return self->_playBarOnly;
}

- (void)setPlayBarOnly:(BOOL)a3
{
  self->_playBarOnldouble y = a3;
}

- (BOOL)isOverView
{
  return self->_isOverView;
}

- (void)setIsOverView:(BOOL)a3
{
  self->_isOverView = a3;
}

- (int64_t)selectionMode
{
  return self->_selectionMode;
}

- (UIView)selectionBackgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionBackgroundView);

  return (UIView *)WeakRetained;
}

- (void)setSelectionBackgroundView:(id)a3
{
}

- (double)trackedAssetCurrentTime
{
  return self->_trackedAssetCurrentTime;
}

- (UIButton)resetRegionButton
{
  return self->_resetRegionButton;
}

- (void)setResetRegionButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetRegionButton, 0);
  objc_destroyWeak((id *)&self->_selectionBackgroundView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trackedTouches, 0);
  objc_storeStrong((id *)&self->_compactCurrentTimeBar, 0);
  objc_storeStrong((id *)&self->_currentTimeBar, 0);
  objc_storeStrong((id *)&self->_corneredDimOverlayContainer, 0);
  objc_storeStrong((id *)&self->_middleSelectionOverlay, 0);
  objc_storeStrong((id *)&self->_endTimeSelection, 0);

  objc_storeStrong((id *)&self->_beginTimeSelection, 0);
}

@end