@interface _UIApplicationInfoInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (int64_t)xb_userInterfaceStyleForRequestedUserInterfaceStyle:(int64_t)a3;
@end

@implementation _UIApplicationInfoInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIApplicationInfo";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)xb_userInterfaceStyleForRequestedUserInterfaceStyle:(int64_t)a3
{
  v5 = [(_UIApplicationInfoInvertColorsAccessibility *)self safeStringForKey:@"bundleIdentifier"];
  if (_AXSInvertColorsEnabledAppCached())
  {
    id v6 = &dword_0 + 2;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIApplicationInfoInvertColorsAccessibility;
    id v6 = [(_UIApplicationInfoInvertColorsAccessibility *)&v8 xb_userInterfaceStyleForRequestedUserInterfaceStyle:a3];
  }

  return (int64_t)v6;
}

@end