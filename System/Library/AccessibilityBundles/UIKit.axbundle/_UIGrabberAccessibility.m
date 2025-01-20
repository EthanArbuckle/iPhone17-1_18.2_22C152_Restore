@interface _UIGrabberAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGPoint)_accessibilityVisiblePoint;
- (id)accessibilityLabel;
@end

@implementation _UIGrabberAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIGrabber";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)_accessibilityVisiblePoint
{
  [(_UIGrabberAccessibility *)self accessibilityFrame];
  AX_CGRectGetCenter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)accessibilityLabel
{
  v7[2] = self;
  v7[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)_UIGrabberAccessibility;
  v7[0] = [(_UIGrabberAccessibility *)&v6 accessibilityLabel];
  if (![v7[0] length])
  {
    id v2 = accessibilityLocalizedString(@"sheet.grabber");
    id v3 = v7[0];
    v7[0] = v2;
  }
  id v5 = v7[0];
  objc_storeStrong(v7, 0);

  return v5;
}

@end