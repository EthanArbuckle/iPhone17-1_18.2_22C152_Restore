@interface AVScrubber
+ (id)keyPathsForValuesAffectingLocalizedScrubbingSpeedName;
- (AVLayoutItemAttributes)layoutAttributes;
- (AVScrubber)initWithFrame:(CGRect)a3;
- (AVScrubberDelegate)delegate;
- (BOOL)_shouldTrackTouchAtPoint:(CGPoint)a3;
- (BOOL)avkit_shouldPreventExternalGestureRecognizerAtPoint:(CGPoint)a3;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canChangeScrubbingSpeed;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)hasAlternateAppearance;
- (BOOL)hasChangedLocationAtLeastOnce;
- (BOOL)hasFullScreenAppearance;
- (BOOL)isCollapsed;
- (BOOL)isCollapsedOrExcluded;
- (BOOL)isIncluded;
- (BOOL)isRemoved;
- (BOOL)isScrollScrubbing;
- (BOOL)isTracking;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)scrubberEnabledStatus;
- (BOOL)scrubsWhenTappedAnywhere;
- (BOOL)shouldRecoverFromPrecisionScrubbingIfNeeded;
- (BOOL)showsTimelineMarkers;
- (BOOL)slowKnobMovementDetected;
- (CGPoint)contentOffsetFromValue;
- (CGRect)hitRect;
- (CGRect)maximumValueImageRectForBounds:(CGRect)a3;
- (CGRect)minimumValueImageRectForBounds:(CGRect)a3;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (CGSize)extrinsicContentSize;
- (CGSize)intrinsicContentSize;
- (NSArray)interstitialDisplayTimes;
- (NSArray)loadedTimeRanges;
- (NSArray)photosensitiveDisplayTimes;
- (NSDirectionalEdgeInsets)hitRectInsets;
- (NSMutableArray)interstitialOverlayViews;
- (NSMutableArray)photosensitiveOverlayViews;
- (NSMutableArray)previousScrubberVelocities;
- (NSString)localizedScrubbingSpeedName;
- (NSTimer)updateSlowKnobMovementDetectedTimer;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImageView)currentThumbView;
- (UIScrollView)scrollView;
- (UISelectionFeedbackGenerator)feedbackGenerator;
- (UIView)loadedTrackOverlayView;
- (double)currentScrubberParentHeight;
- (double)newScrubberParentHeight;
- (double)normalizedScrollOffset;
- (double)resolution;
- (double)scrubberParentHeight;
- (double)timeIntervalSinceTrackingEnded;
- (double)timestampWhenTrackingEnded;
- (float)_normalizeSliderValue:(float)a3;
- (float)clampedEstimatedFrameRate;
- (float)duration;
- (float)estimatedFrameRate;
- (float)normalizedPosition;
- (float)rate;
- (float)valueFromScrollView;
- (id)createThumbView;
- (int64_t)scrubbingSpeed;
- (void)_layoutPhotosensitiveRegions:(float)a3;
- (void)_layoutTimeLineMarkerViews:(float)a3;
- (void)_updateLayoutItem;
- (void)_updateSlowKnobMovementDetected;
- (void)_updateSlowKnobMovementDetectedForTargetValue:(float)a3;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endOrCancelTracking;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutAttributesDidChange;
- (void)layoutSubviews;
- (void)setCanChangeScrubbingSpeed:(BOOL)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setCurrentScrubberParentHeight:(double)a3;
- (void)setCurrentThumbView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEstimatedFrameRate:(float)a3;
- (void)setExtrinsicContentSize:(CGSize)a3;
- (void)setHasAlternateAppearance:(BOOL)a3;
- (void)setHasChangedLocationAtLeastOnce:(BOOL)a3;
- (void)setHasFullScreenAppearance:(BOOL)a3;
- (void)setHitRectInsets:(NSDirectionalEdgeInsets)a3;
- (void)setIncluded:(BOOL)a3;
- (void)setInterstitialDisplayTimes:(id)a3;
- (void)setInterstitialOverlayViews:(id)a3;
- (void)setLoadedTimeRanges:(id)a3;
- (void)setNewScrubberParentHeight:(double)a3;
- (void)setPhotosensitiveDisplayTimes:(id)a3;
- (void)setPhotosensitiveOverlayViews:(id)a3;
- (void)setPreviousScrubberVelocities:(id)a3;
- (void)setRate:(float)a3;
- (void)setRemoved:(BOOL)a3;
- (void)setResolution:(double)a3;
- (void)setScrollScrubbing:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setScrubberEnabledStatus:(BOOL)a3;
- (void)setScrubberParentHeight:(double)a3;
- (void)setScrubbingSpeed:(int64_t)a3;
- (void)setScrubsWhenTappedAnywhere:(BOOL)a3;
- (void)setShouldRecoverFromPrecisionScrubbingIfNeeded:(BOOL)a3;
- (void)setShowsTimelineMarkers:(BOOL)a3;
- (void)setSlowKnobMovementDetected:(BOOL)a3;
- (void)setTimestampWhenTrackingEnded:(double)a3;
- (void)setUpdateSlowKnobMovementDetectedTimer:(id)a3;
- (void)setValue:(float)a3;
@end

@implementation AVScrubber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosensitiveOverlayViews, 0);
  objc_storeStrong((id *)&self->_interstitialOverlayViews, 0);
  objc_storeStrong((id *)&self->_updateSlowKnobMovementDetectedTimer, 0);
  objc_destroyWeak((id *)&self->_currentThumbView);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_photosensitiveDisplayTimes, 0);
  objc_storeStrong((id *)&self->_interstitialDisplayTimes, 0);
  objc_storeStrong((id *)&self->_loadedTimeRanges, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_previousScrubberVelocities, 0);
  objc_storeStrong((id *)&self->_loadedTrackOverlayView, 0);

  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

- (void)setNewScrubberParentHeight:(double)a3
{
  self->_newScrubberParentHeight = a3;
}

- (double)newScrubberParentHeight
{
  return self->_newScrubberParentHeight;
}

- (void)setCurrentScrubberParentHeight:(double)a3
{
  self->_currentScrubberParentHeight = a3;
}

- (double)currentScrubberParentHeight
{
  return self->_currentScrubberParentHeight;
}

- (void)setPhotosensitiveOverlayViews:(id)a3
{
}

- (NSMutableArray)photosensitiveOverlayViews
{
  return self->_photosensitiveOverlayViews;
}

- (void)setInterstitialOverlayViews:(id)a3
{
}

- (NSMutableArray)interstitialOverlayViews
{
  return self->_interstitialOverlayViews;
}

- (void)setScrubberEnabledStatus:(BOOL)a3
{
  self->_scrubberEnabledStatus = a3;
}

- (BOOL)scrubberEnabledStatus
{
  return self->_scrubberEnabledStatus;
}

