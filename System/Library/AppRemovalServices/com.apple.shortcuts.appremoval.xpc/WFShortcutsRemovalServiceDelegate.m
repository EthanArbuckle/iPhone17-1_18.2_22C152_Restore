@interface WFShortcutsRemovalServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation WFShortcutsRemovalServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LSAppRemovalServiceProtocol];
  [v6 setExportedInterface:v7];

  objc_initWeak(&location, v6);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000030EC;
  v12[3] = &unk_100004118;
  objc_copyWeak(&v13, &location);
  [v6 setInterruptionHandler:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000031B0;
  v10[3] = &unk_100004118;
  objc_copyWeak(&v11, &location);
  [v6 setInvalidationHandler:v10];
  v8 = objc_opt_new();
  [v6 setExportedObject:v8];
  [v6 resume];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return 1;
}

@end