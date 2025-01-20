@interface SBHAddWidgetDetailSheetTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SBHAddWidgetDetailSheetTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHAddWidgetDetailSheetTitleView";
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
  v2 = [(SBHAddWidgetDetailSheetTitleViewAccessibility *)self accessibilityLabel];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)accessibilityLabel
{
  BOOL v3 = [(SBHAddWidgetDetailSheetTitleViewAccessibility *)self safeValueForKey:@"textLabel"];
  v4 = [v3 accessibilityLabel];

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHAddWidgetDetailSheetTitleViewAccessibility;
    id v5 = [(SBHAddWidgetDetailSheetTitleViewAccessibility *)&v8 accessibilityLabel];
  }
  v6 = v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  BOOL v3 = [(SBHAddWidgetDetailSheetTitleViewAccessibility *)self accessibilityLabel];
  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBHAddWidgetDetailSheetTitleViewAccessibility;
    unint64_t v4 = *MEMORY[0x263F1CEF8] | [(SBHAddWidgetDetailSheetTitleViewAccessibility *)&v7 accessibilityTraits];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHAddWidgetDetailSheetTitleViewAccessibility;
    unint64_t v4 = [(SBHAddWidgetDetailSheetTitleViewAccessibility *)&v6 accessibilityTraits];
  }

  return v4;
}

@end