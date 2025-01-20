@interface OBAnimationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityRespondsToUserInteraction;
@end

@implementation OBAnimationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBAnimationView";
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