@interface GKTurnGameCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation GKTurnGameCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKTurnGameCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKTurnGameCell", @"activeMatchesLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKTurnGameCell", @"localPlayerTurnsLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKBaseGameCell", @"nameLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(GKTurnGameCellAccessibility *)self safeValueForKey:@"activeMatchesLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(GKTurnGameCellAccessibility *)self safeValueForKey:@"nameLabel"];
  v6 = [v5 accessibilityLabel];
  v7 = [(GKTurnGameCellAccessibility *)self safeValueForKey:@"localPlayerTurnsLabel"];
  v10 = [v7 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  return v8;
}

@end