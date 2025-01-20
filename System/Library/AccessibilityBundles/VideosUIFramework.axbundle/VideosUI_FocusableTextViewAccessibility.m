@interface VideosUI_FocusableTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation VideosUI_FocusableTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FocusableTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return (id)[(VideosUI_FocusableTextViewAccessibility *)self safeValueForKey:@"descriptionText"];
}

@end