@interface BRShareDocumentInfoViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)updateConstraints;
@end

@implementation BRShareDocumentInfoViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BRShareDocumentInfoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(BRShareDocumentInfoViewInvertColorsAccessibility *)self safeUIViewForKey:@"_thumbnailView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)BRShareDocumentInfoViewInvertColorsAccessibility;
  [(BRShareDocumentInfoViewInvertColorsAccessibility *)&v3 updateConstraints];
  [(BRShareDocumentInfoViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end