@interface BPSHandleEvents
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BPSHandleEvents)initWithUpstream:(id)a3 receiveOutput:(id)a4 receiveCancel:(id)a5;
- (BPSHandleEvents)initWithUpstream:(id)a3 receiveSubscription:(id)a4 receiveOutput:(id)a5 receiveCompletion:(id)a6 receiveCancel:(id)a7 receiveRequest:(id)a8;
- (BPSPublisher)upstream;
- (id)bookmarkableUpstreams;
- (id)nextEvent;
- (id)receiveCancel;
- (id)receiveCompletion;
- (id)receiveOutput;
- (id)receiveRequest;
- (id)receiveSubscription;
- (id)upstreamPublishers;
- (void)cancel;
- (void)subscribe:(id)a3;
@end

@implementation BPSHandleEvents

- (BPSHandleEvents)initWithUpstream:(id)a3 receiveSubscription:(id)a4 receiveOutput:(id)a5 receiveCompletion:(id)a6 receiveCancel:(id)a7 receiveRequest:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v34.receiver = self;
  v34.super_class = (Class)BPSHandleEvents;
  v21 = [(BPSHandleEvents *)&v34 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_upstream, a3);
    uint64_t v23 = [v16 copy];
    id receiveSubscription = v22->_receiveSubscription;
    v22->_id receiveSubscription = (id)v23;

    uint64_t v25 = [v17 copy];
    id receiveOutput = v22->_receiveOutput;
    v22->_id receiveOutput = (id)v25;

    uint64_t v27 = [v18 copy];
    id receiveCompletion = v22->_receiveCompletion;
    v22->_id receiveCompletion = (id)v27;

    uint64_t v29 = [v19 copy];
    id receiveCancel = v22->_receiveCancel;
    v22->_id receiveCancel = (id)v29;

    uint64_t v31 = [v20 copy];
    id receiveRequest = v22->_receiveRequest;
    v22->_id receiveRequest = (id)v31;

    v22->_lock._os_unfair_lock_opaque = 0;
  }

  return v22;
}

- (BPSHandleEvents)initWithUpstream:(id)a3 receiveOutput:(id)a4 receiveCancel:(id)a5
{
  return [(BPSHandleEvents *)self initWithUpstream:a3 receiveSubscription:&__block_literal_global_1 receiveOutput:a4 receiveCompletion:&__block_literal_global_85_0 receiveCancel:a5 receiveRequest:&__block_literal_global_88];
}

- (void)subscribe:(id)a3
{
  upstream = self->_upstream;
  id v5 = a3;
  v6 = [[_BPSHandleEventsInner alloc] initWithDownstream:v5 handleEvents:self];

  [(BPSPublisher *)upstream subscribe:v6];
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = [BPSHandleEvents alloc];
  v9 = [v7 firstObject];

  v10 = [v6 receiveSubscription];
  v11 = [v6 receiveOutput];
  v12 = [v6 receiveCompletion];
  v13 = [v6 receiveCancel];
  v14 = [v6 receiveRequest];
  id v15 = [(BPSHandleEvents *)v8 initWithUpstream:v9 receiveSubscription:v10 receiveOutput:v11 receiveCompletion:v12 receiveCancel:v13 receiveRequest:v14];

  return v15;
}

- (id)bookmarkableUpstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSHandleEvents *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSHandleEvents *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)nextEvent
{
  v3 = [(BPSHandleEvents *)self upstream];
  v4 = [v3 nextEvent];

  if (v4)
  {
    id v5 = [(BPSHandleEvents *)self receiveOutput];
    ((void (**)(void, void *))v5)[2](v5, v4);
  }
  return v4;
}

- (void)cancel
{
  v2 = [(BPSHandleEvents *)self receiveCancel];
  v2[2]();
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)receiveSubscription
{
  return self->_receiveSubscription;
}

- (id)receiveOutput
{
  return self->_receiveOutput;
}

- (id)receiveCompletion
{
  return self->_receiveCompletion;
}

- (id)receiveCancel
{
  return self->_receiveCancel;
}

- (id)receiveRequest
{
  return self->_receiveRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receiveRequest, 0);
  objc_storeStrong(&self->_receiveCancel, 0);
  objc_storeStrong(&self->_receiveCompletion, 0);
  objc_storeStrong(&self->_receiveOutput, 0);
  objc_storeStrong(&self->_receiveSubscription, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

@end