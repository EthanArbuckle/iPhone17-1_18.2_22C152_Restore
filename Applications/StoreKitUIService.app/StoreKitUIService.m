void sub_1000056D8(id a1)
{
  uint64_t vars8;

  qword_1000672F8 = objc_alloc_init(SKClientBroker);

  _objc_release_x1();
}

void sub_100005764(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000058D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000058E8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _handleUnfinishedTransactionsNotification];
}

void sub_100005984(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005A04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005A84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005B04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005B84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005C04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005C84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005DC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005F50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005FFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000615C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006450(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000065CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000673C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000068AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006A1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006B68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006CB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007270()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10002D6E8();
  }
}

void sub_1000072B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10002D768();
    }
  }
  else if ([v5 count])
  {
    id v7 = *(id *)(*(void *)(a1 + 32) + 8);
    objc_sync_enter(v7);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectEnumerator];
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v12 updatedTransactions:v5];
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    objc_sync_exit(v7);
  }
}

void sub_100007450(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000075A0(id a1)
{
  qword_100067308 = objc_alloc_init(SKServiceBroker);

  _objc_release_x1();
}

uint64_t sub_1000076AC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100007794(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10000787C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100007964(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100007A4C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100007B34(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100007C1C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100007D04(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100007DEC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100007ED4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100007FBC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000080A4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10000818C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100008768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008794(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _serviceConnectionInvalidated];
}

void sub_1000087D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _serviceConnectionInvalidated];
}

uint64_t sub_100009208(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000976C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009788(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = sub_10000986C(v5);
  id v7 = (void *)v6;
  if ((id)v6 != v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if (v6)
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v10];
  }
  else
  {
    v8 = [v10 stringByAppendingString:@"_desc"];
    id v9 = [v5 description];
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v8];
  }
}

id sub_10000986C(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v2 = v1;
LABEL_4:
    id v3 = v2;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = +[SKUIErrorHelper errorWithSafeUserInfo:v1];
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = sub_100009B4C;
    v22 = sub_100009B5C;
    id v23 = 0;
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100009B64;
    v13[3] = &unk_10004CE40;
    v13[4] = &v18;
    v13[5] = &v14;
    [v1 enumerateObjectsUsingBlock:v13];
    if (v19[5])
    {
      id v5 = [v1 count];
      id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v5];
      uint64_t v6 = [v1 subarrayWithRange:0, v15[3]];
      [v3 addObjectsFromArray:v6];

      [v3 addObject:v19[5]];
      unint64_t v7 = v15[3] + 1;
      if (v7 < (unint64_t)v5)
      {
        do
        {
          v8 = [v1 objectAtIndexedSubscript:v7];
          id v9 = sub_10000986C();
          id v10 = v9;
          if (v9)
          {
            id v11 = v9;
          }
          else
          {
            id v11 = [v8 description];
          }
          v12 = v11;

          [v3 addObject:v12];
          ++v7;
        }
        while (v5 != (id)v7);
      }
    }
    else
    {
      id v3 = v1;
    }
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v3 = 0;
  }
LABEL_5:

  return v3;
}

void sub_100009B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009B4C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009B5C(uint64_t a1)
{
}

void sub_100009B64(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  sub_10000986C();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v9)
  {
    uint64_t v8 = v7;
    if (!v7)
    {
      uint64_t v8 = [v9 description];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v8);
    if (!v7) {

    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

uint64_t start(int a1, char **a2)
{
  if (+[objc_LockscreenStatus isDeviceUnlocked])
  {
    +[SKUIApplicationController prepareForLaunch];
    id v5 = +[AVAudioSession sharedInstance];
    [v5 setCategory:AVAudioSessionCategoryPlayback error:0];

    uint64_t v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = UIApplicationMain(a1, a2, 0, v7);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10002D7E8();
    }
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  return v8;
}

void sub_100009FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009FE0(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setConsentProvided:v3];

  [WeakRetained _dismissViewService];
}

void sub_10000A328(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 deactivate];
}

NSString *sub_10000AB14(uint64_t a1)
{
  return +[NSString stringWithFormat:@"com.apple.storekit.unfinishedtransactions.%@", a1];
}

__CFString *sub_10000AB4C(unint64_t a1)
{
  if (a1 >= 4)
  {
    id v1 = +[NSString stringWithFormat:@"Unknown: %ld", a1];
  }
  else
  {
    id v1 = off_10004D1D0[a1];
  }

  return v1;
}

BOOL sub_10000ABB0(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

id sub_10000B288(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

void sub_10000BE48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000BE64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    uint64_t v8 = +[SSLogConfig sharedConfig];
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v22 = 138543618;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      id v25 = v6;
      id v12 = v23;
      LODWORD(v17) = 22;
      long long v13 = (void *)_os_log_send_and_compose_impl();

      if (v13)
      {
        uint64_t v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v22, v17);
        free(v13);
        SSFileLog();
      }
    }
    else
    {
    }
    [WeakRetained _loadDidFailWithError:v6];
  }
  else
  {
    long long v15 = [[ServiceClientContext alloc] initWithConfigurationDictionary:v5];
    uint64_t v16 = *(void *)(a1 + 32);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000C0FC;
    v18[3] = &unk_10004D220;
    id v19 = WeakRetained;
    objc_copyWeak(&v21, (id *)(a1 + 48));
    uint64_t v20 = *(void *)(a1 + 40);
    [v19 _buildReviewInAppConfigurationWithParameters:v16 clientContext:v15 completionHandler:v18];
    objc_destroyWeak(&v21);
  }
}

void sub_10000C0E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000C0FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [objc_alloc((Class)SKUIReviewInAppController) initWithConfiguration:v3];
    [*(id *)(a1 + 32) setReviewInAppController:v4];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000C370;
    v15[3] = &unk_10004D1F8;
    objc_copyWeak(&v16, (id *)(a1 + 48));
    v15[4] = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) reviewInAppController];
    [v5 setCompletion:v15];

    id v6 = [*(id *)(a1 + 32) reviewInAppController];
    [v6 start];

    objc_destroyWeak(&v16);
  }
  else
  {
    id v7 = +[SSLogConfig sharedConfig];
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    int v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v17 = 138543362;
      id v18 = (id)objc_opt_class();
      id v11 = v18;
      LODWORD(v14) = 12;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (v12)
      {
        long long v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v17, v14);
        free(v12);
        SSFileLog();
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) _loadDidFailWithError:0];
  }
}

void sub_10000C350(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000C370(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  switch(a2)
  {
    case 0:
      [WeakRetained _loadDidFailWithError:v5];
      break;
    case 1:
      unsigned int v8 = [WeakRetained _clientViewControllerProxy];
      int v9 = v8;
      int v10 = &off_100050B50;
      goto LABEL_5;
    case 2:
      unsigned int v8 = [WeakRetained _clientViewControllerProxy];
      int v9 = v8;
      int v10 = &off_100050B38;
LABEL_5:
      [v8 didFinishWithResult:v10 error:0];

      break;
    case 3:
      id v11 = +[NSBundle bundleForClass:objc_opt_class()];
      id v12 = +[UIImage imageNamed:@"toast-review" inBundle:v11];

      id v13 = objc_alloc((Class)SKUIToastViewController);
      uint64_t v14 = +[NSBundle bundleForClass:objc_opt_class()];
      long long v15 = [v14 localizedStringForKey:@"TOAST_REVIEW_FINISHED_PRIMARY" value:&stru_10004DF18 table:0];
      id v16 = +[NSBundle bundleForClass:objc_opt_class()];
      int v17 = [v16 localizedStringForKey:@"TOAST_REVIEW_FINISHED_SECONDARY" value:&stru_10004DF18 table:0];
      id v18 = [v13 initWithTitle:v15 description:v17 image:v12];

      uint64_t v19 = *(void *)(a1 + 32);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10000C5E0;
      v20[3] = &unk_10004CEB0;
      id v21 = v7;
      [v18 presentFromViewController:v19 completion:v20];

      break;
    default:
      break;
  }
}

void sub_10000C5E0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _clientViewControllerProxy];
  [v1 didFinishWithResult:&off_100050B20 error:0];
}

void sub_10000C6E4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _clientViewControllerProxy];
  [v1 didFinishWithResult:&off_100050B50 error:0];
}

void sub_10000CBB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SSLogConfig sharedConfig];
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_9;
  }
  *(_DWORD *)id v11 = 138412546;
  *(void *)&v11[4] = objc_opt_class();
  *(_WORD *)&v11[12] = 2112;
  *(void *)&v11[14] = v3;
  id v8 = *(id *)&v11[4];
  LODWORD(v10) = 22;
  int v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    id v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, v11, v10, *(_OWORD *)v11, *(void *)&v11[16]);
    free(v9);
    SSFileLog();
LABEL_9:
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000CD4C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    int v6 = [a2 objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = [*(id *)(a1 + 48) localizedName];
      int v9 = [v7 _inAppConfigurationWithItemID:v6 title:v8 icon:*(void *)(a1 + 56) sandboxed:*(unsigned __int8 *)(a1 + 80) clientContext:*(void *)(a1 + 64)];

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_24:

      goto LABEL_25;
    }
    id v16 = +[SSLogConfig sharedConfig];
    unsigned int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    uint64_t v19 = [v16 OSLogObject];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      v18 &= 2u;
    }
    if (v18)
    {
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = *(void *)(a1 + 40);
      *(_DWORD *)id v25 = 138412546;
      *(void *)&v25[4] = v20;
      *(_WORD *)&v25[12] = 2112;
      *(void *)&v25[14] = v21;
      id v22 = v20;
      LODWORD(v24) = 22;
      id v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
LABEL_23:

        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
        goto LABEL_24;
      }
      uint64_t v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, v25, v24, *(void *)v25, *(_OWORD *)&v25[8]);
      free(v23);
      SSFileLog();
    }

    goto LABEL_23;
  }
  uint64_t v10 = +[SSLogConfig sharedConfig];
  unsigned int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  id v13 = [v10 OSLogObject];
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    v12 &= 2u;
  }
  if (!v12) {
    goto LABEL_12;
  }
  *(_DWORD *)id v25 = 138412546;
  *(void *)&v25[4] = objc_opt_class();
  *(_WORD *)&v25[12] = 2112;
  *(void *)&v25[14] = v5;
  id v14 = *(id *)&v25[4];
  LODWORD(v24) = 22;
  long long v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    id v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, v25, v24, *(_OWORD *)v25, *(void *)&v25[16]);
    free(v15);
    SSFileLog();
LABEL_12:
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_25:
}

void sub_10000D5B4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _clientViewControllerProxy];
  [v2 didFinishWithResult:&off_100050B68 error:*(void *)(a1 + 40)];
}

id sub_10000DB18(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

void sub_10000E224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E24C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _privacyViewControllerDidFinishWithResult:a2];
}

void sub_10000E47C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E4A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismiss];
}

void sub_10000E5A8(id a1)
{
  uint64_t v4 = SSPrivacyIdentifierMusicStore;
  id v1 = +[UIColor systemPinkColor];
  id v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  id v3 = (void *)qword_100067318;
  qword_100067318 = v2;
}

id sub_10000E7D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

void sub_10000E9A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E9C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAcknowledgementReceived:1];
  [WeakRetained splashDoneButtonPressed:0];
}

void sub_10000EA88(id a1)
{
  qword_100067328 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", SSPrivacyIdentifierMusicStore, 0);

  _objc_release_x1();
}

void sub_10000ECEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000ED08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (xpc_dictionary_get_int64(v5, "0") != -1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000EDF8;
    block[3] = &unk_10004D350;
    objc_copyWeak(&v10, (id *)(a1 + 32));
    id v8 = v5;
    id v9 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v10);
  }
}

void sub_10000EDF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleMessage:*(void *)(a1 + 32) connection:*(void *)(a1 + 40)];
}

void sub_10000EF18(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EF90;
  block[3] = &unk_10004CEB0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000EF90(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeReceiverConnection];
}

void sub_10000F080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F09C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F12C;
  block[3] = &unk_10004CDC8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_10000F12C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _disconnect];
}

void sub_10000F898(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setHostApplicationIdentifier:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void sub_1000107D0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) presentedViewController];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) proxyHandler];
    [v4 dismissViewController];
  }
}

BOOL sub_100010BA0(_OWORD *a1, const __CFString *a2)
{
  long long v3 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v3;
  id v4 = SecTaskCreateWithAuditToken(0, &token);
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  CFErrorRef error = 0;
  CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, a2, &error);
  if (error)
  {
    id v7 = +[SSLogConfig sharedConfig];
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      int v11 = v9;
    }
    else {
      int v11 = v9 & 2;
    }
    if (v11)
    {
      token.val[0] = 138412290;
      *(void *)&token.val[1] = error;
      LODWORD(v16) = 12;
      int v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_13:

        CFRelease(error);
        goto LABEL_14;
      }
      id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &token, v16);
      free(v12);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  if (v6)
  {
    CFTypeID v13 = CFGetTypeID(v6);
    BOOL v14 = v13 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v6) != 0;
    CFRelease(v6);
  }
  else
  {
    BOOL v14 = 0;
  }
  CFRelease(v5);
  return v14;
}

id sub_10001140C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

void sub_100012110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

intptr_t sub_100012150(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100012158(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012168(uint64_t a1)
{
}

void sub_100012170(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 isEqualToString:@"bundleId"])
  {
    uint64_t v6 = *(void *)(a1 + 32);
  }
  else
  {
    if (![v7 isEqualToString:@"productIdentifier"]) {
      goto LABEL_6;
    }
    uint64_t v6 = *(void *)(a1 + 40);
  }
  objc_storeStrong((id *)(*(void *)(v6 + 8) + 40), a3);
LABEL_6:
}

void sub_1000127F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012818(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000128D4;
  v5[3] = &unk_10004D460;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_1000128D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showViewControllerForAlertProxy:*(void *)(a1 + 32)];
}

id sub_100012F5C(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 16) _dismissViewController];
}

void sub_100013480(id a1)
{
  qword_100067338 = objc_alloc_init(ServiceBridgedPresentationController);

  _objc_release_x1();
}

void sub_1000137E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001380C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000138C8;
  v5[3] = &unk_10004D460;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_1000138C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showAlertForAlertProxy:*(void *)(a1 + 32)];
}

void sub_10001400C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100014034(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) defaultButton];
  BOOL v7 = v6 == v5;

  unsigned int v8 = *(void **)(*(void *)(a1 + 40) + 8);
  int v9 = [v5 buttonTitle];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100014148;
  v10[3] = &unk_10004D4D0;
  objc_copyWeak(v11, (id *)(a1 + 48));
  v11[1] = a3;
  [v8 _addActionWithTitle:v9 style:v7 handler:v10];

  objc_destroyWeak(v11);
}

void sub_100014134(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100014148(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishWithButtonIndex:*(void *)(a1 + 40)];
}

void sub_100014C78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100014C94(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained addChildViewController:a1[4]];
  uint64_t v2 = [a1[4] view];
  id v3 = [WeakRetained view];
  [v3 bounds];
  [v2 setFrame:];

  id v4 = [WeakRetained view];
  [v4 addSubview:v2];

  [a1[4] didMoveToParentViewController:WeakRetained];
  [a1[5] _startIfReady];
}

id sub_100015774()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100067348;
  uint64_t v7 = qword_100067348;
  if (!qword_100067348)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001699C;
    v3[3] = &unk_10004D570;
    v3[4] = &v4;
    sub_10001699C((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100015840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015858(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(unsigned char **)(a1 + 32);
  v4[50] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100015990;
  v10[3] = &unk_10004D2C0;
  id v11 = v3;
  int v12 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015A44;
  v7[3] = &unk_10004D520;
  id v8 = v11;
  id v9 = *(id *)(a1 + 40);
  id v5 = v11;
  uint64_t v6 = v4;
  +[UIView animateWithDuration:v10 animations:v7 completion:0.349999994];
}

void sub_100015990(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) view];
  [v11 frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  id v8 = [*(id *)(a1 + 40) view];
  [v8 frame];
  double MaxY = CGRectGetMaxY(v13);

  id v10 = [*(id *)(a1 + 32) view];
  [v10 setFrame:v3 MaxY:v5 v7];
}

uint64_t sub_100015A44(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  double v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  double v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void sub_100016064(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setDelegate:0];
  [*(id *)(*(void *)(a1 + 32) + 16) _stopApplication];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

Class sub_10001699C(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100067350)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100016AE0;
    v4[4] = &unk_10004D5A8;
    v4[5] = v4;
    long long v5 = off_10004D590;
    uint64_t v6 = 0;
    qword_100067350 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_100067350)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MSOnboardingUtil");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_10002DB8C();
LABEL_8:
    free(v2);
  }
  qword_100067348 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100016AE0()
{
  uint64_t result = _sl_dlopen();
  qword_100067350 = result;
  return result;
}

void sub_100016B6C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100017AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100017AD8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2)
  {
    double v7 = +[SSLogConfig sharedConfig];
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      *(_DWORD *)long long v15 = 138543618;
      *(void *)&v15[4] = objc_opt_class();
      *(_WORD *)&v15[12] = 2112;
      *(void *)&v15[14] = v5;
      id v11 = *(id *)&v15[4];
      LODWORD(v14) = 22;
      CGRect v13 = v15;
      int v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        goto LABEL_12;
      }
      id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v15, v14, *(_OWORD *)v15, *(void *)&v15[16]);
      free(v12);
      CGRect v13 = v10;
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  [WeakRetained _loadURLWithActiveConfiguration:*(void *)(a1 + 32) v13];
}

void sub_100018030(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained presentingBridgedViewController];
  [v1 dismissAnimated:0];
}

void sub_100018904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001891C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001892C(uint64_t a1)
{
}

