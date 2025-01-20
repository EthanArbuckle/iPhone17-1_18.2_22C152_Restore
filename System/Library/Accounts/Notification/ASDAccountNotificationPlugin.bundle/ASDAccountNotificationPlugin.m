uint64_t sub_180C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v5;

  *(void *)(v5 + 184) = a5;
  *(_DWORD *)(v5 + 224) = a4;
  return _swift_task_switch(sub_1830, 0, 0);
}

uint64_t sub_1830()
{
  int v1 = *(_DWORD *)(v0 + 224);
  if (v1 == 3)
  {
    uint64_t v2 = v0 + 16;
    id v5 = [objc_allocWithZone((Class)ODNServices) init];
    *(void *)(v0 + 208) = v5;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_1BA8;
    uint64_t v6 = swift_continuation_init();
    *(void *)(v0 + 144) = _NSConcreteStackBlock;
    *(void *)(v0 + 152) = 0x40000000;
    *(void *)(v0 + 160) = sub_1EF8;
    *(void *)(v0 + 168) = &unk_184C8;
    *(void *)(v0 + 176) = v6;
    [v5 unregisterICloudLoginWithCompletion:v0 + 144];
    goto LABEL_5;
  }
  if (v1 == 1)
  {
    uint64_t v2 = v0 + 80;
    id v3 = [objc_allocWithZone((Class)ODNServices) init];
    *(void *)(v0 + 192) = v3;
    *(void *)(v0 + 80) = v0;
    *(void *)(v0 + 88) = sub_1A38;
    uint64_t v4 = swift_continuation_init();
    *(void *)(v0 + 144) = _NSConcreteStackBlock;
    *(void *)(v0 + 152) = 0x40000000;
    *(void *)(v0 + 160) = sub_1EF8;
    *(void *)(v0 + 168) = &unk_184E0;
    *(void *)(v0 + 176) = v4;
    [v3 registerICloudLoginWithCompletion:v0 + 144];
LABEL_5:
    return _swift_continuation_await(v2);
  }
  v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_1A38()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    uint64_t v2 = sub_1D18;
  }
  else {
    uint64_t v2 = sub_1B48;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1B48()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1BA8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 216) = v1;
  if (v1) {
    uint64_t v2 = sub_1E08;
  }
  else {
    uint64_t v2 = sub_1CB8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1CB8()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1D18()
{
  swift_willThrow();

  uint64_t v1 = sub_12550();
  os_log_type_t v2 = sub_125C0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "Error updating login state", v3, 2u);
    swift_slowDealloc();
  }
  swift_errorRelease();

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1E08()
{
  swift_willThrow();

  uint64_t v1 = sub_12550();
  os_log_type_t v2 = sub_125C0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "Error updating login state", v3, 2u);
    swift_slowDealloc();
  }
  swift_errorRelease();

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1EF8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_26DC(&qword_1D970);
    uint64_t v4 = swift_allocError();
    *id v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t sub_1F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_125A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_12590();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_29CC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_12580();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_2194()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PDSNotificationPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PDSNotificationPlugin()
{
  return self;
}

BOOL sub_21EC(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_2200@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_2210(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_221C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_22F8;
  return v6(a1);
}

uint64_t sub_22F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_23F0(int a1)
{
  sub_26DC(&qword_1D948);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_12570();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)v19 - v9;
  sub_12560();
  v11 = sub_12550();
  os_log_type_t v12 = sub_125B0();
  if (os_log_type_enabled(v11, v12))
  {
    int v13 = a1;
    v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v14 = 67109120;
    v19[3] = v13;
    sub_125D0();
    _os_log_impl(&dword_0, v11, v12, "account update triggered with type: %u", v14, 8u);
    a1 = v13;
    swift_slowDealloc();
  }

  uint64_t v15 = sub_125A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v3, 1, 1, v15);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  unint64_t v16 = (*(unsigned __int8 *)(v5 + 80) + 36) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  *(_DWORD *)(v17 + 32) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v17 + v16, v8, v4);
  sub_1F90((uint64_t)v3, (uint64_t)&unk_1D958, v17);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return 0;
}

uint64_t sub_26DC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2720()
{
  uint64_t v1 = sub_12570();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 36) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_27EC()
{
  uint64_t v2 = *(void *)(sub_12570() - 8);
  int v3 = *(_DWORD *)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 36) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_28D8;
  *(void *)(v5 + 184) = v4;
  *(_DWORD *)(v5 + 224) = v3;
  return _swift_task_switch(sub_1830, 0, 0);
}

uint64_t sub_28D8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_29CC(uint64_t a1)
{
  uint64_t v2 = sub_26DC(&qword_1D948);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2A2C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2A64(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_28D8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1D960 + dword_1D960);
  return v6(a1, v4);
}

void type metadata accessor for ACAccountChangeType()
{
  if (!qword_1D978)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1D978);
    }
  }
}

void sub_3384(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = a2;
  id v10 = a3;
  v11 = v10;
  if (v10 && v9 && !a6)
  {
    v26 = 0;
    v27 = 0;
    id v12 = v10;
    sub_7560((uint64_t)[v12 bytes], (uint64_t)objc_msgSend(v12, "length"), (uint64_t)&v27);
    if (v13)
    {
      int v14 = v13;
      free(v27);
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = +[NSString stringWithUTF8String:kCoreASErrorDomainCADecrypt];
      uint64_t v17 = +[NSError errorWithDomain:v16 code:v14 userInfo:0];
      (*(void (**)(uint64_t, void, void, uint64_t, void *))(v15 + 16))(v15, 0, 0, 0xFFFFFFFFLL, v17);
    }
    else
    {
      id v18 = objc_alloc((Class)NSData);
      id v16 = objc_msgSend(v18, "initWithBytes:length:", v27, objc_msgSend(v12, "length"));
      free(v27);
      id v19 = v9;
      sub_7560((uint64_t)[v19 bytes], (uint64_t)objc_msgSend(v19, "length"), (uint64_t)&v26);
      if (!v20)
      {
        id v24 = objc_alloc((Class)NSData);
        id v25 = objc_msgSend(v24, "initWithBytes:length:", v26, objc_msgSend(v19, "length"));
        free(v26);
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

        goto LABEL_10;
      }
      int v21 = v20;
      free(v26);
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v17 = +[NSString stringWithUTF8String:kCoreASErrorDomainCADecrypt];
      v23 = +[NSError errorWithDomain:v17 code:v21 userInfo:0];
      (*(void (**)(uint64_t, void, void, uint64_t, void *))(v22 + 16))(v22, 0, 0, 0xFFFFFFFFLL, v23);
    }
LABEL_10:

    goto LABEL_11;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_11:
}

uint64_t sub_36D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_39BC(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = a2;
  id v10 = a3;
  v11 = v10;
  if (!a6)
  {
    v26 = 0;
    v27 = 0;
    id v12 = v10;
    sub_7560((uint64_t)[v12 bytes], (uint64_t)objc_msgSend(v12, "length"), (uint64_t)&v27);
    if (v13)
    {
      int v14 = v13;
      free(v27);
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = +[NSString stringWithUTF8String:kCoreASErrorDomainCADecrypt];
      uint64_t v17 = +[NSError errorWithDomain:v16 code:v14 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, uint64_t, void *))(v15 + 16))(v15, 0, 0, 0, 0xFFFFFFFFLL, v17);
    }
    else
    {
      id v18 = objc_alloc((Class)NSData);
      id v16 = objc_msgSend(v18, "initWithBytes:length:", v27, objc_msgSend(v12, "length"));
      free(v27);
      id v19 = v9;
      sub_7560((uint64_t)[v19 bytes], (uint64_t)objc_msgSend(v19, "length"), (uint64_t)&v26);
      if (!v20)
      {
        id v24 = objc_alloc((Class)NSData);
        id v25 = objc_msgSend(v24, "initWithBytes:length:", v26, objc_msgSend(v19, "length"));
        free(v26);
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

        goto LABEL_8;
      }
      int v21 = v20;
      free(v26);
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v17 = +[NSString stringWithUTF8String:kCoreASErrorDomainCADecrypt];
      v23 = +[NSError errorWithDomain:v17 code:v21 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, uint64_t, void *))(v22 + 16))(v22, 0, 0, 0, 0xFFFFFFFFLL, v23);
    }
LABEL_8:

    goto LABEL_9;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:
}

uint64_t sub_3CF4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_4198(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_4520(id a1)
{
  qword_1DCD0 = [[Lt10zus2DOk3OfFf alloc] initWithServiceName:@"com.apple.asd.scoring"];
  _objc_release_x1();
}

void sub_46D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_46F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained uTtwJoGUgL3N0GVz];
}

