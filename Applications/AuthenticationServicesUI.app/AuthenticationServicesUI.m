uint64_t sub_100002680()
{
  if (qword_100011EE8 != -1) {
    dispatch_once(&qword_100011EE8, &stru_10000C558);
  }
  return qword_100011EE0;
}

void sub_1000026C4(id a1)
{
  qword_100011EE0 = (uint64_t)os_log_create("com.apple.AuthenticationServicesUI", "Authorization");

  _objc_release_x1();
}

void sub_100002A48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 80))
  {
    *(unsigned char *)(v1 + 80) = 1;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100002B30;
    v6[3] = &unk_10000C580;
    v6[4] = *(void *)(a1 + 32);
    v3 = objc_retainBlock(v6);
    v4 = [*(id *)(*(void *)(a1 + 32) + 8) navigationController];
    v5 = v4;
    if (v4) {
      [v4 dismissViewControllerAnimated:1 completion:v3];
    }
    else {
      ((void (*)(void *))v3[2])(v3);
    }
  }
}

id sub_100002B30(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  v4 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v4 invalidate];

  v5 = *(void **)(a1 + 32);

  return [v5 _invalidateLookupConnection];
}

void sub_100002D00(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 64)) {
    [*(id *)(v1 + 8) updateInterfaceWithLoginChoices:*(void *)(a1 + 40)];
  }
  else {
    objc_storeStrong((id *)(v1 + 56), *(id *)(a1 + 40));
  }
}

void *sub_100002DBC(void *result)
{
  uint64_t v1 = result[4];
  if (*(unsigned char *)(v1 + 64)) {
    return [*(id *)(v1 + 8) presentPINEntryInterface];
  }
  *(unsigned char *)(v1 + 48) = 1;
  return result;
}

id sub_100002EE0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) authorizationViewController:*(void *)(*(void *)(a1 + 32) + 8) didCompleteWithCredential:0 error:*(void *)(a1 + 40)];
}

id sub_100002F70(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 8) cableClientWillConnect];
}

id sub_100002FF8(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 8) cableClientWillAuthenticate];
}

void sub_100003344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003364(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = sub_100002680();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000076BC(v5, v3);
    }
    [WeakRetained _dismissAndExit];
  }
}

id sub_10000378C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissAndExit];
}

uint64_t sub_100003868(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_1000039C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissAndExit];
}

id sub_100003A64(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
  return _[*(id *)(a1 + 32) _performQueuedUpdatesIfNecessary];
}

id sub_100003AF4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100003B68;
  v3[3] = &unk_10000C580;
  v3[4] = v1;
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

void sub_100003B68(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003BE0;
  block[3] = &unk_10000C580;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100003BE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showAuthorizationFlow];
}

void sub_100003CF4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t start(int a1, char **a2)
{
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = UIApplicationMain(a1, a2, 0, v5);

  return v6;
}

uint64_t sub_100003D78()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003DFC(v0, qword_100011EF0);
  sub_100003E60(v0, (uint64_t)qword_100011EF0);
  return Logger.init(subsystem:category:)();
}

uint64_t *sub_100003DFC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100003E60(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_100003E98(char a1)
{
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for RootViewController();
  [super viewDidAppear:a1 & 1];
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController];
  if (v3)
  {
    v4 = v3;
    [v4 setModalPresentationStyle:3];
    v11[4] = sub_10000405C;
    v11[5] = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_100004144;
    v11[3] = &unk_10000C710;
    v5 = _Block_copy(v11);
    [v1 presentViewController:v4 animated:0 completion:v5];
    _Block_release(v5);
    if (qword_100011B60 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_100003E60(v6, (uint64_t)qword_100011EF0);
    v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Presenting view", v9, 2u);
      swift_slowDealloc();
      uint64_t v10 = v4;
    }
    else
    {
      uint64_t v10 = v7;
      v7 = v4;
    }
  }
}

