@interface BPSFlatMap
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)canStoreInternalStateInBookmark;
- (BOOL)completed;
- (BPSFlatMap)initWithUpstream:(id)a3 maxPublishers:(int64_t)a4 transform:(id)a5;
- (BPSPublisher)currentPublisher;
- (BPSPublisher)upstream;
- (BPSSubscriber)subscriber;
- (id)bookmark;
- (id)bookmarkableUpstreams;
- (id)currentEvent;
- (id)nextEvent;
- (id)startWithSubscriber:(id)a3;
- (id)transform;
- (id)upstreamPublishers;
- (id)validateBookmark:(id)a3;
- (int64_t)maxPublishers;
- (void)applyBookmark:(id)a3;
- (void)reset;
- (void)setCurrentEvent:(id)a3;
- (void)setCurrentPublisher:(id)a3;
- (void)setSubscriber:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSFlatMap

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSFlatMap *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)startWithSubscriber:(id)a3
{
  id v4 = a3;
  [(BPSFlatMap *)self setSubscriber:v4];
  v7.receiver = self;
  v7.super_class = (Class)BPSFlatMap;
  v5 = [(BPSPublisher *)&v7 startWithSubscriber:v4];

  return v5;
}

- (void)setSubscriber:(id)a3
{
}

- (void)reset
{
  [(BPSFlatMap *)self setCurrentPublisher:0];
  [(BPSFlatMap *)self setCurrentEvent:0];
  [(BPSFlatMap *)self setSubscriber:0];
  v3.receiver = self;
  v3.super_class = (Class)BPSFlatMap;
  [(BPSPublisher *)&v3 reset];
}

- (id)nextEvent
{
  uint64_t v3 = [(BPSFlatMap *)self currentPublisher];
  if (!v3) {
    goto LABEL_16;
  }
  id v4 = (void *)v3;
  v5 = [(BPSFlatMap *)self currentPublisher];
  char v6 = [v5 completed];

  if ((v6 & 1) != 0
    || ([(BPSFlatMap *)self currentPublisher],
        objc_super v7 = objc_claimAutoreleasedReturnValue(),
        [v7 nextEvent],
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
LABEL_16:
    while (1)
    {
      uint64_t v9 = [(BPSFlatMap *)self currentPublisher];
      if (v9)
      {
        v10 = (void *)v9;
        v11 = [(BPSFlatMap *)self currentPublisher];
        int v12 = [v11 completed];

        if (!v12) {
          goto LABEL_9;
        }
      }
      v13 = [(BPSFlatMap *)self upstream];
      v14 = [v13 nextEvent];

      if (!v14)
      {
LABEL_9:
        v8 = 0;
        goto LABEL_11;
      }
      v15 = [(BPSFlatMap *)self transform];
      v16 = ((void (**)(void, void *))v15)[2](v15, v14);

      v17 = [(BPSFlatMap *)self subscriber];
      id v18 = (id)[v16 startWithSubscriber:v17];

      v19 = [(BPSFlatMap *)self currentPublisher];
      [v19 reset];

      [(BPSFlatMap *)self setCurrentPublisher:v16];
      [(BPSFlatMap *)self setCurrentEvent:v14];
      v20 = [(BPSFlatMap *)self currentPublisher];
      v8 = [v20 nextEvent];

      if (v8) {
        break;
      }
    }
  }
LABEL_11:
  return v8;
}

- (BPSPublisher)currentPublisher
{
  return self->_currentPublisher;
}

- (void)setCurrentPublisher:(id)a3
{
}

- (void)setCurrentEvent:(id)a3
{
}

- (id)transform
{
  return self->_transform;
}

- (BPSSubscriber)subscriber
{
  return self->_subscriber;
}

- (BOOL)completed
{
  uint64_t v3 = [(BPSFlatMap *)self currentPublisher];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(BPSFlatMap *)self currentPublisher];
    int v6 = [v5 completed];

    if (!v6) {
      return 0;
    }
  }
  objc_super v7 = [(BPSFlatMap *)self upstream];
  char v8 = [v7 completed];

  return v8;
}

