@interface FollowNavButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityPath;
@end

@implementation FollowNavButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.FollowNavButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityPath
{
  v2 = (void *)MEMORY[0x263F1C478];
  [(FollowNavButtonAccessibility *)self accessibilityFrame];

  return (id)objc_msgSend(v2, "_bezierPathWithArcRoundedRect:cornerRadius:");
}

@end