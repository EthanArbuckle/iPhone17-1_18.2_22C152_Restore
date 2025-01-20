int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char v21;
  void (*v22)(char *, uint64_t);
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  void (*v26)(char *, void);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char v43[32];

  v3 = type metadata accessor for DispatchQoS.QoSClass();
  v39 = *(void *)(v3 - 8);
  v40 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000056DC(&qword_1000101B8);
  __chkstk_darwin(v6 - 8);
  v41 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL();
  v37 = *(void *)(v8 - 8);
  v38 = v8;
  __chkstk_darwin(v8);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = type metadata accessor for Logger();
  v11 = *(void *)(v42 - 8);
  v12 = __chkstk_darwin(v42);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v37 - v15;
  v17 = type metadata accessor for Defaults();
  v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Defaults.shared.getter();
  v21 = Defaults.supportedPlatform.getter();
  v22 = *(void (**)(char *, uint64_t))(v18 + 8);
  v22(v20, v17);
  if (v21)
  {
    logger.getter();
    v23 = Logger.logObject.getter();
    v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "appplaceholdersyncd launched", v25, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v42);
    static Defaults.shared.getter();
    Defaults.containerURL.getter();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v38);
    v22(v20, v17);
    type metadata accessor for SyncManager();
    static SyncManager.upgrade()();
    type metadata accessor for PublisherStore();
    static PublisherStore.upgrade()();
    static Defaults.shared.getter();
    Defaults.schemaVersion.getter();
    v22(v20, v17);
    v26 = (void (*)(char *, void))static Defaults.shared.modify();
    Defaults.lastSchemaVersion.setter();
    v26(v43, 0);
    v27 = (uint64_t)v41;
    static TaskPriority.high.getter();
    v28 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v27, 0, 1, v28);
    v29 = swift_allocObject();
    *(void *)(v29 + 16) = 0;
    *(void *)(v29 + 24) = 0;
    sub_100005BE0(v27, (uint64_t)&unk_1000101D0, v29);
    swift_release();
    sub_100005FAC(v27);
    dispatch_main();
  }
  logger.getter();
  v30 = Logger.logObject.getter();
  v31 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Unsupported platform.", v32, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v42);
  sub_100005720();
  v34 = v39;
  v33 = v40;
  (*(void (**)(char *, void, uint64_t))(v39 + 104))(v5, enum case for DispatchQoS.QoSClass.background(_:), v40);
  v35 = static OS_dispatch_queue.global(qos:)();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v33);
  type metadata accessor for NotificationHandlerManager();
  *(void *)(swift_allocObject() + 16) = v35;
  sub_10000648C();
  swift_release();
  dispatch_main();
}

uint64_t sub_1000056DC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005720()
{
  unint64_t result = qword_1000101C0;
  if (!qword_1000101C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1000101C0);
  }
  return result;
}

uint64_t sub_100005760()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  v0[9] = v1;
  v0[10] = *(void *)(v1 - 8);
  v0[11] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for DispatchQoS();
  v0[12] = v2;
  v0[13] = *(void *)(v2 - 8);
  v0[14] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for DispatchQoS.QoSClass();
  v0[15] = v3;
  v0[16] = *(void *)(v3 - 8);
  v0[17] = swift_task_alloc();
  return _swift_task_switch(sub_1000058D4, 0, 0);
}

uint64_t sub_1000058D4()
{
  if (qword_1000101B0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[15];
  uint64_t v5 = v0[11];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v6 = v0[9];
  uint64_t v11 = v0[10];
  type metadata accessor for SyncManager();
  static SyncManager.shared.getter();
  dispatch thunk of SyncManager.startRecordReceiver()();
  swift_release();
  sub_100005720();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for DispatchQoS.QoSClass.background(_:), v4);
  v7 = (void *)static OS_dispatch_queue.global(qos:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  v0[6] = sub_100005B38;
  v0[7] = 0;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_100005B9C;
  v0[5] = &unk_10000C5E8;
  v8 = _Block_copy(v0 + 2);
  static DispatchQoS.unspecified.getter();
  v0[8] = &_swiftEmptyArrayStorage;
  sub_100006350();
  sub_1000056DC(&qword_1000101F0);
  sub_1000063A8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v8);

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v3, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100005B38()
{
  type metadata accessor for SyncManager();
  static SyncManager.shared.getter();
  dispatch thunk of SyncManager.syncPublisherWithLaunchServices()();
  swift_release();
  static SyncManager.shared.getter();
  dispatch thunk of SyncManager.syncSubscriberWithReplicator()();

  return swift_release();
}

uint64_t sub_100005B9C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100005BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000056DC(&qword_1000101B8);
  __chkstk_darwin();
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000600C(a1, (uint64_t)v7);
  uint64_t v8 = type metadata accessor for TaskPriority();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_100005FAC((uint64_t)v7);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v12 = v11;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
LABEL_6:
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  if (v12 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v12;
  }
  return swift_task_create();
}

