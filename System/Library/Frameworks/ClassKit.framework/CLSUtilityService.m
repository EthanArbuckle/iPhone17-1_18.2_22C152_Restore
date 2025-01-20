@interface CLSUtilityService
+ (Class)endpointClass;
+ (id)sharedInstance;
- (CLSEndpointConnection)endpointConnection;
- (CLSUtilityService)initWithEndpoint:(id)a3;
- (id)syncUtilityServer:(id)a3;
- (id)utilityServer:(id)a3;
- (void)accountChangedTrigger:(id)a3;
- (void)addAdminRequestor:(id)a3 completion:(id)a4;
- (void)addAuthorizationStatus:(unint64_t)a3 forContextAtPath:(id)a4 completion:(id)a5;
- (void)addAuthorizationStatus:(unint64_t)a3 forHandoutAssignedItem:(id)a4 completion:(id)a5;
- (void)addOrganization:(id)a3 withLocations:(id)a4 completion:(id)a5;
- (void)authorizationStatusForContextAtPath:(id)a3 completion:(id)a4;
- (void)authorizationStatusForHandoutAssignedItem:(id)a3 completion:(id)a4;
- (void)currentUserContentStoreCacheDirectoryURLWithCompletion:(id)a3;
- (void)databasePathWithCompletion:(id)a3;
- (void)deleteOrganization:(id)a3 completion:(id)a4;
- (void)fetchReportsWithPredicate:(id)a3 completion:(id)a4;
- (void)getBootstrapMode:(id)a3;
- (void)getClassKitCatalogEnvironmentWithCompletion:(id)a3;
- (void)getDevModeWithCompletion:(id)a3;
- (void)recreateDatabase:(BOOL)a3 andTerminateDaemonWithCompletion:(id)a4;
- (void)recreateDatabaseWithCompletion:(id)a3;
- (void)recreateDevelopmentDatabaseWithCompletion:(id)a3;
- (void)removeAuthorizationStatus:(unint64_t)a3 forContextAtPath:(id)a4 completion:(id)a5;
- (void)removeAuthorizationStatus:(unint64_t)a3 forHandoutAssignedItem:(id)a4 completion:(id)a5;
- (void)renewCredentialsWithCompletion:(id)a3;
- (void)setBootstrapMode:(int)a3 url:(id)a4 completion:(id)a5;
- (void)setClassKitCatalogEnvironment:(int64_t)a3 completion:(id)a4;
- (void)setDevMode:(int)a3 completion:(id)a4;
- (void)setEndpointConnection:(id)a3;
- (void)statusWithCompletion:(id)a3;
- (void)syncBootstrapWithCompletion:(id)a3;
- (void)syncFetchWithCompletion:(id)a3;
- (void)syncGetClassKitCatalogEnvironmentWithCompletion:(id)a3;
- (void)syncGetDevModeWithCompletion:(id)a3;
- (void)syncPushWithCompletion:(id)a3;
- (void)syncRecreateDevelopmentDatabaseWithCompletion:(id)a3;
- (void)syncSetClassKitCatalogEnvironment:(int64_t)a3 completion:(id)a4;
- (void)syncSetDevMode:(int)a3 completion:(id)a4;
- (void)syncStatsWithCompletion:(id)a3;
- (void)topLevelContentStoreCacheDirectoryURLWithCompletion:(id)a3;
@end

@implementation CLSUtilityService

+ (Class)endpointClass
{
  return (Class)objc_opt_class();
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC667BE4;
  block[3] = &unk_1E6C95AC0;
  block[4] = a1;
  if (qword_1EB5D4B50 != -1) {
    dispatch_once(&qword_1EB5D4B50, block);
  }
  v2 = (void *)qword_1EB5D4B48;

  return v2;
}

