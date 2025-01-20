@interface _GEOExperimentConfigurationObserverProxy
- (OS_dispatch_queue)queue;
- (_GEOExperimentConfigurationObserverProxy)init;
- (id)description;
- (unint64_t)observersCount;
- (void)forEachObserver:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation _GEOExperimentConfigurationObserverProxy

- (_GEOExperimentConfigurationObserverProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)_GEOExperimentConfigurationObserverProxy;
  v2 = [(_GEOExperimentConfigurationObserverProxy *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_observersLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  queue = self->_queue;
  if (queue) {
    label = dispatch_queue_get_label(queue);
  }
  else {
    label = 0;
  }
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock_with_options();
  objc_super v6 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)_GEOExperimentConfigurationObserverProxy;
  uint64_t v7 = [(_GEOExperimentConfigurationObserverProxy *)&v12 description];
  v8 = (void *)v7;
  v9 = "(unknown)";
  if (label) {
    v9 = label;
  }
  v10 = [v6 stringWithFormat:@"%@, queue: %s, observers: %@", v7, v9, self->_observers];

  os_unfair_lock_unlock(p_observersLock);

  return v10;
}

- (void)registerObserver:(id)a3
{
  id v8 = a3;
  v4 = (void *)MEMORY[0x18C1203C0]();
  os_unfair_lock_lock_with_options();
  observers = self->_observers;
  if (!observers)
  {
    objc_super v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v8];
  os_unfair_lock_unlock(&self->_observersLock);
}

- (void)unregisterObserver:(id)a3
{
  id v5 = a3;
  v4 = (void *)MEMORY[0x18C1203C0]();
  os_unfair_lock_lock_with_options();
  [(NSHashTable *)self->_observers removeObject:v5];
  os_unfair_lock_unlock(&self->_observersLock);
}

- (void)forEachObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    objc_super v6 = queue;
    if (!queue)
    {
      objc_super v6 = MEMORY[0x1E4F14428];
      id v7 = MEMORY[0x1E4F14428];
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60___GEOExperimentConfigurationObserverProxy_forEachObserver___block_invoke;
    v8[3] = &unk_1E53D7ED0;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v6, v8);
    if (!queue) {
  }
    }
}

- (unint64_t)observersCount
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [(NSHashTable *)self->_observers count];
  os_unfair_lock_unlock(p_observersLock);
  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end