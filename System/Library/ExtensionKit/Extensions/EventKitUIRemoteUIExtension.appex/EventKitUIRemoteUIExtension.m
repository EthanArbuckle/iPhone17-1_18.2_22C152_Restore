uint64_t sub_10000336C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000033D4()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = *(void *)(*v0 + 80);
  uint64_t v4 = *(void *)(*v0 + 88);
  swift_retain_n();
  swift_bridgeObjectRetain();

  return PrimitiveAppExtensionScene.init<A>(id:content:onConnection:)(v1, v2, sub_10000484C, v0, sub_100004854, v0, v3, v4);
}

uint64_t sub_10000349C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *(void *)(*a1 + 80);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  v9 = (char *)&v13 - v8;
  (*(void (**)(void))(v7 + 32))();
  uint64_t v10 = *(void *)(v1 + 88);
  sub_100017C4C(v6, v2, v10);
  v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  sub_100017C4C(v9, v2, v10);
  return ((uint64_t (*)(char *, uint64_t))v11)(v9, v2);
}

uint64_t sub_1000035F8(void *a1, uint64_t a2)
{
  os_log_type_t v4 = sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_100035F00;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v4))
  {
    id v6 = a1;
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109376;
    [v6 processIdentifier];
    sub_10001F9E8();
    *(_WORD *)(v7 + 8) = 1024;
    [v6 effectiveUserIdentifier];
    sub_10001F9E8();

    _os_log_impl((void *)&_mh_execute_header, v5, v4, "EKEventGenericDetailScene Starting: Setting up XPC connection. processIdentifier: %d. userIdentifier: %u.", (uint8_t *)v7, 0xEu);
    swift_slowDealloc();
  }
  uint64_t v8 = (void *)sub_10001F448();
  [a1 setExportedInterface:v8];

  v9 = (void *)sub_10001F438();
  [a1 setRemoteObjectInterface:v9];

  [a1 setExportedObject:a2];
  uint64_t v10 = *(void **)(a2 + 48);
  *(void *)(a2 + 48) = a1;
  id v11 = a1;

  [v11 resume];
  return 1;
}

uint64_t sub_1000037D0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_10001F728();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10001F748();
  uint64_t v9 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  sub_1000045F4();
  v12 = (void *)sub_10001F948();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_100004820;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = &unk_10002CFE8;
  v14 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100004D38((unint64_t *)&qword_100033C10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  sub_10001FA18();
  sub_10001F968();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v17);
}

uint64_t sub_100003AFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100003B54(a1, a2, a3, (void (*)(uint64_t, uint64_t))sub_1000037D0);
}

uint64_t sub_100003B14(uint64_t a1, uint64_t a2)
{
  return sub_100003BEC(a1, a2, (uint64_t)&unk_10002CF80, (uint64_t)sub_1000047B4, (uint64_t)&unk_10002CF98);
}

uint64_t sub_100003B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100003B54(a1, a2, a3, (void (*)(uint64_t, uint64_t))sub_100003B14);
}

uint64_t sub_100003B54(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = sub_10001F828();
  uint64_t v7 = v6;
  swift_retain();
  a4(v5, v7);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100003BC4(uint64_t a1, uint64_t a2)
{
  return sub_100003BEC(a1, a2, (uint64_t)&unk_10002CF30, (uint64_t)sub_100004778, (uint64_t)&unk_10002CF48);
}

uint64_t sub_100003BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  uint64_t v19 = a1;
  uint64_t v7 = sub_10001F728();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_10001F748();
  uint64_t v11 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000045F4();
  v14 = (void *)sub_10001F948();
  v15 = (void *)swift_allocObject();
  uint64_t v16 = v19;
  v15[2] = v5;
  v15[3] = v16;
  v15[4] = a2;
  aBlock[4] = v20;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = v21;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100004D38((unint64_t *)&qword_100033C10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  sub_10001FA18();
  sub_10001F968();
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v22);
}

uint64_t sub_100003EA8(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  os_log_type_t v4 = *(void (**)(uint64_t, uint64_t))(*(void *)(result + 56) + *a4);
  if (v4)
  {
    swift_retain();
    v4(a2, a3);
    return sub_1000047A0((uint64_t)v4);
  }
  return result;
}

uint64_t sub_100003F30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100003B54(a1, a2, a3, (void (*)(uint64_t, uint64_t))sub_100003BC4);
}

uint64_t sub_100003F48(uint64_t a1)
{
  uint64_t v3 = sub_10001F728();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10001F748();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000045F4();
  uint64_t v11 = (void *)sub_10001F948();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = v1;
  aBlock[4] = sub_10000466C;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = &unk_10002CEF8;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100004D38((unint64_t *)&qword_100033C10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  sub_10001FA18();
  sub_10001F968();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1000041FC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void (**)(uint64_t))(*(void *)(a2 + 56)
                                      + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_bottomStatusButtonTapCallback);
  if (v2)
  {
    uint64_t v3 = result;
    swift_retain();
    v2(v3);
    return sub_1000047A0((uint64_t)v2);
  }
  return result;
}

uint64_t sub_10000427C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  sub_100003F48(a3);

  return swift_release();
}

uint64_t sub_1000042C0()
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return v0;
}

uint64_t sub_1000042F8()
{
  sub_1000042C0();

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for EKEventGenericDetailScene()
{
  return sub_100004C08();
}

void type metadata accessor for EKEventStatusButtonsAction(uint64_t a1)
{
}

void type metadata accessor for EKEventEditViewAction(uint64_t a1)
{
}

void type metadata accessor for EKEntityType(uint64_t a1)
{
}

void type metadata accessor for EKCalendarChooserDisplayStyle(uint64_t a1)
{
}

void type metadata accessor for EKCalendarChooserSelectionStyle(uint64_t a1)
{
}

void type metadata accessor for EKAuthorizationStatus(uint64_t a1)
{
}

uint64_t sub_1000043BC()
{
  return sub_1000033D4();
}

uint64_t sub_1000043E4(uint64_t a1, uint64_t a2)
{
  return sub_100004A6C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

BOOL sub_100004408(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_10000441C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_10000442C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100004438(uint64_t a1, id *a2)
{
  uint64_t result = sub_10001F808();
  *a2 = 0;
  return result;
}

uint64_t sub_1000044B0(uint64_t a1, id *a2)
{
  char v3 = sub_10001F818();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100004530@<X0>(void *a1@<X8>)
{
  sub_10001F828();
  NSString v2 = sub_10001F7F8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004574()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000045B8(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000045F4()
{
  unint64_t result = qword_100033640;
  if (!qword_100033640)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100033640);
  }
  return result;
}

uint64_t sub_100004634()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000466C()
{
  return sub_1000041FC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100004674(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100004684()
{
  return swift_release();
}

uint64_t sub_10000468C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000046D0()
{
  unint64_t result = qword_100033C20;
  if (!qword_100033C20)
  {
    sub_10000472C((uint64_t *)&unk_100033650);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033C20);
  }
  return result;
}

uint64_t sub_10000472C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004778()
{
  return sub_100003EA8(v0[2], v0[3], v0[4], &OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_rightBarButtonTapCallback);
}

uint64_t sub_1000047A0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000047B4()
{
  return sub_100003EA8(v0[2], v0[3], v0[4], &OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_leftBarButtonTapCallback);
}

uint64_t sub_1000047E0()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100004820()
{
  return sub_100019C74(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_10000484C()
{
  return sub_10000349C(v0);
}

uint64_t sub_100004854(void *a1)
{
  return sub_1000035F8(a1, v1);
}

uint64_t sub_100004860(uint64_t a1)
{
  uint64_t v2 = sub_100004D38(&qword_100032EF0, type metadata accessor for UIContentSizeCategory);
  uint64_t v3 = sub_100004D38(&qword_100032EF8, type metadata accessor for UIContentSizeCategory);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000491C@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_10001F7F8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004964@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001F828();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004990(uint64_t a1)
{
  uint64_t v2 = sub_100004D38(&qword_100032F00, type metadata accessor for ActivityType);
  uint64_t v3 = sub_100004D38(&qword_100032F08, type metadata accessor for ActivityType);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100004A54(uint64_t a1, uint64_t a2)
{
  return sub_100004A6C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004A6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_10001F828();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100004AB0()
{
  sub_10001F828();
  sub_10001F848();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004B04()
{
  sub_10001F828();
  sub_10001FBB8();
  sub_10001F848();
  Swift::Int v0 = sub_10001FBC8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100004B7C()
{
  uint64_t v0 = sub_10001F828();
  uint64_t v2 = v1;
  if (v0 == sub_10001F828() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_10001FB88();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100004C08()
{
  return swift_getGenericMetadata();
}

void type metadata accessor for EKEventEditRemoteViewAction(uint64_t a1)
{
}

void type metadata accessor for UIContentSizeCategory(uint64_t a1)
{
}

void type metadata accessor for ActivityType(uint64_t a1)
{
}

void type metadata accessor for EKEventViewAction(uint64_t a1)
{
}

void type metadata accessor for EKRemoteViewPresentationStyle(uint64_t a1)
{
}

void sub_100004C9C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void *sub_100004CE4()
{
  return &protocol witness table for PrimitiveAppExtensionScene;
}

uint64_t sub_100004CF0()
{
  return sub_100004D38(&qword_100032EC0, type metadata accessor for ActivityType);
}

uint64_t sub_100004D38(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100004D80()
{
  return sub_100004D38(&qword_100032EC8, type metadata accessor for ActivityType);
}

uint64_t sub_100004DC8()
{
  return sub_100004D38(&qword_100032ED0, type metadata accessor for ActivityType);
}

uint64_t sub_100004E10()
{
  return sub_100004D38(&qword_100032ED8, type metadata accessor for UIContentSizeCategory);
}

uint64_t sub_100004E58()
{
  return sub_100004D38(&qword_100032EE0, type metadata accessor for UIContentSizeCategory);
}

uint64_t sub_100004EA0()
{
  return sub_100004D38(&qword_100032EE8, type metadata accessor for UIContentSizeCategory);
}

uint64_t sub_100004F14()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100004F88()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = *(void *)(*v0 + 80);
  uint64_t v4 = *(void *)(*v0 + 88);
  swift_retain_n();
  swift_bridgeObjectRetain();

  return PrimitiveAppExtensionScene.init<A>(id:content:onConnection:)(v1, v2, sub_1000072A0, v0, sub_1000072A8, v0, v3, v4);
}

uint64_t sub_100005050(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *(void *)(*a1 + 80);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(a1);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v13 - v8;
  (*(void (**)(void))(v7 + 32))();
  uint64_t v10 = *(void *)(v1 + 88);
  sub_100017C4C(v6, v2, v10);
  uint64_t v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  sub_100017C4C(v9, v2, v10);
  return ((uint64_t (*)(char *, uint64_t))v11)(v9, v2);
}

uint64_t sub_1000051AC(void *a1, uint64_t a2)
{
  os_log_type_t v4 = sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_100035F00;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v4))
  {
    id v6 = a1;
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109376;
    [v6 processIdentifier];
    sub_10001F9E8();
    *(_WORD *)(v7 + 8) = 1024;
    unsigned int v29 = [v6 effectiveUserIdentifier];
    sub_10001F9E8();

    _os_log_impl((void *)&_mh_execute_header, v5, v4, "EKEventScene Starting: Setting up XPC connection. processIdentifier: %d. userIdentifier: %u.", (uint8_t *)v7, 0xEu);
    swift_slowDealloc();
  }
  uint64_t v8 = (void *)sub_10001F3E8();
  [a1 setExportedInterface:v8];

  uint64_t v9 = (void *)sub_10001F3D8();
  [a1 setRemoteObjectInterface:v9];

  [a1 setExportedObject:a2];
  [a1 auditToken];
  unsigned int v10 = v29;
  int v11 = v30;
  int v12 = v31;
  int v13 = v32;
  int v14 = v33;
  int v15 = v34;
  uint64_t v28 = a2;
  int v17 = v35;
  int v16 = v36;
  id v18 = objc_allocWithZone((Class)ClientIdentity);
  unsigned int v29 = v10;
  int v30 = v11;
  int v31 = v12;
  int v32 = v13;
  int v33 = v14;
  int v34 = v15;
  int v35 = v17;
  int v36 = v16;
  id v19 = [v18 initWithAuditToken:&v29];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = self;
    unsigned int v29 = v10;
    int v30 = v11;
    int v31 = v12;
    int v32 = v13;
    int v33 = v14;
    int v34 = v15;
    int v35 = v17;
    int v36 = v16;
    id v22 = [v21 authorizationStatusWithAuditToken:&v29 entityType:0];
    uint64_t v23 = *(void *)(v28 + 72);
    v24 = *(void **)(v23 + 32);
    *(void *)(v23 + 24) = v22;
    *(void *)(v23 + 32) = v20;
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
    *(void *)(*(void *)(v28 + 72) + 24) = 1;
  }
  v25 = *(void **)(v28 + 48);
  *(void *)(v28 + 48) = a1;
  id v26 = a1;

  [v26 resume];
  return 1;
}

void sub_100005478(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5, uint64_t a6, unint64_t a7)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  int v11 = qword_100035F00;
  sub_10001F588();
  os_log_type_t v12 = sub_10001F918();
  if (os_log_type_enabled(v11, v12))
  {
    int v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int v13 = 134217984;
    uint64_t v37 = a2;
    sub_10001F9E8();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "EKUIRemoteUIExtension: layoutDirectionValue: %ld", v13, 0xCu);
    swift_slowDealloc();
  }
  int v14 = self;
  id v15 = [v14 shared];
  [v15 setLayoutDirectionOverride:a2];

  NSString v16 = sub_10001F7F8();
  os_log_type_t v17 = sub_10001F918();
  id v18 = qword_100035F00;
  os_log_type_t v19 = v17;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v17))
  {
    swift_bridgeObjectRetain_n();
    id v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)id v20 = 136315138;
    swift_bridgeObjectRetain();
    sub_10001D408(a3, a4, &v37);
    sub_10001F9E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "EKUIRemoteUIExtension: sizeCategoryValue: %s", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  id v21 = [v14 shared];
  [v21 setPreferredContentSizeCategoryOverride:v16];

  os_log_type_t v22 = sub_10001F918();
  uint64_t v23 = qword_100035F00;
  os_log_type_t v24 = v22;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v22))
  {
    id v25 = a1;
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 134218240;
    objc_msgSend(v25, "ekui_size");
    uint64_t v37 = v27;
    sub_10001F9E8();
    *(_WORD *)(v26 + 12) = 2048;
    objc_msgSend(v25, "ekui_size");
    uint64_t v37 = v28;
    sub_10001F9E8();

    _os_log_impl((void *)&_mh_execute_header, v23, v24, "EKUIRemoteUIExtension: viewHierarchy size: (%f, %f)", (uint8_t *)v26, 0x16u);
    swift_slowDealloc();
  }
  id v29 = [v14 shared];
  [v29 setViewHierarchyOverride:a1];

  uint64_t v30 = *(void *)(v36 + 72);
  int v31 = *(void **)(v30 + 32);
  if (!v31)
  {
    sub_10001F908();
    sub_10001F588();
    if (*(void *)(v30 + 32)) {
      goto LABEL_11;
    }
LABEL_13:
    sub_10001F908();
    sub_10001F588();
    goto LABEL_14;
  }
  id v32 = v31;
  sub_10000EB18(v32, a5, a6, a7);

  if (!*(void *)(v30 + 32)) {
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(*(id *)(v30 + 16), "setRemoteClientIdentity:");
LABEL_14:
}

uint64_t sub_100005930(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, unsigned int a6, unint64_t a7)
{
  uint64_t v11 = sub_10001F828();
  unint64_t v13 = v12;
  if (a7)
  {
    uint64_t v14 = sub_10001F828();
    a7 = v15;
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v16 = a3;
  swift_retain();
  sub_100005478(v16, a4, v11, v13, a6, v14, a7);

  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000059FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  uint64_t v8 = *v4;
  uint64_t v9 = sub_10001F728();
  uint64_t v32 = *(void *)(v9 - 8);
  uint64_t v33 = v9;
  __chkstk_darwin(v9);
  uint64_t v27 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10001F748();
  uint64_t v30 = *(void *)(v11 - 8);
  uint64_t v31 = v11;
  __chkstk_darwin(v11);
  unint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10001F4E8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  __chkstk_darwin(v14);
  os_log_type_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  sub_1000072B0(0, (unint64_t *)&qword_100033640);
  uint64_t v26 = sub_10001F948();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v14);
  unint64_t v18 = (*(unsigned __int8 *)(v15 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  os_log_type_t v19 = (char *)swift_allocObject();
  *((void *)v19 + 2) = *(void *)(v8 + 80);
  *((void *)v19 + 3) = *(void *)(v8 + 88);
  *((void *)v19 + 4) = v5;
  *((void *)v19 + 5) = a1;
  uint64_t v20 = v29;
  *((void *)v19 + 6) = v28;
  *((void *)v19 + 7) = v20;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v19[v18], v17, v14);
  aBlock[4] = sub_100007168;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = &unk_10002D278;
  id v21 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100006FCC();
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  os_log_type_t v22 = v27;
  uint64_t v23 = v33;
  sub_10001FA18();
  os_log_type_t v24 = (void *)v26;
  sub_10001F968();
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v13, v31);
}

uint64_t sub_100005E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_10000468C(&qword_1000335F0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  unint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v16 = *(void **)(a1 + 72);
  v16[8] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16[9] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16[10] = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_10001F4E8();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v15, a5, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  sub_1000071D0((uint64_t)v15, (uint64_t)v13);
  uint64_t v19 = (uint64_t)v16 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventOccurrenceDate;
  swift_beginAccess();
  sub_100007238((uint64_t)v13, v19);
  uint64_t result = swift_endAccess();
  id v21 = (void (*)(void *))v16[6];
  if (v21)
  {
    swift_retain();
    v21(v16);
    return sub_1000047A0((uint64_t)v21);
  }
  return result;
}

uint64_t sub_100006014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v14[1] = a6;
  uint64_t v6 = sub_10001F4E8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10001F7E8();
  sub_1000072B0(0, &qword_100032FF0);
  sub_10000468C(&qword_100033630);
  sub_1000072EC();
  uint64_t v11 = sub_10001F7E8();
  uint64_t v12 = sub_10001F7E8();
  sub_10001F4D8();
  swift_retain();
  sub_1000059FC(v10, v11, v12, (uint64_t)v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1000061D0(char a1)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  uint64_t result = sub_10001F588();
  *(unsigned char *)(*(void *)(v1 + 72) + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_hasInProcessNavBar) = a1 & 1;
  return result;
}

uint64_t sub_100006278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006DE8(a1, a2, a3, (void (*)(uint64_t))sub_1000061D0);
}

uint64_t sub_100006290(uint64_t a1)
{
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  return sub_100012588(a1);
}

uint64_t sub_10000632C()
{
  uint64_t v0 = sub_10001F7E8();
  swift_retain();
  sub_100006290(v0);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000063A4()
{
  uint64_t v1 = sub_10001F728();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  os_log_type_t v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001F748();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000072B0(0, (unint64_t *)&qword_100033640);
  uint64_t v9 = (void *)sub_10001F948();
  aBlock[4] = sub_10000707C;
  uint64_t v13 = v0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = &unk_10002D228;
  uint64_t v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100006FCC();
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  sub_10001FA18();
  sub_10001F968();
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10000661C(uint64_t result)
{
  uint64_t v1 = *(void (**)(uint64_t))(*(void *)(result + 72)
                                      + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_navigationDoneButtonTapCallback);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    return sub_1000047A0((uint64_t)v1);
  }
  return result;
}

uint64_t sub_100006688()
{
  swift_retain();
  sub_1000063A4();

  return swift_release();
}

uint64_t sub_1000066C4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v20 = a2;
  uint64_t v8 = sub_10001F728();
  uint64_t v22 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10001F748();
  uint64_t v11 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000072B0(0, (unint64_t *)&qword_100033640);
  uint64_t v14 = (void *)sub_10001F948();
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a1;
  v15[3] = v4;
  v15[4] = v20;
  v15[5] = a3;
  v15[6] = a4;
  aBlock[4] = sub_10000706C;
  void aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = &unk_10002D200;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = a4;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100006FCC();
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  sub_10001FA18();
  sub_10001F968();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v21);
}

uint64_t sub_100006980(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 72)
                                                                 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventEditViewCompletedCallback);
  if (v5)
  {
    uint64_t v9 = result;
    swift_retain();
    v5(v9, a3, a4, a5);
    return sub_1000047A0((uint64_t)v5);
  }
  return result;
}

uint64_t sub_100006A28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = sub_10001F828();
  uint64_t v9 = v8;
  id v10 = a5;
  swift_retain();
  sub_1000066C4(a3, v7, v9, a5);

  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100006AB8(char a1)
{
  uint64_t v3 = sub_10001F728();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10001F748();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000072B0(0, (unint64_t *)&qword_100033640);
  uint64_t v11 = (void *)sub_10001F948();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v1;
  *(unsigned char *)(v12 + 24) = a1;
  aBlock[4] = sub_100006FA8;
  void aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = &unk_10002D1B0;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100006FCC();
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  sub_10001FA18();
  sub_10001F968();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_100006D50(uint64_t result, char a2)
{
  uint64_t v2 = *(void (**)(void))(*(void *)(result + 72)
                                     + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventEditViewPresentedCallback);
  if (v2)
  {
    swift_retain();
    v2(a2 & 1);
    return sub_1000047A0((uint64_t)v2);
  }
  return result;
}

uint64_t sub_100006DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006DE8(a1, a2, a3, (void (*)(uint64_t))sub_100006AB8);
}

uint64_t sub_100006DE8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_retain();
  a4(a3);

  return swift_release();
}

uint64_t sub_100006E40()
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_100006E80()
{
  sub_100006E40();

  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for EKEventScene()
{
  return sub_100004C08();
}

uint64_t sub_100006ECC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006F10()
{
  return sub_100004F88();
}

uint64_t sub_100006F34(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100006F70()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

uint64_t sub_100006FA8()
{
  return sub_100006D50(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_100006FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006FC4()
{
  return swift_release();
}

unint64_t sub_100006FCC()
{
  unint64_t result = qword_100033C10;
  if (!qword_100033C10)
  {
    sub_10001F728();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033C10);
  }
  return result;
}

uint64_t sub_100007024()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000706C()
{
  return sub_100006980(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_10000707C()
{
  return sub_10000661C(v0);
}

uint64_t sub_100007084()
{
  uint64_t v1 = sub_10001F4E8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100007168()
{
  uint64_t v1 = *(void *)(sub_10001F4E8() - 8);
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = (uint64_t)v0 + ((*(unsigned __int8 *)(v1 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_100005E28(v2, v3, v4, v5, v6);
}

uint64_t sub_1000071D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000468C(&qword_1000335F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007238(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000468C(&qword_1000335F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000072A0()
{
  return sub_100005050(v0);
}

uint64_t sub_1000072A8(void *a1)
{
  return sub_1000051AC(a1, v1);
}

uint64_t sub_1000072B0(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1000072EC()
{
  unint64_t result = qword_100033620;
  if (!qword_100033620)
  {
    sub_1000072B0(255, &qword_100032FF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033620);
  }
  return result;
}

void *sub_100007354()
{
  return &protocol witness table for PrimitiveAppExtensionScene;
}

id sub_1000073A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKUIRemotePresentViewData();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void *sub_10000743C()
{
  uint64_t v1 = v0;
  v9[0] = sub_10001F938();
  uint64_t v2 = *(void *)(v9[0] - 8);
  __chkstk_darwin(v9[0]);
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001F928();
  __chkstk_darwin(v5);
  uint64_t v6 = sub_10001F748();
  __chkstk_darwin(v6 - 8);
  v0[2] = [objc_allocWithZone((Class)EKEventStore) init];
  v0[4] = &_swiftEmptyDictionarySingleton;
  sub_1000072B0(0, (unint64_t *)&qword_100033640);
  sub_10001F738();
  v9[1] = &_swiftEmptyArrayStorage;
  sub_10000AC04(&qword_100033178, 255, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000468C(&qword_100033180);
  sub_10000BB40(&qword_100033188, &qword_100033180);
  sub_10001FA18();
  (*(void (**)(char *, void, void))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v9[0]);
  v0[3] = sub_10001F978();
  id v7 = [self defaultCenter];
  [v7 addObserver:v1 selector:"preferredContentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

  return v1;
}

uint64_t (*sub_100007720@<X0>(uint64_t (**a1)@<X0>(uint64_t *a1@<X8>)@<X8>))@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v1 + 16);
  sub_10000468C(&qword_1000331A0);
  uint64_t v5 = (void *)swift_allocObject();
  v5[7] = 0;
  v5[8] = 0;
  v5[6] = 0;
  id v6 = v4;
  swift_retain();
  v5[2] = sub_10001F358();
  v5[3] = v7;
  type metadata accessor for EKEventViewModel();
  swift_allocObject();
  v5[9] = sub_100012498((uint64_t)v6);
  v5[4] = sub_10000B560;
  v5[5] = v2;
  uint64_t v8 = *(void **)(v2 + 16);
  swift_beginAccess();
  uint64_t v9 = *(void *)(v2 + 32);
  sub_10000468C(&qword_1000331A8);
  id v10 = (void *)swift_allocObject();
  v10[6] = 0;
  type metadata accessor for EKEventGenericDetailViewModel();
  swift_allocObject();
  id v11 = v8;
  swift_retain();
  id v12 = v11;
  swift_retain();
  swift_bridgeObjectRetain();
  v10[7] = sub_100019A64(v12, v9, 0, 0, 0, 0, 0, 0);
  uint64_t v13 = sub_10001F468();
  uint64_t v15 = v14;

  v10[2] = v13;
  v10[3] = v15;
  v10[4] = sub_10000B568;
  v10[5] = v2;
  uint64_t v16 = *(void **)(v2 + 16);
  sub_10000468C(&qword_1000331B0);
  id v17 = (void *)swift_allocObject();
  swift_retain();
  swift_retain();
  id v18 = v16;
  v17[2] = sub_10001F388();
  v17[3] = v19;
  v17[6] = 0;
  type metadata accessor for EKEventEditViewModel();
  swift_allocObject();
  v17[7] = sub_10000BC28((uint64_t)v18);
  v17[4] = sub_10000B570;
  v17[5] = v2;
  uint64_t v20 = *(void **)(v2 + 16);
  sub_10000468C(&qword_1000331B8);
  uint64_t v21 = (void *)swift_allocObject();
  swift_retain();
  swift_retain();
  id v22 = v20;
  v21[2] = sub_10001F458();
  v21[3] = v23;
  v21[6] = 0;
  type metadata accessor for EKCalendarChooserViewModel();
  swift_allocObject();
  v21[7] = sub_10000EF64((uint64_t)v22);
  v21[4] = sub_10000B578;
  v21[5] = v2;
  swift_release();
  swift_release();
  swift_release();
  unint64_t result = (uint64_t (*)@<X0>(uint64_t *@<X8>))swift_allocObject();
  *((void *)result + 2) = v5;
  *((void *)result + 3) = v10;
  *((void *)result + 4) = v17;
  *((void *)result + 5) = v21;
  *a1 = sub_10000B5D0;
  a1[1] = result;
  return result;
}

uint64_t sub_1000079F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  type metadata accessor for EKEventViewModel();
  sub_10000AC04(&qword_100033220, 255, (void (*)(uint64_t))type metadata accessor for EKEventViewModel);
  swift_retain();
  uint64_t v6 = sub_10001F5F8();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a1;
  swift_retain_n();
  swift_retain();
  unsigned __int8 v10 = sub_10001F6B8();
  unsigned __int8 v11 = sub_10001F6C8();
  unsigned __int8 v12 = sub_10001F6E8();
  char v13 = sub_10001F6D8();
  sub_10001F6D8();
  if (sub_10001F6D8() != v10) {
    char v13 = sub_10001F6D8();
  }
  sub_10001F6D8();
  if (sub_10001F6D8() != v11) {
    char v13 = sub_10001F6D8();
  }
  sub_10001F6D8();
  if (sub_10001F6D8() != v12) {
    char v13 = sub_10001F6D8();
  }
  uint64_t result = sub_10001F608();
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v8;
  *(void *)(a3 + 16) = sub_10000B740;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = sub_10000B710;
  *(void *)(a3 + 40) = v9;
  *(void *)(a3 + 48) = sub_10000B738;
  *(void *)(a3 + 56) = a1;
  *(void *)(a3 + 64) = result;
  *(unsigned char *)(a3 + 72) = v13;
  return result;
}

void sub_100007BBC(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v47 = a7;
  uint64_t v48 = a8;
  uint64_t v45 = a5;
  uint64_t v46 = a6;
  uint64_t v49 = a10;
  uint64_t v50 = a1;
  uint64_t v13 = sub_10001F518();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v17 = sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  id v18 = qword_100035F00;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v17))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v19 = swift_slowAlloc();
    v44 = a4;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v42 = v13;
    v52[0] = v21;
    v43 = a3;
    *(_DWORD *)uint64_t v20 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_10001D408(v50, a2, v52);
    a3 = v43;
    sub_10001F9E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v18, v17, "EKEventViewScene onRequestPresentView: User tapped on child item: %s", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v13 = v42;
    swift_slowDealloc();
    a4 = v44;
    swift_slowDealloc();
  }
  sub_10001F508();
  uint64_t v22 = sub_10001F4F8();
  uint64_t v24 = v23;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  id v25 = (objc_class *)type metadata accessor for EKUIRemotePresentViewData();
  uint64_t v26 = (char *)objc_allocWithZone(v25);
  uint64_t v27 = &v26[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_viewName];
  *(void *)uint64_t v27 = v50;
  *((void *)v27 + 1) = a2;
  *(void *)&v26[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_viewController] = a3;
  *(void *)&v26[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_event] = a4;
  v53.receiver = v26;
  v53.super_class = v25;
  swift_bridgeObjectRetain();
  id v28 = a3;
  id v29 = a4;
  id v30 = objc_msgSendSuper2(&v53, "init");
  uint64_t v31 = *(void **)(a9 + 24);
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = swift_weakInit();
  __chkstk_darwin(v33);
  *(&v41 - 4) = v32;
  *(&v41 - 3) = v22;
  *(&v41 - 2) = v24;
  *(&v41 - 1) = (uint64_t)v30;
  id v34 = v31;
  sub_10000468C(&qword_100033200);
  sub_10001F958();

  swift_release();
  int v35 = *(void **)(v49 + 48);
  if (v35)
  {
    id v36 = v35;
    id v37 = [v36 remoteObjectProxy];
    sub_10001FA08();
    swift_unknownObjectRelease();
    sub_10000468C(qword_100033228);
    if (swift_dynamicCast())
    {
      v38 = (void *)v51;
      NSString v39 = sub_10001F7F8();
      NSString v40 = sub_10001F7F8();
      swift_bridgeObjectRelease();
      [v38 requestPresentViewWithName:v39 viewID:v40 presentationStyle:v45 sourceRect:v46 preferredContentSize:v47 oopContentBackgroundColor:v48];

      swift_unknownObjectRelease();
      id v30 = v40;
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_10001F908();
      sub_10001F588();

      id v30 = v36;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_10001F908();
    sub_10001F588();
  }
}

void sub_100008070(uint64_t a1, NSString a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v8 = sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_100035F00;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v8))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v16 = a4;
    unsigned __int8 v10 = (uint8_t *)swift_slowAlloc();
    v18[0] = swift_slowAlloc();
    *(_DWORD *)unsigned __int8 v10 = 136315138;
    if (a2) {
      uint64_t v11 = a1;
    }
    else {
      uint64_t v11 = 7104878;
    }
    if (a2) {
      unint64_t v12 = (unint64_t)a2;
    }
    else {
      unint64_t v12 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    id v17 = (id)sub_10001D408(v11, v12, v18);
    sub_10001F9E8();
    swift_bridgeObjectRelease_n();
    a4 = v16;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "EKEventViewScene onRequestDismissView. viewName: %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  uint64_t v13 = *(void **)(a4 + 48);
  if (v13)
  {
    id v14 = v13;
    id v15 = [v14 remoteObjectProxy];
    sub_10001FA08();
    swift_unknownObjectRelease();
    sub_10000468C(qword_100033228);
    if (swift_dynamicCast())
    {
      if (a2) {
        a2 = sub_10001F7F8();
      }
      [v17 requestDismissViewWithName:a2 presentationStyle:a3];

      swift_unknownObjectRelease();
    }
    else
    {
      sub_10001F908();
      sub_10001F588();
    }
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
  }
}

void sub_100008340(uint64_t a1, uint64_t a2)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  uint64_t v4 = *(void **)(a2 + 48);
  if (v4)
  {
    id v5 = v4;
    id v6 = [v5 remoteObjectProxy];
    sub_10001FA08();
    swift_unknownObjectRelease();
    sub_10000468C(qword_100033228);
    if (swift_dynamicCast())
    {
      [v7 didCompleteWithAction:a1];

      swift_unknownObjectRelease();
    }
    else
    {
      sub_10001F908();
      sub_10001F588();
    }
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
  }
}

uint64_t sub_1000084F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  type metadata accessor for EKEventGenericDetailViewModel();
  sub_10000AC04(&qword_100034770, 255, (void (*)(uint64_t))type metadata accessor for EKEventGenericDetailViewModel);
  swift_retain();
  uint64_t v6 = sub_10001F5F8();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  swift_retain_n();
  swift_retain_n();
  unsigned __int8 v11 = sub_10001F6B8();
  unsigned __int8 v12 = sub_10001F6C8();
  unsigned __int8 v13 = sub_10001F6E8();
  char v14 = sub_10001F6D8();
  sub_10001F6D8();
  if (sub_10001F6D8() != v11) {
    char v14 = sub_10001F6D8();
  }
  sub_10001F6D8();
  if (sub_10001F6D8() != v12) {
    char v14 = sub_10001F6D8();
  }
  sub_10001F6D8();
  if (sub_10001F6D8() != v13) {
    char v14 = sub_10001F6D8();
  }
  uint64_t result = sub_10001F608();
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v8;
  *(void *)(a3 + 16) = sub_10000B6A0;
  *(void *)(a3 + 24) = v9;
  *(void *)(a3 + 32) = sub_10000B6A8;
  *(void *)(a3 + 40) = a1;
  *(void *)(a3 + 48) = sub_10000B6B0;
  *(void *)(a3 + 56) = a1;
  *(void *)(a3 + 64) = sub_10000B6B8;
  *(void *)(a3 + 72) = a1;
  *(void *)(a3 + 80) = sub_10000B6C4;
  *(void *)(a3 + 88) = v10;
  *(void *)(a3 + 96) = 0;
  *(void *)(a3 + 104) = 0;
  *(void *)(a3 + 112) = result;
  *(unsigned char *)(a3 + 120) = v14;
  return result;
}

void sub_100008708(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v42 = a5;
  uint64_t v43 = a7;
  uint64_t v44 = a1;
  uint64_t v11 = sub_10001F518();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  char v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v15 = sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_100035F00;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v15))
  {
    swift_bridgeObjectRetain_n();
    NSString v39 = a3;
    uint64_t v17 = swift_slowAlloc();
    NSString v40 = a4;
    id v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v41 = a6;
    v46[0] = v19;
    *(_DWORD *)id v18 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_10001D408(v44, a2, v46);
    a3 = v39;
    sub_10001F9E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v16, v15, "EKEventGenericDetailScene onRequestPresentView: onRequestPresentView: %s", v18, 0xCu);
    swift_arrayDestroy();
    a6 = v41;
    swift_slowDealloc();
    a4 = v40;
    swift_slowDealloc();
  }
  sub_10001F508();
  uint64_t v20 = sub_10001F4F8();
  uint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v23 = (objc_class *)type metadata accessor for EKUIRemotePresentViewData();
  uint64_t v24 = (char *)objc_allocWithZone(v23);
  id v25 = &v24[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_viewName];
  *(void *)id v25 = v44;
  *((void *)v25 + 1) = a2;
  *(void *)&v24[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_viewController] = a3;
  *(void *)&v24[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_event] = a4;
  v47.receiver = v24;
  v47.super_class = v23;
  swift_bridgeObjectRetain();
  id v26 = a3;
  id v27 = a4;
  id v28 = objc_msgSendSuper2(&v47, "init");
  id v29 = *(void **)(a6 + 24);
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = swift_weakInit();
  __chkstk_darwin(v31);
  *(&v39 - 4) = (void *)v30;
  *(&v39 - 3) = (void *)v20;
  *(&v39 - 2) = v22;
  *(&v39 - 1) = v28;
  id v32 = v29;
  sub_10000468C(&qword_100033200);
  sub_10001F958();

  swift_release();
  uint64_t v33 = *(void **)(v43 + 48);
  if (v33)
  {
    id v34 = v33;
    id v35 = [v34 remoteObjectProxy];
    sub_10001FA08();
    swift_unknownObjectRelease();
    sub_10000468C(&qword_100033218);
    if (swift_dynamicCast())
    {
      id v36 = (void *)v45;
      NSString v37 = sub_10001F7F8();
      NSString v38 = sub_10001F7F8();
      swift_bridgeObjectRelease();
      [v36 requestPresentViewWithName:v37 viewID:v38 presentationStyle:v42];

      swift_unknownObjectRelease();
      id v28 = v38;
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_10001F908();
      sub_10001F588();

      id v28 = v34;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_10001F908();
    sub_10001F588();
  }
}

void sub_100008BAC(uint64_t a1, NSString a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v8 = sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_100035F00;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v8))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v16 = a4;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    v18[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    if (a2) {
      uint64_t v11 = a1;
    }
    else {
      uint64_t v11 = 7104878;
    }
    if (a2) {
      unint64_t v12 = (unint64_t)a2;
    }
    else {
      unint64_t v12 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    id v17 = (id)sub_10001D408(v11, v12, v18);
    sub_10001F9E8();
    swift_bridgeObjectRelease_n();
    a4 = v16;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "EKEventGenericDetailScene onRequestDismissView. viewName:%s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  uint64_t v13 = *(void **)(a4 + 48);
  if (v13)
  {
    id v14 = v13;
    id v15 = [v14 remoteObjectProxy];
    sub_10001FA08();
    swift_unknownObjectRelease();
    sub_10000468C(&qword_100033218);
    if (swift_dynamicCast())
    {
      if (a2) {
        a2 = sub_10001F7F8();
      }
      [v17 requestDismissViewWithName:a2 presentationStyle:a3];

      swift_unknownObjectRelease();
    }
    else
    {
      sub_10001F908();
      sub_10001F588();
    }
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
  }
}

void sub_100008E7C(Class isa, Class a2, uint64_t a3)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  uint64_t v6 = *(void **)(a3 + 48);
  if (v6)
  {
    id v7 = v6;
    id v8 = [v7 remoteObjectProxy];
    sub_10001FA08();
    swift_unknownObjectRelease();
    sub_10000468C(&qword_100033218);
    if (swift_dynamicCast())
    {
      if (isa) {
        isa = sub_10001F878().super.isa;
      }
      if (a2) {
        a2 = sub_10001F878().super.isa;
      }
      [v9 didChangeNavigationBarButtonsWithLeftBarButtonIDs:isa rightBarButtonIDs:a2];

      swift_unknownObjectRelease();
    }
    else
    {
      sub_10001F908();
      sub_10001F588();
    }
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
  }
}

void sub_100009074(Class isa, uint64_t a2)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  uint64_t v4 = *(void **)(a2 + 48);
  if (v4)
  {
    id v5 = v4;
    id v6 = [v5 remoteObjectProxy];
    sub_10001FA08();
    swift_unknownObjectRelease();
    sub_10000468C(&qword_100033218);
    if (swift_dynamicCast())
    {
      if (isa)
      {
        sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
        isa = sub_10001F878().super.isa;
      }
      [v7 didChangeBottomStatusButtonsWithBottomStatusButtonActions:isa];

      swift_unknownObjectRelease();
    }
    else
    {
      sub_10001F908();
      sub_10001F588();
    }
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
  }
}

void sub_10000925C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  type metadata accessor for EKEventGenericDetailViewModel();
  sub_10000AC04(&qword_100034770, 255, (void (*)(uint64_t))type metadata accessor for EKEventGenericDetailViewModel);
  sub_10001F598();
  sub_10001F5A8();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 24);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_10000AC4C(v3, v2);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100009348@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  type metadata accessor for EKEventEditViewModel();
  sub_10000AC04((unint64_t *)&unk_100033660, 255, (void (*)(uint64_t))type metadata accessor for EKEventEditViewModel);
  swift_retain();
  uint64_t v6 = sub_10001F5F8();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a1;
  swift_retain_n();
  swift_retain();
  unsigned __int8 v10 = sub_10001F6B8();
  unsigned __int8 v11 = sub_10001F6C8();
  unsigned __int8 v12 = sub_10001F6E8();
  char v13 = sub_10001F6D8();
  sub_10001F6D8();
  if (sub_10001F6D8() != v10) {
    char v13 = sub_10001F6D8();
  }
  sub_10001F6D8();
  if (sub_10001F6D8() != v11) {
    char v13 = sub_10001F6D8();
  }
  sub_10001F6D8();
  if (sub_10001F6D8() != v12) {
    char v13 = sub_10001F6D8();
  }
  uint64_t result = sub_10001F608();
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v8;
  *(void *)(a3 + 16) = sub_10000B658;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = sub_10000B650;
  *(void *)(a3 + 40) = v9;
  *(void *)(a3 + 48) = result;
  *(unsigned char *)(a3 + 56) = v13;
  return result;
}

void sub_1000094F8(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v42 = a5;
  uint64_t v43 = a7;
  uint64_t v44 = a1;
  uint64_t v11 = sub_10001F518();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v15 = sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_100035F00;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v15))
  {
    swift_bridgeObjectRetain_n();
    NSString v39 = a3;
    uint64_t v17 = swift_slowAlloc();
    NSString v40 = a4;
    id v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v41 = a6;
    v46[0] = v19;
    *(_DWORD *)id v18 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_10001D408(v44, a2, v46);
    a3 = v39;
    sub_10001F9E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v16, v15, "EKEventEditScene onRequestPresentView: User tapped on child item: %s", v18, 0xCu);
    swift_arrayDestroy();
    a6 = v41;
    swift_slowDealloc();
    a4 = v40;
    swift_slowDealloc();
  }
  sub_10001F508();
  uint64_t v20 = sub_10001F4F8();
  uint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v23 = (objc_class *)type metadata accessor for EKUIRemotePresentViewData();
  uint64_t v24 = (char *)objc_allocWithZone(v23);
  id v25 = &v24[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_viewName];
  *(void *)id v25 = v44;
  *((void *)v25 + 1) = a2;
  *(void *)&v24[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_viewController] = a3;
  *(void *)&v24[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_event] = a4;
  v47.receiver = v24;
  v47.super_class = v23;
  swift_bridgeObjectRetain();
  id v26 = a3;
  id v27 = a4;
  id v28 = objc_msgSendSuper2(&v47, "init");
  id v29 = *(void **)(a6 + 24);
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = swift_weakInit();
  __chkstk_darwin(v31);
  *(&v39 - 4) = (void *)v30;
  *(&v39 - 3) = (void *)v20;
  *(&v39 - 2) = v22;
  *(&v39 - 1) = v28;
  id v32 = v29;
  sub_10000468C(&qword_100033200);
  sub_10001F958();

  swift_release();
  uint64_t v33 = *(void **)(v43 + 48);
  if (v33)
  {
    id v34 = v33;
    id v35 = [v34 remoteObjectProxy];
    sub_10001FA08();
    swift_unknownObjectRelease();
    sub_10000468C(&qword_100033210);
    if (swift_dynamicCast())
    {
      id v36 = (void *)v45;
      NSString v37 = sub_10001F7F8();
      NSString v38 = sub_10001F7F8();
      swift_bridgeObjectRelease();
      [v36 requestPresentViewWithName:v37 viewID:v38 presentationStyle:v42];

      swift_unknownObjectRelease();
      id v28 = v38;
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_10001F908();
      sub_10001F588();

      id v28 = v34;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_10001F908();
    sub_10001F588();
  }
}

