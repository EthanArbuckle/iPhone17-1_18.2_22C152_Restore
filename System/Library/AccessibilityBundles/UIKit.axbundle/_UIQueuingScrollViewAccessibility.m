@interface _UIQueuingScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)canBecomeFocused;
- (CGRect)accessibilityFrame;
@end

@implementation _UIQueuingScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIQueuingScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGRect)accessibilityFrame
{
  id v10 = (id)[(_UIQueuingScrollViewAccessibility *)self safeValueForKey:@"visibleView"];
  [v10 accessibilityFrame];
  double v11 = v2;
  double v12 = v3;
  double v13 = v4;
  double v14 = v5;

  double v6 = v11;
  double v7 = v12;
  double v8 = v13;
  double v9 = v14;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)canBecomeFocused
{
  double v6 = self;
  SEL v5 = a2;
  char v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIQueuingScrollViewAccessibility;
  char v4 = [(_UIQueuingScrollViewAccessibility *)&v3 canBecomeFocused];
  if ([(_UIQueuingScrollViewAccessibility *)v6 _accessibilityIsFKARunningForFocusItem])return 0; {
  else
  }
    return v4 & 1;
}

@end