uint64_t sub_100005DC4(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100005DD4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100005E0C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005EB8;
  return sub_100005760();
}

uint64_t sub_100005EB8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005FAC(uint64_t a1)
{
  uint64_t v2 = sub_1000056DC(&qword_1000101B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000600C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000056DC(&qword_1000101B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006074(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100006150;
  return v6(a1);
}

uint64_t sub_100006150()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006248()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006280(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005EB8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000101D8 + dword_1000101D8);
  return v6(a1, v4);
}

uint64_t sub_100006338(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006348()
{
  return swift_release();
}

unint64_t sub_100006350()
{
  unint64_t result = qword_1000101E8;
  if (!qword_1000101E8)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101E8);
  }
  return result;
}

unint64_t sub_1000063A8()
{
  unint64_t result = qword_1000101F8;
  if (!qword_1000101F8)
  {
    sub_100006404(&qword_1000101F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101F8);
  }
  return result;
}

uint64_t sub_100006404(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_10000644C()
{
  qword_100010200 = 0x2D73656369766564;
  *(void *)algn_100010208 = 0xEF6465676E616863;
}

void sub_10000648C()
{
  uint64_t v1 = *(NSObject **)(v0 + 16);
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 1107296256;
  uint64_t v6 = sub_100006814;
  uint64_t v7 = &unk_10000C610;
  uint64_t v2 = _Block_copy(&v4);
  swift_retain();
  swift_release();
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v1, v2);
  _Block_release(v2);
  uint64_t v8 = sub_1000068F0;
  uint64_t v9 = v0;
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 1107296256;
  uint64_t v6 = sub_100006814;
  uint64_t v7 = &unk_10000C638;
  uint64_t v3 = _Block_copy(&v4);
  swift_retain();
  swift_release();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v1, v3);
  _Block_release(v3);
}

uint64_t sub_1000065E4(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  __chkstk_darwin(v2);
  return sub_100008450(a1);
}