void sub_48F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_4918(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_4934(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_4BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_4C1C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_4C34(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_4E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_4E94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_4EB0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_50DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_50FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_5114(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_5428(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 152));
  _Unwind_Resume(a1);
}

uint64_t sub_5448(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_546C(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v14 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_56B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_56E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_56F0(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_5A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v22 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_5A38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_5A48(uint64_t a1)
{
}

void sub_5A50(uint64_t a1, void *a2)
{
}

uint64_t sub_5A60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_5A78(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_5C74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_5C9C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_5CB0(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_6024(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

uint64_t sub_6050(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_6064(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)])
  {
    if (a3 || !v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v7 = self;
      id v21 = 0;
      id v8 = +[ASGeoCodingKeyedUnarchiver unarchivedObjectOfClass:v7 fromData:v5 error:&v21];
      id v9 = v21;

      if (v9 || !v8)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v10 = v8;
        id v11 = (char *)[v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v18;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = self;
              char isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

                goto LABEL_18;
              }
            }
            id v12 = (char *)[v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_18:
        id v9 = 0;
      }
    }
  }
}

void sub_6440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_6460(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_6474(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_6744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_6764(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_6784(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_6980(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_69A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_69B8(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_6BB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_6BD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_6BE8(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_6E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_6E30(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_6E50(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_6FD4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = objc_retainBlock(*(id *)(a1 + 48));
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];
}

id sub_7100(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;

  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 16);
  return _[v4 removeObjectForKey:v3];
}

void sub_71D4(uint64_t a1)
{
  uint64_t v2 = +[NSString stringWithUTF8String:kCoreASErrorDomainCA];
  uint64_t v3 = +[NSError errorWithDomain:v2 code:-31 userInfo:0];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "allValues", 0);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) + 16))();
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

void sub_7560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    BOOL v3 = a3 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  int v4 = v3;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_75C0()
{
  return 4294940294;
}

uint64_t sub_75C8(uint64_t a1, unsigned int a2, void *a3)
{
  *a3 = (*(uint64_t (**)(void, uint64_t))(v3 + 576))(a2, 3384187359);
  (*(void (**)(void *, unint64_t *, uint64_t))(v3 + 760))(&unk_13CD4, &STACK[0x420], 16);
  id v5 = *(uint64_t (**)(void *))(v3 + 760);
  STACK[0x398] = v4 - 144;
  uint64_t v6 = v5(&unk_138C0);
  return (*(uint64_t (**)(uint64_t))(v3
                                            + 8
                                            * ((13
                                              * ((unint64_t)((char *)&STACK[0x430] - (char *)&unk_14600) < 0x20)) ^ 0x27u)))(v6);
}

uint64_t sub_7680@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)&STACK[0x430] = xmmword_15B50;
  *(_OWORD *)&STACK[0x440] = xmmword_15B60;
  *(_OWORD *)&STACK[0x450] = xmmword_15B70;
  *(_OWORD *)&STACK[0x460] = xmmword_15B80;
  *(_OWORD *)&STACK[0x470] = xmmword_15B90;
  *(_OWORD *)&STACK[0x480] = xmmword_15BA0;
  *(_OWORD *)&STACK[0x490] = xmmword_15BB0;
  *(_OWORD *)&STACK[0x4A0] = xmmword_15BC0;
  *(_OWORD *)&STACK[0x4B0] = xmmword_15BD0;
  *(_OWORD *)&STACK[0x4C0] = xmmword_15BE0;
  *(_OWORD *)&STACK[0x4D0] = xmmword_15BF0;
  *(_OWORD *)&STACK[0x4E0] = xmmword_15C00;
  *(_OWORD *)&STACK[0x4F0] = xmmword_15C10;
  *(_OWORD *)&STACK[0x500] = xmmword_15C20;
  *(_OWORD *)&STACK[0x510] = xmmword_15C30;
  *(_OWORD *)&STACK[0x520] = xmmword_15C40;
  *(_OWORD *)&STACK[0x530] = xmmword_15C50;
  *(_OWORD *)&STACK[0x540] = xmmword_15C60;
  *(_OWORD *)&STACK[0x550] = xmmword_15C70;
  *(_OWORD *)&STACK[0x560] = xmmword_15C80;
  *(_OWORD *)&STACK[0x570] = xmmword_15C90;
  *(_OWORD *)&STACK[0x580] = xmmword_15CA0;
  *(_OWORD *)&STACK[0x590] = xmmword_15CB0;
  *(_OWORD *)&STACK[0x5A0] = xmmword_15CC0;
  *(_OWORD *)&STACK[0x5B0] = xmmword_15CD0;
  *(_OWORD *)&STACK[0x5C0] = xmmword_15CE0;
  *(_OWORD *)&STACK[0x5D0] = xmmword_15CF0;
  *(_OWORD *)&STACK[0x5E0] = xmmword_15D00;
  *(_OWORD *)&STACK[0x5F0] = 0u;
  *(_OWORD *)&STACK[0x600] = 0u;
  *(_OWORD *)&STACK[0x610] = 0u;
  *(_OWORD *)&STACK[0x620] = 0u;
  *(_OWORD *)&STACK[0x630] = 0u;
  *(_OWORD *)&STACK[0x640] = 0u;
  *(_DWORD *)(a1 + 544) = *(_DWORD *)(v1 + 544);
  int v4 = ((118806587 - v3) & 0xFD1595EF ^ 0x82) == 137;
  return (*(uint64_t (**)(void))(v2 + 8 * ((2 * v4) | (v4 << 6) | 0xD)))();
}

uint64_t sub_7854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(void))(v10
                              + 8 * (v9 ^ ((4 * (&a9 == (uint64_t *)-1072)) | (16 * (&a9 == (uint64_t *)-1072))))))();
}

uint64_t sub_788C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (int)(((((v1 ^ 7) + 67831726) & 0xFBF4F86B ^ 0x3B) * (a1 == v2)) ^ v1 ^ 7)))();
}

uint64_t sub_78CC()
{
  int v5 = v0 + 26;
  *(void *)(v4 - 144) = 0x951FAAEE1026D03;
  *(void *)(v4 - 136) = 0x9AAF552B875DE8C0;
  int v6 = (v0 + 26) ^ 0x2B;
  if (v1) {
    BOOL v7 = v2 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  int v8 = v7;
  return (*(uint64_t (**)(void))(v3 + 8 * (((v6 + 15) * v8) ^ v5)))();
}

uint64_t sub_7928()
{
  STACK[0x398] = (unint64_t)&STACK[0x420];
  if (v1) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v0 ^ 0x2B) + 15) * v5) ^ v0)))();
}

uint64_t sub_7964@<X0>(int a1@<W8>)
{
  unsigned int v4 = ((v2 + 1357734545) ^ 0xFD29D4E) & (2 * ((v2 + 1357734545) & 0xAF129D6F)) ^ (v2 + 1357734545) & 0xAF129D6F;
  unsigned int v5 = ((v1 - 712503020) ^ (2 * ((v2 + 1357734545) ^ 0x45D695C4))) & ((v2 + 1357734545) ^ 0x45D695C4) ^ (2 * ((v2 + 1357734545) ^ 0x45D695C4)) & 0xEAC408AA;
  unsigned int v6 = ((4 * (v5 ^ 0x2A4408A9)) ^ 0xAB1022AC) & (v5 ^ 0x2A4408A9) ^ (4 * (v5 ^ 0x2A4408A9)) & 0xEAC408A8;
  unsigned int v7 = (v6 ^ 0xAA0000A0) & (16 * ((v5 ^ 0xC0800000) & (4 * v4) ^ v4)) ^ (v5 ^ 0xC0800000) & (4 * v4) ^ v4;
  unsigned int v8 = ((16 * (v6 ^ 0x40C40803)) ^ 0xAC408AB0) & (v6 ^ 0x40C40803) ^ (16 * (v6 ^ 0x40C40803)) & 0xEAC408A0;
  unsigned int v9 = v7 ^ 0xEAC408AB ^ (v8 ^ 0xA8400800) & (v7 << 8);
  unsigned int v10 = (v2 + 1357734545) ^ (2
                           * ((v9 << 16) & 0x6AC40000 ^ v9 ^ ((v9 << 16) ^ 0x8AB0000) & (((v8 ^ 0x4284000B) << 8) & 0xEAC40000 ^ 0x2AC40000 ^ (((v8 ^ 0x4284000B) << 8) ^ 0x44080000) & (v8 ^ 0x4284000B))));
  BOOL v12 = ((2 * (v10 & 0xF ^ 0x14144808)) | 0xBBAA1134) - (v10 & 0xF ^ 0x14144808) != -1483323083 || v10 == 1805290553;
  return (*(uint64_t (**)(void))(v3 + 8 * (((a1 ^ 5 ^ ((a1 + 56) | 2)) * v12) ^ a1)))();
}

uint64_t sub_7B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(void))(v10 + 8 * ((((v9 ^ 0x21) + 3) * (&a9 == (uint64_t *)-1072)) | v9)))();
}

uint64_t sub_7B60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  uint64_t v47 = (*(uint64_t (**)(uint64_t))(v46 + 8 * (v45 + 15)))(1032);
  uint64_t v48 = (*(uint64_t (**)(uint64_t))(v46 + 8 * (v45 + 15)))(1032);
  STACK[0x380] = v47;
  STACK[0x378] = v48;
  if (v47) {
    BOOL v56 = v48 == 0;
  }
  else {
    BOOL v56 = 1;
  }
  int v57 = !v56;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 8 * ((v57 * (((v45 ^ 0x1B) - 4) ^ 4)) ^ v45)))(v48, v49, v50, v51, v52, v53, v54, v55, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45);
}

