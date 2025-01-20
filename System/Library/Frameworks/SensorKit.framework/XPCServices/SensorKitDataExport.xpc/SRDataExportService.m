@interface SRDataExportService
+ (void)initialize;
- (BOOL)firstSample;
- (BOOL)firstSensor;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)sensorReader:(id)a3 fetchingRequest:(id)a4 didFetchResult:(id)a5;
- (BOOL)streamSample:(id)a3 sensor:(id)a4;
- (BOOL)writeJSON:(id)a3;
- (BOOL)writeSample:(id)a3 device:(id)a4 timestamp:(double)a5 sampleDict:(id)a6 streaming:(BOOL)a7;
- (NSMutableArray)devices;
- (NSMutableSet)sensors;
- (NSOutputStream)outputStream;
- (NSURL)outputURL;
- (NSXPCListener)listener;
- (SRDataExportService)initWithQueue:(id)a3;
- (SRDataExportService)initWithQueue:(id)a3 listener:(id)a4;
- (SRMultiSampleExporting)multiSampleExporter;
- (SRSensorReader)currentReader;
- (id)completionHandler;
- (void)cancelWithReply:(id)a3;
- (void)dealloc;
- (void)endJSON;
- (void)endSensorJSON;
- (void)exportData;
- (void)exportDataForSensors:(id)a3 outputStream:(id)a4 fetchRequest:(id)a5 createReader:(id)a6 reply:(id)a7;
- (void)exportDataForSensors:(id)a3 reply:(id)a4;
- (void)exportDataForSensors:(id)a3 toBaseDirectory:(id)a4 completionHandler:(id)a5;
- (void)exportDataForSensors:(id)a3 toBaseDirectory:(id)a4 createReader:(id)a5 completionHandler:(id)a6;
- (void)invalidate;
- (void)replyWithError:(id)a3;
- (void)resume;
- (void)sensorReader:(id)a3 didCompleteFetch:(id)a4;
- (void)sensorReader:(id)a3 fetchingRequest:(id)a4 failedWithError:(id)a5;
- (void)setCompletionHandler:(id)a3;
- (void)setCurrentReader:(id)a3;
- (void)setDevices:(id)a3;
- (void)setFirstSample:(BOOL)a3;
- (void)setFirstSensor:(BOOL)a3;
- (void)setListener:(id)a3;
- (void)setMultiSampleExporter:(id)a3;
- (void)setOutputStream:(id)a3;
- (void)setOutputURL:(id)a3;
- (void)setSensors:(id)a3;
- (void)startJSON;
- (void)startSensorJSON:(id)a3;
- (void)writeMetadataFragmentWithDevice:(id)a3 timestamp:(double)a4;
- (void)writeOne:(unsigned __int8)a3;
@end

@implementation SRDataExportService

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_100016B90 = (uint64_t)os_log_create("com.apple.SensorKit", "DataExport");
    if (sub_100005E64())
    {
      *(void *)buf = 0;
      v6 = buf;
      uint64_t v7 = 0x3052000000;
      v8 = sub_100005FA8;
      v9 = sub_100005FB8;
      uint64_t v2 = qword_100016B98;
      uint64_t v10 = qword_100016B98;
      if (!qword_100016B98)
      {
        v4[0] = _NSConcreteStackBlock;
        v4[1] = 3221225472;
        v4[2] = sub_100005FC4;
        v4[3] = &unk_100010410;
        v4[4] = buf;
        sub_100005FC4((uint64_t)v4);
        uint64_t v2 = *((void *)v6 + 5);
      }
      _Block_object_dispose(buf, 8);
      if (!v2)
      {
        v3 = qword_100016B90;
        if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Failed to find SRStreamBlockSample when it should be there", buf, 2u);
        }
      }
    }
  }
}

- (SRDataExportService)initWithQueue:(id)a3
{
  v5 = +[NSXPCListener serviceListener];
  [(NSXPCListener *)v5 _setQueue:a3];

  return [(SRDataExportService *)self initWithQueue:a3 listener:v5];
}