- (void)setHasChangedLocationAtLeastOnce:(BOOL)a3
{
  self->_hasChangedLocationAtLeastOnce = a3;
}

- (BOOL)hasChangedLocationAtLeastOnce
{
  return self->_hasChangedLocationAtLeastOnce;
}

- (void)setCanChangeScrubbingSpeed:(BOOL)a3
{
  self->_canChangeScrubbingSpeed = a3;
}

- (BOOL)canChangeScrubbingSpeed
{
  return self->_canChangeScrubbingSpeed;
}

- (void)setScrubsWhenTappedAnywhere:(BOOL)a3
{
  self->_scrubsWhenTappedAnywhere = a3;
}

- (BOOL)scrubsWhenTappedAnywhere
{
  return self->_scrubsWhenTappedAnywhere;
}

- (void)setTimestampWhenTrackingEnded:(double)a3
{
  self->_timestampWhenTrackingEnded = a3;
}

- (double)timestampWhenTrackingEnded
{
  return self->_timestampWhenTrackingEnded;
}

- (void)setUpdateSlowKnobMovementDetectedTimer:(id)a3
{
}

- (NSTimer)updateSlowKnobMovementDetectedTimer
{
  return self->_updateSlowKnobMovementDetectedTimer;
}

- (UIImageView)currentThumbView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentThumbView);

  return (UIImageView *)WeakRetained;
}

- (void)setShouldRecoverFromPrecisionScrubbingIfNeeded:(BOOL)a3
{
  self->_shouldRecoverFromPrecisionScrubbingIfNeeded = a3;
}

- (BOOL)shouldRecoverFromPrecisionScrubbingIfNeeded
{
  return self->_shouldRecoverFromPrecisionScrubbingIfNeeded;
}

- (void)setSlowKnobMovementDetected:(BOOL)a3
{
  self->_slowKnobMovementDetected = a3;
}

- (BOOL)slowKnobMovementDetected
{
  return self->_slowKnobMovementDetected;
}

- (void)setScrollScrubbing:(BOOL)a3
{
  self->_scrollScrubbing = a3;
}

- (BOOL)isScrollScrubbing
{
  return self->_scrollScrubbing;
}

- (void)setScrollView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (float)rate
{
  return self->_rate;
}

- (double)scrubberParentHeight
{
  return self->_scrubberParentHeight;
}

- (void)setHitRectInsets:(NSDirectionalEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (NSDirectionalEdgeInsets)hitRectInsets
{
  double top = self->_hitRectInsets.top;
  double leading = self->_hitRectInsets.leading;
  double bottom = self->_hitRectInsets.bottom;
  double trailing = self->_hitRectInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setResolution:(double)a3
{
  self->_resolution = a3;
}

- (double)resolution
{
  return self->_resolution;
}

- (void)setEstimatedFrameRate:(float)a3
{
  self->_estimatedFrameRate = a3;
}

- (float)estimatedFrameRate
{
  return self->_estimatedFrameRate;
}

- (void)setScrubbingSpeed:(int64_t)a3
{
  self->_scrubbingSpeed = a3;
}

- (int64_t)scrubbingSpeed
{
  return self->_scrubbingSpeed;
}

- (BOOL)showsTimelineMarkers
{
  return self->_showsTimelineMarkers;
}

- (NSArray)photosensitiveDisplayTimes
{
  return self->_photosensitiveDisplayTimes;
}

- (NSArray)interstitialDisplayTimes
{
  return self->_interstitialDisplayTimes;
}

- (NSArray)loadedTimeRanges
{
  return self->_loadedTimeRanges;
}

- (void)setDelegate:(id)a3
{
}

- (AVScrubberDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVScrubberDelegate *)WeakRetained;
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  self->_hasFullScreenAppearance = a3;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (CGSize)extrinsicContentSize
{
  double width = self->_extrinsicContentSize.width;
  double height = self->_extrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setPreviousScrubberVelocities:(id)a3
{
}

- (void)_layoutTimeLineMarkerViews:(float)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [(AVScrubber *)self _minTrackView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(AVScrubber *)self _minTrackView];
  -[AVScrubber convertRect:fromView:](self, "convertRect:fromView:", v15, v8, v10, v12, v14);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v24 = [(AVScrubber *)self interstitialDisplayTimes];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v56;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v56 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v55 + 1) + 8 * v28);
        v30 = NSNumber;
        if (v29)
        {
          [v29 timeRange];
        }
        else
        {
          long long v52 = 0u;
          long long v53 = 0u;
          long long v51 = 0u;
        }
        *(_OWORD *)&time.value = v51;
        time.epoch = v52;
        v31 = [v30 numberWithDouble:CMTimeGetSeconds(&time)];
        [v5 addObject:v31];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v26);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v32 = [(AVScrubber *)self interstitialOverlayViews];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = 0;
    uint64_t v36 = *(void *)v48;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(v32);
        }
        v38 = *(void **)(*((void *)&v47 + 1) + 8 * v37);
        v39 = [v5 objectAtIndexedSubscript:v35 + v37];
        [v39 floatValue];
        float v41 = v40;
        [(AVScrubber *)self minimumValue];
        float v43 = (float)(v41 - v42) / a3;

        [(AVScrubber *)self bounds];
        -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
        CGFloat v44 = CGRectGetWidth(v62) * v43;
        v63.origin.x = v17;
        v63.origin.y = v19;
        v63.size.double width = v21;
        v63.size.double height = v23;
        double MinY = CGRectGetMinY(v63);
        v46 = [v38 layer];
        [v46 setCornerRadius:2.5];

        objc_msgSend(v38, "setFrame:", v44, MinY, 5.0, 5.0);
        [(AVScrubber *)self insertSubview:v38 atIndex:0];
        ++v37;
      }
      while (v34 != v37);
      v35 += v37;
      uint64_t v34 = [v32 countByEnumeratingWithState:&v47 objects:v59 count:16];
    }
    while (v34);
  }
}

