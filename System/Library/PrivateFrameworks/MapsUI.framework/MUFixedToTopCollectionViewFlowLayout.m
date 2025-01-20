@interface MUFixedToTopCollectionViewFlowLayout
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
@end

@implementation MUFixedToTopCollectionViewFlowLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)MUFixedToTopCollectionViewFlowLayout;
  v3 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v36, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [v3 firstObject];
  [v4 frame];
  double MidY = CGRectGetMidY(v40);

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    CGFloat v10 = *MEMORY[0x1E4F1DB20];
    CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    uint64_t v14 = *(void *)v33;
    double v15 = 1.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v7);
        }
        v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (![v17 representedElementCategory])
        {
          [v17 frame];
          double v18 = CGRectGetMidY(v41);
          double v19 = v18 - MidY;
          if (v18 - MidY < 0.0) {
            double v19 = -v19;
          }
          if (v19 >= v15) {
            goto LABEL_13;
          }
          [v6 addObject:v17];
          [v17 frame];
          double Height = CGRectGetHeight(v42);
          v43.origin.x = v10;
          v43.origin.y = v11;
          v43.size.width = v12;
          v43.size.height = v13;
          if (Height > CGRectGetHeight(v43))
          {
            [v17 frame];
            CGFloat v10 = v21;
            CGFloat v11 = v22;
            CGFloat v12 = v23;
            CGFloat v13 = v24;
          }
          v25 = [v7 lastObject];

          double v15 = 1.0;
          if (v17 == v25)
          {
LABEL_13:
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __74__MUFixedToTopCollectionViewFlowLayout_layoutAttributesForElementsInRect___block_invoke;
            v31[3] = &__block_descriptor_64_e49_v32__0__UICollectionViewLayoutAttributes_8Q16_B24l;
            *(CGFloat *)&v31[4] = v10;
            *(CGFloat *)&v31[5] = v11;
            *(CGFloat *)&v31[6] = v12;
            *(CGFloat *)&v31[7] = v13;
            [v6 enumerateObjectsUsingBlock:v31];
            [v6 removeAllObjects];
            [v6 addObject:v17];
            [v17 frame];
            CGFloat v10 = v26;
            CGFloat v11 = v27;
            CGFloat v12 = v28;
            CGFloat v13 = v29;
            double MidY = v18;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v9);
  }

  return v7;
}

void __74__MUFixedToTopCollectionViewFlowLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  [v14 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = *(double *)(a1 + 40);
  [v14 frame];
  CGFloat v13 = v11 - v12;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  CGRect v17 = CGRectOffset(v16, 0.0, v13);
  objc_msgSend(v14, "setFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
}

@end