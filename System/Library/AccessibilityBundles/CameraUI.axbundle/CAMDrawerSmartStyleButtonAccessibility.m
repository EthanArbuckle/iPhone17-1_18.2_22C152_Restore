@interface CAMDrawerSmartStyleButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (int64_t)_accessibilityExpandedStatus;
@end

@implementation CAMDrawerSmartStyleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDrawerSmartStyleButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateProtocol:@"CAMControlDrawerExpandableButton" hasMethod:@"isExpanded" isInstanceMethod:1 isRequired:1];
  [v3 validateClass:@"CAMControlDrawerCustomButton" conformsToProtocol:@"CAMControlDrawerExpandableButton"];
  [v3 validateClass:@"CAMDrawerSmartStyleButton" isKindOfClass:@"CAMControlDrawerCustomButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerSmartStyleButton", @"shutterButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)_accessibilityExpandedStatus
{
  if ([(CAMDrawerSmartStyleButtonAccessibility *)self safeBoolForKey:@"isExpanded"])return 1; {
  else
  }
    return 2;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUI3LocalizedString(@"smart.style.button");
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = (void *)MEMORY[0x263EFF980];
  v11.receiver = self;
  v11.super_class = (Class)CAMDrawerSmartStyleButtonAccessibility;
  v4 = [(CAMDrawerSmartStyleButtonAccessibility *)&v11 _accessibilitySupplementaryFooterViews];
  v5 = objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 1, v4);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF980] array];
  }
  v8 = v7;

  v9 = [(CAMDrawerSmartStyleButtonAccessibility *)self safeValueForKey:@"shutterButton"];
  [v9 _setIsAccessibilityElementBlock:&__block_literal_global_3];
  if ([v9 _accessibilityViewIsVisible]) {
    [v8 axSafelyAddObject:v9];
  }

  return v8;
}

uint64_t __80__CAMDrawerSmartStyleButtonAccessibility__accessibilitySupplementaryFooterViews__block_invoke()
{
  return 1;
}

@end