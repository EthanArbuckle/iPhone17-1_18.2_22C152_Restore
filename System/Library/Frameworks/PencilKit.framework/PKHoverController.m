@interface PKHoverController
- ($F30B99E357B462A7BBD676CBC61D9025)currentInputPoint;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)isInEdgeOfScreen:(BOOL)result;
- (BOOL)isInExteriorOfScreen:(BOOL)result;
- (double)adjustedZLimitFromLimit:(double)a3 inputPoint:;
- (double)currentMovementSpeed;
- (double)distanceFromEdgeOfScreen:(void *)a3 view:;
- (double)inputPointFilter:(id)a3 distanceToEdge:(id *)a4;
- (id).cxx_construct;
- (id)hoverDebugLayerColor;
- (id)hoverGestureRecognizer;
- (int64x2_t)initWithDelegate:(void *)a3 view:;
- (void)_endIntentionalHoverTracking;
- (void)_handleHoverInputPoint:(id *)a3;
- (void)_hoverGesture:(id)a3;
- (void)_sendDidUpdate:(id *)a3;
- (void)_sendDidUpdateNow:(id *)a3;
- (void)_setupHoverGestureRecognizerInView:(id)a3;
- (void)_setupPredictorForNewPoint:(BOOL)a3;
- (void)_trackIntentionalHover:(id *)a3;
- (void)_triggerHoldGestureIfNecessary;
- (void)_updateInputPointFilters;
- (void)alphaFactorFromMovementSpeed:(uint64_t)a1;
- (void)checkDidLiftAfterGestureEnd;
- (void)dealloc;
- (void)didReceiveNormalTouch:(uint64_t)a1;
- (void)hideLabel;
- (void)logInputPoint:(id *)a3;
- (void)pauseDisplayLink;
- (void)reset;
- (void)resetHoverHold;
- (void)setShouldGenerate120HzEvents:(uint64_t)a1;
- (void)showAttributedLabel:(double)a3 atLocation:(double)a4;
- (void)showLabel:(double)a3 atLocation:(double)a4;
- (void)startDisplayLink;
- (void)updateCurrentInputPointWithInputPoint:(id *)a3;
- (void)updateShapeLayer:(double *)a3 inputPoint:;
- (void)vsync;
@end

@implementation PKHoverController

- (id)hoverDebugLayerColor
{
  if (a1)
  {
    if (qword_1EB3C5FE0 != -1) {
      dispatch_once(&qword_1EB3C5FE0, &__block_literal_global_48);
    }
    a1 = (id)_MergedGlobals_138;
    uint64_t v1 = vars8;
  }
  return a1;
}

void __41__PKHoverController_hoverDebugLayerColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1618] redColor];
  uint64_t v0 = [v2 colorWithAlphaComponent:0.4];
  uint64_t v1 = (void *)_MergedGlobals_138;
  _MergedGlobals_138 = v0;
}

- ($F30B99E357B462A7BBD676CBC61D9025)currentInputPoint
{
  v4 = [*(id *)&self->_intentionalHoverStartTimestamp lastObject];
  id v6 = v4;
  if (v4)
  {
    [v4 currentFilteredPoint];
  }
  else
  {
    *(_OWORD *)&retstr->var11 = 0u;
    *(_OWORD *)&retstr->var13 = 0u;
    *(_OWORD *)&retstr->var7 = 0u;
    *(_OWORD *)&retstr->var9 = 0u;
    *(_OWORD *)&retstr->var3 = 0u;
    *(_OWORD *)&retstr->var5 = 0u;
    retstr->var0 = 0u;
    *(_OWORD *)&retstr->var1 = 0u;
  }

  return result;
}

- (void)updateCurrentInputPointWithInputPoint:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = *(id *)&self->_intentionalHoverStartTimestamp;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
        long long v10 = *(_OWORD *)&a3->var9;
        v22[4] = *(_OWORD *)&a3->var7;
        v22[5] = v10;
        long long v11 = *(_OWORD *)&a3->var13;
        v22[6] = *(_OWORD *)&a3->var11;
        v22[7] = v11;
        long long v12 = *(_OWORD *)&a3->var1;
        v22[0] = a3->var0;
        v22[1] = v12;
        long long v13 = *(_OWORD *)&a3->var5;
        v22[2] = *(_OWORD *)&a3->var3;
        v22[3] = v13;
        objc_msgSend(v9, "addInputPoint:", v22, *(_OWORD *)&v14, v15, v16, v17, v18, v19, v20, v21);
        if (v9)
        {
          [v9 currentFilteredPoint];
        }
        else
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          $047367E7237D93BB26E796C35D3A0ACE v14 = 0u;
          long long v15 = 0u;
        }
        *(_OWORD *)&a3->var7 = v18;
        *(_OWORD *)&a3->var9 = v19;
        *(_OWORD *)&a3->var11 = v20;
        *(_OWORD *)&a3->var13 = v21;
        a3->var0 = v14;
        *(_OWORD *)&a3->var1 = v15;
        ++v8;
        *(_OWORD *)&a3->var3 = v16;
        *(_OWORD *)&a3->var5 = v17;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  ++self->_gestureRecognizer;
}

- (int64x2_t)initWithDelegate:(void *)a3 view:
{
  v48[8] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v47.receiver = a1;
    v47.super_class = (Class)PKHoverController;
    uint64_t v7 = (id *)[(int64x2_t *)&v47 init];
    uint64_t v8 = v7;
    a1 = (int64x2_t *)v7;
    if (v7)
    {
      objc_storeWeak(v7 + 3, v6);
      objc_storeWeak(v8 + 54, v5);
      a1[14] = vdupq_n_s64(0x7FF8000000000000uLL);
      a1[15].i64[0] = 0x7FF8000000000000;
      a1[26].i8[8] = 0;
      a1[16].i64[0] = 0;
      a1->i16[4] = a1->i16[4] & 0xFFFE | objc_opt_respondsToSelector() & 1;
      if (objc_opt_respondsToSelector()) {
        __int16 v9 = 4;
      }
      else {
        __int16 v9 = 0;
      }
      a1->i16[4] = a1->i16[4] & 0xFFFB | v9;
      if (objc_opt_respondsToSelector()) {
        __int16 v10 = 2;
      }
      else {
        __int16 v10 = 0;
      }
      a1->i16[4] = a1->i16[4] & 0xFFFD | v10;
      if (objc_opt_respondsToSelector()) {
        __int16 v11 = 8;
      }
      else {
        __int16 v11 = 0;
      }
      a1->i16[4] = a1->i16[4] & 0xFFF7 | v11;
      if (objc_opt_respondsToSelector()) {
        __int16 v12 = 16;
      }
      else {
        __int16 v12 = 0;
      }
      a1->i16[4] = a1->i16[4] & 0xFFEF | v12;
      if (objc_opt_respondsToSelector()) {
        __int16 v13 = 32;
      }
      else {
        __int16 v13 = 0;
      }
      a1->i16[4] = a1->i16[4] & 0xFFDF | v13;
      if (objc_opt_respondsToSelector()) {
        __int16 v14 = 64;
      }
      else {
        __int16 v14 = 0;
      }
      a1->i16[4] = a1->i16[4] & 0xFFBF | v14;
      if (objc_opt_respondsToSelector()) {
        __int16 v15 = 128;
      }
      else {
        __int16 v15 = 0;
      }
      a1->i16[4] = a1->i16[4] & 0xFF7F | v15;
      if (objc_opt_respondsToSelector()) {
        __int16 v16 = 256;
      }
      else {
        __int16 v16 = 0;
      }
      a1->i16[4] = a1->i16[4] & 0xFEFF | v16;
      if (objc_opt_respondsToSelector()) {
        __int16 v17 = 512;
      }
      else {
        __int16 v17 = 0;
      }
      a1->i16[4] = a1->i16[4] & 0xFDFF | v17;
      [(int64x2_t *)a1 _setupHoverGestureRecognizerInView:v6];
      long long v18 = objc_alloc_init(PKInputPointAltitudeAndAzimuthNoiseFilter);
      long long v19 = (void *)a1[18].i64[1];
      a1[18].i64[1] = (uint64_t)v18;

      long long v20 = objc_alloc_init(PKInputPointWeightedAverageFilter);
      long long v21 = (void *)a1[18].i64[0];
      a1[18].i64[0] = (uint64_t)v20;

      v22 = objc_alloc_init(PKInputPointAltitudeAndAzimuthBucketingFilter);
      long long v23 = (void *)a1[19].i64[0];
      a1[19].i64[0] = (uint64_t)v22;

      long long v24 = objc_alloc_init(PKInputPointAltitudeAndAzimuthZLimitFilter);
      long long v25 = (void *)a1[19].i64[1];
      a1[19].i64[1] = (uint64_t)v24;

      long long v26 = v8[39];
      if (v26)
      {
        v26[20] = 0x400F6A7A2955385ELL;
        uint64_t v27 = a1[19].i64[1];
        if (v27) {
          *(void *)(v27 + 168) = 0;
        }
      }
      uint64_t v28 = objc_alloc_init(PKInputPointAltitudeAndAzimuthEdgeFilter);
      v29 = (void *)a1[20].i64[0];
      a1[20].i64[0] = (uint64_t)v28;

      v30 = (id *)v8[40];
      if (v30)
      {
        objc_storeWeak(v30 + 19, a1);
        uint64_t v31 = a1[20].i64[0];
        if (v31)
        {
          *(void *)(v31 + 168) = 0x400F6A7A2955385ELL;
          uint64_t v32 = a1[20].i64[0];
          if (v32) {
            *(void *)(v32 + 176) = 0;
          }
        }
      }
      v33 = objc_alloc_init(PKInputPointExtraLatencyFilter);
      v34 = (void *)a1[20].i64[1];
      a1[20].i64[1] = (uint64_t)v33;

      v35 = objc_alloc_init(PKInputPointReduceFramerateFilter);
      v36 = (void *)a1[21].i64[0];
      a1[21].i64[0] = (uint64_t)v35;

      v37 = objc_alloc_init(PKInputPointPredictionFilter);
      v38 = (void *)a1[21].i64[1];
      a1[21].i64[1] = (uint64_t)v37;

      uint64_t v39 = a1[18].i64[0];
      uint64_t v40 = a1[20].i64[0];
      uint64_t v41 = a1[20].i64[1];
      v48[0] = a1[18].i64[1];
      v48[1] = v40;
      uint64_t v42 = a1[19].i64[0];
      v48[2] = a1[19].i64[1];
      v48[3] = v39;
      v48[4] = v42;
      v48[5] = v41;
      id v43 = v8[43];
      v48[6] = a1[21].i64[0];
      v48[7] = v43;
      uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:8];
      v45 = (void *)a1[22].i64[0];
      a1[22].i64[0] = v44;

      [(int64x2_t *)a1 _updateInputPointFilters];
    }
  }

  return a1;
}

