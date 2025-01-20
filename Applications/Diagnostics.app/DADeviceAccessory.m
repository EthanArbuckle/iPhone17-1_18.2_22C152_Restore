@interface DADeviceAccessory
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (DAAdapterAccessory)accessory;
- (DADeviceAccessory)init;
- (DADeviceAccessory)initWithAccessory:(id)a3;
- (DADeviceConnectionLocal)connection;
- (DADeviceDelegate)delegate;
- (DADeviceState)state;
- (DATestQueue)testQueue;
- (DKDiagnosticManager)diagnosticsManager;
- (DKReportManager)reportManager;
- (NSString)description;
- (id)_deviceImageName;
- (id)_marketingName;
- (id)_productClass;
- (id)_serialNumber;
- (unint64_t)hash;
- (void)_profileWithCommand:(id)a3;
- (void)cancelTestWithCommand:(id)a3;
- (void)deviceConnection:(id)a3 didRecieveCommand:(id)a4;
- (void)end;
- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)idle;
- (void)resumeTests;
- (void)setAccessory:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiagnosticsManager:(id)a3;
- (void)setReportManager:(id)a3;
- (void)setState:(id)a3;
- (void)setTestQueue:(id)a3;
- (void)start;
- (void)startTestWithCommand:(id)a3;
- (void)suspendTests;
@end

@implementation DADeviceAccessory

- (DADeviceAccessory)init
{
  return [(DADeviceAccessory *)self initWithAccessory:0];
}

- (DADeviceAccessory)initWithAccessory:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DADeviceAccessory;
  v6 = [(DADeviceAccessory *)&v28 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessory, a3);
    v29[0] = @"productClass";
    v8 = [(DADeviceAccessory *)v7 _productClass];
    v30[0] = v8;
    v29[1] = @"marketingName";
    v9 = [(DADeviceAccessory *)v7 _marketingName];
    v30[1] = v9;
    v29[2] = @"imageName";
    v10 = [(DADeviceAccessory *)v7 _deviceImageName];
    v30[2] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];

    v12 = [DADeviceState alloc];
    v13 = [(DADeviceAccessory *)v7 _serialNumber];
    v14 = [(DADeviceState *)v12 initWithSerialNumber:v13 attributes:v11];
    state = v7->_state;
    v7->_state = v14;

    uint64_t v16 = +[DATestQueue testQueueWithDelegate:v7];
    testQueue = v7->_testQueue;
    v7->_testQueue = (DATestQueue *)v16;

    id v18 = kDKDefaultBundleIdentifier;
    accessory = v7->_accessory;
    if (accessory)
    {
      uint64_t v20 = [(DAAdapterAccessory *)accessory identifier];

      id v18 = (id)v20;
    }
    v21 = (DKReportManager *)[objc_alloc((Class)DKReportManager) initWithBundleIdentifier:v18];
    reportManager = v7->_reportManager;
    v7->_reportManager = v21;

    v23 = [DADeviceConnectionLocal alloc];
    v24 = [(DADeviceAccessory *)v7 state];
    v25 = [(DADeviceConnectionLocal *)v23 initWithState:v24];
    connection = v7->_connection;
    v7->_connection = v25;

    [(DADeviceConnectionLocal *)v7->_connection setDelegate:v7];
  }

  return v7;
}

- (BOOL)isLocal
{
  return 1;
}

- (void)start
{
  id v2 = [(DADeviceAccessory *)self connection];
  [v2 start];
}

- (void)idle
{
  id v2 = [(DADeviceAccessory *)self connection];
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

  v4 = [(DADeviceAccessory *)self testQueue];
  [v4 setSuspended:1];

  id v5 = [(DADeviceAccessory *)self diagnosticsManager];
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

  v4 = [(DADeviceAccessory *)self testQueue];
  [v4 setSuspended:0];
}

