@interface HUGridFlowLayout
+ (Class)layoutAttributesClass;
- (BOOL)shouldFlipForRTL;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (HUGridFlowLayout)init;
- (HUGridFlowLayout)parentGridLayout;
- (HUGridLayoutOptions)layoutOptions;
- (NSHashTable)childGridLayouts;
- (NSMutableDictionary)indexPathsByItems;
- (NSMutableDictionary)overrideAttributesByIndexPath;
- (id)_modifiedLayoutAttributesForAttributes:(id)a3;
- (id)initForRTL:(BOOL)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)_updateContainingGridLayout;
- (void)applyOverrideAttributes:(id)a3 toItem:(id)a4 atIndexPath:(id)a5;
- (void)clearAllOverrideAttributesForItems:(id)a3;
- (void)clearOverrideAttributesForItem:(id)a3 atIndexPath:(id)a4;
- (void)invalidateLayout;
- (void)prepareLayout;
- (void)registerChildGridLayout:(id)a3;
- (void)setChildGridLayouts:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setParentGridLayout:(id)a3;
- (void)unregisterChildGridLayout:(id)a3;
@end

@implementation HUGridFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (HUGridFlowLayout)init
{
  return (HUGridFlowLayout *)[(HUGridFlowLayout *)self initForRTL:0];
}

- (id)initForRTL:(BOOL)a3
{
  self->_shouldFlipForRTL = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUGridFlowLayout;
  v3 = [(UICollectionViewFlowLayout *)&v11 init];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    indexPathsByItems = v3->_indexPathsByItems;
    v3->_indexPathsByItems = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_opt_new();
    overrideAttributesByIndexPath = v3->_overrideAttributesByIndexPath;
    v3->_overrideAttributesByIndexPath = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    childGridLayouts = v3->_childGridLayouts;
    v3->_childGridLayouts = (NSHashTable *)v8;
  }
  return v3;
}

- (void)setLayoutOptions:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([(HUGridLayoutOptions *)self->_layoutOptions isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    -[UICollectionViewFlowLayout setScrollDirection:](self, "setScrollDirection:", [v5 scrollDirection]);
    [v5 rowSpacing];
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](self, "setMinimumLineSpacing:");
    [v5 columnSpacing];
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self, "setMinimumInteritemSpacing:");
    [v5 sectionLeadingMargin];
    double v7 = v6;
    [v5 sectionTrailingMargin];
    -[UICollectionViewFlowLayout setSectionInset:](self, "setSectionInset:", 0.0, v7, 0.0, v8);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    id v13 = v5;
    if (objc_msgSend(v13, "columnStyle", v12, 3221225472, __37__HUGridFlowLayout_setLayoutOptions___block_invoke, &unk_1E6388318))
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = 3;
    }
    uint64_t v14 = *MEMORY[0x1E4F43800];
    v10 = [NSNumber numberWithUnsignedInt:v9];
    v15[0] = v10;
    objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [(UICollectionViewFlowLayout *)self _setRowAlignmentsOptions:v11];

    [(HUGridFlowLayout *)self invalidateLayout];
  }
}

uint64_t __37__HUGridFlowLayout_setLayoutOptions___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) columnStyle]) {
    return 0;
  }
  else {
    return 3;
  }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HUGridFlowLayout;
  uint64_t v4 = -[HUGridFlowLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v6, sel_layoutAttributesForInteractivelyMovingItemAtIndexPath_withTargetPosition_, a3, a4.x, a4.y);
  [v4 setAlpha:0.8];

  return v4;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HUGridFlowLayout;
  uint64_t v4 = -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v12, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__HUGridFlowLayout_layoutAttributesForElementsInRect___block_invoke;
  v10[3] = &unk_1E638CBF8;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v4 enumerateObjectsUsingBlock:v10];
  double v7 = v11;
  id v8 = v6;

  return v8;
}

void __54__HUGridFlowLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _modifiedLayoutAttributesForAttributes:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUGridFlowLayout;
  uint64_t v4 = [(UICollectionViewFlowLayout *)&v7 layoutAttributesForItemAtIndexPath:a3];
  id v5 = [(HUGridFlowLayout *)self _modifiedLayoutAttributesForAttributes:v4];

  return v5;
}

