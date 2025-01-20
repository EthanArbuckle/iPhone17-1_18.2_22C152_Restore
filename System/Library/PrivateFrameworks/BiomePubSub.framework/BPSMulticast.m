@interface BPSMulticast
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)canStoreInternalStateInBookmark;
- (BOOL)completedForMulticastDownstream:(id)a3;
- (BOOL)connected;
- (BPSMulticast)initWithUpstream:(id)a3 createSubject:(id)a4;
- (BPSMulticastDownstream)electedMainDownstream;
- (BPSPublisher)upstream;
- (NSMutableArray)downstreams;
- (NSMutableDictionary)pendingEvents;
- (id)bookmark;
- (id)bookmarkableUpstreams;
- (id)createSubject;
- (id)lazySubject;
- (id)nextEvent;
- (id)nextEventForMulticastDownstream:(id)a3;
- (id)startWithSubscriber:(id)a3;
- (id)toPublisher;
- (id)upstreamPublishers;
- (id)validateBookmark:(id)a3;
- (unint64_t)bookmarkCount;
- (unint64_t)resetCount;
- (void)_connect;
- (void)applyBookmark:(id)a3;
- (void)applyBookmarkNode:(id)a3;
- (void)connect;
- (void)registerMulticastDownstream:(id)a3;
- (void)requestNextEvents;
- (void)reset;
- (void)setBookmarkCount:(unint64_t)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDownstreams:(id)a3;
- (void)setElectedMainDownstream:(id)a3;
- (void)setPendingEvents:(id)a3;
- (void)setResetCount:(unint64_t)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSMulticast

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSMulticast *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)nextEventForMulticastDownstream:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(BPSMulticast *)self connected])
  {
    id v14 = 0;
    goto LABEL_25;
  }
  v5 = [(BPSMulticast *)self pendingEvents];
  uint64_t v6 = [v4 identifier];
  v7 = [v5 objectForKeyedSubscript:v6];

  v8 = [(BPSMulticast *)self electedMainDownstream];
  LOBYTE(v6) = [v8 isEqual:v4];

  uint64_t v9 = [v7 count];
  if (v6)
  {
    if (!v9)
    {
      v10 = [(BPSMulticast *)self upstream];
      v11 = [v10 nextEvent];

      if (v11)
      {
        v25 = v7;
        id v26 = v4;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id obj = [(BPSMulticast *)self downstreams];
        uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          id v14 = 0;
          uint64_t v15 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v29 != v15) {
                objc_enumerationMutation(obj);
              }
              v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              v18 = [(BPSMulticast *)self electedMainDownstream];
              int v19 = [v18 isEqual:v17];

              if (v19)
              {
                v20 = v14;
                id v14 = v11;
              }
              else
              {
                v21 = [(BPSMulticast *)self pendingEvents];
                v22 = [v17 identifier];
                v20 = [v21 objectForKeyedSubscript:v22];

                [v20 addObject:v11];
                v23 = [v17 subscriber];
                [v23 requestNextEvents];
              }
            }
            uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v13);
        }
        else
        {
          id v14 = 0;
        }

        v7 = v25;
        id v4 = v26;
      }
      else
      {
        id v14 = 0;
      }

      goto LABEL_24;
    }
  }
  else if (!v9)
  {
    id v14 = 0;
    goto LABEL_24;
  }
  id v14 = [v7 objectAtIndex:0];
  [v7 removeObjectAtIndex:0];
LABEL_24:

LABEL_25:
  return v14;
}

- (BOOL)completedForMulticastDownstream:(id)a3
{
  id v4 = a3;
  v5 = [(BPSMulticast *)self pendingEvents];
  uint64_t v6 = [v4 identifier];

  v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 count];

  if (v8) {
    return 0;
  }
  v10 = [(BPSMulticast *)self upstream];
  char v11 = [v10 completed];

  return v11;
}

- (NSMutableDictionary)pendingEvents
{
  return self->_pendingEvents;
}

- (BPSMulticastDownstream)electedMainDownstream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_electedMainDownstream);
  return (BPSMulticastDownstream *)WeakRetained;
}

- (BOOL)connected
{
  return self->_connected;
}

- (id)startWithSubscriber:(id)a3
{
  return 0;
}

