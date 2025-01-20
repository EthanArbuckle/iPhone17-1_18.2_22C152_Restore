@interface AKTapToSignInViewController
- (void)_provideDelegateWithAuthResults:(id)a3 error:(id)a4;
@end

@implementation AKTapToSignInViewController

- (void)_provideDelegateWithAuthResults:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AKBaseSignInViewController *)self delegate];
  [v8 tapToSignInViewController:self didAuthenticateWithResults:v7 error:v6];
}

@end