uint64_t sub_100002DC0()
{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100002EB8(uint64_t a1)
{
  v4 = *(int **)(v1 + 16);
  v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100005DE0;
  v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100018B70 + dword_100018B70);
  return v6(a1, v4);
}

uint64_t sub_100002F70(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100005DE0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100018B60 + dword_100018B60);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000303C(uint64_t a1, uint64_t a2, int *a3)
{
  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_100005DE0;
  return v6();
}

uint64_t sub_100003108()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100005DE0;
  v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100018B50 + dword_100018B50);
  return v6(v2, v3, v4);
}

uint64_t sub_1000031C8()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = (void *)v0[3];
  swift_release();
  *uint64_t v2 = v1;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_100003238()
{
  *(void *)(*(void *)v1 + 344) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100007D74;
  }
  else {
    uint64_t v2 = sub_100005DE4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000334C(uint64_t a1, int *a2)
{
  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100002DC0;
  return v6(a1);
}

uint64_t sub_100003428(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_100005DE0;
  return v7();
}

uint64_t sub_1000034F4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_100003FF8;
  uint64_t v7 = (uint64_t (*)(int, int, void *, void *))((char *)&dword_100018C28 + dword_100018C28);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_1000035B4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_100008024;
  }
  else
  {
    *(void *)(v4 + 88) = a1;
    uint64_t v5 = sub_1000031C8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1000036DC(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1000037DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[27] = a4;
  v5[28] = v4;
  v5[25] = a2;
  v5[26] = a3;
  v5[24] = a1;
  sub_100004CB4(&qword_100018DA0);
  v5[29] = swift_task_alloc();
  return _swift_task_switch(sub_100003EA4, 0, 0);
}

uint64_t sub_100003878()
{
  uint64_t v2 = (void *)*v1;
  v2[35] = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[33];
  uint64_t v4 = v2[31];
  uint64_t v5 = v2[30];
  v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  uint64_t v7 = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  if (v0)
  {
    v2[44] = v6;
    v2[45] = v7;
    v6(v3, v5);
    uint64_t v8 = sub_100006978;
  }
  else
  {
    v2[36] = v6;
    v2[37] = v7;
    v6(v3, v5);
    swift_task_dealloc();
    uint64_t v8 = sub_1000040EC;
  }
  return _swift_task_switch(v8, 0, 0);
}

uint64_t sub_100003A14(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for Configuration() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_100003FF8;
  v10[6] = v8;
  v10[7] = v9;
  v10[4] = v6;
  v10[5] = v7;
  v10[3] = a1;
  return _swift_task_switch(sub_100005548, 0, 0);
}

uint64_t sub_100003B44()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 424) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2 + 288))(*(void *)(v2 + 408), *(void *)(v2 + 240));
  if (v0)
  {
    uint64_t v3 = sub_100006FD8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = sub_100004CF8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100003CC0()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 408) = v1;
  static Configuration.intelligencePlatformComputeService.getter();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 416) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100003B44;
  return static IntelligencePlatformComputeSystem.teardown(config:)(v1);
}

uint64_t sub_100003D74()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100003DB4()
{
  uint64_t v1 = type metadata accessor for Configuration();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100003EA4()
{
  uint64_t v1 = type metadata accessor for Configuration();
  v0[30] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[31] = v2;
  v0[32] = *(void *)(v2 + 64);
  uint64_t v3 = swift_task_alloc();
  v0[33] = v3;
  static Configuration.intelligencePlatformComputeService.getter();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[34] = v4;
  void *v4 = v0;
  v4[1] = sub_100003878;
  return static IntelligencePlatformComputeSystem.prepare(config:)(v3);
}

uint64_t sub_100003FA8()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100003FF8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000040EC()
{
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[29];
  uint64_t v4 = v0[30];
  uint64_t v5 = v0[27];
  uint64_t v7 = v0[25];
  uint64_t v6 = v0[26];
  uint64_t v14 = v0[24];
  uint64_t v15 = v0[28];
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 1, 1, v8);
  uint64_t v9 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v9, v5, v4);
  unint64_t v10 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v11 = (char *)swift_allocObject();
  *((void *)v11 + 2) = 0;
  *((void *)v11 + 3) = 0;
  *((void *)v11 + 4) = v14;
  *((void *)v11 + 5) = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(&v11[v10], v9, v4);
  *(void *)&v11[(v2 + v10 + 7) & 0xFFFFFFFFFFFFFFF8] = v6;
  swift_task_dealloc();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0[38] = sub_1000042A4(v3, (uint64_t)&unk_100018C68, (uint64_t)v11, &qword_100018B20);
  uint64_t v12 = *(void *)(v15
                  + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateViewTaskRegister);
  v0[39] = v12;
  return _swift_task_switch(sub_100004A8C, v12, 0);
}

uint64_t sub_1000042A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = type metadata accessor for TaskPriority();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(a1, 1, v7) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100004C54(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  sub_100004CB4(a4);
  return swift_task_create();
}

uint64_t sub_100004424(int a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  v4[4] = v7;
  sub_100004728(0, &qword_100018D60);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4[5] = v9;
  id v10 = a4;
  v11 = (void *)swift_task_alloc();
  v4[6] = v11;
  void *v11 = v4;
  v11[1] = sub_100004548;
  v11[5] = v9;
  v11[6] = v10;
  v11[3] = v6;
  v11[4] = v8;
  return _swift_task_switch(sub_1000057F0, 0, 0);
}

uint64_t sub_100004548()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v5 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v6 = _convertErrorToNSError(_:)();
    swift_errorRelease();
    Class isa = 0;
    uint64_t v8 = (void *)v6;
  }
  else
  {
    sub_100004728(0, &qword_100018C50);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v8 = isa;
  }
  uint64_t v9 = *(void (***)(void, void, void))(v3 + 24);
  ((void (**)(void, Class, uint64_t))v9)[2](v9, isa, v6);

  _Block_release(v9);
  id v10 = *(uint64_t (**)(void))(v5 + 8);
  return v10();
}

