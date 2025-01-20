@interface MapsLargerHitTargetButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation MapsLargerHitTargetButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MapsLargerHitTargetButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(MapsLargerHitTargetButtonAccessibility *)self accessibilityLabel];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MapsLargerHitTargetButtonAccessibility;
  return [(MapsLargerHitTargetButtonAccessibility *)&v6 isAccessibilityElement];
}

@end