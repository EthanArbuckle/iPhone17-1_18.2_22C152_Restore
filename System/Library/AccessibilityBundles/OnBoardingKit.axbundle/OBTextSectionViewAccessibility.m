@interface OBTextSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (OBTextSectionViewAccessibility)initWithHeader:(id)a3 content:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation OBTextSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBTextSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBTextSectionView", @"headerLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBTextSectionView", @"initWithHeader:content:", "@", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)OBTextSectionViewAccessibility;
  [(OBTextSectionViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CF48] | *MEMORY[0x263F1CEF8];
  v4 = [(OBTextSectionViewAccessibility *)self safeUIViewForKey:@"headerLabel"];
  [v4 setAccessibilityTraits:v3];
}

- (OBTextSectionViewAccessibility)initWithHeader:(id)a3 content:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)OBTextSectionViewAccessibility;
  v4 = [(OBTextSectionViewAccessibility *)&v6 initWithHeader:a3 content:a4];
  [(OBTextSectionViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

@end