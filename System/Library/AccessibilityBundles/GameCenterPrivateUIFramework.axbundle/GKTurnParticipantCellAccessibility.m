@interface GKTurnParticipantCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation GKTurnParticipantCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKTurnParticipantCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKTurnParticipantCell", @"topLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKTurnParticipantCell", @"bottomLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKBaseGameCell", @"nameLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(GKTurnParticipantCellAccessibility *)self safeValueForKey:@"topLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(GKTurnParticipantCellAccessibility *)self safeValueForKey:@"nameLabel"];
  v6 = [v5 accessibilityLabel];
  v7 = [(GKTurnParticipantCellAccessibility *)self safeValueForKey:@"bottomLabel"];
  v10 = [v7 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  return v8;
}

@end