- (void)_layoutPhotosensitiveRegions:(float)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v4 = [(AVScrubber *)self photosensitiveDisplayTimes];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [(AVScrubber *)self _minTrackView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v15 = [(AVScrubber *)self _minTrackView];
    -[AVScrubber convertRect:fromView:](self, "convertRect:fromView:", v15, v8, v10, v12, v14);
    CGFloat v56 = v17;
    CGFloat v57 = v16;
    CGFloat v54 = v19;
    CGFloat v55 = v18;

    [(AVScrubber *)self bounds];
    -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
    double Width = CGRectGetWidth(v71);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = [(AVScrubber *)self photosensitiveOverlayViews];
    uint64_t v58 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v58)
    {
      uint64_t v59 = 0;
      uint64_t v53 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v66 != v53) {
            objc_enumerationMutation(obj);
          }
          double v22 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          CGFloat v23 = [(AVScrubber *)self photosensitiveDisplayTimes];
          v24 = [v23 objectAtIndex:v59 + i];

          if (v24)
          {
            [v24 timeRange];
            CMTime time = *(CMTime *)((char *)v63 + 8);
            double Seconds = CMTimeGetSeconds(&time);
            [v24 timeRange];
          }
          else
          {
            memset(v63, 0, sizeof(v63));
            long long v62 = 0u;
            *(_OWORD *)&time.value = *(_OWORD *)((char *)v63 + 8);
            time.epoch = 0;
            double Seconds = CMTimeGetSeconds(&time);
            memset(&v60, 0, sizeof(v60));
          }
          CMTime v61 = v60;
          Float64 v26 = CMTimeGetSeconds(&v61);
          double v27 = v26;
          *(float *)&Float64 v26 = v26;
          [(AVScrubber *)self _normalizeSliderValue:v26];
          float v29 = v28;
          double v30 = Seconds + v27;
          *(float *)&double v30 = Seconds + v27;
          [(AVScrubber *)self _normalizeSliderValue:v30];
          double v32 = 10.0;
          if (v29 < 0.0) {
            double v32 = 0.0;
          }
          double v33 = Width * (float)(v31 - fmaxf(v29, 0.0));
          if (v32 >= v33) {
            double v34 = v32;
          }
          else {
            double v34 = v33;
          }
          double v35 = fmax(Width * v29, 0.0);
          v72.origin.y = v56;
          v72.origin.x = v57;
          v72.size.double height = v54;
          v72.size.double width = v55;
          double MinY = CGRectGetMinY(v72);
          uint64_t v37 = [v22 layer];
          [v37 setCornerRadius:2.5];

          v38 = [v24 colors];
          v39 = (void *)MEMORY[0x1E4FB1618];
          float v40 = [v38 objectAtIndexedSubscript:0];
          [v40 doubleValue];
          double v42 = v41;
          float v43 = [v38 objectAtIndexedSubscript:1];
          [v43 doubleValue];
          double v45 = v44;
          v46 = [v38 objectAtIndexedSubscript:2];
          [v46 doubleValue];
          double v48 = v47;
          long long v49 = [v38 objectAtIndexedSubscript:3];
          [v49 doubleValue];
          long long v51 = [v39 colorWithRed:v42 green:v45 blue:v48 alpha:v50];
          [v22 setBackgroundColor:v51];

          objc_msgSend(v22, "setFrame:", v35, MinY, v34, 5.0);
          [(AVScrubber *)self insertSubview:v22 atIndex:0];
        }
        v59 += i;
        uint64_t v58 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
      }
      while (v58);
    }
  }
}

- (float)_normalizeSliderValue:(float)a3
{
  [(AVScrubber *)self maximumValue];
  float v6 = v5;
  [(AVScrubber *)self minimumValue];
  float v8 = v6 - v7;
  float result = 0.0;
  if (v8 > 0.0)
  {
    [(AVScrubber *)self minimumValue];
    return (float)(a3 - v10) / v8;
  }
  return result;
}

- (void)_updateLayoutItem
{
  v3 = [(AVScrubber *)self layoutAttributes];
  [(AVScrubber *)self intrinsicContentSize];
  objc_msgSend(v3, "setMinimumSize:");

  v4 = [(AVScrubber *)self layoutAttributes];
  if ([(AVScrubber *)self isIncluded]) {
    uint64_t v5 = [(AVScrubber *)self isRemoved] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setIncluded:v5];

  id v6 = [(AVScrubber *)self layoutAttributes];
  objc_msgSend(v6, "setCollapsed:", -[AVScrubber isCollapsed](self, "isCollapsed"));
}

- (void)_updateSlowKnobMovementDetectedForTargetValue:(float)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (![(AVScrubber *)self slowKnobMovementDetected]
    && !self->_didHaveLessThanFullScrubbingSpeedSinceTrackingBegin)
  {
    [(AVScrubber *)self maximumValue];
    float v6 = v5;
    [(AVScrubber *)self minimumValue];
    float v8 = v7;
    [(AVScrubber *)self bounds];
    -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
    double Width = CGRectGetWidth(v67);
    objc_initWeak(&location, self);
    float v10 = [(AVScrubber *)self updateSlowKnobMovementDetectedTimer];
    [v10 invalidate];

    double v11 = (void *)MEMORY[0x1E4F1CB00];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __60__AVScrubber__updateSlowKnobMovementDetectedForTargetValue___block_invoke;
    v61[3] = &unk_1E5FC4480;
    objc_copyWeak(&v62, &location);
    double v12 = [v11 scheduledTimerWithTimeInterval:1 repeats:v61 block:0.25];
    [(AVScrubber *)self setUpdateSlowKnobMovementDetectedTimer:v12];

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double v14 = [MEMORY[0x1E4F1CA48] array];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v15 = [(AVScrubber *)self previousScrubberVelocities];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v58 != v17) {
            objc_enumerationMutation(v15);
          }
          double v19 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          [v19 timestamp];
          if (Current - v20 > 1.5) {
            [v14 addObject:v19];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v16);
    }

    CGFloat v21 = [(AVScrubber *)self previousScrubberVelocities];
    [v21 removeObjectsInArray:v14];

    float previousValue = self->_previousValue;
    double previousValueChangeTime = self->_previousValueChangeTime;
    double currentValueChangedTime = self->_currentValueChangedTime;
    float v25 = v6 - v8;
    if (((LODWORD(v25) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E)
    {
      Float64 v26 = objc_alloc_init(AVScrubberVelocity);
      [(AVScrubberVelocity *)v26 setTimestamp:Current];
      [(AVScrubberVelocity *)v26 setVelocity:(Width + -9.0) * ((float)(a3 - previousValue) / v25) / (currentValueChangedTime - previousValueChangeTime)];
      double v27 = [(AVScrubber *)self previousScrubberVelocities];
      [v27 addObject:v26];
    }
    self->_double previousValueChangeTime = self->_currentValueChangedTime;
    self->_double currentValueChangedTime = Current;
    self->_float previousValue = a3;
    if (Current - self->_trackingStartTime <= 1.0) {
      goto LABEL_40;
    }
    float v28 = [(AVScrubber *)self previousScrubberVelocities];
    BOOL v29 = [v28 count] == 0;

    if (v29) {
      goto LABEL_40;
    }
    double v30 = [(AVScrubber *)self previousScrubberVelocities];
    float v31 = [v30 objectAtIndexedSubscript:0];
    [v31 velocity];
    double v33 = v32;

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    double v34 = [(AVScrubber *)self previousScrubberVelocities];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v53 objects:v64 count:16];
    if (v35)
    {
      uint64_t v36 = 0;
      double v37 = Current + -1.5;
      uint64_t v38 = *(void *)v54;
      double v39 = 0.0;
      do
      {
        uint64_t v40 = 0;
        double v41 = v33;
        double v42 = v37;
        do
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v34);
          }
          float v43 = *(void **)(*((void *)&v53 + 1) + 8 * v40);
          [v43 timestamp];
          double v45 = v44;
          [v43 velocity];
          double v47 = v46;
          [v43 timestamp];
          double v37 = v48;
          double v33 = (v45 - v42) / 1.5 * v47;
          double v49 = fabs(v33);
          if (*(void *)&v33 >> 63 != *(void *)&v41 >> 63 && fabs(v41) + v49 > 0.1) {
            ++v36;
          }
          double v39 = v39 + v49;
          ++v40;
          double v41 = v33;
          double v42 = v37;
        }
        while (v35 != v40);
        uint64_t v35 = [v34 countByEnumeratingWithState:&v53 objects:v64 count:16];
      }
      while (v35);

      if (v39 >= 3.0 && (v39 >= 12.0 || v36 <= 0) && (v39 >= 20.0 || v36 < 2)) {
        goto LABEL_40;
      }
    }
    else
    {
    }
    [(AVScrubber *)self setSlowKnobMovementDetected:1];
    long long v52 = [(AVScrubber *)self delegate];
    [v52 scrubberSlowKnobMovementDetected:self];

