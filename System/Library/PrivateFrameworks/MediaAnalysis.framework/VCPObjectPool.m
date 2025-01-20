@interface VCPObjectPool
+ (VCPObjectPool)objectPoolWithAllocator:(id)a3;
- (VCPObjectPool)initWithAllocator:(id)a3;
- (id)getObject;
- (void)returnObject:(id)a3;
@end

@implementation VCPObjectPool

- (VCPObjectPool)initWithAllocator:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VCPObjectPool;
  v5 = [(VCPObjectPool *)&v11 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id allocator = v5->_allocator;
    v5->_id allocator = v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    objects = v5->_objects;
    v5->_objects = (NSMutableArray *)v8;
  }
  return v5;
}

+ (VCPObjectPool)objectPoolWithAllocator:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAllocator:v3];

  return (VCPObjectPool *)v4;
}

- (id)getObject
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(NSMutableArray *)v2->_objects count])
  {
    id v3 = [VCPLoaned alloc];
    id v4 = [(NSMutableArray *)v2->_objects objectAtIndexedSubscript:0];
    v5 = [(VCPLoaned *)v3 initWithObject:v4 fromPool:v2];

    [(NSMutableArray *)v2->_objects removeObjectAtIndex:0];
  }
  else
  {
    v6 = (*((void (**)(void))v2->_allocator + 2))();
    if (v6)
    {
      v5 = [[VCPLoaned alloc] initWithObject:v6 fromPool:v2];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v7 = VCPLogInstance();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "VCPObjectPool failed to allocate object", v9, 2u);
        }
      }
      v5 = 0;
    }
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)returnObject:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  [(NSMutableArray *)obj->_objects addObject:v4];

  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong(&self->_allocator, 0);
}

@end