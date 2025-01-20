@interface CKContainer
+ (BOOL)currentProcessCanUseCloudKit;
+ (CKContainer)allocWithZone:(_NSZone *)a3;
+ (CKContainer)containerWithIdentifier:(NSString *)containerIdentifier;
+ (CKContainer)defaultContainer;
+ (id)_CKXPCClientToDiscretionaryDaemonInterface;
+ (id)containerIDForContainerIdentifier:(id)a3;
+ (id)containerIDForContainerIdentifier:(id)a3 environment:(int64_t)a4;
+ (id)containersByIdentifier;
+ (id)importantUserRecordAccessQueue;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (id)matterhornName;
+ (id)uploadRequestFetchAllNotificationName;
+ (int64_t)containerEnvironmentForContainerID:(id)a3 entitlements:(id)a4;
+ (void)initialize;
+ (void)removeIdentifierFromContainersWithIdentifier:(id)a3;
- (CKContainer)initWithContainerID:(id)a3;
- (CKContainer)initWithContainerID:(id)a3 options:(id)a4;
- (CKContainer)initWithContainerSetupInfo:(id)a3;
- (CKContainer)initWithImplementation:(id)a3 convenienceConfiguration:(id)a4;
- (CKContainerID)containerID;
- (CKContainerImplementation)implementation;
- (CKContainerOptions)options;
- (CKContainerSetupInfo)setupInfo;
- (CKConvenienceConfiguration)convenienceConfiguration;
- (CKDatabase)databaseWithDatabaseScope:(CKDatabaseScope)databaseScope;
- (CKDatabase)organizationCloudDatabase;
- (CKDatabase)privateCloudDatabase;
- (CKDatabase)publicCloudDatabase;
- (CKDatabase)sharedCloudDatabase;
- (NSMutableArray)codeServices;
- (NSString)containerIdentifier;
- (NSString)sourceApplicationBundleIdentifier;
- (NSString)sourceApplicationSecondaryIdentifier;
- (id)CKStatusReportArray;
- (id)_initUnconfiguredContainerWithImplementation:(id)a3;
- (id)_initWithContainerIdentifier:(id)a3;
- (id)codeServiceWithName:(id)a3;
- (id)codeServiceWithName:(id)a3 databaseScope:(int64_t)a4;
- (id)codeServiceWithName:(id)a3 databaseScope:(int64_t)a4 serviceInstanceURL:(id)a5;
- (id)codeServiceWithName:(id)a3 serviceInstanceURL:(id)a4;
- (id)serverPreferredPushEnvironmentWithError:(id *)a3;
- (int)keychainViewScopedIdentityUpdateToken;
- (int)pcsServiceScopedAccountChangeToken;
- (int)pcsServiceScopedIdentityUpdateToken;
- (void)acceptShareMetadata:(CKShareMetadata *)metadata completionHandler:(void *)completionHandler;
- (void)accountInfoWithCompletionHandler:(id)a3;
- (void)accountStatusWithCompletionHandler:(void *)completionHandler;
- (void)addOperation:(CKOperation *)operation;
- (void)cancelUploadRequests;
- (void)dealloc;
- (void)discoverAllContactUserInfosWithCompletionHandler:(id)a3;
- (void)discoverAllIdentitiesWithCompletionHandler:(void *)completionHandler;
- (void)discoverUserIdentityWithEmailAddress:(NSString *)email completionHandler:(void *)completionHandler;
- (void)discoverUserIdentityWithPhoneNumber:(NSString *)phoneNumber completionHandler:(void *)completionHandler;
- (void)discoverUserIdentityWithUserRecordID:(CKRecordID *)userRecordID completionHandler:(void *)completionHandler;
- (void)discoverUserInfoWithEmailAddress:(id)a3 completionHandler:(id)a4;
- (void)discoverUserInfoWithUserRecordID:(id)a3 completionHandler:(id)a4;
- (void)fetchAllLongLivedOperationIDsWithCompletionHandler:(void *)completionHandler;
- (void)fetchCurrentDeviceIDWithCompletionHandler:(id)a3;
- (void)fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:(id)a3;
- (void)fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:(id)a3;
- (void)fetchLongLivedOperationWithID:(CKOperationID)operationID completionHandler:(void *)completionHandler;
- (void)fetchOrgAdminUserRecordIDWithCompletionHandler:(id)a3;
- (void)fetchShareMetadataWithURL:(NSURL *)url completionHandler:(void *)completionHandler;
- (void)fetchShareParticipantWithEmailAddress:(NSString *)emailAddress completionHandler:(void *)completionHandler;
- (void)fetchShareParticipantWithLookupInfo:(id)a3 completionHandler:(id)a4;
- (void)fetchShareParticipantWithPhoneNumber:(NSString *)phoneNumber completionHandler:(void *)completionHandler;
- (void)fetchShareParticipantWithUserRecordID:(CKRecordID *)userRecordID completionHandler:(void *)completionHandler;
- (void)fetchSignatureGeneratorForCurrentUserBoundaryKeyWithCompletionHandler:(id)a3;
- (void)fetchUserRecordIDWithCompletionHandler:(void *)completionHandler;
- (void)getContainerScopedDaemonProxyWithRetryHandler:(id)a3 errorHandler:(id)a4 daemonProxyHandler:(id)a5;
- (void)getNewWebSharingIdentityDataWithCompletionHandler:(id)a3;
- (void)getSynchronousContainerScopedDaemonProxyWithErrorHandler:(id)a3 daemonProxyHandler:(id)a4;
- (void)manuallyTriggerUploadRequests;
- (void)pushEnvironmentWithCompletionHandler:(id)a3;
- (void)registerForAssetUploadRequests:(id)a3;
- (void)registerForAssetUploadRequests:(id)a3 machServiceName:(id)a4;
- (void)registerForPackageUploadRequests:(id)a3;
- (void)registerForPackageUploadRequests:(id)a3 machServiceName:(id)a4;
- (void)registerSystemSharingUIObserver:(id)a3;
- (void)requestApplicationPermission:(CKApplicationPermissions)applicationPermission completionHandler:(CKApplicationPermissionBlock)completionHandler;
- (void)serverPreferredPushEnvironmentWithCompletionHandler:(id)a3;
- (void)setApplicationPermission:(unint64_t)a3 enabled:(BOOL)a4 completionHandler:(id)a5;
- (void)setCodeServices:(id)a3;
- (void)setFakeError:(id)a3 forNextRequestOfClassName:(id)a4;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
- (void)setSourceApplicationSecondaryIdentifier:(id)a3;
- (void)statusForApplicationPermission:(CKApplicationPermissions)applicationPermission completionHandler:(CKApplicationPermissionBlock)completionHandler;
- (void)statusGroupsForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4;
- (void)submitEventMetric:(id)a3;
- (void)submitEventMetric:(id)a3 completionHandler:(id)a4;
- (void)unregisterFromUploadRequests;
- (void)unregisterFromUploadRequestsWithMachServiceName:(id)a3;
- (void)wipeAllCachesAndDie;
- (void)withUploadManager:(int)a3 performBlock:(id)a4;
@end