void sub_100018934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void sub_10001967C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1000196A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019778;
  block[3] = &unk_10004D620;
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100019778(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = +[SSLogConfig sharedConfig];
    unsigned int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    unsigned int v17 = [v14 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (v16)
    {
      *(_DWORD *)uint64_t v21 = 138543618;
      *(void *)&v21[4] = objc_opt_class();
      *(_WORD *)&v21[12] = 2112;
      *(void *)&v21[14] = @"paymentsAndShippingUrl";
      id v18 = *(id *)&v21[4];
      LODWORD(v20) = 22;
      uint64_t v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_16:

        [v2 _presentErrorViewControllerWithError:*(void *)(a1 + 48)];
        goto LABEL_17;
      }
      unsigned int v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, v21, v20, *(_OWORD *)v21, *(void *)&v21[16]);
      free(v19);
      SSFileLog();
    }

    goto LABEL_16;
  }
  id v3 = [objc_alloc((Class)NSURL) initWithString:*(void *)(a1 + 40)];
  id v4 = [objc_alloc((Class)SUAccountViewController) initWithExternalAccountURL:v3];
  id v5 = [v2 account];
  [v4 setAccount:v5];

  if (objc_opt_respondsToSelector()) {
    [v4 setShowAccountGlyph:[v2 showAccountGlyph]];
  }
  id v6 = [v2 clientInterface];
  [v6 setShowDialogOnError:1];

  id v7 = [v2 clientInterface];
  [v4 setClientInterface:v7];

  id v8 = [v4 authenticationContext];
  id v9 = [v8 mutableCopy];

  if (!v9)
  {
    id v10 = objc_alloc((Class)SSMutableAuthenticationContext);
    id v11 = objc_alloc((Class)SSAccount);
    id v12 = [v2 account];
    id v13 = [v11 initWithBackingAccount:v12];
    id v9 = [v10 initWithAccount:v13];
  }
  [v9 setDisplaysOnLockScreen:1];
  [v4 setAuthenticationContext:v9];
  [v4 setStyle:0];
  [v2 setPresentedAccountViewController:v4];
  [v2 _presentViewController:v4];

LABEL_17:
}

void sub_100019AB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [v6 allItems];

  id v9 = [v8 firstObject];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019BB4;
  block[3] = &unk_10004D620;
  id v13 = v5;
  id v14 = v9;
  id v15 = WeakRetained;
  id v10 = v9;
  id v11 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100019BB4(uint64_t a1)
{
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    uint64_t v2 = *(void **)(a1 + 48);
    [v2 dismissHostViewControllerWithResult:0];
  }
  else
  {
    id v3 = objc_alloc((Class)SKUIItem);
    id v4 = [*(id *)(a1 + 40) lookupDictionary];
    id v8 = [v3 initWithLookupDictionary:v4];

    id v5 = [objc_alloc((Class)SKUIGift) initWithItem:v8];
    id v6 = [[ServiceSKUIGiftViewController alloc] initWithGift:v5];
    id v7 = +[ServiceClientContext defaultContext];
    [(ServiceSKUIGiftViewController *)v6 setClientContext:v7];

    [(ServiceSKUIGiftViewController *)v6 setEmbeddedParent:*(void *)(a1 + 48)];
    [*(id *)(a1 + 48) setUnderlyingViewController:v6];
    [*(id *)(a1 + 48) setChildViewController:v6];
  }
}

void sub_100019E6C(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:*(void *)(a1 + 32) action:"_cancelButtonAction:"];
    [v5 setTag:999];
    unsigned int v2 = [*(id *)(a1 + 32) showAccountGlyph];
    id v3 = [*(id *)(a1 + 40) navigationItem];
    id v4 = v3;
    if (v2) {
      [v3 setRightBarButtonItem:v5 animated:1];
    }
    else {
      [v3 setLeftBarButtonItem:v5 animated:1];
    }
  }
}

void sub_10001A104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001A12C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained dismissHostViewControllerWithResult:0 error:*(void *)(a1 + 32)];
}

void sub_10001AC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001AC88()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100067358;
  uint64_t v7 = qword_100067358;
  if (!qword_100067358)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001B8D0;
    v3[3] = &unk_10004D570;
    v3[4] = &v4;
    sub_10001B8D0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10001AD54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001AF8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001AFA4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001AFB8(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 integerValue];
    if (v3 == (id)1) {
      id v4 = 0;
    }
    else {
      id v4 = v3;
    }
  }
  else
  {
    id v4 = 0;
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B064;
  v5[3] = &unk_10004D698;
  id v6 = *(id *)(a1 + 32);
  id v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

uint64_t sub_10001B064(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

id sub_10001B154(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

void sub_10001B2AC(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _viewControllerForType:a2];
  id v3 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
  [v3 setModalPresentationStyle:4];
  [v3 setTransitioningDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setUnderlyingViewController:v3];
  [*(id *)(a1 + 32) presentViewController:v3 animated:1 completion:0];
}

Class sub_10001B8D0(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100067360)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10001BA14;
    v4[4] = &unk_10004D5A8;
    v4[5] = v4;
    long long v5 = off_10004D708;
    uint64_t v6 = 0;
    qword_100067360 = _sl_dlopen();
    unsigned int v2 = (void *)v4[0];
    if (!qword_100067360)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AMSUIWebViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    unsigned int v2 = (void *)sub_10002DBB4();
LABEL_8:
    free(v2);
  }
  qword_100067358 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10001BA14()
{
  uint64_t result = _sl_dlopen();
  qword_100067360 = result;
  return result;
}

void sub_10001BA88(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AMSBag");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100067368 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10002DBDC();
    sub_10001BAE0();
  }
}

void sub_10001BAE0()
{
  v1[0] = 0;
  if (!qword_100067370)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_10001BBDC;
    v1[4] = &unk_10004D5A8;
    v1[5] = v1;
    long long v2 = off_10004D720;
    uint64_t v3 = 0;
    qword_100067370 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_100067370)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_10001BBDC()
{
  uint64_t result = _sl_dlopen();
  qword_100067370 = result;
  return result;
}

Class sub_10001BC50(uint64_t a1)
{
  sub_10001BAE0();
  Class result = objc_getClass("AMSURLParser");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100067378 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)sub_10002DC04();
    return (Class)+[ServiceHostRegistry sharedInstance];
  }
  return result;
}

void sub_10001BCFC(id a1)
{
  qword_100067380 = objc_alloc_init(ServiceHostRegistry);

  _objc_release_x1();
}

void sub_10001C668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001C6A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  SEL v4 = +[SSLogConfig sharedConfig];
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (!v8) {
    goto LABEL_10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = objc_opt_class();
  uint64_t v11 = *(void *)(a1 + 32);
  id v19 = v10;
  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = [v12 _hostApplicationBundleIdentifier];
  uint64_t v14 = *(void *)(a1 + 48);
  int v20 = 138544130;
  uint64_t v21 = v10;
  __int16 v22 = 2114;
  uint64_t v23 = v11;
  __int16 v24 = 2112;
  id v25 = v13;
  __int16 v26 = 2048;
  uint64_t v27 = v14;
  LODWORD(v18) = 42;
  id v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    id v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v20, v18);
    free(v15);
    SSFileLog();
LABEL_10:
  }
  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v17 = [v16 _hostApplicationBundleIdentifier];
  [v3 setupWithClientBundleID:v17 bagType:*(void *)(a1 + 48)];
}

void sub_10001CC44(id a1, ServiceProductPage *a2)
{
}

void sub_10001CD00(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _clientViewControllerProxy];
  [v1 didFinishDismissal];
}

id sub_10001CDD8(uint64_t a1, void *a2)
{
  return _[a2 finishStarRatingPromptWithRating:*(void *)(a1 + 32)];
}

void sub_10001CF20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 32) && !*(void *)(v1 + 24))
  {
    id v7 = [*(id *)(a1 + 40) navigationItem];
    id v3 = objc_alloc((Class)UIBarButtonItem);
    SEL v4 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v5 = [v4 localizedStringForKey:@"CANCEL" value:&stru_10004DF18 table:0];
    id v6 = [v3 initWithTitle:v5 style:0 target:*(void *)(a1 + 32) action:"_cancelButtonAction:"];
    [v7 setLeftBarButtonItem:v6 animated:1];
  }
}

id sub_10001D0EC(uint64_t a1, void *a2)
{
  return _[a2 loadProductWithPageDictionary:*(void *)(a1 + 32)];
}

void sub_10001D43C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001D458(id *a1, unint64_t a2, uint64_t a3)
{
  id v6 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  int v8 = WeakRetained;
  if (a2 > 1)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001D5E8;
    v9[3] = &unk_10004D350;
    objc_copyWeak(&v12, v6);
    id v10 = a1[4];
    id v11 = a1[5];
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

    objc_destroyWeak(&v12);
  }
  else
  {
    [WeakRetained _respondWithSuccess:a3 == 0];
    if (a3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001D5C4;
      block[3] = &unk_10004CEB0;
      id v14 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

id sub_10001D5C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupErrorViewController];
}

void sub_10001D5E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _showLegacyControllerForProductID:*(void *)(a1 + 32) parameters:*(void *)(a1 + 40)];
}

void sub_10001D948(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001D96C(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = +[SSLogConfig sharedConfig];
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  id v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    v8 &= 2u;
  }
  if (!v8) {
    goto LABEL_9;
  }
  id v10 = objc_opt_class();
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v15 = v10;
  [WeakRetained _hostApplicationBundleIdentifier];
  int v16 = 138544130;
  unsigned int v17 = v10;
  __int16 v18 = 2114;
  uint64_t v19 = v12;
  __int16 v20 = 2112;
  uint64_t v21 = v11;
  __int16 v22 = 2112;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 42;
  id v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v16, v14);
    free(v13);
    SSFileLog();
LABEL_9:
  }
  [v4 loadProductWithRequest:*(void *)(a1 + 40)];
}

id sub_10001E0E0(uint64_t a1, void *a2)
{
  return _[a2 setAdditionalBuyParameters:*(void *)(a1 + 32)];
}

id sub_10001E2F0(uint64_t a1, void *a2)
{
  return _[a2 setAffiliateIdentifier:*(void *)(a1 + 32)];
}

void sub_10001E518(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v3 setAskToBuy:[v2 BOOLValue]];
}

id sub_10001E774(uint64_t a1, void *a2)
{
  return _[a2 setCancelButtonTitle:*(void *)(a1 + 32)];
}

id sub_10001E984(uint64_t a1, void *a2)
{
  return [a2 setClientIdentifier:*(void *)(a1 + 32)];
}

id sub_10001ED58(uint64_t a1, void *a2)
{
  return [a2 setProductPageStyle:*(void *)(a1 + 32)];
}

id sub_10001EF68(uint64_t a1, void *a2)
{
  return _[a2 setPromptString:*(void *)(a1 + 32)];
}

id sub_10001F178(uint64_t a1, void *a2)
{
  return _[a2 setRightBarButtonTitle:*(void *)(a1 + 32)];
}

id sub_10001F388(uint64_t a1, void *a2)
{
  return _[a2 setScriptContextDictionary:*(void *)(a1 + 32)];
}

id sub_10001F5A4(uint64_t a1, void *a2)
{
  return [a2 setPreview:*(void *)(a1 + 32)];
}

id sub_10001F958(uint64_t a1, void *a2)
{
  return _[a2 setUsageContext:*(void *)(a1 + 32)];
}

void sub_10001FB68(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v3 setShowsRightBarButton:[v2 BOOLValue]];
}

void sub_10001FDC4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v3 setShowsStoreButton:[v2 BOOLValue]];
}

id sub_10001FED4(uint64_t a1, void *a2)
{
  return [a2 setVisibleInClientWindow:*(void *)(a1 + 32)];
}

void sub_10002010C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_100020138(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020244;
  v5[3] = &unk_10004D868;
  objc_copyWeak(&v11, a1 + 8);
  id v6 = v3;
  id v7 = a1[4];
  id v10 = a1[7];
  id v8 = a1[5];
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v11);
}

void sub_100020244(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100020354;
  v6[3] = &unk_10004D840;
  objc_copyWeak(&v10, v2);
  id v9 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [WeakRetained _requestRemoteViewControllerForItem:v4 withParameters:v5 completion:v6];

  objc_destroyWeak(&v10);
}

void sub_100020340(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100020354(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a2 == 1)
  {
    uint64_t v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      v7 &= 2u;
    }
    if (v7)
    {
      id v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)int v16 = 138543874;
      *(void *)&v16[4] = v9;
      *(_WORD *)&v16[12] = 2114;
      *(void *)&v16[14] = v10;
      *(_WORD *)&v16[22] = 2114;
      uint64_t v17 = v11;
      id v12 = v9;
      LODWORD(v15) = 32;
      id v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_12:

        uint64_t v14 = +[NSError errorWithDomain:SKErrorDomain code:0 userInfo:0];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        goto LABEL_13;
      }
      id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, v16, v15, *(_OWORD *)v16, *(void *)&v16[16], v17);
      free(v13);
      SSFileLog();
    }

    goto LABEL_12;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_13:
}

void sub_100020568(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = [v3 domain];
  if (![v5 isEqualToString:SKErrorDomain])
  {

LABEL_14:
    int v7 = +[SSLogConfig sharedConfig];
    unsigned int v16 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    __int16 v18 = [v7 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (v17)
    {
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)__int16 v24 = 138543874;
      *(void *)&v24[4] = v19;
      *(_WORD *)&v24[12] = 2114;
      *(void *)&v24[14] = v20;
      *(_WORD *)&v24[22] = 2114;
      id v25 = v3;
      id v21 = v19;
      LODWORD(v23) = 32;
      __int16 v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22) {
        goto LABEL_23;
      }
      __int16 v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, v24, v23, *(void *)v24, *(_OWORD *)&v24[8], v25);
      free(v22);
      SSFileLog();
    }

    goto LABEL_23;
  }
  id v6 = [v3 code];

  if (v6 != (id)5) {
    goto LABEL_14;
  }
  int v7 = +[SSLogConfig sharedConfig];
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  uint64_t v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_11;
  }
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(a1 + 40);
  *(_DWORD *)__int16 v24 = 138543874;
  *(void *)&v24[4] = v11;
  *(_WORD *)&v24[12] = 2114;
  *(void *)&v24[14] = v12;
  *(_WORD *)&v24[22] = 2114;
  id v25 = v13;
  id v14 = v11;
  LODWORD(v23) = 32;
  uint64_t v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    uint64_t v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, v24, v23, *(_OWORD *)v24, *(void *)&v24[16], v25);
    free(v15);
    SSFileLog();
LABEL_11:
  }
LABEL_23:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100020C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100020C50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  unsigned int v8 = [v6 allItems];

  if ([v8 count])
  {
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = (void *)v9;
    if (!v5)
    {
      if (v9)
      {
        uint64_t v11 = *(void *)(a1 + 56);
LABEL_27:
        id v21 = *(void (**)(void))(v11 + 16);
        goto LABEL_28;
      }
LABEL_17:
      __int16 v22 = +[SSLogConfig sharedConfig];
      unsigned int v23 = [v22 shouldLog];
      if ([v22 shouldLogToDisk]) {
        int v24 = v23 | 2;
      }
      else {
        int v24 = v23;
      }
      id v25 = [v22 OSLogObject];
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        v24 &= 2u;
      }
      if (v24)
      {
        __int16 v26 = objc_opt_class();
        uint64_t v27 = *(void *)(a1 + 32);
        uint64_t v28 = *(void *)(a1 + 40);
        *(_DWORD *)v32 = 138543874;
        *(void *)&v32[4] = v26;
        *(_WORD *)&v32[12] = 2114;
        *(void *)&v32[14] = v27;
        *(_WORD *)&v32[22] = 2114;
        uint64_t v33 = v28;
        id v29 = v26;
        LODWORD(v31) = 32;
        v30 = (void *)_os_log_send_and_compose_impl();

        if (!v30)
        {
LABEL_26:

          uint64_t v10 = +[NSError errorWithDomain:SKErrorDomain code:5 userInfo:0];
          uint64_t v11 = *(void *)(a1 + 48);
          goto LABEL_27;
        }
        id v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, v32, v31, *(void *)v32, *(_OWORD *)&v32[8], v33);
        free(v30);
        SSFileLog();
      }

      goto LABEL_26;
    }
  }
  else
  {
    if (!v5) {
      goto LABEL_17;
    }
    uint64_t v10 = 0;
  }
  uint64_t v12 = +[SSLogConfig sharedConfig];
  unsigned int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  uint64_t v15 = [v12 OSLogObject];
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    v14 &= 2u;
  }
  if (!v14) {
    goto LABEL_15;
  }
  unsigned int v16 = objc_opt_class();
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  *(_DWORD *)v32 = 138544130;
  *(void *)&v32[4] = v16;
  *(_WORD *)&v32[12] = 2114;
  *(void *)&v32[14] = v17;
  *(_WORD *)&v32[22] = 2114;
  uint64_t v33 = v18;
  LOWORD(v34) = 2114;
  *(void *)((char *)&v34 + 2) = v5;
  id v19 = v16;
  LODWORD(v31) = 42;
  uint64_t v20 = (void *)_os_log_send_and_compose_impl();

  if (v20)
  {
    uint64_t v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, v32, v31, *(_OWORD *)v32, *(void *)&v32[16], v33, v34);
    free(v20);
    SSFileLog();
LABEL_15:
  }
  id v21 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_28:
  v21();
}

void sub_100021210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL sub_10002123C(id a1, BOOL a2)
{
  return 0;
}

void sub_100021244(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100021350;
  v5[3] = &unk_10004D998;
  objc_copyWeak(&v11, a1 + 8);
  id v10 = a1[7];
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v11);
}

void sub_100021350(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = sub_10002171C;
    v32 = sub_10002172C;
    id v33 = 0;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100021734;
    v25[3] = &unk_10004D948;
    id v4 = *(void **)(a1 + 32);
    id v26 = *(id *)(a1 + 40);
    uint64_t v27 = &v28;
    [v4 enumerateObjectsUsingBlock:v25];
    [WeakRetained _makeItemKindEventForItem:*(void *)(a1 + 40) extension:v29[5]];
    uint64_t v5 = v29[5];
    if (v5)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100021A88;
      v18[3] = &unk_10004D970;
      objc_copyWeak(&v24, v2);
      unsigned int v23 = &v28;
      id v19 = *(id *)(a1 + 48);
      id v22 = *(id *)(a1 + 64);
      id v20 = *(id *)(a1 + 40);
      id v21 = *(id *)(a1 + 56);
      uint64_t v6 = +[ServiceResilientRemoteViewContainerViewController instantiateWithExtension:v5 completion:v18];
      id v7 = (void *)WeakRetained[9];
      WeakRetained[9] = v6;

      objc_destroyWeak(&v24);
LABEL_14:

      _Block_object_dispose(&v28, 8);
      goto LABEL_15;
    }
    id v8 = +[SSLogConfig sharedConfig];
    unsigned int v9 = [v8 shouldLog];
    unsigned int v10 = [v8 shouldLogToDisk];
    id v11 = [v8 OSLogObject];
    uint64_t v12 = v11;
    if (v10) {
      v9 |= 2u;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      unsigned int v13 = objc_opt_class();
      uint64_t v14 = *(void *)(a1 + 48);
      int v34 = 138543618;
      v35 = v13;
      __int16 v36 = 2114;
      uint64_t v37 = v14;
      id v15 = v13;
      LODWORD(v17) = 22;
      unsigned int v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_13:

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        goto LABEL_14;
      }
      uint64_t v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v34, v17);
      free(v16);
      SSFileLog();
    }

    goto LABEL_13;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_15:
}

