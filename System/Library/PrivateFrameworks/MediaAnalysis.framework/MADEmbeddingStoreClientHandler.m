@interface MADEmbeddingStoreClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
- (MADEmbeddingStoreClientHandler)init;
- (MADEmbeddingStoreClientHandler)initWithXPCConnection:(id)a3;
- (void)cancelAllRequests;
- (void)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 reply:(id)a6;
- (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 reply:(id)a5;
- (void)requestEmbeddingStoreSandboxExtensionWithPhotoLibraryURL:(id)a3 reply:(id)a4;
- (void)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 reply:(id)a6;
@end

@implementation MADEmbeddingStoreClientHandler

- (MADEmbeddingStoreClientHandler)init
{
  return 0;
}

- (MADEmbeddingStoreClientHandler)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MADEmbeddingStoreClientHandler;
  v6 = [(MADEmbeddingStoreClientHandler *)&v20 init];
  v7 = v6;
  if (v6)
  {
    p_connection = (id *)&v6->_connection;
    objc_storeStrong((id *)&v6->_connection, a3);
    [*p_connection setExportedObject:v7];
    id v9 = *p_connection;
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MADEmbeddingStoreClientProtocol];
    [v9 setRemoteObjectInterface:v10];

    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MADEmbeddingStoreServerProtocol];
    +[MADEmbeddingStoreService configureServerInterface:v11];
    [*p_connection setExportedInterface:v11];
    objc_initWeak(&location, v7);
    id v12 = *p_connection;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100085DAC;
    v17[3] = &unk_10021C100;
    objc_copyWeak(&v18, &location);
    [v12 setInterruptionHandler:v17];
    id v13 = *p_connection;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100085E54;
    v15[3] = &unk_10021C100;
    objc_copyWeak(&v16, &location);
    [v13 setInvalidationHandler:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v7;
}

+ (id)clientHandlerWithXPCConnection:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithXPCConnection:v3];

  return v4;
}

- (void)cancelAllRequests
{
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v2 = VCPLogInstance();
    os_log_type_t v3 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v2, v3))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "-[MADEmbeddingStoreClientHandler cancelAllRequests] Method not implemented", v4, 2u);
    }
  }
}

- (void)requestEmbeddingStoreSandboxExtensionWithPhotoLibraryURL:(id)a3 reply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void, void *))a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[MADEmbeddingStoreClientHandler] Received sandbox extension request for embedding store file", buf, 2u);
    }
  }
  id v9 = +[VCPPhotoLibraryManager sharedManager];
  v10 = [v9 photoLibraryWithURL:v5];

  if (!v10)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v5;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "[MADEmbeddingStoreClientHandler] Failed to open photo library at %@", buf, 0xCu);
      }
    }
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    id v12 = +[NSString stringWithFormat:@"[MADEmbeddingStoreClientHandler] Failed to open photo library at %@", v5];
    id v36 = v12;
    objc_super v20 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v21 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v20];
    v6[2](v6, 0, v21);

    goto LABEL_29;
  }
  v11 = +[MADEmbeddingStore embeddingStoreDirectoryForPhotoLibrary:v10];
  id v12 = v11;
  if (!v11)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v22, v23))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "[MADEmbeddingStoreClientHandler] Failed to find EmbeddingStore directory", buf, 2u);
      }
    }
    NSErrorDomain v24 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    objc_super v20 = +[NSString stringWithFormat:@"[MADEmbeddingStoreClientHandler] Failed to find EmbeddingStore directory"];
    v34 = v20;
    v25 = &v34;
    v26 = &v33;
    goto LABEL_28;
  }
  id v12 = v11;
  [v12 UTF8String];
  id v13 = (void *)sandbox_extension_issue_file();
  int v14 = MediaAnalysisLogLevel();
  if (!v13)
  {
    if (v14 >= 3)
    {
      v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v12;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "[MADEmbeddingStoreClientHandler] Failed to issue sandbox extension on %@", buf, 0xCu);
      }
    }
    NSErrorDomain v24 = NSOSStatusErrorDomain;
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    objc_super v20 = +[NSString stringWithFormat:@"[MADEmbeddingStoreClientHandler] Failed to issue sandbox extension on %@", v12];
    v32 = v20;
    v25 = &v32;
    v26 = &v31;
LABEL_28:
    v29 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v26 count:1];
    v30 = +[NSError errorWithDomain:v24 code:-18 userInfo:v29];
    v6[2](v6, 0, v30);

LABEL_29:
    goto LABEL_30;
  }
  if (v14 >= 7)
  {
    v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[MADEmbeddingStoreClientHandler] Issuing sandbox extension for %@", buf, 0xCu);
    }
  }
  v17 = +[NSString stringWithUTF8String:v13];
  ((void (**)(id, void *, void *))v6)[2](v6, v17, 0);

  free(v13);
LABEL_30:
}

- (void)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *, id))a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v19 = [v9 count];
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MADEmbeddingStoreClientHandler] Received fetch embedding request for %u assets", buf, 8u);
    }
  }
  id v17 = 0;
  v15 = +[MADEmbeddingStore fetchEmbeddingsWithAssetUUIDs:v9 photoLibraryURL:v10 options:v11 error:&v17];
  id v16 = v17;
  v12[2](v12, v15, v16);
}

- (void)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *, id))a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v19 = [v9 count];
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MADEmbeddingStoreClientHandler] Received search request for %u embedding", buf, 8u);
    }
  }
  id v17 = 0;
  v15 = +[MADEmbeddingStore searchWithEmbeddings:v9 photoLibraryURL:v10 options:v11 error:&v17];
  id v16 = v17;
  v12[2](v12, v15, v16);
}

- (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 reply:(id)a5
{
  id v7 = a4;
  os_log_type_t v8 = (void (**)(id, id))a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[MADEmbeddingStoreClientHandler] Received prewarm search request with concurrencyLimit %d", buf, 8u);
    }
  }
  id v12 = 0;
  +[MADEmbeddingStore prewarmSearchWithConcurrencyLimit:a3 photoLibraryURL:v7 error:&v12];
  id v11 = v12;
  v8[2](v8, v11);
}

- (void).cxx_destruct
{
}

@end