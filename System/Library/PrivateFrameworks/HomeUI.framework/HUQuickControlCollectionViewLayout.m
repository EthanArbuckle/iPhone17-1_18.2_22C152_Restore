@interface HUQuickControlCollectionViewLayout
+ (Class)layoutAttributesClass;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (HUQuickControlCollectionViewControllerLayoutOptions)layoutOptions;
- (HUQuickControlCollectionViewLayout)init;
- (HUQuickControlCollectionViewLayoutInfo)layoutInfo;
- (HUQuickControlGridLayoutManager)layoutManager;
- (NSLayoutConstraint)heightConstraint;
- (NSMutableDictionary)cachedLayoutAttributesByIndexPath;
- (NSMutableDictionary)cachedSectionHeaderLayoutAttributes;
- (UIEdgeInsets)contentInset;
- (id)_computeRowLayoutOriginsFromLayoutDetails:(id)a3 forSectionSettings:(id)a4;
- (id)_computeRowLayoutsForGridLayout:(id)a3 gridLayoutSettings:(id)a4;
- (id)_computeSizingLayoutInfo;
- (id)_intrinsicSizeDescriptorForItemAtIndexPath:(id)a3 itemSize:(unint64_t)a4;
- (id)delegate;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)_computeGridLayoutAttributesForLayoutInfo:(id)a3;
- (void)_computeLayoutInfo;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setLayoutInfo:(id)a3;
- (void)setLayoutManager:(id)a3;
- (void)setLayoutOptions:(id)a3;
@end

@implementation HUQuickControlCollectionViewLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (HUQuickControlCollectionViewLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlCollectionViewLayout;
  v2 = [(HUQuickControlCollectionViewLayout *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cachedLayoutAttributesByIndexPath = v2->_cachedLayoutAttributesByIndexPath;
    v2->_cachedLayoutAttributesByIndexPath = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    cachedSectionHeaderLayoutAttributes = v2->_cachedSectionHeaderLayoutAttributes;
    v2->_cachedSectionHeaderLayoutAttributes = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(HUQuickControlCollectionViewLayout *)self invalidateLayout];
  }
}

- (CGSize)collectionViewContentSize
{
  v2 = [(HUQuickControlCollectionViewLayout *)self layoutInfo];
  [v2 collectionViewContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlCollectionViewLayout;
  id v4 = a3;
  [(HUQuickControlCollectionViewLayout *)&v8 invalidateLayoutWithContext:v4];
  double v5 = [(HUQuickControlCollectionViewLayout *)self cachedLayoutAttributesByIndexPath];
  [v5 removeAllObjects];

  double v6 = [(HUQuickControlCollectionViewLayout *)self cachedSectionHeaderLayoutAttributes];
  [v6 removeAllObjects];

  LODWORD(v6) = [v4 invalidateEverything];
  if (v6)
  {
    double v7 = [(HUQuickControlCollectionViewLayout *)self layoutManager];
    [v7 generateSectionSettings];
  }
}

- (void)prepareLayout
{
  v11.receiver = self;
  v11.super_class = (Class)HUQuickControlCollectionViewLayout;
  [(HUQuickControlCollectionViewLayout *)&v11 prepareLayout];
  double v3 = [(HUQuickControlCollectionViewLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];

  if (v4)
  {
    [(HUQuickControlCollectionViewLayout *)self _computeLayoutInfo];
    double v5 = [(HUQuickControlCollectionViewLayout *)self layoutInfo];
    double v6 = [v5 layoutDetailsArray];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__HUQuickControlCollectionViewLayout_prepareLayout__block_invoke;
    v10[3] = &unk_1E63928D8;
    v10[4] = self;
    objc_msgSend(v6, "na_each:", v10);

    [(HUQuickControlCollectionViewLayout *)self collectionViewContentSize];
    double v8 = v7;
    v9 = [(HUQuickControlCollectionViewLayout *)self heightConstraint];
    [v9 setConstant:v8];
  }
}

uint64_t __51__HUQuickControlCollectionViewLayout_prepareLayout__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _computeGridLayoutAttributesForLayoutInfo:a2];
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(HUQuickControlCollectionViewLayout *)self cachedLayoutAttributesByIndexPath];
  v9 = [v8 allValues];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__HUQuickControlCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v17[3] = &__block_descriptor_64_e76___UICollectionViewLayoutAttributes_16__0__UICollectionViewLayoutAttributes_8l;
  *(CGFloat *)&v17[4] = x;
  *(CGFloat *)&v17[5] = y;
  *(CGFloat *)&v17[6] = width;
  *(CGFloat *)&v17[7] = height;
  v10 = objc_msgSend(v9, "na_map:", v17);
  objc_super v11 = (void *)[v10 mutableCopy];

  v12 = [(HUQuickControlCollectionViewLayout *)self cachedSectionHeaderLayoutAttributes];
  v13 = [v12 allValues];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__HUQuickControlCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v16[3] = &__block_descriptor_64_e54_B16__0__HUQuickControlCollectionViewLayoutAttributes_8l;
  *(CGFloat *)&v16[4] = x;
  *(CGFloat *)&v16[5] = y;
  *(CGFloat *)&v16[6] = width;
  *(CGFloat *)&v16[7] = height;
  v14 = objc_msgSend(v13, "na_filter:", v16);

  [v11 addObjectsFromArray:v14];

  return v11;
}

