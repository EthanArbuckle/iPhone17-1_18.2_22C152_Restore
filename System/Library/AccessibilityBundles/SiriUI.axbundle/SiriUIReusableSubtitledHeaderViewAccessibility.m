@interface SiriUIReusableSubtitledHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SiriUIReusableSubtitledHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUIReusableSubtitledHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v7.receiver = self;
  v7.super_class = (Class)SiriUIReusableSubtitledHeaderViewAccessibility;
  v3 = [(SiriUIReusableSubtitledHeaderViewAccessibility *)&v7 accessibilityLabel];
  v6 = [(SiriUIReusableSubtitledHeaderViewAccessibility *)self safeValueForKey:@"subtitleText"];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end