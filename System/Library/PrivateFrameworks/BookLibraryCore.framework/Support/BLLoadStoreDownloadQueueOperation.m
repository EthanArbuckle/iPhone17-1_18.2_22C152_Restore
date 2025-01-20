@interface BLLoadStoreDownloadQueueOperation
+ (id)operationForAutomaticDownloadQueue;
- (ACAccount)account;
- (AMSBagValue)bagURL;
- (BLLoadStoreDownloadQueueOperation)initWithBagURL:(id)a3;
- (BLLoadStoreDownloadQueueOperation)initWithBagURL:(id)a3 account:(id)a4;
- (BLLoadStoreDownloadQueueOperation)initWithURL:(id)a3;
- (BLPurchaseUIHelper)uiHelper;
- (BLUIHostServiceProtocol)uiHostProxy;
- (BOOL)_loadDownloadsFromStart:(id)a3 toEnd:(id)a4;
- (NSOrderedSet)downloads;
- (NSURL)URL;
- (id)_account;
- (id)_newURLRequestWithStartIdentifier:(id)a3 endIdentifier:(id)a4 error:(id *)a5;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)_handleResponse:(id)a3;
- (void)run;
- (void)setUiHelper:(id)a3;
- (void)setUiHostProxy:(id)a3;
@end

@implementation BLLoadStoreDownloadQueueOperation

+ (id)operationForAutomaticDownloadQueue
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[BUBag defaultBag];
  v4 = [v3 automaticDownloadQueueURL];
  id v5 = [v2 initWithBagURL:v4];

  return v5;
}

- (BLLoadStoreDownloadQueueOperation)initWithBagURL:(id)a3
{
  return [(BLLoadStoreDownloadQueueOperation *)self initWithBagURL:a3 account:0];
}

- (BLLoadStoreDownloadQueueOperation)initWithBagURL:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLLoadStoreDownloadQueueOperation;
  v9 = [(BLOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bagURL, a3);
    objc_storeStrong((id *)&v10->_account, a4);
  }

  return v10;
}

- (BLLoadStoreDownloadQueueOperation)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLLoadStoreDownloadQueueOperation;
  v6 = [(BLOperation *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_URL, a3);
  }

  return v7;
}

- (void)run
{
  URL = self->_URL;
  v4 = BLServiceLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (URL)
  {
    if (!v5) {
      goto LABEL_7;
    }
    v6 = self->_URL;
    account = self->_account;
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    __int16 v21 = 2112;
    v22 = account;
    id v8 = "[DownloadQueueOperation] Running load download queue - URL: %@, account: %@";
    objc_super v9 = v4;
    uint32_t v10 = 22;
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    v11 = self->_account;
    *(_DWORD *)buf = 138412290;
    v20 = v11;
    id v8 = "[DownloadQueueOperation] Running load download queue - account: %@";
    objc_super v9 = v4;
    uint32_t v10 = 12;
  }
  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  objc_super v12 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", &off_1001AF5C8, 0);
  rangesToLoad = self->_rangesToLoad;
  self->_rangesToLoad = v12;

  if ((unint64_t)[(NSMutableArray *)self->_rangesToLoad count] >= 2)
  {
    do
    {
      if ([(BLLoadStoreDownloadQueueOperation *)self isCancelled]) {
        break;
      }
      v14 = [(NSMutableArray *)self->_rangesToLoad objectAtIndexedSubscript:0];
      v15 = [(NSMutableArray *)self->_rangesToLoad objectAtIndexedSubscript:1];
      unsigned __int8 v16 = [(BLLoadStoreDownloadQueueOperation *)self _loadDownloadsFromStart:v14 toEnd:v15];
      v17 = self->_rangesToLoad;
      if (v16)
      {
        -[NSMutableArray removeObjectsInRange:](v17, "removeObjectsInRange:", 0, 2);
        [(BLOperation *)self setSuccess:[(NSMutableArray *)self->_rangesToLoad count] == 0];
      }
      else
      {
        [(NSMutableArray *)v17 removeAllObjects];
      }
    }
    while ((unint64_t)[(NSMutableArray *)self->_rangesToLoad count] > 1);
  }
  v18 = self->_rangesToLoad;
  self->_rangesToLoad = 0;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [(BLLoadStoreDownloadQueueOperation *)self uiHelper];
  [v10 handleDialogRequest:v9 completion:v8];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [(BLLoadStoreDownloadQueueOperation *)self uiHelper];
  [v10 handleEngagementRequest:v9 completion:v8];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [(BLLoadStoreDownloadQueueOperation *)self uiHelper];
  [v10 handleAuthenticateRequest:v9 completion:v8];
}

