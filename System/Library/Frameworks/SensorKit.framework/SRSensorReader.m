@interface SRSensorReader
+ (SRSensorReader)new;
+ (id)createExportDataForServices:(id)a3 withCompletionHandler:(id)a4;
+ (id)createExportDataWithCompletionHandler:(id)a3;
+ (void)_requestAuthorizationMigrationForSensors:(id)a3 completion:(id)a4;
+ (void)authorizationRequestStatusForBundle:(id)a3 sensors:(id)a4 completionHandler:(id)a5;
+ (void)initialize;
+ (void)requestAuthorizationForBundle:(id)a3 sensors:(id)a4 legacyPromptErrorBehavior:(BOOL)a5 withCompletionHandler:(id)a6;
+ (void)requestAuthorizationForBundle:(id)a3 sensors:(id)a4 withCompletionHandler:(id)a5;
+ (void)requestAuthorizationForSensors:(NSSet *)sensors completion:(void *)completion;
- (BOOL)_updateAuthorizationStatusWithAuthorizedServices:(id)a3 deniedServices:(id)a4 dataCollectionEnabled:(BOOL)a5 onboardingCompleted:(BOOL)a6 lastModifiedTimes:(id)a7 forBundleIdentifier:(id)a8;
- (BOOL)_updateAuthorizationStatusWithAuthorizedServices:(id)a3 deniedServices:(id)a4 dataCollectionEnabled:(BOOL)a5 onboardingCompleted:(BOOL)a6 lastModifiedTimes:(id)a7 forBundleIdentifier:(id)a8 previousAuthorizationStatus:(int64_t)a9;
- (BOOL)bypassHoldingPeriod;
- (BOOL)fetchingRequest:(id)a3 didFetchResult:(id)a4;
- (BOOL)isAuthorized;
- (Class)exportingSampleClass;
- (Class)sampleClass;
- (NSDate)_lastModifiedAuthorizationTime;
- (NSString)bundleId;
- (NSString)canonicalSensor;
- (NSString)requestedSensor;
- (SRAuthorizationClient)authorizationClient;
- (SRAuthorizationStatus)authorizationStatus;
- (SRReaderStorageBackend)datastoreBackend;
- (SRSensor)sensor;
- (SRSensorReader)init;
- (SRSensorReader)initWithSensor:(SRSensor)sensor;
- (SRSensorReader)initWithSensor:(id)a3 bundle:(id)a4;
- (SRSensorReader)initWithSensor:(id)a3 sensorDescription:(id)a4 datastoreBackend:(id)a5 authorizationClient:(id)a6 bundleId:(id)a7;
- (double)earliestEligibleTime;
- (double)serviceStartTime;
- (id)createExportDataWithCompletionHandler:(id)a3;
- (id)delegate;
- (void)_startRecordingWithSensorConfiguration:(id)a3 completionHandler:(id)a4;
- (void)authorizedServicesDidChange:(id)a3 deniedServices:(id)a4 dataCollectionEnabled:(BOOL)a5 onboardingCompleted:(BOOL)a6 lastModifiedTimes:(id)a7 forBundleIdentifier:(id)a8;
- (void)dealloc;
- (void)didChangeAuthorizationStatus:(int64_t)a3;
- (void)didCompleteFetch:(id)a3;
- (void)didFetchDevices:(id)a3;
- (void)fetch:(SRFetchRequest *)request;
- (void)fetchDevices;
- (void)fetchDevices:(id)a3;
- (void)fetchDevicesDidFailWithError:(id)a3;
- (void)fetchDevicesWithRetryAttempt:(int)a3;
- (void)fetchReaderMetadata;
- (void)fetchingRequest:(id)a3 failedWithError:(id)a4;
- (void)sensorReaderDidStopRecording;
- (void)sensorReaderWillStartRecording;
- (void)setAuthorizationClient:(id)a3;
- (void)setAuthorizationStatus:(int64_t)a3;
- (void)setBundleId:(id)a3;
- (void)setBypassHoldingPeriod:(BOOL)a3;
- (void)setCanonicalSensor:(id)a3;
- (void)setDatastoreBackend:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setExportingSampleFromDescription:(id)a3;
- (void)setRequestedSensor:(id)a3;
- (void)setSampleClassFromDescription:(id)a3;
- (void)set_lastModifiedAuthorizationTime:(id)a3;
- (void)startRecording;
- (void)startRecordingFailedWithError:(id)a3;
- (void)startRecordingWithCompletionHandler:(id)a3;
- (void)stopRecording;
- (void)stopRecordingFailedWithError:(id)a3;
- (void)stopRecordingWithCompletionHandler:(id)a3;
@end

@implementation SRSensorReader

+ (id)createExportDataWithCompletionHandler:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v6 = (void *)+[SRSensorsCache defaultCache]();
  v7 = -[SRSensorsCache allSensorDescriptions](v6);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v11++), "name"));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }
  v12 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v12, "addObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16++), "sr_sensorForDeletionRecordsFromSensor"));
      }
      while (v14 != v16);
      uint64_t v14 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
  [v5 unionSet:v12];
  return (id)objc_msgSend(a1, "createExportDataForServices:withCompletionHandler:", objc_msgSend(MEMORY[0x263EFFA08], "setWithSet:", v5), a3);
}

