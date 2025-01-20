@interface NSCollectionLayoutSection
+ (NSCollectionLayoutSection)sectionWithGroup:(NSCollectionLayoutGroup *)group;
+ (id)_emptySection;
- (BOOL)_clipsBackgroundDecorationsToContent;
- (BOOL)_clipsContentToBounds;
- (BOOL)_containsBackgroundDecorationItem:(id)a3;
- (BOOL)_containsEstimatedSizeElement;
- (BOOL)_excludesBoundarySupplementariesFromClipping;
- (BOOL)_hasBackgroundDecorationItem;
- (BOOL)_hasVisibleItemsHandler;
- (BOOL)_isEmptySection;
- (BOOL)_isListSolverCompatibleForLayoutAxis:(unint64_t)a3;
- (BOOL)_pinnedSupplementariesShouldOverlap;
- (BOOL)_wantsBandSelectionVisuals;
- (BOOL)_wantsSwipeActions;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersListSolver;
- (BOOL)scrollsOrthogonally;
- (BOOL)shouldRestrictOrthogonalAxisDuringInteractiveMovement;
- (BOOL)supplementariesFollowContentInsets;
- (CGFloat)interGroupSpacing;
- (CGSize)contentSize;
- (CVCDirectionalEdgeInsets)_clippingInsets;
- (NSArray)boundarySupplementaryItems;
- (NSArray)decorationItems;
- (NSArray)supplementaryItems;
- (NSCollectionLayoutGroup)group;
- (NSCollectionLayoutSection)initWithGroup:(id)a3 contentInsets:(CVCDirectionalEdgeInsets)a4 contentInsetsReference:(int64_t)a5 supplementaryItems:(id)a6 boundarySupplementaryItems:(id)a7 pinnedSupplementaryItemIndexes:(id)a8 interGroupSpacing:(double)a9 visibleItemsInvalidationHandler:(id)a10 supplementariesFollowInsets:(BOOL)a11 decorationItems:(id)a12 orthogonalScrollingBehavior:(int64_t)a13 isEmptySection:(BOOL)a14 prefersListSolver:(BOOL)a15;
- (NSCollectionLayoutSection)initWithLayoutGroup:(id)a3;
- (NSCollectionLayoutSectionVisibleItemsInvalidationHandler)visibleItemsInvalidationHandler;
- (NSDictionary)decorationItemssDict;
- (NSDictionary)supplementaryItemsDict;
- (NSDirectionalEdgeInsets)contentInsets;
- (NSIndexSet)pinnedSupplementaryItemIndexes;
- (UICollectionLayoutSectionOrthogonalScrollingBehavior)orthogonalScrollingBehavior;
- (UICollectionLayoutSectionOrthogonalScrollingProperties)orthogonalScrollingProperties;
- (UIContentInsetsReference)contentInsetsReference;
- (UIContentInsetsReference)supplementaryContentInsetsReference;
- (_UICollectionLayoutSectionCallback)_callback;
- (double)_cornerRadius;
- (double)_paddingToBoundarySupplementaries;
- (double)_postBoundaryPadding;
- (double)_preBoundaryPadding;
- (id)_auxillaryItemForElementKind:(id)a3 category:(unint64_t)a4;
- (id)_backgroundDecorationViewsRequiringCustomViewClassRegistration;
- (id)_descriptionProperties;
- (id)_leadingSwipeActionsConfigurationForIndexPath:(id)a3;
- (id)_orthogonalScrollingProperties;
- (id)_preferredContainerBackgroundColor;
- (id)_trailingSwipeActionsConfigurationForIndexPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decorationItemsDict;
- (id)description;
- (id)pinnedBoundarySupplementaryItemIndexes;
- (void)_checkForDuplicateSupplementaryItemKindsAndThrowIfFound;
- (void)_setClippingInsets:(CVCDirectionalEdgeInsets)a3;
- (void)_setClipsBackgroundDecorationsToContent:(BOOL)a3;
- (void)_setClipsContentToBounds:(BOOL)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_setExcludesBoundarySupplementariesFromClipping:(BOOL)a3;
- (void)_setPostBoundaryPadding:(double)a3;
- (void)_setPreBoundaryPadding:(double)a3;
- (void)setBoundarySupplementaryItems:(NSArray *)boundarySupplementaryItems;
- (void)setContentInsets:(NSDirectionalEdgeInsets)contentInsets;
- (void)setContentInsetsReference:(UIContentInsetsReference)contentInsetsReference;
- (void)setContentSize:(CGSize)a3;
- (void)setDecorationItems:(NSArray *)decorationItems;
- (void)setGroup:(id)a3;
- (void)setInterGroupSpacing:(CGFloat)interGroupSpacing;
- (void)setOrthogonalScrollingBehavior:(UICollectionLayoutSectionOrthogonalScrollingBehavior)orthogonalScrollingBehavior;
- (void)setPinnedSupplementaryItemIndexes:(id)a3;
- (void)setPrefersListSolver:(BOOL)a3;
- (void)setSupplementariesFollowContentInsets:(BOOL)supplementariesFollowContentInsets;
- (void)setSupplementaryContentInsetsReference:(UIContentInsetsReference)supplementaryContentInsetsReference;
- (void)setSupplementaryItems:(id)a3;
- (void)setVisibleItemsInvalidationHandler:(NSCollectionLayoutSectionVisibleItemsInvalidationHandler)visibleItemsInvalidationHandler;
@end