LABEL_40:
    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);
  }
}

void __60__AVScrubber__updateSlowKnobMovementDetectedForTargetValue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSlowKnobMovementDetected];
}

- (void)_updateSlowKnobMovementDetected
{
  [(AVScrubber *)self value];

  -[AVScrubber _updateSlowKnobMovementDetectedForTargetValue:](self, "_updateSlowKnobMovementDetectedForTargetValue:");
}

- (BOOL)_shouldTrackTouchAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(AVScrubber *)self scrubsWhenTappedAnywhere])
  {
    [(AVScrubber *)self hitRect];
    v34.double x = x;
    v34.double y = y;
    BOOL v6 = CGRectContainsPoint(v36, v34);
  }
  else
  {
    BOOL v6 = 0;
  }
  float v7 = [(AVScrubber *)self currentThumbView];
  -[AVScrubber convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  uint64_t v12 = [(AVScrubber *)self currentThumbView];
  [(id)v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(AVScrubber *)self _thumbHitEdgeInsets];
  CGFloat v22 = v14 + v21;
  CGFloat v24 = v16 + v23;
  CGFloat v26 = v18 - (v21 + v25);
  CGFloat v28 = v20 - (v23 + v27);

  v37.origin.double x = v22;
  v37.origin.double y = v24;
  v37.size.double width = v26;
  v37.size.double height = v28;
  v35.double x = v9;
  v35.double y = v11;
  LOBYTE(v12) = CGRectContainsPoint(v37, v35);
  int v29 = [(AVScrubber *)self _trackEnabled];
  if ((v12 & 1) != 0 || v29)
  {
    [(AVScrubber *)self maximumValue];
    float v31 = v30;
    [(AVScrubber *)self minimumValue];
    if ((float)(v31 - v32) <= 0.0)
    {
      return 0;
    }
    else
    {
      [(AVScrubber *)self bounds];
      -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
      return CGRectGetWidth(v38) > 0.0;
    }
  }
  return v6;
}