void sub_1000216D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_10002171C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002172C(uint64_t a1)
{
}

void sub_100021734(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = [v7 infoDictionary];
  unsigned int v9 = [v8 objectForKey:@"SKProductPageExtensionSupportedItemKinds"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v36 = v9;
    id v10 = +[NSArray arrayWithObjects:&v36 count:1];
LABEL_5:
    id v11 = v10;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    goto LABEL_5;
  }
  id v11 = 0;
LABEL_7:
  uint64_t v12 = [*(id *)(a1 + 32) itemKind];
  unsigned int v13 = [v11 containsObject:v12];

  if (v13)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
  uint64_t v14 = [*(id *)(a1 + 32) itemDictionary];
  id v15 = [v14 objectForKeyedSubscript:@"offerName"];

  unsigned int v16 = [*(id *)(a1 + 32) itemKind];
  if ([v16 isEqualToString:@"appSubscriptionBundle"])
  {
  }
  else
  {
    uint64_t v17 = [*(id *)(a1 + 32) itemKind];
    unsigned int v18 = [v17 isEqualToString:@"softwareAddOn"];

    if (!v18) {
      goto LABEL_28;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = [v7 infoDictionary];
    id v20 = [v19 objectForKey:@"SKProductPageExtensionSupportedOfferPrefixes"];

    objc_opt_class();
    uint64_t v28 = v11;
    id v29 = v7;
    uint64_t v27 = v20;
    if (objc_opt_isKindOfClass())
    {
      v35 = v20;
      id v21 = +[NSArray arrayWithObjects:&v35 count:1];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v21 = v20;
      }
      else {
        id v21 = 0;
      }
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v22 = v21;
    id v23 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          if ([v15 hasPrefix:*(void *)(*((void *)&v30 + 1) + 8 * i)])
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
            *a4 = 1;
          }
        }
        id v24 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v24);
    }

    id v11 = v28;
    id v7 = v29;
  }
LABEL_28:
}

void sub_100021A88(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  unsigned int v9 = (id *)(a1 + 72);
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained setExtension:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [WeakRetained setExtensionRequest:v10];

  if (!v7 || v8)
  {
    unsigned int v13 = +[SSLogConfig sharedConfig];
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    unsigned int v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      v15 &= 2u;
    }
    if (v15)
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = *(void *)(a1 + 32);
      int v25 = 138543874;
      id v26 = v17;
      __int16 v27 = 2114;
      uint64_t v28 = v18;
      __int16 v29 = 2114;
      id v30 = v8;
      id v19 = v17;
      LODWORD(v21) = 32;
      id v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_14:

        [WeakRetained _cleanUpExtension];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        goto LABEL_15;
      }
      unsigned int v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v25, v21);
      free(v20);
      SSFileLog();
    }

    goto LABEL_14;
  }
  [WeakRetained _didReceiveRemoteViewController:v7 forItem:*(void *)(a1 + 40) withParameters:*(void *)(a1 + 48)];
  if (*(void *)(a1 + 56))
  {
    [WeakRetained setRemoteLoadDidFinishCompletion:];
    dispatch_time_t v12 = dispatch_time(0, 10000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021D4C;
    block[3] = &unk_10004D460;
    objc_copyWeak(&v24, v9);
    id v23 = v7;
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v24);
  }
LABEL_15:
}

void sub_100021D4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained productPageRemoteViewControllerLoadDidFinish:*(void *)(a1 + 32)];
}

void sub_10002239C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) _isClientEntitled];
  id v4 = [*(id *)(a1 + 32) _clientViewControllerProxy];
  if (v2)
  {
    id v3 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
    [v4 didFinishWithResult:v3];
  }
  else
  {
    [v4 didFinish];
  }
}

void sub_100022F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100022F64(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (a2 != 1)
  {
    unint64_t v15 = a2 & 0xFFFFFFFFFFFFFFFELL;
    unsigned int v16 = +[SSLogConfig sharedConfig];
    unsigned int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    id v19 = [v16 OSLogObject];
    id v20 = v19;
    if (v15 == 2)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        int v21 = v18;
      }
      else {
        int v21 = v18 & 2;
      }
      if (v21)
      {
        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v23 = *(void *)(a1 + 40);
        uint64_t v24 = *(void *)(a1 + 48);
        int v36 = 138544130;
        id v37 = WeakRetained;
        __int16 v38 = 2114;
        uint64_t v39 = v22;
        __int16 v40 = 2114;
        uint64_t v41 = v23;
        __int16 v42 = 2114;
        uint64_t v43 = v24;
        LODWORD(v30) = 42;
        int v25 = (void *)_os_log_send_and_compose_impl();

        if (!v25)
        {
LABEL_24:

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000233A8;
          block[3] = &unk_10004DA10;
          objc_copyWeak(&v35, v4);
          id v32 = *(id *)(a1 + 48);
          id v33 = *(id *)(a1 + 56);
          id v34 = *(id *)(a1 + 64);
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

          objc_destroyWeak(&v35);
          goto LABEL_33;
        }
        id v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v36, v30);
        free(v25);
        SSFileLog();
      }

      goto LABEL_24;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      int v26 = v18;
    }
    else {
      int v26 = v18 & 2;
    }
    if (v26)
    {
      uint64_t v27 = *(void *)(a1 + 32);
      uint64_t v28 = *(void *)(a1 + 40);
      int v36 = 138543874;
      id v37 = WeakRetained;
      __int16 v38 = 2114;
      uint64_t v39 = v27;
      __int16 v40 = 2114;
      uint64_t v41 = v28;
      LODWORD(v30) = 32;
      __int16 v29 = (void *)_os_log_send_and_compose_impl();

      if (!v29)
      {
LABEL_32:

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        goto LABEL_33;
      }
      id v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v36, v30);
      free(v29);
      SSFileLog();
    }

    goto LABEL_32;
  }
  uint64_t v6 = +[SSLogConfig sharedConfig];
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  unsigned int v9 = [v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    int v10 = v8;
  }
  else {
    int v10 = v8 & 2;
  }
  if (!v10) {
    goto LABEL_11;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  int v36 = 138544130;
  id v37 = WeakRetained;
  __int16 v38 = 2114;
  uint64_t v39 = v11;
  __int16 v40 = 2114;
  uint64_t v41 = v12;
  __int16 v42 = 2114;
  uint64_t v43 = v13;
  LODWORD(v30) = 42;
  unsigned int v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    unsigned int v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v36, v30);
    free(v14);
    SSFileLog();
LABEL_11:
  }
  [WeakRetained showErrorPageWithCompletion:*(void *)(a1 + 64)];
LABEL_33:
}

void sub_1000233A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _showLegacyControllerForProductID:*(void *)(a1 + 32) parameters:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_1000234A0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _setupErrorViewController];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t sub_10002386C()
{
  qword_100067390 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100023998(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

void sub_100023C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100023CC8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)WeakRetained[4];
  WeakRetained[4] = 0;
}

uint64_t sub_100023D14(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void sub_100023E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100023E74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100023E84(uint64_t a1)
{
}

void sub_100023E8C(uint64_t a1)
{
  [*(id *)(a1 + 32) _fetchBag];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  switch(*(void *)(a1 + 56))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 6:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_9;
      }
      break;
    case 4:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v5 = objc_opt_respondsToSelector();
        uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
        unsigned int v7 = *(void **)(v6 + 40);
        if (v5)
        {
          uint64_t v8 = [v7 stringValue];
          goto LABEL_7;
        }
        *(void *)(v6 + 40) = 0;
        goto LABEL_10;
      }
      break;
    case 5:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = +[NSURL URLWithString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
LABEL_7:
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
        unsigned int v7 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }
      else
      {
LABEL_9:
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
        unsigned int v7 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = 0;
      }
LABEL_10:

      break;
    default:
      break;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_10002DCD0((uint64_t *)(a1 + 40), (uint64_t *)(a1 + 56));
  }
}

void sub_100024264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002428C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10002DE94((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
      if (!v6) {
        goto LABEL_13;
      }
    }
    else if (!v6)
    {
      goto LABEL_13;
    }
    id v32 = 0;
    unsigned int v16 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:&v32];
    id v17 = v32;
    if (v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10002DE20((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong(WeakRetained + 1, v16);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10002DDAC((uint64_t)v16, v25, v26, v27, v28, v29, v30, v31);
    }
  }
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100024464(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000248A4(id a1)
{
  qword_1000673A0 = objc_alloc_init(ServiceBridgedNavigationController);

  _objc_release_x1();
}

void sub_10002526C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1000253A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_100067408 != -1) {
    dispatch_once(&qword_100067408, &stru_10004DB70);
  }
  id v4 = (void *)qword_1000673C0;
  if (os_log_type_enabled((os_log_t)qword_1000673C0, OS_LOG_TYPE_ERROR)) {
    sub_10002DF08(a1, v4, (uint64_t)v3);
  }
}

Class sub_100025430(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000673B8)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100025574;
    v4[4] = &unk_10004D5A8;
    v4[5] = v4;
    long long v5 = off_10004DB58;
    uint64_t v6 = 0;
    qword_1000673B8 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1000673B8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SubscriptionOfferCodeViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_10002DFC8();
LABEL_8:
    free(v2);
  }
  qword_1000673B0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100025574()
{
  uint64_t result = _sl_dlopen();
  qword_1000673B8 = result;
  return result;
}

void sub_1000255E8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.storekit", "Download");
  uint64_t v2 = off_100066BC8;
  off_100066BC8 = v1;

  os_log_t v3 = os_log_create("com.apple.storekit", "General");
  id v4 = (void *)qword_1000673C0;
  qword_1000673C0 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.storekit", "Messages");
  uint64_t v6 = (void *)qword_1000673C8;
  qword_1000673C8 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.storekit", "Products");
  uint64_t v8 = (void *)qword_1000673D0;
  qword_1000673D0 = (uint64_t)v7;

  os_log_t v9 = os_log_create("com.apple.storekit", "Purchase");
  uint64_t v10 = (void *)qword_1000673D8;
  qword_1000673D8 = (uint64_t)v9;

  os_log_t v11 = os_log_create("com.apple.storekit", "Push");
  uint64_t v12 = (void *)qword_1000673E0;
  qword_1000673E0 = (uint64_t)v11;

  os_log_t v13 = os_log_create("com.apple.storekit", "Receipts");
  uint64_t v14 = (void *)qword_1000673E8;
  qword_1000673E8 = (uint64_t)v13;

  os_log_t v15 = os_log_create("com.apple.storekit", "SQL");
  unsigned int v16 = (void *)qword_1000673F0;
  qword_1000673F0 = (uint64_t)v15;

  os_log_t v17 = os_log_create("com.apple.storekit", "XcodeTest");
  uint64_t v18 = (void *)qword_1000673F8;
  qword_1000673F8 = (uint64_t)v17;

  qword_100067400 = (uint64_t)os_log_create("com.apple.storekit", "ProductPage");

  _objc_release_x1();
}

void sub_100025D24(uint64_t a1, void *a2)
{
  id v2 = a2;
  os_log_t v3 = +[SSLogConfig sharedConfig];
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  uint64_t v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_9;
  }
  *(_DWORD *)uint64_t v10 = 138543618;
  *(void *)&void v10[4] = objc_opt_class();
  *(_WORD *)&v10[12] = 2114;
  *(void *)&v10[14] = v2;
  id v7 = *(id *)&v10[4];
  LODWORD(v9) = 22;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    uint64_t v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, v10, v9, *(_OWORD *)v10, *(void *)&v10[16]);
    free(v8);
    SSFileLog();
LABEL_9:
  }
}

void sub_100026210(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100026388;
  v13[3] = &unk_10004CD30;
  v13[4] = v7;
  uint64_t v8 = [v7 _clientViewControllerProxyWithErrorHandler:v13];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10002E070();
    }
    goto LABEL_4;
  }
  if (!v5)
  {
LABEL_4:
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  id v12 = 0;
  uint64_t v9 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
  id v10 = v12;
  if (v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10002DFF0();
  }

LABEL_10:
  os_log_t v11 = [v5 userInfo];
  [v8 engagementTaskDidFinishWithResult:v11 resultData:v9 error:v6 completion:&stru_10004DB90];
}

void sub_100026388(uint64_t a1, void *a2)
{
  id v2 = a2;
  os_log_t v3 = +[SSLogConfig sharedConfig];
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_9;
  }
  *(_DWORD *)id v10 = 138543618;
  *(void *)&void v10[4] = objc_opt_class();
  *(_WORD *)&v10[12] = 2114;
  *(void *)&v10[14] = v2;
  id v7 = *(id *)&v10[4];
  LODWORD(v9) = 22;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, v10, v9, *(_OWORD *)v10, *(void *)&v10[16]);
    free(v8);
    SSFileLog();
LABEL_9:
  }
}

void sub_100026A58(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100026B14;
    v6[3] = &unk_10004D2C0;
    id v7 = *(id *)(a1 + 32);
    id v8 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

void sub_100026B14(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  [v2 _dismissWithError:*(void *)(a1 + 40)];
}

void sub_100027820(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_10002784C(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [objc_alloc((Class)SKUIProductPageItem) initWithIdentifier:*(void *)(a1 + 32) mediaResult:v4];

  [WeakRetained _presentActivityViewControllerWithItem:v5];
}

void sub_1000278D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = +[SSLogConfig sharedConfig];
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  int v21 = 138544130;
  uint64_t v22 = v9;
  __int16 v23 = 2114;
  uint64_t v24 = v11;
  __int16 v25 = 2114;
  uint64_t v26 = v10;
  __int16 v27 = 2114;
  id v28 = v3;
  id v12 = v9;
  LODWORD(v1_Block_object_dispose(&a9, 8) = 42;
  os_log_t v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v21, v18);
    free(v13);
    SSFileLog();
LABEL_9:
  }
  NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
  uint64_t v14 = +[NSBundle bundleForClass:objc_opt_class()];
  os_log_t v15 = [v14 localizedStringForKey:@"ITEM_NOT_SHARABLE_TITLE" value:&stru_10004DF18 table:0];
  uint64_t v20 = v15;
  unsigned int v16 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  os_log_t v17 = +[NSError errorWithDomain:SKErrorDomain code:5 userInfo:v16];

  [WeakRetained _loadDidFailWithError:v17];
}

void sub_100027C38(uint64_t a1)
{
  id v2 = +[SSLogConfig sharedConfig];
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  id v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_9;
  }
  unsigned int v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 40);
  *(_DWORD *)id v12 = 138543618;
  *(void *)&v12[4] = v6;
  *(_WORD *)&v12[12] = 2114;
  *(void *)&v12[14] = v7;
  id v8 = v6;
  LODWORD(v11) = 22;
  uint64_t v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    id v5 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, v12, v11, *(_OWORD *)v12, *(void *)&v12[16]);
    free(v9);
    SSFileLog();
LABEL_9:
  }
  uint64_t v10 = [*(id *)(a1 + 32) _clientViewControllerProxy];
  [v10 didFinishWithResult:&off_100050B98 error:0];
}

void sub_100027ED0(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100027F80;
  v4[3] = &unk_10004DA60;
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void sub_100027F80(uint64_t a1)
{
  id v2 = [objc_alloc((Class)SKUIClientContext) initWithConfigurationDictionary:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10002807C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)SKUIProductPageActivityViewController) initWithProductPageItem:*(void *)(a1 + 32) clientContext:v3];

  id v5 = [*(id *)(*(void *)(a1 + 40) + 8) copy];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000281C8;
  v12[3] = &unk_10004DC80;
  v12[4] = *(void *)(a1 + 40);
  id v13 = v5;
  id v6 = v5;
  [v4 setCompletionWithItemsHandler:v12];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000284E8;
  v9[3] = &unk_10004D2C0;
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v4;
  uint64_t v11 = v7;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

void sub_1000281C8(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (!v11) {
    goto LABEL_12;
  }
  id v12 = +[SSLogConfig sharedConfig];
  unsigned int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  os_log_t v15 = [v12 OSLogObject];
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    v14 &= 2u;
  }
  if (!v14) {
    goto LABEL_10;
  }
  unsigned int v16 = objc_opt_class();
  uint64_t v17 = *(void *)(a1 + 40);
  *(_DWORD *)id v33 = 138543874;
  *(void *)&v33[4] = v16;
  *(_WORD *)&v33[12] = 2114;
  *(void *)&v33[14] = v17;
  *(_WORD *)&v33[22] = 2114;
  id v34 = v11;
  id v18 = v16;
  LODWORD(v32) = 32;
  uint64_t v31 = v33;
  NSErrorUserInfoKey v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    os_log_t v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, v33, v32, *(_OWORD *)v33, *(void *)&v33[16], v34);
    free(v19);
    uint64_t v31 = v15;
    SSFileLog();
LABEL_10:
  }
LABEL_12:
  uint64_t v20 = +[SSLogConfig sharedConfig];
  unsigned int v21 = [v20 shouldLog];
  if ([v20 shouldLogToDisk]) {
    int v22 = v21 | 2;
  }
  else {
    int v22 = v21;
  }
  __int16 v23 = [v20 OSLogObject];
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
    v22 &= 2u;
  }
  if (v22)
  {
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = *(void *)(a1 + 40);
    *(_DWORD *)id v33 = 138543618;
    *(void *)&v33[4] = v24;
    *(_WORD *)&v33[12] = 2114;
    *(void *)&v33[14] = v25;
    id v26 = v24;
    LODWORD(v32) = 22;
    __int16 v27 = (void *)_os_log_send_and_compose_impl();

    if (!v27) {
      goto LABEL_21;
    }
    __int16 v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, v33, v32);
    free(v27);
    SSFileLog();
  }

LABEL_21:
  if (a3) {
    uint64_t v28 = 2;
  }
  else {
    uint64_t v28 = 1;
  }

  uint64_t v29 = [*(id *)(a1 + 32) _clientViewControllerProxy];
  uint64_t v30 = +[NSNumber numberWithUnsignedInteger:v28];
  [v29 didFinishWithResult:v30 error:0];
}

