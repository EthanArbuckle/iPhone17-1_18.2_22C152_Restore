@interface ServicePresentationSafariViewController
- (ServiceBridgedPresentationControllerProxy)proxyHandler;
- (ServicePresentationSafariViewController)initWithSafariViewController:(id)a3 proxyHandler:(id)a4;
- (void)_setChildViewController:(id)a3;
- (void)loadView;
- (void)setProxyHandler:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ServicePresentationSafariViewController

- (ServicePresentationSafariViewController)initWithSafariViewController:(id)a3 proxyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ServicePresentationSafariViewController;
  v8 = [(ServicePresentationSafariViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_proxyHandler, v7);
    [(ServicePresentationSafariViewController *)v9 setModalPresentationStyle:2];
    [(ServicePresentationSafariViewController *)v9 _setChildViewController:v6];
  }

  return v9;
}

- (void)loadView
{
  id v4 = objc_alloc_init((Class)UIView);
  [v4 setOpaque:0];
  v3 = +[UIColor clearColor];
  [v4 setBackgroundColor:v3];

  [(ServicePresentationSafariViewController *)self setView:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ServicePresentationSafariViewController;
  [(ServicePresentationSafariViewController *)&v7 viewDidDisappear:a3];
  id v4 = [(ServicePresentationSafariViewController *)self childViewControllers];
  v5 = [v4 firstObject];

  if (!v5 || ([v5 isBeingPresented] & 1) == 0)
  {
    id v6 = [(ServicePresentationSafariViewController *)self proxyHandler];
    [v6 dismissViewController];
  }
}

- (void)_setChildViewController:(id)a3
{
  id v9 = a3;
  [v9 willMoveToParentViewController:self];
  id v4 = [v9 view];
  v5 = [(ServicePresentationSafariViewController *)self view];
  [v5 bounds];
  [v4 setFrame:];

  id v6 = [v9 view];
  [v6 setAutoresizingMask:18];

  [(ServicePresentationSafariViewController *)self addChildViewController:v9];
  objc_super v7 = [(ServicePresentationSafariViewController *)self view];
  v8 = [v9 view];
  [v7 addSubview:v8];

  [v9 didMoveToParentViewController:self];
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
}

@end