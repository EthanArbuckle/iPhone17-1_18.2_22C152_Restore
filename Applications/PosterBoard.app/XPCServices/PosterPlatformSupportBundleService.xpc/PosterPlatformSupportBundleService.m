int main(int argc, const char **argv, const char **envp)
{
  id v3;

  qword_10000CC00 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for ServiceDelegate()) init];
  v3 = [self serviceListener];
  qword_10000CC08 = (uint64_t)v3;
  [v3 setDelegate:qword_10000CC00];
  [v3 resume];
  return 0;
}

uint64_t type metadata accessor for ServiceDelegate()
{
  return self;
}

id sub_1000040B0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceDelegate();
  [super dealloc];
}

uint64_t sub_1000040E4()
{
  uint64_t v0 = sub_100006C00();
  sub_1000069C8(v0, qword_10000CAF0);
  sub_1000067F4(v0, (uint64_t)qword_10000CAF0);
  return sub_100006BF0();
}

uint64_t sub_1000042FC(uint64_t a1, uint64_t a2, const void *a3, void *a4)
{
  v4[2] = a4;
  uint64_t v7 = sub_100006BD0();
  v4[3] = v7;
  v4[4] = *(void *)(v7 - 8);
  uint64_t v8 = swift_task_alloc();
  v4[5] = v8;
  v4[6] = _Block_copy(a3);
  sub_100006BC0();
  uint64_t v9 = sub_100006C10();
  uint64_t v11 = v10;
  v4[7] = v10;
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_10000CB78 + dword_10000CB78);
  id v12 = a4;
  v13 = (void *)swift_task_alloc();
  v4[8] = v13;
  void *v13 = v4;
  v13[1] = sub_100004460;
  return v15(v8, v9, v11);
}

uint64_t sub_100004460(void *a1)
{
  v4 = (void *)*v2;
  v5 = (void *)*v2;
  swift_task_dealloc();
  v6 = (void (**)(void, void, void))v4[6];
  uint64_t v7 = (void *)v4[2];
  (*(void (**)(void, void))(v4[4] + 8))(v4[5], v4[3]);

  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v8 = (void *)sub_100006B90();
    swift_errorRelease();
    ((void (**)(void, void, void *))v6)[2](v6, 0, v8);

    _Block_release(v6);
  }
  else
  {
    ((void (**)(void, void *, void))v6)[2](v6, a1, 0);
    _Block_release(v6);
  }
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v5[1];
  return v9();
}

id sub_1000046B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PPSBundleService();
  return [super dealloc];
}

uint64_t type metadata accessor for PPSBundleService()
{
  return self;
}

uint64_t sub_10000470C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004750()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000047A0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  v5 = (const void *)v0[4];
  v4 = (void *)v0[5];
  v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_100004860;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, const void *, void *))((char *)&dword_10000CB38 + dword_10000CB38);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_100004860()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004954(uint64_t a1, uint64_t a2, int *a3)
{
  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_100006B8C;
  return v6();
}

uint64_t sub_100004A24()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100006B8C;
  v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10000CB48 + dword_10000CB48);
  return v6(v2, v3, v4);
}

uint64_t sub_100004AE4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_100006B8C;
  return v7();
}

uint64_t sub_100004BB4()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100004BF4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100006B8C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10000CB58 + dword_10000CB58);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100004CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006C70();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100006C60();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100004E64(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100006C50();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100004E64(uint64_t a1)
{
  uint64_t v2 = sub_10000470C(&qword_10000CB30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100004EC4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100004FA0;
  return v6(a1);
}

uint64_t sub_100004FA0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005098()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000050D0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100004860;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10000CB68 + dword_10000CB68);
  return v6(a1, v4);
}

