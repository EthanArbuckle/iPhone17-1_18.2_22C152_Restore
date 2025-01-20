@interface LUILogViewerPageViewController
- (BOOL)_canShowWhileLocked;
@end

@implementation LUILogViewerPageViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end