uint64_t sub_100004728(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1000048E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100004C54(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100004A8C()
{
  uint64_t v1 = (char **)(v0[39] + 112);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10000C244(0, *((void *)v2 + 2) + 1, 1, v2, &qword_100018C78, &qword_100018C70);
    *uint64_t v1 = v2;
  }
  unint64_t v5 = *((void *)v2 + 2);
  unint64_t v4 = *((void *)v2 + 3);
  if (v5 >= v4 >> 1)
  {
    uint64_t v2 = sub_10000C244((char *)(v4 > 1), v5 + 1, 1, v2, &qword_100018C78, &qword_100018C70);
    *uint64_t v1 = v2;
  }
  uint64_t v6 = v0[38];
  uint64_t v8 = v0[24];
  uint64_t v7 = v0[25];
  *((void *)v2 + 2) = v5 + 1;
  uint64_t v9 = &v2[24 * v5];
  *((void *)v9 + 4) = v6;
  *((void *)v9 + 5) = v8;
  *((void *)v9 + 6) = v7;
  swift_endAccess();
  id v10 = (void *)swift_task_alloc();
  v0[40] = v10;
  uint64_t v11 = sub_100004CB4(&qword_100018B20);
  v0[41] = v11;
  uint64_t v12 = sub_100004CB4((uint64_t *)&unk_100018DD0);
  v0[42] = v12;
  *id v10 = v0;
  v10[1] = sub_100003238;
  uint64_t v13 = v0[38];
  return Task.value.getter(v0 + 13, v13, v11, v12, &protocol self-conformance witness table for Error);
}

uint64_t sub_100004C54(uint64_t a1)
{
  uint64_t v2 = sub_100004CB4(&qword_100018DA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100004CB4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004CF8()
{
  uint64_t v12 = v0;
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100005A6C(v1, (uint64_t)qword_100018EE0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[25];
  if (v4)
  {
    uint64_t v6 = v0[24];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[23] = sub_100005AA4(v6, v5, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IntelligencePlatformComputeService: update %s returning responses", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  swift_release();

  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v9 = v0[50];
  return v8(v9);
}

uint64_t sub_100004F08()
{
  uint64_t v1 = v0[39];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v36 = *(void *)(v2 + 16);
  if (v36)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    for (uint64_t i = 0; i != v36; ++i)
    {
      uint64_t v5 = *(void *)(v2 + v3 + 40);
      uint64_t v6 = *(void *)(v2 + v3 + 48);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      if (static Task.== infix(_:_:)())
      {
        if (v5 == v0[24] && v6 == v0[25])
        {
          swift_release();
          swift_bridgeObjectRelease_n();
          swift_release();
LABEL_19:
          uint64_t v10 = swift_bridgeObjectRelease();
          unint64_t v13 = i + 1;
          if (__OFADD__(i, 1)) {
            goto LABEL_50;
          }
          unint64_t v14 = *(void *)(v2 + 16);
          while (2)
          {
            if (v13 == v14) {
              goto LABEL_14;
            }
            if (v13 >= v14)
            {
              __break(1u);
LABEL_44:
              __break(1u);
LABEL_45:
              __break(1u);
LABEL_46:
              __break(1u);
LABEL_47:
              __break(1u);
LABEL_48:
              __break(1u);
              goto LABEL_49;
            }
            unint64_t v34 = v13;
            uint64_t v37 = v2;
            uint64_t v16 = (void *)(v2 + v3);
            uint64_t v17 = *(void *)(v2 + v3 + 64);
            uint64_t v18 = *(void *)(v2 + v3 + 72);
            swift_bridgeObjectRetain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRetain();
            if (static Task.== infix(_:_:)())
            {
              if (v17 == v0[24] && v18 == v0[25])
              {
                swift_release();
                swift_bridgeObjectRelease_n();
                uint64_t v10 = swift_release();
                unint64_t v19 = v34;
LABEL_42:
                unint64_t v13 = v19 + 1;
                unint64_t v14 = *(void *)(v2 + 16);
                v3 += 24;
                continue;
              }
              char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_release();
              swift_bridgeObjectRelease();
              swift_release();
              uint64_t v10 = swift_bridgeObjectRelease();
              unint64_t v19 = v34;
              if (v31) {
                goto LABEL_42;
              }
            }
            else
            {
              swift_release();
              swift_bridgeObjectRelease();
              swift_release();
              uint64_t v10 = swift_bridgeObjectRelease();
              unint64_t v19 = v34;
            }
            break;
          }
          if (v19 == i)
          {
            BOOL v15 = __OFADD__(i++, 1);
            if (v15) {
              goto LABEL_44;
            }
          }
          else
          {
            if (i < 0) {
              goto LABEL_45;
            }
            unint64_t v20 = *(void *)(v2 + 16);
            if (i >= v20) {
              goto LABEL_46;
            }
            if (v19 >= v20) {
              goto LABEL_47;
            }
            v21 = (uint64_t *)(v2 + 32 + 24 * i);
            uint64_t v22 = *v21;
            uint64_t v23 = v21[2];
            uint64_t v24 = v16[7];
            uint64_t v33 = v21[1];
            uint64_t v35 = v16[8];
            uint64_t v25 = v16[9];
            v26 = (char *)v37;
            swift_retain();
            swift_bridgeObjectRetain();
            swift_retain();
            swift_bridgeObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              v26 = sub_10000C574(v37);
            }
            v27 = &v26[24 * i];
            *((void *)v27 + 4) = v24;
            *((void *)v27 + 5) = v35;
            *((void *)v27 + 6) = v25;
            swift_release();
            uint64_t v10 = swift_bridgeObjectRelease();
            if (v19 >= *((void *)v26 + 2)) {
              goto LABEL_48;
            }
            v28 = v26;
            uint64_t v29 = v0[39];
            v30 = &v28[v3];
            *((void *)v30 + 7) = v22;
            *((void *)v30 + 8) = v33;
            *((void *)v30 + 9) = v23;
            swift_release();
            uint64_t v10 = swift_bridgeObjectRelease();
            *(void *)(v29 + 112) = v28;
            uint64_t v2 = (uint64_t)v28;
            BOOL v15 = __OFADD__(i++, 1);
            if (v15) {
              goto LABEL_44;
            }
          }
          goto LABEL_42;
        }
        char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        if (v8) {
          goto LABEL_19;
        }
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
      }
      v3 += 24;
    }
    swift_bridgeObjectRelease();
    uint64_t i = *(void *)(v2 + 16);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t i = 0;
  }
LABEL_14:
  uint64_t v9 = v0[39];
  swift_bridgeObjectRelease();
  uint64_t v10 = swift_release();
  int64_t v12 = *(void *)(*(void *)(v9 + 112) + 16);
  if (v12 < i)
  {
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    return _swift_task_switch(v10, v12, v11);
  }
  sub_1000053B4(i, v12, &qword_100018C78, &qword_100018C70);
  swift_endAccess();
  uint64_t v10 = (uint64_t)sub_100003CC0;
  int64_t v12 = 0;
  uint64_t v11 = 0;
  return _swift_task_switch(v10, v12, v11);
}

uint64_t sub_1000053B4(uint64_t a1, int64_t a2, uint64_t *a3, uint64_t *a4)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = *v4;
  int64_t v7 = *((void *)*v4 + 2);
  if (v7 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v10 = a1 - a2;
  if (__OFSUB__(0, v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v11 = v7 - v9;
  if (__OFADD__(v7, v10))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v11 > *((void *)v6 + 3) >> 1)
  {
    if (v7 <= v11) {
      int64_t v15 = v7 + v10;
    }
    else {
      int64_t v15 = v7;
    }
    uint64_t v6 = sub_10000C244(isUniquelyReferenced_nonNull_native, v15, 1, v6, a3, a4);
  }
  sub_100004CB4(a4);
  uint64_t result = swift_arrayDestroy();
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v17 = *((void *)v6 + 2);
  BOOL v18 = __OFSUB__(v17, a2);
  uint64_t v19 = v17 - a2;
  if (v18) {
    goto LABEL_26;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    unint64_t v20 = &v6[24 * a2 + 32];
    if (a1 != a2 || &v6[24 * a1 + 32] >= &v20[24 * v19]) {
      uint64_t result = (uint64_t)memmove(&v6[24 * a1 + 32], v20, 24 * v19);
    }
    uint64_t v21 = *((void *)v6 + 2);
    BOOL v18 = __OFADD__(v21, v10);
    uint64_t v22 = v21 - v9;
    if (!v18)
    {
      *((void *)v6 + 2) = v22;
LABEL_20:
      void *v4 = v6;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100005548()
{
  unint64_t v14 = v0;
  static Task<>.checkCancellation()();
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100005A6C(v1, (uint64_t)qword_100018EE0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[5];
  if (v4)
  {
    uint64_t v6 = v0[4];
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)int64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_100005AA4(v6, v5, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IntelligencePlatformComputeService: updateViewWithName %s begining update", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  type metadata accessor for ViewUpdate.ViewInProcessRunner();
  v0[8] = static ViewUpdate.ViewInProcessRunner.sharedInProcessRunner(for:)();
  char v8 = (void *)swift_task_alloc();
  v0[9] = v8;
  *char v8 = v0;
  v8[1] = sub_1000035B4;
  uint64_t v9 = v0[7];
  uint64_t v11 = v0[4];
  uint64_t v10 = v0[5];
  return ViewUpdate.ViewInProcessRunner.update(viewName:requests:)(v11, v10, v9);
}

uint64_t sub_1000057F0()
{
  uint64_t v16 = v0;
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100005A6C(v1, (uint64_t)qword_100018EE0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[4];
  if (v4)
  {
    uint64_t v6 = v0[3];
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)int64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_100005AA4(v6, v5, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IntelligencePlatformComputeService: updateViewWithName %s called", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  if (qword_1000189E0 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Configuration();
  uint64_t v9 = sub_100005A6C(v8, (uint64_t)qword_100018EA8);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[7] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_1000036DC;
  uint64_t v11 = v0[5];
  uint64_t v13 = v0[3];
  uint64_t v12 = v0[4];
  return sub_1000037DC(v13, v12, v11, v9);
}

uint64_t sub_100005A6C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005AA4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005BC8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005D84((uint64_t)v12, *a3);
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
      sub_100005D84((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100005B78((uint64_t)v12);
  return v7;
}

uint64_t sub_100005B78(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005BC8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000ECC8(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_100005D84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005DE4()
{
  uint64_t v1 = v0[39];
  v0[50] = v0[13];
  return _swift_task_switch(sub_100004F08, v1, 0);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for Configuration();
  sub_100005F70(v3, qword_100018E88);
  uint64_t v4 = sub_100005A6C(v3, (uint64_t)qword_100018E88);
  uint64_t v5 = os_transaction_create();
  uint64_t v6 = *(void *)(v3 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000064BC();
  type metadata accessor for Library();
  sub_10000670C();
  static UnifiedLibrary.add(library:)();
  static IntelligencePlatformComputeSystem.start()();
  if (Configuration.isIPCSMemoryTransactionEnabled.getter())
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v4, v8, v3);
    swift_unknownObjectRelease();
    sub_10000F090(v4);
  }
  sub_10000F090((uint64_t)v8);
}

uint64_t *sub_100005F70(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005FD4(int a1)
{
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t v2 = __DataStorage.init(length:)();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    if (__DataStorage._bytes.getter())
    {
      uint64_t result = __DataStorage._offset.getter();
      if (__OFSUB__(0, result)) {
        goto LABEL_12;
      }
    }
    swift_allocObject();
    uint64_t v4 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
    swift_release();
    uint64_t v2 = v4;
  }
  uint64_t result = __DataStorage._bytes.getter();
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v5 = result;
  uint64_t result = __DataStorage._offset.getter();
  uint64_t v6 = -result;
  if (__OFSUB__(0, result))
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v7 = __DataStorage._length.getter();
  if (v7 >= 1024) {
    size_t v8 = 1024;
  }
  else {
    size_t v8 = v7;
  }
  bzero((void *)(v5 + v6), v8);
  uint64_t v10 = 0x40000000000;
  unint64_t v11 = v2 | 0x4000000000000000;
  uint64_t v9 = sub_100006128(&v10, a1);
  sub_100006764(v10, v11);
  return v9;
}

uint64_t sub_100006128(uint64_t *a1, int a2)
{
  uint64_t v4 = *a1;
  unint64_t v3 = a1[1];
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_100011170;
      uint64_t v10 = v4 >> 32;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_14;
      }
      if (v10 < (int)v4) {
        goto LABEL_18;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v4, __DataStorage._offset.getter())) {
        goto LABEL_19;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v12 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v9 = v12;
LABEL_14:
      if (v10 < (int)v4)
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
      }
      uint64_t result = sub_100006410((int)v4, v4 >> 32, v9, a2);
      *a1 = v4;
      a1[1] = v9 | 0x4000000000000000;
      return result;
    case 2uLL:
      uint64_t v14 = *a1;
      unint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t v11 = v15;
      uint64_t result = sub_100006410(*(void *)(v14 + 16), *(void *)(v14 + 24), v15, a2);
      *a1 = v14;
      a1[1] = v11 | 0x8000000000000000;
      return result;
    case 3uLL:
      memset(v13, 0, 15);
      uint64_t result = sub_1000106D0(v13, a2, &v14);
      if (!v2) {
        return v14;
      }
      return result;
    default:
      *(void *)uint64_t v13 = *a1;
      *(_WORD *)&v13[8] = v3;
      v13[10] = BYTE2(v3);
      v13[11] = BYTE3(v3);
      v13[12] = BYTE4(v3);
      v13[13] = BYTE5(v3);
      v13[14] = BYTE6(v3);
      uint64_t result = sub_1000106D0(v13, a2, &v14);
      if (!v2) {
        uint64_t result = v14;
      }
      unint64_t v8 = *(unsigned int *)&v13[8] | ((unint64_t)v13[12] << 32) | ((unint64_t)v13[13] << 40) | ((unint64_t)v13[14] << 48);
      *a1 = *(void *)v13;
      a1[1] = v8;
      return result;
  }
}

uint64_t sub_100006410(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t result = __DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_9;
  }
  uint64_t v9 = result;
  uint64_t result = __DataStorage._offset.getter();
  uint64_t v10 = a1 - result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_8;
  }
  if (__OFSUB__(a2, a1))
  {
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  __DataStorage._length.getter();
  uint64_t result = sub_1000106D0((char *)(v9 + v10), a4, &v11);
  if (!v4) {
    return v11;
  }
  return result;
}

uint64_t sub_1000064BC()
{
  String.utf8CString.getter();
  int v0 = _set_user_dir_suffix();
  swift_release();
  if (!v0)
  {
    if (qword_1000189F0 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_100005A6C(v5, (uint64_t)qword_100018EE0);
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v8 = 0;
      uint64_t v9 = "_set_user_dir_suffix() failed!";
      uint64_t v10 = v6;
      os_log_type_t v11 = v7;
      uint64_t v12 = v8;
      uint32_t v13 = 2;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, v12, v13);
      swift_slowDealloc();
    }
LABEL_17:

    exit(1);
  }
  sub_100005FD4(65537);
  if (!v1)
  {
LABEL_12:
    if (qword_1000189F0 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_100005A6C(v14, (uint64_t)qword_100018EE0);
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 67109120;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v9 = "Unable to read _CS_DARWIN_USER_CACHE_DIR %d!";
      uint64_t v10 = v6;
      os_log_type_t v11 = v15;
      uint64_t v12 = v16;
      uint32_t v13 = 8;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  uint64_t v2 = String.utf8CString.getter();
  unint64_t v3 = realpath_DARWIN_EXTSN((const char *)(v2 + 32), 0);
  swift_release();
  if (!v3)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  String.init(cString:)();
  swift_slowDealloc();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

unint64_t sub_10000670C()
{
  unint64_t result = qword_1000189F8;
  if (!qword_1000189F8)
  {
    type metadata accessor for Library();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000189F8);
  }
  return result;
}

uint64_t sub_100006764(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_1000067BC()
{
  uint64_t v0 = type metadata accessor for Configuration();
  sub_100005F70(v0, qword_100018EA8);
  uint64_t v1 = sub_100005A6C(v0, (uint64_t)qword_100018EA8);
  if (qword_1000189E8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100004CB4(&qword_100018D30);
  uint64_t v3 = sub_100005A6C(v2, (uint64_t)qword_100018EC8);
  uint64_t v4 = swift_beginAccess();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D1F8(v3, (uint64_t)v6);
  uint64_t v7 = *(void *)(v0 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v6, 1, v0);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(v1, v6, v0);
  }
  __break(1u);
  return result;
}

uint64_t sub_100006930()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_100006968()
{
  return v0;
}

uint64_t sub_100006978()
{
  uint64_t v14 = v0;
  swift_task_dealloc();
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[46] = sub_100005A6C(v1, (uint64_t)qword_100018EE0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[35];
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v13 = v7;
    v0[12] = v5;
    swift_errorRetain();
    sub_100004CB4((uint64_t *)&unk_100018DD0);
    uint64_t v8 = String.init<A>(describing:)();
    v0[11] = sub_100005AA4(v8, v9, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IntelligencePlatformComputeService: Error preparing system: %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v10 = swift_task_alloc();
  v0[47] = v10;
  static Configuration.intelligencePlatformComputeService.getter();
  os_log_type_t v11 = (void *)swift_task_alloc();
  v0[48] = v11;
  void *v11 = v0;
  v11[1] = sub_100006BF4;
  return static IntelligencePlatformComputeSystem.teardown(config:)(v10);
}

uint64_t sub_100006BF4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 392) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2 + 352))(*(void *)(v2 + 376), *(void *)(v2 + 240));
  if (v0)
  {
    os_log_type_t v3 = sub_100006DE4;
  }
  else
  {
    swift_task_dealloc();
    os_log_type_t v3 = sub_100006D70;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100006D70()
{
  swift_willThrow();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100006DE4()
{
  os_log_type_t v11 = v0;
  swift_task_dealloc();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[49];
    BOOL v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)BOOL v4 = 136315138;
    uint64_t v10 = v5;
    v0[20] = v3;
    swift_errorRetain();
    sub_100004CB4((uint64_t *)&unk_100018DD0);
    uint64_t v6 = String.init<A>(describing:)();
    v0[14] = sub_100005AA4(v6, v7, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "IntelligencePlatformComputeService: further error tearing down view system: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_willThrow();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100006FD8()
{
  uint64_t v21 = v0;
  swift_task_dealloc();
  uint64_t v1 = &IntelligencePlatformComputeService;
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005A6C(v2, (uint64_t)qword_100018EE0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = v0[53];
  if (v5)
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    v20[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v7 = 136315138;
    v0[21] = v6;
    swift_errorRetain();
    uint64_t v8 = String.init<A>(describing:)();
    v0[22] = sub_100005AA4(v8, v9, v20);
    uint64_t v1 = &IntelligencePlatformComputeService;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "IntelligencePlatformComputeService: further error tearing down view system: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_willThrow();
  swift_bridgeObjectRelease();
  uint64_t v10 = v0[53];
  v0[54] = v10;
  if (v1[318].count != -1) {
    swift_once();
  }
  v0[55] = sub_100005A6C(v2, (uint64_t)qword_100018EE0);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  os_log_type_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v14 = v0[24];
    unint64_t v13 = v0[25];
    uint64_t v15 = swift_slowAlloc();
    v20[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315394;
    swift_bridgeObjectRetain();
    v0[17] = sub_100005AA4(v14, v13, v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    v0[18] = v10;
    swift_errorRetain();
    uint64_t v16 = String.init<A>(describing:)();
    v0[19] = sub_100005AA4(v16, v17, v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "IntelligencePlatformComputeService: updateView: n:%s failed: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v18 = v0[39];
  return _swift_task_switch(sub_100007418, v18, 0);
}

uint64_t sub_100007418()
{
  uint64_t v1 = v0[39];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v36 = *(void *)(v2 + 16);
  if (v36)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    for (uint64_t i = 0; i != v36; ++i)
    {
      uint64_t v5 = *(void *)(v2 + v3 + 40);
      uint64_t v6 = *(void *)(v2 + v3 + 48);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      if (static Task.== infix(_:_:)())
      {
        if (v5 == v0[24] && v6 == v0[25])
        {
          swift_release();
          swift_bridgeObjectRelease_n();
          swift_release();
LABEL_19:
          uint64_t v10 = swift_bridgeObjectRelease();
          unint64_t v13 = i + 1;
          if (__OFADD__(i, 1)) {
            goto LABEL_50;
          }
          unint64_t v14 = *(void *)(v2 + 16);
          while (2)
          {
            if (v13 == v14) {
              goto LABEL_14;
            }
            if (v13 >= v14)
            {
              __break(1u);
LABEL_44:
              __break(1u);
LABEL_45:
              __break(1u);
LABEL_46:
              __break(1u);
LABEL_47:
              __break(1u);
LABEL_48:
              __break(1u);
              goto LABEL_49;
            }
            unint64_t v34 = v13;
            uint64_t v37 = v2;
            uint64_t v16 = (void *)(v2 + v3);
            uint64_t v17 = *(void *)(v2 + v3 + 64);
            uint64_t v18 = *(void *)(v2 + v3 + 72);
            swift_bridgeObjectRetain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRetain();
            if (static Task.== infix(_:_:)())
            {
              if (v17 == v0[24] && v18 == v0[25])
              {
                swift_release();
                swift_bridgeObjectRelease_n();
                uint64_t v10 = swift_release();
                unint64_t v19 = v34;
LABEL_42:
                unint64_t v13 = v19 + 1;
                unint64_t v14 = *(void *)(v2 + 16);
                v3 += 24;
                continue;
              }
              char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_release();
              swift_bridgeObjectRelease();
              swift_release();
              uint64_t v10 = swift_bridgeObjectRelease();
              unint64_t v19 = v34;
              if (v31) {
                goto LABEL_42;
              }
            }
            else
            {
              swift_release();
              swift_bridgeObjectRelease();
              swift_release();
              uint64_t v10 = swift_bridgeObjectRelease();
              unint64_t v19 = v34;
            }
            break;
          }
          if (v19 == i)
          {
            BOOL v15 = __OFADD__(i++, 1);
            if (v15) {
              goto LABEL_44;
            }
          }
          else
          {
            if (i < 0) {
              goto LABEL_45;
            }
            unint64_t v20 = *(void *)(v2 + 16);
            if (i >= v20) {
              goto LABEL_46;
            }
            if (v19 >= v20) {
              goto LABEL_47;
            }
            uint64_t v21 = (uint64_t *)(v2 + 32 + 24 * i);
            uint64_t v22 = *v21;
            uint64_t v23 = v21[2];
            uint64_t v24 = v16[7];
            uint64_t v33 = v21[1];
            uint64_t v35 = v16[8];
            uint64_t v25 = v16[9];
            v26 = (char *)v37;
            swift_retain();
            swift_bridgeObjectRetain();
            swift_retain();
            swift_bridgeObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              v26 = sub_10000C574(v37);
            }
            v27 = &v26[24 * i];
            *((void *)v27 + 4) = v24;
            *((void *)v27 + 5) = v35;
            *((void *)v27 + 6) = v25;
            swift_release();
            uint64_t v10 = swift_bridgeObjectRelease();
            if (v19 >= *((void *)v26 + 2)) {
              goto LABEL_48;
            }
            v28 = v26;
            uint64_t v29 = v0[39];
            v30 = &v28[v3];
            *((void *)v30 + 7) = v22;
            *((void *)v30 + 8) = v33;
            *((void *)v30 + 9) = v23;
            swift_release();
            uint64_t v10 = swift_bridgeObjectRelease();
            *(void *)(v29 + 112) = v28;
            uint64_t v2 = (uint64_t)v28;
            BOOL v15 = __OFADD__(i++, 1);
            if (v15) {
              goto LABEL_44;
            }
          }
          goto LABEL_42;
        }
        char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        if (v8) {
          goto LABEL_19;
        }
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
      }
      v3 += 24;
    }
    swift_bridgeObjectRelease();
    uint64_t i = *(void *)(v2 + 16);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t i = 0;
  }
LABEL_14:
  uint64_t v9 = v0[39];
  swift_bridgeObjectRelease();
  uint64_t v10 = swift_release();
  int64_t v12 = *(void *)(*(void *)(v9 + 112) + 16);
  if (v12 < i)
  {
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    return _swift_task_switch(v10, v12, v11);
  }
  sub_1000053B4(i, v12, &qword_100018C78, &qword_100018C70);
  swift_endAccess();
  uint64_t v10 = (uint64_t)sub_1000078C4;
  int64_t v12 = 0;
  uint64_t v11 = 0;
  return _swift_task_switch(v10, v12, v11);
}

uint64_t sub_1000078C4()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 448) = v1;
  static Configuration.intelligencePlatformComputeService.getter();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 456) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100007978;
  return static IntelligencePlatformComputeSystem.teardown(config:)(v1);
}

uint64_t sub_100007978()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 464) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2 + 288))(*(void *)(v2 + 448), *(void *)(v2 + 240));
  if (v0)
  {
    uint64_t v3 = sub_100007B74;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = sub_100007AF4;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100007AF4()
{
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100007B74()
{
  uint64_t v11 = v0;
  swift_task_dealloc();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[58];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v10 = v5;
    v0[15] = v3;
    swift_errorRetain();
    uint64_t v6 = String.init<A>(describing:)();
    v0[16] = sub_100005AA4(v6, v7, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "IntelligencePlatformComputeService: further error tearing down view system: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_willThrow();
  swift_errorRelease();
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  char v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100007D74()
{
  unint64_t v13 = v0;
  uint64_t v1 = v0[43];
  v0[54] = v1;
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  v0[55] = sub_100005A6C(v2, (uint64_t)qword_100018EE0);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v6 = v0[24];
    unint64_t v5 = v0[25];
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    swift_bridgeObjectRetain();
    v0[17] = sub_100005AA4(v6, v5, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2080;
    v0[18] = v1;
    swift_errorRetain();
    uint64_t v8 = String.init<A>(describing:)();
    v0[19] = sub_100005AA4(v8, v9, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "IntelligencePlatformComputeService: updateView: n:%s failed: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v10 = v0[39];
  return _swift_task_switch(sub_100007418, v10, 0);
}

uint64_t sub_100007FFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[6] = a6;
  v7[7] = a7;
  v7[4] = a4;
  v7[5] = a5;
  v7[3] = a1;
  return _swift_task_switch(sub_100005548, 0, 0);
}

uint64_t sub_100008024()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100008088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[27] = a4;
  v5[28] = v4;
  v5[25] = a2;
  v5[26] = a3;
  v5[24] = a1;
  sub_100004CB4(&qword_100018DA0);
  v5[29] = swift_task_alloc();
  return _swift_task_switch(sub_100008124, 0, 0);
}

uint64_t sub_100008124()
{
  uint64_t v1 = type metadata accessor for Configuration();
  v0[30] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[31] = v2;
  v0[32] = *(void *)(v2 + 64);
  uint64_t v3 = swift_task_alloc();
  v0[33] = v3;
  static Configuration.intelligencePlatformComputeService.getter();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[34] = v4;
  void *v4 = v0;
  v4[1] = sub_100008228;
  return static IntelligencePlatformComputeSystem.prepare(config:)(v3);
}

uint64_t sub_100008228()
{
  uint64_t v2 = (void *)*v1;
  v2[35] = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[33];
  uint64_t v4 = v2[31];
  uint64_t v5 = v2[30];
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  uint64_t v7 = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  if (v0)
  {
    v2[44] = v6;
    v2[45] = v7;
    v6(v3, v5);
    uint64_t v8 = sub_100008858;
  }
  else
  {
    v2[36] = v6;
    v2[37] = v7;
    v6(v3, v5);
    swift_task_dealloc();
    uint64_t v8 = sub_1000083C4;
  }
  return _swift_task_switch(v8, 0, 0);
}

uint64_t sub_1000083C4()
{
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[29];
  uint64_t v4 = v0[30];
  uint64_t v5 = v0[27];
  uint64_t v7 = v0[25];
  uint64_t v6 = v0[26];
  uint64_t v14 = v0[24];
  uint64_t v15 = v0[28];
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 1, 1, v8);
  uint64_t v9 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v9, v5, v4);
  unint64_t v10 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v11 = (char *)swift_allocObject();
  *((void *)v11 + 2) = 0;
  *((void *)v11 + 3) = 0;
  *((void *)v11 + 4) = v14;
  *((void *)v11 + 5) = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(&v11[v10], v9, v4);
  *(void *)&v11[(v2 + v10 + 7) & 0xFFFFFFFFFFFFFFF8] = v6;
  swift_task_dealloc();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0[38] = sub_1000042A4(v3, (uint64_t)&unk_100018C10, (uint64_t)v11, &qword_100018B28);
  uint64_t v12 = *(void *)(v15
                  + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateGroupTaskRegister);
  v0[39] = v12;
  return _swift_task_switch(sub_10000857C, v12, 0);
}

uint64_t sub_10000857C()
{
  uint64_t v1 = (char **)(v0[39] + 112);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10000C244(0, *((void *)v2 + 2) + 1, 1, v2, &qword_100018C20, &qword_100018C18);
    *uint64_t v1 = v2;
  }
  unint64_t v5 = *((void *)v2 + 2);
  unint64_t v4 = *((void *)v2 + 3);
  if (v5 >= v4 >> 1)
  {
    uint64_t v2 = sub_10000C244((char *)(v4 > 1), v5 + 1, 1, v2, &qword_100018C20, &qword_100018C18);
    *uint64_t v1 = v2;
  }
  uint64_t v6 = v0[38];
  uint64_t v8 = v0[24];
  uint64_t v7 = v0[25];
  *((void *)v2 + 2) = v5 + 1;
  uint64_t v9 = &v2[24 * v5];
  *((void *)v9 + 4) = v6;
  *((void *)v9 + 5) = v8;
  *((void *)v9 + 6) = v7;
  swift_endAccess();
  unint64_t v10 = (void *)swift_task_alloc();
  v0[40] = v10;
  uint64_t v11 = sub_100004CB4(&qword_100018B28);
  v0[41] = v11;
  uint64_t v12 = sub_100004CB4((uint64_t *)&unk_100018DD0);
  v0[42] = v12;
  *unint64_t v10 = v0;
  v10[1] = sub_100008744;
  uint64_t v13 = v0[38];
  return Task.value.getter(v0 + 13, v13, v11, v12, &protocol self-conformance witness table for Error);
}

uint64_t sub_100008744()
{
  *(void *)(*(void *)v1 + 344) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10000A07C;
  }
  else {
    uint64_t v2 = sub_100008C50;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100008858()
{
  uint64_t v14 = v0;
  swift_task_dealloc();
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[46] = sub_100005A6C(v1, (uint64_t)qword_100018EE0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[35];
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v13 = v7;
    v0[12] = v5;
    swift_errorRetain();
    sub_100004CB4((uint64_t *)&unk_100018DD0);
    uint64_t v8 = String.init<A>(describing:)();
    v0[11] = sub_100005AA4(v8, v9, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IntelligencePlatformComputeService: Error preparing system: %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v10 = swift_task_alloc();
  v0[47] = v10;
  static Configuration.intelligencePlatformComputeService.getter();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[48] = v11;
  void *v11 = v0;
  v11[1] = sub_100008AD4;
  return static IntelligencePlatformComputeSystem.teardown(config:)(v10);
}

uint64_t sub_100008AD4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 392) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2 + 352))(*(void *)(v2 + 376), *(void *)(v2 + 240));
  if (v0)
  {
    os_log_type_t v3 = sub_10000D5D8;
  }
  else
  {
    swift_task_dealloc();
    os_log_type_t v3 = sub_10000D5DC;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100008C50()
{
  uint64_t v1 = v0[39];
  v0[50] = v0[13];
  return _swift_task_switch(sub_100008C74, v1, 0);
}

uint64_t sub_100008C74()
{
  uint64_t v1 = v0[39];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v36 = *(void *)(v2 + 16);
  if (v36)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    for (uint64_t i = 0; i != v36; ++i)
    {
      uint64_t v5 = *(void *)(v2 + v3 + 40);
      uint64_t v6 = *(void *)(v2 + v3 + 48);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      if (static Task.== infix(_:_:)())
      {
        if (v5 == v0[24] && v6 == v0[25])
        {
          swift_release();
          swift_bridgeObjectRelease_n();
          swift_release();
LABEL_19:
          uint64_t v10 = swift_bridgeObjectRelease();
          unint64_t v13 = i + 1;
          if (__OFADD__(i, 1)) {
            goto LABEL_50;
          }
          unint64_t v14 = *(void *)(v2 + 16);
          while (2)
          {
            if (v13 == v14) {
              goto LABEL_14;
            }
            if (v13 >= v14)
            {
              __break(1u);
LABEL_44:
              __break(1u);
LABEL_45:
              __break(1u);
LABEL_46:
              __break(1u);
LABEL_47:
              __break(1u);
LABEL_48:
              __break(1u);
              goto LABEL_49;
            }
            unint64_t v34 = v13;
            uint64_t v37 = v2;
            uint64_t v16 = (void *)(v2 + v3);
            uint64_t v17 = *(void *)(v2 + v3 + 64);
            uint64_t v18 = *(void *)(v2 + v3 + 72);
            swift_bridgeObjectRetain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRetain();
            if (static Task.== infix(_:_:)())
            {
              if (v17 == v0[24] && v18 == v0[25])
              {
                swift_release();
                swift_bridgeObjectRelease_n();
                uint64_t v10 = swift_release();
                unint64_t v19 = v34;
LABEL_42:
                unint64_t v13 = v19 + 1;
                unint64_t v14 = *(void *)(v2 + 16);
                v3 += 24;
                continue;
              }
              char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_release();
              swift_bridgeObjectRelease();
              swift_release();
              uint64_t v10 = swift_bridgeObjectRelease();
              unint64_t v19 = v34;
              if (v31) {
                goto LABEL_42;
              }
            }
            else
            {
              swift_release();
              swift_bridgeObjectRelease();
              swift_release();
              uint64_t v10 = swift_bridgeObjectRelease();
              unint64_t v19 = v34;
            }
            break;
          }
          if (v19 == i)
          {
            BOOL v15 = __OFADD__(i++, 1);
            if (v15) {
              goto LABEL_44;
            }
          }
          else
          {
            if (i < 0) {
              goto LABEL_45;
            }
            unint64_t v20 = *(void *)(v2 + 16);
            if (i >= v20) {
              goto LABEL_46;
            }
            if (v19 >= v20) {
              goto LABEL_47;
            }
            uint64_t v21 = (uint64_t *)(v2 + 32 + 24 * i);
            uint64_t v22 = *v21;
            uint64_t v23 = v21[2];
            uint64_t v24 = v16[7];
            uint64_t v33 = v21[1];
            uint64_t v35 = v16[8];
            uint64_t v25 = v16[9];
            v26 = (char *)v37;
            swift_retain();
            swift_bridgeObjectRetain();
            swift_retain();
            swift_bridgeObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              v26 = sub_10000C5AC(v37);
            }
            v27 = &v26[24 * i];
            *((void *)v27 + 4) = v24;
            *((void *)v27 + 5) = v35;
            *((void *)v27 + 6) = v25;
            swift_release();
            uint64_t v10 = swift_bridgeObjectRelease();
            if (v19 >= *((void *)v26 + 2)) {
              goto LABEL_48;
            }
            v28 = v26;
            uint64_t v29 = v0[39];
            v30 = &v28[v3];
            *((void *)v30 + 7) = v22;
            *((void *)v30 + 8) = v33;
            *((void *)v30 + 9) = v23;
            swift_release();
            uint64_t v10 = swift_bridgeObjectRelease();
            *(void *)(v29 + 112) = v28;
            uint64_t v2 = (uint64_t)v28;
            BOOL v15 = __OFADD__(i++, 1);
            if (v15) {
              goto LABEL_44;
            }
          }
          goto LABEL_42;
        }
        char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        if (v8) {
          goto LABEL_19;
        }
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
      }
      v3 += 24;
    }
    swift_bridgeObjectRelease();
    uint64_t i = *(void *)(v2 + 16);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t i = 0;
  }
LABEL_14:
  uint64_t v9 = v0[39];
  swift_bridgeObjectRelease();
  uint64_t v10 = swift_release();
  int64_t v12 = *(void *)(*(void *)(v9 + 112) + 16);
  if (v12 < i)
  {
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    return _swift_task_switch(v10, v12, v11);
  }
  sub_1000053B4(i, v12, &qword_100018C20, &qword_100018C18);
  swift_endAccess();
  uint64_t v10 = (uint64_t)sub_100009120;
  int64_t v12 = 0;
  uint64_t v11 = 0;
  return _swift_task_switch(v10, v12, v11);
}

uint64_t sub_100009120()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 408) = v1;
  static Configuration.intelligencePlatformComputeService.getter();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 416) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000091D4;
  return static IntelligencePlatformComputeSystem.teardown(config:)(v1);
}

uint64_t sub_1000091D4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 424) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2 + 288))(*(void *)(v2 + 408), *(void *)(v2 + 240));
  if (v0)
  {
    uint64_t v3 = sub_100009350;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = sub_100009790;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100009350()
{
  uint64_t v21 = v0;
  swift_task_dealloc();
  uint64_t v1 = &IntelligencePlatformComputeService;
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005A6C(v2, (uint64_t)qword_100018EE0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = v0[53];
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    v20[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    v0[21] = v6;
    swift_errorRetain();
    uint64_t v8 = String.init<A>(describing:)();
    v0[22] = sub_100005AA4(v8, v9, v20);
    uint64_t v1 = &IntelligencePlatformComputeService;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "IntelligencePlatformComputeService: further error tearing down view system: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_willThrow();
  swift_bridgeObjectRelease();
  uint64_t v10 = v0[53];
  v0[54] = v10;
  if (v1[318].count != -1) {
    swift_once();
  }
  v0[55] = sub_100005A6C(v2, (uint64_t)qword_100018EE0);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v14 = v0[24];
    unint64_t v13 = v0[25];
    uint64_t v15 = swift_slowAlloc();
    v20[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315394;
    swift_bridgeObjectRetain();
    v0[17] = sub_100005AA4(v14, v13, v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    v0[18] = v10;
    swift_errorRetain();
    uint64_t v16 = String.init<A>(describing:)();
    v0[19] = sub_100005AA4(v16, v17, v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "IntelligencePlatformComputeService: updateGroup: n:%s failed: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v18 = v0[39];
  return _swift_task_switch(sub_1000099A0, v18, 0);
}

uint64_t sub_100009790()
{
  os_log_type_t v12 = v0;
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100005A6C(v1, (uint64_t)qword_100018EE0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[25];
  if (v4)
  {
    uint64_t v6 = v0[24];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[23] = sub_100005AA4(v6, v5, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IntelligencePlatformComputeService: updateGroupWithName %s returning responses", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  swift_release();

  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v9 = v0[50];
  return v8(v9);
}

uint64_t sub_1000099A0()
{
  uint64_t v1 = v0[39];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v36 = *(void *)(v2 + 16);
  if (v36)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    for (uint64_t i = 0; i != v36; ++i)
    {
      uint64_t v5 = *(void *)(v2 + v3 + 40);
      uint64_t v6 = *(void *)(v2 + v3 + 48);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      if (static Task.== infix(_:_:)())
      {
        if (v5 == v0[24] && v6 == v0[25])
        {
          swift_release();
          swift_bridgeObjectRelease_n();
          swift_release();
LABEL_19:
          uint64_t v10 = swift_bridgeObjectRelease();
          unint64_t v13 = i + 1;
          if (__OFADD__(i, 1)) {
            goto LABEL_50;
          }
          unint64_t v14 = *(void *)(v2 + 16);
          while (2)
          {
            if (v13 == v14) {
              goto LABEL_14;
            }
            if (v13 >= v14)
            {
              __break(1u);
LABEL_44:
              __break(1u);
LABEL_45:
              __break(1u);
LABEL_46:
              __break(1u);
LABEL_47:
              __break(1u);
LABEL_48:
              __break(1u);
              goto LABEL_49;
            }
            unint64_t v34 = v13;
            uint64_t v37 = v2;
            uint64_t v16 = (void *)(v2 + v3);
            uint64_t v17 = *(void *)(v2 + v3 + 64);
            uint64_t v18 = *(void *)(v2 + v3 + 72);
            swift_bridgeObjectRetain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRetain();
            if (static Task.== infix(_:_:)())
            {
              if (v17 == v0[24] && v18 == v0[25])
              {
                swift_release();
                swift_bridgeObjectRelease_n();
                uint64_t v10 = swift_release();
                unint64_t v19 = v34;
LABEL_42:
                unint64_t v13 = v19 + 1;
                unint64_t v14 = *(void *)(v2 + 16);
                v3 += 24;
                continue;
              }
              char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_release();
              swift_bridgeObjectRelease();
              swift_release();
              uint64_t v10 = swift_bridgeObjectRelease();
              unint64_t v19 = v34;
              if (v31) {
                goto LABEL_42;
              }
            }
            else
            {
              swift_release();
              swift_bridgeObjectRelease();
              swift_release();
              uint64_t v10 = swift_bridgeObjectRelease();
              unint64_t v19 = v34;
            }
            break;
          }
          if (v19 == i)
          {
            BOOL v15 = __OFADD__(i++, 1);
            if (v15) {
              goto LABEL_44;
            }
          }
          else
          {
            if (i < 0) {
              goto LABEL_45;
            }
            unint64_t v20 = *(void *)(v2 + 16);
            if (i >= v20) {
              goto LABEL_46;
            }
            if (v19 >= v20) {
              goto LABEL_47;
            }
            uint64_t v21 = (uint64_t *)(v2 + 32 + 24 * i);
            uint64_t v22 = *v21;
            uint64_t v23 = v21[2];
            uint64_t v24 = v16[7];
            uint64_t v33 = v21[1];
            uint64_t v35 = v16[8];
            uint64_t v25 = v16[9];
            v26 = (char *)v37;
            swift_retain();
            swift_bridgeObjectRetain();
            swift_retain();
            swift_bridgeObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              v26 = sub_10000C5AC(v37);
            }
            v27 = &v26[24 * i];
            *((void *)v27 + 4) = v24;
            *((void *)v27 + 5) = v35;
            *((void *)v27 + 6) = v25;
            swift_release();
            uint64_t v10 = swift_bridgeObjectRelease();
            if (v19 >= *((void *)v26 + 2)) {
              goto LABEL_48;
            }
            v28 = v26;
            uint64_t v29 = v0[39];
            v30 = &v28[v3];
            *((void *)v30 + 7) = v22;
            *((void *)v30 + 8) = v33;
            *((void *)v30 + 9) = v23;
            swift_release();
            uint64_t v10 = swift_bridgeObjectRelease();
            *(void *)(v29 + 112) = v28;
            uint64_t v2 = (uint64_t)v28;
            BOOL v15 = __OFADD__(i++, 1);
            if (v15) {
              goto LABEL_44;
            }
          }
          goto LABEL_42;
        }
        char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        if (v8) {
          goto LABEL_19;
        }
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
      }
      v3 += 24;
    }
    swift_bridgeObjectRelease();
    uint64_t i = *(void *)(v2 + 16);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t i = 0;
  }
LABEL_14:
  uint64_t v9 = v0[39];
  swift_bridgeObjectRelease();
  uint64_t v10 = swift_release();
  int64_t v12 = *(void *)(*(void *)(v9 + 112) + 16);
  if (v12 < i)
  {
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    return _swift_task_switch(v10, v12, v11);
  }
  sub_1000053B4(i, v12, &qword_100018C20, &qword_100018C18);
  swift_endAccess();
  uint64_t v10 = (uint64_t)sub_100009E4C;
  int64_t v12 = 0;
  uint64_t v11 = 0;
  return _swift_task_switch(v10, v12, v11);
}

uint64_t sub_100009E4C()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 448) = v1;
  static Configuration.intelligencePlatformComputeService.getter();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 456) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100009F00;
  return static IntelligencePlatformComputeSystem.teardown(config:)(v1);
}

uint64_t sub_100009F00()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 464) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2 + 288))(*(void *)(v2 + 448), *(void *)(v2 + 240));
  if (v0)
  {
    uint64_t v3 = sub_10000D5C8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = sub_10000D5C4;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10000A07C()
{
  unint64_t v13 = v0;
  uint64_t v1 = v0[43];
  v0[54] = v1;
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  v0[55] = sub_100005A6C(v2, (uint64_t)qword_100018EE0);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v6 = v0[24];
    unint64_t v5 = v0[25];
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    swift_bridgeObjectRetain();
    v0[17] = sub_100005AA4(v6, v5, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2080;
    v0[18] = v1;
    swift_errorRetain();
    uint64_t v8 = String.init<A>(describing:)();
    v0[19] = sub_100005AA4(v8, v9, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "IntelligencePlatformComputeService: updateGroup: n:%s failed: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v10 = v0[39];
  return _swift_task_switch(sub_1000099A0, v10, 0);
}

uint64_t sub_10000A304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[6] = a6;
  v7[7] = a7;
  v7[4] = a4;
  v7[5] = a5;
  v7[3] = a1;
  return _swift_task_switch(sub_10000A32C, 0, 0);
}

uint64_t sub_10000A32C()
{
  uint64_t v14 = v0;
  static Task<>.checkCancellation()();
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100005A6C(v1, (uint64_t)qword_100018EE0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[5];
  if (v4)
  {
    uint64_t v6 = v0[4];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_100005AA4(v6, v5, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IntelligencePlatformComputeService: updateGroupWithName %s begining update", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  type metadata accessor for ViewUpdate.ViewInProcessRunner();
  v0[8] = static ViewUpdate.ViewInProcessRunner.sharedInProcessRunner(for:)();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[9] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_10000A5D4;
  uint64_t v9 = v0[7];
  uint64_t v11 = v0[4];
  uint64_t v10 = v0[5];
  return ViewUpdate.ViewInProcessRunner.update(groupName:namesAndRequests:)(v11, v10, v9);
}

uint64_t sub_10000A5D4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    unint64_t v5 = sub_10000D5D4;
  }
  else
  {
    *(void *)(v4 + 88) = a1;
    unint64_t v5 = sub_10000D5BC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000A6FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return _swift_task_switch(sub_1000057F0, 0, 0);
}

uint64_t sub_10000A720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  return _swift_task_switch(sub_10000A744, 0, 0);
}

uint64_t sub_10000A744()
{
  uint64_t v18 = v0;
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100005A6C(v1, (uint64_t)qword_100018EE0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v6 = v0[5];
  unint64_t v5 = v0[6];
  if (v4)
  {
    uint64_t v7 = v0[4];
    uint64_t v8 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    swift_bridgeObjectRetain();
    v0[2] = sub_100005AA4(v7, v6, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2048;
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v0[3] = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IntelligencePlatformComputeService: updateGroupWithName %s called with %ld namesAndRequests", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  if (qword_1000189E0 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Configuration();
  uint64_t v11 = sub_100005A6C(v10, (uint64_t)qword_100018EA8);
  uint64_t v12 = (void *)swift_task_alloc();
  v0[8] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_10000AA50;
  uint64_t v13 = v0[6];
  uint64_t v15 = v0[4];
  uint64_t v14 = v0[5];
  return sub_100008088(v15, v14, v13, v11);
}

uint64_t sub_10000AA50(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  unint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_10000ACD4(int a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  v4[4] = v7;
  sub_100004728(0, &qword_100018D70);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4[5] = v9;
  id v10 = a4;
  uint64_t v11 = (void *)swift_task_alloc();
  v4[6] = v11;
  void *v11 = v4;
  v11[1] = sub_10000ADF8;
  v11[6] = v9;
  v11[7] = v10;
  v11[4] = v6;
  v11[5] = v8;
  return _swift_task_switch(sub_10000A744, 0, 0);
}

uint64_t sub_10000ADF8()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v5 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v6 = _convertErrorToNSError(_:)();
    swift_errorRelease();
    Class isa = 0;
    uint64_t v8 = (void *)v6;
  }
  else
  {
    sub_100004728(0, &qword_100018BF8);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v8 = isa;
  }
  uint64_t v9 = *(void (***)(void, void, void))(v3 + 24);
  ((void (**)(void, Class, uint64_t))v9)[2](v9, isa, v6);

  _Block_release(v9);
  id v10 = *(uint64_t (**)(void))(v5 + 8);
  return v10();
}

uint64_t sub_10000B15C(int a1, char a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  v4[4] = v8;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, char))((char *)&dword_100018BC8 + dword_100018BC8);
  id v10 = a4;
  uint64_t v11 = (void *)swift_task_alloc();
  v4[5] = v11;
  void *v11 = v4;
  v11[1] = sub_10000D5D0;
  return v13(v7, v9, a2);
}

uint64_t sub_10000B3D4(int a1, char a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  v4[4] = v8;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, char))((char *)&dword_100018BA0 + dword_100018BA0);
  id v10 = a4;
  uint64_t v11 = (void *)swift_task_alloc();
  v4[5] = v11;
  void *v11 = v4;
  v11[1] = sub_10000B4C8;
  return v13(v7, v9, a2);
}

uint64_t sub_10000B4C8(char a1)
{
  uint64_t v3 = v1;
  uint64_t v6 = *v2;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(v5 + 24);
  if (v3)
  {
    id v10 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, a1 & 1, 0);
  }
  _Block_release(*(const void **)(v6 + 24));
  uint64_t v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

uint64_t sub_10000B67C()
{
  *(void *)(v1 + 64) = v0;
  return _swift_task_switch(sub_10000B69C, 0, 0);
}

uint64_t sub_10000B69C()
{
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[9] = sub_100005A6C(v1, (uint64_t)qword_100018EE0);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IntelligencePlatformComputeService: stop called", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[8];

  uint64_t v6 = *(void *)(v5
                 + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateViewTaskRegister);
  v0[10] = v6;
  return _swift_task_switch(sub_10000B7CC, v6, 0);
}

uint64_t sub_10000B7CC()
{
  uint64_t v13 = v0;
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = (void *)(v1 + 112);
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)(v1 + 112) + 16);
  if (v3)
  {
    uint64_t v11 = (void *)(v1 + 112);
    uint64_t v4 = (unint64_t *)(swift_bridgeObjectRetain() + 48);
    do
    {
      uint64_t v6 = *(v4 - 1);
      unint64_t v7 = *v4;
      swift_bridgeObjectRetain_n();
      swift_retain();
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v5 = swift_slowAlloc();
        uint64_t v12 = swift_slowAlloc();
        *(_DWORD *)uint64_t v5 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v5 + 4) = sub_100005AA4(v6, v7, &v12);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "IntelligencePlatformComputeService: cancelling task %s", (uint8_t *)v5, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      sub_100004CB4(&qword_100018B20);
      sub_100004CB4((uint64_t *)&unk_100018DD0);
      Task.cancel()();
      swift_release();
      v4 += 3;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    uint64_t v2 = v11;
  }
  *uint64_t v2 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10000BA24, 0, 0);
}

uint64_t sub_10000BA24()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 64)
                 + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateGroupTaskRegister);
  *(void *)(v0 + 88) = v1;
  return _swift_task_switch(sub_10000BA50, v1, 0);
}

uint64_t sub_10000BA50()
{
  uint64_t v15 = v0;
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = (void *)(v1 + 112);
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)(v1 + 112) + 16);
  if (v3)
  {
    uint64_t v12 = (void *)(v1 + 112);
    uint64_t v4 = (unint64_t *)(swift_bridgeObjectRetain() + 48);
    uint64_t v13 = v0;
    do
    {
      uint64_t v6 = *(v4 - 1);
      unint64_t v7 = *v4;
      swift_bridgeObjectRetain_n();
      swift_retain();
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v5 = swift_slowAlloc();
        uint64_t v14 = swift_slowAlloc();
        *(_DWORD *)uint64_t v5 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v5 + 4) = sub_100005AA4(v6, v7, &v14);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "IntelligencePlatformComputeService: cancelling task %s", (uint8_t *)v5, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v0 = v13;
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      sub_100004CB4(&qword_100018B28);
      sub_100004CB4((uint64_t *)&unk_100018DD0);
      Task.cancel()();
      swift_release();
      v4 += 3;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    uint64_t v2 = v12;
  }
  *uint64_t v2 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  id v10 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v10(1);
}

