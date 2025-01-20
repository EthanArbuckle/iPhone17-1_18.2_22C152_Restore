int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v3 = type metadata accessor for Logger();
  v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init(subsystem:category:)();
  setDefaultLogger(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_100002B04();
  v7 = (void *)OS_os_log.init(subsystem:category:)();
  setDefaultLog(_:)();

  qword_10000C170 = 0;
  sub_100002B44();
  v9 = [self currentRunLoop];
  [v9 run];

  exit(0);
}

unint64_t sub_100002B04()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

void sub_100002B44()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logging();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v33 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  v32 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)&v26 - v9;
  v11 = *(void (**)(void))(v3 + 104);
  unsigned int v29 = enum case for Logging.daemon(_:);
  v28 = (void (*)(char *, void, uint64_t))v11;
  v11(v5);
  defaultLogger(_:)();
  v27 = *(void (**)(char *, uint64_t))(v3 + 8);
  v27(v5, v2);
  v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = v6;
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "*** HOMEENERGYD LAUNCH ***", v14, 2u);
    uint64_t v1 = v0;
    uint64_t v6 = v31;
    swift_slowDealloc();
  }

  v15 = *(void (**)(char *, uint64_t))(v33 + 8);
  v33 += 8;
  v30 = v15;
  v15(v10, v6);
  sub_100002FE4();
  if (v1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v17 = sub_100003F7C();
    unint64_t v19 = v18;
    v28(v5, v29, v2);
    v20 = v32;
    defaultLogger(_:)();
    v27(v5, v2);
    swift_bridgeObjectRetain();
    v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)v23 = 136315138;
      swift_bridgeObjectRetain();
      aBlock[7] = sub_1000037E4(v17, v19, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Created tmp dir at %s", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v24 = v32;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v24 = v20;
    }
    v30(v24, v6);
    aBlock[4] = (uint64_t)sub_1000031F8;
    aBlock[5] = 0;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000376C;
    aBlock[3] = (uint64_t)&unk_100008488;
    v25 = _Block_copy(aBlock);
    xpc_activity_register("com.apple.homeenergyd.firstlaunch", XPC_ACTIVITY_CHECK_IN, v25);
    _Block_release(v25);
  }
}

uint64_t sub_100002FE4()
{
  uint64_t v0 = type metadata accessor for Logging();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = _set_user_dir_suffix();
  if (!result)
  {
    uint64_t v13 = v5;
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Logging.daemon(_:), v0);
    defaultLogger(_:)();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "_set_user_dir_suffix() failed!", v11, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v4);
    exit(0);
  }
  return result;
}

xpc_activity_state_t sub_1000031F8(_xpc_activity_s *a1)
{
  uint64_t v2 = type metadata accessor for Logging();
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  os_log_type_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v35 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  v16 = (char *)&v35 - v15;
  __chkstk_darwin(v14);
  unint64_t v18 = (char *)&v35 - v17;
  if (xpc_activity_get_state(a1) != 2)
  {
    xpc_activity_state_t result = xpc_activity_get_state(a1);
    if (result) {
      return result;
    }
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Logging.daemon(_:), v2);
    defaultLogger(_:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Checking in for the launch activity!", v27, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    type metadata accessor for DaemonInitializer();
    swift_allocObject();
    uint64_t v28 = DaemonInitializer.init()();
    swift_beginAccess();
    qword_10000C170 = v28;
    return swift_release();
  }
  uint64_t v35 = v6;
  unint64_t v19 = (void (**)(char *, uint64_t))(v3 + 8);
  if (xpc_activity_should_defer(a1))
  {
    BOOL v20 = xpc_activity_set_state(a1, 3);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Logging.daemon(_:), v2);
    if (v20)
    {
      defaultLogger(_:)();
      (*v19)(v5, v2);
      v21 = Logger.logObject.getter();
      os_log_type_t v22 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Defering the first launch activity!", v23, 2u);
        swift_slowDealloc();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v18, v35);
    }
    else
    {
      defaultLogger(_:)();
      (*v19)(v5, v2);
      v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "Failed to defer the first launch activity!", v34, 2u);
        swift_slowDealloc();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v16, v35);
    }
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Logging.daemon(_:), v2);
  defaultLogger(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  unsigned int v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "No need to defer the first launch activity", v31, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v35);
  xpc_activity_state_t result = swift_beginAccess();
  if (qword_10000C170)
  {
    swift_retain();
    dispatch thunk of DaemonInitializer.firstLaunchSetup()();
    return swift_release();
  }
  return result;
}

