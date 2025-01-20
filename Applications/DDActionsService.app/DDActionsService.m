void sub_10000536C(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void sub_1000053C4(uint64_t a1)
{
}

void *sub_1000053F4(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 16));
  result = a1;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 24) & 1;
  return result;
}

unsigned char *sub_100005458(unsigned char *result)
{
  void *result = 0;
  result[1] = 0;
  return result;
}

void sub_100005474(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
  if ((*(unsigned char *)(a1 + 48) & 1) != 0 && !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v3 = (dispatch_once_t *)&unk_100028728;
    id location = 0;
    objc_storeStrong(&location, &stru_100020600);
    if (*v3 != -1) {
      dispatch_once(v3, location);
    }
    objc_storeStrong(&location, 0);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
}

void sub_100005558(id a1)
{
  location[2] = a1;
  location[1] = a1;
  location[0] = &_os_log_default;
  char v4 = 16;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
  {
    log = location[0];
    os_log_type_t type = v4;
    sub_100005458(v3);
    _os_log_error_impl((void *)&_mh_execute_header, log, type, "Couldn't fetch the bag, network calls will be disabled", v3, 2u);
  }
  objc_storeStrong(location, 0);
}

intptr_t sub_100005798(intptr_t result)
{
  intptr_t v1 = result;
  if ((*(unsigned char *)(*(void *)(result + 32) + 24) & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(result + 32) + 16), *(id *)(result + 40));
    *(unsigned char *)(*(void *)(v1 + 32) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }
  return result;
}

void sub_100007868(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = (char *)[location[0] range];
  if (v2 == 3)
  {
    id v3 = [*(id *)(*(void *)(a1[4] + 8) + 40) stringByReplacingCharactersInRange:v7 + 1 withString:@"״"];
    uint64_t v4 = *(void *)(a1[4] + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  objc_storeStrong(location, 0);
}

void sub_100007958(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.lookup.dictionary", 0);
  uint64_t v2 = (void *)qword_100028730;
  qword_100028730 = (uint64_t)v1;
}

void sub_1000079A4(uint64_t a1)
{
  v7[2] = (id)a1;
  v7[1] = (id)a1;
  v7[0] = [objc_alloc((Class)SFStartLocalSearchFeedback) initWithInput:*(void *)(a1 + 32) triggerEvent:11 indexType:6 queryId:*(void *)(a1 + 56)];
  id v6 = +[DDLookupQuery dictionarySectionForString:*(void *)(a1 + 32) queryId:*(void *)(a1 + 56)];
  char v4 = 0;
  if (v6)
  {
    id v8 = v6;
    v5 = +[NSArray arrayWithObjects:&v8 count:1];
    char v4 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), &__NSArray0__struct);
  }
  if (v4) {

  }
  id v3 = [objc_alloc((Class)SFEndLocalSearchFeedback) initWithStartSearch:v7[0]];
  id v2 = [*(id *)(a1 + 40) feedbackListener];
  [v2 didStartSearch:v7[0]];
  [v2 didEndSearch:v3];
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
}

void sub_100007BA8(uint64_t a1)
{
  v11[5] = (id)a1;
  v11[4] = (id)a1;
  group = *(NSObject **)(a1 + 32);
  dispatch_queue_t queue = &_dispatch_main_q;
  char v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_100007D04;
  id v8 = &unk_1000206E8;
  v11[1] = *(id *)(a1 + 64);
  v11[2] = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  v11[3] = *(id *)(a1 + 80);
  v11[0] = *(id *)(a1 + 56);
  dispatch_group_notify(group, queue, &v4);

  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
}

void sub_100007D04(uint64_t a1)
{
  uint64_t v17 = a1;
  uint64_t v16 = a1;
  BOOL v1 = (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) & 1) != 0;
  char v14 = 0;
  char v12 = 0;
  BOOL v8 = 0;
  if (!v1)
  {
    BOOL v8 = 0;
    if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
    {
      id v15 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectAtIndexedSubscript:0];
      char v14 = 1;
      id v13 = [v15 results];
      char v12 = 1;
      BOOL v8 = [v13 count] != 0;
    }
  }
  if (v12) {

  }
  if (v14) {
  if (v8)
  }
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.datadetectors.ui", 1);
    id v2 = objc_alloc((Class)SFErrorFeedback);
    id v10 = [v2 initWithError:v11];
    id v3 = [*(id *)(a1 + 32) feedbackListener];
    [v3 didErrorOccur:v10];

    int v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v6 = +[DDLookupQuery footerSectionForString:*(void *)(a1 + 40) queryId:*(void *)(a1 + 72)];
    id v9 = [v5 _rankFeedbackWithLocalSections:v4, 0];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
    objc_storeStrong((id *)&v11, 0);
  }
}

