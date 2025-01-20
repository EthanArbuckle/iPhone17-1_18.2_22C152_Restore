uint64_t sub_100004C74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004CA4(unint64_t a1)
{
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [self animationWithKeyPath:v2];

  Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  [v3 setFromValue:isa];

  Class v5 = Int._bridgeToObjectiveC()().super.super.isa;
  [v3 setToValue:v5];

  [v3 setDuration:0.8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v6 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v6) {
      goto LABEL_10;
    }
  }
  if (v6 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v8 = 0;
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v9 = *(id *)(a1 + 8 * v8 + 32);
    }
    v10 = v9;
    ++v8;
    id v11 = [v9 layer];
    NSString v12 = String._bridgeToObjectiveC()();
    [v11 addAnimation:v3 forKey:v12];

    id v13 = [v10 layer];
    LODWORD(v14) = 1.0;
    [v13 setOpacity:v14];
  }
  while (v6 != v8);
LABEL_10:

  return swift_bridgeObjectRelease();
}

uint64_t sub_100004EB0(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100004EF4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_100005444(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

uint64_t ProxCardLayoutCache.deinit()
{
  return v0;
}

uint64_t HeroAssetManager.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t variable initialization expression of ProxCardLayoutCache.extendedHeightDisplayedContentSize()
{
  return 0;
}

uint64_t type metadata accessor for HeroAssetManager()
{
  return self;
}

__n128 initializeWithTake for AppleIDAccountRenewalActionHandler(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10000511C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000513C(uint64_t result, int a2, int a3)
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

void sub_100005178(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100005180@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100005194(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1000051C4(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1000051D8(void *result)
{
  *v1 &= *result;
  return result;
}

BOOL sub_1000051EC(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL sub_100005200(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100005214(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

NSNumber sub_100005228()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100005230(uint64_t a1, uint64_t a2)
{
  uint64_t result = static Int._forceBridgeFromObjectiveC(_:result:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return result;
}

uint64_t sub_100005284(uint64_t a1, uint64_t a2)
{
  char v3 = static Int._conditionallyBridgeFromObjectiveC(_:result:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t sub_1000052DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Int._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

BOOL sub_100005304(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_100005318(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_100005324@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100005330(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_10000533C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_10000534C()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_100005408()
{
  return Int.hashValue.getter(*v0);
}

void sub_100005410()
{
  Hasher._combine(_:)(*v0);
}

uint64_t sub_10000543C(uint64_t a1)
{
  return static Hasher._hash(seed:_:)(a1, *v1);
}

uint64_t sub_100005444(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100006018(&qword_100046000, &qword_100045FF8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100005F50(&qword_100045FF8);
          uint64_t v12 = sub_100005678(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100005FDC(0, &qword_100045FF0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void (*sub_100005678(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100005728(v6, a2, a3);
  return sub_1000056E0;
}

void sub_1000056E0(void *a1)
{
  v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_100005728(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  char v3 = result;
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
    *(void *)char v3 = v4;
    return sub_1000057A8;
  }
  __break(1u);
  return result;
}

void sub_1000057A8(id *a1)
{
}

void sub_1000057B0(void *a1)
{
  id v2 = [a1 contentView];
  id v3 = [v2 titleView];

  if (v3)
  {
    id v4 = v3;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
  }
  id v5 = [a1 contentView];
  id v6 = [v5 auxiliaryViews];

  if (v6)
  {
    sub_100005FDC(0, &qword_100045FF0);
    unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    sub_100004EF4(v7);
    id v8 = [a1 contentView];
    id v9 = [v8 dismissButton];

    if (v9)
    {
      id v10 = v9;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_100005994(void *a1, unsigned __int8 a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  __chkstk_darwin(v4);
  id v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchTime();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  BOOL v13 = (char *)&v32 - v12;
  type metadata accessor for AssetLoader();
  id v14 = sub_1000200C0();
  if (!v14)
  {
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v24 = type metadata accessor for Logger();
    sub_100005EC0(v24, (uint64_t)qword_100048E40);
    v36 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v25, "Unable to load video asset!", v26, 2u);
      swift_slowDealloc();
    }
    goto LABEL_15;
  }
  uint64_t v15 = v14;
  uint64_t v35 = v4;
  v36 = v14;
  id v16 = sub_1000081D4(v15, (a2 ^ 1) & 1);
  sub_100006964(v16, (uint64_t)v15, (a2 ^ 1) & 1, 0, 2);

  if ((a2 ^ 1))
  {
LABEL_15:
    v27 = v36;

    return;
  }
  uint64_t v33 = v8;
  uint64_t v34 = v7;
  sub_1000057B0(a1);
  unint64_t v18 = v17;
  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    v32 = v6;
    if (v19) {
      goto LABEL_5;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    sub_100005FDC(0, (unint64_t *)&qword_100045FD0);
    v28 = (void *)static OS_dispatch_queue.main.getter();
    static DispatchTime.now()();
    + infix(_:_:)();
    uint64_t v29 = v34;
    v30 = *(void (**)(char *, uint64_t))(v33 + 8);
    v30(v11, v34);
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v18;
    aBlock[4] = sub_100005F30;
    aBlock[5] = v31;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100004EB0;
    aBlock[3] = &unk_10003D570;
    _Block_copy(aBlock);
    v37 = &_swiftEmptyArrayStorage;
    sub_100006128((unint64_t *)&qword_100046630, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005F50((uint64_t *)&unk_100045FE0);
    sub_100006018((unint64_t *)&qword_100046640, (uint64_t *)&unk_100045FE0);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    type metadata accessor for DispatchWorkItem();
    swift_allocObject();
    DispatchWorkItem.init(flags:block:)();
    swift_release();
    OS_dispatch_queue.asyncAfter(deadline:execute:)();

    swift_release();
    v30(v13, v29);
    return;
  }
  uint64_t v19 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v32 = v6;
  if (!v19) {
    goto LABEL_19;
  }
LABEL_5:
  if (v19 >= 1)
  {
    uint64_t v20 = 0;
    do
    {
      if ((v18 & 0xC000000000000001) != 0) {
        id v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v21 = *(id *)(v18 + 8 * v20 + 32);
      }
      v22 = v21;
      ++v20;
      id v23 = [v21 layer];
      [v23 setOpacity:0.0];
    }
    while (v19 != v20);
    goto LABEL_19;
  }
  __break(1u);
}

uint64_t sub_100005EC0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005EF8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005F30()
{
  return sub_100004CA4(*(void *)(v0 + 16));
}

uint64_t sub_100005F38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100005F48()
{
  return swift_release();
}

uint64_t sub_100005F50(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005F94(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005FDC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100006018(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005F94(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for WFSetupClientUserInteractionProgressEvent(uint64_t a1)
{
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void type metadata accessor for UIBackgroundTaskIdentifier(uint64_t a1)
{
}

void sub_100006098(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000060E0()
{
  return sub_100006128(&qword_100046020, type metadata accessor for UIBackgroundTaskIdentifier);
}

uint64_t sub_100006128(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100006170()
{
  return sub_100006128(&qword_100046028, type metadata accessor for UIBackgroundTaskIdentifier);
}

uint64_t sub_1000061B8()
{
  return sub_100006128(&qword_100046030, type metadata accessor for UIBackgroundTaskIdentifier);
}

uint64_t sub_10000621C()
{
  uint64_t v0 = sub_100005F50(&qword_100046170);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = &v11[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100005EC0(v3, (uint64_t)qword_100048E40);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Redirecting user to Settings to upgrade account", v6, 2u);
    swift_slowDealloc();
  }

  URL.init(string:)();
  sub_10000B344((uint64_t)v2);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Successfully launched the Settings app to guide the user to upgrade their iCloud account. ", v9, 2u);
    swift_slowDealloc();
  }

  v11[16] = 2;
  swift_retain();
  PassthroughSubject.send(_:)();
  swift_release();
  return sub_1000065F8((uint64_t)v2);
}

uint64_t sub_10000659C()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for AppleIDAccountUpgradeActionHandler()
{
  return self;
}

uint64_t sub_1000065F8(uint64_t a1)
{
  uint64_t v2 = sub_100005F50(&qword_100046170);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *initializeBufferWithCopyOfBuffer for CompletionStatus(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for VisualPairingAppClipCodeGenerationError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for VisualPairingAppClipCodeGenerationError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x1000067C0);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_1000067E8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000067F4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for VisualPairingAppClipCodeGenerationError()
{
  return &type metadata for VisualPairingAppClipCodeGenerationError;
}

unint64_t sub_100006810()
{
  unint64_t result = qword_100046180;
  if (!qword_100046180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046180);
  }
  return result;
}

BOOL sub_100006864(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100006878()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000068C0()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000068EC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t type metadata accessor for AccessorySetupActionHandler()
{
  return self;
}

void sub_100006964(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unsigned int v6 = v5;
  [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v9 = [v6 contentView];
  [v9 addSubview:a1];

  id v10 = [v6 contentView];
  id v103 = [v10 mainContentGuide];

  switch(a5)
  {
    case 1:
      uint64_t v11 = self;
      sub_100005F50(&qword_100046258);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_10002EF00;
      id v26 = [a1 topAnchor];
      id v27 = [v103 topAnchor];
      if (qword_100045EA8 != -1) {
        swift_once();
      }
      id v28 = [v26 constraintEqualToAnchor:v27 constant:*(double *)&qword_100048F08];

      *(void *)(v25 + 32) = v28;
      id v29 = [a1 centerXAnchor];
      id v30 = [v103 centerXAnchor];
      id v31 = [v29 constraintEqualToAnchor:v30];

      *(void *)(v25 + 40) = v31;
      id v32 = [a1 bottomAnchor];
      id v33 = [v103 bottomAnchor];
      if (qword_100045EB0 != -1) {
        swift_once();
      }
      id v34 = [v32 constraintEqualToAnchor:v33 constant:*(double *)&qword_100048F10];

      *(void *)(v25 + 48) = v34;
      id v35 = [a1 widthAnchor];
      if (qword_100045E88 != -1) {
        swift_once();
      }
      id v36 = [v35 constraintEqualToConstant:*(double *)&qword_100048EE8];

      *(void *)(v25 + 56) = v36;
      id v37 = [a1 heightAnchor];
      if (qword_100045E90 != -1) {
        swift_once();
      }
      id v38 = [v37 constraintEqualToConstant:*(double *)&qword_100048EF0];
      goto LABEL_21;
    case 2:
      uint64_t v11 = self;
      sub_100005F50(&qword_100046258);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_10002EF00;
      id v39 = [a1 topAnchor];
      id v40 = [v103 topAnchor];
      if (qword_100045EA8 != -1) {
        swift_once();
      }
      id v41 = [v39 constraintEqualToAnchor:v40 constant:*(double *)&qword_100048F08];

      *(void *)(v25 + 32) = v41;
      id v42 = [a1 centerXAnchor];
      id v43 = [v103 centerXAnchor];
      id v44 = [v42 constraintEqualToAnchor:v43];

      *(void *)(v25 + 40) = v44;
      id v45 = [a1 bottomAnchor];
      id v46 = [v103 bottomAnchor];
      if (qword_100045EB0 != -1) {
        swift_once();
      }
      id v47 = [v45 constraintEqualToAnchor:v46 constant:*(double *)&qword_100048F10];

      *(void *)(v25 + 48) = v47;
      id v48 = [a1 widthAnchor];
      if (qword_100045E98 != -1) {
        swift_once();
      }
      id v49 = [v48 constraintEqualToConstant:*(double *)&qword_100048EF8];

      *(void *)(v25 + 56) = v49;
      id v37 = [a1 heightAnchor];
      if (qword_100045EA0 != -1) {
        swift_once();
      }
      id v38 = [v37 constraintEqualToConstant:*(double *)&qword_100048F00];
LABEL_21:
      id v50 = v38;

      *(void *)(v25 + 64) = v50;
      goto LABEL_29;
    case 3:
      uint64_t v11 = self;
      sub_100005F50(&qword_100046258);
      uint64_t v51 = swift_allocObject();
      *(_OWORD *)(v51 + 16) = xmmword_10002EF00;
      id v52 = [a1 centerYAnchor];
      id v53 = [v103 centerYAnchor];
      id v54 = [v52 constraintEqualToAnchor:v53];

      *(void *)(v51 + 32) = v54;
      id v55 = [a1 centerXAnchor];
      id v56 = [v103 centerXAnchor];
      id v57 = [v55 constraintEqualToAnchor:v56];

      *(void *)(v51 + 40) = v57;
      id v58 = [a1 topAnchor];
      id v59 = [v103 topAnchor];
      if (qword_100045EB8 != -1) {
        swift_once();
      }
      id v60 = [v58 constraintEqualToAnchor:v59 constant:*(double *)&qword_100048F18];

      *(void *)(v51 + 48) = v60;
      id v61 = [a1 widthAnchor];
      id v62 = [v103 widthAnchor];
      id v63 = [v61 constraintEqualToAnchor:v62 multiplier:0.9];

      *(void *)(v51 + 56) = v63;
      id v64 = [a1 heightAnchor];
      id v65 = [v103 widthAnchor];
      id v66 = [v64 constraintEqualToAnchor:v65 multiplier:0.9];

      *(void *)(v51 + 64) = v66;
      goto LABEL_29;
    case 4:
      uint64_t v11 = self;
      sub_100005F50(&qword_100046258);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_10002EEF0;
      id v67 = [a1 topAnchor];
      id v68 = [v103 topAnchor];
      id v69 = [v67 constraintEqualToAnchor:v68];

      *(void *)(v12 + 32) = v69;
      id v70 = [a1 bottomAnchor];
      id v71 = [v103 bottomAnchor];
      id v72 = [v70 constraintEqualToAnchor:v71];

      *(void *)(v12 + 40) = v72;
      id v73 = [a1 centerXAnchor];
      id v74 = [v103 centerXAnchor];
      id v75 = [v73 constraintEqualToAnchor:v74];

      *(void *)(v12 + 48) = v75;
      id v22 = [a1 widthAnchor];
      id v23 = [v103 widthAnchor];
      id v24 = [v22 constraintEqualToAnchor:v23];
      goto LABEL_28;
    case 5:
      uint64_t v11 = self;
      sub_100005F50(&qword_100046258);
      uint64_t v76 = swift_allocObject();
      *(_OWORD *)(v76 + 16) = xmmword_10002EF00;
      id v77 = [a1 topAnchor];
      id v78 = [v103 topAnchor];
      id v79 = [v77 constraintEqualToAnchor:v78];

      *(void *)(v76 + 32) = v79;
      id v80 = [a1 widthAnchor];
      id v81 = [v103 widthAnchor];
      id v82 = [v80 constraintEqualToAnchor:v81 multiplier:0.8];

      *(void *)(v76 + 40) = v82;
      id v83 = [a1 heightAnchor];
      id v84 = [v103 widthAnchor];
      id v85 = [v83 constraintGreaterThanOrEqualToAnchor:v84 multiplier:0.8];

      *(void *)(v76 + 48) = v85;
      id v86 = [a1 centerYAnchor];
      id v87 = [v103 centerYAnchor];
      id v88 = [v86 constraintEqualToAnchor:v87];

      *(void *)(v76 + 56) = v88;
      id v89 = [a1 centerXAnchor];
      id v90 = [v103 centerXAnchor];
      id v91 = [v89 constraintEqualToAnchor:v90];

      *(void *)(v76 + 64) = v91;
      goto LABEL_29;
    case 6:
      uint64_t v11 = self;
      sub_100005F50(&qword_100046258);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_10002EEF0;
      id v92 = [a1 topAnchor];
      id v93 = [v103 topAnchor];
      id v94 = [v92 constraintGreaterThanOrEqualToAnchor:v93];

      *(void *)(v12 + 32) = v94;
      id v95 = [a1 bottomAnchor];
      id v96 = [v103 bottomAnchor];
      id v97 = [v95 constraintLessThanOrEqualToAnchor:v96];

      *(void *)(v12 + 40) = v97;
      id v98 = [a1 centerYAnchor];
      id v99 = [v103 centerYAnchor];
      id v100 = [v98 constraintEqualToAnchor:v99 constant:-35.0];

      *(void *)(v12 + 48) = v100;
      id v22 = [a1 centerXAnchor];
      id v23 = [v103 centerXAnchor];
      id v24 = [v22 constraintEqualToAnchor:v23];
      goto LABEL_28;
    default:
      uint64_t v11 = self;
      sub_100005F50(&qword_100046258);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_10002EEF0;
      id v13 = [a1 centerYAnchor];
      id v14 = [v103 centerYAnchor];
      id v15 = [v13 constraintEqualToAnchor:v14];

      *(void *)(v12 + 32) = v15;
      id v16 = [a1 centerXAnchor];
      id v17 = [v103 centerXAnchor];
      id v18 = [v16 constraintEqualToAnchor:v17];

      *(void *)(v12 + 40) = v18;
      id v19 = [a1 widthAnchor];
      id v20 = [v103 widthAnchor];
      id v21 = [v19 constraintLessThanOrEqualToAnchor:v20];

      *(void *)(v12 + 48) = v21;
      id v22 = [a1 heightAnchor];
      id v23 = [v103 heightAnchor];
      id v24 = [v22 constraintLessThanOrEqualToAnchor:v23];
LABEL_28:
      id v101 = v24;

      *(void *)(v12 + 56) = v101;
LABEL_29:
      specialized Array._endMutation()();
      sub_100005FDC(0, &qword_100046260);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v11 activateConstraints:isa];

      return;
  }
}

Swift::Bool __swiftcall PRXCardContainerViewController._canShowWhileLocked()()
{
  return 1;
}

void sub_1000079FC()
{
  if ((sub_10001A8C4() - 1) > 1u)
  {
    id v4 = [self mainBundle];
    v8._countAndFlagsBits = 0xD000000000000020;
    v31._object = (void *)0xE000000000000000;
    v8._object = (void *)0x80000001000327E0;
    v9.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v9.value._object = (void *)0xEB00000000656C62;
    v10._countAndFlagsBits = 0;
    v10._object = (void *)0xE000000000000000;
    v31._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v8, v9, (NSBundle)v4, v10, v31);
  }
  else
  {
    uint64_t v1 = String.appleAccountRebrandStringKey.getter(0xD000000000000018);
    int v3 = v2;
    id v4 = [self mainBundle];
    v30._object = (void *)0xE000000000000000;
    v5._countAndFlagsBits = v1;
    v5._object = v3;
    v6.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v6.value._object = (void *)0xEB00000000656C62;
    v7._countAndFlagsBits = 0;
    v7._object = (void *)0xE000000000000000;
    v30._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v5, v6, (NSBundle)v4, v7, v30);
    swift_bridgeObjectRelease();
  }

  uint64_t v11 = self;
  id v12 = [v11 mainBundle];
  v32._object = (void *)0xE000000000000000;
  v13._object = (void *)0x8000000100032810;
  v13._countAndFlagsBits = 0xD000000000000016;
  v14.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v14.value._object = (void *)0xEB00000000656C62;
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  v32._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v13, v14, (NSBundle)v12, v15, v32);

  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v18 = [v11 mainBundle];
  v19._countAndFlagsBits = 0xD000000000000024;
  v33._object = (void *)0xE000000000000000;
  v19._object = (void *)0x8000000100032830;
  v20.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v20.value._object = (void *)0xEB00000000656C62;
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  v33._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v19, v20, (NSBundle)v18, v21, v33);

  NSString v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v23 = [v11 mainBundle];
  v24._countAndFlagsBits = 0xD00000000000001ELL;
  v34._object = (void *)0xE000000000000000;
  v24._object = (void *)0x8000000100032860;
  v25.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v25.value._object = (void *)0xEB00000000656C62;
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  v34._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v24, v25, (NSBundle)v23, v26, v34);

  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v28 = [v0 dismissalConfirmationActionWithTitle:v16 message:v17 confirmButtonTitle:v22 cancelButtonTitle:v27];

  [v0 setDismissButtonAction:v28];
}

Swift::Void __swiftcall PRXCardContentViewController.VideoPlayerView.layoutSubviews()()
{
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for PRXCardContentViewController.VideoPlayerView();
  [super layoutSubviews];
  id v1 = [v0 layer];
  id v2 = [v1 sublayers];

  if (v2)
  {
    sub_100005FDC(0, &qword_100046228);
    unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v4) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v4)
      {
LABEL_4:
        if (v4 < 1)
        {
          __break(1u);
          return;
        }
        uint64_t v5 = 0;
        do
        {
          if ((v3 & 0xC000000000000001) != 0) {
            id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v6 = *(id *)(v3 + 8 * v5 + 32);
          }
          Swift::String v7 = v6;
          ++v5;
          [v0 frame];
          double Width = CGRectGetWidth(v10);
          [v0 frame];
          [v7 setFrame:CGRectMake(0.0, 0.0, Width, CGRectGetHeight(v11))];
        }
        while (v4 != v5);
      }
    }
    swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for PRXCardContentViewController.VideoPlayerView()
{
  return self;
}

id PRXCardContentViewController.VideoPlayerView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return [v9 initWithFrame:a1, a2, a3, a4];
}

id PRXCardContentViewController.VideoPlayerView.init(frame:)(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for PRXCardContentViewController.VideoPlayerView();
  return [super initWithFrame:a1, a2, a3, a4];
}

id PRXCardContentViewController.VideoPlayerView.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id PRXCardContentViewController.VideoPlayerView.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for PRXCardContentViewController.VideoPlayerView();
  [super initWithCoder:a1];

  return v3;
}

id PRXCardContentViewController.VideoPlayerView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PRXCardContentViewController.VideoPlayerView();
  [super dealloc];
}

id sub_1000081D4(void *a1, char a2)
{
  type metadata accessor for PRXCardContentViewController.VideoPlayerView();
  id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  if (a1)
  {
    id v5 = objc_allocWithZone((Class)AVPlayer);
    id v6 = a1;
    id v7 = [v5 initWithPlayerItem:v6];
    id v8 = [self playerLayerWithPlayer:v7];
    [v8 setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    id v9 = [self sharedInstance];
    id v39 = 0;
    LODWORD(v5) = [v9 setCategory:AVAudioSessionCategoryPlayback mode:AVAudioSessionModeDefault options:1 error:&v39];

    if (v5)
    {
      id v10 = v39;
    }
    else
    {
      id v15 = v39;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      if (qword_100045E50 != -1) {
        swift_once();
      }
      uint64_t v16 = type metadata accessor for Logger();
      sub_100005EC0(v16, (uint64_t)qword_100048E40);
      swift_errorRetain();
      swift_errorRetain();
      NSString v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v17, v18))
      {
        char v37 = a2;
        Swift::String v19 = (uint8_t *)swift_slowAlloc();
        id v38 = v4;
        id v36 = (void *)swift_slowAlloc();
        *(_DWORD *)Swift::String v19 = 138543362;
        swift_errorRetain();
        id v20 = v7;
        id v21 = v8;
        id v22 = v6;
        id v23 = (void *)_swift_stdlib_bridgeErrorToNSError();
        id v39 = v23;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v36 = v23;
        id v6 = v22;
        id v8 = v21;
        id v7 = v20;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to configure AVAudioSession due to %{public}@", v19, 0xCu);
        sub_100005F50(&qword_100046268);
        swift_arrayDestroy();
        id v4 = v38;
        swift_slowDealloc();
        a2 = v37;
        swift_slowDealloc();

        swift_errorRelease();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
    }
    id v24 = [v4 layer:v36];
    [v24 addSublayer:v8];

    if (a2)
    {
      id v25 = [v7 currentItem];
      if (v25)
      {
        Swift::String v26 = v25;
        id v27 = [v25 asset];

        [v27 duration];
        id v28 = v39;
        uint64_t v29 = v41;
        uint64_t v30 = v40;

        id v39 = v28;
        uint64_t v40 = v30;
        uint64_t v41 = v29;
        [v7 seekToTime:&v39];
        [v7 pause];
      }
      else
      {
        if (qword_100045E50 != -1) {
          swift_once();
        }
        uint64_t v32 = type metadata accessor for Logger();
        sub_100005EC0(v32, (uint64_t)qword_100048E40);
        Swift::String v33 = Logger.logObject.getter();
        os_log_type_t v34 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v33, v34))
        {
          id v35 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v35 = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, v34, "Unable to find last seekable time range", v35, 2u);
          swift_slowDealloc();
        }
      }
    }
    else
    {
      [v7 play];
    }
    [v7 play];
  }
  else
  {
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_100005EC0(v11, (uint64_t)qword_100048E40);
    id v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      Swift::String_optional v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String_optional v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "AVPlayerItem is nil, returning an empty video view", v14, 2u);
      swift_slowDealloc();
    }
  }
  return v4;
}

id sub_100008780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v5 = [self _systemImageNamed:v4];

  id v6 = [objc_allocWithZone((Class)UIImageView) initWithImage:v5];
  [v6 setTintColor:a3];
  id v7 = [self configurationWithPointSize:72.0];
  [v6 setPreferredSymbolConfiguration:v7];

  return v6;
}

uint64_t destroy for AppleIDAccountRenewalActionHandler()
{
  swift_release();

  return swift_release();
}

void *_s21TDGSharingViewService34AppleIDAccountRenewalActionHandlerVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AppleIDAccountRenewalActionHandler(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for AppleIDAccountRenewalActionHandler(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleIDAccountRenewalActionHandler(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppleIDAccountRenewalActionHandler(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleIDAccountRenewalActionHandler()
{
  return &type metadata for AppleIDAccountRenewalActionHandler;
}

uint64_t sub_100008A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100005EC0(v6, (uint64_t)qword_100048E40);
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Renewing Apple ID", v9, 2u);
    swift_slowDealloc();
  }

  swift_retain_n();
  swift_retain_n();
  sub_100019D04(a1, a3, a2, a3);
  swift_release();

  return swift_release();
}

uint64_t sub_100008B60(char a1)
{
  if (a1)
  {
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_100005EC0(v1, (uint64_t)qword_100048E40);
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      NSString v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)NSString v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Apple ID Renewal Success", v4, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_100005EC0(v5, (uint64_t)qword_100048E40);
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v6, "Apple ID Renewal Failed", v7, 2u);
      swift_slowDealloc();
    }
  }

  return PassthroughSubject.send(_:)();
}

uint64_t sub_100008D10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_10000961C();
  **(void **)(*(void *)(v1 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return _swift_continuation_resume(v1);
}

uint64_t type metadata accessor for PrescriptionRecordProvider()
{
  return self;
}

uint64_t sub_100008D9C()
{
  type metadata accessor for Date();
  *(void *)(v0 + 144) = swift_task_alloc();
  return _swift_task_switch(sub_100008E28, 0, 0);
}

uint64_t sub_100008E28()
{
  if (qword_100045E68 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[19] = sub_100005EC0(v1, (uint64_t)qword_100048E88);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    NSString v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Fetching prescription records…", v4, 2u);
    swift_slowDealloc();
  }

  id v5 = [objc_allocWithZone((Class)WFPrescriptionRecordCollector) initWithTimeout:5.0];
  v0[20] = v5;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100008FFC;
  uint64_t v6 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100008D10;
  v0[13] = &unk_10003D720;
  v0[14] = v6;
  [v5 fetchPrescriptionRecordsWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100008FFC()
{
  return _swift_task_switch(sub_1000090DC, 0, 0);
}

uint64_t sub_1000090DC()
{
  char v37 = v0;
  unint64_t v1 = v0[15];
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    NSString v4 = (uint8_t *)swift_slowAlloc();
    id v36 = (void *)swift_slowAlloc();
    *(_DWORD *)NSString v4 = 136315138;
    sub_10000961C();
    uint64_t v5 = Array.description.getter();
    v0[17] = sub_100023568(v5, v6, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Finished fetching prescription record: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_6;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    id v23 = &_swiftEmptyArrayStorage;
    goto LABEL_22;
  }
  uint64_t v7 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v7) {
    goto LABEL_21;
  }
LABEL_6:
  id v36 = &_swiftEmptyArrayStorage;
  uint64_t result = specialized ContiguousArray.reserveCapacity(_:)();
  if (v7 < 0)
  {
    __break(1u);
    return result;
  }
  id v35 = v0;
  uint64_t v9 = 0;
  unint64_t v33 = v1 & 0xC000000000000001;
  unint64_t v34 = v1;
  do
  {
    if (v33) {
      id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v14 = *(id *)(v1 + 8 * v9 + 32);
    }
    id v15 = v14;
    id v16 = [v14 accPayload:v32];
    static Data._unconditionallyBridgeFromObjectiveC(_:)();

    id v17 = [v15 enrollmentName];
    if (v17)
    {
      os_log_type_t v18 = v17;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    id v19 = [v15 enrollmentDate];
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    id v20 = [v15 leftCalibrationData];
    if (v20)
    {
      id v21 = v20;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    id v22 = [v15 rightCalibrationData];
    if (v22)
    {
      id v10 = v22;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v12 = v11;
    }
    else
    {
      uint64_t v12 = 0;
    }
    ++v9;
    id v13 = objc_allocWithZone((Class)type metadata accessor for PrescriptionRecord());
    uint64_t v32 = v12;
    PrescriptionRecord.init(accPayload:enrollmentName:enrollmentDate:leftLensFactoryCalibrationData:rightLensFactoryCalibrationData:)();

    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
    unint64_t v1 = v34;
  }
  while (v7 != v9);
  id v23 = v36;
  swift_bridgeObjectRelease();
  uint64_t v0 = v35;
LABEL_22:
  swift_bridgeObjectRetain_n();
  id v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  BOOL v26 = os_log_type_enabled(v24, v25);
  id v27 = (void *)v0[20];
  if (v26)
  {
    id v28 = (uint8_t *)swift_slowAlloc();
    id v36 = (void *)swift_slowAlloc();
    *(_DWORD *)id v28 = 136315138;
    type metadata accessor for PrescriptionRecord();
    uint64_t v29 = Array.description.getter();
    v0[16] = sub_100023568(v29, v30, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Generated prescription records: %s", v28, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_task_dealloc();
  Swift::String v31 = (uint64_t (*)(void *))v0[1];
  return v31(v23);
}

unint64_t sub_10000961C()
{
  unint64_t result = qword_100046318;
  if (!qword_100046318)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100046318);
  }
  return result;
}

ValueMetadata *type metadata accessor for InteractionEventPublisher()
{
  return &type metadata for InteractionEventPublisher;
}

void sub_10000966C(char a1, void *a2)
{
  if (qword_100045E48 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005EC0(v4, (uint64_t)qword_100048E28);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446210;
    unint64_t v8 = sub_10002ABF0(a1);
    sub_100023568(v8, v9, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Interaction event publisher asked to publish event for stageId: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  switch(a1)
  {
    case 3:
      id v10 = Logger.logObject.getter();
      os_log_type_t v11 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Intentionally, not publishing a message since there is no available session at this point. To know whether the session has started, we wait for the event: setupProgressEventSessionStarted", v12, 2u);
        swift_slowDealloc();
      }

      return;
    case 4:
      sub_100005F50(&qword_100046320);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10002F010;
      uint64_t v25 = 0xD000000000000015;
      unint64_t v26 = 0x8000000100032900;
      AnyHashable.init<A>(_:)();
      *(void *)(inited + 96) = &type metadata for Int;
      *(void *)(inited + 72) = 2;
      unint64_t v14 = sub_100021D54(inited);
      uint64_t v15 = swift_allocObject();
      *(void *)(v15 + 16) = 2;
      *(unsigned char *)(v15 + 24) = 4;
      (*(void (**)(unint64_t, void, void (*)(uint64_t, uint64_t, uint64_t, int16x8_t), uint64_t))((swift_isaMask & *a2) + 0x1D0))(v14, 0, sub_10000A1F8, v15);
      goto LABEL_13;
    case 5:
      sub_100005F50(&qword_100046320);
      uint64_t v16 = swift_initStackObject();
      *(_OWORD *)(v16 + 16) = xmmword_10002F010;
      uint64_t v25 = 0xD000000000000015;
      unint64_t v26 = 0x8000000100032900;
      AnyHashable.init<A>(_:)();
      *(void *)(v16 + 96) = &type metadata for Int;
      *(void *)(v16 + 72) = 3;
      unint64_t v17 = sub_100021D54(v16);
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = 3;
      *(unsigned char *)(v18 + 24) = 5;
      (*(void (**)(unint64_t, void, void (*)(uint64_t, uint64_t, uint64_t, int16x8_t), uint64_t))((swift_isaMask & *a2) + 0x1D0))(v17, 0, sub_10000A164, v18);
      goto LABEL_13;
    case 6:
      sub_100005F50(&qword_100046320);
      uint64_t v19 = swift_initStackObject();
      *(_OWORD *)(v19 + 16) = xmmword_10002F010;
      uint64_t v25 = 0xD000000000000015;
      unint64_t v26 = 0x8000000100032900;
      AnyHashable.init<A>(_:)();
      *(void *)(v19 + 96) = &type metadata for Int;
      *(void *)(v19 + 72) = 4;
      unint64_t v20 = sub_100021D54(v19);
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = 4;
      *(unsigned char *)(v21 + 24) = 6;
      (*(void (**)(unint64_t, void, void (*)(uint64_t, uint64_t, uint64_t, int16x8_t), uint64_t))((swift_isaMask & *a2) + 0x1D0))(v20, 0, sub_10000A124, v21);
      goto LABEL_13;
    case 8:
      sub_100005F50(&qword_100046320);
      uint64_t v22 = swift_initStackObject();
      *(_OWORD *)(v22 + 16) = xmmword_10002F010;
      uint64_t v25 = 0xD000000000000015;
      unint64_t v26 = 0x8000000100032900;
      AnyHashable.init<A>(_:)();
      *(void *)(v22 + 96) = &type metadata for Int;
      *(void *)(v22 + 72) = 5;
      unint64_t v23 = sub_100021D54(v22);
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = 5;
      *(unsigned char *)(v24 + 24) = 8;
      (*(void (**)(unint64_t, void, void (*)(uint64_t, uint64_t, uint64_t, int16x8_t), uint64_t))((swift_isaMask & *a2) + 0x1D0))(v23, 0, sub_10000A1F8, v24);
LABEL_13:
      swift_bridgeObjectRelease();
      swift_release();
      break;
    default:
      return;
  }
}

void sub_100009C9C(uint64_t a1, int16x8_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6, const char *a7)
{
  if (a1)
  {
    swift_errorRetain();
    if (qword_100045E48 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_100005EC0(v10, (uint64_t)qword_100048E28);
    swift_errorRetain();
    swift_errorRetain();
    oslog = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = vmovn_s16(a2).u32[0];
      id v13 = sub_10000A1A4(a5);
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v16 = v15;

      sub_100023568(v14, v16, &v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2082;
      unint64_t v17 = sub_10002ABF0(a6);
      sub_100023568(v17, v18, &v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 22) = 2082;
      swift_errorRetain();
      sub_100005F50(&qword_100046178);
      uint64_t v19 = String.init<A>(describing:)();
      sub_100023568(v19, v20, &v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v11, a7, (uint8_t *)v12, 0x20u);
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
    if (qword_100045E48 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_100005EC0(v21, (uint64_t)qword_100048E28);
    oslog = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136446466;
      uint64_t v24 = sub_10000A1A4(a5);
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v27 = v26;

      sub_100023568(v25, v27, &v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2082;
      unint64_t v28 = sub_10002ABF0(a6);
      sub_100023568(v28, v29, &v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v22, "Successfully published event: %{public}s for stageID: %{public}s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
}

uint64_t sub_10000A104()
{
  return _swift_deallocObject(v0, 25, 7);
}

uint64_t sub_10000A114()
{
  return _swift_deallocObject(v0, 25, 7);
}

void sub_10000A124(uint64_t a1, uint64_t a2, uint64_t a3, int16x8_t a4)
{
  a4.i64[0] = 0x8002200030002;
  sub_100009C9C(a1, a4, a2, a3, *(void *)(v4 + 16), *(unsigned char *)(v4 + 24), "Failed to publish event: %{public}s for stageID: %{public}s with error: %{public}s");
}

uint64_t sub_10000A154()
{
  return _swift_deallocObject(v0, 25, 7);
}

void sub_10000A164(uint64_t a1, uint64_t a2, uint64_t a3, int16x8_t a4)
{
  a4.i64[0] = 0x8002000030002;
  sub_100009C9C(a1, a4, a2, a3, *(void *)(v4 + 16), *(unsigned char *)(v4 + 24), "Failed to publish event: %s for stageID: %{public}s with error: %{public}s");
}

uint64_t sub_10000A194()
{
  return _swift_deallocObject(v0, 25, 7);
}

__CFString *sub_10000A1A4(unint64_t a1)
{
  if (a1 <= 5)
  {
    unint64_t v1 = off_10003D830[a1];
    uint64_t v2 = off_10003D800[a1];
  }

  return v1;
}

uint64_t type metadata accessor for FailureActionHandler()
{
  return self;
}

id sub_10000A30C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntroductionUIProvider.IntroductionCardContentViewController();
  return [super dealloc];
}

uint64_t sub_10000A354(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 32) = a3;
  *(void *)(v3 + 24) = a1;
  type metadata accessor for IntroductionUIProvider.IntroductionCardContentViewController();
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  swift_retain();
  os_log_type_t v6 = (char *)[v5 init];
  *(void *)(v3 + 16) = v6;
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  uint64_t v8 = swift_allocObject();
  *(unsigned char *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = v7;
  unint64_t v9 = (void (**)())&v6[OBJC_IVAR____TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController_viewDidLoadCompletionHandler];
  uint64_t v10 = *(void *)&v6[OBJC_IVAR____TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController_viewDidLoadCompletionHandler];
  *unint64_t v9 = sub_10000AE4C;
  v9[1] = (void (*)())v8;
  os_log_type_t v11 = v6;
  sub_10000AE58(v10);
  uint64_t v12 = self;
  id v13 = v11;
  id v14 = [v12 mainBundle];
  v39._object = (void *)0xE000000000000000;
  v15._object = (void *)0x8000000100032BE0;
  v15._countAndFlagsBits = 0xD000000000000012;
  v16.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v16.value._object = (void *)0xEB00000000656C62;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  v39._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v15, v16, (NSBundle)v14, v17, v39);

  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v13 setTitle:v18];

  uint64_t v19 = v13;
  id v20 = [v12 mainBundle];
  v21._countAndFlagsBits = 0xD000000000000015;
  v40._object = (void *)0xE000000000000000;
  v21._object = (void *)0x8000000100032C00;
  v22.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v22.value._object = (void *)0xEB00000000656C62;
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  v40._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v21, v22, (NSBundle)v20, v23, v40);

  NSString v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v19 setSubtitle:v24];

  [v19 setDismissalType:1];
  id v25 = [v12 mainBundle];
  if (a3)
  {
    v26._countAndFlagsBits = 0xD000000000000023;
    v41._object = (void *)0xE000000000000000;
    v26._object = (void *)0x8000000100032C40;
    v27.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v27.value._object = (void *)0xEB00000000656C62;
    v28._countAndFlagsBits = 0;
    v28._object = (void *)0xE000000000000000;
    v41._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v26, v27, (NSBundle)v25, v28, v41);

    NSString v29 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v19 showActivityIndicatorWithStatus:v29];
  }
  else
  {
    v42._object = (void *)0xE000000000000000;
    v30._countAndFlagsBits = 0x45554E49544E4F43;
    v30._object = (void *)0xEC0000004E54425FLL;
    v31.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v31.value._object = (void *)0xEB00000000656C62;
    v32._countAndFlagsBits = 0;
    v32._object = (void *)0xE000000000000000;
    v42._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v30, v31, (NSBundle)v25, v32, v42);

    uint64_t v33 = swift_allocObject();
    swift_weakInit();
    swift_retain();
    NSString v34 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    aBlock[4] = sub_10000AE68;
    aBlock[5] = v33;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10002B17C;
    aBlock[3] = &unk_10003D8D0;
    id v35 = _Block_copy(aBlock);
    id v36 = [self actionWithTitle:v34 style:0 handler:v35];

    _Block_release(v35);
    swift_release();
    swift_release();
  }
  sub_100005994(v19, (a3 & 1) == 0);

  swift_release();
  swift_release();
  return v3;
}

void sub_10000A828(char a1)
{
  if (a1)
  {
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_100005EC0(v1, (uint64_t)qword_100048E40);
    objc_super v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Invoking introduction action handler automatically", v4, 2u);
      swift_slowDealloc();
    }

    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      uint64_t v6 = *(void *)(Strong + 24);
      swift_retain();
      swift_release();
      uint64_t v7 = Logger.logObject.getter();
      os_log_type_t v8 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v7, v8))
      {
        unint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Activating WFSetupClient", v9, 2u);
        swift_slowDealloc();
      }

      uint64_t v10 = *(void **)(v6 + 24);
      os_log_type_t v11 = *(void (**)(void))((swift_isaMask & *v10) + 0x1D8);
      uint64_t v12 = v10;
      v11();
      swift_release();
    }
  }
  else
  {
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_100005EC0(v13, (uint64_t)qword_100048E40);
    oslog = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v14))
    {
      Swift::String v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v14, "Not automatically invoking introduction action handler since shouldAutoStart is false", v15, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10000AAE4()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v1 = *(id *)(Strong + 16);
    swift_release();
    id v2 = [self mainBundle];
    v16._object = (void *)0xE000000000000000;
    v3._object = (void *)0x8000000100032C40;
    v3._countAndFlagsBits = 0xD000000000000023;
    v4.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v4.value._object = (void *)0xEB00000000656C62;
    v5._countAndFlagsBits = 0;
    v5._object = (void *)0xE000000000000000;
    v16._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v3, v4, (NSBundle)v2, v5, v16);

    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v1 showActivityIndicatorWithStatus:v6];
  }
  swift_beginAccess();
  uint64_t v7 = swift_weakLoadStrong();
  if (v7)
  {
    uint64_t v8 = *(void *)(v7 + 24);
    swift_retain();
    swift_release();
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_100005EC0(v9, (uint64_t)qword_100048E40);
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Activating WFSetupClient", v12, 2u);
      swift_slowDealloc();
    }

    uint64_t v13 = *(void **)(v8 + 24);
    os_log_type_t v14 = *(void (**)(void))((swift_isaMask & *v13) + 0x1D8);
    Swift::String v15 = v13;
    v14();
    swift_release();
  }
}

uint64_t sub_10000AD48()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 33, 7);
}

uint64_t type metadata accessor for IntroductionUIProvider()
{
  return self;
}

uint64_t type metadata accessor for IntroductionUIProvider.IntroductionCardContentViewController()
{
  return self;
}

id sub_10000ADD0()
{
  return *(id *)(*(void *)v0 + 16);
}

uint64_t sub_10000ADDC()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000AE14()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000AE4C()
{
  sub_10000A828(*(unsigned char *)(v0 + 16));
}

uint64_t sub_10000AE58(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_10000AE68()
{
}

uint64_t sub_10000AE70(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000AE80()
{
  return swift_release();
}

uint64_t String.appleAccountRebrandStringKey.getter(uint64_t a1)
{
  v5[3] = &type metadata for AppleAccountFeatures;
  v5[4] = sub_10000AF68();
  char v2 = isFeatureEnabled(_:)();
  sub_10000AFBC((uint64_t)v5);
  if (v2)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    v5[0] = 0xD000000000000014;
    v5[1] = 0x8000000100032C70;
    swift_bridgeObjectRetain();
    uint64_t v4 = String.init<A>(_:)();
    String.append<A>(contentsOf:)();
    return v4;
  }
  return a1;
}

unint64_t sub_10000AF68()
{
  unint64_t result = qword_1000464A8;
  if (!qword_1000464A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000464A8);
  }
  return result;
}

uint64_t sub_10000AFBC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t getEnumTagSinglePayload for AppleAccountFeatures(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for AppleAccountFeatures(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10000B0FCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000B124()
{
  return 0;
}

ValueMetadata *type metadata accessor for AppleAccountFeatures()
{
  return &type metadata for AppleAccountFeatures;
}

unint64_t sub_10000B140()
{
  unint64_t result = qword_1000464B0;
  if (!qword_1000464B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000464B0);
  }
  return result;
}

Swift::Int sub_10000B194()
{
  return Hasher._finalize()();
}

void sub_10000B1D8()
{
}

Swift::Int sub_10000B200()
{
  return Hasher._finalize()();
}

const char *sub_10000B240()
{
  return "AppleAccount";
}

const char *sub_10000B254()
{
  return "AABranding";
}

uint64_t sub_10000B268()
{
  sub_10000AFBC(v0 + 24);

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for InstructionStage()
{
  return self;
}

uint64_t sub_10000B2C4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B2E0(*v1 + 24, a1);
}

uint64_t sub_10000B2D4()
{
  return *(unsigned __int8 *)(*(void *)v0 + 16);
}

uint64_t sub_10000B2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_10000B344(uint64_t a1)
{
  uint64_t v2 = sub_100005F50(&qword_100046170);
  __chkstk_darwin(v2 - 8);
  unsigned int v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [self defaultWorkspace];
  if (result)
  {
    NSString v6 = result;
    sub_10000B5A8(a1, (uint64_t)v4);
    uint64_t v7 = type metadata accessor for URL();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v10 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v7) != 1)
    {
      URL._bridgeToObjectiveC()(v9);
      uint64_t v10 = v11;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v7);
    }
    sub_100005F50(&qword_100046568);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10002F010;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v13;
    id v14 = [objc_allocWithZone((Class)NSNumber) initWithBool:1];
    *(void *)(inited + 72) = sub_10000B610();
    *(void *)(inited + 48) = v14;
    sub_100021C1C(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v17 = 0;
    LOBYTE(inited) = [v6 openSensitiveURL:v10 withOptions:isa error:&v17];

    id result = v17;
    if ((inited & 1) == 0)
    {
      Swift::String v16 = result;
      _convertNSErrorToError(_:)();

      return (id)swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_10000B5A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005F50(&qword_100046170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000B610()
{
  unint64_t result = qword_100046570;
  if (!qword_100046570)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100046570);
  }
  return result;
}

uint64_t sub_10000B650()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    long long v5 = 0u;
    long long v6 = 0u;
LABEL_10:
    sub_10000D4E8((uint64_t)&v5);
    return 0;
  }
  uint64_t v1 = Strong;
  id v2 = [Strong _remoteViewControllerProxy];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_10000D480((uint64_t)v4, (uint64_t)&v5);
  if (!*((void *)&v6 + 1)) {
    goto LABEL_10;
  }
  sub_100005F50(&qword_100046658);
  if (swift_dynamicCast()) {
    return *(void *)&v4[0];
  }
  else {
    return 0;
  }
}

uint64_t sub_10000B734(void *a1)
{
  id v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  Swift::String v39 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100045E58 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_100005EC0(v11, (uint64_t)qword_100048E58);
  id v12 = a1;
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  int v15 = v14;
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    aBlock[0] = v35;
    *(_DWORD *)uint64_t v16 = 136446466;
    id v36 = v2;
    uint64_t v40 = sub_100023568(0xD00000000000001ALL, 0x8000000100032E10, aBlock);
    uint64_t v38 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v16 + 12) = 2082;
    id v17 = [v12 description:v16 + 14];
    int v34 = v15;
    id v18 = v17;
    uint64_t v19 = v9;
    id v20 = v7;
    uint64_t v21 = v4;
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v37 = v5;
    unint64_t v24 = v23;

    uint64_t v25 = v22;
    uint64_t v4 = v21;
    uint64_t v7 = v20;
    uint64_t v9 = v19;
    id v2 = v36;
    uint64_t v40 = sub_100023568(v25, v24, aBlock);
    uint64_t v8 = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    uint64_t v5 = v37;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v34, "%{public}s is invoked with viewController: %{public}s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_10000D25C();
  Swift::String v26 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v12;
  *(void *)(v27 + 24) = v2;
  aBlock[4] = (uint64_t)sub_10000D478;
  aBlock[5] = v27;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100004EB0;
  aBlock[3] = (uint64_t)&unk_10003DAF0;
  Swift::String v28 = _Block_copy(aBlock);
  id v29 = v12;
  id v30 = v2;
  swift_release();
  Swift::String_optional v31 = v39;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_10000D2F8();
  sub_100005F50((uint64_t *)&unk_100045FE0);
  sub_10000D350();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v28);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v31, v8);
}

void sub_10000BBC8(void *a1, uint64_t a2)
{
  if (qword_100045E58 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005EC0(v4, (uint64_t)qword_100048E58);
  id v5 = a1;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136446210;
    id v9 = [v5 description];
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v12 = v11;

    sub_100023568(v10, v12, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Presenting prox card flow with initial view controller: %{public}s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v13 = [self defaultConfiguration];
  if (v13)
  {
    os_log_type_t v14 = v13;
    id v15 = [self blackColor];
    [v14 setCustomBackgroundColor:v15];

    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v17 = Strong;
      id v18 = [Strong presentProxCardFlowWithDelegate:a2 initialViewController:v5 configuration:v14];
    }
    id v19 = [v5 navigationController];
    id v20 = *(void **)(a2 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController);
    *(void *)(a2 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController) = v19;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000BE84(void *a1, int a2)
{
  int v38 = a2;
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v35 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v5 = &v30[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v36 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v8 = &v30[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_100045E58 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100005EC0(v9, (uint64_t)qword_100048E58);
  id v10 = a1;
  unint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  int v13 = v12;
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    id v15 = (void *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    aBlock[0] = v33;
    *(_DWORD *)uint64_t v14 = 136446722;
    os_log_t v32 = v11;
    uint64_t v39 = sub_100023568(0xD00000000000001FLL, 0x8000000100032DF0, aBlock);
    int v34 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2114;
    uint64_t v39 = (uint64_t)v10;
    id v16 = v10;
    int v31 = v13;
    id v17 = v10;
    id v18 = v16;
    uint64_t v8 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    id v19 = v17;
    *id v15 = v17;

    *(_WORD *)(v14 + 22) = 1024;
    char v20 = v38;
    LODWORD(v39) = v38 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    os_log_t v21 = v32;
    _os_log_impl((void *)&_mh_execute_header, v32, (os_log_type_t)v31, "%{public}s is invoked with viewController: %{public}@, animated: %{BOOL}d", (uint8_t *)v14, 0x1Cu);
    sub_100005F50(&qword_100046268);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    id v19 = v10;
    char v20 = v38;
  }
  uint64_t v22 = v37;
  unint64_t v23 = *(void **)(v37 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredViewController);
  *(void *)(v37 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredViewController) = 0;

  *(unsigned char *)(v22 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredPushAnimated) = 2;
  sub_10000D25C();
  unint64_t v24 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v25;
  *(void *)(v26 + 24) = v19;
  *(unsigned char *)(v26 + 32) = v20 & 1;
  aBlock[4] = (uint64_t)sub_10000D42C;
  aBlock[5] = v26;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100004EB0;
  aBlock[3] = (uint64_t)&unk_10003DAA0;
  uint64_t v27 = _Block_copy(aBlock);
  id v28 = v19;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_10000D2F8();
  sub_100005F50((uint64_t *)&unk_100045FE0);
  sub_10000D350();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v27);

  (*(void (**)(unsigned char *, uint64_t))(v35 + 8))(v5, v3);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v36);
}

void sub_10000C3A4(uint64_t a1, void *a2, char a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (char *)Strong;
    uint64_t v7 = OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController;
    uint64_t v8 = *(void **)(Strong + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController);
    if (!v8
      || (id v9 = [v8 transitionCoordinator],
          swift_unknownObjectRelease(),
          !v9))
    {
      if (qword_100045E58 != -1) {
        swift_once();
      }
      uint64_t v11 = type metadata accessor for Logger();
      sub_100005EC0(v11, (uint64_t)qword_100048E58);
      id v12 = a2;
      int v13 = Logger.logObject.getter();
      os_log_type_t v14 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v22 = v7;
        id v15 = (uint8_t *)swift_slowAlloc();
        v23[0] = swift_slowAlloc();
        *(_DWORD *)id v15 = 136446210;
        id v16 = [v12 description];
        uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v19 = v18;

        uint64_t v20 = v17;
        uint64_t v7 = v22;
        sub_100023568(v20, v19, v23);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Pushing view controller: %{public}s on to the navigation stack", v15, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      id v21 = *(id *)&v6[v7];
      [v21 pushViewController:v12 animated:a3 & 1];

      goto LABEL_13;
    }
  }
  swift_beginAccess();
  uint64_t v10 = swift_unknownObjectWeakLoadStrong();
  if (!v10) {
    return;
  }
  uint64_t v6 = (char *)v10;
  sub_10000C64C(a2, a3 & 1);
LABEL_13:
}

void sub_10000C64C(void *a1, char a2)
{
  uint64_t v3 = v2;
  if (qword_100045E58 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100005EC0(v6, (uint64_t)qword_100048E58);
  id v7 = a1;
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    char v23 = a2;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136446210;
    id v11 = [v7 description];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v14 = v13;

    uint64_t v15 = v12;
    a2 = v23;
    sub_100023568(v15, v14, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Deferring push of view controller: %{public}s on to the navigation stack", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v16 = *(void **)(v3 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredViewController);
  *(void *)(v3 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredViewController) = v7;
  id v17 = v7;

  *(unsigned char *)(v3 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredPushAnimated) = a2 & 1;
  unint64_t v18 = *(void **)(v3 + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController);
  if (v18)
  {
    id v19 = [v18 transitionCoordinator];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = (uint64_t)sub_10000D3E4;
      aBlock[5] = v21;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_10000CA1C;
      aBlock[3] = (uint64_t)&unk_10003DA50;
      uint64_t v22 = _Block_copy(aBlock);
      swift_release();
      [v20 notifyWhenInteractionChangesUsingBlock:v22];
      swift_unknownObjectRelease();
      _Block_release(v22);
    }
  }
}

void sub_10000C93C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = *(void **)(Strong + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredViewController);
    id v3 = v2;

    if (v2)
    {
      swift_beginAccess();
      uint64_t v4 = (unsigned __int8 *)swift_unknownObjectWeakLoadStrong();
      if (v4)
      {
        int v5 = v4[OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredPushAnimated];

        if (v5 != 2)
        {
          swift_beginAccess();
          uint64_t v6 = swift_unknownObjectWeakLoadStrong();
          if (v6)
          {
            id v7 = (void *)v6;
            sub_10000BE84(v3, v5 & 1);
          }
        }
      }
    }
  }
}

uint64_t sub_10000CA1C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_10000CA7C(int a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  id v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v24 - 8);
  __chkstk_darwin();
  uint64_t v10 = &v21[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_100045E58 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_100005EC0(v11, (uint64_t)qword_100048E58);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v23 = v5;
    aBlock[0] = v15;
    *(_DWORD *)uint64_t v14 = 136446466;
    int v22 = a1;
    uint64_t v25 = sub_100023568(0xD000000000000012, 0x8000000100032D90, aBlock);
    LOBYTE(a1) = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 1024;
    LODWORD(v25) = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%{public}s is invoked with animated: %{BOOL}d", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    uint64_t v5 = v23;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_10000D25C();
  id v16 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v2;
  *(unsigned char *)(v17 + 24) = a1 & 1;
  aBlock[4] = (uint64_t)sub_10000D2D4;
  aBlock[5] = v17;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100004EB0;
  aBlock[3] = (uint64_t)&unk_10003DA00;
  unint64_t v18 = _Block_copy(aBlock);
  id v19 = v2;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_10000D2F8();
  sub_100005F50((uint64_t *)&unk_100045FE0);
  sub_10000D350();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v18);

  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v24);
}

void sub_10000CE74(uint64_t a1, char a2)
{
  if (qword_100045E58 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100005EC0(v3, (uint64_t)qword_100048E58);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Dismissing remote alert service view controller", v6, 2u);
    swift_slowDealloc();
  }

  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v8 = Strong;
    [Strong dismissViewControllerAnimated:a2 & 1 completion:0];
  }
}

