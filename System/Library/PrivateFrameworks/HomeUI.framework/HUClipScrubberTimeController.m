@interface HUClipScrubberTimeController
- (BOOL)isAtMinimumZoom;
- (BOOL)portraitMode;
- (BOOL)userControlled;
- (HUClipScrubberTimeController)init;
- (double)_numberOfPosterFrameUnitsForEvent:(id)a3 timeScale:(double)a4;
- (double)clampGestureScale:(double)a3;
- (double)maximumGestureScale;
- (double)maximumPosterFrameDuration;
- (double)minimumPosterFrameDuration;
- (double)numberOfPosterFrameUnitsForEvent:(id)a3;
- (double)posterFrameWidthFromCameraLiveSource;
- (double)timeScale;
- (double)timelineWidthForEvent:(id)a3;
- (double)updateTimeScaleForGestureScale:(double)a3;
- (void)dealloc;
- (void)expandTimelineToMaximumZoom;
- (void)recalculateMaximumPosterFrameDuration:(id)a3;
- (void)setMaximumPosterFrameDuration:(double)a3;
- (void)setMinimumPosterFrameDuration:(double)a3;
- (void)setPortraitMode:(BOOL)a3;
- (void)setTimeScale:(double)a3;
- (void)setUserControlled:(BOOL)a3;
- (void)shrinkTimelineToMinimumZoom;
- (void)updateTimeScaleIfNeeded;
@end

@implementation HUClipScrubberTimeController

