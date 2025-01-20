@interface DADeviceLocal
- (BOOL)areTestsSuspended;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (DADeviceConnectionLocal)connection;
- (DADeviceDelegate)delegate;
- (DADeviceLocal)init;
- (DADeviceLocal)initWithSerialNumber:(id)a3;
- (DADeviceState)state;
- (DATestQueue)testQueue;
- (DKDiagnosticManager)diagnosticsManager;
- (DKReportManager)reportManager;
- (NSString)bundleIdentifier;
- (NSString)customSerialNumber;
- (NSString)description;
- (id)_IMEI;
- (id)_createDeviceConnection;
- (id)_deviceAttributes;
- (id)_deviceClass;
- (id)_deviceColor;
- (id)_deviceEnclosureColor;
- (id)_deviceImageName;
- (id)_deviceMaskName;
- (id)_deviceType;
- (id)_getDiagnosticAllowList;
- (id)_marketingName;
- (id)_productClass;
- (id)_serialNumber;
- (unint64_t)hash;
- (void)_initDevice;
- (void)_localDeviceSessionWillStartNotification:(id)a3;
- (void)archiveConnection;
- (void)cancelTestWithCommand:(id)a3;
- (void)deviceConnection:(id)a3 didFinishTestSuite:(id)a4 withEntry:(id)a5 error:(id)a6;
- (void)deviceConnection:(id)a3 didRecieveCommand:(id)a4;
- (void)deviceConnection:(id)a3 didRequestInstructionalPrompt:(id)a4 withConfirmation:(id)a5;
- (void)deviceConnection:(id)a3 didRequestSuiteRunWithDestinations:(id)a4 confirmation:(id)a5;
- (void)end;
- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)getAsset:(id)a3 completion:(id)a4;
- (void)idle;
- (void)profileWithCommand:(id)a3;
- (void)requestSuiteFinishWithCompletionHandler:(id)a3;
- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4;
- (void)resumeTests;
- (void)setBundleIdentifier:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCustomSerialNumber:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiagnosticsManager:(id)a3;
- (void)setReportManager:(id)a3;
- (void)setState:(id)a3;
- (void)setTestQueue:(id)a3;
- (void)setTestsSuspended:(BOOL)a3;
- (void)start;
- (void)startTestWithCommand:(id)a3;
- (void)suspendTests;
- (void)updateProgress:(id)a3 forTest:(id)a4;
- (void)uploadAssets:(id)a3 completion:(id)a4;
@end

@implementation DADeviceLocal

- (DADeviceLocal)init
{
  v5.receiver = self;
  v5.super_class = (Class)DADeviceLocal;
  v2 = [(DADeviceLocal *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DADeviceLocal *)v2 _initDevice];
  }
  return v3;
}

- (DADeviceLocal)initWithSerialNumber:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DADeviceLocal;
  v6 = [(DADeviceLocal *)&v19 init];
  v7 = v6;
  if (v6)
  {
    v8 = [(DADeviceLocal *)v6 _serialNumber];
    unsigned int v9 = [v5 isEqualToString:v8];

    if (v9)
    {
      v10 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100101DE4(v10, v11, v12, v13, v14, v15, v16, v17);
      }

      v7 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v7->_customSerialNumber, a3);
      [(DADeviceLocal *)v7 _initDevice];
    }
  }

  return v7;
}

- (void)setBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (DKReportManager *)[objc_alloc((Class)DKReportManager) initWithBundleIdentifier:v4];

  reportManager = self->_reportManager;
  self->_reportManager = v5;
}

- (unint64_t)hash
{
  v2 = [(DADeviceLocal *)self state];
  v3 = [v2 serialNumber];
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___DADevice])
  {
    id v5 = [(DADeviceLocal *)self state];
    v6 = [v5 serialNumber];
    v7 = [v4 state];
    v8 = [v7 serialNumber];
    unsigned __int8 v9 = [v6 isEqualToString:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(DADeviceLocal *)self state];
  v6 = [v5 serialNumber];
  v7 = +[NSString stringWithFormat:@"<%@; %p: %@>", v4, self, v6];

  return (NSString *)v7;
}

- (BOOL)isLocal
{
  return 1;
}

- (void)start
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"com.apple.Diagnostics.LocalSessionWillStart" object:self];

  id v4 = [(DADeviceLocal *)self connection];
  [v4 start];
}

- (void)idle
{
  id v2 = [(DADeviceLocal *)self connection];
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

  id v4 = [(DADeviceLocal *)self testQueue];
  [v4 setSuspended:1];

  id v5 = [(DADeviceLocal *)self diagnosticsManager];
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

  id v4 = [(DADeviceLocal *)self testQueue];
  [v4 setSuspended:0];
}

