uint64_t sub_100001CC4(uint64_t a1, mach_port_name_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, uint64_t a7)
{
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void v26[7];
  int v27;

  v14 = qword_100008048;
  if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
    sub_100003004(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  v22 = fileport_makefd();
  mach_port_deallocate(mach_task_self_, a2);
  if ((v22 & 0x80000000) != 0)
  {
    *a5 = 9;
  }
  else
  {
    v23 = +[DoubleAgentManager defaultManager];
    v24 = +[NSString stringWithUTF8String:a4];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100001E48;
    v26[3] = &unk_1000041C8;
    v26[4] = a6;
    v26[5] = a7;
    v26[6] = a5;
    v27 = v22;
    [v23 lookupXattrIn:v22 fileSize:a3 named:v24 reply:v26];
  }
  if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
    sub_100002F90();
  }
  return 0;
}

uint64_t sub_100001E48(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    a3 = 0;
  }
  v5 = *(void **)(a1 + 40);
  **(void **)(a1 + 32) = a3;
  if (a2) {
    a4 = 0;
  }
  void *v5 = a4;
  **(_DWORD **)(a1 + 48) = a2;
  return close(*(_DWORD *)(a1 + 56));
}

uint64_t sub_100001E70(uint64_t a1, mach_port_name_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7, uint64_t a8)
{
  v16 = qword_100008048;
  if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
    sub_1000030F0(v16, v17, v18, v19, v20, v21, v22, v23);
  }
  uint64_t v24 = fileport_makefd();
  mach_port_deallocate(mach_task_self_, a2);
  if ((v24 & 0x80000000) != 0)
  {
    *a7 = 9;
  }
  else
  {
    v25 = +[DoubleAgentManager defaultManager];
    v26 = +[NSString stringWithUTF8String:a4];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100001FFC;
    v28[3] = &unk_1000041E8;
    v28[4] = a8;
    v28[5] = a7;
    int v29 = v24;
    [v25 allocateXattrIn:v24 fileSize:a3 named:v26 sized:a5 how:a6 reply:v28];
  }
  if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
    sub_10000307C();
  }
  return 0;
}

uint64_t sub_100001FFC(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    a3 = 0;
  }
  v4 = *(_DWORD **)(a1 + 40);
  **(void **)(a1 + 32) = a3;
  _DWORD *v4 = a2;
  return close(*(_DWORD *)(a1 + 48));
}

uint64_t sub_100002018(uint64_t a1, mach_port_name_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  v10 = qword_100008048;
  if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
    sub_1000031DC(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  uint64_t v18 = fileport_makefd();
  mach_port_deallocate(mach_task_self_, a2);
  if ((v18 & 0x80000000) != 0)
  {
    *a4 = 9;
  }
  else
  {
    uint64_t v19 = +[DoubleAgentManager defaultManager];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100002164;
    v21[3] = &unk_100004208;
    v21[4] = a4;
    v21[5] = a5;
    int v22 = v18;
    [v19 listXattrsIn:v18 fileSize:a3 reply:v21];
  }
  if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
    sub_100003168();
  }
  return 0;
}

uint64_t sub_100002164(uint64_t a1, int a2, id a3)
{
  **(_DWORD **)(a1 + 32) = a2;
  if (!a2) {
    memcpy(*(void **)(a1 + 40), [a3 bytes], 0x8868uLL);
  }
  int v4 = *(_DWORD *)(a1 + 48);
  return close(v4);
}

uint64_t sub_1000021C4(uint64_t a1, mach_port_name_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6)
{
  uint64_t v12 = qword_100008048;
  if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
    sub_1000032C8(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  uint64_t v20 = fileport_makefd();
  mach_port_deallocate(mach_task_self_, a2);
  if ((v20 & 0x80000000) != 0)
  {
    *a5 = 9;
  }
  else
  {
    uint64_t v21 = +[DoubleAgentManager defaultManager];
    int v22 = +[NSString stringWithUTF8String:a4];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100002338;
    v24[3] = &unk_100004228;
    v24[4] = a6;
    v24[5] = a5;
    int v25 = v20;
    [v21 removeXattrOf:v20 fileSize:a3 named:v22 reply:v24];
  }
  if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
    sub_100003254();
  }
  return 0;
}