- (void)dealloc
{
  [(PKHoverController *)self pauseDisplayLink];
  [*(id *)&self->_useUpdateCycle invalidate];
  v3 = *(void **)&self->_useUpdateCycle;
  *(void *)&self->_useUpdateCycle = 0;

  v4.receiver = self;
  v4.super_class = (Class)PKHoverController;
  [(PKHoverController *)&v4 dealloc];
}

- (void)_setupHoverGestureRecognizerInView:(id)a3
{
  id v13 = a3;
  objc_super v4 = (NSTimer *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:self action:sel__hoverGesture_];
  eventGeneratorTimer = self->_eventGeneratorTimer;
  self->_eventGeneratorTimer = v4;

  id v6 = +[PKHoverSettings sharedSettings];
  char v7 = [v6 supportTouchPad];

  if ((v7 & 1) == 0) {
    [(NSTimer *)self->_eventGeneratorTimer setAllowedTouchTypes:&unk_1F200ECD0];
  }
  [v13 addGestureRecognizer:self->_eventGeneratorTimer];
  uint64_t v8 = +[PKPencilObserverGestureRecognizer pencilObserverWithDelegate:]((uint64_t)PKPencilObserverGestureRecognizer, self);
  [v13 addGestureRecognizer:v8];
  LOBYTE(self->_view) = (uint64_t)self->_view & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v9 = 2;
  }
  else {
    char v9 = 0;
  }
  LOBYTE(self->_view) = (uint64_t)self->_view & 0xFD | v9;
  if (objc_opt_respondsToSelector()) {
    char v10 = 4;
  }
  else {
    char v10 = 0;
  }
  LOBYTE(self->_view) = (uint64_t)self->_view & 0xFB | v10;
  if (objc_opt_respondsToSelector()) {
    char v11 = 8;
  }
  else {
    char v11 = 0;
  }
  LOBYTE(self->_view) = (uint64_t)self->_view & 0xF7 | v11;
  if (objc_opt_respondsToSelector()) {
    char v12 = 16;
  }
  else {
    char v12 = 0;
  }
  LOBYTE(self->_view) = (uint64_t)self->_view & 0xEF | v12;
}

- (id)hoverGestureRecognizer
{
  if (a1)
  {
    a1 = (id *)a1[33];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setShouldGenerate120HzEvents:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 429) != a2)
    {
      *(unsigned char *)(a1 + 429) = a2;
      if (a2)
      {
        *(unsigned char *)(a1 + 408) = 0;
        if (_UIUpdateCycleEnabled()) {
          *(unsigned char *)(a1 + 408) = 1;
        }
        if (!*(void *)(a1 + 400) && !*(unsigned char *)(a1 + 408))
        {
          char v7 = objc_alloc_init(PKHoverControllerDisplayLinkDelegate);
          [(PKHoverControllerDisplayLinkDelegate *)v7 setController:a1];
          uint64_t v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v7 selector:sel_display_];
          objc_super v4 = *(void **)(a1 + 400);
          *(void *)(a1 + 400) = v3;

          CAFrameRateRange v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
          objc_msgSend(*(id *)(a1 + 400), "setPreferredFrameRateRange:", *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
          [*(id *)(a1 + 400) setHighFrameRateReason:1507329];
          [*(id *)(a1 + 400) setPaused:1];
          id v5 = *(void **)(a1 + 400);
          id v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
          [v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];
        }
      }
    }
  }
}

- (void)vsync
{
  kdebug_trace();
  if (BYTE5(self->_delegate))
  {
    if (LOBYTE(self->_updateCycleItem))
    {
      if (!LOBYTE(self->_timestampForLatestGestureUpdate))
      {
        if (LOBYTE(self->_waitingForHoverHoldTimestamp))
        {
          [(PKHoverController *)self _setupPredictorForNewPoint:0];
          [(PKHoverController *)self currentInputPoint];
          [(PKHoverController *)self _sendDidUpdate:v4];
        }
      }
      LOBYTE(self->_timestampForLatestGestureUpdate) = 0;
    }
    else if (LOBYTE(self->_timestampForLatestGestureUpdate) {
           && LOBYTE(self->_waitingForHoverHoldTimestamp)
    }
           && CACurrentMediaTime() - *(double *)&self->_displayLink > 0.00208333333)
    {
      LOBYTE(self->_timestampForLatestGestureUpdate) = 0;
      [(PKHoverController *)self _setupPredictorForNewPoint:0];
      [(PKHoverController *)self currentInputPoint];
      [(PKHoverController *)self _sendDidUpdate:&v3];
    }
  }
}

