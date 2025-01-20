@interface CPSGridTemplateCollectionViewFlowLayout
- (double)preferredItemWidth;
- (id)gridItemLayoutInRect:(CGRect)a3 numberOfItems:(unint64_t)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)setPreferredItemWidth:(double)a3;
@end

@implementation CPSGridTemplateCollectionViewFlowLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGRect v28 = a3;
  v27 = self;
  v26[1] = (id)a2;
  v25.receiver = self;
  v25.super_class = (Class)CPSGridTemplateCollectionViewFlowLayout;
  v26[0] = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v25, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v24 = [v26[0] count];
  if (v24)
  {
    v9 = v27;
    id v10 = (id)[(CPSGridTemplateCollectionViewFlowLayout *)v27 collectionView];
    [v10 frame];
    double v19 = v3;
    double v20 = v4;
    double v21 = v5;
    double v22 = v6;
    id v23 = -[CPSGridTemplateCollectionViewFlowLayout gridItemLayoutInRect:numberOfItems:](v9, "gridItemLayoutInRect:numberOfItems:", v24, v3, v4, v5, v6);

    v18 = (void *)[v23 count];
    id v11 = v26[0];
    uint64_t v12 = MEMORY[0x263EF8330];
    int v13 = -1073741824;
    int v14 = 0;
    v15 = __77__CPSGridTemplateCollectionViewFlowLayout_layoutAttributesForElementsInRect___block_invoke;
    v16 = &unk_2648A4C98;
    v17[1] = v18;
    v17[0] = v23;
    [v11 enumerateObjectsUsingBlock:&v12];
    objc_storeStrong(v17, 0);
    objc_storeStrong(&v23, 0);
  }
  id v8 = v26[0];
  objc_storeStrong(v26, 0);

  return v8;
}

void __77__CPSGridTemplateCollectionViewFlowLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (a3 < *(void *)(a1 + 40))
  {
    id v7 = (id)[*(id *)(a1 + 32) objectAtIndex:a3];
    [v7 CGRectValue];
    objc_msgSend(location[0], "setFrame:", v3, v4, v5, v6);
  }
  objc_storeStrong(location, 0);
}

