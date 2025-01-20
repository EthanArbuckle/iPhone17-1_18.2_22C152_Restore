@interface ASCMiniProductPageMediaFlowLayout
- (ASCMiniProductPageMediaFlowLayout)init;
- (CGPoint)collectionViewBoundsMidpoint;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (int64_t)indexAtInitialScroll;
- (void)dealloc;
- (void)panGestureRecognizedByRecognizer:(id)a3;
- (void)prepareForTransitionToLayout:(id)a3;
- (void)prepareLayout;
- (void)setIndexAtInitialScroll:(int64_t)a3;
@end

@implementation ASCMiniProductPageMediaFlowLayout

- (ASCMiniProductPageMediaFlowLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)ASCMiniProductPageMediaFlowLayout;
  v2 = [(UICollectionViewFlowLayout *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UICollectionViewFlowLayout *)v2 setScrollDirection:1];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];
  v4 = [v3 panGestureRecognizer];
  [v4 removeTarget:self action:0];

  v5.receiver = self;
  v5.super_class = (Class)ASCMiniProductPageMediaFlowLayout;
  [(ASCMiniProductPageMediaFlowLayout *)&v5 dealloc];
}

- (CGPoint)collectionViewBoundsMidpoint
{
  v3 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];

  if (v3)
  {
    v4 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];
    [v4 bounds];
    double v6 = v5 * 0.5;
    v7 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];
    [v7 bounds];
    double v9 = v8 * 0.5;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v10 = v6;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)prepareLayout
{
  v7.receiver = self;
  v7.super_class = (Class)ASCMiniProductPageMediaFlowLayout;
  [(UICollectionViewFlowLayout *)&v7 prepareLayout];
  v3 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];
  v4 = [v3 panGestureRecognizer];
  [v4 removeTarget:self action:0];

  double v5 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];
  double v6 = [v5 panGestureRecognizer];
  [v6 addTarget:self action:sel_panGestureRecognizedByRecognizer_];
}

- (void)prepareForTransitionToLayout:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASCMiniProductPageMediaFlowLayout;
  [(ASCMiniProductPageMediaFlowLayout *)&v6 prepareForTransitionToLayout:a3];
  v4 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];
  double v5 = [v4 panGestureRecognizer];
  [v5 removeTarget:self action:0];
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double x = a4.x;
  CGFloat y = a3.y;
  double v6 = a3.x;
  double v8 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];

  if (v8)
  {
    double v9 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];
    [v9 bounds];
    double v10 = [(UICollectionViewFlowLayout *)self layoutAttributesForElementsInRect:"layoutAttributesForElementsInRect:"];

    if (v10)
    {
      if ([v10 count])
      {
        double v11 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];
        uint64_t v12 = [v11 numberOfItemsInSection:0];

        v13 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];
        [v13 frame];
        double v15 = v6 + v14;
        [(UICollectionViewFlowLayout *)self collectionViewContentSize];
        double v17 = v16;

        if (v15 < v17)
        {
          v18 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];
          v19 = [v18 traitCollection];
          uint64_t v20 = [v19 layoutDirection];

          uint64_t v21 = 0;
          if (v6 <= 0.0)
          {
LABEL_12:
            if (v20 == 1) {
              uint64_t v21 = v12 + ~v21;
            }
            if ([(ASCMiniProductPageMediaFlowLayout *)self indexAtInitialScroll] == v21)
            {
              if ((x >= 0.0 || v20 == 1) && (x <= 0.0 || v20 != 1))
              {
                BOOL v39 = x >= 0.0 || v20 != 1;
                BOOL v40 = v20 == 1 || x <= 0.0;
                if (!v40 || !v39)
                {
                  if (v12 - 1 >= v21 + 1) {
                    ++v21;
                  }
                  else {
                    uint64_t v21 = v12 - 1;
                  }
                }
              }
              else
              {
                if (v21 <= 1) {
                  uint64_t v28 = 1;
                }
                else {
                  uint64_t v28 = v21;
                }
                uint64_t v21 = v28 - 1;
              }
            }
            v29 = [MEMORY[0x1E4F28D58] indexPathForItem:v21 inSection:0];
            v30 = [(UICollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v29];

            if (v30)
            {
              [v30 frame];
              double v32 = v31;
              double v34 = v33;
              v35 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];
              [v35 bounds];
              double v6 = v32 + (v36 - v34) * -0.5;
            }
          }
          else
          {
            double v22 = 0.0;
            while (1)
            {
              v23 = [MEMORY[0x1E4F28D58] indexPathForItem:v21 inSection:0];
              v24 = [(UICollectionViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v23];

              [v24 bounds];
              if (!v24) {
                break;
              }
              double v26 = v25;
              if (v22 + v25 * 0.5 >= v6)
              {

                goto LABEL_12;
              }
              [(UICollectionViewFlowLayout *)self minimumLineSpacing];
              double v22 = v22 + v26 + v27;
              ++v21;

              if (v22 >= v6) {
                goto LABEL_12;
              }
            }
          }
        }
      }
    }
  }
  double v37 = v6;
  double v38 = y;
  result.CGFloat y = v38;
  result.double x = v37;
  return result;
}

- (void)panGestureRecognizedByRecognizer:(id)a3
{
  if ([a3 state] == 1)
  {
    id v5 = [(ASCMiniProductPageMediaFlowLayout *)self collectionView];
    [(ASCMiniProductPageMediaFlowLayout *)self collectionViewBoundsMidpoint];
    v4 = objc_msgSend(v5, "indexPathForItemAtPoint:");
    -[ASCMiniProductPageMediaFlowLayout setIndexAtInitialScroll:](self, "setIndexAtInitialScroll:", [v4 item]);
  }
}

- (int64_t)indexAtInitialScroll
{
  return self->_indexAtInitialScroll;
}

- (void)setIndexAtInitialScroll:(int64_t)a3
{
  self->_indexAtInitialScroll = a3;
}

@end