- (void)invalidateLayout
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)HUGridFlowLayout;
  [(HUGridFlowLayout *)&v12 invalidateLayout];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(HUGridFlowLayout *)self childGridLayouts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidateLayout];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)prepareLayout
{
  v3.receiver = self;
  v3.super_class = (Class)HUGridFlowLayout;
  [(UICollectionViewFlowLayout *)&v3 prepareLayout];
  [(HUGridFlowLayout *)self _updateContainingGridLayout];
}

- (void)applyOverrideAttributes:(id)a3 toItem:(id)a4 atIndexPath:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([v8 conformsToProtocol:&unk_1F19E4798])
  {
    long long v11 = [v8 homeKitObject];
    objc_super v12 = [v11 uniqueIdentifier];

    id v13 = [(HUGridFlowLayout *)self indexPathsByItems];
    id v14 = v13;
    id v15 = v9;
    id v16 = v12;
  }
  else
  {
    if ([v8 conformsToProtocol:&unk_1F19E4850])
    {
      id v14 = v8;
      id v13 = [(HUGridFlowLayout *)self indexPathsByItems];
      objc_super v12 = v13;
    }
    else
    {
      objc_super v12 = [(HUGridFlowLayout *)self indexPathsByItems];
      id v14 = [v8 latestResults];
      id v13 = v12;
    }
    id v15 = v9;
    id v16 = v14;
  }
  [v13 setObject:v15 forKey:v16];

  v17 = [(HUGridFlowLayout *)self overrideAttributesByIndexPath];
  [v17 setObject:v10 forKeyedSubscript:v9];

  v18 = HFLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(HUGridFlowLayout *)self indexPathsByItems];
    v20 = [(HUGridFlowLayout *)self overrideAttributesByIndexPath];
    int v21 = 136316162;
    v22 = "-[HUGridFlowLayout applyOverrideAttributes:toItem:atIndexPath:]";
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    v28 = v19;
    __int16 v29 = 2112;
    v30 = v20;
    _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%s. applied attributes to item %@ at indexPath %@. indexPathsByItems = %@, overrideAttributesByIndexPath = %@", (uint8_t *)&v21, 0x34u);
  }
  [(HUGridFlowLayout *)self invalidateLayout];
}

- (void)clearOverrideAttributesForItem:(id)a3 atIndexPath:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(HUGridFlowLayout *)self indexPathsByItems];
    id v10 = [(HUGridFlowLayout *)self overrideAttributesByIndexPath];
    int v20 = 136316162;
    int v21 = "-[HUGridFlowLayout clearOverrideAttributesForItem:atIndexPath:]";
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    __int16 v27 = v9;
    __int16 v28 = 2112;
    __int16 v29 = v10;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%s. clearing attributes to item %@ at indexPath %@. Before clearing: indexPathsByItems = %@, overrideAttributesByIndexPath = %@", (uint8_t *)&v20, 0x34u);
  }
  if ([v6 conformsToProtocol:&unk_1F19E4798])
  {
    long long v11 = [v6 homeKitObject];
    objc_super v12 = [v11 uniqueIdentifier];

    id v13 = [(HUGridFlowLayout *)self indexPathsByItems];
    id v14 = v13;
    id v15 = v12;
  }
  else
  {
    if ([v6 conformsToProtocol:&unk_1F19E4850])
    {
      id v14 = v6;
      id v13 = [(HUGridFlowLayout *)self indexPathsByItems];
      objc_super v12 = v13;
    }
    else
    {
      objc_super v12 = [(HUGridFlowLayout *)self indexPathsByItems];
      id v14 = [v6 latestResults];
      id v13 = v12;
    }
    id v15 = v14;
  }
  [v13 removeObjectForKey:v15];

  id v16 = [(HUGridFlowLayout *)self overrideAttributesByIndexPath];
  [v16 removeObjectForKey:v7];

  v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(HUGridFlowLayout *)self indexPathsByItems];
    v19 = [(HUGridFlowLayout *)self overrideAttributesByIndexPath];
    int v20 = 136316162;
    int v21 = "-[HUGridFlowLayout clearOverrideAttributesForItem:atIndexPath:]";
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    __int16 v27 = v18;
    __int16 v28 = 2112;
    __int16 v29 = v19;
    _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%s. clearing attributes to item %@ at indexPath %@. After clearing: indexPathsByItems = %@, overrideAttributesByIndexPath = %@", (uint8_t *)&v20, 0x34u);
  }
  [(HUGridFlowLayout *)self invalidateLayout];
}

