@interface _BPSMerged
- (BOOL)finished;
- (BOOL)recursive;
- (BOOL)terminated;
- (BPSSubscriber)downstream;
- (NSMutableArray)buffers;
- (NSMutableArray)subscriptions;
- (NSMutableArray)upstreamBookmarks;
- (_BPSMerged)initWithDownstream:(id)a3 count:(int64_t)a4;
- (id)applyDownstreamWhileLocked:(BOOL)a3 apply:(id)a4;
- (id)newBookmark;
- (id)upstreamSubscriptions;
- (int64_t)count;
- (int64_t)demand;
- (int64_t)pending;
- (int64_t)receiveInput:(id)a3 atIndex:(int64_t)a4;
- (int64_t)upstreamFinished;
- (void)cancel;
- (void)receiveCompletion:(id)a3 atIndex:(int64_t)a4;
- (void)receiveSubscription:(id)a3 atIndex:(int64_t)a4;
- (void)requestDemand:(int64_t)a3;
- (void)setBuffers:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setPending:(int64_t)a3;
- (void)setRecursive:(BOOL)a3;
- (void)setSubscriptions:(id)a3;
- (void)setTerminated:(BOOL)a3;
- (void)setUpstreamBookmarks:(id)a3;
- (void)setUpstreamFinished:(int64_t)a3;
- (void)updateBookmarksWhenLockedForIndex:(unint64_t)a3;
- (void)upstreamSubscriptions;
@end

@implementation _BPSMerged

- (_BPSMerged)initWithDownstream:(id)a3 count:(int64_t)a4
{
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_BPSMerged;
  v8 = [(_BPSMerged *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_downstream, a3);
    v9->_count = a4;
    v9->_terminated = 0;
    v9->_upstreamFinished = 0;
    v9->_finished = 0;
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    subscriptions = v9->_subscriptions;
    v9->_subscriptions = (NSMutableArray *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    upstreamBookmarks = v9->_upstreamBookmarks;
    v9->_upstreamBookmarks = (NSMutableArray *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    buffers = v9->_buffers;
    v9->_buffers = (NSMutableArray *)v14;

    v9->_recursive = 0;
    v9->_demand = 0;
    v9->_pending = 0;
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_downstreamLock = 0;
    if (a4 >= 1)
    {
      do
      {
        v16 = v9->_subscriptions;
        v17 = [MEMORY[0x1E4F1CA98] null];
        [(NSMutableArray *)v16 addObject:v17];

        v18 = v9->_upstreamBookmarks;
        v19 = [MEMORY[0x1E4F1CA98] null];
        [(NSMutableArray *)v18 addObject:v19];

        v20 = v9->_buffers;
        v21 = [MEMORY[0x1E4F1CA98] null];
        [(NSMutableArray *)v20 addObject:v21];

        --a4;
      }
      while (a4);
    }
  }

  return v9;
}

- (id)applyDownstreamWhileLocked:(BOOL)a3 apply:(id)a4
{
  v6 = (void (**)(id, void *))a4;
  if (!a3) {
    os_unfair_lock_lock(&self->_lock);
  }
  [(_BPSMerged *)self setRecursive:1];
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_recursive_lock_lock_with_options();
  id v7 = [(_BPSMerged *)self downstream];
  v8 = v6[2](v6, v7);

  os_unfair_recursive_lock_unlock();
  os_unfair_lock_lock(&self->_lock);
  [(_BPSMerged *)self setRecursive:0];
  if (!a3) {
    os_unfair_lock_unlock(&self->_lock);
  }

  return v8;
}

- (void)receiveCompletion:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = self;
  v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v83 = (id)objc_opt_class();
    __int16 v84 = 2048;
    int64_t v85 = a4;
    id v9 = v83;
    _os_log_impl(&dword_1AD01F000, v8, OS_LOG_TYPE_INFO, "%@ - completion at index %ld", buf, 0x16u);
  }
  uint64_t v10 = [v6 state];
  if (!v10)
  {
    p_locuint64_t k = &v7->_lock;
    os_unfair_lock_lock(&v7->_lock);
    [(_BPSMerged *)v7 setUpstreamFinished:[(_BPSMerged *)v7 upstreamFinished] + 1];
    [(_BPSMerged *)v7 updateBookmarksWhenLockedForIndex:a4];
    v35 = [MEMORY[0x1E4F1CA98] null];
    v36 = [(_BPSMerged *)v7 subscriptions];
    [v36 setObject:v35 atIndexedSubscript:a4];

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v37 = [(_BPSMerged *)v7 buffers];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v69 objects:v80 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v70;
      while (2)
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v70 != v39) {
            objc_enumerationMutation(v37);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            LOBYTE(v38) = 1;
            goto LABEL_32;
          }
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v69 objects:v80 count:16];
        if (v38) {
          continue;
        }
        break;
      }
    }
