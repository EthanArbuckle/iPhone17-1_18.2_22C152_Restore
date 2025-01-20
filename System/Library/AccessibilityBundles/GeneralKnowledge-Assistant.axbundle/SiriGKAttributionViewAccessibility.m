@interface SiriGKAttributionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SiriGKAttributionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriGKAttributionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SiriGKAttributionViewAccessibility *)self safeValueForKey:@"command"];
  v3 = [v2 safeValueForKey:@"punchOutUri"];
  v4 = [v3 safeValueForKey:@"host"];

  if ([v4 length])
  {
    v5 = NSString;
    v6 = accessibilityLocalizedString(@"providedby.format");
    v7 = objc_msgSend(v5, "stringWithFormat:", v6, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end