@implementation CKContainer

+ (CKContainer)containerWithIdentifier:(NSString *)containerIdentifier
{
  v4 = containerIdentifier;
  objc_msgSend_containersByIdentifier(a1, v5, v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10);
  if (!v11)
  {
    v12 = [CKContainer alloc];
    v11 = objc_msgSend__initWithContainerIdentifier_(v12, v13, (uint64_t)v4, v14);
    objc_msgSend_setObject_forKeyedSubscript_(v8, v15, (uint64_t)v11, (uint64_t)v4);
  }
  objc_sync_exit(v8);

  return (CKContainer *)v11;
}

+ (id)containersByIdentifier
{
  if (qword_1EB279AE0 != -1) {
    dispatch_once(&qword_1EB279AE0, &unk_1ED7F0698);
  }
  v2 = (void *)qword_1EB279AD8;

  return v2;
}

+ (BOOL)currentProcessCanUseCloudKit
{
  v4 = objc_msgSend_sharedManager(CKProcessScopedStateManager, a2, v2, v3);
  id v8 = objc_msgSend_untrustedEntitlements(v4, v5, v6, v7);

  v12 = objc_msgSend_cloudServices(v8, v9, v10, v11);
  if (objc_msgSend_containsObject_(v12, v13, @"CloudKit", v14))
  {
    char v18 = 1;
  }
  else
  {
    v19 = objc_msgSend_cloudServices(v8, v15, v16, v17);
    char v18 = objc_msgSend_containsObject_(v19, v20, @"CloudKit-Anonymous", v21);
  }
  return v18;
}

- (void)fetchUserRecordIDWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchUserRecordIDWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);
}

- (void)accountInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountInfoWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);
}

- (CKContainerOptions)options
{
  id v4 = objc_msgSend_implementation(self, a2, v2, v3);
  id v8 = objc_msgSend_options(v4, v5, v6, v7);

  return (CKContainerOptions *)v8;
}

- (CKContainerImplementation)implementation
{
  return self->_implementation;
}

- (CKDatabase)privateCloudDatabase
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_privateCloudDatabase)
  {
    uint64_t v6 = objc_msgSend_implementation(v2, v3, v4, v5);
    id v10 = objc_msgSend_privateCloudDatabaseImplementation(v6, v7, v8, v9);

    uint64_t v11 = [CKDatabase alloc];
    uint64_t inited = objc_msgSend_initInternalWithImplementation_container_(v11, v12, (uint64_t)v10, (uint64_t)v2);
    privateCloudDatabase = v2->_privateCloudDatabase;
    v2->_privateCloudDatabase = (CKDatabase *)inited;
  }
  objc_sync_exit(v2);

  v15 = v2->_privateCloudDatabase;

  return v15;
}

- (CKContainer)initWithImplementation:(id)a3 convenienceConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKContainer;
  uint64_t v9 = [(CKContainer *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_convenienceConfiguration, a4);
    objc_storeStrong((id *)&v10->_implementation, a3);
  }

  return v10;
}

- (void)dealloc
{
  int pcsServiceScopedIdentityUpdateToken = self->_pcsServiceScopedIdentityUpdateToken;
  if (pcsServiceScopedIdentityUpdateToken != -1) {
    notify_cancel(pcsServiceScopedIdentityUpdateToken);
  }
  int keychainViewScopedIdentityUpdateToken = self->_keychainViewScopedIdentityUpdateToken;
  if (keychainViewScopedIdentityUpdateToken != -1) {
    notify_cancel(keychainViewScopedIdentityUpdateToken);
  }
  int pcsServiceScopedAccountChangeToken = self->_pcsServiceScopedAccountChangeToken;
  if (pcsServiceScopedAccountChangeToken != -1) {
    notify_cancel(pcsServiceScopedAccountChangeToken);
  }
  id v8 = objc_msgSend_sharedManager(CKProcessScopedStateManager, a2, v2, v3);
  sub_18AF4F540(v8, self);

  v9.receiver = self;
  v9.super_class = (Class)CKContainer;
  [(CKContainer *)&v9 dealloc];
}