uint64_t sub_10000376C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v4 = swift_unknownObjectRetain();
  v3(v4);
  swift_release();

  return _swift_unknownObjectRelease(a2);
}

uint64_t sub_1000037CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000037DC()
{
  return swift_release();
}

uint64_t sub_1000037E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000038B8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100003E8C((uint64_t)v12, *a3);
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
      sub_100003E8C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100003E3C((uint64_t)v12);
  return v7;
}

uint64_t sub_1000038B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100003A74(a5, a6);
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

uint64_t sub_100003A74(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100003B0C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100003CEC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100003CEC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100003B0C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100003C84(v2, 0);
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

void *sub_100003C84(uint64_t a1, uint64_t a2)
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
  sub_100003EE8(&qword_10000C0A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100003CEC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003EE8(&qword_10000C0A8);
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

uint64_t sub_100003E3C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100003EE8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003F30()
{
  return v0;
}

uint64_t sub_100003F38()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100003F48()
{
  return swift_allocObject();
}

uint64_t type metadata accessor for MainUtils()
{
  return self;
}

uint64_t sub_100003F7C()
{
  sub_100003FBC(&v2);
  return v2;
}

uint64_t sub_100003FBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Logging();
  uint64_t v20 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v21 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006518(65537);
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v10 = String.utf8CString.getter();
  size_t v11 = realpath_DARWIN_EXTSN((const char *)(v10 + 32), 0);
  swift_release();
  if (v11)
  {
    uint64_t v12 = String.init(cString:)();
    uint64_t v14 = v13;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (!v14)
  {
LABEL_7:
    uint64_t v16 = v20;
    (*(void (**)(char *, void, uint64_t))(v20 + 104))(v4, enum case for Logging.daemon(_:), v2);
    defaultLogger(_:)();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v4, v2);
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      unint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Unable to read _CS_DARWIN_USER_TEMP_DIR!", v19, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v5);
    exit(1);
  }
  *a1 = v12;
  a1[1] = v14;
  return result;
}

void sub_100004260(unint64_t *a1@<X8>)
{
  v64 = a1;
  uint64_t v2 = type metadata accessor for Logging();
  uint64_t v58 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v57 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  v56 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v56 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v56 - v11;
  sub_1000057CC(v65);
  uint64_t v66 = v1;
  if (!v1)
  {
    uint64_t v59 = v2;
    uint64_t v60 = v5;
    uint64_t v61 = v4;
    uint64_t v63 = v65[0];
    uint64_t v62 = v65[1];
    sub_100006518(65537);
    if (!v14) {
      goto LABEL_18;
    }
    uint64_t v16 = String.utf8CString.getter();
    uint64_t v17 = realpath_DARWIN_EXTSN((const char *)(v16 + 32), 0);
    swift_release();
    if (v17)
    {
      uint64_t v18 = String.init(cString:)();
      uint64_t v20 = v19;
      swift_slowDealloc();
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v20 = 0;
    }
    swift_bridgeObjectRelease();
    if (v20)
    {
      sub_100006518(65538);
      if (!v21) {
        goto LABEL_21;
      }
      uint64_t v23 = String.utf8CString.getter();
      v24 = realpath_DARWIN_EXTSN((const char *)(v23 + 32), 0);
      swift_release();
      if (v24)
      {
        uint64_t v25 = String.init(cString:)();
        uint64_t v27 = v26;
        swift_slowDealloc();
      }
      else
      {
        uint64_t v25 = 0;
        uint64_t v27 = 0;
      }
      swift_bridgeObjectRelease();
      if (v27)
      {
        sub_100006518(0x10000);
        if (v28)
        {
          uint64_t v30 = String.utf8CString.getter();
          uint64_t v31 = realpath_DARWIN_EXTSN((const char *)(v30 + 32), 0);
          swift_release();
          if (v31)
          {
            uint64_t v32 = String.init(cString:)();
            uint64_t v34 = v33;
            swift_slowDealloc();
          }
          else
          {
            uint64_t v32 = 0;
            uint64_t v34 = 0;
          }
          swift_bridgeObjectRelease();
          if (v34)
          {
            sub_100003EE8(&qword_10000C160);
            uint64_t inited = swift_initStackObject();
            *(_OWORD *)(inited + 16) = xmmword_100007150;
            *(void *)(inited + 32) = 0xD000000000000010;
            *(void *)(inited + 40) = 0x80000001000074C0;
            *(void *)(inited + 48) = v25;
            *(void *)(inited + 56) = v27;
            *(void *)(inited + 64) = 0x555F4E4957524144;
            *(void *)(inited + 72) = 0xEF5249445F524553;
            *(void *)(inited + 80) = v32;
            *(void *)(inited + 88) = v34;
            *(void *)(inited + 96) = 1162694472;
            *(void *)(inited + 104) = 0xE400000000000000;
            uint64_t v36 = v62;
            *(void *)(inited + 112) = v63;
            *(void *)(inited + 120) = v36;
            *(void *)(inited + 128) = 0x524944504D54;
            *(void *)(inited + 136) = 0xE600000000000000;
            *(void *)(inited + 144) = v18;
            *(void *)(inited + 152) = v20;
            unint64_t v37 = sub_10000497C(inited);
            unint64_t *v64 = v37;
            return;
          }
        }
        uint64_t v50 = v58;
        v51 = v57;
        uint64_t v52 = v59;
        (*(void (**)(char *, void, uint64_t))(v58 + 104))(v57, enum case for Logging.daemon(_:), v59);
        defaultLogger(_:)();
        (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
        v53 = Logger.logObject.getter();
        os_log_type_t v54 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v55 = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, v54, "Unable to read _CS_DARWIN_USER_DIR!", v55, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v60 + 8))(v56, v61);
      }
      else
      {
LABEL_21:
        uint64_t v44 = v58;
        v45 = v57;
        uint64_t v46 = v59;
        (*(void (**)(char *, void, uint64_t))(v58 + 104))(v57, enum case for Logging.daemon(_:), v59);
        defaultLogger(_:)();
        (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
        v47 = Logger.logObject.getter();
        os_log_type_t v48 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v47, v48))
        {
          v49 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v49 = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, v48, "Unable to read _CS_DARWIN_USER_CACHE_DIR!", v49, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v60 + 8))(v10, v61);
      }
    }
    else
    {
LABEL_18:
      uint64_t v38 = v58;
      v39 = v57;
      uint64_t v40 = v59;
      (*(void (**)(char *, void, uint64_t))(v58 + 104))(v57, enum case for Logging.daemon(_:), v59);
      defaultLogger(_:)();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
      v41 = Logger.logObject.getter();
      os_log_type_t v42 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v43 = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "Unable to read _CS_DARWIN_USER_TEMP_DIR!", v43, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v60 + 8))(v12, v61);
    }
    exit(1);
  }
  __break(1u);
}