+ (id)createExportDataForServices:(id)a3 withCompletionHandler:(id)a4
{
  v6 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.SensorKitDataExport"];
  objc_msgSend(v6, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_26D1811D8));
  [v6 resume];
  objc_initWeak(&location, v6);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__SRSensorReader_DataExport__createExportDataForServices_withCompletionHandler___block_invoke;
  v12[3] = &unk_26452E018;
  objc_copyWeak(&v13, &location);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__SRSensorReader_DataExport__createExportDataForServices_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_26452E040;
  v11[4] = v6;
  v11[5] = a4;
  v7 = (void *)[v6 remoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__SRSensorReader_DataExport__createExportDataForServices_withCompletionHandler___block_invoke_12;
  v10[3] = &unk_26452E068;
  v10[4] = v6;
  v10[5] = a4;
  [v7 exportDataForSensors:a3 reply:v10];
  uint64_t v8 = (void *)[v12 copy];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v8;
}

uint64_t __80__SRSensorReader_DataExport__createExportDataForServices_withCompletionHandler___block_invoke(uint64_t a1)
{
  if (qword_26AB1A088 != -1) {
    dispatch_once(&qword_26AB1A088, &__block_literal_global_20);
  }
  v2 = _MergedGlobals_0;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_DEFAULT, "Cancelling data export", v5, 2u);
  }
  id Weak = objc_loadWeak((id *)(a1 + 32));
  objc_msgSend((id)objc_msgSend(Weak, "remoteObjectProxy"), "cancelWithReply:", &__block_literal_global);
  return [Weak invalidate];
}

void __80__SRSensorReader_DataExport__createExportDataForServices_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (qword_26AB1A088 != -1) {
    dispatch_once(&qword_26AB1A088, &__block_literal_global_20);
  }
  v4 = _MergedGlobals_0;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_0, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    uint64_t v6 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Couldn't connect to data export service because %{public}@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void __80__SRSensorReader_DataExport__createExportDataForServices_withCompletionHandler___block_invoke_12(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
  v2 = *(void **)(a1 + 32);
}

- (id)createExportDataWithCompletionHandler:(id)a3
{
  int v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", -[SRSensorReader sensor](self, "sensor"));

  return (id)[v5 createExportDataForServices:v6 withCompletionHandler:a3];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_26AB1A170 = (uint64_t)os_log_create("com.apple.SensorKit", "Reader");
  }
}

- (SRSensorReader)init
{
  return 0;
}

+ (SRSensorReader)new
{
  return 0;
}

- (SRSensorReader)initWithSensor:(SRSensor)sensor
{
  uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];

  return [(SRSensorReader *)self initWithSensor:sensor bundle:v5];
}

- (SRSensorReader)initWithSensor:(id)a3 bundle:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v7 = +[SRAuthorizationClient sharedInstance];
  id v8 = +[SRSensorDescription sensorDescriptionForSensor:a3];
  if (!v8)
  {
    uint64_t v15 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = a3;
      _os_log_fault_impl(&dword_21FCA3000, v15, OS_LOG_TYPE_FAULT, "Failed to find description for sensor %{public}@", buf, 0xCu);
    }

    uint64_t v16 = *MEMORY[0x263EFF498];
    v17 = @"RequestedSensor";
    id v18 = a3;
    objc_exception_throw((id)objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", v16, @"Failed to find description for sensor", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)));
  }
  id v9 = v8;
  uint64_t v10 = [v8 datastoreBackend];
  if (v10 == 1)
  {
    uint64_t v11 = SRReaderLongTermBackend;
  }
  else
  {
    if (v10)
    {
      id v12 = 0;
      goto LABEL_9;
    }
    uint64_t v11 = SRReaderSensorKitBackend;
  }
  id v12 = [v11 alloc];
  if (v12) {
    id v12 = (id)objc_msgSend(v12, "initWithSensor:xpcConnection:", a3, objc_msgSend((id)objc_opt_class(), "connectionToEndpoint"));
  }
LABEL_9:
  id v13 = -[SRSensorReader initWithSensor:sensorDescription:datastoreBackend:authorizationClient:bundleId:](self, "initWithSensor:sensorDescription:datastoreBackend:authorizationClient:bundleId:", a3, v9, v12, v7, [a4 bundleIdentifier]);

  return v13;
}

- (SRSensorReader)initWithSensor:(id)a3 sensorDescription:(id)a4 datastoreBackend:(id)a5 authorizationClient:(id)a6 bundleId:(id)a7
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)SRSensorReader;
  id v12 = [(SRSensorReader *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    [(SRSensorReader *)v12 setAuthorizationStatus:0xFFFFLL];
    if (!a4)
    {
      uint64_t v16 = qword_26AB1A170;
      if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = a3;
        _os_log_fault_impl(&dword_21FCA3000, v16, OS_LOG_TYPE_FAULT, "Failed to find description for sensor %{public}@", buf, 0xCu);
      }

      uint64_t v17 = *MEMORY[0x263EFF498];
      long long v19 = @"RequestedSensor";
      id v20 = a3;
      objc_exception_throw((id)objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", v17, @"Failed to find description for sensor", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1)));
    }
    [(SRSensorReader *)v13 setSampleClassFromDescription:a4];
    [(SRSensorReader *)v13 setExportingSampleFromDescription:a4];
    if ((objc_msgSend((id)objc_msgSend(a4, "name"), "isEqualToString:", a3) & 1) == 0) {
      [(SRSensorReader *)v13 setRequestedSensor:a3];
    }
    -[SRSensorReader setCanonicalSensor:](v13, "setCanonicalSensor:", [a4 name]);
    [(SRSensorReader *)v13 setDatastoreBackend:a5];
    [(SRReaderStorageBackend *)[(SRSensorReader *)v13 datastoreBackend] setupConnection];
    v13->_bundleId = (NSString *)[a7 copy];
    uint64_t v14 = (SRAuthorizationClient *)a6;
    v13->_authorizationClient = v14;
    [(SRAuthorizationClient *)v14 addListener:v13 forBundleId:a7];
  }
  return v13;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = qword_26AB1A170;
  if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEFAULT))
  {
    canonicalSensor = self->_canonicalSensor;
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = canonicalSensor;
    _os_log_impl(&dword_21FCA3000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] deallocating reader and invalidating XPC connection", buf, 0xCu);
  }
  [(SRSensorReader *)self setDatastoreBackend:0];
  [(SRSensorReader *)self setBundleId:0];

  self->_canonicalSensor = 0;
  [(SRSensorReader *)self setRequestedSensor:0];
  [(SRAuthorizationClient *)[(SRSensorReader *)self authorizationClient] removeListener:self];
  [(SRSensorReader *)self setAuthorizationClient:0];
  v5.receiver = self;
  v5.super_class = (Class)SRSensorReader;
  [(SRSensorReader *)&v5 dealloc];
}

