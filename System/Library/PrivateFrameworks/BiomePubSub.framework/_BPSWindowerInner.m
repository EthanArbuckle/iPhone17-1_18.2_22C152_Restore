@interface _BPSWindowerInner
- (BPSSubscriber)downstream;
- (BPSWindowAssigner)assigner;
- (_BPSWindowerInner)initWithDownstream:(id)a3 key:(id)a4 assigner:(id)a5;
- (id)key;
- (id)upstreamSubscriptions;
- (int64_t)receiveInput:(id)a3;
- (int64_t)receiveInput:(id)a3 key:(id)a4 identifier:(id)a5;
- (void)cancel;
- (void)cancelWithKey:(id)a3 identifier:(id)a4;
- (void)receiveCompletion:(id)a3;
- (void)receiveCompletion:(id)a3 key:(id)a4 identifier:(id)a5;
- (void)receiveSubscription:(id)a3;
- (void)receiveSubscription:(id)a3 key:(id)a4 identifier:(id)a5;
- (void)requestDemand:(int64_t)a3;
- (void)requestDemand:(int64_t)a3 key:(id)a4 identifier:(id)a5;
@end

@implementation _BPSWindowerInner

- (_BPSWindowerInner)initWithDownstream:(id)a3 key:(id)a4 assigner:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)_BPSWindowerInner;
  v12 = [(_BPSWindowerInner *)&v30 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_downstream, a3);
    v14 = _Block_copy(v10);
    id key = v13->_key;
    v13->_id key = v14;

    objc_storeStrong((id *)&v13->_assigner, a5);
    v16 = [[BPSSubscriptionStatus alloc] initWithState:0 subscription:0];
    status = v13->_status;
    v13->_status = v16;

    v13->_demand = 0;
    v18 = (void *)MEMORY[0x1E4F1CC08];
    uint64_t v19 = [MEMORY[0x1E4F1CC08] mutableCopy];
    windows = v13->_windows;
    v13->_windows = (NSMutableDictionary *)v19;

    uint64_t v21 = [v18 mutableCopy];
    windowsDemand = v13->_windowsDemand;
    v13->_windowsDemand = (NSMutableDictionary *)v21;

    uint64_t v23 = [v18 mutableCopy];
    windowsBuffer = v13->_windowsBuffer;
    v13->_windowsBuffer = (NSMutableDictionary *)v23;

    uint64_t v25 = [v18 mutableCopy];
    windowsStatus = v13->_windowsStatus;
    v13->_windowsStatus = (NSMutableDictionary *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    buffer = v13->_buffer;
    v13->_buffer = (NSMutableArray *)v27;

    v13->_recursion = 0;
    v13->_sideRecursion = 0;
  }

  return v13;
}