- (void)clearAllOverrideAttributesForItems:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HUGridFlowLayout *)self overrideAttributesByIndexPath];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(HUGridFlowLayout *)self indexPathsByItems];
      id v9 = [(HUGridFlowLayout *)self overrideAttributesByIndexPath];
      *(_DWORD *)buf = 136315906;
      v51 = "-[HUGridFlowLayout clearAllOverrideAttributesForItems:]";
      __int16 v52 = 2112;
      id v53 = v4;
      __int16 v54 = 2112;
      v55 = v8;
      __int16 v56 = 2112;
      v57 = v9;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%s. clearing all attributes for items %@. Before clearing: indexPathsByItems = %@, overrideAttributesByIndexPath = %@", buf, 0x2Au);
    }
    id v10 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v39 = v4;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v45 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if ([v16 conformsToProtocol:&unk_1F19E4798])
          {
            id v17 = v16;
            v18 = [v17 homeKitObject];
            v19 = [v18 uniqueIdentifier];

            [v10 addObject:v19];
          }
          else if ([v16 conformsToProtocol:&unk_1F19E4850])
          {
            [v10 addObject:v16];
          }
          else
          {
            int v20 = [v16 latestResults];
            [v10 addObject:v20];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v13);
    }

    int v21 = (void *)MEMORY[0x1E4F1CAD0];
    __int16 v22 = [(HUGridFlowLayout *)self indexPathsByItems];
    id v23 = [v22 allKeys];
    __int16 v24 = [v21 setWithArray:v23];

    [v10 intersectSet:v24];
    id v25 = HFLogForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[HUGridFlowLayout clearAllOverrideAttributesForItems:]";
      __int16 v52 = 2112;
      id v53 = v10;
      _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%s. keyItems = %@", buf, 0x16u);
    }

    __int16 v26 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    __int16 v27 = [v10 allObjects];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v41 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v40 + 1) + 8 * j);
          v33 = [(HUGridFlowLayout *)self indexPathsByItems];
          v34 = [v33 objectForKey:v32];

          if (v34) {
            [v26 addObject:v34];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v29);
    }

    v35 = HFLogForCategory();
    id v4 = v39;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[HUGridFlowLayout clearAllOverrideAttributesForItems:]";
      __int16 v52 = 2112;
      id v53 = v26;
      _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_DEFAULT, "%s. clearing all attributes for items. indexPathsToInvalidate = %@", buf, 0x16u);
    }

    v36 = [(HUGridFlowLayout *)self indexPathsByItems];
    [v36 removeAllObjects];

    v37 = [(HUGridFlowLayout *)self overrideAttributesByIndexPath];
    [v37 removeAllObjects];

    id v38 = objc_alloc_init(MEMORY[0x1E4F42898]);
    [v38 invalidateItemsAtIndexPaths:v26];
    [(UICollectionViewFlowLayout *)self invalidateLayoutWithContext:v38];
  }
}

- (void)_updateContainingGridLayout
{
  objc_super v3 = [(HUGridFlowLayout *)self collectionView];
  id v4 = [v3 superview];

  while (v4)
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      objc_opt_class();
      id v8 = [v7 collectionViewLayout];
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
      id v10 = v9;

      if (v10)
      {
        id v11 = [(HUGridFlowLayout *)self parentGridLayout];

        if (v10 != v11)
        {
          uint64_t v12 = [(HUGridFlowLayout *)self parentGridLayout];
          [v12 unregisterChildGridLayout:self];

          [v10 registerChildGridLayout:self];
        }
      }
    }
    id v4 = [v5 superview];
  }
}

- (void)registerChildGridLayout:(id)a3
{
  id v5 = a3;
  id v4 = [(HUGridFlowLayout *)self childGridLayouts];
  [v4 addObject:v5];

  [v5 setParentGridLayout:self];
}

- (void)unregisterChildGridLayout:(id)a3
{
  id v5 = a3;
  id v4 = [(HUGridFlowLayout *)self childGridLayouts];
  [v4 removeObject:v5];

  [v5 setParentGridLayout:0];
}

