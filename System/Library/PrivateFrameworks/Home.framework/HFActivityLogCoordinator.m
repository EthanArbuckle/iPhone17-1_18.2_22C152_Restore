@interface HFActivityLogCoordinator
- (BOOL)eventsExist;
- (HFActivityLogCoordinator)initWithHome:(id)a3;
- (HFActivityLogCoordinatorDelegate)delegate;
- (HFActivityLogCoordinator_Swift)coordinator;
- (HMHome)home;
- (void)checkIfEventsExist;
- (void)setDelegate:(id)a3;
- (void)setEventsExist:(BOOL)a3;
@end

@implementation HFActivityLogCoordinator

- (HFActivityLogCoordinator)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFActivityLogCoordinator;
  v6 = [(HFActivityLogCoordinator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = [[HFActivityLogCoordinator_Swift alloc] initWithHome:v5];
    coordinator = v7->_coordinator;
    v7->_coordinator = v8;

    v7->_eventsExist = 0;
  }

  return v7;
}

- (void)checkIfEventsExist
{
  objc_initWeak(&location, self);
  v3 = [(HFActivityLogCoordinator *)self coordinator];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__HFActivityLogCoordinator_checkIfEventsExist__block_invoke;
  v4[3] = &unk_264099FD0;
  objc_copyWeak(&v5, &location);
  [v3 eventsExistWithCompletionHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__HFActivityLogCoordinator_checkIfEventsExist__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a3 && WeakRetained)
  {
    id v7 = WeakRetained;
    [WeakRetained setEventsExist:a2];
    v6 = [v7 delegate];
    [v6 activityLogCoordinator:v7 didDetermineEventsExist:a2];

    id WeakRetained = v7;
  }
}

- (HMHome)home
{
  return self->_home;
}

- (HFActivityLogCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFActivityLogCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)eventsExist
{
  return self->_eventsExist;
}

- (void)setEventsExist:(BOOL)a3
{
  self->_eventsExist = a3;
}

- (HFActivityLogCoordinator_Swift)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_home, 0);
}

@end