- (void)end
{
  v3 = [(DADeviceLocal *)self state];
  id v4 = [v3 phase];

  if (v4 != (id)5)
  {
    int v5 = [(DADeviceLocal *)self state];
    [v5 setPhase:5];

    int v6 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018524;
    block[3] = &unk_10014B0D8;
    block[4] = self;
    dispatch_async(v6, block);
  }
}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DADeviceLocal *)self connection];
  [v8 requestSuiteStart:v7 completionHandler:v6];
}

- (void)requestSuiteFinishWithCompletionHandler:(id)a3
{
  id v6 = (void (**)(id, void))a3;
  id v4 = [(DADeviceLocal *)self connection];
  [v4 idle];

  int v5 = [(DADeviceLocal *)self state];
  [v5 setSuiteID:0];

  v6[2](v6, 0);
}

- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = +[DAPlatform currentPlatform];
  [v11 undimCheckerBoardDisplay];

  id v14 = objc_retainBlock(v8);
  uint64_t v12 = [(DADeviceLocal *)self diagnosticsManager];
  uint64_t v13 = [v10 identifier];

  [v12 beginDiagnosticWithIdentifier:v13 parameters:v9 completion:v14];
}

- (void)startTestWithCommand:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(DADeviceLocal *)self diagnosticsManager];
    int v5 = [v11 testID];
    id v6 = [v4 attributesForIdentifier:v5];

    if (v6)
    {
      id v7 = [(DADeviceLocal *)self testQueue];
      id v8 = [v11 parameters];
      id v9 = [v11 completion];
      id v10 = [v9 copy];
      [v7 enqueueTestWithTestAttributes:v6 parameters:v8 completion:v10];
    }
    else
    {
      id v7 = [v11 completion];
      id v8 = +[NSError errorWithDomain:DKErrorDomain code:-1000 userInfo:0];
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
    id v6 = [(DADeviceLocal *)self diagnosticsManager];
    [v6 cancelAllDiagnostics];
  }
}

- (void)profileWithCommand:(id)a3
{
  id v3 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 1;
  objc_opt_class();
  v27 = v3;
  if (objc_opt_isKindOfClass())
  {
    id v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    int v5 = [(DADeviceLocal *)self diagnosticsManager];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100018E0C;
    v38[3] = &unk_10014BD28;
    v41 = &v42;
    id v26 = v3;
    id v39 = v26;
    dispatch_group_t group = v4;
    dispatch_group_t v40 = group;
    [v5 diagnosticsWithCompletion:v38];

    id v6 = [v26 components];
    if (!v6
      || ([v26 components],
          id v7 = objc_claimAutoreleasedReturnValue(),
          BOOL v8 = [v7 count] == 0,
          v7,
          v6,
          v8))
    {
      v28 = 0;
    }
    else
    {
      v28 = +[NSMutableSet set];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v9 = [v26 components];
      id v10 = [v9 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v35;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v35 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = [v13 objectForKeyedSubscript:@"identifier"];
              uint64_t v15 = [v13 objectForKeyedSubscript:@"type"];
              if (v15)
              {
                uint64_t v16 = +[DKComponentPredicate componentPredicateWithType:v15 identifier:v14];
                [v28 addObject:v16];
              }
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v34 objects:v46 count:16];
        }
        while (v10);
      }
    }
    uint64_t v17 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Starting report...", buf, 2u);
    }

    dispatch_group_enter(group);
    v18 = [(DADeviceLocal *)self reportManager];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100018FE8;
    v29[3] = &unk_10014BD50;
    v32 = &v42;
    id v19 = v26;
    id v30 = v19;
    v20 = group;
    v31 = v20;
    [v18 reportWithComponentPredicateManifest:v28 completion:v29];

    dispatch_time_t v21 = dispatch_time(0, 120000000000);
    dispatch_group_wait(v20, v21);
    *((unsigned char *)v43 + 24) = 0;
    v22 = [v19 completion];
    v23 = [v19 profile];
    ((void (**)(void, void *))v22)[2](v22, v23);
  }
  _Block_object_dispose(&v42, 8);
}

- (void)deviceConnection:(id)a3 didRecieveCommand:(id)a4
{
  id v6 = a4;
  id v5 = [v6 commandType];
  if (v5 == (id)2)
  {
    [(DADeviceLocal *)self profileWithCommand:v6];
  }
  else if (v5 == (id)1)
  {
    [(DADeviceLocal *)self cancelTestWithCommand:v6];
  }
  else if (!v5)
  {
    [(DADeviceLocal *)self startTestWithCommand:v6];
  }

  _objc_release_x1();
}

