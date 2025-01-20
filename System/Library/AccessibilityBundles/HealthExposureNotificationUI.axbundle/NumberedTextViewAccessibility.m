@interface NumberedTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation NumberedTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExposureNotificationUI.NumberedTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthExposureNotificationUI.NumberedTextView", @"number", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthExposureNotificationUI.NumberedTextView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HealthExposureNotificationUI.NumberedTextView", @"details", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(NumberedTextViewAccessibility *)self safeIntegerForKey:@"number"];
  v4 = [(NumberedTextViewAccessibility *)self safeStringForKey:@"title"];
  v5 = [(NumberedTextViewAccessibility *)self safeStringForKey:@"details"];
  v6 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", v3);
  v7 = __UIAXStringForVariables();

  return v7;
}

@end