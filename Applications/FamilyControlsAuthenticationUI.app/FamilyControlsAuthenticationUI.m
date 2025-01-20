int main(int argc, const char **argv, const char **envp)
{
  int v3;
  char **v4;

  v3 = static CommandLine.argc.getter();
  v4 = (char **)static CommandLine.unsafeArgv.getter();
  UIApplicationMain(v3, v4, 0, 0);
  return 0;
}

uint64_t sub_1000055D8(uint64_t a1, uint64_t a2)
{
  return sub_100005744(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000055F0(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100005668(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000056E8@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000572C(uint64_t a1, uint64_t a2)
{
  return sub_100005744(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005744(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100005788()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000057DC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

id sub_100005850()
{
  return *v0;
}

uint64_t sub_100005858@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100005860()
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

uint64_t sub_1000058EC()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000058FC(uint64_t a1)
{
  uint64_t v2 = sub_100005D7C((unint64_t *)&qword_10001DC98, type metadata accessor for LAError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100005968(uint64_t a1)
{
  uint64_t v2 = sub_100005D7C((unint64_t *)&qword_10001DC98, type metadata accessor for LAError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_1000059D4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100005D7C((unint64_t *)&qword_10001DC98, type metadata accessor for LAError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100005A64()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_100005A9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005D7C((unint64_t *)&qword_10001DC98, type metadata accessor for LAError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100005B18()
{
  return Hasher._finalize()();
}

void *sub_100005B78@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100005B88(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100005B94@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100005BDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for LAError(uint64_t a1)
{
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

uint64_t sub_100005C30(uint64_t a1)
{
  uint64_t v2 = sub_100005D7C(&qword_10001DCA8, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_100005D7C(&qword_10001DCB0, type metadata accessor for OpenExternalURLOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005CEC()
{
  return sub_100005D7C(&qword_10001DC40, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_100005D34()
{
  return sub_100005D7C(&qword_10001DC48, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_100005D7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100005DC4(uint64_t a1)
{
  uint64_t v2 = sub_100005D7C(&qword_10001DC60, type metadata accessor for LAError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100005E30(uint64_t a1)
{
  uint64_t v2 = sub_100005D7C(&qword_10001DC60, type metadata accessor for LAError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100005EA0(uint64_t a1)
{
  uint64_t v2 = sub_100005D7C((unint64_t *)&qword_10001DC98, type metadata accessor for LAError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100005F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005D7C((unint64_t *)&qword_10001DC98, type metadata accessor for LAError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100005F90()
{
  return sub_100005D7C(&qword_10001DC50, type metadata accessor for LAError);
}

uint64_t sub_100005FD8()
{
  return sub_100005D7C(&qword_10001DC58, type metadata accessor for LAError);
}

uint64_t sub_100006020()
{
  return sub_100005D7C(&qword_10001DC60, type metadata accessor for LAError);
}

uint64_t sub_100006068()
{
  return sub_100005D7C(&qword_10001DC68, type metadata accessor for LAError);
}

uint64_t sub_1000060B0()
{
  return sub_100005D7C(&qword_10001DC70, type metadata accessor for LAError);
}

uint64_t sub_1000060F8()
{
  return sub_100005D7C(&qword_10001DC78, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_100006154()
{
  return sub_100005D7C(&qword_10001DC80, type metadata accessor for Code);
}

unint64_t sub_1000061A0()
{
  unint64_t result = qword_10001DC88;
  if (!qword_10001DC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DC88);
  }
  return result;
}

uint64_t sub_1000061F4()
{
  return sub_100005D7C(&qword_10001DC90, type metadata accessor for Code);
}

uint64_t sub_10000623C()
{
  return sub_100005D7C((unint64_t *)&qword_10001DC98, type metadata accessor for LAError);
}

BOOL sub_100006284(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100006298()
{
  return sub_100005D7C(&qword_10001DCA0, type metadata accessor for OpenExternalURLOptionsKey);
}

void type metadata accessor for CFRunLoopSource(uint64_t a1)
{
}

void type metadata accessor for CFUserNotification(uint64_t a1)
{
}

void type metadata accessor for LAPolicy(uint64_t a1)
{
}

void sub_10000631C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

BOOL sub_100006364(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100006378()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000063C0()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000063EC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10000643C()
{
  type metadata accessor for FamilyCircle();
  swift_allocObject();
  uint64_t result = FamilyCircle.init()();
  qword_10001DD40 = result;
  return result;
}

uint64_t sub_10000647C(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v93 = a4;
  uint64_t v7 = type metadata accessor for AppleAccount();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  v11 = &v82[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  v13 = &v82[-v12];
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = __chkstk_darwin(v14);
  v17 = &v82[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = __chkstk_darwin(v15);
  v20 = &v82[-v19];
  uint64_t v21 = __chkstk_darwin(v18);
  v24 = &v82[-v23];
  if (!a2)
  {
    if (a1)
    {
      uint64_t v91 = v22;
      uint64_t v92 = v21;
      uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      if (*(void *)(a1 + 16) && (unint64_t v40 = sub_1000095E0(v38, v39), (v41 & 1) != 0))
      {
        uint64_t v42 = *(void *)(*(void *)(a1 + 56) + 8 * v40);
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        v96[0] = v42;
        sub_1000070BC(&qword_10001DD58);
        if (swift_dynamicCast())
        {
          unint64_t v43 = *((void *)&v97 + 1);
          uint64_t v90 = v97;
          static Logger.authenticationUI.getter();
          swift_bridgeObjectRetain_n();
          v44 = Logger.logObject.getter();
          os_log_type_t v45 = static os_log_type_t.default.getter();
          BOOL v46 = os_log_type_enabled(v44, v45);
          unint64_t v89 = v43;
          if (v46)
          {
            v88 = a3;
            v47 = (uint8_t *)swift_slowAlloc();
            uint64_t v87 = swift_slowAlloc();
            *(void *)&long long v97 = v87;
            os_log_t v86 = v44;
            v48 = v47;
            v85 = v47;
            *(_DWORD *)v47 = 136446210;
            a3 = v88;
            uint64_t v84 = (uint64_t)(v48 + 4);
            swift_bridgeObjectRetain();
            v96[0] = sub_100012274(v90, v43, (uint64_t *)&v97);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            os_log_t v49 = v86;
            _os_log_impl((void *)&_mh_execute_header, v86, v45, "Authenticated account altDSIS: %{public}s", v85, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          v53 = *(void (**)(void))(v91 + 8);
          ((void (*)(unsigned char *, uint64_t))v53)(v20, v92);
          if ((sub_10000CED0(0) & 1) == 0)
          {
            if (qword_10001DAF0 != -1) {
              swift_once();
            }
            uint64_t v64 = dispatch thunk of FamilyCircle.guardians.getter();
            uint64_t v65 = *(void *)(v64 + 16);
            unint64_t v66 = v89;
            uint64_t v67 = v90;
            if (!v65)
            {
LABEL_49:
              v99 = 0;
              long long v97 = 0u;
              long long v98 = 0u;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_52;
            }
            v68 = a3;
            uint64_t v69 = v64 + 32;
            swift_bridgeObjectRetain();
            while (1)
            {
              sub_10000732C(v69, (uint64_t)&v94);
              sub_100007390(&v94, v95);
              uint64_t v70 = dispatch thunk of FamilyMemberable.altDSID.getter();
              if (v71)
              {
                if (v70 == v67 && v71 == v66)
                {
                  swift_bridgeObjectRelease();
LABEL_51:
                  swift_bridgeObjectRelease();
                  sub_100007480(&v94, (uint64_t)&v97);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  a3 = v68;
LABEL_52:
                  if (*((void *)&v98 + 1))
                  {
                    sub_100007480(&v97, (uint64_t)v96);
                    sub_10000732C((uint64_t)v96, (uint64_t)&v97);
                    char v100 = 0;
                    a3(&v97);
                    sub_100007424((uint64_t)&v97, &qword_10001DD50);
                    return sub_1000073D4((uint64_t)v96);
                  }
                  sub_100007424((uint64_t)&v97, (uint64_t *)&unk_10001DD60);
                  sub_100007068();
                  uint64_t v80 = swift_allocError();
                  unsigned char *v81 = 2;
                  *(void *)&long long v97 = v80;
                  char v100 = 1;
LABEL_18:
                  a3(&v97);
                  return sub_100007424((uint64_t)&v97, &qword_10001DD50);
                }
                char v73 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                if (v73) {
                  goto LABEL_51;
                }
              }
              sub_1000073D4((uint64_t)&v94);
              v69 += 40;
              if (!--v65)
              {
                swift_bridgeObjectRelease();
                a3 = v68;
                goto LABEL_49;
              }
            }
          }
          v88 = v53;
          AppleAccount.init()();
          static Logger.authenticationUI.getter();
          v54 = *(NSObject **)(v8 + 16);
          uint64_t v87 = v8 + 16;
          os_log_t v86 = v54;
          ((void (*)(unsigned char *, unsigned char *, uint64_t))v54)(v11, v13, v7);
          v55 = (uint8_t *)Logger.logObject.getter();
          os_log_type_t v56 = static os_log_type_t.default.getter();
          int v57 = v56;
          if (os_log_type_enabled((os_log_t)v55, v56))
          {
            v85 = v55;
            uint64_t v58 = swift_slowAlloc();
            int v83 = v57;
            v59 = (uint8_t *)v58;
            uint64_t v84 = swift_slowAlloc();
            *(void *)&long long v97 = v84;
            *(_DWORD *)v59 = 136446210;
            uint64_t v60 = AppleAccount.altDSID.getter();
            if (v61)
            {
              unint64_t v62 = v61;
            }
            else
            {
              uint64_t v60 = 1280070990;
              unint64_t v62 = 0xE400000000000000;
            }
            v96[0] = sub_100012274(v60, v62, (uint64_t *)&v97);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            v63 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
            v63(v11, v7);
            v55 = v85;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v85, (os_log_type_t)v83, "Primary account altDSIS: %{public}s", v59, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            v63 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
            v63(v11, v7);
          }

          ((void (*)(unsigned char *, uint64_t))v88)(v17, v92);
          uint64_t v74 = AppleAccount.altDSID.getter();
          if (v75)
          {
            if (v74 == v90 && v75 == v89)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
LABEL_46:
              *((void *)&v98 + 1) = v7;
              v99 = &protocol witness table for AppleAccount;
              v77 = sub_100007498((uint64_t *)&v97);
              ((void (*)(uint64_t *, unsigned char *, uint64_t))v86)(v77, v13, v7);
              char v100 = 0;
              a3(&v97);
              v63(v13, v7);
              return sub_100007424((uint64_t)&v97, &qword_10001DD50);
            }
            char v76 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v76) {
              goto LABEL_46;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          sub_100007068();
          uint64_t v78 = swift_allocError();
          unsigned char *v79 = 2;
          *(void *)&long long v97 = v78;
          char v100 = 1;
          a3(&v97);
          sub_100007424((uint64_t)&v97, &qword_10001DD50);
          return ((uint64_t (*)(unsigned char *, uint64_t))v63)(v13, v7);
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    sub_100007068();
    uint64_t v51 = swift_allocError();
    unsigned char *v52 = 4;
    *(void *)&long long v97 = v51;
    char v100 = 1;
    goto LABEL_18;
  }
  uint64_t v91 = v22;
  uint64_t v92 = v21;
  *(void *)&long long v94 = a2;
  swift_errorRetain();
  v25 = (void *)_convertErrorToNSError(_:)();
  unsigned __int8 v26 = [v25 ak_isUserCancelError];

  if (v26)
  {
    sub_100007068();
    a2 = swift_allocError();
    unsigned char *v27 = 0;
    swift_errorRelease();
    *(void *)&long long v94 = a2;
  }
  swift_errorRetain();
  v28 = (void *)_convertErrorToNSError(_:)();
  swift_errorRelease();
  unsigned int v29 = [v28 ak_isServiceError];

  if (v29)
  {
    uint64_t v30 = type metadata accessor for FamilyControlsError();
    sub_1000074FC();
    uint64_t v31 = swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, enum case for FamilyControlsError.networkError(_:), v30);
    swift_errorRelease();
    *(void *)&long long v94 = v31;
    a2 = v31;
  }
  static Logger.authenticationUI.getter();
  swift_errorRetain();
  swift_errorRetain();
  v33 = Logger.logObject.getter();
  os_log_type_t v34 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v97 = swift_slowAlloc();
    *(_DWORD *)v35 = 136446210;
    v96[0] = a2;
    swift_errorRetain();
    sub_1000070BC((uint64_t *)&unk_10001E070);
    uint64_t v36 = String.init<A>(describing:)();
    v96[0] = sub_100012274(v36, v37, (uint64_t *)&v97);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Authentication failed with error: %{public}s", v35, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(unsigned char *, uint64_t))(v91 + 8))(v24, v92);
  swift_beginAccess();
  *(void *)&long long v97 = v94;
  char v100 = 1;
  swift_errorRetain();
  a3(&v97);
  sub_100007424((uint64_t)&v97, &qword_10001DD50);
  return swift_errorRelease();
}

unint64_t sub_100007068()
{
  unint64_t result = qword_10001DD48;
  if (!qword_10001DD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DD48);
  }
  return result;
}

uint64_t sub_1000070BC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_100007100(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_10001DAF0 != -1) {
    swift_once();
  }
  dispatch thunk of FamilyCircle.currentMember.getter();
  if (!v25)
  {
    sub_100007424((uint64_t)v24, (uint64_t *)&unk_10001DD60);
    goto LABEL_7;
  }
  sub_100007390(v24, v25);
  uint64_t v11 = dispatch thunk of FamilyMemberable.firstName.getter();
  uint64_t v13 = v12;
  sub_1000073D4((uint64_t)v24);
  if (!v13)
  {
LABEL_7:
    uint64_t v19 = sub_10000DD34(a6);
    uint64_t v21 = v20;
    sub_1000070BC(&qword_10001DD78);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_100014410;
    *(void *)(v22 + 56) = &type metadata for String;
    *(void *)(v22 + 64) = sub_1000079BC();
    *(void *)(v22 + 32) = a1;
    *(void *)(v22 + 40) = a2;
    swift_bridgeObjectRetain();
    sub_10000DE30(v19, v21);
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  uint64_t v14 = sub_10000DD34(a4);
  uint64_t v16 = v15;
  sub_1000070BC(&qword_10001DD78);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_100014400;
  *(void *)(v17 + 56) = &type metadata for String;
  unint64_t v18 = sub_1000079BC();
  *(void *)(v17 + 32) = a1;
  *(void *)(v17 + 40) = a2;
  *(void *)(v17 + 96) = &type metadata for String;
  *(void *)(v17 + 104) = v18;
  *(void *)(v17 + 64) = v18;
  *(void *)(v17 + 72) = v11;
  *(void *)(v17 + 80) = v13;
  swift_bridgeObjectRetain();
  sub_10000DE30(v14, v16);
  swift_bridgeObjectRelease();
LABEL_8:
  swift_bridgeObjectRelease();
  NSString v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [a3 setReason:v23];
}

uint64_t sub_10000732C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_100007390(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000073D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100007424(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000070BC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100007480(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t *sub_100007498(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_1000074FC()
{
  unint64_t result = qword_10001DD70;
  if (!qword_10001DD70)
  {
    type metadata accessor for FamilyControlsError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DD70);
  }
  return result;
}

id sub_100007554(char a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v44 = a4;
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [objc_allocWithZone((Class)AKAppleIDAuthenticationInAppContext) init];
  id v12 = objc_allocWithZone((Class)AKAppleIDAuthenticationController);
  id v13 = v11;
  id v14 = [v12 init];
  if (!v14)
  {
    __break(1u);
LABEL_21:
    __break(1u);
    JUMPOUT(0x1000079A8);
  }
  uint64_t v15 = v14;
  switch(a1)
  {
    case 1:
      id v16 = v13;
      id v27 = v15;
      uint64_t v18 = 0xD000000000000017;
      uint64_t v19 = 0xD00000000000001DLL;
      uint64_t v20 = 0x8000000100015AD0;
      goto LABEL_9;
    case 2:
      id v21 = v13;
      id v22 = v15;
      uint64_t v19 = 0xD00000000000001FLL;
      uint64_t v20 = 0x8000000100015B10;
      goto LABEL_11;
    case 3:
      id v21 = v13;
      id v31 = v15;
      uint64_t v19 = 0xD00000000000001FLL;
      uint64_t v20 = 0x8000000100015B50;
LABEL_11:
      uint64_t v28 = a2;
      uint64_t v29 = a3;
      uint64_t v30 = v21;
      uint64_t v18 = 0xD000000000000019;
      goto LABEL_12;
    case 4:

      swift_bridgeObjectRelease();
      static Logger.authorization.getter();
      NSString v23 = Logger.logObject.getter();
      os_log_type_t v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Unknown authorization type. Returning nil.", v25, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      return 0;
    default:
      id v16 = v13;
      id v17 = v15;
      uint64_t v18 = 0xD00000000000001ALL;
      uint64_t v19 = 0xD000000000000020;
      uint64_t v20 = 0x8000000100015A80;
LABEL_9:
      uint64_t v28 = a2;
      uint64_t v29 = a3;
      uint64_t v30 = v16;
LABEL_12:
      sub_100007100(v28, v29, v30, v19, v20, v18);

      swift_bridgeObjectRelease();
      id v26 = v13;
      sub_10000E1E8();
      NSString v32 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v26 setTitle:v32];

      if ((sub_10000CED0(0) & 1) == 0) {
        goto LABEL_18;
      }
      id v33 = v26;
      id v34 = [v33 title];
      if (!v34) {
        goto LABEL_21;
      }
      v35 = v34;
      uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v38 = v37;

      uint64_t v45 = v36;
      uint64_t v46 = v38;
      v39._countAndFlagsBits = 0xD000000000000020;
      v39._object = (void *)0x8000000100015A30;
      String.append(_:)(v39);
      if (v46)
      {
        NSString v40 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v40 = 0;
      }
      [v33 setTitle:v40];

LABEL_18:
      [v26 setIsEphemeral:1];
      [v26 setAuthenticationType:2];
      [v26 setShouldPromptForPasswordOnly:1];
      id v41 = v44;
      [v26 setPresentingViewController:v44];

      return v26;
  }
}

unint64_t sub_1000079BC()
{
  unint64_t result = qword_10001DD80;
  if (!qword_10001DD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DD80);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for AuthenticationError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AuthenticationError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AuthenticationError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x100007B7CLL);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_100007BA4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100007BB0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationError()
{
  return &type metadata for AuthenticationError;
}

unint64_t sub_100007BCC()
{
  unint64_t result = qword_10001DD88;
  if (!qword_10001DD88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DD88);
  }
  return result;
}

id sub_100007D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)&v7[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI26ConfirmationViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    NSString v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    NSString v13 = 0;
    goto LABEL_6;
  }
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
LABEL_6:
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for ConfirmationViewController();
  id v14 = [super initWithTitle:v11 detailText:v12 symbolName:v13 contentLayout:a7];

  return v14;
}

id sub_100007FF4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfirmationViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for ConfirmationViewController()
{
  return self;
}

id sub_10000805C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  sub_1000070BC(&qword_10001DD78);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100014410;
  *(void *)(v7 + 56) = &type metadata for String;
  unint64_t v8 = sub_1000079BC();
  *(void *)(v7 + 64) = v8;
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_10000E1E8();
  swift_bridgeObjectRelease();
  sub_100007390(a4, a4[3]);
  uint64_t v9 = dispatch thunk of FamilyMemberable.firstName.getter();
  if (v10)
  {
    uint64_t v11 = v9;
    uint64_t v12 = v10;
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_100014400;
    *(void *)(v13 + 56) = &type metadata for String;
    *(void *)(v13 + 64) = v8;
    *(void *)(v13 + 32) = a1;
    *(void *)(v13 + 40) = a2;
    *(void *)(v13 + 96) = &type metadata for String;
    *(void *)(v13 + 104) = v8;
    *(void *)(v13 + 72) = v11;
    *(void *)(v13 + 80) = v12;
    swift_bridgeObjectRetain();
    uint64_t v14 = 0xD000000000000023;
    uint64_t v15 = "CONFIRMATION_APPROVE_MESSAGE_PARENT";
  }
  else
  {
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_100014410;
    *(void *)(v16 + 56) = &type metadata for String;
    *(void *)(v16 + 64) = v8;
    *(void *)(v16 + 32) = a1;
    *(void *)(v16 + 40) = a2;
    swift_bridgeObjectRetain();
    uint64_t v14 = 0xD00000000000001CLL;
    uint64_t v15 = "CONFIRMATION_APPROVE_MESSAGE";
  }
  sub_10000DE30(v14, (unint64_t)(v15 - 32) | 0x8000000000000000);
  swift_bridgeObjectRelease();
  type metadata accessor for ConfirmationViewController();
  id v17 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v18 = a3;
  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v21 = [v17 initWithTitle:v19 detailText:v20 icon:v18];

  sub_1000083D0();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v21;
  id v23 = v21;
  os_log_type_t v24 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  id v25 = [self boldButton];
  sub_10000E1E8();
  NSString v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v25 setTitle:v26 forState:0];

  [v25 addAction:v24 forControlEvents:64];
  id v27 = [v23 buttonTray];
  [v27 addButton:v25];

  return v23;
}

unint64_t sub_1000083D0()
{
  unint64_t result = qword_10001DDC0;
  if (!qword_10001DDC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001DDC0);
  }
  return result;
}

uint64_t sub_100008410()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100008448()
{
  return [*(id *)(v0 + 16) dismissViewControllerAnimated:1 completion:0];
}

id sub_100008460(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  sub_1000070BC(&qword_10001DD78);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100014410;
  *(void *)(v7 + 56) = &type metadata for String;
  unint64_t v8 = sub_1000079BC();
  *(void *)(v7 + 64) = v8;
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_10000E1E8();
  swift_bridgeObjectRelease();
  sub_100007390(a4, a4[3]);
  uint64_t v9 = dispatch thunk of FamilyMemberable.firstName.getter();
  if (v10)
  {
    uint64_t v11 = v9;
    uint64_t v12 = v10;
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_100014400;
    *(void *)(v13 + 56) = &type metadata for String;
    *(void *)(v13 + 64) = v8;
    *(void *)(v13 + 32) = a1;
    *(void *)(v13 + 40) = a2;
    *(void *)(v13 + 96) = &type metadata for String;
    *(void *)(v13 + 104) = v8;
    *(void *)(v13 + 72) = v11;
    *(void *)(v13 + 80) = v12;
    swift_bridgeObjectRetain();
    uint64_t v14 = 0xD000000000000020;
    uint64_t v15 = "CONFIRMATION_DENY_MESSAGE_PARENT";
  }
  else
  {
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_100014410;
    *(void *)(v16 + 56) = &type metadata for String;
    *(void *)(v16 + 64) = v8;
    *(void *)(v16 + 32) = a1;
    *(void *)(v16 + 40) = a2;
    swift_bridgeObjectRetain();
    uint64_t v14 = 0xD000000000000019;
    uint64_t v15 = "CONFIRMATION_DENY_MESSAGE";
  }
  sub_10000DE30(v14, (unint64_t)(v15 - 32) | 0x8000000000000000);
  swift_bridgeObjectRelease();
  type metadata accessor for ConfirmationViewController();
  id v17 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v18 = a3;
  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v21 = [v17 initWithTitle:v19 detailText:v20 icon:v18];

  sub_1000083D0();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v21;
  id v23 = v21;
  os_log_type_t v24 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  id v25 = [self boldButton];
  sub_10000E1E8();
  NSString v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v25 setTitle:v26 forState:0];

  [v25 addAction:v24 forControlEvents:64];
  id v27 = [v23 buttonTray];
  [v27 addButton:v25];

  return v23;
}

uint64_t sub_1000087D4(uint64_t a1)
{
  return a1;
}

BOOL sub_100008804(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_10000881C()
{
  unsigned __int8 v7 = 0;
  if (qword_10001DAF8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10001DDE8;
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = &v7;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_10000AC20;
  *(void *)(v2 + 24) = v1;
  aBlock[4] = sub_10000AF58;
  aBlock[5] = v2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000E53C;
  aBlock[3] = &unk_100018F88;
  int v3 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  dispatch_sync(v0, v3);
  _Block_release(v3);
  LOBYTE(v0) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = v7;
    swift_release();
    return v5;
  }
  return result;
}

uint64_t sub_1000089A8(uint64_t a1, char a2)
{
  return sub_10000AA7C(a2);
}

void sub_1000089B0(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (qword_10001DAF8 != -1) {
    swift_once();
  }
  unint64_t v8 = qword_10001DDE8;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = a3;
  v9[5] = a4;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_10000AA50;
  *(void *)(v10 + 24) = v9;
  v16[4] = sub_10000AF58;
  v16[5] = v10;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_10000E53C;
  v16[3] = &unk_100018EC0;
  uint64_t v11 = _Block_copy(v16);
  id v12 = a1;
  uint64_t v13 = a2;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v8, v11);
  _Block_release(v11);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    uint64_t v15 = CFRunLoopGetMain();
    CFRunLoopAddSource(v15, v13, kCFRunLoopCommonModes);
    swift_release();
  }
}

unint64_t sub_100008B84(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000070BC(&qword_10001DE20);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  int v3 = (void *)v2;
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
    sub_10000AC4C(v6, (uint64_t)&v15, &qword_10001DE28);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000095E0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000A9C8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100008CBC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000070BC(&qword_10001DE30);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  int v3 = (void *)v2;
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
    sub_10000AC4C(v6, (uint64_t)&v13, &qword_10001DE38);
    uint64_t v7 = v13;
    unint64_t result = sub_100009658(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_10000A9C8(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100008DEC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000070BC(&qword_10001DE40);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  int v3 = (void *)v2;
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
    sub_10000AC4C(v6, (uint64_t)v15, &qword_10001DE48);
    unint64_t result = sub_1000096EC((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_10000A9C8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
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

uint64_t sub_100008F30(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  if (qword_10001DAF8 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_10001DDE8;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_100009A54;
  *(void *)(v5 + 24) = 0;
  v11[4] = sub_10000A9E8;
  v11[5] = v5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10000E53C;
  v11[3] = &unk_100018E48;
  uint64_t v6 = _Block_copy(v11);
  swift_retain();
  swift_release();
  dispatch_sync(v4, v6);
  _Block_release(v6);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (!a1 || a1 == 3)
    {
      sub_10000A92C();
      uint64_t v8 = swift_allocError();
      *uint64_t v9 = 0;
    }
    else
    {
      if (a1 == 1) {
        return a2(1, 0);
      }
      sub_10000A92C();
      uint64_t v8 = swift_allocError();
      *long long v10 = 1;
    }
    a2(v8, 1);
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_100009128(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  if (qword_10001DAF8 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_10001DDE8;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_100009A54;
  *(void *)(v5 + 24) = 0;
  v11[4] = sub_10000AF58;
  v11[5] = v5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10000E53C;
  v11[3] = &unk_100018F10;
  uint64_t v6 = _Block_copy(v11);
  swift_retain();
  swift_release();
  dispatch_sync(v4, v6);
  _Block_release(v6);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v4)
  {
    __break(1u);
  }
  else
  {
    if (a1 == 3)
    {
      sub_10000A92C();
      uint64_t v8 = swift_allocError();
      *uint64_t v9 = 0;
    }
    else
    {
      if (!a1) {
        return a2(1, 0);
      }
      sub_10000A92C();
      uint64_t v8 = swift_allocError();
      *long long v10 = 1;
    }
    a2(v8, 1);
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_100009318()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  int v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  sub_100009B40();
  static DispatchQoS.unspecified.getter();
  v5[1] = &_swiftEmptyArrayStorage;
  sub_100009B80();
  sub_1000070BC(&qword_10001DE00);
  sub_100009BD8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  uint64_t result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  qword_10001DDE8 = result;
  return result;
}

uint64_t sub_100009518(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  long long v6 = xmmword_10001DDC8;
  *(void *)&xmmword_10001DDC8 = a1;
  *((void *)&xmmword_10001DDC8 + 1) = a2;
  qword_10001DDD8 = a3;
  qword_10001DDE0 = a4;
  sub_100009AF8((void *)v6, *((void **)&v6 + 1));
  id v7 = a1;
  id v8 = a2;

  return swift_retain();
}

uint64_t sub_100009584(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100009594(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_1000095D0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_1000095E0(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100009730(a1, a2, v4);
}

unint64_t sub_100009658(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_100009814(a1, v2);
}

unint64_t sub_1000096EC(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10000998C(a1, v4);
}

unint64_t sub_100009730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    long long v10 = (void *)(v9 + 16 * v6);
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
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100009814(uint64_t a1, uint64_t a2)
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

unint64_t sub_10000998C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000ACB0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10000AD0C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void *sub_100009A54()
{
  if ((void)xmmword_10001DDC8)
  {
    uint64_t v0 = (void *)*((void *)&xmmword_10001DDC8 + 1);
    uint64_t v1 = (__CFUserNotification *)(id)xmmword_10001DDC8;
    uint64_t v2 = v0;
    swift_retain();
    CFRunLoopSourceInvalidate(v2);
    CFUserNotificationCancel(v1);
    swift_release();

    uint64_t v3 = (void *)xmmword_10001DDC8;
  }
  else
  {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (void *)*((void *)&xmmword_10001DDC8 + 1);
  xmmword_10001DDC8 = 0u;
  *(_OWORD *)&qword_10001DDD8 = 0u;

  return sub_100009AF8(v3, v4);
}

void *sub_100009AF8(void *result, void *a2)
{
  if (result)
  {

    return (void *)swift_release();
  }
  return result;
}

unint64_t sub_100009B40()
{
  unint64_t result = qword_10001DDF0;
  if (!qword_10001DDF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001DDF0);
  }
  return result;
}

unint64_t sub_100009B80()
{
  unint64_t result = qword_10001DDF8;
  if (!qword_10001DDF8)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DDF8);
  }
  return result;
}

unint64_t sub_100009BD8()
{
  unint64_t result = qword_10001DE08;
  if (!qword_10001DE08)
  {
    sub_100009C34(&qword_10001DE00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DE08);
  }
  return result;
}

uint64_t sub_100009C34(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

CFStringRef sub_100009C7C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = type metadata accessor for AppleAccount();
  uint64_t v46 = *(void *)(v6 - 8);
  uint64_t v47 = v6;
  __chkstk_darwin();
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v10 = sub_10000CA2C(a1, a2, 1);
  id v11 = [v10 localizedName];

  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;

  sub_1000070BC(&qword_10001DD78);
  uint64_t v15 = swift_allocObject();
  long long v48 = xmmword_100014410;
  *(_OWORD *)(v15 + 16) = xmmword_100014410;
  *(void *)(v15 + 56) = &type metadata for String;
  unint64_t v16 = sub_1000079BC();
  *(void *)(v15 + 64) = v16;
  *(void *)(v15 + 32) = v12;
  *(void *)(v15 + 40) = v14;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_10000E1E8();
  uint64_t v49 = v18;
  uint64_t v50 = v17;
  swift_bridgeObjectRelease();
  if (a3)
  {
    AppleAccount.init()();
    uint64_t v19 = AppleAccount.firstName.getter();
    if (v20)
    {
      uint64_t v21 = v19;
      uint64_t v22 = v20;
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_100014400;
      *(void *)(v23 + 56) = &type metadata for String;
      *(void *)(v23 + 64) = v16;
      *(void *)(v23 + 32) = v12;
      *(void *)(v23 + 40) = v14;
      *(void *)(v23 + 96) = &type metadata for String;
      *(void *)(v23 + 104) = v16;
      *(void *)(v23 + 72) = v21;
      *(void *)(v23 + 80) = v22;
    }
    else
    {
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = v48;
      *(void *)(v28 + 56) = &type metadata for String;
      *(void *)(v28 + 64) = v16;
      *(void *)(v28 + 32) = v12;
      *(void *)(v28 + 40) = v14;
    }
    uint64_t v25 = sub_10000E1E8();
    uint64_t v27 = v29;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v8, v47);
  }
  else
  {
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = v48;
    *(void *)(v24 + 56) = &type metadata for String;
    *(void *)(v24 + 64) = v16;
    *(void *)(v24 + 32) = v12;
    *(void *)(v24 + 40) = v14;
    uint64_t v25 = sub_10000E1E8();
    uint64_t v27 = v26;
    swift_bridgeObjectRelease();
  }
  uint64_t v30 = sub_10000E1E8();
  uint64_t v32 = v31;
  uint64_t v33 = sub_10000E1E8();
  uint64_t v35 = v34;
  sub_1000070BC(&qword_10001DE18);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100014590;
  CFStringRef result = kCFUserNotificationAlertHeaderKey;
  if (!kCFUserNotificationAlertHeaderKey)
  {
    __break(1u);
    goto LABEL_15;
  }
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v38;
  *(void *)(inited + 72) = &type metadata for String;
  uint64_t v39 = v49;
  *(void *)(inited + 48) = v50;
  *(void *)(inited + 56) = v39;
  CFStringRef result = kCFUserNotificationAlertMessageKey;
  if (!kCFUserNotificationAlertMessageKey)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v40;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = v25;
  *(void *)(inited + 104) = v27;
  CFStringRef result = kCFUserNotificationDefaultButtonTitleKey;
  if (!kCFUserNotificationDefaultButtonTitleKey)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 136) = v41;
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 144) = v30;
  *(void *)(inited + 152) = v32;
  CFStringRef result = kCFUserNotificationAlternateButtonTitleKey;
  if (!kCFUserNotificationAlternateButtonTitleKey)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 184) = v42;
  *(void *)(inited + 216) = &type metadata for String;
  *(void *)(inited + 192) = v33;
  *(void *)(inited + 200) = v35;
  CFStringRef result = (CFStringRef)SBUserNotificationDontDismissOnUnlock;
  if (!SBUserNotificationDontDismissOnUnlock)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  *(void *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 232) = v43;
  *(void *)(inited + 264) = &type metadata for Bool;
  *(unsigned char *)(inited + 240) = 1;
  CFStringRef result = (CFStringRef)SBUserNotificationWakeDisplay;
  if (SBUserNotificationWakeDisplay)
  {
    *(void *)(inited + 272) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 280) = v44;
    *(void *)(inited + 312) = &type metadata for Bool;
    *(unsigned char *)(inited + 288) = 0;
    sub_100008B84(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    return (CFStringRef)isa;
  }
LABEL_19:
  __break(1u);
  return result;
}

CFStringRef sub_10000A108()
{
  uint64_t v0 = sub_10000E1E8();
  uint64_t v2 = v1;
  uint64_t v3 = sub_10000DE30(0xD000000000000023, 0x8000000100015E10);
  uint64_t v5 = v4;
  uint64_t v6 = sub_10000E1E8();
  uint64_t v8 = v7;
  sub_1000070BC(&qword_10001DE18);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000145A0;
  CFStringRef result = kCFUserNotificationAlertHeaderKey;
  if (!kCFUserNotificationAlertHeaderKey)
  {
    __break(1u);
    goto LABEL_8;
  }
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v11;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v0;
  *(void *)(inited + 56) = v2;
  CFStringRef result = kCFUserNotificationAlertMessageKey;
  if (!kCFUserNotificationAlertMessageKey)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 88) = v12;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = v3;
  *(void *)(inited + 104) = v5;
  CFStringRef result = kCFUserNotificationDefaultButtonTitleKey;
  if (!kCFUserNotificationDefaultButtonTitleKey)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  *(void *)(inited + 128) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 136) = v13;
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 144) = v6;
  *(void *)(inited + 152) = v8;
  CFStringRef result = (CFStringRef)SBUserNotificationDontDismissOnUnlock;
  if (!SBUserNotificationDontDismissOnUnlock)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  *(void *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 184) = v14;
  *(void *)(inited + 216) = &type metadata for Bool;
  *(unsigned char *)(inited + 192) = 1;
  CFStringRef result = (CFStringRef)SBUserNotificationWakeDisplay;
  if (SBUserNotificationWakeDisplay)
  {
    *(void *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 232) = v15;
    *(void *)(inited + 264) = &type metadata for Bool;
    *(unsigned char *)(inited + 240) = 0;
    sub_100008B84(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    return (CFStringRef)isa;
  }
LABEL_11:
  __break(1u);
  return result;
}

void sub_10000A2F8(uint64_t a1, uint64_t a2, char a3, void *a4, int a5, uint64_t a6, unint64_t a7)
{
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v51 = *(void *)(v14 - 8);
  uint64_t v52 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v50 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v50 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v50 - v20;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a4;
  int v53 = a5;
  *(unsigned char *)(v22 + 24) = a5;
  uint64_t v54 = a6;
  *(void *)(v22 + 32) = a6;
  *(void *)(v22 + 40) = a7;
  unint64_t v23 = a7;
  id v24 = a4;
  swift_bridgeObjectRetain();
  if (sub_10000881C())
  {
    static Logger.authorization.getter();
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Already presenting a user notification. Rejecting the new request.", v27, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v51 + 8))(v21, v52);
    sub_10000A92C();
    uint64_t v28 = swift_allocError();
    *uint64_t v29 = 0;
    sub_100010928(v28, 1, (uint64_t)v24, v53, v54, v23);
    swift_errorRelease();
    swift_release();
  }
  else
  {
    if (a3)
    {
      if (a3 == 1) {
        CFDictionaryRef v30 = (const __CFDictionary *)sub_100009C7C(a1, a2, 0);
      }
      else {
        CFDictionaryRef v30 = (const __CFDictionary *)sub_10000A108();
      }
    }
    else
    {
      CFDictionaryRef v30 = (const __CFDictionary *)sub_100009C7C(a1, a2, 1);
    }
    CFDictionaryRef v31 = v30;
    SInt32 error = 0;
    CFUserNotificationRef v32 = CFUserNotificationCreate(0, 0.0, 0, &error, v30);
    if (v32)
    {
      uint64_t v33 = v32;
      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v33, (CFUserNotificationCallBack)sub_1000089A8, 0);
      if (RunLoopSource)
      {
        CFRunLoopSourceRef v35 = RunLoopSource;
        if ((a3 & 0xFE) != 0) {
          uint64_t v36 = sub_10000A9B8;
        }
        else {
          uint64_t v36 = sub_10000A9C0;
        }
        uint64_t v37 = swift_allocObject();
        *(void *)(v37 + 16) = sub_10000A918;
        *(void *)(v37 + 24) = v22;
        uint64_t v38 = v33;
        uint64_t v39 = v35;
        swift_retain();
        swift_retain();
        sub_1000089B0(v38, v39, (uint64_t)v36, v37);
        swift_release();

        swift_release_n();
      }
      else
      {
        static Logger.authorization.getter();
        uint64_t v45 = Logger.logObject.getter();
        os_log_type_t v46 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v45, v46))
        {
          uint64_t v47 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v47 = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, v46, "Failed to create run loop source", v47, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v52);
        sub_10000A92C();
        uint64_t v48 = swift_allocError();
        *uint64_t v49 = 1;
        sub_100010928(v48, 1, (uint64_t)v24, v53, v54, v23);
        swift_errorRelease();
        swift_release();
      }
    }
    else
    {
      static Logger.authorization.getter();
      uint64_t v40 = Logger.logObject.getter();
      os_log_type_t v41 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v42 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v42 = 67109120;
        swift_beginAccess();
        SInt32 v55 = error;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "Failed to create user notification. ErrorCode: %d", v42, 8u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v51 + 8))(v19, v52);
      sub_10000A92C();
      uint64_t v43 = swift_allocError();
      unsigned char *v44 = 1;
      sub_100010928(v43, 1, (uint64_t)v24, v53, v54, v23);
      swift_errorRelease();
      swift_release();
    }
  }
}

uint64_t sub_10000A8D8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_10000A918(uint64_t a1, char a2)
{
  sub_100010928(a1, a2 & 1, *(void *)(v2 + 16), *(unsigned char *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

unint64_t sub_10000A92C()
{
  unint64_t result = qword_10001DE10;
  if (!qword_10001DE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DE10);
  }
  return result;
}

uint64_t sub_10000A980()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A9B8(uint64_t a1)
{
  return sub_100009128(a1, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16));
}

uint64_t sub_10000A9C0(uint64_t a1)
{
  return sub_100008F30(a1, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16));
}

_OWORD *sub_10000A9C8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000A9D8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A9E8()
{
  return sub_10000E514(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000A9F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000AA00()
{
  return swift_release();
}

uint64_t sub_10000AA08()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000AA50()
{
  return sub_100009518(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_10000AA5C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000AA6C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000AA7C(char a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((void)xmmword_10001DDC8)
  {
    uint64_t v6 = (void (*)(void))qword_10001DDD8;
    swift_retain();
    v6(a1 & 3);
    return swift_release();
  }
  else
  {
    static Logger.authorization.getter();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "No response handler provided for the presented notification, ignoring the response.", v10, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_10000AC10()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000AC20()
{
  **(unsigned char **)(v0 + 16) = (void)xmmword_10001DDC8 != 0;
}

uint64_t sub_10000AC3C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000AC4C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000070BC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000ACB0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000AD0C(uint64_t a1)
{
  return a1;
}

uint64_t getEnumTagSinglePayload for NotificationError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for NotificationError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x10000AEBCLL);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_10000AEE4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NotificationError()
{
  return &type metadata for NotificationError;
}

unint64_t sub_10000AF04()
{
  unint64_t result = qword_10001DE50;
  if (!qword_10001DE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DE50);
  }
  return result;
}

UIImage *sub_10000AF78(void *a1)
{
  int v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  BOOL v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [v2 traitCollection];
  [v8 displayScale];
  CGFloat v10 = v9;

  [v2 size];
  CGFloat v12 = v11 + v11;
  [v2 size];
  v37.width = v12;
  UIGraphicsBeginImageContextWithOptions(v37, 0, v10);
  [v2 size];
  double v14 = v13 + -40.0;
  [v2 size];
  double v16 = v15;
  [v2 size];
  double v18 = v17;
  [v2 size];
  double v20 = v19;
  [v2 size];
  double v22 = v21;
  [v2 drawInRect:v14];
  [a1 drawInRect:0, 0.0, 0.0, v20, v22, 1.0];
  unint64_t v23 = UIGraphicsGetImageFromCurrentImageContext();
  if (v23)
  {
    id v24 = v23;
    UIGraphicsEndImageContext();
  }
  else
  {
    [v2 size];
    id v27 = [objc_allocWithZone((Class)ISImageDescriptor) initWithSize:v25 scale:v26];
    id v28 = [self genericApplicationIcon];
    id v29 = [v28 prepareImageForDescriptor:v27];

    if (v29)
    {
      id v30 = [v29 CGImage];

      if (v30)
      {
        id v31 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v30];

        return (UIImage *)v31;
      }
    }
    static Logger.authenticationUI.getter();
    uint64_t v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, v34))
    {
      CFRunLoopSourceRef v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)CFRunLoopSourceRef v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Failed to resolve merged icons and generic icon", v35, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    id v24 = (UIImage *)[objc_allocWithZone((Class)UIImage) init];
  }
  return v24;
}

uint64_t sub_10000B2EC(uint64_t a1, void (*a2)(uint64_t))
{
  sub_1000070BC(&qword_10001DE90);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(string:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_10000C880((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    id v9 = [self sharedApplication];
    URL._bridgeToObjectiveC()(v10);
    CGFloat v12 = v11;
    sub_100008CBC((uint64_t)&_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_10000C8E0(&qword_10001DCA8, type metadata accessor for OpenExternalURLOptionsKey);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v9 openURL:v12 options:isa completionHandler:0];

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v14 = type metadata accessor for FamilyControlsError();
  sub_10000C8E0((unint64_t *)&qword_10001DD70, (void (*)(uint64_t))&type metadata accessor for FamilyControlsError);
  uint64_t v15 = swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, enum case for FamilyControlsError.authorizationCanceled(_:), v14);
  a2(v15);
  return swift_errorRelease();
}

void sub_10000B5F8(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  sub_10000C798(0, (unint64_t *)&qword_10001DDC0);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  swift_retain();
  id v9 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  id v10 = [self boldButton];
  if (a1)
  {
    sub_10000E1E8();
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v10 setTitle:v11 forState:0];
  }
  else
  {
    NSString v11 = [objc_allocWithZone((Class)LAContext) init];
    if ([v11 canEvaluatePolicy:1 error:0]) {
      [v11 biometryType];
    }
    sub_10000E1E8();
    swift_bridgeObjectRelease();
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v10 setTitle:v12 forState:0];
  }
  [v10 addAction:v9 forControlEvents:64];
  id v13 = [v4 buttonTray];
  [v13 addButton:v10];
}

void sub_10000B8B8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = a4;
  v9[4] = sub_10000C860;
  v9[5] = v7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10000BA80;
  v9[3] = &unk_1000190B8;
  uint64_t v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  [a2 dismissViewControllerAnimated:1 completion:v8];
  _Block_release(v8);
}

uint64_t sub_10000B9A0(void (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for FamilyControlsError();
  sub_10000C8E0((unint64_t *)&qword_10001DD70, (void (*)(uint64_t))&type metadata accessor for FamilyControlsError);
  uint64_t v3 = swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 104))(v4, enum case for FamilyControlsError.authorizationCanceled(_:), v2);
  a1(v3);

  return swift_errorRelease();
}

uint64_t sub_10000BA80(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000BAC4(char a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for InformationalViewController();
  [super viewDidDisappear:a1 & 1];
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController;
    if (([*(id *)(result+ OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController) isMovingFromParentViewController] & 1) == 0)
    {
      if ([*(id *)(v4 + v5) isBeingDismissed])
      {
        uint64_t v6 = type metadata accessor for FamilyControlsError();
        sub_10000C8E0((unint64_t *)&qword_10001DD70, (void (*)(uint64_t))&type metadata accessor for FamilyControlsError);
        swift_allocError();
        (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v7, enum case for FamilyControlsError.authorizationCanceled(_:), v6);
        uint64_t v8 = (void *)sub_100010208();
        id v9 = (void *)_convertErrorToNSError(_:)();
        [v8 didCompleteAuthenticationRequestWithStatus:0 error:v9];
        swift_unknownObjectRelease();

        swift_errorRelease();
        sub_10001002C();
      }
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_10000BC8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)&v7[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI27InformationalViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    NSString v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    NSString v13 = 0;
    goto LABEL_6;
  }
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
LABEL_6:
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for InformationalViewController();
  id v14 = [super initWithTitle:v11 detailText:v12 symbolName:v13 contentLayout:a7];

  return v14;
}

id sub_10000BF50()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InformationalViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for InformationalViewController()
{
  return self;
}

id sub_10000BFB8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v69 = a5;
  NSString v11 = (objc_class *)type metadata accessor for AppleAccount();
  uint64_t v12 = *((void *)v11 - 1);
  __chkstk_darwin();
  id v14 = (char *)v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_10000E1E8();
  uint64_t v16 = v15;
  int v68 = a1;
  if (a1)
  {
    uint64_t v65 = v12;
    Class isa = v11;
    AppleAccount.init()();
    uint64_t v17 = AppleAccount.firstName.getter();
    if (v18)
    {
      uint64_t v19 = v17;
      uint64_t v20 = v18;
      sub_1000070BC(&qword_10001DD78);
      v64[1] = v16;
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_1000146D0;
      *(void *)(v21 + 56) = &type metadata for String;
      unint64_t v22 = sub_1000079BC();
      v64[2] = a4;
      unint64_t v23 = v22;
      *(void *)(v21 + 32) = a2;
      *(void *)(v21 + 40) = a3;
      *(void *)(v21 + 96) = &type metadata for String;
      *(void *)(v21 + 104) = v22;
      *(void *)(v21 + 64) = v22;
      *(void *)(v21 + 72) = v19;
      *(void *)(v21 + 80) = v20;
      *(void *)(v21 + 136) = &type metadata for String;
      *(void *)(v21 + 144) = v22;
      *(void *)(v21 + 112) = a2;
      *(void *)(v21 + 120) = a3;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_10000E1E8();
      uint64_t v26 = v25;
      swift_bridgeObjectRelease();
      uint64_t v71 = v24;
      uint64_t v72 = v26;
      uint64_t v27 = swift_allocObject();
      *(_OWORD *)(v27 + 16) = xmmword_100014410;
      *(void *)(v27 + 56) = &type metadata for String;
      *(void *)(v27 + 64) = v23;
      *(void *)(v27 + 32) = v19;
      *(void *)(v27 + 40) = v20;
      uint64_t v28 = sub_10000E1E8();
      uint64_t v30 = v29;
      swift_bridgeObjectRelease();
      v70._countAndFlagsBits = 2570;
      v70._object = (void *)0xE200000000000000;
      uint64_t v31 = v28;
      uint64_t v32 = v30;
    }
    else
    {
      sub_1000070BC(&qword_10001DD78);
      uint64_t v38 = swift_allocObject();
      *(_OWORD *)(v38 + 16) = xmmword_100014400;
      *(void *)(v38 + 56) = &type metadata for String;
      unint64_t v39 = sub_1000079BC();
      *(void *)(v38 + 32) = a2;
      *(void *)(v38 + 40) = a3;
      *(void *)(v38 + 96) = &type metadata for String;
      *(void *)(v38 + 104) = v39;
      *(void *)(v38 + 64) = v39;
      *(void *)(v38 + 72) = a2;
      *(void *)(v38 + 80) = a3;
      swift_bridgeObjectRetain_n();
      uint64_t v40 = sub_10000E1E8();
      uint64_t v42 = v41;
      swift_bridgeObjectRelease();
      uint64_t v71 = v40;
      uint64_t v72 = v42;
      uint64_t v31 = sub_10000E1E8();
      v70._countAndFlagsBits = 2570;
      v70._object = (void *)0xE200000000000000;
    }
    String.append(_:)(*(Swift::String *)&v31);
    swift_bridgeObjectRelease();
    String.append(_:)(v70);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, Class))(v65 + 8))(v14, isa);
  }
  else
  {
    sub_1000070BC(&qword_10001DD78);
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_100014410;
    *(void *)(v33 + 56) = &type metadata for String;
    *(void *)(v33 + 64) = sub_1000079BC();
    *(void *)(v33 + 32) = a2;
    *(void *)(v33 + 40) = a3;
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_10000E1E8();
    uint64_t v36 = v35;
    swift_bridgeObjectRelease();
    uint64_t v71 = v34;
    uint64_t v72 = v36;
    v37._countAndFlagsBits = sub_10000E1E8();
    v70._countAndFlagsBits = 2570;
    v70._object = (void *)0xE200000000000000;
    String.append(_:)(v37);
    swift_bridgeObjectRelease();
    String.append(_:)(v70);
    swift_bridgeObjectRelease();
  }
  sub_10000C798(0, &qword_10001DE88);
  v43._countAndFlagsBits = 0x73616C6772756F48;
  v43._object = (void *)0xE900000000000073;
  Class isa = UIImage.init(imageLiteralResourceName:)(v43).super.isa;
  uint64_t v44 = sub_10000AF78(isa);
  type metadata accessor for InformationalViewController();
  id v45 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  os_log_type_t v46 = v44;
  NSString v47 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v48 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v49 = [v45 initWithTitle:v47 detailText:v48 icon:v46];

  id v50 = [v49 headerView];
  [v50 setAllowFullWidthIcon:1];

  sub_10000C798(0, (unint64_t *)&qword_10001DDC0);
  uint64_t v51 = swift_allocObject();
  uint64_t v52 = v69;
  *(void *)(v51 + 16) = v69;
  *(void *)(v51 + 24) = a6;
  swift_retain();
  int v53 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  id v54 = [self accessoryButton];
  sub_10000E1E8();
  NSString v55 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v54 setTitle:v55 forState:0];

  [v54 addAction:v53 forControlEvents:64];
  id v56 = [v49 headerView];
  [v56 addAccessoryButton:v54];

  sub_10000B5F8(v68 & 1, v52, a6);
  int v57 = (void *)swift_allocObject();
  v57[2] = v49;
  v57[3] = v52;
  v57[4] = a6;
  swift_retain();
  id v58 = v49;
  v59 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  id v60 = [self buttonWithType:1];
  sub_10000E1E8();
  NSString v61 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v60 setTitle:v61 forState:0];

  [v60 addAction:v59 forControlEvents:64];
  id v62 = [v58 buttonTray];
  [v62 addButton:v60];

  return v58;
}

uint64_t sub_10000C798(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000C7D4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C80C(uint64_t a1)
{
  return sub_10000B2EC(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_10000C814()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000C854(uint64_t a1)
{
  sub_10000B8B8(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_10000C860()
{
  return sub_10000B9A0(*(void (**)(uint64_t))(v0 + 16));
}

uint64_t sub_10000C868(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000C878()
{
  return swift_release();
}

uint64_t sub_10000C880(uint64_t a1)
{
  uint64_t v2 = sub_1000070BC(&qword_10001DE90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000C8E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000C928()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

uint64_t static LSResolutions.resolveApplicationName(_:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v5 = sub_10000CA2C(a1, a2, 1);
  id v6 = [v5 localizedName];

  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v7;
}

uint64_t LSResolutions.deinit()
{
  return v0;
}

uint64_t LSResolutions.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

id sub_10000CA2C(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v6;
}

id _s30FamilyControlsAuthenticationUI13LSResolutionsC31resolveApplicationIconAsUIImageySo0J0CSSFZ_0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  id v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [self imageDescriptorNamed:kISImageDescriptorHomeScreen];
  id v9 = objc_allocWithZone((Class)ISIcon);
  swift_bridgeObjectRetain();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v11 = [v9 initWithBundleIdentifier:v10];

  id v12 = [v11 prepareImageForDescriptor:v8];
  if (v12 && (id v13 = [v12 CGImage], v12, v13))
  {
    id v14 = [objc_allocWithZone((Class)UIImage) initWithCGImage:v13];
  }
  else
  {
    static Logger.family.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v20 = v4;
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      id v21 = v8;
      uint64_t v23 = v18;
      *(_DWORD *)uint64_t v17 = 136380675;
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_100012274(a1, a2, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to resolve icon for bundle identifier: %{private}s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v20);
      id v8 = v21;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    id v14 = [objc_allocWithZone((Class)UIImage) init];
  }
  return v14;
}

uint64_t type metadata accessor for LSResolutions()
{
  return self;
}

uint64_t sub_10000CE70(char a1)
{
  if (!a1) {
    return 0xD000000000000010;
  }
  if (a1 == 1) {
    return 0x6E614D4D444D6F6ELL;
  }
  return 7105633;
}

uint64_t sub_10000CED0(char a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = os_variant_allows_internal_security_policies();
  unsigned __int8 v35 = 0;
  id v7 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v7 initWithSuiteName:v8];

  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    unsigned int v11 = [v9 BOOLForKey:v10];

    if (v11)
    {

      char v12 = 1;
LABEL_8:
      unsigned __int8 v35 = v12;
      goto LABEL_10;
    }
    NSString v13 = String._bridgeToObjectiveC()();
    unsigned __int8 v14 = [v9 BOOLForKey:v13];

    char v15 = a1;
    NSString v16 = String._bridgeToObjectiveC()();
    unsigned __int8 v17 = [v9 BOOLForKey:v16];

    a1 = v15;
    if (v15 == 2)
    {
      char v12 = v14 & v17;
      goto LABEL_8;
    }
    if (v15 == 1) {
      unsigned __int8 v35 = v17;
    }
    else {
      unsigned __int8 v35 = v14;
    }
  }
LABEL_10:
  static Logger.permissions.getter();
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v29 = v3;
    uint64_t v31 = v2;
    uint64_t v20 = swift_slowAlloc();
    v34[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315650;
    int v30 = v6;
    if (v6) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = 1953459744;
    }
    if (v6) {
      unint64_t v22 = 0xE000000000000000;
    }
    else {
      unint64_t v22 = 0xE400000000000000;
    }
    uint64_t v33 = sub_100012274(v21, v22, v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2080;
    if (a1)
    {
      if (a1 == 1)
      {
        unint64_t v23 = 0xEF746E656D656761;
        uint64_t v24 = 0x6E614D4D444D6F6ELL;
      }
      else
      {
        unint64_t v23 = 0xE300000000000000;
        uint64_t v24 = 7105633;
      }
    }
    else
    {
      uint64_t v24 = 0xD000000000000010;
      unint64_t v23 = 0x8000000100016140;
    }
    uint64_t v33 = sub_100012274(v24, v23, v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2080;
    swift_beginAccess();
    if (v35) {
      uint64_t v26 = 0;
    }
    else {
      uint64_t v26 = 1953459744;
    }
    if (v35) {
      unint64_t v27 = 0xE000000000000000;
    }
    else {
      unint64_t v27 = 0xE400000000000000;
    }
    uint64_t v32 = sub_100012274(v26, v27, v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "This device is%s internal and the permission requirement %s is%s overridden.", (uint8_t *)v20, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v31);
    if (v30) {
      goto LABEL_31;
    }
    return 0;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (!v6) {
    return 0;
  }
LABEL_31:
  swift_beginAccess();
  return v35;
}

void sub_10000D370(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *), uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    uint64_t v6 = a5 + *(int *)(type metadata accessor for AuthenticationBiometric() + 28);
    uint64_t v7 = type metadata accessor for AppleAccount();
    v19[3] = v7;
    v19[4] = (uint64_t)&protocol witness table for AppleAccount;
    NSString v8 = sub_100007498(v19);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v8, v6, v7);
    char v20 = 0;
    a3(v19);
LABEL_17:
    sub_10000D5F4((uint64_t)v19);
    return;
  }
  if (!a2) {
    return;
  }
  id v18 = (id)_convertErrorToNSError(_:)();
  id v9 = [v18 domain];
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;

  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_13;
  }
  char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
LABEL_13:
    id v21 = v18;
    type metadata accessor for LAError(0);
    sub_10000D59C();
    _BridgedStoredNSError.code.getter();
    sub_100007068();
    uint64_t v16 = swift_allocError();
    BOOL *v17 = v19[0] == -1;
    v19[0] = v16;
    char v20 = 1;
    a3(v19);

    goto LABEL_17;
  }
}

unint64_t sub_10000D59C()
{
  unint64_t result = qword_10001DC98;
  if (!qword_10001DC98)
  {
    type metadata accessor for LAError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DC98);
  }
  return result;
}

uint64_t sub_10000D5F4(uint64_t a1)
{
  uint64_t v2 = sub_1000070BC(&qword_10001DD50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for AuthenticationBiometric()
{
  uint64_t result = qword_10001DF88;
  if (!qword_10001DF88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_10000D6A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v7 = (void *)a2[2];
    uint64_t v6 = a2[3];
    a1[2] = (uint64_t)v7;
    a1[3] = v6;
    uint64_t v8 = *(int *)(a3 + 28);
    id v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for AppleAccount();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    id v13 = v7;
    v12(v9, v10, v11);
  }
  return v3;
}

uint64_t sub_10000D794(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for AppleAccount();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_10000D814(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = (void *)a2[2];
  uint64_t v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a1 + v7;
  id v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for AppleAccount();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  id v12 = v6;
  v11(v8, v9, v10);
  return a1;
}

void *sub_10000D8B8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a2[2];
  uint64_t v7 = (void *)a1[2];
  a1[2] = v6;
  id v8 = v6;

  a1[3] = a2[3];
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for AppleAccount();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_10000D970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = type metadata accessor for AppleAccount();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_10000D9F4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)a1[2];
  a1[2] = a2[2];

  a1[3] = a2[3];
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for AppleAccount();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_10000DA98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000DAAC);
}

uint64_t sub_10000DAAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for AppleAccount();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10000DB5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000DB70);
}

uint64_t sub_10000DB70(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for AppleAccount();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10000DC18()
{
  uint64_t result = type metadata accessor for AppleAccount();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_10000DCCC()
{
  id result = [self mainBundle];
  qword_10001DFC8 = (uint64_t)result;
  return result;
}

void sub_10000DD08()
{
  qword_10001DFD0 = 0x617A696C61636F4CLL;
  *(void *)algn_10001DFD8 = 0xEB00000000656C62;
}

uint64_t sub_10000DD34(uint64_t a1)
{
  if ((static Feature.isRebrandingEnabled.getter() & 1) != 0
    && (sub_10000E418(), (StringProtocol.contains<A>(_:)() & 1) == 0))
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = String.init<A>(_:)();
    String.append<A>(contentsOf:)();
    return v3;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10000DE30(uint64_t a1, uint64_t a2)
{
  sub_1000070BC(&qword_10001DFE0);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MGCopyAnswer();
  if (result)
  {
    uint64_t v25 = result;
    if (swift_dynamicCast())
    {
      uint64_t v23 = a1;
      uint64_t v24 = a2;
      swift_bridgeObjectRetain();
      v7._countAndFlagsBits = 95;
      v7._object = (void *)0xE100000000000000;
      String.append(_:)(v7);
      uint64_t v8 = v23;
      uint64_t v9 = v24;
      Swift::String v10 = String.uppercased()();
      swift_bridgeObjectRelease();
      uint64_t v23 = v8;
      uint64_t v24 = v9;
      swift_bridgeObjectRetain();
      String.append(_:)(v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_10001DB00 != -1) {
        swift_once();
      }
      uint64_t v11 = (void *)qword_10001DFC8;
      NSString v12 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      if (qword_10001DB08 != -1) {
        swift_once();
      }
      NSString v13 = String._bridgeToObjectiveC()();
      id v14 = [v11 localizedStringForKey:v12 value:0 table:v13];

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      static Locale.autoupdatingCurrent.getter();
      uint64_t v15 = type metadata accessor for Locale();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v5, 0, 1, v15);
    }
    else
    {
      if (qword_10001DB00 != -1) {
        swift_once();
      }
      uint64_t v16 = (void *)qword_10001DFC8;
      NSString v17 = String._bridgeToObjectiveC()();
      if (qword_10001DB08 != -1) {
        swift_once();
      }
      NSString v18 = String._bridgeToObjectiveC()();
      id v19 = [v16 localizedStringForKey:v17 value:0 table:v18];

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      static Locale.autoupdatingCurrent.getter();
      uint64_t v20 = type metadata accessor for Locale();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v5, 0, 1, v20);
    }
    uint64_t v21 = String.init(format:locale:arguments:)();
    swift_bridgeObjectRelease();
    sub_10000E3B8((uint64_t)v5);
    return v21;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000E1E8()
{
  sub_1000070BC(&qword_10001DFE0);
  __chkstk_darwin();
  unint64_t v1 = (char *)&v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001DB00 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_10001DFC8;
  NSString v3 = String._bridgeToObjectiveC()();
  if (qword_10001DB08 != -1) {
    swift_once();
  }
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [v2 localizedStringForKey:v3 value:0 table:v4];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static Locale.autoupdatingCurrent.getter();
  uint64_t v6 = type metadata accessor for Locale();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 0, 1, v6);
  uint64_t v7 = String.init(format:locale:arguments:)();
  swift_bridgeObjectRelease();
  sub_10000E3B8((uint64_t)v1);
  return v7;
}

uint64_t sub_10000E3B8(uint64_t a1)
{
  uint64_t v2 = sub_1000070BC(&qword_10001DFE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000E418()
{
  unint64_t result = qword_10001DFE8;
  if (!qword_10001DFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DFE8);
  }
  return result;
}

uint64_t sub_10000E46C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_1000070BC(&qword_10001DD58);
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000E514(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000E53C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_10000E564(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000E610()
{
  return 1;
}

Swift::Int sub_10000E618()
{
  return Hasher._finalize()();
}

void sub_10000E65C()
{
}

Swift::Int sub_10000E684()
{
  return Hasher._finalize()();
}

id sub_10000E6C4()
{
  v0[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType] = 4;
  unint64_t v1 = &v0[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection];
  *unint64_t v1 = 0;
  v1[1] = 0;
  uint64_t v2 = OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController;
  id v3 = objc_allocWithZone((Class)OBNavigationController);
  uint64_t v4 = v0;
  *(void *)&v0[v2] = [v3 init];
  *(void *)&v4[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___authenicationResultsAgent] = 0;
  *(void *)&v4[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___hostingAgent] = 0;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AuthenticationUIServiceViewController();
  return [super initWithNibName:0 bundle:0];
}

uint64_t sub_10000E7CC(void *a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v95 = a2;
  uint64_t v94 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v94 - 8);
  uint64_t v6 = __chkstk_darwin(v94);
  uint64_t v8 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v82 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  id v14 = (char *)&v82 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v91 = (uint64_t)&v82 - v16;
  __chkstk_darwin(v15);
  NSString v18 = (char *)&v82 - v17;
  uint64_t v19 = sub_1000070BC(&qword_10001E0B8);
  __chkstk_darwin(v19 - 8);
  uint64_t v87 = (uint8_t *)&v82 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for FamilyControlsAuthenticationUIService.ServiceType();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v89 = v21;
  uint64_t v90 = v22;
  uint64_t v23 = __chkstk_darwin(v21);
  __chkstk_darwin(v23);
  uint64_t v88 = (uint64_t)&v82 - v25;
  if (!a1)
  {
    __break(1u);
    goto LABEL_55;
  }
  uint64_t v85 = v24;
  os_log_t v86 = v18;
  uint64_t v92 = a3;
  uint64_t v93 = v5;
  id v26 = [a1 xpcEndpoint];
  if (!v26)
  {
LABEL_57:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  id v27 = v26;
  id v28 = [objc_allocWithZone((Class)NSXPCListenerEndpoint) init];
  [v28 _setEndpoint:v27];
  uint64_t v29 = type metadata accessor for FamilyControlsAuthenticationUIService();
  uint64_t v30 = static FamilyControlsAuthenticationUIService.connection(endpoint:)();
  uint64_t v32 = v31;
  swift_getObjectType();
  dispatch thunk of XPCConnectable.resume()();
  uint64_t v33 = (uint64_t *)(v96
                  + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection);
  uint64_t v34 = *(uint8_t **)(v96
                    + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection);
  uint64_t *v33 = v30;
  v33[1] = v32;
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  id v35 = [a1 userInfo];
  if (!v35)
  {
    static Logger.authenticationUI.getter();
    Swift::String v43 = Logger.logObject.getter();
    os_log_type_t v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Context missing user info", v34, 2u);
      swift_slowDealloc();
    }

    uint64_t v45 = (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v8, v94);
    os_log_type_t v46 = v95;
    if (v95) {
      goto LABEL_35;
    }
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v36 = v35;
  uint64_t v8 = (char *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v97 = static FamilyControlsAuthenticationUIService.ServiceBundleIdentifierKey.getter();
  long long v98 = v37;
  AnyHashable.init<A>(_:)();
  if (*((void *)v8 + 2) && (unint64_t v38 = sub_1000096EC((uint64_t)v99), (v39 & 1) != 0))
  {
    sub_100012958(*((void *)v8 + 7) + 32 * v38, (uint64_t)&v100);
  }
  else
  {
    long long v100 = 0u;
    long long v101 = 0u;
  }
  sub_10000AD0C((uint64_t)v99);
  if (!*((void *)&v101 + 1))
  {
LABEL_17:
    swift_bridgeObjectRelease();
    sub_100007424((uint64_t)&v100, &qword_10001E048);
LABEL_19:
    static Logger.authenticationUI.getter();
    NSString v47 = Logger.logObject.getter();
    os_log_type_t v48 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Context missing bundle identifier", v34, 2u);
      swift_slowDealloc();
    }

    uint64_t v45 = (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v11, v94);
    os_log_type_t v46 = v95;
    if (v95) {
      goto LABEL_35;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  uint64_t v32 = v97;
  id v28 = v98;
  uint64_t v97 = static FamilyControlsAuthenticationUIService.ServiceMemberKey.getter();
  long long v98 = v40;
  AnyHashable.init<A>(_:)();
  if (*((void *)v8 + 2))
  {
    unint64_t v41 = sub_1000096EC((uint64_t)v99);
    if (v42)
    {
      sub_100012958(*((void *)v8 + 7) + 32 * v41, (uint64_t)&v100);
      goto LABEL_24;
    }
  }
LABEL_23:
  long long v100 = 0u;
  long long v101 = 0u;
LABEL_24:
  sub_10000AD0C((uint64_t)v99);
  if (!*((void *)&v101 + 1))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100007424((uint64_t)&v100, &qword_10001E048);
LABEL_32:
    static Logger.authenticationUI.getter();
    NSString v55 = Logger.logObject.getter();
    os_log_type_t v56 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v55, v56))
    {
      int v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v57 = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "Context missing type of family controls member", v57, 2u);
      swift_slowDealloc();
    }

    uint64_t v45 = (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v14, v94);
    os_log_type_t v46 = v95;
    if (v95) {
      goto LABEL_35;
    }
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  if (swift_dynamicCast() & 1) == 0 || (uint64_t v49 = FamilyControlsMember.init(rawValue:)(), (v50))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  uint64_t v51 = v49;
  uint64_t v97 = static FamilyControlsAuthenticationUIService.ServiceTypeKey.getter();
  long long v98 = v52;
  AnyHashable.init<A>(_:)();
  if (*((void *)v8 + 2) && (unint64_t v53 = sub_1000096EC((uint64_t)v99), (v54 & 1) != 0))
  {
    sub_100012958(*((void *)v8 + 7) + 32 * v53, (uint64_t)&v100);
  }
  else
  {
    long long v100 = 0u;
    long long v101 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10000AD0C((uint64_t)v99);
  if (!*((void *)&v101 + 1))
  {
    swift_bridgeObjectRelease();
    id v62 = &qword_10001E048;
    v63 = (uint8_t *)&v100;
LABEL_43:
    sub_100007424((uint64_t)v63, v62);
    goto LABEL_45;
  }
  if (swift_dynamicCast())
  {
    uint64_t v34 = v87;
    FamilyControlsAuthenticationUIService.ServiceType.init(rawValue:)();
    uint64_t v29 = v89;
    uint64_t v61 = v90;
    if ((*(unsigned int (**)(uint8_t *, uint64_t, uint64_t))(v90 + 48))(v34, 1, v89) != 1) {
      goto LABEL_49;
    }
    swift_bridgeObjectRelease();
    id v62 = &qword_10001E0B8;
    v63 = v34;
    goto LABEL_43;
  }
  swift_bridgeObjectRelease();
LABEL_45:
  uint64_t v64 = v91;
  static Logger.authenticationUI.getter();
  uint64_t v61 = Logger.logObject.getter();
  os_log_type_t v65 = static os_log_type_t.error.getter();
  if (os_log_type_enabled((os_log_t)v61, v65))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v61, v65, "Context missing type", v34, 2u);
    swift_slowDealloc();
  }

  uint64_t v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v93 + 8))(v64, v94);
  os_log_type_t v46 = v95;
  if (!v95)
  {
    __break(1u);
LABEL_49:
    uint64_t v91 = v32;
    uint64_t v66 = v88;
    (*(void (**)(uint64_t, uint8_t *, uint64_t))(v61 + 32))(v88, v34, v29);
    uint64_t v67 = v86;
    static Logger.authenticationUI.getter();
    uint64_t v68 = v85;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 16))(v85, v66, v29);
    swift_bridgeObjectRetain_n();
    uint64_t v69 = Logger.logObject.getter();
    os_log_type_t v70 = static os_log_type_t.default.getter();
    uint64_t v71 = v61;
    int v72 = v70;
    if (os_log_type_enabled(v69, v70))
    {
      uint64_t v73 = swift_slowAlloc();
      uint64_t v87 = (uint8_t *)swift_slowAlloc();
      v99[0] = (uint64_t)v87;
      *(_DWORD *)uint64_t v73 = 136446466;
      int v84 = v72;
      sub_100012EF8(&qword_10001E0C8, (void (*)(uint64_t))&type metadata accessor for FamilyControlsAuthenticationUIService.ServiceType);
      uint64_t v74 = dispatch thunk of CustomStringConvertible.description.getter();
      *(void *)&long long v100 = sub_100012274(v74, v75, v99);
      os_log_t v83 = v69;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      char v76 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
      v76(v68, v29);
      *(_WORD *)(v73 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v77 = v91;
      *(void *)&long long v100 = sub_100012274(v91, (unint64_t)v28, v99);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      os_log_t v78 = v83;
      _os_log_impl((void *)&_mh_execute_header, v83, (os_log_type_t)v84, "Configured for type: %{public}s, bundle identifier: %{public}s", (uint8_t *)v73, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v93 + 8))(v86, v94);
      v79 = v95;
    }
    else
    {
      char v76 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
      v76(v68, v29);

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v93 + 8))(v67, v94);
      v79 = v95;
      uint64_t v77 = v91;
    }
    uint64_t v80 = v88;
    sub_10000F4A0(v88, v51, v77, (unint64_t)v28);
    uint64_t v81 = swift_bridgeObjectRelease();
    if (v79)
    {
      v79(v81);
      return ((uint64_t (*)(uint64_t, uint64_t))v76)(v80, v29);
    }
    goto LABEL_56;
  }
LABEL_35:
  v46(v45);
  sub_100012EA4();
  swift_allocError();
  id v58 = (void *)sub_100010208();
  v59 = (void *)_convertErrorToNSError(_:)();
  [v58 didCompleteAuthenticationRequestWithStatus:0 error:v59];
  swift_unknownObjectRelease();

  swift_errorRelease();
  return sub_10001002C();
}

uint64_t sub_10000F4A0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = type metadata accessor for FamilyControlsAuthenticationUIService.ServiceType();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  int v12 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v11, v8);
  if (v12 == enum case for FamilyControlsAuthenticationUIService.ServiceType.authenticationForChildRequest(_:))
  {
    id v13 = v4;
    swift_bridgeObjectRetain();
    uint64_t v14 = a3;
    uint64_t v15 = a4;
    char v16 = 0;
    uint64_t v17 = v13;
    int v18 = 0;
LABEL_5:
    sub_10000A2F8(v14, v15, v16, v17, v18, a3, a4);

    return swift_bridgeObjectRelease();
  }
  if (v12 == enum case for FamilyControlsAuthenticationUIService.ServiceType.authenticationForIndividualRequest(_:))
  {
    id v13 = v4;
    swift_bridgeObjectRetain();
    uint64_t v14 = a3;
    uint64_t v15 = a4;
    char v16 = 1;
    uint64_t v17 = v13;
    int v18 = 1;
    goto LABEL_5;
  }
  if (v12 == enum case for FamilyControlsAuthenticationUIService.ServiceType.authenticationForRevoke(_:))
  {
    uint64_t v20 = OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType;
    char v21 = 2;
  }
  else
  {
    if (v12 != enum case for FamilyControlsAuthenticationUIService.ServiceType.authenticationForDeletion(_:))
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
    uint64_t v20 = OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType;
    char v21 = 3;
  }
  *((unsigned char *)v4 + v20) = v21;
  uint64_t v22 = FamilyControlsMember.rawValue.getter();
  if (v22 == FamilyControlsMember.rawValue.getter()) {
    return sub_10000F6FC(a3, a4);
  }
  else {
    return sub_10000FB00(a3, a4);
  }
}

uint64_t sub_10000F6FC(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v11 = sub_10000CA2C(a1, a2, 1);
  id v12 = [v11 localizedName];

  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;

  LOBYTE(v12) = v3[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType];
  char v16 = v3;
  id v17 = sub_100007554((char)v12, v13, v15, v16);
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = v18;
    char v21 = (void *)swift_allocObject();
    v21[2] = v16;
    v21[3] = a1;
    v21[4] = a2;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = sub_1000129BC;
    *(void *)(v22 + 24) = v21;
    aBlock[4] = sub_100012A00;
    aBlock[5] = v22;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000E46C;
    aBlock[3] = &unk_1000192D0;
    uint64_t v23 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    uint64_t v24 = v16;
    sub_100012A08(v19, v20);
    swift_retain();
    swift_release();
    [v20 authenticateWithContext:v19 completion:v23];
    _Block_release(v23);
    sub_100012A48(v19, v20);

    return swift_release();
  }
  else
  {
    static Logger.authorization.getter();
    id v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "No authentication controller provided. Canceling the request.", v28, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v29 = type metadata accessor for FamilyControlsError();
    sub_100012EF8((unint64_t *)&qword_10001DD70, (void (*)(uint64_t))&type metadata accessor for FamilyControlsError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v29 - 8) + 104))(v30, enum case for FamilyControlsError.authorizationCanceled(_:), v29);
    uint64_t v31 = (void *)sub_100010208();
    uint64_t v32 = (void *)_convertErrorToNSError(_:)();
    [v31 didCompleteAuthenticationRequestWithStatus:0 error:v32];
    swift_unknownObjectRelease();

    swift_errorRelease();
    return sub_10001002C();
  }
}

uint64_t sub_10000FB00(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = type metadata accessor for AuthenticationBiometric();
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v41 + 64);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  id v10 = (uint64_t *)((char *)&v36 - v9);
  id v11 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v12 = sub_10000CA2C(a1, a2, 1);
  id v13 = [v12 localizedName];

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;

  v10[2] = (uint64_t)[objc_allocWithZone((Class)LAContext) init];
  v10[3] = 2;
  AppleAccount.init()();
  *id v10 = v14;
  v10[1] = v16;
  id v17 = (void *)swift_allocObject();
  v17[2] = v3;
  v17[3] = a1;
  v17[4] = a2;
  uint64_t v19 = (void *)v10[2];
  uint64_t v18 = v10[3];
  swift_bridgeObjectRetain_n();
  id v20 = v3;
  if ([v19 canEvaluatePolicy:v18 error:0])
  {
    sub_1000070BC(&qword_10001E0B0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100014400;
    LODWORD(aBlock[0]) = 1021;
    id v40 = v20;
    AnyHashable.init<A>(_:)();
    id v39 = v19;
    uint64_t v37 = (uint64_t)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = *v10;
    uint64_t v22 = v10[1];
    *(void *)(inited + 96) = &type metadata for String;
    *(void *)(inited + 72) = v23;
    *(void *)(inited + 80) = v22;
    uint64_t v38 = v18;
    LODWORD(aBlock[0]) = 2;
    swift_bridgeObjectRetain();
    AnyHashable.init<A>(_:)();
    sub_1000070BC(&qword_10001DD78);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_100014410;
    *(void *)(v24 + 56) = &type metadata for String;
    *(void *)(v24 + 64) = sub_1000079BC();
    *(void *)(v24 + 32) = v23;
    *(void *)(v24 + 40) = v22;
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_10000DE30(0xD000000000000010, 0x8000000100016690);
    uint64_t v27 = v26;
    swift_bridgeObjectRelease();
    *(void *)(inited + 168) = &type metadata for String;
    *(void *)(inited + 144) = v25;
    *(void *)(inited + 152) = v27;
    sub_100008DEC(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v29 = v37;
    sub_100012BFC((uint64_t)v10, v37);
    unint64_t v30 = (*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = sub_100013188;
    *(void *)(v31 + 24) = v17;
    sub_100012D64(v29, v31 + v30);
    aBlock[4] = sub_100012DC8;
    uint64_t v43 = v31;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000E564;
    aBlock[3] = &unk_100019398;
    uint64_t v32 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v39 evaluatePolicy:v38 options:isa reply:v32];
    _Block_release(v32);
    swift_bridgeObjectRelease();

    swift_release();
  }
  else
  {
    sub_100007068();
    uint64_t v33 = swift_allocError();
    *uint64_t v34 = 3;
    aBlock[0] = v33;
    LOBYTE(v43) = 1;
    sub_1000111E0((uint64_t)aBlock, (char *)v20, a1, a2);
    sub_100007424((uint64_t)aBlock, &qword_10001DD50);
    swift_bridgeObjectRelease();

    swift_release();
  }
  return sub_100012BA0((uint64_t)v10);
}

uint64_t sub_10001002C()
{
  if (qword_10001DAF8 != -1) {
    swift_once();
  }
  unint64_t v1 = qword_10001DDE8;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_100009A54;
  *(void *)(v2 + 24) = 0;
  v5[4] = sub_1000128DC;
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  void v5[2] = sub_10000E53C;
  v5[3] = &unk_100019230;
  id v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  dispatch_sync(v1, v3);
  _Block_release(v3);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v1)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v0
                   + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      dispatch thunk of XPCConnectable.invalidate()();
      swift_unknownObjectRelease();
    }
    [(id)sub_1000104D8() deactivate];
    swift_unknownObjectRelease();
    [(id)sub_1000104D8() invalidate];
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_100010208()
{
  return sub_1000104F8(&OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___authenicationResultsAgent, sub_100010228);
}

uint64_t sub_100010228(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = 0u;
  uint64_t v3 = v2 + 16;
  *(_OWORD *)(v2 + 32) = 0u;
  if (*(void *)(a1
                 + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    swift_retain();
    XPCConnectable.synchronousRemoteObjectProxy(retryCount:proxyHandler:)();
    swift_release();
    swift_unknownObjectRelease();
  }
  swift_beginAccess();
  sub_10000AC4C(v3, (uint64_t)v6, &qword_10001E048);
  if (v7)
  {
    sub_1000070BC(&qword_10001E060);
    if (swift_dynamicCast())
    {
      swift_release();
      return v5;
    }
  }
  else
  {
    sub_100007424((uint64_t)v6, &qword_10001E048);
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000103C0(uint64_t a1, uint64_t a2)
{
  sub_10000AC4C(a1, (uint64_t)v6, &qword_10001E068);
  if (v7)
  {
    _StringGuts.grow(_:)(63);
    v4._object = (void *)0x80000001000163C0;
    v4._countAndFlagsBits = 0xD00000000000003DLL;
    String.append(_:)(v4);
    sub_1000070BC((uint64_t *)&unk_10001E070);
    _print_unlocked<A, B>(_:_:)();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    sub_10000A9C8(v6, v5);
    swift_beginAccess();
    return sub_10001216C((uint64_t)v5, a2 + 16);
  }
  return result;
}

uint64_t sub_1000104D8()
{
  return sub_1000104F8(&OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___hostingAgent, (uint64_t (*)(uint64_t))sub_100010560);
}

uint64_t sub_1000104F8(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(v2 + *a1);
  if (v4)
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = a2(v2);
    *(void *)(v2 + v3) = v5;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v5;
}

uint64_t sub_100010560(void *a1)
{
  aBlock[4] = sub_100010704;
  void aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000107C4;
  aBlock[3] = &unk_1000191B8;
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = [a1 _remoteViewControllerProxyWithErrorHandler:v2];
  _Block_release(v2);
  if (v3)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
  }
  sub_1000120BC((uint64_t)&v6, (uint64_t)aBlock);
  sub_10000AC4C((uint64_t)aBlock, (uint64_t)&v6, &qword_10001E048);
  if (*((void *)&v7 + 1))
  {
    sub_1000070BC(&qword_10001E050);
    if (swift_dynamicCast())
    {
      sub_100007424((uint64_t)aBlock, &qword_10001E048);
      return v5;
    }
  }
  else
  {
    sub_100007424((uint64_t)&v6, &qword_10001E048);
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100010704()
{
  _StringGuts.grow(_:)(49);
  swift_bridgeObjectRelease();
  swift_errorRetain();
  sub_1000070BC(&qword_10001E058);
  v0._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_1000107C4(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_100010864()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AuthenticationUIServiceViewController();
  [super dealloc];
}

uint64_t type metadata accessor for AuthenticationUIServiceViewController()
{
  return self;
}

void sub_100010928(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v35 - v17;
  if (a2)
  {
    uint64_t v41 = a1;
    swift_errorRetain();
    static Logger.authorization.getter();
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    BOOL v21 = os_log_type_enabled(v19, v20);
    uint64_t v37 = a3;
    if (v21)
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      v40[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136446210;
      uint64_t v36 = v13;
      swift_beginAccess();
      uint64_t v39 = v41;
      swift_errorRetain();
      sub_1000070BC((uint64_t *)&unk_10001E070);
      uint64_t v23 = String.init<A>(describing:)();
      uint64_t v39 = sub_100012274(v23, v24, v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Failed to get user response from notification: %{public}s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v25 = v36;
    }
    else
    {

      uint64_t v25 = v13;
    }
    uint64_t v26 = *(void (**)(char *, uint64_t))(v25 + 8);
    v26(v18, v12);
    swift_beginAccess();
    uint64_t v39 = v41;
    swift_errorRetain();
    sub_1000070BC((uint64_t *)&unk_10001E070);
    if (swift_dynamicCast())
    {
      if (v38)
      {
        static Logger.authorization.getter();
        uint64_t v27 = Logger.logObject.getter();
        os_log_type_t v28 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v29 = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "Invalid response notification error. Treating it as a cancel.", v29, 2u);
          swift_slowDealloc();
        }

        v26(v16, v12);
      }
      uint64_t v30 = type metadata accessor for FamilyControlsError();
      sub_100012EF8((unint64_t *)&qword_10001DD70, (void (*)(uint64_t))&type metadata accessor for FamilyControlsError);
      uint64_t v31 = swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, enum case for FamilyControlsError.authorizationCanceled(_:), v30);
      uint64_t v41 = v31;
      swift_errorRelease();
    }
    swift_errorRetain();
    uint64_t v33 = (void *)sub_100010208();
    uint64_t v34 = (void *)_convertErrorToNSError(_:)();
    [v33 didCompleteAuthenticationRequestWithStatus:0 error:v34];
    swift_unknownObjectRelease();

    swift_errorRelease();
    sub_10001002C();
    swift_errorRelease();
  }
  else
  {
    sub_100010D8C(a4, a1 & 1, a5, a6);
  }
}

void sub_100010D8C(char a1, char a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v36 = *(char **)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v37 = _s30FamilyControlsAuthenticationUI13LSResolutionsC31resolveApplicationIconAsUIImageySo0J0CSSFZ_0(a3, a4);
  id v13 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v14 = sub_10000CA2C(a3, a4, 1);
  id v15 = [v14 localizedName];

  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;

  uint64_t v19 = swift_allocObject();
  *(unsigned char *)(v19 + 16) = a1;
  *(void *)(v19 + 24) = v5;
  *(unsigned char *)(v19 + 32) = a2 & 1;
  *(void *)(v19 + 40) = a3;
  *(void *)(v19 + 48) = a4;
  if (!a1)
  {
    int v20 = 1;
    goto LABEL_5;
  }
  if (a1 == 1)
  {
    int v20 = 0;
LABEL_5:
    swift_bridgeObjectRetain();
    BOOL v21 = v5;
    id v22 = v37;
    uint64_t v23 = (char *)sub_10000BFB8(v20, v16, v18, (uint64_t)v37, (uint64_t)sub_100012944, v19);
    swift_bridgeObjectRelease();
    *(void *)&v23[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI27InformationalViewController_delegate + 8] = &off_100019198;
    swift_unknownObjectWeakAssign();
    uint64_t v24 = OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController;
    uint64_t v25 = *(void **)&v21[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController];
    uint64_t v36 = v23;
    [v25 pushViewController:v36 animated:1];
    id v26 = *(id *)&v21[v24];
    [v21 presentViewController:v26 animated:1 completion:0];

    swift_release();
    uint64_t v27 = v36;

    return;
  }
  swift_bridgeObjectRetain();
  v5;
  swift_bridgeObjectRelease();
  static Logger.authorization.getter();
  os_log_type_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "No informational view controller provided. Dismissing authentication UI.", v30, 2u);
    swift_slowDealloc();
  }

  (*((void (**)(char *, uint64_t))v36 + 1))(v12, v10);
  uint64_t v31 = type metadata accessor for FamilyControlsError();
  sub_100012EF8((unint64_t *)&qword_10001DD70, (void (*)(uint64_t))&type metadata accessor for FamilyControlsError);
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v31 - 8) + 104))(v32, enum case for FamilyControlsError.authorizationCanceled(_:), v31);
  uint64_t v33 = (void *)sub_100010208();
  uint64_t v34 = (void *)_convertErrorToNSError(_:)();
  [v33 didCompleteAuthenticationRequestWithStatus:0 error:v34];
  swift_unknownObjectRelease();

  swift_errorRelease();
  sub_10001002C();

  swift_release();
}

uint64_t sub_1000111E0(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v64 = a4;
  uint64_t v63 = a3;
  uint64_t v59 = type metadata accessor for Logger();
  uint64_t v58 = *(void *)(v59 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  int v57 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v56 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v56 - v11;
  uint64_t v13 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v62 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = type metadata accessor for DispatchQoS();
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for AuthorizationStatus();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  BOOL v21 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000AC4C(a1, (uint64_t)v68, &qword_10001DD50);
  if (v69)
  {
    uint64_t v22 = v63;
    uint64_t v23 = v64;
    aBlock[0] = *(void *)&v68[0];
    swift_errorRetain();
    sub_1000070BC((uint64_t *)&unk_10001E070);
    if (swift_dynamicCast())
    {
      switch(v67[0])
      {
        case 1:
          static Logger.authorization.getter();
          uint64_t v24 = Logger.logObject.getter();
          os_log_type_t v25 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v24, v25))
          {
            id v26 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v26 = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, v25, "Invalid biometric recognized. Re-prompting for authorization.", v26, 2u);
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v58 + 8))(v12, v59);
          uint64_t v27 = a2;
          swift_bridgeObjectRetain();
          uint64_t v28 = v22;
          uint64_t v29 = v23;
          uint64_t v30 = 1;
          uint64_t v31 = v27;
          uint64_t v32 = 1;
          goto LABEL_11;
        case 2:
          static Logger.authorization.getter();
          char v42 = Logger.logObject.getter();
          os_log_type_t v43 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v42, v43))
          {
            os_log_type_t v44 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)os_log_type_t v44 = 0;
            _os_log_impl((void *)&_mh_execute_header, v42, v43, "Invalid Parent account. Re-prompting for authorization.", v44, 2u);
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v58 + 8))(v10, v59);
          uint64_t v27 = a2;
          swift_bridgeObjectRetain();
          uint64_t v28 = v22;
          uint64_t v29 = v23;
          uint64_t v30 = 2;
          uint64_t v31 = v27;
          uint64_t v32 = 2;
LABEL_11:
          sub_10000A2F8(v28, v29, v30, v31, v32, v22, v23);

          swift_bridgeObjectRelease();
          return swift_errorRelease();
        case 3:
          uint64_t v45 = type metadata accessor for FamilyControlsError();
          sub_100012EF8((unint64_t *)&qword_10001DD70, (void (*)(uint64_t))&type metadata accessor for FamilyControlsError);
          swift_allocError();
          uint64_t v47 = v46;
          os_log_type_t v48 = (unsigned int *)&enum case for FamilyControlsError.authenticationMethodUnavailable(_:);
          goto LABEL_17;
        case 4:
          uint64_t v49 = v57;
          static Logger.authorization.getter();
          char v50 = Logger.logObject.getter();
          os_log_type_t v51 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v50, v51))
          {
            uint64_t v52 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v52 = 0;
            _os_log_impl((void *)&_mh_execute_header, v50, v51, "Unknown authorization error. Treating it as a cancel.", v52, 2u);
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v58 + 8))(v49, v59);
          goto LABEL_16;
        default:
LABEL_16:
          uint64_t v45 = type metadata accessor for FamilyControlsError();
          sub_100012EF8((unint64_t *)&qword_10001DD70, (void (*)(uint64_t))&type metadata accessor for FamilyControlsError);
          swift_allocError();
          uint64_t v47 = v53;
          os_log_type_t v48 = (unsigned int *)&enum case for FamilyControlsError.authorizationCanceled(_:);
LABEL_17:
          (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v45 - 8) + 104))(v47, *v48, v45);
          swift_errorRelease();
          break;
      }
    }
    swift_errorRetain();
    char v54 = (void *)sub_100010208();
    NSString v55 = (void *)_convertErrorToNSError(_:)();
    [v54 didCompleteAuthenticationRequestWithStatus:0 error:v55];
    swift_unknownObjectRelease();

    swift_errorRelease();
    sub_10001002C();
    return swift_errorRelease();
  }
  else
  {
    sub_100007480(v68, (uint64_t)v67);
    uint64_t v33 = *(unsigned int *)*(&off_100019478
                           + a2[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType]);
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 104);
    uint64_t v56 = v18;
    v34(v21, v33, v18);
    id v35 = [objc_allocWithZone((Class)NSNumber) initWithInteger:AuthorizationStatus.rawValue.getter()];
    [(id)sub_100010208() didCompleteAuthenticationRequestWithStatus:v35 error:0];

    swift_unknownObjectRelease();
    sub_100009B40();
    uint64_t v36 = (void *)static OS_dispatch_queue.main.getter();
    sub_10000732C((uint64_t)v67, (uint64_t)v66);
    id v37 = (void *)swift_allocObject();
    uint64_t v38 = v63;
    v37[2] = a2;
    v37[3] = v38;
    v37[4] = v64;
    sub_100007480(v66, (uint64_t)(v37 + 5));
    aBlock[4] = sub_100012AD0;
    void aBlock[5] = v37;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000BA80;
    aBlock[3] = &unk_100019320;
    uint64_t v39 = _Block_copy(aBlock);
    id v40 = a2;
    swift_bridgeObjectRetain();
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100012EF8(&qword_10001E090, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_1000070BC(&qword_10001E098);
    sub_100012B00();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v39);

    (*(void (**)(char *, uint64_t))(v62 + 8))(v15, v13);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v17, v61);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v56);
    return sub_1000073D4((uint64_t)v67);
  }
}

