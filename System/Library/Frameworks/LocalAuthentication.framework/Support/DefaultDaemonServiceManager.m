@interface DefaultDaemonServiceManager
- (BOOL)allowsMultipleClientsForServiceType:(id)a3;
- (id)queue;
- (void)bootstrapServiceWithType:(id)a3 clientConnection:(id)a4 completionHandler:(id)a5;
@end

@implementation DefaultDaemonServiceManager

- (id)queue
{
  v2 = +[DaemonUtils sharedInstance];
  v3 = [v2 serverQueue];

  return v3;
}

- (void)bootstrapServiceWithType:(id)a3 clientConnection:(id)a4 completionHandler:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  v10 = [&off_10003A260 objectForKeyedSubscript:v24];
  if (v10)
  {
    v11 = [v8 valueForEntitlement:v10];
    unsigned __int8 v12 = [v11 BOOLValue];

    if ((v12 & 1) == 0)
    {
      v14 = +[LAErrorHelper missingEntitlementError:v10];
      v9[2](v9, 0, v14);
      goto LABEL_11;
    }
  }
  if ([v24 isEqualToString:@"kLAServiceTypeSecureStorage"])
  {
    v13 = +[SecureStorageProvider sharedInstance];
    v14 = [v13 secureStorage];

    v15 = &OBJC_PROTOCOL___LASecureStorageService;
LABEL_10:
    v20 = +[NSXPCInterface interfaceWithProtocol:v15];
    v21 = [(DefaultDaemonServiceManager *)self queue];
    id v22 = [objc_alloc((Class)LAServiceAdapter) initWithExportedInterface:v20 exportedObject:v14 queue:v21];
    ((void (**)(id, id, void *))v9)[2](v9, v22, 0);

    goto LABEL_11;
  }
  if ([v24 isEqualToString:@"kLAServiceTypeRatchet"])
  {
    v16 = +[DaemonServiceLocator sharedInstance];
    v17 = [v16 dto];
    v14 = [v17 xpcController];

    v15 = &OBJC_PROTOCOL___LACDTOServiceXPC;
    goto LABEL_10;
  }
  if ([v24 isEqualToString:@"kLAServiceTypeEnvironment"])
  {
    v18 = +[DaemonServiceLocator sharedInstance];
    v19 = [v18 environment];
    v14 = [v19 xpcController];

    v15 = &OBJC_PROTOCOL___LACEnvironmentServiceXPC;
    goto LABEL_10;
  }
  v14 = +[NSString stringWithFormat:@"Invalid serviceType: %@", v24];
  v23 = +[LAErrorHelper internalErrorWithMessage:v14];
  v9[2](v9, 0, v23);

LABEL_11:
}

- (BOOL)allowsMultipleClientsForServiceType:(id)a3
{
  return 1;
}

@end