- (SRSensor)sensor
{
  SRSensor result = [(SRSensorReader *)self requestedSensor];
  if (!result)
  {
    return [(SRSensorReader *)self canonicalSensor];
  }
  return result;
}

- (void)setSampleClassFromDescription:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = (NSString *)[a3 sampleClass];
  if (v4)
  {
    objc_super v5 = v4;
    Class v6 = NSClassFromString(v4);
    uint64_t v7 = v6;
    if (v6)
    {
      if ([(objc_class *)v6 conformsToProtocol:&unk_26D175AD8]) {
        goto LABEL_9;
      }
      uint64_t v8 = qword_26AB1A170;
      if (!os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      canonicalSensor = self->_canonicalSensor;
      int v16 = 138543618;
      uint64_t v17 = canonicalSensor;
      __int16 v18 = 2114;
      long long v19 = NSStringFromClass(v7);
      uint64_t v10 = "[%{public}@] Sample class %{public}@ does not conform to SRSampling";
      uint64_t v11 = v8;
    }
    else
    {
      uint64_t v14 = qword_26AB1A170;
      if (!os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        self->_sampleClass = v7;
        return;
      }
      uint64_t v15 = self->_canonicalSensor;
      int v16 = 138543618;
      uint64_t v17 = v15;
      __int16 v18 = 2114;
      long long v19 = v5;
      uint64_t v10 = "[%{public}@] Sample class %{public}@ can't be found using NSClassFromString(). If this is a binary only stre"
            "am, this can be ignored.";
      uint64_t v11 = v14;
    }
    _os_log_error_impl(&dword_21FCA3000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, 0x16u);
    goto LABEL_9;
  }
  id v12 = qword_26AB1A170;
  if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = self->_canonicalSensor;
    int v16 = 138543362;
    uint64_t v17 = v13;
    _os_log_impl(&dword_21FCA3000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sample class is not set. If this is a binary only stream, this can be ignored. Otherwise, please make sure the SampleClass entry is populated in the sensor description plist.", (uint8_t *)&v16, 0xCu);
  }
}

- (void)setExportingSampleFromDescription:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = NSClassFromString((NSString *)[a3 exportingSampleClass]);
  if (v4 == (objc_class *)objc_opt_class()) {
    v4 = 0;
  }
  if (!v4
    || ([(objc_class *)v4 conformsToProtocol:&unk_26D1759A8] & 1) != 0
    || ([(objc_class *)v4 conformsToProtocol:&unk_26D1816B8] & 1) != 0)
  {
    self->_exportingSampleClass = v4;
  }
  else
  {
    objc_super v5 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_ERROR))
    {
      canonicalSensor = self->_canonicalSensor;
      int v7 = 138543362;
      uint64_t v8 = canonicalSensor;
      _os_log_error_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Exporting sample class is not properly set. Please make sure writer delegate implements exportingClassNameForSensorIdentifier properly.", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)fetchReaderMetadata
{
  v3 = objc_alloc_init(SRReaderRequest);
  [(SRReaderRequest *)v3 setBundleIdentifier:self->_bundleId];
  [(SRReaderRequest *)v3 setSensor:self->_canonicalSensor];
  objc_initWeak(&location, self);
  v4 = [(SRSensorReader *)self datastoreBackend];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__SRSensorReader_fetchReaderMetadata__block_invoke;
  v5[3] = &unk_26452E698;
  objc_copyWeak(&v6, &location);
  [(SRReaderStorageBackend *)v4 fetchReaderMetadata:v3 reply:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void *__37__SRSensorReader_fetchReaderMetadata__block_invoke(uint64_t a1, void *a2)
{
  SRSensor result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    v4 = result;
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x26D168008), "doubleValue");
    v4[2] = v5;
    SRSensor result = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x26D167FE8), "doubleValue");
    v4[1] = v6;
  }
  return result;
}

- (double)serviceStartTime
{
  double result = self->_serviceStartTime;
  if (result == 0.0)
  {
    [(SRSensorReader *)self fetchReaderMetadata];
    return self->_serviceStartTime;
  }
  return result;
}

- (double)earliestEligibleTime
{
  double result = self->_earliestEligibleTime;
  if (result == 0.0)
  {
    [(SRSensorReader *)self fetchReaderMetadata];
    return self->_earliestEligibleTime;
  }
  return result;
}