uint64_t sub_100005188(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000525C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006968((uint64_t)v12, *a3);
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
      sub_100006968((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006918((uint64_t)v12);
  return v7;
}

uint64_t sub_10000525C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006CB0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005418(a5, a6);
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
  uint64_t v8 = sub_100006CE0();
  if (!v8)
  {
    sub_100006CF0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006D10();
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

uint64_t sub_100005418(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000054B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005690(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005690(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000054B0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005628(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006CD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006CF0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006C30();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006D10();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006CF0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005628(uint64_t a1, uint64_t a2)
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
  sub_10000470C(&qword_10000CBF8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005690(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000470C(&qword_10000CBF8);
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
  uint64_t result = sub_100006D10();
  __break(1u);
  return result;
}

uint64_t sub_1000057E0(uint64_t a1, unint64_t a2)
{
  if (qword_10000C9A0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100006C00();
  sub_1000067F4(v4, (uint64_t)qword_10000CAF0);
  swift_bridgeObjectRetain_n();
  size_t v5 = sub_100006BE0();
  os_log_type_t v6 = sub_100006C80();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)int64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_100005188(a1, a2, &v9);
    sub_100006CA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return a1;
}

uint64_t sub_100005990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[10] = a2;
  v3[11] = a3;
  v3[9] = a1;
  uint64_t v4 = sub_100006BD0();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  return _swift_task_switch(sub_100005A90, 0, 0);
}

uint64_t sub_100005A90()
{
  v99 = v0;
  if (qword_10000C9A0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[13];
  uint64_t v5 = sub_100006C00();
  sub_1000067F4(v5, (uint64_t)qword_10000CAF0);
  v94 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v94(v2, v1, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_100006BE0();
  os_log_type_t v7 = sub_100006C90();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[15];
  uint64_t v10 = v0[12];
  uint64_t v11 = v0[13];
  unint64_t v12 = v0[11];
  v96 = v0;
  if (v8)
  {
    uint64_t v91 = v0[10];
    uint64_t v13 = swift_slowAlloc();
    uint64_t v97 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    swift_bridgeObjectRetain();
    v0[7] = sub_100005188(v91, v12, &v97);
    sub_100006CA0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2080;
    sub_10000682C();
    uint64_t v14 = sub_100006D20();
    v0[8] = sub_100005188(v14, v15, &v97);
    sub_100006CA0();
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v16(v9, v10);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Loading host configuration for role %s from %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v16(v9, v10);
  }

  id v17 = objc_allocWithZone((Class)NSBundle);
  sub_100006BB0(v18);
  v20 = v19;
  id v21 = [v17 initWithURL:v19];

  if (!v21)
  {
    v22 = v96;
    v50 = (void *)v96[11];
    uint64_t v51 = v96[10];
    uint64_t v97 = 0;
    unint64_t v98 = 0xE000000000000000;
    sub_100006CC0(36);
    swift_bridgeObjectRelease();
    uint64_t v97 = 0xD000000000000016;
    unint64_t v98 = 0x8000000100007420;
    sub_10000682C();
    v101._countAndFlagsBits = sub_100006D20();
    sub_100006C20(v101);
    swift_bridgeObjectRelease();
    v102._countAndFlagsBits = 0x6C6F7220726F6620;
    v102._object = (void *)0xEA00000000002065;
    sub_100006C20(v102);
    v103._countAndFlagsBits = v51;
    v103._object = v50;
    sub_100006C20(v103);
    uint64_t v52 = sub_1000057E0(v97, v98);
    uint64_t v54 = v53;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_100006884();
    swift_allocError();
    uint64_t *v55 = v52;
    v55[1] = v54;
    swift_willThrow();
    goto LABEL_27;
  }
  v22 = v96;
  v96[2] = 0;
  unsigned int v23 = [v21 loadAndReturnError:v96 + 2];
  v24 = (void *)v96[2];
  if (!v23)
  {
    id v56 = v24;
    sub_100006BA0();

LABEL_26:
    swift_willThrow();

    goto LABEL_27;
  }
  id v25 = v24;
  if (![v21 principalClass])
  {
    v57 = (void *)v96[11];
    uint64_t v58 = v96[10];
    uint64_t v97 = 0;
    unint64_t v98 = 0xE000000000000000;
    sub_100006CC0(57);
    v104._countAndFlagsBits = 0xD00000000000002BLL;
    v104._object = (void *)0x8000000100007450;
    sub_100006C20(v104);
    sub_10000682C();
LABEL_24:
    v111._countAndFlagsBits = sub_100006D20();
    sub_100006C20(v111);
    swift_bridgeObjectRelease();
    v63._countAndFlagsBits = 0x6C6F7220726F6620;
    v63._object = (void *)0xEA00000000002065;
    goto LABEL_25;
  }
  swift_getObjCClassMetadata();
  v96[3] = &OBJC_PROTOCOL___PPSHostConfigurationProviding;
  if (!swift_dynamicCastTypeToObjCProtocolConditional())
  {
    v57 = (void *)v96[11];
    uint64_t v58 = v96[10];
    uint64_t v97 = 0;
    unint64_t v98 = 0xE000000000000000;
    sub_100006CC0(93);
    v105._object = (void *)0x8000000100007480;
    v105._countAndFlagsBits = 0xD000000000000010;
    sub_100006C20(v105);
    id v59 = [(id)swift_getObjCClassFromMetadata() description];
    uint64_t v60 = sub_100006C10();
    v62 = v61;

    v106._countAndFlagsBits = v60;
    v106._object = v62;
    sub_100006C20(v106);
    swift_bridgeObjectRelease();
    v107._countAndFlagsBits = 0x646E7562206E6920;
    v107._object = (void *)0xEB0000000020656CLL;
    sub_100006C20(v107);
    sub_10000682C();
    v108._countAndFlagsBits = sub_100006D20();
    sub_100006C20(v108);
    swift_bridgeObjectRelease();
    v63._countAndFlagsBits = 0xD00000000000003CLL;
    v63._object = (void *)0x80000001000074A0;
LABEL_25:
    sub_100006C20(v63);
    v112._countAndFlagsBits = v58;
    v112._object = v57;
    sub_100006C20(v112);
    uint64_t v68 = sub_1000057E0(v97, v98);
    uint64_t v70 = v69;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_100006884();
    swift_allocError();
    uint64_t *v71 = v68;
    v71[1] = v70;
    goto LABEL_26;
  }
  id v26 = [(id)swift_getObjCClassFromMetadata() hostConfigurationProvider];
  if (!v26)
  {
    v57 = (void *)v96[11];
    uint64_t v58 = v96[10];
    uint64_t v97 = 0;
    unint64_t v98 = 0xE000000000000000;
    sub_100006CC0(50);
    swift_bridgeObjectRelease();
    uint64_t v97 = 0xD000000000000010;
    unint64_t v98 = 0x80000001000074E0;
    id v64 = [(id)swift_getObjCClassFromMetadata() description];
    uint64_t v65 = sub_100006C10();
    v67 = v66;

    v109._countAndFlagsBits = v65;
    v109._object = v67;
    sub_100006C20(v109);
    swift_bridgeObjectRelease();
    v110._countAndFlagsBits = 0xD000000000000012;
    v110._object = (void *)0x8000000100007500;
    sub_100006C20(v110);
    sub_10000682C();
    goto LABEL_24;
  }
  v27 = v26;
  uint64_t v28 = v96[10];
  v29 = (void *)v96[11];
  id v30 = [v26 role];
  uint64_t v31 = sub_100006C10();
  v33 = v32;

  if (v31 == v28 && v33 == v29 || (sub_100006D30() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    id v34 = [v27 hostConfiguration];
    if (v34)
    {
      id v35 = v34;
      id v36 = [v34 entries];
      sub_1000068D8();
      unint64_t v37 = sub_100006C40();

      id v93 = v35;
      if (v37 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t type = sub_100006D00();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t type = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v38 = v96[14];
      uint64_t v39 = v96[12];
      uint64_t v40 = v96[9];
      swift_bridgeObjectRelease();
      v94(v38, v40, v39);
      swift_bridgeObjectRetain_n();
      v41 = sub_100006BE0();
      os_log_type_t v42 = sub_100006C90();
      BOOL v43 = os_log_type_enabled(v41, v42);
      uint64_t v44 = v96[14];
      unint64_t v45 = v96[11];
      uint64_t v46 = v96[12];
      if (v43)
      {
        uint64_t v90 = v96[10];
        uint64_t v47 = swift_slowAlloc();
        uint64_t v97 = swift_slowAlloc();
        *(_DWORD *)uint64_t v47 = 134218498;
        v96[4] = type;
        sub_100006CA0();
        *(_WORD *)(v47 + 12) = 2080;
        swift_bridgeObjectRetain();
        v96[5] = sub_100005188(v90, v45, &v97);
        sub_100006CA0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v47 + 22) = 2080;
        sub_10000682C();
        uint64_t v48 = sub_100006D20();
        v96[6] = sub_100005188(v48, v49, &v97);
        sub_100006CA0();
        swift_bridgeObjectRelease();
        v16(v44, v46);
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "Loaded %ld default configurations for role %s from %s", (uint8_t *)v47, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        v22 = v96;
        swift_slowDealloc();
        swift_unknownObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease_n();
        v16(v44, v46);

        swift_unknownObjectRelease();
      }

      swift_task_dealloc();
      swift_task_dealloc();
      v89 = (uint64_t (*)(id))v22[1];
      return v89(v93);
    }
    uint64_t v75 = v96[10];
    v74 = (void *)v96[11];
    uint64_t v97 = 0;
    unint64_t v98 = 0xE000000000000000;
    sub_100006CC0(51);
    id v76 = [(id)swift_getObjCClassFromMetadata() description];
    uint64_t v77 = sub_100006C10();
    v79 = v78;

    v113._countAndFlagsBits = v77;
    v113._object = v79;
    sub_100006C20(v113);
    swift_bridgeObjectRelease();
    v114._countAndFlagsBits = 0xD00000000000002FLL;
    v114._object = (void *)0x8000000100007540;
    sub_100006C20(v114);
    v80._countAndFlagsBits = v75;
    v80._object = v74;
  }
  else
  {
    Swift::String v95 = (Swift::String)*((_OWORD *)v96 + 5);
    uint64_t v97 = 0;
    unint64_t v98 = 0xE000000000000000;
    sub_100006CC0(67);
    v115._object = (void *)0x8000000100007480;
    v115._countAndFlagsBits = 0xD000000000000010;
    sub_100006C20(v115);
    id v81 = [(id)swift_getObjCClassFromMetadata() description];
    uint64_t v82 = sub_100006C10();
    v84 = v83;

    v116._countAndFlagsBits = v82;
    v116._object = v84;
    sub_100006C20(v116);
    swift_bridgeObjectRelease();
    v117._countAndFlagsBits = 0xD000000000000015;
    v117._object = (void *)0x8000000100007520;
    sub_100006C20(v117);
    v118._countAndFlagsBits = v31;
    v118._object = v33;
    sub_100006C20(v118);
    swift_bridgeObjectRelease();
    v119._countAndFlagsBits = 0x6E7562206E692027;
    v119._object = (void *)0xEC00000020656C64;
    sub_100006C20(v119);
    sub_10000682C();
    v120._countAndFlagsBits = sub_100006D20();
    sub_100006C20(v120);
    swift_bridgeObjectRelease();
    v121._countAndFlagsBits = 0x6C6F7220726F6620;
    v121._object = (void *)0xEA00000000002065;
    sub_100006C20(v121);
    Swift::String v80 = v95;
  }
  sub_100006C20(v80);
  uint64_t v85 = sub_1000057E0(v97, v98);
  uint64_t v87 = v86;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_100006884();
  swift_allocError();
  uint64_t *v88 = v85;
  v88[1] = v87;
  swift_willThrow();

  swift_unknownObjectRelease();
LABEL_27:
  swift_task_dealloc();
  swift_task_dealloc();
  v72 = (uint64_t (*)(void))v22[1];
  return v72();
}

uint64_t sub_1000067F4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_10000682C()
{
  unint64_t result = qword_10000CB80;
  if (!qword_10000CB80)
  {
    sub_100006BD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CB80);
  }
  return result;
}

unint64_t sub_100006884()
{
  unint64_t result = qword_10000CB88;
  if (!qword_10000CB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CB88);
  }
  return result;
}

unint64_t sub_1000068D8()
{
  unint64_t result = qword_10000CBF0;
  if (!qword_10000CBF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000CBF0);
  }
  return result;
}

uint64_t sub_100006918(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006968(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_1000069C8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void *initializeBufferWithCopyOfBuffer for PPSBundleService.BundleServiceError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PPSBundleService.BundleServiceError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for PPSBundleService.BundleServiceError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PPSBundleService.BundleServiceError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for PPSBundleService.BundleServiceError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PPSBundleService.BundleServiceError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PPSBundleService.BundleServiceError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_100006B6C()
{
  return 0;
}

ValueMetadata *type metadata accessor for PPSBundleService.BundleServiceError()
{
  return &type metadata for PPSBundleService.BundleServiceError;
}

uint64_t sub_100006B90()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100006BA0()
{
  return _convertNSErrorToError(_:)();
}

void sub_100006BB0(NSURL *retstr@<X8>)
{
}

uint64_t sub_100006BC0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006BD0()
{
  return type metadata accessor for URL();
}

uint64_t sub_100006BE0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006BF0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006C00()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006C10()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

void sub_100006C20(Swift::String a1)
{
}

Swift::Int sub_100006C30()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006C40()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006C50()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100006C60()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100006C70()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100006C80()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006C90()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100006CA0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006CB0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_100006CC0(Swift::Int a1)
{
}

uint64_t sub_100006CD0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006CE0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006CF0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006D00()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100006D10()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006D20()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100006D30()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006D40()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100006D50()
{
  return Error._code.getter();
}

uint64_t sub_100006D60()
{
  return Error._domain.getter();
}

uint64_t sub_100006D70()
{
  return Error._userInfo.getter();
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
  return [super a2];
}

uint64_t self
{
  return _self;
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

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return _swift_dynamicCastTypeToObjCProtocolConditional();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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