@interface ICDFileProviderClientSideCollaborationServiceProxy
- (ICDFileProviderClientSideCollaborationServiceProxy)initWithItemIdentifier:(id)a3 domainIdentifier:(id)a4 operationQueue:(id)a5 clientPrivilegesDescriptor:(id)a6;
- (NSString)description;
- (id)uploadContents:(id)a3 baseVersion:(id)a4 reply:(id)a5;
- (void)calculateCollaborationVersionForContents:(id)a3 reply:(id)a4;
- (void)extractEtagsFromBaseVersion:(id)a3 withReply:(id)a4;
- (void)fetchLatestRevisionIntoURL:(id)a3 reply:(id)a4;
- (void)fetchLatestRevisionWithReply:(id)a3;
@end

@implementation ICDFileProviderClientSideCollaborationServiceProxy

- (ICDFileProviderClientSideCollaborationServiceProxy)initWithItemIdentifier:(id)a3 domainIdentifier:(id)a4 operationQueue:(id)a5 clientPrivilegesDescriptor:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICDFileProviderClientSideCollaborationServiceProxy;
  v15 = [(ICDFileProviderClientSideCollaborationServiceProxy *)&v18 init];
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

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@ d:%@ i:%@>", objc_opt_class(), self->_domainIdentifier, self->_itemIdentifier];
}

- (void)extractEtagsFromBaseVersion:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, void *, void))a4;
  if (v6)
  {
    memset(v24, 0, sizeof(v24));
    sub_100004FB8(1, (uint64_t)"-[ICDFileProviderClientSideCollaborationServiceProxy extractEtagsFromBaseVersion:withReply:]", 54, v24);
    v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218754;
      v26 = (const char *)v24[0];
      __int16 v27 = 2080;
      v28 = "-[ICDFileProviderClientSideCollaborationServiceProxy extractEtagsFromBaseVersion:withReply:]";
      __int16 v29 = 2112;
      id v30 = v5;
      __int16 v31 = 2112;
      v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s extractEtagsFromBaseVersion %@%@", buf, 0x2Au);
    }

    if (v5)
    {
      v9 = [BRFieldStructureSignature alloc];
      v10 = [v5 metadataVersion];
      id v11 = [(BRFieldStructureSignature *)v9 initWithData:v10];

      id v12 = [BRFieldContentSignature alloc];
      id v13 = [v5 contentVersion];
      id v14 = [(BRFieldContentSignature *)v12 initWithData:v13];

      if (v14 && v11)
      {
        v15 = brc_bread_crumbs();
        v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = [(BRFieldStructureSignature *)v11 etag];
          objc_super v18 = [(BRFieldContentSignature *)v14 etag];
          *(_DWORD *)buf = 136316162;
          v26 = "-[ICDFileProviderClientSideCollaborationServiceProxy extractEtagsFromBaseVersion:withReply:]";
          __int16 v27 = 2112;
          v28 = v17;
          __int16 v29 = 2112;
          id v30 = v18;
          __int16 v31 = 2112;
          v32 = 0;
          __int16 v33 = 2112;
          v34 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", buf, 0x34u);
        }
        v19 = [(BRFieldStructureSignature *)v11 etag];
        v20 = [(BRFieldContentSignature *)v14 etag];
        v6[2](v6, v19, v20, 0);

LABEL_14:
        sub_1000049CC(v24);
        goto LABEL_15;
      }
    }
    else
    {
      id v14 = 0;
      id v11 = 0;
    }
    v21 = brc_bread_crumbs();
    v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = +[NSError br_errorWithPOSIXCode:22];
      *(_DWORD *)buf = 136316162;
      v26 = "-[ICDFileProviderClientSideCollaborationServiceProxy extractEtagsFromBaseVersion:withReply:]";
      __int16 v27 = 2112;
      v28 = 0;
      __int16 v29 = 2112;
      id v30 = 0;
      __int16 v31 = 2112;
      v32 = v23;
      __int16 v33 = 2112;
      v34 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", buf, 0x34u);
    }
    v19 = +[NSError br_errorWithPOSIXCode:22];
    ((void (**)(id, void *, void *, void *))v6)[2](v6, 0, 0, v19);
    goto LABEL_14;
  }
LABEL_15:
}

