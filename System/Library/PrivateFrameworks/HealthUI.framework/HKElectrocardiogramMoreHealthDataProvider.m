@interface HKElectrocardiogramMoreHealthDataProvider
- (HKElectrocardiogramMoreHealthDataProvider)init;
- (NSMutableArray)dataSource;
- (UIEdgeInsets)_offscreenInsets;
- (id)_defaultCellWithBackgroundColor:(id)a3;
- (id)_itemViewForRow:(int64_t)a3;
- (id)_sentinelCell;
- (id)cellForRow:(int64_t)a3 tableView:(id)a4;
- (id)unitTesting_itemsForIdentifiers:(id)a3;
- (int64_t)count;
- (void)_configureLayoutForView:(id)a3 inCell:(id)a4;
- (void)addItem:(id)a3;
- (void)removeItemWithIdentifier:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation HKElectrocardiogramMoreHealthDataProvider

- (HKElectrocardiogramMoreHealthDataProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKElectrocardiogramMoreHealthDataProvider;
  v2 = [(HKElectrocardiogramMoreHealthDataProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    dataSource = v2->_dataSource;
    v2->_dataSource = (NSMutableArray *)v3;
  }
  return v2;
}

- (int64_t)count
{
  v2 = [(HKElectrocardiogramMoreHealthDataProvider *)self dataSource];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)addItem:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 identifier];
    [(HKElectrocardiogramMoreHealthDataProvider *)self removeItemWithIdentifier:v5];

    id v6 = [(HKElectrocardiogramMoreHealthDataProvider *)self dataSource];
    [v6 addObject:v4];
  }
}

- (void)removeItemWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HKElectrocardiogramMoreHealthDataProvider *)self dataSource];
  objc_msgSend(v5, "hk_itemForIdentifier:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    id v6 = [(HKElectrocardiogramMoreHealthDataProvider *)self dataSource];
    [v6 removeObject:v7];
  }
}

- (id)cellForRow:(int64_t)a3 tableView:(id)a4
{
  id v6 = a4;
  id v7 = [(HKElectrocardiogramMoreHealthDataProvider *)self dataSource];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    v9 = [(HKElectrocardiogramMoreHealthDataProvider *)self _sentinelCell];
  }
  else
  {
    v9 = [v6 dequeueReusableCellWithIdentifier:@"MoreHealthReuseIdentifier"];
    if (!v9)
    {
      v10 = [v6 backgroundColor];
      v9 = [(HKElectrocardiogramMoreHealthDataProvider *)self _defaultCellWithBackgroundColor:v10];

      v11 = [(HKElectrocardiogramMoreHealthDataProvider *)self _itemViewForRow:a3];
      v12 = [v9 contentView];
      [v12 addSubview:v11];

      [(HKElectrocardiogramMoreHealthDataProvider *)self _configureLayoutForView:v11 inCell:v9];
    }
  }

  return v9;
}

- (id)_itemViewForRow:(int64_t)a3
{
  id v4 = [(HKElectrocardiogramMoreHealthDataProvider *)self dataSource];
  v5 = [v4 objectAtIndexedSubscript:a3];
  id v6 = [v5 view];

  id v7 = [v6 layer];
  [v7 setCornerRadius:10.0];

  unint64_t v8 = [v6 layer];
  [v8 setMasksToBounds:1];

  return v6;
}

- (id)_defaultCellWithBackgroundColor:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1D08];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithStyle:0 reuseIdentifier:@"MoreHealthReuseIdentifier"];
  [v6 setBackgroundColor:v5];
  id v7 = [v6 contentView];
  [v7 setBackgroundColor:v5];

  [(HKElectrocardiogramMoreHealthDataProvider *)self _offscreenInsets];
  objc_msgSend(v6, "setSeparatorInset:");
  return v6;
}

- (void)_configureLayoutForView:(id)a3 inCell:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [v6 contentView];
  double v9 = 0.0;
  objc_msgSend(v7, "hk_alignHorizontalConstraintsWithView:margin:", v8, 0.0);

  v10 = [(HKElectrocardiogramMoreHealthDataProvider *)self dataSource];
  v11 = [v10 firstObject];
  id v12 = [v11 view];
  if (v12 != v7) {
    double v9 = 10.0;
  }

  id v13 = [v6 contentView];

  objc_msgSend(v7, "hk_alignVerticalConstraintsWithView:insets:", v13, v9, 0.0, 0.0, 0.0);
}

- (UIEdgeInsets)_offscreenInsets
{
  double v2 = 1.79769313e308;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (id)_sentinelCell
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1D08]);
  return v2;
}

- (id)unitTesting_itemsForIdentifiers:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  double v4 = (void *)MEMORY[0x1E4F1CA48];
  double v5 = [(HKElectrocardiogramMoreHealthDataProvider *)self dataSource];
  id v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = [(HKElectrocardiogramMoreHealthDataProvider *)self dataSource];
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = v21;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * j);
              v17 = [v10 identifier];
              LODWORD(v16) = [v17 isEqualToString:v16];

              if (v16) {
                [v6 addObject:v10];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v13);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  return v6;
}

- (NSMutableArray)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end