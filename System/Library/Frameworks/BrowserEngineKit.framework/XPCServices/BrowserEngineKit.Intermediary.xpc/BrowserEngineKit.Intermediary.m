int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  int result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = sub_100006570();
  v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsetenv("TMPDIR");
  unsetenv("HOME");
  unsetenv("CFFIXED_USER_HOME");
  if (_set_user_dir_suffix() && confstr(65537, 0, 0))
  {
    v7 = NSTemporaryDirectory();
    v8 = sub_100006580();
    v10 = v9;

    qword_10000C860 = v8;
    *(void *)algn_10000C868 = v10;
    sub_100006560();
    v11 = sub_100006540();
    v12 = sub_1000065E0();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v20 = v3;
      v22 = v14;
      *(_DWORD *)v13 = 136315138;
      v15 = qword_10000C860;
      v16 = *(void *)algn_10000C868;
      swift_bridgeObjectRetain();
      v21 = sub_100001B58(v15, v16, &v22);
      sub_100006600();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Temp directory is %s", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v20);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
    qword_10000C870 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for ServiceDelegate()) init];
    v17 = [self serviceListener];
    qword_10000C878 = (uint64_t)v17;
    [v17 setDelegate:qword_10000C870];
    [v17 resume];
    return 0;
  }
  else
  {
    result = sub_100006650();
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for ServiceDelegate()
{
  return self;
}

id sub_100001A08()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

BOOL sub_100001A3C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

uint64_t sub_100001A6C(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100001A7C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100001AB8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100001AE0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100001B58(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100006600();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100001B58(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100001C2C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100002210((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100002210((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000021C0((uint64_t)v12);
  return v7;
}

uint64_t sub_100001C2C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_100006610();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100001DE8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_100006630();
  if (!v8)
  {
    sub_100006640();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006660();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100001DE8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100001E80(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100002060(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100002060(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100001E80(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100001FF8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006620();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006640();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006590();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006660();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006640();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100001FF8(uint64_t a1, uint64_t a2)
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
  sub_10000226C(&qword_10000C6B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100002060(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000226C(&qword_10000C6B8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100006660();
  __break(1u);
  return result;
}

unsigned char **sub_1000021B0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1000021C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100002210(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000226C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000022B4()
{
  uint64_t v0 = sub_100006570();
  sub_1000061FC(v0, qword_10000C880);
  sub_1000061C4(v0, (uint64_t)qword_10000C880);
  return sub_100006550();
}

void sub_100002334()
{
  qword_10000C898 = 0x64616F6C6E776F64;
  unk_10000C8A0 = 0xE800000000000000;
}

void sub_100002358(uint64_t a1, void *a2)
{
  id v42 = a2;
  uint64_t v3 = sub_100006400();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  unint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000064F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  size_t v11 = self;
  id v12 = [v11 defaultManager];
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  sub_100006490(v13);
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  id v43 = 0;
  v16 = &ServiceDelegate;
  LODWORD(v7) = [v12 removeItemAtURL:v15 error:&v43];

  id v17 = v43;
  if (!v7)
  {
    v18 = v17;
    sub_100006460();

    swift_willThrow();
    swift_errorRetain();
    sub_1000063F0();
    sub_1000063A4(&qword_10000C858, (void (*)(uint64_t))&type metadata accessor for CocoaError.Code);
    LOBYTE(v18) = sub_100006440();
    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if (v18)
    {
LABEL_7:
      swift_errorRelease();
      goto LABEL_9;
    }
    if (qword_10000C620 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_100006570();
    sub_1000061C4(v19, (uint64_t)qword_10000C880);
    swift_errorRetain();
    swift_errorRetain();
    v20 = sub_100006540();
    os_log_type_t v21 = sub_1000065F0();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v40 = (void *)swift_slowAlloc();
      v41 = v22;
      *(_DWORD *)v22 = 138412290;
      swift_errorRetain();
      uint64_t v23 = v4;
      v24 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v43 = v24;
      v16 = &ServiceDelegate;
      sub_100006600();
      void *v40 = v24;
      uint64_t v4 = v23;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "DOCDownloadImportManager.importPlaceholderAtURL failed to delete placeholder file after error: %@", v41, 0xCu);
      sub_10000226C(&qword_10000C818);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_7;
    }
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
LABEL_9:
  id v25 = [v11 defaultManager];
  sub_100006490(v26);
  v28 = v27;
  id v43 = 0;
  unsigned int v29 = objc_msgSend(v25, (SEL)v16[165].count, v27, &v43);

  id v30 = v43;
  if (!v29)
  {
    id v42 = v43;
    id v32 = v43;
    sub_100006460();

    swift_willThrow();
    swift_errorRetain();
    sub_1000063F0();
    sub_1000063A4(&qword_10000C858, (void (*)(uint64_t))&type metadata accessor for CocoaError.Code);
    LOBYTE(v32) = sub_100006440();
    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if ((v32 & 1) == 0)
    {
      if (qword_10000C620 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_100006570();
      sub_1000061C4(v33, (uint64_t)qword_10000C880);
      swift_errorRetain();
      swift_errorRetain();
      v34 = sub_100006540();
      os_log_type_t v35 = sub_1000065F0();
      if (!os_log_type_enabled(v34, v35))
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();

        return;
      }
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = (void *)swift_slowAlloc();
      *(_DWORD *)v36 = 138412290;
      swift_errorRetain();
      v38 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v43 = v38;
      sub_100006600();
      void *v37 = v38;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "DOCDownloadImportManager.importPlaceholderAtURL failed to delete placeholder dir after error: %@", v36, 0xCu);
      sub_10000226C(&qword_10000C818);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    swift_errorRelease();
    return;
  }

  id v31 = v30;
}

uint64_t sub_100002A74(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_1000064F0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_10000226C(&qword_10000C828);
    uint64_t v10 = swift_allocError();
    *size_t v11 = a3;
    id v12 = a3;
    return _swift_continuation_throwingResumeWithError(v9, v10);
  }
  else
  {
    sub_1000064D0();
    (*(void (**)(void, char *, uint64_t))(v6 + 32))(*(void *)(*(void *)(v9 + 64) + 40), v8, v5);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_100002D50(int a1, void *aBlock, uint64_t a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v4 = sub_100006580();
  uint64_t v6 = v5;
  v3[4] = v5;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_10000C850 + dword_10000C850);
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100002E3C;
  return v9(v4, v6);
}

uint64_t sub_100002E3C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *v2;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    uint64_t v8 = (void *)sub_100006450();
    swift_errorRelease();
    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);

    _Block_release(v7);
  }
  else
  {
    ((void (**)(void, void *, void))v7)[2](v7, a1, 0);
    _Block_release(v7);
  }
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_100003184(void *a1, void *a2, void *aBlock, uint64_t a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  uint64_t v11 = (uint64_t (*)(id, id))((char *)&dword_10000C810 + dword_10000C810);
  id v7 = a1;
  id v8 = a2;
  swift_retain();
  uint64_t v9 = (void *)swift_task_alloc();
  v4[6] = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_100003274;
  return v11(v7, v8);
}

uint64_t sub_100003274(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 24);
  id v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();

  swift_release();
  uint64_t v9 = *(void (***)(void, void, void))(v5 + 40);
  if (v3)
  {
    uint64_t v10 = (void *)sub_100006450();
    swift_errorRelease();
    ((void (**)(void, void, void *))v9)[2](v9, 0, v10);

    _Block_release(v9);
  }
  else
  {
    ((void (**)(void, void *, void))v9)[2](v9, a1, 0);
    _Block_release(v9);
  }
  uint64_t v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

uint64_t sub_100003450()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for BEKIntermediary()
{
  return self;
}

uint64_t sub_100003484()
{
  _Block_release(*(const void **)(v0 + 32));
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000034D4()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1000063EC;
  id v7 = (uint64_t (*)(void *, void *, void *, uint64_t))((char *)&dword_10000C7D0 + dword_10000C7D0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_100003594(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1000063EC;
  return v6();
}

uint64_t sub_100003664()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000063EC;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10000C7E0 + dword_10000C7E0);
  return v6(v2, v3, v4);
}

uint64_t sub_100003724(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1000063EC;
  return v7();
}

uint64_t sub_1000037F4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000063EC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10000C7F0 + dword_10000C7F0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1000038C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000065C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1000065B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100003A64(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000065A0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100003A64(uint64_t a1)
{
  uint64_t v2 = sub_10000226C(&qword_10000C7C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100003AC4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100003BA0;
  return v6(a1);
}

uint64_t sub_100003BA0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100003C98()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100003CD0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100003D88;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10000C800 + dword_10000C800);
  return v6(a1, v4);
}

uint64_t sub_100003D88()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100003E7C(uint64_t a1, uint64_t a2)
{
  v2[33] = a1;
  v2[34] = a2;
  uint64_t v3 = sub_100006430();
  v2[35] = v3;
  v2[36] = *(void *)(v3 - 8);
  v2[37] = swift_task_alloc();
  uint64_t v4 = sub_100006530();
  v2[38] = v4;
  v2[39] = *(void *)(v4 - 8);
  v2[40] = swift_task_alloc();
  uint64_t v5 = sub_1000064F0();
  v2[41] = v5;
  v2[42] = *(void *)(v5 - 8);
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  return _swift_task_switch(sub_10000406C, 0, 0);
}

uint64_t sub_10000406C()
{
  uint64_t v56 = v0;
  uint64_t v1 = *(void *)(v0 + 384);
  uint64_t v2 = *(void *)(v0 + 336);
  uint64_t v4 = *(void *)(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 320);
  uint64_t v5 = *(void *)(v0 + 304);
  uint64_t v54 = *(void *)(v0 + 328);
  sub_100006480();
  sub_100006520();
  sub_100006510();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_1000064A0();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(void *)(v0 + 400) = v6;
  *(void *)(v0 + 408) = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v54);
  sub_1000064A0();
  if (qword_10000C628 != -1) {
    swift_once();
  }
  uint64_t v7 = v0 + 208;
  uint64_t v8 = *(void *)(v0 + 384);
  uint64_t v9 = *(void *)(v0 + 328);
  sub_1000064B0();
  v6(v8, v9);
  if (qword_10000C620 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100006570();
  *(void *)(v0 + 416) = sub_1000061C4(v10, (uint64_t)qword_10000C880);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_100006540();
  os_log_type_t v12 = sub_1000065D0();
  v53 = v6;
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = *(void *)(v0 + 264);
    unint64_t v14 = *(void *)(v0 + 272);
    uint64_t v15 = swift_slowAlloc();
    v55[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 240) = sub_100001B58(v13, v14, v55);
    sub_100006600();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    swift_beginAccess();
    sub_1000063A4(&qword_10000C820, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v16 = sub_100006670();
    *(void *)(v0 + 256) = sub_100001B58(v16, v17, v55);
    uint64_t v7 = v0 + 208;
    sub_100006600();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "createPlaceholder for filename: %s at  %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  id v18 = [self defaultManager];
  sub_100006490(v19);
  os_log_type_t v21 = v20;
  *(void *)(v0 + 208) = 0;
  unsigned int v22 = [v18 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:v7];

  uint64_t v23 = *(void **)(v0 + 208);
  if (v22)
  {
    uint64_t v25 = *(void *)(v0 + 368);
    uint64_t v24 = *(void *)(v0 + 376);
    uint64_t v26 = *(void *)(v0 + 328);
    uint64_t v27 = *(void *)(v0 + 336);
    swift_beginAccess();
    id v28 = v23;
    *(unsigned char *)(v0 + 464) = sub_1000064E0();
    unsigned int v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
    *(void *)(v0 + 424) = v29;
    *(void *)(v0 + 432) = (v27 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v29(v25, v24, v26);
    sub_100006500();
    v53(*(void *)(v0 + 368), *(void *)(v0 + 328));
    sub_100006420();
    sub_100006410();
    swift_beginAccess();
    sub_100006470();
    swift_endAccess();
    v41 = sub_100006540();
    os_log_type_t v42 = sub_1000065D0();
    if (os_log_type_enabled(v41, v42))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v55[0] = swift_slowAlloc();
      *(_DWORD *)v44 = 136315138;
      sub_1000063A4(&qword_10000C820, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v45 = sub_100006670();
      *(void *)(v0 + 232) = sub_100001B58(v45, v46, v55);
      sub_100006600();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "DOCDownloadImportManager.importPlaceholderAtURL %s", v44, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v47 = *(void *)(v0 + 352);
    id v48 = [objc_allocWithZone((Class)DOCDownloadImportManager) init];
    *(void *)(v0 + 440) = v48;
    sub_100006490(v49);
    uint64_t v51 = v50;
    *(void *)(v0 + 448) = v50;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v47;
    *(void *)(v0 + 24) = sub_100004CBC;
    uint64_t v52 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_100002A74;
    *(void *)(v0 + 104) = &unk_1000085D8;
    *(void *)(v0 + 112) = v52;
    [v48 importPlaceholderAtURLToDownloadsDirectory:v51 completion:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
  else
  {
    id v30 = v23;
    sub_100006460();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    id v31 = sub_100006540();
    os_log_type_t v32 = sub_1000065F0();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      v34 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 138412290;
      swift_errorRetain();
      uint64_t v35 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 248) = v35;
      sub_100006600();
      void *v34 = v35;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Failed to create placeholder dir: %@", v33, 0xCu);
      sub_10000226C(&qword_10000C818);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }
    swift_errorRelease();
    v36 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v37 = *(void *)(v0 + 376);
    uint64_t v38 = *(void *)(v0 + 328);
    v36(*(void *)(v0 + 392), v38);
    v36(v37, v38);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v39 = *(uint64_t (**)(void))(v0 + 8);
    return v39(0);
  }
}

uint64_t sub_100004CBC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 456) = v1;
  if (v1) {
    uint64_t v2 = sub_1000051C8;
  }
  else {
    uint64_t v2 = sub_100004DF8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100004DF8()
{
  uint64_t v35 = v0;
  uint64_t v2 = *(void **)(v0 + 440);
  uint64_t v1 = *(void **)(v0 + 448);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 424);
  uint64_t v4 = *(void *)(v0 + 360);
  uint64_t v5 = *(void *)(v0 + 344);
  uint64_t v6 = *(void *)(v0 + 328);
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0 + 336) + 32))(v4, *(void *)(v0 + 352), v6);

  v3(v5, v4, v6);
  uint64_t v7 = sub_100006540();
  os_log_type_t v8 = sub_1000065D0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v9 = *(void *)(v0 + 344);
    uint64_t v10 = *(void *)(v0 + 328);
    uint64_t v11 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315394;
    sub_1000063A4(&qword_10000C820, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v12 = sub_100006670();
    *(void *)(v0 + 216) = sub_100001B58(v12, v13, &v34);
    sub_100006600();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v14 = sub_100006670();
    *(void *)(v0 + 224) = sub_100001B58(v14, v15, &v34);
    sub_100006600();
    swift_bridgeObjectRelease();
    v33(v9, v10);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "DOCDownloadImportManager.importPlaceholderAtURL for %s returned %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(void, void))(v0 + 400))(*(void *)(v0 + 344), *(void *)(v0 + 328));
  }

  BOOL v16 = sub_1000064E0();
  id v17 = objc_allocWithZone((Class)NSSecurityScopedURLWrapper);
  sub_100006490(v18);
  v20 = v19;
  id v32 = [v17 initWithURL:v19];

  if (v16) {
    sub_1000064C0();
  }
  int v21 = *(unsigned __int8 *)(v0 + 464);
  unsigned int v22 = *(void **)(v0 + 392);
  uint64_t v23 = *(void *)(v0 + 376);
  uint64_t v25 = *(void *)(v0 + 288);
  uint64_t v24 = *(void *)(v0 + 296);
  uint64_t v26 = *(void *)(v0 + 280);
  (*(void (**)(void, void))(v0 + 400))(*(void *)(v0 + 360), *(void *)(v0 + 328));
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
  sub_100002358(v23, v22);
  if (v21 == 1) {
    sub_1000064C0();
  }
  uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
  uint64_t v28 = *(void *)(v0 + 376);
  uint64_t v29 = *(void *)(v0 + 328);
  v27(*(void *)(v0 + 392), v29);
  v27(v28, v29);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v30 = *(uint64_t (**)(id))(v0 + 8);
  return v30(v32);
}

uint64_t sub_1000051C8()
{
  uint64_t v1 = *(void **)(v0 + 448);
  uint64_t v2 = *(void **)(v0 + 440);
  int v3 = *(unsigned __int8 *)(v0 + 464);
  uint64_t v4 = *(void **)(v0 + 392);
  uint64_t v5 = *(void *)(v0 + 376);
  uint64_t v7 = *(void *)(v0 + 288);
  uint64_t v6 = *(void *)(v0 + 296);
  uint64_t v8 = *(void *)(v0 + 280);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);

  sub_100002358(v5, v4);
  if (v3 == 1) {
    sub_1000064C0();
  }
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
  uint64_t v10 = *(void *)(v0 + 376);
  uint64_t v11 = *(void *)(v0 + 328);
  v9(*(void *)(v0 + 392), v11);
  v9(v10, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_100005350(uint64_t a1, uint64_t a2)
{
  v2[30] = a1;
  v2[31] = a2;
  uint64_t v3 = sub_100006430();
  v2[32] = v3;
  v2[33] = *(void *)(v3 - 8);
  v2[34] = swift_task_alloc();
  uint64_t v4 = sub_1000064F0();
  v2[35] = v4;
  v2[36] = *(void *)(v4 - 8);
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  return _swift_task_switch(sub_1000054A0, 0, 0);
}

uint64_t sub_1000054A0()
{
  uint64_t v61 = v0;
  if (qword_10000C620 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void **)(v0 + 240);
  uint64_t v1 = *(void **)(v0 + 248);
  uint64_t v3 = sub_100006570();
  *(void *)(v0 + 336) = sub_1000061C4(v3, (uint64_t)qword_10000C880);
  id v4 = v2;
  id v5 = v1;
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = sub_100006540();
  os_log_type_t v9 = sub_1000065D0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v12 = *(void **)(v0 + 240);
  uint64_t v11 = *(void **)(v0 + 248);
  if (v10)
  {
    os_log_type_t type = v9;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412546;
    *(void *)(v0 + 224) = v12;
    id v15 = v12;
    sub_100006600();
    void *v14 = v12;

    *(_WORD *)(v13 + 12) = 2112;
    *(void *)(v0 + 232) = v11;
    id v16 = v11;
    sub_100006600();
    v14[1] = v11;

    _os_log_impl((void *)&_mh_execute_header, v8, type, "replacePlaceholder placeholderFileWrapper: %@, downloadedFileWrapper %@", (uint8_t *)v13, 0x16u);
    sub_10000226C(&qword_10000C818);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v17 = *(void *)(v0 + 320);
  uint64_t v18 = *(void *)(v0 + 328);
  uint64_t v19 = *(void *)(v0 + 280);
  uint64_t v20 = *(void *)(v0 + 288);
  int v21 = *(void **)(v0 + 248);
  id v22 = [*(id *)(v0 + 240) url];
  sub_1000064D0();

  *(unsigned char *)(v0 + 392) = sub_1000064E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v17, v18, v19);
  id v23 = v21;
  uint64_t v24 = sub_100006540();
  os_log_type_t v25 = sub_1000065D0();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v27 = *(void *)(v0 + 320);
  if (v26)
  {
    uint64_t v54 = *(void *)(v0 + 312);
    typea = v24;
    os_log_type_t v57 = v25;
    uint64_t v28 = *(void *)(v0 + 280);
    uint64_t v29 = *(void *)(v0 + 288);
    id v53 = *(id *)(v0 + 248);
    uint64_t v30 = swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315394;
    sub_1000063A4(&qword_10000C820, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v31 = sub_100006670();
    *(void *)(v0 + 208) = sub_100001B58(v31, v32, &v60);
    sub_100006600();
    swift_bridgeObjectRelease();
    uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    uint64_t v59 = (v29 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v33(v27, v28);
    *(_WORD *)(v30 + 12) = 2080;
    id v34 = [v53 url];
    sub_1000064D0();

    uint64_t v35 = sub_100006670();
    unint64_t v37 = v36;
    v33(v54, v28);
    *(void *)(v0 + 216) = sub_100001B58(v35, v37, &v60);
    sub_100006600();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, typea, v57, "DOCDownloadImportManager.replacePlaceholder %s with %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v38 = *(void *)(v0 + 288);
    uint64_t v39 = *(void **)(v0 + 248);
    uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
    uint64_t v59 = (v38 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v33(v27, *(void *)(v0 + 280));
  }
  *(void *)(v0 + 344) = v33;
  uint64_t v40 = *(void *)(v0 + 312);
  uint64_t v58 = *(void *)(v0 + 296);
  uint64_t v41 = *(void *)(v0 + 280);
  os_log_type_t v42 = *(void **)(v0 + 248);
  id v43 = [objc_allocWithZone((Class)DOCDownloadImportManager) init];
  *(void *)(v0 + 352) = v43;
  sub_100006490(v44);
  uint64_t v46 = v45;
  *(void *)(v0 + 360) = v45;
  id v47 = [v42 url];
  sub_1000064D0();

  sub_100006490(v48);
  uint64_t v50 = v49;
  *(void *)(v0 + 368) = v49;
  *(void *)(v0 + 376) = v59;
  v33(v40, v41);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v58;
  *(void *)(v0 + 24) = sub_100005AC8;
  uint64_t v51 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_100002A74;
  *(void *)(v0 + 104) = &unk_100008548;
  *(void *)(v0 + 112) = v51;
  [v43 replacePlaceholder:v46 withFinalFileURL:v50 completionHandler:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_100005AC8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 384) = v1;
  if (v1) {
    uint64_t v2 = sub_1000060D0;
  }
  else {
    uint64_t v2 = sub_100005BD8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100005BD8()
{
  uint64_t v22 = v0;
  uint64_t v2 = *(void **)(v0 + 360);
  uint64_t v1 = *(void **)(v0 + 368);
  uint64_t v3 = *(void **)(v0 + 352);
  (*(void (**)(void, void, void))(*(void *)(v0 + 288) + 32))(*(void *)(v0 + 304), *(void *)(v0 + 296), *(void *)(v0 + 280));

  uint64_t v4 = sub_100006540();
  os_log_type_t v5 = sub_1000065D0();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)id v6 = 136315138;
    swift_beginAccess();
    sub_1000063A4(&qword_10000C820, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v7 = sub_100006670();
    *(void *)(v0 + 200) = sub_100001B58(v7, v8, &v21);
    sub_100006600();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "DOCDownloadImportManager.replacePlaceholder returned %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  BOOL v9 = sub_1000064E0();
  sub_100006420();
  sub_100006410();
  swift_beginAccess();
  sub_100006470();
  uint64_t v10 = *(void *)(v0 + 272);
  uint64_t v11 = *(void *)(v0 + 256);
  uint64_t v12 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 264) + 8);
  swift_endAccess();
  (*v12)(v10, v11);
  id v13 = objc_allocWithZone((Class)NSSecurityScopedURLWrapper);
  sub_100006490(v14);
  id v16 = v15;
  id v17 = [v13 initWithURL:v15];

  if (v9) {
    sub_1000064C0();
  }
  int v18 = *(unsigned __int8 *)(v0 + 392);
  (*(void (**)(void, void))(v0 + 344))(*(void *)(v0 + 304), *(void *)(v0 + 280));
  if (v18 == 1) {
    sub_1000064C0();
  }
  (*(void (**)(void, void))(v0 + 344))(*(void *)(v0 + 328), *(void *)(v0 + 280));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = *(uint64_t (**)(id))(v0 + 8);
  return v19(v17);
}

uint64_t sub_1000060D0()
{
  uint64_t v1 = *(void **)(v0 + 360);
  uint64_t v2 = *(void **)(v0 + 368);
  uint64_t v3 = *(void **)(v0 + 352);
  int v4 = *(unsigned __int8 *)(v0 + 392);
  swift_willThrow();

  if (v4 == 1) {
    sub_1000064C0();
  }
  (*(void (**)(void, void))(v0 + 344))(*(void *)(v0 + 328), *(void *)(v0 + 280));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1000061C4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000061FC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006260()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000062A8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *os_log_type_t v5 = v1;
  v5[1] = sub_100003D88;
  id v6 = (uint64_t (*)(int, void *, uint64_t))((char *)&dword_10000C830 + dword_10000C830);
  return v6(v2, v3, v4);
}

uint64_t sub_100006364()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000063A4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000063F0()
{
  return static CocoaError.fileNoSuchFile.getter();
}

uint64_t sub_100006400()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t sub_100006410()
{
  return URLResourceValues.ubiquitousItemIsExcludedFromSync.setter();
}

uint64_t sub_100006420()
{
  return URLResourceValues.init()();
}

uint64_t sub_100006430()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t sub_100006440()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t sub_100006450()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100006460()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100006470()
{
  return URL.setResourceValues(_:)();
}

uint64_t sub_100006480()
{
  return static URL.temporaryDirectory.getter();
}

void sub_100006490(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000064A0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_1000064B0()
{
  return URL.appendingPathExtension(_:)();
}

void sub_1000064C0()
{
}

uint64_t sub_1000064D0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

BOOL sub_1000064E0()
{
  return URL.startAccessingSecurityScopedResource()();
}

uint64_t sub_1000064F0()
{
  return type metadata accessor for URL();
}

uint64_t sub_100006500()
{
  return Data.write(to:options:)();
}

uint64_t sub_100006510()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100006520()
{
  return UUID.init()();
}

uint64_t sub_100006530()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100006540()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006550()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006560()
{
  return Logger.init()();
}

uint64_t sub_100006570()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006580()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_100006590()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000065A0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000065B0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000065C0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_1000065D0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000065E0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000065F0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006600()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006610()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006620()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006630()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006640()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006650()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006660()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006670()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}