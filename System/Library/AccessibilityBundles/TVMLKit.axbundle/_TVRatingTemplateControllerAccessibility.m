@interface _TVRatingTemplateControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation _TVRatingTemplateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVRatingTemplateController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)_TVRatingTemplateControllerAccessibility;
  [(_TVRatingTemplateControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(_TVRatingTemplateControllerAccessibility *)self safeValueForKey:@"_titleView"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)_TVRatingTemplateControllerAccessibility;
  [(_TVRatingTemplateControllerAccessibility *)&v3 viewDidLoad];
  [(_TVRatingTemplateControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end