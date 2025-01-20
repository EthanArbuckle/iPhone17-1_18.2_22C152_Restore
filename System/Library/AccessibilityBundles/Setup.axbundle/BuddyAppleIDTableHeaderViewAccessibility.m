@interface BuddyAppleIDTableHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BuddyAppleIDTableHeaderViewAccessibility)initWithFrame:(CGRect)a3;
@end

@implementation BuddyAppleIDTableHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddyAppleIDTableHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BuddyAppleIDTableHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BuddyAppleIDTableHeaderViewAccessibility;
  v3 = -[BuddyAppleIDTableHeaderViewAccessibility initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(BuddyAppleIDTableHeaderViewAccessibility *)v3 safeValueForKey:@"_textLabel"];
  v5 = [(BuddyAppleIDTableHeaderViewAccessibility *)v3 safeValueForKey:@"_textLabel"];
  uint64_t v6 = [v5 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v6];

  return v3;
}

@end