@implementation NSCollectionLayoutSection

- (BOOL)_hasBackgroundDecorationItem
{
  return self->_hasBackgroundDecorationItem;
}

- (_UICollectionLayoutSectionCallback)_callback
{
  return self->_callback;
}

- (BOOL)_containsEstimatedSizeElement
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_isEmptySection) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_boundarySupplementaryItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "size", (void)v11);
        char v10 = [v9 isEstimated];

        if (v10)
        {

          return 1;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  return [(NSCollectionLayoutItem *)self->_group containsEstimatedSizeItem];
}

- (BOOL)_isListSolverCompatibleForLayoutAxis:(unint64_t)a3
{
  if (!self->_prefersListSolver) {
    return 0;
  }
  char v5 = [(NSCollectionLayoutSection *)self scrollsOrthogonally];
  uint64_t v6 = [(NSCollectionLayoutSection *)self group];
  LOBYTE(a3) = [v6 _isListSolverCompatibleForLayoutAxis:a3];

  return a3 & ~v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_decorationItemssDict, 0);
  objc_storeStrong((id *)&self->_pinnedSupplementaryItemIndexes, 0);
  objc_storeStrong((id *)&self->_supplementaryItems, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_decorationItems, 0);
  objc_storeStrong(&self->_visibleItemsInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_boundarySupplementaryItems, 0);
  objc_storeStrong((id *)&self->_orthogonalScrollingProperties, 0);
  objc_storeStrong((id *)&self->_decorationItemsDict, 0);
  objc_storeStrong((id *)&self->_supplementaryItemsDict, 0);
  objc_storeStrong((id *)&self->_pinnedBoundarySupplementaryItemIndexes, 0);
}

void __84__NSCollectionLayoutSection__checkForDuplicateSupplementaryItemKindsAndThrowIfFound__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 supplementaryItems];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __84__NSCollectionLayoutSection__checkForDuplicateSupplementaryItemKindsAndThrowIfFound__block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) elementKind];
        if (!v8)
        {
          v9 = [MEMORY[0x263F08690] currentHandler];
          [v9 handleFailureInMethod:a1[7] object:a1[4] file:@"NSCollectionLayoutItem.m" lineNumber:1370 description:@"Error: no elementKind for supplementary. Please file a bug on UICollectionView as this should not be possible."];
        }
        [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v8];
        [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (NSCollectionLayoutSection)initWithGroup:(id)a3 contentInsets:(CVCDirectionalEdgeInsets)a4 contentInsetsReference:(int64_t)a5 supplementaryItems:(id)a6 boundarySupplementaryItems:(id)a7 pinnedSupplementaryItemIndexes:(id)a8 interGroupSpacing:(double)a9 visibleItemsInvalidationHandler:(id)a10 supplementariesFollowInsets:(BOOL)a11 decorationItems:(id)a12 orthogonalScrollingBehavior:(int64_t)a13 isEmptySection:(BOOL)a14 prefersListSolver:(BOOL)a15
{
  double trailing = a4.trailing;
  double bottom = a4.bottom;
  double leading = a4.leading;
  double top = a4.top;
  id v27 = a3;
  id v28 = a6;
  id v29 = a7;
  id v30 = a8;
  id v31 = a10;
  id v32 = a12;
  if (!v27 && !a14)
  {
    v48 = [MEMORY[0x263F08690] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"NSCollectionLayoutItem.m", 1015, @"Invalid parameter not satisfying: %@", @"group" object file lineNumber description];
  }
  v49.receiver = self;
  v49.super_class = (Class)NSCollectionLayoutSection;
  v33 = [(NSCollectionLayoutSection *)&v49 init];
  if (v33)
  {
    uint64_t v34 = [v27 copy];
    group = v33->_group;
    v33->_group = (NSCollectionLayoutGroup *)v34;

    v33->_contentInsets.double top = top;
    v33->_contentInsets.double leading = leading;
    v33->_contentInsets.double bottom = bottom;
    v33->_contentInsets.double trailing = trailing;
    v33->_contentInsetsReference = a5;
    uint64_t v36 = [v28 copy];
    supplementaryItems = v33->_supplementaryItems;
    v33->_supplementaryItems = (NSArray *)v36;

    uint64_t v38 = [v29 copy];
    boundarySupplementaryItems = v33->_boundarySupplementaryItems;
    v33->_boundarySupplementaryItems = (NSArray *)v38;

    uint64_t v40 = [v30 copy];
    pinnedSupplementaryItemIndexes = v33->_pinnedSupplementaryItemIndexes;
    v33->_pinnedSupplementaryItemIndexes = (NSIndexSet *)v40;

    v33->_interGroupSpacing = a9;
    uint64_t v42 = [v31 copy];
    id visibleItemsInvalidationHandler = v33->_visibleItemsInvalidationHandler;
    v33->_id visibleItemsInvalidationHandler = (id)v42;

    v33->_supplementariesFollowContentInsets = a11;
    pinnedBoundarySupplementaryItemIndexes = v33->_pinnedBoundarySupplementaryItemIndexes;
    v33->_pinnedBoundarySupplementaryItemIndexes = 0;

    uint64_t v45 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v32 copyItems:1];
    decorationItems = v33->_decorationItems;
    v33->_decorationItems = (NSArray *)v45;

    v33->_hasBackgroundDecorationItem = [(NSCollectionLayoutSection *)v33 _containsBackgroundDecorationItem:v33->_decorationItems];
    v33->_orthogonalScrollingBehavior = a13;
    v33->_isEmptySection = a14;
    v33->_prefersListSolver = a15;
  }

  return v33;
}

