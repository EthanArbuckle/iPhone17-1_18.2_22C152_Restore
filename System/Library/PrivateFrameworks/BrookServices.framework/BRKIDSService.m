@interface BRKIDSService
+ (id)sharedInstance;
- (BRKIDSService)init;
- (BRKIDSServiceCompanionContextManagerDelegate)companionContextManagerDelegate;
- (BRKIDSServiceCompanionDataCollectionDelegate)dataCollectionDelegate;
- (BRKIDSServiceContextManagerDelegate)contextManagerDelegate;
- (IDSService)idsService;
- (id)sendProtobuf:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 completionHandler:(id)a6 withTimeout:(double)a7;
- (id)sendResourceAtURL:(id)a3 metadata:(id)a4 priority:(int64_t)a5 completionHandler:(id)a6 withTimeout:(double)a7;
- (void)locationManagerDidEnterRegion:(id)a3;
- (void)locationManagerDidExitRegion:(id)a3;
- (void)locationManagerStartMonitoringForRegion:(id)a3;
- (void)locationManagerStopMonitoringForRegion:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setCompanionContextManagerDelegate:(id)a3;
- (void)setContextManagerDelegate:(id)a3;
- (void)setDataCollectionDelegate:(id)a3;
- (void)setIdsService:(id)a3;
@end

@implementation BRKIDSService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_idsService;
  return v2;
}

uint64_t __31__BRKIDSService_sharedInstance__block_invoke()
{
  sharedInstance_idsService = objc_alloc_init(BRKIDSService);
  return MEMORY[0x270F9A758]();
}

- (BRKIDSService)init
{
  v9.receiver = self;
  v9.super_class = (Class)BRKIDSService;
  v2 = [(BRKIDSService *)&v9 init];
  if (v2)
  {
    v3 = dispatch_get_global_queue(21, 0);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.brook.ids", 0, v3);
    idsQueue = v2->_idsQueue;
    v2->_idsQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.brook"];
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v6;

    [(IDSService *)v2->_idsService setProtobufAction:sel_locationManagerDidEnterRegion_ forIncomingRequestsOfType:5];
    [(IDSService *)v2->_idsService setProtobufAction:sel_locationManagerDidExitRegion_ forIncomingRequestsOfType:6];
    [(IDSService *)v2->_idsService setProtobufAction:sel_locationManagerStartMonitoringForRegion_ forIncomingRequestsOfType:3];
    [(IDSService *)v2->_idsService setProtobufAction:sel_locationManagerStopMonitoringForRegion_ forIncomingRequestsOfType:4];
    [(IDSService *)v2->_idsService addDelegate:v2 queue:v2->_idsQueue];
  }
  return v2;
}

- (void)locationManagerDidEnterRegion:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [BRKIDSMessage alloc];
  uint64_t v6 = [v4 data];

  v7 = [(BRKIDSMessage *)v5 initWithData:v6];
  v8 = BRKLoggingObjectForDomain(11);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315394;
    v24 = "-[BRKIDSService locationManagerDidEnterRegion:]";
    __int16 v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_2399EB000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v23, 0x16u);
  }

  [(BRKIDSMessage *)v7 latitude];
  CLLocationDegrees v10 = v9;
  [(BRKIDSMessage *)v7 longitude];
  CLLocationCoordinate2D v28 = CLLocationCoordinate2DMake(v10, v11);
  double latitude = v28.latitude;
  double longitude = v28.longitude;
  if (CLLocationCoordinate2DIsValid(v28)
    && [(BRKIDSMessage *)v7 hasIdentifier]
    && [(BRKIDSMessage *)v7 hasRadius])
  {
    id v14 = objc_alloc(MEMORY[0x263F00A28]);
    [(BRKIDSMessage *)v7 radius];
    double v16 = v15;
    v17 = [(BRKIDSMessage *)v7 identifier];
    v18 = (BRKIDSMessage *)objc_msgSend(v14, "initWithCenter:radius:identifier:", v17, latitude, longitude, v16);

    v19 = BRKLoggingObjectForDomain(11);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315394;
      v24 = "-[BRKIDSService locationManagerDidEnterRegion:]";
      __int16 v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_2399EB000, v19, OS_LOG_TYPE_DEFAULT, "%s locationManagerDidEnterRegion: %@", (uint8_t *)&v23, 0x16u);
    }

    v20 = [(BRKIDSService *)self contextManagerDelegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      v22 = [(BRKIDSService *)self contextManagerDelegate];
      [v22 didEnter:self forRegion:v18];
    }
  }
}

