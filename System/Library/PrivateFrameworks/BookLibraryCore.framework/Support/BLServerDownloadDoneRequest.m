@interface BLServerDownloadDoneRequest
+ (void)notifyDownloadCancelledWithAccountID:(id)a3 downloadID:(id)a4 storeID:(id)a5 transactionID:(id)a6 cancelDownloadURL:(id)a7 completion:(id)a8;
+ (void)notifyDownloadDoneWithAccountID:(id)a3 downloadID:(id)a4 storeID:(id)a5 transactionID:(id)a6 completion:(id)a7;
- (BLServerDownloadDoneRequest)initWithAccountID:(id)a3 downloadID:(id)a4 storeID:(id)a5 transactionID:(id)a6;
- (BLServerDownloadDoneRequest)initWithAccountID:(id)a3 downloadID:(id)a4 storeID:(id)a5 transactionID:(id)a6 cancelDownloadURL:(id)a7;
- (BLServerDownloadDoneRequest)initWithAccountID:(id)a3 downloadID:(id)a4 storeID:(id)a5 transactionID:(id)a6 finishURL:(id)a7 isCancel:(BOOL)a8;
- (BOOL)isCancel;
- (NSNumber)accountID;
- (NSNumber)storeID;
- (NSString)downloadID;
- (NSString)transactionID;
- (NSURL)finishURL;
- (id)_requestPromiseForDownloadDoneForAccountIdentifier:(id)a3 storeID:(id)a4 transactionID:(id)a5 finishURL:(id)a6;
- (id)completion;
- (void)setAccountID:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDownloadID:(id)a3;
- (void)setFinishURL:(id)a3;
- (void)setIsCancel:(BOOL)a3;
- (void)setStoreID:(id)a3;
- (void)setTransactionID:(id)a3;
- (void)start;
@end

@implementation BLServerDownloadDoneRequest

- (BLServerDownloadDoneRequest)initWithAccountID:(id)a3 downloadID:(id)a4 storeID:(id)a5 transactionID:(id)a6 cancelDownloadURL:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  if ([v13 length])
  {
    v17 = +[NSURL URLWithString:v13];
  }
  else
  {
    v18 = BLServiceLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543362;
      id v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "(dID=%{public}@) No cancel-download-url", (uint8_t *)&v21, 0xCu);
    }

    v17 = 0;
  }
  v19 = [(BLServerDownloadDoneRequest *)self initWithAccountID:v16 downloadID:v12 storeID:v15 transactionID:v14 finishURL:v17 isCancel:1];

  return v19;
}

- (BLServerDownloadDoneRequest)initWithAccountID:(id)a3 downloadID:(id)a4 storeID:(id)a5 transactionID:(id)a6
{
  return [(BLServerDownloadDoneRequest *)self initWithAccountID:a3 downloadID:a4 storeID:a5 transactionID:a6 finishURL:0 isCancel:0];
}

- (BLServerDownloadDoneRequest)initWithAccountID:(id)a3 downloadID:(id)a4 storeID:(id)a5 transactionID:(id)a6 finishURL:(id)a7 isCancel:(BOOL)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)BLServerDownloadDoneRequest;
  v18 = [(BLServerDownloadDoneRequest *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accountID, a3);
    objc_storeStrong((id *)&v19->_downloadID, a4);
    objc_storeStrong((id *)&v19->_storeID, a5);
    objc_storeStrong((id *)&v19->_transactionID, a6);
    objc_storeStrong((id *)&v19->_finishURL, a7);
    v19->_isCancel = a8;
  }

  return v19;
}