- (CLSUtilityService)initWithEndpoint:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CLSUtilityService;
  v6 = [(CLSUtilityService *)&v30 init];
  if (!v6)
  {
LABEL_9:
    v11 = v6;
    goto LABEL_10;
  }
  id v32 = 0;
  v7 = objc_msgSend_entitlementsForCurrentTaskWithError_(CLSEntitlements, v5, (uint64_t)&v32);
  id v8 = v32;
  if (v8)
  {
    v10 = v8;

    v11 = 0;
    goto LABEL_10;
  }
  uint64_t v31 = 0;
  int v12 = objc_msgSend_BOOLValueForEntitlement_error_(v7, v9, @"com.apple.private.ClassKit.internal", &v31);
  uint64_t v13 = v31;

  v11 = 0;
  if (!v13 && v12)
  {
    v14 = objc_opt_class();
    v17 = objc_msgSend_endpointClass(v14, v15, v16);
    uint64_t v19 = objc_msgSend_instanceForEndpoint_(v17, v18, (uint64_t)v4);
    endpointConnection = v6->_endpointConnection;
    v6->_endpointConnection = (CLSEndpointConnection *)v19;

    v21 = CLSDispatchQueueName(v6, 0);
    v24 = (const char *)objc_msgSend_UTF8String(v21, v22, v23);
    v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    if (qword_1EB5D4B60 != -1) {
      dispatch_once(&qword_1EB5D4B60, &unk_1F37A1070);
    }
    v26 = (id)qword_1EB5D4B58;
    dispatch_queue_t v27 = dispatch_queue_create_with_target_V2(v24, v25, v26);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v27;

    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (id)utilityServer:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_endpointConnection(self, v5, v6);
  v9 = objc_msgSend_utilityServer_(v7, v8, (uint64_t)v4);

  return v9;
}

- (id)syncUtilityServer:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_endpointConnection(self, v5, v6);
  v9 = objc_msgSend_syncUtilityServer_(v7, v8, (uint64_t)v4);

  return v9;
}

- (void)databasePathWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC667F40;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_databasePathWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)recreateDatabaseWithCompletion:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_endpointConnection(self, v5, v6);
  objc_msgSend_addBarrierBlock_(v7, v8, (uint64_t)&unk_1F37A1650);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1DC66808C;
  v16[3] = &unk_1E6C95CF8;
  id v9 = v4;
  id v17 = v9;
  v11 = objc_msgSend_utilityServer_(self, v10, (uint64_t)v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1DC6680A4;
  v14[3] = &unk_1E6C96CF8;
  v14[4] = self;
  id v15 = v9;
  id v12 = v9;
  objc_msgSend_remote_recreateDatabaseWithCompletion_(v11, v13, (uint64_t)v14);
}

- (void)recreateDatabase:(BOOL)a3 andTerminateDaemonWithCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v9 = objc_msgSend_endpointConnection(self, v7, v8);
  objc_msgSend_addBarrierBlock_(v9, v10, (uint64_t)&unk_1F37A0F10);

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1DC6682FC;
  v18[3] = &unk_1E6C95CF8;
  id v11 = v6;
  id v19 = v11;
  uint64_t v13 = objc_msgSend_utilityServer_(self, v12, (uint64_t)v18);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1DC668314;
  v16[3] = &unk_1E6C96CF8;
  void v16[4] = self;
  id v17 = v11;
  id v14 = v11;
  objc_msgSend_remote_recreateDatabase_andTerminateDaemonWithCompletion_(v13, v15, v4, v16);
}

- (void)recreateDevelopmentDatabaseWithCompletion:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_endpointConnection(self, v5, v6);
  objc_msgSend_addBarrierBlock_(v7, v8, (uint64_t)&unk_1F37A0F50);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1DC668520;
  v16[3] = &unk_1E6C95CF8;
  id v9 = v4;
  id v17 = v9;
  id v11 = objc_msgSend_utilityServer_(self, v10, (uint64_t)v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1DC668538;
  v14[3] = &unk_1E6C96CF8;
  v14[4] = self;
  id v15 = v9;
  id v12 = v9;
  objc_msgSend_remote_recreateDevelopmentDatabaseWithCompletion_(v11, v13, (uint64_t)v14);
}

