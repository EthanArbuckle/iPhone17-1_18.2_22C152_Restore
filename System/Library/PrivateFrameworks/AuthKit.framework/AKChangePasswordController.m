@interface AKChangePasswordController
- (AKChangePasswordController)init;
@end

@implementation AKChangePasswordController

- (AKChangePasswordController)init
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)AKChangePasswordController;
  v2 = [(AKChangePasswordController *)&v7 init];
  if (v2)
  {
    v3 = objc_opt_new();
    v8[0] = v3;
    v4 = objc_opt_new();
    v8[1] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
    [(AKAppleIDRecoveryController *)v2 setSupportedRecoverySteps:v5];
  }
  return v2;
}

@end