- (SRDataExportService)initWithQueue:(id)a3 listener:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SRDataExportService;
  v6 = [(SRDataExportService *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_q = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v7->_completionHandler = 0;
    v7->_createReader = 0;
    v8 = (NSXPCListener *)a4;
    v7->_listener = v8;
    [(NSXPCListener *)v8 setDelegate:v7];
  }
  return v7;
}

- (void)dealloc
{
  [(SRDataExportService *)self setOutputStream:0];
  [(SRDataExportService *)self setCurrentReader:0];
  [(SRDataExportService *)self setSensors:0];
  [(SRDataExportService *)self setOutputURL:0];
  [(SRDataExportService *)self setListener:0];
  [(SRDataExportService *)self setDevices:0];
  [(SRDataExportService *)self setCompletionHandler:0];
  [(SRDataExportService *)self setMultiSampleExporter:0];

  dispatch_release((dispatch_object_t)self->_q);
  v3.receiver = self;
  v3.super_class = (Class)SRDataExportService;
  [(SRDataExportService *)&v3 dealloc];
}

- (void)resume
{
  uint64_t v2 = [(SRDataExportService *)self listener];

  [(NSXPCListener *)v2 resume];
}

- (void)invalidate
{
  [(SRDataExportService *)self setDevices:0];
  [(SRDataExportService *)self setMultiSampleExporter:0];

  self->_fetchRequest = 0;
  self->_exporting = 0;
}

- (void)replyWithError:(id)a3
{
  if (a3)
  {
    v5 = 0;
LABEL_3:
    v6 = 0;
    goto LABEL_4;
  }
  v8 = [(SRDataExportService *)self outputURL];
  v5 = v8;
  if (!v8) {
    goto LABEL_3;
  }
  [(NSURL *)v8 fileSystemRepresentation];
  v9 = (void *)sandbox_extension_issue_file();
  objc_super v10 = qword_100016B90;
  if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    v12 = v5;
    __int16 v13 = 2082;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Tried to issue sandbox extension for %{public}@. Got %{public}s", (uint8_t *)&v11, 0x16u);
  }
  if (!v9) {
    goto LABEL_3;
  }
  v6 = +[NSString stringWithUTF8String:v9];
  free(v9);
LABEL_4:
  if ([(SRDataExportService *)self completionHandler])
  {
    uint64_t v7 = [(SRDataExportService *)self completionHandler];
    ((void (**)(id, NSURL *, NSString *, id))v7)[2](v7, v5, v6, a3);
  }
  [(SRDataExportService *)self invalidate];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v7 = qword_100016B90;
  if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = [a3 serviceName];
    __int16 v12 = 2112;
    id v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Got a connection attempt on %@ from %@", buf, 0x16u);
  }
  [a4 _setQueue:self->_q];
  objc_msgSend(a4, "setExportedInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SRDataExportProtocol));
  [a4 setExportedObject:self];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000458C;
  v9[3] = &unk_100010348;
  v9[4] = self;
  [a4 setInvalidationHandler:v9];
  self->_connection = (NSXPCConnection *)a4;
  [a4 resume];
  return 1;
}

- (void)exportDataForSensors:(id)a3 reply:(id)a4
{
  if (self->_exporting)
  {
    v5 = qword_100016B90;
    if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Already busy exporting. Cancel the previous attempt before requesting another one", buf, 2u);
    }
    v6 = +[SRError errorWithCode:8195];
LABEL_13:
    id v13 = v6;
    goto LABEL_14;
  }
  id v9 = [+[NSXPCConnection currentConnection] valueForEntitlement:@"com.apple.private.sensorkit.reader.wildcard.allow"];
  if (!v9
    || (objc_super v10 = v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v10 BOOLValue] & 1) == 0)
  {
    __int16 v12 = qword_100016B90;
    if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Connection does not have a valid entitlement", buf, 2u);
    }
    v6 = (SRError *)+[SRError invalidEntitlementError];
    goto LABEL_13;
  }
  self->_exporting = 1;
  id v11 = sub_100003E84();
  v15 = 0;
  if ([+[NSFileManager defaultManager] createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v15])
  {
    [(SRDataExportService *)self exportDataForSensors:a3 toBaseDirectory:v11 completionHandler:a4];
    return;
  }
  v14 = qword_100016B90;
  if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to create output directory because %{public}@", buf, 0xCu);
  }
  id v13 = v15;