void sub_10000999C(uint64_t a1, Class isa, uint64_t a3, Class a4, Class a5, Class a6, uint64_t a7, unint64_t a8, uint64_t a9)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  os_log_type_t v15 = *(void **)(a9 + 48);
  if (v15)
  {
    id v16 = v15;
    id v17 = [v16 remoteObjectProxy];
    sub_10001FA08();
    swift_unknownObjectRelease();
    sub_10000468C(&qword_100033210);
    if (swift_dynamicCast())
    {
      if (isa)
      {
        sub_1000072B0(0, &qword_100032FF0);
        sub_1000072EC();
        isa = sub_10001F7D8().super.isa;
      }
      if (a4) {
        a4 = sub_10001F7D8().super.isa;
      }
      if (a5)
      {
        sub_1000072B0(0, &qword_100032FF0);
        sub_1000072EC();
        a5 = sub_10001F7D8().super.isa;
      }
      if (a6)
      {
        sub_1000072B0(0, &qword_100032FF0);
        sub_1000072EC();
        a6 = sub_10001F7D8().super.isa;
      }
      if (a8 >> 60 == 15) {
        Class v18 = 0;
      }
      else {
        Class v18 = sub_10001F4B8().super.isa;
      }
      [v20 didCompleteWithAction:a1 oldToNewObjectIDMap:isa waitUntilTimestamp:a3 serializedDictionary:a4 objectIDToChangeSetDictionaryMap:a5 objectIDToPersistentDictionaryMap:a6 eventConstraints:v18];

      swift_unknownObjectRelease();
    }
    else
    {
      sub_10001F908();
      sub_10001F588();
    }
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
  }
}

uint64_t sub_100009CB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  type metadata accessor for EKCalendarChooserViewModel();
  sub_10000AC04(&qword_1000331E8, 255, (void (*)(uint64_t))type metadata accessor for EKCalendarChooserViewModel);
  swift_retain();
  uint64_t v6 = sub_10001F5F8();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a1;
  swift_retain_n();
  swift_retain();
  unsigned __int8 v10 = sub_10001F6B8();
  unsigned __int8 v11 = sub_10001F6C8();
  unsigned __int8 v12 = sub_10001F6E8();
  char v13 = sub_10001F6D8();
  sub_10001F6D8();
  if (sub_10001F6D8() != v10) {
    char v13 = sub_10001F6D8();
  }
  sub_10001F6D8();
  if (sub_10001F6D8() != v11) {
    char v13 = sub_10001F6D8();
  }
  sub_10001F6D8();
  if (sub_10001F6D8() != v12) {
    char v13 = sub_10001F6D8();
  }
  uint64_t result = sub_10001F608();
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v8;
  *(void *)(a3 + 16) = sub_10000B60C;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = sub_10000B604;
  *(void *)(a3 + 40) = v9;
  *(void *)(a3 + 48) = result;
  *(unsigned char *)(a3 + 56) = v13;
  return result;
}

void sub_100009E60(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v42 = a5;
  uint64_t v43 = a7;
  uint64_t v44 = a1;
  uint64_t v11 = sub_10001F518();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v15 = sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  id v16 = qword_100035F00;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v15))
  {
    swift_bridgeObjectRetain_n();
    NSString v39 = a3;
    uint64_t v17 = swift_slowAlloc();
    NSString v40 = a4;
    Class v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v41 = a6;
    v46[0] = v19;
    *(_DWORD *)Class v18 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_10001D408(v44, a2, v46);
    a3 = v39;
    sub_10001F9E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v16, v15, "EKCalendarChooserScene onRequestPresentView: User tapped on child item: %s", v18, 0xCu);
    swift_arrayDestroy();
    a6 = v41;
    swift_slowDealloc();
    a4 = v40;
    swift_slowDealloc();
  }
  sub_10001F508();
  uint64_t v20 = sub_10001F4F8();
  uint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v23 = (objc_class *)type metadata accessor for EKUIRemotePresentViewData();
  uint64_t v24 = (char *)objc_allocWithZone(v23);
  id v25 = &v24[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_viewName];
  *(void *)id v25 = v44;
  *((void *)v25 + 1) = a2;
  *(void *)&v24[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_viewController] = a3;
  *(void *)&v24[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_event] = a4;
  v47.receiver = v24;
  v47.super_class = v23;
  swift_bridgeObjectRetain();
  id v26 = a3;
  id v27 = a4;
  id v28 = objc_msgSendSuper2(&v47, "init");
  id v29 = *(void **)(a6 + 24);
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = swift_weakInit();
  __chkstk_darwin(v31);
  *(&v39 - 4) = (void *)v30;
  *(&v39 - 3) = (void *)v20;
  *(&v39 - 2) = v22;
  *(&v39 - 1) = v28;
  id v32 = v29;
  sub_10000468C(&qword_100033200);
  sub_10001F958();

  swift_release();
  uint64_t v33 = *(void **)(v43 + 48);
  if (v33)
  {
    id v34 = v33;
    id v35 = [v34 remoteObjectProxy];
    sub_10001FA08();
    swift_unknownObjectRelease();
    sub_10000468C(&qword_1000331F0);
    if (swift_dynamicCast())
    {
      id v36 = (void *)v45;
      NSString v37 = sub_10001F7F8();
      NSString v38 = sub_10001F7F8();
      swift_bridgeObjectRelease();
      [v36 requestPresentViewWithName:v37 viewID:v38 presentationStyle:v42];

      swift_unknownObjectRelease();
      id v28 = v38;
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_10001F908();
      sub_10001F588();

      id v28 = v34;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_10001F908();
    sub_10001F588();
  }
}

uint64_t sub_10000A304@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X3>, BOOL *a4@<X8>)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  uint64_t v9 = result;
  if (result)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v10 = a3;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *(void *)(v9 + 32);
    *(void *)(v9 + 32) = 0x8000000000000000;
    sub_10000B204((uint64_t)v10, a1, a2, isUniquelyReferenced_nonNull_native);
    *(void *)(v9 + 32) = v12;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t result = swift_release();
  }
  *a4 = v9 == 0;
  return result;
}

void sub_10000A40C(uint64_t a1, char a2, uint64_t a3)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  id v5 = *(void **)(a3 + 48);
  if (v5)
  {
    id v6 = v5;
    id v7 = [v6 remoteObjectProxy];
    sub_10001FA08();
    swift_unknownObjectRelease();
    sub_10000468C(&qword_1000331F0);
    if (swift_dynamicCast())
    {
      sub_1000072B0(0, &qword_1000331F8);
      Class isa = sub_10001F878().super.isa;
      [v9 calendarSelectionChanged:isa allSelected:a2 & 1];

      swift_unknownObjectRelease();
    }
    else
    {
      sub_10001F908();
      sub_10001F588();
    }
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
  }
}

uint64_t sub_10000A6C8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t sub_10000A710()
{
  uint64_t v1 = *v0;
  swift_retain();
  uint64_t v2 = sub_10000468C(&qword_100033190);
  uint64_t v3 = sub_10000BB40(&qword_100033198, &qword_100033190);

  return AppExtensionSceneConfiguration.init<A>(_:)(sub_10000B528, v1, v2, v3);
}

void *sub_10000A7B0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for EKUIRemoteUIExtension();
  uint64_t v2 = swift_allocObject();
  uint64_t result = sub_10000743C();
  *a1 = v2;
  return result;
}

uint64_t sub_10000A7EC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000A814()
{
  return sub_10000A7EC(*v0);
}

uint64_t sub_10000A824()
{
  sub_10000468C(&qword_1000331C0);
  sub_10001F568();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100020C10;
  swift_retain();
  sub_10000468C(&qword_1000331A0);
  sub_10000BB40(&qword_1000331C8, &qword_1000331A0);
  sub_10001F558();
  swift_retain();
  sub_10000468C(&qword_1000331A8);
  sub_10000BB40(&qword_1000331D0, &qword_1000331A8);
  sub_10001F558();
  swift_retain();
  sub_10000468C(&qword_1000331B0);
  sub_10000BB40(&qword_1000331D8, &qword_1000331B0);
  sub_10001F558();
  swift_retain();
  sub_10000468C(&qword_1000331B8);
  sub_10000BB40(&qword_1000331E0, &qword_1000331B8);
  sub_10001F558();
  return v0;
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for EKUIRemoteUIExtension();
  sub_10000AC04(&qword_100032FF8, v3, (void (*)(uint64_t))type metadata accessor for EKUIRemoteUIExtension);
  sub_10001F578();
  return 0;
}

uint64_t type metadata accessor for EKUIRemoteUIExtension()
{
  return self;
}

uint64_t type metadata accessor for EKUIRemotePresentViewData()
{
  return self;
}