id sub_1000284E8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) view];
  id v3 = [*(id *)(a1 + 32) popoverPresentationController];
  [v3 setSourceView:v2];

  [*(id *)(a1 + 40) popoverSourceRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [*(id *)(a1 + 32) popoverPresentationController];
  [v12 setSourceRect:v5, v7, v9, v11];

  uint64_t v14 = *(void *)(a1 + 32);
  unsigned int v13 = *(void **)(a1 + 40);

  return [v13 presentViewController:v14 animated:1 completion:0];
}

void sub_1000288C0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _clientViewControllerProxy];
  [v2 didFinishWithResult:&off_100050BB0 error:*(void *)(a1 + 40)];
}

void sub_100028F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100028F60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v5)
  {
    uint64_t v17 = +[SSLogConfig sharedConfig];
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    uint64_t v20 = [v17 OSLogObject];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      v19 &= 2u;
    }
    if (v6)
    {
      if (v19)
      {
        unsigned int v21 = objc_opt_class();
        uint64_t v22 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v31 = 138543874;
        *(void *)&v31[4] = v21;
        *(_WORD *)&v31[12] = 2114;
        *(void *)&v31[14] = v22;
        *(_WORD *)&v31[22] = 2114;
        id v32 = v6;
        id v23 = v21;
        LODWORD(v30) = 32;
        uint64_t v24 = (void *)_os_log_send_and_compose_impl();

        if (!v24)
        {
LABEL_22:

          unsigned int v16 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
          goto LABEL_23;
        }
        uint64_t v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, v31, v30, *(void *)v31, *(_OWORD *)&v31[8], v32);
        free(v24);
        SSFileLog();
      }

      goto LABEL_22;
    }
    if (v19)
    {
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v31 = 138543618;
      *(void *)&v31[4] = v25;
      *(_WORD *)&v31[12] = 2114;
      *(void *)&v31[14] = v26;
      id v27 = v25;
      LODWORD(v30) = 22;
      uint64_t v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_29:

        id v29 = [objc_alloc((Class)NSError) initWithDomain:SKErrorDomain code:0 userInfo:0];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        goto LABEL_24;
      }
      uint64_t v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, v31, v30, *(void *)v31, *(_OWORD *)&v31[8]);
      free(v28);
      SSFileLog();
    }

    goto LABEL_29;
  }
  double v8 = +[SSLogConfig sharedConfig];
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  double v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_10;
  }
  id v12 = objc_opt_class();
  uint64_t v13 = *(void *)(a1 + 32);
  *(_DWORD *)uint64_t v31 = 138543618;
  *(void *)&v31[4] = v12;
  *(_WORD *)&v31[12] = 2114;
  *(void *)&v31[14] = v13;
  id v14 = v12;
  LODWORD(v30) = 22;
  os_log_t v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    double v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, v31, v30, *(_OWORD *)v31, *(void *)&v31[16]);
    free(v15);
    SSFileLog();
LABEL_10:
  }
  unsigned int v16 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_23:
  v16();
LABEL_24:
}

uint64_t sub_1000294B4()
{
  qword_100067410 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100029618(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = v3;
  if (v3 && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v4 = *(id *)(a1 + 32);
    id v5 = xpc_dictionary_get_value(xdict, "1");
    id v6 = v5;
    if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary) {
      [v4 setOptions:v6];
    }
    xpc_dictionary_get_value(xdict, "2");
    double v7 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
    double v8 = v7;
    if (v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_endpoint)
    {
      xpc_connection_t v9 = xpc_connection_create_from_endpoint(v8);
      id v10 = [objc_alloc((Class)SSXPCConnection) initWithXPCConnection:v9];
      [v4 setResponseConnection:v10];
      double v11 = (void *)SSXPCCreateMessageDictionary();
      [v10 sendMessage:v11];
    }
  }
  else
  {
    id v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100029B30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029C08;
  block[3] = &unk_10004D620;
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100029C08(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [objc_alloc((Class)NSURL) initWithString:*(void *)(a1 + 40)];
    [v3 loadPageWithURL:v2];
  }
  else
  {
    [v3 _finishLoadWithResult:0 error:*(void *)(a1 + 48)];
  }
}

void sub_100029EC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 object];
  [v6 _finishLoadWithResult:a2 error:v5];
}

uint64_t sub_10002A204()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  id v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SKLogger();
  __chkstk_darwin();
  id v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v7 = MKBGetDeviceLockState();
  uint64_t result = 1;
  if (v7 && v7 != 3)
  {
    if (qword_100067050 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_10002A510(v4, (uint64_t)qword_100067420);
    sub_10002A548(v9, (uint64_t)v6);
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v3, v6, v0);
    id v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v12 = 67109120;
      v13[3] = v7;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Device is locked: %d", v12, 8u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0;
  }
  return result;
}

id sub_10002A458()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super init];
}

id sub_10002A4B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for objc_LockscreenStatus()
{
  return self;
}

uint64_t sub_10002A510(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10002A548(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SKLogger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002A5AC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (*(uint64_t (**)(void))(v2 + 104))();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_retain();
  sub_10002C1E8(v5, v7, (uint64_t)sub_10002C170, v8);
  swift_bridgeObjectRelease();

  return swift_release();
}

id sub_10002A6EC(uint64_t a1)
{
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(a1 + 16))();

  return v1;
}

uint64_t sub_10002A794()
{
  swift_getObjectType();
  uint64_t v1 = type metadata accessor for Mirror();
  uint64_t v2 = *(void *)(v1 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002BA0C(&qword_100067118);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  unsigned int v21 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v18 - v8;
  __chkstk_darwin(v7);
  os_log_type_t v11 = (char *)&v18 - v10;
  *((void *)&v25 + 1) = type metadata accessor for AnalyticsEvent();
  *(void *)&long long v24 = v0;
  id v12 = v0;
  Mirror.init(reflecting:)();
  sub_10002BBBC((uint64_t)v11, 0, 1, v1);
  sub_10002B278();
  uint64_t v22 = Dictionary.init(dictionaryLiteral:)();
  sub_10002BBE4((uint64_t)v11, (uint64_t)v9);
  if (sub_10002BC4C((uint64_t)v9, 1, v1) != 1)
  {
    id v14 = *(void (**)(char *, char *, uint64_t))(v2 + 32);
    uint64_t v13 = v2 + 32;
    int v19 = (void (**)(char *, uint64_t))(v13 - 24);
    uint64_t v20 = v14;
    do
    {
      uint64_t v15 = v13;
      v20(v4, v9, v1);
      Mirror.children.getter();
      uint64_t v27 = v22;
      swift_retain();
      dispatch thunk of _AnySequenceBox._makeIterator()();
      swift_release();
      dispatch thunk of _AnyIteratorBoxBase.next()();
      if (*((void *)&v26 + 1))
      {
        do
        {
          v23[0] = v24;
          v23[1] = v25;
          v23[2] = v26;
          sub_10002AAF8((uint64_t)&v27, (uint64_t *)v23);
          sub_10002BCDC((uint64_t)v23, &qword_100067120);
          dispatch thunk of _AnyIteratorBoxBase.next()();
        }
        while (*((void *)&v26 + 1));
        uint64_t v22 = v27;
      }
      swift_release();
      swift_release();
      uint64_t v16 = (uint64_t)v21;
      Mirror.superclassMirror.getter();
      (*v19)(v4, v1);
      sub_10002BCDC((uint64_t)v11, &qword_100067118);
      sub_10002BC74(v16, (uint64_t)v11);
      sub_10002BBE4((uint64_t)v11, (uint64_t)v9);
      uint64_t v13 = v15;
    }
    while (sub_10002BC4C((uint64_t)v9, 1, v1) != 1);
  }
  sub_10002BCDC((uint64_t)v11, &qword_100067118);
  sub_10002BCDC((uint64_t)v9, &qword_100067118);
  return v22;
}

uint64_t sub_10002AAF8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v5 = (uint64_t)(a2 + 2);
  *(void *)&long long v14 = *a2;
  *((void *)&v14 + 1) = v3;
  sub_10002B58C((uint64_t)(a2 + 2), (uint64_t)v15);
  if (!v3)
  {
    uint64_t v9 = (id *)v15;
    return sub_10002BD8C((uint64_t)v9);
  }
  swift_bridgeObjectRetain();
  sub_10002BD8C((uint64_t)v15);
  long long v14 = *(_OWORD *)a2;
  sub_10002B58C(v5, (uint64_t)v15);
  unint64_t v6 = sub_10002B278();
  if (swift_dynamicCast())
  {
    id v7 = v13[0];
    sub_10002BF38((uint64_t)v7, v4, v3);

    return swift_bridgeObjectRelease();
  }
  long long v14 = *(_OWORD *)a2;
  sub_10002B58C(v5, (uint64_t)v15);
  sub_10002BA0C(&qword_100067128);
  if (swift_dynamicCast())
  {
    sub_10002BD30(v11, (uint64_t)v13);
    sub_10002BD48(v13, (uint64_t)v13[3]);
    sub_10002ACC4(v6, (uint64_t)&v14);
    if ((void)v14)
    {
      id v10 = (id)v14;
      sub_10002BF38((uint64_t)v10, v4, v3);
    }
    swift_bridgeObjectRelease();
    uint64_t v9 = v13;
    return sub_10002BD8C((uint64_t)v9);
  }
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  swift_bridgeObjectRelease();
  return sub_10002BCDC((uint64_t)v11, &qword_100067130);
}

uint64_t sub_10002ACC4@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  swift_getAssociatedTypeWitness();
  sub_10002C1D8();
  __chkstk_darwin();
  dispatch thunk of RawRepresentable.rawValue.getter();
  int v4 = swift_dynamicCast();
  return sub_10002BBBC(a2, v4 ^ 1u, 1, a1);
}

uint64_t sub_10002ADF8()
{
  uint64_t v0 = type metadata accessor for SKLogger();
  sub_10002C1D8();
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100067050 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10002A510(v0, (uint64_t)qword_100067420);
  sub_10002A548(v4, (uint64_t)v3);
  uint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  _StringGuts.grow(_:)(20);
  uint64_t v5 = _typeName(_:qualified:)();
  unint64_t v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v17 = v5;
  unint64_t v18 = v7;
  v8._object = (void *)0x80000001000447E0;
  v8._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v8);
  uint64_t v10 = v17;
  unint64_t v9 = v18;
  LOBYTE(v7) = static os_log_type_t.fault.getter();
  swift_bridgeObjectRetain_n();
  os_log_type_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = v7;
  if (os_log_type_enabled(v11, (os_log_type_t)v7))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136446466;
    uint64_t v16 = sub_10002B360(0, 0xE000000000000000, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v13 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_10002B360(v10, v9, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}s%{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_10002B2B8((uint64_t)v3);
  return 0;
}

id sub_10002B090()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalyticsEvent();
  return [super init];
}

id sub_10002B0E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalyticsEvent();
  return [super dealloc];
}

uint64_t type metadata accessor for AnalyticsEvent()
{
  return self;
}

uint64_t sub_10002B148()
{
  return 1;
}

uint64_t sub_10002B23C()
{
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(void))(ObjectType + 104))();
}

unint64_t sub_10002B278()
{
  unint64_t result = qword_100067108;
  if (!qword_100067108)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100067108);
  }
  return result;
}

