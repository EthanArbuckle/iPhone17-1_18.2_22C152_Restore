@interface ICDFileProviderItemServiceProxy
- (BOOL)_hasAccessToAppLibraryID:(id)a3;
- (BOOL)_isAppLibraryProxyEntitled;
- (BOOL)_isSandboxed;
- (BRCClientPrivilegesDescriptor)clientPrivilegesDescriptor;
- (ICDFileProviderItemServiceProxy)initWithItemIdentifier:(id)a3 domainIdentifier:(id)a4 operationQueue:(id)a5 clientPrivilegesDescriptor:(id)a6;
- (NSOperationQueue)operationQueue;
- (NSString)domainIdentifier;
- (NSString)itemIdentifier;
- (id)remoteObject;
- (void)boostFilePresenter:(id)a3;
- (void)capabilityWhenTryingToReparentToNewParent:(id)a3 domain:(id)a4 reply:(id)a5;
- (void)copyShareIDWithReply:(id)a3;
- (void)getAttributeValues:(id)a3 reply:(id)a4;
- (void)getBookmarkData:(BOOL)a3 allowAccessByBundleID:(id)a4 documentID:(id)a5 isDirectory:(BOOL)a6 reply:(id)a7;
- (void)getClientSaltingVerificationKeys:(id)a3;
- (void)getCreatorNameComponents:(id)a3;
- (void)getPublishedURLForStreaming:(BOOL)a3 requestedTTL:(unint64_t)a4 reply:(id)a5;
- (void)getServerContentSignature:(id)a3;
- (void)getServerSaltingKeys:(id)a3;
- (void)getiWorkNeedsShareMigrate:(id)a3;
- (void)getiWorkPublishingBadgingStatus:(id)a3;
- (void)getiWorkPublishingInfo:(id)a3;
- (void)launchItemCountMismatchChecks:(id)a3;
- (void)refreshSharingState:(id)a3;
- (void)setClientPrivilegesDescriptor:(id)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setiWorkPublishingInfo:(BOOL)a3 readonly:(BOOL)a4 reply:(id)a5;
- (void)unboostFilePresenter:(id)a3;
@end

@implementation ICDFileProviderItemServiceProxy

- (ICDFileProviderItemServiceProxy)initWithItemIdentifier:(id)a3 domainIdentifier:(id)a4 operationQueue:(id)a5 clientPrivilegesDescriptor:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICDFileProviderItemServiceProxy;
  v15 = [(ICDFileProviderItemServiceProxy *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_itemIdentifier, a3);
    objc_storeStrong((id *)&v16->_domainIdentifier, a4);
    objc_storeStrong((id *)&v16->_operationQueue, a5);
    objc_storeStrong((id *)&v16->_clientPrivilegesDescriptor, a6);
  }

  return v16;
}

- (id)remoteObject
{
  v2 = [ICDFileProviderXPCAutomaticErrorProxy alloc];
  v3 = +[BRDaemonConnection defaultConnection];
  v4 = [(ICDFileProviderXPCAutomaticErrorProxy *)v2 initWithConnection:v3 protocol:&OBJC_PROTOCOL___BRProtocolFPFS orError:0 name:@"daemon connection" requestPid:0];

  return v4;
}

- (BOOL)_isAppLibraryProxyEntitled
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned __int8 v3 = [(BRCClientPrivilegesDescriptor *)v2->_clientPrivilegesDescriptor isProxyEntitled];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_isSandboxed
{
  return 1;
}

- (BOOL)_hasAccessToAppLibraryID:(id)a3
{
  id v4 = a3;
  if ([(ICDFileProviderItemServiceProxy *)self _isAppLibraryProxyEntitled]
    || ![(ICDFileProviderItemServiceProxy *)self _isSandboxed])
  {
    BOOL v8 = 1;
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = [(BRCClientPrivilegesDescriptor *)v5->_clientPrivilegesDescriptor appLibraryIDs];
    objc_sync_exit(v5);

    if (![v6 count]
      || v4 && ![v6 containsObject:v4]
      || (clientPrivilegesDescriptor = v5->_clientPrivilegesDescriptor,
          BOOL v8 = 1,
          [(BRCClientPrivilegesDescriptor *)clientPrivilegesDescriptor cloudEnabledStatusWithHasSession:1] != 1))
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (void)boostFilePresenter:(id)a3
{
  id v4 = a3;
  v5 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
  v6 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100026FD8;
  v8[3] = &unk_1000445C0;
  id v9 = v4;
  id v7 = v4;
  [v5 boostFilePresenterForItemIdentifier:v6 reply:v8];
}

- (void)unboostFilePresenter:(id)a3
{
  id v4 = a3;
  v5 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
  v6 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
  id v11 = v6;
  id v7 = +[NSArray arrayWithObjects:&v11 count:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100027200;
  v9[3] = &unk_1000445C0;
  id v10 = v4;
  id v8 = v4;
  [v5 unboostFilePresenterForItemIdentifiers:v7 reply:v9];
}

- (void)capabilityWhenTryingToReparentToNewParent:(id)a3 domain:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(ICDFileProviderItemServiceProxy *)self domainIdentifier];
  unsigned __int8 v12 = [v11 isEqual:v10];

  if (v12)
  {
    id v13 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
    id v14 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100027534;
    v19[3] = &unk_100045430;
    id v20 = v9;
    [v13 capabilityWhenTryingToReparentItemIdentifier:v14 toNewParent:v8 reply:v19];

    v15 = v20;
  }
  else
  {
    v16 = brc_bread_crumbs();
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_super v18 = +[NSError brc_errorAccountMismatch];
      *(_DWORD *)buf = 136315906;
      v22 = "-[ICDFileProviderItemServiceProxy capabilityWhenTryingToReparentToNewParent:domain:reply:]";
      __int16 v23 = 1024;
      int v24 = 4;
      __int16 v25 = 2112;
      v26 = v18;
      __int16 v27 = 2112;
      v28 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%d, %@)%@", buf, 0x26u);
    }
    v15 = +[NSError brc_errorAccountMismatch];
    (*((void (**)(id, uint64_t, void *))v9 + 2))(v9, 4, v15);
  }
}

