uint64_t sub_100002DF4()
{
  uint64_t result;

  type metadata accessor for PrintMonitor();
  swift_allocObject();
  result = sub_100002EA8();
  qword_100021140 = result;
  return result;
}

uint64_t sub_100002E34()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100002EA8()
{
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v17 = *(void *)(v1 - 8);
  uint64_t v18 = v1;
  __chkstk_darwin(v1);
  v16 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v3);
  v15[1] = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100004A14(&qword_100020C38);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v0 + OBJC_IVAR____TtC12Print_Center12PrintMonitor__completedJobs;
  v19 = &_swiftEmptyArrayStorage;
  sub_100004A14((uint64_t *)&unk_100020B08);
  Published.init(initialValue:)();
  v11 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v11(v10, v9, v6);
  uint64_t v12 = v0 + OBJC_IVAR____TtC12Print_Center12PrintMonitor__pendingJobs;
  v19 = &_swiftEmptyArrayStorage;
  Published.init(initialValue:)();
  v11(v12, v9, v6);
  uint64_t v13 = OBJC_IVAR____TtC12Print_Center12PrintMonitor_workQueue;
  sub_100006848(0, &qword_100020C40);
  static DispatchQoS.unspecified.getter();
  v19 = &_swiftEmptyArrayStorage;
  sub_10000690C(&qword_100020C48, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100004A14(&qword_100020C50);
  sub_100007560(&qword_100020C58, &qword_100020C50);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v16, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v18);
  *(void *)(v0 + v13) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  sub_10000395C();
  return v0;
}

uint64_t sub_100003234()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.setter();
  uint64_t v2 = v0 + OBJC_IVAR____TtC12Print_Center12PrintMonitor__completedJobs;
  uint64_t v3 = sub_100004A14(&qword_100020C38);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
  v4(v0 + OBJC_IVAR____TtC12Print_Center12PrintMonitor__pendingJobs, v3);

  return v0;
}

