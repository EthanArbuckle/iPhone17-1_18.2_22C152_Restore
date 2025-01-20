@interface _GEOResourceManifestTileGroupObserverProxy
- (_GEOResourceManifestTileGroupObserverProxy)init;
- (id)description;
- (void)forEachObserver:(void *)a3 finished:;
- (void)registerObserver:(id)a3;
@end

@implementation _GEOResourceManifestTileGroupObserverProxy

- (void)registerObserver:(id)a3
{
  id v8 = a3;
  v4 = (void *)MEMORY[0x18C1203C0]();
  os_unfair_lock_lock_with_options();
  observers = self->_observers;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v8];
  os_unfair_lock_unlock(&self->_observersLock);
}

- (_GEOResourceManifestTileGroupObserverProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)_GEOResourceManifestTileGroupObserverProxy;
  v2 = [(_GEOResourceManifestTileGroupObserverProxy *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_observersLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)forEachObserver:(void *)a3 finished:
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  v7 = (void *)v6;
  if (a1 && v5 | v6)
  {
    id v8 = *(NSObject **)(a1 + 24);
    v9 = v8;
    if (!v8)
    {
      v9 = MEMORY[0x1E4F14428];
      id v10 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71___GEOResourceManifestTileGroupObserverProxy_forEachObserver_finished___block_invoke;
    block[3] = &unk_1E53DD548;
    block[4] = a1;
    id v12 = (id)v5;
    id v13 = v7;
    dispatch_async(v9, block);
    if (!v8) {
  }
    }
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
  unint64_t v6 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)_GEOResourceManifestTileGroupObserverProxy;
  uint64_t v7 = [(_GEOResourceManifestTileGroupObserverProxy *)&v12 description];
  id v8 = (void *)v7;
  v9 = "(unknown)";
  if (label) {
    v9 = label;
  }
  id v10 = [v6 stringWithFormat:@"%@, queue: %s, observers: %@", v7, v9, self->_observers];

  os_unfair_lock_unlock(p_observersLock);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end