LABEL_32:

    uint64_t v41 = [(_BPSMerged *)v7 upstreamFinished];
    uint64_t v42 = [(_BPSMerged *)v7 count];
    if ((v38 & 1) == 0 && v41 == v42)
    {
      [(_BPSMerged *)v7 setFinished:1];
      v43 = [(_BPSMerged *)v7 subscriptions];
      v44 = (void *)[v43 copy];

      v45 = [(_BPSMerged *)v7 subscriptions];
      uint64_t v46 = [v45 count];

      if (v46)
      {
        unint64_t v47 = 0;
        do
        {
          v48 = [MEMORY[0x1E4F1CA98] null];
          v49 = [(_BPSMerged *)v7 subscriptions];
          [v49 setObject:v48 atIndexedSubscript:v47];

          ++v47;
          v50 = [(_BPSMerged *)v7 subscriptions];
          unint64_t v51 = [v50 count];
        }
        while (v47 < v51);
      }
      v52 = [(_BPSMerged *)v7 buffers];
      uint64_t v53 = [v52 count];

      if (v53)
      {
        unint64_t v54 = 0;
        do
        {
          v55 = [MEMORY[0x1E4F1CA98] null];
          v56 = [(_BPSMerged *)v7 buffers];
          [v56 setObject:v55 atIndexedSubscript:v54];

          ++v54;
          v57 = [(_BPSMerged *)v7 buffers];
          unint64_t v58 = [v57 count];
        }
        while (v54 < v58);
      }
      os_unfair_lock_unlock(&v7->_lock);
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v28 = v44;
      uint64_t v59 = [v28 countByEnumeratingWithState:&v65 objects:v79 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v66;
        do
        {
          for (uint64_t j = 0; j != v60; ++j)
          {
            if (*(void *)v66 != v61) {
              objc_enumerationMutation(v28);
            }
            v63 = *(void **)(*((void *)&v65 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              objc_msgSend(v63, "cancel", (void)v65);
            }
          }
          uint64_t v60 = [v28 countByEnumeratingWithState:&v65 objects:v79 count:16];
        }
        while (v60);
      }

      id v64 = [(_BPSMerged *)v7 applyDownstreamWhileLocked:0 apply:&__block_literal_global_0];
      goto LABEL_50;
    }
LABEL_51:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_52;
  }
  if (v10 == 1)
  {
    p_locuint64_t k = &v7->_lock;
    os_unfair_lock_lock(&v7->_lock);
    if (![(_BPSMerged *)v7 terminated])
    {
      [(_BPSMerged *)v7 setTerminated:1];
      uint64_t v12 = [(_BPSMerged *)v7 subscriptions];
      v13 = (void *)[v12 copy];

      uint64_t v14 = [(_BPSMerged *)v7 subscriptions];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        unint64_t v16 = 0;
        do
        {
          [(_BPSMerged *)v7 updateBookmarksWhenLockedForIndex:v16];
          v17 = [MEMORY[0x1E4F1CA98] null];
          v18 = [(_BPSMerged *)v7 subscriptions];
          [v18 setObject:v17 atIndexedSubscript:v16];

          ++v16;
          v19 = [(_BPSMerged *)v7 subscriptions];
          unint64_t v20 = [v19 count];
        }
        while (v16 < v20);
      }
      v21 = [(_BPSMerged *)v7 buffers];
      uint64_t v22 = [v21 count];

      if (v22)
      {
        unint64_t v23 = 0;
        do
        {
          v24 = [MEMORY[0x1E4F1CA98] null];
          v25 = [(_BPSMerged *)v7 buffers];
          [v25 setObject:v24 atIndexedSubscript:v23];

          ++v23;
          v26 = [(_BPSMerged *)v7 buffers];
          unint64_t v27 = [v26 count];
        }
        while (v23 < v27);
      }
      os_unfair_lock_unlock(&v7->_lock);
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v28 = v13;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v75 objects:v81 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v76;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v76 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v75 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              [v33 cancel];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v75 objects:v81 count:16];
        }
        while (v30);
      }

      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __40___BPSMerged_receiveCompletion_atIndex___block_invoke;
      v73[3] = &unk_1E5E760C8;
      id v74 = v6;
      id v34 = [(_BPSMerged *)v7 applyDownstreamWhileLocked:0 apply:v73];