void *sub_10000CFBC()
{
  if (qword_100045E58 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005EC0(v0, (uint64_t)qword_100048E58);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Prox card flow did dismiss", v3, 2u);
    swift_slowDealloc();
  }

  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    os_log_type_t v5 = (void *)Strong;
    type metadata accessor for BYDovePeaceRemoteViewController();
    uint64_t v6 = swift_dynamicCastClass();
    if (v6)
    {
      id v7 = *(void **)(v6 + OBJC_IVAR___BYDovePeaceRemoteViewController_flowEngine);
      if (v7)
      {
        id v8 = v7;
        sub_100018874();
      }
    }
  }
  unint64_t result = (void *)sub_10000B650();
  if (result)
  {
    [result invalidate];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

id sub_10000D1A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProxCardPresenter();
  return [super dealloc];
}

uint64_t type metadata accessor for ProxCardPresenter()
{
  return self;
}

unint64_t sub_10000D25C()
{
  unint64_t result = qword_100045FD0;
  if (!qword_100045FD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100045FD0);
  }
  return result;
}

uint64_t sub_10000D29C()
{
  return _swift_deallocObject(v0, 25, 7);
}

void sub_10000D2D4()
{
  sub_10000CE74(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_10000D2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000D2F0()
{
  return swift_release();
}

unint64_t sub_10000D2F8()
{
  unint64_t result = qword_100046630;
  if (!qword_100046630)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046630);
  }
  return result;
}

unint64_t sub_10000D350()
{
  unint64_t result = qword_100046640;
  if (!qword_100046640)
  {
    sub_100005F94((uint64_t *)&unk_100045FE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046640);
  }
  return result;
}

uint64_t sub_10000D3AC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000D3E4()
{
}

uint64_t sub_10000D3EC()
{
  swift_release();

  return _swift_deallocObject(v0, 33, 7);
}

void sub_10000D42C()
{
  sub_10000C3A4(*(void *)(v0 + 16), *(void **)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_10000D438()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000D478()
{
  sub_10000BBC8(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10000D480(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005F50(&qword_100046650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D4E8(uint64_t a1)
{
  uint64_t v2 = sub_100005F50(&qword_100046650);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D560@<X0>(char a1@<W2>, uint64_t *a2@<X8>)
{
  if (a1)
  {
    if (qword_100045E78 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_100005EC0(v3, (uint64_t)qword_100048EB8);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Utilizing SimulatedFlow for list of stages to run", v6, 2u);
      swift_slowDealloc();
    }

    uint64_t v7 = type metadata accessor for SimulatedFlow();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = &off_10003D318;
    uint64_t v9 = &off_10003DB18;
  }
  else
  {
    id v50 = (char *)&_swiftEmptyArrayStorage;
    if (MKBGetDeviceLockState() - 1 <= 1)
    {
      if (qword_100045E78 != -1) {
        swift_once();
      }
      uint64_t v10 = type metadata accessor for Logger();
      sub_100005EC0(v10, (uint64_t)qword_100048EB8);
      uint64_t v11 = Logger.logObject.getter();
      os_log_type_t v12 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v11, v12))
      {
        os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Inserting device unlock stage since device is locked. ", v13, 2u);
        swift_slowDealloc();
      }

      sub_10000E128(0, 0, 0);
    }
    char v14 = sub_10001A8C4();
    if (qword_100045E78 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_100005EC0(v15, (uint64_t)qword_100048EB8);
    id v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc();
      v49[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v18 = 136315138;
      unint64_t v19 = 0xE700000000000000;
      uint64_t v20 = 0x6E776F6E6B6E55;
      switch(v14)
      {
        case 1:
          uint64_t v20 = 0xD00000000000001ALL;
          uint64_t v21 = "Non-HSA2 account signed in";
          goto LABEL_20;
        case 2:
          uint64_t v20 = 0xD000000000000015;
          uint64_t v21 = "HSA account signed in";
LABEL_20:
          unint64_t v19 = (unint64_t)(v21 - 32) | 0x8000000000000000;
          break;
        case 3:
          break;
        default:
          unint64_t v19 = 0x8000000100032F50;
          uint64_t v20 = 0xD000000000000014;
          break;
      }
      sub_100023568(v20, v19, v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Apple ID sign in status: %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    switch(v14)
    {
      case 0:
      case 2:
        break;
      case 1:
      case 3:
        int v22 = Logger.logObject.getter();
        os_log_type_t v23 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, v23, "User signed into a non-HSA2 account. Adding the apple ID account upgrade stage to the flow. ", v24, 2u);
          swift_slowDealloc();
        }

        uint64_t v25 = v50;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v25 = sub_10000E02C(0, *((void *)v25 + 2) + 1, 1, v25);
        }
        unint64_t v27 = *((void *)v25 + 2);
        unint64_t v26 = *((void *)v25 + 3);
        if (v27 >= v26 >> 1) {
          uint64_t v25 = sub_10000E02C((char *)(v26 > 1), v27 + 1, 1, v25);
        }
        *((void *)v25 + 2) = v27 + 1;
        v25[v27 + 32] = 1;
        id v50 = v25;
        break;
      default:
        JUMPOUT(0);
    }
    if (sub_10001AF78())
    {
      id v28 = Logger.logObject.getter();
      os_log_type_t v29 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v28, v29))
      {
        id v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "Apple ID credentials needs to be renewed. Inserting the AppleIDAccountsRenewalStage to the flow", v30, 2u);
        swift_slowDealloc();
      }

      int v31 = v50;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int v31 = sub_10000E02C(0, *((void *)v31 + 2) + 1, 1, v31);
      }
      unint64_t v33 = *((void *)v31 + 2);
      unint64_t v32 = *((void *)v31 + 3);
      if (v33 >= v32 >> 1) {
        int v31 = sub_10000E02C((char *)(v32 > 1), v33 + 1, 1, v31);
      }
      *((void *)v31 + 2) = v33 + 1;
      v31[v33 + 32] = 2;
      id v50 = v31;
    }
    else
    {
      int v31 = v50;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v31 = sub_10000E02C(0, *((void *)v31 + 2) + 1, 1, v31);
    }
    unint64_t v35 = *((void *)v31 + 2);
    unint64_t v34 = *((void *)v31 + 3);
    int64_t v36 = v34 >> 1;
    unint64_t v37 = v35 + 1;
    if (v34 >> 1 <= v35)
    {
      int v31 = sub_10000E02C((char *)(v34 > 1), v35 + 1, 1, v31);
      unint64_t v34 = *((void *)v31 + 3);
      int64_t v36 = v34 >> 1;
    }
    *((void *)v31 + 2) = v37;
    v31[v35 + 32] = 3;
    unint64_t v38 = v35 + 2;
    if (v36 < (uint64_t)(v35 + 2))
    {
      int v31 = sub_10000E02C((char *)(v34 > 1), v35 + 2, 1, v31);
      unint64_t v34 = *((void *)v31 + 3);
      int64_t v36 = v34 >> 1;
    }
    *((void *)v31 + 2) = v38;
    v31[v37 + 32] = 4;
    unint64_t v39 = v35 + 3;
    if (v36 < (uint64_t)(v35 + 3))
    {
      int v31 = sub_10000E02C((char *)(v34 > 1), v35 + 3, 1, v31);
      unint64_t v34 = *((void *)v31 + 3);
      int64_t v36 = v34 >> 1;
    }
    *((void *)v31 + 2) = v39;
    v31[v38 + 32] = 5;
    unint64_t v40 = v35 + 4;
    if (v36 < (uint64_t)(v35 + 4))
    {
      int v31 = sub_10000E02C((char *)(v34 > 1), v35 + 4, 1, v31);
      unint64_t v34 = *((void *)v31 + 3);
      int64_t v36 = v34 >> 1;
    }
    *((void *)v31 + 2) = v40;
    v31[v39 + 32] = 6;
    unint64_t v41 = v35 + 5;
    if (v36 < (uint64_t)(v35 + 5))
    {
      int v31 = sub_10000E02C((char *)(v34 > 1), v35 + 5, 1, v31);
      unint64_t v34 = *((void *)v31 + 3);
      int64_t v36 = v34 >> 1;
    }
    *((void *)v31 + 2) = v41;
    v31[v40 + 32] = 7;
    if (v36 < (uint64_t)(v35 + 6)) {
      int v31 = sub_10000E02C((char *)(v34 > 1), v35 + 6, 1, v31);
    }
    *((void *)v31 + 2) = v35 + 6;
    v31[v41 + 32] = 8;
    id v50 = v31;
    Swift::String v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v42, v43))
    {
      id v44 = (uint8_t *)swift_slowAlloc();
      v49[0] = swift_slowAlloc();
      *(_DWORD *)id v44 = 136446210;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v45 = Array.description.getter();
      unint64_t v47 = v46;
      swift_bridgeObjectRelease();
      sub_100023568(v45, v47, v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Generated list of stages to run: %{public}s", v44, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    swift_beginAccess();
    id v48 = v50;
    uint64_t v7 = type metadata accessor for DefaultFlow();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v48;
    uint64_t v9 = &off_10003DB38;
  }
  a2[3] = v7;
  a2[4] = (uint64_t)v9;
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for FlowFactory()
{
  return self;
}

uint64_t type metadata accessor for DefaultFlow()
{
  return self;
}

uint64_t (*sub_10000DEC4())()
{
  return j__swift_endAccess;
}

uint64_t sub_10000DF20()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for SimulatedFlow()
{
  return self;
}

uint64_t sub_10000DF7C()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = &off_10003D318;
  return result;
}

uint64_t sub_10000DF90()
{
  return swift_bridgeObjectRetain();
}

uint64_t (*sub_10000DFD4())()
{
  return j_j__swift_endAccess;
}

char *sub_10000E02C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_100005F50(&qword_1000468C8);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      os_log_type_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      os_log_type_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10000E288(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10000E128(uint64_t a1, int64_t a2, char a3)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  char v5 = *v3;
  int64_t v6 = *((void *)*v3 + 2);
  if (v6 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || v10 > *((void *)v5 + 3) >> 1)
  {
    if (v6 <= v10) {
      int64_t v13 = v6 + v9;
    }
    else {
      int64_t v13 = v6;
    }
    uint64_t result = sub_10000E02C(result, v13, 1, v5);
    char v5 = result;
  }
  char v14 = v5 + 32;
  uint64_t v15 = &v5[a1 + 32];
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v16 = *((void *)v5 + 2);
  size_t v17 = v16 - a2;
  if (__OFSUB__(v16, a2)) {
    goto LABEL_26;
  }
  if ((v17 & 0x8000000000000000) == 0)
  {
    uint64_t result = v15 + 1;
    unint64_t v18 = &v14[a2];
    if (v15 + 1 != &v14[a2] || result >= &v18[v17]) {
      uint64_t result = (char *)memmove(result, v18, v17);
    }
    uint64_t v19 = *((void *)v5 + 2);
    BOOL v20 = __OFADD__(v19, v9);
    uint64_t v21 = v19 + v9;
    if (!v20)
    {
      *((void *)v5 + 2) = v21;
LABEL_20:
      *uint64_t v15 = a3;
      *uint64_t v3 = v5;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_10000E288(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + a1 + 32);
    int64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_10000E374(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  size_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *((void *)v4 + 3) >> 1)
  {
    if (!v8) {
      goto LABEL_21;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t result = sub_10000E02C(result, v11, 1, v4);
    size_t v4 = result;
    if (!v8) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = *((void *)v4 + 2);
  size_t v13 = v12 - a2;
  if (__OFSUB__(v12, a2)) {
    goto LABEL_27;
  }
  if ((v13 & 0x8000000000000000) == 0)
  {
    uint64_t result = &v4[a1 + 32];
    char v14 = &v4[a2 + 32];
    if (a1 != a2 || result >= &v14[v13]) {
      uint64_t result = (char *)memmove(result, v14, v13);
    }
    uint64_t v15 = *((void *)v4 + 2);
    BOOL v16 = __OFADD__(v15, v8);
    uint64_t v17 = v15 + v8;
    if (!v16)
    {
      *((void *)v4 + 2) = v17;
LABEL_21:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000E4D0()
{
  uint64_t v1 = v0;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    int64_t v5 = (uint8_t *)swift_slowAlloc();
    v9[0] = swift_slowAlloc();
    *(_DWORD *)int64_t v5 = 136446210;
    uint64_t v6 = _typeName(_:qualified:)();
    v9[5] = sub_100023568(v6, v7, v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%{public}s is being deinitialized.", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  if (*(void *)(v1 + 48))
  {
    sub_10000B2E0(v1 + 24, (uint64_t)v9);
    sub_1000100F4(v9, v9[3]);
    dispatch thunk of Cancellable.cancel()();
    sub_10000AFBC((uint64_t)v9);
  }

  sub_100010098(v1 + 24, &qword_100046990);
  return v1;
}

uint64_t sub_10000E6E8()
{
  sub_10000E4D0();

  return _swift_deallocClassInstance(v0, 65, 7);
}

uint64_t type metadata accessor for VisualPairingUIProvider()
{
  return self;
}

uint64_t sub_10000E740(unint64_t a1)
{
  uint64_t v2 = v1;
  *(_OWORD *)(v1 + 24) = 0u;
  uint64_t v4 = v1 + 24;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 49) = 0u;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100005EC0(v5, (uint64_t)qword_100048E40);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  unint64_t v37 = a1;
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    unint64_t v38 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136446210;
    uint64_t v9 = _typeName(_:qualified:)();
    sub_100023568(v9, v10, (uint64_t *)&v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Initializing %{public}s.", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  type metadata accessor for ViewServiceUIViewControllerExtendedHeight();
  id v11 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  swift_weakAssign();
  *(void *)(v2 + 16) = v11;
  uint64_t v12 = self;
  id v13 = v11;
  id v14 = [v12 mainBundle];
  v42._object = (void *)0xE000000000000000;
  v15._object = (void *)0x8000000100033070;
  v15._countAndFlagsBits = 0xD000000000000014;
  v16.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v16.value._object = (void *)0xEB00000000656C62;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  v42._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v15, v16, (NSBundle)v14, v17, v42);

  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v13 setTitle:v18];

  id v19 = *(id *)(v2 + 16);
  id v20 = [v12 mainBundle];
  v21._countAndFlagsBits = 0xD000000000000017;
  v43._object = (void *)0xE000000000000000;
  v21._object = (void *)0x8000000100033090;
  v22.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v22.value._object = (void *)0xEB00000000656C62;
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  v43._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v21, v22, (NSBundle)v20, v23, v43);

  NSString v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v19 setSubtitle:v24];

  [*(id *)(v2 + 16) setDismissalType:1];
  id v25 = *(id *)(v2 + 16);
  sub_1000079FC();

  unint64_t v38 = v37;
  swift_retain();
  sub_100005F50(&qword_100046980);
  sub_100006018(&qword_100046988, &qword_100046980);
  uint64_t v26 = Publisher<>.sink(receiveValue:)();
  swift_release();
  uint64_t v40 = type metadata accessor for AnyCancellable();
  unint64_t v41 = &protocol witness table for AnyCancellable;
  unint64_t v38 = v26;
  swift_beginAccess();
  sub_10000FE80((uint64_t)&v38, v4);
  swift_endAccess();
  uint64_t v27 = swift_dynamicCastClass();
  if (v27)
  {
    id v28 = (uint64_t (**)())(v27
                         + OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_viewDidAppearCompletionHandler);
    uint64_t v29 = *(void *)(v27
                    + OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_viewDidAppearCompletionHandler);
    NSObject *v28 = sub_10000ECF4;
    v28[1] = 0;
    sub_10000AE58(v29);
  }
  CurrentValueSubject.value.getter();
  if (v39)
  {
    sub_10000F010(v38, v39);

    swift_bridgeObjectRelease();
  }
  else
  {
    id v30 = *(id *)(v2 + 16);
    id v31 = [v12 mainBundle];
    v32._countAndFlagsBits = 0xD00000000000001FLL;
    v44._object = (void *)0xE000000000000000;
    v32._object = (void *)0x80000001000330B0;
    v33.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v33.value._object = (void *)0xEB00000000656C62;
    v34._countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    v44._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v32, v33, (NSBundle)v31, v34, v44);

    NSString v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v30 showActivityIndicatorWithStatus:v35];
  }
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_10000ECF4()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  __chkstk_darwin(v0);
  uint64_t v1 = type metadata accessor for DispatchTime();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  os_log_type_t v7 = (char *)v11 - v6;
  sub_10000D25C();
  v11[0] = static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v2 + 8);
  v8(v5, v1);
  aBlock[4] = sub_10000EF88;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004EB0;
  aBlock[3] = &unk_10003DB78;
  _Block_copy(aBlock);
  v11[1] = &_swiftEmptyArrayStorage;
  sub_10000D2F8();
  sub_100005F50((uint64_t *)&unk_100045FE0);
  sub_100006018((unint64_t *)&qword_100046640, (uint64_t *)&unk_100045FE0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  type metadata accessor for DispatchWorkItem();
  swift_allocObject();
  DispatchWorkItem.init(flags:block:)();
  uint64_t v9 = (void *)v11[0];
  OS_dispatch_queue.asyncAfter(deadline:execute:)();

  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v8)(v7, v1);
}

void sub_10000EF88()
{
  UIAccessibilityNotifications v0 = UIAccessibilityAnnouncementNotification;
  sub_100021E98((uint64_t)&off_10003D348);
  Class argument = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  UIAccessibilityPostNotification(v0, argument);
}

void sub_10000F010(unint64_t a1, unint64_t a2)
{
  v5.Class isa = *(Class *)v2;
  uint64_t v6 = sub_100005F50(&qword_100046998);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (void *)((char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v7);
  id v11 = (void **)((char *)v42 - v10);
  uint64_t v12 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v12 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v12)
  {
    if (qword_100045E70 != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    sub_100005EC0(v17, (uint64_t)qword_100048EA0);
    os_log_t v43 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v43, v14)) {
      goto LABEL_14;
    }
    Swift::String v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String v15 = 0;
    Swift::String_optional v16 = "Setup pin not yet received.";
    goto LABEL_13;
  }
  if (*(unsigned char *)(v2 + 64))
  {
    if (qword_100045E70 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_100005EC0(v13, (uint64_t)qword_100048EA0);
    os_log_t v43 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v43, v14)) {
      goto LABEL_14;
    }
    Swift::String v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String v15 = 0;
    Swift::String_optional v16 = "Already showing the app clip code";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v43, v14, v16, v15, 2u);
    swift_slowDealloc();
LABEL_14:
    os_log_t v18 = v43;

    return;
  }
  if (qword_100045E70 != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for Logger();
  uint64_t v20 = sub_100005EC0(v19, (uint64_t)qword_100048EA0);
  swift_bridgeObjectRetain_n();
  Swift::String v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  BOOL v23 = os_log_type_enabled(v21, v22);
  os_log_t v43 = (os_log_t)v2;
  if (v23)
  {
    v42[0] = v20;
    NSString v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v42[1] = v5.isa;
    v45[0] = v25;
    *(_DWORD *)NSString v24 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_100023568(a1, a2, v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Encoding this pin: %s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  sub_1000281F0(a1, a2, v9);
  swift_bridgeObjectRelease();
  uint64_t v26 = type metadata accessor for VisualPairingAppClipCode();
  (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v9, 0, 1, v26);
  sub_10000FFAC((uint64_t)v9, (uint64_t)v11);
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    v45[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 136446210;
    uint64_t v30 = _typeName(_:qualified:)();
    uint64_t v44 = sub_100023568(v30, v31, v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Successfully generated ACC in %{public}s.", v29, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  os_log_t v32 = v43;
  LOBYTE(v43[8].isa) = 1;
  [(objc_class *)v32[2].isa hideActivityIndicator];
  Class isa = v32[2].isa;
  type metadata accessor for VisualPairingAppClipCode();
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(*(void *)(v26 - 8) + 48))(v11, 1, v26))
  {
    Swift::String v34 = self;
    NSString v35 = isa;
    id v36 = [v34 secondaryLabelColor];
    id v37 = sub_100008780(0xD000000000000013, 0x80000001000330E0, (uint64_t)v36);

    unint64_t v38 = 0;
  }
  else
  {
    unint64_t v38 = *v11;
    id v39 = objc_allocWithZone((Class)UIImageView);
    id v40 = v38;
    unint64_t v41 = isa;
    id v37 = [v39 initWithImage:v40];
  }
  [v37 setContentMode:1];
  sub_10000FF00(v38, 0, 0, 3);
  sub_100006964(v37, (uint64_t)v38, 0, 0, 3);

  sub_10000FF00(v38, 0, 0, 3);
  sub_100010098((uint64_t)v11, &qword_100046998);
}

void sub_10000F8CC(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = a1[1];
  if (v13)
  {
    uint64_t v32 = v4;
    uint64_t v33 = v10;
    os_log_t v34 = v9;
    uint64_t v14 = *a1;
    uint64_t v15 = qword_100045E50;
    swift_bridgeObjectRetain();
    if (v15 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_100005EC0(v16, (uint64_t)qword_100048E40);
    swift_bridgeObjectRetain_n();
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v30 = a2;
      uint64_t v19 = swift_slowAlloc();
      uint64_t v31 = v5;
      uint64_t v20 = (uint8_t *)v19;
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_100023568(v14, v13, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Received this pin: %s", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v5 = v31;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_10000D25C();
    uint64_t v25 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v26 = swift_allocObject();
    swift_weakInit();
    uint64_t v27 = (void *)swift_allocObject();
    v27[2] = v26;
    v27[3] = v14;
    v27[4] = v13;
    aBlock[4] = (uint64_t)sub_10001008C;
    aBlock[5] = (uint64_t)v27;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100004EB0;
    aBlock[3] = (uint64_t)&unk_10003DBF0;
    os_log_type_t v28 = _Block_copy(aBlock);
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_10000D2F8();
    sub_100005F50((uint64_t *)&unk_100045FE0);
    sub_100006018((unint64_t *)&qword_100046640, (uint64_t *)&unk_100045FE0);
    uint64_t v29 = v32;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v29);
    (*(void (**)(char *, os_log_t))(v33 + 8))(v12, v34);
  }
  else
  {
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_100005EC0(v21, (uint64_t)qword_100048E40);
    os_log_t v34 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v22))
    {
      BOOL v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v22, "No pin received from setup pin publisher", v23, 2u);
      swift_slowDealloc();
    }
    os_log_t v24 = v34;
  }
}