- (BOOL)_containsBackgroundDecorationItem:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "isBackgroundDecoration", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)contentInsets
{
  self->_contentInsets = (CVCDirectionalEdgeInsets)contentInsets;
}

- (BOOL)_wantsSwipeActions
{
  return 0;
}

- (void)setContentInsetsReference:(UIContentInsetsReference)contentInsetsReference
{
  self->_contentInsetsReference = contentInsetsReference;
}

- (void)setInterGroupSpacing:(CGFloat)interGroupSpacing
{
  self->_interGroupSpacing = interGroupSpacing;
}

uint64_t __67__NSCollectionLayoutSection_pinnedBoundarySupplementaryItemIndexes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 pinToVisibleBounds];
  if (result)
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    return [v6 addIndex:a3];
  }
  return result;
}

- (id)_auxillaryItemForElementKind:(id)a3 category:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  long long v8 = 0;
  if (a4 && !self->_isEmptySection)
  {
    if ([v6 length])
    {
      if (a4 == 1)
      {
        long long v9 = [(NSCollectionLayoutSection *)self supplementaryItemsDict];
        goto LABEL_9;
      }
      if (a4 == 2)
      {
        long long v9 = [(NSCollectionLayoutSection *)self decorationItemsDict];
LABEL_9:
        long long v10 = v9;
        long long v8 = [v9 objectForKeyedSubscript:v7];

        goto LABEL_10;
      }
    }
    long long v8 = 0;
  }
LABEL_10:

  return v8;
}

- (id)decorationItemsDict
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->_isEmptySection)
  {
    uint64_t v2 = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  else
  {
    decorationItemsDict = self->_decorationItemsDict;
    if (!decorationItemsDict)
    {
      uint64_t v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v6 = [(NSCollectionLayoutSection *)self decorationItems];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            long long v12 = [v11 elementKind];
            [(NSDictionary *)v5 setObject:v11 forKeyedSubscript:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v8);
      }

      uint64_t v13 = self->_decorationItemsDict;
      self->_decorationItemsDict = v5;

      decorationItemsDict = self->_decorationItemsDict;
    }
    uint64_t v2 = decorationItemsDict;
  }
  return v2;
}

- (void)setSupplementariesFollowContentInsets:(BOOL)supplementariesFollowContentInsets
{
  if (supplementariesFollowContentInsets
    && [(NSCollectionLayoutSection *)self supplementaryContentInsetsReference])
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"NSCollectionLayoutItem.m" lineNumber:1070 description:@"Mixing supplementariesFollowContentInsets and supplementaryContentInsetsReference is not supported. Please use supplementaryContentInsetsReference and the contentInsets property on the boundary supplementary item to get the desired behavior."];
  }
  self->_supplementariesFollowContentInsets = supplementariesFollowContentInsets;
}

- (id)_backgroundDecorationViewsRequiringCustomViewClassRegistration
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_hasBackgroundDecorationItem)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [(NSCollectionLayoutSection *)self decorationItems];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v9 isBackgroundDecoration] && objc_msgSend(v9, "_registrationViewClass")) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x263EFFA68];
  }
  return v3;
}

+ (NSCollectionLayoutSection)sectionWithGroup:(NSCollectionLayoutGroup *)group
{
  uint64_t v4 = group;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithLayoutGroup:v4];

  return (NSCollectionLayoutSection *)v5;
}