void sub_100007FC8(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v20 = 0;
  objc_storeStrong(&v20, a3);
  v19[1] = (id)a1;
  if (v20)
  {
    id v3 = objc_alloc((Class)SFErrorFeedback);
    v19[0] = [v3 initWithError:v20];
    id v6 = [*(id *)(a1 + 32) feedbackListener];
    [v6 didErrorOccur:v19[0]];

    objc_storeStrong(v19, 0);
  }
  group = *(NSObject **)(a1 + 40);
  dispatch_queue_t queue = &_dispatch_main_q;
  id v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  char v12 = sub_10000822C;
  id v13 = &unk_100020738;
  v18[1] = *(id *)(a1 + 64);
  id v14 = v20;
  v18[2] = *(id *)(a1 + 72);
  id v15 = *(id *)(a1 + 32);
  id v16 = location[0];
  id v17 = *(id *)(a1 + 48);
  v18[3] = *(id *)(a1 + 80);
  v18[0] = *(id *)(a1 + 56);
  dispatch_group_notify(group, queue, &v9);

  objc_storeStrong(v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void sub_10000822C(void *a1)
{
  v8[2] = a1;
  v8[1] = a1;
  if ((*(unsigned char *)(*(void *)(a1[9] + 8) + 24) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
    v8[0] = 0;
    if (!a1[4] || [*(id *)(*(void *)(a1[10] + 8) + 40) count])
    {
      int v5 = (void *)a1[5];
      uint64_t v3 = *(void *)(*(void *)(a1[10] + 8) + 40);
      uint64_t v4 = a1[6];
      id v6 = +[DDLookupQuery footerSectionForString:a1[7] queryId:a1[11]];
      id v1 = [v5 _rankFeedbackWithLocalSections:v3 remoteSections:v4];
      id v2 = v8[0];
      v8[0] = v1;
    }
    (*(void (**)(void))(a1[8] + 16))();
    objc_storeStrong(v8, 0);
  }
}

void sub_100008384(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v23 = 0;
  objc_storeStrong(&v23, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  v21[1] = (id)a1;
  if (v22)
  {
    id v4 = objc_alloc((Class)SFErrorFeedback);
    v21[0] = [v4 initWithError:v22];
    id v7 = [*(id *)(a1 + 32) feedbackListener];
    [v7 didErrorOccur:v21[0]];

    objc_storeStrong(v21, 0);
  }
  group = *(NSObject **)(a1 + 40);
  dispatch_queue_t queue = &_dispatch_main_q;
  int v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_100008608;
  id v15 = &unk_100020738;
  v20[1] = *(id *)(a1 + 64);
  id v16 = v22;
  v20[2] = *(id *)(a1 + 72);
  id v17 = *(id *)(a1 + 32);
  id v18 = v23;
  id v19 = *(id *)(a1 + 48);
  v20[3] = *(id *)(a1 + 80);
  v20[0] = *(id *)(a1 + 56);
  dispatch_group_notify(group, queue, &v11);

  objc_storeStrong(v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void sub_100008608(uint64_t a1)
{
  v8[2] = (id)a1;
  v8[1] = (id)a1;
  if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    v8[0] = 0;
    if (!*(void *)(a1 + 32) || [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count])
    {
      id v4 = *(void **)(a1 + 40);
      uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      id v6 = [*(id *)(a1 + 48) sections];
      id v5 = +[DDLookupQuery footerSectionForString:*(void *)(a1 + 56) queryId:*(void *)(a1 + 88)];
      id v1 = [v4 _rankFeedbackWithLocalSections:v3 remoteSections:v6];
      id v2 = v8[0];
      v8[0] = v1;
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    objc_storeStrong(v8, 0);
  }
}

void sub_10000877C(uint64_t a1)
{
  v16[2] = (id)a1;
  v16[1] = (id)a1;
  v16[0] = &__NSArray0__struct;
  id v15 = +[DDLookupQuery dictionarySectionForString:*(void *)(a1 + 32) queryId:*(void *)(a1 + 48)];
  if (v15)
  {
    id v1 = [v16[0] arrayByAddingObject:v15];
    id v2 = v16[0];
    v16[0] = v1;
  }
  id v14 = +[DDLookupQuery footerSectionForString:*(void *)(a1 + 32) queryId:*(void *)(a1 + 48)];
  if (v15 && v14)
  {
    id v3 = [v16[0] arrayByAddingObject:v14];
    id v4 = v16[0];
    v16[0] = v3;
  }
  dispatch_queue_t queue = &_dispatch_main_q;
  id v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  int v10 = sub_100008998;
  int v11 = &unk_1000207B0;
  id v13 = *(id *)(a1 + 40);
  id v12 = v16[0];
  dispatch_async(queue, &v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

uint64_t sub_100008998(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100009410(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [a1[4] updateForCurrentTraitCollection];
  objc_storeStrong(location, 0);
}

void sub_100009E24(id *a1, char a2, id obj)
{
  v28 = a1;
  char v27 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v25[1] = a1;
  if ((v27 & 1) == 0 || location)
  {
    id v14 = &_os_log_default;
    char v13 = 16;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      log = v14;
      os_log_type_t type = v13;
      sub_100005458(v12);
      _os_log_error_impl((void *)&_mh_execute_header, log, type, "Event Store access for DDEventAddViewController not granted.", v12, 2u);
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v25[0] = [a1[4] context];
    id v9 = [v25[0] objectForKeyedSubscript:kDataDetectorsIsAccountManagedKey];
    BOOL v10 = ([v9 BOOLValue] & 1) != 1;

    if (!v10)
    {
      id v7 = a1[5];
      id v8 = [a1[6] _hostApplicationBundleIdentifier];
      [v7 setSourceAccountManagement:2];
    }
    id v5 = [a1[4] context];
    id v24 = [v5 objectForKeyedSubscript:kDataDetectorsICSKey];

    dispatch_queue_t queue = &_dispatch_main_q;
    id v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    id v18 = sub_10000A168;
    id v19 = &unk_100020830;
    id v20 = v24;
    id v21 = a1[5];
    id v22 = a1[6];
    id v23 = a1[4];
    dispatch_async(queue, &v15);

    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(v25, 0);
  }
  objc_storeStrong(&location, 0);
}

void sub_10000A168(uint64_t a1)
{
  v14[2] = (id)a1;
  v14[1] = (id)a1;
  if (*(void *)(a1 + 32))
  {
    id v7 = objc_alloc((Class)EKICSPreviewController);
    id v8 = [*(id *)(a1 + 32) dataUsingEncoding:4];
    v14[0] = [v7 initWithData:v7 eventStore:v7];

    [v14[0] setAllowsImport:1];
    [v14[0] setPreviewDelegate:*(void *)(a1 + 48)];
    [v14[0] setCancelButtonWithTarget:*(void *)(a1 + 48) action:"doneWithAddingEvent"];
    id v9 = [v14[0] viewController];
    [v9 setModalInPresentation:1];

    objc_storeStrong((id *)(*(void *)(a1 + 48) + 24), v14[0]);
    [*(id *)(a1 + 48) setModalInPresentation:1];
    objc_storeStrong(v14, 0);
  }
  id v5 = *(id **)(a1 + 48);
  id v6 = [v5[3] viewController];
  [v5 pushViewController:animated:];

  [*(id *)(a1 + 48) setAction:*(void *)(a1 + 56)];
  id v13 = &_os_log_default;
  char v12 = 2;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEBUG))
  {
    log = v13;
    os_log_type_t type = v12;
    id v4 = [*(id *)(a1 + 48) _remoteViewControllerProxy];
    id v11 = v4;
    sub_10000A468((uint64_t)v15, (uint64_t)v11);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "Telling proxy %@ that the remote view controller is ready", v15, 0xCu);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  [*(id *)(a1 + 48) setCancellable:0];
  id v1 = [*(id *)(a1 + 48) _remoteViewControllerProxy];
  [v1 viewControllerReady];
}

uint64_t sub_10000A468(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_10000A73C(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = +[UIApplication sharedApplication];
  BOOL v3 = [a1[4] verticalSizeClass] == (id)1;
  [a1[5] transitionDuration];
  -[UIApplication setStatusBarHidden:duration:](v4, "setStatusBarHidden:duration:", v3);

  objc_storeStrong(location, 0);
}

int main(int argc, const char **argv, const char **envp)
{
  +[CLLocationManager setDefaultEffectiveBundleIdentifier:@"com.apple.Maps"];
  BOOL v3 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v3);
  int v9 = UIApplicationMain(argc, (char **)argv, 0, v5);

  return v9;
}

void sub_10000AD88(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 40) view];
  [v3 setAlpha:0.0];
}

id sub_10000AE10(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:1.0];

  return [*(id *)(a1 + 40) completeTransition:[*(id *)(a1 + 40) transitionWasCancelled] ^ 1 & 1];
}

void sub_10000B22C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  *(void *)(v12 - 88) = a1;
  *(_DWORD *)(v12 - 92) = a2;
  objc_destroyWeak((id *)(v12 - 64));
  _Unwind_Resume(*(_Unwind_Exception **)(v12 - 88));
}

void sub_10000B26C(uint64_t a1)
{
  v17[2] = (id)a1;
  v17[1] = (id)a1;
  if ([*(id *)(a1 + 32) length])
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    char v6 = *(unsigned char *)(a1 + 96);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 72);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained DDViewScale];
    double v9 = v1;
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    id v15 = sub_10000B428;
    int v16 = &unk_1000208F8;
    objc_copyWeak(v17, (id *)(a1 + 64));
    [v4 sectionsForString:v5 useNetwork:v6 & 1 clientId:v7 queryId:v8 selectionType:1 domain:0 range:v9 scale:v3 proxy:v12 handler:];

    objc_destroyWeak(v17);
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)(a1 + 64));
    [v10 showError:0 animated:0];
  }
}

