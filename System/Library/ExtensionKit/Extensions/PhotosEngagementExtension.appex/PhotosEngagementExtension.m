uint64_t sub_100002394(uint64_t a1)
{
  uint64_t v1;

  *(void *)(v1 + 320) = a1;
  return _swift_task_switch(sub_1000023B4, 0, 0);
}

uint64_t sub_1000023B4()
{
  uint64_t v30 = *(void *)(v0 + 320);
  sub_100002CF4(&qword_100008528);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100003800;
  strcpy((char *)(inited + 32), "json-payload");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  sub_100002CF4(&qword_100008530);
  v2 = (__n128 *)swift_initStackObject();
  sub_100003608(v2, v3, v4, v5, v6, v7, v8, v9, v0 + 264, v30, v10);
  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = 0xE800000000000000;
  sub_100002CF4(&qword_100008538);
  uint64_t v13 = swift_initStackObject();
  *(_OWORD *)(v13 + 16) = xmmword_100003810;
  *(void *)(v13 + 32) = 0xD000000000000020;
  *(void *)(v13 + 40) = 0x80000001000038D0;
  sub_100002CF4(&qword_100008540);
  uint64_t v14 = swift_initStackObject();
  *(_OWORD *)(v14 + 16) = xmmword_100003800;
  *(void *)(v14 + 32) = 0x65736E6F70736572;
  *(void *)(v14 + 40) = 0xE800000000000000;
  *(void *)(v14 + 48) = sub_100003640();
  sub_100002CF4(&qword_100008548);
  *(void *)(v13 + 48) = sub_100003640();
  *(void *)(v13 + 56) = 0xD000000000000020;
  *(void *)(v13 + 64) = 0x8000000100003900;
  v15 = (__n128 *)swift_initStackObject();
  sub_100003608(v15, v16, v17, v18, v19, v20, v21, v22, v29, v31, v23);
  *(void *)(v24 + 32) = v25;
  *(void *)(v24 + 40) = 0xE800000000000000;
  v15[3].n128_u64[0] = sub_100003640();
  *(void *)(v13 + 72) = sub_100003640();
  sub_100002CF4(&qword_100008550);
  v2[3].n128_u64[0] = sub_100003640();
  sub_100002CF4(&qword_100008558);
  *(void *)(inited + 48) = sub_100003640();
  sub_100002CF4(&qword_100008560);
  uint64_t v26 = sub_100003640();
  v32[3] = sub_100002CF4(&qword_100008568);
  uint64_t *v32 = v26;
  v27 = *(uint64_t (**)(void))(v0 + 8);
  return v27();
}

uint64_t sub_10000270C(int a1, void *aBlock)
{
  *(void *)(v2 + 80) = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  sub_100003680();
  swift_unknownObjectRelease();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 88) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_1000027D8;
  return sub_100002394(v2 + 16);
}

uint64_t sub_1000027D8()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  sub_1000035F8();
  *uint64_t v5 = v4;
  uint64_t v6 = *v1;
  *uint64_t v5 = *v1;
  swift_task_dealloc();
  sub_100003548(v4 + 48);
  uint64_t v7 = *(void (***)(void, void, void))(v3 + 80);
  if (v2)
  {
    uint64_t v8 = (void *)sub_100003630();
    swift_errorRelease();
    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);

    _Block_release(v7);
  }
  else
  {
    sub_100003598((void *)(v4 + 16), *(void *)(v4 + 40));
    uint64_t v9 = sub_100003690();
    v7[2](v7, v9, 0);
    _Block_release(v7);
    swift_unknownObjectRelease();
    sub_100003548(v4 + 16);
  }
  __n128 v10 = *(uint64_t (**)(void))(v6 + 8);
  return v10();
}

uint64_t sub_100002988(uint64_t a1, uint64_t a2)
{
  sub_100002CF4(&qword_1000084E8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100003670();
  sub_100002D38((uint64_t)v5, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_1000084F8;
  v8[5] = v7;
  sub_1000030C4((uint64_t)v5, (uint64_t)&unk_100008508, (uint64_t)v8);
  return swift_release();
}

id sub_100002A8C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosEngagementExtension();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100002AE4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosEngagementExtension();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PhotosEngagementExtension()
{
  return self;
}

uint64_t sub_100002B3C()
{
  swift_unknownObjectRelease();
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100002B7C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  objc_super v2 = *(void **)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)sub_100003624(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_100002C2C;
  uint64_t v6 = (uint64_t (*)(int, void *))((char *)&dword_1000084D8 + dword_1000084D8);
  return v6(v1, v2);
}

uint64_t sub_100002C2C()
{
  sub_1000035E0();
  uint64_t v1 = *v0;
  sub_1000035F8();
  void *v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_100002CF4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100002D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100002D60(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1000035DC;
  return v6();
}

uint64_t sub_100002E30()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_100003624(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_1000035DC;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000084F0 + dword_1000084F0);
  return v7(v1, v2, v3);
}

uint64_t sub_100002EEC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1000035DC;
  return v7();
}

uint64_t sub_100002FBC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100002FFC(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_100003624(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_1000035DC;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100008500 + dword_100008500);
  return v9(a1, v3, v4, v5);
}

uint64_t sub_1000030C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100003670();
  if (sub_10000322C(a1, 1, v6) == 1)
  {
    sub_100003254(a1);
  }
  else
  {
    sub_100003660();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100003650();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000322C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100003254(uint64_t a1)
{
  uint64_t v2 = sub_100002CF4(&qword_1000084E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000032B4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100003390;
  return v6(a1);
}

uint64_t sub_100003390()
{
  sub_1000035E0();
  uint64_t v1 = *v0;
  sub_1000035F8();
  void *v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_10000345C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100003494(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_100003624(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_100002C2C;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100008510 + dword_100008510);
  return v7(a1, v3);
}

uint64_t sub_100003548(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *sub_100003598(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

__n128 sub_100003608(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11)
{
  __n128 result = a11;
  a1[1] = a11;
  return result;
}

uint64_t sub_100003624(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_100003630()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100003640()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_100003650()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100003660()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100003670()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100003680()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100003690()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_release()
{
  return _swift_release();
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