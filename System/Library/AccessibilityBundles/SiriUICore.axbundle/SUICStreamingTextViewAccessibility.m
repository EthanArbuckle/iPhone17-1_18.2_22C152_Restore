@interface SUICStreamingTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
@end

@implementation SUICStreamingTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUICStreamingTextView";
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
  return (id)[(SUICStreamingTextViewAccessibility *)self safeStringForKey:@"text"];
}

- (id)accessibilityIdentifier
{
  return @"SUICStreamingTextView";
}

@end