@interface UICollectionView(HKUIAdditions)
- (void)hk_scrollToItemRespectingFlowLayoutSectionInsetAtIndexPath:()HKUIAdditions animated:scrollPosition:;
@end

@implementation UICollectionView(HKUIAdditions)

- (void)hk_scrollToItemRespectingFlowLayoutSectionInsetAtIndexPath:()HKUIAdditions animated:scrollPosition:
{
  id v23 = a3;
  [a1 contentInset];
  if (a5 != 8) {
    goto LABEL_9;
  }
  if (v8 != 0.0) {
    goto LABEL_9;
  }
  v9 = [a1 collectionViewLayout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_9;
  }
  v11 = [a1 collectionViewLayout];
  v12 = [a1 layoutAttributesForItemAtIndexPath:v23];
  if (!v12) {
    goto LABEL_8;
  }
  if ([v11 scrollDirection] != 1) {
    goto LABEL_8;
  }
  [v12 frame];
  double v14 = v13;
  [v11 sectionInset];
  double v16 = v14 - v15;
  [a1 contentOffset];
  double v18 = v17;
  [a1 contentSize];
  if (v19 != 0.0)
  {
    [a1 contentSize];
    double v21 = v20;
    [a1 bounds];
    if (v16 > v21 - v22)
    {
LABEL_8:

LABEL_9:
      [a1 scrollToItemAtIndexPath:v23 atScrollPosition:a5 animated:a4];
      goto LABEL_10;
    }
  }
  objc_msgSend(a1, "setContentOffset:animated:", a4, v16, v18);

LABEL_10:
}

@end