uint64_t sub_10002B2B8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SKLogger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002B314(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_10002B350(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  unsigned char *v4 = a4;
  *unint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10002B360(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002B434(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10002B58C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10002B58C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10002BD8C((uint64_t)v12);
  return v7;
}

uint64_t sub_10002B434(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10002B5E8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_10002B6C0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10002B58C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_10002B5E8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_10002B6C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_10002B758(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002B934(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002B934((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10002B758(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_10002B8CC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_10002B8CC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10002BA0C(&qword_100067110);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10002B934(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10002BA0C(&qword_100067110);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  os_log_type_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10002BB28(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10002BA50(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10002BA0C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_10002BA50(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_10002BB28(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_10002BBBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10002BBE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002BA0C(&qword_100067118);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002BC4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10002BC74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002BA0C(&qword_100067118);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002BCDC(uint64_t a1, uint64_t *a2)
{
  sub_10002BA0C(a2);
  sub_10002C1D8();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_10002BD30(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_10002BD48(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10002BD8C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10002BDDC(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10002BE54(a1, a2, v4);
}

unint64_t sub_10002BE54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10002BF38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_10002BFC8(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;

  return swift_bridgeObjectRelease();
}

void sub_10002BFC8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_10002BDDC(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_10002BA0C(&qword_100067138);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_10002BDDC(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v5;
  if (v17)
  {
    uint64_t v21 = v20[7];

    *(void *)(v21 + 8 * v16) = a1;
  }
  else
  {
    sub_10002C0F0(v16, a2, a3, a1, v20);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_10002C0F0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_10002C138()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002C170()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10002C198()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

id sub_10002C1D0()
{
  return sub_10002A6EC(*(void *)(v0 + 16));
}

void sub_10002C1E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSString v6 = String._bridgeToObjectiveC()();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = a4;
  void v9[4] = sub_10002C9F4;
  v9[5] = v7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10002C59C;
  v9[3] = &unk_10004DE78;
  uint64_t v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v8);
}

void sub_10002C2CC(void *a1)
{
  uint64_t v2 = type metadata accessor for SKLogger();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ([a1 canCreatePayload])
  {
    uint64_t v5 = [a1 eventName];
    if (!v5)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v5 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a1;
    aBlock[4] = sub_10002CA5C;
    aBlock[5] = v6;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10002C59C;
    aBlock[3] = &unk_10004DEC8;
    uint64_t v7 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_release();
    AnalyticsSendEventLazy();
    _Block_release(v7);
  }
  else
  {
    if (qword_100067050 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_10002A510(v2, (uint64_t)qword_100067420);
    sub_10002A548(v8, (uint64_t)v4);
    uint64_t v5 = Logger.logObject.getter();
    uint64_t v9 = type metadata accessor for Logger();
    (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v4, v9);
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v10))
    {
      unint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v10, "Error sending CoreAnalytics event, invalid event provided", v11, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_10002C52C(void *a1)
{
  id v1 = [a1 createPayload];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_10002B278();
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

Class sub_10002C59C(uint64_t a1)
{
  id v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_10002B278();
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

uint64_t sub_10002C628(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for SKLogger();
  uint64_t v3 = __chkstk_darwin();
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (void *)a1(v3);
  uint64_t v7 = v6;
  if (!v6 || ![v6 canCreatePayload])
  {
    if (qword_100067050 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_10002A510(v2, (uint64_t)qword_100067420);
    sub_10002A548(v11, (uint64_t)v5);
    char v12 = Logger.logObject.getter();
    uint64_t v13 = type metadata accessor for Logger();
    (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v5, v13);
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v14))
    {
      Swift::Int v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::Int v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v14, "Error sending CoreAnalytics event, invalid event provided", v15, 2u);
      swift_slowDealloc();
    }

    goto LABEL_10;
  }
  id v8 = [v7 createPayload];
  if (!v8)
  {
LABEL_10:
    swift_unknownObjectRelease();
    return 0;
  }
  uint64_t v9 = v8;
  sub_10002B278();
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  swift_unknownObjectRelease();
  return v10;
}

id sub_10002C90C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for objc_AnalyticsManager();
  return [super init];
}

id sub_10002C964()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for objc_AnalyticsManager();
  return [super dealloc];
}

uint64_t type metadata accessor for objc_AnalyticsManager()
{
  return self;
}

uint64_t sub_10002C9BC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002C9F4()
{
  return sub_10002C628(*(uint64_t (**)(uint64_t))(v0 + 16));
}

uint64_t sub_10002C9FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002CA0C()
{
  return swift_release();
}

uint64_t sub_10002CA14(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10002CA24()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002CA5C()
{
  return sub_10002C52C(*(void **)(v0 + 16));
}

uint64_t sub_10002CA64()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002CAA4()
{
  uint64_t v0 = type metadata accessor for SKLogger();
  sub_10002CB1C(v0, qword_100067420);
  sub_10002A510(v0, (uint64_t)qword_100067420);
  return Logger.init(subsystem:category:)();
}

uint64_t *sub_10002CB1C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t type metadata accessor for SKLogger()
{
  uint64_t result = qword_1000671C0;
  if (!qword_1000671C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002CBC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_10002CC34(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_10002CC98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10002CCFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_10002CD60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10002CDC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_10002CE28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002CE3C);
}

uint64_t sub_10002CE3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();

  return sub_10002BC4C(a1, a2, v4);
}

uint64_t sub_10002CE84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002CE98);
}

uint64_t sub_10002CE98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();

  return sub_10002BBBC(a1, a2, a2, v4);
}

uint64_t sub_10002CEE4()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_10002CF70()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoreKitUIServiceClass();
  return [super init];
}

id sub_10002CFCC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoreKitUIServiceClass();
  return [super dealloc];
}

uint64_t type metadata accessor for StoreKitUIServiceClass()
{
  return self;
}

uint64_t sub_10002D040()
{
  return sub_10002D1C0(&OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_productID);
}

uint64_t sub_10002D064(uint64_t a1, uint64_t a2)
{
  return sub_10002D21C(a1, a2, &OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_productID);
}

id sub_10002D088(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  if (v3)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }

  return v4;
}

uint64_t sub_10002D0E4()
{
  return sub_10002D1C0(&OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_extensionName);
}

void sub_10002D108(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a1;
  a4(v6, v8);
}

uint64_t sub_10002D190(uint64_t a1, uint64_t a2)
{
  return sub_10002D21C(a1, a2, &OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_extensionName);
}

uint64_t sub_10002D1B4()
{
  return sub_10002D1C0(&OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_itemKind);
}

uint64_t sub_10002D1C0(void *a1)
{
  uint64_t v2 = *(void *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_10002D210(uint64_t a1, uint64_t a2)
{
  return sub_10002D21C(a1, a2, &OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_itemKind);
}

uint64_t sub_10002D21C(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = (void *)(v3 + *a3);
  void *v4 = a1;
  v4[1] = a2;
  return swift_bridgeObjectRelease();
}

id sub_10002D234(void *a1, void *a2)
{
  uint64_t v4 = sub_10002D5D4(a1, (SEL *)&selRef_itemKind);
  sub_10002D210(v4, v5);
  if (a2)
  {
    uint64_t v6 = sub_10002D5D4(a2, (SEL *)&selRef_identifier);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  sub_10002D190(v6, v7);
  id result = [a1 iTunesStoreIdentifier];
  if (result)
  {
    id v9 = result;
    [result integerValue];

    uint64_t v10 = dispatch thunk of CustomStringConvertible.description.getter();
    return (id)sub_10002D064(v10, v11);
  }
  return result;
}

unint64_t sub_10002D3C8()
{
  return 0xD000000000000020;
}

BOOL sub_10002D40C()
{
  return *(void *)(v0 + OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_itemKind + 8) != 0;
}

id sub_10002D428()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_productID];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_extensionName];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  uint64_t v3 = &v0[OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_itemKind];
  uint64_t v4 = (objc_class *)type metadata accessor for ProductLookupEvent();
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  v6.receiver = v0;
  v6.super_class = v4;
  return [super init];
}

uint64_t sub_10002D4B8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id sub_10002D514()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProductLookupEvent();
  [super dealloc];
}

uint64_t type metadata accessor for ProductLookupEvent()
{
  return self;
}

uint64_t sub_10002D5D4(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

uint64_t sub_10002D634()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_10002D668(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@ Not registering for unfinished transaction notifications because no bundle ID was available", (uint8_t *)&v1, 0xCu);
}

void sub_10002D6E8()
{
  sub_1000074D0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@: Error in remote proxy getting unfinished transactions: %{public}@", v0, 0x16u);
}

void sub_10002D768()
{
  sub_1000074D0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@: Error getting unfinished transactions: %{public}@", v0, 0x16u);
}

void sub_10002D7E8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Denying launch because the device is locked.", v0, 2u);
}

void sub_10002D830()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Denying ServiceBackgroundAssetConsentViewController because the device is locked. Exiting.", v0, 2u);
}

void sub_10002D878()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Denying ServicePrivacyPromptViewController because the device is locked. Exiting.", v0, 2u);
}

void sub_10002D8C0()
{
  sub_100016B54();
  sub_100016B6C((void *)&_mh_execute_header, &_os_log_default, v0, "[%{public}@][%{public}@]: Legacy mode in ServiceStoreProductViewController", v1, v2, v3, v4, v5);
}

void sub_10002D93C()
{
  sub_100016B54();
  sub_100016B6C((void *)&_mh_execute_header, &_os_log_default, v0, "[%{public}@][%{public}@]: No SKAdNetwork", v1, v2, v3, v4, v5);
}

void sub_10002D9B8()
{
  sub_100016B54();
  sub_100016B6C((void *)&_mh_execute_header, &_os_log_default, v0, "[%{public}@][%{public}@]: Source app ID 0 for SKAdNetwork", v1, v2, v3, v4, v5);
}

void sub_10002DA34()
{
  sub_100016B54();
  __int16 v3 = v0;
  uint64_t v4 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[%{public}@][%{public}@]: Product failed to load with error: %{public}@", v2, 0x20u);
}

void sub_10002DAC4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = [a2 absoluteString];
  int v5 = 138543874;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[%{public}@][%{public}@]: Deprecated method called - loadProductWithURL: %{public}@", (uint8_t *)&v5, 0x20u);
}

uint64_t sub_10002DB8C()
{
  uint64_t v0 = abort_report_np();
  return sub_10002DBB4(v0);
}

uint64_t sub_10002DBB4()
{
  uint64_t v0 = abort_report_np();
  return sub_10002DBDC(v0);
}

uint64_t sub_10002DBDC()
{
  uint64_t v0 = abort_report_np();
  return sub_10002DC04(v0);
}

uint64_t sub_10002DC04()
{
  uint64_t v0 = abort_report_np();
  return sub_10002DC2C(v0);
}

void sub_10002DC2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138543874;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = v2;
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[%{public}@][%{public}@]: Invalid SKProductPageExtensionInteractionType: %lu", (uint8_t *)&v3, 0x20u);
}

void sub_10002DCD0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "No bag value for requested key: %{public}@ of type: %ld", (uint8_t *)&v4, 0x16u);
}

void sub_10002DD64()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "No valid port found for the server", v0, 2u);
}

void sub_10002DDAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DE20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DE94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DF08(uint64_t a1, void *a2, uint64_t a3)
{
  int v4 = a2;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get remote view controller proxy: %{public}@", (uint8_t *)&v6, 0x16u);
}

uint64_t sub_10002DFC8()
{
  uint64_t v0 = abort_report_np();
  return sub_10002DFF0(v0);
}

void sub_10002DFF0()
{
  sub_1000074D0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[%@]: Failed to archive engagement result, error: %{public}@", v0, 0x16u);
}

void sub_10002E070()
{
  sub_1000074D0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[%@]: Engagement presentation failed with error %{public}@", v0, 0x16u);
}

void sub_10002E0F0()
{
  sub_100016B54();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[%{public}@][%{public}@]: No ID provided for product.", v0, 0x16u);
}

void sub_10002E178()
{
  sub_100016B54();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[%{public}@][%{public}@]: Invalid format for product ID.", v0, 0x16u);
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t dispatch thunk of _AnySequenceBox._makeIterator()()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t Mirror.superclassMirror.getter()
{
  return Mirror.superclassMirror.getter();
}

uint64_t Mirror.init(reflecting:)()
{
  return Mirror.init(reflecting:)();
}

uint64_t Mirror.children.getter()
{
  return Mirror.children.getter();
}

uint64_t type metadata accessor for Mirror()
{
  return type metadata accessor for Mirror();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

void CGImageRelease(CGImageRef image)
{
}

CGRect CGRectFromString(NSString *string)
{
  return _CGRectFromString(string);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

uint64_t LICreateIconFromCachedBitmap()
{
  return _LICreateIconFromCachedBitmap();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SKUIBundle()
{
  return _SKUIBundle();
}

uint64_t SKUIErrorDocumentTitle()
{
  return _SKUIErrorDocumentTitle();
}

uint64_t SKUIViewControllerIsDescendent()
{
  return _SKUIViewControllerIsDescendent();
}

uint64_t SSError()
{
  return _SSError();
}

uint64_t SSFileLog()
{
  return _SSFileLog();
}

uint64_t SSXPCCreateCFObjectFromXPCObject()
{
  return _SSXPCCreateCFObjectFromXPCObject();
}

uint64_t SSXPCCreateMessageDictionary()
{
  return _SSXPCCreateMessageDictionary();
}

uint64_t SSXPCDictionaryCopyCFObjectWithClass()
{
  return _SSXPCDictionaryCopyCFObjectWithClass();
}

uint64_t SSXPCDictionarySetCFObject()
{
  return _SSXPCDictionarySetCFObject();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

BOOL notify_is_valid_token(int val)
{
  return _notify_is_valid_token(val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return _xpc_connection_create_from_endpoint(endpoint);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [a1 JSONObjectWithData:options:error:];
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return _[a1 OSLogObject];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__activePort(void *a1, const char *a2, ...)
{
  return _[a1 _activePort];
}

id objc_msgSend__addActionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return [a1 _addActionWithTitle:style:handler:];
}

id objc_msgSend__addConfigurationAction_(void *a1, const char *a2, ...)
{
  return [a1 _addConfigurationAction:];
}

id objc_msgSend__alertViewForSessionWithRemoteViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alertViewForSessionWithRemoteViewController:");
}

id objc_msgSend__applicationMode(void *a1, const char *a2, ...)
{
  return _[a1 _applicationMode];
}

id objc_msgSend__applyCustomTintColorToViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyCustomTintColorToViewController:");
}

id objc_msgSend__bag(void *a1, const char *a2, ...)
{
  return _[a1 _bag];
}

id objc_msgSend__bagKeyForConfigURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bagKeyForConfigURLString:");
}

id objc_msgSend__beginDelayingPresentation_cancellationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginDelayingPresentation:cancellationHandler:");
}

id objc_msgSend__buildReviewInAppConfigurationWithParameters_clientContext_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildReviewInAppConfigurationWithParameters:clientContext:completionHandler:");
}

id objc_msgSend__cancelNotifyTokenIfValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelNotifyTokenIfValid:");
}

id objc_msgSend__checkEntitlementsWithError_(void *a1, const char *a2, ...)
{
  return [a1 _checkEntitlementsWithError:];
}

id objc_msgSend__cleanUpExtension(void *a1, const char *a2, ...)
{
  return _[a1 _cleanUpExtension];
}

id objc_msgSend__clientViewControllerProxy(void *a1, const char *a2, ...)
{
  return _[a1 _clientViewControllerProxy];
}

id objc_msgSend__clientViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__closeReceiverConnection(void *a1, const char *a2, ...)
{
  return _[a1 _closeReceiverConnection];
}

id objc_msgSend__correctPopover_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_correctPopover:");
}

id objc_msgSend__defaultClientInterface(void *a1, const char *a2, ...)
{
  return _[a1 _defaultClientInterface];
}

id objc_msgSend__determineTypeForURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_determineTypeForURL:completion:");
}

id objc_msgSend__didReceiveRemoteViewController_forItem_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didReceiveRemoteViewController:forItem:withParameters:");
}

id objc_msgSend__disconnect(void *a1, const char *a2, ...)
{
  return _[a1 _disconnect];
}

id objc_msgSend__disconnectFromAlertView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disconnectFromAlertView:");
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return _[a1 _dismiss];
}

id objc_msgSend__dismissAlertController(void *a1, const char *a2, ...)
{
  return _[a1 _dismissAlertController];
}

id objc_msgSend__dismissClientViewController(void *a1, const char *a2, ...)
{
  return _[a1 _dismissClientViewController];
}

id objc_msgSend__dismissPresentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 _dismissPresentedViewController];
}

id objc_msgSend__dismissViewService(void *a1, const char *a2, ...)
{
  return _[a1 _dismissViewService];
}

id objc_msgSend__dismissWithError_(void *a1, const char *a2, ...)
{
  return [a1 _dismissWithError:];
}

id objc_msgSend__endDelayingPresentation(void *a1, const char *a2, ...)
{
  return _[a1 _endDelayingPresentation];
}

id objc_msgSend__executeConfigurationActionsWithServiceProductPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executeConfigurationActionsWithServiceProductPage:");
}

id objc_msgSend__fetchBag(void *a1, const char *a2, ...)
{
  return _[a1 _fetchBag];
}

id objc_msgSend__finishLoadWithResult_error_(void *a1, const char *a2, ...)
{
  return [a1 _finishLoadWithResult:error:];
}

id objc_msgSend__finishWithButtonIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishWithButtonIndex:");
}

id objc_msgSend__flatImageWithColor_(void *a1, const char *a2, ...)
{
  return [a1 _flatImageWithColor:];
}

id objc_msgSend__generateClientInterface(void *a1, const char *a2, ...)
{
  return _[a1 _generateClientInterface];
}

id objc_msgSend__handleMessage_connection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMessage:connection:");
}

id objc_msgSend__handleSafariScriptDataUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSafariScriptDataUpdate:");
}

id objc_msgSend__handleUniversalLinkInURLComponents_forApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleUniversalLinkInURLComponents:forApplication:");
}

id objc_msgSend__hostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _hostApplicationBundleIdentifier];
}

id objc_msgSend__hostAuditToken(void *a1, const char *a2, ...)
{
  return _[a1 _hostAuditToken];
}

id objc_msgSend__iconForApplication_(void *a1, const char *a2, ...)
{
  return [a1 _iconForApplication];
}

id objc_msgSend__inAppConfigurationWithItemID_title_icon_sandboxed_clientContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_inAppConfigurationWithItemID:title:icon:sandboxed:clientContext:");
}

id objc_msgSend__isClientEntitled(void *a1, const char *a2, ...)
{
  return _[a1 _isClientEntitled];
}

id objc_msgSend__kill_(void *a1, const char *a2, ...)
{
  return [a1 _kill:];
}

id objc_msgSend__loadClientContextWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadClientContextWithCompletionBlock:");
}

id objc_msgSend__loadDidFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadDidFailWithError:");
}

id objc_msgSend__loadProductWithIdentifier_parameters_(void *a1, const char *a2, ...)
{
  return [a1 _loadProductWithIdentifier:parameters:];
}

id objc_msgSend__loadProductWithIdentifier_parameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadProductWithIdentifier:parameters:completion:");
}

id objc_msgSend__loadURLWithActiveConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 _loadURLWithActiveConfiguration];
}

id objc_msgSend__lookupItemWithIdentifier_success_failure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lookupItemWithIdentifier:success:failure:");
}

id objc_msgSend__makeItemKindEventForItem_extension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeItemKindEventForItem:extension:");
}

id objc_msgSend__newCancelButtonItemWithClientContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newCancelButtonItemWithClientContext:");
}

id objc_msgSend__preloadConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _preloadConfiguration];
}

id objc_msgSend__presentActivityViewControllerWithItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentActivityViewControllerWithItem:");
}

id objc_msgSend__presentChildViewController(void *a1, const char *a2, ...)
{
  return _[a1 _presentChildViewController];
}

id objc_msgSend__presentErrorViewControllerWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentErrorViewControllerWithError:");
}

id objc_msgSend__presentFormViewControllerForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentFormViewControllerForSession:");
}

id objc_msgSend__presentLaunchViewControllerForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 _presentLaunchViewControllerForIdentifier];
}

id objc_msgSend__presentOnboardingIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 _presentOnboardingIfNeededWithCompletion:];
}

id objc_msgSend__presentViewController(void *a1, const char *a2, ...)
{
  return _[a1 _presentViewController];
}

id objc_msgSend__presentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentViewController:");
}

id objc_msgSend__privacyViewControllerDidFinishWithResult_(void *a1, const char *a2, ...)
{
  return [_privacyViewControllerDidFinishWithResult:];
}

id objc_msgSend__productIDFromParameters_(void *a1, const char *a2, ...)
{
  return [a1 _productIDFromParameters:];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return _[a1 _remoteViewControllerProxy];
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__requestRemoteViewControllerForItem_withParameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestRemoteViewControllerForItem:withParameters:completion:");
}

id objc_msgSend__resetDocumentControllers(void *a1, const char *a2, ...)
{
  return _[a1 _resetDocumentControllers];
}

id objc_msgSend__respondWithSuccess_(void *a1, const char *a2, ...)
{
  return [a1 _respondWithSuccess:];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 _rootSheetPresentationController];
}

id objc_msgSend__sanitizedURL(void *a1, const char *a2, ...)
{
  return _[a1 _sanitizedURL];
}

id objc_msgSend__sendDidFinishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendDidFinishWithResult:");
}

id objc_msgSend__sendInstallAttributionIfAllowed(void *a1, const char *a2, ...)
{
  return _[a1 _sendInstallAttributionIfAllowed];
}

id objc_msgSend__sendUnentitledErrorResponse(void *a1, const char *a2, ...)
{
  return _[a1 _sendUnentitledErrorResponse];
}

id objc_msgSend__serviceConnection(void *a1, const char *a2, ...)
{
  return _[a1 _serviceConnection];
}

id objc_msgSend__serviceConnectionInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 _serviceConnectionInvalidated];
}

id objc_msgSend__serviceConnectionWithName_(void *a1, const char *a2, ...)
{
  return [a1 _serviceConnectionWithName:];
}

id objc_msgSend__setAdditionalPurchaseParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAdditionalPurchaseParameters:");
}

id objc_msgSend__setAskToBuy_(void *a1, const char *a2, ...)
{
  return [a1 _setAskToBuy:];
}

id objc_msgSend__setCancelButtonTitle_(void *a1, const char *a2, ...)
{
  return [a1 _setCancelButtonTitle:];
}

id objc_msgSend__setCentersPopoverIfSourceViewNotSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCentersPopoverIfSourceViewNotSet:");
}

id objc_msgSend__setChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setChildViewController:");
}

id objc_msgSend__setContainerIgnoresDirectTouchEvents_(void *a1, const char *a2, ...)
{
  return [a1 _setContainerIgnoresDirectTouchEvents:];
}

id objc_msgSend__setContentInsetAdjustmentBehavior_(void *a1, const char *a2, ...)
{
  return [a1 _setContentInsetAdjustmentBehavior:];
}

id objc_msgSend__setHidesTabBar_(void *a1, const char *a2, ...)
{
  return [a1 _setHidesTabBar:];
}

id objc_msgSend__setPromptString_(void *a1, const char *a2, ...)
{
  return [a1 _setPromptString:];
}

id objc_msgSend__setPurchaseAffiliateIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 _setPurchaseAffiliateIdentifier];
}

id objc_msgSend__setPurchaseURLBagType_(void *a1, const char *a2, ...)
{
  return [a1 _setPurchaseURLBagType:];
}

id objc_msgSend__setRightBarButtonTitle_(void *a1, const char *a2, ...)
{
  return [a1 _setRightBarButtonTitle:];
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return [a1 _setShouldScaleDownBehindDescendantSheets];
}

id objc_msgSend__setShowsRightBarButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShowsRightBarButton:");
}

id objc_msgSend__setShowsStoreButton_(void *a1, const char *a2, ...)
{
  return [_a1 _setShowsStoreButton:];
}

id objc_msgSend__setUsageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUsageContext:");
}

id objc_msgSend__setViewClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setViewClipsToBounds:");
}

id objc_msgSend__setupChildViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupChildViewController:animated:");
}

id objc_msgSend__setupErrorViewController(void *a1, const char *a2, ...)
{
  return _[a1 _setupErrorViewController];
}

id objc_msgSend__setupProductPageViewController(void *a1, const char *a2, ...)
{
  return _[a1 _setupProductPageViewController];
}

id objc_msgSend__setupViewController_forPresentationInTraitEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupViewController:forPresentationInTraitEnvironment:");
}

id objc_msgSend__setupWithClientBundleID_bagType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupWithClientBundleID:bagType:");
}

id objc_msgSend__shouldIncludeAcknowledgementButtonInSplashController(void *a1, const char *a2, ...)
{
  return _[a1 _shouldIncludeAcknowledgementButtonInSplashController];
}

id objc_msgSend__showAlertForAlertProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAlertForAlertProxy:");
}

id objc_msgSend__showLegacyControllerForProductID_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showLegacyControllerForProductID:parameters:");
}

id objc_msgSend__showViewControllerForAlertProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showViewControllerForAlertProxy:");
}

id objc_msgSend__startIfReady(void *a1, const char *a2, ...)
{
  return _[a1 _startIfReady];
}

id objc_msgSend__stopApplication(void *a1, const char *a2, ...)
{
  return _[a1 _stopApplication];
}

id objc_msgSend__storeKitClientInterface(void *a1, const char *a2, ...)
{
  return _[a1 _storeKitClientInterface];
}

id objc_msgSend__storeKitServiceInterface(void *a1, const char *a2, ...)
{
  return _[a1 _storeKitServiceInterface];
}

id objc_msgSend__storePageViewController(void *a1, const char *a2, ...)
{
  return _[a1 _storePageViewController];
}

