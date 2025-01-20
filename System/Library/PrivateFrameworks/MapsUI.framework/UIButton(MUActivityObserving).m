@interface UIButton(MUActivityObserving)
- (void)beginAnimatingActivityIndicator;
- (void)endAnimatingActivityIndicatorWithError:()MUActivityObserving;
@end

@implementation UIButton(MUActivityObserving)

- (void)beginAnimatingActivityIndicator
{
  id v2 = [a1 configuration];
  [v2 setShowsActivityIndicator:1];
  [a1 setConfiguration:v2];
}

- (void)endAnimatingActivityIndicatorWithError:()MUActivityObserving
{
  id v2 = [a1 configuration];
  [v2 setShowsActivityIndicator:0];
  [a1 setConfiguration:v2];
}

@end