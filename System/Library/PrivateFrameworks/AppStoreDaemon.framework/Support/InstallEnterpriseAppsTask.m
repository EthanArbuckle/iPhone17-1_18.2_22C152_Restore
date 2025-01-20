@interface InstallEnterpriseAppsTask
- (void)main;
@end

@implementation InstallEnterpriseAppsTask

- (void)main
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_1000183F8;
  v17 = sub_100017DB8;
  id v18 = 0;
  v3 = +[NSMutableArray array];
  apps = self->_apps;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003D9254;
  v9[3] = &unk_10052C3C8;
  id v5 = v3;
  id v10 = v5;
  v11 = self;
  v12 = &v13;
  [(NSDictionary *)apps enumerateKeysAndObjectsUsingBlock:v9];
  if ([(NSDictionary *)self->_apps count] > 1 || self->_isXDCRequest || !v14[5])
  {
    id v6 = v5;
    [(Task *)self lock];
    v7 = (NSArray *)[v6 copy];

    processedExternalIDs = self->_processedExternalIDs;
    self->_processedExternalIDs = v7;

    [(Task *)self unlock];
    [(Task *)self completeWithSuccess];
  }
  else
  {
    -[Task completeWithError:](self, "completeWithError:");
  }

  _Block_object_dispose(&v13, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedExternalIDs, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_apps, 0);
}

@end