@interface DKInkRendererGL
- (BOOL)canBecomeFirstResponder;
- (BOOL)drawingEnabled;
- (BOOL)initialized;
- (BOOL)scaleDrawingToFitCanvas;
- (BOOL)supportsBleedAnimation;
- (DKInkRendererDelegate)delegate;
- (DKInkRendererGL)initWithFrame:(CGRect)a3;
- (UIColor)inkColor;
- (double)drawingScale;
- (id)snapshotImage;
- (unint64_t)maximumPointsForBleedAnimation;
- (unint64_t)mode;
- (void)_commonInit;
- (void)addPoint:(id *)a3;
- (void)addPointsFromBrushPointQueueWithSegmentLength:(unint64_t)a3;
- (void)beginStroke;
- (void)clear;
- (void)completeAnimationsImmediately;
- (void)dealloc;
- (void)display;
- (void)displayForcefully;
- (void)drawRect:(CGRect)a3;
- (void)endStroke;
- (void)flush;
- (void)force;
- (void)layoutSubviews;
- (void)removeLastStroke;
- (void)rendererDidFinishAnimatingDrawing:(id)a3;
- (void)resetRendererState;
- (void)setDelegate:(id)a3;
- (void)setDrawingEnabled:(BOOL)a3;
- (void)setDrawingScale:(double)a3;
- (void)setInkColor:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setScaleDrawingToFitCanvas:(BOOL)a3;
- (void)teardown;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DKInkRendererGL

- (DKInkRendererGL)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (void *)[objc_alloc(MEMORY[0x263F146E8]) initWithAPI:2];
  v13.receiver = self;
  v13.super_class = (Class)DKInkRendererGL;
  v9 = -[GLKView initWithFrame:context:](&v13, sel_initWithFrame_context_, v8, x, y, width, height);
  if (v9)
  {
    v10 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(DKInkRendererGL *)v9 setBackgroundColor:v10];

    [(GLKView *)v9 setDrawableColorFormat:0];
    [(GLKView *)v9 setDrawableDepthFormat:0];
    [(GLKView *)v9 setDrawableStencilFormat:0];
    [(GLKView *)v9 setDrawableMultisample:0];
    [(GLKView *)v9 setEnableSetNeedsDisplay:0];
    v11 = [MEMORY[0x263F1C920] mainScreen];
    [v11 scale];
    -[GLKView setContentScaleFactor:](v9, "setContentScaleFactor:");

    [(DKInkRendererGL *)v9 _commonInit];
  }

  return v9;
}

- (void)_commonInit
{
  v3 = [MEMORY[0x263EFF980] array];
  brushStrokes = self->_brushStrokes;
  self->_brushStrokes = v3;

  v5 = [MEMORY[0x263EFF980] arrayWithCapacity:1000];
  brushPointQueue = self->_brushPointQueue;
  self->_brushPointQueue = v5;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)DKInkRendererGL;
  [(GLKView *)&v20 layoutSubviews];
  v3 = (void *)MEMORY[0x263F146E8];
  v4 = [(GLKView *)self context];
  [v3 setCurrentContext:v4];

  if (self->_initialized
    || ([(DKInkRendererGL *)self window],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    +[DKGLUtilities setCurrentClearColor];
    glClear(0x4000u);
    inkRenderer = self->_inkRenderer;
    [(DKInkRendererGL *)self bounds];
    -[DKOpenGLRenderer setBounds:](inkRenderer, "setBounds:");
  }
  else
  {
    self->_initialized = 1;
    +[DKGLUtilities setCurrentClearColor];
    glEnable(0xBE2u);
    glBlendFunc(0x302u, 0x303u);
    if (!self->_inkRenderer)
    {
      v7 = [DKOpenGLRenderer alloc];
      [(DKInkRendererGL *)self bounds];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      v16 = [MEMORY[0x263F1C920] mainScreen];
      [v16 scale];
      v18 = -[DKOpenGLRenderer initWithBounds:scale:](v7, "initWithBounds:scale:", v9, v11, v13, v15, v17);
      v19 = self->_inkRenderer;
      self->_inkRenderer = v18;

      [(DKOpenGLRenderer *)self->_inkRenderer setInkColor:self->_inkColor];
      [(DKOpenGLRenderer *)self->_inkRenderer setLineWidthScale:self->_drawingScale];
      [(DKOpenGLRenderer *)self->_inkRenderer setUndoEnabled:self->_mode == 0];
      [(DKOpenGLRenderer *)self->_inkRenderer setDelegate:self];
    }
    glClear(0x4000u);
  }
  [(DKOpenGLRenderer *)self->_inkRenderer setInkColor:self->_inkColor];
}

