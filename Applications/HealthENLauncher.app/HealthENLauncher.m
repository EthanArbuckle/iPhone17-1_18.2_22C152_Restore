uint64_t sub_100003138()
{
  return 1;
}

Swift::Int sub_100003140()
{
  return Hasher._finalize()();
}

void sub_100003184()
{
}

Swift::Int sub_1000031AC()
{
  return Hasher._finalize()();
}

BOOL sub_1000031EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100003204()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000324C()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100003278()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_1000032CC(uint64_t a1)
{
  swift_beginAccess();
  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    id v3 = [v2 description];
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_10000ABA8(&qword_100029A68);
  return String.init<A>(describing:)();
}

uint64_t sub_100003368()
{
  type metadata accessor for URLQueryItem();
  swift_bridgeObjectRetain();
  uint64_t v0 = Array.description.getter();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_1000033C4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = 0;
    LOBYTE(v20) = 1;
    return v21 | ((unint64_t)v20 << 32);
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((a1 & 0x1000000000000000) != 0) {
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        v6 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
      }
      v7 = sub_100004BB8(v6, v4, 10);
      LODWORD(v8) = v7;
      char v27 = BYTE4(v7) & 1;
      char v9 = BYTE4(v7) & 1;
      goto LABEL_38;
    }
    v26[0] = a1;
    v26[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    int v10 = a1;
    if (a1 == 43)
    {
      if (v3)
      {
        if (v3 != 1)
        {
          LODWORD(v8) = (BYTE1(a1) - 48);
          if (v8 <= 9)
          {
            uint64_t v15 = v3 - 2;
            if (v15)
            {
              v16 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                unsigned int v17 = *v16 - 48;
                if (v17 > 9) {
                  goto LABEL_35;
                }
                uint64_t v18 = 10 * v8;
                if ((v18 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v18 + v17;
                if (__CFADD__(v18, v17)) {
                  goto LABEL_35;
                }
                char v9 = 0;
                ++v16;
                if (!--v15) {
                  goto LABEL_38;
                }
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
    }
    else
    {
      if (a1 != 45)
      {
        if (v3)
        {
          LODWORD(v8) = (a1 - 48);
          if (v8 <= 9)
          {
            uint64_t v19 = v3 - 1;
            if (v19)
            {
              v23 = (unsigned __int8 *)v26 + 1;
              while (1)
              {
                unsigned int v24 = *v23 - 48;
                if (v24 > 9) {
                  goto LABEL_35;
                }
                uint64_t v25 = 10 * v8;
                if ((v25 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v25 + v24;
                if (__CFADD__(v25, v24)) {
                  goto LABEL_35;
                }
                char v9 = 0;
                ++v23;
                if (!--v19) {
                  goto LABEL_38;
                }
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
      if (v3)
      {
        if (v3 != 1 && (BYTE1(a1) - 48) <= 9u)
        {
          int v10 = 0;
          LODWORD(v8) = -(BYTE1(a1) - 48);
          if (BYTE1(a1) == 48)
          {
            uint64_t v11 = v3 - 2;
            if (v11)
            {
              v12 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                unsigned int v13 = *v12 - 48;
                if (v13 > 9) {
                  goto LABEL_35;
                }
                uint64_t v14 = 10 * v8;
                if ((v14 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v14 - v13;
                if (v14 < v13) {
                  goto LABEL_35;
                }
                char v9 = 0;
                ++v12;
                if (!--v11) {
                  goto LABEL_38;
                }
              }
            }
LABEL_37:
            char v9 = 0;
            goto LABEL_38;
          }
LABEL_53:
          char v9 = 1;
          LODWORD(v8) = v10;
          goto LABEL_38;
        }
LABEL_35:
        LODWORD(v8) = 0;
        char v9 = 1;
LABEL_38:
        swift_bridgeObjectRelease();
        LODWORD(v20) = v9 & 1;
        goto LABEL_39;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_53;
  }
  unint64_t v8 = sub_100004AD0(a1, a2, 10);
  swift_bridgeObjectRelease();
  uint64_t v20 = HIDWORD(v8) & 1;
LABEL_39:
  uint64_t v21 = v8;
  if (v20) {
    uint64_t v21 = 0;
  }
  return v21 | ((unint64_t)v20 << 32);
}

uint64_t sub_100003624()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100003690()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for URLParser()
{
  return self;
}

void type metadata accessor for UIBackgroundTaskIdentifier(uint64_t a1)
{
}

void type metadata accessor for CFRunLoopSource(uint64_t a1)
{
}

void type metadata accessor for CFUserNotification(uint64_t a1)
{
}

uint64_t sub_100003700()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_10000374C()
{
  return _CFObject.hash(into:)();
}

Swift::Int sub_1000037A4()
{
  return Hasher._finalize()();
}

NSNumber sub_10000380C()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100003814(uint64_t a1, uint64_t a2)
{
  uint64_t result = static Int._forceBridgeFromObjectiveC(_:result:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return result;
}

uint64_t sub_100003868(uint64_t a1, uint64_t a2)
{
  char v3 = static Int._conditionallyBridgeFromObjectiveC(_:result:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t sub_1000038C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Int._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

uint64_t sub_1000038E8@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id sub_1000038F0()
{
  return *v0;
}

uint64_t sub_1000038F8()
{
  swift_getWitnessTable();

  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_100003964()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003974(uint64_t a1)
{
  uint64_t v2 = sub_100003F64(&qword_100029B08, type metadata accessor for ENTestResultError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_1000039E0(uint64_t a1)
{
  uint64_t v2 = sub_100003F64(&qword_100029B08, type metadata accessor for ENTestResultError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100003A4C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F64(&qword_100029B08, type metadata accessor for ENTestResultError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100003ADC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F64(&qword_100029B08, type metadata accessor for ENTestResultError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

uint64_t sub_100003B5C()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003B6C(uint64_t a1)
{
  uint64_t v2 = sub_100003F64(&qword_100029AB8, type metadata accessor for ENError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100003BD8(uint64_t a1)
{
  uint64_t v2 = sub_100003F64(&qword_100029AB8, type metadata accessor for ENError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100003C44(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F64(&qword_100029AB8, type metadata accessor for ENError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100003CD4()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_100003D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003F64(&qword_100029AB8, type metadata accessor for ENError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100003D88()
{
  return Hasher._finalize()();
}

void *sub_100003DE8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100003DF8(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_100003E04(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100003E18()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_100003ED4()
{
  return sub_100003F64(&qword_100029A38, type metadata accessor for UIBackgroundTaskIdentifier);
}

uint64_t sub_100003F1C()
{
  return sub_100003F64(&qword_100029A40, type metadata accessor for UIBackgroundTaskIdentifier);
}

uint64_t sub_100003F64(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100003FAC()
{
  return sub_100003F64(&qword_100029A48, type metadata accessor for UIBackgroundTaskIdentifier);
}

uint64_t sub_100003FF4(uint64_t a1)
{
  uint64_t v2 = sub_100003F64(&qword_100029B10, type metadata accessor for ENTestResultError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100004060(uint64_t a1)
{
  uint64_t v2 = sub_100003F64(&qword_100029B10, type metadata accessor for ENTestResultError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_1000040CC(uint64_t a1)
{
  uint64_t v2 = sub_100003F64(&qword_100029B08, type metadata accessor for ENTestResultError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100004138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100003F64(&qword_100029B08, type metadata accessor for ENTestResultError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_1000041BC(uint64_t a1)
{
  uint64_t v2 = sub_100003F64(&qword_100029AC0, type metadata accessor for ENError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100004228(uint64_t a1)
{
  uint64_t v2 = sub_100003F64(&qword_100029AC0, type metadata accessor for ENError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100004294(uint64_t a1)
{
  uint64_t v2 = sub_100003F64(&qword_100029AB8, type metadata accessor for ENError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100004300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100003F64(&qword_100029AB8, type metadata accessor for ENError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100004384()
{
  return Int.hashValue.getter(*v0);
}

void sub_10000438C()
{
  Hasher._combine(_:)(*v0);
}

uint64_t sub_1000043B8()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_1000043C0(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_100004864(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    unsigned int v13 = *(char **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  unsigned int v13 = (char *)&_swiftEmptyArrayStorage;
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = String.subscript.getter();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = String.index(after:)();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = String.index(after:)();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = String.subscript.getter();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unsigned int v13 = sub_1000049C0(0, *((void *)v13 + 2) + 1, 1, v13);
  }
  unint64_t v27 = *((void *)v13 + 2);
  unint64_t v26 = *((void *)v13 + 3);
  if (v27 >= v26 >> 1) {
    unsigned int v13 = sub_1000049C0((char *)(v26 > 1), v27 + 1, 1, v13);
  }
  *((void *)v13 + 2) = v27 + 1;
  v28 = &v13[32 * v27];
  *((void *)v28 + 4) = v45;
  *((void *)v28 + 5) = v23;
  *((void *)v28 + 6) = v25;
  *((void *)v28 + 7) = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = String.index(after:)();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (*((void *)v13 + 2) != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = String.subscript.getter();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unsigned int v13 = sub_1000049C0(0, *((void *)v13 + 2) + 1, 1, v13);
    }
    unint64_t v39 = *((void *)v13 + 2);
    unint64_t v38 = *((void *)v13 + 3);
    if (v39 >= v38 >> 1) {
      unsigned int v13 = sub_1000049C0((char *)(v38 > 1), v39 + 1, 1, v13);
    }
    *((void *)v13 + 2) = v39 + 1;
    v40 = &v13[32 * v39];
    *((void *)v40 + 4) = v31;
    *((void *)v40 + 5) = v33;
    *((void *)v40 + 6) = v35;
    *((void *)v40 + 7) = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
LABEL_42:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100004864(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = String.subscript.getter();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(char **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_1000049C0(0, *((void *)v14 + 2) + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = *((void *)v14 + 2);
    unint64_t v16 = *((void *)v14 + 3);
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_1000049C0((char *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    *((void *)v14 + 2) = v17 + 1;
    char v18 = &v14[32 * v17];
    *((void *)v18 + 4) = v7;
    *((void *)v18 + 5) = v9;
    *((void *)v18 + 6) = v11;
    *((void *)v18 + 7) = v13;
    return v5 ^ 1u;
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_1000049C0(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000ABA8(&qword_100029A70);
      uint64_t v10 = (char *)swift_allocObject();
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
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
    sub_100005324(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100004AD0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v5 = sub_100004E38();
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
  int64_t v11 = sub_100004BB8(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_100004BB8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            unint64_t v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__CFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            unint64_t v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__CFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          unint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            unint64_t v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (v14 < v15) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100004E38()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = sub_100004EB8(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100004EB8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_100005010(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          char v11 = sub_10001B5F0(v9, 0),
          unint64_t v12 = sub_100005110((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
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

uint64_t sub_100005010(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_10001B658(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_10001B658(v6, v5, v4);
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

unint64_t sub_100005110(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    v9[4] = v12;
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
      uint64_t result = sub_10001B658(v12, a6, a7);
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
    uint64_t result = sub_10001B658(v12, a6, a7);
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

uint64_t sub_100005324(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100005418(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  unint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = static ENUIPublicHealthAgencyModel.activeRegion;
  if (static ENUIPublicHealthAgencyModel.activeRegion)
  {
    if (*(unsigned char *)(static ENUIPublicHealthAgencyModel.activeRegion
                  + direct field offset for ENUIPublicHealthAgencyModel.isAssociatedDomainAllowed) == 1)
    {
      [static ENUIPublicHealthAgencyModel.activeRegion supportsFeatures:2];
      return 1;
    }
    else
    {
      uint64_t v11 = Logger.launcher.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
      unint64_t v12 = Logger.logObject.getter();
      os_log_type_t v13 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        uint64_t v19 = swift_slowAlloc();
        uint64_t v21 = v19;
        unint64_t v18 = v14;
        *(_DWORD *)uint64_t v14 = 136315138;
        v17[1] = v14 + 4;
        sub_100003F64(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v20 = sub_10001B150(v15, v16, &v21);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "URL not enabled: %s", v18, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return 4;
    }
  }
  return result;
}

uint64_t sub_1000057C4(NSObject *a1)
{
  uint64_t v553 = type metadata accessor for URLQueryItem();
  uint64_t v555 = *(void *)(v553 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v542 = (char *)&v518 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  v544 = (char *)&v518 - v5;
  uint64_t v6 = __chkstk_darwin(v4);
  v530 = (char *)&v518 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  v543 = (char *)&v518 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  v529 = (char *)&v518 - v11;
  __chkstk_darwin(v10);
  v571 = (char *)&v518 - v12;
  uint64_t v13 = sub_10000ABA8(&qword_100029A60);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v535 = (uint64_t)&v518 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v552 = (char *)&v518 - v16;
  unint64_t v17 = (void *)type metadata accessor for URL();
  unint64_t v18 = (char *)*(v17 - 1);
  uint64_t v577 = (uint64_t)v17;
  v578 = v18;
  uint64_t v19 = *((void *)v18 + 8);
  uint64_t v20 = __chkstk_darwin(v17);
  isa = ((char *)&v518 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = __chkstk_darwin(v20);
  v567 = (char *)&v518 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t countAndFlagsBits = (uint64_t)&v518 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v537 = (char *)&v518 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  v531 = (char *)&v518 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  v539 = (char *)&v518 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  v534 = (char *)&v518 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  v565 = (char *)&v518 - v34;
  uint64_t v35 = __chkstk_darwin(v33);
  v546 = (char *)&v518 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  v560 = (char *)&v518 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  v554 = (char *)&v518 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  v568 = (id *)((char *)&v518 - v42);
  uint64_t v43 = __chkstk_darwin(v41);
  v562 = (char *)&v518 - v44;
  uint64_t v45 = __chkstk_darwin(v43);
  v550 = (char *)&v518 - v46;
  uint64_t v47 = __chkstk_darwin(v45);
  v548 = (char *)&v518 - v48;
  uint64_t v49 = __chkstk_darwin(v47);
  v558 = (char *)&v518 - v50;
  uint64_t v51 = __chkstk_darwin(v49);
  v556 = (char *)&v518 - v52;
  uint64_t v53 = __chkstk_darwin(v51);
  v570 = (char *)&v518 - v54;
  uint64_t v55 = __chkstk_darwin(v53);
  v557 = ((char *)&v518 - v56);
  __chkstk_darwin(v55);
  v564 = (char *)&v518 - v57;
  uint64_t v58 = type metadata accessor for Logger();
  uint64_t v579 = *(void *)(v58 - 8);
  uint64_t v59 = __chkstk_darwin(v58);
  v574 = (char *)&v518 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __chkstk_darwin(v59);
  v63 = (char *)&v518 - v62;
  uint64_t v64 = __chkstk_darwin(v61);
  object = ((char *)&v518 - v65);
  uint64_t v66 = __chkstk_darwin(v64);
  v536 = (char *)&v518 - v67;
  uint64_t v68 = __chkstk_darwin(v66);
  v538 = (char *)&v518 - v69;
  uint64_t v70 = __chkstk_darwin(v68);
  v541 = (char *)&v518 - v71;
  uint64_t v72 = __chkstk_darwin(v70);
  v527 = (char *)&v518 - v73;
  uint64_t v74 = __chkstk_darwin(v72);
  v528 = (char *)&v518 - v75;
  uint64_t v76 = __chkstk_darwin(v74);
  v540 = (char *)&v518 - v77;
  uint64_t v78 = __chkstk_darwin(v76);
  v533 = (char *)&v518 - v79;
  uint64_t v80 = __chkstk_darwin(v78);
  v532 = (char *)&v518 - v81;
  uint64_t v82 = __chkstk_darwin(v80);
  v547 = (char *)&v518 - v83;
  uint64_t v84 = __chkstk_darwin(v82);
  v559 = (char *)&v518 - v85;
  uint64_t v86 = __chkstk_darwin(v84);
  os_log_t v572 = (os_log_t)((char *)&v518 - v87);
  uint64_t v88 = __chkstk_darwin(v86);
  v549 = (char *)&v518 - v89;
  uint64_t v90 = __chkstk_darwin(v88);
  v561 = (char *)&v518 - v91;
  uint64_t v92 = __chkstk_darwin(v90);
  v569 = (char *)&v518 - v93;
  __chkstk_darwin(v92);
  v573 = (uint8_t *)&v518 - v94;
  uint64_t v95 = sub_10000ABA8(&qword_10002A0D0);
  __chkstk_darwin(v95 - 8);
  v97 = (char *)&v518 - ((v96 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = type metadata accessor for URLComponents();
  uint64_t v99 = *(void *)(v98 - 8);
  __chkstk_darwin(v98);
  v101 = (char *)&v518 - ((v100 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = a1;
  URLComponents.init(url:resolvingAgainstBaseURL:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v99 + 48))(v97, 1, v98) == 1)
  {
    sub_10000AE00((uint64_t)v97, &qword_10002A0D0);
    uint64_t v103 = Logger.launcher.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v579 + 16))(v574, v103, v58);
    uint64_t v105 = v577;
    v104 = (void (**)(NSObject *, uint64_t))v578;
    (*((void (**)(NSObject *, NSObject *, uint64_t))v578 + 2))(isa, v102, v577);
    v106 = Logger.logObject.getter();
    os_log_type_t v107 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v106, v107))
    {
      v108 = (uint8_t *)swift_slowAlloc();
      uint64_t v581 = swift_slowAlloc();
      *(_DWORD *)v108 = 136315138;
      uint64_t v576 = v58;
      v573 = v108 + 4;
      sub_100003F64(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
      v109 = isa;
      uint64_t v110 = dispatch thunk of CustomStringConvertible.description.getter();
      v580[0] = sub_10001B150(v110, v111, &v581);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v104[1](v109, v105);
      _os_log_impl((void *)&_mh_execute_header, v106, v107, "Could not get components from url: %s", v108, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v579 + 8))(v574, v576);
LABEL_4:
      uint64_t v112 = 3;
      LOBYTE(v113) = 1;
      goto LABEL_52;
    }
    v104[1](isa, v105);

    (*(void (**)(char *, uint64_t))(v579 + 8))(v574, v58);
    goto LABEL_23;
  }
  v114 = (void (**)(char *, NSObject *, uint64_t))v578;
  isa = v102;
  uint64_t v576 = v58;
  v115 = *(void (**)(char *, char *, uint64_t))(v99 + 32);
  uint64_t v545 = v98;
  v115(v101, v97, v98);
  URLComponents.scheme.getter();
  uint64_t v551 = v99;
  if (!v116)
  {
    v574 = v101;
    uint64_t v125 = Logger.launcher.unsafeMutableAddressor();
    uint64_t v126 = v579;
    uint64_t v127 = v576;
    (*(void (**)(char *, uint64_t, uint64_t))(v579 + 16))(v63, v125, v576);
    v128 = v567;
    uint64_t v129 = v577;
    v114[2](v567, isa, v577);
    v130 = Logger.logObject.getter();
    os_log_type_t v131 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v130, v131))
    {

      ((void (*)(char *, uint64_t))v114[1])(v128, v129);
      (*(void (**)(char *, uint64_t))(v126 + 8))(v63, v127);
LABEL_17:
      (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
      goto LABEL_23;
    }
    uint64_t v132 = swift_slowAlloc();
    isa = swift_slowAlloc();
    uint64_t v581 = (uint64_t)isa;
    *(_DWORD *)uint64_t v132 = 136315138;
    os_log_t v572 = (os_log_t)(v132 + 4);
    v573 = (uint8_t *)v132;
    sub_100003F64(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v133 = dispatch thunk of CustomStringConvertible.description.getter();
    v580[0] = sub_10001B150(v133, v134, &v581);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v114[1])(v128, v129);
    _os_log_impl((void *)&_mh_execute_header, v130, v131, "Could not get scheme from components: %s", v573, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v126 + 8))(v63, v576);
LABEL_15:
    (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
    uint64_t v112 = 3;
    LOBYTE(v113) = 1;
    goto LABEL_52;
  }
  Swift::String v117 = String.lowercased()();
  swift_bridgeObjectRelease();
  URLComponents.host.getter();
  uint64_t v118 = v579;
  if (!v119)
  {
    swift_bridgeObjectRelease();
    uint64_t v135 = Logger.launcher.unsafeMutableAddressor();
    v136 = *(void (**)(NSObject *, uint64_t, uint64_t))(v118 + 16);
    uint64_t v137 = v118;
    v138 = object;
    uint64_t v139 = v576;
    v136(object, v135, v576);
    uint64_t v140 = v577;
    v141 = (void (**)(uint64_t, uint64_t))v578;
    uint64_t v142 = countAndFlagsBits;
    (*((void (**)(uint64_t, NSObject *, uint64_t))v578 + 2))(countAndFlagsBits, isa, v577);
    v143 = Logger.logObject.getter();
    os_log_type_t v144 = static os_log_type_t.error.getter();
    int v145 = v144;
    if (!os_log_type_enabled(v143, v144))
    {

      v141[1](v142, v140);
      (*(void (**)(NSObject *, uint64_t))(v137 + 8))(v138, v139);
      (*(void (**)(char *, uint64_t))(v551 + 8))(v101, v545);
      goto LABEL_23;
    }
    LODWORD(isa) = v145;
    uint64_t v146 = v142;
    v147 = (uint8_t *)swift_slowAlloc();
    uint64_t v148 = swift_slowAlloc();
    v574 = v101;
    uint64_t v581 = v148;
    *(_DWORD *)v147 = 136315138;
    sub_100003F64(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v149 = dispatch thunk of CustomStringConvertible.description.getter();
    v580[0] = sub_10001B150(v149, v150, &v581);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v141[1](v146, v140);
    _os_log_impl((void *)&_mh_execute_header, v143, (os_log_type_t)isa, "Could not get host from components: %s", v147, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(NSObject *, uint64_t))(v579 + 8))(object, v576);
    goto LABEL_15;
  }
  v574 = v101;
  Swift::String v120 = String.lowercased()();
  uint64_t countAndFlagsBits = v120._countAndFlagsBits;
  object = v120._object;
  swift_bridgeObjectRelease();
  if (!static ENUIPublicHealthAgencyModel.activeRegion)
  {
    int v124 = 1;
    int v121 = 1;
    goto LABEL_19;
  }
  int v121 = *(unsigned __int8 *)(static ENUIPublicHealthAgencyModel.activeRegion
                            + direct field offset for ENUIPublicHealthAgencyModel.isAssociatedDomainAllowed);
  v122 = *(uint64_t (**)(void))((swift_isaMask & *static ENUIPublicHealthAgencyModel.activeRegion) + 0x160);
  id v123 = static ENUIPublicHealthAgencyModel.activeRegion;
  LOBYTE(v122) = v122();

  if (v122)
  {
    int v124 = 1;
LABEL_19:
    v151 = v569;
    v152 = v570;
    v153 = v573;
    goto LABEL_26;
  }
  v152 = v570;
  v153 = v573;
  if (static ENUIPublicHealthAgencyModel.activeRegion) {
    int v124 = *(unsigned __int8 *)(static ENUIPublicHealthAgencyModel.activeRegion
  }
                              + direct field offset for ENUIPublicHealthAgencyModel.isPreauthorizationDomainAllowed);
  else {
    int v124 = 1;
  }
  v151 = v569;
LABEL_26:
  LODWORD(v567) = v121;
  int v526 = v124;
  if (v117._countAndFlagsBits == 7564901 && v117._object == (void *)0xE300000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v154 = Logger.launcher.unsafeMutableAddressor();
    uint64_t v155 = v118;
    v156 = *(void (**)(uint8_t *, uint64_t, uint64_t))(v118 + 16);
    v156(v153, v154, v576);
    uint64_t v157 = v577;
    v158 = v578;
    v159 = v564;
    v549 = (char *)*((void *)v578 + 2);
    ((void (*)(char *, NSObject *, uint64_t))v549)(v564, isa, v577);
    v160 = Logger.logObject.getter();
    os_log_type_t v161 = static os_log_type_t.info.getter();
    BOOL v162 = os_log_type_enabled(v160, v161);
    v550 = (char *)v156;
    if (v162)
    {
      v163 = (uint8_t *)swift_slowAlloc();
      uint64_t v581 = swift_slowAlloc();
      *(_DWORD *)v163 = 136315138;
      v570 = (char *)(v163 + 4);
      sub_100003F64(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v164 = dispatch thunk of CustomStringConvertible.description.getter();
      v580[0] = sub_10001B150(v164, v165, &v581);
      int v166 = (int)v567;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v570 = (char *)*((void *)v578 + 1);
      ((void (*)(char *, uint64_t))v570)(v159, v157);
      _os_log_impl((void *)&_mh_execute_header, v160, v161, "Received deep link: %s", v163, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v167 = v573;
      v573 = *(uint8_t **)(v579 + 8);
      ((void (*)(uint8_t *, uint64_t))v573)(v167, v576);
      v168 = 0;
      uint64_t v169 = v157;
      v170 = isa;
      v172 = v565;
      v171 = object;
      os_log_t v173 = v572;
      uint64_t v174 = countAndFlagsBits;
    }
    else
    {
      v570 = (char *)*((void *)v158 + 1);
      ((void (*)(char *, uint64_t))v570)(v159, v157);

      v175 = v573;
      v573 = *(uint8_t **)(v155 + 8);
      ((void (*)(uint8_t *, uint64_t))v573)(v175, v576);
      v168 = 0;
      uint64_t v169 = v157;
      v170 = isa;
      v172 = v565;
      v171 = object;
      os_log_t v173 = v572;
      uint64_t v174 = countAndFlagsBits;
      int v166 = (int)v567;
    }
    goto LABEL_32;
  }
  if (v117._countAndFlagsBits == 0x7370747468 && v117._object == (void *)0xE500000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || v117._countAndFlagsBits == 1886680168 && v117._object == (void *)0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v308 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v308 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v309 = Logger.launcher.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v118 + 16))(v549, v309, v576);
      uint64_t v311 = v577;
      v310 = (void (**)(unint64_t, char *, uint64_t))v578;
      v312 = (void (*)(char *, NSObject *, uint64_t))*((void *)v578 + 2);
      v313 = v548;
      v312(v548, isa, v577);
      uint64_t v314 = v118;
      v312(v550, v313, v311);
      unint64_t v315 = (*((unsigned __int8 *)v310 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v310 + 80);
      uint64_t v316 = swift_allocObject();
      v310[4](v316 + v315, v313, v311);
      v317 = Logger.logObject.getter();
      uint64_t v318 = v314;
      LOBYTE(v310) = static os_log_type_t.error.getter();
      uint64_t v319 = swift_allocObject();
      *(unsigned char *)(v319 + 16) = 32;
      uint64_t v320 = swift_allocObject();
      *(unsigned char *)(v320 + 16) = 8;
      uint64_t v321 = swift_allocObject();
      *(void *)(v321 + 16) = sub_10000ABF0;
      *(void *)(v321 + 24) = v316;
      uint64_t v322 = swift_allocObject();
      *(void *)(v322 + 16) = sub_10000AC1C;
      *(void *)(v322 + 24) = v321;
      sub_10000ABA8(&qword_10002A080);
      uint64_t inited = swift_initStackObject();
      sub_10001B0A0(inited, 3);
      void *v324 = sub_10000AC04;
      v324[1] = v319;
      v324[2] = sub_10000BD4C;
      v324[3] = v320;
      v324[4] = sub_10000AC24;
      v324[5] = v322;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      os_log_type_t v325 = v310;
      isa = v317;
      if (os_log_type_enabled(v317, (os_log_type_t)v310))
      {
        v326 = (uint8_t *)swift_slowAlloc();
        uint64_t v581 = swift_slowAlloc();
        *(_WORD *)v326 = 258;
        v326[2] = 32;
        swift_release();
        v326[3] = 8;
        swift_release();
        sub_100003F64(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v327 = v577;
        uint64_t v328 = dispatch thunk of CustomStringConvertible.description.getter();
        v580[0] = sub_10001B150(v328, v329, &v581);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        (*((void (**)(char *, uint64_t))v578 + 1))(v550, v327);
        v330 = isa;
        _os_log_impl((void *)&_mh_execute_header, isa, v325, "URL not supported: %s", v326, 0xCu);
        LOBYTE(v113) = 1;
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v579 + 8))(v549, v576);
LABEL_105:
        (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
        uint64_t v112 = 2;
        goto LABEL_52;
      }
      swift_release();
      swift_release();
      swift_release();

      (*((void (**)(char *, uint64_t))v578 + 1))(v550, v577);
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v318 + 8))(v549, v576);
LABEL_124:
      (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
      LOBYTE(v113) = 1;
      uint64_t v112 = 2;
      goto LABEL_52;
    }
  }
  uint64_t v213 = Logger.launcher.unsafeMutableAddressor();
  v214 = *(char **)(v118 + 16);
  v548 = (char *)v213;
  v550 = v214;
  v564 = (char *)(v118 + 16);
  ((void (*)(char *))v214)(v151);
  uint64_t v216 = v577;
  v215 = v578;
  v218 = (uint8_t *)(v578 + 16);
  v217 = (void (*)(char *, NSObject *, uint64_t))*((void *)v578 + 2);
  v219 = v557;
  v217((char *)v557, isa, v577);
  v549 = (char *)v217;
  v573 = v218;
  v217(v152, v219, v216);
  uint64_t v220 = v215[80];
  uint64_t v221 = (v220 + 16) & ~v220;
  uint64_t v523 = v220 | 7;
  uint64_t v524 = v221 + v19;
  uint64_t v222 = swift_allocObject();
  uint64_t v525 = v221;
  v223 = (void (*)(char *, char *, uint64_t))*((void *)v215 + 4);
  v557 = (v215 + 32);
  v522 = v223;
  v223((char *)(v222 + v221), (char *)v219, v216);
  v224 = Logger.logObject.getter();
  LOBYTE(v219) = static os_log_type_t.info.getter();
  uint64_t v225 = swift_allocObject();
  *(unsigned char *)(v225 + 16) = 32;
  uint64_t v226 = swift_allocObject();
  *(unsigned char *)(v226 + 16) = 8;
  uint64_t v227 = swift_allocObject();
  *(void *)(v227 + 16) = sub_10000ABF0;
  *(void *)(v227 + 24) = v222;
  uint64_t v228 = swift_allocObject();
  *(void *)(v228 + 16) = sub_10000BD40;
  *(void *)(v228 + 24) = v227;
  uint64_t v521 = sub_10000ABA8(&qword_10002A080);
  uint64_t v229 = swift_initStackObject();
  sub_10001B0A0(v229, 3);
  void *v230 = sub_10000BD4C;
  v230[1] = v225;
  v230[2] = sub_10000BD4C;
  v230[3] = v226;
  v230[4] = sub_10000BD48;
  v230[5] = v228;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  os_log_type_t v231 = v219;
  if (os_log_type_enabled(v224, (os_log_type_t)v219))
  {
    v232 = (uint8_t *)swift_slowAlloc();
    uint64_t v520 = swift_slowAlloc();
    uint64_t v581 = v520;
    *(_WORD *)v232 = 258;
    v232[2] = 32;
    swift_release();
    v232[3] = 8;
    swift_release();
    v518 = v232 + 4;
    sub_100003F64(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
    v233 = v570;
    os_log_t v519 = v224;
    uint64_t v234 = v577;
    uint64_t v235 = dispatch thunk of CustomStringConvertible.description.getter();
    v580[0] = sub_10001B150(v235, v236, &v581);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    v570 = (char *)*((void *)v578 + 1);
    ((void (*)(char *, uint64_t))v570)(v233, v234);
    os_log_t v237 = v519;
    _os_log_impl((void *)&_mh_execute_header, v519, v231, "Received associated domain link: %s", v232, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v238 = *(uint8_t **)(v579 + 8);
    uint64_t v239 = ((uint64_t (*)(char *, uint64_t))v238)(v569, v576);
    uint64_t v169 = v234;
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v169 = v577;
    v240 = v570;
    v570 = (char *)*((void *)v578 + 1);
    ((void (*)(char *, uint64_t))v570)(v240, v577);

    v238 = *(uint8_t **)(v579 + 8);
    uint64_t v239 = ((uint64_t (*)(char *, uint64_t))v238)(v569, v576);
  }
  os_log_t v173 = v572;
  int v166 = (int)v567;
  v241 = v561;
  if (!v567)
  {
    swift_bridgeObjectRelease();
    ((void (*)(char *, char *, uint64_t))v550)(v241, v548, v576);
    v245 = v556;
    v246 = v549;
    ((void (*)(char *, NSObject *, uint64_t))v549)(v556, isa, v169);
    ((void (*)(char *, char *, uint64_t))v246)(v558, v245, v169);
    v247 = swift_allocObject();
    v522((char *)v247 + v525, v245, v169);
    v248 = Logger.logObject.getter();
    LOBYTE(v245) = static os_log_type_t.error.getter();
    uint64_t v249 = swift_allocObject();
    *(unsigned char *)(v249 + 16) = 32;
    uint64_t v250 = swift_allocObject();
    *(unsigned char *)(v250 + 16) = 8;
    uint64_t v251 = swift_allocObject();
    *(void *)(v251 + 16) = sub_10000ABF0;
    *(void *)(v251 + 24) = v247;
    uint64_t v252 = swift_allocObject();
    *(void *)(v252 + 16) = sub_10000BD40;
    *(void *)(v252 + 24) = v251;
    uint64_t v253 = swift_initStackObject();
    sub_10001B0A0(v253, 3);
    void *v254 = sub_10000BD4C;
    v254[1] = v249;
    v254[2] = sub_10000BD4C;
    v254[3] = v250;
    v254[4] = sub_10000BD48;
    v254[5] = v252;
    os_log_t v572 = v247;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v255 = v245;
    isa = v248;
    if (os_log_type_enabled(v248, (os_log_type_t)v245))
    {
      v256 = (uint8_t *)swift_slowAlloc();
      uint64_t v257 = swift_slowAlloc();
      v573 = v238;
      v258 = v558;
      uint64_t v581 = v257;
      *(_WORD *)v256 = 258;
      v256[2] = 32;
      swift_release();
      v256[3] = 8;
      swift_release();
      sub_100003F64(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v259 = v577;
      uint64_t v260 = dispatch thunk of CustomStringConvertible.description.getter();
      v580[0] = sub_10001B150(v260, v261, &v581);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v570)(v258, v259);
      v262 = isa;
      _os_log_impl((void *)&_mh_execute_header, isa, v255, "Associated URL support not enabled: %s", v256, 0xCu);
      LOBYTE(v113) = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v263 = v561;
LABEL_90:
      ((void (*)(char *, uint64_t))v573)(v263, v576);
      (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
      uint64_t v112 = 4;
      goto LABEL_52;
    }
    swift_release();
    swift_release();
    swift_release();

    ((void (*)(char *, uint64_t))v570)(v558, v577);
    swift_release();
    swift_release();
    ((void (*)(char *, uint64_t))v238)(v561, v576);
LABEL_95:
    (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
    LOBYTE(v113) = 1;
    uint64_t v112 = 4;
    goto LABEL_52;
  }
  v573 = v238;
  v569 = (char *)&v518;
  uint64_t v581 = 46;
  unint64_t v582 = 0xE100000000000000;
  __chkstk_darwin(v239);
  *(&v518 - 2) = (uint8_t *)&v581;
  v242 = object;
  swift_bridgeObjectRetain_n();
  uint64_t v174 = countAndFlagsBits;
  v168 = 0;
  uint64_t v243 = sub_1000043C0(0x7FFFFFFFFFFFFFFFLL, 1, sub_10000ACC8, (uint64_t)(&v518 - 4), countAndFlagsBits, (unint64_t)v242);
  swift_bridgeObjectRelease();
  if (!*(void *)(v243 + 16))
  {
    swift_bridgeObjectRelease();
    v170 = isa;
    v172 = v565;
    v171 = object;
    goto LABEL_32;
  }
  v569 = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v244 = object;
  if (v174 == 1868770919 && object == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    v171 = 0xE400000000000000;
    uint64_t v174 = 1868770919;
    uint64_t v169 = v577;
    v170 = isa;
    v172 = v565;
  }
  else
  {
    char v307 = _stringCompareWithSmolCheck(_:_:expecting:)();
    v170 = isa;
    v172 = v565;
    if (v307)
    {
      swift_bridgeObjectRelease();
      uint64_t v169 = v577;
      int v166 = (int)v567;
      os_log_t v173 = v572;
      v171 = v244;
      v168 = v569;
      uint64_t v174 = countAndFlagsBits;
      goto LABEL_32;
    }
    swift_bridgeObjectRelease();
    uint64_t v174 = static String._fromSubstring(_:)();
    v332 = v331;
    swift_bridgeObjectRelease();
    v171 = v332;
    uint64_t v169 = v577;
  }
  int v166 = (int)v567;
  os_log_t v173 = v572;
  v168 = v569;
LABEL_32:
  v176 = v571;
  if (v174 == 1868770919 && v171 == 0xE400000000000000
    || (v569 = v168, v177 = v171, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    uint64_t v178 = URL.pathComponents.getter();
    uint64_t v179 = v178;
    v180 = v568;
    if (v166 && *(void *)(v178 + 16))
    {
      URL.path.getter();
      v181._uint64_t countAndFlagsBits = 1936614703;
      v181._object = (void *)0xE400000000000000;
      Swift::Bool v182 = String.hasPrefix(_:)(v181);
      swift_bridgeObjectRelease();
      if (v182)
      {
        URL.path.getter();
        v183._uint64_t countAndFlagsBits = 0x2F722F736E652FLL;
        v183._object = (void *)0xE700000000000000;
        Swift::Bool v184 = String.hasPrefix(_:)(v183);
        swift_bridgeObjectRelease();
        if (!v184 || *(void *)(v179 + 16) < 4uLL)
        {
          swift_bridgeObjectRelease();
          URL.path.getter();
          v185._object = (void *)0x800000010001F200;
          v185._uint64_t countAndFlagsBits = 0xD000000000000011;
          Swift::Bool v186 = String.hasPrefix(_:)(v185);
          swift_bridgeObjectRelease();
          uint64_t v187 = v551;
          v188 = v574;
          if (v186)
          {
            uint64_t v189 = static ENUIPublicHealthAgencyModel.activeRegion;
            (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
            if (!v189)
            {
              uint64_t v112 = 0;
              goto LABEL_113;
            }
            if ((v526 & 1) == 0) {
              goto LABEL_23;
            }
LABEL_43:
            uint64_t v112 = 0;
LABEL_113:
            LOBYTE(v113) = 0;
            goto LABEL_52;
          }
          URL.path.getter();
          v304._uint64_t countAndFlagsBits = 0x7065722F736E652FLL;
          v304._object = (void *)0xEB0000000074726FLL;
          Swift::Bool v305 = String.hasPrefix(_:)(v304);
          swift_bridgeObjectRelease();
          if (v305)
          {
            uint64_t v112 = sub_100005418((uint64_t)v170);
            uint64_t v113 = (v306 >> 40) & 1;
            (*(void (**)(char *, uint64_t))(v187 + 8))(v188, v545);
            goto LABEL_52;
          }
          (*(void (**)(char *, uint64_t))(v187 + 8))(v188, v545);
          goto LABEL_118;
        }
        uint64_t v112 = *(void *)(v179 + 80);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
        goto LABEL_119;
      }
      swift_bridgeObjectRelease();
      os_log_t v173 = v572;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v190 = Logger.launcher.unsafeMutableAddressor();
    ((void (*)(os_log_t, uint64_t, uint64_t))v550)(v173, v190, v576);
    v191 = (void (**)(unint64_t, char *, uint64_t))v578;
    v192 = v562;
    v193 = v170;
    v194 = v549;
    ((void (*)(char *, NSObject *, uint64_t))v549)(v562, v193, v169);
    ((void (*)(id *, char *, uint64_t))v194)(v180, v192, v169);
    unint64_t v195 = (*((unsigned __int8 *)v191 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v191 + 80);
    uint64_t v196 = swift_allocObject();
    v191[4](v196 + v195, v192, v169);
    v197 = Logger.logObject.getter();
    os_log_type_t v198 = static os_log_type_t.error.getter();
    uint64_t v199 = swift_allocObject();
    *(unsigned char *)(v199 + 16) = 32;
    uint64_t v200 = swift_allocObject();
    *(unsigned char *)(v200 + 16) = 8;
    uint64_t v201 = swift_allocObject();
    *(void *)(v201 + 16) = sub_10000ABF0;
    *(void *)(v201 + 24) = v196;
    uint64_t v202 = swift_allocObject();
    *(void *)(v202 + 16) = sub_10000BD40;
    *(void *)(v202 + 24) = v201;
    sub_10000ABA8(&qword_10002A080);
    uint64_t v203 = swift_allocObject();
    sub_10001B0A0(v203, 3);
    void *v204 = sub_10000BD4C;
    v204[1] = v199;
    v204[2] = sub_10000BD4C;
    v204[3] = v200;
    v204[4] = sub_10000BD48;
    v204[5] = v202;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v205 = v198;
    isa = v197;
    if (os_log_type_enabled(v197, v198))
    {
      v206 = (uint8_t *)swift_slowAlloc();
      v571 = (char *)swift_slowAlloc();
      uint64_t v581 = (uint64_t)v571;
      *(_WORD *)v206 = 258;
      v206[2] = 32;
      swift_release();
      v206[3] = 8;
      swift_release();
      v569 = (char *)(v206 + 4);
      sub_100003F64(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
      v207 = v568;
      uint64_t v208 = v577;
      uint64_t v209 = dispatch thunk of CustomStringConvertible.description.getter();
      v580[0] = sub_10001B150(v209, v210, &v581);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      ((void (*)(id *, uint64_t))v570)(v207, v208);
      v211 = isa;
      _os_log_impl((void *)&_mh_execute_header, isa, v205, "URL not supported: %s", v206, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();

      ((void (*)(id *, uint64_t))v570)(v568, v577);
      swift_release();
      swift_release();
    }
    ((void (*)(os_log_t, uint64_t))v573)(v572, v576);
    (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
    if (v567) {
      uint64_t v112 = 4;
    }
    else {
      uint64_t v112 = 3;
    }
    LOBYTE(v113) = 1;
    goto LABEL_52;
  }
  if (v174 == 111 && v177 == 0xE100000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || v174 == 0x696472616F626E6FLL && v177 == 0xEA0000000000676ELL
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || v174 == 0x6472616F626E6FLL && v177 == 0xE700000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v265 = v559;
    v264 = v560;
    if (v166)
    {
      v266 = v574;
      uint64_t v267 = URLComponents.queryItems.getter();
      if (v267)
      {
        uint64_t v268 = *(void *)(v267 + 16);
        uint64_t v269 = v551;
        if (v268)
        {
          v270 = *(void (**)(char *, unint64_t, uint64_t))(v555 + 16);
          unint64_t v271 = v267 + ((*(unsigned __int8 *)(v555 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v555 + 80));
          v272 = (void (**)(char *, uint64_t))(v555 + 8);
          uint64_t v273 = v553;
          uint64_t v274 = *(void *)(v555 + 72);
          uint64_t v579 = v267;
          swift_bridgeObjectRetain();
          while (1)
          {
            uint64_t v275 = v273;
            v270(v176, v271, v273);
            if (URLQueryItem.name.getter() == 114 && v276 == 0xE100000000000000)
            {
              swift_bridgeObjectRelease();
              goto LABEL_115;
            }
            char v277 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if (v277) {
              break;
            }
            v176 = v571;
            (*v272)(v571, v273);
            v271 += v274;
            if (!--v268)
            {
              swift_bridgeObjectRelease();
              uint64_t v278 = 1;
              uint64_t v279 = v555;
              uint64_t v269 = v551;
              uint64_t v280 = (uint64_t)v552;
              goto LABEL_116;
            }
          }
          v176 = v571;
LABEL_115:
          swift_bridgeObjectRelease();
          uint64_t v279 = v555;
          uint64_t v280 = (uint64_t)v552;
          (*(void (**)(char *, char *, uint64_t))(v555 + 32))(v552, v176, v275);
          uint64_t v278 = 0;
          uint64_t v269 = v551;
        }
        else
        {
          uint64_t v278 = 1;
          uint64_t v279 = v555;
          uint64_t v280 = (uint64_t)v552;
          uint64_t v275 = v553;
        }
LABEL_116:
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v279 + 56))(v280, v278, 1, v275);
        swift_bridgeObjectRelease();
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v279 + 48))(v280, 1, v275) != 1)
        {
          uint64_t v333 = URLQueryItem.value.getter();
          uint64_t v335 = v334;
          (*(void (**)(char *, uint64_t))(v269 + 8))(v574, v545);
          (*(void (**)(uint64_t, uint64_t))(v279 + 8))(v280, v275);
          LOBYTE(v113) = 0;
          if (v335) {
            uint64_t v112 = v333;
          }
          else {
            uint64_t v112 = 0;
          }
          goto LABEL_52;
        }
        (*(void (**)(char *, uint64_t))(v269 + 8))(v574, v545);
        sub_10000AE00(v280, &qword_100029A60);
LABEL_118:
        uint64_t v112 = 0;
        goto LABEL_119;
      }
      (*(void (**)(char *, uint64_t))(v551 + 8))(v266, v545);
      uint64_t v112 = 0;
LABEL_119:
      LOBYTE(v113) = 0;
      goto LABEL_52;
    }
    uint64_t v281 = Logger.launcher.unsafeMutableAddressor();
    ((void (*)(char *, uint64_t, uint64_t))v550)(v265, v281, v576);
    v282 = (void (**)(unint64_t, char *, uint64_t))v578;
    v283 = v554;
    v284 = v170;
    v285 = v549;
    ((void (*)(char *, NSObject *, uint64_t))v549)(v554, v284, v169);
    ((void (*)(char *, char *, uint64_t))v285)(v264, v283, v169);
    unint64_t v286 = (*((unsigned __int8 *)v282 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v282 + 80);
    uint64_t v287 = swift_allocObject();
    v282[4](v287 + v286, v283, v169);
    v288 = Logger.logObject.getter();
    os_log_type_t v289 = static os_log_type_t.error.getter();
    uint64_t v290 = swift_allocObject();
    *(unsigned char *)(v290 + 16) = 32;
    uint64_t v291 = swift_allocObject();
    *(unsigned char *)(v291 + 16) = 8;
    uint64_t v292 = swift_allocObject();
    *(void *)(v292 + 16) = sub_10000ABF0;
    *(void *)(v292 + 24) = v287;
    uint64_t v293 = swift_allocObject();
    *(void *)(v293 + 16) = sub_10000BD40;
    *(void *)(v293 + 24) = v292;
    sub_10000ABA8(&qword_10002A080);
    uint64_t v294 = swift_allocObject();
    sub_10001B0A0(v294, 3);
    void *v295 = sub_10000BD4C;
    v295[1] = v290;
    v295[2] = sub_10000BD4C;
    v295[3] = v291;
    v295[4] = sub_10000BD48;
    v295[5] = v293;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v296 = v289;
    isa = v288;
    if (os_log_type_enabled(v288, v289))
    {
      v297 = (uint8_t *)swift_slowAlloc();
      os_log_t v572 = (os_log_t)swift_slowAlloc();
      uint64_t v581 = (uint64_t)v572;
      *(_WORD *)v297 = 258;
      v297[2] = 32;
      swift_release();
      v297[3] = 8;
      swift_release();
      v571 = (char *)(v297 + 4);
      sub_100003F64(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
      v298 = v560;
      uint64_t v299 = v577;
      uint64_t v300 = dispatch thunk of CustomStringConvertible.description.getter();
      v580[0] = sub_10001B150(v300, v301, &v581);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v570)(v298, v299);
      v302 = isa;
      _os_log_impl((void *)&_mh_execute_header, isa, v296, "URL not enabled: %s", v297, 0xCu);
      LOBYTE(v113) = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v263 = v559;
      goto LABEL_90;
    }
    swift_release();
    swift_release();
    swift_release();

    ((void (*)(char *, uint64_t))v570)(v560, v577);
    swift_release();
    swift_release();
    v303 = v559;
    goto LABEL_94;
  }
  if (v174 == 97 && v177 == 0xE100000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || v174 == 0x7A69726F68747561 && v177 == 0xE900000000000065
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v336 = v550;
LABEL_132:
    v337 = v547;
    if ((v166 & v526) == 1)
    {
      (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
      goto LABEL_43;
    }
    uint64_t v338 = Logger.launcher.unsafeMutableAddressor();
    ((void (*)(char *, uint64_t, uint64_t))v336)(v337, v338, v576);
    v339 = (void (**)(unint64_t, char *, uint64_t))v578;
    v340 = v546;
    v341 = v170;
    v342 = v549;
    ((void (*)(char *, NSObject *, uint64_t))v549)(v546, v341, v169);
    ((void (*)(char *, char *, uint64_t))v342)(v172, v340, v169);
    unint64_t v343 = (*((unsigned __int8 *)v339 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v339 + 80);
    uint64_t v344 = swift_allocObject();
    v339[4](v344 + v343, v340, v169);
    v345 = Logger.logObject.getter();
    os_log_type_t v346 = static os_log_type_t.error.getter();
    uint64_t v347 = swift_allocObject();
    *(unsigned char *)(v347 + 16) = 32;
    uint64_t v348 = swift_allocObject();
    *(unsigned char *)(v348 + 16) = 8;
    uint64_t v349 = swift_allocObject();
    *(void *)(v349 + 16) = sub_10000ABF0;
    *(void *)(v349 + 24) = v344;
    uint64_t v350 = swift_allocObject();
    *(void *)(v350 + 16) = sub_10000BD40;
    *(void *)(v350 + 24) = v349;
    sub_10000ABA8(&qword_10002A080);
    uint64_t v351 = swift_allocObject();
    sub_10001B0A0(v351, 3);
    void *v352 = sub_10000BD4C;
    v352[1] = v347;
    v352[2] = sub_10000BD4C;
    v352[3] = v348;
    v352[4] = sub_10000BD48;
    v352[5] = v350;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v353 = v346;
    if (os_log_type_enabled(v345, v346))
    {
      v354 = (uint8_t *)swift_slowAlloc();
      v355 = swift_slowAlloc();
      os_log_t v572 = v345;
      isa = v355;
      uint64_t v581 = (uint64_t)v355;
      *(_WORD *)v354 = 258;
      v354[2] = 32;
      swift_release();
      v354[3] = 8;
      swift_release();
      v571 = (char *)(v354 + 4);
      sub_100003F64(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
      v356 = v565;
      uint64_t v357 = v577;
      uint64_t v358 = dispatch thunk of CustomStringConvertible.description.getter();
      v580[0] = sub_10001B150(v358, v359, &v581);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v570)(v356, v357);
      os_log_t v360 = v572;
      _os_log_impl((void *)&_mh_execute_header, v572, v353, "URL not enabled: %s", v354, 0xCu);
      LOBYTE(v113) = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v263 = v547;
      goto LABEL_90;
    }
    swift_release();
    swift_release();
    swift_release();

    ((void (*)(char *, uint64_t))v570)(v565, v577);
    swift_release();
    swift_release();
    v303 = v547;
LABEL_94:
    ((void (*)(char *, uint64_t))v573)(v303, v576);
    goto LABEL_95;
  }
  if (v174 == 0x6F68747561657270 && v177 == 0xEC000000657A6972
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v169 = v577;
    v336 = v550;
    v170 = isa;
    v172 = v565;
    goto LABEL_132;
  }
  if (v174 == 0x74726F706572 && v177 == 0xE600000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v112 = sub_100005418((uint64_t)isa);
    uint64_t v113 = (v361 >> 40) & 1;
    (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
    goto LABEL_52;
  }
  if (v174 == 118 && v177 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_149;
  }
  char v362 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v362 & 1) == 0)
  {
    uint64_t v392 = Logger.launcher.unsafeMutableAddressor();
    ((void (*)(char *, uint64_t, uint64_t))v550)(v536, v392, v576);
    uint64_t v393 = v577;
    v394 = (void (**)(unint64_t, char *, uint64_t))v578;
    v395 = v531;
    v396 = v549;
    ((void (*)(char *, NSObject *, uint64_t))v549)(v531, isa, v577);
    ((void (*)(char *, char *, uint64_t))v396)(v537, v395, v393);
    unint64_t v397 = (*((unsigned __int8 *)v394 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v394 + 80);
    uint64_t v398 = swift_allocObject();
    v394[4](v398 + v397, v395, v393);
    v399 = Logger.logObject.getter();
    LOBYTE(v396) = static os_log_type_t.error.getter();
    uint64_t v400 = swift_allocObject();
    *(unsigned char *)(v400 + 16) = 32;
    uint64_t v401 = swift_allocObject();
    *(unsigned char *)(v401 + 16) = 8;
    uint64_t v402 = swift_allocObject();
    *(void *)(v402 + 16) = sub_10000ABF0;
    *(void *)(v402 + 24) = v398;
    uint64_t v403 = swift_allocObject();
    *(void *)(v403 + 16) = sub_10000BD40;
    *(void *)(v403 + 24) = v402;
    sub_10000ABA8(&qword_10002A080);
    uint64_t v404 = swift_initStackObject();
    sub_10001B0A0(v404, 3);
    void *v405 = sub_10000BD4C;
    v405[1] = v400;
    v405[2] = sub_10000BD4C;
    v405[3] = v401;
    v405[4] = sub_10000BD48;
    v405[5] = v403;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v406 = v396;
    isa = v399;
    if (os_log_type_enabled(v399, (os_log_type_t)v396))
    {
      v407 = (uint8_t *)swift_slowAlloc();
      os_log_t v572 = (os_log_t)swift_slowAlloc();
      uint64_t v581 = (uint64_t)v572;
      *(_WORD *)v407 = 258;
      v407[2] = 32;
      swift_release();
      v407[3] = 8;
      swift_release();
      sub_100003F64(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
      v408 = v537;
      uint64_t v409 = v577;
      uint64_t v410 = dispatch thunk of CustomStringConvertible.description.getter();
      v580[0] = sub_10001B150(v410, v411, &v581);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v570)(v408, v409);
      v412 = isa;
      _os_log_impl((void *)&_mh_execute_header, isa, v406, "Unknown URL %s", v407, 0xCu);
      LOBYTE(v113) = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, uint64_t))v573)(v536, v576);
      goto LABEL_105;
    }
    swift_release();
    swift_release();
    swift_release();

    ((void (*)(char *, uint64_t))v570)(v537, v577);
    swift_release();
    swift_release();
    ((void (*)(char *, uint64_t))v573)(v536, v576);
    goto LABEL_124;
  }
LABEL_149:
  os_log_t v572 = (os_log_t)URLComponents.queryItems.getter();
  if (!v572)
  {
    uint64_t v371 = Logger.testVerification.unsafeMutableAddressor();
    ((void (*)(char *, uint64_t, uint64_t))v550)(v538, v371, v576);
    uint64_t v372 = v577;
    v373 = (void (**)(unint64_t, char *, uint64_t))v578;
    v374 = v534;
    v375 = v549;
    ((void (*)(char *, NSObject *, uint64_t))v549)(v534, isa, v577);
    ((void (*)(char *, char *, uint64_t))v375)(v539, v374, v372);
    unint64_t v376 = (*((unsigned __int8 *)v373 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v373 + 80);
    uint64_t v377 = swift_allocObject();
    v373[4](v377 + v376, v374, v372);
    v378 = Logger.logObject.getter();
    LOBYTE(v375) = static os_log_type_t.error.getter();
    uint64_t v379 = swift_allocObject();
    *(unsigned char *)(v379 + 16) = 32;
    uint64_t v380 = swift_allocObject();
    *(unsigned char *)(v380 + 16) = 8;
    uint64_t v381 = swift_allocObject();
    *(void *)(v381 + 16) = sub_10000ABF0;
    *(void *)(v381 + 24) = v377;
    uint64_t v382 = swift_allocObject();
    *(void *)(v382 + 16) = sub_10000BD40;
    *(void *)(v382 + 24) = v381;
    sub_10000ABA8(&qword_10002A080);
    uint64_t v383 = swift_initStackObject();
    sub_10001B0A0(v383, 3);
    void *v384 = sub_10000BD4C;
    v384[1] = v379;
    v384[2] = sub_10000BD4C;
    v384[3] = v380;
    v384[4] = sub_10000BD48;
    v384[5] = v382;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v385 = v375;
    isa = v378;
    if (os_log_type_enabled(v378, (os_log_type_t)v375))
    {
      v386 = (uint8_t *)swift_slowAlloc();
      os_log_t v572 = (os_log_t)swift_slowAlloc();
      uint64_t v581 = (uint64_t)v572;
      *(_WORD *)v386 = 258;
      v386[2] = 32;
      swift_release();
      v386[3] = 8;
      swift_release();
      sub_100003F64(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
      v387 = v539;
      uint64_t v388 = v577;
      uint64_t v389 = dispatch thunk of CustomStringConvertible.description.getter();
      v580[0] = sub_10001B150(v389, v390, &v581);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v570)(v387, v388);
      v391 = isa;
      _os_log_impl((void *)&_mh_execute_header, isa, v385, "Could not get query items from url: %s", v386, 0xCu);
      LOBYTE(v113) = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, uint64_t))v573)(v538, v576);
      (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
      uint64_t v112 = 3;
      goto LABEL_52;
    }
    swift_release();
    swift_release();
    swift_release();

    ((void (*)(char *, uint64_t))v570)(v539, v577);
    swift_release();
    swift_release();
    ((void (*)(char *, uint64_t))v573)(v538, v576);
    goto LABEL_17;
  }
  uint64_t v363 = swift_allocObject();
  v570 = (char *)v363;
  *(void *)(v363 + 16) = 0;
  v568 = (id *)(v363 + 16);
  isa = v572[2].isa;
  if (!isa) {
    goto LABEL_167;
  }
  v364 = *(void (**)(char *, char *, uint64_t))(v555 + 16);
  v365 = (char *)v572 + ((*(unsigned __int8 *)(v555 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v555 + 80));
  v366 = (void (**)(char *, uint64_t))(v555 + 8);
  uint64_t v367 = *(void *)(v555 + 72);
  swift_bridgeObjectRetain();
  v368 = isa;
  while (1)
  {
    v364(v543, v365, v553);
    if (URLQueryItem.name.getter() == 114 && v369 == 0xE100000000000000) {
      break;
    }
    char v370 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v370) {
      goto LABEL_164;
    }
    (*v366)(v543, v553);
    v365 += v367;
    v368 = ((char *)v368 - 1);
    if (!v368)
    {
      swift_bridgeObjectRelease();
      goto LABEL_167;
    }
  }
  swift_bridgeObjectRelease();
LABEL_164:
  swift_bridgeObjectRelease();
  uint64_t v413 = v555 + 32;
  v414 = v529;
  uint64_t v415 = v553;
  (*(void (**)(char *, char *, uint64_t))(v555 + 32))(v529, v543, v553);
  v578 = (char *)URLQueryItem.value.getter();
  unint64_t v417 = v416;
  (*(void (**)(char *, uint64_t))(v413 - 24))(v414, v415);
  if (v417)
  {
    v567 = (char *)Logger.testVerification.unsafeMutableAddressor();
    uint64_t v577 = v579 + 16;
    ((void (*)(char *))v550)(v532);
    uint64_t v418 = swift_allocObject();
    *(void *)(v418 + 16) = v578;
    *(void *)(v418 + 24) = v417;
    swift_bridgeObjectRetain_n();
    v419 = Logger.logObject.getter();
    os_log_type_t v420 = static os_log_type_t.info.getter();
    uint64_t v421 = swift_allocObject();
    *(unsigned char *)(v421 + 16) = 32;
    uint64_t v422 = swift_allocObject();
    *(unsigned char *)(v422 + 16) = 8;
    uint64_t v423 = swift_allocObject();
    *(void *)(v423 + 16) = sub_10000AF34;
    *(void *)(v423 + 24) = v418;
    uint64_t v424 = swift_allocObject();
    *(void *)(v424 + 16) = sub_10000BD40;
    *(void *)(v424 + 24) = v423;
    v571 = (char *)sub_10000ABA8(&qword_10002A080);
    uint64_t v425 = swift_allocObject();
    sub_10001B0A0(v425, 3);
    void *v426 = sub_10000BD4C;
    v426[1] = v421;
    v426[2] = sub_10000BD4C;
    v426[3] = v422;
    v426[4] = sub_10000BD48;
    v426[5] = v424;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v427 = v420;
    object = v419;
    if (os_log_type_enabled(v419, v420))
    {
      v428 = (uint8_t *)swift_slowAlloc();
      v565 = (char *)swift_slowAlloc();
      uint64_t v581 = (uint64_t)v565;
      *(_WORD *)v428 = 258;
      v428[2] = 32;
      swift_release();
      v428[3] = 8;
      swift_release();
      swift_bridgeObjectRetain();
      v580[0] = sub_10001B150((uint64_t)v578, v417, &v581);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease_n();
      v429 = object;
      _os_log_impl((void *)&_mh_execute_header, object, v427, "Recieved region string %s", v428, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    ((void (*)(char *, uint64_t))v573)(v532, v576);
    NSString v435 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v436 = [self regionWithCode:v435];

    v437 = v570;
    v438 = (void *)*((void *)v570 + 2);
    *((void *)v570 + 2) = v436;

    ((void (*)(char *, char *, uint64_t))v550)(v533, v567, v576);
    swift_retain_n();
    v439 = Logger.logObject.getter();
    os_log_type_t v440 = static os_log_type_t.info.getter();
    uint64_t v441 = swift_allocObject();
    *(unsigned char *)(v441 + 16) = 32;
    uint64_t v442 = swift_allocObject();
    *(unsigned char *)(v442 + 16) = 8;
    uint64_t v443 = swift_allocObject();
    *(void *)(v443 + 16) = sub_10000AF84;
    *(void *)(v443 + 24) = v437;
    uint64_t v444 = swift_allocObject();
    *(void *)(v444 + 16) = sub_10000BD40;
    *(void *)(v444 + 24) = v443;
    uint64_t v445 = swift_allocObject();
    sub_10001B0A0(v445, 3);
    void *v446 = sub_10000BD4C;
    v446[1] = v441;
    v446[2] = sub_10000BD4C;
    v446[3] = v442;
    v446[4] = sub_10000BD48;
    v446[5] = v444;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v439, v440))
    {
      v447 = (uint8_t *)swift_slowAlloc();
      v580[0] = swift_slowAlloc();
      *(_WORD *)v447 = 258;
      v447[2] = 32;
      swift_release();
      v447[3] = 8;
      swift_release();
      v448 = v568;
      swift_beginAccess();
      if (*v448)
      {
        id v449 = [*v448 description];
        uint64_t v450 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v452 = v451;
      }
      else
      {
        uint64_t v450 = 0;
        unint64_t v452 = 0;
      }
      uint64_t v581 = v450;
      unint64_t v582 = v452;
      sub_10000ABA8(&qword_100029A68);
      uint64_t v453 = String.init<A>(describing:)();
      uint64_t v581 = sub_10001B150(v453, v454, v580);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v439, v440, "Got ENRegion %s", v447, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    v434 = v533;
  }
  else
  {
LABEL_167:
    uint64_t v430 = Logger.testVerification.unsafeMutableAddressor();
    ((void (*)(char *, uint64_t, uint64_t))v550)(v540, v430, v576);
    v431 = Logger.logObject.getter();
    os_log_type_t v432 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v431, v432))
    {
      v433 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v433 = 0;
      _os_log_impl((void *)&_mh_execute_header, v431, v432, "Did not receive region string", v433, 2u);
      swift_slowDealloc();
    }

    v434 = v540;
  }
  ((void (*)(char *, uint64_t))v573)(v434, v576);
  if (!isa) {
    goto LABEL_194;
  }
  v455 = *(char **)(v555 + 16);
  v456 = (char *)v572 + ((*(unsigned __int8 *)(v555 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v555 + 80));
  uint64_t v577 = *(void *)(v555 + 72);
  v578 = v455;
  v457 = (void (**)(char *, uint64_t))(v555 + 8);
  swift_bridgeObjectRetain();
  v458 = v456;
  v459 = isa;
  while (1)
  {
    ((void (*)(char *, char *, uint64_t))v578)(v544, v458, v553);
    if (URLQueryItem.name.getter() == 99 && v460 == 0xE100000000000000) {
      break;
    }
    char v461 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v461) {
      goto LABEL_186;
    }
    (*v457)(v544, v553);
    v458 += v577;
    v459 = ((char *)v459 - 1);
    if (!v459)
    {
      swift_bridgeObjectRelease();
      goto LABEL_194;
    }
  }
  swift_bridgeObjectRelease();
LABEL_186:
  swift_bridgeObjectRelease();
  v462 = (char *)(v555 + 32);
  v463 = v530;
  uint64_t v464 = v553;
  v567 = *(char **)(v555 + 32);
  ((void (*)(char *, char *, uint64_t))v567)(v530, v544, v553);
  uint64_t v112 = URLQueryItem.value.getter();
  uint64_t v466 = v465;
  v569 = v462;
  v571 = (char *)*((void *)v462 - 3);
  ((void (*)(char *, uint64_t))v571)(v463, v464);
  if (!v466)
  {
LABEL_194:
    uint64_t v472 = Logger.testVerification.unsafeMutableAddressor();
    ((void (*)(char *, uint64_t, uint64_t))v550)(v541, v472, v576);
    uint64_t v473 = swift_allocObject();
    *(void *)(v473 + 16) = v572;
    swift_bridgeObjectRetain();
    v474 = Logger.logObject.getter();
    os_log_type_t v475 = static os_log_type_t.error.getter();
    uint64_t v476 = swift_allocObject();
    *(unsigned char *)(v476 + 16) = 32;
    uint64_t v477 = swift_allocObject();
    *(unsigned char *)(v477 + 16) = 8;
    uint64_t v478 = swift_allocObject();
    *(void *)(v478 + 16) = sub_10000ADA0;
    *(void *)(v478 + 24) = v473;
    uint64_t v479 = swift_allocObject();
    *(void *)(v479 + 16) = sub_10000BD40;
    *(void *)(v479 + 24) = v478;
    sub_10000ABA8(&qword_10002A080);
    uint64_t v480 = swift_initStackObject();
    sub_10001B0A0(v480, 3);
    void *v481 = sub_10000BD4C;
    v481[1] = v476;
    v481[2] = sub_10000BD4C;
    v481[3] = v477;
    v481[4] = sub_10000BD48;
    v481[5] = v479;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    os_log_type_t v482 = v475;
    v578 = (char *)v474;
    if (os_log_type_enabled(v474, v475))
    {
      v483 = (uint8_t *)swift_slowAlloc();
      uint64_t v577 = swift_slowAlloc();
      uint64_t v581 = v577;
      *(_WORD *)v483 = 258;
      v483[2] = 32;
      swift_release();
      v483[3] = 8;
      swift_release();
      swift_bridgeObjectRetain();
      uint64_t v484 = Array.description.getter();
      unint64_t v486 = v485;
      swift_bridgeObjectRelease();
      v580[0] = sub_10001B150(v484, v486, &v581);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      id v487 = v578;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v578, v482, "Did not receive a verification code in URL: %s", v483, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, uint64_t))v573)(v541, v576);
      (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
      swift_release();
      goto LABEL_4;
    }
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();

    ((void (*)(char *, uint64_t))v573)(v541, v576);
    (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
    swift_release();
LABEL_23:
    LOBYTE(v113) = 1;
    uint64_t v112 = 3;
    goto LABEL_52;
  }
  int v583 = 0;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v467 = 0;
  while (1)
  {
    v468 = (v467 + 1);
    if (__OFADD__(v467, 1))
    {
      __break(1u);
      return result;
    }
    ((void (*)(char *, char *, uint64_t))v578)(v542, v456, v553);
    if (URLQueryItem.name.getter() == 116 && v469 == 0xE100000000000000) {
      break;
    }
    char v470 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v470) {
      goto LABEL_198;
    }
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v571)(v542, v553);
    ++v467;
    v456 += v577;
    if (v468 == isa)
    {
      swift_bridgeObjectRelease();
      uint64_t v471 = 1;
      goto LABEL_199;
    }
  }
  swift_bridgeObjectRelease();
LABEL_198:
  swift_bridgeObjectRelease();
  ((void (*)(uint64_t, char *, uint64_t))v567)(v535, v542, v553);
  uint64_t v471 = 0;
LABEL_199:
  uint64_t v488 = v555;
  uint64_t v489 = v535;
  uint64_t v490 = v553;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v555 + 56))(v535, v471, 1, v553);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v488 + 48))(v489, 1, v490) == 1)
  {
    sub_10000AE00(v535, &qword_100029A60);
  }
  else
  {
    uint64_t v491 = v535;
    v578 = (char *)URLQueryItem.value.getter();
    unint64_t v493 = v492;
    ((void (*)(uint64_t, uint64_t))v571)(v491, v553);
    if (v493)
    {
      v571 = (char *)Logger.testVerification.unsafeMutableAddressor();
      os_log_t v572 = (os_log_t)(v579 + 16);
      ((void (*)(char *))v550)(v528);
      uint64_t v494 = swift_allocObject();
      *(void *)(v494 + 16) = v578;
      *(void *)(v494 + 24) = v493;
      swift_bridgeObjectRetain_n();
      uint64_t v577 = Logger.logObject.getter();
      LODWORD(isa) = static os_log_type_t.info.getter();
      uint64_t v495 = swift_allocObject();
      *(unsigned char *)(v495 + 16) = 32;
      uint64_t v496 = swift_allocObject();
      *(unsigned char *)(v496 + 16) = 8;
      uint64_t v497 = swift_allocObject();
      *(void *)(v497 + 16) = sub_10000BDC4;
      *(void *)(v497 + 24) = v494;
      uint64_t v498 = swift_allocObject();
      *(void *)(v498 + 16) = sub_10000BD40;
      *(void *)(v498 + 24) = v497;
      v569 = (char *)sub_10000ABA8(&qword_10002A080);
      uint64_t v499 = swift_initStackObject();
      sub_10001B0A0(v499, 3);
      void *v500 = sub_10000BD4C;
      v500[1] = v495;
      v500[2] = sub_10000BD4C;
      v500[3] = v496;
      v500[4] = sub_10000BD48;
      v500[5] = v498;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      LODWORD(isa) = isa;
      if (os_log_type_enabled((os_log_t)v577, (os_log_type_t)isa))
      {
        v501 = (uint8_t *)swift_slowAlloc();
        v567 = (char *)swift_slowAlloc();
        uint64_t v581 = (uint64_t)v567;
        *(_WORD *)v501 = 258;
        v501[2] = 32;
        swift_release();
        v501[3] = 8;
        swift_release();
        swift_bridgeObjectRetain();
        v580[0] = sub_10001B150((uint64_t)v578, v493, &v581);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease_n();
        id v502 = (id)v577;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v577, (os_log_type_t)isa, "Got report type string: %s", v501, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      ((void (*)(char *, uint64_t))v573)(v528, v576);
      unint64_t v503 = sub_1000033C4((uint64_t)v578, v493);
      if ((v503 & 0x100000000) == 0)
      {
        unsigned int v504 = v503;
        int v583 = v503;
        ((void (*)(char *, char *, uint64_t))v550)(v527, v571, v576);
        uint64_t v505 = swift_allocObject();
        *(_DWORD *)(v505 + 16) = v504;
        v578 = (char *)Logger.logObject.getter();
        LODWORD(v577) = static os_log_type_t.info.getter();
        uint64_t v506 = swift_allocObject();
        *(unsigned char *)(v506 + 16) = 32;
        uint64_t v507 = swift_allocObject();
        *(unsigned char *)(v507 + 16) = 8;
        uint64_t v508 = swift_allocObject();
        *(void *)(v508 + 16) = sub_10000AEC4;
        *(void *)(v508 + 24) = v505;
        uint64_t v509 = swift_allocObject();
        *(void *)(v509 + 16) = sub_10000BD40;
        *(void *)(v509 + 24) = v508;
        uint64_t v510 = swift_initStackObject();
        sub_10001B0A0(v510, 3);
        void *v511 = sub_10000BD4C;
        v511[1] = v506;
        v511[2] = sub_10000BD4C;
        v511[3] = v507;
        v511[4] = sub_10000BD48;
        v511[5] = v509;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        LODWORD(v577) = v577;
        if (os_log_type_enabled((os_log_t)v578, (os_log_type_t)v577))
        {
          v512 = (uint8_t *)swift_slowAlloc();
          isa = swift_slowAlloc();
          uint64_t v581 = (uint64_t)isa;
          *(_WORD *)v512 = 258;
          v512[2] = 32;
          swift_release();
          v512[3] = 8;
          swift_release();
          sub_10000AF10(v504);
          uint64_t v513 = String.init(cString:)();
          v580[0] = sub_10001B150(v513, v514, &v581);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          id v515 = v578;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v578, (os_log_type_t)v577, "Got report type: %s", v512, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
        }
        ((void (*)(char *, uint64_t))v573)(v527, v576);
      }
    }
  }
  (*(void (**)(char *, uint64_t))(v551 + 8))(v574, v545);
  swift_beginAccess();
  v516 = (void *)*((void *)v570 + 2);
  swift_beginAccess();
  id v517 = v516;
  swift_release();
  LOBYTE(v113) = 0;
LABEL_52:
  LOBYTE(v583) = v113;
  return v112;
}

uint64_t sub_10000ABA8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000ABF4()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char **sub_10000AC04(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_10001B824(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_10000AC0C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AC1C()
{
  return sub_10001B0B0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000AC24(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10001B0D8(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000AC30()
{
  return sub_100003624();
}

uint64_t sub_10000AC84()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AC94()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000ACA8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000ACB8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000ACC8(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)() & 1;
  }
}

uint64_t sub_10000AD24()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AD34()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AD48()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AD58()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AD68()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000ADA0()
{
  return sub_100003368();
}

uint64_t sub_10000ADA8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000ADB8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000ADC8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000AE00(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000ABA8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000AE5C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000AE94()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AEA4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AEB4()
{
  return _swift_deallocObject(v0, 20, 7);
}

uint64_t sub_10000AEC4()
{
  sub_10000AF10(*(_DWORD *)(v0 + 16));

  return String.init(cString:)();
}

uint64_t sub_10000AEF0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AF00()
{
  return _swift_deallocObject(v0, 17, 7);
}

const char *sub_10000AF10(unsigned int a1)
{
  if (a1 > 5) {
    return "?";
  }
  else {
    return off_100025970[a1];
  }
}

uint64_t sub_10000AF34()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10000AF64()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AF74()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AF84()
{
  return sub_1000032CC(v0);
}

uint64_t sub_10000AF8C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AF9C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AFB0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AFC0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AFD4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AFE4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000AFF8()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000B088()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000B098()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000B0A8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000B0E0()
{
  return _swift_deallocObject(v0, 24, 7);
}

void type metadata accessor for CFString(uint64_t a1)
{
}

unsigned char *initializeBufferWithCopyOfBuffer for URLParser.UserReportErrorType(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for URLParser.URLParserError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC)
  {
    unsigned int v2 = a2 + 4;
    if (a2 + 4 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 4;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 4;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x10000B1C8);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 4;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 >= 2) {
    unsigned int v8 = v7 - 1;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 >= 4) {
    return v8 - 3;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for URLParser.URLParserError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 4;
  if (a3 + 4 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFC) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v7 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x10000B2B0);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_10000B2D8(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 2) {
    return v1 - 1;
  }
  else {
    return 0;
  }
}

unsigned char *sub_10000B2F0(unsigned char *result, int a2)
{
  if (a2) {
    *uint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for URLParser.URLParserError()
{
  return &type metadata for URLParser.URLParserError;
}

uint64_t getEnumTagSinglePayload for URLParser.PreAuthorizationType(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for URLParser.PreAuthorizationType(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000B400);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000B428()
{
  return 0;
}

ValueMetadata *type metadata accessor for URLParser.PreAuthorizationType()
{
  return &type metadata for URLParser.PreAuthorizationType;
}

void type metadata accessor for Code(uint64_t a1)
{
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
}

void type metadata accessor for ENDiagnosisReportType(uint64_t a1)
{
}

unint64_t sub_10000B480()
{
  unint64_t result = qword_100029A98;
  if (!qword_100029A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029A98);
  }
  return result;
}

uint64_t sub_10000B4D4()
{
  return sub_100003F64((unint64_t *)&qword_100029AA0, type metadata accessor for CFString);
}

uint64_t sub_10000B51C()
{
  return sub_100003F64(&qword_100029AA8, type metadata accessor for CFString);
}

uint64_t sub_10000B564()
{
  return sub_100003F64(&qword_100029AB0, type metadata accessor for Code);
}

uint64_t sub_10000B5AC()
{
  return sub_100003F64(&qword_100029AB8, type metadata accessor for ENError);
}

void type metadata accessor for ENError(uint64_t a1)
{
}

uint64_t sub_10000B608()
{
  return sub_100003F64(&qword_100029AC0, type metadata accessor for ENError);
}

uint64_t sub_10000B650()
{
  return sub_100003F64(&qword_100029AC8, type metadata accessor for ENError);
}

uint64_t sub_10000B698()
{
  return sub_100003F64(&qword_100029AD0, type metadata accessor for ENError);
}

uint64_t sub_10000B6E0()
{
  return sub_100003F64(&qword_100029AD8, type metadata accessor for Code);
}

uint64_t sub_10000B728()
{
  return sub_100003F64(&qword_100029AE0, type metadata accessor for Code);
}

unint64_t sub_10000B774()
{
  unint64_t result = qword_100029AE8;
  if (!qword_100029AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029AE8);
  }
  return result;
}

uint64_t sub_10000B7C8()
{
  return sub_100003F64(&qword_100029AF0, type metadata accessor for ENError);
}

uint64_t sub_10000B810()
{
  return sub_100003F64(&qword_100029AF8, type metadata accessor for ENError);
}

uint64_t sub_10000B858()
{
  return sub_100003F64(&qword_100029B00, _s3__C4CodeOMa_0);
}

uint64_t sub_10000B8A0()
{
  return sub_100003F64(&qword_100029B08, type metadata accessor for ENTestResultError);
}

void type metadata accessor for ENTestResultError(uint64_t a1)
{
}

void sub_10000B8FC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000B944()
{
  return sub_100003F64(&qword_100029B10, type metadata accessor for ENTestResultError);
}

uint64_t sub_10000B98C()
{
  return sub_100003F64(&qword_100029B18, type metadata accessor for ENTestResultError);
}

uint64_t sub_10000B9D4()
{
  return sub_100003F64(&qword_100029B20, type metadata accessor for ENTestResultError);
}

uint64_t sub_10000BA1C()
{
  return sub_100003F64((unint64_t *)&unk_10002A070, _s3__C4CodeOMa_0);
}

uint64_t sub_10000BA64()
{
  return sub_100003F64(&qword_100029B28, _s3__C4CodeOMa_0);
}

uint64_t sub_10000BAAC()
{
  return sub_100003F64(&qword_100029B30, type metadata accessor for ENTestResultError);
}

uint64_t sub_10000BAF4()
{
  return sub_100003F64(&qword_100029B38, type metadata accessor for ENTestResultError);
}

uint64_t getEnumTagSinglePayload for URLParser.UserReportErrorType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for URLParser.UserReportErrorType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000BC98);
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

uint64_t sub_10000BCC0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000BCC8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for URLParser.UserReportErrorType()
{
  return &type metadata for URLParser.UserReportErrorType;
}

unint64_t sub_10000BCE8()
{
  unint64_t result = qword_100029B50;
  if (!qword_100029B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029B50);
  }
  return result;
}

id sub_10000BEF4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for ViewController()
{
  return self;
}

id sub_10000C08C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v5 = (objc_class *)type metadata accessor for AppDelegate();
  unsigned int v6 = NSStringFromClass(v5);
  UIApplicationMain(argc, (char **)argv, 0, v6);

  return 0;
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

void sub_10000C140(void *a1, char a2)
{
  if (a1)
  {
    uint64_t v3 = qword_100029960;
    id v4 = a1;
    if (v3 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v5 = (void (*)(void *))sub_10000DAD4((uint64_t)v4);
    swift_endAccess();
    if (v5)
    {
      v6[0] = a2 & 3;
      v5(v6);
      sub_10000CE24((uint64_t)v5);
    }
  }
}

unint64_t sub_10000C20C()
{
  unint64_t result = sub_10001C528((uint64_t)&_swiftEmptyArrayStorage);
  qword_100029C70 = result;
  return result;
}

uint64_t sub_10000C234()
{
  type metadata accessor for ErrorDialog();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = 0;
  qword_10002B210 = result;
  return result;
}

void sub_10000C264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v71 = a5;
  uint64_t v72 = a8;
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v19);
  __chkstk_darwin(v22);
  if (*(void *)(v10 + 16))
  {
    uint64_t v25 = Logger.testVerification.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, v25, v17);
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Error dialog is already visible. Don't show a second one.", v28, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
  }
  else
  {
    uint64_t v67 = a7;
    uint64_t v70 = v24;
    uint64_t v66 = (char *)&v65 - v23;
    uint64_t v68 = v10;
    uint64_t v69 = v17;
    SInt32 error = 0;
    sub_10000ABA8(&qword_100029D60);
    uint64_t inited = swift_initStackObject();
    *(void *)(inited + 32) = kCFUserNotificationAlertHeaderKey;
    *(void *)(inited + 40) = a1;
    *(_OWORD *)(inited + 16) = xmmword_10001EFE0;
    *(void *)(inited + 48) = a2;
    *(void *)(inited + 56) = kCFUserNotificationAlertMessageKey;
    *(void *)(inited + 64) = a3;
    *(void *)(inited + 72) = a4;
    uint64_t v30 = v71;
    *(void *)(inited + 80) = kCFUserNotificationDefaultButtonTitleKey;
    *(void *)(inited + 88) = v30;
    *(void *)(inited + 96) = a6;
    CFStringRef v31 = (id)kCFUserNotificationDefaultButtonTitleKey;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    CFStringRef v32 = (id)kCFUserNotificationAlertHeaderKey;
    CFStringRef v33 = (id)kCFUserNotificationAlertMessageKey;
    unint64_t v34 = sub_1000102F0(inited);
    uint64_t v35 = v72;
    if (v72)
    {
      uint64_t v36 = (id)kCFUserNotificationAlternateButtonTitleKey;
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v75 = v34;
      sub_10000E80C(v67, v35, (void *)kCFUserNotificationAlternateButtonTitleKey, isUniquelyReferenced_nonNull_native);

      swift_bridgeObjectRelease();
    }
    uint64_t v38 = v18;
    uint64_t v39 = v68;
    sub_10000ABA8(&qword_100029D68);
    sub_10000CC74();
    CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    CFUserNotificationRef v41 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, isa);

    uint64_t v42 = *(void **)(v39 + 16);
    *(void *)(v39 + 16) = v41;

    uint64_t v43 = *(void **)(v39 + 16);
    uint64_t v44 = v69;
    if (v43 && !error)
    {
      uint64_t v49 = v43;
      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v49, (CFUserNotificationCallBack)sub_10000C984, 0);
      uint64_t v51 = *(void **)(v39 + 24);
      *(void *)(v39 + 24) = RunLoopSource;

      uint64_t v52 = *(void **)(v39 + 24);
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = CFRunLoopGetCurrent();
        uint64_t v55 = (__CFString *)CFRunLoopCopyCurrentMode(v54);
        if (!v55) {
          uint64_t v55 = (id)kCFRunLoopCommonModes;
        }
        if (qword_100029960 != -1) {
          swift_once();
        }
        uint64_t v56 = swift_allocObject();
        swift_weakInit();
        uint64_t v57 = (void *)swift_allocObject();
        v57[2] = v56;
        v57[3] = a9;
        v57[4] = a10;
        swift_beginAccess();
        swift_retain();
        sub_10000CE14(a9);
        char v58 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v73 = qword_100029C70;
        qword_100029C70 = 0x8000000000000000;
        sub_10000E6CC((uint64_t)sub_10000CE08, (uint64_t)v57, (uint64_t)v49, v58);
        qword_100029C70 = v73;
        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_release();
        CFRunLoopAddSource(v54, v53, v55);
      }
      else
      {
        uint64_t v59 = Logger.testVerification.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v66, v59, v44);
        uint64_t v60 = Logger.logObject.getter();
        os_log_type_t v61 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v60, v61))
        {
          uint64_t v62 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v62 = 0;
          _os_log_impl((void *)&_mh_execute_header, v60, v61, "Could not create CFRunLoopSource.", v62, 2u);
          swift_slowDealloc();
          v63 = v49;
        }
        else
        {
          v63 = v60;
          uint64_t v60 = v49;
        }

        (*(void (**)(char *, uint64_t))(v38 + 8))(v66, v44);
        uint64_t v64 = *(void **)(v39 + 16);
        *(void *)(v39 + 16) = 0;
      }
    }
    else
    {
      uint64_t v45 = Logger.testVerification.unsafeMutableAddressor();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v70, v45, v44);
      uint64_t v46 = Logger.logObject.getter();
      os_log_type_t v47 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v48 = 67109120;
        swift_beginAccess();
        LODWORD(v73) = error;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "Could not create CFUserNotification: %d", v48, 8u);
        uint64_t v44 = v69;
        swift_slowDealloc();
      }

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v70, v44);
    }
  }
}

void sub_10000C984(void *a1, char a2)
{
  id v4 = a1;
  sub_10000C140(a1, a2);
}

uint64_t sub_10000C9D8(uint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v12 = *(__CFRunLoopSource **)(result + 24);
    if (v12)
    {
      CFRunLoopSourceInvalidate(v12);
      uint64_t v13 = *(void **)(v11 + 24);
      *(void *)(v11 + 24) = 0;
    }
    uint64_t v14 = *(__CFUserNotification **)(v11 + 16);
    if (v14)
    {
      CFUserNotificationCancel(v14);
      uint64_t v15 = *(void **)(v11 + 16);
      *(void *)(v11 + 16) = 0;
    }
    if (v9 == 1)
    {
      if (a3)
      {
        uint64_t v16 = 1;
        goto LABEL_12;
      }
      return swift_release();
    }
    if (!v9)
    {
      if (a3)
      {
        uint64_t v16 = 0;
LABEL_12:
        a3(v16);
        return swift_release();
      }
      return swift_release();
    }
    uint64_t v17 = Logger.testVerification.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v17, v5);
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 134217984;
      uint64_t v21 = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Unexpected response from validating notification: %lu", v20, 0xCu);
      swift_slowDealloc();
    }

    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

uint64_t sub_10000CC10()
{
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for ErrorDialog()
{
  return self;
}

unint64_t sub_10000CC74()
{
  unint64_t result = qword_100029D70;
  if (!qword_100029D70)
  {
    sub_10000CCE8(&qword_100029D68);
    sub_10000CD30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029D70);
  }
  return result;
}

uint64_t sub_10000CCE8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000CD30()
{
  unint64_t result = qword_100029AA0;
  if (!qword_100029AA0)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029AA0);
  }
  return result;
}

uint64_t sub_10000CD88()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000CDC0()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000CE08(uint64_t *a1)
{
  return sub_10000C9D8(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

uint64_t sub_10000CE14(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000CE24(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_10000CE34(void *a1, char a2)
{
  if (a1)
  {
    uint64_t v3 = qword_100029970;
    id v4 = a1;
    if (v3 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v5 = (void (*)(void *))sub_10000DAD4((uint64_t)v4);
    swift_endAccess();
    if (v5)
    {
      v6[0] = a2 & 3;
      v5(v6);
      sub_10000CE24((uint64_t)v5);
    }
  }
}

unint64_t sub_10000CF00()
{
  unint64_t result = sub_10001C528((uint64_t)&_swiftEmptyArrayStorage);
  qword_100029D78 = result;
  return result;
}

void sub_10000CF28()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v51 - v8;
  __chkstk_darwin(v7);
  if (*(void *)(v0 + 32))
  {
    uint64_t v11 = Logger.testVerification.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v11, v2);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Validating dialog is already visible. Don't show a second one.", v14, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    uint64_t v52 = (char *)&v51 - v10;
    SInt32 error = 0;
    sub_10000ABA8(&qword_100029D60);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10001F040;
    *(void *)(inited + 32) = kCFUserNotificationAlertHeaderKey;
    uint64_t v16 = self;
    CFStringRef v17 = (id)kCFUserNotificationAlertHeaderKey;
    id v18 = [v16 mainBundle];
    v55._object = (void *)0xE500000000000000;
    v19._object = (void *)0x800000010001F4B0;
    v19._uint64_t countAndFlagsBits = 0xD000000000000022;
    v20._uint64_t countAndFlagsBits = 0;
    v20._object = (void *)0xE000000000000000;
    v55._uint64_t countAndFlagsBits = 0x656C746954;
    Swift::String v21 = NSLocalizedString(_:tableName:bundle:value:comment:)(v19, (Swift::String_optional)0, (NSBundle)v18, v20, v55);

    *(Swift::String *)(inited + 40) = v21;
    *(void *)(inited + 56) = kCFUserNotificationDefaultButtonTitleKey;
    CFStringRef v22 = (id)kCFUserNotificationDefaultButtonTitleKey;
    id v23 = [v16 mainBundle];
    v56._object = (void *)0xE600000000000000;
    v24._uint64_t countAndFlagsBits = 0x6C65636E6143;
    v24._object = (void *)0xE600000000000000;
    v25._uint64_t countAndFlagsBits = 0;
    v25._object = (void *)0xE000000000000000;
    v56._uint64_t countAndFlagsBits = 0x6E6F74747542;
    Swift::String v26 = NSLocalizedString(_:tableName:bundle:value:comment:)(v24, (Swift::String_optional)0, (NSBundle)v23, v25, v56);

    *(Swift::String *)(inited + 64) = v26;
    sub_1000102F0(inited);
    sub_10000ABA8(&qword_100029D68);
    sub_10000CC74();
    CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    CFUserNotificationRef v28 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, isa);

    uint64_t v29 = *(void **)(v0 + 32);
    *(void *)(v0 + 32) = v28;

    uint64_t v30 = *(void **)(v0 + 32);
    if (v30 && !error)
    {
      uint64_t v35 = v30;
      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v35, (CFUserNotificationCallBack)sub_10000D5F0, 0);
      uint64_t v37 = *(void **)(v0 + 40);
      *(void *)(v0 + 40) = RunLoopSource;

      uint64_t v38 = *(void **)(v0 + 40);
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = CFRunLoopGetCurrent();
        CFUserNotificationRef v41 = (__CFString *)CFRunLoopCopyCurrentMode(v40);
        if (!v41) {
          CFUserNotificationRef v41 = (id)kCFRunLoopCommonModes;
        }
        if (qword_100029970 != -1) {
          swift_once();
        }
        uint64_t v42 = swift_allocObject();
        swift_weakInit();
        swift_beginAccess();
        swift_retain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v53 = qword_100029D78;
        qword_100029D78 = 0x8000000000000000;
        sub_10000E6CC((uint64_t)sub_10000DA9C, v42, (uint64_t)v35, isUniquelyReferenced_nonNull_native);
        qword_100029D78 = v53;
        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_release();
        CFRunLoopAddSource(v40, v39, v41);
      }
      else
      {
        uint64_t v44 = Logger.testVerification.unsafeMutableAddressor();
        uint64_t v45 = v52;
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v52, v44, v2);
        uint64_t v46 = Logger.logObject.getter();
        os_log_type_t v47 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v46, v47))
        {
          uint64_t v48 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v48 = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, v47, "Could not create CFRunLoopSource.", v48, 2u);
          swift_slowDealloc();
          uint64_t v49 = v35;
        }
        else
        {
          uint64_t v49 = v46;
          uint64_t v46 = v35;
        }

        (*(void (**)(char *, uint64_t))(v3 + 8))(v45, v2);
        uint64_t v50 = *(void **)(v1 + 32);
        *(void *)(v1 + 32) = 0;
      }
    }
    else
    {
      uint64_t v31 = Logger.testVerification.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v31, v2);
      CFStringRef v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v32, v33))
      {
        unint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)unint64_t v34 = 67109120;
        swift_beginAccess();
        LODWORD(v53) = error;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "Could not create CFUserNotification: %d", v34, 8u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    }
  }
}

void sub_10000D5F0(void *a1, char a2)
{
  id v4 = a1;
  sub_10000CE34(a1, a2);
}

uint64_t sub_10000D644(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v19 - v7;
  uint64_t v9 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (v9)
    {
      uint64_t v11 = Logger.testVerification.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v11, v2);
      uint64_t v12 = Logger.logObject.getter();
      os_log_type_t v13 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 134217984;
        uint64_t v19 = v9;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Unexpected response from validating notification: %lu", v14, 0xCu);
        swift_slowDealloc();
        swift_release();
      }
      else
      {

        swift_release();
      }
      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
    else if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v15 = Logger.testVerification.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v15, v2);
      uint64_t v16 = Logger.logObject.getter();
      os_log_type_t v17 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v16, v17))
      {
        id v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Cancelling validating dialog", v18, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      sub_10000FA44();
      swift_release();
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_10000D924()
{
  sub_10000E984(v0 + 16);

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for ValidatingDialog()
{
  return self;
}

void *sub_10000D990(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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

uint64_t sub_10000DA34@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10000DA64()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000DA9C(uint64_t *a1)
{
  return sub_10000D644(a1);
}

uint64_t sub_10000DAA4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10000DAD4(uint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_10001BA54(a1);
  if ((v4 & 1) == 0) {
    return 0;
  }
  unint64_t v5 = v3;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v1;
  uint64_t v10 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000E368();
    uint64_t v7 = v10;
  }
  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 16 * v5);
  sub_10000E1D0(v5, v7);
  uint64_t *v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_10000DB80(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000ABA8(&qword_100029E88);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v29 = -1 << v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = v3;
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v21 >= v13) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v13) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v13)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                unint64_t v3 = v31;
                goto LABEL_40;
              }
              if (v30 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                *uint64_t v9 = v29;
              }
              unint64_t v3 = v31;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v13) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = *(void *)(*(void *)(v5 + 48) + 8 * v20);
      long long v32 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v20);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = static Hasher._hash(seed:_:)();
      uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v17 == v25;
          if (v17 == v25) {
            unint64_t v17 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v14 + 8 * v17);
        }
        while (v27 == -1);
        unint64_t v18 = __clz(__rbit64(~v27)) + (v17 << 6);
      }
      *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(void *)(*(void *)(v7 + 48) + 8 * v18) = v28;
      *(_OWORD *)(*(void *)(v7 + 56) + 16 * v18) = v32;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_10000DE34(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000ABA8((uint64_t *)&unk_10002A100);
  char v39 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v36 = v2;
  int64_t v37 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v18 >= v37) {
      break;
    }
    unint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v38 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v37) {
        goto LABEL_36;
      }
      unint64_t v20 = *(void *)(v38 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v37)
        {
LABEL_36:
          swift_release();
          unint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }
        unint64_t v20 = *(void *)(v38 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_45;
            }
            if (v13 >= v37) {
              goto LABEL_36;
            }
            unint64_t v20 = *(void *)(v38 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    unint64_t v22 = *(void **)(*(void *)(v5 + 48) + 8 * v17);
    int64_t v23 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v17);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    if ((v39 & 1) == 0)
    {
      id v26 = v22;
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    if (v22)
    {
      Hasher._combine(_:)(1u);
      type metadata accessor for CFString(0);
      sub_10000E9AC(&qword_100029E90);
      id v27 = v22;
      _CFObject.hash(into:)();
    }
    else
    {
      Hasher._combine(_:)(0);
    }
    uint64_t result = Hasher._finalize()();
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v11 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v29) & ~*(void *)(v11 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v11 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v14 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(void *)(*(void *)(v7 + 48) + 8 * v14) = v22;
    uint64_t v15 = (void *)(*(void *)(v7 + 56) + 16 * v14);
    *uint64_t v15 = v24;
    v15[1] = v25;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v36;
  unint64_t v19 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v19, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v19 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_43:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

unint64_t sub_10000E1D0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        unint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = static Hasher._hash(seed:_:)();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            unint64_t v14 = (void *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              *unint64_t v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            unint64_t v16 = (_OWORD *)(v15 + 16 * v3);
            unint64_t v17 = (_OWORD *)(v15 + 16 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              _OWORD *v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *int64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_10000E368()
{
  uint64_t v1 = v0;
  sub_10000ABA8(&qword_100029E88);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    long long v19 = *(_OWORD *)(*(void *)(v2 + 56) + v18);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(void *)(v4 + 56) + v18) = v19;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000E514()
{
  uint64_t v1 = v0;
  sub_10000ABA8((uint64_t *)&unk_10002A100);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    long long v19 = (uint64_t *)(*(void *)(v2 + 56) + v18);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    int64_t v22 = (void *)(*(void *)(v4 + 56) + v18);
    *int64_t v22 = v20;
    v22[1] = v21;
    id v23 = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10000E6CC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10001BA54(a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10000E368();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      long long v19 = (void *)(v18[7] + 16 * v12);
      uint64_t result = swift_release();
      *long long v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(void *)(v18[6] + 8 * v12) = a3;
    uint64_t v21 = (void *)(v18[7] + 16 * v12);
    *uint64_t v21 = a1;
    v21[1] = a2;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_10000DB80(result, a4 & 1);
  uint64_t result = sub_10001BA54(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    uint64_t v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

id sub_10000E80C(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = *v4;
  unint64_t v11 = sub_10001BA98(a3);
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v15 = v10;
  uint64_t v16 = *(void *)(v9 + 24);
  if (v16 >= v14 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v16 >= v14 && (a4 & 1) == 0)
  {
    sub_10000E514();
LABEL_7:
    uint64_t v17 = (void *)*v5;
    if (v15)
    {
LABEL_8:
      uint64_t v18 = (void *)(v17[7] + 16 * v11);
      id result = (id)swift_bridgeObjectRelease();
      *uint64_t v18 = a1;
      v18[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000DE34(v14, a4 & 1);
  unint64_t v20 = sub_10001BA98(a3);
  if ((v15 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_10000ABA8(&qword_100029D68);
    id result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v11 = v20;
  uint64_t v17 = (void *)*v5;
  if (v15) {
    goto LABEL_8;
  }
LABEL_11:
  v17[(v11 >> 6) + 8] |= 1 << v11;
  *(void *)(v17[6] + 8 * v11) = a3;
  uint64_t v22 = (void *)(v17[7] + 16 * v11);
  *uint64_t v22 = a1;
  v22[1] = a2;
  uint64_t v23 = v17[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v17[2] = v25;

  return a3;
}

uint64_t sub_10000E984(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000E9AC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CFString(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000E9F0(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v54 = a4;
  uint64_t v55 = a6;
  uint64_t v53 = a5;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  char v58 = &v45[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11);
  uint64_t v14 = &v45[-v13];
  uint64_t v15 = Logger.testVerification.unsafeMutableAddressor();
  uint64_t v51 = *(void (**)(unsigned char *))(v10 + 16);
  uint64_t v52 = v15;
  v51(v14);
  id v16 = a3;
  swift_bridgeObjectRetain_n();
  id v17 = v16;
  uint64_t v18 = Logger.logObject.getter();
  int v19 = static os_log_type_t.info.getter();
  BOOL v20 = os_log_type_enabled(v18, (os_log_type_t)v19);
  uint64_t v56 = a1;
  uint64_t v57 = a3;
  uint64_t v50 = v10;
  if (v20)
  {
    int v46 = v19;
    os_log_t v47 = v18;
    uint64_t v48 = v9;
    uint64_t v21 = swift_slowAlloc();
    v61[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v60 = sub_10001B150(a1, a2, v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    unint64_t v49 = a2;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 12) = 2080;
    if (a3)
    {
      id v22 = [v17 description];
      uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v25 = v24;
    }
    else
    {
      unint64_t v25 = 0xE300000000000000;
      uint64_t v23 = 7104878;
    }
    uint64_t v60 = sub_10001B150(v23, v25, v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    os_log_t v27 = v47;
    _os_log_impl((void *)&_mh_execute_header, v47, (os_log_type_t)v46, "Validate Verification Code %s in region %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    int64_t v26 = *(void (**)(unsigned char *, uint64_t))(v50 + 8);
    uint64_t v9 = v48;
    v26(v14, v48);
    a2 = v49;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    int64_t v26 = *(void (**)(unsigned char *, uint64_t))(v10 + 8);
    v26(v14, v9);
  }
  sub_10000F884();
  uint64_t v28 = v58;
  ((void (*)(unsigned char *, uint64_t, uint64_t))v51)(v58, v52, v9);
  swift_bridgeObjectRetain_n();
  unint64_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v29, v30))
  {
    char v31 = (uint8_t *)swift_slowAlloc();
    v61[0] = swift_slowAlloc();
    *(_DWORD *)char v31 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v32 = v9;
    uint64_t v33 = v56;
    uint64_t v60 = sub_10001B150(v56, a2, v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Validate Verification Code with server %s", v31, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v26(v58, v32);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v26(v28, v9);
    uint64_t v33 = v56;
  }
  uint64_t v34 = (void **)ENManagerAdapter.defaultAdapter.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v35 = *v34;
  uint64_t v36 = (void *)swift_allocObject();
  uint64_t v37 = v53;
  uint64_t v38 = v54;
  uint64_t v39 = v59;
  v36[2] = v54;
  v36[3] = v39;
  uint64_t v40 = v55;
  v36[4] = v37;
  v36[5] = v40;
  CFUserNotificationRef v41 = *(void (**)(uint64_t, unint64_t, void *, uint64_t (*)(uint64_t), void *))((swift_isaMask & *v35) + 0x1F8);
  uint64_t v42 = v35;
  id v43 = v38;
  swift_retain();
  swift_retain();
  v41(v33, a2, v57, sub_10000FCB8, v36);

  return swift_release();
}

uint64_t sub_10000EF84(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v25 = a2;
  uint64_t v26 = a4;
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v28 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000ABA8(&qword_100029F90);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  __chkstk_darwin(v14 - 8);
  id v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FCC4(a1, (uint64_t)v17);
  unint64_t v18 = (*(unsigned __int8 *)(v15 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  int v19 = (void *)swift_allocObject();
  uint64_t v21 = v25;
  uint64_t v20 = v26;
  v19[2] = a3;
  v19[3] = v20;
  v19[4] = a5;
  v19[5] = v21;
  sub_10000FE48((uint64_t)v17, (uint64_t)v19 + v18);
  aBlock[4] = sub_10000FEB0;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001053C;
  aBlock[3] = &unk_100025A78;
  id v22 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  v21;
  static DispatchQoS.unspecified.getter();
  unint64_t v29 = &_swiftEmptyArrayStorage;
  sub_10000FF34();
  sub_10000ABA8(&qword_100029FA0);
  sub_10000FF8C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v22);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v27);
  return swift_release();
}

uint64_t sub_10000F2AC(uint64_t a1, void (*a2)(void *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v46 = a5;
  uint64_t v52 = a4;
  uint64_t v53 = a2;
  uint64_t v54 = a3;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v43 = *(void *)(v6 - 8);
  uint64_t v44 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v50 = *(void *)(v9 - 8);
  uint64_t v51 = v9;
  __chkstk_darwin(v9);
  os_log_t v47 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  uint64_t v48 = *(void *)(v11 - 8);
  uint64_t v49 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000ABA8(&qword_100029F90);
  uint64_t v45 = *(void *)(v14 - 8);
  uint64_t v15 = *(void *)(v45 + 64);
  __chkstk_darwin(v14);
  uint64_t v16 = (uint64_t *)((char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = type metadata accessor for DispatchTime();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v43 - v22;
  if (*(void *)(a1 + 32))
  {
    sub_10000FA44();
    static DispatchTime.now()();
    + infix(_:_:)();
    uint64_t v24 = *(void (**)(char *, uint64_t))(v18 + 8);
    v24(v21, v17);
    sub_10000FCC4(v46, (uint64_t)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v25 = (*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
    uint64_t v26 = swift_allocObject();
    uint64_t v27 = v54;
    *(void *)(v26 + 16) = v53;
    *(void *)(v26 + 24) = v27;
    sub_10000FE48((uint64_t)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v26 + v25);
    aBlock[4] = sub_100010154;
    aBlock[5] = v26;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10001053C;
    aBlock[3] = &unk_100025AC8;
    uint64_t v28 = _Block_copy(aBlock);
    swift_retain();
    static DispatchQoS.unspecified.getter();
    uint64_t v55 = &_swiftEmptyArrayStorage;
    sub_10000FF34();
    sub_10000ABA8(&qword_100029FA0);
    sub_10000FF8C();
    unint64_t v29 = v47;
    uint64_t v30 = v51;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
    _Block_release(v28);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v29, v30);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v49);
    v24(v23, v17);
    return swift_release();
  }
  else
  {
    uint64_t v32 = v53;
    uint64_t v33 = Logger.testVerification.unsafeMutableAddressor();
    uint64_t v35 = v43;
    uint64_t v34 = v44;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v8, v33, v44);
    uint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "User cancelled verification code validation", v38, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v34);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v39 = objc_allocWithZone((Class)NSError);
    NSString v40 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v41 = [v39 initWithDomain:v40 code:3072 userInfo:0];

    void *v16 = v41;
    swift_storeEnumTagMultiPayload();
    id v42 = v41;
    v32(v16);

    return sub_10000FFE8((uint64_t)v16);
  }
}

uint64_t sub_10000F884()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = Logger.testVerification.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Show Validating Dialog", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  type metadata accessor for ValidatingDialog();
  uint64_t v10 = (void *)swift_allocObject();
  v10[3] = 0;
  swift_unknownObjectWeakInit();
  v10[4] = 0;
  v10[5] = 0;
  v10[3] = &off_100025A18;
  swift_unknownObjectWeakAssign();
  *(void *)(v1 + 32) = v10;
  swift_retain();
  swift_release();
  sub_10000CF28();
  return swift_release();
}

uint64_t sub_10000FA44()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = Logger.testVerification.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Hide Validating Dialog", v9, 2u);
    swift_slowDealloc();
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v11 = *(void *)(v1 + 32);
  if (v11)
  {
    uint64_t v12 = *(__CFRunLoopSource **)(v11 + 40);
    if (v12)
    {
      swift_retain();
      CFRunLoopSourceInvalidate(v12);
      uint64_t v13 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = 0;

      uint64_t v14 = *(__CFUserNotification **)(v11 + 32);
      if (v14)
      {
LABEL_6:
        CFUserNotificationCancel(v14);
        uint64_t v15 = *(void **)(v11 + 32);
        *(void *)(v11 + 32) = 0;
        swift_release();

LABEL_9:
        *(void *)(v1 + 32) = 0;
        return swift_release();
      }
    }
    else
    {
      swift_retain();
      uint64_t v14 = *(__CFUserNotification **)(v11 + 32);
      if (v14) {
        goto LABEL_6;
      }
    }
    swift_release();
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_10000FC14()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for VerificationCodeValidator()
{
  return self;
}

uint64_t sub_10000FC70()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000FCB8(uint64_t a1)
{
  return sub_10000EF84(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_10000FCC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000ABA8(&qword_100029F90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FD2C()
{
  uint64_t v1 = *(void *)(sub_10000ABA8(&qword_100029F90) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  swift_release();

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_errorRelease();
  }
  else
  {
    uint64_t v5 = type metadata accessor for UUID();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10000FE48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000ABA8(&qword_100029F90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FEB0()
{
  uint64_t v1 = *(void *)(sub_10000ABA8(&qword_100029F90) - 8);
  uint64_t v2 = v0[2];
  uint64_t v3 = (void (*)(void *))v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = (uint64_t)v0 + ((*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_10000F2AC(v2, v3, v4, v5, v6);
}

uint64_t sub_10000FF1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000FF2C()
{
  return swift_release();
}

unint64_t sub_10000FF34()
{
  unint64_t result = qword_100029F98;
  if (!qword_100029F98)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029F98);
  }
  return result;
}

unint64_t sub_10000FF8C()
{
  unint64_t result = qword_100029FA8;
  if (!qword_100029FA8)
  {
    sub_10000CCE8(&qword_100029FA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029FA8);
  }
  return result;
}

uint64_t sub_10000FFE8(uint64_t a1)
{
  uint64_t v2 = sub_10000ABA8(&qword_100029F90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100010048()
{
  uint64_t v1 = *(void *)(sub_10000ABA8(&qword_100029F90) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_errorRelease();
  }
  else
  {
    uint64_t v5 = type metadata accessor for UUID();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100010154()
{
  uint64_t v1 = *(void *)(sub_10000ABA8(&qword_100029F90) - 8);
  return (*(uint64_t (**)(unint64_t))(v0 + 16))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
}

uint64_t sub_1000101C8(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v5 = __CocoaSet.startIndex.getter();
    uint64_t v7 = v6;
    __CocoaSet.endIndex.getter();
    char v8 = static __CocoaSet.Index.== infix(_:_:)();
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_3:
      sub_10001D59C(v5, v7, v4 != 0);
      return 0;
    }
LABEL_7:
    sub_10001C230(v5, v7, v4 != 0, a1, a2);
    uint64_t v9 = v13;
    sub_10001D59C(v5, v7, v4 != 0);
    return v9;
  }
  uint64_t result = sub_10001C4A0(a1);
  if ((v12 & 1) == 0)
  {
    uint64_t v7 = v11;
    if (*(_DWORD *)(a1 + 36) == v11)
    {
      uint64_t v5 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_1000102F0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000ABA8((uint64_t *)&unk_10002A100);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (void *)*(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    id v8 = v5;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10001BA98(v5);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v5;
    uint64_t v11 = (void *)(v2[7] + 16 * result);
    *uint64_t v11 = v6;
    v11[1] = v7;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v14;
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

unint64_t sub_100010404(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000ABA8(&qword_10002A0A8);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
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
    sub_10001C0EC(v6, (uint64_t)&v15, (uint64_t *)&unk_10002A0B0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10001BB80(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10001C150(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_10001053C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_10001079C(void *a1)
{
  uint64_t v2 = sub_10000ABA8(&qword_10002A0D0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000ABA8((uint64_t *)&unk_10002A050);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v36 = (char *)v34 - v13;
  id v14 = [a1 activityType];
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;

  if (v15 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v17 == v18)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0) {
      return [a1 invalidate];
    }
  }
  id v21 = [a1 webpageURL];
  if (v21)
  {
    uint64_t v22 = v21;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v23(v7, v12, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      uint64_t v24 = v36;
      v23(v36, v7, v8);
      URLComponents.init(url:resolvingAgainstBaseURL:)();
      uint64_t v25 = type metadata accessor for URLComponents();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 48))(v4, 1, v25) != 1)
      {
        sub_10000AE00((uint64_t)v4, &qword_10002A0D0);
        v34[1] = type metadata accessor for ENUIPublicHealthAgencyModel();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v24, v8);
        unint64_t v29 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
        uint64_t v30 = swift_allocObject();
        *(void *)(v30 + 16) = a1;
        v23((char *)(v30 + v29), v12, v8);
        char v31 = v35;
        *(void *)(v30 + ((v10 + v29 + 7) & 0xFFFFFFFFFFFFFFF8)) = v35;
        id v32 = a1;
        id v33 = v31;
        static ENUIPublicHealthAgencyModel.refreshRegions(completion:)();
        swift_release();
        return (id)(*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v24, v8);
      }
      (*(void (**)(char *, uint64_t))(v9 + 8))(v24, v8);
      uint64_t v26 = &qword_10002A0D0;
      uint64_t v27 = (uint64_t)v4;
      goto LABEL_14;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  }
  uint64_t v26 = (uint64_t *)&unk_10002A050;
  uint64_t v27 = (uint64_t)v7;
LABEL_14:
  sub_10000AE00(v27, v26);
  return [a1 invalidate];
}

void sub_100010BEC(NSObject *a1, NSObject *a2, char *a3)
{
  uint64_t v80 = a1;
  uint64_t v81 = a3;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void (***)(uint64_t, NSObject *, uint64_t))(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t)v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = type metadata accessor for Logger();
  uint64_t v8 = *(void (***)(char *, uint64_t))(v82 - 8);
  uint64_t v9 = __chkstk_darwin(v82);
  uint64_t v11 = (char *)v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  id v14 = (char *)v76 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v76 - v15;
  uint64_t v17 = (uint64_t *)ENUIPublicHealthAgencyModel.availableRegions.unsafeMutableAddressor();
  swift_beginAccess();
  if (static ENUIPublicHealthAgencyModel.activeRegion)
  {
    char v18 = *(unsigned char *)(static ENUIPublicHealthAgencyModel.activeRegion
                   + direct field offset for ENUIPublicHealthAgencyModel.isAssociatedDomainAllowed);
    id v19 = static ENUIPublicHealthAgencyModel.activeRegion;
    if (v18)
    {
      sub_10001168C(a2);
    }
    else
    {
      uint64_t v24 = Logger.launcher.unsafeMutableAddressor();
      uint64_t v25 = v8;
      uint64_t v26 = v8[2];
      uint64_t v27 = v82;
      ((void (*)(char *, uint64_t, uint64_t))v26)(v16, v24, v82);
      uint64_t v28 = (char *)v19;
      unint64_t v29 = Logger.logObject.getter();
      os_log_type_t v30 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v79 = a2;
        char v31 = (uint8_t *)swift_slowAlloc();
        uint64_t v78 = swift_slowAlloc();
        uint64_t v84 = v78;
        *(_DWORD *)char v31 = 136315138;
        uint64_t v77 = v31 + 4;
        id v32 = [*(id *)&v28[direct field offset for ENUIPublicHealthAgencyModel.region] regionCode];
        uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v81 = v28;
        uint64_t v34 = v25;
        unint64_t v36 = v35;

        uint64_t v83 = sub_10001B150(v33, v36, &v84);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "Intercepted associated link is not allowed for %s", v31, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v34[1](v16, v82);
        uint64_t v28 = v81;
      }
      else
      {

        v25[1](v16, v27);
      }
      [v80 invalidate];
      id v37 = [self defaultWorkspace];
      if (v37)
      {
        id v39 = v37;
        URL._bridgeToObjectiveC()(v38);
        id v41 = v40;
        sub_10000ABA8(&qword_10002A060);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_10001F040;
        *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(void *)(inited + 40) = v43;
        *(void *)(inited + 72) = &type metadata for Bool;
        *(unsigned char *)(inited + 48) = 1;
        *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(void *)(inited + 88) = v44;
        *(void *)(inited + 120) = &type metadata for Bool;
        *(unsigned char *)(inited + 96) = 1;
        sub_100010404(inited);
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v39 openURL:v41 withOptions:isa];
      }
    }
  }
  else
  {
    uint64_t v20 = *v17;
    if ((unint64_t)*v17 >> 62) {
      goto LABEL_31;
    }
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v21)
    {
      uint64_t v79 = a2;
      swift_bridgeObjectRetain();
      do
      {
        a2 = (v20 & 0xC000000000000001);
        if ((v20 & 0xC000000000000001) != 0) {
          uint64_t v22 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          uint64_t v22 = (char *)*(id *)(v20 + 32);
        }
        uint64_t v11 = v22;
        uint64_t v5 = (void (**)(uint64_t, NSObject *, uint64_t))&direct field offset for ENUIPublicHealthAgencyModel.isAssociatedDomainAllowed;
        if (v22[direct field offset for ENUIPublicHealthAgencyModel.isAssociatedDomainAllowed])
        {
LABEL_10:
          swift_bridgeObjectRelease_n();

          uint64_t v23 = v79;
          goto LABEL_41;
        }

        if (v21 == 1) {
          break;
        }
        uint64_t v7 = 5;
        while (1)
        {
          uint64_t v46 = a2
              ? (char *)specialized _ArrayBuffer._getElementSlowPath(_:)()
              : (char *)*(id *)(v20 + 8 * v7);
          uint64_t v11 = v46;
          uint64_t v4 = v7 - 3;
          if (__OFADD__(v7 - 4, 1)) {
            break;
          }
          if (v46[direct field offset for ENUIPublicHealthAgencyModel.isAssociatedDomainAllowed]) {
            goto LABEL_10;
          }

          ++v7;
          if (v4 == v21) {
            goto LABEL_25;
          }
        }
        __break(1u);
LABEL_31:
        if (v20 < 0) {
          uint64_t v65 = v20;
        }
        else {
          uint64_t v65 = v20 & 0xFFFFFFFFFFFFFF8;
        }
        swift_bridgeObjectRetain_n();
        uint64_t v78 = v65;
        uint64_t v66 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v66 <= 0) {
          goto LABEL_37;
        }
        uint64_t v79 = a2;
        swift_bridgeObjectRetain();
        uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
      }
      while (v21);
LABEL_25:
      swift_bridgeObjectRelease();
      uint64_t v47 = Logger.launcher.unsafeMutableAddressor();
      uint64_t v48 = (char *)v8;
      uint64_t v49 = v82;
      ((void (*)(char *, uint64_t, uint64_t))v8[2])(v14, v47, v82);
      swift_bridgeObjectRetain();
      uint64_t v50 = Logger.logObject.getter();
      os_log_type_t v51 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v81 = v48;
        uint64_t v52 = (uint8_t *)swift_slowAlloc();
        uint64_t v84 = swift_slowAlloc();
        *(_DWORD *)uint64_t v52 = 136315138;
        uint64_t v78 = (uint64_t)(v52 + 4);
        type metadata accessor for ENUIPublicHealthAgencyModel();
        swift_bridgeObjectRetain();
        uint64_t v53 = Array.description.getter();
        unint64_t v55 = v54;
        swift_bridgeObjectRelease();
        uint64_t v83 = sub_10001B150(v53, v55, &v84);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "Intercepted associated link is not available in %s", v52, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*((void (**)(char *, uint64_t))v81 + 1))(v14, v82);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*((void (**)(char *, uint64_t))v48 + 1))(v14, v49);
      }
      [v80 invalidate];
      id v56 = [self defaultWorkspace];
      if (v56)
      {
        char v58 = v56;
        URL._bridgeToObjectiveC()(v57);
        uint64_t v60 = v59;
        sub_10000ABA8(&qword_10002A060);
        uint64_t v61 = swift_initStackObject();
        *(_OWORD *)(v61 + 16) = xmmword_10001F040;
        *(void *)(v61 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(void *)(v61 + 40) = v62;
        *(void *)(v61 + 72) = &type metadata for Bool;
        *(unsigned char *)(v61 + 48) = 1;
        *(void *)(v61 + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(void *)(v61 + 88) = v63;
        *(void *)(v61 + 120) = &type metadata for Bool;
        *(unsigned char *)(v61 + 96) = 1;
        sub_100010404(v61);
        Class v64 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v58 openURL:v60 withOptions:v64];
      }
    }
    else
    {
LABEL_37:
      swift_bridgeObjectRelease();
      uint64_t v67 = Logger.launcher.unsafeMutableAddressor();
      uint64_t v68 = v8;
      uint64_t v69 = v8[2];
      uint64_t v70 = v82;
      ((void (*)(char *, uint64_t, uint64_t))v69)(v11, v67, v82);
      v5[2](v7, a2, v4);
      uint64_t v71 = Logger.logObject.getter();
      os_log_type_t v72 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v71, v72))
      {
        uint64_t v80 = v71;
        uint64_t v73 = (uint8_t *)swift_slowAlloc();
        uint64_t v78 = swift_slowAlloc();
        uint64_t v84 = v78;
        uint64_t v79 = a2;
        *(_DWORD *)uint64_t v73 = 136315138;
        v76[1] = v73 + 4;
        uint64_t v77 = v73;
        sub_10001B8E0(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v74 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v83 = sub_10001B150(v74, v75, &v84);
        a2 = v79;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        ((void (*)(uint64_t, uint64_t))v5[1])(v7, v4);
        uint64_t v71 = v80;
        _os_log_impl((void *)&_mh_execute_header, v80, v72, "Intercepted associated link %s", v77, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        ((void (*)(uint64_t, uint64_t))v5[1])(v7, v4);
      }

      v68[1](v11, v70);
      uint64_t v23 = a2;
LABEL_41:
      sub_10001168C(v23);
    }
  }
}

void sub_10001168C(NSObject *a1)
{
  uint64_t v2 = sub_10000ABA8((uint64_t *)&unk_10002A050);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v140 = (char *)&v135 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  os_log_t v141 = (os_log_t)((char *)&v135 - v5);
  uint64_t v6 = (void *)type metadata accessor for URL();
  uint64_t v142 = *(v6 - 1);
  id v143 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v139 = (char *)&v135 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v138 = (char *)&v135 - v9;
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void (***)(char *, uint64_t, uint64_t))(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  id v14 = (char *)&v135 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v135 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v135 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)&v135 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v26 = (char *)&v135 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v135 - v27;
  os_log_type_t v144 = a1;
  uint64_t v29 = sub_1000057C4(a1);
  if ((v32 & 0x10000000000) != 0)
  {
    unsigned __int8 v50 = v29;
    uint64_t v51 = Logger.launcher.unsafeMutableAddressor();
    v11[2](v14, v51, v10);
    uint64_t v52 = Logger.logObject.getter();
    os_log_type_t v53 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v52, v53))
    {
      unint64_t v54 = (uint8_t *)swift_slowAlloc();
      uint64_t v147 = swift_slowAlloc();
      uint64_t v137 = v10;
      *(_DWORD *)unint64_t v54 = 136315138;
      id v143 = v54 + 4;
      unsigned __int8 v55 = v50;
      LOBYTE(v146) = v50;
      uint64_t v56 = String.init<A>(describing:)();
      uint64_t v146 = sub_10001B150(v56, v57, &v147);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v52, v53, "URL failed %s", v54, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, uint64_t))v11[1])(v14, v137);
    }
    else
    {

      ((void (*)(char *, uint64_t))v11[1])(v14, v10);
      unsigned __int8 v55 = v50;
    }
    if (v55 - 2 < 2) {
      goto LABEL_10;
    }
    if (v55 != 4)
    {
      sub_1000132E0(v55 & 1);
      return;
    }
    URL.scheme.getter();
    if (v71
      && (v72._uint64_t countAndFlagsBits = 1886680168,
          v72._object = (void *)0xE400000000000000,
          Swift::Bool v73 = String.hasPrefix(_:)(v72),
          swift_bridgeObjectRelease(),
          v73))
    {
      id v74 = [self defaultWorkspace];
      if (v74)
      {
        uint64_t v76 = v74;
        URL._bridgeToObjectiveC()(v75);
        uint64_t v78 = v77;
        sub_10000ABA8(&qword_10002A060);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_10001F040;
        *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(void *)(inited + 40) = v80;
        *(void *)(inited + 72) = &type metadata for Bool;
        *(unsigned char *)(inited + 48) = 1;
        *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(void *)(inited + 88) = v81;
        *(void *)(inited + 120) = &type metadata for Bool;
        *(unsigned char *)(inited + 96) = 1;
        sub_100010404(inited);
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v76 openURL:v78 withOptions:isa];
      }
    }
    else
    {
LABEL_10:
      if (qword_100029968 != -1) {
        swift_once();
      }
      char v58 = self;
      swift_retain();
      id v59 = [v58 mainBundle];
      v148._object = (void *)0xEB00000000656C74;
      v60._object = (void *)0x800000010001FC10;
      v60._uint64_t countAndFlagsBits = 0xD000000000000011;
      v61._uint64_t countAndFlagsBits = 0;
      v61._object = (void *)0xE000000000000000;
      v148._uint64_t countAndFlagsBits = 0x6974207472656C41;
      Swift::String v62 = NSLocalizedString(_:tableName:bundle:value:comment:)(v60, (Swift::String_optional)0, (NSBundle)v59, v61, v148);

      id v63 = [v58 mainBundle];
      v64._uint64_t countAndFlagsBits = 0xD000000000000013;
      v149._object = (void *)0xED00006567617373;
      v64._object = (void *)0x800000010001FC30;
      v65._uint64_t countAndFlagsBits = 0;
      v65._object = (void *)0xE000000000000000;
      v149._uint64_t countAndFlagsBits = 0x656D207472656C41;
      Swift::String v66 = NSLocalizedString(_:tableName:bundle:value:comment:)(v64, (Swift::String_optional)0, (NSBundle)v63, v65, v149);

      id v67 = [v58 mainBundle];
      v150._object = (void *)0xE600000000000000;
      v68._uint64_t countAndFlagsBits = 19279;
      v68._object = (void *)0xE200000000000000;
      v69._uint64_t countAndFlagsBits = 0;
      v69._object = (void *)0xE000000000000000;
      v150._uint64_t countAndFlagsBits = 0x6E6F74747542;
      Swift::String v70 = NSLocalizedString(_:tableName:bundle:value:comment:)(v68, (Swift::String_optional)0, (NSBundle)v67, v69, v150);

      sub_10000C264(v62._countAndFlagsBits, (uint64_t)v62._object, v66._countAndFlagsBits, (uint64_t)v66._object, v70._countAndFlagsBits, (uint64_t)v70._object, 0, 0, 0, 0);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    unint64_t v33 = v30;
    if (BYTE4(v32))
    {
      if (BYTE4(v32) == 1)
      {
        uint64_t v34 = v29;
        unint64_t v35 = (void *)v31;
        uint64_t v36 = v32;
        sub_10001D344(v29, v30, (void *)v31, v32, 0);
        id v37 = v35;
        swift_bridgeObjectRetain();
        uint64_t v38 = Logger.testVerification.unsafeMutableAddressor();
        v11[2](v20, v38, v10);
        swift_bridgeObjectRetain_n();
        id v39 = v37;
        NSString v40 = Logger.logObject.getter();
        os_log_type_t v41 = static os_log_type_t.info.getter();
        LODWORD(v144) = v41;
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = swift_slowAlloc();
          os_log_t v141 = v40;
          uint64_t v43 = v42;
          uint64_t v142 = swift_slowAlloc();
          uint64_t v147 = v142;
          *(_DWORD *)uint64_t v43 = 136315650;
          uint64_t v137 = v10;
          id v143 = v39;
          swift_bridgeObjectRetain();
          uint64_t v146 = sub_10001B150(v34, v33, &v147);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v43 + 12) = 2080;
          uint64_t v146 = (uint64_t)v35;
          id v44 = v143;
          sub_10000ABA8(&qword_10002A0C8);
          uint64_t v140 = v20;
          uint64_t v45 = String.init<A>(describing:)();
          uint64_t v139 = (char *)v11;
          uint64_t v146 = sub_10001B150(v45, v46, &v147);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          *(_WORD *)(v43 + 22) = 2080;
          sub_10001D3A8(v36);
          uint64_t v47 = String.init(cString:)();
          uint64_t v146 = sub_10001B150(v47, v48, &v147);
          id v39 = v143;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          os_log_t v49 = v141;
          _os_log_impl((void *)&_mh_execute_header, v141, (os_log_type_t)v144, "Verification code: %s, region: %s, reportType: %s", (uint8_t *)v43, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*((void (**)(char *, uint64_t))v139 + 1))(v140, v137);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          ((void (*)(char *, uint64_t))v11[1])(v20, v10);
        }
        sub_1000147BC(v34, v33, v35, v36);
        sub_10001D2D0(v34, v33, v35, v36, 0);
        sub_10001D2D0(v34, v33, v35, v36, 0);
        swift_bridgeObjectRelease();
      }
      else
      {
        unint64_t v93 = v31 | v30;
        if (v32 || v93 | v29)
        {
          uint64_t v136 = v32;
          if (v32 || v29 != 1 || v93)
          {
            uint64_t v112 = Logger.launcher.unsafeMutableAddressor();
            uint64_t v113 = v17;
            v11[2](v17, v112, v10);
            uint64_t v115 = v142;
            id v114 = v143;
            uint64_t v116 = v139;
            (*(void (**)(char *, NSObject *, id))(v142 + 16))(v139, v144, v143);
            Swift::String v117 = Logger.logObject.getter();
            os_log_type_t v118 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v117, v118))
            {
              uint64_t v119 = swift_slowAlloc();
              int v145 = v113;
              uint64_t v120 = v119;
              int v121 = swift_slowAlloc();
              uint64_t v137 = v10;
              os_log_type_t v144 = v121;
              uint64_t v147 = (uint64_t)v121;
              *(_DWORD *)uint64_t v120 = 136315138;
              os_log_t v141 = (os_log_t)(v120 + 4);
              sub_10001B8E0(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
              uint64_t v122 = dispatch thunk of CustomStringConvertible.description.getter();
              uint64_t v146 = sub_10001B150(v122, v123, &v147);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease();
              (*(void (**)(char *, id))(v115 + 8))(v116, v114);
              _os_log_impl((void *)&_mh_execute_header, v117, v118, "Unknown link %s", (uint8_t *)v120, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              sub_10001D2D0(2, 0, 0, v136, 0);
              ((void (*)(char *, uint64_t))v11[1])(v145, v137);
            }
            else
            {
              (*(void (**)(char *, id))(v115 + 8))(v116, v114);

              sub_10001D2D0(2, 0, 0, v136, 0);
              ((void (*)(char *, uint64_t))v11[1])(v113, v10);
            }
          }
          else
          {
            uint64_t v99 = Logger.launcher.unsafeMutableAddressor();
            uint64_t v100 = v23;
            v11[2](v23, v99, v10);
            uint64_t v102 = v142;
            id v101 = v143;
            uint64_t v103 = v138;
            (*(void (**)(char *, NSObject *, id))(v142 + 16))(v138, v144, v143);
            v104 = Logger.logObject.getter();
            os_log_type_t v105 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v104, v105))
            {
              uint64_t v106 = swift_slowAlloc();
              uint64_t v137 = v10;
              os_log_type_t v107 = (uint8_t *)v106;
              uint64_t v108 = swift_slowAlloc();
              uint64_t v139 = (char *)v11;
              uint64_t v147 = v108;
              *(_DWORD *)os_log_type_t v107 = 136315138;
              sub_10001B8E0(&qword_10002A0C0, (void (*)(uint64_t))&type metadata accessor for URL);
              uint64_t v109 = dispatch thunk of CustomStringConvertible.description.getter();
              uint64_t v146 = sub_10001B150(v109, v110, &v147);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease();
              unint64_t v111 = *(void (**)(char *, id))(v142 + 8);
              v111(v103, v143);
              _os_log_impl((void *)&_mh_execute_header, v104, v105, "Report link %s", v107, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              id v101 = v143;
              swift_slowDealloc();

              (*((void (**)(char *, uint64_t))v139 + 1))(v100, v137);
            }
            else
            {
              unint64_t v111 = *(void (**)(char *, id))(v102 + 8);
              v111(v103, v101);

              ((void (*)(char *, uint64_t))v11[1])(v100, v10);
            }
            os_log_t v124 = v141;
            URL.init(string:)();
            id v125 = [self defaultWorkspace];
            uint64_t v126 = (uint64_t)v140;
            if (v125)
            {
              uint64_t v127 = v125;
              sub_10001C0EC((uint64_t)v124, (uint64_t)v140, (uint64_t *)&unk_10002A050);
              if ((*(unsigned int (**)(uint64_t, uint64_t, id))(v142 + 48))(v126, 1, v101) == 1)
              {
                uint64_t v129 = 0;
              }
              else
              {
                URL._bridgeToObjectiveC()(v128);
                uint64_t v129 = v130;
                v111((char *)v126, v101);
              }
              sub_10000ABA8(&qword_10002A060);
              uint64_t v131 = swift_initStackObject();
              *(_OWORD *)(v131 + 16) = xmmword_10001F040;
              *(void *)(v131 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
              *(void *)(v131 + 40) = v132;
              *(void *)(v131 + 72) = &type metadata for Bool;
              *(unsigned char *)(v131 + 48) = 1;
              *(void *)(v131 + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
              *(void *)(v131 + 88) = v133;
              *(void *)(v131 + 120) = &type metadata for Bool;
              *(unsigned char *)(v131 + 96) = 1;
              sub_100010404(v131);
              Class v134 = Dictionary._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease();
              [v127 openSensitiveURL:v129 withOptions:v134];
            }
            sub_10001D2D0(1, 0, 0, v136, 0);
            sub_10000AE00((uint64_t)v124, (uint64_t *)&unk_10002A050);
          }
        }
        else
        {
          uint64_t v94 = v32;
          uint64_t v95 = Logger.launcher.unsafeMutableAddressor();
          v11[2](v26, v95, v10);
          uint64_t v96 = Logger.logObject.getter();
          os_log_type_t v97 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v96, v97))
          {
            uint64_t v98 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v98 = 0;
            _os_log_impl((void *)&_mh_execute_header, v96, v97, "preAuthorization", v98, 2u);
            swift_slowDealloc();
          }

          ((void (*)(char *, uint64_t))v11[1])(v26, v10);
          sub_100013D54();
          sub_10001D2D0(0, 0, 0, v94, 0);
          sub_10001D2D0(0, 0, 0, v94, 0);
        }
      }
    }
    else
    {
      uint64_t v83 = v29;
      uint64_t v84 = v31;
      uint64_t v85 = v32;
      sub_10001D354(v29, v30, (void *)v31, v32, 0);
      uint64_t v86 = v83;
      os_log_type_t v144 = v84;
      uint64_t v136 = v85;
      sub_10001D354(v83, v33, v84, v85, 0);
      uint64_t v87 = Logger.launcher.unsafeMutableAddressor();
      v11[2](v28, v87, v10);
      uint64_t v88 = Logger.logObject.getter();
      os_log_type_t v89 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v88, v89))
      {
        uint64_t v90 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v90 = 0;
        _os_log_impl((void *)&_mh_execute_header, v88, v89, "onboarding", v90, 2u);
        swift_slowDealloc();
      }

      ((void (*)(char *, uint64_t))v11[1])(v28, v10);
      sub_10001290C(v86, v33);
      uint64_t v91 = v144;
      uint64_t v92 = v136;
      sub_10001D2D0(v86, v33, v144, v136, 0);
      sub_10001D2D0(v86, v33, v91, v92, 0);
      sub_10001D2E0(v86, v33, v91, v92, 0);
    }
  }
}

uint64_t sub_10001290C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = Logger.launcher.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Start onboarding...", v13, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v14 = (void **)ENManagerAdapter.defaultAdapter.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v15 = *v14;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = v3;
  uint64_t v17 = *(void (**)(uint64_t (*)(uint64_t, uint64_t), void *))((swift_isaMask & *v15) + 0x198);
  swift_bridgeObjectRetain();
  id v18 = v3;
  uint64_t v19 = v15;
  v17(sub_10001C224, v16);

  return swift_release();
}

uint64_t sub_100012B38(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v14 = (void **)ENManagerAdapter.defaultAdapter.unsafeMutableAddressor();
    swift_beginAccess();
    uint64_t v15 = *v14;
    uint64_t v16 = (void *)swift_allocObject();
    v16[2] = a3;
    v16[3] = a4;
    v16[4] = a5;
    v16[5] = a1;
    v16[6] = a2;
    uint64_t v17 = *(void (**)(uint64_t, uint64_t, void (*)(void *), void *))((swift_isaMask & *v15)
                                                                                         + 0x190);
    swift_bridgeObjectRetain();
    id v18 = v15;
    id v19 = a5;
    swift_bridgeObjectRetain();
    v17(a1, a2, sub_10001D2C0, v16);

    return swift_release();
  }
  else
  {
    uint64_t v21 = Logger.launcher.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v21, v10);
    swift_bridgeObjectRetain_n();
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = a3;
      uint64_t v31 = v28;
      *(_DWORD *)uint64_t v24 = 136315138;
      uint64_t v27 = v24 + 4;
      uint64_t v30 = a4;
      swift_bridgeObjectRetain();
      sub_10000ABA8(&qword_100029A68);
      uint64_t v25 = String.init<A>(describing:)();
      uint64_t v29 = sub_10001B150(v25, v26, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Start onboarding (query param: %s)", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return sub_10001CD34(a3, a4);
  }
}

void sub_100012E6C(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v40 - v16;
  if (a1)
  {
    id v18 = a1;
    uint64_t v19 = Logger.launcher.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v19, v11);
    uint64_t v20 = (char *)v18;
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v44 = v11;
      os_log_type_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      v45[0] = v43;
      os_log_type_t v41 = v23;
      *(_DWORD *)os_log_type_t v23 = 136315138;
      NSString v40 = v23 + 4;
      id v24 = [*(id *)&v20[direct field offset for ENUIPublicHealthAgencyModel.region] regionCode:v23 + 4];
      uint64_t v25 = a5;
      id v26 = v24;
      uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v42 = v12;
      uint64_t v28 = a6;
      uint64_t v29 = v27;
      unint64_t v31 = v30;

      a5 = v25;
      uint64_t v32 = v29;
      a6 = v28;
      uint64_t v46 = sub_10001B150(v32, v31, v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Start onboarding for last visited region %s", v41, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v42 + 8))(v15, v44);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    }
    sub_10001CD34(a5, a6);
  }
  else
  {
    uint64_t v33 = Logger.launcher.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v17, v33, v11);
    swift_bridgeObjectRetain_n();
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      v45[1] = (uint64_t)a3;
      uint64_t v46 = v37;
      uint64_t v44 = v11;
      v45[0] = a2;
      *(_DWORD *)uint64_t v36 = 136315138;
      uint64_t v43 = (uint64_t)(v36 + 4);
      swift_bridgeObjectRetain();
      sub_10000ABA8(&qword_100029A68);
      uint64_t v38 = String.init<A>(describing:)();
      v45[0] = sub_10001B150(v38, v39, &v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Using onboarding (query param: %s)", v36, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v44);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
    }
    sub_10001CD34(a2, a3);
  }
}

uint64_t sub_1000132E0(char a1)
{
  if (a1)
  {
    if (static ENUIPublicHealthAgencyModel.activeRegion)
    {
      uint64_t v28 = *(void *)(static ENUIPublicHealthAgencyModel.activeRegion
                      + direct field offset for ENUIPublicHealthAgencyModel.name);
      uint64_t v27 = *(void *)(static ENUIPublicHealthAgencyModel.activeRegion
                      + direct field offset for ENUIPublicHealthAgencyModel.name
                      + 8);
      uint64_t v29 = self;
      swift_bridgeObjectRetain();
      id v30 = [v29 mainBundle];
      v59._object = (void *)0xEB00000000656C74;
      v31._object = (void *)0x800000010001FC50;
      v31._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
      v32._uint64_t countAndFlagsBits = 0;
      v32._object = (void *)0xE000000000000000;
      v59._uint64_t countAndFlagsBits = 0x6974207472656C41;
      Swift::String v33 = NSLocalizedString(_:tableName:bundle:value:comment:)(v31, (Swift::String_optional)0, (NSBundle)v30, v32, v59);
      uint64_t countAndFlagsBits = v33._countAndFlagsBits;
      object = v33._object;

      id v34 = [v29 mainBundle];
      v35._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
      v60._object = (void *)0xED00006567617373;
      v35._object = (void *)0x800000010001FC70;
      v36._uint64_t countAndFlagsBits = 0;
      v36._object = (void *)0xE000000000000000;
      v60._uint64_t countAndFlagsBits = 0x656D207472656C41;
      NSLocalizedString(_:tableName:bundle:value:comment:)(v35, (Swift::String_optional)0, (NSBundle)v34, v36, v60);

      sub_10000ABA8(&qword_10002A098);
      uint64_t v37 = swift_allocObject();
      *(_OWORD *)(v37 + 16) = xmmword_10001F150;
      *(void *)(v37 + 56) = &type metadata for String;
      *(void *)(v37 + 64) = sub_10001BBF8();
      *(void *)(v37 + 32) = v28;
      *(void *)(v37 + 40) = v27;
      uint64_t v11 = String.init(format:_:)();
      uint64_t v12 = v38;
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v39 = self;
      id v40 = [v39 mainBundle];
      v41._uint64_t countAndFlagsBits = 0xD000000000000011;
      v61._object = (void *)0xEB00000000656C74;
      v41._object = (void *)0x800000010001FC10;
      v42._uint64_t countAndFlagsBits = 0;
      v42._object = (void *)0xE000000000000000;
      v61._uint64_t countAndFlagsBits = 0x6974207472656C41;
      Swift::String v43 = NSLocalizedString(_:tableName:bundle:value:comment:)(v41, (Swift::String_optional)0, (NSBundle)v40, v42, v61);
      uint64_t countAndFlagsBits = v43._countAndFlagsBits;
      object = v43._object;

      id v44 = [v39 mainBundle];
      v45._uint64_t countAndFlagsBits = 0xD000000000000013;
      v62._object = (void *)0xED00006567617373;
      v45._object = (void *)0x800000010001FC30;
      v46._uint64_t countAndFlagsBits = 0;
      v46._object = (void *)0xE000000000000000;
      v62._uint64_t countAndFlagsBits = 0x656D207472656C41;
      Swift::String v47 = NSLocalizedString(_:tableName:bundle:value:comment:)(v45, (Swift::String_optional)0, (NSBundle)v44, v46, v62);
      uint64_t v11 = v47._countAndFlagsBits;
      uint64_t v12 = v47._object;
    }
    id v48 = [self mainBundle];
    v63._object = (void *)0xE600000000000000;
    v49._uint64_t countAndFlagsBits = 19279;
    v49._object = (void *)0xE200000000000000;
    v50._uint64_t countAndFlagsBits = 0;
    v50._object = (void *)0xE000000000000000;
    v63._uint64_t countAndFlagsBits = 0x6E6F74747542;
    Swift::String v51 = NSLocalizedString(_:tableName:bundle:value:comment:)(v49, (Swift::String_optional)0, (NSBundle)v48, v50, v63);
    uint64_t v17 = v51._countAndFlagsBits;
    id v18 = v51._object;

    id v26 = 0;
    uint64_t v25 = 0;
    uint64_t v23 = 0;
    id v24 = 0;
  }
  else
  {
    uint64_t v1 = self;
    id v2 = [v1 mainBundle];
    v55._object = (void *)0xEB00000000656C74;
    v3._object = (void *)0x800000010001FC90;
    v3._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
    v4._uint64_t countAndFlagsBits = 0;
    v4._object = (void *)0xE000000000000000;
    v55._uint64_t countAndFlagsBits = 0x6974207472656C41;
    Swift::String v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(v3, (Swift::String_optional)0, (NSBundle)v2, v4, v55);
    uint64_t countAndFlagsBits = v5._countAndFlagsBits;
    object = v5._object;

    id v7 = [v1 mainBundle];
    v8._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
    v56._object = (void *)0xED00006567617373;
    v8._object = (void *)0x800000010001FCB0;
    v9._uint64_t countAndFlagsBits = 0;
    v9._object = (void *)0xE000000000000000;
    v56._uint64_t countAndFlagsBits = 0x656D207472656C41;
    Swift::String v10 = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v9, v56);
    uint64_t v11 = v10._countAndFlagsBits;
    uint64_t v12 = v10._object;

    id v13 = [v1 mainBundle];
    v14._uint64_t countAndFlagsBits = 0xD000000000000020;
    v57._object = (void *)0xE600000000000000;
    v14._object = (void *)0x800000010001F960;
    v15._uint64_t countAndFlagsBits = 0;
    v15._object = (void *)0xE000000000000000;
    v57._uint64_t countAndFlagsBits = 0x6E6F74747542;
    Swift::String v16 = NSLocalizedString(_:tableName:bundle:value:comment:)(v14, (Swift::String_optional)0, (NSBundle)v13, v15, v57);
    uint64_t v17 = v16._countAndFlagsBits;
    id v18 = v16._object;

    id v19 = [v1 mainBundle];
    v58._object = (void *)0xE600000000000000;
    v20._uint64_t countAndFlagsBits = 0x6C65636E6143;
    v20._object = (void *)0xE600000000000000;
    v21._uint64_t countAndFlagsBits = 0;
    v21._object = (void *)0xE000000000000000;
    v58._uint64_t countAndFlagsBits = 0x6E6F74747542;
    Swift::String v22 = NSLocalizedString(_:tableName:bundle:value:comment:)(v20, (Swift::String_optional)0, (NSBundle)v19, v21, v58);
    uint64_t v23 = v22._countAndFlagsBits;
    id v24 = v22._object;

    uint64_t v25 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v26 = sub_10001C1D8;
  }
  if (qword_100029968 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10000C264(countAndFlagsBits, (uint64_t)object, v11, (uint64_t)v12, v17, (uint64_t)v18, v23, (uint64_t)v24, (uint64_t)v26, v25);
  sub_10000CE24((uint64_t)v26);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000138C0(char a1)
{
  uint64_t v2 = sub_10000ABA8((uint64_t *)&unk_10002A050);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  Swift::String v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v7 = (char *)&v37 - v6;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  Swift::String v14 = (char *)&v37 - v13;
  uint64_t v15 = Logger.testVerification.unsafeMutableAddressor();
  Swift::String v16 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  if (a1)
  {
    v16(v12, v15, v8);
    Swift::String v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v32, v33))
    {
      id v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "User chose Cancel", v34, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  else
  {
    v16(v14, v15, v8);
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "User chose to turn on EN", v19, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    URL.init(string:)();
    id v20 = [self defaultWorkspace];
    if (v20)
    {
      Swift::String v21 = v20;
      sub_10001C0EC((uint64_t)v7, (uint64_t)v5, (uint64_t *)&unk_10002A050);
      uint64_t v22 = type metadata accessor for URL();
      uint64_t v23 = *(void *)(v22 - 8);
      uint64_t v25 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v5, 1, v22) != 1)
      {
        URL._bridgeToObjectiveC()(v24);
        uint64_t v25 = v26;
        (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
      }
      swift_beginAccess();
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        uint64_t v28 = (void *)Strong;
        sub_10000ABA8(&qword_10002A060);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_10001F040;
        *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(void *)(inited + 40) = v30;
        *(void *)(inited + 72) = &type metadata for Bool;
        *(unsigned char *)(inited + 48) = 1;
        *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(void *)(inited + 88) = v31;
        *(void *)(inited + 120) = &type metadata for Bool;
        *(unsigned char *)(inited + 96) = 1;
        sub_100010404(inited);
      }
      else
      {
        sub_100010404((uint64_t)&_swiftEmptyArrayStorage);
      }
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v21 openSensitiveURL:v25 withOptions:isa];
    }
    return sub_10000AE00((uint64_t)v7, (uint64_t *)&unk_10002A050);
  }
}

uint64_t sub_100013D54()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::String v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = Logger.launcher.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    Swift::String v16 = v1;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v11 = String.init<A>(describing:)();
    uint64_t v17 = sub_10001B150(v11, v12, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Start pre-authorization for %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v1 = v16;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  type metadata accessor for ENUIPublicHealthAgencyModel();
  *(void *)(swift_allocObject() + 16) = v1;
  id v13 = v1;
  static ENUIPublicHealthAgencyModel.refreshRegions(completion:)();
  return swift_release();
}

void sub_100013FA0()
{
  uint64_t v0 = sub_10000ABA8((uint64_t *)&unk_10002A050);
  uint64_t v1 = __chkstk_darwin(v0);
  uint64_t v56 = (uint64_t)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v55 = (uint64_t)&v52 - v4;
  uint64_t v5 = __chkstk_darwin(v3);
  id v7 = (char *)&v52 - v6;
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v52 - v8;
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  Swift::String v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __chkstk_darwin(v12);
  if (static ENUIPublicHealthAgencyModel.activeRegion)
  {
    unint64_t v54 = (char *)&v52 - v15;
    Swift::String v16 = v9;
    uint64_t v17 = *(uint64_t (**)(void))((swift_isaMask & *static ENUIPublicHealthAgencyModel.activeRegion) + 0x160);
    uint64_t v18 = static ENUIPublicHealthAgencyModel.activeRegion;
    if (v17() & 1) != 0 && ((*(uint64_t (**)(void))((swift_isaMask & *v18) + 0x158))())
    {
      uint64_t v19 = Logger.testVerification.unsafeMutableAddressor();
      uint64_t v20 = v11;
      Swift::String v21 = v54;
      uint64_t v22 = v57;
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v54, v19, v57);
      uint64_t v23 = v18;
      id v24 = Logger.logObject.getter();
      os_log_type_t v25 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = v20;
        uint64_t v27 = (uint8_t *)swift_slowAlloc();
        uint64_t v59 = swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 136315138;
        uint64_t v28 = *(void *)((char *)v23 + direct field offset for ENUIPublicHealthAgencyModel.appBundleId + 8);
        v58[0] = *(void *)((char *)v23 + direct field offset for ENUIPublicHealthAgencyModel.appBundleId);
        v58[1] = v28;
        swift_bridgeObjectRetain();
        sub_10000ABA8(&qword_100029A68);
        uint64_t v29 = String.init<A>(describing:)();
        v58[0] = sub_10001B150(v29, v30, &v59);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Opening app: %s", v27, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v26 + 8))(v54, v57);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v22);
      }
      id v49 = [self defaultWorkspace];
      if (v49)
      {
        Swift::String v50 = v49;
        if (*(void *)((char *)v23 + direct field offset for ENUIPublicHealthAgencyModel.appBundleId + 8))
        {
          swift_bridgeObjectRetain();
          NSString v51 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
        }
        else
        {
          NSString v51 = 0;
        }
        [v50 openApplicationWithBundleID:v51];
      }
      else
      {
      }
      return;
    }

    uint64_t v10 = v57;
    uint64_t v9 = v16;
  }
  URL.init(string:)();
  uint64_t v31 = Logger.testVerification.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v31, v10);
  sub_10001C0EC((uint64_t)v9, (uint64_t)v7, (uint64_t *)&unk_10002A050);
  Swift::String v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v53 = v11;
    unint64_t v54 = v9;
    id v34 = (uint8_t *)swift_slowAlloc();
    v58[0] = swift_slowAlloc();
    *(_DWORD *)id v34 = 136315138;
    sub_10001C0EC((uint64_t)v7, v55, (uint64_t *)&unk_10002A050);
    uint64_t v35 = String.init<A>(describing:)();
    uint64_t v59 = sub_10001B150(v35, v36, v58);
    uint64_t v9 = v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10000AE00((uint64_t)v7, (uint64_t *)&unk_10002A050);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Opening Settings to %s", v34, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v53 + 8))(v14, v57);
  }
  else
  {
    sub_10000AE00((uint64_t)v7, (uint64_t *)&unk_10002A050);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  id v37 = [self defaultWorkspace];
  uint64_t v38 = v56;
  if (v37)
  {
    unint64_t v39 = v37;
    sub_10001C0EC((uint64_t)v9, v56, (uint64_t *)&unk_10002A050);
    uint64_t v40 = type metadata accessor for URL();
    uint64_t v41 = *(void *)(v40 - 8);
    Swift::String v43 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48))(v38, 1, v40) != 1)
    {
      URL._bridgeToObjectiveC()(v42);
      Swift::String v43 = v44;
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v38, v40);
    }
    sub_10000ABA8(&qword_10002A060);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10001F040;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v46;
    *(void *)(inited + 72) = &type metadata for Bool;
    *(unsigned char *)(inited + 48) = 1;
    *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 88) = v47;
    *(void *)(inited + 120) = &type metadata for Bool;
    *(unsigned char *)(inited + 96) = 1;
    sub_100010404(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v39 openSensitiveURL:v43 withOptions:isa];
  }
  sub_10000AE00((uint64_t)v9, (uint64_t *)&unk_10002A050);
}

void sub_1000147BC(uint64_t a1, unint64_t a2, void *a3, int a4)
{
  uint64_t v29 = a1;
  int v27 = a4;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = Logger.testVerification.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    uint64_t v26 = a3;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_10001B150(v29, a2, aBlock);
    a3 = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Verification code %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  type metadata accessor for VerificationCodeValidator();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(unsigned char *)(v14 + 24) = 1;
  *(void *)(v14 + 32) = 0;
  id v15 = [self sharedApplication];
  NSString v16 = String._bridgeToObjectiveC()();
  aBlock[4] = (uint64_t)sub_10001AEF8;
  aBlock[5] = v14;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10001053C;
  aBlock[3] = (uint64_t)&unk_100025AF0;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v18 = [v15 beginBackgroundTaskWithName:v16 expirationHandler:v17];
  _Block_release(v17);

  *(void *)(v14 + 16) = v18;
  *(unsigned char *)(v14 + 24) = 0;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  *(unsigned char *)(v19 + 24) = 0;
  Swift::String v21 = v28;
  uint64_t v20 = v29;
  *(void *)(v19 + 32) = v29;
  *(void *)(v19 + 40) = a2;
  *(void *)(v19 + 48) = a3;
  *(void *)(v19 + 56) = v21;
  *(_DWORD *)(v19 + 64) = v27;
  sub_10001D5A8(0, &qword_10002A040);
  id v22 = a3;
  id v23 = v21;
  swift_bridgeObjectRetain();
  id v24 = (void *)static OS_dispatch_queue.main.getter();
  sub_10000E9F0(v20, a2, a3, v24, (uint64_t)sub_10001AF60, v19);
  swift_release();
  swift_release();
}

void sub_100014BAC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(a1 + 24))
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 16);
    uint64_t v7 = Logger.testVerification.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v16 = v6;
      uint64_t v17 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      v15[1] = v10 + 4;
      type metadata accessor for UIBackgroundTaskIdentifier(0);
      uint64_t v12 = String.init<A>(describing:)();
      uint64_t v16 = sub_10001B150(v12, v13, &v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "The time given to complete the verification code validation task %s to complete while the app is in the background has expired.", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    id v14 = [self sharedApplication];
    [v14 endBackgroundTask:v6];
  }
}

uint64_t sub_100014DFC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5, void *a6, void *a7, int a8)
{
  int v486 = a8;
  uint64_t v467 = a7;
  id v489 = a6;
  uint64_t v479 = a4;
  int v494 = a3;
  uint64_t v500 = a2;
  uint64_t v497 = (char *)a1;
  uint64_t v481 = sub_10000ABA8((uint64_t *)&unk_10002A050);
  uint64_t v9 = __chkstk_darwin(v481);
  uint64_t v488 = (uint64_t)&v466 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v480 = (uint64_t)&v466 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v487 = (uint64_t)&v466 - v14;
  __chkstk_darwin(v13);
  unint64_t v493 = (void (*)(char *, uint64_t))((char *)&v466 - v15);
  uint64_t v16 = type metadata accessor for UUID();
  uint64_t countAndFlagsBits = *(NSObject **)(v16 - 8);
  uint64_t v17 = __chkstk_darwin(v16);
  v498._object = (char *)&v466 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v466 - v19;
  uint64_t v21 = type metadata accessor for CocoaError.Code();
  uint64_t v484 = *(void *)(v21 - 8);
  unint64_t v485 = (void (*)(void, void, void))v21;
  __chkstk_darwin(v21);
  v483 = (char *)&v466 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for Logger();
  id v24 = *(NSObject **)(v23 - 8);
  uint64_t v25 = __chkstk_darwin(v23);
  unint64_t v492 = (char *)&v466 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __chkstk_darwin(v25);
  v498._uint64_t countAndFlagsBits = (uint64_t)&v466 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v469 = (char *)&v466 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  v468 = (char *)&v466 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v490 = (char *)&v466 - v34;
  uint64_t v35 = __chkstk_darwin(v33);
  char v470 = (char *)&v466 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v471 = (char *)&v466 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v472 = (char *)&v466 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  uint64_t v473 = (char *)&v466 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  uint64_t v491 = ((char *)&v466 - v44);
  uint64_t v45 = __chkstk_darwin(v43);
  v474 = (char *)&v466 - v46;
  uint64_t v47 = __chkstk_darwin(v45);
  os_log_type_t v475 = (char *)&v466 - v48;
  uint64_t v49 = __chkstk_darwin(v47);
  uint64_t v476 = (char *)&v466 - v50;
  uint64_t v51 = __chkstk_darwin(v49);
  uint64_t v477 = (char *)&v466 - v52;
  uint64_t v53 = __chkstk_darwin(v51);
  uint64_t v478 = (char *)&v466 - v54;
  __chkstk_darwin(v53);
  uint64_t v56 = (char *)&v466 - v55;
  uint64_t v57 = sub_10000ABA8(&qword_100029F90);
  __chkstk_darwin(v57);
  uint64_t v59 = (uint64_t *)((char *)&v466 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10001C0EC((uint64_t)v497, (uint64_t)v59, &qword_100029F90);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v495 = v23;
  *(void *)&long long v496 = v24;
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v61 = *v59;
    uint64_t v62 = Logger.testVerification.unsafeMutableAddressor();
    Swift::String v63 = v24;
    Class isa = v24[2].isa;
    v498._uint64_t countAndFlagsBits = v62;
    v498._object = isa;
    uint64_t countAndFlagsBits = v24 + 2;
    ((void (*)(char *))isa)(v56);
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    Swift::String v65 = Logger.logObject.getter();
    os_log_type_t v66 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v65, v66))
    {
      uint64_t v67 = swift_slowAlloc();
      *(void *)&long long v501 = swift_slowAlloc();
      *(_DWORD *)uint64_t v67 = 136315394;
      swift_bridgeObjectRetain();
      v504._uint64_t countAndFlagsBits = sub_10001B150(v479, a5, (uint64_t *)&v501);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v67 + 12) = 2080;
      v504._uint64_t countAndFlagsBits = v61;
      swift_errorRetain();
      sub_10000ABA8(&qword_10002A088);
      uint64_t v68 = String.init<A>(describing:)();
      v504._uint64_t countAndFlagsBits = sub_10001B150(v68, v69, (uint64_t *)&v501);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v65, v66, "Failed to validate verification code %s: %s", (uint8_t *)v67, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v23 = v495;
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v83 = (void (*)(char *, uint64_t))v63[1].isa;
    v83(v56, v23);
    uint64_t v84 = v500;
    uint64_t v85 = v491;
    swift_errorRetain();
    uint64_t v86 = v483;
    static CocoaError.userCancelled.getter();
    sub_10001B8E0(&qword_10002A068, (void (*)(uint64_t))&type metadata accessor for CocoaError.Code);
    uint64_t v87 = v485;
    char v88 = static _ErrorCodeProtocol.~= infix(_:_:)();
    swift_errorRelease();
    (*(void (**)(char *, void (*)(void, void, void)))(v484 + 8))(v86, v87);
    os_log_type_t v89 = v490;
    if (v88)
    {
      if ((v494 & 1) == 0 && UIBackgroundTaskInvalid != v84)
      {
        id v90 = [self sharedApplication];
        [v90 endBackgroundTask:v84];
      }
      return swift_errorRelease();
    }
    _s3__C4CodeOMa_0(0);
    *(void *)&long long v501 = 1;
    swift_errorRetain();
    sub_10001B8E0((unint64_t *)&unk_10002A070, _s3__C4CodeOMa_0);
    char v110 = static _ErrorCodeProtocol.~= infix(_:_:)();
    swift_errorRelease();
    uint64_t v497 = (char *)v61;
    if (v110)
    {
      unint64_t v111 = v478;
      ((void (*)(char *, uint64_t, uint64_t))v498._object)(v478, v498._countAndFlagsBits, v23);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v112 = Logger.logObject.getter();
      os_log_type_t v113 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v112, v113))
      {
        unint64_t v493 = v83;
        id v114 = (uint8_t *)swift_slowAlloc();
        *(void *)&long long v501 = swift_slowAlloc();
        *(_DWORD *)id v114 = 136315138;
        v504._uint64_t countAndFlagsBits = v61;
        swift_errorRetain();
        sub_10000ABA8(&qword_10002A088);
        uint64_t v115 = String.init<A>(describing:)();
        v504._uint64_t countAndFlagsBits = sub_10001B150(v115, v116, (uint64_t *)&v501);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v112, v113, "Test Verification Unknown error %s", v114, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v493(v478, v495);
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();

        v83(v111, v23);
      }
    }
    else
    {
      *(void *)&long long v501 = 2;
      swift_errorRetain();
      char v132 = static _ErrorCodeProtocol.~= infix(_:_:)();
      swift_errorRelease();
      if (v132)
      {
        unint64_t v493 = v83;
        ((void (*)(char *, uint64_t, uint64_t))v498._object)(v477, v498._countAndFlagsBits, v23);
        uint64_t v133 = swift_allocObject();
        *(void *)(v133 + 16) = v61;
        swift_errorRetain();
        swift_errorRetain();
        Class v134 = Logger.logObject.getter();
        os_log_type_t v135 = static os_log_type_t.error.getter();
        uint64_t v136 = swift_allocObject();
        *(unsigned char *)(v136 + 16) = 32;
        uint64_t v137 = v61;
        uint64_t v138 = swift_allocObject();
        *(unsigned char *)(v138 + 16) = 8;
        uint64_t v139 = swift_allocObject();
        *(void *)(v139 + 16) = sub_10001D7A4;
        *(void *)(v139 + 24) = v133;
        uint64_t v140 = swift_allocObject();
        *(void *)(v140 + 16) = sub_10001D718;
        *(void *)(v140 + 24) = v139;
        sub_10000ABA8(&qword_10002A080);
        uint64_t v141 = swift_allocObject();
        *(_OWORD *)(v141 + 16) = xmmword_10001EFE0;
        *(void *)(v141 + 32) = sub_10001D7A8;
        *(void *)(v141 + 40) = v136;
        *(void *)(v141 + 48) = sub_10001D7A8;
        *(void *)(v141 + 56) = v138;
        *(void *)(v141 + 64) = sub_10000BD48;
        *(void *)(v141 + 72) = v140;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        os_log_type_t v142 = v135;
        uint64_t countAndFlagsBits = v134;
        if (os_log_type_enabled(v134, v135))
        {
          id v143 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v501 = swift_slowAlloc();
          *(_WORD *)id v143 = 258;
          v143[2] = 32;
          swift_release();
          v143[3] = 8;
          swift_release();
          v504._uint64_t countAndFlagsBits = v137;
          swift_errorRetain();
          sub_10000ABA8(&qword_10002A088);
          uint64_t v144 = String.init<A>(describing:)();
          v504._uint64_t countAndFlagsBits = sub_10001B150(v144, v145, (uint64_t *)&v501);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          uint64_t v146 = countAndFlagsBits;
          _os_log_impl((void *)&_mh_execute_header, countAndFlagsBits, v142, "Verification Code Invalid error: %s", v143, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_errorRelease();
        }
        v493(v477, v495);
        BOOL v162 = self;
        id v163 = [v162 mainBundle];
        v164._uint64_t countAndFlagsBits = 0xD000000000000012;
        v505._object = (void *)0xEB00000000656C74;
        v164._object = (void *)0x800000010001FB40;
        v165._uint64_t countAndFlagsBits = 0;
        v165._object = (void *)0xE000000000000000;
        v505._uint64_t countAndFlagsBits = 0x6974207472656C41;
        Swift::String v498 = NSLocalizedString(_:tableName:bundle:value:comment:)(v164, (Swift::String_optional)0, (NSBundle)v163, v165, v505);

        id v166 = [v162 mainBundle];
        v167._uint64_t countAndFlagsBits = 0xD000000000000014;
        v506._object = (void *)0xED00006567617373;
        v167._object = (void *)0x800000010001FB60;
        v168._uint64_t countAndFlagsBits = 0;
        v168._object = (void *)0xE000000000000000;
        v506._uint64_t countAndFlagsBits = 0x656D207472656C41;
        Swift::String v169 = NSLocalizedString(_:tableName:bundle:value:comment:)(v167, (Swift::String_optional)0, (NSBundle)v166, v168, v506);
        uint64_t countAndFlagsBits = v169._countAndFlagsBits;
        object = v169._object;

        id v171 = [v162 mainBundle];
        goto LABEL_73;
      }
      *(void *)&long long v501 = 3;
      swift_errorRetain();
      char v147 = static _ErrorCodeProtocol.~= infix(_:_:)();
      swift_errorRelease();
      if (v147)
      {
        unint64_t v493 = v83;
        ((void (*)(char *, uint64_t, uint64_t))v498._object)(v476, v498._countAndFlagsBits, v23);
        uint64_t v148 = swift_allocObject();
        *(void *)(v148 + 16) = v61;
        swift_errorRetain();
        swift_errorRetain();
        Swift::String v149 = Logger.logObject.getter();
        os_log_type_t v150 = static os_log_type_t.error.getter();
        uint64_t v151 = swift_allocObject();
        *(unsigned char *)(v151 + 16) = 32;
        uint64_t v152 = v61;
        uint64_t v153 = swift_allocObject();
        *(unsigned char *)(v153 + 16) = 8;
        uint64_t v154 = swift_allocObject();
        *(void *)(v154 + 16) = sub_10001D7A4;
        *(void *)(v154 + 24) = v148;
        uint64_t v155 = swift_allocObject();
        *(void *)(v155 + 16) = sub_10001D718;
        *(void *)(v155 + 24) = v154;
        sub_10000ABA8(&qword_10002A080);
        uint64_t v156 = swift_allocObject();
        *(_OWORD *)(v156 + 16) = xmmword_10001EFE0;
        *(void *)(v156 + 32) = sub_10001D7A8;
        *(void *)(v156 + 40) = v151;
        *(void *)(v156 + 48) = sub_10001D7A8;
        *(void *)(v156 + 56) = v153;
        *(void *)(v156 + 64) = sub_10000BD48;
        *(void *)(v156 + 72) = v155;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        os_log_type_t v157 = v150;
        uint64_t countAndFlagsBits = v149;
        if (os_log_type_enabled(v149, v150))
        {
          v158 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v501 = swift_slowAlloc();
          *(_WORD *)v158 = 258;
          v158[2] = 32;
          swift_release();
          v158[3] = 8;
          swift_release();
          v504._uint64_t countAndFlagsBits = v152;
          swift_errorRetain();
          sub_10000ABA8(&qword_10002A088);
          uint64_t v159 = String.init<A>(describing:)();
          v504._uint64_t countAndFlagsBits = sub_10001B150(v159, v160, (uint64_t *)&v501);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          os_log_type_t v161 = countAndFlagsBits;
          _os_log_impl((void *)&_mh_execute_header, countAndFlagsBits, v157, "Verification Code Expired error: %s", v158, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_errorRelease();
        }
        v493(v476, v495);
        uint64_t v187 = self;
        id v188 = [v187 mainBundle];
        v189._uint64_t countAndFlagsBits = 0xD000000000000012;
        v507._object = (void *)0xEB00000000656C74;
        v189._object = (void *)0x800000010001FB00;
        v190._uint64_t countAndFlagsBits = 0;
        v190._object = (void *)0xE000000000000000;
        v507._uint64_t countAndFlagsBits = 0x6974207472656C41;
        Swift::String v498 = NSLocalizedString(_:tableName:bundle:value:comment:)(v189, (Swift::String_optional)0, (NSBundle)v188, v190, v507);

        id v191 = [v187 mainBundle];
        v192._uint64_t countAndFlagsBits = 0xD000000000000014;
        v508._object = (void *)0xED00006567617373;
        v192._object = (void *)0x800000010001FB20;
        v193._uint64_t countAndFlagsBits = 0;
        v193._object = (void *)0xE000000000000000;
        v508._uint64_t countAndFlagsBits = 0x656D207472656C41;
        Swift::String v194 = NSLocalizedString(_:tableName:bundle:value:comment:)(v192, (Swift::String_optional)0, (NSBundle)v191, v193, v508);
        uint64_t countAndFlagsBits = v194._countAndFlagsBits;
        object = v194._object;

        id v171 = [v187 mainBundle];
        goto LABEL_73;
      }
      *(void *)&long long v501 = 4;
      swift_errorRetain();
      char v172 = static _ErrorCodeProtocol.~= infix(_:_:)();
      swift_errorRelease();
      if (v172)
      {
        ((void (*)(char *, uint64_t, uint64_t))v498._object)(v475, v498._countAndFlagsBits, v23);
        uint64_t v173 = swift_allocObject();
        *(void *)(v173 + 16) = v61;
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v174 = Logger.logObject.getter();
        os_log_type_t v175 = static os_log_type_t.error.getter();
        uint64_t v176 = swift_allocObject();
        *(unsigned char *)(v176 + 16) = 32;
        uint64_t v177 = swift_allocObject();
        *(unsigned char *)(v177 + 16) = 8;
        uint64_t v178 = swift_allocObject();
        *(void *)(v178 + 16) = sub_10001D7A4;
        *(void *)(v178 + 24) = v173;
        uint64_t v179 = swift_allocObject();
        *(void *)(v179 + 16) = sub_10001D718;
        *(void *)(v179 + 24) = v178;
        sub_10000ABA8(&qword_10002A080);
        uint64_t v180 = swift_allocObject();
        *(_OWORD *)(v180 + 16) = xmmword_10001EFE0;
        *(void *)(v180 + 32) = sub_10001D7A8;
        *(void *)(v180 + 40) = v176;
        *(void *)(v180 + 48) = sub_10001D7A8;
        *(void *)(v180 + 56) = v177;
        *(void *)(v180 + 64) = sub_10000BD48;
        *(void *)(v180 + 72) = v179;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        os_log_type_t v181 = v175;
        uint64_t countAndFlagsBits = v174;
        if (os_log_type_enabled(v174, v175))
        {
          Swift::Bool v182 = (uint8_t *)swift_slowAlloc();
          uint64_t v183 = swift_slowAlloc();
          unint64_t v493 = v83;
          *(void *)&long long v501 = v183;
          *(_WORD *)Swift::Bool v182 = 258;
          v182[2] = 32;
          swift_release();
          v182[3] = 8;
          swift_release();
          v504._uint64_t countAndFlagsBits = (uint64_t)v497;
          swift_errorRetain();
          sub_10000ABA8(&qword_10002A088);
          uint64_t v184 = String.init<A>(describing:)();
          v504._uint64_t countAndFlagsBits = sub_10001B150(v184, v185, (uint64_t *)&v501);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          Swift::Bool v186 = countAndFlagsBits;
          _os_log_impl((void *)&_mh_execute_header, countAndFlagsBits, v181, "Test Verification Invalid Server Response error: %s", v182, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v493(v475, v495);
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_errorRelease();

          v83(v475, v495);
        }
      }
      else
      {
        *(void *)&long long v501 = 6;
        swift_errorRetain();
        char v195 = static _ErrorCodeProtocol.~= infix(_:_:)();
        swift_errorRelease();
        if (v195)
        {
          ((void (*)(char *, uint64_t, uint64_t))v498._object)(v474, v498._countAndFlagsBits, v23);
          uint64_t v196 = swift_allocObject();
          *(void *)(v196 + 16) = v61;
          swift_errorRetain();
          swift_errorRetain();
          v197 = Logger.logObject.getter();
          os_log_type_t v198 = static os_log_type_t.error.getter();
          uint64_t v199 = swift_allocObject();
          *(unsigned char *)(v199 + 16) = 32;
          uint64_t v200 = swift_allocObject();
          *(unsigned char *)(v200 + 16) = 8;
          uint64_t v201 = swift_allocObject();
          *(void *)(v201 + 16) = sub_10001D7A4;
          *(void *)(v201 + 24) = v196;
          uint64_t v202 = swift_allocObject();
          *(void *)(v202 + 16) = sub_10001D718;
          *(void *)(v202 + 24) = v201;
          sub_10000ABA8(&qword_10002A080);
          uint64_t v203 = swift_allocObject();
          *(_OWORD *)(v203 + 16) = xmmword_10001EFE0;
          *(void *)(v203 + 32) = sub_10001D7A8;
          *(void *)(v203 + 40) = v199;
          *(void *)(v203 + 48) = sub_10001D7A8;
          *(void *)(v203 + 56) = v200;
          *(void *)(v203 + 64) = sub_10000BD48;
          *(void *)(v203 + 72) = v202;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          os_log_type_t v204 = v198;
          uint64_t countAndFlagsBits = v197;
          if (os_log_type_enabled(v197, v198))
          {
            os_log_type_t v205 = (uint8_t *)swift_slowAlloc();
            uint64_t v206 = swift_slowAlloc();
            unint64_t v493 = v83;
            *(void *)&long long v501 = v206;
            *(_WORD *)os_log_type_t v205 = 258;
            v205[2] = 32;
            swift_release();
            v205[3] = 8;
            swift_release();
            v504._uint64_t countAndFlagsBits = (uint64_t)v497;
            swift_errorRetain();
            sub_10000ABA8(&qword_10002A088);
            uint64_t v207 = String.init<A>(describing:)();
            v504._uint64_t countAndFlagsBits = sub_10001B150(v207, v208, (uint64_t *)&v501);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release();
            swift_release();
            swift_release();
            swift_bridgeObjectRelease();
            swift_errorRelease();
            uint64_t v209 = countAndFlagsBits;
            _os_log_impl((void *)&_mh_execute_header, countAndFlagsBits, v204, "Test Verification Server error: %s", v205, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            v493(v474, v495);
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_errorRelease();

            v83(v474, v495);
          }
        }
        else
        {
          *(void *)&long long v501 = 7;
          swift_errorRetain();
          char v210 = static _ErrorCodeProtocol.~= infix(_:_:)();
          swift_errorRelease();
          if (v210)
          {
            ((void (*)(NSObject *, uint64_t, uint64_t))v498._object)(v85, v498._countAndFlagsBits, v23);
            uint64_t v211 = swift_allocObject();
            *(void *)(v211 + 16) = v61;
            swift_errorRetain();
            swift_errorRetain();
            v212 = Logger.logObject.getter();
            os_log_type_t v213 = static os_log_type_t.error.getter();
            uint64_t v214 = swift_allocObject();
            *(unsigned char *)(v214 + 16) = 32;
            uint64_t v215 = swift_allocObject();
            *(unsigned char *)(v215 + 16) = 8;
            uint64_t v216 = swift_allocObject();
            *(void *)(v216 + 16) = sub_10001D7A4;
            *(void *)(v216 + 24) = v211;
            uint64_t v217 = swift_allocObject();
            *(void *)(v217 + 16) = sub_10001D718;
            *(void *)(v217 + 24) = v216;
            sub_10000ABA8(&qword_10002A080);
            uint64_t v218 = swift_allocObject();
            *(_OWORD *)(v218 + 16) = xmmword_10001EFE0;
            *(void *)(v218 + 32) = sub_10001D7A8;
            *(void *)(v218 + 40) = v214;
            *(void *)(v218 + 48) = sub_10001D7A8;
            *(void *)(v218 + 56) = v215;
            *(void *)(v218 + 64) = sub_10000BD48;
            *(void *)(v218 + 72) = v217;
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRelease();
            os_log_type_t v219 = v213;
            uint64_t countAndFlagsBits = v212;
            if (os_log_type_enabled(v212, v213))
            {
              uint64_t v220 = (uint8_t *)swift_slowAlloc();
              uint64_t v221 = swift_slowAlloc();
              unint64_t v493 = v83;
              *(void *)&long long v501 = v221;
              *(_WORD *)uint64_t v220 = 258;
              v220[2] = 32;
              swift_release();
              v220[3] = 8;
              swift_release();
              v504._uint64_t countAndFlagsBits = (uint64_t)v497;
              swift_errorRetain();
              sub_10000ABA8(&qword_10002A088);
              uint64_t v222 = String.init<A>(describing:)();
              v504._uint64_t countAndFlagsBits = sub_10001B150(v222, v223, (uint64_t *)&v501);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_release();
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();
              swift_errorRelease();
              v224 = countAndFlagsBits;
              _os_log_impl((void *)&_mh_execute_header, countAndFlagsBits, v219, "Test Verification Server Rate Limit error: %s", v220, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              v493((char *)v491, v495);
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_errorRelease();

              v83((char *)v491, v495);
            }
            v240 = self;
            id v241 = [v240 mainBundle];
            v242._uint64_t countAndFlagsBits = 0xD000000000000016;
            v509._object = (void *)0xEB00000000656C74;
            v242._object = (void *)0x800000010001FAC0;
            v243._uint64_t countAndFlagsBits = 0;
            v243._object = (void *)0xE000000000000000;
            v509._uint64_t countAndFlagsBits = 0x6974207472656C41;
            Swift::String v498 = NSLocalizedString(_:tableName:bundle:value:comment:)(v242, (Swift::String_optional)0, (NSBundle)v241, v243, v509);

            id v244 = [v240 mainBundle];
            v245._uint64_t countAndFlagsBits = 0xD000000000000018;
            v510._object = (void *)0xED00006567617373;
            v245._object = (void *)0x800000010001FAE0;
            v246._uint64_t countAndFlagsBits = 0;
            v246._object = (void *)0xE000000000000000;
            v510._uint64_t countAndFlagsBits = 0x656D207472656C41;
            Swift::String v247 = NSLocalizedString(_:tableName:bundle:value:comment:)(v245, (Swift::String_optional)0, (NSBundle)v244, v246, v510);
            uint64_t countAndFlagsBits = v247._countAndFlagsBits;
            object = v247._object;

            id v171 = [v240 mainBundle];
            goto LABEL_73;
          }
          *(void *)&long long v501 = 8;
          swift_errorRetain();
          char v225 = static _ErrorCodeProtocol.~= infix(_:_:)();
          swift_errorRelease();
          if (v225)
          {
            ((void (*)(char *, uint64_t, uint64_t))v498._object)(v473, v498._countAndFlagsBits, v23);
            uint64_t v226 = swift_allocObject();
            *(void *)(v226 + 16) = v61;
            swift_errorRetain();
            swift_errorRetain();
            uint64_t v227 = Logger.logObject.getter();
            os_log_type_t v228 = static os_log_type_t.error.getter();
            uint64_t v229 = swift_allocObject();
            *(unsigned char *)(v229 + 16) = 32;
            uint64_t v230 = swift_allocObject();
            *(unsigned char *)(v230 + 16) = 8;
            uint64_t v231 = swift_allocObject();
            *(void *)(v231 + 16) = sub_10001D7A4;
            *(void *)(v231 + 24) = v226;
            uint64_t v232 = swift_allocObject();
            *(void *)(v232 + 16) = sub_10001D718;
            *(void *)(v232 + 24) = v231;
            sub_10000ABA8(&qword_10002A080);
            uint64_t v233 = swift_allocObject();
            *(_OWORD *)(v233 + 16) = xmmword_10001EFE0;
            *(void *)(v233 + 32) = sub_10001D7A8;
            *(void *)(v233 + 40) = v229;
            *(void *)(v233 + 48) = sub_10001D7A8;
            *(void *)(v233 + 56) = v230;
            *(void *)(v233 + 64) = sub_10000BD48;
            *(void *)(v233 + 72) = v232;
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRelease();
            os_log_type_t v234 = v228;
            uint64_t countAndFlagsBits = v227;
            if (os_log_type_enabled(v227, v228))
            {
              uint64_t v235 = (uint8_t *)swift_slowAlloc();
              uint64_t v236 = swift_slowAlloc();
              unint64_t v493 = v83;
              *(void *)&long long v501 = v236;
              *(_WORD *)uint64_t v235 = 258;
              v235[2] = 32;
              swift_release();
              v235[3] = 8;
              swift_release();
              v504._uint64_t countAndFlagsBits = (uint64_t)v497;
              swift_errorRetain();
              sub_10000ABA8(&qword_10002A088);
              uint64_t v237 = String.init<A>(describing:)();
              v504._uint64_t countAndFlagsBits = sub_10001B150(v237, v238, (uint64_t *)&v501);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_release();
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();
              swift_errorRelease();
              uint64_t v239 = countAndFlagsBits;
              _os_log_impl((void *)&_mh_execute_header, countAndFlagsBits, v234, "Test Verification Server Timeout error: %s", v235, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              v493(v473, v495);
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_errorRelease();

              v83(v473, v495);
            }
            v263 = self;
            id v264 = [v263 mainBundle];
            v511._object = (void *)0xEB00000000656C74;
            v265._object = (void *)0x800000010001F8C0;
            v265._uint64_t countAndFlagsBits = 0xD000000000000027;
            v266._uint64_t countAndFlagsBits = 0;
            v266._object = (void *)0xE000000000000000;
            v511._uint64_t countAndFlagsBits = 0x6974207472656C41;
            Swift::String v498 = NSLocalizedString(_:tableName:bundle:value:comment:)(v265, (Swift::String_optional)0, (NSBundle)v264, v266, v511);

            id v267 = [v263 mainBundle];
            v268._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
            v512._object = (void *)0xED00006567617373;
            v268._object = (void *)0x800000010001FAA0;
            v269._uint64_t countAndFlagsBits = 0;
            v269._object = (void *)0xE000000000000000;
            v512._uint64_t countAndFlagsBits = 0x656D207472656C41;
            Swift::String v270 = NSLocalizedString(_:tableName:bundle:value:comment:)(v268, (Swift::String_optional)0, (NSBundle)v267, v269, v512);
            uint64_t countAndFlagsBits = v270._countAndFlagsBits;
            object = v270._object;

            id v171 = [v263 mainBundle];
            goto LABEL_73;
          }
          *(void *)&long long v501 = 9;
          swift_errorRetain();
          char v248 = static _ErrorCodeProtocol.~= infix(_:_:)();
          swift_errorRelease();
          if (v248)
          {
            ((void (*)(char *, uint64_t, uint64_t))v498._object)(v472, v498._countAndFlagsBits, v23);
            uint64_t v249 = swift_allocObject();
            *(void *)(v249 + 16) = v61;
            swift_errorRetain();
            swift_errorRetain();
            uint64_t v250 = Logger.logObject.getter();
            os_log_type_t v251 = static os_log_type_t.error.getter();
            uint64_t v252 = swift_allocObject();
            *(unsigned char *)(v252 + 16) = 32;
            uint64_t v253 = swift_allocObject();
            *(unsigned char *)(v253 + 16) = 8;
            uint64_t v254 = swift_allocObject();
            *(void *)(v254 + 16) = sub_10001D7A4;
            *(void *)(v254 + 24) = v249;
            uint64_t v255 = swift_allocObject();
            *(void *)(v255 + 16) = sub_10001D718;
            *(void *)(v255 + 24) = v254;
            sub_10000ABA8(&qword_10002A080);
            uint64_t v256 = swift_allocObject();
            *(_OWORD *)(v256 + 16) = xmmword_10001EFE0;
            *(void *)(v256 + 32) = sub_10001D7A8;
            *(void *)(v256 + 40) = v252;
            *(void *)(v256 + 48) = sub_10001D7A8;
            *(void *)(v256 + 56) = v253;
            *(void *)(v256 + 64) = sub_10000BD48;
            *(void *)(v256 + 72) = v255;
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRelease();
            os_log_type_t v257 = v251;
            uint64_t countAndFlagsBits = v250;
            if (os_log_type_enabled(v250, v251))
            {
              v258 = (uint8_t *)swift_slowAlloc();
              uint64_t v259 = swift_slowAlloc();
              unint64_t v493 = v83;
              *(void *)&long long v501 = v259;
              *(_WORD *)v258 = 258;
              v258[2] = 32;
              swift_release();
              v258[3] = 8;
              swift_release();
              v504._uint64_t countAndFlagsBits = (uint64_t)v497;
              swift_errorRetain();
              sub_10000ABA8(&qword_10002A088);
              uint64_t v260 = String.init<A>(describing:)();
              v504._uint64_t countAndFlagsBits = sub_10001B150(v260, v261, (uint64_t *)&v501);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_release();
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();
              swift_errorRelease();
              v262 = countAndFlagsBits;
              _os_log_impl((void *)&_mh_execute_header, countAndFlagsBits, v257, "Test Verification Region Unavailable error: %s", v258, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              v493(v472, v495);
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_errorRelease();

              v83(v472, v495);
            }
            unint64_t v286 = self;
            id v287 = [v286 mainBundle];
            v288._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
            v513._object = (void *)0xEB00000000656C74;
            v288._object = (void *)0x800000010001FA50;
            v289._uint64_t countAndFlagsBits = 0;
            v289._object = (void *)0xE000000000000000;
            v513._uint64_t countAndFlagsBits = 0x6974207472656C41;
            Swift::String v498 = NSLocalizedString(_:tableName:bundle:value:comment:)(v288, (Swift::String_optional)0, (NSBundle)v287, v289, v513);

            id v290 = [v286 mainBundle];
            v291._uint64_t countAndFlagsBits = 0xD000000000000020;
            v514._object = (void *)0xED00006567617373;
            v291._object = (void *)0x800000010001FA70;
            v292._uint64_t countAndFlagsBits = 0;
            v292._object = (void *)0xE000000000000000;
            v514._uint64_t countAndFlagsBits = 0x656D207472656C41;
            Swift::String v293 = NSLocalizedString(_:tableName:bundle:value:comment:)(v291, (Swift::String_optional)0, (NSBundle)v290, v292, v514);
            uint64_t countAndFlagsBits = v293._countAndFlagsBits;
            object = v293._object;

            id v171 = [v286 mainBundle];
            goto LABEL_73;
          }
          *(void *)&long long v501 = 10;
          swift_errorRetain();
          char v271 = static _ErrorCodeProtocol.~= infix(_:_:)();
          swift_errorRelease();
          if (v271)
          {
            ((void (*)(char *, uint64_t, uint64_t))v498._object)(v471, v498._countAndFlagsBits, v23);
            uint64_t v272 = swift_allocObject();
            *(void *)(v272 + 16) = v61;
            swift_errorRetain();
            swift_errorRetain();
            uint64_t v273 = Logger.logObject.getter();
            os_log_type_t v274 = static os_log_type_t.error.getter();
            uint64_t v275 = swift_allocObject();
            *(unsigned char *)(v275 + 16) = 32;
            uint64_t v276 = swift_allocObject();
            *(unsigned char *)(v276 + 16) = 8;
            uint64_t v277 = swift_allocObject();
            *(void *)(v277 + 16) = sub_10001D7A4;
            *(void *)(v277 + 24) = v272;
            uint64_t v278 = swift_allocObject();
            *(void *)(v278 + 16) = sub_10001D718;
            *(void *)(v278 + 24) = v277;
            sub_10000ABA8(&qword_10002A080);
            uint64_t v279 = swift_allocObject();
            *(_OWORD *)(v279 + 16) = xmmword_10001EFE0;
            *(void *)(v279 + 32) = sub_10001D7A8;
            *(void *)(v279 + 40) = v275;
            *(void *)(v279 + 48) = sub_10001D7A8;
            *(void *)(v279 + 56) = v276;
            *(void *)(v279 + 64) = sub_10000BD48;
            *(void *)(v279 + 72) = v278;
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRelease();
            os_log_type_t v280 = v274;
            uint64_t countAndFlagsBits = v273;
            if (os_log_type_enabled(v273, v274))
            {
              uint64_t v281 = (uint8_t *)swift_slowAlloc();
              uint64_t v282 = swift_slowAlloc();
              unint64_t v493 = v83;
              *(void *)&long long v501 = v282;
              *(_WORD *)uint64_t v281 = 258;
              v281[2] = 32;
              swift_release();
              v281[3] = 8;
              swift_release();
              v504._uint64_t countAndFlagsBits = (uint64_t)v497;
              swift_errorRetain();
              sub_10000ABA8(&qword_10002A088);
              uint64_t v283 = String.init<A>(describing:)();
              v504._uint64_t countAndFlagsBits = sub_10001B150(v283, v284, (uint64_t *)&v501);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_release();
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();
              swift_errorRelease();
              v285 = countAndFlagsBits;
              _os_log_impl((void *)&_mh_execute_header, countAndFlagsBits, v280, "Test Verification Region Unsupported error: %s", v281, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              v493(v471, v495);
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_errorRelease();

              v83(v471, v495);
            }
            uint64_t v309 = self;
            id v310 = [v309 mainBundle];
            v311._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
            v515._object = (void *)0xEB00000000656C74;
            v311._object = (void *)0x800000010001FA00;
            v312._uint64_t countAndFlagsBits = 0;
            v312._object = (void *)0xE000000000000000;
            v515._uint64_t countAndFlagsBits = 0x6974207472656C41;
            Swift::String v498 = NSLocalizedString(_:tableName:bundle:value:comment:)(v311, (Swift::String_optional)0, (NSBundle)v310, v312, v515);

            id v313 = [v309 mainBundle];
            v314._uint64_t countAndFlagsBits = 0xD000000000000020;
            v516._object = (void *)0xED00006567617373;
            v314._object = (void *)0x800000010001FA20;
            v315._uint64_t countAndFlagsBits = 0;
            v315._object = (void *)0xE000000000000000;
            v516._uint64_t countAndFlagsBits = 0x656D207472656C41;
            Swift::String v316 = NSLocalizedString(_:tableName:bundle:value:comment:)(v314, (Swift::String_optional)0, (NSBundle)v313, v315, v516);
            uint64_t countAndFlagsBits = v316._countAndFlagsBits;
            object = v316._object;

            id v171 = [v309 mainBundle];
            goto LABEL_73;
          }
          *(void *)&long long v501 = 11;
          swift_errorRetain();
          char v294 = static _ErrorCodeProtocol.~= infix(_:_:)();
          swift_errorRelease();
          if (v294)
          {
            ((void (*)(char *, uint64_t, uint64_t))v498._object)(v470, v498._countAndFlagsBits, v23);
            uint64_t v295 = swift_allocObject();
            *(void *)(v295 + 16) = v61;
            swift_errorRetain();
            swift_errorRetain();
            os_log_type_t v296 = Logger.logObject.getter();
            os_log_type_t v297 = static os_log_type_t.error.getter();
            uint64_t v298 = swift_allocObject();
            *(unsigned char *)(v298 + 16) = 32;
            uint64_t v299 = swift_allocObject();
            *(unsigned char *)(v299 + 16) = 8;
            uint64_t v300 = swift_allocObject();
            *(void *)(v300 + 16) = sub_10001BCB8;
            *(void *)(v300 + 24) = v295;
            uint64_t v301 = swift_allocObject();
            *(void *)(v301 + 16) = sub_10001D718;
            *(void *)(v301 + 24) = v300;
            sub_10000ABA8(&qword_10002A080);
            uint64_t v302 = swift_allocObject();
            *(_OWORD *)(v302 + 16) = xmmword_10001EFE0;
            *(void *)(v302 + 32) = sub_10001D7A8;
            *(void *)(v302 + 40) = v298;
            *(void *)(v302 + 48) = sub_10001D7A8;
            *(void *)(v302 + 56) = v299;
            *(void *)(v302 + 64) = sub_10000BD48;
            *(void *)(v302 + 72) = v301;
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRelease();
            os_log_type_t v303 = v297;
            uint64_t countAndFlagsBits = v296;
            if (os_log_type_enabled(v296, v297))
            {
              Swift::String v304 = (uint8_t *)swift_slowAlloc();
              uint64_t v305 = swift_slowAlloc();
              unint64_t v493 = v83;
              *(void *)&long long v501 = v305;
              *(_WORD *)Swift::String v304 = 258;
              v304[2] = 32;
              swift_release();
              v304[3] = 8;
              swift_release();
              v504._uint64_t countAndFlagsBits = (uint64_t)v497;
              swift_errorRetain();
              sub_10000ABA8(&qword_10002A088);
              uint64_t v306 = String.init<A>(describing:)();
              v504._uint64_t countAndFlagsBits = sub_10001B150(v306, v307, (uint64_t *)&v501);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_release();
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();
              swift_errorRelease();
              char v308 = countAndFlagsBits;
              _os_log_impl((void *)&_mh_execute_header, countAndFlagsBits, v303, "Test Verification Network error: %s", v304, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              v493(v470, v495);
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_errorRelease();

              v83(v470, v495);
            }
            uint64_t v344 = self;
            id v345 = [v344 mainBundle];
            v346._uint64_t countAndFlagsBits = 0xD000000000000013;
            v518._object = (void *)0xEB00000000656C74;
            v346._object = (void *)0x800000010001F9E0;
            v347._uint64_t countAndFlagsBits = 0;
            v347._object = (void *)0xE000000000000000;
            v518._uint64_t countAndFlagsBits = 0x6974207472656C41;
            Swift::String v498 = NSLocalizedString(_:tableName:bundle:value:comment:)(v346, (Swift::String_optional)0, (NSBundle)v345, v347, v518);

            if ([self wapiCapability]) {
              uint64_t v348 = 1312902231;
            }
            else {
              uint64_t v348 = 1229343063;
            }
            *(void *)&long long v501 = 0;
            *((void *)&v501 + 1) = 0xE000000000000000;
            _StringGuts.grow(_:)(24);
            swift_bridgeObjectRelease();
            *(void *)&long long v501 = 0x5F4B524F5754454ELL;
            *((void *)&v501 + 1) = 0xE800000000000000;
            v349._uint64_t countAndFlagsBits = v348;
            v349._object = (void *)0xE400000000000000;
            String.append(_:)(v349);
            swift_bridgeObjectRelease();
            v350._uint64_t countAndFlagsBits = 0x4D5F524F5252455FLL;
            v350._object = (void *)0xEE00454741535345;
            String.append(_:)(v350);
            v352 = (void *)*((void *)&v501 + 1);
            uint64_t v351 = v501;
            id v353 = [v344 mainBundle];
            v519._object = (void *)0xED00006567617373;
            v354._uint64_t countAndFlagsBits = v351;
            v354._object = v352;
            v355._uint64_t countAndFlagsBits = 0;
            v355._object = (void *)0xE000000000000000;
            v519._uint64_t countAndFlagsBits = 0x656D207472656C41;
            Swift::String v356 = NSLocalizedString(_:tableName:bundle:value:comment:)(v354, (Swift::String_optional)0, (NSBundle)v353, v355, v519);
            uint64_t countAndFlagsBits = v356._countAndFlagsBits;
            object = v356._object;
            swift_bridgeObjectRelease();

            id v357 = [v344 mainBundle];
            v520._object = (void *)0xE600000000000000;
            v358._uint64_t countAndFlagsBits = 19279;
            v358._object = (void *)0xE200000000000000;
            v359._uint64_t countAndFlagsBits = 0;
            v359._object = (void *)0xE000000000000000;
            v520._uint64_t countAndFlagsBits = 0x6E6F74747542;
            Swift::String v360 = NSLocalizedString(_:tableName:bundle:value:comment:)(v358, (Swift::String_optional)0, (NSBundle)v357, v359, v520);
            *(void *)&long long v496 = v360._countAndFlagsBits;
            uint64_t v321 = v360._object;

            id v361 = [v344 mainBundle];
            v521._object = (void *)0xE600000000000000;
            v362._uint64_t countAndFlagsBits = 0x53474E4954544553;
            v362._object = (void *)0xE800000000000000;
            v363._uint64_t countAndFlagsBits = 0;
            v363._object = (void *)0xE000000000000000;
            v521._uint64_t countAndFlagsBits = 0x6E6F74747542;
            Swift::String v364 = NSLocalizedString(_:tableName:bundle:value:comment:)(v362, (Swift::String_optional)0, (NSBundle)v361, v363, v521);
            uint64_t v324 = v364._countAndFlagsBits;
            os_log_type_t v325 = v364._object;

            uint64_t v323 = swift_allocObject();
            char v326 = 0;
            *(void *)(v323 + 16) = v500;
            *(unsigned char *)(v323 + 24) = v494 & 1;
            uint64_t v322 = sub_10001BD04;
            goto LABEL_74;
          }
          type metadata accessor for Code(0);
          *(void *)&long long v501 = 5;
          swift_errorRetain();
          sub_10001B8E0(&qword_100029AD8, type metadata accessor for Code);
          char v329 = static _ErrorCodeProtocol.~= infix(_:_:)();
          swift_errorRelease();
          if ((v329 & 1) == 0)
          {
            *(void *)&long long v501 = 9;
            swift_errorRetain();
            char v365 = static _ErrorCodeProtocol.~= infix(_:_:)();
            swift_errorRelease();
            unint64_t v493 = v83;
            if (v365)
            {
              ((void (*)(char *, uint64_t, uint64_t))v498._object)(v468, v498._countAndFlagsBits, v23);
              uint64_t v366 = swift_allocObject();
              *(void *)(v366 + 16) = v61;
              swift_errorRetain();
              swift_errorRetain();
              uint64_t v367 = Logger.logObject.getter();
              os_log_type_t v368 = static os_log_type_t.error.getter();
              uint64_t v369 = swift_allocObject();
              *(unsigned char *)(v369 + 16) = 32;
              uint64_t v370 = swift_allocObject();
              *(unsigned char *)(v370 + 16) = 8;
              uint64_t v371 = swift_allocObject();
              *(void *)(v371 + 16) = sub_10001D7A4;
              *(void *)(v371 + 24) = v366;
              uint64_t v372 = swift_allocObject();
              *(void *)(v372 + 16) = sub_10001D718;
              *(void *)(v372 + 24) = v371;
              sub_10000ABA8(&qword_10002A080);
              uint64_t inited = swift_initStackObject();
              *(_OWORD *)(inited + 16) = xmmword_10001EFE0;
              *(void *)(inited + 32) = sub_10001D7A8;
              *(void *)(inited + 40) = v369;
              *(void *)(inited + 48) = sub_10001D7A8;
              *(void *)(inited + 56) = v370;
              *(void *)(inited + 64) = sub_10000BD48;
              *(void *)(inited + 72) = v372;
              swift_retain();
              swift_retain();
              swift_retain();
              swift_retain();
              swift_retain();
              swift_bridgeObjectRelease();
              os_log_type_t v374 = v368;
              uint64_t countAndFlagsBits = v367;
              if (os_log_type_enabled(v367, v368))
              {
                v375 = (uint8_t *)swift_slowAlloc();
                *(void *)&long long v501 = swift_slowAlloc();
                *(_WORD *)v375 = 258;
                v375[2] = 32;
                swift_release();
                v375[3] = 8;
                swift_release();
                v504._uint64_t countAndFlagsBits = (uint64_t)v497;
                swift_errorRetain();
                sub_10000ABA8(&qword_10002A088);
                uint64_t v376 = String.init<A>(describing:)();
                v504._uint64_t countAndFlagsBits = sub_10001B150(v376, v377, (uint64_t *)&v501);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_release();
                swift_release();
                swift_release();
                swift_bridgeObjectRelease();
                swift_errorRelease();
                v378 = countAndFlagsBits;
                _os_log_impl((void *)&_mh_execute_header, countAndFlagsBits, v374, "Test Verification Not Enabled error: %s", v375, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
              }
              else
              {
                swift_release();
                swift_release();
                swift_release();
                swift_release();
                swift_release();
                swift_errorRelease();
              }
              v493(v468, v495);
              unint64_t v411 = self;
              id v412 = [v411 mainBundle];
              v413._uint64_t countAndFlagsBits = 0xD000000000000011;
              v524._object = (void *)0xEB00000000656C74;
              v413._object = (void *)0x800000010001F920;
              v414._uint64_t countAndFlagsBits = 0;
              v414._object = (void *)0xE000000000000000;
              v524._uint64_t countAndFlagsBits = 0x6974207472656C41;
              Swift::String v498 = NSLocalizedString(_:tableName:bundle:value:comment:)(v413, (Swift::String_optional)0, (NSBundle)v412, v414, v524);

              id v415 = [v411 mainBundle];
              v416._uint64_t countAndFlagsBits = 0xD000000000000013;
              v525._object = (void *)0xED00006567617373;
              v416._object = (void *)0x800000010001F940;
              v417._uint64_t countAndFlagsBits = 0;
              v417._object = (void *)0xE000000000000000;
              v525._uint64_t countAndFlagsBits = 0x656D207472656C41;
              Swift::String v418 = NSLocalizedString(_:tableName:bundle:value:comment:)(v416, (Swift::String_optional)0, (NSBundle)v415, v417, v525);
              uint64_t countAndFlagsBits = v418._countAndFlagsBits;

              id v419 = [v411 mainBundle];
              v420._uint64_t countAndFlagsBits = 0xD000000000000020;
              v526._object = (void *)0xE600000000000000;
              v420._object = (void *)0x800000010001F960;
              v421._uint64_t countAndFlagsBits = 0;
              v421._object = (void *)0xE000000000000000;
              v526._uint64_t countAndFlagsBits = 0x6E6F74747542;
              Swift::String v422 = NSLocalizedString(_:tableName:bundle:value:comment:)(v420, (Swift::String_optional)0, (NSBundle)v419, v421, v526);
              *(void *)&long long v496 = v422._countAndFlagsBits;
              uint64_t v321 = v422._object;

              id v423 = [v411 mainBundle];
              v527._object = (void *)0xE600000000000000;
              v424._uint64_t countAndFlagsBits = 0x6C65636E6143;
              v424._object = (void *)0xE600000000000000;
              v425._uint64_t countAndFlagsBits = 0;
              v425._object = (void *)0xE000000000000000;
              v527._uint64_t countAndFlagsBits = 0x6E6F74747542;
              Swift::String v426 = NSLocalizedString(_:tableName:bundle:value:comment:)(v424, (Swift::String_optional)0, (NSBundle)v423, v425, v527);
              uint64_t v324 = v426._countAndFlagsBits;
              os_log_type_t v325 = v426._object;

              uint64_t v323 = swift_allocObject();
              id v427 = v489;
              v428 = v467;
              *(void *)(v323 + 16) = v489;
              *(void *)(v323 + 24) = v428;
              *(void *)(v323 + 32) = v500;
              *(unsigned char *)(v323 + 40) = v494 & 1;
              id v429 = v427;
              object = v418._object;
              id v430 = v428;
              char v326 = 0;
              uint64_t v322 = sub_10001BA1C;
              goto LABEL_74;
            }
            ((void (*)(char *, uint64_t, uint64_t))v498._object)(v469, v498._countAndFlagsBits, v23);
            uint64_t v390 = swift_allocObject();
            *(void *)(v390 + 16) = v61;
            swift_errorRetain();
            swift_errorRetain();
            v391 = Logger.logObject.getter();
            os_log_type_t v392 = static os_log_type_t.error.getter();
            uint64_t v393 = swift_allocObject();
            *(unsigned char *)(v393 + 16) = 32;
            uint64_t v394 = swift_allocObject();
            *(unsigned char *)(v394 + 16) = 8;
            uint64_t v395 = swift_allocObject();
            *(void *)(v395 + 16) = sub_10001D7A4;
            *(void *)(v395 + 24) = v390;
            uint64_t v396 = swift_allocObject();
            *(void *)(v396 + 16) = sub_10001B994;
            *(void *)(v396 + 24) = v395;
            sub_10000ABA8(&qword_10002A080);
            uint64_t v397 = swift_initStackObject();
            *(_OWORD *)(v397 + 16) = xmmword_10001EFE0;
            *(void *)(v397 + 32) = sub_10001B970;
            *(void *)(v397 + 40) = v393;
            *(void *)(v397 + 48) = sub_10001D7A8;
            *(void *)(v397 + 56) = v394;
            *(void *)(v397 + 64) = sub_10000AC24;
            *(void *)(v397 + 72) = v396;
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_bridgeObjectRelease();
            os_log_type_t v398 = v392;
            uint64_t countAndFlagsBits = v391;
            if (os_log_type_enabled(v391, v392))
            {
              v399 = (uint8_t *)swift_slowAlloc();
              *(void *)&long long v501 = swift_slowAlloc();
              *(_WORD *)v399 = 258;
              v399[2] = 32;
              swift_release();
              v399[3] = 8;
              swift_release();
              v504._uint64_t countAndFlagsBits = (uint64_t)v497;
              swift_errorRetain();
              sub_10000ABA8(&qword_10002A088);
              uint64_t v400 = String.init<A>(describing:)();
              v504._uint64_t countAndFlagsBits = sub_10001B150(v400, v401, (uint64_t *)&v501);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_release();
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();
              swift_errorRelease();
              uint64_t v402 = countAndFlagsBits;
              _os_log_impl((void *)&_mh_execute_header, countAndFlagsBits, v398, "Unhandled Test Verification error: %s", v399, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_errorRelease();
            }
            v493(v469, v495);
            v431 = self;
            id v432 = [v431 mainBundle];
            v528._object = (void *)0xEB00000000656C74;
            v433._object = (void *)0x800000010001F8C0;
            v433._uint64_t countAndFlagsBits = 0xD000000000000027;
            v434._uint64_t countAndFlagsBits = 0;
            v434._object = (void *)0xE000000000000000;
            v528._uint64_t countAndFlagsBits = 0x6974207472656C41;
            Swift::String v498 = NSLocalizedString(_:tableName:bundle:value:comment:)(v433, (Swift::String_optional)0, (NSBundle)v432, v434, v528);

            id v435 = [v431 mainBundle];
            v436._uint64_t countAndFlagsBits = 0xD000000000000029;
            v529._object = (void *)0xED00006567617373;
            v436._object = (void *)0x800000010001F8F0;
            v437._uint64_t countAndFlagsBits = 0;
            v437._object = (void *)0xE000000000000000;
            v529._uint64_t countAndFlagsBits = 0x656D207472656C41;
            Swift::String v438 = NSLocalizedString(_:tableName:bundle:value:comment:)(v436, (Swift::String_optional)0, (NSBundle)v435, v437, v529);
            uint64_t countAndFlagsBits = v438._countAndFlagsBits;
            object = v438._object;

            id v171 = [v431 mainBundle];
            goto LABEL_73;
          }
          ((void (*)(char *, uint64_t, uint64_t))v498._object)(v89, v498._countAndFlagsBits, v23);
          uint64_t v330 = swift_allocObject();
          *(void *)(v330 + 16) = v61;
          swift_errorRetain();
          swift_errorRetain();
          v331 = Logger.logObject.getter();
          os_log_type_t v332 = static os_log_type_t.error.getter();
          uint64_t v333 = swift_allocObject();
          *(unsigned char *)(v333 + 16) = 32;
          uint64_t v334 = swift_allocObject();
          *(unsigned char *)(v334 + 16) = 8;
          uint64_t v335 = swift_allocObject();
          *(void *)(v335 + 16) = sub_10001D7A4;
          *(void *)(v335 + 24) = v330;
          uint64_t v336 = swift_allocObject();
          *(void *)(v336 + 16) = sub_10001D718;
          *(void *)(v336 + 24) = v335;
          sub_10000ABA8(&qword_10002A080);
          uint64_t v337 = swift_initStackObject();
          *(_OWORD *)(v337 + 16) = xmmword_10001EFE0;
          *(void *)(v337 + 32) = sub_10001D7A8;
          *(void *)(v337 + 40) = v333;
          *(void *)(v337 + 48) = sub_10001D7A8;
          *(void *)(v337 + 56) = v334;
          *(void *)(v337 + 64) = sub_10000BD48;
          *(void *)(v337 + 72) = v336;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          os_log_type_t v338 = v332;
          uint64_t countAndFlagsBits = v331;
          if (os_log_type_enabled(v331, v332))
          {
            v339 = (uint8_t *)swift_slowAlloc();
            v340 = (void *)swift_slowAlloc();
            unint64_t v493 = v83;
            v498._object = v340;
            *(void *)&long long v501 = v340;
            *(_WORD *)v339 = 258;
            v339[2] = 32;
            swift_release();
            v339[3] = 8;
            swift_release();
            v504._uint64_t countAndFlagsBits = (uint64_t)v497;
            swift_errorRetain();
            sub_10000ABA8(&qword_10002A088);
            uint64_t v341 = String.init<A>(describing:)();
            v504._uint64_t countAndFlagsBits = sub_10001B150(v341, v342, (uint64_t *)&v501);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release();
            swift_release();
            swift_release();
            swift_bridgeObjectRelease();
            swift_errorRelease();
            unint64_t v343 = countAndFlagsBits;
            _os_log_impl((void *)&_mh_execute_header, countAndFlagsBits, v338, "Test Verification Unsupported error: %s", v339, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            v493(v490, v495);
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_errorRelease();

            v83(v490, v495);
          }
          uint64_t v379 = (void *)_convertErrorToNSError(_:)();
          id v380 = [v379 userInfo];

          uint64_t v381 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v382 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          if (*(void *)(v381 + 16) && (unint64_t v384 = sub_10001BB80(v382, v383), (v385 & 1) != 0))
          {
            sub_10001B884(*(void *)(v381 + 56) + 32 * v384, (uint64_t)&v501);
          }
          else
          {
            long long v501 = 0u;
            long long v502 = 0u;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (*((void *)&v502 + 1))
          {
            if (swift_dynamicCast())
            {
              uint64_t v387 = v504._countAndFlagsBits;
              v386 = v504._object;
              id v388 = objc_allocWithZone((Class)LSApplicationRecord);
              swift_bridgeObjectRetain();
              unint64_t v493 = (void (*)(char *, uint64_t))v387;
              uint64_t v495 = (uint64_t)v386;
              id v389 = sub_10001AF78(v387, (uint64_t)v386, 0);
              v439 = v389;
              if (v389)
              {
                id v440 = [v389 localizedName];
                uint64_t v441 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                uint64_t countAndFlagsBits = v442;

                uint64_t v443 = self;
                id v444 = [v443 mainBundle];
                v445._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
                v530._object = (void *)0xEB00000000656C74;
                v445._object = (void *)0x800000010001F990;
                v446._uint64_t countAndFlagsBits = 0;
                v446._object = (void *)0xE000000000000000;
                v530._uint64_t countAndFlagsBits = 0x6974207472656C41;
                NSLocalizedString(_:tableName:bundle:value:comment:)(v445, (Swift::String_optional)0, (NSBundle)v444, v446, v530);

                sub_10000ABA8(&qword_10002A098);
                uint64_t v447 = swift_allocObject();
                long long v496 = xmmword_10001F150;
                *(_OWORD *)(v447 + 16) = xmmword_10001F150;
                *(void *)(v447 + 56) = &type metadata for String;
                unint64_t v448 = sub_10001BBF8();
                *(void *)(v447 + 64) = v448;
                id v449 = countAndFlagsBits;
                *(void *)(v447 + 32) = v441;
                *(void *)(v447 + 40) = v449;
                swift_bridgeObjectRetain();
                v498._uint64_t countAndFlagsBits = String.init(format:_:)();
                v498._object = v450;
                swift_bridgeObjectRelease();
                id v451 = [v443 mainBundle];
                v452._uint64_t countAndFlagsBits = 0xD000000000000029;
                v531._object = (void *)0xED00006567617373;
                v452._object = (void *)0x800000010001F8F0;
                v453._uint64_t countAndFlagsBits = 0;
                v453._object = (void *)0xE000000000000000;
                v531._uint64_t countAndFlagsBits = 0x656D207472656C41;
                NSLocalizedString(_:tableName:bundle:value:comment:)(v452, (Swift::String_optional)0, (NSBundle)v451, v453, v531);

                uint64_t v454 = swift_allocObject();
                *(_OWORD *)(v454 + 16) = v496;
                *(void *)(v454 + 56) = &type metadata for String;
                *(void *)(v454 + 64) = v448;
                v455 = countAndFlagsBits;
                *(void *)(v454 + 32) = v441;
                *(void *)(v454 + 40) = v455;
                uint64_t countAndFlagsBits = String.init(format:_:)();
                object = v456;
                swift_bridgeObjectRelease();
                id v457 = [v443 mainBundle];
                v458._uint64_t countAndFlagsBits = 0xD000000000000026;
                v532._object = (void *)0xE600000000000000;
                v458._object = (void *)0x800000010001F9B0;
                v459._uint64_t countAndFlagsBits = 0;
                v459._object = (void *)0xE000000000000000;
                v532._uint64_t countAndFlagsBits = 0x6E6F74747542;
                Swift::String v460 = NSLocalizedString(_:tableName:bundle:value:comment:)(v458, (Swift::String_optional)0, (NSBundle)v457, v459, v532);
                *(void *)&long long v496 = v460._countAndFlagsBits;
                uint64_t v321 = v460._object;

                id v461 = [v443 mainBundle];
                v533._object = (void *)0xE600000000000000;
                v462._uint64_t countAndFlagsBits = 0x6C65636E6143;
                v462._object = (void *)0xE600000000000000;
                v463._uint64_t countAndFlagsBits = 0;
                v463._object = (void *)0xE000000000000000;
                v533._uint64_t countAndFlagsBits = 0x6E6F74747542;
                Swift::String v464 = NSLocalizedString(_:tableName:bundle:value:comment:)(v462, (Swift::String_optional)0, (NSBundle)v461, v463, v533);
                uint64_t v324 = v464._countAndFlagsBits;
                os_log_type_t v325 = v464._object;

                uint64_t v323 = swift_allocObject();
                char v326 = 0;
                uint64_t v465 = v495;
                *(void *)(v323 + 16) = v493;
                *(void *)(v323 + 24) = v465;
                *(void *)(v323 + 32) = v500;
                *(unsigned char *)(v323 + 40) = v494 & 1;
                uint64_t v322 = sub_10001BC84;
                goto LABEL_74;
              }
              swift_bridgeObjectRelease();
            }
          }
          else
          {
            sub_10000AE00((uint64_t)&v501, &qword_10002A090);
          }
        }
      }
    }
    uint64_t v403 = self;
    id v404 = [v403 mainBundle];
    v522._object = (void *)0xEB00000000656C74;
    v405._object = (void *)0x800000010001F8C0;
    v405._uint64_t countAndFlagsBits = 0xD000000000000027;
    v406._uint64_t countAndFlagsBits = 0;
    v406._object = (void *)0xE000000000000000;
    v522._uint64_t countAndFlagsBits = 0x6974207472656C41;
    Swift::String v498 = NSLocalizedString(_:tableName:bundle:value:comment:)(v405, (Swift::String_optional)0, (NSBundle)v404, v406, v522);

    id v407 = [v403 mainBundle];
    v408._uint64_t countAndFlagsBits = 0xD000000000000029;
    v523._object = (void *)0xED00006567617373;
    v408._object = (void *)0x800000010001F8F0;
    v409._uint64_t countAndFlagsBits = 0;
    v409._object = (void *)0xE000000000000000;
    v523._uint64_t countAndFlagsBits = 0x656D207472656C41;
    Swift::String v410 = NSLocalizedString(_:tableName:bundle:value:comment:)(v408, (Swift::String_optional)0, (NSBundle)v407, v409, v523);
    uint64_t countAndFlagsBits = v410._countAndFlagsBits;
    object = v410._object;

    id v171 = [v403 mainBundle];
LABEL_73:
    id v317 = v171;
    v517._object = (void *)0xE600000000000000;
    v318._uint64_t countAndFlagsBits = 19279;
    v318._object = (void *)0xE200000000000000;
    v319._uint64_t countAndFlagsBits = 0;
    v319._object = (void *)0xE000000000000000;
    v517._uint64_t countAndFlagsBits = 0x6E6F74747542;
    Swift::String v320 = NSLocalizedString(_:tableName:bundle:value:comment:)(v318, (Swift::String_optional)0, (NSBundle)v317, v319, v517);
    *(void *)&long long v496 = v320._countAndFlagsBits;
    uint64_t v321 = v320._object;

    uint64_t v322 = 0;
    uint64_t v323 = 0;
    uint64_t v324 = 0;
    os_log_type_t v325 = 0;
    char v326 = 1;
LABEL_74:
    if (qword_100029968 != -1) {
      swift_once();
    }
    swift_retain();
    sub_10000C264(v498._countAndFlagsBits, (uint64_t)v498._object, (uint64_t)countAndFlagsBits, (uint64_t)object, v496, (uint64_t)v321, v324, (uint64_t)v325, (uint64_t)v322, v323);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v326)
    {
      if ((v494 & 1) == 0)
      {
        uint64_t v327 = v500;
        if (UIBackgroundTaskInvalid != v500)
        {
          id v328 = [self sharedApplication];
          [v328 endBackgroundTask:v327];
        }
      }
    }
    else
    {
      sub_10000CE24((uint64_t)v322);
    }
    return swift_errorRelease();
  }
  Swift::String v70 = countAndFlagsBits;
  ((void (*)(char *, uint64_t *, uint64_t))countAndFlagsBits[4].isa)(v20, v59, v16);
  uint64_t v71 = Logger.testVerification.unsafeMutableAddressor();
  Swift::String v72 = v24;
  Swift::Bool v73 = (void (*)(void))v24[2].isa;
  uint64_t v490 = (char *)v71;
  uint64_t v491 = v24 + 2;
  unint64_t v485 = (void (*)(void, void, void))v73;
  v73(v498._countAndFlagsBits);
  ((void (*)(void *, char *, uint64_t))v70[2].isa)(v498._object, v20, v16);
  id v74 = Logger.logObject.getter();
  os_log_type_t v75 = static os_log_type_t.info.getter();
  BOOL v76 = os_log_type_enabled(v74, v75);
  uint64_t v77 = v70;
  uint64_t v497 = v20;
  uint64_t v482 = v16;
  if (v76)
  {
    uint64_t v78 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v501 = swift_slowAlloc();
    *(_DWORD *)uint64_t v78 = 136315138;
    uint64_t v79 = v498._object;
    uint64_t v80 = UUID.uuidString.getter();
    v504._uint64_t countAndFlagsBits = sub_10001B150(v80, v81, (uint64_t *)&v501);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v498._object = v77[1].isa;
    ((void (*)(void *, uint64_t))v498._object)(v79, v482);
    _os_log_impl((void *)&_mh_execute_header, v74, v75, "Test Verification Session Identifier: %s", v78, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v23 = v495;
    uint64_t v82 = *(void (**)(uint64_t, uint64_t))(v496 + 8);
    v82(v498._countAndFlagsBits, v495);
  }
  else
  {
    uint64_t v91 = v498._object;
    v498._object = v70[1].isa;
    ((void (*)(void *, uint64_t))v498._object)(v91, v16);

    uint64_t v82 = (void (*)(uint64_t, uint64_t))v72[1].isa;
    v82(v498._countAndFlagsBits, v23);
  }
  *(void *)&long long v501 = 0;
  *((void *)&v501 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(76);
  v92._uint64_t countAndFlagsBits = 0xD00000000000004ALL;
  v92._object = (void *)0x800000010001F870;
  String.append(_:)(v92);
  v93._uint64_t countAndFlagsBits = UUID.uuidString.getter();
  String.append(_:)(v93);
  swift_bridgeObjectRelease();
  uint64_t v94 = v492;
  uint64_t v95 = (uint64_t)v493;
  if (v489)
  {
    id v96 = v489;
    id v97 = [v96 subdivisionCode];
    if (!v97) {
      id v97 = [v96 countryCode];
    }
    uint64_t v98 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v100 = v99;

    strcpy((char *)&v504, "&region=");
    BYTE1(v504._object) = 0;
    WORD1(v504._object) = 0;
    HIDWORD(v504._object) = -402653184;
    v101._uint64_t countAndFlagsBits = v98;
    v101._object = v100;
    String.append(_:)(v101);
    swift_bridgeObjectRelease();
    String.append(_:)(v504);

    swift_bridgeObjectRelease();
  }
  strcpy((char *)&v504, "&reportType=");
  BYTE5(v504._object) = 0;
  HIWORD(v504._object) = -5120;
  LODWORD(v503) = v486;
  v102._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v102);
  swift_bridgeObjectRelease();
  String.append(_:)(v504);
  swift_bridgeObjectRelease();
  URL.init(string:)();
  swift_bridgeObjectRelease();
  v485(v94, v490, v23);
  uint64_t v103 = v487;
  sub_10001C0EC(v95, v487, (uint64_t *)&unk_10002A050);
  v104 = Logger.logObject.getter();
  os_log_type_t v105 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v104, v105))
  {
    uint64_t v106 = (uint8_t *)swift_slowAlloc();
    uint64_t v107 = swift_slowAlloc();
    v498._uint64_t countAndFlagsBits = (uint64_t)v82;
    v504._uint64_t countAndFlagsBits = v107;
    *(_DWORD *)uint64_t v106 = 136315138;
    sub_10001C0EC(v103, v480, (uint64_t *)&unk_10002A050);
    uint64_t v108 = String.init<A>(describing:)();
    uint64_t v503 = sub_10001B150(v108, v109, &v504._countAndFlagsBits);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v95 = (uint64_t)v493;
    swift_bridgeObjectRelease();
    sub_10000AE00(v103, (uint64_t *)&unk_10002A050);
    _os_log_impl((void *)&_mh_execute_header, v104, v105, "Opening Settings to %s", v106, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    ((void (*)(char *, uint64_t))v498._countAndFlagsBits)(v492, v495);
  }
  else
  {
    sub_10000AE00(v103, (uint64_t *)&unk_10002A050);

    v82((uint64_t)v94, v23);
  }
  id v117 = [self defaultWorkspace];
  uint64_t v118 = v500;
  uint64_t v119 = v488;
  if (v117)
  {
    uint64_t v120 = v117;
    sub_10001C0EC(v95, v488, (uint64_t *)&unk_10002A050);
    uint64_t v121 = type metadata accessor for URL();
    uint64_t v122 = *(void *)(v121 - 8);
    os_log_t v124 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v122 + 48))(v119, 1, v121) != 1)
    {
      URL._bridgeToObjectiveC()(v123);
      os_log_t v124 = v125;
      (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v119, v121);
    }
    sub_10000ABA8(&qword_10002A060);
    uint64_t v126 = swift_initStackObject();
    *(_OWORD *)(v126 + 16) = xmmword_10001F040;
    *(void *)(v126 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v126 + 40) = v127;
    *(void *)(v126 + 72) = &type metadata for Bool;
    *(unsigned char *)(v126 + 48) = 1;
    *(void *)(v126 + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v126 + 88) = v128;
    *(void *)(v126 + 120) = &type metadata for Bool;
    *(unsigned char *)(v126 + 96) = 1;
    sub_100010404(v126);
    Class v129 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v120 openSensitiveURL:v124 withOptions:v129];
  }
  if ((v494 & 1) == 0 && UIBackgroundTaskInvalid != v118)
  {
    id v130 = [self sharedApplication];
    [v130 endBackgroundTask:v118];
  }
  sub_10000AE00(v95, (uint64_t *)&unk_10002A050);
  return ((uint64_t (*)(char *, uint64_t))v498._object)(v497, v482);
}

void sub_100019F78(char a1, uint64_t a2, char a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v25 - v11;
  uint64_t v13 = Logger.testVerification.unsafeMutableAddressor();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  if (a1)
  {
    v14(v10, v13, v6);
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "User chose Settings", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    id v21 = [self defaultWorkspace];
    if (v21)
    {
      uint64_t v22 = v21;
      NSString v23 = String._bridgeToObjectiveC()();
      [v22 openApplicationWithBundleID:v23];
    }
  }
  else
  {
    v14(v12, v13, v6);
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "User chose OK", v17, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
  if ((a3 & 1) == 0 && UIBackgroundTaskInvalid != a2)
  {
    id v24 = [self sharedApplication];
    [v24 endBackgroundTask:a2];
  }
}

void sub_10001A254(char a1, uint64_t a2, unint64_t a3, uint64_t a4, int a5)
{
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = &v31[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v12);
  os_log_type_t v16 = &v31[-v15];
  uint64_t v17 = Logger.testVerification.unsafeMutableAddressor();
  uint64_t v18 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16);
  if (a1)
  {
    v18(v14, v17, v10);
    id v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "User chose Cancel", v26, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v14, v10);
  }
  else
  {
    uint64_t v34 = a2;
    v18(v16, v17, v10);
    swift_bridgeObjectRetain_n();
    os_log_type_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v33 = a4;
      uint64_t v22 = (uint8_t *)v21;
      uint64_t v23 = swift_slowAlloc();
      int v32 = a5;
      uint64_t v36 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_10001B150(v34, a3, &v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "User chose Open App, launching: %s", v22, 0xCu);
      swift_arrayDestroy();
      LOBYTE(a5) = v32;
      swift_slowDealloc();
      a4 = v33;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v16, v10);
    id v27 = [self defaultWorkspace];
    if (v27)
    {
      uint64_t v28 = v27;
      NSString v29 = String._bridgeToObjectiveC()();
      [v28 openApplicationWithBundleID:v29];
    }
  }
  if ((a5 & 1) == 0 && UIBackgroundTaskInvalid != a4)
  {
    id v30 = [self sharedApplication];
    [v30 endBackgroundTask:a4];
  }
}

void sub_10001A5F8(int a1, void *a2, uint64_t a3, uint64_t a4, int a5)
{
  int v72 = a5;
  uint64_t v73 = a4;
  id v71 = a2;
  LODWORD(v75) = a1;
  uint64_t v5 = sub_10000ABA8((uint64_t *)&unk_10002A050);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)v65 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)v65 - v13;
  __chkstk_darwin(v12);
  os_log_type_t v16 = (char *)v65 - v15;
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v19);
  id v24 = (char *)v65 - v23;
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)v65 - v25;
  uint64_t v27 = Logger.testVerification.unsafeMutableAddressor();
  id v74 = (void (**)(char *, uint64_t))v18;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  if (v75)
  {
    v28(v21, v27, v17);
    uint64_t v47 = Logger.logObject.getter();
    os_log_type_t v48 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v49 = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "User chose Cancel", v49, 2u);
      swift_slowDealloc();
    }

    v74[1](v21, v17);
    uint64_t v50 = v73;
    if ((v72 & 1) == 0) {
      goto LABEL_18;
    }
  }
  else
  {
    v65[0] = (uint64_t)v11;
    v65[1] = v5;
    os_log_type_t v66 = v14;
    Swift::String v70 = v24;
    uint64_t v67 = v8;
    uint64_t v68 = v27;
    unint64_t v69 = v28;
    ((void (*)(char *))v28)(v26);
    NSString v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.info.getter();
    BOOL v31 = os_log_type_enabled(v29, v30);
    os_log_type_t v75 = v16;
    if (v31)
    {
      int v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "User chose Set Up", v32, 2u);
      os_log_type_t v16 = v75;
      swift_slowDealloc();
    }

    uint64_t v33 = (void (**)(char *, uint64_t))v74[1];
    ((void (*)(char *, uint64_t))v33)(v26, v17);
    unint64_t v78 = 0xD000000000000039;
    unint64_t v79 = 0x800000010001FBA0;
    id v74 = v33;
    if (v71)
    {
      id v34 = [v71 regionCode];
      uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v37 = v36;

      v76._uint64_t countAndFlagsBits = 47;
      v76._object = (void *)0xE100000000000000;
      v38._uint64_t countAndFlagsBits = v35;
      v38._object = v37;
      String.append(_:)(v38);
      os_log_type_t v16 = v75;
      swift_bridgeObjectRelease();
      String.append(_:)(v76);
      swift_bridgeObjectRelease();
    }
    uint64_t v39 = v70;
    uint64_t v40 = (uint64_t)v66;
    URL.init(string:)();
    swift_bridgeObjectRelease();
    v69(v39, v68, v17);
    sub_10001C0EC((uint64_t)v16, v40, (uint64_t *)&unk_10002A050);
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      v76._uint64_t countAndFlagsBits = swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 136315138;
      sub_10001C0EC(v40, v65[0], (uint64_t *)&unk_10002A050);
      uint64_t v44 = String.init<A>(describing:)();
      uint64_t v77 = sub_10001B150(v44, v45, &v76._countAndFlagsBits);
      os_log_type_t v16 = v75;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_10000AE00(v40, (uint64_t *)&unk_10002A050);
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Opening Settings to %s", v43, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v46 = v70;
    }
    else
    {
      sub_10000AE00(v40, (uint64_t *)&unk_10002A050);

      uint64_t v46 = v39;
    }
    ((void (*)(char *, uint64_t))v74)(v46, v17);
    uint64_t v50 = v73;
    char v51 = v72;
    uint64_t v52 = (uint64_t)v67;
    id v53 = [self defaultWorkspace];
    if (v53)
    {
      uint64_t v54 = v53;
      sub_10001C0EC((uint64_t)v16, v52, (uint64_t *)&unk_10002A050);
      uint64_t v55 = type metadata accessor for URL();
      uint64_t v56 = *(void *)(v55 - 8);
      uint64_t v58 = 0;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v52, 1, v55) != 1)
      {
        URL._bridgeToObjectiveC()(v57);
        uint64_t v58 = v59;
        (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v52, v55);
      }
      sub_10000ABA8(&qword_10002A060);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10001F040;
      *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(void *)(inited + 40) = v61;
      *(void *)(inited + 72) = &type metadata for Bool;
      *(unsigned char *)(inited + 48) = 1;
      *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(void *)(inited + 88) = v62;
      *(void *)(inited + 120) = &type metadata for Bool;
      *(unsigned char *)(inited + 96) = 1;
      sub_100010404(inited);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v54 openSensitiveURL:v58 withOptions:isa];

      os_log_type_t v16 = v75;
    }
    sub_10000AE00((uint64_t)v16, (uint64_t *)&unk_10002A050);
    if ((v51 & 1) == 0)
    {
LABEL_18:
      if (UIBackgroundTaskInvalid != v50)
      {
        id v64 = [self sharedApplication];
        [v64 endBackgroundTask:v50];
      }
    }
  }
}

uint64_t sub_10001AE08()
{
  return String.init<A>(describing:)();
}

id sub_10001AE90()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

void sub_10001AEF8()
{
  sub_100014BAC(v0);
}

uint64_t sub_10001AF00(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001AF10()
{
  return swift_release();
}

uint64_t sub_10001AF18()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 68, 7);
}

uint64_t sub_10001AF60(uint64_t a1)
{
  return sub_100014DFC(a1, *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void **)(v1 + 48), *(void **)(v1 + 56), *(_DWORD *)(v1 + 64));
}

id sub_10001AF78(uint64_t a1, uint64_t a2, char a3)
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

uint64_t sub_10001B054(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10001B064(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10001B0A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = 2 * a2;
  return result;
}

uint64_t sub_10001B0B0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001B0D8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10001B150(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10001B150(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001B224(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001B884((uint64_t)v12, *a3);
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
      sub_10001B884((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001B834((uint64_t)v12);
  return v7;
}

uint64_t sub_10001B224(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10001B3E0(a5, a6);
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

uint64_t sub_10001B3E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001B478(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001B6D4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001B6D4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001B478(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001B5F0(v2, 0);
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

void *sub_10001B5F0(uint64_t a1, uint64_t a2)
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
  sub_10000ABA8(&qword_10002A048);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001B658(unsigned __int16 a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_10001B6D4(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000ABA8(&qword_10002A048);
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

unsigned char **sub_10001B824(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10001B834(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001B884(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001B8E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001B928()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001B960()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char **sub_10001B970(unsigned char **result)
{
  uint64_t v2 = *result;
  unsigned char *v2 = *(unsigned char *)(v1 + 16);
  *uint64_t result = v2 + 1;
  return result;
}

uint64_t sub_10001B984()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001B994()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10001B9BC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001B9CC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001B9DC()
{
  return _swift_deallocObject(v0, 41, 7);
}

uint64_t sub_10001BA1C(char a1)
{
  return sub_10001BC9C(a1, (uint64_t (*)(void, void, void, void, void))sub_10001A5F8);
}

uint64_t sub_10001BA34()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BA44()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_10001BA54(uint64_t a1)
{
  uint64_t v2 = static Hasher._hash(seed:_:)();

  return sub_10001BE4C(a1, v2);
}

unint64_t sub_10001BA98(void *a1)
{
  Hasher.init(_seed:)();
  if (a1)
  {
    Hasher._combine(_:)(1u);
    type metadata accessor for CFString(0);
    sub_10001B8E0(&qword_100029E90, type metadata accessor for CFString);
    id v2 = a1;
    _CFObject.hash(into:)();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Swift::Int v3 = Hasher._finalize()();

  return sub_10001BEE8((uint64_t)a1, v3);
}

unint64_t sub_10001BB80(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10001C008(a1, a2, v4);
}

unint64_t sub_10001BBF8()
{
  unint64_t result = qword_10002A0A0;
  if (!qword_10002A0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002A0A0);
  }
  return result;
}

uint64_t sub_10001BC4C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 41, 7);
}

uint64_t sub_10001BC84(char a1)
{
  return sub_10001BC9C(a1, (uint64_t (*)(void, void, void, void, void))sub_10001A254);
}

uint64_t sub_10001BC9C(char a1, uint64_t (*a2)(void, void, void, void, void))
{
  return a2(a1 & 1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(unsigned __int8 *)(v2 + 40));
}

uint64_t sub_10001BCB8()
{
  return sub_10001AE08();
}

uint64_t sub_10001BCD4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BCE4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BCF4()
{
  return _swift_deallocObject(v0, 25, 7);
}

void sub_10001BD04(char a1)
{
  sub_100019F78(a1 & 1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t sub_10001BD14()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BD24()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BD34()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001BD6C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BD7C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BD8C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BD9C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BDAC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BDBC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BDCC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BDDC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BDEC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BDFC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BE0C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BE1C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BE2C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001BE3C()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_10001BE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_10001BEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = v2;
    uint64_t v8 = ~v4;
    do
    {
      int64_t v9 = *(void **)(*(void *)(v6 + 48) + 8 * v5);
      if (v9)
      {
        if (a1)
        {
          type metadata accessor for CFString(0);
          sub_10001B8E0(&qword_100029E90, type metadata accessor for CFString);
          id v10 = v9;
          char v11 = static _CFObject.== infix(_:_:)();

          if (v11) {
            return v5;
          }
        }
      }
      else if (!a1)
      {
        return v5;
      }
      unint64_t v5 = (v5 + 1) & v8;
    }
    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_10001C008(uint64_t a1, uint64_t a2, uint64_t a3)
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
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10001C0EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000ABA8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_10001C150(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001C160()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001C198()
{
}

uint64_t sub_10001C1A0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001C1D8(char a1)
{
  return sub_1000138C0(a1 & 1);
}

uint64_t sub_10001C1E4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001C224(uint64_t a1, uint64_t a2)
{
  return sub_100012B38(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32));
}

void sub_10001C230(uint64_t a1, int a2, char a3, uint64_t a4, unint64_t *a5)
{
  unint64_t v7 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      sub_10001D5A8(0, a5);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  __CocoaSet.Index.element.getter();
  sub_10001D5A8(0, a5);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  a5 = v17;
  swift_unknownObjectRelease();
  Swift::Int v8 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v7 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
  char v11 = static NSObject.== infix(_:_:)();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v7 = (v7 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_23;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
      char v14 = static NSObject.== infix(_:_:)();
    }
    while ((v14 & 1) == 0);
  }

LABEL_17:
  uint64_t v15 = *(void **)(*(void *)(a4 + 48) + 8 * v7);

  id v16 = v15;
}

uint64_t sub_10001C4A0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

unint64_t sub_10001C528(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_10000ABA8(&qword_100029E88);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v4 = *(void *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 40);
  unint64_t result = sub_10001BA54(v4);
  if (v6)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  unint64_t v7 = (_OWORD *)(a1 + 64);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v4;
    *(_OWORD *)(v3[7] + 16 * result) = v13;
    uint64_t v8 = v3[2];
    BOOL v9 = __OFADD__(v8, 1);
    uint64_t v10 = v8 + 1;
    if (v9) {
      break;
    }
    v3[2] = v10;
    if (!--v1) {
      goto LABEL_8;
    }
    char v11 = (_OWORD *)((char *)v7 + 24);
    uint64_t v4 = *((void *)v7 - 1);
    long long v13 = *v7;
    swift_retain();
    unint64_t result = sub_10001BA54(v4);
    unint64_t v7 = v11;
    if (v12) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10001C630(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_10000ABA8((uint64_t *)&unk_10002A050);
  __chkstk_darwin(v3 - 8);
  char v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  __chkstk_darwin(v9);
  char v11 = (char *)&v28 - v10;
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    NSString v29 = v11;
    os_log_type_t v30 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    id v13 = [a2 userActivities];
    sub_10001D5A8(0, &qword_10002A0E8);
    sub_10001D544((unint64_t *)&unk_10002A0F0, &qword_10002A0E8);
    uint64_t v14 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v15 = (void *)sub_1000101C8(v14, &qword_10002A0E8);
    swift_bridgeObjectRelease();
    if (v15)
    {
      sub_10001079C(v15);
    }
    id v16 = [a2 URLContexts];
    sub_10001D5A8(0, &qword_10002A0D8);
    sub_10001D544(&qword_10002A0E0, &qword_10002A0D8);
    uint64_t v17 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v18 = (void *)sub_1000101C8(v17, &qword_10002A0D8);
    swift_bridgeObjectRelease();
    if (v18)
    {
      id v19 = [v18 URL];

      uint64_t v20 = v30;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v21(v5, v20, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
      {
        uint64_t v22 = v29;
        v21(v29, v5, v6);
        type metadata accessor for ENUIPublicHealthAgencyModel();
        (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v20, v22, v6);
        uint64_t v23 = v20;
        unint64_t v24 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
        uint64_t v25 = swift_allocObject();
        uint64_t v26 = v31;
        *(void *)(v25 + 16) = v31;
        v21((char *)(v25 + v24), v23, v6);
        id v27 = v26;
        static ENUIPublicHealthAgencyModel.refreshRegions(completion:)();
        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v22, v6);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    }
    return sub_10000AE00((uint64_t)v5, (uint64_t *)&unk_10002A050);
  }
  return result;
}

uint64_t sub_10001CA4C()
{
  uint64_t v1 = sub_10000ABA8((uint64_t *)&unk_10002A050);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = swift_bridgeObjectRetain();
  char v12 = (void *)sub_1000101C8(v11, &qword_10002A0D8);
  swift_bridgeObjectRelease();
  if (v12)
  {
    id v13 = [v12 URL];

    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v14(v3, v8, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
    {
      v14(v10, v3, v4);
      type metadata accessor for ENUIPublicHealthAgencyModel();
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
      unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v0;
      v14((char *)(v16 + v15), v8, v4);
      id v17 = v0;
      static ENUIPublicHealthAgencyModel.refreshRegions(completion:)();
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  }
  return sub_10000AE00((uint64_t)v3, (uint64_t *)&unk_10002A050);
}

uint64_t sub_10001CD34(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_10000ABA8((uint64_t *)&unk_10002A050);
  uint64_t v8 = __chkstk_darwin(v41);
  os_log_type_t v42 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  char v12 = (char *)&v39 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  unint64_t v15 = (char *)&v39 - v14;
  __chkstk_darwin(v13);
  id v17 = (char *)&v39 - v16;
  unint64_t v45 = 0xD000000000000039;
  unint64_t v46 = 0x800000010001FBA0;
  if (a2)
  {
    v43._uint64_t countAndFlagsBits = 47;
    v43._object = (void *)0xE100000000000000;
    v18._uint64_t countAndFlagsBits = a1;
    v18._object = a2;
    String.append(_:)(v18);
    String.append(_:)(v43);
    swift_bridgeObjectRelease();
  }
  URL.init(string:)();
  swift_bridgeObjectRelease();
  uint64_t v19 = Logger.launcher.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v19, v4);
  sub_10001C0EC((uint64_t)v17, (uint64_t)v15, (uint64_t *)&unk_10002A050);
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v39 = v4;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v40 = v17;
    uint64_t v23 = (uint8_t *)v22;
    v43._uint64_t countAndFlagsBits = swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 136315138;
    sub_10001C0EC((uint64_t)v15, (uint64_t)v12, (uint64_t *)&unk_10002A050);
    uint64_t v24 = String.init<A>(describing:)();
    uint64_t v44 = sub_10001B150(v24, v25, &v43._countAndFlagsBits);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10000AE00((uint64_t)v15, (uint64_t *)&unk_10002A050);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Opening Settings to %s", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    id v17 = v40;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v39);
  }
  else
  {
    sub_10000AE00((uint64_t)v15, (uint64_t *)&unk_10002A050);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v26 = (uint64_t)v42;
  id v27 = [self defaultWorkspace];
  if (v27)
  {
    uint64_t v28 = v27;
    sub_10001C0EC((uint64_t)v17, v26, (uint64_t *)&unk_10002A050);
    uint64_t v29 = type metadata accessor for URL();
    uint64_t v30 = *(void *)(v29 - 8);
    int v32 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v26, 1, v29) != 1)
    {
      URL._bridgeToObjectiveC()(v31);
      int v32 = v33;
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v26, v29);
    }
    sub_10000ABA8(&qword_10002A060);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10001F040;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v35;
    *(void *)(inited + 72) = &type metadata for Bool;
    *(unsigned char *)(inited + 48) = 1;
    *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 88) = v36;
    *(void *)(inited + 120) = &type metadata for Bool;
    *(unsigned char *)(inited + 96) = 1;
    sub_100010404(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v28 openSensitiveURL:v32 withOptions:isa];
  }
  return sub_10000AE00((uint64_t)v17, (uint64_t *)&unk_10002A050);
}

uint64_t sub_10001D278()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10001D2C0(void *a1)
{
  sub_100012E6C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void **)(v1 + 48));
}

void sub_10001D2D0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0) {
    sub_10001D2E0(a1, a2, a3, a4, SBYTE4(a4));
  }
}

void sub_10001D2E0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  if (a5 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!a5)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10001D344(uint64_t result, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0) {
    return sub_10001D354(result, a2, a3, a4, SBYTE4(a4));
  }
  return result;
}

uint64_t sub_10001D354(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  if (a5)
  {
    if (a5 != 1) {
      return result;
    }
    id v5 = a3;
  }

  return swift_bridgeObjectRetain();
}

const char *sub_10001D3A8(unsigned int a1)
{
  if (a1 > 5) {
    return "?";
  }
  else {
    return (&off_100026630)[a1];
  }
}

uint64_t sub_10001D3CC()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

void sub_10001D4B4()
{
  uint64_t v1 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(NSObject **)(v0 + 16);
  uint64_t v4 = *(char **)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_100010BEC(v3, (v0 + v2), v4);
}

uint64_t sub_10001D544(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001D5A8(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001D59C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001D5A8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10001D5E8()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_10001D6B4()
{
  uint64_t v1 = *(void *)(type metadata accessor for URL() - 8);
  sub_10001168C((v0
                           + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))));
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static CocoaError.userCancelled.getter()
{
  return static CocoaError.userCancelled.getter();
}

uint64_t type metadata accessor for CocoaError.Code()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t URLQueryItem.name.getter()
{
  return URLQueryItem.name.getter();
}

uint64_t URLQueryItem.value.getter()
{
  return URLQueryItem.value.getter();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.host.getter()
{
  return URLComponents.host.getter();
}

uint64_t URLComponents.scheme.getter()
{
  return URLComponents.scheme.getter();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t static _ErrorCodeProtocol.~= infix(_:_:)()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.pathComponents.getter()
{
  return URL.pathComponents.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.scheme.getter()
{
  return URL.scheme.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t _CFObject.hash(into:)()
{
  return _CFObject.hash(into:)();
}

uint64_t _CFObject.hashValue.getter()
{
  return _CFObject.hashValue.getter();
}

uint64_t static ENUIPublicHealthAgencyModel.refreshRegions(completion:)()
{
  return static ENUIPublicHealthAgencyModel.refreshRegions(completion:)();
}

uint64_t ENUIPublicHealthAgencyModel.availableRegions.unsafeMutableAddressor()
{
  return ENUIPublicHealthAgencyModel.availableRegions.unsafeMutableAddressor();
}

uint64_t type metadata accessor for ENUIPublicHealthAgencyModel()
{
  return type metadata accessor for ENUIPublicHealthAgencyModel();
}

uint64_t ENManagerAdapter.defaultAdapter.unsafeMutableAddressor()
{
  return ENManagerAdapter.defaultAdapter.unsafeMutableAddressor();
}

uint64_t Logger.testVerification.unsafeMutableAddressor()
{
  return Logger.testVerification.unsafeMutableAddressor();
}

uint64_t Logger.launcher.unsafeMutableAddressor()
{
  return Logger.launcher.unsafeMutableAddressor();
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

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
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

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.index(after:)()
{
  return String.index(after:)();
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

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

{
  return String.subscript.getter();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
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

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
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

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
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

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return _CFRunLoopCopyCurrentMode(rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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