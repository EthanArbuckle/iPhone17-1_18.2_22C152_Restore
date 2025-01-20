@interface GKPlayerGameCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation GKPlayerGameCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKPlayerGameCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKPlayerGameCell", @"statsLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKPlayerGameCell", @"dateLabel", "@", 0);
}

- (id)accessibilityLabel
{
  v10.receiver = self;
  v10.super_class = (Class)GKPlayerGameCellAccessibility;
  id v3 = [(GKPlayerGameCellAccessibility *)&v10 accessibilityLabel];
  v4 = [(GKPlayerGameCellAccessibility *)self safeValueForKey:@"statsLabel"];
  v5 = [v4 accessibilityLabel];

  v6 = [(GKPlayerGameCellAccessibility *)self safeValueForKey:@"dateLabel"];
  v7 = [v6 accessibilityLabel];

  v8 = __UIAXStringForVariables();

  return v8;
}

@end