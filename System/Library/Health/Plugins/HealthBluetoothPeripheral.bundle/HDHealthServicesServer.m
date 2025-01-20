@interface HDHealthServicesServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDHealthServicesServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)connectionInterrupted;
- (void)remote_addPairingForHealthService:(id)a3 withCompletion:(id)a4;
- (void)remote_addPeripheral:(id)a3 name:(id)a4 forServices:(id)a5 withCompletion:(id)a6;
- (void)remote_beginBluetoothStatusUpdates:(id)a3;
- (void)remote_endBluetoothStatusUpdates;
- (void)remote_endHealthServiceDiscovery:(unint64_t)a3;
- (void)remote_endHealthServiceSession:(unint64_t)a3;
- (void)remote_fetchSupportedServiceIDsWithCompletion:(id)a3;
- (void)remote_getEnabledStatusForPeripheral:(id)a3 withCompletion:(id)a4;
- (void)remote_getHealthPeripheralsWithFilter:(unint64_t)a3 handler:(id)a4;
- (void)remote_getHealthServiceProperty:(id)a3 forSession:(unint64_t)a4 withHandler:(id)a5;
- (void)remote_getSupportedPropertyNamesWithHandler:(id)a3;
- (void)remote_performHealthServiceOperation:(id)a3 onSession:(unint64_t)a4 withParameters:(id)a5 completion:(id)a6;
- (void)remote_removePairingForHealthService:(id)a3 withCompletion:(id)a4;
- (void)remote_removePeripheral:(id)a3 withCompletion:(id)a4;
- (void)remote_setEnabledStatus:(BOOL)a3 forPeripheral:(id)a4 withCompletion:(id)a5;
- (void)remote_startHealthServiceDiscovery:(int64_t)a3 withCompletion:(id)a4;
- (void)remote_startHealthServiceSession:(id)a3 withCompletion:(id)a4;
@end

@implementation HDHealthServicesServer

- (HDHealthServicesServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDHealthServicesServer;
  v11 = [(HDHealthServicesServer *)&v18 initWithUUID:a3 configuration:a4 client:v10 delegate:a6];
  if (v11)
  {
    uint64_t v12 = HKCreateSerialDispatchQueue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    v14 = [v10 profile];
    uint64_t v15 = [v14 serviceManager];
    healthServiceManager = v11->_healthServiceManager;
    v11->_healthServiceManager = (HDHealthServiceManager *)v15;
  }
  return v11;
}

- (void)connectionInterrupted
{
  if (a1)
  {
    objc_msgSend(a1, "remote_endBluetoothStatusUpdates");
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v2 = [a1[4] allValues];
    id v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v17;
      do
      {
        v6 = 0;
        do
        {
          if (*(void *)v17 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(a1, "remote_endHealthServiceDiscovery:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v6), "integerValue"));
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v4);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = objc_msgSend(a1[6], "allValues", 0);
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(a1, "remote_endHealthServiceSession:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "integerValue"));
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (void)remote_beginBluetoothStatusUpdates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"BeginStatusUpdates"];
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14E40;
  block[3] = &unk_60898;
  id v10 = v5;
  id v11 = v4;
  block[4] = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(queue, block);
}

- (void)remote_endBluetoothStatusUpdates
{
  id v3 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"EndStatusUpdates"];
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_150CC;
  v6[3] = &unk_608E8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(queue, v6);
}

- (void)remote_fetchSupportedServiceIDsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v3 = HDHealthPeripheralProfiles();
  if (v4) {
    v4[2](v4, v3, 0);
  }
}

- (void)remote_startHealthServiceDiscovery:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"StartDiscovery"];
    id v8 = v7;
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_152C4;
    v11[3] = &unk_60EB0;
    int64_t v14 = a3;
    v11[4] = self;
    id v12 = v7;
    id v13 = v6;
    id v10 = v8;
    dispatch_async(queue, v11);
  }
}

- (void)remote_endHealthServiceDiscovery:(unint64_t)a3
{
  id v6 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"EndDiscovery"];
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_15A68;
  v9[3] = &unk_60ED8;
  unint64_t v11 = a3;
  SEL v12 = a2;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)remote_startHealthServiceSession:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"StartSession"];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_15DC0;
    block[3] = &unk_60FE0;
    id v13 = v7;
    int64_t v14 = self;
    id v16 = v8;
    SEL v17 = a2;
    id v15 = v9;
    id v11 = v9;
    dispatch_async(queue, block);
  }
}

- (void)remote_endHealthServiceSession:(unint64_t)a3
{
  id v5 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"EndSession"];
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_16AB8;
  block[3] = &unk_60C98;
  id v9 = v5;
  unint64_t v10 = a3;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(queue, block);
}