void sub_100011B54(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v25 = _s30FamilyControlsAuthenticationUI13LSResolutionsC31resolveApplicationIconAsUIImageySo0J0CSSFZ_0(a1, a2);
  id v12 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v13 = sub_10000CA2C(a1, a2, 1);
  id v14 = [v13 localizedName];

  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;

  if (*(unsigned __int8 *)(v4
                                        + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType)
     - 2 >= 3)
  {
    if (*(unsigned char *)(v4
                  + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType))
      BOOL v21 = (char *)sub_100008460(v15, v17, v25, a3);
    else {
      BOOL v21 = (char *)sub_10000805C(v15, v17, v25, a3);
    }
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    *(void *)&v22[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI26ConfirmationViewController_delegate + 8] = &off_1000191A8;
    swift_unknownObjectWeakAssign();
    id v23 = objc_retain(*(id *)(v4
                            + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController));
    [v23 pushViewController:v22 animated:1];

    uint64_t v24 = v25;
  }
  else
  {
    swift_bridgeObjectRelease();
    static Logger.authorization.getter();
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "No confirmation view controller provided. Dismissing authentication UI.", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_10001002C();
  }
}

uint64_t sub_100011E24(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  if (a1)
  {
    uint64_t v6 = (void *)sub_100010208();
    uint64_t v7 = (void *)_convertErrorToNSError(_:)();
    [v6 didCompleteAuthenticationRequestWithStatus:0 error:v7];
    swift_unknownObjectRelease();

    return sub_10001002C();
  }
  if (a2)
  {
    if (a2 == 1)
    {
      *(unsigned char *)(a3
               + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType) = (a4 & 1) == 0;
      return sub_10000FB00(a5, a6);
    }
  }
  else
  {
    *(unsigned char *)(a3
             + OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType) = (a4 & 1) == 0;
  }
  return sub_10000F6FC(a5, a6);
}

