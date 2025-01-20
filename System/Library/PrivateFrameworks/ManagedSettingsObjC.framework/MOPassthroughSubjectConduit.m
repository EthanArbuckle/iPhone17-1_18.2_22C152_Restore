@interface MOPassthroughSubjectConduit
- (BOOL)active;
- (BOOL)hasDemand;
- (MOPassthroughSubject)parent;
- (MOPassthroughSubjectConduit)initWithDownstream:(id)a3 parent:(id)a4;
- (MOSubscriber)downstream;
- (NSObject)lock;
- (NSUUID)identifier;
- (unint64_t)currentDemand;
- (unint64_t)demand;
- (void)cancel;
- (void)dealloc;
- (void)finishWithCompletion:(id)a3;
- (void)offerInput:(id)a3;
- (void)requestDemand:(unint64_t)a3;
@end

@implementation MOPassthroughSubjectConduit

- (void)requestDemand:(unint64_t)a3
{
  obj = self->_lock;
  objc_sync_enter(obj);
  self->_demand = MOAddDemand(self->_demand, a3);
  objc_sync_exit(obj);
}

- (MOPassthroughSubjectConduit)initWithDownstream:(id)a3 parent:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MOPassthroughSubjectConduit;
  id v5 = a4;
  id v6 = a3;
  v7 = [(MOPassthroughSubjectConduit *)&v13 init];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", v13.receiver, v13.super_class);
  identifier = v7->_identifier;
  v7->_identifier = (NSUUID *)v8;

  objc_storeWeak((id *)&v7->_downstream, v6);
  objc_storeWeak((id *)&v7->_parent, v5);

  v7->_demand = 0;
  v7->_active = 1;
  uint64_t v10 = objc_opt_new();
  lock = v7->_lock;
  v7->_lock = v10;

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)dealloc
{
  [(MOPassthroughSubjectConduit *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MOPassthroughSubjectConduit;
  [(MOPassthroughSubjectConduit *)&v3 dealloc];
}

- (BOOL)hasDemand
{
  objc_super v3 = self->_lock;
  objc_sync_enter(v3);
  BOOL v4 = self->_active && self->_demand != 0;
  objc_sync_exit(v3);

  return v4;
}

- (unint64_t)currentDemand
{
  objc_super v3 = self->_lock;
  objc_sync_enter(v3);
  unint64_t demand = self->_demand;
  objc_sync_exit(v3);

  return demand;
}

- (void)offerInput:(id)a3
{
  id v8 = a3;
  BOOL v4 = self->_lock;
  objc_sync_enter(v4);
  if (self->_active && self->_demand)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_downstream);
    self->_unint64_t demand = MOSubtractDemand(self->_demand, 1uLL);
    objc_sync_exit(v4);

    uint64_t v6 = [WeakRetained receiveInput:v8];
    if (!v6) {
      goto LABEL_8;
    }
    uint64_t v7 = v6;
    BOOL v4 = self->_lock;
    objc_sync_enter(v4);
    if (self->_active) {
      self->_unint64_t demand = MOAddDemand(self->_demand, v7);
    }
  }
  else
  {
    id WeakRetained = 0;
  }
  objc_sync_exit(v4);

LABEL_8:
}

- (void)finishWithCompletion:(id)a3
{
  id v6 = a3;
  BOOL v4 = self->_lock;
  objc_sync_enter(v4);
  if (self->_active)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_downstream);
    objc_sync_exit(v4);

    [(MOPassthroughSubjectConduit *)self cancel];
    [WeakRetained receiveCompletion:v6];
    BOOL v4 = WeakRetained;
  }
  else
  {
    objc_sync_exit(v4);
  }
}

- (void)cancel
{
  obj = self->_lock;
  objc_sync_enter(obj);
  if (self->_active)
  {
    self->_active = 0;
    self->_unint64_t demand = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    objc_storeWeak((id *)&self->_parent, 0);
    objc_storeWeak((id *)&self->_downstream, 0);
    objc_sync_exit(obj);

    [WeakRetained disassociate:self->_identifier];
    BOOL v4 = WeakRetained;
  }
  else
  {
    objc_sync_exit(obj);
    BOOL v4 = obj;
  }
}

- (MOSubscriber)downstream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downstream);
  return (MOSubscriber *)WeakRetained;
}

- (MOPassthroughSubject)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (MOPassthroughSubject *)WeakRetained;
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
  objc_destroyWeak((id *)&self->_parent);
  objc_destroyWeak((id *)&self->_downstream);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end