uint64_t sub_10000FE04(uint64_t a1, unint64_t a2, unint64_t a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_10000F010(a2, a3);
    return swift_release();
  }
  return result;
}

void sub_10000FE78(uint64_t *a1)
{
  sub_10000F8CC(a1, v1);
}

uint64_t sub_10000FE80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005F50(&qword_100046990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000FEF8()
{
  return swift_release();
}

void sub_10000FF00(void *a1, uint64_t a2, void *a3, char a4)
{
  switch(a4)
  {
    case 0:
      swift_bridgeObjectRelease();
      a1 = a3;
      goto LABEL_4;
    case 1:
    case 2:
    case 3:
LABEL_4:

      break;
    case 4:
    case 5:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_10000FFAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005F50(&qword_100046998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010014()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001004C()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001008C()
{
  return sub_10000FE04(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_100010098(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005F50(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_1000100F4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100010140()
{
  uint64_t v1 = v0;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "InstructionUIProvider is being deinitialized", v5, 2u);
    swift_slowDealloc();
  }

  return _swift_deallocClassInstance(v1, 24, 7);
}

uint64_t type metadata accessor for InstructionUIProvider()
{
  return self;
}

uint64_t sub_100010264()
{
  uint64_t v1 = v0;
  id v2 = [objc_allocWithZone((Class)PRXCardContentViewController) init];
  *(void *)(v0 + 16) = v2;
  id v3 = v2;
  [v3 setDismissalType:1];
  sub_1000079FC();
  os_log_type_t v4 = self;
  id v5 = [v4 mainBundle];
  v6._countAndFlagsBits = 0xD000000000000028;
  v19._object = (void *)0xE000000000000000;
  v6._object = (void *)0x8000000100033140;
  v7.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v7.value._object = (void *)0xEB00000000656C62;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  v19._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v6, v7, (NSBundle)v5, v8, v19);

  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v3 showActivityIndicatorWithStatus:v9];

  id v10 = [v4 mainBundle];
  v20._object = (void *)0xE000000000000000;
  v11._object = (void *)0x8000000100033170;
  v11._countAndFlagsBits = 0xD000000000000016;
  v12.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v12.value._object = (void *)0xEB00000000656C62;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  v20._countAndFlagsBits = 0;
  Swift::String v14 = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, v12, (NSBundle)v10, v13, v20);

  id v15 = [objc_allocWithZone((Class)UILabel) init];
  NSString v16 = String._bridgeToObjectiveC()();
  [v15 setText:v16];

  id v17 = [self preferredFontForTextStyle:UIFontTextStyleExtraLargeTitle2];
  [v15 setFont:v17];

  [v15 setTextAlignment:1];
  [v15 setNumberOfLines:0];
  sub_100006964(v15, v14._countAndFlagsBits, (uint64_t)v14._object, 0, 5);

  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1000104E8()
{
  uint64_t v1 = 0x676E696E6E7572;
  if (*v0 != 1) {
    uint64_t v1 = 0x676E69646E65;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701602409;
  }
}

uint64_t sub_100010538(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  Swift::String v8 = v7;
  int v52 = a6;
  int v53 = a7;
  uint64_t v54 = a5;
  id v55 = a3;
  uint64_t v50 = a4;
  id v51 = a2;
  id v48 = a1;
  uint64_t v49 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v9 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  Swift::String v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v12);
  uint64_t v13 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v13 - 8);
  Swift::String v14 = &v7[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage];
  *(_OWORD *)Swift::String v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((void *)v14 + 4) = 0;
  *(void *)&v7[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_navigationContoller] = 0;
  uint64_t v47 = OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue;
  uint64_t v46 = sub_100005FDC(0, (unint64_t *)&qword_100045FD0);
  id v15 = v7;
  static DispatchQoS.unspecified.getter();
  v56[0] = &_swiftEmptyArrayStorage;
  sub_100018F1C(&qword_100046AF8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005F50(&qword_100046B00);
  sub_100006018(&qword_100046B08, &qword_100046B00);
  NSString v16 = v48;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v49);
  uint64_t v17 = v47;
  *(void *)&v7[v17] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v15[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedServerInteractionEvent] = 0;
  v15[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedSetupCompletedEvent] = 0;
  *(void *)&v15[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_cancellables] = &_swiftEmptySetSingleton;
  uint64_t v18 = OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupPinPublisher;
  v56[0] = 0;
  v56[1] = 0;
  sub_100005F50(&qword_100046980);
  swift_allocObject();
  *(void *)&v15[v18] = CurrentValueSubject.init(_:)();
  v15[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress] = 0;
  uint64_t v19 = OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_layoutCache;
  type metadata accessor for ProxCardLayoutCache();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = 0;
  *(void *)(v20 + 24) = 0;
  *(unsigned char *)(v20 + 32) = 1;
  *(void *)&v15[v19] = v20;
  uint64_t v21 = v16[3];
  uint64_t v22 = v16[4];
  sub_1000100F4(v16, v21);
  uint64_t v23 = *(void *)((*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v21, v22) + 16);
  swift_bridgeObjectRelease();
  if (v23)
  {
    *(void *)&v15[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_appleIDManager] = v50;
    sub_10000B2E0((uint64_t)v16, (uint64_t)&v15[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow]);
    id v24 = v51;
    *(void *)&v15[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_presenter] = v51;
    uint64_t v25 = *(void **)&v8[v17];
    swift_retain();
    id v51 = v24;
    id v26 = v25;
    if (v55 && (id v27 = [v55 userInfo]) != 0)
    {
      os_log_type_t v28 = v27;
      uint64_t v29 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      *(void *)&long long v58 = 0xD000000000000010;
      *((void *)&v58 + 1) = 0x8000000100033370;
      AnyHashable.init<A>(_:)();
      uint64_t v30 = v54;
      char v32 = v52;
      char v31 = v53;
      if (*(void *)(v29 + 16) && (unint64_t v33 = sub_100023EC4((uint64_t)v56), (v34 & 1) != 0))
      {
        sub_100018E10(*(void *)(v29 + 56) + 32 * v33, (uint64_t)&v58);
      }
      else
      {
        long long v58 = 0u;
        long long v59 = 0u;
      }
      sub_100018DBC((uint64_t)v56);
      swift_bridgeObjectRelease();
      if (*((void *)&v59 + 1))
      {
        swift_dynamicCast();
        goto LABEL_12;
      }
    }
    else
    {
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v30 = v54;
      char v32 = v52;
      char v31 = v53;
    }
    sub_100010098((uint64_t)&v58, &qword_100046650);
LABEL_12:
    id v35 = objc_allocWithZone((Class)type metadata accessor for WFSetupClient());
    id v36 = (void *)WFSetupClient.init(queue:deviceIdentifier:)();
    *(void *)&v15[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupClient] = v36;
    *(void *)&v15[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_interactionEventPublisher] = v36;
    *(void *)&v15[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_assetLoader] = v30;
    v15[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_shouldAutoStart] = v32 & 1;
    v15[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_shouldSimulate] = v31 & 1;
    id v37 = v36;
    swift_retain();

    unint64_t v38 = (objc_class *)type metadata accessor for ProxCardFlowEngine();
    v57.receiver = v15;
    v57.super_class = v38;
    [super init];
    id v40 = self;
    id v41 = v39;
    id v42 = [v40 defaultCenter];
    id v43 = v41;
    NSString v44 = String._bridgeToObjectiveC()();
    [v42 addObserver:v43 selector:"handleDeviceSetupNotification:" name:v44 object:0 suspensionBehavior:4];

    swift_release();
    swift_release();
    sub_10000AFBC((uint64_t)v16);
    return (uint64_t)v43;
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id sub_100010BF8()
{
  uint64_t v1 = v0;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "ProxCardFlowEngine is being deinitialized…", v5, 2u);
    swift_slowDealloc();
  }

  id v6 = [self defaultCenter];
  id v7 = v1;
  NSString v8 = String._bridgeToObjectiveC()();
  [v6 removeObserver:v7 name:v8 object:0];

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for ProxCardFlowEngine();
  return [super dealloc];
}

uint64_t sub_100010E84()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005F50(&qword_100046BB8);
  __chkstk_darwin(v2 - 8);
  os_log_type_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = *(void **)&v0[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupClient];
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v7 = *(void (**)(void, uint64_t))((swift_isaMask & *v5) + 0x138);
  swift_retain();
  v7(sub_10001974C, v6);
  swift_release();
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v9 = *(void (**)(void (*)(), uint64_t))((swift_isaMask & *v5) + 0xD8);
  swift_retain();
  v9(sub_100019754, v8);
  swift_release();
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  Swift::String v11 = *(void (**)(void (*)(), uint64_t))((swift_isaMask & *v5) + 0xF0);
  swift_retain();
  v11(sub_100019778, v10);
  swift_release();
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v13 = *(void (**)(void (*)(uint64_t), uint64_t))((swift_isaMask & *v5) + 0x150);
  swift_retain();
  v13(sub_10001979C, v12);
  swift_release();
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v15 = *(void (**)(void (*)(int, uint64_t, unint64_t), uint64_t))((swift_isaMask & *v5)
                                                                                            + 0x198);
  swift_retain();
  v15(sub_1000197CC, v14);
  swift_release();
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v17 = *(void (**)(void (*)(uint64_t), uint64_t))((swift_isaMask & *v5) + 0x168);
  swift_retain();
  v17(sub_1000197D4, v16);
  swift_release();
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v4, 1, 1, v18);
  type metadata accessor for MainActor();
  id v19 = v1;
  uint64_t v20 = static MainActor.shared.getter();
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = v20;
  v21[3] = &protocol witness table for MainActor;
  unsigned char v21[4] = v19;
  sub_100021FAC((uint64_t)v4, (uint64_t)&unk_100046BC8, (uint64_t)v21);
  return swift_release();
}

void sub_1000112D0(unint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = (void *)Strong;
    sub_100014234(a1, a2);
  }
}

void sub_100011340(uint64_t a1, const char *a2)
{
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100005EC0(v3, (uint64_t)qword_100048E40);
  os_log_type_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, a2, v6, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    id v9 = *(id *)(Strong + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_presenter);

    sub_10000CA7C(1);
  }
}

void sub_100011474(int a1, uint64_t a2, unint64_t a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v7 = (void *)Strong;
    sub_100017074(a1, a2, a3);
  }
}

void sub_1000114EC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    a3(a1);
  }
}

uint64_t sub_10001155C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[27] = a4;
  type metadata accessor for MainActor();
  v4[28] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[29] = v6;
  v4[30] = v5;
  return _swift_task_switch(sub_1000115F4, v6, v5);
}

uint64_t sub_1000115F4()
{
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  *(void *)(v0 + 248) = sub_100005EC0(v1, (uint64_t)qword_100048E40);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Fetching assets from server.", v4, 2u);
    swift_slowDealloc();
  }

  id v7 = (uint64_t (__cdecl *)())((char *)&dword_100047610 + dword_100047610);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_100011764;
  return v7();
}

uint64_t sub_100011764()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 240);
  uint64_t v3 = *(void *)(v1 + 232);
  return _swift_task_switch(sub_100011884, v3, v2);
}

uint64_t sub_100011884()
{
  swift_release();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Running prox card flow engine", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[27];

  uint64_t v5 = v4 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = *(void *)(v5 + 32);
  sub_100018E6C(v5, v6);
  uint64_t result = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 24))(v0 + 17, v6, v7);
  if (*(void *)(*(void *)v9 + 16))
  {
    uint64_t v10 = (void (*)(void *, void))result;
    uint64_t v11 = v0[27];
    char v12 = *(unsigned char *)(*(void *)v9 + 32);
    sub_10000E374(0, 1);
    v10(v0 + 17, 0);
    swift_endAccess();
    sub_100013A84(v12, v0 + 2);
    sub_10000B2E0((uint64_t)(v0 + 2), (uint64_t)(v0 + 7));
    uint64_t v13 = v11 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage;
    swift_beginAccess();
    sub_100019534((uint64_t)(v0 + 7), v13);
    swift_endAccess();
    uint64_t v14 = v0[5];
    uint64_t v15 = v0[6];
    sub_1000100F4(v0 + 2, v14);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
    uint64_t v16 = v0[15];
    uint64_t v17 = v0[16];
    sub_1000100F4(v0 + 12, v16);
    uint64_t v18 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v16, v17);
    sub_10000B734(v18);

    sub_10000AFBC((uint64_t)(v0 + 12));
    if (*(unsigned char *)(v11 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_shouldSimulate) == 1) {
      sub_100011B3C();
    }
    else {
      sub_10001214C((uint64_t)(v0 + 2));
    }
    sub_10000AFBC((uint64_t)(v0 + 2));
    id v19 = (uint64_t (*)(void))v0[1];
    return v19();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100011B3C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005F50(&qword_100046B40);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005F50(&qword_100046B80);
  uint64_t v28 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005F50(&qword_100046B88);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = v0 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess();
  sub_10000B2E0(v11, (uint64_t)v30);
  uint64_t v13 = v31;
  uint64_t v12 = v32;
  sub_1000100F4(v30, v31);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v13, v12);
  sub_10000AFBC((uint64_t)v30);
  uint64_t v27 = *(void *)(v14 + 16);
  swift_bridgeObjectRelease();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  sub_100005FDC(0, &qword_100046B90);
  id v16 = [self mainRunLoop];
  uint64_t v17 = type metadata accessor for NSRunLoop.SchedulerOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v10, 1, 1, v17);
  uint64_t v18 = static NSTimer.publish(every:tolerance:on:in:options:)();

  sub_100010098((uint64_t)v10, &qword_100046B88);
  v30[0] = v18;
  type metadata accessor for NSTimer.TimerPublisher();
  sub_100018F1C(&qword_100046B98, (void (*)(uint64_t))&type metadata accessor for NSTimer.TimerPublisher);
  uint64_t v19 = ConnectablePublisher.autoconnect()();
  swift_release();
  v30[0] = v19;
  id v29 = *(id *)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  id v20 = v29;
  uint64_t v21 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v4, 1, 1, v21);
  id v22 = v20;
  sub_100005F50(&qword_100046BA0);
  sub_100005FDC(0, (unint64_t *)&qword_100045FD0);
  sub_100006018(&qword_100046BA8, &qword_100046BA0);
  sub_10001961C();
  Publisher.receive<A>(on:options:)();
  sub_100010098((uint64_t)v4, &qword_100046B40);

  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v24 = (void *)swift_allocObject();
  v24[2] = v23;
  v24[3] = v15;
  v24[4] = v27;
  v24[5] = v19;
  sub_100006018(&qword_100046BB0, &qword_100046B80);
  swift_retain();
  swift_retain();
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_100012050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)(a3 + 16);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = (void *)Strong;
    sub_100012AF8();
  }
  swift_beginAccess();
  if (*v5 == a4)
  {
    Publishers.Autoconnect.upstream.getter();
    NSTimer.TimerPublisher.connect()();
    swift_release();
    sub_1000100F4(v9, v9[3]);
    dispatch thunk of Cancellable.cancel()();
    return sub_10000AFBC((uint64_t)v9);
  }
  else
  {
    uint64_t result = swift_beginAccess();
    if (__OFADD__(*v5, 1)) {
      __break(1u);
    }
    else {
      ++*v5;
    }
  }
  return result;
}

void sub_10001214C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100005F50(&qword_100046B40);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005F50(&qword_100046B48);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B2E0(a1, (uint64_t)&v46);
  sub_100005F50(&qword_100046B50);
  sub_100005F50(&qword_100046B58);
  if (swift_dynamicCast())
  {
    sub_1000196C4(v44, (uint64_t)v49);
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v41 = v8;
    uint64_t v42 = v7;
    uint64_t v11 = type metadata accessor for Logger();
    sub_100005EC0(v11, (uint64_t)qword_100048E40);
    sub_10000B2E0(a1, (uint64_t)&v46);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v39 = a1;
      *(void *)&v44[0] = v15;
      uint64_t v40 = v1;
      *(_DWORD *)uint64_t v14 = 136446210;
      unint64_t v38 = v14 + 4;
      uint64_t v16 = v47;
      uint64_t v17 = v48;
      sub_1000100F4(&v46, v47);
      char v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 56))(v16, v17);
      unint64_t v19 = sub_10002ABF0(v18);
      uint64_t v43 = sub_100023568(v19, v20, (uint64_t *)v44);
      uint64_t v2 = v40;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_10000AFBC((uint64_t)&v46);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Subscribing to completion status for %{public}s stage", v14, 0xCu);
      swift_arrayDestroy();
      a1 = v39;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10000AFBC((uint64_t)&v46);
    }

    uint64_t v30 = v50;
    uint64_t v31 = v51;
    sub_1000100F4(v49, v50);
    *(void *)&long long v46 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8))(v30, v31);
    *(void *)&v44[0] = *(void *)(v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
    uint64_t v32 = *(void **)&v44[0];
    uint64_t v33 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v6, 1, 1, v33);
    id v34 = v32;
    sub_100005F50(&qword_100046B30);
    sub_100005FDC(0, (unint64_t *)&qword_100045FD0);
    sub_100006018(&qword_100046B68, &qword_100046B30);
    sub_10001961C();
    Publisher.receive<A>(on:options:)();
    sub_100010098((uint64_t)v6, &qword_100046B40);

    swift_release();
    uint64_t v35 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_10000B2E0(a1, (uint64_t)&v46);
    uint64_t v36 = swift_allocObject();
    sub_1000196C4(&v46, v36 + 16);
    *(void *)(v36 + 56) = v35;
    sub_100006018(&qword_100046B78, &qword_100046B48);
    uint64_t v37 = v42;
    Publisher<>.sink(receiveValue:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v37);
    swift_beginAccess();
    AnyCancellable.store(in:)();
    swift_endAccess();
    swift_release();
    sub_10000AFBC((uint64_t)v49);
  }
  else
  {
    uint64_t v45 = 0;
    memset(v44, 0, sizeof(v44));
    sub_100010098((uint64_t)v44, &qword_100046B60);
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_100005EC0(v21, (uint64_t)qword_100048E40);
    sub_10000B2E0(a1, (uint64_t)v49);
    id v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      id v24 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v46 = swift_slowAlloc();
      *(_DWORD *)id v24 = 136446210;
      uint64_t v25 = v50;
      uint64_t v26 = v51;
      sub_1000100F4(v49, v50);
      char v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 56))(v25, v26);
      unint64_t v28 = sub_10002ABF0(v27);
      *(void *)&v44[0] = sub_100023568(v28, v29, (uint64_t *)&v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_10000AFBC((uint64_t)v49);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "%{public}s stage is not subscribable", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10000AFBC((uint64_t)v49);
    }
  }
}

void sub_100012830(unsigned __int8 *a1, uint64_t a2)
{
  int v3 = *a1;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005EC0(v4, (uint64_t)qword_100048E40);
  sub_10000B2E0(a2, (uint64_t)v20);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v8 = 0x6E776F6E6B6E75;
    if (v3 != 1) {
      uint64_t v8 = 0x73736563637573;
    }
    if (v3) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0x64656C696166;
    }
    if (v3) {
      unint64_t v10 = 0xE700000000000000;
    }
    else {
      unint64_t v10 = 0xE600000000000000;
    }
    sub_100023568(v9, v10, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2082;
    uint64_t v11 = v21;
    uint64_t v12 = v22;
    sub_1000100F4(v20, v21);
    char v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 56))(v11, v12);
    unint64_t v14 = sub_10002ABF0(v13);
    sub_100023568(v14, v15, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10000AFBC((uint64_t)v20);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Received status: %s, for %{public}s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_10000AFBC((uint64_t)v20);
  }
  if (v3 == 2)
  {
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (!Strong) {
      return;
    }
    uint64_t v17 = (void *)Strong;
    sub_100012AF8(Strong);
  }
  else
  {
    swift_beginAccess();
    uint64_t v18 = swift_unknownObjectWeakLoadStrong();
    if (!v18) {
      return;
    }
    uint64_t v17 = (void *)v18;
    sub_100014738();
  }
}

uint64_t sub_100012AF8()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = *(void *)(v0 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_1000195D4;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004EB0;
  aBlock[3] = &unk_10003DDA0;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  char v13 = &_swiftEmptyArrayStorage;
  sub_100018F1C((unint64_t *)&qword_100046630, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005F50((uint64_t *)&unk_100045FE0);
  sub_100006018((unint64_t *)&qword_100046640, (uint64_t *)&unk_100045FE0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v12);
  swift_release();
  return swift_release();
}

void sub_100012DD0()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    sub_100005EC0(v20, (uint64_t)qword_100048E40);
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      os_log_type_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "ProxCard flow engine is unexpectedly deallocated.", v23, 2u);
      swift_slowDealloc();
    }

    return;
  }
  uint64_t v9 = (unsigned char *)Strong;
  uint64_t v46 = v5;
  uint64_t v10 = Strong + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess();
  sub_10000B2E0(v10, (uint64_t)aBlock);
  uint64_t v11 = v48;
  uint64_t v12 = v49;
  sub_1000100F4(aBlock, (uint64_t)v48);
  uint64_t v13 = (*((uint64_t (**)(void *, uint64_t (*)()))v12 + 1))(v11, v12);
  sub_10000AFBC((uint64_t)aBlock);
  uint64_t v14 = *(void *)(v13 + 16);
  swift_bridgeObjectRelease();
  if (!v14)
  {
    v9[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress] = 2;
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v24 = type metadata accessor for Logger();
    sub_100005EC0(v24, (uint64_t)qword_100048E40);
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      char v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Finished running proximity setup", v27, 2u);
      swift_slowDealloc();
    }

    id v28 = *(id *)&v9[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_presenter];
    sub_10000CA7C(1);

    return;
  }
  uint64_t v15 = (uint64_t)&v9[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage];
  swift_beginAccess();
  sub_1000193E4(v15, (uint64_t)aBlock);
  uint64_t v16 = v48;
  if (v48)
  {
    uint64_t v17 = v49;
    sub_1000100F4(aBlock, (uint64_t)v48);
    char v18 = (*((uint64_t (**)(void *, uint64_t (*)()))v17 + 7))(v16, v17);
    sub_100010098((uint64_t)aBlock, &qword_100046B20);
    uint64_t v19 = *(id *)&v9[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_interactionEventPublisher];
    sub_10000966C(v18, v19);
  }
  else
  {
    sub_100010098((uint64_t)aBlock, &qword_100046B20);
  }
  uint64_t v45 = v1;
  if (v9[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedServerInteractionEvent] != 1) {
    goto LABEL_25;
  }
  sub_10000B2E0(v10, (uint64_t)aBlock);
  unint64_t v29 = v48;
  uint64_t v30 = v49;
  sub_1000100F4(aBlock, (uint64_t)v48);
  uint64_t v31 = (*((uint64_t (**)(void *, uint64_t (*)()))v30 + 1))(v29, v30);
  sub_10000AFBC((uint64_t)aBlock);
  if (!*(void *)(v31 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  char v32 = *(unsigned char *)(v31 + 32);
  swift_bridgeObjectRelease();
  if (sub_10002AA8C(v32) != 0x7463757274736E69 || v33 != 0xEB000000006E6F69)
  {
    char v34 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v34) {
      goto LABEL_23;
    }
LABEL_25:
    sub_100005FDC(0, (unint64_t *)&qword_100045FD0);
    uint64_t v40 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v41 = swift_allocObject();
    *(void *)(v41 + 16) = v9;
    uint64_t v49 = sub_100019614;
    uint64_t v50 = v41;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100004EB0;
    uint64_t v48 = &unk_10003DDF0;
    uint64_t v42 = _Block_copy(aBlock);
    uint64_t v43 = v9;
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100018F1C((unint64_t *)&qword_100046630, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005F50((uint64_t *)&unk_100045FE0);
    sub_100006018((unint64_t *)&qword_100046640, (uint64_t *)&unk_100045FE0);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v42);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v3, v0);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v4);
    return;
  }
  swift_bridgeObjectRelease();
LABEL_23:
  swift_beginAccess();
  uint64_t v35 = *(void *)(v10 + 24);
  uint64_t v36 = *(void *)(v10 + 32);
  sub_100018E6C(v10, v35);
  uint64_t v37 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v36 + 24))(aBlock, v35, v36);
  if (*(void *)(*(void *)v38 + 16))
  {
    uint64_t v39 = (void (*)(void *, void))v37;
    sub_10000E374(0, 1);
    v39(aBlock, 0);
    swift_endAccess();
    goto LABEL_25;
  }
  __break(1u);
}

