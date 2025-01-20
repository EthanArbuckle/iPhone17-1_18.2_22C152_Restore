@interface CKAttachmentSearchResultCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation CKAttachmentSearchResultCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAttachmentSearchResultCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(CKAttachmentSearchResultCellInvertColorsAccessibility *)self safeUIViewForKey:@"imageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKAttachmentSearchResultCellInvertColorsAccessibility;
  [(CKAttachmentSearchResultCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(CKAttachmentSearchResultCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end