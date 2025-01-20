@interface VKImageAnalysisButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation VKImageAnalysisButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKImageAnalysisButton";
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
  v3 = AXImageAnalysisLabel([(VKImageAnalysisButtonAccessibility *)self safeUnsignedIntegerForKey:@"mode"]);
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VKImageAnalysisButtonAccessibility;
    id v5 = [(VKImageAnalysisButtonAccessibility *)&v8 accessibilityLabel];
  }
  v6 = v5;

  return v6;
}

@end