unint64_t sub_10000497C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003EE8(&qword_10000C168);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100005E90(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

void sub_100004AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100004B18(a1, a2, a3, a4);
}

void sub_100004B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a4;
  uint64_t v6 = (void *)type metadata accessor for Logging();
  uint64_t v23 = *(v6 - 1);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  String.utf8CString.getter();
  int v13 = _set_user_dir_suffix();
  swift_release();
  if (!v13)
  {
    uint64_t v17 = v9;
    uint64_t v18 = v10;
    uint64_t v19 = v23;
    (*(void (**)(char *, void, void *))(v23 + 104))(v8, enum case for Logging.daemon(_:), v6);
    defaultLogger(_:)();
    (*(void (**)(char *, void *))(v19 + 8))(v8, v6);
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      os_log_type_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "_set_user_dir_suffix() failed!", v22, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v12, v17);
    exit(1);
  }
  sub_100004260((unint64_t *)&v25);
  if (v4)
  {
    __break(1u);
    __break(1u);
  }
  else
  {
    uint64_t v15 = v25;
    sub_100004E40(v15, a3, v24);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100004DEC@<X0>(char *a1@<X0>, int a2@<W1>, void *a3@<X8>)
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

void sub_100004E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v48 = a3;
  uint64_t v46 = a2;
  uint64_t v5 = type metadata accessor for Logging();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v44 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = 0;
  int v13 = (char *)&_swiftEmptyArrayStorage;
  v51 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v14 = swift_bridgeObjectRetain();
  sub_100006770(v14, a1, &v51);
  uint64_t v45 = v3;
  swift_bridgeObjectRelease();
  v47 = v51;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Logging.daemon(_:), v5);
  defaultLogger(_:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain_n();
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v42 = (char *)swift_slowAlloc();
    v51 = v42;
    *(_DWORD *)uint64_t v17 = 136315138;
    v41 = v17 + 4;
    swift_bridgeObjectRetain();
    uint64_t v18 = Dictionary.description.getter();
    uint64_t v43 = v9;
    uint64_t v19 = v18;
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    uint64_t v49 = sub_1000037E4(v19, v21, (uint64_t *)&v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Sandbox parameters: %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v44 + 8))(v11, v43);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v11, v9);
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = v47;
  int64_t v24 = *((void *)v47 + 2);
  if (v24)
  {
    v51 = (char *)&_swiftEmptyArrayStorage;
    sub_100006394(0, v24, 0);
    uint64_t v25 = v51;
    uint64_t v26 = v23 + 40;
    do
    {
      uint64_t v27 = (const char *)(String.utf8CString.getter() + 32);
      swift_bridgeObjectRetain();
      uint64_t v28 = strdup(v27);
      swift_release();
      swift_bridgeObjectRelease();
      v51 = v25;
      unint64_t v30 = *((void *)v25 + 2);
      unint64_t v29 = *((void *)v25 + 3);
      int64_t v31 = v30 + 1;
      if (v30 >= v29 >> 1)
      {
        sub_100006394(v29 > 1, v30 + 1, 1);
        uint64_t v25 = v51;
      }
      *((void *)v25 + 2) = v31;
      *(void *)&v25[8 * v30 + 32] = v28;
      v26 += 16;
      --v24;
    }
    while (v24);
  }
  else
  {
    int64_t v31 = *((void *)&_swiftEmptyArrayStorage + 2);
    uint64_t v25 = (char *)&_swiftEmptyArrayStorage;
    if (!v31) {
      goto LABEL_15;
    }
  }
  v51 = (char *)&_swiftEmptyArrayStorage;
  sub_10000636C(0, v31, 0);
  uint64_t v32 = 0;
  int v13 = v51;
  unint64_t v33 = *((void *)v51 + 2);
  do
  {
    uint64_t v34 = *(void *)&v25[8 * v32 + 32];
    v51 = v13;
    unint64_t v35 = *((void *)v13 + 3);
    if (v33 >= v35 >> 1)
    {
      sub_10000636C(v35 > 1, v33 + 1, 1);
      int v13 = v51;
    }
    ++v32;
    *((void *)v13 + 2) = v33 + 1;
    *(void *)&v13[8 * v33++ + 32] = v34;
  }
  while (v31 != v32);
