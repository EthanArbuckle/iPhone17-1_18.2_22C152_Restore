@interface StocksAssistantStockAdd
- (NSMutableArray)createdStocks;
- (id)addStocks;
- (id)validateCommandArguments;
- (void)performWithCompletion:(id)a3;
- (void)setCreatedStocks:(id)a3;
@end

@implementation StocksAssistantStockAdd

- (id)validateCommandArguments
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [(StocksAssistantStockAdd *)self stocks];
  id v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v34;
    uint64_t v30 = StockCompanyNameKey;
    uint64_t v31 = StockSymbolKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v9 = [v8 symbol];
        id v10 = [v9 length];

        if (!v10) {
          [v3 addObject:@"SAStockAdd.stocksToAdd.symbol Missing Stock symbol."];
        }
        v11 = [v8 name];
        id v12 = [v11 length];

        if (!v12) {
          [v3 addObject:@"SAStockAdd.stocksToAdd.companyName Missing Stock companyName."];
        }
        v13 = +[StockManager sharedManager];
        v14 = [v8 symbol];
        v15 = [v13 stockWithSymbol:v14];

        if (!v15)
        {
          v16 = [v8 symbol];
          v17 = [v8 name];
          v18 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v16, v31, v17, v30, 0);

          id v19 = [objc_alloc((Class)Stock) initWithDictionary:v18];
          if (v19)
          {
            v20 = [(StocksAssistantStockAdd *)self createdStocks];

            if (!v20)
            {
              v21 = +[NSMutableArray array];
              [(StocksAssistantStockAdd *)self setCreatedStocks:v21];
            }
            v22 = [(StocksAssistantStockAdd *)self createdStocks];
            [v22 addObject:v19];
          }
          else
          {
            v22 = [v8 name];
            v23 = [v8 symbol];
            v24 = +[NSString stringWithFormat:@"SAStockAdd.stocksToAdd.stockCreation Failed to create stock object for: %@ (%@)", v22, v23];
            [v3 addObject:v24];
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v5);
  }

  v25 = [(StocksAssistantStockAdd *)self createdStocks];
  id v26 = [v25 count];

  if (!v26) {
    [v3 addObject:@"SAStockAdd.stocksToAdd.noStocksAdded The list contained no stocks that were not already in the list."];
  }
  if ([v3 count])
  {
    v27 = [v3 componentsJoinedByString:@"\n\n"];
    v28 = +[SACommandFailed commandFailedWithReason:v27];
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)addStocks
{
  id v3 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(StocksAssistantStockAdd *)self createdStocks];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = +[StockManager sharedManager];
        [v10 addStock:v9];

        v11 = +[SAStockObject object];
        id v12 = [v9 companyName];
        [v11 setName:v12];

        v13 = [v9 symbol];
        [v11 setSymbol:v13];

        [v3 addObject:v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v14 = +[SAStockAddCompleted addCompleted];
  [v14 setStocks:v3];

  return v14;
}

- (void)performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(StocksAssistantStockAdd *)self validateCommandArguments];
  if (!v5)
  {
    id v5 = [(StocksAssistantStockAdd *)self addStocks];
  }
  id v7 = v5;
  id v6 = [v5 dictionary];
  v4[2](v4, v6);
}

- (NSMutableArray)createdStocks
{
  return self->_newStocks;
}

- (void)setCreatedStocks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end