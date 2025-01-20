@interface ICDFileProviderShareOperationProxy
- (ICDFileProviderShareOperationProxy)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5 clientPrivilegesDescriptor:(id)a6;
- (id)remoteObject;
- (void)createSharingInfoWithReply:(id)a3;
- (void)startOperation:(id)a3 toCopyParticipantTokenWithReply:(id)a4;
- (void)startOperation:(id)a3 toCopySharingAccessTokenWithReply:(id)a4;
- (void)startOperation:(id)a3 toCopySharingInfoWithReply:(id)a4;
- (void)startOperation:(id)a3 toCopyShortTokenWithReply:(id)a4;
- (void)startOperation:(id)a3 toModifyRecordWithAllowAccess:(BOOL)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toPrepFolderForSharingWithReply:(id)a4;
- (void)startOperation:(id)a3 toProcessSubitemsWithMaxSubsharesFailures:(unint64_t)a4 processType:(unint64_t)a5 reply:(id)a6;
@end

@implementation ICDFileProviderShareOperationProxy

- (ICDFileProviderShareOperationProxy)initWithFileProviderExtension:(id)a3 itemIdentifier:(id)a4 operationQueue:(id)a5 clientPrivilegesDescriptor:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICDFileProviderShareOperationProxy;
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

  v4 = [[BRFileProviderXPCAutomaticErrorProxy alloc] initWithConnection:v3 protocol:&OBJC_PROTOCOL___BRProtocolFPFS orError:0 name:@"daemon connection" requestPid:0];

  return v4;
}

- (void)startOperation:(id)a3 toCopySharingInfoWithReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  memset(v22, 0, sizeof(v22));
  sub_100004FB8(1, (uint64_t)"-[ICDFileProviderShareOperationProxy startOperation:toCopySharingInfoWithReply:]", 49, v22);
  v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v24 = v22[0];
    __int16 v25 = 2080;
    v26 = "-[ICDFileProviderShareOperationProxy startOperation:toCopySharingInfoWithReply:]";
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  v10 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v11 = [v10 isSharingProxyEntitled];

  if (v11)
  {
    v12 = sub_1000146D4(v6);
    v13 = [(ICDFileProviderShareOperationProxy *)self remoteObject];
    v14 = [(BaseFileProviderShareOperationProxy *)self itemIdentifier];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002047C;
    v17[3] = &unk_100044D38;
    id v15 = v12;
    id v18 = v15;
    id v19 = v7;
    [v13 startOperation:v15 toCopySharingInfoWithItemID:v14 reply:v17];

    v16 = &v18;
  }
  else
  {
    id v15 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100020358;
    v20[3] = &unk_1000445C0;
    id v21 = v7;
    sub_100020358((uint64_t)v20, v15);
    v16 = &v21;
  }

  sub_1000049CC(v22);
}

- (void)startOperation:(id)a3 toCopySharingAccessTokenWithReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  memset(v22, 0, sizeof(v22));
  sub_100004FB8(1, (uint64_t)"-[ICDFileProviderShareOperationProxy startOperation:toCopySharingAccessTokenWithReply:]", 62, v22);
  v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v24 = v22[0];
    __int16 v25 = 2080;
    v26 = "-[ICDFileProviderShareOperationProxy startOperation:toCopySharingAccessTokenWithReply:]";
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  v10 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v11 = [v10 isSharingProxyEntitled];

  if (v11)
  {
    v12 = sub_1000146D4(v6);
    v13 = [(ICDFileProviderShareOperationProxy *)self remoteObject];
    v14 = [(BaseFileProviderShareOperationProxy *)self itemIdentifier];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000209D4;
    v17[3] = &unk_100045188;
    id v15 = v12;
    id v18 = v15;
    id v19 = v7;
    [v13 startOperation:v15 toCopySharingAccessTokenOfItemID:v14 reply:v17];

    v16 = &v18;
  }
  else
  {
    id v15 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000208B0;
    v20[3] = &unk_1000445C0;
    id v21 = v7;
    sub_1000208B0((uint64_t)v20, v15);
    v16 = &v21;
  }

  sub_1000049CC(v22);
}

