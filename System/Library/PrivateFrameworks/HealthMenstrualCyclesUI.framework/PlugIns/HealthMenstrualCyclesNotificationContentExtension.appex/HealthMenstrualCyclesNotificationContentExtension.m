void sub_100001DC0()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for NotificationViewController();
  objc_msgSendSuper2(&v8, "viewDidLoad");
  v1 = [v0 view];
  if (v1)
  {
    v2 = v1;
    v3 = [v1 heightAnchor];

    v4 = [v3 constraintEqualToConstant:0.0];
    [v4 setActive:1];

    v5 = [v0 view];
    if (v5)
    {
      v6 = v5;
      v7 = [self clearColor];
      [v6 setBackgroundColor:v7];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100001F28(void *a1)
{
  v2 = v1;
  id v3 = [a1 request];
  id v4 = [v3 content];

  NSString v5 = [v4 categoryIdentifier];
  if (!v5)
  {
    sub_100003318();
    NSString v5 = sub_1000032E8();
    swift_bridgeObjectRelease();
  }
  uint64_t v6 = sub_100003318();
  uint64_t v8 = v7;
  if (v6 == sub_100003318() && v8 == v9) {
    goto LABEL_15;
  }
  char v11 = sub_1000033E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11)
  {
LABEL_16:
    sub_100003398();
    sub_100002C18();
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_100003640;
    swift_getObjectType();
    sub_100002CC8();
    uint64_t v23 = sub_100003328();
    uint64_t v25 = v24;
    *(void *)(v22 + 56) = &type metadata for String;
    unint64_t v26 = sub_100002D00();
    *(void *)(v22 + 64) = v26;
    *(void *)(v22 + 32) = v23;
    *(void *)(v22 + 40) = v25;
    type metadata accessor for HKMCNotificationCategory();
    id v27 = v5;
    uint64_t v28 = sub_100003328();
    *(void *)(v22 + 96) = &type metadata for String;
    *(void *)(v22 + 104) = v26;
    *(void *)(v22 + 72) = v28;
    *(void *)(v22 + 80) = v29;
    sub_100002DAC(0, &qword_100008668);
    id v30 = (id)sub_1000033A8();
    sub_1000032D8();

    goto LABEL_17;
  }
  uint64_t v12 = sub_100003318();
  uint64_t v14 = v13;
  if (v12 == sub_100003318() && v14 == v15)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  char v17 = sub_1000033E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v17) {
    goto LABEL_16;
  }
  uint64_t v18 = sub_100003318();
  uint64_t v20 = v19;
  if (v18 == sub_100003318() && v20 == v21) {
    goto LABEL_15;
  }
  char v31 = sub_1000033E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v31) {
    goto LABEL_16;
  }
  uint64_t v32 = sub_100003318();
  uint64_t v34 = v33;
  if (v32 == sub_100003318() && v34 == v35) {
    goto LABEL_15;
  }
  char v36 = sub_1000033E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v36) {
    goto LABEL_16;
  }
  uint64_t v37 = sub_100003318();
  uint64_t v39 = v38;
  if (v37 == sub_100003318() && v39 == v40) {
    goto LABEL_15;
  }
  char v41 = sub_1000033E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v41) {
    goto LABEL_16;
  }
  uint64_t v42 = sub_100003318();
  uint64_t v44 = v43;
  if (v42 == sub_100003318() && v44 == v45) {
    goto LABEL_15;
  }
  char v46 = sub_1000033E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v46) {
    goto LABEL_16;
  }
  uint64_t v47 = sub_100003318();
  uint64_t v49 = v48;
  if (v47 == sub_100003318() && v49 == v50) {
    goto LABEL_15;
  }
  char v51 = sub_1000033E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v51) {
    goto LABEL_16;
  }
  uint64_t v52 = sub_100003318();
  uint64_t v54 = v53;
  if (v52 == sub_100003318() && v54 == v55) {
    goto LABEL_15;
  }
  char v56 = sub_1000033E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v56) {
    goto LABEL_16;
  }
  uint64_t v57 = sub_100003318();
  uint64_t v59 = v58;
  if (v57 == sub_100003318() && v59 == v60) {
    goto LABEL_15;
  }
  char v61 = sub_1000033E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v61) {
    goto LABEL_16;
  }
  uint64_t v62 = sub_100003318();
  uint64_t v64 = v63;
  if (v62 == sub_100003318() && v64 == v65) {
    goto LABEL_15;
  }
  char v66 = sub_1000033E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v66) {
    goto LABEL_16;
  }
  uint64_t v67 = sub_100003318();
  uint64_t v69 = v68;
  if (v67 == sub_100003318() && v69 == v70) {
    goto LABEL_15;
  }
  char v71 = sub_1000033E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v71) {
    goto LABEL_16;
  }
  uint64_t v72 = sub_100003318();
  uint64_t v74 = v73;
  if (v72 == sub_100003318() && v74 == v75) {
    goto LABEL_15;
  }
  char v76 = sub_1000033E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v76) {
    goto LABEL_16;
  }
  uint64_t v77 = sub_100003318();
  uint64_t v79 = v78;
  if (v77 == sub_100003318() && v79 == v80)
  {
    swift_bridgeObjectRelease_n();
LABEL_51:
    v82 = self;
    id v83 = objc_msgSend(v82, "hkmc_actionWithIdentifier:", HKMCNotificationActionIdentifierPeriodNotStarted);
    id v84 = objc_msgSend(v82, "hkmc_actionWithIdentifier:", HKMCNotificationActionIdentifierOpenAddPeriodCalendar);
    goto LABEL_52;
  }
  char v81 = sub_1000033E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v81) {
    goto LABEL_51;
  }
  uint64_t v100 = sub_100003318();
  uint64_t v102 = v101;
  if (v100 != sub_100003318() || v102 != v103)
  {
    char v104 = sub_1000033E8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v104) {
      goto LABEL_70;
    }
    uint64_t v106 = sub_100003318();
    uint64_t v108 = v107;
    if (v106 != sub_100003318() || v108 != v109)
    {
      char v110 = sub_1000033E8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v110) {
        goto LABEL_16;
      }
      uint64_t v111 = sub_100003318();
      uint64_t v113 = v112;
      if (v111 != sub_100003318() || v113 != v114) {
        sub_1000033E8();
      }
    }
    goto LABEL_15;
  }
  swift_bridgeObjectRelease_n();