id objc_msgSend__target(void *a1, const char *a2, ...)
{
  return _[a1 _target];
}

id objc_msgSend__unfinishedTransactionsNotificationName(void *a1, const char *a2, ...)
{
  return _[a1 _unfinishedTransactionsNotificationName];
}

id objc_msgSend__usesModalPresentation(void *a1, const char *a2, ...)
{
  return _[a1 _usesModalPresentation];
}

id objc_msgSend__viewControllerForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_viewControllerForType:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_acknowledgementReceived(void *a1, const char *a2, ...)
{
  return _[a1 acknowledgementReceived];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_actionString(void *a1, const char *a2, ...)
{
  return _[a1 actionString];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _[a1 actions];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return _[a1 activeAccount];
}

id objc_msgSend_activeChildViewController(void *a1, const char *a2, ...)
{
  return _[a1 activeChildViewController];
}

id objc_msgSend_activeConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 activeConfiguration];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _[a1 activityType];
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return [a1 addAnimation:forKey:];
}

id objc_msgSend_addButtonWithTitle_(void *a1, const char *a2, ...)
{
  return [a1 addButtonWithTitle:];
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 addChildViewController:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return [a1 addFinishBlock:];
}

id objc_msgSend_addInstallAttributionParamsWithConfig_(void *a1, const char *a2, ...)
{
  return [a1 addInstallAttributionParamsWithConfig:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return [a1 addOperation:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_alertController_alertDidFinishWithButton_(void *a1, const char *a2, ...)
{
  return [a1 alertController:alertDidFinishWithButton:];
}

id objc_msgSend_alertProxy_didReceiveMessage_(void *a1, const char *a2, ...)
{
  return [a1 alertProxy:didReceiveMessage:];
}

id objc_msgSend_alertProxyDidCancel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertProxyDidCancel:");
}

id objc_msgSend_allItems(void *a1, const char *a2, ...)
{
  return _[a1 allItems];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return [a1 ams_DSID];
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return [a1 ams_activeiTunesAccount];
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return [a1 ams_sharedAccountStore];
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:animations:completion:];
}

id objc_msgSend_animated(void *a1, const char *a2, ...)
{
  return _[a1 animated];
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 animationWithKeyPath:];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return _[a1 appState];
}

id objc_msgSend_application_openURL_options_(void *a1, const char *a2, ...)
{
  return [a1 application:openURL:options:];
}

id objc_msgSend_applicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return _[a1 applicationDidEnterBackground];
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 applicationProxyForIdentifier:];
}

id objc_msgSend_applicationWillEnterForeground(void *a1, const char *a2, ...)
{
  return _[a1 applicationWillEnterForeground];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_askToShowMessageWithReplyBlock_(void *a1, const char *a2, ...)
{
  return [a1 askToShowMessageWithReplyBlock:];
}

id objc_msgSend_associateIncidentId_(void *a1, const char *a2, ...)
{
  return [a1 associateIncidentId:];
}

id objc_msgSend_attemptDismissHostViewController(void *a1, const char *a2, ...)
{
  return _[a1 attemptDismissHostViewController];
}

id objc_msgSend_authenticationContext(void *a1, const char *a2, ...)
{
  return _[a1 authenticationContext];
}

id objc_msgSend_backButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 backButtonTitle];
}

id objc_msgSend_bagForProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return [a1 bagForProfile:profileVersion:];
}

id objc_msgSend_bagKeySet(void *a1, const char *a2, ...)
{
  return _[a1 bagKeySet];
}

id objc_msgSend_bagSubProfile(void *a1, const char *a2, ...)
{
  return _[a1 bagSubProfile];
}

id objc_msgSend_bagSubProfileVersion(void *a1, const char *a2, ...)
{
  return _[a1 bagSubProfileVersion];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_buildWithError_(void *a1, const char *a2, ...)
{
  return [a1 buildWithError:];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleType(void *a1, const char *a2, ...)
{
  return _[a1 bundleType];
}

id objc_msgSend_buttonTitle(void *a1, const char *a2, ...)
{
  return _[a1 buttonTitle];
}

id objc_msgSend_buttons(void *a1, const char *a2, ...)
{
  return _[a1 buttons];
}

id objc_msgSend_canSendResponse(void *a1, const char *a2, ...)
{
  return _[a1 canSendResponse];
}

id objc_msgSend_cancelExtensionRequestWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 cancelExtensionRequestWithIdentifier:];
}

id objc_msgSend_cardContainerViewController(void *a1, const char *a2, ...)
{
  return _[a1 cardContainerViewController];
}

id objc_msgSend_checkServerQueueForClientIfNecessary_forceCheck_reply_(void *a1, const char *a2, ...)
{
  return [a1 checkServerQueueForClientIfNecessary:forceCheck:reply:];
}

id objc_msgSend_childViewController(void *a1, const char *a2, ...)
{
  return _[a1 childViewController];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 childViewControllers];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clientContext(void *a1, const char *a2, ...)
{
  return _[a1 clientContext];
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return _[a1 clientInterface];
}

id objc_msgSend_clientLookupItemDidLoad_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientLookupItemDidLoad:parameters:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_codeDetected_(void *a1, const char *a2, ...)
{
  return [a1 codeDetected:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return [a1 componentsWithURL:resolvingAgainstBaseURL:];
}

id objc_msgSend_configurationActions(void *a1, const char *a2, ...)
{
  return _[a1 configurationActions];
}

id objc_msgSend_configurationFromUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 configurationFromUserInfo:];
}

id objc_msgSend_configurationPreloader(void *a1, const char *a2, ...)
{
  return _[a1 configurationPreloader];
}

id objc_msgSend_configurationPromise(void *a1, const char *a2, ...)
{
  return _[a1 configurationPromise];
}

id objc_msgSend_configureWithItem_compatibleExtension_(void *a1, const char *a2, ...)
{
  return [a1 configureWithItem:compatibleExtension:];
}

id objc_msgSend_consentProvided(void *a1, const char *a2, ...)
{
  return _[a1 consentProvided];
}

id objc_msgSend_containerNavigationController(void *a1, const char *a2, ...)
{
  return _[a1 containerNavigationController];
}

id objc_msgSend_containerViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 containerViewControllers];
}

id objc_msgSend_containingBundle(void *a1, const char *a2, ...)
{
  return _[a1 containingBundle];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_convertInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return [a1 convertInterfaceOrientation:];
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:toView:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyITMLOptionsDictionary(void *a1, const char *a2, ...)
{
  return _[a1 copyITMLOptionsDictionary];
}

id objc_msgSend_copyQueryStringDictionaryWithUnescapedValues_(void *a1, const char *a2, ...)
{
  return [a1 copyQueryStringDictionaryWithUnescapedValues];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createBagForSubProfile(void *a1, const char *a2, ...)
{
  return _[a1 createBagForSubProfile];
}

id objc_msgSend_createBetaAppLaunchViewControllerForIdentifier_hostedIn_withSidepackLaunchInfo_(void *a1, const char *a2, ...)
{
  return [a1 createBetaAppLaunchViewControllerForIdentifier:hostedIn:withSidepackLaunchInfo:];
}

id objc_msgSend_createFeedbackViewControllerForCurrentState(void *a1, const char *a2, ...)
{
  return _[a1 createFeedbackViewControllerForCurrentState];
}

id objc_msgSend_createXPCEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 createXPCEndpoint];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return _[a1 currentProcess];
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 dataTaskWithRequest:completionHandler:];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return _[a1 deactivate];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultBroker(void *a1, const char *a2, ...)
{
  return _[a1 defaultBroker];
}

id objc_msgSend_defaultButton(void *a1, const char *a2, ...)
{
  return _[a1 defaultButton];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultContext(void *a1, const char *a2, ...)
{
  return _[a1 defaultContext];
}

id objc_msgSend_defaultLocalStoragePath(void *a1, const char *a2, ...)
{
  return _[a1 defaultLocalStoragePath];
}

id objc_msgSend_defaultQueue(void *a1, const char *a2, ...)
{
  return _[a1 defaultQueue];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_desiredPresentationStyle(void *a1, const char *a2, ...)
{
  return _[a1 desiredPresentationStyle];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didAcceptPINAction(void *a1, const char *a2, ...)
{
  return _[a1 didAcceptPINAction];
}

id objc_msgSend_didContinueAction(void *a1, const char *a2, ...)
{
  return _[a1 didContinueAction];
}

id objc_msgSend_didFinish(void *a1, const char *a2, ...)
{
  return _[a1 didFinish];
}

id objc_msgSend_didFinishDismissal(void *a1, const char *a2, ...)
{
  return _[a1 didFinishDismissal];
}

id objc_msgSend_didFinishLoading(void *a1, const char *a2, ...)
{
  return _[a1 didFinishLoading];
}

id objc_msgSend_didFinishWithResult_(void *a1, const char *a2, ...)
{
  return [a1 didFinishWithResult:];
}

id objc_msgSend_didFinishWithResult_error_(void *a1, const char *a2, ...)
{
  return [a1 didFinishWithResult:error:];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 didMoveToParentViewController:];
}

id objc_msgSend_didPrepareWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didPrepareWithResult:error:");
}

id objc_msgSend_didProvideConsentAction(void *a1, const char *a2, ...)
{
  return _[a1 didProvideConsentAction];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return _[a1 dismiss];
}

id objc_msgSend_dismissAnimated_(void *a1, const char *a2, ...)
{
  return [a1 dismissAnimated:];
}

id objc_msgSend_dismissBridgedViewController(void *a1, const char *a2, ...)
{
  return _[a1 dismissBridgedViewController];
}

id objc_msgSend_dismissHostViewController(void *a1, const char *a2, ...)
{
  return _[a1 dismissHostViewController];
}

id objc_msgSend_dismissHostViewControllerWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissHostViewControllerWithResult:error:");
}

id objc_msgSend_dismissViewController(void *a1, const char *a2, ...)
{
  return _[a1 dismissViewController];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerAnimated:completion:];
}

id objc_msgSend_dismissViewControllerWithResult_error_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerWithResult:error:];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_downloadAdded_(void *a1, const char *a2, ...)
{
  return [a1 downloadAdded:];
}

id objc_msgSend_downloadRemoved_(void *a1, const char *a2, ...)
{
  return [a1 downloadRemoved:];
}

id objc_msgSend_downloadStatusChanged_(void *a1, const char *a2, ...)
{
  return [a1 downloadStatusChanged:];
}

id objc_msgSend_embeddedParent(void *a1, const char *a2, ...)
{
  return _[a1 embeddedParent];
}

id objc_msgSend_embeddedViewController(void *a1, const char *a2, ...)
{
  return _[a1 embeddedViewController];
}

id objc_msgSend_engagementTaskDidFinishWithResult_resultData_error_completion_(void *a1, const char *a2, ...)
{
  return [a1 engagementTaskDidFinishWithResult:resultData:error:completion:];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateQueryWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateQueryWithBlock:];
}

id objc_msgSend_errorView(void *a1, const char *a2, ...)
{
  return _[a1 errorView];
}

id objc_msgSend_errorViewController(void *a1, const char *a2, ...)
{
  return _[a1 errorViewController];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_errorWithSafeUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithSafeUserInfo:];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _[a1 events];
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return _[a1 extension];
}

id objc_msgSend_extensionProxy(void *a1, const char *a2, ...)
{
  return _[a1 extensionProxy];
}

id objc_msgSend_extensionRequest(void *a1, const char *a2, ...)
{
  return _[a1 extensionRequest];
}

id objc_msgSend_extensionsWithMatchingAttributes_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionsWithMatchingAttributes:completion:");
}

id objc_msgSend_financeInterruptionResolved_(void *a1, const char *a2, ...)
{
  return [a1 financeInterruptionResolved:];
}

id objc_msgSend_finishExtension(void *a1, const char *a2, ...)
{
  return _[a1 finishExtension];
}

id objc_msgSend_finishWithResponse_(void *a1, const char *a2, ...)
{
  return [a1 finishWithResponse:];
}

id objc_msgSend_finishWithResult_error_(void *a1, const char *a2, ...)
{
  return [a1 finishWithResult:error:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstViewController(void *a1, const char *a2, ...)
{
  return _[a1 firstViewController];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptorWithSymbolicTraits:];
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return [a1 fontWithDescriptor:size:];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_frozenBagValueWithKey_value_valueType_(void *a1, const char *a2, ...)
{
  return [a1 frozenBagValueWithKey:value:valueType:];
}

id objc_msgSend_functionWithControlPoints__::(void *a1, const char *a2, ...)
{
  return [a1 functionWithControlPoints:];
}

id objc_msgSend_getActivePortWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 getActivePortWithCompletion:];
}

id objc_msgSend_getNextAlertForClassName_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 getNextAlertForClassName:completionBlock:];
}

id objc_msgSend_handleAuthenticateRequest_resultHandler_(void *a1, const char *a2, ...)
{
  return [a1 handleAuthenticateRequest:resultHandler:];
}

id objc_msgSend_handleDialogRequest_resultHandler_(void *a1, const char *a2, ...)
{
  return [a1 handleDialogRequest:resultHandler:];
}

id objc_msgSend_handleEngagementRequest_resultHandler_(void *a1, const char *a2, ...)
{
  return [a1 handleEngagementRequest:resultHandler:];
}

id objc_msgSend_handleURL_(void *a1, const char *a2, ...)
{
  return [a1 handleURL:];
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 hasEntitlement:];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hidesBackButton(void *a1, const char *a2, ...)
{
  return _[a1 hidesBackButton];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 horizontalSizeClass];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_hostApplicationBundleIdentifierOverride(void *a1, const char *a2, ...)
{
  return _[a1 hostApplicationBundleIdentifierOverride];
}

id objc_msgSend_hostedFeedbackSession(void *a1, const char *a2, ...)
{
  return _[a1 hostedFeedbackSession];
}

id objc_msgSend_iconDataForVariant_(void *a1, const char *a2, ...)
{
  return [a1 iconDataForVariant:];
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return [a1 imageNamed:inBundle:];
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return [a1 imageWithCGImage:scale:orientation:];
}

id objc_msgSend_incidentId(void *a1, const char *a2, ...)
{
  return _[a1 incidentId];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return _[a1 infoDictionary];
}

id objc_msgSend_initForContext_betaApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initForContext:];
}

id objc_msgSend_initWithAccount_(void *a1, const char *a2, ...)
{
  return [a1 initWithAccount:];
}

id objc_msgSend_initWithAccountIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithAccountIdentifier];
}

id objc_msgSend_initWithActionBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithActionBlock:];
}

id objc_msgSend_initWithBackingAccount_(void *a1, const char *a2, ...)
{
  return [a1 initWithBackingAccount:];
}

id objc_msgSend_initWithBag_(void *a1, const char *a2, ...)
{
  return [a1 initWithBag:];
}

id objc_msgSend_initWithBag_URL_(void *a1, const char *a2, ...)
{
  return [a1 initWithBag:URL:];
}

id objc_msgSend_initWithBag_account_clientInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithBag:account:clientInfo:];
}

id objc_msgSend_initWithBag_caller_keyProfile_(void *a1, const char *a2, ...)
{
  return [a1 initWithBag:caller:keyProfile:];
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithBarButtonSystemItem:target:action:];
}

id objc_msgSend_initWithBundleId_productIdentifier_appName_productName_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleId:productIdentifier:appName:productName:];
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithCharityIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithCharityIdentifier:];
}

id objc_msgSend_initWithChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithChildViewController:];
}

id objc_msgSend_initWithChildViewController_animated_presentationBounds_proxyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithChildViewController:animated:presentationBounds:proxyHandler:");
}

id objc_msgSend_initWithClientContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientContext:];
}

id objc_msgSend_initWithClientContextClass_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientContextClass:options:];
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfiguration:];
}

id objc_msgSend_initWithConfigurationDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfigurationDictionary:];
}

id objc_msgSend_initWithDialogDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDialogDictionary:];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithDomain:code:userInfo:];
}

id objc_msgSend_initWithExternalAccountURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithExternalAccountURL:];
}

id objc_msgSend_initWithFrame_title_style_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:title:style:];
}

id objc_msgSend_initWithGift_(void *a1, const char *a2, ...)
{
  return [a1 initWithGift:];
}

id objc_msgSend_initWithGiftCategory_(void *a1, const char *a2, ...)
{
  return [a1 initWithGiftCategory:];
}

id objc_msgSend_initWithIdentifier_mediaResult_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:mediaResult:];
}

id objc_msgSend_initWithItem_(void *a1, const char *a2, ...)
{
  return [a1 initWithItem:];
}

id objc_msgSend_initWithItemID_bundleID_(void *a1, const char *a2, ...)
{
  return [a1 initWithItemID:bundleID:];
}

id objc_msgSend_initWithLookupDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithLookupDictionary:];
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:options:];
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return [a1 initWithNibName:nil bundle:nil];
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjectsAndKeys:];
}

id objc_msgSend_initWithParameters_(void *a1, const char *a2, ...)
{
  return [a1 initWithParameters:];
}

id objc_msgSend_initWithPresentedViewController_presentingViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithPresentedViewController:presentingViewController:];
}

id objc_msgSend_initWithProductPageItem_clientContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithProductPageItem:clientContext:];
}

id objc_msgSend_initWithRedeemCategory_(void *a1, const char *a2, ...)
{
  return [a1 initWithRedeemCategory:];
}

id objc_msgSend_initWithRemoteViewControllerProxy_(void *a1, const char *a2, ...)
{
  return [a1 initWithRemoteViewControllerProxy:];
}

id objc_msgSend_initWithRequest_bag_presentingViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithRequest:bag:presentingViewController:];
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithRootViewController:];
}

id objc_msgSend_initWithSafariViewController_proxyHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithSafariViewController:proxyHandler:];
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithServiceName:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithTabIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithTabIdentifier:];
}

id objc_msgSend_initWithTerms_(void *a1, const char *a2, ...)
{
  return [a1 initWithTerms:];
}

id objc_msgSend_initWithTitle_description_image_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:description:image:];
}

id objc_msgSend_initWithTitle_message_buttonTitle_actionBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:message:buttonTitle:actionBlock:];
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:style:target:action:];
}

id objc_msgSend_initWithType_clientIdentifier_clientVersion_bag_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:clientIdentifier:clientVersion:bag:];
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:];
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:resolvingAgainstBaseURL:];
}

id objc_msgSend_initWithURLRequest_(void *a1, const char *a2, ...)
{
  return [a1 initWithURLRequest:];
}

