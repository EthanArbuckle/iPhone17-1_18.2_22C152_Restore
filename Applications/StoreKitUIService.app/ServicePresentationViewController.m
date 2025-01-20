@interface ServicePresentationViewController
- (BOOL)animated;
- (CGRect)presentationBounds;
- (ServiceBridgedPresentationControllerProxy)proxyHandler;
- (ServicePresentationViewController)initWithChildViewController:(id)a3 animated:(BOOL)a4 presentationBounds:(CGRect)a5 proxyHandler:(id)a6;
- (UIViewController)childViewController;
- (void)_correctPopover:(id)a3;
- (void)_presentChildViewController;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)loadView;
- (void)setAnimated:(BOOL)a3;
- (void)setChildViewController:(id)a3;
- (void)setPresentationBounds:(CGRect)a3;
- (void)setProxyHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ServicePresentationViewController

- (ServicePresentationViewController)initWithChildViewController:(id)a3 animated:(BOOL)a4 presentationBounds:(CGRect)a5 proxyHandler:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a3;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ServicePresentationViewController;
  v16 = [(ServicePresentationViewController *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_childViewController, a3);
    v17->_animated = a4;
    v17->_presentationBounds.origin.CGFloat x = x;
    v17->_presentationBounds.origin.CGFloat y = y;
    v17->_presentationBounds.size.CGFloat width = width;
    v17->_presentationBounds.size.CGFloat height = height;
    objc_storeWeak((id *)&v17->_proxyHandler, v15);
    [(ServicePresentationViewController *)v17 setModalPresentationStyle:5];
  }

  return v17;
}

- (void)loadView
{
  id v4 = objc_alloc_init((Class)UIView);
  v3 = +[UIColor clearColor];
  [v4 setBackgroundColor:v3];

  [v4 setUserInteractionEnabled:0];
  [(ServicePresentationViewController *)self setView:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ServicePresentationViewController;
  [(ServicePresentationViewController *)&v5 viewWillAppear:a3];
  id v4 = [(ServicePresentationViewController *)self presentationController];
  [v4 _setContainerIgnoresDirectTouchEvents:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ServicePresentationViewController;
  [(ServicePresentationViewController *)&v4 viewDidAppear:a3];
  [(ServicePresentationViewController *)self _presentChildViewController];
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  [(ServicePresentationViewController *)self setChildViewController:0];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000107D0;
  v9[3] = &unk_10004D3F0;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)ServicePresentationViewController;
  id v7 = v6;
  [(ServicePresentationViewController *)&v8 dismissViewControllerWithTransition:v4 completion:v9];
}

- (void)_presentChildViewController
{
  uint64_t v3 = [(ServicePresentationViewController *)self childViewController];
  if (v3)
  {
    uint64_t v4 = v3;
    [(ServicePresentationViewController *)self _correctPopover:v3];
    [(ServicePresentationViewController *)self presentViewController:v4 animated:[(ServicePresentationViewController *)self animated] completion:0];
  }

  _objc_release_x1();
}

- (void)_correctPopover:(id)a3
{
  rect_8 = [a3 popoverPresentationController];
  uint64_t v4 = [rect_8 sourceView];
  objc_super v5 = [v4 window];
  if (rect_8 && v4 && v5)
  {
    id v6 = [v4 superview];
    [v4 frame];
    [v6 convertRect:v5 toView:];
    double v8 = v7;
    double v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    id v15 = [(ServicePresentationViewController *)self view];
    [v15 bounds];
    double v17 = v16;
    [(ServicePresentationViewController *)self presentationBounds];
    CGFloat v19 = v8 + v17 - v18;

    v20 = [(ServicePresentationViewController *)self view];
    [v20 bounds];
    double v22 = v21;
    [(ServicePresentationViewController *)self presentationBounds];
    CGFloat v24 = v10 + v22 - v23;

    v25 = [(ServicePresentationViewController *)self view];
    [rect_8 setSourceView:v25];

    [rect_8 sourceRect];
    CGFloat rect = v26;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v33 = v19;
    v39.origin.CGFloat x = v19;
    v39.origin.CGFloat y = v24;
    v39.size.CGFloat width = v12;
    v39.size.CGFloat height = v14;
    CGFloat MinX = CGRectGetMinX(v39);
    v40.origin.CGFloat x = v33;
    v40.origin.CGFloat y = v24;
    v40.size.CGFloat width = v12;
    v40.size.CGFloat height = v14;
    CGFloat MinY = CGRectGetMinY(v40);
    v41.origin.CGFloat x = rect;
    v41.origin.CGFloat y = v28;
    v41.size.CGFloat width = v30;
    v41.size.CGFloat height = v32;
    CGRect v42 = CGRectOffset(v41, MinX, MinY);
    [rect_8 setSourceRect:v42.origin.x, v42.origin.y, v42.size.width, v42.size.height];
  }
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
}

- (CGRect)presentationBounds
{
  double x = self->_presentationBounds.origin.x;
  double y = self->_presentationBounds.origin.y;
  double width = self->_presentationBounds.size.width;
  double height = self->_presentationBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentationBounds:(CGRect)a3
{
  self->_presentationBounds = a3;
}

- (ServiceBridgedPresentationControllerProxy)proxyHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyHandler);

  return (ServiceBridgedPresentationControllerProxy *)WeakRetained;
}

- (void)setProxyHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxyHandler);

  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end