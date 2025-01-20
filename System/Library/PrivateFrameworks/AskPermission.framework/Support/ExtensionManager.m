@interface ExtensionManager
+ (id)sharedExtensionManager;
- (BOOL)_requestExtension:(id)a3 withItem:(id)a4 error:(id *)a5;
- (BOOL)checkDownloadQueueWithContentType:(int64_t)a3 error:(id *)a4;
- (BOOL)notifyWithResult:(id)a3 error:(id *)a4;
- (id)_extensionPassingTest:(id)a3 error:(id *)a4;
- (id)_extensionToCheckDownloadQueueWithContentType:(int64_t)a3 error:(id *)a4;
- (id)_extensionToNotifyWithResult:(id)a3 error:(id *)a4;
@end

@implementation ExtensionManager

+ (id)sharedExtensionManager
{
  if (qword_100042AE0 != -1) {
    dispatch_once(&qword_100042AE0, &stru_100038940);
  }
  v2 = (void *)qword_100042AE8;
  return v2;
}

- (BOOL)checkDownloadQueueWithContentType:(int64_t)a3 error:(id *)a4
{
  v6 = -[ExtensionManager _extensionToCheckDownloadQueueWithContentType:error:](self, "_extensionToCheckDownloadQueueWithContentType:error:", a3);
  if (!v6) {
    goto LABEL_3;
  }
  id v7 = objc_alloc_init((Class)NSExtensionItem);
  uint64_t v12 = APRequestExtensionContextUserInfoKeyCheckDownloadQueue;
  v13 = &__kCFBooleanTrue;
  BOOL v8 = 1;
  v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v7 setUserInfo:v9];

  unsigned __int8 v10 = [(ExtensionManager *)self _requestExtension:v6 withItem:v7 error:a4];
  if ((v10 & 1) == 0) {
LABEL_3:
  }
    BOOL v8 = 0;

  return v8;
}

- (BOOL)notifyWithResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ExtensionManager *)self _extensionToNotifyWithResult:v6 error:a4];
  if (!v7) {
    goto LABEL_3;
  }
  id v8 = objc_alloc_init((Class)NSExtensionItem);
  uint64_t v14 = APRequestExtensionContextUserInfoKeyResult;
  v9 = [v6 compile];
  v15 = v9;
  BOOL v10 = 1;
  v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v8 setUserInfo:v11];

  unsigned __int8 v12 = [(ExtensionManager *)self _requestExtension:v7 withItem:v8 error:a4];
  if ((v12 & 1) == 0) {
LABEL_3:
  }
    BOOL v10 = 0;

  return v10;
}

- (id)_extensionToCheckDownloadQueueWithContentType:(int64_t)a3 error:(id *)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000EE6C;
  v6[3] = &unk_100038960;
  v6[4] = a3;
  v4 = [(ExtensionManager *)self _extensionPassingTest:v6 error:a4];
  return v4;
}

- (id)_extensionToNotifyWithResult:(id)a3 error:(id *)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000EFCC;
  v9[3] = &unk_100038988;
  id v10 = a3;
  id v6 = v10;
  id v7 = [(ExtensionManager *)self _extensionPassingTest:v9 error:a4];

  return v7;
}

- (id)_extensionPassingTest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v22 = NSExtensionPointName;
  CFStringRef v23 = @"com.apple.askpermission-extension";
  id v6 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v7 = +[NSExtension extensionsWithMatchingAttributes:v6 error:a4];
  if (!v7)
  {
    id v10 = 0;
    goto LABEL_14;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000F330;
  v18[3] = &unk_1000389B0;
  id v19 = v5;
  id v8 = [v7 indexOfObjectPassingTest:v18];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000F380;
    v16[3] = &unk_1000389D8;
    v17 = @"com.apple.iTunesStoreUI.SUAskPermissionExtension";
    id v9 = [v7 indexOfObjectPassingTest:v16];
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {

      if (a4)
      {
        APError();
        id v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v10 = 0;
      }
      goto LABEL_13;
    }
    id v8 = v9;
    v11 = +[APLogConfig sharedDaemonConfig];
    if (!v11)
    {
      v11 = +[APLogConfig sharedConfig];
    }
    unsigned __int8 v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v21 = v13;
      id v14 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Found default extension", buf, 0xCu);
    }
  }
  id v10 = [v7 objectAtIndex:v8];
LABEL_13:

LABEL_14:
  return v10;
}

- (BOOL)_requestExtension:(id)a3 withItem:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v22 = v9;
  id v10 = +[NSArray arrayWithObjects:&v22 count:1];
  v11 = [v8 beginExtensionRequestWithOptions:0 inputItems:v10 error:a5];

  id v12 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (v13)
  {
    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000F668;
    v19[3] = &unk_100038A00;
    objc_copyWeak(&v20, &location);
    [v8 setRequestCompletionBlock:v19];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000F788;
    v17[3] = &unk_100038A28;
    objc_copyWeak(&v18, &location);
    [v8 setRequestCancellationBlock:v17];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000F8A8;
    v15[3] = &unk_100038A50;
    objc_copyWeak(&v16, &location);
    [v8 setRequestInterruptionBlock:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v13 != 0;
}

@end