void sub_10000B428(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = 0;
  objc_storeStrong(&v6, a3);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained addSections:location[0] error:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

void sub_10000B5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, _Unwind_Exception *exception_object, char a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(&a20);
  objc_destroyWeak((id *)(v20 - 32));
  _Unwind_Resume(a1);
}

void sub_10000B600(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _remoteViewControllerProxy];
  [v2 performClientQueryWithServerAccessPermitted:*(unsigned char *)(a1 + 40) & 1 localSearchPermitted:1];
}

void sub_10000BA5C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  *(void *)(v11 - 80) = a1;
  *(_DWORD *)(v11 - 84) = a2;
  objc_destroyWeak((id *)(v11 - 56));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 80));
}

void sub_10000BA9C(uint64_t a1)
{
  v17[2] = (id)a1;
  v17[1] = (id)a1;
  if (*(void *)(a1 + 32))
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 64) = 1;
    uint64_t v3 = *(void **)(a1 + 48);
    id v4 = [*(id *)(a1 + 32) coreResult];
    char v5 = *(unsigned char *)(a1 + 88);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 80);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained DDViewScale];
    double v8 = v1;
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    id v15 = sub_10000BC50;
    int v16 = &unk_1000208F8;
    objc_copyWeak(v17, (id *)(a1 + 72));
    [v3 sectionsForResult:v4 useNetwork:v5 & 1 clientId:v6 queryId:v7 scale:v9 proxy:&v12 handler:v8];

    objc_destroyWeak(v17);
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)(a1 + 72));
    [v10 showError:0 animated:0];
  }
}

void sub_10000BC50(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = 0;
  objc_storeStrong(&v6, a3);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained addSections:location[0] error:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

id sub_10000C754(id *a1)
{
  id v10 = a1;
  uint64_t v9 = a1;
  if (a1[4] && ![a1[5] count]) {
    return [a1[6] showError:a1[4] animated:0];
  }
  BOOL v2 = a1[4] == 0;
  char v7 = 0;
  char v4 = 0;
  if (!v2)
  {
    unsigned __int8 v3 = 0;
    if (a1[4])
    {
      unsigned __int8 v3 = 0;
      if ([a1[4] code] == (id)-1009)
      {
        id v8 = [a1[4] domain];
        char v7 = 1;
        unsigned __int8 v3 = [v8 isEqualToString:NSURLErrorDomain];
      }
    }
    char v4 = v3 ^ 1;
  }
  if (v7) {

  }
  if (v4)
  {
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      sub_10000A468((uint64_t)v11, (uint64_t)a1[4]);
      _os_log_fault_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_FAULT, "We have dictionary results, ignoring Parsec error: %@", v11, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  return [a1[6] setSections:a1[5]];
}

void sub_10000D958(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 8) view];
  [v1 setAlpha:1.0];
}

