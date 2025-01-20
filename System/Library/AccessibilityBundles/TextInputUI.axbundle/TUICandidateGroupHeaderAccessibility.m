@interface TUICandidateGroupHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHeaderElements;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TUICandidateGroupHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUICandidateGroupHeader";
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

- (id)accessibilityLabel
{
  v2 = [(TUICandidateGroupHeaderAccessibility *)self safeStringForKey:@"text"];
  v3 = (__CFString *)[v2 mutableCopy];
  if (!CFStringTransform(v3, 0, @"[:Block=Kangxi_Radicals:] NFKC", 0)) {
    _AXAssert();
  }
  v4 = v3;
  v5 = v4;
  if (![(__CFString *)v4 length])
  {
    v5 = v2;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8];
}

- (id)accessibilityHeaderElements
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

@end