- (id)bookmark
{
  v8[2] = *MEMORY[0x1E4F143B8];
  [(BPSMulticast *)self setBookmarkCount:[(BPSMulticast *)self bookmarkCount] + 1];
  pendingEvents = self->_pendingEvents;
  v7[0] = @"pendingEvents";
  v7[1] = @"bookmarkCount";
  v8[0] = pendingEvents;
  id v4 = [NSNumber numberWithUnsignedInteger:self->_bookmarkCount];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)reset
{
  [(BPSMulticast *)self setResetCount:[(BPSMulticast *)self resetCount] + 1];
  unint64_t v3 = [(BPSMulticast *)self resetCount];
  id v4 = [(BPSMulticast *)self downstreams];
  uint64_t v5 = [v4 count];

  if (v3 == v5)
  {
    [(BPSMulticast *)self setResetCount:0];
    [(BPSMulticast *)self setConnected:0];
    uint64_t v6 = objc_opt_new();
    [(BPSMulticast *)self setPendingEvents:v6];

    v7 = objc_opt_new();
    [(BPSMulticast *)self setDownstreams:v7];

    [(BPSMulticast *)self setElectedMainDownstream:0];
    [(BPSMulticast *)self setBookmarkCount:0];
    v8.receiver = self;
    v8.super_class = (Class)BPSMulticast;
    [(BPSPublisher *)&v8 reset];
  }
}

- (void)setResetCount:(unint64_t)a3
{
  self->_resetCount = a3;
}

- (unint64_t)resetCount
{
  return self->_resetCount;
}

- (void)setBookmarkCount:(unint64_t)a3
{
  self->_bookmarkCount = a3;
}

- (void)setPendingEvents:(id)a3
{
}

- (void)setDownstreams:(id)a3
{
}

- (void)requestNextEvents
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v3 = [(BPSMulticast *)self downstreams];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [(BPSMulticast *)self setElectedMainDownstream:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        objc_super v8 = [(BPSMulticast *)self electedMainDownstream];
        uint64_t v9 = [v8 subscriber];
        [v9 requestNextEvents];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)setElectedMainDownstream:(id)a3
{
}

- (void)registerMulticastDownstream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BPSMulticast *)self downstreams];
  [v5 addObject:v4];

  uint64_t v6 = NSNumber;
  uint64_t v7 = [(BPSMulticast *)self downstreams];
  objc_super v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  [v4 setIdentifier:v8];

  id v11 = (id)objc_opt_new();
  uint64_t v9 = [(BPSMulticast *)self pendingEvents];
  long long v10 = [v4 identifier];

  [v9 setObject:v11 forKeyedSubscript:v10];
}

- (NSMutableArray)downstreams
{
  return self->_downstreams;
}

- (unint64_t)bookmarkCount
{
  return self->_bookmarkCount;
}

- (void)_connect
{
  unint64_t v3 = [(BPSMulticast *)self upstream];
  id v4 = (id)[v3 startWithSubscriber:self];

  [(BPSMulticast *)self setConnected:1];
  [(BPSMulticast *)self requestNextEvents];
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (id)toPublisher
{
  unint64_t v3 = [[BPSMulticastDownstream alloc] initWithMulticast:self];
  [(BPSMulticast *)self registerMulticastDownstream:v3];
  return v3;
}

- (BPSMulticast)initWithUpstream:(id)a3 createSubject:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BPSMulticast;
  uint64_t v9 = [(BPSMulticast *)&v18 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upstream, a3);
    uint64_t v11 = [v8 copy];
    id createSubject = v10->_createSubject;
    v10->_id createSubject = (id)v11;

    v10->_lock._os_unfair_lock_opaque = 0;
    v10->_connected = 0;
    v10->_bookmarkCount = 0;
    v10->_resetCount = 0;
    uint64_t v13 = objc_opt_new();
    downstreams = v10->_downstreams;
    v10->_downstreams = (NSMutableArray *)v13;

    uint64_t v15 = objc_opt_new();
    pendingEvents = v10->_pendingEvents;
    v10->_pendingEvents = (NSMutableDictionary *)v15;

    objc_storeWeak((id *)&v10->_electedMainDownstream, 0);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_electedMainDownstream);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_downstreams, 0);
  objc_storeStrong(&self->_createSubject, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

- (void)connect
{
  if (self->_createSubject)
  {
    id v3 = [(BPSMulticast *)self lazySubject];
    [(BPSPublisher *)self->_upstream subscribe:v3];
  }
  else
  {
    [(BPSMulticast *)self _connect];
  }
}

- (id)nextEvent
{
  return 0;
}

- (id)validateBookmark:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [NSString alloc];
    uint64_t v9 = objc_opt_class();
    id v4 = (id)[v8 initWithFormat:@"%@ expected bookmark of class %@, but received %@", v9, objc_opt_class(), v3];
    long long v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v7 = [v10 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v5];
    goto LABEL_12;
  }
  id v4 = v3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"pendingEvents"];
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v11 = [NSString alloc];
    uint64_t v12 = objc_opt_class();
    uint64_t v6 = (void *)[v11 initWithFormat:@"%@ expected pendingEvents of class %@, but received %@", v12, objc_opt_class(), v5];
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23 = v6;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v7 = [v13 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v14];
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"bookmarkCount"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v15 = [NSString alloc];
    uint64_t v16 = objc_opt_class();
    id v14 = (void *)[v15 initWithFormat:@"%@ expected bookmarkCount of class %@, but received %@", v16, objc_opt_class(), v6];
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21 = v14;
    objc_super v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v7 = [v17 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v18];

    goto LABEL_10;
  }
  id v7 = 0;
