@interface HLPHelpTableOfContentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateWithHelpBookController:(id)a3;
@end

@implementation HLPHelpTableOfContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HLPHelpTableOfContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HLPHelpTableOfContentViewController" hasInstanceVariable:@"_copyrightFooterLabel" withType:"UILabel"];
  [v3 validateClass:@"HLPHelpTableOfContentViewController" hasInstanceVariable:@"_footerViewOverlayButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HLPHelpTableOfContentViewController", @"helpBookController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HLPHelpBookController", @"copyrightTopicIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HLPHelpTableOfContentViewController", @"updateWithHelpBookController:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HLPHelpBookController", @"helpTopicItemForID:", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v16.receiver = self;
  v16.super_class = (Class)HLPHelpTableOfContentViewControllerAccessibility;
  [(HLPHelpTableOfContentViewControllerAccessibility *)&v16 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HLPHelpTableOfContentViewControllerAccessibility *)self safeValueForKey:@"_copyrightFooterLabel"];
  v4 = [(HLPHelpTableOfContentViewControllerAccessibility *)self safeValueForKey:@"_footerViewOverlayButton"];
  [v3 setIsAccessibilityElement:0];
  v5 = [v3 accessibilityLabel];
  [v4 setAccessibilityLabel:v5];

  v6 = [(HLPHelpTableOfContentViewControllerAccessibility *)self safeValueForKey:@"helpBookController"];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  uint64_t v9 = MEMORY[0x263EF8330];
  id v7 = v6;
  AXPerformSafeBlock();
  id v8 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  if (!v8) {
    objc_msgSend(v4, "_accessibilityRemoveTrait:", *MEMORY[0x263F1CEE8], v9, 3221225472, __94__HLPHelpTableOfContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke, &unk_265127568);
  }
}

void __94__HLPHelpTableOfContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [v2 safeStringForKey:@"copyrightTopicIdentifier"];
  uint64_t v3 = [v2 helpTopicItemForID:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)updateWithHelpBookController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HLPHelpTableOfContentViewControllerAccessibility;
  [(HLPHelpTableOfContentViewControllerAccessibility *)&v4 updateWithHelpBookController:a3];
  [(HLPHelpTableOfContentViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end