- (void)receiveCompletion:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  os_unfair_lock_lock(&v5->_lock);
  if ([(BPSSubscriptionStatus *)v5->_status state] == 1)
  {
    p_lock = &v5->_lock;
    v32 = v4;
    v6 = (void *)MEMORY[0x1E4F1CBF0];
    v38 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v37 = (void *)[v6 mutableCopy];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obj = v5->_windowsStatus;
    uint64_t v35 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v35)
    {
      uint64_t v34 = *(void *)v44;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v44 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = v7;
          uint64_t v8 = *(void *)(*((void *)&v43 + 1) + 8 * v7);
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v9 = [(NSMutableDictionary *)v5->_windowsStatus objectForKeyedSubscript:v8];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v40 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v39 + 1) + 8 * i);
                v15 = [(NSMutableDictionary *)v5->_windows objectForKeyedSubscript:v8];
                v16 = [v15 objectForKeyedSubscript:v14];
                [v38 addObject:v16];

                v17 = [(NSMutableDictionary *)v5->_windowsStatus objectForKeyedSubscript:v8];
                v18 = [v17 objectForKeyedSubscript:v14];
                [v37 addObject:v18];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v11);
          }

          uint64_t v7 = v36 + 1;
        }
        while (v36 + 1 != v35);
        uint64_t v35 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v35);
    }

    id v4 = v32;
    if ([v38 count])
    {
      unint64_t v19 = 0;
      do
      {
        v20 = [v37 objectAtIndexedSubscript:v19];
        uint64_t v21 = [v20 state];

        if (v21 == 1)
        {
          os_unfair_lock_unlock(p_lock);
          v22 = [v38 objectAtIndexedSubscript:v19];
          [v22 receiveCompletion:v32];

          os_unfair_lock_lock(p_lock);
          uint64_t v23 = [v37 objectAtIndexedSubscript:v19];
          [v23 setState:2];

          v24 = [v37 objectAtIndexedSubscript:v19];
          [v24 setSubscription:0];
        }
        ++v19;
      }
      while ([v38 count] > v19);
    }
    [(BPSSubscriptionStatus *)v5->_status setState:2];
    [(BPSSubscriptionStatus *)v5->_status setSubscription:0];
    [(NSMutableDictionary *)v5->_windows removeAllObjects];
    [(NSMutableDictionary *)v5->_windowsDemand removeAllObjects];
    [(NSMutableDictionary *)v5->_windowsBuffer removeAllObjects];
    [(NSMutableDictionary *)v5->_windowsStatus removeAllObjects];
    uint64_t v25 = [(_BPSWindowerInner *)v5 downstream];
    uint64_t v26 = [v32 state];
    if (v26 == 1)
    {
      v29 = [v32 error];
      [(NSMutableArray *)v5->_buffer removeAllObjects];
      os_unfair_lock_unlock(p_lock);
      objc_super v30 = +[BPSCompletion failureWithError:v29];
      [v25 receiveCompletion:v30];
    }
    else
    {
      if (v26)
      {
LABEL_30:

        goto LABEL_31;
      }
      if (v5->_demand >= 1)
      {
        do
        {
          if (![(NSMutableArray *)v5->_buffer count]) {
            break;
          }
          --v5->_demand;
          uint64_t v27 = [(NSMutableArray *)v5->_buffer objectAtIndexedSubscript:0];
          [(NSMutableArray *)v5->_buffer removeObjectAtIndex:0];
          os_unfair_lock_unlock(p_lock);
          uint64_t v28 = [v25 receiveInput:v27];
          os_unfair_lock_lock(p_lock);
          v5->_demand += v28;
        }
        while (v5->_demand > 0);
      }
      os_unfair_lock_unlock(p_lock);
      v29 = +[BPSCompletion success];
      [v25 receiveCompletion:v29];
    }

    goto LABEL_30;
  }
  os_unfair_lock_unlock(&v5->_lock);
LABEL_31:
}

