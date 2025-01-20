@interface GAXSBScreenFlashOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)flashColor:(id)a3 withCompletion:(id)a4;
@end

@implementation GAXSBScreenFlashOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBScreenFlash";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)flashColor:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[GAXSpringboard sharedInstance];
  unsigned int v9 = [v8 isInactive];

  if (v9)
  {
    v10.receiver = self;
    v10.super_class = (Class)GAXSBScreenFlashOverride;
    [(GAXSBScreenFlashOverride *)&v10 flashColor:v6 withCompletion:v7];
  }
}

@end