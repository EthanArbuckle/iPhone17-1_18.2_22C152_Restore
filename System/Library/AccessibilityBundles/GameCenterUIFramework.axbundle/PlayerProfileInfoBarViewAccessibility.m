@interface PlayerProfileInfoBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityInfoViewElements;
- (id)accessibilityElements;
- (void)_setAccessibilityInfoViewElements:(id)a3;
- (void)layoutSubviews;
@end

@implementation PlayerProfileInfoBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterUI.PlayerProfileInfoBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityInfoViewElements
{
}

- (void)_setAccessibilityInfoViewElements:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.PlayerProfileInfoBarView", @"accessibilityInfoItemPairs", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.PlayerProfileInfoBarView", @"layoutSubviews", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = [(PlayerProfileInfoBarViewAccessibility *)self _accessibilityInfoViewElements];
  id v3 = [(PlayerProfileInfoBarViewAccessibility *)self safeArrayForKey:@"accessibilityInfoItemPairs"];
  v4 = (void *)v11[5];
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    v6 = (void *)v11[5];
    v11[5] = v5;

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __62__PlayerProfileInfoBarViewAccessibility_accessibilityElements__block_invoke;
    v9[3] = &unk_265122AF0;
    v9[4] = self;
    v9[5] = &v10;
    [v3 enumerateObjectsUsingBlock:v9];
    [(PlayerProfileInfoBarViewAccessibility *)self _setAccessibilityInfoViewElements:v11[5]];
    v4 = (void *)v11[5];
  }
  id v7 = v4;

  _Block_object_dispose(&v10, 8);

  return v7;
}

void __62__PlayerProfileInfoBarViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 count] >= 2)
  {
    v4 = [v3 objectAtIndexedSubscript:0];
    uint64_t v5 = [v3 objectAtIndexedSubscript:1];
    v6 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);
    id v7 = (void *)[objc_alloc(MEMORY[0x263F81178]) initWithAccessibilityContainer:*(void *)(a1 + 32) representedElements:v6];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62__PlayerProfileInfoBarViewAccessibility_accessibilityElements__block_invoke_2;
    v10[3] = &unk_265122AA8;
    id v11 = v4;
    id v12 = v5;
    id v8 = v5;
    id v9 = v4;
    [v7 _setAccessibilityLabelBlock:v10];
    [v7 _setIsAccessibilityElementBlock:&__block_literal_global];
    [v7 setAccessibilityRespondsToUserInteraction:0];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) axSafelyAddObject:v7];
  }
}

id __62__PlayerProfileInfoBarViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accessibilityLabel];
  uint64_t v5 = [*(id *)(a1 + 40) accessibilityLabel];
  id v3 = __UIAXStringForVariables();

  return v3;
}

uint64_t __62__PlayerProfileInfoBarViewAccessibility_accessibilityElements__block_invoke_3()
{
  return 1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PlayerProfileInfoBarViewAccessibility;
  [(PlayerProfileInfoBarViewAccessibility *)&v3 layoutSubviews];
  [(PlayerProfileInfoBarViewAccessibility *)self _setAccessibilityInfoViewElements:0];
}

@end