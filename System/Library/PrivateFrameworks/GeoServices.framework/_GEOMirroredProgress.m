@interface _GEOMirroredProgress
- (_GEOMirroredProgress)initWithMirroredProgress:(id)a3;
- (id)_initWithMirroredProgressForSubclasses:(id)a3;
- (void)_registerForKVO;
- (void)_replaceObservedProgressWith:(id)a3;
- (void)_unregisterForKVO;
- (void)_update;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _GEOMirroredProgress

- (void)_update
{
  if ([(NSProgress *)self->_originalProgress isCancelled])
  {
    [(_GEOMirroredProgress *)self cancel];
  }
  else
  {
    if ([(NSProgress *)self->_originalProgress isIndeterminate])
    {
      [(_GEOMirroredProgress *)self setTotalUnitCount:-1];
      v3 = self;
      uint64_t v4 = -1;
    }
    else
    {
      BOOL v5 = [(NSProgress *)self->_originalProgress isFinished];
      [(_GEOMirroredProgress *)self setTotalUnitCount:100];
      if (v5)
      {
        uint64_t v4 = [(_GEOMirroredProgress *)self totalUnitCount];
      }
      else
      {
        [(NSProgress *)self->_originalProgress fractionCompleted];
        uint64_t v4 = (uint64_t)(v6 * 100.0);
      }
      v3 = self;
    }
    [(_GEOMirroredProgress *)v3 setCompletedUnitCount:v4];
  }
  v7 = [(_GEOMirroredProgress *)self kind];
  uint64_t v8 = [(NSProgress *)self->_originalProgress kind];
  if (v7 == (void *)v8)
  {
  }
  else
  {
    v9 = (void *)v8;
    v10 = [(_GEOMirroredProgress *)self kind];
    v11 = [(NSProgress *)self->_originalProgress kind];
    char v12 = [v10 isEqualToString:v11];

    if (v12) {
      goto LABEL_15;
    }
    v7 = [(NSProgress *)self->_originalProgress kind];
    [(_GEOMirroredProgress *)self setKind:v7];
  }

LABEL_15:
  id v13 = [(NSProgress *)self->_originalProgress userInfo];
  [(NSProgress *)self _geo_setUserInfo:v13];
}

- (void).cxx_destruct
{
}

- (void)_replaceObservedProgressWith:(id)a3
{
  uint64_t v4 = (NSProgress *)a3;
  [(_GEOMirroredProgress *)self _unregisterForKVO];
  originalProgress = self->_originalProgress;
  self->_originalProgress = v4;

  [(_GEOMirroredProgress *)self _registerForKVO];

  [(_GEOMirroredProgress *)self _update];
}

- (_GEOMirroredProgress)initWithMirroredProgress:(id)a3
{
  v3 = [(_GEOMirroredProgress *)self _initWithMirroredProgressForSubclasses:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    [(_GEOMirroredProgress *)v3 _registerForKVO];
    [(_GEOMirroredProgress *)v4 _update];
  }
  return v4;
}

- (void)_registerForKVO
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [&unk_1ED73EE18 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(&unk_1ED73EE18);
        }
        [(NSProgress *)self->_originalProgress addObserver:self forKeyPath:*(void *)(*((void *)&v7 + 1) + 8 * v6++) options:0 context:_ProgressMirrorObserverContext];
      }
      while (v4 != v6);
      uint64_t v4 = [&unk_1ED73EE18 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)dealloc
{
  [(_GEOMirroredProgress *)self _unregisterForKVO];
  v3.receiver = self;
  v3.super_class = (Class)_GEOMirroredProgress;
  [(_GEOMirroredProgress *)&v3 dealloc];
}

- (void)_unregisterForKVO
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [&unk_1ED73EE18 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(&unk_1ED73EE18);
        }
        [(NSProgress *)self->_originalProgress removeObserver:self forKeyPath:*(void *)(*((void *)&v7 + 1) + 8 * v6++) context:_ProgressMirrorObserverContext];
      }
      while (v4 != v6);
      uint64_t v4 = [&unk_1ED73EE18 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_initWithMirroredProgressForSubclasses:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)_GEOMirroredProgress;
    uint64_t v6 = [(_GEOMirroredProgress *)&v10 initWithParent:0 userInfo:0];
    long long v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_originalProgress, a3);
    }
    self = v7;
    long long v8 = self;
  }
  else
  {
    long long v8 = 0;
  }

  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)_ProgressMirrorObserverContext == a6)
  {
    [(_GEOMirroredProgress *)self _update];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_GEOMirroredProgress;
    -[_GEOMirroredProgress observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

@end