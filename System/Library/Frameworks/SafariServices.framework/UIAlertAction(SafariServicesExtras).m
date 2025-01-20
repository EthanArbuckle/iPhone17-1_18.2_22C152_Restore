@interface UIAlertAction(SafariServicesExtras)
+ (id)sf_actionWithContentViewController:()SafariServicesExtras style:handler:shouldDismissHandler:;
@end

@implementation UIAlertAction(SafariServicesExtras)

+ (id)sf_actionWithContentViewController:()SafariServicesExtras style:handler:shouldDismissHandler:
{
  id v10 = a6;
  v11 = [a1 _actionWithContentViewController:a3 style:a4 handler:a5];
  if (objc_opt_respondsToSelector()) {
    [v11 setShouldDismissHandler:v10];
  }

  return v11;
}

@end