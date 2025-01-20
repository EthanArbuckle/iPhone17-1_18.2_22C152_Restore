@interface MPDetailScrubController
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)detailedScrubbingEnabled;
- (BOOL)durationAllowsForDetailedScrubbing;
- (BOOL)isTracking;
- (MPDetailScrubController)init;
- (MPDetailScrubController)initWithScrubbingControl:(id)a3;
- (MPDetailScrubControllerDelegate)delegate;
- (MPDetailedScrubbing)scrubbingControl;
- (double)duration;
- (double)scrubbingVerticalRange;
- (float)_minimumScale;
- (float)_scaleForIdealValueForVerticalPosition:(double)a3;
- (float)scaleForVerticalPosition:(double)a3;
- (int64_t)currentScrubSpeed;
- (void)_beginScrubbing;
- (void)_commitValue:(float)a3;
- (void)_endScrubbing;
- (void)setDelegate:(id)a3;
- (void)setDetailedScrubbingEnabled:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setScrubbingControl:(id)a3;
- (void)setScrubbingVerticalRange:(double)a3;
@end

@implementation MPDetailScrubController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrubbingControl);

  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

- (int64_t)currentScrubSpeed
{
  return self->_currentScrubSpeed;
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

- (void)setDetailedScrubbingEnabled:(BOOL)a3
{
  self->_detailedScrubbingEnabled = a3;
}

- (BOOL)detailedScrubbingEnabled
{
  return self->_detailedScrubbingEnabled;
}

- (void)setScrubbingVerticalRange:(double)a3
{
  self->_scrubbingVerticalRange = a3;
}

- (double)scrubbingVerticalRange
{
  return self->_scrubbingVerticalRange;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDelegate:(id)a3
{
}

- (MPDetailScrubControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPDetailScrubControllerDelegate *)WeakRetained;
}

- (void)setScrubbingControl:(id)a3
{
}

- (MPDetailedScrubbing)scrubbingControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);

  return (MPDetailedScrubbing *)WeakRetained;
}

- (void)_commitValue:(float)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (self->_needsCommit)
  {
    v9 = WeakRetained;
    char v7 = objc_opt_respondsToSelector();
    v6 = v9;
    if (v7)
    {
      double v8 = self->_duration * a3;
      *(float *)&double v8 = v8;
      [v9 detailScrubController:self didChangeValue:v8];
      v6 = v9;
      self->_needsCommit = 0;
    }
  }
}

- (void)_endScrubbing
{
  if (self->_isTracking)
  {
    self->_isTracking = 0;
    self->_currentScrubSpeed = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained detailScrubControllerDidEndScrubbing:self];
    }
  }
}

- (void)_beginScrubbing
{
  if (!self->_isTracking)
  {
    self->_isTracking = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained detailScrubController:self didChangeScrubSpeed:0];
    }
    if (objc_opt_respondsToSelector()) {
      [WeakRetained detailScrubControllerDidBeginScrubbing:self];
    }
  }
}

- (float)_scaleForIdealValueForVerticalPosition:(double)a3
{
  double scrubbingVerticalRange = self->_scrubbingVerticalRange;
  double v4 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (scrubbingVerticalRange < v4) {
    double v4 = self->_scrubbingVerticalRange;
  }
  double v5 = v4 + -20.0;
  BOOL v6 = v4 == 20.0;
  BOOL v7 = v4 < 20.0;
  double v8 = 0.0;
  if (!v7 && !v6) {
    double v8 = v5;
  }
  float v9 = v8;
  float v10 = v9 / (scrubbingVerticalRange + -20.0);
  if (v10 <= 0.15)
  {
    float v10 = v10 / 0.15;
    float v11 = 0.33333;
  }
  else
  {
    float v11 = 0.025;
  }
  float v12 = powf(v10, v11);
  if (v12 <= 0.0) {
    float v13 = 1.0;
  }
  else {
    float v13 = 1.0 - v12;
  }
  if (v13 > 1.0) {
    float v13 = 1.0;
  }
  return fmaxf(v13, 0.0);
}

- (float)_minimumScale
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [WeakRetained bounds];
  float Width = CGRectGetWidth(v8);
  float duration = self->_duration;
  float v6 = (float)(Width / duration) / 20.0;

  return v6;
}

- (float)scaleForVerticalPosition:(double)a3
{
  double v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  double scrubbingVerticalRange = self->_scrubbingVerticalRange;
  double v8 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (scrubbingVerticalRange >= v8) {
    double scrubbingVerticalRange = v8;
  }
  if (v6 == 1) {
    double v9 = 20.0;
  }
  else {
    double v9 = 0.0;
  }
  if (v9 >= scrubbingVerticalRange) {
    double v10 = v9;
  }
  else {
    double v10 = scrubbingVerticalRange;
  }
  float v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v11 userInterfaceIdiom] == 1) {
    double v12 = 20.0;
  }
  else {
    double v12 = 0.0;
  }
  float v13 = v10 - v12;

  double v14 = v13;
  double v15 = self->_scrubbingVerticalRange;
  v16 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v16 userInterfaceIdiom] == 1) {
    double v17 = 20.0;
  }
  else {
    double v17 = 0.0;
  }
  float v18 = v14 / (v15 - v17);
  float v19 = 1.0 - v18;

  return v19;
}

