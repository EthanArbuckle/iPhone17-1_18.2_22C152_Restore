@interface SessionBurnBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)accessibilityUpdateBurnBar:(int64_t)a3;
@end

@implementation SessionBurnBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.SessionBurnBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SessionBurnBarViewAccessibility;
  [(SessionBurnBarViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = _accessibilityStringForBurnBarPosition(0, 1);
  [(SessionBurnBarViewAccessibility *)self setAccessibilityLabel:v3];
}

- (void)accessibilityUpdateBurnBar:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SessionBurnBarViewAccessibility;
  -[SessionBurnBarViewAccessibility accessibilityUpdateBurnBar:](&v6, sel_accessibilityUpdateBurnBar_);
  v5 = _accessibilityStringForBurnBarPosition(a3, 1);
  [(SessionBurnBarViewAccessibility *)self setAccessibilityLabel:v5];
}

@end