- (void)getBookmarkData:(BOOL)a3 allowAccessByBundleID:(id)a4 documentID:(id)a5 isDirectory:(BOOL)a6 reply:(id)a7
{
  BOOL v7 = a6;
  BOOL v10 = a3;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  v15 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
  v16 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100027768;
  v18[3] = &unk_100045458;
  id v19 = v12;
  id v17 = v12;
  [v15 getBookmarkDataForItemIdentifier:v16 onlyAllowItemKnowByServer:v10 allowAccessByBundleID:v14 documentID:v13 isDirectory:v7 reply:v18];
}

- (void)getPublishedURLForStreaming:(BOOL)a3 requestedTTL:(unint64_t)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
  BOOL v10 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100027998;
  v12[3] = &unk_100045480;
  id v13 = v8;
  id v11 = v8;
  [v9 getPublishedURLForItemIdentifier:v10 forStreaming:v6 requestedTTL:a4 reply:v12];
}

- (void)getAttributeValues:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
  id v9 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100027BC4;
  v11[3] = &unk_1000454A8;
  id v12 = v6;
  id v10 = v6;
  [v8 getAttributeValues:v7 forItemIdentifier:v9 reply:v11];
}

- (void)getiWorkPublishingInfo:(id)a3
{
  id v4 = a3;
  v5 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
  id v6 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027DB8;
  v8[3] = &unk_1000454D0;
  id v9 = v4;
  id v7 = v4;
  [v5 getiWorkPublishingInfoForItemIdentifier:v6 reply:v8];
}

- (void)setiWorkPublishingInfo:(BOOL)a3 readonly:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
  id v10 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100027FF0;
  v12[3] = &unk_1000445C0;
  id v13 = v8;
  id v11 = v8;
  [v9 setiWorkPublishingInfoForItemIdentifier:v10 isForPublish:v6 readonly:v5 reply:v12];
}

- (void)getiWorkPublishingBadgingStatus:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
  BOOL v6 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000281C8;
  v8[3] = &unk_1000454F8;
  id v9 = v4;
  id v7 = v4;
  [v5 getiWorkPublishingBadgingStatusForItemIdentifier:v6 reply:v8];
}

- (void)getiWorkNeedsShareMigrate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
  BOOL v6 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000283B4;
  v8[3] = &unk_100045520;
  id v9 = v4;
  id v7 = v4;
  [v5 getiWorkNeedsShareMigrateForItemIdentifier:v6 reply:v8];
}

