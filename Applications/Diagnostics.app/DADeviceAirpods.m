@interface DADeviceAirpods
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (BluetoothDevice)airpodsDevice;
- (DADeviceAirpods)initWithBluetoothDevice:(id)a3;
- (DADeviceConnectionAirPods)connection;
- (DADeviceDelegate)delegate;
- (DADeviceState)state;
- (DATestQueue)testQueue;
- (DKDiagnosticManager)diagnosticsManager;
- (DKReportManager)reportManager;
- (NSString)description;
- (NSString)macAddress;
- (NSString)serialNumber;
- (NSUUID)airpodsUUID;
- (id)_deviceClass;
- (id)_deviceImageName;
- (id)_deviceType;
- (id)_marketingName;
- (id)_productClass;
- (unint64_t)hash;
- (void)_profileWithCommand:(id)a3;
- (void)allowSessionAccessoryDisconnectForDuration:(id)a3;
- (void)cancelTestWithCommand:(id)a3;
- (void)clearAllowSessionAccessoryDisconnect;
- (void)deviceConnection:(id)a3 didRecieveCommand:(id)a4;
- (void)end;
- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)getAsset:(id)a3 completion:(id)a4;
- (void)idle;
- (void)requestSessionAccessoryIdentifierWithCompletion:(id)a3;
- (void)resumeTests;
- (void)setAirpodsDevice:(id)a3;
- (void)setAirpodsUUID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiagnosticsManager:(id)a3;
- (void)setMacAddress:(id)a3;
- (void)setReportManager:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setState:(id)a3;
- (void)setTestQueue:(id)a3;
- (void)start;
- (void)startTestWithCommand:(id)a3;
- (void)suspendTests;
- (void)unpairSessionAccessoryOnTestCompletion;
- (void)updateProgress:(id)a3 forTest:(id)a4;
@end

@implementation DADeviceAirpods

- (DADeviceAirpods)initWithBluetoothDevice:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)DADeviceAirpods;
  v6 = [(DADeviceAirpods *)&v37 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_airpodsDevice, a3);
  uint64_t v8 = [v5 address];
  macAddress = v7->_macAddress;
  v7->_macAddress = (NSString *)v8;

  v10 = +[DADeviceObserverAirpods primarySerialNumberForAirpodsDevice:v5];
  if (v10)
  {
    serialNumber = v7->_serialNumber;
    v7->_serialNumber = v10;
    v12 = v10;

    v38[0] = @"productClass";
    v13 = [(DADeviceAirpods *)v7 _productClass];
    v39[0] = v13;
    v38[1] = @"deviceClass";
    v14 = [(DADeviceAirpods *)v7 _deviceClass];
    v39[1] = v14;
    v38[2] = @"deviceType";
    v15 = [(DADeviceAirpods *)v7 _deviceType];
    v39[2] = v15;
    v38[3] = @"marketingName";
    v16 = [(DADeviceAirpods *)v7 _marketingName];
    v39[3] = v16;
    v38[4] = @"imageName";
    v17 = [(DADeviceAirpods *)v7 _deviceImageName];
    v39[4] = v17;
    v18 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];

    v19 = [DADeviceState alloc];
    v20 = [(DADeviceAirpods *)v7 serialNumber];
    v21 = [(DADeviceState *)v19 initWithSerialNumber:v20 attributes:v18];
    state = v7->_state;
    v7->_state = v21;

    uint64_t v23 = +[DATestQueue testQueueWithDelegate:v7];
    testQueue = v7->_testQueue;
    v7->_testQueue = (DATestQueue *)v23;

    uint64_t v25 = objc_opt_new();
    diagnosticsManager = v7->_diagnosticsManager;
    v7->_diagnosticsManager = (DKDiagnosticManager *)v25;

    [(DKDiagnosticManager *)v7->_diagnosticsManager setProgressResponder:v7];
    [(DKDiagnosticManager *)v7->_diagnosticsManager setAssetResponder:v7];
    [(DKDiagnosticManager *)v7->_diagnosticsManager setAccessoryResponder:v7];
    airpodsUUID = v7->_airpodsUUID;
    v7->_airpodsUUID = 0;

    v28 = (DKReportManager *)[objc_alloc((Class)DKReportManager) initWithBundleIdentifier:@"AirPods"];
    reportManager = v7->_reportManager;
    v7->_reportManager = v28;

    v30 = [DADeviceConnectionAirPods alloc];
    v31 = [(DADeviceAirpods *)v7 state];
    v32 = [(DADeviceConnectionAirPods *)v30 initWithState:v31 bluetoothDevice:v5];
    connection = v7->_connection;
    v7->_connection = v32;

    [(DADeviceConnectionLocal *)v7->_connection setDelegate:v7];