- (HUClipScrubberTimeController)init
{
  v3.receiver = self;
  v3.super_class = (Class)HUClipScrubberTimeController;
  result = [(HUClipScrubberTimeController *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_timeScale = xmmword_1BEA1AA00;
  }
  return result;
}

- (void)recalculateMaximumPosterFrameDuration:(id)a3
{
  id v4 = a3;
  [(HUClipScrubberTimeController *)self _numberOfPosterFrameUnitsForEvent:v4 timeScale:10.0];
  double v6 = v5;
  [v4 duration];
  double v8 = v7;

  double v9 = v8 / v6;
  [(HUClipScrubberTimeController *)self maximumPosterFrameDuration];
  if (v9 > v10) {
    [(HUClipScrubberTimeController *)self setMaximumPosterFrameDuration:v9];
  }
  [(HUClipScrubberTimeController *)self maximumPosterFrameDuration];
  [(HUClipScrubberTimeController *)self setMaximumPosterFrameDuration:fmax(v11, 2.0)];

  [(HUClipScrubberTimeController *)self updateTimeScaleIfNeeded];
}

- (void)updateTimeScaleIfNeeded
{
  [(HUClipScrubberTimeController *)self timeScale];
  if (v3 < 2.0 || ![(HUClipScrubberTimeController *)self userControlled])
  {
    [(HUClipScrubberTimeController *)self maximumPosterFrameDuration];
    [(HUClipScrubberTimeController *)self setTimeScale:fmax(v4, 2.0)];
  }
  if ([MEMORY[0x1E4F68FF8] shouldCacheScrubberTimeScale])
  {
    [MEMORY[0x1E4F68FF8] cachedScrubberTimeScale];
    if (v5 < 2.0) {
      double v5 = 2.0;
    }
    [(HUClipScrubberTimeController *)self setTimeScale:v5];
  }
}

- (double)maximumGestureScale
{
  [(HUClipScrubberTimeController *)self maximumPosterFrameDuration];
  double v4 = v3;
  [(HUClipScrubberTimeController *)self minimumPosterFrameDuration];
  return v4 / v5;
}

- (double)clampGestureScale:(double)a3
{
  [(HUClipScrubberTimeController *)self maximumGestureScale];
  if (result > a3) {
    double result = a3;
  }
  if (result < 1.0) {
    return 1.0;
  }
  return result;
}

- (double)updateTimeScaleForGestureScale:(double)a3
{
  [(HUClipScrubberTimeController *)self maximumPosterFrameDuration];
  double v6 = v5 / a3;
  [(HUClipScrubberTimeController *)self minimumPosterFrameDuration];
  if (v6 >= v7) {
    double v7 = v6;
  }
  [(HUClipScrubberTimeController *)self setTimeScale:v7];

  [(HUClipScrubberTimeController *)self timeScale];
  return result;
}

- (double)numberOfPosterFrameUnitsForEvent:(id)a3
{
  id v4 = a3;
  [(HUClipScrubberTimeController *)self timeScale];
  -[HUClipScrubberTimeController _numberOfPosterFrameUnitsForEvent:timeScale:](self, "_numberOfPosterFrameUnitsForEvent:timeScale:", v4);
  double v6 = v5;

  return v6;
}

- (double)_numberOfPosterFrameUnitsForEvent:(id)a3 timeScale:(double)a4
{
  id v6 = a3;
  [v6 duration];
  double v8 = v7;
  [(HUClipScrubberTimeController *)self timeScale];
  if (fabs(v9 + -10.0) >= 0.00000011920929)
  {
    double v11 = v8 / a4;
  }
  else
  {
    [v6 duration];
    double v11 = sqrt(v10);
  }
  float v12 = v11;
  if (v12 < 1.0) {
    float v12 = 1.0;
  }
  double v13 = v12;

  return v13;
}

- (double)timelineWidthForEvent:(id)a3
{
  id v4 = a3;
  [(HUClipScrubberTimeController *)self posterFrameWidth];
  double v6 = v5;
  [(HUClipScrubberTimeController *)self numberOfPosterFrameUnitsForEvent:v4];
  double v8 = v7;

  return v6 * v8;
}

- (double)posterFrameWidthFromCameraLiveSource
{
  BOOL v2 = [(HUClipScrubberTimeController *)self portraitMode];
  double result = 58.0;
  if (v2) {
    return 33.0;
  }
  return result;
}

- (BOOL)isAtMinimumZoom
{
  [(HUClipScrubberTimeController *)self maximumPosterFrameDuration];
  double v4 = v3;
  [(HUClipScrubberTimeController *)self timeScale];
  return v4 - v5 < 0.00000011920929;
}

- (void)expandTimelineToMaximumZoom
{
  [(HUClipScrubberTimeController *)self minimumPosterFrameDuration];

  -[HUClipScrubberTimeController setTimeScale:](self, "setTimeScale:");
}

- (void)shrinkTimelineToMinimumZoom
{
  [(HUClipScrubberTimeController *)self maximumPosterFrameDuration];

  -[HUClipScrubberTimeController setTimeScale:](self, "setTimeScale:");
}

- (void)dealloc
{
  if ([MEMORY[0x1E4F68FF8] shouldCacheScrubberTimeScale])
  {
    double v3 = (void *)MEMORY[0x1E4F68FF8];
    [(HUClipScrubberTimeController *)self timeScale];
    objc_msgSend(v3, "cacheScrubberTimeScale:");
  }
  v4.receiver = self;
  v4.super_class = (Class)HUClipScrubberTimeController;
  [(HUClipScrubberTimeController *)&v4 dealloc];
}

- (double)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(double)a3
{
  self->_timeScale = a3;
}

- (double)minimumPosterFrameDuration
{
  return self->_minimumPosterFrameDuration;
}

- (void)setMinimumPosterFrameDuration:(double)a3
{
  self->_minimumPosterFrameDuration = a3;
}

- (BOOL)portraitMode
{
  return self->_portraitMode;
}

- (void)setPortraitMode:(BOOL)a3
{
  self->_portraitMode = a3;
}

- (BOOL)userControlled
{
  return self->_userControlled;
}

- (void)setUserControlled:(BOOL)a3
{
  self->_userControlled = a3;
}

- (double)maximumPosterFrameDuration
{
  return self->_maximumPosterFrameDuration;
}

- (void)setMaximumPosterFrameDuration:(double)a3
{
  self->_maximumPosterFrameDuration = a3;
}

@end