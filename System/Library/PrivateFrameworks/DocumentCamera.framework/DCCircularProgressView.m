@interface DCCircularProgressView
- (CAShapeLayer)circleLayer;
- (CGPath)newPathForProgress:(double)a3;
- (NSProgress)observedProgress;
- (double)progress;
- (void)awakeFromNib;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCircleLayer:(id)a3;
- (void)setObservedProgress:(id)a3;
- (void)setProgress:(double)a3;
@end

@implementation DCCircularProgressView

- (void)dealloc
{
  [(NSProgress *)self->_observedProgress removeObserver:self forKeyPath:@"fractionCompleted" context:DCCircularProgressViewContext];
  v3.receiver = self;
  v3.super_class = (Class)DCCircularProgressView;
  [(DCCircularProgressView *)&v3 dealloc];
}

- (void)awakeFromNib
{
  v9.receiver = self;
  v9.super_class = (Class)DCCircularProgressView;
  [(DCCircularProgressView *)&v9 awakeFromNib];
  objc_super v3 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.3];
  v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
  circleLayer = self->_circleLayer;
  self->_circleLayer = v4;

  id v6 = v3;
  -[CAShapeLayer setFillColor:](self->_circleLayer, "setFillColor:", [v6 CGColor]);
  [(CAShapeLayer *)self->_circleLayer setFillRule:*MEMORY[0x263F15AC0]];
  v7 = [(DCCircularProgressView *)self newPathForProgress:0.1];
  [(CAShapeLayer *)self->_circleLayer setPath:v7];
  CGPathRelease(v7);
  v8 = [(DCCircularProgressView *)self layer];
  [v8 addSublayer:self->_circleLayer];
}

- (CGPath)newPathForProgress:(double)a3
{
  [(DCCircularProgressView *)self frame];
  CGFloat v6 = v5 * 0.5;
  Mutable = CGPathCreateMutable();
  [(DCCircularProgressView *)self bounds];
  CGRect v10 = CGRectInset(v9, 4.0, 4.0);
  CGPathAddEllipseInRect(Mutable, 0, v10);
  CGPathMoveToPoint(Mutable, 0, v6, v6);
  CGPathAddLineToPoint(Mutable, 0, v6, 8.0);
  CGPathAddArc(Mutable, 0, v6, v6, v6 + -8.0, -1.57079633, a3 * 6.28318531 + -1.57079633, 1);
  return Mutable;
}

- (void)setProgress:(double)a3
{
  double v4 = fmax(self->_progress, 0.1);
  double v5 = fmax(a3, 0.1);
  self->_progress = a3;
  id v17 = objc_alloc_init(MEMORY[0x263F157D8]);
  [v17 setKeyPath:@"path"];
  double v6 = v5 - v4;
  uint64_t v7 = (uint64_t)fmax(v6 / 0.1, 1.0);
  v8 = [MEMORY[0x263EFF980] array];
  CGRect v9 = [MEMORY[0x263EFF980] array];
  if (v7 >= 1)
  {
    for (uint64_t i = 1; i <= v7; ++i)
    {
      v11 = [(DCCircularProgressView *)self newPathForProgress:v4 + (float)((float)(int)i / (float)v7) * v6];
      [v8 addObject:v11];

      *(float *)&double v12 = (float)(int)i / (float)v7;
      v13 = [NSNumber numberWithFloat:v12];
      [v9 addObject:v13];
    }
  }
  [v17 setValues:v8];
  [v17 setKeyTimes:v9];
  uint64_t v14 = [v8 lastObject];
  v15 = [(DCCircularProgressView *)self circleLayer];
  [v15 setPath:v14];

  v16 = [(DCCircularProgressView *)self circleLayer];
  [v16 addAnimation:v17 forKey:@"path"];
}

- (void)setObservedProgress:(id)a3
{
  p_observedProgress = &self->_observedProgress;
  id v6 = a3;
  if (([v6 isEqual:*p_observedProgress] & 1) == 0)
  {
    [(NSProgress *)*p_observedProgress removeObserver:self forKeyPath:@"fractionCompleted" context:DCCircularProgressViewContext];
    objc_storeStrong((id *)&self->_observedProgress, a3);
    [(NSProgress *)*p_observedProgress addObserver:self forKeyPath:@"fractionCompleted" options:0 context:DCCircularProgressViewContext];
    if (*p_observedProgress)
    {
      [(NSProgress *)*p_observedProgress fractionCompleted];
      -[DCCircularProgressView setProgress:](self, "setProgress:");
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)DCCircularProgressViewContext == a6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __73__DCCircularProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v7[3] = &unk_2642A9250;
    v7[4] = self;
    dc_dispatchMainAfterDelay(v7, 0.0);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DCCircularProgressView;
    -[DCCircularProgressView observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void __73__DCCircularProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observedProgress];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) observedProgress];
    [v3 fractionCompleted];
    objc_msgSend(*(id *)(a1 + 32), "setProgress:");
  }
}

- (double)progress
{
  return self->_progress;
}

- (NSProgress)observedProgress
{
  return self->_observedProgress;
}

- (CAShapeLayer)circleLayer
{
  return self->_circleLayer;
}

- (void)setCircleLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);

  objc_storeStrong((id *)&self->_observedProgress, 0);
}

@end