unsigned char *storeEnumTagSinglePayload for AuthenticationRequestType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100012014);
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

ValueMetadata *type metadata accessor for AuthenticationRequestType()
{
  return &type metadata for AuthenticationRequestType;
}

unint64_t sub_100012050()
{
  unint64_t result = qword_10001E040;
  if (!qword_10001E040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E040);
  }
  return result;
}

uint64_t sub_1000120A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000120B4()
{
  return swift_release();
}

uint64_t sub_1000120BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070BC(&qword_10001E048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012124()
{
  if (*(void *)(v0 + 40)) {
    sub_1000073D4(v0 + 16);
  }

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100012164(uint64_t a1)
{
  return sub_1000103C0(a1, v1);
}

uint64_t sub_10001216C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000070BC(&qword_10001E048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000121D4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000121FC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100012274(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100012274(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100012348(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100012958((uint64_t)v12, *a3);
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
      sub_100012958((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000073D4((uint64_t)v12);
  return v7;
}

uint64_t sub_100012348(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100012504(a5, a6);
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

uint64_t sub_100012504(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001259C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001277C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001277C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001259C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100012714(v2, 0);
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

void *sub_100012714(uint64_t a1, uint64_t a2)
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
  sub_1000070BC((uint64_t *)&unk_10001E080);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001277C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000070BC((uint64_t *)&unk_10001E080);
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

uint64_t sub_1000128CC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000128DC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100012904()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100012944(uint64_t a1)
{
  return sub_100011E24(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_100012958(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000129BC(uint64_t a1)
{
  return sub_1000111E0(a1, *(char **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1000129C8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100012A00(uint64_t a1, uint64_t a2)
{
  return sub_10000647C(a1, a2, *(void (**)(void))(v2 + 16), *(void *)(v2 + 24));
}

id sub_100012A08(id result, void *a2)
{
  if (result)
  {
    id v2 = result;
    return a2;
  }
  return result;
}

void sub_100012A48(void *a1, void *a2)
{
  if (a1)
  {
  }
}

uint64_t sub_100012A88()
{
  swift_bridgeObjectRelease();
  sub_1000073D4(v0 + 40);

  return _swift_deallocObject(v0, 80, 7);
}

void sub_100012AD0()
{
  sub_100011B54(v0[3], v0[4], v0 + 5);
}

unint64_t sub_100012B00()
{
  unint64_t result = qword_10001E0A0;
  if (!qword_10001E0A0)
  {
    sub_100009C34(&qword_10001E098);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E0A0);
  }
  return result;
}

uint64_t sub_100012B60()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100012BA0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AuthenticationBiometric();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100012BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AuthenticationBiometric();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012C60()
{
  uint64_t v1 = (int *)(type metadata accessor for AuthenticationBiometric() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_release();
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();

  uint64_t v7 = v6 + v1[9];
  uint64_t v8 = type metadata accessor for AppleAccount();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100012D64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AuthenticationBiometric();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100012DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for AuthenticationBiometric() - 8);
  uint64_t v6 = *(void (**)(uint64_t *))(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  sub_10000D370(a1, a2, v6, v7, v8);
}

uint64_t sub_100012E4C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100012E5C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100012E94()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

unint64_t sub_100012EA4()
{
  unint64_t result = qword_10001E0C0;
  if (!qword_10001E0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E0C0);
  }
  return result;
}

uint64_t sub_100012EF8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100012F40()
{
  v0[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationType] = 4;
  uint64_t v1 = &v0[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_agentConnnection];
  *uint64_t v1 = 0;
  v1[1] = 0;
  uint64_t v2 = OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController_authenticationNavigationController;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)OBNavigationController) init];
  *(void *)&v0[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___authenicationResultsAgent] = 0;
  *(void *)&v0[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI37AuthenticationUIServiceViewController____lazy_storage___hostingAgent] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t getEnumTagSinglePayload for AuthenticationUIError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AuthenticationUIError(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1000130F0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100013118()
{
  return 0;
}

ValueMetadata *type metadata accessor for AuthenticationUIError()
{
  return &type metadata for AuthenticationUIError;
}

unint64_t sub_100013134()
{
  unint64_t result = qword_10001E0D0;
  if (!qword_10001E0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E0D0);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t _BridgedStoredNSError.code.getter()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t static Locale.autoupdatingCurrent.getter()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t dispatch thunk of FamilyMemberable.altDSID.getter()
{
  return dispatch thunk of FamilyMemberable.altDSID.getter();
}

uint64_t dispatch thunk of FamilyMemberable.firstName.getter()
{
  return dispatch thunk of FamilyMemberable.firstName.getter();
}

uint64_t dispatch thunk of FamilyCircle.currentMember.getter()
{
  return dispatch thunk of FamilyCircle.currentMember.getter();
}

uint64_t dispatch thunk of FamilyCircle.guardians.getter()
{
  return dispatch thunk of FamilyCircle.guardians.getter();
}

uint64_t FamilyCircle.init()()
{
  return FamilyCircle.init()();
}

uint64_t type metadata accessor for FamilyCircle()
{
  return type metadata accessor for FamilyCircle();
}

uint64_t static FamilyControlsAuthenticationUIService.connection(endpoint:)()
{
  return static FamilyControlsAuthenticationUIService.connection(endpoint:)();
}

uint64_t FamilyControlsAuthenticationUIService.ServiceType.init(rawValue:)()
{
  return FamilyControlsAuthenticationUIService.ServiceType.init(rawValue:)();
}

uint64_t type metadata accessor for FamilyControlsAuthenticationUIService.ServiceType()
{
  return type metadata accessor for FamilyControlsAuthenticationUIService.ServiceType();
}

uint64_t static FamilyControlsAuthenticationUIService.ServiceTypeKey.getter()
{
  return static FamilyControlsAuthenticationUIService.ServiceTypeKey.getter();
}

uint64_t static FamilyControlsAuthenticationUIService.ServiceMemberKey.getter()
{
  return static FamilyControlsAuthenticationUIService.ServiceMemberKey.getter();
}

uint64_t static FamilyControlsAuthenticationUIService.ServiceBundleIdentifierKey.getter()
{
  return static FamilyControlsAuthenticationUIService.ServiceBundleIdentifierKey.getter();
}

uint64_t type metadata accessor for FamilyControlsAuthenticationUIService()
{
  return type metadata accessor for FamilyControlsAuthenticationUIService();
}

uint64_t type metadata accessor for FamilyControlsError()
{
  return type metadata accessor for FamilyControlsError();
}

uint64_t FamilyControlsMember.init(rawValue:)()
{
  return FamilyControlsMember.init(rawValue:)();
}

uint64_t FamilyControlsMember.rawValue.getter()
{
  return FamilyControlsMember.rawValue.getter();
}

uint64_t AppleAccount.altDSID.getter()
{
  return AppleAccount.altDSID.getter();
}

uint64_t AppleAccount.firstName.getter()
{
  return AppleAccount.firstName.getter();
}

uint64_t AppleAccount.init()()
{
  return AppleAccount.init()();
}

uint64_t type metadata accessor for AppleAccount()
{
  return type metadata accessor for AppleAccount();
}

uint64_t dispatch thunk of XPCConnectable.invalidate()()
{
  return dispatch thunk of XPCConnectable.invalidate()();
}

uint64_t dispatch thunk of XPCConnectable.resume()()
{
  return dispatch thunk of XPCConnectable.resume()();
}

uint64_t XPCConnectable.synchronousRemoteObjectProxy(retryCount:proxyHandler:)()
{
  return XPCConnectable.synchronousRemoteObjectProxy(retryCount:proxyHandler:)();
}

uint64_t AuthorizationStatus.rawValue.getter()
{
  return AuthorizationStatus.rawValue.getter();
}

uint64_t type metadata accessor for AuthorizationStatus()
{
  return type metadata accessor for AuthorizationStatus();
}

uint64_t static Feature.isRebrandingEnabled.getter()
{
  return static Feature.isRebrandingEnabled.getter();
}

uint64_t static Logger.permissions.getter()
{
  return static Logger.permissions.getter();
}

uint64_t static Logger.authorization.getter()
{
  return static Logger.authorization.getter();
}

uint64_t static Logger.authenticationUI.getter()
{
  return static Logger.authenticationUI.getter();
}

uint64_t static Logger.family.getter()
{
  return static Logger.family.getter();
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

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
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

uint64_t String.init(format:locale:arguments:)()
{
  return String.init(format:locale:arguments:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
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

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
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

UIImage __swiftcall UIImage.init(imageLiteralResourceName:)(Swift::String imageLiteralResourceName)
{
  return (UIImage)UIImage.init(imageLiteralResourceName:)(imageLiteralResourceName._countAndFlagsBits, imageLiteralResourceName._object);
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
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

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

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

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}