@interface QLRoundProgressView
+ (Class)layerClass;
- (QLRoundProgressView)initWithFrame:(CGRect)a3;
- (double)progress;
- (void)didMoveToWindow;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
@end

@implementation QLRoundProgressView

- (QLRoundProgressView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)QLRoundProgressView;
  v3 = -[QLRoundProgressView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(QLRoundProgressView *)v3 setBackgroundColor:v4];

    v5 = v3;
  }

  return v3;
}

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)QLRoundProgressView;
  [(QLRoundProgressView *)&v8 didMoveToWindow];
  v3 = [(QLRoundProgressView *)self window];
  v4 = [v3 screen];
  [v4 scale];
  double v6 = v5;
  objc_super v7 = [(QLRoundProgressView *)self layer];
  [v7 setContentsScale:v6];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setProgress:(double)a3
{
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  double v5 = fmin(a3, 1.0);
  if (v5 >= 0.0) {
    double v6 = v5;
  }
  else {
    double v6 = 0.0;
  }
  if (a4)
  {
    objc_super v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"progress"];
    objc_super v8 = NSNumber;
    v9 = [(QLRoundProgressView *)self layer];
    v10 = [v9 presentationLayer];
    [v10 progress];
    v11 = objc_msgSend(v8, "numberWithDouble:");
    [v7 setFromValue:v11];

    v12 = [NSNumber numberWithDouble:v6];
    [v7 setToValue:v12];

    [v7 setDuration:0.2];
    v13 = [(QLRoundProgressView *)self layer];
    [v13 addAnimation:v7 forKey:@"progress"];
  }
  [MEMORY[0x263F158F8] begin];
  v14 = [(QLRoundProgressView *)self layer];
  [v14 setProgress:v6];

  v15 = (void *)MEMORY[0x263F158F8];

  [v15 commit];
}

- (double)progress
{
  v2 = [(QLRoundProgressView *)self layer];
  [v2 progress];
  double v4 = v3;

  return v4;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  [a3 progress];
  double v7 = v6 * 6.28318531 + -1.57079633;
  [(QLRoundProgressView *)self bounds];
  double v9 = v8 * 0.5;
  [(QLRoundProgressView *)self bounds];
  double v11 = v10 * 0.5;
  [(QLRoundProgressView *)self bounds];
  if (v12 < 40.0) {
    double v13 = 2.0;
  }
  else {
    double v13 = 4.0;
  }
  if (v9 >= v11) {
    double v14 = v11;
  }
  else {
    double v14 = v9;
  }
  CGFloat v15 = v14 - v13 * 0.5;
  CGContextSaveGState(a4);
  CGContextBeginPath(a4);
  CGContextMoveToPoint(a4, v9, v11);
  CGContextAddLineToPoint(a4, v9, 0.0);
  CGContextAddArc(a4, v9, v11, v15, -1.57079633, v7, 0);
  CGContextClosePath(a4);
  id v16 = [MEMORY[0x263F825C8] lightGrayColor];
  CGContextSetFillColorWithColor(a4, (CGColorRef)[v16 CGColor]);

  id v17 = [MEMORY[0x263F825C8] clearColor];
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v17 CGColor]);

  CGContextDrawPath(a4, kCGPathFillStroke);
  CGContextRestoreGState(a4);
  CGContextSaveGState(a4);
  CGContextBeginPath(a4);
  CGContextMoveToPoint(a4, v9 + v15, v11);
  CGContextAddArc(a4, v9, v11, v15, 0.0, 3.14159265, 1);
  CGContextAddArc(a4, v9, v11, v15, 3.14159265, 6.28318531, 1);
  CGContextClosePath(a4);
  id v18 = [MEMORY[0x263F825C8] clearColor];
  CGContextSetFillColorWithColor(a4, (CGColorRef)[v18 CGColor]);

  id v19 = [MEMORY[0x263F825C8] lightGrayColor];
  CGContextSetStrokeColorWithColor(a4, (CGColorRef)[v19 CGColor]);

  CGContextSetLineWidth(a4, v13);
  CGContextDrawPath(a4, kCGPathFillStroke);

  CGContextRestoreGState(a4);
}

@end