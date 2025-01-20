@interface QLMediaScrubberGesture
- (QLMediaScrubberGesture)initWithPlayer:(id)a3;
- (QLMediaScrubberGestureDelegate)scrubberDelegate;
- (float)clampedEstimatedFrameRate;
- (float)maximumValue;
- (float)minimumValue;
- (float)nominalFrameRate;
- (float)value;
- (void)scrubbGestureDidChange:(id)a3;
- (void)setMaximumValue:(float)a3;
- (void)setMinimumValue:(float)a3;
- (void)setScrubberDelegate:(id)a3;
- (void)setValue:(float)a3;
@end

@implementation QLMediaScrubberGesture

- (QLMediaScrubberGesture)initWithPlayer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLMediaScrubberGesture;
  v6 = [(QLMediaScrubberGesture *)&v10 initWithTarget:self action:sel_scrubbGestureDidChange_];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v8 = v7;
  }

  return v7;
}

- (float)nominalFrameRate
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(AVPlayer *)self->_player currentItem];
  v4 = [v3 asset];
  id v5 = [v4 tracksWithMediaType:*MEMORY[0x263EF9D48]];

  memset(&v22, 0, sizeof(v22));
  player = self->_player;
  if (player) {
    [(AVPlayer *)player currentTime];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (v12) {
          [*(id *)(*((void *)&v18 + 1) + 8 * i) timeRange];
        }
        else {
          memset(&range, 0, sizeof(range));
        }
        CMTime v16 = v22;
        if (CMTimeRangeContainsTime(&range, &v16))
        {
          [v12 nominalFrameRate];
          float v13 = v14;
          goto LABEL_16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  float v13 = NAN;
LABEL_16:

  return v13;
}

- (float)clampedEstimatedFrameRate
{
  double estimatedFrameRate = self->_estimatedFrameRate;
  float result = 30.0;
  if (estimatedFrameRate > 0.0) {
    return fmin(fmax(estimatedFrameRate, 10.0), 480.0);
  }
  return result;
}

- (void)scrubbGestureDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(QLMediaScrubberGesture *)self view];
  [(QLMediaScrubberGesture *)self locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  if ([v4 state] == 1)
  {
    [(QLMediaScrubberGesture *)self nominalFrameRate];
    self->_double estimatedFrameRate = v10;
    player = self->_player;
    if (player) {
      [(AVPlayer *)player currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
    v34 = [(AVPlayer *)self->_player currentItem];
    v35 = [v34 asset];
    v36 = v35;
    if (v35) {
      [v35 duration];
    }
    else {
      memset(&v43, 0, sizeof(v43));
    }
    float v37 = Seconds / CMTimeGetSeconds(&v43);
    self->_value = v37;

    self->_startTouchLocationInView.x = v7;
    self->_startTouchLocationInView.CGFloat y = v9;
    v12 = [(QLMediaScrubberGesture *)self scrubberDelegate];
    [v12 scrubberDidStartScrubbing:self];
  }
  else if ([v4 state] == 3)
  {
    v12 = [(QLMediaScrubberGesture *)self scrubberDelegate];
    [v12 scrubberDidEndScrubbing:self];
  }
  else
  {
    float v13 = [(QLMediaScrubberGesture *)self view];
    [v13 bounds];
    double v15 = v14 + -40.0;

    [(QLMediaScrubberGesture *)self maximumValue];
    float v17 = v16;
    [(QLMediaScrubberGesture *)self minimumValue];
    float v19 = v17 - v18;
    double v20 = v7 - self->_previousTouchLocationInView.x;
    long long v21 = [(QLMediaScrubberGesture *)self view];
    [v21 center];

    CGFloat y = self->_startTouchLocationInView.y;
    BOOL v23 = v9 <= y;
    *(float *)&CGFloat y = 1.0 - fabs(v9 / y);
    double v24 = *(float *)&y;
    if (v23) {
      double v25 = v24;
    }
    else {
      double v25 = 0.0;
    }
    [(QLMediaScrubberGesture *)self value];
    float v27 = v26;
    [(QLMediaScrubberGesture *)self minimumValue];
    float v29 = (float)(v27 - v28) / v19;
    float v30 = v20 / v15;
    if (v25 <= 0.75)
    {
      double v32 = 0.25;
      if (v25 > 0.25) {
        double v38 = 0.5;
      }
      else {
        double v38 = 1.0;
      }
      if (v25 <= 0.5) {
        double v32 = v38;
      }
    }
    else
    {
      [(QLMediaScrubberGesture *)self clampedEstimatedFrameRate];
      double v32 = v15 / (float)(v19 * v31);
      if (v32 > 0.125) {
        double v32 = 0.125;
      }
    }
    float v39 = fmin(fmax(v29 + v32 * v30, 0.0), 1.0);
    [(QLMediaScrubberGesture *)self minimumValue];
    float v41 = v40 + (float)(v39 * v19);
    self->_value = v41;
    self->_previousTouchLocationInView.x = v7;
    self->_previousTouchLocationInView.CGFloat y = v9;
    v12 = [(QLMediaScrubberGesture *)self scrubberDelegate];
    *(float *)&double v42 = v41;
    [v12 scrubber:self didChangeValue:v42];
  }
}

- (QLMediaScrubberGestureDelegate)scrubberDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubberDelegate);

  return (QLMediaScrubberGestureDelegate *)WeakRetained;
}

- (void)setScrubberDelegate:(id)a3
{
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
}

- (float)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(float)a3
{
  self->_minimumValue = a3;
}

- (float)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(float)a3
{
  self->_maximumValue = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrubberDelegate);

  objc_storeStrong((id *)&self->_player, 0);
}

@end