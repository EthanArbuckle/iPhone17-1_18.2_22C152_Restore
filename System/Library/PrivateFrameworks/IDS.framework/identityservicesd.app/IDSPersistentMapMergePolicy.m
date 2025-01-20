@interface IDSPersistentMapMergePolicy
+ (id)ditchMemoryPolicy;
+ (id)prioritizeMemoryPolicy;
- (IDSPersistentMapMergePolicy)initWithPolicyBlock:(id)a3;
- (IDSPersistentMapMergePolicy)initWithStandardPolicy:(unint64_t)a3;
- (id)block;
- (id)processedDictionaryForDisk:(id)a3 andMemory:(id)a4;
- (unint64_t)policy;
- (void)setBlock:(id)a3;
- (void)setPolicy:(unint64_t)a3;
@end

@implementation IDSPersistentMapMergePolicy

+ (id)ditchMemoryPolicy
{
  id v2 = [objc_alloc((Class)a1) initWithStandardPolicy:0];

  return v2;
}

+ (id)prioritizeMemoryPolicy
{
  id v2 = [objc_alloc((Class)a1) initWithStandardPolicy:1];

  return v2;
}

- (IDSPersistentMapMergePolicy)initWithStandardPolicy:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IDSPersistentMapMergePolicy;
  result = [(IDSPersistentMapMergePolicy *)&v5 init];
  if (result) {
    result->_policy = a3;
  }
  return result;
}

- (IDSPersistentMapMergePolicy)initWithPolicyBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [(IDSPersistentMapMergePolicy *)self initWithStandardPolicy:2];
    if (v5)
    {
      id v6 = objc_retainBlock(v4);
      id block = v5->_block;
      v5->_id block = v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)processedDictionaryForDisk:(id)a3 andMemory:(id)a4
{
  id block = (void (**)(id, id, id))self->_block;
  if (block)
  {
    id v6 = block[2](block, a3, a4);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      id v6 = v7;
    }
    else
    {
      id v7 = [v6 mutableCopy];
    }
    v9 = v7;
  }
  else
  {
    id v6 = +[NSAssertionHandler currentHandler];
    v9 = 0;
  }

  return v9;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (unint64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(unint64_t)a3
{
  self->_policy = a3;
}

- (void).cxx_destruct
{
}

@end