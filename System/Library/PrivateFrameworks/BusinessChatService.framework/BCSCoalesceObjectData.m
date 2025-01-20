@interface BCSCoalesceObjectData
- (BCSCoalesceObjectData)initWithCompletionBlock:(id)a3 coalesceKey:(id)a4;
- (NSString)coalesceKey;
- (id)dataCompletionBlock;
@end

@implementation BCSCoalesceObjectData

- (BCSCoalesceObjectData)initWithCompletionBlock:(id)a3 coalesceKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BCSCoalesceObjectData;
  v8 = [(BCSCoalesceObjectData *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id dataCompletionBlock = v8->_dataCompletionBlock;
    v8->_id dataCompletionBlock = (id)v9;

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

- (id)dataCompletionBlock
{
  return self->_dataCompletionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataCompletionBlock, 0);

  objc_storeStrong((id *)&self->_coalesceKey, 0);
}

@end