- (void)_updateInputPointFilters
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v3 = *(id *)&self->_intentionalHoverStartTimestamp;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v61 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v8 = +[PKHoverSettings sharedSettings];
        [v8 maxZDistance];
        if (v7) {
          *(void *)(v7 + 8) = v9;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v4);
  }

  char v10 = +[PKHoverSettings sharedSettings];
  [v10 weightedAverageLocationFactor];
  altitudeAndAzimuthNoiseFilter = self->_altitudeAndAzimuthNoiseFilter;
  if (altitudeAndAzimuthNoiseFilter) {
    *(void *)&altitudeAndAzimuthNoiseFilter->generator.__x_ = v11;
  }

  id v13 = +[PKHoverSettings sharedSettings];
  [v13 weightedAverageLocationFactor];
  __int16 v15 = self->_altitudeAndAzimuthNoiseFilter;
  if (v15) {
    v15->currentAzimuthOffsetValue = v14;
  }

  __int16 v16 = +[PKHoverSettings sharedSettings];
  [v16 weightedAverageAltitudeFactor];
  long long v18 = self->_altitudeAndAzimuthNoiseFilter;
  if (v18) {
    v18->currentAltitudeOffsetValue = v17;
  }

  long long v19 = +[PKHoverSettings sharedSettings];
  [v19 weightedAverageAzimuthFactor];
  long long v21 = self->_altitudeAndAzimuthNoiseFilter;
  if (v21) {
    *(void *)&v21->_noiseIsHeightBased = v20;
  }

  v22 = +[PKHoverSettings sharedSettings];
  char v23 = [v22 noiseIsHeightBased];
  altitudeAndAzimuthBucketingFilter = self->_altitudeAndAzimuthBucketingFilter;
  if (altitudeAndAzimuthBucketingFilter) {
    LOBYTE(altitudeAndAzimuthBucketingFilter[1].super._maxZDistance) = v23;
  }

  long long v25 = +[PKHoverSettings sharedSettings];
  [v25 altitudeJitterNoise];
  uint64_t v27 = self->_altitudeAndAzimuthBucketingFilter;
  if (v27) {
    v27[1].super._numInputPoints = v26;
  }

  uint64_t v28 = +[PKHoverSettings sharedSettings];
  [v28 azimuthJitterNoise];
  v30 = self->_altitudeAndAzimuthBucketingFilter;
  if (v30) {
    v30[1].super._filteredPoint.var0.point.x = v29;
  }

  uint64_t v31 = +[PKHoverSettings sharedSettings];
  [v31 altitudeOffsetNoise];
  v33 = self->_altitudeAndAzimuthBucketingFilter;
  if (v33 && v33[1].super._filteredPoint.var0.point.y != v32)
  {
    v33[1].super._filteredPoint.var0.point.y = v32;
    [(PKInputPointAltitudeAndAzimuthBucketingFilter *)v33 _recalculateOffsets];
  }

  v34 = +[PKHoverSettings sharedSettings];
  [v34 azimuthOffsetNoise];
  v36 = self->_altitudeAndAzimuthBucketingFilter;
  if (v36 && v36[1].super._filteredPoint.force != v35)
  {
    v36[1].super._filteredPoint.force = v35;
    [(PKInputPointAltitudeAndAzimuthBucketingFilter *)v36 _recalculateOffsets];
  }

  v37 = +[PKHoverSettings sharedSettings];
  int v38 = [v37 altitudeBuckets];
  altitudeAndAzimuthZLimitFilter = self->_altitudeAndAzimuthZLimitFilter;
  if (altitudeAndAzimuthZLimitFilter) {
    *(void *)&altitudeAndAzimuthZLimitFilter->_lastKnownAzimuth = v38;
  }

  uint64_t v40 = +[PKHoverSettings sharedSettings];
  int v41 = [v40 azimuthBuckets];
  uint64_t v42 = self->_altitudeAndAzimuthZLimitFilter;
  if (v42) {
    *(void *)&v42->_altitudeAndAzimuthZLimit = v41;
  }

  id v43 = +[PKHoverSettings sharedSettings];
  [v43 toolPreviewAzimuthTiltMaxZDistance];
  altitudeAndAzimuthEdgeFilter = self->_altitudeAndAzimuthEdgeFilter;
  if (altitudeAndAzimuthEdgeFilter) {
    altitudeAndAzimuthEdgeFilter->_delegate = v44;
  }

  if (-[PKHoverController pointsPerMillimeter]::onceToken != -1) {
    dispatch_once(&-[PKHoverController pointsPerMillimeter]::onceToken, &__block_literal_global_76);
  }
  double v46 = *(double *)&-[PKHoverController pointsPerMillimeter]::nativePointsPerMillimeter;
  objc_super v47 = +[PKHoverSettings sharedSettings];
  [v47 screenEdgeSizeInMillimeters];
  extraLatencyFilter = self->_extraLatencyFilter;
  if (extraLatencyFilter) {
    *(double *)&extraLatencyFilter->_inputPoints.__end_ = v46 * v48;
  }

  v50 = +[PKHoverSettings sharedSettings];
  uint64_t v51 = [v50 numFramesExtraLatency];
  reduceFramerateFilter = self->_reduceFramerateFilter;
  if (reduceFramerateFilter) {
    *(void *)&reduceFramerateFilter[1].super._maxZDistance = v51;
  }

  v53 = +[PKHoverSettings sharedSettings];
  uint64_t v54 = [v53 numFramesReduceFramerate];
  predictionFilter = self->_predictionFilter;
  if (predictionFilter) {
    *(void *)&predictionFilter->_fullPredictionTimeIntervalPoint.var0.point.x = v54;
  }

  if (isPencilGesture((UIHoverGestureRecognizer *)self->_eventGeneratorTimer))
  {
    v56 = +[PKHoverSettings sharedSettings];
    [v56 predictionTimeInterval];
    allInputPointFilters = self->_allInputPointFilters;
    if (allInputPointFilters) {
      allInputPointFilters[53].super.isa = v57;
    }
  }
  else
  {
    v59 = self->_allInputPointFilters;
    if (v59) {
      v59[53].super.isa = 0;
    }
  }
}

- (void)_hoverGesture:(id)a3
{
  id v4 = a3;
  BYTE1(self->_delegate) = 1;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_checkDidLiftAfterGestureEnd object:0];
  if ([v4 state] == 1 || objc_msgSend(v4, "state") == 2)
  {
    if ([v4 state] == 1)
    {
      if ((*(_WORD *)&self->_delegateFlags & 0x100) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_currentLabel);
        [WeakRetained hoverControllerGestureBegan:self];
      }
      [(PKHoverController *)self _updateInputPointFilters];
      if (*(double *)&self[1].super.isa > 0.0)
      {
        objc_initWeak(&location, self);
        Class isa = self[1].super.isa;
        uint64_t v7 = (void *)MEMORY[0x1E4F1CB00];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __35__PKHoverController__hoverGesture___block_invoke;
        v56[3] = &unk_1E64C8BE0;
        objc_copyWeak(v58, &location);
        id v57 = v4;
        v58[1] = isa;
        uint64_t v8 = [v7 scheduledTimerWithTimeInterval:1 repeats:v56 block:*(double *)&isa];
        double previousRollValue = self->_previousRollValue;
        *(void *)&self->_double previousRollValue = v8;

        objc_destroyWeak(v58);
        objc_destroyWeak(&location);
      }
    }
    id v10 = objc_loadWeakRetained((id *)&self->_inputPoints.__begin_);
    [v4 _preciseLocationInView:v10];
    uint64_t v12 = v11;
    uint64_t v14 = v13;

    if (((uint64_t)self->_view & 8) != 0)
    {
      [v4 zOffset];
      double v18 = v17;
      +[PKHoverSettings maxHoverHeight];
      double v15 = v18 * v19;
      if (((uint64_t)self->_view & 4) == 0) {
        goto LABEL_10;
      }
    }
    else
    {
      double v15 = 5.0;
      if (((uint64_t)self->_view & 4) == 0)
      {
LABEL_10:
        double v16 = CACurrentMediaTime();
LABEL_13:
        double v20 = v16;
        long long v21 = +[PKHoverSettings sharedSettings];
        int v22 = [v21 supportTouchPad];
        if (v15 == 0.0) {
          int v23 = v22;
        }
        else {
          int v23 = 0;
        }

        double v24 = v15;
        if (v23 == 1)
        {
          long long v25 = +[PKHoverSettings sharedSettings];
          [v25 toolPreviewMaxZDistance];
          double v24 = v26 * 0.5;
        }
        uint64_t v27 = 0;
        if (+[PKHoverSettings isHoverActive]
          && ((uint64_t)self->_view & 2) != 0)
        {
          [v4 altitudeAngle];
          if ((*(void *)&v28 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
          {
            if (v15 > 0.0 && v28 < 1.5 || v15 > 2.0 && fabs(v28 + -1.57079633) >= 0.00999999978) {
              BYTE2(self->_delegate) = 1;
            }
            double v30 = 1.57079633 - v28;
            if (v30 >= 0.0)
            {
              uint64_t v27 = *(void *)&v30;
              if (v30 > 1.57079633) {
                uint64_t v27 = 0x3FF921FB54442D18;
              }
            }
          }
        }
        uint64_t v31 = 0;
        double v32 = 0.0;
        if (+[PKHoverSettings isHoverActive])
        {
          double v32 = 3.92699082;
          if ((uint64_t)self->_view)
          {
            v33 = [v4 view];
            [v4 azimuthAngleInView:v33];
            double v35 = v34;

            if ((*(void *)&v35 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
            {
              double v36 = v35 + -3.14159265;
              double v37 = fmod(v36, 6.28318531);
              if (v36 <= 6.28318531 && v36 >= 0.0) {
                double v37 = v36;
              }
              if (v37 < 0.0) {
                double v37 = v37 + 6.28318531;
              }
              if (v37 == 0.0) {
                double v32 = 0.0;
              }
              else {
                double v32 = v37;
              }
            }
          }
        }
        if (((uint64_t)self->_view & 0x10) != 0)
        {
          [v4 _rollAngle];
          uint64_t v31 = v39;
        }
        if (v24 < 100.0)
        {
          v48[0] = v12;
          v48[1] = v14;
          v48[2] = 0x3FF0000000000000;
          *(double *)&v48[3] = v32;
          v48[4] = v27;
          long long v49 = unk_1C482BFA8;
          double v50 = v24;
          double v51 = v20;
          long long v52 = unk_1C482BFC8;
          long long v53 = unk_1C482BFD8;
          uint64_t v54 = v31;
          long long v55 = unk_1C482BFF0;
          [(PKHoverController *)self _trackIntentionalHover:v48];
          LOBYTE(self->_timestampForLatestGestureUpdate) = 1;
          *(CFTimeInterval *)&self->_displayLink = CACurrentMediaTime();
          [(PKHoverController *)self _setupPredictorForNewPoint:1];
          v40[0] = v12;
          v40[1] = v14;
          v40[2] = 0x3FF0000000000000;
          *(double *)&v40[3] = v32;
          v40[4] = v27;
          long long v41 = unk_1C482BFA8;
          double v42 = v24;
          double v43 = v20;
          long long v44 = unk_1C482BFC8;
          long long v45 = unk_1C482BFD8;
          uint64_t v46 = v31;
          long long v47 = unk_1C482BFF0;
          [(PKHoverController *)self _handleHoverInputPoint:v40];
        }
        goto LABEL_51;
      }
    }
    [v4 _hoverTouchTimestamp];
    goto LABEL_13;
  }
  if ([v4 state] == 3)
  {
    if ((*(_WORD *)&self->_delegateFlags & 0x200) != 0)
    {
      id v29 = objc_loadWeakRetained((id *)&self->_currentLabel);
      [v29 hoverControllerGestureEnded:self];
    }
    [(PKHoverController *)self performSelector:sel_checkDidLiftAfterGestureEnd withObject:0 afterDelay:0.0666666667];
  }
  -[PKHoverController reset]((uint64_t)self);
LABEL_51:
}

void __35__PKHoverController__hoverGesture___block_invoke(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained
    && ([*(id *)(a1 + 32) state] == 2 || objc_msgSend(*(id *)(a1 + 32), "state") == 1)
    && CACurrentMediaTime() - *((double *)WeakRetained + 9) > *(double *)(a1 + 48))
  {
    if ([*(id *)(a1 + 32) state] == 1) {
      [*(id *)(a1 + 32) setState:2];
    }
    if (*((void *)WeakRetained + 5) == *((void *)WeakRetained + 4)) {
      id v3 = WeakRetained + 96;
    }
    else {
      id v3 = (_OWORD *)*((void *)WeakRetained + 4);
    }
    long long v4 = v3[2];
    long long v5 = v3[3];
    long long v6 = v3[1];
    v10[0] = *v3;
    v10[1] = v6;
    long long v7 = v3[7];
    long long v9 = v3[4];
    long long v8 = v3[5];
    v10[6] = v3[6];
    v10[7] = v7;
    v10[4] = v9;
    v10[5] = v8;
    v10[2] = v4;
    v10[3] = v5;
    [WeakRetained _handleHoverInputPoint:v10];
  }
}

- (void)reset
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[PKHoverController resetHoverHold](a1);
    if (*(unsigned char *)(a1 + 56) && (*(_WORD *)(a1 + 8) & 4) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 432));
      [WeakRetained hoverControllerDidEnd:a1];
    }
    *(unsigned char *)(a1 + 384) = 0;
    *(void *)(a1 + 392) = 0;
    [(id)a1 pauseDisplayLink];
    *(void *)(a1 + 256) = 0;
    *(unsigned char *)(a1 + 56) = 0;
    *(void *)(a1 + 88) = 0;
    std::vector<PKInputPoint>::resize(a1 + 32, 0);
    [*(id *)(a1 + 272) invalidate];
    id v3 = *(void **)(a1 + 272);
    *(void *)(a1 + 272) = 0;

    [(id)a1 _endIntentionalHoverTracking];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v4 = *(id *)(a1 + 352);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "resetFilter", (void)v8);
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)checkDidLiftAfterGestureEnd
{
  if ((*(_WORD *)&self->_delegateFlags & 8) != 0 && !LOBYTE(self->_waitingForHoverHoldTimestamp))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentLabel);
    [WeakRetained hoverControllerDidLift:self];
  }
}

