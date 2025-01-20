@interface ServiceBridgedPresentationController
+ (id)sharedController;
- (BOOL)saveViewController:(id)a3 animated:(BOOL)a4 presentationBounds:(CGRect)a5 proxyHandler:(id)a6;
- (UIViewController)savedViewController;
- (id)removeSavedViewController;
- (void)setSavedViewController:(id)a3;
@end

@implementation ServiceBridgedPresentationController

+ (id)sharedController
{
  if (qword_100067340 != -1) {
    dispatch_once(&qword_100067340, &stru_10004D4A8);
  }
  v2 = (void *)qword_100067338;

  return v2;
}

- (id)removeSavedViewController
{
  v3 = [(ServiceBridgedPresentationController *)self savedViewController];
  [(ServiceBridgedPresentationController *)self setSavedViewController:0];

  return v3;
}

- (BOOL)saveViewController:(id)a3 animated:(BOOL)a4 presentationBounds:(CGRect)a5 proxyHandler:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v11 = a4;
  id v13 = a3;
  id v14 = a6;
  v15 = [(ServiceBridgedPresentationController *)self savedViewController];

  if (!v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = [[ServicePresentationSafariViewController alloc] initWithSafariViewController:v13 proxyHandler:v14];
    }
    else {
      v16 = -[ServicePresentationViewController initWithChildViewController:animated:presentationBounds:proxyHandler:]([ServicePresentationViewController alloc], "initWithChildViewController:animated:presentationBounds:proxyHandler:", v13, v11, v14, x, y, width, height);
    }
    v17 = v16;
    [(ServiceBridgedPresentationController *)self setSavedViewController:v16];
  }
  return v15 == 0;
}

- (UIViewController)savedViewController
{
  return self->_savedViewController;
}

- (void)setSavedViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end