- (void)deviceConnection:(id)a3 didRequestSuiteRunWithDestinations:(id)a4 confirmation:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(DADeviceLocal *)self delegate];
  [v9 device:self didRequestSuiteRunWithDestinations:v8 confirmation:v7];
}

- (void)deviceConnection:(id)a3 didFinishTestSuite:(id)a4 withEntry:(id)a5 error:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(DADeviceLocal *)self delegate];
  [v12 device:self didFinishTestSuite:v11 withEntry:v10 error:v9];
}

- (void)deviceConnection:(id)a3 didRequestInstructionalPrompt:(id)a4 withConfirmation:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(DADeviceLocal *)self delegate];
  [v9 device:self didRequestInstructionalPrompt:v8 withConfirmation:v7];
}

- (void)updateProgress:(id)a3 forTest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(DADeviceLocal *)self connection];
  id v8 = [v9 progressForTest];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (void)getAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DADeviceLocal *)self connection];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(DADeviceLocal *)self connection];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100019510;
    v11[3] = &unk_10014BD78;
    id v12 = v6;
    id v13 = v7;
    [v10 requestAsset:v12 completionHandler:v11];
  }
}

- (void)uploadAssets:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void *, uint64_t))a4;
  id v7 = [(DADeviceLocal *)self connection];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(DADeviceLocal *)self connection];
    [v9 requestUploadAssets:v11 completion:v6];
  }
  else
  {
    char v9 = +[NSArray array];
    uint64_t v10 = +[NSError errorWithDomain:DKErrorDomain code:-1008 userInfo:0];
    v6[2](v6, v9, v10);

    id v6 = (void (**)(id, void *, uint64_t))v10;
  }
}

- (void)_initDevice
{
  id v3 = [(DADeviceLocal *)self _deviceAttributes];
  id v4 = [(DADeviceLocal *)self _serialNumber];
  id v5 = [[DADeviceState alloc] initWithSerialNumber:v4 attributes:v3];
  state = self->_state;
  self->_state = v5;

  id v7 = +[DATestQueue testQueueWithDelegate:self];
  testQueue = self->_testQueue;
  self->_testQueue = v7;

  char v9 = (DKDiagnosticManager *)objc_opt_new();
  diagnosticsManager = self->_diagnosticsManager;
  self->_diagnosticsManager = v9;

  [(DKDiagnosticManager *)self->_diagnosticsManager setProgressResponder:self];
  [(DKDiagnosticManager *)self->_diagnosticsManager setAssetResponder:self];
  if (os_variant_has_internal_content())
  {
    id v11 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Diagnostic allow list enabled for internal install", v19, 2u);
    }

    id v12 = [(DADeviceLocal *)self _getDiagnosticAllowList];
    [(DKDiagnosticManager *)self->_diagnosticsManager setAllowList:v12];
  }
  id v13 = objc_alloc((Class)DKReportManager);
  id v14 = (DKReportManager *)[v13 initWithBundleIdentifier:kDKDefaultBundleIdentifier];
  reportManager = self->_reportManager;
  self->_reportManager = v14;

  uint64_t v16 = [(DADeviceLocal *)self _createDeviceConnection];
  connection = self->_connection;
  self->_connection = v16;

  [(DADeviceConnectionLocal *)self->_connection setDelegate:self];
  v18 = +[NSNotificationCenter defaultCenter];
  [v18 addObserver:self selector:"_localDeviceSessionWillStartNotification:" name:@"com.apple.Diagnostics.LocalSessionWillStart" object:0];
}

- (id)_createDeviceConnection
{
  id v3 = [DADeviceConnectionLocal alloc];
  id v4 = [(DADeviceLocal *)self state];
  id v5 = [(DADeviceConnectionLocal *)v3 initWithState:v4];

  id v6 = +[DADeviceConnectionConfigurator sharedInstance];
  [(DADeviceConnectionLocal *)v5 setConfigurator:v6];

  return v5;
}