uint64_t sub_100013548(uint64_t a1)
{
  uint64_t v1 = a1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  sub_100018E6C(v1, v2);
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v3 + 24))(v8, v2, v3);
  if (*(void *)(*(void *)v5 + 16))
  {
    uint64_t v6 = (void (*)(unsigned char *, void))result;
    char v7 = *(unsigned char *)(*(void *)v5 + 32);
    sub_10000E374(0, 1);
    v6(v8, 0);
    swift_endAccess();
    return sub_100013628(v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100013628(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchPredicate();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (uint64_t *)((char *)&v32[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100005FDC(0, (unint64_t *)&qword_100045FD0);
  *char v7 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  char v8 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v7, v4);
  if (v8)
  {
    sub_100013A84(a1, v36);
    sub_10000B2E0((uint64_t)v36, (uint64_t)v33);
    uint64_t v9 = (uint64_t)v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage;
    swift_beginAccess();
    sub_100019534((uint64_t)v33, v9);
    swift_endAccess();
    sub_10001214C((uint64_t)v36);
    if (qword_100045E50 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v10 = type metadata accessor for Logger();
  sub_100005EC0(v10, (uint64_t)qword_100048E40);
  sub_10000B2E0((uint64_t)v36, (uint64_t)v33);
  uint64_t v11 = v2;
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    v32[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v15 = v34;
    uint64_t v16 = v35;
    sub_1000100F4(v33, v34);
    char v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 56))(v15, v16);
    unint64_t v18 = sub_10002AA8C(v17);
    uint64_t v31 = sub_100023568(v18, v19, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10000AFBC((uint64_t)v33);
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v20 = *(void **)(*(void *)&v11[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_presenter]
                   + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController);
    if (v20)
    {
      id v21 = [v20 description];
      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v24 = v23;
    }
    else
    {
      unint64_t v24 = 0xE300000000000000;
      uint64_t v22 = 7104878;
    }
    uint64_t v31 = sub_100023568(v22, v24, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Pushing %s on to navigation controller %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_10000AFBC((uint64_t)v33);
  }
  uint64_t v25 = v37;
  uint64_t v26 = v38;
  sub_1000100F4(v36, v37);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v26 + 8))(v33, v25, v26);
  uint64_t v27 = v34;
  uint64_t v28 = v35;
  sub_1000100F4(v33, v34);
  unint64_t v29 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8))(v27, v28);
  sub_10000BE84(v29, 1);

  sub_10000AFBC((uint64_t)v33);
  return sub_10000AFBC((uint64_t)v36);
}

void sub_100013A84(char a1@<W0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = v2;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100005EC0(v6, (uint64_t)qword_100048E40);
  char v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446210;
    unint64_t v10 = sub_10002ABF0(a1);
    sub_100023568(v10, v11, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Generate proximity stage for %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  switch(a1)
  {
    case 1:
      uint64_t v13 = type metadata accessor for AppleIDAccountUpgradeStage();
      uint64_t v14 = swift_allocObject();
      *(unsigned char *)(v14 + 16) = 1;
      type metadata accessor for AppleIDAccountUpgradeActionHandler();
      uint64_t v21 = swift_allocObject();
      sub_100005F50(&qword_100046B30);
      swift_allocObject();
      *(void *)(v21 + 16) = PassthroughSubject.init()();
      *(void *)(v14 + 64) = v21;
      uint64_t v22 = type metadata accessor for AppleIDAccountUpgradeUIProvider();
      swift_allocObject();
      uint64_t v23 = swift_retain();
      uint64_t v24 = sub_10002B1E4(v23);
      *(void *)(v14 + 48) = v22;
      *(void *)(v14 + 56) = &off_10003E830;
      *(void *)(v14 + 24) = v24;
      uint64_t v20 = &off_10003E340;
      break;
    case 2:
      uint64_t v25 = *(void *)&v3[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_appleIDManager];
      uint64_t v13 = type metadata accessor for AppleIDAccountRenewalStage();
      uint64_t v14 = swift_allocObject();
      *(unsigned char *)(v14 + 16) = 2;
      sub_100005F50(&qword_100046B30);
      swift_allocObject();
      swift_retain_n();
      *(void *)(v14 + 64) = PassthroughSubject.init()();
      *(void *)(v14 + 72) = v25;
      uint64_t v26 = type metadata accessor for AppleIDAccountRenewalUIProvider();
      swift_allocObject();
      swift_retain();
      uint64_t v27 = swift_retain();
      uint64_t v28 = sub_10002BE04(v27, v25);
      *(void *)(v14 + 48) = v26;
      *(void *)(v14 + 56) = &off_10003E910;
      *(void *)(v14 + 24) = v28;
      swift_release();
      uint64_t v20 = &off_10003DFC8;
      break;
    case 3:
      unint64_t v29 = *(void **)&v3[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupClient];
      uint64_t v30 = *(void *)&v3[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupPinPublisher];
      sub_100005F50(&qword_100046B38);
      uint64_t v31 = swift_allocObject();
      *(void *)(v31 + 16) = v30;
      uint64_t v32 = *(void *)&v3[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_assetLoader];
      char v33 = v3[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_shouldAutoStart];
      uint64_t v13 = type metadata accessor for IntroductionStage();
      swift_allocObject();
      id v34 = v29;
      swift_retain();
      swift_retain();
      uint64_t v14 = sub_10002784C(v34, v31, v32, v33);
      uint64_t v20 = &off_10003E598;
      break;
    case 4:
      uint64_t v13 = type metadata accessor for InstructionStage();
      uint64_t v14 = swift_allocObject();
      *(unsigned char *)(v14 + 16) = 4;
      uint64_t v35 = type metadata accessor for InstructionUIProvider();
      swift_allocObject();
      uint64_t v36 = sub_100010264();
      *(void *)(v14 + 48) = v35;
      *(void *)(v14 + 56) = &off_10003DC18;
      *(void *)(v14 + 24) = v36;
      uint64_t v20 = &off_10003D988;
      break;
    case 5:
      unint64_t v37 = *(void *)&v3[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupPinPublisher];
      uint64_t v13 = type metadata accessor for VisualPairingStage();
      uint64_t v14 = swift_allocObject();
      *(unsigned char *)(v14 + 16) = 5;
      uint64_t v38 = type metadata accessor for VisualPairingUIProvider();
      swift_allocObject();
      swift_retain_n();
      swift_retain_n();
      uint64_t v39 = sub_10000E740(v37);
      *(void *)(v14 + 48) = v38;
      *(void *)(v14 + 56) = &off_10003DB58;
      *(void *)(v14 + 24) = v39;
      swift_release();
      swift_release();
      uint64_t v20 = &off_10003E8A0;
      break;
    case 6:
      uint64_t v13 = type metadata accessor for PinPairingStage();
      uint64_t v14 = swift_allocObject();
      *(unsigned char *)(v14 + 16) = 6;
      uint64_t v40 = type metadata accessor for PinPairingUIProvider();
      swift_allocObject();
      swift_retain_n();
      uint64_t v41 = sub_10001ED74();
      *(void *)(v14 + 48) = v40;
      *(void *)(v14 + 56) = &off_10003E288;
      *(void *)(v14 + 24) = v41;
      swift_release();
      uint64_t v20 = &off_10003E7E0;
      break;
    case 7:
      uint64_t v42 = *(void **)&v3[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupClient];
      uint64_t v13 = type metadata accessor for ProgressStage();
      uint64_t v14 = swift_allocObject();
      *(unsigned char *)(v14 + 16) = 7;
      type metadata accessor for PrescriptionRecordProvider();
      uint64_t v43 = swift_allocObject();
      *(void *)(v14 + 64) = v42;
      *(void *)(v14 + 72) = v43;
      uint64_t v44 = type metadata accessor for ProgressUIProvider();
      swift_allocObject();
      id v45 = v42;
      swift_retain_n();
      id v46 = v45;
      swift_retain();
      uint64_t v47 = sub_10002B9E0(v46, v43);
      *(void *)(v14 + 48) = v44;
      *(void *)(v14 + 56) = &off_10003E8F0;
      *(void *)(v14 + 24) = v47;
      swift_release();

      uint64_t v20 = &off_10003E018;
      break;
    case 8:
      uint64_t v13 = type metadata accessor for CompleteStage();
      swift_allocObject();
      swift_retain();
      swift_retain();
      uint64_t v14 = sub_100019AF4();
      uint64_t v20 = &off_10003E078;
      break;
    case 9:
      uint64_t v13 = type metadata accessor for FailureStage();
      swift_allocObject();
      swift_retain();
      uint64_t v14 = sub_10001B7AC();
      uint64_t v20 = &off_10003E178;
      break;
    default:
      uint64_t v12 = *(void *)&v3[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_assetLoader];
      uint64_t v13 = type metadata accessor for DeviceUnlockStage();
      uint64_t v14 = swift_allocObject();
      *(unsigned char *)(v14 + 16) = 0;
      type metadata accessor for DeviceUnlockActionHandler();
      *(void *)(v14 + 64) = swift_allocObject();
      uint64_t v15 = type metadata accessor for DeviceUnlockUIProvider();
      uint64_t v16 = swift_allocObject();
      swift_retain_n();
      char v17 = v3;
      uint64_t v18 = swift_retain();
      uint64_t v19 = sub_100018FE0(v18, v12, v17, v16);
      *(void *)(v14 + 48) = v15;
      *(void *)(v14 + 56) = &off_10003E1C8;
      *(void *)(v14 + 24) = v19;
      swift_release();
      uint64_t v20 = &off_10003E1E8;
      break;
  }
  a2[3] = v13;
  a2[4] = (uint64_t)v20;
  *a2 = v14;
}

void sub_100014234(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DispatchPredicate();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (void *)((char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v10 = *(void **)(v3 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *uint64_t v9 = v10;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, enum case for DispatchPredicate.onQueue(_:), v6);
  id v11 = v10;
  char v12 = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
  if (v12)
  {
    if (qword_100045E50 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v14 = sub_100005EC0(v13, (uint64_t)qword_100048E40);
  swift_bridgeObjectRetain_n();
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v28[0] = swift_slowAlloc();
    uint64_t v30 = v28[0];
    *(_DWORD *)uint64_t v17 = 136446466;
    unint64_t v18 = a1;
    uint64_t v19 = sub_1000194A0(a1);
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v28[1] = v14;
    unint64_t v22 = v21;

    a1 = v18;
    uint64_t v29 = sub_100023568(v20, v22, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2082;
    uint64_t v29 = a2;
    swift_bridgeObjectRetain();
    sub_100005F50(&qword_100046B28);
    uint64_t v23 = String.init<A>(describing:)();
    uint64_t v29 = sub_100023568(v23, v24, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Received progress setup event: %{public}s, with info: %{public}s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  switch(a1)
  {
    case 0uLL:
      sub_100015C7C();
      break;
    case 1uLL:
      sub_100015724(a2);
      break;
    case 2uLL:
    case 4uLL:
    case 0xEuLL:
      sub_100014738();
      break;
    case 3uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
      return;
    case 5uLL:
      sub_100014C88();
      break;
    case 6uLL:
      sub_100014E44();
      break;
    case 0xFuLL:
      sub_100015A98();
      break;
    default:
      uint64_t v25 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 136446466;
        uint64_t v29 = sub_100023568(0xD000000000000022, 0x8000000100033410, &v30);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v27 + 12) = 2050;
        uint64_t v29 = a1;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "%{public}s received unknown setup progress event: %{public}ld", (uint8_t *)v27, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      break;
  }
}

void sub_100014738()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchPredicate();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (void *)((char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 40);
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = (void *)sub_100005EC0(v6, (uint64_t)qword_100048E40);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failure UI requested", v10, 2u);
    swift_slowDealloc();
  }

  id v11 = *(void **)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *uint64_t v5 = v11;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  id v12 = v11;
  uint64_t v13 = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if ((v13 & 1) == 0)
  {
    __break(1u);
LABEL_22:
    uint64_t v2 = (uint64_t)sub_10000E02C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
    *uint64_t v7 = v2;
    goto LABEL_15;
  }
  uint64_t v14 = v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage;
  swift_beginAccess();
  sub_1000193E4(v14, (uint64_t)v37);
  uint64_t v15 = v38;
  if (v38)
  {
    uint64_t v16 = v39;
    sub_1000100F4(v37, v38);
    char v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 56))(v15, v16);
    sub_100010098((uint64_t)v37, &qword_100046B20);
    if (sub_10002AA8C(v17) == 0x6974656C706D6F63 && v18 == 0xEA00000000006E6FLL)
    {
      swift_bridgeObjectRelease();
      BOOL v19 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress) == 2;
      LOBYTE(v15) = 1;
      goto LABEL_18;
    }
    LOBYTE(v15) = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100010098((uint64_t)v37, &qword_100046B20);
  }
  int v20 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress);
  BOOL v19 = v20 == 2;
  if (v20 == 2 || (v15 & 1) != 0)
  {
LABEL_18:
    char v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 67109376;
      LODWORD(v37[0]) = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v35 + 8) = 1024;
      LODWORD(v37[0]) = v15 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Ignoring failure and not showing failure prox card: setup is already complete. (Engine finished:%{BOOL}d, Completion card:%{BOOL}d)", (uint8_t *)v35, 0xEu);
      swift_slowDealloc();
    }

    return;
  }
  uint64_t v21 = v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess();
  uint64_t v22 = *(void *)(v21 + 24);
  uint64_t v23 = *(void *)(v21 + 32);
  sub_100018E6C(v21, v22);
  unint64_t v24 = (void (*)(void *, void))(*(uint64_t (**)(void *, uint64_t, uint64_t))(v23 + 24))(v37, v22, v23);
  *uint64_t v25 = &_swiftEmptyArrayStorage;
  v24(v37, 0);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v26 = *(void *)(v21 + 24);
  uint64_t v27 = *(void *)(v21 + 32);
  sub_100018E6C(v21, v26);
  uint64_t v13 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v27 + 24))(v37, v26, v27);
  uint64_t v7 = v28;
  uint64_t v2 = *v28;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v7 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_22;
  }
LABEL_15:
  unint64_t v31 = *(void *)(v2 + 16);
  unint64_t v30 = *(void *)(v2 + 24);
  if (v31 >= v30 >> 1)
  {
    uint64_t v2 = (uint64_t)sub_10000E02C((char *)(v30 > 1), v31 + 1, 1, (char *)v2);
    *uint64_t v7 = v2;
  }
  *(void *)(v2 + 16) = v31 + 1;
  *(unsigned char *)(v2 + v31 + 32) = 9;
  ((void (*)(void *, void))v13)(v37, 0);
  uint64_t v32 = swift_endAccess();
  sub_100012AF8(v32);
}

void sub_100014C88()
{
  uint64_t v1 = type metadata accessor for DispatchPredicate();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (uint64_t *)((char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *uint64_t v4 = v5;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, enum case for DispatchPredicate.onQueue(_:), v1);
  id v6 = v5;
  LOBYTE(v5) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v1);
  if (v5)
  {
    if (qword_100045E50 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v7 = type metadata accessor for Logger();
  sub_100005EC0(v7, (uint64_t)qword_100048E40);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "eventSecurityStart is received", v10, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_100014E44()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchPredicate();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v37[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  id v6 = *(void **)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  id v7 = v6;
  LOBYTE(v6) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0) {
    goto LABEL_37;
  }
  uint64_t v8 = v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess();
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v8 + 32);
  sub_100018E6C(v8, v9);
  uint64_t v11 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 24))(v37, v9, v10);
  id v12 = (void (*)(unsigned char *, void))v11;
  uint64_t v14 = v13;
  uint64_t v15 = *v13;
  uint64_t v16 = *((void *)*v13 + 2);
  if (v16)
  {
    uint64_t v36 = (void (*)(unsigned char *, void))v11;
    swift_bridgeObjectRetain();
    uint64_t v17 = 0;
    while (2)
    {
      int v18 = v15[v17 + 32];
      switch(v15[v17 + 32])
      {
        case 5:
LABEL_11:
          swift_bridgeObjectRelease();
          goto LABEL_12;
        default:
          char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v19 & 1) == 0)
          {
            switch(v18)
            {
              case 0:
              case 1:
              case 2:
              case 3:
              case 4:
              case 5:
              case 7:
              case 8:
              case 9:
                char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                if (v20) {
                  goto LABEL_12;
                }
                if (v16 != ++v17) {
                  continue;
                }
                swift_bridgeObjectRelease();
                int64_t v21 = *((void *)*v14 + 2);
                uint64_t v17 = v16;
                break;
              case 6:
                goto LABEL_11;
              default:
LABEL_43:
                JUMPOUT(0);
            }
LABEL_14:
            id v12 = v36;
            if (v21 >= v17) {
              goto LABEL_15;
            }
            goto LABEL_38;
          }
LABEL_12:
          swift_bridgeObjectRelease();
          int64_t v21 = v17 + 1;
          if (__OFADD__(v17, 1)) {
            goto LABEL_42;
          }
          uint64_t v22 = *v14;
          unint64_t v23 = *((void *)*v14 + 2);
          if (v21 == v23) {
            goto LABEL_14;
          }
          uint64_t v25 = v17 + 33;
          while (1)
          {
            unint64_t v26 = v25 - 32;
            if (v25 - 32 >= v23) {
              break;
            }
            int v27 = v22[v25];
            switch(v22[v25])
            {
              case 5:
LABEL_21:
                swift_bridgeObjectRelease();
                break;
              default:
                char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                if ((v28 & 1) == 0)
                {
                  switch(v27)
                  {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 7:
                    case 8:
                    case 9:
                      char v29 = _stringCompareWithSmolCheck(_:_:expecting:)();
                      swift_bridgeObjectRelease();
                      if (v29) {
                        goto LABEL_31;
                      }
                      if (v26 == v17) {
                        goto LABEL_30;
                      }
                      if (v17 < 0) {
                        goto LABEL_39;
                      }
                      unint64_t v30 = *v14;
                      unint64_t v31 = *((void *)*v14 + 2);
                      if (v17 >= v31) {
                        goto LABEL_40;
                      }
                      if (v26 >= v31) {
                        goto LABEL_41;
                      }
                      char v32 = v30[v17 + 32];
                      char v33 = v30[v25];
                      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                      *uint64_t v14 = v30;
                      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                      {
                        unint64_t v30 = sub_100018FCC((uint64_t)v30);
                        *uint64_t v14 = v30;
                      }
                      v30[v17 + 32] = v33;
                      (*v14)[v25] = v32;
LABEL_30:
                      if (!__OFADD__(v17++, 1)) {
                        goto LABEL_31;
                      }
                      goto LABEL_36;
                    case 6:
                      goto LABEL_21;
                    default:
                      goto LABEL_43;
                  }
                }
                break;
            }
LABEL_31:
            int64_t v21 = v25 - 31;
            if (__OFADD__(v26, 1)) {
              goto LABEL_35;
            }
            uint64_t v22 = *v14;
            unint64_t v23 = *((void *)*v14 + 2);
            ++v25;
            if (v21 == v23) {
              goto LABEL_14;
            }
          }
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          break;
      }
      break;
    }
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    JUMPOUT(0x100015684);
  }
  int64_t v21 = 0;
  uint64_t v17 = 0;
LABEL_15:
  sub_10000E374(v17, v21);
  v12(v37, 0);
  swift_endAccess();
  return sub_100012AF8();
}

uint64_t sub_100015724(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchPredicate();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (void *)((char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void **)(v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *id v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  id v9 = v8;
  LOBYTE(v8) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
    __break(1u);
LABEL_18:
    swift_once();
    goto LABEL_10;
  }
  if (!a1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    return sub_100010098((uint64_t)&v21, &qword_100046650);
  }
  v19[5] = 28517;
  v19[6] = 0xE200000000000000;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v10 = sub_100023EC4((uint64_t)v20), (v11 & 1) != 0))
  {
    sub_100018E10(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v21);
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
  }
  sub_100018DBC((uint64_t)v20);
  if (!*((void *)&v22 + 1)) {
    return sub_100010098((uint64_t)&v21, &qword_100046650);
  }
  sub_100005F50(&qword_100046178);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    return result;
  }
  if (qword_100045E50 != -1) {
    goto LABEL_18;
  }
LABEL_10:
  uint64_t v13 = type metadata accessor for Logger();
  sub_100005EC0(v13, (uint64_t)qword_100048E40);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    v20[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136446210;
    swift_getErrorValue();
    uint64_t v17 = Error.localizedDescription.getter();
    *(void *)&long long v21 = sub_100023568(v17, v18, v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Presenting failed stage due to error: %{public}s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_100014738();
  return swift_errorRelease();
}

void sub_100015A98()
{
  uint64_t v1 = type metadata accessor for DispatchPredicate();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (uint64_t *)((char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *uint64_t v4 = v5;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, enum case for DispatchPredicate.onQueue(_:), v1);
  id v6 = v5;
  LOBYTE(v5) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) == 0)
  {
    __break(1u);
LABEL_9:
    swift_once();
    goto LABEL_4;
  }
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedSetupCompletedEvent) & 1) == 0)
  {
    *(unsigned char *)(v0 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedSetupCompletedEvent) = 1;
    sub_100012AF8();
    return;
  }
  if (qword_100045E50 != -1) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v7 = type metadata accessor for Logger();
  sub_100005EC0(v7, (uint64_t)qword_100048E40);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Already received setup completed event. Ignoring setup completed event.", v10, 2u);
    swift_slowDealloc();
  }
}

void sub_100015C7C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchPredicate();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (uint64_t *)((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v6 = *(void **)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  id v7 = v6;
  LOBYTE(v6) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if (v6)
  {
    if (qword_100045E50 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v8 = type metadata accessor for Logger();
  sub_100005EC0(v8, (uint64_t)qword_100048E40);
  os_log_type_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Setup started event received. Transitioning the engine flow progress to running. ", v11, 2u);
    swift_slowDealloc();
  }

  *(unsigned char *)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress) = 1;
}

void sub_100015E54(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchPredicate();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (void *)((char *)v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void **)(v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *id v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  id v9 = v8;
  char v10 = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if (v10)
  {
    if (qword_100045E50 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v11 = type metadata accessor for Logger();
  sub_100005EC0(v11, (uint64_t)qword_100048E40);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v66 = v2;
    v68[0] = v15;
    *(_DWORD *)uint64_t v14 = 136446210;
    v65[1] = v14 + 4;
    uint64_t v16 = a1;
    uint64_t v17 = sub_10001944C(a1);
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v20 = v19;

    a1 = v16;
    uint64_t v67 = sub_100023568(v18, v20, v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Received server user interaction event: (%{public}s)", v14, 0xCu);
    swift_arrayDestroy();
    uint64_t v2 = v66;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (a1 == 1)
  {
    sub_100016A5C();
    long long v21 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v28))
    {
      char v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v28, "User chose pin pairing setup. ", v29, 2u);
LABEL_15:
      swift_slowDealloc();
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (a1)
  {
    long long v21 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      v68[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315394;
      uint64_t v67 = sub_100023568(0xD000000000000023, 0x80000001000333E0, v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v31 + 12) = 2050;
      uint64_t v67 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v21, v30, "%s received unknown user interaction event: %{public}ld", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      goto LABEL_14;
    }
LABEL_16:

    return;
  }
  if (*(unsigned char *)(v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedServerInteractionEvent))
  {
    long long v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      v68[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v23 = 136446210;
      unint64_t v24 = sub_10001944C(0);
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v27 = v26;

      uint64_t v67 = sub_100023568(v25, v27, v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Ignoring event: %{public}s since the flow has already received this event", v23, 0xCu);
      swift_arrayDestroy();
LABEL_14:
      swift_slowDealloc();
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  *(unsigned char *)(v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_hasReceivedServerInteractionEvent) = 1;
  uint64_t v32 = v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_currentStage;
  swift_beginAccess();
  sub_1000193E4(v32, (uint64_t)v68);
  uint64_t v33 = v69;
  if (!v69)
  {
    sub_100010098((uint64_t)v68, &qword_100046B20);
    goto LABEL_26;
  }
  uint64_t v34 = v70;
  sub_1000100F4(v68, v69);
  LOBYTE(v34) = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 56))(v33, v34);
  sub_100010098((uint64_t)v68, &qword_100046B20);
  if (sub_10002AA8C(v34) != 0x7463757274736E69 || v35 != 0xEB000000006E6F69)
  {
    char v36 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v36) {
      goto LABEL_23;
    }
LABEL_26:
    uint64_t v40 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Removing instructions pane from flow since user already interacted with first pane on the server side", v42, 2u);
      swift_slowDealloc();
    }

    uint64_t v43 = v2 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
    swift_beginAccess();
    uint64_t v44 = *(void *)(v43 + 24);
    uint64_t v45 = *(void *)(v43 + 32);
    sub_100018E6C(v43, v44);
    id v46 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v45 + 24))(v68, v44, v45);
    uint64_t v48 = v47;
    uint64_t v49 = *v47;
    uint64_t v50 = *((void *)*v47 + 2);
    if (!v50)
    {
      int64_t v53 = 0;
      uint64_t v51 = 0;
      goto LABEL_39;
    }
    swift_bridgeObjectRetain();
    uint64_t v51 = 0;
    while (1)
    {
      switch(v49[v51 + 32])
      {
        case 4:
          swift_bridgeObjectRelease();
          goto LABEL_36;
        default:
          char v52 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v52)
          {
LABEL_36:
            swift_bridgeObjectRelease();
            int64_t v53 = v51 + 1;
            if (!__OFADD__(v51, 1))
            {
              uint64_t v54 = *v48;
              unint64_t v55 = *((void *)*v48 + 2);
              if (v53 == v55)
              {
LABEL_38:
                if (v53 >= v51)
                {
LABEL_39:
                  sub_10000E374(v51, v53);
                  v46(v68, 0);
                  swift_endAccess();
                  return;
                }
              }
              else
              {
                uint64_t v56 = v51 + 33;
                while (2)
                {
                  unint64_t v57 = v56 - 32;
                  if (v56 - 32 < v55)
                  {
                    switch(v54[v56])
                    {
                      case 4:
                        swift_bridgeObjectRelease();
                        goto LABEL_53;
                      default:
                        char v58 = _stringCompareWithSmolCheck(_:_:expecting:)();
                        swift_bridgeObjectRelease();
                        if (v58) {
                          goto LABEL_53;
                        }
                        if (v57 == v51) {
                          goto LABEL_52;
                        }
                        if (v51 < 0) {
                          goto LABEL_61;
                        }
                        long long v59 = *v48;
                        unint64_t v60 = *((void *)*v48 + 2);
                        if (v51 >= v60) {
                          goto LABEL_62;
                        }
                        if (v57 >= v60) {
                          goto LABEL_63;
                        }
                        char v61 = v59[v51 + 32];
                        char v62 = v59[v56];
                        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                        *uint64_t v48 = v59;
                        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                        {
                          long long v59 = sub_100018FCC((uint64_t)v59);
                          *uint64_t v48 = v59;
                        }
                        v59[v51 + 32] = v62;
                        (*v48)[v56] = v61;
LABEL_52:
                        if (__OFADD__(v51++, 1)) {
                          goto LABEL_60;
                        }
LABEL_53:
                        int64_t v53 = v56 - 31;
                        if (__OFADD__(v57, 1)) {
                          goto LABEL_59;
                        }
                        uint64_t v54 = *v48;
                        unint64_t v55 = *((void *)*v48 + 2);
                        ++v56;
                        if (v53 == v55) {
                          goto LABEL_38;
                        }
                        continue;
                    }
                  }
                  break;
                }
                __break(1u);
LABEL_59:
                __break(1u);
LABEL_60:
                __break(1u);
LABEL_61:
                __break(1u);
LABEL_62:
                __break(1u);
LABEL_63:
                __break(1u);
              }
              __break(1u);
            }
            __break(1u);
            JUMPOUT(0x100016A0CLL);
          }
          if (v50 == ++v51)
          {
            swift_bridgeObjectRelease();
            int64_t v53 = *((void *)*v48 + 2);
            uint64_t v51 = v50;
            goto LABEL_38;
          }
          break;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_23:
  unint64_t v37 = Logger.logObject.getter();
  os_log_type_t v38 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Proceeding from the instruction pane since the user interacted with the first pane on the server side", v39, 2u);
    swift_slowDealloc();
  }

  sub_100012AF8();
}

uint64_t sub_100016A5C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchPredicate();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (void *)((char *)&v33[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  id v7 = v6;
  LOBYTE(v6) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0) {
    goto LABEL_36;
  }
  uint64_t v8 = v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess();
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v8 + 32);
  sub_100018E6C(v8, v9);
  uint64_t v11 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 24))(v33, v9, v10);
  uint64_t v12 = (void (*)(void *, void))v11;
  uint64_t v14 = v13;
  uint64_t v15 = *v13;
  uint64_t v16 = *((void *)*v13 + 2);
  if (v16)
  {
    uint64_t v32 = (void (*)(void *, void))v11;
    swift_bridgeObjectRetain();
    uint64_t v17 = 0;
    while (1)
    {
      switch(v15[v17 + 32])
      {
        case 5:
          swift_bridgeObjectRelease();
          goto LABEL_10;
        default:
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v18)
          {
LABEL_10:
            swift_bridgeObjectRelease();
            int64_t v19 = v17 + 1;
            if (__OFADD__(v17, 1)) {
              goto LABEL_38;
            }
            unint64_t v20 = *v14;
            unint64_t v21 = *((void *)*v14 + 2);
            if (v19 == v21)
            {
LABEL_12:
              uint64_t v12 = v32;
              if (v19 >= v17) {
                goto LABEL_13;
              }
LABEL_37:
              __break(1u);
LABEL_38:
              __break(1u);
              JUMPOUT(0x100017024);
            }
            uint64_t v23 = v17 + 33;
            while (2)
            {
              unint64_t v24 = v23 - 32;
              if (v23 - 32 < v21)
              {
                switch(v20[v23])
                {
                  case 5:
                    swift_bridgeObjectRelease();
                    goto LABEL_27;
                  default:
                    char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
                    swift_bridgeObjectRelease();
                    if (v25) {
                      goto LABEL_27;
                    }
                    if (v24 == v17) {
                      goto LABEL_26;
                    }
                    if (v17 < 0) {
                      goto LABEL_33;
                    }
                    unint64_t v26 = *v14;
                    unint64_t v27 = *((void *)*v14 + 2);
                    if (v17 >= v27) {
                      goto LABEL_34;
                    }
                    if (v24 >= v27) {
                      goto LABEL_35;
                    }
                    char v28 = v26[v17 + 32];
                    char v29 = v26[v23];
                    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                    *uint64_t v14 = v26;
                    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                    {
                      unint64_t v26 = sub_100018FCC((uint64_t)v26);
                      *uint64_t v14 = v26;
                    }
                    v26[v17 + 32] = v29;
                    (*v14)[v23] = v28;
LABEL_26:
                    if (__OFADD__(v17++, 1)) {
                      goto LABEL_32;
                    }
LABEL_27:
                    int64_t v19 = v23 - 31;
                    if (__OFADD__(v24, 1)) {
                      goto LABEL_31;
                    }
                    unint64_t v20 = *v14;
                    unint64_t v21 = *((void *)*v14 + 2);
                    ++v23;
                    if (v19 == v21) {
                      goto LABEL_12;
                    }
                    continue;
                }
              }
              break;
            }
            __break(1u);
LABEL_31:
            __break(1u);
LABEL_32:
            __break(1u);
LABEL_33:
            __break(1u);
LABEL_34:
            __break(1u);
LABEL_35:
            __break(1u);
LABEL_36:
            __break(1u);
            goto LABEL_37;
          }
          if (v16 == ++v17)
          {
            swift_bridgeObjectRelease();
            int64_t v19 = *((void *)*v14 + 2);
            uint64_t v17 = v16;
            goto LABEL_12;
          }
          break;
      }
    }
  }
  int64_t v19 = 0;
  uint64_t v17 = 0;
LABEL_13:
  sub_10000E374(v17, v19);
  v12(v33, 0);
  swift_endAccess();
  v33[0] = 0;
  v33[1] = 0;
  CurrentValueSubject.value.setter();
  return sub_100012AF8();
}

uint64_t sub_100017074(int a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for DispatchPredicate();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (uint64_t *)((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = *(void **)(v4 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue);
  *uint64_t v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, enum case for DispatchPredicate.onQueue(_:), v8);
  id v13 = v12;
  LOBYTE(v12) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if (v12)
  {
    if (qword_100045E50 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v14 = type metadata accessor for Logger();
  sub_100005EC0(v14, (uint64_t)qword_100048E40);
  swift_bridgeObjectRetain_n();
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v21[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_100023568(a2, a3, v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 1026;
    LODWORD(v20) = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Received pin: %s with pairingFlags: %{public}u", (uint8_t *)v17, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v21[0] = a2;
  v21[1] = a3;
  swift_bridgeObjectRetain();
  CurrentValueSubject.send(_:)();
  return swift_bridgeObjectRelease();
}

void sub_10001734C(uint64_t a1)
{
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    swift_errorRetain();
    sub_100005F50(&qword_100046B18);
    uint64_t v6 = String.init<A>(describing:)();
    sub_100023568(v6, v7, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Secure pairing completed with error: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    if (!a1) {
      return;
    }
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    if (!a1) {
      return;
    }
  }
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136446210;
    swift_errorRetain();
    sub_100005F50(&qword_100046B18);
    uint64_t v11 = String.init<A>(describing:)();
    sub_100023568(v11, v12, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Secure pairing failed with error: %{public}s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_100014738();
}

uint64_t sub_10001767C(void *a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = *(void *)&v1[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_queue];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = v1;
  aBlock[4] = sub_100018EFC;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004EB0;
  void aBlock[3] = &unk_10003DD00;
  unint64_t v12 = _Block_copy(aBlock);
  id v13 = a1;
  uint64_t v14 = v1;
  static DispatchQoS.unspecified.getter();
  v16[1] = &_swiftEmptyArrayStorage;
  sub_100018F1C((unint64_t *)&qword_100046630, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005F50((uint64_t *)&unk_100045FE0);
  sub_100006018((unint64_t *)&qword_100046640, (uint64_t *)&unk_100045FE0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

void sub_100017944(void *a1, uint8_t *a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v103 = *(void *)(v4 - 8);
  uint64_t v104 = v4;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005F50(&qword_100046B10);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v99 - v10;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100005EC0(v12, (uint64_t)qword_100048E40);
  id v13 = a1;
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  id v100 = v6;
  id v101 = v9;
  v102 = v11;
  if (v16)
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    v108[0] = swift_slowAlloc();
    v105 = a2;
    *(_DWORD *)uint64_t v17 = 136446210;
    id v18 = [v13 debugDescription:v17 + 4];
    uint64_t v19 = v13;
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v22 = v21;

    uint64_t v23 = v20;
    id v13 = v19;
    *(void *)&long long v109 = sub_100023568(v23, v22, v108);
    a2 = v105;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Received device setup notification: %{public}s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v24 = OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress;
  if (a2[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress])
  {
    id v25 = v13;
    unint64_t v26 = a2;
    id v27 = v25;
    char v28 = v26;
    char v29 = Logger.logObject.getter();
    int v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, (os_log_type_t)v30))
    {
      LODWORD(v105) = v30;
      uint64_t v31 = swift_slowAlloc();
      uint64_t v104 = swift_slowAlloc();
      v108[0] = v104;
      *(_DWORD *)uint64_t v31 = 136446466;
      id v32 = [v27 debugDescription];
      uint64_t v33 = a2;
      uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v36 = v35;

      *(void *)&long long v109 = sub_100023568(v34, v36, v108);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 12) = 2080;
      if (v33[v24])
      {
        if (v33[v24] == 1)
        {
          unint64_t v37 = 0xE700000000000000;
          uint64_t v38 = 0x676E696E6E7572;
        }
        else
        {
          unint64_t v37 = 0xE600000000000000;
          uint64_t v38 = 0x676E69646E65;
        }
      }
      else
      {
        unint64_t v37 = 0xE400000000000000;
        uint64_t v38 = 1701602409;
      }
      os_log_type_t v67 = v105;
      *(void *)&long long v109 = sub_100023568(v38, v37, v108);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v29, v67, "Ignoring setup notification: %{public}s since the engine flow progress: %s", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return;
  }
  id v39 = [v13 name];
  uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v42 = v41;

  if (v40 == 0xD00000000000001DLL && v42 == 0x8000000100033350)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v43 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v43 & 1) == 0)
    {
      id v58 = v13;
      long long v59 = Logger.logObject.getter();
      os_log_type_t v60 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v59, v60)) {
        goto LABEL_62;
      }
      char v61 = (uint8_t *)swift_slowAlloc();
      v108[0] = swift_slowAlloc();
      *(_DWORD *)char v61 = 136446210;
      id v68 = [v58 name];
      uint64_t v69 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v71 = v70;

      *(void *)&long long v109 = sub_100023568(v69, v71, v108);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      uint64_t v66 = "Ignoring notification: %{public}s since it is not an SFDeviceSetupNotification";
      goto LABEL_35;
    }
  }
  id v44 = [v13 userInfo];
  if (!v44)
  {
    long long v109 = 0u;
    long long v110 = 0u;
LABEL_27:
    sub_100010098((uint64_t)&v109, &qword_100046650);
    goto LABEL_28;
  }
  uint64_t v45 = v44;
  uint64_t v46 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v106 = 0x4449656369766564;
  unint64_t v107 = 0xE800000000000000;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v46 + 16) && (unint64_t v47 = sub_100023EC4((uint64_t)v108), (v48 & 1) != 0))
  {
    sub_100018E10(*(void *)(v46 + 56) + 32 * v47, (uint64_t)&v109);
  }
  else
  {
    long long v109 = 0u;
    long long v110 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_100018DBC((uint64_t)v108);
  if (!*((void *)&v110 + 1)) {
    goto LABEL_27;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_28:
    id v58 = v13;
    long long v59 = Logger.logObject.getter();
    os_log_type_t v60 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v59, v60)) {
      goto LABEL_62;
    }
    char v61 = (uint8_t *)swift_slowAlloc();
    v108[0] = swift_slowAlloc();
    *(_DWORD *)char v61 = 136446210;
    id v62 = [v58 debugDescription];
    uint64_t v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v65 = v64;

    *(void *)&long long v109 = sub_100023568(v63, v65, v108);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    uint64_t v66 = "Missing value for key SFDeviceSetupNotificationKeyDeviceIdentifier in notification: %{public}s";
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, v59, v60, v66, v61, 0xCu);
    swift_arrayDestroy();
    goto LABEL_36;
  }
  uint64_t v49 = a2;
  uint64_t v51 = v108[0];
  unint64_t v50 = v108[1];
  v105 = v49;
  char v52 = (void *)(*(uint64_t (**)(void))((swift_isaMask & **(void **)&v49[OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupClient])
                                     + 0x100))();
  if (!v52)
  {
LABEL_40:
    swift_bridgeObjectRetain();
    long long v59 = Logger.logObject.getter();
    os_log_type_t v74 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v59, v74))
    {

      swift_bridgeObjectRelease_n();
      return;
    }
    id v75 = (uint8_t *)swift_slowAlloc();
    v108[0] = swift_slowAlloc();
    *(_DWORD *)id v75 = 136446210;
    swift_bridgeObjectRetain();
    *(void *)&long long v109 = sub_100023568(v51, v50, v108);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v59, v74, "Ignoring device setup notification targeted for peer device with identifier: %{public}s", v75, 0xCu);
    swift_arrayDestroy();