- (void)start
{
  v3 = [(BLServerDownloadDoneRequest *)self downloadID];
  v4 = [(BLServerDownloadDoneRequest *)self accountID];
  v5 = [(BLServerDownloadDoneRequest *)self storeID];
  v6 = [(BLServerDownloadDoneRequest *)self transactionID];
  v7 = [(BLServerDownloadDoneRequest *)self finishURL];
  v8 = [(BLServerDownloadDoneRequest *)self _requestPromiseForDownloadDoneForAccountIdentifier:v4 storeID:v5 transactionID:v6 finishURL:v7];

  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006AD30;
    v12[3] = &unk_1001A3068;
    v12[4] = self;
    id v13 = v3;
    [v8 addFinishBlock:v12];
  }
  else
  {
    v9 = sub_10004B6AC(0, 0, @"Error building URL requestPromise for marking downloadID as done for server.");
    uint64_t v10 = [(BLServerDownloadDoneRequest *)self completion];
    v11 = (void *)v10;
    if (v10) {
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v9);
    }
  }
}

- (id)_requestPromiseForDownloadDoneForAccountIdentifier:(id)a3 storeID:(id)a4 transactionID:(id)a5 finishURL:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[BUBag defaultBag];
  id v14 = [objc_alloc((Class)AMSURLRequestEncoder) initWithBag:v13];
  id v15 = v9;
  if (v15)
  {
    id v16 = +[ACAccount bu_storeAccountWithDSID:v15];
    [v14 setAccount:v16];
  }
  [v14 setDialogOptions:1];
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  if (v12)
  {
    id v39 = v11;
    v18 = +[NSURLComponents componentsWithURL:v12 resolvingAgainstBaseURL:0];
    v19 = v18;
    if (v18)
    {
      v36 = v13;
      id v37 = v12;
      id v38 = v10;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v20 = [v18 queryItems];
      id v21 = [v20 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v41;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v41 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            v26 = [v25 value];
            v27 = [v25 name];
            [v17 setObject:v26 forKeyedSubscript:v27];
          }
          id v22 = [v20 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v22);
      }

      [v19 setQueryItems:0];
      id v12 = v37;
      id v10 = v38;
      id v13 = v36;
    }
    v28 = [v19 URL];
    if (v28)
    {
      v29 = [v14 requestWithMethod:2 URL:v28 parameters:v17];
    }
    else
    {
      v29 = 0;
    }

    id v11 = v39;
  }
  else
  {
    v30 = [v10 stringValue];

    v29 = 0;
    if (v11 && v30)
    {
      id v31 = objc_alloc_init((Class)NSMutableDictionary);
      [v10 stringValue];
      v33 = v32 = v13;
      [v31 setObject:v33 forKeyedSubscript:@"songId"];

      [v31 setObject:v11 forKeyedSubscript:@"download-id"];
      v34 = [v32 songDownloadDone];
      v29 = [v14 requestWithMethod:2 bagURL:v34 parameters:v31];

      id v13 = v32;
    }
  }

  return v29;
}

+ (void)notifyDownloadCancelledWithAccountID:(id)a3 downloadID:(id)a4 storeID:(id)a5 transactionID:(id)a6 cancelDownloadURL:(id)a7 completion:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [[BLServerDownloadDoneRequest alloc] initWithAccountID:v18 downloadID:v17 storeID:v16 transactionID:v15 cancelDownloadURL:v14];

  [(BLServerDownloadDoneRequest *)v19 setCompletion:v13];
  [(BLServerDownloadDoneRequest *)v19 start];
}

+ (void)notifyDownloadDoneWithAccountID:(id)a3 downloadID:(id)a4 storeID:(id)a5 transactionID:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [[BLServerDownloadDoneRequest alloc] initWithAccountID:v15 downloadID:v14 storeID:v13 transactionID:v12];

  [(BLServerDownloadDoneRequest *)v16 setCompletion:v11];
  [(BLServerDownloadDoneRequest *)v16 start];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
}

- (NSURL)finishURL
{
  return self->_finishURL;
}

- (void)setFinishURL:(id)a3
{
}

- (BOOL)isCancel
{
  return self->_isCancel;
}

- (void)setIsCancel:(BOOL)a3
{
  self->_isCancel = a3;
}

- (NSNumber)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_finishURL, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end