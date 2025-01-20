@interface CNMeCardSharingOnboardingAvatarCarouselLayout
+ (id)indexPathForNearestItemToCenterWithOffset:(CGPoint)a3 collectionView:(id)a4 layout:(id)a5;
- (CGRect)frameForElementAtIndex:(int64_t)a3 visibleBounds:(CGRect)a4;
- (double)pageOffsetForIndex:(int64_t)a3;
- (double)pagingLength;
- (double)pagingOrigin;
- (id)indexesForElementsInRect:(CGRect)a3 visibleBounds:(CGRect)a4 numberOfItems:(int64_t)a5;
- (int64_t)selectedPageIndex;
@end

@implementation CNMeCardSharingOnboardingAvatarCarouselLayout

- (id)indexesForElementsInRect:(CGRect)a3 visibleBounds:(CGRect)a4 numberOfItems:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v10 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSet", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v11 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", x, y, width, height);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v17 = [v16 indexPath];
        uint64_t v18 = [v17 section];

        if (!v18)
        {
          v19 = [v16 indexPath];
          objc_msgSend(v10, "addIndex:", objc_msgSend(v19, "row"));
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }
  v20 = (void *)[v10 copy];

  return v20;
}

- (CGRect)frameForElementAtIndex:(int64_t)a3 visibleBounds:(CGRect)a4
{
  v5 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v6 = [(UICollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v5];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (double)pageOffsetForIndex:(int64_t)a3
{
  v5 = [(CNMeCardSharingOnboardingAvatarCarouselLayout *)self collectionView];
  uint64_t v6 = [v5 effectiveUserInterfaceLayoutDirection];

  if (v6 == 1)
  {
    double v7 = [(CNMeCardSharingOnboardingAvatarCarouselLayout *)self collectionView];
    a3 = [v7 numberOfItemsInSection:0] + ~a3;
  }
  double v8 = [(CNMeCardSharingOnboardingAvatarCarouselLayout *)self collectionView];
  double v9 = v8;
  if (a3 <= 0)
  {
    [v8 _firstPageOffset];
    double v13 = v14;
  }
  else
  {
    [(CNMeCardSharingOnboardingAvatarCarouselLayout *)self pagingLength];
    double v11 = v10;
    [(CNMeCardSharingOnboardingAvatarCarouselLayout *)self pagingOrigin];
    double v13 = v12 + v11 * (double)a3;
  }

  return v13;
}

- (int64_t)selectedPageIndex
{
  v3 = [(CNMeCardSharingOnboardingAvatarCarouselLayout *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(CNMeCardSharingOnboardingAvatarCarouselLayout *)self collectionView];
  double v9 = +[CNMeCardSharingOnboardingAvatarCarouselLayout indexPathForNearestItemToCenterWithOffset:collectionView:layout:](CNMeCardSharingOnboardingAvatarCarouselLayout, "indexPathForNearestItemToCenterWithOffset:collectionView:layout:", v8, self, v5, v7);

  int64_t v10 = [v9 item];
  return v10;
}

- (double)pagingOrigin
{
  v3 = [(CNMeCardSharingOnboardingAvatarCarouselLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  [(UICollectionViewFlowLayout *)self itemSize];
  double v7 = (v5 - v6) * -0.5;

  return v7;
}

- (double)pagingLength
{
  v3 = [(CNMeCardSharingOnboardingAvatarCarouselLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  double v6 = [(CNMeCardSharingOnboardingAvatarCarouselLayout *)self collectionView];
  [v6 bounds];
  double v8 = floor(v5 - v7) * 0.5;

  double v9 = floor(v8 * 0.5) + -10.0;
  int64_t v10 = [(CNMeCardSharingOnboardingAvatarCarouselLayout *)self collectionView];
  [v10 bounds];
  double v12 = v11;
  double v13 = [(CNMeCardSharingOnboardingAvatarCarouselLayout *)self collectionView];
  [v13 bounds];
  double v15 = v14;
  [(UICollectionViewFlowLayout *)self itemSize];
  double v17 = v12 - (v15 - v16 - v9);

  return v17;
}

+ (id)indexPathForNearestItemToCenterWithOffset:(CGPoint)a3 collectionView:(id)a4 layout:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  id v9 = a5;
  [v8 contentSize];
  double v11 = v10;
  [v8 contentInset];
  double v13 = v11 + v12;
  [v8 bounds];
  double v14 = v13 - CGRectGetWidth(v52);
  if (x >= v14) {
    double x = v14;
  }
  [v8 _firstPageOffset];
  if (v15 >= x) {
    double x = v15;
  }
  [v8 bounds];
  CGFloat v16 = CGRectGetWidth(v53) * 0.5 + x;
  [v8 bounds];
  double v17 = y + CGRectGetHeight(v54) * 0.5;
  [v8 bounds];
  UIRectCenteredAboutPoint();
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__CNMeCardSharingOnboardingAvatarCarouselLayout_indexPathForNearestItemToCenterWithOffset_collectionView_layout___block_invoke;
  aBlock[3] = &__block_descriptor_48_e39_d40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  *(CGFloat *)&aBlock[4] = v16;
  *(double *)&aBlock[5] = v17;
  v26 = _Block_copy(aBlock);
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v27 = objc_msgSend(v9, "indexesForElementsInRect:visibleBounds:numberOfItems:", objc_msgSend(v8, "numberOfItemsInSection:", 0), v19, v21, v23, v25, v19, v21, v23, v25);
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __113__CNMeCardSharingOnboardingAvatarCarouselLayout_indexPathForNearestItemToCenterWithOffset_collectionView_layout___block_invoke_2;
  v36 = &unk_1E5497D50;
  id v28 = v9;
  id v37 = v28;
  double v41 = v19;
  double v42 = v21;
  double v43 = v23;
  double v44 = v25;
  id v29 = v26;
  id v38 = v29;
  v39 = v49;
  v40 = &v45;
  [v27 enumerateIndexesUsingBlock:&v33];
  uint64_t v30 = v46[3];
  if (v30 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v31 = 0;
  }
  else
  {
    v31 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v30, 0, v33, v34, v35, v36, v37);
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);

  return v31;
}

double __113__CNMeCardSharingOnboardingAvatarCarouselLayout_indexPathForNearestItemToCenterWithOffset_collectionView_layout___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a2);
  v12.origin.double x = a2;
  v12.origin.double y = a3;
  v12.size.double width = a4;
  v12.size.double height = a5;
  CGRectGetMidY(v12);
  return vabdd_f64(MidX, *(double *)(a1 + 32));
}

void __113__CNMeCardSharingOnboardingAvatarCarouselLayout_indexPathForNearestItemToCenterWithOffset_collectionView_layout___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "frameForElementAtIndex:visibleBounds:", a2, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  double v4 = (*(double (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v4 < *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v4;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  }
}

@end