uint64_t sub_100006814(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_100006874()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for NotificationHandlerManager()
{
  return self;
}

uint64_t sub_1000068D0(void *a1)
{
  return sub_1000065E4(a1);
}

uint64_t sub_1000068D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000068E8()
{
  return swift_release();
}

void sub_1000068F4()
{
  qword_100010210 = 1701667150;
  *(void *)algn_100010218 = 0xE400000000000000;
}

void sub_100006910()
{
  qword_100010220 = 0x6F666E4972657355;
  *(void *)algn_100010228 = 0xE800000000000000;
}

void sub_100006934()
{
  qword_100010230 = 0x4449656C646E7562;
  *(void *)algn_100010238 = 0xE900000000000073;
}

char *sub_10000695C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000056DC(&qword_100010330);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_1000070C4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100006A6C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006B40(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000099D0((uint64_t)v12, *a3);
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
      sub_1000099D0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009980((uint64_t)v12);
  return v7;
}

uint64_t sub_100006B40(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100006CFC(a5, a6);
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

uint64_t sub_100006CFC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006D94(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006F74(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006F74(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006D94(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006F0C(v2, 0);
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

void *sub_100006F0C(uint64_t a1, uint64_t a2)
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
  sub_1000056DC(&qword_100010318);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006F74(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000056DC(&qword_100010318);
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

uint64_t sub_1000070C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_1000071B8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v91 = type metadata accessor for Logger();
  unint64_t v6 = *(void (***)(char *, uint64_t))(v91 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  int64_t v9 = (char *)v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)v85 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  v15 = (char *)v85 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  v18 = (char *)v85 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  v89 = (void (**)(char *, uint64_t))((char *)v85 - v20);
  __chkstk_darwin(v19);
  v22 = (char *)v85 - v21;
  if (qword_100010198 != -1) {
    swift_once();
  }
  if (!xpc_dictionary_get_string(a1, "Name")) {
    goto LABEL_10;
  }
  if (qword_1000101A0 != -1) {
    swift_once();
  }
  xpc_object_t v90 = xpc_dictionary_get_dictionary(a1, "UserInfo");
  if (!v90)
  {
LABEL_10:
    logger.getter();
    swift_unknownObjectRetain_n();
    v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      v89 = v6;
      uint64_t v93 = v27;
      *(_DWORD *)v26 = 136315138;
      xpc_object_t v90 = v26 + 4;
      id v28 = [a1 description];
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v31 = v30;

      uint64_t v92 = sub_100006A6C(v29, v31, &v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Notification doesn't match expected format. Notification: %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v89[1](v9, v91);
    }
    else
    {

      swift_unknownObjectRelease_n();
      v6[1](v9, v91);
    }
    return (char *)&_swiftEmptyArrayStorage;
  }
  if (String.init(cString:)() == a2 && v23 == a3)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v32 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v32 & 1) == 0)
    {
      v89 = v6;
      logger.getter();
      swift_unknownObjectRetain_n();
      v59 = Logger.logObject.getter();
      os_log_type_t v60 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = swift_slowAlloc();
        *(void *)&long long v88 = swift_slowAlloc();
        uint64_t v93 = v88;
        *(_DWORD *)uint64_t v61 = 136315394;
        uint64_t v62 = qword_100010210;
        unint64_t v63 = *(void *)algn_100010218;
        swift_bridgeObjectRetain();
        uint64_t v92 = sub_100006A6C(v62, v63, &v93);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v61 + 12) = 2080;
        id v64 = [a1 description];
        uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v67 = v66;

        uint64_t v92 = sub_100006A6C(v65, v67, &v93);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v59, v60, "Unexpected value for key '%s' in notification: %s", (uint8_t *)v61, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_unknownObjectRelease_n();
      }
      swift_unknownObjectRelease();
      v89[1](v12, v91);
      return (char *)&_swiftEmptyArrayStorage;
    }
  }
  if (qword_1000101A8 != -1) {
    swift_once();
  }
  xpc_object_t v33 = xpc_dictionary_get_array(v90, "bundleIDs");
  if (!v33)
  {
    v89 = v6;
    logger.getter();
    swift_unknownObjectRetain_n();
    v50 = Logger.logObject.getter();
    os_log_type_t v51 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = swift_slowAlloc();
      *(void *)&long long v88 = swift_slowAlloc();
      uint64_t v93 = v88;
      *(_DWORD *)uint64_t v52 = 136315394;
      uint64_t v53 = qword_100010230;
      unint64_t v54 = *(void *)algn_100010238;
      swift_bridgeObjectRetain();
      uint64_t v92 = sub_100006A6C(v53, v54, &v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v52 + 12) = 2080;
      id v55 = [a1 description];
      uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v58 = v57;

      uint64_t v92 = sub_100006A6C(v56, v58, &v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "Nothing set for '%s' in notification: %s", (uint8_t *)v52, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    swift_unknownObjectRelease();
    v89[1](v15, v91);
    return (char *)&_swiftEmptyArrayStorage;
  }
  v34 = v33;
  int64_t count = xpc_array_get_count(v33);
  if (count < 1)
  {
    v89 = v6;
    logger.getter();
    swift_unknownObjectRetain_n();
    v68 = Logger.logObject.getter();
    os_log_type_t v69 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v68, v69))
    {
      v70 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v88 = swift_slowAlloc();
      uint64_t v93 = v88;
      *(_DWORD *)v70 = 136315138;
      v87 = v70 + 4;
      id v71 = [a1 description];
      uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v74 = v73;

      uint64_t v92 = sub_100006A6C(v72, v74, &v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v68, v69, "No bundleIDs set in notification: %s", v70, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v89[1](v18, v91);
    return (char *)&_swiftEmptyArrayStorage;
  }
  int64_t v37 = count;
  v87 = (uint8_t *)a1;
  size_t v38 = 0;
  v39 = v6 + 1;
  v40 = (char *)&_swiftEmptyArrayStorage;
  *(void *)&long long v36 = 134217984;
  long long v88 = v36;
  do
  {
    if (xpc_array_get_string(v34, v38))
    {
      uint64_t v41 = String.init(cString:)();
      uint64_t v43 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v40 = sub_10000695C(0, *((void *)v40 + 2) + 1, 1, v40);
      }
      unint64_t v45 = *((void *)v40 + 2);
      unint64_t v44 = *((void *)v40 + 3);
      if (v45 >= v44 >> 1) {
        v40 = sub_10000695C((char *)(v44 > 1), v45 + 1, 1, v40);
      }
      *((void *)v40 + 2) = v45 + 1;
      v46 = &v40[16 * v45];
      *((void *)v46 + 4) = v41;
      *((void *)v46 + 5) = v43;
    }
    else
    {
      logger.getter();
      v47 = Logger.logObject.getter();
      os_log_type_t v48 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = swift_slowAlloc();
        *(_DWORD *)uint64_t v49 = v88;
        *(void *)(v49 + 4) = v38;
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "Omitting item %ld. Not a string", (uint8_t *)v49, 0xCu);
        swift_slowDealloc();
      }

      (*v39)(v22, v91);
    }
    ++v38;
  }
  while (v37 != v38);
  if (*((void *)v40 + 2))
  {
    xpc_dictionary_get_BOOL(v90, "isPlaceholder");
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    v75 = v89;
    logger.getter();
    v76 = v87;
    swift_unknownObjectRetain_n();
    v77 = Logger.logObject.getter();
    os_log_type_t v78 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v77, v78))
    {
      v79 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v88 = swift_slowAlloc();
      uint64_t v93 = v88;
      v86 = v79;
      *(_DWORD *)v79 = 136315138;
      v85[1] = v79 + 4;
      id v80 = [(uint8_t *)v76 description];
      uint64_t v81 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v83 = v82;

      uint64_t v92 = sub_100006A6C(v81, v83, &v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v77, v78, "No correctly formed bundleIDs set in notification: %s", v86, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      (*v39)((char *)v89, v91);
    }
    else
    {

      swift_unknownObjectRelease_n();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      (*v39)((char *)v75, v91);
    }
  }
  return v40;
}