void sub_10000405C()
{
  if (qword_100011B60 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100003E60(v0, (uint64_t)qword_100011EF0);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Finished presenting view.", v2, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_100004144(uint64_t a1)
{
  os_log_type_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_1000041DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  if (qword_100011B60 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100003E60(v8, (uint64_t)qword_100011EF0);
  v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Setting up with exported credential data", v11, 2u);
    swift_slowDealloc();
  }

  id v12 = [objc_allocWithZone((Class)ASViewServiceViewController) init];
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  NSString v14 = String._bridgeToObjectiveC()();
  [v12 setupWithExportedCredentialData:isa exporterBundleID:v14 xpcEndpoint:a5];

  v15 = *(void **)(v6 + OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController);
  *(void *)(v6 + OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController) = v12;
}

id sub_100004470()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RootViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for RootViewController()
{
  return self;
}

uint64_t sub_1000044D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000044E8()
{
  return swift_release();
}

uint64_t sub_10000474C(void *a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [a1 URL];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  URL.scheme.getter();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v8)
  {
    Swift::String v9 = String.lowercased()();
    swift_bridgeObjectRelease();
    if (v9._object)
    {
      if (v9._countAndFlagsBits == 1868851558 && v9._object == (void *)0xE400000000000000) {
        LOBYTE(v8) = 1;
      }
      else {
        LOBYTE(v8) = _stringCompareWithSmolCheck(_:_:expecting:)();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8 & 1;
}

void sub_1000048C0(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_100007568(0, &qword_100011CF8);
    sub_100007450(&qword_100011D00, &qword_100011CF8);
    Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v17;
    uint64_t v16 = v18;
    uint64_t v2 = v19;
    uint64_t v3 = v20;
    unint64_t v4 = v21;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v16 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    uint64_t v11 = v3;
    goto LABEL_29;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 < v8)
    {
      unint64_t v14 = *(void *)(v16 + 8 * v13);
      uint64_t v11 = v3 + 1;
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 2;
      if (v3 + 2 >= v8) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v16 + 8 * v11);
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 3;
      if (v3 + 3 >= v8) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v16 + 8 * v11);
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v11 = v3 + 4;
      if (v3 + 4 >= v8) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v16 + 8 * v11);
      if (v14)
      {
LABEL_28:
        uint64_t v9 = (v14 - 1) & v14;
        unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
LABEL_29:
        id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
        if (v12)
        {
          do
          {
            if (sub_10000474C(v12)) {
              break;
            }

            uint64_t v3 = v11;
            unint64_t v4 = v9;
            if ((v1 & 0x8000000000000000) == 0) {
              goto LABEL_8;
            }
LABEL_10:
            if (!__CocoaSet.Iterator.next()()) {
              break;
            }
            sub_100007568(0, &qword_100011CF8);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            id v12 = v22;
            swift_unknownObjectRelease();
            uint64_t v11 = v3;
            uint64_t v9 = v4;
          }
          while (v22);
        }
        goto LABEL_33;
      }
      uint64_t v11 = v3 + 5;
      if (v3 + 5 < v8)
      {
        unint64_t v14 = *(void *)(v16 + 8 * v11);
        if (!v14)
        {
          uint64_t v15 = v3 + 6;
          while (v8 != v15)
          {
            unint64_t v14 = *(void *)(v16 + 8 * v15++);
            if (v14)
            {
              uint64_t v11 = v15 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_33;
        }
        goto LABEL_28;
      }
    }
LABEL_33:
    sub_100007448();
    return;
  }
  __break(1u);
}

void sub_100004B8C(uint64_t a1, void *a2)
{
  if (qword_100011B60 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100003E60(v3, (uint64_t)qword_100011EF0);
  id v9 = a2;
  unint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    id v8 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v7 = v9;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Opened caBLE url with %@", v6, 0xCu);
    sub_100007404(&qword_100011D08);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_100004D58(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_100004E24()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

uint64_t sub_100004EC8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100004F9C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000764C((uint64_t)v12, *a3);
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
      sub_10000764C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000075FC((uint64_t)v12);
  return v7;
}

uint64_t sub_100004F9C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100005158(a5, a6);
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

uint64_t sub_100005158(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000051F0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000053D0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000053D0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000051F0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005368(v2, 0);
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

void *sub_100005368(uint64_t a1, uint64_t a2)
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
  sub_100007404(&qword_100011DA0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000053D0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007404(&qword_100011DA0);
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
  int64_t v13 = a4 + 32;
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

uint64_t sub_100005520(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v5 = a1;
    char v6 = __CocoaSet.contains(_:)();

    if (v6)
    {
      uint64_t v7 = sub_1000056F8();
      swift_bridgeObjectRelease();
      return v7;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  Swift::Int v8 = *(void *)(v4 + 40);
  swift_bridgeObjectRetain();
  Swift::Int v9 = NSObject._rawHashValue(seed:)(v8);
  uint64_t v10 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v11 = v9 & ~v10;
  if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    goto LABEL_12;
  }
  sub_100007568(0, &qword_100011D10);
  id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
  char v13 = static NSObject.== infix(_:_:)();

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = ~v10;
    do
    {
      unint64_t v11 = (v11 + 1) & v14;
      if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_12;
      }
      id v15 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
      char v16 = static NSObject.== infix(_:_:)();
    }
    while ((v16 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v18 = *v2;
  uint64_t v20 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100005894();
    uint64_t v18 = v20;
  }
  uint64_t v7 = *(void *)(*(void *)(v18 + 48) + 8 * v11);
  sub_100005CE0(v11);
  *uint64_t v2 = v20;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1000056F8()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = __CocoaSet.count.getter();
  uint64_t v3 = swift_unknownObjectRetain();
  Swift::Int v4 = sub_100005E84(v3, v2);
  Swift::Int v16 = v4;
  Swift::Int v5 = *(void *)(v4 + 40);
  swift_retain();
  Swift::Int v6 = NSObject._rawHashValue(seed:)(v5);
  uint64_t v7 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v8 = v6 & ~v7;
  if ((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    sub_100007568(0, &qword_100011D10);
    id v9 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
    char v10 = static NSObject.== infix(_:_:)();

    if (v10)
    {
LABEL_6:
      swift_release();
      uint64_t v14 = *(void *)(*(void *)(v4 + 48) + 8 * v8);
      sub_100005CE0(v8);
      if (static NSObject.== infix(_:_:)())
      {
        *uint64_t v1 = v16;
        return v14;
      }
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v7;
      while (1)
      {
        unint64_t v8 = (v8 + 1) & v11;
        if (((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
          break;
        }
        id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
        char v13 = static NSObject.== infix(_:_:)();

        if (v13) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

id sub_100005894()
{
  uint64_t v1 = v0;
  sub_100007404(&qword_100011D98);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
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

uint64_t sub_100005A40()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100007404(&qword_100011D98);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    v28 = v0;
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

unint64_t sub_100005CE0(unint64_t result)
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
        Swift::Int v10 = *(void *)(v3 + 40);
        id v11 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        Swift::Int v12 = NSObject._rawHashValue(seed:)(v10);

        Swift::Int v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(v3 + 48);
            unint64_t v17 = (void *)(v16 + 8 * v2);
            int64_t v18 = (void *)(v16 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v17 >= v18 + 1))
            {
              *unint64_t v17 = *v18;
              int64_t v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }
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
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

Swift::Int sub_100005E84(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100007404(&qword_100011D98);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      sub_100007568(0, &qword_100011D10);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_100005A40();
          uint64_t v2 = v14;
        }
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
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
      while (__CocoaSet.Iterator.next()());
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

void sub_10000607C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000048C0(a1);
  if (v6)
  {
    unint64_t v7 = v6;
    id v8 = [objc_allocWithZone((Class)ASCAgentProxy) init];
    id v9 = [v7 URL];
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    URL._bridgeToObjectiveC()(v10);
    uint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    id v13 = [v7 options];
    id v14 = [v13 sourceApplication];

    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v8;
    aBlock[4] = sub_1000076AC;
    aBlock[5] = v15;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100004D58;
    aBlock[3] = &unk_10000C7B0;
    uint64_t v16 = _Block_copy(aBlock);
    id v17 = v8;
    swift_release();
    [v17 openCABLEURL:v12 fromSourceApplication:v14 withCompletionHandler:v16];
    _Block_release(v16);
  }
}

uint64_t sub_1000062A4(void *a1, void *a2)
{
  uint64_t v3 = v2;
  if (qword_100011B60 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100003E60(v6, (uint64_t)qword_100011EF0);
  unint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Scene will connect to session", v9, 2u);
    swift_slowDealloc();
  }

  sub_100007404(&qword_100011DA8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10000B850;
  *(void *)(v10 + 32) = v3;
  specialized Array._endMutation()();
  id v11 = v3;
  sub_100007404((uint64_t *)&unk_100011E10);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v13 = String._bridgeToObjectiveC()();
  [a1 _registerBSActionResponderArray:isa forKey:v13];

  id v14 = [a2 URLContexts];
  sub_100007568(0, &qword_100011CF8);
  sub_100007450(&qword_100011D00, &qword_100011CF8);
  uint64_t v15 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v15 & 0xC000000000000001) != 0) {
    uint64_t v16 = __CocoaSet.count.getter();
  }
  else {
    uint64_t v16 = *(void *)(v15 + 16);
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (v16)
  {
    id v18 = [a2 URLContexts];
    uint64_t v19 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10000607C(v19);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100006540(uint64_t a1, __objc2_prot **a2)
{
  uint64_t v3 = v2;
  if (qword_100011B60 != -1) {
LABEL_90:
  }
    swift_once();
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = sub_100003E60(v6, (uint64_t)qword_100011EF0);
  os_log_type_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Responding to BSActions", v10, 2u);
    swift_slowDealloc();
  }

  self;
  uint64_t v11 = swift_dynamicCastObjCClass();
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = objc_allocWithZone((Class)UIWindow);
    v60 = a2;
    id v14 = [v13 initWithWindowScene:v12];
    type metadata accessor for RootViewController();
    id v15 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    [v14 setRootViewController:v15];
    [v14 setContentsPosition:0];
    uint64_t v16 = (void *)(v3 + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_windows);
    swift_beginAccess();
    id v17 = v14;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_endAccess();
    id v18 = *(void **)(v3 + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_rootViewController);
    *(void *)(v3 + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_rootViewController) = v15;
    v61 = (char *)v15;

    uint64_t v70 = a1;
    uint64_t v59 = v7;
    if ((a1 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain_n();
      __CocoaSet.makeIterator()();
      sub_100007568(0, &qword_100011D10);
      sub_100007450(&qword_100011D18, &qword_100011D10);
      Set.Iterator.init(_cocoa:)();
      a1 = v71[0];
      uint64_t v63 = v71[1];
      uint64_t v3 = v71[2];
      uint64_t v19 = v71[3];
      unint64_t v20 = v71[4];
    }
    else
    {
      uint64_t v27 = -1 << *(unsigned char *)(a1 + 32);
      uint64_t v63 = a1 + 56;
      uint64_t v3 = ~v27;
      uint64_t v28 = -v27;
      if (v28 < 64) {
        uint64_t v29 = ~(-1 << v28);
      }
      else {
        uint64_t v29 = -1;
      }
      unint64_t v20 = v29 & *(void *)(a1 + 56);
      swift_bridgeObjectRetain_n();
      uint64_t v19 = 0;
    }
    int64_t v62 = (unint64_t)(v3 + 64) >> 6;
    a2 = &off_100011000;
    while (1)
    {
      if (a1 < 0)
      {
        uint64_t v33 = __CocoaSet.Iterator.next()();
        if (!v33) {
          goto LABEL_56;
        }
        *(void *)&long long v66 = v33;
        sub_100007568(0, &qword_100011D10);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        uint64_t v3 = v68[0];
        swift_unknownObjectRelease();
        uint64_t v32 = v19;
        uint64_t v30 = v20;
        if (!v3) {
          goto LABEL_56;
        }
      }
      else
      {
        if (v20)
        {
          uint64_t v30 = (v20 - 1) & v20;
          unint64_t v31 = __clz(__rbit64(v20)) | (v19 << 6);
          uint64_t v32 = v19;
        }
        else
        {
          int64_t v34 = v19 + 1;
          if (__OFADD__(v19, 1))
          {
            __break(1u);
            goto LABEL_90;
          }
          if (v34 >= v62) {
            goto LABEL_56;
          }
          unint64_t v35 = *(void *)(v63 + 8 * v34);
          uint64_t v32 = v19 + 1;
          if (!v35)
          {
            uint64_t v32 = v19 + 2;
            if (v19 + 2 >= v62) {
              goto LABEL_56;
            }
            unint64_t v35 = *(void *)(v63 + 8 * v32);
            if (!v35)
            {
              uint64_t v32 = v19 + 3;
              if (v19 + 3 >= v62) {
                goto LABEL_56;
              }
              unint64_t v35 = *(void *)(v63 + 8 * v32);
              if (!v35)
              {
                uint64_t v32 = v19 + 4;
                if (v19 + 4 >= v62) {
                  goto LABEL_56;
                }
                unint64_t v35 = *(void *)(v63 + 8 * v32);
                if (!v35)
                {
                  uint64_t v36 = v19 + 5;
                  while (v62 != v36)
                  {
                    unint64_t v35 = *(void *)(v63 + 8 * v36++);
                    if (v35)
                    {
                      uint64_t v32 = v36 - 1;
                      goto LABEL_38;
                    }
                  }
LABEL_56:
                  v39 = v60;
                  sub_100007448();
LABEL_57:
                  [v17 makeKeyAndVisible:v59];

                  return v70;
                }
              }
            }
          }
LABEL_38:
          uint64_t v30 = (v35 - 1) & v35;
          unint64_t v31 = __clz(__rbit64(v35)) + (v32 << 6);
        }
        uint64_t v3 = (uint64_t)*(id *)(*(void *)(a1 + 48) + 8 * v31);
        if (!v3) {
          goto LABEL_56;
        }
      }
      id v37 = [v3 info:v59];
      if (!v37) {
        goto LABEL_17;
      }
      v38 = v37;
      if ([v37 objectForSetting:0])
      {
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v66 = 0u;
        long long v67 = 0u;
      }
      sub_1000074A0((uint64_t)&v66, (uint64_t)v68);
      if (v69)
      {
        sub_100007568(0, &qword_100011D28);
        if ((swift_dynamicCast() & 1) == 0) {
          goto LABEL_16;
        }
        if ([v38 objectForSetting:1])
        {
          _bridgeAnyObjectToAny(_:)();
          swift_unknownObjectRelease();
        }
        else
        {
          long long v66 = 0u;
          long long v67 = 0u;
        }
        sub_1000074A0((uint64_t)&v66, (uint64_t)v68);
        if (v69)
        {
          sub_100007404(&qword_100011D90);
          if (swift_dynamicCast())
          {
            v41 = Logger.logObject.getter();
            os_log_type_t v42 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v41, v42))
            {
              v43 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v43 = 0;
              _os_log_impl((void *)&_mh_execute_header, v41, v42, "Found context action", v43, 2u);
              swift_slowDealloc();
            }

            *(void *)&long long v66 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            *((void *)&v66 + 1) = v44;
            swift_bridgeObjectRetain();
            v45 = v64;
            id v46 = [v64 __swift_objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
            swift_unknownObjectRelease();
            if (v46)
            {
              _bridgeAnyObjectToAny(_:)();
              swift_unknownObjectRelease();
            }
            else
            {
              long long v66 = 0u;
              long long v67 = 0u;
            }
            sub_1000074A0((uint64_t)&v66, (uint64_t)v68);
            if (v69)
            {
              if (swift_dynamicCast())
              {
                swift_bridgeObjectRelease();
                v47 = Logger.logObject.getter();
                os_log_type_t v48 = static os_log_type_t.default.getter();
                if (os_log_type_enabled(v47, v48))
                {
                  v49 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)v49 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v47, v48, "Setting up with context", v49, 2u);
                  swift_slowDealloc();
                }

                id v50 = [objc_allocWithZone((Class)ASViewServiceViewController) init];
                Class isa = Data._bridgeToObjectiveC()().super.isa;
                uint64_t v52 = (uint64_t)v64;
                [v50 setUpWithPresentationContextData:isa xpcEndpoint:v64];

                v53 = *(void **)&v61[OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController];
                *(void *)&v61[OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController] = v50;

                sub_1000075A4((uint64_t)v64, v65);
                v45 = v64;
                goto LABEL_72;
              }
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_bridgeObjectRelease();
              sub_100007508((uint64_t)v68);
            }
            uint64_t v52 = (uint64_t)v64;
LABEL_72:
            *(void *)&long long v66 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            *((void *)&v66 + 1) = v54;
            swift_bridgeObjectRetain();
            id v55 = [v45 __swift_objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
            swift_unknownObjectRelease();
            if (v55)
            {
              _bridgeAnyObjectToAny(_:)();
              swift_unknownObjectRelease();
            }
            else
            {
              long long v66 = 0u;
              long long v67 = 0u;
            }
            sub_1000074A0((uint64_t)&v66, (uint64_t)v68);
            if (v69)
            {
              if (swift_dynamicCast())
              {
                swift_bridgeObjectRelease();
                *(void *)&long long v66 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                *((void *)&v66 + 1) = v56;
                swift_bridgeObjectRetain();
                id v57 = [v45 __swift_objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
                swift_unknownObjectRelease();
                if (v57)
                {
                  _bridgeAnyObjectToAny(_:)();
                  swift_unknownObjectRelease();
                }
                else
                {
                  long long v66 = 0u;
                  long long v67 = 0u;
                }
                sub_1000074A0((uint64_t)&v66, (uint64_t)v68);
                if (v69)
                {
                  if (swift_dynamicCast())
                  {
                    swift_bridgeObjectRelease();
                    sub_1000041DC((uint64_t)v64, v65, (uint64_t)v64, v65, v52);
                    swift_bridgeObjectRelease();
                    sub_1000075A4((uint64_t)v64, v65);
                  }
                  else
                  {
                    sub_1000075A4((uint64_t)v64, v65);
                    swift_bridgeObjectRelease();
                  }
                }
                else
                {
                  sub_1000075A4((uint64_t)v64, v65);
                  swift_bridgeObjectRelease();
                  sub_100007508((uint64_t)v68);
                }
                v45 = v64;
              }
              else
              {
                swift_bridgeObjectRelease();
              }
            }
            else
            {
              swift_bridgeObjectRelease();
              sub_100007508((uint64_t)v68);
            }
            v58 = (void *)sub_100005520((void *)v3);
            swift_unknownObjectRelease();

            sub_100007448();
            v39 = v60;
            goto LABEL_57;
          }

LABEL_16:
LABEL_17:

          goto LABEL_18;
        }
      }
      sub_100007508((uint64_t)v68);
LABEL_18:
      uint64_t v19 = v32;
      unint64_t v20 = v30;
    }
  }
  uint64_t v21 = a2;
  unint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v22, v23))
  {
    unint64_t v24 = (uint8_t *)swift_slowAlloc();
    v71[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v24 = 136446210;
    swift_getObjectType();
    uint64_t v25 = _typeName(_:qualified:)();
    v68[0] = sub_100004EC8(v25, v26, v71);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Received unexpected scene %{public}s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  swift_bridgeObjectRetain();
  return a1;
}

void sub_100007184(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000048C0(a1);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [objc_allocWithZone((Class)ASCAgentProxy) init];
    id v9 = [v7 URL];
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    URL._bridgeToObjectiveC()(v10);
    uint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    id v13 = [v7 options];
    id v14 = [v13 sourceApplication];

    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v8;
    aBlock[4] = sub_1000073E4;
    aBlock[5] = v15;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100004D58;
    aBlock[3] = &unk_10000C760;
    uint64_t v16 = _Block_copy(aBlock);
    id v17 = v8;
    swift_release();
    [v17 openCABLEURL:v12 fromSourceApplication:v14 withCompletionHandler:v16];
    _Block_release(v16);
  }
}

uint64_t sub_1000073AC()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000073E4(uint64_t a1)
{
  sub_100004B8C(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000073EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000073FC()
{
  return swift_release();
}

uint64_t sub_100007404(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007448()
{
  return swift_release();
}

uint64_t sub_100007450(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007568(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000074A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007404(&qword_100011D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007508(uint64_t a1)
{
  uint64_t v2 = sub_100007404(&qword_100011D20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007568(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000075A4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000075FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000764C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1000076BC(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 safari_privacyPreservingDescription];
  sub_100003CF4((void *)&_mh_execute_header, v5, v6, "View service lost connection to agent with error: %{public}@", v7, v8, v9, v10, 2u);
}

void sub_100007754(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "View service did not find a presentation context.", v1, 2u);
}

void sub_100007798(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 safari_privacyPreservingDescription];
  sub_100003CF4((void *)&_mh_execute_header, v5, v6, "Error initializing presentation context: %{public}@", v7, v8, v9, v10, 2u);
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.scheme.getter()
{
  return URL.scheme.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
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

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
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

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
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

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
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

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
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

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend__dismissAndExit(void *a1, const char *a2, ...)
{
  return _[a1 _dismissAndExit];
}

id objc_msgSend__invalidateLookupConnection(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateLookupConnection];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return _[a1 _remoteViewControllerProxy];
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 _setEndpoint:];
}

id objc_msgSend__setUpRemoteProxy(void *a1, const char *a2, ...)
{
  return _[a1 _setUpRemoteProxy];
}

id objc_msgSend__setupWithXPCEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 _setupWithXPCEndpoint:];
}

id objc_msgSend__showAuthorizationFlow(void *a1, const char *a2, ...)
{
  return _[a1 _showAuthorizationFlow];
}

id objc_msgSend__showExportFlow(void *a1, const char *a2, ...)
{
  return _[a1 _showExportFlow];
}

id objc_msgSend_authorizationRequestFinishedWithCredential_error_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 authorizationRequestFinishedWithCredential:error:completionHandler:];
}

id objc_msgSend_authorizationRequestInitiatedWithLoginChoice_authenticatedContext_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 authorizationRequestInitiatedWithLoginChoice:authenticatedContext:completionHandler:];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerAnimated:YES completion:nil];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _[a1 events];
}

id objc_msgSend_initWithExportedCredentialData_exporterBundleID_(void *a1, const char *a2, ...)
{
  return [a1 initWithExportedCredentialData:exporterBundleID:];
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 initWithListenerEndpoint:];
}

id objc_msgSend_initWithPresentationContext_activity_(void *a1, const char *a2, ...)
{
  return [a1 initWithPresentationContext:activity:];
}

id objc_msgSend_initializeClientToViewServiceConnection(void *a1, const char *a2, ...)
{
  return _[a1 initializeClientToViewServiceConnection];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isConditionalRegistrationRequest(void *a1, const char *a2, ...)
{
  return _[a1 isConditionalRegistrationRequest];
}

id objc_msgSend_isPad(void *a1, const char *a2, ...)
{
  return _[a1 isPad];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_presentPINEntryInterface(void *a1, const char *a2, ...)
{
  return _[a1 presentPINEntryInterface];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_safari_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 safari_BOOLForKey:];
}

id objc_msgSend_safari_dataForKey_(void *a1, const char *a2, ...)
{
  return [a1 safari_dataForKey:];
}

id objc_msgSend_safari_privacyPreservingDescription(void *a1, const char *a2, ...)
{
  return [a1 safari_privacyPreservingDescription];
}

id objc_msgSend_safari_stringForKey_(void *a1, const char *a2, ...)
{
  return [a1 safari_stringForKey:];
}

id objc_msgSend_sendResponseWithUnHandledEvents_(void *a1, const char *a2, ...)
{
  return [a1 sendResponseWithUnHandledEvents:];
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsAlertStacking:];
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsMenuButtonDismissal:];
}

id objc_msgSend_setAllowsSiri_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsSiri];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return [a1 setDesiredHardwareButtonEvents:];
}

id objc_msgSend_setDismissalAnimationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setDismissalAnimationStyle:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setShouldDisableFadeInAnimation_(void *a1, const char *a2, ...)
{
  return [a1 setShouldDisableFadeInAnimation];
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return [a1 setSwipeDismissalStyle:];
}

id objc_msgSend_setUpWithPresentationContextData_xpcEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 setUpWithPresentationContextData:xpcEndpoint:];
}

id objc_msgSend_setupWithExportedCredentialData_exporterBundleID_xpcEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 setupWithExportedCredentialData:exporterBundleID:xpcEndpoint:];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_updateInterfaceWithLoginChoices_(void *a1, const char *a2, ...)
{
  return [a1 updateInterfaceWithLoginChoices:];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 xpcEndpoint];
}

id objc_msgSend_xpcInterface(void *a1, const char *a2, ...)
{
  return _[a1 xpcInterface];
}