@interface CAMFocalLengthLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation CAMFocalLengthLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMFocalLengthLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFocalLengthLabel", @"_numeralLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFocalLengthLabel", @"_unitLabel", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = NSString;
  v4 = [(CAMFocalLengthLabelAccessibility *)self safeValueForKey:@"_numeralLabel"];
  v5 = [v4 accessibilityLabel];
  v6 = [(CAMFocalLengthLabelAccessibility *)self safeValueForKey:@"_unitLabel"];
  v7 = [v6 accessibilityLabel];
  v8 = [v3 localizedStringWithFormat:@"%@ %@", v5, v7];

  return v8;
}

@end