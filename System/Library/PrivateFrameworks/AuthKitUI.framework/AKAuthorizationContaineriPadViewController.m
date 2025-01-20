@interface AKAuthorizationContaineriPadViewController
- (AKAuthorizationContaineriPadViewController)initWithRootViewController:(id)a3 authorizationContext:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AKAuthorizationContaineriPadViewController

- (AKAuthorizationContaineriPadViewController)initWithRootViewController:(id)a3 authorizationContext:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationContaineriPadViewController;
  v4 = [(AKAuthorizationContainerViewController *)&v8 initWithRootViewController:a3 authorizationContext:a4];
  v5 = v4;
  if (v4)
  {
    [(AKAuthorizationContaineriPadViewController *)v4 setModalPresentationStyle:5];
    v6 = [(AKAuthorizationContainerViewController *)v5 rootViewController];
    [v6 setModalPresentationStyle:2];
  }
  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationContaineriPadViewController;
  [(AKAuthorizationContaineriPadViewController *)&v5 viewDidAppear:a3];
  if ([(AKAuthorizationContaineriPadViewController *)self isBeingPresented])
  {
    v4 = [(AKAuthorizationContainerViewController *)self rootViewController];
    [(AKAuthorizationContaineriPadViewController *)self presentViewController:v4 animated:1 completion:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationContaineriPadViewController;
  [(AKAuthorizationContaineriPadViewController *)&v4 viewWillDisappear:a3];
  if ([(AKAuthorizationContaineriPadViewController *)self isBeingDismissed]) {
    [(AKAuthorizationContaineriPadViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

@end