- (id)_deviceAttributes
{
  v20[0] = @"productClass";
  id v19 = [(DADeviceLocal *)self _productClass];
  v21[0] = v19;
  v20[1] = @"IMEI";
  uint64_t v3 = [(DADeviceLocal *)self _IMEI];
  id v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = +[NSNull null];
  }
  uint64_t v17 = (void *)v3;
  v21[1] = v3;
  v20[2] = @"marketingName";
  uint64_t v5 = [(DADeviceLocal *)self _marketingName];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = +[NSNull null];
  }
  v21[2] = v5;
  v20[3] = @"imageName";
  v18 = [(DADeviceLocal *)self _deviceImageName];
  v21[3] = v18;
  v20[4] = @"maskName";
  id v7 = [(DADeviceLocal *)self _deviceMaskName];
  v21[4] = v7;
  v20[5] = @"deviceType";
  char v8 = [(DADeviceLocal *)self _deviceType];
  v21[5] = v8;
  v20[6] = @"deviceClass";
  char v9 = [(DADeviceLocal *)self _deviceClass];
  v21[6] = v9;
  v20[7] = @"deviceEnclosureColor";
  uint64_t v10 = [(DADeviceLocal *)self _deviceEnclosureColor];
  id v11 = v10;
  if (!v10)
  {
    id v11 = +[NSNull null];
  }
  v21[7] = v11;
  v20[8] = @"deviceColor";
  id v12 = [(DADeviceLocal *)self _deviceColor];
  id v13 = v12;
  if (!v12)
  {
    id v13 = +[NSNull null];
  }
  v21[8] = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:9];
  if (!v12) {

  }
  if (!v10) {
  if (!v6)
  }

  if (!v4) {

  }
  return v14;
}

- (id)_deviceImageName
{
  id v2 = (void *)MGCopyAnswer();
  if ([v2 isEqualToString:@"unknown"])
  {
    uint64_t v3 = MGCopyAnswer();

    id v2 = (void *)v3;
  }
  id v4 = (void *)MGCopyAnswer();
  uint64_t v5 = +[NSString stringWithFormat:@"%@_%@.png", v4, v2];
  id v6 = [v5 stringByReplacingReservedURLCharactersUsingEncoding:1];

  return v6;
}

- (id)_deviceMaskName
{
  id v2 = (void *)MGCopyAnswer();
  uint64_t v3 = +[NSString stringWithFormat:@"mask_%@.png", v2];
  id v4 = [v3 stringByReplacingReservedURLCharactersUsingEncoding:1];

  return v4;
}

- (id)_serialNumber
{
  uint64_t v3 = [(DADeviceLocal *)self customSerialNumber];

  if (v3)
  {
    id v4 = [(DADeviceLocal *)self customSerialNumber];
  }
  else
  {
    id v4 = (void *)MGCopyAnswer();
  }

  return v4;
}

- (id)_productClass
{
  id v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)_deviceClass
{
  id v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)_deviceType
{
  id v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)_deviceEnclosureColor
{
  id v2 = (void *)MGCopyAnswer();
  uint64_t v3 = 0;
  if (([v2 isEqualToString:@"unknown"] & 1) == 0)
  {
    uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@"#" withString:&stru_1001548A0];
  }

  return v3;
}

- (id)_deviceColor
{
  id v2 = (void *)MGCopyAnswer();
  uint64_t v3 = 0;
  if (([v2 isEqualToString:@"unknown"] & 1) == 0)
  {
    uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@"#" withString:&stru_1001548A0];
  }

  return v3;
}

- (id)_marketingName
{
  id v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)_IMEI
{
  id v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)_getDiagnosticAllowList
{
  if (qword_100186908 != -1) {
    dispatch_once(&qword_100186908, &stru_10014BD98);
  }
  id v2 = (void *)qword_100186900;

  return v2;
}

- (void)_localDeviceSessionWillStartNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  if ([v5 isEqual:self]) {
    goto LABEL_8;
  }
  id v6 = [(DADeviceLocal *)self state];
  if (![v6 phase])
  {

LABEL_8:
    goto LABEL_9;
  }
  id v7 = [(DADeviceLocal *)self state];
  id v8 = [v7 phase];

  if (v8 != (id)1)
  {
    char v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v4 object];
      int v12 = 138412546;
      id v13 = self;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Local device %@ ending so %@ can start", (uint8_t *)&v12, 0x16u);
    }
    id v11 = [(DADeviceLocal *)self connection];
    [v11 end];
  }
LABEL_9:
}

- (NSString)bundleIdentifier
{
  return (NSString *)kDKDefaultBundleIdentifier;
}

- (void)archiveConnection
{
  id v2 = [(DADeviceLocal *)self connection];
  [v2 archive];
}

- (DADeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DADeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (BOOL)areTestsSuspended
{
  return self->_testsSuspended;
}

- (void)setTestsSuspended:(BOOL)a3
{
  self->_testsSuspended = a3;
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

- (NSString)customSerialNumber
{
  return self->_customSerialNumber;
}

- (void)setCustomSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSerialNumber, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_testQueue, 0);
  objc_storeStrong((id *)&self->_reportManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end