- (BOOL)durationAllowsForDetailedScrubbing
{
  double duration = self->_duration;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubbingControl);
  [WeakRetained bounds];
  BOOL v4 = duration / CGRectGetWidth(v6) >= 0.1;

  return v4;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  p_scrubbingControl = &self->_scrubbingControl;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_scrubbingControl);
  [v6 locationInView:WeakRetained];
  double v9 = v8;
  double v11 = v10;

  float v12 = 1.0;
  if (self->_detailedScrubbingEnabled
    && [(MPDetailScrubController *)self durationAllowsForDetailedScrubbing])
  {
    [(MPDetailScrubController *)self scaleForVerticalPosition:v11];
    float v12 = v13;
    double v14 = v13;
    if (v14 <= 0.1)
    {
      int64_t v15 = 3;
    }
    else if (v14 > 0.35 || v14 <= 0.1)
    {
      int64_t v15 = v14 > 0.35 && (unint64_t)(v12 <= 0.75);
    }
    else
    {
      int64_t v15 = 2;
    }
    if (self->_currentScrubSpeed != v15)
    {
      self->_currentScrubSpeed = v15;
      [(UISelectionFeedbackGenerator *)self->_feedbackGenerator selectionChanged];
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [v16 detailScrubController:self didChangeScrubSpeed:self->_currentScrubSpeed];
      }
    }
  }
  [(MPDetailScrubController *)self _minimumScale];
  if (v17 < v12) {
    float v17 = v12;
  }
  if (!self->_didBeginTracking)
  {
    if (vabdd_f64(self->_beginLocationInView.x, v9) < 12.0) {
      goto LABEL_32;
    }
    self->_didBeginTracking = 1;
    self->_accumulatedDelta = 0.0;
  }
  float v18 = fminf(v17, 1.0);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  [WeakRetained bounds];
  double v21 = v20;
  if (isKindOfClass)
  {
    objc_msgSend(WeakRetained, "trackRectForBounds:");
    double v21 = v22;
  }
  double v23 = v9 - self->_previousLocationInView.x;
  [WeakRetained maximumValue];
  float v25 = v24;
  [WeakRetained minimumValue];
  double v27 = v23 * ((float)(v25 - v26) / v21);
  [WeakRetained value];
  float v29 = v28;
  double v30 = v28;
  double v31 = v28 + v27 * v18;
  [WeakRetained minimumValue];
  float v33 = v32;
  [WeakRetained maximumValue];
  double v35 = v34;
  if (v31 <= v35) {
    double v35 = v31;
  }
  if (v35 <= v33) {
    double v35 = v33;
  }
  float v36 = v35;
  if (vabds_f32(v36, v29) > 0.00000011921) {
    self->_needsCommit = 1;
  }
  if (vabdd_f64(self->_lastCommittedLocationInView.x, v9) <= 8.0
    && vabdd_f64(self->_lastCommittedLocationInView.y, v11) <= 4.0)
  {
    float v38 = v35 - v30 + self->_accumulatedDelta;
    self->_accumulatedDelta = v38;
  }
  else
  {
    double v37 = v35 + self->_accumulatedDelta;
    *(float *)&double v37 = v37;
    [(MPDetailScrubController *)self _commitValue:v37];
    self->_accumulatedDelta = 0.0;
    self->_lastCommittedLocationInView.x = v9;
    self->_lastCommittedLocationInView.y = v11;
  }
LABEL_32:
  self->_previousLocationInView.x = v9;
  self->_previousLocationInView.y = v11;

  return 1;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  self->_didBeginTracking = 0;
  p_scrubbingControl = &self->_scrubbingControl;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_scrubbingControl);
  [v6 locationInView:WeakRetained];
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [WeakRetained thumbHitRect];
  v17.x = v9;
  v17.y = v11;
  BOOL v12 = CGRectContainsPoint(v18, v17);
  if (v12)
  {
    self->_previousLocationInView.x = v9;
    self->_previousLocationInView.y = v11;
    self->_beginLocationInView.x = v9;
    self->_beginLocationInView.y = v11;
    [(MPDetailScrubController *)self _beginScrubbing];
    feedbackGenerator = self->_feedbackGenerator;
    if (!feedbackGenerator)
    {
      double v14 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4FB1C18]);
      int64_t v15 = self->_feedbackGenerator;
      self->_feedbackGenerator = v14;

      feedbackGenerator = self->_feedbackGenerator;
    }
    [(UISelectionFeedbackGenerator *)feedbackGenerator prepare];
  }

  return v12;
}

- (MPDetailScrubController)init
{
  return 0;
}

- (MPDetailScrubController)initWithScrubbingControl:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPDetailScrubController;
  double v5 = [(MPDetailScrubController *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrubbingControl, v4);
    v6->_double scrubbingVerticalRange = 220.0;
    v6->_detailedScrubbingEnabled = 1;
  }

  return v6;
}

@end