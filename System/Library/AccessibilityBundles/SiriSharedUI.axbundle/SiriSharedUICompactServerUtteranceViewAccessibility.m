@interface SiriSharedUICompactServerUtteranceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
@end

@implementation SiriSharedUICompactServerUtteranceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriSharedUICompactServerUtteranceView";
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
  v2 = [(SiriSharedUICompactServerUtteranceViewAccessibility *)self safeArrayForKey:@"_serverLabels"];
  v3 = MEMORY[0x245661620]();

  return v3;
}

- (id)accessibilityIdentifier
{
  return @"SiriSharedUICompactServerUtteranceView";
}

@end