id objc_msgSend_initWithXPCConnection_(void *a1, const char *a2, ...)
{
  return [a1 initWithXPCConnection:];
}

id objc_msgSend_initWithXPCEncoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithXPCEncoding:];
}

id objc_msgSend_initiateFeedbackSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 initiateFeedbackSnapshot];
}

id objc_msgSend_instancesRespondToSelector_(void *a1, const char *a2, ...)
{
  return [a1 instancesRespondToSelector:];
}

id objc_msgSend_instantiateWithExtension_completion_(void *a1, const char *a2, ...)
{
  return [a1 instantiateWithExtension:completion:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _[a1 invertedSet];
}

id objc_msgSend_isAskToBuy(void *a1, const char *a2, ...)
{
  return _[a1 isAskToBuy];
}

id objc_msgSend_isBeingPresented(void *a1, const char *a2, ...)
{
  return _[a1 isBeingPresented];
}

id objc_msgSend_isDeviceUnlocked(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceUnlocked];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isLoadable(void *a1, const char *a2, ...)
{
  return _[a1 isLoadable];
}

id objc_msgSend_isStoreServicesURL(void *a1, const char *a2, ...)
{
  return _[a1 isStoreServicesURL];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_itemDictionary(void *a1, const char *a2, ...)
{
  return _[a1 itemDictionary];
}

id objc_msgSend_itemFromItem_(void *a1, const char *a2, ...)
{
  return [a1 itemFromItem:];
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return _[a1 itemID];
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 itemIdentifier];
}

id objc_msgSend_itemKind(void *a1, const char *a2, ...)
{
  return _[a1 itemKind];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_launchInfo(void *a1, const char *a2, ...)
{
  return _[a1 launchInfo];
}

id objc_msgSend_launchScreenHost_traitCollectionDidChange_(void *a1, const char *a2, ...)
{
  return [a1 launchScreenHost:traitCollectionDidChange:];
}

id objc_msgSend_launchViewController(void *a1, const char *a2, ...)
{
  return _[a1 launchViewController];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_leftBarButtonItems(void *a1, const char *a2, ...)
{
  return _[a1 leftBarButtonItems];
}

id objc_msgSend_leftItemsSupplementBackButton(void *a1, const char *a2, ...)
{
  return _[a1 leftItemsSupplementBackButton];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadApplicationWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 loadApplicationWithOptions:];
}

id objc_msgSend_loadDidFinishWithResult_error_(void *a1, const char *a2, ...)
{
  return [a1 loadDidFinishWithResult:error:];
}

id objc_msgSend_loadFromBridgedNavigation(void *a1, const char *a2, ...)
{
  return _[a1 loadFromBridgedNavigation];
}

id objc_msgSend_loadPageWithURL_(void *a1, const char *a2, ...)
{
  return [a1 loadPageWithURL:];
}

id objc_msgSend_loadPlaceholder(void *a1, const char *a2, ...)
{
  return _[a1 loadPlaceholder];
}

id objc_msgSend_loadProductWithParameters_(void *a1, const char *a2, ...)
{
  return [a1 loadProductWithParameters:];
}

id objc_msgSend_loadProductWithRequest_(void *a1, const char *a2, ...)
{
  return [a1 loadProductWithRequest:];
}

id objc_msgSend_loadRequest_(void *a1, const char *a2, ...)
{
  return [a1 loadRequest:];
}

id objc_msgSend_loadReviewWithURL_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 loadReviewWithURL:completionBlock:];
}

id objc_msgSend_loadURL_(void *a1, const char *a2, ...)
{
  return [a1 loadURL:];
}

id objc_msgSend_loadURL_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 loadURL:withCompletionBlock:];
}

id objc_msgSend_loadValueForKey_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 loadValueForKey:completionBlock:];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStringForKey_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:];
}

id objc_msgSend_localizedStringForKey_inBundles_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:inBundles:];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_lookUpItemIDsForDeletableSystemAppsWithBundleIDs_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lookUpItemIDsForDeletableSystemAppsWithBundleIDs:reply:");
}

id objc_msgSend_lookupDictionary(void *a1, const char *a2, ...)
{
  return _[a1 lookupDictionary];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeKeyWindow(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyWindow];
}

id objc_msgSend_mapTableWithKeyOptions_valueOptions_(void *a1, const char *a2, ...)
{
  return [a1 mapTableWithKeyOptions:valueOptions:];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_navigationItemOptionsFromViewController_(void *a1, const char *a2, ...)
{
  return [a1 navigationItemOptionsFromViewController:];
}

id objc_msgSend_navigationItemUpdated(void *a1, const char *a2, ...)
{
  return _[a1 navigationItemUpdated];
}

id objc_msgSend_newPlaceholderViewController(void *a1, const char *a2, ...)
{
  return _[a1 newPlaceholderViewController];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_openApplication_options_withResult_(void *a1, const char *a2, ...)
{
  return [a1 openApplication:options:withResult:];
}

id objc_msgSend_openURL_(void *a1, const char *a2, ...)
{
  return [a1 openURL:];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_overrideCreditCardPresentationWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 overrideCreditCardPresentationWithCompletion:];
}

id objc_msgSend_overrideRedeemCameraPerformAction_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideRedeemCameraPerformAction:withObject:");
}

id objc_msgSend_overrideRedeemCameraWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 overrideRedeemCameraWithCompletion:];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _[a1 parentViewController];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _[a1 pathComponents];
}

id objc_msgSend_pendingMessages_(void *a1, const char *a2, ...)
{
  return [a1 pendingMessages:];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return _[a1 perform];
}

id objc_msgSend_performLookupWithBundleIdentifiers_itemIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 performLookupWithBundleIdentifiers:itemIdentifiers:];
}

id objc_msgSend_performRedeemOperationWithCode_cameraRecognized_completion_(void *a1, const char *a2, ...)
{
  return [a1 performRedeemOperationWithCode:cameraRecognized:completion:];
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:];
}

id objc_msgSend_pinController(void *a1, const char *a2, ...)
{
  return _[a1 pinController];
}

id objc_msgSend_pinControllerShown(void *a1, const char *a2, ...)
{
  return _[a1 pinControllerShown];
}

id objc_msgSend_pluginKitProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 pluginKitProxyForIdentifier:];
}

id objc_msgSend_popBridgedViewControllersToIndex_(void *a1, const char *a2, ...)
{
  return [a1 popBridgedViewControllersToIndex:];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 popoverPresentationController];
}

id objc_msgSend_popoverSourceRect(void *a1, const char *a2, ...)
{
  return _[a1 popoverSourceRect];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _[a1 port];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSize];
}

id objc_msgSend_preferredContentSizeDidChange_(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeDidChange:];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontDescriptorWithTextStyle:];
}

id objc_msgSend_preloadConfigurationForPurpose_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preloadConfigurationForPurpose:withCompletionBlock:");
}

id objc_msgSend_prepareForLaunch(void *a1, const char *a2, ...)
{
  return _[a1 prepareForLaunch];
}

id objc_msgSend_presentAlertForDialog_(void *a1, const char *a2, ...)
{
  return [a1 presentAlertForDialog:];
}

id objc_msgSend_presentBridgedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentBridgedViewController];
}

id objc_msgSend_presentEngagement(void *a1, const char *a2, ...)
{
  return _[a1 presentEngagement];
}

id objc_msgSend_presentFromViewController_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentFromViewController:completion:];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:animated:completion:];
}

id objc_msgSend_presentationBounds(void *a1, const char *a2, ...)
{
  return _[a1 presentationBounds];
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _[a1 presentationController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_presentingBridgedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingBridgedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingViewController];
}

id objc_msgSend_privacyControllerShown(void *a1, const char *a2, ...)
{
  return _[a1 privacyControllerShown];
}

id objc_msgSend_privacyControllerWithIdentifier_acknowledgementHandler_(void *a1, const char *a2, ...)
{
  return [a1 privacyControllerWithIdentifier:acknowledgementHandler:];
}

id objc_msgSend_privacyIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 privacyIdentifier];
}

id objc_msgSend_productPageRemoteViewController_didTerminateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productPageRemoteViewController:didTerminateWithError:");
}

id objc_msgSend_productPageRemoteViewController_finishWithResult_completion_(void *a1, const char *a2, ...)
{
  return [a1 productPageRemoteViewController:finishWithResult:completion:];
}

id objc_msgSend_productPageRemoteViewController_userDidInteractWithProduct_(void *a1, const char *a2, ...)
{
  return [a1 productPageRemoteViewController:userDidInteractWithProduct:];
}

id objc_msgSend_productPageRemoteViewControllerLoadDidFinish_(void *a1, const char *a2, ...)
{
  return [a1 productPageRemoteViewControllerLoadDidFinish];
}

id objc_msgSend_productPageStyle(void *a1, const char *a2, ...)
{
  return _[a1 productPageStyle];
}

id objc_msgSend_productParameters(void *a1, const char *a2, ...)
{
  return _[a1 productParameters];
}

id objc_msgSend_productURL(void *a1, const char *a2, ...)
{
  return _[a1 productURL];
}

id objc_msgSend_profileValidated(void *a1, const char *a2, ...)
{
  return _[a1 profileValidated];
}

id objc_msgSend_prompt(void *a1, const char *a2, ...)
{
  return _[a1 prompt];
}

id objc_msgSend_promptForStarRating(void *a1, const char *a2, ...)
{
  return _[a1 promptForStarRating];
}

id objc_msgSend_proxyHandler(void *a1, const char *a2, ...)
{
  return _[a1 proxyHandler];
}

id objc_msgSend_pushBridgedViewController_animated_(void *a1, const char *a2, ...)
{
  return [a1 pushBridgedViewController:animated:];
}

id objc_msgSend_pushBridgedViewControllerAnimated_options_(void *a1, const char *a2, ...)
{
  return [a1 pushBridgedViewControllerAnimated:options:];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _[a1 queryItems];
}

id objc_msgSend_rating(void *a1, const char *a2, ...)
{
  return _[a1 rating];
}

id objc_msgSend_receivedStatuses_(void *a1, const char *a2, ...)
{
  return [a1 receivedStatuses:];
}

id objc_msgSend_receivedTransactions_(void *a1, const char *a2, ...)
{
  return [a1 receivedTransactions:];
}

id objc_msgSend_receiverEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 receiverEndpoint];
}

id objc_msgSend_redeemCameraScriptObject(void *a1, const char *a2, ...)
{
  return _[a1 redeemCameraScriptObject];
}

id objc_msgSend_registerBagKeySet_forProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return [a1 registerBagKeySet:forProfile:profileVersion:];
}

id objc_msgSend_registeredHostBundleId(void *a1, const char *a2, ...)
{
  return _[a1 registeredHostBundleId];
}

id objc_msgSend_reloadWithStorePage_forURL_(void *a1, const char *a2, ...)
{
  return [a1 reloadWithStorePage:forURL:];
}

id objc_msgSend_remoteContainerViewController(void *a1, const char *a2, ...)
{
  return _[a1 remoteContainerViewController];
}

id objc_msgSend_remoteLoadDidFinishCompletion(void *a1, const char *a2, ...)
{
  return _[a1 remoteLoadDidFinishCompletion];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_remoteViewController(void *a1, const char *a2, ...)
{
  return _[a1 remoteViewController];
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllAnimations];
}

id objc_msgSend_removeAllContainerViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 removeAllContainerViewControllers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectIdenticalTo:];
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInRange:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeSavedViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeSavedViewController];
}

id objc_msgSend_removedEntitlementsForProductIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 removedEntitlementsForProductIdentifiers:];
}

id objc_msgSend_removedTransactions_(void *a1, const char *a2, ...)
{
  return [a1 removedTransactions:];
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:];
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:cachePolicy:timeoutInterval:];
}

id objc_msgSend_responseWithInfo_(void *a1, const char *a2, ...)
{
  return [a1 responseWithInfo:];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumeApplicationWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 resumeApplicationWithOptions:];
}

id objc_msgSend_reviewInAppController(void *a1, const char *a2, ...)
{
  return _[a1 reviewInAppController];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 rightBarButtonItem];
}

id objc_msgSend_rightBarButtonItems(void *a1, const char *a2, ...)
{
  return _[a1 rightBarButtonItems];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_saveViewController_animated_presentationBounds_proxyHandler_(void *a1, const char *a2, ...)
{
  return [a1 saveViewController:animated:presentationBounds:proxyHandler:];
}

id objc_msgSend_savedViewController(void *a1, const char *a2, ...)
{
  return _[a1 savedViewController];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _[a1 scrollView];
}

id objc_msgSend_send_(void *a1, const char *a2, ...)
{
  return [a1 send:];
}

id objc_msgSend_sendAppPreviewStateChanged_(void *a1, const char *a2, ...)
{
  return [a1 sendAppPreviewStateChanged:];
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return [a1 sendEvent:];
}

id objc_msgSend_sendMessage_(void *a1, const char *a2, ...)
{
  return [a1 sendMessage:];
}

id objc_msgSend_sendMessage_withReply_(void *a1, const char *a2, ...)
{
  return [a1 sendMessage:withReply:];
}

id objc_msgSend_sendResponse_(void *a1, const char *a2, ...)
{
  return [a1 sendResponse:];
}

id objc_msgSend_serviceProductPageViewControllerClientProxy(void *a1, const char *a2, ...)
{
  return _[a1 serviceProductPageViewControllerClientProxy];
}

id objc_msgSend_serviceProductPageViewControllerFinishWithResult_(void *a1, const char *a2, ...)
{
  return [a1 serviceProductPageViewControllerFinishWithResult:];
}

id objc_msgSend_serviceViewControllerProxy(void *a1, const char *a2, ...)
{
  return _[a1 serviceViewControllerProxy];
}

id objc_msgSend_setAccessibilityIgnoresInvertColors_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityIgnoresInvertColors:];
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return [a1 setAccount:];
}

id objc_msgSend_setAcknowledgementReceived_(void *a1, const char *a2, ...)
{
  return [a1 setAcknowledgementReceived:];
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return [a1 setAction:];
}

id objc_msgSend_setActiveConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setActiveConfiguration:];
}

id objc_msgSend_setAdNetworkId_(void *a1, const char *a2, ...)
{
  return [a1 setAdNetworkId:];
}

id objc_msgSend_setAllowsAlertItems_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsAlertItems:];
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsAlertStacking:];
}

id objc_msgSend_setAllowsBanners_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsBanners:];
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsMenuButtonDismissal:];
}

id objc_msgSend_setAppAdamId_(void *a1, const char *a2, ...)
{
  return [a1 setAppAdamId:];
}

id objc_msgSend_setAskToBuy_(void *a1, const char *a2, ...)
{
  return [a1 setAskToBuy:];
}

id objc_msgSend_setAttempsAutomaticRedeem_(void *a1, const char *a2, ...)
{
  return [a1 setAttempsAutomaticRedeem:];
}

id objc_msgSend_setAttributionSignature_(void *a1, const char *a2, ...)
{
  return [a1 setAttributionSignature:];
}

id objc_msgSend_setAuthenticationContext_(void *a1, const char *a2, ...)
{
  return [a1 setAuthenticationContext:];
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizingMask:];
}

id objc_msgSend_setBackButtonTitle_(void *a1, const char *a2, ...)
{
  return [a1 setBackButtonTitle:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBridgedNavigation_(void *a1, const char *a2, ...)
{
  return [a1 setBridgedNavigation:];
}

id objc_msgSend_setBridgedNavigationItemWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 setBridgedNavigationItemWithOptions:];
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return [a1 setButtonAction:];
}

id objc_msgSend_setButtonTitle_(void *a1, const char *a2, ...)
{
  return [a1 setButtonTitle:];
}

id objc_msgSend_setCameraDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setCameraDelegate:];
}

id objc_msgSend_setCampaignId_(void *a1, const char *a2, ...)
{
  return [a1 setCampaignId:];
}

id objc_msgSend_setCategory_error_(void *a1, const char *a2, ...)
{
  return [a1 setCategory:error:];
}

id objc_msgSend_setChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 setChildViewController:];
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return [a1 setClasses:forSelector:argumentIndex:ofReply:];
}

id objc_msgSend_setClientContext_(void *a1, const char *a2, ...)
{
  return [a1 setClientContext:];
}

id objc_msgSend_setClientIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setClientIdentifier:];
}

id objc_msgSend_setClientInfo_(void *a1, const char *a2, ...)
{
  return [a1 setClientInfo:];
}

id objc_msgSend_setClientInterface_(void *a1, const char *a2, ...)
{
  return [a1 setClientInterface:];
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setCompletion:];
}

id objc_msgSend_setCompletionWithItemsHandler_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionWithItemsHandler:];
}

id objc_msgSend_setConfigurationActions_(void *a1, const char *a2, ...)
{
  return [a1 setConfigurationActions:];
}

id objc_msgSend_setConsentProvided_(void *a1, const char *a2, ...)
{
  return [a1 setConsentProvided:];
}

id objc_msgSend_setContainerNavigationController_(void *a1, const char *a2, ...)
{
  return [a1 setContainerNavigationController:];
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return [a1 setContentViewController:];
}

id objc_msgSend_setDamping_(void *a1, const char *a2, ...)
{
  return [a1 setDamping:];
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return [a1 setData:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return [a1 setDesiredHardwareButtonEvents:];
}

id objc_msgSend_setDesiredPresentationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setDesiredPresentationStyle:];
}

id objc_msgSend_setDidAcceptPINAction_(void *a1, const char *a2, ...)
{
  return [a1 setDidAcceptPINAction:];
}

id objc_msgSend_setDidContinueAction_(void *a1, const char *a2, ...)
{
  return [a1 setDidContinueAction:];
}

id objc_msgSend_setDidProvideConsentAction_(void *a1, const char *a2, ...)
{
  return [a1 setDidProvideConsentAction];
}

id objc_msgSend_setDisconnectBlock_(void *a1, const char *a2, ...)
{
  return [a1 setDisconnectBlock:];
}

id objc_msgSend_setDismissHandlerForDefaultButton_(void *a1, const char *a2, ...)
{
  return [a1 setDismissHandlerForDefaultButton:];
}

id objc_msgSend_setDismissalAnimationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setDismissalAnimationStyle:];
}