- (void)didReceiveNormalTouch:(uint64_t)a1
{
  id v16 = a2;
  if (a1)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:sel_checkDidLiftAfterGestureEnd object:0];
    if (v16)
    {
      if ([v16 type] != 2) {
        goto LABEL_28;
      }
      if ([v16 type] == 2)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
        [v16 azimuthAngleInView:WeakRetained];
        double v5 = v4;

        if ((*(void *)&v5 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
        {
          double v7 = v5 + -3.14159265;
          double v6 = fmod(v7, 6.28318531);
          if (v7 <= 6.28318531 && v7 >= 0.0) {
            double v6 = v7;
          }
          if (v6 < 0.0) {
            double v6 = v6 + 6.28318531;
          }
          if (v6 == 0.0) {
            double v6 = 0.0;
          }
          uint64_t v9 = *(void *)(a1 + 312);
          if (v9) {
            *(double *)(v9 + 160) = v6;
          }
          uint64_t v10 = *(void *)(a1 + 320);
          if (v10) {
            *(double *)(v10 + 168) = v6;
          }
        }
        objc_msgSend(v16, "altitudeAngle", v6);
        if ((*(void *)&v11 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
        {
          double v12 = 1.57079633 - v11;
          uint64_t v13 = 0;
          if (v12 >= 0.0)
          {
            uint64_t v13 = *(void *)&v12;
            if (v12 > 1.57079633) {
              uint64_t v13 = 0x3FF921FB54442D18;
            }
          }
          uint64_t v14 = *(void *)(a1 + 312);
          if (v14) {
            *(void *)(v14 + 168) = v13;
          }
          uint64_t v15 = *(void *)(a1 + 320);
          if (v15) {
            *(void *)(v15 + 176) = v13;
          }
        }
      }
    }
    -[PKHoverController reset](a1);
  }
LABEL_28:
}

- (void)resetHoverHold
{
  if (a1)
  {
    *(unsigned char *)(a1 + 58) = 0;
    if (*(unsigned char *)(a1 + 57))
    {
      if ((*(_WORD *)(a1 + 8) & 0x20) == 0
        || (id WeakRetained = objc_loadWeakRetained((id *)(a1 + 432)),
            [WeakRetained hoverControllerHoldGestureEnded:a1],
            WeakRetained,
            *(unsigned char *)(a1 + 57)))
      {
        *(CFTimeInterval *)(a1 + 80) = CACurrentMediaTime();
        *(unsigned char *)(a1 + 57) = 0;
      }
    }
  }
}

- (void)startDisplayLink
{
  if (!LOBYTE(self->_updateCycleItem)) {
    goto LABEL_4;
  }
  if (!*(void *)&self->_shouldShowHoverDebugLayer)
  {
    _UIUpdateRequestActivate();
    objc_initWeak(&location, self);
    uint64_t v3 = MEMORY[0x1E4F143A8];
    uint64_t v4 = 3221225472;
    double v5 = __37__PKHoverController_startDisplayLink__block_invoke;
    double v6 = &unk_1E64C6370;
    objc_copyWeak(&v7, &location);
    *(void *)&self->_shouldShowHoverDebugLayer = _UIUpdateSequenceInsertItem();
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
    if (!LOBYTE(self->_updateCycleItem)) {
LABEL_4:
    }
      objc_msgSend(*(id *)&self->_useUpdateCycle, "setPaused:", 0, v3, v4, v5, v6);
  }
}

void __37__PKHoverController_startDisplayLink__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained vsync];
}

- (void)pauseDisplayLink
{
  if (*(void *)&self->_shouldShowHoverDebugLayer)
  {
    _UIUpdateRequestDeactivate();
    _UIUpdateSequenceRemoveItem();
    *(void *)&self->_shouldShowHoverDebugLayer = 0;
  }
  if (!LOBYTE(self->_updateCycleItem))
  {
    uint64_t v3 = *(void **)&self->_useUpdateCycle;
    [v3 setPaused:1];
  }
}

- (void)updateShapeLayer:(double *)a3 inputPoint:
{
  id v12 = a2;
  if (!a1) {
    goto LABEL_9;
  }
  double v5 = +[PKHoverSettings sharedSettings];
  uint64_t v6 = [v5 debugCursorType];

  switch(v6)
  {
    case 0:
      double v9 = 8.0;
LABEL_8:
      objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", *a3 - v9 * 0.5, a3[1] - v9 * 0.5, v9, v9);
      id v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPath:", objc_msgSend(v10, "CGPath"));

      -[PKHoverController hoverDebugLayerColor](a1);
      id v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setStrokeColor:", objc_msgSend(v11, "CGColor"));

      [v12 setLineWidth:1.0];
      break;
    case 1:
      double v9 = a3[7] + a3[7];
      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", *a3 + -0.5, a3[1] + -8.0, 1.0, 16.0);
      id v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPath:", objc_msgSend(v7, "CGPath"));

      -[PKHoverController hoverDebugLayerColor](a1);
      id v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setStrokeColor:", objc_msgSend(v8, "CGColor"));

      [v12 setLineWidth:1.0];
      break;
  }
LABEL_9:
}

