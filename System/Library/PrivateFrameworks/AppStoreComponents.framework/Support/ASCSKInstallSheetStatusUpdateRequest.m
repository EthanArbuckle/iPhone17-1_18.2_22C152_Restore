@interface ASCSKInstallSheetStatusUpdateRequest
- (ASCSKInstallSheetStatusUpdateRequest)initWithAppBundleId:(id)a3 isInstallSheetOpen:(BOOL)a4 completionHandler:(id)a5;
- (ASCSKInstallSheetStatusUpdateRequest)installSheetStatusUpdateRequest;
- (void)start;
@end

@implementation ASCSKInstallSheetStatusUpdateRequest

- (ASCSKInstallSheetStatusUpdateRequest)initWithAppBundleId:(id)a3 isInstallSheetOpen:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ASCSKInstallSheetStatusUpdateRequest;
  v10 = [(ASCSKInstallSheetStatusUpdateRequest *)&v16 init];
  if (v10)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v11 = (void *)qword_1001A6088;
    uint64_t v21 = qword_1001A6088;
    if (!qword_1001A6088)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100022730;
      v17[3] = &unk_100184338;
      v17[4] = &v18;
      sub_100022730((uint64_t)v17);
      v11 = (void *)v19[3];
    }
    v12 = v11;
    _Block_object_dispose(&v18, 8);
    v13 = (ASCSKInstallSheetStatusUpdateRequest *)[[v12 alloc] initWithAppBundleId:v8 isInstallSheetOpen:v6 completionHandler:v9];
    installSheetStatusUpdateRequest = v10->_installSheetStatusUpdateRequest;
    v10->_installSheetStatusUpdateRequest = v13;
  }
  return v10;
}

- (void)start
{
}

- (ASCSKInstallSheetStatusUpdateRequest)installSheetStatusUpdateRequest
{
  return self->_installSheetStatusUpdateRequest;
}

- (void).cxx_destruct
{
}

@end