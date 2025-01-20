@interface UIFindSessionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityElementForFindSessionResult;
@end

@implementation UIFindSessionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIFindSession";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityElementForFindSessionResult
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = self;
  if ([location[0] resultCount] <= 0) {
    id v5 = 0;
  }
  else {
    id v5 = (id)[location[0] searchableResponder];
  }
  objc_storeStrong(location, 0);
  v2 = v5;

  return v2;
}

@end