LABEL_36:
    swift_slowDealloc();
    swift_slowDealloc();

    return;
  }
  int64_t v53 = v52;
  id v54 = [v52 identifier];

  if (v54)
  {
    uint64_t v55 = (uint64_t)v101;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v56 = 0;
    uint64_t v57 = v104;
  }
  else
  {
    uint64_t v56 = 1;
    uint64_t v57 = v104;
    uint64_t v55 = (uint64_t)v101;
  }
  uint64_t v72 = v103;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v103 + 56))(v55, v56, 1, v57);
  uint64_t v73 = (uint64_t)v102;
  sub_100018F64(v55, (uint64_t)v102);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48))(v73, 1, v57))
  {
    sub_100010098(v73, &qword_100046B10);
    goto LABEL_40;
  }
  uint64_t v76 = v100;
  (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v100, v73, v57);
  sub_100010098(v73, &qword_100046B10);
  uint64_t v77 = v72;
  uint64_t v78 = UUID.uuidString.getter();
  uint64_t v79 = v57;
  uint64_t v81 = v80;
  (*(void (**)(char *, uint64_t))(v77 + 8))(v76, v79);
  if (v51 == v78 && v50 == v81)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v82 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v82 & 1) == 0) {
      goto LABEL_40;
    }
  }
  swift_bridgeObjectRelease();
  id v83 = [v13 userInfo];
  if (!v83)
  {
    long long v109 = 0u;
    long long v110 = 0u;
LABEL_59:
    sub_100010098((uint64_t)&v109, &qword_100046650);
LABEL_60:
    id v58 = v13;
    long long v59 = Logger.logObject.getter();
    os_log_type_t v60 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v59, v60))
    {
      char v61 = (uint8_t *)swift_slowAlloc();
      v108[0] = swift_slowAlloc();
      *(_DWORD *)char v61 = 136446210;
      v105 = v61 + 4;
      id v92 = [v58 debugDescription];
      uint64_t v93 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v95 = v94;

      *(void *)&long long v109 = sub_100023568(v93, v95, v108);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      uint64_t v66 = "Missing value for key SFDeviceSetupNotificationKeyNeedsSetup in notification: %{public}s";
      goto LABEL_35;
    }
    goto LABEL_62;
  }
  id v84 = v83;
  uint64_t v85 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v106 = 0x746553736465656ELL;
  unint64_t v107 = 0xEA00000000007075;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v85 + 16))
  {
    unint64_t v86 = sub_100023EC4((uint64_t)v108);
    if (v87)
    {
      sub_100018E10(*(void *)(v85 + 56) + 32 * v86, (uint64_t)&v109);
    }
    else
    {
      long long v109 = 0u;
      long long v110 = 0u;
    }
  }
  else
  {
    long long v109 = 0u;
    long long v110 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_100018DBC((uint64_t)v108);
  if (!*((void *)&v110 + 1)) {
    goto LABEL_59;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_60;
  }
  if (v108[0])
  {
    id v58 = v13;
    long long v59 = Logger.logObject.getter();
    os_log_type_t v60 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v59, v60))
    {
      char v61 = (uint8_t *)swift_slowAlloc();
      v108[0] = swift_slowAlloc();
      *(_DWORD *)char v61 = 136446210;
      v105 = v61 + 4;
      id v88 = [v58 debugDescription];
      uint64_t v89 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v91 = v90;

      *(void *)&long long v109 = sub_100023568(v89, v91, v108);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      uint64_t v66 = "Device needs to be setup. Ignoring the notification: %{public}s";
      goto LABEL_35;
    }
LABEL_62:

    return;
  }
  id v96 = Logger.logObject.getter();
  os_log_type_t v97 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v96, v97))
  {
    id v98 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v98 = 0;
    _os_log_impl((void *)&_mh_execute_header, v96, v97, "Auto-dismissing proximity setup flow.", v98, 2u);
    swift_slowDealloc();
  }

  sub_10000CA7C(1);
}

uint64_t sub_100018874()
{
  uint64_t v1 = v0;
  if (qword_100045E48 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E28);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Invalidating ProxCardFlowEngine", v5, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(void))((swift_isaMask & **(void **)(v1
                                                   + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_setupClient))
                    + 0x1C8))();
  *(unsigned char *)(v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_engineFlowProgress) = 0;
  uint64_t v6 = v1 + OBJC_IVAR____TtC21TDGSharingViewService18ProxCardFlowEngine_flow;
  swift_beginAccess();
  uint64_t v7 = *(void *)(v6 + 24);
  uint64_t v8 = *(void *)(v6 + 32);
  sub_100018E6C(v6, v7);
  uint64_t v9 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 24))(v12, v7, v8);
  void *v10 = &_swiftEmptyArrayStorage;
  v9(v12, 0);
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for ProxCardFlowEngine()
{
  return self;
}

uint64_t getEnumTagSinglePayload for CompletionStatus(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ProxCardFlowEngine.ProxCardEngineFlowProgress(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x100018C00);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProxCardFlowEngine.ProxCardEngineFlowProgress()
{
  return &type metadata for ProxCardFlowEngine.ProxCardEngineFlowProgress;
}

unint64_t sub_100018C3C()
{
  unint64_t result = qword_100046AF0;
  if (!qword_100046AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046AF0);
  }
  return result;
}

uint64_t sub_100018C90()
{
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005EC0(v0, (uint64_t)qword_100048E40);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Device unlock stage is dismissing to display the passcode", v3, 2u);
    swift_slowDealloc();
  }

  return sub_100018874();
}

uint64_t sub_100018D7C(uint64_t result, unsigned char **a2)
{
  os_log_type_t v2 = *a2;
  *os_log_type_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100018D8C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100018DBC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100018E10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100018E6C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100018EBC()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100018EFC()
{
  sub_100017944(*(void **)(v0 + 16), *(uint8_t **)(v0 + 24));
}

uint64_t sub_100018F04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100018F14()
{
  return swift_release();
}

uint64_t sub_100018F1C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100018F64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005F50(&qword_100046B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *sub_100018FCC(uint64_t a1)
{
  return sub_10000E02C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100018FE0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  *(void *)(a4 + 40) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(a4 + 24) = a1;
  *(void *)(a4 + 40) = &off_10003DCC8;
  swift_unknownObjectWeakAssign();
  id v6 = objc_allocWithZone((Class)PRXCardContentViewController);
  swift_retain();
  id v7 = [v6 init];
  *(void *)(a4 + 16) = v7;
  int v8 = self;
  id v9 = v7;
  id v10 = [v8 mainBundle];
  v35._object = (void *)0xE000000000000000;
  v11._object = (void *)0x8000000100033440;
  v11._countAndFlagsBits = 0xD000000000000013;
  v12.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v12.value._object = (void *)0xEB00000000656C62;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  v35._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v11, v12, (NSBundle)v10, v13, v35);

  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v9 setTitle:v14];

  id v15 = *(id *)(a4 + 16);
  id v16 = [v8 mainBundle];
  v17._countAndFlagsBits = 0xD000000000000016;
  v36._object = (void *)0xE000000000000000;
  v17._object = (void *)0x8000000100033460;
  v18.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v18.value._object = (void *)0xEB00000000656C62;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  v36._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v17, v18, (NSBundle)v16, v19, v36);

  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v15 setSubtitle:v20];

  [*(id *)(a4 + 16) setDismissalType:3];
  id v21 = *(id *)(a4 + 16);
  id v22 = [v8 mainBundle];
  v23._countAndFlagsBits = 0xD000000000000014;
  v37._object = (void *)0xE000000000000000;
  v23._object = (void *)0x8000000100033480;
  v24.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v24.value._object = (void *)0xEB00000000656C62;
  v25._countAndFlagsBits = 0;
  v25._object = (void *)0xE000000000000000;
  v37._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v23, v24, (NSBundle)v22, v25, v37);

  uint64_t v26 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_10001952C;
  aBlock[5] = v26;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002B17C;
  void aBlock[3] = &unk_10003DD50;
  char v28 = _Block_copy(aBlock);
  id v29 = [self actionWithTitle:v27 style:0 handler:v28];

  _Block_release(v28);
  swift_release();
  swift_release();
  id v30 = [v21 addAction:v29];

  id v31 = *(id *)(a4 + 16);
  sub_100005994(v31, 1u);

  swift_release();
  swift_release();

  return a4;
}

uint64_t sub_1000193E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005F50(&qword_100046B20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

__CFString *sub_10001944C(uint64_t a1)
{
  if (a1)
  {
    if (a1 != 1) {
      goto LABEL_6;
    }
    uint64_t v1 = @"WFSetupServerUserInteractionProgressEventChosePinPairingSetup";
  }
  else
  {
    uint64_t v1 = @"WFSetupServerUserInteractionProgressEventBeganInteractingWithDevice";
  }
  uint64_t v2 = v1;
LABEL_6:

  return v1;
}

__CFString *sub_1000194A0(unint64_t a1)
{
  if (a1 <= 0xF)
  {
    uint64_t v1 = off_10003DF38[a1];
    uint64_t v2 = off_10003DEB8[a1];
  }

  return v1;
}

uint64_t sub_1000194F4()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001952C()
{
  return sub_10001BFF8();
}

uint64_t sub_100019534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005F50(&qword_100046B20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001959C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000195D4()
{
}

uint64_t sub_1000195DC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100019614()
{
  return sub_100013548(*(void *)(v0 + 16));
}

unint64_t sub_10001961C()
{
  unint64_t result = qword_100046B70;
  if (!qword_100046B70)
  {
    sub_100005FDC(255, (unint64_t *)&qword_100045FD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046B70);
  }
  return result;
}

uint64_t sub_100019684()
{
  sub_10000AFBC(v0 + 16);
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_1000196C4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void sub_1000196DC(unsigned __int8 *a1)
{
  sub_100012830(a1, v1 + 16);
}

uint64_t sub_1000196E8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000196F8()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100019740(uint64_t a1)
{
  return sub_100012050(a1, v1[2], v1[3], v1[4]);
}

void sub_10001974C(unint64_t a1, uint64_t a2)
{
}

void sub_100019754()
{
  sub_100011340(v0, "connection to server interrupted");
}

void sub_100019778()
{
  sub_100011340(v0, "connection to server invalidated");
}

void sub_10001979C(uint64_t a1)
{
  sub_1000114EC(a1, v1, sub_100015E54);
}

void sub_1000197CC(int a1, uint64_t a2, unint64_t a3)
{
}

void sub_1000197D4(uint64_t a1)
{
  sub_1000114EC(a1, v1, sub_10001734C);
}

uint64_t sub_100019804()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100019844(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_1000198F8;
  return sub_10001155C(a1, v4, v5, v6);
}

uint64_t sub_1000198F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100019A04()
{
  sub_10000AFBC(v0 + 24);
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for AppleIDAccountRenewalStage()
{
  return self;
}

uint64_t sub_100019A78()
{
  return swift_retain();
}

uint64_t sub_100019A84()
{
  sub_10000AFBC(v0 + 24);
  uint64_t v1 = *(void **)(v0 + 64);
  swift_release();

  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for ProgressStage()
{
  return self;
}

uint64_t sub_100019AF4()
{
  uint64_t v1 = v0;
  *(unsigned char *)(v0 + 16) = 8;
  type metadata accessor for CompleteActionHandler();
  uint64_t v2 = swift_allocObject();
  sub_100005F50(&qword_100046B30);
  swift_allocObject();
  *(void *)(v2 + 16) = PassthroughSubject.init()();
  *(void *)(v0 + 64) = v2;
  uint64_t v3 = type metadata accessor for CompleteUIProvider();
  swift_allocObject();
  swift_retain_n();
  swift_retain();
  uint64_t v4 = sub_10002C7B8(v2);
  uint64_t v7 = v3;
  int v8 = &off_10003E980;
  swift_release();
  swift_release();
  swift_release();
  *(void *)&long long v6 = v4;
  sub_1000196C4(&v6, v1 + 24);
  return v1;
}

uint64_t sub_100019BF4()
{
  sub_10000AFBC(v0 + 24);
  swift_release();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for CompleteStage()
{
  return self;
}

uint64_t sub_100019C58()
{
  return swift_retain();
}

unint64_t sub_100019C68()
{
  unint64_t result = 0x6E776F6E6B6E55;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      return result;
    default:
      unint64_t result = 0xD000000000000014;
      break;
  }
  return result;
}

void sub_100019D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = a4;
  int v8 = self;
  swift_retain();
  swift_retain();
  id v9 = [v8 sharedInstance];
  id v10 = [v9 primaryAuthKitAccount];

  if (v10)
  {
    if (qword_100045E80 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_100005EC0(v11, (uint64_t)qword_100048ED0);
    Swift::String_optional v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      NSString v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)NSString v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Creating AKAppleIDAuthenticationPurpleBuddyContext", v14, 2u);
      swift_slowDealloc();
    }

    id v15 = [objc_allocWithZone((Class)AKAppleIDAuthenticationPurpleBuddyContext) init];
    [v15 setShouldOfferSecurityUpgrade:1];
    [v15 setServiceType:1];
    [v15 setAnticipateEscrowAttempt:1];
    [v15 setShouldAllowAppleIDCreation:1];
    [v15 setAuthenticationType:2];
    [v15 setShouldUpdatePersistentServiceTokens:1];
    [v15 setIsUsernameEditable:0];
    id v35 = v15;
    id v16 = [v10 username];
    [v35 setUsername:v16];

    [v35 setPresentingViewController:a1];
    Swift::String v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      Swift::String v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Starting Authentication", v19, 2u);
      swift_slowDealloc();
    }

    id v20 = [objc_allocWithZone((Class)AKAppleIDAuthenticationController) init];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = swift_allocObject();
      swift_weakInit();
      Swift::String v23 = (void *)swift_allocObject();
      v23[2] = v10;
      uint64_t v23[3] = sub_10001B700;
      v23[4] = v7;
      v23[5] = v22;
      aBlock[4] = sub_10001B788;
      aBlock[5] = v23;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10001A7D0;
      void aBlock[3] = &unk_10003E140;
      Swift::String_optional v24 = _Block_copy(aBlock);
      id v25 = v35;
      id v26 = v21;
      id v27 = v10;
      swift_retain();
      swift_release();
      [v26 authenticateWithContext:v25 completion:v24];

      _Block_release(v24);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    if (qword_100045E80 != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    sub_100005EC0(v28, (uint64_t)qword_100048ED0);
    id v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      id v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "No apple ID found on the device.", v31, 2u);
      swift_slowDealloc();
    }

    if (qword_100045E50 != -1) {
      swift_once();
    }
    sub_100005EC0(v28, (uint64_t)qword_100048E40);
    id v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Apple ID Renewal Failed", v34, 2u);
      swift_slowDealloc();
    }

    LOBYTE(aBlock[0]) = 0;
    PassthroughSubject.send(_:)();
    swift_release();
    swift_release();
    swift_release();
  }
}

void sub_10001A310(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  Swift::String_optional v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    if (qword_100045E80 != -1) {
      swift_once();
    }
    sub_100005EC0(v9, (uint64_t)qword_100048ED0);
    id v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      id v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Successfully logged in.", v29, 2u);
      swift_slowDealloc();
    }

    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      if (sub_10001AF78())
      {
        os_log_type_t v30 = Logger.logObject.getter();
        os_log_type_t v31 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v30, v31))
        {
          id v32 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, v31, "Error, account renewal is still needed after successful login.", v32, 2u);
          swift_slowDealloc();
        }
      }
      swift_release();
    }
    goto LABEL_18;
  }
  if (qword_100045E80 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_100005EC0(v9, (uint64_t)qword_100048ED0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  id v14 = a3;
  swift_errorRetain();
  id v15 = v14;
  swift_errorRetain();
  id v16 = Logger.logObject.getter();
  int v17 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v16, (os_log_type_t)v17))
  {

    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    goto LABEL_18;
  }
  int v35 = v17;
  os_log_t v36 = v16;
  uint64_t v37 = a5;
  uint64_t v38 = a4;
  uint64_t v18 = swift_slowAlloc();
  uint64_t v34 = swift_slowAlloc();
  v40[0] = v34;
  *(_DWORD *)uint64_t v18 = 136315394;
  id v19 = [v15 username];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v23 = v22;

    uint64_t v39 = sub_100023568(v21, v23, v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    swift_getErrorValue();
    uint64_t v24 = Error.localizedDescription.getter();
    uint64_t v39 = sub_100023568(v24, v25, v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    os_log_t v26 = v36;
    _os_log_impl((void *)&_mh_execute_header, v36, (os_log_type_t)v35, "Failed to sign into iCloud account %s, error: %{public}s)", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    a4 = v38;
LABEL_18:
    a4(a2 == 0);
    return;
  }
  swift_errorRelease();

  __break(1u);
}

uint64_t sub_10001A7D0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_100005F50((uint64_t *)&unk_100046F20);
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for AppleIDManager()
{
  return self;
}

uint64_t sub_10001A89C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001A8C4()
{
  uint64_t v0 = self;
  id v1 = [v0 sharedInstance];
  id v2 = [v1 primaryAuthKitAccount];

  if (v2)
  {
    id v3 = [v2 aa_altDSID];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v7 = v6;
      id v8 = [v0 sharedInstance];
      id v9 = [v8 authKitAccountWithAltDSID:v4];

      if (v9)
      {
        swift_bridgeObjectRelease();
        id v10 = [v0 sharedInstance];
        id v11 = [v10 securityLevelForAccount:v9];

        if (qword_100045E80 != -1) {
          swift_once();
        }
        uint64_t v12 = type metadata accessor for Logger();
        sub_100005EC0(v12, (uint64_t)qword_100048ED0);
        id v13 = v9;
        id v14 = Logger.logObject.getter();
        os_log_type_t v15 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v14, v15))
        {
          uint64_t v16 = swift_slowAlloc();
          log = v14;
          int v17 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v16 = 138543874;
          id v18 = v13;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *int v17 = v9;

          *(_WORD *)(v16 + 12) = 1024;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v16 + 18) = 2050;
          uint64_t v38 = (uint64_t)v11;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, log, v15, "AuthKit account: %{public}@ isHSA2: %{BOOL}d with security level: %{public}lu", (uint8_t *)v16, 0x1Cu);
          sub_100005F50(&qword_100046268);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        if (v11 == (id)4) {
          return 2;
        }
        else {
          return 1;
        }
      }
      if (qword_100045E80 != -1) {
        swift_once();
      }
      uint64_t v32 = type metadata accessor for Logger();
      sub_100005EC0(v32, (uint64_t)qword_100048ED0);
      swift_bridgeObjectRetain();
      uint64_t v33 = Logger.logObject.getter();
      os_log_type_t v34 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v33, v34))
      {
        int v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        *(_DWORD *)int v35 = 136446210;
        swift_bridgeObjectRetain();
        sub_100023568(v5, v7, &v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v23 = 3;
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "Failed to authkit account for alternate dsid: %{public}s", v35, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        return v23;
      }

      swift_bridgeObjectRelease_n();
    }
    else
    {
      if (qword_100045E80 != -1) {
        swift_once();
      }
      uint64_t v24 = type metadata accessor for Logger();
      sub_100005EC0(v24, (uint64_t)qword_100048ED0);
      id v2 = v2;
      unint64_t v25 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v25, v26))
      {
        id v27 = (uint8_t *)swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        *(_DWORD *)id v27 = 136446210;
        id v28 = [v2 description];
        uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v31 = v30;

        sub_100023568(v29, v31, &v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Failed to find alternate dsid for account: %{public}s. ", v27, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        return 3;
      }
    }
    return 3;
  }
  if (qword_100045E80 != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for Logger();
  sub_100005EC0(v19, (uint64_t)qword_100048ED0);
  id v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    unint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "No apple ID found on the device.", v22, 2u);
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_10001AF78()
{
  uint64_t v0 = self;
  id v1 = [v0 sharedInstance];
  id v2 = [v1 primaryAuthKitAccount];

  if (!v2)
  {
    if (qword_100045E80 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_100005EC0(v16, (uint64_t)qword_100048ED0);
    id v8 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v17, "No apple ID found on the device.", v18, 2u);
      swift_slowDealloc();
    }
    goto LABEL_30;
  }
  id v3 = [v0 sharedInstance];
  id v4 = [v3 continuationTokenForAccount:v2];

  if (!v4)
  {
    if (qword_100045E80 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100005EC0(v19, (uint64_t)qword_100048ED0);
    id v20 = v2;
    os_log_type_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 138543362;
      uint64_t v41 = (uint64_t)v20;
      id v25 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v24 = v2;

      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Primary Account %{public}@ does not have a continuation token. Needs repair.", v23, 0xCu);
      sub_100005F50(&qword_100046268);
      uint64_t v26 = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      return 1;
    }
    return v26;
  }

  id v5 = [v0 sharedInstance];
  id v6 = [v5 passwordResetTokenForAccount:v2];

  if (v6)
  {

    if (qword_100045E80 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_100005EC0(v7, (uint64_t)qword_100048ED0);
    id v8 = v2;
    id v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      *(_DWORD *)id v11 = 136446210;
      id v12 = [v8 description];
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v15 = v14;

      sub_100023568(v13, v15, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return 0;
    }

LABEL_30:
    return 0;
  }
  if (qword_100045E80 != -1) {
    swift_once();
  }
  uint64_t v27 = type metadata accessor for Logger();
  sub_100005EC0(v27, (uint64_t)qword_100048ED0);
  id v28 = v2;
  uint64_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v29, v30))
  {
    unint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v31 = 138543362;
    uint64_t v41 = (uint64_t)v28;
    id v33 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v32 = v2;

    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Primary Account %{public}@ does not have a password reset token.", v31, 0xCu);
    sub_100005F50(&qword_100046268);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t result = (uint64_t)[self sharedConnection];
  if (result)
  {
    int v35 = (void *)result;
    unsigned int v36 = [(id)result isPasscodeSet];

    id v8 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.default.getter();
    BOOL v38 = os_log_type_enabled(v8, v37);
    if (v36)
    {
      if (v38)
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v37, "Primary Account has passcode enabled, we should initiate a repair.", v39, 2u);
        swift_slowDealloc();
      }
      else
      {
      }
      return 1;
    }
    if (!v38)
    {

      return 0;
    }
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v40 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v37, "Primary Account has no passcode, account is not elible for passwordless account transfer. No Repair needed.", v40, 2u);
    swift_slowDealloc();

    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001B6C0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001B700(uint64_t a1)
{
  return sub_100008B5C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10001B708()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001B740()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_10001B788(uint64_t a1, uint64_t a2)
{
  sub_10001A310(a1, a2, *(void **)(v2 + 16), *(void (**)(void))(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_10001B794(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001B7A4()
{
  return swift_release();
}

uint64_t sub_10001B7AC()
{
  uint64_t v1 = v0;
  *(unsigned char *)(v0 + 16) = 9;
  type metadata accessor for FailureActionHandler();
  uint64_t v2 = swift_allocObject();
  sub_100005F50(&qword_100046B30);
  swift_allocObject();
  *(void *)(v2 + 16) = PassthroughSubject.init()();
  *(void *)(v0 + 64) = v2;
  uint64_t v3 = type metadata accessor for FailureUIProvider();
  swift_allocObject();
  swift_retain_n();
  swift_retain();
  uint64_t v4 = sub_10002CF68(v2);
  uint64_t v7 = v3;
  id v8 = &off_10003E9F0;
  swift_release();
  swift_release();
  *(void *)&long long v6 = v4;
  sub_1000196C4(&v6, v1 + 24);
  return v1;
}

uint64_t type metadata accessor for FailureStage()
{
  return self;
}

uint64_t sub_10001B8C4()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10001BA3C(v0, qword_100048E10);
  sub_100005EC0(v0, (uint64_t)qword_100048E10);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001B944()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10001BA3C(v0, qword_100048E28);
  sub_100005EC0(v0, (uint64_t)qword_100048E28);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001B9C8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10001BA3C(v0, qword_100048E40);
  sub_100005EC0(v0, (uint64_t)qword_100048E40);
  return Logger.init(subsystem:category:)();
}

uint64_t *sub_10001BA3C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10001BAA0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10001BA3C(v0, qword_100048E58);
  sub_100005EC0(v0, (uint64_t)qword_100048E58);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001BB1C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10001BA3C(v0, qword_100048E70);
  sub_100005EC0(v0, (uint64_t)qword_100048E70);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001BBA0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10001BA3C(v0, qword_100048E88);
  sub_100005EC0(v0, (uint64_t)qword_100048E88);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001BC28()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10001BA3C(v0, qword_100048EA0);
  sub_100005EC0(v0, (uint64_t)qword_100048EA0);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001BCAC()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10001BA3C(v0, qword_100048EB8);
  sub_100005EC0(v0, (uint64_t)qword_100048EB8);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001BD2C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10001BA3C(v0, qword_100048ED0);
  sub_100005EC0(v0, (uint64_t)qword_100048ED0);
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for CompleteActionHandler()
{
  return self;
}

id sub_10001BF14()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for AppDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

uint64_t sub_10001BFF8()
{
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005EC0(v0, (uint64_t)qword_100048E40);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "DeviceUnlockUIProvider: card requesting device unlock", v3, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_retain();
    swift_release();
    sub_100021678();
    swift_release();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v5 = result;
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v6 = *(void *)(v5 + 40);
      swift_release();
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(ObjectType, v6);
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_10001C194()
{
  uint64_t v1 = v0;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "DeviceUnlockUIProvider deinit", v5, 2u);
    swift_slowDealloc();
  }

  swift_release();
  sub_10001C2E4(v1 + 32);
  return v1;
}

uint64_t sub_10001C28C()
{
  sub_10001C194();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for DeviceUnlockUIProvider()
{
  return self;
}

uint64_t sub_10001C2E4(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001C30C()
{
  uint64_t v1 = v0;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "DeviceUnlockStage deinit", v5, 2u);
    swift_slowDealloc();
  }

  sub_10000AFBC(v1 + 24);
  swift_release();

  return _swift_deallocClassInstance(v1, 72, 7);
}

uint64_t type metadata accessor for DeviceUnlockStage()
{
  return self;
}

id sub_10001C438()
{
  uint64_t v1 = v0;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "BYDovePeaceRemoteViewController deinit", v5, 2u);
    swift_slowDealloc();
  }

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for BYDovePeaceRemoteViewController();
  [super dealloc];
}

void sub_10001C6A0(char *a1, void (*a2)(uint64_t), uint64_t a3)
{
  os_log_type_t v4 = v3;
  v54[1] = a3;
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v63 = (char *)v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100005EC0(v7, (uint64_t)qword_100048E40);
  id v11 = a1;
  uint64_t v59 = v10;
  id v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  BOOL v14 = os_log_type_enabled(v12, v13);
  id v62 = a1;
  uint64_t v61 = v7;
  uint64_t v60 = v8;
  if (v14)
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v15 = 138543362;
    os_log_type_t v17 = v62;
    if (v62)
    {
      v68[0] = (uint64_t)v11;
      id v18 = v11;
      os_log_type_t v17 = v62;
    }
    else
    {
      v68[0] = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v16 = v17;

    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Preparing for activation with context: %{public}@", v15, 0xCu);
    sub_100005F50(&qword_100046268);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v7 = v61;
    uint64_t v8 = v60;
  }
  else
  {
  }
  id v19 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v20 = String._bridgeToObjectiveC()();
  id v21 = [v19 initWithSuiteName:v20];

  if (!v21) {
    __break(1u);
  }
  NSString v22 = String._bridgeToObjectiveC()();
  unsigned int v23 = [v21 BOOLForKey:v22];

  type metadata accessor for FlowFactory();
  uint64_t v24 = *(void *)&v4[OBJC_IVAR___BYDovePeaceRemoteViewController_appleIDManager];
  type metadata accessor for MobileKeyBagManager();
  swift_initStackObject();
  uint64_t v57 = v24;
  sub_10000D560(v23, v68);
  id v25 = (objc_class *)type metadata accessor for ProxCardPresenter();
  uint64_t v26 = objc_allocWithZone(v25);
  swift_unknownObjectWeakInit();
  *(void *)&v26[OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController] = 0;
  *(void *)&v26[OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredViewController] = 0;
  v26[OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredPushAnimated] = 2;
  swift_unknownObjectWeakAssign();
  v64.receiver = v26;
  v64.super_class = v25;
  id v56 = [super init];
  uint64_t v55 = OBJC_IVAR___BYDovePeaceRemoteViewController_configurationContext;
  uint64_t v27 = *(void **)&v4[OBJC_IVAR___BYDovePeaceRemoteViewController_configurationContext];
  unsigned int v58 = v23;
  if (!v27 || (id v28 = [v27 userInfo]) == 0)
  {
    long long v66 = 0u;
    long long v67 = 0u;
    id v33 = v63;
LABEL_16:
    sub_10000D4E8((uint64_t)&v66);
LABEL_17:
    int v34 = 0;
    goto LABEL_18;
  }
  uint64_t v29 = v28;
  uint64_t v30 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)&long long v66 = 0x726174536F747561;
  *((void *)&v66 + 1) = 0xE900000000000074;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v30 + 16) && (unint64_t v31 = sub_100023EC4((uint64_t)v65), (v32 & 1) != 0))
  {
    sub_100018E10(*(void *)(v30 + 56) + 32 * v31, (uint64_t)&v66);
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
  }
  id v33 = v63;
  sub_100018DBC((uint64_t)v65);
  swift_bridgeObjectRelease();
  if (!*((void *)&v67 + 1)) {
    goto LABEL_16;
  }
  if (!swift_dynamicCast()) {
    goto LABEL_17;
  }
  int v34 = LOBYTE(v65[0]);
LABEL_18:
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v33, v59, v7);
  int v35 = v11;
  unsigned int v36 = Logger.logObject.getter();
  os_log_type_t v37 = static os_log_type_t.default.getter();
  BOOL v38 = os_log_type_enabled(v36, v37);
  LODWORD(v59) = v34;
  if (v38)
  {
    uint64_t v39 = swift_slowAlloc();
    v65[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v39 = 67109378;
    LODWORD(v66) = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v39 + 8) = 2082;
    if (!v62)
    {
      __break(1u);
      return;
    }
    id v62 = v4;
    id v40 = [v35 userInfo];
    v54[0] = a2;
    if (v40)
    {
      uint64_t v41 = v40;
      static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {
      sub_100021D54((uint64_t)&_swiftEmptyArrayStorage);
    }
    uint64_t v42 = Dictionary.description.getter();
    unint64_t v44 = v43;
    swift_bridgeObjectRelease();
    *(void *)&long long v66 = sub_100023568(v42, v44, v65);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "Extracted autoStart value: %{BOOL}d from %{public}s", (uint8_t *)v39, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v60 + 8))(v63, v61);
    a2 = (void (*)(uint64_t))v54[0];
    os_log_type_t v4 = v62;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v33, v7);
  }
  sub_10000B2E0((uint64_t)v68, (uint64_t)v65);
  uint64_t v45 = *(void **)&v4[v55];
  uint64_t v46 = *(void *)&v4[OBJC_IVAR___BYDovePeaceRemoteViewController_assetLoader];
  objc_allocWithZone((Class)type metadata accessor for ProxCardFlowEngine());
  id v47 = v45;
  id v48 = v56;
  uint64_t v49 = v57;
  swift_retain();
  swift_retain();
  unint64_t v50 = (void *)sub_100010538(v65, v48, v45, v49, v46, v59, v58);
  uint64_t v51 = *(void **)&v4[OBJC_IVAR___BYDovePeaceRemoteViewController_flowEngine];
  *(void *)&v4[OBJC_IVAR___BYDovePeaceRemoteViewController_flowEngine] = v50;
  id v52 = v50;

  uint64_t v53 = sub_100010E84();
  if (a2)
  {
    a2(v53);

    sub_10000AFBC((uint64_t)v68);
  }
  else
  {
    sub_10000AFBC((uint64_t)v68);
  }
}

