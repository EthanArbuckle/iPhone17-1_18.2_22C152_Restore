@interface RenameService
- (void)renameDocumentAtURL:(id)a3 proposedName:(id)a4 completionHandler:(id)a5;
@end

@implementation RenameService

- (void)renameDocumentAtURL:(id)a3 proposedName:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[NSXPCConnection currentConnection];
  v11 = [v7 url];
  unsigned __int8 v12 = objc_msgSend(v10, "doc_hasSandboxAccessToFile:", v11);

  if (v12)
  {
    if (v10) {
      [v10 auditToken];
    }
    else {
      memset(v27, 0, sizeof(v27));
    }
    id v26 = 0;
    v15 = +[LSBundleRecord bundleRecordForAuditToken:v27 error:&v26];
    id v13 = v26;
    v16 = [v15 bundleIdentifier];

    if (v16)
    {
      v17 = [v15 bundleIdentifier];
    }
    else
    {
      v18 = docRenameLogHandle;
      if (!docRenameLogHandle)
      {
        DOCInitLogging();
        v18 = docRenameLogHandle;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10000343C((uint64_t)v15, v18);
      }
      v17 = @"com.apple.Fallback";
    }
    v19 = docRenameLogHandle;
    if (!docRenameLogHandle)
    {
      DOCInitLogging();
      v19 = docRenameLogHandle;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v29 = "-[RenameService renameDocumentAtURL:proposedName:completionHandler:]";
      __int16 v30 = 2112;
      id v31 = v7;
      __int16 v32 = 2112;
      id v33 = v8;
      __int16 v34 = 2112;
      v35 = v17;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[Rename] %s bookmark: %@ proposedName: %@ caller: %@", buf, 0x2Au);
    }
    v20 = [v7 url];
    unsigned __int8 v21 = [v20 startAccessingSecurityScopedResource];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000033C4;
    v22[3] = &unk_100004120;
    id v24 = v9;
    unsigned __int8 v25 = v21;
    id v23 = v7;
    +[DOCFileRenamingSupport _workaroundWrapper_renameDocumentAtURL:v23 newName:v8 hostIdentifier:v17 completionHandler:v22];
  }
  else
  {
    id v13 = +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:0];
    v14 = docRenameLogHandle;
    if (!docRenameLogHandle)
    {
      DOCInitLogging();
      v14 = docRenameLogHandle;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000034C8((uint64_t)v13, v14);
    }
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v13);
  }
}

@end