uint64_t sub_100002338(uint64_t a1, int a2, int a3)
{
  if (a2) {
    int v3 = 0;
  }
  else {
    int v3 = a3;
  }
  int v4 = *(_DWORD **)(a1 + 40);
  **(_DWORD **)(a1 + 32) = v3;
  _DWORD *v4 = a2;
  return close(*(_DWORD *)(a1 + 48));
}

void start()
{
  kern_return_t v2;
  dispatch_queue_t v3;
  NSObject *v4;
  const char *v5;
  kern_return_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t f;
  void *v11;
  NSObject *v12;
  uint64_t i;
  dispatch_queue_t v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  kern_return_t v22;

  os_log_t v0 = os_log_create("com.apple.DoubleAgent", "main");
  v1 = (void *)qword_100008048;
  qword_100008048 = (uint64_t)v0;

  v2 = bootstrap_check_in(bootstrap_port, "com.apple.doubleagentd", (mach_port_t *)&dword_100008050);
  if (v2)
  {
    v6 = v2;
    v7 = (void *)qword_100008048;
    if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      *(_DWORD *)buf = 136315650;
      uint64_t v18 = "com.apple.doubleagentd";
      uint64_t v19 = 2080;
      uint64_t v20 = bootstrap_strerror(v6);
      uint64_t v21 = 1024;
      int v22 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Could not get receive right for %s: %s (%d)\n", buf, 0x1Cu);
    }
LABEL_12:
    exit(1);
  }
  int v3 = dispatch_queue_create("com.apple.doubleagentd.kernel_upcall_queue", 0);
  if (v3)
  {
    v9 = v3;
    f = dispatch_mach_create_f();
    uint64_t v11 = (void *)qword_100008058;
    qword_100008058 = f;

    dispatch_set_qos_class_fallback();
    uint64_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v9);
    dispatch_source_set_event_handler_f(v12, (dispatch_function_t)sub_100002808);
    dispatch_activate(v12);
    qword_100008040 = (uint64_t)malloc_type_calloc(0x10uLL, 8uLL, 0x80040B8603338uLL);
    if (qword_100008040)
    {
      for (i = 0; i != 16; ++i)
      {
        snprintf((char *)buf, 0x1DuLL, "%s%d", "com.apple.doubleagentd.wq_", i);
        uint64_t v14 = dispatch_queue_create((const char *)buf, 0);
        uint64_t v15 = *(void **)(qword_100008040 + 8 * i);
        *(void *)(qword_100008040 + 8 * i) = v14;
      }
      dispatch_mach_connect();
      uint64_t v16 = qword_100008048;
      if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = 16;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "ready:%d", buf, 8u);
      }
      dispatch_main();
    }
    int v4 = doubleagent_std_log();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "main";
    v5 = "%s: Failed to allocate work queues array.";
  }
  else
  {
    int v4 = doubleagent_std_log();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "main";
    v5 = "%s: Failed to create main queue.";
  }
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, v5, buf, 0xCu);
  goto LABEL_11;
}

void sub_100002650(uint64_t a1, uint64_t a2, void *a3)
{
  kern_return_t v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  void block[4];
  id v22;
  uint64_t v23;
  uint64_t v24;

  id v5 = a3;
  v6 = qword_100008048;
  if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
    sub_100003518(a2, v6, v7, v8, v9, v10, v11, v12);
  }
  if (a2 == 8)
  {
    uint64_t v13 = mach_port_mod_refs(mach_task_self_, dword_100008050, 1u, -1);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = qword_100008048;
      if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_ERROR)) {
        sub_100003384(v14, v15);
      }
    }
    uint64_t v16 = qword_100008048;
    if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
      sub_100003340(v16);
    }
  }
  else
  {
    uint64_t v17 = qword_100008048;
    if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
      sub_100003494(v17);
    }
    uint64_t v18 = *(NSObject **)(qword_100008040 + 8 * dword_100008060);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002814;
    block[3] = &unk_100004250;
    uint64_t v23 = a2;
    uint64_t v24 = a1;
    int v22 = v5;
    dispatch_async(v18, block);
    uint64_t v19 = (dword_100008060 + 1) & 0xF;
    if (dword_100008060 + 1 <= 0) {
      uint64_t v19 = -(-(dword_100008060 + 1) & 0xF);
    }
    dword_100008060 = v19;
    uint64_t v20 = qword_100008048;
    if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
      sub_100003410(v20);
    }
  }
}

