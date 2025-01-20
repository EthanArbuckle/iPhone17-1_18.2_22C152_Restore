@interface ReflectionPromptViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axShuffle:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ReflectionPromptViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MomentsUIService.ReflectionPromptView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MomentsUIService.ReflectionPromptView" hasSwiftField:@"categoryLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"MomentsUIService.ReflectionPromptView" hasSwiftField:@"reflectionPrompt" withSwiftType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MomentsUIService.ReflectionPromptView", @"updatePromptIndex:", "v", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(ReflectionPromptViewAccessibility *)self safeSwiftValueForKey:@"categoryLabel"];
  v4 = [(ReflectionPromptViewAccessibility *)self safeSwiftValueForKey:@"reflectionPrompt"];
  v5 = [v3 accessibilityLabel];
  v8 = [v4 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityCustomActions
{
  v9.receiver = self;
  v9.super_class = (Class)ReflectionPromptViewAccessibility;
  id v3 = [(ReflectionPromptViewAccessibility *)&v9 accessibilityCustomActions];
  v4 = (void *)[v3 mutableCopy];

  if (!v4)
  {
    v4 = [MEMORY[0x263EFF980] array];
  }
  id v5 = objc_alloc(MEMORY[0x263F1C390]);
  v6 = accessibilityJurassicLocalizedString(@"shuffle.reflection");
  v7 = (void *)[v5 initWithName:v6 target:self selector:sel__axShuffle_];
  [v4 addObject:v7];

  return v4;
}

- (BOOL)_axShuffle:(id)a3
{
  return 1;
}

void __48__ReflectionPromptViewAccessibility__axShuffle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updatePromptIndex:0];
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE18];
  id v3 = *(void **)(a1 + 32);

  UIAccessibilityPostNotification(v2, v3);
}

@end