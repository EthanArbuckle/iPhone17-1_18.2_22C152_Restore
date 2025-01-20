@interface XPCServiceBroker
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation XPCServiceBroker

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  catalog = self->_catalog;
  id v6 = a4;
  v7 = sub_10000C958((uint64_t)XPCServiceClient, v6, catalog);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018500;
  block[3] = &unk_1005218C0;
  block[4] = self;
  v9 = v7;
  v22 = v9;
  dispatch_async(dispatchQueue, block);
  v10 = +[ASDServiceBroker interface];
  [v6 setExportedInterface:v10];

  [v6 setExportedObject:v9];
  v11 = +[ASDNotificationCenter interface];
  [v6 setRemoteObjectInterface:v11];

  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_10026F76C;
  v18 = &unk_1005218C0;
  v12 = v9;
  v19 = v12;
  v20 = self;
  [v6 setInvalidationHandler:&v15];
  objc_msgSend(v6, "resume", v15, v16, v17, v18);

  v13 = sub_10001A0C8();
  sub_100006B94((uint64_t)v13, v12);

  if (sub_10000B08C(v12)) {
    sub_1000093B4((uint64_t)DiagnosticPublisher, v12);
  }

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_activeClients, 0);
}

@end