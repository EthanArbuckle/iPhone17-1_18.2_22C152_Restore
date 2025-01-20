@interface MPMediaControlsStandaloneViewController
- (void)dismissAfter:(double)a3;
- (void)presentAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation MPMediaControlsStandaloneViewController

- (void)dismissAfter:(double)a3
{
  id v3 = [(MPMediaControlsViewController *)self mediaControls];
  [v3 dismiss];
}

- (void)presentAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  [(MPMediaControlsViewController *)self _createMediaControlsIfNeeded];
  [(MPMediaControlsViewController *)self _present];
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }
}

@end