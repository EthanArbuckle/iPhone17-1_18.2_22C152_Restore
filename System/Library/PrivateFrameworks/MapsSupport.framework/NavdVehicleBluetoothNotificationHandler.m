@interface NavdVehicleBluetoothNotificationHandler
- (NavdVehicleBluetoothNotificationHandler)initWithCiruitBoard:(id)a3 connectTriggers:(id)a4 connectConditions:(id)a5 disconnectTriggers:(id)a6 disconnectConditions:(id)a7 networkRequester:(id)a8 notifier:(id)a9;
- (id).cxx_construct;
@end

@implementation NavdVehicleBluetoothNotificationHandler

- (NavdVehicleBluetoothNotificationHandler)initWithCiruitBoard:(id)a3 connectTriggers:(id)a4 connectConditions:(id)a5 disconnectTriggers:(id)a6 disconnectConditions:(id)a7 networkRequester:(id)a8 notifier:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (GEOConfigGetBOOL())
  {
    v74.receiver = self;
    v74.super_class = (Class)NavdVehicleBluetoothNotificationHandler;
    v22 = [(NavdVehicleBluetoothNotificationHandler *)&v74 init];
    if (v22)
    {
      id v58 = v20;
      id v59 = v21;
      id v57 = v16;
      objc_initWeak(&location, v22);
      v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      sub_100020238(&v71, @"NavdVehicleBluetoothNotificationHandlerQueue", v23);
      dispatch_queue_t v24 = v71;
      dispatch_queue_t v71 = 0;
      innerQueue = v22->_queue._innerQueue;
      v22->_queue._innerQueue = (OS_dispatch_queue *)v24;

      v26 = v72;
      v72 = 0;
      name = v22->_queue._name;
      v22->_queue._name = v26;

      id v56 = v19;
      sub_10003244C(v22);
      id v28 = objc_alloc((Class)MapsSuggestionsActionCircuit);
      id v29 = objc_alloc((Class)MapsSuggestionsBlockAction);
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_100032588;
      v67[3] = &unk_10008AD98;
      objc_copyWeak(&v70, &location);
      id v30 = v19;
      id v68 = v30;
      id v31 = v21;
      id v69 = v31;
      id v32 = [v29 initWithName:@"BTDisconnectAction" block:v67];
      id v33 = [v28 initWithTriggers:v18 conditions:v30 action:v32];

      v55 = v33;
      id v34 = objc_alloc((Class)MapsSuggestionsActionCircuit);
      id v35 = objc_alloc((Class)MapsSuggestionsBlockAction);
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_1000329A8;
      v64[3] = &unk_10008ADC0;
      objc_copyWeak(&v66, &location);
      id v36 = v31;
      id v65 = v36;
      id v37 = [v35 initWithName:@"BTClearAction" block:v64];
      v38 = (MapsSuggestionsActionCircuit *)[v34 initWithTriggers:&__NSArray0__struct conditions:&__NSArray0__struct action:v37];
      clearCircuit = v22->_clearCircuit;
      v22->_clearCircuit = v38;

      id v40 = [v15 addCircuit:v22->_clearCircuit];
      id v41 = [v15 addCircuit:v33];
      id v42 = objc_alloc((Class)MapsSuggestionsBlockCondition);
      v43 = v22->_queue._innerQueue;
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_100032B54;
      v62[3] = &unk_10008ADE8;
      objc_copyWeak(&v63, &location);
      v44 = (MapsSuggestionsCondition *)[v42 initWithName:@"locationBudgetCondition" queue:v43 block:v62];
      locationBudgetCondition = v22->_locationBudgetCondition;
      v22->_locationBudgetCondition = v44;

      id v46 = [v17 mutableCopy];
      [v46 addObject:v22->_locationBudgetCondition];
      id v47 = objc_alloc((Class)MapsSuggestionsActionCircuit);
      id v48 = [v46 copy];
      v49 = [NavdVehicleBluetoothConnectAction alloc];
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_100032DFC;
      v60[3] = &unk_1000896E8;
      objc_copyWeak(&v61, &location);
      v50 = [(NavdVehicleBluetoothConnectAction *)v49 initWithConditions:v17 networkRequester:v58 notifier:v36 completionHandler:v60];
      id v16 = v57;
      id v51 = [v47 initWithTriggers:v57 conditions:v48 type:2 action:v50];

      id v52 = [v15 addCircuit:v51];
      objc_destroyWeak(&v61);

      objc_destroyWeak(&v63);
      objc_destroyWeak(&v66);

      objc_destroyWeak(&v70);
      objc_destroyWeak(&location);
      id v19 = v56;
      id v20 = v58;
      id v21 = v59;
    }
    self = v22;
    v53 = self;
  }
  else
  {
    v53 = 0;
  }

  return v53;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budgetLocation, 0);
  objc_storeStrong((id *)&self->_locationBudgetCondition, 0);
  objc_storeStrong((id *)&self->_navigationStartedTrigger, 0);
  objc_storeStrong((id *)&self->_departureTrigger, 0);
  objc_storeStrong((id *)&self->_clearCircuit, 0);

  innerQueue = self->_queue._innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end