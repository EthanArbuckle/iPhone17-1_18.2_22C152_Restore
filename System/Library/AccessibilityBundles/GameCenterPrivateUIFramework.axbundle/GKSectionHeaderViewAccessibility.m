@interface GKSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (GKSectionHeaderViewAccessibility)initWithFrame:(CGRect)a3;
@end

@implementation GKSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"GKSectionHeaderView" hasInstanceVariable:@"_leftLabel" withType:"GKLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKSectionHeaderView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (GKSectionHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKSectionHeaderViewAccessibility;
  id v3 = -[GKSectionHeaderViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(GKSectionHeaderViewAccessibility *)v3 safeValueForKey:@"_leftLabel"];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];

  return v3;
}

@end