LABEL_15:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    int v13 = sub_100005D80(0, *((void *)v13 + 2) + 1, 1, v13);
  }
  unint64_t v37 = *((void *)v13 + 2);
  unint64_t v36 = *((void *)v13 + 3);
  if (v37 >= v36 >> 1) {
    int v13 = sub_100005D80((char *)(v36 > 1), v37 + 1, 1, v13);
  }
  *((void *)v13 + 2) = v37 + 1;
  *(void *)&v13[8 * v37 + 32] = 0;
  sub_100005408((uint64_t)v13, v46, v48, &v50);
  swift_bridgeObjectRelease();
  uint64_t v38 = *((void *)v25 + 2);
  if (v38)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v38; ++i)
    {
      uint64_t v40 = *(void **)&v25[8 * i + 32];
      free(v40);
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v45)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100005408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = type metadata accessor for Logging();
  uint64_t v31 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v28 - v13;
  String.utf8CString.getter();
  int v15 = sandbox_init_with_parameters();
  uint64_t result = swift_release();
  if (v15)
  {
    uint64_t v29 = v8;
    uint64_t v30 = v9;
    uint64_t v17 = *a4;
    uint64_t v18 = v31 + 104;
    (*(void (**)(char *, void, uint64_t))(v31 + 104))(v7, enum case for Logging.daemon(_:), v5);
    uint64_t v19 = (void (**)(char *, uint64_t))(v18 - 96);
    if (v17)
    {
      defaultLogger(_:)();
      (*v19)(v7, v5);
      uint64_t v23 = Logger.logObject.getter();
      os_log_type_t v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = 136315138;
        uint64_t v26 = String.init(cString:)();
        uint64_t v32 = sub_1000037E4(v26, v27, &v33);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "sandbox_init_with_parameters failed!: [%s]", v25, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v29);
    }
    else
    {
      defaultLogger(_:)();
      (*v19)(v7, v5);
      unint64_t v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v20, v21))
      {
        os_log_type_t v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "sandbox_init_with_parameters failed! (no error)", v22, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v29);
    }
    exit(1);
  }
  return result;
}

