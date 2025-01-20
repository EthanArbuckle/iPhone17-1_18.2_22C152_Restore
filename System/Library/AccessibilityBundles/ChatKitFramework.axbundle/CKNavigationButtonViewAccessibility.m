@interface CKNavigationButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CKNavigationButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKNavigationButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNavigationButtonView", @"iconImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNavigationButtonView", @"textLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CKNavigationButtonViewAccessibility *)self safeValueForKey:@"textLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (CGRect)accessibilityFrame
{
  id v3 = [(CKNavigationButtonViewAccessibility *)self safeValueForKey:@"iconImageView"];
  [v3 accessibilityFrame];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  v12 = [(CKNavigationButtonViewAccessibility *)self safeValueForKey:@"textLabel"];
  [v12 accessibilityFrame];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;

  uint64_t v21 = v5;
  uint64_t v22 = v7;
  uint64_t v23 = v9;
  uint64_t v24 = v11;
  uint64_t v25 = v14;
  uint64_t v26 = v16;
  uint64_t v27 = v18;
  uint64_t v28 = v20;

  return CGRectUnion(*(CGRect *)&v21, *(CGRect *)&v25);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CKNavigationButtonViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CKNavigationButtonViewAccessibility *)&v3 accessibilityTraits];
}

@end