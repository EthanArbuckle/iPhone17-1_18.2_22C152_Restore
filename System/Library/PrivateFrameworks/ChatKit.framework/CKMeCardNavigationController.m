@interface CKMeCardNavigationController
- (BOOL)canBecomeFirstResponder;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKMeCardNavigationController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKMeCardNavigationController;
  [(CKMeCardNavigationController *)&v4 viewWillAppear:a3];
  [(CKMeCardNavigationController *)self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

@end