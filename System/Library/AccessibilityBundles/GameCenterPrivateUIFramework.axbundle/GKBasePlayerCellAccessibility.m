@interface GKBasePlayerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation GKBasePlayerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKBasePlayerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(GKBasePlayerCellAccessibility *)self safeValueForKey:@"nameLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end