uint64_t sub_10000BE10(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  void *v5 = v2;
  v5[1] = sub_10000BED4;
  v5[8] = v4;
  return _swift_task_switch(sub_10000B69C, 0, 0);
}

uint64_t sub_10000BED4(char a1)
{
  uint64_t v3 = v1;
  uint64_t v6 = *v2;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();

  uint64_t v9 = *(void *)(v5 + 24);
  if (v3)
  {
    id v10 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, a1 & 1, 0);
  }
  _Block_release(*(const void **)(v6 + 24));
  uint64_t v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

id IntelligencePlatformComputeServiceXPC.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntelligencePlatformComputeService()
{
  return self;
}

uint64_t sub_10000C1DC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for IntelligencePlatformComputeService.TaskRegister()
{
  return sub_10000D58C();
}

char *sub_10000C244(char *result, int64_t a2, char a3, char *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = *((void *)a4 + 3);
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
    uint64_t v11 = *((void *)a4 + 2);
    if (v10 <= v11) {
      uint64_t v12 = *((void *)a4 + 2);
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      sub_100004CB4(a5);
      uint64_t v13 = (char *)swift_allocObject();
      size_t v14 = j__malloc_size(v13);
      *((void *)v13 + 2) = v11;
      *((void *)v13 + 3) = 2 * ((uint64_t)(v14 - 32) / 24);
      uint64_t v15 = v13 + 32;
      if (v8)
      {
LABEL_13:
        if (v13 != a4 || v15 >= &a4[24 * v11 + 32]) {
          memmove(v15, a4 + 32, 24 * v11);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v15 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10000C5E4(0, v11, (unint64_t)v15, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C378()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C3B8()
{
  objc_super v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_100005DE0;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_100018B40 + dword_100018B40);
  return v5(v2, v3);
}

uint64_t sub_10000C46C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C4A8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 24);
  uint64_t v5 = *(void **)(v0 + 32);
  id v4 = *(void **)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_100005DE0;
  uint64_t v7 = (uint64_t (*)(int, char, void *, void *))((char *)&dword_100018B80 + dword_100018B80);
  return v7(v2, v3, v5, v4);
}

char *sub_10000C574(uint64_t a1)
{
  return sub_10000C244(0, *(void *)(a1 + 16), 0, (char *)a1, &qword_100018C78, &qword_100018C70);
}

char *sub_10000C5AC(uint64_t a1)
{
  return sub_10000C244(0, *(void *)(a1 + 16), 0, (char *)a1, &qword_100018C20, &qword_100018C18);
}

uint64_t sub_10000C5E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 24 * a1 + 32;
    unint64_t v7 = a3 + 24 * v5;
    if (v6 >= v7 || v6 + 24 * v5 <= a3)
    {
      sub_100004CB4(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000C6F0(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 92) = a3;
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = a2;
  return _swift_task_switch(sub_10000C714, 0, 0);
}

uint64_t sub_10000C714()
{
  uint64_t v16 = v0;
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100005A6C(v1, (uint64_t)qword_100018EE0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(v0 + 24);
    int v14 = *(unsigned __int8 *)(v0 + 92);
    unint64_t v5 = *(void *)(v0 + 32);
    uint64_t v6 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 16) = sub_100005AA4(v4, v5, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 1024;
    *(_DWORD *)(v0 + 88) = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IntelligencePlatformComputeService: clearViewWithName called [name: %s, fullRebuild: %{BOOL}d]", (uint8_t *)v6, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  if (qword_1000189E0 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Configuration();
  *(void *)(v0 + 40) = v7;
  sub_100005A6C(v7, (uint64_t)qword_100018EA8);
  uint64_t v8 = *(void *)(v7 - 8);
  *(void *)(v0 + 48) = v8;
  *(void *)(v0 + 56) = swift_task_alloc();
  (*(void (**)(void))(v8 + 16))();
  static Task<>.checkCancellation()();
  type metadata accessor for ViewUpdate.ViewInProcessRunner();
  *(void *)(v0 + 64) = static ViewUpdate.ViewInProcessRunner.sharedInProcessRunner(for:)();
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_10000CAD0;
  uint64_t v10 = *(unsigned __int8 *)(v0 + 92);
  uint64_t v12 = *(void *)(v0 + 24);
  uint64_t v11 = *(void *)(v0 + 32);
  return ViewUpdate.ViewInProcessRunner.clear(viewName:fullRebuild:)(v12, v11, v10);
}

uint64_t sub_10000CAD0()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10000D5C0;
  }
  else {
    uint64_t v2 = sub_10000D5CC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000CBE4(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 92) = a3;
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = a2;
  return _swift_task_switch(sub_10000CC08, 0, 0);
}

uint64_t sub_10000CC08()
{
  uint64_t v16 = v0;
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100005A6C(v1, (uint64_t)qword_100018EE0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(v0 + 24);
    int v14 = *(unsigned __int8 *)(v0 + 92);
    unint64_t v5 = *(void *)(v0 + 32);
    uint64_t v6 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 16) = sub_100005AA4(v4, v5, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 1024;
    *(_DWORD *)(v0 + 88) = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IntelligencePlatformComputeService: truncateViewWithName called [name: %s, fullRebuild: %{BOOL}d]", (uint8_t *)v6, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  if (qword_1000189E0 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Configuration();
  *(void *)(v0 + 40) = v7;
  sub_100005A6C(v7, (uint64_t)qword_100018EA8);
  uint64_t v8 = *(void *)(v7 - 8);
  *(void *)(v0 + 48) = v8;
  *(void *)(v0 + 56) = swift_task_alloc();
  (*(void (**)(void))(v8 + 16))();
  static Task<>.checkCancellation()();
  type metadata accessor for ViewUpdate.ViewInProcessRunner();
  *(void *)(v0 + 64) = static ViewUpdate.ViewInProcessRunner.sharedInProcessRunner(for:)();
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_10000CFC4;
  uint64_t v10 = *(unsigned __int8 *)(v0 + 92);
  uint64_t v12 = *(void *)(v0 + 24);
  uint64_t v11 = *(void *)(v0 + 32);
  return ViewUpdate.ViewInProcessRunner.truncate(viewName:fullRebuild:)(v12, v11, v10);
}

uint64_t sub_10000CFC4()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10000D16C;
  }
  else {
    uint64_t v2 = sub_10000D0D8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000D0D8()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  return v4(1);
}

uint64_t sub_10000D16C()
{
  swift_release();
  (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1(0);
}

uint64_t sub_10000D1F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004CB4(&qword_100018D30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D264()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000D2AC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 24);
  unint64_t v5 = *(void **)(v0 + 32);
  uint64_t v4 = *(void **)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_100005DE0;
  uint64_t v7 = (uint64_t (*)(int, char, void *, void *))((char *)&dword_100018BA8 + dword_100018BA8);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000D37C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_100005DE0;
  uint64_t v7 = (uint64_t (*)(int, int, void *, void *))((char *)&dword_100018BD0 + dword_100018BD0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000D448(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for Configuration() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_100005DE0;
  v10[6] = v8;
  v10[7] = v9;
  v10[4] = v6;
  v10[5] = v7;
  v10[3] = a1;
  return _swift_task_switch(sub_10000A32C, 0, 0);
}

uint64_t sub_10000D58C()
{
  return swift_getGenericMetadata();
}

uint64_t sub_10000D5E0()
{
  uint64_t v0 = sub_100004CB4(&qword_100018D30);
  sub_100005F70(v0, qword_100018EC8);
  uint64_t v1 = sub_100005A6C(v0, (uint64_t)qword_100018EC8);
  uint64_t v2 = type metadata accessor for Configuration();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 1, 1, v2);
}

uint64_t sub_10000D678(void *a1)
{
  uint64_t v2 = sub_100004CB4(&qword_100018DA0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100005A6C(v5, (uint64_t)qword_100018EE0);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "XPC connection is invalid, stopping work", v8, 2u);
    swift_slowDealloc();
  }

  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a1;
  id v11 = a1;
  sub_10000DE54((uint64_t)v4, (uint64_t)&unk_100018DF0, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_10000D830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 64) = a4;
  return _swift_task_switch(sub_10000D850, 0, 0);
}

uint64_t sub_10000D850()
{
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[9] = sub_100005A6C(v1, (uint64_t)qword_100018EE0);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IntelligencePlatformComputeService: stop called", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[8];

  uint64_t v6 = *(void *)(v5
                 + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateViewTaskRegister);
  v0[10] = v6;
  return _swift_task_switch(sub_10000D980, v6, 0);
}

uint64_t sub_10000D980()
{
  uint64_t v13 = v0;
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = (void *)(v1 + 112);
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)(v1 + 112) + 16);
  if (v3)
  {
    id v11 = (void *)(v1 + 112);
    uint64_t v4 = (unint64_t *)(swift_bridgeObjectRetain() + 48);
    do
    {
      uint64_t v6 = *(v4 - 1);
      unint64_t v7 = *v4;
      swift_bridgeObjectRetain_n();
      swift_retain();
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v5 = swift_slowAlloc();
        uint64_t v12 = swift_slowAlloc();
        *(_DWORD *)uint64_t v5 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v5 + 4) = sub_100005AA4(v6, v7, &v12);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "IntelligencePlatformComputeService: cancelling task %s", (uint8_t *)v5, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      sub_100004CB4(&qword_100018B20);
      sub_100004CB4((uint64_t *)&unk_100018DD0);
      Task.cancel()();
      swift_release();
      v4 += 3;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    uint64_t v2 = v11;
  }
  *uint64_t v2 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10000DBD8, 0, 0);
}

