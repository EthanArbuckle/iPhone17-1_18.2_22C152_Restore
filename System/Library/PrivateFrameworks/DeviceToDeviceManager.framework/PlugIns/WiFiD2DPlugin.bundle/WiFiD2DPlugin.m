uint64_t sub_355C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  void *v8;
  void v10[7];
  int v11;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_39C8;
  v10[3] = &unk_40E0;
  v10[4] = a1;
  v10[5] = a2;
  v11 = 2;
  v10[6] = a3;
  v7 = [objc_alloc((Class)WiFiP2PDNSServiceDiscoveryManager) initUsingWiFiAware:0 serviceCallback:v10];
  v8 = (void *)qword_8088;
  qword_8088 = (uint64_t)v7;

  return 0;
}

uint64_t sub_3650()
{
  v1 = (void *)qword_8088;
  qword_8088 = 0;

  return 0;
}

uint64_t sub_3690(uint64_t a1, uint64_t a2)
{
  v5 = (void *)qword_8088;
  id v6 = [objc_alloc((Class)AWDLServiceDiscoveryConfiguration) initWithKey:a1 value:a2 resolve:0];
  [v5 startServiceDiscoveryWithConfiguration:v6];

  return 0;
}

void sub_3708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_3718(uint64_t a1, uint64_t a2)
{
  v5 = (void *)qword_8088;
  id v6 = [objc_alloc((Class)AWDLServiceDiscoveryConfiguration) initWithKey:a1 value:a2 resolve:0];
  [v5 stopServiceDiscoveryWithConfiguration:v6];

  return 0;
}

void sub_3790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_37A0(uint64_t a1)
{
  v3 = (void *)qword_8088;
  id v4 = [objc_alloc((Class)AWDLServiceDiscoveryConfiguration) initWithKey:a1];
  [v3 startServiceDiscoveryWithConfiguration:v4];

  return 0;
}

void sub_380C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_381C(uint64_t a1)
{
  v3 = (void *)qword_8088;
  id v4 = [objc_alloc((Class)AWDLServiceDiscoveryConfiguration) initWithKey:a1];
  [v3 stopServiceDiscoveryWithConfiguration:v4];

  return 0;
}

void sub_3888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3898(uint64_t a1, uint64_t a2)
{
  v5 = (void *)qword_8088;
  id v6 = [objc_alloc((Class)AWDLServiceDiscoveryConfiguration) initWithKey:a1 value:a2 resolve:1];
  [v5 startServiceDiscoveryWithConfiguration:v6];
}

void sub_3918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3928(uint64_t a1, uint64_t a2)
{
  v5 = (void *)qword_8088;
  id v6 = [objc_alloc((Class)AWDLServiceDiscoveryConfiguration) initWithKey:a1 value:a2 resolve:1];
  [v5 stopServiceDiscoveryWithConfiguration:v6];
}

void sub_39A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_39B8()
{
  return 0;
}

uint64_t sub_39C0()
{
  return 0;
}

void sub_39C8(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3B34;
  block[3] = &unk_40C0;
  v11 = *(__CFRunLoop **)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  int v20 = a2;
  int v21 = a3;
  int v22 = *(_DWORD *)(a1 + 56);
  id v12 = v9;
  id v16 = v12;
  id v13 = v10;
  uint64_t v14 = *(void *)(a1 + 48);
  id v17 = v13;
  uint64_t v19 = v14;
  CFRunLoopPerformBlock(v11, kCFRunLoopDefaultMode, block);
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 32));
}

void sub_3B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t sub_3B34(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, id, id, id, id, void))(a1 + 48))(*(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68), 0, *(unsigned int *)(a1 + 72), [*(id *)(a1 + 32) bytes], objc_msgSend(*(id *)(a1 + 32), "length"), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), *(void *)(a1 + 56));
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_stopServiceDiscoveryWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopServiceDiscoveryWithConfiguration:");
}