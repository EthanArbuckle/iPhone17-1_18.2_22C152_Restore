@interface NCNotificationContentViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_lazyThumbnailImageView;
- (void)_accessibilityLoadInvertColors;
@end

@implementation NCNotificationContentViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_lazyThumbnailImageView
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationContentViewInvertColorsAccessibility;
  v2 = [(NCNotificationContentViewInvertColorsAccessibility *)&v4 _lazyThumbnailImageView];
  [v2 setAccessibilityIgnoresInvertColors:1];

  return v2;
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(NCNotificationContentViewInvertColorsAccessibility *)self safeValueForKey:@"_lazyThumbnailImageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end