- (void)locationManagerDidExitRegion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = BRKLoggingObjectForDomain(11);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    v12 = "-[BRKIDSService locationManagerDidExitRegion:]";
    _os_log_impl(&dword_2399EB000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  v5 = [BRKIDSMessage alloc];
  uint64_t v6 = [v3 data];

  v7 = [(BRKIDSMessage *)v5 initWithData:v6];
  [(BRKIDSMessage *)v7 latitude];
  CLLocationDegrees v9 = v8;
  [(BRKIDSMessage *)v7 longitude];
  CLLocationCoordinate2D v14 = CLLocationCoordinate2DMake(v9, v10);
  if (CLLocationCoordinate2DIsValid(v14)) {
    [(BRKIDSMessage *)v7 hasIdentifier];
  }
}

- (void)locationManagerStartMonitoringForRegion:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = BRKLoggingObjectForDomain(11);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315138;
    v24 = "-[BRKIDSService locationManagerStartMonitoringForRegion:]";
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v23, 0xCu);
  }

  uint64_t v6 = [BRKIDSMessage alloc];
  v7 = [v4 data];

  double v8 = [(BRKIDSMessage *)v6 initWithData:v7];
  [(BRKIDSMessage *)v8 latitude];
  CLLocationDegrees v10 = v9;
  [(BRKIDSMessage *)v8 longitude];
  CLLocationCoordinate2D v28 = CLLocationCoordinate2DMake(v10, v11);
  double latitude = v28.latitude;
  double longitude = v28.longitude;
  if (CLLocationCoordinate2DIsValid(v28) && [(BRKIDSMessage *)v8 hasIdentifier])
  {
    id v14 = objc_alloc(MEMORY[0x263F00A28]);
    [(BRKIDSMessage *)v8 radius];
    double v16 = v15;
    v17 = [(BRKIDSMessage *)v8 identifier];
    v18 = objc_msgSend(v14, "initWithCenter:radius:identifier:", v17, latitude, longitude, v16);

    v19 = BRKLoggingObjectForDomain(11);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315394;
      v24 = "-[BRKIDSService locationManagerStartMonitoringForRegion:]";
      __int16 v25 = 2112;
      v26 = (BRKIDSMessage *)v18;
      _os_log_impl(&dword_2399EB000, v19, OS_LOG_TYPE_DEFAULT, "%s startMonitoringForRegion: %@", (uint8_t *)&v23, 0x16u);
    }

    v20 = [(BRKIDSService *)self companionContextManagerDelegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      v22 = [(BRKIDSService *)self companionContextManagerDelegate];
      [v22 startMonitoring:self forRegion:v18];
    }
  }
  else
  {
    v18 = BRKLoggingObjectForDomain(11);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315394;
      v24 = "-[BRKIDSService locationManagerStartMonitoringForRegion:]";
      __int16 v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_2399EB000, v18, OS_LOG_TYPE_DEFAULT, "%s error startMonitoringForRegion: n/a message: %@", (uint8_t *)&v23, 0x16u);
    }
  }
}