- (id)gridItemLayoutInRect:(CGRect)a3 numberOfItems:(unint64_t)a4
{
  CGRect v79 = a3;
  v78 = self;
  SEL v77 = a2;
  unint64_t v76 = a4;
  id location = (id)objc_opt_new();
  double Width = CGRectGetWidth(v79);
  [(UICollectionViewFlowLayout *)v78 sectionInset];
  double v47 = Width - v4;
  [(UICollectionViewFlowLayout *)v78 sectionInset];
  double v74 = v47 - v5;
  double Height = CGRectGetHeight(v79);
  [(UICollectionViewFlowLayout *)v78 sectionInset];
  double v49 = Height - v6;
  [(UICollectionViewFlowLayout *)v78 sectionInset];
  double v73 = v49 - v7;
  [(UICollectionViewFlowLayout *)v78 sectionInset];
  [(UICollectionViewFlowLayout *)v78 sectionInset];
  CGRectMake_2();
  rect.origin.x = v8;
  rect.origin.y = v9;
  rect.size.width = v10;
  rect.size.height = v11;
  [(CPSGridTemplateCollectionViewFlowLayout *)v78 preferredItemWidth];
  double v70 = v12;
  float v13 = CGRectGetWidth(rect) / v12;
  uint64_t v69 = vcvtms_s32_f32(v13);
  float v14 = CGRectGetHeight(rect) / 60.0;
  uint64_t v68 = vcvtms_s32_f32(v14);
  while (v69 * v68 < v76)
  {
    ++v69;
    float v15 = v73 / 60.0;
    uint64_t v68 = vcvtms_s32_f32(v15);
    [(UICollectionViewFlowLayout *)v78 minimumInteritemSpacing];
    double v70 = (v74 - (double)(v69 - 1) * v16) / (double)v69;
  }
  if (v76 > v69
    || ([(UICollectionViewFlowLayout *)v78 minimumInteritemSpacing],
        v74 < (double)v76 + -1.0 * v17 + (double)v76 * v70))
  {
    while (1)
    {
      if ((uint64_t)v76 % v69 > 0 || (BOOL v45 = 0, v76 > 2) && (BOOL v45 = 0, ceil((double)(v76 / v69)) < (double)v68))
      {
        BOOL v45 = 0;
        if (v69 - 1 >= (uint64_t)v76 % v69) {
          BOOL v45 = v69 > 2;
        }
      }
      if (!v45) {
        break;
      }
      float v18 = (double)v76 / ((double)v69 - 1.0);
      double v67 = ceilf(v18);
      unint64_t v66 = v69 - 1;
      [(UICollectionViewFlowLayout *)v78 minimumInteritemSpacing];
      double v65 = (v74 - (double)(v69 - 2) * v19) / (double)(v69 - 1);
      if (v67 * 60.0 > v73) {
        break;
      }
      --v69;
      [(CPSGridTemplateCollectionViewFlowLayout *)v78 preferredItemWidth];
      if (v65 >= v20)
      {
        BOOL v44 = 0;
        if (v76 % v66) {
          BOOL v44 = v76 % (v66 - 1) == 0;
        }
        if (!v44) {
          break;
        }
      }
    }
  }
  else
  {
    uint64_t v68 = 1;
  }
  if (v69 >= 1)
  {
    [(UICollectionViewFlowLayout *)v78 minimumInteritemSpacing];
    if (v68 == 1) {
      double v71 = (v74 - (double)(v76 - 1) * v21) / (double)v76;
    }
    else {
      double v71 = (v74 - (double)(v69 - 1) * v21) / (double)v69;
    }
    if (v76 > v69)
    {
      [(UICollectionViewFlowLayout *)v78 sectionInset];
      double v58 = v29;
      float v30 = (double)v76 / (double)v69;
      double v57 = v73 / (double)(uint64_t)vcvtps_s32_f32(v30) + 1.0;
      CGPointMake();
      double v55 = v31;
      double v56 = v32;
      for (unint64_t i = 0; i < v76; ++i)
      {
        CGRectMake_2();
        double v50 = v33;
        double v51 = v34;
        double v52 = v35;
        double v53 = v36;
        if ((uint64_t)(i + 1) % v69)
        {
          [(UICollectionViewFlowLayout *)v78 minimumInteritemSpacing];
          double v55 = v55 + v71 + v37;
        }
        else
        {
          double v56 = v56 + v57;
          double v55 = v58;
        }
        id v41 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v50, v51, v52, v53, location);
        objc_msgSend(v40, "addObject:");
      }
    }
    else
    {
      CGRectGetMidX(rect);
      CGRectGetMidY(rect);
      CGPointMake();
      [(UICollectionViewFlowLayout *)v78 minimumInteritemSpacing];
      double v43 = (v74 - (double)(v76 - 1) * v22 - (double)v76 * v71) / 2.0;
      [(UICollectionViewFlowLayout *)v78 sectionInset];
      double v64 = v43 + v23;
      for (unint64_t j = 0; j < v76; ++j)
      {
        CGRectMake_2();
        double v59 = v24;
        double v60 = v25;
        double v61 = v26;
        double v62 = v27;
        [(UICollectionViewFlowLayout *)v78 minimumInteritemSpacing];
        double v64 = v64 + v71 + v28;
        id v42 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v59, v60, v61, v62);
        objc_msgSend(location, "addObject:");
      }
    }
  }
  id v80 = location;
  objc_storeStrong(&location, 0);
  v38 = v80;

  return v38;
}

- (double)preferredItemWidth
{
  return self->_preferredItemWidth;
}

- (void)setPreferredItemWidth:(double)a3
{
  self->_preferredItemdouble Width = a3;
}

@end