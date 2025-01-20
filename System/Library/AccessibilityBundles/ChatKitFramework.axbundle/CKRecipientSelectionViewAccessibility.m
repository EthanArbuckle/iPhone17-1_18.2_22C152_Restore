@interface CKRecipientSelectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation CKRecipientSelectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKRecipientSelectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setFrame:(CGRect)a3
{
  double y = a3.origin.y;
  v5.receiver = self;
  v5.super_class = (Class)CKRecipientSelectionViewAccessibility;
  -[CKRecipientSelectionViewAccessibility setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CKRecipientSelectionViewAccessibility *)self setAccessibilityElementsHidden:y < 0.0];
}

@end