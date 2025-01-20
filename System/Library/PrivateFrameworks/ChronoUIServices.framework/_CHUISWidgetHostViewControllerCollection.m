@interface _CHUISWidgetHostViewControllerCollection
+ (id)sharedInstance;
- (NSArray)viewControllers;
- (_CHUISWidgetHostViewControllerCollection)init;
- (void)noteCreated:(id)a3;
- (void)noteDestroyed:(id)a3;
@end

@implementation _CHUISWidgetHostViewControllerCollection

+ (id)sharedInstance
{
  if (sharedInstance___once_1 != -1) {
    dispatch_once(&sharedInstance___once_1, &__block_literal_global_813);
  }
  v2 = (void *)sharedInstance___instance_0;

  return v2;
}

- (_CHUISWidgetHostViewControllerCollection)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CHUISWidgetHostViewControllerCollection;
  v2 = [(_CHUISWidgetHostViewControllerCollection *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_viewControllers = v3->_lock_viewControllers;
    v3->_lock_viewControllers = (NSHashTable *)v4;
  }
  return v3;
}

- (NSArray)viewControllers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_lock_viewControllers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
  v9 = (void *)[v3 copy];

  return (NSArray *)v9;
}

- (void)noteCreated:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_viewControllers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)noteDestroyed:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_viewControllers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

@end