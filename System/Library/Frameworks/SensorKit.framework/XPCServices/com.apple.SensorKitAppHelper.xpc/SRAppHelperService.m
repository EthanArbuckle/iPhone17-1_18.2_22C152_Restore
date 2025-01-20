@interface SRAppHelperService
+ (void)initialize;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)validateConnection:(id)a3 accessCategory:(id)a4;
- (BOOL)validateEntitlment:(id)a3 accessCategory:(id)a4;
- (NSXPCListener)listener;
- (SRAppHelperService)initWithQueue:(id)a3;
- (SRAppHelperService)initWithQueue:(id)a3 listener:(id)a4 authStore:(id)a5;
- (SRAuthorizationStore)authStore;
- (void)authorizationRequestStatusForBundleId:(id)a3 sensors:(id)a4 reply:(id)a5;
- (void)authorizationSnapshotWithReply:(id)a3;
- (void)dealloc;
- (void)resetAuthorizationsForBundleId:(id)a3 reply:(id)a4;
- (void)resume;
- (void)setAuthStore:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation SRAppHelperService

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_1000088A8 = (uint64_t)os_log_create("com.apple.SensorKit", "AppHelper");
  }
}

- (SRAppHelperService)initWithQueue:(id)a3
{
  v5 = +[NSXPCListener serviceListener];
  [(NSXPCListener *)v5 _setQueue:a3];
  id v6 = +[SRAuthorizationStore allSensorsStore];

  return [(SRAppHelperService *)self initWithQueue:a3 listener:v5 authStore:v6];
}

- (SRAppHelperService)initWithQueue:(id)a3 listener:(id)a4 authStore:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SRAppHelperService;
  v8 = [(SRAppHelperService *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_q = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v10 = (NSXPCListener *)a4;
    v9->_listener = v10;
    [(NSXPCListener *)v10 setDelegate:v9];
    v9->_authStore = (SRAuthorizationStore *)a5;
  }
  return v9;
}

- (void)dealloc
{
  [(SRAppHelperService *)self setListener:0];

  dispatch_release((dispatch_object_t)self->_q);
  v3.receiver = self;
  v3.super_class = (Class)SRAppHelperService;
  [(SRAppHelperService *)&v3 dealloc];
}

- (void)resume
{
  v2 = [(SRAppHelperService *)self listener];

  [(NSXPCListener *)v2 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = qword_1000088A8;
  if (os_log_type_enabled((os_log_t)qword_1000088A8, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = [a4 serviceName];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Got a connection attempt on %@", (uint8_t *)&v8, 0xCu);
  }
  [a4 _setQueue:self->_q];
  objc_msgSend(a4, "setExportedInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SRAppHelperProtocol));
  [a4 setExportedObject:self];
  [a4 resume];
  return 1;
}

- (void)resetAuthorizationsForBundleId:(id)a3 reply:(id)a4
{
  if ([(SRAppHelperService *)self validateConnection:+[NSXPCConnection currentConnection] accessCategory:@"reset"])
  {
    [(SRAuthorizationStore *)[(SRAppHelperService *)self authStore] resetAllAuthorizationsForBundleId:a3];
    v7 = 0;
  }
  else
  {
    v7 = +[SRError errorWithCode:0];
  }
  int v8 = (void (*)(id, SRError *))*((void *)a4 + 2);

  v8(a4, v7);
}

- (void)authorizationRequestStatusForBundleId:(id)a3 sensors:(id)a4 reply:(id)a5
{
  if ([(SRAppHelperService *)self validateConnection:+[NSXPCConnection currentConnection] accessCategory:@"read"])
  {
    id v9 = objc_msgSend(-[SRAuthorizationStore readerAuthorizationValues](-[SRAppHelperService authStore](self, "authStore"), "readerAuthorizationValues"), "objectForKeyedSubscript:", a3);
    v10 = +[NSSet setWithArray:](NSSet, "setWithArray:", [v9 allKeys]);
    id v11 = [objc_alloc((Class)NSMutableSet) initWithSet:a4];
    [v11 minusSet:v10];
    id v12 = [v11 count];
    v13 = qword_1000088A8;
    if (os_log_type_enabled((os_log_t)qword_1000088A8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543874;
      id v17 = a3;
      __int16 v18 = 2114;
      id v19 = a4;
      __int16 v20 = 1024;
      BOOL v21 = v12 != 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Should request for %{public}@ for %{public}@: %{BOOL}d", (uint8_t *)&v16, 0x1Cu);
      v13 = qword_1000088A8;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "auth values: %{public}@", (uint8_t *)&v16, 0xCu);
    }

    (*((void (**)(id, BOOL, void))a5 + 2))(a5, v12 != 0, 0);
  }
  else
  {
    v14 = +[SRError errorWithCode:0];
    v15 = (void (*)(id, uint64_t, SRError *))*((void *)a5 + 2);
    v15(a5, 1, v14);
  }
}

- (BOOL)validateConnection:(id)a3 accessCategory:(id)a4
{
  id v6 = [a3 valueForEntitlement:@"com.apple.SensorKitAppHelper.allow"];

  return [(SRAppHelperService *)self validateEntitlment:v6 accessCategory:a4];
}

- (BOOL)validateEntitlment:(id)a3 accessCategory:(id)a4
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([a3 containsObject:a4]) {
      return 1;
    }
  }
  v7 = qword_1000088A8;
  BOOL v8 = os_log_type_enabled((os_log_t)qword_1000088A8, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v8)
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Connection does not have a valid entitlement", v9, 2u);
    return 0;
  }
  return result;
}

- (void)authorizationSnapshotWithReply:(id)a3
{
  v4 = self;
  if ([(SRAppHelperService *)self validateConnection:+[NSXPCConnection currentConnection] accessCategory:@"read"])
  {
    id v17 = (void (**)(id, NSDictionary *, void))a3;
    id v21 = +[NSMutableDictionary dictionary];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [(SRAuthorizationStore *)[(SRAppHelperService *)v4 authStore] readerAuthorizationBundleIdValues];
    id v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v22)
    {
      uint64_t v19 = *(void *)v29;
      __int16 v20 = v4;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v6 = objc_msgSend(-[SRAuthorizationStore readerAuthorizationValues](-[SRAppHelperService authStore](v4, "authStore"), "readerAuthorizationValues"), "objectForKeyedSubscript:", v23);
          id v7 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v6];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v8 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v25;
            do
            {
              for (j = 0; j != v9; j = (char *)j + 1)
              {
                if (*(void *)v25 != v10) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * (void)j);
                id v14 = objc_msgSend(+[SRSensorDescription sensorDescriptionForSensor:](SRSensorDescription, "sensorDescriptionForSensor:", v12), "legacyName");
                if (v14) {
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(v6, "objectForKeyedSubscript:", v12), v14);
                }
              }
              id v9 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v9);
          }
          [v21 setObject:v7 forKeyedSubscript:v23];

          v4 = v20;
        }
        id v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v22);
    }
    v17[2](v17, +[NSDictionary dictionaryWithDictionary:v21], 0);
  }
  else
  {
    v15 = +[SRError errorWithCode:0];
    int v16 = (void (*)(id, void *, SRError *))*((void *)a3 + 2);
    v16(a3, &__NSDictionary0__struct, v15);
  }
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
}

- (SRAuthorizationStore)authStore
{
  return (SRAuthorizationStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAuthStore:(id)a3
{
}

@end