uint64_t sub_100007E48(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((void *)sub_1000071B8(a1, 0xD00000000000002ELL, 0x800000010000B590) + 2) && (v6 & 1) == 0)
  {
    logger.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.debug.getter();
    int v10 = v9;
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v11 = swift_slowAlloc();
      int v17 = v10;
      uint64_t v12 = v11;
      uint64_t v16 = swift_slowAlloc();
      uint64_t v19 = v16;
      *(_DWORD *)uint64_t v12 = 136315394;
      uint64_t v18 = sub_100006A6C(0xD00000000000002ELL, 0x800000010000B590, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v12 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v13 = Array.description.getter();
      unint64_t v15 = v14;
      swift_bridgeObjectRelease();
      uint64_t v18 = sub_100006A6C(v13, v15, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, (os_log_type_t)v17, "Handling '%s' notification with bundleIDs=%s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    os_transaction_create();
    type metadata accessor for SyncManager();
    static SyncManager.shared.getter();
    dispatch thunk of SyncManager.add(bundleIdentifiers:)();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    return swift_release();
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000814C(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((void *)sub_1000071B8(a1, 0xD000000000000030, 0x800000010000B650) + 2) && (v6 & 1) == 0)
  {
    logger.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.debug.getter();
    int v10 = v9;
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v11 = swift_slowAlloc();
      int v17 = v10;
      uint64_t v12 = v11;
      uint64_t v16 = swift_slowAlloc();
      uint64_t v19 = v16;
      *(_DWORD *)uint64_t v12 = 136315394;
      uint64_t v18 = sub_100006A6C(0xD000000000000030, 0x800000010000B650, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v12 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v13 = Array.description.getter();
      unint64_t v15 = v14;
      swift_bridgeObjectRelease();
      uint64_t v18 = sub_100006A6C(v13, v15, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, (os_log_type_t)v17, "Handling '%s' notification with bundleIDs=%s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    os_transaction_create();
    type metadata accessor for SyncManager();
    static SyncManager.shared.getter();
    dispatch thunk of SyncManager.delete(bundleIdentifiers:)();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    return swift_release();
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100008450(void *a1)
{
  uint64_t v44 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v44 - 8);
  uint64_t v4 = __chkstk_darwin(v44);
  char v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v39 - v7;
  uint64_t v9 = type metadata accessor for Defaults();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  string = xpc_dictionary_get_string(a1, _xpc_event_key_name);
  unint64_t v14 = string;
  if (!string)
  {
    uint64_t v45 = 0;
    unint64_t v46 = 0xE000000000000000;
    _StringGuts.grow(_:)(42);
    swift_bridgeObjectRelease();
    uint64_t v45 = 0xD000000000000028;
    unint64_t v46 = 0x800000010000B4D0;
    id v23 = [a1 description];
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v26 = v25;

    v27._countAndFlagsBits = v24;
    v27._object = v26;
    String.append(_:)(v27);
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  uint64_t v43 = string;
  static Defaults.shared.getter();
  char v15 = Defaults.supportedPlatform.getter();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (v15)
  {
    uint64_t v16 = String.init(cString:)();
    uint64_t v18 = v17;
    logger.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v42 = v1;
      uint64_t v22 = v21;
      uint64_t v40 = swift_slowAlloc();
      uint64_t v45 = v40;
      *(_DWORD *)uint64_t v22 = 136315394;
      uint64_t v47 = sub_100006A6C(0xD00000000000001CLL, 0x800000010000B1C0, &v45);
      uint64_t v41 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v22 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_100006A6C(v16, (unint64_t)v18, &v45);
      a1 = v41;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Processing '%s' notification with event key name: '%s'", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v44);
    unint64_t v14 = v43;
    if (v16 == 0xD000000000000015 && v18 == (void *)0x800000010000B500
      || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return sub_100007E48(a1);
    }
    if (v16 == 0xD000000000000017 && v18 == (void *)0x800000010000B520
      || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return sub_10000814C(a1);
    }
    uint64_t v45 = 0;
    unint64_t v46 = 0xE000000000000000;
    _StringGuts.grow(_:)(50);
    swift_bridgeObjectRelease();
    uint64_t v45 = 0xD000000000000049;
    unint64_t v46 = 0x800000010000B540;
    v37._countAndFlagsBits = v16;
    v37._object = v18;
    String.append(_:)(v37);
    swift_bridgeObjectRelease();
    v38._countAndFlagsBits = 39;
    v38._object = (void *)0xE100000000000000;
    String.append(_:)(v38);
LABEL_6:
    uint64_t v29 = v45;
    unint64_t v28 = v46;
    sub_100009A30();
    swift_allocError();
    *(void *)uint64_t v30 = v29;
    *(void *)(v30 + 8) = v28;
    *(unsigned char *)(v30 + 16) = v14 != 0;
    return swift_willThrow();
  }
  logger.getter();
  char v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    *(_DWORD *)v34 = 136315138;
    uint64_t v35 = String.init(cString:)();
    uint64_t v42 = v1;
    uint64_t v47 = sub_100006A6C(v35, v36, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "ignored notification: %s", v34, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v44);
}

uint64_t sub_100008AA8(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v74 = *(void *)(v2 - 8);
  uint64_t v75 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v70 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  id v71 = (char *)&v70 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v72 = (char *)&v70 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v73 = (char *)&v70 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  int v17 = (char *)&v70 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  os_log_type_t v20 = (char *)&v70 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v70 - v21;
  uint64_t v23 = type metadata accessor for Defaults();
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  v26 = (char *)&v70 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (xpc_dictionary_get_string(a1, _xpc_event_key_name))
  {
    static Defaults.shared.getter();
    char v27 = Defaults.supportedPlatform.getter();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
    if (v27)
    {
      uint64_t v28 = String.init(cString:)();
      unint64_t v30 = v29;
      logger.getter();
      swift_bridgeObjectRetain_n();
      unint64_t v31 = Logger.logObject.getter();
      os_log_type_t v32 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        uint64_t v70 = v28;
        uint64_t v77 = v34;
        *(_DWORD *)uint64_t v33 = 136315394;
        uint64_t v76 = sub_100006A6C(0xD00000000000001ALL, 0x800000010000B1E0, &v77);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v33 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v76 = sub_100006A6C(v70, v30, &v77);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Processing %s notification with name: %s", (uint8_t *)v33, 0x16u);
        swift_arrayDestroy();
        uint64_t v28 = v70;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v44 = *(void (**)(char *, uint64_t))(v74 + 8);
      v44(v22, v75);
      if (v28 == 0xD000000000000010 && v30 == 0x800000010000B200
        || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        logger.getter();
        uint64_t v45 = Logger.logObject.getter();
        os_log_type_t v46 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v45, v46))
        {
          uint64_t v47 = v44;
          uint64_t v48 = swift_slowAlloc();
          uint64_t v77 = swift_slowAlloc();
          *(_DWORD *)uint64_t v48 = 136315394;
          uint64_t v76 = sub_100006A6C(0xD000000000000021, 0x800000010000B260, &v77);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v48 + 12) = 2080;
          uint64_t v76 = sub_100006A6C(0xD000000000000010, 0x800000010000B200, &v77);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v45, v46, "%s: handle %s", (uint8_t *)v48, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v47(v20, v75);
        }
        else
        {

          v44(v20, v75);
        }
        type metadata accessor for SyncManager();
        static SyncManager.shared.getter();
        dispatch thunk of SyncManager.startRecordReceiver()();
        return swift_release();
      }
      if (v28 == 0xD000000000000011 && v30 == 0x800000010000B220
        || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        logger.getter();
        uint64_t v49 = Logger.logObject.getter();
        os_log_type_t v50 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v49, v50))
        {
          os_log_type_t v51 = (uint64_t (*)(char *, uint64_t))v44;
          uint64_t v52 = (uint8_t *)swift_slowAlloc();
          uint64_t v77 = swift_slowAlloc();
          *(_DWORD *)uint64_t v52 = 136315138;
          uint64_t v76 = sub_100006A6C(0xD000000000000021, 0x800000010000B260, &v77);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v49, v50, "%s: Not yet implemented!", v52, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          return v51(v17, v75);
        }

        uint64_t v53 = v17;
        return ((uint64_t (*)(char *, uint64_t))v44)(v53, v75);
      }
      if (qword_100010190 != -1) {
        swift_once();
      }
      if (qword_100010200 == v28 && *(void *)algn_100010208 == v30
        || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        unint64_t v54 = v73;
        logger.getter();
        id v55 = Logger.logObject.getter();
        os_log_type_t v56 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v55, v56))
        {
          unint64_t v57 = (uint64_t (*)(char *, uint64_t))v44;
          unint64_t v58 = (uint8_t *)swift_slowAlloc();
          uint64_t v77 = swift_slowAlloc();
          *(_DWORD *)unint64_t v58 = 136315138;
          uint64_t v76 = sub_100006A6C(0xD000000000000021, 0x800000010000B260, &v77);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v55, v56, "%s: Devices changed, do we care?", v58, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v59 = v54;
          return v57(v59, v75);
        }

        uint64_t v53 = v54;
      }
      else
      {
        if (v28 == 0xD000000000000013 && v30 == 0x800000010000B240
          || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          os_log_type_t v60 = v72;
          logger.getter();
          uint64_t v61 = Logger.logObject.getter();
          os_log_type_t v62 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v61, v62))
          {
            unint64_t v63 = v44;
            uint64_t v64 = swift_slowAlloc();
            uint64_t v77 = swift_slowAlloc();
            *(_DWORD *)uint64_t v64 = 136315394;
            uint64_t v76 = sub_100006A6C(0xD000000000000021, 0x800000010000B260, &v77);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *(_WORD *)(v64 + 12) = 2080;
            uint64_t v76 = sub_100006A6C(0xD000000000000013, 0x800000010000B240, &v77);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            _os_log_impl((void *)&_mh_execute_header, v61, v62, "%s: handle %s", (uint8_t *)v64, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            v63(v60, v75);
          }
          else
          {

            v44(v60, v75);
          }
          type metadata accessor for SyncManager();
          static SyncManager.shared.getter();
          dispatch thunk of SyncManager.syncPublisherWithAppProtection()();
          return swift_release();
        }
        uint64_t v65 = v71;
        logger.getter();
        swift_bridgeObjectRetain();
        unint64_t v66 = Logger.logObject.getter();
        unint64_t v67 = v30;
        os_log_type_t v68 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v66, v68))
        {
          unint64_t v57 = (uint64_t (*)(char *, uint64_t))v44;
          uint64_t v69 = swift_slowAlloc();
          uint64_t v77 = swift_slowAlloc();
          *(_DWORD *)uint64_t v69 = 136315394;
          uint64_t v76 = sub_100006A6C(0xD00000000000001ALL, 0x800000010000B1E0, &v77);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v69 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v76 = sub_100006A6C(v28, v67, &v77);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v66, v68, "Unknown %s notification: %s", (uint8_t *)v69, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v59 = v65;
          return v57(v59, v75);
        }

        swift_bridgeObjectRelease_n();
        uint64_t v53 = v65;
      }
      return ((uint64_t (*)(char *, uint64_t))v44)(v53, v75);
    }
    logger.getter();
    uint64_t v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v77 = swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 136315138;
      uint64_t v42 = String.init(cString:)();
      uint64_t v76 = sub_100006A6C(v42, v43, &v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "ignored notification: %s", v41, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v8, v75);
  }
  else
  {
    logger.getter();
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      Swift::String v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v77 = swift_slowAlloc();
      *(_DWORD *)Swift::String v37 = 136315138;
      uint64_t v76 = sub_100006A6C(0xD00000000000001ALL, 0x800000010000B1E0, &v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Unable to get xpc event name for type %s", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v5, v75);
  }
}