LABEL_14:
  (*((void (**)(id, void, void, SRError *))a4 + 2))(a4, 0, 0, v13);
}

- (void)cancelWithReply:(id)a3
{
  v5 = qword_100016B90;
  if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Cancelling data export", v6, 2u);
  }
  [(SRDataExportService *)self invalidate];
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)exportDataForSensors:(id)a3 toBaseDirectory:(id)a4 completionHandler:(id)a5
{
}

- (void)exportDataForSensors:(id)a3 toBaseDirectory:(id)a4 createReader:(id)a5 completionHandler:(id)a6
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  id v11 = objc_alloc_init((Class)NSDateFormatter);
  [v11 setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
  __int16 v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SensorAndUsageData-%@.lz4", objc_msgSend(v11, "stringFromDate:", +[NSDate date](NSDate, "date")));

  id v13 = +[NSURL fileURLWithPath:v12 isDirectory:0 relativeToURL:a4];
  v14 = sub_100007328([SRCompressedOutputStream alloc], (uint64_t)v13, 256);
  if (v14)
  {
    id v17 = v14;
    [(SRDataExportService *)self setOutputURL:v13];
    id v15 = objc_alloc_init((Class)SRFetchRequest);
    [v15 setFrom:0.0];
    [v15 setTo:INFINITY];
    [(SRDataExportService *)self exportDataForSensors:a3 outputStream:v17 fetchRequest:v15 createReader:a5 reply:a6];
  }
  else
  {
    v16 = qword_100016B90;
    if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error initializing compression stream", buf, 2u);
    }
    (*((void (**)(id, void, void, SRError *))a6 + 2))(a6, 0, 0, +[SRError errorWithCode:8194]);
  }
}

- (void)exportDataForSensors:(id)a3 outputStream:(id)a4 fetchRequest:(id)a5 createReader:(id)a6 reply:(id)a7
{
  self->_completionHandler = [a7 copy];
  [(SRDataExportService *)self setSensors:+[NSMutableSet setWithSet:a3]];
  if ([(NSMutableSet *)self->_sensors count])
  {
    self->_fetchRequest = (SRFetchRequest *)a5;
    self->_outputStream = (NSOutputStream *)a4;
    self->_createReader = [a6 copy];
    [(SRDataExportService *)self startJSON];
    [(SRDataExportService *)self exportData];
  }
  else
  {
    __int16 v12 = qword_100016B90;
    if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No sensor identifiers found", v13, 2u);
    }
    [(SRDataExportService *)self replyWithError:0];
  }
}

- (void)startJSON
{
  [(NSOutputStream *)self->_outputStream open];
  self->_firstSensor = 1;
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:@"Data in this file is not intended for medical purposes" forKeyedSubscript:@"general"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = [(SRDataExportService *)self sensors];
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v8);
        id v11 = objc_msgSend(+[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", v9), "localizedAdditionalSampleDataNote");
        if (v11) {
          [v3 setObject:v11 forKeyedSubscript:v9];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }
  uint64_t v18 = 0;
  __int16 v12 = +[NSJSONSerialization dataWithJSONObject:v3 options:1 error:&v18];
  uint64_t v13 = v18;
  if (v18)
  {
    v14 = qword_100016B90;
    if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Can't serialize disclaimer strings %@", buf, 0xCu);
    }
  }
  id v15 = [objc_alloc((Class)NSString) initWithData:v12 encoding:4];
  v16 = +[NSString stringWithFormat:@"{\"disclaimer\": %@,\"%@\": [", v15, @"SensorAndUsageData"];

  id v17 = [(NSString *)v16 dataUsingEncoding:4];
  [(NSOutputStream *)self->_outputStream write:[(NSData *)v17 bytes] maxLength:[(NSData *)v17 length]];
}

- (void)endJSON
{
  id v3 = [@"]}" dataUsingEncoding:4];
  -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", [v3 bytes], objc_msgSend(v3, "length"));
  outputStream = self->_outputStream;

  [(NSOutputStream *)outputStream close];
}

