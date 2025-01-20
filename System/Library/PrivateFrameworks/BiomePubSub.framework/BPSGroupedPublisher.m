@interface BPSGroupedPublisher
- (BPSGroupedPublisher)initWithUpstream:(id)a3 createSubject:(id)a4;
- (BPSMulticast)multicast;
- (id)aggregateWithInitial:(id)a3 nextPartialResult:(id)a4;
- (id)subscribeOnKey:(id)a3;
- (void)connect;
- (void)setMulticast:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSGroupedPublisher

- (void)connect
{
}

- (id)aggregateWithInitial:(id)a3 nextPartialResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BPSGroupedPublisher *)self multicast];
  int v9 = BPSPipelineSupportsPullBasedPublishers(v8);

  v10 = [(BPSGroupedPublisher *)self multicast];
  v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v10 toPublisher];

    v11 = (void *)v12;
  }
  v13 = objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__BPSGroupedPublisher_GroupBy__aggregateWithInitial_nextPartialResult___block_invoke;
  v18[3] = &unk_1E5E76520;
  id v19 = v6;
  id v20 = v7;
  id v14 = v7;
  id v15 = v6;
  v16 = [v11 reduceWithInitial:v13 nextPartialResult:v18];

  return v16;
}

- (BPSMulticast)multicast
{
  return self->_multicast;
}

- (void).cxx_destruct
{
}

- (BPSGroupedPublisher)initWithUpstream:(id)a3 createSubject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BPSGroupedPublisher;
  v8 = [(BPSGroupedPublisher *)&v12 init];
  if (v8)
  {
    int v9 = [[BPSMulticast alloc] initWithUpstream:v6 createSubject:v7];
    multicast = v8->_multicast;
    v8->_multicast = v9;
  }
  return v8;
}

- (void)subscribe:(id)a3
{
}

- (void)setMulticast:(id)a3
{
}

- (id)subscribeOnKey:(id)a3
{
  id v4 = a3;
  v5 = [(BPSGroupedPublisher *)self multicast];
  int v6 = BPSPipelineSupportsPullBasedPublishers(v5);

  id v7 = [(BPSGroupedPublisher *)self multicast];
  v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 toPublisher];

    v8 = (void *)v9;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__BPSGroupedPublisher_GroupBy__subscribeOnKey___block_invoke;
  v14[3] = &unk_1E5E764F8;
  id v15 = v4;
  id v10 = v4;
  v11 = [v8 filterWithIsIncluded:v14];
  objc_super v12 = [v11 mapWithTransform:&__block_literal_global_7];

  return v12;
}

uint64_t __47__BPSGroupedPublisher_GroupBy__subscribeOnKey___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 first];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

uint64_t __47__BPSGroupedPublisher_GroupBy__subscribeOnKey___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 second];
}

id __71__BPSGroupedPublisher_GroupBy__aggregateWithInitial_nextPartialResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 first];
  v8 = [v5 objectForKeyedSubscript:v7];

  if (!v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [v6 first];
    [v5 setObject:v9 forKeyedSubscript:v10];
  }
  uint64_t v11 = *(void *)(a1 + 40);
  objc_super v12 = [v6 first];
  v13 = [v5 objectForKeyedSubscript:v12];
  id v14 = [v6 second];
  id v15 = (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v13, v14);
  v16 = [v6 first];
  [v5 setObject:v15 forKeyedSubscript:v16];

  return v5;
}

@end