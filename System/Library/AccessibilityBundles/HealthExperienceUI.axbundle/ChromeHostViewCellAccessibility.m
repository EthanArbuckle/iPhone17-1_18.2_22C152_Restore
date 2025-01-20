@interface ChromeHostViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation ChromeHostViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.ChromeHostViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"OBContentView"];
  [v3 validateClass:@"HKColoredButton"];
  [v3 validateClass:@"HealthExperienceUI.MultilineButton"];
  [v3 validateClass:@"HealthExperienceUI.DismissibleTileHeaderView"];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(ChromeHostViewCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_3];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __57__ChromeHostViewCellAccessibility_isAccessibilityElement__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x24564EDC0](@"HealthExperienceUI.DismissibleTileHeaderView");
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  return (id)MEMORY[0x270F80938](self, a2);
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end