- (BOOL)_hasVisibleItemsHandler
{
  uint64_t v2 = [(NSCollectionLayoutSection *)self visibleItemsInvalidationHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_checkForDuplicateSupplementaryItemKindsAndThrowIfFound
{
  if (!self->_isEmptySection)
  {
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy_;
    id v32 = __Block_byref_object_dispose_;
    id v33 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __84__NSCollectionLayoutSection__checkForDuplicateSupplementaryItemKindsAndThrowIfFound__block_invoke;
    v21[3] = &unk_2640B2CD0;
    v21[4] = self;
    v21[5] = &v28;
    v21[6] = &v22;
    v21[7] = a2;
    uint64_t v4 = (void *)MEMORY[0x21053FCB0](v21);
    uint64_t v5 = [(NSCollectionLayoutSection *)self group];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __84__NSCollectionLayoutSection__checkForDuplicateSupplementaryItemKindsAndThrowIfFound__block_invoke_2;
    v19[3] = &unk_2640B2C80;
    id v6 = v4;
    id v20 = v6;
    [v5 _enumerateItemsWithHandler:v19];

    uint64_t v7 = [(NSCollectionLayoutSection *)self boundarySupplementaryItems];
    (*((void (**)(id, void *))v6 + 2))(v6, v7);

    uint64_t v8 = [(id)v23[5] count];
    if (v8 != [(id)v29[5] count])
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v10 = (void *)v29[5];
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      long long v15 = __84__NSCollectionLayoutSection__checkForDuplicateSupplementaryItemKindsAndThrowIfFound__block_invoke_3;
      uint64_t v16 = &unk_2640B2CF8;
      long long v18 = &v22;
      id v11 = v9;
      id v17 = v11;
      [v10 enumerateObjectsUsingBlock:&v13];
      long long v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"NSCollectionLayoutItem.m", 1398, @"Error: Every supplementary must have a unique elementKind: duplicates detected: %@", v11, v13, v14, v15, v16 object file lineNumber description];
    }
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (NSCollectionLayoutSection *)a3;
  if (self == v4) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  BOOL isEmptySection = self->_isEmptySection;
  if (isEmptySection != [(NSCollectionLayoutSection *)v4 _isEmptySection]) {
    goto LABEL_17;
  }
  if (self->_isEmptySection && [(NSCollectionLayoutSection *)v4 _isEmptySection])
  {
LABEL_6:
    char v6 = 1;
    goto LABEL_18;
  }
  BOOL prefersListSolver = self->_prefersListSolver;
  if (prefersListSolver != [(NSCollectionLayoutSection *)v4 prefersListSolver]) {
    goto LABEL_17;
  }
  BOOL v8 = [(NSCollectionLayoutSection *)self supplementariesFollowContentInsets];
  if (v8 != [(NSCollectionLayoutSection *)v4 supplementariesFollowContentInsets]) {
    goto LABEL_17;
  }
  UIContentInsetsReference v9 = [(NSCollectionLayoutSection *)self supplementaryContentInsetsReference];
  if (v9 != [(NSCollectionLayoutSection *)v4 supplementaryContentInsetsReference]) {
    goto LABEL_17;
  }
  UICollectionLayoutSectionOrthogonalScrollingBehavior v10 = [(NSCollectionLayoutSection *)self orthogonalScrollingBehavior];
  if (v10 != [(NSCollectionLayoutSection *)v4 orthogonalScrollingBehavior]) {
    goto LABEL_17;
  }
  UIContentInsetsReference v11 = [(NSCollectionLayoutSection *)self contentInsetsReference];
  if (v11 != [(NSCollectionLayoutSection *)v4 contentInsetsReference]) {
    goto LABEL_17;
  }
  BOOL v12 = [(NSCollectionLayoutSection *)self _clipsContentToBounds];
  if (v12 != [(NSCollectionLayoutSection *)v4 _clipsContentToBounds]) {
    goto LABEL_17;
  }
  BOOL v13 = [(NSCollectionLayoutSection *)self _excludesBoundarySupplementariesFromClipping];
  if (v13 != [(NSCollectionLayoutSection *)v4 _excludesBoundarySupplementariesFromClipping])goto LABEL_17; {
  BOOL v14 = [(NSCollectionLayoutSection *)self _clipsBackgroundDecorationsToContent];
  }
  if (v14 != [(NSCollectionLayoutSection *)v4 _clipsBackgroundDecorationsToContent])goto LABEL_17; {
  [(NSCollectionLayoutSection *)self interGroupSpacing];
  }
  double v16 = v15;
  [(NSCollectionLayoutSection *)v4 interGroupSpacing];
  if (vabdd_f64(v16, v17) > 0.0001
    || ([(NSCollectionLayoutSection *)self visibleItemsInvalidationHandler],
        long long v18 = objc_claimAutoreleasedReturnValue(),
        [(NSCollectionLayoutSection *)v4 visibleItemsInvalidationHandler],
        v19 = objc_claimAutoreleasedReturnValue(),
        char v20 = (v18 == 0) ^ (v19 == 0),
        v19,
        v18,
        (v20 & 1) != 0))
  {
LABEL_17:
    char v6 = 0;
    goto LABEL_18;
  }
  [(NSCollectionLayoutSection *)self contentInsets];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  [(NSCollectionLayoutSection *)v4 contentInsets];
  char v6 = 0;
  if (v25 == v33 && v23 == v30 && v29 == v32 && v27 == v31)
  {
    [(NSCollectionLayoutSection *)self _cornerRadius];
    double v35 = v34;
    [(NSCollectionLayoutSection *)v4 _cornerRadius];
    if (vabdd_f64(v35, v36) > 0.0001) {
      goto LABEL_17;
    }
    [(NSCollectionLayoutSection *)self _preBoundaryPadding];
    double v38 = v37;
    [(NSCollectionLayoutSection *)v4 _preBoundaryPadding];
    if (vabdd_f64(v38, v39) > 0.0001) {
      goto LABEL_17;
    }
    [(NSCollectionLayoutSection *)self _postBoundaryPadding];
    double v41 = v40;
    [(NSCollectionLayoutSection *)v4 _postBoundaryPadding];
    if (vabdd_f64(v41, v42) > 0.0001) {
      goto LABEL_17;
    }
    [(NSCollectionLayoutSection *)self _clippingInsets];
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    [(NSCollectionLayoutSection *)v4 _clippingInsets];
    char v6 = 0;
    if (v46 == v54 && v44 == v51 && v50 == v53 && v48 == v52)
    {
      v55 = [(NSCollectionLayoutSection *)self decorationItems];
      v56 = [(NSCollectionLayoutSection *)v4 decorationItems];
      int v57 = __objectEqual(v55, v56);

      if (!v57) {
        goto LABEL_17;
      }
      v58 = [(NSCollectionLayoutSection *)self pinnedBoundarySupplementaryItemIndexes];
      v59 = [(NSCollectionLayoutSection *)v4 pinnedBoundarySupplementaryItemIndexes];
      if ((v58 == 0) != (v59 == 0))
      {
        char v6 = 0;
LABEL_33:

        goto LABEL_18;
      }
      uint64_t v60 = [(NSCollectionLayoutSection *)self pinnedBoundarySupplementaryItemIndexes];
      if (v60)
      {
        v61 = (void *)v60;
        v62 = [(NSCollectionLayoutSection *)self pinnedBoundarySupplementaryItemIndexes];
        v63 = [(NSCollectionLayoutSection *)v4 pinnedBoundarySupplementaryItemIndexes];
        int v64 = [v62 isEqualToIndexSet:v63];

        if (!v64) {
          goto LABEL_17;
        }
      }
      else
      {
      }
      v65 = [(NSCollectionLayoutSection *)self supplementaryItems];
      v66 = [(NSCollectionLayoutSection *)v4 supplementaryItems];
      int v67 = __objectEqual(v65, v66);

      if (!v67) {
        goto LABEL_17;
      }
      v68 = [(NSCollectionLayoutSection *)self boundarySupplementaryItems];
      v69 = [(NSCollectionLayoutSection *)v4 boundarySupplementaryItems];
      int v70 = __objectEqual(v68, v69);

      if (!v70) {
        goto LABEL_17;
      }
      v71 = [(NSCollectionLayoutSection *)self _orthogonalScrollingProperties];
      if (v71)
      {
      }
      else
      {
        v72 = [(NSCollectionLayoutSection *)v4 _orthogonalScrollingProperties];

        if (!v72)
        {
LABEL_44:
          v58 = [(NSCollectionLayoutSection *)self group];
          v59 = [(NSCollectionLayoutSection *)v4 group];
          char v6 = [v58 isEqual:v59];
          goto LABEL_33;
        }
      }
      v73 = [(NSCollectionLayoutSection *)self orthogonalScrollingProperties];
      v74 = [(NSCollectionLayoutSection *)v4 orthogonalScrollingProperties];
      int v75 = [v73 isEqual:v74];

      if (!v75) {
        goto LABEL_17;
      }
      goto LABEL_44;
    }
  }
LABEL_18:

  return v6;
}

- (BOOL)scrollsOrthogonally
{
  return [(NSCollectionLayoutSection *)self orthogonalScrollingBehavior] != UICollectionLayoutSectionOrthogonalScrollingBehaviorNone;
}

- (UICollectionLayoutSectionOrthogonalScrollingBehavior)orthogonalScrollingBehavior
{
  return self->_orthogonalScrollingBehavior;
}

- (BOOL)_clipsContentToBounds
{
  return self->__clipsContentToBounds;
}

- (CGFloat)interGroupSpacing
{
  return self->_interGroupSpacing;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double leading = self->_contentInsets.leading;
  double bottom = self->_contentInsets.bottom;
  double trailing = self->_contentInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (NSCollectionLayoutGroup)group
{
  return self->_group;
}

- (NSArray)boundarySupplementaryItems
{
  return self->_boundarySupplementaryItems;
}

- (UIContentInsetsReference)contentInsetsReference
{
  return self->_contentInsetsReference;
}

- (NSArray)decorationItems
{
  return self->_decorationItems;
}

- (id)pinnedBoundarySupplementaryItemIndexes
{
  p_pinnedBoundarySupplementaryItemIndexes = &self->_pinnedBoundarySupplementaryItemIndexes;
  pinnedBoundarySupplementaryItemIndexes = self->_pinnedBoundarySupplementaryItemIndexes;
  if (!pinnedBoundarySupplementaryItemIndexes)
  {
    uint64_t v8 = 0;
    UIContentInsetsReference v9 = &v8;
    uint64_t v10 = 0x3032000000;
    UIContentInsetsReference v11 = __Block_byref_object_copy_;
    BOOL v12 = __Block_byref_object_dispose_;
    id v13 = objc_alloc_init(MEMORY[0x263F089C8]);
    uint64_t v5 = [(NSCollectionLayoutSection *)self boundarySupplementaryItems];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67__NSCollectionLayoutSection_pinnedBoundarySupplementaryItemIndexes__block_invoke;
    v7[3] = &unk_2640B2CA8;
    v7[4] = &v8;
    [v5 enumerateObjectsUsingBlock:v7];

    objc_storeStrong((id *)p_pinnedBoundarySupplementaryItemIndexes, (id)v9[5]);
    _Block_object_dispose(&v8, 8);

    pinnedBoundarySupplementaryItemIndexes = *p_pinnedBoundarySupplementaryItemIndexes;
  }
  return pinnedBoundarySupplementaryItemIndexes;
}

- (UIContentInsetsReference)supplementaryContentInsetsReference
{
  return self->_supplementaryContentInsetsReference;
}

- (double)_preBoundaryPadding
{
  return self->__preBoundaryPadding;
}

- (double)_postBoundaryPadding
{
  return self->__postBoundaryPadding;
}

- (NSCollectionLayoutSectionVisibleItemsInvalidationHandler)visibleItemsInvalidationHandler
{
  return self->_visibleItemsInvalidationHandler;
}

- (BOOL)supplementariesFollowContentInsets
{
  return self->_supplementariesFollowContentInsets;
}

- (NSArray)supplementaryItems
{
  return self->_supplementaryItems;
}

- (BOOL)_clipsBackgroundDecorationsToContent
{
  return self->__clipsBackgroundDecorationsToContent;
}

- (BOOL)_excludesBoundarySupplementariesFromClipping
{
  return self->__excludesBoundarySupplementariesFromClipping;
}

- (double)_cornerRadius
{
  return self->__cornerRadius;
}

- (CVCDirectionalEdgeInsets)_clippingInsets
{
  double top = self->__clippingInsets.top;
  double leading = self->__clippingInsets.leading;
  double bottom = self->__clippingInsets.bottom;
  double trailing = self->__clippingInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (id)_orthogonalScrollingProperties
{
  return self->_orthogonalScrollingProperties;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v31 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v4 = [(NSCollectionLayoutSection *)self group];
  [(NSCollectionLayoutSection *)self contentInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  UIContentInsetsReference v30 = [(NSCollectionLayoutSection *)self contentInsetsReference];
  id v13 = [(NSCollectionLayoutSection *)self supplementaryItems];
  BOOL v14 = [(NSCollectionLayoutSection *)self boundarySupplementaryItems];
  double v15 = [(NSCollectionLayoutSection *)self pinnedSupplementaryItemIndexes];
  [(NSCollectionLayoutSection *)self interGroupSpacing];
  double v17 = v16;
  long long v18 = [(NSCollectionLayoutSection *)self visibleItemsInvalidationHandler];
  BOOL v19 = [(NSCollectionLayoutSection *)self supplementariesFollowContentInsets];
  char v20 = [(NSCollectionLayoutSection *)self decorationItems];
  UICollectionLayoutSectionOrthogonalScrollingBehavior v21 = [(NSCollectionLayoutSection *)self orthogonalScrollingBehavior];
  BOOL v22 = [(NSCollectionLayoutSection *)self _isEmptySection];
  BYTE1(v29) = [(NSCollectionLayoutSection *)self prefersListSolver];
  LOBYTE(v29) = v22;
  LOBYTE(v28) = v19;
  uint64_t v23 = objc_msgSend(v31, "initWithGroup:contentInsets:contentInsetsReference:supplementaryItems:boundarySupplementaryItems:pinnedSupplementaryItemIndexes:interGroupSpacing:visibleItemsInvalidationHandler:supplementariesFollowInsets:decorationItems:orthogonalScrollingBehavior:isEmptySection:prefersListSolver:", v4, v30, v13, v14, v15, v18, v6, v8, v10, v12, v17, v28, v20, v21, v29);

  uint64_t v24 = [(UICollectionLayoutSectionOrthogonalScrollingProperties *)self->_orthogonalScrollingProperties copy];
  double v25 = *(void **)(v23 + 48);
  *(void *)(v23 + 48) = v24;

  *(double *)(v23 + 160) = self->__cornerRadius;
  *(unsigned char *)(v23 + 57) = self->__clipsContentToBounds;
  *(unsigned char *)(v23 + 58) = self->__excludesBoundarySupplementariesFromClipping;
  *(unsigned char *)(v23 + 59) = self->__clipsBackgroundDecorationsToContent;
  long long v26 = *(_OWORD *)&self->__clippingInsets.top;
  *(_OWORD *)(v23 + 248) = *(_OWORD *)&self->__clippingInsets.bottom;
  *(_OWORD *)(v23 + 232) = v26;
  *(double *)(v23 + 168) = self->__preBoundaryPadding;
  *(double *)(v23 + 176) = self->__postBoundaryPadding;
  *(void *)(v23 + 80) = self->_supplementaryContentInsetsReference;
  return (id)v23;
}

- (BOOL)_isEmptySection
{
  return self->_isEmptySection;
}

- (BOOL)prefersListSolver
{
  return self->_prefersListSolver;
}

- (NSIndexSet)pinnedSupplementaryItemIndexes
{
  return self->_pinnedSupplementaryItemIndexes;
}

- (NSCollectionLayoutSection)initWithLayoutGroup:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F088D0];
  id v5 = a3;
  double v6 = [v4 indexSet];
  LOWORD(v10) = 0;
  LOBYTE(v9) = 1;
  double v7 = -[NSCollectionLayoutSection initWithGroup:contentInsets:contentInsetsReference:supplementaryItems:boundarySupplementaryItems:pinnedSupplementaryItemIndexes:interGroupSpacing:visibleItemsInvalidationHandler:supplementariesFollowInsets:decorationItems:orthogonalScrollingBehavior:isEmptySection:prefersListSolver:](self, "initWithGroup:contentInsets:contentInsetsReference:supplementaryItems:boundarySupplementaryItems:pinnedSupplementaryItemIndexes:interGroupSpacing:visibleItemsInvalidationHandler:supplementariesFollowInsets:decorationItems:orthogonalScrollingBehavior:isEmptySection:prefersListSolver:", v5, 0, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], v6, 0, 0.0, 0.0, 0.0, 0.0, 0.0, v9, 0, 0, v10);

  return v7;
}

- (UICollectionLayoutSectionOrthogonalScrollingProperties)orthogonalScrollingProperties
{
  orthogonalScrollingProperties = self->_orthogonalScrollingProperties;
  if (!orthogonalScrollingProperties)
  {
    uint64_t v4 = objc_alloc_init(UICollectionLayoutSectionOrthogonalScrollingProperties);
    id v5 = self->_orthogonalScrollingProperties;
    self->_orthogonalScrollingProperties = v4;

    orthogonalScrollingProperties = self->_orthogonalScrollingProperties;
  }
  return orthogonalScrollingProperties;
}

- (double)_paddingToBoundarySupplementaries
{
  return 0.0;
}

- (void)setOrthogonalScrollingBehavior:(UICollectionLayoutSectionOrthogonalScrollingBehavior)orthogonalScrollingBehavior
{
  self->_orthogonalScrollingBehavior = orthogonalScrollingBehavior;
}

- (void)setBoundarySupplementaryItems:(NSArray *)boundarySupplementaryItems
{
  uint64_t v4 = (NSArray *)[(NSArray *)boundarySupplementaryItems copy];
  id v5 = self->_boundarySupplementaryItems;
  self->_boundarySupplementaryItems = v4;

  pinnedBoundarySupplementaryItemIndexes = self->_pinnedBoundarySupplementaryItemIndexes;
  self->_pinnedBoundarySupplementaryItemIndexes = 0;
}

- (void)setVisibleItemsInvalidationHandler:(NSCollectionLayoutSectionVisibleItemsInvalidationHandler)visibleItemsInvalidationHandler
{
}

- (void)_setExcludesBoundarySupplementariesFromClipping:(BOOL)a3
{
  self->__excludesBoundarySupplementariesFromClipping = a3;
}

- (void)_setCornerRadius:(double)a3
{
  self->__cornerRadius = a3;
}

- (void)_setClipsContentToBounds:(BOOL)a3
{
  self->__clipsContentToBounds = a3;
}

- (void)_setClipsBackgroundDecorationsToContent:(BOOL)a3
{
  self->__clipsBackgroundDecorationsToContent = a3;
}

- (void)setDecorationItems:(NSArray *)decorationItems
{
  uint64_t v4 = (objc_class *)MEMORY[0x263EFF8C0];
  id v5 = decorationItems;
  double v6 = (NSArray *)[[v4 alloc] initWithArray:v5 copyItems:1];

  double v7 = self->_decorationItems;
  self->_decorationItems = v6;

  self->_hasBackgroundDecorationItem = [(NSCollectionLayoutSection *)self _containsBackgroundDecorationItem:self->_decorationItems];
}

- (id)_preferredContainerBackgroundColor
{
  return 0;
}

- (void)setSupplementaryContentInsetsReference:(UIContentInsetsReference)supplementaryContentInsetsReference
{
  self->_supplementaryContentInsetsReference = supplementaryContentInsetsReference;
  [(NSCollectionLayoutSection *)self setSupplementariesFollowContentInsets:0];
}

- (id)_descriptionProperties
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  double v7 = [v4 stringWithFormat:@"group = <%@: %p>", v6, self->_group];
  [v3 addObject:v7];

  double top = self->_contentInsets.top;
  double leading = self->_contentInsets.leading;
  double bottom = self->_contentInsets.bottom;
  if (leading != 0.0 || top != 0.0 || self->_contentInsets.trailing != 0.0 || bottom != 0.0)
  {
    double v11 = NSString;
    double v12 = (__CFString *)CFStringCreateWithFormat(0, 0, @"{%.*g, %.*g, %.*g, %.*g}", 17, *(void *)&top, 17, *(void *)&leading, 17, *(void *)&bottom, 17, *(void *)&self->_contentInsets.trailing);
    id v13 = [v11 stringWithFormat:@"contentInsets = %@", v12];
    [v3 addObject:v13];
  }
  int64_t contentInsetsReference = self->_contentInsetsReference;
  if (contentInsetsReference)
  {
    double v15 = NSString;
    double v16 = _CVCContentInsetsReferenceDescription(contentInsetsReference);
    double v17 = [v15 stringWithFormat:@"contentInsetsReference = %@", v16];
    [v3 addObject:v17];
  }
  int64_t supplementaryContentInsetsReference = self->_supplementaryContentInsetsReference;
  if (supplementaryContentInsetsReference)
  {
    BOOL v19 = NSString;
    char v20 = _CVCContentInsetsReferenceDescription(supplementaryContentInsetsReference);
    UICollectionLayoutSectionOrthogonalScrollingBehavior v21 = [v19 stringWithFormat:@"supplementaryContentInsetsReference = %@", v20];
    [v3 addObject:v21];
  }
  else if (!self->_supplementariesFollowContentInsets)
  {
    [v3 addObject:@"supplementariesFollowContentInsets = NO"];
  }
  if (self->_interGroupSpacing != 0.0)
  {
    BOOL v22 = objc_msgSend(NSString, "stringWithFormat:", @"interGroupSpacing = %g", *(void *)&self->_interGroupSpacing);
    [v3 addObject:v22];
  }
  unint64_t orthogonalScrollingBehavior = self->_orthogonalScrollingBehavior;
  if (orthogonalScrollingBehavior)
  {
    uint64_t v24 = NSString;
    if (orthogonalScrollingBehavior >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown value: %ld)", self->_orthogonalScrollingBehavior);
      double v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v25 = off_2640B2D98[orthogonalScrollingBehavior - 1];
    }
    long long v26 = [v24 stringWithFormat:@"orthogonalScrollingBehavior = %@", v25];
    [v3 addObject:v26];

    if (self->_orthogonalScrollingProperties)
    {
      double v27 = [NSString stringWithFormat:@"orthogonalScrollingProperties = %@", self->_orthogonalScrollingProperties];
      [v3 addObject:v27];
    }
  }
  if ([(NSArray *)self->_boundarySupplementaryItems count])
  {
    uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"boundarySupplementaryItems = <%p>", self->_boundarySupplementaryItems);
    [v3 addObject:v28];
  }
  if ([(NSArray *)self->_decorationItems count])
  {
    uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"decorationItems = <%p>", self->_decorationItems);
    [v3 addObject:v29];
  }
  return v3;
}

