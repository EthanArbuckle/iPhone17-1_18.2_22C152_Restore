@interface CKAppManagerAppTableViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation CKAppManagerAppTableViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAppManagerAppTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(CKAppManagerAppTableViewCellInvertColorsAccessibility *)self safeUIViewForKey:@"imageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKAppManagerAppTableViewCellInvertColorsAccessibility;
  [(CKAppManagerAppTableViewCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(CKAppManagerAppTableViewCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end