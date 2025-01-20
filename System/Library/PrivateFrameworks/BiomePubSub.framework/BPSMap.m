@interface BPSMap
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BPSMap)initWithUpstream:(id)a3 transform:(id)a4;
- (BPSPublisher)upstream;
- (id)bookmarkableUpstreams;
- (id)nextEvent;
- (id)transform;
- (id)upstreamPublishers;
- (void)setTransform:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSMap

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSMap *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)nextEvent
{
  v3 = [(BPSMap *)self upstream];
  v4 = [v3 nextEvent];

  if (v4)
  {
    while (1)
    {
      v5 = [(BPSMap *)self transform];
      v6 = ((void (**)(void, void *))v5)[2](v5, v4);

      if (v6) {
        break;
      }
      v7 = [(BPSMap *)self upstream];
      uint64_t v8 = [v7 nextEvent];

      v4 = (void *)v8;
      if (!v8) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    v6 = 0;
  }
  return v6;
}

- (id)transform
{
  return self->_transform;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transform, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (BPSMap)initWithUpstream:(id)a3 transform:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BPSMap;
  v9 = [(BPSMap *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upstream, a3);
    uint64_t v11 = [v8 copy];
    id transform = v10->_transform;
    v10->_id transform = (id)v11;
  }
  return v10;
}

- (void)subscribe:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_1AD01F000, v5, OS_LOG_TYPE_INFO, "%@ - subscribe", (uint8_t *)&v11, 0xCu);
  }
  id v7 = [_BPSMapInner alloc];
  id v8 = [(BPSMap *)self transform];
  v9 = [(_BPSMapInner *)v7 initWithDownstream:v4 transform:v8];

  v10 = [(BPSMap *)self upstream];
  [v10 subscribe:v9];
}

- (void)setTransform:(id)a3
{
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [BPSMap alloc];
  v9 = [v7 objectAtIndexedSubscript:0];

  v10 = [v6 transform];
  int v11 = [(BPSMap *)v8 initWithUpstream:v9 transform:v10];

  return v11;
}

- (id)bookmarkableUpstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSMap *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end