- (void)end
{
  v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027AA8;
  block[3] = &unk_10014B0D8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)startTestWithCommand:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(DADeviceAccessory *)self diagnosticsManager];
    int v5 = [v11 testID];
    int v6 = [v4 attributesForIdentifier:v5];

    if (v6)
    {
      v7 = [(DADeviceAccessory *)self testQueue];
      v8 = [v11 parameters];
      v9 = [v11 completion];
      id v10 = [v9 copy];
      [v7 enqueueTestWithTestAttributes:v6 parameters:v8 completion:v10];
    }
    else
    {
      v7 = [v11 completion];
      v8 = +[NSError errorWithDomain:DKErrorDomain code:-1000 userInfo:0];
      ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
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
    id v6 = [(DADeviceAccessory *)self diagnosticsManager];
    [v6 cancelAllDiagnostics];
  }
}

- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(DADeviceAccessory *)self diagnosticsManager];
  id v11 = [v10 identifier];

  [v12 beginDiagnosticWithIdentifier:v11 parameters:v9 completion:v8];
}

- (void)deviceConnection:(id)a3 didRecieveCommand:(id)a4
{
  id v6 = a4;
  id v5 = [v6 commandType];
  if (v5 == (id)2)
  {
    [(DADeviceAccessory *)self _profileWithCommand:v6];
  }
  else if (v5 == (id)1)
  {
    [(DADeviceAccessory *)self cancelTestWithCommand:v6];
  }
  else if (!v5)
  {
    [(DADeviceAccessory *)self startTestWithCommand:v6];
  }

  _objc_release_x1();
}

- (unint64_t)hash
{
  id v2 = [(DADeviceAccessory *)self _serialNumber];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(DADeviceAccessory *)self _serialNumber];
    id v6 = [v4 _serialNumber];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(DADeviceAccessory *)self state];
  id v6 = [v5 serialNumber];
  unsigned __int8 v7 = +[NSString stringWithFormat:@"<%@; %p: %@>", v4, self, v6];

  return (NSString *)v7;
}

- (void)_profileWithCommand:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = dispatch_group_create();
    id v6 = [v4 profile];
    [v6 setTests:&__NSArray0__struct];

    uint64_t v7 = [v4 components];
    if (v7
      && (id v8 = (void *)v7,
          [v4 components],
          id v9 = objc_claimAutoreleasedReturnValue(),
          id v10 = [v9 count],
          v9,
          v8,
          v10))
    {
      v27 = v5;
      objc_super v28 = self;
      v29 = +[NSMutableSet set];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v11 = [v4 components];
      id v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v35;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v35 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [v16 objectForKeyedSubscript:@"identifier"];
              id v18 = [v16 objectForKeyedSubscript:@"type"];
              if (v18)
              {
                v19 = +[DKComponentPredicate componentPredicateWithType:v18 identifier:v17];
                [v29 addObject:v19];
              }
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v13);
      }

      self = v28;
      id v5 = v27;
    }
    else
    {
      v29 = 0;
    }
    uint64_t v20 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Starting report...", buf, 2u);
    }

    dispatch_group_enter(v5);
    v21 = [(DADeviceAccessory *)self reportManager];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10002830C;
    void v30[3] = &unk_10014C270;
    id v22 = v4;
    id v31 = v22;
    v32 = v5;
    v23 = v5;
    [v21 reportWithComponentPredicateManifest:v29 completion:v30];

    dispatch_time_t v24 = dispatch_time(0, 60000000000);
    dispatch_group_wait(v23, v24);
    v25 = [v22 completion];
    v26 = [v22 profile];
    ((void (**)(void, void *))v25)[2](v25, v26);
  }
}

- (id)_deviceImageName
{
  uint64_t v2 = [(DAAdapterAccessory *)self->_accessory modelNumber];
  id v3 = (void *)v2;
  if (v2)
  {
    id v4 = [@"SBC" stringByAppendingFormat:@"-%@", v2];
  }
  else
  {
    id v4 = @"SBC";
  }

  return v4;
}

- (id)_serialNumber
{
  uint64_t v2 = [(DADeviceAccessory *)self accessory];
  id v3 = [v2 serialNumber];

  return v3;
}

- (id)_productClass
{
  return @"Accessories";
}

- (id)_marketingName
{
  uint64_t v2 = [(DADeviceAccessory *)self accessory];
  id v3 = [v2 productName];

  return v3;
}

- (DADeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (DADeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DAAdapterAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (DADeviceConnectionLocal)connection
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_testQueue, 0);
  objc_storeStrong((id *)&self->_reportManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_accessory, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end