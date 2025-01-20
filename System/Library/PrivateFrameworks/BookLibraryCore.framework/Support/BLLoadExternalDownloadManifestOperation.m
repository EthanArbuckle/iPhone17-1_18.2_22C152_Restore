@interface BLLoadExternalDownloadManifestOperation
- (BLLoadExternalDownloadManifestOperation)initWithRequest:(id)a3 uiHostProxy:(id)a4 downloadBlock:(id)a5;
- (BLUIHostServiceProtocol)uiHostProxy;
- (BOOL)_runForPurchaseFormatWithURLRequest:(id)a3 error:(id *)a4;
- (id)URLRequest;
- (id)downloadBlock;
- (void)run;
- (void)setDownloadBlock:(id)a3;
- (void)setUiHostProxy:(id)a3;
@end

@implementation BLLoadExternalDownloadManifestOperation

- (BLLoadExternalDownloadManifestOperation)initWithRequest:(id)a3 uiHostProxy:(id)a4 downloadBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BLLoadExternalDownloadManifestOperation;
  v11 = [(BLOperation *)&v18 init];
  if (v11)
  {
    v12 = [v8 URLRequest];
    v13 = (NSURLRequest *)[v12 copy];
    urlRequest = v11->_urlRequest;
    v11->_urlRequest = v13;

    id v15 = [v10 copy];
    id downloadBlock = v11->_downloadBlock;
    v11->_id downloadBlock = v15;

    objc_storeStrong((id *)&v11->_uiHostProxy, a4);
  }

  return v11;
}

- (id)URLRequest
{
  [(BLOperation *)self lock];
  v3 = self->_urlRequest;
  [(BLOperation *)self unlock];

  return v3;
}

- (void)run
{
  v3 = [(BLLoadExternalDownloadManifestOperation *)self URLRequest];
  v4 = [v3 URL];

  if (v4)
  {
    id v11 = 0;
    unsigned __int8 v5 = [(BLLoadExternalDownloadManifestOperation *)self _runForPurchaseFormatWithURLRequest:v3 error:&v11];
    id v6 = v11;
    if (v5)
    {
      uint64_t v7 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    id v8 = BLServiceLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = (id)objc_opt_class();
      id v9 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@: Invalid url request", buf, 0xCu);
    }
    sub_10004B6AC(3, 0, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v6, "bl_isUserCancelError") & 1) == 0)
  {
    id v10 = BLServiceLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not load download manifest with error:  %@", buf, 0xCu);
    }
  }
  uint64_t v7 = 0;
LABEL_12:
  [(BLOperation *)self setSuccess:v7];
  [(BLOperation *)self setError:v6];
}

- (BOOL)_runForPurchaseFormatWithURLRequest:(id)a3 error:(id *)a4
{
  id v6 = [a3 URL];
  uint64_t v7 = [[BLLoadStoreDownloadQueueOperation alloc] initWithURL:v6];
  id v8 = [(BLLoadExternalDownloadManifestOperation *)self uiHostProxy];
  [(BLLoadStoreDownloadQueueOperation *)v7 setUiHostProxy:v8];

  id v20 = 0;
  BOOL v9 = [(BLOperation *)self runSubOperation:v7 returningError:&v20];
  id v10 = v20;
  if (v9)
  {
    id v11 = [(BLLoadStoreDownloadQueueOperation *)v7 downloads];
    v12 = [v11 array];

    uint64_t v13 = [(BLLoadExternalDownloadManifestOperation *)self downloadBlock];
    v14 = (void *)v13;
    if (v13) {
      (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v12, v10);
    }
  }
  else
  {
    id v15 = BLServiceLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v22 = v16;
      __int16 v23 = 2112;
      id v24 = v10;
      id v17 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@: Request failed with error:  %@", buf, 0x16u);
    }
    uint64_t v18 = [(BLLoadExternalDownloadManifestOperation *)self downloadBlock];
    v12 = (void *)v18;
    if (v18) {
      (*(void (**)(uint64_t, void, id))(v18 + 16))(v18, 0, v10);
    }
  }

  if (a4) {
    *a4 = v10;
  }

  return v9;
}

- (id)downloadBlock
{
  return self->_downloadBlock;
}

- (void)setDownloadBlock:(id)a3
{
}

- (BLUIHostServiceProtocol)uiHostProxy
{
  return self->_uiHostProxy;
}

- (void)setUiHostProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiHostProxy, 0);
  objc_storeStrong(&self->_downloadBlock, 0);

  objc_storeStrong((id *)&self->_urlRequest, 0);
}

@end