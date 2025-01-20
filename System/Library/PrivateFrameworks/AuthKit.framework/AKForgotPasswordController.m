@interface AKForgotPasswordController
- (AKForgotPasswordController)init;
@end

@implementation AKForgotPasswordController

- (AKForgotPasswordController)init
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)AKForgotPasswordController;
  v2 = [(AKForgotPasswordController *)&v10 init];
  if (v2)
  {
    v3 = objc_opt_new();
    v11[0] = v3;
    v4 = objc_opt_new();
    v11[1] = v4;
    v5 = objc_opt_new();
    v11[2] = v5;
    v6 = objc_opt_new();
    v11[3] = v6;
    v7 = objc_opt_new();
    v11[4] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
    [(AKAppleIDRecoveryController *)v2 setSupportedRecoverySteps:v8];
  }
  return v2;
}

@end