- (BOOL)fetchingRequest:(id)a3 didFetchResult:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = [(SRSensorReader *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  uint64_t v8 = qword_26AB1A170;
  if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEBUG))
  {
    canonicalSensor = self->_canonicalSensor;
    int v11 = 138543618;
    id v12 = canonicalSensor;
    __int16 v13 = 2050;
    id v14 = v7;
    _os_log_debug_impl(&dword_21FCA3000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] about to call delegate (%{public}p) with sensorReader:fetchingRequest:didFetchResult:", (uint8_t *)&v11, 0x16u);
  }
  return [v7 sensorReader:self fetchingRequest:a3 didFetchResult:a4];
}

- (void)didCompleteFetch:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = [(SRSensorReader *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEBUG))
    {
      canonicalSensor = self->_canonicalSensor;
      int v8 = 138543618;
      uint64_t v9 = canonicalSensor;
      __int16 v10 = 2050;
      id v11 = v5;
      _os_log_debug_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] about to call delegate (%{public}p) with sensorReader:didCompleteFetch:", (uint8_t *)&v8, 0x16u);
    }
    [v5 sensorReader:self didCompleteFetch:a3];
  }
}

- (void)fetchingRequest:(id)a3 failedWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = [(SRSensorReader *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v8 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEBUG))
    {
      canonicalSensor = self->_canonicalSensor;
      int v10 = 138543618;
      id v11 = canonicalSensor;
      __int16 v12 = 2050;
      id v13 = v7;
      _os_log_debug_impl(&dword_21FCA3000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] about to call delegate (%{public}p) with sensorReader:fetchingRequest:failedWithError:", (uint8_t *)&v10, 0x16u);
    }
    [v7 sensorReader:self fetchingRequest:a3 failedWithError:a4];
  }
}

- (void)didFetchDevices:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = [(SRSensorReader *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEBUG))
    {
      canonicalSensor = self->_canonicalSensor;
      int v8 = 138543618;
      uint64_t v9 = canonicalSensor;
      __int16 v10 = 2050;
      id v11 = v5;
      _os_log_debug_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] about to call delegate (%{public}p) with sensorReader:didFetchDevices:", (uint8_t *)&v8, 0x16u);
    }
    [v5 sensorReader:self didFetchDevices:a3];
  }
}

- (void)fetchDevicesDidFailWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = [(SRSensorReader *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEBUG))
    {
      canonicalSensor = self->_canonicalSensor;
      int v8 = 138543618;
      uint64_t v9 = canonicalSensor;
      __int16 v10 = 2050;
      id v11 = v5;
      _os_log_debug_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] about to call delegate (%{public}p) with sensorReader:fetchDevicesDidFailWithError:", (uint8_t *)&v8, 0x16u);
    }
    [v5 sensorReader:self fetchDevicesDidFailWithError:a3];
  }
}

- (void)sensorReaderWillStartRecording
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(SRSensorReader *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEBUG))
    {
      canonicalSensor = self->_canonicalSensor;
      int v6 = 138543618;
      id v7 = canonicalSensor;
      __int16 v8 = 2050;
      id v9 = v3;
      _os_log_debug_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] about to call delegate (%{public}p) with sensorReaderWillStartRecording:", (uint8_t *)&v6, 0x16u);
    }
    [v3 sensorReaderWillStartRecording:self];
  }
}

- (void)startRecordingFailedWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = [(SRSensorReader *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v6 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEBUG))
    {
      canonicalSensor = self->_canonicalSensor;
      int v8 = 138543618;
      id v9 = canonicalSensor;
      __int16 v10 = 2050;
      id v11 = v5;
      _os_log_debug_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] about to call delegate (%{public}p) with sensorReader:startRecordingFailedWithError:", (uint8_t *)&v8, 0x16u);
    }
    [v5 sensorReader:self startRecordingFailedWithError:a3];
  }
}

- (void)sensorReaderDidStopRecording
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(SRSensorReader *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEBUG))
    {
      canonicalSensor = self->_canonicalSensor;
      int v6 = 138543618;
      id v7 = canonicalSensor;
      __int16 v8 = 2050;
      id v9 = v3;
      _os_log_debug_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] about to call delegate (%{public}p) with sensorReaderDidStopRecording:", (uint8_t *)&v6, 0x16u);
    }
    [v3 sensorReaderDidStopRecording:self];
  }
}

- (void)stopRecordingFailedWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = [(SRSensorReader *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v6 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEBUG))
    {
      canonicalSensor = self->_canonicalSensor;
      int v8 = 138543618;
      id v9 = canonicalSensor;
      __int16 v10 = 2050;
      id v11 = v5;
      _os_log_debug_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] about to call delegate (%{public}p) with sensorReader:stopRecordingFailedWithError:", (uint8_t *)&v8, 0x16u);
    }
    [v5 sensorReader:self stopRecordingFailedWithError:a3];
  }
}

- (void)didChangeAuthorizationStatus:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = [(SRSensorReader *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v6 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_INFO))
    {
      canonicalSensor = self->_canonicalSensor;
      int v8 = 138543618;
      id v9 = canonicalSensor;
      __int16 v10 = 2050;
      id v11 = v5;
      _os_log_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_INFO, "[%{public}@] about to call delegate (%{public}p) with sensorReader:didChangeAuthorizationStatus:", (uint8_t *)&v8, 0x16u);
    }
    [v5 sensorReader:self didChangeAuthorizationStatus:a3];
  }
}