- (id)description
{
  id v3 = [(NSCollectionLayoutSection *)self _descriptionProperties];
  uint64_t v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  double v7 = [v3 componentsJoinedByString:@"; "];
  double v8 = [v4 stringWithFormat:@"<%@: %p; %@>", v6, self, v7];

  return v8;
}

+ (id)_emptySection
{
  id v2 = objc_alloc((Class)a1);
  id v3 = objc_alloc_init(MEMORY[0x263F088D0]);
  LOWORD(v7) = 1;
  LOBYTE(v6) = 0;
  uint64_t v4 = objc_msgSend(v2, "initWithGroup:contentInsets:contentInsetsReference:supplementaryItems:boundarySupplementaryItems:pinnedSupplementaryItemIndexes:interGroupSpacing:visibleItemsInvalidationHandler:supplementariesFollowInsets:decorationItems:orthogonalScrollingBehavior:isEmptySection:prefersListSolver:", 0, 0, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], v3, 0, 0.0, 0.0, 0.0, 0.0, 0.0, v6, MEMORY[0x263EFFA68], 0, v7);

  return v4;
}

void __84__NSCollectionLayoutSection__checkForDuplicateSupplementaryItemKindsAndThrowIfFound__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "removeObjectAtIndex:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "indexOfObject:", v3));
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) indexOfObject:v3] != 0x7FFFFFFFFFFFFFFFLL) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (NSDictionary)supplementaryItemsDict
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (self->_isEmptySection)
  {
    id v2 = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  else
  {
    supplementaryItemsDict = self->_supplementaryItemsDict;
    if (!supplementaryItemsDict)
    {
      id v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v6 = [(NSCollectionLayoutSection *)self supplementaryItems];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v27 != v9) {
              objc_enumerationMutation(v6);
            }
            double v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            double v12 = [v11 elementKind];
            [(NSDictionary *)v5 setObject:v11 forKeyedSubscript:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v8);
      }

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v13 = [(NSCollectionLayoutSection *)self boundarySupplementaryItems];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v23;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v22 + 1) + 8 * j);
            BOOL v19 = [v18 elementKind];
            [(NSDictionary *)v5 setObject:v18 forKeyedSubscript:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v15);
      }

      char v20 = self->_supplementaryItemsDict;
      self->_supplementaryItemsDict = v5;

      supplementaryItemsDict = self->_supplementaryItemsDict;
    }
    id v2 = supplementaryItemsDict;
  }
  return v2;
}

- (id)_leadingSwipeActionsConfigurationForIndexPath:(id)a3
{
  return 0;
}

- (id)_trailingSwipeActionsConfigurationForIndexPath:(id)a3
{
  return 0;
}

- (BOOL)shouldRestrictOrthogonalAxisDuringInteractiveMovement
{
  return 0;
}

- (BOOL)_pinnedSupplementariesShouldOverlap
{
  return 0;
}

- (BOOL)_wantsBandSelectionVisuals
{
  return 1;
}

- (void)setGroup:(id)a3
{
}

- (void)setSupplementaryItems:(id)a3
{
}

- (void)setPinnedSupplementaryItemIndexes:(id)a3
{
}

- (NSDictionary)decorationItemssDict
{
  return self->_decorationItemssDict;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void)_setClippingInsets:(CVCDirectionalEdgeInsets)a3
{
  self->__clippingInsets = a3;
}

- (void)_setPreBoundaryPadding:(double)a3
{
  self->__preBoundaryPadding = a3;
}

- (void)_setPostBoundaryPadding:(double)a3
{
  self->__postBoundaryPadding = a3;
}

- (void)setPrefersListSolver:(BOOL)a3
{
  self->_BOOL prefersListSolver = a3;
}

@end