id sub_10000E734(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  if (*(void *)(*(void *)(a1 + 32) + 48)
    && ([*(id *)(*(void *)(a1 + 32) + 48) timeIntervalSinceNow], v1 > -1.0))
  {
    if (*(void *)(a1 + 40))
    {
      location[0] = &_os_log_default;
      char v13 = 2;
      if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
      {
        log = location[0];
        os_log_type_t type = v13;
        sub_100005458(v12);
        _os_log_debug_impl((void *)&_mh_execute_header, log, type, "Ignoring viewDisappearFeedback, probably pop from orb", v12, 2u);
      }
      objc_storeStrong(location, 0);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setQueryBlock:0];
    if (*(void *)(a1 + 40))
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 16) feedbackListener];
      [v5 searchViewDidDisappear:*(void *)(a1 + 40)];

      id v11 = &_os_log_default;
      char v10 = 2;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
      {
        unsigned __int8 v3 = v11;
        os_log_type_t v4 = v10;
        sub_100005458(v9);
        _os_log_debug_impl((void *)&_mh_execute_header, v3, v4, "Sending delayed viewDisappearFeedback", v9, 2u);
      }
      objc_storeStrong(&v11, 0);
    }
  }
  return [UIApp endBackgroundTask:*(void *)(a1 + 48)];
}

void sub_10000EAFC(uint64_t a1, char a2)
{
  uint64_t v13 = a1;
  char v12 = a2 & 1;
  uint64_t v11 = a1;
  dispatch_queue_t queue = &_dispatch_main_q;
  os_log_type_t v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = sub_10000EBEC;
  id v8 = &unk_1000209E8;
  id v9 = *(id *)(a1 + 32);
  char v10 = v12 & 1;
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0);
}

void sub_10000EBEC(uint64_t a1)
{
  BOOL v2 = +[UIApplication sharedApplication];
  char v3 = 1;
  if ([*(id *)(a1 + 32) verticalSizeClass] != (id)1) {
    char v3 = *(unsigned char *)(a1 + 40);
  }
  [(UIApplication *)v2 setStatusBarHidden:v3 & 1 duration:0.0];
}

uint64_t sub_10000F600(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result) {
    return (uint64_t)[*(id *)(a1 + 32) updateStyle];
  }
  return result;
}

void sub_100010134(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (location[0])
  {
    BOOL v2 = (void (**)(void))(a1[4] + 16);
    char v3 = +[UIImage imageWithData:location[0]];
    (*v2)();
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(location, 0);
}

void sub_1000108B4(uint64_t a1)
{
  v24[2] = (id)a1;
  v24[1] = (id)a1;
  v24[0] = [[DDReminderCreationController alloc] initWithAction:*(void *)(a1 + 32) delegate:*(void *)(a1 + 40)];
  id v23 = [objc_alloc((Class)REMReminderCreationViewController) initWithDelegate:v24[0]];
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 32), v24[0]);
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), v23);
  if (!+[NSThread isMainThread])
  {
    int v14 = +[NSAssertionHandler currentHandler];
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v14, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(a1 + 40), @"DDReminderViewController.m", 63, @"-[DDReminderViewController prepareForAction:] should be called from the main thread!");
  }
  [*(id *)(a1 + 40) addChildViewController:v23];
  id v10 = [*(id *)(a1 + 40) view];
  id v9 = [v23 view];
  [v10 addSubview:];

  [v23 didMoveToParentViewController:*(void *)(a1 + 40)];
  id v12 = [*(id *)(a1 + 40) view];
  [v12 bounds];
  *(void *)&long long v21 = v1;
  *((void *)&v21 + 1) = v2;
  *(void *)&long long v22 = v3;
  *((void *)&v22 + 1) = v4;
  id v11 = [v23 view];
  long long v19 = v21;
  long long v20 = v22;
  [v11 setFrame:v21, v22];

  id v13 = [v23 view];
  [v13 setAutoresizingMask:18];

  os_log_t oslog = &_os_log_default;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    log = oslog;
    os_log_type_t v7 = type;
    id v8 = [*(id *)(a1 + 40) _remoteViewControllerProxy];
    id v16 = v8;
    sub_10000A468((uint64_t)v25, (uint64_t)v16);
    _os_log_debug_impl((void *)&_mh_execute_header, log, v7, "Telling proxy %@ that the remote view controller is ready", v25, 0xCu);

    objc_storeStrong(&v16, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  [*(id *)(a1 + 40) setCancellable:0];
  id v5 = [*(id *)(a1 + 40) _remoteViewControllerProxy];
  [v5 viewControllerReady];

  objc_storeStrong(&v23, 0);
  objc_storeStrong(v24, 0);
}

uint64_t sub_10001145C(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  char v2 = sub_100011BD8(location);
  objc_storeStrong(&location, 0);
  return v2 & 1;
}