- (void)fetch:(SRFetchRequest *)request
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  if ([(SRFetchRequest *)request device])
  {
    if ([(SRFetchRequest *)request _cursor]
      || ([(SRFetchRequest *)request from],
          [(SRFetchRequest *)request to],
          [(SRFetchRequest *)request from],
          double v6 = v5,
          [(SRFetchRequest *)request to],
          v6 <= v7))
    {
      objc_initWeak(location, self);
      uint64_t v14 = MEMORY[0x263EF8330];
      objc_copyWeak(&v15, location);
      id v9 = [(SRSensorReader *)self canonicalSensor];
      __int16 v10 = objc_alloc_init(SRReaderFetchRequest);
      [(SRReaderFetchRequest *)v10 setBundleIdentifier:self->_bundleId];
      [(SRReaderFetchRequest *)v10 setDeviceIdentifier:[(SRDevice *)[(SRFetchRequest *)request device] deviceIdentifier]];
      [(SRReaderFetchRequest *)v10 setSensor:v9];
      [(SRFetchRequest *)request from];
      -[SRReaderFetchRequest setFrom:](v10, "setFrom:");
      [(SRFetchRequest *)request to];
      -[SRReaderFetchRequest setTo:](v10, "setTo:");
      [(SRReaderFetchRequest *)v10 setBypassHoldingPeriod:self->_bypassHoldingPeriod];
      [(SRReaderFetchRequest *)v10 setCursor:[(SRFetchRequest *)request _cursor]];
      [(SRReaderStorageBackend *)[(SRSensorReader *)self datastoreBackend] fetch:v10 withCallback:&v14];

      objc_destroyWeak(&v15);
      objc_destroyWeak(location);
    }
    else
    {
      int v8 = qword_26AB1A170;
      if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_ERROR))
      {
        canonicalSensor = self->_canonicalSensor;
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = canonicalSensor;
        _os_log_error_impl(&dword_21FCA3000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Fetch request contained a 'from' field that was before the 'to' field", (uint8_t *)location, 0xCu);
      }
      [(SRSensorReader *)self fetchingRequest:request failedWithError:+[SRError errorWithCode:3]];
    }
  }
  else
  {
    id v11 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = self->_canonicalSensor;
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v12;
      _os_log_impl(&dword_21FCA3000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetch request specified a nil device, immediately calling -didComplete...", (uint8_t *)location, 0xCu);
    }
    [(SRSensorReader *)self didCompleteFetch:request];
  }
}

uint64_t __24__SRSensorReader_fetch___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  long long v19 = Weak;
  if (a6)
  {
    if (a6 == 1)
    {
      if (a8)
      {
        [Weak fetchingRequest:*(void *)(a1 + 32) failedWithError:a8];
      }
      else
      {
        if (a2)
        {
          if (a3)
          {
            uint64_t v23 = -[SRFetchResult initWithBytes:length:timestamp:metadata:configuration:cursor:sampleClass:]([SRFetchResult alloc], "initWithBytes:length:timestamp:metadata:configuration:cursor:sampleClass:", a2, a3, a4, a5, a7, [Weak sampleClass], a9);
            [v19 fetchingRequest:*(void *)(a1 + 32) didFetchResult:v23];
          }
        }
        [v19 didCompleteFetch:*(void *)(a1 + 32)];
      }
    }
  }
  else
  {
    uint64_t v20 = -[SRFetchResult initWithBytes:length:timestamp:metadata:configuration:cursor:sampleClass:]([SRFetchResult alloc], "initWithBytes:length:timestamp:metadata:configuration:cursor:sampleClass:", a2, a3, a4, a5, a7, [Weak sampleClass], a9);
    char v21 = [v19 fetchingRequest:*(void *)(a1 + 32) didFetchResult:v20];

    if ((v21 & 1) == 0)
    {
      [v19 didCompleteFetch:*(void *)(a1 + 32)];
      return 0;
    }
  }
  return 1;
}

- (void)startRecording
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __32__SRSensorReader_startRecording__block_invoke;
  v3[3] = &unk_26452E670;
  objc_copyWeak(&v4, &location);
  [(SRSensorReader *)self startRecordingWithCompletionHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

uint64_t __32__SRSensorReader_startRecording__block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  if (a2)
  {
    return [Weak startRecordingFailedWithError:a2];
  }
  else
  {
    return [Weak sensorReaderWillStartRecording];
  }
}

- (void)startRecordingWithCompletionHandler:(id)a3
{
}

- (void)_startRecordingWithSensorConfiguration:(id)a3 completionHandler:(id)a4
{
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRSensorReader.m", 477, @"Invalid parameter not satisfying: %@", @"completionHandler != nil");
  }
  double v7 = [(SRSensorReader *)self canonicalSensor];
  int v8 = objc_alloc_init(SRReaderRecordingRequest);
  [(SRReaderRecordingRequest *)v8 setBundleIdentifier:self->_bundleId];
  [(SRReaderRecordingRequest *)v8 setSensor:v7];
  [(SRReaderRecordingRequest *)v8 setSensorConfiguration:a3];
  [(SRReaderStorageBackend *)[(SRSensorReader *)self datastoreBackend] startRecording:v8 reply:a4];
}

- (void)stopRecording
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __31__SRSensorReader_stopRecording__block_invoke;
  v3[3] = &unk_26452E670;
  objc_copyWeak(&v4, &location);
  [(SRSensorReader *)self stopRecordingWithCompletionHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

uint64_t __31__SRSensorReader_stopRecording__block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  if (a2)
  {
    return [Weak stopRecordingFailedWithError:a2];
  }
  else
  {
    return [Weak sensorReaderDidStopRecording];
  }
}

