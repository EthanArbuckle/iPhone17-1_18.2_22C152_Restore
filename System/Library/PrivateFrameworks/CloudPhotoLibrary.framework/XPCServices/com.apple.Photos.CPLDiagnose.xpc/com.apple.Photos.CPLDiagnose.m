id CPLDaemonProcessInterface()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t vars8;

  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CPLDaemonProcessProtocol];
  v1 = objc_opt_class();
  v2 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, objc_opt_class(), 0);
  [v0 setClasses:v2 forSelector:"getEngineWrapperStatusesWithCompletionHandler:" argumentIndex:0 ofReply:1];

  v3 = objc_opt_class();
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
  [v0 setClasses:v4 forSelector:"getDaemonLibraryManagerStatusesWithCompletionHandler:" argumentIndex:0 ofReply:1];

  return v0;
}

BOOL sub_1000043F4(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  v7 = (void *)v6;
  if (!a1) {
    goto LABEL_9;
  }
  BOOL v8 = (v5 | v6) == 0;
  if (!v5 || !v6) {
    goto LABEL_12;
  }
  if ([(id)v5 isEqual:v6])
  {
    BOOL v8 = 1;
    goto LABEL_12;
  }
  v9 = realpath_DARWIN_EXTSN((const char *)[ (id) v5 fileSystemRepresentation], 0);
  if (!v9)
  {
LABEL_9:
    BOOL v8 = 0;
    goto LABEL_12;
  }
  v10 = v9;
  v11 = realpath_DARWIN_EXTSN((const char *)[v7 fileSystemRepresentation], 0);
  if (v11)
  {
    v12 = v11;
    BOOL v8 = strcmp(v10, v11) == 0;
    free(v12);
  }
  else
  {
    BOOL v8 = 0;
  }
  free(v10);
LABEL_12:

  return v8;
}

id sub_100004854()
{
  if (qword_100041360 != -1) {
    dispatch_once(&qword_100041360, &stru_100034AE0);
  }
  v0 = (void *)qword_100041368;
  return v0;
}

void sub_100004994(id a1)
{
  id v1 = objc_alloc((Class)NSSet);
  qword_100041350 = (uint64_t)objc_msgSend(v1, "initWithObjects:", CPLLibraryIdentifierSystemLibrary, CPLLibraryIdentifierSyndicationLibrary, 0);
  _objc_release_x1();
}

void sub_1000055EC(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 hasPrefix:@"CPLEngineParameters-"])
  {
    id v3 = [v6 length];
    if (v3 > [@"CPLEngineParameters-" length])
    {
      v4 = [v6 substringWithRange:objc_msgSend(@"CPLEngineParameters-", "length"), (unsigned char *)objc_msgSend(v6, "length") - (unsigned char *)objc_msgSend(@"CPLEngineParameters-", "length")];
      unint64_t v5 = [*(id *)(a1 + 32) parametersForLibraryIdentifier:v4];
      if (v5) {
        [*(id *)(a1 + 40) addObject:v5];
      }
    }
  }
}

int64_t sub_1000056D4(id a1, CPLEngineParameters *a2, CPLEngineParameters *a3)
{
  v4 = a2;
  unint64_t v5 = a3;
  id v6 = [(CPLEngineParameters *)v4 libraryIdentifier];
  v7 = [(CPLEngineParameters *)v5 libraryIdentifier];
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    int64_t v9 = 0;
  }
  else
  {
    v10 = [(CPLEngineParameters *)v4 libraryIdentifier];
    uint64_t v11 = CPLLibraryIdentifierSystemLibrary;
    unsigned __int8 v12 = [v10 isEqualToString:CPLLibraryIdentifierSystemLibrary];

    if (v12)
    {
      int64_t v9 = -1;
    }
    else
    {
      v13 = [(CPLEngineParameters *)v5 libraryIdentifier];
      unsigned __int8 v14 = [v13 isEqualToString:v11];

      if (v14)
      {
        int64_t v9 = 1;
      }
      else
      {
        v15 = [(CPLEngineParameters *)v4 libraryIdentifier];
        v16 = [(CPLEngineParameters *)v5 libraryIdentifier];
        int64_t v9 = (int64_t)[v15 compare:v16];
      }
    }
  }

  return v9;
}

void sub_100005BF8(id a1)
{
  id v1 = (const char *)_CPLOSLogSubsystem();
  qword_100041368 = (uint64_t)os_log_create(v1, "engine.parameters");
  _objc_release_x1();
}

void sub_100006144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006174(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006184(uint64_t a1)
{
}

void sub_10000618C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    id v4 = v5;
  }
}

void sub_100006210(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

intptr_t sub_1000062C0(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    id v1 = (void *)result;
    uint64_t v2 = +[CPLErrors cplErrorWithCode:83 description:@"failed to get management service in time"];
    uint64_t v3 = *(void *)(v1[6] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    *(unsigned char *)(*(void *)(v1[5] + 8) + 24) = 1;
    id v5 = v1[4];
    return dispatch_semaphore_signal(v5);
  }
  return result;
}

void sub_100006F84(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_100006F98(_Unwind_Exception *a1)
{
}

uint64_t sub_100006FAC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 76))
  {
    int v5 = *(_DWORD *)(v4 + 80);
    if (v5 < 1) {
      double v6 = 60.0;
    }
    else {
      double v6 = (double)v5;
    }
    uint64_t v7 = +[NSDate dateWithTimeIntervalSinceNow:v6];
  }
  else
  {
    uint64_t v7 = +[NSDate distantFuture];
  }
  *(void *)(*(void *)(a1 + 32) + 64) = v7;
  return _objc_release_x1();
}

void sub_100007184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000071C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000071D0(uint64_t a1)
{
}

void sub_1000071D8(uint64_t a1)
{
}

id sub_100007E04()
{
  if (qword_100041378 != -1) {
    dispatch_once(&qword_100041378, &stru_100034CD0);
  }
  v0 = (void *)qword_100041380;
  return v0;
}

id sub_100007E58(uint64_t a1)
{
  waitpid(*(_DWORD *)(a1 + 48), (int *)(*(void *)(a1 + 32) + 72), 0);
  [*(id *)(a1 + 40) lock];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 unlockWithCondition:1];
}

void sub_100007EAC(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 32);
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = 1;
    do
    {
      free(v3);
      uint64_t v2 = *(void ***)(a1 + 32);
      uint64_t v3 = v2[v4++];
    }
    while (v3);
  }
  free(v2);
  if (posix_spawn_file_actions_destroy(*(posix_spawn_file_actions_t **)(a1 + 40))) {
    BOOL v5 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    double v6 = sub_100007E04();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = __error();
      unsigned __int8 v8 = strerror(*v7);
      int v9 = 136315138;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to detroy the file actions properly (%s).", (uint8_t *)&v9, 0xCu);
    }
  }
  free(*(void **)(a1 + 40));
}

void sub_100007FB0(int a1, char *a2)
{
  if (a2)
  {
    memset(&v3, 0, sizeof(v3));
    if (!stat(a2, &v3) && !v3.st_size) {
      unlink(a2);
    }
  }
}

void sub_100008150(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_100008174(void *a1, int a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = signal(2, (void (__cdecl *)(int))1);
  if (*(void *)(*(void *)(a1[5] + 8) + 24) == -1)
  {
    if (!_CPLSilentLogging)
    {
      int v9 = sub_100007E04();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to retreive handler for SIGINT.", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v4 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0, v4);
    uint64_t v6 = *(void *)(a1[6] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    unsigned __int8 v8 = *(NSObject **)(*(void *)(a1[6] + 8) + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000082E4;
    v10[3] = &unk_100034C38;
    int v11 = a2;
    v10[4] = a1[4];
    dispatch_source_set_event_handler(v8, v10);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1[6] + 8) + 40));
  }
}

void sub_1000082E4(uint64_t a1)
{
  fwrite("\b\b", 2uLL, 1uLL, __stderrp);
  kill(*(_DWORD *)(a1 + 40), 9);
  uint64_t v2 = [*(id *)(a1 + 32) redirectStderrToFileAtPath];
  if ([v2 length])
  {
  }
  else
  {
    unsigned int v3 = [*(id *)(a1 + 32) redirectStderrToFileDescriptor];

    if (v3 == -1) {
      return;
    }
  }
  uint64_t v4 = [*(id *)(a1 + 32) redirectStderrToFileAtPath];

  dispatch_source_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [v5 redirectStderrToFileAtPath];
    if (v6)
    {
LABEL_6:
      id v10 = v6;
      uint64_t v7 = fopen((const char *)[v10 UTF8String], "a+");
      if (v7)
      {
        unsigned __int8 v8 = v7;
        fwrite("\n\n === Aborted by user", 0x16uLL, 1uLL, v7);
        fclose(v8);
      }
      uint64_t v6 = v10;
    }
  }
  else if ([v5 redirectStderrToFileDescriptor] == 1 {
         && ([*(id *)(a1 + 32) redirectStdoutToFileAtPath],
  }
             int v9 = objc_claimAutoreleasedReturnValue(),
             v9,
             v9))
  {
    uint64_t v6 = [*(id *)(a1 + 32) redirectStdoutToFileAtPath];
    if (v6) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
}

void sub_100008448(uint64_t a1)
{
  uint64_t v1 = *(void (__cdecl **)(int))(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v1 != (void (__cdecl *)(int))-1)
  {
    signal(2, v1);
    unsigned int v3 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000084F8;
    block[3] = &unk_100034C88;
    block[4] = *(void *)(a1 + 40);
    dispatch_sync(v3, block);
  }
}

void sub_1000084F8(uint64_t a1)
{
}

void sub_10000869C(id a1)
{
  uint64_t v1 = (const char *)_CPLOSLogSubsystem();
  qword_100041380 = (uint64_t)os_log_create(v1, "cplctl.task");
  _objc_release_x1();
}

void sub_10000A7D8(id a1)
{
  putenv("LESS=EFKRSX");
  putenv("LESSCHARSET=utf-8");
}

id sub_10000A810(uint64_t a1)
{
  return [*(id *)(a1 + 32) _taskHasFinished];
}

void sub_10000B01C(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = *(void **)(a1 + 32);
  id v4 = [a3 asPlist];
  [v3 addObject:v4];
}

void sub_10000CFF0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D014(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000D024(uint64_t a1)
{
}

void sub_10000D02C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000D094(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  unsigned int v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  double v5 = -v4;
  if (v2)
  {
    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) localizedDescription];
    [v3 printFormat:@"[force closing library manager after it took %.1f seconds to finally open and it failed miserably with error: %@]", *(void *)&v5, v9];
  }
  else
  {
    objc_msgSend(v3, "printFormat:", @"[force closing library manager after it took %.1f seconds to finally open]", -v4);
    uint64_t v6 = +[NSDate date];
    uint64_t v7 = *(void **)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000D1D8;
    v10[3] = &unk_100034D78;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v6;
    id v8 = v6;
    [v7 closeWithCompletionHandler:v10];
  }
}

void sub_10000D1D8(uint64_t a1, void *a2)
{
  id v7 = a2;
  unsigned int v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  double v5 = -v4;
  if (v7)
  {
    uint64_t v6 = [v7 localizedDescription];
    [v3 printFormat:@"[force closing of library manager took %.2f seconds and it failed miserably with error: %@]", *(void *)&v5, v6];
  }
  else
  {
    [v3 printFormat:@"[force closing of library manager took %.2f seconds]", -v4];
  }
}

