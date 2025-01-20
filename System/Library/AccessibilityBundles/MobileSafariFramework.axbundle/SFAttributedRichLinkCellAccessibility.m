@interface SFAttributedRichLinkCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAXAttributedLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SFAttributedRichLinkCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFAttributedRichLinkCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFAttributedRichLinkCell" hasInstanceVariable:@"_attributionView" withType:"SLAttributionView"];
  [v3 validateClass:@"SFAttributedRichLinkCell" hasInstanceVariable:@"_linkView" withType:"LPLinkView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)_accessibilityAXAttributedLabel
{
  id v3 = [(SFAttributedRichLinkCellAccessibility *)self safeUIViewForKey:@"_linkView"];
  v4 = [v3 accessibilityLabel];

  v5 = [(SFAttributedRichLinkCellAccessibility *)self safeValueForKey:@"_attributionView"];
  v6 = [v5 _accessibilityAXAttributedLabel];

  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithString:v4];
    [v7 appendString:@", "];
    [v7 appendStringOrAXAttributedString:v6];

    v4 = v7;
  }

  return v4;
}

@end