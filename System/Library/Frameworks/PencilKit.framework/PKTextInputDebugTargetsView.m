@interface PKTextInputDebugTargetsView
- (NSArray)visualizationElements;
- (PKTextInputDebugTargetsView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setVisualizationElements:(id)a3;
@end

@implementation PKTextInputDebugTargetsView

- (PKTextInputDebugTargetsView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKTextInputDebugTargetsView;
  v3 = -[PKTextInputDebugTargetsView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKTextInputDebugTargetsView *)v3 setBackgroundColor:v4];

    [(PKTextInputDebugTargetsView *)v3 setUserInteractionEnabled:0];
    visualizationElements = v3->_visualizationElements;
    v3->_visualizationElements = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (void)setVisualizationElements:(id)a3
{
  if (self->_visualizationElements != a3)
  {
    v4 = (NSArray *)[a3 copy];
    visualizationElements = self->_visualizationElements;
    self->_visualizationElements = v4;

    self->_dashLinePhase = self->_dashLinePhase + 2.0;
    [(PKTextInputDebugTargetsView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)PKTextInputDebugTargetsView;
  -[PKTextInputDebugTargetsView drawRect:](&v36, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.8 blue:0.0 alpha:0.15];
  id v6 = [v5 colorWithAlphaComponent:0.3];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [(PKTextInputDebugTargetsView *)self visualizationElements];
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v12 = -[PKTextInputElement coordinateSpace]((uint64_t)v11);

        if (v12)
        {
          double v13 = -[PKTextInputElement frame]((uint64_t)v11);
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;
          v20 = -[PKTextInputElement coordinateSpace]((uint64_t)v11);
          double v21 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v20, self, v13, v15, v17, v19);
          double v23 = v22;
          double v25 = v24;
          double v27 = v26;

          v40.origin.x = v21;
          v40.origin.y = v23;
          v40.size.width = v25;
          v40.size.height = v27;
          v28 = CGPathCreateWithRoundedRect(v40, 4.0, 4.0, 0);
          CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v5 CGColor]);
          CGContextAddPath(CurrentContext, v28);
          CGContextFillPath(CurrentContext);
          id v29 = v6;
          CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v29 CGColor]);
          CGContextSetLineWidth(CurrentContext, 1.0);
          CGContextAddPath(CurrentContext, v28);
          CGContextStrokePath(CurrentContext);
          CGPathRelease(v28);
          v41.origin.x = -[PKTextInputElement hitToleranceFrameFromElementFrame:](v11, v21, v23, v25, v27);
          v30 = CGPathCreateWithRoundedRect(v41, 4.0, 4.0, 0);
          CGContextAddPath(CurrentContext, v30);
          CGContextSetLineWidth(CurrentContext, 2.0);
          CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v29 CGColor]);
          *(_OWORD *)lengths = xmmword_1C4829440;
          CGContextSetLineDash(CurrentContext, self->_dashLinePhase, lengths, 2uLL);
          CGContextStrokePath(CurrentContext);
          CGPathRelease(v30);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v8);
  }
}

- (NSArray)visualizationElements
{
  return self->_visualizationElements;
}

- (void).cxx_destruct
{
}

@end