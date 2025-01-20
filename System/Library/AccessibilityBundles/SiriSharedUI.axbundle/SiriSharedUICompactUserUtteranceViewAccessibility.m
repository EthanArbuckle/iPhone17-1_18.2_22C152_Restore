@interface SiriSharedUICompactUserUtteranceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)_setStreamingText:(id)a3;
@end

@implementation SiriSharedUICompactUserUtteranceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriSharedUICompactUserUtteranceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriSharedUICompactUserUtteranceView", @"_streamingTextView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUICStreamingTextView", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriSharedUICompactUserUtteranceView", @"_setStreamingText:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SiriSharedUICompactUserUtteranceViewAccessibility *)self safeValueForKey:@"_streamingTextView"];
  id v3 = [v2 safeValueForKey:@"text"];

  return v3;
}

- (void)_setStreamingText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SiriSharedUICompactUserUtteranceViewAccessibility;
  [(SiriSharedUICompactUserUtteranceViewAccessibility *)&v4 _setStreamingText:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
}

@end