- (id)bookmark
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BPSFlatMap *)self currentPublisher];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(BPSFlatMap *)self currentEvent];

    if (v5)
    {
      int v6 = [(BPSFlatMap *)self currentPublisher];
      int v7 = [v6 conformsToProtocol:&unk_1F0410F80];

      if (v7)
      {
        char v8 = [(BPSFlatMap *)self currentPublisher];
        if ([(id)objc_opt_class() isPipelineBookmarkable:v8])
        {
          uint64_t v9 = [v8 bookmarkNode];
          v13[0] = @"currentEvent";
          v10 = [(BPSFlatMap *)self currentEvent];
          v13[1] = @"currentPublisherBookmark";
          v14[0] = v10;
          v14[1] = v9;
          v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

          goto LABEL_8;
        }
      }
    }
  }
  v11 = 0;
LABEL_8:
  return v11;
}

- (id)currentEvent
{
  return self->_currentEvent;
}

- (BPSFlatMap)initWithUpstream:(id)a3 maxPublishers:(int64_t)a4 transform:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BPSFlatMap;
  v11 = [(BPSFlatMap *)&v16 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_upstream, a3);
    v12->_maxPublishers = a4;
    uint64_t v13 = [v10 copy];
    id transform = v12->_transform;
    v12->_id transform = (id)v13;
  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong(&self->_currentEvent, 0);
  objc_storeStrong((id *)&self->_currentPublisher, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong(&self->_transform, 0);
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v5 = [_BPSFlatMapOuter alloc];
  int64_t v6 = [(BPSFlatMap *)self maxPublishers];
  int v7 = [(BPSFlatMap *)self transform];
  id v9 = [(_BPSFlatMapOuter *)v5 initWithDownstream:v4 maxPublishers:v6 map:v7];

  [v4 receiveSubscription:v9];
  char v8 = [(BPSFlatMap *)self upstream];
  [v8 subscribe:v9];
}

- (id)validateBookmark:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    int v7 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [v4 objectForKeyedSubscript:@"currentEvent"];
    if (v5)
    {
      int64_t v6 = [v4 objectForKeyedSubscript:@"currentPublisherBookmark"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v7 = 0;
LABEL_11:

        goto LABEL_12;
      }
      id v13 = [NSString alloc];
      uint64_t v14 = objc_opt_class();
      int v12 = (void *)[v13 initWithFormat:@"%@ expected current publisher bookmark node of class %@, but received %@", v14, objc_opt_class(), v4];
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19 = v12;
      objc_super v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      int v7 = [v15 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v16];
    }
    else
    {
      int64_t v6 = (void *)[[NSString alloc] initWithFormat:@"%@ expected current event, but received nil", objc_opt_class()];
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v21 = v6;
      int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      int v7 = [v11 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v12];
    }

    goto LABEL_11;
  }
  id v8 = [NSString alloc];
  uint64_t v9 = objc_opt_class();
  id v4 = (id)[v8 initWithFormat:@"%@ expected bookmark dictionary of class %@, but received %@", v9, objc_opt_class(), v3];
  id v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v22 = *MEMORY[0x1E4F28568];
  v23[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  int v7 = [v10 errorWithDomain:@"BiomePubSubError" code:2 userInfo:v5];
LABEL_12:

LABEL_13:
  return v7;
}

- (void)applyBookmark:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    v5 = [v4 objectForKeyedSubscript:@"currentEvent"];
    int64_t v6 = [v13 objectForKeyedSubscript:@"currentPublisherBookmark"];
    [(BPSFlatMap *)self setCurrentEvent:v5];
    int v7 = [(BPSFlatMap *)self transform];
    id v8 = [(BPSFlatMap *)self currentEvent];
    uint64_t v9 = ((void (**)(void, void *))v7)[2](v7, v8);
    [(BPSFlatMap *)self setCurrentPublisher:v9];

    if (v6)
    {
      id v10 = [(BPSFlatMap *)self currentPublisher];
      int v11 = [v10 conformsToProtocol:&unk_1F0410F80];

      if (v11)
      {
        int v12 = [(BPSFlatMap *)self currentPublisher];
        [v12 applyBookmarkNode:v6];
      }
    }

    id v4 = v13;
  }
}

- (int64_t)maxPublishers
{
  return self->_maxPublishers;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [BPSFlatMap alloc];
  uint64_t v9 = [v7 objectAtIndexedSubscript:0];

  uint64_t v10 = [v6 maxPublishers];
  int v11 = [v6 transform];
  int v12 = [(BPSFlatMap *)v8 initWithUpstream:v9 maxPublishers:v10 transform:v11];

  return v12;
}

- (id)bookmarkableUpstreams
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(BPSFlatMap *)self upstream];
  if (v3)
  {
    id v4 = [(BPSFlatMap *)self upstream];
    v7[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

@end