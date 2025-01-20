@interface WKFullScreenPlaceholderView
- (WKFullScreenWindowController)parent;
- (void)setParent:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation WKFullScreenPlaceholderView

- (void)willMoveToSuperview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WKFullScreenPlaceholderView;
  -[WKFullScreenPlaceholderView willMoveToSuperview:](&v5, sel_willMoveToSuperview_);
  [(WKFullScreenWindowController *)[(WKFullScreenPlaceholderView *)self parent] placeholderWillMoveToSuperview:a3];
}

- (WKFullScreenWindowController)parent
{
  return (WKFullScreenWindowController *)objc_loadWeak((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end