uint64_t sub_10000DBD8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 64)
                 + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateGroupTaskRegister);
  *(void *)(v0 + 88) = v1;
  return _swift_task_switch(sub_10000DC04, v1, 0);
}

uint64_t sub_10000DC04()
{
  uint64_t v15 = v0;
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = (void *)(v1 + 112);
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)(v1 + 112) + 16);
  if (v3)
  {
    uint64_t v12 = (void *)(v1 + 112);
    uint64_t v4 = (unint64_t *)(swift_bridgeObjectRetain() + 48);
    uint64_t v13 = v0;
    do
    {
      uint64_t v6 = *(v4 - 1);
      unint64_t v7 = *v4;
      swift_bridgeObjectRetain_n();
      swift_retain();
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v5 = swift_slowAlloc();
        uint64_t v14 = swift_slowAlloc();
        *(_DWORD *)uint64_t v5 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v5 + 4) = sub_100005AA4(v6, v7, &v14);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "IntelligencePlatformComputeService: cancelling task %s", (uint8_t *)v5, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v0 = v13;
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      sub_100004CB4(&qword_100018B28);
      sub_100004CB4((uint64_t *)&unk_100018DD0);
      Task.cancel()();
      swift_release();
      v4 += 3;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    uint64_t v2 = v12;
  }
  *uint64_t v2 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_10000DE54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100010254(a1, &qword_100018DA0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000E000(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000E044(void *a1)
{
  uint64_t v2 = sub_100004CB4(&qword_100018DA0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000189E8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100004CB4(&qword_100018D30);
  uint64_t v6 = sub_100005A6C(v5, (uint64_t)qword_100018EC8);
  uint64_t v7 = swift_beginAccess();
  __chkstk_darwin(v7);
  os_log_type_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D1F8(v6, (uint64_t)v9);
  uint64_t v10 = type metadata accessor for Configuration();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    __break(1u);
LABEL_11:
    _exit(1);
  }
  char v12 = Configuration.isIPCSMemoryTransactionEnabled.getter();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  if ((v12 & 1) == 0) {
    goto LABEL_11;
  }
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  sub_100005A6C(v13, (uint64_t)qword_100018EE0);
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "IntelligencePlatformComputeService: Recieved SIGTERM, stopping work", v16, 2u);
    swift_slowDealloc();
  }

  uint64_t v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v4, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = a1;
  id v19 = a1;
  sub_10000DE54((uint64_t)v4, (uint64_t)&unk_100018DB0, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_10000E348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 64) = a4;
  return _swift_task_switch(sub_10000E368, 0, 0);
}