- (void)setUiHostProxy:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_uiHostProxy, a3);
  BOOL v5 = [(BLLoadStoreDownloadQueueOperation *)self uiHelper];

  if (!v5)
  {
    v6 = objc_alloc_init(BLPurchaseUIHelper);
    [(BLLoadStoreDownloadQueueOperation *)self setUiHelper:v6];
  }
  id v7 = [(BLLoadStoreDownloadQueueOperation *)self uiHelper];
  [v7 setUiHostProxy:v8];
}

- (id)_account
{
  account = self->_account;
  if (!account)
  {
    v4 = +[BUAccountsProvider sharedProvider];
    BOOL v5 = [v4 activeStoreAccount];
    v6 = self->_account;
    self->_account = v5;

    account = self->_account;
  }

  return account;
}

- (void)_handleResponse:(id)a3
{
  id v9 = a3;
  v4 = [v9 rangesToLoad];
  if ([v4 count]) {
    [(NSMutableArray *)self->_rangesToLoad addObjectsFromArray:v4];
  }
  BOOL v5 = [v9 downloads];

  if (v5)
  {
    [(BLOperation *)self lock];
    downloads = self->_downloads;
    if (!downloads)
    {
      id v7 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
      id v8 = self->_downloads;
      self->_downloads = v7;

      downloads = self->_downloads;
    }
    [(NSMutableOrderedSet *)downloads unionOrderedSet:v5];
    [(BLOperation *)self unlock];
  }
}

- (BOOL)_loadDownloadsFromStart:(id)a3 toEnd:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v39 = 0;
  id v8 = [(BLLoadStoreDownloadQueueOperation *)self _newURLRequestWithStartIdentifier:v6 endIdentifier:v7 error:&v39];
  id v9 = v39;
  if (v8)
  {
    id v10 = [(BLLoadStoreDownloadQueueOperation *)self uiHostProxy];

    if (v10)
    {
      id v11 = objc_alloc_init((Class)AMSURLSession);
      [v11 setDelegate:self];
    }
    else
    {
      id v11 = +[AMSURLSession defaultSession];
    }
    v14 = [v11 dataTaskPromiseWithRequest:v8];
    id v38 = v9;
    v15 = [v14 resultWithError:&v38];
    id v13 = v38;

    BOOL v12 = v15 != 0;
    unsigned __int8 v16 = BLServiceLog();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v15 object];
        *(_DWORD *)buf = 134218242;
        id v41 = v8;
        __int16 v42 = 2112;
        id v43 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[DownloadQueueOperation] Received result from AMSURLRequest %p: %@", buf, 0x16u);
      }
      objc_opt_class();
      v37 = v15;
      v19 = [v15 object];
      v20 = BUDynamicCast();

      __int16 v21 = BLServiceLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218754;
        id v41 = v8;
        __int16 v42 = 2114;
        id v43 = v6;
        __int16 v44 = 2114;
        id v45 = v7;
        __int16 v46 = 2112;
        v47 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[DownloadQueueOperation] load downloads (request=%p, startID=%{public}@, endID=%{public}@), result.object = %@", buf, 0x2Au);
      }

      if (v20)
      {
        v36 = v20;
        v22 = [BLStoreDownloadQueueResponse alloc];
        [(BLLoadStoreDownloadQueueOperation *)self account];
        id v35 = v7;
        id v23 = v6;
        v25 = id v24 = v11;
        objc_msgSend(v25, "ams_DSID");
        v26 = self;
        id v27 = v8;
        id v28 = v13;
        v30 = BOOL v29 = v12;
        v31 = v22;
        v20 = v36;
        v32 = [(BLStoreDownloadQueueResponse *)v31 initWithDictionary:v36 userIdentifier:v30];

        BOOL v12 = v29;
        id v13 = v28;
        id v8 = v27;

        id v11 = v24;
        id v6 = v23;
        id v7 = v35;
        if (v32)
        {
          v33 = [(BLStoreDownloadQueueResponse *)v32 keybag];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v33 length]) {
            +[AMSKeybag bl_importKeybagData:v33];
          }
          [(BLLoadStoreDownloadQueueOperation *)v26 _handleResponse:v32];

          v20 = v36;
        }
      }

      v15 = v37;
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        id v41 = v8;
        __int16 v42 = 2112;
        id v43 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[DownloadQueueOperation] Received nil result from AMSURLRequest %p. Error:  %@", buf, 0x16u);
      }

      [(BLOperation *)self setError:v13];
    }
  }
  else
  {
    [(BLOperation *)self setError:v9];
    BOOL v12 = 0;
    id v13 = v9;
  }

  return v12;
}

