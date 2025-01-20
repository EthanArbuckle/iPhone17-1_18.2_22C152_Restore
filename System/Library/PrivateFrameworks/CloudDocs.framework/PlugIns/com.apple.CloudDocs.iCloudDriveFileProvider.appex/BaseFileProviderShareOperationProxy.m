@interface BaseFileProviderShareOperationProxy
- (BRCClientPrivilegesDescriptor)clientPrivilegesDescriptor;
- (BaseFileProviderShareOperationProxy)initWithItemIdentifier:(id)a3 operationQueue:(id)a4 clientPrivilegesDescriptor:(id)a5;
- (NSOperationQueue)operationQueue;
- (NSString)itemIdentifier;
- (id)remoteObject;
- (void)copyCurrentUserNameAndDisplayHandleWithReply:(id)a3;
- (void)setClientPrivilegesDescriptor:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)startOperation:(id)a3 toCopyDocumentURLForRecordID:(id)a4 syncIfNeeded:(BOOL)a5 reply:(id)a6;
- (void)startOperation:(id)a3 toCopyShareURLForShare:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toLookupShareParticipants:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toSaveSharingInfo:(id)a4 reply:(id)a5;
- (void)startOperation:(id)a3 toUnshareShare:(id)a4 forceDelete:(BOOL)a5 reply:(id)a6;
@end

@implementation BaseFileProviderShareOperationProxy

- (BaseFileProviderShareOperationProxy)initWithItemIdentifier:(id)a3 operationQueue:(id)a4 clientPrivilegesDescriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BaseFileProviderShareOperationProxy;
  v12 = [(BaseFileProviderShareOperationProxy *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemIdentifier, a3);
    objc_storeStrong((id *)&v13->_operationQueue, a4);
    objc_storeStrong((id *)&v13->_clientPrivilegesDescriptor, a5);
  }

  return v13;
}

- (id)remoteObject
{
  v2 = +[BRDaemonConnection defaultConnection];
  v3 = [v2 remoteObjectProxy];

  v4 = [[BRFileProviderXPCAutomaticErrorProxy alloc] initWithConnection:v3 protocol:&OBJC_PROTOCOL___BRProtocolShared orError:0 name:@"daemon connection" requestPid:0];

  return v4;
}

- (void)startOperation:(id)a3 toCopyShareURLForShare:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v24, 0, sizeof(v24));
  sub_100004FB8(1, (uint64_t)"-[BaseFileProviderShareOperationProxy startOperation:toCopyShareURLForShare:reply:]", 115, v24);
  id v11 = brc_bread_crumbs();
  v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v26 = v24[0];
    __int16 v27 = 2080;
    v28 = "-[BaseFileProviderShareOperationProxy startOperation:toCopyShareURLForShare:reply:]";
    __int16 v29 = 2112;
    v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  v13 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v14 = [v13 isSharingProxyEntitled];

  if (v14)
  {
    objc_super v15 = sub_1000146D4(v8);
    v16 = [(BaseFileProviderShareOperationProxy *)self remoteObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100014C78;
    v19[3] = &unk_100044D38;
    id v17 = v15;
    id v20 = v17;
    id v21 = v10;
    [v16 startOperation:v17 toCopyShareURLForShare:v9 reply:v19];

    v18 = &v20;
  }
  else
  {
    id v17 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100014B54;
    v22[3] = &unk_1000445C0;
    id v23 = v10;
    sub_100014B54((uint64_t)v22, v17);
    v18 = &v23;
  }

  sub_1000049CC(v24);
}

- (void)startOperation:(id)a3 toSaveSharingInfo:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v24, 0, sizeof(v24));
  sub_100004FB8(1, (uint64_t)"-[BaseFileProviderShareOperationProxy startOperation:toSaveSharingInfo:reply:]", 126, v24);
  id v11 = brc_bread_crumbs();
  v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v26 = v24[0];
    __int16 v27 = 2080;
    v28 = "-[BaseFileProviderShareOperationProxy startOperation:toSaveSharingInfo:reply:]";
    __int16 v29 = 2112;
    v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  v13 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v14 = [v13 isSharingProxyEntitled];

  if (v14)
  {
    objc_super v15 = sub_1000146D4(v8);
    v16 = [(BaseFileProviderShareOperationProxy *)self remoteObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000151C0;
    v19[3] = &unk_1000447B8;
    id v17 = v15;
    id v20 = v17;
    id v21 = v10;
    [v16 startOperation:v17 toSaveSharingInfo:v9 reply:v19];

    v18 = &v20;
  }
  else
  {
    id v17 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000150A8;
    v22[3] = &unk_1000445C0;
    id v23 = v10;
    sub_1000150A8((uint64_t)v22, v17);
    v18 = &v23;
  }

  sub_1000049CC(v24);
}

