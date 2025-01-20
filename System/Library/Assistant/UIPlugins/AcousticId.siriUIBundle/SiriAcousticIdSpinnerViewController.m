@interface SiriAcousticIdSpinnerViewController
- (BOOL)removedAfterDialogProgresses;
- (double)desiredHeight;
- (int64_t)_insertionAnimation;
- (int64_t)_pinAnimationType;
- (void)_aceObjectViewControllerWillBeRemoved;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SiriAcousticIdSpinnerViewController

- (void)loadView
{
  v3 = -[SiriAcousticIdSpinnerView initWithFrame:]([SiriAcousticIdSpinnerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(SiriAcousticIdSpinnerViewController *)self setView:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriAcousticIdSpinnerViewController;
  [(SiriAcousticIdSpinnerViewController *)&v5 viewWillAppear:a3];
  v4 = [(SiriAcousticIdSpinnerViewController *)self view];
  [v4 animateIn];
}

- (void)_aceObjectViewControllerWillBeRemoved
{
  id v4 = [(SiriAcousticIdSpinnerViewController *)self delegate];
  v3 = [(SiriAcousticIdSpinnerViewController *)self view];
  [v4 siriViewController:self didHideVibrantView:v3];
}

- (BOOL)removedAfterDialogProgresses
{
  return 1;
}

- (double)desiredHeight
{
  return 54.0;
}

- (int64_t)_pinAnimationType
{
  return 0;
}

- (int64_t)_insertionAnimation
{
  return 0;
}

@end