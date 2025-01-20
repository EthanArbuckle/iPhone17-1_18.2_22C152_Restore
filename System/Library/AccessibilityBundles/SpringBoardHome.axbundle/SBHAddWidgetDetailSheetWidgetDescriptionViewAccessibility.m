@interface SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHAddWidgetDetailSheetWidgetDescriptionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHAddWidgetDetailSheetWidgetDescriptionView", @"titleLabel", "@", 0);
  [v3 validateClass:@"SBHAddWidgetDetailSheetWidgetDescriptionView" isKindOfClass:@"UIView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility;
  [(SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility *)self safeValueForKey:@"titleLabel"];
  if (v3) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v3);
  }
}

- (BOOL)accessibilityElementsHidden
{
  [(SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility *)self accessibilityFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [(SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  [v11 accessibilityFrame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v23.origin.x = v13;
  v23.origin.y = v15;
  v23.size.width = v17;
  v23.size.height = v19;
  CGRect v22 = CGRectIntersection(v21, v23);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  return !CGRectEqualToRect(v22, v24);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility;
  [(SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility *)&v3 layoutSubviews];
  [(SBHAddWidgetDetailSheetWidgetDescriptionViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end