- (CKDatabase)databaseWithDatabaseScope:(CKDatabaseScope)databaseScope
{
  switch(databaseScope)
  {
    case 0:
      id v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, databaseScope, v3);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, (uint64_t)self, @"CKContainer.m", 2866, @"You must provide a valid database scope when getting a database from a container.");

      objc_super v9 = 0;
      goto LABEL_10;
    case 1:
      objc_super v9 = objc_msgSend_publicCloudDatabase(self, a2, databaseScope, v3);
      goto LABEL_10;
    case 2:
      objc_super v9 = objc_msgSend_privateCloudDatabase(self, a2, databaseScope, v3);
      goto LABEL_10;
    case 3:
      objc_super v9 = objc_msgSend_sharedCloudDatabase(self, a2, databaseScope, v3);
      goto LABEL_10;
    case 4:
      objc_super v9 = objc_msgSend_organizationCloudDatabase(self, a2, databaseScope, v3);
LABEL_10:
      break;
    default:
      objc_super v9 = 0;
      break;
  }
  return (CKDatabase *)v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convenienceConfiguration, 0);
  objc_storeStrong((id *)&self->_implementation, 0);
  objc_storeStrong((id *)&self->_codeServices, 0);
  objc_storeStrong((id *)&self->_organizationCloudDatabase, 0);
  objc_storeStrong((id *)&self->_sharedCloudDatabase, 0);
  objc_storeStrong((id *)&self->_publicCloudDatabase, 0);

  objc_storeStrong((id *)&self->_privateCloudDatabase, 0);
}

+ (CKContainer)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1 && __sTestOverridesAvailable != 0 && byte_1E9124EF0 == 0)
  {
    uint64_t v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)a1, @"CKContainer.m", 2471, @"Why is partlycloudd initting a CKContainer directly");
  }
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___CKContainer;
  return (CKContainer *)objc_msgSendSuper2(&v14, sel_allocWithZone_, a3);
}

+ (void)initialize
{
  uint64_t v3 = (objc_class *)objc_opt_class();

  sub_18AF14F44((uint64_t)a1, v3, 0, &unk_1ED845DA8, 0);
}

+ (CKContainer)defaultContainer
{
  if (qword_1EB279AC8 != -1) {
    dispatch_once(&qword_1EB279AC8, &unk_1ED7EC568);
  }
  uint64_t v2 = (void *)qword_1EB279AD0;

  return (CKContainer *)v2;
}

+ (void)removeIdentifierFromContainersWithIdentifier:(id)a3
{
  id v9 = a3;
  objc_msgSend_containersByIdentifier(a1, v4, v5, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v8, 0, (uint64_t)v9);
  objc_sync_exit(v7);
}

- (id)_initWithContainerIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_containerIDForContainerIdentifier_(v5, v6, (uint64_t)v4, v7);

  id v9 = [CKContainerImplementation alloc];
  uint64_t v11 = objc_msgSend_initWithContainerID_options_unconfiguredWrappingContainer_(v9, v10, (uint64_t)v8, 0, self);
  uint64_t inited = objc_msgSend__initUnconfiguredContainerWithImplementation_(self, v12, (uint64_t)v11, v13);

  return inited;
}

- (CKContainer)initWithContainerSetupInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CKContainerImplementation alloc];
  id v9 = objc_msgSend_containerID(v4, v6, v7, v8);
  uint64_t v13 = objc_msgSend_containerOptions(v4, v10, v11, v12);

  v15 = objc_msgSend_initWithContainerID_options_unconfiguredWrappingContainer_(v5, v14, (uint64_t)v9, (uint64_t)v13, self);
  uint64_t inited = (CKContainer *)objc_msgSend__initUnconfiguredContainerWithImplementation_(self, v16, (uint64_t)v15, v17);

  return inited;
}

- (CKContainer)initWithContainerID:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [CKContainerImplementation alloc];
  id v10 = objc_msgSend_initWithContainerID_options_unconfiguredWrappingContainer_(v8, v9, (uint64_t)v7, (uint64_t)v6, self);

  uint64_t inited = (CKContainer *)objc_msgSend__initUnconfiguredContainerWithImplementation_(self, v11, (uint64_t)v10, v12);
  return inited;
}

- (CKContainer)initWithContainerID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CKContainerImplementation alloc];
  id v7 = objc_msgSend_initWithContainerID_options_unconfiguredWrappingContainer_(v5, v6, (uint64_t)v4, 0, self);

  uint64_t inited = (CKContainer *)objc_msgSend__initUnconfiguredContainerWithImplementation_(self, v8, (uint64_t)v7, v9);
  return inited;
}