- (void)startOperation:(id)a3 toCopyShortTokenWithReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  memset(v22, 0, sizeof(v22));
  sub_100004FB8(1, (uint64_t)"-[ICDFileProviderShareOperationProxy startOperation:toCopyShortTokenWithReply:]", 73, v22);
  v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v24 = v22[0];
    __int16 v25 = 2080;
    v26 = "-[ICDFileProviderShareOperationProxy startOperation:toCopyShortTokenWithReply:]";
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  v10 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v11 = [v10 isSharingProxyEntitled];

  if (v11)
  {
    v12 = sub_1000146D4(v6);
    v13 = [(ICDFileProviderShareOperationProxy *)self remoteObject];
    v14 = [(BaseFileProviderShareOperationProxy *)self itemIdentifier];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100020F20;
    v17[3] = &unk_1000451B0;
    id v15 = v12;
    id v18 = v15;
    id v19 = v7;
    [v13 startOperation:v15 toCopyShortTokenOfItemID:v14 reply:v17];

    v16 = &v18;
  }
  else
  {
    id v15 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100020E08;
    v20[3] = &unk_1000445C0;
    id v21 = v7;
    sub_100020E08((uint64_t)v20, v15);
    v16 = &v21;
  }

  sub_1000049CC(v22);
}

- (void)createSharingInfoWithReply:(id)a3
{
  id v4 = a3;
  memset(v16, 0, sizeof(v16));
  sub_100004FB8(1, (uint64_t)"-[ICDFileProviderShareOperationProxy createSharingInfoWithReply:]", 84, v16);
  v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v18 = v16[0];
    __int16 v19 = 2080;
    v20 = "-[ICDFileProviderShareOperationProxy createSharingInfoWithReply:]";
    __int16 v21 = 2112;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  id v7 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v8 = [v7 isSharingProxyEntitled];

  if (v8)
  {
    v9 = [(ICDFileProviderShareOperationProxy *)self remoteObject];
    v10 = [(BaseFileProviderShareOperationProxy *)self itemIdentifier];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100021400;
    v12[3] = &unk_1000451D8;
    id v13 = v4;
    [v9 createSharingInfoForItemID:v10 reply:v12];

    unsigned __int8 v11 = v13;
  }
  else
  {
    unsigned __int8 v11 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000212E8;
    v14[3] = &unk_1000445C0;
    id v15 = v4;
    sub_1000212E8((uint64_t)v14, v11);
  }
  sub_1000049CC(v16);
}

- (void)startOperation:(id)a3 toModifyRecordWithAllowAccess:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  memset(v24, 0, sizeof(v24));
  sub_100004FB8(1, (uint64_t)"-[ICDFileProviderShareOperationProxy startOperation:toModifyRecordWithAllowAccess:reply:]", 93, v24);
  v10 = brc_bread_crumbs();
  unsigned __int8 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v26 = v24[0];
    __int16 v27 = 2080;
    v28 = "-[ICDFileProviderShareOperationProxy startOperation:toModifyRecordWithAllowAccess:reply:]";
    __int16 v29 = 2112;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  v12 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v13 = [v12 isSharingProxyEntitled];

  if (v13)
  {
    v14 = sub_1000146D4(v8);
    id v15 = [(ICDFileProviderShareOperationProxy *)self remoteObject];
    v16 = [(BaseFileProviderShareOperationProxy *)self itemIdentifier];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002193C;
    v19[3] = &unk_100045188;
    id v17 = v14;
    id v20 = v17;
    id v21 = v9;
    [v15 startOperation:v17 toModifyRecordAccessWithItemID:v16 allowAccess:v6 reply:v19];

    uint64_t v18 = &v20;
  }
  else
  {
    id v17 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100021818;
    uint64_t v22[3] = &unk_1000445C0;
    id v23 = v9;
    sub_100021818((uint64_t)v22, v17);
    uint64_t v18 = &v23;
  }

  sub_1000049CC(v24);
}

