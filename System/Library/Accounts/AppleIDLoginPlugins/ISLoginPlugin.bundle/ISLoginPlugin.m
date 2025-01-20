id ISAppleIDPluginLogConfig()
{
  void *v0;
  uint64_t vars8;

  if (qword_C958 != -1) {
    dispatch_once(&qword_C958, &stru_8350);
  }
  v0 = (void *)qword_C950;
  return v0;
}

void sub_1A10(id a1)
{
  v1 = +[SSLogConfig sharedAccountsConfig];
  id v4 = [v1 mutableCopy];

  [v4 setCategory:@"plugins.login"];
  id v2 = [v4 copy];
  v3 = (void *)qword_C950;
  qword_C950 = (uint64_t)v2;
}

void sub_24E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 168));
  _Unwind_Resume(a1);
}

void sub_253C(uint64_t a1)
{
  id v2 = dispatch_group_create();
  v3 = +[UMUserManager sharedManager];
  unsigned __int8 v4 = [v3 isMultiUser];

  if ((v4 & 1) == 0)
  {
    v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_27F8;
    block[3] = &unk_8380;
    objc_copyWeak(&v23, (id *)(a1 + 64));
    v6 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v22 = v6;
    dispatch_group_async(v2, v5, block);

    objc_destroyWeak(&v23);
  }
  if (PSIsRunningInAssistant())
  {
    v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_2990;
    v18[3] = &unk_8380;
    objc_copyWeak(&v20, (id *)(a1 + 64));
    v8 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v8;
    dispatch_group_async(v2, v7, v18);
    v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2B28;
    v14[3] = &unk_83A8;
    objc_copyWeak(&v17, (id *)(a1 + 64));
    v14[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    dispatch_group_async(v2, v9, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_2CCC;
  v10[3] = &unk_83D0;
  objc_copyWeak(&v12, (id *)(a1 + 64));
  v10[4] = *(void *)(a1 + 32);
  char v13 = *(unsigned char *)(a1 + 72);
  id v11 = *(id *)(a1 + 56);
  dispatch_group_notify(v2, (dispatch_queue_t)&_dispatch_main_q, v10);

  objc_destroyWeak(&v12);
}

void sub_27F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = ISAppleIDPluginLogConfig();
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  LODWORD(v10) = 138543362;
  *(void *)((char *)&v10 + 4) = objc_opt_class();
  id v7 = *(id *)((char *)&v10 + 4);
  LODWORD(v9) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v10, v9, v10);
    free(v8);
    SSFileLog();
LABEL_11:
  }
  [WeakRetained _setupHomeSharingWithParameters:*(void *)(a1 + 40)];
}

void sub_2990(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = ISAppleIDPluginLogConfig();
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  LODWORD(v10) = 138543362;
  *(void *)((char *)&v10 + 4) = objc_opt_class();
  id v7 = *(id *)((char *)&v10 + 4);
  LODWORD(v9) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v10, v9, v10);
    free(v8);
    SSFileLog();
LABEL_11:
  }
  [WeakRetained _setupITunesMatchWithParameters:*(void *)(a1 + 40)];
}

void sub_2B28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = ISAppleIDPluginLogConfig();
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (v5)
  {
    LODWORD(v10) = 138543362;
    *(void *)((char *)&v10 + 4) = objc_opt_class();
    id v7 = *(id *)((char *)&v10 + 4);
    LODWORD(v9) = 12;
    v8 = (void *)_os_log_send_and_compose_impl();

    if (!v8) {
      goto LABEL_12;
    }
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v10, v9, v10);
    free(v8);
    SSFileLog();
  }

LABEL_12:
  if ([*(id *)(a1 + 40) isActive]) {
    [WeakRetained _setupiTunesBiometricsWithParameters:*(void *)(a1 + 48)];
  }
}

void sub_2CCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = ISAppleIDPluginLogConfig();
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (v5)
  {
    LODWORD(v12) = 138543362;
    *(void *)((char *)&v12 + 4) = objc_opt_class();
    id v7 = *(id *)((char *)&v12 + 4);
    LODWORD(v11) = 12;
    v8 = (void *)_os_log_send_and_compose_impl();

    if (!v8) {
      goto LABEL_12;
    }
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v12, v11, v12);
    free(v8);
    SSFileLog();
  }

LABEL_12:
  kdebug_trace();
  uint64_t v9 = [WeakRetained handler];
  long long v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
  }
}