- (id)_initUnconfiguredContainerWithImplementation:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_initWithImplementation_convenienceConfiguration_(self, v5, (uint64_t)v4, 0);
  if (v9)
  {
    id v10 = objc_msgSend_sharedManager(CKProcessScopedStateManager, v6, v7, v8);
    sub_18B046900(v10, (void *)v9);

    out_token[0] = -1;
    *(void *)(v9 + 8) = -1;
    *(_DWORD *)(v9 + 16) = -1;
    objc_super v14 = objc_msgSend_options((void *)v9, v11, v12, v13);
    char v18 = objc_msgSend_encryptionServiceName(v14, v15, v16, v17);
    v22 = v18;
    if (v18)
    {
      id v23 = v18;
    }
    else
    {
      v24 = objc_msgSend_untrustedEntitlements((void *)v9, v19, v20, v21);
      v28 = objc_msgSend_serviceNameForContainerIdentifierMapEntitlement(v24, v25, v26, v27);

      v32 = objc_msgSend_containerIdentifier((void *)v9, v29, v30, v31);
      objc_msgSend_objectForKeyedSubscript_(v28, v33, (uint64_t)v32, v34);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v38 = objc_msgSend_options((void *)v9, v35, v36, v37);
    objc_msgSend_setIsServiceManatee_(v38, v39, 0, v40);

    if (v23)
    {
      objc_initWeak(&location, (id)v9);
      v41 = NSString;
      v42 = CKTestNotificationPrefix();
      v45 = objc_msgSend_stringWithFormat_(v41, v43, @"%@%@-%@", v44, v42, @"com.apple.cloudd.pcsIdentityUpdate", v23);

      v49 = (const char *)objc_msgSend_UTF8String(v45, v46, v47, v48);
      v50 = CKGetGlobalQueue(-1);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = sub_18B03D118;
      handler[3] = &unk_1E5461938;
      id v51 = v23;
      id v93 = v51;
      objc_copyWeak(&v94, &location);
      LODWORD(v42) = notify_register_dispatch(v49, out_token, v50, handler);

      int v52 = out_token[0];
      if (v42) {
        int v52 = -1;
      }
      *(_DWORD *)(v9 + 8) = v52;
      out_token[0] = -1;
      v53 = PCSServiceItemGetCKKSViewByName();
      v54 = NSString;
      v55 = CKTestNotificationPrefix();
      v58 = objc_msgSend_stringWithFormat_(v54, v56, @"%@%@-%@", v57, v55, @"com.apple.cloudd.pcsIdentityUpdate", v53);

      v62 = (const char *)objc_msgSend_UTF8String(v58, v59, v60, v61);
      v63 = CKGetGlobalQueue(-1);
      v85 = v58;
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = sub_18B03D230;
      v89[3] = &unk_1E5461938;
      id v64 = v53;
      id v90 = v64;
      objc_copyWeak(&v91, &location);
      LODWORD(v58) = notify_register_dispatch(v62, out_token, v63, v89);

      int v65 = out_token[0];
      if (v58) {
        int v65 = -1;
      }
      *(_DWORD *)(v9 + 12) = v65;
      out_token[0] = -1;
      v66 = NSString;
      v67 = CKTestNotificationPrefix();
      v70 = objc_msgSend_stringWithFormat_(v66, v68, @"%@%@-%@", v69, v67, @"com.apple.cloudd.accountChanged", v51);

      v74 = (const char *)objc_msgSend_UTF8String(v70, v71, v72, v73);
      v75 = CKGetGlobalQueue(-1);
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = sub_18B03D348;
      v86[3] = &unk_1E5461938;
      id v87 = v51;
      objc_copyWeak(&v88, &location);
      LODWORD(v74) = notify_register_dispatch(v74, out_token, v75, v86);

      int v76 = out_token[0];
      if (v74) {
        int v76 = -1;
      }
      *(_DWORD *)(v9 + 16) = v76;
      uint64_t IsManatee = PCSServiceItemTypeIsManatee();
      v81 = objc_msgSend_options((void *)v9, v78, v79, v80);
      objc_msgSend_setIsServiceManatee_(v81, v82, IsManatee, v83);

      objc_destroyWeak(&v88);
      objc_destroyWeak(&v91);

      objc_destroyWeak(&v94);
      objc_destroyWeak(&location);
    }
  }
  return (id)v9;
}

- (void)getContainerScopedDaemonProxyWithRetryHandler:(id)a3 errorHandler:(id)a4 daemonProxyHandler:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = objc_msgSend_implementation(self, v10, v11, v12);
  objc_super v14 = v13;
  if (v13) {
    sub_18AF3C510(v13, 0, (void *)1, v15, v8, v9);
  }
}

- (void)getSynchronousContainerScopedDaemonProxyWithErrorHandler:(id)a3 daemonProxyHandler:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v10 = objc_msgSend_implementation(self, v7, v8, v9);
  uint64_t v11 = v10;
  if (v10) {
    sub_18AF3C510(v10, 1, (void *)1, 0, v12, v6);
  }
}

+ (id)containerIDForContainerIdentifier:(id)a3 environment:(int64_t)a4
{
  id v5 = a3;
  if (!v5)
  {
    self;
    uint64_t v9 = sub_18B035DF8();
    if (v9)
    {
      objc_msgSend_stringWithFormat_(NSString, v6, @"iCloud.%@", v8, v9);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

      goto LABEL_10;
    }
    id v10 = objc_msgSend_sharedManager(CKProcessScopedStateManager, v6, v7, v8);
    objc_super v14 = objc_msgSend_untrustedEntitlements(v10, v11, v12, v13);
    if (!objc_msgSend_hasMasqueradingEntitlement(v14, v15, v16, v17))
    {
      uint64_t v21 = objc_msgSend_sharedManager(CKProcessScopedStateManager, v18, v19, v20);
      v25 = objc_msgSend_untrustedEntitlements(v21, v22, v23, v24);
      v29 = objc_msgSend_clientPrefixEntitlement(v25, v26, v27, v28);

      if (v29)
      {
LABEL_8:
        id v5 = 0;
        goto LABEL_9;
      }
      id v10 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v30, v31, v32);
      objc_super v14 = objc_msgSend_processName(v10, v33, v34, v35);
      CKWarnForInvalidApplicationIdentifier(0, v14);
    }

    goto LABEL_8;
  }
