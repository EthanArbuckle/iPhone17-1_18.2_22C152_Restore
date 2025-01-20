@interface CCUIContentModuleContainerClientDrivenTransition
- (id)customAnimator;
@end

@implementation CCUIContentModuleContainerClientDrivenTransition

- (id)customAnimator
{
  v4 = [(CCUIContentModuleContainerTransition *)self viewController];
  v5 = [v4 contentViewController];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"CCUIContentModuleContainerViewController.m" lineNumber:1390 description:@"How did we get here if the client doesn't implement the required method?"];
  }
  v6 = [v5 customAnimator];

  return v6;
}

@end