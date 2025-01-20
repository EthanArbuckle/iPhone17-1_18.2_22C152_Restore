@interface _HKQuantityTypeDataSourceMapping
- (HKQuantityTypeDataSource)weakQuantityTypeDataSource;
- (_HKQuantityTypeDataSourceMapping)initWithQuantityTypeDataSource:(id)a3;
- (id)map:(id)a3;
@end

@implementation _HKQuantityTypeDataSourceMapping

- (_HKQuantityTypeDataSourceMapping)initWithQuantityTypeDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_HKQuantityTypeDataSourceMapping;
  v5 = [(_HKQuantityTypeDataSourceMapping *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_weakQuantityTypeDataSource, v4);
  }

  return v6;
}

- (id)map:(id)a3
{
  id v5 = a3;
  v6 = [(_HKQuantityTypeDataSourceMapping *)self weakQuantityTypeDataSource];
  if (v6)
  {
    v7 = [v5 chartPoints];

    if (v7)
    {
      objc_super v8 = [v6 displayType];
      v9 = [v6 unitController];
      v10 = [v9 unitForChartingDisplayType:v8];

      v11 = [MEMORY[0x1E4F1CA48] array];
      v12 = [v5 chartPoints];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __40___HKQuantityTypeDataSourceMapping_map___block_invoke;
      v20 = &unk_1E6D54950;
      SEL v26 = a2;
      v21 = self;
      id v22 = v6;
      id v23 = v10;
      id v24 = v8;
      id v25 = v11;
      id v13 = v11;
      id v14 = v8;
      id v15 = v10;
      [v12 enumerateObjectsUsingBlock:&v17];

      v7 = objc_alloc_init(HKGraphSeriesDataBlock);
      -[HKGraphSeriesDataBlock setChartPoints:](v7, "setChartPoints:", v13, v17, v18, v19, v20, v21);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HKQuantityTypeDataSource)weakQuantityTypeDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakQuantityTypeDataSource);
  return (HKQuantityTypeDataSource *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end