uint64_t sub_7BD0()
{
  LODWORD(STACK[0x408]) = v4 >> 3;
  unsigned int v5 = (v4 >> 3) ^ 0xD735187;
  LODWORD(STACK[0x404]) = v5;
  uint64_t v6 = v1[((v0 + 60) ^ 0xA88D423B) % v5];
  unint64_t v7 = ((((v4 >> 3) ^ 0xFA7DD71E757E83ALL) - 0x7C853498ECDBE7DDLL) ^ (((v4 >> 3) ^ 0xBC7D8232869CD75)
                                                                    - 0x78E531CA23E5C292) ^ (((v4 >> 3) ^ 0x4600552C24D74C8)
                                                                                             - 0x7742ECBBC9C17B2FLL))
     + 0x7322E9E984482D8FLL;
  if (v7 < 0x7D48CF2F != (unint64_t)(v6 + 3030306715) < 0x7D48CF2F) {
    BOOL v8 = v7 < 0x7D48CF2F;
  }
  else {
    BOOL v8 = v6 + 3030306715 < v7;
  }
  unint64_t v9 = (v4 >> 3) ^ 0xD735187;
  int v10 = (v6
       - ((((v4 >> 3) ^ 0xF2ED58B59878CAE4) + 0x7E304EA36C0B3AFDLL) ^ (((v4 >> 3) ^ 0xB37863114FD9A27ELL)
                                                                       + 0x3FA57507BBAA5267) ^ (((v4 >> 3) ^ 0x41953BA4DAD2391DLL)
                                                                                                - 0x32B7D24DD15E36FALL))
       - 0x7322E9E8CFA95DF4)
      % v9;
  int v11 = (v10 ^ 0x67CF7DE7) - 1648521478 + ((2 * v10) & 0xF9EFBCE);
  if (v8) {
    int v11 = v6 + 1021513037;
  }
  unsigned int v12 = (v11 ^ 0xFB72EB1F) & (2 * (v11 & 0xFA72F31F)) ^ v11 & 0xFA72F31F;
  unsigned int v13 = ((2 * (v11 ^ 0xCFD72D19)) ^ 0x6B4BBC0C) & (v11 ^ 0xCFD72D19) ^ (2 * (v11 ^ 0xCFD72D19)) & 0x35A5DE06;
  int v14 = v13 ^ 0x14A44202;
  int v15 = (v13 ^ 0x21019C04) & (4 * v12) ^ v12;
  unsigned int v16 = ((4 * v14) ^ 0xD6977818) & v14 ^ (4 * v14) & 0x35A5DE00;
  int v17 = (v16 ^ 0x14855800) & (16 * v15) ^ v15;
  int v18 = ((16 * (v16 ^ 0x21208606)) ^ 0x5A5DE060) & (v16 ^ 0x21208606) ^ (16 * (v16 ^ 0x21208606)) & 0x35A5DE00;
  unint64_t v19 = v11 ^ (2
             * ((((v18 ^ 0x25A01E06) << 8) & 0x35A50000 ^ 0x25840000 ^ (((v18 ^ 0x25A01E06) << 8) ^ 0xA5DE0000) & (v18 ^ 0x25A01E06)) & (((v18 ^ 0x1005C000) & (v17 << 8) ^ v17) << 16) ^ (v18 ^ 0x1005C000) & (v17 << 8) ^ v17)) ^ 0x82819111F058D31DLL;
  unint64_t v20 = v1[(v1[(v1[(v19 - ((2 * v19) & 0x5012203D35393CCLL) - 0x1C1D4A741656361ALL) ^ 0x163249AE383E9E4] + 3855038535)
             % v9]
          + 3865674970)
         % v9]
      + 578455804;
  STACK[0x3F8] = v9;
  LODWORD(v20) = v20 % v9 - ((2 * (v20 % v9)) & 0x1737DBD2) + 1268510185;
  unsigned int v21 = (((v20 ^ 0x81F1505E) + 2113871245) ^ ((v20 ^ 0x77571436) - 1957078555) ^ ((v20 ^ 0xBD3DA981) + 1093919828))
      - 1494198759;
  BOOL v22 = v21 < 0x5E85F655;
  *int v2 = *v1 ^ 0x6D6D6D6D6D6D6D6DLL;
  if (v21 >= 0x5E85F655) {
    BOOL v22 = v21 > 0x5E85F656;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((15 * !v22) ^ (v0 + 60))))();
}

uint64_t sub_8118@<X0>(uint64_t a1@<X5>, unsigned int a2@<W8>)
{
  unsigned int v6 = (v2 + 1350776877) & 0xAF7CC79D;
  unsigned int v7 = (((LODWORD(STACK[0x408]) ^ 0x819E62D0) + 727381173) ^ ((LODWORD(STACK[0x408]) ^ 0x14CF84FD) - 1106570598) ^ ((LODWORD(STACK[0x408]) ^ 0x9822B7AA) + 853942735))
     + v6
     + 1114879174;
  BOOL v8 = v7 < 0xEA2B7CAA;
  *(void *)(v4 + 8 * a2) = *(void *)(v3 + 8 * a2) ^ a1;
  if (v8 == a2 - 366248789 < 0xEA2B7CAA) {
    BOOL v8 = v7 > a2 - 366248789;
  }
  return (*(uint64_t (**)(void))(v5 + 8 * (int)((53 * v8) | v6)))();
}

uint64_t sub_8250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  STACK[0x390] = v6;
  if (((*(unsigned char *)(a5 + ((*(unsigned char *)(a5 + ((*(unsigned char *)(a5 + ((*(unsigned char *)(a5 + 11) + 12) & 0xF)) + 2) & 0xF)) + 6) & 0xF))
       + 10) & 0xE) != 0)
    uint64_t v8 = (*(unsigned char *)(a5
                   + ((*(unsigned char *)(a5 + ((*(unsigned char *)(a5 + ((*(unsigned char *)(a5 + 11) + 12) & 0xF)) + 2) & 0xF)) + 6) & 0xF))
        + 10) & 0xF;
  else {
    uint64_t v8 = 1;
  }
  return (*(uint64_t (**)(void))(v7 + 8 * ((103 * (v8 != 1)) ^ (v5 - 29))))();
}

uint64_t sub_83A0()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((99 * (v1 == 15)) ^ v0)))();
}

#error "A354: call analysis failed (funcsize=1831)"

uint64_t sub_A35C@<X0>(uint64_t a1@<X0>, int a2@<W4>, uint64_t a3@<X5>, int a4@<W6>, uint64_t a5@<X7>, int a6@<W8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  int v62 = v56 - 11;
  LODWORD(a50) = LODWORD(STACK[0x330]) ^ LODWORD(STACK[0x3E8]) ^ (LODWORD(STACK[0x2E0])
                                                                + a2
                                                                + 295089407
                                                                + (LODWORD(STACK[0x3D4]) ^ LODWORD(STACK[0x200]) ^ (a6 + v60)));
  uint64_t v63 = (((LODWORD(STACK[0x408]) ^ 0xC5E51CD5) + 1864469170) ^ ((LODWORD(STACK[0x408]) ^ 0x32CC1792) - 1744272905) ^ (((v56 - 94741882) ^ LODWORD(STACK[0x408])) + 1352584357))
      + 1916659118;
  BOOL v64 = v63 < 0x19F5AD92;
  unint64_t v65 = 0x418B018541479FA3
      * (((*(void *)(STACK[0x390] + 8 * v58) + (*(void *)(STACK[0x390] + 8 * v58) ^ 0x9292929292929292) + 1) ^ 0xFFFFFFFFFFFFFFFELL)
       + *(void *)(STACK[0x390] + 8 * v58));
  unint64_t v66 = (v65 ^ v59) + v58 - (((v65 ^ v59) + v58) >> 32);
  unint64_t v67 = v66 - (v66 >> ((v56 - 47) ^ 0x1Bu)) - ((v66 - (v66 >> ((v56 - 47) ^ 0x1Bu))) >> 8);
  int v68 = (v67 + a1) ^ a4;
  unint64_t v69 = ((v67 + v57) ^ v65) + v58 - ((((v67 + v57) ^ v65) + v58) >> 32);
  unint64_t v70 = v69 - (v69 >> 16) - ((v69 - (v69 >> 16)) >> 8);
  unint64_t v71 = ((v70 + v57) ^ v65) + v58 - ((((v70 + v57) ^ v65) + v58) >> 32);
  uint64_t v72 = v68 ^ (v70 + a1) ^ (v71
                                          - (v71 >> 16)
                                          - ((v71 - (v71 >> 16)) >> 8)
                                          + a1);
  unsigned int v73 = v58 + 1;
  uint64_t v74 = v64 ^ (v73 >= 0xE60A526E);
  if (!v74) {
    BOOL v64 = v73 + 435531154 < v63;
  }
  v75 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 8 * ((21 * v64) ^ v62));
  HIDWORD(a45) = LODWORD(STACK[0x348]) ^ 0x2AE252BD;
  return v75(a1, v75, 0x418B018541479FA3, v74, v63, a3, v72, a5, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56);
}

uint64_t sub_A54C@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  if (((*(unsigned char *)(v3
                  + ((*(unsigned char *)(v3
                               + ((*(unsigned __int8 *)(v3 + ((*(unsigned char *)(v3 + 2) + 13) & 0xF)) + 2) & 0xFLL))
                    + 3) & 0xF))
       + 1) & 0xE) != 0)
    uint64_t v4 = (*(unsigned char *)(v3
                   + ((*(unsigned char *)(v3
                                + ((*(unsigned __int8 *)(v3 + ((*(unsigned char *)(v3 + 2) + 13) & 0xF)) + 2) & 0xFLL))
                     + 3) & 0xF))
        + 1) & 0xF;
  else {
    uint64_t v4 = 1;
  }
  return (*(uint64_t (**)(uint64_t, void))(v2 + 8 * ((25 * (v4 == 1)) ^ a2)))(a1, (a2 - 8));
}

