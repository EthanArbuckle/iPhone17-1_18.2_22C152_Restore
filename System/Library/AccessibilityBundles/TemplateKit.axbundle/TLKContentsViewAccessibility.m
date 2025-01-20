@interface TLKContentsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation TLKContentsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKContentsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKContentsView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKContentsView", @"detailsLabels", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F21660] axAttributedStringWithString:&stru_26F810410];
  v4 = [(TLKContentsViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel"];
  [v3 appendString:v4];

  uint64_t v9 = *MEMORY[0x263F1CEC8];
  v10[0] = MEMORY[0x263EFFA88];
  v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  objc_msgSend(v3, "setAttributes:withRange:", v5, 0, objc_msgSend(v3, "length"));

  v6 = [(TLKContentsViewAccessibility *)self safeArrayForKey:@"detailsLabels"];
  v7 = MEMORY[0x245666DB0]();
  [v3 appendString:v7];

  return v3;
}

@end