uint64_t sub_10000AB44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000AB60(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_10000AC04(&qword_100032FF8, a2, (void (*)(uint64_t))type metadata accessor for EKUIRemoteUIExtension);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10000ABB8()
{
  return sub_10000AC04(&qword_100033170, 255, (void (*)(uint64_t))&type metadata accessor for AppExtensionSceneConfiguration);
}

uint64_t sub_10000AC04(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000AC4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1000142FC(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000B374();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_10000B02C(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10000AD1C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000468C(&qword_100033208);
  char v38 = a2;
  uint64_t v6 = sub_10001FB48();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  id v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    id v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_10001FBB8();
    sub_10001F848();
    uint64_t result = sub_10001FBC8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    Class v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *Class v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_10000B02C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10001FA28();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10001FBB8();
        swift_bridgeObjectRetain();
        sub_10001F848();
        Swift::Int v9 = sub_10001FBC8();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_10000B204(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1000142FC(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10000B374();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_10000AD1C(v15, a4 & 1);
  unint64_t v20 = sub_1000142FC(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_10001FBA8();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

id sub_10000B374()
{
  uint64_t v1 = v0;
  sub_10000468C(&qword_100033208);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001FB38();
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

double sub_10000B528@<D0>(_OWORD *a1@<X8>)
{
  sub_100007720((uint64_t (**)@<X0>(uint64_t *@<X8>))&v3);
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_10000B560@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000079F8(a1, v2, a2);
}

uint64_t sub_10000B568@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000084F8(a1, v2, a2);
}

uint64_t sub_10000B570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100009348(a1, v2, a2);
}

uint64_t sub_10000B578@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100009CB0(a1, v2, a2);
}

uint64_t sub_10000B580()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000B5D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000A824();
  *a1 = result;
  return result;
}

void sub_10000B604(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5)
{
  sub_100009E60(a1, a2, a3, a4, a5, *(void *)(v5 + 16), *(void *)(v5 + 24));
}

void sub_10000B60C(uint64_t a1, char a2)
{
  sub_10000A40C(a1, a2, v2);
}

uint64_t sub_10000B614()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000B650(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5)
{
  sub_1000094F8(a1, a2, a3, a4, a5, *(void *)(v5 + 16), *(void *)(v5 + 24));
}

void sub_10000B658(uint64_t a1, objc_class *a2, uint64_t a3, objc_class *a4, objc_class *a5, objc_class *a6, uint64_t a7, unint64_t a8)
{
  sub_10000999C(a1, a2, a3, a4, a5, a6, a7, a8, v8);
}

uint64_t sub_10000B67C@<X0>(BOOL *a1@<X8>)
{
  return sub_10000A304(*(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), a1);
}

void sub_10000B6A0(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5)
{
  sub_100008708(a1, a2, a3, a4, a5, *(void *)(v5 + 16), *(void *)(v5 + 24));
}

void sub_10000B6A8(uint64_t a1, void *a2, uint64_t a3)
{
  sub_100008BAC(a1, a2, a3, v3);
}

void sub_10000B6B0(objc_class *a1, objc_class *a2)
{
  sub_100008E7C(a1, a2, v2);
}

void sub_10000B6B8(objc_class *a1)
{
  sub_100009074(a1, v1);
}

void sub_10000B6C4()
{
  sub_10000925C(*(void *)(v0 + 16));
}

uint64_t sub_10000B6D0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000B710(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007BBC(a1, a2, a3, a4, a5, a6, a7, a8, *(void *)(v8 + 16), *(void *)(v8 + 24));
}

void sub_10000B738(uint64_t a1, void *a2, uint64_t a3)
{
  sub_100008070(a1, a2, a3, v3);
}

void sub_10000B740(uint64_t a1)
{
  sub_100008340(a1, v1);
}

void sub_10000B748()
{
  sub_10001F828();
  uint64_t v0 = sub_10001F488();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_10:
    sub_10000B88C((uint64_t)&v7);
    return;
  }
  uint64_t v1 = v0;
  sub_10001FAA8();
  if (*(void *)(v1 + 16) && (unint64_t v2 = sub_100014374((uint64_t)v6), (v3 & 1) != 0))
  {
    sub_10000B940(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v7);
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10000B8EC((uint64_t)v6);
  if (!*((void *)&v8 + 1)) {
    goto LABEL_10;
  }
  type metadata accessor for UIContentSizeCategory(0);
  if (swift_dynamicCast())
  {
    uint64_t v4 = (void *)v6[0];
    id v5 = [self shared];
    [v5 setPreferredContentSizeCategoryOverride:v4];
  }
}

uint64_t sub_10000B88C(uint64_t a1)
{
  uint64_t v2 = sub_10000468C((uint64_t *)&unk_100033610);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B8EC(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000B940(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for EKUIRemoteUIAppExtensionSceneBuilder()
{
  return &type metadata for EKUIRemoteUIAppExtensionSceneBuilder;
}

uint64_t sub_10000B9AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

void *sub_10000B9B4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_10000B9E4()
{
  return swift_release();
}

void *sub_10000B9EC(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 sub_10000BA28(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *sub_10000BA34(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_10000BA68(uint64_t *a1, int a2)
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

uint64_t sub_10000BAB0(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for EKUIRemoteUIAppExtensionSceneBuilder._EKUIRemoteUIAppExtensionScene()
{
  return sub_100004C08();
}

uint64_t sub_10000BB04()
{
  return sub_10000BB40((unint64_t *)&unk_1000332B0, &qword_100033190);
}

uint64_t sub_10000BB40(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000472C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000BB84(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10000BBC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000BC04(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_10000BC0C@<X0>(BOOL *a1@<X8>)
{
  return sub_10000B67C(a1);
}

uint64_t sub_10000BC28(uint64_t a1)
{
  *(unsigned char *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = 0;
  *(void *)(v1 + 40) = 0;
  *(unsigned char *)(v1 + 48) = 0;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 72) = 0u;
  *(_OWORD *)(v1 + 88) = 0u;
  uint64_t v3 = v1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_eventOccurrenceDate;
  uint64_t v4 = sub_10001F4E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(void *)(v1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_hostTempToRemoteTempObjectIDMap) = &_swiftEmptyDictionarySingleton;
  *(void *)(v1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_changedViewConfigurationDictionary) = &_swiftEmptyDictionarySingleton;
  id v5 = (void *)(v1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_getHasUnsavedChangesAction);
  *id v5 = 0;
  v5[1] = 0;
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_10000BCF0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10001F728();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  long long v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10001F748();
  uint64_t v8 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  *(void *)(v2 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_changedViewConfigurationDictionary) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1000072B0(0, (unint64_t *)&qword_100033640);
  uint64_t v11 = (void *)sub_10001F948();
  aBlock[4] = sub_10000EAB0;
  void aBlock[5] = v2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = &unk_10002D4F0;
  unint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000EAD0((unint64_t *)&qword_100033C10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  sub_10001FA18();
  sub_10001F968();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v15);
}

uint64_t sub_10000C020()
{
  type metadata accessor for EKEventEditViewModel();
  sub_10000EAD0((unint64_t *)&unk_100033660, (void (*)(uint64_t))type metadata accessor for EKEventEditViewModel);
  sub_10001F598();
  sub_10001F5A8();

  return swift_release();
}

uint64_t sub_10000C0A8()
{
  sub_1000047A0(*(void *)(v0 + 56));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000E9D0(v0 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_eventOccurrenceDate, &qword_1000335F0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000047A0(*(void *)(v0
                          + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_getHasUnsavedChangesAction));
  return v0;
}

uint64_t sub_10000C144()
{
  sub_10000C0A8();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10000C19C()
{
  return type metadata accessor for EKEventEditViewModel();
}

uint64_t type metadata accessor for EKEventEditViewModel()
{
  uint64_t result = qword_1000332E8;
  if (!qword_1000332E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000C1F0()
{
  sub_10000C2D0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000C2D0()
{
  if (!qword_100033CF0)
  {
    sub_10001F4E8();
    unint64_t v0 = sub_10001F9D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100033CF0);
    }
  }
}

uint64_t sub_10000C328@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for EKEventEditViewModel();
  uint64_t result = sub_10001F598();
  *a1 = result;
  return result;
}

void sub_10000C36C(void *a1, uint64_t a2)
{
  uint64_t v3 = v2 + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension15EKEventEditView24EventEditViewCoordinator_eventEditView;
  uint64_t v4 = *(void (**)(uint64_t, void *, id, uint64_t, void *, uint64_t, uint64_t, unint64_t))(v2 + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension15EKEventEditView24EventEditViewCoordinator_eventEditView + 16);
  if (v4)
  {
    swift_retain();
    os_log_type_t v7 = sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    uint64_t v8 = qword_100035F00;
    if (os_log_type_enabled((os_log_t)qword_100035F00, v7))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 134217984;
      v70[0] = a2;
      sub_10001F9E8();
      _os_log_impl((void *)&_mh_execute_header, v8, v7, "EventEditViewCoordinator: onComplete called. action: %ld", v9, 0xCu);
      swift_slowDealloc();
    }
    id v10 = [a1 event];
    if (!v10)
    {
      sub_10001F908();
      sub_10001F588();
LABEL_66:
      sub_1000047A0((uint64_t)v4);
      return;
    }
    uint64_t v11 = v10;
    id v12 = [v10 eventStore];
    if (v12)
    {
      int64_t v13 = v12;
      id v14 = [v12 lastDatabaseTimestampForOOPToWaitOn];

      if (a2 != 1)
      {
        if (a2 == 2)
        {
          uint64_t v15 = 2;
          id v16 = v14;
        }
        else
        {
          uint64_t v15 = a2;
          id v16 = 0;
        }
        v4(v15, 0, v16, 0, 0, 0, 0, 0xF000000000000000);
        goto LABEL_65;
      }
      id v67 = v14;
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      uint64_t v17 = *(void *)(v3 + 8);
      Class isa = sub_10001F998(*(void *)(v17 + 32)).super.super.isa;
      Class v19 = sub_10001F988(*(unsigned char *)(v17 + 24)).super.super.isa;
      sub_10000468C(&qword_100033600);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100020E10;
      *(void *)(inited + 32) = 0x7461745368747561;
      *(void *)(inited + 40) = 0xEA00000000007375;
      *(void *)(inited + 48) = isa;
      *(void *)(inited + 56) = 0x65764577654E7369;
      *(void *)(inited + 64) = 0xEA0000000000746ELL;
      *(void *)(inited + 72) = v19;
      v66 = isa;
      v65 = v19;
      sub_10000CE08(inited);
      id v21 = [v11 eventStore];
      if (v21)
      {
        int64_t v22 = v21;
        NSString v23 = sub_10001F7F8();
        sub_1000072B0(0, &qword_100033608);
        Class v24 = sub_10001F7D8().super.isa;
        swift_bridgeObjectRelease();
        [v22 analyticsSendEvent:v23 appendingClientBundleIDToPayload:v24];

        uint64_t v25 = *(void *)(v17 + 32);
        id v26 = [v11 calendar];
        if (v26)
        {
          BOOL v27 = v26;
          id v28 = [v26 source];

          if (v28)
          {
            unsigned __int8 v63 = [v28 isReadable];

            uint64_t v62 = *(void *)(v17 + 32);
            id v29 = [v11 calendar];
            if (v29)
            {
              uint64_t v30 = v29;
              id v31 = [v29 source];

              if (v31)
              {
                unsigned __int8 v32 = [v31 isReadable];

                if (v32)
                {
                  if (v25 != 3)
                  {
                    if (v62 != 4)
                    {
LABEL_45:
                      sub_10001F918();
                      sub_10001F588();
                      id v14 = v67;
                      v4(1, &_swiftEmptyDictionarySingleton, v67, 0, 0, 0, 0, 0xF000000000000000);
LABEL_48:

LABEL_65:
                      [*(id *)(*(void *)(v3 + 8) + 16) stopRecordingObjectIDChangeMap];

                      goto LABEL_66;
                    }
LABEL_38:
                    sub_10001F918();
                    sub_10001F588();
                    swift_bridgeObjectRetain();
                    id v42 = [v11 eventStore];
                    if (v42)
                    {
                      uint64_t v43 = v42;
                      id v44 = [v42 lastCommitTempToPermanentObjectIDMap];

                      if (v44)
                      {
                        sub_1000072B0(0, &qword_100032FF0);
                        sub_1000072EC();
                        sub_10001F7E8();

                        sub_10001F378();
                        uint64_t v45 = (void *)sub_10001F368();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                      }
                      else
                      {
                        swift_bridgeObjectRelease();
                        sub_10001F908();
                        sub_10001F588();
                        uint64_t v45 = &_swiftEmptyDictionarySingleton;
                      }
                      if ([a1 precommitSerializedEvent])
                      {
                        sub_10001FA08();
                        swift_unknownObjectRelease();
                      }
                      else
                      {
                        memset(v69, 0, sizeof(v69));
                      }
                      sub_10000E968((uint64_t)v69, (uint64_t)v70);
                      if (v70[3])
                      {
                        sub_10001F7A8();
                        if (swift_dynamicCast()) {
                          objc_super v47 = v68;
                        }
                        else {
                          objc_super v47 = 0;
                        }
                      }
                      else
                      {
                        sub_10000E9D0((uint64_t)v70, (uint64_t *)&unk_100033610);
                        objc_super v47 = 0;
                      }
                      id v48 = [v11 constraints];
                      if (v48)
                      {
                        uint64_t v49 = v48;
                        id v50 = [v48 serialized];

                        if (v50)
                        {
                          uint64_t v51 = sub_10001F4C8();
                          unint64_t v60 = v52;
                          uint64_t v61 = v51;

                          v64 = v47;
                          if (v47)
                          {
LABEL_61:
                            id v53 = v47;
                            uint64_t v54 = sub_10001F778();

                            id v55 = v53;
                            uint64_t v56 = sub_10001F788();

                            objc_super v47 = (void *)sub_10000CF24(v56);
                            swift_bridgeObjectRelease();
                            id v57 = v55;
                            uint64_t v58 = sub_10001F798();

                            uint64_t v59 = sub_10000CF24(v58);
                            swift_bridgeObjectRelease();
LABEL_64:
                            v4(1, v45, v67, v54, v47, v59, v61, v60);
                            swift_bridgeObjectRelease();

                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            sub_10000EA2C(v61, v60);

                            id v14 = v67;
                            goto LABEL_65;
                          }
                        }
                        else
                        {
                          unint64_t v60 = 0xF000000000000000;
                          uint64_t v61 = 0;
                          v64 = v47;
                          if (v47) {
                            goto LABEL_61;
                          }
                        }
                        uint64_t v59 = 0;
                        uint64_t v54 = 0;
                        goto LABEL_64;
                      }
                      goto LABEL_77;
                    }
LABEL_76:
                    __break(1u);
LABEL_77:
                    __break(1u);
                    return;
                  }
                  if ((v63 & 1) == 0)
                  {
                    if (v62 != 4) {
                      goto LABEL_45;
                    }
                    goto LABEL_38;
                  }
                  goto LABEL_34;
                }
                id v33 = [v11 calendar];
                if (v33)
                {
                  uint64_t v34 = v33;
                  id v35 = [v33 source];

                  if (v35)
                  {
                    unsigned int v36 = [v35 isWritable];

                    unsigned __int8 v37 = v63;
                    if (v25 != 3) {
                      unsigned __int8 v37 = 0;
                    }
                    if ((v37 & 1) == 0)
                    {
                      if (v62 == 4) {
                        int v46 = 1;
                      }
                      else {
                        int v46 = v36;
                      }
                      if (v46 != 1) {
                        goto LABEL_45;
                      }
                      goto LABEL_38;
                    }
LABEL_34:
                    sub_10001F918();
                    sub_10001F588();
                    swift_bridgeObjectRetain();
                    id v38 = [v11 eventStore];
                    if (v38)
                    {
                      NSString v39 = v38;
                      id v40 = [v38 lastCommitTempToPermanentObjectIDMap];

                      id v14 = v67;
                      if (v40)
                      {
                        sub_1000072B0(0, &qword_100032FF0);
                        sub_1000072EC();
                        sub_10001F7E8();

                        sub_10001F378();
                        uint64_t v41 = (void *)sub_10001F368();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                      }
                      else
                      {
                        swift_bridgeObjectRelease();
                        sub_10001F908();
                        sub_10001F588();
                        uint64_t v41 = &_swiftEmptyDictionarySingleton;
                      }
                      v4(1, v41, v67, 0, 0, 0, 0, 0xF000000000000000);
                      swift_bridgeObjectRelease();
                      goto LABEL_48;
                    }
                    goto LABEL_75;
                  }
LABEL_74:
                  __break(1u);
LABEL_75:
                  __break(1u);
                  goto LABEL_76;
                }
LABEL_73:
                __break(1u);
                goto LABEL_74;
              }
LABEL_72:
              __break(1u);
              goto LABEL_73;
            }
LABEL_71:
            __break(1u);
            goto LABEL_72;
          }
LABEL_70:
          __break(1u);
          goto LABEL_71;
        }
LABEL_69:
        __break(1u);
        goto LABEL_70;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_69;
  }
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }

  sub_10001F588();
}

unint64_t sub_10000CE08(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000468C(&qword_100033638);
  uint64_t v2 = (void *)sub_10001FB58();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    os_log_type_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_1000142FC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

uint64_t sub_10000CF24(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_10000468C(&qword_100033628);
    uint64_t v2 = (void *)sub_10001FB58();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v26 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v25 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v11 = v10 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v12 >= v25) {
      goto LABEL_37;
    }
    unint64_t v13 = *(void *)(v26 + 8 * v12);
    int64_t v14 = v8 + 1;
    if (!v13)
    {
      int64_t v14 = v8 + 2;
      if (v8 + 2 >= v25) {
        goto LABEL_37;
      }
      unint64_t v13 = *(void *)(v26 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v8 + 3;
        if (v8 + 3 >= v25) {
          goto LABEL_37;
        }
        unint64_t v13 = *(void *)(v26 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = v8 + 4;
          if (v8 + 4 >= v25) {
            goto LABEL_37;
          }
          unint64_t v13 = *(void *)(v26 + 8 * v14);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
    int64_t v8 = v14;
LABEL_28:
    *(void *)&v27[0] = *(void *)(*(void *)(a1 + 48) + 8 * v11);
    id v16 = *(id *)&v27[0];
    swift_bridgeObjectRetain();
    sub_10000468C(&qword_100033630);
    swift_dynamicCast();
    uint64_t v17 = *(void *)&v27[0];
    sub_10000EA98((_OWORD *)((char *)v27 + 8), (_OWORD *)((char *)v28 + 8));
    sub_10000EA98((_OWORD *)((char *)v28 + 8), v27);
    sub_10000EA98(v27, v28);
    uint64_t result = sub_10001F9A8(v2[5]);
    uint64_t v18 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)])) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v23 = v20 == v22;
        if (v20 == v22) {
          unint64_t v20 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)&v6[8 * v20];
      }
      while (v24 == -1);
      unint64_t v9 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    *(void *)(v2[6] + 8 * v9) = v17;
    uint64_t result = (uint64_t)sub_10000EA98(v28, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v15 = v8 + 5;
  if (v8 + 5 >= v25)
  {
LABEL_37:
    swift_release();
    sub_10000EAA8();
    return (uint64_t)v2;
  }
  unint64_t v13 = *(void *)(v26 + 8 * v15);
  if (v13)
  {
    int64_t v14 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v14 >= v25) {
      goto LABEL_37;
    }
    unint64_t v13 = *(void *)(v26 + 8 * v14);
    ++v15;
    if (v13) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_10000D32C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventEditView.EventEditViewCoordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EKEventEditView.EventEditViewCoordinator()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for EKEventEditView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for EKEventEditView(uint64_t a1)
{
  uint64_t result = swift_release();
  if (*(void *)(a1 + 16)) {
    uint64_t result = swift_release();
  }
  if (*(void *)(a1 + 32))
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for EKEventEditView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2 + 2;
  uint64_t v5 = a2[2];
  swift_retain();
  if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  uint64_t v8 = a2[4];
  if (v8)
  {
    uint64_t v9 = a2[5];
    a1[4] = v8;
    a1[5] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  return a1;
}

void *assignWithCopy for EKEventEditView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[2];
  if (a1[2])
  {
    if (v4)
    {
      uint64_t v5 = a2[3];
      a1[2] = v4;
      a1[3] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[3];
    a1[2] = v4;
    a1[3] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v7 = a2[4];
  if (!a1[4])
  {
    if (v7)
    {
      uint64_t v9 = a2[5];
      a1[4] = v7;
      a1[5] = v9;
      swift_retain();
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v8 = a2[5];
  a1[4] = v7;
  a1[5] = v8;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for EKEventEditView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for EKEventEditView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  uint64_t v5 = a2[2];
  if (a1[2])
  {
    if (v5)
    {
      uint64_t v6 = a2[3];
      a1[2] = v5;
      a1[3] = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v8 = a2[4];
  if (!a1[4])
  {
    if (v8)
    {
      uint64_t v10 = a2[5];
      a1[4] = v8;
      a1[5] = v10;
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    return a1;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v9 = a2[5];
  a1[4] = v8;
  a1[5] = v9;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for EKEventEditView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EKEventEditView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for EKEventEditView()
{
  return &type metadata for EKEventEditView;
}

void *sub_10000D798()
{
  return &protocol witness table for Never;
}

id sub_10000D7A4(uint64_t a1)
{
  return sub_10000E4A8(a1, *(void **)(v1 + 8));
}

void sub_10000D7AC(uint64_t a1, uint64_t a2)
{
  sub_10000E6D4(a2, *(void *)(v2 + 8));
}

id sub_10000D7C0@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = (objc_class *)type metadata accessor for EKEventEditView.EventEditViewCoordinator();
  uint64_t v10 = (char *)objc_allocWithZone(v9);
  unint64_t v11 = &v10[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension15EKEventEditView24EventEditViewCoordinator_eventEditView];
  *(void *)unint64_t v11 = v4;
  *((void *)v11 + 1) = v3;
  *((void *)v11 + 2) = v5;
  *((void *)v11 + 3) = v6;
  *((void *)v11 + 4) = v8;
  *((void *)v11 + 5) = v7;
  swift_retain();
  sub_10000DA20(v5);
  sub_10000DA20(v8);
  v13.receiver = v10;
  v13.super_class = v9;
  id result = objc_msgSendSuper2(&v13, "init");
  *a1 = result;
  return result;
}

uint64_t sub_10000D874()
{
  return sub_10001F648();
}

uint64_t sub_10000D8B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000E914();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000D914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000E914();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000D978()
{
  return sub_10001F718();
}

void sub_10000D994()
{
}

unint64_t sub_10000D9C0()
{
  unint64_t result = qword_1000335C8;
  if (!qword_1000335C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000335C8);
  }
  return result;
}

void *sub_10000DA14()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000DA20(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_10000DA30(void *a1, uint64_t a2, void *a3)
{
  if (*(void *)(a2 + 16))
  {
    unint64_t v6 = sub_1000142FC(0xD000000000000011, 0x80000001000245B0);
    if (v7)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v6, (uint64_t)v28);
      if (swift_dynamicCast())
      {
        NSString v8 = sub_10001F7F8();
        swift_bridgeObjectRelease();
        id v9 = [a3 calendarWithIdentifier:v8];

        [a1 setDefaultCalendar:v9];
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v10 = sub_1000142FC(0xD000000000000011, 0x80000001000245B0);
    if (v11)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v10, (uint64_t)v28);
      sub_1000072B0(0, &qword_100033BD0);
      if (swift_dynamicCast())
      {

        [a1 setDefaultCalendar:0];
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v12 = sub_1000142FC(0xD000000000000015, 0x80000001000245D0);
    if (v13)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v12, (uint64_t)v28);
      sub_1000072B0(0, &qword_1000335E0);
      if (swift_dynamicCast())
      {
        [a1 setEditorBackgroundColor:v27];
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v14 = sub_1000142FC(0xD000000000000015, 0x80000001000245D0);
    if (v15)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v14, (uint64_t)v28);
      sub_1000072B0(0, &qword_100033BD0);
      if (swift_dynamicCast())
      {

        [a1 setEditorBackgroundColor:0];
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v16 = sub_1000142FC(0xD000000000000011, 0x80000001000245F0);
    if (v17)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v16, (uint64_t)v28);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setTimeImplicitlySet:", objc_msgSend(v27, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v18 = sub_1000142FC(0x6974736567677573, 0xED000079654B6E6FLL);
    if (v19)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v18, (uint64_t)v28);
      if (swift_dynamicCast())
      {
        NSString v20 = sub_10001F7F8();
        swift_bridgeObjectRelease();
        [a1 setSuggestionKey:v20];
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v21 = sub_1000142FC(0x6974736567677573, 0xED000079654B6E6FLL);
    if (v22)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v21, (uint64_t)v28);
      sub_1000072B0(0, &qword_100033BD0);
      if (swift_dynamicCast())
      {

        [a1 setSuggestionKey:0];
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v23 = sub_1000142FC(0xD000000000000014, 0x8000000100024610);
    if (v24)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v23, (uint64_t)v28);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setIgnoreUnsavedChanges:", objc_msgSend(v27, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v25 = sub_1000142FC(0xD000000000000013, 0x8000000100024630);
    if (v26)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v25, (uint64_t)v28);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setEventCreationMethod:", objc_msgSend(v27, "unsignedIntegerValue"));
      }
    }
  }
}

void sub_10000DFD4(uint64_t a1)
{
  uint64_t v2 = sub_10000468C(&qword_1000335F0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  uint64_t v5 = *(void **)(a1 + 72);
  if (v5)
  {
    if (!*(void *)(a1 + 80) || !*(void *)(a1 + 88) || !*(void *)(a1 + 96))
    {
      id v23 = v5;
      sub_10001F918();
      goto LABEL_10;
    }
    char v6 = *(unsigned char *)(a1 + 48);
    id v23 = v5;
    if (v6)
    {
      sub_10001F908();
LABEL_10:
      sub_10001F588();
      char v7 = v23;

      return;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10001F918();
    sub_10001F588();
    *(unsigned char *)(a1 + 48) = 1;
    NSString v8 = *(void **)(a1 + 16);
    id v9 = [objc_allocWithZone((Class)sub_10001F768()) init];
    [v8 startRecordingObjectIDChangeMap];
    [v23 setEventStore:v8];
    [v23 setShouldRecordPrecommitEvent:1];
    uint64_t v10 = *(void *)(a1
                    + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_changedViewConfigurationDictionary);
    if (*(void *)(v10 + 16))
    {
      swift_bridgeObjectRetain();
      sub_10000DA30(v23, v10, v8);
      swift_bridgeObjectRelease();
    }
    uint64_t v11 = *(void *)(a1 + 32);
    sub_10001F918();
    sub_10001F588();
    uint64_t v12 = a1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_eventOccurrenceDate;
    swift_beginAccess();
    sub_10000E8AC(v12, (uint64_t)v4);
    id v22 = v9;
    char v13 = (void *)sub_10001F758();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v13)
    {
      id v14 = v13;
      char v15 = (void *)sub_10001F7B8();
      self;
      unint64_t v16 = (void *)swift_dynamicCastObjCClass();
      if (v16)
      {
        char v17 = v16;
        *(unsigned char *)(a1 + 24) = [v16 isNew];
        if ([v17 isNew])
        {
          if (v11 == 1) {
            uint64_t v11 = 1;
          }
          else {
            uint64_t v11 = 3;
          }
          unint64_t v18 = v23;
        }
        else
        {
          unint64_t v18 = v23;
          if (*(void *)(a1 + 32) == 4)
          {
            unsigned int v19 = [v8 isCurrentProcessCreatorOfEvent:v17];
            unint64_t v18 = v23;
            if (!v19) {
              uint64_t v11 = 2;
            }
          }
        }
        [v18 setEvent:v17];
      }
      else
      {

        sub_10001F908();
        sub_10001F588();
        if (v11 == 1) {
          uint64_t v11 = 1;
        }
        else {
          uint64_t v11 = 3;
        }
      }
      uint64_t v20 = sub_10001F7C8();

      *(void *)(a1
                + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_hostTempToRemoteTempObjectIDMap) = v20;
      swift_bridgeObjectRelease();
    }
    [v23 setShouldOverrideAuthorizationStatus:1 withRemoteUIStatus:v11];

    sub_10000E9D0((uint64_t)v4, &qword_1000335F0);
  }
  else
  {
    sub_10001F918();
    sub_10001F588();
  }
}

id sub_10000E4A8(uint64_t a1, void *a2)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  id v3 = [objc_allocWithZone((Class)EKEventEditViewController) initWithRemoteUI:0];
  if (v3)
  {
    uint64_t v4 = (void *)a2[9];
    a2[9] = v3;
    id v5 = v3;

    sub_10000468C(&qword_1000335E8);
    sub_10001F6A8();
    [v5 setEditViewDelegate:v15];

    id v6 = v5;
    sub_10001F6A8();
    [v6 setDelegate:v15];

    uint64_t v7 = a2[7];
    a2[7] = sub_10000C368;
    a2[8] = 0;
    sub_1000047A0(v7);
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v6;
    id v9 = (id (**)())((char *)a2
                   + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_getHasUnsavedChangesAction);
    uint64_t v10 = *(void *)((char *)a2
                    + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_getHasUnsavedChangesAction);
    objc_class *v9 = sub_10000E888;
    v9[1] = (id (*)())v8;
    id v11 = v6;
    sub_1000047A0(v10);
    uint64_t v12 = swift_retain();
    sub_10000DFD4(v12);
    swift_release();
    return v11;
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
    id v14 = objc_allocWithZone((Class)EKEventEditViewController);
    return [v14 init];
  }
}

void sub_10000E6D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + 72);
  if (v2)
  {
    id v7 = v2;
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
    uint64_t v4 = *(void *)(a2
                   + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_changedViewConfigurationDictionary);
    if (*(void *)(v4 + 16))
    {
      id v5 = *(void **)(a2 + 16);
      swift_bridgeObjectRetain();
      id v6 = v5;
      sub_10000DA30(v7, v4, v6);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_10001F908();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
  }
}

uint64_t sub_10000E850()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10000E888()
{
  return [*(id *)(v0 + 16) hasUnsavedChanges];
}

uint64_t sub_10000E8AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000468C(&qword_1000335F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000E914()
{
  unint64_t result = qword_1000335F8;
  if (!qword_1000335F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000335F8);
  }
  return result;
}

uint64_t sub_10000E968(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000468C((uint64_t *)&unk_100033610);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E9D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000468C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000EA2C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000EA40(a1, a2);
  }
  return a1;
}

uint64_t sub_10000EA40(uint64_t a1, unint64_t a2)
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

_OWORD *sub_10000EA98(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000EAA8()
{
  return swift_release();
}

uint64_t sub_10000EAB0()
{
  return sub_10000C020();
}

uint64_t sub_10000EAB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EAC8()
{
  return swift_release();
}

uint64_t sub_10000EAD0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_10000EB18(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  id v5 = v4;
  id v10 = [objc_allocWithZone((Class)CADDefaultPermissionValidator) initWithClientIdentity:a1];
  unsigned int v11 = [v10 hasManagedConfigurationBundleIDOverrideEntitlement];
  uint64_t v34 = 0;
  unint64_t v35 = 0;
  sub_10001F918();
  if (v11) {
    BOOL v12 = a4 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
    uint64_t v32 = 0;
    unint64_t v13 = 0;
  }
  else
  {
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
    uint64_t v34 = a3;
    unint64_t v35 = a4;
    swift_bridgeObjectRetain();
    uint64_t v32 = a3;
    unint64_t v13 = a4;
  }
  os_log_type_t v14 = sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_100035F00;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v14))
  {
    log = v15;
    id v30 = v10;
    id v31 = v5;
    uint64_t v16 = 7104878;
    swift_bridgeObjectRetain_n();
    id v17 = a1;
    swift_bridgeObjectRetain_n();
    id v28 = v17;
    uint64_t v18 = swift_slowAlloc();
    v33[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 67109890;
    sub_10001F9E8();
    *(_WORD *)(v18 + 8) = 2080;
    if (a4) {
      uint64_t v19 = a3;
    }
    else {
      uint64_t v19 = 7104878;
    }
    unint64_t v20 = 0xE300000000000000;
    if (a4) {
      unint64_t v21 = a4;
    }
    else {
      unint64_t v21 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    sub_10001D408(v19, v21, v33);
    sub_10001F9E8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 18) = 2080;
    if (v13) {
      uint64_t v22 = v32;
    }
    else {
      uint64_t v22 = 7104878;
    }
    if (v13) {
      unint64_t v23 = v13;
    }
    else {
      unint64_t v23 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    sub_10001D408(v22, v23, v33);
    sub_10001F9E8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 28) = 2080;
    id v24 = [v28 teamIdentifier];
    if (v24)
    {
      unint64_t v25 = v24;
      uint64_t v16 = sub_10001F828();
      unint64_t v20 = v26;
    }
    sub_10001D408(v16, v20, v33);
    sub_10001F9E8();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v14, "EKEventStore+ManagedConfiguration: setting source account management. management:[%u] bundleID:[%s] overrideBundleID:[%s] clientTeamIdentifier:[%s]", (uint8_t *)v18, 0x26u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    id v5 = v31;
    a2 = a2;
    id v10 = v30;
  }
  swift_beginAccess();
  if (v35)
  {
    NSString v27 = sub_10001F7F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v27 = 0;
  }
  objc_msgSend(v5, "setSourceAccountManagement:withBundleID:", a2, v27, v28);
}

uint64_t sub_10000EF64(uint64_t a1)
{
  *(void *)(v1 + 32) = 0;
  *(void *)(v1 + 40) = 0;
  *(unsigned char *)(v1 + 48) = 0;
  *(void *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = &_swiftEmptyDictionarySingleton;
  *(unsigned char *)(v1 + 72) = 0;
  *(void *)(v1 + 112) = 0;
  *(_WORD *)(v1 + 120) = 0;
  *(void *)(v1 + 88) = 0;
  *(void *)(v1 + 96) = 0;
  *(void *)(v1 + 80) = 0;
  *(unsigned char *)(v1 + 104) = 0;
  *(void *)(v1 + 16) = a1;
  *(void *)(v1 + 24) = 0;
  return v1;
}

uint64_t sub_10000EF9C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10001F728();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_10001F748();
  uint64_t v8 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  id v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  *(void *)(v2 + 64) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v2 + 72)) {
    goto LABEL_4;
  }
  uint64_t v15 = *(void *)(v2 + 64);
  if (!*(void *)(v15 + 16))
  {
    long long aBlock = 0u;
    long long v59 = 0u;
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  unint64_t v16 = sub_1000142FC(0x6F697463656C6573, 0xEE00656C7974536ELL);
  if ((v17 & 1) == 0)
  {
    long long aBlock = 0u;
    long long v59 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  sub_10000B940(*(void *)(v15 + 56) + 32 * v16, (uint64_t)&aBlock);
  swift_bridgeObjectRelease();
  if (!*((void *)&v59 + 1))
  {
LABEL_14:
    sub_10000B88C((uint64_t)&aBlock);
    goto LABEL_15;
  }
  uint64_t v18 = sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v54 = v5;
  uint64_t v55 = v18;
  id v19 = v57;
  id v20 = [v57 integerValue];

  *(void *)(v2 + 80) = v20;
  uint64_t v21 = *(void *)(v2 + 64);
  if (!*(void *)(v21 + 16))
  {
    long long aBlock = 0u;
    long long v59 = 0u;
LABEL_23:
    sub_10000B88C((uint64_t)&aBlock);
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  unint64_t v22 = sub_1000142FC(0x5379616C70736964, 0xEC000000656C7974);
  if (v23)
  {
    sub_10000B940(*(void *)(v21 + 56) + 32 * v22, (uint64_t)&aBlock);
  }
  else
  {
    long long aBlock = 0u;
    long long v59 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v59 + 1)) {
    goto LABEL_23;
  }
  if (swift_dynamicCast())
  {
    id v24 = v57;
    id v25 = [v57 integerValue];

    *(void *)(v2 + 88) = v25;
    uint64_t v26 = *(void *)(v2 + 64);
    if (*(void *)(v26 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v27 = sub_1000142FC(0x7954797469746E65, 0xEA00000000006570);
      uint64_t v5 = v54;
      if (v28)
      {
        sub_10000B940(*(void *)(v26 + 56) + 32 * v27, (uint64_t)&aBlock);
      }
      else
      {
        long long aBlock = 0u;
        long long v59 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v59 + 1))
      {
        if (swift_dynamicCast())
        {
          id v29 = v57;
          id v30 = [v57 unsignedIntegerValue];

          *(void *)(v2 + 96) = v30;
          uint64_t v5 = v54;
        }
LABEL_31:
        uint64_t v31 = *(void *)(v2 + 64);
        if (*(void *)(v31 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v32 = sub_1000142FC(0xD000000000000013, 0x8000000100024E40);
          if (v33)
          {
            sub_10000B940(*(void *)(v31 + 56) + 32 * v32, (uint64_t)&aBlock);
          }
          else
          {
            long long aBlock = 0u;
            long long v59 = 0u;
          }
          swift_bridgeObjectRelease();
          if (*((void *)&v59 + 1))
          {
            if (swift_dynamicCast())
            {
              id v34 = v57;
              unsigned __int8 v35 = [v57 BOOLValue];

              *(unsigned char *)(v2 + 104) = v35;
              uint64_t v5 = v54;
            }
LABEL_40:
            uint64_t v36 = *(void *)(v2 + 64);
            if (*(void *)(v36 + 16))
            {
              swift_bridgeObjectRetain();
              unint64_t v37 = sub_1000142FC(0xD000000000000015, 0x8000000100024E70);
              if (v38)
              {
                sub_10000B940(*(void *)(v36 + 56) + 32 * v37, (uint64_t)&aBlock);
              }
              else
              {
                long long aBlock = 0u;
                long long v59 = 0u;
              }
              swift_bridgeObjectRelease();
              if (*((void *)&v59 + 1))
              {
                if (swift_dynamicCast())
                {
                  id v39 = v57;
                  unsigned __int8 v40 = [v57 BOOLValue];

                  *(unsigned char *)(v2 + 104) = v40;
                  uint64_t v5 = v54;
                }
LABEL_49:
                uint64_t v41 = *(void *)(v2 + 64);
                if (*(void *)(v41 + 16))
                {
                  swift_bridgeObjectRetain();
                  unint64_t v42 = sub_1000142FC(0xD000000000000011, 0x8000000100024E90);
                  if (v43)
                  {
                    sub_10000B940(*(void *)(v41 + 56) + 32 * v42, (uint64_t)&aBlock);
                  }
                  else
                  {
                    long long aBlock = 0u;
                    long long v59 = 0u;
                  }
                  swift_bridgeObjectRelease();
                  if (*((void *)&v59 + 1))
                  {
                    if (swift_dynamicCast())
                    {
                      id v44 = v57;
                      unsigned __int8 v45 = [v57 BOOLValue];

                      *(unsigned char *)(v2 + 121) = v45;
                    }
LABEL_58:
                    uint64_t v46 = *(void *)(v2 + 64);
                    if (*(void *)(v46 + 16))
                    {
                      swift_bridgeObjectRetain();
                      unint64_t v47 = sub_1000142FC(0xD000000000000011, 0x8000000100025300);
                      if (v48)
                      {
                        sub_10000B940(*(void *)(v46 + 56) + 32 * v47, (uint64_t)&aBlock);
                      }
                      else
                      {
                        long long aBlock = 0u;
                        long long v59 = 0u;
                      }
                      swift_bridgeObjectRelease();
                      if (*((void *)&v59 + 1))
                      {
                        if (swift_dynamicCast())
                        {
                          uint64_t v49 = *(void **)(v2 + 16);
                          NSString v50 = sub_10001F7F8();
                          swift_bridgeObjectRelease();
                          id v51 = [v49 sourceWithIdentifier:v50];

                          uint64_t v5 = v54;
                          unint64_t v52 = *(void **)(v2 + 112);
                          *(void *)(v2 + 112) = v51;
LABEL_68:

                          *(unsigned char *)(v2 + 72) = 1;
LABEL_4:
                          sub_1000072B0(0, (unint64_t *)&qword_100033640);
                          unsigned int v11 = (void *)sub_10001F948();
                          unint64_t v60 = sub_10001229C;
                          uint64_t v61 = v2;
                          *(void *)&long long aBlock = _NSConcreteStackBlock;
                          *((void *)&aBlock + 1) = 1107296256;
                          *(void *)&long long v59 = sub_100012454;
                          *((void *)&v59 + 1) = &unk_10002D5A0;
                          uint64_t v12 = v5;
                          unint64_t v13 = _Block_copy(&aBlock);
                          swift_retain();
                          swift_release();
                          sub_10001F738();
                          *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
                          sub_1000122BC((unint64_t *)&qword_100033C10, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
                          sub_10000468C((uint64_t *)&unk_100033650);
                          sub_1000046D0();
                          sub_10001FA18();
                          sub_10001F968();
                          _Block_release(v13);

                          (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v4);
                          return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v56);
                        }
LABEL_67:
                        unint64_t v52 = *(void **)(v2 + 112);
                        *(void *)(v2 + 112) = 0;
                        goto LABEL_68;
                      }
                    }
                    else
                    {
                      long long aBlock = 0u;
                      long long v59 = 0u;
                    }
                    sub_10000B88C((uint64_t)&aBlock);
                    goto LABEL_67;
                  }
                }
                else
                {
                  long long aBlock = 0u;
                  long long v59 = 0u;
                }
                sub_10000B88C((uint64_t)&aBlock);
                goto LABEL_58;
              }
            }
            else
            {
              long long aBlock = 0u;
              long long v59 = 0u;
            }
            sub_10000B88C((uint64_t)&aBlock);
            goto LABEL_49;
          }
        }
        else
        {
          long long aBlock = 0u;
          long long v59 = 0u;
        }
        sub_10000B88C((uint64_t)&aBlock);
        goto LABEL_40;
      }
    }
    else
    {
      long long aBlock = 0u;
      long long v59 = 0u;
      uint64_t v5 = v54;
    }
    sub_10000B88C((uint64_t)&aBlock);
    goto LABEL_31;
  }
LABEL_15:
  sub_10001F908();
  return sub_10001F588();
}

uint64_t sub_10000F8C0()
{
  type metadata accessor for EKCalendarChooserViewModel();
  sub_1000122BC(&qword_1000331E8, v0, (void (*)(uint64_t))type metadata accessor for EKCalendarChooserViewModel);
  sub_10001F598();
  sub_10001F5A8();

  return swift_release();
}

id sub_10000F944(void *a1)
{
  return [a1 showAllButtonPressed];
}

uint64_t sub_10000F950()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 122, 7);
}

uint64_t type metadata accessor for EKCalendarChooserViewModel()
{
  return self;
}

uint64_t sub_10000F9CC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for EKCalendarChooserViewModel();
  uint64_t result = sub_10001F598();
  *a1 = result;
  return result;
}

double sub_10000FA08@<D0>(uint64_t a1@<X8>)
{
  long long v15 = *v1;
  if (*(unsigned char *)(*((void *)&v15 + 1) + 72) == 1)
  {
    type metadata accessor for EKCalendarChooserViewModel();
    sub_1000122BC(&qword_1000331E8, v3, (void (*)(uint64_t))type metadata accessor for EKCalendarChooserViewModel);
    swift_retain();
    sub_10001F5F8();
    uint64_t v4 = *((void *)v1 + 2);
    uint64_t v5 = *((void *)v1 + 4);
    uint64_t v6 = (_OWORD *)swift_allocObject();
    long long v7 = v1[1];
    v6[1] = *v1;
    v6[2] = v7;
    v6[3] = v1[2];
    uint64_t v8 = (_OWORD *)swift_allocObject();
    long long v9 = v1[1];
    v8[1] = *v1;
    v8[2] = v9;
    v8[3] = v1[2];
    sub_1000123A0((uint64_t)&v15);
    sub_10000DA20(v4);
    sub_10000DA20(v5);
    sub_1000123A0((uint64_t)&v15);
    sub_10000DA20(v4);
    sub_10000DA20(v5);
  }
  sub_10001045C();
  sub_10001F618();
  double result = *(double *)&v11;
  *(_OWORD *)a1 = v11;
  *(_OWORD *)(a1 + 16) = v12;
  *(_OWORD *)(a1 + 32) = v13;
  *(unsigned char *)(a1 + 48) = v14;
  return result;
}

uint64_t sub_10000FBEC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 32);
  if (v6)
  {
    uint64_t v11 = result;
    swift_retain();
    v6(v11, a2, a3, a4, a5);
    return sub_1000047A0((uint64_t)v6);
  }
  return result;
}

uint64_t sub_10000FC98(uint64_t result, char a2, uint64_t a3)
{
  uint64_t v3 = *(void (**)(uint64_t, void))(a3 + 16);
  if (v3)
  {
    uint64_t v5 = result;
    swift_retain();
    v3(v5, a2 & 1);
    return sub_1000047A0((uint64_t)v3);
  }
  return result;
}

uint64_t sub_10000FD20(void *a1)
{
  if (!*(void *)(v1
                  + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension21EKCalendarChooserView30CalendarChooserViewCoordinator_calendarChooserView
                  + 16))
  {
    sub_10001F918();
    if (qword_100032C00 != -1) {
      goto LABEL_39;
    }
    goto LABEL_5;
  }
  unint64_t v22 = *(void (**)(void *, id))(v1
                                          + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension21EKCalendarChooserView30CalendarChooserViewCoordinator_calendarChooserView
                                          + 16);
  swift_retain();
  id v3 = [a1 selectedCalendars];
  sub_1000072B0(0, &qword_100033BE0);
  sub_1000121DC();
  uint64_t v4 = sub_10001F8D8();

  id v21 = a1;
  if ((v4 & 0xC000000000000001) != 0)
  {
    sub_10001FA48();
    sub_10001F8F8();
    uint64_t v4 = v25;
    uint64_t v23 = v26;
    uint64_t v5 = v27;
    uint64_t v6 = v28;
    unint64_t v7 = v29;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v9 = -1 << *(unsigned char *)(v4 + 32);
    uint64_t v23 = v4 + 56;
    uint64_t v5 = ~v9;
    uint64_t v10 = -v9;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v7 = v11 & *(void *)(v4 + 56);
  }
  int64_t v12 = (unint64_t)(v5 + 64) >> 6;
  if (v4 < 0) {
    goto LABEL_15;
  }
  while (1)
  {
    if (v7)
    {
      uint64_t v13 = (v7 - 1) & v7;
      unint64_t v14 = __clz(__rbit64(v7)) | (v6 << 6);
      uint64_t v15 = v6;
      goto LABEL_32;
    }
    int64_t v17 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      break;
    }
    if (v17 >= v12) {
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v23 + 8 * v17);
    uint64_t v15 = v6 + 1;
    if (!v18)
    {
      uint64_t v15 = v6 + 2;
      if (v6 + 2 >= v12) {
        goto LABEL_37;
      }
      unint64_t v18 = *(void *)(v23 + 8 * v15);
      if (!v18)
      {
        uint64_t v15 = v6 + 3;
        if (v6 + 3 >= v12) {
          goto LABEL_37;
        }
        unint64_t v18 = *(void *)(v23 + 8 * v15);
        if (!v18)
        {
          uint64_t v15 = v6 + 4;
          if (v6 + 4 >= v12) {
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v23 + 8 * v15);
          if (!v18)
          {
            uint64_t v19 = v6 + 5;
            while (v12 != v19)
            {
              unint64_t v18 = *(void *)(v23 + 8 * v19++);
              if (v18)
              {
                uint64_t v15 = v19 - 1;
                goto LABEL_31;
              }
            }
LABEL_37:
            sub_10000EAA8();
            v22(&_swiftEmptyArrayStorage, [v21 allSelected]);
            swift_bridgeObjectRelease();
            return sub_1000047A0((uint64_t)v22);
          }
        }
      }
    }
LABEL_31:
    uint64_t v13 = (v18 - 1) & v18;
    unint64_t v14 = __clz(__rbit64(v18)) + (v15 << 6);
LABEL_32:
    id v16 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    if (!v16) {
      goto LABEL_37;
    }
    while (1)
    {
      id v20 = [objc_allocWithZone((Class)EKCalendarWrapper) initWithCalendar:v16];
      sub_10001F868();
      if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_10001F8A8();
      }
      sub_10001F8B8();
      sub_10001F898();

      uint64_t v6 = v15;
      unint64_t v7 = v13;
      if ((v4 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_15:
      if (sub_10001FA78())
      {
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v16 = v24;
        swift_unknownObjectRelease();
        uint64_t v15 = v6;
        uint64_t v13 = v7;
        if (v24) {
          continue;
        }
      }
      goto LABEL_37;
    }
  }
  __break(1u);
LABEL_39:
  swift_once();
LABEL_5:

  return sub_10001F588();
}

id sub_1000101BC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKCalendarChooserView.CalendarChooserViewCoordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EKCalendarChooserView.CalendarChooserViewCoordinator()
{
  return self;
}

ValueMetadata *type metadata accessor for EKCalendarChooserView()
{
  return &type metadata for EKCalendarChooserView;
}

id sub_1000102A0(uint64_t a1)
{
  return sub_100011E38(a1, *(void *)(v1 + 8));
}

void sub_1000102A8(uint64_t a1, uint64_t a2)
{
  sub_100012078(a2, *(void *)(v2 + 8));
}

id sub_1000102B4@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = (objc_class *)type metadata accessor for EKCalendarChooserView.CalendarChooserViewCoordinator();
  uint64_t v10 = (char *)objc_allocWithZone(v9);
  uint64_t v11 = &v10[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension21EKCalendarChooserView30CalendarChooserViewCoordinator_calendarChooserView];
  *(void *)uint64_t v11 = v4;
  *((void *)v11 + 1) = v3;
  *((void *)v11 + 2) = v5;
  *((void *)v11 + 3) = v6;
  *((void *)v11 + 4) = v8;
  *((void *)v11 + 5) = v7;
  swift_retain();
  sub_10000DA20(v5);
  sub_10000DA20(v8);
  v13.receiver = v10;
  v13.super_class = v9;
  id result = objc_msgSendSuper2(&v13, "init");
  *a1 = result;
  return result;
}

uint64_t sub_100010368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100012248();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000103CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100012248();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100010430()
{
}

unint64_t sub_10001045C()
{
  unint64_t result = qword_100033BC0;
  if (!qword_100033BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033BC0);
  }
  return result;
}

uint64_t sub_1000104B0(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_10001FA68();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1000072B0(0, &qword_100033BE0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_10001FA58();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100010750(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100010948();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_100010BE8((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_10001F9A8(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_1000072B0(0, &qword_100033BE0);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_10001F9B8();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        id v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_10001F9B8();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_100010C6C((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_100010750(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000468C(&qword_100033BF0);
    uint64_t v2 = sub_10001FAD8();
    uint64_t v14 = v2;
    sub_10001FA48();
    if (sub_10001FA78())
    {
      sub_1000072B0(0, &qword_100033BE0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_100010948();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_10001F9A8(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_10001FA78());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_100010948()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000468C(&qword_100033BF0);
  uint64_t v3 = sub_10001FAC8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
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
                  void *v6 = -1 << v27;
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
      uint64_t result = sub_10001F9A8(*(void *)(v4 + 40));
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

unint64_t sub_100010BE8(uint64_t a1, void *a2)
{
  sub_10001F9A8(a2[5]);
  unint64_t result = sub_10001FA38();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_100010C6C(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100010948();
  }
  else
  {
    if (v7 > v6)
    {
      sub_100010DF4();
      goto LABEL_14;
    }
    sub_100010FA0();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_10001F9A8(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_1000072B0(0, &qword_100033BE0);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_10001F9B8();

    if (v12)
    {
LABEL_13:
      sub_10001FB98();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_10001F9B8();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_100010DF4()
{
  uint64_t v1 = v0;
  sub_10000468C(&qword_100033BF0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001FAB8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100010FA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000468C(&qword_100033BF0);
  uint64_t v3 = sub_10001FAC8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
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
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_10001F9A8(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_10001121C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000468C(&qword_100033BF8);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_100011304((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_10000EAA8();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_100011304(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    id v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100011504(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_10001FB28();
    swift_bridgeObjectRelease();
  }
  sub_1000072B0(0, &qword_100033BE0);
  sub_1000121DC();
  uint64_t result = sub_10001F8E8();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_10001FB28();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)sub_10001FAF8();
        sub_1000104B0(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_1000104B0(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

void sub_100011658(void *a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a2 + 16))
  {
    unint64_t v6 = sub_1000142FC(0xD000000000000013, 0x8000000100024FC0);
    if ((v7 & 1) != 0
      && (sub_10000B940(*(void *)(a2 + 56) + 32 * v6, (uint64_t)v37),
          sub_10000468C(&qword_100033BD8),
          (swift_dynamicCast() & 1) != 0))
    {
      sub_10001121C((uint64_t)v36);
      swift_bridgeObjectRelease();
      id v8 = *(id *)(a3 + 16);
      Class isa = sub_10001F878().super.isa;
      swift_release();
      id v10 = [v8 calendarsWithIdentifiers:isa];

      if (v10)
      {
        sub_1000072B0(0, &qword_100033BE0);
        unint64_t v11 = sub_10001F888();

        sub_100011504(v11);
        swift_bridgeObjectRelease();
        sub_1000121DC();
        Class v12 = sub_10001F8C8().super.isa;
        swift_bridgeObjectRelease();
        [a1 setSelectedCalendars:v12];
      }
    }
    else if (*(void *)(a2 + 16))
    {
      unint64_t v13 = sub_1000142FC(0xD000000000000010, 0x8000000100024FE0);
      if ((v14 & 1) != 0
        && (sub_10000B940(*(void *)(a2 + 56) + 32 * v13, (uint64_t)v37), (swift_dynamicCast() & 1) != 0))
      {
        id v15 = *(id *)(a3 + 16);
        NSString v16 = sub_10001F7F8();
        swift_bridgeObjectRelease();
        id v17 = [v15 calendarWithIdentifier:v16];

        [a1 setSelectedCalendar:v17];
      }
      else if (*(void *)(a2 + 16))
      {
        unint64_t v18 = sub_1000142FC(0xD000000000000010, 0x8000000100024FE0);
        if (v19)
        {
          sub_10000B940(*(void *)(a2 + 56) + 32 * v18, (uint64_t)v37);
          sub_1000072B0(0, &qword_100033BD0);
          if (swift_dynamicCast())
          {

            [a1 setSelectedCalendar:0];
          }
        }
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v20 = sub_1000142FC(0xD000000000000015, 0x8000000100025000);
    if (v21)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v20, (uint64_t)v37);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setShowDetailAccessories:", objc_msgSend(v36, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v22 = sub_1000142FC(0x4D7265736F6F6863, 0xEB0000000065646FLL);
    if (v23)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v22, (uint64_t)v37);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setChooserMode:", objc_msgSend(v36, "integerValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v24 = sub_1000142FC(0xD000000000000021, 0x8000000100025020);
    if (v25)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v24, (uint64_t)v37);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setDisableCalendarsUnselectedByFocus:", objc_msgSend(v36, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v26 = sub_1000142FC(0xD000000000000013, 0x8000000100025050);
    if (v27)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v26, (uint64_t)v37);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setAllowsPullToRefresh:", objc_msgSend(v36, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v28 = sub_1000142FC(0xD00000000000001ALL, 0x8000000100025070);
    if (v29)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v28, (uint64_t)v37);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setShowsDeclinedEventsSetting:", objc_msgSend(v36, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v30 = sub_1000142FC(0xD000000000000013, 0x8000000100025090);
    if (v31)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v30, (uint64_t)v37);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setExplanatoryTextMode:", objc_msgSend(v36, "unsignedIntValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v32 = sub_1000142FC(0xD000000000000011, 0x8000000100024E90);
    if (v33)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v32, (uint64_t)v37);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setShowAccountStatus:", objc_msgSend(v36, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v34 = sub_1000142FC(0xD000000000000019, 0x80000001000250B0);
    if (v35)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v34, (uint64_t)v37);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setOnlyShowUnmanagedAccounts:", objc_msgSend(v36, "BOOLValue"));
      }
    }
  }
}

id sub_100011E38(uint64_t a1, uint64_t a2)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  BYTE2(v10) = *(unsigned char *)(a2 + 121);
  BYTE1(v10) = *(unsigned char *)(a2 + 120);
  LOBYTE(v10) = *(unsigned char *)(a2 + 104);
  id v3 = objc_msgSend(objc_allocWithZone((Class)EKCalendarChooser), "initWithRemoteUI:selectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", 0, *(void *)(a2 + 80), *(void *)(a2 + 88), *(void *)(a2 + 96), 0, *(void *)(a2 + 16), *(void *)(a2 + 112), v10);
  if (v3)
  {
    uint64_t v4 = v3;
    objc_msgSend(v3, "setShouldOverrideAuthorizationStatus:withRemoteUIStatus:displayStyle:", 1);
    uint64_t v5 = *(void *)(a2 + 64);
    if (*(void *)(v5 + 16))
    {
      swift_bridgeObjectRetain();
      sub_100011658(v4, v5, a2);
      swift_bridgeObjectRelease();
    }
    sub_10000468C(&qword_100033C00);
    sub_10001F6A8();
    [v4 setDelegate:v11];

    unint64_t v6 = *(void **)(a2 + 56);
    *(void *)(a2 + 56) = v4;
    id v7 = v4;

    return v7;
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
    id v9 = objc_allocWithZone((Class)EKCalendarChooser);
    return [v9 init];
  }
}

void sub_100012078(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void **)(a2 + 56);
  if (v2)
  {
    id v5 = v2;
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
    uint64_t v4 = *(void *)(a2 + 64);
    if (*(void *)(v4 + 16))
    {
      swift_bridgeObjectRetain();
      sub_100011658(v5, v4, a2);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_10001F908();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
  }
}

unint64_t sub_1000121DC()
{
  unint64_t result = qword_100033BE8;
  if (!qword_100033BE8)
  {
    sub_1000072B0(255, &qword_100033BE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033BE8);
  }
  return result;
}

unint64_t sub_100012248()
{
  unint64_t result = qword_100033C08;
  if (!qword_100033C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033C08);
  }
  return result;
}

uint64_t sub_10001229C()
{
  return sub_10000F8C0();
}

uint64_t sub_1000122A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000122B4()
{
  return swift_release();
}

uint64_t sub_1000122BC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for EKCalendarChooserViewWrapper()
{
  return &type metadata for EKCalendarChooserViewWrapper;
}

uint64_t sub_100012314()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100012334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10000FBEC(a1, a2, a3, a4, a5, v5 + 16);
}

uint64_t sub_100012340()
{
  swift_release();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  if (*(void *)(v0 + 48)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100012398(uint64_t a1, char a2)
{
  return sub_10000FC98(a1, a2, v2 + 16);
}

uint64_t sub_1000123A0(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000123D0()
{
  unint64_t result = qword_100033C30;
  if (!qword_100033C30)
  {
    sub_10000472C(&qword_100033C38);
    sub_10001045C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033C30);
  }
  return result;
}

uint64_t sub_100012454(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100012498(uint64_t a1)
{
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = 0;
  *(unsigned char *)(v1 + 40) = 0;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(void *)(v1 + 80) = 0;
  uint64_t v3 = v1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventOccurrenceDate;
  uint64_t v4 = sub_10001F4E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(void *)(v1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_viewController) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_hasInProcessNavBar) = 2;
  *(void *)(v1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_changedViewConfigurationDictionary) = &_swiftEmptyDictionarySingleton;
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_navigationDoneButtonTapCallback);
  *uint64_t v5 = 0;
  v5[1] = 0;
  unint64_t v6 = (void *)(v1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventEditViewCompletedCallback);
  void *v6 = 0;
  v6[1] = 0;
  id v7 = (void *)(v1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventEditViewPresentedCallback);
  *id v7 = 0;
  v7[1] = 0;
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_100012588(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10001F728();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10001F748();
  uint64_t v8 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  *(void *)(v2 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_changedViewConfigurationDictionary) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1000072B0(0, (unint64_t *)&qword_100033640);
  unint64_t v11 = (void *)sub_10001F948();
  aBlock[4] = sub_1000164E8;
  void aBlock[5] = v2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = &unk_10002D840;
  Class v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000164F0((unint64_t *)&qword_100033C10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  sub_10001FA18();
  sub_10001F968();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v15);
}

uint64_t sub_1000128B8()
{
  type metadata accessor for EKEventViewModel();
  sub_1000164F0(&qword_100033220, (void (*)(uint64_t))type metadata accessor for EKEventViewModel);
  sub_10001F598();
  sub_10001F5A8();

  return swift_release();
}

uint64_t sub_100012940()
{
  sub_1000047A0(*(void *)(v0 + 48));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100015874(v0 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventOccurrenceDate);

  swift_bridgeObjectRelease();
  sub_1000047A0(*(void *)(v0
                          + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_navigationDoneButtonTapCallback));
  sub_1000047A0(*(void *)(v0
                          + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventEditViewCompletedCallback));
  sub_1000047A0(*(void *)(v0
                          + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventEditViewPresentedCallback));
  return v0;
}

uint64_t sub_1000129F4()
{
  sub_100012940();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100012A4C()
{
  return type metadata accessor for EKEventViewModel();
}

uint64_t type metadata accessor for EKEventViewModel()
{
  uint64_t result = qword_100033CE0;
  if (!qword_100033CE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100012AA0()
{
  sub_10000C2D0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_100012B94@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for EKEventViewModel();
  uint64_t result = sub_10001F598();
  *a1 = result;
  return result;
}

void sub_100012BD4(uint64_t a1)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();

  sub_100015048(a1);
}

void sub_100012C70()
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v1 = *(id *)(Strong + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_viewController);
    swift_release();
    [v1 doneButtonTapped];
  }
}

void sub_100012D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v9 = Strong;
    uint64_t v10 = *(void **)(Strong + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_viewController);
    if (v10)
    {
      unint64_t v11 = *(void **)(Strong + 16);
      Class v12 = (void *)swift_allocObject();
      v12[2] = v9;
      v12[3] = a2;
      v12[4] = a3;
      v12[5] = a1;
      v12[6] = v10;
      aBlock[4] = sub_10001591C;
      void aBlock[5] = v12;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100012454;
      aBlock[3] = &unk_10002D778;
      unint64_t v13 = _Block_copy(aBlock);
      id v14 = v10;
      id v15 = v11;
      swift_retain();
      swift_bridgeObjectRetain();
      swift_release();
      [v15 waitUntilDatabaseUpdatedToTimestamp:a4 callback:v13];
      _Block_release(v13);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
}

void sub_100012F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = *(void **)(a1 + 16);
  NSString v8 = sub_10001F7F8();
  id v10 = [v7 eventWithIdentifier:v8];

  uint64_t v9 = v10;
  if (v10)
  {
    if (a4 != 2)
    {
      [a5 fullReloadWithNewEvent:v10];
      uint64_t v9 = v10;
    }
  }
}

uint64_t sub_100012FEC(char a1)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    [*(id *)(result + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_viewController) setEventEditViewPresented:a1 & 1];
    return swift_release();
  }
  return result;
}

id sub_10001314C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)(v3 + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView);
  uint64_t v5 = *(void (**)(unint64_t, unint64_t, id, void *, uint64_t, id, id, void))(v3 + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView + 32);
  if (v5)
  {
    uint64_t v6 = v4[6];
    if (v6)
    {
      uint64_t v7 = v4[7];
      NSString v8 = *(void **)(v4[1] + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_viewController);
      if (v8)
      {
        sub_10000DA20(*(void *)(v3
                                + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView
                                + 32));
        sub_10000DA20(v6);
        id v11 = [v8 event];
        if (v11)
        {
          uint64_t v49 = v7;
          Class v12 = v11;
          id v13 = objc_allocWithZone((Class)UIActivityViewController);
          swift_bridgeObjectRetain();
          Class isa = sub_10001F878().super.isa;
          swift_bridgeObjectRelease();
          id v15 = [v13 initWithActivityItems:isa applicationActivities:0];

          sub_10000468C(&qword_100034020);
          uint64_t v16 = swift_allocObject();
          *(_OWORD *)(v16 + 16) = xmmword_100021280;
          *(void *)(v16 + 32) = UIActivityTypeAddToReadingList;
          type metadata accessor for ActivityType(0);
          id v17 = UIActivityTypeAddToReadingList;
          Class v18 = sub_10001F878().super.isa;
          swift_bridgeObjectRelease();
          [v15 setExcludedActivityTypes:v18];

          id result = [v12 calendar];
          if (result)
          {
            unint64_t v20 = result;
            id v21 = [result isManaged];

            [v15 setIsContentManaged:v21];
            [v15 setAllowsEmbedding:1];
            unint64_t v22 = (void *)swift_allocObject();
            v22[2] = v6;
            v22[3] = v49;
            v22[4] = 0xD000000000000018;
            v22[5] = 0x8000000100025A00;
            aBlock[4] = sub_1000159D8;
            void aBlock[5] = v22;
            aBlock[0] = _NSConcreteStackBlock;
            aBlock[1] = 1107296256;
            aBlock[2] = sub_100019928;
            aBlock[3] = &unk_10002D7C8;
            char v23 = _Block_copy(aBlock);
            swift_retain();
            swift_release();
            [v15 setCompletionWithItemsHandler:v23];
            _Block_release(v23);
            id v24 = [v15 sheetPresentationController];
            if (v24)
            {
              char v25 = v24;
              sub_10000468C(&qword_100034028);
              uint64_t v26 = swift_allocObject();
              *(_OWORD *)(v26 + 16) = xmmword_100021290;
              *(void *)(v26 + 32) = [self largeDetent];
              aBlock[0] = v26;
              sub_10001F898();
              sub_1000072B0(0, &qword_100034030);
              Class v27 = sub_10001F878().super.isa;
              swift_bridgeObjectRelease();
              [v25 setDetents:v27];
            }
            id v28 = v15;
            [a3 bounds];
            double v30 = v29;
            double v32 = v31;
            double v34 = v33;
            double v36 = v35;
            id v37 = [a1 view];
            objc_msgSend(a3, "convertRect:toView:", v37, v30, v32, v34, v36);
            double v39 = v38;
            double v41 = v40;
            double v43 = v42;
            double v45 = v44;

            uint64_t v46 = self;
            id v47 = objc_msgSend(v46, "valueWithCGRect:", v39, v41, v43, v45);
            [v28 preferredContentSize];
            id v48 = objc_msgSend(v46, "valueWithCGSize:");
            v5(0xD000000000000018, 0x8000000100025A00, v28, v12, 1, v47, v48, 0);

            sub_1000047A0(v6);
            return (id)sub_1000047A0((uint64_t)v5);
          }
          else
          {
            __break(1u);
          }
          return result;
        }
      }
      else
      {
        sub_10000DA20(*(void *)(v3
                                + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView
                                + 32));
        sub_10000DA20(v6);
      }
      sub_10001F918();
      if (qword_100032C00 != -1) {
        swift_once();
      }
      sub_10001F588();
      sub_1000047A0(v6);
    }
    else
    {
      swift_retain();
      sub_10001F918();
      if (qword_100032C00 != -1) {
        swift_once();
      }
      sub_10001F588();
    }
    return (id)sub_1000047A0((uint64_t)v5);
  }
  else
  {
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    return (id)sub_10001F588();
  }
}

id sub_100013BA4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventView.EventViewCoordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EKEventView.EventViewCoordinator()
{
  return self;
}

uint64_t destroy for EKEventView(void *a1)
{
  uint64_t result = swift_release();
  if (a1[2]) {
    uint64_t result = swift_release();
  }
  if (a1[4]) {
    uint64_t result = swift_release();
  }
  if (a1[6])
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for EKEventView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2 + 2;
  uint64_t v5 = a2[2];
  swift_retain();
  if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  uint64_t v8 = a2[4];
  if (v8)
  {
    uint64_t v9 = a2[5];
    a1[4] = v8;
    a1[5] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  uint64_t v10 = a2[6];
  if (v10)
  {
    uint64_t v11 = a2[7];
    a1[6] = v10;
    a1[7] = v11;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  return a1;
}

void *assignWithCopy for EKEventView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[2];
  if (a1[2])
  {
    if (v4)
    {
      uint64_t v5 = a2[3];
      a1[2] = v4;
      a1[3] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[3];
    a1[2] = v4;
    a1[3] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v7 = a2[4];
  if (a1[4])
  {
    if (v7)
    {
      uint64_t v8 = a2[5];
      a1[4] = v7;
      a1[5] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[5];
    a1[4] = v7;
    a1[5] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  uint64_t v10 = a2[6];
  if (!a1[6])
  {
    if (v10)
    {
      uint64_t v12 = a2[7];
      a1[6] = v10;
      a1[7] = v12;
      swift_retain();
      return a1;
    }
LABEL_21:
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
    return a1;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v11 = a2[7];
  a1[6] = v10;
  a1[7] = v11;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for EKEventView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for EKEventView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  uint64_t v5 = a2[2];
  if (a1[2])
  {
    if (v5)
    {
      uint64_t v6 = a2[3];
      a1[2] = v5;
      a1[3] = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v8 = a2[4];
  if (a1[4])
  {
    if (v8)
    {
      uint64_t v9 = a2[5];
      a1[4] = v8;
      a1[5] = v9;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v8)
  {
    uint64_t v10 = a2[5];
    a1[4] = v8;
    a1[5] = v10;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  uint64_t v11 = a2[6];
  if (!a1[6])
  {
    if (v11)
    {
      uint64_t v13 = a2[7];
      a1[6] = v11;
      a1[7] = v13;
      return a1;
    }
LABEL_21:
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
    return a1;
  }
  if (!v11)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v12 = a2[7];
  a1[6] = v11;
  a1[7] = v12;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for EKEventView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EKEventView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EKEventView()
{
  return &type metadata for EKEventView;
}

id sub_1000140D4(uint64_t a1)
{
  return sub_100015420(a1, *(void **)(v1 + 8));
}

void sub_1000140DC(uint64_t a1, uint64_t a2)
{
  sub_1000156B4(a2, *(void *)(v2 + 8));
}

id sub_1000140E8@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (objc_class *)type metadata accessor for EKEventView.EventViewCoordinator();
  uint64_t v11 = (char *)objc_allocWithZone(v10);
  uint64_t v12 = &v11[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView];
  *(void *)uint64_t v12 = v2;
  *((void *)v12 + 1) = v3;
  *((void *)v12 + 2) = v4;
  *((void *)v12 + 3) = v5;
  *((void *)v12 + 4) = v6;
  *((void *)v12 + 5) = v7;
  *((void *)v12 + 6) = v9;
  *((void *)v12 + 7) = v8;
  swift_retain();
  sub_10000DA20(v4);
  sub_10000DA20(v6);
  sub_10000DA20(v9);
  v15.receiver = v11;
  v15.super_class = v10;
  id result = objc_msgSendSuper2(&v15, "init");
  *a1 = result;
  return result;
}

uint64_t sub_1000141B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100015944();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100014218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100015944();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10001427C()
{
}

unint64_t sub_1000142A8()
{
  unint64_t result = qword_100033FF8;
  if (!qword_100033FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033FF8);
  }
  return result;
}

unint64_t sub_1000142FC(uint64_t a1, uint64_t a2)
{
  sub_10001FBB8();
  sub_10001F848();
  Swift::Int v4 = sub_10001FBC8();

  return sub_1000143B8(a1, a2, v4);
}

unint64_t sub_100014374(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10001FA88(*(void *)(v2 + 40));

  return sub_10001449C(a1, v4);
}

unint64_t sub_1000143B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10001FB88() & 1) == 0)
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
      while (!v14 && (sub_10001FB88() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10001449C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100016538(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10001FA98();
      sub_10000B8EC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_100014564(void *a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    unint64_t v4 = sub_1000142FC(0x644573776F6C6C61, 0xED0000676E697469);
    if (v5)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v4, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setAllowsEditing:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v6 = sub_1000142FC(0xD000000000000015, 0x8000000100025540);
    if (v7)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v6, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setAllowsCalendarPreview:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v8 = sub_1000142FC(0xD00000000000002CLL, 0x8000000100025560);
    if (v9)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v8, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setInlineDayViewRespectsSelectedCalendarsFilter:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v10 = sub_1000142FC(0x6976657250736369, 0xEA00000000007765);
    if (v11)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v10, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setICSPreview:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v12 = sub_1000142FC(0xD000000000000015, 0x8000000100025590);
    if (v13)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v12, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setAllowsInviteResponses:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v14 = sub_1000142FC(0xD00000000000001FLL, 0x80000001000255B0);
    if (v15)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v14, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setShowsAddToCalendarForICSPreview:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v16 = sub_1000142FC(0xD000000000000020, 0x80000001000255D0);
    if (v17)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v16, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setShowsUpdateCalendarForICSPreview:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v18 = sub_1000142FC(0xD000000000000018, 0x8000000100025600);
    if (v19)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v18, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setShowsDeleteForICSPreview:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v20 = sub_1000142FC(0x755373776F6C6C61, 0xEE00736D65746962);
    if (v21)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v20, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setAllowsSubitems:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v22 = sub_1000142FC(0x6E6F4473776F6873, 0xEF6E6F7474754265);
    if (v23)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v22, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setShowsDoneButton:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v24 = sub_1000142FC(0xD000000000000015, 0x8000000100025620);
    if (v25)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v24, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setShowsOutOfDateMessage:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v26 = sub_1000142FC(0xD000000000000015, 0x8000000100025640);
    if (v27)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v26, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setShowsDelegatorMessage:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v28 = sub_1000142FC(0xD000000000000014, 0x8000000100025660);
    if (v29)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v28, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setShowsDelegateMessage:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v30 = sub_1000142FC(0xD00000000000001BLL, 0x8000000100025680);
    if (v31)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v30, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setShowsDetectedConferenceItem:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v32 = sub_1000142FC(0x4D6C616D696E696DLL, 0xEB0000000065646FLL);
    if (v33)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v32, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setMinimalMode:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v34 = sub_1000142FC(0xD000000000000019, 0x80000001000256A0);
    if (v35)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v34, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setNoninteractivePlatterMode:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v36 = sub_1000142FC(0x44656772614C7369, 0xEE00776569567961);
    if (v37)
    {
      sub_10000B940(*(void *)(a2 + 56) + 32 * v36, (uint64_t)v39);
      sub_1000072B0(0, (unint64_t *)&unk_1000335D0);
      if (swift_dynamicCast())
      {
        objc_msgSend(a1, "setIsLargeDayView:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }
}

void sub_100015048(uint64_t a1)
{
  uint64_t v2 = sub_10000468C(&qword_1000335F0);
  __chkstk_darwin(v2 - 8);
  unint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  if (*(void *)(a1 + 64))
  {
    if (*(void *)(a1 + 72))
    {
      if (*(void *)(a1 + 80))
      {
        char v5 = *(void **)(a1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_viewController);
        if (v5)
        {
          char v6 = *(unsigned char *)(a1 + 40);
          id v21 = v5;
          if (v6)
          {
            sub_10001F908();
            sub_10001F588();
            id v7 = v21;

            return;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_10001F918();
          sub_10001F588();
          *(unsigned char *)(a1 + 40) = 1;
          unint64_t v8 = *(void **)(a1 + 16);
          id v9 = [objc_allocWithZone((Class)sub_10001F768()) init];
          uint64_t v20 = *(void *)(a1 + 24);
          uint64_t v10 = a1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventOccurrenceDate;
          swift_beginAccess();
          sub_10000E8AC(v10, (uint64_t)v4);
          char v11 = (void *)sub_10001F758();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_100015874((uint64_t)v4);
          if (v11)
          {
            id v12 = v11;
            char v13 = (void *)sub_10001F7B8();

            self;
            uint64_t v14 = swift_dynamicCastObjCClass();
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)(a1 + 24);
              uint64_t v17 = v20;
              if (v16 == 4 && ![v8 isCurrentProcessCreatorOfEvent:v14]) {
                uint64_t v17 = 2;
              }
              [v21 setEvent:v15];

              id v18 = v21;
              goto LABEL_23;
            }
          }
          sub_10001F908();
          sub_10001F588();
          uint64_t v17 = v20;
          id v18 = v21;
LABEL_23:
          [v18 setShouldOverrideAuthorizationStatus:1 withRemoteUIStatus:v17];

          return;
        }
      }
    }
  }
  sub_10001F918();

  sub_10001F588();
}

id sub_100015420(uint64_t a1, void *a2)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  id v3 = [objc_allocWithZone((Class)EKEventViewController) initWithRemoteUI:0];
  unint64_t v4 = *(void **)((char *)a2 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_viewController);
  *(void *)((char *)a2 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_viewController) = v3;
  id v5 = v3;

  sub_10000468C((uint64_t *)&unk_100034008);
  sub_10001F6A8();
  [v5 setDelegate:v19];

  sub_10001F6A8();
  [v5 setNavigationDelegate:v19];

  uint64_t v6 = a2[6];
  a2[6] = sub_100012BD4;
  a2[7] = 0;
  sub_1000047A0(v6);
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  unint64_t v8 = (void (**)())((char *)a2
                   + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_navigationDoneButtonTapCallback);
  uint64_t v9 = *(void *)((char *)a2
                 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_navigationDoneButtonTapCallback);
  *unint64_t v8 = sub_10001585C;
  v8[1] = (void (*)())v7;
  sub_1000047A0(v9);
  uint64_t v10 = swift_allocObject();
  swift_weakInit();
  char v11 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)a2
                                                                 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventEditViewCompletedCallback);
  uint64_t v12 = *(void *)((char *)a2
                  + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventEditViewCompletedCallback);
  *char v11 = sub_100015864;
  v11[1] = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v10;
  sub_1000047A0(v12);
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  uint64_t v14 = (uint64_t (**)(char))((char *)a2
                                      + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventEditViewPresentedCallback);
  uint64_t v15 = *(void *)((char *)a2
                  + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_eventEditViewPresentedCallback);
  char *v14 = sub_10001586C;
  v14[1] = (uint64_t (*)(char))v13;
  sub_1000047A0(v15);
  uint64_t v16 = *(void *)((char *)a2
                  + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_changedViewConfigurationDictionary);
  if (*(void *)(v16 + 16))
  {
    swift_bridgeObjectRetain();
    sub_100014564(v5, v16);
    swift_bridgeObjectRelease();
  }
  [v5 setShouldOverrideAuthorizationStatus:1 withRemoteUIStatus:a2[3]];
  uint64_t v17 = swift_retain();
  sub_100015048(v17);
  swift_release();
  return v5;
}

void sub_1000156B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_viewController);
  if (v2)
  {
    id v5 = v2;
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
    uint64_t v4 = *(void *)(a2
                   + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_changedViewConfigurationDictionary);
    if (*(void *)(v4 + 16))
    {
      swift_bridgeObjectRetain();
      sub_100014564(v5, v4);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_10001F908();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
  }
}

uint64_t sub_100015824()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001585C()
{
}

void sub_100015864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_10001586C(char a1)
{
  return sub_100012FEC(a1);
}

uint64_t sub_100015874(uint64_t a1)
{
  uint64_t v2 = sub_10000468C(&qword_1000335F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000158D4()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10001591C()
{
  sub_100012F34(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void **)(v0 + 48));
}

uint64_t sub_10001592C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001593C()
{
  return swift_release();
}

unint64_t sub_100015944()
{
  unint64_t result = qword_100034018;
  if (!qword_100034018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034018);
  }
  return result;
}

uint64_t sub_100015998()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000159D8()
{
  return (*(uint64_t (**)(void, void, uint64_t))(v0 + 16))(*(void *)(v0 + 32), *(void *)(v0 + 40), 1);
}

uint64_t sub_100015A0C(uint64_t a1)
{
  uint64_t v2 = *(void (**)(uint64_t))(v1
                                      + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView
                                      + 16);
  if (v2)
  {
    swift_retain();
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
    v2(a1);
    return sub_1000047A0((uint64_t)v2);
  }
  else
  {
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    return sub_10001F588();
  }
}

uint64_t sub_100015B74(void *a1)
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, void *, void *, void, id, id, id))(v1
                                                                                   + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView
                                                                                   + 32);
  if (v2)
  {
    id v3 = *(void **)(*(void *)(v1
                              + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView
                              + 8)
                  + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_viewController);
    if (v3)
    {
      swift_retain();
      id v5 = [v3 event];
      if (v5)
      {
        uint64_t v6 = v5;
        swift_getObjectType();
        sub_10000468C(&qword_100034038);
        uint64_t v7 = sub_10001F838();
        uint64_t v9 = v8;
        id v10 = [objc_allocWithZone((Class)NSValue) init];
        [a1 preferredContentSize];
        id v13 = objc_msgSend(self, "valueWithCGSize:", v11, v12);
        id v14 = objc_msgSend(a1, "EKUI_oopContentBackgroundColor");
        sub_10001F918();
        if (qword_100032C00 != -1) {
          swift_once();
        }
        sub_10001F588();
        v2(v7, v9, a1, v6, 0, v10, v13, v14);

        swift_bridgeObjectRelease();
        return sub_1000047A0((uint64_t)v2);
      }
    }
    else
    {
      swift_retain();
    }
    sub_10001F908();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
    return sub_1000047A0((uint64_t)v2);
  }
  else
  {
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    return sub_10001F588();
  }
}

void sub_100015EB8(void *a1)
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, void *, void *, uint64_t, id, id, id))(v1
                                                                                    + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView
                                                                                    + 32);
  if (v2)
  {
    id v3 = *(void **)(*(void *)(v1
                              + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView
                              + 8)
                  + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension16EKEventViewModel_viewController);
    if (v3)
    {
      swift_retain();
      id v5 = [v3 event];
      if (v5)
      {
        uint64_t v6 = v5;
        swift_getObjectType();
        sub_10000468C(&qword_100034038);
        uint64_t v7 = sub_10001F838();
        uint64_t v9 = v8;
        id v10 = objc_msgSend(a1, "EKUI_oopContentBackgroundColor");
        self;
        uint64_t v11 = swift_dynamicCastObjCClass();
        if (!v11)
        {
LABEL_26:
          id v21 = [objc_allocWithZone((Class)NSValue) init];
          [a1 preferredContentSize];
          id v24 = objc_msgSend(self, "valueWithCGSize:", v22, v23);
          sub_10001F918();
          if (qword_100032C00 != -1) {
            swift_once();
          }
          sub_10001F588();
          v2(v7, v9, a1, v6, 1, v21, v24, v10);
          sub_1000047A0((uint64_t)v2);

          swift_bridgeObjectRelease();
          return;
        }
        double v12 = (void *)v11;
        id v25 = a1;
        id v13 = [v12 viewControllers];
        sub_1000072B0(0, (unint64_t *)&unk_100034040);
        unint64_t v14 = sub_10001F888();

        if (v14 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v15 = sub_10001FB28();
          swift_bridgeObjectRelease();
          if (v15)
          {
LABEL_7:
            unint64_t v16 = v15 - 1;
            if (__OFSUB__(v15, 1))
            {
              __break(1u);
            }
            else if ((v14 & 0xC000000000000001) == 0)
            {
              if ((v16 & 0x8000000000000000) != 0)
              {
                __break(1u);
              }
              else if (v16 < *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
                id v17 = *(id *)(v14 + 8 * v16 + 32);
LABEL_12:
                id v18 = v17;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                id v19 = objc_msgSend(v18, "EKUI_oopContentBackgroundColor");

                swift_getObjectType();
                uint64_t v7 = sub_10001F838();
                uint64_t v9 = v20;

                id v10 = v19;
                goto LABEL_26;
              }
              __break(1u);
              return;
            }
            id v17 = (id)sub_10001FAF8();
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v15) {
            goto LABEL_7;
          }
        }

        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
    }
    else
    {
      swift_retain();
    }
    sub_10001F908();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
    sub_1000047A0((uint64_t)v2);
  }
  else
  {
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
  }
}

uint64_t sub_10001636C(void (*a1)(uint64_t))
{
  uint64_t v2 = *(void (**)(void, void, uint64_t))(v1
                                                      + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension11EKEventView20EventViewCoordinator_eventView
                                                      + 48);
  if (v2)
  {
    swift_retain();
    v2(0, 0, 1);
    if (a1)
    {
      uint64_t v4 = swift_retain();
      a1(v4);
      sub_1000047A0((uint64_t)v2);
      uint64_t v5 = (uint64_t)a1;
    }
    else
    {
      uint64_t v5 = (uint64_t)v2;
    }
    return sub_1000047A0(v5);
  }
  else
  {
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    return sub_10001F588();
  }
}

uint64_t sub_1000164A8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000164E0()
{
  return sub_1000199E4(*(void *)(v0 + 16));
}

uint64_t sub_1000164E8()
{
  return sub_1000128B8();
}

uint64_t sub_1000164F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100016538(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000165AC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100016614()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = *(void *)(*v0 + 80);
  uint64_t v4 = *(void *)(*v0 + 88);
  swift_retain_n();
  swift_bridgeObjectRetain();

  return PrimitiveAppExtensionScene.init<A>(id:content:onConnection:)(v1, v2, sub_100017B0C, v0, sub_100017B14, v0, v3, v4);
}

uint64_t sub_1000166DC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *(void *)(*a1 + 80);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(a1);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v13 - v8;
  (*(void (**)(void))(v7 + 32))();
  uint64_t v10 = *(void *)(v1 + 88);
  sub_100017C4C(v6, v2, v10);
  uint64_t v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  sub_100017C4C(v9, v2, v10);
  return ((uint64_t (*)(char *, uint64_t))v11)(v9, v2);
}

uint64_t sub_100016838(void *a1, uint64_t a2)
{
  os_log_type_t v3 = sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_100035F00;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v3))
  {
    id v5 = a1;
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 67109376;
    [v5 processIdentifier];
    sub_10001F9E8();
    *(_WORD *)(v6 + 8) = 1024;
    unsigned int v30 = [v5 effectiveUserIdentifier];
    sub_10001F9E8();

    _os_log_impl((void *)&_mh_execute_header, v4, v3, "EKCalendarChooserScene Starting: Setting up XPC connection. processIdentifier: %d. userIdentifier: %u.", (uint8_t *)v6, 0xEu);
    swift_slowDealloc();
  }
  uint64_t v7 = (void *)sub_10001F428();
  [a1 setExportedInterface:v7];

  uint64_t v8 = (void *)sub_10001F418();
  [a1 setRemoteObjectInterface:v8];

  uint64_t v9 = a2;
  [a1 setExportedObject:a2];
  unint64_t v28 = a1;
  [a1 auditToken];
  unsigned int v10 = v30;
  int v11 = v31;
  int v12 = v32;
  int v13 = v33;
  int v15 = v34;
  int v14 = v35;
  int v17 = v36;
  int v16 = v37;
  id v18 = objc_allocWithZone((Class)ClientIdentity);
  unsigned int v30 = v10;
  int v31 = v11;
  int v32 = v12;
  int v33 = v13;
  int v34 = v15;
  int v35 = v14;
  int v36 = v17;
  int v37 = v16;
  id v19 = [v18 initWithAuditToken:&v30];
  if (v19)
  {
    uint64_t v20 = *(void **)(a2 + 56);
    id v27 = v19;
    id v21 = self;
    unsigned int v30 = v10;
    int v31 = v11;
    int v32 = v12;
    int v33 = v13;
    int v34 = v15;
    int v35 = v14;
    int v36 = v17;
    int v37 = v16;
    v20[3] = [v21 authorizationStatusWithAuditToken:&v30 entityType:0];
    unsigned int v30 = v10;
    int v31 = v11;
    int v32 = v12;
    int v33 = v13;
    int v34 = v15;
    int v35 = v14;
    int v36 = v17;
    int v37 = v16;
    id v22 = [v21 authorizationStatusWithAuditToken:&v30 entityType:1];
    double v23 = (void *)v20[5];
    v20[4] = v22;
    v20[5] = v27;
    uint64_t v9 = a2;
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
    *(int64x2_t *)(*(void *)(a2 + 56) + 24) = vdupq_n_s64(1uLL);
  }
  id v24 = *(void **)(v9 + 48);
  *(void *)(v9 + 48) = v28;
  id v25 = v28;

  [v25 resume];
  return 1;
}

void sub_100016B3C(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5, uint64_t a6, unint64_t a7, char a8)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  int v12 = qword_100035F00;
  sub_10001F588();
  os_log_type_t v13 = sub_10001F918();
  if (os_log_type_enabled(v12, v13))
  {
    int v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int v14 = 134217984;
    uint64_t v41 = a2;
    sub_10001F9E8();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "EKCalendarChooserScene: layoutDirectionValue: %ld", v14, 0xCu);
    swift_slowDealloc();
  }
  int v15 = self;
  id v16 = [v15 shared];
  [v16 setLayoutDirectionOverride:a2];

  NSString v17 = sub_10001F7F8();
  os_log_type_t v18 = sub_10001F918();
  id v19 = qword_100035F00;
  os_log_type_t v20 = v18;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v18))
  {
    swift_bridgeObjectRetain_n();
    int v34 = a1;
    id v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    *(_DWORD *)id v21 = 136315138;
    swift_bridgeObjectRetain();
    sub_10001D408(a3, a4, &v41);
    sub_10001F9E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "EKCalendarChooserScene: sizeCategoryValue: %s", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  id v22 = objc_msgSend(v15, "shared", v34);
  [v22 setPreferredContentSizeCategoryOverride:v17];

  os_log_type_t v23 = sub_10001F918();
  id v24 = qword_100035F00;
  os_log_type_t v25 = v23;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v23))
  {
    NSString v35 = v17;
    id v26 = a1;
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 134218240;
    objc_msgSend(v26, "ekui_size");
    uint64_t v41 = v28;
    sub_10001F9E8();
    *(_WORD *)(v27 + 12) = 2048;
    objc_msgSend(v26, "ekui_size");
    uint64_t v41 = v29;
    sub_10001F9E8();

    NSString v17 = v35;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "EKCalendarChooserScene: viewHierarchy size: (%f, %f)", (uint8_t *)v27, 0x16u);
    swift_slowDealloc();
  }
  id v30 = objc_msgSend(v15, "shared", v35);
  [v30 setViewHierarchyOverride:a1];

  uint64_t v31 = *(void *)(v40 + 56);
  int v32 = *(void **)(v31 + 40);
  if (v32)
  {
    id v33 = v32;
    sub_10000EB18(v33, a5, a6, a7);
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
  }
  *(unsigned char *)(v31 + 48) = a8 & 1;
  if (*(void *)(v31 + 40))
  {
    objc_msgSend(*(id *)(v31 + 16), "setRemoteClientIdentity:");
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
  }
}

uint64_t sub_100017008(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, unsigned int a6, unint64_t a7, char a8)
{
  uint64_t v13 = sub_10001F828();
  unint64_t v15 = v14;
  if (a7)
  {
    uint64_t v16 = sub_10001F828();
    a7 = v17;
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v18 = a3;
  swift_retain();
  sub_100016B3C(v18, a4, v13, v15, a6, v16, a7, a8);

  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000170E4(uint64_t a1)
{
  uint64_t v3 = sub_10001F728();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10001F748();
  uint64_t v7 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000045F4();
  unsigned int v10 = (void *)sub_10001F948();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = a1;
  aBlock[4] = sub_100017AE4;
  void aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = &unk_10002D9D0;
  int v12 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100006FCC();
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  sub_10001FA18();
  sub_10001F968();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v15);
}

uint64_t sub_100017370()
{
  uint64_t v0 = sub_10001F7E8();
  swift_retain();
  sub_1000170E4(v0);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000173E8()
{
  uint64_t v1 = sub_10001F728();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001F748();
  uint64_t v5 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F908();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  sub_1000045F4();
  uint64_t v8 = (void *)sub_10001F948();
  aBlock[4] = sub_100017A44;
  void aBlock[5] = v0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = &unk_10002D930;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100006FCC();
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  sub_10001FA18();
  sub_10001F968();
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v12);
}

uint64_t sub_1000176B4(uint64_t a1)
{
  uint64_t v2 = sub_10001F728();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001F748();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = __chkstk_darwin(v6);
  unsigned int v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void **)(*(void *)(a1 + 56) + 56);
  if (v11)
  {
    uint64_t v18 = result;
    sub_1000045F4();
    id v12 = v11;
    uint64_t v13 = (void *)sub_10001F948();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v12;
    aBlock[4] = sub_100017A9C;
    void aBlock[5] = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100012454;
    aBlock[3] = &unk_10002D980;
    uint64_t v15 = _Block_copy(aBlock);
    id v16 = v12;
    swift_release();
    sub_10001F738();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100006FCC();
    sub_10000468C((uint64_t *)&unk_100033650);
    sub_1000046D0();
    sub_10001FA18();
    sub_10001F968();
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v18);
  }
  return result;
}

uint64_t sub_10001794C()
{
  swift_retain();
  sub_1000173E8();

  return swift_release();
}

uint64_t type metadata accessor for EKCalendarChooserScene()
{
  return sub_100004C08();
}

uint64_t sub_1000179A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000179E4()
{
  return sub_100016614();
}

uint64_t sub_100017A08(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100017A44()
{
  return sub_1000176B4(v0);
}

uint64_t sub_100017A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100017A5C()
{
  return swift_release();
}

uint64_t sub_100017A64()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100017A9C()
{
  return sub_10000F944(*(void **)(v0 + 16));
}

uint64_t sub_100017AA4()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100017AE4()
{
  return sub_10000EF9C(*(void *)(v0 + 24));
}

uint64_t sub_100017B0C()
{
  return sub_1000166DC(v0);
}

uint64_t sub_100017B14(void *a1)
{
  return sub_100016838(a1, v1);
}

void *sub_100017B1C()
{
  return &protocol witness table for PrimitiveAppExtensionScene;
}

uint64_t sub_100017B38()
{
  sub_100017BA4();
  uint64_t result = sub_10001F9C8();
  qword_100035F00 = result;
  return result;
}

unint64_t sub_100017BA4()
{
  unint64_t result = qword_100034250;
  if (!qword_100034250)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100034250);
  }
  return result;
}

uint64_t sub_100017BE4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100017C50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_100017C88()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = *(void *)(*v0 + 80);
  uint64_t v4 = *(void *)(*v0 + 88);
  swift_retain_n();
  swift_bridgeObjectRetain();

  return PrimitiveAppExtensionScene.init<A>(id:content:onConnection:)(v1, v2, sub_1000198E4, v0, sub_1000198EC, v0, v3, v4);
}

uint64_t sub_100017D50@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(a1);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  unsigned int v10 = (char *)&v14 - v9;
  (*(void (**)(void))(v8 + 32))();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v11(v10, v7, v3);
  id v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, v3);
  v11(a2, v10, v3);
  return ((uint64_t (*)(char *, uint64_t))v12)(v10, v3);
}

uint64_t sub_100017EA0(void *a1, uint64_t a2)
{
  os_log_type_t v4 = sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_100035F00;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v4))
  {
    id v6 = a1;
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109376;
    [v6 processIdentifier];
    sub_10001F9E8();
    *(_WORD *)(v7 + 8) = 1024;
    unsigned int v29 = [v6 effectiveUserIdentifier];
    sub_10001F9E8();

    _os_log_impl((void *)&_mh_execute_header, v5, v4, "EKEventEditScene Starting: Setting up XPC connection. processIdentifier: %d. userIdentifier: %u.", (uint8_t *)v7, 0xEu);
    swift_slowDealloc();
  }
  uint64_t v8 = (void *)sub_10001F408();
  [a1 setExportedInterface:v8];

  uint64_t v9 = (void *)sub_10001F3F8();
  [a1 setRemoteObjectInterface:v9];

  [a1 setExportedObject:a2];
  [a1 auditToken];
  unsigned int v10 = v29;
  int v11 = v30;
  int v12 = v31;
  int v13 = v32;
  int v14 = v33;
  int v15 = v34;
  uint64_t v28 = a2;
  int v17 = v35;
  int v16 = v36;
  id v18 = objc_allocWithZone((Class)ClientIdentity);
  unsigned int v29 = v10;
  int v30 = v11;
  int v31 = v12;
  int v32 = v13;
  int v33 = v14;
  int v34 = v15;
  int v35 = v17;
  int v36 = v16;
  id v19 = [v18 initWithAuditToken:&v29];
  if (v19)
  {
    id v20 = v19;
    id v21 = self;
    unsigned int v29 = v10;
    int v30 = v11;
    int v31 = v12;
    int v32 = v13;
    int v33 = v14;
    int v34 = v15;
    int v35 = v17;
    int v36 = v16;
    id v22 = [v21 authorizationStatusWithAuditToken:&v29 entityType:0];
    uint64_t v23 = *(void *)(v28 + 56);
    id v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 32) = v22;
    *(void *)(v23 + 40) = v20;
  }
  else
  {
    sub_10001F908();
    sub_10001F588();
    *(void *)(*(void *)(v28 + 56) + 32) = 1;
  }
  os_log_type_t v25 = *(void **)(v28 + 48);
  *(void *)(v28 + 48) = a1;
  id v26 = a1;

  [v26 resume];
  return 1;
}

void sub_10001816C(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5, uint64_t a6, unint64_t a7)
{
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  int v11 = qword_100035F00;
  sub_10001F588();
  os_log_type_t v12 = sub_10001F918();
  if (os_log_type_enabled(v11, v12))
  {
    int v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int v13 = 134217984;
    uint64_t v37 = a2;
    sub_10001F9E8();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "EKEventEditScene: layoutDirectionValue: %ld", v13, 0xCu);
    swift_slowDealloc();
  }
  int v14 = self;
  id v15 = [v14 shared];
  [v15 setLayoutDirectionOverride:a2];

  NSString v16 = sub_10001F7F8();
  os_log_type_t v17 = sub_10001F918();
  id v18 = qword_100035F00;
  os_log_type_t v19 = v17;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v17))
  {
    swift_bridgeObjectRetain_n();
    id v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)id v20 = 136315138;
    swift_bridgeObjectRetain();
    sub_10001D408(a3, a4, &v37);
    sub_10001F9E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "EKEventEditScene: sizeCategoryValue: %s", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  id v21 = [v14 shared];
  [v21 setPreferredContentSizeCategoryOverride:v16];

  os_log_type_t v22 = sub_10001F918();
  uint64_t v23 = qword_100035F00;
  os_log_type_t v24 = v22;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v22))
  {
    id v25 = a1;
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 134218240;
    objc_msgSend(v25, "ekui_size");
    uint64_t v37 = v27;
    sub_10001F9E8();
    *(_WORD *)(v26 + 12) = 2048;
    objc_msgSend(v25, "ekui_size");
    uint64_t v37 = v28;
    sub_10001F9E8();

    _os_log_impl((void *)&_mh_execute_header, v23, v24, "EKEventEditScene: viewHierarchy size: (%f, %f)", (uint8_t *)v26, 0x16u);
    swift_slowDealloc();
  }
  id v29 = [v14 shared];
  [v29 setViewHierarchyOverride:a1];

  uint64_t v30 = *(void *)(v36 + 56);
  int v31 = *(void **)(v30 + 40);
  if (!v31)
  {
    sub_10001F908();
    sub_10001F588();
    if (*(void *)(v30 + 40)) {
      goto LABEL_11;
    }
LABEL_13:
    sub_10001F908();
    sub_10001F588();
    goto LABEL_14;
  }
  id v32 = v31;
  sub_10000EB18(v32, a5, a6, a7);

  if (!*(void *)(v30 + 40)) {
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(*(id *)(v30 + 16), "setRemoteClientIdentity:");
LABEL_14:
}

