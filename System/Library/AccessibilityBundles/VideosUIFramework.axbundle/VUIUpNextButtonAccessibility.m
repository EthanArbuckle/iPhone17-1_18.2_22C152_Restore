@interface VUIUpNextButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VUIUpNextButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIUpNextButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUIUpNextButton" hasProperty:@"properties" withType:"@"];
  [v3 validateClass:@"VUIUpNextButtonProperties" hasProperty:@"isWatchListed" withType:"B"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)VUIUpNextButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(VUIUpNextButtonAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  v2 = [(VUIUpNextButtonAccessibility *)self safeValueForKey:@"properties"];
  int v3 = [v2 safeBoolForKey:@"isWatchListed"];

  if (v3) {
    v4 = @"upnext.button.remove";
  }
  else {
    v4 = @"upnext.button.add";
  }
  v5 = accessibilityLocalizedString(v4);

  return v5;
}

@end