void sub_1000114B8(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v16 = 0;
  objc_storeStrong(&v16, a3);
  v15[1] = (id)a1;
  v15[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v15[0])
  {
    if (v16 || ![location[0] length])
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      if (v16)
      {
        os_log_t oslog = &_os_log_default;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          sub_10000A468((uint64_t)v18, (uint64_t)v16);
          _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to fetch title: %@", v18, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
    }
    else
    {
      dispatch_queue_t queue = *((void *)v15[0] + 3);
      os_log_type_t v7 = _NSConcreteStackBlock;
      int v8 = -1073741824;
      int v9 = 0;
      id v10 = sub_100011760;
      id v11 = &unk_100020650;
      id v12 = v15[0];
      id v13 = location[0];
      id v14 = *(id *)(a1 + 32);
      dispatch_async(queue, &v7);
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v12, 0);
    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void sub_100011760(uint64_t a1)
{
}

uint64_t sub_100011BD8(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v5 = (id)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  id v3 = v5;
  unsigned int v2 = [v3 containsObject:location] ^ 1;
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&location, 0);
  return v2 & 1;
}

NSString *sub_100012478(uint64_t a1)
{
  uint64_t v7 = a1;
  int Category = DDResultGetCategory();
  CFTypeRef cf1 = 0;
  if (Category == 2)
  {
    int v8 = CNContactPhoneNumbersKey;
  }
  else if (Category == 3)
  {
    int v8 = CNContactPostalAddressesKey;
  }
  else
  {
    CFTypeRef cf1 = (CFTypeRef)DDResultGetType();
    BOOL v1 = CFEqual(cf1, DDBinderEmailKey) != 0;
    if (v1 || CFEqual(cf1, DDBinderJabberOrEmailKey) || CFEqual(cf1, DDBinderAIMOrEmailKey))
    {
      int v8 = CNContactEmailAddressesKey;
    }
    else if (CFEqual(cf1, DDBinderGenericURLKey))
    {
      id location = [(id)DDResultGetMatchedString() lowercaseString];
      if ([location hasPrefix:@"mailto:"])
      {
        int v8 = CNContactEmailAddressesKey;
      }
      else if ([location hasPrefix:@"tel:"])
      {
        int v8 = CNContactPhoneNumbersKey;
      }
      else
      {
        int v8 = 0;
      }
      objc_storeStrong(&location, 0);
    }
    else if (CFEqual(cf1, DDBinderIMScreenNameKey))
    {
      int v8 = CNContactInstantMessageAddressesKey;
    }
    else
    {
      int v8 = 0;
    }
  }
  unsigned int v2 = v8;

  return v2;
}

void sub_1000126CC(uint64_t a1)
{
  v12[2] = (id)a1;
  v12[1] = (id)a1;
  v12[0] = +[CNContactViewController viewControllerForUnknownContact:*(void *)(a1 + 32)];
  id v2 = (id)objc_opt_new();
  [v12[0] setContactStore:];

  [v12[0] setAllowsActions:1];
  [v12[0] setDelegate:*(void *)(a1 + 40)];
  [v12[0] setActions:33];
  [v12[0] setEditMode:0];
  id v3 = +[DDAddToContactsViewController alternateNameForContact:*(void *)(a1 + 32)];
  [v12[0] setAlternateName:];

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), v12[0]);
  *(unsigned char *)(*(void *)(a1 + 40) + 32) = 0;
  if (*(void *)(a1 + 48))
  {
    id location = [*(id *)(a1 + 32) valueForKey:*(void *)(a1 + 48)];
    if ([location count] == (id)1) {
      [v12[0] setPrimaryPropertyKey:*(void *)(a1 + 48)];
    }
    objc_storeStrong(&location, 0);
  }
  id v1 = [v12[0] contactStore];
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_10001293C;
  int v9 = &unk_100020A88;
  id v10 = *(id *)(a1 + 40);
  [v1 requestAccessForEntityType:0 completionHandler:&v5];

  objc_storeStrong(&v10, 0);
  objc_storeStrong(v12, 0);
}

