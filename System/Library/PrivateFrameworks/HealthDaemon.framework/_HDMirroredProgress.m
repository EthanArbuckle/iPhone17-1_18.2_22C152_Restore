@interface _HDMirroredProgress
+ (id)_KVOKeyPaths;
- (void)_update;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _HDMirroredProgress

- (void)_update
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ([*(id *)(a1 + 120) isCancelled])
    {
      [(id)a1 cancel];
    }
    else
    {
      if ([*(id *)(a1 + 120) isIndeterminate])
      {
        [(id)a1 setTotalUnitCount:-1];
        v2 = (void *)a1;
        uint64_t v3 = -1;
      }
      else
      {
        [(id)a1 setTotalUnitCount:100000];
        [*(id *)(a1 + 120) fractionCompleted];
        uint64_t v3 = (uint64_t)(v4 * 100000.0);
        v2 = (void *)a1;
      }
      [v2 setCompletedUnitCount:v3];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = +[_HDMirroredProgress _KVOKeyPaths]();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [(NSProgress *)self->_originalProgress removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v7++) context:_HDProgressMirrorObserverContext];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
  v8.receiver = self;
  v8.super_class = (Class)_HDMirroredProgress;
  [(_HDMirroredProgress *)&v8 dealloc];
}

+ (id)_KVOKeyPaths
{
  v5[3] = *MEMORY[0x1E4F143B8];
  self;
  v0 = NSStringFromSelector(sel_fractionCompleted);
  v5[0] = v0;
  v1 = NSStringFromSelector(sel_isIndeterminate);
  v5[1] = v1;
  v2 = NSStringFromSelector(sel_isCancelled);
  v5[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)_HDProgressMirrorObserverContext == a6)
  {
    -[_HDMirroredProgress _update]((uint64_t)self);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_HDMirroredProgress;
    -[_HDMirroredProgress observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void).cxx_destruct
{
}

@end