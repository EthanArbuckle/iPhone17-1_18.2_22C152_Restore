@interface AVTCenteringCollectionViewHelper
+ (CGPoint)contentOffsetForCenteringPoint:(CGPoint)a3 collectionView:(id)a4;
+ (UIEdgeInsets)insetsForBounds:(CGRect)a3 withFirstCellSize:(CGSize)a4 lastCellSize:(CGSize)a5;
+ (id)indexPathForItemBeingScrolledTowardFromOffset:(CGPoint)a3 currentOffset:(CGPoint)a4 nearestItemToCenter:(id)a5 itemCount:(unint64_t)a6 itemOffsetProvider:(id)a7 ratio:(double *)a8;
+ (id)indexPathForNearestItemToCenterWithOffset:(CGPoint)a3 collectionView:(id)a4;
@end

@implementation AVTCenteringCollectionViewHelper

+ (UIEdgeInsets)insetsForBounds:(CGRect)a3 withFirstCellSize:(CGSize)a4 lastCellSize:(CGSize)a5
{
  double v5 = (a3.size.width - a4.width) * 0.5;
  double v6 = (a3.size.width - a5.width) * 0.5;
  double v7 = 0.0;
  double v8 = 0.0;
  result.right = v6;
  result.bottom = v8;
  result.left = v5;
  result.top = v7;
  return result;
}

+ (id)indexPathForNearestItemToCenterWithOffset:(CGPoint)a3 collectionView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  [v6 contentSize];
  double v8 = v7;
  [v6 contentInset];
  double v10 = v8 + v9;
  [v6 bounds];
  double v11 = v10 - CGRectGetWidth(v50);
  if (x >= v11) {
    double x = v11;
  }
  [v6 contentInset];
  if (x <= -v12) {
    double x = -v12;
  }
  [v6 bounds];
  CGFloat v13 = CGRectGetWidth(v51) * 0.5 + x;
  [v6 bounds];
  double v14 = y + CGRectGetHeight(v52) * 0.5;
  [v6 bounds];
  UIRectCenteredAboutPoint();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __93__AVTCenteringCollectionViewHelper_indexPathForNearestItemToCenterWithOffset_collectionView___block_invoke;
  v48[3] = &__block_descriptor_48_e39_d40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  *(CGFloat *)&v48[4] = v13;
  *(double *)&v48[5] = v14;
  v23 = (void *)MEMORY[0x210530210](v48);
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
  v24 = [v6 collectionViewLayout];
  v25 = objc_msgSend(v24, "indexesForElementsInRect:visibleBounds:numberOfItems:", objc_msgSend(v6, "numberOfItemsInSection:", 0), v16, v18, v20, v22, v16, v18, v20, v22);

  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  v33 = __93__AVTCenteringCollectionViewHelper_indexPathForNearestItemToCenterWithOffset_collectionView___block_invoke_2;
  v34 = &unk_263FF0B70;
  id v26 = v6;
  id v35 = v26;
  double v39 = v16;
  double v40 = v18;
  double v41 = v20;
  double v42 = v22;
  id v27 = v23;
  id v36 = v27;
  v37 = v47;
  v38 = &v43;
  [v25 enumerateIndexesUsingBlock:&v31];
  uint64_t v28 = v44[3];
  if (v28 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v29 = 0;
  }
  else
  {
    v29 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", v28, 0, v31, v32, v33, v34, v35);
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(v47, 8);

  return v29;
}

double __93__AVTCenteringCollectionViewHelper_indexPathForNearestItemToCenterWithOffset_collectionView___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a2);
  v12.origin.double x = a2;
  v12.origin.double y = a3;
  v12.size.width = a4;
  v12.size.height = a5;
  CGRectGetMidY(v12);
  return vabdd_f64(MidX, *(double *)(a1 + 32));
}

void __93__AVTCenteringCollectionViewHelper_indexPathForNearestItemToCenterWithOffset_collectionView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) collectionViewLayout];
  objc_msgSend(v4, "frameForElementAtIndex:visibleBounds:", a2, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = (*(double (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(v6, v8, v10, v12);
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v13 < *(double *)(v14 + 24))
  {
    *(double *)(v14 + 24) = v13;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  }
}

+ (CGPoint)contentOffsetForCenteringPoint:(CGPoint)a3 collectionView:(id)a4
{
  id v4 = a4;
  [v4 bounds];
  CGRectGetWidth(v14);
  [v4 bounds];
  CGRectGetHeight(v15);
  double v5 = [v4 window];

  double v6 = [v5 screen];
  [v6 scale];
  UIPointRoundToScale();
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

+ (id)indexPathForItemBeingScrolledTowardFromOffset:(CGPoint)a3 currentOffset:(CGPoint)a4 nearestItemToCenter:(id)a5 itemCount:(unint64_t)a6 itemOffsetProvider:(id)a7 ratio:(double *)a8
{
  double x = a4.x;
  double v12 = a3.x;
  id v13 = a5;
  CGRect v14 = (double (**)(id, id))a7;
  double v15 = v14[2](v14, v13);
  id v16 = v13;
  double v17 = v16;
  if (x - v12 > 0.0)
  {
    if (x > v15 && [v16 item] + 1 < a6)
    {
      double v18 = (void *)MEMORY[0x263F088C8];
      uint64_t v19 = [v17 item] + 1;
      goto LABEL_8;
    }
    if (x < v15 && [v17 item] >= 1)
    {
      double v22 = (void *)MEMORY[0x263F088C8];
      uint64_t v23 = [v17 item] - 1;
LABEL_16:
      double v21 = [v22 indexPathForItem:v23 inSection:0];
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (x >= v15 || [v16 item] < 1)
  {
    if (x > v15 && [v17 item] + 1 < a6)
    {
      double v22 = (void *)MEMORY[0x263F088C8];
      uint64_t v23 = [v17 item] + 1;
      goto LABEL_16;
    }
LABEL_17:
    double v21 = 0;
LABEL_18:
    double v20 = v17;
    if (!a8) {
      goto LABEL_23;
    }
LABEL_19:
    if (v21)
    {
      double v24 = v14[2](v14, v21);
      double v25 = v14[2](v14, v20);
      double v26 = 1.0 - fabs((x - v25) / (v25 - v24));
    }
    else
    {
      double v26 = 1.0;
    }
    *a8 = v26;
    goto LABEL_23;
  }
  double v18 = (void *)MEMORY[0x263F088C8];
  uint64_t v19 = [v17 item] - 1;
LABEL_8:
  double v20 = [v18 indexPathForItem:v19 inSection:0];
  double v21 = v17;
  if (a8) {
    goto LABEL_19;
  }
LABEL_23:

  return v20;
}

@end