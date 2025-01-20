void sub_100003A98(void *a1, void (*a2)(void), void (*a3)(void), uint64_t a4)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  void (*v20)(void);
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(void);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v41 = a2;
  v42 = a4;
  sub_100004AA0(&qword_10000C220);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006DF8();
  v43 = *(void *)(v8 - 8);
  v44 = v8;
  v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v39 - v12;
  if (!a1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v14 = [a1 uniqueIdentifier];
  if (v14)
  {
    v15 = v14;
    v16 = sub_100006E18();
    v18 = v17;

    if (v16 == 0xD000000000000017 && v18 == 0x8000000100007430)
    {
      swift_bridgeObjectRelease();
LABEL_7:
      v20 = a3;
      sub_100006DA8();
      v21 = sub_100006DE8();
      v22 = sub_100006E98();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        v46 = swift_slowAlloc();
        *(_DWORD *)v23 = 136315138;
        v45 = sub_100004CB8(0xD000000000000031, 0x80000001000073F0, &v46);
        sub_100006EA8();
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "%s: handling image creation CFU", v23, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v43 + 8))(v13, v44);
      v24 = (void *)v40;
      v25 = v41;
      v26 = sub_100006E78();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v7, 1, 1, v26);
      sub_100006E58();
      v27 = v25;
      v28 = v24;
      v29 = sub_100006E48();
      v30 = (void *)swift_allocObject();
      v30[2] = v29;
      v30[3] = &protocol witness table for MainActor;
      v30[4] = v28;
      v30[5] = v25;
      sub_1000042DC((uint64_t)v7, (uint64_t)&unk_10000C230, (uint64_t)v30);
      swift_release();
      a3 = v20;
LABEL_14:
      if (a3)
      {
        a3(1);
        return;
      }
      goto LABEL_17;
    }
    v19 = sub_100006F18();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_7;
    }
  }
  sub_100006DA8();
  v7 = a1;
  v31 = sub_100006DE8();
  v32 = sub_100006E98();
  if (!os_log_type_enabled(v31, v32))
  {

    (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v44);
    goto LABEL_14;
  }
  v41 = a3;
  v33 = swift_slowAlloc();
  v40 = swift_slowAlloc();
  v46 = v40;
  *(_DWORD *)v33 = 136315394;
  v45 = sub_100004CB8(0xD000000000000031, 0x80000001000073F0, &v46);
  sub_100006EA8();
  *(_WORD *)(v33 + 12) = 2080;
  v34 = [v7 uniqueIdentifier];
  if (v34)
  {
    v35 = v34;
    v36 = sub_100006E18();
    v38 = v37;

    v45 = sub_100004CB8(v36, v38, &v46);
    sub_100006EA8();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "%s: no special handling for CFU id %s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v44);
    a3 = v41;
    goto LABEL_14;
  }
LABEL_18:

  __break(1u);
}

uint64_t sub_100004018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a5;
  sub_100006E58();
  v5[3] = sub_100006E48();
  uint64_t v7 = sub_100006E38();
  v5[4] = v7;
  v5[5] = v6;
  return _swift_task_switch(sub_1000040B0, v7, v6);
}

void sub_1000040B0()
{
  if (*(void *)(v0 + 16))
  {
    v2 = (void (__cdecl *)())((char *)&dword_10000C248 + dword_10000C248);
    v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 48) = v1;
    void *v1 = v0;
    v1[1] = sub_10000415C;
    v2();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000415C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return _swift_task_switch(sub_10000427C, v3, v2);
}

