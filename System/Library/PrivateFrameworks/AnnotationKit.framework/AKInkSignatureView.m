@interface AKInkSignatureView
- (AKInkSignatureView)initWithCoder:(id)a3;
- (AKInkSignatureView)initWithFrame:(CGRect)a3;
- (BOOL)hasStrokes;
- (CGPath)copyPotracedPathAndReturnDrawing:(id *)a3;
- (PKCanvasView)canvasView;
- (PKDrawing)latestDrawing;
- (PKTool)tool;
- (UIColor)strokeColor;
- (void)_commonInit;
- (void)_updateTool;
- (void)canvasViewDrawingDidChange:(id)a3;
- (void)clear;
- (void)layoutSubviews;
- (void)setCanvasView:(id)a3;
- (void)setHasStrokes:(BOOL)a3;
- (void)setLatestDrawing:(id)a3;
- (void)setStrokeColor:(id)a3;
- (void)setTool:(id)a3;
@end

@implementation AKInkSignatureView

- (AKInkSignatureView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKInkSignatureView;
  v3 = -[AKInkSignatureView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AKInkSignatureView *)v3 _commonInit];
  }
  return v4;
}

- (AKInkSignatureView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKInkSignatureView;
  v3 = [(AKInkSignatureView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AKInkSignatureView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  id v3 = [MEMORY[0x263F1C550] blackColor];
  [(AKInkSignatureView *)self setStrokeColor:v3];
}

- (void)layoutSubviews
{
  id v3 = [(AKInkSignatureView *)self canvasView];

  if (!v3)
  {
    [(AKInkSignatureView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = [(AKInkSignatureView *)self superview];
    if (v12)
    {
      id v29 = (id)v12;
      uint64_t v13 = [(AKInkSignatureView *)self window];
      if (v13)
      {
        v14 = (void *)v13;
        v31.origin.x = v5;
        v31.origin.y = v7;
        v31.size.width = v9;
        v31.size.height = v11;
        BOOL IsEmpty = CGRectIsEmpty(v31);

        if (IsEmpty) {
          return;
        }
        id v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F14AD0]), "initWithFrame:", v5, v7, v9, v11);
        [v29 setDrawingPolicy:1];
        [(AKInkSignatureView *)self setCanvasView:v29];
        [v29 setDelegate:self];
        v16 = [(AKInkSignatureView *)self tool];
        [v29 setTool:v16];

        [(AKInkSignatureView *)self addSubview:v29];
        [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
        v17 = [v29 widthAnchor];
        v18 = [(AKInkSignatureView *)self widthAnchor];
        v19 = [v17 constraintEqualToAnchor:v18];
        [v19 setActive:1];

        v20 = [v29 heightAnchor];
        v21 = [(AKInkSignatureView *)self heightAnchor];
        v22 = [v20 constraintEqualToAnchor:v21];
        [v22 setActive:1];

        v23 = [v29 centerXAnchor];
        v24 = [(AKInkSignatureView *)self centerXAnchor];
        v25 = [v23 constraintEqualToAnchor:v24];
        [v25 setActive:1];

        v26 = [v29 centerYAnchor];
        v27 = [(AKInkSignatureView *)self centerYAnchor];
        v28 = [v26 constraintEqualToAnchor:v27];
        [v28 setActive:1];
      }
    }
  }
}

- (void)setStrokeColor:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x263F14B50];
  id v5 = a3;
  id v6 = [v4 alloc];
  double v7 = (void *)[v6 initWithInkType:*MEMORY[0x263F14CC0] color:v5];

  [(AKInkSignatureView *)self setTool:v7];

  MEMORY[0x270F9A6D0](self, sel__updateTool);
}

- (void)_updateTool
{
  id v4 = [(AKInkSignatureView *)self canvasView];
  if (v4)
  {
    id v3 = [(AKInkSignatureView *)self tool];
    [v4 setTool:v3];
  }
}

- (void)clear
{
  [(AKInkSignatureView *)self setLatestDrawing:0];
  id v3 = [(AKInkSignatureView *)self canvasView];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F14AE0]);
    id v9 = (id)objc_opt_new();
    id v5 = [(AKInkSignatureView *)self canvasView];
    id v6 = [v5 drawing];
    double v7 = (void *)[v4 initWithStrokes:v9 fromDrawing:v6];
    double v8 = [(AKInkSignatureView *)self canvasView];
    [v8 setDrawing:v7];
  }
}

- (CGPath)copyPotracedPathAndReturnDrawing:(id *)a3
{
  id v4 = [(AKInkSignatureView *)self latestDrawing];
  id v5 = v4;
  if (!v4)
  {
    v15 = 0;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  [v4 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v10 = +[AKInkRendererHelper renderDrawing:clippedToStrokeSpaceRect:scale:](AKInkRendererHelper, "renderDrawing:clippedToStrokeSpaceRect:scale:", v5);
  double v11 = v10;
  if (v10)
  {
    uint64_t v12 = -[AKPotrace initWithCGImage:flipped:whiteIsInside:]([AKPotrace alloc], "initWithCGImage:flipped:whiteIsInside:", [v10 akCGImage], 1, 0);
    uint64_t v13 = v12;
    if (v12)
    {
      [(AKPotrace *)v12 setTurdsize:0];
      MutableCopy = CGPathCreateMutableCopy([(AKPotrace *)v13 CGPath]);
      long long v19 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v24.a = *MEMORY[0x263F000D0];
      long long v18 = *(_OWORD *)&v24.a;
      *(_OWORD *)&v24.c = v19;
      *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      long long v17 = *(_OWORD *)&v24.tx;
      CGAffineTransformMakeScale(&t2, 0.333333333, 0.333333333);
      *(_OWORD *)&t1.a = v18;
      *(_OWORD *)&t1.c = v19;
      *(_OWORD *)&t1.tx = v17;
      CGAffineTransformConcat(&v24, &t1, &t2);
      CGAffineTransformMakeTranslation(&v21, v7, v9);
      CGAffineTransform v20 = v24;
      CGAffineTransformConcat(&t1, &v20, &v21);
      CGAffineTransform v24 = t1;
      v15 = (CGPath *)MEMORY[0x237E1D700](MutableCopy, &v24);
      CGPathRelease(MutableCopy);
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  if (a3) {
LABEL_11:
  }
    *a3 = (id)objc_msgSend(v5, "copy", v17, v18, v19);
LABEL_12:

  return v15;
}

- (void)canvasViewDrawingDidChange:(id)a3
{
  uint64_t v4 = [a3 drawing];
  if (v4)
  {
    double v6 = (void *)v4;
    [(AKInkSignatureView *)self setLatestDrawing:v4];
    id v5 = [v6 strokes];
    -[AKInkSignatureView setHasStrokes:](self, "setHasStrokes:", [v5 count] != 0);
  }

  MEMORY[0x270F9A758]();
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (BOOL)hasStrokes
{
  return self->_hasStrokes;
}

- (void)setHasStrokes:(BOOL)a3
{
  self->_hasStrokes = a3;
}

- (PKCanvasView)canvasView
{
  return (PKCanvasView *)objc_getProperty(self, a2, 424, 1);
}

- (void)setCanvasView:(id)a3
{
}

- (PKTool)tool
{
  return (PKTool *)objc_getProperty(self, a2, 432, 1);
}

- (void)setTool:(id)a3
{
}

- (PKDrawing)latestDrawing
{
  return (PKDrawing *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLatestDrawing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestDrawing, 0);
  objc_storeStrong((id *)&self->_tool, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);

  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end