LABEL_4:
    v34 = v7;
    goto LABEL_8;
  }
  v35 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    sub_100102A00(v35);
  }

  v34 = 0;
LABEL_8:

  return v34;
}

- (BOOL)isLocal
{
  return 1;
}

- (void)start
{
  id v2 = [(DADeviceAirpods *)self connection];
  [v2 start];
}

- (void)idle
{
  id v2 = [(DADeviceAirpods *)self connection];
  [v2 idle];
}

- (void)suspendTests
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Test launch suspending for %@.", (uint8_t *)&v6, 0xCu);
  }

  v4 = [(DADeviceAirpods *)self testQueue];
  [v4 setSuspended:1];

  id v5 = [(DADeviceAirpods *)self diagnosticsManager];
  [v5 cancelAllDiagnostics];
}

- (void)resumeTests
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Test launch resuming for %@.", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(DADeviceAirpods *)self testQueue];
  [v4 setSuspended:0];
}

- (void)end
{
  v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D73C;
  block[3] = &unk_10014B0D8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)startTestWithCommand:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(DADeviceAirpods *)self connection];
    [v4 setUnpairOnTestCompletion:0];

    int v5 = [(DADeviceAirpods *)self diagnosticsManager];
    int v6 = [v12 testID];
    v7 = [v5 attributesForIdentifier:v6];

    if (v7)
    {
      uint64_t v8 = [(DADeviceAirpods *)self testQueue];
      v9 = [v12 parameters];
      v10 = [v12 completion];
      id v11 = [v10 copy];
      [v8 enqueueTestWithTestAttributes:v7 parameters:v9 completion:v11];
    }
    else
    {
      uint64_t v8 = [v12 completion];
      v9 = +[NSError errorWithDomain:DKErrorDomain code:-1000 userInfo:0];
      ((void (**)(void, void, void *))v8)[2](v8, 0, v9);
    }
  }
}

- (void)cancelTestWithCommand:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(DADeviceAirpods *)self diagnosticsManager];
    [v6 cancelAllDiagnostics];
  }
}

- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(DADeviceAirpods *)self diagnosticsManager];
  id v11 = [v10 identifier];

  [v12 beginDiagnosticWithIdentifier:v11 parameters:v9 completion:v8];
}

- (void)deviceConnection:(id)a3 didRecieveCommand:(id)a4
{
  id v6 = a4;
  id v5 = [v6 commandType];
  if (v5 == (id)2)
  {
    [(DADeviceAirpods *)self _profileWithCommand:v6];
  }
  else if (v5 == (id)1)
  {
    [(DADeviceAirpods *)self cancelTestWithCommand:v6];
  }
  else if (!v5)
  {
    [(DADeviceAirpods *)self startTestWithCommand:v6];
  }

  _objc_release_x1();
}

- (unint64_t)hash
{
  id v2 = [(DADeviceAirpods *)self macAddress];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    id v6 = [(DADeviceAirpods *)self macAddress];
    v7 = [v5 macAddress];

    unsigned __int8 v8 = [v6 isEqualToString:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(DADeviceAirpods *)self state];
  id v6 = [v5 serialNumber];
  v7 = +[NSString stringWithFormat:@"<%@; %p: %@>", v4, self, v6];

  return (NSString *)v7;
}

