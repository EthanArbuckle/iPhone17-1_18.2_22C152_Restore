@interface BRFileProviderShareOperationProxy
- (BRFileProviderShareOperationProxy)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5 clientPrivilegesDescriptor:(id)a6;
- (id)remoteObject;
- (void)copyCurrentUserNameAndDisplayHandleWithReply:(id)a3;
- (void)createSharingInfoForURL:(id)a3 reply:(id)a4;
- (void)startOperation:(id)a3 toCopyDocumentURLForRecordID:(id)a4 syncIfNeeded:(BOOL)a5 reply:(id)a6;
- (void)startOperation:(id)a3 toCopyEtagAtURL:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopyParticipantTokenAtURL:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopyShareInfoAtURL:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopyShareURLForShare:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopySharingAccessToken:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopySharingInfoAtURL:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toCopyShortTokenAtURL:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toLookupShareParticipants:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toModifyRecordAccessAtURL:(id)a4 allowAccess:(BOOL)a5 reply:(id)a6;
- (void)startOperation:(id)a3 toPrepFolderForSharingAt:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toProcessSubitemsAtURL:(id)a4 maxSubsharesFailures:(unint64_t)a5 processType:(unint64_t)a6 reply:(id)a7;
- (void)startOperation:(id)a3 toSaveSharingInfo:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toUnshareShare:(id)a4 forceDelete:(BOOL)a5 reply:(id)a6;
@end

@implementation BRFileProviderShareOperationProxy

- (BRFileProviderShareOperationProxy)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5 clientPrivilegesDescriptor:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRFileProviderShareOperationProxy;
  v12 = [(BaseFileProviderShareOperationProxy *)&v15 initWithItemIdentifier:a4 operationQueue:a5 clientPrivilegesDescriptor:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_fileProviderExtension, a3);
  }

  return v13;
}

- (id)remoteObject
{
  v2 = +[BRDaemonConnection defaultConnection];
  v3 = [v2 remoteObjectProxy];

  v4 = [[BRFileProviderXPCAutomaticErrorProxy alloc] initWithConnection:v3 protocol:&OBJC_PROTOCOL___BRProtocolLegacy orError:0 name:@"daemon connection" requestPid:0];

  return v4;
}

- (void)startOperation:(id)a3 toCopySharingInfoAtURL:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  __brc_create_section();
  id v11 = brc_bread_crumbs();
  v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v24;
    __int16 v29 = 2080;
    v30 = "-[BRFileProviderShareOperationProxy startOperation:toCopySharingInfoAtURL:reply:]";
    __int16 v31 = 2112;
    v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  v13 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v14 = [v13 isSharingProxyEntitled];

  if (v14)
  {
    objc_super v15 = sub_10000CBA4(v8);
    v16 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001D60C;
    v19[3] = &unk_100038A88;
    id v17 = v15;
    id v20 = v17;
    id v21 = v10;
    [v16 startOperation:v17 toCopySharingInfoAtURL:v9 reply:v19];

    v18 = &v20;
  }
  else
  {
    id v17 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001D4E8;
    v22[3] = &unk_100038648;
    id v23 = v10;
    sub_10001D4E8((uint64_t)v22, v17);
    v18 = &v23;
  }

  __brc_leave_section();
}

- (void)createSharingInfoForURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  __brc_create_section();
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v22 = v18;
    __int16 v23 = 2080;
    uint64_t v24 = "-[BRFileProviderShareOperationProxy createSharingInfoForURL:reply:]";
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v10 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v11 = [v10 isSharingProxyEntitled];

  if (v11)
  {
    v12 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001DB0C;
    v14[3] = &unk_100038FF0;
    id v15 = v7;
    [v12 createSharingInfoForURL:v6 reply:v14];

    v13 = v15;
  }
  else
  {
    v13 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001D9F4;
    v16[3] = &unk_100038648;
    id v17 = v7;
    sub_10001D9F4((uint64_t)v16, v13);
  }
  __brc_leave_section();
}