uint64_t sub_100018624(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, unsigned int a6, unint64_t a7)
{
  uint64_t v11 = sub_10001F828();
  unint64_t v13 = v12;
  if (a7)
  {
    uint64_t v14 = sub_10001F828();
    a7 = v15;
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v16 = a3;
  swift_retain();
  sub_10001816C(v16, a4, v11, v13, a6, v14, a7);

  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000186F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  uint64_t v8 = *v4;
  uint64_t v9 = sub_10001F728();
  uint64_t v32 = *(void *)(v9 - 8);
  uint64_t v33 = v9;
  __chkstk_darwin(v9);
  uint64_t v27 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10001F748();
  uint64_t v30 = *(void *)(v11 - 8);
  uint64_t v31 = v11;
  __chkstk_darwin(v11);
  unint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10001F4E8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  __chkstk_darwin(v14);
  os_log_type_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  sub_1000072B0(0, (unint64_t *)&qword_100033640);
  uint64_t v26 = sub_10001F948();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v14);
  unint64_t v18 = (*(unsigned __int8 *)(v15 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  os_log_type_t v19 = (char *)swift_allocObject();
  *((void *)v19 + 2) = *(void *)(v8 + 80);
  *((void *)v19 + 3) = *(void *)(v8 + 88);
  *((void *)v19 + 4) = v5;
  *((void *)v19 + 5) = a1;
  uint64_t v20 = v29;
  *((void *)v19 + 6) = v28;
  *((void *)v19 + 7) = v20;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v19[v18], v17, v14);
  aBlock[4] = sub_10001987C;
  void aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = &unk_10002DBD8;
  id v21 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100006FCC();
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  os_log_type_t v22 = v27;
  uint64_t v23 = v33;
  sub_10001FA18();
  os_log_type_t v24 = (void *)v26;
  sub_10001F968();
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v13, v31);
}