void sub_10001CFE0(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100005EC0(v8, (uint64_t)qword_100048E40);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  id v13 = a1;
  BOOL v14 = Logger.logObject.getter();
  int v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, (os_log_type_t)v15))
  {
    int v30 = v15;
    os_log_t v31 = v14;
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v34 = v29;
    *(_DWORD *)uint64_t v16 = 136446210;
    char v32 = a1;
    if (!a1)
    {
      __break(1u);
      return;
    }
    id v17 = [v13 userInfo];
    uint64_t v27 = a3;
    id v28 = a2;
    uint64_t v26 = v4;
    if (v17)
    {
      id v18 = v17;
      static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {
      sub_100021D54((uint64_t)&_swiftEmptyArrayStorage);
    }
    uint64_t v19 = Dictionary.description.getter();
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    uint64_t v33 = sub_100023568(v19, v21, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    os_log_t v22 = v31;
    _os_log_impl((void *)&_mh_execute_header, v31, (os_log_type_t)v30, "Received context: %{public}s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    a2 = v28;
    uint64_t v4 = v26;
    a1 = v32;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  unsigned int v23 = *(void **)(v4 + OBJC_IVAR___BYDovePeaceRemoteViewController_configurationContext);
  *(void *)(v4 + OBJC_IVAR___BYDovePeaceRemoteViewController_configurationContext) = a1;
  id v24 = v13;

  if (a2) {
    a2();
  }
}

id sub_10001D408()
{
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100005EC0(v1, (uint64_t)qword_100048E40);
  id v2 = v0;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    id v6 = [v2 description];
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v9 = v8;

    sub_100023568(v7, v9, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%{public}s view did load", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v10 = (objc_class *)type metadata accessor for BYDovePeaceRemoteViewController();
  v13.receiver = v2;
  v13.super_class = v10;
  return [super viewDidLoad];
}

uint64_t sub_10001D638()
{
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for BYDovePeaceRemoteViewController();
  [super _willAppearInRemoteViewController];
  if ([v0 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_10000D480((uint64_t)v3, (uint64_t)v4);
  if (!v5) {
    return sub_10000D4E8((uint64_t)v4);
  }
  sub_100005F50(&qword_100046658);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    [v2 setAllowsBanners:0];
    [v2 setAllowsAlertStacking:1];
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10001D77C(char a1)
{
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100005EC0(v3, (uint64_t)qword_100048E40);
  id v4 = v1;
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    v22[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446210;
    id v8 = [v4 description];
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;

    *(void *)&v21[0] = sub_100023568(v9, v11, v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%{public}s view did appear", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if ([v4 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v21, 0, sizeof(v21));
  }
  sub_10000D480((uint64_t)v21, (uint64_t)v22);
  if (v22[3])
  {
    sub_100005F50(&qword_100046658);
    if (swift_dynamicCast()) {
      uint64_t v12 = v19;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    sub_10000D4E8((uint64_t)v22);
    uint64_t v12 = 0;
  }
  objc_super v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    int v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Setting the system idle timer to disabled.", v15, 2u);
    swift_slowDealloc();
  }

  if (v12)
  {
    swift_unknownObjectRetain();
    NSString v16 = String._bridgeToObjectiveC()();
    [v12 setIdleTimerDisabled:1 forReason:v16];

    swift_unknownObjectRelease();
    swift_unknownObjectRetain();
    if (SFDeviceHomeButtonType() == 3) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 17;
    }
    [v12 setDesiredHardwareButtonEvents:v17];
    swift_unknownObjectRelease();
  }
  v20.receiver = v4;
  v20.super_class = (Class)type metadata accessor for BYDovePeaceRemoteViewController();
  [super viewDidAppear:a1 & 1];
  return swift_unknownObjectRelease();
}

uint64_t sub_10001DB58(char a1)
{
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100005EC0(v3, (uint64_t)qword_100048E40);
  id v4 = v1;
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    v21[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446210;
    id v8 = [v4 description];
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;

    *(void *)&v20[0] = sub_100023568(v9, v11, v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%{public}s view did disappear", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if ([v4 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v20, 0, sizeof(v20));
  }
  sub_10000D480((uint64_t)v20, (uint64_t)v21);
  if (v21[3])
  {
    sub_100005F50(&qword_100046658);
    if (swift_dynamicCast()) {
      uint64_t v12 = v18;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    sub_10000D4E8((uint64_t)v21);
    uint64_t v12 = 0;
  }
  objc_super v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    int v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Setting the system idle timer to enabled.", v15, 2u);
    swift_slowDealloc();
  }

  if (v12)
  {
    swift_unknownObjectRetain();
    NSString v16 = String._bridgeToObjectiveC()();
    [v12 setIdleTimerDisabled:0 forReason:v16];

    swift_unknownObjectRelease();
    [v12 invalidate];
  }
  v19.receiver = v4;
  v19.super_class = (Class)type metadata accessor for BYDovePeaceRemoteViewController();
  [super viewDidDisappear:a1 & 1];
  return swift_unknownObjectRelease();
}

void sub_10001DF14(uint64_t a1)
{
  if (qword_100045E50 != -1) {
LABEL_40:
  }
    swift_once();
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Received button action event", v5, 2u);
    swift_slowDealloc();
  }

  if (a1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      __CocoaSet.makeIterator()();
      sub_10001EA1C();
      sub_10001EA5C();
      Set.Iterator.init(_cocoa:)();
      a1 = v27;
      uint64_t v6 = v28;
      uint64_t v7 = v29;
      uint64_t v8 = v30;
      unint64_t v9 = v31;
    }
    else
    {
      uint64_t v10 = -1 << *(unsigned char *)(a1 + 32);
      uint64_t v6 = a1 + 56;
      uint64_t v7 = ~v10;
      uint64_t v11 = -v10;
      if (v11 < 64) {
        uint64_t v12 = ~(-1 << v11);
      }
      else {
        uint64_t v12 = -1;
      }
      unint64_t v9 = v12 & *(void *)(a1 + 56);
      swift_bridgeObjectRetain();
      uint64_t v8 = 0;
    }
    uint64_t v24 = v7;
    int64_t v13 = (unint64_t)(v7 + 64) >> 6;
    while (1)
    {
      if (a1 < 0)
      {
        if (!__CocoaSet.Iterator.next()()) {
          goto LABEL_38;
        }
        sub_10001EA1C();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v17 = v26;
        swift_unknownObjectRelease();
        uint64_t v16 = v8;
        uint64_t v14 = v9;
        if (!v26) {
          goto LABEL_38;
        }
      }
      else
      {
        if (v9)
        {
          uint64_t v14 = (v9 - 1) & v9;
          unint64_t v15 = __clz(__rbit64(v9)) | (v8 << 6);
          uint64_t v16 = v8;
        }
        else
        {
          int64_t v18 = v8 + 1;
          if (__OFADD__(v8, 1))
          {
            __break(1u);
            goto LABEL_40;
          }
          if (v18 >= v13) {
            goto LABEL_38;
          }
          unint64_t v19 = *(void *)(v6 + 8 * v18);
          uint64_t v16 = v8 + 1;
          if (!v19)
          {
            uint64_t v16 = v8 + 2;
            if (v8 + 2 >= v13) {
              goto LABEL_38;
            }
            unint64_t v19 = *(void *)(v6 + 8 * v16);
            if (!v19)
            {
              uint64_t v16 = v8 + 3;
              if (v8 + 3 >= v13) {
                goto LABEL_38;
              }
              unint64_t v19 = *(void *)(v6 + 8 * v16);
              if (!v19)
              {
                uint64_t v16 = v8 + 4;
                if (v8 + 4 >= v13) {
                  goto LABEL_38;
                }
                unint64_t v19 = *(void *)(v6 + 8 * v16);
                if (!v19)
                {
                  uint64_t v20 = v8 + 5;
                  while (v13 != v20)
                  {
                    unint64_t v19 = *(void *)(v6 + 8 * v20++);
                    if (v19)
                    {
                      uint64_t v16 = v20 - 1;
                      goto LABEL_33;
                    }
                  }
LABEL_38:
                  sub_10001EAB4();
                  return;
                }
              }
            }
          }
LABEL_33:
          uint64_t v14 = (v19 - 1) & v19;
          unint64_t v15 = __clz(__rbit64(v19)) + (v16 << 6);
        }
        id v17 = *(id *)(*(void *)(a1 + 48) + 8 * v15);
        if (!v17) {
          goto LABEL_38;
        }
      }
      if ((objc_msgSend(v17, "events", v24) & 0x10) != 0)
      {
        [v25 handleHomeButtonPressed];
        [v17 sendResponseWithUnHandledEvents:0];
        unint64_t v21 = Logger.logObject.getter();
        os_log_type_t v22 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v21, v22))
        {
          unsigned int v23 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unsigned int v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "Home button event handled", v23, 2u);
          swift_slowDealloc();
        }
      }
      uint64_t v8 = v16;
      unint64_t v9 = v14;
    }
  }
  __break(1u);
}

void sub_10001E354()
{
  uint64_t v1 = v0;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Handling home button press event", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = OBJC_IVAR___BYDovePeaceRemoteViewController_homePressed;
  if ((*((unsigned char *)v0 + OBJC_IVAR___BYDovePeaceRemoteViewController_homePressed) & 1) != 0
    || MKBGetDeviceLockState() - 1 > 1)
  {
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Dismissing due to button press", v12, 2u);
      swift_slowDealloc();
    }

    [v1 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      unint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "First button press while locked, deferring dismissal to next button press", v9, 2u);
      swift_slowDealloc();
    }

    *((unsigned char *)v1 + v6) = 1;
  }
}

id sub_10001E5BC(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR___BYDovePeaceRemoteViewController_flowEngine] = 0;
  *(void *)&v3[OBJC_IVAR___BYDovePeaceRemoteViewController_configurationContext] = 0;
  uint64_t v6 = OBJC_IVAR___BYDovePeaceRemoteViewController_appleIDManager;
  type metadata accessor for AppleIDManager();
  *(void *)&v3[v6] = swift_allocObject();
  uint64_t v7 = OBJC_IVAR___BYDovePeaceRemoteViewController_assetLoader;
  uint64_t v8 = type metadata accessor for MobileAssetsDownloader();
  v24[3] = v8;
  v24[4] = &off_10003E320;
  v24[0] = swift_allocObject();
  type metadata accessor for AssetLoader();
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = sub_100018E6C((uint64_t)v24, v8);
  __chkstk_darwin(v10);
  uint64_t v12 = (uint64_t *)((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v13 + 16))(v12);
  uint64_t v14 = *v12;
  uint64_t v22 = v8;
  unsigned int v23 = &off_10003E320;
  *(void *)&long long v21 = v14;
  *(void *)(v9 + 56) = 0;
  sub_1000196C4(&v21, v9 + 16);
  unint64_t v15 = v3;
  sub_10000AFBC((uint64_t)v24);
  *(void *)&v3[v7] = v9;
  v15[OBJC_IVAR___BYDovePeaceRemoteViewController_homePressed] = 0;

  if (a2)
  {
    NSString v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v16 = 0;
  }
  id v17 = (objc_class *)type metadata accessor for BYDovePeaceRemoteViewController();
  v20.receiver = v15;
  v20.super_class = v17;
  id v18 = [super initWithNibName:v16 bundle:a3];

  return v18;
}

id sub_10001E814(void *a1)
{
  *(void *)&v1[OBJC_IVAR___BYDovePeaceRemoteViewController_flowEngine] = 0;
  *(void *)&v1[OBJC_IVAR___BYDovePeaceRemoteViewController_configurationContext] = 0;
  uint64_t v3 = OBJC_IVAR___BYDovePeaceRemoteViewController_appleIDManager;
  type metadata accessor for AppleIDManager();
  *(void *)&v1[v3] = swift_allocObject();
  uint64_t v4 = OBJC_IVAR___BYDovePeaceRemoteViewController_assetLoader;
  uint64_t v5 = type metadata accessor for MobileAssetsDownloader();
  void v20[3] = v5;
  v20[4] = &off_10003E320;
  v20[0] = swift_allocObject();
  type metadata accessor for AssetLoader();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = sub_100018E6C((uint64_t)v20, v5);
  __chkstk_darwin(v7);
  uint64_t v9 = (uint64_t *)((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = *v9;
  uint64_t v18 = v5;
  unint64_t v19 = &off_10003E320;
  *(void *)&long long v17 = v11;
  *(void *)(v6 + 56) = 0;
  sub_1000196C4(&v17, v6 + 16);
  uint64_t v12 = v1;
  sub_10000AFBC((uint64_t)v20);
  *(void *)&v1[v4] = v6;
  v12[OBJC_IVAR___BYDovePeaceRemoteViewController_homePressed] = 0;

  uint64_t v13 = (objc_class *)type metadata accessor for BYDovePeaceRemoteViewController();
  v16.receiver = v12;
  v16.super_class = v13;
  id v14 = [super initWithCoder:a1];

  return v14;
}

uint64_t type metadata accessor for BYDovePeaceRemoteViewController()
{
  return self;
}

unint64_t sub_10001EA1C()
{
  unint64_t result = qword_1000472D8;
  if (!qword_1000472D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000472D8);
  }
  return result;
}

unint64_t sub_10001EA5C()
{
  unint64_t result = qword_1000472E0;
  if (!qword_1000472E0)
  {
    sub_10001EA1C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000472E0);
  }
  return result;
}

uint64_t sub_10001EAB4()
{
  return swift_release();
}

uint64_t sub_10001EABC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001EAF4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_10001EB04(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_10001EBBC(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_10001EBE8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001EC10@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10001EC48()
{
  uint64_t v1 = v0;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "ProxCardPinPairingUI is being deinitialized", v5, 2u);
    swift_slowDealloc();
  }

  sub_10001F8BC(v1 + 24);

  return _swift_deallocClassInstance(v1, 65, 7);
}

uint64_t type metadata accessor for PinPairingUIProvider()
{
  return self;
}

uint64_t sub_10001ED74()
{
  uint64_t v1 = v0;
  *(_OWORD *)(v0 + 49) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  uint64_t v2 = v0 + 24;
  id v3 = [objc_allocWithZone((Class)PRXCardContentViewController) init];
  *(void *)(v1 + 16) = v3;
  os_log_type_t v4 = self;
  id v5 = v3;
  id v6 = [v4 mainBundle];
  v34._object = (void *)0xE000000000000000;
  v7._object = (void *)0x8000000100033BC0;
  v7._countAndFlagsBits = 0xD000000000000011;
  v8.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v8.value._object = (void *)0xEB00000000656C62;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v34._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v7, v8, (NSBundle)v6, v9, v34);

  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v5 setTitle:v10];

  id v11 = *(id *)(v1 + 16);
  id v12 = [v4 mainBundle];
  v13._countAndFlagsBits = 0xD000000000000014;
  v35._object = (void *)0xE000000000000000;
  v13._object = (void *)0x8000000100033BE0;
  v14.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v14.value._object = (void *)0xEB00000000656C62;
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  v35._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v13, v14, (NSBundle)v12, v15, v35);

  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v11 setSubtitle:v16];

  [*(id *)(v1 + 16) setDismissalType:1];
  id v17 = *(id *)(v1 + 16);
  sub_1000079FC();

  swift_retain();
  sub_100005F50(&qword_100046980);
  sub_100006018(&qword_100046988, &qword_100046980);
  uint64_t v18 = Publisher<>.sink(receiveValue:)();
  swift_release();
  uint64_t v32 = type metadata accessor for AnyCancellable();
  uint64_t v33 = &protocol witness table for AnyCancellable;
  uint64_t v30 = v18;
  swift_beginAccess();
  sub_10000FE80((uint64_t)&v30, v2);
  swift_endAccess();
  CurrentValueSubject.value.getter();
  if (v31)
  {
    sub_10001F20C(v30, v31);
    swift_bridgeObjectRelease();
    swift_release();
    *(unsigned char *)(v1 + 64) = 1;
  }
  else
  {
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100005EC0(v19, (uint64_t)qword_100048E40);
    objc_super v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "No pin received from setup pin publisher", v22, 2u);
      swift_slowDealloc();
    }

    id v23 = *(id *)(v1 + 16);
    id v24 = [v4 mainBundle];
    v25._countAndFlagsBits = 0xD00000000000001CLL;
    v36._object = (void *)0xE000000000000000;
    v25._object = (void *)0x8000000100033C00;
    v26.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v26.value._object = (void *)0xEB00000000656C62;
    v27._countAndFlagsBits = 0;
    v27._object = (void *)0xE000000000000000;
    v36._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v25, v26, (NSBundle)v24, v27, v36);

    NSString v28 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v23 showActivityIndicatorWithStatus:v28];

    swift_release();
  }
  return v1;
}

void sub_10001F20C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v3 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v3)
  {
    if (*(unsigned char *)(v2 + 64))
    {
      if (qword_100045E50 != -1) {
        swift_once();
      }
      uint64_t v4 = type metadata accessor for Logger();
      sub_100005EC0(v4, (uint64_t)qword_100048E40);
      oslog = Logger.logObject.getter();
      os_log_type_t v5 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(oslog, v5))
      {
        id v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v6 = 0;
        Swift::String v7 = "Already showing the pin";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, oslog, v5, v7, v6, 2u);
        swift_slowDealloc();
      }
    }
    else
    {
      [*(id *)(v2 + 16) hideActivityIndicator];
      id v11 = *(void **)(v2 + 16);
      id v12 = objc_allocWithZone((Class)UILabel);
      id v13 = v11;
      oslog = [v12 init];
      NSString v14 = String._bridgeToObjectiveC()();
      [oslog setText:v14];

      id v15 = [self preferredFontForTextStyle:UIFontTextStyleLargeTitle];
      [oslog setFont:v15];

      [oslog setTextAlignment:1];
      sub_100006964(oslog, a1, a2, 0, 4);
    }
  }
  else
  {
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100005EC0(v8, (uint64_t)qword_100048E40);
    oslog = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v6 = 0;
      Swift::String v7 = "Setup pin not yet received. ";
      goto LABEL_13;
    }
  }
}

uint64_t sub_10001F498(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  os_log_type_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  uint64_t v9 = a1[1];
  sub_10000D25C();
  id v11 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  id v13 = (void *)swift_allocObject();
  v13[2] = v10;
  v13[3] = v9;
  v13[4] = v12;
  aBlock[4] = sub_10001F99C;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004EB0;
  void aBlock[3] = &unk_10003E2F8;
  NSString v14 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000D2F8();
  sub_100005F50((uint64_t *)&unk_100045FE0);
  sub_100006018((unint64_t *)&qword_100046640, (uint64_t *)&unk_100045FE0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v17);
}

