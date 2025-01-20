@interface SBFLockScreenDateSubtitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityPointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SBFLockScreenDateSubtitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFLockScreenDateSubtitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityPointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SBFLockScreenDateSubtitleViewAccessibility *)self frame];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

@end