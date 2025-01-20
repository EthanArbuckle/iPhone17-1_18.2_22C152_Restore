@interface BuddyUIImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation BuddyUIImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(BuddyUIImageViewAccessibility *)self accessibilityIdentifier];
  char v4 = [v3 hasPrefix:@"LockScreenTitle"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)BuddyUIImageViewAccessibility;
  return [(BuddyUIImageViewAccessibility *)&v6 isAccessibilityElement];
}

- (id)accessibilityLabel
{
  v3 = [(BuddyUIImageViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 hasPrefix:@"LockScreenTitle"];

  if (v4)
  {
    v5 = AXDeviceGetLocalizedShortModelName();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BuddyUIImageViewAccessibility;
    v5 = [(BuddyUIImageViewAccessibility *)&v7 accessibilityLabel];
  }

  return v5;
}

@end