- (int64_t)receiveInput:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  v71 = v4;
  v6 = (*((void (**)(void))v5->_key + 2))();
  uint64_t v7 = (void *)[v6 copyWithZone:0];

  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if ([(BPSSubscriptionStatus *)v5->_status state] == 1)
  {
    id v9 = [(NSMutableDictionary *)v5->_windows objectForKeyedSubscript:v7];

    uint64_t v10 = &OBJC_IVAR___BMBookmarkClasses__addedCascadeSetsClasses;
    uint64_t v11 = &OBJC_IVAR___BMBookmarkClasses__addedCascadeSetsClasses;
    if (v9)
    {
      uint64_t v12 = [(NSMutableDictionary *)v5->_windows objectForKeyedSubscript:v7];
      v13 = [v12 allValues];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CC08];
      v15 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [(NSMutableDictionary *)v5->_windows setObject:v15 forKeyedSubscript:v7];

      v16 = (void *)[v14 mutableCopy];
      [(NSMutableDictionary *)v5->_windowsDemand setObject:v16 forKeyedSubscript:v7];

      v17 = (void *)[v14 mutableCopy];
      [(NSMutableDictionary *)v5->_windowsBuffer setObject:v17 forKeyedSubscript:v7];

      uint64_t v12 = (void *)[v14 mutableCopy];
      [(NSMutableDictionary *)v5->_windowsStatus setObject:v12 forKeyedSubscript:v7];
      v13 = (void *)MEMORY[0x1E4F1CBF0];
    }

    v18 = v5->_assigner;
    os_unfair_lock_unlock(&v5->_lock);
    v65 = v18;
    unint64_t v19 = [(BPSWindowAssigner *)v18 assignWindow:v13 input:v71];
    os_unfair_lock_lock(&v5->_lock);
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id obj = v19;
    uint64_t v72 = [obj countByEnumeratingWithState:&v77 objects:v82 count:16];
    if (v72)
    {
      v68 = v5;
      uint64_t v69 = *(void *)v78;
      v67 = v7;
      v70 = v13;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v78 != v69) {
            objc_enumerationMutation(obj);
          }
          uint64_t v73 = v20;
          uint64_t v21 = *(void **)(*((void *)&v77 + 1) + 8 * v20);
          v22 = [v21 identifier];
          if ([v13 containsObject:v21])
          {
            uint64_t v23 = v11[211];
            v24 = [*(id *)((char *)&v5->super.super.super.isa + v23) objectForKeyedSubscript:v7];
            uint64_t v25 = [v24 objectForKeyedSubscript:v22];
            [v25 addObject:v71];

            uint64_t v74 = v10[210];
            uint64_t v26 = [*(id *)((char *)&v5->super.super.super.isa + v74) objectForKeyedSubscript:v7];
            uint64_t v27 = [(_BPSWindowerSide *)v26 objectForKeyedSubscript:v22];
            if ([v27 integerValue] < 1)
            {
              v63 = v22;
            }
            else
            {
              [*(id *)((char *)&v5->super.super.super.isa + v23) objectForKeyedSubscript:v7];
              v29 = uint64_t v28 = v26;
              objc_super v30 = [v29 objectForKeyedSubscript:v22];
              uint64_t v76 = v23;
              uint64_t v31 = [v30 count];

              if (!v31) {
                goto LABEL_21;
              }
              while (1)
              {
                v32 = NSNumber;
                v33 = [*(id *)((char *)&v5->super.super.super.isa + v74) objectForKeyedSubscript:v7];
                uint64_t v34 = [v33 objectForKeyedSubscript:v22];
                uint64_t v35 = objc_msgSend(v32, "numberWithInteger:", objc_msgSend(v34, "integerValue") - 1);
                uint64_t v36 = [*(id *)((char *)&v5->super.super.super.isa + v74) objectForKeyedSubscript:v7];
                [v36 setObject:v35 forKeyedSubscript:v22];

                v37 = [*(id *)((char *)&v5->super.super.super.isa + v76) objectForKeyedSubscript:v7];
                v38 = [v37 objectForKeyedSubscript:v22];
                uint64_t v39 = [v38 objectAtIndexedSubscript:0];

                long long v40 = [*(id *)((char *)&v5->super.super.super.isa + v76) objectForKeyedSubscript:v7];
                long long v41 = [v40 objectForKeyedSubscript:v22];
                [v41 removeObjectAtIndex:0];

                long long v42 = [(NSMutableDictionary *)v5->_windows objectForKeyedSubscript:v7];
                uint64_t v27 = [v42 objectForKeyedSubscript:v22];

                os_unfair_lock_unlock(p_lock);
                v75 = (_BPSWindowerSide *)v39;
                uint64_t v43 = [v27 receiveInput:v39];
                long long v44 = p_lock;
                os_unfair_lock_lock(p_lock);
                long long v45 = NSNumber;
                long long v46 = [*(id *)((char *)&v5->super.super.super.isa + v74) objectForKeyedSubscript:v7];
                v47 = [v46 objectForKeyedSubscript:v22];
                v48 = objc_msgSend(v45, "numberWithInteger:", objc_msgSend(v47, "integerValue") + v43);
                uint64_t v49 = [*(id *)((char *)&v5->super.super.super.isa + v74) objectForKeyedSubscript:v7];
                [v49 setObject:v48 forKeyedSubscript:v22];

                v50 = [*(id *)((char *)&v5->super.super.super.isa + v74) objectForKeyedSubscript:v7];
                v51 = [v50 objectForKeyedSubscript:v22];
                if ([v51 integerValue] < 1) {
                  break;
                }
                v52 = [*(id *)((char *)&v5->super.super.super.isa + v76) objectForKeyedSubscript:v7];
                v53 = [v52 objectForKeyedSubscript:v22];
                uint64_t v54 = [v53 count];

                p_lock = v44;
                if (!v54) {
                  goto LABEL_21;
                }
              }
              v63 = v22;

              p_lock = v44;
              uint64_t v26 = v75;
            }
          }
          else
          {
            v55 = [(NSMutableDictionary *)v5->_windows objectForKeyedSubscript:v7];
            [v55 setObject:v21 forKeyedSubscript:v22];

            v56 = [*(id *)((char *)&v5->super.super.super.isa + v10[210]) objectForKeyedSubscript:v7];
            [v56 setObject:&unk_1F040EE80 forKeyedSubscript:v22];

            v81 = v71;
            v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
            p_isa = (id *)&v5->super.super.super.isa;
            v59 = (void *)[v57 mutableCopy];
            v60 = [*(id *)((char *)p_isa + v11[211]) objectForKeyedSubscript:v7];
            [v60 setObject:v59 forKeyedSubscript:v22];

            v61 = [[BPSSubscriptionStatus alloc] initWithState:0 subscription:v21];
            v62 = [p_isa[7] objectForKeyedSubscript:v7];
            [v62 setObject:v61 forKeyedSubscript:v22];

            uint64_t v27 = p_isa;
            os_unfair_lock_unlock(p_lock);
            v63 = v22;
            uint64_t v26 = [[_BPSWindowerSide alloc] initWithKey:v7 identifier:v22 windowerInner:v27];
            [v21 setDownstream:v26];
            [v21 receiveSubscription:v26];
            os_unfair_lock_lock(p_lock);
          }

          uint64_t v7 = v67;
          v5 = v68;
          v22 = v63;
