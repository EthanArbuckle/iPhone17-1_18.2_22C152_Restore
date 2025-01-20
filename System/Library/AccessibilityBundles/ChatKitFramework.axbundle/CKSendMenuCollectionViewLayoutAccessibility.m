@interface CKSendMenuCollectionViewLayoutAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)stretchSpringsAttachedToCellsForBoundsChange:(CGRect)a3;
@end

@implementation CKSendMenuCollectionViewLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKSendMenuCollectionViewLayout";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSendMenuCollectionViewLayout", @"stretchSpringsAttachedToCellsForBoundsChange:", "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (void)stretchSpringsAttachedToCellsForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v8.receiver = self;
    v8.super_class = (Class)CKSendMenuCollectionViewLayoutAccessibility;
    -[CKSendMenuCollectionViewLayoutAccessibility stretchSpringsAttachedToCellsForBoundsChange:](&v8, sel_stretchSpringsAttachedToCellsForBoundsChange_, x, y, width, height);
  }
}

@end