LABEL_70:
  v105 = self;
  id v83 = objc_msgSend(v105, "hkmc_actionWithIdentifier:", HKMCNotificationActionIdentifierPeriodNotEnded);
  id v84 = objc_msgSend(v105, "hkmc_actionWithIdentifier:", HKMCNotificationActionIdentifierOpenAddPeriodCalendar);
LABEL_52:
  id v85 = v84;
  if (v83)
  {
    id v86 = v83;
    sub_100003348();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100003378();
    }
    sub_100003388();
    sub_100003368();
  }
  if (v85)
  {
    id v87 = v85;
    sub_100003348();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100003378();
    }
    sub_100003388();
    sub_100003368();
  }

  if (!&_swiftEmptyArrayStorage) {
    goto LABEL_16;
  }
  sub_100003398();
  sub_100002C18();
  uint64_t v88 = swift_allocObject();
  *(_OWORD *)(v88 + 16) = xmmword_100003630;
  swift_getObjectType();
  sub_100002CC8();
  uint64_t v89 = sub_100003328();
  uint64_t v91 = v90;
  *(void *)(v88 + 56) = &type metadata for String;
  unint64_t v92 = sub_100002D00();
  *(void *)(v88 + 64) = v92;
  *(void *)(v88 + 32) = v89;
  *(void *)(v88 + 40) = v91;
  if ((unint64_t)&_swiftEmptyArrayStorage >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v93 = sub_1000033B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v93 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  *(void *)(v88 + 96) = &type metadata for Int;
  *(void *)(v88 + 104) = &protocol witness table for Int;
  *(void *)(v88 + 72) = v93;
  type metadata accessor for HKMCNotificationCategory();
  id v30 = v5;
  uint64_t v94 = sub_100003328();
  *(void *)(v88 + 136) = &type metadata for String;
  *(void *)(v88 + 144) = v92;
  *(void *)(v88 + 112) = v94;
  *(void *)(v88 + 120) = v95;
  sub_100002DAC(0, &qword_100008668);
  v96 = (void *)sub_1000033A8();
  sub_1000032D8();
  swift_bridgeObjectRelease();

  id v97 = [v2 extensionContext];
  if (v97)
  {
    v98 = v97;
    sub_100002DAC(0, &qword_100008670);
    Class isa = sub_100003358().super.isa;
    swift_bridgeObjectRelease();
    [v98 setNotificationActions:isa];

    goto LABEL_18;
  }
LABEL_17:
  swift_bridgeObjectRelease();
LABEL_18:
}