- (id)_newURLRequestWithStartIdentifier:(id)a3 endIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(BLLoadStoreDownloadQueueOperation *)self _account];
  if (!self->_requestEncoder)
  {
    id v11 = [_BLLoadStoreDownloadRequestEncoder alloc];
    BOOL v12 = +[BUBag defaultBag];
    id v13 = [(_BLLoadStoreDownloadRequestEncoder *)v11 initWithBag:v12];
    requestEncoder = self->_requestEncoder;
    self->_requestEncoder = v13;

    [(AMSURLRequestEncoder *)self->_requestEncoder setAccount:v10];
    [(AMSURLRequestEncoder *)self->_requestEncoder setRequestEncoding:2];
    [(AMSURLRequestEncoder *)self->_requestEncoder setAnisetteType:1];
  }
  v15 = +[NSMutableDictionary dictionary];
  unsigned __int8 v16 = +[AMSDevice deviceGUID];
  [v15 setObject:v16 forKeyedSubscript:@"guid"];

  v17 = +[AMSKeybag bl_keybagSyncDataForAccount:v10 withTransactionType:1];
  [v15 setObject:v17 forKeyedSubscript:@"kbsync"];

  v18 = (char *)[v9 unsignedLongLongValue];
  v19 = (char *)[v8 unsignedLongLongValue];

  if (v18 - 1 < v19)
  {
    v20 = +[NSString stringWithFormat:@"%llu", v18];
    [v15 setObject:v20 forKeyedSubscript:@"startId"];

    __int16 v21 = +[NSString stringWithFormat:@"%llu", v19];
    [v15 setObject:v21 forKeyedSubscript:@"endId"];
  }
  v22 = [(BLLoadStoreDownloadQueueOperation *)self bagURL];
  id v23 = self->_requestEncoder;
  if (v22)
  {
    id v24 = [(BLLoadStoreDownloadQueueOperation *)self bagURL];
    [(AMSURLRequestEncoder *)v23 requestWithMethod:4 bagURL:v24 parameters:v15];
  }
  else
  {
    id v24 = [(BLLoadStoreDownloadQueueOperation *)self URL];
    [(AMSURLRequestEncoder *)v23 requestWithMethod:4 URL:v24 parameters:v15];
  v25 = };

  v26 = [v25 resultWithError:a5];

  return v26;
}

- (ACAccount)account
{
  return self->_account;
}

- (BLUIHostServiceProtocol)uiHostProxy
{
  return self->_uiHostProxy;
}

- (NSOrderedSet)downloads
{
  return &self->_downloads->super;
}

- (AMSBagValue)bagURL
{
  return self->_bagURL;
}

- (NSURL)URL
{
  return self->_URL;
}

- (BLPurchaseUIHelper)uiHelper
{
  return self->_uiHelper;
}

- (void)setUiHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiHelper, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_bagURL, 0);
  objc_storeStrong((id *)&self->_uiHostProxy, 0);
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_rangesToLoad, 0);
  objc_storeStrong((id *)&self->_downloads, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end