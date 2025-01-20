@interface ASVWorldGestureDragOffsetCorrector
- (ASVWorldGestureDragOffsetCorrector)initWithInitialDragOffset:(ASVWorldGestureDragOffsetCorrector *)self thresholdDragOffset:(SEL)a2;
- (double)initialDragOffset;
- (double)startTime;
- (double)thresholdDragOffset;
- (uint64_t)currentDragOffset;
- (void)setInitialDragOffset:(ASVWorldGestureDragOffsetCorrector *)self;
- (void)setStartTime:(double)a3;
- (void)setThresholdDragOffset:(ASVWorldGestureDragOffsetCorrector *)self;
@end

@implementation ASVWorldGestureDragOffsetCorrector

- (ASVWorldGestureDragOffsetCorrector)initWithInitialDragOffset:(ASVWorldGestureDragOffsetCorrector *)self thresholdDragOffset:(SEL)a2
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  v9.receiver = self;
  v9.super_class = (Class)ASVWorldGestureDragOffsetCorrector;
  v6 = [(ASVWorldGestureDragOffsetCorrector *)&v9 init];
  v7 = v6;
  if (v6)
  {
    *(void *)v6->_initialDragOffset = v5;
    *(void *)v6->_thresholdDragOffset = v4;
    v6->_startTime = CACurrentMediaTime();
  }
  return v7;
}

- (uint64_t)currentDragOffset
{
  double v2 = CACurrentMediaTime();
  [a1 startTime];
  if (v2 - v3 >= 0.25)
  {
    return [a1 initialDragOffset];
  }
  else
  {
    [a1 thresholdDragOffset];
    return [a1 initialDragOffset];
  }
}

- (double)initialDragOffset
{
  return *(double *)(a1 + 8);
}

- (void)setInitialDragOffset:(ASVWorldGestureDragOffsetCorrector *)self
{
  *(void *)self->_initialDragOffset = v2;
}

- (double)thresholdDragOffset
{
  return *(double *)(a1 + 16);
}

- (void)setThresholdDragOffset:(ASVWorldGestureDragOffsetCorrector *)self
{
  *(void *)self->_thresholdDragOffset = v2;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

@end