- (void)startSensorJSON:(id)a3
{
  if (self->_firstSensor) {
    CFStringRef v4 = &stru_1000106F8;
  }
  else {
    CFStringRef v4 = @",";
  }
  id v5 = [+[NSString stringWithFormat:@"%@{\"%@\": [", v4, a3] dataUsingEncoding:4];
  self->_firstSensor = 0;
  outputStream = self->_outputStream;
  id v7 = [(NSData *)v5 bytes];
  id v8 = [(NSData *)v5 length];

  [(NSOutputStream *)outputStream write:v7 maxLength:v8];
}

- (void)endSensorJSON
{
  id v3 = [@"]}" dataUsingEncoding:4];
  outputStream = self->_outputStream;
  id v5 = [v3 bytes];
  id v6 = [v3 length];

  [(NSOutputStream *)outputStream write:v5 maxLength:v6];
}

- (void)exportData
{
  if ([(NSMutableSet *)self->_sensors count])
  {
    id v3 = [(NSMutableSet *)self->_sensors anyObject];

    self->_currentReader = (SRSensorReader *)(*((uint64_t (**)(void))self->_createReader + 2))();
    [(SRSensorReader *)[(SRDataExportService *)self currentReader] setDelegate:self];
    [(SRSensorReader *)[(SRDataExportService *)self currentReader] setBypassHoldingPeriod:1];
    [(SRDataExportService *)self startSensorJSON:v3];
    objc_initWeak(&location, self);
    CFStringRef v4 = [(SRDataExportService *)self currentReader];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100005154;
    v5[3] = &unk_1000103B0;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    [(SRSensorReader *)v4 fetchDevices:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SRDataExportService *)self endJSON];
    [(SRDataExportService *)self replyWithError:0];
  }
}

- (void)sensorReader:(id)a3 fetchingRequest:(id)a4 failedWithError:(id)a5
{
  objc_sync_enter(self);
  [(SRDataExportService *)self endSensorJSON];
  id v8 = qword_100016B90;
  if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543618;
    id v10 = [a3 sensor];
    __int16 v11 = 2114;
    id v12 = a5;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error exporting data for %{public}@. %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(SRDataExportService *)self replyWithError:a5];
  objc_sync_exit(self);
}

- (void)sensorReader:(id)a3 didCompleteFetch:(id)a4
{
  objc_sync_enter(self);
  if ([(SRDataExportService *)self multiSampleExporter])
  {
    id v6 = [(NSMutableArray *)self->_devices lastObject];
    id v7 = [(SRMultiSampleExporting *)[(SRDataExportService *)self multiSampleExporter] sr_endMultiSampleStream];
    if (v7) {
      [(SRDataExportService *)self writeSample:0 device:v6 timestamp:v7 sampleDict:0 streaming:self->_latestTimestamp];
    }
    [(SRDataExportService *)self setMultiSampleExporter:0];
  }
  [(NSMutableArray *)self->_devices removeLastObject];
  if ([(NSMutableArray *)self->_devices count])
  {
    [(SRFetchRequest *)self->_fetchRequest setDevice:[(NSMutableArray *)self->_devices lastObject]];
    [(SRSensorReader *)[(SRDataExportService *)self currentReader] fetch:self->_fetchRequest];
  }
  else
  {
    [(SRDataExportService *)self endSensorJSON];
    -[NSMutableSet removeObject:](-[SRDataExportService sensors](self, "sensors"), "removeObject:", [a3 sensor]);
    id v8 = qword_100016B90;
    if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543618;
      id v10 = [a3 sensor];
      __int16 v11 = 2114;
      id v12 = [(SRDataExportService *)self sensors];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Successfully completed exported %{public}@. %{public}@ to go", (uint8_t *)&v9, 0x16u);
    }
    [(SRDataExportService *)self exportData];
  }
  objc_sync_exit(self);
}

- (void)writeOne:(unsigned __int8)a3
{
  unsigned __int8 v3 = a3;
  [(NSOutputStream *)self->_outputStream write:&v3 maxLength:1];
}

