@interface PREditingColorItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
@end

@implementation PREditingColorItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PREditingColorItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditingColorItemView", @"colorItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditingColorItemView", @"localizedName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditingColorItem", @"displayColor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRPosterColor", @"color", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  id v3 = [(PREditingColorItemViewAccessibility *)self safeStringForKey:@"localizedName"];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(PREditingColorItemViewAccessibility *)self safeValueForKeyPath:@"colorItem.displayColor.color"];
    if (v6)
    {
      uint64_t v7 = AXColorStringForColor();
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)PREditingColorItemViewAccessibility;
      uint64_t v7 = [(PREditingColorItemViewAccessibility *)&v9 accessibilityValue];
    }
    id v5 = (id)v7;
  }

  return v5;
}

@end