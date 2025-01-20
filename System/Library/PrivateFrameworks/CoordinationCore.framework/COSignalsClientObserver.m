@interface COSignalsClientObserver
- (BOOL)canDispatch;
- (BOOL)isEqual:(id)a3;
- (COHomeKitAccessoryMemento)accessory;
- (COSignalsClientObserver)initWithConnection:(id)a3 asAccessory:(id)a4 constraints:(id)a5 cluster:(id)a6;
- (COSignalsClientObserver)initWithConnection:(id)a3 cluster:(id)a4;
- (NSSet)constraints;
- (OS_nw_activity)dispatchabilityStallActivity;
- (unint64_t)dispatchabilityStallCount;
- (void)setCanDispatch:(BOOL)a3;
- (void)setDispatchabilityStallActivity:(id)a3;
- (void)setDispatchabilityStallCount:(unint64_t)a3;
@end

@implementation COSignalsClientObserver

- (COSignalsClientObserver)initWithConnection:(id)a3 cluster:(id)a4
{
  return [(COClientObserver *)self initWithConnection:a3 domain:@"signals" cluster:a4];
}

- (COSignalsClientObserver)initWithConnection:(id)a3 asAccessory:(id)a4 constraints:(id)a5 cluster:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = [(COSignalsClientObserver *)self initWithConnection:a3 cluster:a6];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    accessory = v12->_accessory;
    v12->_accessory = (COHomeKitAccessoryMemento *)v13;

    uint64_t v15 = [v11 copy];
    constraints = v12->_constraints;
    v12->_constraints = (NSSet *)v15;
  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COSignalsClientObserver;
  if ([(COClientObserver *)&v9 isEqual:v4])
  {
    v5 = [(COSignalsClientObserver *)self constraints];
    v6 = [v4 constraints];
    if (v5 == v6) {
      char v7 = 1;
    }
    else {
      char v7 = [v5 isEqual:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (COHomeKitAccessoryMemento)accessory
{
  return self->_accessory;
}

- (NSSet)constraints
{
  return self->_constraints;
}

- (BOOL)canDispatch
{
  return self->_canDispatch;
}

- (void)setCanDispatch:(BOOL)a3
{
  self->_canDispatch = a3;
}

- (OS_nw_activity)dispatchabilityStallActivity
{
  return self->_dispatchabilityStallActivity;
}

- (void)setDispatchabilityStallActivity:(id)a3
{
}

- (unint64_t)dispatchabilityStallCount
{
  return self->_dispatchabilityStallCount;
}

- (void)setDispatchabilityStallCount:(unint64_t)a3
{
  self->_dispatchabilityStallCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchabilityStallActivity, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
}

@end