uint64_t sub_100003364()
{
  sub_100003234();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000033BC()
{
  return type metadata accessor for PrintMonitor();
}

uint64_t type metadata accessor for PrintMonitor()
{
  uint64_t result = qword_100020AF0;
  if (!qword_100020AF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100003410()
{
  sub_100004744();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_1000034B0(void **a1, id *a2)
{
  uint64_t v5 = sub_100004A14(&qword_100020CA0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v35 - v9;
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  v41 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v35 - v16;
  __chkstk_darwin(v15);
  v43 = (char *)&v35 - v18;
  v19 = *a1;
  id v20 = *a2;
  v21 = &PCPrintJob__metaData;
  if (([v19 state] == (id)5 || objc_msgSend(v19, "state") == (id)10)
    && ([v20 state] == (id)5 || objc_msgSend(v20, "state") == (id)10))
  {
    uint64_t v42 = v12;
    id v22 = [v19 timeAtProcessing];
    if (v22)
    {
      v23 = v22;
      v37 = v8;
      uint64_t v39 = v2;
      id v40 = v20;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v24 = v42;
      v38 = *(void (**)(char *, char *, uint64_t))(v42 + 32);
      v38(v10, v17, v11);
      v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
      v25(v10, 0, 1, v11);
      v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
      if (v26(v10, 1, v11) == 1)
      {
        id v20 = v40;
        v21 = &PCPrintJob__metaData;
      }
      else
      {
        v35 = v26;
        v36 = v25;
        v38(v43, v10, v11);
        id v27 = [v40 timeAtProcessing];
        if (v27)
        {
          v28 = v27;
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v10 = v37;
          v38(v37, v17, v11);
          v36(v10, 0, 1, v11);
          v21 = &PCPrintJob__metaData;
          if (v35(v10, 1, v11) != 1)
          {
            v29 = v41;
            v38(v41, v10, v11);
            v30 = v43;
            char v31 = static Date.< infix(_:_:)();
            v32 = *(void (**)(char *, uint64_t))(v42 + 8);
            v32(v29, v11);
            v32(v30, v11);
            return v31 & 1;
          }
        }
        else
        {
          uint64_t v10 = v37;
          v36(v37, 1, 1, v11);
          v21 = &PCPrintJob__metaData;
        }
        (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v11);
        id v20 = v40;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56))(v10, 1, 1, v11);
    }
    sub_1000075A4((uint64_t)v10);
  }
  if (objc_msgSend(v19, *(SEL *)&v21[29].ivar_base_size) == (id)5
    || objc_msgSend(v19, *(SEL *)&v21[29].ivar_base_size) == (id)10)
  {
    char v31 = 1;
  }
  else if (objc_msgSend(v20, *(SEL *)&v21[29].ivar_base_size) == (id)5 {
         || objc_msgSend(v20, *(SEL *)&v21[29].ivar_base_size) == (id)10)
  }
  {
    char v31 = 0;
  }
  else
  {
    id v34 = [v19 localJobID];
    char v31 = (uint64_t)v34 < (uint64_t)[v20 localJobID];
  }
  return v31 & 1;
}

void sub_10000395C()
{
  sub_100003CA4();
  uint64_t v1 = self;
  id v2 = [v1 defaultCenter];
  uint64_t v3 = self;
  id v4 = [v3 mainQueue];
  uint64_t v15 = sub_100007554;
  uint64_t v16 = v0;
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 1107296256;
  uint64_t v13 = sub_100003BB0;
  uint64_t v14 = &unk_10001D320;
  uint64_t v5 = _Block_copy(&v11);
  swift_retain();
  swift_release();
  id v6 = [v2 addObserverForName:@"PKJobListNotification" object:0 queue:v4 usingBlock:v5];
  _Block_release(v5);
  swift_unknownObjectRelease();

  id v7 = [v1 defaultCenter];
  id v8 = [v3 mainQueue];
  uint64_t v15 = sub_100007558;
  uint64_t v16 = v0;
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 1107296256;
  uint64_t v13 = sub_100003BB0;
  uint64_t v14 = &unk_10001D348;
  uint64_t v9 = _Block_copy(&v11);
  swift_retain();
  swift_release();
  id v10 = [v7 addObserverForName:@"PKJobProgressNotification" object:0 queue:v8 usingBlock:v9];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

uint64_t sub_100003BB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(void (**)(char *))(a1 + 32);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100003CA4()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = *(void *)(v0 + OBJC_IVAR____TtC12Print_Center12PrintMonitor_workQueue);
  aBlock[4] = sub_1000068EC;
  uint64_t v13 = v0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004584;
  aBlock[3] = &unk_10001D280;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v11[1] = &_swiftEmptyArrayStorage;
  sub_10000690C(&qword_100020C70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004A14(&qword_100020C78);
  sub_100007560(&qword_100020C80, &qword_100020C78);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

uint64_t sub_100003F50(uint64_t a1)
{
  uint64_t v25 = a1;
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  v28 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for DispatchQoS();
  uint64_t v27 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  v26 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = swift_allocObject();
  id v6 = [self jobs];
  sub_100006848(0, (unint64_t *)&qword_100020C60);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)(v5 + 16) = v7;
  uint64_t v8 = (void *)(v5 + 16);
  aBlock[0] = &_swiftEmptyArrayStorage;
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v9 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t v14 = &_swiftEmptyArrayStorage;
    goto LABEL_18;
  }
  uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v9) {
    goto LABEL_17;
  }
LABEL_3:
  if (v9 < 1) {
    goto LABEL_23;
  }
  uint64_t v23 = v2;
  uint64_t v24 = v1;
  for (uint64_t i = 0; i != v9; ++i)
  {
    if ((v7 & 0xC000000000000001) != 0) {
      id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v12 = *(id *)(v7 + 8 * i + 32);
    }
    uint64_t v13 = v12;
    if (objc_msgSend(v12, "state", v23, v24) == (id)7
      || [v13 state] == (id)9
      || [v13 state] == (id)10
      || [v13 state] == (id)8)
    {
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)aBlock[0];
  uint64_t v2 = v23;
  uint64_t v1 = v24;
LABEL_18:
  swift_retain();
  uint64_t v15 = sub_100006D74((unint64_t *)(v5 + 16), (unint64_t)v14);
  uint64_t result = swift_release();
  if (*v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (v16 >= v15) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v16 = *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v16 >= v15)
    {
LABEL_20:
      sub_100007244(v15, v16);
      swift_release();
      sub_100006848(0, &qword_100020C40);
      uint64_t v17 = (void *)static OS_dispatch_queue.main.getter();
      uint64_t v18 = swift_allocObject();
      uint64_t v19 = v25;
      *(void *)(v18 + 16) = v5;
      *(void *)(v18 + 24) = v19;
      aBlock[4] = sub_10000754C;
      void aBlock[5] = v18;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100004584;
      aBlock[3] = &unk_10001D2F8;
      id v20 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      v21 = v26;
      static DispatchQoS.unspecified.getter();
      aBlock[0] = &_swiftEmptyArrayStorage;
      sub_10000690C(&qword_100020C70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100004A14(&qword_100020C78);
      sub_100007560(&qword_100020C80, &qword_100020C78);
      id v22 = v28;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v20);

      (*(void (**)(char *, uint64_t))(v2 + 8))(v22, v1);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v21, v29);
      return swift_release();
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_100004494()
{
  return swift_release();
}

uint64_t sub_100004588(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000045CC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (!(v5 >> 62))
  {
    uint64_t v0 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v0) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v0 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_3:
  if (v0 >= 1)
  {
    uint64_t v2 = 0;
    do
    {
      if ((v5 & 0xC000000000000001) != 0) {
        id v3 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v3 = *(id *)(v5 + 8 * v2 + 32);
      }
      uint64_t v4 = v3;
      ++v2;
      [v3 update];
      sub_100006848(0, (unint64_t *)&qword_100020C60);
      sub_100006884();
      ObservableObject<>.objectWillChange.getter();
      ObservableObjectPublisher.send()();

      swift_release();
    }
    while (v0 != v2);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

void sub_100004744()
{
  if (!qword_100020B00)
  {
    sub_1000047A0((uint64_t *)&unk_100020B08);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100020B00);
    }
  }
}

uint64_t sub_1000047A0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void type metadata accessor for DisplayCategory(uint64_t a1)
{
}

void type metadata accessor for DeviceCategory(uint64_t a1)
{
}

void sub_100004810(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100004858@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PrintMonitor();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100004898@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PrintMonitor();
  uint64_t result = Identifiable<>.id.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000048DC()
{
  return 1;
}

uint64_t sub_1000048E4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100004964()
{
  return static Published.subscript.setter();
}

void sub_1000049E0(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_1000049EC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void *sub_1000049FC()
{
  return &protocol witness table for ObjectIdentifier;
}

void *sub_100004A08()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100004A14(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

BOOL sub_100004A58(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100004A6C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_100013290(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_100004BE0(v6);
  return specialized ContiguousArray._endMutation()();
}

void *sub_100004AE8(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_100004A14(&qword_100020C90);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_100006540((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void sub_100004BE0(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100004A14(&qword_100020CA0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  v173 = (char *)&v159 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  v183 = (char *)&v159 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  v164 = (char *)&v159 - v10;
  __chkstk_darwin(v9);
  v167 = (char *)&v159 - v11;
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  v169 = (char *)&v159 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  v177 = (char *)&v159 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  v162 = (char *)&v159 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  v179 = (char *)&v159 - v21;
  __chkstk_darwin(v20);
  v165 = (char *)&v159 - v22;
  Swift::Int v23 = a1[1];
  Swift::Int v24 = _minimumMergeRunLength(_:)(v23);
  if (v24 >= v23)
  {
    if (v23 < 0) {
      goto LABEL_186;
    }
    if (v23) {
      sub_100005C28(0, v23, 1, a1);
    }
    return;
  }
  if (v23 >= 0) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = v23 + 1;
  }
  if (v23 < -1) {
    goto LABEL_185;
  }
  Swift::Int v161 = v24;
  uint64_t v185 = v12;
  v159 = a1;
  if (v23 <= 1)
  {
    v28 = (char *)_swiftEmptyArrayStorage;
    uint64_t v188 = (uint64_t)_swiftEmptyArrayStorage;
    v172 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v23 != 1)
    {
      unint64_t v99 = _swiftEmptyArrayStorage[2];
      if (v99 < 2)
      {
LABEL_160:
        swift_bridgeObjectRelease();
LABEL_161:
        *(void *)((v188 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
        specialized Array._endMutation()();
        swift_bridgeObjectRelease();
        return;
      }
LABEL_147:
      uint64_t v152 = *v159;
      while (1)
      {
        unint64_t v153 = v99 - 2;
        if (v99 < 2) {
          goto LABEL_179;
        }
        if (!v152) {
          goto LABEL_193;
        }
        v154 = v28;
        uint64_t v155 = *(void *)&v28[16 * v153 + 32];
        uint64_t v156 = *(void *)&v28[16 * v99 + 24];
        sub_1000061A4((id *)(v152 + 8 * v155), (void **)(v152 + 8 * *(void *)&v28[16 * v99 + 16]), v152 + 8 * v156, v172);
        if (v2) {
          goto LABEL_160;
        }
        if (v156 < v155) {
          goto LABEL_181;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v154 = sub_100012F18((uint64_t)v154);
        }
        if (v153 >= *((void *)v154 + 2)) {
          goto LABEL_182;
        }
        v157 = &v154[16 * v153 + 32];
        *(void *)v157 = v155;
        *((void *)v157 + 1) = v156;
        unint64_t v158 = *((void *)v154 + 2);
        if (v99 > v158) {
          goto LABEL_183;
        }
        memmove(&v154[16 * v99 + 16], &v154[16 * v99 + 32], 16 * (v158 - v99));
        v28 = v154;
        *((void *)v154 + 2) = v158 - 1;
        unint64_t v99 = v158 - 1;
        if (v158 <= 2) {
          goto LABEL_160;
        }
      }
    }
  }
  else
  {
    uint64_t v26 = v25 >> 1;
    sub_100006848(0, (unint64_t *)&qword_100020C60);
    uint64_t v27 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) = v26;
    v172 = (void **)((v27 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v188 = v27;
  }
  Swift::Int v29 = 0;
  uint64_t v30 = *a1;
  v182 = (void (**)(char *, char *, uint64_t))(v13 + 32);
  v184 = (id *)(v13 + 56);
  v178 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  v174 = (void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v175 = v1;
  uint64_t v160 = v30 - 8;
  v28 = (char *)_swiftEmptyArrayStorage;
  char v31 = &PCPrintJob__metaData;
  Swift::Int v166 = v23;
  uint64_t v176 = v30;
  while (1)
  {
    Swift::Int v32 = v29++;
    Swift::Int v170 = v32;
    if (v29 >= v23) {
      goto LABEL_55;
    }
    v163 = v28;
    v33 = *(void **)(v30 + 8 * v29);
    id v186 = *(id *)(v30 + 8 * v32);
    id v34 = v186;
    v187 = v33;
    id v35 = v33;
    id v36 = v34;
    uint64_t v37 = v175;
    LODWORD(v181) = sub_1000034B0(&v187, &v186);
    if (v37)
    {
      swift_bridgeObjectRelease();

      goto LABEL_161;
    }
    uint64_t v175 = 0;

    Swift::Int v38 = v32 + 2;
    if (v32 + 2 < v23)
    {
      while (1)
      {
        while (1)
        {
          v47 = *(void **)(v30 + 8 * v29);
          id v48 = *(id *)(v30 + 8 * v38);
          id v49 = v47;
          if ((objc_msgSend(v48, *(SEL *)&v31[29].ivar_base_size) == (id)5
             || objc_msgSend(v48, *(SEL *)&v31[29].ivar_base_size) == (id)10)
            && (objc_msgSend(v49, *(SEL *)&v31[29].ivar_base_size, v159) == (id)5
             || objc_msgSend(v49, *(SEL *)&v31[29].ivar_base_size) == (id)10))
          {
            id v50 = [v48 timeAtProcessing];
            if (v50)
            {
              v51 = v50;
              v52 = v179;
              static Date._unconditionallyBridgeFromObjectiveC(_:)();

              v53 = *v182;
              uint64_t v54 = (uint64_t)v167;
              uint64_t v55 = v185;
              (*v182)(v167, v52, v185);
              v180 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))*v184;
              v180(v54, 0, 1, v55);
              v56 = *v178;
              if ((*v178)(v54, 1, v55) != 1)
              {
                uint64_t v57 = v185;
                v53(v165, v167, v185);
                id v58 = [v49 timeAtProcessing];
                if (v58)
                {
                  v59 = v58;
                  v60 = v179;
                  static Date._unconditionallyBridgeFromObjectiveC(_:)();

                  uint64_t v54 = (uint64_t)v164;
                  v53(v164, v60, v57);
                  v180(v54, 0, 1, v57);
                  if (v56(v54, 1, v57) != 1)
                  {
                    v61 = v162;
                    v53(v162, (char *)v54, v57);
                    v62 = v165;
                    int v63 = static Date.< infix(_:_:)();
                    v64 = *v174;
                    (*v174)(v61, v57);
                    v64(v62, v57);

                    char v39 = (char)v181;
                    Swift::Int v23 = v166;
                    uint64_t v30 = v176;
                    char v31 = &PCPrintJob__metaData;
                    Swift::Int v32 = v170;
                    if ((v181 ^ v63)) {
                      goto LABEL_16;
                    }
                    goto LABEL_27;
                  }
                }
                else
                {
                  uint64_t v54 = (uint64_t)v164;
                  v180((uint64_t)v164, 1, 1, v57);
                }
                (*v174)(v165, v57);
                uint64_t v30 = v176;
              }
            }
            else
            {
              uint64_t v54 = (uint64_t)v167;
              ((void (*)(char *, uint64_t, uint64_t, uint64_t))*v184)(v167, 1, 1, v185);
            }
            sub_1000075A4(v54);
            Swift::Int v23 = v166;
            char v31 = &PCPrintJob__metaData;
            Swift::Int v32 = v170;
          }
          if (objc_msgSend(v48, *(SEL *)&v31[29].ivar_base_size, v159) != (id)5
            && objc_msgSend(v48, *(SEL *)&v31[29].ivar_base_size) != (id)10)
          {
            break;
          }

          if ((v181 & 1) == 0)
          {
            Swift::Int v29 = v38;
LABEL_54:
            v28 = v163;
            goto LABEL_55;
          }
          char v39 = 1;
LABEL_27:
          Swift::Int v40 = v38 + 1;
          Swift::Int v29 = v38;
          Swift::Int v38 = v40;
          if (v40 >= v23) {
            goto LABEL_17;
          }
        }
        if (objc_msgSend(v49, *(SEL *)&v31[29].ivar_base_size) == (id)5)
        {

          if (v181) {
            goto LABEL_143;
          }
          char v39 = 0;
          goto LABEL_27;
        }
        if (objc_msgSend(v49, *(SEL *)&v31[29].ivar_base_size) != (id)10)
        {
          v180 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))[v48 localJobID];
          v46 = (void (*)(uint64_t, void, uint64_t, uint64_t))[v49 localJobID];

          char v39 = (char)v181;
          if ((v181 & 1) == (uint64_t)v180 >= (uint64_t)v46) {
            break;
          }
          goto LABEL_27;
        }

        if (v181)
        {
LABEL_143:
          Swift::Int v29 = v38;
          goto LABEL_18;
        }
        Swift::Int v65 = v38 + 1;
        Swift::Int v29 = v38;
        Swift::Int v38 = v65;
        if (v65 >= v23)
        {
          v28 = v163;
          Swift::Int v29 = v65;
          goto LABEL_55;
        }
      }
    }
LABEL_16:
    char v39 = (char)v181;
    Swift::Int v40 = v38;
LABEL_17:
    Swift::Int v29 = v40;
    if ((v39 & 1) == 0) {
      goto LABEL_54;
    }
LABEL_18:
    v28 = v163;
    if (v29 < v32) {
      goto LABEL_189;
    }
    if (v32 < v29)
    {
      v41 = (uint64_t *)(v160 + 8 * v29);
      Swift::Int v42 = v29;
      Swift::Int v43 = v32;
      v44 = (uint64_t *)(v30 + 8 * v32);
      do
      {
        if (v43 != --v42)
        {
          if (!v30) {
            goto LABEL_192;
          }
          uint64_t v45 = *v44;
          uint64_t *v44 = *v41;
          uint64_t *v41 = v45;
        }
        ++v43;
        --v41;
        ++v44;
      }
      while (v43 < v42);
    }
LABEL_55:
    if (v29 >= v23) {
      goto LABEL_92;
    }
    if (__OFSUB__(v29, v32)) {
      goto LABEL_184;
    }
    if (v29 - v32 >= v161) {
      goto LABEL_92;
    }
    if (__OFADD__(v32, v161)) {
      goto LABEL_187;
    }
    Swift::Int v66 = v32 + v161 >= v23 ? v23 : v32 + v161;
    if (v66 < v32) {
      break;
    }
    if (v29 == v66) {
      goto LABEL_92;
    }
    v163 = v28;
    uint64_t v67 = v160 + 8 * v29;
    Swift::Int v168 = v66;
    while (2)
    {
      v68 = *(void **)(v30 + 8 * v29);
      uint64_t v171 = v67;
      v181 = (char *)v29;
      while (1)
      {
        v69 = *(void **)v67;
        id v70 = v68;
        id v71 = v69;
        if ((objc_msgSend(v70, *(SEL *)&v31[29].ivar_base_size) == (id)5
           || objc_msgSend(v70, *(SEL *)&v31[29].ivar_base_size) == (id)10)
          && (objc_msgSend(v71, *(SEL *)&v31[29].ivar_base_size, v159) == (id)5
           || objc_msgSend(v71, *(SEL *)&v31[29].ivar_base_size) == (id)10))
        {
          id v72 = [v70 timeAtProcessing];
          if (v72)
          {
            v73 = v72;
            v74 = v179;
            static Date._unconditionallyBridgeFromObjectiveC(_:)();

            v75 = v183;
            v76 = *v182;
            uint64_t v77 = v185;
            (*v182)(v183, v74, v185);
            v180 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))*v184;
            v180((uint64_t)v75, 0, 1, v77);
            v78 = *v178;
            uint64_t v79 = v77;
            char v31 = &PCPrintJob__metaData;
            unsigned int v80 = (*v178)((uint64_t)v75, 1, v79);
            uint64_t v81 = (uint64_t)v75;
            if (v80 != 1)
            {
              uint64_t v82 = v185;
              v76(v177, v183, v185);
              id v83 = [v71 timeAtProcessing];
              if (v83)
              {
                v84 = v83;
                v85 = v179;
                static Date._unconditionallyBridgeFromObjectiveC(_:)();

                v86 = v173;
                v87 = v85;
                uint64_t v30 = v176;
                v76(v173, v87, v82);
                v180((uint64_t)v86, 0, 1, v82);
                if (v78((uint64_t)v86, 1, v82) != 1)
                {
                  v88 = v169;
                  v76(v169, v86, v82);
                  v89 = v177;
                  LODWORD(v180) = static Date.< infix(_:_:)();
                  v90 = *v174;
                  (*v174)(v88, v82);
                  v91 = v89;
                  uint64_t v30 = v176;
                  v90(v91, v82);

                  char v31 = &PCPrintJob__metaData;
                  Swift::Int v29 = (Swift::Int)v181;
                  if ((v180 & 1) == 0) {
                    goto LABEL_66;
                  }
                  goto LABEL_88;
                }
              }
              else
              {
                v86 = v173;
                v180((uint64_t)v173, 1, 1, v82);
              }
              (*v174)(v177, v82);
              uint64_t v81 = (uint64_t)v86;
              char v31 = &PCPrintJob__metaData;
            }
          }
          else
          {
            v92 = v183;
            ((void (*)(char *, uint64_t, uint64_t, uint64_t))*v184)(v183, 1, 1, v185);
            uint64_t v81 = (uint64_t)v92;
          }
          sub_1000075A4(v81);
          Swift::Int v29 = (Swift::Int)v181;
        }
        if (objc_msgSend(v70, *(SEL *)&v31[29].ivar_base_size, v159) != (id)5
          && objc_msgSend(v70, *(SEL *)&v31[29].ivar_base_size) != (id)10)
        {
          break;
        }

LABEL_88:
        if (!v30) {
          goto LABEL_190;
        }
        v95 = *(void **)v67;
        v68 = *(void **)(v67 + 8);
        *(void *)uint64_t v67 = v68;
        *(void *)(v67 + 8) = v95;
        v67 -= 8;
        if (v29 == ++v32) {
          goto LABEL_66;
        }
      }
      if (objc_msgSend(v71, *(SEL *)&v31[29].ivar_base_size) != (id)5
        && objc_msgSend(v71, *(SEL *)&v31[29].ivar_base_size) != (id)10)
      {
        id v93 = [v70 localJobID];
        id v94 = [v71 localJobID];

        if ((uint64_t)v93 >= (uint64_t)v94) {
          goto LABEL_66;
        }
        goto LABEL_88;
      }

LABEL_66:
      ++v29;
      Swift::Int v32 = v170;
      uint64_t v67 = v171 + 8;
      if (v29 != v168) {
        continue;
      }
      break;
    }
    Swift::Int v29 = v168;
    v28 = v163;
LABEL_92:
    if (v29 < v32) {
      goto LABEL_180;
    }
    v96 = v28;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      v28 = v96;
    }
    else {
      v28 = sub_100012E1C(0, *((void *)v96 + 2) + 1, 1, v96);
    }
    unint64_t v98 = *((void *)v28 + 2);
    unint64_t v97 = *((void *)v28 + 3);
    unint64_t v99 = v98 + 1;
    if (v98 >= v97 >> 1) {
      v28 = sub_100012E1C((char *)(v97 > 1), v98 + 1, 1, v28);
    }
    *((void *)v28 + 2) = v99;
    v181 = v28 + 32;
    v100 = &v28[16 * v98 + 32];
    *(void *)v100 = v32;
    *((void *)v100 + 1) = v29;
    if (v98)
    {
      v101 = v181;
      while (1)
      {
        unint64_t v102 = v99 - 1;
        if (v99 >= 4)
        {
          v107 = &v101[16 * v99];
          uint64_t v108 = *((void *)v107 - 8);
          uint64_t v109 = *((void *)v107 - 7);
          BOOL v113 = __OFSUB__(v109, v108);
          uint64_t v110 = v109 - v108;
          if (v113) {
            goto LABEL_168;
          }
          uint64_t v112 = *((void *)v107 - 6);
          uint64_t v111 = *((void *)v107 - 5);
          BOOL v113 = __OFSUB__(v111, v112);
          uint64_t v105 = v111 - v112;
          char v106 = v113;
          if (v113) {
            goto LABEL_169;
          }
          unint64_t v114 = v99 - 2;
          v115 = &v101[16 * v99 - 32];
          uint64_t v117 = *(void *)v115;
          uint64_t v116 = *((void *)v115 + 1);
          BOOL v113 = __OFSUB__(v116, v117);
          uint64_t v118 = v116 - v117;
          if (v113) {
            goto LABEL_170;
          }
          BOOL v113 = __OFADD__(v105, v118);
          uint64_t v119 = v105 + v118;
          if (v113) {
            goto LABEL_172;
          }
          if (v119 >= v110)
          {
            v137 = &v101[16 * v102];
            uint64_t v139 = *(void *)v137;
            uint64_t v138 = *((void *)v137 + 1);
            BOOL v113 = __OFSUB__(v138, v139);
            uint64_t v140 = v138 - v139;
            if (v113) {
              goto LABEL_178;
            }
            BOOL v130 = v105 < v140;
            goto LABEL_130;
          }
        }
        else
        {
          if (v99 != 3)
          {
            uint64_t v131 = *((void *)v28 + 4);
            uint64_t v132 = *((void *)v28 + 5);
            BOOL v113 = __OFSUB__(v132, v131);
            uint64_t v124 = v132 - v131;
            char v125 = v113;
            goto LABEL_124;
          }
          uint64_t v104 = *((void *)v28 + 4);
          uint64_t v103 = *((void *)v28 + 5);
          BOOL v113 = __OFSUB__(v103, v104);
          uint64_t v105 = v103 - v104;
          char v106 = v113;
        }
        if (v106) {
          goto LABEL_171;
        }
        unint64_t v114 = v99 - 2;
        v120 = &v101[16 * v99 - 32];
        uint64_t v122 = *(void *)v120;
        uint64_t v121 = *((void *)v120 + 1);
        BOOL v123 = __OFSUB__(v121, v122);
        uint64_t v124 = v121 - v122;
        char v125 = v123;
        if (v123) {
          goto LABEL_173;
        }
        v126 = &v101[16 * v102];
        uint64_t v128 = *(void *)v126;
        uint64_t v127 = *((void *)v126 + 1);
        BOOL v113 = __OFSUB__(v127, v128);
        uint64_t v129 = v127 - v128;
        if (v113) {
          goto LABEL_175;
        }
        if (__OFADD__(v124, v129)) {
          goto LABEL_177;
        }
        if (v124 + v129 >= v105)
        {
          BOOL v130 = v105 < v129;
LABEL_130:
          if (v130) {
            unint64_t v102 = v114;
          }
          goto LABEL_132;
        }
LABEL_124:
        if (v125) {
          goto LABEL_174;
        }
        v133 = &v101[16 * v102];
        uint64_t v135 = *(void *)v133;
        uint64_t v134 = *((void *)v133 + 1);
        BOOL v113 = __OFSUB__(v134, v135);
        uint64_t v136 = v134 - v135;
        if (v113) {
          goto LABEL_176;
        }
        if (v136 < v124) {
          goto LABEL_141;
        }
LABEL_132:
        Swift::Int v141 = v29;
        unint64_t v142 = v102 - 1;
        if (v102 - 1 >= v99)
        {
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
LABEL_180:
          __break(1u);
LABEL_181:
          __break(1u);
LABEL_182:
          __break(1u);
LABEL_183:
          __break(1u);
LABEL_184:
          __break(1u);
LABEL_185:
          __break(1u);
LABEL_186:
          __break(1u);
LABEL_187:
          __break(1u);
          goto LABEL_188;
        }
        uint64_t v143 = v30;
        if (!v30) {
          goto LABEL_191;
        }
        v144 = v28;
        v145 = &v101[16 * v142];
        v146 = v101;
        uint64_t v147 = *(void *)v145;
        v148 = &v146[16 * v102];
        uint64_t v149 = *((void *)v148 + 1);
        uint64_t v150 = v175;
        sub_1000061A4((id *)(v143 + 8 * *(void *)v145), (void **)(v143 + 8 * *(void *)v148), v143 + 8 * v149, v172);
        uint64_t v175 = v150;
        if (v150) {
          goto LABEL_160;
        }
        if (v149 < v147) {
          goto LABEL_165;
        }
        if (v102 > *((void *)v144 + 2)) {
          goto LABEL_166;
        }
        *(void *)v145 = v147;
        v101 = v181;
        *(void *)&v181[16 * v142 + 8] = v149;
        unint64_t v151 = *((void *)v144 + 2);
        if (v102 >= v151) {
          goto LABEL_167;
        }
        unint64_t v99 = v151 - 1;
        memmove(v148, v148 + 16, 16 * (v151 - 1 - v102));
        v28 = v144;
        *((void *)v144 + 2) = v151 - 1;
        BOOL v130 = v151 > 2;
        uint64_t v30 = v176;
        Swift::Int v29 = v141;
        if (!v130) {
          goto LABEL_141;
        }
      }
    }
    unint64_t v99 = 1;
LABEL_141:
    Swift::Int v23 = v166;
    if (v29 >= v166)
    {
      uint64_t v2 = v175;
      if (v99 < 2) {
        goto LABEL_160;
      }
      goto LABEL_147;
    }
  }
LABEL_188:
  __break(1u);
LABEL_189:
  __break(1u);
LABEL_190:
  __break(1u);
LABEL_191:
  __break(1u);
LABEL_192:
  __break(1u);
LABEL_193:
  __break(1u);
}

void sub_100005C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v48 = a1;
  uint64_t v7 = sub_100004A14(&qword_100020CA0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  v52 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v61 = (char *)&v46 - v10;
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = __chkstk_darwin(v11);
  id v49 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v56 = (char *)&v46 - v15;
  __chkstk_darwin(v14);
  uint64_t v54 = (char *)&v46 - v17;
  uint64_t v47 = a2;
  if (a3 != a2)
  {
    uint64_t v18 = *a4;
    v59 = (void (**)(char *, char *, uint64_t))(v16 + 32);
    v60 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
    uint64_t v55 = (unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
    v51 = (void (**)(char *, uint64_t))(v16 + 8);
    uint64_t v62 = v18;
    uint64_t v19 = v18 + 8 * a3 - 8;
    uint64_t v20 = &PCPrintJob__metaData;
    uint64_t v58 = v11;
LABEL_6:
    uint64_t v21 = *(void **)(v62 + 8 * a3);
    uint64_t v22 = v48;
    uint64_t v50 = v19;
    uint64_t v57 = a3;
    while (1)
    {
      Swift::Int v23 = *(void **)v19;
      id v24 = v21;
      id v25 = v23;
      if ((objc_msgSend(v24, *(SEL *)&v20[29].ivar_base_size) == (id)5
         || objc_msgSend(v24, *(SEL *)&v20[29].ivar_base_size) == (id)10)
        && (objc_msgSend(v25, *(SEL *)&v20[29].ivar_base_size) == (id)5
         || objc_msgSend(v25, *(SEL *)&v20[29].ivar_base_size) == (id)10))
      {
        id v26 = [v24 timeAtProcessing];
        if (v26)
        {
          uint64_t v27 = v26;
          v28 = v56;
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          Swift::Int v29 = *v59;
          uint64_t v30 = v61;
          (*v59)(v61, v28, v11);
          char v31 = *v60;
          (*v60)(v30, 0, 1, v11);
          Swift::Int v32 = *v55;
          unsigned int v33 = (*v55)(v30, 1, v11);
          uint64_t v34 = (uint64_t)v30;
          if (v33 != 1)
          {
            v53 = v31;
            uint64_t v11 = v58;
            v29(v54, v61, v58);
            id v35 = [v25 timeAtProcessing];
            if (v35)
            {
              id v36 = v35;
              uint64_t v37 = v56;
              static Date._unconditionallyBridgeFromObjectiveC(_:)();

              Swift::Int v38 = v52;
              v29(v52, v37, v11);
              v53(v38, 0, 1, v11);
              if (v32(v38, 1, v11) != 1)
              {
                char v39 = v49;
                v29(v49, v38, v11);
                Swift::Int v40 = v54;
                LODWORD(v53) = static Date.< infix(_:_:)();
                v41 = *v51;
                (*v51)(v39, v11);
                v41(v40, v11);

                a3 = v57;
                uint64_t v20 = &PCPrintJob__metaData;
                if ((v53 & 1) == 0) {
                  goto LABEL_5;
                }
                goto LABEL_27;
              }
            }
            else
            {
              Swift::Int v38 = v52;
              v53(v52, 1, 1, v11);
            }
            (*v51)(v54, v11);
            uint64_t v34 = (uint64_t)v38;
          }
        }
        else
        {
          Swift::Int v42 = v61;
          (*v60)(v61, 1, 1, v11);
          uint64_t v34 = (uint64_t)v42;
        }
        sub_1000075A4(v34);
        a3 = v57;
        uint64_t v11 = v58;
        uint64_t v20 = &PCPrintJob__metaData;
      }
      if (objc_msgSend(v24, *(SEL *)&v20[29].ivar_base_size) == (id)5
        || objc_msgSend(v24, *(SEL *)&v20[29].ivar_base_size) == (id)10)
      {
      }
      else
      {
        if (objc_msgSend(v25, *(SEL *)&v20[29].ivar_base_size) == (id)5
          || objc_msgSend(v25, *(SEL *)&v20[29].ivar_base_size) == (id)10)
        {

LABEL_5:
          ++a3;
          uint64_t v19 = v50 + 8;
          if (a3 == v47) {
            return;
          }
          goto LABEL_6;
        }
        id v43 = [v24 localJobID];
        id v44 = [v25 localJobID];

        if ((uint64_t)v43 >= (uint64_t)v44) {
          goto LABEL_5;
        }
      }
LABEL_27:
      if (!v62)
      {
        __break(1u);
        return;
      }
      uint64_t v45 = *(void **)v19;
      uint64_t v21 = *(void **)(v19 + 8);
      *(void *)uint64_t v19 = v21;
      *(void *)(v19 + 8) = v45;
      v19 -= 8;
      if (a3 == ++v22) {
        goto LABEL_5;
      }
    }
  }
}

uint64_t sub_1000061A4(id *__src, void **a2, unint64_t a3, void **__dst)
{
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v9 = (char *)a2 - (char *)__src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  if (v10 < v12 >> 3)
  {
    if (__dst != __src || &__src[v10] <= __dst)
    {
      memmove(__dst, __src, 8 * v10);
      uint64_t v6 = a2;
    }
    uint64_t v15 = &__dst[v10];
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      uint64_t v16 = __dst;
      while (1)
      {
        uint64_t v17 = v6;
        v51 = *v6;
        id v50 = *v16;
        id v18 = v50;
        uint64_t v19 = v51;
        id v20 = v18;
        char v21 = sub_1000034B0(&v51, &v50);
        if (v4)
        {

          uint64_t v44 = (char *)v15 - (char *)v16 + 7;
          if ((char *)v15 - (char *)v16 >= 0) {
            uint64_t v44 = (char *)v15 - (char *)v16;
          }
          if (v7 < v16 || v7 >= (id *)((char *)v16 + (v44 & 0xFFFFFFFFFFFFFFF8)) || v7 != v16)
          {
            size_t v40 = 8 * (v44 >> 3);
            v41 = v7;
LABEL_50:
            Swift::Int v42 = v16;
LABEL_51:
            memmove(v41, v42, v40);
          }
          return 1;
        }
        char v22 = v21;

        if ((v22 & 1) == 0) {
          break;
        }
        Swift::Int v23 = v17;
        uint64_t v6 = v17 + 1;
        if (v7 != v17) {
          goto LABEL_17;
        }
LABEL_18:
        ++v7;
        if (v16 >= v15 || (unint64_t)v6 >= a3)
        {
          uint64_t v6 = v7;
          goto LABEL_44;
        }
      }
      Swift::Int v23 = v16;
      BOOL v24 = v7 == v16++;
      uint64_t v6 = v17;
      if (v24) {
        goto LABEL_18;
      }
LABEL_17:
      *uint64_t v7 = *v23;
      goto LABEL_18;
    }
    uint64_t v6 = v7;
    uint64_t v16 = __dst;
LABEL_44:
    uint64_t v39 = (char *)v15 - (char *)v16 + 7;
    if ((char *)v15 - (char *)v16 >= 0) {
      uint64_t v39 = (char *)v15 - (char *)v16;
    }
    if (v6 < v16 || v6 >= (id *)((char *)v16 + (v39 & 0xFFFFFFFFFFFFFFF8)) || v6 != v16)
    {
      size_t v40 = 8 * (v39 >> 3);
      v41 = v6;
      goto LABEL_50;
    }
    return 1;
  }
  uint64_t v16 = __dst;
  if (__dst != a2 || &a2[v13] <= __dst)
  {
    memmove(__dst, a2, 8 * v13);
    uint64_t v6 = a2;
  }
  uint64_t v15 = &v16[v13];
  if (v7 >= v6 || v11 < 8) {
    goto LABEL_44;
  }
  id v26 = (void **)(a3 - 8);
  uint64_t v47 = v7;
  while (1)
  {
    uint64_t v27 = v15;
    v28 = (char *)(v15 - 1);
    v51 = *(v15 - 1);
    Swift::Int v29 = v6;
    char v31 = v6 - 1;
    id v50 = *(v6 - 1);
    id v30 = v50;
    Swift::Int v32 = v51;
    id v33 = v30;
    char v34 = sub_1000034B0(&v51, &v50);
    if (v4) {
      break;
    }
    char v35 = v34;
    id v36 = v26 + 1;

    if ((v35 & 1) == 0)
    {
      uint64_t v6 = v29;
      char v31 = (void **)v28;
      if (v36 == v27)
      {
        uint64_t v15 = (id *)v28;
        unint64_t v38 = (unint64_t)v47;
        uint64_t v16 = __dst;
        if (v26 < v27) {
          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v15 = (id *)v28;
LABEL_38:
        unint64_t v38 = (unint64_t)v47;
        uint64_t v16 = __dst;
      }
LABEL_39:
      char *v26 = *v31;
      goto LABEL_40;
    }
    uint64_t v15 = v27;
    if (v36 != v29)
    {
      uint64_t v6 = v31;
      goto LABEL_38;
    }
    BOOL v37 = v26 >= v29;
    uint64_t v6 = v31;
    unint64_t v38 = (unint64_t)v47;
    uint64_t v16 = __dst;
    if (v37) {
      goto LABEL_39;
    }
LABEL_40:
    if ((unint64_t)v6 > v38)
    {
      --v26;
      if (v15 > v16) {
        continue;
      }
    }
    goto LABEL_44;
  }

  Swift::Int v42 = __dst;
  uint64_t v45 = (char *)v27 - (char *)__dst + 7;
  if ((char *)v27 - (char *)__dst >= 0) {
    uint64_t v45 = (char *)v27 - (char *)__dst;
  }
  uint64_t v46 = v45 >> 3;
  if (v29 < __dst || v29 >= (void **)((char *)__dst + (v45 & 0xFFFFFFFFFFFFFFF8)))
  {
    memmove(v29, __dst, 8 * v46);
  }
  else if (v29 != __dst)
  {
    size_t v40 = 8 * v46;
    v41 = v29;
    goto LABEL_51;
  }
  return 1;
}

uint64_t sub_100006540(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_100007560(&qword_100020C98, (uint64_t *)&unk_100020B08);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_100004A14((uint64_t *)&unk_100020B08);
            uint64_t v10 = sub_100006710(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_100006848(0, (unint64_t *)&qword_100020C60);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_100006710(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1000067C0(v6, a2, a3);
  return sub_100006778;
}

void sub_100006778(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_1000067C0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_100006840;
  }
  __break(1u);
  return result;
}

void sub_100006840(id *a1)
{
}

uint64_t sub_100006848(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100006884()
{
  unint64_t result = qword_100020C68;
  if (!qword_100020C68)
  {
    sub_100006848(255, (unint64_t *)&qword_100020C60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020C68);
  }
  return result;
}

uint64_t sub_1000068EC()
{
  return sub_100003F50(v0);
}

uint64_t sub_1000068F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006904()
{
  return swift_release();
}

uint64_t sub_10000690C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100006954()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000698C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100006A08()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    unint64_t v2 = swift_bridgeObjectRetain();
    uint64_t v0 = (uint64_t)sub_100004AE8(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v0 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v3 = v0;
  sub_100004A6C(&v3);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_100006AD8(unint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = a1;
  if (a1 >> 62) {
    goto LABEL_35;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v6)
  {
    uint64_t v7 = 0;
    unint64_t v8 = v5 & 0xC000000000000001;
    uint64_t v19 = v3;
    uint64_t v20 = v5 + 32;
    uint64_t v23 = v5;
    unint64_t v24 = a2 & 0xC000000000000001;
    unint64_t v9 = a2 >> 62;
    unint64_t v21 = v5 & 0xC000000000000001;
    uint64_t v22 = v6;
    while (1)
    {
      if (v8)
      {
        id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        if (!v9) {
          goto LABEL_6;
        }
      }
      else
      {
        id v10 = *(id *)(v20 + 8 * v7);
        if (!v9)
        {
LABEL_6:
          uint64_t v11 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v11) {
            goto LABEL_14;
          }
          goto LABEL_7;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
      if (!v11)
      {
LABEL_14:

        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
LABEL_7:
      if (v24) {
        id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v12 = *(id *)(a2 + 32);
      }
      uint64_t v5 = (uint64_t)v12;
      sub_100006848(0, (unint64_t *)&qword_100020C60);
      char v13 = static NSObject.== infix(_:_:)();

      if (v13)
      {
LABEL_31:

        swift_bridgeObjectRelease();
        return v7;
      }
      if (v11 != 1) {
        break;
      }

      swift_bridgeObjectRelease();
LABEL_26:
      uint64_t v6 = v22;
      uint64_t v5 = v23;
      unint64_t v9 = a2 >> 62;
      unint64_t v8 = v21;
LABEL_27:
      if (__OFADD__(v7++, 1)) {
        goto LABEL_34;
      }
      if (v7 == v6) {
        return 0;
      }
    }
    if (v24)
    {
      uint64_t v5 = 1;
      while (1)
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
        uint64_t v3 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          break;
        }
        char v14 = static NSObject.== infix(_:_:)();
        swift_unknownObjectRelease();
        if (v14) {
          goto LABEL_31;
        }
        ++v5;
        if (v3 == v11) {
          goto LABEL_25;
        }
      }
      __break(1u);
    }
    else
    {
      uint64_t v15 = 5;
      while (1)
      {
        uint64_t v3 = v15 - 3;
        if (__OFADD__(v15 - 4, 1)) {
          break;
        }
        uint64_t v5 = (uint64_t)*(id *)(a2 + 8 * v15);
        char v16 = static NSObject.== infix(_:_:)();

        if (v16) {
          goto LABEL_31;
        }
        ++v15;
        if (v3 == v11)
        {
LABEL_25:

          swift_bridgeObjectRelease();
          uint64_t v3 = v19;
          goto LABEL_26;
        }
      }
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_100006D74(unint64_t *a1, unint64_t a2)
{
  unint64_t v5 = swift_bridgeObjectRetain();
  unint64_t v37 = a2;
  unint64_t v6 = sub_100006AD8(v5, a2);
  char v8 = v7;
  uint64_t v9 = v2;
  swift_bridgeObjectRelease();
  if (v2) {
    return v6;
  }
  if ((v8 & 1) == 0)
  {
    unint64_t v10 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_82;
    }
    if (*a1 >> 62)
    {
LABEL_83:
      swift_bridgeObjectRetain();
      uint64_t v32 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v10 != v32) {
        goto LABEL_6;
      }
    }
    else if (v10 != *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      uint64_t v35 = v9;
      unint64_t v36 = v37 & 0xC000000000000001;
      char v34 = a1;
      while (1)
      {
        unint64_t v11 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if ((v10 & 0x8000000000000000) != 0) {
            goto LABEL_71;
          }
          if (v10 >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_72;
          }
          id v12 = *(id *)(v11 + 8 * v10 + 32);
        }
        char v13 = v12;
        if (v37 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
          if (!v14) {
            goto LABEL_22;
          }
        }
        else
        {
          uint64_t v14 = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v14) {
            goto LABEL_22;
          }
        }
        if (v36) {
          id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v15 = *(id *)(v37 + 32);
        }
        char v16 = v15;
        sub_100006848(0, (unint64_t *)&qword_100020C60);
        char v17 = static NSObject.== infix(_:_:)();

        if (v17)
        {

          swift_bridgeObjectRelease();
          BOOL v18 = __OFADD__(v10++, 1);
          if (v18) {
            goto LABEL_73;
          }
          goto LABEL_43;
        }
        if (v14 != 1)
        {
          if (v36)
          {
            uint64_t v28 = 1;
            while (1)
            {
              specialized _ArrayBuffer._getElementSlowPath(_:)();
              a1 = (unint64_t *)(v28 + 1);
              if (__OFADD__(v28, 1)) {
                break;
              }
              uint64_t v9 = static NSObject.== infix(_:_:)();
              swift_unknownObjectRelease();
              if (v9) {
                goto LABEL_59;
              }
              ++v28;
              if (a1 == (unint64_t *)v14) {
                goto LABEL_57;
              }
            }
            __break(1u);
LABEL_71:
            __break(1u);
LABEL_72:
            __break(1u);
LABEL_73:
            __break(1u);
            goto LABEL_74;
          }
          uint64_t v9 = 5;
          while (1)
          {
            a1 = (unint64_t *)(v9 - 3);
            if (__OFADD__(v9 - 4, 1)) {
              break;
            }
            id v29 = *(id *)(v37 + 8 * v9);
            char v30 = static NSObject.== infix(_:_:)();

            if (v30)
            {
LABEL_59:

              swift_bridgeObjectRelease();
              a1 = v34;
              uint64_t v9 = v35;
              BOOL v18 = __OFADD__(v10++, 1);
              if (v18) {
                goto LABEL_73;
              }
              goto LABEL_43;
            }
            ++v9;
            if (a1 == (unint64_t *)v14)
            {
LABEL_57:

              swift_bridgeObjectRelease();
              a1 = v34;
              uint64_t v9 = v35;
              if (v6 != v10) {
                goto LABEL_23;
              }
              goto LABEL_41;
            }
          }
LABEL_74:
          __break(1u);
LABEL_75:
          __break(1u);
LABEL_76:
          __break(1u);
LABEL_77:
          __break(1u);
LABEL_78:
          __break(1u);
LABEL_79:
          __break(1u);
LABEL_80:
          __break(1u);
LABEL_81:
          __break(1u);
LABEL_82:
          __break(1u);
          goto LABEL_83;
        }
LABEL_22:

        swift_bridgeObjectRelease();
        if (v6 == v10) {
          goto LABEL_41;
        }
LABEL_23:
        unint64_t v19 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          unint64_t v19 = *a1;
          if ((*a1 & 0xC000000000000001) == 0) {
            goto LABEL_27;
          }
        }
        else
        {
          if ((v6 & 0x8000000000000000) != 0) {
            goto LABEL_76;
          }
          if (v6 >= *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_77;
          }
          id v20 = *(id *)(v19 + 8 * v6 + 32);
          if ((v19 & 0xC000000000000001) == 0)
          {
LABEL_27:
            if ((v10 & 0x8000000000000000) != 0) {
              goto LABEL_78;
            }
            if (v10 >= *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_79;
            }
            id v21 = *(id *)(v19 + 8 * v10 + 32);
            goto LABEL_30;
          }
        }
        id v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        unint64_t v19 = *a1;
LABEL_30:
        int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
        *a1 = v19;
        if (!isUniquelyReferenced_nonNull_bridgeObject
          || (v19 & 0x8000000000000000) != 0
          || (v19 & 0x4000000000000000) != 0)
        {
          unint64_t v19 = sub_10000698C(v19);
          *a1 = v19;
        }
        uint64_t v23 = *(void **)((v19 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20);
        *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20) = v21;

        specialized Array._endMutation()();
        unint64_t v24 = *a1;
        int v25 = swift_isUniquelyReferenced_nonNull_bridgeObject();
        *a1 = v24;
        if (!v25 || (v24 & 0x8000000000000000) != 0 || (v24 & 0x4000000000000000) != 0)
        {
          unint64_t v24 = sub_10000698C(v24);
          *a1 = v24;
        }
        if ((v10 & 0x8000000000000000) != 0) {
          goto LABEL_80;
        }
        if (v10 >= *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_81;
        }
        id v26 = *(void **)((v24 & 0xFFFFFFFFFFFFFF8) + 8 * v10 + 0x20);
        *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 8 * v10 + 0x20) = v20;

        specialized Array._endMutation()();
LABEL_41:
        BOOL v18 = __OFADD__(v6++, 1);
        if (v18) {
          goto LABEL_75;
        }
        BOOL v18 = __OFADD__(v10++, 1);
        if (v18) {
          goto LABEL_73;
        }
LABEL_43:
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v27 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v27 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (v10 == v27) {
          return v6;
        }
      }
    }
    return v6;
  }
  if (!(*a1 >> 62)) {
    return *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v33 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  return v33;
}

uint64_t sub_100007244(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!((unint64_t)*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v20 < v2) {
    goto LABEL_28;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v8 = v21 + v5;
    if (!__OFADD__(v21, v5)) {
      goto LABEL_8;
    }
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if ((unint64_t)*v3 >> 62) {
    goto LABEL_31;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_33;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v9 & 0x8000000000000000) != 0
    || (v9 & 0x4000000000000000) != 0
    || (uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8, v8 > *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    if (!(v9 >> 62))
    {
LABEL_13:
      swift_bridgeObjectRetain();
      *uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
      swift_bridgeObjectRelease();
      uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_14;
    }
LABEL_34:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v12 = v11 + 32;
  char v13 = (char *)(v11 + 32 + 8 * v4);
  sub_100006848(0, (unint64_t *)&qword_100020C60);
  uint64_t result = swift_arrayDestroy();
  if (v5)
  {
    if ((unint64_t)*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2)) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = v15 - v2;
      if (!__OFSUB__(v15, v2))
      {
LABEL_17:
        char v17 = (char *)(v12 + 8 * v2);
        if (v4 != v2 || v13 >= &v17[8 * v16]) {
          uint64_t result = (uint64_t)memmove(v13, v17, 8 * v16);
        }
        if (!((unint64_t)*v3 >> 62))
        {
          uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + v5;
          if (!__OFADD__(v18, v5))
          {
LABEL_22:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
            goto LABEL_23;
          }
LABEL_40:
          __break(1u);
          return result;
        }
LABEL_38:
        swift_bridgeObjectRetain();
        uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v19 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_22;
        }
        goto LABEL_40;
      }
    }
    __break(1u);
    goto LABEL_38;
  }
LABEL_23:

  return specialized Array._endMutation()();
}

uint64_t sub_10000750C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000754C()
{
  return sub_100004494();
}

uint64_t sub_100007560(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000047A0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000075A4(uint64_t a1)
{
  uint64_t v2 = sub_100004A14(&qword_100020CA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes()
{
  return &type metadata for PrintActivityAttributes;
}

BOOL sub_100007638(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000764C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100007694()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000076C0()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_100007704()
{
  uint64_t result = 0x656C746954626F6ALL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x73656761506D756ELL;
      break;
    case 2:
      uint64_t result = 0x50746E6572727563;
      break;
    case 3:
      uint64_t result = 0x617453726F727265;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000077A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100008170(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000077C8()
{
  return 0;
}

void sub_1000077D4(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1000077E0(uint64_t a1)
{
  unint64_t v2 = sub_100008608();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000781C(uint64_t a1)
{
  unint64_t v2 = sub_100008608();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007858(void *a1)
{
  uint64_t v3 = sub_100004A14(&qword_100020CE8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000085C4(a1, a1[3]);
  sub_100008608();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v1)
  {
    v8[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[13] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v8[12] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

double sub_100007A08@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_10000835C(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_100007A4C(void *a1)
{
  return sub_100007858(a1);
}

Swift::Int sub_100007A64()
{
  Swift::UInt v1 = *(void *)(v0 + 16);
  Swift::UInt v2 = *(void *)(v0 + 24);
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_100007B18()
{
  Swift::UInt v1 = *(void *)(v0 + 16);
  Swift::UInt v2 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  swift_bridgeObjectRetain();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100007BBC()
{
  Swift::UInt v1 = *(void *)(v0 + 16);
  Swift::UInt v2 = *(void *)(v0 + 24);
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_100007C6C(_OWORD *a1, long long *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = *a2;
  long long v4 = a2[1];
  v7[2] = a1[2];
  v8[0] = v3;
  long long v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_1000080BC(v7, v8) & 1;
}

uint64_t sub_100007CB4()
{
  return 0;
}

uint64_t sub_100007CC0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_100007CF0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100007CFC(uint64_t a1)
{
  unint64_t v2 = sub_1000086AC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007D38(uint64_t a1)
{
  unint64_t v2 = sub_1000086AC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007D74(uint64_t a1)
{
  return sub_10000865C(a1);
}

uint64_t sub_100007D9C(void *a1)
{
  uint64_t v2 = sub_100004A14(&qword_100020CF0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  long long v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000085C4(a1, a1[3]);
  sub_1000086AC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_100007EB0()
{
  unint64_t result = qword_100020CA8;
  if (!qword_100020CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CA8);
  }
  return result;
}

unint64_t sub_100007F08()
{
  unint64_t result = qword_100020CB0;
  if (!qword_100020CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CB0);
  }
  return result;
}

unint64_t sub_100007F60()
{
  unint64_t result = qword_100020CB8;
  if (!qword_100020CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CB8);
  }
  return result;
}

unint64_t sub_100007FB8()
{
  unint64_t result = qword_100020CC0;
  if (!qword_100020CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CC0);
  }
  return result;
}

unint64_t sub_100008010()
{
  unint64_t result = qword_100020CC8;
  if (!qword_100020CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CC8);
  }
  return result;
}

unint64_t sub_100008068()
{
  unint64_t result = qword_100020CD0;
  if (!qword_100020CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CD0);
  }
  return result;
}

uint64_t sub_1000080BC(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (char v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v5 & 1) != 0))
  {
    if (a1[2] == a2[2] && a1[3] == a2[3])
    {
      if (a1[4] == a2[4] && a1[5] == a2[5])
      {
        return 1;
      }
      else
      {
        return _stringCompareWithSmolCheck(_:_:expecting:)();
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100008170(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C746954626F6ALL && a2 == 0xE800000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73656761506D756ELL && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x50746E6572727563 && a2 == 0xEB00000000656761 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x617453726F727265 && a2 == 0xEB00000000737574)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_10000835C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100004A14(&qword_100020CD8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000085C4(a1, a1[3]);
  sub_100008608();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return sub_10000865C((uint64_t)a1);
  }
  char v25 = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  char v24 = 1;
  swift_bridgeObjectRetain();
  uint64_t v21 = KeyedDecodingContainer.decode(_:forKey:)();
  char v23 = 2;
  uint64_t v20 = KeyedDecodingContainer.decode(_:forKey:)();
  char v22 = 3;
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v14 = v13;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v19 = v12;
  v15(v8, v5);
  swift_bridgeObjectRetain();
  sub_10000865C((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v9;
  a2[1] = v11;
  uint64_t v17 = v20;
  a2[2] = v21;
  a2[3] = v17;
  a2[4] = v19;
  a2[5] = v14;
  return result;
}

void *sub_1000085C4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100008608()
{
  unint64_t result = qword_100020CE0;
  if (!qword_100020CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CE0);
  }
  return result;
}

uint64_t sub_10000865C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_1000086AC()
{
  unint64_t result = qword_100020CF8;
  if (!qword_100020CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020CF8);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes.CodingKeys()
{
  return &type metadata for PrintActivityAttributes.CodingKeys;
}

unsigned char *initializeBufferWithCopyOfBuffer for PrintActivityAttributes.ContentState.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PrintActivityAttributes.ContentState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PrintActivityAttributes.ContentState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000887CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_1000088A4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000088B0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes.ContentState.CodingKeys()
{
  return &type metadata for PrintActivityAttributes.ContentState.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for PrintActivityAttributes.ContentState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PrintActivityAttributes.ContentState()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PrintActivityAttributes.ContentState(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintActivityAttributes.ContentState(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintActivityAttributes.ContentState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes.ContentState()
{
  return &type metadata for PrintActivityAttributes.ContentState;
}

unint64_t sub_100008B0C()
{
  unint64_t result = qword_100020D00;
  if (!qword_100020D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D00);
  }
  return result;
}

unint64_t sub_100008B64()
{
  unint64_t result = qword_100020D08;
  if (!qword_100020D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D08);
  }
  return result;
}

unint64_t sub_100008BBC()
{
  unint64_t result = qword_100020D10;
  if (!qword_100020D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D10);
  }
  return result;
}

unint64_t sub_100008C14()
{
  unint64_t result = qword_100020D18;
  if (!qword_100020D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D18);
  }
  return result;
}

unint64_t sub_100008C6C()
{
  unint64_t result = qword_100020D20;
  if (!qword_100020D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D20);
  }
  return result;
}

uint64_t destroy for NoJobsView()
{
  swift_release();

  return swift_release();
}

void *_s12Print_Center10NoJobsViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for NoJobsView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for NoJobsView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for NoJobsView(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for NoJobsView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NoJobsView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NoJobsView()
{
  return &type metadata for NoJobsView;
}

uint64_t sub_100008EA0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100008EBC@<X0>(uint64_t a1@<X8>)
{
  sub_100004A14(&qword_100020D28);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [self mainBundle];
  v22._countAndFlagsBits = 0xD000000000000023;
  v22._object = (void *)0x8000000100017670;
  v5._object = (void *)0x8000000100017650;
  v5._countAndFlagsBits = 0xD000000000000012;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  Swift::String v7 = NSLocalizedString(_:tableName:bundle:value:comment:)(v5, (Swift::String_optional)0, (NSBundle)v4, v6, v22);

  Swift::String v21 = v7;
  sub_1000091C0();
  uint64_t v8 = Text.init<A>(_:)();
  uint64_t v10 = v9;
  char v12 = v11;
  uint64_t v14 = v13;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v16 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v3, 1, 1, v16);
  uint64_t v17 = static Font.system(size:weight:design:)();
  sub_100009268((uint64_t)v3);
  uint64_t v18 = swift_getKeyPath();
  uint64_t v19 = static Color.secondary.getter();
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v8;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v12 & 1;
  *(void *)(a1 + 24) = v14;
  *(void *)(a1 + 32) = KeyPath;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = v18;
  *(void *)(a1 + 56) = v17;
  *(void *)(a1 + 64) = result;
  *(void *)(a1 + 72) = v19;
  return result;
}

uint64_t sub_1000090B8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000090D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v17 = static HorizontalAlignment.center.getter();
  uint64_t v2 = static VerticalAlignment.center.getter();
  sub_100008EBC((uint64_t)v18);
  uint64_t v3 = v18[0];
  uint64_t v4 = v18[1];
  char v5 = v19;
  char v6 = v21;
  uint64_t v7 = v23;
  uint64_t v8 = v24;
  long long v15 = v20;
  long long v16 = v22;
  char v27 = 1;
  char v26 = 1;
  char v25 = v19;
  char v9 = static Edge.Set.top.getter();
  uint64_t result = EdgeInsets.init(_all:)();
  LOBYTE(v18[0]) = 0;
  *(void *)a1 = v17;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = v3;
  *(void *)(a1 + 56) = v4;
  *(unsigned char *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 72) = v15;
  *(unsigned char *)(a1 + 88) = v6;
  *(_OWORD *)(a1 + 96) = v16;
  *(void *)(a1 + 112) = v7;
  *(void *)(a1 + 120) = v8;
  *(unsigned char *)(a1 + 128) = v9;
  *(void *)(a1 + 136) = v11;
  *(void *)(a1 + 144) = v12;
  *(void *)(a1 + 152) = v13;
  *(void *)(a1 + 160) = v14;
  *(unsigned char *)(a1 + 168) = v18[0];
  return result;
}

unint64_t sub_1000091C0()
{
  unint64_t result = qword_100020D30;
  if (!qword_100020D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D30);
  }
  return result;
}

uint64_t sub_100009214@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100009240()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100009268(uint64_t a1)
{
  uint64_t v2 = sub_100004A14(&qword_100020D28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000092C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000092F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100009320()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_10000934C()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100009378@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000093A4()
{
  return EnvironmentValues.foregroundColor.setter();
}

unint64_t sub_1000093D4()
{
  unint64_t result = qword_100020D38;
  if (!qword_100020D38)
  {
    sub_1000047A0(&qword_100020D40);
    sub_100009450();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D38);
  }
  return result;
}

unint64_t sub_100009450()
{
  unint64_t result = qword_100020D48;
  if (!qword_100020D48)
  {
    sub_1000047A0(&qword_100020D50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020D48);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for JobCellView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v4 = v3;
  return a1;
}

void destroy for JobCellView(uint64_t a1)
{
}

uint64_t assignWithCopy for JobCellView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  id v4 = *(void **)(a2 + 8);
  char v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for JobCellView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for JobCellView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for JobCellView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JobCellView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JobCellView()
{
  return &type metadata for JobCellView;
}

uint64_t sub_10000962C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100009648@<X0>(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, _OWORD *a4@<X8>)
{
  int v50 = a3;
  uint64_t v52 = a1;
  uint64_t v6 = sub_100004A14(&qword_100020D60);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v51 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v45 - v9;
  uint64_t v11 = type metadata accessor for Image.ResizingMode();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = a2;
  sub_100010530();

  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for Image.ResizingMode.stretch(_:), v11);
  double v16 = 0.0;
  uint64_t v56 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  unsigned __int8 v17 = v94;
  unsigned __int8 v18 = v96;
  uint64_t v54 = v97;
  uint64_t v55 = v95;
  uint64_t v57 = v98;
  uint64_t v58 = v93;
  id v19 = v15;
  LOBYTE(v11) = sub_100010640();

  if (v11) {
    double v16 = 1.0;
  }
  uint64_t v49 = static Color.secondary.getter();
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  double v20 = v99;
  unsigned int v21 = v100;
  unsigned int v48 = v100;
  unsigned int v53 = v101;
  uint64_t v22 = v102;
  uint64_t v46 = v103;
  uint64_t v23 = v104;
  uint64_t v24 = static Alignment.center.getter();
  uint64_t v45 = v25;
  unsigned __int8 v61 = 1;
  unsigned __int8 v60 = v17;
  unsigned __int8 v59 = v18;
  *(void *)uint64_t v10 = static HorizontalAlignment.leading.getter();
  *((void *)v10 + 1) = 0;
  v10[16] = 0;
  uint64_t v26 = (uint64_t)v10;
  uint64_t v27 = sub_100004A14(&qword_100020D68);
  sub_100009AA8(v52, v19, v50, (uint64_t)&v10[*(int *)(v27 + 44)]);
  unsigned __int8 v28 = v61;
  int v47 = v61;
  unsigned __int8 v29 = v60;
  int v50 = v60;
  unsigned __int8 v30 = v59;
  LODWORD(v52) = v59;
  uint64_t v31 = (uint64_t)v10;
  uint64_t v32 = v51;
  sub_10000B2FC(v31, v51, &qword_100020D60);
  long long v62 = (unint64_t)v56;
  LOWORD(v63) = v28;
  *((void *)&v63 + 1) = v58;
  LOBYTE(v64) = v29;
  *((void *)&v64 + 1) = v55;
  LOBYTE(v65) = v30;
  *((void *)&v65 + 1) = v54;
  *(void *)&long long v66 = v57;
  *((double *)&v66 + 1) = v16;
  *(double *)&long long v67 = v20 * 0.5;
  *((double *)&v67 + 1) = v20;
  *(void *)&long long v68 = __PAIR64__(v53, v21);
  *((void *)&v68 + 1) = v22;
  uint64_t v33 = v45;
  uint64_t v34 = v46;
  *(void *)&long long v69 = v46;
  *((void *)&v69 + 1) = v23;
  uint64_t v35 = v49;
  *(void *)&long long v70 = v49;
  WORD4(v70) = 256;
  *(void *)&long long v71 = v24;
  *((void *)&v71 + 1) = v45;
  long long v36 = v64;
  long long v37 = v65;
  long long v38 = v67;
  a4[4] = v66;
  a4[5] = v38;
  a4[2] = v36;
  a4[3] = v37;
  long long v39 = v63;
  *a4 = v62;
  a4[1] = v39;
  long long v40 = v68;
  long long v41 = v69;
  long long v42 = v71;
  a4[8] = v70;
  a4[9] = v42;
  a4[6] = v40;
  a4[7] = v41;
  uint64_t v43 = sub_100004A14(&qword_100020D70);
  sub_10000B2FC(v32, (uint64_t)a4 + *(int *)(v43 + 48), &qword_100020D60);
  sub_10000AF1C((uint64_t)&v62);
  sub_10000B360(v26, &qword_100020D60);
  sub_10000B360(v32, &qword_100020D60);
  v72[0] = v56;
  v72[1] = 0;
  char v73 = v47;
  char v74 = 0;
  uint64_t v75 = v58;
  char v76 = v50;
  uint64_t v77 = v55;
  char v78 = v52;
  uint64_t v79 = v54;
  uint64_t v80 = v57;
  double v81 = v16;
  double v82 = v20 * 0.5;
  double v83 = v20;
  unsigned int v84 = v48;
  unsigned int v85 = v53;
  uint64_t v86 = v22;
  uint64_t v87 = v34;
  uint64_t v88 = v23;
  uint64_t v89 = v35;
  __int16 v90 = 256;
  uint64_t v91 = v24;
  uint64_t v92 = v33;
  return sub_10000AF68((uint64_t)v72);
}

uint64_t sub_100009AA8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v119 = a3;
  uint64_t v118 = a1;
  uint64_t v123 = a4;
  uint64_t v5 = sub_100004A14(&qword_100020D78);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v122 = (uint64_t)&v107 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v128 = (uint64_t *)((char *)&v107 - v8);
  uint64_t v130 = sub_100004A14(&qword_100020D80) - 8;
  __chkstk_darwin(v130);
  uint64_t v10 = (uint64_t *)((char *)&v107 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v125 = type metadata accessor for Text.TruncationMode();
  uint64_t v134 = *(void *)(v125 - 8);
  __chkstk_darwin(v125);
  uint64_t v124 = (char *)&v107 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = sub_100004A14(&qword_100020D88) - 8;
  __chkstk_darwin(v129);
  uint64_t v13 = (char *)&v107 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_100004A14(&qword_100020D90) - 8;
  __chkstk_darwin(v132);
  uint64_t v126 = (uint64_t)&v107 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_100004A14(&qword_100020D98) - 8;
  uint64_t v15 = __chkstk_darwin(v133);
  uint64_t v121 = (uint64_t)&v107 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v120 = (uint64_t)&v107 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v127 = (uint64_t)&v107 - v20;
  __chkstk_darwin(v19);
  uint64_t v131 = (uint64_t)&v107 - v21;
  id v22 = a2;
  uint64_t v109 = v22;
  uint64_t v23 = sub_100010898();
  uint64_t v25 = v24;

  uint64_t v135 = v23;
  uint64_t v136 = v25;
  unint64_t v111 = sub_1000091C0();
  uint64_t v26 = Text.init<A>(_:)();
  uint64_t v28 = v27;
  char v30 = v29 & 1;
  static Font.subheadline.getter();
  uint64_t v31 = Text.font(_:)();
  uint64_t v33 = v32;
  char v35 = v34;
  uint64_t v107 = v36;
  swift_release();
  sub_10000AFB4(v26, v28, v30);
  swift_bridgeObjectRelease();
  unsigned int v117 = enum case for Text.TruncationMode.middle(_:);
  uint64_t v37 = v134;
  long long v38 = *(void (**)(void))(v134 + 104);
  uint64_t v115 = v134 + 104;
  uint64_t v116 = (void (*)(char *, void, uint64_t))v38;
  long long v40 = v124;
  uint64_t v39 = v125;
  v38(v124);
  uint64_t KeyPath = swift_getKeyPath();
  long long v42 = (char *)v10 + *(int *)(v130 + 36);
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
  uint64_t v113 = v37 + 16;
  unint64_t v114 = v43;
  v43(v42, v40, v39);
  *uint64_t v10 = KeyPath;
  uint64_t v44 = (uint64_t)&v13[*(int *)(v129 + 44)];
  uint64_t v110 = v10;
  sub_10000B2FC((uint64_t)v10, v44, &qword_100020D80);
  *(void *)uint64_t v13 = v31;
  *((void *)v13 + 1) = v33;
  v13[16] = v35 & 1;
  *((void *)v13 + 3) = v107;
  uint64_t v108 = v13;
  sub_10000B0D8(v31, v33, v35 & 1);
  swift_bridgeObjectRetain();
  sub_10000B360((uint64_t)v10, &qword_100020D80);
  uint64_t v45 = *(void (**)(char *, uint64_t))(v37 + 8);
  uint64_t v134 = v37 + 8;
  uint64_t v112 = v45;
  v45(v40, v39);
  sub_10000AFB4(v31, v33, v35 & 1);
  swift_bridgeObjectRelease();
  uint64_t v46 = swift_getKeyPath();
  uint64_t v47 = v126;
  sub_10000B2FC((uint64_t)v13, v126, &qword_100020D88);
  uint64_t v48 = v47 + *(int *)(v132 + 44);
  *(void *)uint64_t v48 = v46;
  *(void *)(v48 + 8) = 0;
  *(unsigned char *)(v48 + 16) = 0;
  sub_10000B360((uint64_t)v13, &qword_100020D88);
  LOBYTE(v46) = static Edge.Set.trailing.getter();
  EdgeInsets.init(_all:)();
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  uint64_t v57 = v127;
  sub_10000B2FC(v47, v127, &qword_100020D90);
  uint64_t v58 = v57 + *(int *)(v133 + 44);
  *(unsigned char *)uint64_t v58 = v46;
  *(void *)(v58 + 8) = v50;
  *(void *)(v58 + 16) = v52;
  *(void *)(v58 + 24) = v54;
  *(void *)(v58 + 32) = v56;
  *(unsigned char *)(v58 + 40) = 0;
  sub_10000B360(v47, &qword_100020D90);
  sub_10000B14C(v57, v131);
  uint64_t v59 = static VerticalAlignment.center.getter();
  unsigned __int8 v60 = v128;
  *uint64_t v128 = v59;
  v60[1] = 0;
  *((unsigned char *)v60 + 16) = 1;
  uint64_t v61 = sub_100004A14(&qword_100020DA0);
  long long v62 = v109;
  LOBYTE(v46) = v119;
  sub_10000A43C(v118, v109, v119, (uint64_t)v60 + *(int *)(v61 + 44));
  id v63 = v62;
  uint64_t v64 = sub_100010A9C(v46);
  uint64_t v66 = v65;

  uint64_t v135 = v64;
  uint64_t v136 = v66;
  uint64_t v67 = Text.init<A>(_:)();
  uint64_t v69 = v68;
  LOBYTE(v47) = v70 & 1;
  static Font.subheadline.getter();
  uint64_t v71 = Text.font(_:)();
  uint64_t v73 = v72;
  LOBYTE(v33) = v74;
  swift_release();
  LOBYTE(v31) = v33 & 1;
  sub_10000AFB4(v67, v69, v47);
  swift_bridgeObjectRelease();
  uint64_t v75 = Text.monospacedDigit()();
  uint64_t v77 = v76;
  uint64_t v79 = v78;
  LOBYTE(v10) = v80 & 1;
  sub_10000AFB4(v71, v73, v31);
  swift_bridgeObjectRelease();
  double v82 = v124;
  uint64_t v81 = v125;
  v116(v124, v117, v125);
  uint64_t v83 = swift_getKeyPath();
  unsigned int v84 = v110;
  v114((char *)v110 + *(int *)(v130 + 36), v82, v81);
  uint64_t *v84 = v83;
  uint64_t v85 = (uint64_t)v108;
  sub_10000B2FC((uint64_t)v84, (uint64_t)&v108[*(int *)(v129 + 44)], &qword_100020D80);
  *(void *)uint64_t v85 = v75;
  *(void *)(v85 + 8) = v77;
  *(unsigned char *)(v85 + 16) = (_BYTE)v10;
  *(void *)(v85 + 24) = v79;
  sub_10000B0D8(v75, v77, (char)v10);
  swift_bridgeObjectRetain();
  sub_10000B360((uint64_t)v84, &qword_100020D80);
  v112(v82, v81);
  sub_10000AFB4(v75, v77, (char)v10);
  swift_bridgeObjectRelease();
  uint64_t v86 = swift_getKeyPath();
  uint64_t v87 = v126;
  sub_10000B2FC(v85, v126, &qword_100020D88);
  uint64_t v88 = v87 + *(int *)(v132 + 44);
  *(void *)uint64_t v88 = v86;
  *(void *)(v88 + 8) = 0;
  *(unsigned char *)(v88 + 16) = 0;
  sub_10000B360(v85, &qword_100020D88);
  LOBYTE(v86) = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v90 = v89;
  uint64_t v92 = v91;
  uint64_t v94 = v93;
  uint64_t v96 = v95;
  uint64_t v97 = v120;
  sub_10000B2FC(v87, v120, &qword_100020D90);
  uint64_t v98 = v97 + *(int *)(v133 + 44);
  *(unsigned char *)uint64_t v98 = v86;
  *(void *)(v98 + 8) = v90;
  *(void *)(v98 + 16) = v92;
  *(void *)(v98 + 24) = v94;
  *(void *)(v98 + 32) = v96;
  *(unsigned char *)(v98 + 40) = 0;
  sub_10000B360(v87, &qword_100020D90);
  uint64_t v99 = v127;
  sub_10000B14C(v97, v127);
  uint64_t v100 = v131;
  sub_10000B2FC(v131, v97, &qword_100020D98);
  unsigned int v101 = v128;
  uint64_t v102 = v122;
  sub_10000B2FC((uint64_t)v128, v122, &qword_100020D78);
  uint64_t v103 = v121;
  sub_10000B2FC(v99, v121, &qword_100020D98);
  uint64_t v104 = v123;
  sub_10000B2FC(v97, v123, &qword_100020D98);
  uint64_t v105 = sub_100004A14(&qword_100020DA8);
  sub_10000B2FC(v102, v104 + *(int *)(v105 + 48), &qword_100020D78);
  sub_10000B2FC(v103, v104 + *(int *)(v105 + 64), &qword_100020D98);
  sub_10000B360(v99, &qword_100020D98);
  sub_10000B360((uint64_t)v101, &qword_100020D78);
  sub_10000B360(v100, &qword_100020D98);
  sub_10000B360(v103, &qword_100020D98);
  sub_10000B360(v102, &qword_100020D78);
  return sub_10000B360(v97, &qword_100020D98);
}

uint64_t sub_10000A43C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v95 = a3;
  uint64_t v94 = a1;
  uint64_t v100 = a4;
  uint64_t v99 = sub_100004A14(&qword_100020DB0);
  uint64_t v96 = *(void *)(v99 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v102 = (char *)&v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_100004A14(&qword_100020DB8);
  uint64_t v98 = *(void *)(v104 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v103 = (char *)&v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v97 = (char *)&v83 - v8;
  uint64_t v92 = sub_100004A14(&qword_100020DC0);
  __chkstk_darwin(v92);
  uint64_t v91 = (char *)&v83 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for LinearProgressViewStyle();
  uint64_t v90 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100004A14(&qword_100020DC8);
  uint64_t v88 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v87 = (char *)&v83 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v83 - v16;
  uint64_t v93 = sub_100004A14(&qword_100020DD0);
  uint64_t v18 = *(void *)(v93 - 8);
  uint64_t v19 = __chkstk_darwin(v93);
  uint64_t v86 = (char *)&v83 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v83 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v26 = (char *)&v83 - v25;
  __chkstk_darwin(v24);
  uint64_t v85 = (char *)&v83 - v27;
  uint64_t v28 = sub_100004A14(&qword_100020DD8);
  uint64_t v29 = __chkstk_darwin(v28 - 8);
  uint64_t v101 = (uint64_t)&v83 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  uint64_t v89 = (char *)&v83 - v31;
  id v32 = a2;
  double v33 = sub_1000109D8();

  if (v33 == 0.0)
  {
    id v34 = v32;
    if ([v34 state] == (id)5)
    {

LABEL_6:
      ProgressView<>.init<>()();
      LinearProgressViewStyle.init()();
      uint64_t v43 = sub_100007560(&qword_100020DE8, &qword_100020DC8);
      unint64_t v44 = sub_10000B208();
      uint64_t v45 = v17;
      uint64_t v46 = v10;
      uint64_t v47 = v91;
      unint64_t v48 = v44;
      View.progressViewStyle<A>(_:)();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v12, v46);
      (*(void (**)(char *, uint64_t))(v88 + 8))(v45, v13);
      uint64_t v49 = v85;
      uint64_t v50 = v93;
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v85, v26, v93);
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v47, v49, v50);
      swift_storeEnumTagMultiPayload();
      double v105 = *(double *)&v13;
      uint64_t v106 = v46;
      uint64_t v51 = v50;
      uint64_t v107 = v43;
      unint64_t v108 = v48;
      swift_getOpaqueTypeConformance2();
      uint64_t v52 = (uint64_t)v89;
      _ConditionalContent<>.init(storage:)();
      uint64_t v23 = v49;
      goto LABEL_11;
    }
    id v35 = [v34 state];
    unsigned int v84 = v23;
    uint64_t v36 = v13;
    uint64_t v37 = v18;
    long long v38 = v12;
    uint64_t v39 = v10;
    long long v40 = v17;
    id v41 = v35;

    BOOL v42 = v41 == (id)10;
    uint64_t v17 = v40;
    uint64_t v10 = v39;
    uint64_t v12 = v38;
    uint64_t v18 = v37;
    uint64_t v13 = v36;
    uint64_t v23 = v84;
    if (v42) {
      goto LABEL_6;
    }
  }
  double v53 = 0.0;
  if ([v32 state] == (id)5)
  {
    id v54 = v32;
    double v55 = sub_1000109D8();

    if (v55 != 0.0)
    {
      id v56 = v54;
      double v57 = sub_1000109D8();

      double v53 = v57 * 100.0;
    }
  }
  double v105 = v53;
  LOBYTE(v106) = 0;
  uint64_t v109 = 0x4059000000000000;
  sub_10000B1B4();
  uint64_t v58 = v87;
  ProgressView.init<A>(value:total:)();
  LinearProgressViewStyle.init()();
  uint64_t v59 = sub_100007560(&qword_100020DE8, &qword_100020DC8);
  unsigned __int8 v60 = v12;
  unint64_t v61 = sub_10000B208();
  long long v62 = v86;
  View.progressViewStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v90 + 8))(v60, v10);
  (*(void (**)(char *, uint64_t))(v88 + 8))(v58, v13);
  uint64_t v63 = v93;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v23, v62, v93);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v91, v23, v63);
  swift_storeEnumTagMultiPayload();
  double v105 = *(double *)&v13;
  uint64_t v106 = v10;
  uint64_t v51 = v63;
  uint64_t v107 = v59;
  unint64_t v108 = v61;
  swift_getOpaqueTypeConformance2();
  uint64_t v52 = (uint64_t)v89;
  _ConditionalContent<>.init(storage:)();
LABEL_11:
  uint64_t v64 = v96;
  uint64_t v65 = v97;
  char v66 = v95;
  uint64_t v67 = v94;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v23, v51);
  uint64_t v68 = swift_allocObject();
  *(void *)(v68 + 16) = v67;
  *(void *)(v68 + 24) = v32;
  *(unsigned char *)(v68 + 32) = v66 & 1;
  id v69 = v32;
  char v70 = v102;
  Button.init(action:label:)();
  uint64_t v71 = static Color.secondary.getter();
  uint64_t v72 = static Color.white.getter();
  double v105 = *(double *)&v71;
  uint64_t v106 = v72;
  sub_100007560(&qword_100020DF8, &qword_100020DB0);
  sub_10000B2A8();
  uint64_t v73 = v103;
  uint64_t v74 = v99;
  View.buttonStyle<A>(_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v70, v74);
  uint64_t v75 = v98;
  uint64_t v76 = v104;
  (*(void (**)(char *, char *, uint64_t))(v98 + 32))(v65, v73, v104);
  uint64_t v77 = v101;
  sub_10000B2FC(v52, v101, &qword_100020DD8);
  uint64_t v78 = *(void (**)(char *, char *, uint64_t))(v75 + 16);
  v78(v73, v65, v76);
  uint64_t v79 = v100;
  sub_10000B2FC(v77, v100, &qword_100020DD8);
  uint64_t v80 = sub_100004A14(&qword_100020E08);
  v78((char *)(v79 + *(int *)(v80 + 48)), v73, v76);
  uint64_t v81 = *(void (**)(char *, uint64_t))(v75 + 8);
  v81(v65, v76);
  sub_10000B360(v52, &qword_100020DD8);
  v81(v73, v76);
  return sub_10000B360(v77, &qword_100020DD8);
}

uint64_t sub_10000AE78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Image.init(systemName:)();
  *a1 = result;
  return result;
}

uint64_t sub_10000AEB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void **)(v1 + 8);
  int v5 = *(unsigned __int8 *)(v1 + 16);
  *(void *)a1 = static VerticalAlignment.top.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v6 = sub_100004A14(&qword_100020D58);
  return sub_100009648(v3, v4, v5, (_OWORD *)(a1 + *(int *)(v6 + 44)));
}

uint64_t sub_10000AF1C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000AF68(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000AFB4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000AFC4()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_10000AFE8()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_10000B00C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Text.TruncationMode();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.truncationMode.setter();
}

uint64_t sub_10000B0D8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000B0E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000B11C()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_10000B14C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A14(&qword_100020D98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000B1B4()
{
  unint64_t result = qword_100020DE0;
  if (!qword_100020DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020DE0);
  }
  return result;
}

unint64_t sub_10000B208()
{
  unint64_t result = qword_100020DF0;
  if (!qword_100020DF0)
  {
    type metadata accessor for LinearProgressViewStyle();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020DF0);
  }
  return result;
}

uint64_t sub_10000B260()
{
  return _swift_deallocObject(v0, 33, 7);
}

id sub_10000B298()
{
  return [*(id *)(v0 + 24) cancel];
}

unint64_t sub_10000B2A8()
{
  unint64_t result = qword_100020E00;
  if (!qword_100020E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020E00);
  }
  return result;
}

uint64_t sub_10000B2FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004A14(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B360(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004A14(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000B3BC()
{
  return sub_100007560(&qword_100020E10, &qword_100020E18);
}

_UNKNOWN **static DeviceCategory.allCases.getter()
{
  return &off_10001D168;
}

void sub_10000B40C()
{
  Hasher._combine(_:)(*v0);
}

void sub_10000B43C(void *a1@<X8>)
{
  *a1 = &off_10001D1A8;
}

_UNKNOWN **static DisplayCategory.allCases.getter()
{
  return &off_10001D1E8;
}

void *sub_10000B458()
{
  return &protocol witness table for Int;
}

uint64_t sub_10000B464()
{
  return sub_10000B51C(&qword_100020E20, type metadata accessor for DeviceCategory);
}

uint64_t sub_10000B4AC()
{
  return sub_10000B618(&qword_100020E28, &qword_100020E30);
}

uint64_t sub_10000B4D4()
{
  return sub_10000B51C(&qword_100020E38, type metadata accessor for DisplayCategory);
}

uint64_t sub_10000B51C(unint64_t *a1, void (*a2)(uint64_t))
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

Swift::Int sub_10000B564()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_10000B5AC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10000B5F0()
{
  return sub_10000B618(&qword_100020E40, &qword_100020E48);
}

uint64_t sub_10000B618(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000047A0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10000B668(void *a1@<X8>)
{
  *a1 = &off_10001D1E8;
}

uint64_t sub_10000B67C()
{
  uint64_t result = static Font.headline.getter();
  qword_100021148 = result;
  return result;
}

void sub_10000B69C()
{
  id v0 = [self mainBundle];
  v4._countAndFlagsBits = 0xD00000000000002ELL;
  v4._object = (void *)0x8000000100017750;
  v1._object = (void *)0x8000000100017800;
  v1._countAndFlagsBits = 0xD000000000000010;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021150 = (__int128)v3;
}

void sub_10000B754()
{
  id v0 = [self mainBundle];
  v4._countAndFlagsBits = 0xD000000000000035;
  v4._object = (void *)0x80000001000177A0;
  v1._object = (void *)0x8000000100017780;
  v1._countAndFlagsBits = 0xD000000000000015;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021160 = (__int128)v3;
}

void sub_10000B80C()
{
  id v0 = [self mainBundle];
  v4._object = (void *)0x80000001000176C0;
  v1._countAndFlagsBits = 0x676E6974696157;
  v1._object = (void *)0xE700000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000018;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021170 = (__int128)v3;
}

void sub_10000B8BC()
{
  id v0 = [self mainBundle];
  v4._object = (void *)0x8000000100017730;
  v1._countAndFlagsBits = 0x646573756150;
  v1._object = (void *)0xE600000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000015;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021180 = (__int128)v3;
}

void sub_10000B968()
{
  id v0 = [self mainBundle];
  v4._object = (void *)0x8000000100017750;
  v1._countAndFlagsBits = 0x676E69746E697250;
  v1._object = (void *)0xE800000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD00000000000002ELL;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021190 = (__int128)v3;
}

void sub_10000BA18()
{
  id v0 = [self mainBundle];
  v4._object = (void *)0x80000001000177E0;
  v1._countAndFlagsBits = 0x646570706F7453;
  v1._object = (void *)0xE700000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000018;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_1000211A0 = (__int128)v3;
}

void sub_10000BAC8()
{
  id v0 = [self mainBundle];
  v4._object = (void *)0x8000000100017820;
  v1._countAndFlagsBits = 0x64656C65636E6143;
  v1._object = (void *)0xE800000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000019;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_1000211B0 = (__int128)v3;
}

void sub_10000BB78()
{
  id v0 = [self mainBundle];
  v4._object = (void *)0x8000000100017840;
  v1._countAndFlagsBits = 0x64656C696146;
  v1._object = (void *)0xE600000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000017;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_1000211C0 = (__int128)v3;
}

void sub_10000BC24()
{
  id v0 = [self mainBundle];
  v4._object = (void *)0x8000000100017860;
  v1._countAndFlagsBits = 0x6574656C706D6F43;
  v1._object = (void *)0xE900000000000064;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000019;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_1000211D0 = (__int128)v3;
}

void sub_10000BCD8()
{
  id v0 = [self mainBundle];
  v4._object = (void *)0x8000000100017920;
  v1._countAndFlagsBits = 0x6E776F6E6B6E55;
  v1._object = (void *)0xE700000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000018;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_1000211E0 = (__int128)v3;
}

void sub_10000BD88()
{
  id v0 = [self mainBundle];
  v4._object = (void *)0x8000000100017880;
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000027;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_1000211F0 = (__int128)v3;
}

void sub_10000BE2C()
{
  id v0 = [self mainBundle];
  v4._object = (void *)0xE400000000000000;
  v1._countAndFlagsBits = 9666786;
  v1._object = (void *)0xA300000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 1752392036;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021200 = (__int128)v3;
}

void sub_10000BEC8()
{
  id v0 = [self mainBundle];
  v4._object = (void *)0xE000000000000000;
  v1._countAndFlagsBits = 0x676E696D6F636E49;
  v1._object = (void *)0xE800000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021210 = (__int128)v3;
}

void sub_10000BF68()
{
  id v0 = [self mainBundle];
  v4._countAndFlagsBits = 0xD000000000000026;
  v4._object = (void *)0x8000000100017700;
  v1._object = (void *)0x80000001000176E0;
  v1._countAndFlagsBits = 0xD000000000000017;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021220 = (__int128)v3;
}

void sub_10000C020()
{
  id v0 = [self mainBundle];
  v4._object = (void *)0x80000001000178F0;
  v1._object = (void *)0x80000001000178D0;
  v1._countAndFlagsBits = 0x1000000000000016;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD00000000000002ALL;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021230 = (__int128)v3;
}

void sub_10000C0D4()
{
  id v0 = [self mainBundle];
  v4._object = (void *)0x80000001000178B0;
  v1._countAndFlagsBits = 541074806;
  v1._object = (void *)0xE400000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000019;
  Swift::String v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021240 = (__int128)v3;
}

__n128 sub_10000C17C@<Q0>(uint64_t a1@<X8>)
{
  sub_100004A14(&qword_100020E88);
  State.projectedValue.getter();
  if (qword_100020A18 != -1) {
    swift_once();
  }
  type metadata accessor for PrintMonitor();
  sub_10000C794();
  swift_retain();
  uint64_t v2 = ObservedObject.init(wrappedValue:)();
  *(void *)a1 = v5;
  __n128 result = v6;
  *(__n128 *)(a1 + 8) = v6;
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = v4;
  return result;
}

uint64_t sub_10000C24C()
{
  uint64_t v1 = sub_100004A14(&qword_100020E60);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  uint64_t v6 = v0[1];
  uint64_t v8 = v0[2];
  uint64_t v7 = v0[3];
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v5;
  v9[3] = v6;
  v9[4] = v8;
  v9[5] = v7;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100004A14(&qword_100020E68);
  sub_100007560(&qword_100020E70, &qword_100020E68);
  WindowGroup.init(id:title:lazyContent:)();
  sub_100007560(&qword_100020E78, &qword_100020E60);
  static SceneBuilder.buildBlock<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_10000C418@<X0>(void *a1@<X8>)
{
  sub_100004A14(&qword_100020E58);
  State.init(wrappedValue:)();
  if (qword_100020A18 != -1) {
    swift_once();
  }
  type metadata accessor for PrintMonitor();
  sub_10000C794();
  swift_retain();
  uint64_t result = ObservedObject.init(wrappedValue:)();
  *a1 = v4;
  a1[1] = v5;
  a1[2] = result;
  a1[3] = v3;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000C51C()
{
  unint64_t result = qword_100020E50;
  if (!qword_100020E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020E50);
  }
  return result;
}

uint64_t destroy for PrintCenterApp()
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

void *initializeWithCopy for PrintCenterApp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PrintCenterApp(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for PrintCenterApp(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for PrintCenterApp(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintCenterApp(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintCenterApp(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintCenterApp()
{
  return &type metadata for PrintCenterApp;
}

uint64_t sub_10000C778()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000C794()
{
  unint64_t result = qword_100020C88;
  if (!qword_100020C88)
  {
    type metadata accessor for PrintMonitor();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020C88);
  }
  return result;
}

uint64_t sub_10000C7EC()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000C834()
{
  return NavigationStack.init<>(root:)();
}

double sub_10000C8A4@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_10000C17C(a1).n128_u64[0];
  return result;
}

unint64_t sub_10000C8B0()
{
  unint64_t result = qword_100020E80;
  if (!qword_100020E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020E80);
  }
  return result;
}

uint64_t sub_10000C904()
{
  return sub_100007560(&qword_100020E78, &qword_100020E60);
}

uint64_t destroy for PrinterMessageView()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PrinterMessageView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PrinterMessageView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for PrinterMessageView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrinterMessageView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrinterMessageView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrinterMessageView()
{
  return &type metadata for PrinterMessageView;
}

uint64_t sub_10000CB0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000CB28@<X0>(char a1@<W0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v64 = a4;
  uint64_t v58 = sub_100004A14(&qword_100020D80);
  __chkstk_darwin(v58);
  long long v62 = (uint64_t *)((char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v61 = type metadata accessor for Text.TruncationMode();
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v59 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100004A14(&qword_100020D88);
  uint64_t v9 = __chkstk_darwin(v57);
  uint64_t v63 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v69 = (uint64_t)&v53 - v11;
  uint64_t v12 = sub_100004A14(&qword_100020E98);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  uint64_t v65 = 0;
  uint64_t v70 = 0;
  uint64_t v73 = 0;
  uint64_t v20 = 0;
  switch(a1)
  {
    case 3:
    case 4:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
      uint64_t v18 = static Color.red.getter();
      goto LABEL_3;
    case 5:
    case 6:
    case 7:
    case 23:
      uint64_t v18 = static Color.yellow.getter();
LABEL_3:
      swift_bridgeObjectRetain();
      Image.init(systemName:)();
      static SymbolRenderingMode.palette.getter();
      uint64_t v21 = type metadata accessor for SymbolRenderingMode();
      int v15 = 1;
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v14, 0, 1, v21);
      uint64_t v16 = Image.symbolRenderingMode(_:)();
      swift_release();
      sub_10000B360((uint64_t)v14, &qword_100020E98);
      uint64_t v17 = static Color.white.getter();
      swift_retain();
      static Alignment.center.getter();
      _FrameLayout.init(width:height:alignment:)();
      uint64_t v19 = v76;
      uint64_t v72 = v77;
      uint64_t v65 = v79;
      uint64_t v70 = v80;
      uint64_t v71 = v78;
      uint64_t v73 = v81;
      unsigned __int8 v22 = static Edge.Set.leading.getter();
      swift_retain();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v20 = v22;
      break;
    default:
      break;
  }
  uint64_t v66 = v18;
  uint64_t v67 = v17;
  int v68 = v15;
  uint64_t v55 = v19;
  uint64_t v56 = v20;
  uint64_t v74 = a2;
  uint64_t v75 = a3;
  sub_1000091C0();
  swift_bridgeObjectRetain();
  uint64_t v23 = Text.init<A>(_:)();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  static Font.headline.getter();
  uint64_t v28 = Text.font(_:)();
  uint64_t v30 = v29;
  char v32 = v31;
  swift_release();
  sub_10000AFB4(v23, v25, v27);
  swift_bridgeObjectRelease();
  static Font.Weight.medium.getter();
  uint64_t v33 = Text.fontWeight(_:)();
  uint64_t v35 = v34;
  uint64_t v54 = v36;
  LOBYTE(v23) = v37 & 1;
  sub_10000AFB4(v28, v30, v32 & 1);
  swift_bridgeObjectRelease();
  uint64_t v38 = v60;
  uint64_t v39 = v59;
  uint64_t v40 = v61;
  (*(void (**)(char *, void, uint64_t))(v60 + 104))(v59, enum case for Text.TruncationMode.middle(_:), v61);
  uint64_t KeyPath = swift_getKeyPath();
  BOOL v42 = v62;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))((char *)v62 + *(int *)(v58 + 28), v39, v40);
  *BOOL v42 = KeyPath;
  uint64_t v43 = (uint64_t)v63;
  sub_10000B2FC((uint64_t)v42, (uint64_t)&v63[*(int *)(v57 + 36)], &qword_100020D80);
  *(void *)uint64_t v43 = v33;
  *(void *)(v43 + 8) = v35;
  *(unsigned char *)(v43 + 16) = v23;
  *(void *)(v43 + 24) = v54;
  sub_10000B0D8(v33, v35, v23);
  swift_bridgeObjectRetain();
  sub_10000B360((uint64_t)v42, &qword_100020D80);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
  sub_10000AFB4(v33, v35, v23);
  swift_bridgeObjectRelease();
  uint64_t v44 = v69;
  sub_10000D38C(v43, v69);
  sub_10000B2FC(v44, v43, &qword_100020D88);
  uint64_t v45 = v64;
  uint64_t v46 = v65;
  *uint64_t v64 = v16;
  uint64_t v47 = v66;
  v45[1] = v67;
  v45[2] = v47;
  uint64_t v48 = v72;
  uint64_t v49 = v73;
  v45[3] = v55;
  v45[4] = v48;
  v45[5] = v71;
  v45[6] = v46;
  v45[7] = v70;
  v45[8] = v49;
  uint64_t v73 = v49;
  v45[9] = v56;
  *((_OWORD *)v45 + 5) = 0u;
  *((_OWORD *)v45 + 6) = 0u;
  *((unsigned char *)v45 + 112) = v68;
  uint64_t v50 = sub_100004A14(&qword_100020EA0);
  sub_10000B2FC(v43, (uint64_t)v45 + *(int *)(v50 + 48), &qword_100020D88);
  uint64_t v51 = (char *)v45 + *(int *)(v50 + 64);
  *(void *)uint64_t v51 = 0;
  v51[8] = 1;
  sub_10000D3F4(v16);
  sub_10000B360(v69, &qword_100020D88);
  sub_10000B360(v43, &qword_100020D88);
  return sub_10000D440(v16);
}

uint64_t sub_10000D300@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  char v7 = sub_10001462C(v3, v4);
  *(void *)a1 = static VerticalAlignment.firstTextBaseline.getter();
  *(void *)(a1 + 8) = 0x4000000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v8 = sub_100004A14(&qword_100020E90);
  return sub_10000CB28(v7, v6, v5, (uint64_t *)(a1 + *(int *)(v8 + 44)));
}

uint64_t sub_10000D38C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A14(&qword_100020D88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D3F4(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000D440(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_10000D490()
{
  unint64_t result = qword_100020EA8;
  if (!qword_100020EA8)
  {
    sub_1000047A0(&qword_100020EB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020EA8);
  }
  return result;
}

uint64_t destroy for JobsListView()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

void *initializeWithCopy for JobsListView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for JobsListView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for JobsListView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for JobsListView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for JobsListView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JobsListView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JobsListView()
{
  return &type metadata for JobsListView;
}

uint64_t sub_10000D744()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D760@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v38 = a1;
  uint64_t v37 = type metadata accessor for NavigationBarItem.TitleDisplayMode();
  uint64_t v3 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004A14(&qword_100020EB8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100004A14(&qword_100020EC0);
  __chkstk_darwin(v34);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004A14(&qword_100020EC8);
  uint64_t v35 = *(void *)(v11 - 8);
  uint64_t v36 = v11;
  __chkstk_darwin(v11);
  uint64_t v33 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = sub_100006A08();
  Swift::String v39 = *v1;
  uint64_t countAndFlagsBits = v1[1]._countAndFlagsBits;
  sub_100004A14(&qword_100020ED0);
  Binding.wrappedValue.getter();
  uint64_t v14 = v41;
  swift_bridgeObjectRetain();
  sub_10000F76C(v14, v13);
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  Swift::String v39 = *(Swift::String *)v2;
  uint64_t countAndFlagsBits = *(void *)(v2 + 16);
  uint64_t v41 = v16;
  Binding.wrappedValue.setter();
  uint64_t v17 = sub_10000FAD8(v13);
  uint64_t v19 = v18;
  uint64_t v20 = sub_10000FBEC(v17, v18);
  unint64_t v22 = v21;
  *(void *)uint64_t v8 = static HorizontalAlignment.center.getter();
  *((void *)v8 + 1) = 0;
  unsigned char v8[16] = 0;
  uint64_t v23 = sub_100004A14(&qword_100020ED8);
  sub_10000DBC4(v13, v20, v22, v17, v19, v2, &v8[*(int *)(v23 + 44)]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v17) = static Edge.Set.leading.getter();
  char v24 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v17) {
    char v24 = Edge.Set.init(rawValue:)();
  }
  sub_10000FC8C((uint64_t)v8, (uint64_t)v10);
  v10[*(int *)(v34 + 36)] = v24;
  sub_10000B360((uint64_t)v8, &qword_100020EB8);
  id v25 = [self mainBundle];
  v42._object = (void *)0xEB00000000726564;
  v26._uint64_t countAndFlagsBits = 0x724F20746E697250;
  v26._object = (void *)0xEB00000000726564;
  v27._uint64_t countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  v42._uint64_t countAndFlagsBits = 0x724F20746E697250;
  Swift::String v28 = NSLocalizedString(_:tableName:bundle:value:comment:)(v26, (Swift::String_optional)0, (NSBundle)v25, v27, v42);

  Swift::String v39 = v28;
  uint64_t v29 = v37;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v37);
  sub_10000FCF4();
  sub_1000091C0();
  uint64_t v30 = v33;
  View.navigationBarTitle<A>(_:displayMode:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v29);
  swift_bridgeObjectRelease();
  sub_10000B360((uint64_t)v10, &qword_100020EC0);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v35 + 32))(v38, v30, v36);
}

uint64_t sub_10000DBC4@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned char *a7@<X8>)
{
  uint64_t v68 = a6;
  uint64_t v73 = (void *)type metadata accessor for PlainListStyle();
  uint64_t v72 = *(v73 - 1);
  __chkstk_darwin(v73);
  uint64_t v14 = &v63[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v71 = sub_100004A14(&qword_100020EF0);
  uint64_t v70 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v69 = &v63[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = sub_100004A14(&qword_100020EF8);
  uint64_t v81 = *(void *)(v16 - 8);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v88 = &v63[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v17);
  unsigned __int8 v77 = &v63[-v19];
  uint64_t v80 = type metadata accessor for Divider();
  uint64_t v79 = *(void *)(v80 - 8);
  uint64_t v20 = __chkstk_darwin(v80);
  uint64_t v78 = &v63[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v20);
  uint64_t v76 = &v63[-v22];
  uint64_t v23 = Divider.init()();
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v23 = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v67 = a7;
  if (v24)
  {
    uint64_t v25 = HIBYTE(a3) & 0xF;
    uint64_t v26 = v16;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v25 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (!v25)
    {
      uint64_t v87 = 0;
      uint64_t v86 = 0;
      uint64_t v85 = 0;
      uint64_t v84 = 0;
      uint64_t v83 = 0;
      uint64_t v75 = 0;
      uint64_t v82 = 0;
      uint64_t v74 = 0;
      uint64_t v65 = 0;
      int v28 = 255;
      goto LABEL_11;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v27 = static Animation.easeInOut(duration:)();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_retain();
    long long v89 = xmmword_100019700;
    *(void *)&long long v90 = a4;
    *((void *)&v90 + 1) = a5;
    *(void *)&long long v91 = a2;
    *((void *)&v91 + 1) = a3;
    *(void *)&v92[0] = v27;
    *((void *)&v92[0] + 1) = a2;
    *(void *)&v92[1] = a3;
    BYTE8(v92[1]) = 1;
    sub_100004A14(&qword_100020F00);
    sub_10000FD94();
    sub_100007560(&qword_100020F10, &qword_100020F00);
    _ConditionalContent<>.init(storage:)();
    swift_release();
    swift_bridgeObjectRelease_n();
    uint64_t v23 = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v26 = v16;
    *(void *)&long long v89 = 0;
    sub_100004A14(&qword_100020F60);
    State.init(wrappedValue:)();
    long long v89 = v93;
    long long v90 = 0u;
    long long v91 = 0u;
    memset(v92, 0, 25);
    sub_100004A14(&qword_100020F00);
    sub_10000FD94();
    sub_100007560(&qword_100020F10, &qword_100020F00);
    uint64_t v23 = _ConditionalContent<>.init(storage:)();
  }
  uint64_t v86 = *((void *)&v93 + 1);
  uint64_t v87 = v93;
  uint64_t v85 = v94;
  uint64_t v84 = v95;
  uint64_t v83 = v96;
  uint64_t v75 = v97;
  uint64_t v82 = v98;
  uint64_t v74 = v99;
  uint64_t v65 = v100;
  int v28 = v101;
LABEL_11:
  int v64 = v28;
  __chkstk_darwin(v23);
  sub_100004A14(&qword_100020F18);
  sub_10000FDF0();
  uint64_t v29 = v69;
  List<>.init(content:)();
  PlainListStyle.init()();
  sub_100007560(&qword_100020F50, &qword_100020EF0);
  uint64_t v30 = v88;
  uint64_t v31 = v71;
  uint64_t v32 = v73;
  View.listStyle<A>(_:)();
  (*(void (**)(unsigned char *, void *))(v72 + 8))(v14, v32);
  (*(void (**)(unsigned char *, uint64_t))(v70 + 8))(v29, v31);
  uint64_t v33 = v81;
  uint64_t v34 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v81 + 32);
  uint64_t v35 = v77;
  uint64_t v36 = v30;
  uint64_t v66 = v26;
  v34(v77, v30, v26);
  uint64_t v37 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v79 + 16);
  uint64_t v38 = v78;
  uint64_t v39 = v80;
  v37(v78, v76, v80);
  uint64_t v73 = *(void **)(v33 + 16);
  ((void (*)(unsigned char *, unsigned char *, uint64_t))v73)(v36, v35, v26);
  uint64_t v40 = v67;
  v37(v67, v38, v39);
  uint64_t v41 = sub_100004A14(&qword_100020F58);
  Swift::String v42 = &v40[*(int *)(v41 + 48)];
  uint64_t v43 = v87;
  uint64_t v44 = v86;
  *(void *)Swift::String v42 = v87;
  *((void *)v42 + 1) = v44;
  uint64_t v86 = v44;
  uint64_t v45 = v85;
  uint64_t v46 = v84;
  *((void *)v42 + 2) = v85;
  *((void *)v42 + 3) = v46;
  uint64_t v84 = v46;
  uint64_t v47 = v83;
  uint64_t v48 = v75;
  *((void *)v42 + 4) = v83;
  *((void *)v42 + 5) = v48;
  uint64_t v49 = v82;
  uint64_t v50 = v74;
  *((void *)v42 + 6) = v82;
  *((void *)v42 + 7) = v50;
  uint64_t v51 = v65;
  *((void *)v42 + 8) = v65;
  LOBYTE(v31) = v64;
  v42[72] = v64;
  uint64_t v52 = &v40[*(int *)(v41 + 64)];
  uint64_t v53 = v66;
  ((void (*)(unsigned char *, unsigned char *, uint64_t))v73)(v52, v88, v66);
  uint64_t v54 = v47;
  uint64_t v55 = v75;
  uint64_t v56 = v49;
  uint64_t v57 = v74;
  sub_10000FF58(v43, v44, v45, v46, v54, v75, v56, v74, v51, v31);
  uint64_t v58 = *(void (**)(unsigned char *, uint64_t))(v81 + 8);
  uint64_t v59 = v53;
  v58(v77, v53);
  uint64_t v60 = *(void (**)(unsigned char *, uint64_t))(v79 + 8);
  uint64_t v61 = v80;
  v60(v76, v80);
  v58(v88, v59);
  sub_100010010(v87, v86, v85, v84, v83, v55, v82, v57, v51, v31);
  return ((uint64_t (*)(unsigned char *, uint64_t))v60)(v78, v61);
}

uint64_t sub_10000E4F4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100004A14(&qword_100020F30);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[1] = a1;
  swift_getKeyPath();
  uint64_t v10 = *a2;
  uint64_t v20 = a2[2];
  uint64_t v21 = v10;
  long long v19 = *(_OWORD *)(a2 + 3);
  uint64_t v11 = swift_allocObject();
  long long v12 = *((_OWORD *)a2 + 1);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v11 + 32) = v12;
  *(void *)(v11 + 48) = a2[4];
  swift_bridgeObjectRetain();
  sub_100010100((uint64_t)&v21);
  swift_retain();
  sub_10001012C((uint64_t)&v20);
  sub_100010158((uint64_t)&v19);
  sub_100004A14((uint64_t *)&unk_100020B08);
  sub_100007560(&qword_100020F68, (uint64_t *)&unk_100020B08);
  sub_100010264(&qword_100020F70, (void (*)(uint64_t))sub_100010184);
  sub_10000FF04();
  ForEach<>.init(_:id:content:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_1000101FC;
  *(void *)(v14 + 24) = v13;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(a3, v9, v6);
  uint64_t v15 = (uint64_t (**)())(a3 + *(int *)(sub_100004A14(&qword_100020F18) + 36));
  *uint64_t v15 = sub_10001023C;
  v15[1] = (uint64_t (*)())v14;
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  swift_bridgeObjectRetain();
  return v16(v9, v6);
}

uint64_t sub_10000E7A4@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_100010184();
  sub_100010264((unint64_t *)&qword_100020C68, (void (*)(uint64_t))sub_100010184);
  id v4 = v3;
  uint64_t result = ObservedObject.init(wrappedValue:)();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = 1;
  return result;
}

uint64_t sub_10000E830(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  sub_10000EDCC(a1, a2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000E890@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D760(a1);
}

uint64_t sub_10000E8CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004A14(&qword_100020F98);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    int v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_10000EB6C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    int64_t v9 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_100004A14(&qword_100020F98);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  int64_t v9 = (void *)result;
  uint64_t v29 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v29[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v29[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v29[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    Swift::Int v18 = v9[5];
    id v19 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = NSObject._rawHashValue(seed:)(v18);
    uint64_t v20 = -1 << *((unsigned char *)v9 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v12 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v12 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(v9[6] + 8 * v23) = v19;
    ++v9[2];
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v29[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v29[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10000EDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = type metadata accessor for IndexSet.Index();
  uint64_t v4 = *(void *)(v37 - 8);
  uint64_t v5 = __chkstk_darwin(v37);
  uint64_t v41 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v44 = (char *)v29 - v7;
  uint64_t v8 = type metadata accessor for IndexSet();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004A14(&qword_100020F78);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v34(v11, a1, v8);
  sub_100010264(&qword_100020F80, (void (*)(uint64_t))&type metadata accessor for IndexSet);
  uint64_t v35 = v11;
  dispatch thunk of Sequence.makeIterator()();
  uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  uint64_t v40 = v15;
  unint64_t v16 = &v15[*(int *)(v13 + 44)];
  uint64_t v42 = v4 + 16;
  uint64_t v38 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v36 = v9 + 16;
  uint64_t v17 = v16;
  unint64_t v32 = a2 & 0xC000000000000001;
  uint64_t v33 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  v29[1] = a2;
  uint64_t v30 = a2 + 32;
  uint64_t v31 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v18 = v37;
  id v19 = v41;
  while (1)
  {
    v39(v44, v17, v18);
    sub_100010264(&qword_100020F88, (void (*)(uint64_t))&type metadata accessor for IndexSet);
    dispatch thunk of Collection.endIndex.getter();
    sub_100010264(&qword_100020F90, (void (*)(uint64_t))&type metadata accessor for IndexSet.Index);
    char v20 = dispatch thunk of static Equatable.== infix(_:_:)();
    unint64_t v21 = *v38;
    (*v38)(v19, v18);
    v21(v44, v18);
    if (v20) {
      return sub_10000B360((uint64_t)v15, &qword_100020F78);
    }
    unint64_t v22 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
    unint64_t v24 = *v23;
    v22(v43, 0);
    unint64_t v25 = v35;
    v34(v35, (uint64_t)v15, v8);
    dispatch thunk of Collection.formIndex(after:)();
    uint64_t result = (*v33)(v25, v8);
    if (v32)
    {
      id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      goto LABEL_7;
    }
    if ((v24 & 0x8000000000000000) != 0) {
      break;
    }
    if (v24 >= *(void *)(v31 + 16)) {
      goto LABEL_11;
    }
    id v27 = *(id *)(v30 + 8 * v24);
LABEL_7:
    int v28 = v27;
    [v27 cancel];
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_10000F220(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = a3;
  uint64_t v32 = 0;
  int64_t v6 = 0;
  uint64_t v34 = a3 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 56);
  uint64_t v37 = a4 & 0xFFFFFFFFFFFFFF8;
  int64_t v35 = (unint64_t)(v7 + 63) >> 6;
  unint64_t v36 = a4 & 0xC000000000000001;
LABEL_5:
  while (v9)
  {
    unint64_t v10 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v11 = v10 | (v6 << 6);
LABEL_18:
    uint64_t v15 = *(void **)(*(void *)(v5 + 48) + 8 * v11);
    if (a4 >> 62)
    {
      id v28 = v15;
      swift_bridgeObjectRetain();
      uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
      if (v16) {
        goto LABEL_20;
      }
LABEL_4:

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = *(void *)(v37 + 16);
      id v17 = v15;
      swift_bridgeObjectRetain();
      if (!v16) {
        goto LABEL_4;
      }
LABEL_20:
      unint64_t v38 = v9;
      if (v36) {
        id v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v18 = *(id *)(a4 + 32);
      }
      id v19 = v18;
      sub_100010184();
      char v20 = static NSObject.== infix(_:_:)();

      if (v20)
      {

        swift_bridgeObjectRelease();
        unint64_t v9 = v38;
LABEL_37:
        *(unint64_t *)((char *)a1 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
        BOOL v12 = __OFADD__(v32++, 1);
        if (v12) {
          goto LABEL_52;
        }
      }
      else
      {
        if (v16 != 1)
        {
          unint64_t v33 = v11;
          if (v36)
          {
            uint64_t v21 = 1;
            while (1)
            {
              specialized _ArrayBuffer._getElementSlowPath(_:)();
              uint64_t v22 = v21 + 1;
              if (__OFADD__(v21, 1)) {
                break;
              }
              char v23 = static NSObject.== infix(_:_:)();
              swift_unknownObjectRelease();
              if (v23) {
                goto LABEL_36;
              }
              ++v21;
              if (v22 == v16) {
                goto LABEL_35;
              }
            }
            __break(1u);
          }
          else
          {
            uint64_t v24 = 5;
            while (1)
            {
              uint64_t v25 = v24 - 3;
              if (__OFADD__(v24 - 4, 1)) {
                break;
              }
              id v26 = *(id *)(a4 + 8 * v24);
              char v27 = static NSObject.== infix(_:_:)();

              if (v27)
              {
LABEL_36:

                swift_bridgeObjectRelease();
                uint64_t v5 = a3;
                unint64_t v9 = v38;
                unint64_t v11 = v33;
                goto LABEL_37;
              }
              ++v24;
              if (v25 == v16)
              {
LABEL_35:

                swift_bridgeObjectRelease();
                uint64_t v5 = a3;
                unint64_t v9 = v38;
                goto LABEL_5;
              }
            }
          }
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
          goto LABEL_53;
        }

        swift_bridgeObjectRelease();
        unint64_t v9 = v38;
      }
    }
  }
  BOOL v12 = __OFADD__(v6++, 1);
  if (v12) {
    goto LABEL_51;
  }
  if (v6 >= v35)
  {
LABEL_48:
    swift_retain();
    sub_10000EB6C(a1, a2, v32, v5);
    return;
  }
  unint64_t v13 = *(void *)(v34 + 8 * v6);
  if (v13)
  {
LABEL_17:
    unint64_t v9 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v6 << 6);
    goto LABEL_18;
  }
  int64_t v14 = v6 + 1;
  if (v6 + 1 >= v35) {
    goto LABEL_48;
  }
  unint64_t v13 = *(void *)(v34 + 8 * v14);
  if (v13) {
    goto LABEL_16;
  }
  int64_t v14 = v6 + 2;
  if (v6 + 2 >= v35) {
    goto LABEL_48;
  }
  unint64_t v13 = *(void *)(v34 + 8 * v14);
  if (v13) {
    goto LABEL_16;
  }
  int64_t v14 = v6 + 3;
  if (v6 + 3 >= v35) {
    goto LABEL_48;
  }
  unint64_t v13 = *(void *)(v34 + 8 * v14);
  if (v13)
  {
LABEL_16:
    int64_t v6 = v14;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v6 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v6 >= v35) {
      goto LABEL_48;
    }
    unint64_t v13 = *(void *)(v34 + 8 * v6);
    ++v14;
    if (v13) {
      goto LABEL_17;
    }
  }
LABEL_53:
  __break(1u);
}

uint64_t sub_10000F5A0(uint64_t a1, unint64_t a2)
{
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v15 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    sub_10000F220((unint64_t *)((char *)&v15 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, a1, a2);
    uint64_t v11 = v10;
    swift_release();
    swift_bridgeObjectRelease();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    BOOL v12 = (void *)swift_slowAlloc();
    bzero(v12, v8);
    swift_bridgeObjectRetain();
    sub_10000F220((unint64_t *)v12, v7, a1, a2);
    uint64_t v11 = v13;
    swift_release();
    swift_bridgeObjectRelease();
    swift_slowDealloc();
    swift_bridgeObjectRelease_n();
  }
  return v11;
}

void sub_10000F76C(uint64_t a1, unint64_t a2)
{
  if ((a1 & 0xC000000000000001) == 0)
  {
    sub_10000F5A0(a1, a2);
    return;
  }
  swift_bridgeObjectRetain();
  __CocoaSet.makeIterator()();
  if (!__CocoaSet.Iterator.next()())
  {
LABEL_43:
    swift_bridgeObjectRelease();
    swift_release();
    return;
  }
  sub_100010184();
  uint64_t v3 = a2 & 0xFFFFFFFFFFFFFF8;
  unint64_t v25 = a2 & 0xC000000000000001;
  while (1)
  {
    swift_dynamicCast();
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
      if (!v10) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = *(void *)(v3 + 16);
      swift_bridgeObjectRetain();
      if (!v10) {
        goto LABEL_15;
      }
    }
    if (v25) {
      id v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v11 = *(id *)(a2 + 32);
    }
    BOOL v12 = v11;
    char v13 = static NSObject.== infix(_:_:)();

    if (v13)
    {
      swift_bridgeObjectRelease();
LABEL_37:
      if (*((void *)&_swiftEmptySetSingleton + 3) <= *((void *)&_swiftEmptySetSingleton + 2)) {
        sub_10000E8CC();
      }
      Swift::Int v4 = NSObject._rawHashValue(seed:)(*((void *)&_swiftEmptySetSingleton + 5));
      char v5 = (char *)&_swiftEmptySetSingleton + 56;
      uint64_t v6 = -1 << *((unsigned char *)&_swiftEmptySetSingleton + 32);
      unint64_t v7 = v4 & ~v6;
      unint64_t v8 = v7 >> 6;
      if (((-1 << v7) & ~*((void *)&_swiftEmptySetSingleton + (v7 >> 6) + 7)) != 0)
      {
        unint64_t v9 = __clz(__rbit64((-1 << v7) & ~*((void *)&_swiftEmptySetSingleton + (v7 >> 6) + 7))) | v7 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v17 = 0;
        unint64_t v18 = (unint64_t)(63 - v6) >> 6;
        do
        {
          if (++v8 == v18 && (v17 & 1) != 0)
          {
            __break(1u);
            goto LABEL_44;
          }
          BOOL v19 = v8 == v18;
          if (v8 == v18) {
            unint64_t v8 = 0;
          }
          v17 |= v19;
          uint64_t v20 = *(void *)&v5[8 * v8];
        }
        while (v20 == -1);
        unint64_t v9 = __clz(__rbit64(~v20)) + (v8 << 6);
      }
      *(void *)&v5[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
      *(void *)(*((void *)&_swiftEmptySetSingleton + 6) + 8 * v9) = v26;
      ++*((void *)&_swiftEmptySetSingleton + 2);
      goto LABEL_7;
    }
    if (v10 != 1) {
      break;
    }
LABEL_15:
    swift_bridgeObjectRelease();
LABEL_16:

LABEL_7:
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_43;
    }
  }
  if (v25)
  {
    uint64_t v14 = 1;
    while (1)
    {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v15 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        break;
      }
      char v16 = static NSObject.== infix(_:_:)();
      swift_unknownObjectRelease();
      if (v16) {
        goto LABEL_36;
      }
      ++v14;
      if (v15 == v10) {
        goto LABEL_35;
      }
    }
LABEL_44:
    __break(1u);
  }
  else
  {
    uint64_t v21 = 5;
    while (1)
    {
      uint64_t v22 = v21 - 3;
      if (__OFADD__(v21 - 4, 1)) {
        break;
      }
      id v23 = *(id *)(a2 + 8 * v21);
      char v24 = static NSObject.== infix(_:_:)();

      if (v24)
      {
LABEL_36:
        swift_bridgeObjectRelease();
        uint64_t v3 = a2 & 0xFFFFFFFFFFFFFF8;
        goto LABEL_37;
      }
      ++v21;
      if (v22 == v10)
      {
LABEL_35:
        swift_bridgeObjectRelease();
        uint64_t v3 = a2 & 0xFFFFFFFFFFFFFF8;
        goto LABEL_16;
      }
    }
  }
  __break(1u);
}

uint64_t sub_10000FAD8(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v3);
      char v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      if ([v4 state] == (id)5)
      {
        swift_bridgeObjectRelease();
        uint64_t v7 = sub_100011950();

        return v7;
      }

      ++v3;
      if (v6 == v2) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10000FBEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2
    || a1 == 0x646573756170 && a2 == 0xE600000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || (char v5 = sub_10001462C(a1, (void *)a2), result = sub_100014368(v5), !v7))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

uint64_t sub_10000FC8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A14(&qword_100020EB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000FCF4()
{
  unint64_t result = qword_100020EE0;
  if (!qword_100020EE0)
  {
    sub_1000047A0(&qword_100020EC0);
    sub_100007560(&qword_100020EE8, &qword_100020EB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020EE0);
  }
  return result;
}

unint64_t sub_10000FD94()
{
  unint64_t result = qword_100020F08;
  if (!qword_100020F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F08);
  }
  return result;
}

uint64_t sub_10000FDE8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000E4F4(*(void *)(v1 + 16), *(uint64_t **)(v1 + 24), a1);
}

unint64_t sub_10000FDF0()
{
  unint64_t result = qword_100020F20;
  if (!qword_100020F20)
  {
    sub_1000047A0(&qword_100020F18);
    sub_10000FE90();
    sub_100007560(&qword_100020F40, &qword_100020F48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F20);
  }
  return result;
}

unint64_t sub_10000FE90()
{
  unint64_t result = qword_100020F28;
  if (!qword_100020F28)
  {
    sub_1000047A0(&qword_100020F30);
    sub_10000FF04();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F28);
  }
  return result;
}

unint64_t sub_10000FF04()
{
  unint64_t result = qword_100020F38;
  if (!qword_100020F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020F38);
  }
  return result;
}

uint64_t sub_10000FF58(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10)
{
  if (a10 != 255) {
    return sub_10000FF7C(result, a2, a3, a4, a5, a6, a7, a8, a9, a10 & 1);
  }
  return result;
}

uint64_t sub_10000FF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if (a10)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    return swift_retain();
  }
}

uint64_t sub_100010010(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10)
{
  if (a10 != 255) {
    return sub_100010034(result, a2, a3, a4, a5, a6, a7, a8, a9, a10 & 1);
  }
  return result;
}

uint64_t sub_100010034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if (a10)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

uint64_t sub_1000100A8()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000100F8@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000E7A4(a1, a2);
}

uint64_t sub_100010100(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001012C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100010158(uint64_t a1)
{
  return a1;
}

unint64_t sub_100010184()
{
  unint64_t result = qword_100020C60;
  if (!qword_100020C60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100020C60);
  }
  return result;
}

uint64_t sub_1000101C4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000101FC(uint64_t a1)
{
  return sub_10000E830(a1, *(void *)(v1 + 16));
}

uint64_t sub_100010204()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001023C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100010264(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000102AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t PCPrinter.id.getter()
{
  id v1 = [v0 name];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t sub_100010374@<X0>(uint64_t *a1@<X8>)
{
  sub_100010418();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

void *sub_1000103B4()
{
  return &protocol witness table for String;
}

void sub_1000103C0(uint64_t *a1@<X8>)
{
  id v3 = [*v1 name];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

unint64_t sub_100010418()
{
  unint64_t result = qword_100020FA0;
  if (!qword_100020FA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100020FA0);
  }
  return result;
}

id PCPrintJob.id.getter()
{
  return [v0 localJobID];
}

uint64_t sub_100010468(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  unint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100010530()
{
  id v1 = [v0 thumbnailImage];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v5 = v4;

    id v6 = objc_allocWithZone((Class)UIImage);
    sub_1000142B8(v3, v5);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    id v8 = [v6 initWithData:isa];
    sub_100014310(v3, v5);

    if (v8)
    {
      uint64_t v9 = Image.init(uiImage:)();
      sub_100014310(v3, v5);
      return v9;
    }
    sub_100014310(v3, v5);
  }

  return Image.init(_:bundle:)(0xD000000000000010, 0x8000000100017EB0, 0);
}

uint64_t sub_100010640()
{
  id v1 = [v0 settings];
  id v2 = [v1 objectForKey:PKOutputModeKey];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  sub_100014198((uint64_t)&v10, (uint64_t)v12);
  if (!v13)
  {
    sub_10000B360((uint64_t)v12, &qword_100020FD0);
LABEL_10:
    id v4 = [v0 settings];
    id v5 = [v4 objectForKey:@"ColorModel"];

    if (v5)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v10 = 0u;
      long long v11 = 0u;
    }
    sub_100014198((uint64_t)&v10, (uint64_t)v12);
    if (v13)
    {
      if (swift_dynamicCast())
      {
        if (v8 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v9 == v6)
        {
          swift_bridgeObjectRelease_n();
          char v3 = 1;
        }
        else
        {
          char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        return v3 & 1;
      }
    }
    else
    {
      sub_10000B360((uint64_t)v12, &qword_100020FD0);
    }
    char v3 = 0;
    return v3 & 1;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_10;
  }
  if (qword_100020AA8 != -1) {
    swift_once();
  }
  char v3 = sub_100010468(v8, v9, (void *)qword_100020FA8);
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_100010898()
{
  id v1 = v0;
  if (qword_100020A80 != -1) {
    swift_once();
  }
  uint64_t v2 = xmmword_100021200;
  swift_bridgeObjectRetain();
  id v3 = [v1 settings];
  id v4 = [v3 objectForKey:@"job-name"];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_100014198((uint64_t)v7, (uint64_t)v8);
  if (v9)
  {
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  else
  {
    sub_10000B360((uint64_t)v8, &qword_100020FD0);
  }
  return v2;
}

double sub_1000109D8()
{
  double v1 = 0.0;
  if ((uint64_t)[v0 mediaSheets] >= 1)
  {
    double v2 = 1.0 / (double)(uint64_t)[v0 mediaSheets];
    double v3 = (double)(uint64_t)[v0 mediaSheetsCompleted];
    double v4 = v3 / (double)(uint64_t)[v0 mediaSheets];
    id v5 = [v0 mediaProgress];
    double v6 = v4 + v2 * (double)(uint64_t)v5 / 100.0;
    if (v6 >= 0.0)
    {
      if (v6 <= 1.0) {
        return v4 + v2 * (double)(uint64_t)v5 / 100.0;
      }
      else {
        return 1.0;
      }
    }
  }
  return v1;
}

uint64_t sub_100010A9C(char a1)
{
  double v2 = v1;
  id v4 = [v1 jobStateReasons];
  if (v4)
  {
    id v5 = v4;
    double v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    double v6 = &_swiftEmptyArrayStorage;
  }
  id v7 = [v2 jobStateMessage];
  if (v7)
  {
    uint64_t v8 = v7;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  switch((unint64_t)[v2 state])
  {
    case 3uLL:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_100020A38 != -1) {
        swift_once();
      }
      uint64_t v9 = &xmmword_100021170;
      goto LABEL_62;
    case 4uLL:
      if (sub_100010468(0x6F636E692D626F6ALL, 0xEC000000676E696DLL, v6))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_15:
        if (qword_100020A88 != -1) {
          goto LABEL_122;
        }
LABEL_16:
        uint64_t v9 = &xmmword_100021210;
LABEL_62:
        uint64_t v78 = *(void *)v9;
        swift_bridgeObjectRetain();
        if ((a1 & 1) == 0) {
          goto LABEL_74;
        }
        goto LABEL_63;
      }
      if (sub_100010468(0xD000000000000018, 0x8000000100017C90, v6))
      {
        swift_bridgeObjectRelease();
        if (_stringCompareWithSmolCheck(_:_:expecting:)())
        {
          swift_bridgeObjectRelease();
LABEL_53:
          if (qword_100020A90 != -1) {
            swift_once();
          }
          uint64_t v9 = &xmmword_100021220;
          goto LABEL_62;
        }
        sub_1000091C0();
        uint64_t v30 = StringProtocol.caseInsensitiveCompare<A>(_:)();
        swift_bridgeObjectRelease();
        if (!v30) {
          goto LABEL_15;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        char v28 = sub_100010468(0xD00000000000001CLL, 0x8000000100017CB0, v6);
        swift_bridgeObjectRelease();
        if (v28 & 1) != 0 && (_stringCompareWithSmolCheck(_:_:expecting:)()) {
          goto LABEL_53;
        }
      }
      if (qword_100020A40 != -1) {
        swift_once();
      }
      uint64_t v9 = &xmmword_100021180;
      goto LABEL_62;
    case 5uLL:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v10 = [v2 jobPrinterStateReasons];
      if (v10)
      {
        long long v11 = v10;
        BOOL v12 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
      }
      else
      {
        BOOL v12 = &_swiftEmptyArrayStorage;
      }
      if (sub_100010468(0xD000000000000013, 0x80000001000179C0, v12))
      {
        swift_bridgeObjectRelease();
        id v23 = [self mainBundle];
        unint64_t v24 = 0xD00000000000001ELL;
        unint64_t v76 = 0x8000000100017C70;
        unint64_t v25 = 0x6E6F207964616552;
        unint64_t v26 = 0xEF72657672657320;
        goto LABEL_93;
      }
      if (sub_100010468(0xD000000000000018, 0x80000001000179E0, v12))
      {
        swift_bridgeObjectRelease();
        id v23 = [self mainBundle];
        unint64_t v25 = 0xD000000000000010;
        unint64_t v24 = 0xD00000000000001FLL;
        unint64_t v76 = 0x8000000100017C50;
        char v27 = "Paused on server";
LABEL_92:
        unint64_t v26 = (unint64_t)(v27 - 32) | 0x8000000000000000;
LABEL_93:
        v50._uint64_t countAndFlagsBits = 0;
        v50._object = (void *)0xE000000000000000;
        uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v25, (Swift::String_optional)0, (NSBundle)v23, v50, *(Swift::String *)&v24)._countAndFlagsBits;

        uint64_t v78 = countAndFlagsBits;
        if ((a1 & 1) == 0) {
          goto LABEL_74;
        }
        goto LABEL_63;
      }
      if (sub_100010468(0xD000000000000016, 0x8000000100017A00, v12))
      {
        swift_bridgeObjectRelease();
        id v23 = [self mainBundle];
        unint64_t v24 = 0xD000000000000021;
        unint64_t v76 = 0x8000000100017C00;
        uint64_t v29 = "Printing on server";
LABEL_87:
        unint64_t v26 = (unint64_t)(v29 - 32) | 0x8000000000000000;
        unint64_t v25 = 0xD000000000000012;
        goto LABEL_93;
      }
      if (sub_100010468(0xD000000000000013, 0x8000000100017A20, v12))
      {
        swift_bridgeObjectRelease();
        id v23 = [self mainBundle];
        unint64_t v25 = 0xD000000000000011;
        unint64_t v24 = 0xD000000000000020;
        unint64_t v76 = 0x8000000100017BB0;
        char v27 = "Stopped on server";
        goto LABEL_92;
      }
      if (sub_100010468(0xD000000000000014, 0x8000000100017A40, v12))
      {
        swift_bridgeObjectRelease();
        id v23 = [self mainBundle];
        unint64_t v24 = 0xD000000000000021;
        unint64_t v76 = 0x8000000100017B60;
        uint64_t v29 = "Canceled on server";
        goto LABEL_87;
      }
      if (sub_100010468(0xD000000000000013, 0x8000000100017A60, v12))
      {
        swift_bridgeObjectRelease();
        id v23 = [self mainBundle];
        unint64_t v25 = 0xD000000000000011;
        unint64_t v24 = 0xD000000000000020;
        unint64_t v76 = 0x8000000100017B10;
        char v27 = "Aborted on server";
        goto LABEL_92;
      }
      char v49 = sub_100010468(0xD000000000000015, 0x8000000100017A80, v12);
      swift_bridgeObjectRelease();
      if (v49)
      {
        id v23 = [self mainBundle];
        unint64_t v25 = 0xD000000000000013;
        unint64_t v24 = 0xD000000000000022;
        unint64_t v76 = 0x8000000100017AC0;
        char v27 = "Completed on server";
        goto LABEL_92;
      }
      uint64_t v52 = (uint64_t)[v2 mediaSheets];
      uint64_t v53 = sub_100011EF4();
      if (!v53)
      {
        __break(1u);
        goto LABEL_124;
      }
      uint64_t v54 = v53;
      if (v52 == 0x8000000000000000 && v53 == -1) {
        goto LABEL_125;
      }
      id v55 = [v2 mediaSheetsCompleted];
      if (__OFADD__(v55, 1))
      {
LABEL_124:
        __break(1u);
LABEL_125:
        __break(1u);
        goto LABEL_126;
      }
      if ((uint64_t)v55 + 1 <= 1) {
        uint64_t v56 = 1;
      }
      else {
        uint64_t v56 = (uint64_t)v55 + 1;
      }
      if ((uint64_t)[v2 mediaSheets] >= 1)
      {
        id v57 = [v2 mediaSheets];
        if ((uint64_t)v57 < v56) {
          uint64_t v56 = (uint64_t)v57;
        }
      }
      if (v52 / v54 < v56)
      {
        if (qword_100020A48 == -1)
        {
LABEL_107:
          uint64_t v9 = &xmmword_100021190;
          goto LABEL_62;
        }
LABEL_126:
        swift_once();
        goto LABEL_107;
      }
      if (qword_100020A30 != -1) {
        swift_once();
      }
      sub_100004A14(&qword_100020FC0);
      uint64_t v58 = swift_allocObject();
      *(_OWORD *)(v58 + 16) = xmmword_100019850;
      id v59 = [v2 mediaSheetsCompleted];
      if (__OFADD__(v59, 1))
      {
        __break(1u);
LABEL_128:
        __break(1u);
        goto LABEL_129;
      }
      if ((uint64_t)v59 + 1 <= 1) {
        uint64_t v60 = 1;
      }
      else {
        uint64_t v60 = (uint64_t)v59 + 1;
      }
      if ((uint64_t)[v2 mediaSheets] >= 1)
      {
        id v61 = [v2 mediaSheets];
        if ((uint64_t)v61 < v60) {
          uint64_t v60 = (uint64_t)v61;
        }
      }
      long long v62 = self;
      id v63 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v60];
      id v64 = [v62 localizedStringFromNumber:v63 numberStyle:1];

      uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v67 = v66;

      *(void *)(v58 + 56) = &type metadata for String;
      unint64_t v68 = sub_100014144();
      *(void *)(v58 + 64) = v68;
      *(void *)(v58 + 32) = v65;
      *(void *)(v58 + 40) = v67;
      uint64_t v69 = (uint64_t)[v2 mediaSheets];
      uint64_t v70 = sub_100011EF4();
      if (!v70) {
        goto LABEL_128;
      }
      if (v69 == 0x8000000000000000 && v70 == -1)
      {
LABEL_129:
        __break(1u);
        JUMPOUT(0x100011930);
      }
      id v71 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v69 / v70];
      id v72 = [v62 localizedStringFromNumber:v71 numberStyle:1];

      uint64_t v73 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v75 = v74;

      *(void *)(v58 + 96) = &type metadata for String;
      *(void *)(v58 + 104) = v68;
      *(void *)(v58 + 72) = v73;
      *(void *)(v58 + 80) = v75;
LABEL_41:
      uint64_t v78 = String.init(format:_:)();
      if (a1)
      {
LABEL_63:
        id v31 = [v2 printerDisplayName];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v35 = v34;
        }
        else
        {
          if (qword_100020A80 != -1) {
            swift_once();
          }
          unint64_t v35 = *((void *)&xmmword_100021200 + 1);
          uint64_t v33 = xmmword_100021200;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        uint64_t v36 = HIBYTE(v35) & 0xF;
        if ((v35 & 0x2000000000000000) == 0) {
          uint64_t v36 = v33 & 0xFFFFFFFFFFFFLL;
        }
        if (v36)
        {
          if (qword_100020A78 != -1) {
            swift_once();
          }
          Swift::String v37 = (Swift::String)xmmword_1000211F0;
          id v38 = sub_100011B1C();
          uint64_t v40 = v39;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          v41._uint64_t countAndFlagsBits = (uint64_t)v38;
          v41._object = v40;
          String.append(_:)(v41);
          swift_bridgeObjectRelease();
          String.append(_:)(v37);
          swift_bridgeObjectRelease();
        }
      }
LABEL_74:
      uint64_t v42 = sub_100012008();
      if (v43)
      {
        uint64_t v44 = v42;
        uint64_t v45 = (void *)v43;
        uint64_t v46 = HIBYTE(v43) & 0xF;
        if ((v43 & 0x2000000000000000) == 0) {
          uint64_t v46 = v42 & 0xFFFFFFFFFFFFLL;
        }
        if (v46)
        {
          if (qword_100020A78 != -1) {
            swift_once();
          }
          Swift::String v77 = (Swift::String)xmmword_1000211F0;
          swift_bridgeObjectRetain();
          v47._uint64_t countAndFlagsBits = v44;
          v47._object = v45;
          String.append(_:)(v47);
          swift_bridgeObjectRelease();
          String.append(_:)(v77);
        }
        swift_bridgeObjectRelease();
      }
      return v78;
    case 6uLL:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_100020A50 != -1) {
        swift_once();
      }
      uint64_t v9 = &xmmword_1000211A0;
      goto LABEL_62;
    case 7uLL:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_100020A58 != -1) {
        swift_once();
      }
      uint64_t v9 = &xmmword_1000211B0;
      goto LABEL_62;
    case 8uLL:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_100020A60 != -1) {
        swift_once();
      }
      uint64_t v9 = &xmmword_1000211C0;
      goto LABEL_62;
    case 9uLL:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_100020A68 != -1) {
        swift_once();
      }
      uint64_t v9 = &xmmword_1000211D0;
      goto LABEL_62;
    case 0xAuLL:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_100020A28 != -1) {
        swift_once();
      }
      sub_100004A14(&qword_100020FC0);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_100019840;
      id v14 = [v2 mediaSheetsCompleted];
      if (!__OFADD__(v14, 1))
      {
        if ((uint64_t)v14 + 1 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = (uint64_t)v14 + 1;
        }
        if ((uint64_t)[v2 mediaSheets] >= 1)
        {
          id v16 = [v2 mediaSheets];
          if ((uint64_t)v16 < v15) {
            uint64_t v15 = (uint64_t)v16;
          }
        }
        char v17 = self;
        id v18 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v15];
        id v19 = [v17 localizedStringFromNumber:v18 numberStyle:1];

        uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v22 = v21;

        *(void *)(v13 + 56) = &type metadata for String;
        *(void *)(v13 + 64) = sub_100014144();
        *(void *)(v13 + 32) = v20;
        *(void *)(v13 + 40) = v22;
        goto LABEL_41;
      }
      __break(1u);
LABEL_122:
      swift_once();
      goto LABEL_16;
    default:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_100020A70 != -1) {
        swift_once();
      }
      uint64_t v9 = &xmmword_1000211E0;
      goto LABEL_62;
  }
}

uint64_t sub_100011950()
{
  double v2 = sub_100012BF4();
  swift_bridgeObjectRetain();
  sub_100012DB0(&v2);
  swift_bridgeObjectRelease();
  if (*((void *)v2 + 2))
  {
    uint64_t v0 = *((void *)v2 + 4);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v0 = 0;
  }
  swift_release();
  return v0;
}

uint64_t sub_1000119E4()
{
  id v1 = [v0 jobStateReasons];
  if (v1)
  {
    double v2 = v1;
    double v3 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    double v3 = &_swiftEmptyArrayStorage;
  }
  if (sub_100010468(0x2D746E756F636361, 0xEE006465736F6C63, v3))
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (sub_100010468(0xD000000000000013, 0x8000000100017E50, v3))
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (sub_100010468(0xD000000000000015, 0x8000000100017E70, v3))
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_100010468(0xD00000000000001CLL, 0x8000000100017E90, v3);
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 0;
    }
  }
}

id sub_100011B1C()
{
  id v1 = v0;
  uint64_t v2 = sub_100004A14(&qword_100020FE0);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [v0 printerDisplayName];
  if (v5)
  {
    double v6 = v5;
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v9 = v8;

    if (qword_100020A80 != -1) {
      swift_once();
    }
  }
  else
  {
    if (qword_100020A80 != -1) {
      swift_once();
    }
    unint64_t v9 = *((void *)&xmmword_100021200 + 1);
    uint64_t v7 = xmmword_100021200;
    swift_bridgeObjectRetain();
  }
  if ([v1 printerKind] == (id)3) {
    goto LABEL_15;
  }
  id v10 = [v1 printerLocation];
  if (!v10) {
    goto LABEL_15;
  }

  id result = [v1 printerLocation];
  if (!result) {
    goto LABEL_28;
  }
  BOOL v12 = result;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  swift_bridgeObjectRelease();
  uint64_t v16 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0) {
    uint64_t v16 = v13 & 0xFFFFFFFFFFFFLL;
  }
  if (v16 && (id v17 = [v1 printerLocation]) != 0)
  {
    id v18 = v17;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v20 = v19;
  }
  else
  {
LABEL_15:
    uint64_t v20 = 0;
  }
  v28[2] = v7;
  v28[3] = v9;
  v28[0] = 2113568;
  v28[1] = 0xE300000000000000;
  uint64_t v21 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v4, 1, 1, v21);
  sub_1000091C0();
  StringProtocol.range<A>(of:options:range:locale:)();
  unint64_t v23 = v22;
  char v25 = v24;
  sub_10000B360((uint64_t)v4, &qword_100020FE0);
  swift_bridgeObjectRelease();
  if (v25) {
    return (id)v7;
  }
  swift_bridgeObjectRetain();
  String.subscript.getter();
  swift_bridgeObjectRelease();
  uint64_t v26 = static String._fromSubstring(_:)();
  swift_bridgeObjectRelease();
  if (v20 || (id result = [v1 printerKind], result == (id)3))
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return (id)v26;
  }
  uint64_t v27 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v27 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v27 >= v23 >> 14)
  {
    String.subscript.getter();
    swift_bridgeObjectRelease();
    static String._fromSubstring(_:)();
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100011EF4()
{
  id v1 = [v0 settings];
  id v2 = [v1 objectForKey:PKCopiesKey];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100014198((uint64_t)v6, (uint64_t)v7);
  if (!v8)
  {
    sub_10000B360((uint64_t)v7, &qword_100020FD0);
    return 1;
  }
  sub_100006848(0, &qword_100020FD8);
  if ((swift_dynamicCast() & 1) == 0) {
    return 1;
  }
  id v3 = [v5 integerValue];

  return (uint64_t)v3;
}

uint64_t sub_100012008()
{
  id v1 = v0;
  uint64_t v2 = type metadata accessor for URL.DirectoryHint();
  uint64_t v84 = *(void *)(v2 - 8);
  uint64_t v85 = v2;
  __chkstk_darwin(v2);
  uint64_t v83 = (char *)&v82 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004A14(&qword_100020FE8);
  __chkstk_darwin(v4 - 8);
  double v6 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v86 = *(void *)(v7 - 8);
  uint64_t v87 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  id v10 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  BOOL v12 = (char *)&v82 - v11;
  uint64_t v13 = sub_100004A14(&qword_100020FE0);
  __chkstk_darwin(v13 - 8);
  unint64_t v15 = (char *)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ([v0 state] == (id)4)
  {
    id v16 = [v0 jobStateReasons];
    if (v16)
    {
      id v17 = v16;
      id v18 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {
      id v18 = &_swiftEmptyArrayStorage;
    }
    char v19 = sub_100010468(0x6F636E692D626F6ALL, 0xEC000000676E696DLL, v18);
    swift_bridgeObjectRelease();
    if (v19) {
      return 0;
    }
  }
  switch(sub_1000119E4())
  {
    case 1:
      uint64_t v20 = (objc_class *)[self mainBundle];
      unint64_t v21 = 0xD000000000000024;
      unint64_t v81 = 0x8000000100017E30;
      unint64_t v22 = "missing required account information";
      goto LABEL_13;
    case 2:
      uint64_t v20 = (objc_class *)[self mainBundle];
      unint64_t v24 = 0xD000000000000014;
      unint64_t v21 = 0xD000000000000017;
      unint64_t v81 = 0x8000000100017DE0;
      char v25 = "account has been closed";
      goto LABEL_11;
    case 3:
      uint64_t v20 = (objc_class *)[self mainBundle];
      unint64_t v24 = 0xD000000000000015;
      unint64_t v21 = 0xD00000000000001ELL;
      unint64_t v81 = 0x8000000100017DA0;
      char v25 = "insufficient funds/quota limit";
LABEL_11:
      unint64_t v26 = (unint64_t)(v25 - 32) | 0x8000000000000000;
      v27.super.Class isa = v20;
      uint64_t v28 = 0;
      unint64_t v29 = 0xE000000000000000;
      goto LABEL_14;
    case 4:
      uint64_t v20 = (objc_class *)[self mainBundle];
      unint64_t v21 = 0xD000000000000025;
      unint64_t v81 = 0x8000000100017D60;
      unint64_t v22 = "missing/expired/bad authorization URI";
LABEL_13:
      unint64_t v26 = (unint64_t)(v22 - 32) | 0x8000000000000000;
      v27.super.Class isa = v20;
      uint64_t v28 = 0;
      unint64_t v29 = 0xE000000000000000;
      unint64_t v24 = 0xD00000000000001ALL;
LABEL_14:
      Swift::String v30 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v21, (Swift::String_optional)0, v27, *(Swift::String *)&v28, *(Swift::String *)(&v81 - 1));

      unint64_t v23 = sub_100013030(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
      unint64_t v32 = *((void *)v23 + 2);
      unint64_t v31 = *((void *)v23 + 3);
      if (v32 >= v31 >> 1) {
        unint64_t v23 = sub_100013030((char *)(v31 > 1), v32 + 1, 1, v23);
      }
      *((void *)v23 + 2) = v32 + 1;
      *(Swift::String *)&v23[16 * v32 + 32] = v30;
      break;
    default:
      unint64_t v23 = (char *)&_swiftEmptyArrayStorage;
      break;
  }
  if ([v1 state] == (id)5)
  {
LABEL_26:
    if (!*((void *)v23 + 2)) {
      goto LABEL_71;
    }
    goto LABEL_27;
  }
  *(void *)&long long v88 = 0;
  *((void *)&v88 + 1) = 0xE000000000000000;
  uint64_t v90 = 0x64656C69616620;
  unint64_t v91 = 0xE700000000000000;
  uint64_t v33 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v15, 1, 1, v33);
  sub_1000091C0();
  StringProtocol.range<A>(of:options:range:locale:)();
  char v35 = v34;
  sub_10000B360((uint64_t)v15, &qword_100020FE0);
  swift_bridgeObjectRelease();
  if (v35)
  {
    [v1 state];
    goto LABEL_26;
  }
  unint64_t v36 = 0xE000000000000000;
  String.subscript.getter();
  static String._fromSubstring(_:)();
  swift_bridgeObjectRelease();
  uint64_t v37 = v86;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v86 + 56))(v6, 1, 1, v87);
  (*(void (**)(char *, void, uint64_t))(v84 + 104))(v83, enum case for URL.DirectoryHint.inferFromPath(_:), v85);
  URL.init(filePath:directoryHint:relativeTo:)();
  uint64_t v38 = URL.lastPathComponent.getter();
  unint64_t v40 = v39;
  unint64_t v41 = *(void *)(URL.pathComponents.getter() + 16);
  swift_bridgeObjectRelease();
  if (v41 < 2)
  {
    uint64_t v53 = 0;
    goto LABEL_64;
  }
  uint64_t v84 = v38;
  uint64_t v85 = v40;
  uint64_t v42 = (void (**)(char *, uint64_t))(v37 + 8);
  unint64_t v43 = (void (**)(char *, char *, uint64_t))(v37 + 32);
  while (1)
  {
    id v46 = objc_allocWithZone((Class)NSBundle);
    URL._bridgeToObjectiveC()(v47);
    char v49 = v48;
    id v50 = [v46 initWithURL:v48];

    if (v50) {
      break;
    }
LABEL_21:
    URL.deletingLastPathComponent()();
    uint64_t v44 = v87;
    (*v42)(v12, v87);
    (*v43)(v12, v10, v44);
    unint64_t v45 = *(void *)(URL.pathComponents.getter() + 16);
    swift_bridgeObjectRelease();
    if (v45 <= 1)
    {
      uint64_t v53 = 0;
      unint64_t v36 = 0xE000000000000000;
      uint64_t v38 = v84;
      unint64_t v40 = v85;
      goto LABEL_64;
    }
  }
  id v51 = [v50 infoDictionary];
  if (!v51)
  {

    goto LABEL_21;
  }
  uint64_t v54 = v51;
  swift_bridgeObjectRelease();
  uint64_t v55 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(void *)(v55 + 16) && (unint64_t v56 = sub_100013134(0xD00000000000001ALL, 0x8000000100017CF0), (v57 & 1) != 0))
  {
    sub_10001425C(*(void *)(v55 + 56) + 32 * v56, (uint64_t)&v88);
    int v58 = swift_dynamicCast();
    if (v58) {
      uint64_t v59 = v90;
    }
    else {
      uint64_t v59 = 0;
    }
    if (v58) {
      unint64_t v60 = v91;
    }
    else {
      unint64_t v60 = 0;
    }
  }
  else
  {
    uint64_t v59 = 0;
    unint64_t v60 = 0;
  }
  id v61 = [v50 localizedInfoDictionary];
  if (!v61) {
    goto LABEL_50;
  }
  long long v62 = v61;
  uint64_t v63 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(void *)(v63 + 16) && (unint64_t v64 = sub_100013134(0xD000000000000013, 0x8000000100017D10), (v65 & 1) != 0))
  {
    sub_10001425C(*(void *)(v63 + 56) + 32 * v64, (uint64_t)&v88);
  }
  else
  {
    long long v88 = 0u;
    long long v89 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v89 + 1))
  {
    sub_10000B360((uint64_t)&v88, &qword_100020FD0);
    goto LABEL_50;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_50:
    if (*(void *)(v55 + 16) && (unint64_t v66 = sub_100013134(0x656C646E75424643, 0xEC000000656D614ELL), (v67 & 1) != 0))
    {
      sub_10001425C(*(void *)(v55 + 56) + 32 * v66, (uint64_t)&v88);
    }
    else
    {
      long long v88 = 0u;
      long long v89 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v89 + 1))
    {
      if (swift_dynamicCast())
      {

        uint64_t v38 = v90;
        unint64_t v40 = v91;
        goto LABEL_59;
      }
    }
    else
    {
      sub_10000B360((uint64_t)&v88, &qword_100020FD0);
    }
    uint64_t v38 = URL.lastPathComponent.getter();
    unint64_t v40 = v68;

    goto LABEL_59;
  }
  swift_bridgeObjectRelease();

  uint64_t v38 = v90;
  unint64_t v40 = v91;
