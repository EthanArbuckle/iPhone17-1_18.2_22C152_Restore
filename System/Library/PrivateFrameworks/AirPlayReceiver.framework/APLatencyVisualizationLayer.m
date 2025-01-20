@interface APLatencyVisualizationLayer
- (id)init:(void *)a3 timeContext:(void *)a4 zPosition:(int)a5;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation APLatencyVisualizationLayer

- (void)drawInContext:(CGContext *)a3
{
  double v5 = ((double (*)(void *, SEL))self->_getAbsoluteTime)(self->_timeContext, a2);
  double dotOffset = self->_dotOffset;
  [(APLatencyVisualizationLayer *)self contentsScale];
  double v8 = dotOffset * v7;
  double dotDiameter = self->_dotDiameter;
  [(APLatencyVisualizationLayer *)self contentsScale];
  double v11 = dotDiameter * v10;
  double dotSpeedX = self->_dotSpeedX;
  [(APLatencyVisualizationLayer *)self frame];
  int v14 = (int)(v13 - (v8 + v8));
  unint64_t v15 = 2 * v14;
  unint64_t v16 = (unint64_t)(v5 * dotSpeedX) % v15;
  unint64_t v17 = v15 - v16;
  if (v16 <= v14) {
    unint64_t v18 = v16;
  }
  else {
    unint64_t v18 = v17;
  }
  double v19 = v8 + (double)v18;
  double dotSpeedY = self->_dotSpeedY;
  [(APLatencyVisualizationLayer *)self frame];
  int v22 = (int)(v21 - (v8 + v8));
  unint64_t v23 = 2 * v22;
  unint64_t v24 = (unint64_t)(v5 * dotSpeedY) % v23;
  unint64_t v25 = v23 - v24;
  if (v24 <= v22) {
    unint64_t v26 = v24;
  }
  else {
    unint64_t v26 = v25;
  }
  CGFloat v27 = v8 + (double)v26;
  CGContextSetLineWidth(a3, 2.0);
  CGContextSetRGBStrokeColor(a3, 1.0, 0.0, 0.0, 1.0);
  CGContextSetRGBFillColor(a3, 1.0, 0.0, 0.0, 1.0);
  v33.origin.x = v19;
  v33.origin.y = v27;
  v33.size.width = v11;
  v33.size.height = v11;
  CGContextStrokeEllipseInRect(a3, v33);
  double v28 = v19;
  CGFloat v29 = v27;
  double v30 = v11;
  double v31 = v11;

  CGContextFillEllipseInRect(a3, *(CGRect *)&v28);
}

- (id)init:(void *)a3 timeContext:(void *)a4 zPosition:(int)a5
{
  if ([(APLatencyVisualizationLayer *)self init])
  {
    [(APLatencyVisualizationLayer *)self setZPosition:(double)a5];
    [(APLatencyVisualizationLayer *)self setName:@"Latency Tracking Layer"];
    self->_getAbsoluteTime = a3;
    self->_timeContext = a4;
    self->_double dotOffset = 32.0;
    self->_double dotDiameter = 10.0;
    self->_dotSpeed = 500.0;
    self->_double dotSpeedX = 433.012702;
    self->_double dotSpeedY = self->_dotSpeed * 0.5;
  }
  return self;
}

@end