- (void)_triggerHoldGestureIfNecessary
{
  end = self->_inputPoints.__end_;
  value = self->_inputPoints.__end_cap_.__value_;
  uint64_t v4 = value - end;
  if (value == end || (*(_WORD *)&self->_delegateFlags & 0x10) == 0) {
    return;
  }
  if (!BYTE1(self->_waitingForHoverHoldTimestamp)) {
    goto LABEL_11;
  }
  double v6 = sqrt((self->_latestHoldZPosition - *((double *)end + 1)) * (self->_latestHoldZPosition - *((double *)end + 1))+ (self->_latestHoldLocation.y - *(double *)end) * (self->_latestHoldLocation.y - *(double *)end));
  double v7 = *(double *)&self->_hoverLabelView - *((double *)end + 7);
  if (v7 < 0.0) {
    double v7 = -v7;
  }
  BOOL v8 = v6 < 8.0 && v7 < 2.0;
  if (!v8)
  {
    -[PKHoverController resetHoverHold]((uint64_t)self);
LABEL_11:
    CFTimeInterval v9 = CACurrentMediaTime();
    if (self->_latestInputPointSentTimestamp + 1.0 <= v9)
    {
      uint64_t v10 = v4 >> 7;
      double v11 = *MEMORY[0x1E4F1DAD8];
      double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      uint64_t v14 = self->_inputPoints.__end_;
      uint64_t v13 = self->_inputPoints.__end_cap_.__value_;
      if (v14 == v13)
      {
        double v22 = v11 / (double)(unint64_t)v10;
        double v23 = v12 / (double)(unint64_t)v10;
        uint64_t v21 = 0;
        double v26 = 0.0 / (double)(unint64_t)v10;
        double v25 = v26;
        double v24 = 0.0;
      }
      else
      {
        double v15 = 0.0;
        double v16 = 0.0;
        double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        double v18 = self->_inputPoints.__end_;
        double v19 = *MEMORY[0x1E4F1DAD8];
        do
        {
          double v20 = v18;
          double v19 = v19 + *(double *)v18;
          double v17 = v17 + *((double *)v18 + 1);
          double v16 = v16 + *((double *)v18 + 7);
          double v15 = v15 + *((double *)v18 + 8);
          double v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v18 + 128);
        }
        while (v18 != v13);
        uint64_t v21 = *((void *)v20 + 4);
        double v22 = v19 / (double)(unint64_t)v10;
        double v23 = v17 / (double)(unint64_t)v10;
        double v24 = 0.0;
        double v25 = v16 / (double)(unint64_t)v10;
        do
        {
          double v11 = v11 + (*(double *)v14 - v22) * (*(double *)v14 - v22);
          double v12 = v12 + (*((double *)v14 + 1) - v23) * (*((double *)v14 + 1) - v23);
          double v24 = v24 + (*((double *)v14 + 7) - v25) * (*((double *)v14 + 7) - v25);
          uint64_t v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v14 + 128);
        }
        while (v14 != v13);
        double v26 = v15 / (double)(unint64_t)v10;
      }
      double v27 = sqrt(v12 + v11);
      double v28 = sqrt(v24);
      BOOL v8 = v27 < 4.0;
      double v29 = 1.0;
      if (v8 && v28 < 1.0)
      {
        if (!BYTE1(self->_waitingForHoverHoldTimestamp) && !BYTE2(self->_waitingForHoverHoldTimestamp))
        {
          double v29 = *((double *)v13 - 8);
          self->_latestInputPointTimestamp = v29;
          BYTE2(self->_waitingForHoverHoldTimestamp) = 1;
        }
        int v31 = BYTE3(self->_delegate);
        double v32 = +[PKHoverSettings sharedSettings];
        v33 = v32;
        if (v31) {
          [v32 hoverAndHoldActionTimeInterval];
        }
        else {
          [v32 hoverAndHoldTriggerTimeInterval];
        }
        double v35 = v34;

        if (!BYTE1(self->_waitingForHoverHoldTimestamp)
          && BYTE2(self->_waitingForHoverHoldTimestamp)
          && v9 - self->_latestInputPointTimestamp > v35)
        {
          *(_WORD *)((char *)&self->_waitingForHoverHoldTimestamp + 1) = 1;
          self->_latestInputPointSentTimestamp = v9;
          self->_latestHoldLocation.y = v22;
          self->_latestHoldZPosition = v23;
          *(double *)&self->_hoverLabelView = v25;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_currentLabel);
          *(double *)long long v45 = v22;
          *(double *)&v45[1] = v23;
          v45[2] = 0;
          v45[3] = v21;
          v45[4] = v21;
          long long v46 = unk_1C482BFA8;
          double v47 = v25;
          double v48 = v26;
          long long v49 = unk_1C482BFC8;
          long long v50 = unk_1C482BFD8;
          long long v51 = unk_1C482BFE8;
          uint64_t v52 = 0;
          double v37 = self->_inputPoints.__end_;
          long long v38 = *(_OWORD *)v37;
          long long v39 = *((_OWORD *)v37 + 1);
          long long v40 = *((_OWORD *)v37 + 3);
          v44[2] = *((_OWORD *)v37 + 2);
          v44[3] = v40;
          v44[0] = v38;
          v44[1] = v39;
          long long v41 = *((_OWORD *)v37 + 4);
          long long v42 = *((_OWORD *)v37 + 5);
          long long v43 = *((_OWORD *)v37 + 7);
          v44[6] = *((_OWORD *)v37 + 6);
          v44[7] = v43;
          v44[4] = v41;
          v44[5] = v42;
          [WeakRetained hoverController:self holdGestureMeanInputPoint:v45 latestInputPoint:v44];
        }
      }
      else
      {
        BYTE2(self->_waitingForHoverHoldTimestamp) = 0;
      }
    }
  }
}

- (void)_endIntentionalHoverTracking
{
  self->_intentionalHoverMinZValue = 0.0;
  self->_intentionalHoverMaxZValue = 0.0;
  *(void *)&self->_didReceiveNewPointToPredict = 0;
}

- (void)_trackIntentionalHover:(id *)a3
{
  if ((*(_WORD *)&self->_delegateFlags & 0x40) != 0)
  {
    if (self->_intentionalHoverMinZValue == 0.0)
    {
      self->_intentionalHoverMinZValue = a3->var7;
      self->_double intentionalHoverMaxZValue = a3->var6;
      *(double *)&self->_didReceiveNewPointToPredict = a3->var6;
    }
    else
    {
      double var6 = a3->var6;
      double intentionalHoverMaxZValue = self->_intentionalHoverMaxZValue;
      if (intentionalHoverMaxZValue >= var6) {
        double intentionalHoverMaxZValue = a3->var6;
      }
      if (*(double *)&self->_didReceiveNewPointToPredict >= var6) {
        double var6 = *(double *)&self->_didReceiveNewPointToPredict;
      }
      if (var6 - intentionalHoverMaxZValue <= 0.5)
      {
        self->_double intentionalHoverMaxZValue = intentionalHoverMaxZValue;
        *(double *)&self->_didReceiveNewPointToPredict = var6;
      }
      else
      {
        double v6 = CACurrentMediaTime() - self->_intentionalHoverMinZValue;
        if (v6 > 0.5)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_currentLabel);
          [WeakRetained hoverController:self intentionalHoverWithDuration:v6];
        }
        [(PKHoverController *)self _endIntentionalHoverTracking];
      }
    }
  }
}

- (void)_setupPredictorForNewPoint:(BOOL)a3
{
  allInputPointFilters = self->_allInputPointFilters;
  if (allInputPointFilters)
  {
    BOOL v4 = BYTE5(self->_delegate) && a3;
    LOBYTE(allInputPointFilters[52].super.isa) = v4;
    if (allInputPointFilters[2].super.isa)
    {
      if (LOBYTE(allInputPointFilters[52].super.isa)) {
        double v5 = &OBJC_IVAR___PKInputPointPredictionFilter__halfPredictionTimeIntervalPoint;
      }
      else {
        double v5 = &OBJC_IVAR___PKInputPointPredictionFilter__fullPredictionTimeIntervalPoint;
      }
      memmove(&allInputPointFilters[3], (char *)allInputPointFilters + *v5, 0x80uLL);
    }
  }
}