id sub_100002BC0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NotificationViewController()
{
  return self;
}

void sub_100002C18()
{
  if (!qword_100008648)
  {
    sub_100002C70();
    unint64_t v0 = sub_1000033D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100008648);
    }
  }
}

unint64_t sub_100002C70()
{
  unint64_t result = qword_100008650;
  if (!qword_100008650)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_100008650);
  }
  return result;
}

unint64_t sub_100002CC8()
{
  unint64_t result = qword_100008658;
  if (!qword_100008658)
  {
    type metadata accessor for NotificationViewController();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_100008658);
  }
  return result;
}

unint64_t sub_100002D00()
{
  unint64_t result = qword_100008660;
  if (!qword_100008660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008660);
  }
  return result;
}

void type metadata accessor for HKMCNotificationCategory()
{
  if (!qword_100008678)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100008678);
    }
  }
}

uint64_t sub_100002DAC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100002DE8(uint64_t a1, uint64_t a2)
{
  return sub_100003188(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100002E00(uint64_t a1, id *a2)
{
  uint64_t result = sub_1000032F8();
  *a2 = 0;
  return result;
}

uint64_t sub_100002E78(uint64_t a1, id *a2)
{
  char v3 = sub_100003308();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100002EF8@<X0>(void *a1@<X8>)
{
  sub_100003318();
  NSString v2 = sub_1000032E8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100002F3C()
{
  uint64_t v0 = sub_100003318();
  uint64_t v2 = v1;
  if (v0 == sub_100003318() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1000033E8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100002FC8@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_1000032E8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100003010@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100003318();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000303C(uint64_t a1)
{
  uint64_t v2 = sub_100003294(&qword_100008698);
  uint64_t v3 = sub_100003294((unint64_t *)&unk_1000086A0);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000030D4()
{
  return sub_100003294(&qword_100008680);
}

uint64_t sub_100003108()
{
  return sub_100003294(&qword_100008688);
}

uint64_t sub_10000313C()
{
  return sub_100003294(&qword_100008690);
}

uint64_t sub_100003170(uint64_t a1, uint64_t a2)
{
  return sub_100003188(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100003188(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100003318();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000031CC()
{
  sub_100003318();
  sub_100003338();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100003220()
{
  sub_100003318();
  sub_1000033F8();
  sub_100003338();
  Swift::Int v0 = sub_100003408();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100003294(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for HKMCNotificationCategory();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000032D8()
{
  return os_log(_:dso:log:_:_:)();
}

NSString sub_1000032E8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000032F8()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100003308()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100003318()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003328()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100003338()
{
  return String.hash(into:)();
}

uint64_t sub_100003348()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100003358()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100003368()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100003378()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100003388()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100003398()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000033A8()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_1000033B8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000033D8()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_1000033E8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000033F8()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100003408()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}