id sub_10000D278()
{
  if (qword_1000413D0 != -1) {
    dispatch_once(&qword_1000413D0, &stru_100035038);
  }
  v0 = (void *)qword_1000413D8;
  return v0;
}

void sub_10000D7F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && !_CPLSilentLogging)
  {
    double v4 = sub_10000D278();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Error closing daemon's library manager: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000E08C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10000E0E0(uint64_t a1, void *a2)
{
  double v4 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(v3 + 24) = 0;
    v4[2]();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

id sub_10000E160(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    sub_100020708();
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    sub_1000206DC();
  }
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000E260;
  v10[3] = &unk_100034E18;
  int v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = [v5 proxyWithErrorHandler:v10];

  return v8;
}

void sub_10000E260(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E308;
  v8[3] = &unk_100034BC8;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

void sub_10000E308(uint64_t a1)
{
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  id v6 = [v2 localizedDescription];
  uint64_t v3 = +[CPLErrors cplErrorWithCode:150, v2, @"call to daemon proxy failed: %@", v6 underlyingError description];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10000E398(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v1) {
    sub_100020734();
  }
  dispatch_time_t v3 = dispatch_time(0, 40000000000);
  if (dispatch_semaphore_wait(v1, v3))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000E480;
    v9[3] = &unk_100034E68;
    uint64_t v4 = *(NSObject **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    id v10 = v5;
    uint64_t v11 = v6;
    dispatch_sync(v4, v9);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

uint64_t sub_10000E480(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000E4FC;
  v3[3] = &unk_100034C88;
  uint64_t v1 = *(void *)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return (*(uint64_t (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

uint64_t sub_10000E4FC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[CPLErrors cplErrorWithCode:83 description:@"too too long"];
  return _objc_release_x1();
}

void sub_10000E558(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000E630;
  v11[3] = &unk_100034EB8;
  long long v14 = *(_OWORD *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  id v8 = *(void (**)(uint64_t, void *))(v7 + 16);
  id v9 = v6;
  id v10 = v5;
  v8(v7, v11);
}

void sub_10000E630(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  dispatch_semaphore_t v2 = *(void **)(a1 + 40);
  dispatch_time_t v3 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  objc_storeStrong(v3, v2);
}

void sub_10000EA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10000EAC0(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

uint64_t sub_10000EB78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000EB90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EBA0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[CPLErrors cplErrorWithCode:83 description:@"Getting library identifiers did not complete in time"];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

id sub_10000F3B4(uint64_t a1, void *a2)
{
  return [a2 setPrintHeader:*(char *)(a1 + 32)];
}

void sub_10000F5D4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(NSObject **)(v2 + 16);
  if (v3)
  {
    if (v4) {
      sub_100020810();
    }
    if (*(void *)(v2 + 8)) {
      sub_1000207E4();
    }
    *(void *)(*(void *)(a1 + 32) + 8) = signal(2, (void (__cdecl *)(int))1);
    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 24));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000F730;
    handler[3] = &unk_100034FC8;
    handler[4] = *(void *)(a1 + 32);
    id v6 = v5;
    id v13 = v6;
    id v14 = *(id *)(a1 + 40);
    dispatch_source_set_event_handler(v6, handler);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v6;
    id v9 = v6;

    dispatch_resume(v9);
  }
  else
  {
    if (!v4) {
      sub_1000207B8();
    }
    dispatch_source_cancel(v4);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 16);
    *(void *)(v10 + 16) = 0;

    signal(2, *(void (__cdecl **)(int))(*(void *)(a1 + 32) + 8));
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
  }
}

void *sub_10000F730(void *result)
{
  if (*(void *)(result[4] + 16) == result[5]) {
    return (void *)(*(uint64_t (**)(void))(result[6] + 16))();
  }
  return result;
}

uint64_t sub_10000F81C(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32)) {
    sub_10002083C();
  }
  *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(a1 + 40) copy];
  return _objc_release_x1();
}

void sub_10000F928(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  if (!v2) {
    sub_100020868();
  }
  *(void *)(v1 + 32) = 0;
}

uint64_t sub_10000F9D4(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000FEA4(id a1)
{
  uint64_t v1 = (const char *)_CPLOSLogSubsystem();
  qword_1000413D8 = (uint64_t)os_log_create(v1, "cplctl");
  _objc_release_x1();
}

void sub_10000FEE4(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

void sub_100013D00(id a1)
{
  byte_1000413E0 = os_variant_has_internal_diagnostics();
}

void sub_100015108(id a1)
{
  v30[0] = @"cloudd";
  v29 = +[CPLProcessSpecification signalProcessSpecification];
  v31[0] = v29;
  v30[1] = @"cloudphotod";
  v28 = +[CPLProcessSpecification baseProcessSpecification];
  v27 = [v28 addDefaultsDomain:@"com.apple.cloudphotod"];
  v31[1] = v27;
  v30[2] = @"nsurlsessiond";
  v26 = +[CPLProcessSpecification baseProcessSpecification];
  v31[2] = v26;
  v30[3] = @"dasd";
  v25 = +[CPLProcessSpecification baseProcessSpecification];
  v31[3] = v25;
  v30[4] = @"deleted";
  v24 = +[CPLProcessSpecification baseProcessSpecification];
  v31[4] = v24;
  v30[5] = @"accountsd";
  v23 = +[CPLProcessSpecification baseProcessSpecification];
  v31[5] = v23;
  v30[6] = @"mediaanalysisd";
  v22 = +[CPLProcessSpecification baseProcessSpecification];
  v21 = [v22 addDefaultsDomain:@"com.apple.mediaanalysisd"];
  v31[6] = v21;
  v30[7] = @"photoanalysisd";
  v20 = +[CPLProcessSpecification signalProcessSpecification];
  v19 = [v20 addDefaultsDomain:@"com.apple.photoanalysisd"];
  v31[7] = v19;
  v30[8] = @"coreduetd";
  v18 = +[CPLProcessSpecification priviledgedProcessSpecification];
  v31[8] = v18;
  v30[9] = @"deleted_helper";
  v17 = +[CPLProcessSpecification priviledgedProcessSpecification];
  v31[9] = v17;
  v30[10] = @"fseventsd";
  v16 = +[CPLProcessSpecification priviledgedProcessSpecification];
  v31[10] = v16;
  v30[11] = @"mstreamd";
  v15 = +[CPLProcessSpecification baseProcessSpecification];
  v31[11] = v15;
  v30[12] = @"com.apple.photos.VideoConversionService";
  id v14 = +[CPLProcessSpecification baseProcessSpecification];
  v31[12] = v14;
  v30[13] = @"com.apple.photos.ImageConversionService";
  id v13 = +[CPLProcessSpecification baseProcessSpecification];
  v31[13] = v13;
  v30[14] = @"assetsd";
  uint64_t v1 = +[CPLProcessSpecification signalProcessSpecification];
  uint64_t v2 = [v1 addDefaultsDomain:@"com.apple.assetsd"];
  v31[14] = v2;
  v30[15] = @"Photos";
  uint64_t v3 = +[CPLProcessSpecification baseProcessSpecification];
  uint64_t v4 = [v3 addDefaultsDomain:@"com.apple.mobileslideshow"];
  v31[15] = v4;
  v30[16] = @"Camera";
  dispatch_source_t v5 = +[CPLProcessSpecification baseProcessSpecification];
  id v6 = [v5 addDefaultsDomain:@"com.apple.camera"];
  v31[16] = v6;
  v30[17] = @"nebulad";
  uint64_t v7 = +[CPLProcessSpecification baseProcessSpecification];
  v31[17] = v7;
  v30[18] = @"mediaserverd";
  id v8 = +[CPLProcessSpecification baseProcessSpecification];
  v31[18] = v8;
  v30[19] = @"deferredmediad";
  id v9 = +[CPLProcessSpecification baseProcessSpecification];
  v31[19] = v9;
  v30[20] = @"cameracaptured";
  uint64_t v10 = +[CPLProcessSpecification baseProcessSpecification];
  v31[20] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:21];
  uint64_t v12 = (void *)qword_1000413F0;
  qword_1000413F0 = v11;
}

void sub_1000159DC(uint64_t a1)
{
  uint64_t v1 = +[NSFileManager defaultManager];
  v36 = [@"~/Library/Logs/photoslibraryupgrade.log" stringByExpandingTildeInPath];
  v47[0] = v36;
  v48[0] = @"Logs-mbfloagent";
  v34 = [@"~/Library/Logs/PhotosUpgrade.log" stringByExpandingTildeInPath];
  v47[1] = v34;
  v48[1] = @"Logs-Migration";
  v32 = [@"~/Library/Logs/PhotosUpgrade.aapbz" stringByExpandingTildeInPath];
  v47[2] = v32;
  v48[2] = @"Logs-Migration";
  uint64_t v2 = [@"~/Library/Logs/PhotosUpgrade.aapbz.old" stringByExpandingTildeInPath];
  v47[3] = v2;
  v48[3] = @"Logs-Migration";
  uint64_t v3 = [@"~/Library/Logs/PhotosLegacyUpgrade.aapbz" stringByExpandingTildeInPath];
  v47[4] = v3;
  v48[4] = @"Logs-MigrationService";
  uint64_t v4 = [@"~/Library/Logs/PhotosLegacyUpgrade.aapbz.old" stringByExpandingTildeInPath];
  v47[5] = v4;
  v48[5] = @"Logs-MigrationService";
  dispatch_source_t v5 = [@"~/Library/Logs/PhotosUpgradeCompanion.log" stringByExpandingTildeInPath];
  v47[6] = v5;
  v48[6] = @"Logs-MigrationService";
  id v6 = [@"~/Library/Logs/PhotosLegacyUpgradeCompanion.aapbz" stringByExpandingTildeInPath];
  v47[7] = v6;
  v48[7] = @"Logs-MigrationService";
  uint64_t v7 = [@"~/Library/Logs/PhotosLegacyUpgradeCompanion.aapbz.old" stringByExpandingTildeInPath];
  v47[8] = v7;
  v48[8] = @"Logs-MigrationService";
  id v8 = [@"~/Library/Logs/PhotosSearch.aapbz" stringByExpandingTildeInPath];
  v47[9] = v8;
  v48[9] = @"Logs-Search";
  id v9 = [@"~/Library/Logs/PhotosSearch.aapbz.old" stringByExpandingTildeInPath];
  v47[10] = v9;
  v48[10] = @"Logs-Search";
  uint64_t v10 = (void *)v1;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:11];

  uint64_t v12 = a1;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v43;
    uint64_t v33 = v10;
    id v35 = v13;
    do
    {
      v17 = 0;
      id v37 = v15;
      do
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v17);
        v19 = [v13 objectForKeyedSubscript:v18];
        char v41 = 1;
        if ([v10 fileExistsAtPath:v18 isDirectory:&v41]) {
          BOOL v20 = v41 == 0;
        }
        else {
          BOOL v20 = 0;
        }
        if (v20)
        {
          v21 = [*(id *)(*(void *)(v12 + 32) + 168) URLByAppendingPathComponent:v19];
          v22 = [v18 lastPathComponent];
          v23 = [v21 URLByAppendingPathComponent:v22];

          id v40 = 0;
          LODWORD(v22) = [v10 createDirectoryAtURL:v21 withIntermediateDirectories:1 attributes:0 error:&v40];
          id v24 = v40;
          if (v22)
          {
            v25 = +[NSURL fileURLWithPath:v18];
            id v39 = v24;
            unsigned __int8 v26 = [v10 copyItemAtURL:v25 toURL:v23 error:&v39];
            id v27 = v39;

            if ((v26 & 1) == 0)
            {
              v28 = *(void **)(a1 + 32);
              v29 = [v28 _simplifiedPathForURL:v25];
              v30 = [v27 localizedDescription];
              [v28 printFormat:@"Failed to copy %@: %@", v29, v30];

              goto LABEL_15;
            }
          }
          else
          {
            uint64_t v31 = *(void **)(v12 + 32);
            v25 = [v31 _simplifiedPathForURL:v21];
            v29 = [v24 localizedDescription];
            [v31 printFormat:@"Can't create %@: %@", v25, v29];
            id v27 = v24;
LABEL_15:

            uint64_t v10 = v33;
          }
          id v13 = v35;

          id v15 = v37;
          uint64_t v12 = a1;
        }

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v15);
  }
}