uint64_t sub_10000E368()
{
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[9] = sub_100005A6C(v1, (uint64_t)qword_100018EE0);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "IntelligencePlatformComputeService: stop called", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[8];

  uint64_t v6 = *(void *)(v5
                 + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateViewTaskRegister);
  v0[10] = v6;
  return _swift_task_switch(sub_10000E498, v6, 0);
}

uint64_t sub_10000E498()
{
  uint64_t v13 = v0;
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = (void *)(v1 + 112);
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)(v1 + 112) + 16);
  if (v3)
  {
    uint64_t v11 = (void *)(v1 + 112);
    uint64_t v4 = (unint64_t *)(swift_bridgeObjectRetain() + 48);
    do
    {
      uint64_t v6 = *(v4 - 1);
      unint64_t v7 = *v4;
      swift_bridgeObjectRetain_n();
      swift_retain();
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v5 = swift_slowAlloc();
        uint64_t v12 = swift_slowAlloc();
        *(_DWORD *)uint64_t v5 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v5 + 4) = sub_100005AA4(v6, v7, &v12);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "IntelligencePlatformComputeService: cancelling task %s", (uint8_t *)v5, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      sub_100004CB4(&qword_100018B20);
      sub_100004CB4((uint64_t *)&unk_100018DD0);
      Task.cancel()();
      swift_release();
      v4 += 3;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    uint64_t v2 = v11;
  }
  *uint64_t v2 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10000E6F0, 0, 0);
}