- (void)startOperation:(id)a3 toModifyRecordAccessAtURL:(id)a4 allowAccess:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  __brc_create_section();
  v13 = brc_bread_crumbs();
  unsigned __int8 v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v30 = v26;
    __int16 v31 = 2080;
    v32 = "-[BRFileProviderShareOperationProxy startOperation:toModifyRecordAccessAtURL:allowAccess:reply:]";
    __int16 v33 = 2112;
    v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v15 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v16 = [v15 isSharingProxyEntitled];

  if (v16)
  {
    id v17 = sub_10000CBA4(v10);
    uint64_t v18 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10001E044;
    v21[3] = &unk_100039018;
    id v19 = v17;
    id v22 = v19;
    id v23 = v12;
    [v18 startOperation:v19 toModifyRecordAccessAtURL:v11 allowAccess:v7 reply:v21];

    uint64_t v20 = &v22;
  }
  else
  {
    id v19 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001DF20;
    v24[3] = &unk_100038648;
    id v25 = v12;
    sub_10001DF20((uint64_t)v24, v19);
    uint64_t v20 = &v25;
  }

  __brc_leave_section();
}

- (void)startOperation:(id)a3 toCopyParticipantTokenAtURL:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  __brc_create_section();
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v24;
    __int16 v29 = 2080;
    uint64_t v30 = "-[BRFileProviderShareOperationProxy startOperation:toCopyParticipantTokenAtURL:reply:]";
    __int16 v31 = 2112;
    v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  v13 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v14 = [v13 isSharingPrivateInterfaceEntitled];

  if (v14)
  {
    id v15 = sub_10000CBA4(v8);
    unsigned __int8 v16 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001E598;
    v19[3] = &unk_100039040;
    id v17 = v15;
    id v20 = v17;
    id v21 = v10;
    [v16 startOperation:v17 toCopyParticipantTokenAtURL:v9 reply:v19];

    uint64_t v18 = &v20;
  }
  else
  {
    id v17 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingPrivateInterfaceEntitled" code description];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001E474;
    v22[3] = &unk_100038648;
    id v23 = v10;
    sub_10001E474((uint64_t)v22, v17);
    uint64_t v18 = &v23;
  }

  __brc_leave_section();
}

- (void)startOperation:(id)a3 toPrepFolderForSharingAt:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  __brc_create_section();
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v24;
    __int16 v29 = 2080;
    uint64_t v30 = "-[BRFileProviderShareOperationProxy startOperation:toPrepFolderForSharingAt:reply:]";
    __int16 v31 = 2112;
    v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  v13 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v14 = [v13 isSharingPrivateInterfaceEntitled];

  if (v14)
  {
    id v15 = sub_10000CBA4(v8);
    unsigned __int8 v16 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001EAD4;
    v19[3] = &unk_100038620;
    id v17 = v15;
    id v20 = v17;
    id v21 = v10;
    [v16 startOperation:v17 toPrepFolderForSharingAt:v9 reply:v19];

    uint64_t v18 = &v20;
  }
  else
  {
    id v17 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingPrivateInterfaceEntitled" code description];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001E9C8;
    v22[3] = &unk_100038648;
    id v23 = v10;
    sub_10001E9C8((uint64_t)v22, v17);
    uint64_t v18 = &v23;
  }

  __brc_leave_section();
}

