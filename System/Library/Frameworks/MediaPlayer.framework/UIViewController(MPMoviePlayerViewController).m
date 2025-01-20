@interface UIViewController(MPMoviePlayerViewController)
- (uint64_t)dismissMoviePlayerViewControllerAnimated;
- (uint64_t)presentMoviePlayerViewControllerAnimated:()MPMoviePlayerViewController;
@end

@implementation UIViewController(MPMoviePlayerViewController)

- (uint64_t)dismissMoviePlayerViewControllerAnimated
{
  return [a1 dismissViewControllerAnimated:1 completion:0];
}

- (uint64_t)presentMoviePlayerViewControllerAnimated:()MPMoviePlayerViewController
{
  return [a1 presentViewController:a3 animated:1 completion:0];
}

@end