uint64_t sub_100002808()
{
  return _dispatch_mach_cancel(qword_100008058);
}

void sub_100002814(uint64_t a1)
{
  label = dispatch_queue_get_label(0);
  if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
    sub_1000036E4();
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == 1) {
    goto LABEL_11;
  }
  if (v3 != 2)
  {
    if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_ERROR)) {
      sub_1000035F0();
    }
LABEL_11:
    int v4 = 0;
    goto LABEL_12;
  }
  int v4 = (void *)os_transaction_create();
  if ((dispatch_mach_mig_demux() & 1) == 0)
  {
    id v5 = qword_100008048;
    if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_ERROR)) {
      sub_10000366C((uint64_t)label, v5);
    }
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
    mach_msg_destroy(msg);
  }
LABEL_12:
  uint64_t v7 = qword_100008048;
  if (os_log_type_enabled((os_log_t)qword_100008048, OS_LOG_TYPE_DEBUG)) {
    sub_100003584((uint64_t)label, v7, v8, v9, v10, v11, v12, v13);
  }
}

void sub_10000294C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000297C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_1000029B0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t sub_1000029BC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 6304) >= 0xFFFFFFFC) {
    return (uint64_t)*(&off_100004270 + 5 * (v1 - 6300) + 5);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000029F8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v5 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v6 = *(unsigned int *)(result + 4);
  if (v6 < 0x40 || v6 > 0xC0) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v7 = *(_DWORD *)(result + 60);
  int v3 = -304;
  if (v7 > 0x80 || (int)v6 - 64 < v7) {
    goto LABEL_3;
  }
  if (v6 != ((v7 + 3) & 0xFFFFFFFC) + 64 || (result = (uint64_t)memchr((void *)(result + 64), 0, v6 - 64)) == 0)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_4;
  }
  uint64_t v8 = (_DWORD *)(((v6 + 3) & 0x1FFFFFFFCLL) + v5);
  if (*v8 || v8[1] <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  result = sub_100001CC4(*(unsigned int *)(v5 + 12), *(_DWORD *)(v5 + 28), *(void *)(v5 + 48), v5 + 64, (_DWORD *)(a2 + 36), a2 + 40, a2 + 48);
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 56;
    return result;
  }
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

uint64_t sub_100002B4C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v5 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v6 = *(unsigned int *)(result + 4);
  if (v6 < 0x4C || v6 > 0xCC) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v7 = *(_DWORD *)(result + 60);
  if (v7 > 0x80) {
    goto LABEL_2;
  }
  int v3 = -304;
  if ((int)v6 - 76 < v7) {
    goto LABEL_3;
  }
  unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
  if (v6 != v8 + 76) {
    goto LABEL_3;
  }
  uint64_t v9 = 192;
  if (*(unsigned int *)(result + 4) < 0xC0uLL) {
    uint64_t v9 = *(unsigned int *)(result + 4);
  }
  result = (uint64_t)memchr((void *)(result + 64), 0, v9 - 64);
  if (!result)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_4;
  }
  uint64_t v10 = (_DWORD *)(((v6 + 3) & 0x1FFFFFFFCLL) + v5);
  if (*v10 || v10[1] <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  result = sub_100001E70(*(unsigned int *)(v5 + 12), *(_DWORD *)(v5 + 28), *(void *)(v5 + 48), v5 + 64, *(void *)(v5 + v8 + 64), *(unsigned int *)(v5 + v8 + 72), (_DWORD *)(a2 + 36), a2 + 40);
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 48;
    return result;
  }
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