- (CGPoint)contentOffsetFromValue
{
  v3 = [(AVScrubber *)self scrollView];
  [v3 contentSize];
  double v5 = v4;
  BOOL v6 = [(AVScrubber *)self scrollView];
  [v6 bounds];
  double v8 = v5 - v7;

  [(AVScrubber *)self normalizedPosition];
  double v10 = v8 * v9;
  double v11 = 0.0;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (float)valueFromScrollView
{
  [(AVScrubber *)self normalizedScrollOffset];
  double v4 = v3;
  [(AVScrubber *)self duration];
  double v6 = v5;
  [(AVScrubber *)self minimumValue];
  return v7 + v4 * v6;
}

- (double)normalizedScrollOffset
{
  double v3 = [(AVScrubber *)self scrollView];
  [v3 contentSize];
  double v5 = v4;
  double v6 = [(AVScrubber *)self scrollView];
  [v6 bounds];
  double v8 = v5 - v7;

  double v9 = 0.0;
  if (v8 > 0.0)
  {
    double v10 = [(AVScrubber *)self scrollView];
    [v10 contentOffset];
    double v9 = 1.0 - v11 / v8;
  }
  return v9;
}

- (float)normalizedPosition
{
  [(AVScrubber *)self duration];
  float v4 = v3;
  float result = 0.0;
  if (v4 > 0.0)
  {
    [(AVScrubber *)self value];
    float v7 = v6;
    [(AVScrubber *)self minimumValue];
    float v9 = v7 - v8;
    [(AVScrubber *)self duration];
    return 1.0 - (float)(v9 / v10);
  }
  return result;
}

- (float)duration
{
  [(AVScrubber *)self maximumValue];
  float v4 = v3;
  [(AVScrubber *)self minimumValue];
  return v4 - v5;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(AVScrubber *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (CGRect)hitRect
{
  v26.receiver = self;
  v26.super_class = (Class)AVScrubber;
  [(AVScrubber *)&v26 hitRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(AVScrubber *)self hitRectInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [(AVScrubber *)self effectiveUserInterfaceLayoutDirection];
  if (v19 == 1) {
    double v20 = v18;
  }
  else {
    double v20 = v14;
  }
  if (v19 == 1) {
    double v21 = v14;
  }
  else {
    double v21 = v18;
  }
  double v22 = v4 + v20;
  double v23 = v6 + v12;
  double v24 = v8 - (v20 + v21);
  double v25 = v10 - (v12 + v16);
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)layoutSubviews
{
  v67.receiver = self;
  v67.super_class = (Class)AVScrubber;
  [(AVScrubber *)&v67 layoutSubviews];
  double v3 = [(AVScrubber *)self _minTrackView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(AVScrubber *)self _minTrackView];
  -[AVScrubber convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  CGFloat v66 = v13;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  double MaxX = *MEMORY[0x1E4F1DB28];
  double MinY = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double Height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v24 = [(AVScrubber *)self loadedTimeRanges];
  [(AVScrubber *)self maximumValue];
  LODWORD(v5) = v25;
  [(AVScrubber *)self minimumValue];
  float v27 = *(float *)&v5 - v26;
  if (v27 <= 0.0 || ![v24 count]) {
    goto LABEL_12;
  }
  [(AVScrubber *)self value];
  float v29 = v28;
  [(AVScrubber *)self minimumValue];
  float v31 = v30;
  if ((unint64_t)[v24 count] < 2) {
    goto LABEL_11;
  }
  unint64_t v32 = 0;
  float v33 = (float)(v29 - v31) / v27;
  while (1)
  {
    CGPoint v34 = [v24 objectAtIndexedSubscript:v32];
    [v34 floatValue];
    if (v35 <= v33) {
      break;
    }

    ++v32;
LABEL_8:
    if (v32 >= (unint64_t)[v24 count] >> 1) {
      goto LABEL_11;
    }
  }
  CGRect v36 = [v24 objectAtIndexedSubscript:++v32];
  [v36 floatValue];
  float v38 = v37;

  if (v38 <= v33) {
    goto LABEL_8;
  }
  double v39 = [v24 objectAtIndexedSubscript:v32];
  [v39 floatValue];

LABEL_11:
  [(AVScrubber *)self bounds];
  -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
  CGRectGetWidth(v68);
  v69.origin.CGFloat x = v66;
  v69.origin.CGFloat y = v15;
  v69.size.double width = v17;
  v69.size.double height = v19;
  double MaxX = CGRectGetMaxX(v69);
  v70.origin.CGFloat x = v66;
  v70.origin.CGFloat y = v15;
  v70.size.double width = v17;
  v70.size.double height = v19;
  double MinY = CGRectGetMinY(v70);
  UIRoundToViewScale();
  double v41 = v40;
  v71.origin.CGFloat x = v66;
  v71.origin.CGFloat y = v15;
  v71.size.double width = v17;
  v71.size.double height = v19;
  double v23 = fmax(v41 - CGRectGetWidth(v71), 0.0);
  v72.origin.CGFloat x = v66;
  v72.origin.CGFloat y = v15;
  v72.size.double width = v17;
  v72.size.double height = v19;
  double Height = CGRectGetHeight(v72);
LABEL_12:
  double v42 = [(AVScrubber *)self loadedTrackOverlayView];
  objc_msgSend(v42, "setFrame:", MaxX, MinY, v23, Height);

  *(float *)&double v43 = v27;
  [(AVScrubber *)self _layoutTimeLineMarkerViews:v43];
  *(float *)&double v44 = v27;
  [(AVScrubber *)self _layoutPhotosensitiveRegions:v44];
  double v45 = [(AVScrubber *)self currentThumbView];
  objc_msgSend(v45, "setHidden:", -[AVScrubber isEnabled](self, "isEnabled") ^ 1);

  double v46 = [(AVScrubber *)self _maxTrackView];
  [v46 _cornerRadius];
  double v48 = v47;

  if (v48 == 0.0)
  {
    double v49 = [(AVScrubber *)self _minTrackView];
    double v50 = [v49 layer];
    uint64_t v51 = *MEMORY[0x1E4F39EA0];
    [v50 setCornerCurve:*MEMORY[0x1E4F39EA0]];

    long long v52 = [(AVScrubber *)self _minTrackView];
    long long v53 = [v52 layer];
    [v53 setCornerRadius:2.5];

    long long v54 = [(AVScrubber *)self _minTrackView];
    long long v55 = [v54 layer];
    [v55 setMaskedCorners:5];

    long long v56 = [(AVScrubber *)self _maxTrackView];
    long long v57 = [v56 layer];
    [v57 setCornerCurve:v51];

    long long v58 = [(AVScrubber *)self _maxTrackView];
    long long v59 = [v58 layer];
    [v59 setCornerRadius:2.5];

    long long v60 = [(AVScrubber *)self _maxTrackView];
    CMTime v61 = [v60 layer];
    [v61 setMaskedCorners:10];

    id v62 = [(AVScrubber *)self currentThumbView];
    CGRect v63 = [(AVScrubber *)self loadedTrackOverlayView];
    v64 = [(AVScrubber *)self interstitialOverlayViews];
    +[AVBackdropView configureSlider:self thumbView:v62 loadedTrackView:v63 withTimelineMarkers:v64];

    [(UIView *)self avkit_makeSubtreeDisallowGroupBlending];
  }
  if (([(AVScrubber *)self isEnabled] & 1) == 0) {
    [(AVScrubber *)self setAlpha:1.0];
  }
  if (![(AVScrubber *)self isScrollScrubbing])
  {
    [(AVScrubber *)self updateScrollViewContentSizeAndOffsetIfNeeded];
    long long v65 = [(AVScrubber *)self scrollView];
    [(AVScrubber *)self contentOffsetFromValue];
    objc_msgSend(v65, "setContentOffset:");
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.double bottom = v4;
  result.left = v3;
  result.double top = v2;
  return result;
}

- (void)endOrCancelTracking
{
  [(AVScrubber *)self setTimestampWhenTrackingEnded:CFAbsoluteTimeGetCurrent()];
  [(AVScrubber *)self setScrubbingSpeed:0];
  [(AVScrubber *)self setSlowKnobMovementDetected:0];
  double v3 = [(AVScrubber *)self previousScrubberVelocities];
  [v3 removeAllObjects];

  double v4 = [(AVScrubber *)self updateSlowKnobMovementDetectedTimer];
  [v4 invalidate];

  [(AVScrubber *)self setUpdateSlowKnobMovementDetectedTimer:0];
  self->_trackingStartTime = NAN;
  self->_float previousValue = NAN;
  self->_double previousValueChangeTime = NAN;
  self->_double currentValueChangedTime = NAN;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVScrubber;
  [(AVScrubber *)&v4 cancelTrackingWithEvent:a3];
  [(AVScrubber *)self endOrCancelTracking];
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[AVScrubber setTracking:](self, "setTracking:", 0, a4);
  [(AVScrubber *)self setHighlighted:0];

  [(AVScrubber *)self endOrCancelTracking];
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  if (![(AVScrubber *)self hasChangedLocationAtLeastOnce])
  {
    [v5 locationInView:self];
    double v37 = v36;
    [v5 previousLocationInView:self];
    [(AVScrubber *)self setHasChangedLocationAtLeastOnce:v37 - v38 != 0.0];
    goto LABEL_31;
  }
  [(AVScrubber *)self maximumValue];
  float v7 = v6;
  [(AVScrubber *)self minimumValue];
  float v9 = v7 - v8;
  [(AVScrubber *)self bounds];
  -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
  double v10 = CGRectGetWidth(v66) + -9.0;
  [v5 locationInView:self];
  double v12 = v11;
  double v14 = v13;
  [v5 previousLocationInView:self];
  double v65 = v12;
  double v16 = v12 - v15;
  [(AVScrubber *)self center];
  double v18 = v14 - v17;
  CGFloat v19 = [(AVScrubber *)self traitCollection];
  [v19 displayScale];
  double v21 = v20;

  [(AVScrubber *)self value];
  float v23 = v22;
  [(AVScrubber *)self minimumValue];
  float v25 = v9;
  float v26 = (float)(v23 - v24) / v9;
  BOOL v28 = [(AVScrubber *)self canChangeScrubbingSpeed];
  double v29 = 1.0;
  double v64 = v18;
  if (v28)
  {
    double v30 = fabs(v18);
    if (v30 <= 196.0)
    {
      if (v30 <= 140.0)
      {
        float v31 = v25;
        if (v30 <= 84.0)
        {
          char v39 = 0;
          uint64_t v35 = 0;
          double v34 = 1.0;
          goto LABEL_15;
        }
        double v34 = 0.5;
        uint64_t v35 = 1;
      }
      else
      {
        double v34 = 0.25;
        uint64_t v35 = 2;
        float v31 = v25;
      }
    }
    else
    {
      [(AVScrubber *)self clampedEstimatedFrameRate];
      float v31 = v25;
      double v33 = v10 / (float)(v25 * v32);
      if (v33 <= 0.125) {
        double v34 = v33;
      }
      else {
        double v34 = 0.125;
      }
      uint64_t v35 = 3;
    }
    char v39 = 1;
    -[AVScrubber setShouldRecoverFromPrecisionScrubbingIfNeeded:](self, "setShouldRecoverFromPrecisionScrubbingIfNeeded:", 1, *(void *)&v64);
LABEL_15:
    if ([(AVScrubber *)self scrubbingSpeed] != v35)
    {
      [(AVScrubber *)self setScrubbingSpeed:v35];
      double v40 = [(AVScrubber *)self feedbackGenerator];
      [v40 selectionChanged];

      self->_didHaveLessThanFullScrubbingSpeedSinceTrackingBegin |= v39;
    }
    double v29 = 1.0;
    goto LABEL_18;
  }
  uint64_t v35 = 0;
  double v34 = 1.0;
  float v31 = v25;
LABEL_18:
  double v41 = v10 * v21;
  float v27 = v16 / v10;
  float v42 = fmin(fmax(v26 + v34 * v27, 0.0), v29);
  if (!v35)
  {
    if ([(AVScrubber *)self shouldRecoverFromPrecisionScrubbingIfNeeded])
    {
      float v53 = (v65 + -4.5) / v10;
      if (1.0 / v10 >= vabds_f32(v53, v42))
      {
        -[AVScrubber setShouldRecoverFromPrecisionScrubbingIfNeeded:](self, "setShouldRecoverFromPrecisionScrubbingIfNeeded:", 0, 1.0, 1.0 / v10);
      }
      else
      {
        double v54 = fmax(fabs(v64) / 84.0, 0.0);
        if (v54 >= 1.0) {
          double v55 = 0.0;
        }
        else {
          double v55 = 1.0 - v54;
        }
        float v56 = v55;
        float v57 = powf(v56, 3.0);
        float v58 = v57 + v57;
        if (v58 > 1.0) {
          float v58 = 1.0;
        }
        float v42 = fminf(fmaxf(v26 + (float)((float)(v53 - v26) * v58), 0.0), 1.0);
      }
    }
    else
    {
      [v5 locationInView:self];
      double v61 = v60;
      [(AVScrubber *)self bounds];
      -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
      if (v61 <= CGRectGetMinX(v67)
        || ([v5 locationInView:self],
            double v63 = v62,
            [(AVScrubber *)self bounds],
            -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:"),
            v63 >= CGRectGetMaxX(v68)))
      {
        float v42 = round(v26);
      }
    }
  }
  [(AVScrubber *)self minimumValue];
  float v44 = v43 + (float)(v42 * v31);
  *(float *)&double v45 = v44;
  [(AVScrubber *)self _updateSlowKnobMovementDetectedForTargetValue:v45];
  [(AVScrubber *)self setResolution:v41 / v34];
  double v46 = [(AVScrubber *)self window];
  uint64_t v47 = [v46 windowScene];
  if (v47)
  {
    double v48 = (void *)v47;
    double v49 = [(AVScrubber *)self window];
    double v50 = [v49 windowScene];
    uint64_t v51 = [v50 activationState];

    if (!v51)
    {
      *(float *)&double v52 = v44;
      [(AVScrubber *)self setValue:v52];
      [(AVScrubber *)self sendActionsForControlEvents:4096];
    }
  }
  else
  {
  }
LABEL_31:

  return 1;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AVScrubber *)self setHasChangedLocationAtLeastOnce:0];
  [(AVScrubber *)self setShouldRecoverFromPrecisionScrubbingIfNeeded:0];
  [(AVScrubber *)self setScrubbingSpeed:0];
  [v6 locationInView:self];
  double v9 = v8;
  double v11 = v10;
  if ([v6 _isPointerTouch])
  {
    double v12 = [(AVScrubber *)self currentThumbView];
    [v12 frame];
    v28.CGFloat x = v9;
    v28.CGFloat y = v11;
    [(AVScrubber *)self setScrubsWhenTappedAnywhere:!CGRectContainsPoint(v29, v28)];
  }
  else
  {
    [(AVScrubber *)self setScrubsWhenTappedAnywhere:0];
  }
  BOOL v13 = -[AVScrubber _shouldTrackTouchAtPoint:](self, "_shouldTrackTouchAtPoint:", v9, v11);
  if (v13)
  {
    double v14 = [(AVScrubber *)self feedbackGenerator];
    [v14 prepare];

    self->_trackingStartTime = CFAbsoluteTimeGetCurrent();
    self->_didHaveLessThanFullScrubbingSpeedSinceTrackingBegin = 0;
    objc_initWeak(&location, self);
    double v15 = (void *)MEMORY[0x1E4F1CB00];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __47__AVScrubber_beginTrackingWithTouch_withEvent___block_invoke;
    v25[3] = &unk_1E5FC4480;
    objc_copyWeak(&v26, &location);
    double v16 = [v15 scheduledTimerWithTimeInterval:1 repeats:v25 block:0.25];
    [(AVScrubber *)self setUpdateSlowKnobMovementDetectedTimer:v16];

    if ([(AVScrubber *)self scrubsWhenTappedAnywhere])
    {
      [(AVScrubber *)self maximumValue];
      float v18 = v17;
      [(AVScrubber *)self minimumValue];
      float v20 = v19;
      [(AVScrubber *)self bounds];
      -[AVScrubber trackRectForBounds:](self, "trackRectForBounds:");
      double v21 = v9 / CGRectGetWidth(v30) * (float)(v18 - v20);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __47__AVScrubber_beginTrackingWithTouch_withEvent___block_invoke_2;
      v23[3] = &unk_1E5FC41D0;
      objc_copyWeak(v24, &location);
      v24[1] = *(id *)&v21;
      dispatch_async(MEMORY[0x1E4F14428], v23);
      objc_destroyWeak(v24);
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __47__AVScrubber_beginTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSlowKnobMovementDetected];
}

void __47__AVScrubber_beginTrackingWithTouch_withEvent___block_invoke_2(uint64_t a1)
{
  double v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = *(double *)(a1 + 40);
  *(float *)&double v4 = v4;
  [WeakRetained setValue:v4];

  id v5 = objc_loadWeakRetained(v2);
  [v5 sendActionsForControlEvents:4096];
}

- (BOOL)isTracking
{
  v4.receiver = self;
  v4.super_class = (Class)AVScrubber;
  return [(AVScrubber *)&v4 isTracking] || [(AVScrubber *)self isScrollScrubbing];
}

- (void)setEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVScrubber;
  -[AVScrubber setEnabled:](&v5, sel_setEnabled_);
  if ([(AVScrubber *)self isTracking] && !a3)
  {
    [(AVScrubber *)self setTracking:0];
    [(AVScrubber *)self setHighlighted:0];
    [(AVScrubber *)self sendActionsForControlEvents:256];
  }
  [(AVScrubber *)self setNeedsLayout];
}

- (id)createThumbView
{
  v5.receiver = self;
  v5.super_class = (Class)AVScrubber;
  id v3 = [(AVScrubber *)&v5 createThumbView];
  [(AVScrubber *)self setCurrentThumbView:v3];
  return v3;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRectGetHeight(a3);
  UIRoundToViewScale();
  CGFloat v8 = v7;
  CGFloat v9 = x;
  CGFloat v10 = y;
  CGFloat v11 = width;
  CGFloat v12 = height;

  return CGRectInset(*(CGRect *)&v9, 0.0, v8);
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v10 = 9.0;
  if (([(AVScrubber *)self isEnabled] & 1) == 0)
  {
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    double v10 = CGRectGetHeight(v26);
  }
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGRectGetWidth(v27);
  [(AVScrubber *)self minimumValue];
  [(AVScrubber *)self maximumValue];
  [(AVScrubber *)self minimumValue];
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGRectGetMinX(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGRectGetMidY(v29);
  UIPointRoundToViewScale();
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  uint64_t v15 = *MEMORY[0x1E4F39EA0];
  double v16 = [(AVScrubber *)self currentThumbView];
  float v17 = [v16 layer];
  [v17 setCornerCurve:v15];

  v30.origin.CGFloat x = v12;
  v30.origin.CGFloat y = v14;
  v30.size.CGFloat width = v10;
  v30.size.CGFloat height = v10;
  CGRectGetHeight(v30);
  UIFloorToViewScale();
  double v19 = v18;
  float v20 = [(AVScrubber *)self currentThumbView];
  double v21 = [v20 layer];
  [v21 setCornerRadius:v19];

  double v22 = v12;
  double v23 = v14;
  double v24 = v10;
  double v25 = v10;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)minimumValueImageRectForBounds:(CGRect)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)setValue:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVScrubber;
  -[AVScrubber setValue:](&v5, sel_setValue_);
  if (![(AVScrubber *)self isScrollScrubbing])
  {
    [(AVScrubber *)self updateScrollViewContentSizeAndOffsetIfNeeded];
    double v4 = [(AVScrubber *)self scrollView];
    [(AVScrubber *)self contentOffsetFromValue];
    objc_msgSend(v4, "setContentOffset:");
  }
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(AVScrubber *)self isCollapsedOrExcluded];
  [(AVScrubber *)self extrinsicContentSize];
  if (v3) {
    double v4 = 0.0;
  }
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

- (BOOL)avkit_shouldPreventExternalGestureRecognizerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(AVScrubber *)self isTracking]) {
    return 1;
  }

  return -[AVScrubber _shouldTrackTouchAtPoint:](self, "_shouldTrackTouchAtPoint:", x, y);
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  if (a3.width != self->_extrinsicContentSize.width || a3.height != self->_extrinsicContentSize.height)
  {
    self->_extrinsicContentSize = a3;
    [(AVScrubber *)self invalidateIntrinsicContentSize];
    [(AVScrubber *)self _updateLayoutItem];
  }
}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    [(AVScrubber *)self _updateLayoutItem];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    [(AVScrubber *)self _updateLayoutItem];
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
  }
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    [(AVScrubber *)self _updateLayoutItem];
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
  }
}