- (void)_handleHoverInputPoint:(id *)a3
{
  if (self && BYTE4(self->_delegate))
  {
    long long v5 = *(_OWORD *)&a3->var9;
    v86[4] = *(_OWORD *)&a3->var7;
    v86[5] = v5;
    long long v6 = *(_OWORD *)&a3->var13;
    v86[6] = *(_OWORD *)&a3->var11;
    v86[7] = v6;
    long long v7 = *(_OWORD *)&a3->var1;
    v86[0] = a3->var0;
    v86[1] = v7;
    long long v8 = *(_OWORD *)&a3->var5;
    v86[2] = *(_OWORD *)&a3->var3;
    v86[3] = v8;
    [(PKHoverController *)self logInputPoint:v86];
  }
  if ((*(_WORD *)&self->_delegateFlags & 0x80) != 0)
  {
    double x = a3->var0.var0.x;
    double y = a3->var0.var0.y;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentLabel);
    char v12 = objc_msgSend(WeakRetained, "hoverController:shouldBeActiveAt:", self, x, y);

    if ((v12 & 1) == 0)
    {
      if (!LOBYTE(self->_waitingForHoverHoldTimestamp)) {
        return;
      }
      std::vector<PKInputPoint>::resize((uint64_t)&self->_inputPoints.__end_, 0);
      LOBYTE(self->_waitingForHoverHoldTimestamp) = 0;
      if ((*(_WORD *)&self->_delegateFlags & 4) != 0)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_currentLabel);
        [v13 hoverControllerDidEnd:self];
      }
    }
  }
  $047367E7237D93BB26E796C35D3A0ACE var0 = a3->var0;
  long long v15 = *(_OWORD *)&a3->var1;
  long long v16 = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_cachedLatestInputPoint.velocitdouble y = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->_cachedLatestInputPoint.zPosition = v16;
  *($047367E7237D93BB26E796C35D3A0ACE *)&self->_cachedLatestInputPoint.var0.location.double y = var0;
  *(_OWORD *)&self->_cachedLatestInputPoint.azimuth = v15;
  long long v17 = *(_OWORD *)&a3->var7;
  long long v18 = *(_OWORD *)&a3->var9;
  long long v19 = *(_OWORD *)&a3->var13;
  *(_OWORD *)&self->_cachedLatestInputPoint.rollAngle = *(_OWORD *)&a3->var11;
  *(_OWORD *)&self->_cachedLatestInputPoint.estimatedActiveInputPropertiesExpectingUpdates = v19;
  *(_OWORD *)&self->_cachedLatestInputPoint.predicted = v17;
  *(_OWORD *)&self->_cachedLatestInputPoint.length = v18;
  double var6 = a3->var6;
  uint64_t v21 = +[PKHoverSettings sharedSettings];
  [v21 maxZDistance];
  double v23 = v22;
  double v24 = +[PKHoverSettings sharedSettings];
  [v24 deactivateExtraDistance];
  long long v26 = *(_OWORD *)&a3->var9;
  v85[4] = *(_OWORD *)&a3->var7;
  v85[5] = v26;
  long long v27 = *(_OWORD *)&a3->var13;
  v85[6] = *(_OWORD *)&a3->var11;
  v85[7] = v27;
  long long v28 = *(_OWORD *)&a3->var1;
  v85[0] = a3->var0;
  v85[1] = v28;
  long long v29 = *(_OWORD *)&a3->var5;
  v85[2] = *(_OWORD *)&a3->var3;
  v85[3] = v29;
  double v30 = -[PKHoverController adjustedZLimitFromLimit:inputPoint:]((uint64_t)self, v85, v23 + v25);

  if (var6 <= v30)
  {
    BOOL v31 = 0;
    int v32 = 0;
    if (var6 != 0.0) {
      goto LABEL_14;
    }
  }
  else
  {
    BOOL v31 = self->_inputPoints.__end_cap_.__value_ != self->_inputPoints.__end_;
    double var6 = 0.0;
  }
  if (!LOBYTE(self->_waitingForHoverHoldTimestamp)) {
    return;
  }
  int v32 = 1;
LABEL_14:
  a3->double var6 = var6;
  double v33 = CACurrentMediaTime();
  unint64_t v34 = *(void *)&self->_activeInputPoint;
  self->_latestHoldTimestamp = v33;
  end = self->_inputPoints.__end_;
  value = self->_inputPoints.__end_cap_.__value_;
  if ((unint64_t)value < v34)
  {
    if (end == value)
    {
      $047367E7237D93BB26E796C35D3A0ACE v58 = a3->var0;
      long long v59 = *(_OWORD *)&a3->var1;
      long long v60 = *(_OWORD *)&a3->var5;
      *((_OWORD *)end + 2) = *(_OWORD *)&a3->var3;
      *((_OWORD *)end + 3) = v60;
      *($047367E7237D93BB26E796C35D3A0ACE *)end = v58;
      *((_OWORD *)end + 1) = v59;
      long long v61 = *(_OWORD *)&a3->var7;
      long long v62 = *(_OWORD *)&a3->var9;
      long long v63 = *(_OWORD *)&a3->var13;
      *((_OWORD *)end + 6) = *(_OWORD *)&a3->var11;
      *((_OWORD *)end + 7) = v63;
      *((_OWORD *)end + 4) = v61;
      *((_OWORD *)end + 5) = v62;
      self->_inputPoints.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 128);
    }
    else
    {
      double v37 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 128);
      long long v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)value - 128);
      long long v39 = self->_inputPoints.__end_cap_.__value_;
      while (v38 < value)
      {
        long long v40 = *(_OWORD *)v38;
        long long v41 = *((_OWORD *)v38 + 1);
        long long v42 = *((_OWORD *)v38 + 3);
        *((_OWORD *)v39 + 2) = *((_OWORD *)v38 + 2);
        *((_OWORD *)v39 + 3) = v42;
        *(_OWORD *)long long v39 = v40;
        *((_OWORD *)v39 + 1) = v41;
        long long v43 = *((_OWORD *)v38 + 4);
        long long v44 = *((_OWORD *)v38 + 5);
        long long v45 = *((_OWORD *)v38 + 7);
        *((_OWORD *)v39 + 6) = *((_OWORD *)v38 + 6);
        *((_OWORD *)v39 + 7) = v45;
        *((_OWORD *)v39 + 4) = v43;
        *((_OWORD *)v39 + 5) = v44;
        long long v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v38 + 128);
        long long v39 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v39 + 128);
      }
      self->_inputPoints.__end_cap_.__value_ = v39;
      if (value != v37) {
        memmove((char *)value - 128 * ((value - v37) >> 7), end, value - v37);
      }
      long long v51 = a3;
      if (end <= ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)a3) {
        long long v51 = &a3[(unint64_t)(self->_inputPoints.__end_cap_.__value_ > ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)a3)];
      }
      $047367E7237D93BB26E796C35D3A0ACE v52 = v51->var0;
      long long v53 = *(_OWORD *)&v51->var1;
      long long v54 = *(_OWORD *)&v51->var5;
      *((_OWORD *)end + 2) = *(_OWORD *)&v51->var3;
      *((_OWORD *)end + 3) = v54;
      *($047367E7237D93BB26E796C35D3A0ACE *)end = v52;
      *((_OWORD *)end + 1) = v53;
      long long v55 = *(_OWORD *)&v51->var7;
      long long v56 = *(_OWORD *)&v51->var9;
      long long v57 = *(_OWORD *)&v51->var13;
      *((_OWORD *)end + 6) = *(_OWORD *)&v51->var11;
      *((_OWORD *)end + 7) = v57;
      *((_OWORD *)end + 4) = v55;
      *((_OWORD *)end + 5) = v56;
    }
    goto LABEL_42;
  }
  unint64_t v46 = ((value - end) >> 7) + 1;
  if (v46 >> 57) {
    std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v47 = v34 - (void)end;
  if (v47 >> 6 > v46) {
    unint64_t v46 = v47 >> 6;
  }
  if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFF80) {
    unint64_t v48 = 0x1FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v48 = v46;
  }
  p_activeInputPoint = &self->_activeInputPoint;
  if (!v48)
  {
    long long v49 = 0;
    long long v87 = 0u;
    long long v88 = 0u;
LABEL_35:
    v64 = ($047367E7237D93BB26E796C35D3A0ACE *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&self->_activeInputPoint, 1uLL);
    *(void *)&long long v87 = v64;
    *((void *)&v87 + 1) = v64;
    *((void *)&v88 + 1) = &v64[8 * v65];
    if (v49) {
      operator delete(v49);
    }
    long long v49 = v64;
    goto LABEL_38;
  }
  long long v49 = ($047367E7237D93BB26E796C35D3A0ACE *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&self->_activeInputPoint, v48);
  *(void *)&long long v87 = v49;
  *((void *)&v87 + 1) = v49;
  *(void *)&long long v88 = v49;
  *((void *)&v88 + 1) = &v49[8 * v50];
  if (!v50) {
    goto LABEL_35;
  }