void sub_100015FE8(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  uint64_t v4 = *a3;
  if (sqlite3_value_type(*a3) == 4)
  {
    dispatch_source_t v5 = sqlite3_value_blob(v4);
    id v11 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v5 length:sqlite3_value_bytes(v4) freeWhenDone:0];
    id v6 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:");
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v6 objectForKeyedSubscript:@"p"];
        if (v7)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v7 removeObjectForKey:@"rD"];
            id v8 = malloc_type_malloc((size_t)[v11 length], 0x3754336uLL);
            id v9 = +[NSOutputStream outputStreamToBuffer:capacity:](NSOutputStream, "outputStreamToBuffer:capacity:", v8, [v11 length]);
            [v9 open];
            uint64_t v10 = +[NSPropertyListSerialization writePropertyList:v6 toStream:v9 format:200 options:0 error:0];
            [v9 close];
            if (v10 >= 1)
            {
              sqlite3_result_blob(a1, v8, v10, (void (__cdecl *)(void *))&_free);

LABEL_14:

              return;
            }
            free(v8);
          }
        }
      }
    }
    sqlite3_result_value(a1, v4);
    goto LABEL_14;
  }
  sqlite3_result_value(a1, v4);
}

void sub_100016314(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  uint64_t v4 = *a3;
  if (sqlite3_value_type(*a3) == 4)
  {
    id v6 = sqlite3_value_blob(v4);
    id v7 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v6 length:sqlite3_value_bytes(v4) freeWhenDone:0];
    id v8 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v7 class:objc_opt_class()];
    id v9 = v8;
    if (!v8) {
      goto LABEL_16;
    }
    uint64_t v10 = [v8 momentShare];
    id v11 = [v10 shareURL];
    uint64_t v12 = v11;
    if (v11)
    {
      id v13 = objc_msgSend(v11, "cpl_redactedShareURL");

      [v10 setShareURL:v13];
    }
    else
    {
      id v13 = 0;
    }
    id v14 = [v10 previewData];
    if (v14)
    {
      [v10 setPreviewData:0];
    }
    else if (!v12)
    {
LABEL_13:
      if (v7)
      {
        id v16 = [v7 length];
        v17 = malloc_type_malloc((size_t)v16, 0xD70DF2A0uLL);
        objc_msgSend(v7, "getBytes:range:", v17, 0, v16);
        sqlite3_result_blob(a1, v17, (int)v16, (void (__cdecl *)(void *))&_free);

LABEL_17:
        return;
      }

LABEL_16:
      sqlite3_result_value(a1, v4);
      goto LABEL_17;
    }
    uint64_t v15 = +[NSKeyedArchiver cpl_archivedDataWithRootObject:v9];

    id v7 = (id)v15;
    goto LABEL_13;
  }
  sqlite3_result_value(a1, v4);
}

void sub_100016644(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  uint64_t v4 = *a3;
  if (sqlite3_value_type(*a3) == 3
    && (dispatch_source_t v5 = sqlite3_value_text(v4),
        (id v6 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v5 length:strlen((const char *)v5) encoding:4 freeWhenDone:0]) != 0))
  {
    id v7 = v6;
    id v8 = objc_msgSend(v6, "cpl_redactedShareURL");

    id v9 = v8;
    sqlite3_result_text(a1, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_result_value(a1, v4);
  }
}

void sub_100017788(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) stringByAppendingPathComponent:a2];
  [v2 addObject:v3];
}

void sub_1000184AC(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v7[0] = v3[62];
  v7[1] = @"library";
  v7[2] = @"-l";
  v7[3] = v2;
  v7[4] = @"summary";
  uint64_t v4 = +[NSArray arrayWithObjects:v7 count:5];
  dispatch_source_t v5 = +[NSString stringWithFormat:@"Getting %@ summary", *(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 48) stringByAppendingPathComponent:@"library_summary.log"];
  [v3 collectOutputOfCommandAndArguments:v4 label:v5 filename:v6 outputIsStderr:0 timeout:1];
}

void sub_100019060(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v17 = 1;
  id v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  uint64_t v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3 isDirectory:&v17];
  int v6 = v17;

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = +[NSFileManager defaultManager];
    id v9 = [v8 contentsOfDirectoryAtPath:v3 error:0];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100019190;
    v13[3] = &unk_1000350F0;
    id v10 = v3;
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(a1 + 48);
    id v14 = v10;
    uint64_t v15 = v11;
    id v16 = v12;
    [v9 enumerateObjectsUsingBlock:v13];
  }
}

void sub_100019190(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  id v3 = +[NSURL fileURLWithPath:v4];
  [*(id *)(a1 + 40) collectFileAtURL:v3 suffix:0 destinationDirectory:*(void *)(a1 + 48)];
}

void sub_100019334(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 shouldSignal]) {
    [*(id *)(a1 + 32) appendFormat:@" %@", v5];
  }
}

void sub_1000194E0(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v5 shouldSample])
  {
    unsigned int v6 = [v5 requiresRoot];
    BOOL v7 = *(unsigned char **)(a1 + 32);
    if (!v6 || v7[447])
    {
      [v7 sampleProcess:v8];
      if ([v5 shouldRunMemoryTools]) {
        [*(id *)(a1 + 32) executeMemoryToolsOnProcess:v8];
      }
    }
  }
}

void sub_100019628(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = [a3 defaultsDomain];
  if (v5)
  {
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"/usr/bin/defaults read /var/mobile/Library/Preferences/%@.plist", v5];
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Getting defaults for %@", v11];
    id v8 = objc_alloc((Class)NSString);
    id v9 = [*(id *)(a1 + 32) processDetailPath:v11];
    id v10 = [v8 initWithFormat:@"%@-defaults.txt", v9];

    [*(id *)(a1 + 32) collectOutputOfCommand:v6 label:v7 filename:v10];
  }
}

void sub_10001A13C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001A184(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001A194(uint64_t a1)
{
}

void sub_10001A19C(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(v3 + 24) = 0;
    v4[2]();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

id sub_10001A21C(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    sub_10002099C();
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    sub_100020970();
  }
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  id v5 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001A328;
  v9[3] = &unk_100035168;
  id v6 = *(id *)(a1 + 48);
  void v9[4] = *(void *)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 72);
  id v7 = [v5 proxyWithErrorHandler:v9];

  return v7;
}

void sub_10001A328(void *a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A3D8;
  v7[3] = &unk_100035140;
  uint64_t v4 = a1[5];
  v7[4] = a1[4];
  id v8 = v3;
  uint64_t v9 = a1[6];
  id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v7);
}

void sub_10001A3D8(uint64_t a1)
{
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) localizedDescription];
  [v2 printFormat:@"  call to daemon proxy failed: %@", v3];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

void sub_10001A43C(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v1) {
    sub_1000209C8();
  }
  dispatch_time_t v3 = dispatch_time(0, 40000000000);
  if (dispatch_semaphore_wait(v1, v3))
  {
    uint64_t v4 = *(NSObject **)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001A528;
    v8[3] = &unk_100034FF0;
    id v5 = *(id *)(a1 + 48);
    void v8[4] = *(void *)(a1 + 40);
    id v9 = v5;
    dispatch_sync(v4, v8);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

uint64_t sub_10001A528(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001A5A4;
  v3[3] = &unk_100034BA0;
  uint64_t v1 = *(void *)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

id sub_10001A5A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) printFormat:@"  took too long"];
}

void sub_10001A5B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001A688;
  v12[3] = &unk_1000350C8;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = v6;
  id v9 = *(void (**)(uint64_t, void *))(v8 + 16);
  id v10 = v6;
  id v11 = v5;
  v9(v8, v12);
}

void sub_10001A688(id *a1)
{
  id v2 = a1[5];
  if (a1[4])
  {
    [a1[5] printFormat:&stru_1000359E8];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    dispatch_time_t v3 = [a1[4] componentsSeparatedByString:@"\n"];
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [a1[5] printFormat:@"  %@", *(void *)(*((void *)&v9 + 1) + 8 * i)];
        }
        id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    [a1[5] printFormat:&stru_1000359E8];
  }
  else
  {
    id v8 = [a1[6] localizedDescription];
    [v2 printFormat:@"  failed: %@", v8];
  }
}

void sub_10001A830(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001A904;
  v12[3] = &unk_1000350C8;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = v6;
  long long v9 = *(void (**)(uint64_t, void *))(v8 + 16);
  id v10 = v6;
  id v11 = v5;
  v9(v8, v12);
}

void sub_10001A904(id *a1)
{
  id v2 = a1[4];
  if (v2)
  {
    if ([v2 count])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v3 = a1[4];
      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v12;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v12 != v6) {
              objc_enumerationMutation(v3);
            }
            [a1[5] printFormat:@"  * %@", *(void *)(*((void *)&v11 + 1) + 8 * i)];
          }
          id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v5);
      }
    }
    else
    {
      id v9 = a1[5];
      [v9 printFormat:@"    no library managers are connected"];
    }
  }
  else
  {
    id v8 = a1[5];
    id v10 = [a1[6] localizedDescription];
    [v8 printFormat:@"    failed: %@", v10];
  }
}

void sub_10001AE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001AE58(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  void *v7 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001B830(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if ([a3 shouldRunTaskInfo])
  {
    id v5 = +[NSString stringWithFormat:@"/usr/bin/taskinfo --threads %@", v9];
    uint64_t v6 = +[NSString stringWithFormat:@"Gathering taskinfo on %@", v9];
    uint64_t v7 = [*(id *)(a1 + 32) processDetailPath:v9];
    id v8 = +[NSString stringWithFormat:@"%@-taskinfo.txt", v7];

    [*(id *)(a1 + 32) collectOutputOfCommand:v5 label:v6 filename:v8];
  }
}

void sub_10001BA60(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = [v7 defaultsDomain];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v7 defaultsDomain];
    [v5 writePreferenceInDomain:v6 withKey:0 toDirectory:*(void *)(a1 + 40) currentUser:1];
  }
}