uint64_t sub_AB18(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (a2 | (4 * (v2 != 15)))))();
}

uint64_t sub_ABB0(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  int v68 = (a2 - 2) | 0x18;
  unsigned int v69 = (a3 ^ 0xCF39C5D0) - ((a3 ^ 0xCF39C5D0) >> 13) + (((a3 ^ 0xCF39C5D0) - ((a3 ^ 0xCF39C5D0) >> 13)) >> 5);
  unsigned int v70 = (v68 ^ 0xF9901316) + v69 - (((v68 ^ 0xF9901316) + v69) >> 10);
  unsigned int v71 = v70 - (v70 >> 2);
  int v72 = v69 ^ v62;
  unsigned int v73 = v71 ^ 0xF30576F9;
  int v74 = v71 ^ v65;
  unsigned int v75 = v73 + (v73 >> 14) - ((v73 + (v73 >> 14)) >> 2);
  unsigned int v76 = v75 + 511487013 + ((v75 + 511487013) >> 15) + ((v75 + 511487013 + ((v75 + 511487013) >> 15)) >> 3);
  unsigned int v77 = (v72 ^ -v72 ^ (v76 - (v76 ^ v72))) + v76;
  unsigned int v78 = (v76 ^ 0x5985AE2F) - ((v76 ^ 0x5985AE2F) >> 10) + (((v76 ^ 0x5985AE2F) - ((v76 ^ 0x5985AE2F) >> 10)) >> 7);
  int v79 = v74 ^ v78;
  unsigned int v80 = v78 - 787086048 - ((v78 - 787086048) >> 9) + ((v78 - 787086048 - ((v78 - 787086048) >> 9)) >> 5);
  unsigned int v81 = v80 - 1168002143 - ((v80 - 1168002143) >> 14) + ((v80 - 1168002143 - ((v80 - 1168002143) >> 14)) >> 4);
  int v82 = v81 ^ v77;
  unsigned int v83 = v81 - 879085134 + ((v81 - 879085134) >> 10) - ((v81 - 879085134 + ((v81 - 879085134) >> 10)) >> 5);
  unsigned int v84 = v79 ^ v83;
  unsigned int v85 = v82 ^ 2 | v82 & 0x9A38B5A8;
  unsigned int v86 = v75 ^ v64 ^ v80 ^ (v83
                         + 1300749569
                         - ((v83 + 1300749569) >> 9)
                         - ((v83 + 1300749569 - ((v83 + 1300749569) >> 9)) >> 4));
  unint64_t v87 = (((v75 ^ v64 ^ v80 ^ (v83
                                             + 1
                                             - ((v83 + 1300749569) >> 9)
                                             - ((v83 + 1300749569 - ((v83 + 1300749569) >> 9)) >> 4))) ^ 4)
       + 1) & 7;
  int v88 = v86 & 7 ^ 3;
  LODWORD(STACK[0x354]) = v88;
  BOOL v89 = v88 == 0;
  if (v88) {
    int v90 = 255;
  }
  else {
    int v90 = 0;
  }
  STACK[0x2A8] = v87;
  int v91 = v90 << v87;
  int v92 = v91;
  int v93 = 16843009 * v91;
  if (v89) {
    unsigned __int8 v94 = 0;
  }
  else {
    unsigned __int8 v94 = ~(_BYTE)v91;
  }
  uint64_t v95 = (~v93 - v93) ^ 0xFFFFFFFE;
  uint64_t v96 = (1929379840 * v92) & v84;
  uint64_t v97 = v67[0xB4C2D96D % LODWORD(STACK[0x404])];
  LODWORD(STACK[0x328]) = v84;
  LODWORD(v97) = ((v67[((v67[((v67[((v97 ^ 0x6D6D6D6D6D6D6D6DuLL) + 2986301921u) % STACK[0x3F8]] ^ 0x6D6D6D6D6D6D6D6DuLL)
                            + 2923655298u)
                           % STACK[0x3F8]] ^ 0x6D6D6D6D6D6D6D6DuLL)
                      + 2008708959)
                     % STACK[0x3F8]] ^ 0x6D6D6D6D6D6D6D6DuLL)
                + 3811120295u)
               % STACK[0x3F8];
  int v98 = 16843009
      * (v84 ^ 0x88 ^ ((unsigned __int16)(v84 ^ 0x5B88) >> 8) ^ ((v84 ^ 0x74325B88) >> 16) ^ HIBYTE(v84) ^ 0x71);
  LODWORD(STACK[0x3E0]) = (16843009
                         * (v85 ^ 0xBB ^ ((unsigned __int16)(v85 ^ 0x2BB) >> 8) ^ ((v85 ^ 0x247F02BB) >> 16) ^ HIBYTE(v85) ^ 0x48)) ^ 0x69696969 ^ v98;
  uint64_t v99 = (v97 - ((2 * v97) & 0xA49F8CA) - 1524302747) ^ 0xA524FC65;
  LODWORD(STACK[0x250]) = v98 ^ 0x5050505;
  int v100 = LODWORD(STACK[0x318]) ^ 0x14BE8117;
  LODWORD(STACK[0x40C]) = v85;
  LODWORD(STACK[0x314]) = v85 & 0xFFFFFF01;
  LODWORD(STACK[0x3EC]) = v86;
  BOOL v101 = v99 > 0x1AE6B61D;
  uint64_t v102 = 0x418B018541479FA3 * (*v67 ^ 0x6D6D6D6D6D6D6D6DLL);
  uint64_t v103 = (v102 ^ 0x177943424141AE0BLL)
       - ((v102 ^ 0x177943424141AE0BuLL) >> 32)
       - (((v102 ^ 0x177943424141AE0BLL) - ((v102 ^ 0x177943424141AE0BuLL) >> 32)) >> 16)
       - (((v102 ^ 0x177943424141AE0BLL)
         - ((v102 ^ 0x177943424141AE0BuLL) >> 32)
         - (((v102 ^ 0x177943424141AE0BLL) - ((v102 ^ 0x177943424141AE0BuLL) >> 32)) >> 16)) >> (((v68 - 8) | 0x20u) - 41))
       + v63;
  int v104 = v103 ^ v100;
  uint64_t v105 = (v103 ^ v102)
       - ((v103 ^ (unint64_t)v102) >> 32)
       - (((v103 ^ v102) - ((v103 ^ (unint64_t)v102) >> 32)) >> 16)
       - (((v103 ^ v102)
         - ((v103 ^ (unint64_t)v102) >> 32)
         - (((v103 ^ v102) - ((v103 ^ (unint64_t)v102) >> 32)) >> 16)) >> 8)
       + v63;
  int v106 = v104 ^ v105;
  uint64_t v107 = (v105 ^ v102)
       - ((v105 ^ (unint64_t)v102) >> 32)
       - (((v105 ^ v102) - ((v105 ^ (unint64_t)v102) >> 32)) >> 16)
       - (((v105 ^ v102)
         - ((v105 ^ (unint64_t)v102) >> 32)
         - (((v105 ^ v102) - ((v105 ^ (unint64_t)v102) >> 32)) >> 16)) >> 8)
       + v63;
  uint64_t v108 = v106 ^ v107;
  if (v99 <= 0x1AE6B61D) {
    BOOL v101 = (v99 - 451327518) > 0xE51949E3;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v66 + 8 * ((93 * v101) ^ v68)))(a1, v108, v96, v99, v107, 0x6D6D6D6D6D6D6D6DLL, v95, (v85 ^ 2u) & v94, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62);
}

void sub_AFD8()
{
}

uint64_t sub_AFE0@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, int a7@<W7>, int a8@<W8>)
{
  LODWORD(STACK[0x334]) = (a6 + a8) ^ a7;
  unsigned int v12 = (((LODWORD(STACK[0x408]) ^ 0xB3C2264A) + 419868719) ^ ((LODWORD(STACK[0x408]) ^ 0x11E19BDF) - 1155199556) ^ (((v10 - 1353651231) ^ LODWORD(STACK[0x408])) + 93616759))
      - 340330973;
  BOOL v13 = v12 < 0x936EBE07;
  uint64_t v14 = 0x418B018541479FA3 * ((17 * ((v10 + 20) ^ 0x47u)) ^ (a5 - 30) ^ *(void *)(STACK[0x390] + 8 * v8));
  unint64_t v15 = (v14 ^ a4) + v8 - (((v14 ^ a4) + (unint64_t)v8) >> 32);
  unint64_t v16 = v15 - (v15 >> 16) - ((v15 - (v15 >> 16)) >> 8);
  unint64_t v17 = ((v16 + v9) ^ v14) + v8 - ((((v16 + v9) ^ v14) + v8) >> 32);
  unint64_t v18 = v17 - (v17 >> 16) - ((v17 - (v17 >> 16)) >> 8);
  unint64_t v19 = ((v18 + v9) ^ v14) + v8 - ((((v18 + v9) ^ v14) + v8) >> 32);
  unint64_t v20 = v19 - (v19 >> 16) - ((v19 - (v19 >> 16)) >> 8);
  uint64_t v21 = (v16 + v9) ^ a2 ^ (v18 + v9) ^ ((v9 & (2
                                                                                           * (v20 + 1238975257)))
                                                                      + ((v20 + 1238975257) ^ 0x49D94319));
  if (v13 == v8 - 1821458936 < 0x936EBE07) {
    BOOL v13 = v12 > v8 - 1821458936;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t))(v11
                                                                                + 8 * ((v13 | (2 * v13)) ^ (v10 + 20))))(a1, v21, a3, 0x89751B1549D94319);
}

