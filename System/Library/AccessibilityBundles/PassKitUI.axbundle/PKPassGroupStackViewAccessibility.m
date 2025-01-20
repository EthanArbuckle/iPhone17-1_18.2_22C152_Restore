@interface PKPassGroupStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (PKPassGroupStackViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setModalGroupIndex:(unint64_t)a3;
- (void)setPresentationState:(int)a3 animated:(BOOL)a4;
@end

@implementation PKPassGroupStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassGroupStackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPassGroupStackView" hasInstanceVariable:@"_headerContainerView" withType:"PKPassthroughView"];
  [v3 validateClass:@"PKPassGroupStackView" hasInstanceVariable:@"_subheaderContainerView" withType:"PKPassthroughView"];
  [v3 validateClass:@"PKPassGroupStackView" hasInstanceVariable:@"_passContainerView" withType:"PKPassthroughView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassGroupStackView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (PKPassGroupStackViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassGroupStackViewAccessibility;
  id v3 = -[PKPassGroupStackViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PKPassGroupStackViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)PKPassGroupStackViewAccessibility;
  [(PKPassGroupStackViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKPassGroupStackViewAccessibility *)self safeValueForKey:@"_headerContainerView"];
  [v3 setAccessibilityViewIsModal:0];

  v4 = [(PKPassGroupStackViewAccessibility *)self safeValueForKey:@"_subheaderContainerView"];
  [v4 setAccessibilityViewIsModal:0];

  objc_super v5 = [(PKPassGroupStackViewAccessibility *)self safeValueForKey:@"_passContainerView"];
  [v5 setAccessibilityViewIsModal:0];

  v6 = [(PKPassGroupStackViewAccessibility *)self safeValueForKey:@"_headerContainerView"];
  [v6 setAccessibilityIdentifier:@"HeaderContainerView"];

  v7 = [(PKPassGroupStackViewAccessibility *)self safeValueForKey:@"_subheaderContainerView"];
  [v7 setAccessibilityIdentifier:@"SubheaderContainerView"];

  v8 = [(PKPassGroupStackViewAccessibility *)self safeValueForKey:@"_passContainerView"];
  [v8 setAccessibilityIdentifier:@"PassContainerView"];
}

- (void)setPresentationState:(int)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassGroupStackViewAccessibility;
  [(PKPassGroupStackViewAccessibility *)&v4 setPresentationState:*(void *)&a3 animated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)setModalGroupIndex:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v5 = [(PKPassGroupStackViewAccessibility *)self safeValueForKey:@"_modallyPresentedGroupView"];
  [v5 setAccessibilityViewIsModal:0];

  v16.receiver = self;
  v16.super_class = (Class)PKPassGroupStackViewAccessibility;
  [(PKPassGroupStackViewAccessibility *)&v16 setModalGroupIndex:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = [(PKPassGroupStackViewAccessibility *)self safeValueForKey:@"_groupViewsByGroupID", 0];
  v7 = [v6 allObjects];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setAccessibilityViewIsModal:0];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

@end