id __72__HUQuickControlCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(CGRect *a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  if (CGRectIntersectsRect(v7, a1[1])) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

BOOL __72__HUQuickControlCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2(void *a1, void *a2)
{
  [a2 frame];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  uint64_t v10 = a1[7];

  return CGRectIntersectsRect(*(CGRect *)&v3, *(CGRect *)&v7);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HUQuickControlCollectionViewLayout *)self cachedLayoutAttributesByIndexPath];
  double v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    [(HUQuickControlCollectionViewLayout *)self prepareLayout];
    uint64_t v7 = [(HUQuickControlCollectionViewLayout *)self cachedLayoutAttributesByIndexPath];
    double v6 = [v7 objectForKeyedSubscript:v4];

    if (!v6) {
      NSLog(&cfstr_DidNotCreateAt.isa, v4);
    }
  }

  return v6;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  if ((id)*MEMORY[0x1E4F43750] == a3)
  {
    NSLog(&cfstr_CollectionView.isa);
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v7 = [(HUQuickControlCollectionViewLayout *)self cachedSectionHeaderLayoutAttributes];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "section"));
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    if (!v9) {
      NSLog(&cfstr_DidNotCreateAt.isa, v6);
    }
  }

  return v9;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v5 = [(HUQuickControlCollectionViewLayout *)self collectionView];
  [v5 bounds];
  BOOL v8 = v7 != height || v6 != width;

  return v8;
}

- (void)setLayoutOptions:(id)a3
{
  double v6 = (HUQuickControlCollectionViewControllerLayoutOptions *)a3;
  if (self->_layoutOptions != v6)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    id v5 = [(HUQuickControlCollectionViewLayout *)self layoutManager];
    [v5 setLayoutOptions:v6];
  }
}

- (id)delegate
{
  v2 = [(HUQuickControlCollectionViewLayout *)self collectionView];
  uint64_t v3 = [v2 delegate];
  if ([v3 conformsToProtocol:&unk_1F1A41908]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)_intrinsicSizeDescriptorForItemAtIndexPath:(id)a3 itemSize:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(HUQuickControlCollectionViewLayout *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0
    || ([(HUQuickControlCollectionViewLayout *)self delegate],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v9 intrinsicSizeDescriptorForItemAtIndexPath:v6 itemSize:a4],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    unint64_t v11 = [v6 section];
    v12 = [(HUQuickControlCollectionViewLayout *)self layoutManager];
    v13 = [v12 itemManager];
    unint64_t v14 = [v13 numberOfSections];

    if (v11 >= v14)
    {
      NSLog(&cfstr_UnexpectedInde.isa, v6);
    }
    else
    {
      v15 = HFLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        _os_log_error_impl(&dword_1BE345000, v15, OS_LOG_TYPE_ERROR, "indexPath %@ is valid but we don't have an intrinsic size descriptor", buf, 0xCu);
      }
    }
    uint64_t v10 = +[HUIntrinsicSizeDescriptor noIntrinsicSizeDescriptor];
  }

  return v10;
}

