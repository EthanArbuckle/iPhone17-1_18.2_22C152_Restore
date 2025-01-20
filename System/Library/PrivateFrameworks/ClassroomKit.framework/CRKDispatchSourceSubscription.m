@interface CRKDispatchSourceSubscription
+ (id)subscriptionWithSource:(id)a3 handler:(id)a4;
- (CRKDispatchSourceSubscription)initWithSource:(id)a3 handler:(id)a4;
- (OS_dispatch_source)source;
- (id)handler;
- (void)cancel;
- (void)dealloc;
- (void)resume;
- (void)setHandler:(id)a3;
@end

@implementation CRKDispatchSourceSubscription

- (void)dealloc
{
  [(CRKDispatchSourceSubscription *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CRKDispatchSourceSubscription;
  [(CRKDispatchSourceSubscription *)&v3 dealloc];
}

- (CRKDispatchSourceSubscription)initWithSource:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKDispatchSourceSubscription;
  v9 = [(CRKDispatchSourceSubscription *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    uint64_t v11 = MEMORY[0x22A620AF0](v8);
    id handler = v10->_handler;
    v10->_id handler = (id)v11;
  }
  return v10;
}

+ (id)subscriptionWithSource:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[CRKDispatchSourceSubscription alloc] initWithSource:v6 handler:v5];

  [(CRKDispatchSourceSubscription *)v7 resume];

  return v7;
}

- (void)cancel
{
  objc_super v3 = [(CRKDispatchSourceSubscription *)self source];
  dispatch_source_cancel(v3);

  [(CRKDispatchSourceSubscription *)self setHandler:0];
}

- (void)resume
{
  objc_initWeak(&location, self);
  objc_super v3 = [(CRKDispatchSourceSubscription *)self source];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  id v7 = __39__CRKDispatchSourceSubscription_resume__block_invoke;
  id v8 = &unk_2646F3D40;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v3, &v5);

  v4 = [(CRKDispatchSourceSubscription *)self source];
  dispatch_resume(v4);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __39__CRKDispatchSourceSubscription_resume__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained handler];

    id WeakRetained = v4;
    if (v2)
    {
      objc_super v3 = [v4 handler];
      v3[2]();

      id WeakRetained = v4;
    }
  }
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end