ValueMetadata *type metadata accessor for DaemonSandbox()
{
  return &type metadata for DaemonSandbox;
}

uint64_t sub_1000057CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Logging();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v30[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v30[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v30[-1] - v11;
  uid_t v13 = getuid();
  uint64_t v14 = getpwuid(v13);
  if (!v14 || !v14->pw_dir)
  {
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Logging.daemon(_:), v2);
    defaultLogger(_:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v20 = 67109120;
      LODWORD(v30[0]) = getuid();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to get passwd entry for uid %u", v20, 8u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    exit(1);
  }
  if (!realpath_DARWIN_EXTSN(v14->pw_dir, 0))
  {
    uint64_t v29 = v7;
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Logging.daemon(_:), v2);
    defaultLogger(_:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    os_log_type_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      v30[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315650;
      uint64_t v24 = String.init(cString:)();
      uint64_t v31 = sub_1000037E4(v24, v25, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 1024;
      LODWORD(v31) = errno.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v23 + 18) = 2080;
      int v26 = errno.getter();
      if (!strerror(v26)) {
        __break(1u);
      }
      uint64_t v27 = String.init(cString:)();
      uint64_t v31 = sub_1000037E4(v27, v28, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Sandbox: realpath(%s)\nfor home directory failed %d (%s)", (uint8_t *)v23, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v6);
    exit(1);
  }
  v30[0] = String.init(cString:)();
  v30[1] = v15;
  *a1 = String.init<A>(_:)();
  a1[1] = v16;
  return swift_slowDealloc();
}

char *sub_100005C70(char *result, int64_t a2, char a3, char *a4)
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
      sub_100003EE8(&qword_10000C158);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uid_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uid_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_10000667C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_100005D80(char *result, int64_t a2, char a3, char *a4)
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
      sub_100003EE8(&qword_10000C148);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      uid_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uid_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100006A1C(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_100005E90(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100005F08(a1, a2, v4);
}

unint64_t sub_100005F08(uint64_t a1, uint64_t a2, uint64_t a3)
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
        uid_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100005FEC(uint64_t *a1, int a2)
{
  uint64_t v4 = *a1;
  unint64_t v3 = a1[1];
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_100007160;
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
      uint64_t result = sub_1000062CC((int)v4, v4 >> 32, v9, a2);
      *a1 = v4;
      a1[1] = v9 | 0x4000000000000000;
      return result;
    case 2uLL:
      uint64_t v14 = *a1;
      unint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t v11 = v15;
      uint64_t result = sub_1000062CC(*(void *)(v14 + 16), *(void *)(v14 + 24), v15, a2);
      *a1 = v14;
      a1[1] = v11 | 0x8000000000000000;
      return result;
    case 3uLL:
      memset(v13, 0, 15);
      uint64_t result = sub_100004DEC(v13, a2, &v14);
      if (!v2) {
        return v14;
      }
      return result;
    default:
      *(void *)uid_t v13 = *a1;
      *(_WORD *)&v13[8] = v3;
      v13[10] = BYTE2(v3);
      v13[11] = BYTE3(v3);
      v13[12] = BYTE4(v3);
      v13[13] = BYTE5(v3);
      v13[14] = BYTE6(v3);
      uint64_t result = sub_100004DEC(v13, a2, &v14);
      if (!v2) {
        uint64_t result = v14;
      }
      unint64_t v8 = *(unsigned int *)&v13[8] | ((unint64_t)v13[12] << 32) | ((unint64_t)v13[13] << 40) | ((unint64_t)v13[14] << 48);
      *a1 = *(void *)v13;
      a1[1] = v8;
      return result;
  }
}

uint64_t sub_1000062CC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
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
  uint64_t result = sub_100004DEC((char *)(v9 + v10), a4, &v11);
  if (!v4) {
    return v11;
  }
  return result;
}

uint64_t sub_10000636C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000063BC(a1, a2, a3, *v3, &qword_10000C148);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100006394(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000063BC(a1, a2, a3, *v3, &qword_10000C150);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000063BC(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    sub_100003EE8(a5);
    uint64_t v11 = (char *)swift_allocObject();
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[8 * v9] || v14 >= &v15[8 * v9])
  {
    memcpy(v14, v15, 8 * v9);
LABEL_30:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100006518(int a1)
{
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t v3 = __DataStorage.init(length:)();
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
    uint64_t v5 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
    swift_release();
    uint64_t v3 = v5;
  }
  uint64_t result = __DataStorage._bytes.getter();
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v6 = result;
  uint64_t result = __DataStorage._offset.getter();
  uint64_t v7 = -result;
  if (__OFSUB__(0, result))
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v8 = __DataStorage._length.getter();
  if (v8 >= 1024) {
    size_t v9 = 1024;
  }
  else {
    size_t v9 = v8;
  }
  bzero((void *)(v6 + v7), v9);
  uint64_t v11 = 0x40000000000;
  unint64_t v12 = v3 | 0x4000000000000000;
  uint64_t v10 = sub_100005FEC(&v11, a1);
  sub_100006B08(v11, v12);
  return v10;
}

uint64_t sub_10000667C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_100006770(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = a1 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a1 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v12 = 0;
  uint64_t v35 = result;
  int64_t v36 = v10;
  uint64_t v37 = v6;
  uint64_t v38 = a3;
  while (1)
  {
    while (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v12 << 6);
      if (*(void *)(a2 + 16)) {
        goto LABEL_25;
      }
    }
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v15 >= v10) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v10) {
        return swift_release();
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v10) {
          return swift_release();
        }
        unint64_t v16 = *(void *)(v6 + 8 * v12);
        if (!v16)
        {
          int64_t v12 = v15 + 3;
          if (v15 + 3 >= v10) {
            return swift_release();
          }
          unint64_t v16 = *(void *)(v6 + 8 * v12);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v12 << 6);
    if (*(void *)(a2 + 16))
    {
LABEL_25:
      uint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v14);
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      swift_bridgeObjectRetain_n();
      unint64_t v21 = sub_100005E90(v20, v19);
      if (v22)
      {
        uint64_t v23 = (uint64_t *)(*(void *)(a2 + 56) + 16 * v21);
        uint64_t v24 = *v23;
        uint64_t v25 = v23[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        int v26 = *a3;
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *a3 = v26;
        uint64_t v39 = v24;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          int v26 = sub_100005C70(0, *((void *)v26 + 2) + 1, 1, v26);
          *a3 = v26;
        }
        unint64_t v29 = *((void *)v26 + 2);
        unint64_t v28 = *((void *)v26 + 3);
        if (v29 >= v28 >> 1)
        {
          int v26 = sub_100005C70((char *)(v28 > 1), v29 + 1, 1, v26);
          *uint64_t v38 = v26;
        }
        *((void *)v26 + 2) = v29 + 1;
        uint64_t v30 = &v26[16 * v29];
        *((void *)v30 + 4) = v20;
        *((void *)v30 + 5) = v19;
        a3 = v38;
        uint64_t v31 = *v38;
        unint64_t v33 = *((void *)*v38 + 2);
        unint64_t v32 = *((void *)*v38 + 3);
        if (v33 >= v32 >> 1)
        {
          uint64_t v31 = sub_100005C70((char *)(v32 > 1), v33 + 1, 1, v31);
          *uint64_t v38 = v31;
        }
        *((void *)v31 + 2) = v33 + 1;
        uint64_t v34 = &v31[16 * v33];
        *((void *)v34 + 4) = v39;
        *((void *)v34 + 5) = v25;
        uint64_t v6 = v37;
        uint64_t v5 = v35;
        int64_t v10 = v36;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v10) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v10) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_24;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

char *sub_100006A1C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100006B08(uint64_t a1, unint64_t a2)
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

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t dispatch thunk of DaemonInitializer.firstLaunchSetup()()
{
  return dispatch thunk of DaemonInitializer.firstLaunchSetup()();
}

uint64_t DaemonInitializer.init()()
{
  return DaemonInitializer.init()();
}

uint64_t type metadata accessor for DaemonInitializer()
{
  return type metadata accessor for DaemonInitializer();
}

uint64_t defaultLogger(_:)()
{
  return defaultLogger(_:)();
}

uint64_t setDefaultLog(_:)()
{
  return setDefaultLog(_:)();
}

uint64_t setDefaultLogger(_:)()
{
  return setDefaultLogger(_:)();
}

uint64_t type metadata accessor for Logging()
{
  return type metadata accessor for Logging();
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

uint64_t errno.getter()
{
  return errno.getter();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
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

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
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

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
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

void free(void *a1)
{
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

uid_t getuid(void)
{
  return _getuid();
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

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t sandbox_init_with_parameters()
{
  return _sandbox_init_with_parameters();
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}