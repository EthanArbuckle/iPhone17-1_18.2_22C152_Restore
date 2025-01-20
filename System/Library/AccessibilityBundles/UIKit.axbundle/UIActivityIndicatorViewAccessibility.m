@interface UIActivityIndicatorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsNotFirstElement;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
@end

@implementation UIActivityIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIActivityIndicatorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return [(UIActivityIndicatorViewAccessibility *)self _accessibilityViewIsVisible] & 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 36;
}

- (unint64_t)accessibilityTraits
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIActivityIndicatorViewAccessibility;
  return [(UIActivityIndicatorViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  v8 = self;
  location[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)UIActivityIndicatorViewAccessibility;
  location[0] = [(UIActivityIndicatorViewAccessibility *)&v6 accessibilityLabel];
  if ([location[0] length])
  {
    id v9 = location[0];
  }
  else
  {
    id v4 = (id)[(UIActivityIndicatorViewAccessibility *)v8 safeValueForKey:@"isAnimating"];
    char v5 = [v4 BOOLValue];

    if (v5) {
      id v9 = accessibilityLocalizedString(@"activity.indicator.inprogress.label");
    }
    else {
      id v9 = accessibilityLocalizedString(@"activity.indicator.progresshalted.label");
    }
  }
  objc_storeStrong(location, 0);
  v2 = v9;

  return v2;
}

- (id)accessibilityValue
{
  v8 = self;
  location[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)UIActivityIndicatorViewAccessibility;
  location[0] = [(UIActivityIndicatorViewAccessibility *)&v6 accessibilityValue];
  if ([location[0] length])
  {
    id v9 = location[0];
  }
  else if (UIAccessibilityIsVoiceOverRunning())
  {
    id v9 = 0;
  }
  else
  {
    id v4 = NSString;
    id v5 = (id)[(UIActivityIndicatorViewAccessibility *)v8 safeValueForKey:@"isAnimating"];
    id v9 = (id)objc_msgSend(v4, "stringWithFormat:", @"%d", objc_msgSend(v5, "BOOLValue") & 1);
  }
  objc_storeStrong(location, 0);
  v2 = v9;

  return v2;
}

- (BOOL)_accessibilityIsNotFirstElement
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

@end