- (void)remote_getHealthPeripheralsWithFilter:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"GetPairings"];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_16E5C;
    v10[3] = &unk_61008;
    v10[4] = self;
    unint64_t v13 = a3;
    id v11 = v7;
    id v12 = v6;
    id v9 = v7;
    dispatch_async(queue, v10);
  }
}

- (void)remote_addPairingForHealthService:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"AddPairing"];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1709C;
    v11[3] = &unk_61050;
    id v12 = v6;
    unint64_t v13 = self;
    id v14 = v8;
    id v15 = v7;
    id v10 = v8;
    dispatch_async(queue, v11);
  }
}

- (void)remote_removePairingForHealthService:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"RemovePairing"];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1729C;
    v11[3] = &unk_61050;
    id v12 = v6;
    unint64_t v13 = self;
    id v14 = v8;
    id v15 = v7;
    id v10 = v8;
    dispatch_async(queue, v11);
  }
}

- (void)remote_addPeripheral:(id)a3 name:(id)a4 forServices:(id)a5 withCompletion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v14)
  {
    id v15 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"AddPeripheral"];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_174DC;
    block[3] = &unk_61078;
    id v19 = v13;
    id v20 = v11;
    id v21 = v12;
    v22 = self;
    id v24 = v14;
    SEL v25 = a2;
    id v23 = v15;
    id v17 = v15;
    dispatch_async(queue, block);
  }
}

- (void)remote_removePeripheral:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"RemovePeripheral"];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_17730;
    v11[3] = &unk_61050;
    id v12 = v6;
    id v13 = self;
    id v14 = v8;
    id v15 = v7;
    id v10 = v8;
    dispatch_async(queue, v11);
  }
}

- (void)remote_getEnabledStatusForPeripheral:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"GetPeripheralStatus"];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_179C0;
    v11[3] = &unk_61050;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v8;
    id v14 = v7;
    id v10 = v8;
    dispatch_async(queue, v11);
  }
}

- (void)remote_setEnabledStatus:(BOOL)a3 forPeripheral:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"SetPeripheralStatus"];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_17B78;
    block[3] = &unk_610A0;
    void block[4] = self;
    BOOL v17 = a3;
    id v14 = v8;
    id v15 = v10;
    id v16 = v9;
    id v12 = v10;
    dispatch_async(queue, block);
  }
}

- (void)remote_getSupportedPropertyNamesWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"GetSupportedPropertyNames"];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_17D08;
    block[3] = &unk_60898;
    void block[4] = self;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(queue, block);
  }
}

- (void)remote_getHealthServiceProperty:(id)a3 forSession:(unint64_t)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"GetProperty"];
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_17EE4;
  block[3] = &unk_60FE0;
  id v18 = v9;
  unint64_t v19 = a4;
  void block[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, block);
}

- (void)remote_performHealthServiceOperation:(id)a3 onSession:(unint64_t)a4 withParameters:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[HDDaemonTransaction transactionWithOwner:self activityName:@"PerformOperation"];
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_18114;
  v19[3] = &unk_61118;
  v19[4] = self;
  id v20 = v10;
  id v23 = v12;
  unint64_t v24 = a4;
  id v21 = v11;
  id v22 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(queue, v19);
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [v13 profile];
  id v16 = [v15 serviceManager];

  if (v16)
  {
    id v17 = [[HDHealthServicesServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
  }
  else
  {
    id v18 = +[NSError hk_featureUnavailableForProfileError];
    if (v18)
    {
      if (a7) {
        *a7 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v17 = 0;
  }

  return v17;
}

+ (id)requiredEntitlements
{
  uint64_t v4 = HKPrivateHealthKitEntitlement;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

+ (id)taskIdentifier
{
  return +[HKHealthServicesManager taskIdentifier];
}

- (id)exportedInterface
{
  return (id)_HKHealthServicesServerInterface(self, a2);
}

- (id)remoteInterface
{
  return (id)_HKHealthServicesManagerClientInterface(self, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthServiceClosedSessionClientIDs, 0);
  objc_storeStrong((id *)&self->_healthServiceClosedSessionServerIDs, 0);
  objc_storeStrong((id *)&self->_healthServiceSessionClientIDs, 0);
  objc_storeStrong((id *)&self->_healthDeviceSessionServerIDs, 0);
  objc_storeStrong((id *)&self->_healthServiceDiscoveryClientIDs, 0);
  objc_storeStrong((id *)&self->_healthServiceDiscoveryServerIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_healthServiceManager, 0);
}

@end