- (void)syncRecreateDevelopmentDatabaseWithCompletion:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_endpointConnection(self, v5, v6);
  objc_msgSend_addBarrierBlock_(v7, v8, (uint64_t)&unk_1F37A0BD0);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1DC668788;
  v16[3] = &unk_1E6C95CF8;
  id v9 = v4;
  id v17 = v9;
  id v11 = objc_msgSend_syncUtilityServer_(self, v10, (uint64_t)v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1DC6687A0;
  v14[3] = &unk_1E6C96CF8;
  v14[4] = self;
  id v15 = v9;
  id v12 = v9;
  objc_msgSend_remote_recreateDevelopmentDatabaseWithCompletion_(v11, v13, (uint64_t)v14);
}

- (void)getDevModeWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC668964;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_getDevModeWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)syncGetDevModeWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC668A24;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  v7 = objc_msgSend_syncUtilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_getDevModeWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)setDevMode:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v9 = objc_msgSend_endpointConnection(self, v7, v8);
  objc_msgSend_addBarrierBlock_(v9, v10, (uint64_t)&unk_1F37A0F90);

  objc_msgSend_utilityServer_(self, v11, (uint64_t)v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_setDevMode_completion_(v13, v12, v4, v6);
}

- (void)syncSetDevMode:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v9 = objc_msgSend_endpointConnection(self, v7, v8);
  objc_msgSend_addBarrierBlock_(v9, v10, (uint64_t)&unk_1F37A0BF0);

  objc_msgSend_syncUtilityServer_(self, v11, (uint64_t)v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_setDevMode_completion_(v13, v12, v4, v6);
}

- (void)getClassKitCatalogEnvironmentWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC668C14;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_getClassKitCatalogEnvironmentWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)syncGetClassKitCatalogEnvironmentWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC668CD4;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  v7 = objc_msgSend_syncUtilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_getClassKitCatalogEnvironmentWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)setClassKitCatalogEnvironment:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DC668DA4;
  v11[3] = &unk_1E6C95CF8;
  id v12 = v6;
  id v7 = v6;
  id v9 = objc_msgSend_utilityServer_(self, v8, (uint64_t)v11);
  objc_msgSend_remote_setClassKitCatalogEnvironment_completion_(v9, v10, a3, v7);
}

- (void)syncSetClassKitCatalogEnvironment:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DC668E6C;
  v11[3] = &unk_1E6C95CF8;
  id v12 = v6;
  id v7 = v6;
  id v9 = objc_msgSend_syncUtilityServer_(self, v8, (uint64_t)v11);
  objc_msgSend_remote_setClassKitCatalogEnvironment_completion_(v9, v10, a3, v7);
}

- (void)syncStatsWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC668F24;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  id v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_syncStatsWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)syncPushWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC668FE4;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  id v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_syncPushWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)syncFetchWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC6690A4;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  id v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_syncFetchWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)syncBootstrapWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC669164;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  id v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_syncBootstrapWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)fetchReportsWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC669240;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_fetchReportsWithPredicate_completion_(v10, v11, (uint64_t)v8, v7);
}

- (void)statusWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC669300;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  id v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_statusWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC6693C0;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  id v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_renewCredentialsWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)addAuthorizationStatus:(unint64_t)a3 forContextAtPath:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1DC66950C;
  v17[3] = &unk_1E6C95CF8;
  id v9 = v8;
  id v18 = v9;
  id v10 = a4;
  id v12 = objc_msgSend_utilityServer_(self, v11, (uint64_t)v17);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC669524;
  v15[3] = &unk_1E6C96CF8;
  v15[4] = self;
  id v16 = v9;
  id v13 = v9;
  objc_msgSend_remote_addAuthorizationStatus_forContextAtPath_completion_(v12, v14, a3, v10, v15);
}