LABEL_10:
  uint64_t v36 = [CKContainerID alloc];
  v38 = objc_msgSend_initWithContainerIdentifier_environment_(v36, v37, (uint64_t)v5, a4);

  return v38;
}

+ (id)containerIDForContainerIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedManager(CKProcessScopedStateManager, v5, v6, v7);
  uint64_t v12 = objc_msgSend_untrustedEntitlements(v8, v9, v10, v11);

  uint64_t v16 = objc_msgSend_containerEnvironment(v12, v13, v14, v15);
  char v18 = objc_msgSend_containerIDForContainerIdentifier_environment_(a1, v17, (uint64_t)v4, v16);

  uint64_t v20 = objc_msgSend_containerEnvironmentForContainerID_entitlements_(a1, v19, (uint64_t)v18, (uint64_t)v12);
  uint64_t v21 = [CKContainerID alloc];
  v25 = objc_msgSend_containerIdentifier(v18, v22, v23, v24);
  uint64_t v27 = objc_msgSend_initWithContainerIdentifier_environment_(v21, v26, (uint64_t)v25, v20);

  return v27;
}

+ (int64_t)containerEnvironmentForContainerID:(id)a3 entitlements:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_hasEnvironmentEntitlement(v7, v8, v9, v10))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v14 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      int v49 = 138412290;
      id v50 = a1;
      _os_log_impl(&dword_18AF10000, v14, OS_LOG_TYPE_INFO, "Allowing %@ to set any environment", (uint8_t *)&v49, 0xCu);
    }
    uint64_t v21 = objc_msgSend_environment(v6, v15, v16, v17);
  }
  else
  {
    uint64_t v21 = objc_msgSend_containerEnvironment(v7, v11, v12, v13);
    if (v21 == 1)
    {
      v22 = objc_msgSend_developmentContainerEnvironmentOverrides(v7, v18, v19, v20);
      uint64_t v26 = objc_msgSend_containerIdentifier(v6, v23, v24, v25);
      int v29 = objc_msgSend_containsObject_(v22, v27, (uint64_t)v26, v28);

      if (v29)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v30 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = v30;
          uint64_t v35 = objc_msgSend_applicationBundleID(v7, v32, v33, v34);
          int v49 = 138543618;
          id v50 = v35;
          __int16 v51 = 2114;
          id v52 = v6;
          _os_log_impl(&dword_18AF10000, v31, OS_LOG_TYPE_INFO, "Client \"%{public}@\" requested sandbox environment for container id %{public}@", (uint8_t *)&v49, 0x16u);
        }
        uint64_t v21 = 2;
      }
      else
      {
        uint64_t v21 = 1;
      }
    }
  }
  if (v21 != objc_msgSend_environment(v6, v18, v19, v20))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v36 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v38 = v36;
      v42 = objc_msgSend_applicationBundleID(v7, v39, v40, v41);
      uint64_t v46 = objc_msgSend_environment(v6, v43, v44, v45);
      uint64_t v47 = CKContainerEnvironmentString(v46);
      uint64_t v48 = CKContainerEnvironmentString(v21);
      int v49 = 138543874;
      id v50 = v42;
      __int16 v51 = 2114;
      id v52 = v47;
      __int16 v53 = 2114;
      v54 = v48;
      _os_log_error_impl(&dword_18AF10000, v38, OS_LOG_TYPE_ERROR, "Client \"%{public}@\" tried to access environment \"%{public}@\", even though the entitlements specified \"%{public}@\"", (uint8_t *)&v49, 0x20u);
    }
  }

  return v21;
}

+ (id)matterhornName
{
  return CKLocalizedString(@"ICLOUD", &stru_1ED7F5C98, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)uploadRequestFetchAllNotificationName
{
  return @"com.apple.cloudkit.uploadrequest.fetchall";
}

+ (id)_CKXPCClientToDiscretionaryDaemonInterface
{
  if (qword_1EB279B20 != -1) {
    dispatch_once(&qword_1EB279B20, &unk_1ED7F5518);
  }
  uint64_t v2 = (void *)qword_1EB279B18;

  return v2;
}

+ (id)importantUserRecordAccessQueue
{
  return (id)qword_1EB279A98;
}

- (CKDatabase)publicCloudDatabase
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_publicCloudDatabase)
  {
    uint64_t v6 = objc_msgSend_implementation(v2, v3, v4, v5);
    uint64_t v10 = objc_msgSend_publicCloudDatabaseImplementation(v6, v7, v8, v9);

    uint64_t v11 = [CKDatabase alloc];
    uint64_t inited = objc_msgSend_initInternalWithImplementation_container_(v11, v12, (uint64_t)v10, (uint64_t)v2);
    publicCloudDatabase = v2->_publicCloudDatabase;
    v2->_publicCloudDatabase = (CKDatabase *)inited;
  }
  objc_sync_exit(v2);

  uint64_t v15 = v2->_publicCloudDatabase;

  return v15;
}

