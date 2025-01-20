@interface CKTranscriptCollectionViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_axRefreshInvertColors;
- (void)_axRefreshInvertColorsForCell:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation CKTranscriptCollectionViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_axRefreshInvertColors
{
}

- (void)_axRefreshInvertColorsForCell:(id)a3
{
  id v5 = a3;
  AXSafeClassFromString();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v5 safeValueForKey:@"balloonView"];
    id v4 = [v3 safeValueForKey:@"_accessibilityLoadInvertColors"];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptCollectionViewControllerInvertColorsAccessibility;
  [(CKTranscriptCollectionViewControllerInvertColorsAccessibility *)&v4 scrollViewDidScroll:a3];
  [(CKTranscriptCollectionViewControllerInvertColorsAccessibility *)self _axRefreshInvertColors];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CKTranscriptCollectionViewControllerInvertColorsAccessibility;
  -[CKTranscriptCollectionViewControllerInvertColorsAccessibility scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v6, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", a3, a5, a4.x, a4.y);
  [(CKTranscriptCollectionViewControllerInvertColorsAccessibility *)self _axRefreshInvertColors];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptCollectionViewControllerInvertColorsAccessibility;
  [(CKTranscriptCollectionViewControllerInvertColorsAccessibility *)&v4 scrollViewDidEndScrollingAnimation:a3];
  [(CKTranscriptCollectionViewControllerInvertColorsAccessibility *)self _axRefreshInvertColors];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptCollectionViewControllerInvertColorsAccessibility;
  [(CKTranscriptCollectionViewControllerInvertColorsAccessibility *)&v4 scrollViewDidEndDecelerating:a3];
  [(CKTranscriptCollectionViewControllerInvertColorsAccessibility *)self _axRefreshInvertColors];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptCollectionViewControllerInvertColorsAccessibility;
  [(CKTranscriptCollectionViewControllerInvertColorsAccessibility *)&v5 scrollViewDidEndDragging:a3 willDecelerate:a4];
  [(CKTranscriptCollectionViewControllerInvertColorsAccessibility *)self _axRefreshInvertColors];
}

@end