- (BOOL)isCollapsedOrExcluded
{
  if ([(AVScrubber *)self isCollapsed] || ![(AVScrubber *)self isIncluded]) {
    return 1;
  }

  return [(AVScrubber *)self isRemoved];
}

- (void)layoutAttributesDidChange
{
  id v3 = [(AVScrubber *)self layoutAttributes];
  -[AVScrubber setCollapsed:](self, "setCollapsed:", [v3 isCollapsed]);
}

- (void)setShowsTimelineMarkers:(BOOL)a3
{
  if (self->_showsTimelineMarkers != a3)
  {
    BOOL v3 = a3;
    self->_showsTimelineMarkers = a3;
    double v5 = [(AVScrubber *)self interstitialOverlayViews];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      unint64_t v7 = 0;
      BOOL v8 = !v3;
      do
      {
        CGFloat v9 = [(AVScrubber *)self interstitialOverlayViews];
        double v10 = [v9 objectAtIndex:v7];

        [v10 setHidden:v8];
        ++v7;
        double v11 = [(AVScrubber *)self interstitialOverlayViews];
        unint64_t v12 = [v11 count];
      }
      while (v12 > v7);
    }
  }
}

- (void)setInterstitialDisplayTimes:(id)a3
{
  double v10 = (NSArray *)a3;
  if (self->_interstitialDisplayTimes != v10)
  {
    objc_storeStrong((id *)&self->_interstitialDisplayTimes, a3);
    double v5 = [(AVScrubber *)self interstitialOverlayViews];
    [v5 removeAllObjects];

    if ([(NSArray *)v10 count])
    {
      unint64_t v6 = 0;
      do
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4FB1838]);
        BOOL v8 = [MEMORY[0x1E4FB1618] whiteColor];
        [v7 setBackgroundColor:v8];

        [v7 setUserInteractionEnabled:0];
        CGFloat v9 = [(AVScrubber *)self interstitialOverlayViews];
        [v9 addObject:v7];

        ++v6;
      }
      while ([(NSArray *)v10 count] > v6);
    }
  }
}

