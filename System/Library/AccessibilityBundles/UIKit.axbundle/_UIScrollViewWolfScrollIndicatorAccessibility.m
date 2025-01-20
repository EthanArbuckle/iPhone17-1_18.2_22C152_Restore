@interface _UIScrollViewWolfScrollIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityIdentifier;
@end

@implementation _UIScrollViewWolfScrollIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIScrollViewWolfScrollIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIScrollViewWolfScrollIndicator", @"type", "Q", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityIdentifier
{
  if ([(_UIScrollViewWolfScrollIndicatorAccessibility *)self safeUnsignedIntegerForKey:@"type", a2, self] == 1)v2 = @"WolfScrollIndicatorVertical"; {
  else
  }
    v2 = @"WolfScrollIndicatorHorizontal";

  return v2;
}

@end