uint64_t sub_B188()
{
  LODWORD(STACK[0x24C]) = v0 ^ 0x6C6C6C6C;
  if (((*(unsigned char *)(v3
                  + ((*(unsigned char *)(v3
                               + ((*(unsigned char *)(v3 + ((*(unsigned __int8 *)(v3 + 7) + 5) & 0xFLL)) + 9) & 0xF))
                    + 9) & 0xF))
       + 7) & 0xE) != 0)
    uint64_t v4 = (*(unsigned char *)(v3
                   + ((*(unsigned char *)(v3
                                + ((*(unsigned char *)(v3 + ((*(unsigned __int8 *)(v3 + 7) + 5) & 0xFLL)) + 9) & 0xF))
                     + 9) & 0xF))
        + 7) & 0xF;
  else {
    uint64_t v4 = 1;
  }
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * ((39 * (v4 != 1)) ^ (v1 - 1585224797) & 0x5E7C9C3Fu)))(1236720864);
}

void sub_B49C()
{
}

uint64_t sub_B4A4@<X0>(int a1@<W2>, int a2@<W6>, int a3@<W8>)
{
  STACK[0x410] = 1302115035;
  LODWORD(STACK[0x29C]) = a1 ^ a3;
  return (*(uint64_t (**)(void))(v4 + 8 * ((v3 == 15) | (16 * (v3 == 15)) | (a2 + 69889606))))();
}

void sub_B630()
{
}

#error "BE44: call analysis failed (funcsize=450)"

uint64_t sub_BE4C(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v76 = (a3 - 42) | 0x18;
  LODWORD(STACK[0x330]) = a68 ^ a48;
  LODWORD(STACK[0x21C]) ^= LODWORD(STACK[0x300]) ^ STACK[0x348] ^ (STACK[0x2A8] | (STACK[0x348] << 6));
  LODWORD(STACK[0x210]) ^= a50 ^ HIDWORD(a50) ^ a1 ^ LODWORD(STACK[0x208]) ^ (HIDWORD(a48) << (((a3 - 42) | 0x18) - 53));
  LODWORD(STACK[0x300]) = a69 ^ a49 ^ v74 & STACK[0x2F8] ^ 0x184832E0;
  unsigned int v77 = (((LODWORD(STACK[0x408]) ^ 0xE1D4BBA2) + 1259351495) ^ ((LODWORD(STACK[0x408]) ^ 0x74969F81) - 565048858) ^ ((LODWORD(STACK[0x408]) ^ 0x983175A4) + 854975425))
      - 204021315;
  LODWORD(STACK[0x208]) = LODWORD(STACK[0x2FC]) ^ (8 * HIDWORD(a49));
  BOOL v78 = v77 < 0x9B8EA9A1;
  uint64_t v79 = 0x418B018541479FA3 * (*(void *)(v71 + 8 * a7) ^ v75);
  unint64_t v80 = (v79 ^ v69) + a7 - (((v79 ^ v69) + (unint64_t)a7) >> 32);
  uint64_t v81 = v80 - (v80 >> 16) - ((v80 - (v80 >> 16)) >> ((v76 + 2) ^ 0x33u)) + v70;
  unint64_t v82 = (v81 ^ v79) + a7 - (((v81 ^ v79) + (unint64_t)a7) >> 32);
  unint64_t v83 = v82 - (v82 >> 16) - ((v82 - (v82 >> 16)) >> 8);
  uint64_t v84 = v73 & ((v83 + a4) >> 1);
  unint64_t v85 = ((v83 + v70) ^ v79) + a7 - ((((v83 + v70) ^ v79) + a7) >> 32);
  uint64_t v86 = a7 + 1;
  uint64_t v87 = v78 ^ ((v86 - 1685149279) < 0x9B8EA9A1);
  if (!v87) {
    BOOL v78 = v77 > (int)v86 - 1685149279;
  }
  return (*(uint64_t (**)(unint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v72 + 8 * ((97 * v78) ^ v76)))(v85 - (v85 >> 16) - ((v85 - (v85 >> 16)) >> 8), 2609818017, (v76 + 2), a4, v87, v84, v86, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54);
}

uint64_t sub_C0FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  LODWORD(a58) = a58 + LODWORD(STACK[0x308]);
  LODWORD(STACK[0x2FC]) = 16 * v63;
  LODWORD(STACK[0x200]) ^= HIDWORD(a55) ^ a51 ^ HIDWORD(a53);
  LODWORD(STACK[0x308]) = a54 + LODWORD(STACK[0x30C]);
  LODWORD(STACK[0x30C]) = LODWORD(STACK[0x3A0]) ^ 0xED35EB3F ^ (2093737731 * HIDWORD(a51));
  unint64_t v67 = a1
      - 0x373B377CD11039CBLL
      + ((unint64_t)(a1 - 0x373B377CD11039CBLL) >> 28)
      + ((a1 - 0x373B377CD11039CBLL + ((unint64_t)(a1 - 0x373B377CD11039CBLL) >> 28)) >> 11);
  uint64_t v68 = (v67 >> 7) + v67 - 2 * (v67 >> 7);
  unint64_t v69 = v68
      - 0x13AFA5FA8FB17A6
      + ((unint64_t)(v68 - 0x13AFA5FA8FB17A6) >> 29)
      - ((v68 - 0x13AFA5FA8FB17A6 + ((unint64_t)(v68 - 0x13AFA5FA8FB17A6) >> 29)) >> 8);
  unint64_t v70 = v69 + (v69 >> 6);
  unint64_t v71 = v70
      + 0x47CBE9EA4DE0F1B7
      - ((v70 + 0x47CBE9EA4DE0F1B7) >> 28)
      + ((v70 + 0x47CBE9EA4DE0F1B7 - ((v70 + 0x47CBE9EA4DE0F1B7) >> 28)) >> 8);
  unint64_t v72 = v71
      + (v71 >> 7)
      - 0x25953151116B048ALL
      + ((v71 + (v71 >> 7) - 0x25953151116B048ALL) >> 29)
      - ((v71 + (v71 >> 7) - 0x25953151116B048ALL + ((v71 + (v71 >> 7) - 0x25953151116B048ALL) >> 29)) >> 14);
  unint64_t v73 = v72
      - (v72 >> 7)
      - 0x10BF2422B96631C1
      - ((v72 - (v72 >> 7) - 0x10BF2422B96631C1) >> 28)
      + ((v72 - (v72 >> 7) - 0x10BF2422B96631C1 - ((v72 - (v72 >> 7) - 0x10BF2422B96631C1) >> 28)) >> 8);
  unint64_t v74 = v73 + (v73 >> 8);
  unint64_t v75 = (v74 ^ 0xF929F7F6E1EC1FCELL)
      + ((v74 ^ 0xF929F7F6E1EC1FCELL) >> 26)
      + (((v74 ^ 0xF929F7F6E1EC1FCELL) + ((v74 ^ 0xF929F7F6E1EC1FCELL) >> 26)) >> 14);
  unint64_t v76 = v75
      + (v75 >> 6)
      - 0x70FE5FCAA42AEA45
      - ((v75 + (v75 >> 6) - 0x70FE5FCAA42AEA45) >> 26)
      - ((v75 + (v75 >> 6) - 0x70FE5FCAA42AEA45 - ((v75 + (v75 >> 6) - 0x70FE5FCAA42AEA45) >> 26)) >> 13);
  unint64_t v77 = ((v76 - (v76 >> 3)) ^ 0x48CFA99F8FD15905)
      - (((v76 - (v76 >> 3)) ^ 0x48CFA99F8FD15905) >> 28)
      - ((((v76 - (v76 >> 3)) ^ 0x48CFA99F8FD15905) - (((v76 - (v76 >> 3)) ^ 0x48CFA99F8FD15905) >> 28)) >> 11);
  int v78 = v74 ^ v70 ^ v62 ^ ((v74 ^ v70) >> 1) & 0x55DF6EBA ^ v65 & ((v77
                                                                                              + (v77 >> 4)) >> 1) ^ (v77 + (v77 >> 4));
  if (((v66[(v66[(v66[(v66[13] + 8) & 0xF] + 6) & 0xF] + 7) & 0xF] + 11) & 0xE) != 0) {
    uint64_t v79 = (v66[(v66[(v66[(v66[13] + 8) & 0xF] + 6) & 0xF] + 7) & 0xF] + 11) & 0xF;
  }
  else {
    uint64_t v79 = 1;
  }
  unsigned int v80 = *v66 * ((a3 ^ 0xFBD591FD) + 1973706621);
  unint64_t v81 = (unint64_t)((v80 ^ 0x19226648) + ((v80 ^ 0x19226648) >> 16)) >> 8;
  uint64_t v82 = (v80 ^ 0x19226648) - 651057517 + ((v80 ^ 0x19226648) >> 16) + v81;
  int v83 = (v80 ^ 0x19226648) - 1302115034 + ((v80 ^ 0x19226648) >> 16) + v81;
  unint64_t v84 = (unint64_t)((v83 ^ v80) + ((v83 ^ v80) >> 16)) >> 8;
  unsigned int v85 = (v83 ^ v80) - 651057517 + ((v83 ^ v80) >> 16) + v84;
  uint64_t v86 = ((v83 ^ v80) - 1302115034 + ((v83 ^ v80) >> 16) + v84) ^ v80;
  unint64_t v87 = (unint64_t)v86 >> 16;
  unint64_t v88 = (unint64_t)(v86 + WORD1(v86)) >> 8;
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v64 + 8 * (int)(((2 * (v79 == 1)) | (4 * (v79 == 1))) ^ a3)))(v86, 0, a3, a4, (v86 - 1302115034 + v87 + v88), (v85 >> 1) & 0x55DF6EBA, v82 ^ v78 ^ (v82 >> 1) & 0x55DF6EBA ^ v85 ^ (v85 >> 1) & 0x55DF6EBA ^ (v86 - 651057517 + v87 + v88) ^ ((v86 - 651057517 + v87 + v88) >> 1) & 0x55DF6EBA, v82, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62);
}

