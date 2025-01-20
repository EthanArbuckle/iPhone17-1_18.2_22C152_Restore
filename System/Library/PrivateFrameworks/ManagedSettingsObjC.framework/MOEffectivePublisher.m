@interface MOEffectivePublisher
- (MOEffectivePublisher)initWithInterestedGroups:(id)a3;
- (MOSettingsPublisherBase)base;
- (id)sinkWithReceiveInput:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation MOEffectivePublisher

- (void).cxx_destruct
{
}

- (MOEffectivePublisher)initWithInterestedGroups:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MOEffectivePublisher;
  v5 = [(MOPublisher *)&v16 initPublisher];
  if ([v4 count])
  {
    v6 = +[MOSubscriptionCenter sharedCenter];
    v7 = [v6 effectiveSubject];

    v8 = (void *)[v4 copy];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__MOEffectivePublisher_initWithInterestedGroups___block_invoke;
    v14[3] = &unk_1E61CBCB8;
    id v15 = v8;
    id v9 = v8;
    v10 = (void *)MEMORY[0x1BA9CEAC0](v14);
    v11 = [[MOSettingsPublisherBase alloc] initWithUpstream:v7 interestedGroups:v9 startBlock:v10 stopBlock:&__block_literal_global];
    base = v5->_base;
    v5->_base = v11;
  }
  return v5;
}

void __49__MOEffectivePublisher_initWithInterestedGroups___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MOSubscriptionCenter sharedCenter];
  [v4 subscribeForEffectiveChanges:*(void *)(a1 + 32) identifier:v3];
}

- (id)sinkWithReceiveInput:(id)a3
{
  id v4 = a3;
  v5 = [[MOSink alloc] initWithCompletion:&__block_literal_global_87 receiveInput:v4];

  [(MOEffectivePublisher *)self subscribe:v5];
  return v5;
}

- (void)subscribe:(id)a3
{
}

void __49__MOEffectivePublisher_initWithInterestedGroups___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[MOSubscriptionCenter sharedCenter];
  [v3 unsubscribeFromEffectiveChanges:v2];
}

- (MOSettingsPublisherBase)base
{
  return self->_base;
}

@end