@interface BPSFilter
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)canStoreInternalStateInBookmark;
- (BPSFilter)initWithUpstream:(id)a3 isIncluded:(id)a4;
- (BPSPublisher)upstream;
- (id)bookmarkableUpstreams;
- (id)isIncluded;
- (id)nextEvent;
- (id)upstreamPublishers;
- (void)setUpstream:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSFilter

- (id)upstreamPublishers
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(BPSFilter *)self upstream];
  if (v3)
  {
    v4 = [(BPSFilter *)self upstream];
    v7[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)nextEvent
{
  v3 = [(BPSFilter *)self upstream];
  v4 = [v3 nextEvent];

  if (v4)
  {
    do
    {
      v5 = [(BPSFilter *)self isIncluded];
      char v6 = ((uint64_t (**)(void, void *))v5)[2](v5, v4);

      if (v6) {
        break;
      }
      v7 = [(BPSFilter *)self upstream];
      uint64_t v8 = [v7 nextEvent];

      v4 = (void *)v8;
    }
    while (v8);
  }
  return v4;
}

- (id)isIncluded
{
  return self->_isIncluded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong(&self->_isIncluded, 0);
}

- (BPSFilter)initWithUpstream:(id)a3 isIncluded:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BPSFilter;
  v9 = [(BPSFilter *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upstream, a3);
    uint64_t v11 = [v8 copy];
    id isIncluded = v10->_isIncluded;
    v10->_id isIncluded = (id)v11;
  }
  return v10;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BPSFilter subscribe:]((uint64_t)self, v5);
  }

  char v6 = [_BPSFilterInner alloc];
  id v7 = [(BPSFilter *)self isIncluded];
  id v8 = [(_BPSFilterInner *)v6 initWithDownstream:v4 isIncluded:v7];

  v9 = [(BPSFilter *)self upstream];
  [v9 subscribe:v8];
}

- (void)setUpstream:(id)a3
{
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [BPSFilter alloc];
  v9 = [v7 objectAtIndexedSubscript:0];

  v10 = [v6 isIncluded];
  uint64_t v11 = [(BPSFilter *)v8 initWithUpstream:v9 isIncluded:v10];

  return v11;
}

- (id)bookmarkableUpstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSFilter *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

- (void)subscribe:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_debug_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_DEBUG, "%@ - subscribe", (uint8_t *)&v4, 0xCu);
}

@end