- (void)setPhotosensitiveDisplayTimes:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v5 = (NSArray *)a3;
  if (self->_photosensitiveDisplayTimes != v5)
  {
    objc_storeStrong((id *)&self->_photosensitiveDisplayTimes, a3);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unint64_t v6 = [(AVScrubber *)self photosensitiveOverlayViews];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    double v11 = [(AVScrubber *)self photosensitiveOverlayViews];
    [v11 removeAllObjects];

    if ([(NSArray *)v5 count])
    {
      unint64_t v12 = 0;
      do
      {
        double v13 = [(NSArray *)v5 objectAtIndex:v12];
        [v13 risk];
        double v15 = v14;

        if (v15 >= 0.1)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4FB1838]);
          [v16 setUserInteractionEnabled:0];
          float v17 = [(AVScrubber *)self photosensitiveOverlayViews];
          [v17 addObject:v16];
        }
        ++v12;
      }
      while ([(NSArray *)v5 count] > v12);
    }
  }
}

- (double)timeIntervalSinceTrackingEnded
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(AVScrubber *)self timestampWhenTrackingEnded];
  return Current - v4;
}

- (void)setCurrentThumbView:(id)a3
{
  id obj = a3;
  p_currentThumbView = &self->_currentThumbView;
  id WeakRetained = objc_loadWeakRetained((id *)p_currentThumbView);

  if (WeakRetained != obj)
  {
    id v6 = objc_storeWeak((id *)p_currentThumbView, obj);
    uint64_t v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [obj setBackgroundColor:v7];
  }
}