- (void)locationManagerStopMonitoringForRegion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = BRKLoggingObjectForDomain(11);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    double v16 = "-[BRKIDSService locationManagerStopMonitoringForRegion:]";
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v6 = [BRKIDSMessage alloc];
  v7 = [v4 data];

  double v8 = [(BRKIDSMessage *)v6 initWithData:v7];
  LODWORD(v7) = [(BRKIDSMessage *)v8 hasIdentifier];
  double v9 = BRKLoggingObjectForDomain(11);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v10)
    {
      int v15 = 136315394;
      double v16 = "-[BRKIDSService locationManagerStopMonitoringForRegion:]";
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_2399EB000, v9, OS_LOG_TYPE_DEFAULT, "%s error stopMonitoringForRegion: n/a message: %@", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_10;
  }
  if (v10)
  {
    CLLocationDegrees v11 = [(BRKIDSMessage *)v8 identifier];
    int v15 = 136315394;
    double v16 = "-[BRKIDSService locationManagerStopMonitoringForRegion:]";
    __int16 v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_2399EB000, v9, OS_LOG_TYPE_DEFAULT, "%s stopMonitoringForRegionIdentifier: %@", (uint8_t *)&v15, 0x16u);
  }
  v12 = [(BRKIDSService *)self companionContextManagerDelegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    double v9 = [(BRKIDSService *)self companionContextManagerDelegate];
    id v14 = [(BRKIDSMessage *)v8 identifier];
    [v9 stopMonitoring:self forRegionIdentifier:v14];

LABEL_10:
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = BRKLoggingObjectForDomain(11);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138543618;
    double v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: IDS service accounts changed: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = BRKLoggingObjectForDomain(11);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138543618;
    double v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: IDS service devices changed: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  int v15 = BRKLoggingObjectForDomain(11);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = (objc_class *)objc_opt_class();
    __int16 v17 = NSStringFromClass(v16);
    int v18 = 138544642;
    uint64_t v19 = v17;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 1024;
    BOOL v27 = v8;
    __int16 v28 = 2112;
    id v29 = v14;
    _os_log_impl(&dword_2399EB000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: IDS service did send with success: %@ %@ %@ %d %@", (uint8_t *)&v18, 0x3Au);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a5;
  BOOL v8 = BRKLoggingObjectForDomain(11);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    __int16 v10 = "-[BRKIDSService service:account:incomingUnhandledProtobuf:fromID:context:]";
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_2399EB000, v8, OS_LOG_TYPE_DEFAULT, "%s incomingUnhandledProtobuf: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  __int16 v17 = BRKLoggingObjectForDomain(11);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    int v23 = 138544642;
    __int16 v24 = v19;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2112;
    id v32 = v15;
    __int16 v33 = 2112;
    id v34 = v16;
    _os_log_impl(&dword_2399EB000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: IDS service did receive url: %@ %@ %@ %@ %@", (uint8_t *)&v23, 0x3Eu);
  }
  __int16 v20 = [(BRKIDSService *)self dataCollectionDelegate];
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    __int16 v22 = [(BRKIDSService *)self dataCollectionDelegate];
    [v22 service:self didReceiveResourceURL:v14];
  }
}

