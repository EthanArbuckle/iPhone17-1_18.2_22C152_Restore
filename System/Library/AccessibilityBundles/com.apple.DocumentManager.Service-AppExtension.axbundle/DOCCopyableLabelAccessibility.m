@interface DOCCopyableLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axBehavesAsLink;
- (BOOL)_axHasCopyGesture;
- (BOOL)accessibilityActivate;
- (id)accessibilityCustomActions;
- (unint64_t)accessibilityTraits;
- (void)_axCopyDetail;
@end

@implementation DOCCopyableLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"com_apple_DocumentManager_Service.DOCCopyableLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCCopyableLabel", @"copyDetail", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCCopyableLabel", @"handleTapWithSender:", "v", "@", 0);
  [v3 validateClass:@"com_apple_DocumentManager_Service.DOCCopyableLabel" hasSwiftField:@"supportsCopy" withSwiftType:"Bool"];
  [v3 validateClass:@"com_apple_DocumentManager_Service.DOCCopyableLabel" hasSwiftField:@"behaveAsLink" withSwiftType:"Bool"];
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)DOCCopyableLabelAccessibility;
  unint64_t v3 = [(DOCCopyableLabelAccessibility *)&v6 accessibilityTraits];
  if ([(DOCCopyableLabelAccessibility *)self _axHasCopyGesture]) {
    uint64_t v4 = ~*MEMORY[0x263F1CEE8];
  }
  else {
    uint64_t v4 = -1;
  }
  return v4 & v3;
}

- (id)accessibilityCustomActions
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  v9.receiver = self;
  v9.super_class = (Class)DOCCopyableLabelAccessibility;
  uint64_t v4 = [(DOCCopyableLabelAccessibility *)&v9 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  if ([(DOCCopyableLabelAccessibility *)self _axHasCopyGesture])
  {
    id v5 = objc_alloc(MEMORY[0x263F1C390]);
    objc_super v6 = accessibilityLocalizedString(@"copy");
    v7 = (void *)[v5 initWithName:v6 target:self selector:sel__axCopyDetail];
    [v3 addObject:v7];
  }

  return v3;
}

- (void)_axCopyDetail
{
}

uint64_t __46__DOCCopyableLabelAccessibility__axCopyDetail__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) copyDetail];
}

- (BOOL)_axHasCopyGesture
{
  v2 = [(DOCCopyableLabelAccessibility *)self safeSwiftValueForKey:@"supportsCopy"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_axBehavesAsLink
{
  v2 = [(DOCCopyableLabelAccessibility *)self safeSwiftValueForKey:@"behaveAsLink"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)accessibilityActivate
{
  BOOL v3 = [(DOCCopyableLabelAccessibility *)self _axBehavesAsLink];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1CA70]);
    [v4 setState:3];
    [(DOCCopyableLabelAccessibility *)self handleTapWithSender:v4];
  }
  return v3;
}

@end