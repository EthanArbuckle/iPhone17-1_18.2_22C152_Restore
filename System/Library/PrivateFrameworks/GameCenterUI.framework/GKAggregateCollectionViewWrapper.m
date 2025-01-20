@interface GKAggregateCollectionViewWrapper
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (id)wrapperForView:(id)a3 mapping:(id)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (GKAggregateCollectionViewWrapper)initWithView:(id)a3 mapping:(id)a4;
- (GKAggregateMapping)mapping;
- (UICollectionView)wrappedView;
- (id)_gkDequeueCellForClass:(Class)a3 forIndexPath:(id)a4;
- (id)_gkDequeueSupplementaryViewForClass:(Class)a3 ofKind:(id)a4 forIndexPath:(id)a5;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4;
- (id)dequeueReusableSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4 forIndexPath:(id)a5;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)indexPathForCell:(id)a3;
- (id)indexPathForItemAtPoint:(CGPoint)a3;
- (id)indexPathsForSelectedItems;
- (id)indexPathsForVisibleItems;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (void)_gkPerformWithoutViewReuse:(id)a3;
- (void)_gkRegisterCellClass:(Class)a3;
- (void)_gkRegisterClass:(Class)a3 forSupplementaryViewOfKind:(id)a4;
- (void)deleteItemsAtIndexPaths:(id)a3;
- (void)deleteSections:(id)a3;
- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)insertItemsAtIndexPaths:(id)a3;
- (void)insertSections:(id)a3;
- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4;
- (void)reloadItemsAtIndexPaths:(id)a3;
- (void)reloadSections:(id)a3;
- (void)scrollToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5;
- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
- (void)setMapping:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setWrappedView:(id)a3;
@end

@implementation GKAggregateCollectionViewWrapper

+ (id)wrapperForView:(id)a3 mapping:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[GKAggregateCollectionViewWrapper alloc] initWithView:v6 mapping:v5];

  return v7;
}

- (GKAggregateCollectionViewWrapper)initWithView:(id)a3 mapping:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GKAggregateCollectionViewWrapper;
  v9 = [(GKAggregateCollectionViewWrapper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_wrappedView, a3);
    objc_storeStrong((id *)&v10->_mapping, a4);
  }

  return v10;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_wrappedView;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKAggregateCollectionViewWrapper;
  v4 = objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  id v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKAggregateCollectionViewWrapper;
  id v5 = -[GKAggregateCollectionViewWrapper methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [(GKAggregateCollectionViewWrapper *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKAggregateCollectionViewWrapper;
  if (-[GKAggregateCollectionViewWrapper respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKAggregateCollectionViewWrapper *)self forwardingTargetForSelector:a3];
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (!a3) {
    return 0;
  }
  if (class_respondsToSelector((Class)a1, a3)) {
    return 1;
  }
  char v5 = (void *)MEMORY[0x1E4FB1568];

  return [v5 instancesRespondToSelector:a3];
}

- (id)valueForUndefinedKey:(id)a3
{
  return (id)[(UICollectionView *)self->_wrappedView valueForKey:a3];
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4
{
  wrappedView = self->_wrappedView;
  mapping = self->_mapping;
  id v7 = a3;
  objc_super v8 = [(GKAggregateMapping *)mapping globalIndexPathForLocalIndexPath:a4];
  objc_super v9 = [(UICollectionView *)wrappedView dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v8];

  return v9;
}

- (id)dequeueReusableSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4 forIndexPath:(id)a5
{
  wrappedView = self->_wrappedView;
  mapping = self->_mapping;
  id v9 = a4;
  id v10 = a3;
  v11 = [(GKAggregateMapping *)mapping globalIndexPathForLocalIndexPath:a5];
  objc_super v12 = [(UICollectionView *)wrappedView dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:v9 forIndexPath:v11];

  return v12;
}

- (id)indexPathsForSelectedItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(UICollectionView *)self->_wrappedView indexPathsForSelectedItems];
  if ([v3 count])
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = -[GKAggregateMapping localIndexPathForGlobalIndexPath:](self->_mapping, "localIndexPathForGlobalIndexPath:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  BOOL v6 = a4;
  wrappedView = self->_wrappedView;
  id v8 = [(GKAggregateMapping *)self->_mapping globalIndexPathForLocalIndexPath:a3];
  [(UICollectionView *)wrappedView selectItemAtIndexPath:v8 animated:v6 scrollPosition:a5];
}

- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  wrappedView = self->_wrappedView;
  id v6 = [(GKAggregateMapping *)self->_mapping globalIndexPathForLocalIndexPath:a3];
  [(UICollectionView *)wrappedView deselectItemAtIndexPath:v6 animated:v4];
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  unint64_t v4 = [(GKAggregateMapping *)self->_mapping globalSectionForLocalSection:a3];
  wrappedView = self->_wrappedView;

  return [(UICollectionView *)wrappedView numberOfItemsInSection:v4];
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  wrappedView = self->_wrappedView;
  unint64_t v4 = [(GKAggregateMapping *)self->_mapping globalIndexPathForLocalIndexPath:a3];
  id v5 = [(UICollectionView *)wrappedView layoutAttributesForItemAtIndexPath:v4];

  return v5;
}

- (id)layoutAttributesForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  wrappedView = self->_wrappedView;
  mapping = self->_mapping;
  id v7 = a3;
  id v8 = [(GKAggregateMapping *)mapping globalIndexPathForLocalIndexPath:a4];
  id v9 = [(UICollectionView *)wrappedView layoutAttributesForSupplementaryElementOfKind:v7 atIndexPath:v8];

  return v9;
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  unint64_t v4 = -[UICollectionView indexPathForItemAtPoint:](self->_wrappedView, "indexPathForItemAtPoint:", a3.x, a3.y);
  id v5 = [(GKAggregateMapping *)self->_mapping localIndexPathForGlobalIndexPath:v4];

  return v5;
}

