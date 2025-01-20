@interface MRUActivityMirroringViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MRUActivityMirroringViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUActivityMirroringView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUActivityMirroringView", @"leadingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUActivityMirroringView", @"trailingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUActivityMirroringView", @"deviceImageView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)MRUActivityMirroringViewAccessibility;
  [(MRUActivityMirroringViewAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MRUActivityMirroringViewAccessibility *)self safeValueForKey:@"leadingView"];
  v4 = accessibilityLocalizedString(@"airplay.video");
  [v3 setAccessibilityLabel:v4];

  v5 = [(MRUActivityMirroringViewAccessibility *)self safeValueForKey:@"trailingView"];
  v6 = [(MRUActivityMirroringViewAccessibility *)self safeValueForKey:@"deviceImageView"];
  v7 = [v6 accessibilityLabel];
  [v5 setAccessibilityLabel:v7];
}

@end