uint64_t sub_C4C0@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X3>, int a4@<W6>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x3A0] = v69;
  LODWORD(STACK[0x32C]) = a65 ^ ~HIDWORD(a53);
  LODWORD(STACK[0x2F8]) = a54 ^ LODWORD(STACK[0x38C]);
  LODWORD(STACK[0x310]) ^= a66;
  int v72 = 1903817027 * *(unsigned __int8 *)(v70 + a5);
  unsigned int v73 = v72 ^ (v71 + a1 + ((a1 + a2) >> 16) + ((a1 + a2 + ((a1 + a2) >> 16)) >> 8) + v66 - 1);
  uint64_t v74 = (a5 - 651057517);
  unsigned int v75 = v74 + v73 + ((v73 + a5) >> 16) + ((v73 + a5 + ((v73 + a5) >> 16)) >> 8);
  unsigned int v76 = ((2 * v75) & 0xB2634D26) + (v75 ^ 0xD931A693);
  unint64_t v77 = (unint64_t)((v76 ^ v72) + a5 + (((v76 ^ v72) + a5) >> 16)) >> 8;
  unsigned int v78 = v74 + (v76 ^ v72) + (((v76 ^ v72) + a5) >> 16) + v77;
  LODWORD(v77) = (a5 - 1302115034 + (v76 ^ v72) + (((v76 ^ v72) + a5) >> 16) + v77) ^ v72;
  unint64_t v79 = (v77 + a5);
  unint64_t v80 = v79 >> 16;
  unint64_t v81 = (unint64_t)(v79 + WORD1(v79)) >> 8;
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, void, unint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x3A0] + 8 * ((a5 != 15) | (16 * (a5 != 15)) | (v68 + 69889598))))((a5 - 1302115034 + v77 + v80 + v81), 1302115034, -651057517, a3, 3 * (v68 ^ 0xFBD591D7), v80, v75 ^ a4 ^ v67 & (v75 >> 1) ^ v78 ^ v67 & (v78 >> 1) ^ (v74 + v77 + v80 + v81) ^ v67 & ((v74 + v77 + v80 + v81) >> 1), v74, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56);
}

void sub_C6E4()
{
}

uint64_t sub_C6FC@<X0>(int a1@<W1>, int a2@<W4>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v69 = (a3 + ((v67 + v66) >> 16) + v67 + ((v67 + v66 + ((v67 + v66) >> 16)) >> 8) - a1) ^ 0xCF39C5D0;
  int v70 = ((*(void *)(STACK[0x390]
                    + 8
                    * (((*(void *)(STACK[0x390]
                                   + 8
                                   * (((*(void *)(STACK[0x390]
                                                  + 8
                                                  * (((*(void *)(STACK[0x390]
                                                                 + 8 * (0x791DF2FAu % LODWORD(STACK[0x404]))) ^ 0x6D6D6D6D6D6D6D6DuLL)
                                                    + 2126161460)
                                                   % STACK[0x3F8])) ^ 0x6D6D6D6D6D6D6D6DuLL)
                                     + 2993841644u)
                                    % STACK[0x3F8])) ^ 0x6D6D6D6D6D6D6D6DuLL)
                      + 2220923829u)
                     % STACK[0x3F8])) ^ 0x6D6D6D6D6D6D6D6DuLL)
       + 1951303181)
      % STACK[0x3F8];
  LODWORD(STACK[0x3F8]) = ((v69 - (v69 >> 13)) >> (((a2 - 117) & 0x47) - 1)) + v69 - (v69 >> 13);
  unsigned int v71 = (v70 - ((2 * v70) & 0x3C890E0C) - 1102805242) ^ 0xBE448706;
  int v72 = STACK[0x318];
  LODWORD(STACK[0x404]) = a65 ^ LODWORD(STACK[0x3F0]);
  unsigned int v73 = v72 ^ LODWORD(STACK[0x3EC]) ^ 0x5879B4F0;
  LODWORD(STACK[0x318]) = v73;
  LODWORD(STACK[0x324]) = v65 & (v73 >> 1);
  BOOL v74 = v71 > 0x7AF340BF;
  if (v71 <= 0x7AF340BF) {
    BOOL v74 = v71 - 2062762176 > 0x850CBF41;
  }
  return (*(uint64_t (**)(uint64_t))(v68 + 8 * (int)((53 * v74) ^ (a2 + 1562391435) & 0xA2DFCC47)))(3141127236);
}

uint64_t sub_CB10@<X0>(uint64_t a1@<X3>, int a2@<W4>, uint64_t a3@<X6>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t v75 = (a2 + 13);
  LODWORD(STACK[0x3F8]) ^= a66 ^ HIDWORD(a44) ^ a65 ^ HIDWORD(a54) ^ a52 ^ v73 ^ HIDWORD(a46) ^ a46 ^ HIDWORD(a45) & v68 ^ 0x7BE8B087;
  unsigned int v76 = (((LODWORD(STACK[0x408]) ^ 0xA0D707E7) + 169054596) ^ ((LODWORD(STACK[0x408]) ^ 0x52B52E1C) - 126764935) ^ ((LODWORD(STACK[0x408]) ^ 0xFF11787C) + 1440083453 + v75))
      - 862621162;
  int v77 = v69 + a4;
  BOOL v78 = v76 < 0x744D39FA;
  uint64_t v79 = 0x418B018541479FA3 * (*(void *)(v74 + 8 * v69) ^ 0x6D6D6D6D6D6D6D6DLL);
  unint64_t v80 = (v79 ^ v70) + v69 - (((v79 ^ v70) + (unint64_t)v69) >> (((a2 + 1) | 4u) + 12));
  uint64_t v81 = v80 - (v80 >> 16) - ((v80 - (v80 >> 16)) >> 8) + v67;
  int v82 = v66 & (v81 >> 1) ^ v81 ^ v72;
  unint64_t v83 = (v81 ^ v79) + v69 - (((v81 ^ v79) + (unint64_t)v69) >> 32);
  uint64_t v84 = v83 - (v83 >> 16) - ((v83 - (v83 >> 16)) >> 8) + v67;
  unsigned int v85 = v66 & (v84 >> 1) ^ v84;
  uint64_t v86 = v78 ^ ((v77 + 797378118) < 0x744D39FA);
  if (!v86) {
    BOOL v78 = v76 > v77 + 797378118;
  }
  unint64_t v87 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v71 + 8 * (int)((57 * v78) ^ v75));
  HIDWORD(a45) = a45 & v68;
  return v87(57, v75, 1951218170, a1, v87, v82 ^ v85, a3, v86, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56);
}

void sub_CD80()
{
}

uint64_t sub_CD8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,int a49,int a50,uint64_t a51,int a52,int a53,uint64_t a54,int a55,int a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,int a62)
{
  int v64 = LODWORD(STACK[0x230]) ^ LODWORD(STACK[0x328]) ^ a7;
  LODWORD(STACK[0x230]) = a62 ^ LODWORD(STACK[0x3DC]) ^ 0xF7F7F7F7;
  LODWORD(STACK[0x408]) = v64 ^ a56 ^ a53 ^ a52 ^ a50 ^ 0xA6766605;
  if (((*(unsigned char *)(STACK[0x398]
                  + ((*(unsigned char *)(STACK[0x398]
                               + ((*(unsigned char *)(STACK[0x398] + ((*(unsigned char *)(STACK[0x398] + 1) + 14) & 0xF)) + 1) & 0xF))
                    + 6) & 0xF))
       + 12) & 0xE) != 0)
    uint64_t v65 = (*(unsigned char *)(STACK[0x398]
                    + ((*(unsigned char *)(STACK[0x398]
                                 + ((*(unsigned char *)(STACK[0x398] + ((*(unsigned char *)(STACK[0x398] + 1) + 14) & 0xF)) + 1) & 0xF))
                      + 6) & 0xF))
         + 12) & 0xF;
  else {
    uint64_t v65 = 1;
  }
  return (*(uint64_t (**)(void))(v62 + 8 * ((69 * (v65 == 1)) ^ v63)))();
}