void sub_2EA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = [v6 authenticatedAccount];

  if (!v8)
  {
    uint64_t v9 = ISAppleIDPluginLogConfig();
    if (!v9)
    {
      uint64_t v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    long long v12 = [v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      int v13 = v11;
    }
    else {
      int v13 = v11 & 2;
    }
    if (v13)
    {
      uint64_t v14 = objc_opt_class();
      id v15 = *(void **)(a1 + 32);
      id v16 = v14;
      id v17 = [v15 accountName];
      SSHashIfNeeded();
      int v20 = 138543874;
      v21 = v14;
      __int16 v22 = 2114;
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v24 = 2112;
      id v25 = v5;
      LODWORD(v19) = 32;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_14:

        goto LABEL_15;
      }
      long long v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v20, v19);
      free(v18);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_423C(uint64_t a1)
{
  id v2 = +[HSAccountStore defaultStore];
  v3 = [*(id *)(a1 + 32) objectForKey:@"email"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v4 = v3;
  }
  else {
    unsigned int v4 = 0;
  }
  [v2 setAppleID:v4];
  id v5 = [*(id *)(a1 + 32) objectForKey:@"password"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  [v2 setPassword:v6];
  if (([v2 canDetermineGroupID] & 1) == 0)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    goto LABEL_21;
  }
  id v7 = ISAppleIDPluginLogConfig();
  if (!v7)
  {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  unsigned int v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_18;
  }
  int v16 = 138543362;
  id v17 = (id)objc_opt_class();
  id v11 = v17;
  LODWORD(v13) = 12;
  long long v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    unsigned int v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v13);
    free(v12);
    SSFileLog();
LABEL_18:
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_44DC;
  v14[3] = &unk_8448;
  id v15 = *(id *)(a1 + 40);
  [v2 determineGroupIDWithCompletionHandler:v14];

LABEL_21:
}

intptr_t sub_44DC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_4B04(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = ISAppleIDPluginLogConfig();
  id v6 = (void *)v5;
  if (a2)
  {
    if (!v5)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    int v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      v8 &= 2u;
    }
    if (!v8)
    {

      goto LABEL_24;
    }
    unsigned int v10 = objc_opt_class();
    id v11 = v10;
    +[NSNumber numberWithInteger:a2];
    int v19 = 138543874;
    int v20 = v10;
    __int16 v21 = 2114;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v23 = 2114;
    id v24 = v4;
    LODWORD(v18) = 32;
    long long v12 = (void *)_os_log_send_and_compose_impl();

    if (!v12) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  if (!v5)
  {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v13 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  id v15 = [v6 OSLogObject];
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
    v14 &= 2u;
  }
  if (!v14) {
    goto LABEL_22;
  }
  int v16 = objc_opt_class();
  id v17 = v16;
  +[NSNumber numberWithInteger:0];
  int v19 = 138543618;
  int v20 = v16;
  __int16 v21 = 2114;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 22;
  long long v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
LABEL_21:
    id v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v19, v18);
    free(v12);
    SSFileLog();
LABEL_22:
  }
LABEL_24:
}

void sub_5414(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_5464(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (HSCloudClientIsSagaEnabledInURLBag())
  {
    id v4 = [v3 objectForKey:@"library-daap"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v5 = ISAppleIDPluginLogConfig();
    if (!v5)
    {
      uint64_t v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (v7)
    {
      *(_DWORD *)unsigned int v13 = 138543618;
      *(void *)&v13[4] = objc_opt_class();
      *(_WORD *)&v13[12] = 2112;
      *(void *)&v13[14] = v4;
      id v9 = *(id *)&v13[4];
      LODWORD(v12) = 22;
      unsigned int v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_14:

        id v11 = [v4 objectForKey:@"base-url"];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11 != 0;

        goto LABEL_15;
      }
      int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, v13, v12, *(_OWORD *)v13, *(void *)&v13[16]);
      free(v10);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_16:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t sub_5674(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t CPSharedResourcesDirectory()
{
  return _CPSharedResourcesDirectory();
}

uint64_t HSCloudClientIsSagaEnabledInURLBag()
{
  return _HSCloudClientIsSagaEnabledInURLBag();
}

uint64_t ISWeakLinkedClassForString()
{
  return _ISWeakLinkedClassForString();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PSIsRunningInAssistant()
{
  return _PSIsRunningInAssistant();
}

uint64_t SSAccountGetUniqueIdentifierFromValue()
{
  return _SSAccountGetUniqueIdentifierFromValue();
}

uint64_t SSFileLog()
{
  return _SSFileLog();
}

uint64_t SSHashIfNeeded()
{
  return _SSHashIfNeeded();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return [a1 OSLogObject];
}

id objc_msgSend_accountName(void *a1, const char *a2, ...)
{
  return [a1 accountName];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return [a1 activeAccount];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return [a1 altDSID];
}

id objc_msgSend_authenticatedAccount(void *a1, const char *a2, ...)
{
  return [a1 authenticatedAccount];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_canDetermineGroupID(void *a1, const char *a2, ...)
{
  return [a1 canDetermineGroupID];
}

id objc_msgSend_contextForSignIn(void *a1, const char *a2, ...)
{
  return [a1 contextForSignIn];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return [a1 guid];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hardwareName(void *a1, const char *a2, ...)
{
  return [a1 hardwareName];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isLibraryEmpty(void *a1, const char *a2, ...)
{
  return [a1 isLibraryEmpty];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isMultiUser];
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeSet];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return [a1 productVersion];
}

id objc_msgSend_resetExpiration(void *a1, const char *a2, ...)
{
  return [a1 resetExpiration];
}

id objc_msgSend_secureToken(void *a1, const char *a2, ...)
{
  return [a1 secureToken];
}

id objc_msgSend_sharedAccountsConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedAccountsConfig];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedConfig];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedLibrary];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shouldLog(void *a1, const char *a2, ...)
{
  return [a1 shouldLog];
}

id objc_msgSend_shouldLogToDisk(void *a1, const char *a2, ...)
{
  return [a1 shouldLogToDisk];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_userAgent(void *a1, const char *a2, ...)
{
  return [a1 userAgent];
}