@interface MTCCRoundButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MTCCRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTCCRoundButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCRoundButton", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTCCRoundButton", @"image", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MTCCRoundButtonAccessibility *)self safeStringForKey:@"title"];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    v5 = [(MTCCRoundButtonAccessibility *)self safeValueForKey:@"image"];
    v6 = [v5 accessibilityIdentifier];
    int v7 = [v6 isEqualToString:@"plus"];

    if (v7) {
      accessibilityLocalizedString(@"timer.add.button");
    }
    else {
    id v4 = [v5 accessibilityLabel];
    }
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end