LABEL_21:

          uint64_t v20 = v73 + 1;
          uint64_t v10 = &OBJC_IVAR___BMBookmarkClasses__addedCascadeSetsClasses;
          uint64_t v11 = &OBJC_IVAR___BMBookmarkClasses__addedCascadeSetsClasses;
          v13 = v70;
        }
        while (v73 + 1 != v72);
        uint64_t v72 = [obj countByEnumeratingWithState:&v77 objects:v82 count:16];
      }
      while (v72);
    }

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(&v5->_lock);
  }

  return 0;
}

- (void)receiveSubscription:(id)a3
{
  p_lock = &self->_lock;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  if ([(BPSSubscriptionStatus *)self->_status state])
  {
    os_unfair_lock_unlock(p_lock);
    [v8 cancel];
  }
  else
  {
    [(BPSSubscriptionStatus *)self->_status setState:1];
    [(BPSSubscriptionStatus *)self->_status setSubscription:v8];
    downstream = self->_downstream;
    v6 = self;
    uint64_t v7 = downstream;
    os_unfair_lock_unlock(p_lock);
    [(BPSSubscriber *)v7 receiveSubscription:v6];

    [v8 requestDemand:0x7FFFFFFFFFFFFFFFLL];
  }
}

- (void)cancel
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = self;
  p_lock = &v2->_lock;
  os_unfair_lock_lock(&v2->_lock);
  if ([(BPSSubscriptionStatus *)v2->_status state] == 1)
  {
    id v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v5 = v2->_windowsStatus;
    uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [(NSMutableDictionary *)v2->_windowsStatus objectForKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          uint64_t v11 = [v10 allValues];
          [v4 addObjectsFromArray:v11];
        }
        uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = v4;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v20 + 1) + 8 * j);
          if ([v17 state] == 1)
          {
            os_unfair_lock_unlock(p_lock);
            v18 = [v17 subscription];
            [v18 cancel];

            os_unfair_lock_lock(p_lock);
            [v17 setState:2];
            [v17 setSubscription:0];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v14);
    }

    [(BPSSubscriptionStatus *)v2->_status setState:2];
    [(NSMutableDictionary *)v2->_windows removeAllObjects];
    [(NSMutableDictionary *)v2->_windowsDemand removeAllObjects];
    [(NSMutableDictionary *)v2->_windowsBuffer removeAllObjects];
    [(NSMutableDictionary *)v2->_windowsStatus removeAllObjects];
    unint64_t v19 = [(BPSSubscriptionStatus *)v2->_status subscription];
    [(BPSSubscriptionStatus *)v2->_status setSubscription:0];
    os_unfair_lock_unlock(p_lock);
    [v19 cancel];
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)requestDemand:(int64_t)a3
{
  v5 = self;
  v16 = v5;
  if (a3 <= 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:v16 file:@"BPSWindower.m" lineNumber:308 description:@"Expecting demand to be greater than 0"];

    v5 = v16;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  uint64_t v7 = [(BPSSubscriptionStatus *)v16->_status state];
  uint64_t v8 = v16;
  if (v7 == 1 && !v16->_recursion)
  {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t demand = v16->_demand;
      if (demand != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = demand + a3;
        if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v9 = v11;
        }
      }
    }
    v16->_int64_t demand = v9;
    if (v9 >= 1)
    {
      do
      {
        if (![(NSMutableArray *)v8->_buffer count]) {
          break;
        }
        --v16->_demand;
        id v12 = [(NSMutableArray *)v16->_buffer objectAtIndexedSubscript:0];
        [(NSMutableArray *)v16->_buffer removeObjectAtIndex:0];
        uint64_t v13 = [(_BPSWindowerInner *)v16 downstream];
        v16->_recursion = 1;
        os_unfair_lock_unlock(p_lock);
        uint64_t v14 = [v13 receiveInput:v12];
        os_unfair_lock_lock(p_lock);
        v16->_recursion = 0;
        v16->_demand += v14;

        uint64_t v8 = v16;
      }
      while (v16->_demand > 0);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)receiveCompletion:(id)a3 key:(id)a4 identifier:(id)a5
{
  id v22 = a4;
  id v7 = a5;
  uint64_t v8 = self;
  os_unfair_lock_lock(&v8->_lock);
  if ([(BPSSubscriptionStatus *)v8->_status state] == 1)
  {
    uint64_t v9 = [(NSMutableDictionary *)v8->_windowsStatus objectForKeyedSubscript:v22];
    uint64_t v10 = [v9 objectForKeyedSubscript:v7];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      id v12 = [(NSMutableDictionary *)v8->_windowsStatus objectForKeyedSubscript:v22];
      uint64_t v13 = [v12 objectForKeyedSubscript:v7];
      uint64_t v14 = [v13 state];

      if (v14 != 1) {
        goto LABEL_6;
      }
      uint64_t v15 = [(NSMutableDictionary *)v8->_windowsStatus objectForKeyedSubscript:v22];
      v16 = [v15 objectForKeyedSubscript:v7];
      [v16 setState:2];

      v17 = [(NSMutableDictionary *)v8->_windowsStatus objectForKeyedSubscript:v22];
      v18 = [v17 objectForKeyedSubscript:v7];
      [v18 setSubscription:0];

      unint64_t v19 = [(NSMutableDictionary *)v8->_windows objectForKeyedSubscript:v22];
      [v19 removeObjectForKey:v7];

      long long v20 = [(NSMutableDictionary *)v8->_windowsDemand objectForKeyedSubscript:v22];
      [v20 removeObjectForKey:v7];

      long long v21 = [(NSMutableDictionary *)v8->_windowsBuffer objectForKeyedSubscript:v22];
      [v21 removeObjectForKey:v7];

      uint64_t v9 = [(NSMutableDictionary *)v8->_windowsStatus objectForKeyedSubscript:v22];
      [v9 removeObjectForKey:v7];
    }
  }