void sub_10001293C(id *a1, char a2, id obj)
{
  id v18 = a1;
  char v17 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v15[1] = a1;
  if ((v17 & 1) == 0 || location)
  {
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v4 = type;
      sub_100005458(v7);
      _os_log_error_impl((void *)&_mh_execute_header, log, v4, "Contact Store access for person view controller not granted.", v7, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    dispatch_queue_t queue = &_dispatch_main_q;
    id v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    id v13 = sub_100012AE4;
    id v14 = &unk_100020998;
    v15[0] = a1[4];
    dispatch_async(queue, &v10);

    objc_storeStrong(v15, 0);
  }
  objc_storeStrong(&location, 0);
}

void sub_100012AE4(id *a1)
{
  v10[2] = a1;
  v10[1] = a1;
  [a1[4] pushViewController:*((void *)a1[4] + 3) animated:0];
  [a1[4] setCancellable:1];
  v10[0] = [a1[4] _remoteViewControllerProxy];
  id v2 = v10[0];
  os_log_type_t v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_100012CE4;
  int v8 = &unk_100020A10;
  id v9 = a1[4];
  [v2 getIsBeingPresentedInPopover:&v4];
  os_log_t oslog = &_os_log_default;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_10000A468((uint64_t)v11, (uint64_t)v10[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "Telling proxy %@ that we're done", v11, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [v10[0] viewControllerReady];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
}

id sub_100012CE4(uint64_t a1, char a2)
{
  return [*(id *)(a1 + 32) setCancelButtonVisible:!(a2 & 1)];
}

void sub_1000133EC(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  os_log_type_t v4 = +[UIApplication sharedApplication];
  BOOL v3 = [a1[4] verticalSizeClass] == (id)1;
  [a1[5] transitionDuration];
  -[UIApplication setStatusBarHidden:duration:](v4, "setStatusBarHidden:duration:", v3);

  objc_storeStrong(location, 0);
}

void sub_100013A58(id *a1, char a2, id obj)
{
  v60 = a1;
  char v59 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v57[1] = a1;
  if ((v59 & 1) == 0 || location)
  {
    id v42 = &_os_log_default;
    char v41 = 16;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
    {
      log = v42;
      os_log_type_t type = v41;
      sub_100005458(v40);
      _os_log_error_impl((void *)&_mh_execute_header, log, type, "Event Store access for DDEventEditViewController not granted.", v40, 2u);
    }
    objc_storeStrong(&v42, 0);
  }
  else
  {
    id v37 = [a1[4] context];
    id v36 = [v37 objectForKeyedSubscript:kDataDetectorsIsAccountManagedKey];
    BOOL v38 = ([v36 BOOLValue] & 1) != 1;

    if (!v38)
    {
      id v34 = a1[5];
      id v35 = [a1[6] _hostApplicationBundleIdentifier];
      [v34 setSourceAccountManagement:2];
    }
    v57[0] = 0;
    uint64_t v56 = 0;
    [a1[4] associatedResults];
    id v30 = [a1[4] context];
    id v55 = (id)DDUIEventForResults();

    [a1[4] associatedResults];
    id v33 = [a1[4] context];
    id v32 = [a1[6] _hostApplicationBundleIdentifier];
    id v53 = v57[0];
    id v31 = (id)DDUISuggestedEventForResults();
    objc_storeStrong(v57, v53);
    id v54 = v31;

    char v52 = 0;
    if (v31)
    {
      id v28 = [v54 title];
      id v29 = [v28 length];

      if (v29)
      {
        id v27 = [v54 title];
        [v55 setTitle:];

        char v52 = 1;
      }
      id v25 = [v54 notes];
      id v26 = [v25 length];

      if (v26)
      {
        id v24 = [v54 notes];
        [v55 setNotes:];

        char v52 = 1;
      }
      id v23 = [v54 URL];

      if (v23)
      {
        id v22 = [v54 URL];
        [v55 setURL:];

        char v52 = 1;
      }
      id v21 = [v54 location];

      if (v21)
      {
        id v20 = [v54 location];
        [v55 setLocation:];

        char v52 = 1;
      }
      id v19 = [v54 structuredLocation];

      if (v19)
      {
        id v18 = [v54 structuredLocation];
        [v55 setStructuredLocation];

        char v52 = 1;
      }
      id v17 = [v54 startDate];

      if (v17)
      {
        [v55 setAllDay:0];
        id v15 = [v54 startDate];
        [v55 setStartDate:];

        id v16 = [v54 endDate];
        [v55 setEndDate:];

        char v52 = 1;
      }
      id v13 = [v54 startDate];
      LOBYTE(v14) = 0;
      if (!v13)
      {
        [v54 duration];
        LOBYTE(v14) = 0;
        if (v3 > 0.0) {
          unsigned int v14 = [v55 isAllDay] ^ 1;
        }
      }

      if (v14)
      {
        id v12 = [v55 startDate];
        [v54 duration];
        id v11 = [v12 dateByAddingTimeInterval:];
        [v55 setEndDate:];

        char v52 = 1;
      }
      if (v52) {
        *((void *)a1[6] + 5) = v56;
      }
      objc_storeStrong((id *)a1[6] + 7, v57[0]);
    }
    BOOL v10 = 1;
    if ([a1[4] hostApplication] != 1) {
      BOOL v10 = [a1[4] hostApplication] == 2;
    }
    *((unsigned char *)a1[6] + 32) = v10;
    os_log_type_t v4 = sub_100014370(v55, a1[5]);
    int v5 = (void **)((char *)a1[6] + 48);
    int v6 = *v5;
    NSString *v5 = v4;

    dispatch_queue_t queue = &_dispatch_main_q;
    v43 = _NSConcreteStackBlock;
    int v44 = -1073741824;
    int v45 = 0;
    v46 = sub_100014588;
    v47 = &unk_100020830;
    id v48 = a1[6];
    id v49 = a1[5];
    id v50 = v55;
    id v51 = a1[4];
    dispatch_async(queue, &v43);

    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v50, 0);
    objc_storeStrong(&v49, 0);
    objc_storeStrong(&v48, 0);
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v55, 0);
    objc_storeStrong(v57, 0);
  }
  objc_storeStrong(&location, 0);
}

EKEvent *sub_100014370(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v14 = 0;
  objc_storeStrong(&v14, a2);
  id v13 = +[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v14, a1);
  id v5 = [location title];
  -[EKEvent setTitle:](v13, "setTitle:");

  id v6 = [location timeZone];
  -[EKEvent setTimeZone:](v13, "setTimeZone:");

  id v7 = [location startDate];
  -[EKEvent setStartDate:](v13, "setStartDate:");

  id v8 = [location endDate];
  -[EKEvent setEndDate:](v13, "setEndDate:");

  id v9 = [location notes];
  -[EKEvent setNotes:](v13, "setNotes:");

  id v10 = [location location];
  -[EKEvent setLocation:](v13, "setLocation:");

  id v11 = [location URL];
  -[EKEvent setURL:](v13, "setURL:");

  id v12 = v13;
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);

  return v12;
}

void sub_100014588(uint64_t a1)
{
  v20[2] = (id)a1;
  v20[1] = (id)a1;
  v20[0] = objc_alloc_init((Class)EKEventEditViewController);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v20[0]);
  [v20[0] setEventStore:*(void *)(a1 + 40)];
  [v20[0] setEvent:*(void *)(a1 + 48)];
  [v20[0] setEditViewDelegate:*(void *)(a1 + 32)];
  [v20[0] setModalInPresentation:1];
  [*(id *)(a1 + 32) setModalInPresentation:1];
  [*(id *)(a1 + 32) addChildViewController:v20[0]];
  id v19 = [v20[0] view];
  id v9 = [*(id *)(a1 + 32) view];
  [v9 addSubview:v19];

  [v20[0] didMoveToParentViewController:*(void *)(a1 + 32)];
  id v10 = [*(id *)(a1 + 32) view];
  [v10 bounds];
  *(double *)&long long v17 = v1;
  *((double *)&v17 + 1) = v2;
  *(double *)&long long v18 = v3;
  *((double *)&v18 + 1) = v4;
  long long v15 = v17;
  long long v16 = v18;
  [v19 setFrame:v1, v2, v3, v4];

  [v19 setAutoresizingMask:18];
  [*(id *)(a1 + 32) setAction:*(void *)(a1 + 56)];
  os_log_t oslog = &_os_log_default;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    log = oslog;
    os_log_type_t v7 = type;
    id v8 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
    id v12 = v8;
    sub_10000A468((uint64_t)v21, (uint64_t)v12);
    _os_log_debug_impl((void *)&_mh_execute_header, log, v7, "Telling proxy %@ that the remote view controller is ready", v21, 0xCu);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  [*(id *)(a1 + 32) setCancellable:0];
  id v5 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v5 viewControllerReady];

  objc_storeStrong(&v19, 0);
  objc_storeStrong(v20, 0);
}

uint64_t sub_100014DAC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 64;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  return result;
}

void sub_100015004(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  double v4 = +[UIApplication sharedApplication];
  BOOL v3 = [a1[4] verticalSizeClass] == (id)1;
  [a1[5] transitionDuration];
  -[UIApplication setStatusBarHidden:duration:](v4, "setStatusBarHidden:duration:", v3);

  objc_storeStrong(location, 0);
}

