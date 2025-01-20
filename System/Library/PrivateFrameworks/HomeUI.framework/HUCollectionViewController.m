@interface HUCollectionViewController
- (HUCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (NSMapTable)installedChildViewControllersKeyedByCell;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)didUpdateRequiredHeightForCell:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setInstalledChildViewControllersKeyedByCell:(id)a3;
- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3;
@end

@implementation HUCollectionViewController

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    v8 = [v7 viewController];
    if (v8)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v9 = [(HUCollectionViewController *)self installedChildViewControllersKeyedByCell];
      v10 = (void *)[v9 copy];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        v22 = v7;
        id v23 = v6;
        char v13 = 0;
        uint64_t v14 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v10);
            }
            v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v17 = [(HUCollectionViewController *)self installedChildViewControllersKeyedByCell];
            v18 = [v17 objectForKey:v16];

            if (v18 == v8)
            {
              v19 = [(HUCollectionViewController *)self installedChildViewControllersKeyedByCell];
              [v19 removeObjectForKey:v16];

              [v16 setViewController:0];
              char v13 = 1;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v12);

        id v7 = v22;
        id v6 = v23;
        if (v13)
        {
          [v22 addToParentViewController:self];
          v20 = [(HUCollectionViewController *)self installedChildViewControllersKeyedByCell];
          [v20 setObject:v8 forKey:v22];

          goto LABEL_16;
        }
      }
      else
      {
      }
      [v8 beginAppearanceTransition:1 animated:0];
      [v7 addToParentViewController:self];
      v21 = [(HUCollectionViewController *)self installedChildViewControllersKeyedByCell];
      [v21 setObject:v8 forKey:v7];

      [v8 endAppearanceTransition];
      objc_msgSend(v8, "setEditing:animated:", -[HUCollectionViewController isEditing](self, "isEditing"), 0);
    }
LABEL_16:
  }
}

- (HUCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUCollectionViewController;
  v3 = [(HUCollectionViewController *)&v7 initWithCollectionViewLayout:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    installedChildViewControllersKeyedByCell = v3->_installedChildViewControllersKeyedByCell;
    v3->_installedChildViewControllersKeyedByCell = (NSMapTable *)v4;
  }
  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)HUCollectionViewController;
  -[HUCollectionViewController setEditing:animated:](&v17, sel_setEditing_animated_);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v7 = [(HUCollectionViewController *)self installedChildViewControllersKeyedByCell];
  v8 = [v7 objectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setEditing:v5 animated:v4];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HUCollectionViewController;
  [(HUCollectionViewController *)&v23 systemLayoutFittingSizeDidChangeForChildContentContainer:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v5 = [(HUCollectionViewController *)self installedChildViewControllersKeyedByCell];
  id v6 = [v5 keyEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [v11 viewController];
        if (v12 == v4)
        {
          if ([v11 allowSelfSizing])
          {
            long long v13 = [(HUCollectionViewController *)self collectionView];
            long long v14 = [v13 indexPathForCell:v11];

            long long v15 = [(HUCollectionViewController *)self collectionViewLayout];
            id v16 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);

            long long v24 = v14;
            objc_super v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
            [v16 invalidateItemsAtIndexPaths:v17];

            v18 = [(HUCollectionViewController *)self collectionViewLayout];
            [v18 invalidateLayoutWithContext:v16];
          }
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v14 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = v14;
  if (isKindOfClass)
  {
    id v8 = v14;
    uint64_t v9 = [v8 viewController];
    uint64_t v10 = [v9 parentViewController];
    if (v10 == self)
    {
      uint64_t v11 = [(HUCollectionViewController *)self installedChildViewControllersKeyedByCell];
      id v12 = [v11 objectForKey:v8];

      if (v12 == v9)
      {
        [v9 beginAppearanceTransition:0 animated:0];
        [v8 removeFromParentViewController];
        long long v13 = [(HUCollectionViewController *)self installedChildViewControllersKeyedByCell];
        [v13 removeObjectForKey:v8];

        [v9 endAppearanceTransition];
      }
    }
    else
    {
    }
    uint64_t v7 = v14;
  }
}

- (void)didUpdateRequiredHeightForCell:(id)a3
{
  id v4 = [(HUCollectionViewController *)self collectionView];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__HUCollectionViewController_didUpdateRequiredHeightForCell___block_invoke;
  v5[3] = &unk_1E6386018;
  v5[4] = self;
  [v4 performBatchUpdates:v5 completion:0];
}

void __61__HUCollectionViewController_didUpdateRequiredHeightForCell___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionViewLayout];
  [v1 invalidateLayout];
}

- (NSMapTable)installedChildViewControllersKeyedByCell
{
  return self->_installedChildViewControllersKeyedByCell;
}

- (void)setInstalledChildViewControllersKeyedByCell:(id)a3
{
}

- (void).cxx_destruct
{
}

@end