LABEL_6:
  os_unfair_lock_unlock(&v8->_lock);
}

- (int64_t)receiveInput:(id)a3 key:(id)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  p_lock = &v11->_lock;
  os_unfair_lock_lock(&v11->_lock);
  if ([(BPSSubscriptionStatus *)v11->_status state] == 1)
  {
    uint64_t v13 = [(NSMutableDictionary *)v11->_windowsStatus objectForKeyedSubscript:v9];
    uint64_t v14 = [v13 objectForKeyedSubscript:v10];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      v16 = [(NSMutableDictionary *)v11->_windowsStatus objectForKeyedSubscript:v9];
      v17 = [v16 objectForKeyedSubscript:v10];
      id v30 = v8;
      uint64_t v18 = [v17 state];

      BOOL v19 = v18 == 1;
      id v8 = v30;
      if (v19)
      {
        buffer = v11->_buffer;
        long long v21 = [BPSWindowerInput alloc];
        id v22 = [(NSMutableDictionary *)v11->_windows objectForKeyedSubscript:v9];
        long long v23 = [v22 objectForKeyedSubscript:v10];
        long long v24 = [v23 metadata];
        long long v25 = [(BPSWindowerInput *)v21 initWithAggregate:v30 key:v9 metadata:v24];
        [(NSMutableArray *)buffer addObject:v25];

        id v8 = v30;
        if (v11->_demand >= 1)
        {
          do
          {
            if (![(NSMutableArray *)v11->_buffer count]) {
              break;
            }
            --v11->_demand;
            long long v26 = [(NSMutableArray *)v11->_buffer objectAtIndexedSubscript:0];
            [(NSMutableArray *)v11->_buffer removeObjectAtIndex:0];
            long long v27 = [(_BPSWindowerInner *)v11 downstream];
            os_unfair_lock_unlock(p_lock);
            uint64_t v28 = [v27 receiveInput:v26];
            os_unfair_lock_lock(p_lock);
            v11->_demand += v28;
          }
          while (v11->_demand > 0);
        }
      }
    }
    else
    {
    }
  }
  os_unfair_lock_unlock(p_lock);

  return 0;
}

