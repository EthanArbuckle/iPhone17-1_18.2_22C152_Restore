@interface JTCollectionView
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (BOOL)inLayout;
- (CGSize)lastCollectionViewSize;
- (id)firstVisibleIndexPath;
- (id)sortedIndexPathsForVisibleItems;
- (id)visibleSections;
- (int64_t)selectedItem;
- (void)layoutIfNeeded;
- (void)layoutSubviews;
- (void)setInLayout:(BOOL)a3;
- (void)setLastCollectionViewSize:(CGSize)a3;
@end

@implementation JTCollectionView

- (void)layoutSubviews
{
  [(JTCollectionView *)self setInLayout:1];
  [(JTCollectionView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(JTCollectionView *)self lastCollectionViewSize];
  if (v4 != v8 || v6 != v7)
  {
    v10 = [(JTCollectionView *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [(JTCollectionView *)self delegate];
      objc_msgSend(v12, "collectionView:didResize:", self, v4, v6);
    }
    -[JTCollectionView setLastCollectionViewSize:](self, "setLastCollectionViewSize:", v4, v6);
  }
  v13.receiver = self;
  v13.super_class = (Class)JTCollectionView;
  [(JTCollectionView *)&v13 layoutSubviews];
  [(JTCollectionView *)self setInLayout:0];
}

- (int64_t)selectedItem
{
  v2 = [(JTCollectionView *)self indexPathsForSelectedItems];
  double v3 = [v2 firstObject];
  double v4 = v3;
  if (v3) {
    int64_t v5 = [v3 item];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)sortedIndexPathsForVisibleItems
{
  v2 = [(JTCollectionView *)self indexPathsForVisibleItems];
  double v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_36];

  return v3;
}

uint64_t __51__JTCollectionView_sortedIndexPathsForVisibleItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 section];
  if (v6 >= [v5 section])
  {
    uint64_t v8 = [v4 section];
    if (v8 > [v5 section])
    {
      uint64_t v7 = 1;
      goto LABEL_9;
    }
    uint64_t v9 = [v4 section];
    if (v9 != [v5 section])
    {
      uint64_t v7 = 0;
      goto LABEL_9;
    }
    uint64_t v10 = [v4 item];
    if (v10 >= [v5 item])
    {
      uint64_t v11 = [v4 item];
      uint64_t v7 = v11 > [v5 item];
      goto LABEL_9;
    }
  }
  uint64_t v7 = -1;
LABEL_9:

  return v7;
}

- (id)firstVisibleIndexPath
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  double v3 = [(JTCollectionView *)self superview];

  if (v3)
  {
    [(JTCollectionView *)self sortedIndexPathsForVisibleItems];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v10 = -[JTCollectionView layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v9, (void)v25);
          [v10 frame];
          double v12 = v11;
          double v14 = v13;
          double v16 = v15;
          double v18 = v17;
          v19 = [(JTCollectionView *)self superview];
          -[JTCollectionView convertRect:toView:](self, "convertRect:toView:", v19, v12, v14, v16, v18);
          double v21 = v20;

          if (v21 >= 0.0)
          {
            id v22 = v9;

            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    id v22 = 0;
LABEL_12:

    id v23 = v22;
  }
  else
  {
    id v23 = 0;
  }
  return v23;
}

- (id)visibleSections
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [(JTCollectionView *)self indexPathsForVisibleItems];
  double v3 = [MEMORY[0x263F089C8] indexSet];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addIndex:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "section", (void)v10));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

- (void)layoutIfNeeded
{
  if (![(JTCollectionView *)self inLayout])
  {
    v3.receiver = self;
    v3.super_class = (Class)JTCollectionView;
    [(JTCollectionView *)&v3 layoutIfNeeded];
  }
}

- (CGSize)lastCollectionViewSize
{
  double width = self->_lastCollectionViewSize.width;
  double height = self->_lastCollectionViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastCollectionViewSize:(CGSize)a3
{
  self->_lastCollectionViewSize = a3;
}

- (BOOL)inLayout
{
  return self->_inLayout;
}

- (void)setInLayout:(BOOL)a3
{
  self->_inLayout = a3;
}

@end