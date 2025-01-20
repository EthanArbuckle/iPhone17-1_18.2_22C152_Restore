@interface NavdVehicleBluetoothConnectAction
- (NSString)uniqueName;
- (NavdVehicleBluetoothConnectAction)initWithConditions:(id)a3 networkRequester:(id)a4 notifier:(id)a5 completionHandler:(id)a6;
- (id).cxx_construct;
- (void)actWithHandler:(id)a3;
@end

@implementation NavdVehicleBluetoothConnectAction

- (NavdVehicleBluetoothConnectAction)initWithConditions:(id)a3 networkRequester:(id)a4 notifier:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)NavdVehicleBluetoothConnectAction;
  v15 = [(NavdVehicleBluetoothConnectAction *)&v27 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_conditions, a3);
    objc_storeStrong((id *)&v16->_networkRequester, a4);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    sub_100020238(&v25, @"NavdVehicleBluetoothConnectActionQueue", v17);
    dispatch_queue_t v18 = v25;
    dispatch_queue_t v25 = 0;
    innerQueue = v16->_queue._innerQueue;
    v16->_queue._innerQueue = (OS_dispatch_queue *)v18;

    v20 = v26;
    v26 = 0;
    name = v16->_queue._name;
    v16->_queue._name = v20;

    objc_storeStrong((id *)&v16->_notifier, a5);
    id v22 = [v14 copy];
    id handler = v16->_handler;
    v16->_id handler = v22;
  }
  return v16;
}

- (void)actWithHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021138;
  block[3] = &unk_100089AF0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  innerQueue = self->_queue._innerQueue;
  id v6 = v4;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentBTNotificationLocationTimestamps, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_etaRequester, 0);
  objc_storeStrong((id *)&self->_etaRequirements, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_conditions, 0);

  innerQueue = self->_queue._innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end