- (BOOL)writeJSON:(id)a3
{
  if ([(SRDataExportService *)self outputStream])
  {
    id v11 = 0;
    +[NSJSONSerialization writeJSONObject:a3 toStream:self->_outputStream options:1 error:&v11];
    id v5 = [v11 description];
    BOOL v6 = v5 == 0;
    if (v5)
    {
      id v7 = qword_100016B90;
      if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_FAULT))
      {
        id v10 = [(SRSensorReader *)[(SRDataExportService *)self currentReader] sensor];
        *(_DWORD *)buf = 138543874;
        id v13 = a3;
        __int16 v14 = 2114;
        id v15 = v10;
        __int16 v16 = 2114;
        id v17 = v5;
        _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Invalid JSON object returned from sample %{public}@ for %{public}@ because %{public}@", buf, 0x20u);
      }
      +[NSJSONSerialization writeJSONObject:&__NSDictionary0__struct toStream:self->_outputStream options:1 error:&v11];
    }
  }
  else
  {
    id v8 = qword_100016B90;
    BOOL v6 = 0;
    if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Output stream is no longer valid", buf, 2u);
      return 0;
    }
  }
  return v6;
}

- (void)writeMetadataFragmentWithDevice:(id)a3 timestamp:(double)a4
{
  [(NSOutputStream *)self->_outputStream write:"\"metadata\":" maxLength:11];
  v7[0] = @"device";
  v7[1] = @"timestamp";
  v8[0] = objc_msgSend(a3, "sr_dictionaryRepresentation");
  v8[1] = +[NSNumber numberWithDouble:a4];
  [(SRDataExportService *)self writeJSON:+[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2]];
  -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", ",\"sample\":", 10);
}

- (BOOL)writeSample:(id)a3 device:(id)a4 timestamp:(double)a5 sampleDict:(id)a6 streaming:(BOOL)a7
{
  BOOL v7 = a7;
  if (!self->_firstSample) {
    [(SRDataExportService *)self writeOne:44];
  }
  self->_firstSample = 0;
  unsigned int v13 = 0;
  if ([a3 conformsToProtocol:&OBJC_PROTOCOL___SRSampleDirectExporting]) {
    unsigned int v13 = objc_msgSend(a3, "sr_prefersUTF8StringRepresentation");
  }
  if (v7)
  {
    int v14 = 0;
  }
  else if ([(SRDataExportService *)self multiSampleExporter])
  {
    int v14 = 0;
  }
  else
  {
    int v14 = v13 ^ 1;
  }
  id v15 = [(SRSensorReader *)[(SRDataExportService *)self currentReader] sensor];
  [(SRDataExportService *)self writeOne:123];
  [(SRDataExportService *)self writeMetadataFragmentWithDevice:a4 timestamp:a5];
  if (v7)
  {
    unsigned __int8 v16 = [(SRDataExportService *)self streamSample:a3 sensor:v15];
LABEL_18:
    BOOL v19 = v16;
    goto LABEL_19;
  }
  if (v14)
  {
    id v17 = objc_msgSend(a3, "sr_dictionaryRepresentation");
    uint64_t v18 = self;
LABEL_17:
    unsigned __int8 v16 = [(SRDataExportService *)v18 writeJSON:v17];
    goto LABEL_18;
  }
  if (!v13)
  {
    uint64_t v18 = self;
    id v17 = a6;
    goto LABEL_17;
  }
  BOOL v19 = objc_msgSend(a3, "sr_writeUTF8RepresentationToOutputStream:", self->_outputStream) != 0;
LABEL_19:
  [(SRDataExportService *)self writeOne:125];
  return v19;
}

