@interface PKCanvasAttachmentView
- (BOOL)_wantsFullyRenderedNotification;
- (BOOL)disableTileAnimations;
- (BOOL)wantsFullyRendered;
- (CGAffineTransform)drawingTransform;
- (NSMutableArray)fullyRenderedCompletionBlocks;
- (PKCanvasView)canvasView;
- (double)drawingWidth;
- (id)tiledView;
- (void)drawingDidChangeVisibleStrokes:(BOOL)a3;
- (void)fullyRendered;
- (void)setCanvasView:(id)a3;
- (void)setDrawingWidth:(double)a3;
- (void)setFullyRenderedCompletionBlocks:(id)a3;
- (void)set_wantsFullyRenderedNotification:(BOOL)a3;
@end

@implementation PKCanvasAttachmentView

- (void)drawingDidChangeVisibleStrokes:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCanvasAttachmentView;
  [(PKAttachmentView *)&v5 drawingDidChangeVisibleStrokes:a3];
  v4 = [(PKCanvasAttachmentView *)self canvasView];
  [v4 _drawingDidChange];
}

- (BOOL)wantsFullyRendered
{
  return [(PKCanvasAttachmentView *)self _wantsFullyRenderedNotification]
      || [(NSMutableArray *)self->_fullyRenderedCompletionBlocks count] != 0;
}

- (void)fullyRendered
{
  id v2 = [(PKCanvasAttachmentView *)self canvasView];
  [v2 _fullyRendered];
}

- (BOOL)disableTileAnimations
{
  v3 = [(PKCanvasAttachmentView *)self canvasView];
  BOOL v4 = ([v3 isHidden] & 1) != 0
    || [(NSMutableArray *)self->_fullyRenderedCompletionBlocks count] != 0;

  return v4;
}

- (CGAffineTransform)drawingTransform
{
  result = (CGAffineTransform *)[(PKCanvasAttachmentView *)self drawingWidth];
  if (v6 <= 0.0)
  {
    uint64_t v11 = MEMORY[0x1E4F1DAB8];
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v11 + 32);
  }
  else
  {
    [(PKCanvasAttachmentView *)self bounds];
    double v8 = v7;
    [(PKCanvasAttachmentView *)self drawingWidth];
    double v10 = v8 / v9;
    return CGAffineTransformMakeScale(retstr, v10, v10);
  }
  return result;
}

- (id)tiledView
{
  id v2 = [(PKCanvasAttachmentView *)self canvasView];
  v3 = [v2 _tiledView];

  return v3;
}

- (PKCanvasView)canvasView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);

  return (PKCanvasView *)WeakRetained;
}

- (void)setCanvasView:(id)a3
{
}

- (BOOL)_wantsFullyRenderedNotification
{
  return self->__wantsFullyRenderedNotification;
}

- (void)set_wantsFullyRenderedNotification:(BOOL)a3
{
  self->__wantsFullyRenderedNotification = a3;
}

- (double)drawingWidth
{
  return self->_drawingWidth;
}

- (void)setDrawingWidth:(double)a3
{
  self->_drawingWidth = a3;
}

- (NSMutableArray)fullyRenderedCompletionBlocks
{
  return self->_fullyRenderedCompletionBlocks;
}

- (void)setFullyRenderedCompletionBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullyRenderedCompletionBlocks, 0);

  objc_destroyWeak((id *)&self->_canvasView);
}

@end