@interface CARCollectionViewFlowLayout
- (CARCollectionViewFlowLayout)init;
- (CGSize)collectionViewContentSize;
- (CGSize)lastContentSize;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)setLastContentSize:(CGSize)a3;
@end

@implementation CARCollectionViewFlowLayout

- (CARCollectionViewFlowLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)CARCollectionViewFlowLayout;
  result = [(CARCollectionViewFlowLayout *)&v3 init];
  if (result) {
    result->_lastContentSize = CGSizeZero;
  }
  return result;
}

- (CGSize)collectionViewContentSize
{
  v16.receiver = self;
  v16.super_class = (Class)CARCollectionViewFlowLayout;
  [(CARCollectionViewFlowLayout *)&v16 collectionViewContentSize];
  double v4 = v3;
  double v6 = v5;
  [(CARCollectionViewFlowLayout *)self lastContentSize];
  if (v4 != v8 || v6 != v7)
  {
    -[CARCollectionViewFlowLayout setLastContentSize:](self, "setLastContentSize:", v4, v6);
    v10 = [(CARCollectionViewFlowLayout *)self collectionView];
    v11 = [v10 delegate];
    unsigned int v12 = [v11 conformsToProtocol:&OBJC_PROTOCOL___CARCollectionViewFlowLayoutDelegate];

    if (v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100025144;
      block[3] = &unk_1000926C0;
      block[4] = self;
      *(double *)&block[5] = v4;
      *(double *)&block[6] = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  double v13 = v4;
  double v14 = v6;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v48.receiver = self;
  v48.super_class = (Class)CARCollectionViewFlowLayout;
  double v4 = -[CARCollectionViewFlowLayout layoutAttributesForElementsInRect:](&v48, "layoutAttributesForElementsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = [(CARCollectionViewFlowLayout *)self collectionView];
  double v6 = [v5 traitCollection];
  id v7 = [v6 layoutDirection];

  double v8 = [(CARCollectionViewFlowLayout *)self collectionView];
  [v8 frame];
  double Width = CGRectGetWidth(v51);

  [(CARCollectionViewFlowLayout *)self sectionInset];
  double v11 = v10;
  double v13 = v12;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v14 = v4;
  id v15 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v15)
  {
    id v16 = v15;
    if (v7 == (id)1) {
      double v17 = Width - v13;
    }
    else {
      double v17 = v11;
    }
    uint64_t v18 = *(void *)v45;
    double v19 = -1.0;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v14);
        }
        v21 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        [v21 frame:v44];
        if (v22 > v19 || ([v21 frame], vabdd_f64(v23, v19) < 0.01))
        {
          [(CARCollectionViewFlowLayout *)self sectionInset];
          if (v7 == (id)1) {
            double v17 = Width - v25;
          }
          else {
            double v17 = v24;
          }
        }
        v26 = [v21 representedElementKind];
        unsigned int v27 = [v26 isEqualToString:UICollectionElementKindSectionHeader];

        if (v27)
        {
          [v21 frame];
          double v29 = v28;
          [v21 frame];
          double v31 = v30;
          [v21 frame];
          [v21 setFrame:0.0 v29, v31];
        }
        else
        {
          double v32 = v17;
          if (v7 == (id)1)
          {
            [v21 frame];
            double v32 = v17 - v33;
          }
          [v21 frame];
          double v35 = v34;
          [v21 frame];
          double v37 = v36;
          [v21 frame];
          [v21 setFrame:v32, v35, v37];
          [v21 frame];
          double v39 = v38;
          [(CARCollectionViewFlowLayout *)self minimumInteritemSpacing];
          double v41 = v40 + v39;
          if (v7 == (id)1) {
            double v41 = -v41;
          }
          double v17 = v17 + v41;
        }
        [v21 frame];
        double MaxY = CGRectGetMaxY(v52);
        if (MaxY >= v19) {
          double v19 = MaxY;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v16);
  }

  return v14;
}

- (CGSize)lastContentSize
{
  double width = self->_lastContentSize.width;
  double height = self->_lastContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastContentSize:(CGSize)a3
{
  self->_lastContentSize = a3;
}

@end