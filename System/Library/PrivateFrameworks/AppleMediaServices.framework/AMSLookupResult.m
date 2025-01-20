@interface AMSLookupResult
- (AMSLookupResult)initWithResult:(id)a3 dictionary:(id)a4;
- (NSArray)allItems;
- (NSDate)expirationDate;
- (id)appStoreURLWithReason:(int64_t)a3 initialIndex:(int64_t)a4;
- (id)itemForKey:(id)a3;
- (id)valueForProperty:(id)a3;
- (void)_enumerateItemsWithBlock:(id)a3;
- (void)setExpirationDate:(id)a3;
@end

@implementation AMSLookupResult

- (AMSLookupResult)initWithResult:(id)a3 dictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12.receiver = self;
    v12.super_class = (Class)AMSLookupResult;
    v8 = [(AMSURLResult *)&v12 initWithResult:v6];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_response, a4);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)allItems
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__AMSLookupResult_allItems__block_invoke;
  v6[3] = &unk_1E55A3710;
  id v4 = v3;
  id v7 = v4;
  [(AMSLookupResult *)self _enumerateItemsWithBlock:v6];

  return (NSArray *)v4;
}

uint64_t __27__AMSLookupResult_allItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)appStoreURLWithReason:(int64_t)a3 initialIndex:(int64_t)a4
{
  id v4 = [(AMSLookupResult *)self allItems];
  v5 = [v4 firstObject];

  id v6 = [v5 productPageURL];

  return v6;
}

- (id)itemForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_response objectForKey:@"results"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 objectForKey:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = [[AMSLookupItem alloc] initWithLookupDictionary:v6];
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)valueForProperty:(id)a3
{
  return [(NSDictionary *)self->_response objectForKey:a3];
}

- (void)_enumerateItemsWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_response objectForKey:@"results"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__AMSLookupResult__enumerateItemsWithBlock___block_invoke;
    v6[3] = &unk_1E55A3740;
    id v7 = v4;
    v8 = v9;
    [v5 enumerateKeysAndObjectsUsingBlock:v6];

    _Block_object_dispose(v9, 8);
  }
}

void __44__AMSLookupResult__enumerateItemsWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = [[AMSLookupItem alloc] initWithLookupDictionary:v4];

  v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    v5 = v6;
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end