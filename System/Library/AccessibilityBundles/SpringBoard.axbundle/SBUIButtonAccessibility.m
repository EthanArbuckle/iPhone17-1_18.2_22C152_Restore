@interface SBUIButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGRect)accessibilityFrame;
@end

@implementation SBUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGRect)accessibilityFrame
{
  v16.receiver = self;
  v16.super_class = (Class)SBUIButtonAccessibility;
  [(SBUIButtonAccessibility *)&v16 accessibilityFrame];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  v11 = [(SBUIButtonAccessibility *)self accessibilityIdentifier];
  if (([v11 isEqualToString:@"AppSwitcherPlay"] & 1) != 0
    || ([v11 isEqualToString:@"AppSwitcherPrev"] & 1) != 0
    || [v11 isEqualToString:@"AppSwitcherNext"])
  {
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    CGRect v18 = CGRectInset(v17, 0.0, -10.0);
    CGFloat x = v18.origin.x;
    CGFloat y = v18.origin.y;
    CGFloat width = v18.size.width;
    CGFloat height = v18.size.height;
  }

  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

@end