- (id)indexPathForCell:(id)a3
{
  unint64_t v4 = [(UICollectionView *)self->_wrappedView indexPathForCell:a3];
  id v5 = [(GKAggregateMapping *)self->_mapping localIndexPathForGlobalIndexPath:v4];

  return v5;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  wrappedView = self->_wrappedView;
  unint64_t v4 = [(GKAggregateMapping *)self->_mapping globalIndexPathForLocalIndexPath:a3];
  id v5 = [(UICollectionView *)wrappedView cellForItemAtIndexPath:v4];

  return v5;
}

- (id)indexPathsForVisibleItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(UICollectionView *)self->_wrappedView indexPathsForVisibleItems];
  if ([v3 count])
  {
    unint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = -[GKAggregateMapping localIndexPathForGlobalIndexPath:](self->_mapping, "localIndexPathForGlobalIndexPath:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)scrollToItemAtIndexPath:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  wrappedView = self->_wrappedView;
  id v8 = [(GKAggregateMapping *)self->_mapping globalIndexPathForLocalIndexPath:a3];
  [(UICollectionView *)wrappedView scrollToItemAtIndexPath:v8 atScrollPosition:a4 animated:v5];
}

- (void)insertSections:(id)a3
{
  unint64_t v4 = (objc_class *)MEMORY[0x1E4F28E60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __51__GKAggregateCollectionViewWrapper_insertSections___block_invoke;
  v11 = &unk_1E5F63468;
  long long v12 = self;
  id v13 = v6;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:&v8];
  -[UICollectionView insertSections:](self->_wrappedView, "insertSections:", v5, v8, v9, v10, v11, v12);
}

uint64_t __51__GKAggregateCollectionViewWrapper_insertSections___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) globalSectionForLocalSection:a2];
  unint64_t v4 = *(void **)(a1 + 40);

  return [v4 addIndex:v3];
}

- (void)deleteSections:(id)a3
{
  unint64_t v4 = (objc_class *)MEMORY[0x1E4F28E60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __51__GKAggregateCollectionViewWrapper_deleteSections___block_invoke;
  v11 = &unk_1E5F63468;
  long long v12 = self;
  id v13 = v6;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:&v8];
  -[UICollectionView deleteSections:](self->_wrappedView, "deleteSections:", v5, v8, v9, v10, v11, v12);
}

uint64_t __51__GKAggregateCollectionViewWrapper_deleteSections___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) globalSectionForLocalSection:a2];
  unint64_t v4 = *(void **)(a1 + 40);

  return [v4 addIndex:v3];
}

