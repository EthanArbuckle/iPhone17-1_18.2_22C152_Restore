@interface HFWiFiExecutionEnvironmentObserver
- (HFExecutionEnvironment)environment;
- (HFHomeKitDispatcher)dispatcher;
- (HFWiFiExecutionEnvironmentObserver)initWithExecutionEnvironment:(id)a3 dispatcher:(id)a4;
- (HMHome)lastKnownHome;
- (unint64_t)lastKnownRunningState;
- (void)_updateState;
- (void)dealloc;
- (void)setLastKnownHome:(id)a3;
- (void)setLastKnownRunningState:(unint64_t)a3;
@end

@implementation HFWiFiExecutionEnvironmentObserver

- (HFWiFiExecutionEnvironmentObserver)initWithExecutionEnvironment:(id)a3 dispatcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFWiFiExecutionEnvironmentObserver;
  v8 = [(HFWiFiExecutionEnvironmentObserver *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeWeak((id *)&v9->_dispatcher, v7);
    [(HFWiFiExecutionEnvironmentObserver *)v9 _updateState];
    [v6 addObserver:v9];
    [v7 addHomeManagerObserver:v9];
  }

  return v9;
}

- (void)_updateState
{
  v3 = [(HFWiFiExecutionEnvironmentObserver *)self dispatcher];
  id v13 = [v3 home];

  if (v13
    || ([(HFWiFiExecutionEnvironmentObserver *)self lastKnownHome],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    id v5 = [(HFWiFiExecutionEnvironmentObserver *)self lastKnownHome];

    unint64_t v6 = [(HFWiFiExecutionEnvironmentObserver *)self lastKnownRunningState];
    id v7 = [(HFWiFiExecutionEnvironmentObserver *)self environment];
    uint64_t v8 = [v7 runningState];

    if (v13 == v5)
    {
      if (v6 == v8) {
        goto LABEL_11;
      }
    }
    else
    {
      v9 = [(HFWiFiExecutionEnvironmentObserver *)self lastKnownHome];
      [v9 stopDiscoveringSymptomsForNearbyDevices];

      [(HFWiFiExecutionEnvironmentObserver *)self setLastKnownHome:v13];
    }
    v10 = [(HFWiFiExecutionEnvironmentObserver *)self environment];
    -[HFWiFiExecutionEnvironmentObserver setLastKnownRunningState:](self, "setLastKnownRunningState:", [v10 runningState]);

    unint64_t v11 = [(HFWiFiExecutionEnvironmentObserver *)self lastKnownRunningState];
    if (v11)
    {
      if (v11 != 1) {
        goto LABEL_11;
      }
      v12 = [(HFWiFiExecutionEnvironmentObserver *)self lastKnownHome];
      [v12 stopDiscoveringSymptomsForNearbyDevices];
    }
    else
    {
      v12 = [(HFWiFiExecutionEnvironmentObserver *)self lastKnownHome];
      [v12 startDiscoveringSymptomsForNearbyDevices];
    }
  }
LABEL_11:
}

- (HMHome)lastKnownHome
{
  return self->_lastKnownHome;
}

- (unint64_t)lastKnownRunningState
{
  return self->_lastKnownRunningState;
}

- (HFExecutionEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (HFExecutionEnvironment *)WeakRetained;
}

- (HFHomeKitDispatcher)dispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatcher);
  return (HFHomeKitDispatcher *)WeakRetained;
}

- (void)setLastKnownRunningState:(unint64_t)a3
{
  self->_lastKnownRunningState = a3;
}

- (void)setLastKnownHome:(id)a3
{
}

- (void)dealloc
{
  v3 = [(HFWiFiExecutionEnvironmentObserver *)self dispatcher];
  [v3 removeHomeManagerObserver:self];

  v4 = [(HFWiFiExecutionEnvironmentObserver *)self environment];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)HFWiFiExecutionEnvironmentObserver;
  [(HFWiFiExecutionEnvironmentObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownHome, 0);
  objc_destroyWeak((id *)&self->_dispatcher);
  objc_destroyWeak((id *)&self->_environment);
}

@end