void sub_10001BC78(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v19 = 0;
  id v3 = +[Libsysdiagnose sysdiagnoseWithMetadata:v2 withMetrics:0 withError:&v19];
  id v4 = v19;
  id v5 = v4;
  if (v3)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v7 = v6;
    double v8 = *(double *)(a1 + 48);
    id v9 = [*(id *)(*(void *)(a1 + 40) + 168) URLByAppendingPathComponent:@"sysdiagnose"];
    id v10 = [v9 path];

    id v11 = +[NSFileManager defaultManager];
    id v18 = v5;
    unsigned __int8 v12 = [v11 moveItemAtPath:v3 toPath:v10 error:&v18];
    id v13 = v18;

    if (v12)
    {
      [*(id *)(a1 + 40) printFormat:@"  sysdiagnose elapsed time: %.2fs", v7 - v8];
    }
    else
    {
      uint64_t v16 = *(void **)(a1 + 40);
      uint64_t v17 = [v13 localizedDescription];
      [v16 printFormat:@"  sysdiagnose error moving %@ to %@: %@", v3, v10, v17];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 476) = 1;
    uint64_t v14 = *(void **)(a1 + 40);
    if (v4)
    {
      uint64_t v15 = [v4 localizedDescription];
      [v14 printFormat:@"  sysdiagnose failed: %@", v15];
    }
    else
    {
      [v14 printFormat:@"  sysdiagnose failed: %@", @"unknown reason"];
    }
  }
}

id sub_10001C57C(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectOutputOfCommand:@"/usr/local/bin/ckctl dump" label:@"Dumping CloudKit state" filename:@"ckctl_dump.txt"];
}

unsigned char *sub_10001C59C(uint64_t a1)
{
  [*(id *)(a1 + 32) collectCloudPhotodGlobalStatus];
  [*(id *)(a1 + 32) collectAppLibraryIdentifiers];
  if ([*(id *)(a1 + 32) includeSPL]) {
    [*(id *)(a1 + 32) collectCloudPhotodStatusWithLibraryIdentifier:CPLLibraryIdentifierSystemLibrary subdirectory:0];
  }
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[16])
  {
    id v3 = [v2 _readAppPrivateData];
    id v4 = [v3 valueForKeyPath:@"Library.CPL.LibraryType"];
    if ([v4 integerValue] == (id)1)
    {
      id v5 = [v3 valueForKeyPath:@"Library.Identifier.UUID"];
      double v6 = [v3 valueForKeyPath:@"Library.Identifier.ContainerIdentifier"];
      double v7 = v6;
      if (!v5 || !v6)
      {

        goto LABEL_10;
      }
      uint64_t v8 = CPLLibraryIdentifierForApp();

      if (v8)
      {
        [*(id *)(a1 + 32) collectCloudPhotodStatusWithLibraryIdentifier:v8 subdirectory:@"Library"];
        id v5 = (void *)v8;
LABEL_10:
      }
    }

    uint64_t v2 = *(void **)(a1 + 32);
  }
  [v2 collectAccountStatus];
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[472])
  {
    return [result collectDefaults];
  }
  return result;
}

