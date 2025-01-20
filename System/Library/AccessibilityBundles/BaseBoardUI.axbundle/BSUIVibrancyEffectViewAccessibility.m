@interface BSUIVibrancyEffectViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation BSUIVibrancyEffectViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BSUIVibrancyEffectView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BSUIVibrancyEffectView", @"isEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BSUIVibrancyEffectView", @"contentView", "@", 0);
}

- (id)accessibilityElements
{
  if ([(BSUIVibrancyEffectViewAccessibility *)self safeBoolForKey:@"isEnabled"])
  {
    id v3 = [(BSUIVibrancyEffectViewAccessibility *)self safeUIViewForKey:@"contentView"];
    v4 = [v3 subviews];

    [v4 enumerateObjectsUsingBlock:&__block_literal_global_0];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BSUIVibrancyEffectViewAccessibility;
    v4 = [(BSUIVibrancyEffectViewAccessibility *)&v6 accessibilityElements];
  }

  return v4;
}

uint64_t __60__BSUIVibrancyEffectViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilitySetOverridesInvisibility:1];
}

@end