LABEL_59:
  if (v60)
  {
    if (qword_100020AA0 != -1) {
      swift_once();
    }
    sub_100004A14(&qword_100020FC0);
    uint64_t v69 = swift_allocObject();
    *(_OWORD *)(v69 + 16) = xmmword_100019840;
    *(void *)(v69 + 56) = &type metadata for String;
    *(void *)(v69 + 64) = sub_100014144();
    *(void *)(v69 + 32) = v59;
    *(void *)(v69 + 40) = v60;
    uint64_t v53 = String.init(format:_:)();
    unint64_t v36 = v70;
  }
  else
  {
    uint64_t v53 = 0;
    unint64_t v36 = 0xE000000000000000;
  }
LABEL_64:
  if (qword_100020A98 != -1) {
    swift_once();
  }
  sub_100004A14(&qword_100020FC0);
  uint64_t v71 = swift_allocObject();
  *(_OWORD *)(v71 + 16) = xmmword_100019850;
  *(void *)(v71 + 56) = &type metadata for String;
  unint64_t v72 = sub_100014144();
  *(void *)(v71 + 32) = v38;
  *(void *)(v71 + 40) = v40;
  *(void *)(v71 + 96) = &type metadata for String;
  *(void *)(v71 + 104) = v72;
  *(void *)(v71 + 64) = v72;
  *(void *)(v71 + 72) = v53;
  *(void *)(v71 + 80) = v36;
  uint64_t v73 = String.init(format:_:)();
  uint64_t v75 = v74;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v23 = sub_100013030(0, *((void *)v23 + 2) + 1, 1, v23);
  }
  uint64_t v76 = v86;
  unint64_t v78 = *((void *)v23 + 2);
  unint64_t v77 = *((void *)v23 + 3);
  if (v78 >= v77 >> 1) {
    unint64_t v23 = sub_100013030((char *)(v77 > 1), v78 + 1, 1, v23);
  }
  *((void *)v23 + 2) = v78 + 1;
  uint64_t v79 = &v23[16 * v78];
  *((void *)v79 + 4) = v73;
  *((void *)v79 + 5) = v75;
  (*(void (**)(char *, uint64_t))(v76 + 8))(v12, v87);
  if (!*((void *)v23 + 2))
  {
LABEL_71:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_27:
  *(void *)&long long v88 = v23;
  if (qword_100020A78 != -1) {
    swift_once();
  }
  sub_100004A14(&qword_100020FF0);
  sub_100014200();
  uint64_t v52 = BidirectionalCollection<>.joined(separator:)();
  swift_bridgeObjectRelease();
  return v52;
}