LABEL_38:
  $047367E7237D93BB26E796C35D3A0ACE v66 = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var3;
  $047367E7237D93BB26E796C35D3A0ACE v67 = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var5;
  $047367E7237D93BB26E796C35D3A0ACE v68 = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var1;
  *long long v49 = a3->var0;
  v49[1] = v68;
  v49[2] = v66;
  v49[3] = v67;
  $047367E7237D93BB26E796C35D3A0ACE v69 = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var7;
  $047367E7237D93BB26E796C35D3A0ACE v70 = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var9;
  $047367E7237D93BB26E796C35D3A0ACE v71 = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var13;
  v49[6] = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var11;
  v49[7] = v71;
  v49[4] = v69;
  v49[5] = v70;
  *(void *)&long long v88 = v49 + 8;
  std::vector<PKInputPoint>::__swap_out_circular_buffer((void **)&self->_inputPoints.__end_, (uint64_t)&v87, (char *)end);
  if ((void)v88 != *((void *)&v87 + 1)) {
    *(void *)&long long v88 = v88 + ((*((void *)&v87 + 1) - v88 + 127) & 0xFFFFFFFFFFFFFF80);
  }
  if ((void)v87) {
    operator delete((void *)v87);
  }
LABEL_42:
  v72 = self->_inputPoints.__end_cap_.__value_;
  if ((unint64_t)(v72 - self->_inputPoints.__end_) >= 0x501)
  {
    self->_inputPoints.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v72 - 128);
    [(PKHoverController *)self _triggerHoldGestureIfNecessary];
  }
  long long v73 = *(_OWORD *)&a3->var9;
  v84[4] = *(_OWORD *)&a3->var7;
  v84[5] = v73;
  long long v74 = *(_OWORD *)&a3->var13;
  v84[6] = *(_OWORD *)&a3->var11;
  v84[7] = v74;
  long long v75 = *(_OWORD *)&a3->var1;
  v84[0] = a3->var0;
  v84[1] = v75;
  long long v76 = *(_OWORD *)&a3->var5;
  v84[2] = *(_OWORD *)&a3->var3;
  v84[3] = v76;
  [(PKHoverController *)self updateCurrentInputPointWithInputPoint:v84];
  if (LOBYTE(self->_waitingForHoverHoldTimestamp))
  {
    if (v32)
    {
      if (v31 && (*(_WORD *)&self->_delegateFlags & 8) != 0)
      {
        id v77 = objc_loadWeakRetained((id *)&self->_currentLabel);
        [v77 hoverControllerDidLift:self];
LABEL_55:
      }
    }
    else
    {
      [(PKHoverController *)self currentInputPoint];
      [(PKHoverController *)self _sendDidUpdate:&v82];
    }
  }
  else if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(self->_inputPoints.__end_cap_.__value_ - self->_inputPoints.__end_) >= ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)0x181)
  {
    if (BYTE5(self->_delegate) && isPencilGesture((UIHoverGestureRecognizer *)self->_eventGeneratorTimer)) {
      [(PKHoverController *)self startDisplayLink];
    }
    LOBYTE(self->_waitingForHoverHoldTimestamp) = 1;
    self->_cachedLatestInputPoint.var0.point.double x = 0.0;
    if (*(unsigned char *)&self->_delegateFlags)
    {
      id v77 = objc_loadWeakRetained((id *)&self->_currentLabel);
      long long v78 = *(_OWORD *)&a3->var9;
      v83[4] = *(_OWORD *)&a3->var7;
      v83[5] = v78;
      long long v79 = *(_OWORD *)&a3->var13;
      v83[6] = *(_OWORD *)&a3->var11;
      v83[7] = v79;
      long long v80 = *(_OWORD *)&a3->var1;
      v83[0] = a3->var0;
      v83[1] = v80;
      long long v81 = *(_OWORD *)&a3->var5;
      v83[2] = *(_OWORD *)&a3->var3;
      v83[3] = v81;
      [v77 hoverController:self didBegin:v83];
      goto LABEL_55;
    }
  }
}

- (double)adjustedZLimitFromLimit:(double)a3 inputPoint:
{
  if (!a1) {
    return 0.0;
  }
  long long v6 = +[PKHoverSettings sharedSettings];
  [v6 screenEdgeSizeInMillimeters];
  double v8 = v7;
  if (-[PKHoverController pointsPerMillimeter]::onceToken != -1) {
    dispatch_once(&-[PKHoverController pointsPerMillimeter]::onceToken, &__block_literal_global_76);
  }
  double v9 = v8 * *(double *)&-[PKHoverController pointsPerMillimeter]::nativePointsPerMillimeter * 0.5;

  if (v9 != 0.0)
  {
    long long v10 = a2[5];
    v18[4] = a2[4];
    v18[5] = v10;
    long long v11 = a2[7];
    v18[6] = a2[6];
    v18[7] = v11;
    long long v12 = a2[1];
    v18[0] = *a2;
    v18[1] = v12;
    long long v13 = a2[3];
    v18[2] = a2[2];
    v18[3] = v13;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    double v15 = -[PKHoverController distanceFromEdgeOfScreen:view:](a1, (double *)v18, WeakRetained);

    double v16 = v15 / v9;
    if (v15 / v9 > 1.0) {
      double v16 = 1.0;
    }
    return v16 * a3;
  }
  return a3;
}

- (void)_sendDidUpdate:(id *)a3
{
  [(PKHoverController *)self currentInputPoint];
  [(PKHoverController *)self _sendDidUpdateNow:&v4];
}

- (void)_sendDidUpdateNow:(id *)a3
{
  if ((*(_WORD *)&self->_delegateFlags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentLabel);
    long long v6 = *(_OWORD *)&a3->var9;
    v10[4] = *(_OWORD *)&a3->var7;
    v10[5] = v6;
    long long v7 = *(_OWORD *)&a3->var13;
    v10[6] = *(_OWORD *)&a3->var11;
    v10[7] = v7;
    long long v8 = *(_OWORD *)&a3->var1;
    v10[0] = a3->var0;
    v10[1] = v8;
    long long v9 = *(_OWORD *)&a3->var5;
    v10[2] = *(_OWORD *)&a3->var3;
    v10[3] = v9;
    [WeakRetained hoverController:self didUpdate:v10];
  }
  self->_cachedLatestInputPoint.var0.point.double x = a3->var7;
}

- (void)showLabel:(double)a3 atLocation:(double)a4
{
  id v7 = a2;
  if (a1)
  {
    id v9 = v7;
    long long v8 = objc_msgSend(MEMORY[0x1E4FB1EB0], "pk_hoverAttributedStringFromString:", v7);
    if (v8) {
      [(PKHoverController *)(uint64_t)a1 showAttributedLabel:a3 atLocation:a4];
    }
    else {
      [a1 hideLabel];
    }

    id v7 = v9;
  }
}

- (void)showAttributedLabel:(double)a3 atLocation:(double)a4
{
  id v14 = a2;
  if (a1)
  {
    [(id)a1 hideLabel];
    long long v8 = objc_msgSend(MEMORY[0x1E4FB1EB0], "pk_hoverLabelFont");
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    long long v10 = [WeakRetained traitCollection];
    uint64_t v11 = +[PKFloatingLabelView floatingLabelViewWithAttributedString:(uint64_t)PKFloatingLabelView font:v14 location:v8 traitCollection:v10];
    long long v12 = *(void **)(a1 + 248);
    *(void *)(a1 + 248) = v11;

    id v13 = objc_loadWeakRetained((id *)(a1 + 24));
    [v13 addSubview:*(void *)(a1 + 248)];

    objc_storeStrong((id *)(a1 + 440), a2);
  }
}

- (void)hideLabel
{
  double maximumTimeIntervalBetweenEvents = self->_maximumTimeIntervalBetweenEvents;
  self->_double maximumTimeIntervalBetweenEvents = 0.0;

  [self->_currentInputPointCounter removeFromSuperview];
  currentInputPointCounter = (void *)self->_currentInputPointCounter;
  self->_currentInputPointCounter = 0;
}