- (void)addAuthorizationStatus:(unint64_t)a3 forHandoutAssignedItem:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1DC669770;
  v17[3] = &unk_1E6C95CF8;
  id v9 = v8;
  id v18 = v9;
  id v10 = a4;
  id v12 = objc_msgSend_utilityServer_(self, v11, (uint64_t)v17);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC669788;
  v15[3] = &unk_1E6C96CF8;
  v15[4] = self;
  id v16 = v9;
  id v13 = v9;
  objc_msgSend_remote_addAuthorizationStatus_forHandoutAssignedItem_completion_(v12, v14, a3, v10, v15);
}

- (void)removeAuthorizationStatus:(unint64_t)a3 forContextAtPath:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1DC6699D4;
  v17[3] = &unk_1E6C95CF8;
  id v9 = v8;
  id v18 = v9;
  id v10 = a4;
  id v12 = objc_msgSend_utilityServer_(self, v11, (uint64_t)v17);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC6699EC;
  v15[3] = &unk_1E6C96CF8;
  v15[4] = self;
  id v16 = v9;
  id v13 = v9;
  objc_msgSend_remote_removeAuthorizationStatus_forContextAtPath_completion_(v12, v14, a3, v10, v15);
}

- (void)removeAuthorizationStatus:(unint64_t)a3 forHandoutAssignedItem:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1DC669C38;
  v17[3] = &unk_1E6C95CF8;
  id v9 = v8;
  id v18 = v9;
  id v10 = a4;
  id v12 = objc_msgSend_utilityServer_(self, v11, (uint64_t)v17);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC669C50;
  v15[3] = &unk_1E6C96CF8;
  v15[4] = self;
  id v16 = v9;
  id v13 = v9;
  objc_msgSend_remote_removeAuthorizationStatus_forHandoutAssignedItem_completion_(v12, v14, a3, v10, v15);
}

- (void)authorizationStatusForContextAtPath:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC669E30;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_authorizationStatusForContextAtPath_completion_(v10, v11, (uint64_t)v8, v7);
}

- (void)authorizationStatusForHandoutAssignedItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC669F0C;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_authorizationStatusForHandoutAssignedItem_completion_(v10, v11, (uint64_t)v8, v7);
}

- (void)addAdminRequestor:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC669FE8;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_addAdminRequestor_completion_(v10, v11, (uint64_t)v8, v7);
}

- (void)addOrganization:(id)a3 withLocations:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC66A0D8;
  v15[3] = &unk_1E6C95CF8;
  id v16 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v13 = objc_msgSend_utilityServer_(self, v12, (uint64_t)v15);
  objc_msgSend_remote_addOrganization_withLocations_completion_(v13, v14, (uint64_t)v11, v10, v9);
}

- (void)deleteOrganization:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC66A1B4;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_deleteOrganization_completion_(v10, v11, (uint64_t)v8, v7);
}

- (void)topLevelContentStoreCacheDirectoryURLWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC66A274;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  id v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_topLevelContentStoreCacheDirectoryURLWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)currentUserContentStoreCacheDirectoryURLWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC66A334;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  id v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_currentUserContentStoreCacheDirectoryURLWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)accountChangedTrigger:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DC66A408;
  v10[3] = &unk_1E6C95CF8;
  id v11 = v4;
  id v5 = (void (**)(id, uint64_t, void))v4;
  id v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v10);
  objc_msgSend_remote_accountChanged(v7, v8, v9);

  v5[2](v5, 1, 0);
}

- (void)getBootstrapMode:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC66A4C8;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  id v7 = objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_getBootstrapMode_(v7, v8, (uint64_t)v5);
}

- (void)setBootstrapMode:(int)a3 url:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1DC66A5B0;
  v14[3] = &unk_1E6C95CF8;
  id v15 = v8;
  id v9 = v8;
  id v10 = a4;
  id v12 = objc_msgSend_utilityServer_(self, v11, (uint64_t)v14);
  objc_msgSend_remote_setBootstrapMode_url_completion_(v12, v13, v6, v10, v9);
}

- (CLSEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end