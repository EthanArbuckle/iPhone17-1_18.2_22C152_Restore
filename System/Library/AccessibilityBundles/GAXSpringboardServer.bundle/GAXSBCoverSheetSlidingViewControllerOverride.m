@interface GAXSBCoverSheetSlidingViewControllerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_finishTransitionToPresented:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5;
@end

@implementation GAXSBCoverSheetSlidingViewControllerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBCoverSheetSlidingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_finishTransitionToPresented:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (!v6)
  {
    v9 = +[GAXSpringboard sharedInstance];
    unsigned int v10 = [v9 isEnabled];

    if (v10)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_9130;
      v14[3] = &unk_286E8;
      id v15 = objc_retainBlock(v8);
      id v11 = v15;
      v12 = objc_retainBlock(v14);

      id v8 = v12;
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)GAXSBCoverSheetSlidingViewControllerOverride;
  [(GAXSBCoverSheetSlidingViewControllerOverride *)&v13 _finishTransitionToPresented:v6 animated:v5 withCompletion:v8];
}

@end