- (id)snapshotImage
{
  if (+[DKGLUtilities gpuAvailable])
  {
    v5.receiver = self;
    v5.super_class = (Class)DKInkRendererGL;
    v3 = [(GLKView *)&v5 snapshot];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)dealloc
{
  v3 = (void *)MEMORY[0x263F146E8];
  v4 = [(GLKView *)self context];
  [v3 setCurrentContext:v4];

  [(DKInkRendererGL *)self setDelegate:0];
  inkRenderer = self->_inkRenderer;
  self->_inkRenderer = 0;

  v6 = [MEMORY[0x263F146E8] currentContext];
  v7 = [(GLKView *)self context];

  if (v6 == v7) {
    [MEMORY[0x263F146E8] setCurrentContext:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)DKInkRendererGL;
  [(GLKView *)&v8 dealloc];
}

- (void)beginStroke
{
  v3 = [MEMORY[0x263EFF980] array];
  currentBrushStroke = self->_currentBrushStroke;
  self->_currentBrushStroke = v3;

  inkRenderer = self->_inkRenderer;
  [(DKOpenGLRenderer *)inkRenderer didBeginNewStroke];
}

- (void)addPoint:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var1;
  v6[0] = a3->var0;
  v6[1] = v4;
  double var3 = a3->var3;
  objc_super v5 = objc_msgSend(MEMORY[0x263F08D40], "dk_valueWithRenderPoint:", v6);
  [(NSMutableArray *)self->_currentBrushStroke addObject:v5];
  [(NSMutableArray *)self->_brushPointQueue addObject:v5];
}

- (void)endStroke
{
  if (self->_currentBrushStroke) {
    -[NSMutableArray addObject:](self->_brushStrokes, "addObject:");
  }
  inkRenderer = self->_inkRenderer;
  [(DKOpenGLRenderer *)inkRenderer didCompleteStroke];
}

- (void)clear
{
  [(NSMutableArray *)self->_brushPointQueue removeAllObjects];
  [(NSMutableArray *)self->_currentBrushStroke removeAllObjects];
  brushStrokes = self->_brushStrokes;
  [(NSMutableArray *)brushStrokes removeAllObjects];
}

- (void)resetRendererState
{
  id v5 = [MEMORY[0x263F146E8] currentContext];
  v3 = (void *)MEMORY[0x263F146E8];
  long long v4 = [(GLKView *)self context];
  [v3 setCurrentContext:v4];

  [(DKOpenGLRenderer *)self->_inkRenderer resetRendererState];
  [MEMORY[0x263F146E8] setCurrentContext:v5];
}

- (void)completeAnimationsImmediately
{
  id v5 = [MEMORY[0x263F146E8] currentContext];
  v3 = (void *)MEMORY[0x263F146E8];
  long long v4 = [(GLKView *)self context];
  [v3 setCurrentContext:v4];

  [(DKOpenGLRenderer *)self->_inkRenderer updateDryForcefully];
  [MEMORY[0x263F146E8] setCurrentContext:v5];
}

- (void)removeLastStroke
{
  id v5 = [MEMORY[0x263F146E8] currentContext];
  v3 = (void *)MEMORY[0x263F146E8];
  long long v4 = [(GLKView *)self context];
  [v3 setCurrentContext:v4];

  [(NSMutableArray *)self->_brushStrokes removeLastObject];
  [(DKOpenGLRenderer *)self->_inkRenderer undo];
  [MEMORY[0x263F146E8] setCurrentContext:v5];
}

- (void)setInkColor:(id)a3
{
  objc_storeStrong((id *)&self->_inkColor, a3);
  id v5 = a3;
  -[DKOpenGLRenderer setInkColor:](self->_inkRenderer, "setInkColor:");
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(DKOpenGLRenderer *)self->_inkRenderer setUndoEnabled:a3 != 1];
  }
}

- (void)force
{
  id v5 = [MEMORY[0x263F146E8] currentContext];
  v3 = (void *)MEMORY[0x263F146E8];
  long long v4 = [(GLKView *)self context];
  [v3 setCurrentContext:v4];

  [(DKOpenGLRenderer *)self->_inkRenderer setIgnoreFirstUndoItem:1];
  [(DKOpenGLRenderer *)self->_inkRenderer didBeginNewStroke];
  [(DKInkRendererGL *)self displayForcefully];
  [(DKOpenGLRenderer *)self->_inkRenderer didCompleteStroke];
  [MEMORY[0x263F146E8] setCurrentContext:v5];
}

- (void)flush
{
  id v5 = [MEMORY[0x263F146E8] currentContext];
  v3 = (void *)MEMORY[0x263F146E8];
  long long v4 = [(GLKView *)self context];
  [v3 setCurrentContext:v4];

  glFlush();
  [MEMORY[0x263F146E8] setCurrentContext:v5];
}

- (BOOL)supportsBleedAnimation
{
  return 1;
}

- (unint64_t)maximumPointsForBleedAnimation
{
  return 7000;
}

