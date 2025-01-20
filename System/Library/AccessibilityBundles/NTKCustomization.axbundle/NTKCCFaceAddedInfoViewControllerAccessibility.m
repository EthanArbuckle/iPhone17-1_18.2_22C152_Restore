@interface NTKCCFaceAddedInfoViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation NTKCCFaceAddedInfoViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCCFaceAddedInfoViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCCFaceAddedInfoViewController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"NTKCCFaceAddedInfoViewController" hasInstanceVariable:@"_header" withType:"UILabel"];
  [v3 validateClass:@"NTKCCFaceAddedInfoViewController" hasInstanceVariable:@"_close" withType:"UIButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCCFaceAddedInfoViewControllerAccessibility;
  [(NTKCCFaceAddedInfoViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NTKCCFaceAddedInfoViewControllerAccessibility *)self safeValueForKey:@"_header"];
  [v3 setAccessibilityTraits:UIAccessibilityTraitHeader];

  v4 = [(NTKCCFaceAddedInfoViewControllerAccessibility *)self safeValueForKey:@"_close"];
  v5 = accessibilityLocalizedCustomizationString(@"close.button");
  [v4 setAccessibilityLabel:v5];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCCFaceAddedInfoViewControllerAccessibility;
  [(NTKCCFaceAddedInfoViewControllerAccessibility *)&v3 viewDidLoad];
  [(NTKCCFaceAddedInfoViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end