- (id)_computeSizingLayoutInfo
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v41 = objc_alloc_init(HUQuickControlCollectionViewLayoutInfo);
  v2 = [(HUQuickControlCollectionViewLayout *)self collectionView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  [(HUQuickControlCollectionViewLayout *)self contentInset];
  -[HUQuickControlCollectionViewLayoutInfo setAvailableContentFrame:](v41, "setAvailableContentFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  v15 = [(HUQuickControlCollectionViewLayout *)self layoutManager];
  v16 = [v15 collectionSectionSettings];

  v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  [(HUQuickControlCollectionViewLayoutInfo *)v41 setLayoutDetailsArray:v17];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v16;
  uint64_t v18 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v18)
  {
    uint64_t v39 = *(void *)v49;
    double v19 = *MEMORY[0x1E4F1DAD8];
    double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v49 != v39) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v23 = objc_alloc_init(HUQuickControlCollectionViewGridLayoutDetails);
        [(HUQuickControlCollectionViewGridLayoutDetails *)v23 setSettings:v22];
        -[HUQuickControlCollectionViewGridLayoutDetails setSectionIndex:](v23, "setSectionIndex:", [v22 sectionNumber]);
        v24 = [v22 sectionHeader];
        if (v24)
        {
        }
        else
        {
          v25 = [v22 sectionAttributedHeader];
          BOOL v26 = v25 == 0;

          if (v26) {
            goto LABEL_10;
          }
        }
        v27 = objc_alloc_init(HUQuickControlCollectionViewGridLayoutRowInfo);
        [(HUQuickControlCollectionViewGridLayoutRowInfo *)v27 setNumberOfItems:1];
        -[HUQuickControlCollectionViewGridLayoutRowInfo setRowOrigin:](v27, "setRowOrigin:", v19, v20);
        v28 = objc_alloc_init(HUQuickControlCollectionViewGridLayoutItemInfo);
        -[HUQuickControlCollectionViewGridLayoutItemInfo setPreferredSize:](v28, "setPreferredSize:", v8, 50.0);
        v52 = v28;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
        [(HUQuickControlCollectionViewGridLayoutRowInfo *)v27 setItemLayouts:v29];

        -[HUQuickControlCollectionViewGridLayoutRowInfo setContentSize:](v27, "setContentSize:", v8, 50.0);
        [(HUQuickControlCollectionViewGridLayoutDetails *)v23 setSectionHeaderLayout:v27];

LABEL_10:
        v30 = [(HUQuickControlCollectionViewLayout *)self _computeRowLayoutsForGridLayout:v23 gridLayoutSettings:v22];
        uint64_t v43 = 0;
        v44 = (double *)&v43;
        uint64_t v45 = 0x3010000000;
        v46 = &unk_1BEACB3BA;
        long long v47 = *MEMORY[0x1E4F1DB30];
        v31 = [(HUQuickControlCollectionViewGridLayoutDetails *)v23 sectionHeaderLayout];

        if (v31)
        {
          v32 = [(HUQuickControlCollectionViewGridLayoutDetails *)v23 sectionHeaderLayout];
          [v32 contentSize];
          v44[5] = v33 + v44[5];
        }
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __62__HUQuickControlCollectionViewLayout__computeSizingLayoutInfo__block_invoke;
        v42[3] = &unk_1E6392940;
        v42[4] = v22;
        v42[5] = &v43;
        [v30 enumerateObjectsUsingBlock:v42];
        [(HUQuickControlCollectionViewGridLayoutDetails *)v23 setRowLayouts:v30];
        double v34 = HUSizeRoundedToScreenScale();
        -[HUQuickControlCollectionViewGridLayoutDetails setContentFrame:](v23, "setContentFrame:", v19, v20, v34, v35);
        v36 = [(HUQuickControlCollectionViewLayoutInfo *)v41 layoutDetailsArray];
        [v36 addObject:v23];

        _Block_object_dispose(&v43, 8);
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v18);
  }

  return v41;
}