char *sub_100012BF4()
{
  id v1 = [v0 jobPrinterStateReasons];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (*(void *)(v3 + 16))
    {
      uint64_t v5 = (char *)v3;
      swift_bridgeObjectRetain();
      sub_100012DB0(&v5);
      swift_bridgeObjectRelease();
      return v5;
    }
    swift_bridgeObjectRelease();
  }
  return (char *)_swiftEmptyArrayStorage;
}

uint64_t sub_100012CA4()
{
  sub_100004A14(&qword_100020FB8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100019860;
  *(void *)(v0 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 56) = v2;
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 64) = result;
  *(void *)(v0 + 72) = v4;
  qword_100020FA8 = v0;
  return result;
}

uint64_t sub_100012D2C@<X0>(uint64_t *a1@<X8>)
{
  sub_100006848(0, (unint64_t *)&qword_100020C60);
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

id sub_100012D7C@<X0>(void *a1@<X8>)
{
  id result = [*v1 localJobID];
  *a1 = result;
  return result;
}

uint64_t sub_100012DB0(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000132A4((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_100013854(v5);
  *a1 = v2;
  return result;
}

char *sub_100012E1C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004A14(&qword_100020FB0);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_100012F18(uint64_t a1)
{
  return sub_100012E1C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_100012F2C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004A14(&qword_100020FB8);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    id v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_100013030(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004A14(&qword_100020FB8);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_100013134(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000131AC(a1, a2, v4);
}

unint64_t sub_1000131AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100013290(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

char *sub_1000132A4(uint64_t a1)
{
  return sub_100012F2C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000132B8(uint64_t *__dst, uint64_t *__src, unint64_t a3, uint64_t *a4)
{
  uint64_t v5 = __src;
  int64_t v6 = (char *)__src - (char *)__dst;
  int64_t v7 = (char *)__src - (char *)__dst + 15;
  if ((char *)__src - (char *)__dst >= 0) {
    int64_t v7 = (char *)__src - (char *)__dst;
  }
  uint64_t v8 = v7 >> 4;
  uint64_t v9 = a3 - (void)__src;
  uint64_t v10 = a3 - (void)__src + 15;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v10 = a3 - (void)__src;
  }
  uint64_t v11 = v10 >> 4;
  if (v8 >= v10 >> 4)
  {
    BOOL v14 = a4;
    if (a4 != __src || &__src[2 * v11] <= a4) {
      memmove(a4, __src, 16 * v11);
    }
    uint64_t v13 = (char *)&a4[2 * v11];
    if (__dst >= v5 || v9 < 16) {
      goto LABEL_54;
    }
    unint64_t v23 = (uint64_t *)(a3 - 16);
    unint64_t v36 = a4;
    while (1)
    {
      unint64_t v40 = (uint64_t *)v13;
      uint64_t v26 = *((void *)v13 - 2);
      char v25 = (void *)*((void *)v13 - 1);
      unint64_t v24 = v13 - 16;
      uint64_t v38 = v23 + 2;
      uint64_t v27 = *(v5 - 2);
      unint64_t v29 = (void *)*(v5 - 1);
      uint64_t v28 = v5 - 2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unsigned __int8 v30 = sub_10001462C(v26, v25);
      if (sub_10001462C(v27, v29) < v30
        || (v26 == 0x2D656E696C66666FLL ? (BOOL v31 = v25 == (void *)0xEE0074726F706572) : (BOOL v31 = 0), v31))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v32 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v32 & 1) == 0)
        {
          uint64_t v28 = (uint64_t *)v24;
          if (v38 == v40)
          {
            uint64_t v13 = v24;
            uint64_t v33 = __dst;
            if (v23 < v40) {
              goto LABEL_49;
            }
          }
          else
          {
            uint64_t v13 = v24;
LABEL_47:
            uint64_t v33 = __dst;
          }
LABEL_48:
          *(_OWORD *)unint64_t v23 = *(_OWORD *)v28;
          goto LABEL_49;
        }
      }
      uint64_t v13 = (char *)v40;
      if (v38 != v5)
      {
        v5 -= 2;
        goto LABEL_47;
      }
      BOOL v34 = v23 >= v5;
      v5 -= 2;
      uint64_t v33 = __dst;
      if (v34) {
        goto LABEL_48;
      }
LABEL_49:
      if (v5 <= v33)
      {
        BOOL v14 = v36;
        goto LABEL_54;
      }
      v23 -= 2;
      BOOL v14 = v36;
      if (v13 <= (char *)v36) {
        goto LABEL_54;
      }
    }
  }
  uint64_t v12 = __dst;
  if (a4 != __dst || &__dst[2 * v8] <= a4) {
    memmove(a4, __dst, 16 * v8);
  }
  uint64_t v13 = (char *)&a4[2 * v8];
  BOOL v14 = a4;
  if ((unint64_t)v5 < a3 && v6 >= 16)
  {
    while (1)
    {
      uint64_t v16 = *v5;
      unint64_t v15 = (void *)v5[1];
      uint64_t v18 = *v14;
      id v17 = (void *)v14[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unsigned __int8 v19 = sub_10001462C(v16, v15);
      if (sub_10001462C(v18, v17) < v19) {
        break;
      }
      BOOL v20 = v16 == 0x2D656E696C66666FLL && v15 == (void *)0xEE0074726F706572;
      if (v20) {
        break;
      }
      char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v21) {
        goto LABEL_21;
      }
      unint64_t v22 = v14;
      BOOL v20 = v12 == v14;
      v14 += 2;
      if (!v20) {
        goto LABEL_22;
      }
LABEL_23:
      v12 += 2;
      if (v14 >= (uint64_t *)v13 || (unint64_t)v5 >= a3) {
        goto LABEL_25;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_21:
    unint64_t v22 = v5;
    BOOL v20 = v12 == v5;
    v5 += 2;
    if (v20) {
      goto LABEL_23;
    }
LABEL_22:
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v22;
    goto LABEL_23;
  }
LABEL_25:
  uint64_t v5 = v12;
LABEL_54:
  if (v5 != v14
    || v5 >= (uint64_t *)((char *)v14
                       + ((v13 - (char *)v14 + (v13 - (char *)v14 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0)))
  {
    memmove(v5, v14, 16 * ((v13 - (char *)v14) / 16));
  }
  return 1;
}

uint64_t sub_1000136AC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v15 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v17 = *a4;
    uint64_t v5 = (uint64_t *)(*a4 + 16 * a3);
LABEL_5:
    int64_t v6 = (uint64_t *)(v17 + 16 * v4);
    uint64_t v8 = *v6;
    int64_t v7 = (void *)v6[1];
    uint64_t v9 = v15;
    uint64_t v16 = v5;
    while (1)
    {
      uint64_t v11 = *(v5 - 2);
      uint64_t v10 = (void *)*(v5 - 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unsigned __int8 v12 = sub_10001462C(v8, v7);
      if (sub_10001462C(v11, v10) < v12
        || v8 == 0x2D656E696C66666FLL && v7 == (void *)0xEE0074726F706572)
      {
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
        char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v13 & 1) == 0) {
          goto LABEL_4;
        }
      }
      if (!v17) {
        break;
      }
      uint64_t v8 = *v5;
      int64_t v7 = (void *)v5[1];
      *(_OWORD *)uint64_t v5 = *((_OWORD *)v5 - 1);
      *(v5 - 1) = (uint64_t)v7;
      *(v5 - 2) = v8;
      v5 -= 2;
      if (v4 == ++v9)
      {
LABEL_4:
        ++v4;
        uint64_t v5 = v16 + 2;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100013854(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  uint64_t result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_154;
    }
    if (v3) {
      return sub_1000136AC(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_153;
  }
  Swift::Int v112 = v3;
  uint64_t v107 = result;
  uint64_t v104 = a1;
  if (v3 <= 1)
  {
    int64_t v7 = _swiftEmptyArrayStorage;
    unint64_t v114 = &_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      uint64_t v10 = (char *)_swiftEmptyArrayStorage;
LABEL_119:
      uint64_t v106 = v7;
      if (v12 >= 2)
      {
        uint64_t v98 = *v104;
        do
        {
          unint64_t v99 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_148;
          }
          if (!v98) {
            goto LABEL_161;
          }
          uint64_t v100 = *(void *)&v10[16 * v99 + 32];
          uint64_t v101 = *(void *)&v10[16 * v12 + 24];
          uint64_t result = sub_1000132B8((uint64_t *)(v98 + 16 * v100), (uint64_t *)(v98 + 16 * *(void *)&v10[16 * v12 + 16]), v98 + 16 * v101, v114);
          if (v1) {
            break;
          }
          if (v101 < v100) {
            goto LABEL_149;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_100012F18((uint64_t)v10);
            uint64_t v10 = (char *)result;
          }
          if (v99 >= *((void *)v10 + 2)) {
            goto LABEL_150;
          }
          uint64_t v102 = &v10[16 * v99 + 32];
          *(void *)uint64_t v102 = v100;
          *((void *)v102 + 1) = v101;
          unint64_t v103 = *((void *)v10 + 2);
          if (v12 > v103) {
            goto LABEL_151;
          }
          uint64_t result = (uint64_t)memmove(&v10[16 * v12 + 16], &v10[16 * v12 + 32], 16 * (v103 - v12));
          *((void *)v10 + 2) = v103 - 1;
          unint64_t v12 = v103 - 1;
        }
        while (v103 > 2);
      }
LABEL_130:
      swift_bridgeObjectRelease();
      v106[2] = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v106 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(result + 16) = v6;
    uint64_t v106 = (void *)result;
    unint64_t v114 = (uint64_t *)(result + 32);
  }
  Swift::Int v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v105 = *a1 + 24;
  uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v11 = v112;
  uint64_t v115 = *a1;
LABEL_16:
  Swift::Int v13 = v8++;
  Swift::Int v111 = v13;
  if (v8 >= v11) {
    goto LABEL_48;
  }
  unint64_t v108 = v10;
  BOOL v14 = (uint64_t *)(v9 + 16 * v8);
  uint64_t v16 = *v14;
  uint64_t v15 = (void *)v14[1];
  uint64_t v17 = (uint64_t *)(v9 + 16 * v13);
  uint64_t v18 = *v17;
  unsigned __int8 v19 = (void *)v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unsigned __int8 v20 = sub_10001462C(v16, v15);
  if (sub_10001462C(v18, v19) < v20
    || (v16 == 0x2D656E696C66666FLL ? (BOOL v21 = v15 == (void *)0xEE0074726F706572) : (BOOL v21 = 0), v21))
  {
    swift_bridgeObjectRelease();
    int v22 = 1;
  }
  else
  {
    int v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
  }
  uint64_t result = swift_bridgeObjectRelease();
  Swift::Int v8 = v13 + 2;
  if (v13 + 2 < v112)
  {
    uint64_t v23 = v105 + 16 * v13;
    do
    {
      uint64_t v25 = v23;
      uint64_t v27 = *(void **)(v23 + 16);
      v23 += 16;
      uint64_t v26 = v27;
      uint64_t v29 = *(void *)(v25 - 8);
      uint64_t v28 = *(void **)v25;
      uint64_t v30 = *(void *)(v25 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unsigned __int8 v31 = sub_10001462C(v30, v27);
      if (sub_10001462C(v29, v28) < v31
        || (v30 == 0x2D656E696C66666FLL ? (BOOL v32 = v26 == (void *)0xEE0074726F706572) : (BOOL v32 = 0), v32))
      {
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v22 & 1) == 0)
        {
          uint64_t v10 = v108;
          Swift::Int v13 = v111;
          Swift::Int v11 = v112;
          uint64_t v9 = v115;
          if (v8 >= v112) {
            goto LABEL_70;
          }
          goto LABEL_49;
        }
      }
      else
      {
        int v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v22 ^ v24)) {
          goto LABEL_46;
        }
      }
      ++v8;
    }
    while (v112 != v8);
    Swift::Int v8 = v112;
LABEL_46:
    uint64_t v9 = v115;
    Swift::Int v13 = v111;
    uint64_t v10 = v108;
    if (v22) {
      goto LABEL_38;
    }
    goto LABEL_47;
  }
  uint64_t v9 = v115;
  uint64_t v10 = v108;
  if ((v22 & 1) == 0)
  {
LABEL_47:
    Swift::Int v11 = v112;
LABEL_48:
    if (v8 >= v11) {
      goto LABEL_70;
    }
    goto LABEL_49;
  }
LABEL_38:
  if (v8 < v13) {
    goto LABEL_157;
  }
  if (v13 < v8)
  {
    uint64_t v33 = 16 * v8;
    uint64_t v34 = 16 * v13;
    Swift::Int v35 = v8;
    Swift::Int v36 = v13;
    Swift::Int v11 = v112;
    while (1)
    {
      if (v36 != --v35)
      {
        if (!v9) {
          goto LABEL_160;
        }
        uint64_t v37 = v9 + v33;
        uint64_t v38 = *(void *)(v9 + v34);
        uint64_t v39 = *(void *)(v9 + v34 + 8);
        *(_OWORD *)(v9 + v34) = *(_OWORD *)(v9 + v33 - 16);
        *(void *)(v37 - 16) = v38;
        *(void *)(v37 - 8) = v39;
      }
      ++v36;
      v33 -= 16;
      v34 += 16;
      if (v36 >= v35) {
        goto LABEL_48;
      }
    }
  }
  Swift::Int v11 = v112;
  if (v8 >= v112) {
    goto LABEL_70;
  }
LABEL_49:
  if (__OFSUB__(v8, v13)) {
    goto LABEL_152;
  }
  if (v8 - v13 >= v107) {
    goto LABEL_70;
  }
  Swift::Int v40 = v13 + v107;
  if (__OFADD__(v13, v107)) {
    goto LABEL_155;
  }
  if (v40 >= v11) {
    Swift::Int v40 = v11;
  }
  if (v40 >= v13)
  {
    if (v8 == v40) {
      goto LABEL_70;
    }
    uint64_t v109 = v10;
    Swift::Int v110 = v40;
    unint64_t v41 = (uint64_t *)(v9 + 16 * v8);
LABEL_59:
    uint64_t v42 = (uint64_t *)(v9 + 16 * v8);
    uint64_t v44 = *v42;
    unint64_t v43 = (void *)v42[1];
    uint64_t v113 = v41;
    while (1)
    {
      uint64_t v46 = *(v41 - 2);
      unint64_t v45 = (void *)*(v41 - 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unsigned __int8 v47 = sub_10001462C(v44, v43);
      if (sub_10001462C(v46, v45) < v47
        || v44 == 0x2D656E696C66666FLL && v43 == (void *)0xEE0074726F706572)
      {
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
        char v48 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v48 & 1) == 0)
        {
          uint64_t v9 = v115;
LABEL_58:
          ++v8;
          unint64_t v41 = v113 + 2;
          Swift::Int v13 = v111;
          if (v8 != v110) {
            goto LABEL_59;
          }
          Swift::Int v8 = v110;
          uint64_t v10 = v109;
LABEL_70:
          if (v8 < v13) {
            goto LABEL_147;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_100012E1C(0, *((void *)v10 + 2) + 1, 1, v10);
            uint64_t v10 = (char *)result;
          }
          unint64_t v50 = *((void *)v10 + 2);
          unint64_t v49 = *((void *)v10 + 3);
          unint64_t v12 = v50 + 1;
          uint64_t v9 = v115;
          if (v50 >= v49 >> 1)
          {
            uint64_t result = (uint64_t)sub_100012E1C((char *)(v49 > 1), v50 + 1, 1, v10);
            uint64_t v9 = v115;
            uint64_t v10 = (char *)result;
          }
          *((void *)v10 + 2) = v12;
          id v51 = v10 + 32;
          uint64_t v52 = &v10[16 * v50 + 32];
          *(void *)uint64_t v52 = v13;
          *((void *)v52 + 1) = v8;
          if (v50)
          {
LABEL_76:
            unint64_t v53 = v12 - 1;
            if (v12 >= 4)
            {
              int v58 = &v51[2 * v12];
              uint64_t v59 = *(v58 - 8);
              uint64_t v60 = *(v58 - 7);
              BOOL v64 = __OFSUB__(v60, v59);
              uint64_t v61 = v60 - v59;
              if (v64) {
                goto LABEL_136;
              }
              uint64_t v63 = *(v58 - 6);
              uint64_t v62 = *(v58 - 5);
              BOOL v64 = __OFSUB__(v62, v63);
              uint64_t v56 = v62 - v63;
              char v57 = v64;
              if (v64) {
                goto LABEL_137;
              }
              unint64_t v65 = v12 - 2;
              unint64_t v66 = &v51[2 * v12 - 4];
              uint64_t v68 = *v66;
              uint64_t v67 = v66[1];
              BOOL v64 = __OFSUB__(v67, v68);
              uint64_t v69 = v67 - v68;
              if (v64) {
                goto LABEL_138;
              }
              BOOL v64 = __OFADD__(v56, v69);
              uint64_t v70 = v56 + v69;
              if (v64) {
                goto LABEL_140;
              }
              if (v70 >= v61)
              {
                long long v88 = &v51[2 * v53];
                uint64_t v90 = *v88;
                uint64_t v89 = v88[1];
                BOOL v64 = __OFSUB__(v89, v90);
                uint64_t v91 = v89 - v90;
                if (v64) {
                  goto LABEL_146;
                }
                BOOL v81 = v56 < v91;
              }
              else
              {
LABEL_89:
                if (v57) {
                  goto LABEL_139;
                }
                unint64_t v65 = v12 - 2;
                uint64_t v71 = &v51[2 * v12 - 4];
                uint64_t v73 = *v71;
                uint64_t v72 = v71[1];
                BOOL v74 = __OFSUB__(v72, v73);
                uint64_t v75 = v72 - v73;
                char v76 = v74;
                if (v74) {
                  goto LABEL_141;
                }
                unint64_t v77 = &v51[2 * v53];
                uint64_t v79 = *v77;
                uint64_t v78 = v77[1];
                BOOL v64 = __OFSUB__(v78, v79);
                uint64_t v80 = v78 - v79;
                if (v64) {
                  goto LABEL_143;
                }
                if (__OFADD__(v75, v80)) {
                  goto LABEL_145;
                }
                if (v75 + v80 < v56) {
                  goto LABEL_101;
                }
                BOOL v81 = v56 < v80;
              }
              if (v81) {
                unint64_t v53 = v65;
              }
            }
            else
            {
              if (v12 == 3)
              {
                uint64_t v55 = *((void *)v10 + 4);
                uint64_t v54 = *((void *)v10 + 5);
                BOOL v64 = __OFSUB__(v54, v55);
                uint64_t v56 = v54 - v55;
                char v57 = v64;
                goto LABEL_89;
              }
              uint64_t v82 = *((void *)v10 + 4);
              uint64_t v83 = *((void *)v10 + 5);
              BOOL v64 = __OFSUB__(v83, v82);
              uint64_t v75 = v83 - v82;
              char v76 = v64;
LABEL_101:
              if (v76) {
                goto LABEL_142;
              }
              uint64_t v84 = &v51[2 * v53];
              uint64_t v86 = *v84;
              uint64_t v85 = v84[1];
              BOOL v64 = __OFSUB__(v85, v86);
              uint64_t v87 = v85 - v86;
              if (v64) {
                goto LABEL_144;
              }
              if (v87 < v75) {
                goto LABEL_15;
              }
            }
            unint64_t v92 = v53 - 1;
            if (v53 - 1 >= v12)
            {
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
LABEL_147:
              __break(1u);
LABEL_148:
              __break(1u);
LABEL_149:
              __break(1u);
LABEL_150:
              __break(1u);
LABEL_151:
              __break(1u);
LABEL_152:
              __break(1u);
LABEL_153:
              __break(1u);
LABEL_154:
              __break(1u);
LABEL_155:
              __break(1u);
              break;
            }
            if (!v9) {
              goto LABEL_159;
            }
            long long v93 = &v51[2 * v92];
            uint64_t v94 = *v93;
            uint64_t v95 = &v51[2 * v53];
            uint64_t v96 = v95[1];
            uint64_t result = sub_1000132B8((uint64_t *)(v9 + 16 * *v93), (uint64_t *)(v9 + 16 * *v95), v9 + 16 * v96, v114);
            if (v1) {
              goto LABEL_130;
            }
            if (v96 < v94) {
              goto LABEL_133;
            }
            if (v53 > *((void *)v10 + 2)) {
              goto LABEL_134;
            }
            *long long v93 = v94;
            v51[2 * v92 + 1] = v96;
            unint64_t v97 = *((void *)v10 + 2);
            if (v53 >= v97) {
              goto LABEL_135;
            }
            unint64_t v12 = v97 - 1;
            uint64_t result = (uint64_t)memmove(&v51[2 * v53], v95 + 2, 16 * (v97 - 1 - v53));
            *((void *)v10 + 2) = v97 - 1;
            uint64_t v9 = v115;
            if (v97 <= 2) {
              goto LABEL_15;
            }
            goto LABEL_76;
          }
          unint64_t v12 = 1;
LABEL_15:
          Swift::Int v11 = v112;
          if (v8 >= v112)
          {
            int64_t v7 = v106;
            goto LABEL_119;
          }
          goto LABEL_16;
        }
      }
      uint64_t v9 = v115;
      if (!v115) {
        goto LABEL_158;
      }
      uint64_t v44 = *v41;
      unint64_t v43 = (void *)v41[1];
      *(_OWORD *)unint64_t v41 = *((_OWORD *)v41 - 1);
      *(v41 - 1) = (uint64_t)v43;
      *(v41 - 2) = v44;
      v41 -= 2;
      if (v8 == ++v13) {
        goto LABEL_58;
      }
    }
  }
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
  return result;
}

unint64_t sub_100014144()
{
  unint64_t result = qword_100020FC8;
  if (!qword_100020FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020FC8);
  }
  return result;
}

uint64_t sub_100014198(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A14(&qword_100020FD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100014200()
{
  unint64_t result = qword_100020FF8;
  if (!qword_100020FF8)
  {
    sub_1000047A0(&qword_100020FF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020FF8);
  }
  return result;
}

uint64_t sub_10001425C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000142B8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_100014310(uint64_t a1, unint64_t a2)
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

uint64_t sub_100014368(char a1)
{
  uint64_t v1 = 0;
  switch(a1)
  {
    case 4:
    case 5:
    case 6:
    case 7:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
      id v2 = [self mainBundle];
      NSString v3 = String._bridgeToObjectiveC()();
      NSString v4 = String._bridgeToObjectiveC()();
      NSString v5 = String._bridgeToObjectiveC()();
      id v6 = [v2 localizedStringForKey:v3 value:v4 table:v5];

      uint64_t v1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      swift_bridgeObjectRelease();

      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t sub_10001462C(uint64_t a1, void *a2)
{
  if (a1 == 0xD000000000000014 && a2 == (void *)0x80000001000181E0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    return 2;
  }
  v5._uint64_t countAndFlagsBits = 0xD000000000000011;
  v5._object = (void *)0x8000000100018200;
  if (String.hasPrefix(_:)(v5)) {
    return 20;
  }
  v6._uint64_t countAndFlagsBits = 0xD000000000000018;
  v6._object = (void *)0x8000000100018220;
  if (String.hasPrefix(_:)(v6)) {
    return 4;
  }
  if (a1 == 0x646573756170 && a2 == (void *)0xE600000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    return 3;
  }
  v7._uint64_t countAndFlagsBits = 0x6F6C2D616964656DLL;
  v7._object = (void *)0xE900000000000077;
  if (String.hasPrefix(_:)(v7)) {
    return 5;
  }
  v8._uint64_t countAndFlagsBits = 0x65706F6C65766564;
  v8._object = (void *)0xED0000776F6C2D72;
  if (String.hasPrefix(_:)(v8)) {
    return 6;
  }
  v9._uint64_t countAndFlagsBits = 0x6F6C2D72656E6F74;
  v9._object = (void *)0xE900000000000077;
  if (String.hasPrefix(_:)(v9)) {
    return 6;
  }
  v10._uint64_t countAndFlagsBits = 0xD000000000000011;
  v10._object = (void *)0x8000000100018240;
  if (String.hasPrefix(_:)(v10)) {
    return 7;
  }
  v11._uint64_t countAndFlagsBits = 0x6D652D616964656DLL;
  v11._object = (void *)0xEB00000000797470;
  if (String.hasPrefix(_:)(v11)) {
    return 10;
  }
  v12._object = (void *)0xE90000000000006DLL;
  v12._uint64_t countAndFlagsBits = 0x616A2D616964656DLL;
  if (String.hasPrefix(_:)(v12)) {
    return 12;
  }
  v13._uint64_t countAndFlagsBits = 0x656E2D616964656DLL;
  v13._object = (void *)0xEC00000064656465;
  if (String.hasPrefix(_:)(v13)) {
    return 11;
  }
  v14._uint64_t countAndFlagsBits = 0x65706F6C65766564;
  v14._object = (void *)0xEF7974706D652D72;
  if (String.hasPrefix(_:)(v14)) {
    return 13;
  }
  v15._uint64_t countAndFlagsBits = 0x6D652D72656E6F74;
  v15._object = (void *)0xEB00000000797470;
  if (String.hasPrefix(_:)(v15)) {
    return 13;
  }
  v16._uint64_t countAndFlagsBits = 0xD000000000000013;
  v16._object = (void *)0x8000000100018260;
  if (String.hasPrefix(_:)(v16)) {
    return 14;
  }
  v17._uint64_t countAndFlagsBits = 0xD000000000000012;
  v17._object = (void *)0x8000000100018280;
  if (String.hasPrefix(_:)(v17)) {
    return 15;
  }
  v18._uint64_t countAndFlagsBits = 0xD000000000000013;
  v18._object = (void *)0x80000001000182A0;
  if (String.hasPrefix(_:)(v18)) {
    return 15;
  }
  v19._object = (void *)0xE90000000000006ELL;
  v19._uint64_t countAndFlagsBits = 0x65706F2D726F6F64;
  if (String.hasPrefix(_:)(v19)) {
    return 16;
  }
  v20._uint64_t countAndFlagsBits = 0x706F2D7265766F63;
  v20._object = (void *)0xEA00000000006E65;
  if (String.hasPrefix(_:)(v20)) {
    return 17;
  }
  v21._uint64_t countAndFlagsBits = 0x636F6C7265746E69;
  v21._object = (void *)0xEE006E65706F2D6BLL;
  if (String.hasPrefix(_:)(v21)) {
    return 17;
  }
  v22._uint64_t countAndFlagsBits = 0x2D656E696C66666FLL;
  v22._object = (void *)0xEE0074726F706572;
  if (String.hasPrefix(_:)(v22)) {
    return 26;
  }
  v23._uint64_t countAndFlagsBits = 0x72612D6C6F6F7073;
  v23._object = (void *)0xEF6C6C75662D6165;
  if (String.hasPrefix(_:)(v23)) {
    return 21;
  }
  v24._object = (void *)0x80000001000182C0;
  v24._uint64_t countAndFlagsBits = 0xD000000000000010;
  if (String.hasPrefix(_:)(v24)) {
    return 22;
  }
  v25._uint64_t countAndFlagsBits = 0xD000000000000017;
  v25._object = (void *)0x80000001000182E0;
  if (String.hasPrefix(_:)(v25)) {
    return 18;
  }
  v26._uint64_t countAndFlagsBits = 0x766F2D7265737566;
  v26._object = (void *)0xEF706D65742D7265;
  if (String.hasPrefix(_:)(v26)) {
    return 18;
  }
  v27._object = (void *)0x8000000100018300;
  v27._uint64_t countAndFlagsBits = 0xD000000000000010;
  if (String.hasPrefix(_:)(v27)) {
    return 18;
  }
  v28._uint64_t countAndFlagsBits = 0x7261656E2D63706FLL;
  v28._object = (void *)0xEC0000006C6F652DLL;
  if (String.hasPrefix(_:)(v28)) {
    return 18;
  }
  v29._uint64_t countAndFlagsBits = 0x6566696C2D63706FLL;
  v29._object = (void *)0xED00007265766F2DLL;
  if (String.hasPrefix(_:)(v29)) {
    return 25;
  }
  v30._uint64_t countAndFlagsBits = 0xD000000000000013;
  v30._object = (void *)0x8000000100018320;
  if (String.hasPrefix(_:)(v30)) {
    return 23;
  }
  v31._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
  v31._object = (void *)0x8000000100018340;
  if (String.hasPrefix(_:)(v31)) {
    return 27;
  }
  v32._object = (void *)0x8000000100018360;
  v32._uint64_t countAndFlagsBits = 0xD000000000000010;
  if (String.hasPrefix(_:)(v32)) {
    return 28;
  }
  v33._object = (void *)0x8000000100018380;
  v33._uint64_t countAndFlagsBits = 0xD000000000000010;
  if (String.hasPrefix(_:)(v33)) {
    return 29;
  }
  v34._object = (void *)0x80000001000183A0;
  v34._uint64_t countAndFlagsBits = 0xD000000000000010;
  if (String.hasPrefix(_:)(v34)) {
    return 30;
  }
  v35._object = (void *)0x80000001000183C0;
  v35._uint64_t countAndFlagsBits = 0xD000000000000010;
  if (String.hasPrefix(_:)(v35)) {
    return 31;
  }
  id v36 = [self mainBundle];
  v43._object = (void *)0xE000000000000000;
  v37._uint64_t countAndFlagsBits = a1;
  v37._object = a2;
  v38.value._uint64_t countAndFlagsBits = 1684957515;
  v38.value._object = (void *)0xE400000000000000;
  v39._uint64_t countAndFlagsBits = a1;
  v39._object = a2;
  v43._uint64_t countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v37, v38, (NSBundle)v36, v39, v43);

  v40._uint64_t countAndFlagsBits = 0x726F7272652DLL;
  v40._object = (void *)0xE600000000000000;
  if (String.hasSuffix(_:)(v40))
  {
    swift_bridgeObjectRelease();
    return 25;
  }
  else
  {
    v41._uint64_t countAndFlagsBits = 0x676E696E7261772DLL;
    v41._object = (void *)0xE800000000000000;
    Swift::Bool v42 = String.hasSuffix(_:)(v41);
    swift_bridgeObjectRelease();
    if (v42) {
      return 18;
    }
    else {
      return 0;
    }
  }
}

void *assignWithCopy for PrintCenterCellButtonStyle(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintCenterCellButtonStyle(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintCenterCellButtonStyle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintCenterCellButtonStyle()
{
  return &type metadata for PrintCenterCellButtonStyle;
}

uint64_t sub_100014E78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100014E94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v61 = a3;
  uint64_t v62 = a2;
  uint64_t v64 = a4;
  uint64_t v5 = sub_100004A14(&qword_100020E98);
  __chkstk_darwin(v5 - 8);
  uint64_t v60 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = type metadata accessor for BorderlessButtonStyle();
  uint64_t v53 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  Swift::String v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ButtonStyleConfiguration.Label();
  uint64_t v50 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  Swift::String v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_100004A14(&qword_100021000);
  uint64_t v12 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  Swift::String v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_100004A14(&qword_100021008);
  __chkstk_darwin(v49);
  Swift::String v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_100004A14(&qword_100021010);
  __chkstk_darwin(v54);
  Swift::String v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100004A14(&qword_100021018);
  __chkstk_darwin(v56);
  Swift::String v20 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100004A14(&qword_100021020);
  __chkstk_darwin(v57);
  uint64_t v52 = (uint64_t)&v48 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_100004A14(&qword_100021028);
  __chkstk_darwin(v59);
  uint64_t v58 = (uint64_t)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = a1;
  ButtonStyleConfiguration.label.getter();
  BorderlessButtonStyle.init()();
  sub_100015598(&qword_100021030, (void (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label);
  sub_100015598(&qword_100021038, (void (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle);
  uint64_t v23 = v51;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v8, v23);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v11, v9);
  if (qword_100020A20 != -1) {
    swift_once();
  }
  uint64_t v24 = qword_100021148;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v26 = v55;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v14, v55);
  Swift::String v27 = (uint64_t *)&v16[*(int *)(v49 + 36)];
  *Swift::String v27 = KeyPath;
  v27[1] = v24;
  Swift::String v28 = *(void (**)(char *, uint64_t))(v12 + 8);
  swift_retain();
  v28(v14, v26);
  uint64_t v29 = (uint64_t)v60;
  static SymbolRenderingMode.palette.getter();
  uint64_t v30 = type metadata accessor for SymbolRenderingMode();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 0, 1, v30);
  uint64_t v31 = swift_getKeyPath();
  Swift::String v32 = (uint64_t *)&v18[*(int *)(v54 + 36)];
  uint64_t v33 = sub_100004A14(&qword_100021040);
  sub_10000B2FC(v29, (uint64_t)v32 + *(int *)(v33 + 28), &qword_100020E98);
  *Swift::String v32 = v31;
  sub_10000B2FC((uint64_t)v16, (uint64_t)v18, &qword_100021008);
  sub_10000B360(v29, &qword_100020E98);
  sub_10000B360((uint64_t)v16, &qword_100021008);
  sub_10000B2FC((uint64_t)v18, (uint64_t)v20, &qword_100021010);
  Swift::String v34 = &v20[*(int *)(v56 + 36)];
  uint64_t v35 = v62;
  *(void *)Swift::String v34 = v61;
  *((void *)v34 + 1) = v35;
  swift_retain();
  swift_retain();
  sub_10000B360((uint64_t)v18, &qword_100021010);
  if (ButtonStyleConfiguration.isPressed.getter()) {
    double v36 = 1.2;
  }
  else {
    double v36 = 1.0;
  }
  static UnitPoint.center.getter();
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v41 = v52;
  sub_10000B2FC((uint64_t)v20, v52, &qword_100021018);
  uint64_t v42 = v41 + *(int *)(v57 + 36);
  *(double *)uint64_t v42 = v36;
  *(double *)(v42 + 8) = v36;
  *(void *)(v42 + 16) = v38;
  *(void *)(v42 + 24) = v40;
  sub_10000B360((uint64_t)v20, &qword_100021018);
  uint64_t v43 = static Animation.easeOut(duration:)();
  char v44 = ButtonStyleConfiguration.isPressed.getter();
  uint64_t v45 = v58;
  sub_10000B2FC(v41, v58, &qword_100021020);
  uint64_t v46 = v45 + *(int *)(v59 + 36);
  *(void *)uint64_t v46 = v43;
  *(unsigned char *)(v46 + 8) = v44 & 1;
  sub_10000B360(v41, &qword_100021020);
  return sub_1000156A4(v45, v64);
}

uint64_t sub_100015590@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100014E94(a1, *v2, v2[1], a2);
}

uint64_t sub_100015598(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000155E8()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t sub_10001560C(uint64_t a1)
{
  uint64_t v2 = sub_100004A14(&qword_100020E98);
  __chkstk_darwin(v2 - 8);
  sub_10000B2FC(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100020E98);
  return EnvironmentValues.symbolRenderingMode.setter();
}

uint64_t sub_1000156A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A14(&qword_100021028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100015710()
{
  unint64_t result = qword_100021048;
  if (!qword_100021048)
  {
    sub_1000047A0(&qword_100021028);
    sub_1000157B0();
    sub_100007560(&qword_100021098, &qword_1000210A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021048);
  }
  return result;
}

unint64_t sub_1000157B0()
{
  unint64_t result = qword_100021050;
  if (!qword_100021050)
  {
    sub_1000047A0(&qword_100021020);
    sub_10001582C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021050);
  }
  return result;
}

unint64_t sub_10001582C()
{
  unint64_t result = qword_100021058;
  if (!qword_100021058)
  {
    sub_1000047A0(&qword_100021018);
    sub_1000158CC();
    sub_100007560(&qword_100021088, &qword_100021090);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021058);
  }
  return result;
}

unint64_t sub_1000158CC()
{
  unint64_t result = qword_100021060;
  if (!qword_100021060)
  {
    sub_1000047A0(&qword_100021010);
    sub_10001596C();
    sub_100007560(&qword_100021080, &qword_100021040);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021060);
  }
  return result;
}

unint64_t sub_10001596C()
{
  unint64_t result = qword_100021068;
  if (!qword_100021068)
  {
    sub_1000047A0(&qword_100021008);
    type metadata accessor for ButtonStyleConfiguration.Label();
    type metadata accessor for BorderlessButtonStyle();
    sub_100015598(&qword_100021030, (void (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label);
    sub_100015598(&qword_100021038, (void (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle);
    swift_getOpaqueTypeConformance2();
    sub_100007560(&qword_100021070, &qword_100021078);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021068);
  }
  return result;
}

uint64_t sub_100015ABC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.pathComponents.getter()
{
  return URL.pathComponents.getter();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.deletingLastPathComponent()()
{
  return URL.deletingLastPathComponent()();
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t type metadata accessor for IndexSet.Index()
{
  return type metadata accessor for IndexSet.Index();
}

uint64_t type metadata accessor for IndexSet()
{
  return type metadata accessor for IndexSet();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

Swift::Void __swiftcall ObservableObjectPublisher.send()()
{
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t ProgressView.init<A>(value:total:)()
{
  return ProgressView.init<A>(value:total:)();
}

uint64_t ProgressView<>.init<>()()
{
  return ProgressView<>.init<>()();
}

uint64_t static SceneBuilder.buildBlock<A>(_:)()
{
  return static SceneBuilder.buildBlock<A>(_:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t PlainListStyle.init()()
{
  return PlainListStyle.init()();
}

uint64_t type metadata accessor for PlainListStyle()
{
  return type metadata accessor for PlainListStyle();
}

uint64_t NavigationStack.init<>(root:)()
{
  return NavigationStack.init<>(root:)();
}

uint64_t EnvironmentValues.truncationMode.getter()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t EnvironmentValues.truncationMode.setter()
{
  return EnvironmentValues.truncationMode.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.symbolRenderingMode.getter()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t EnvironmentValues.symbolRenderingMode.setter()
{
  return EnvironmentValues.symbolRenderingMode.setter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t type metadata accessor for NavigationBarItem.TitleDisplayMode()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t static VerticalAlignment.firstTextBaseline.getter()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t static VerticalAlignment.top.getter()
{
  return static VerticalAlignment.top.getter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t static SymbolRenderingMode.palette.getter()
{
  return static SymbolRenderingMode.palette.getter();
}

uint64_t type metadata accessor for SymbolRenderingMode()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t BorderlessButtonStyle.init()()
{
  return BorderlessButtonStyle.init()();
}

uint64_t type metadata accessor for BorderlessButtonStyle()
{
  return type metadata accessor for BorderlessButtonStyle();
}

uint64_t LinearProgressViewStyle.init()()
{
  return LinearProgressViewStyle.init()();
}

uint64_t type metadata accessor for LinearProgressViewStyle()
{
  return type metadata accessor for LinearProgressViewStyle();
}

uint64_t type metadata accessor for ButtonStyleConfiguration.Label()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t ButtonStyleConfiguration.label.getter()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t ButtonStyleConfiguration.isPressed.getter()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t Edge.Set.init(rawValue:)()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Font.subheadline.getter()
{
  return static Font.subheadline.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.Weight.medium.getter()
{
  return static Font.Weight.medium.getter();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t static Font.headline.getter()
{
  return static Font.headline.getter();
}

uint64_t List<>.init(content:)()
{
  return List<>.init(content:)();
}

uint64_t Text.fontWeight(_:)()
{
  return Text.fontWeight(_:)();
}

uint64_t type metadata accessor for Text.TruncationMode()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t Text.monospacedDigit()()
{
  return Text.monospacedDigit()();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.progressViewStyle<A>(_:)()
{
  return View.progressViewStyle<A>(_:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

{
  return View.buttonStyle<A>(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.navigationBarTitle<A>(_:displayMode:)()
{
  return View.navigationBarTitle<A>(_:displayMode:)();
}

uint64_t View.listStyle<A>(_:)()
{
  return View.listStyle<A>(_:)();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t static Color.yellow.getter()
{
  return static Color.yellow.getter();
}

uint64_t static Color.secondary.getter()
{
  return static Color.secondary.getter();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.symbolRenderingMode(_:)()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.wrappedValue.setter()
{
  return Binding.wrappedValue.setter();
}

uint64_t Divider.init()()
{
  return Divider.init()();
}

uint64_t type metadata accessor for Divider()
{
  return type metadata accessor for Divider();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Animation.easeOut(duration:)()
{
  return static Animation.easeOut(duration:)();
}

uint64_t static Animation.easeInOut(duration:)()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
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

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return String.hasSuffix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t StringProtocol.caseInsensitiveCompare<A>(_:)()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t Identifiable<>.id.getter()
{
  return Identifiable<>.id.getter();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend__uuid(void *a1, const char *a2, ...)
{
  return _[a1 _uuid];
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return [a1 addAttributes:range:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 appendAttributedString:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_authInfoRequired(void *a1, const char *a2, ...)
{
  return _[a1 authInfoRequired];
}

id objc_msgSend_browseInfo(void *a1, const char *a2, ...)
{
  return _[a1 browseInfo];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _[a1 category];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_deviceURI(void *a1, const char *a2, ...)
{
  return _[a1 deviceURI];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_iCloudPrinters(void *a1, const char *a2, ...)
{
  return _[a1 iCloudPrinters];
}

id objc_msgSend_initJob_(void *a1, const char *a2, ...)
{
  return [a1 initJob:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localJobID(void *a1, const char *a2, ...)
{
  return _[a1 localJobID];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_printerInfo(void *a1, const char *a2, ...)
{
  return _[a1 printerInfo];
}

id objc_msgSend_printerURI(void *a1, const char *a2, ...)
{
  return _[a1 printerURI];
}

id objc_msgSend_printerURLs(void *a1, const char *a2, ...)
{
  return _[a1 printerURLs];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_setPrinterInfo_(void *a1, const char *a2, ...)
{
  return [a1 setPrinterInfo:];
}

id objc_msgSend_set_uuid_(void *a1, const char *a2, ...)
{
  return [a1 set_uuid:];
}

id objc_msgSend_smallSystemFontSize(void *a1, const char *a2, ...)
{
  return _[a1 smallSystemFontSize];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_updatableState(void *a1, const char *a2, ...)
{
  return _[a1 updatableState];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}