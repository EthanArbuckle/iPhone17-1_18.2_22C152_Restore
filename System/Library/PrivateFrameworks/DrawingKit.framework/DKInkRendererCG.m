@interface DKInkRendererCG
- (BOOL)drawingEnabled;
- (BOOL)initialized;
- (BOOL)scaleDrawingToFitCanvas;
- (BOOL)supportsBleedAnimation;
- (CGRect)invalidRect;
- (DKInkRendererCG)initWithCoder:(id)a3;
- (DKInkRendererCG)initWithFrame:(CGRect)a3;
- (DKInkRendererDelegate)delegate;
- (NSMutableArray)cachedInterpolatedBrushStrokes;
- (NSMutableArray)currentInterpolatedBrushStroke;
- (UIColor)inkColor;
- (double)drawingScale;
- (id)snapshotImage;
- (unint64_t)maximumPointsForBleedAnimation;
- (unint64_t)mode;
- (void)_commonInit;
- (void)addPoint:(id *)a3;
- (void)beginStroke;
- (void)clear;
- (void)dealloc;
- (void)display;
- (void)drawRect:(CGRect)a3;
- (void)endStroke;
- (void)removeLastStroke;
- (void)setCachedInterpolatedBrushStrokes:(id)a3;
- (void)setCurrentInterpolatedBrushStroke:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawingEnabled:(BOOL)a3;
- (void)setDrawingScale:(double)a3;
- (void)setInkColor:(id)a3;
- (void)setInvalidRect:(CGRect)a3;
- (void)setMode:(unint64_t)a3;
- (void)setScaleDrawingToFitCanvas:(BOOL)a3;
- (void)teardown;
@end

@implementation DKInkRendererCG

- (DKInkRendererCG)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DKInkRendererCG;
  v3 = -[DKInkRendererCG initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(DKInkRendererCG *)v3 _commonInit];
  }
  return v4;
}

