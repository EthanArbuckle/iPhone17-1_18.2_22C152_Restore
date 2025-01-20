@interface TPPasscodeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation TPPasscodeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPPasscodeView";
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
  return accessibilityLocalizedString(@"sim.pin.textfield");
}

- (id)accessibilityValue
{
  v3 = NSString;
  v4 = accessibilityLocalizedString(@"sim.pin.characterCount");
  v5 = [(TPPasscodeViewAccessibility *)self safeStringForKey:@"passcodeMutableString"];
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, objc_msgSend(v5, "length"));

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F813D8] | *MEMORY[0x263F81398] | *MEMORY[0x263F81408];
}

@end