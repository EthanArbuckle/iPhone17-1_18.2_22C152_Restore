@interface SLHighlightPillViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAXAttributedLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SLHighlightPillViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SLHighlightPillView";
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
  v2 = [(SLHighlightPillViewAccessibility *)self safeArrayForKey:@"_attributionIdentifiers"];
  if ([v2 count])
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithString:@" "];
    objc_msgSend(v3, "setAttribute:forKey:withRange:", v2, *MEMORY[0x263F21880], objc_msgSend(v3, "length") - 1, 1);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end