uint64_t sub_100018B1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_10000468C(&qword_1000335F0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  unint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v16 = *(void **)(a1 + 56);
  v16[10] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16[11] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16[12] = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_10001F4E8();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v15, a5, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  sub_1000071D0((uint64_t)v15, (uint64_t)v13);
  uint64_t v19 = (uint64_t)v16 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_eventOccurrenceDate;
  swift_beginAccess();
  sub_100007238((uint64_t)v13, v19);
  uint64_t result = swift_endAccess();
  id v21 = (void (*)(void *))v16[7];
  if (v21)
  {
    swift_retain();
    v21(v16);
    return sub_1000047A0((uint64_t)v21);
  }
  return result;
}

uint64_t sub_100018D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v14[1] = a6;
  uint64_t v6 = sub_10001F4E8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10001F7E8();
  sub_1000072B0(0, &qword_100032FF0);
  sub_10000468C(&qword_100033630);
  sub_1000072EC();
  uint64_t v11 = sub_10001F7E8();
  uint64_t v12 = sub_10001F7E8();
  sub_10001F4D8();
  swift_retain();
  sub_1000186F0(v10, v11, v12, (uint64_t)v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_100018EC4(uint64_t a1)
{
  uint64_t v3 = sub_10001F728();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10001F748();
  uint64_t v7 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000072B0(0, (unint64_t *)&qword_100033640);
  uint64_t v10 = (void *)sub_10001F948();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = a1;
  aBlock[4] = sub_100019770;
  void aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = &unk_10002DB88;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100006FCC();
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  sub_10001FA18();
  sub_10001F968();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v15);
}

