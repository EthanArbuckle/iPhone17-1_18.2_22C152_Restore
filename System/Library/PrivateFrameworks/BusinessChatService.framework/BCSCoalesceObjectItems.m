@interface BCSCoalesceObjectItems
- (BCSCoalesceObjectItems)initWithCompletionBlock:(id)a3 coalesceKey:(id)a4;
- (NSString)coalesceKey;
- (id)itemsCompletionBlock;
@end

@implementation BCSCoalesceObjectItems

- (BCSCoalesceObjectItems)initWithCompletionBlock:(id)a3 coalesceKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BCSCoalesceObjectItems;
  v8 = [(BCSCoalesceObjectItems *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id itemsCompletionBlock = v8->_itemsCompletionBlock;
    v8->_id itemsCompletionBlock = (id)v9;

    uint64_t v11 = [v7 copy];
    coalesceKey = v8->_coalesceKey;
    v8->_coalesceKey = (NSString *)v11;
  }
  return v8;
}

- (NSString)coalesceKey
{
  return self->_coalesceKey;
}

- (id)itemsCompletionBlock
{
  return self->_itemsCompletionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemsCompletionBlock, 0);

  objc_storeStrong((id *)&self->_coalesceKey, 0);
}

@end