- (void)calculateCollaborationVersionForContents:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if (v7)
  {
    memset(v24, 0, sizeof(v24));
    sub_100004FB8(1, (uint64_t)"-[ICDFileProviderClientSideCollaborationServiceProxy calculateCollaborationVersionForContents:reply:]", 78, v24);
    v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218754;
      v26 = (const char *)v24[0];
      __int16 v27 = 2080;
      v28 = "-[ICDFileProviderClientSideCollaborationServiceProxy calculateCollaborationVersionForContents:reply:]";
      __int16 v29 = 2112;
      id v30 = v6;
      __int16 v31 = 2112;
      v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s calculating collaboration version for %@%@", buf, 0x2Au);
    }

    v10 = [v6 _scope];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      v17 = brc_bread_crumbs();
      objc_super v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = +[NSError br_errorWithPOSIXCode:22];
        *(_DWORD *)buf = 136315906;
        v26 = "-[ICDFileProviderClientSideCollaborationServiceProxy calculateCollaborationVersionForContents:reply:]";
        __int16 v27 = 2112;
        v28 = 0;
        __int16 v29 = 2112;
        id v30 = v19;
        __int16 v31 = 2112;
        v32 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", buf, 0x2Au);
      }
      v16 = +[NSError br_errorWithPOSIXCode:22];
      v7[2](v7, 0, v16);
    }
    else
    {
      id v12 = +[BRDaemonConnection defaultConnection];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100005D98;
      v22[3] = &unk_1000445C0;
      id v13 = v7;
      id v23 = v13;
      id v14 = [v12 remoteObjectProxyWithErrorHandler:v22];

      itemIdentifier = self->_itemIdentifier;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100005EB0;
      v20[3] = &unk_1000445E8;
      v21 = v13;
      [v14 calculateSignatureForItemIdentifier:itemIdentifier forURL:v6 reply:v20];

      v16 = v23;
    }

    sub_1000049CC(v24);
  }
}

- (void)fetchLatestRevisionWithReply:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    memset(v16, 0, sizeof(v16));
    sub_100004FB8(1, (uint64_t)"-[ICDFileProviderClientSideCollaborationServiceProxy fetchLatestRevisionWithReply:]", 103, v16);
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      itemIdentifier = self->_itemIdentifier;
      *(_DWORD *)buf = 134218754;
      uint64_t v18 = v16[0];
      __int16 v19 = 2080;
      v20 = "-[ICDFileProviderClientSideCollaborationServiceProxy fetchLatestRevisionWithReply:]";
      __int16 v21 = 2112;
      v22 = itemIdentifier;
      __int16 v23 = 2112;
      v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s fetchLatestRevisionWithReply for item with identifier %@%@", buf, 0x2Au);
    }

    v8 = +[BRDaemonConnection defaultConnection];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000625C;
    v14[3] = &unk_1000445C0;
    id v9 = v4;
    id v15 = v9;
    v10 = [v8 remoteObjectProxyWithErrorHandler:v14];

    BOOL v11 = self->_itemIdentifier;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100006380;
    v12[3] = &unk_100044610;
    id v13 = v9;
    [v10 fetchLatestContentRevisionForItemIdentifier:v11 reply:v12];

    sub_1000049CC(v16);
  }
}

- (void)fetchLatestRevisionIntoURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    memset(v39, 0, sizeof(v39));
    sub_100004FB8(1, (uint64_t)"-[ICDFileProviderClientSideCollaborationServiceProxy fetchLatestRevisionIntoURL:reply:]", 121, v39);
    v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      itemIdentifier = self->_itemIdentifier;
      *(_DWORD *)buf = 134219010;
      v41 = (const char *)v39[0];
      __int16 v42 = 2080;
      v43 = "-[ICDFileProviderClientSideCollaborationServiceProxy fetchLatestRevisionIntoURL:reply:]";
      __int16 v44 = 2112;
      id v45 = v6;
      __int16 v46 = 2112;
      v47 = itemIdentifier;
      __int16 v48 = 2112;
      v49 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s fetchLatestRevisionIntoURL %@ for item with identifier %@%@", buf, 0x34u);
    }

    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = -1;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100006A4C;
    v32[3] = &unk_100044638;
    v34 = &v35;
    id v33 = v7;
    BOOL v11 = objc_retainBlock(v32);
    id v12 = [v6 _scope];
    BOOL v13 = v12 == 0;

    if (v13)
    {
      __int16 v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        __int16 v23 = +[NSError br_errorWithPOSIXCode:22];
        *(_DWORD *)buf = 136316162;
        v41 = "-[ICDFileProviderClientSideCollaborationServiceProxy fetchLatestRevisionIntoURL:reply:]";
        __int16 v42 = 2112;
        v43 = 0;
        __int16 v44 = 2112;
        id v45 = 0;
        __int16 v46 = 2112;
        v47 = v23;
        __int16 v48 = 2112;
        v49 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", buf, 0x34u);
      }
      v16 = +[NSError br_errorWithPOSIXCode:22];
      ((void (*)(void *, void, void, NSString *))v11[2])(v11, 0, 0, v16);
    }
    else
    {
      id v14 = [v6 _scope];
      id v31 = 0;
      id v15 = +[BRPosixOperationsWrapper consumeSandboxExtension:v14 error:&v31];
      v16 = (NSString *)v31;
      v36[3] = (uint64_t)v15;

      if (v36[3] < 0)
      {
        v24 = brc_bread_crumbs();
        v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316162;
          v41 = "-[ICDFileProviderClientSideCollaborationServiceProxy fetchLatestRevisionIntoURL:reply:]";
          __int16 v42 = 2112;
          v43 = 0;
          __int16 v44 = 2112;
          id v45 = 0;
          __int16 v46 = 2112;
          v47 = v16;
          __int16 v48 = 2112;
          v49 = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", buf, 0x34u);
        }

        ((void (*)(void *, void, void, NSString *))v11[2])(v11, 0, 0, v16);
      }
      else
      {
        v17 = +[BRDaemonConnection defaultConnection];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_100006AF0;
        v29[3] = &unk_1000445C0;
        uint64_t v18 = v11;
        id v30 = v18;
        __int16 v19 = [v17 remoteObjectProxyWithErrorHandler:v29];

        v20 = self->_itemIdentifier;
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100006C14;
        v26[3] = &unk_100044660;
        v28 = v18;
        id v27 = v6;
        [v19 cloneLatestContentRevisionForItemIdentifier:v20 reply:v26];
      }
    }

    _Block_object_dispose(&v35, 8);
    sub_1000049CC(v39);
  }
}

- (id)uploadContents:(id)a3 baseVersion:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  if (v10)
  {
    memset(v29, 0, sizeof(v29));
    sub_100004FB8(1, (uint64_t)"-[ICDFileProviderClientSideCollaborationServiceProxy uploadContents:baseVersion:reply:]", 169, v29);
    BOOL v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219010;
      id v31 = (const char *)v29[0];
      __int16 v32 = 2080;
      id v33 = "-[ICDFileProviderClientSideCollaborationServiceProxy uploadContents:baseVersion:reply:]";
      __int16 v34 = 2112;
      id v35 = v8;
      __int16 v36 = 2112;
      id v37 = v9;
      __int16 v38 = 2112;
      v39 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %s uploadContents URL: %@ base version: %@%@", buf, 0x34u);
    }

    BOOL v13 = [v8 _scope];
    BOOL v14 = v13 == 0;

    if (v14)
    {
      __int16 v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        __int16 v23 = +[NSError br_errorWithPOSIXCode:22];
        *(_DWORD *)buf = 136315906;
        id v31 = "-[ICDFileProviderClientSideCollaborationServiceProxy uploadContents:baseVersion:reply:]";
        __int16 v32 = 2112;
        id v33 = 0;
        __int16 v34 = 2112;
        id v35 = v23;
        __int16 v36 = 2112;
        id v37 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", buf, 0x2Au);
      }
      v20 = +[NSError br_errorWithPOSIXCode:22];
      v10[2](v10, 0, v20);
      __int16 v19 = 0;
    }
    else
    {
      id v15 = +[BRDaemonConnection defaultConnection];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100007314;
      v27[3] = &unk_1000445C0;
      v16 = v10;
      id v28 = v16;
      v17 = [v15 remoteObjectProxyWithErrorHandler:v27];

      itemIdentifier = self->_itemIdentifier;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10000742C;
      v25[3] = &unk_100044688;
      v26 = v16;
      __int16 v19 = [v17 uploadItemIdentifier:itemIdentifier withContents:v8 baseVersion:v9 reply:v25];

      v20 = v28;
    }

    sub_1000049CC(v29);
  }
  else
  {
    __int16 v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientPrivilegesDescriptor, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end