- (BOOL)sensorReader:(id)a3 fetchingRequest:(id)a4 didFetchResult:(id)a5
{
  int v9 = (SRMultiSampleExporting *)[a5 sample];
  id v10 = (objc_class *)[a3 exportingSampleClass];
  id v11 = v9;
  if (v10)
  {
    if (self->_shouldStartNewMultiSampleExporter)
    {
      id v11 = (SRMultiSampleExporting *)objc_alloc_init(v10);
      [(SRDataExportService *)self setMultiSampleExporter:v11];
      [(SRMultiSampleExporting *)[(SRDataExportService *)self multiSampleExporter] sr_beginMultiSampleStream];
    }
    else
    {
      id v11 = [(SRDataExportService *)self multiSampleExporter];
    }
  }
  unsigned int v12 = [(SRMultiSampleExporting *)v11 conformsToProtocol:&OBJC_PROTOCOL___SRMultiSampleExporting];
  if (objc_opt_respondsToSelector()) {
    unsigned int v13 = 1;
  }
  else {
    unsigned int v13 = [(SRMultiSampleExporting *)v11 conformsToProtocol:&OBJC_PROTOCOL___SRSampleDirectExporting];
  }
  char v14 = objc_opt_respondsToSelector();
  if (objc_opt_respondsToSelector()) {
    char v14 = [(SRMultiSampleExporting *)v11 performSelector:"sr_prefersUTF8StringRepresentation"] == 0;
  }
  if ((v12 | v13) & 1) != 0 || (v14)
  {
    [a5 timestamp];
    self->_latestTimestamp = v17;
    objc_sync_enter(self);
    if (v12)
    {
      id v18 = [(SRMultiSampleExporting *)[(SRDataExportService *)self multiSampleExporter] sr_dictionaryRepresentationWithSample:v9];
      if (!v18)
      {
        self->_shouldStartNewMultiSampleExporter = 0;
        BOOL v16 = 1;
        goto LABEL_20;
      }
      self->_shouldStartNewMultiSampleExporter = 1;
    }
    else
    {
      id v18 = 0;
    }
    id v19 = [a4 device];
    [a5 timestamp];
    BOOL v16 = -[SRDataExportService writeSample:device:timestamp:sampleDict:streaming:](self, "writeSample:device:timestamp:sampleDict:streaming:", v9, v19, v18, v14 & 1);
LABEL_20:
    objc_sync_exit(self);
    goto LABEL_21;
  }
  id v15 = qword_100016B90;
  if (os_log_type_enabled((os_log_t)qword_100016B90, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = [a3 sensor];
    _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "The sample class for %{public}@ must conform to either SRSampleExporting, SRSampleDirectExporting or SRMultiSampleExporting.", buf, 0xCu);
  }
  BOOL v16 = 0;
LABEL_21:
  return v16;
}

- (BOOL)streamSample:(id)a3 sensor:(id)a4
{
  -[SRDataExportService writeOne:](self, "writeOne:", 91, a4);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(a3, "sr_exportRepresentationEnumerator", 0);
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    char v10 = 1;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        if ((v10 & 1) == 0) {
          [(SRDataExportService *)self writeOne:44];
        }
        if (objc_opt_respondsToSelector()) {
          id v12 = [v12 performSelector:"sr_dictionaryRepresentation"];
        }
        unsigned int v14 = [(SRDataExportService *)self writeJSON:v12];
        if (!v14)
        {
          BOOL v15 = 0;
          goto LABEL_15;
        }
        char v10 = 0;
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      char v10 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_15:
  [(SRDataExportService *)self writeOne:93];
  return v15;
}

- (NSMutableSet)sensors
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSensors:(id)a3
{
}

- (NSURL)outputURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOutputURL:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 88, 1);
}

- (void)setListener:(id)a3
{
}

- (SRSensorReader)currentReader
{
  return (SRSensorReader *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCurrentReader:(id)a3
{
}

- (NSMutableArray)devices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDevices:(id)a3
{
}

- (NSOutputStream)outputStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 112, 1);
}

- (void)setOutputStream:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (SRMultiSampleExporting)multiSampleExporter
{
  return (SRMultiSampleExporting *)objc_getProperty(self, a2, 128, 1);
}

- (void)setMultiSampleExporter:(id)a3
{
}

- (BOOL)firstSensor
{
  return self->_firstSensor;
}

- (void)setFirstSensor:(BOOL)a3
{
  self->_firstSensor = a3;
}

- (BOOL)firstSample
{
  return self->_firstSample;
}

- (void)setFirstSample:(BOOL)a3
{
  self->_firstSample = a3;
}

@end