- (void)stopRecordingWithCompletionHandler:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRSensorReader.m", 501, @"Invalid parameter not satisfying: %@", @"completionHandler != nil");
  }
  double v5 = [(SRSensorReader *)self canonicalSensor];
  double v6 = objc_alloc_init(SRReaderRequest);
  [(SRReaderRequest *)v6 setBundleIdentifier:self->_bundleId];
  [(SRReaderRequest *)v6 setSensor:v5];
  [(SRReaderStorageBackend *)[(SRSensorReader *)self datastoreBackend] stopRecording:v6 reply:a3];
}

- (void)fetchDevices
{
}

- (void)fetchDevicesWithRetryAttempt:(int)a3
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__SRSensorReader_fetchDevicesWithRetryAttempt___block_invoke;
  v5[3] = &unk_26452EFB0;
  objc_copyWeak(&v6, &location);
  int v7 = a3;
  void v5[4] = self;
  [(SRSensorReader *)self fetchDevices:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __47__SRSensorReader_fetchDevicesWithRetryAttempt___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id Weak = objc_loadWeak((id *)(a1 + 40));
  int v7 = Weak;
  if (a3)
  {
    if (*(int *)(a1 + 48) <= 1
      && (int v8 = (void *)[a3 domain],
          [v8 isEqualToString:*MEMORY[0x263F07F70]])
      && [a3 code] == 4097)
    {
      id v9 = qword_26AB1A170;
      if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 40);
        int v13 = 138543362;
        uint64_t v14 = v10;
        _os_log_impl(&dword_21FCA3000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Connection was interrupted so retrying the fetchDevices request", (uint8_t *)&v13, 0xCu);
      }
      return [v7 fetchDevicesWithRetryAttempt:(*(_DWORD *)(a1 + 48) + 1)];
    }
    else
    {
      id v12 = +[SRError connectionNotFoundError];
      return [v7 fetchDevicesDidFailWithError:v12];
    }
  }
  else
  {
    return [Weak didFetchDevices:a2];
  }
}

- (void)fetchDevices:(id)a3
{
  double v5 = objc_alloc_init(SRReaderRequest);
  [(SRReaderRequest *)v5 setBundleIdentifier:self->_bundleId];
  [(SRReaderRequest *)v5 setSensor:self->_canonicalSensor];
  id v6 = [(SRSensorReader *)self datastoreBackend];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__SRSensorReader_fetchDevices___block_invoke;
  v7[3] = &unk_26452E380;
  v7[4] = a3;
  [(SRReaderStorageBackend *)v6 fetchDevices:v5 reply:v7];
}

uint64_t __31__SRSensorReader_fetchDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(a2);
        }
        int v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", 0x26D1690C8), "BOOLValue"))
        {
          id v9 = +[SRDevice currentDevice];
          -[SRDevice setDeviceIdentifier:](v9, "setDeviceIdentifier:", [v8 objectForKeyedSubscript:0x26D169008]);
        }
        else
        {
          id v9 = [[SRDevice alloc] initWithDeviceDetails:v8];
        }
        [v3 addObject:v9];
      }
      uint64_t v5 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isAuthorized
{
  id v3 = [(NSString *)self->_canonicalSensor sr_sensorByDeletingDeletionRecord];
  id v4 = [(NSDictionary *)[(SRAuthorizationClient *)[(SRSensorReader *)self authorizationClient] authorizedServices] objectForKeyedSubscript:self->_bundleId];

  return [v4 containsObject:v3];
}

- (SRAuthorizationStatus)authorizationStatus
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  p_authState = &self->_authState;
  unsigned int v4 = atomic_load((unsigned int *)&self->_authState);
  if (v4 == 0xFFFF)
  {
    uint64_t v5 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v15 = [(SRSensorReader *)self sensor];
      _os_log_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_INFO, "[%@] Fetching initial authorization state", buf, 0xCu);
    }
    uint64_t v6 = [(SRSensorReader *)self authorizationClient];
    int v7 = [(SRSensorReader *)self bundleId];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __37__SRSensorReader_authorizationStatus__block_invoke;
    v12[3] = &unk_26452EFD8;
    void v12[4] = self;
    int v13 = 0;
    [(SRAuthorizationClient *)v6 initialAuthorizationStateForBundleId:v7 authorizationState:v12];
  }
  signed int v8 = atomic_load((unsigned int *)p_authState);
  if (v8 == 0xFFFF)
  {
    id v9 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_FAULT))
    {
      id v11 = [(SRSensorReader *)self sensor];
      *(_DWORD *)buf = 138412290;
      long long v15 = v11;
      _os_log_fault_impl(&dword_21FCA3000, v9, OS_LOG_TYPE_FAULT, "[%@] returning an unknown authorization state!", buf, 0xCu);
    }
  }
  return (uint64_t)v8;
}

void __37__SRSensorReader_authorizationStatus__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "_updateAuthorizationStatusWithAuthorizedServices:deniedServices:dataCollectionEnabled:onboardingCompleted:lastModifiedTimes:forBundleIdentifier:previousAuthorizationStatus:", a2, a3, a4, a5, a6, objc_msgSend(*(id *)(a1 + 32), "bundleId"), *(int *)(a1 + 40));
  LODWORD(v7) = 0xFFFF;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1 + 32) + 24), (unsigned int *)&v7, 0);
  signed int v8 = qword_26AB1A170;
  if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_INFO))
  {
    if (v7 == 0xFFFF) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = (int)v7;
    }
    uint64_t v9 = [*(id *)(a1 + 32) sensor];
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    _os_log_impl(&dword_21FCA3000, v8, OS_LOG_TYPE_INFO, "[%{public}@] Authorization status set to %ld after initial update", buf, 0x16u);
  }
}

