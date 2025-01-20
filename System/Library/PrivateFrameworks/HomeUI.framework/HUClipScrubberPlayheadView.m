@interface HUClipScrubberPlayheadView
- (BOOL)drawsUpperContent;
- (BOOL)editing;
- (HUClipScrubberPlayheadView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setDrawsUpperContent:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
@end

@implementation HUClipScrubberPlayheadView

- (HUClipScrubberPlayheadView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUClipScrubberPlayheadView;
  v3 = -[HUClipScrubberPlayheadView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HUClipScrubberPlayheadView *)v3 setOpaque:0];
    [(HUClipScrubberPlayheadView *)v4 setUserInteractionEnabled:0];
    [(HUClipScrubberPlayheadView *)v4 setAutoresizingMask:5];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double v17 = 0.0;
  double v18 = 0.0;
  double v16 = 0.0;
  objc_super v6 = objc_msgSend(MEMORY[0x1E4F428B8], "systemWhiteColor", a3.origin.x, a3.origin.y);
  [v6 getRed:&v18 green:&v17 blue:&v16 alpha:0];

  v7 = [MEMORY[0x1E4F428B8] colorWithRed:v18 green:v17 blue:v16 alpha:0.4];
  [v7 setFill];
  if ([(HUClipScrubberPlayheadView *)self drawsUpperContent])
  {
    [v7 setStroke];
    v8 = [MEMORY[0x1E4F428B8] colorWithRed:v18 green:v17 blue:v16 alpha:0.08];
    [v7 setFill];
    [v8 setStroke];
    v9 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", 0.0, 8.0, width, 6.0);
    [v9 fill];
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(CurrentContext, 2.0);
    v19.origin.x = 0.0;
    v19.origin.y = 8.0;
    v19.size.double height = 6.0;
    v19.size.double width = width;
    v11 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, CGRectGetMidX(v19) + -2.0, 0.0, 4.0, height, 4.0, 4.0);
    v12 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    [v12 setFill];

    [v11 fill];
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", 0.0, 14.0, width, 47.0);
    [v8 fill];
    v20.origin.x = 0.0;
    v20.origin.y = 14.0;
    v20.size.double width = width;
    v20.size.double height = 47.0;
    double v13 = CGRectGetMidX(v20) + -2.0;
    if ([(HUClipScrubberPlayheadView *)self editing]) {
      double v14 = 12.0;
    }
    else {
      double v14 = 14.0;
    }
    v9 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", v13, v14, 4.0, height);
    v15 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    [v15 setFill];

    [v9 fill];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    [(HUClipScrubberPlayheadView *)self setNeedsDisplay];
  }
}

- (BOOL)drawsUpperContent
{
  return self->_drawsUpperContent;
}

- (void)setDrawsUpperContent:(BOOL)a3
{
  self->_drawsUpperContent = a3;
}

- (BOOL)editing
{
  return self->_editing;
}

@end