- (void)refreshSharingState:(id)a3
{
  id v4 = a3;
  memset(v16, 0, sizeof(v16));
  sub_10001E454(1, (uint64_t)"-[ICDFileProviderItemServiceProxy refreshSharingState:]", 173, v16);
  BOOL v5 = brc_bread_crumbs();
  BOOL v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v18 = v16[0];
    __int16 v19 = 2080;
    id v20 = "-[ICDFileProviderItemServiceProxy refreshSharingState:]";
    __int16 v21 = 2112;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v7 = [(ICDFileProviderItemServiceProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v8 = [v7 isAutomationEntitled];

  if (v8)
  {
    id v9 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
    id v10 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100028880;
    v12[3] = &unk_1000445C0;
    id v13 = v4;
    [v9 refreshSharingStateForItemIdentifier:v10 reply:v12];

    id v11 = v13;
  }
  else
  {
    id v11 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isAutomationEntitled" code description];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100028774;
    v14[3] = &unk_1000445C0;
    id v15 = v4;
    sub_100028774((uint64_t)v14, v11);
  }
  sub_10001E628(v16);
}

- (void)launchItemCountMismatchChecks:(id)a3
{
  id v4 = a3;
  memset(v16, 0, sizeof(v16));
  sub_10001E454(1, (uint64_t)"-[ICDFileProviderItemServiceProxy launchItemCountMismatchChecks:]", 184, v16);
  BOOL v5 = brc_bread_crumbs();
  BOOL v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v18 = v16[0];
    __int16 v19 = 2080;
    id v20 = "-[ICDFileProviderItemServiceProxy launchItemCountMismatchChecks:]";
    __int16 v21 = 2112;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v7 = [(ICDFileProviderItemServiceProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v8 = [v7 isAutomationEntitled];

  if (v8)
  {
    id v9 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
    id v10 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100028D48;
    v12[3] = &unk_100045520;
    id v13 = v4;
    [v9 launchItemCountMismatchChecksForItemIdentifier:v10 reply:v12];

    id v11 = v13;
  }
  else
  {
    id v11 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isAutomationEntitled" code description];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100028C2C;
    v14[3] = &unk_1000445C0;
    id v15 = v4;
    sub_100028C2C((uint64_t)v14, v11);
  }
  sub_10001E628(v16);
}

- (void)copyShareIDWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
  BOOL v6 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100028F34;
  v8[3] = &unk_100045548;
  id v9 = v4;
  id v7 = v4;
  [v5 copyShareIDForItemIdentifier:v6 reply:v8];
}

- (void)getCreatorNameComponents:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
  BOOL v6 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100029128;
  v8[3] = &unk_100045570;
  id v9 = v4;
  id v7 = v4;
  [v5 getCreatorNameComponentsForItemIdentifier:v6 reply:v8];
}

- (void)getClientSaltingVerificationKeys:(id)a3
{
  id v4 = a3;
  memset(v13, 0, sizeof(v13));
  sub_10001E454(1, (uint64_t)"-[ICDFileProviderItemServiceProxy getClientSaltingVerificationKeys:]", 209, v13);
  BOOL v5 = brc_bread_crumbs();
  BOOL v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v15 = v13[0];
    __int16 v16 = 2080;
    id v17 = "-[ICDFileProviderItemServiceProxy getClientSaltingVerificationKeys:]";
    __int16 v18 = 2112;
    __int16 v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v7 = [(ICDFileProviderItemServiceProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v8 = [v7 isAutomationEntitled];

  if (v8)
  {
    id v9 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
    id v10 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
    [v9 getClientSaltingVerificationKeysAtItemIdentifier:v10 reply:v4];
  }
  else
  {
    id v9 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isAutomationEntitled" code description];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100029498;
    v11[3] = &unk_1000445C0;
    id v12 = v4;
    sub_100029498((uint64_t)v11, v9);
    id v10 = v12;
  }

  sub_10001E628(v13);
}

- (void)getServerSaltingKeys:(id)a3
{
  id v4 = a3;
  memset(v13, 0, sizeof(v13));
  sub_10001E454(1, (uint64_t)"-[ICDFileProviderItemServiceProxy getServerSaltingKeys:]", 218, v13);
  BOOL v5 = brc_bread_crumbs();
  BOOL v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v15 = v13[0];
    __int16 v16 = 2080;
    id v17 = "-[ICDFileProviderItemServiceProxy getServerSaltingKeys:]";
    __int16 v18 = 2112;
    __int16 v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v7 = [(ICDFileProviderItemServiceProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v8 = [v7 isAutomationEntitled];

  if (v8)
  {
    id v9 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
    id v10 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
    [v9 getServerSaltingKeysAtItemIdentifier:v10 reply:v4];
  }
  else
  {
    id v9 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isAutomationEntitled" code description];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100029820;
    v11[3] = &unk_1000445C0;
    id v12 = v4;
    sub_100029820((uint64_t)v11, v9);
    id v10 = v12;
  }

  sub_10001E628(v13);
}

- (void)getServerContentSignature:(id)a3
{
  id v4 = a3;
  memset(v13, 0, sizeof(v13));
  sub_10001E454(1, (uint64_t)"-[ICDFileProviderItemServiceProxy getServerContentSignature:]", 227, v13);
  BOOL v5 = brc_bread_crumbs();
  BOOL v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v15 = v13[0];
    __int16 v16 = 2080;
    id v17 = "-[ICDFileProviderItemServiceProxy getServerContentSignature:]";
    __int16 v18 = 2112;
    __int16 v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v7 = [(ICDFileProviderItemServiceProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v8 = [v7 isAutomationEntitled];

  if (v8)
  {
    id v9 = [(ICDFileProviderItemServiceProxy *)self remoteObject];
    id v10 = [(ICDFileProviderItemServiceProxy *)self itemIdentifier];
    [v9 getServerContentSignatureAtItemIdentifier:v10 reply:v4];
  }
  else
  {
    id v9 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isAutomationEntitled" code description];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100029BA8;
    v11[3] = &unk_1000445C0;
    id v12 = v4;
    sub_100029BA8((uint64_t)v11, v9);
    id v10 = v12;
  }

  sub_10001E628(v13);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (BRCClientPrivilegesDescriptor)clientPrivilegesDescriptor
{
  return self->_clientPrivilegesDescriptor;
}

- (void)setClientPrivilegesDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientPrivilegesDescriptor, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end