uint64_t sub_100019160()
{
  uint64_t v0 = sub_10001F7E8();
  swift_retain();
  sub_100018EC4(v0);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000191D8()
{
  return sub_1000192D8((uint64_t)sub_10001971C, (uint64_t)&unk_10002DB38);
}

uint64_t sub_1000191F8(uint64_t a1, uint64_t a2)
{
  return sub_1000195C8(a1, a2, (void (*)(uint64_t))sub_1000191D8);
}

uint64_t sub_100019210()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 56)
                                         + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension20EKEventEditViewModel_getHasUnsavedChangesAction);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = swift_retain();
  char v3 = v1(v2);
  sub_1000047A0((uint64_t)v1);
  return v3 & 1;
}

uint64_t sub_100019280()
{
  swift_retain();
  char v0 = sub_100019210();
  swift_release();
  return v0 & 1;
}

uint64_t sub_1000192B8()
{
  return sub_1000192D8((uint64_t)sub_100019708, (uint64_t)&unk_10002DB10);
}

uint64_t sub_1000192D8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_10001F728();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10001F748();
  uint64_t v9 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000072B0(0, (unint64_t *)&qword_100033640);
  uint64_t v12 = (void *)sub_10001F948();
  aBlock[4] = a1;
  uint64_t v18 = v2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012454;
  aBlock[3] = a2;
  unint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_10001F738();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100006FCC();
  sub_10000468C((uint64_t *)&unk_100033650);
  sub_1000046D0();
  sub_10001FA18();
  sub_10001F968();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v16);
}

uint64_t sub_100019540(uint64_t a1, uint64_t a2)
{
  return sub_1000195C8(a1, a2, (void (*)(uint64_t))sub_1000192B8);
}

uint64_t sub_100019558()
{
  return sub_1000192D8((uint64_t)sub_1000196F4, (uint64_t)&unk_10002DAE8);
}

uint64_t sub_100019578(uint64_t a1, uint64_t a2)
{
  return sub_1000195C8(a1, a2, (void (*)(uint64_t))sub_100019558);
}

uint64_t sub_100019590()
{
  return sub_1000192D8((uint64_t)sub_1000196C8, (uint64_t)&unk_10002DAC0);
}

uint64_t sub_1000195B0(uint64_t a1, uint64_t a2)
{
  return sub_1000195C8(a1, a2, (void (*)(uint64_t))sub_100019590);
}

uint64_t sub_1000195C8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = swift_retain();
  a3(v4);

  return swift_release();
}

uint64_t type metadata accessor for EKEventEditScene()
{
  return sub_100004C08();
}

uint64_t sub_100019624()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100019668()
{
  return sub_100017C88();
}