- (NSString)localizedScrubbingSpeedName
{
  unint64_t v2 = [(AVScrubber *)self scrubbingSpeed];
  if (v2 > 3)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = AVLocalizedString(off_1E5FC4790[v2]);
  }

  return (NSString *)v3;
}

- (float)clampedEstimatedFrameRate
{
  [(AVScrubber *)self estimatedFrameRate];
  float v3 = 30.0;
  [(AVScrubber *)self estimatedFrameRate];
  if (v4 > 0.0) {
    return fminf(fmaxf(self->_estimatedFrameRate, 10.0), 480.0);
  }
  return v3;
}

- (void)setLoadedTimeRanges:(id)a3
{
  if (self->_loadedTimeRanges != a3)
  {
    float v4 = (NSArray *)[a3 copy];
    loadedTimeRanges = self->_loadedTimeRanges;
    self->_loadedTimeRanges = v4;

    [(AVScrubber *)self setNeedsLayout];
  }
}

- (NSMutableArray)previousScrubberVelocities
{
  previousScrubberVelocities = self->_previousScrubberVelocities;
  if (!previousScrubberVelocities)
  {
    float v4 = [MEMORY[0x1E4F1CA48] array];
    double v5 = self->_previousScrubberVelocities;
    self->_previousScrubberVelocities = v4;

    previousScrubberVelocities = self->_previousScrubberVelocities;
  }

  return previousScrubberVelocities;
}

- (UIView)loadedTrackOverlayView
{
  loadedTrackOverlayView = self->_loadedTrackOverlayView;
  if (!loadedTrackOverlayView)
  {
    float v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    double v5 = self->_loadedTrackOverlayView;
    self->_loadedTrackOverlayView = v4;

    id v6 = self->_loadedTrackOverlayView;
    uint64_t v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v6 setBackgroundColor:v7];

    [(UIView *)self->_loadedTrackOverlayView setUserInteractionEnabled:0];
    loadedTrackOverlayView = self->_loadedTrackOverlayView;
  }

  return loadedTrackOverlayView;
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  feedbackGenerator = self->_feedbackGenerator;
  if (!feedbackGenerator)
  {
    float v4 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4FB1C18]);
    double v5 = self->_feedbackGenerator;
    self->_feedbackGenerator = v4;

    feedbackGenerator = self->_feedbackGenerator;
  }

  return feedbackGenerator;
}

- (void)setScrubberParentHeight:(double)a3
{
  [(AVScrubber *)self newScrubberParentHeight];
  if (v5 != a3)
  {
    [(AVScrubber *)self setNewScrubberParentHeight:a3];
  }
}

- (AVScrubber)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)AVScrubber;
  float v3 = -[AVScrubber initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  float v4 = v3;
  if (v3)
  {
    [(AVScrubber *)v3 setSemanticContentAttribute:1];
    v4->_included = 1;
    *(_OWORD *)&v4->_hitRectInsets.double top = AVDefaultHitRectInsets_20550;
    *(_OWORD *)&v4->_hitRectInsets.double bottom = unk_1B0721458;
    v4->_canChangeScrubbingSpeed = 1;
    v4->_scrubsWhenTappedAnywhere = 0;
    v4->_currentScrubberParentdouble Height = 22.0;
    v4->_scrubberEnabledStatus = 0;
    double v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    interstitialOverlayViews = v4->_interstitialOverlayViews;
    v4->_interstitialOverlayViews = v5;

    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    photosensitiveOverlayViews = v4->_photosensitiveOverlayViews;
    v4->_photosensitiveOverlayViews = v7;

    uint64_t v9 = objc_alloc_init(AVLayoutItemAttributes);
    layoutAttributes = v4->_layoutAttributes;
    v4->_layoutAttributes = v9;

    double v11 = v4->_layoutAttributes;
    [(AVScrubber *)v4 intrinsicContentSize];
    -[AVLayoutItemAttributes setMinimumSize:](v11, "setMinimumSize:");
    [(AVLayoutItemAttributes *)v4->_layoutAttributes setCollapsed:[(AVScrubber *)v4 isCollapsed]];
    [(AVLayoutItemAttributes *)v4->_layoutAttributes setIncluded:[(AVScrubber *)v4 isIncluded]];
    [(AVLayoutItemAttributes *)v4->_layoutAttributes setHasFlexibleContentSize:1];
    unint64_t v12 = v4->_layoutAttributes;
    double v13 = [(AVScrubber *)v4 accessibilityIdentifier];
    [(AVLayoutItemAttributes *)v12 setAccessibilityIdentifier:v13];

    double v14 = objc_msgSend(MEMORY[0x1E4FB1818], "avkit_flatWhiteResizableTemplateImage");
    double v15 = [(AVScrubber *)v4 minimumTrackImageForState:0];

    if (v15 != v14)
    {
      LODWORD(v16) = 1.0;
      [(AVScrubber *)v4 setContentHuggingPriority:0 forAxis:v16];
      LODWORD(v17) = 1148846080;
      [(AVScrubber *)v4 setContentHuggingPriority:1 forAxis:v17];
      LODWORD(v18) = 1112014848;
      [(AVScrubber *)v4 setContentCompressionResistancePriority:0 forAxis:v18];
      LODWORD(v19) = *(_DWORD *)"";
      [(AVScrubber *)v4 setContentCompressionResistancePriority:1 forAxis:v19];
      [(AVScrubber *)v4 setMinimumTrackImage:v14 forState:0];
      [(AVScrubber *)v4 setMaximumTrackImage:v14 forState:0];
      [(AVScrubber *)v4 setThumbImage:v14 forState:0];
    }
  }
  return v4;
}

+ (id)keyPathsForValuesAffectingLocalizedScrubbingSpeedName
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"scrubbingSpeed"];
}

@end