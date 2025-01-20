int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  setiopolicy_np(3, 0, 1);
  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_10000217C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = +[FPItemManager defaultManager];
    v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000022E8;
    v12[3] = &unk_100008230;
    id v14 = *(id *)(a1 + 56);
    char v15 = *(unsigned char *)(a1 + 64);
    id v13 = *(id *)(a1 + 48);
    v10 = [v8 createMoveOperation:v9 destinationItem:v5 completionHandler:v12];
    [v7 scheduleAction:v10];
  }
  else
  {
    v11 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v11 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000554C();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

id sub_1000022E8(uint64_t a1)
{
  id result = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 48))
  {
    v3 = *(void **)(a1 + 32);
    return [v3 stopAccessingSecurityScopedResource];
  }
  return result;
}

void sub_1000025D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  if (*(unsigned char *)(a1 + 57)) {
    [*(id *)(a1 + 40) stopAccessingSecurityScopedResource];
  }
  if (v6)
  {
    v7 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v7 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000055B4();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000269C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = [v5 itemID];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100002834;
    v13[3] = &unk_1000082F8;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    v11 = *(void **)(a1 + 56);
    id v14 = v9;
    uint64_t v15 = v10;
    id v16 = v11;
    id v17 = v5;
    id v18 = *(id *)(a1 + 64);
    id v20 = *(id *)(a1 + 72);
    id v19 = *(id *)(a1 + 32);
    [v7 fetchParentsForItemID:v8 recursively:0 completionHandler:v13];
  }
  else
  {
    v12 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v12 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000561C();
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void sub_100002834(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 firstObject];
  v7 = docDownloadServiceLogHandle;
  if (v6)
  {
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v7 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000056F0(a1, v7, (uint64_t)v6);
    }
    id v9 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v10 = [*(id *)(a1 + 32) url];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000029F8;
    v11[3] = &unk_1000082D0;
    v11[4] = *(void *)(a1 + 40);
    id v12 = *(id *)(a1 + 56);
    id v13 = v6;
    id v14 = *(id *)(a1 + 64);
    id v16 = *(id *)(a1 + 80);
    id v15 = *(id *)(a1 + 72);
    [v9 replaceContentsOfFile:v8 withFile:v10 completion:v11];
  }
  else
  {
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v7 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100005688();
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void sub_1000029F8(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002AFC;
    v9[3] = &unk_1000082A8;
    id v10 = *(id *)(a1 + 72);
    v7 = [v3 createMoveOperation:v4 parentItem:v5 newFileName:v6 completionHandler:v9];
    [*(id *)(a1 + 64) scheduleAction:v7];
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v8();
  }
}

uint64_t sub_100002AFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100002EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t sub_100002F48(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002F58(uint64_t a1)
{
}

void sub_100002F60(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSFileManager defaultManager];
  uint64_t v5 = a1[4];
  id v10 = 0;
  unsigned __int8 v6 = [v4 replaceItemAtURL:v3 withItemAtURL:v5 backupItemName:0 options:0 resultingItemURL:0 error:&v10];

  id v7 = v10;
  id v8 = v10;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v6;

  if (v8)
  {
    id v9 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v9 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000587C();
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
  }
}

void sub_100003248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000326C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = [WeakRetained transferResults];
  unsigned __int8 v6 = [v5 objectForKey:*(void *)(a1 + 32)];

  if (v6)
  {
    id v7 = +[FPItemManager defaultManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100003388;
    v9[3] = &unk_100008370;
    id v8 = *(void **)(a1 + 48);
    void v9[4] = *(void *)(a1 + 40);
    id v10 = v8;
    [v7 fetchURLForItem:v6 completionHandler:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100003388(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 startAccessingSecurityScopedResource];
    unsigned __int8 v6 = *(void **)(a1 + 32);
    id v9 = 0;
    id v7 = [v6 sandboxingURLWrapperForURL:v4 readonly:0 error:&v9];
    id v8 = v9;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (v5) {
      [v4 stopAccessingSecurityScopedResource];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100003628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000364C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  unsigned int v5 = [WeakRetained transferResults];
  unsigned __int8 v6 = [v5 objectForKey:*(void *)(a1 + 32)];

  if (v6)
  {
    id v7 = +[FPItemManager defaultManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100003768;
    v9[3] = &unk_100008370;
    id v8 = *(void **)(a1 + 48);
    void v9[4] = *(void *)(a1 + 40);
    id v10 = v8;
    [v7 fetchURLForItem:v6 completionHandler:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100003768(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 startAccessingSecurityScopedResource];
    unsigned __int8 v6 = *(void **)(a1 + 32);
    id v9 = 0;
    id v7 = [v6 sandboxingURLWrapperForURL:v4 readonly:0 error:&v9];
    id v8 = v9;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (v5) {
      [v4 stopAccessingSecurityScopedResource];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100003914(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    id v3 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v3 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000058E4();
    }
  }
}

void sub_100003BD0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[FPItemManager defaultManager];
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100003D3C;
    v12[3] = &unk_100008230;
    id v14 = *(id *)(a1 + 48);
    char v15 = *(unsigned char *)(a1 + 56);
    id v13 = *(id *)(a1 + 40);
    id v10 = [v8 createMoveOperation:v9 destinationItem:v5 completionHandler:v12];
    [v7 scheduleAction:v10];
  }
  else
  {
    v11 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v11 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000554C();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100003D3C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) url];
    [v2 stopAccessingSecurityScopedResource];
  }
}

void sub_100003F88(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000040D4;
    v10[3] = &unk_100008230;
    id v12 = *(id *)(a1 + 72);
    char v13 = *(unsigned char *)(a1 + 80);
    id v11 = *(id *)(a1 + 40);
    id v8 = [v6 createMoveOperation:v7 destinationItem:a2 completionHandler:v10];
    [*(id *)(a1 + 48) scheduleAction:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    uint64_t v9 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      uint64_t v9 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000594C();
    }
  }
}

void sub_1000040D4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) url];
    [v2 stopAccessingSecurityScopedResource];
  }
}