- (void)setAuthorizationStatus:(int64_t)a3
{
}

+ (void)requestAuthorizationForSensors:(NSSet *)sensors completion:(void *)completion
{
  uint64_t v6 = [MEMORY[0x263F086E0] mainBundle];

  +[SRSensorReader requestAuthorizationForBundle:v6 sensors:sensors legacyPromptErrorBehavior:0 withCompletionHandler:completion];
}

+ (void)requestAuthorizationForBundle:(id)a3 sensors:(id)a4 withCompletionHandler:(id)a5
{
}

+ (void)requestAuthorizationForBundle:(id)a3 sensors:(id)a4 legacyPromptErrorBehavior:(BOOL)a5 withCompletionHandler:(id)a6
{
  id v9 = a3;
  if (!a3) {
    id v9 = (id)[MEMORY[0x263F086E0] mainBundle];
  }
  if ([a4 count])
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    LOBYTE(v12) = a5;
    verifyPlist(v9, (uint64_t)a4);
    SRRequestAuthorizationForServices(objc_msgSend(v9, "bundleIdentifier", v11, 3221225472, __104__SRSensorReader_requestAuthorizationForBundle_sensors_legacyPromptErrorBehavior_withCompletionHandler___block_invoke, &unk_26452F000, a6, v12), (uint64_t)a4, (uint64_t)&v11);
  }
  else
  {
    uint64_t v10 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FCA3000, v10, OS_LOG_TYPE_DEFAULT, "Asking for auth but not for any sensors", buf, 2u);
    }
    if (a6) {
      (*((void (**)(id, void))a6 + 2))(a6, 0);
    }
  }
}

uint64_t __104__SRSensorReader_requestAuthorizationForBundle_sensors_legacyPromptErrorBehavior_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 40))
  {
    unsigned int v4 = (void *)[a2 domain];
    if ([v4 isEqualToString:SRErrorDomain] && objc_msgSend(v2, "code") == 8201) {
      v2 = 0;
    }
  }
  else if (a2)
  {
    uint64_t v5 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      signed int v8 = v2;
      _os_log_error_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_ERROR, "Error requesting authorization: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    v2 = (void *)[MEMORY[0x263F087E8] errorWithUnderlyingErrorFromExistingError:v2];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, v2);
  }
  return result;
}

+ (void)authorizationRequestStatusForBundle:(id)a3 sensors:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  if (!a3) {
    id v7 = (id)[MEMORY[0x263F086E0] mainBundle];
  }
  if ([a4 count])
  {
    uint64_t v8 = [v7 bundleIdentifier];
    SRAuthorizationStatusForBundleIdentifier(v8, (uint64_t)a4, (uint64_t)a5);
  }
  else
  {
    uint64_t v9 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_21FCA3000, v9, OS_LOG_TYPE_DEFAULT, "Asking for auth but not for any sensors", v10, 2u);
    }
    (*((void (**)(id, void, void))a5 + 2))(a5, 0, 0);
  }
}

- (BOOL)_updateAuthorizationStatusWithAuthorizedServices:(id)a3 deniedServices:(id)a4 dataCollectionEnabled:(BOOL)a5 onboardingCompleted:(BOOL)a6 lastModifiedTimes:(id)a7 forBundleIdentifier:(id)a8 previousAuthorizationStatus:(int64_t)a9
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (a8)
  {
    bundleId = self->_bundleId;
    if (bundleId)
    {
      if (![(NSString *)bundleId isEqualToString:a8])
      {
        uint64_t v23 = qword_26AB1A170;
        if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_INFO))
        {
          canonicalSensor = self->_canonicalSensor;
          long long v25 = self->_bundleId;
          int v34 = 138543874;
          v35 = canonicalSensor;
          __int16 v36 = 2114;
          *(void *)v37 = a8;
          *(_WORD *)&v37[8] = 2114;
          uint64_t v38 = (uint64_t)v25;
          _os_log_impl(&dword_21FCA3000, v23, OS_LOG_TYPE_INFO, "[%{public}@] Ignoring authorization changed update for bundle %{public}@. I'm interested in %{public}@", (uint8_t *)&v34, 0x20u);
        }
        return 0;
      }
    }
  }
  id v17 = [(NSString *)self->_canonicalSensor sr_sensorByDeletingDeletionRecord];
  __int16 v18 = (void *)[a7 objectForKeyedSubscript:v17];
  if (v18)
  {
    long long v19 = (void *)MEMORY[0x263EFF910];
    [v18 doubleValue];
    uint64_t v20 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    uint64_t v20 = 0;
  }
  [(SRSensorReader *)self set_lastModifiedAuthorizationTime:v20];
  if (!v10 || v11)
  {
    if (!v11 || v10)
    {
      if ([a3 containsObject:v17])
      {
        uint64_t v21 = 1;
      }
      else if ([a4 containsObject:v17])
      {
        uint64_t v21 = 2;
      }
      else
      {
        uint64_t v21 = 0;
      }
    }
    else
    {
      id v22 = qword_26AB1A170;
      if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_FAULT))
      {
        v33 = self->_canonicalSensor;
        int v34 = 138543874;
        v35 = v33;
        __int16 v36 = 1026;
        *(_DWORD *)v37 = 0;
        *(_WORD *)&v37[4] = 1026;
        *(_DWORD *)&v37[6] = 1;
        _os_log_fault_impl(&dword_21FCA3000, v22, OS_LOG_TYPE_FAULT, "[%{public}@] Unexpected authorization state. onboarding: %{public, BOOL}d, collection enabled: %{public, BOOL}d", (uint8_t *)&v34, 0x18u);
      }
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = 2;
  }
  if (v21 == a9) {
    return 0;
  }
  [(SRSensorReader *)self setAuthorizationStatus:v21];
  uint64_t v28 = qword_26AB1A170;
  if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_INFO))
  {
    v29 = self->_canonicalSensor;
    v30 = self->_bundleId;
    int v34 = 138543874;
    v35 = v29;
    __int16 v36 = 2114;
    *(void *)v37 = v30;
    *(_WORD *)&v37[8] = 2048;
    uint64_t v38 = v21;
    _os_log_impl(&dword_21FCA3000, v28, OS_LOG_TYPE_INFO, "Authorization state for sensor %{public}@, bundle %{public}@ now %lu", (uint8_t *)&v34, 0x20u);
  }
  if (qword_26AB1A178 != -1) {
    dispatch_once(&qword_26AB1A178, &__block_literal_global_13);
  }
  if (!_MergedGlobals_11) {
    return 1;
  }
  if ((v21 | 2) == 2) {
    uint64_t v21 = 0;
  }
  v31 = qword_26AB1A170;
  BOOL v26 = 1;
  if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_INFO))
  {
    v32 = self->_canonicalSensor;
    int v34 = 138543618;
    v35 = v32;
    __int16 v36 = 1026;
    *(_DWORD *)v37 = v21 != 0;
    _os_log_impl(&dword_21FCA3000, v31, OS_LOG_TYPE_INFO, "[%{public}@] Setting authorization state for legacy reader to %{public, BOOL}d", (uint8_t *)&v34, 0x12u);
  }
  return v26;
}

