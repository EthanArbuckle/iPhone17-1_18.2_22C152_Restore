@interface BCSCoalesceObjectMegashard
- (BCSCoalesceObjectMegashard)initWithCompletionBlock:(id)a3 coalesceKey:(id)a4;
- (NSString)coalesceKey;
- (id)megashardCompletionBlock;
@end

@implementation BCSCoalesceObjectMegashard

- (BCSCoalesceObjectMegashard)initWithCompletionBlock:(id)a3 coalesceKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BCSCoalesceObjectMegashard;
  v8 = [(BCSCoalesceObjectMegashard *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id megashardCompletionBlock = v8->_megashardCompletionBlock;
    v8->_id megashardCompletionBlock = (id)v9;

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

- (id)megashardCompletionBlock
{
  return self->_megashardCompletionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_megashardCompletionBlock, 0);

  objc_storeStrong((id *)&self->_coalesceKey, 0);
}

@end