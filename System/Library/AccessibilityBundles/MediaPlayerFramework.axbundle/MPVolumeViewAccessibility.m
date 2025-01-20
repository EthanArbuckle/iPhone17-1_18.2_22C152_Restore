@interface MPVolumeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_createSubviews;
@end

@implementation MPVolumeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPVolumeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_createSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)MPVolumeViewAccessibility;
  [(MPVolumeViewAccessibility *)&v5 _createSubviews];
  v3 = [(MPVolumeViewAccessibility *)self safeValueForKey:@"_routeButton"];
  v4 = UIKitAccessibilityLocalizedString();
  [v3 setAccessibilityLabel:v4];
}

@end