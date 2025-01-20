@interface PKTiledCanvasViewDisplayLinkDelegate
- (PKTiledCanvasView)view;
- (void)display:(id)a3;
- (void)setView:(id)a3;
@end

@implementation PKTiledCanvasViewDisplayLinkDelegate

- (void)display:(id)a3
{
  id v5 = a3;
  v4 = [(PKTiledCanvasViewDisplayLinkDelegate *)self view];
  [v5 targetTimestamp];
  objc_msgSend(v4, "_drawingDisplay:");
}

- (PKTiledCanvasView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (PKTiledCanvasView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end