- (void)receiveSubscription:(id)a3 key:(id)a4 identifier:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  id v9 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(BPSSubscriptionStatus *)self->_status state] == 1)
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_windowsStatus objectForKeyedSubscript:v8];
    uint64_t v12 = [v11 objectForKeyedSubscript:v9];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      uint64_t v14 = [(NSMutableDictionary *)self->_windowsStatus objectForKeyedSubscript:v8];
      uint64_t v15 = [v14 objectForKeyedSubscript:v9];
      uint64_t v16 = [v15 state];

      if (!v16)
      {
        v17 = [(NSMutableDictionary *)self->_windowsStatus objectForKeyedSubscript:v8];
        uint64_t v18 = [v17 objectForKeyedSubscript:v9];
        [v18 setState:1];

        BOOL v19 = [(NSMutableDictionary *)self->_windowsStatus objectForKeyedSubscript:v8];
        long long v20 = [v19 objectForKeyedSubscript:v9];
        [v20 setSubscription:v21];

        os_unfair_lock_unlock(p_lock);
        [v21 requestDemand:0x7FFFFFFFFFFFFFFFLL];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  [v21 cancel];
LABEL_7:
}

- (void)cancelWithKey:(id)a3 identifier:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  id v7 = self;
  p_lock = &v7->_lock;
  os_unfair_lock_lock(&v7->_lock);
  if ([(BPSSubscriptionStatus *)v7->_status state] == 1)
  {
    id v9 = [(NSMutableDictionary *)v7->_windowsStatus objectForKeyedSubscript:v26];
    uint64_t v10 = [v9 objectForKeyedSubscript:v6];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = [(NSMutableDictionary *)v7->_windowsStatus objectForKeyedSubscript:v26];
      uint64_t v13 = [v12 objectForKeyedSubscript:v6];
      uint64_t v14 = [v13 state];

      if (v14 == 1)
      {
        uint64_t v15 = [(NSMutableDictionary *)v7->_windowsStatus objectForKeyedSubscript:v26];
        uint64_t v16 = [v15 objectForKeyedSubscript:v6];
        v17 = [v16 subscription];

        uint64_t v18 = [(NSMutableDictionary *)v7->_windowsStatus objectForKeyedSubscript:v26];
        BOOL v19 = [v18 objectForKeyedSubscript:v6];
        [v19 setState:2];

        long long v20 = [(NSMutableDictionary *)v7->_windows objectForKeyedSubscript:v26];
        [v20 removeObjectForKey:v6];

        id v21 = [(NSMutableDictionary *)v7->_windowsDemand objectForKeyedSubscript:v26];
        [v21 removeObjectForKey:v6];

        id v22 = [(NSMutableDictionary *)v7->_windowsBuffer objectForKeyedSubscript:v26];
        [v22 removeObjectForKey:v6];

        long long v23 = [(NSMutableDictionary *)v7->_windowsStatus objectForKeyedSubscript:v26];
        [v23 removeObjectForKey:v6];

        long long v24 = [(NSMutableDictionary *)v7->_windowsStatus objectForKeyedSubscript:v26];
        long long v25 = [v24 objectForKeyedSubscript:v6];
        [v25 setSubscription:0];

        os_unfair_lock_unlock(p_lock);
        [v17 cancel];

        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  os_unfair_lock_unlock(p_lock);
LABEL_7:
}

- (void)requestDemand:(int64_t)a3 key:(id)a4 identifier:(id)a5
{
  id v57 = a4;
  id v9 = a5;
  uint64_t v10 = self;
  if (a3 <= 0)
  {
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2 object:v10 file:@"BPSWindower.m" lineNumber:444 description:@"Expecting demand to be greater than 0"];
  }
  p_lock = &v10->_lock;
  os_unfair_lock_lock(&v10->_lock);
  if ([(BPSSubscriptionStatus *)v10->_status state] == 1)
  {
    uint64_t v12 = [(NSMutableDictionary *)v10->_windowsStatus objectForKeyedSubscript:v57];
    uint64_t v13 = [v12 objectForKeyedSubscript:v9];
    if (!v13)
    {
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(NSMutableDictionary *)v10->_windowsStatus objectForKeyedSubscript:v57];
    uint64_t v16 = [v15 objectForKeyedSubscript:v9];
    uint64_t v17 = [v16 state];

    if (v17 == 1 && !v10->_sideRecursion)
    {
      if (a3 == 0x7FFFFFFFFFFFFFFFLL
        || ([(NSMutableDictionary *)v10->_windowsDemand objectForKeyedSubscript:v57],
            uint64_t v18 = objc_claimAutoreleasedReturnValue(),
            [v18 objectForKeyedSubscript:v9],
            BOOL v19 = objc_claimAutoreleasedReturnValue(),
            uint64_t v20 = [v19 integerValue],
            v19,
            v18,
            v20 == 0x7FFFFFFFFFFFFFFFLL))
      {
        id v21 = [NSNumber numberWithInteger:0x7FFFFFFFFFFFFFFFLL];
      }
      else
      {
        id v22 = NSNumber;
        long long v23 = [(NSMutableDictionary *)v10->_windowsDemand objectForKeyedSubscript:v57];
        long long v24 = [v23 objectForKeyedSubscript:v9];
        uint64_t v25 = [v24 integerValue] + a3;

        if (v25 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v26 = v25;
        }
        id v21 = [v22 numberWithInteger:v26];
      }
      long long v27 = [(NSMutableDictionary *)v10->_windowsDemand objectForKeyedSubscript:v57];
      [v27 setObject:v21 forKeyedSubscript:v9];

      uint64_t v12 = [(NSMutableDictionary *)v10->_windowsDemand objectForKeyedSubscript:v57];
      uint64_t v28 = [v12 objectForKeyedSubscript:v9];
      if ([v28 integerValue] >= 1)
      {
        uint64_t v29 = 48;
        id v30 = [(NSMutableDictionary *)v10->_windowsBuffer objectForKeyedSubscript:v57];
        uint64_t v31 = [v30 objectForKeyedSubscript:v9];
        uint64_t v32 = [v31 count];

        if (!v32) {
          goto LABEL_23;
        }
        v56 = &v10->_lock;
        while (1)
        {
          v33 = NSNumber;
          uint64_t v34 = -[NSMutableDictionary objectForKeyedSubscript:](v10->_windowsDemand, "objectForKeyedSubscript:", v57, v56);
          uint64_t v35 = [v34 objectForKeyedSubscript:v9];
          uint64_t v36 = objc_msgSend(v33, "numberWithInteger:", objc_msgSend(v35, "integerValue") - 1);
          v37 = [(NSMutableDictionary *)v10->_windowsDemand objectForKeyedSubscript:v57];
          [v37 setObject:v36 forKeyedSubscript:v9];

          v38 = [*(id *)((char *)&v10->super.super.super.isa + v29) objectForKeyedSubscript:v57];
          uint64_t v39 = [v38 objectForKeyedSubscript:v9];
          uint64_t v12 = [v39 objectAtIndexedSubscript:0];

          long long v40 = [*(id *)((char *)&v10->super.super.super.isa + v29) objectForKeyedSubscript:v57];
          long long v41 = [v40 objectForKeyedSubscript:v9];
          [v41 removeObjectAtIndex:0];

          long long v42 = [(NSMutableDictionary *)v10->_windows objectForKeyedSubscript:v57];
          uint64_t v28 = [v42 objectForKeyedSubscript:v9];

          v10->_sideRecursion = 1;
          os_unfair_lock_unlock(p_lock);
          uint64_t v43 = [v28 receiveInput:v12];
          os_unfair_lock_lock(p_lock);
          v10->_sideRecursion = 0;
          long long v44 = NSNumber;
          long long v45 = [(NSMutableDictionary *)v10->_windowsDemand objectForKeyedSubscript:v57];
          [v45 objectForKeyedSubscript:v9];
          v47 = uint64_t v46 = v29;
          v48 = objc_msgSend(v44, "numberWithInteger:", objc_msgSend(v47, "integerValue") + v43);
          uint64_t v49 = [(NSMutableDictionary *)v10->_windowsDemand objectForKeyedSubscript:v57];
          [v49 setObject:v48 forKeyedSubscript:v9];

          v50 = [(NSMutableDictionary *)v10->_windowsDemand objectForKeyedSubscript:v57];
          v51 = [v50 objectForKeyedSubscript:v9];
          if ([v51 integerValue] < 1) {
            break;
          }
          v52 = [*(id *)((char *)&v10->super.super.super.isa + v46) objectForKeyedSubscript:v57];
          v53 = [v52 objectForKeyedSubscript:v9];
          uint64_t v54 = [v53 count];

          uint64_t v29 = v46;
          p_lock = v56;
          if (!v54) {
            goto LABEL_23;
          }
        }

        p_lock = v56;
      }

      goto LABEL_22;
    }
  }
LABEL_23:
  os_unfair_lock_unlock(p_lock);
}

- (id)upstreamSubscriptions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v4 = [(NSMutableDictionary *)self->_windowsStatus allKeys];
  v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_10];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_windowsStatus, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        uint64_t v12 = [v11 allValues];
        [v3 addObjectsFromArray:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = (void *)[v3 copy];
  return v13;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (id)key
{
  return self->_key;
}

- (BPSWindowAssigner)assigner
{
  return self->_assigner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assigner, 0);
  objc_storeStrong(&self->_key, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_windowsStatus, 0);
  objc_storeStrong((id *)&self->_windowsBuffer, 0);
  objc_storeStrong((id *)&self->_windowsDemand, 0);
  objc_storeStrong((id *)&self->_windows, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end