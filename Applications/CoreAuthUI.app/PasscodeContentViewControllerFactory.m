@interface PasscodeContentViewControllerFactory
+ (id)passcodeContentViewControllerForPasscode:(id)a3 options:(id)a4;
@end

@implementation PasscodeContentViewControllerFactory

+ (id)passcodeContentViewControllerForPasscode:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[PasscodeContentViewControllerFullScreen alloc] initWithPasscode:v6 options:v5];

  return v7;
}

@end