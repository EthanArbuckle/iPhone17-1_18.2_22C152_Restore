@interface MUPresentationOptions
- (CGRect)sourceRect;
- (MUActivityObserving)progressObserver;
- (UIBarButtonItem)barButtonItem;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIView)sourceView;
- (UIViewController)presentingViewController;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBarButtonItem:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setProgressObserver:(id)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
@end

@implementation MUPresentationOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MUPresentationOptions);
  v5 = [(MUPresentationOptions *)self presentingViewController];
  [(MUPresentationOptions *)v4 setPresentingViewController:v5];

  v6 = [(MUPresentationOptions *)self sourceView];
  [(MUPresentationOptions *)v4 setSourceView:v6];

  [(MUPresentationOptions *)self sourceRect];
  -[MUPresentationOptions setSourceRect:](v4, "setSourceRect:");
  v7 = [(MUPresentationOptions *)self progressObserver];
  [(MUPresentationOptions *)v4 setProgressObserver:v7];

  v8 = [(MUPresentationOptions *)self barButtonItem];
  [(MUPresentationOptions *)v4 setBarButtonItem:v8];

  return v4;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (MUActivityObserving)progressObserver
{
  return self->_progressObserver;
}

- (void)setProgressObserver:(id)a3
{
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (void)setBarButtonItem:(id)a3
{
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_storeStrong((id *)&self->_progressObserver, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end