@interface ParagraphViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation ParagraphViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.ParagraphView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.ParagraphView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.ParagraphView", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.ParagraphView", @"layoutSubviews", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(ParagraphViewAccessibility *)self _axLabel];
  id v3 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (id)_axLabel
{
  return (id)[(ParagraphViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"title, text"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)ParagraphViewAccessibility;
  [(ParagraphViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(ParagraphViewAccessibility *)self _accessibilityDescendantOfType:objc_opt_class()];
  v4 = __UIAccessibilityCastAsClass();

  BOOL v5 = [v4 text];
  v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v7 = [v5 stringByTrimmingCharactersInSet:v6];
  uint64_t v8 = [v7 length];

  if (!v8) {
    [v4 setIsAccessibilityElement:0];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ParagraphViewAccessibility;
  [(ParagraphViewAccessibility *)&v3 layoutSubviews];
  [(ParagraphViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end