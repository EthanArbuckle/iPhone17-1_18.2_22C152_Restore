@interface SHServiceProvider
+ (id)availableServices;
- (NSString)machServiceName;
- (SHServiceProvider)initWithService:(Class)a3;
- (id)buildListener;
- (id)eventsServiceHandleForConnection:(id)a3 withClientCredentials:(id)a4;
- (id)handleForConnection:(id)a3 withClientCredentials:(id)a4;
- (id)shazamKitServiceHandleForConnection:(id)a3 withClientCredentials:(id)a4;
- (id)uiServiceHandlerForConnection:(id)a3 withClientCredentials:(id)a4;
@end

@implementation SHServiceProvider

+ (id)availableServices
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v5 count:3];
  v3 = +[NSSet setWithArray:](NSSet, "setWithArray:", v2, v5, v6);

  return v3;
}

- (SHServiceProvider)initWithService:(Class)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SHServiceProvider;
  v4 = [(SHServiceProvider *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [(objc_class *)a3 machServiceName];
    machServiceName = v4->_machServiceName;
    v4->_machServiceName = (NSString *)v5;
  }
  return v4;
}

- (id)buildListener
{
  id v3 = objc_alloc((Class)NSXPCListener);
  v4 = [(SHServiceProvider *)self machServiceName];
  id v5 = [v3 initWithMachServiceName:v4];

  return v5;
}

- (id)handleForConnection:(id)a3 withClientCredentials:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(SHServiceProvider *)self machServiceName];
  v9 = +[SHShazamKitService machServiceName];
  unsigned int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = [(SHServiceProvider *)self shazamKitServiceHandleForConnection:v6 withClientCredentials:v7];
  }
  else
  {
    v12 = [(SHServiceProvider *)self machServiceName];
    v13 = +[_TtC12ShazamEvents19ShazamEventsService machServiceName];
    unsigned int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      uint64_t v11 = [(SHServiceProvider *)self eventsServiceHandleForConnection:v6 withClientCredentials:v7];
    }
    else
    {
      v15 = [(SHServiceProvider *)self machServiceName];
      v16 = +[SHUIService machServiceName];
      unsigned int v17 = [v15 isEqualToString:v16];

      if (!v17)
      {
        v20 = [(SHServiceProvider *)self machServiceName];
        v21 = +[NSString stringWithFormat:@"Attempted to start an unknown service: %@", v20];
        id v22 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v21 userInfo:0];

        objc_exception_throw(v22);
      }
      uint64_t v11 = [(SHServiceProvider *)self uiServiceHandlerForConnection:v6 withClientCredentials:v7];
    }
  }
  v18 = (void *)v11;

  return v18;
}

- (id)eventsServiceHandleForConnection:(id)a3 withClientCredentials:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [SHConnectionHandle alloc];
  objc_super v8 = SHShazamEventsServiceInterface();
  v9 = SHShazamEventsClientInterface();
  unsigned int v10 = [(SHConnectionHandle *)v7 initWithConnection:v6 exportedInterface:v8 remoteInterface:v9];

  uint64_t v11 = [[SHServiceStateHandler alloc] initWithClientCredentials:v5];
  [(SHConnectionHandle *)v10 setServiceStateHandler:v11];

  id v12 = objc_alloc_init((Class)_TtC12ShazamEvents19ShazamEventsService);
  v13 = [(SHConnectionHandle *)v10 serviceStateHandler];
  [v12 setServiceDelegate:v13];

  [(SHConnectionHandle *)v10 setExportedObject:v12];

  return v10;
}

- (id)shazamKitServiceHandleForConnection:(id)a3 withClientCredentials:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [SHConnectionHandle alloc];
  objc_super v8 = SHShazamKitServiceInterface();
  v9 = SHShazamKitClientInterface();
  unsigned int v10 = [(SHConnectionHandle *)v7 initWithConnection:v6 exportedInterface:v8 remoteInterface:v9];

  uint64_t v11 = [[SHServiceStateHandler alloc] initWithClientCredentials:v5];
  [(SHConnectionHandle *)v10 setServiceStateHandler:v11];

  id v12 = [[SHShazamKitService alloc] initWithClientCredentials:v5];
  v13 = [(SHConnectionHandle *)v10 remoteObject];
  [(SHShazamKitService *)v12 setDelegate:v13];

  unsigned int v14 = [(SHConnectionHandle *)v10 serviceStateHandler];
  [(SHShazamKitService *)v12 setServiceDelegate:v14];

  [(SHConnectionHandle *)v10 setExportedObject:v12];

  return v10;
}

- (id)uiServiceHandlerForConnection:(id)a3 withClientCredentials:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [SHConnectionHandle alloc];
  objc_super v8 = SHShazamKitUIServiceInterface();
  v9 = SHShazamKitUIClientInterface();
  unsigned int v10 = [(SHConnectionHandle *)v7 initWithConnection:v6 exportedInterface:v8 remoteInterface:v9];

  uint64_t v11 = [[SHServiceStateHandler alloc] initWithClientCredentials:v5];
  [(SHConnectionHandle *)v10 setServiceStateHandler:v11];

  id v12 = [SHUIService alloc];
  v13 = [v5 attribution];

  unsigned int v14 = [v13 bundleIdentifier];
  id v15 = [(SHUIService *)v12 initBundleIdentifier:v14];

  v16 = [(SHConnectionHandle *)v10 serviceStateHandler];
  [v15 setServiceDelegate:v16];

  [(SHConnectionHandle *)v10 setExportedObject:v15];

  return v10;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void).cxx_destruct
{
}

@end