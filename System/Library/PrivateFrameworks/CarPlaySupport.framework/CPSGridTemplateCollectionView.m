@interface CPSGridTemplateCollectionView
- (CPSGridTemplateCollectionView)initWithFrame:(CGRect)a3 gridButtons:(id)a4;
- (NSArray)gridButtons;
- (id)_linearFocusMovementSequences;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)setGridButtons:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSGridTemplateCollectionView

- (CPSGridTemplateCollectionView)initWithFrame:(CGRect)a3 gridButtons:(id)a4
{
  CGRect v28 = a3;
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v25 = (id)objc_opt_new();
  CGSizeMake_7();
  *(double *)&long long v24 = v4;
  *((double *)&v24 + 1) = v5;
  long long v23 = v24;
  objc_msgSend(v25, "setItemSize:", v4, v5);
  [v25 setMinimumInteritemSpacing:4.0];
  UIEdgeInsetsMake_1();
  *(double *)&long long v21 = v6;
  *((double *)&v21 + 1) = v7;
  *(double *)&long long v22 = v8;
  *((double *)&v22 + 1) = v9;
  long long v19 = v21;
  long long v20 = v22;
  objc_msgSend(v25, "setSectionInset:", v6, v7, v8, v9);
  v10 = v27;
  v27 = 0;
  v18.receiver = v10;
  v18.super_class = (Class)CPSGridTemplateCollectionView;
  v27 = -[CPSGridTemplateCollectionView initWithFrame:collectionViewLayout:](&v18, sel_initWithFrame_collectionViewLayout_, v25, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
  objc_storeStrong((id *)&v27, v27);
  if (v27)
  {
    v13 = v27;
    id v14 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
    -[CPSGridTemplateCollectionView setBackgroundColor:](v13, "setBackgroundColor:");

    v16 = v27;
    uint64_t v15 = objc_opt_class();
    id v17 = +[CPSGridTemplateCollectionCell reuseIdentifier];
    -[CPSGridTemplateCollectionView registerClass:forCellWithReuseIdentifier:](v16, "registerClass:forCellWithReuseIdentifier:", v15);

    [(CPSGridTemplateCollectionView *)v27 setGridButtons:location[0]];
    [(CPSGridTemplateCollectionView *)v27 setDelegate:v27];
    [(CPSGridTemplateCollectionView *)v27 setDataSource:v27];
    [(CPSGridTemplateCollectionView *)v27 setScrollEnabled:0];
    [(CPSGridTemplateCollectionView *)v27 setBounces:0];
  }
  v12 = v27;
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v27, 0);
  return v12;
}

- (void)setGridButtons:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = [(CPSGridTemplateCollectionView *)v18 gridButtons];
  BOOL v11 = [(NSArray *)v10 isEqualToArray:location[0]];

  if (!v11)
  {
    double v16 = 0.0;
    memset(__b, 0, sizeof(__b));
    id obj = location[0];
    uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
    if (v9)
    {
      uint64_t v5 = *(void *)__b[2];
      uint64_t v6 = 0;
      unint64_t v7 = v9;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(id *)(__b[1] + 8 * v6);
        [v15 preferredLabelWidth];
        double v13 = v3 + 4.0;
        if (v3 + 4.0 > v16) {
          double v16 = v13;
        }
        ++v6;
        if (v4 + 1 >= v7)
        {
          uint64_t v6 = 0;
          unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
          if (!v7) {
            break;
          }
        }
      }
    }

    id v12 = (id)[(CPSGridTemplateCollectionView *)v18 collectionViewLayout];
    [v12 setPreferredItemWidth:v16];
    objc_storeStrong((id *)&v18->_gridButtons, location[0]);
    [(CPSGridTemplateCollectionView *)v18 reloadData];
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)CPSGridTemplateCollectionView;
  [(CPSGridTemplateCollectionView *)&v4 traitCollectionDidChange:location[0]];
  id v3 = (id)[(CPSGridTemplateCollectionView *)v6 collectionViewLayout];
  [v3 invalidateLayout];
  objc_storeStrong(&v3, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v5 = [(CPSGridTemplateCollectionView *)v8 gridButtons];
  int64_t v6 = [(NSArray *)v5 count];

  objc_storeStrong(location, 0);
  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v6 = location[0];
  id v7 = +[CPSGridTemplateCollectionCell reuseIdentifier];
  id v11 = (id)objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");

  uint64_t v9 = [(CPSGridTemplateCollectionView *)v14 gridButtons];
  id v8 = -[NSArray objectAtIndex:](v9, "objectAtIndex:", [v12 row]);
  objc_msgSend(v11, "setButton:");

  id v10 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);

  return v10;
}

- (id)_linearFocusMovementSequences
{
  v8[1] = *MEMORY[0x263EF8340];
  id v7 = self;
  v6[1] = (id)a2;
  id v3 = objc_alloc(MEMORY[0x263F1CCA0]);
  objc_super v4 = [(CPSGridTemplateCollectionView *)v7 gridButtons];
  v6[0] = (id)objc_msgSend(v3, "initWithItems:loops:restrictEnteringSequence:");

  v8[0] = v6[0];
  id v5 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  objc_storeStrong(v6, 0);

  return v5;
}

- (NSArray)gridButtons
{
  return self->_gridButtons;
}

- (void).cxx_destruct
{
}

@end