LABEL_50:
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_52:
}

- (int64_t)receiveInput:(id)a3 atIndex:(int64_t)a4
{
  id v7 = a3;
  v8 = self;
  p_locuint64_t k = &v8->_lock;
  os_unfair_lock_lock(&v8->_lock);
  if ([(_BPSMerged *)v8 demand] == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_unfair_lock_unlock(p_lock);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __35___BPSMerged_receiveInput_atIndex___block_invoke;
    v27[3] = &unk_1E5E760C8;
    id v28 = v7;
    uint64_t v10 = [(_BPSMerged *)v8 applyDownstreamWhileLocked:0 apply:v27];
    int64_t v11 = [v10 integerValue];

    uint64_t v12 = v28;
LABEL_5:

    goto LABEL_6;
  }
  if ([(_BPSMerged *)v8 demand] >= 1)
  {
    [(_BPSMerged *)v8 setDemand:[(_BPSMerged *)v8 demand] - 1];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __35___BPSMerged_receiveInput_atIndex___block_invoke_2;
    v25 = &unk_1E5E760C8;
    id v26 = v7;
    int64_t v11 = 1;
    v13 = [(_BPSMerged *)v8 applyDownstreamWhileLocked:1 apply:&v22];
    uint64_t v14 = objc_msgSend(v13, "integerValue", v22, v23, v24, v25);

    [(_BPSMerged *)v8 setDemand:[(_BPSMerged *)v8 pending] + [(_BPSMerged *)v8 demand] + v14];
    [(_BPSMerged *)v8 setPending:0];
    os_unfair_lock_unlock(p_lock);
    uint64_t v12 = v26;
    goto LABEL_5;
  }
  unint64_t v16 = [(_BPSMerged *)v8 buffers];
  v17 = [v16 objectAtIndexedSubscript:a4];
  v18 = [MEMORY[0x1E4F1CA98] null];
  char v19 = [v17 isEqual:v18];

  if ((v19 & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:v8 file:@"BPSMerge.m" lineNumber:181 description:@"Expecting buffer to be null"];
  }
  unint64_t v20 = [(_BPSMerged *)v8 buffers];
  [v20 setObject:v7 atIndexedSubscript:a4];

  os_unfair_lock_unlock(p_lock);
  int64_t v11 = 0;
LABEL_6:

  return v11;
}

