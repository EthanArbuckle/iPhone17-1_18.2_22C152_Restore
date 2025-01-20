@interface GAXUIActivityViewControllerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_performActivity:(id)a3;
@end

@implementation GAXUIActivityViewControllerOverride

+ (id)safeCategoryTargetClassName
{
  return @"UIActivityViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_performActivity:(id)a3
{
  id v4 = a3;
  v5 = +[GAXClient sharedInstance];
  unsigned int v6 = [v5 serverMode];

  if (v6 != 2
    || ([v4 activityType],
        v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 hasSuffix:@"addToHomeScreen"],
        v7,
        (v8 & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)GAXUIActivityViewControllerOverride;
    [(GAXUIActivityViewControllerOverride *)&v9 _performActivity:v4];
  }
}

@end