- (CKDatabase)sharedCloudDatabase
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sharedCloudDatabase)
  {
    uint64_t v6 = objc_msgSend_implementation(v2, v3, v4, v5);
    uint64_t v10 = objc_msgSend_sharedCloudDatabaseImplementation(v6, v7, v8, v9);

    uint64_t v11 = [CKDatabase alloc];
    uint64_t inited = objc_msgSend_initInternalWithImplementation_container_(v11, v12, (uint64_t)v10, (uint64_t)v2);
    sharedCloudDatabase = v2->_sharedCloudDatabase;
    v2->_sharedCloudDatabase = (CKDatabase *)inited;
  }
  objc_sync_exit(v2);

  uint64_t v15 = v2->_sharedCloudDatabase;

  return v15;
}

- (CKDatabase)organizationCloudDatabase
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_organizationCloudDatabase)
  {
    uint64_t v6 = objc_msgSend_implementation(v2, v3, v4, v5);
    uint64_t v10 = objc_msgSend_organizationCloudDatabaseImplementation(v6, v7, v8, v9);

    uint64_t v11 = [CKDatabase alloc];
    uint64_t inited = objc_msgSend_initInternalWithImplementation_container_(v11, v12, (uint64_t)v10, (uint64_t)v2);
    organizationCloudDatabase = v2->_organizationCloudDatabase;
    v2->_organizationCloudDatabase = (CKDatabase *)inited;
  }
  objc_sync_exit(v2);

  uint64_t v15 = v2->_organizationCloudDatabase;

  return v15;
}

- (id)codeServiceWithName:(id)a3
{
  return sub_18B03E610(self, a3, 0, 0);
}

- (id)codeServiceWithName:(id)a3 databaseScope:(int64_t)a4
{
  id v10 = a3;
  if (!a4)
  {
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8, v9);
    uint64_t v15 = NSStringFromSelector(sel_codeServiceWithName_);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v16, (uint64_t)a2, (uint64_t)self, @"CKContainer.m", 2913, @"You must provide a valid database scope when getting a code service bound to a database.  Did you mean to use %@?", v15);
  }
  uint64_t v11 = objc_msgSend_numberWithInteger_(NSNumber, v7, a4, v9);
  uint64_t v12 = sub_18B03E610(self, v10, v11, 0);

  return v12;
}

- (id)codeServiceWithName:(id)a3 serviceInstanceURL:(id)a4
{
  return sub_18B03E610(self, a3, 0, a4);
}

- (id)codeServiceWithName:(id)a3 databaseScope:(int64_t)a4 serviceInstanceURL:(id)a5
{
  id v9 = a3;
  id v13 = a5;
  if (!a4)
  {
    uint64_t v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12);
    char v18 = NSStringFromSelector(sel_codeServiceWithName_serviceInstanceURL_);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v19, (uint64_t)a2, (uint64_t)self, @"CKContainer.m", 2920, @"You must provide a valid database scope when getting a code service bound to a database.  Did you mean to use %@?", v18);
  }
  uint64_t v14 = objc_msgSend_numberWithInteger_(NSNumber, v10, a4, v12);
  uint64_t v15 = sub_18B03E610(self, v9, v14, v13);

  return v15;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CKContainer;
  uint64_t v4 = objc_msgSendSuper2(&v8, sel_instanceMethodSignatureForSelector_);
  if (!v4)
  {
    uint64_t v4 = objc_msgSend_instanceMethodSignatureForSelector_(CKContainerImplementation, v5, (uint64_t)a3, v6);
  }

  return v4;
}