- (void)receiveSubscription:(id)a3 atIndex:(int64_t)a4
{
  id v13 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(_BPSMerged *)self subscriptions];
  id v7 = [v6 objectAtIndexedSubscript:a4];
  v8 = [MEMORY[0x1E4F1CA98] null];
  char v9 = [v7 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = [(_BPSMerged *)self subscriptions];
    [v10 setObject:v13 atIndexedSubscript:a4];

    int64_t v11 = [(_BPSMerged *)self demand];
    os_unfair_lock_unlock(&self->_lock);
    if (![(_BPSMerged *)self terminated])
    {
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v12 = 1;
      }
      [v13 requestDemand:v12];
      goto LABEL_9;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  [v13 cancel];
LABEL_9:
}

- (void)requestDemand:(int64_t)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  v4 = self;
  p_locuint64_t k = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if ([(_BPSMerged *)v4 terminated]) {
    goto LABEL_7;
  }
  BOOL v6 = [(_BPSMerged *)v4 finished];
  if (a3 < 1 || v6 || [(_BPSMerged *)v4 demand] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_7;
  }
  if ([(_BPSMerged *)v4 recursive])
  {
    [(_BPSMerged *)v4 setPending:[(_BPSMerged *)v4 pending] + a3];
LABEL_7:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_8;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(_BPSMerged *)v4 setDemand:0x7FFFFFFFFFFFFFFFLL];
    id v7 = [(_BPSMerged *)v4 buffers];
    v8 = [(_BPSMerged *)v4 buffers];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      do
      {
        int64_t v11 = [MEMORY[0x1E4F1CA98] null];
        uint64_t v12 = [(_BPSMerged *)v4 buffers];
        [v12 setObject:v11 atIndexedSubscript:v10];

        ++v10;
        id v13 = [(_BPSMerged *)v4 buffers];
        unint64_t v14 = [v13 count];
      }
      while (v10 < v14);
    }
    uint64_t v79 = [(_BPSMerged *)v4 upstreamFinished];
    uint64_t v77 = [(_BPSMerged *)v4 count];
    uint64_t v15 = v4;
    locuint64_t k = [(_BPSMerged *)v4 subscriptions];
    os_unfair_lock_unlock(p_lock);
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    obuint64_t j = v7;
    uint64_t v16 = [obj countByEnumeratingWithState:&v101 objects:v109 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v102;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v102 != v18) {
            objc_enumerationMutation(obj);
          }
          unint64_t v20 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          v21 = [MEMORY[0x1E4F1CA98] null];
          char v22 = [v20 isEqual:v21];

          if ((v22 & 1) == 0)
          {
            v100[0] = MEMORY[0x1E4F143A8];
            v100[1] = 3221225472;
            v100[2] = __28___BPSMerged_requestDemand___block_invoke;
            v100[3] = &unk_1E5E76110;
            v100[4] = v20;
            id v23 = [(_BPSMerged *)v15 applyDownstreamWhileLocked:0 apply:v100];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v101 objects:v109 count:16];
      }
      while (v17);
    }

    if (v79 == v77)
    {
      v4 = v15;
      id v24 = [(_BPSMerged *)v15 applyDownstreamWhileLocked:0 apply:&__block_literal_global_11];
    }
    else
    {
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      v45 = lock;
      uint64_t v46 = [(os_unfair_lock_s *)v45 countByEnumeratingWithState:&v96 objects:v108 count:16];
      v4 = v15;
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v97;
        do
        {
          for (uint64_t j = 0; j != v47; ++j)
          {
            if (*(void *)v97 != v48) {
              objc_enumerationMutation(v45);
            }
            v50 = *(void **)(*((void *)&v96 + 1) + 8 * j);
            unint64_t v51 = [MEMORY[0x1E4F1CA98] null];
            char v52 = [v50 isEqual:v51];

            if ((v52 & 1) == 0) {
              [v50 requestDemand:0x7FFFFFFFFFFFFFFFLL];
            }
          }
          uint64_t v47 = [(os_unfair_lock_s *)v45 countByEnumeratingWithState:&v96 objects:v108 count:16];
        }
        while (v47);
      }
    }
  }
  else
  {
    [(_BPSMerged *)v4 setDemand:[(_BPSMerged *)v4 demand] + a3];
    v25 = (void *)MEMORY[0x1E4F1CBF0];
    id v26 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    unint64_t v27 = (void *)[v25 mutableCopy];
    id v28 = [(_BPSMerged *)v4 buffers];
    uint64_t v29 = [v28 count];

    if (v29)
    {
      unint64_t v30 = 0;
      do
      {
        if (![(_BPSMerged *)v4 demand]) {
          break;
        }
        uint64_t v31 = [(_BPSMerged *)v4 buffers];
        v32 = [v31 objectAtIndexedSubscript:v30];

        v33 = [MEMORY[0x1E4F1CA98] null];
        char v34 = [v32 isEqual:v33];

        if ((v34 & 1) == 0)
        {
          [(_BPSMerged *)v4 setDemand:[(_BPSMerged *)v4 demand] - 1];
          [v26 addObject:v32];
          v35 = [(_BPSMerged *)v4 subscriptions];
          v36 = [v35 objectAtIndexedSubscript:v30];
          [v27 addObject:v36];
        }
        ++v30;
        v37 = [(_BPSMerged *)v4 buffers];
        unint64_t v38 = [v37 count];
      }
      while (v30 < v38);
    }
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    uint64_t v39 = [(_BPSMerged *)v4 buffers];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v92 objects:v107 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v93;
      while (2)
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v93 != v42) {
            objc_enumerationMutation(v39);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            int v44 = 0;
            goto LABEL_40;
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v92 objects:v107 count:16];
        if (v41) {
          continue;
        }
        break;
      }
      int v44 = 1;
