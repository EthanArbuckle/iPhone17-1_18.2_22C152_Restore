@interface PKSelectionHighlightRenderer
- (CGPoint)editMenuLocation;
- (PKSelectionHighlightRenderer)initWithStrokeSelection:(id)a3 renderingDelegate:(id)a4;
- (id)_accessibilityUserTestingChildren;
- (id)adornmentLayer;
- (id)initForLiveSelectionWithRenderingDelegate:(id)a3;
- (id)lassoPath;
- (void)_didBeginDraggingSelection;
- (void)_didEndDraggingSelection;
- (void)_renderLiveSelectionPath:(CGPath *)a3 forStrokes:(id)a4 inDrawing:(id)a5 liveScrollOffset:(CGPoint)a6;
- (void)_setupHighlightIfNecessary;
@end

@implementation PKSelectionHighlightRenderer

- (PKSelectionHighlightRenderer)initWithStrokeSelection:(id)a3 renderingDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSelectionHighlightRenderer;
  v9 = [(PKSelectionHighlightRenderer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_strokeSelection, a3);
    objc_storeWeak((id *)&v10->_renderingDelegate, v8);
  }

  return v10;
}

- (id)initForLiveSelectionWithRenderingDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKSelectionHighlightRenderer;
  v5 = [(PKSelectionHighlightRenderer *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_renderingDelegate, v4);
    -[PKSelectionHighlightRenderer _setupHighlightIfNecessary]((uint64_t)v6);
  }

  return v6;
}

- (void)_setupHighlightIfNecessary
{
  if (a1 && !*(void *)(a1 + 8))
  {
    uint64_t v2 = [MEMORY[0x1E4F39C88] layer];
    v3 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v2;

    [*(id *)(a1 + 24) bounds];
    double v5 = v4;
    double v7 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v9 = [*(id *)(a1 + 24) drawing];
    [WeakRetained scaleForDrawing:v9];
    double v11 = v10;

    objc_super v12 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", 0.0, 0.0, v5 * v11, v7 * v11);
    v13 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v12;
    id v14 = v12;

    [*(id *)(a1 + 8) setContentsScale:1.0];
    id v18 = v14;
    objc_msgSend(*(id *)(a1 + 8), "setPath:", objc_msgSend(v18, "CGPath"));
    v15 = *(void **)(a1 + 8);
    id v16 = [MEMORY[0x1E4FB1618] systemYellowColor];
    objc_msgSend(v15, "setFillColor:", objc_msgSend(v16, "CGColor"));

    LODWORD(v17) = 1050253722;
    [*(id *)(a1 + 8) setOpacity:v17];
  }
}

- (id)lassoPath
{
  return self->_lassoPath;
}

- (id)adornmentLayer
{
  return self->_highlightLayer;
}

- (void)_didBeginDraggingSelection
{
}

- (void)_didEndDraggingSelection
{
  LODWORD(v2) = 1050253722;
  [(CAShapeLayer *)self->_highlightLayer setOpacity:v2];
}

- (CGPoint)editMenuLocation
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_renderLiveSelectionPath:(CGPath *)a3 forStrokes:(id)a4 inDrawing:(id)a5 liveScrollOffset:(CGPoint)a6
{
  id v8 = a5;
  if (self)
  {
    +[PKDrawing _boundingBoxForStrokes:a4];
    v9 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:");
  }
  else
  {
    v9 = 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderingDelegate);
  double v11 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained transformFromStrokeSpaceToViewInDrawing:v8];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
  }

  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  [v9 applyTransform:v13];
  -[PKSelectionHighlightRenderer _setupHighlightIfNecessary]((uint64_t)self);
  id v12 = v9;
  -[CAShapeLayer setPath:](self->_highlightLayer, "setPath:", [v12 CGPath]);
}

- (id)_accessibilityUserTestingChildren
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderingDelegate);
  objc_storeStrong((id *)&self->_strokeSelection, 0);
  objc_storeStrong((id *)&self->_lassoPath, 0);

  objc_storeStrong((id *)&self->_highlightLayer, 0);
}

@end