- (NSString)containerIdentifier
{
  uint64_t v4 = objc_msgSend_implementation(self, a2, v2, v3);
  objc_super v8 = objc_msgSend_containerIdentifier(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (CKContainerID)containerID
{
  uint64_t v4 = objc_msgSend_implementation(self, a2, v2, v3);
  objc_super v8 = objc_msgSend_containerID(v4, v5, v6, v7);

  return (CKContainerID *)v8;
}

- (NSString)sourceApplicationBundleIdentifier
{
  uint64_t v4 = objc_msgSend_implementation(self, a2, v2, v3);
  objc_super v8 = objc_msgSend_sourceApplicationBundleIdentifier(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSourceApplicationBundleIdentifier_(v10, v8, (uint64_t)v4, v9);
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  id v4 = objc_msgSend_implementation(self, a2, v2, v3);
  objc_super v8 = objc_msgSend_sourceApplicationSecondaryIdentifier(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (void)setSourceApplicationSecondaryIdentifier:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSourceApplicationSecondaryIdentifier_(v10, v8, (uint64_t)v4, v9);
}

- (CKContainerSetupInfo)setupInfo
{
  id v4 = objc_msgSend_implementation(self, a2, v2, v3);
  objc_super v8 = objc_msgSend_setupInfo(v4, v5, v6, v7);

  return (CKContainerSetupInfo *)v8;
}

- (void)addOperation:(CKOperation *)operation
{
  uint64_t v26 = operation;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend_configuration(v26, v4, v5, v6);
    if (objc_msgSend_isLongLived(v7, v8, v9, v10))
    {
      int isOutstandingOperation = objc_msgSend_isOutstandingOperation(v26, v11, v12, v13);

      if (isOutstandingOperation)
      {
        uint64_t v15 = v26;
        uint64_t v19 = objc_msgSend_database(v15, v16, v17, v18);
        objc_msgSend_addOperation_(v19, v20, (uint64_t)v15, v21);
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v19 = objc_msgSend_implementation(self, v4, v5, v6);
  objc_msgSend_convenienceConfiguration(self, v22, v23, v24);
  uint64_t v15 = (CKOperation *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_wrappingContainer_convenienceConfiguration_(v19, v25, (uint64_t)v26, (uint64_t)self, v15);
LABEL_7:
}

- (void)accountStatusWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountStatusWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);
}

- (void)statusForApplicationPermission:(CKApplicationPermissions)applicationPermission completionHandler:(CKApplicationPermissionBlock)completionHandler
{
  CKApplicationPermissionBlock v6 = completionHandler;
  objc_msgSend_implementation(self, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_statusForApplicationPermission_completionHandler_(v11, v10, applicationPermission, (uint64_t)v6);
}

- (void)requestApplicationPermission:(CKApplicationPermissions)applicationPermission completionHandler:(CKApplicationPermissionBlock)completionHandler
{
  CKApplicationPermissionBlock v6 = completionHandler;
  objc_msgSend_implementation(self, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestApplicationPermission_completionHandler_(v11, v10, applicationPermission, (uint64_t)v6);
}

- (void)discoverAllIdentitiesWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = objc_msgSend_convenienceConfiguration(self, v8, v9, v10);
  objc_msgSend_discoverAllIdentitiesWithWrappingContainer_convenienceConfiguration_completionHandler_(v13, v12, (uint64_t)self, (uint64_t)v11, v4);
}

- (void)discoverUserIdentityWithEmailAddress:(NSString *)email completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = email;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  objc_msgSend_discoverUserIdentityWithEmailAddress_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);
}

- (void)discoverUserIdentityWithPhoneNumber:(NSString *)phoneNumber completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = phoneNumber;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  objc_msgSend_discoverUserIdentityWithPhoneNumber_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);
}

- (void)discoverUserIdentityWithUserRecordID:(CKRecordID *)userRecordID completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = userRecordID;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  objc_msgSend_discoverUserIdentityWithUserRecordID_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);
}

- (void)fetchShareParticipantWithEmailAddress:(NSString *)emailAddress completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = emailAddress;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  objc_msgSend_fetchShareParticipantWithEmailAddress_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);
}

- (void)fetchShareParticipantWithPhoneNumber:(NSString *)phoneNumber completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = phoneNumber;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  objc_msgSend_fetchShareParticipantWithPhoneNumber_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);
}

- (void)fetchShareParticipantWithUserRecordID:(CKRecordID *)userRecordID completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = userRecordID;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  objc_msgSend_fetchShareParticipantWithUserRecordID_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);
}

- (void)fetchShareMetadataWithURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = url;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  objc_msgSend_fetchShareMetadataWithURL_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);
}

- (void)acceptShareMetadata:(CKShareMetadata *)metadata completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = metadata;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  objc_msgSend_acceptShareMetadata_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);
}

- (void)registerSystemSharingUIObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/register-system-sharing-ui-observer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v9 = objc_msgSend_implementation(self, v6, v7, v8);
  objc_sync_enter(v9);
  uint64_t v13 = objc_msgSend_implementation(self, v10, v11, v12);
  uint64_t v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = *(void **)(v13 + 248);
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;
  objc_msgSend_addObject_(v16, v17, (uint64_t)v4, v18);

  objc_sync_exit(v9);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_18B03F828;
  v22[3] = &unk_1E5460240;
  id v23 = v4;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_18B03F948;
  v20[3] = &unk_1E5461300;
  id v19 = v23;
  id v21 = v19;
  sub_18B03D47C(self, v22, v20);

  os_activity_scope_leave(&state);
}

- (void)fetchAllLongLivedOperationIDsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchAllLongLivedOperationIDsWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);
}

- (void)fetchLongLivedOperationWithID:(CKOperationID)operationID completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = operationID;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchLongLivedOperationWithID_wrappingContainer_completionHandler_(v12, v11, (uint64_t)v7, (uint64_t)self, v6);
}

- (void)getNewWebSharingIdentityDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getNewWebSharingIdentityDataWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);
}

- (void)fetchShareParticipantWithLookupInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_convenienceConfiguration(self, v11, v12, v13);
  objc_msgSend_fetchShareParticipantWithLookupInfo_wrappingContainer_convenienceConfiguration_completionHandler_(v16, v15, (uint64_t)v7, (uint64_t)self, v14, v6);
}

- (void)submitEventMetric:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_submitEventMetric_(v10, v8, (uint64_t)v4, v9);
}

- (void)submitEventMetric:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_submitEventMetric_completionHandler_(v12, v11, (uint64_t)v7, (uint64_t)v6);
}

- (void)setApplicationPermission:(unint64_t)a3 enabled:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  objc_msgSend_implementation(self, v9, v10, v11);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setApplicationPermission_enabled_completionHandler_(v13, v12, a3, v5, v8);
}

- (void)statusGroupsForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  objc_msgSend_implementation(self, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_statusGroupsForApplicationPermission_completionHandler_(v11, v10, a3, (uint64_t)v6);
}

- (void)pushEnvironmentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pushEnvironmentWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);
}

- (void)serverPreferredPushEnvironmentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverPreferredPushEnvironmentWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);
}

