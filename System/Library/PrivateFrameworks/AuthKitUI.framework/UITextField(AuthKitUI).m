@interface UITextField(AuthKitUI)
- (id)ak_addActivityIndicator;
- (id)ak_addForgotButtonWithTarget:()AuthKitUI action:;
- (void)ak_clearActivityIndicatorIfExist;
@end

@implementation UITextField(AuthKitUI)

- (id)ak_addForgotButtonWithTarget:()AuthKitUI action:
{
  v6 = (void *)MEMORY[0x1E4F427E0];
  id v7 = a3;
  v8 = objc_msgSend(v6, "ak_passwordRecoveryButton");
  [v8 addTarget:v7 action:a4 forControlEvents:64];

  [a1 setRightView:v8];
  [a1 setRightViewMode:3];

  return v8;
}

- (id)ak_addActivityIndicator
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  [v2 startAnimating];
  [a1 setRightView:v2];
  [a1 setRightViewMode:3];

  return v2;
}

- (void)ak_clearActivityIndicatorIfExist
{
  objc_opt_class();
  id v2 = [a1 rightView];
  if (objc_opt_isKindOfClass()) {
    id v4 = v2;
  }
  else {
    id v4 = 0;
  }

  v3 = v4;
  if (v4)
  {
    [v4 stopAnimating];
    [a1 setRightView:0];
    [a1 setRightViewMode:0];
    v3 = v4;
  }
}

@end