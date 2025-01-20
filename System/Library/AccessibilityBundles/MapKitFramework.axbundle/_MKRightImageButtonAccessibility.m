@interface _MKRightImageButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _MKRightImageButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_MKRightImageButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MKRightImageButton", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MKRightImageButton", @"imageView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  id v3 = [(_MKRightImageButtonAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [v3 accessibilityLabel];

  if (![v4 length])
  {
    v5 = [(_MKRightImageButtonAccessibility *)self safeValueForKey:@"imageView"];
    uint64_t v6 = [v5 accessibilityLabel];

    v4 = (void *)v6;
  }

  return v4;
}

@end