- (id)serverPreferredPushEnvironmentWithError:(id *)a3
{
  BOOL v5 = objc_msgSend_implementation(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_serverPreferredPushEnvironmentWithError_(v5, v6, (uint64_t)a3, v7);

  return v8;
}

- (void)wipeAllCachesAndDie
{
  objc_msgSend_implementation(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_wipeAllCachesAndDie(v7, v4, v5, v6);
}

- (void)fetchCurrentDeviceIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchCurrentDeviceIDWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);
}

- (void)fetchSignatureGeneratorForCurrentUserBoundaryKeyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchSignatureGeneratorForCurrentUserBoundaryKeyWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);
}

- (void)fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);
}

- (void)fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);
}

- (void)setFakeError:(id)a3 forNextRequestOfClassName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFakeError_forNextRequestOfClassName_(v12, v11, (uint64_t)v7, (uint64_t)v6);
}

- (void)fetchOrgAdminUserRecordIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchOrgAdminUserRecordIDWithCompletionHandler_(v10, v8, (uint64_t)v4, v9);
}

- (void)registerForAssetUploadRequests:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerForAssetUploadRequests_(v10, v8, (uint64_t)v4, v9);
}

- (void)registerForAssetUploadRequests:(id)a3 machServiceName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerForAssetUploadRequests_machServiceName_(v12, v11, (uint64_t)v7, (uint64_t)v6);
}

- (void)registerForPackageUploadRequests:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerForPackageUploadRequests_(v10, v8, (uint64_t)v4, v9);
}

- (void)registerForPackageUploadRequests:(id)a3 machServiceName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_implementation(self, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerForPackageUploadRequests_machServiceName_(v12, v11, (uint64_t)v7, (uint64_t)v6);
}

- (void)unregisterFromUploadRequests
{
  objc_msgSend_implementation(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterFromUploadRequests(v7, v4, v5, v6);
}

- (void)unregisterFromUploadRequestsWithMachServiceName:(id)a3
{
  id v4 = a3;
  objc_msgSend_implementation(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterFromUploadRequestsWithMachServiceName_(v10, v8, (uint64_t)v4, v9);
}

- (void)manuallyTriggerUploadRequests
{
  objc_msgSend_implementation(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_manuallyTriggerUploadRequests(v7, v4, v5, v6);
}

- (void)cancelUploadRequests
{
  objc_msgSend_implementation(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelUploadRequests(v7, v4, v5, v6);
}

- (void)withUploadManager:(int)a3 performBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  objc_msgSend_implementation(self, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_withUploadManager_performBlock_(v11, v10, v4, (uint64_t)v6);
}

- (id)CKStatusReportArray
{
  uint64_t v4 = objc_msgSend_implementation(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_CKStatusReportArray(v4, v5, v6, v7);

  return v8;
}

- (NSMutableArray)codeServices
{
  return self->_codeServices;
}

- (void)setCodeServices:(id)a3
{
}

- (int)pcsServiceScopedIdentityUpdateToken
{
  return self->_pcsServiceScopedIdentityUpdateToken;
}

- (int)keychainViewScopedIdentityUpdateToken
{
  return self->_keychainViewScopedIdentityUpdateToken;
}

- (int)pcsServiceScopedAccountChangeToken
{
  return self->_pcsServiceScopedAccountChangeToken;
}

- (CKConvenienceConfiguration)convenienceConfiguration
{
  return self->_convenienceConfiguration;
}

- (void)discoverAllContactUserInfosWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v5 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    id v13 = v5;
    uint64_t v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    id v16 = v14;
    _os_log_fault_impl(&dword_18AF10000, v13, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.", buf, 0xCu);

    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v4)
  {
LABEL_5:
    uint64_t v6 = NSStringFromSelector(a2);
    uint64_t v8 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v7, @"CKInternalErrorDomain", 1001, @"%@ is deprecated, and will be removed in a future release.", v6);

    id v12 = objc_msgSend_CKClientSuitableError(v8, v9, v10, v11);
    v4[2](v4, 0, v12);
  }
LABEL_6:
}

- (void)discoverUserInfoWithEmailAddress:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v8 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    id v16 = v8;
    uint64_t v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    id v19 = v17;
    _os_log_fault_impl(&dword_18AF10000, v16, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.", buf, 0xCu);

    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v7)
  {
LABEL_5:
    uint64_t v9 = NSStringFromSelector(a2);
    uint64_t v11 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v10, @"CKInternalErrorDomain", 1001, @"%@ is deprecated, and will be removed in a future release.", v9);

    uint64_t v15 = objc_msgSend_CKClientSuitableError(v11, v12, v13, v14);
    v7[2](v7, 0, v15);
  }
LABEL_6:
}

- (void)discoverUserInfoWithUserRecordID:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v8 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    id v16 = v8;
    uint64_t v17 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    id v19 = v17;
    _os_log_fault_impl(&dword_18AF10000, v16, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.", buf, 0xCu);

    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v7)
  {
LABEL_5:
    uint64_t v9 = NSStringFromSelector(a2);
    uint64_t v11 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v10, @"CKInternalErrorDomain", 1001, @"%@ is deprecated, and will be removed in a future release.", v9);

    uint64_t v15 = objc_msgSend_CKClientSuitableError(v11, v12, v13, v14);
    v7[2](v7, 0, v15);
  }
LABEL_6:
}

@end