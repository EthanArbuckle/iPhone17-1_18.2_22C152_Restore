@interface CPLInitialDownloadHelper
- (BOOL)initialDownloadIsRunning;
- (CPLEngineWrapperArray)wrappers;
- (CPLInitialDownloadHelper)initWithWrappers:(id)a3 queue:(id)a4;
- (CPLInitialDownloadHelperDelegate)delegate;
- (OS_dispatch_queue)queue;
- (void)_requestLibraryWithIdentifier:(id)a3 withActivatedMainScope:(BOOL)a4 completionHandler:(id)a5;
- (void)initialDownloadHelper:(id)a3 checkActiveAccountWithCompletionHandler:(id)a4;
- (void)requestInitialDownloadOfMainScopeForLibraryWithIdentifier:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)requestLibraryWithIdentifier:(id)a3 withActivatedMainScope:(BOOL)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation CPLInitialDownloadHelper

- (CPLInitialDownloadHelper)initWithWrappers:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLInitialDownloadHelper;
  v9 = [(CPLInitialDownloadHelper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_wrappers, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (BOOL)initialDownloadIsRunning
{
  return self->_currentLibraryIdentifier != 0;
}

- (void)_requestLibraryWithIdentifier:(id)a3 withActivatedMainScope:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v11 = +[NSProgress progressWithTotalUnitCount:2];
  if (!_CPLSilentLogging)
  {
    objc_super v12 = sub_10000DE84();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = "";
      if (v6) {
        v13 = " with activated main scope";
      }
      *(_DWORD *)buf = 138543618;
      id v30 = v9;
      __int16 v31 = 2080;
      v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requesting %{public}@%s", buf, 0x16u);
    }
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000DED8;
  v26[3] = &unk_100276390;
  id v28 = v10;
  id v14 = v11;
  id v27 = v14;
  id v15 = v10;
  v16 = objc_retainBlock(v26);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000DF28;
  v25[3] = &unk_1002763B0;
  v25[4] = a2;
  [v14 setCancellationHandler:v25];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000DFF0;
  v20[3] = &unk_100276478;
  v20[4] = self;
  id v21 = v9;
  BOOL v24 = v6;
  id v22 = v14;
  id v23 = v16;
  id v17 = v14;
  v18 = v16;
  id v19 = v9;
  [v17 performAsCurrentWithPendingUnitCount:1 usingBlock:v20];
}

- (void)requestLibraryWithIdentifier:(id)a3 withActivatedMainScope:(BOOL)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = +[NSProgress progressWithTotalUnitCount:1];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000EA38;
  v35[3] = &unk_100276390;
  id v12 = v10;
  id v37 = v12;
  id v13 = v11;
  id v36 = v13;
  id v14 = objc_retainBlock(v35);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000EA88;
  v34[3] = &unk_1002763B0;
  v34[4] = a2;
  [v13 setCancellationHandler:v34];
  if ([(CPLEngineWrapperArray *)self->_wrappers count])
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000EE60;
    v25[3] = &unk_1002764A0;
    v25[4] = self;
    id v15 = &v26;
    id v16 = v9;
    BOOL v28 = a4;
    id v17 = (id *)&v27;
    id v26 = v16;
    id v27 = v14;
    v18 = v14;
    [v13 performAsCurrentWithPendingUnitCount:1 usingBlock:v25];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v19 = sub_10000DE84();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v9;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Checking account info before requesting %@", buf, 0xCu);
      }
    }
    WeakRetained = (CPLInitialDownloadHelper *)objc_loadWeakRetained((id *)&self->_delegate);
    id v21 = WeakRetained;
    if (WeakRetained) {
      id v22 = WeakRetained;
    }
    else {
      id v22 = self;
    }
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000EB50;
    v29[3] = &unk_1002764F0;
    v29[4] = self;
    id v15 = &v30;
    id v23 = v9;
    BOOL v33 = a4;
    id v17 = (id *)&v32;
    id v30 = v23;
    v32 = v14;
    id v31 = v13;
    BOOL v24 = v14;
    [(CPLInitialDownloadHelper *)v22 initialDownloadHelper:self checkActiveAccountWithCompletionHandler:v29];
  }
}

- (void)requestInitialDownloadOfMainScopeForLibraryWithIdentifier:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  currentLibraryIdentifier = self->_currentLibraryIdentifier;
  if (currentLibraryIdentifier)
  {
    if ([(NSString *)currentLibraryIdentifier isEqualToString:v10])
    {
      if (!_CPLSilentLogging)
      {
        id v14 = sub_10000DE84();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v10;
          id v15 = "Requested to perform initial download for %{public}@ but we are already doing it";
          id v16 = v14;
          uint32_t v17 = 12;
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
    }
    else if (!_CPLSilentLogging)
    {
      id v14 = sub_10000DE84();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v25 = self->_currentLibraryIdentifier;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v25;
        id v15 = "Requested to perform initial download for %{public}@ but we are already doing %{public}@";
        id v16 = v14;
        uint32_t v17 = 22;
        goto LABEL_14;
      }
LABEL_15:
    }
    queue = self->_queue;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10000F2B4;
    v39[3] = &unk_100275DF8;
    id v40 = v12;
    id v27 = v39;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000100AC;
    v42 = &unk_100275DF8;
    id v43 = v27;
    BOOL v28 = queue;
    id v23 = v12;
    dispatch_block_t v29 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
    dispatch_async(v28, v29);

    id v20 = v40;
    goto LABEL_17;
  }
  objc_storeStrong((id *)&self->_currentLibraryIdentifier, a3);
  v18 = +[NSProgress progressWithTotalUnitCount:11];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10000F324;
  v38[3] = &unk_1002763B0;
  v38[4] = a2;
  [v18 setCancellationHandler:v38];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000F3EC;
  v35[3] = &unk_100276518;
  void v35[4] = self;
  id v19 = v18;
  id v36 = v19;
  id v37 = v12;
  id v20 = v12;
  id v21 = objc_retainBlock(v35);
  if (!_CPLSilentLogging)
  {
    id v22 = sub_10000DE84();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Requesting initial download of main scope for %{public}@", buf, 0xCu);
    }
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10000F478;
  v30[3] = &unk_100276658;
  v30[4] = self;
  id v32 = v19;
  id v33 = v21;
  id v31 = v10;
  id v34 = v11;
  id v23 = v19;
  BOOL v24 = v21;
  [v23 performAsCurrentWithPendingUnitCount:1 usingBlock:v30];

LABEL_17:
}

- (void)initialDownloadHelper:(id)a3 checkActiveAccountWithCompletionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000FFB8;
  v11[3] = &unk_100275DF8;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000100AC;
  block[3] = &unk_100275DF8;
  id v14 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (CPLInitialDownloadHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPLInitialDownloadHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CPLEngineWrapperArray)wrappers
{
  return self->_wrappers;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wrappers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentLibraryIdentifier, 0);
}

@end