- (void)_profileWithCommand:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    id v6 = [(DADeviceAirpods *)self diagnosticsManager];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10002E054;
    v40[3] = &unk_10014C3B0;
    id v7 = v4;
    id v41 = v7;
    unsigned __int8 v8 = v5;
    v42 = v8;
    [v6 diagnosticsWithCompletion:v40];

    uint64_t v9 = [v7 components];
    if (v9
      && (id v10 = (void *)v9,
          [v7 components],
          id v11 = objc_claimAutoreleasedReturnValue(),
          id v12 = [v11 count],
          v11,
          v10,
          v12))
    {
      v29 = self;
      id v30 = v4;
      v31 = +[NSMutableSet set];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v13 = [v7 components];
      id v14 = [v13 countByEnumeratingWithState:&v36 objects:v43 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v37;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v37 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [v18 objectForKeyedSubscript:@"identifier"];
              v20 = [v18 objectForKeyedSubscript:@"type"];
              if (v20)
              {
                v21 = +[DKComponentPredicate componentPredicateWithType:v20 identifier:v19];
                [v31 addObject:v21];
              }
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v36 objects:v43 count:16];
        }
        while (v15);
      }

      self = v29;
      id v4 = v30;
    }
    else
    {
      v31 = 0;
    }
    v22 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Starting report...", buf, 2u);
    }

    dispatch_group_enter(v8);
    uint64_t v23 = [(DADeviceAirpods *)self reportManager];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10002E2A4;
    v32[3] = &unk_10014C270;
    id v24 = v7;
    id v33 = v24;
    v34 = v8;
    uint64_t v25 = v8;
    [v23 reportWithComponentPredicateManifest:v31 completion:v32];

    dispatch_time_t v26 = dispatch_time(0, 60000000000);
    dispatch_group_wait(v25, v26);
    v27 = [v24 completion];
    v28 = [v24 profile];
    ((void (**)(void, void *))v27)[2](v27, v28);
  }
}

- (id)_deviceImageName
{
  id v2 = [(DADeviceAirpods *)self _deviceType];
  id v3 = +[NSString stringWithFormat:@"%@-0.png", v2];
  id v4 = [v3 stringByReplacingReservedURLCharactersUsingEncoding:1];

  return v4;
}

- (id)_productClass
{
  return @"Airpods";
}

- (id)_deviceClass
{
  return @"Accessory";
}

- (id)_deviceType
{
  id v2 = [(DADeviceAirpods *)self airpodsDevice];
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"AirPods_%u", [v2 productId]);

  return v3;
}

- (id)_marketingName
{
  id v2 = [(DADeviceAirpods *)self airpodsDevice];
  unsigned int v3 = [v2 productId];

  id result = @"AirPods";
  switch(v3)
  {
    case 0x2003u:
      id result = @"Powerbeats³";
      break;
    case 0x2004u:
    case 0x2007u:
    case 0x2008u:
    case 0x200Fu:
    case 0x2010u:
    case 0x2012u:
    case 0x2013u:
      return result;
    case 0x2005u:
      id result = @"BeatsX";
      break;
    case 0x2006u:
      id result = @"Beats Solo³";
      break;
    case 0x2009u:
      id result = @"Beats Studio³";
      break;
    case 0x200Au:
      id result = @"AirPods Max";
      break;
    case 0x200Bu:
      id result = @"Powerbeats Pro";
      break;
    case 0x200Cu:
      id result = @"Beats Solo Pro";
      break;
    case 0x200Du:
      id result = @"Powerbeats⁴";
      break;
    case 0x200Eu:
    case 0x2014u:
      goto LABEL_4;
    case 0x2011u:
      id result = @"Beats Studio Buds";
      break;
    default:
      if (v3 == 8228) {
LABEL_4:
      }
        id result = @"AirPods Pro";
      break;
  }
  return result;
}

- (void)updateProgress:(id)a3 forTest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(DADeviceAirpods *)self connection];
  unsigned __int8 v8 = [v9 progressForTest];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (void)getAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(DADeviceAirpods *)self connection];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(DADeviceAirpods *)self connection];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002E7B8;
    v11[3] = &unk_10014BD78;
    id v12 = v6;
    id v13 = v7;
    [v10 requestAsset:v12 completionHandler:v11];
  }
}