id sub_100015238(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v18 = 0;
  objc_storeStrong(&v18, a2);
  id v17 = +[NSMutableString string];
  id v16 = [v18 objectForKeyedSubscript:kDataDetectorsLeadingText];
  id v15 = [v18 objectForKeyedSubscript:kDataDetectorsMiddleText];
  id v14 = [v18 objectForKeyedSubscript:kDataDetectorsTrailingText];
  char v12 = 0;
  BOOL v11 = 0;
  if (!v15)
  {
    id v13 = [location firstObject];
    char v12 = 1;
    BOOL v11 = v13 != 0;
  }
  if (v12) {

  }
  if (v11)
  {

    id v2 = (id)DDResultGetMatchedString();
    id v3 = v15;
    id v15 = v2;
  }
  if (v15)
  {
    if (v16)
    {
      id v9 = [v16 componentsSeparatedByString:@"\n"];
      id v8 = [v9 lastObject];
      [v17 appendString:];
    }
    [v17 appendString:v15];
    if (v14)
    {
      id v7 = [v14 componentsSeparatedByString:@"\n"];
      id v6 = [v7 firstObject];
      [v17 appendString:];
    }
  }
  id v5 = v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&location, 0);

  return v5;
}

id sub_10001556C(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v5 = 0;
  objc_storeStrong(&v5, a2);
  id v4 = [v5 objectForKey:kDataDetectorsEventTitleKey];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&location, 0);

  return v4;
}

id sub_100015618(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v17 = 0;
  objc_storeStrong(&v17, a2);
  id v16 = +[NSMutableArray array];
  if ([location count])
  {
    id v15 = [location sortedArrayUsingFunction:&DDResultProximitySort context:[location objectAtIndex:0]];
    memset(__b, 0, sizeof(__b));
    id v9 = v15;
    id v10 = [v9 countByEnumeratingWithState:__b objects:v19 count:16];
    if (v10)
    {
      uint64_t v6 = *(void *)__b[2];
      uint64_t v7 = 0;
      id v8 = v10;
      while (1)
      {
        uint64_t v5 = v7;
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(__b[1] + 8 * v7);
        v12[2] = v14;
        CFStringRef Type = (const __CFString *)DDResultGetType();
        if (CFEqual(Type, DDBinderPhoneNumberKey))
        {
          v12[1] = 0;
          DDResultCopyPhoneValue();
        }
        ++v7;
        if (v5 + 1 >= (unint64_t)v8)
        {
          uint64_t v7 = 0;
          id v8 = [v9 countByEnumeratingWithState:__b objects:v19 count:16];
          if (!v8) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v15, 0);
  }
  v12[0] = [v17 objectForKey:kDataDetectorsSelectedTextKey];
  if (v12[0]) {
    [v16 addObject:v12[0]];
  }
  id v4 = [v16 componentsJoinedByString:@"\n"];
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&location, 0);

  return v4;
}

id sub_10001598C(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v17 = 0;
  objc_storeStrong(&v17, a2);
  id v16 = 0;
  if ([location count])
  {
    id v15 = [location sortedArrayUsingFunction:&DDResultProximitySort context:[location objectAtIndex:0]];
    memset(__b, 0, 0x40uLL);
    id v11 = v15;
    id v12 = [v11 countByEnumeratingWithState:__b objects:v19 count:16];
    if (v12)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0;
      id v10 = v12;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(v11);
        }
        void __b[8] = *(void *)(__b[1] + 8 * v9);
        CFStringRef Type = (const __CFString *)DDResultGetType();
        if (CFEqual(Type, DDBinderFullAddressKey))
        {
          id v3 = (id)DDResultGetMatchedString();
          id v4 = v16;
          id v16 = v3;
        }
        ++v9;
        if (v7 + 1 >= (unint64_t)v10)
        {
          uint64_t v9 = 0;
          id v10 = [v11 countByEnumeratingWithState:__b objects:v19 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v15, 0);
  }
  id v6 = v16;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&location, 0);

  return v6;
}

id sub_100015C58(void *a1, void *a2, BOOL *a3)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v19 = 0;
  objc_storeStrong(&v19, a2);
  id v18 = a3;
  id v17 = 0;
  if ([location count])
  {
    id v16 = 0;
    char v15 = 0;
    v13[1] = 0;
    id v10 = (id)dueDateAndTimezoneOfEventResults();
    objc_storeStrong(&v16, 0);
    id v14 = v10;
    if (v10)
    {
      id v7 = objc_alloc((Class)NSCalendar);
      uint64_t v9 = +[NSCalendar currentCalendar];
      uint64_t v8 = [(NSCalendar *)v9 calendarIdentifier];
      v13[0] = [v7 initWithCalendarIdentifier:];

      if (v16) {
        [v13[0] setTimeZone:v16];
      }
      id v3 = [v13[0] components:2122492 fromDate:v14];
      id v4 = v17;
      id v17 = v3;

      if (v18) {
        *id v18 = v15 != 0;
      }
      objc_storeStrong(v13, 0);
    }
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v16, 0);
  }
  id v6 = v17;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);

  return v6;
}

uint64_t sub_100015EAC(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v4 = 0;
  objc_storeStrong(&v4, a2);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&location, 0);
  return 0;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

uint64_t DCSSearchFoundationCopyResults()
{
  return _DCSSearchFoundationCopyResults();
}

uint64_t DDAugmentContactWithResultsFromAction()
{
  return _DDAugmentContactWithResultsFromAction();
}

uint64_t DDLocalizedString()
{
  return _DDLocalizedString();
}

uint64_t DDPhoneLabeledValue()
{
  return _DDPhoneLabeledValue();
}

uint64_t DDResultCopyPhoneValue()
{
  return _DDResultCopyPhoneValue();
}

uint64_t DDResultGetCategory()
{
  return _DDResultGetCategory();
}