- (void)reloadSections:(id)a3
{
  unint64_t v4 = (objc_class *)MEMORY[0x1E4F28E60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __51__GKAggregateCollectionViewWrapper_reloadSections___block_invoke;
  v11 = &unk_1E5F63468;
  long long v12 = self;
  id v13 = v6;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:&v8];
  -[UICollectionView reloadSections:](self->_wrappedView, "reloadSections:", v5, v8, v9, v10, v11, v12);
}

uint64_t __51__GKAggregateCollectionViewWrapper_reloadSections___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) globalSectionForLocalSection:a2];
  unint64_t v4 = *(void **)(a1 + 40);

  return [v4 addIndex:v3];
}

- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4
{
  unint64_t v6 = [(GKAggregateMapping *)self->_mapping globalSectionForLocalSection:a3];
  unint64_t v7 = [(GKAggregateMapping *)self->_mapping globalSectionForLocalSection:a4];
  wrappedView = self->_wrappedView;

  [(UICollectionView *)wrappedView moveSection:v6 toSection:v7];
}

- (void)insertItemsAtIndexPaths:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[GKAggregateMapping globalIndexPathForLocalIndexPath:](self->_mapping, "globalIndexPathForLocalIndexPath:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(UICollectionView *)self->_wrappedView insertItemsAtIndexPaths:v5];
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[GKAggregateMapping globalIndexPathForLocalIndexPath:](self->_mapping, "globalIndexPathForLocalIndexPath:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(UICollectionView *)self->_wrappedView deleteItemsAtIndexPaths:v5];
}

- (void)reloadItemsAtIndexPaths:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[GKAggregateMapping globalIndexPathForLocalIndexPath:](self->_mapping, "globalIndexPathForLocalIndexPath:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(UICollectionView *)self->_wrappedView reloadItemsAtIndexPaths:v5];
}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  wrappedView = self->_wrappedView;
  mapping = self->_mapping;
  id v8 = a4;
  id v10 = [(GKAggregateMapping *)mapping globalIndexPathForLocalIndexPath:a3];
  uint64_t v9 = [(GKAggregateMapping *)self->_mapping globalIndexPathForLocalIndexPath:v8];

  [(UICollectionView *)wrappedView moveItemAtIndexPath:v10 toIndexPath:v9];
}

- (void)_gkRegisterCellClass:(Class)a3
{
  wrappedView = self->_wrappedView;
  -[UICollectionView _gkReuseIdentifierForClass:](wrappedView, "_gkReuseIdentifierForClass:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(UICollectionView *)wrappedView registerClass:a3 forCellWithReuseIdentifier:v5];
}

- (id)_gkDequeueCellForClass:(Class)a3 forIndexPath:(id)a4
{
  id v6 = [(GKAggregateMapping *)self->_mapping globalIndexPathForLocalIndexPath:a4];
  wrappedView = self->_wrappedView;
  id v8 = [(UICollectionView *)wrappedView _gkReuseIdentifierForClass:a3];
  uint64_t v9 = [(UICollectionView *)wrappedView dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  return v9;
}

- (void)_gkPerformWithoutViewReuse:(id)a3
{
}

- (void)_gkRegisterClass:(Class)a3 forSupplementaryViewOfKind:(id)a4
{
  wrappedView = self->_wrappedView;
  id v6 = a4;
  id v7 = [(UICollectionView *)wrappedView _gkReuseIdentifierForClass:a3];
  [(UICollectionView *)wrappedView registerClass:a3 forSupplementaryViewOfKind:v6 withReuseIdentifier:v7];
}

- (id)_gkDequeueSupplementaryViewForClass:(Class)a3 ofKind:(id)a4 forIndexPath:(id)a5
{
  mapping = self->_mapping;
  id v9 = a4;
  id v10 = [(GKAggregateMapping *)mapping globalIndexPathForLocalIndexPath:a5];
  v11 = [(UICollectionView *)self->_wrappedView _gkDequeueSupplementaryViewForClass:a3 ofKind:v9 forIndexPath:v10];

  return v11;
}

- (UICollectionView)wrappedView
{
  return self->_wrappedView;
}

- (void)setWrappedView:(id)a3
{
}

- (GKAggregateMapping)mapping
{
  return self->_mapping;
}

- (void)setMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapping, 0);

  objc_storeStrong((id *)&self->_wrappedView, 0);
}

@end