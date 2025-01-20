@interface UITextField_QSExtrasAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySystemShouldShowSpeakBubbleCommon;
- (id)_accessibilityQuickSpeakContent;
- (id)_accessibilityQuickSpeakTokenizer;
@end

@implementation UITextField_QSExtrasAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilitySystemShouldShowSpeakBubbleCommon
{
  if ([(UITextField_QSExtrasAccessibility *)self isSecureTextEntry]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UITextField_QSExtrasAccessibility;
  return [(UITextField_QSExtrasAccessibility *)&v4 _accessibilitySystemShouldShowSpeakBubbleCommon];
}

- (id)_accessibilityQuickSpeakTokenizer
{
  return (id)[(UITextField_QSExtrasAccessibility *)self safeValueForKey:@"tokenizer"];
}

- (id)_accessibilityQuickSpeakContent
{
  if ([(UITextField_QSExtrasAccessibility *)self isSecureTextEntry])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITextField_QSExtrasAccessibility;
    v3 = [(UITextField_QSExtrasAccessibility *)&v5 _accessibilityQuickSpeakContent];
  }

  return v3;
}

@end