LABEL_40:
      p_locuint64_t k = &v4->_lock;
    }
    else
    {
      int v44 = 1;
    }
    long long v78 = v27;

    uint64_t v53 = [(_BPSMerged *)v4 upstreamFinished];
    if (v53 == [(_BPSMerged *)v4 count]) {
      int v54 = v44;
    }
    else {
      int v54 = 0;
    }
    int v80 = v54;
    if (v54 == 1) {
      [(_BPSMerged *)v4 setFinished:1];
    }
    v55 = v4;
    os_unfair_lock_unlock(p_lock);
    uint64_t v56 = 0;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v57 = v26;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v88 objects:v106 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v89;
      uint64_t v56 = 0;
      do
      {
        for (uint64_t m = 0; m != v59; ++m)
        {
          if (*(void *)v89 != v60) {
            objc_enumerationMutation(v57);
          }
          uint64_t v62 = *(void *)(*((void *)&v88 + 1) + 8 * m);
          v87[0] = MEMORY[0x1E4F143A8];
          v87[1] = 3221225472;
          v87[2] = __28___BPSMerged_requestDemand___block_invoke_3;
          v87[3] = &unk_1E5E760C8;
          v87[4] = v62;
          v63 = [(_BPSMerged *)v55 applyDownstreamWhileLocked:0 apply:v87];
          v56 += [v63 integerValue];
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v88 objects:v106 count:16];
      }
      while (v59);
    }

    os_unfair_lock_lock(p_lock);
    uint64_t v64 = [(_BPSMerged *)v55 pending];
    [(_BPSMerged *)v55 setPending:0];
    os_unfair_lock_unlock(p_lock);
    if (v80)
    {
      id v65 = [(_BPSMerged *)v55 applyDownstreamWhileLocked:0 apply:&__block_literal_global_13];
      v4 = v55;
      long long v66 = v78;
    }
    else
    {
      uint64_t v67 = v64 + v56;
      BOOL v68 = v64 + v56 < 1;
      v4 = v55;
      if (!v68)
      {
        os_unfair_lock_lock(p_lock);
        [(_BPSMerged *)v55 setDemand:[(_BPSMerged *)v55 demand] + v67];
        os_unfair_lock_unlock(p_lock);
      }
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v66 = v78;
      id v69 = v78;
      uint64_t v70 = [v69 countByEnumeratingWithState:&v83 objects:v105 count:16];
      if (v70)
      {
        uint64_t v71 = v70;
        uint64_t v72 = *(void *)v84;
        do
        {
          for (uint64_t n = 0; n != v71; ++n)
          {
            if (*(void *)v84 != v72) {
              objc_enumerationMutation(v69);
            }
            id v74 = *(void **)(*((void *)&v83 + 1) + 8 * n);
            long long v75 = [MEMORY[0x1E4F1CA98] null];
            char v76 = [v74 isEqual:v75];

            if ((v76 & 1) == 0) {
              [v74 requestDemand:1];
            }
          }
          uint64_t v71 = [v69 countByEnumeratingWithState:&v83 objects:v105 count:16];
        }
        while (v71);
      }
    }
  }