uint64_t sub_100002CC4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_9;
  }
  if (*(_DWORD *)(result + 56) || *(_DWORD *)(result + 60) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }
  result = sub_100002018(*(unsigned int *)(result + 12), *(_DWORD *)(result + 28), *(void *)(result + 48), (_DWORD *)(a2 + 36), a2 + 40);
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 34960;
    return result;
  }
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

uint64_t sub_100002DAC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v5 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v6 = *(unsigned int *)(result + 4);
  if (v6 < 0x40 || v6 > 0xC0) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v7 = *(_DWORD *)(result + 60);
  int v3 = -304;
  if (v7 > 0x80 || (int)v6 - 64 < v7) {
    goto LABEL_3;
  }
  if (v6 != ((v7 + 3) & 0xFFFFFFFC) + 64 || (result = (uint64_t)memchr((void *)(result + 64), 0, v6 - 64)) == 0)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_4;
  }
  unsigned int v8 = (_DWORD *)(((v6 + 3) & 0x1FFFFFFFCLL) + v5);
  if (*v8 || v8[1] <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  result = sub_1000021C4(*(unsigned int *)(v5 + 12), *(_DWORD *)(v5 + 28), *(void *)(v5 + 48), v5 + 64, (_DWORD *)(a2 + 36), a2 + 40);
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

uint64_t sub_100002EFC(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 6304) >= 0xFFFFFFFC
    && (uint64_t v5 = (void (*)(void))*(&off_100004270 + 5 * (v4 - 6300) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_100002F90()
{
  sub_1000029B0(__stack_chk_guard);
  sub_100002968();
  sub_10000297C((void *)&_mh_execute_header, v0, v1, "%s:finish:%d", v2, v3, v4, v5, 2u);
}

void sub_100003004(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000307C()
{
  sub_1000029B0(__stack_chk_guard);
  sub_100002968();
  sub_10000297C((void *)&_mh_execute_header, v0, v1, "%s:finish:%d", v2, v3, v4, v5, 2u);
}

void sub_1000030F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003168()
{
  sub_1000029B0(__stack_chk_guard);
  sub_100002968();
  sub_10000297C((void *)&_mh_execute_header, v0, v1, "%s:finish:%d", v2, v3, v4, v5, 2u);
}

void sub_1000031DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003254()
{
  sub_1000029B0(__stack_chk_guard);
  sub_100002968();
  sub_10000297C((void *)&_mh_execute_header, v0, v1, "%s:finish:%d", v2, v3, v4, v5, 2u);
}

void sub_1000032C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003340(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "kernel:upcall:canceled", v1, 2u);
}

void sub_100003384(int a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "mach_channel_handler";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: mach_port_mod_refs failed (%d)\n", (uint8_t *)&v2, 0x12u);
}

void sub_100003410(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = dword_100008060;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "kernel:upcall:finish:%d", (uint8_t *)v1, 8u);
}

void sub_100003494(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = dword_100008060;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "kernel:upcall:dispatching:worker:%d", (uint8_t *)v1, 8u);
}

void sub_100003518(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003584(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000035F0()
{
  sub_100002998();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "worker:%s:unsupported:message:%lu.", v1, 0x16u);
}

void sub_10000366C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "worker:%s:demux:fail", (uint8_t *)&v2, 0xCu);
}

void sub_1000036E4()
{
  sub_100002998();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "worker:%s:message:%lu:start", v1, 0x16u);
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

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return _bootstrap_strerror(r);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dispatch_mach_connect()
{
  return _dispatch_mach_connect();
}

uint64_t dispatch_mach_create_f()
{
  return _dispatch_mach_create_f();
}

uint64_t dispatch_mach_mig_demux()
{
  return _dispatch_mach_mig_demux();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return _dispatch_mach_msg_get_msg();
}

void dispatch_main(void)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

uint64_t doubleagent_std_log()
{
  return _doubleagent_std_log();
}

void exit(int a1)
{
}

uint64_t fileport_makefd()
{
  return _fileport_makefd();
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
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

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}