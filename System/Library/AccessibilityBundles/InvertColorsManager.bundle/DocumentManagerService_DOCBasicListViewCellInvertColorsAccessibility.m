@interface DocumentManagerService_DOCBasicListViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation DocumentManagerService_DOCBasicListViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"com_apple_DocumentManager_Service.DOCBasicListViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(DocumentManagerService_DOCBasicListViewCellInvertColorsAccessibility *)self safeValueForKey:@"imageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DocumentManagerService_DOCBasicListViewCellInvertColorsAccessibility;
  [(DocumentManagerService_DOCBasicListViewCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(DocumentManagerService_DOCBasicListViewCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end