LABEL_8:
}

- (void)cancel
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_debug_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_DEBUG, "%@ - cancel", (uint8_t *)&v4, 0xCu);
}

- (id)upstreamSubscriptions
{
  id v3 = [(_BPSMerged *)self subscriptions];

  if (v3)
  {
    int v4 = [(_BPSMerged *)self subscriptions];
  }
  else
  {
    id v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(_BPSMerged *)(uint64_t)self upstreamSubscriptions];
    }

    int v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (void)updateBookmarksWhenLockedForIndex:(unint64_t)a3
{
  id v5 = [(_BPSMerged *)self subscriptions];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a3];

  id v7 = [MEMORY[0x1E4F1CA98] null];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    if ([v6 conformsToProtocol:&unk_1F040FEE8])
    {
      id v9 = v6;
      unint64_t v10 = (void *)[v9 newBookmark];
      if (v10)
      {
        int64_t v11 = [MEMORY[0x1E4F1CA98] null];
        char v12 = [v10 isEqual:v11];

        if ((v12 & 1) == 0) {
          [(NSMutableArray *)self->_upstreamBookmarks setObject:v10 atIndexedSubscript:a3];
        }
      }
    }
    else
    {
      id v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[_BPSMerged updateBookmarksWhenLockedForIndex:]((uint64_t)v6, v13);
      }
    }
  }
}

- (id)newBookmark
{
  id v3 = [BMBookmarkNode alloc];
  upstreamBookmarks = self->_upstreamBookmarks;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  id v7 = [(BMBookmarkNode *)v3 initWithValue:0 upstreams:upstreamBookmarks name:v6];

  return v7;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (int64_t)demand
{
  return self->_demand;
}

- (void)setDemand:(int64_t)a3
{
  self->_demand = a3;
}

- (BOOL)terminated
{
  return self->_terminated;
}

- (void)setTerminated:(BOOL)a3
{
  self->_terminated = a3;
}

- (int64_t)upstreamFinished
{
  return self->_upstreamFinished;
}

- (void)setUpstreamFinished:(int64_t)a3
{
  self->_upstreamFinished = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (NSMutableArray)buffers
{
  return self->_buffers;
}

- (void)setBuffers:(id)a3
{
}

- (BOOL)recursive
{
  return self->_recursive;
}

- (void)setRecursive:(BOOL)a3
{
  self->_recursive = a3;
}

- (int64_t)pending
{
  return self->_pending;
}

- (void)setPending:(int64_t)a3
{
  self->_pending = a3;
}

- (NSMutableArray)upstreamBookmarks
{
  return self->_upstreamBookmarks;
}

- (void)setUpstreamBookmarks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstreamBookmarks, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

- (void)upstreamSubscriptions
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_ERROR, "%@ - upstreamSubscriptions are nil", (uint8_t *)&v4, 0xCu);
}

- (void)updateBookmarksWhenLockedForIndex:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", (uint8_t *)&v2, 0xCu);
}

@end