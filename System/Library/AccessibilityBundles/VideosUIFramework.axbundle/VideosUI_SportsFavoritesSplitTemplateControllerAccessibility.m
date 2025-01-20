@interface VideosUI_SportsFavoritesSplitTemplateControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation VideosUI_SportsFavoritesSplitTemplateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.SportsFavoritesSplitTemplateController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.ErrorContentView"];
  [v3 validateClass:@"VideosUI.ErrorContentView" hasProperty:@"accessibilityTitleView" withType:"@"];
  [v3 validateClass:@"VideosUI.ErrorContentView" hasProperty:@"accessibilityDescriptionView" withType:"@"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)VideosUI_SportsFavoritesSplitTemplateControllerAccessibility;
  [(VideosUI_SportsFavoritesSplitTemplateControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (id)accessibilityHeaderElements
{
  objc_opt_class();
  objc_super v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 view];
  v4 = [v3 _accessibilityDescendantOfType:MEMORY[0x245669780](@"VideosUI.ErrorContentView")];

  v5 = (void *)MEMORY[0x263EFF8C0];
  v6 = [v4 safeValueForKey:@"accessibilityTitleView"];
  v7 = [v4 safeValueForKey:@"accessibilityDescriptionView"];
  v8 = objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 2, v6, v7);

  return v8;
}

@end