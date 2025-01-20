@interface GKComposeHeaderFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (GKComposeHeaderFieldAccessibility)initWithFrame:(CGRect)a3;
@end

@implementation GKComposeHeaderFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKComposeHeaderField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKComposeHeaderField", @"nameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKComposeHeaderField", @"valueLabel", "@", 0);
}

- (GKComposeHeaderFieldAccessibility)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKComposeHeaderFieldAccessibility;
  id v3 = -[GKComposeHeaderFieldAccessibility initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(GKComposeHeaderFieldAccessibility *)v3 safeValueForKey:@"nameLabel"];
  v5 = [(GKComposeHeaderFieldAccessibility *)v3 safeValueForKey:@"valueLabel"];
  [v4 setAccessibilityIdentifier:@"ComposeHeaderFieldNameLabel"];
  [v5 setAccessibilityIdentifier:@"ComposeHeaderFieldValueLabel"];

  return v3;
}

@end