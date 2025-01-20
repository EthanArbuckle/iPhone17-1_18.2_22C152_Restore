@interface MFDOpenComposeDelegateRequest
+ (OS_os_log)log;
+ (id)endpointInfo;
+ (id)exportedInterface;
- (MFDOpenComposeDelegateRequest)initWithClient:(id)a3;
- (MFDOpenComposeDelegateRequest)initWithClient:(id)a3 store:(id)a4;
- (void)checkInComposeWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation MFDOpenComposeDelegateRequest

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068F04;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BAF0 != -1) {
    dispatch_once(&qword_10016BAF0, block);
  }
  v2 = (void *)qword_10016BAE8;

  return (OS_os_log *)v2;
}

+ (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDOpenComposeDelegateRequestProtocol];
}

+ (id)endpointInfo
{
  v2 = [a1 exportedInterface];
  v3 = +[MFXPCEndpointInfo endpointInfoWithExportedInterface:v2 remoteObjectInterface:0 shouldAcceptClient:0 exportedObjectForClient:&stru_10013C118];

  return v3;
}

- (MFDOpenComposeDelegateRequest)initWithClient:(id)a3
{
  id v4 = a3;
  v5 = +[MFDOpenComposeDelegateConfigurationStore sharedStore];
  v6 = [(MFDOpenComposeDelegateRequest *)self initWithClient:v4 store:v5];

  return v6;
}

- (MFDOpenComposeDelegateRequest)initWithClient:(id)a3 store:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MFDOpenComposeDelegateRequest;
  v8 = [(MFXPCServer *)&v11 initWithClient:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_store, a4);
  }

  return v9;
}

- (void)checkInComposeWithIdentifier:(id)a3 completion:(id)a4
{
  id v12 = a3;
  v6 = (void (**)(id, void *, id, void))a4;
  if (self) {
    store = self->_store;
  }
  else {
    store = 0;
  }
  v8 = [(MFDOpenComposeDelegateConfigurationStore *)store consumeConfigurationWithIdentifier:v12];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 delegateEndpoint];
    v6[2](v6, v10, [v9 isEntitledDelegate], 0);
  }
  else
  {
    v10 = +[NSString stringWithFormat:@"Could not find configuration for identifier: %@", v12];
    objc_super v11 = +[NSError em_internalErrorWithReason:v10];
    ((void (**)(id, void *, id, void *))v6)[2](v6, 0, 0, v11);
  }
}

- (void).cxx_destruct
{
}

@end