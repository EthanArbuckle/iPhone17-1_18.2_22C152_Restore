@interface SBEmptyButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityRespondsToUserInteraction;
@end

@implementation SBEmptyButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBEmptyButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

@end