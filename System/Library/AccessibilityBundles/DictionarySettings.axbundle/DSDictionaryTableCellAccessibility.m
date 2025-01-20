@interface DSDictionaryTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)updateLabels;
@end

@implementation DSDictionaryTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DSDictionaryTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DUDefinitionDictionary"];
  [v3 validateClass:@"DSDictionaryTableCell" isKindOfClass:@"PSTableCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DSDictionaryTableCell", @"definitionDictionary", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DUDefinitionDictionary", @"definitionLanguage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DSDictionaryTableCell", @"updateLabels", "v", 0);
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)DSDictionaryTableCellAccessibility;
  unint64_t v3 = [(DSDictionaryTableCellAccessibility *)&v8 accessibilityTraits];
  v4 = [(DSDictionaryTableCellAccessibility *)self safeValueForKey:@"imageView"];
  v5 = __UIAccessibilitySafeClass();

  LODWORD(v4) = [v5 isHidden];
  uint64_t v6 = *MEMORY[0x263F1CF38];
  if (v4) {
    uint64_t v6 = 0;
  }
  return v6 | v3;
}

- (void)updateLabels
{
  v11.receiver = self;
  v11.super_class = (Class)DSDictionaryTableCellAccessibility;
  [(DSDictionaryTableCellAccessibility *)&v11 updateLabels];
  unint64_t v3 = (void *)MEMORY[0x263F21660];
  objc_opt_class();
  v4 = [(DSDictionaryTableCellAccessibility *)self safeValueForKey:@"detailTextLabel"];
  v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = [v5 text];
  v7 = [v3 axAttributedStringWithString:v6];

  objc_super v8 = [(DSDictionaryTableCellAccessibility *)self safeValueForKey:@"definitionDictionary"];
  v9 = [v8 safeStringForKey:@"definitionLanguage"];
  [v7 setAttribute:v9 forKey:*MEMORY[0x263F217F0]];

  v10 = [(DSDictionaryTableCellAccessibility *)self safeValueForKey:@"detailTextLabel"];
  [v10 setAccessibilityLabel:v7];
}

@end