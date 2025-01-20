@interface _GEOAggregateProgress
- (BOOL)isIndeterminate;
- (_GEOAggregateProgress)initWithParent:(id)a3 userInfo:(id)a4;
- (_GEOAggregateProgress)initWithTotalUnitCount:(int64_t)a3;
- (void)_update;
- (void)addChild:(id)a3 withPendingUnitCount:(int64_t)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _GEOAggregateProgress

- (_GEOAggregateProgress)initWithParent:(id)a3 userInfo:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_GEOAggregateProgress;
  v4 = [(_GEOAggregateProgress *)&v8 initWithParent:a3 userInfo:a4];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = v4;
  }

  return v5;
}

- (_GEOAggregateProgress)initWithTotalUnitCount:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_GEOAggregateProgress;
  v4 = [(_GEOAggregateProgress *)&v8 initWithParent:0 userInfo:0];
  v5 = v4;
  if (v4)
  {
    [(_GEOAggregateProgress *)v4 setTotalUnitCount:a3];
    v5->_lock._os_unfair_lock_opaque = 0;
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_observedChildren;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        uint64_t v8 = [&unk_1ED73EE00 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v15;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v15 != v10) {
                objc_enumerationMutation(&unk_1ED73EE00);
              }
              [v7 removeObserver:self forKeyPath:*(void *)(*((void *)&v14 + 1) + 8 * v11++) context:_AggregationObserverContext];
            }
            while (v9 != v11);
            uint64_t v9 = [&unk_1ED73EE00 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v9);
        }
        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  v13.receiver = self;
  v13.super_class = (Class)_GEOAggregateProgress;
  [(_GEOAggregateProgress *)&v13 dealloc];
}

- (void)addChild:(id)a3 withPendingUnitCount:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_GEOAggregateProgress;
  [(_GEOAggregateProgress *)&v18 addChild:v6 withPendingUnitCount:a4];
  os_unfair_lock_lock_with_options();
  observedChildren = self->_observedChildren;
  if (!observedChildren)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = self->_observedChildren;
    self->_observedChildren = v8;

    observedChildren = self->_observedChildren;
  }
  [(NSMutableArray *)observedChildren addObject:v6];
  os_unfair_lock_unlock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v10 = [&unk_1ED73EE00 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(&unk_1ED73EE00);
        }
        [v6 addObserver:self forKeyPath:*(void *)(*((void *)&v14 + 1) + 8 * i) options:0 context:_AggregationObserverContext];
      }
      uint64_t v11 = [&unk_1ED73EE00 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v11);
  }
  [(_GEOAggregateProgress *)self _update];
}

- (BOOL)isIndeterminate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableArray *)self->_observedChildren count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = self->_observedChildren;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "isIndeterminate", (void)v11))
          {
            BOOL v9 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 1;
LABEL_12:

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    return 0;
  }
  return v9;
}

- (void)_update
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableArray *)self->_observedChildren count])
  {
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    char v52 = 1;
    *(void *)buf = 0;
    v44 = buf;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__49;
    v47 = __Block_byref_object_dispose__49;
    id v48 = 0;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    char v42 = 1;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__49;
    v37 = __Block_byref_object_dispose__49;
    id v38 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__49;
    v31 = __Block_byref_object_dispose__49;
    id v32 = 0;
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__49;
    v25 = __Block_byref_object_dispose__49;
    id v26 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    objc_super v18 = __Block_byref_object_copy__49;
    long long v19 = __Block_byref_object_dispose__49;
    id v20 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    long long v12 = __Block_byref_object_copy__49;
    long long v13 = __Block_byref_object_dispose__49;
    id v14 = 0;
    observedChildren = self->_observedChildren;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32___GEOAggregateProgress__update__block_invoke;
    v8[3] = &unk_1E53E48E8;
    v8[4] = buf;
    v8[5] = &v49;
    v8[6] = &v33;
    v8[7] = &v39;
    v8[8] = &v27;
    v8[9] = &v21;
    v8[10] = &v15;
    v8[11] = &v9;
    [(NSMutableArray *)observedChildren enumerateObjectsUsingBlock:v8];
    os_unfair_lock_unlock(p_lock);
    if (*((unsigned char *)v50 + 24)) {
      uint64_t v5 = *((void *)v44 + 5);
    }
    else {
      uint64_t v5 = 0;
    }
    [(_GEOAggregateProgress *)self setKind:v5];
    if (*((unsigned char *)v50 + 24) && [*((id *)v44 + 5) isEqualToString:*MEMORY[0x1E4F28898]])
    {
      if (*((unsigned char *)v40 + 24)) {
        uint64_t v6 = v34[5];
      }
      else {
        uint64_t v6 = 0;
      }
      [(_GEOAggregateProgress *)self setFileOperationKind:v6];
      [(_GEOAggregateProgress *)self setFileTotalCount:v28[5]];
      [(_GEOAggregateProgress *)self setFileCompletedCount:v22[5]];
      [(_GEOAggregateProgress *)self setByteTotalCount:v16[5]];
      uint64_t v7 = v10[5];
    }
    else
    {
      [(_GEOAggregateProgress *)self setFileOperationKind:0];
      [(_GEOAggregateProgress *)self setFileTotalCount:0];
      [(_GEOAggregateProgress *)self setFileCompletedCount:0];
      [(_GEOAggregateProgress *)self setByteTotalCount:0];
      uint64_t v7 = 0;
    }
    [(_GEOAggregateProgress *)self setByteCompletedCount:v7];
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v49, 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _observedChildren.count > 0", buf, 2u);
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)_AggregationObserverContext == a6)
  {
    [(_GEOAggregateProgress *)self _update];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_GEOAggregateProgress;
    -[_GEOAggregateProgress observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void).cxx_destruct
{
}

@end