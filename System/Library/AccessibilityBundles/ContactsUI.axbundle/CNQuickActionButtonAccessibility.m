@interface CNQuickActionButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_labelText;
- (id)button;
- (unint64_t)accessibilityTraits;
@end

@implementation CNQuickActionButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNQuickActionButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNQuickActionButton", @"showTitle", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNQuickActionButton", @"button", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNQuickActionButton", @"action", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNQuickAction", @"titleForContext:", "@", "q", 0);
}

- (id)_labelText
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__4;
  v8 = __Block_byref_object_dispose__4;
  id v9 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __46__CNQuickActionButtonAccessibility__labelText__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"action"];
  uint64_t v2 = [v5 titleForContext:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  return [(CNQuickActionButtonAccessibility *)self safeBoolForKey:@"showTitle"];
}

- (id)button
{
  v6.receiver = self;
  v6.super_class = (Class)CNQuickActionButtonAccessibility;
  uint64_t v3 = [(CNQuickActionButtonAccessibility *)&v6 button];
  uint64_t v4 = [(CNQuickActionButtonAccessibility *)self _labelText];
  [v3 setAccessibilityLabel:v4];

  return v3;
}

@end