- (id)_modifiedLayoutAttributesForAttributes:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_LayoutAttribut.isa, v4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v4 representedElementCategory])
  {
    id v7 = [v4 indexPath];
    id v5 = (id)[v4 copy];
    id v8 = [(HUGridFlowLayout *)self overrideAttributesByIndexPath];
    id v9 = [v8 objectForKeyedSubscript:v7];

    if (v9)
    {
      [v9 transform];
      v45[0] = *(_OWORD *)((char *)&v45[3] + 8);
      v45[1] = *(_OWORD *)((char *)&v45[4] + 8);
      v45[2] = *(_OWORD *)((char *)&v45[5] + 8);
      [v5 setTransform:v45];
      [v9 alpha];
      objc_msgSend(v5, "setAlpha:");
      objc_msgSend(v5, "setZIndex:", objc_msgSend(v9, "zIndex"));
    }
    id v10 = [(HUGridFlowLayout *)self collectionView];
    id v11 = [v10 delegate];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = [(HUGridFlowLayout *)self collectionView];
      int v13 = [v11 collectionView:v12 gridLayout:self wantsScrollingAdjustmentsForItemAtIndexPath:v7];

      if (v13)
      {
        [v5 setZIndex:-1000];
        long long v40 = [(HUGridFlowLayout *)self collectionView];
        [v40 contentOffset];
        double v15 = v14;
        id v16 = [(HUGridFlowLayout *)self collectionView];
        [v16 contentInset];
        double v18 = v15 + v17;
        v19 = [(HUGridFlowLayout *)self collectionView];
        [v19 contentOffset];
        double v21 = v20;
        __int16 v22 = [(HUGridFlowLayout *)self collectionView];
        [v22 contentInset];
        double v24 = v21 + v23;
        id v25 = [(HUGridFlowLayout *)self collectionView];
        [v25 _systemContentInset];
        double v27 = v24 + v26;

        if (objc_opt_respondsToSelector())
        {
          uint64_t v28 = [(HUGridFlowLayout *)self collectionView];
          objc_msgSend(v11, "collectionView:gridLayout:alphaForItemAtIndexPath:scrollDistance:", v28, self, v7, v18, v27);
          objc_msgSend(v5, "setAlpha:");
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v29 = [(HUGridFlowLayout *)self collectionView];
          objc_msgSend(v11, "collectionView:gridLayout:positionOffsetForItemAtIndexPath:scrollDistance:", v29, self, v7, v18, v27);
          double v31 = v30;
          double v33 = v32;

          [v5 center];
          objc_msgSend(v5, "setCenter:", v31 + v34, v33 + v35);
        }
        v36 = [(HUGridFlowLayout *)self collectionView];
        v37 = [v36 delegate];
        char v38 = objc_opt_respondsToSelector();

        if (v38)
        {
          id v39 = [(HUGridFlowLayout *)self collectionView];
          [v5 frame];
          if (v11)
          {
            objc_msgSend(v11, "collectionView:gridLayout:transformForItemAtIndexPath:cellFrame:scrollDistance:offset:", v39, self, v7);
          }
          else
          {
            long long v43 = 0u;
            long long v44 = 0u;
            long long v42 = 0u;
          }
          v41[0] = v42;
          v41[1] = v43;
          v41[2] = v44;
          [v5 setTransform:v41];
        }
      }
    }
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (NSMutableDictionary)indexPathsByItems
{
  return self->_indexPathsByItems;
}

- (NSMutableDictionary)overrideAttributesByIndexPath
{
  return self->_overrideAttributesByIndexPath;
}

- (NSHashTable)childGridLayouts
{
  return self->_childGridLayouts;
}

- (void)setChildGridLayouts:(id)a3
{
}

- (HUGridFlowLayout)parentGridLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentGridLayout);

  return (HUGridFlowLayout *)WeakRetained;
}

- (void)setParentGridLayout:(id)a3
{
}

- (BOOL)shouldFlipForRTL
{
  return self->_shouldFlipForRTL;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentGridLayout);
  objc_storeStrong((id *)&self->_childGridLayouts, 0);
  objc_storeStrong((id *)&self->_overrideAttributesByIndexPath, 0);
  objc_storeStrong((id *)&self->_indexPathsByItems, 0);

  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end