- (void)startOperation:(id)a3 toProcessSubitemsAtURL:(id)a4 maxSubsharesFailures:(unint64_t)a5 processType:(unint64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  __brc_create_section();
  id v15 = brc_bread_crumbs();
  unsigned __int8 v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v32 = v28;
    __int16 v33 = 2080;
    v34 = "-[BRFileProviderShareOperationProxy startOperation:toProcessSubitemsAtURL:maxSubsharesFailures:processType:reply:]";
    __int16 v35 = 2112;
    v36 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v17 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v18 = [v17 isFolderSharingProxyEntitled];

  if (v18)
  {
    id v19 = sub_10000CBA4(v12);
    id v20 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001EFE8;
    v23[3] = &unk_100038620;
    id v21 = v19;
    id v24 = v21;
    id v25 = v14;
    [v20 startOperation:v21 toProcessSubitemsAtURL:v13 maxSubsharesFailures:a5 processType:a6 reply:v23];

    id v22 = &v24;
  }
  else
  {
    id v21 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isFolderSharingProxyEntitled" code description];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10001EEDC;
    v26[3] = &unk_100038648;
    id v27 = v14;
    sub_10001EEDC((uint64_t)v26, v21);
    id v22 = &v27;
  }

  __brc_leave_section();
}

- (void)startOperation:(id)a3 toCopyEtagAtURL:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  __brc_create_section();
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v24;
    __int16 v29 = 2080;
    uint64_t v30 = "-[BRFileProviderShareOperationProxy startOperation:toCopyEtagAtURL:reply:]";
    __int16 v31 = 2112;
    uint64_t v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v13 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v14 = [v13 isSharingPrivateInterfaceEntitled];

  if (v14)
  {
    id v15 = sub_10000CBA4(v8);
    unsigned __int8 v16 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001F4F0;
    v19[3] = &unk_100039068;
    id v17 = v15;
    id v20 = v17;
    id v21 = v10;
    [v16 startOperation:v17 toCopyEtagAtURL:v9 reply:v19];

    unsigned __int8 v18 = &v20;
  }
  else
  {
    id v17 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingPrivateInterfaceEntitled" code description];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001F3D8;
    v22[3] = &unk_100038648;
    id v23 = v10;
    sub_10001F3D8((uint64_t)v22, v17);
    unsigned __int8 v18 = &v23;
  }

  __brc_leave_section();
}

- (void)startOperation:(id)a3 toCopyShareInfoAtURL:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  __brc_create_section();
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v24;
    __int16 v29 = 2080;
    uint64_t v30 = "-[BRFileProviderShareOperationProxy startOperation:toCopyShareInfoAtURL:reply:]";
    __int16 v31 = 2112;
    uint64_t v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v13 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v14 = [v13 isSharingPrivateInterfaceEntitled];

  if (v14)
  {
    id v15 = sub_10000CBA4(v8);
    unsigned __int8 v16 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001FA20;
    v19[3] = &unk_100039040;
    id v17 = v15;
    id v20 = v17;
    id v21 = v10;
    [v16 startOperation:v17 toCopyShareInfoAtURL:v9 reply:v19];

    unsigned __int8 v18 = &v20;
  }
  else
  {
    id v17 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingPrivateInterfaceEntitled" code description];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001F8FC;
    v22[3] = &unk_100038648;
    id v23 = v10;
    sub_10001F8FC((uint64_t)v22, v17);
    unsigned __int8 v18 = &v23;
  }

  __brc_leave_section();
}

- (void)startOperation:(id)a3 toCopySharingAccessToken:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = sub_10000CBA4(a3);
  id v11 = [(BRFileProviderShareOperationProxy *)self remoteObject];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001FC60;
  v14[3] = &unk_100039018;
  id v15 = v10;
  id v16 = v8;
  id v12 = v8;
  id v13 = v10;
  [v11 startOperation:v13 toCopySharingAccessToken:v9 reply:v14];
}