void sub_10001F76C(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      sub_10001F20C(a1, a2);
      swift_release();
    }
  }
  else
  {
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100005EC0(v4, (uint64_t)qword_100048E40);
    oslog = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v5, "No pin received from setup pin publisher", v6, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_10001F8BC(uint64_t a1)
{
  uint64_t v2 = sub_100005F50(&qword_100046990);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001F91C(uint64_t *a1)
{
  return sub_10001F498(a1);
}

uint64_t sub_10001F924()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001F95C()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10001F99C()
{
  sub_10001F76C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10001F9A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001F9B8()
{
  return swift_release();
}

char *sub_10001F9C0(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    os_log_type_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    os_log_type_t v5 = a1;
    uint64_t v6 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = &a1[v7];
    uint64_t v9 = (uint64_t)a2 + v7;
    uint64_t v10 = type metadata accessor for URL();
    id v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    uint64_t v12 = v4;
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t sub_10001FAB0(id *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_10001FB30(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  id v11 = v5;
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_10001FBD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_10001FC84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_10001FD08(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for URL();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_10001FDA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001FDB8);
}

uint64_t sub_10001FDB8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for URL();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10001FE68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001FE7C);
}

void *sub_10001FE7C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for URL();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for VisualPairingAppClipCode()
{
  uint64_t result = qword_1000473F0;
  if (!qword_1000473F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001FF70()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for MobileKeyBagManager()
{
  return self;
}

uint64_t type metadata accessor for MobileAssetsDownloader()
{
  return self;
}

uint64_t sub_10002005C()
{
  sub_10000AFBC(v0 + 16);

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for AssetLoader()
{
  return self;
}

id sub_1000200C0()
{
  uint64_t v0 = sub_100005F50(&qword_100046170);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v30 - v8;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v11 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v12 = String._bridgeToObjectiveC()();
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = [v11 URLForResource:v12 withExtension:v13];

  if (v14)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    id v15 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v15(v2, v7, v3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
    {
      v15(v9, v2, v3);
      if (qword_100045E40 != -1) {
        swift_once();
      }
      uint64_t v16 = type metadata accessor for Logger();
      sub_100005EC0(v16, (uint64_t)qword_100048E10);
      uint64_t v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Successfully loaded video", v19, 2u);
        swift_slowDealloc();
      }

      id v20 = objc_allocWithZone((Class)AVPlayerItem);
      URL._bridgeToObjectiveC()(v21);
      id v23 = v22;
      id v24 = [v20 initWithURL:v22];

      (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
      return v24;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  }
  sub_1000065F8((uint64_t)v2);
  if (qword_100045E40 != -1) {
    swift_once();
  }
  uint64_t v25 = type metadata accessor for Logger();
  sub_100005EC0(v25, (uint64_t)qword_100048E10);
  Swift::String_optional v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v26, v27))
  {
    NSString v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)NSString v28 = 136446210;
    uint64_t v30 = sub_100023568(0x656369766544, 0xE600000000000000, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Unable to load video asset: %{public}s.mov", v28, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_100020580()
{
  *(void *)(v1 + 24) = v0;
  return _swift_task_switch(sub_1000205A0, 0, 0);
}

uint64_t sub_1000205A0()
{
  if (qword_100045E40 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  *(void *)(v0 + 32) = sub_100005EC0(v1, (uint64_t)qword_100048E10);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Pre-fetching assets from the server", v4, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for MainActor();
  *(void *)(v0 + 40) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000206F4, v6, v5);
}

uint64_t sub_1000206F4()
{
  swift_release();
  uint64_t v0 = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, v1, "ProductKit SPI is not supported. Return nil for product image", v2, 2u);
    swift_slowDealloc();
  }

  return _swift_task_switch(sub_1000207D0, 0, 0);
}

uint64_t sub_1000207D0()
{
  id v15 = v0;
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = 0;

  swift_retain_n();
  os_log_type_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v14 = v6;
    uint64_t v7 = *(void **)(v1 + 56);
    v0[2] = v7;
    id v8 = v7;
    sub_100005F50(&qword_100047618);
    uint64_t v9 = String.init<A>(describing:)();
    v0[2] = sub_100023568(v9, v10, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Downloaded the following image asset: %{public}s from the server. ", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  uint64_t v11 = *(void *)(v1 + 56);
  NSString v12 = (uint64_t (*)(uint64_t))v0[1];
  return v12(v11);
}

uint64_t type metadata accessor for AppleIDAccountUpgradeStage()
{
  return self;
}

void sub_1000209D0(uint64_t *a1)
{
  unint64_t v1 = a1[1];
  if (v1)
  {
    uint64_t v2 = *a1;
    uint64_t v3 = qword_100045E50;
    swift_bridgeObjectRetain();
    if (v3 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100005EC0(v4, (uint64_t)qword_100048E40);
    swift_bridgeObjectRetain();
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      v12[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      swift_bridgeObjectRetain();
      sub_100023568(v2, v1, v12);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Received this pin whilst in the introduction stage: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      swift_retain();
      swift_release();
      PassthroughSubject.send(_:)();
      swift_release();
    }
  }
  else
  {
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100005EC0(v8, (uint64_t)qword_100048E40);
    oslog = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v9))
    {
      unint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "No pin received from setup pin publisher", v10, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100020CC0()
{
  if (*(void *)(v0 + 32))
  {
    swift_retain();
    AnyCancellable.cancel()();
    swift_release();
  }
  swift_release();

  swift_release();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for IntroductionActionHandler()
{
  return self;
}

void sub_100020D54()
{
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005EC0(v0, (uint64_t)qword_100048E40);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Unlock background task expired", v2, 2u);
    swift_slowDealloc();
  }
}

void sub_100020E3C(char a1, uint64_t a2)
{
  if (qword_100045E78 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005EC0(v4, (uint64_t)qword_100048EB8);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Passcode unlock ui completion block is invoked. ", v7, 2u);
    swift_slowDealloc();
  }

  if ((a1 & 1) != 0 || MKBGetDeviceLockState() - 1 >= 2)
  {
    if (qword_100045E50 != -1) {
      swift_once();
    }
    sub_100005EC0(v4, (uint64_t)qword_100048E40);
    unint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 67109376;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v12 + 8) = 1024;
      LODWORD(aBlock[0]) = MKBGetDeviceLockState() - 1 < 2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "User did unlock the device: %{BOOL}d, isDeviceLocked: %{BOOL}d", (uint8_t *)v12, 0xEu);
      swift_slowDealloc();
    }

    NSString v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Starting to ask sharingd to retrigger prox card flow. ", v15, 2u);
      swift_slowDealloc();
    }

    id v16 = [objc_allocWithZone((Class)SFClient) init];
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v16;
    *(void *)(v17 + 24) = a2;
    aBlock[4] = sub_1000218F4;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100021498;
    void aBlock[3] = &unk_10003E430;
    os_log_type_t v18 = _Block_copy(aBlock);
    id v19 = v16;
    swift_release();
    [v19 retriggerProximitySetup:v18];
    _Block_release(v18);
  }
  else if (UIApp)
  {
    [UIApp endBackgroundTask:a2];
    if (qword_100045E50 != -1) {
      swift_once();
    }
    sub_100005EC0(v4, (uint64_t)qword_100048E40);
    oslog = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v8, "User did not unlock device to continue with proximity setup. ", v9, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_10002128C(uint64_t a1, void *a2, uint64_t a3)
{
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100005EC0(v5, (uint64_t)qword_100048E40);
  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v8 = 136446210;
    swift_errorRetain();
    sub_100005F50(&qword_100046B18);
    uint64_t v9 = String.init<A>(describing:)();
    sub_100023568(v9, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Retrigger proximity setup completed with error: %{public}s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  [a2 invalidate];
  id result = (id)UIApp;
  if (UIApp) {
    return [UIApp endBackgroundTask:a3];
  }
  __break(1u);
  return result;
}

void sub_100021498(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100021504(uint64_t a1, int a2)
{
  uint64_t v2 = *(void (**)(BOOL))(a1 + 32);
  BOOL v3 = a2 != 0;
  swift_retain();
  v2(v3);

  return swift_release();
}

uint64_t sub_10002155C()
{
  uint64_t v1 = v0;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  BOOL v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "DeviceUnlockActionHandler deinit", v5, 2u);
    swift_slowDealloc();
  }

  return _swift_deallocClassInstance(v1, 16, 7);
}

uint64_t type metadata accessor for DeviceUnlockActionHandler()
{
  return self;
}

void sub_100021678()
{
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005EC0(v0, (uint64_t)qword_100048E40);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    BOOL v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Requesting SpringBoard to present passcode unlock UI. ", v3, 2u);
    swift_slowDealloc();
  }

  os_log_type_t v4 = (void *)UIApp;
  if (UIApp)
  {
    os_log_type_t v14 = sub_100020D54;
    uint64_t v15 = 0;
    unint64_t v10 = _NSConcreteStackBlock;
    uint64_t v11 = 1107296256;
    uint64_t v12 = sub_100004EB0;
    NSString v13 = &unk_10003E390;
    uint64_t v5 = _Block_copy(&v10);
    id v6 = v4;
    id v7 = [v6 beginBackgroundTaskWithExpirationHandler:v5];
    _Block_release(v5);

    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    os_log_type_t v14 = sub_1000218B4;
    uint64_t v15 = v8;
    unint64_t v10 = _NSConcreteStackBlock;
    uint64_t v11 = 1107296256;
    uint64_t v12 = sub_100021504;
    NSString v13 = &unk_10003E3E0;
    uint64_t v9 = _Block_copy(&v10);
    swift_release();
    SBSRequestPasscodeUnlockUI();
    _Block_release(v9);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10002188C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002189C()
{
  return swift_release();
}

uint64_t sub_1000218A4()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000218B4(char a1)
{
  sub_100020E3C(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000218BC()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_1000218F4(uint64_t a1)
{
  return sub_10002128C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

void sub_10002190C()
{
  qword_100048EE8 = 0x406F400000000000;
}

void sub_100021920()
{
  qword_100048EF0 = 0x4061000000000000;
}

void sub_100021930()
{
  qword_100048EF8 = 0x4077200000000000;
}

void sub_100021944()
{
  qword_100048F00 = 0x4066800000000000;
}

void sub_100021958()
{
  qword_100048F08 = 0x4028000000000000;
}

void sub_100021968()
{
  qword_100048F10 = 0xC03B000000000000;
}

void sub_100021978()
{
  qword_100048F18 = 0x4039000000000000;
}

double sub_100021988()
{
  uint64_t v0 = self;
  id v1 = [v0 mainScreen];
  [v1 nativeBounds];
  uint64_t v3 = v2;

  id v4 = [v0 mainScreen];
  [v4 nativeBounds];
  double v6 = v5;

  double result = v6 * 0.208135861;
  qword_100048F20 = v3;
  *(double *)algn_100048F28 = v6 * 0.208135861;
  return result;
}

double sub_100021A30()
{
  uint64_t v0 = self;
  id v1 = [v0 mainScreen];
  [v1 nativeBounds];
  double v3 = v2;

  double v4 = fmin(v3 + -25.0, 400.0);
  id v5 = [v0 mainScreen];
  [v5 nativeBounds];
  double v7 = v6;

  double result = fmin(v7 + -25.0, 500.0);
  qword_100048F30 = *(void *)&v4;
  *(double *)algn_100048F38 = result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for ProgressActionHandler(void *a1, uint64_t a2)
{
  double v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for ProgressActionHandler(id *a1)
{
  return swift_release();
}

uint64_t assignWithCopy for ProgressActionHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

id *assignWithTake for ProgressActionHandler(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for ProgressActionHandler()
{
  return &type metadata for ProgressActionHandler;
}

unint64_t sub_100021C1C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    double v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005F50(&qword_100047890);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  double v3 = (void *)v2;
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
    sub_1000277E4(v6, (uint64_t)&v15, &qword_100047898);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100023E4C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100027700(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    _OWORD v3[2] = v14;
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

unint64_t sub_100021D54(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    double v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005F50(&qword_100047850);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  double v3 = (void *)v2;
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
    sub_1000277E4(v6, (uint64_t)v15, &qword_100047858);
    unint64_t result = sub_100023EC4((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_100027700(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    _OWORD v3[2] = v14;
    v6 += 72;
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

unint64_t sub_100021E98(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005F50(&qword_100047888);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_100023E4C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
    if (!--v3)
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

uint64_t sub_100021FAC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100010098(a1, &qword_100046BB8);
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

uint64_t sub_100022158(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100005F50(&qword_100046BB8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100005EC0(v7, (uint64_t)qword_100048E40);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    long long v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)long long v10 = 136446210;
    uint64_t v15 = sub_100023568(0xD000000000000014, 0x8000000100033E00, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%{public}s invoked. ", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  BOOL v12 = (void *)swift_allocObject();
  v12[2] = 0;
  uint64_t v12[3] = 0;
  v12[4] = a1;
  v12[5] = a2;
  id v13 = a1;
  swift_retain();
  sub_100021FAC((uint64_t)v6, (uint64_t)&unk_100047828, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_1000223BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 256) = a4;
  return _swift_task_switch(sub_10002244C, 0, 0);
}

uint64_t sub_10002244C()
{
  if (qword_100045E60 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  *(void *)(v0 + 264) = sub_100005EC0(v1, (uint64_t)qword_100048E70);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Gathering shared setting…", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 272) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1000225C4;
  return sub_100025170();
}

uint64_t sub_1000225C4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 280) = a1;
  *(void *)(v3 + 288) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_100022C90;
  }
  else {
    uint64_t v4 = sub_100022704;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100022704()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(v0 + 280) + 1208))();
  if (v1)
  {
    uint64_t v3 = v1;
  }
  else
  {
    os_log_type_t v9 = (void *)v2;
    long long v10 = self;
    *(void *)(v0 + 232) = 0;
    id v11 = [v10 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:v0 + 232];
    id v12 = *(id *)(v0 + 232);
    if (v11)
    {
      uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v15 = v14;

      swift_release();
      sub_100027650(v13, v15);
      sub_100027650(v13, v15);
      sub_100027650(v13, v15);
      uint64_t v16 = Logger.logObject.getter();
      os_log_type_t v17 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v16, v17))
      {
        os_log_type_t v18 = (uint8_t *)swift_slowAlloc();
        uint64_t v28 = swift_slowAlloc();
        *(_DWORD *)os_log_type_t v18 = 136315138;
        sub_100027650(v13, v15);
        uint64_t v19 = Data.description.getter();
        unint64_t v21 = v20;
        sub_1000276A8(v13, v15);
        *(void *)(v0 + 248) = sub_100023568(v19, v21, &v28);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_1000276A8(v13, v15);
        sub_1000276A8(v13, v15);
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Sending shared settings :%s", v18, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_1000276A8(v13, v15);
        sub_1000276A8(v13, v15);
      }

      id v23 = *(void **)(v0 + 256);
      sub_100005F50(&qword_100046320);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10002FBD0;
      *(void *)(v0 + 208) = 28783;
      *(void *)(v0 + 216) = 0xE200000000000000;
      AnyHashable.init<A>(_:)();
      *(void *)(inited + 96) = &type metadata for Int32;
      *(_DWORD *)(inited + 72) = 5;
      *(void *)(v0 + 192) = 1635017060;
      *(void *)(v0 + 200) = 0xE400000000000000;
      AnyHashable.init<A>(_:)();
      *(void *)(inited + 168) = &type metadata for Data;
      *(void *)(inited + 144) = v13;
      *(void *)(inited + 152) = v15;
      unint64_t v25 = sub_100021D54(inited);
      (*(void (**)(unint64_t, uint64_t))((swift_isaMask & *v23) + 0x1E0))(v25, 1);
      sub_1000276A8(v13, v15);
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    uint64_t v22 = v12;
    uint64_t v3 = _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  swift_release();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136446210;
    *(void *)(v0 + 224) = v3;
    swift_errorRetain();
    sub_100005F50(&qword_100046178);
    uint64_t v7 = String.init<A>(describing:)();
    *(void *)(v0 + 240) = sub_100023568(v7, v8, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%{public}s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
LABEL_12:
  Swift::String_optional v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_100022C90()
{
  id v11 = v0;
  uint64_t v1 = v0[36];
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136446210;
    uint64_t v10 = v5;
    v0[28] = v1;
    swift_errorRetain();
    sub_100005F50(&qword_100046178);
    uint64_t v6 = String.init<A>(describing:)();
    v0[30] = sub_100023568(v6, v7, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100022E98()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100022EE0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *os_log_type_t v3 = v1;
  v3[1] = sub_1000198F8;
  v3[32] = v2;
  return _swift_task_switch(sub_10002244C, 0, 0);
}

uint64_t sub_100022F8C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100005F50(&qword_100046178);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    id v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_100027780((uint64_t)&v11, v8, &qword_100047880);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_100023058(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100005F50(&qword_100046178);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      sub_100005FDC(0, &qword_100047878);
      uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v10 = v8;
    sub_100027780((uint64_t)&v10, *(void *)(*(void *)(v3 + 64) + 40), &qword_100047870);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_100023150(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_100005F50(&qword_100046178);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a2;
    id v7 = a2;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(void **)(*(void *)(v3 + 64) + 40) = a3;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_100023204(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100005F50(&qword_100046178);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(void **)(*(void *)(v3 + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1000232B8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1000232F4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000233D0;
  return v6(a1);
}

uint64_t sub_1000233D0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000234C8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000234F0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100023568(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100023568(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002363C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100018E10((uint64_t)v12, *a3);
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
      sub_100018E10((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000AFBC((uint64_t)v12);
  return v7;
}

uint64_t sub_10002363C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_1000237F8(a5, a6);
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

uint64_t sub_1000237F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100023890(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100023AEC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100023AEC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100023890(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100023A08(v2, 0);
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

void *sub_100023A08(uint64_t a1, uint64_t a2)
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
  sub_100005F50(&qword_100047830);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100023A70(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_100023AEC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005F50(&qword_100047830);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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

unsigned char **sub_100023C3C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_100023C4C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100023C84(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000198F8;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100047838 + dword_100047838);
  return v6(a1, v4);
}

void *sub_100023D3C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_100023DE0(void (*a1)(void))
{
  a1();

  return _typeName(_:qualified:)();
}

uint64_t sub_100023E1C@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_100023E4C(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100023F08(a1, a2, v4);
}

unint64_t sub_100023EC4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100023FEC(a1, v4);
}

unint64_t sub_100023F08(uint64_t a1, uint64_t a2, uint64_t a3)
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
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100023FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100027710(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100018DBC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000240B4(unint64_t a1, void *a2)
{
  unint64_t v3 = a1;
  if (a1 >> 62)
  {
LABEL_34:
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      unint64_t v5 = v3 & 0xC000000000000001;
      uint64_t v6 = 4;
      id v23 = a2;
      unint64_t v24 = v3;
      unint64_t v22 = v3 & 0xC000000000000001;
      do
      {
        if (v5) {
          id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v7 = *(id *)(v3 + 8 * v6);
        }
        uint64_t v8 = v7;
        uint64_t v9 = v6 - 3;
        if (__OFADD__(v6 - 4, 1))
        {
          __break(1u);
          goto LABEL_34;
        }
        if (![v7 isActive])
        {

          goto LABEL_5;
        }
        uint64_t v10 = v4;
        id v11 = [v8 aa_altDSID];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;

          if (a2) {
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v13 = 0;
          uint64_t v15 = 0;
          if (a2)
          {
LABEL_13:
            id v16 = [a2 aa_altDSID];
            if (v16)
            {
              os_log_type_t v17 = v16;
              a2 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v19 = v18;

              if (!v15) {
                goto LABEL_24;
              }
            }
            else
            {
              a2 = 0;
              uint64_t v19 = 0;
              if (!v15)
              {
LABEL_24:
                a2 = v23;
                if (!v19)
                {
                  swift_bridgeObjectRelease();

                  return 1;
                }

                swift_bridgeObjectRelease();
                goto LABEL_27;
              }
            }
            goto LABEL_18;
          }
        }
        uint64_t v19 = 0;
        if (!v15) {
          goto LABEL_24;
        }
LABEL_18:
        if (!v19)
        {

          swift_bridgeObjectRelease();
          a2 = v23;
LABEL_27:
          uint64_t v4 = v10;
          unint64_t v3 = v24;
          unint64_t v5 = v22;
          goto LABEL_5;
        }
        if ((void *)v13 == a2 && v15 == v19)
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
LABEL_30:
          swift_bridgeObjectRelease();
          return 1;
        }
        char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v5 = v22;
        a2 = v23;
        uint64_t v4 = v10;
        unint64_t v3 = v24;
        if (v20) {
          goto LABEL_30;
        }
LABEL_5:
        ++v6;
      }
      while (v9 != v4);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void sub_100024334(void *a1)
{
  uint64_t v1 = (uint64_t (**)(uint64_t))(*a1 + 1240);
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1)(0);
  uint64_t v4 = (*(uint64_t (**)(void *))(v3 + 1248))(&_swiftEmptyArrayStorage);
  swift_release();
  (*(void (**)(void *))(*(void *)v4 + 1256))(&_swiftEmptyArrayStorage);
  swift_release();
  swift_release();
  if (!WiFiManagerClientCreate())
  {
    if (qword_100045E60 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_100005EC0(v12, (uint64_t)qword_100048E70);
    oslog = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(oslog, v13)) {
      goto LABEL_50;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    uint64_t v15 = "Failed to initialize wiFiManager.";
    goto LABEL_49;
  }
  uint64_t v5 = WiFiManagerClientCopyDevices();
  if (!v5)
  {
    if (qword_100045E60 == -1)
    {
LABEL_23:
      uint64_t v16 = type metadata accessor for Logger();
      sub_100005EC0(v16, (uint64_t)qword_100048E70);
      oslog = Logger.logObject.getter();
      os_log_type_t v13 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(oslog, v13)) {
        goto LABEL_50;
      }
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      uint64_t v15 = "Failed to get wifi devices.";
LABEL_49:
      _os_log_impl((void *)&_mh_execute_header, oslog, v13, v15, v14, 2u);
      swift_slowDealloc();
      goto LABEL_50;
    }
LABEL_56:
    swift_once();
    goto LABEL_23;
  }
  uint64_t v6 = (void *)v5;
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v7 >> 62))
  {
    if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
LABEL_45:
    swift_bridgeObjectRelease();
    if (qword_100045E60 != -1) {
      swift_once();
    }
    uint64_t v37 = type metadata accessor for Logger();
    sub_100005EC0(v37, (uint64_t)qword_100048E70);
    oslog = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(oslog, v13)) {
      goto LABEL_50;
    }
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    uint64_t v15 = "No Wi-Fi devices found.";
    goto LABEL_49;
  }
  swift_bridgeObjectRetain();
  uint64_t v36 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v36) {
    goto LABEL_45;
  }
LABEL_5:
  if ((v7 & 0xC000000000000001) != 0)
  {
    specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_8;
  }
  if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_56;
  }
  swift_unknownObjectRetain();
LABEL_8:
  swift_bridgeObjectRelease();
  if (!WiFiDeviceClientCopyCurrentNetwork())
  {
    if (qword_100045E60 != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    sub_100005EC0(v17, (uint64_t)qword_100048E70);
    oslog = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(oslog, v9)) {
      goto LABEL_30;
    }
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    id v11 = "Failed to get current network from device client ref.";
    goto LABEL_29;
  }
  if (WiFiNetworkIsEAP()
    || WiFiNetworkIsProfileBased()
    || WiFiNetworkIsExpirable()
    || WiFiNetworkIsCaptive()
    || WiFiNetworkGetType() == 1)
  {
    if (qword_100045E60 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100005EC0(v8, (uint64_t)qword_100048E70);
    oslog = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(oslog, v9)) {
      goto LABEL_30;
    }
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    id v11 = "Current Wi-Fi network is not transferrable.";
LABEL_29:
    _os_log_impl((void *)&_mh_execute_header, oslog, v9, v11, v10, 2u);
    swift_slowDealloc();
LABEL_30:
    swift_unknownObjectRelease();
    goto LABEL_50;
  }
  uint64_t v18 = WiFiNetworkCopyPassword();
  if (!v18)
  {
    if (qword_100045E60 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100005EC0(v19, (uint64_t)qword_100048E70);
    char v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v20, v21))
    {
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Forcing password to an empty string to handle the case where there is no password on the access point.", v22, 2u);
      swift_slowDealloc();
    }

    sub_100005FDC(0, &qword_100047868);
    uint64_t v18 = NSString.init(stringLiteral:)();
  }
  uint64_t v23 = WiFiNetworkCopyRecord();
  if (v23)
  {
    unint64_t v24 = (void *)v23;
    uint64_t v25 = v2(1);
    sub_100005F50(&qword_100046258);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_10002FBE0;
    *(void *)(v26 + 32) = v24;
    uint64_t v39 = v26;
    specialized Array._endMutation()();
    os_log_type_t v27 = *(uint64_t (**)(uint64_t))(*(void *)v25 + 1248);
    id v28 = v24;
    uint64_t v29 = v27(v39);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_10002FBE0;
    *(void *)(v30 + 32) = v18;
    uint64_t v40 = v30;
    specialized Array._endMutation()();
    uint64_t v31 = *(void (**)(uint64_t))(*(void *)v29 + 1256);
    oslog = v18;
    v31(v40);
    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_100045E60 != -1) {
      swift_once();
    }
    uint64_t v32 = type metadata accessor for Logger();
    sub_100005EC0(v32, (uint64_t)qword_100048E70);
    oslog = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(oslog, v33))
    {
      swift_unknownObjectRelease();

      Swift::String v35 = v18;
      goto LABEL_51;
    }
    Swift::String v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v33, "Failed to get Wi-Fi record.", v34, 2u);
    swift_slowDealloc();
    swift_unknownObjectRelease();
  }
LABEL_50:
  Swift::String v35 = oslog;
LABEL_51:
}

void sub_100024BC4(uint64_t a1)
{
  id v9 = [objc_allocWithZone((Class)MBManager) init];
  id v2 = [v9 restoreState];
  if (!v2) {
    goto LABEL_4;
  }
  uint64_t v3 = v2;
  unsigned int v4 = [v2 state];

  if (v4 <= 6)
  {
    if (((1 << v4) & 0x71) == 0)
    {
      (*(void (**)(uint64_t))(*(void *)a1 + 1328))(1);
      goto LABEL_6;
    }
LABEL_4:
    (*(void (**)(void))(*(void *)a1 + 1328))(0);
LABEL_6:
    swift_release();

    return;
  }
  if (qword_100045E60 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100005EC0(v5, (uint64_t)qword_100048E70);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 67109120;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Unrecognized restore state: MBState == %u", v8, 8u);
    swift_slowDealloc();
  }

  (*(void (**)(void))(*(void *)a1 + 1328))(0);
  swift_release();
}

uint64_t sub_100024E0C(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return _swift_task_switch(sub_100024E2C, 0, 0);
}

uint64_t sub_100024E2C()
{
  id v1 = [self sharedInstance];
  v0[17] = v1;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100024F50;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100023204;
  v0[13] = &unk_10003E570;
  v0[14] = v2;
  [v1 fmipStateWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100024F50()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    uint64_t v2 = sub_100025100;
  }
  else {
    uint64_t v2 = sub_100025060;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100025060()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 120);

  (*(void (**)(BOOL))(*(void *)v1 + 1376))(v2 == 1);
  swift_release();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100025100()
{
  uint64_t v1 = *(void **)(v0 + 136);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100025170()
{
  uint64_t v1 = type metadata accessor for TimeZone();
  v0[56] = v1;
  v0[57] = *(void *)(v1 - 8);
  v0[58] = swift_task_alloc();
  return _swift_task_switch(sub_100025258, 0, 0);
}

uint64_t sub_100025258()
{
  if (qword_100045E60 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[59] = sub_100005EC0(v1, (uint64_t)qword_100048E70);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Creating builder", v4, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for WFSetupData.Builder();
  swift_allocObject();
  uint64_t v5 = WFSetupData.Builder.init()();
  v0[60] = v5;
  uint64_t v6 = (__CFString *)String._bridgeToObjectiveC()();
  CFPropertyListRef v7 = CFPreferencesCopyValue(v6, kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

  (*(void (**)(CFPropertyListRef))(*(void *)v5 + 1216))(v7);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Retrieve Apple Keyboards", v10, 2u);
    swift_slowDealloc();
  }

  id v11 = [objc_allocWithZone((Class)ACAccountStore) init];
  v0[61] = v11;
  v0[10] = v0;
  v0[15] = v0 + 51;
  v0[11] = sub_10002559C;
  uint64_t v12 = swift_continuation_init();
  v0[26] = _NSConcreteStackBlock;
  v0[27] = 0x40000000;
  v0[28] = sub_100022F8C;
  v0[29] = &unk_10003E528;
  v0[30] = v12;
  [v11 aa_primaryAppleAccountWithCompletion:v0 + 26];
  return _swift_continuation_await(v0 + 10);
}

uint64_t sub_10002559C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 496) = v1;
  if (v1) {
    uint64_t v2 = sub_100027400;
  }
  else {
    uint64_t v2 = sub_1000256D8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000256D8()
{
  uint64_t v1 = *(void **)(v0 + 408);
  *(void *)(v0 + 504) = v1;
  if (v1 && (id v2 = [v1 username]) != 0)
  {
    os_log_type_t v3 = v2;
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  CFPropertyListRef v7 = *(void **)(v0 + 488);
  (*(void (**)(uint64_t, uint64_t))(**(void **)(v0 + 480) + 1224))(v4, v6);
  swift_release();
  swift_bridgeObjectRelease();
  id v8 = [v7 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifieriTunesStore];
  *(void *)(v0 + 512) = v8;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 432;
  *(void *)(v0 + 24) = sub_1000258C8;
  uint64_t v9 = swift_continuation_init();
  *(void *)(v0 + 248) = _NSConcreteStackBlock;
  *(void *)(v0 + 256) = 0x40000000;
  *(void *)(v0 + 264) = sub_100023058;
  *(void *)(v0 + 272) = &unk_10003E540;
  *(void *)(v0 + 280) = v9;
  [v7 accountsWithAccountType:v8 options:0 completion:v0 + 248];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_1000258C8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 520) = v1;
  if (v1) {
    id v2 = sub_1000274B0;
  }
  else {
    id v2 = sub_100025A04;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100025A04()
{
  unint64_t v1 = *(void *)(v0 + 432);
  if (v1)
  {
    id v2 = *(void **)(v0 + 504);
    id v3 = v2;
    char v4 = sub_1000240B4(v1, v2);

    swift_bridgeObjectRelease();
  }
  else
  {
    char v4 = 0;
  }
  (*(void (**)(void))(**(void **)(v0 + 480) + 1232))(v4 & 1);
  swift_release();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    CFPropertyListRef v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)CFPropertyListRef v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Retrieve Apple ID", v7, 2u);
    swift_slowDealloc();
  }
  id v8 = *(void **)(v0 + 480);
  uint64_t v10 = *(void *)(v0 + 456);
  uint64_t v9 = *(void *)(v0 + 464);
  uint64_t v11 = *(void *)(v0 + 448);

  sub_100024334(v8);
  BOOL v12 = TMIsAutomaticTimeZoneEnabled() != 0;
  uint64_t v13 = (*(uint64_t (**)(BOOL))(*v8 + 1272))(v12);
  id v14 = [self systemTimeZone];
  static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v15 = TimeZone.identifier.getter();
  uint64_t v17 = v16;
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v13 + 1280))(v15, v17);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  id v18 = [self archivedPreferences];
  uint64_t v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(uint64_t))(*v8 + 1264))(v19);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v20 = _AXSCopySettingsDataBlobForBuddy();
  if (v20)
  {
    os_log_type_t v21 = (void *)v20;
    uint64_t v22 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v24 = v23;
  }
  else
  {
    uint64_t v22 = 0;
    unint64_t v24 = 0xF000000000000000;
  }
  uint64_t v25 = *(void *)(v0 + 504);
  (*(void (**)(uint64_t, unint64_t))(**(void **)(v0 + 480) + 1288))(v22, v24);
  sub_10002776C(v22, v24);
  swift_release();
  if (v25)
  {
    id v26 = [*(id *)(v0 + 504) aa_firstName];
    if (v26)
    {
      os_log_type_t v27 = v26;
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v29 = v28;

      goto LABEL_14;
    }
    uint64_t v25 = 0;
  }
  uint64_t v29 = 0;
LABEL_14:
  uint64_t v30 = (*(uint64_t (**)(uint64_t, uint64_t))(**(void **)(v0 + 480) + 1296))(v25, v29);
  swift_bridgeObjectRelease();
  uint64_t v31 = @"ProductType";
  uint64_t v32 = MGCopyAnswer();

  if (v32)
  {
    self;
    if (swift_dynamicCastObjCClass())
    {
      uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v35 = v34;
      swift_unknownObjectRelease();
      goto LABEL_19;
    }
    swift_unknownObjectRelease();
  }
  uint64_t v33 = 0;
  uint64_t v35 = 0;
LABEL_19:
  uint64_t v36 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v30 + 1304))(v33, v35);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v37 = @"DeviceClass";
  uint64_t v38 = MGCopyAnswer();

  if (v38)
  {
    self;
    if (swift_dynamicCastObjCClass())
    {
      uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v41 = v40;
      swift_unknownObjectRelease();
      goto LABEL_24;
    }
    swift_unknownObjectRelease();
  }
  uint64_t v39 = 0;
  uint64_t v41 = 0;
LABEL_24:
  uint64_t v42 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v36 + 1312))(v39, v41);
  swift_release();
  swift_bridgeObjectRelease();
  unint64_t v43 = @"UserAssignedDeviceName";
  uint64_t v44 = MGCopyAnswer();

  if (v44)
  {
    self;
    if (swift_dynamicCastObjCClass())
    {
      uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v47 = v46;
      swift_unknownObjectRelease();
      goto LABEL_29;
    }
    swift_unknownObjectRelease();
  }
  uint64_t v45 = 0;
  uint64_t v47 = 0;
LABEL_29:
  uint64_t v48 = *(void *)(v0 + 480);
  uint64_t v49 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v42 + 1336))(v45, v47);
  swift_release();
  swift_bridgeObjectRelease();
  unint64_t v50 = @"JwLB44/jEB8aFDpXQ16Tuw";
  int v51 = MGGetSInt32Answer();

  (*(void (**)(BOOL))(*(void *)v49 + 1320))(v51 != 2);
  swift_release();
  swift_release();
  id v52 = [objc_allocWithZone((Class)MBManager) init];
  *(void *)(v0 + 528) = v52;
  sub_100024BC4(v48);
  id v53 = [v52 backupDeviceUUID];
  if (v53)
  {
    id v54 = v53;
    uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v57 = v56;
  }
  else
  {
    uint64_t v55 = 0;
    uint64_t v57 = 0;
  }
  uint64_t v58 = *(void *)(v0 + 480);
  uint64_t v59 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v58 + 1344))(v55, v57);
  swift_bridgeObjectRelease();
  (*(void (**)(id))(*(void *)v59 + 1352))([v52 isBackupEnabled]);
  swift_release();
  swift_release();
  uint64_t v60 = self;
  uint64_t v61 = (*(uint64_t (**)(id))(*(void *)v58 + 1360))([v60 locationServicesEnabled]);
  *(void *)(v0 + 424) = 0;
  id v62 = [v60 _archivedAuthorizationDecisionsWithError:v0 + 424];
  id v63 = *(id *)(v0 + 424);
  if (v62)
  {
    uint64_t v64 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v66 = v65;

    (*(void (**)(uint64_t, unint64_t))(*(void *)v61 + 1368))(v64, v66);
    swift_release();
    swift_release();
    sub_1000276A8(v64, v66);
    long long v67 = (void *)swift_task_alloc();
    *(void *)(v0 + 536) = v67;
    *long long v67 = v0;
    v67[1] = sub_1000263D0;
    v67[16] = *(void *)(v0 + 480);
    return _swift_task_switch(sub_100024E2C, 0, 0);
  }
  else
  {
    id v68 = v63;
    unint64_t v70 = *(void **)(v0 + 504);
    uint64_t v69 = *(void **)(v0 + 512);
    unint64_t v71 = *(void **)(v0 + 488);
    swift_release();
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_release();

    swift_task_dealloc();
    uint64_t v72 = *(uint64_t (**)(void))(v0 + 8);
    return v72();
  }
}

uint64_t sub_1000263D0()
{
  *(void *)(*(void *)v1 + 544) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_100026A24;
  }
  else {
    id v2 = sub_100026510;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100026510()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v1 = self;
  id v2 = [v1 sharedConnection];
  if (!v2)
  {
    __break(1u);
    goto LABEL_11;
  }
  id v3 = v2;
  uint64_t v4 = v0[60];
  NSString v5 = String._bridgeToObjectiveC()();
  unsigned int v6 = [v3 userBoolValueForSetting:v5];

  swift_bridgeObjectRelease();
  uint64_t v7 = (*(uint64_t (**)(BOOL))(*(void *)v4 + 1384))(v6 == 1);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = [v1 sharedConnection];
  if (!v8)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
  }
  uint64_t v9 = v8;
  NSString v10 = String._bridgeToObjectiveC()();
  unsigned int v11 = [v9 userBoolValueForSetting:v10];

  swift_bridgeObjectRelease();
  uint64_t v12 = (*(uint64_t (**)(BOOL))(*(void *)v7 + 1392))(v11 == 1);
  swift_release();
  uint64_t v13 = self;
  v0[69] = v13;
  id v14 = [v13 sharedPreferences];
  id v15 = [v14 assistantIsEnabled];

  uint64_t v16 = (*(uint64_t (**)(id))(*(void *)v12 + 1400))(v15);
  swift_release();
  id v17 = [self sharedPreferences];
  if (!v17) {
    goto LABEL_12;
  }
  id v18 = v17;
  id v19 = [v17 voiceTriggerEnabled];

  uint64_t v20 = (*(uint64_t (**)(id))(*(void *)v16 + 1408))(v19);
  swift_release();
  id v21 = [v13 sharedPreferences];
  id v22 = [v21 languageCode];

  if (v22)
  {
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v25 = v24;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
  }
  uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v20 + 1416))(v23, v25);
  swift_release();
  swift_bridgeObjectRelease();
  id v27 = [v13 sharedPreferences];
  id v28 = [v27 outputVoice];

  v0[70] = (*(uint64_t (**)(id))(*(void *)v26 + 1424))(v28);
  swift_release();
  id v29 = [objc_allocWithZone((Class)AFSettingsConnection) init];
  v0[71] = v29;
  v0[18] = v0;
  v0[23] = v0 + 55;
  v0[19] = sub_100026AE8;
  uint64_t v30 = swift_continuation_init();
  v0[36] = _NSConcreteStackBlock;
  v0[37] = 0x40000000;
  v0[38] = sub_100023150;
  v0[39] = &unk_10003E558;
  v0[40] = v30;
  [v29 getSiriDataSharingOptInStatusWithCompletion:v0 + 36];
  return _swift_continuation_await(v0 + 18);
}

uint64_t sub_100026A24()
{
  id v2 = *(void **)(v0 + 504);
  uint64_t v1 = *(void **)(v0 + 512);
  id v3 = *(void **)(v0 + 488);

  swift_release();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100026AE8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 176);
  *(void *)(*(void *)v0 + 576) = v1;
  if (v1)
  {
    swift_release();
    id v2 = sub_100027574;
  }
  else
  {
    id v2 = sub_100026C2C;
  }
  return _swift_task_switch(v2, 0, 0);
}

void *sub_100026C2C()
{
  uint64_t v1 = *(void *)(v0 + 560);
  id v2 = *(void **)(v0 + 552);
  uint64_t v3 = *(void *)(v0 + 440);

  uint64_t v4 = (*(uint64_t (**)(BOOL))(*(void *)v1 + 1432))(v3 == 1);
  swift_release();
  id v5 = [v2 sharedPreferences];
  id v6 = [v5 dictationIsEnabled];

  uint64_t v7 = (*(uint64_t (**)(id))(*(void *)v4 + 1440))(v6);
  swift_release();
  id v8 = [v2 sharedPreferences];
  id v9 = [v8 suppressDictationOptIn];

  (*(void (**)(id))(*(void *)v7 + 1448))(v9);
  swift_release();
  swift_release();
  if (((unint64_t)[self versionOfAcceptedAgreement] & 0x8000000000000000) != 0) {
    __break(1u);
  }
  (*(void (**)(void))(**(void **)(v0 + 480) + 1456))();
  swift_release();
  uint64_t result = (void *)_CFCopySystemVersionDictionary();
  if (result)
  {
    if (!_kCFSystemVersionProductVersionKey)
    {
      __break(1u);
      return result;
    }
    unsigned int v11 = result;
    if (objc_msgSend(result, "valueForKey:"))
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      *(_OWORD *)(v0 + 328) = 0u;
      *(_OWORD *)(v0 + 344) = 0u;
    }
    sub_100027780(v0 + 328, v0 + 360, &qword_100046650);
    if (*(void *)(v0 + 384))
    {
      if (swift_dynamicCast())
      {
        (*(void (**)(void, void))(**(void **)(v0 + 480) + 1464))(*(void *)(v0 + 392), *(void *)(v0 + 400));
        swift_release();
        swift_bridgeObjectRelease();
      }
    }
    else
    {

      sub_100010098(v0 + 360, &qword_100046650);
    }
  }
  uint64_t v12 = dword_100046310;
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 584) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_100026FB0;
  return (void *)((uint64_t (__cdecl *)())((char *)&dword_100046310 + v12))();
}

uint64_t sub_100026FB0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 592) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000270DC, 0, 0);
}

uint64_t sub_1000270DC()
{
  uint64_t v20 = v0;
  (*(void (**)(void))(**(void **)(v0 + 480) + 1480))(*(void *)(v0 + 592));
  swift_release();
  swift_bridgeObjectRelease();
  id v1 = [self sharedInstance];
  if (!v1) {
    __break(1u);
  }
  id v2 = v1;
  id v3 = [v1 backupMetadata];

  if (v3)
  {
    uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0xF000000000000000;
  }
  (*(void (**)(uint64_t, unint64_t))(**(void **)(v0 + 480) + 1488))(v4, v6);
  swift_release();
  sub_10002776C(v4, v6);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)id v9 = 136446210;
    *(void *)(v0 + 416) = sub_100023568(0xD000000000000021, 0x8000000100034060, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Creating %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  NSString v10 = *(void **)(v0 + 528);
  unsigned int v11 = *(void **)(v0 + 504);
  uint64_t v12 = *(void **)(v0 + 512);
  uint64_t v13 = *(void *)(v0 + 480);
  uint64_t v14 = *(void **)(v0 + 488);
  id v15 = [objc_allocWithZone((Class)type metadata accessor for WFSetupServerAnisetteDataProvider()) init];
  (*(void (**)(void))(*(void *)v13 + 1472))();

  swift_release();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v17 = *(void *)(v0 + 480);
  return v16(v17);
}

uint64_t sub_100027400()
{
  id v1 = *(void **)(v0 + 488);
  swift_willThrow();
  swift_release();

  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000274B0()
{
  id v2 = (void *)v0[63];
  id v1 = (void *)v0[64];
  id v3 = (void *)v0[61];
  swift_willThrow();
  swift_release();

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100027574()
{
  id v1 = (void *)v0[71];
  id v2 = (void *)v0[66];
  uint64_t v4 = (void *)v0[63];
  id v3 = (void *)v0[64];
  unint64_t v5 = (void *)v0[61];
  swift_willThrow();
  swift_release();

  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_100027650(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000276A8(uint64_t a1, unint64_t a2)
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

_OWORD *sub_100027700(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100027710(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10002776C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000276A8(a1, a2);
  }
  return a1;
}

uint64_t sub_100027780(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005F50(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000277E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005F50(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002784C(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  *(unsigned char *)(v5 + 16) = 3;
  type metadata accessor for IntroductionActionHandler();
  id v9 = (void *)swift_allocObject();
  sub_100005F50(&qword_100046B30);
  swift_allocObject();
  id v10 = a1;
  swift_retain();
  uint64_t v11 = PassthroughSubject.init()();
  v9[3] = v10;
  void v9[4] = 0;
  v9[2] = v11;
  swift_allocObject();
  swift_weakInit();
  id v12 = v10;
  sub_100005F50(&qword_100047958);
  sub_100027A78();
  uint64_t v13 = Publisher<>.sink(receiveValue:)();
  swift_release();
  swift_release();

  void v9[4] = v13;
  swift_release();
  *(void *)(v5 + 64) = v9;
  uint64_t v14 = type metadata accessor for IntroductionUIProvider();
  swift_allocObject();
  swift_retain_n();
  swift_retain();
  uint64_t v15 = sub_10000A354((uint64_t)v9, a3, a4);
  uint64_t v18 = v14;
  uint64_t v19 = &off_10003D860;
  swift_release();

  swift_release();
  swift_release();
  *(void *)&long long v17 = v15;
  sub_1000196C4(&v17, v5 + 24);
  return v5;
}

uint64_t type metadata accessor for IntroductionStage()
{
  return self;
}

uint64_t sub_100027A38()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100027A70(uint64_t *a1)
{
}

unint64_t sub_100027A78()
{
  unint64_t result = qword_100047960;
  if (!qword_100047960)
  {
    sub_100005F94(&qword_100047958);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047960);
  }
  return result;
}

uint64_t sub_100027AD4()
{
  uint64_t v1 = 0x6E776F6E6B6E75;
  if (*v0 != 1) {
    uint64_t v1 = 0x73736563637573;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x64656C696166;
  }
}

uint64_t ProxCardLayoutCache.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 33, 7);
}

uint64_t type metadata accessor for ProxCardLayoutCache()
{
  return self;
}

uint64_t sub_100027B60()
{
  v21.receiver = v0;
  v21.super_class = (Class)type metadata accessor for ViewServiceUIViewControllerExtendedHeight();
  [super viewDidLayoutSubviews];
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong
    || (double v2 = *(double *)(Strong + 16),
        double v3 = *(double *)(Strong + 24),
        int v4 = *(unsigned __int8 *)(Strong + 32),
        swift_release(),
        v4 == 1))
  {
    id v5 = [self currentDevice];
    id v6 = [v5 userInterfaceIdiom];

    if (v6 == (id)1)
    {
      if (qword_100045EC8 != -1) {
        swift_once();
      }
      uint64_t v7 = &qword_100048F30;
    }
    else
    {
      if (qword_100045EC0 != -1) {
        swift_once();
      }
      uint64_t v7 = &qword_100048F20;
    }
    double v2 = *(double *)v7;
    double v3 = *((double *)v7 + 1);
  }
  [v0 preferredContentSize];
  if (v3 > v8) {
    double v8 = v3;
  }
  [v0 setPreferredContentSize:v2, v8];
  [v0 preferredContentSize];
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = swift_weakLoadStrong();
  if (!v13
    || (double v14 = *(double *)(v13 + 16),
        double v15 = *(double *)(v13 + 24),
        char v16 = *(unsigned char *)(v13 + 32),
        uint64_t result = swift_release(),
        (v16 & 1) != 0)
    || v14 * v15 < v10 * v12)
  {
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      uint64_t v18 = result;
      [v0 preferredContentSize];
      *(void *)(v18 + 16) = v19;
      *(void *)(v18 + 24) = v20;
      *(unsigned char *)(v18 + 32) = 0;
      return swift_release();
    }
  }
  return result;
}

id sub_100027E80()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewServiceUIViewControllerExtendedHeight();
  return [super dealloc];
}

uint64_t type metadata accessor for ViewServiceUIViewControllerExtendedHeight()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for CompletionStatus(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x100027FF4);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CompletionStatus()
{
  return &type metadata for CompletionStatus;
}

unint64_t sub_100028030()
{
  unint64_t result = qword_100047A58;
  if (!qword_100047A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047A58);
  }
  return result;
}

void static NSUserDefaults.appDefaults.getter()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithSuiteName:v1];

  if (!v2) {
    __break(1u);
  }
}

id NSUserDefaults.shouldSimulate.getter()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 BOOLForKey:v1];

  return v2;
}

ValueMetadata *type metadata accessor for NSUserDefaults.Keys()
{
  return &type metadata for NSUserDefaults.Keys;
}

uint64_t sub_1000281F0@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  unint64_t v47 = a1;
  uint64_t v44 = a3;
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  double v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  double v11 = (char *)&v37 - v10;
  if (qword_100045E70 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v42 = sub_100005EC0(v12, (uint64_t)qword_100048EA0);
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  BOOL v15 = os_log_type_enabled(v13, v14);
  unint64_t v43 = v9;
  if (v15)
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v45 = v11;
    uint64_t v46 = v6;
    long long v17 = (uint8_t *)v16;
    uint64_t v49 = swift_slowAlloc();
    *(_DWORD *)long long v17 = 136446210;
    uint64_t v48 = sub_100023568(0xD000000000000021, 0x80000001000342B0, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%{public}s generating App Clip Code.", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    double v11 = v45;
    uint64_t v6 = v46;
    swift_slowDealloc();
  }

  uint64_t result = sub_100028764(v47, a2);
  if (!v3)
  {
    uint64_t v20 = result;
    objc_super v21 = v19;
    sub_100028E6C(result, v19, (uint64_t)v11);
    id v22 = sub_100029A0C((uint64_t)v11);
    unint64_t v24 = v23;
    uint64_t v25 = (void *)sub_10002A3B4();
    id v26 = sub_10002A588((uint64_t)v25);
    id v40 = v25;
    id v41 = v26;
    unint64_t v47 = v24;
    id v27 = v43;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v43, v11, v5);
    id v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.default.getter();
    LODWORD(v42) = v29;
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v45 = v11;
      uint64_t v31 = v30;
      uint64_t v39 = swift_slowAlloc();
      uint64_t v49 = v39;
      *(_DWORD *)uint64_t v31 = 136446466;
      os_log_t v38 = v28;
      uint64_t v48 = sub_100023568(0xD000000000000021, 0x80000001000342B0, &v49);
      uint64_t v46 = v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v31 + 12) = 2082;
      uint64_t v37 = v31 + 14;
      sub_10002A778();
      uint64_t v32 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v48 = sub_100023568(v32, v33, &v49);
      uint64_t v6 = v46;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v27, v5);
      os_log_t v34 = v38;
      _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v42, "%{public}s successfully generated VisualPairingAppClipCode with URL: %{public}s.", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      double v11 = v45;
      swift_slowDealloc();

      sub_1000276A8((uint64_t)v22, v47);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v27, v5);

      sub_1000276A8((uint64_t)v22, v47);
    }
    uint64_t v35 = type metadata accessor for VisualPairingAppClipCode();
    uint64_t v36 = v44;
    uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))((char *)v44 + *(int *)(v35 + 24), v11, v5);
    void *v36 = v41;
    v36[1] = v20;
    v36[2] = v21;
  }
  return result;
}

uint64_t sub_100028764(uint64_t result, unint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v6) {
    goto LABEL_51;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = (uint64_t)sub_1000291BC(v3, a2, 10);
    char v10 = v36;
    swift_bridgeObjectRelease();
    goto LABEL_44;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      uint64_t v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    }
    uint64_t v8 = (uint64_t)sub_1000292A4(v7, v5, 10);
    char v10 = v9 & 1;
