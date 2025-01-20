@interface BookmarksBarLabelButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation BookmarksBarLabelButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BookmarksBarLabelButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = NSString;
  v4 = accessibilityLocalizedString(@"bookmark.button");
  v8.receiver = self;
  v8.super_class = (Class)BookmarksBarLabelButtonAccessibility;
  v5 = [(BookmarksBarLabelButtonAccessibility *)&v8 accessibilityLabel];
  v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

@end