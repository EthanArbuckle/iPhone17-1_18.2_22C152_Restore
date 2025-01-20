@interface PHRecyclableObjectVendor
- (PHRecyclableObjectVendor)initWithTargetClass:(Class)a3 requiresThreadSafety:(BOOL)a4 initialPoolSize:(int64_t)a5;
- (PHRecyclableObjectVendor)initWithTargetClass:(Class)a3 requiresThreadSafety:(BOOL)a4 initialPoolSize:(int64_t)a5 prototypeStep:(id)a6;
- (id)dequeueRecyclableObject;
- (void)recycleObject:(id)a3;
@end

@implementation PHRecyclableObjectVendor

- (id)dequeueRecyclableObject
{
  if (self->_threadSafe) {
    os_unfair_lock_lock(&self->_lock);
  }
  if ([(NSMutableArray *)self->_recycledObjects count])
  {
    v3 = [(NSMutableArray *)self->_recycledObjects lastObject];
    [(NSMutableArray *)self->_recycledObjects removeLastObject];
  }
  else
  {
    v3 = [[(objc_class *)self->_targetClass alloc] init];
    builder = (void (**)(id, objc_class *))self->_builder;
    if (builder) {
      builder[2](builder, v3);
    }
  }
  if (self->_threadSafe) {
    os_unfair_lock_unlock(&self->_lock);
  }

  return v3;
}

- (void)recycleObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_repsondsToPrepareForReuse) {
      [v4 prepareForReuse];
    }
    if (self->_threadSafe) {
      os_unfair_lock_lock(&self->_lock);
    }
    [(NSMutableArray *)self->_recycledObjects addObject:v4];
    if (self->_threadSafe) {
      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

- (PHRecyclableObjectVendor)initWithTargetClass:(Class)a3 requiresThreadSafety:(BOOL)a4 initialPoolSize:(int64_t)a5 prototypeStep:(id)a6
{
  id v11 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PHRecyclableObjectVendor;
  v12 = [(PHRecyclableObjectVendor *)&v22 init];
  if (v12)
  {
    if (!a3)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, v12, @"PHRecyclableObjectVendor.m", 35, @"Invalid parameter not satisfying: %@", @"class" object file lineNumber description];
    }
    if (a5 <= 20) {
      int64_t v13 = 20;
    }
    else {
      int64_t v13 = a5;
    }
    uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v13];
    recycledObjects = v12->_recycledObjects;
    v12->_recycledObjects = (NSMutableArray *)v14;

    if (a5 >= 1)
    {
      do
      {
        v16 = v12->_recycledObjects;
        id v17 = objc_alloc_init(a3);
        [(NSMutableArray *)v16 addObject:v17];

        --a5;
      }
      while (a5);
    }
    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_repsondsToPrepareForReuse = class_respondsToSelector(a3, sel_prepareForReuse);
    v12->_targetClass = a3;
    v12->_threadSafe = a4;
    v18 = _Block_copy(v11);
    id builder = v12->_builder;
    v12->_id builder = v18;
  }
  return v12;
}

- (PHRecyclableObjectVendor)initWithTargetClass:(Class)a3 requiresThreadSafety:(BOOL)a4 initialPoolSize:(int64_t)a5
{
  return [(PHRecyclableObjectVendor *)self initWithTargetClass:a3 requiresThreadSafety:a4 initialPoolSize:a5 prototypeStep:0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_builder, 0);

  objc_storeStrong((id *)&self->_recycledObjects, 0);
}

@end