uint64_t sub_10001968C(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

id sub_1000196C8()
{
  return [*(id *)(*(void *)(v0 + 56) + 72) focusTitle];
}

uint64_t sub_1000196DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000196EC()
{
  return swift_release();
}

id sub_1000196F4()
{
  return [*(id *)(*(void *)(v0 + 56) + 72) focusAndSelectStartDate];
}

id sub_100019708()
{
  return [*(id *)(*(void *)(v0 + 56) + 72) focusAndSelectTitle];
}

id sub_10001971C()
{
  return [*(id *)(*(void *)(v0 + 56) + 72) cancelEditing];
}

uint64_t sub_100019730()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100019770()
{
  return sub_10000BCF0(*(void *)(v0 + 24));
}

uint64_t sub_100019798()
{
  uint64_t v1 = sub_10001F4E8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001987C()
{
  uint64_t v1 = *(void *)(sub_10001F4E8() - 8);
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = (uint64_t)v0 + ((*(unsigned __int8 *)(v1 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_100018B1C(v2, v3, v4, v5, v6);
}

uint64_t sub_1000198E4@<X0>(char *a1@<X8>)
{
  return sub_100017D50(v1, a1);
}

uint64_t sub_1000198EC(void *a1)
{
  return sub_100017EA0(a1, v1);
}

void *sub_1000198F4()
{
  return &protocol witness table for PrimitiveAppExtensionScene;
}

uint64_t sub_100019928(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = *(void (**)(void *, uint64_t, uint64_t, void *))(a1 + 32);
  if (a4) {
    uint64_t v9 = sub_10001F888();
  }
  else {
    uint64_t v9 = 0;
  }
  swift_retain();
  id v10 = a2;
  id v11 = a5;
  v8(a2, a3, v9, a5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000199E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_1000199F0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10001F5C8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100019A64(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v27 = a7;
  uint64_t v28 = a8;
  uint64_t v26 = a6;
  uint64_t v14 = sub_10000468C(&qword_100034778);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  uint64_t v18 = v8 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel__viewController;
  uint64_t v29 = 0;
  sub_10000468C((uint64_t *)&unk_1000343A8);
  sub_10001F5B8();
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v18, v17, v14);
  *(void *)(v8 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_event) = 0;
  uint64_t v19 = (void *)(v8
                 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_leftBarButtonTapCallback);
  *uint64_t v19 = 0;
  v19[1] = 0;
  uint64_t v20 = (void *)(v8
                 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_rightBarButtonTapCallback);
  *uint64_t v20 = 0;
  v20[1] = 0;
  id v21 = (void *)(v8
                 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_bottomStatusButtonTapCallback);
  *id v21 = 0;
  v21[1] = 0;
  *(unsigned char *)(v8 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_viewAppearedSetupFinished) = 0;
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_remotePresentViewMap) = a2;
  *(void *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = a4;
  id v22 = a1;
  swift_bridgeObjectRelease();
  uint64_t v23 = v26;
  *(void *)(v8 + 40) = a5;
  *(void *)(v8 + 48) = v23;
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v29 = v27;
  swift_retain();
  sub_10001F5D8();

  os_log_type_t v24 = *(void **)(v8 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_event);
  *(void *)(v8 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_event) = v28;

  return v8;
}

uint64_t sub_100019C74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10001F728();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10001F748();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(v2
                  + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_remotePresentViewMap);
  if (*(void *)(v15 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v16 = sub_1000142FC(a1, a2);
    if (v17)
    {
      uint64_t v18 = (char *)*(id *)(*(void *)(v15 + 56) + 8 * v16);
      swift_bridgeObjectRelease();
      uint64_t v19 = *(void *)&v18[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_viewName + 8];
      *(void *)(v3 + 40) = *(void *)&v18[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_viewName];
      *(void *)(v3 + 48) = v19;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v28 = v7;
      uint64_t v20 = *(void **)&v18[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_viewController];
      swift_getKeyPath();
      swift_getKeyPath();
      aBlock[0] = v20;
      id v21 = v20;
      swift_retain();
      sub_10001F5D8();
      id v22 = *(void **)&v18[OBJC_IVAR____TtC27EventKitUIRemoteUIExtension25EKUIRemotePresentViewData_event];
      uint64_t v23 = *(void **)(v3 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_event);
      *(void *)(v3 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_event) = v22;
      id v24 = v22;

      sub_1000072B0(0, (unint64_t *)&qword_100033640);
      id v25 = (void *)sub_10001F948();
      aBlock[4] = sub_10001EC48;
      void aBlock[5] = v3;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100012454;
      aBlock[3] = &unk_10002DEC0;
      uint64_t v26 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      sub_10001F738();
      aBlock[0] = &_swiftEmptyArrayStorage;
      sub_10001EC50((unint64_t *)&qword_100033C10, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_10000468C((uint64_t *)&unk_100033650);
      sub_1000046D0();
      sub_10001FA18();
      sub_10001F968();
      _Block_release(v26);

      (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v6);
      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_10001A064()
{
  type metadata accessor for EKEventGenericDetailViewModel();
  sub_10001EC50(&qword_100034770, (void (*)(uint64_t))type metadata accessor for EKEventGenericDetailViewModel);
  sub_10001F598();
  sub_10001F5A8();

  return swift_release();
}

uint64_t sub_10001A0EC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel__viewController;
  uint64_t v2 = sub_10000468C(&qword_100034778);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  sub_1000047A0(*(void *)(v0
                          + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_leftBarButtonTapCallback));
  sub_1000047A0(*(void *)(v0
                          + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_rightBarButtonTapCallback));
  sub_1000047A0(*(void *)(v0
                          + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_bottomStatusButtonTapCallback));
  return v0;
}

uint64_t sub_10001A1C8()
{
  sub_10001A0EC();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10001A220()
{
  return type metadata accessor for EKEventGenericDetailViewModel();
}

uint64_t type metadata accessor for EKEventGenericDetailViewModel()
{
  uint64_t result = qword_100034390;
  if (!qword_100034390) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001A274()
{
  sub_10001A348();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10001A348()
{
  if (!qword_1000343A0)
  {
    sub_10000472C((uint64_t *)&unk_1000343A8);
    unint64_t v0 = sub_10001F5E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000343A0);
    }
  }
}

uint64_t sub_10001A3A4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for EKEventGenericDetailViewModel();
  uint64_t result = sub_10001F598();
  *a1 = result;
  return result;
}

double sub_10001A3E4@<D0>(uint64_t a1@<X8>)
{
  v26[0] = *(_OWORD *)v1;
  if (*(void *)(*((void *)&v26[0] + 1) + 32))
  {
    type metadata accessor for EKEventGenericDetailViewModel();
    sub_10001EC50(&qword_100034770, (void (*)(uint64_t))type metadata accessor for EKEventGenericDetailViewModel);
    swift_retain();
    sub_10001F5F8();
    uint64_t v3 = *(void *)(v1 + 16);
    uint64_t v4 = *(void *)(v1 + 32);
    uint64_t v19 = *(void *)(v1 + 64);
    uint64_t v18 = *(void *)(v1 + 48);
    uint64_t v5 = (_OWORD *)swift_allocObject();
    long long v6 = *(_OWORD *)(v1 + 48);
    v5[3] = *(_OWORD *)(v1 + 32);
    v5[4] = v6;
    v5[5] = *(_OWORD *)(v1 + 64);
    long long v7 = *(_OWORD *)(v1 + 16);
    v5[1] = *(_OWORD *)v1;
    v5[2] = v7;
    uint64_t v8 = (_OWORD *)swift_allocObject();
    long long v9 = *(_OWORD *)(v1 + 48);
    v8[3] = *(_OWORD *)(v1 + 32);
    v8[4] = v9;
    v8[5] = *(_OWORD *)(v1 + 64);
    long long v10 = *(_OWORD *)(v1 + 16);
    v8[1] = *(_OWORD *)v1;
    v8[2] = v10;
    uint64_t v11 = (_OWORD *)swift_allocObject();
    long long v12 = *(_OWORD *)(v1 + 48);
    v11[3] = *(_OWORD *)(v1 + 32);
    v11[4] = v12;
    v11[5] = *(_OWORD *)(v1 + 64);
    long long v13 = *(_OWORD *)(v1 + 16);
    v11[1] = *(_OWORD *)v1;
    v11[2] = v13;
    uint64_t v14 = (_OWORD *)swift_allocObject();
    long long v15 = *(_OWORD *)(v1 + 48);
    v14[3] = *(_OWORD *)(v1 + 32);
    v14[4] = v15;
    v14[5] = *(_OWORD *)(v1 + 64);
    long long v16 = *(_OWORD *)(v1 + 16);
    v14[1] = *(_OWORD *)v1;
    void v14[2] = v16;
    sub_1000123A0((uint64_t)v26);
    sub_10000DA20(v3);
    sub_10000DA20(v4);
    sub_10000DA20(v18);
    sub_10000DA20(v19);
    sub_1000123A0((uint64_t)v26);
    sub_10000DA20(v3);
    sub_10000DA20(v4);
    sub_10000DA20(v18);
    sub_10000DA20(v19);
    sub_1000123A0((uint64_t)v26);
    sub_10000DA20(v3);
    sub_10000DA20(v4);
    sub_10000DA20(v18);
    sub_10000DA20(v19);
    sub_1000123A0((uint64_t)v26);
    sub_10000DA20(v3);
    sub_10000DA20(v4);
    sub_10000DA20(v18);
    sub_10000DA20(v19);
  }
  sub_10001D2BC();
  sub_10001F618();
  double result = *(double *)&v20;
  *(_OWORD *)a1 = v20;
  *(_OWORD *)(a1 + 16) = v21;
  *(_OWORD *)(a1 + 32) = v22;
  *(_OWORD *)(a1 + 48) = v23;
  *(_OWORD *)(a1 + 64) = v24;
  *(unsigned char *)(a1 + 80) = v25;
  return result;
}

uint64_t sub_10001A72C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  long long v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 16);
  if (v6)
  {
    uint64_t v11 = result;
    swift_retain();
    v6(v11, a2, a3, a4, a5);
    return sub_1000047A0((uint64_t)v6);
  }
  return result;
}

uint64_t sub_10001A7D8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 32);
  if (v4)
  {
    uint64_t v7 = result;
    swift_retain();
    v4(v7, a2, a3);
    return sub_1000047A0((uint64_t)v4);
  }
  return result;
}

uint64_t sub_10001A868(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(a3 + 48);
  if (v3)
  {
    uint64_t v5 = result;
    swift_retain();
    v3(v5, a2);
    return sub_1000047A0((uint64_t)v3);
  }
  return result;
}

uint64_t sub_10001A8E4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void (**)(uint64_t))(a2 + 64);
  if (v2)
  {
    uint64_t v3 = result;
    swift_retain();
    v2(v3);
    return sub_1000047A0((uint64_t)v2);
  }
  return result;
}

uint64_t sub_10001A95C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, const char *a5, void (*a6)(void, void, void))
{
  os_log_type_t v9 = sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  long long v10 = qword_100035F00;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v9))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v14 = a6;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    v17[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    long long v16 = (void *)sub_10001D408(a1, a2, v17);
    sub_10001F9E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v10, v9, a5, v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a6 = v14;
    swift_slowDealloc();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v13 = result;
    sub_10000468C(&qword_100034678);
    sub_10001F6A8();
    a6(v13, a1, a2);

    return swift_release();
  }
  return result;
}

uint64_t sub_10001AB50(void *a1)
{
  os_log_type_t v2 = sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_100035F00;
  if (os_log_type_enabled((os_log_t)qword_100035F00, v2))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134217984;
    sub_10001F9E8();
    _os_log_impl((void *)&_mh_execute_header, v3, v2, "EKEventGenericDetailView: bottomStatusButton tapped. buttonAction: %ld", v4, 0xCu);
    swift_slowDealloc();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v6 = result;
    sub_10000468C(&qword_100034678);
    sub_10001F6A8();
    sub_10001BE64(v6, a1);

    return swift_release();
  }
  return result;
}

void sub_10001ACB0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *(void (**)(void, unint64_t, void))(v3
                                                               + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                                                               + 32);
  if (v6)
  {
    sub_10001F3C8();
    swift_retain();
    if (sub_10001F3B8() == a2 && v7 == a3)
    {
      swift_bridgeObjectRelease();
LABEL_10:
      swift_getKeyPath();
      swift_getKeyPath();
      sub_10001F5C8();
      swift_release();
      swift_release();
      id v12 = v18;
      if (v18)
      {
        self;
        uint64_t v13 = (void *)swift_dynamicCastObjCClass();
        if (v13)
        {
          [v13 saveAndDismissWithPrompt];
LABEL_21:
          sub_1000047A0((uint64_t)v6);

          return;
        }
      }
      swift_getKeyPath();
      swift_getKeyPath();
      sub_10001F5C8();
      swift_release();
      swift_release();
      id v12 = v18;
      if (v18)
      {
        self;
        char v17 = (void *)swift_dynamicCastObjCClass();
        if (v17)
        {
          [v17 doneButtonTapped];
          goto LABEL_21;
        }
      }
      v6(0, 0xE000000000000000, 0);
      goto LABEL_27;
    }
    char v11 = sub_10001FB88();
    swift_bridgeObjectRelease();
    if (v11) {
      goto LABEL_10;
    }
    os_log_type_t v14 = sub_10001F908();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    long long v15 = qword_100035F00;
    if (os_log_type_enabled((os_log_t)qword_100035F00, v14))
    {
      swift_bridgeObjectRetain_n();
      long long v16 = (uint8_t *)swift_slowAlloc();
      id v18 = (id)swift_slowAlloc();
      *(_DWORD *)long long v16 = 136315138;
      swift_bridgeObjectRetain();
      sub_10001D408(a2, a3, (uint64_t *)&v18);
      sub_10001F9E8();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v15, v14, "EventGenericDetailViewCoordinator: The button action <%s> is not implemented!", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
LABEL_27:
      sub_1000047A0((uint64_t)v6);
      return;
    }
    sub_1000047A0((uint64_t)v6);
  }
  else
  {
    os_log_type_t v8 = sub_10001F908();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    os_log_type_t v9 = qword_100035F00;
    if (os_log_type_enabled((os_log_t)qword_100035F00, v8))
    {
      swift_bridgeObjectRetain_n();
      long long v10 = (uint8_t *)swift_slowAlloc();
      id v18 = (id)swift_slowAlloc();
      *(_DWORD *)long long v10 = 136315138;
      swift_bridgeObjectRetain();
      sub_10001D408(a2, a3, (uint64_t *)&v18);
      sub_10001F9E8();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v9, v8, "EventGenericDetailViewCoordinator: onRequestDismissViewAction not set on the EKEventGenericDetailView when button tapped for action: %s", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
}

uint64_t sub_10001B150(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = v3
     + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, id, void *, uint64_t))(v3
                                                                    + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                                                                    + 16);
  if (v7)
  {
    uint64_t v8 = *(void *)(v6 + 32);
    if (v8)
    {
      uint64_t v9 = *(void *)(v6 + 40);
      long long v10 = *(void **)(a1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_event);
      if (v10)
      {
        uint64_t v11 = swift_allocObject();
        *(void *)(v11 + 16) = 0;
        *(void *)(v11 + 24) = 0xE000000000000000;
        sub_10001F3C8();
        sub_10000DA20((uint64_t)v7);
        uint64_t v63 = v9;
        sub_10000DA20(v8);
        id v62 = v10;
        if (sub_10001F398() == a2 && v12 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_22:
          long long v21 = v62;
          id v22 = [v62 displayNotes];
          if (v22)
          {
            long long v23 = v22;
            uint64_t v24 = sub_10001F828();
            unint64_t v26 = v25;
          }
          else
          {
            uint64_t v24 = 0;
            unint64_t v26 = 0xE000000000000000;
          }
          sub_10000468C((uint64_t *)&unk_100034760);
          uint64_t v27 = swift_allocObject();
          *(_OWORD *)(v27 + 16) = xmmword_100021280;
          *(void *)(v27 + 56) = &type metadata for String;
          *(void *)(v27 + 32) = v24;
          *(void *)(v27 + 40) = v26;
          id v28 = objc_allocWithZone((Class)UIActivityViewController);
          Class isa = sub_10001F878().super.isa;
          swift_bridgeObjectRelease();
          id v30 = [v28 initWithActivityItems:isa applicationActivities:0];

          uint64_t result = (uint64_t)[v62 calendar];
          if (!result)
          {
            __break(1u);
            return result;
          }
          uint64_t v31 = (void *)result;
          id v32 = [(id)result isManaged];

          [v30 setIsContentManaged:v32];
          [v30 setAllowsEmbedding:1];
          uint64_t v33 = (void *)swift_allocObject();
          v33[2] = v8;
          uint64_t v33[3] = v63;
          v33[4] = v11;
          v68 = sub_10001E470;
          v69 = v33;
          uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
          uint64_t v65 = 1107296256;
          v66 = sub_100019928;
          id v67 = &unk_10002DE48;
          int v34 = _Block_copy(&aBlock);
          sub_10000DA20(v8);
          swift_retain();
          swift_release();
          [v30 setCompletionWithItemsHandler:v34];
          _Block_release(v34);
          id v35 = [v30 sheetPresentationController];
          if (v35)
          {
            uint64_t v36 = v35;
            sub_10000468C(&qword_100034028);
            uint64_t v37 = swift_allocObject();
            *(_OWORD *)(v37 + 16) = xmmword_100021290;
            *(void *)(v37 + 32) = [self largeDetent];
            uint64_t aBlock = v37;
            sub_10001F898();
            sub_1000072B0(0, &qword_100034030);
            Class v38 = sub_10001F878().super.isa;
            swift_bridgeObjectRelease();
            [v36 setDetents:v38];
          }
          uint64_t aBlock = sub_10000468C((uint64_t *)&unk_1000343A8);
          sub_10000468C(&qword_100034750);
          uint64_t v39 = sub_10001F838();
          uint64_t v41 = v40;
          uint64_t v42 = 1;
          swift_beginAccess();
          *(void *)(v11 + 16) = v39;
          *(void *)(v11 + 24) = v41;
          swift_bridgeObjectRelease();
          goto LABEL_29;
        }
        char v20 = sub_10001FB88();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_22;
        }
        if (sub_10001F3A8() == a2 && v46 == a3)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v47 = sub_10001FB88();
          swift_bridgeObjectRelease();
          if ((v47 & 1) == 0)
          {
            os_log_type_t v59 = sub_10001F908();
            if (qword_100032C00 != -1) {
              swift_once();
            }
            unint64_t v60 = qword_100035F00;
            if (os_log_type_enabled((os_log_t)qword_100035F00, v59))
            {
              swift_bridgeObjectRetain_n();
              uint64_t v61 = (uint8_t *)swift_slowAlloc();
              uint64_t aBlock = swift_slowAlloc();
              *(_DWORD *)uint64_t v61 = 136315138;
              swift_bridgeObjectRetain();
              sub_10001D408(a2, a3, &aBlock);
              sub_10001F9E8();
              swift_bridgeObjectRelease_n();
              _os_log_impl((void *)&_mh_execute_header, v60, v59, "EventGenericDetailViewCoordinator: The button action <%s> is not implemented!", v61, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
LABEL_45:
            sub_10001F908();
            if (qword_100032C00 != -1) {
              swift_once();
            }
            sub_10001F588();

            sub_1000047A0(v8);
            sub_1000047A0((uint64_t)v7);
            return swift_release();
          }
        }
        id v48 = [objc_allocWithZone((Class)EKUIEmailCompositionManager) initWithEvent:v62];
        uint64_t v49 = *(void **)(v3
                       + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_messageSendingManager);
        *(void *)(v3
                  + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_messageSendingManager) = v48;
        id v50 = v48;

        id v51 = [v50 viewController];
        if (v51)
        {
          unint64_t v52 = v51;
          [v51 setModalPresentationStyle:2];
        }
        id v30 = [v50 viewController];
        uint64_t aBlock = sub_10000468C((uint64_t *)&unk_1000343A8);
        sub_10000468C(&qword_100034750);
        *(void *)(v11 + 16) = sub_10001F838();
        *(void *)(v11 + 24) = v53;
        swift_bridgeObjectRelease();
        uint64_t v54 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v56 = *(void *)(v11 + 16);
        uint64_t v55 = *(void *)(v11 + 24);
        id v57 = (void *)swift_allocObject();
        v57[2] = v8;
        v57[3] = v63;
        v57[4] = v56;
        v57[5] = v55;
        v57[6] = v54;
        v68 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10001E36C;
        v69 = v57;
        uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
        uint64_t v65 = 1107296256;
        v66 = sub_10001BE10;
        id v67 = &unk_10002DDF8;
        uint64_t v58 = _Block_copy(&aBlock);
        sub_10000DA20(v8);
        swift_bridgeObjectRetain();
        swift_release();
        [v50 setMessageSendingComplete:v58];
        _Block_release(v58);

        if (v30)
        {
          uint64_t v42 = 2;
          long long v21 = v62;
LABEL_29:
          id v43 = v30;
          sub_10001F918();
          if (qword_100032C00 != -1) {
            swift_once();
          }
          sub_10001F588();
          swift_beginAccess();
          uint64_t v44 = *(void *)(v11 + 16);
          uint64_t v45 = *(void *)(v11 + 24);
          swift_bridgeObjectRetain();
          v7(v44, v45, v43, v21, v42);

          sub_1000047A0(v8);
          sub_1000047A0((uint64_t)v7);
          swift_release();

          return swift_bridgeObjectRelease();
        }
        goto LABEL_45;
      }
      sub_10000DA20(*(void *)(v3
                              + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                              + 16));
      sub_10000DA20(v8);
      sub_10001F908();
      if (qword_100032C00 != -1) {
        swift_once();
      }
      sub_10001F588();
      sub_1000047A0(v8);
    }
    else
    {
      swift_retain();
      uint64_t v17 = sub_10001F908();
      if (qword_100032C00 != -1) {
        swift_once();
      }
      id v18 = qword_100035F00;
      if (os_log_type_enabled((os_log_t)qword_100035F00, (os_log_type_t)v17))
      {
        swift_bridgeObjectRetain_n();
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        uint64_t aBlock = swift_slowAlloc();
        *(_DWORD *)uint64_t v19 = 136315138;
        swift_bridgeObjectRetain();
        sub_10001D408(a2, a3, &aBlock);
        sub_10001F9E8();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v17, "EventGenericDetailViewCoordinator: onRequestDismissViewAction not set on the EKEventGenericDetailView when button tapped for action: %s", v19, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        return sub_1000047A0((uint64_t)v7);
      }
    }
    return sub_1000047A0((uint64_t)v7);
  }
  else
  {
    os_log_type_t v13 = sub_10001F908();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    os_log_type_t v14 = qword_100035F00;
    uint64_t result = os_log_type_enabled((os_log_t)qword_100035F00, v13);
    if (result)
    {
      swift_bridgeObjectRetain_n();
      long long v16 = (uint8_t *)swift_slowAlloc();
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)long long v16 = 136315138;
      swift_bridgeObjectRetain();
      sub_10001D408(a2, a3, &aBlock);
      sub_10001F9E8();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v14, v13, "EventGenericDetailViewCoordinator: onRequestPresentViewAction not set on the EKEventGenericDetailView when button tapped for action: %s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      return swift_slowDealloc();
    }
  }
  return result;
}