id sub_10001C704(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 473))
  {
    if (*(unsigned char *)(v2 + 451)) {
      goto LABEL_4;
    }
    v28[0] = *(void *)(v2 + 496);
    v28[1] = @"listcloudphotoguids";
    id v3 = +[NSArray arrayWithObjects:v28 count:2];
    [(id)v2 collectOutputOfCommandAndArguments:v3 label:@"Getting local photo cloudGUIDs" filename:@"local_photo_cloud_guids.txt" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

    id v4 = *(void **)(a1 + 32);
    v27[0] = v4[62];
    v27[1] = @"librarysummary";
    id v5 = +[NSArray arrayWithObjects:v27 count:2];
    [v4 collectOutputOfCommandAndArguments:v5 label:@"Getting local library summary" filename:@"local_asset_counts.txt" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

    double v6 = *(void **)(a1 + 32);
    v26[0] = v6[62];
    v26[1] = @"resource";
    v26[2] = @"status";
    double v7 = +[NSArray arrayWithObjects:v26 count:3];
    [v6 collectOutputOfCommandAndArguments:v7 label:@"Getting resource model summary" filename:@"resource_model_status.txt" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

    uint64_t v8 = *(void **)(a1 + 32);
    v25[0] = v8[62];
    v25[1] = @"printmoments";
    id v9 = +[NSArray arrayWithObjects:v25 count:2];
    [v8 collectOutputOfCommandAndArguments:v9 label:@"Getting Moments info" filename:@"moments.txt" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

    id v10 = *(void **)(a1 + 32);
    v24[0] = v10[62];
    v24[1] = @"graph";
    v24[2] = @"statistics";
    v24[3] = @"contactsuggestions";
    id v11 = +[NSArray arrayWithObjects:v24 count:4];
    [v10 collectOutputOfCommandAndArguments:v11 label:@"Getting people contact suggestions diagnosis" filename:@"people_contact_suggestions_diagnosis.log" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

    uint64_t v2 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v2 + 473))
    {
LABEL_4:
      v23[0] = *(void *)(v2 + 496);
      v23[1] = @"triage-log";
      v23[2] = @"json-pretty";
      unsigned __int8 v12 = +[NSArray arrayWithObjects:v23 count:3];
      [(id)v2 collectOutputOfCommandAndArguments:v12 label:@"Getting triage logs" filename:@"triageLogs.txt" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

      id v13 = *(void **)(a1 + 32);
      v22[0] = v13[62];
      v22[1] = @"printdbmetadata";
      uint64_t v14 = +[NSArray arrayWithObjects:v22 count:2];
      [v13 collectOutputOfCommandAndArguments:v14 label:@"Getting db metadata" filename:@"dbMetadata.txt" outputIsStderr:0 timeout:*(unsigned __int8 *)(*(void *)(a1 + 32) + 448)];

      uint64_t v15 = *(void **)(a1 + 32);
      v21[0] = v15[62];
      v21[1] = @"backgroundjob";
      v21[2] = @"status";
      uint64_t v16 = +[NSArray arrayWithObjects:v21 count:3];
      [v15 collectOutputOfCommandAndArguments:v16 label:@"Getting backgroundjobservice status" filename:@"backgroundjobserviceStatus.txt" outputIsStderr:0 timeout:1];

      [*(id *)(a1 + 32) collectOutputOfCommand:@"/usr/local/bin/backupctl restoreInfo" label:@"Getting backupd restore info" filename:0 timeout:1];
      [*(id *)(a1 + 32) collectOutputOfCommand:@"/usr/local/bin/backupctl listFailures" label:@"Getting backupd failures" filename:0 timeout:1];
      [*(id *)(a1 + 32) collectLocalLibraryMetadataInfo];
      [*(id *)(a1 + 32) collectOutputOfCommand:@"/usr/local/bin/ckctl -v prod -c com.apple.photos.cloud -x deviceID" label:@"Collecting deviceID" filename:@"deviceID.txt"];
      [*(id *)(a1 + 32) collectOutputOfCommand:@"/usr/local/bin/accounts_tool listAccounts -v" label:@"Collecting accounts" filename:@"accounts_list.txt"];
      uint64_t v17 = *(void **)(a1 + 32);
      v20[0] = v17[62];
      v20[1] = @"sharing";
      v20[2] = @"syndicationResults";
      v20[3] = @"summary";
      id v18 = +[NSArray arrayWithObjects:v20 count:4];
      [v17 collectOutputOfCommandAndArguments:v18 label:@"Getting Syndication Results Summary" filename:@"syndication_results_summary.txt" outputIsStderr:0 timeout:1];

      [*(id *)(a1 + 32) collectSearchDiagnostics];
      [*(id *)(a1 + 32) collectMemoryCreationDiagnostics];
      [*(id *)(a1 + 32) collectSilentMover];
      [*(id *)(a1 + 32) collectLOFetchRecordings];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  id result = [*(id *)(v2 + 488) count];
  if (result) {
    return [*(id *)(a1 + 32) collectFeatureAreaDiagnostics];
  }
  return result;
}

void *CPLDiagnoseRecursiveFileListing()
{
  v0 = (void *)__chkstk_darwin();
  uint64_t v2 = v1;
  id v4 = v3;
  double v6 = v5;
  int v8 = v7;
  id v10 = v9;
  id v11 = v0;
  id v12 = v10;
  v129 = v4;
  if (!v4)
  {
    memset(v130, 0, sizeof(v130));
    v129 = (int64x2_t *)v130;
  }
  if (v6) {
    *double v6 = 0;
  }
  v116 = v6;
  id v13 = v12;
  uint64_t v14 = fopen((const char *)[v13 fileSystemRepresentation], "wx");
  if (v14)
  {
    uint64_t v15 = v14;
    v117 = (char *)malloc_type_malloc(0x100000uLL, 0x4A92B3C4uLL);
    setvbuf(v15, v117, 0, 0x100000uLL);
    id v16 = v11;
    v137[0] = (char *)[v16 fileSystemRepresentation];
    v137[1] = 0;
    uint64_t v17 = fts_open_b(v137, 81, &stru_1000352C0);
    BOOL v118 = v17 != 0;
    if (v17)
    {
      id v18 = v17;
      id v114 = v13;
      id v115 = v11;
      fwrite("mode link_count inode purgeable_flags uid gid file_size modification_date filename\n\n", 0x54uLL, 1uLL, v15);
      id v19 = fts_read(v18);
      if (!v19) {
        goto LABEL_136;
      }
      BOOL v20 = v19;
      char v21 = 1;
      int v120 = v8;
      v119 = v18;
      while (1)
      {
        switch(v20->fts_info)
        {
          case 1u:
            fts_path = v20->fts_path;
            memset(&v140, 0, 512);
            if (statfs(fts_path, &v140))
            {
              v23 = __stderrp;
              id v24 = __error();
              strerror(*v24);
              fprintf(v23, "error finding volume info for %s: %s\n");
            }
            else
            {
              memset(v147, 0, 28);
              *(_OWORD *)flagset_p = 0u;
              *(_OWORD *)__str = xmmword_100027328;
              uint64_t v145 = 0;
              if (getattrlist(v140.f_mntonname, __str, flagset_p, 0x2CuLL, 0))
              {
                v25 = __stderrp;
                unsigned __int8 v26 = __error();
                strerror(*v26);
                fprintf(v25, "error finding volume capabilities for %s: %s\n");
              }
              else if ((v147[1] & 2) != 0)
              {
                uint64_t v142 = 0;
                *(_OWORD *)v141 = xmmword_100027340;
                *(void *)__bp = 0;
                if (getattrlist(fts_path, v141, __bp, 8uLL, 0))
                {
                  v94 = __stderrp;
                  v95 = __error();
                  strerror(*v95);
                  fprintf(v94, "error finding ATTR_DIR_ENTRYCOUNT for %s: %s\n");
                }
                else if (*(_DWORD *)&__bp[4] >= 0xC351u)
                {
                  fprintf(v15, "ERROR too many entries (%ld): %s\n", *(unsigned int *)&__bp[4], v20->fts_path);
                  fts_set(v18, v20, 4);
                  goto LABEL_129;
                }
              }
            }
            id v27 = fts_children(v18, 0);
            if (!v27) {
              goto LABEL_128;
            }
            v28 = v27;
            if ((v21 & 1) == 0) {
              fputc(10, v15);
            }
            if (!v20->fts_level)
            {
              v29 = +[NSString stringWithUTF8String:v20->fts_path];
              memset(&v140, 0, 144);
              id v30 = v29;
              if (!stat((const char *)[v30 fileSystemRepresentation], (stat *)&v140)) {
                sub_10001E378(".", (uint64_t)&v140, v15);
              }
              id v31 = [v30 stringByAppendingPathComponent:@".."];
              if (!stat((const char *)[v31 fileSystemRepresentation], (stat *)&v140)) {
                sub_10001E378("..", (uint64_t)&v140, v15);
              }
              fputc(10, v15);
            }
            fputs(v20->fts_path, v15);
            fputc(58, v15);
            fputc(10, v15);
            uint64_t st_size = 0;
            unsigned __int16 st_nlink = 0;
            int v125 = 1;
            int v126 = 1;
            int v124 = 1;
            v34 = v28;
            do
            {
              int fts_info = v34->fts_info;
              if (fts_info == 10 || fts_info == 7)
              {
                id v37 = strerror(v34->fts_errno);
                fprintf(v15, "ERROR %s: %s\n", v34->fts_name, v37);
              }
              else
              {
                fts_statp = v34->fts_statp;
                if (fts_statp->st_nlink > st_nlink) {
                  unsigned __int16 st_nlink = fts_statp->st_nlink;
                }
                int v39 = snprintf(__str, 0x400uLL, "%u", fts_statp->st_uid);
                if (v39 <= v124) {
                  int v40 = v124;
                }
                else {
                  int v40 = v39;
                }
                int v124 = v40;
                int v41 = snprintf(__str, 0x400uLL, "%u", fts_statp->st_gid);
                if (v41 <= v125) {
                  int v42 = v125;
                }
                else {
                  int v42 = v41;
                }
                int v125 = v42;
                int v43 = snprintf(__str, 0x400uLL, "%llu", fts_statp->st_ino);
                if (v43 <= v126) {
                  int v44 = v126;
                }
                else {
                  int v44 = v43;
                }
                int v126 = v44;
                if (fts_statp->st_size > st_size) {
                  uint64_t st_size = fts_statp->st_size;
                }
              }
              v34 = v34->fts_link;
            }
            while (v34);
            int v122 = snprintf(__str, 0x400uLL, "%hu", st_nlink);
            int v128 = snprintf(__str, 0x400uLL, "%lld", st_size);
            break;
          case 2u:
            fprintf(v15, "ERROR %s: directory causes a cycle\n");
            goto LABEL_129;
          case 4u:
          case 7u:
            strerror(v20->fts_errno);
            fprintf(v15, "ERROR %s: %s\n");
            goto LABEL_129;
          default:
            goto LABEL_129;
        }
        do
        {
          int v45 = v28->fts_info;
          if (v45 == 7 || v45 == 10) {
            goto LABEL_126;
          }
          v47 = (int64x2_t *)v28->fts_statp;
          __bp[11] = 0;
          strcpy(__bp, "          ");
          strmode(v47->u16[2], __bp);
          __bp[10] = 0;
          fputs(__bp, v15);
          if (v28->fts_level)
          {
            fts_name = __str;
            snprintf(__str, 0x400uLL, "%s/%s", v28->fts_parent->fts_accpath, v28->fts_name);
          }
          else
          {
            fts_name = v28->fts_name;
          }
          ssize_t v49 = listxattr(fts_name, 0, 0, 1);
          acl_entry_t entry_p = 0;
          link_np = acl_get_link_np(fts_name, ACL_TYPE_EXTENDED);
          v51 = link_np;
          if (link_np && acl_get_entry(link_np, 0, &entry_p) == -1)
          {
            acl_free(v51);
            v51 = 0;
          }
          if (v51) {
            int v52 = 43;
          }
          else {
            int v52 = 32;
          }
          if (v49 >= 1) {
            int v53 = 64;
          }
          else {
            int v53 = v52;
          }
          fputc(v53, v15);
          v54 = localtime(v47[3].i64);
          strftime(v141, 0x28uLL, "%FT%T", v54);
          uint64_t v55 = v47[3].i64[1];
          if (v55 <= 0) {
            unint64_t v56 = v47[3].u64[1];
          }
          else {
            unint64_t v56 = v55 / 0xF4240uLL;
          }
          uint64_t v131 = 0;
          fsctl(fts_name, 0x40084A47uLL, &v131, 0);
          fprintf(v15, " %*d %*llu %04llx %-*u  %-*u  %*lld %s.%03ld ", v122, v47->u16[3], v126, v47->i64[1], v131, v124, v47[1].i32[0], v125, v47[1].i32[1], v128, v47[6].i64[0], v141, v56);
          sub_10001E498(v28->fts_name, v15);
          int v57 = v47->i16[2] & 0xF000;
          v58 = (int64x2_t *)((char *)v129 + 40);
          if (v57 != 0x4000)
          {
            if (v57 == 40960)
            {
              if (v28->fts_level) {
                snprintf((char *)&v140, 0x401uLL, "%s/%s");
              }
              else {
                snprintf((char *)&v140, 0x401uLL, "%s");
              }
              int v59 = readlink((const char *)&v140, (char *)flagset_p, 0x400uLL);
              if (v59 == -1)
              {
                v60 = __error();
                v61 = strerror(*v60);
                fprintf(v15, "\nERROR ls: %s: %s\n", (const char *)&v140, v61);
              }
              else
              {
                *((unsigned char *)flagset_p + v59) = 0;
                fwrite(" -> ", 4uLL, 1uLL, v15);
                sub_10001E498((char *)flagset_p, v15);
              }
              v58 = v129 + 2;
            }
            else
            {
              v58 = (int64x2_t *)((char *)v129 + 24);
            }
          }
          ++v58->i64[0];
          fputc(10, v15);
          int64x2_t *v129 = vaddq_s64(*v129, v47[6]);
          if (!v8 || v49 < 1) {
            goto LABEL_124;
          }
          v121 = v47;
          acl = v51;
          size_t v62 = v49 & ~(v49 >> 63);
          v63 = (char *)malloc_type_malloc(v62, 0xBD4F56AFuLL);
          int v64 = 1;
          listxattr(fts_name, v63, v62, 1);
          uint64_t v65 = 0;
          v66 = 0;
          v129[1].i64[0] += v62;
          v67 = &v63[v62];
          size_t v68 = 4;
          __s1 = v63;
          v69 = v63;
          do
          {
            unsigned int v70 = v64;
            v66 = reallocf(v66, v68);
            int v71 = getxattr(fts_name, v69, 0, 0, 0, 1);
            if (v71 >= 1) {
              v129[1].i64[0] += v71;
            }
            *((_DWORD *)v66 + v65) = v71;
            v69 += strlen(v69) + 1;
            v68 += 4;
            ++v65;
            ++v64;
          }
          while (v69 < v67);
          int v8 = v120;
          if (v65)
          {
            uint64_t v72 = v70;
            v73 = (int *)v66;
            v74 = __s1;
            do
            {
              if (strcmp(v74, "com.apple.quarantine"))
              {
                fputc(9, v15);
                sub_10001E498(v74, v15);
                fputc(9, v15);
                fprintf(v15, "%*jd ", v128, *v73);
                fputc(10, v15);
                v74 += strlen(v74) + 1;
              }
              ++v73;
              --v72;
            }
            while (v72);
          }
          free(__s1);
          free(v66);
          v51 = acl;
          if (acl)
          {
            __int16 v75 = v121->i16[2];
            *(void *)&v140.f_bsize = 0;
            acl_tag_t tag_type_p = ACL_UNDEFINED_TAG;
            flagset_p[0] = 0;
            acl_permset_t permset_p = 0;
            if (!acl_get_entry(acl, 0, (acl_entry_t *)&v140))
            {
              int v76 = 0;
              if ((v75 & 0xF000) == 0x4000) {
                int v77 = 1;
              }
              else {
                int v77 = 2;
              }
              do
              {
                if (!acl_get_tag_type(*(acl_entry_t *)&v140.f_bsize, &tag_type_p)
                  && !acl_get_flagset_np(*(void **)&v140.f_bsize, flagset_p)
                  && !acl_get_permset(*(acl_entry_t *)&v140.f_bsize, &permset_p))
                {
                  qualifier = (unsigned __int8 *)acl_get_qualifier(*(acl_entry_t *)&v140.f_bsize);
                  if (qualifier)
                  {
                    v79 = qualifier;
                    v80 = (char *)malloc_type_malloc(0x105uLL, 0x83257787uLL);
                    if (!v80) {
                      sub_1000209F4();
                    }
                    v81 = v80;
                    uuid_unparse_upper(v79, v80);
                    acl_free(v79);
                    v82 = "unknown";
                    if (tag_type_p == ACL_EXTENDED_DENY) {
                      v82 = "deny";
                    }
                    if (tag_type_p == ACL_EXTENDED_ALLOW) {
                      v83 = "allow";
                    }
                    else {
                      v83 = v82;
                    }
                    int flag_np = acl_get_flag_np(flagset_p[0], ACL_ENTRY_INHERITED);
                    v85 = " inherited";
                    if (!flag_np) {
                      v85 = "";
                    }
                    fprintf(v15, " %d: %s%s %s ", v76, v81, v85, v83);
                    free(v81);
                    uint64_t v86 = 0;
                    int v87 = 0;
                    do
                    {
                      v88 = (const char **)((char *)&unk_1000352E0 + v86);
                      if (acl_get_perm_np(permset_p, *(acl_perm_t *)((char *)&unk_1000352E0 + v86))
                        && (v88[2] & v77) != 0)
                      {
                        v89 = ",";
                        if (!v87) {
                          v89 = "";
                        }
                        fprintf(v15, "%s%s", v89, v88[1]);
                        ++v87;
                        v51 = acl;
                      }
                      v86 += 24;
                    }
                    while (v86 != 408);
                    for (uint64_t i = 0; i != 96; i += 24)
                    {
                      v91 = (const char **)((char *)&unk_100035490 + i);
                      if (acl_get_flag_np(flagset_p[0], *(acl_flag_t *)((char *)&unk_100035490 + i))
                        && (v91[2] & v77) != 0)
                      {
                        v92 = ",";
                        if (!v87) {
                          v92 = "";
                        }
                        fprintf(v15, "%s%s", v92, v91[1]);
                        ++v87;
                        v51 = acl;
                      }
                    }
                    fputc(10, v15);
                  }
                }
                ++v76;
                if (*(void *)&v140.f_bsize) {
                  int v93 = -1;
                }
                else {
                  int v93 = 0;
                }
              }
              while (!acl_get_entry(v51, v93, (acl_entry_t *)&v140));
            }
LABEL_124:
            if (v51) {
              acl_free(v51);
            }
          }
LABEL_126:
          v28 = v28->fts_link;
        }
        while (v28);
        char v21 = 0;
LABEL_128:
        id v18 = v119;
LABEL_129:
        BOOL v20 = fts_read(v18);
        if (!v20)
        {
LABEL_136:
          fts_close(v18);
          if (ftell(v15))
          {
            fprintf(v15, "\nTOTALS st_size=%lld st_blocks=%lld xattr_size=%lld directories=%ld files=%ld symlinks=%ld\n", v129->i64[0], v129->i64[1], v129[1].i64[0], v129[2].i64[1], v129[1].i64[1], v129[2].i64[0]);
            uint64_t v96 = v129->i64[1];
            uint64_t v97 = v129->i64[0] + 0xFFFFF;
            if (v129->i64[0] >= 0) {
              uint64_t v97 = v129->i64[0];
            }
            uint64_t v98 = v97 >> 20;
            uint64_t v99 = v96 + 2047;
            if (v96 >= 0) {
              uint64_t v99 = v129->i64[1];
            }
            fprintf(v15, "       size in MiB: %lldMiB, blocks in MiB: %lldMiB\n", v98, v99 >> 11);
            fclose(v15);
            free(v117);
            id v13 = v114;
            id v11 = v115;
          }
          else
          {
            fclose(v15);
            free(v117);
            id v13 = v114;
            v111 = (const std::__fs::filesystem::path *)[v114 fileSystemRepresentation];
            remove(v111, v112);
            id v11 = v115;
            if (v116) {
              unsigned char *v116 = 1;
            }
          }
          goto LABEL_149;
        }
      }
    }
    if (v2)
    {
      v107 = __error();
      v108 = +[NSString stringWithUTF8String:strerror(*v107)];
      uint64_t v109 = *__error();
      v135[0] = NSLocalizedDescriptionKey;
      v135[1] = NSLocalizedFailureReasonErrorKey;
      v136[0] = @"Error opening path to find recursive listing.";
      v136[1] = v108;
      v135[2] = NSFilePathErrorKey;
      v136[2] = v16;
      v110 = +[NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:3];
      *uint64_t v2 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v109 userInfo:v110];
    }
    fclose(v15);
    free(v117);
LABEL_149:
    uint64_t v2 = (void *)v118;
  }
  else if (v2)
  {
    v100 = __error();
    v101 = +[NSString stringWithUTF8String:strerror(*v100)];
    id v102 = v11;
    uint64_t v103 = *__error();
    v138[0] = NSLocalizedDescriptionKey;
    v138[1] = NSLocalizedFailureReasonErrorKey;
    v139[0] = @"Error opening recursive listing file for writing.";
    v139[1] = v101;
    v138[2] = NSFilePathErrorKey;
    v139[2] = v13;
    +[NSDictionary dictionaryWithObjects:v139 forKeys:v138 count:3];
    v105 = id v104 = v13;
    uint64_t v106 = v103;
    id v11 = v102;
    *uint64_t v2 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v106 userInfo:v105];

    id v13 = v104;
    uint64_t v2 = 0;
  }

  return v2;
}

int sub_10001E364(id a1, const _ftsent **a2, const _ftsent **a3)
{
  return strcmp((*a2)->fts_name, (*a3)->fts_name);
}

uint64_t sub_10001E378(const char *a1, uint64_t a2, FILE *a3)
{
  __bp[11] = 0;
  strcpy(__bp, "          ");
  strmode(*(unsigned __int16 *)(a2 + 4), __bp);
  __bp[10] = 0;
  fprintf(a3, "stat %s: ", a1);
  fprintf(a3, "st_dev=%d st_ino=%llu st_mode=%d (%s) st_nlink=%d st_uid=%d st_gid=%d st_rdev=%d st_size=%lld ", *(_DWORD *)a2, *(void *)(a2 + 8), *(unsigned __int16 *)(a2 + 4), __bp, *(unsigned __int16 *)(a2 + 6), *(_DWORD *)(a2 + 16), *(_DWORD *)(a2 + 20), *(_DWORD *)(a2 + 24), *(void *)(a2 + 96));
  fprintf(a3, "st_atime=%ld st_mtime=%ld st_ctime=%ld st_birthtime=%ld st_blksize=%d st_block=%lld st_flags=%d", *(void *)(a2 + 32), *(void *)(a2 + 48), *(void *)(a2 + 64), *(void *)(a2 + 80), *(_DWORD *)(a2 + 112), *(void *)(a2 + 104), *(_DWORD *)(a2 + 116));
  return fputc(10, a3);
}

unint64_t sub_10001E498(char *a1, FILE *a2)
{
  id v3 = a1;
  __darwin_ct_rune_t v16 = 0;
  memset(&v17, 0, sizeof(v17));
  unint64_t result = mbrtowc(&v16, a1, 6uLL, &v17);
  if (result)
  {
    unint64_t v5 = result;
    int v6 = 0;
    while (v5 > 0xFFFFFFFFFFFFFFFDLL)
    {
      if (v5 == -1)
      {
        LODWORD(result) = 1;
LABEL_21:
        int v12 = 4 * result;
        id v13 = v3;
        uint64_t v14 = result;
        do
        {
          unsigned int v15 = *(unsigned __int8 *)v13++;
          fputc(92, a2);
          fputc((v15 >> 6) | 0x30, a2);
          fputc((v15 >> 3) & 7 | 0x30, a2);
          unint64_t result = fputc(v15 & 7 | 0x30, a2);
          --v14;
        }
        while (v14);
        v6 += v12;
        goto LABEL_24;
      }
      unint64_t result = strlen(v3);
LABEL_18:
      if ((int)result >= 1) {
        goto LABEL_21;
      }
LABEL_24:
      if (v5 == -1)
      {
        unint64_t v5 = 1;
        memset(&v17, 0, sizeof(v17));
      }
      else if (v5 == -2)
      {
        return result;
      }
      v3 += v5;
      unint64_t result = mbrtowc(&v16, v3, 6uLL, &v17);
      unint64_t v5 = result;
      if (!result) {
        return result;
      }
    }
    __darwin_ct_rune_t v7 = v16;
    if (v16 > 0x7F)
    {
      int v8 = __maskrune(v16, 0x40000uLL);
      __darwin_ct_rune_t v7 = v16;
      if (!v8)
      {
LABEL_17:
        unint64_t result = v5;
        goto LABEL_18;
      }
    }
    else if ((_DefaultRuneLocale.__runetype[v16] & 0x40000) == 0)
    {
      goto LABEL_17;
    }
    if (v7 != 34 && v7 != 92)
    {
      if ((int)v5 >= 1)
      {
        uint64_t v9 = v5;
        id v10 = v3;
        do
        {
          int v11 = *(unsigned __int8 *)v10++;
          fputc(v11, a2);
          --v9;
        }
        while (v9);
        __darwin_ct_rune_t v7 = v16;
      }
      unint64_t result = wcwidth(v7);
      v6 += result;
      goto LABEL_24;
    }
    goto LABEL_17;
  }
  return result;
}

void sub_10001E844(id a1)
{
  qword_100041408 = MGCopyAnswer();
  _objc_release_x1();
}

void sub_10001F18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void *sub_10001F1C8(void *result)
{
  uint64_t v1 = result[4];
  if (*(unsigned char *)(v1 + 8) == 1)
  {
    *(unsigned char *)(*(void *)(result[6] + 8) + 24) = 1;
  }
  else
  {
    *(unsigned char *)(v1 + 8) = 1;
    return (void *)(*(uint64_t (**)(void, uint64_t, void, void))(result[5] + 16))(result[5], 1, *(void *)(result[4] + 16), 0);
  }
  return result;
}

id sub_10001F210(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyClientsStateChangedOnQueue];
}

id sub_10001F218(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = -1;
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 notifyClientsStateChangedOnQueue];
}

id sub_10001F264(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  return [*(id *)(a1 + 32) notifyClientsStateChangedOnQueue];
}

uint64_t sub_10001F30C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(char *)(*(void *)(a1 + 32) + 8));
}

