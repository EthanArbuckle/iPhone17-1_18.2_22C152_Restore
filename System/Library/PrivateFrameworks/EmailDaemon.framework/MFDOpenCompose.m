@interface MFDOpenCompose
+ (OS_os_log)log;
+ (id)endpointInfo;
+ (id)exportedInterface;
- (MFDOpenCompose)initWithClient:(id)a3;
- (MFDOpenCompose)initWithClient:(id)a3 store:(id)a4;
- (void)presentNewMailWithContext:(id)a3 delegateEndpoint:(id)a4 completion:(id)a5;
@end

@implementation MFDOpenCompose

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067A68;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BAD0 != -1) {
    dispatch_once(&qword_10016BAD0, block);
  }
  v2 = (void *)qword_10016BAC8;

  return (OS_os_log *)v2;
}

+ (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDOpenComposeProtocol];
}

+ (id)endpointInfo
{
  v2 = [a1 exportedInterface];
  v3 = +[MFXPCEndpointInfo endpointInfoWithExportedInterface:v2 remoteObjectInterface:0 shouldAcceptClient:&stru_10013C068 exportedObjectForClient:&stru_10013C088];

  return v3;
}

- (MFDOpenCompose)initWithClient:(id)a3
{
  id v4 = a3;
  v5 = +[MFDOpenComposeDelegateConfigurationStore sharedStore];
  v6 = [(MFDOpenCompose *)self initWithClient:v4 store:v5];

  return v6;
}

- (MFDOpenCompose)initWithClient:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MFDOpenCompose;
  v8 = [(MFXPCServer *)&v11 initWithClient:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_store, a4);
    v9->_isEntitledClient = [v6 hasEntitlement:@"com.apple.private.mobilemail.mail-recipient-vetting"];
  }

  return v9;
}

- (void)presentNewMailWithContext:(id)a3 delegateEndpoint:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v18 = 0;
  unsigned int v11 = sub_100067F34((uint64_t)self, &v18);
  id v12 = v18;
  if (v11)
  {
    sub_1000680BC((uint64_t)self, v8, v9);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100068534;
    v15[3] = &unk_10013C0D8;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = v10;
    id v13 = v16;
    [v13 _createUserActivityDataWithOptions:0 completionHandler:v15];
  }
  else
  {
    v14 = +[MFDOpenCompose log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      sub_1000C17B4();
    }

    if (v10) {
      (*((void (**)(id, id))v10 + 2))(v10, v12);
    }
  }
}

- (void).cxx_destruct
{
}

@end