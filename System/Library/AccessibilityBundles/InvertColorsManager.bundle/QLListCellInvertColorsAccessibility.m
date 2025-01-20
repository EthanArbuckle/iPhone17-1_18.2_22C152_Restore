@interface QLListCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)setThumbnail:(id)a3;
@end

@implementation QLListCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(QLListCellInvertColorsAccessibility *)self safeUIViewForKey:@"_thumbnailView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)setThumbnail:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLListCellInvertColorsAccessibility;
  [(QLListCellInvertColorsAccessibility *)&v4 setThumbnail:a3];
  [(QLListCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end