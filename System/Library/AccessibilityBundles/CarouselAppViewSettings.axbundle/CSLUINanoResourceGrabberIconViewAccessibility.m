@interface CSLUINanoResourceGrabberIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CSLUINanoResourceGrabberIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSLUINanoResourceGrabberIconView";
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
  v11.receiver = self;
  v11.super_class = (Class)CSLUINanoResourceGrabberIconViewAccessibility;
  v3 = [(CSLUINanoResourceGrabberIconViewAccessibility *)&v11 accessibilityLabel];

  if (v3)
  {
    v10.receiver = self;
    v10.super_class = (Class)CSLUINanoResourceGrabberIconViewAccessibility;
    v4 = [(CSLUINanoResourceGrabberIconViewAccessibility *)&v10 accessibilityLabel];
    goto LABEL_10;
  }
  v5 = [(CSLUINanoResourceGrabberIconViewAccessibility *)self safeValueForKey:@"_bundleID"];
  v6 = AXWatchAppNameForBundleId();
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    if (!AXIsInternalInstall())
    {
      v4 = 0;
      goto LABEL_9;
    }
    _AXAssert();
    id v8 = [NSString stringWithFormat:@"Internal only, missing app name: %@", v5];
  }
  v4 = v8;
LABEL_9:

LABEL_10:

  return v4;
}

@end