void __62__HUQuickControlCollectionViewLayout__computeSizingLayoutInfo__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
  id v6 = a2;
  [v6 contentSize];
  if (v5 >= v7) {
    double v7 = v5;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v7;
  double v8 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  [v6 contentSize];
  double v10 = v9;

  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v8 + v10;
  if (a3)
  {
    double v11 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [*(id *)(a1 + 32) rowSpacing];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v11 + v12;
  }
}

- (id)_computeRowLayoutsForGridLayout:(id)a3 gridLayoutSettings:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v33 = [v6 numberOfRows];
  id v34 = (id)objc_opt_new();
  if (v33)
  {
    uint64_t v8 = 0;
    double v9 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v11 = *MEMORY[0x1E4F43ED8];
    *(void *)&long long v7 = 138412546;
    long long v32 = v7;
    do
    {
      double v12 = objc_alloc_init(HUQuickControlCollectionViewGridLayoutRowInfo);
      -[HUQuickControlCollectionViewGridLayoutRowInfo setNumberOfItems:](v12, "setNumberOfItems:", [v5 numberOfColumnsInRow:v8]);
      [v34 addObject:v12];
      double v13 = objc_opt_new();
      if ([(HUQuickControlCollectionViewGridLayoutRowInfo *)v12 numberOfItems])
      {
        unint64_t v14 = 0;
        double v15 = v9;
        double v16 = v10;
        do
        {
          v17 = objc_msgSend(v5, "indexPathForRow:column:", v8, v14, v32);
          uint64_t v18 = objc_alloc_init(HUQuickControlCollectionViewGridLayoutItemInfo);
          -[HUQuickControlCollectionViewGridLayoutItemInfo setTitlePosition:](v18, "setTitlePosition:", [v6 titlePosition]);
          double v19 = -[HUQuickControlCollectionViewLayout _intrinsicSizeDescriptorForItemAtIndexPath:itemSize:](self, "_intrinsicSizeDescriptorForItemAtIndexPath:itemSize:", v17, [v6 itemSize]);
          [v19 intrinsicSize];
          -[HUQuickControlCollectionViewGridLayoutItemInfo setPreferredSize:](v18, "setPreferredSize:");
          [(HUQuickControlCollectionViewGridLayoutItemInfo *)v18 preferredSize];
          double v22 = v21;
          double v23 = v20;
          if (v20 == v11 || v20 < 57.0)
          {
            v24 = HFLogForCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v32;
              v37 = v17;
              __int16 v38 = 2048;
              double v39 = v23;
              _os_log_error_impl(&dword_1BE345000, v24, OS_LOG_TYPE_ERROR, "item at indexPath %@ has height %f that is very small.", buf, 0x16u);
            }

            v25 = [v19 aspectRatio];

            double v23 = 57.0;
            if (v25)
            {
              BOOL v26 = [v19 aspectRatio];
              [v26 doubleValue];
              double v22 = v27 * 57.0;

              double v23 = 57.0;
            }
          }
          -[HUQuickControlCollectionViewGridLayoutItemInfo setSize:](v18, "setSize:", v22, v23);
          [(HUQuickControlCollectionViewGridLayoutItemInfo *)v18 size];
          double v15 = v15 + v28;
          if (v14)
          {
            [v6 interitemSpacing];
            double v15 = v15 + v29;
          }
          [(HUQuickControlCollectionViewGridLayoutItemInfo *)v18 size];
          if (v16 < v30) {
            double v16 = v30;
          }
          [v13 addObject:v18];

          ++v14;
        }
        while (v14 < [(HUQuickControlCollectionViewGridLayoutRowInfo *)v12 numberOfItems]);
      }
      -[HUQuickControlCollectionViewGridLayoutRowInfo setItemLayouts:](v12, "setItemLayouts:", v13, v32);
      [(HUQuickControlCollectionViewGridLayoutRowInfo *)v12 setContentSize:HUSizeRoundedToScreenScale()];

      ++v8;
    }
    while (v8 != v33);
  }

  return v34;
}