- (id)sendProtobuf:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 completionHandler:(id)a6 withTimeout:(double)a7
{
  uint64_t v9 = a4;
  v45[1] = *MEMORY[0x263EF8340];
  id v12 = (void (**)(id, id))a6;
  uint64_t v44 = *MEMORY[0x263F49F80];
  id v13 = NSNumber;
  id v14 = a3;
  id v15 = [v13 numberWithDouble:a7];
  v45[0] = v15;
  id v16 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];

  id v17 = objc_alloc(MEMORY[0x263F4A098]);
  int v18 = [v14 data];

  uint64_t v19 = (void *)[v17 initWithProtobufData:v18 type:v9 isResponse:0];
  idsService = self->_idsService;
  char v21 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E30]];
  id v36 = 0;
  id v37 = 0;
  LODWORD(v14) = [(IDSService *)idsService sendProtobuf:v19 toDestinations:v21 priority:a5 options:v16 identifier:&v37 error:&v36];
  id v22 = v37;
  id v23 = v36;

  __int16 v24 = BRKLoggingObjectForDomain(11);
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v25)
    {
      id v26 = [v19 data];
      uint64_t v27 = [v26 length];
      id v28 = [v19 context];
      __int16 v29 = [v28 outgoingResponseIdentifier];
      *(_DWORD *)buf = 134218498;
      uint64_t v39 = v27;
      __int16 v40 = 2112;
      id v41 = v22;
      __int16 v42 = 2112;
      v43 = v29;
      _os_log_impl(&dword_2399EB000, v24, OS_LOG_TYPE_DEFAULT, "IDS Sent: %ld bytes, identifier %@ (for %@)", buf, 0x20u);
    }
  }
  else if (v25)
  {
    id v30 = [v19 data];
    uint64_t v31 = [v30 length];
    id v32 = [v19 context];
    __int16 v33 = [v32 outgoingResponseIdentifier];
    *(_DWORD *)buf = 134218498;
    uint64_t v39 = v31;
    __int16 v40 = 2112;
    id v41 = v22;
    __int16 v42 = 2112;
    v43 = v33;
    _os_log_impl(&dword_2399EB000, v24, OS_LOG_TYPE_DEFAULT, "IDS Failed to Send: %ld bytes, identifier %@ (for %@)", buf, 0x20u);
  }
  if (v12) {
    v12[2](v12, v23);
  }
  id v34 = v22;

  return v34;
}

- (id)sendResourceAtURL:(id)a3 metadata:(id)a4 priority:(int64_t)a5 completionHandler:(id)a6 withTimeout:(double)a7
{
  v36[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = (void (**)(id, id))a6;
  uint64_t v35 = *MEMORY[0x263F49F80];
  id v14 = NSNumber;
  id v15 = a4;
  id v16 = [v14 numberWithDouble:a7];
  v36[0] = v16;
  id v17 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];

  idsService = self->_idsService;
  if (v15) {
    id v19 = v15;
  }
  else {
    id v19 = (id)MEMORY[0x263EFFA78];
  }
  __int16 v20 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E30]];
  id v29 = 0;
  id v30 = 0;
  int v21 = [(IDSService *)idsService sendResourceAtURL:v12 metadata:v19 toDestinations:v20 priority:a5 options:v17 identifier:&v30 error:&v29];

  id v22 = v30;
  id v23 = v29;

  __int16 v24 = BRKLoggingObjectForDomain(11);
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (!v25) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138412546;
    id v32 = v12;
    __int16 v33 = 2112;
    id v34 = v22;
    id v26 = "IDS Sent: %@ resource, identifier %@";
  }
  else
  {
    if (!v25) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138412546;
    id v32 = v12;
    __int16 v33 = 2112;
    id v34 = v22;
    id v26 = "IDS Failed to Send: %@ resource, identifier %@";
  }
  _os_log_impl(&dword_2399EB000, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
LABEL_10:

  if (v13) {
    v13[2](v13, v23);
  }
  id v27 = v22;

  return v27;
}

- (BRKIDSServiceContextManagerDelegate)contextManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextManagerDelegate);
  return (BRKIDSServiceContextManagerDelegate *)WeakRetained;
}

- (void)setContextManagerDelegate:(id)a3
{
}

- (BRKIDSServiceCompanionContextManagerDelegate)companionContextManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_companionContextManagerDelegate);
  return (BRKIDSServiceCompanionContextManagerDelegate *)WeakRetained;
}

- (void)setCompanionContextManagerDelegate:(id)a3
{
}

- (BRKIDSServiceCompanionDataCollectionDelegate)dataCollectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionDelegate);
  return (BRKIDSServiceCompanionDataCollectionDelegate *)WeakRetained;
}

- (void)setDataCollectionDelegate:(id)a3
{
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_destroyWeak((id *)&self->_dataCollectionDelegate);
  objc_destroyWeak((id *)&self->_companionContextManagerDelegate);
  objc_destroyWeak((id *)&self->_contextManagerDelegate);
  objc_storeStrong((id *)&self->_idsQueue, 0);
}

@end