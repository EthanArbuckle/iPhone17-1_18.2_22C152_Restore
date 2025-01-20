@interface AEExplorerGroupingView
- (UIView)sceneView;
- (void)layoutSubviews;
- (void)setSceneView:(id)a3;
@end

@implementation AEExplorerGroupingView

- (void).cxx_destruct
{
}

- (UIView)sceneView
{
  return self->_sceneView;
}

- (void)setSceneView:(id)a3
{
  v5 = (UIView *)a3;
  sceneView = self->_sceneView;
  v7 = v5;
  if (sceneView != v5)
  {
    [(UIView *)sceneView removeFromSuperview];
    [(AEExplorerGroupingView *)self addSubview:v7];
    objc_storeStrong((id *)&self->_sceneView, a3);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AEExplorerGroupingView;
  [(AEExplorerGroupingView *)&v3 layoutSubviews];
  [(AEExplorerGroupingView *)self bounds];
  -[UIView setFrame:](self->_sceneView, "setFrame:");
}

@end