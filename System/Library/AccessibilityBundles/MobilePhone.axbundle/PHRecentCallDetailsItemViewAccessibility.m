@interface PHRecentCallDetailsItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsTTYCall;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PHRecentCallDetailsItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHRecentCallDetailsItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHRecentCallDetailsItemView", @"timeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHRecentCallDetailsItemView", @"statusLabel", "@", 0);
  [v3 validateClass:@"PHRecentCallDetailsItemView" hasInstanceVariable:@"_ttyDetailDisclosureImageView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHRecentCallDetailsItemView", @"durationAndDataLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHRecentCallDetailsItemView", @"verifiedBadgeView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_axIsTTYCall
{
  v2 = [(PHRecentCallDetailsItemViewAccessibility *)self safeValueForKey:@"_ttyDetailDisclosureImageView"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)accessibilityTraits
{
  BOOL v2 = [(PHRecentCallDetailsItemViewAccessibility *)self _axIsTTYCall];
  BOOL v3 = (unint64_t *)MEMORY[0x263F1CEE8];
  if (!v2) {
    BOOL v3 = (unint64_t *)MEMORY[0x263F1CF18];
  }
  return *v3;
}

- (id)accessibilityHint
{
  if ([(PHRecentCallDetailsItemViewAccessibility *)self _axIsTTYCall])
  {
    BOOL v2 = accessibilityMobilePhoneLocalizedString(@"view.tty.conversation");
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (id)accessibilityLabel
{
  BOOL v3 = [(PHRecentCallDetailsItemViewAccessibility *)self safeUIViewForKey:@"verifiedBadgeView"];
  int v4 = [v3 _accessibilityViewIsVisible];

  if ([(PHRecentCallDetailsItemViewAccessibility *)self _axIsTTYCall])
  {
    v5 = accessibilityMobilePhoneLocalizedString(@"tty.text");
  }
  else
  {
    v5 = 0;
  }
  v6 = [(PHRecentCallDetailsItemViewAccessibility *)self safeValueForKey:@"timeLabel"];
  v7 = [v6 accessibilityLabel];
  v8 = [(PHRecentCallDetailsItemViewAccessibility *)self safeValueForKey:@"statusLabel"];
  v9 = [v8 accessibilityLabel];
  if (v4)
  {
    v10 = accessibilityMobilePhoneLocalizedString(@"verified.call");
  }
  else
  {
    v10 = 0;
  }
  v11 = [(PHRecentCallDetailsItemViewAccessibility *)self safeValueForKey:@"durationAndDataLabel"];
  v14 = [v11 accessibilityLabel];
  v12 = __UIAXStringForVariables();

  if (v4) {

  }
  return v12;
}

@end