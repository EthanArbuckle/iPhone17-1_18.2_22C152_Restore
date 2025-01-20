@interface UIStatusBarLocationItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIStatusBarLocationItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarLocationItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarLocationItemViewAccessibility;
  return [(UIStatusBarLocationItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

- (id)accessibilityLabel
{
  id v3 = (id)[(UIStatusBarLocationItemViewAccessibility *)self safeValueForKey:@"_iconType"];
  int v4 = [v3 intValue];

  if (v4)
  {
    if (v4 == 1)
    {
      id v5 = accessibilityLocalizedString(@"status.location.geofence");
    }
    else if (v4 == 2)
    {
      id v5 = accessibilityLocalizedString(@"status.location.prominent");
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = accessibilityLocalizedString(@"status.location.icon");
  }

  return v5;
}

- (id)accessibilityIdentifier
{
  id v3 = (id)[(UIStatusBarLocationItemViewAccessibility *)self safeValueForKey:@"_iconType"];
  int v4 = [v3 intValue];

  if (v4)
  {
    if (v4 == 1)
    {
      id v5 = @"GeofenceLocationTrackingOn";
    }
    else if (v4 == 2)
    {
      id v5 = @"ProminentLocationTrackingOn";
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = @"StandardLocationTrackingOn";
  }

  return v5;
}

@end