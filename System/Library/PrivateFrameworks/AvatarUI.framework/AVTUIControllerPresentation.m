@interface AVTUIControllerPresentation
+ (AVTUIControllerPresentation)pendingGlobalPresentation;
+ (AVTUIControllerPresentation)presentationWithWrappingForController:(id)a3;
+ (void)setPendingGlobalPresentation:(id)a3;
- (AVTUIControllerPresentation)initWithController:(id)a3;
- (AVTUIControllerPresentationDelegate)delegate;
- (MSMessagesAppViewController)modalMessagesController;
- (UIViewController)controller;
- (void)setDelegate:(id)a3;
- (void)setModalMessagesController:(id)a3;
- (void)viewWillBeObstructed;
@end

@implementation AVTUIControllerPresentation

+ (AVTUIControllerPresentation)presentationWithWrappingForController:(id)a3
{
  id v3 = a3;
  v4 = [[AVTTransparentNavigationController alloc] initWithRootViewController:v3];
  v5 = objc_alloc_init(AVTAvatarContainerViewController);
  v6 = [(AVTAvatarContainerViewController *)v5 view];
  v7 = [(AVTTransparentNavigationController *)v4 view];
  [v6 addSubview:v7];

  [(AVTAvatarContainerViewController *)v5 addChildViewController:v4];
  [(AVTTransparentNavigationController *)v4 didMoveToParentViewController:v5];
  v8 = [[AVTUIControllerPresentation alloc] initWithController:v5];
  [(AVTUIControllerPresentation *)v8 setDelegate:v3];

  return v8;
}

- (AVTUIControllerPresentation)initWithController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTUIControllerPresentation;
  v6 = [(AVTUIControllerPresentation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_controller, a3);
  }

  return v7;
}

- (void)viewWillBeObstructed
{
  id v3 = [(AVTUIControllerPresentation *)self delegate];

  if (v3)
  {
    id v4 = [(AVTUIControllerPresentation *)self delegate];
    [v4 controllerPresentationWillObstructView:self];
  }
}

- (UIViewController)controller
{
  return self->_controller;
}

- (MSMessagesAppViewController)modalMessagesController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modalMessagesController);
  return (MSMessagesAppViewController *)WeakRetained;
}

- (void)setModalMessagesController:(id)a3
{
}

- (AVTUIControllerPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTUIControllerPresentationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_modalMessagesController);
  objc_storeStrong((id *)&self->_controller, 0);
}

+ (void)setPendingGlobalPresentation:(id)a3
{
}

+ (AVTUIControllerPresentation)pendingGlobalPresentation
{
  return (AVTUIControllerPresentation *)(id)s_pendingPresentation;
}

@end