- (void)startOperation:(id)a3 toUnshareShare:(id)a4 forceDelete:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  memset(v26, 0, sizeof(v26));
  sub_100004FB8(1, (uint64_t)"-[BaseFileProviderShareOperationProxy startOperation:toUnshareShare:forceDelete:reply:]", 138, v26);
  v13 = brc_bread_crumbs();
  unsigned __int8 v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v26[0];
    __int16 v29 = 2080;
    v30 = "-[BaseFileProviderShareOperationProxy startOperation:toUnshareShare:forceDelete:reply:]";
    __int16 v31 = 2112;
    v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  objc_super v15 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v16 = [v15 isSharingProxyEntitled];

  if (v16)
  {
    id v17 = sub_1000146D4(v10);
    v18 = [(BaseFileProviderShareOperationProxy *)self remoteObject];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000156E0;
    v21[3] = &unk_1000448A8;
    id v19 = v17;
    id v22 = v19;
    id v23 = v12;
    [v18 startOperation:v19 toUnshareShare:v11 forceDelete:v7 reply:v21];

    id v20 = &v22;
  }
  else
  {
    id v19 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000155D4;
    uint64_t v24[3] = &unk_1000445C0;
    id v25 = v12;
    sub_1000155D4((uint64_t)v24, v19);
    id v20 = &v25;
  }

  sub_1000049CC(v26);
}

- (void)copyCurrentUserNameAndDisplayHandleWithReply:(id)a3
{
  id v4 = a3;
  memset(v15, 0, sizeof(v15));
  sub_100004FB8(1, (uint64_t)"-[BaseFileProviderShareOperationProxy copyCurrentUserNameAndDisplayHandleWithReply:]", 149, v15);
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v17 = v15[0];
    __int16 v18 = 2080;
    id v19 = "-[BaseFileProviderShareOperationProxy copyCurrentUserNameAndDisplayHandleWithReply:]";
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  BOOL v7 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v8 = [v7 isSharingProxyEntitled];

  if (v8)
  {
    id v9 = [(BaseFileProviderShareOperationProxy *)self remoteObject];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100015BB0;
    v11[3] = &unk_100044D60;
    id v12 = v4;
    [v9 copyCurrentUserNameAndDisplayHandleWithReply:v11];

    id v10 = v12;
  }
  else
  {
    id v10 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100015A74;
    v13[3] = &unk_1000445C0;
    id v14 = v4;
    sub_100015A74((uint64_t)v13, v10);
  }
  sub_1000049CC(v15);
}

- (void)startOperation:(id)a3 toLookupShareParticipants:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v24, 0, sizeof(v24));
  sub_100004FB8(1, (uint64_t)"-[BaseFileProviderShareOperationProxy startOperation:toLookupShareParticipants:reply:]", 160, v24);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v26 = v24[0];
    __int16 v27 = 2080;
    uint64_t v28 = "-[BaseFileProviderShareOperationProxy startOperation:toLookupShareParticipants:reply:]";
    __int16 v29 = 2112;
    v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  v13 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v14 = [v13 isSharingProxyEntitled];

  if (v14)
  {
    objc_super v15 = sub_1000146D4(v8);
    unsigned __int8 v16 = [(BaseFileProviderShareOperationProxy *)self remoteObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100016138;
    v19[3] = &unk_100044D88;
    id v17 = v15;
    id v20 = v17;
    id v21 = v10;
    [v16 startOperation:v17 toLookupShareParticipants:v9 reply:v19];

    __int16 v18 = &v20;
  }
  else
  {
    id v17 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingProxyEntitled" code description];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100016020;
    v22[3] = &unk_1000445C0;
    id v23 = v10;
    sub_100016020((uint64_t)v22, v17);
    __int16 v18 = &v23;
  }

  sub_1000049CC(v24);
}

- (void)startOperation:(id)a3 toCopyDocumentURLForRecordID:(id)a4 syncIfNeeded:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  memset(v26, 0, sizeof(v26));
  sub_100004FB8(1, (uint64_t)"-[BaseFileProviderShareOperationProxy startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]", 176, v26);
  v13 = brc_bread_crumbs();
  unsigned __int8 v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v26[0];
    __int16 v29 = 2080;
    v30 = "-[BaseFileProviderShareOperationProxy startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]";
    __int16 v31 = 2112;
    v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s %@", buf, 0x20u);
  }

  objc_super v15 = [(BaseFileProviderShareOperationProxy *)self clientPrivilegesDescriptor];
  unsigned __int8 v16 = [v15 isSharingPrivateInterfaceEntitled];

  if (v16)
  {
    id v17 = sub_1000146D4(v10);
    __int16 v18 = [(BaseFileProviderShareOperationProxy *)self remoteObject];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100016664;
    v21[3] = &unk_100044DB0;
    id v19 = v17;
    id v22 = v19;
    id v23 = v12;
    [v18 startOperation:v19 toCopyDocumentURLForRecordID:v11 syncIfNeeded:v7 reply:v21];

    id v20 = &v22;
  }
  else
  {
    id v19 = +[NSError br_errorWithDomain:BRCloudDocsErrorDomain, 26, @"%s privilege required", "isSharingPrivateInterfaceEntitled" code description];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001654C;
    uint64_t v24[3] = &unk_1000445C0;
    id v25 = v12;
    sub_10001654C((uint64_t)v24, v19);
    id v20 = &v25;
  }

  sub_1000049CC(v26);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
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

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end