- (void)setDrawingScale:(double)a3
{
  self->_drawingScale = a3;
  -[DKOpenGLRenderer setLineWidthScale:](self->_inkRenderer, "setLineWidthScale:");
}

- (void)display
{
  v4.receiver = self;
  v4.super_class = (Class)DKInkRendererGL;
  [(GLKView *)&v4 display];
  if (self->_needToNotify)
  {
    v3 = [(DKInkRendererGL *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 performSelector:sel_inkDidRender_ withObject:self afterDelay:0.0];
    }
    self->_needToNotifdouble y = 0;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DKInkRendererGL;
  [(DKInkRendererGL *)&v8 traitCollectionDidChange:v4];
  id v5 = [(DKInkRendererGL *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(DKInkRendererGL *)self force];
  }
}

- (void)drawRect:(CGRect)a3
{
  objc_msgSend(MEMORY[0x263F1CB00], "currentTraitCollection", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (void *)MEMORY[0x263F1CB00];
  id v5 = [(DKInkRendererGL *)self traitCollection];
  uint64_t v6 = objc_msgSend(v4, "traitCollectionWithUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
  [v4 setCurrentTraitCollection:v6];

  +[DKGLUtilities setCurrentClearColor];
  [(DKOpenGLRenderer *)self->_inkRenderer setInkColor:self->_inkColor];
  glClear(0x4000u);
  uint64_t v7 = [(NSMutableArray *)self->_brushPointQueue count];
  [(DKInkRendererGL *)self addPointsFromBrushPointQueueWithSegmentLength:[(NSMutableArray *)self->_brushPointQueue count]];
  [(DKOpenGLRenderer *)self->_inkRenderer update];
  [(DKOpenGLRenderer *)self->_inkRenderer draw];
  [MEMORY[0x263F1CB00] setCurrentTraitCollection:v8];
  if (v7) {
    self->_needToNotifdouble y = 1;
  }
}

- (void)displayForcefully
{
  id v9 = [MEMORY[0x263F1CB00] currentTraitCollection];
  v3 = (void *)MEMORY[0x263F1CB00];
  id v4 = [(DKInkRendererGL *)self traitCollection];
  id v5 = objc_msgSend(v3, "traitCollectionWithUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
  [v3 setCurrentTraitCollection:v5];

  uint64_t v6 = [MEMORY[0x263F146E8] currentContext];
  uint64_t v7 = (void *)MEMORY[0x263F146E8];
  id v8 = [(GLKView *)self context];
  [v7 setCurrentContext:v8];

  [(DKOpenGLRenderer *)self->_inkRenderer setInkColor:self->_inkColor];
  [(DKOpenGLRenderer *)self->_inkRenderer setDrawingEnabled:0];
  [(DKInkRendererGL *)self addPointsFromBrushPointQueueWithSegmentLength:25];
  [(DKOpenGLRenderer *)self->_inkRenderer setDrawingEnabled:1];
  [(DKOpenGLRenderer *)self->_inkRenderer redrawEntireDrawingImmediatelyWithLayeredBlending:1];
  self->_needToNotifdouble y = 1;
  [MEMORY[0x263F146E8] setCurrentContext:v6];
  [MEMORY[0x263F1CB00] setCurrentTraitCollection:v9];
}

- (void)addPointsFromBrushPointQueueWithSegmentLength:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_brushPointQueue count])
  {
    inkRenderer = self->_inkRenderer;
    if (inkRenderer)
    {
      [(DKOpenGLRenderer *)inkRenderer addPoints:self->_brushPointQueue withSegmentLength:a3];
      brushPointQueue = self->_brushPointQueue;
      [(NSMutableArray *)brushPointQueue removeAllObjects];
    }
  }
}

- (void)teardown
{
  id v5 = [MEMORY[0x263F146E8] currentContext];
  v3 = (void *)MEMORY[0x263F146E8];
  id v4 = [(GLKView *)self context];
  [v3 setCurrentContext:v4];

  [(DKOpenGLRenderer *)self->_inkRenderer teardown];
  [(DKInkRendererGL *)self setDelegate:0];
  [MEMORY[0x263F146E8] setCurrentContext:v5];
}

- (void)rendererDidFinishAnimatingDrawing:(id)a3
{
  id v4 = [(DKInkRendererGL *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 inkDidCompleteRender:self];
  }
}

- (UIColor)inkColor
{
  return self->_inkColor;
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
  return self->_drawingScale;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)drawingEnabled
{
  return self->drawingEnabled;
}

- (void)setDrawingEnabled:(BOOL)a3
{
  self->drawingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_inkRenderer, 0);
  objc_storeStrong((id *)&self->_currentBrushStroke, 0);
  objc_storeStrong((id *)&self->_brushStrokes, 0);
  objc_storeStrong((id *)&self->_brushPointQueue, 0);
  objc_storeStrong((id *)&self->_inkColor, 0);
}

@end