void sub_1000042B4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    id v6 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100005A40();
    if (a2) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (a2) {
      goto LABEL_10;
    }
  }
  uint64_t v7 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    uint64_t v7 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000059B8(a1, v7);
  }
LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100004740(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      uint64_t v7 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100005B84();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100004990;
    v13[3] = &unk_100008478;
    id v14 = *(id *)(a1 + 32);
    id v8 = [v5 indexOfObjectPassingTest:v13];
    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = docDownloadServiceLogHandle;
      if (!docDownloadServiceLogHandle)
      {
        DOCInitLogging();
        uint64_t v9 = docDownloadServiceLogHandle;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_100005B18();
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v10 = [v5 objectAtIndexedSubscript:v8];
      id v11 = docDownloadServiceLogHandle;
      if (!docDownloadServiceLogHandle)
      {
        DOCInitLogging();
        id v11 = docDownloadServiceLogHandle;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v12;
        __int16 v17 = 2112;
        id v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Found provider matching domain for domainID: %@ provider: %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

id sub_100004990(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

void sub_100004AEC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v9 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      uint64_t v9 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100005BEC();
    }
  }
  else
  {
    if ([v5 isEnabled] && (objc_msgSend(v5, "isHidden") & 1) == 0)
    {
      id v10 = *(void **)(a1 + 40);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100004C9C;
      v11[3] = &unk_100008518;
      id v12 = v10;
      id v13 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      id v14 = v5;
      objc_msgSend(v12, "doc_fetchRootItemForProviderDomain:completionHandler:", v14, v11);

      goto LABEL_14;
    }
    id v8 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v8 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100005C54();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_14:
}

void sub_100004C9C(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004DF4;
    v9[3] = &unk_1000084F0;
    id v7 = a1[4];
    id v10 = a1[5];
    id v11 = a1[4];
    id v13 = a1[7];
    id v12 = a1[6];
    [v7 fetchURLForItem:v5 completionHandler:v9];
  }
  else
  {
    id v8 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v8 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100005CBC();
    }
    (*((void (**)(void))a1[7] + 2))();
  }
}

void sub_100004DF4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 URLByAppendingPathComponent:*(void *)(a1 + 32)];
    id v8 = *(void **)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004F2C;
    v10[3] = &unk_1000084C8;
    id v11 = *(id *)(a1 + 56);
    [v8 fetchItemForURL:v7 completionHandler:v10];
  }
  else
  {
    uint64_t v9 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      uint64_t v9 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100005D28();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t sub_100004F2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005054(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v9 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      uint64_t v9 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100005BEC();
    }
  }
  else
  {
    if ([v5 isEnabled] && (objc_msgSend(v5, "isHidden") & 1) == 0)
    {
      id v10 = *(void **)(a1 + 40);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100005204;
      v11[3] = &unk_100008518;
      id v12 = v10;
      id v13 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      id v14 = v5;
      objc_msgSend(v12, "doc_fetchRootItemForProviderDomain:completionHandler:", v14, v11);

      goto LABEL_14;
    }
    id v8 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v8 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100005C54();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_14:
}