- (void)_computeLayoutInfo
{
  double v3 = [(HUQuickControlCollectionViewLayout *)self _computeSizingLayoutInfo];
  double v4 = [v3 layoutDetailsArray];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke;
  v29[3] = &unk_1E6392990;
  v29[4] = self;
  id v5 = v3;
  id v30 = v5;
  [v4 enumerateObjectsUsingBlock:v29];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_3;
  v26[3] = &unk_1E63929B8;
  id v6 = v5;
  id v27 = v6;
  double v28 = self;
  [v6 setCollectionViewContentSize:__56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_3((uint64_t)v26)];
  [v6 collectionViewContentSize];
  double v8 = v7;
  [v6 availableContentFrame];
  double v10 = v9;
  double v11 = [v6 layoutDetailsArray];
  double v12 = [v11 firstObject];
  [v12 contentFrame];
  double v14 = v13;

  [v6 availableContentFrame];
  double v16 = HURoundToScreenScale(v15 + fmax((v10 - (v8 - v14)) * 0.5, 0.0));
  if (v16 > v14)
  {
    double v17 = v16 - v14;
    uint64_t v18 = [v6 layoutDetailsArray];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    double v22 = __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_4;
    double v23 = &unk_1E63929E0;
    double v25 = v17;
    id v19 = v6;
    id v24 = v19;
    [v18 enumerateObjectsUsingBlock:&v20];

    objc_msgSend(v19, "collectionViewContentSize", v20, v21, v22, v23);
    objc_msgSend(v19, "setCollectionViewContentSize:");
  }
  [(HUQuickControlCollectionViewLayout *)self setLayoutInfo:v6];
}

void __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  double v7 = [v5 settings];
  double v8 = [v6 _computeRowLayoutOriginsFromLayoutDetails:v5 forSectionSettings:v7];
  [v5 setRowLayouts:v8];

  double v9 = [v5 settings];
  [v9 sectionTopPadding];
  uint64_t v11 = v10;

  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  double v17 = __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_2;
  uint64_t v18 = &unk_1E6392968;
  id v19 = *(id *)(a1 + 40);
  id v20 = v5;
  uint64_t v21 = a3;
  uint64_t v22 = v11;
  id v12 = v5;
  double v13 = __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_2((uint64_t)&v15);
  objc_msgSend(v12, "setContentFrame:", v13, v15, v16, v17, v18);
  double v14 = [*(id *)(a1 + 40) layoutDetailsArray];
  [v14 setObject:v12 atIndexedSubscript:a3];
}

double __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) availableContentFrame];
  double v3 = v2;
  [*(id *)(a1 + 40) contentFrame];
  double v5 = (v3 - v4) * 0.5;
  [*(id *)(a1 + 40) contentFrame];
  [*(id *)(a1 + 32) availableContentFrame];
  double v7 = v6;
  double v8 = fmax(v5, 0.0);
  if (*(void *)(a1 + 48))
  {
    double v9 = [*(id *)(a1 + 32) layoutDetailsArray];
    uint64_t v10 = [v9 objectAtIndex:*(void *)(a1 + 48) - 1];
    [v10 contentFrame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v25.origin.CGFloat x = v12;
    v25.origin.CGFloat y = v14;
    v25.size.double width = v16;
    v25.size.double height = v18;
    CGRectGetMaxY(v25);
  }
  double v19 = v7 + v8;
  if (v5 < 0.0)
  {
    [*(id *)(a1 + 40) contentFrame];
    double v21 = v19 + v20;
    [*(id *)(a1 + 32) availableContentFrame];
    if (v21 > v22)
    {
      [*(id *)(a1 + 32) availableContentFrame];
      return v5 + v23;
    }
  }
  return v19;
}