uint64_t sub_10000E6F0()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 64)
                 + OBJC_IVAR____TtC34IntelligencePlatformComputeService34IntelligencePlatformComputeService_updateGroupTaskRegister);
  *(void *)(v0 + 88) = v1;
  return _swift_task_switch(sub_10000E71C, v1, 0);
}

uint64_t sub_10000E71C()
{
  uint64_t v13 = v0;
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = (void *)(v1 + 112);
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)(v1 + 112) + 16);
  if (v3)
  {
    uint64_t v11 = (void *)(v1 + 112);
    uint64_t v4 = (unint64_t *)(swift_bridgeObjectRetain() + 48);
    do
    {
      uint64_t v6 = *(v4 - 1);
      unint64_t v7 = *v4;
      swift_bridgeObjectRetain_n();
      swift_retain();
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v5 = swift_slowAlloc();
        uint64_t v12 = swift_slowAlloc();
        *(_DWORD *)uint64_t v5 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v5 + 4) = sub_100005AA4(v6, v7, &v12);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "IntelligencePlatformComputeService: cancelling task %s", (uint8_t *)v5, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      sub_100004CB4(&qword_100018B28);
      sub_100004CB4((uint64_t *)&unk_100018DD0);
      Task.cancel()();
      swift_release();
      v4 += 3;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    uint64_t v2 = v11;
  }
  *uint64_t v2 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10000E974, 0, 0);
}

