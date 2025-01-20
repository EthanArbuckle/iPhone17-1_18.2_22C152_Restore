@interface UIButton
@end

@implementation UIButton

void __56__UIButton_AuthKitUI___ak_passwordRecoveryButtonTapped___block_invoke()
{
  v0 = [[AKCAReporter alloc] initWithEvent:@"com.apple.authkitui.password_recovery_button_tapped"];
  [(AKCAReporter *)v0 sendReport];
}

@end