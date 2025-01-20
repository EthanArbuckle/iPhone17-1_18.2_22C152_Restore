@interface BCSCoalesceObjectConfig
- (BCSCoalesceObjectConfig)initWithCompletionBlock:(id)a3 coalesceKey:(id)a4;
- (NSString)coalesceKey;
- (id)configCompletionBlock;
@end

@implementation BCSCoalesceObjectConfig

- (BCSCoalesceObjectConfig)initWithCompletionBlock:(id)a3 coalesceKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BCSCoalesceObjectConfig;
  v8 = [(BCSCoalesceObjectConfig *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id configCompletionBlock = v8->_configCompletionBlock;
    v8->_id configCompletionBlock = (id)v9;

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

- (id)configCompletionBlock
{
  return self->_configCompletionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configCompletionBlock, 0);

  objc_storeStrong((id *)&self->_coalesceKey, 0);
}

@end