LABEL_44:
    if ((v10 & 1) == 0 && (v8 & 0x8000000000000000) == 0 && v8 < 1000000)
    {
      sub_100005F50(&qword_100047A70);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_10002F010;
      *(void *)(v20 + 56) = &type metadata for Int;
      *(void *)(v20 + 64) = &protocol witness table for Int;
      *(void *)(v20 + 32) = v8;
      uint64_t v21 = String.init(format:_:)();
      unint64_t v23 = v22;
      if (qword_100045E70 != -1) {
        swift_once();
      }
      uint64_t v24 = type metadata accessor for Logger();
      sub_100005EC0(v24, (uint64_t)qword_100048EA0);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v25 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = swift_slowAlloc();
        v37[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 136446466;
        swift_bridgeObjectRetain();
        uint64_t v38 = sub_100023568(v21, v23, v37);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v27 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v38 = sub_100023568(v3, a2, v37);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Generated payload '%{public}s' from PIN '%s' (this PIN is for visual pairing only).", (uint8_t *)v27, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      return v21;
    }
LABEL_51:
    if (qword_100045E70 != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    sub_100005EC0(v28, (uint64_t)qword_100048EA0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    uint64_t v21 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      v37[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136446466;
      uint64_t v38 = sub_100023568(0xD000000000000021, 0x80000001000342B0, v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v31 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_100023568(v3, a2, v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v21, "%{public}s received invalid PIN: %s.", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_10002A7D0();
    swift_allocError();
    unsigned char *v32 = 0;
    swift_willThrow();
    return v21;
  }
  v37[0] = result;
  v37[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v4) {
      goto LABEL_68;
    }
    if (v4 == 1 || (BYTE1(result) - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v8 = (BYTE1(result) - 48);
    if (v4 != 2)
    {
      if ((BYTE2(result) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v8 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
      uint64_t v11 = v4 - 3;
      if (v11)
      {
        uint64_t v12 = (unsigned __int8 *)v37 + 3;
        while (1)
        {
          unsigned int v13 = *v12 - 48;
          if (v13 > 9) {
            goto LABEL_31;
          }
          uint64_t v14 = 10 * v8;
          if ((unsigned __int128)(v8 * (__int128)10) >> 64 != (10 * v8) >> 63) {
            goto LABEL_31;
          }
          uint64_t v8 = v14 + v13;
          if (__OFADD__(v14, v13)) {
            goto LABEL_31;
          }
          char v10 = 0;
          ++v12;
          if (!--v11) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_43:
    char v10 = 0;
    goto LABEL_44;
  }
  if (result != 45)
  {
    if (!v4 || (result - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v8 = (result - 48);
    if (v4 != 1)
    {
      if ((BYTE1(result) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v8 = 10 * (result - 48) + (BYTE1(result) - 48);
      uint64_t v15 = v4 - 2;
      if (v15)
      {
        uint64_t v16 = (unsigned __int8 *)v37 + 2;
        while (1)
        {
          unsigned int v17 = *v16 - 48;
          if (v17 > 9) {
            goto LABEL_31;
          }
          uint64_t v18 = 10 * v8;
          if ((unsigned __int128)(v8 * (__int128)10) >> 64 != (10 * v8) >> 63) {
            goto LABEL_31;
          }
          uint64_t v8 = v18 + v17;
          if (__OFADD__(v18, v17)) {
            goto LABEL_31;
          }
          char v10 = 0;
          ++v16;
          if (!--v15) {
            goto LABEL_44;
          }
        }
      }
    }
    goto LABEL_43;
  }
  if (v4)
  {
    if (v4 != 1 && (BYTE1(result) - 48) <= 9u)
    {
      if (v4 == 2)
      {
        char v10 = 0;
        uint64_t v8 = -(uint64_t)(BYTE1(result) - 48);
        goto LABEL_44;
      }
      if ((BYTE2(result) - 48) <= 9u)
      {
        uint64_t v8 = -10 * (BYTE1(result) - 48) - (BYTE2(result) - 48);
        uint64_t v19 = v4 - 3;
        if (!v19) {
          goto LABEL_43;
        }
        unint64_t v33 = (unsigned __int8 *)v37 + 3;
        while (1)
        {
          unsigned int v34 = *v33 - 48;
          if (v34 > 9) {
            break;
          }
          uint64_t v35 = 10 * v8;
          if ((unsigned __int128)(v8 * (__int128)10) >> 64 != (10 * v8) >> 63) {
            break;
          }
          uint64_t v8 = v35 - v34;
          if (__OFSUB__(v35, v34)) {
            break;
          }
          char v10 = 0;
          ++v33;
          if (!--v19) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_31:
    uint64_t v8 = 0;
    char v10 = 1;
    goto LABEL_44;
  }
  __break(1u);
LABEL_68:
  __break(1u);
  return result;
}

uint64_t sub_100028E6C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100005F50(&qword_100046170);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = 0;
  unint64_t v21 = 0xE000000000000000;
  _StringGuts.grow(_:)(33);
  swift_bridgeObjectRelease();
  uint64_t v20 = 0xD000000000000021;
  unint64_t v21 = 0x80000001000342E0;
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  String.append(_:)(v9);
  URL.init(string:)();
  swift_bridgeObjectRelease();
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a3, v8, v10);
  }
  sub_1000065F8((uint64_t)v8);
  if (qword_100045E70 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100005EC0(v12, (uint64_t)qword_100048EA0);
  swift_bridgeObjectRetain_n();
  unsigned int v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136446466;
    uint64_t v19 = sub_100023568(0xD000000000000021, 0x80000001000342B0, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v15 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_100023568(a1, (unint64_t)a2, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%{public}s failed to create URL for payload: %s.", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_10002A7D0();
  swift_allocError();
  *unsigned int v17 = 1;
  return swift_willThrow();
}

unsigned __int8 *sub_1000291BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_100029520();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  uint64_t v11 = sub_1000292A4(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_1000292A4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (unint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_100029520()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = sub_1000295A0(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1000295A0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_1000296F8(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_100023A08(v9, 0),
          unint64_t v12 = sub_1000297F8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = static String._uncheckedFromUTF8(_:)();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return static String._uncheckedFromUTF8(_:)();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  _StringObject.sharedUTF8.getter();
LABEL_4:

  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_1000296F8(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_100023A70(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_100023A70(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_1000297F8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    void v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_100023A70(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_100023A70(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

NSObject *sub_100029A0C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v55 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v7 = (char *)&v47 - v6;
  id v8 = [self currentTraitCollection];
  id v9 = [v8 userInterfaceStyle];

  if (!v9)
  {
    if (qword_100045E70 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_100005EC0(v14, (uint64_t)qword_100048EA0);
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v11, v15)) {
      goto LABEL_22;
    }
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    unint64_t v17 = "Using black strokes on white background for ACC in unspecified UI style.";
    goto LABEL_20;
  }
  if (v9 == (id)1)
  {
    if (qword_100045E70 != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    sub_100005EC0(v18, (uint64_t)qword_100048EA0);
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v11, v15)) {
      goto LABEL_22;
    }
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    unint64_t v17 = "Using black strokes on white background for ACC in light mode UI style.";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v11, v15, v17, v16, 2u);
    uint64_t v52 = 1;
    goto LABEL_21;
  }
  if (v9 != (id)2)
  {
    if (qword_100045E70 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100005EC0(v19, (uint64_t)qword_100048EA0);
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      unint64_t v17 = "Using black strokes on white background for ACC in unknown UI style.";
      goto LABEL_20;
    }
LABEL_22:
    uint64_t v52 = 1;
    goto LABEL_24;
  }
  if (qword_100045E70 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_100005EC0(v10, (uint64_t)qword_100048EA0);
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Using white strokes on black background for ACC in dark mode UI style.", v13, 2u);
    uint64_t v52 = 0;
LABEL_21:
    swift_slowDealloc();
    goto LABEL_24;
  }
  uint64_t v52 = 0;
LABEL_24:

  if (qword_100045E70 != -1) {
    swift_once();
  }
  uint64_t v20 = type metadata accessor for Logger();
  uint64_t v21 = sub_100005EC0(v20, (uint64_t)qword_100048EA0);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v55 + 16);
  uint64_t v53 = a1;
  uint64_t v49 = v22;
  v22(v7, a1, v2);
  uint64_t v51 = v21;
  unint64_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    unint64_t v47 = (void *)swift_slowAlloc();
    id v59 = v47;
    *(_DWORD *)uint64_t v25 = 136446722;
    uint64_t v58 = sub_100023568(0xD000000000000021, 0x80000001000342B0, (uint64_t *)&v59);
    uint64_t v48 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v25 + 12) = 2082;
    sub_10002A778();
    uint64_t v26 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v58 = sub_100023568(v26, v27, (uint64_t *)&v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    unint64_t v50 = *(void (**)(char *, uint64_t))(v55 + 8);
    v50(v7, v2);
    *(_WORD *)(v25 + 22) = 2050;
    uint64_t v58 = v52;
    uint64_t v5 = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "%{public}s encoding URL: %{public}s with preset color: %{public}ld.", (uint8_t *)v25, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    unint64_t v50 = *(void (**)(char *, uint64_t))(v55 + 8);
    v50(v7, v2);
  }

  char v57 = ACCBakerDataVersion2;
  id v59 = 0;
  uint64_t v28 = v53;
  URL._bridgeToObjectiveC()((NSURL *)ACCBakerDataVersion2);
  os_log_type_t v30 = v29;
  uint64_t v31 = (void *)ACCBakerCreate();

  if (v31)
  {
    id v32 = v31;
    os_log_type_t v30 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    v49(v5, v28, v2);
    unint64_t v33 = Logger.logObject.getter();
    uint64_t v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, (os_log_type_t)v34))
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v58 = swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 136315394;
      uint64_t v56 = sub_100023568(0xD000000000000021, 0x80000001000342B0, &v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v35 + 12) = 2082;
      os_log_type_t v30 = (v35 + 14);
      sub_10002A778();
      uint64_t v36 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v56 = sub_100023568(v36, v37, &v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v50(v5, v2);
      _os_log_impl((void *)&_mh_execute_header, v33, (os_log_type_t)v34, "%s failed to create SVG Data from URL \"%{public}s\".", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v50(v5, v2);
    }

    if (v59)
    {
      id v38 = v59;
      os_log_type_t v30 = Logger.logObject.getter();
      os_log_type_t v39 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v30, v39))
      {
        id v40 = (uint8_t *)swift_slowAlloc();
        uint64_t v58 = swift_slowAlloc();
        *(_DWORD *)id v40 = 136446210;
        uint64_t v56 = (uint64_t)v38;
        type metadata accessor for CFError(0);
        id v41 = v38;
        uint64_t v42 = String.init<A>(describing:)();
        uint64_t v56 = sub_100023568(v42, v43, &v58);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v30, v39, "%{public}s.", v40, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
    }
    sub_10002A7D0();
    uint64_t v44 = swift_allocError();
    *uint64_t v45 = 2;
    uint64_t v54 = v44;
    swift_willThrow();
  }
  return v30;
}

uint64_t sub_10002A3B4()
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v1 = CGSVGDocumentCreateFromData();

  if (!v1)
  {
    if (qword_100045E70 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100005EC0(v2, (uint64_t)qword_100048EA0);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 136446210;
      sub_100023568(0xD000000000000021, 0x80000001000342B0, &v8);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%{public}s failed to create CGSVGDocument from Data.", v5, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10002A7D0();
    swift_allocError();
    *uint64_t v6 = 3;
    swift_willThrow();
  }
  return v1;
}

id sub_10002A588(uint64_t a1)
{
  id v1 = [self _imageWithCGSVGDocument:a1 scale:0 orientation:1.0];
  if (!v1)
  {
    if (qword_100045E70 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100005EC0(v2, (uint64_t)qword_100048EA0);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 136446210;
      sub_100023568(0xD000000000000021, 0x80000001000342B0, &v8);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%{public}s failed to create UIImage from CGSVGDocument.", v5, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10002A7D0();
    swift_allocError();
    *uint64_t v6 = 4;
    swift_willThrow();
  }
  return v1;
}

unint64_t sub_10002A778()
{
  unint64_t result = qword_100047A60;
  if (!qword_100047A60)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047A60);
  }
  return result;
}

unint64_t sub_10002A7D0()
{
  unint64_t result = qword_100047A68;
  if (!qword_100047A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047A68);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ProxCardStageIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ProxCardStageIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x10002A980);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProxCardStageIdentifier()
{
  return &type metadata for ProxCardStageIdentifier;
}

unsigned char *storeEnumTagSinglePayload for ProxCardStageVersion(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10002AA54);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProxCardStageVersion()
{
  return &type metadata for ProxCardStageVersion;
}

unint64_t sub_10002AA8C(char a1)
{
  unint64_t result = 0x6E55656369766564;
  switch(a1)
  {
    case 1:
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 0x6375646F72746E69;
      break;
    case 4:
      unint64_t result = 0x7463757274736E69;
      break;
    case 5:
      unint64_t result = 0x61506C6175736976;
      break;
    case 6:
      unint64_t result = 0x69726961506E6970;
      break;
    case 7:
      unint64_t result = 0x73736572676F7270;
      break;
    case 8:
      unint64_t result = 0x6974656C706D6F63;
      break;
    case 9:
      unint64_t result = 0x6572756C696166;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10002ABF0(char a1)
{
  unint64_t result = 0x7520656369766564;
  switch(a1)
  {
    case 1:
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 3:
      unint64_t result = 0x6375646F72746E69;
      break;
    case 4:
      unint64_t result = 0x7463757274736E69;
      break;
    case 5:
      unint64_t result = 0x70206C6175736976;
      break;
    case 6:
      unint64_t result = 0x72696170206E6970;
      break;
    case 7:
      unint64_t result = 0x73736572676F7270;
      break;
    case 8:
      unint64_t result = 0x6974656C706D6F63;
      break;
    case 9:
      unint64_t result = 0x6572756C696166;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10002AD58(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_10002AA8C(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10002AA8C(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_10002ADE4()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  sub_10002AA8C(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t sub_10002AE48()
{
  sub_10002AA8C(*v0);
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10002AE9C()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  sub_10002AA8C(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t sub_10002AEFC@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10002B10C(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_10002AF2C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10002AA8C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10002AF58()
{
  return sub_10002ABF0(*v0);
}

Swift::Int sub_10002AF60()
{
  return Hasher._finalize()();
}

uint64_t sub_10002AFA8()
{
  return String.hash(into:)();
}

Swift::Int sub_10002AFB4()
{
  return Hasher._finalize()();
}

uint64_t sub_10002AFF8@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10003D490, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void sub_10002B04C(void *a1@<X8>)
{
  *a1 = 12662;
  a1[1] = 0xE200000000000000;
}

unint64_t sub_10002B060()
{
  unint64_t result = qword_100047A78;
  if (!qword_100047A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047A78);
  }
  return result;
}

unint64_t sub_10002B0B8()
{
  unint64_t result = qword_100047A80;
  if (!qword_100047A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047A80);
  }
  return result;
}

unint64_t sub_10002B10C(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10003D380, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 0xA) {
    return 10;
  }
  else {
    return v3;
  }
}

uint64_t type metadata accessor for PinPairingStage()
{
  return self;
}

void sub_10002B17C(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10002B1E4(uint64_t a1)
{
  uint64_t v2 = v1;
  *(void *)(v1 + 24) = a1;
  id v3 = objc_allocWithZone((Class)PRXIconContentViewController);
  swift_retain();
  id v4 = [v3 init];
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = self;
  id v6 = v4;
  id v7 = [v5 mainBundle];
  v8._countAndFlagsBits = 0xD000000000000024;
  v40._object = (void *)0xE000000000000000;
  v8._object = (void *)0x80000001000343C0;
  v9.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v9.value._object = (void *)0xEB00000000656C62;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  v40._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v8, v9, (NSBundle)v7, v10, v40);

  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v6 setTitle:v11];

  Class v12 = (Class)v6;
  id v13 = [v5 mainBundle];
  v14._countAndFlagsBits = 0xD000000000000027;
  v41._object = (void *)0xE000000000000000;
  v14._object = (void *)0x80000001000343F0;
  v15.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v15.value._object = (void *)0xEB00000000656C62;
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v41._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v14, v15, (NSBundle)v13, v16, v41);

  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [(objc_class *)v12 setSubtitle:v17];

  [(objc_class *)v12 setDismissalType:1];
  uint64_t v18 = String.appleAccountRebrandStringKey.getter(0xD000000000000025);
  uint64_t v20 = v19;
  id v21 = [v5 mainBundle];
  v42._object = (void *)0xE000000000000000;
  v22._countAndFlagsBits = v18;
  v22._object = v20;
  v23.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v23.value._object = (void *)0xEB00000000656C62;
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  v42._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v22, v23, (NSBundle)v21, v24, v42);
  swift_bridgeObjectRelease();

  uint64_t v25 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  NSString v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_10002B7EC;
  aBlock[5] = v25;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002B17C;
  void aBlock[3] = &unk_10003E878;
  unint64_t v27 = _Block_copy(aBlock);
  id v28 = [self actionWithTitle:v26 style:0 handler:v27];

  _Block_release(v27);
  swift_release();
  swift_release();

  NSString v29 = String._bridgeToObjectiveC()();
  id v30 = [self imageNamed:v29];

  if (v30)
  {
    id v31 = [self mainScreen];
    [v31 scale];
    double v33 = v32;

    id v34 = [v30 _applicationIconImageForFormat:2 precomposed:1 scale:v33];
    if (v34)
    {
      sub_100005F50(&qword_100046258);
      uint64_t v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = xmmword_10002FBE0;
      *(void *)(v35 + 32) = v34;
      aBlock[0] = v35;
      specialized Array._endMutation()();
      sub_10002B80C();
      id v36 = v34;
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [(objc_class *)v12 setImages:isa];

      Class v12 = isa;
    }
  }

  swift_release();
  return v2;
}

uint64_t sub_10002B6E4()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    swift_release();
    sub_10000621C();
    return swift_release();
  }
  return result;
}

uint64_t sub_10002B750()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for AppleIDAccountUpgradeUIProvider()
{
  return self;
}

uint64_t sub_10002B7B4()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002B7EC()
{
  return sub_10002B6E4();
}

uint64_t sub_10002B7F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002B804()
{
  return swift_release();
}

unint64_t sub_10002B80C()
{
  unint64_t result = qword_100047BE0;
  if (!qword_100047BE0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100047BE0);
  }
  return result;
}

uint64_t type metadata accessor for VisualPairingStage()
{
  return self;
}

uint64_t type metadata accessor for EducationActionHandler()
{
  return self;
}

uint64_t sub_10002B894()
{
  uint64_t v1 = v0;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "ProgressUIProvider is being deinitialized", v5, 2u);
    swift_slowDealloc();
  }

  id v6 = *(void **)(v1 + 24);
  swift_release();

  return v1;
}

uint64_t sub_10002B988()
{
  sub_10002B894();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for ProgressUIProvider()
{
  return self;
}

void *sub_10002B9E0(void *a1, uint64_t a2)
{
  id v3 = v2;
  v3[3] = a1;
  v3[4] = a2;
  type metadata accessor for ProgressViewServiceUIViewController();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a1;
  swift_retain();
  Swift::String v8 = (char *)[v6 init];
  swift_weakAssign();
  _OWORD v3[2] = v8;
  Swift::String_optional v9 = &v8[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler];
  Swift::String v10 = *(void **)&v8[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler];
  *(void *)Swift::String_optional v9 = v7;
  *((void *)v9 + 1) = a2;
  id v11 = v7;
  swift_retain();
  Class v12 = v8;
  sub_10002BD84(v10);
  id v13 = self;
  Swift::String v14 = v12;
  id v15 = [v13 mainBundle];
  v22._object = (void *)0xE000000000000000;
  v16._object = (void *)0x8000000100034580;
  v16._countAndFlagsBits = 0xD000000000000014;
  v17.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v17.value._object = (void *)0xEB00000000656C62;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  v22._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v16, v17, (NSBundle)v15, v18, v22);

  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v14 setTitle:v19];

  [v14 setDismissalType:1];
  sub_1000079FC();
  id v20 = [objc_allocWithZone((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v20 startAnimating];
  sub_100006964(v20, 0, 0, 0, 6);

  swift_release();
  swift_release();

  return v3;
}

void *sub_10002BD04()
{
  return sub_10002BD84(*(void **)(v0
                                + OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler));
}

id sub_10002BD18()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProgressViewServiceUIViewController();
  [super dealloc];
}

uint64_t type metadata accessor for ProgressViewServiceUIViewController()
{
  return self;
}

void *sub_10002BD84(void *result)
{
  if (result)
  {

    return (void *)swift_release();
  }
  return result;
}

void *sub_10002BDC4(void *result)
{
  if (result)
  {
    id v1 = result;
    return (void *)swift_retain();
  }
  return result;
}

uint64_t sub_10002BE04(uint64_t a1, uint64_t a2)
{
  id v5 = [objc_allocWithZone((Class)PRXIconContentViewController) init];
  uint64_t v53 = v2;
  *(void *)(v2 + 16) = v5;
  uint64_t v6 = qword_100045E50;
  id v7 = v5;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100005EC0(v8, (uint64_t)qword_100048E40);
  Swift::String_optional v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Creating Apple ID Renewal card", v11, 2u);
    swift_slowDealloc();
  }

  id v12 = v7;
  uint64_t v13 = String.appleAccountRebrandStringKey.getter(0xD000000000000024);
  id v15 = v14;
  Swift::String v16 = self;
  id v17 = [v16 mainBundle];
  v55._object = (void *)0xE000000000000000;
  v18._countAndFlagsBits = v13;
  v18._object = v15;
  v19.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v19.value._object = (void *)0xEB00000000656C62;
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  v55._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v18, v19, (NSBundle)v17, v20, v55);
  swift_bridgeObjectRelease();

  NSString v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v12 setTitle:v21];

  id v22 = v12;
  uint64_t v23 = String.appleAccountRebrandStringKey.getter(0xD000000000000027);
  uint64_t v25 = v24;
  id v26 = [v16 mainBundle];
  v56._object = (void *)0xE000000000000000;
  v27._countAndFlagsBits = v23;
  v27._object = v25;
  v28.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v28.value._object = (void *)0xEB00000000656C62;
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  v56._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v27, v28, (NSBundle)v26, v29, v56);
  swift_bridgeObjectRelease();

  NSString v30 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v22 setSubtitle:v30];

  [v22 setDismissalType:1];
  sub_10002C46C(v22);
  uint64_t v31 = String.appleAccountRebrandStringKey.getter(0xD000000000000025);
  double v33 = v32;
  id v34 = [v16 mainBundle];
  v57._object = (void *)0xE000000000000000;
  v35._countAndFlagsBits = v31;
  v35._object = v33;
  v36.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v36.value._object = (void *)0xEB00000000656C62;
  v37._countAndFlagsBits = 0;
  v37._object = (void *)0xE000000000000000;
  v57._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v35, v36, (NSBundle)v34, v37, v57);
  swift_bridgeObjectRelease();

  id v38 = (void *)swift_allocObject();
  v38[2] = a1;
  v38[3] = a2;
  v38[4] = v22;
  id v39 = v22;
  swift_retain();
  swift_retain();
  NSString v40 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = (uint64_t)sub_10002C64C;
  aBlock[5] = (uint64_t)v38;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10002B17C;
  void aBlock[3] = (uint64_t)&unk_10003E958;
  Swift::String v41 = _Block_copy(aBlock);
  id v42 = [self actionWithTitle:v40 style:0 handler:v41];

  _Block_release(v41);
  swift_release();

  id v43 = v39;
  uint64_t v44 = Logger.logObject.getter();
  os_log_type_t v45 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 136446210;
    id v47 = [v43 title];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v51 = v50;
    }
    else
    {
      uint64_t v49 = 0;
      unint64_t v51 = 0xE000000000000000;
    }
    sub_100023568(v49, v51, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "Displaying Apple ID Renewal with title: %{public}s", v46, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_release();
    swift_release();
  }
  else
  {

    swift_release();
    swift_release();
  }
  return v53;
}

uint64_t sub_10002C410()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for AppleIDAccountRenewalUIProvider()
{
  return self;
}

void sub_10002C46C(void *a1)
{
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [self imageNamed:v2];

  if (v3)
  {
    id v4 = [self mainScreen];
    [v4 scale];
    double v6 = v5;

    id v7 = [v3 _applicationIconImageForFormat:2 precomposed:1 scale:v6];
    if (v7)
    {
      sub_100005F50(&qword_100046258);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_10002FBE0;
      *(void *)(v8 + 32) = v7;
      specialized Array._endMutation()();
      sub_10002B80C();
      id v9 = v7;
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [a1 setImages:isa];
    }
  }
}

uint64_t sub_10002C604()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002C64C()
{
  return sub_100008A28(v0[4], v0[2], v0[3]);
}

uint64_t sub_10002C658(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002C668()
{
  return swift_release();
}

uint64_t sub_10002C670()
{
  uint64_t v1 = v0;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  id v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    double v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "ProxCardCompleteUI is being deinitialized", v5, 2u);
    swift_slowDealloc();
  }

  swift_release();
  return v1;
}

uint64_t sub_10002C760()
{
  sub_10002C670();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for CompleteUIProvider()
{
  return self;
}

uint64_t sub_10002C7B8(uint64_t a1)
{
  uint64_t v2 = v1;
  *(void *)(v1 + 24) = a1;
  id v3 = objc_allocWithZone((Class)PRXCardContentViewController);
  swift_retain();
  id v4 = [v3 init];
  *(void *)(v2 + 16) = v4;
  double v5 = self;
  id v6 = v4;
  id v7 = [v5 mainBundle];
  v8._countAndFlagsBits = 0xD000000000000014;
  v29._object = (void *)0xE000000000000000;
  v8._object = (void *)0x80000001000346A0;
  v9.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v9.value._object = (void *)0xEB00000000656C62;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  v29._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v8, v9, (NSBundle)v7, v10, v29);

  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v6 setTitle:v11];

  [*(id *)(v2 + 16) setDismissalType:3];
  id v12 = *(id *)(v2 + 16);
  id v13 = [v5 mainBundle];
  v14._countAndFlagsBits = 0xD000000000000017;
  v30._object = (void *)0xE000000000000000;
  v14._object = (void *)0x80000001000346C0;
  v15.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v15.value._object = (void *)0xEB00000000656C62;
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v30._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v14, v15, (NSBundle)v13, v16, v30);

  uint64_t v17 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_10002CCDC;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002B17C;
  void aBlock[3] = &unk_10003E9C8;
  Swift::String_optional v19 = _Block_copy(aBlock);
  id v20 = [self actionWithTitle:v18 style:0 handler:v19];

  _Block_release(v19);
  swift_release();
  swift_release();

  NSString v21 = *(void **)(v2 + 16);
  id v22 = self;
  id v23 = v21;
  id v24 = [v22 systemBlueColor];
  id v25 = v24;
  id v26 = sub_100008780(0xD000000000000010, 0x80000001000346E0, (uint64_t)v25);

  sub_100006964(v26, 0xD000000000000010, 0x80000001000346E0, (uint64_t)v24, 0);
  swift_release();
  swift_release();

  return v2;
}

uint64_t sub_10002CB5C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    swift_release();
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_100005EC0(v1, (uint64_t)qword_100048E40);
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Proximity Setup completed", v4, 2u);
      swift_slowDealloc();
    }

    swift_retain();
    PassthroughSubject.send(_:)();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_10002CCA4()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002CCDC()
{
  return sub_10002CB5C();
}

uint64_t sub_10002CCE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002CCF4()
{
  return swift_release();
}

id sub_10002CDB8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

uint64_t sub_10002CE20()
{
  uint64_t v1 = v0;
  if (qword_100045E50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005EC0(v2, (uint64_t)qword_100048E40);
  os_log_type_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    double v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "FailureUIProvider is being deinitialized", v5, 2u);
    swift_slowDealloc();
  }

  swift_release();
  return v1;
}

uint64_t sub_10002CF10()
{
  sub_10002CE20();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for FailureUIProvider()
{
  return self;
}

uint64_t sub_10002CF68(uint64_t a1)
{
  uint64_t v2 = v1;
  *(void *)(v1 + 24) = a1;
  type metadata accessor for ViewServiceUIViewControllerExtendedHeight();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  swift_retain();
  id v4 = [v3 init];
  swift_weakAssign();
  *(void *)(v2 + 16) = v4;
  double v5 = self;
  id v6 = v4;
  id v7 = [v5 mainBundle];
  v8._countAndFlagsBits = 0xD000000000000013;
  v35._object = (void *)0xE000000000000000;
  v8._object = (void *)0x80000001000347A0;
  v9.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v9.value._object = (void *)0xEB00000000656C62;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  v35._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v8, v9, (NSBundle)v7, v10, v35);

  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v6 setTitle:v11];

  id v12 = *(id *)(v2 + 16);
  id v13 = [v5 mainBundle];
  v36._object = (void *)0xE000000000000000;
  v14._object = (void *)0x80000001000347C0;
  v14._countAndFlagsBits = 0xD000000000000016;
  v15.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v15.value._object = (void *)0xEB00000000656C62;
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v36._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v14, v15, (NSBundle)v13, v16, v36);

  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v12 setSubtitle:v17];

  [*(id *)(v2 + 16) setDismissalType:3];
  id v18 = *(id *)(v2 + 16);
  id v19 = [v5 mainBundle];
  v20._countAndFlagsBits = 0xD000000000000019;
  v37._object = (void *)0xE000000000000000;
  v20._object = (void *)0x80000001000347E0;
  v21.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v21.value._object = (void *)0xEB00000000656C62;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v37._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v20, v21, (NSBundle)v19, v22, v37);

  uint64_t v23 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  NSString v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_10002D56C;
  aBlock[5] = v23;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002B17C;
  void aBlock[3] = &unk_10003EA38;
  id v25 = _Block_copy(aBlock);
  id v26 = [self actionWithTitle:v24 style:0 handler:v25];

  _Block_release(v25);
  swift_release();
  swift_release();

  Swift::String v27 = *(void **)(v2 + 16);
  Swift::String_optional v28 = self;
  id v29 = v27;
  id v30 = [v28 redColor];
  id v31 = v30;
  id v32 = sub_100008780(0xD000000000000016, 0x8000000100034800, (uint64_t)v31);

  sub_100006964(v32, 0xD000000000000016, 0x8000000100034800, (uint64_t)v30, 0);
  swift_release();
  swift_release();

  return v2;
}

uint64_t sub_10002D3EC()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    swift_release();
    if (qword_100045E50 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_100005EC0(v1, (uint64_t)qword_100048E40);
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Handle failure action", v4, 2u);
      swift_slowDealloc();
    }

    swift_retain();
    PassthroughSubject.send(_:)();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_10002D534()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002D56C()
{
  return sub_10002D3EC();
}

uint64_t sub_10002D574(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002D584()
{
  return swift_release();
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

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t TimeZone.identifier.getter()
{
  return TimeZone.identifier.getter();
}

uint64_t static TimeZone._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t WFSetupData.Builder.init()()
{
  return WFSetupData.Builder.init()();
}

uint64_t type metadata accessor for WFSetupData.Builder()
{
  return type metadata accessor for WFSetupData.Builder();
}

uint64_t WFSetupClient.init(queue:deviceIdentifier:)()
{
  return WFSetupClient.init(queue:deviceIdentifier:)();
}

uint64_t type metadata accessor for WFSetupClient()
{
  return type metadata accessor for WFSetupClient();
}

uint64_t PrescriptionRecord.init(accPayload:enrollmentName:enrollmentDate:leftLensFactoryCalibrationData:rightLensFactoryCalibrationData:)()
{
  return PrescriptionRecord.init(accPayload:enrollmentName:enrollmentDate:leftLensFactoryCalibrationData:rightLensFactoryCalibrationData:)();
}

uint64_t type metadata accessor for PrescriptionRecord()
{
  return type metadata accessor for PrescriptionRecord();
}

uint64_t type metadata accessor for WFSetupServerAnisetteDataProvider()
{
  return type metadata accessor for WFSetupServerAnisetteDataProvider();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
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

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t Publishers.Autoconnect.upstream.getter()
{
  return Publishers.Autoconnect.upstream.getter();
}

uint64_t dispatch thunk of Cancellable.cancel()()
{
  return dispatch thunk of Cancellable.cancel()();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t PassthroughSubject.send(_:)()
{
  return PassthroughSubject.send(_:)();
}

uint64_t PassthroughSubject.init()()
{
  return PassthroughSubject.init()();
}

uint64_t CurrentValueSubject.send(_:)()
{
  return CurrentValueSubject.send(_:)();
}

uint64_t CurrentValueSubject.value.getter()
{
  return CurrentValueSubject.value.getter();
}

uint64_t CurrentValueSubject.value.setter()
{
  return CurrentValueSubject.value.setter();
}

uint64_t CurrentValueSubject.init(_:)()
{
  return CurrentValueSubject.init(_:)();
}

uint64_t ConnectablePublisher.autoconnect()()
{
  return ConnectablePublisher.autoconnect()();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
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

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t DispatchWorkItem.init(flags:block:)()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return type metadata accessor for DispatchWorkItem();
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

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.append<A>(contentsOf:)()
{
  return String.append<A>(contentsOf:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t static Int._forceBridgeFromObjectiveC(_:result:)()
{
  return static Int._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Int._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Int._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Int._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
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

uint64_t OS_dispatch_queue.asyncAfter(deadline:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
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

uint64_t NSTimer.TimerPublisher.connect()()
{
  return NSTimer.TimerPublisher.connect()();
}

uint64_t type metadata accessor for NSTimer.TimerPublisher()
{
  return type metadata accessor for NSTimer.TimerPublisher();
}

uint64_t static NSTimer.publish(every:tolerance:on:in:options:)()
{
  return static NSTimer.publish(every:tolerance:on:in:options:)();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
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

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
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

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
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

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t ACCBakerCreate()
{
  return _ACCBakerCreate();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CGSVGDocumentCreateFromData()
{
  return _CGSVGDocumentCreateFromData();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSRequestPasscodeUnlockUI()
{
  return _SBSRequestPasscodeUnlockUI();
}

uint64_t SFDeviceHomeButtonType()
{
  return _SFDeviceHomeButtonType();
}

uint64_t TMIsAutomaticTimeZoneEnabled()
{
  return _TMIsAutomaticTimeZoneEnabled();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return _WiFiDeviceClientCopyCurrentNetwork();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return _WiFiManagerClientCopyDevices();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiNetworkCopyPassword()
{
  return _WiFiNetworkCopyPassword();
}

uint64_t WiFiNetworkCopyRecord()
{
  return _WiFiNetworkCopyRecord();
}

uint64_t WiFiNetworkGetType()
{
  return _WiFiNetworkGetType();
}

uint64_t WiFiNetworkIsCaptive()
{
  return _WiFiNetworkIsCaptive();
}

uint64_t WiFiNetworkIsEAP()
{
  return _WiFiNetworkIsEAP();
}

uint64_t WiFiNetworkIsExpirable()
{
  return _WiFiNetworkIsExpirable();
}

uint64_t WiFiNetworkIsProfileBased()
{
  return _WiFiNetworkIsProfileBased();
}

uint64_t _AXSCopySettingsDataBlobForBuddy()
{
  return __AXSCopySettingsDataBlobForBuddy();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void exit(int a1)
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_collector(void *a1, const char *a2, ...)
{
  return _[a1 collector];
}

id objc_msgSend_fetchPrescriptionRecordsWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchPrescriptionRecordsWithCompletion:];
}

id objc_msgSend_initWithTimeout_(void *a1, const char *a2, ...)
{
  return [a1 initWithTimeout:];
}

id objc_msgSend_setCollector_(void *a1, const char *a2, ...)
{
  return [a1 setCollector:];
}