- (void)startOperation:(id)a3 toCopyShortTokenAtURL:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  __brc_create_section();
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v24;
    __int16 v29 = 2080;
    uint64_t v30 = "-[BRFileProviderShareOperationProxy startOperation:toCopyShortTokenAtURL:reply:]";
    __int16 v31 = 2112;
    uint64_t v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v13 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v14 = [v13 isSharingPrivateInterfaceEntitled];

  if (v14)
  {
    id v15 = sub_10000CBA4(v8);
    id v16 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000201A8;
    v19[3] = &unk_100039068;
    id v17 = v15;
    id v20 = v17;
    id v21 = v10;
    [v16 startOperation:v17 toCopyShortTokenAtURL:v9 reply:v19];

    unsigned __int8 v18 = &v20;
  }
  else
  {
    id v17 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingPrivateInterfaceEntitled" code description];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100020090;
    v22[3] = &unk_100038648;
    id v23 = v10;
    sub_100020090((uint64_t)v22, v17);
    unsigned __int8 v18 = &v23;
  }

  __brc_leave_section();
}

- (void)copyCurrentUserNameAndDisplayHandleWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  __brc_create_section();
  v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v19 = v15;
    __int16 v20 = 2080;
    id v21 = "-[BRFileProviderShareOperationProxy copyCurrentUserNameAndDisplayHandleWithReply:]";
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  BOOL v7 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v8 = [v7 isSharingProxyEntitled];

  if (v8)
  {
    id v9 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100020694;
    v11[3] = &unk_100038AB0;
    id v12 = v4;
    [v9 copyCurrentUserNameAndDisplayHandleWithReply:v11];

    id v10 = v12;
  }
  else
  {
    id v10 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100020558;
    v13[3] = &unk_100038648;
    id v14 = v4;
    sub_100020558((uint64_t)v13, v10);
  }
  __brc_leave_section();
}

- (void)startOperation:(id)a3 toCopyDocumentURLForRecordID:(id)a4 syncIfNeeded:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  __brc_create_section();
  id v13 = brc_bread_crumbs();
  id v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v30 = v26;
    __int16 v31 = 2080;
    uint64_t v32 = "-[BRFileProviderShareOperationProxy startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]";
    __int16 v33 = 2112;
    v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  uint64_t v15 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v16 = [v15 isSharingPrivateInterfaceEntitled];

  if (v16)
  {
    uint64_t v17 = sub_10000CBA4(v10);
    unsigned __int8 v18 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100020C24;
    v21[3] = &unk_100038B00;
    id v19 = v17;
    id v22 = v19;
    id v23 = v12;
    [v18 startOperation:v19 toCopyDocumentURLForRecordID:v11 syncIfNeeded:v7 reply:v21];

    __int16 v20 = &v22;
  }
  else
  {
    id v19 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingPrivateInterfaceEntitled" code description];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100020B0C;
    v24[3] = &unk_100038648;
    id v25 = v12;
    sub_100020B0C((uint64_t)v24, v19);
    __int16 v20 = &v25;
  }

  __brc_leave_section();
}

- (void)startOperation:(id)a3 toCopyShareURLForShare:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  __brc_create_section();
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v24;
    __int16 v29 = 2080;
    uint64_t v30 = "-[BRFileProviderShareOperationProxy startOperation:toCopyShareURLForShare:reply:]";
    __int16 v31 = 2112;
    uint64_t v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v13 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v14 = [v13 isSharingProxyEntitled];

  if (v14)
  {
    uint64_t v15 = sub_10000CBA4(v8);
    unsigned __int8 v16 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100021154;
    v19[3] = &unk_100038A88;
    id v17 = v15;
    id v20 = v17;
    id v21 = v10;
    [v16 startOperation:v17 toCopyShareURLForShare:v9 reply:v19];

    unsigned __int8 v18 = &v20;
  }
  else
  {
    id v17 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100021030;
    v22[3] = &unk_100038648;
    id v23 = v10;
    sub_100021030((uint64_t)v22, v17);
    unsigned __int8 v18 = &v23;
  }

  __brc_leave_section();
}