uint64_t sub_10000427C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000042DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006E78();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100006E68();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100006B70(a1, &qword_10000C220);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100006E38();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100004574(char a1, uint64_t a2)
{
  uint64_t v4 = sub_100006DF8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006DA8();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v8 = sub_100006DE8();
  os_log_type_t v9 = sub_100006E98();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v15 = v4;
    uint64_t v10 = swift_slowAlloc();
    v13 = (void *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v17 = v14;
    *(_DWORD *)uint64_t v10 = 136315650;
    uint64_t v16 = sub_100004CB8(0xD000000000000019, 0x80000001000074D0, &v17);
    sub_100006EA8();
    *(_WORD *)(v10 + 12) = 1024;
    LODWORD(v16) = a1 & 1;
    sub_100006EA8();
    *(_WORD *)(v10 + 18) = 2112;
    if (a2)
    {
      swift_errorRetain();
      uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v16 = v11;
      sub_100006EA8();
    }
    else
    {
      uint64_t v16 = 0;
      sub_100006EA8();
      uint64_t v11 = 0;
    }
    void *v13 = v11;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s completed with success %{BOOL}d, error %@", (uint8_t *)v10, 0x1Cu);
    sub_100004AA0(&qword_10000C250);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v15);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void sub_100004888(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_1000049E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CSFFollowUpExtension();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CSFFollowUpExtension()
{
  return self;
}

uint64_t sub_100004A40(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100004A50()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100004A88(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_100004AA0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004AE4(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100004BC0;
  return v6(a1);
}

uint64_t sub_100004BC0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004CB8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100004D8C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006C74((uint64_t)v12, *a3);
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
      sub_100006C74((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006C24((uint64_t)v12);
  return v7;
}

uint64_t sub_100004D8C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006EB8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100004F48(a5, a6);
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
  uint64_t v8 = sub_100006ED8();
  if (!v8)
  {
    sub_100006EE8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006EF8();
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

uint64_t sub_100004F48(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100004FE0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000051C0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000051C0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100004FE0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005158(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006EC8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006EE8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006E28();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006EF8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006EE8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005158(uint64_t a1, uint64_t a2)
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
  sub_100004AA0(&qword_10000C268);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000051C0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004AA0(&qword_10000C268);
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
  uint64_t result = sub_100006EF8();
  __break(1u);
  return result;
}

uint64_t sub_100005310()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100005358(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  int64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *int64_t v8 = v2;
  v8[1] = sub_100005418;
  return sub_100004018(a1, v4, v5, v7, v6);
}

uint64_t sub_100005418()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000550C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100005544(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100005418;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10000C238 + dword_10000C238);
  return v6(a1, v4);
}

uint64_t sub_1000055FC(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t v4 = sub_100006DF8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006DA8();
  uint64_t v8 = sub_100006DE8();
  os_log_type_t v9 = sub_100006E98();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    v13[1] = a2;
    size_t v11 = (uint8_t *)v10;
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)size_t v11 = 136315138;
    v13[2] = sub_100004CB8(0xD000000000000029, 0x80000001000077A0, &v14);
    sub_100006EA8();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (a1) {
    return a1(0);
  }
  __break(1u);
  return result;
}

void sub_1000057F8()
{
  id v0 = [self defaultWorkspace];
  if (v0)
  {
    uint64_t v1 = v0;
    NSString v2 = sub_100006E08();
    v4[4] = sub_100004574;
    v4[5] = 0;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 1107296256;
    v4[2] = sub_100004888;
    v4[3] = &unk_100008468;
    uint64_t v3 = _Block_copy(v4);
    [v1 openApplicationWithBundleIdentifier:v2 usingConfiguration:0 completionHandler:v3];
    _Block_release(v3);
  }
  else
  {
    __break(1u);
  }
}

id sub_100005900()
{
  uint64_t v0 = sub_100006DF8();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v27[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100004AA0(&qword_10000C258);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v27[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100006D98();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  size_t v11 = &v27[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  v13 = &v27[-v12];
  sub_100006D88();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    return (id)sub_100006B70((uint64_t)v6, &qword_10000C258);
  }
  uint64_t v31 = v1;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v13, v6, v7);
  sub_100006DA8();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v11, v13, v7);
  uint64_t v15 = sub_100006DE8();
  os_log_type_t v16 = sub_100006E98();
  int v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v30 = v0;
    uint64_t v19 = v18;
    uint64_t v29 = swift_slowAlloc();
    uint64_t v33 = v29;
    *(_DWORD *)uint64_t v19 = 136315394;
    int v28 = v17;
    uint64_t v32 = sub_100004CB8(0xD000000000000022, 0x8000000100007530, &v33);
    sub_100006EA8();
    *(_WORD *)(v19 + 12) = 2080;
    sub_100006BCC();
    uint64_t v20 = sub_100006F08();
    uint64_t v32 = sub_100004CB8(v20, v21, &v33);
    sub_100006EA8();
    swift_bridgeObjectRelease();
    v22 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    v22(v11, v7);
    _os_log_impl((void *)&_mh_execute_header, v15, (os_log_type_t)v28, "%s launching app store link %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(unsigned char *, uint64_t))(v31 + 8))(v3, v30);
  }
  else
  {
    v22 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    v22(v11, v7);

    (*(void (**)(unsigned char *, uint64_t))(v31 + 8))(v3, v0);
  }
  id result = [self defaultWorkspace];
  if (result)
  {
    v24 = result;
    sub_100006D78(v23);
    v26 = v25;
    [v24 openURL:v25 configuration:0 completionHandler:0];

    return (id)((uint64_t (*)(unsigned char *, uint64_t))v22)(v13, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100005D74()
{
  uint64_t v1 = sub_100006DF8();
  v0[9] = v1;
  v0[10] = *(void *)(v1 - 8);
  v0[11] = swift_task_alloc();
  v0[12] = swift_task_alloc();
  v0[13] = swift_task_alloc();
  v0[14] = swift_task_alloc();
  uint64_t v2 = sub_100006DB8();
  v0[15] = v2;
  v0[16] = *(void *)(v2 - 8);
  v0[17] = swift_task_alloc();
  sub_100006E58();
  v0[18] = sub_100006E48();
  uint64_t v4 = sub_100006E38();
  v0[19] = v4;
  v0[20] = v3;
  return _swift_task_switch(sub_100005EE8, v4, v3);
}

uint64_t sub_100005EE8()
{
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = v0[15];
  sub_100006DD8();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for FollowUp.Feature.adm(_:), v3);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[21] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100005FC4;
  uint64_t v5 = v0[17];
  return static FollowUp.clearCFU(_:)(v5);
}

uint64_t sub_100005FC4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 136);
  uint64_t v4 = *(void *)(*v1 + 128);
  uint64_t v5 = *(void *)(*v1 + 120);
  *(void *)(*v1 + 176) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 160);
  uint64_t v7 = *(void *)(v2 + 152);
  if (v0) {
    uint64_t v8 = sub_1000065C4;
  }
  else {
    uint64_t v8 = sub_10000615C;
  }
  return _swift_task_switch(v8, v7, v6);
}

id sub_10000615C()
{
  v27 = v0;
  swift_release();
  sub_100006DA8();
  uint64_t v1 = sub_100006DE8();
  os_log_type_t v2 = sub_100006E98();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "ADM CFU was successfully cleared", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[14];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];

  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v7(v4, v5);
  id result = [self defaultWorkspace];
  if (result)
  {
    uint64_t v9 = result;
    NSString v10 = sub_100006E08();
    unsigned int v11 = [v9 applicationIsInstalled:v10];

    if (v11)
    {
      sub_100006DA8();
      uint64_t v12 = sub_100006DE8();
      os_log_type_t v13 = sub_100006E98();
      BOOL v14 = os_log_type_enabled(v12, v13);
      uint64_t v15 = v0[13];
      uint64_t v16 = v0[9];
      if (v14)
      {
        int v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        *(_DWORD *)int v17 = 136315138;
        v0[6] = sub_100004CB8(0xD000000000000022, 0x8000000100007480, &v26);
        sub_100006EA8();
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s: Image Playground is installed, will launch the app", v17, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v7(v15, v16);
        sub_1000057F8();
      }
      else
      {

        v7(v15, v16);
        sub_1000057F8();
      }
    }
    else
    {
      sub_100006DA8();
      uint64_t v18 = sub_100006DE8();
      os_log_type_t v19 = sub_100006E98();
      BOOL v20 = os_log_type_enabled(v18, v19);
      uint64_t v21 = v0[12];
      uint64_t v22 = v0[9];
      if (v20)
      {
        uint64_t v25 = v0[12];
        v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        *(_DWORD *)v23 = 136315138;
        v0[5] = sub_100004CB8(0xD000000000000022, 0x8000000100007480, &v26);
        sub_100006EA8();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "%s: Image Playground is not found, opening App Store page", v23, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v7(v25, v22);
      }
      else
      {

        v7(v21, v22);
      }
      sub_100005900();
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v24 = (uint64_t (*)(void))v0[1];
    return (id)v24();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000065C4()
{
  uint64_t v32 = v0;
  swift_release();
  sub_100006DA8();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100006DE8();
  os_log_type_t v2 = sub_100006E88();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v27 = v0[10];
    uint64_t v28 = v0[9];
    uint64_t v30 = v0[11];
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_getErrorValue();
    uint64_t v4 = sub_100006F28();
    v0[8] = sub_100004CB8(v4, v5, &v31);
    sub_100006EA8();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "error clearing ADM CFU %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v6(v30, v28);
  }
  else
  {
    uint64_t v8 = v0[10];
    uint64_t v7 = v0[11];
    uint64_t v9 = v0[9];
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v6(v7, v9);
  }
  id result = [self defaultWorkspace];
  if (result)
  {
    unsigned int v11 = result;
    NSString v12 = sub_100006E08();
    unsigned int v13 = [v11 applicationIsInstalled:v12];

    if (v13)
    {
      sub_100006DA8();
      BOOL v14 = sub_100006DE8();
      os_log_type_t v15 = sub_100006E98();
      BOOL v16 = os_log_type_enabled(v14, v15);
      uint64_t v17 = v0[13];
      uint64_t v18 = v0[9];
      if (v16)
      {
        os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
        uint64_t v31 = swift_slowAlloc();
        *(_DWORD *)os_log_type_t v19 = 136315138;
        v0[6] = sub_100004CB8(0xD000000000000022, 0x8000000100007480, &v31);
        sub_100006EA8();
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s: Image Playground is installed, will launch the app", v19, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      v6(v17, v18);
      sub_1000057F8();
    }
    else
    {
      sub_100006DA8();
      BOOL v20 = sub_100006DE8();
      os_log_type_t v21 = sub_100006E98();
      BOOL v22 = os_log_type_enabled(v20, v21);
      uint64_t v23 = v0[12];
      uint64_t v24 = v0[9];
      if (v22)
      {
        uint64_t v29 = v0[12];
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        uint64_t v31 = swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = 136315138;
        v0[5] = sub_100004CB8(0xD000000000000022, 0x8000000100007480, &v31);
        sub_100006EA8();
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "%s: Image Playground is not found, opening App Store page", v25, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v6(v29, v24);
      }
      else
      {

        v6(v23, v24);
      }
      sub_100005900();
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v26 = (uint64_t (*)(void))v0[1];
    return (id)v26();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100006B58(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006B68()
{
  return swift_release();
}

uint64_t sub_100006B70(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004AA0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100006BCC()
{
  unint64_t result = qword_10000C260;
  if (!qword_10000C260)
  {
    sub_100006D98();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C260);
  }
  return result;
}

uint64_t sub_100006C24(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006C74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006CD4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void type metadata accessor for FLUpdateResult()
{
  if (!qword_10000C270)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000C270);
    }
  }
}

uint64_t sub_100006D44()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100006D78(NSURL *retstr@<X8>)
{
}

uint64_t sub_100006D88()
{
  return URL.init(string:)();
}

uint64_t sub_100006D98()
{
  return type metadata accessor for URL();
}

uint64_t sub_100006DA8()
{
  return static FeaturesLogger.cfu.getter();
}

uint64_t sub_100006DB8()
{
  return type metadata accessor for FollowUp.Feature();
}

uint64_t sub_100006DD8()
{
  return type metadata accessor for FollowUp();
}

uint64_t sub_100006DE8()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006DF8()
{
  return type metadata accessor for Logger();
}

NSString sub_100006E08()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006E18()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_100006E28()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006E38()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100006E48()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100006E58()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100006E68()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100006E78()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100006E88()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006E98()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100006EA8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006EB8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006EC8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006ED8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006EE8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006EF8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006F08()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100006F18()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006F28()
{
  return Error.localizedDescription.getter();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

void objc_release(id a1)
{
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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