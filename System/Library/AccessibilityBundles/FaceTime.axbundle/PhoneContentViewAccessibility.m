@interface PhoneContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation PhoneContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PhoneContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  if ([(PhoneContentViewAccessibility *)self _accessibilityViewIsVisible]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PhoneContentViewAccessibility;
  return [(PhoneContentViewAccessibility *)&v4 accessibilityViewIsModal];
}

@end