uint64_t DDResultGetMatchedString()
{
  return _DDResultGetMatchedString();
}

uint64_t DDResultGetParsecRawDomain()
{
  return _DDResultGetParsecRawDomain();
}

uint64_t DDResultGetType()
{
  return _DDResultGetType();
}

uint64_t DDResultHasType()
{
  return _DDResultHasType();
}

uint64_t DDUIAugmentedContextForEvent()
{
  return _DDUIAugmentedContextForEvent();
}

uint64_t DDUIEventForResults()
{
  return _DDUIEventForResults();
}

uint64_t DDUISuggestedEventForResults()
{
  return _DDUISuggestedEventForResults();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _DDUICalendarIsTitleGenerationUsed()
{
  return __DDUICalendarIsTitleGenerationUsed();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _ddui_parsec_xpcInterface()
{
  return __ddui_parsec_xpcInterface();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t dueDateAndTimezoneOfEventResults()
{
  return _dueDateAndTimezoneOfEventResults();
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_DDViewScale(void *a1, const char *a2, ...)
{
  return [a1 DDViewScale];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__hostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _hostApplicationBundleIdentifier];
}

id objc_msgSend__hostProcessIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _hostProcessIdentifier];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_associatedResults(void *a1, const char *a2, ...)
{
  return [a1 associatedResults];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_backgroundTimeRemaining(void *a1, const char *a2, ...)
{
  return [a1 backgroundTimeRemaining];
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return [a1 bag];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_calendarIdentifier(void *a1, const char *a2, ...)
{
  return [a1 calendarIdentifier];
}

id objc_msgSend_cancelEditing(void *a1, const char *a2, ...)
{
  return [a1 cancelEditing];
}

id objc_msgSend_cardSection(void *a1, const char *a2, ...)
{
  return [a1 cardSection];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return [a1 contact];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return [a1 contactStore];
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return [a1 containerView];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_coreResult(void *a1, const char *a2, ...)
{
  return [a1 coreResult];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return [a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeZone];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return [a1 destination];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doneWithAddingEvent(void *a1, const char *a2, ...)
{
  return [a1 doneWithAddingEvent];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_enabledDomains(void *a1, const char *a2, ...)
{
  return [a1 enabledDomains];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return [a1 event];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_feedbackListener(void *a1, const char *a2, ...)
{
  return [a1 feedbackListener];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstUseDescriptionText(void *a1, const char *a2, ...)
{
  return [a1 firstUseDescriptionText];
}

id objc_msgSend_firstUseLearnMoreText(void *a1, const char *a2, ...)
{
  return [a1 firstUseLearnMoreText];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_hostApplication(void *a1, const char *a2, ...)
{
  return [a1 hostApplication];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inlineCard(void *a1, const char *a2, ...)
{
  return [a1 inlineCard];
}

id objc_msgSend_isAllDay(void *a1, const char *a2, ...)
{
  return [a1 isAllDay];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedModel(void *a1, const char *a2, ...)
{
  return [a1 localizedModel];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_nickname(void *a1, const char *a2, ...)
{
  return [a1 nickname];
}

id objc_msgSend_notes(void *a1, const char *a2, ...)
{
  return [a1 notes];
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return [a1 organizationName];
}

id objc_msgSend_parsecEnabled(void *a1, const char *a2, ...)
{
  return [a1 parsecEnabled];
}

id objc_msgSend_placement(void *a1, const char *a2, ...)
{
  return [a1 placement];
}

id objc_msgSend_preferredOpenableURL(void *a1, const char *a2, ...)
{
  return [a1 preferredOpenableURL];
}

id objc_msgSend_presentsWithMargins(void *a1, const char *a2, ...)
{
  return [a1 presentsWithMargins];
}

id objc_msgSend_queryBlock(void *a1, const char *a2, ...)
{
  return [a1 queryBlock];
}

id objc_msgSend_queryID(void *a1, const char *a2, ...)
{
  return [a1 queryID];
}

id objc_msgSend_queryId(void *a1, const char *a2, ...)
{
  return [a1 queryId];
}

id objc_msgSend_queryWithoutNetwork(void *a1, const char *a2, ...)
{
  return [a1 queryWithoutNetwork];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_remoteVCIsReady(void *a1, const char *a2, ...)
{
  return [a1 remoteVCIsReady];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_sceneAwareLookupEnabledDomains(void *a1, const char *a2, ...)
{
  return [a1 sceneAwareLookupEnabledDomains];
}

id objc_msgSend_sceneAwareLookupFirstUseDescriptionText(void *a1, const char *a2, ...)
{
  return [a1 sceneAwareLookupFirstUseDescriptionText];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_searchRenderTimeout(void *a1, const char *a2, ...)
{
  return [a1 searchRenderTimeout];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return [a1 sections];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return [a1 selector];
}

id objc_msgSend_serviceForReminders(void *a1, const char *a2, ...)
{
  return [a1 serviceForReminders];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return [a1 sharedAVSystemController];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_showBackgroundEffect(void *a1, const char *a2, ...)
{
  return [a1 showBackgroundEffect];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_structuredLocation(void *a1, const char *a2, ...)
{
  return [a1 structuredLocation];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemGroupedBackgroundColor];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transitionDuration(void *a1, const char *a2, ...)
{
  return [a1 transitionDuration];
}

id objc_msgSend_transitionWasCancelled(void *a1, const char *a2, ...)
{
  return [a1 transitionWasCancelled];
}

id objc_msgSend_updateForCurrentTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 updateForCurrentTraitCollection];
}

id objc_msgSend_updateStyle(void *a1, const char *a2, ...)
{
  return [a1 updateStyle];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userAgent(void *a1, const char *a2, ...)
{
  return [a1 userAgent];
}

id objc_msgSend_userSelection(void *a1, const char *a2, ...)
{
  return [a1 userSelection];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 verticalSizeClass];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}

id objc_msgSend_viewControllerReady(void *a1, const char *a2, ...)
{
  return [a1 viewControllerReady];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}