void sub_10001F3A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 remoteObjectProxy];
  [v4 diagnosticServiceStateDidChange:*(char *)(*(void *)(a1 + 32) + 8) outputURL:*(void *)(*(void *)(a1 + 32) + 16) error:*(void *)(*(void *)(a1 + 32) + 24)];
}

void sub_10001F720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_10001F748(void *a1)
{
  id v1 = [*(id *)(a1[4] + 40) setObject:a1[5] forKey:a1[6]];
  return _xpc_transaction_interrupt_clean_exit(v1);
}

void sub_10001F780(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained didInvalidateClientConnectionWithIdentifier:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void sub_10001F86C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "removing connection %@", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 40) removeObjectForKey:*(void *)(a1 + 32)];
  if (![*(id *)(*(void *)(a1 + 40) + 40) count])
  {
    dispatch_time_t v3 = dispatch_time(0, 10000000000);
    uint64_t v4 = *(void *)(a1 + 40);
    unint64_t v5 = *(NSObject **)(v4 + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F994;
    block[3] = &unk_100034BA0;
    block[4] = v4;
    dispatch_after(v3, v5, block);
  }
}

id sub_10001F994(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 40) count];
  if (!result)
  {
    return (id)_xpc_transaction_exit_clean();
  }
  return result;
}

void sub_10001FB38(id a1)
{
  qword_100041418 = (uint64_t)[objc_alloc((Class)NSRegularExpression) initWithPattern:@"[0-9,A-Z]{10}\\.(.*)" options:0 error:0];
  _objc_release_x1();
}

int main(int argc, const char **argv, const char **envp)
{
  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  uint64_t v4 = (void *)qword_100041428;
  qword_100041428 = (uint64_t)v3;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100041428, &stru_1000355E8);
  dispatch_resume((dispatch_object_t)qword_100041428);
  uint64_t v5 = CPLDiagnosticsService;
  +[CPLCTLCommand setToolName:CPLDiagnosticsService];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "starting %@", (uint8_t *)&v8, 0xCu);
  }
  int v6 = objc_alloc_init(CPLDiagnoseService);
  __darwin_ct_rune_t v7 = +[NSXPCListener serviceListener];
  [v7 setDelegate:v6];
  [v7 resume];
  exit(1);
}

void sub_10001FE98(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "exit on SIGTERM", v1, 2u);
  }
  exit(0);
}

void sub_10001FEF0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10001FF18(uint64_t a1, uint64_t a2)
{
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = a1;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Trying to get a proxy for %@ but the connection is closed", buf, 0xCu);
    }
  }
  uint64_t v5 = +[NSAssertionHandler currentHandler];
  int v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLDaemonProcessProtocol.m"];
  [v5 handleFailureInMethod:a2, a1, v6, 82, @"Trying to get a proxy for %@ but the connection is closed", a1 object file lineNumber description];

  abort();
}

void sub_100020008(void *a1, uint64_t a2, uint64_t a3)
{
  if (!_CPLSilentLogging)
  {
    int v6 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __darwin_ct_rune_t v7 = [a1 asPlist];
      *(_DWORD *)buf = 138412546;
      int v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to serialize %@: %@", buf, 0x16u);
    }
  }
  uint64_t v8 = +[NSAssertionHandler currentHandler];
  uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLEngineParameters.m"];
  id v10 = [a1 asPlist];
  [v8 handleFailureInMethod:a3, a1, v9, 141, @"Failed to serialize %@: %@", v10, a2 object file lineNumber description];

  abort();
}

void sub_100020134(uint64_t a1, uint64_t a2)
{
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = a1;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Trying to get a proxy for %@ but the connection is closed", buf, 0xCu);
    }
  }
  uint64_t v5 = +[NSAssertionHandler currentHandler];
  int v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Tools/cplctl-support/CPLPhotosDaemon.m"];
  [v5 handleFailureInMethod:a2, a1, v6, 79, @"Trying to get a proxy for %@ but the connection is closed", a1 object file lineNumber description];

  abort();
}

void sub_100020224()
{
}

void sub_100020250()
{
  __assert_rtn("-[CPLPagerOutput initWithInputFromOutput:interruptionHandler:]", "CPLOutput.m", 544, "status == 0");
}

void sub_10002027C()
{
  __assert_rtn("-[CPLPagerOutput initWithInputFromOutput:interruptionHandler:]", "CPLOutput.m", 542, "status == 0");
}

void sub_1000202A8()
{
  __assert_rtn("-[CPLPagerOutput initWithInputFromOutput:interruptionHandler:]", "CPLOutput.m", 540, "status == 0");
}

void sub_1000202D4()
{
  __assert_rtn("-[CPLPagerOutput initWithInputFromOutput:interruptionHandler:]", "CPLOutput.m", 538, "status == 0");
}

