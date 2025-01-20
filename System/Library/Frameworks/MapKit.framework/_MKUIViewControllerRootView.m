@interface _MKUIViewControllerRootView
- (UIViewController)viewController;
- (_MKUIViewControllerRootView)initWithCoder:(id)a3;
- (_MKUIViewControllerRootView)initWithFrame:(CGRect)a3;
- (_MKUIViewControllerRootView)initWithViewController:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation _MKUIViewControllerRootView

- (_MKUIViewControllerRootView)initWithViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MKUIViewControllerRootView;
  v5 = -[_MKUIViewControllerRootView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    [(_MKUIViewControllerRootView *)v5 _commonInit];
    [(_MKUIViewControllerRootView *)v6 setViewController:v4];
  }

  return v6;
}

- (_MKUIViewControllerRootView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_MKUIViewControllerRootView;
  v3 = [(_MKUIViewControllerRootView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(_MKUIViewControllerRootView *)v3 _commonInit];
  }
  return v4;
}

- (_MKUIViewControllerRootView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_MKUIViewControllerRootView;
  v3 = -[_MKUIViewControllerRootView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(_MKUIViewControllerRootView *)v3 _commonInit];
  }
  return v4;
}

- (void)setViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_viewController, obj);
    [(UIView *)self _mapkit_setNeedsLayout];
    v5 = obj;
  }
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end