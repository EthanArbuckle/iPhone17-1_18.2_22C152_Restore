@interface NavdVehicleBluetoothStatus
- (BOOL)connected;
- (NavdVehicleBluetoothStatus)initWithCircuitBoard:(id)a3 connectTriggers:(id)a4 disconnectTriggers:(id)a5;
- (id)carConnectCondition;
- (id)carConnectTrigger;
- (id)carDisconnectCondition;
- (id)carDisconnectTrigger;
@end

@implementation NavdVehicleBluetoothStatus

- (NavdVehicleBluetoothStatus)initWithCircuitBoard:(id)a3 connectTriggers:(id)a4 disconnectTriggers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v47.receiver = self;
  v47.super_class = (Class)NavdVehicleBluetoothStatus;
  v11 = [(NavdVehicleBluetoothStatus *)&v47 init];
  if (v11)
  {
    v12 = (MapsSuggestionsQueue *)[objc_alloc((Class)MapsSuggestionsQueue) initSerialQueueWithName:@"NavdVehicleBluetoothStatusQueue"];
    queue = v11->_queue;
    v11->_queue = v12;

    id v14 = objc_alloc((Class)MapsSuggestionsSimpleTrigger);
    v15 = [(MapsSuggestionsQueue *)v11->_queue innerQueue];
    v16 = (MapsSuggestionsSimpleTrigger *)[v14 initWithName:@"CarConnectTrigger" queue:v15];
    outOnCarConnectTrigger = v11->_outOnCarConnectTrigger;
    v11->_outOnCarConnectTrigger = v16;

    id v18 = objc_alloc((Class)MapsSuggestionsSimpleTrigger);
    v19 = [(MapsSuggestionsQueue *)v11->_queue innerQueue];
    v20 = (MapsSuggestionsSimpleTrigger *)[v18 initWithName:@"CarDisconnectTrigger" queue:v19];
    outOnCarDisconnectTrigger = v11->_outOnCarDisconnectTrigger;
    v11->_outOnCarDisconnectTrigger = v20;

    objc_initWeak(&location, v11);
    id v22 = objc_alloc((Class)MapsSuggestionsBlockCondition);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100039A8C;
    v44[3] = &unk_10008BD20;
    objc_copyWeak(&v45, &location);
    v23 = (MapsSuggestionsBlockCondition *)[v22 initWithName:@"CarConnectedCondition" block:v44];
    carConnectCondition = v11->_carConnectCondition;
    v11->_carConnectCondition = v23;

    id v25 = objc_alloc((Class)MapsSuggestionsBlockCondition);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100039BA0;
    v42[3] = &unk_10008BD20;
    objc_copyWeak(&v43, &location);
    v26 = (MapsSuggestionsBlockCondition *)[v25 initWithName:@"CarDisconnectedCondition" block:v42];
    carDisconnectCondition = v11->_carDisconnectCondition;
    v11->_carDisconnectCondition = v26;

    id v41 = v9;
    id v28 = v9;
    objc_initWeak(from, v11);
    id v29 = objc_alloc((Class)MapsSuggestionsActionCircuit);
    id v30 = objc_alloc((Class)MapsSuggestionsBlockAction);
    v48 = _NSConcreteStackBlock;
    uint64_t v49 = 3221225472;
    v50 = sub_100039CB4;
    v51 = &unk_10008BD48;
    objc_copyWeak(&v52, from);
    id v31 = [v30 initWithName:@"onConnecAction" block:&v48];
    id v32 = [v29 initWithTriggers:v28 action:v31];

    objc_destroyWeak(&v52);
    objc_destroyWeak(from);

    id v33 = [v8 addCircuit:v32];
    id v34 = v10;
    objc_initWeak(from, v11);
    id v35 = objc_alloc((Class)MapsSuggestionsActionCircuit);
    id v36 = objc_alloc((Class)MapsSuggestionsBlockAction);
    v48 = _NSConcreteStackBlock;
    uint64_t v49 = 3221225472;
    v50 = sub_100039ED0;
    v51 = &unk_10008BD48;
    objc_copyWeak(&v52, from);
    id v37 = [v36 initWithName:@"onConnecAction" block:&v48];
    id v38 = [v35 initWithTriggers:v34 action:v37];

    objc_destroyWeak(&v52);
    objc_destroyWeak(from);

    id v39 = [v8 addCircuit:v38];
    objc_destroyWeak(&v43);
    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
    id v9 = v41;
  }

  return v11;
}

- (BOOL)connected
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL connected = v2->_connected;
  objc_sync_exit(v2);

  return connected;
}

- (id)carConnectTrigger
{
  return self->_outOnCarConnectTrigger;
}

- (id)carDisconnectTrigger
{
  return self->_outOnCarDisconnectTrigger;
}

- (id)carConnectCondition
{
  return self->_carConnectCondition;
}

- (id)carDisconnectCondition
{
  return self->_carDisconnectCondition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_carDisconnectCondition, 0);
  objc_storeStrong((id *)&self->_carConnectCondition, 0);
  objc_storeStrong((id *)&self->_outOnCarDisconnectTrigger, 0);

  objc_storeStrong((id *)&self->_outOnCarConnectTrigger, 0);
}

@end