@interface AVKeyPathDependencyManager
- (AVKeyPathDependencyManager)initWithDependencyHost:(id)a3;
- (void)addCallbackToCancel:(id)a3;
- (void)cancelAllCallbacks;
- (void)dealloc;
- (void)dependencyHostIsFullyInitialized;
- (void)valueForKey:(id)a3 dependsOnValueAtKeyPath:(id)a4;
@end

@implementation AVKeyPathDependencyManager

- (AVKeyPathDependencyManager)initWithDependencyHost:(id)a3
{
  v6 = (objc_class *)objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = self;
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    NSStringFromClass(v6);
    v19 = (void *)[v10 exceptionWithName:v11, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot safely use %@ with %@ or its subclasses, due to rdar://problem/26865139, until we\x18 stop supporting legacy versions of iWork apps", v14, v15, v16, v17, v18, (uint64_t)v13), 0 reason userInfo];
    objc_exception_throw(v19);
  }
  v20.receiver = self;
  v20.super_class = (Class)AVKeyPathDependencyManager;
  v7 = [(AVKeyPathDependencyManager *)&v20 init];
  if (v7)
  {
    v7->_weakReferenceToDependencyHost = [[AVWeakReference alloc] initWithReferencedObject:a3];
    v7->_callbackCancellationHelper = objc_alloc_init(AVWeakObservableCallbackCancellationHelper);
    v7->_keyPathDependencies = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  return v7;
}

- (void)dependencyHostIsFullyInitialized
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVWeakReference *)self->_weakReferenceToDependencyHost referencedObject];
  if (v3)
  {
    id v4 = v3;
    [v3 declareKeyPathDependenciesWithRegistry:self];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    keyPathDependencies = self->_keyPathDependencies;
    uint64_t v6 = [(NSMutableSet *)keyPathDependencies countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(keyPathDependencies);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) initializationIsCompleteForObject:v4];
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableSet *)keyPathDependencies countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)valueForKey:(id)a3 dependsOnValueAtKeyPath:(id)a4
{
  uint64_t v7 = [(AVWeakReference *)self->_weakReferenceToDependencyHost referencedObject];
  if (v7)
  {
    uint64_t v8 = [[AVKeyPathDependency alloc] initWithObject:v7 thatHasPropertyWithKey:a3 whoseValueDependsOnValueAtKeyPath:a4];
    [(NSMutableSet *)self->_keyPathDependencies addObject:v8];
    uint64_t v7 = v8;
  }
}

- (void)addCallbackToCancel:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVKeyPathDependencyManager;
  [(AVKeyPathDependencyManager *)&v3 dealloc];
}

- (void)cancelAllCallbacks
{
}

@end