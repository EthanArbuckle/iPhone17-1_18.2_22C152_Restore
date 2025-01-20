@interface ServiceCardContainerViewController
- (BOOL)didDisappear;
- (ServiceCardContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIViewController)childViewController;
- (_UIRemoteViewController)_containedRemoteViewController;
- (_UIRemoteViewController)remoteViewController;
- (void)dealloc;
- (void)loadView;
- (void)setChildViewController:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ServiceCardContainerViewController

- (ServiceCardContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ServiceCardContainerViewController;
  result = [(ServiceCardContainerViewController *)&v5 initWithNibName:a3 bundle:a4];
  if (result) {
    result->_didDisappear = 0;
  }
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ServiceCardContainerViewController;
  [(ServiceCardContainerViewController *)&v3 viewDidLoad];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    objc_super v5 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%{public}@: Start.", buf, 0xCu);
  }
  self->_didDisappear = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ServiceCardContainerViewController;
  [(ServiceCardContainerViewController *)&v4 viewDidAppear:a3];
  self->_didDisappear = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ServiceCardContainerViewController;
  [(ServiceCardContainerViewController *)&v4 viewDidDisappear:a3];
  self->_didDisappear = 1;
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (void)loadView
{
  id v4 = objc_alloc_init((Class)UIView);
  objc_super v3 = +[UIColor clearColor];
  [v4 setBackgroundColor:v3];

  [v4 setAutoresizingMask:40];
  [(ServiceCardContainerViewController *)self setView:v4];
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return self->_remoteViewController;
}

- (void)setChildViewController:(id)a3
{
  id v12 = a3;
  id v5 = [(ServiceCardContainerViewController *)self childViewController];

  v6 = v12;
  if (v5 != v12)
  {
    v7 = [(ServiceCardContainerViewController *)self childViewController];
    objc_storeStrong((id *)&self->_childViewController, a3);
    if (v7)
    {
      [v7 willMoveToParentViewController:0];
      v8 = [v7 view];
      [v8 removeFromSuperview];

      [v7 removeFromParentViewController];
    }
    if (v12)
    {
      [(ServiceCardContainerViewController *)self addChildViewController:v12];
      v9 = [v12 view];
      v10 = [(ServiceCardContainerViewController *)self view];
      [v10 bounds];
      [v9 setFrame:];

      [v9 setAutoresizingMask:18];
      v11 = [(ServiceCardContainerViewController *)self view];
      [v11 addSubview:v9];

      [v12 didMoveToParentViewController:self];
    }

    v6 = v12;
  }
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%{public}@: Dealloc.", buf, 0xCu);
  }
  v3.receiver = self;
  v3.super_class = (Class)ServiceCardContainerViewController;
  [(ServiceCardContainerViewController *)&v3 dealloc];
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (_UIRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);

  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end