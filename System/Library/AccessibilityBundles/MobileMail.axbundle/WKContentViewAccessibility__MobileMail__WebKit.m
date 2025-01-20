@interface WKContentViewAccessibility__MobileMail__WebKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation WKContentViewAccessibility__MobileMail__WebKit

+ (id)safeCategoryTargetClassName
{
  return @"WKContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (int64_t)accessibilityContainerType
{
  v2 = [(WKContentViewAccessibility__MobileMail__WebKit *)self _accessibilityFindAncestor:&__block_literal_global_7 startWithSelf:0];
  objc_opt_class();
  v3 = __UIAccessibilityCastAsSafeCategory();
  v4 = [v3 _accessibilityMessageIndexDescription];

  return 4 * (v4 == 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"message.content");
}

@end