- (BOOL)_updateAuthorizationStatusWithAuthorizedServices:(id)a3 deniedServices:(id)a4 dataCollectionEnabled:(BOOL)a5 onboardingCompleted:(BOOL)a6 lastModifiedTimes:(id)a7 forBundleIdentifier:(id)a8
{
  return [(SRSensorReader *)self _updateAuthorizationStatusWithAuthorizedServices:a3 deniedServices:a4 dataCollectionEnabled:a5 onboardingCompleted:a6 lastModifiedTimes:a7 forBundleIdentifier:a8 previousAuthorizationStatus:[(SRSensorReader *)self authorizationStatus]];
}

- (void)authorizedServicesDidChange:(id)a3 deniedServices:(id)a4 dataCollectionEnabled:(BOOL)a5 onboardingCompleted:(BOOL)a6 lastModifiedTimes:(id)a7 forBundleIdentifier:(id)a8
{
  if ([(SRSensorReader *)self _updateAuthorizationStatusWithAuthorizedServices:a3 deniedServices:a4 dataCollectionEnabled:a5 onboardingCompleted:a6 lastModifiedTimes:a7 forBundleIdentifier:a8])
  {
    SRAuthorizationStatus v9 = [(SRSensorReader *)self authorizationStatus];
    [(SRSensorReader *)self didChangeAuthorizationStatus:v9];
  }
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (NSString)canonicalSensor
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCanonicalSensor:(id)a3
{
}

- (SRAuthorizationClient)authorizationClient
{
  return (SRAuthorizationClient *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAuthorizationClient:(id)a3
{
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBundleId:(id)a3
{
}

- (NSDate)_lastModifiedAuthorizationTime
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)set_lastModifiedAuthorizationTime:(id)a3
{
}

- (NSString)requestedSensor
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRequestedSensor:(id)a3
{
}

- (SRReaderStorageBackend)datastoreBackend
{
  return self->_datastoreBackend;
}

- (void)setDatastoreBackend:(id)a3
{
}

- (Class)sampleClass
{
  return self->_sampleClass;
}

- (Class)exportingSampleClass
{
  return self->_exportingSampleClass;
}

- (BOOL)bypassHoldingPeriod
{
  return self->_bypassHoldingPeriod;
}

- (void)setBypassHoldingPeriod:(BOOL)a3
{
  self->_bypassHoldingPeriod = a3;
}

- (void).cxx_destruct
{
}

+ (void)_requestAuthorizationMigrationForSensors:(id)a3 completion:(id)a4
{
  if ([a3 count])
  {
    uint64_t v6 = (void *)[MEMORY[0x263F086E0] mainBundle];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __94__SRSensorReader_AuthorizationMigration___requestAuthorizationMigrationForSensors_completion___block_invoke;
    v8[3] = &unk_26452E1D0;
    v8[4] = a4;
    SRRequestAuthorizationMigrationForServices(v6, (uint64_t)a3, (uint64_t)v8);
  }
  else
  {
    id v7 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FCA3000, v7, OS_LOG_TYPE_DEFAULT, "Asking for auth but not for any sensors", buf, 2u);
    }
    if (a4) {
      (*((void (**)(id, void))a4 + 2))(a4, 0);
    }
  }
}

uint64_t __94__SRSensorReader_AuthorizationMigration___requestAuthorizationMigrationForSensors_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = a2;
    unsigned int v4 = qword_26AB1A170;
    if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      uint64_t v7 = v3;
      _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Error requesting authorization: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    a2 = [MEMORY[0x263F087E8] errorWithUnderlyingErrorFromExistingError:v3];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

@end