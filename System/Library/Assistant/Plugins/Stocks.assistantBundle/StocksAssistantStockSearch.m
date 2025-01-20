@interface StocksAssistantStockSearch
- (void)performWithCompletion:(id)a3;
@end

@implementation StocksAssistantStockSearch

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = +[NSMutableArray array];
  v6 = [(StocksAssistantStockSearch *)self stockReferences];
  id v7 = [v6 count];

  if (v7)
  {
    long long v41 = 0uLL;
    long long v42 = 0uLL;
    long long v39 = 0uLL;
    long long v40 = 0uLL;
    v8 = +[StockManager sharedManager];
    v9 = [v8 stocksList];

    id obj = v9;
    id v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v10)
    {
      id v11 = v10;
      v32 = v4;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v15 = [(StocksAssistantStockSearch *)self stockReferences];
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_3058;
          v38[3] = &unk_4130;
          v38[4] = v14;
          v16 = [v15 indexesOfObjectsPassingTest:v38];

          if ([v16 count])
          {
            v17 = +[SAStockReference reference];
            v18 = [v14 companyName];
            [v17 setCompanyName:v18];

            v19 = [v14 symbol];
            [v17 setSymbol:v19];

            [v5 addObject:v17];
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v11);
      v4 = v32;
    }
  }
  else
  {
    long long v36 = 0uLL;
    long long v37 = 0uLL;
    long long v34 = 0uLL;
    long long v35 = 0uLL;
    v20 = +[StockManager sharedManager];
    v21 = [v20 stocksList];

    id obj = v21;
    id v22 = [v21 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v35;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v35 != v24) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
          v27 = +[SAStockReference reference];
          v28 = [v26 companyName];
          [v27 setCompanyName:v28];

          v29 = [v26 symbol];
          [v27 setSymbol:v29];

          [v5 addObject:v27];
        }
        id v23 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v23);
    }
  }

  v30 = +[SAStockSearchCompleted searchCompleted];
  [v30 setStockReferences:v5];
  v31 = [v30 dictionary];
  v4[2](v4, v31);
}

@end