double __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) layoutDetailsArray];
  uint64_t v3 = [v2 count];

  if (!v3) {
    return *MEMORY[0x1E4F1DB30];
  }
  double v4 = [*(id *)(a1 + 32) layoutDetailsArray];
  double v5 = [v4 objectAtIndexedSubscript:0];
  [v5 contentFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v27.origin.CGFloat x = v7;
  v27.origin.CGFloat y = v9;
  v27.size.CGFloat width = v11;
  v27.size.CGFloat height = v13;
  double MaxX = CGRectGetMaxX(v27);
  [*(id *)(a1 + 40) contentInset];
  double v16 = MaxX + v15;
  v28.origin.CGFloat x = v7;
  v28.origin.CGFloat y = v9;
  v28.size.CGFloat width = v11;
  v28.size.CGFloat height = v13;
  CGRectGetMaxY(v28);
  [*(id *)(a1 + 40) contentInset];
  double v17 = [*(id *)(a1 + 32) layoutDetailsArray];
  unint64_t v18 = [v17 count];

  if (v18 >= 2)
  {
    double v19 = [*(id *)(a1 + 32) layoutDetailsArray];
    double v20 = [v19 lastObject];

    [v20 contentFrame];
    CGFloat x = v29.origin.x;
    CGFloat y = v29.origin.y;
    CGFloat width = v29.size.width;
    CGFloat height = v29.size.height;
    double v25 = CGRectGetMaxX(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    CGRectGetMaxY(v30);
    [*(id *)(a1 + 40) contentInset];
    if (v16 < v25) {
      double v16 = v25;
    }
  }
  return v16;
}

void __56__HUQuickControlCollectionViewLayout__computeLayoutInfo__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 contentFrame];
  objc_msgSend(v5, "setContentFrame:");
  id v6 = [*(id *)(a1 + 32) layoutDetailsArray];
  [v6 setObject:v5 atIndexedSubscript:a3];
}

- (id)_computeRowLayoutOriginsFromLayoutDetails:(id)a3 forSectionSettings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  CGFloat v7 = [v5 sectionHeaderLayout];

  if (v7)
  {
    double v8 = [v5 sectionHeaderLayout];
    [v8 contentSize];
    v19[3] = (unint64_t)(v9 + (double)(unint64_t)v19[3]);
  }
  double v10 = [v5 rowLayouts];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke;
  v14[3] = &unk_1E6392A58;
  double v17 = &v18;
  id v11 = v6;
  id v15 = v11;
  id v12 = v5;
  id v16 = v12;
  [v10 enumerateObjectsUsingBlock:v14];

  _Block_object_dispose(&v18, 8);

  return v10;
}

void __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke_2;
  aBlock[3] = &unk_1E6392A08;
  uint64_t v19 = *(void *)(a1 + 48);
  id v4 = v3;
  id v17 = v4;
  id v18 = *(id *)(a1 + 32);
  id v5 = (void (**)(void))_Block_copy(aBlock);
  [v4 contentSize];
  uint64_t v7 = v6;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke_3;
  id v12 = &unk_1E6392A30;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  uint64_t v15 = v7;
  double v8 = __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke_3((uint64_t)&v9);
  objc_msgSend(v4, "setRowOrigin:", v8, (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v9, v10, v11, v12);

  if (v5) {
    v5[2](v5);
  }
}

double __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) contentSize];
  double v3 = v2;
  [*(id *)(a1 + 40) rowSpacing];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = v3 + v4 + (double)*(unint64_t *)(v5 + 24);
  *(void *)(v5 + 24) = (unint64_t)result;
  return result;
}

double __99__HUQuickControlCollectionViewLayout__computeRowLayoutOriginsFromLayoutDetails_forSectionSettings___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) horizontalAlignment];
  double v3 = 0.0;
  if (v2 != 1)
  {
    if (v2 == 3)
    {
      [*(id *)(a1 + 40) contentFrame];
      if ((v4 - *(double *)(a1 + 48)) * 0.5 >= 0.0) {
        return (v4 - *(double *)(a1 + 48)) * 0.5;
      }
      else {
        return 0.0;
      }
    }
    else
    {
      NSLog(&cfstr_UnsupportedAli_0.isa);
    }
  }
  return v3;
}