- (void)unpairSessionAccessoryOnTestCompletion
{
  id v2 = [(DADeviceAirpods *)self connection];
  [v2 setUnpairOnTestCompletion:1];
}

- (void)allowSessionAccessoryDisconnectForDuration:(id)a3
{
  id v4 = a3;
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DK requested to allow accessory disconnect for %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(DADeviceAirpods *)self connection];
  [v6 allowSessionAccessoryDisconnectForDuration:v4];
}

- (void)clearAllowSessionAccessoryDisconnect
{
  unsigned int v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DK requested to clear allowing accessory disconnects", v5, 2u);
  }

  id v4 = [(DADeviceAirpods *)self connection];
  [v4 clearAllowSessionAccessoryDisconnect];
}

- (void)requestSessionAccessoryIdentifierWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(DADeviceAirpods *)self airpodsUUID];

  if (!v5)
  {
    id v35 = 0;
    id v6 = +[CBDiscovery devicesWithDiscoveryFlags:0x800000 error:&v35];
    id v7 = v35;
    if (v6)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id obj = v6;
      id v29 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v32;
        dispatch_time_t v26 = v6;
        v27 = v4;
        id v25 = v7;
        while (2)
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v32 != v30) {
              objc_enumerationMutation(obj);
            }
            char v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            id v10 = [v9 serialNumber:v25, v26, v27];
            id v11 = [(DADeviceAirpods *)self serialNumber];
            if ([v10 isEqualToString:v11]) {
              goto LABEL_15;
            }
            id v12 = [v9 serialNumberLeft];
            id v13 = [(DADeviceAirpods *)self serialNumber];
            if ([v12 isEqualToString:v13])
            {

LABEL_15:
LABEL_16:
              id v17 = objc_alloc((Class)NSUUID);
              v18 = [v9 identifier];
              id v19 = [v17 initWithUUIDString:v18];
              [(DADeviceAirpods *)self setAirpodsUUID:v19];

              id v6 = v26;
              id v4 = v27;
              id v7 = v25;
              goto LABEL_17;
            }
            id v14 = [v9 serialNumberRight];
            id v15 = [(DADeviceAirpods *)self serialNumber];
            unsigned __int8 v16 = [v14 isEqualToString:v15];

            if (v16) {
              goto LABEL_16;
            }
          }
          id v6 = v26;
          id v4 = v27;
          id v7 = v25;
          id v29 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
          if (v29) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
  }
  v20 = [(DADeviceAirpods *)self airpodsUUID];

  if (v20)
  {
    id v21 = [(DADeviceAirpods *)self airpodsUUID];
    v22 = [v21 UUIDString];
    v4[2](v4, v22, 0);
  }
  else
  {
    id v23 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
    CFStringRef v37 = @"Unable to find CoreBluetooth identifier for session accessory";
    id v24 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    id v21 = [v23 initWithDomain:@"com.apple.Diagnostics" code:-1 userInfo:v24];

    ((void (**)(id, void *, id))v4)[2](v4, &stru_1001548A0, v21);
  }
}

- (DADeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (DADeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BluetoothDevice)airpodsDevice
{
  return self->_airpodsDevice;
}

- (void)setAirpodsDevice:(id)a3
{
}

- (DADeviceConnectionAirPods)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (DKDiagnosticManager)diagnosticsManager
{
  return self->_diagnosticsManager;
}

- (void)setDiagnosticsManager:(id)a3
{
}

- (DKReportManager)reportManager
{
  return self->_reportManager;
}

- (void)setReportManager:(id)a3
{
}

- (DATestQueue)testQueue
{
  return self->_testQueue;
}

- (void)setTestQueue:(id)a3
{
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
}

- (NSUUID)airpodsUUID
{
  return self->_airpodsUUID;
}

- (void)setAirpodsUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airpodsUUID, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_testQueue, 0);
  objc_storeStrong((id *)&self->_reportManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_airpodsDevice, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end