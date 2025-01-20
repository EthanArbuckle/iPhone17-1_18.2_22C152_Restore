@interface BWStillImageProcessorCoordinator
- (BWStillImageProcessorCoordinator)initWithProcessorControllers:(id)a3;
- (NSSet)processorControllerNames;
- (id)controllerForType:(unint64_t)a3;
- (id)description;
- (void)addController:(id)a3;
- (void)dealloc;
@end

@implementation BWStillImageProcessorCoordinator

- (BWStillImageProcessorCoordinator)initWithProcessorControllers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)BWStillImageProcessorCoordinator;
  v4 = [(BWStillImageProcessorCoordinator *)&v15 init];
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a3, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(v5, "setObject:forKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * v9), objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "type")));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
    v4->_processorControllersByType = (NSDictionary *)[v5 copy];
    v4->_processorControllersLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_processorControllersByType];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = (void *)[v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [v3 objectForKeyedSubscript:v9];
        [(id)objc_opt_class() description];
        FigCaptureCurrentProcessIsDeferredmediad();
        FigGetUpTimeNanoseconds();
        [v3 setObject:0 forKeyedSubscript:v9];
        FigGetUpTimeNanoseconds();
        FigCaptureCurrentProcessIsDeferredmediad();
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  v10.receiver = self;
  v10.super_class = (Class)BWStillImageProcessorCoordinator;
  [(BWStillImageProcessorCoordinator *)&v10 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>: processorControllers: %@", objc_opt_class(), self, -[NSArray componentsJoinedByString:](-[NSSet allObjects](-[BWStillImageProcessorCoordinator processorControllerNames](self, "processorControllerNames"), "allObjects"), "componentsJoinedByString:", @", ")];
}

- (id)controllerForType:(unint64_t)a3
{
  p_processorControllersLock = &self->_processorControllersLock;
  os_unfair_lock_lock(&self->_processorControllersLock);
  id v6 = -[NSDictionary objectForKeyedSubscript:](self->_processorControllersByType, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedLongLong:a3]);
  os_unfair_lock_unlock(p_processorControllersLock);
  return v6;
}

- (void)addController:(id)a3
{
  p_processorControllersLock = &self->_processorControllersLock;
  os_unfair_lock_lock(&self->_processorControllersLock);
  id v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_processorControllersByType];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", a3, objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "type")));

  self->_processorControllersByType = (NSDictionary *)[v6 copy];
  os_unfair_lock_unlock(p_processorControllersLock);
}

- (NSSet)processorControllerNames
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  v4 = (void *)MEMORY[0x1A6272C70]();
  p_processorControllersLock = &self->_processorControllersLock;
  os_unfair_lock_lock(&self->_processorControllersLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  id v6 = [(NSDictionary *)self->_processorControllersByType allValues];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = (objc_class *)objc_opt_class();
        [v3 addObject:NSStringFromClass(v11)];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  os_unfair_lock_unlock(p_processorControllersLock);
  return (NSSet *)(id)[v3 copy];
}

@end