uint64_t sub_10000E974()
{
  xpc_transaction_exit_clean();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_10000EA70()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntelligencePlatformComputeServiceXPC.ServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id BMDaemonLibraryLoader.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id IntelligencePlatformComputeServiceXPC.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for IntelligencePlatformComputeServiceXPC()
{
  return self;
}

uint64_t type metadata accessor for IntelligencePlatformComputeServiceXPC.ServiceDelegate()
{
  return self;
}

uint64_t sub_10000EB9C(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000EBAC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10000EBE8@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unsigned char **sub_10000EC18(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10000EC28(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000EC50(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100005AA4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10000ECC8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000ED60(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000EF40(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000EF40(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000ED60(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000EED8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000EED8(uint64_t a1, uint64_t a2)
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
  sub_100004CB4(&qword_100018DE0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000EF40(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004CB4(&qword_100018DE0);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_10000F090(uint64_t a1)
{
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005A6C(v2, (uint64_t)qword_100018EE0);
  unint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    size_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)size_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "IntelligencePlatformComputeServiceXPC: starting...", v5, 2u);
    swift_slowDealloc();
  }

  if (qword_1000189E8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100004CB4(&qword_100018D30);
  uint64_t v7 = sub_100005A6C(v6, (uint64_t)qword_100018EC8);
  __chkstk_darwin(v7);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Configuration();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  swift_beginAccess();
  sub_100010490((uint64_t)v9, v7);
  swift_endAccess();
  id v12 = [objc_allocWithZone((Class)type metadata accessor for IntelligencePlatformComputeServiceXPC.ServiceDelegate()) init];
  id v13 = [self serviceListener];
  [v13 setDelegate:v12];
  [v13 resume];

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_10000F344(uint64_t a1)
{
  if (qword_1000189E8 != -1) {
    swift_once();
  }
  *(void *)&long long v69 = a1;
  uint64_t v2 = sub_100004CB4(&qword_100018D30);
  uint64_t v3 = sub_100005A6C(v2, (uint64_t)qword_100018EC8);
  uint64_t v4 = swift_beginAccess();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D1F8(v3, (uint64_t)v6);
  uint64_t v7 = type metadata accessor for Configuration();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (result == 1)
  {
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v10 = type metadata accessor for Options();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  Configuration.options.getter();
  uint64_t v13 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  __chkstk_darwin(v13);
  uint64_t v14 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Options.noOperation.getter();
  sub_1000100B8(&qword_100018D38, (void (*)(uint64_t))&type metadata accessor for Options);
  char v15 = dispatch thunk of SetAlgebra.isSuperset(of:)();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v11 + 8);
  v16(v14, v10);
  v16(v14, v10);
  if (v15)
  {
    if (qword_1000189F0 != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    sub_100005A6C(v17, (uint64_t)qword_100018EE0);
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v18, v19))
    {
      uint64_t v22 = 0;
LABEL_37:

      return v22;
    }
    unint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "IntelligencePlatformComputeService: service is in no-op mode.", v20, 2u);
LABEL_25:
    swift_slowDealloc();
    uint64_t v22 = 0;
    goto LABEL_37;
  }
  uint64_t v21 = (void *)v69;
  if ([(id)v69 valueForEntitlement:kGDCComputeServiceName])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v77, 0, sizeof(v77));
  }
  sub_10000FFF0((uint64_t)v77, (uint64_t)&aBlock);
  if (!v73)
  {
    sub_100010254((uint64_t)&aBlock, &qword_100018D40);
LABEL_21:
    if (qword_1000189F0 != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    sub_100005A6C(v28, (uint64_t)qword_100018EE0);
    uint64_t v29 = v21;
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v18, v30))
    {

      uint64_t v22 = 0;
      uint64_t v18 = v29;
      goto LABEL_37;
    }
    char v31 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)char v31 = 67109120;
    LODWORD(aBlock) = [v29 processIdentifier];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v18, v30, "IntelligencePlatformComputeService: Rejecting connection from %d: lacking entitlement", v31, 8u);
    goto LABEL_25;
  }
  if (!swift_dynamicCast() || (v76 & 1) == 0) {
    goto LABEL_21;
  }
  if (qword_1000189F0 != -1) {
    swift_once();
  }
  uint64_t v23 = type metadata accessor for Logger();
  sub_100005A6C(v23, (uint64_t)qword_100018EE0);
  uint64_t v24 = v21;
  uint64_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v27 = 67109120;
    LODWORD(aBlock) = [v24 processIdentifier];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v25, v26, "IntelligencePlatformComputeService: connection from %d", v27, 8u);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v25 = v24;
  }

  id v32 = [self interfaceWithProtocol:&OBJC_PROTOCOL___GDCIntelligencePlatformComputeServiceProtocol];
  [v24 setExportedInterface:v32];

  sub_100004CB4(&qword_100018D48);
  uint64_t v33 = swift_allocObject();
  long long v69 = xmmword_100011260;
  *(_OWORD *)(v33 + 16) = xmmword_100011260;
  uint64_t v34 = sub_100004728(0, &qword_100018D50);
  uint64_t v35 = sub_100004CB4(&qword_100018D58);
  *(void *)(v33 + 56) = v35;
  *(void *)(v33 + 32) = v34;
  uint64_t v36 = sub_100004728(0, &qword_100018D60);
  *(void *)(v33 + 88) = sub_100004CB4(&qword_100018D68);
  *(void *)(v33 + 64) = v36;
  id v37 = objc_allocWithZone((Class)NSSet);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v39 = [v37 initWithArray:isa];

  aBlock = 0;
  uint64_t result = static Set._forceBridgeFromObjectiveC(_:result:)();
  if (!aBlock) {
    goto LABEL_39;
  }

  id v40 = [v24 exportedInterface];
  if (v40)
  {
    v41 = v40;
    Class v42 = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v41 setClasses:v42 forSelector:"updateViewWithName:viewUpdateSourceRequests:reply:" argumentIndex:1 ofReply:0];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = v69;
  *(void *)(v43 + 56) = v35;
  *(void *)(v43 + 32) = v34;
  uint64_t v44 = sub_100004728(0, &qword_100018D70);
  *(void *)(v43 + 88) = sub_100004CB4(&qword_100018D78);
  *(void *)(v43 + 64) = v44;
  id v45 = objc_allocWithZone((Class)NSSet);
  Class v46 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v47 = [v45 initWithArray:v46];

  aBlock = 0;
  uint64_t result = static Set._forceBridgeFromObjectiveC(_:result:)();
  if (aBlock)
  {

    id v48 = [v24 exportedInterface];
    if (v48)
    {
      v49 = v48;
      Class v50 = Set._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v49 setClasses:v50 forSelector:"updateGroupWithName:namesAndRequests:reply:" argumentIndex:1 ofReply:0];
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    id v51 = [objc_allocWithZone((Class)type metadata accessor for IntelligencePlatformComputeService()) init];
    [v24 setExportedObject:v51];
    uint64_t v52 = swift_allocObject();
    *(void *)(v52 + 16) = v51;
    v74 = sub_100010090;
    uint64_t v75 = v52;
    aBlock = _NSConcreteStackBlock;
    uint64_t v71 = 1107296256;
    v72 = sub_10000E000;
    v73 = &unk_100014A60;
    v53 = _Block_copy(&aBlock);
    id v54 = v51;
    swift_release();
    [v24 setInvalidationHandler:v53];
    _Block_release(v53);
    sub_100004728(0, &qword_100018D80);
    static OS_dispatch_source.makeSignalSource(signal:queue:)();
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v55 = swift_allocObject();
    *(void *)(v55 + 16) = v54;
    v74 = sub_1000100B0;
    uint64_t v75 = v55;
    aBlock = _NSConcreteStackBlock;
    uint64_t v71 = 1107296256;
    v72 = sub_10000E000;
    v73 = &unk_100014AB0;
    v56 = _Block_copy(&aBlock);
    *(void *)&long long v69 = v24;
    v57 = v56;
    uint64_t v66 = type metadata accessor for DispatchQoS();
    v67 = &v65;
    uint64_t v58 = *(void *)(v66 - 8);
    __chkstk_darwin(v66);
    v60 = (char *)&v65 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = v54;
    static DispatchQoS.unspecified.getter();
    uint64_t v61 = type metadata accessor for DispatchWorkItemFlags();
    uint64_t v65 = (uint64_t)&v65;
    uint64_t v62 = *(void *)(v61 - 8);
    __chkstk_darwin(v61);
    v64 = (char *)&v65 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(void *)&v77[0] = &_swiftEmptyArrayStorage;
    sub_1000100B8(&qword_100018D88, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100004CB4(&qword_100018D90);
    sub_100010100();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_source.setEventHandler(qos:flags:handler:)();
    _Block_release(v57);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v61);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v66);
    swift_release();
    OS_dispatch_source.resume()();
    objc_msgSend((id)v69, "resume", v65);
    swift_unknownObjectRelease();
    uint64_t v22 = 1;
    goto LABEL_37;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10000FFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004CB4(&qword_100018D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010058()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010090()
{
  return sub_10000D678(*(void **)(v0 + 16));
}

uint64_t sub_100010098(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000100A8()
{
  return swift_release();
}

uint64_t sub_1000100B0()
{
  return sub_10000E044(*(void **)(v0 + 16));
}

uint64_t sub_1000100B8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100010100()
{
  unint64_t result = qword_100018D98;
  if (!qword_100018D98)
  {
    sub_10001015C(&qword_100018D90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018D98);
  }
  return result;
}

uint64_t sub_10001015C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000101A8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100003FF8;
  v3[8] = v2;
  return _swift_task_switch(sub_10000E368, 0, 0);
}

uint64_t sub_100010254(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004CB4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000102B0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000102E8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100003FF8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100018DB8 + dword_100018DB8);
  return v6(a1, v4);
}

uint64_t sub_1000103A4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000103E4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005DE0;
  v3[8] = v2;
  return _swift_task_switch(sub_10000D850, 0, 0);
}

uint64_t sub_100010490(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004CB4(&qword_100018D30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t static BMDaemonLibraryLoader.loadRootLibrary()()
{
  type metadata accessor for Library();
  sub_10000670C();

  return static UnifiedLibrary.add(library:)();
}

id BMDaemonLibraryLoader.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BMDaemonLibraryLoader();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for BMDaemonLibraryLoader()
{
  return self;
}

id BMDaemonLibraryLoader.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BMDaemonLibraryLoader();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100010658()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005F70(v0, qword_100018EE0);
  sub_100005A6C(v0, (uint64_t)qword_100018EE0);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000106D0@<X0>(char *a1@<X0>, int a2@<W2>, void *a3@<X8>)
{
  uint64_t result = confstr(a2, a1, 0x400uLL);
  if (result >= 1 && a1)
  {
    uint64_t result = String.init(cString:)();
    *a3 = result;
    a3[1] = v6;
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
  return result;
}

uint64_t String.realpath.getter()
{
  uint64_t v0 = String.utf8CString.getter();
  uint64_t v1 = realpath_DARWIN_EXTSN((const char *)(v0 + 32), 0);
  swift_release();
  if (!v1) {
    return 0;
  }
  uint64_t v2 = String.init(cString:)();
  swift_slowDealloc();
  return v2;
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage.init(length:)()
{
  return __DataStorage.init(length:)();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t static UnifiedLibrary.add(library:)()
{
  return static UnifiedLibrary.add(library:)();
}

uint64_t static IntelligencePlatformComputeSystem.start()()
{
  return static IntelligencePlatformComputeSystem.start()();
}

uint64_t static ViewUpdate.ViewInProcessRunner.sharedInProcessRunner(for:)()
{
  return static ViewUpdate.ViewInProcessRunner.sharedInProcessRunner(for:)();
}

uint64_t type metadata accessor for ViewUpdate.ViewInProcessRunner()
{
  return type metadata accessor for ViewUpdate.ViewInProcessRunner();
}

uint64_t static Configuration.intelligencePlatformComputeService.getter()
{
  return static Configuration.intelligencePlatformComputeService.getter();
}

uint64_t Configuration.isIPCSMemoryTransactionEnabled.getter()
{
  return Configuration.isIPCSMemoryTransactionEnabled.getter();
}

uint64_t Configuration.options.getter()
{
  return Configuration.options.getter();
}

uint64_t type metadata accessor for Configuration()
{
  return type metadata accessor for Configuration();
}

uint64_t static Options.noOperation.getter()
{
  return static Options.noOperation.getter();
}

uint64_t type metadata accessor for Options()
{
  return type metadata accessor for Options();
}

uint64_t type metadata accessor for Library()
{
  return type metadata accessor for Library();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static Task.== infix(_:_:)()
{
  return static Task.== infix(_:_:)();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.checkCancellation()()
{
  return static Task<>.checkCancellation()();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._forceBridgeFromObjectiveC(_:result:)()
{
  return static Set._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.isSuperset(of:)()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _exit(int a1)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void exit(int a1)
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
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
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

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}