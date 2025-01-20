@interface CSLPRFStingGesturePaneCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CSLPRFStingGesturePaneCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSLPRFStingGesturePaneCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CSLPRFStingGesturePaneCellAccessibility *)self safeValueForKey:@"specifier"];
  v3 = [v2 propertyForKey:@"CSLPRFStingGesturePaneCellHasChordArrow"];

  if (v3) {
    v4 = @"sting.gesture.image.two.arrows";
  }
  else {
    v4 = @"sting.gesture.image.one.arrow";
  }
  v5 = accessibilityLocalizedString(v4);

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

@end