- (DKInkRendererCG)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DKInkRendererCG;
  v3 = [(DKInkRendererCG *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(DKInkRendererCG *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(DKInkRendererCG *)self setClearsContextBeforeDrawing:0];
  [(DKInkRendererCG *)self setOpaque:1];
  [(DKInkRendererCG *)self setExclusiveTouch:1];
  id v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [(DKInkRendererCG *)self setBackgroundColor:v3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)DKInkRendererCG;
  [(DKInkRendererCG *)&v2 dealloc];
}

- (void)beginStroke
{
  CGSize v3 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  self->_invalidRect.origin = (CGPoint)*MEMORY[0x263F001A0];
  self->_invalidRect.size = v3;
  if (!self->_cachedInterpolatedBrushStrokes)
  {
    v4 = [MEMORY[0x263EFF980] arrayWithCapacity:200];
    cachedInterpolatedBrushStrokes = self->_cachedInterpolatedBrushStrokes;
    self->_cachedInterpolatedBrushStrokes = v4;
  }
  objc_super v6 = [MEMORY[0x263EFF980] arrayWithCapacity:2000];
  currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
  self->_currentInterpolatedBrushStroke = v6;
}

- (void)addPoint:(id *)a3
{
  long long v5 = *(_OWORD *)&a3->var1;
  v15[0] = a3->var0;
  v15[1] = v5;
  double var3 = a3->var3;
  objc_super v6 = objc_msgSend(MEMORY[0x263F08D40], "dk_valueWithRenderPoint:", v15);
  [(NSMutableArray *)self->_currentInterpolatedBrushStroke addObject:v6];
  double v7 = ClampToMinWidthCG(a3->var1, 1.0);
  double v8 = a3->var0.x - v7 * 0.5;
  double v9 = a3->var0.y - v7 * 0.5;
  p_invalidRect = &self->_invalidRect;
  if (CGRectIsNull(self->_invalidRect))
  {
    CGFloat v11 = v7;
  }
  else
  {
    v17.origin.x = p_invalidRect->origin.x;
    v17.origin.y = self->_invalidRect.origin.y;
    v17.size.width = self->_invalidRect.size.width;
    v17.size.height = self->_invalidRect.size.height;
    v18.origin.x = v8;
    v18.origin.y = v9;
    v18.size.width = v7;
    v18.size.height = v7;
    *(CGRect *)(&v11 - 3) = CGRectUnion(v17, v18);
    double v8 = v12;
    double v9 = v13;
    double v7 = v14;
  }
  p_invalidRect->origin.x = v8;
  self->_invalidRect.origin.y = v9;
  self->_invalidRect.size.width = v7;
  self->_invalidRect.size.height = v11;
}

- (void)endStroke
{
  if (self->_currentInterpolatedBrushStroke)
  {
    -[NSMutableArray addObject:](self->_cachedInterpolatedBrushStrokes, "addObject:");
    currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
  }
  else
  {
    currentInterpolatedBrushStroke = 0;
  }
  self->_currentInterpolatedBrushStroke = 0;
}

- (void)clear
{
  cachedInterpolatedBrushStrokes = self->_cachedInterpolatedBrushStrokes;
  self->_cachedInterpolatedBrushStrokes = 0;

  currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
  self->_currentInterpolatedBrushStroke = 0;

  CGSize v5 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  self->_invalidRect.origin = (CGPoint)*MEMORY[0x263F001A0];
  self->_invalidRect.size = v5;
  [(DKInkRendererCG *)self bounds];
  -[DKInkRendererCG setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
}

- (void)removeLastStroke
{
}

- (id)snapshotImage
{
  [(DKInkRendererCG *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v14.width = v7;
  v14.height = v9;
  UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
  -[DKInkRendererCG drawViewHierarchyInRect:afterScreenUpdates:](self, "drawViewHierarchyInRect:afterScreenUpdates:", 1, v4, v6, v8, v10);
  CGFloat v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v11;
}

- (BOOL)supportsBleedAnimation
{
  return 0;
}

- (unint64_t)maximumPointsForBleedAnimation
{
  return 0;
}

- (void)teardown
{
}

- (BOOL)initialized
{
  return 1;
}

- (void)display
{
  p_invalidRect = &self->_invalidRect;
  if (!CGRectIsNull(self->_invalidRect))
  {
    -[DKInkRendererCG setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", p_invalidRect->origin.x, p_invalidRect->origin.y, p_invalidRect->size.width, p_invalidRect->size.height);
    CGSize v4 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    p_invalidRect->origin = (CGPoint)*MEMORY[0x263F001A0];
    p_invalidRect->size = v4;
    id v5 = [(DKInkRendererCG *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 performSelector:sel_inkDidRender_ withObject:self];
    }
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v59 = *MEMORY[0x263EF8340];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  id v9 = [(DKInkRendererCG *)self inkColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v9 CGColor]);

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  double v10 = self->_cachedInterpolatedBrushStrokes;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v53 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v49;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v49 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v48 + 1) + 8 * j);
              uint64_t v47 = 0;
              long long v45 = 0u;
              long long v46 = 0u;
              if (v21)
              {
                objc_msgSend(v21, "dk_renderPointValue");
                double v23 = *((double *)&v45 + 1);
                double v22 = *(double *)&v45;
                double v24 = *(double *)&v46;
              }
              else
              {
                double v24 = 0.0;
                double v23 = 0.0;
                double v22 = 0.0;
              }
              double v25 = ClampToMinWidthCG(v24, 1.0);
              double v26 = v22 - v25 * 0.5;
              double v27 = v23 - v25 * 0.5;
              v60.origin.CGFloat x = v26;
              v60.origin.CGFloat y = v27;
              v60.size.CGFloat width = v25;
              v60.size.CGFloat height = v25;
              v64.origin.CGFloat x = x;
              v64.origin.CGFloat y = y;
              v64.size.CGFloat width = width;
              v64.size.CGFloat height = height;
              if (CGRectIntersectsRect(v60, v64))
              {
                v61.origin.CGFloat x = v26;
                v61.origin.CGFloat y = v27;
                v61.size.CGFloat width = v25;
                v61.size.CGFloat height = v25;
                CGContextFillEllipseInRect(CurrentContext, v61);
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v48 objects:v57 count:16];
          }
          while (v18);
        }
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v12);
  }

  currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
  if (currentInterpolatedBrushStroke)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v29 = currentInterpolatedBrushStroke;
    uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v41 objects:v56 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v41 + 1) + 8 * k);
          uint64_t v47 = 0;
          long long v45 = 0u;
          long long v46 = 0u;
          if (v34)
          {
            objc_msgSend(v34, "dk_renderPointValue", (void)v41);
            double v36 = *((double *)&v45 + 1);
            double v35 = *(double *)&v45;
            double v37 = *(double *)&v46;
          }
          else
          {
            double v37 = 0.0;
            double v36 = 0.0;
            double v35 = 0.0;
          }
          double v38 = ClampToMinWidthCG(v37, 1.0);
          double v39 = v35 - v38 * 0.5;
          double v40 = v36 - v38 * 0.5;
          v62.origin.CGFloat x = v39;
          v62.origin.CGFloat y = v40;
          v62.size.CGFloat width = v38;
          v62.size.CGFloat height = v38;
          v65.origin.CGFloat x = x;
          v65.origin.CGFloat y = y;
          v65.size.CGFloat width = width;
          v65.size.CGFloat height = height;
          if (CGRectIntersectsRect(v62, v65))
          {
            v63.origin.CGFloat x = v39;
            v63.origin.CGFloat y = v40;
            v63.size.CGFloat width = v38;
            v63.size.CGFloat height = v38;
            CGContextFillEllipseInRect(CurrentContext, v63);
          }
        }
        uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v41 objects:v56 count:16];
      }
      while (v31);
    }
  }
  CGContextRestoreGState(CurrentContext);
}

- (UIColor)inkColor
{
  return self->inkColor;
}

- (void)setInkColor:(id)a3
{
}

- (DKInkRendererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (DKInkRendererDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)scaleDrawingToFitCanvas
{
  return self->scaleDrawingToFitCanvas;
}

- (void)setScaleDrawingToFitCanvas:(BOOL)a3
{
  self->scaleDrawingToFitCanvas = a3;
}

- (double)drawingScale
{
  return self->drawingScale;
}

- (void)setDrawingScale:(double)a3
{
  self->drawingScale = a3;
}

- (unint64_t)mode
{
  return self->mode;
}

- (void)setMode:(unint64_t)a3
{
  self->mode = a3;
}

- (BOOL)drawingEnabled
{
  return self->drawingEnabled;
}

- (void)setDrawingEnabled:(BOOL)a3
{
  self->drawingEnabled = a3;
}

- (CGRect)invalidRect
{
  double x = self->_invalidRect.origin.x;
  double y = self->_invalidRect.origin.y;
  double width = self->_invalidRect.size.width;
  double height = self->_invalidRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInvalidRect:(CGRect)a3
{
  self->_invalidRect = a3;
}

- (NSMutableArray)cachedInterpolatedBrushStrokes
{
  return self->_cachedInterpolatedBrushStrokes;
}

- (void)setCachedInterpolatedBrushStrokes:(id)a3
{
}

- (NSMutableArray)currentInterpolatedBrushStroke
{
  return self->_currentInterpolatedBrushStroke;
}

- (void)setCurrentInterpolatedBrushStroke:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInterpolatedBrushStroke, 0);
  objc_storeStrong((id *)&self->_cachedInterpolatedBrushStrokes, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->inkColor, 0);
}

@end