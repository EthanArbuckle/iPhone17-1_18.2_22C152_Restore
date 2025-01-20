@interface GAX_UIOpenInIBooksActivityOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canPerformWithActivityItems:(id)a3;
@end

@implementation GAX_UIOpenInIBooksActivityOverride

+ (id)safeCategoryTargetClassName
{
  return @"UIOpenInIBooksActivity";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GAX_UIOpenInIBooksActivityOverride;
  unsigned int v3 = [(GAX_UIOpenInIBooksActivityOverride *)&v7 canPerformWithActivityItems:a3];
  if (v3)
  {
    v4 = +[GAXClient sharedInstance];
    unsigned __int8 v5 = [v4 isActive];

    LOBYTE(v3) = v5 ^ 1;
  }
  return v3;
}

@end