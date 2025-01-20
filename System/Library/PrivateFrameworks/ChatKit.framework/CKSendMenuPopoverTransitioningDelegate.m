@interface CKSendMenuPopoverTransitioningDelegate
- (CKSendMenuPopoverPresentationConfiguration)configuration;
- (CKSendMenuPopoverPresentationController)presentationController;
- (CKSendMenuPopoverTransitioningDelegate)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)setConfiguration:(id)a3;
- (void)setPresentationController:(id)a3;
@end

@implementation CKSendMenuPopoverTransitioningDelegate

- (CKSendMenuPopoverTransitioningDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKSendMenuPopoverTransitioningDelegate;
  v2 = [(CKSendMenuPopoverTransitioningDelegate *)&v8 init];
  v3 = v2;
  if (v2)
  {
    presentationController = v2->_presentationController;
    v2->_presentationController = 0;

    uint64_t v5 = objc_opt_new();
    configuration = v3->_configuration;
    v3->_configuration = (CKSendMenuPopoverPresentationConfiguration *)v5;
  }
  return v3;
}

- (id)animationControllerForDismissedController:(id)a3
{
  if (!self->_presentationController)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    [v7 handleFailureInMethod:a2 object:self file:@"CKSendMenuPopoverTransitioningDelegate.m" lineNumber:46 description:@"presentationController required – programmer error."];
  }
  v4 = [[CKSendMenuPopoverAnimationController alloc] initWithConfiguration:self->_configuration presenting:0];

  return v4;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  if (!self->_presentationController)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
    [v9 handleFailureInMethod:a2 object:self file:@"CKSendMenuPopoverTransitioningDelegate.m" lineNumber:60 description:@"presentationController required – programmer error."];
  }
  v6 = [[CKSendMenuPopoverAnimationController alloc] initWithConfiguration:self->_configuration presenting:1];

  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  presentationController = self->_presentationController;
  if (!presentationController)
  {
    id v8 = a4;
    id v9 = a3;
    v10 = [[CKSendMenuPopoverPresentationController alloc] initWithConfiguration:self->_configuration popoverViewController:v9 presentingViewController:v8];

    v11 = self->_presentationController;
    self->_presentationController = v10;

    presentationController = self->_presentationController;
  }

  return presentationController;
}

- (CKSendMenuPopoverPresentationController)presentationController
{
  return self->_presentationController;
}

- (void)setPresentationController:(id)a3
{
}

- (CKSendMenuPopoverPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_presentationController, 0);
}

@end