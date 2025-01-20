@interface ICDocCamNonRotatableViewController
- (BOOL)_allowsAutorotation;
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotate;
@end

@implementation ICDocCamNonRotatableViewController

- (BOOL)_allowsAutorotation
{
  return 0;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end