@interface MPAVRoutingSheetAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (MPAVRoutingSheetAccessibility)initWithAVItemType:(int64_t)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MPAVRoutingSheetAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPAVRoutingSheet";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MPAVRoutingSheet" hasInstanceVariable:@"_dismissBackgroundButton" withType:"UIButton"];
  [v3 validateClass:@"MPAVRoutingSheet" hasInstanceVariable:@"_dismissControlsViewButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPAVRoutingSheet", @"initWithAVItemType:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPAVRoutingSheet", @"dismiss", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)MPAVRoutingSheetAccessibility;
  [(MPAVRoutingSheetAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MPAVRoutingSheetAccessibility *)self safeValueForKey:@"_dismissBackgroundButton"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(MPAVRoutingSheetAccessibility *)self safeValueForKey:@"_dismissControlsViewButton"];
  [v4 setIsAccessibilityElement:0];
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

id __59__MPAVRoutingSheetAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) safeValueForKey:@"dismiss"];
}

- (MPAVRoutingSheetAccessibility)initWithAVItemType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPAVRoutingSheetAccessibility;
  id v3 = [(MPAVRoutingSheetAccessibility *)&v5 initWithAVItemType:a3];
  [(MPAVRoutingSheetAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

@end