uint64_t sub_D118@<X0>(int a1@<W2>, uint64_t a2@<X4>, int a3@<W6>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  int v63 = 1903817027 * *(unsigned __int8 *)(v60 + v58);
  unsigned int v64 = v63 ^ (v62
             + a4
             + ((a4 + v57) >> 16)
             + ((a4 + v57 + ((a4 + v57) >> 16)) >> 8)
             + a1
             - 1);
  int v65 = v58 + v62;
  unsigned int v66 = v58
      + v62
      + v64
      + ((v64 + v58) >> 16)
      + ((v64 + v58 + ((v64 + v58) >> 16)) >> 8);
  unsigned int v67 = v58
      + v62
      + (v66 ^ v63)
      + (((v66 ^ v63) + v58) >> 16)
      + (((v66 ^ v63) + v58 + (((v66 ^ v63) + v58) >> 16)) >> 8);
  int v68 = v67 ^ v63;
  unint64_t v69 = (v67 ^ v63) + v58;
  unint64_t v70 = v69 >> 16;
  unint64_t v71 = (unint64_t)(v69 + WORD1(v69)) >> 8;
  return (*(uint64_t (**)(void, void, uint64_t, unint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x3A0] + 8 * ((74 * (v58 == 15)) ^ (v59 + 69889625))))((v65 + v68 + v70 + v71), v58, 74, STACK[0x410] - 1, a2, v60, v66 ^ a3 ^ a2 & (v66 >> 1) ^ v67 ^ a2 & (v67 >> 1) ^ (v65+ v68+ v70+ v71) ^ a2 & ((v65 + v68 + v70 + v71) >> 1), a2 & ((v58 + v61 + v68 + v70 + v71) >> 1), a5, a6, a7, a8, a9, a10, a11, a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57);
}

void sub_D2E4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  STACK[0x410] = a4;
  JUMPOUT(0xD164);
}

uint64_t sub_D300@<X0>(int a1@<W1>, int a2@<W3>, uint64_t a3@<X4>, uint64_t a4@<X6>, int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v68 = (v65 + ((a5 + a1) >> 16) + a5 + ((a5 + a1 + ((a5 + a1) >> 16)) >> 8) - a2) ^ 0xCF39C5D0;
  unsigned int v69 = v68 - (v68 >> 13) + ((v68 - (v68 >> 13)) >> 5);
  unsigned int v70 = v69 - 107998449 - ((v69 - 107998449) >> 10) - ((v69 - 107998449 - ((v69 - 107998449) >> 10)) >> 2);
  unsigned int v71 = (v70 ^ 0xF30576F9) + ((v70 ^ 0xF30576F9) >> 14) - (((v70 ^ 0xF30576F9) + ((v70 ^ 0xF30576F9) >> 14)) >> 2);
  unsigned int v72 = v71 + 511487013 + ((v71 + 511487013) >> 15) + ((v71 + 511487013 + ((v71 + 511487013) >> 15)) >> 3);
  uint64_t v73 = (v72 ^ 0x5985AE2F) - ((v72 ^ 0x5985AE2F) >> 10) + (((v72 ^ 0x5985AE2F) - ((v72 ^ 0x5985AE2F) >> 10)) >> 7);
  int v74 = v73
      - 787086048
      - ((v73 - 787086048) >> 9)
      + ((v73 - 787086048 - ((v73 - 787086048) >> 9)) >> 5);
  unsigned int v75 = v74
      - 1168002143
      - ((v74 - 1168002143) >> 14)
      + ((v74 - 1168002143 - ((v74 - 1168002143) >> 14)) >> 4);
  unsigned int v76 = v75 - 879085134 + ((v75 - 879085134) >> 10) - ((v75 - 879085134 + ((v75 - 879085134) >> 10)) >> 5);
  LODWORD(a51) = a3 & (LODWORD(STACK[0x310]) >> 1);
  HIDWORD(a50) = a3 & (HIDWORD(a52) >> 1);
  LODWORD(a56) = v70;
  HIDWORD(v88) = (((v73 ^ 0x903F3380) + (v73 | 0x6FC0CC7F) + 1) ^ v70 & 0x6FC0CC7E) >> 1;
  int v77 = a3 & (v75 >> 1) ^ v75;
  LODWORD(a53) = v66 ^ v69 ^ v72 ^ a3 & ((v72 ^ v69) >> 1);
  HIDWORD(a52) = v77 ^ a53;
  LODWORD(v88) = -v77;
  HIDWORD(v87) = v76 & 0x6FC0CC7F;
  LODWORD(v87) = !(((_BYTE)v73
                  + 32
                  - ((v73 - 787086048) >> 9)
                  + ((v73 - 787086048 - ((v73 - 787086048) >> 9)) >> 5)) & 1);
  int v78 = STACK[0x318];
  LODWORD(STACK[0x410]) = v71;
  LODWORD(STACK[0x318]) = v74;
  HIDWORD(a55) = v76 + 1300749569 - ((v76 + 1300749569) >> 9) - ((v76 + 1300749569 - ((v76 + 1300749569) >> 9)) >> 4);
  HIDWORD(a46) = (v74 ^ v71 ^ v78 ^ HIDWORD(a55)) >> 1;
  uint64_t v79 = (LODWORD(STACK[0x250]) ^ LODWORD(STACK[0x24C]));
  int v80 = STACK[0x328];
  unsigned int v81 = (v67 + 27) ^ 0x9B67EC7F ^ *((_DWORD *)*(&off_18D90 + (v67 ^ 0x12)) + 232);
  LODWORD(v82) = __ROR4__(0, 20) ^ 0xAE6F4F2C;
  HIDWORD(v82) = v82;
  uint64_t v83 = LODWORD(STACK[0x38C]);
  uint64_t v84 = 4 * (LOBYTE(STACK[0x250]) ^ LOBYTE(STACK[0x24C]));
  *(_DWORD *)(STACK[0x378] + v84) = a65 ^ LODWORD(STACK[0x314]) ^ 0xE00D27BF ^ ((((v81 ^ ((v81 & STACK[0x344]) >> 1)) & STACK[0x334]) >> STACK[0x348]) | (((v81 ^ ((v81 & STACK[0x344]) >> 1)) & STACK[0x32C]) << v83));
  uint64_t v85 = LODWORD(STACK[0x40C]);
  *(_DWORD *)(STACK[0x380] + v84) = v85 ^ v80 ^ 0x8CDA8304 ^ (unsigned __int16)(((v82 >> 12) ^ 0xE6A3) - 7298) ^ *((unsigned __int16 *)*(&off_18D90 + (v67 ^ 0x1C)) + ((v82 >> 12) ^ 0xF2CAE6B1) - 6);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _UNKNOWN **, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x3A0] + 8 * v67))(v73, v85, 59043, v83, a3, v79, a4, &off_18D90, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           v87,
           v88,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57);
}

void sub_D5EC()
{
}

#error "12180: call analysis failed (funcsize=4626)"

void sub_12184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,int a55,int a56,int a57,int a58,int a59)
{
  LODWORD(STACK[0x28C]) = a58 ^ 0xCEEAF932;
  LODWORD(STACK[0x288]) = a57 ^ 0x79C04953;
  LODWORD(STACK[0x280]) = a56 ^ 0x32A6819A;
  LODWORD(STACK[0x284]) = a59 ^ 0x84299AD3;
  JUMPOUT(0xF278);
}

void sub_12240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,int a53,int a54)
{
  uint64_t v55 = 8 * (a54 + 54);
  (*(void (**)(unint64_t))(v54 + v55))(STACK[0x380]);
  (*(void (**)(unint64_t))(v54 + v55))(STACK[0x378]);
  JUMPOUT(0x122B8);
}

