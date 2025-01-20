@interface PHMessageComposeViewController
- (BOOL)_canShowWhileLocked;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHMessageComposeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PHMessageComposeViewController;
  [(PHMessageComposeViewController *)&v3 viewWillAppear:a3];
  +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHMessageComposeViewControllerAssertionReason"];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PHMessageComposeViewController;
  [(PHMessageComposeViewController *)&v3 viewDidDisappear:a3];
  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHMessageComposeViewControllerAssertionReason"];
}

@end