uint64_t sub_100009980(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000099D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100009A30()
{
  unint64_t result = qword_100010328;
  if (!qword_100010328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010328);
  }
  return result;
}

uint64_t sub_100009A88()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for NotificationHandlerManager.NotificationError()
{
  return sub_100009AA0();
}

uint64_t sub_100009AA0()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s19appplaceholdersyncd26NotificationHandlerManagerC17NotificationErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_100009A88();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for NotificationHandlerManager.NotificationError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_100009A88();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_100009AA0();
  return a1;
}

__n128 initializeWithTake for NotificationHandlerManager.NotificationError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for NotificationHandlerManager.NotificationError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_100009AA0();
  return a1;
}

uint64_t getEnumTagSinglePayload for NotificationHandlerManager.NotificationError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NotificationHandlerManager.NotificationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100009C34(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_100009C40(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NotificationHandlerManager.NotificationError()
{
  return &type metadata for NotificationHandlerManager.NotificationError;
}

uint64_t sub_100009C64()
{
  type metadata accessor for Daemon();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_100009CA0();
  qword_100010480 = v0;
  return result;
}

uint64_t sub_100009CA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v6);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v7 - 8);
  sub_100005720();
  static DispatchQoS.background.getter();
  v11[1] = &_swiftEmptyArrayStorage;
  sub_100009F14();
  sub_1000056DC(&qword_1000103E8);
  sub_100009F6C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  uint64_t v8 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)(v1 + 16) = v8;
  sub_100009FC8();
  type metadata accessor for NotificationHandlerManager();
  *(void *)(swift_allocObject() + 16) = v8;
  id v9 = v8;
  sub_10000648C();
  swift_release();
  type metadata accessor for SyncManager();
  static SyncManager.shared.getter();
  swift_release();
  return v1;
}