id objc_msgSend_setDisplaysOnLockScreen_(void *a1, const char *a2, ...)
{
  return [a1 setDisplaysOnLockScreen:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEditPaneClass_(void *a1, const char *a2, ...)
{
  return [a1 setEditPaneClass:];
}

id objc_msgSend_setEmbeddedParent_(void *a1, const char *a2, ...)
{
  return [a1 setEmbeddedParent:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setErrorViewController_(void *a1, const char *a2, ...)
{
  return [a1 setErrorViewController:];
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return [a1 setExpirationDate:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setExtension_(void *a1, const char *a2, ...)
{
  return [a1 setExtension:];
}

id objc_msgSend_setExtensionRequest_(void *a1, const char *a2, ...)
{
  return [a1 setExtensionRequest:];
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return [a1 setFillMode:];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return [a1 setFromValue:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHidesBackButton_(void *a1, const char *a2, ...)
{
  return [a1 setHidesBackButton:];
}

id objc_msgSend_setHostApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setHostApplicationIdentifier:];
}

id objc_msgSend_setHostedFeedbackSession_(void *a1, const char *a2, ...)
{
  return [a1 setHostedFeedbackSession:];
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return [a1 setIcon:];
}

id objc_msgSend_setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return [a1 setIdleTimerDisabled:forReason:];
}

id objc_msgSend_setIgnoreDefaultKeyboardNotifications_(void *a1, const char *a2, ...)
{
  return [a1 setIgnoreDefaultKeyboardNotifications:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setImpressionId_(void *a1, const char *a2, ...)
{
  return [a1 setImpressionId:];
}

id objc_msgSend_setInitialCode_(void *a1, const char *a2, ...)
{
  return [a1 setInitialCode:];
}

id objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return [a1 setInterface:forSelector:argumentIndex:ofReply:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setIsAskToBuy_(void *a1, const char *a2, ...)
{
  return [a1 setIsAskToBuy:];
}

id objc_msgSend_setIsNativeVisionApp_(void *a1, const char *a2, ...)
{
  return [a1 setIsNativeVisionApp:];
}

id objc_msgSend_setItemID_(void *a1, const char *a2, ...)
{
  return [a1 setItemID:];
}

id objc_msgSend_setItemIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 setItemIdentifiers:];
}

id objc_msgSend_setKeyProfile_(void *a1, const char *a2, ...)
{
  return [a1 setKeyProfile:];
}

id objc_msgSend_setLaunchViewController_(void *a1, const char *a2, ...)
{
  return [a1 setLaunchViewController:];
}

id objc_msgSend_setLaunchingInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return [a1 setLaunchingInterfaceOrientation:];
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setLeftBarButtonItem:];
}

id objc_msgSend_setLeftBarButtonItem_animated_(void *a1, const char *a2, ...)
{
  return [a1 setLeftBarButtonItem:animated:];
}

id objc_msgSend_setLeftBarButtonItems_(void *a1, const char *a2, ...)
{
  return [a1 setLeftBarButtonItems:];
}

id objc_msgSend_setLeftBarButtonItems_animated_(void *a1, const char *a2, ...)
{
  return [a1 setLeftBarButtonItems:animated:];
}

id objc_msgSend_setLeftItemsSupplementBackButton_(void *a1, const char *a2, ...)
{
  return [a1 setLeftItemsSupplementBackButton:];
}

id objc_msgSend_setLocalStoragePath_(void *a1, const char *a2, ...)
{
  return [a1 setLocalStoragePath:];
}

id objc_msgSend_setLogKey_(void *a1, const char *a2, ...)
{
  return [a1 setLogKey:];
}

id objc_msgSend_setMass_(void *a1, const char *a2, ...)
{
  return [a1 setMass:];
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return [a1 setMessage:];
}

id objc_msgSend_setMessageBlock_(void *a1, const char *a2, ...)
{
  return [a1 setMessageBlock:];
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setModalPresentationStyle:];
}

id objc_msgSend_setModalTransitionStyle_(void *a1, const char *a2, ...)
{
  return [a1 setModalTransitionStyle:];
}

id objc_msgSend_setNavigationBarHidden_(void *a1, const char *a2, ...)
{
  return [a1 setNavigationBarHidden:];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfLines:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setObject_forSetting_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forSetting:];
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return [a1 setOpaque:];
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return [a1 setOptions:];
}

id objc_msgSend_setOutputBlock_(void *a1, const char *a2, ...)
{
  return [a1 setOutputBlock:];
}

id objc_msgSend_setOverrideCampaignLimit_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideCampaignLimit:];
}

id objc_msgSend_setPageRenderMetricsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setPageRenderMetricsEnabled:];
}

id objc_msgSend_setPermittedArrowDirections_(void *a1, const char *a2, ...)
{
  return [a1 setPermittedArrowDirections:];
}

id objc_msgSend_setPinController_(void *a1, const char *a2, ...)
{
  return [a1 setPinController:];
}

id objc_msgSend_setPinControllerShown_(void *a1, const char *a2, ...)
{
  return [a1 setPinControllerShown:];
}

id objc_msgSend_setPinDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setPinDelegate:];
}

id objc_msgSend_setPlaceholderViewController_(void *a1, const char *a2, ...)
{
  return [a1 setPlaceholderViewController:];
}

id objc_msgSend_setPlatform_(void *a1, const char *a2, ...)
{
  return [a1 setPlatform:];
}

id objc_msgSend_setPopoverSourceRect_(void *a1, const char *a2, ...)
{
  return [a1 setPopoverSourceRect:];
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredContentSize:];
}

id objc_msgSend_setPreferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredStyle:];
}

id objc_msgSend_setPresentedAccountViewController_(void *a1, const char *a2, ...)
{
  return [a1 setPresentedAccountViewController:];
}

id objc_msgSend_setPresentingBridgedViewController_(void *a1, const char *a2, ...)
{
  return [a1 setPresentingBridgedViewController:];
}

id objc_msgSend_setPreview_(void *a1, const char *a2, ...)
{
  return [a1 setPreview:];
}

id objc_msgSend_setPrivacyControllerShown_(void *a1, const char *a2, ...)
{
  return [a1 setPrivacyControllerShown:];
}

id objc_msgSend_setPrivacyIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setPrivacyIdentifier:];
}

id objc_msgSend_setProcessInfo_(void *a1, const char *a2, ...)
{
  return [a1 setProcessInfo:];
}

id objc_msgSend_setProductPageDictionary_(void *a1, const char *a2, ...)
{
  return [a1 setProductPageDictionary:];
}

id objc_msgSend_setProductPageStyle_(void *a1, const char *a2, ...)
{
  return [a1 setProductPageStyle:];
}

id objc_msgSend_setProductParameters_(void *a1, const char *a2, ...)
{
  return [a1 setProductParameters:];
}

id objc_msgSend_setProductURL_(void *a1, const char *a2, ...)
{
  return [a1 setProductURL:];
}

id objc_msgSend_setProfile_(void *a1, const char *a2, ...)
{
  return [a1 setProfile:];
}

id objc_msgSend_setProfileVersion_(void *a1, const char *a2, ...)
{
  return [a1 setProfileVersion:];
}

id objc_msgSend_setPrompt_(void *a1, const char *a2, ...)
{
  return [a1 setPrompt:];
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setProperty:forKey:];
}

id objc_msgSend_setProxyHandler_(void *a1, const char *a2, ...)
{
  return [a1 setProxyHandler:];
}

id objc_msgSend_setPurchaseReferrerURL_(void *a1, const char *a2, ...)
{
  return [a1 setPurchaseReferrerURL];
}

id objc_msgSend_setRating_(void *a1, const char *a2, ...)
{
  return [a1 setRating:];
}

id objc_msgSend_setReachabilityDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setReachabilityDisabled:];
}

id objc_msgSend_setRedeemCameraScriptObject_(void *a1, const char *a2, ...)
{
  return [a1 setRedeemCameraScriptObject:];
}

id objc_msgSend_setReferrer_(void *a1, const char *a2, ...)
{
  return [a1 setReferrer:];
}

id objc_msgSend_setReferrerApplicationName_(void *a1, const char *a2, ...)
{
  return [a1 setReferrerApplicationName:];
}

id objc_msgSend_setRegisteredHostBundleId_(void *a1, const char *a2, ...)
{
  return [a1 setRegisteredHostBundleId:];
}

id objc_msgSend_setRemoteContainerViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteContainerViewController:];
}

id objc_msgSend_setRemoteLoadDidFinishCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteLoadDidFinishCompletion:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setRemoteViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteViewController:];
}

id objc_msgSend_setResponseBlock_(void *a1, const char *a2, ...)
{
  return [a1 setResponseBlock:];
}

id objc_msgSend_setResponseConnection_(void *a1, const char *a2, ...)
{
  return [a1 setResponseConnection:];
}

id objc_msgSend_setReviewInAppController_(void *a1, const char *a2, ...)
{
  return [a1 setReviewInAppController:];
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setRightBarButtonItem:];
}

id objc_msgSend_setRightBarButtonItem_animated_(void *a1, const char *a2, ...)
{
  return [a1 setRightBarButtonItem:animated:];
}

id objc_msgSend_setRightBarButtonItems_(void *a1, const char *a2, ...)
{
  return [a1 setRightBarButtonItems:];
}

id objc_msgSend_setSandboxed_(void *a1, const char *a2, ...)
{
  return [a1 setSandboxed:];
}

id objc_msgSend_setSavedViewController_(void *a1, const char *a2, ...)
{
  return [a1 setSavedViewController:];
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return [a1 setScheme:];
}

id objc_msgSend_setShouldDismissOnUILock_(void *a1, const char *a2, ...)
{
  return [a1 setShouldDismissOnUILock:];
}

id objc_msgSend_setShouldShowOnboarding_(void *a1, const char *a2, ...)
{
  return [a1 setShouldShowOnboarding:];
}

id objc_msgSend_setShouldSignRequests_(void *a1, const char *a2, ...)
{
  return [a1 setShouldSignRequests:];
}

id objc_msgSend_setShouldUseAMS_(void *a1, const char *a2, ...)
{
  return [a1 setShouldUseAMS:];
}

id objc_msgSend_setShowAccountGlyph_(void *a1, const char *a2, ...)
{
  return [a1 setShowAccountGlyph:];
}

id objc_msgSend_setShowDialogOnError_(void *a1, const char *a2, ...)
{
  return [a1 setShowDialogOnError:];
}

id objc_msgSend_setShowsLinkToUnifiedAbout_(void *a1, const char *a2, ...)
{
  return [a1 setShowsLinkToUnifiedAbout:];
}

id objc_msgSend_setShowsRightBarButton_(void *a1, const char *a2, ...)
{
  return [a1 setShowsRightBarButton:];
}

id objc_msgSend_setShowsStoreButton_(void *a1, const char *a2, ...)
{
  return [a1 setShowsStoreButton:];
}

id objc_msgSend_setSourceAppAdamId_(void *a1, const char *a2, ...)
{
  return [a1 setSourceAppAdamId:];
}

id objc_msgSend_setSourceAppBundleId_(void *a1, const char *a2, ...)
{
  return [a1 setSourceAppBundleId:];
}

id objc_msgSend_setSourceRect_(void *a1, const char *a2, ...)
{
  return [a1 setSourceRect:];
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return [a1 setSourceView:];
}

id objc_msgSend_setSpecifier_(void *a1, const char *a2, ...)
{
  return [a1 setSpecifier:];
}

id objc_msgSend_setSplashNavigationController_(void *a1, const char *a2, ...)
{
  return [a1 setSplashNavigationController:];
}

id objc_msgSend_setStiffness_(void *a1, const char *a2, ...)
{
  return [a1 setStiffness:];
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:];
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return [a1 setSwipeDismissalStyle:];
}

id objc_msgSend_setTabBarItems_(void *a1, const char *a2, ...)
{
  return [a1 setTabBarItems:];
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return [a1 setTag:];
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return [a1 setTarget:];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setTextAlignment:];
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return [a1 setTextColor:];
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setTimestamp:];
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return [a1 setTimingFunction:];
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setTintColor:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTitleView_(void *a1, const char *a2, ...)
{
  return [a1 setTitleView:];
}

id objc_msgSend_setTransitioningDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setTransitioningDelegate:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return [a1 setURL:];
}

id objc_msgSend_setURLString_(void *a1, const char *a2, ...)
{
  return [a1 setURLString:];
}

id objc_msgSend_setUnderlyingViewController_(void *a1, const char *a2, ...)
{
  return [a1 setUnderlyingViewController:];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setUserInteractionEnabled:];
}

id objc_msgSend_setValue_forRequestParameter_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forRequestParameter:];
}

id objc_msgSend_setVelocity_(void *a1, const char *a2, ...)
{
  return [a1 setVelocity:];
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return [a1 setVersion:];
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return [a1 setView:];
}

id objc_msgSend_setViewController_(void *a1, const char *a2, ...)
{
  return [a1 setViewController:];
}

id objc_msgSend_setViewControllerFactory_(void *a1, const char *a2, ...)
{
  return [a1 setViewControllerFactory:];
}

id objc_msgSend_setViewControllerShown_(void *a1, const char *a2, ...)
{
  return [a1 setViewControllerShown:];
}

id objc_msgSend_setVisibleInClientWindow_(void *a1, const char *a2, ...)
{
  return [a1 setVisibleInClientWindow:];
}

id objc_msgSend_setWallpaperTunnelActive_(void *a1, const char *a2, ...)
{
  return [a1 setWallpaperTunnelActive:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setupWithClientBundleID_bagType_(void *a1, const char *a2, ...)
{
  return [a1 setupWithClientBundleID:bagType:];
}

id objc_msgSend_setupWithContainerViewController_(void *a1, const char *a2, ...)
{
  return [a1 setupWithContainerViewController:];
}

id objc_msgSend_setupWithParameters_(void *a1, const char *a2, ...)
{
  return [a1 setupWithParameters:];
}

id objc_msgSend_shakeTitleView(void *a1, const char *a2, ...)
{
  return _[a1 shakeTitleView];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfig];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _[a1 sharedController];
}

id objc_msgSend_sharedDaemonConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedDaemonConfig];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _[a1 sharedService];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return _[a1 sharedSession];
}

id objc_msgSend_shouldHandleSafariScriptURL_(void *a1, const char *a2, ...)
{
  return [a1 shouldHandleSafariScriptURL:];
}

id objc_msgSend_shouldLog(void *a1, const char *a2, ...)
{
  return _[a1 shouldLog];
}

id objc_msgSend_shouldLogToDisk(void *a1, const char *a2, ...)
{
  return _[a1 shouldLogToDisk];
}

id objc_msgSend_shouldShowOnboarding(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowOnboarding];
}

id objc_msgSend_shouldUseAMS(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseAMS];
}

id objc_msgSend_show(void *a1, const char *a2, ...)
{
  return _[a1 show];
}

id objc_msgSend_showAccountGlyph(void *a1, const char *a2, ...)
{
  return _[a1 showAccountGlyph];
}

id objc_msgSend_showErrorPageWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 showErrorPageWithCompletion:];
}

id objc_msgSend_showProductPageWithItemIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 showProductPageWithItemIdentifier:];
}

id objc_msgSend_showViewController_sender_(void *a1, const char *a2, ...)
{
  return [a1 showViewController:sender:];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return [a1 sizeThatFits:];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 sleepForTimeInterval:];
}

id objc_msgSend_sourceRect(void *a1, const char *a2, ...)
{
  return _[a1 sourceRect];
}

id objc_msgSend_sourceView(void *a1, const char *a2, ...)
{
  return _[a1 sourceView];
}

id objc_msgSend_splashDoneButtonPressed_(void *a1, const char *a2, ...)
{
  return [a1 splashDoneButtonPressed:];
}

id objc_msgSend_splashNavigationController(void *a1, const char *a2, ...)
{
  return _[a1 splashNavigationController];
}

id objc_msgSend_splashPageWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 splashPageWithBundleIdentifier:];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 startWithCompletionBlock:];
}

id objc_msgSend_startWithLookupBlock_(void *a1, const char *a2, ...)
{
  return [a1 startWithLookupBlock:];
}

id objc_msgSend_statusBarOrientation(void *a1, const char *a2, ...)
{
  return _[a1 statusBarOrientation];
}

id objc_msgSend_storeKitServiceWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 storeKitServiceWithErrorHandler:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_su_bridgedNavigationItem(void *a1, const char *a2, ...)
{
  return [a1 su_bridgedNavigationItem];
}

id objc_msgSend_su_setBridgedNavigationItem_(void *a1, const char *a2, ...)
{
  return [a1 su_setBridgedNavigationItem:];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_synchonrizeContinainerViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 synchonrizeContinainerViewControllers];
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 synchronousRemoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGroupedBackgroundColor];
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return _[a1 systemPinkColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _[a1 tag];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleView(void *a1, const char *a2, ...)
{
  return _[a1 titleView];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_transitionCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 transitionCoordinator];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typeForURL_(void *a1, const char *a2, ...)
{
  return [a1 typeForURL:];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return [a1 unarchivedObjectOfClass:fromData:error:];
}

id objc_msgSend_underlyingURL(void *a1, const char *a2, ...)
{
  return _[a1 underlyingURL];
}

id objc_msgSend_underlyingViewController(void *a1, const char *a2, ...)
{
  return _[a1 underlyingViewController];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updatedTransactions_(void *a1, const char *a2, ...)
{
  return [a1 updatedTransactions:];
}

id objc_msgSend_urlByReplacingSchemeWithScheme_(void *a1, const char *a2, ...)
{
  return [a1 urlByReplacingSchemeWithScheme:];
}

id objc_msgSend_userDidInteractWithProduct_(void *a1, const char *a2, ...)
{
  return [a1 userDidInteractWithProduct:];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return [a1 valueWithBytes:objCType:];
}

id objc_msgSend_valueWithRect_(void *a1, const char *a2, ...)
{
  return [a1 valueWithRect:];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllerFactory(void *a1, const char *a2, ...)
{
  return _[a1 viewControllerFactory];
}

id objc_msgSend_viewControllerForMediaType_completion_(void *a1, const char *a2, ...)
{
  return [a1 viewControllerForMediaType:completion:];
}

id objc_msgSend_viewControllerShown(void *a1, const char *a2, ...)
{
  return _[a1 viewControllerShown];
}

id objc_msgSend_viewWillTransitionToSize_withTransitionCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 viewWillTransitionToSize:withTransitionCoordinator:];
}

id objc_msgSend_visibleInClientWindow(void *a1, const char *a2, ...)
{
  return _[a1 visibleInClientWindow];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_weakReferenceWithObject_(void *a1, const char *a2, ...)
{
  return [a1 weakReferenceWithObject];
}

id objc_msgSend_webView(void *a1, const char *a2, ...)
{
  return _[a1 webView];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _[a1 webpageURL];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 willMoveToParentViewController:];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}