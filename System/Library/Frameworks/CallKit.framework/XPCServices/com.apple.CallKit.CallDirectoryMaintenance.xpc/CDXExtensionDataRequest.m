@interface CDXExtensionDataRequest
- (CDXExtensionDataRequest)init;
- (CDXExtensionDataRequest)initWithExtension:(id)a3 queue:(id)a4;
- (CDXExtensionDataRequestDelegate)delegate;
- (CXCallDirectoryExtensionHostContext)context;
- (NSCopying)requestIdentifier;
- (NSError)hostCancellationError;
- (NSExtension)extension;
- (OS_dispatch_queue)queue;
- (id)completionHandler;
- (void)_cancelWithError:(id)a3;
- (void)addBlockingEntriesWithData:(id)a3 reply:(id)a4;
- (void)addIdentificationEntriesWithData:(id)a3 reply:(id)a4;
- (void)beginWithCompletion:(id)a3;
- (void)completeRequestWithReply:(id)a3;
- (void)isIncrementalLoadingAllowed:(id)a3;
- (void)removeAllBlockingEntriesWithReply:(id)a3;
- (void)removeAllIdentificationEntriesWithReply:(id)a3;
- (void)removeBlockingEntriesWithData:(id)a3 reply:(id)a4;
- (void)removeIdentificationEntriesWithData:(id)a3 reply:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3;
- (void)setHostCancellationError:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation CDXExtensionDataRequest

- (CDXExtensionDataRequest)initWithExtension:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDXExtensionDataRequest;
  v9 = [(CDXExtensionDataRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_extension, a3);
  }

  return v10;
}

- (CDXExtensionDataRequest)init
{
  return 0;
}

- (CDXExtensionDataRequestDelegate)delegate
{
  v3 = [(CDXExtensionDataRequest *)self queue];
  dispatch_assert_queue_V2(v3);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CDXExtensionDataRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  v4 = [(CDXExtensionDataRequest *)self queue];
  dispatch_assert_queue_V2(v4);

  objc_storeWeak((id *)&self->_delegate, obj);
}

- (void)beginWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(CDXExtensionDataRequest *)self queue];
  dispatch_assert_queue_V2(v5);

  [(CDXExtensionDataRequest *)self setCompletionHandler:v4];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000044D0;
  v15[3] = &unk_100034AC0;
  objc_copyWeak(&v16, &location);
  v6 = [(CDXExtensionDataRequest *)self extension];
  [v6 setRequestCompletionBlock:v15];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004690;
  v13[3] = &unk_100034B10;
  objc_copyWeak(&v14, &location);
  id v7 = [(CDXExtensionDataRequest *)self extension];
  [v7 setRequestCancellationBlock:v13];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000048A4;
  v11[3] = &unk_100034B38;
  objc_copyWeak(&v12, &location);
  id v8 = [(CDXExtensionDataRequest *)self extension];
  [v8 setRequestInterruptionBlock:v11];

  v9 = [(CDXExtensionDataRequest *)self extension];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004A2C;
  v10[3] = &unk_100034B60;
  v10[4] = self;
  [v9 beginExtensionRequestWithInputItems:0 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_cancelWithError:(id)a3
{
  id v4 = a3;
  v5 = [(CDXExtensionDataRequest *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(CDXExtensionDataRequest *)self requestIdentifier];

  if (!v6)
  {
    id v14 = [(CDXExtensionDataRequest *)self extension];

    v9 = sub_100006944();
    BOOL v15 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (!v15) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      v20 = self;
      id v16 = "Requested to cancel data request %@ which has not yet begun";
    }
    else
    {
      if (!v15) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      v20 = self;
      id v16 = "Requested to cancel data request %@ which has already been completed or cancelled";
    }
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
    goto LABEL_13;
  }
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [(CDXExtensionDataRequest *)self context];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100004EBC;
  v17[3] = &unk_100034B88;
  v9 = v7;
  v18 = v9;
  [v8 requestFailedWithError:v4 completion:v17];

  dispatch_time_t v10 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    v11 = sub_100006944();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Timed out while notifying extension about request failure, proceeding to cancel extension request", buf, 2u);
    }
  }
  [(CDXExtensionDataRequest *)self setHostCancellationError:v4];
  id v12 = [(CDXExtensionDataRequest *)self extension];
  v13 = [(CDXExtensionDataRequest *)self requestIdentifier];
  [v12 cancelExtensionRequestWithIdentifier:v13];

LABEL_13:
}

- (void)isIncrementalLoadingAllowed:(id)a3
{
  id v4 = a3;
  v5 = [(CDXExtensionDataRequest *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004F78;
  v7[3] = &unk_100034BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)addBlockingEntriesWithData:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CDXExtensionDataRequest *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000050E0;
  block[3] = &unk_100034BD8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)removeBlockingEntriesWithData:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CDXExtensionDataRequest *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005240;
  block[3] = &unk_100034BD8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)removeAllBlockingEntriesWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(CDXExtensionDataRequest *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000537C;
  v7[3] = &unk_100034BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)addIdentificationEntriesWithData:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CDXExtensionDataRequest *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000054DC;
  block[3] = &unk_100034BD8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)removeIdentificationEntriesWithData:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CDXExtensionDataRequest *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000563C;
  block[3] = &unk_100034BD8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)removeAllIdentificationEntriesWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(CDXExtensionDataRequest *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005778;
  v7[3] = &unk_100034BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)completeRequestWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(CDXExtensionDataRequest *)self queue];
  dispatch_async(v5, v4);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (NSCopying)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (CXCallDirectoryExtensionHostContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSError)hostCancellationError
{
  return self->_hostCancellationError;
}

- (void)setHostCancellationError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostCancellationError, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end