- (void)startOperation:(id)a3 toCopyParticipantTokenWithReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  memset(v22, 0, sizeof(v22));
  sub_100004FB8(1, (uint64_t)"-[ICDFileProviderShareOperationProxy startOperation:toCopyParticipantTokenWithReply:]", 104, v22);
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v24 = v22[0];
    __int16 v25 = 2080;
    uint64_t v26 = "-[ICDFileProviderShareOperationProxy startOperation:toCopyParticipantTokenWithReply:]";
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  v10 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v11 = [v10 isSharingPrivateInterfaceEntitled];

  if (v11)
  {
    v12 = sub_1000146D4(v6);
    unsigned __int8 v13 = [(ICDFileProviderShareOperationProxy *)self remoteObject];
    v14 = [(BaseFileProviderShareOperationProxy *)self itemIdentifier];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100021E94;
    v17[3] = &unk_100045200;
    id v15 = v12;
    id v18 = v15;
    id v19 = v7;
    [v13 startOperation:v15 toCopyParticipantTokenWithItemID:v14 reply:v17];

    v16 = &v18;
  }
  else
  {
    id v15 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingPrivateInterfaceEntitled" code description];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100021D70;
    v20[3] = &unk_1000445C0;
    id v21 = v7;
    sub_100021D70((uint64_t)v20, v15);
    v16 = &v21;
  }

  sub_1000049CC(v22);
}

- (void)startOperation:(id)a3 toPrepFolderForSharingWithReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  memset(v22, 0, sizeof(v22));
  sub_100004FB8(1, (uint64_t)"-[ICDFileProviderShareOperationProxy startOperation:toPrepFolderForSharingWithReply:]", 115, v22);
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v24 = v22[0];
    __int16 v25 = 2080;
    uint64_t v26 = "-[ICDFileProviderShareOperationProxy startOperation:toPrepFolderForSharingWithReply:]";
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  v10 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v11 = [v10 isSharingPrivateInterfaceEntitled];

  if (v11)
  {
    v12 = sub_1000146D4(v6);
    unsigned __int8 v13 = [(ICDFileProviderShareOperationProxy *)self remoteObject];
    v14 = [(BaseFileProviderShareOperationProxy *)self itemIdentifier];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000223D4;
    v17[3] = &unk_1000448A8;
    id v15 = v12;
    id v18 = v15;
    id v19 = v7;
    [v13 startOperation:v15 toPrepFolderForSharingWithItemID:v14 reply:v17];

    v16 = &v18;
  }
  else
  {
    id v15 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingPrivateInterfaceEntitled" code description];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000222C8;
    v20[3] = &unk_1000445C0;
    id v21 = v7;
    sub_1000222C8((uint64_t)v20, v15);
    v16 = &v21;
  }

  sub_1000049CC(v22);
}

- (void)startOperation:(id)a3 toProcessSubitemsWithMaxSubsharesFailures:(unint64_t)a4 processType:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  memset(v26, 0, sizeof(v26));
  sub_100004FB8(1, (uint64_t)"-[ICDFileProviderShareOperationProxy startOperation:toProcessSubitemsWithMaxSubsharesFailures:processType:reply:]", 127, v26);
  v12 = brc_bread_crumbs();
  unsigned __int8 v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v26[0];
    __int16 v29 = 2080;
    v30 = "-[ICDFileProviderShareOperationProxy startOperation:toProcessSubitemsWithMaxSubsharesFailures:processType:reply:]";
    __int16 v31 = 2112;
    v32 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  v14 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v15 = [v14 isFolderSharingProxyEntitled];

  if (v15)
  {
    v16 = sub_1000146D4(v10);
    id v17 = [(ICDFileProviderShareOperationProxy *)self remoteObject];
    id v18 = [(BaseFileProviderShareOperationProxy *)self itemIdentifier];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000228EC;
    v21[3] = &unk_1000448A8;
    id v19 = v16;
    id v22 = v19;
    id v23 = v11;
    [v17 startOperation:v19 toProcessSubitemsWithItemID:v18 maxSubsharesFailures:a4 processType:a5 reply:v21];

    id v20 = &v22;
  }
  else
  {
    id v19 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isFolderSharingProxyEntitled" code description];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000227E0;
    uint64_t v24[3] = &unk_1000445C0;
    id v25 = v11;
    sub_1000227E0((uint64_t)v24, v19);
    id v20 = &v25;
  }

  sub_1000049CC(v26);
}

- (void).cxx_destruct
{
}

@end