void sub_100020300()
{
  __assert_rtn("-[CPLPagerOutput initWithInputFromOutput:interruptionHandler:]", "CPLOutput.m", 522, "pipe(pipes) == 0");
}

void sub_10002032C(uint64_t a1, const char *a2)
{
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = (id)objc_opt_class();
      id v18 = NSStringFromSelector(a2);
      sub_10000FEE4((void *)&_mh_execute_header, v6, v7, "+[%@ %@] called twice", v8, v9, v10, v11, v16, v17, 2u);
    }
  }
  int v12 = +[NSAssertionHandler currentHandler];
  __int16 v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Tools/cplctl/CPLCTLCommand.m"];
  uint64_t v14 = objc_opt_class();
  unsigned int v15 = NSStringFromSelector(a2);
  [v12 handleFailureInMethod:a2, a1, v13, 58, @"+[%@ %@] called twice", v14, v15 object file lineNumber description];

  abort();
}

void sub_100020468(uint64_t a1, const char *a2)
{
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = (id)objc_opt_class();
      id v18 = NSStringFromSelector(a2);
      sub_10000FEE4((void *)&_mh_execute_header, v6, v7, "+[%@ %@] has not been set yet", v8, v9, v10, v11, v16, v17, 2u);
    }
  }
  int v12 = +[NSAssertionHandler currentHandler];
  __int16 v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Tools/cplctl/CPLCTLCommand.m"];
  uint64_t v14 = objc_opt_class();
  unsigned int v15 = NSStringFromSelector(a2);
  [v12 handleFailureInMethod:a2, a1, v13, 63, @"+[%@ %@] has not been set yet", v14, v15 object file lineNumber description];

  abort();
}

void sub_1000205A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!_CPLSilentLogging)
  {
    int v6 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = [(id)qword_1000413C0 objectForKey:a1];
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = a1;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Command %@ is already registered (for %@)", buf, 0x16u);
    }
  }
  int v8 = +[NSAssertionHandler currentHandler];
  int v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Tools/cplctl/CPLCTLCommand.m"];
  int v10 = [(id)qword_1000413C0 objectForKey:a1];
  [v8 handleFailureInMethod:a2, a3, v9, 159, @"Command %@ is already registered (for %@)", a1, v10 object file lineNumber description];

  abort();
}

void sub_1000206DC()
{
}

void sub_100020708()
{
}

void sub_100020734()
{
}

void sub_100020760()
{
}

void sub_10002078C()
{
  __assert_rtn("-[CPLCTLCommand endOutputTo:]", "CPLCTLCommand.m", 1013, "_output == output");
}

void sub_1000207B8()
{
}

void sub_1000207E4()
{
}

void sub_100020810()
{
}

void sub_10002083C()
{
}

void sub_100020868()
{
}

void sub_100020894()
{
}

void sub_1000208C0()
{
}

void sub_1000208EC()
{
}

void sub_100020918()
{
}

void sub_100020944()
{
}

void sub_100020970()
{
}

void sub_10002099C()
{
}

void sub_1000209C8()
{
}

void sub_1000209F4()
{
}

void sub_100020A10()
{
  sub_10001FF0C();
  sub_10001FEF0((void *)&_mh_execute_header, &_os_log_default, v0, "error: %@", v1, v2, v3, v4, v5);
}

void sub_100020A80()
{
  sub_10001FF0C();
  sub_10001FEF0((void *)&_mh_execute_header, &_os_log_default, v0, "connection validation error for %@", v1, v2, v3, v4, v5);
}

