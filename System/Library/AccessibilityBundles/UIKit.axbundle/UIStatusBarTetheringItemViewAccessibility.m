@interface UIStatusBarTetheringItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIStatusBarTetheringItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarTetheringItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unsigned int v6 = [(UIStatusBarTetheringItemViewAccessibility *)self safeIntForKey:@"_tetheringConnectionCount"];
  v3 = NSString;
  id v4 = accessibilityLocalizedString(@"status.hotspot.connections");
  id v5 = (id)[v3 localizedStringWithFormat:v6];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarTetheringItemViewAccessibility;
  return [(UIStatusBarTetheringItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

@end