@interface NTK_PUAdjustmentsViewFlowLayout
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (id)nearestIndexPathForVisibleItemAtPoint:(CGPoint)a3;
@end

@implementation NTK_PUAdjustmentsViewFlowLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  -[NTK_PUAdjustmentsViewFlowLayout targetContentOffsetForProposedContentOffset:](self, "targetContentOffsetForProposedContentOffset:", a3.x, a3.y, a4.x, a4.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(NTK_PUAdjustmentsViewFlowLayout *)self collectionView];
  [v6 frame];
  double v8 = v7;
  v9 = [(NTK_PUAdjustmentsViewFlowLayout *)self collectionView];
  [v9 frame];
  double v11 = v10;

  v12 = -[NTK_PUAdjustmentsViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", x, y, v8, v11);
  v13 = (char *)[(NTK_PUAdjustmentsViewFlowLayout *)self scrollDirection];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v15)
  {
    id v16 = v15;
    v17 = 0;
    uint64_t v18 = *(void *)v42;
    double v19 = 1.79769313e308;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v14);
        }
        v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        objc_msgSend(v21, "frame", (void)v41);
        if (v13 == (unsigned char *)&dword_0 + 1)
        {
          double MidX = CGRectGetMidX(*(CGRect *)&v22);
          v47.origin.double x = x;
          v47.origin.double y = y;
          v47.size.width = v8;
          v47.size.height = v11;
          double MidY = CGRectGetMidX(v47);
        }
        else
        {
          double MidX = CGRectGetMidY(*(CGRect *)&v22);
          v48.origin.double x = x;
          v48.origin.double y = y;
          v48.size.width = v8;
          v48.size.height = v11;
          double MidY = CGRectGetMidY(v48);
        }
        double v28 = fabs(MidX - MidY);
        if (v28 < v19)
        {
          id v29 = v21;

          double v19 = v28;
          v17 = v29;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  [v17 frame];
  double v31 = v30;
  double v33 = v32;
  v34 = [(NTK_PUAdjustmentsViewFlowLayout *)self collectionView];
  [v34 contentInset];
  double v36 = v35;
  double v38 = v37;

  if (v13 == (unsigned char *)&dword_0 + 1) {
    double x = v31 - v38;
  }
  else {
    double y = v33 - v36;
  }

  double v39 = x;
  double v40 = y;
  result.double y = v40;
  result.double x = v39;
  return result;
}

- (id)nearestIndexPathForVisibleItemAtPoint:(CGPoint)a3
{
  double v4 = [(NTK_PUAdjustmentsViewFlowLayout *)self collectionView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = -[NTK_PUAdjustmentsViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", v6, v8, v10, v12);
  id v14 = [v13 firstObject];
  id v15 = [v14 indexPath];
  id v16 = (char *)[(NTK_PUAdjustmentsViewFlowLayout *)self scrollDirection];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v17 = v13;
  id v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v35;
    double v21 = 1.79769313e308;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_msgSend(v23, "frame", (void)v34);
        if (v16 == (unsigned char *)&dword_0 + 1)
        {
          double MidX = CGRectGetMidX(*(CGRect *)&v24);
          v39.origin.double x = v6;
          v39.origin.double y = v8;
          v39.size.width = v10;
          v39.size.height = v12;
          double MidY = CGRectGetMidX(v39);
        }
        else
        {
          double MidX = CGRectGetMidY(*(CGRect *)&v24);
          v40.origin.double x = v6;
          v40.origin.double y = v8;
          v40.size.width = v10;
          v40.size.height = v12;
          double MidY = CGRectGetMidY(v40);
        }
        double v30 = fabs(MidX - MidY);
        if (v30 < v21)
        {
          uint64_t v31 = [v23 indexPath];

          double v21 = v30;
          id v15 = (void *)v31;
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v19);
  }

  id v32 = v15;
  return v32;
}

@end