- (double)distanceFromEdgeOfScreen:(void *)a3 view:
{
  id v5 = a3;
  long long v6 = v5;
  if (a1)
  {
    double v7 = *a2;
    double v8 = a2[1];
    id v9 = [v5 window];
    objc_msgSend(v6, "convertPoint:toView:", v9, v7, v8);
    double v11 = v10;
    double v13 = v12;

    id v14 = [v6 window];
    double v33 = v13;
    [v14 bounds];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v34.origin.double x = v16;
    v34.origin.double y = v18;
    v34.size.width = v20;
    v34.size.height = v22;
    double MinX = CGRectGetMinX(v34);
    v35.origin.double x = v16;
    v35.origin.double y = v18;
    v35.size.width = v20;
    v35.size.height = v22;
    double MaxX = CGRectGetMaxX(v35);
    v36.origin.double x = v16;
    v36.origin.double y = v18;
    v36.size.width = v20;
    v36.size.height = v22;
    double MinY = CGRectGetMinY(v36);
    v37.origin.double x = v16;
    v37.origin.double y = v18;
    v37.size.width = v20;
    v37.size.height = v22;
    CGFloat MaxY = CGRectGetMaxY(v37);
    double v27 = fmax(v11 - MinX, 0.0);
    double v28 = fmax(MaxX - v11, 0.0);
    double v29 = fmax(v33 - MinY, 0.0);
    double v30 = fmax(MaxY - v33, 0.0);
    if (v27 >= v28) {
      double v27 = v28;
    }
    if (v27 >= v29) {
      double v27 = v29;
    }
    if (v27 >= v30) {
      double v31 = v30;
    }
    else {
      double v31 = v27;
    }
  }
  else
  {
    double v31 = 0.0;
  }

  return v31;
}

void __40__PKHoverController_pointsPerMillimeter__block_invoke()
{
  uint64_t v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    id v5 = v0;
    [v0 floatValue];
    float v2 = v1;
    uint64_t v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v3 nativeScale];
    *(double *)&-[PKHoverController pointsPerMillimeter]::nativePointsPerMillimeter = v2 / 25.4 / v4;

    uint64_t v0 = v5;
  }
}

- (double)currentMovementSpeed
{
  end = self->_inputPoints.__end_;
  uint64_t v3 = self->_inputPoints.__end_cap_.__value_ - end;
  double result = 0.0;
  if ((unint64_t)v3 >= 0x500)
  {
    uint64_t v5 = (v3 >> 7) - 1;
    if (v3 >= 129)
    {
      if (v5 <= 1) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = (v3 >> 7) - 1;
      }
      double v7 = *((double *)end + 8);
      double v8 = (double *)((char *)end + 128);
      do
      {
        double v9 = v7;
        double v7 = v8[8];
        double v10 = v9 - v7;
        if (v10 > 0.0) {
          double result = result
        }
                 + sqrt((*(v8 - 15) - v8[1]) * (*(v8 - 15) - v8[1]) + (*(v8 - 16) - *v8) * (*(v8 - 16) - *v8)) / v10;
        v8 += 16;
        --v6;
      }
      while (v6);
    }
    return result / (double)v5;
  }
  return result;
}

- (BOOL)isInEdgeOfScreen:(BOOL)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (-[PKHoverController pointsPerMillimeter]::onceToken != -1) {
      dispatch_once(&-[PKHoverController pointsPerMillimeter]::onceToken, &__block_literal_global_76);
    }
    double v4 = *(double *)&-[PKHoverController pointsPerMillimeter]::nativePointsPerMillimeter;
    long long v5 = a2[5];
    v11[4] = a2[4];
    v11[5] = v5;
    long long v6 = a2[7];
    v11[6] = a2[6];
    v11[7] = v6;
    long long v7 = a2[1];
    v11[0] = *a2;
    v11[1] = v7;
    long long v8 = a2[3];
    v11[2] = a2[2];
    v11[3] = v8;
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
    double v10 = -[PKHoverController distanceFromEdgeOfScreen:view:](v3, (double *)v11, WeakRetained);

    return v10 < v4 * 5.0;
  }
  return result;
}

- (BOOL)isInExteriorOfScreen:(BOOL)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (-[PKHoverController pointsPerMillimeter]::onceToken != -1) {
      dispatch_once(&-[PKHoverController pointsPerMillimeter]::onceToken, &__block_literal_global_76);
    }
    double v4 = *(double *)&-[PKHoverController pointsPerMillimeter]::nativePointsPerMillimeter;
    long long v5 = a2[5];
    v11[4] = a2[4];
    v11[5] = v5;
    long long v6 = a2[7];
    v11[6] = a2[6];
    v11[7] = v6;
    long long v7 = a2[1];
    v11[0] = *a2;
    v11[1] = v7;
    long long v8 = a2[3];
    v11[2] = a2[2];
    v11[3] = v8;
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
    double v10 = -[PKHoverController distanceFromEdgeOfScreen:view:](v3, (double *)v11, WeakRetained);

    return v10 < v4 * 20.0;
  }
  return result;
}

- (void)alphaFactorFromMovementSpeed:(uint64_t)a1
{
  if (a1)
  {
    float v1 = +[PKHoverSettings sharedSettings];
    [v1 toolShadowMovementSpeedHideThreshold];
  }
}

- (void)logInputPoint:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputPoints.__begin_);
  double x = a3->var0.var0.x;
  double y = a3->var0.var0.y;
  id v7 = WeakRetained;
  long long v8 = [v7 window];
  objc_msgSend(v7, "convertPoint:toView:", v8, x, y);
  uint64_t v10 = v9;
  uint64_t v12 = v11;

  double v13 = os_log_create("com.apple.pencilkit", "Pencil Hover");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = a3->var3 * 57.2957795;
    double v15 = a3->var2 * 57.2957795;
    double v16 = a3->var12 * 57.2957795;
    double var6 = a3->var6;
    double var7 = a3->var7;
    int v19 = 134219520;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    __int16 v23 = 2048;
    double v24 = var6;
    __int16 v25 = 2048;
    double v26 = v14;
    __int16 v27 = 2048;
    double v28 = v15;
    __int16 v29 = 2048;
    double v30 = v16;
    __int16 v31 = 2048;
    double v32 = var7;
    _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Hover location in window: %.1f, %.1f, elevation: %.1f, altitude: %.1f, azimuth: %.1f, roll: %.1f, timestamp: %.4f", (uint8_t *)&v19, 0x48u);
  }
}

- (double)inputPointFilter:(id)a3 distanceToEdge:(id *)a4
{
  long long v5 = *(_OWORD *)&a4->var9;
  v12[4] = *(_OWORD *)&a4->var7;
  v12[5] = v5;
  long long v6 = *(_OWORD *)&a4->var13;
  v12[6] = *(_OWORD *)&a4->var11;
  v12[7] = v6;
  long long v7 = *(_OWORD *)&a4->var1;
  v12[0] = a4->var0;
  v12[1] = v7;
  long long v8 = *(_OWORD *)&a4->var5;
  v12[2] = *(_OWORD *)&a4->var3;
  v12[3] = v8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputPoints.__begin_);
  double v10 = -[PKHoverController distanceFromEdgeOfScreen:view:]((uint64_t)self, (double *)v12, WeakRetained);

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  if ([v5 type] == 2) {
    -[PKHoverController didReceiveNormalTouch:]((uint64_t)self, v5);
  }

  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumTimeIntervalBetweenEvents, 0);
  objc_destroyWeak((id *)&self->_currentLabel);
  objc_storeStrong((id *)&self->_useUpdateCycle, 0);
  objc_storeStrong((id *)&self->_intentionalHoverStartTimestamp, 0);
  objc_storeStrong((id *)&self->_allInputPointFilters, 0);
  objc_storeStrong((id *)&self->_predictionFilter, 0);
  objc_storeStrong((id *)&self->_reduceFramerateFilter, 0);
  objc_storeStrong((id *)&self->_extraLatencyFilter, 0);
  objc_storeStrong((id *)&self->_altitudeAndAzimuthEdgeFilter, 0);
  objc_storeStrong((id *)&self->_altitudeAndAzimuthZLimitFilter, 0);
  objc_storeStrong((id *)&self->_altitudeAndAzimuthBucketingFilter, 0);
  objc_storeStrong((id *)&self->_altitudeAndAzimuthNoiseFilter, 0);
  objc_storeStrong((id *)&self->_previousRollValue, 0);
  objc_storeStrong((id *)&self->_eventGeneratorTimer, 0);
  objc_storeStrong((id *)&self->_currentInputPointCounter, 0);
  end = self->_inputPoints.__end_;
  if (end)
  {
    self->_inputPoints.__end_cap_.__value_ = end;
    operator delete(end);
  }

  objc_destroyWeak((id *)&self->_inputPoints.__begin_);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end