- (void)startOperation:(id)a3 toLookupShareParticipants:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  __brc_create_section();
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v24;
    __int16 v29 = 2080;
    uint64_t v30 = "-[BRFileProviderShareOperationProxy startOperation:toLookupShareParticipants:reply:]";
    __int16 v31 = 2112;
    uint64_t v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v13 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v14 = [v13 isSharingProxyEntitled];

  if (v14)
  {
    uint64_t v15 = sub_10000CBA4(v8);
    unsigned __int8 v16 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002169C;
    v19[3] = &unk_100038AD8;
    id v17 = v15;
    id v20 = v17;
    id v21 = v10;
    [v16 startOperation:v17 toLookupShareParticipants:v9 reply:v19];

    unsigned __int8 v18 = &v20;
  }
  else
  {
    id v17 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100021584;
    v22[3] = &unk_100038648;
    id v23 = v10;
    sub_100021584((uint64_t)v22, v17);
    unsigned __int8 v18 = &v23;
  }

  __brc_leave_section();
}

- (void)startOperation:(id)a3 toSaveSharingInfo:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  __brc_create_section();
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v24;
    __int16 v29 = 2080;
    uint64_t v30 = "-[BRFileProviderShareOperationProxy startOperation:toSaveSharingInfo:reply:]";
    __int16 v31 = 2112;
    uint64_t v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v13 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v14 = [v13 isSharingProxyEntitled];

  if (v14)
  {
    uint64_t v15 = sub_10000CBA4(v8);
    unsigned __int8 v16 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100021BC0;
    v19[3] = &unk_100038830;
    id v17 = v15;
    id v20 = v17;
    id v21 = v10;
    [v16 startOperation:v17 toSaveSharingInfo:v9 reply:v19];

    unsigned __int8 v18 = &v20;
  }
  else
  {
    id v17 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100021AA8;
    v22[3] = &unk_100038648;
    id v23 = v10;
    sub_100021AA8((uint64_t)v22, v17);
    unsigned __int8 v18 = &v23;
  }

  __brc_leave_section();
}

- (void)startOperation:(id)a3 toUnshareShare:(id)a4 forceDelete:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  __brc_create_section();
  id v13 = brc_bread_crumbs();
  unsigned __int8 v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v42 = v38;
    __int16 v43 = 2080;
    v44 = "-[BRFileProviderShareOperationProxy startOperation:toUnshareShare:forceDelete:reply:]";
    __int16 v45 = 2112;
    v46 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  uint64_t v15 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v16 = [v15 isSharingProxyEntitled];

  if ((v16 & 1) == 0)
  {
    id v26 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000221A8;
    v36[3] = &unk_100038648;
    id v37 = v12;
    sub_1000221A8((uint64_t)v36, v26);
    uint64_t v27 = &v37;
    goto LABEL_12;
  }
  id v17 = [v11 objectForKeyedSubscript:CKShareTypeKey];
  unsigned int v18 = [v17 isEqual:BRSharedFolderType];

  if (!v18) {
    goto LABEL_10;
  }
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  __brc_create_section();
  id v19 = brc_bread_crumbs();
  id v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v42 = v33;
    __int16 v43 = 2080;
    v44 = "-[BRFileProviderShareOperationProxy startOperation:toUnshareShare:forceDelete:reply:]";
    __int16 v45 = 2112;
    v46 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v21 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v22 = [v21 isFolderSharingProxyEntitled];

  if ((v22 & 1) == 0)
  {
    id v23 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isFolderSharingProxyEntitled" code description];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000222B4;
    v31[3] = &unk_100038648;
    id v32 = v12;
    sub_1000222B4((uint64_t)v31, v23);
  }
  __brc_leave_section();
  if (v22)
  {
LABEL_10:
    uint64_t v24 = sub_10000CBA4(v10);
    uint64_t v25 = [(BRFileProviderShareOperationProxy *)self remoteObject];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000223C0;
    v28[3] = &unk_100038620;
    id v26 = v24;
    id v29 = v26;
    id v30 = v12;
    [v25 startOperation:v26 toUnshareShare:v11 forceDelete:v7 reply:v28];

    uint64_t v27 = &v29;
LABEL_12:
  }
  __brc_leave_section();
}

- (void).cxx_destruct
{
}

@end