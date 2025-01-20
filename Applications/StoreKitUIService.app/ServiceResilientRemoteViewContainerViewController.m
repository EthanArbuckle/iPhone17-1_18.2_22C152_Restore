@interface ServiceResilientRemoteViewContainerViewController
- (id)containedViewController;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setContainedViewController:(id)a3;
@end

@implementation ServiceResilientRemoteViewContainerViewController

- (id)containedViewController
{
  return self->_otherContainedViewController;
}

- (void)setContainedViewController:(id)a3
{
  v4 = (UIViewController *)a3;
  otherContainedViewController = self->_otherContainedViewController;
  self->_otherContainedViewController = v4;
  v22 = v4;
  v6 = otherContainedViewController;

  [(UIViewController *)self->_otherContainedViewController preferredContentSize];
  -[ServiceResilientRemoteViewContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [(ServiceResilientRemoteViewContainerViewController *)self addChildViewController:self->_otherContainedViewController];
  [(UIViewController *)v6 willMoveToParentViewController:0];
  [(UIViewController *)v6 removeFromParentViewController];
  v7 = [(ServiceResilientRemoteViewContainerViewController *)self view];
  v8 = [(UIViewController *)self->_otherContainedViewController view];
  [v7 addSubview:v8];

  v9 = [(UIViewController *)self->_otherContainedViewController view];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:1];

  v10 = [(UIViewController *)self->_otherContainedViewController view];
  [v10 setAutoresizingMask:18];

  v11 = [(ServiceResilientRemoteViewContainerViewController *)self view];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(UIViewController *)self->_otherContainedViewController view];
  [v20 setFrame:v13, v15, v17, v19];

  v21 = [(UIViewController *)v6 view];
  [v21 removeFromSuperview];

  [(UIViewController *)self->_otherContainedViewController didMoveToParentViewController:self];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ServiceResilientRemoteViewContainerViewController;
  [(ServiceResilientRemoteViewContainerViewController *)&v4 preferredContentSizeDidChangeForChildContentContainer:a3];
  [(UIViewController *)self->_otherContainedViewController preferredContentSize];
  -[ServiceResilientRemoteViewContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void).cxx_destruct
{
}

@end