LABEL_11:

LABEL_12:
  return v7;
}

- (void)applyBookmark:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"pendingEvents"];
  [(BPSMulticast *)self setPendingEvents:v4];
}

- (void)applyBookmarkNode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BMBookmarkablePublisher *)self validateBookmarkNode:v4];

  if (!v5)
  {
    uint64_t v6 = [v4 value];
    id v7 = [v6 objectForKeyedSubscript:@"bookmarkCount"];
    uint64_t v8 = [v7 unsignedIntegerValue];

    uint64_t v9 = [(BPSMulticast *)self downstreams];
    uint64_t v10 = [v9 count];

    if (v8 == v10)
    {
      id v11 = [v4 value];
      [(BPSMulticast *)self applyBookmark:v11];

      uint64_t v12 = objc_opt_class();
      uint64_t v13 = [(BPSMulticast *)self upstreamPublishers];
      id v14 = [v12 bookmarkablePublishersFromPublishers:v13];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __34__BPSMulticast_applyBookmarkNode___block_invoke;
      v15[3] = &unk_1E5E76078;
      id v16 = v4;
      [v14 enumerateObjectsUsingBlock:v15];
    }
  }
}

void __34__BPSMulticast_applyBookmarkNode___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = [v4 upstreams];
  uint64_t v6 = [v7 objectAtIndexedSubscript:a3];
  [v5 applyBookmarkNode:v6];
}

- (id)lazySubject
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = self->_subject;
  if (!v5)
  {
    (*((void (**)(void))self->_createSubject + 2))();
    id v5 = (BPSSubject *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"BPSMulticast.m" lineNumber:481 description:@"createSubject block must return nonnil object"];
    }
    objc_storeStrong((id *)&self->_subject, v5);
  }
  os_unfair_lock_unlock(p_lock);
  uint64_t v6 = v5;

  return v6;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_BPSMulticastInner alloc] initWithDownstream:v4];

  id v5 = [(BPSMulticast *)self lazySubject];
  [v5 subscribe:v6];
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if ([v7 count])
  {
    uint64_t v9 = [BPSMulticast alloc];
    uint64_t v10 = [v7 objectAtIndexedSubscript:0];
    id v11 = [v8 createSubject];
    uint64_t v12 = [(BPSMulticast *)v9 initWithUpstream:v10 createSubject:v11];
  }
  else
  {
    uint64_t v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[BPSMulticast publisherWithPublisher:upstreams:bookmarkState:](v13);
    }

    uint64_t v12 = (BPSMulticast *)v8;
  }

  return v12;
}

- (id)bookmarkableUpstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSMulticast *)self upstream];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

- (id)createSubject
{
  return self->_createSubject;
}

+ (void)publisherWithPublisher:(os_log_t)log upstreams:bookmarkState:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AD01F000, log, OS_LOG_TYPE_ERROR, "Can't create publisher with bookmark", v1, 2u);
}

@end