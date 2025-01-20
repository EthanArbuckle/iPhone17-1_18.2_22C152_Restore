@interface SBHWidgetWrapperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomContent;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation SBHWidgetWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHWidgetWrapperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidgetWrapperView", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidgetWrapperView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidgetWrapperView", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidgetWrapperViewController", @"selectedSizeClass", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHWidgetWrapperViewController", @"galleryItem", "@", 0);
  [v3 validateProtocol:@"SBHAddWidgetSheetGalleryItem" hasRequiredInstanceMethod:@"sbh_appName"];
  [v3 validateProtocol:@"SBHAddWidgetSheetGalleryItem" hasRequiredInstanceMethod:@"sbh_widgetName"];
  [v3 validateProtocol:@"SBHAddWidgetSheetGalleryItem" hasRequiredInstanceMethod:@"sbh_widgetDescription"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  id v3 = [(SBHWidgetWrapperViewAccessibility *)self _accessibilityViewController];
  v4 = [v3 safeValueForKey:@"galleryItem"];

  v5 = [(SBHWidgetWrapperViewAccessibility *)self safeValueForKey:@"contentView"];
  v6 = [v5 accessibilityLabel];

  v7 = [(SBHWidgetWrapperViewAccessibility *)self safeValueForKey:@"titleLabel"];
  uint64_t v8 = [v7 accessibilityLabel];

  v9 = [(SBHWidgetWrapperViewAccessibility *)self safeValueForKey:@"subtitleLabel"];
  uint64_t v10 = [v9 accessibilityLabel];

  v11 = [v4 safeStringForKey:@"sbh_appName"];
  v12 = [v4 safeStringForKey:@"sbh_widgetName"];
  id v13 = v6;
  v14 = v13;
  if (([v13 isEqualToString:v8] & 1) == 0)
  {
    v14 = v13;
    if ([(id)v8 length])
    {
      uint64_t v18 = v8;
      v19 = @"__AXStringForVariablesSentinel";
      v14 = __UIAXStringForVariables();
    }
  }
  if ((objc_msgSend((id)v8, "isEqualToString:", v10, v18, v19) & 1) == 0 && objc_msgSend((id)v10, "length"))
  {
    uint64_t v15 = __UIAXStringForVariables();

    v14 = (void *)v15;
  }
  if (!(v8 | v10) && [v11 length] && objc_msgSend(v12, "length"))
  {
    uint64_t v16 = __UIAXStringForVariables();

    v14 = (void *)v16;
  }

  return v14;
}

- (id)accessibilityCustomContent
{
  id v3 = [(SBHWidgetWrapperViewAccessibility *)self _accessibilityViewController];
  v4 = [v3 safeValueForKey:@"galleryItem"];

  v5 = [v4 safeStringForKey:@"widgetDescription"];
  if ([v5 length])
  {
    v6 = (void *)MEMORY[0x263EFABD0];
    v7 = accessibilityLocalizedString(@"widget.description");
    uint64_t v8 = [v6 customContentWithLabel:v7 value:v5];

    [v8 setImportance:1];
    v9 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v8);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBHWidgetWrapperViewAccessibility;
    v9 = [(SBHWidgetWrapperViewAccessibility *)&v11 accessibilityCustomContent];
  }

  return v9;
}

- (id)accessibilityValue
{
  id v3 = [(SBHWidgetWrapperViewAccessibility *)self safeValueForKey:@"contentView"];
  v4 = [v3 accessibilityValue];

  v5 = [(SBHWidgetWrapperViewAccessibility *)self _accessibilityViewController];
  uint64_t v6 = [v5 safeIntegerForKey:@"selectedSizeClass"];

  uint64_t v7 = v6 - 1;
  if (unint64_t)(v6 - 1) <= 0xA && ((0x607u >> v7))
  {
    uint64_t v8 = accessibilityLocalizedString(off_265157CB0[v7]);
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = [(SBHWidgetWrapperViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbhaddwidgetsh_0.isa)];

  if (v9)
  {
    v9 = accessibilityLocalizedString(@"widget.value.suggested");
  }
  uint64_t v10 = __UIAXStringForVariables();

  return v10;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"widget.wrapper.view.hint");
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end