char *sub_122F4(char *result, char *a2, unint64_t a3)
{
  if (((a2 ^ result) & 7) != 0)
  {
    if ((a3 + 7) >= 8)
    {
      unsigned int v3 = (a3 + 7) >> 3;
      switch(a3 & 7)
      {
        case 1uLL:
          goto LABEL_23;
        case 2uLL:
          goto LABEL_22;
        case 3uLL:
          goto LABEL_21;
        case 4uLL:
          goto LABEL_20;
        case 5uLL:
          goto LABEL_19;
        case 6uLL:
          goto LABEL_18;
        case 7uLL:
          goto LABEL_17;
        default:
          do
          {
            char v15 = *result++;
            *a2++ = v15;
LABEL_17:
            char v16 = *result++;
            *a2++ = v16;
LABEL_18:
            char v17 = *result++;
            *a2++ = v17;
LABEL_19:
            char v18 = *result++;
            *a2++ = v18;
LABEL_20:
            char v19 = *result++;
            *a2++ = v19;
LABEL_21:
            char v20 = *result++;
            *a2++ = v20;
LABEL_22:
            char v21 = *result++;
            *a2++ = v21;
LABEL_23:
            char v22 = *result++;
            *a2++ = v22;
            --v3;
          }
          while (v3);
          break;
      }
    }
  }
  else
  {
    unint64_t v4 = -(int)result & 7;
    switch((int)v4)
    {
      case 1:
        goto LABEL_11;
      case 2:
        goto LABEL_10;
      case 3:
        goto LABEL_9;
      case 4:
        goto LABEL_8;
      case 5:
        goto LABEL_7;
      case 6:
        goto LABEL_6;
      case 7:
        char v5 = *result++;
        *a2++ = v5;
LABEL_6:
        char v6 = *result++;
        *a2++ = v6;
LABEL_7:
        char v7 = *result++;
        *a2++ = v7;
LABEL_8:
        char v8 = *result++;
        *a2++ = v8;
LABEL_9:
        char v9 = *result++;
        *a2++ = v9;
LABEL_10:
        char v10 = *result++;
        *a2++ = v10;
LABEL_11:
        char v11 = *result++;
        *a2++ = v11;
        break;
      default:
        break;
    }
    BOOL v12 = a3 >= v4;
    unint64_t v13 = a3 - v4;
    if (!v12) {
      unint64_t v13 = 0;
    }
    if (v13 >= 8)
    {
      unint64_t v14 = ((v13 >> 3) + 7) >> 3;
      switch((v13 >> 3) & 7)
      {
        case 1uLL:
          goto LABEL_32;
        case 2uLL:
          goto LABEL_31;
        case 3uLL:
          goto LABEL_30;
        case 4uLL:
          goto LABEL_29;
        case 5uLL:
          goto LABEL_28;
        case 6uLL:
          goto LABEL_27;
        case 7uLL:
          goto LABEL_26;
        default:
          do
          {
            uint64_t v23 = *(void *)result;
            result += 8;
            *(void *)a2 = v23;
            a2 += 8;
LABEL_26:
            uint64_t v24 = *(void *)result;
            result += 8;
            *(void *)a2 = v24;
            a2 += 8;
LABEL_27:
            uint64_t v25 = *(void *)result;
            result += 8;
            *(void *)a2 = v25;
            a2 += 8;
LABEL_28:
            uint64_t v26 = *(void *)result;
            result += 8;
            *(void *)a2 = v26;
            a2 += 8;
LABEL_29:
            uint64_t v27 = *(void *)result;
            result += 8;
            *(void *)a2 = v27;
            a2 += 8;
LABEL_30:
            uint64_t v28 = *(void *)result;
            result += 8;
            *(void *)a2 = v28;
            a2 += 8;
LABEL_31:
            uint64_t v29 = *(void *)result;
            result += 8;
            *(void *)a2 = v29;
            a2 += 8;
LABEL_32:
            uint64_t v30 = *(void *)result;
            result += 8;
            *(void *)a2 = v30;
            a2 += 8;
            --v14;
          }
          while (v14);
          break;
      }
    }
    switch(v13 & 7)
    {
      case 1uLL:
        goto LABEL_40;
      case 2uLL:
        goto LABEL_39;
      case 3uLL:
        goto LABEL_38;
      case 4uLL:
        goto LABEL_37;
      case 5uLL:
        goto LABEL_36;
      case 6uLL:
        goto LABEL_35;
      case 7uLL:
        char v31 = *result++;
        *a2++ = v31;
LABEL_35:
        char v32 = *result++;
        *a2++ = v32;
LABEL_36:
        char v33 = *result++;
        *a2++ = v33;
LABEL_37:
        char v34 = *result++;
        *a2++ = v34;
LABEL_38:
        char v35 = *result++;
        *a2++ = v35;
LABEL_39:
        char v36 = *result++;
        *a2++ = v36;
LABEL_40:
        *a2 = *result;
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t sub_12550()
{
  return Logger.logObject.getter();
}

uint64_t sub_12560()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_12570()
{
  return type metadata accessor for Logger();
}

uint64_t sub_12580()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_12590()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_125A0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_125B0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_125C0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_125D0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_BFzukpKGO3cStNGp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BFzukpKGO3cStNGp:");
}

id objc_msgSend_BGiN5h2SLMRO6B9R(void *a1, const char *a2, ...)
{
  return _[a1 BGiN5h2SLMRO6B9R];
}

id objc_msgSend_HkbEJeZjAQnItubK(void *a1, const char *a2, ...)
{
  return _[a1 HkbEJeZjAQnItubK];
}

id objc_msgSend_S08uY31jbmOEDLrH(void *a1, const char *a2, ...)
{
  return _[a1 S08uY31jbmOEDLrH];
}

id objc_msgSend_SOUWv5VjPwXYslMm_noUfOiGjp1iQmKZX_pPGyXmlDbN3mzzHm_iSOZt67ioKsVcqQZ_hjCrdFOLMJN0Cc5Q_lE40aye8U2u533Ka_JRuZv6Feh9qwrGmN_Wn0aIR2B54NCtGQc_B3l3lS18BITy5E4L_UywAszL6AB8Y6LTJ_uNao9X8A82jVmQkK_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SOUWv5VjPwXYslMm:noUfOiGjp1iQmKZX:pPGyXmlDbN3mzzHm:iSOZt67ioKsVcqQZ:hjCrdFOLMJN0Cc5Q:lE40aye8U2u533Ka:JRuZv6Feh9qwrGmN:Wn0aIR2B54NCtGQc:B3l3lS18BITy5E4L:UywAszL6AB8Y6LTJ:uNao9X8A82jVmQkK:completion:");
}

id objc_msgSend_TbX4HHO0pTPaerrJ(void *a1, const char *a2, ...)
{
  return _[a1 TbX4HHO0pTPaerrJ];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_VE7BAlWGDSKrO5xc_hostChallenge_challengeResponse_seid_nonce_HY6FXG20397zwmVg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "VE7BAlWGDSKrO5xc:hostChallenge:challengeResponse:seid:nonce:HY6FXG20397zwmVg:");
}

id objc_msgSend_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "Z8aAH7stm0EYhyxg:xz5EHXEN4FjlhJbi:uhVTXyAfCFn7u0Ue:EQUjQp7JcQbqcPcD:A5wDLa5TFdFZlz3A:TJKMyOe6zn5PdGIr:eCqgGM0WcnHOslnr:eCszfxdv3kUXvhgV:uWp4aZpP2vLhc04Q:QZYtNpvp0hKd248p:oCwPYmtRv8s31KUH:completion:");
}

id objc_msgSend_ZfE6lVphNUVrZcKx_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ZfE6lVphNUVrZcKx:completion:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_challengeResponse(void *a1, const char *a2, ...)
{
  return _[a1 challengeResponse];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dKsJLlNX54lzKt5n_eqF2XJh3hHBJQf2K_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dKsJLlNX54lzKt5n:eqF2XJh3hHBJQf2K:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_djoNSwl5j57W5mfl_eqF2XJh3hHBJQf2K_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "djoNSwl5j57W5mfl:eqF2XJh3hHBJQf2K:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evrtH713YbFfEOzk_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evrtH713YbFfEOzk:completion:");
}

id objc_msgSend_f9MGfLOgnHPuKTrU_HY6FXG20397zwmVg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "f9MGfLOgnHPuKTrU:HY6FXG20397zwmVg:");
}

id objc_msgSend_fetchConfigThrowingWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchConfigThrowingWithCompletion:");
}

id objc_msgSend_fetchConfigWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchConfigWithCompletion:");
}

id objc_msgSend_fetchConfigWithCompletionXPC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchConfigWithCompletionXPC:");
}

id objc_msgSend_fetchGeoCodingsForAddresses_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchGeoCodingsForAddresses:completion:");
}

id objc_msgSend_fetchGeoCodingsForAddressesXPC_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchGeoCodingsForAddressesXPC:completion:");
}

id objc_msgSend_hostChallenge(void *a1, const char *a2, ...)
{
  return _[a1 hostChallenge];
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_k0p7Rchr49btq6wB_HY6FXG20397zwmVg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "k0p7Rchr49btq6wB:HY6FXG20397zwmVg:");
}

id objc_msgSend_k4eQYhyzyebbQqys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "k4eQYhyzyebbQqys:");
}

id objc_msgSend_l7UrdRfCzeduYqtA_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "l7UrdRfCzeduYqtA:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_llNEghuIdfPH7O8I_all_pregeneration_workflowID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "llNEghuIdfPH7O8I:all:pregeneration:workflowID:completion:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_ofLBc0SV56ddaijH_i7D0Lridvo8oYoNd_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ofLBc0SV56ddaijH:i7D0Lridvo8oYoNd:completion:");
}

id objc_msgSend_pRo6qBDnfEL0sBNs_i7D0Lridvo8oYoNd_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pRo6qBDnfEL0sBNs:i7D0Lridvo8oYoNd:completion:");
}

id objc_msgSend_rGvculjlqIwBJaoX_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rGvculjlqIwBJaoX:completion:");
}

id objc_msgSend_rU1LRx5aI44CETG8(void *a1, const char *a2, ...)
{
  return _[a1 rU1LRx5aI44CETG8];
}

id objc_msgSend_registerICloudLoginWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerICloudLoginWithCompletion:");
}

id objc_msgSend_registerICloudLoginWithCompletionXPC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerICloudLoginWithCompletionXPC:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_seid(void *a1, const char *a2, ...)
{
  return _[a1 seid];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_toDictionary(void *a1, const char *a2, ...)
{
  return _[a1 toDictionary];
}

id objc_msgSend_uTtwJoGUgL3N0GVz(void *a1, const char *a2, ...)
{
  return _[a1 uTtwJoGUgL3N0GVz];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unregisterICloudLoginWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterICloudLoginWithCompletion:");
}

id objc_msgSend_unregisterICloudLoginWithCompletionXPC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterICloudLoginWithCompletionXPC:");
}

id objc_msgSend_updateGeoCodingsForAddresses_locations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateGeoCodingsForAddresses:locations:");
}

id objc_msgSend_updateGeoCodingsXPC_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateGeoCodingsXPC:completion:");
}

id objc_msgSend_vffg4lwI2HftPvpO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vffg4lwI2HftPvpO:");
}

id objc_msgSend_xs00laTiKIpDUzDP_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xs00laTiKIpDUzDP:");
}

id objc_msgSend_yNHDWo3TCV(void *a1, const char *a2, ...)
{
  return _[a1 yNHDWo3TCV];
}

id objc_msgSend_zeXRCfLmM5cdkEtz(void *a1, const char *a2, ...)
{
  return _[a1 zeXRCfLmM5cdkEtz];
}