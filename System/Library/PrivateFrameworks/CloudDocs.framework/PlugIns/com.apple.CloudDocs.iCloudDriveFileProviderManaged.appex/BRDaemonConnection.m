@interface BRDaemonConnection
+ (id)defaultConnectionIfExistsWithDomainIdentifier:(id)a3;
+ (id)defaultConnectionWithDomainIdentifier:(id)a3 databaseID:(id)a4 backChannel:(id)a5;
+ (id)secondaryConnectionIfExistsWithDomainIdentifier:(id)a3;
+ (id)secondaryConnectionWithDomainIdentifier:(id)a3 databaseID:(id)a4 backChannel:(id)a5;
- (id)_initUsingUserLocalDaemonWithDomainIdentifier:(id)a3 databaseID:(id)a4 backChannel:(id)a5;
@end

@implementation BRDaemonConnection

- (id)_initUsingUserLocalDaemonWithDomainIdentifier:(id)a3 databaseID:(id)a4 backChannel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)BRDaemonConnection;
  v11 = [(BRDaemonConnection *)&v21 initWithMachServiceName:kBRCMachServiceName options:0];
  v12 = v11;
  if (v11)
  {
    [(BRDaemonConnection *)v11 _setupAndResumeForKey:v8];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000125BC;
    v19[3] = &unk_100044728;
    id v13 = v8;
    id v20 = v13;
    v14 = [(BRDaemonConnection *)v12 synchronousRemoteObjectProxyWithErrorHandler:v19];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000126B0;
    v16[3] = &unk_100044B20;
    id v17 = v13;
    v18 = v12;
    [v14 validateConnectionDomainWithDomainIdentifier:v17 databaseID:v9 backChannel:v10 reply:v16];
  }
  return v12;
}

+ (id)defaultConnectionWithDomainIdentifier:(id)a3 databaseID:(id)a4 backChannel:(id)a5
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000128F0;
  v13[3] = &unk_100044B48;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v8 = v16;
  id v9 = v15;
  id v10 = v14;
  v11 = [a1 defaultConnectionForKey:v10 initializer:v13];

  return v11;
}

+ (id)secondaryConnectionWithDomainIdentifier:(id)a3 databaseID:(id)a4 backChannel:(id)a5
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100012A38;
  v13[3] = &unk_100044B48;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v8 = v16;
  id v9 = v15;
  id v10 = v14;
  v11 = [a1 secondaryConnectionForKey:v10 initializer:v13];

  return v11;
}

+ (id)defaultConnectionIfExistsWithDomainIdentifier:(id)a3
{
  return [a1 defaultConnectionIfExistsForKey:a3];
}

+ (id)secondaryConnectionIfExistsWithDomainIdentifier:(id)a3
{
  return [a1 secondaryConnectionIfExistsForKey:a3];
}

@end