void sub_100005204(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100005348;
    v9[3] = &unk_100008568;
    id v7 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 48);
    [v7 fetchURLForItem:v5 completionHandler:v9];
  }
  else
  {
    id v8 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v8 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100005CBC();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_100005348(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 URLByAppendingPathComponent:*(void *)(a1 + 32)];
    id v8 = +[NSFileManager defaultManager];
    uint64_t v9 = [v7 path];
    [v8 fileExistsAtPath:v9];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v10 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      id v10 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100005D94();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100005480(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000054A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000054F4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100005500(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000551C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10000552C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_10000554C()
{
  sub_1000054E8();
  sub_1000054A0((void *)&_mh_execute_header, v0, v1, "Couldn't find a downloads location: %@", v2, v3, v4, v5, v6);
}

void sub_1000055B4()
{
  sub_1000054F4(__stack_chk_guard);
  sub_100005468();
  sub_100005480((void *)&_mh_execute_header, v0, v1, "Replacing placeholder URL: %@ failed with error: %@");
}

void sub_10000561C()
{
  sub_100005468();
  sub_100005480((void *)&_mh_execute_header, v0, v1, "Unable to fetch placeholder item from URL: %@ error: %@");
}

void sub_100005688()
{
  sub_1000054E8();
  sub_1000054A0((void *)&_mh_execute_header, v0, v1, "Couldn't fetch parent item: %@", v2, v3, v4, v5, v6);
}

void sub_1000056F0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  uint8_t v6 = [v4 url];
  sub_1000054E8();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Moving URL: %@ to parent: %@", v7, 0x16u);
}

void sub_1000057AC()
{
  sub_10000551C(__stack_chk_guard);
  sub_1000054BC();
  sub_1000054A0((void *)&_mh_execute_header, v0, v1, "replaceContentsOfFile: failed with error: %@", v2, v3, v4, v5, v6);
}

void sub_100005814()
{
  sub_10000551C(__stack_chk_guard);
  sub_1000054BC();
  sub_1000054A0((void *)&_mh_execute_header, v0, v1, "Can't create temp directory on destination volume: failed with error: %@", v2, v3, v4, v5, v6);
}

void sub_10000587C()
{
  sub_1000054E8();
  sub_1000054A0((void *)&_mh_execute_header, v0, v1, "Couldn't replace contents of URL error: %@", v2, v3, v4, v5, v6);
}

void sub_1000058E4()
{
  sub_1000054E8();
  sub_1000054A0((void *)&_mh_execute_header, v0, v1, "Unable to delete placeholder: %@", v2, v3, v4, v5, v6);
}

void sub_10000594C()
{
  sub_1000054C8();
  sub_10000552C((void *)&_mh_execute_header, v0, v1, "Could not fetch folder named: %@ in domain %@. Error: %@");
}

void sub_1000059B8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Folder named: %@ in domain %@ does not exist.", (uint8_t *)&v4, 0x16u);
}

void sub_100005A40()
{
  sub_1000054C8();
  sub_10000552C((void *)&_mh_execute_header, v0, v1, "Could not determine if folder named: %@ in domain %@ exists. Error: %@");
}

void sub_100005AAC()
{
  sub_1000054BC();
  sub_1000054A0((void *)&_mh_execute_header, v0, v1, "Failed to create temp directory: %@", v2, v3, v4, v5, v6);
}

void sub_100005B18()
{
  sub_1000054BC();
  sub_100005500((void *)&_mh_execute_header, v0, v1, "Did not find provider matching domain for domainID: %@.", v2, v3, v4, v5, v6);
}

void sub_100005B84()
{
  sub_1000054F4(__stack_chk_guard);
  sub_100005468();
  sub_100005480((void *)&_mh_execute_header, v0, v1, "Error fetching providers for domainID: %@ error: %@");
}

void sub_100005BEC()
{
  sub_1000054F4(__stack_chk_guard);
  sub_1000054BC();
  sub_100005500((void *)&_mh_execute_header, v0, v1, "Did not find provider matching domain for domainID: %@.", v2, v3, v4, v5, v6);
}

void sub_100005C54()
{
  sub_1000054F4(__stack_chk_guard);
  sub_100005468();
  sub_100005480((void *)&_mh_execute_header, v0, v1, "Provider domain was nil, disabled or hidden. Domain: %@ provider: %@");
}

void sub_100005CBC()
{
  sub_100005468();
  sub_100005480((void *)&_mh_execute_header, v0, v1, "Could not fetch root of iCloud Drive domain %@. Error: %@");
}

void sub_100005D28()
{
  sub_100005468();
  sub_100005480((void *)&_mh_execute_header, v0, v1, "Could not fetch root URL of iCloud Drive domain %@. Error: %@");
}

void sub_100005D94()
{
  sub_100005468();
  sub_100005480((void *)&_mh_execute_header, v0, v1, "Could not fetch root URL of iCloud Drive domain %@. Error: %@");
}

uint64_t DOCInitLogging()
{
  return _DOCInitLogging();
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return _FPIsCloudDocsWithFPFSEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _DocumentManagerBundle()
{
  return __DocumentManagerBundle();
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultPermission(void *a1, const char *a2, ...)
{
  return [a1 defaultPermission];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return [a1 itemID];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_transferResults(void *a1, const char *a2, ...)
{
  return [a1 transferResults];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_wrapperWithURL_readonly_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wrapperWithURL:readonly:error:");
}