- (void)_computeGridLayoutAttributesForLayoutInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sectionHeaderLayout];

  if (v5)
  {
    uint64_t v6 = [v4 indexPathForSectionHeader];
    uint64_t v7 = [(HUQuickControlCollectionViewLayout *)self cachedSectionHeaderLayoutAttributes];
    double v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "sectionIndex"));
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    if (!v9)
    {
      uint64_t v9 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:*MEMORY[0x1E4F43758] withIndexPath:v6];
      uint64_t v10 = [v4 sectionHeaderLayout];
      [v10 contentSize];

      [v4 contentFrame];
      [v9 setFrame:0.0];
      id v11 = [(HUQuickControlCollectionViewLayout *)self cachedSectionHeaderLayoutAttributes];
      id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "sectionIndex"));
      [v11 setObject:v9 forKeyedSubscript:v12];
    }
  }
  id v13 = [v4 rowLayouts];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__HUQuickControlCollectionViewLayout__computeGridLayoutAttributesForLayoutInfo___block_invoke;
  v15[3] = &unk_1E6392A80;
  id v16 = v4;
  id v17 = self;
  id v14 = v4;
  [v13 enumerateObjectsUsingBlock:v15];
}

void __80__HUQuickControlCollectionViewLayout__computeGridLayoutAttributesForLayoutInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v25 = a2;
  [*(id *)(a1 + 32) contentFrame];
  double v6 = v5;
  [v25 rowOrigin];
  double v8 = v7;
  if ([v25 numberOfItems])
  {
    unint64_t v9 = 0;
    double v10 = v6 + v8;
    do
    {
      id v11 = [*(id *)(a1 + 32) indexPathForRow:a3 column:v9];
      id v12 = [*(id *)(a1 + 40) cachedLayoutAttributesByIndexPath];
      id v13 = [v12 objectForKeyedSubscript:v11];

      if (!v13)
      {
        id v14 = [v25 itemLayouts];
        uint64_t v15 = [v14 objectAtIndexedSubscript:v9];

        [v15 size];
        [v25 contentSize];
        [v15 size];
        double v17 = v16;
        id v18 = [*(id *)(a1 + 32) settings];
        uint64_t v19 = [v18 itemSize];

        id v13 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:v11];
        objc_msgSend(v13, "setTitlePosition:", objc_msgSend(v15, "titlePosition"));
        [v13 setItemSize:v19];
        uint64_t v20 = [*(id *)(a1 + 40) collectionView];
        uint64_t v21 = [v20 traitCollection];
        [v21 displayScale];
        UIRectIntegralWithScale();
        objc_msgSend(v13, "setFrame:");

        double v22 = [*(id *)(a1 + 40) cachedLayoutAttributesByIndexPath];
        [v22 setObject:v13 forKeyedSubscript:v11];

        double v23 = [*(id *)(a1 + 32) settings];
        [v23 interitemSpacing];
        double v10 = v10 + v17 + v24;
      }
      ++v9;
    }
    while (v9 < [v25 numberOfItems]);
  }
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (HUQuickControlCollectionViewControllerLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (HUQuickControlGridLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (void)setLayoutManager:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSMutableDictionary)cachedLayoutAttributesByIndexPath
{
  return self->_cachedLayoutAttributesByIndexPath;
}

- (NSMutableDictionary)cachedSectionHeaderLayoutAttributes
{
  return self->_cachedSectionHeaderLayoutAttributes;
}

- (HUQuickControlCollectionViewLayoutInfo)layoutInfo
{
  return self->_layoutInfo;
}

- (void)setLayoutInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_storeStrong((id *)&self->_cachedSectionHeaderLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_cachedLayoutAttributesByIndexPath, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);

  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end