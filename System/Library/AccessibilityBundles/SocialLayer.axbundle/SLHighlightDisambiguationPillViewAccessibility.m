@interface SLHighlightDisambiguationPillViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAXAttributedLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SLHighlightDisambiguationPillViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SLHighlightDisambiguationPillView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
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
  objc_opt_class();
  v3 = [(SLHighlightDisambiguationPillViewAccessibility *)self safeValueForKey:@"attribution"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithString:@" "];
    v8 = [v4 uniqueIdentifier];
    objc_msgSend(v7, "setAttribute:forKey:withRange:", v8, *MEMORY[0x263F21880], objc_msgSend(v7, "length") - 1, 1);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end