uint64_t sub_10001BD9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t), uint64_t a6, uint64_t a7)
{
  swift_beginAccess();
  uint64_t v10 = *(void *)(a7 + 16);
  uint64_t v9 = *(void *)(a7 + 24);
  swift_bridgeObjectRetain();
  a5(v10, v9, 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001BE10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_10001BE64(uint64_t a1, void *a2)
{
  uint64_t v4 = v2
     + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView;
  unint64_t object = *(void *)(v2
                     + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                     + 16);
  if (!object)
  {
    os_log_type_t v12 = sub_10001F908();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    os_log_type_t v13 = qword_100035F00;
    if (os_log_type_enabled((os_log_t)qword_100035F00, v12))
    {
      os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v14 = 134217984;
      aBlock[0] = a2;
      sub_10001F9E8();
      _os_log_impl((void *)&_mh_execute_header, v13, v12, "EventGenericDetailViewCoordinator bottomStatusButtonTapped: onRequestPresentViewAction not set on the EKEventGenericDetailView when button tapped for action: %ld", v14, 0xCu);
      swift_slowDealloc();
    }
    return;
  }
  uint64_t v6 = *(void *)(v4 + 32);
  if (!v6)
  {
    swift_retain();
    os_log_type_t v15 = sub_10001F908();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    long long v16 = qword_100035F00;
    if (os_log_type_enabled((os_log_t)qword_100035F00, v15))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 134217984;
      aBlock[0] = a2;
      sub_10001F9E8();
      _os_log_impl((void *)&_mh_execute_header, v16, v15, "EventGenericDetailViewCoordinator bottomStatusButtonTapped: onRequestDismissViewAction not set on the EKEventGenericDetailView when button tapped for action: %ld", v17, 0xCu);
      swift_slowDealloc();
      sub_1000047A0(object);
      return;
    }
    goto LABEL_20;
  }
  uint64_t v7 = *(void *)(v4 + 40);
  uint64_t v8 = *(void **)(a1 + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_event);
  if (!v8)
  {
    sub_10000DA20(*(void *)(v2
                            + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                            + 16));
    sub_10000DA20(v6);
    sub_10001F908();
    if (qword_100032C00 != -1) {
LABEL_61:
    }
      swift_once();
    sub_10001F588();
    sub_1000047A0(v6);
LABEL_20:
    sub_1000047A0(object);
    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_10000DA20(object);
  sub_10000DA20(v6);
  id v9 = v8;
  sub_10001F5C8();
  swift_release();
  swift_release();
  swift_release();
  if (!aBlock[0])
  {
    sub_1000047A0(object);
    sub_1000047A0(v6);

    return;
  }
  uint64_t v69 = v6;
  id v70 = v9;
  self;
  uint64_t v10 = (void *)swift_dynamicCastObjCClass();
  if (!v10)
  {
    sub_1000047A0(object);
    sub_1000047A0(v6);

    return;
  }
  uint64_t v11 = v10;
  if (a2 != (void *)0x4000)
  {
    if (a2 == (void *)0x2000)
    {
      [v10 rejectButtonTapped];
    }
    else if (a2 == (void *)4096)
    {
      [v10 acceptButtonTapped];
    }

    sub_1000047A0(v6);
    sub_1000047A0(object);

    return;
  }
  id v62 = aBlock[0];
  unint64_t v73 = (unint64_t)&_swiftEmptyArrayStorage;
  id v18 = v70;
  id v19 = [v70 attendees];
  uint64_t v63 = v7;
  if (!v19) {
    goto LABEL_65;
  }
  char v20 = v19;
  v61._unint64_t object = (void *)object;
  sub_1000072B0(0, &qword_100034758);
  unint64_t object = sub_10001F888();

  if (object >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_10001FB28();
    swift_bridgeObjectRelease();
    if (v21) {
      goto LABEL_28;
    }
LABEL_63:
    swift_bridgeObjectRelease();
LABEL_64:
    unint64_t object = (unint64_t)v61._object;
    goto LABEL_65;
  }
  uint64_t v21 = *(void *)((object & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v21) {
    goto LABEL_63;
  }
LABEL_28:
  unint64_t v65 = object;
  unint64_t v66 = object & 0xC000000000000001;
  uint64_t v22 = 4;
  p_imp = &stru_100031FF0.imp;
  uint64_t v64 = v21;
  while (1)
  {
    if (v66) {
      id v24 = (id)sub_10001FAF8();
    }
    else {
      id v24 = *(id *)(object + 8 * v22);
    }
    unint64_t v25 = v24;
    uint64_t v26 = v22 - 3;
    if (__OFADD__(v22 - 4, 1))
    {
      __break(1u);
      goto LABEL_61;
    }
    self;
    uint64_t v27 = swift_dynamicCastObjCClass();
    if (v27) {
      break;
    }

LABEL_30:
    ++v22;
    if (v26 == v21)
    {
      swift_bridgeObjectRelease();
      id v18 = v70;
      goto LABEL_64;
    }
  }
  id v28 = (void *)v27;
  id v67 = v25;
  id v29 = [v11 proposedTimeAttendee];
  id v30 = objc_msgSend(v29, (SEL)p_imp[193]);

  if (v30)
  {
    uint64_t v31 = sub_10001F828();
    uint64_t v33 = v32;
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v33 = 0;
  }
  int v34 = p_imp;
  id v35 = objc_msgSend(v28, (SEL)p_imp[193]);
  if (!v35)
  {
    if (!v33) {
      goto LABEL_57;
    }
    goto LABEL_47;
  }
  uint64_t v36 = v35;
  uint64_t v37 = sub_10001F828();
  uint64_t v39 = v38;

  if (!v33)
  {
    if (!v39) {
      goto LABEL_57;
    }
    p_imp = v34;
    uint64_t v6 = (uint64_t)v67;

    goto LABEL_50;
  }
  p_imp = v34;
  if (!v39)
  {
LABEL_47:
    uint64_t v6 = (uint64_t)v67;

LABEL_50:
    swift_bridgeObjectRelease();
LABEL_51:
    uint64_t v21 = v64;
    unint64_t object = v65;
    goto LABEL_30;
  }
  if (v31 != v37 || v33 != v39)
  {
    char v40 = sub_10001FB88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v40) {
      goto LABEL_57;
    }
    uint64_t v6 = (uint64_t)v67;

    goto LABEL_51;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_57:
  swift_bridgeObjectRelease();
  id v41 = v67;
  sub_10001F868();
  id v18 = v70;
  unint64_t object = (unint64_t)v61._object;
  if (*(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_10001F8A8();
  }
  sub_10001F8B8();
  sub_10001F898();

LABEL_65:
  uint64_t v42 = EventKitUIBundle();
  if (v42)
  {
    id v43 = (objc_class *)v42;
    swift_bridgeObjectRelease();
    v61._countAndFlagsBits = 0x80000001000264B0;
    v75._countAndFlagsBits = 3818834;
    v75._unint64_t object = (void *)0xE300000000000000;
    v76.value._countAndFlagsBits = 0;
    v76.value._unint64_t object = 0;
    v44.super.Class isa = v43;
    v77._countAndFlagsBits = 0;
    v77._unint64_t object = (void *)0xE000000000000000;
    sub_10001F4A8(v75, v76, v44, v77, v61);

    id v45 = objc_allocWithZone((Class)EKUIEmailCompositionManager);
    id v46 = v18;
    NSString v47 = sub_10001F7F8();
    swift_bridgeObjectRelease();
    id v48 = [v45 initWithEvent:v46 participantRecipients:0 subjectPrefix:v47 bodyPrefix:0];

    id v71 = v46;
    uint64_t v49 = *(void **)(v68
                   + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_messageSendingManager);
    *(void *)(v68
              + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_messageSendingManager) = v48;
    id v50 = v48;

    id v51 = [v50 viewController];
    if (v51)
    {
      unint64_t v52 = v51;
      [v51 setModalPresentationStyle:2];
    }
    id v53 = [v50 viewController];
    sub_10000468C((uint64_t *)&unk_1000343A8);
    sub_10000468C(&qword_100034750);
    uint64_t v54 = sub_10001F838();
    uint64_t v56 = v55;
    uint64_t v57 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v58 = (void *)swift_allocObject();
    v58[2] = v69;
    v58[3] = v63;
    v58[4] = v54;
    v58[5] = v56;
    v58[6] = v57;
    aBlock[4] = sub_10001E36C;
    void aBlock[5] = v58;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_10001BE10;
    aBlock[3] = &unk_10002DD80;
    os_log_type_t v59 = _Block_copy(aBlock);
    sub_10000DA20(v69);
    swift_bridgeObjectRetain();
    swift_release();
    [v50 setMessageSendingComplete:v59];
    _Block_release(v59);
    if (v53)
    {
      id v60 = v53;
      sub_10001F918();
      if (qword_100032C00 != -1) {
        swift_once();
      }
      sub_10001F588();
      ((void (*)(uint64_t, uint64_t, id, id, uint64_t))object)(v54, v56, v60, v71, 2);

      sub_1000047A0(v69);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_10001F908();
      if (qword_100032C00 != -1) {
        swift_once();
      }
      sub_10001F588();

      sub_1000047A0(v69);
      id v60 = v62;
    }
    sub_1000047A0(object);
  }
  else
  {
    __break(1u);
  }
}

void sub_10001C934(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  a2(a4, a5, 2);
  swift_beginAccess();
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = *(void **)&Strong[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_messageSendingManager];
    *(void *)&Strong[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_messageSendingManager] = 0;
  }
}

id sub_10001CF70()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventGenericDetailView.EventGenericDetailViewCoordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EKEventGenericDetailView.EventGenericDetailViewCoordinator()
{
  return self;
}

__n128 initializeWithTake for EKEventGenericDetailView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for EKEventGenericDetailView()
{
  return &type metadata for EKEventGenericDetailView;
}

id sub_10001D0BC(uint64_t a1)
{
  return sub_10001DA60(a1, *(void *)(v1 + 8));
}

uint64_t sub_10001D0C4()
{
  return sub_10001DECC();
}

id sub_10001D0D0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v14 = *v1;
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v9 = v1[9];
  os_log_type_t v15 = (objc_class *)type metadata accessor for EKEventGenericDetailView.EventGenericDetailViewCoordinator();
  uint64_t v11 = (char *)objc_allocWithZone(v15);
  *(void *)&v11[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_messageSendingManager] = 0;
  os_log_type_t v12 = &v11[OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView];
  *(void *)os_log_type_t v12 = v14;
  *((void *)v12 + 1) = v2;
  *((void *)v12 + 2) = v3;
  *((void *)v12 + 3) = v4;
  *((void *)v12 + 4) = v5;
  *((void *)v12 + 5) = v6;
  *((void *)v12 + 6) = v7;
  *((void *)v12 + 7) = v8;
  *((void *)v12 + 8) = v10;
  *((void *)v12 + 9) = v9;
  swift_retain();
  sub_10000DA20(v3);
  sub_10000DA20(v5);
  sub_10000DA20(v7);
  sub_10000DA20(v10);
  v17.receiver = v11;
  v17.super_class = v15;
  id result = objc_msgSendSuper2(&v17, "init");
  *a1 = result;
  return result;
}

uint64_t sub_10001D1C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001E2DC();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10001D22C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001E2DC();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10001D290()
{
}

unint64_t sub_10001D2BC()
{
  unint64_t result = qword_100034670;
  if (!qword_100034670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034670);
  }
  return result;
}

uint64_t sub_10001D310@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10001F5C8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10001D390(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_10001F5D8();
}

uint64_t sub_10001D408(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001D4DC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000B940((uint64_t)v12, *a3);
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
      sub_10000B940((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001E28C((uint64_t)v12);
  return v7;
}

uint64_t sub_10001D4DC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10001F9F8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001D698(a5, a6);
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
  uint64_t v8 = sub_10001FB08();
  if (!v8)
  {
    sub_10001FB18();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10001FB68();
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

uint64_t sub_10001D698(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001D730(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001D910(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001D910(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001D730(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001D8A8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10001FAE8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10001FB18();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10001F858();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10001FB68();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10001FB18();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001D8A8(uint64_t a1, uint64_t a2)
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
  sub_10000468C(&qword_100034740);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001D910(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000468C(&qword_100034740);
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
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_10001FB68();
  __break(1u);
  return result;
}

id sub_10001DA60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000468C(&qword_100034678);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F918();
  if (qword_100032C00 != -1) {
    swift_once();
  }
  sub_10001F588();
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v42((char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  uint64_t v9 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = ((v9 + 24) & ~v9) + v6;
  uint64_t v11 = (v9 + 24) & ~v9;
  uint64_t v40 = v10;
  uint64_t v41 = v11;
  uint64_t v39 = v9 | 7;
  uint64_t v12 = swift_allocObject();
  uint64_t v43 = a1;
  uint64_t v13 = v12;
  *(void *)(v12 + 16) = v8;
  uint64_t v38 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v38(v12 + v11, v7, v4);
  uint64_t v14 = (uint64_t (**)(uint64_t, unint64_t))(a2
                                                           + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_leftBarButtonTapCallback);
  uint64_t v15 = *(void *)(a2
                  + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_leftBarButtonTapCallback);
  uint8_t *v14 = sub_10001E068;
  v14[1] = (uint64_t (*)(uint64_t, unint64_t))v13;
  sub_1000047A0(v15);
  uint64_t v16 = swift_allocObject();
  swift_weakInit();
  objc_super v17 = v42;
  v42(v7, v43, v4);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v16;
  uint64_t v19 = v41;
  char v20 = v38;
  v38(v18 + v41, v7, v4);
  uint64_t v21 = (uint64_t (**)(uint64_t, unint64_t))(a2
                                                           + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_rightBarButtonTapCallback);
  uint64_t v22 = *(void *)(a2
                  + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_rightBarButtonTapCallback);
  *uint64_t v21 = sub_10001E08C;
  v21[1] = (uint64_t (*)(uint64_t, unint64_t))v18;
  uint64_t v23 = v43;
  sub_1000047A0(v22);
  uint64_t v24 = swift_allocObject();
  swift_weakInit();
  v17(v7, v23, v4);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v24;
  v20(v25 + v19, v7, v4);
  uint64_t v26 = (uint64_t (**)(void *))(a2
                                        + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_bottomStatusButtonTapCallback);
  uint64_t v27 = *(void *)(a2
                  + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_bottomStatusButtonTapCallback);
  *uint64_t v26 = sub_10001E214;
  v26[1] = (uint64_t (*)(void *))v25;
  sub_1000047A0(v27);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_10001F5C8();
  swift_release();
  swift_release();
  swift_release();
  id v28 = v46;
  if (!v46) {
    return [objc_allocWithZone((Class)UIViewController) init];
  }
  id v45 = &OBJC_PROTOCOL___EKUINavigationDelegateProvider;
  uint64_t v29 = swift_dynamicCastObjCProtocolConditional();
  if (v29)
  {
    id v30 = (void *)v29;
    id v31 = v28;
    sub_10001F6A8();
    uint64_t v32 = v46;
    [v30 setNavigationDelegate:v46];
  }
  NSBundle v44 = &OBJC_PROTOCOL___EKViewControllerRemoteUIProtocol;
  uint64_t v33 = swift_dynamicCastObjCProtocolConditional();
  if (v33)
  {
    int v34 = (void *)v33;
    id v28 = v28;
    sub_10001F6A8();
    id v35 = v46;
    [v34 setRemoteUIDelegate:v46];
  }
  return v28;
}

uint64_t sub_10001DECC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_10001F5C8();
  swift_release();
  swift_release();
  swift_release();

  if (v1)
  {
    sub_10001F918();
    if (qword_100032C00 == -1) {
      return sub_10001F588();
    }
    goto LABEL_6;
  }
  sub_10001F908();
  if (qword_100032C00 != -1) {
LABEL_6:
  }
    swift_once();
  return sub_10001F588();
}

uint64_t sub_10001E02C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001E068(uint64_t a1, unint64_t a2)
{
  return sub_10001E0AC(a1, a2, "EKEventGenericDetailView: leftBarButton tapped. buttonAction: %s", sub_10001ACB0);
}

uint64_t sub_10001E08C(uint64_t a1, unint64_t a2)
{
  return sub_10001E0AC(a1, a2, "EKEventGenericDetailView: rightBarButton tapped. buttonAction: %s", (void (*)(void, void, void))sub_10001B150);
}

uint64_t sub_10001E0AC(uint64_t a1, unint64_t a2, const char *a3, void (*a4)(void, void, void))
{
  uint64_t v9 = *(void *)(sub_10000468C(&qword_100034678) - 8);
  return sub_10001A95C(a1, a2, *(void *)(v4 + 16), v4 + ((*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), a3, a4);
}

uint64_t sub_10001E144()
{
  uint64_t v1 = sub_10000468C(&qword_100034678);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001E214(void *a1)
{
  sub_10000468C(&qword_100034678);

  return sub_10001AB50(a1);
}

uint64_t sub_10001E28C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10001E2DC()
{
  unint64_t result = qword_100034748;
  if (!qword_100034748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034748);
  }
  return result;
}

uint64_t sub_10001E330()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001E370(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001E380()
{
  return swift_release();
}

uint64_t sub_10001E388()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001E3C4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10001E40C(uint64_t a1)
{
  sub_10001C934(a1, *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_10001E430()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001E470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001BD9C(a1, a2, a3, a4, *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32));
}

unint64_t sub_10001E47C(void *a1)
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, void *, id, uint64_t))(v1
                                                                    + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                                                                    + 16);
  if (v2)
  {
    uint64_t v3 = *(void **)(*(void *)(v1
                              + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                              + 8)
                  + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_event);
    if (v3)
    {
      swift_getObjectType();
      sub_10000DA20((uint64_t)v2);
      id v5 = v3;
      sub_10000468C(&qword_100034038);
      uint64_t v6 = sub_10001F838();
      uint64_t v8 = v7;
      self;
      uint64_t v9 = swift_dynamicCastObjCClass();
      if (!v9)
      {
LABEL_24:
        sub_10001F918();
        if (qword_100032C00 != -1) {
          swift_once();
        }
        sub_10001F588();
        v2(v6, v8, a1, v5, 1);
        swift_bridgeObjectRelease();

        return sub_1000047A0((uint64_t)v2);
      }
      uint64_t v10 = (void *)v9;
      id v11 = a1;
      id v12 = [v10 viewControllers];
      sub_1000072B0(0, (unint64_t *)&unk_100034040);
      unint64_t v13 = sub_10001F888();

      if (v13 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v14 = sub_10001FB28();
        swift_bridgeObjectRelease();
        if (v14)
        {
LABEL_6:
          unint64_t result = v14 - 1;
          if (__OFSUB__(v14, 1))
          {
            __break(1u);
          }
          else if ((v13 & 0xC000000000000001) == 0)
          {
            if ((result & 0x8000000000000000) != 0)
            {
              __break(1u);
            }
            else if (result < *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              id v16 = *(id *)(v13 + 8 * result + 32);
LABEL_11:
              objc_super v17 = v16;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_getObjectType();
              uint64_t v6 = sub_10001F838();
              uint64_t v8 = v18;

              goto LABEL_24;
            }
            __break(1u);
            return result;
          }
          id v16 = (id)sub_10001FAF8();
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v14) {
          goto LABEL_6;
        }
      }

      swift_bridgeObjectRelease();
      goto LABEL_24;
    }
    swift_retain();
    sub_10001F908();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    sub_10001F588();
    return sub_1000047A0((uint64_t)v2);
  }
  else
  {
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    return sub_10001F588();
  }
}

uint64_t sub_10001E84C(uint64_t a1)
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t, id, void))(v1
                                                                    + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                                                                    + 16);
  if (v2)
  {
    uint64_t v3 = *(void **)(*(void *)(v1
                              + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                              + 8)
                  + OBJC_IVAR____TtC27EventKitUIRemoteUIExtension29EKEventGenericDetailViewModel_event);
    if (v3)
    {
      swift_getObjectType();
      sub_10000DA20((uint64_t)v2);
      id v5 = v3;
      sub_10000468C(&qword_100034038);
      uint64_t v6 = sub_10001F838();
      uint64_t v8 = v7;
      sub_10001F918();
      if (qword_100032C00 != -1) {
        swift_once();
      }
      sub_10001F588();
      v2(v6, v8, a1, v5, 0);

      swift_bridgeObjectRelease();
      return sub_1000047A0((uint64_t)v2);
    }
    else
    {
      swift_retain();
      sub_10001F908();
      if (qword_100032C00 != -1) {
        swift_once();
      }
      sub_10001F588();
      return sub_1000047A0((uint64_t)v2);
    }
  }
  else
  {
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    return sub_10001F588();
  }
}

uint64_t sub_10001EAC4(void (*a1)(uint64_t))
{
  uint64_t v2 = *(void (**)(void, void, uint64_t))(v1
                                                      + OBJC_IVAR____TtCV27EventKitUIRemoteUIExtension24EKEventGenericDetailView33EventGenericDetailViewCoordinator_genericView
                                                      + 32);
  if (v2)
  {
    swift_retain();
    v2(0, 0, 1);
    if (a1)
    {
      uint64_t v4 = swift_retain();
      a1(v4);
      sub_1000047A0((uint64_t)v2);
      uint64_t v5 = (uint64_t)a1;
    }
    else
    {
      uint64_t v5 = (uint64_t)v2;
    }
    return sub_1000047A0(v5);
  }
  else
  {
    sub_10001F918();
    if (qword_100032C00 != -1) {
      swift_once();
    }
    return sub_10001F588();
  }
}

uint64_t sub_10001EC00()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001EC38()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10001EC48()
{
  return sub_10001A064();
}

uint64_t sub_10001EC50(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s27EventKitUIRemoteUIExtension24EKEventGenericDetailViewVwxx_0(void *a1)
{
  uint64_t result = swift_release();
  if (a1[2]) {
    uint64_t result = swift_release();
  }
  if (a1[4]) {
    uint64_t result = swift_release();
  }
  if (a1[6]) {
    uint64_t result = swift_release();
  }
  if (a1[8])
  {
    return swift_release();
  }
  return result;
}

void *_s27EventKitUIRemoteUIExtension24EKEventGenericDetailViewVwcp_0(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2 + 2;
  uint64_t v5 = a2[2];
  swift_retain();
  if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  uint64_t v8 = a2[4];
  if (v8)
  {
    uint64_t v9 = a2[5];
    a1[4] = v8;
    a1[5] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  uint64_t v10 = a2[6];
  if (v10)
  {
    uint64_t v11 = a2[7];
    a1[6] = v10;
    a1[7] = v11;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  uint64_t v12 = a2[8];
  if (v12)
  {
    uint64_t v13 = a2[9];
    a1[8] = v12;
    a1[9] = v13;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
  }
  return a1;
}

void *_s27EventKitUIRemoteUIExtension24EKEventGenericDetailViewVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[2];
  if (a1[2])
  {
    if (v4)
    {
      uint64_t v5 = a2[3];
      a1[2] = v4;
      a1[3] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[3];
    a1[2] = v4;
    a1[3] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v7 = a2[4];
  if (a1[4])
  {
    if (v7)
    {
      uint64_t v8 = a2[5];
      a1[4] = v7;
      a1[5] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[5];
    a1[4] = v7;
    a1[5] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  uint64_t v10 = a2[6];
  if (a1[6])
  {
    if (v10)
    {
      uint64_t v11 = a2[7];
      a1[6] = v10;
      a1[7] = v11;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = a2[7];
    a1[6] = v10;
    a1[7] = v12;
    swift_retain();
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  uint64_t v13 = a2[8];
  if (!a1[8])
  {
    if (v13)
    {
      uint64_t v15 = a2[9];
      a1[8] = v13;
      a1[9] = v15;
      swift_retain();
      return a1;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    return a1;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_28;
  }
  uint64_t v14 = a2[9];
  a1[8] = v13;
  a1[9] = v14;
  swift_retain();
  swift_release();
  return a1;
}

void *_s27EventKitUIRemoteUIExtension24EKEventGenericDetailViewVwta_0(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  uint64_t v5 = a2[2];
  if (a1[2])
  {
    if (v5)
    {
      uint64_t v6 = a2[3];
      a1[2] = v5;
      a1[3] = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v8 = a2[4];
  if (a1[4])
  {
    if (v8)
    {
      uint64_t v9 = a2[5];
      a1[4] = v8;
      a1[5] = v9;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v8)
  {
    uint64_t v10 = a2[5];
    a1[4] = v8;
    a1[5] = v10;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  uint64_t v11 = a2[6];
  if (a1[6])
  {
    if (v11)
    {
      uint64_t v12 = a2[7];
      a1[6] = v11;
      a1[7] = v12;
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v11)
  {
    uint64_t v13 = a2[7];
    a1[6] = v11;
    a1[7] = v13;
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  uint64_t v14 = a2[8];
  if (!a1[8])
  {
    if (v14)
    {
      uint64_t v16 = a2[9];
      a1[8] = v14;
      a1[9] = v16;
      return a1;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    return a1;
  }
  if (!v14)
  {
    swift_release();
    goto LABEL_28;
  }
  uint64_t v15 = a2[9];
  a1[8] = v14;
  a1[9] = v15;
  swift_release();
  return a1;
}

uint64_t _s27EventKitUIRemoteUIExtension24EKEventGenericDetailViewVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10001F15C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EKEventGenericDetailViewWrapper()
{
  return &type metadata for EKEventGenericDetailViewWrapper;
}

uint64_t sub_10001F1C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001F1E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10001A72C(a1, a2, a3, a4, a5, v5 + 16);
}

uint64_t sub_10001F1EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001A7D8(a1, a2, a3, v3 + 16);
}

uint64_t sub_10001F1F8(uint64_t a1, uint64_t a2)
{
  return sub_10001A868(a1, a2, v2 + 16);
}

uint64_t sub_10001F204()
{
  swift_release();
  if (v0[4]) {
    swift_release();
  }
  if (v0[6]) {
    swift_release();
  }
  if (v0[8]) {
    swift_release();
  }
  if (v0[10]) {
    swift_release();
  }

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_10001F27C(uint64_t a1)
{
  return sub_10001A8E4(a1, v1 + 16);
}

unint64_t sub_10001F288()
{
  unint64_t result = qword_100034780;
  if (!qword_100034780)
  {
    sub_10000472C(&qword_100034788);
    sub_10001D2BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034780);
  }
  return result;
}

uint64_t sub_10001F324()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10001F358()
{
  return EKEventViewSceneID.getter();
}

uint64_t sub_10001F368()
{
  return static EKRemoteUIUtilities.combineHostWithRemoteObjectIDChangeMaps(hostTempToRemoteTempObjectIDMap:remoteEventStoreTempToPermanentObjectIDMap:)();
}

uint64_t sub_10001F378()
{
  return type metadata accessor for EKRemoteUIUtilities();
}

uint64_t sub_10001F388()
{
  return EKEventEditViewSceneID.getter();
}

uint64_t sub_10001F398()
{
  return static EKRemoteUIButtonAction.PresentShareSheet.getter();
}

uint64_t sub_10001F3A8()
{
  return static EKRemoteUIButtonAction.PresentEmailCompose.getter();
}

uint64_t sub_10001F3B8()
{
  return static EKRemoteUIButtonAction.Done.getter();
}

uint64_t sub_10001F3C8()
{
  return type metadata accessor for EKRemoteUIButtonAction();
}

uint64_t sub_10001F3D8()
{
  return static EKUIRemoteUIXPCInterface.interfaceForEKEventViewHostInterface.getter();
}

uint64_t sub_10001F3E8()
{
  return static EKUIRemoteUIXPCInterface.interfaceForEKEventViewRemoteInterface.getter();
}

uint64_t sub_10001F3F8()
{
  return static EKUIRemoteUIXPCInterface.interfaceForEKEventEditViewHostInterface.getter();
}

uint64_t sub_10001F408()
{
  return static EKUIRemoteUIXPCInterface.interfaceForEKEventEditViewRemoteInterface.getter();
}

uint64_t sub_10001F418()
{
  return static EKUIRemoteUIXPCInterface.interfaceForEKCalendarChooserViewHostInterface.getter();
}

uint64_t sub_10001F428()
{
  return static EKUIRemoteUIXPCInterface.interfaceForEKCalendarChooserViewRemoteInterface.getter();
}

uint64_t sub_10001F438()
{
  return static EKUIRemoteUIXPCInterface.interfaceForEKEventGenericDetailViewHostInterface.getter();
}

uint64_t sub_10001F448()
{
  return static EKUIRemoteUIXPCInterface.interfaceForEKEventGenericDetailViewRemoteInterface.getter();
}

uint64_t sub_10001F458()
{
  return EKCalendarChooserViewSceneID.getter();
}

uint64_t sub_10001F468()
{
  return EKEventGenericDetailViewSceneID.getter();
}

uint64_t sub_10001F478()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F488()
{
  return Notification.userInfo.getter();
}

uint64_t sub_10001F498()
{
  return type metadata accessor for Notification();
}

uint64_t sub_10001F4A8(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

NSData sub_10001F4B8()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10001F4C8()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F4D8()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F4E8()
{
  return type metadata accessor for Date();
}

uint64_t sub_10001F4F8()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10001F508()
{
  return UUID.init()();
}

uint64_t sub_10001F518()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10001F548()
{
  return AppExtensionScene._makeScene(with:)();
}

uint64_t sub_10001F558()
{
  return _AnyAppExtensionScene.init<A>(erasing:)();
}

uint64_t sub_10001F568()
{
  return type metadata accessor for _AnyAppExtensionScene();
}

uint64_t sub_10001F578()
{
  return static AppExtension<>.main()();
}

uint64_t sub_10001F588()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10001F598()
{
  return ObservableObject<>.objectWillChange.getter();
}

void sub_10001F5A8()
{
}

uint64_t sub_10001F5B8()
{
  return Published.init(initialValue:)();
}

uint64_t sub_10001F5C8()
{
  return static Published.subscript.getter();
}

uint64_t sub_10001F5D8()
{
  return static Published.subscript.setter();
}

uint64_t sub_10001F5E8()
{
  return type metadata accessor for Published();
}

uint64_t sub_10001F5F8()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_10001F608()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t sub_10001F618()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10001F628()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_10001F638()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_10001F648()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_10001F668()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_10001F678()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_10001F688()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_10001F6A8()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t sub_10001F6B8()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_10001F6C8()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_10001F6D8()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_10001F6E8()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_10001F6F8()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10001F708()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10001F718()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10001F728()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10001F738()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10001F748()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10001F758()
{
  return EKRemoteUIObjectSerializer.deserializedRepresentation(serializedDictionary:objectIDToChangeSetDictionaryMap:objectIDToPersistentDictionaryMap:eventStore:occurrenceDate:)();
}

uint64_t sub_10001F768()
{
  return type metadata accessor for EKRemoteUIObjectSerializer();
}

uint64_t sub_10001F778()
{
  return EKRemoteUISerializedObject.serializedObjectIDDictionary.getter();
}

uint64_t sub_10001F788()
{
  return EKRemoteUISerializedObject.objectIDToChangeSetDictionaryMap.getter();
}

uint64_t sub_10001F798()
{
  return EKRemoteUISerializedObject.objectIDToPersistentDictionaryMap.getter();
}

uint64_t sub_10001F7A8()
{
  return type metadata accessor for EKRemoteUISerializedObject();
}

uint64_t sub_10001F7B8()
{
  return EKRemoteUIDeserializedObject.deserializedObject.getter();
}

uint64_t sub_10001F7C8()
{
  return EKRemoteUIDeserializedObject.tempObjectIDMap.getter();
}

NSDictionary sub_10001F7D8()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10001F7E8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_10001F7F8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001F808()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10001F818()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10001F828()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F838()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10001F848()
{
  return String.hash(into:)();
}

Swift::Int sub_10001F858()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10001F868()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10001F878()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10001F888()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F898()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10001F8A8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10001F8B8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSSet sub_10001F8C8()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_10001F8D8()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F8E8()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_10001F8F8()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_10001F908()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10001F918()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10001F928()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10001F938()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10001F948()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10001F958()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_10001F968()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10001F978()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

NSNumber sub_10001F988(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber sub_10001F998(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int sub_10001F9A8(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_10001F9B8()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10001F9C8()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_10001F9D8()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10001F9E8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10001F9F8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10001FA08()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10001FA18()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10001FA28()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10001FA38()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_10001FA48()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_10001FA58()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_10001FA68()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_10001FA78()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int sub_10001FA88(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10001FA98()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10001FAA8()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10001FAB8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10001FAC8()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10001FAD8()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_10001FAE8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10001FAF8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10001FB08()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10001FB18()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001FB28()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10001FB38()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10001FB48()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10001FB58()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10001FB68()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10001FB88()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001FB98()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10001FBA8()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10001FBB8()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10001FBC8()
{
  return Hasher._finalize()();
}

NSBundle *EventKitUIBundle(void)
{
  return _EventKitUIBundle();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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