uint64_t type metadata accessor for Daemon()
{
  return self;
}

unint64_t sub_100009F14()
{
  unint64_t result = qword_1000103E0;
  if (!qword_1000103E0)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103E0);
  }
  return result;
}

unint64_t sub_100009F6C()
{
  unint64_t result = qword_1000103F0;
  if (!qword_1000103F0)
  {
    sub_100006404(&qword_1000103E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103F0);
  }
  return result;
}

uint64_t sub_100009FC8()
{
  uint64_t v0 = sub_1000056DC(&qword_1000103F8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for Defaults();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v39 - 8);
  uint64_t v8 = __chkstk_darwin(v39);
  Swift::String v37 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v33 - v10;
  static Defaults.shared.getter();
  Defaults.tmpURL.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v36 = self;
  id v12 = [v36 defaultManager];
  Swift::String v38 = v11;
  URL.path.getter();
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v40 = 0;
  id v14 = [v12 contentsOfDirectoryAtPath:v13 error:&v40];

  id v15 = v40;
  if (v14)
  {
    uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v17 = v15;

    uint64_t v18 = *(void *)(v16 + 16);
    if (v18)
    {
      uint64_t v34 = v7;
      uint64_t v35 = (void (**)(char *, char *, uint64_t))(v7 + 16);
      uint64_t v19 = (void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
      os_log_type_t v20 = (void (**)(char *, uint64_t))(v7 + 8);
      uint64_t v33 = v16;
      uint64_t v21 = v16 + 40;
      uint64_t v22 = v39;
      do
      {
        swift_bridgeObjectRetain();
        id v23 = objc_msgSend(v36, "defaultManager", v33);
        (*v35)(v2, v38, v22);
        (*v19)(v2, 0, 1, v22);
        uint64_t v24 = v37;
        URL.init(fileURLWithPath:isDirectory:relativeTo:)();
        swift_bridgeObjectRelease();
        sub_10000A3F0((uint64_t)v2);
        URL._bridgeToObjectiveC()(v25);
        char v27 = v26;
        (*v20)(v24, v22);
        id v40 = 0;
        unsigned int v28 = [v23 removeItemAtURL:v27 error:&v40];

        id v29 = v40;
        if (!v28)
        {
          unint64_t v30 = v29;
          _convertNSErrorToError(_:)();

          swift_willThrow();
          swift_errorRelease();
        }
        v21 += 16;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease();
      uint64_t v7 = v34;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    id v31 = v40;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v38, v39);
}

uint64_t sub_10000A3F0(uint64_t a1)
{
  uint64_t v2 = sub_1000056DC(&qword_1000103F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.init(fileURLWithPath:isDirectory:relativeTo:)()
{
  return URL.init(fileURLWithPath:isDirectory:relativeTo:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t dispatch thunk of SyncManager.syncPublisherWithAppProtection()()
{
  return dispatch thunk of SyncManager.syncPublisherWithAppProtection()();
}

uint64_t dispatch thunk of SyncManager.startRecordReceiver()()
{
  return dispatch thunk of SyncManager.startRecordReceiver()();
}

uint64_t dispatch thunk of SyncManager.syncSubscriberWithReplicator()()
{
  return dispatch thunk of SyncManager.syncSubscriberWithReplicator()();
}

uint64_t dispatch thunk of SyncManager.syncPublisherWithLaunchServices()()
{
  return dispatch thunk of SyncManager.syncPublisherWithLaunchServices()();
}

uint64_t dispatch thunk of SyncManager.add(bundleIdentifiers:)()
{
  return dispatch thunk of SyncManager.add(bundleIdentifiers:)();
}

uint64_t dispatch thunk of SyncManager.delete(bundleIdentifiers:)()
{
  return dispatch thunk of SyncManager.delete(bundleIdentifiers:)();
}

uint64_t static SyncManager.shared.getter()
{
  return static SyncManager.shared.getter();
}

uint64_t static SyncManager.upgrade()()
{
  return static SyncManager.upgrade()();
}

uint64_t type metadata accessor for SyncManager()
{
  return type metadata accessor for SyncManager();
}

uint64_t static PublisherStore.upgrade()()
{
  return static PublisherStore.upgrade()();
}

uint64_t type metadata accessor for PublisherStore()
{
  return type metadata accessor for PublisherStore();
}

uint64_t logger.getter()
{
  return logger.getter();
}

uint64_t Defaults.containerURL.getter()
{
  return Defaults.containerURL.getter();
}

uint64_t Defaults.schemaVersion.getter()
{
  return Defaults.schemaVersion.getter();
}

uint64_t Defaults.lastSchemaVersion.setter()
{
  return Defaults.lastSchemaVersion.setter();
}

uint64_t Defaults.supportedPlatform.getter()
{
  return Defaults.supportedPlatform.getter();
}

uint64_t static Defaults.shared.modify()
{
  return static Defaults.shared.modify();
}

uint64_t static Defaults.shared.getter()
{
  return static Defaults.shared.getter();
}

uint64_t Defaults.tmpURL.getter()
{
  return Defaults.tmpURL.getter();
}

uint64_t type metadata accessor for Defaults()
{
  return type metadata accessor for Defaults();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.background.getter()
{
  return static DispatchQoS.background.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static TaskPriority.high.getter()
{
  return static TaskPriority.high.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
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

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void dispatch_main(void)
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}