void sub_100020AF0()
{
  sub_10001FF0C();
  __int16 v1 = 2114;
  CFStringRef v2 = @"application-identifier";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Invalid value of \"%{public}@\" for entitlement \"%{public}@\". We expect TEAMID.BUNDLEID, and insist that TEAMID is exactly 10 characters long, consisting of [0-9][A-Z].", v0, 0x16u);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyMultiple(keysToFetch, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPLContainerIdentifierForLibraryIdentifier()
{
  return _CPLContainerIdentifierForLibraryIdentifier();
}

uint64_t CPLLibraryIdentifierForApp()
{
  return _CPLLibraryIdentifierForApp();
}

uint64_t CPLPrimaryScopeIdentifierForCurrentUniverse()
{
  return _CPLPrimaryScopeIdentifierForCurrentUniverse();
}

uint64_t CPLPrimaryScopeIdentifierForUniverseName()
{
  return _CPLPrimaryScopeIdentifierForUniverseName();
}

uint64_t CPLUniverseNameFromMainScopeIdentifier()
{
  return _CPLUniverseNameFromMainScopeIdentifier();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithDescription(AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, Timeout, TimeoutAction, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CPLOSLogSubsystem()
{
  return __CPLOSLogSubsystem();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __CPLEnvironmentDictionary()
{
  return ___CPLEnvironmentDictionary();
}

uint64_t __CPLGenericOSLogDomain()
{
  return ___CPLGenericOSLogDomain();
}

uint64_t __CPLVersion()
{
  return ___CPLVersion();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int acl_free(void *obj_p)
{
  return _acl_free(obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return _acl_get_entry(acl, entry_id, entry_p);
}

int acl_get_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return _acl_get_flag_np(flagset_d, flag);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return _acl_get_flagset_np(obj_p, flagset_p);
}

acl_t acl_get_link_np(const char *path_p, acl_type_t type)
{
  return _acl_get_link_np(path_p, type);
}

int acl_get_perm_np(acl_permset_t permset_d, acl_perm_t perm)
{
  return _acl_get_perm_np(permset_d, perm);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return _acl_get_permset(entry_d, permset_p);
}

void *__cdecl acl_get_qualifier(acl_entry_t entry_d)
{
  return _acl_get_qualifier(entry_d);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return _acl_get_tag_type(entry_d, tag_type_p);
}

uint64_t archive_entry_copy_stat()
{
  return _archive_entry_copy_stat();
}

uint64_t archive_entry_free()
{
  return _archive_entry_free();
}

uint64_t archive_entry_new()
{
  return _archive_entry_new();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_errno()
{
  return _archive_errno();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_write_add_filter_gzip()
{
  return _archive_write_add_filter_gzip();
}

uint64_t archive_write_add_filter_none()
{
  return _archive_write_add_filter_none();
}

uint64_t archive_write_data()
{
  return _archive_write_data();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

uint64_t archive_write_new()
{
  return _archive_write_new();
}

uint64_t archive_write_open_fd()
{
  return _archive_write_open_fd();
}

uint64_t archive_write_set_format_pax()
{
  return _archive_write_set_format_pax();
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return _chown(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
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

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int dprintf(int a1, const char *a2, ...)
{
  return _dprintf(a1, a2);
}

void err(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fgetc(FILE *a1)
{
  return _fgetc(a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

int fsync(int a1)
{
  return _fsync(a1);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

FTSENT *__cdecl fts_children(FTS *a1, int a2)
{
  return _fts_children(a1, a2);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open_b(char *const *a1, int a2, void *a3)
{
  return _fts_open_b(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return _fts_set(a1, a2, a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int gethostname(char *a1, size_t a2)
{
  return _gethostname(a1, a2);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

uid_t getuid(void)
{
  return _getuid();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int isatty(int a1)
{
  return _isatty(a1);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return _listxattr(path, namebuff, size, options);
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

size_t mbrtowc(__int32 *a1, const char *a2, size_t a3, mbstate_t *a4)
{
  return _mbrtowc(a1, a2, a3, a4);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return _posix_spawn_file_actions_addclose(a1, a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return _posix_spawn_file_actions_adddup2(a1, a2, a3);
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  return _posix_spawn_file_actions_addopen(a1, a2, a3, a4, a5);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_destroy(a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

int posix_spawnp(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawnp(a1, a2, a3, a4, __argv, __envp);
}

int putenv(char *a1)
{
  return _putenv(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return _readlink(a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

int seteuid(uid_t a1)
{
  return _seteuid(a1);
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return _setvbuf(a1, a2, a3, a4);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sqlite3_changes(sqlite3 *a1)
{
  return _sqlite3_changes(a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return _sqlite3_create_function_v2(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal, xDestroy);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return _sqlite3_file_control(a1, zDbName, op, a4);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_value(sqlite3_context *a1, sqlite3_value *a2)
{
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return _sqlite3_value_blob(a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return _sqlite3_value_bytes(a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return _sqlite3_value_text(a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return _sqlite3_value_type(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strftime_l(char *a1, size_t a2, const char *a3, const tm *a4, locale_t a5)
{
  return _strftime_l(a1, a2, a3, a4, a5);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void strmode(int __mode, char *__bp)
{
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

int wcwidth(__int32 a1)
{
  return _wcwidth(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__chooseLibraryInteractively(void *a1, const char *a2, ...)
{
  return [a1 _chooseLibraryInteractively];
}

id objc_msgSend__collectPhotosSearchDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 _collectPhotosSearchDiagnostics];
}

id objc_msgSend__collectUniversalSearchDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 _collectUniversalSearchDiagnostics];
}

id objc_msgSend__collectUniversalSearchFeatureAreaDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 _collectUniversalSearchFeatureAreaDiagnostics];
}

id objc_msgSend__defaultBaseURL(void *a1, const char *a2, ...)
{
  return [a1 _defaultBaseURL];
}

id objc_msgSend__destinationURL(void *a1, const char *a2, ...)
{
  return [a1 _destinationURL];
}

id objc_msgSend__fdIsInvalid(void *a1, const char *a2, ...)
{
  return [a1 _fdIsInvalid];
}

id objc_msgSend__hardwareString(void *a1, const char *a2, ...)
{
  return [a1 _hardwareString];
}

id objc_msgSend__lookForLibrary(void *a1, const char *a2, ...)
{
  return [a1 _lookForLibrary];
}

id objc_msgSend__photosSpotlightSearchAttributes(void *a1, const char *a2, ...)
{
  return [a1 _photosSpotlightSearchAttributes];
}

id objc_msgSend__printUsage(void *a1, const char *a2, ...)
{
  return [a1 _printUsage];
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return [a1 _queue];
}

id objc_msgSend__readAppPrivateData(void *a1, const char *a2, ...)
{
  return [a1 _readAppPrivateData];
}

id objc_msgSend__registerAliases(void *a1, const char *a2, ...)
{
  return [a1 _registerAliases];
}

id objc_msgSend__saveNonBuiltinAliases(void *a1, const char *a2, ...)
{
  return [a1 _saveNonBuiltinAliases];
}

id objc_msgSend__shouldUseTimeoutForLibraryOpening(void *a1, const char *a2, ...)
{
  return [a1 _shouldUseTimeoutForLibraryOpening];
}

id objc_msgSend__syndicationLibraryPath(void *a1, const char *a2, ...)
{
  return [a1 _syndicationLibraryPath];
}

id objc_msgSend__syndicationLibrarySpotlightSearchAttributes(void *a1, const char *a2, ...)
{
  return [a1 _syndicationLibrarySpotlightSearchAttributes];
}

id objc_msgSend__tempFolderURL(void *a1, const char *a2, ...)
{
  return [a1 _tempFolderURL];
}

id objc_msgSend__updateWaitDeadline(void *a1, const char *a2, ...)
{
  return [a1 _updateWaitDeadline];
}

id objc_msgSend__waitDeadline(void *a1, const char *a2, ...)
{
  return [a1 _waitDeadline];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_additionalVersionInfo(void *a1, const char *a2, ...)
{
  return [a1 additionalVersionInfo];
}

id objc_msgSend_aliasName(void *a1, const char *a2, ...)
{
  return [a1 aliasName];
}

id objc_msgSend_allCommandNames(void *a1, const char *a2, ...)
{
  return [a1 allCommandNames];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_argv(void *a1, const char *a2, ...)
{
  return [a1 argv];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asPlist(void *a1, const char *a2, ...)
{
  return [a1 asPlist];
}

id objc_msgSend_baseLibraryOptions(void *a1, const char *a2, ...)
{
  return [a1 baseLibraryOptions];
}

id objc_msgSend_baseProcessSpecification(void *a1, const char *a2, ...)
{
  return [a1 baseProcessSpecification];
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return [a1 baseURL];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cleanupEmptyFiles(void *a1, const char *a2, ...)
{
  return [a1 cleanupEmptyFiles];
}

id objc_msgSend_clientCount(void *a1, const char *a2, ...)
{
  return [a1 clientCount];
}

id objc_msgSend_clientLibraryBaseURL(void *a1, const char *a2, ...)
{
  return [a1 clientLibraryBaseURL];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_closeArchive(void *a1, const char *a2, ...)
{
  return [a1 closeArchive];
}

id objc_msgSend_closeOutput(void *a1, const char *a2, ...)
{
  return [a1 closeOutput];
}

id objc_msgSend_cloudLibraryResourceStorageURL(void *a1, const char *a2, ...)
{
  return [a1 cloudLibraryResourceStorageURL];
}

id objc_msgSend_cloudLibraryStateStorageURL(void *a1, const char *a2, ...)
{
  return [a1 cloudLibraryStateStorageURL];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectAccountStatus(void *a1, const char *a2, ...)
{
  return [a1 collectAccountStatus];
}

id objc_msgSend_collectAppLibraryIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 collectAppLibraryIdentifiers];
}

id objc_msgSend_collectCloudPhotodGlobalStatus(void *a1, const char *a2, ...)
{
  return [a1 collectCloudPhotodGlobalStatus];
}

id objc_msgSend_collectDiagnosticLogs(void *a1, const char *a2, ...)
{
  return [a1 collectDiagnosticLogs];
}

id objc_msgSend_collectDuetInfo(void *a1, const char *a2, ...)
{
  return [a1 collectDuetInfo];
}

id objc_msgSend_collectFeatureAreaDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 collectFeatureAreaDiagnostics];
}

id objc_msgSend_collectFiles(void *a1, const char *a2, ...)
{
  return [a1 collectFiles];
}

id objc_msgSend_collectLOFetchRecordings(void *a1, const char *a2, ...)
{
  return [a1 collectLOFetchRecordings];
}

id objc_msgSend_collectLocalLibraryMetadataInfo(void *a1, const char *a2, ...)
{
  return [a1 collectLocalLibraryMetadataInfo];
}

id objc_msgSend_collectMemoryCreationDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 collectMemoryCreationDiagnostics];
}

id objc_msgSend_collectPreferences(void *a1, const char *a2, ...)
{
  return [a1 collectPreferences];
}

id objc_msgSend_collectSearchDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 collectSearchDiagnostics];
}

id objc_msgSend_collectSilentMover(void *a1, const char *a2, ...)
{
  return [a1 collectSilentMover];
}

id objc_msgSend_collectStoryDiagnosticsFiles(void *a1, const char *a2, ...)
{
  return [a1 collectStoryDiagnosticsFiles];
}

id objc_msgSend_collectTaskInfo(void *a1, const char *a2, ...)
{
  return [a1 collectTaskInfo];
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return [a1 command];
}

id objc_msgSend_commandName(void *a1, const char *a2, ...)
{
  return [a1 commandName];
}

id objc_msgSend_commandVersion(void *a1, const char *a2, ...)
{
  return [a1 commandVersion];
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 containerIdentifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cplDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 cplDirectoryURL];
}

id objc_msgSend_cplSafeErrorForXPC(void *a1, const char *a2, ...)
{
  return [a1 cplSafeErrorForXPC];
}

id objc_msgSend_createBaseFolderAndLogFile(void *a1, const char *a2, ...)
{
  return [a1 createBaseFolderAndLogFile];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentPrivateEngine(void *a1, const char *a2, ...)
{
  return [a1 currentPrivateEngine];
}

id objc_msgSend_currentStepIndex(void *a1, const char *a2, ...)
{
  return [a1 currentStepIndex];
}

id objc_msgSend_cursorGotoLineStart(void *a1, const char *a2, ...)
{
  return [a1 cursorGotoLineStart];
}

id objc_msgSend_daemonConnection(void *a1, const char *a2, ...)
{
  return [a1 daemonConnection];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultLibraryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 defaultLibraryIdentifier];
}

id objc_msgSend_defaultLibraryURL(void *a1, const char *a2, ...)
{
  return [a1 defaultLibraryURL];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSupportedLibraryIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 defaultSupportedLibraryIdentifiers];
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeZone];
}

id objc_msgSend_defaultsDomain(void *a1, const char *a2, ...)
{
  return [a1 defaultsDomain];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_determineLibraryPaths(void *a1, const char *a2, ...)
{
  return [a1 determineLibraryPaths];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayConsent(void *a1, const char *a2, ...)
{
  return [a1 displayConsent];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_endLine(void *a1, const char *a2, ...)
{
  return [a1 endLine];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_exec(void *a1, const char *a2, ...)
{
  return [a1 exec];
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return [a1 execute];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileHandleForReading(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForReading];
}

id objc_msgSend_fileHandleForWriting(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForWriting];
}

id objc_msgSend_fileOwnerAccountID(void *a1, const char *a2, ...)
{
  return [a1 fileOwnerAccountID];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_forgetRemainingSpace(void *a1, const char *a2, ...)
{
  return [a1 forgetRemainingSpace];
}

id objc_msgSend_help(void *a1, const char *a2, ...)
{
  return [a1 help];
}

id objc_msgSend_includeSPL(void *a1, const char *a2, ...)
{
  return [a1 includeSPL];
}

id objc_msgSend_includeSyndication(void *a1, const char *a2, ...)
{
  return [a1 includeSyndication];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalTestOptions(void *a1, const char *a2, ...)
{
  return [a1 internalTestOptions];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isATTY(void *a1, const char *a2, ...)
{
  return [a1 isATTY];
}

id objc_msgSend_isAppleInternal(void *a1, const char *a2, ...)
{
  return [a1 isAppleInternal];
}

id objc_msgSend_isOpened(void *a1, const char *a2, ...)
{
  return [a1 isOpened];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_libraryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 libraryIdentifier];
}

id objc_msgSend_libraryManager(void *a1, const char *a2, ...)
{
  return [a1 libraryManager];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_logOutput(void *a1, const char *a2, ...)
{
  return [a1 logOutput];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainScopeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 mainScopeIdentifier];
}

id objc_msgSend_momentShare(void *a1, const char *a2, ...)
{
  return [a1 momentShare];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_numberOfRanges(void *a1, const char *a2, ...)
{
  return [a1 numberOfRanges];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_openError(void *a1, const char *a2, ...)
{
  return [a1 openError];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pattern(void *a1, const char *a2, ...)
{
  return [a1 pattern];
}

id objc_msgSend_photosDaemonConnection(void *a1, const char *a2, ...)
{
  return [a1 photosDaemonConnection];
}

id objc_msgSend_prepareOutputURLs(void *a1, const char *a2, ...)
{
  return [a1 prepareOutputURLs];
}

id objc_msgSend_previewData(void *a1, const char *a2, ...)
{
  return [a1 previewData];
}

id objc_msgSend_printHeader(void *a1, const char *a2, ...)
{
  return [a1 printHeader];
}

id objc_msgSend_privateEngine(void *a1, const char *a2, ...)
{
  return [a1 privateEngine];
}

id objc_msgSend_privateEngineAliasPathEnvKey(void *a1, const char *a2, ...)
{
  return [a1 privateEngineAliasPathEnvKey];
}

id objc_msgSend_privateEnginePathEnvKey(void *a1, const char *a2, ...)
{
  return [a1 privateEnginePathEnvKey];
}

id objc_msgSend_priviledgedProcessSpecification(void *a1, const char *a2, ...)
{
  return [a1 priviledgedProcessSpecification];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processes(void *a1, const char *a2, ...)
{
  return [a1 processes];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_redirectStderrToFileAtPath(void *a1, const char *a2, ...)
{
  return [a1 redirectStderrToFileAtPath];
}

id objc_msgSend_redirectStderrToFileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 redirectStderrToFileDescriptor];
}

id objc_msgSend_redirectStdoutToFileAtPath(void *a1, const char *a2, ...)
{
  return [a1 redirectStdoutToFileAtPath];
}

id objc_msgSend_redirectStdoutToFileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 redirectStdoutToFileDescriptor];
}

id objc_msgSend_register(void *a1, const char *a2, ...)
{
  return [a1 register];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_requiresRoot(void *a1, const char *a2, ...)
{
  return [a1 requiresRoot];
}

id objc_msgSend_resetColorsAndAttributes(void *a1, const char *a2, ...)
{
  return [a1 resetColorsAndAttributes];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sampleProcesses(void *a1, const char *a2, ...)
{
  return [a1 sampleProcesses];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_shareURL(void *a1, const char *a2, ...)
{
  return [a1 shareURL];
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return [a1 shortDescription];
}

id objc_msgSend_shouldRunMemoryTools(void *a1, const char *a2, ...)
{
  return [a1 shouldRunMemoryTools];
}

id objc_msgSend_shouldRunTaskInfo(void *a1, const char *a2, ...)
{
  return [a1 shouldRunTaskInfo];
}

id objc_msgSend_shouldSample(void *a1, const char *a2, ...)
{
  return [a1 shouldSample];
}

id objc_msgSend_shouldSignal(void *a1, const char *a2, ...)
{
  return [a1 shouldSignal];
}

id objc_msgSend_signalProcessSpecification(void *a1, const char *a2, ...)
{
  return [a1 signalProcessSpecification];
}

id objc_msgSend_signalProcesses(void *a1, const char *a2, ...)
{
  return [a1 signalProcesses];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startDiagnostic(void *a1, const char *a2, ...)
{
  return [a1 startDiagnostic];
}

id objc_msgSend_stdinPipe(void *a1, const char *a2, ...)
{
  return [a1 stdinPipe];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_storeCommand(void *a1, const char *a2, ...)
{
  return [a1 storeCommand];
}

id objc_msgSend_stringByAbbreviatingWithTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByAbbreviatingWithTildeInPath];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_supportedFeatureAreas(void *a1, const char *a2, ...)
{
  return [a1 supportedFeatureAreas];
}

id objc_msgSend_supportsEscapeSequences(void *a1, const char *a2, ...)
{
  return [a1 supportsEscapeSequences];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_tempFolderURL(void *a1, const char *a2, ...)
{
  return [a1 tempFolderURL];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_toolName(void *a1, const char *a2, ...)
{
  return [a1 toolName];
}

id objc_msgSend_unknownError(void *a1, const char *a2, ...)
{
  return [a1 unknownError];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_userDescription(void *a1, const char *a2, ...)
{
  return [a1 userDescription];
}

id objc_msgSend_usesColor(void *a1, const char *a2, ...)
{
  return [a1 usesColor];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_waitForAllLongTasksToFinish(void *a1, const char *a2, ...)
{
  return [a1 waitForAllLongTasksToFinish];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}