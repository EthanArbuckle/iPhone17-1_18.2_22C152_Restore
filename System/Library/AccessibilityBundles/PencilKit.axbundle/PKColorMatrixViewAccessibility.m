@interface PKColorMatrixViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (PKColorMatrixViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didTapColorButton:(id)a3;
@end

@implementation PKColorMatrixViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKColorMatrixView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKColorMatrixView", @"colorMatrix", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKColorMatrixView", @"colorButtons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKColorMatrixView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKColorMatrixView", @"didTapColorButton:", "v", "@", 0);
  [v3 validateClass:@"PKColorMatrixView" isKindOfClass:@"UIView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v14.receiver = self;
  v14.super_class = (Class)PKColorMatrixViewAccessibility;
  [(PKColorMatrixViewAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKColorMatrixViewAccessibility *)self safeArrayForKey:@"colorMatrix"];
  v4 = [(PKColorMatrixViewAccessibility *)self safeArrayForKey:@"colorButtons"];
  uint64_t v5 = [v3 count];
  if (v5 == [v4 count] && objc_msgSend(v3, "count"))
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [v3 objectAtIndex:v6];
      v8 = [v4 objectAtIndex:v6];
      uint64_t v9 = [v7 count];
      if (v9 == [v8 count] && objc_msgSend(v7, "count"))
      {
        unint64_t v10 = 0;
        do
        {
          v11 = [v7 objectAtIndex:v10];
          v12 = [v8 objectAtIndex:v10];
          v13 = AXColorStringForColor();
          [v12 setAccessibilityLabel:v13];

          ++v10;
        }
        while (v10 < [v7 count]);
      }

      ++v6;
    }
    while (v6 < [v3 count]);
  }
}

- (PKColorMatrixViewAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKColorMatrixViewAccessibility;
  id v3 = -[PKColorMatrixViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKColorMatrixViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  }
  return v4;
}

- (void)didTapColorButton:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKColorMatrixViewAccessibility;
  [(PKColorMatrixViewAccessibility *)&v22 didTapColorButton:v4];
  char v21 = 0;
  objc_opt_class();
  uint64_t v5 = __UIAccessibilityCastAsClass();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v6 = objc_msgSend(v5, "subviews", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    uint64_t v10 = *MEMORY[0x263F1CF38];
    uint64_t v11 = ~*MEMORY[0x263F1CF38];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [v13 accessibilityTraits];
          if (v13 == v4)
          {
            uint64_t v15 = v10 | v14;
            v16 = v4;
          }
          else
          {
            uint64_t v15 = v14 & v11;
            v16 = v13;
          }
          [v16 setAccessibilityTraits:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }
}

@end