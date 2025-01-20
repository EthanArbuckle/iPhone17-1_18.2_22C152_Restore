uint64_t sub_10000539C()
{
  uint64_t v0;
  id v1;

  v0 = type metadata accessor for Logger();
  sub_1000091C4(v0, qword_100018D48);
  sub_100008F24(v0, (uint64_t)qword_100018D48);
  if (qword_100018D68 != -1) {
    swift_once();
  }
  v1 = (id)qword_100019AF0;
  return Logger.init(_:)();
}

BOOL sub_100005428(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000543C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100005484()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000054B0()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_1000054F4()
{
  if (IOHIDEventGetIntegerValue() == 12 && IOHIDEventGetIntegerValue() == 233) {
    return 0;
  }
  if (IOHIDEventGetIntegerValue() == 12 && IOHIDEventGetIntegerValue() == 234) {
    return 1;
  }
  if (IOHIDEventGetIntegerValue() == 1 && IOHIDEventGetIntegerValue() == 134) {
    return 3;
  }
  if (IOHIDEventGetIntegerValue() == 12 && IOHIDEventGetIntegerValue() == 64) {
    return 2;
  }
  return 5;
}

BOOL sub_1000055EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_100005604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  uint64_t v13 = a1;
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  v12[1] = sub_100008DE4(0, (unint64_t *)&qword_100018FF0);
  *(void *)(v3 + 48) = 0;
  *(void *)(v3 + 56) = 0;
  *(_OWORD *)(v3 + 80) = 0u;
  *(_OWORD *)(v3 + 96) = 0u;
  *(void *)(v3 + 112) = 0;
  static DispatchQoS.unspecified.getter();
  v16 = &_swiftEmptyArrayStorage;
  sub_100008E38(&qword_100018FF8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100008D58(&qword_100019000);
  sub_100008E80(&qword_100019008, &qword_100019000);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v4);
  uint64_t v8 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v9 = v13;
  *(void *)(v3 + 16) = v8;
  *(void *)(v3 + 24) = v9;
  uint64_t v10 = v15;
  *(void *)(v3 + 32) = v14;
  *(void *)(v3 + 40) = v10;
  *(void *)(v3 + 64) = &_swiftEmptySetSingleton;
  *(unsigned char *)(v3 + 72) = 0;
  return v3;
}

