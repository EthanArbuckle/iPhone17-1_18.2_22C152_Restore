@interface MOSettingsPublisherConduit
- (BOOL)active;
- (MOSettingsPublisherConduit)initWithDownstream:(id)a3 interestedGroups:(id)a4 startBlock:(id)a5 stopBlock:(id)a6;
- (MOSubscriber)downstream;
- (MOSubscription)upstream;
- (NSObject)lock;
- (NSSet)interestedGroups;
- (NSUUID)identifier;
- (id)startBlock;
- (id)stopBlock;
- (unint64_t)currentDemand;
- (unint64_t)demand;
- (unint64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(unint64_t)a3;
@end

@implementation MOSettingsPublisherConduit

- (MOSettingsPublisherConduit)initWithDownstream:(id)a3 interestedGroups:(id)a4 startBlock:(id)a5 stopBlock:(id)a6
{
  v10 = (NSSet *)a4;
  v26.receiver = self;
  v26.super_class = (Class)MOSettingsPublisherConduit;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = [(MOSubscriber *)&v26 initSubscriber];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", v26.receiver, v26.super_class);
  identifier = v14->_identifier;
  v14->_identifier = (NSUUID *)v15;

  objc_storeWeak((id *)&v14->_downstream, v13);
  interestedGroups = v14->_interestedGroups;
  v14->_interestedGroups = v10;
  v18 = v10;

  uint64_t v19 = MEMORY[0x1BA9CEAC0](v12);
  id startBlock = v14->_startBlock;
  v14->_id startBlock = (id)v19;

  uint64_t v21 = MEMORY[0x1BA9CEAC0](v11);
  id stopBlock = v14->_stopBlock;
  v14->_id stopBlock = (id)v21;

  v14->_demand = 0;
  v14->_active = 1;
  uint64_t v23 = objc_opt_new();
  lock = v14->_lock;
  v14->_lock = v23;

  return v14;
}

- (void)receiveSubscription:(id)a3
{
  id v9 = a3;
  v5 = self->_lock;
  objc_sync_enter(v5);
  if (self->_active
    && (id v6 = objc_loadWeakRetained((id *)&self->_downstream)) != 0
    && (upstream = self->_upstream, v6, !upstream))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_downstream);
    objc_storeStrong((id *)&self->_upstream, a3);
    objc_sync_exit(v5);

    [WeakRetained receiveSubscription:self];
  }
  else
  {
    objc_sync_exit(v5);

    [v9 cancel];
  }
}

- (void)requestDemand:(unint64_t)a3
{
  v5 = self->_lock;
  objc_sync_enter(v5);
  if (self->_active)
  {
    unint64_t demand = self->_demand;
    v8 = self->_upstream;
    self->_unint64_t demand = MOAddDemand(self->_demand, a3);
    objc_sync_exit(v5);

    if (!demand) {
      (*((void (**)(void))self->_startBlock + 2))();
    }
    [(MOSubscription *)v8 requestDemand:a3];
    v7 = v8;
  }
  else
  {
    objc_sync_exit(v5);
    v7 = v5;
  }
}

- (void)dealloc
{
  [(MOSettingsPublisherConduit *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MOSettingsPublisherConduit;
  [(MOSettingsPublisherConduit *)&v3 dealloc];
}

- (unint64_t)currentDemand
{
  objc_super v3 = self->_lock;
  objc_sync_enter(v3);
  unint64_t demand = self->_demand;
  objc_sync_exit(v3);

  return demand;
}

- (unint64_t)receiveInput:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 mutableCopy];
  id v6 = self->_lock;
  objc_sync_enter(v6);
  if (self->_active
    && (id v7 = objc_loadWeakRetained((id *)&self->_downstream)) != 0
    && (v18 = v5, demand = self->_demand, v7, BOOL v9 = demand == 0, v5 = v18, !v9))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_downstream);
    [v18 intersectSet:self->_interestedGroups];
    if ([v18 count])
    {
      unint64_t v11 = MOSubtractDemand(self->_demand, 1uLL);
      self->_unint64_t demand = v11;
      BOOL v12 = v11 == 0;
    }
    else
    {
      BOOL v12 = 0;
    }
    objc_sync_exit(v6);

    if ([v18 count])
    {
      BOOL v15 = v12;
      v16 = (void *)[v18 copy];
      uint64_t v13 = [WeakRetained receiveInput:v16];

      if (v13)
      {
        v17 = self->_lock;
        objc_sync_enter(v17);
        if (self->_active)
        {
          self->_unint64_t demand = MOAddDemand(self->_demand, v13);
          objc_sync_exit(v17);

LABEL_18:
          v5 = v18;
          goto LABEL_7;
        }
        objc_sync_exit(v17);
      }
      else if (v15)
      {
        (*((void (**)(void))self->_stopBlock + 2))();
      }
      uint64_t v13 = 0;
      goto LABEL_18;
    }
    uint64_t v13 = MODemandMax(1);
    v5 = v18;
  }
  else
  {
    objc_sync_exit(v6);

    id WeakRetained = 0;
    uint64_t v13 = 0;
  }
LABEL_7:

  return v13;
}

- (void)receiveCompletion:(id)a3
{
  id v7 = a3;
  id v4 = self->_lock;
  objc_sync_enter(v4);
  if (self->_active && (id v5 = objc_loadWeakRetained((id *)&self->_downstream), v5, v5))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_downstream);
    objc_sync_exit(v4);

    [(MOSettingsPublisherConduit *)self cancel];
    [WeakRetained receiveCompletion:v7];
    id v4 = WeakRetained;
  }
  else
  {
    objc_sync_exit(v4);
  }
}

- (void)cancel
{
  objc_super v3 = self->_lock;
  objc_sync_enter(v3);
  if (self->_active)
  {
    unint64_t demand = self->_demand;
    id v7 = self->_upstream;
    self->_active = 0;
    self->_unint64_t demand = 0;
    objc_storeWeak((id *)&self->_downstream, 0);
    upstream = self->_upstream;
    self->_upstream = 0;

    objc_sync_exit(v3);
    if (demand) {
      (*((void (**)(void))self->_stopBlock + 2))();
    }
    [(MOSubscription *)v7 cancel];
    id v6 = v7;
  }
  else
  {
    objc_sync_exit(v3);
    id v6 = v3;
  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (MOSubscriber)downstream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downstream);
  return (MOSubscriber *)WeakRetained;
}

- (MOSubscription)upstream
{
  return self->_upstream;
}

- (NSSet)interestedGroups
{
  return self->_interestedGroups;
}

- (id)startBlock
{
  return self->_startBlock;
}

- (id)stopBlock
{
  return self->_stopBlock;
}

- (unint64_t)demand
{
  return self->_demand;
}

- (BOOL)active
{
  return self->_active;
}

- (NSObject)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_stopBlock, 0);
  objc_storeStrong(&self->_startBlock, 0);
  objc_storeStrong((id *)&self->_interestedGroups, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_destroyWeak((id *)&self->_downstream);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end