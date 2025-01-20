@interface PMSmartPowerNapLocationMonitor
- (BOOL)areAllRemoteDevicesAway;
- (BPSSink)sink;
- (ContextSyncClient)contextSyncClient;
- (NSMutableDictionary)remoteLOIs;
- (NSNumber)localLOI;
- (OS_dispatch_queue)queue;
- (PMSmartPowerNapLocationMonitor)initWithQueue:(id)a3;
- (id)addSPNFiltersToBMDSL:(id)a3;
- (id)placeToString:(int)a3;
- (unint64_t)syncing;
- (void)registerForLocalLOISignals;
- (void)registerForRemoteLOISignals;
- (void)setContextSyncClient:(id)a3;
- (void)setLocalLOI:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteLOIs:(id)a3;
- (void)setSink:(id)a3;
- (void)setSyncing:(unint64_t)a3;
- (void)updateRemoteLOISyncState:(unint64_t)a3;
@end

@implementation PMSmartPowerNapLocationMonitor

- (PMSmartPowerNapLocationMonitor)initWithQueue:(id)a3
{
  id v5 = a3;
  if (qword_1000A48A0 != -1) {
    dispatch_once(&qword_1000A48A0, &stru_100092050);
  }
  if ((byte_1000A4898 & 1) != 0
    || (v6 = (void *)MGGetStringAnswer(),
        unsigned int v7 = [v6 isEqualToString:@"iPad"],
        v6,
        !v7))
  {
    v16 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PMSmartPowerNapLocationMonitor;
    v8 = [(PMSmartPowerNapLocationMonitor *)&v18 init];
    if (v8)
    {
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2050000000;
      v9 = (void *)qword_1000A48A8;
      uint64_t v27 = qword_1000A48A8;
      if (!qword_1000A48A8)
      {
        *(void *)buf = _NSConcreteStackBlock;
        uint64_t v20 = 3221225472;
        v21 = sub_10002BA28;
        v22 = &unk_100091458;
        v23 = &v24;
        sub_10002BA28((uint64_t)buf);
        v9 = (void *)v25[3];
      }
      v10 = v9;
      _Block_object_dispose(&v24, 8);
      v11 = (ContextSyncClient *)[[v10 alloc] initWithClientName:@"com.apple.powerd"];
      contextSyncClient = v8->_contextSyncClient;
      v8->_contextSyncClient = v11;

      objc_storeStrong((id *)&v8->_queue, a3);
      uint64_t v13 = +[NSMutableDictionary dictionary];
      remoteLOIs = v8->_remoteLOIs;
      v8->_remoteLOIs = (NSMutableDictionary *)v13;

      [(PMSmartPowerNapLocationMonitor *)v8 registerForLocalLOISignals];
      [(PMSmartPowerNapLocationMonitor *)v8 registerForRemoteLOISignals];
      [(PMSmartPowerNapLocationMonitor *)v8 updateRemoteLOISyncState:1];
    }
    v15 = qword_1000A34F0;
    if (os_log_type_enabled((os_log_t)qword_1000A34F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Initialized SmartPowerNapLocationMonitor", buf, 2u);
    }
    self = v8;
    v16 = self;
  }

  return v16;
}

- (id)placeToString:(int)a3
{
  if (a3 > 4) {
    return @"Error";
  }
  else {
    return off_100092088[a3];
  }
}

- (void)registerForLocalLOISignals
{
  v3 = +[BMStreams semanticLocationStream];
  if (objc_opt_class())
  {
    id v4 = objc_alloc((Class)BMBiomeScheduler);
    id v5 = [(PMSmartPowerNapLocationMonitor *)self queue];
    id v6 = [v4 initWithIdentifier:@"com.apple.powerd.biomeLocalLOI" targetQueue:v5];

    unsigned int v7 = [v3 publisher];
    v8 = [(PMSmartPowerNapLocationMonitor *)self addSPNFiltersToBMDSL:v7];

    v9 = [v8 subscribeOn:v6];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002AE0C;
    v11[3] = &unk_1000915E0;
    v11[4] = self;
    v10 = [v9 sinkWithCompletion:&stru_100092010 receiveInput:v11];

    [(PMSmartPowerNapLocationMonitor *)self setSink:v10];
  }
}

- (void)registerForRemoteLOISignals
{
  v3 = BiomeLibrary();
  id v4 = [v3 ContextSync];
  id v5 = [v4 LOI];

  id v6 = objc_alloc((Class)BMBiomeScheduler);
  unsigned int v7 = [(PMSmartPowerNapLocationMonitor *)self queue];
  id v8 = [v6 initWithIdentifier:@"com.apple.powerd.biomeRemoteLOI" targetQueue:v7];

  v9 = [v5 DSLPublisher];
  v10 = [(PMSmartPowerNapLocationMonitor *)self addSPNFiltersToBMDSL:v9];

  v11 = [v10 subscribeOn:v8];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002B17C;
  v13[3] = &unk_1000915E0;
  v13[4] = self;
  v12 = [v11 sinkWithCompletion:&stru_100092030 receiveInput:v13];
}

- (id)addSPNFiltersToBMDSL:(id)a3
{
  return [a3 filterWithKeyPath:@"eventBody.userSpecificPlaceType" comparison:3 value:&off_10009ADA8];
}

- (void)updateRemoteLOISyncState:(unint64_t)a3
{
  id v5 = [(PMSmartPowerNapLocationMonitor *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002B4E4;
  v6[3] = &unk_100091628;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (BOOL)areAllRemoteDevicesAway
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [(PMSmartPowerNapLocationMonitor *)self remoteLOIs];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    int v5 = 0;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v9 = [(PMSmartPowerNapLocationMonitor *)self remoteLOIs];
        v10 = [v9 objectForKeyedSubscript:v8];
        v11 = [(PMSmartPowerNapLocationMonitor *)self localLOI];

        if (v10 != v11) {
          ++v5;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
    id v4 = (id)v5;
  }

  v12 = [(PMSmartPowerNapLocationMonitor *)self remoteLOIs];
  BOOL v13 = [v12 count] == v4;

  return v13;
}

- (ContextSyncClient)contextSyncClient
{
  return self->_contextSyncClient;
}

- (void)setContextSyncClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)syncing
{
  return self->_syncing;
}

- (void)setSyncing:(unint64_t)a3
{
  self->_syncing = a3;
}

- (NSNumber)localLOI
{
  return self->_localLOI;
}

- (void)setLocalLOI:(id)a3
{
}

- (NSMutableDictionary)remoteLOIs
{
  return self->_remoteLOIs;
}

- (void)setRemoteLOIs:(id)a3
{
}

- (BPSSink)sink
{
  return (BPSSink *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_remoteLOIs, 0);
  objc_storeStrong((id *)&self->_localLOI, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_contextSyncClient, 0);
}

@end