void sub_100005890(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>, double a4@<D0>)
{
  uint64_t v39 = a2;
  v36 = a3;
  uint64_t v37 = a1;
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v43 = *(void *)(v5 - 8);
  uint64_t v44 = v5;
  ((void (*)(void))__chkstk_darwin)();
  v41 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = type metadata accessor for DispatchQoS();
  uint64_t v40 = *(void *)(v42 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v38 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchTimeInterval();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v12 = (void *)((char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v10);
  uint64_t v14 = (void *)((char *)v34 - v13);
  uint64_t v45 = type metadata accessor for DispatchTime();
  uint64_t v35 = *(void *)(v45 - 8);
  uint64_t v15 = __chkstk_darwin(v45);
  v17 = (char *)v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)v34 - v18;
  uint64_t v20 = type metadata accessor for OS_dispatch_source.TimerFlags();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  v23 = (char *)v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008DE4(0, &qword_100019010);
  static OS_dispatch_source.TimerFlags.strict.getter();
  uint64_t v24 = static OS_dispatch_source.makeTimerSource(flags:queue:)();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  uint64_t ObjectType = swift_getObjectType();
  static DispatchTime.now()();
  double v26 = a4 * 1000.0;
  if ((~COERCE__INT64(a4 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v26 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v26 < 9.22337204e18)
  {
    *uint64_t v14 = (uint64_t)v26;
    v34[1] = ObjectType;
    v27 = *(void (**)(void *, void, uint64_t))(v9 + 104);
    v27(v14, enum case for DispatchTimeInterval.milliseconds(_:), v8);
    v34[0] = v24;
    + infix(_:_:)();
    v28 = *(void (**)(void *, uint64_t))(v9 + 8);
    v28(v14, v8);
    uint64_t v35 = *(void *)(v35 + 8);
    ((void (*)(char *, uint64_t))v35)(v17, v45);
    v27(v14, enum case for DispatchTimeInterval.never(_:), v8);
    void *v12 = 0;
    v27(v12, enum case for DispatchTimeInterval.nanoseconds(_:), v8);
    uint64_t v29 = v34[0];
    OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)();
    v28(v12, v8);
    v28(v14, v8);
    ((void (*)(char *, uint64_t))v35)(v19, v45);
    aBlock[4] = v37;
    aBlock[5] = v39;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006838;
    aBlock[3] = &unk_100014C18;
    v30 = _Block_copy(aBlock);
    swift_retain();
    v31 = v38;
    static DispatchQoS.unspecified.getter();
    v32 = v41;
    sub_100005E60();
    OS_dispatch_source.setEventHandler(qos:flags:handler:)();
    _Block_release(v30);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v32, v44);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v31, v42);
    swift_release();
    OS_dispatch_source.activate()();
    v33 = v36;
    v36[3] = &type metadata for DispatchSourceTimerWrapper;
    v33[4] = &off_100014F88;
    void *v33 = v29;
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_100005E60()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100005F28(uint64_t a1, Swift::Int a2)
{
  swift_beginAccess();
  sub_1000080D0(&v4, a2);
  swift_endAccess();
  return sub_10000687C();
}

uint64_t sub_100005F90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100005FB8(uint64_t a1, unsigned __int8 a2)
{
  return sub_10000687C();
}

uint64_t sub_10000601C()
{
  uint64_t v1 = v0;
  uint64_t result = sub_1000054F4();
  if (result != 5)
  {
    char v3 = result;
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t isEscapingClosureAtFileLocation = *(void *)(v0 + 16);
    if (IntegerValue)
    {
      uint64_t v6 = swift_allocObject();
      *(void *)(v6 + 16) = v1;
      *(unsigned char *)(v6 + 24) = v3;
      uint64_t v7 = swift_allocObject();
      char v3 = v7;
      *(void *)(v7 + 16) = sub_100009398;
      *(void *)(v7 + 24) = v6;
      v17 = sub_100009628;
      uint64_t v18 = v7;
      uint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 1107296256;
      uint64_t v15 = sub_100005F90;
      uint64_t v16 = &unk_100014DF8;
      uint64_t v8 = _Block_copy(&v13);
      swift_retain();
      swift_retain();
      swift_release();
      dispatch_sync((dispatch_queue_t)isEscapingClosureAtFileLocation, v8);
      _Block_release(v8);
      uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      uint64_t result = swift_release();
      if ((isEscapingClosureAtFileLocation & 1) == 0) {
        return result;
      }
      __break(1u);
    }
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v1;
    *(unsigned char *)(v9 + 24) = v3;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = sub_1000093B4;
    *(void *)(v10 + 24) = v9;
    v17 = sub_100009628;
    uint64_t v18 = v10;
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 1107296256;
    uint64_t v15 = sub_100005F90;
    uint64_t v16 = &unk_100014E70;
    uint64_t v11 = _Block_copy(&v13);
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync((dispatch_queue_t)isEscapingClosureAtFileLocation, v11);
    _Block_release(v11);
    char v12 = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v12) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1000062BC(uint64_t a1)
{
  uint64_t v2 = a1 + 80;
  swift_beginAccess();
  sub_100008F9C(v2, (uint64_t)&v5);
  if (*((void *)&v6 + 1))
  {
    sub_1000090CC((uint64_t)&v5, (uint64_t)v4);
    sub_100009004((uint64_t)&v5);
    sub_100009130(v4, v4[3]);
    swift_getObjectType();
    OS_dispatch_source.cancel()();
    sub_100009174((uint64_t)v4);
  }
  else
  {
    sub_100009004((uint64_t)&v5);
  }
  uint64_t v7 = 0;
  long long v5 = 0u;
  long long v6 = 0u;
  swift_beginAccess();
  sub_100009064((uint64_t)&v5, v2);
  swift_endAccess();
  *(unsigned char *)(a1 + 72) = 0;
  swift_beginAccess();
  *(void *)(a1 + 64) = &_swiftEmptySetSingleton;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000063BC()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v24 = *(void *)(v1 - 8);
  uint64_t v25 = v1;
  __chkstk_darwin();
  char v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v22 = *(void *)(v4 - 8);
  uint64_t v23 = v4;
  __chkstk_darwin();
  long long v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS.QoSClass();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = v0[2];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_100008F5C;
  *(void *)(v12 + 24) = v0;
  v31 = sub_100009628;
  uint64_t v32 = v12;
  aBlock = _NSConcreteStackBlock;
  uint64_t v28 = 1107296256;
  uint64_t v29 = sub_100005F90;
  v30 = &unk_100014D58;
  uint64_t v13 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v11, v13);
  _Block_release(v13);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    uint64_t v16 = v0[6];
    if (v16)
    {
      uint64_t v17 = v0[7];
      sub_100008DE4(0, (unint64_t *)&qword_100018FF0);
      (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for DispatchQoS.QoSClass.userInteractive(_:), v7);
      swift_retain();
      uint64_t v18 = (void *)static OS_dispatch_queue.global(qos:)();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      v31 = (uint64_t (*)())v16;
      uint64_t v32 = v17;
      aBlock = _NSConcreteStackBlock;
      uint64_t v28 = 1107296256;
      uint64_t v29 = sub_100006838;
      v30 = &unk_100014D80;
      v19 = _Block_copy(&aBlock);
      swift_retain();
      static DispatchQoS.unspecified.getter();
      double v26 = &_swiftEmptyArrayStorage;
      sub_100008E38(&qword_100019018, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100008D58(&qword_100019020);
      sub_100008E80((unint64_t *)&qword_100019028, &qword_100019020);
      uint64_t v20 = v25;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v19);

      sub_100009268(v16);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v3, v20);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v23);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_100006838(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_10000687C()
{
  void (*v10)(long long *__return_ptr, uint64_t (*)(), uint64_t);
  void v11[5];
  long long v12;
  long long v13;
  uint64_t v14;

  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchPredicate();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (void *)((char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  long long v6 = *(void **)(v1 + 16);
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  id v7 = v6;
  LOBYTE(v6) = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if (v6)
  {
    Swift::Int v9 = *(void *)(v1 + 24);
    swift_beginAccess();
    if ((sub_100006B00(v9, *(void *)(v1 + 64)) & 1) != 0 && (*(unsigned char *)(v1 + 72) & 1) == 0)
    {
      uint64_t v10 = *(void (**)(long long *__return_ptr, uint64_t (*)(), uint64_t))(v1 + 32);
      swift_retain();
      v10(&v12, sub_1000092E4, v1);
      swift_release();
      sub_1000092E8((uint64_t)&v12, (uint64_t)v11);
      swift_beginAccess();
      sub_100009064((uint64_t)v11, v1 + 80);
      uint64_t result = swift_endAccess();
      *(unsigned char *)(v1 + 72) = 1;
    }
    else
    {
      uint64_t result = sub_100006B00(v9, *(void *)(v1 + 64));
      if ((result & 1) == 0 && *(unsigned char *)(v1 + 72) == 1)
      {
        swift_beginAccess();
        sub_100008F9C(v1 + 80, (uint64_t)&v12);
        if (*((void *)&v13 + 1))
        {
          sub_1000090CC((uint64_t)&v12, (uint64_t)v11);
          sub_100009004((uint64_t)&v12);
          sub_100009130(v11, v11[3]);
          swift_getObjectType();
          OS_dispatch_source.cancel()();
          sub_100009174((uint64_t)v11);
        }
        else
        {
          sub_100009004((uint64_t)&v12);
        }
        uint64_t v14 = 0;
        uint64_t v12 = 0u;
        uint64_t v13 = 0u;
        swift_beginAccess();
        sub_100009064((uint64_t)&v12, v1 + 80);
        uint64_t result = swift_endAccess();
        *(unsigned char *)(v1 + 72) = 0;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Int sub_100006B00(Swift::Int result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  Swift::Int v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  Swift::Int v5 = result + 56;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(result + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v10 = a2 + 56;
  do
  {
LABEL_7:
    if (v8)
    {
      unint64_t v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v12 = v11 | (v4 << 6);
      goto LABEL_25;
    }
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
LABEL_35:
      __break(1u);
      return result;
    }
    if (v13 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v13);
    ++v4;
    if (v14) {
      goto LABEL_24;
    }
    int64_t v4 = v13 + 1;
    if (v13 + 1 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_24;
    }
    int64_t v4 = v13 + 2;
    if (v13 + 2 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_24;
    }
    int64_t v4 = v13 + 3;
    if (v13 + 3 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_24;
    }
    int64_t v15 = v13 + 4;
    if (v15 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v4 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_35;
        }
        if (v4 >= v9) {
          return 1;
        }
        unint64_t v14 = *(void *)(v5 + 8 * v4);
        ++v15;
        if (v14) {
          goto LABEL_24;
        }
      }
    }
    int64_t v4 = v15;
LABEL_24:
    unint64_t v8 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v4 << 6);
LABEL_25:
    Swift::UInt v16 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v12);
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v16);
    uint64_t result = Hasher._finalize()();
    uint64_t v17 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v18 = result & ~v17;
    if (((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
      return 0;
    }
    uint64_t v19 = *(void *)(a2 + 48);
  }
  while (*(unsigned __int8 *)(v19 + v18) == v16);
  uint64_t v20 = ~v17;
  while (1)
  {
    unint64_t v18 = (v18 + 1) & v20;
    if (((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
      return 0;
    }
    if (*(unsigned __int8 *)(v19 + v18) == v16) {
      goto LABEL_7;
    }
  }
}

uint64_t sub_100006CF8()
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_100009268(*(void *)(v0 + 48));
  swift_bridgeObjectRelease();
  sub_100009004(v0 + 80);
  return _swift_deallocClassInstance(v0, 120, 7);
}

uint64_t type metadata accessor for ButtonPressStateMachine()
{
  return self;
}

void *sub_100006D7C()
{
  uint64_t v1 = v0;
  v0[5] = 0;
  swift_unknownObjectWeakInit();
  v0[6] = 0;
  v0[2] = IOHIDEventSystemClientCreate();
  uint64_t v2 = sub_100008CCC((uint64_t)&off_1000149F8);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0x4000000000000000;
  type metadata accessor for ButtonPressStateMachine();
  uint64_t v4 = swift_allocObject();
  sub_100005604(v2, (uint64_t)sub_100008D50, v3);
  v1[3] = v4;
  return v1;
}

void sub_100006E3C()
{
  uint64_t v1 = v0;
  if (qword_100018D40 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008F24(v2, (uint64_t)qword_100018D48);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    Swift::Int v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::Int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Starting to monitor HID events", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  uint64_t v8 = *(void *)(v6 + 48);
  *(void *)(v6 + 48) = sub_100009260;
  *(void *)(v6 + 56) = v7;
  sub_100009268(v8);
  int64_t v9 = CFRunLoopGetCurrent();
  if (v9)
  {
    if (kCFRunLoopDefaultMode)
    {
      uint64_t v10 = v9;
      IOHIDEventSystemClientScheduleWithRunLoop();

      v12[4] = sub_10000709C;
      v12[5] = 0;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 1107296256;
      void v12[2] = sub_100007558;
      v12[3] = &unk_100014CB8;
      unint64_t v11 = _Block_copy(v12);
      swift_retain();
      IOHIDEventSystemClientRegisterEventBlock();
      _Block_release(v11);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_10000702C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    uint64_t result = swift_release();
    if (Strong)
    {
      sub_1000104A8();
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

void sub_10000709C(uint64_t a1)
{
  if (IOHIDEventGetSenderID() != 0x8000000817319375 && a1)
  {
    swift_retain();
    swift_retain();
    sub_10000601C();
    swift_release();
    if (IOHIDEventGetType() == 11)
    {
      uint64_t v2 = *(void **)(a1 + 48);
      if (v2)
      {
        [v2 invalidate];
      }
      else
      {
        if (qword_100018D40 != -1) {
          swift_once();
        }
        uint64_t v3 = type metadata accessor for Logger();
        sub_100008F24(v3, (uint64_t)qword_100018D48);
        os_log_type_t v4 = Logger.logObject.getter();
        os_log_type_t v5 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v4, v5))
        {
          uint64_t v6 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v6 = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, v5, "Notifying delegate that user interaction (non-synthetic events) began.", v6, 2u);
          swift_slowDealloc();
        }

        if (swift_unknownObjectWeakLoadStrong())
        {
          sub_10000FFC4();
          swift_unknownObjectRelease();
        }
      }
      uint64_t v7 = self;
      uint64_t v8 = swift_allocObject();
      swift_weakInit();
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = v8;
      *(void *)(v9 + 24) = 0x4008000000000000;
      v13[4] = sub_1000092B0;
      v13[5] = v9;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 1107296256;
      v13[2] = sub_10000A44C;
      v13[3] = &unk_100014D08;
      uint64_t v10 = _Block_copy(v13);
      swift_release();
      id v11 = [v7 scheduledTimerWithTimeInterval:0 repeats:v10 block:3.0];
      _Block_release(v10);
      unint64_t v12 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v11;
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
}

void sub_100007338()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    if (qword_100018D40 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100008F24(v2, (uint64_t)qword_100018D48);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v5 = 134217984;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Timer fired, notifying delegate that there's been no user interaction for %f seconds.", v5, 0xCu);
      swift_slowDealloc();
    }

    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_1000100F0();
      swift_unknownObjectRelease();
    }
    uint64_t v6 = *(NSObject **)(v1 + 48);
    *(void *)(v1 + 48) = 0;
    swift_release();
  }
  else
  {
    if (qword_100018D40 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_100008F24(v7, (uint64_t)qword_100018D48);
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v8, "Timer fired, but manager is deallocated so doing nothing.", v9, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_100007558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, id))(a1 + 32);
  swift_retain();
  id v10 = a5;
  v9(a2, a3, a4, v10);
  swift_release();
}

uint64_t sub_1000075E8()
{
  uint64_t v1 = v0;
  if (qword_100018D40 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008F24(v2, (uint64_t)qword_100018D48);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Turning off HID event monitor", v5, 2u);
    swift_slowDealloc();
  }

  IOHIDEventSystemClientUnregisterEventBlock();
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = *(NSObject **)(v6 + 16);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_100008F5C;
  *(void *)(v8 + 24) = v6;
  v11[4] = sub_100008F74;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100005F90;
  v11[3] = &unk_100014C68;
  uint64_t v9 = _Block_copy(v11);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v7, v9);
  _Block_release(v9);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v7) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000077EC()
{
  swift_release();
  sub_1000092BC(v0 + 32);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for EventManager()
{
  return self;
}

__n128 sub_100007860(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for IOHIDEventSystemClient(uint64_t a1)
{
}

unsigned char *initializeBufferWithCopyOfBuffer for Button(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ButtonPressStateMachine.State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ButtonPressStateMachine.State(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x100007A00);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100007A28(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100007A34(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ButtonPressStateMachine.State()
{
  return &type metadata for ButtonPressStateMachine.State;
}

uint64_t getEnumTagSinglePayload for Button(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Button(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x100007BACLL);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

unsigned char *sub_100007BD4(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Button()
{
  return &type metadata for Button;
}

unint64_t sub_100007BF0()
{
  unint64_t result = qword_100018FE0;
  if (!qword_100018FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018FE0);
  }
  return result;
}

unint64_t sub_100007C48()
{
  unint64_t result = qword_100018FE8;
  if (!qword_100018FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018FE8);
  }
  return result;
}

uint64_t sub_100007C9C(uint64_t a1, uint64_t a2)
{
  return sub_100007E08(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100007CB4(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100007D2C(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100007DAC@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100007DF0(uint64_t a1, uint64_t a2)
{
  return sub_100007E08(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100007E08(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100007E4C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100007EA0()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100007F14()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100007FA0@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100007FE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100008014(uint64_t a1)
{
  uint64_t v2 = sub_100008E38(&qword_1000190D8, type metadata accessor for Key);
  uint64_t v3 = sub_100008E38(&qword_1000190E0, type metadata accessor for Key);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000080D0(unsigned char *a1, Swift::Int a2)
{
  uint64_t v5 = *v2;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a2);
  Swift::Int v6 = Hasher._finalize()();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_10000849C(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(unsigned __int8 *)(v9 + v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(unsigned __int8 *)(v9 + v8) != a2);
  }
  uint64_t result = 0;
  LOBYTE(a2) = *(unsigned char *)(*(void *)(*v2 + 48) + v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_1000081F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100008D58(&qword_100019038);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    Swift::Int v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *Swift::Int v6 = -1 << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      Swift::UInt v18 = *(unsigned __int8 *)(*(void *)(v2 + 48) + v14);
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v18);
      uint64_t result = Hasher._finalize()();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_10000849C(Swift::Int result, unint64_t a2, char a3)
{
  Swift::UInt v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1000081F0();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (Swift::Int)sub_1000085EC();
      goto LABEL_14;
    }
    sub_100008780();
  }
  uint64_t v8 = *v3;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v5);
  uint64_t result = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(unsigned __int8 *)(v10 + a2) == v5)
    {
LABEL_13:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(unsigned __int8 *)(v10 + a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v12 + 48) + a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *sub_1000085EC()
{
  uint64_t v1 = v0;
  sub_100008D58(&qword_100019038);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100008780()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100008D58(&qword_100019038);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    Swift::UInt v18 = *(unsigned __int8 *)(*(void *)(v2 + 48) + v14);
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v18);
    uint64_t result = Hasher._finalize()();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000089FC(unsigned __int8 a1)
{
  uint64_t v3 = *v1;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Swift::Int v4 = Hasher._finalize()();
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = v4 & ~v5;
  if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 6;
  }
  uint64_t v7 = *(void *)(v3 + 48);
  if (*(unsigned __int8 *)(v7 + v6) != a1)
  {
    uint64_t v8 = ~v5;
    do
    {
      unint64_t v6 = (v6 + 1) & v8;
      if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        return 6;
      }
    }
    while (*(unsigned __int8 *)(v7 + v6) != a1);
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v1;
  uint64_t v13 = *v1;
  *uint64_t v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1000085EC();
    uint64_t v10 = v13;
  }
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(v10 + 48) + v6);
  sub_100008B20(v6);
  *uint64_t v1 = v13;
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_100008B20(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::UInt v10 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v6);
        Hasher.init(_seed:)();
        Hasher._combine(_:)(v10);
        unint64_t v11 = Hasher._finalize()() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          uint64_t v13 = (unsigned char *)(v12 + v2);
          unint64_t v14 = (unsigned char *)(v12 + v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *uint64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_100008CCC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_100008ED0();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (unsigned __int8 *)(a1 + 32);
    do
    {
      unsigned int v5 = *v4++;
      sub_1000080D0(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_100008D40()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100008D50(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  sub_100005890(a1, a2, a3, *(double *)(v3 + 16));
}

uint64_t sub_100008D58(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008D9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008DE4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100008E20(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008E30()
{
  return swift_release();
}

uint64_t sub_100008E38(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100008E80(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008D9C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100008ED0()
{
  unint64_t result = qword_100019030;
  if (!qword_100019030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019030);
  }
  return result;
}

uint64_t sub_100008F24(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100008F5C()
{
  return sub_1000062BC(v0);
}

uint64_t sub_100008F64()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008F74()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100008F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008D58(&qword_100019040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009004(uint64_t a1)
{
  uint64_t v2 = sub_100008D58(&qword_100019040);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009064(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008D58(&qword_100019040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000090CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_100009130(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100009174(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *sub_1000091C4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100009228()
{
  swift_weakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100009260()
{
  return sub_10000702C();
}

uint64_t sub_100009268(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100009278()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000092B0()
{
}

uint64_t sub_1000092BC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000092E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008D58(&qword_100019040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009350()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100009360()
{
  swift_release();
  return _swift_deallocObject(v0, 25, 7);
}

uint64_t sub_100009398()
{
  return sub_100005F28(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24));
}

uint64_t sub_1000093A4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000093B4()
{
  return sub_100005FB8(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_1000093C0()
{
  return _swift_deallocObject(v0, 32, 7);
}

void type metadata accessor for BSInterfaceOrientation(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t sub_1000093F8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_10000942C(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100009438(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100009458(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for DispatchSourceTimerWrapper()
{
  return &type metadata for DispatchSourceTimerWrapper;
}

uint64_t sub_1000094A8()
{
  return sub_100008E38(&qword_1000190C0, type metadata accessor for Key);
}

uint64_t sub_1000094F0()
{
  return sub_100008E38(&qword_1000190C8, type metadata accessor for Key);
}

uint64_t sub_100009538()
{
  return sub_100008E38(&qword_1000190D0, type metadata accessor for Key);
}

uint64_t sub_100009580(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000095A0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_1000095DC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

CGFloat sub_10000966C(char *a1, CGFloat a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  v133.origin.double x = a4;
  v133.origin.CGFloat y = a5;
  v133.size.CGFloat width = a6;
  v133.size.CGFloat height = a7;
  CGFloat v15 = fabs(fmin((CGRectGetWidth(v133) - a2) * 0.5, 50.0));
  v134.origin.double x = a4;
  v134.origin.CGFloat y = a5;
  v134.size.CGFloat width = a6;
  v134.size.CGFloat height = a7;
  CGRect v135 = CGRectInset(v134, v15, v15);
  double x = v135.origin.x;
  CGFloat y = v135.origin.y;
  CGFloat width = v135.size.width;
  CGFloat height = v135.size.height;
  if (CGRectGetWidth(v135) < a2) {
    return x;
  }
  v136.origin.double x = x;
  v136.origin.CGFloat y = y;
  v136.size.CGFloat width = width;
  v136.size.CGFloat height = height;
  if (CGRectGetHeight(v136) < a3) {
    return x;
  }
  sub_100009FFC((uint64_t)a1, (uint64_t)&v131);
  if (v132)
  {
    CGFloat v20 = x;
    CGFloat v21 = y;
    goto LABEL_7;
  }
  v137.size.CGFloat width = width;
  CGFloat v22 = v131.origin.x;
  CGFloat v23 = v131.origin.y;
  v137.origin.double x = x;
  CGFloat v24 = v131.size.height;
  CGFloat v20 = v137.origin.x;
  v137.origin.CGFloat y = y;
  CGFloat rect = v131.size.width;
  CGFloat v126 = v137.size.width;
  v137.size.CGFloat height = height;
  if (CGRectEqualToRect(v137, v131))
  {
    CGFloat v21 = y;
    CGFloat width = v126;
LABEL_7:
    v138.origin.double x = v20;
    v138.origin.CGFloat y = v21;
    v138.size.CGFloat width = width;
    v138.size.CGFloat height = height;
    double v25 = CGRectGetWidth(v138);
    v139.origin.double x = v20;
    v139.origin.CGFloat y = v21;
    v139.size.CGFloat width = width;
    v139.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v139);
    double v27 = MinX;
    if (v25 <= a2)
    {
      CGFloat v122 = MinX;
    }
    else
    {
      v140.origin.double x = v20;
      v140.origin.CGFloat y = v21;
      v140.size.CGFloat width = width;
      v140.size.CGFloat height = height;
      double v31 = CGRectGetMaxX(v140) - a2;
      if (v27 > v31)
      {
        __break(1u);
LABEL_67:
        __break(1u);
        goto LABEL_68;
      }
      sub_10000A2B0(v28, v27, v31);
      CGFloat v122 = v32;
    }
    v141.origin.double x = v20;
    v141.origin.CGFloat y = v21;
    v141.size.CGFloat width = width;
    v141.size.CGFloat height = height;
    double v25 = CGRectGetHeight(v141);
    v142.origin.double x = v20;
    v142.origin.CGFloat y = v21;
    v142.size.CGFloat width = width;
    v142.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v142);
    if (v25 <= a3) {
      return v122;
    }
    v143.origin.double x = v20;
    v143.origin.CGFloat y = v21;
    v143.size.CGFloat width = width;
    v143.size.CGFloat height = height;
    double v35 = CGRectGetMaxY(v143) - a3;
    if (MinY <= v35)
    {
      sub_10000A2B0(v34, MinY, v35);
      return v122;
    }
    goto LABEL_67;
  }
  v144.origin.double x = v20;
  v144.origin.CGFloat y = y;
  v167.size.CGFloat width = rect;
  v144.size.CGFloat width = v126;
  v144.size.CGFloat height = height;
  v167.origin.double x = v22;
  v167.origin.CGFloat y = v23;
  v167.size.CGFloat height = v24;
  if (!CGRectContainsRect(v144, v167)) {
    return v20;
  }
  double v118 = a2;
  double v117 = a3;
  double v123 = v22;
  CGFloat v124 = v23;
  v145.origin.double x = v22;
  v145.origin.CGFloat y = v23;
  v145.size.CGFloat width = rect;
  CGFloat v121 = v24;
  v145.size.CGFloat height = v24;
  double v37 = CGRectGetMinX(v145);
  v146.origin.double x = v20;
  v146.origin.CGFloat y = y;
  v146.size.CGFloat width = v126;
  v146.size.CGFloat height = height;
  CGFloat v38 = v37 - CGRectGetMinX(v146);
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v147.origin.double x = v20;
  v147.origin.CGFloat y = y;
  v147.size.CGFloat width = v126;
  v147.size.CGFloat height = height;
  CGRectDivide(v147, &slice, &remainder, v38, CGRectMinXEdge);
  CGFloat v39 = slice.origin.x;
  CGFloat v40 = slice.size.width;
  double v25 = slice.size.height;
  CGFloat height = remainder.origin.x;
  a3 = remainder.origin.y;
  CGFloat v41 = remainder.size.width;
  CGFloat v119 = remainder.size.height;
  CGFloat v115 = slice.origin.y;
  IsEmptCGFloat y = CGRectIsEmpty(slice);
  CGFloat v43 = rect;
  CGFloat v122 = v20;
  CGFloat v126 = v41;
  if (IsEmpty)
  {
    CGFloat v44 = a3;
    a1 = (char *)&_swiftEmptyArrayStorage;
    double v45 = v123;
    CGFloat v46 = v124;
    CGFloat v20 = v121;
  }
  else
  {
    v148.origin.double x = v39;
    CGFloat width = v115;
    v148.origin.CGFloat y = v115;
    v148.size.CGFloat width = v40;
    v148.size.CGFloat height = v25;
    CGFloat v20 = v121;
    if (CGRectGetWidth(v148) >= v118)
    {
      CGFloat v113 = v39;
      CGFloat v114 = v40;
      v149.origin.double x = v39;
      v149.origin.CGFloat y = v115;
      v149.size.CGFloat width = v40;
      v149.size.CGFloat height = v25;
      if (CGRectGetHeight(v149) >= v117)
      {
        a1 = sub_10000A1A0(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
        unint64_t v7 = *((void *)a1 + 2);
        unint64_t v30 = *((void *)a1 + 3);
        int64_t v29 = v7 + 1;
        if (v7 < v30 >> 1)
        {
LABEL_24:
          double v45 = v123;
          CGFloat v46 = v124;
          CGFloat v43 = rect;
          CGFloat v44 = a3;
          *((void *)a1 + 2) = v29;
          v47 = &a1[32 * v7];
          *((CGFloat *)v47 + 4) = v113;
          *((CGFloat *)v47 + 5) = width;
          *((CGFloat *)v47 + 6) = v114;
          *((double *)v47 + 7) = v25;
          goto LABEL_25;
        }
LABEL_68:
        int64_t v112 = v29;
        v108 = sub_10000A1A0((char *)(v30 > 1), v29, 1, a1);
        int64_t v29 = v112;
        a1 = v108;
        goto LABEL_24;
      }
    }
    CGFloat v44 = a3;
    a1 = (char *)&_swiftEmptyArrayStorage;
    double v45 = v123;
    CGFloat v46 = v124;
    CGFloat v43 = rect;
  }
LABEL_25:
  CGFloat v48 = v20;
  double v49 = CGRectGetMinY(*(CGRect *)(&v43 - 2));
  v150.origin.double x = height;
  v150.origin.CGFloat y = v44;
  v150.size.CGFloat width = v126;
  v150.size.CGFloat height = v119;
  CGFloat v50 = v49 - CGRectGetMinY(v150);
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v151.origin.double x = height;
  v151.origin.CGFloat y = v44;
  v151.size.CGFloat width = v126;
  v151.size.CGFloat height = v119;
  CGRectDivide(v151, &slice, &remainder, v50, CGRectMinYEdge);
  CGFloat v51 = slice.origin.x;
  CGFloat v52 = slice.origin.y;
  CGFloat v54 = slice.size.width;
  CGFloat v53 = slice.size.height;
  CGFloat v55 = remainder.origin.x;
  CGFloat v56 = remainder.origin.y;
  CGFloat v57 = remainder.size.width;
  CGFloat v127 = remainder.size.height;
  if (!CGRectIsEmpty(slice))
  {
    v152.origin.double x = v51;
    v152.origin.CGFloat y = v52;
    v152.size.CGFloat width = v54;
    v152.size.CGFloat height = v53;
    if (CGRectGetWidth(v152) >= v118)
    {
      v153.origin.double x = v51;
      v153.origin.CGFloat y = v52;
      v153.size.CGFloat width = v54;
      v153.size.CGFloat height = v53;
      if (CGRectGetHeight(v153) >= v117)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          a1 = sub_10000A1A0(0, *((void *)a1 + 2) + 1, 1, a1);
        }
        CGFloat v58 = v54;
        unint64_t v60 = *((void *)a1 + 2);
        unint64_t v59 = *((void *)a1 + 3);
        unint64_t v61 = v60 + 1;
        if (v60 >= v59 >> 1)
        {
          v109 = sub_10000A1A0((char *)(v59 > 1), v60 + 1, 1, a1);
          CGFloat v58 = v54;
          unint64_t v61 = v60 + 1;
          a1 = v109;
        }
        *((void *)a1 + 2) = v61;
        v62 = (CGFloat *)&a1[32 * v60];
        v62[4] = v51;
        v62[5] = v52;
        v62[6] = v58;
        v62[7] = v53;
      }
    }
  }
  v154.origin.double x = v55;
  v154.origin.CGFloat y = v56;
  v154.size.CGFloat width = v57;
  v154.size.CGFloat height = v127;
  CGFloat v63 = v55;
  double MaxX = CGRectGetMaxX(v154);
  v155.origin.double x = v123;
  v155.origin.CGFloat y = v124;
  v155.size.CGFloat width = rect;
  v155.size.CGFloat height = v121;
  CGFloat v65 = MaxX - CGRectGetMaxX(v155);
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v156.origin.double x = v63;
  v156.origin.CGFloat y = v56;
  v156.size.CGFloat width = v57;
  v156.size.CGFloat height = v127;
  CGRectDivide(v156, &slice, &remainder, v65, CGRectMaxXEdge);
  CGFloat v66 = slice.origin.x;
  CGFloat v67 = slice.origin.y;
  CGFloat v69 = slice.size.width;
  CGFloat v68 = slice.size.height;
  CGFloat v70 = remainder.origin.x;
  CGFloat v71 = remainder.origin.y;
  CGFloat v72 = remainder.size.width;
  CGFloat v128 = remainder.size.height;
  if (CGRectIsEmpty(slice))
  {
    CGFloat v73 = v121;
    CGFloat v74 = rect;
  }
  else
  {
    v157.origin.double x = v66;
    v157.origin.CGFloat y = v67;
    v157.size.CGFloat width = v69;
    v157.size.CGFloat height = v68;
    CGFloat v75 = CGRectGetWidth(v157);
    CGFloat v76 = v69;
    CGFloat v73 = v121;
    if (v75 >= v118
      && (CGFloat v77 = v66, v78 = v67, v116 = v76, v120 = v68, v79 = v68, CGRectGetHeight(*(CGRect *)(&v76 - 2)) >= v117))
    {
      CGFloat v74 = rect;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        a1 = sub_10000A1A0(0, *((void *)a1 + 2) + 1, 1, a1);
      }
      CGFloat v80 = v120;
      unint64_t v82 = *((void *)a1 + 2);
      unint64_t v81 = *((void *)a1 + 3);
      unint64_t v83 = v82 + 1;
      if (v82 >= v81 >> 1)
      {
        *(void *)&CGFloat v114 = v82 + 1;
        v110 = sub_10000A1A0((char *)(v81 > 1), v82 + 1, 1, a1);
        CGFloat v80 = v120;
        unint64_t v83 = v82 + 1;
        a1 = v110;
      }
      *((void *)a1 + 2) = v83;
      v84 = (CGFloat *)&a1[32 * v82];
      v84[4] = v66;
      v84[5] = v67;
      v84[6] = v116;
      v84[7] = v80;
    }
    else
    {
      CGFloat v74 = rect;
    }
  }
  v158.origin.double x = v70;
  v158.origin.CGFloat y = v71;
  v158.size.CGFloat width = v72;
  v158.size.CGFloat height = v128;
  CGFloat v85 = v72;
  double MaxY = CGRectGetMaxY(v158);
  v159.origin.double x = v123;
  v159.origin.CGFloat y = v124;
  v159.size.CGFloat width = v74;
  v159.size.CGFloat height = v73;
  CGFloat v87 = MaxY - CGRectGetMaxY(v159);
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v160.origin.double x = v70;
  v160.origin.CGFloat y = v71;
  v160.size.CGFloat width = v85;
  v160.size.CGFloat height = v128;
  CGRectDivide(v160, &slice, &remainder, v87, CGRectMaxYEdge);
  CGFloat v88 = slice.origin.x;
  CGFloat v89 = slice.origin.y;
  CGFloat v90 = slice.size.width;
  CGFloat v91 = slice.size.height;
  if (CGRectIsEmpty(slice))
  {
    double x = v122;
  }
  else
  {
    v161.origin.double x = v88;
    v161.origin.CGFloat y = v89;
    v161.size.CGFloat width = v90;
    v161.size.CGFloat height = v91;
    double x = v122;
    if (CGRectGetWidth(v161) >= v118)
    {
      v162.origin.double x = v88;
      v162.origin.CGFloat y = v89;
      v162.size.CGFloat width = v90;
      v162.size.CGFloat height = v91;
      if (CGRectGetHeight(v162) >= v117)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          a1 = sub_10000A1A0(0, *((void *)a1 + 2) + 1, 1, a1);
        }
        unint64_t v93 = *((void *)a1 + 2);
        unint64_t v92 = *((void *)a1 + 3);
        unint64_t v94 = v93 + 1;
        if (v93 >= v92 >> 1)
        {
          v111 = sub_10000A1A0((char *)(v92 > 1), v93 + 1, 1, a1);
          unint64_t v94 = v93 + 1;
          a1 = v111;
        }
        *((void *)a1 + 2) = v94;
        v95 = (CGFloat *)&a1[32 * v93];
        v95[4] = v88;
        v95[5] = v89;
        v95[6] = v90;
        v95[7] = v91;
      }
    }
  }
  uint64_t v96 = *((void *)a1 + 2);
  if (v96)
  {
    uint64_t v97 = 0;
    unint64_t v7 = 1;
    CGFloat v121 = 0.0;
    double v98 = 0.0;
    CGFloat v126 = 0.0;
    CGFloat height = 0.0;
LABEL_54:
    CGFloat v119 = v98;
    v99 = (CGFloat *)&a1[32 * v97 + 56];
    do
    {
      CGFloat v100 = *(v99 - 3);
      CGFloat v101 = *(v99 - 2);
      CGFloat v102 = *(v99 - 1);
      CGFloat v103 = *v99;
      v163.origin.double x = v100;
      v163.origin.CGFloat y = v101;
      v163.size.CGFloat width = v102;
      v163.size.CGFloat height = *v99;
      double v104 = CGRectGetWidth(v163);
      v164.origin.double x = v100;
      v164.origin.CGFloat y = v101;
      v164.size.CGFloat width = v102;
      v164.size.CGFloat height = v103;
      double v105 = CGRectGetHeight(v164);
      double v106 = 0.0;
      if ((v7 & 1) == 0)
      {
        CGFloat v124 = v103;
        CGFloat rect = v102;
        v165.origin.double x = v121;
        v165.origin.CGFloat y = v119;
        v165.size.CGFloat width = v126;
        v165.size.CGFloat height = height;
        double v123 = CGRectGetWidth(v165);
        v166.origin.double x = v121;
        v166.origin.CGFloat y = v119;
        v166.size.CGFloat width = v126;
        v166.size.CGFloat height = height;
        double v106 = v123 * CGRectGetHeight(v166);
      }
      if (v106 < v104 * v105)
      {
        unint64_t v7 = 0;
        CGFloat v121 = v100;
        double v98 = v101;
        CGFloat v126 = v102;
        CGFloat height = v103;
        if (v96 - 1 != v97++) {
          goto LABEL_54;
        }
        swift_bridgeObjectRelease();
        CGFloat v21 = v101;
        CGFloat v20 = v100;
        CGFloat width = v102;
        CGFloat height = v103;
        a3 = v117;
        a2 = v118;
        goto LABEL_7;
      }
      ++v97;
      v99 += 4;
    }
    while (v96 != v97);
    swift_bridgeObjectRelease();
    a3 = v117;
    a2 = v118;
    CGFloat v21 = v119;
    CGFloat v20 = v121;
    double x = v122;
    CGFloat width = v126;
    if ((v7 & 1) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return x;
}

uint64_t sub_100009FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008D58(&qword_1000191B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A064()
{
  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease();
  v0._countAndFlagsBits = Double.description.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 4028716;
  v1._object = (void *)0xE300000000000000;
  String.append(_:)(v1);
  v2._countAndFlagsBits = Double.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0x203A657A6973202CLL;
  v3._object = (void *)0xEA00000000003D77;
  String.append(_:)(v3);
  v4._countAndFlagsBits = Double.description.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 4024364;
  v5._object = (void *)0xE300000000000000;
  String.append(_:)(v5);
  v6._countAndFlagsBits = Double.description.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  return 0x203A6E696769726FLL;
}

char *sub_10000A1A0(char *result, int64_t a2, char a3, char *a4)
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
      sub_100008D58(&qword_1000191B8);
      Swift::UInt v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      Swift::UInt v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000A35C(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A2B0(uint64_t result, double a2, double a3)
{
  if (a2 == a3)
  {
    __break(1u);
    goto LABEL_7;
  }
  double v5 = a3 - a2;
  if ((~COERCE__INT64(a3 - a2) & 0x7FF0000000000000) == 0)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v6 = result;
  __n128 result = swift_stdlib_random();
  if (v5 * ((double)0 * 1.11022302e-16) + a2 == a3) {
    return sub_10000A2B0(v6, a2, a3);
  }
  return result;
}

char *sub_10000A35C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    double v5 = (char *)(a4 + 32 * a1 + 32);
    size_t v6 = 32 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  __n128 result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000A450()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000091C4(v0, qword_1000191C0);
  sub_100008F24(v0, (uint64_t)qword_1000191C0);
  if (qword_100018D68 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100019AF0;
  return Logger.init(_:)();
}

uint64_t sub_10000A4DC(void *a1)
{
  *(unsigned char *)(v1 + 56) = 0;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *(void *)(v1 + 16) = a1;
  id v3 = objc_allocWithZone((Class)FBSOrientationObserver);
  id v4 = a1;
  id v5 = [v3 init];
  size_t v6 = *(void **)(v1 + 48);
  *(void *)(v1 + 48) = v5;

  uint64_t v7 = *(void **)(v1 + 48);
  if (v7)
  {
    v11[4] = sub_10000DE1C;
    v11[5] = v1;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_10000A44C;
    v11[3] = &unk_100015018;
    uint64_t v8 = _Block_copy(v11);
    id v9 = v7;
    swift_retain();
    swift_release();
    [v9 setHandler:v8];

    _Block_release(v8);
  }
  else
  {
  }
  return v1;
}

uint64_t sub_10000A614(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  Swift::UInt v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008DE4(0, (unint64_t *)&qword_100018FF0);
  int64_t v11 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  aBlock[4] = sub_10000DE7C;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006838;
  aBlock[3] = &unk_100015068;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = a1;
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000E5D4(&qword_100019018, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100008D58(&qword_100019020);
  sub_10000DE84();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v17);
}

void sub_10000A8DC(void *a1)
{
  if (qword_100018D60 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008F24(v2, (uint64_t)qword_1000191C0);
  id v3 = a1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 134217984;
    [v3 orientation];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Display orientation changed to %ld", v6, 0xCu);
    swift_slowDealloc();
  }
  else
  {
  }
  sub_10000BB90((uint64_t)[v3 orientation]);
}

void sub_10000AA44(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_10000AAAC()
{
  uint64_t v1 = (void *)v0;
  if (qword_100018D60 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008F24(v2, (uint64_t)qword_1000191C0);
  swift_retain_n();
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v73 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109378;
    LODWORD(v74.m11) = [*(id *)(v0 + 16) displayId];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v5 + 8) = 2080;
    uint64_t v6 = *(void *)(v0 + 48);
    if (v6) {
      id v7 = [*(id *)(v0 + 48) activeInterfaceOrientation];
    }
    else {
      id v7 = 0;
    }
    *(void *)&v74.m11 = v7;
    LOBYTE(v74.m12) = v6 == 0;
    sub_100008D58(&qword_1000193E0);
    uint64_t v8 = String.init<A>(describing:)();
    *(void *)&v74.m11 = sub_10000DF20(v8, v9, &v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Presenting overlay for display %u in orientation %s", (uint8_t *)v5, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  sub_100008D58(&qword_1000193C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100011910;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v11;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v12;
  *(void *)(inited + 120) = &type metadata for Bool;
  *(unsigned char *)(inited + 96) = 1;
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 136) = v13;
  *(void *)(inited + 168) = &type metadata for Bool;
  *(unsigned char *)(inited + 144) = 1;
  *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 184) = v14;
  *(void *)(inited + 216) = &type metadata for Bool;
  *(unsigned char *)(inited + 192) = 1;
  *(void *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 232) = v15;
  uint64_t v16 = *(void **)(v0 + 16);
  unsigned int v17 = [v16 displayId];
  *(void *)(inited + 264) = &type metadata for UInt32;
  *(_DWORD *)(inited + 240) = v17;
  unint64_t v18 = sub_10000B560(inited);
  uint64_t v19 = self;
  [v19 begin];
  CGFloat v20 = self;
  sub_10000B7C8(v18);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v22 = [v20 remoteContextWithOptions:isa];

  if (v22)
  {
    id v23 = v22;
    swift_bridgeObjectRetain();
    CGFloat v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    id v71 = v16;
    id v72 = v19;
    CGFloat v69 = v23;
    id v70 = v22;
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      *(void *)&v74.m11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136446466;
      id v27 = v23;
      id v28 = [v27 description];
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v31 = v30;

      uint64_t v73 = sub_10000DF20(v29, v31, (uint64_t *)&v74);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v32 = Dictionary.description.getter();
      unint64_t v34 = v33;
      swift_bridgeObjectRelease();
      uint64_t v35 = v32;
      uint64_t v16 = v71;
      uint64_t v73 = sub_10000DF20(v35, v34, (uint64_t *)&v74);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Got remote context %{public}s with options %{public}s", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v39 = [objc_allocWithZone((Class)CALayer) init];
    [v39 setDisableUpdateMask:32];
    id v40 = [v16 currentMode];
    id v41 = [v40 preferredScale];

    double v42 = (double)(uint64_t)v41;
    [v16 bounds];
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    objc_msgSend(v39, "setBounds:", 0.0, 0.0, v47 / v42, v49 / v42);
    v75.origin.double x = v44;
    v75.origin.CGFloat y = v46;
    v75.size.CGFloat width = v48;
    v75.size.CGFloat height = v50;
    double MidX = CGRectGetMidX(v75);
    v76.origin.double x = v44;
    v76.origin.CGFloat y = v46;
    v76.size.CGFloat width = v48;
    v76.size.CGFloat height = v50;
    objc_msgSend(v39, "setPosition:", MidX, CGRectGetMidY(v76));
    CATransform3DMakeScale(&v74, (double)(uint64_t)v41, (double)(uint64_t)v41, 1.0);
    [v39 setTransform:&v74];
    [v39 setContentsScale:(double)(uint64_t)v41];
    [v39 bounds];
    CGFloat v52 = Logger.logObject.getter();
    os_log_type_t v53 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v52, v53))
    {
      CGFloat v54 = (uint8_t *)swift_slowAlloc();
      *(void *)&v74.m11 = swift_slowAlloc();
      *(_DWORD *)CGFloat v54 = 136315138;
      uint64_t v55 = sub_10000A064();
      uint64_t v73 = sub_10000DF20(v55, v56, (uint64_t *)&v74);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v52, v53, "Display %s", v54, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    id v57 = [objc_allocWithZone((Class)CALayer) init];
    [v57 setContentsScale:v42];
    CGFloat v58 = (void *)v1[4];
    v1[4] = v57;
    id v59 = v57;

    id v60 = [self standardUserDefaults];
    NSString v61 = String._bridgeToObjectiveC()();
    unsigned __int8 v62 = [v60 BOOLForKey:v61];

    if ((v62 & 1) == 0) {
      [v59 setDisableUpdateMask:18];
    }
    [v39 bounds];
    objc_msgSend(v59, "setFrame:");
    [v39 addSublayer:v59];
    CGFloat v63 = (void *)v1[6];
    if (v63) {
      uint64_t v64 = (uint64_t)[v63 activeInterfaceOrientation];
    }
    else {
      uint64_t v64 = 1;
    }
    sub_10000BB90(v64);
    [v69 setLayer:v39];
    [v72 commit];
    [v72 flush];
    CGFloat v65 = (void *)v1[3];
    v1[3] = v70;
    CGFloat v66 = v69;

    swift_retain();
    v36 = Logger.logObject.getter();
    os_log_type_t v67 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v36, v67))
    {
      CGFloat v68 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)CGFloat v68 = 67109120;
      LODWORD(v74.m11) = [v71 displayId];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v36, v67, "Finished presenting overlay for display %u", v68, 8u);
      swift_slowDealloc();
    }
    else
    {

      swift_release();
      v36 = v66;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v36, v37))
    {
      CGFloat v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)CGFloat v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Failed to create remote CAContext, Automation Mode may be enabled but not indicated by UI.", v38, 2u);
      swift_slowDealloc();
    }
  }
}

unint64_t sub_10000B560(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008D58(&qword_1000193D0);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10000F2D4(v6, (uint64_t)&v15, &qword_1000193D8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000E61C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000E728(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10000B698(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008D58(&qword_1000193B0);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10000F2D4(v6, (uint64_t)&v13, &qword_1000193B8);
    uint64_t v7 = v13;
    unint64_t result = sub_10000E694(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_10000E728(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10000B7C8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100008D58(&qword_1000193E8);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    long long v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_10000E1B0(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_10000E728(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_10000E728(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_10000E728(v36, v37);
    sub_10000E728(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_10000E728(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_10000F338();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_10000BB90(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + 32);
  if (v2)
  {
    CGFloat v3 = 0.0;
    if ((unint64_t)(a1 - 2) <= 2) {
      CGFloat v3 = dbl_100011988[a1 - 2];
    }
    id v4 = v2;
    CATransform3DMakeRotation(&v25, v3, 0.0, 0.0, -1.0);
    CGFloat m11 = v25.m11;
    CGFloat m12 = v25.m12;
    CGFloat m13 = v25.m13;
    CGFloat m14 = v25.m14;
    CGFloat m21 = v25.m21;
    CGFloat m22 = v25.m22;
    CGFloat m23 = v25.m23;
    CGFloat m24 = v25.m24;
    CGFloat m31 = v25.m31;
    CGFloat m32 = v25.m32;
    CGFloat m33 = v25.m33;
    CGFloat m34 = v25.m34;
    CGFloat m41 = v25.m41;
    CGFloat m42 = v25.m42;
    CGFloat m43 = v25.m43;
    CGFloat m44 = v25.m44;
    int64_t v13 = *(void **)(v1 + 40);
    if (v13)
    {
      id v14 = v13;
      v25.CGFloat m11 = m11;
      v25.CGFloat m12 = m12;
      v25.CGFloat m13 = m13;
      v25.CGFloat m14 = m14;
      v25.CGFloat m21 = m21;
      v25.CGFloat m22 = m22;
      v25.CGFloat m23 = m23;
      v25.CGFloat m24 = m24;
      v25.CGFloat m31 = m31;
      v25.CGFloat m32 = m32;
      v25.CGFloat m33 = m33;
      v25.CGFloat m34 = m34;
      v25.CGFloat m41 = m41;
      v25.CGFloat m42 = m42;
      v25.CGFloat m43 = m43;
      v25.CGFloat m44 = m44;
      [v14 setSublayerTransform:&v25];
      [v14 setNeedsLayout];
    }
    else
    {
      id v15 = [objc_allocWithZone((Class)type metadata accessor for OverlayLayer()) init];
      [v4 contentsScale];
      objc_msgSend(v15, "setContentsScale:");
      v25.CGFloat m11 = m11;
      v25.CGFloat m12 = m12;
      v25.CGFloat m13 = m13;
      v25.CGFloat m14 = m14;
      v25.CGFloat m21 = m21;
      v25.CGFloat m22 = m22;
      v25.CGFloat m23 = m23;
      v25.CGFloat m24 = m24;
      v25.CGFloat m31 = m31;
      v25.CGFloat m32 = m32;
      v25.CGFloat m33 = m33;
      v25.CGFloat m34 = m34;
      v25.CGFloat m41 = m41;
      v25.CGFloat m42 = m42;
      v25.CGFloat m43 = m43;
      v25.CGFloat m44 = m44;
      [v15 setSublayerTransform:&v25];
      id v16 = v15;
      [v4 bounds];
      objc_msgSend(v16, "setFrame:");

      [v16 setNeedsLayout];
      [v4 addSublayer:v16];

      id v4 = *(id *)(v1 + 40);
      *(void *)(v1 + 40) = v16;
    }
  }
}

id sub_10000BDC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init()();
  swift_retain();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    int64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v8 = 67109120;
    v11[3] = [*(id *)(v1 + 16) displayId];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Invalidating Automation Mode UI overlay for display %u.", v8, 8u);
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  unint64_t v9 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;

  return [*(id *)(v1 + 48) invalidate];
}

uint64_t sub_10000BF8C()
{
  return _swift_deallocClassInstance(v0, 57, 7);
}

uint64_t type metadata accessor for Overlay()
{
  return self;
}

char *sub_10000C008()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textPosition];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  v1[16] = 1;
  *(void *)&v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer] = 0;
  v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive] = 0;
  uint64_t v2 = OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeColor;
  uint64_t v3 = self;
  uint64_t v4 = v0;
  id v5 = [v3 blackColor];
  id v6 = [v5 colorWithAlphaComponent:0.4];

  *(void *)&v0[v2] = v6;
  *(void *)&v4[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeWidth] = 0xBFF0000000000000;
  id v7 = [objc_allocWithZone((Class)CATextLayer) init];
  *(void *)&v4[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel] = v7;
  [v7 setWrapped:1];
  [v7 setAlignmentMode:kCAAlignmentCenter];
  id v8 = [objc_allocWithZone((Class)CATextLayer) init];
  *(void *)&v4[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel] = v8;
  [v8 setWrapped:1];
  id v9 = v8;
  [v9 setAlignmentMode:kCAAlignmentCenter];

  v21.receiver = v4;
  v21.super_class = (Class)type metadata accessor for OverlayLayer();
  uint64_t v10 = (char *)objc_msgSendSuper2(&v21, "init");
  uint64_t v11 = *(void *)&v10[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel];
  unint64_t v12 = v10;
  [v12 addSublayer:v11];
  [v12 addSublayer:*(void *)&v12[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel]];
  int64_t v13 = self;
  double v14 = sub_10000F044();
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v20[4] = sub_10000F2CC;
  v20[5] = v15;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  v20[2] = sub_10000A44C;
  v20[3] = &unk_100015108;
  id v16 = _Block_copy(v20);
  swift_release();
  id v17 = [v13 scheduledTimerWithTimeInterval:1 repeats:v16 block:v14];

  _Block_release(v16);
  uint64_t v18 = *(void **)&v12[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer];
  *(void *)&v12[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer] = v17;

  return v12;
}

void sub_10000C2D0(void *a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    sub_10000CDBC();
  }
  else
  {
    [a1 invalidate];
  }
}

id sub_10000C388(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textPosition];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  *(void *)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer] = 0;
  v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive] = 0;
  uint64_t v4 = OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeColor;
  id v5 = self;
  id v6 = v1;
  id v7 = [v5 blackColor];
  id v8 = [v7 colorWithAlphaComponent:0.4];

  *(void *)&v1[v4] = v8;
  *(void *)&v6[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeWidth] = 0xBFF0000000000000;
  sub_10000E1B0((uint64_t)a1, (uint64_t)v21);
  id v9 = (objc_class *)type metadata accessor for OverlayLayer();
  if (swift_dynamicCast())
  {
    uint64_t v10 = v20;
    uint64_t v11 = *(void **)&v20[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel];
    *(void *)&v6[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel] = v11;
    unint64_t v12 = *(void **)&v10[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel];
    id v13 = v11;
    id v14 = v12;
  }
  else
  {
    id v15 = [objc_allocWithZone((Class)CATextLayer) init];
    *(void *)&v6[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel] = v15;
    id v14 = [objc_allocWithZone((Class)CATextLayer) init];
  }
  *(void *)&v6[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel] = v14;

  sub_100009130(a1, a1[3]);
  uint64_t v16 = _bridgeAnythingToObjectiveC<A>(_:)();
  v19.receiver = v6;
  v19.super_class = v9;
  id v17 = objc_msgSendSuper2(&v19, "initWithLayer:", v16);
  swift_unknownObjectRelease();
  sub_100009174((uint64_t)a1);
  return v17;
}

id sub_10000C5B0()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer];
  if (v1) {
    [v1 invalidate];
  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for OverlayLayer();
  return objc_msgSendSuper2(&v3, "dealloc");
}

id sub_10000C6D8()
{
  uint64_t v1 = self;
  id v2 = [v1 preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2];
  id v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  if (!v3) {
    id v3 = [v1 preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2];
  }
  id v4 = [self fontWithDescriptor:v3 size:0.0];
  sub_100008D58(&qword_100019398);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100011920;
  *(void *)(inited + 32) = NSFontAttributeName;
  uint64_t v6 = sub_100008DE4(0, &qword_1000193A0);
  *(void *)(inited + 40) = v4;
  *(void *)(inited + 64) = v6;
  *(void *)(inited + 72) = NSForegroundColorAttributeName;
  id v7 = self;
  id v8 = NSFontAttributeName;
  id v9 = v4;
  uint64_t v10 = NSForegroundColorAttributeName;
  id v11 = [v7 whiteColor];
  unint64_t v12 = v11;
  double v13 = 0.85;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive)) {
    double v13 = 0.4;
  }
  id v14 = [v11 colorWithAlphaComponent:v13];

  uint64_t v15 = sub_100008DE4(0, &qword_1000193A8);
  *(void *)(inited + 80) = v14;
  *(void *)(inited + 104) = v15;
  *(void *)(inited + 112) = NSStrokeColorAttributeName;
  uint64_t v16 = *(void **)(v0 + OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeColor);
  *(void *)(inited + 120) = v16;
  *(void *)(inited + 144) = v15;
  *(void *)(inited + 152) = NSStrokeWidthAttributeName;
  *(void *)(inited + 184) = &type metadata for Double;
  *(void *)(inited + 160) = 0xBFF0000000000000;
  id v17 = NSStrokeColorAttributeName;
  id v18 = v16;
  objc_super v19 = NSStrokeWidthAttributeName;
  sub_10000B698(inited);
  id v20 = [self mainBundle];
  v28._object = (void *)0x8000000100012B50;
  v21._object = (void *)0x8000000100012B30;
  v21._countAndFlagsBits = 0xD00000000000001DLL;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v28._countAndFlagsBits = 0xD00000000000001DLL;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v20, v22, v28);

  id v23 = objc_allocWithZone((Class)NSAttributedString);
  NSString v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_10000E5D4(&qword_1000190D8, type metadata accessor for Key);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v26 = [v23 initWithString:v24 attributes:isa];

  return v26;
}

id sub_10000CA54()
{
  uint64_t v1 = self;
  id v2 = [v1 preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline];
  id v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  if (!v3) {
    id v3 = [v1 preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline];
  }
  id v4 = [self fontWithDescriptor:v3 size:0.0];
  sub_100008D58(&qword_100019398);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100011920;
  *(void *)(inited + 32) = NSFontAttributeName;
  uint64_t v6 = sub_100008DE4(0, &qword_1000193A0);
  *(void *)(inited + 40) = v4;
  *(void *)(inited + 64) = v6;
  *(void *)(inited + 72) = NSForegroundColorAttributeName;
  id v7 = self;
  id v8 = NSFontAttributeName;
  id v9 = v4;
  uint64_t v10 = NSForegroundColorAttributeName;
  id v11 = [v7 whiteColor];
  unint64_t v12 = v11;
  double v13 = 0.4;
  if (!*(unsigned char *)(v0 + OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive)) {
    double v13 = 0.5;
  }
  id v14 = [v11 colorWithAlphaComponent:v13];

  uint64_t v15 = sub_100008DE4(0, &qword_1000193A8);
  *(void *)(inited + 80) = v14;
  *(void *)(inited + 104) = v15;
  *(void *)(inited + 112) = NSStrokeColorAttributeName;
  uint64_t v16 = *(void **)(v0 + OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeColor);
  *(void *)(inited + 120) = v16;
  *(void *)(inited + 144) = v15;
  *(void *)(inited + 152) = NSStrokeWidthAttributeName;
  *(void *)(inited + 184) = &type metadata for Double;
  *(void *)(inited + 160) = 0xBFF0000000000000;
  id v17 = NSStrokeColorAttributeName;
  id v18 = v16;
  objc_super v19 = NSStrokeWidthAttributeName;
  sub_10000B698(inited);
  id v20 = [self mainBundle];
  v28._object = (void *)0xE300000000000000;
  v21._object = (void *)0x8000000100012B00;
  v21._countAndFlagsBits = 0xD000000000000025;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v28._countAndFlagsBits = 7104878;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v20, v22, v28);

  id v23 = objc_allocWithZone((Class)NSAttributedString);
  NSString v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_10000E5D4(&qword_1000190D8, type metadata accessor for Key);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v26 = [v23 initWithString:v24 attributes:isa];

  return v26;
}

void sub_10000CDBC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  [v1 bounds];
  CGFloat v56 = v6;
  CGFloat v55 = v7;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = *(double *)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel];
  [*(id *)&v12 bounds];
  double Width = CGRectGetWidth(v61);
  CGFloat v14 = *(double *)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel];
  [*(id *)&v14 bounds];
  double v15 = CGRectGetWidth(v62);
  if (Width <= v15) {
    double Width = v15;
  }
  [*(id *)&v12 bounds];
  double Height = CGRectGetHeight(v63);
  [*(id *)&v14 bounds];
  double v17 = Height + CGRectGetHeight(v64);
  [*(id *)&v12 frame];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  [*(id *)&v14 frame];
  v68.origin.CGFloat x = v26;
  v68.origin.CGFloat y = v27;
  v68.size.CGFloat width = v28;
  v68.size.CGFloat height = v29;
  v65.origin.CGFloat x = v19;
  v65.origin.CGFloat y = v21;
  v65.size.CGFloat width = v23;
  v65.size.CGFloat height = v25;
  CGRect v59 = CGRectUnion(v65, v68);
  char v60 = 0;
  v66.origin.CGFloat x = sub_10000966C((char *)&v59, Width, v17, v56, v55, v9, v11);
  CGFloat x = v66.origin.x;
  CGFloat y = v66.origin.y;
  CGFloat v32 = v66.size.width;
  CGFloat v33 = v66.size.height;
  CGFloat MidX = CGRectGetMidX(v66);
  v67.origin.CGFloat x = x;
  v67.origin.CGFloat y = y;
  v67.size.CGFloat width = v32;
  v67.size.CGFloat height = v33;
  CGFloat MidY = CGRectGetMidY(v67);
  v36 = (CGFloat *)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textPosition];
  CGFloat *v36 = MidX;
  v36[1] = MidY;
  *((unsigned char *)v36 + 16) = 0;
  if (qword_100018D60 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_100008F24(v2, (uint64_t)qword_1000191C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v37, v2);
  CGFloat v38 = v1;
  long long v39 = Logger.logObject.getter();
  os_log_type_t v40 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v39, v40))
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    goto LABEL_9;
  }
  CGFloat v55 = v14;
  CGFloat v56 = v12;
  id v41 = (uint8_t *)swift_slowAlloc();
  aBlock[0] = swift_slowAlloc();
  *(_DWORD *)id v41 = 136315138;
  if (((_BYTE)v36[2] & 1) == 0)
  {
    uint64_t v42 = CGPoint.debugDescription.getter();
    uint64_t v57 = sub_10000DF20(v42, v43, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "Moving Automation Mode text group to %s", v41, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    double v12 = v56;
    CGFloat v14 = v55;
LABEL_9:
    CGFloat v44 = self;
    [v44 begin];
    uint64_t v45 = swift_allocObject();
    *(void *)(v45 + 16) = v38;
    aBlock[4] = (uint64_t)sub_10000DF18;
    aBlock[5] = v45;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100006838;
    aBlock[3] = (uint64_t)&unk_1000150B8;
    CGFloat v46 = _Block_copy(aBlock);
    double v47 = v38;
    swift_release();
    [v44 setCompletionBlock:v46];
    _Block_release(v46);
    id v48 = [objc_allocWithZone((Class)CABasicAnimation) init];
    NSString v49 = String._bridgeToObjectiveC()();
    [v48 setKeyPath:v49];

    Class isa = Double._bridgeToObjectiveC()().super.super.isa;
    [v48 setFromValue:isa];

    Class v51 = Double._bridgeToObjectiveC()().super.super.isa;
    [v48 setToValue:v51];

    [v48 setDuration:0.3];
    [v48 setBeginTime:0.0];
    [*(id *)&v12 setOpacity:0.0];
    [*(id *)&v14 setOpacity:0.0];
    NSString v52 = String._bridgeToObjectiveC()();
    [*(id *)&v12 addAnimation:v48 forKey:v52];

    NSString v53 = String._bridgeToObjectiveC()();
    [*(id *)&v14 addAnimation:v48 forKey:v53];

    [v44 commit];
    return;
  }

  __break(1u);
}

void sub_10000D3EC(char *a1)
{
  uint64_t v2 = self;
  [v2 begin];
  [v2 setDisableActions:1];
  [a1 layoutSublayers];
  [v2 commit];
  [v2 begin];
  id v12 = [objc_allocWithZone((Class)CABasicAnimation) init];
  NSString v3 = String._bridgeToObjectiveC()();
  [v12 setKeyPath:v3];

  Class isa = Double._bridgeToObjectiveC()().super.super.isa;
  [v12 setFromValue:isa];

  Class v5 = Double._bridgeToObjectiveC()().super.super.isa;
  [v12 setToValue:v5];

  [v12 setDuration:0.3];
  [v12 setBeginTime:0.5];
  double v6 = *(void **)&a1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel];
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 addAnimation:v12 forKey:v7];

  double v8 = *(void **)&a1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel];
  NSString v9 = String._bridgeToObjectiveC()();
  [v8 addAnimation:v12 forKey:v9];

  LODWORD(v10) = 1.0;
  [v6 setOpacity:v10];
  LODWORD(v11) = 1.0;
  [v8 setOpacity:v11];
  [v2 commit];
}

id sub_10000D614()
{
  uint64_t v1 = v0;
  id v2 = [self blackColor];
  NSString v3 = v2;
  double v4 = 0.6;
  if (v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive]) {
    double v4 = 0.15;
  }
  id v5 = [v2 colorWithAlphaComponent:v4];

  id v6 = [v5 CGColor];
  [v1 setBackgroundColor:v6];

  NSString v7 = *(void **)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_headlineLabel];
  [v1 contentsScale];
  objc_msgSend(v7, "setContentsScale:");
  id v8 = sub_10000C6D8();
  [v7 setString:v8];

  id v9 = sub_10000C6D8();
  [v1 bounds];
  CGRect v73 = CGRectInset(v72, 6.0, 6.0);
  double width = v73.size.width;
  double height = v73.size.height;
  id v12 = [objc_allocWithZone((Class)NSMutableParagraphStyle) init];
  [v12 setLineBreakMode:0];
  id v13 = [v9 attributesAtIndex:0 effectiveRange:0];
  type metadata accessor for Key(0);
  sub_10000E5D4(&qword_1000190D8, type metadata accessor for Key);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v65 = sub_100008DE4(0, &qword_1000193C0);
  *((void *)&v70 + 1) = v65;
  *(void *)&long long v69 = v12;
  sub_10000E728(&v69, v68);
  CGFloat v14 = NSParagraphStyleAttributeName;
  id v66 = v12;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_10000ECD0(v68, v14, isUniquelyReferenced_nonNull_native);

  swift_bridgeObjectRelease();
  NSString v16 = [v9 string];
  if (!v16)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v16, "boundingRectWithSize:options:attributes:context:", 1, isa, 0, width, height);
  double v19 = v18;
  double v21 = v20;

  id v67 = v7;
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, v19, v21);
  double v22 = *(void **)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_subheadingLabel];
  [v1 contentsScale];
  objc_msgSend(v22, "setContentsScale:");
  id v23 = sub_10000CA54();
  [v22 setString:v23];

  id v24 = sub_10000CA54();
  [v1 bounds];
  CGRect v75 = CGRectInset(v74, 6.0, 6.0);
  double v25 = v75.size.width;
  double v26 = v75.size.height;
  id v27 = [objc_allocWithZone((Class)NSMutableParagraphStyle) init];
  [v27 setLineBreakMode:0];
  id v28 = [v24 attributesAtIndex:0 effectiveRange:0];
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *((void *)&v70 + 1) = v65;
  *(void *)&long long v69 = v27;
  sub_10000E728(&v69, v68);
  CGFloat v29 = v14;
  id v30 = v27;
  char v31 = swift_isUniquelyReferenced_nonNull_native();
  sub_10000ECD0(v68, v29, v31);

  swift_bridgeObjectRelease();
  NSString v32 = [v24 string];
  if (!v32)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v32 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  Class v33 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v32, "boundingRectWithSize:options:attributes:context:", 1, v33, 0, v25, v26);
  double v35 = v34;
  double v37 = v36;

  objc_msgSend(v22, "setBounds:", 0.0, 0.0, v35, v37);
  CGFloat v38 = (double *)&v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textPosition];
  if (v1[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textPosition + 16])
  {
    [v1 bounds];
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    double v47 = v67;
    [v67 bounds];
    double v48 = CGRectGetWidth(v76);
    [v22 bounds];
    double v49 = CGRectGetWidth(v77);
    if (v48 <= v49) {
      double v48 = v49;
    }
    [v67 bounds];
    double v50 = CGRectGetHeight(v78);
    [v22 bounds];
    CGFloat v51 = CGRectGetHeight(v79);
    long long v69 = 0u;
    long long v70 = 0u;
    char v71 = 1;
    v80.origin.CGFloat x = sub_10000966C((char *)&v69, v48, v50 + v51, v40, v42, v44, v46);
    CGFloat x = v80.origin.x;
    CGFloat y = v80.origin.y;
    CGFloat v54 = v80.size.width;
    CGFloat v55 = v80.size.height;
    double MidX = CGRectGetMidX(v80);
    v81.origin.CGFloat x = x;
    v81.origin.CGFloat y = y;
    v81.size.double width = v54;
    v81.size.double height = v55;
    double MidY = CGRectGetMidY(v81);
    double *v38 = MidX;
    v38[1] = MidY;
    *((unsigned char *)v38 + 16) = 0;
  }
  else
  {
    double MidX = *v38;
    double MidY = v38[1];
    double v47 = v67;
  }
  [v47 bounds];
  objc_msgSend(v22, "bounds", CGRectGetWidth(v82));
  objc_msgSend(v47, "bounds", CGRectGetWidth(v83));
  double v58 = CGRectGetHeight(v84);
  [v22 bounds];
  double v59 = (v58 + CGRectGetHeight(v85)) * 0.5;
  [v47 bounds];
  id result = objc_msgSend(v47, "setPosition:", MidX, MidY - (v59 - CGRectGetHeight(v86) * 0.5 + 2.0));
  if ((_BYTE)v38[2])
  {
    __break(1u);
  }
  else
  {
    double v61 = *v38;
    double v62 = v38[1];
    [v47 bounds];
    objc_msgSend(v22, "bounds", CGRectGetWidth(v87));
    objc_msgSend(v47, "bounds", CGRectGetWidth(v88));
    double v63 = CGRectGetHeight(v89);
    [v22 bounds];
    double v64 = (v63 + CGRectGetHeight(v90)) * 0.5;
    [v22 bounds];
    return objc_msgSend(v22, "setPosition:", v61, v62 + v64 - CGRectGetHeight(v91) * 0.5 + 2.0);
  }
  return result;
}

uint64_t type metadata accessor for OverlayLayer()
{
  return self;
}

uint64_t sub_10000DE1C(void *a1)
{
  return sub_10000A614(a1, v1);
}

uint64_t sub_10000DE24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000DE34()
{
  return swift_release();
}

uint64_t sub_10000DE3C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000DE7C()
{
  sub_10000A8DC(*(void **)(v0 + 16));
}

unint64_t sub_10000DE84()
{
  unint64_t result = qword_100019028;
  if (!qword_100019028)
  {
    sub_100008D9C(&qword_100019020);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019028);
  }
  return result;
}

uint64_t sub_10000DEE0()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000DF18()
{
  sub_10000D3EC(*(char **)(v0 + 16));
}

uint64_t sub_10000DF20(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000DFF4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000E1B0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000E1B0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009174((uint64_t)v12);
  return v7;
}

uint64_t sub_10000DFF4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000E20C(a5, a6);
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

uint64_t sub_10000E1B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000E20C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000E2A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000E484(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000E484(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000E2A4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000E41C(v2, 0);
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

void *sub_10000E41C(uint64_t a1, uint64_t a2)
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
  sub_100008D58(&qword_100019390);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000E484(char a1, int64_t a2, char a3, char *a4)
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
    sub_100008D58(&qword_100019390);
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
  id v13 = a4 + 32;
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

uint64_t sub_10000E5D4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10000E61C(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return sub_10000E738(a1, a2, v4);
}

unint64_t sub_10000E694(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return sub_10000E81C(a1, v2);
}

_OWORD *sub_10000E728(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10000E738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
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
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10000E81C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_10000E994(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100008D58(&qword_1000193B0);
  char v35 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v33 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33) {
      break;
    }
    char v18 = (void *)(v5 + 64);
    unint64_t v19 = *(void *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v33) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v34 + 8 * v13);
      if (!v19)
      {
        int64_t v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            int64_t v13 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v33) {
              goto LABEL_34;
            }
            unint64_t v19 = *(void *)(v34 + 8 * v13);
            ++v20;
            if (v19) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v20;
      }
    }
LABEL_21:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    double v21 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
    double v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v16);
    if (v35)
    {
      sub_10000E728(v22, v36);
    }
    else
    {
      sub_10000E1B0((uint64_t)v22, (uint64_t)v36);
      id v23 = v21;
    }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v24 = Hasher._finalize()();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = v24 & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v30 = v27 == v29;
        if (v27 == v29) {
          unint64_t v27 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v11 + 8 * v27);
      }
      while (v31 == -1);
      unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(void *)(*(void *)(v7 + 48) + 8 * v14) = v21;
    uint64_t result = (uint64_t)sub_10000E728(v36, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v18 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v18 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_10000ECD0(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_10000E694((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_10000EE7C();
      goto LABEL_7;
    }
    sub_10000E994(v12, a3 & 1);
    unint64_t v18 = sub_10000E694((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      unint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for Key(0);
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    unint64_t v16 = (_OWORD *)(v15[7] + 32 * v9);
    sub_100009174((uint64_t)v16);
    return sub_10000E728(a1, v16);
  }
LABEL_13:
  sub_10000EE14(v9, (uint64_t)a2, a1, v15);
  return a2;
}

_OWORD *sub_10000EE14(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_10000E728(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

id sub_10000EE7C()
{
  uint64_t v1 = v0;
  sub_100008D58(&qword_1000193B0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_10000E1B0(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_10000E728(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

double sub_10000F044()
{
  uint64_t v0 = self;
  id v1 = [v0 standardUserDefaults];
  sub_100008D58(&qword_1000193C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100011930;
  *(void *)(inited + 32) = 0xD00000000000001DLL;
  *(void *)(inited + 40) = 0x8000000100012BD0;
  *(void *)(inited + 72) = &type metadata for Double;
  *(void *)(inited + 48) = 0x403E000000000000;
  sub_10000B560(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v1 registerDefaults:isa];

  id v4 = [v0 standardUserDefaults];
  NSString v5 = String._bridgeToObjectiveC()();
  [v4 doubleForKey:v5];
  double v7 = v6;

  return v7;
}

void sub_10000F198()
{
  id v1 = &v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textPosition];
  *(void *)id v1 = 0;
  *((void *)v1 + 1) = 0;
  v1[16] = 1;
  *(void *)&v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer] = 0;
  v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive] = 0;
  uint64_t v2 = OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeColor;
  id v3 = [self blackColor];
  id v4 = [v3 colorWithAlphaComponent:0.4];

  *(void *)&v0[v2] = v4;
  *(void *)&v0[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeWidth] = 0xBFF0000000000000;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_10000F294()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000F2CC(void *a1)
{
}

uint64_t sub_10000F2D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100008D58(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000F338()
{
  return swift_release();
}

uint64_t sub_10000F358()
{
  sub_10000F3B8();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_100019AF0 = result;
  return result;
}

unint64_t sub_10000F3B8()
{
  unint64_t result = qword_1000193F0;
  if (!qword_1000193F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000193F0);
  }
  return result;
}

uint64_t sub_10000F3F8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000091C4(v0, qword_1000193F8);
  sub_100008F24(v0, (uint64_t)qword_1000193F8);
  if (qword_100018D68 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100019AF0;
  return Logger.init(_:)();
}

void sub_10000F484()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100008D58(&qword_100019550);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  double v7 = (char *)aBlock - v6;
  sub_100010468();
  uint64_t v8 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v9 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_1000107EC;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000F710;
  aBlock[3] = &unk_1000151A0;
  uint64_t v10 = _Block_copy(aBlock);
  swift_release();
  id v11 = (id)XAMRegisterAutomationModeChangeHandler();
  _Block_release(v10);

  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = type metadata accessor for UUID();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 0, 1, v12);
  sub_1000107F4((uint64_t)v7, (uint64_t)v5);
  uint64_t v13 = v1 + OBJC_IVAR____TtC16AutomationModeUI16AutomationModeUI_observationToken;
  swift_beginAccess();
  sub_10001085C((uint64_t)v5, v13);
  swift_endAccess();
  id v14 = [self currentRunLoop];
  [v14 run];
}

uint64_t sub_10000F6B0(char a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_10000F764(a1 & 1);
    return swift_release();
  }
  return result;
}

uint64_t sub_10000F710(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_10000F764(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v7 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchPredicate();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (uint64_t *)((char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100010468();
  *id v11 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v9 + 104))(v11, enum case for DispatchPredicate.onQueue(_:), v8);
  char v12 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) == 0)
  {
    __break(1u);
    return;
  }
  Logger.init()();
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  BOOL v15 = os_log_type_enabled(v13, v14);
  if (a1)
  {
    if (v15)
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Handling transition to automation mode ENABLED", v16, 2u);
      swift_slowDealloc();
    }

    uint64_t v17 = *(void *)(v2 + 24);
    *(void *)(v2 + 24) = 0;
    if (v17)
    {
      sub_10000BDC4();
      swift_release();
    }
    type metadata accessor for EventManager();
    swift_allocObject();
    *(void *)(v2 + 16) = sub_100006D7C();
    swift_release();
    uint64_t v18 = *(void *)(v2 + 16);
    if (v18)
    {
      *(void *)(v18 + 40) = &off_100015130;
      swift_unknownObjectWeakAssign();
      swift_retain();
      sub_100006E3C();
      swift_release();
    }
    if ((sub_1000105F8() & 1) == 0) {
      goto LABEL_28;
    }
    id v19 = [self mainDisplay];
    if (!v19)
    {
      unint64_t v26 = Logger.logObject.getter();
      os_log_type_t v27 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v26, v27))
      {
        char v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "No main display (CADisplay.main() returned nil).", v28, 2u);
        swift_slowDealloc();
      }

      goto LABEL_28;
    }
    id v20 = v19;
    int64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v23 = 67109120;
      v32[3] = [v20 displayId];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Creating overlay for main display with id %u", v23, 8u);
      swift_slowDealloc();
    }
    else
    {
    }
    type metadata accessor for Overlay();
    swift_allocObject();
    id v29 = v20;
    uint64_t v30 = sub_10000A4DC(v29);
    uint64_t v31 = *(void *)(v2 + 24);
    *(void *)(v2 + 24) = v30;
    swift_retain();
    if (v31)
    {
      sub_10000BDC4();
      swift_release();
    }
    swift_release();
    if (!*(void *)(v2 + 24))
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

      return;
    }
    swift_retain();
    sub_10000AAAC();
  }
  else
  {
    if (v15)
    {
      Swift::Int v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::Int v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Handling transition to automation mode disabled", v24, 2u);
      swift_slowDealloc();
    }

    if (*(void *)(v2 + 16))
    {
      swift_retain();
      sub_1000075E8();
      swift_release();
    }
    *(void *)(v2 + 16) = 0;
    swift_release();
    uint64_t v25 = *(void *)(v2 + 24);
    *(void *)(v2 + 24) = 0;
    if (!v25) {
      goto LABEL_28;
    }
    sub_10000BDC4();
  }
  swift_release();
LABEL_28:
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_10000FC98(uint64_t a1)
{
  if (a1)
  {
    swift_errorRetain();
    if (qword_100018D70 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_100008F24(v1, (uint64_t)qword_1000193F8);
    swift_errorRetain();
    swift_errorRetain();
    oslog = Logger.logObject.getter();
    os_log_type_t v2 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      *(_DWORD *)uint64_t v3 = 136446210;
      swift_getErrorValue();
      uint64_t v4 = Error.localizedDescription.getter();
      sub_10000DF20(v4, v5, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v2, "Request to disable automation mode failed with error %{public}s", v3, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    if (qword_100018D70 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_100008F24(v6, (uint64_t)qword_1000193F8);
    oslog = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v7, "Request to disable automation mode succeeded.", v8, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10000FF58(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_10000FFC4()
{
  uint64_t v1 = v0;
  if (qword_100018D70 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008F24(v2, (uint64_t)qword_1000193F8);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "User did become active, updating UI, fading overlay for main display", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(void *)(v1 + 24);
  if (v6)
  {
    *(unsigned char *)(v6 + 56) = 1;
    os_log_type_t v7 = *(unsigned char **)(v6 + 40);
    if (v7)
    {
      v7[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive] = 1;
      [v7 layoutSublayers];
    }
  }
}

void sub_1000100F0()
{
  uint64_t v1 = v0;
  if (qword_100018D70 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100008F24(v2, (uint64_t)qword_1000193F8);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "User did become inactive, updating UI, darkening overlay for main display", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(void *)(v1 + 24);
  if (v6)
  {
    *(unsigned char *)(v6 + 56) = 0;
    os_log_type_t v7 = *(unsigned char **)(v6 + 40);
    if (v7)
    {
      v7[OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_isUserActive] = 0;
      [v7 layoutSublayers];
    }
  }
}

uint64_t sub_100010218()
{
  swift_release();
  swift_release();
  sub_10001073C(v0 + OBJC_IVAR____TtC16AutomationModeUI16AutomationModeUI_observationToken);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return _swift_deallocClassInstance(v0, v1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for AutomationModeUI();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  uint64_t v4 = v3 + OBJC_IVAR____TtC16AutomationModeUI16AutomationModeUI_observationToken;
  uint64_t v5 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  sub_10000F484();
  swift_release();
  return 0;
}

uint64_t type metadata accessor for AutomationModeUI()
{
  uint64_t result = qword_100019438;
  if (!qword_100019438) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001036C()
{
  return type metadata accessor for AutomationModeUI();
}

void sub_100010374()
{
  sub_100010410();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100010410()
{
  if (!qword_100019448)
  {
    type metadata accessor for UUID();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100019448);
    }
  }
}

unint64_t sub_100010468()
{
  unint64_t result = qword_100018FF0;
  if (!qword_100018FF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100018FF0);
  }
  return result;
}

void sub_1000104A8()
{
  if (qword_100018D70 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100008F24(v0, (uint64_t)qword_1000193F8);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "User invoked gesture for stopping automation.", v3, 2u);
    swift_slowDealloc();
  }

  v5[4] = sub_10000FC98;
  v5[5] = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_10000FF58;
  v5[3] = &unk_100015150;
  uint64_t v4 = _Block_copy(v5);
  XAMDisableAutomationModeWithCompletion();
  _Block_release(v4);
}

uint64_t sub_1000105F8()
{
  id v0 = [self standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  unsigned int v2 = [v0 BOOLForKey:v1];

  if (v2)
  {
    if (qword_100018D70 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_100008F24(v3, (uint64_t)qword_1000193F8);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Overlay displayed for local development because of LocalAutomationModeUIDevelopment user default.", v6, 2u);
      swift_slowDealloc();
    }
  }
  return 1;
}

uint64_t sub_10001073C(uint64_t a1)
{
  uint64_t v2 = sub_100008D58(&qword_100019550);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001079C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000107AC()
{
  return swift_release();
}

uint64_t sub_1000107B4()
{
  swift_weakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000107EC(char a1)
{
  return sub_10000F6B0(a1);
}

uint64_t sub_1000107F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008D58(&qword_100019550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001085C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008D58(&qword_100019550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000108CC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init()()
{
  return Logger.init()();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Logger.init(_:)()
{
  return Logger.init(_:)();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)Double._bridgeToObjectiveC()();
}

uint64_t Double.description.getter()
{
  return Double.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
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

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t static OS_dispatch_source.TimerFlags.strict.getter()
{
  return static OS_dispatch_source.TimerFlags.strict.getter();
}

uint64_t type metadata accessor for OS_dispatch_source.TimerFlags()
{
  return type metadata accessor for OS_dispatch_source.TimerFlags();
}

uint64_t static OS_dispatch_source.makeTimerSource(flags:queue:)()
{
  return static OS_dispatch_source.makeTimerSource(flags:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.cancel()()
{
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
}

uint64_t OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)()
{
  return OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)();
}

uint64_t CGPoint.debugDescription.getter()
{
  return CGPoint.debugDescription.getter();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
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

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
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

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
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

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventGetSenderID()
{
  return _IOHIDEventGetSenderID();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return _IOHIDEventSystemClientCreate();
}

uint64_t IOHIDEventSystemClientRegisterEventBlock()
{
  return _IOHIDEventSystemClientRegisterEventBlock();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return _IOHIDEventSystemClientScheduleWithRunLoop();
}

uint64_t IOHIDEventSystemClientUnregisterEventBlock()
{
  return _IOHIDEventSystemClientUnregisterEventBlock();
}

uint64_t XAMDisableAutomationModeWithCompletion()
{
  return _XAMDisableAutomationModeWithCompletion();
}

uint64_t XAMRegisterAutomationModeChangeHandler()
{
  return _XAMRegisterAutomationModeChangeHandler();
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}