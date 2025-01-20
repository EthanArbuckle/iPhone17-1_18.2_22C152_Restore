void *sub_1000A3230(void *result, int64_t a2, char a3, void *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      v7 = a2;
    }
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8) {
      v9 = a4[2];
    }
    else {
      v9 = v7;
    }
    if (v9)
    {
      sub_100006730(&qword_1000E4B50);
      v10 = (void *)swift_allocObject();
      v11 = j__malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32) {
        v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      v10 = _swiftEmptyArrayStorage;
      v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1000A3BAC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1000A3340(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    int64_t v8 = a4[2];
    if (v7 <= v8) {
      int64_t v9 = a4[2];
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_100006730(&qword_1000E7AC0);
      v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * v11 - 64;
      v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= (void *)((char *)a4 + v8 + 32)) {
          memmove(v12, a4 + 4, v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = _swiftEmptyArrayStorage;
      v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1000A3CB8(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000A343C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_1000A3530(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_1000A3624(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100006730(&qword_1000E7450);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000A3730(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for CAUVehicleLayoutKey() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000A3888(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_100006730((uint64_t *)&unk_1000E5780);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000A3994(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_100006730(&qword_1000E7AD0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000A3AA0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_100006730((uint64_t *)&unk_1000E7AF0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000A3BAC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100006730(&qword_1000E7AE0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_1000A3CB8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
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

uint64_t sub_1000A3DA0()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000A3DD8()
{
}

uint64_t sub_1000A3DE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000A3DF0()
{
  return swift_release();
}

uint64_t sub_1000A3DF8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000A3E30()
{
}

uint64_t sub_1000A3E38()
{
  return sub_1000A0D74();
}

void *sub_1000A3E68(uint64_t a1)
{
  uint64_t result = (void *)sub_10006E6D0(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (void *)(1 << *(unsigned char *)(a1 + 32))) {
    return 0;
  }
  else {
    return sub_1000A5D48(&v5, (uint64_t)result, v3, 0, a1);
  }
}

uint64_t sub_1000A3EF4(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = __CocoaSet.startIndex.getter();
    uint64_t v5 = v4;
    __CocoaSet.endIndex.getter();
    char v6 = static __CocoaSet.Index.== infix(_:_:)();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_1000A7EA0(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_1000A5DD8(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_1000A7EA0(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_1000A6050(a1);
  if ((v10 & 1) == 0)
  {
    uint64_t v5 = v9;
    if (*(_DWORD *)(a1 + 36) == v9)
    {
      uint64_t v3 = result;
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

Swift::Int sub_1000A4004(uint64_t a1, uint64_t a2, char a3)
{
  Hasher.init(_seed:)();
  if (a3)
  {
    if (a3 == 1)
    {
      Hasher._combine(_:)(3uLL);
      Swift::UInt v6 = a1;
    }
    else if (a1 | a2)
    {
      if (a1 ^ 1 | a2) {
        Swift::UInt v6 = 4;
      }
      else {
        Swift::UInt v6 = 2;
      }
    }
    else
    {
      Swift::UInt v6 = 1;
    }
    Hasher._combine(_:)(v6);
  }
  else
  {
    Hasher._combine(_:)(0);
    String.hash(into:)();
  }
  return Hasher._finalize()();
}

Swift::Int sub_1000A40CC()
{
  return sub_1000A4004(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

void sub_1000A40D8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  if (*((unsigned char *)v0 + 16))
  {
    if (*((unsigned char *)v0 + 16) == 1)
    {
      Hasher._combine(_:)(3uLL);
      Swift::UInt v3 = v1;
    }
    else if (v1 | v2)
    {
      if (v1 ^ 1 | v2) {
        Swift::UInt v3 = 4;
      }
      else {
        Swift::UInt v3 = 2;
      }
    }
    else
    {
      Swift::UInt v3 = 1;
    }
    Hasher._combine(_:)(v3);
  }
  else
  {
    Hasher._combine(_:)(0);
    String.hash(into:)();
  }
}

Swift::Int sub_1000A4190()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  int v3 = *((unsigned __int8 *)v0 + 16);
  Hasher.init(_seed:)();
  if (v3)
  {
    if (v3 == 1)
    {
      Hasher._combine(_:)(3uLL);
      Swift::UInt v4 = v1;
    }
    else if (v1 | v2)
    {
      if (v1 ^ 1 | v2) {
        Swift::UInt v4 = 4;
      }
      else {
        Swift::UInt v4 = 2;
      }
    }
    else
    {
      Swift::UInt v4 = 1;
    }
    Hasher._combine(_:)(v4);
  }
  else
  {
    Hasher._combine(_:)(0);
    String.hash(into:)();
  }
  return Hasher._finalize()();
}

uint64_t sub_1000A424C(uint64_t a1, uint64_t a2)
{
  return sub_1000A60D8(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

void sub_1000A42C0()
{
  uint64_t v1 = OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window];
  if (v2
    && (id v3 = [v2 windowScene]) != 0
    && (v4 = v3, id v5 = [v3 screen], v4, v5))
  {
    [v5 scale];
  }
  else
  {
    if (qword_1000E46D8 != -1) {
      swift_once();
    }
    Swift::UInt v6 = qword_1000EA798;
    uint64_t v7 = v0;
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = (void *)v10;
      *(_DWORD *)uint64_t v9 = 138543618;
      unint64_t v12 = *(void **)&v0[v1];
      if (v12)
      {
        v17 = (void *)v10;
        id v13 = v12;
        uint64_t v11 = v17;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v11 = v12;

      *(_WORD *)(v9 + 12) = 2114;
      v14 = *(void **)&v0[v1];
      if (v14 && (id v15 = [v14 windowScene]) != 0)
      {
        id v16 = v15;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
      }
      else
      {
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        id v16 = 0;
      }
      v11[1] = v16;

      _os_log_impl((void *)&_mh_execute_header, v6, v8, "Unable to resolve the screen.  window=%{public}@ windowScene=%{public}@", (uint8_t *)v9, 0x16u);
      sub_100006730(&qword_1000E4F30);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

void sub_1000A45B0(uint64_t a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = (void *)Strong;
    if (qword_1000E46D8 != -1) {
      swift_once();
    }
    Swift::UInt v6 = qword_1000EA798;
    os_log_type_t v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "asset library updated", v8, 2u);
      swift_slowDealloc();
    }
    sub_1000A4C98(a3);
  }
}

void sub_1000A4748(void *a1)
{
  uint64_t v2 = v1;
  if (qword_1000E46D8 != -1) {
    swift_once();
  }
  Swift::UInt v4 = qword_1000EA798;
  id v5 = a1;
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 138543362;
    id v9 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *os_log_type_t v8 = v5;

    _os_log_impl((void *)&_mh_execute_header, v4, v6, "Scene did disconnect scene: %{public}@", v7, 0xCu);
    sub_100006730(&qword_1000E4F30);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v10 = [self sharedApplication];
  id v11 = [v10 delegate];

  if (v11)
  {
    type metadata accessor for ClimateAppDelegate();
    swift_dynamicCastClassUnconditional();
    id v12 = sub_10008EAA4();
    swift_unknownObjectRelease();
    id v13 = sub_100037DB8((uint64_t)v2);

    uint64_t v14 = OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_rootViewController;
    id v15 = *(void **)&v2[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_rootViewController];
    *(void *)&v2[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_rootViewController] = v13;
    id v16 = v13;

    uint64_t v17 = OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window;
    v18 = *(void **)&v2[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window];
    if (v18)
    {
      [v18 setRootViewController:*(void *)&v2[v14]];
      v18 = *(void **)&v2[v17];
    }
    [v18 makeKeyAndVisible];

    self;
    uint64_t v19 = swift_dynamicCastObjCClass();
    if (v19)
    {
      v20 = (void *)v19;
      sub_100007310(0, (unint64_t *)&unk_1000E7C90);
      id v21 = v5;
      v22 = NSString.init(stringLiteral:)();
      sub_100006730(&qword_1000E5688);
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_1000B2000;
      *(void *)(v23 + 56) = type metadata accessor for ClimateSceneDelegate();
      *(void *)(v23 + 64) = sub_1000A7F40((unint64_t *)&unk_1000E7CA0, v24, (void (*)(uint64_t))type metadata accessor for ClimateSceneDelegate);
      *(void *)(v23 + 32) = v2;
      v25 = v2;
      v26 = NSString.init(format:_:)();

      [v20 _unregisterSettingsDiffActionArrayForKey:v26];
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_1000A4C98(void *a1)
{
  uint64_t v2 = v1;
  if ([a1 hasPhysicalControlBars])
  {
    type metadata accessor for ClimatePhysicalControlBarsViewController();
    if (swift_dynamicCastClass()) {
      return;
    }
    id v3 = &v1[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type];
    uint64_t v4 = *(void *)&v1[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type];
    uint64_t v5 = *(void *)&v1[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type + 8];
    *(_OWORD *)&v1[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type] = xmmword_1000B4D00;
  }
  else
  {
    type metadata accessor for ClimateOverlayViewController();
    if (swift_dynamicCastClass()) {
      return;
    }
    id v3 = &v1[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type];
    uint64_t v4 = *(void *)&v1[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type];
    uint64_t v5 = *(void *)&v1[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type + 8];
    *(void *)id v3 = 0;
    *((void *)v3 + 1) = 0;
  }
  char v6 = v3[16];
  v3[16] = 2;
  sub_100010840(v4, v5, v6);
  id v7 = [self sharedApplication];
  id v8 = [v7 delegate];

  if (v8)
  {
    type metadata accessor for ClimateAppDelegate();
    swift_dynamicCastClassUnconditional();
    id v9 = sub_10008EAA4();
    swift_unknownObjectRelease();
    uint64_t v10 = OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window;
    id v11 = *(void **)&v2[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window];
    if (v11) {
      id v12 = [v11 windowScene];
    }
    else {
      id v12 = 0;
    }
    id v13 = (void *)sub_100036C44(v2, v12);

    if (v13)
    {
      uint64_t v14 = OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_rootViewController;
      id v15 = *(void **)&v2[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_rootViewController];
      *(void *)&v2[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_rootViewController] = v13;
      id v17 = v13;

      id v16 = *(void **)&v2[v10];
      if (v16)
      {
        [v16 setRootViewController:*(void *)&v2[v14]];
        id v16 = *(void **)&v2[v10];
      }
      [v16 makeKeyAndVisible];
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000A4E94(char a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007310(0, (unint64_t *)&qword_1000E7C70);
  id v9 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(unsigned char *)(v11 + 24) = a1;
  aBlock[4] = sub_1000A7F1C;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10005FC84;
  aBlock[3] = &unk_1000CD070;
  id v12 = _Block_copy(aBlock);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_1000A7F40((unint64_t *)&qword_1000E5DD0, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100006730((uint64_t *)&unk_1000E7C80);
  sub_10000D02C(&qword_1000E5DE0, (uint64_t *)&unk_1000E7C80);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v15);
}

void sub_1000A519C(uint64_t a1, char a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    uint64_t v5 = *(void **)(Strong + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_statusBarStyleAssertion);
    if (!v5)
    {
LABEL_21:

      return;
    }
    uint64_t v6 = self;
    id v7 = v5;
    id v8 = [v6 functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    id v9 = [self settingsWithDuration:v8 timingFunction:0.35];
    if (!v9)
    {
LABEL_20:

      uint64_t v4 = v8;
      goto LABEL_21;
    }
    id v10 = v9;
    if ([v7 isValid] == (a2 & 1))
    {
      uint64_t v15 = v10;
LABEL_19:

      goto LABEL_20;
    }
    if (a2)
    {
      if (qword_1000E46D8 != -1) {
        swift_once();
      }
      uint64_t v11 = qword_1000EA798;
      os_log_type_t v12 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v11, v12))
      {
        uint64_t v14 = &selRef_acquireWithAnimationSettings_;
        goto LABEL_18;
      }
      id v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Acquire status bar style assertion", v13, 2u);
      uint64_t v14 = &selRef_acquireWithAnimationSettings_;
    }
    else
    {
      if (qword_1000E46D8 != -1) {
        swift_once();
      }
      id v16 = qword_1000EA798;
      os_log_type_t v17 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v16, v17))
      {
        uint64_t v14 = &selRef_relinquishWithAnimationSettings_;
        goto LABEL_18;
      }
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Relinquish status bar style assertion", v18, 2u);
      uint64_t v14 = &selRef_relinquishWithAnimationSettings_;
    }
    swift_slowDealloc();
LABEL_18:
    [v7 *v14 v10];
    uint64_t v15 = v4;
    uint64_t v4 = v7;
    id v7 = v10;
    goto LABEL_19;
  }
}

id sub_1000A549C()
{
  *(void *)&v0[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type];
  *(_OWORD *)uint64_t v1 = xmmword_1000B4D10;
  v1[16] = 0;
  v0[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_wereSteppersHidden] = 0;
  uint64_t v2 = OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_rootViewController;
  uint64_t v3 = (objc_class *)type metadata accessor for ClimateRoleViewController();
  uint64_t v4 = (char *)objc_allocWithZone(v3);
  uint64_t v5 = &v4[OBJC_IVAR____TtC7Climate25ClimateRoleViewController_role];
  *(void *)uint64_t v5 = 0x74657320746F6ELL;
  *((void *)v5 + 1) = 0xE700000000000000;
  v10.receiver = v4;
  v10.super_class = v3;
  uint64_t v6 = v0;
  *(void *)&v0[v2] = [super initWithNibName:0 bundle:0];
  id v7 = &v6[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_persistentIdentifier];
  *(void *)id v7 = 0;
  *((void *)v7 + 1) = 0xE000000000000000;
  *(void *)&v6[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_cancellables] = &_swiftEmptySetSingleton;
  *(void *)&v6[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_statusBarStyleAssertion] = 0;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for ClimateSceneDelegate();
  return [super init];
}

id sub_1000A55DC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClimateSceneDelegate();
  [super dealloc];
}

uint64_t type metadata accessor for ClimateSceneDelegate()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for ClimateLayoutMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000A5864);
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

ValueMetadata *type metadata accessor for ClimateLayoutMode()
{
  return &type metadata for ClimateLayoutMode;
}

uint64_t destroy for ClimateSceneDelegateType(uint64_t a1)
{
  return sub_100010840(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s7Climate24ClimateSceneDelegateTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100043628(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ClimateSceneDelegateType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100043628(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_100010840(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for ClimateSceneDelegateType(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ClimateSceneDelegateType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_100010840(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClimateSceneDelegateType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ClimateSceneDelegateType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1000A5A3C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_1000A5A54(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ClimateSceneDelegateType()
{
  return &type metadata for ClimateSceneDelegateType;
}

unint64_t sub_1000A5A80()
{
  unint64_t result = qword_1000E7C40;
  if (!qword_1000E7C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000E7C40);
  }
  return result;
}

uint64_t sub_1000A5AD8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();

  return swift_release();
}

uint64_t sub_1000A5B54(uint64_t a1, void **a2)
{
  uint64_t v4 = sub_100006730((uint64_t *)&unk_1000E5530);
  __chkstk_darwin(v4 - 8);
  char v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  objc_super v9 = (char *)&v13 - v8;
  sub_10002FB7C(a1, (uint64_t)&v13 - v8);
  objc_super v10 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10002FB7C((uint64_t)v9, (uint64_t)v6);
  id v11 = v10;
  static Published.subscript.setter();
  return sub_10000A404((uint64_t)v9, (uint64_t *)&unk_1000E5530);
}

uint64_t sub_1000A5C58@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1000A5CD8(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

void *sub_1000A5D48(void *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 16 * a2);
    char v6 = *(void **)(*(void *)(a5 + 56) + 8 * a2);
    *uint64_t result = v6;
    swift_bridgeObjectRetain();
    id v7 = v6;
    return (void *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

void sub_1000A5DD8(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      sub_100007310(0, &qword_1000E7C50);
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
  sub_100007310(0, &qword_1000E7C50);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = static NSObject.== infix(_:_:)();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = static NSObject.== infix(_:_:)();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  uint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_1000A6050(uint64_t a1)
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
  id v9 = (unint64_t *)(a1 + 72);
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

uint64_t sub_1000A60D8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a3)
  {
    if (a3 == 1)
    {
      if (a6 == 1) {
        return a4 == a1;
      }
    }
    else if (a1 | a2)
    {
      if (a1 ^ 1 | a2)
      {
        if (a6 == 2 && a4 == 2 && !a5) {
          return 1;
        }
      }
      else if (a6 == 2 && a4 == 1 && !a5)
      {
        return 1;
      }
    }
    else if (a6 == 2 && !(a5 | a4))
    {
      return 1;
    }
    return 0;
  }
  if (a6) {
    return 0;
  }
  if (a1 == a4 && a2 == a5) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

void sub_1000A61AC(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100006730((uint64_t *)&unk_1000E5450);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v99 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006730(&qword_1000E6C80);
  uint64_t v104 = *(void *)(v9 - 8);
  uint64_t v105 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006730((uint64_t *)&unk_1000E7CB0);
  v106 = *(void (***)(char *, void))(v12 - 8);
  *(void *)&double v13 = __chkstk_darwin(v12).n128_u64[0];
  id v15 = (char *)&v99 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = [a2 persistentIdentifier];
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;

  v20 = (uint64_t *)&v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_persistentIdentifier];
  uint64_t *v20 = v17;
  v20[1] = v19;
  swift_bridgeObjectRelease();
  self;
  uint64_t v21 = swift_dynamicCastObjCClass();
  if (!v21) {
    return;
  }
  uint64_t v22 = v21;
  id v100 = a2;
  uint64_t v101 = v12;
  id v23 = objc_allocWithZone((Class)UIWindow);
  id v107 = a1;
  id v24 = [v23 initWithWindowScene:v22];
  uint64_t v25 = OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window;
  v26 = *(void **)&v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window];
  *(void *)&v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window] = v24;

  [v107 _safeAreaInsetsForInterfaceOrientation:1];
  BOOL v29 = v27 != 0.0 && v27 == v28;
  id v103 = self;
  id v30 = [v103 sharedApplication];
  id v31 = [v30 delegate];

  if (!v31)
  {
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v102 = type metadata accessor for ClimateAppDelegate();
  swift_dynamicCastClassUnconditional();
  v32 = sub_10008EAA4();
  swift_unknownObjectRelease();
  v32[OBJC_IVAR____TtC7Climate18ClimateCoordinator_hasDualStatusBar] = v29;

  id v33 = [v107 _FBSScene];
  id v34 = [v33 settings];

  self;
  uint64_t v35 = swift_dynamicCastObjCClass();
  if (v35)
  {
    uint64_t v36 = v35;
    NSString v37 = String._bridgeToObjectiveC()();
    CAFSignpostEmit_Scene();

    id v38 = [v107 _FBSScene];
    [v38 addObserver:v3];

    id v39 = [v103 sharedApplication];
    id v40 = [v39 delegate];

    if (v40)
    {
      swift_dynamicCastClassUnconditional();
      id v41 = sub_10008EAA4();
      swift_unknownObjectRelease();
      swift_retain();

      dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter();
      swift_release();
      id v108 = [self mainRunLoop];
      uint64_t v42 = type metadata accessor for NSRunLoop.SchedulerOptions();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v8, 1, 1, v42);
      sub_100007310(0, (unint64_t *)&unk_1000E5470);
      sub_10000D02C((unint64_t *)&unk_1000E7CC0, &qword_1000E6C80);
      sub_1000A7F90((unint64_t *)&qword_1000E5480, (unint64_t *)&unk_1000E5470);
      uint64_t v43 = v105;
      Publisher.receive<A>(on:options:)();
      sub_10000A404((uint64_t)v8, (uint64_t *)&unk_1000E5450);

      (*(void (**)(char *, uint64_t))(v104 + 8))(v11, v43);
      uint64_t v44 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v45 = swift_allocObject();
      *(void *)(v45 + 16) = v44;
      *(void *)(v45 + 24) = v36;
      sub_10000D02C((unint64_t *)&unk_1000E7CD0, (uint64_t *)&unk_1000E7CB0);
      id v46 = v34;
      uint64_t v47 = v101;
      Publisher<>.sink(receiveValue:)();
      swift_release();
      v106[1](v15, v47);
      swift_beginAccess();
      AnyCancellable.store(in:)();
      swift_endAccess();

      swift_release();
      return;
    }
    goto LABEL_45;
  }
  uint64_t v48 = v29;

  id v49 = v100;
  id v50 = [v100 role];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v51 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  CAFSignpostEmit_Scene();

  id v52 = [objc_allocWithZone((Class)UIWindow) initWithWindowScene:v22];
  v53 = *(void **)&v3[v25];
  *(void *)&v3[v25] = v52;

  v54 = *(void **)&v3[v25];
  if (v54)
  {
    [v54 setAutoresizesSubviews:1];
    v54 = *(void **)&v3[v25];
    if (v54)
    {
      [v54 setAutoresizingMask:18];
      v54 = *(void **)&v3[v25];
    }
  }
  [v54 makeKeyAndVisible];
  v55 = *(void **)&v3[v25];
  if (v55)
  {
    [v55 setOverrideUserInterfaceStyle:2];
    v56 = *(void **)&v3[v25];
    if (v56) {
      [v56 setHidden:0];
    }
  }
  id v57 = [v49 role];
  uint64_t v58 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v60 = v59;
  if (v58 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v60 == v61)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_20;
  }
  char v62 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v62)
  {
LABEL_20:

    v63 = *(void **)&v3[v25];
    if (v63)
    {
      [v63 frame];
      if (v64 > 240.0) {
        uint64_t v48 = 2;
      }
    }
    p_type = (char **)(&stru_1000D5FF0 + 16);
    id v66 = v103;
    v67 = (char **)(&stru_1000D5FF0 + 16);
    v68 = &v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type];
    uint64_t v69 = *(void *)&v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type];
    uint64_t v70 = *(void *)&v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type + 8];
    *(void *)v68 = v48;
    *((void *)v68 + 1) = 0;
    char v71 = v68[16];
    v68[16] = 1;
    sub_100010840(v69, v70, v71);
    goto LABEL_31;
  }
  uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v74 = v73;
  if (v72 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v74 == v75)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v76 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v76 & 1) == 0)
    {
      id v81 = [v49 role];
      uint64_t v82 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v84 = v83;

      v85 = &v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type];
      uint64_t v78 = *(void *)&v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type];
      uint64_t v79 = *(void *)&v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type + 8];
      *(void *)v85 = v82;
      *((void *)v85 + 1) = v84;
      char v80 = v85[16];
      v85[16] = 0;
      goto LABEL_30;
    }
  }
  v77 = &v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type];
  uint64_t v78 = *(void *)&v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type];
  uint64_t v79 = *(void *)&v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_type + 8];
  *(_OWORD *)v77 = xmmword_1000B4D20;
  char v80 = v77[16];
  v77[16] = 2;
LABEL_30:
  sub_100010840(v78, v79, v80);
  p_type = &stru_1000D5FF0.type;
  id v66 = v103;
  v67 = &stru_1000D5FF0.type;
LABEL_31:
  id v86 = [objc_allocWithZone((Class)CRSUIStatusBarStyleAssertion) initWithInterfaceStyle:2];
  v87 = *(void **)&v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_statusBarStyleAssertion];
  *(void *)&v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_statusBarStyleAssertion] = v86;

  id v88 = [v66 v67[459]];
  id v89 = [v88 p_type[460]];

  if (!v89)
  {
LABEL_46:
    __break(1u);
    return;
  }
  swift_dynamicCastClassUnconditional();
  id v90 = sub_10008EAA4();
  swift_unknownObjectRelease();
  v91 = (void *)sub_100036C44(v3, 0);

  if (v91)
  {
    uint64_t v92 = OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_rootViewController;
    v93 = *(void **)&v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_rootViewController];
    *(void *)&v3[OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_rootViewController] = v91;
    v106 = v91;

    v94 = *(void **)&v3[v25];
    if (v94)
    {
      [v94 setRootViewController:*(void *)&v3[v92]];
      v94 = *(void **)&v3[v25];
    }
    [v94 makeKeyAndVisible];

    id v95 = v106;
  }
  else
  {
    if (qword_1000E46D8 != -1) {
      swift_once();
    }
    v96 = qword_1000EA798;
    os_log_type_t v97 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v96, v97))
    {
      v98 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v98 = 0;
      _os_log_impl((void *)&_mh_execute_header, v96, v97, "Unable to attach view controller", v98, 2u);
      swift_slowDealloc();
    }
    id v95 = v107;
  }
}

void sub_1000A6CD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = self;
  id v3 = [v2 sharedApplication];
  id v4 = [v3 delegate];

  if (v4)
  {
    type metadata accessor for ClimateAppDelegate();
    swift_dynamicCastClassUnconditional();
    id v5 = sub_10008EAA4();
    swift_unknownObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();

    swift_release();
    swift_release();
    if (v8 != 1 || *(unsigned char *)(v1 + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_wereSteppersHidden) != 1) {
      goto LABEL_6;
    }
    id v6 = [v2 sharedApplication];
    id v7 = [v6 delegate];

    if (v7)
    {
      swift_dynamicCastClassUnconditional();
      sub_10008EAA4();
      swift_unknownObjectRelease();
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.setter();
LABEL_6:
      sub_1000A4E94(1);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_1000A6EA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = self;
  id v3 = [v2 sharedApplication];
  id v4 = [v3 delegate];

  if (!v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  type metadata accessor for ClimateAppDelegate();
  swift_dynamicCastClassUnconditional();
  id v5 = sub_10008EAA4();
  swift_unknownObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();

  swift_release();
  swift_release();
  *(unsigned char *)(v1 + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_wereSteppersHidden) = (v11 & 1) == 0;
  id v6 = [v2 sharedApplication];
  id v7 = [v6 delegate];

  if (!v7)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  swift_dynamicCastClassUnconditional();
  id v8 = sub_10008EAA4();
  swift_unknownObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();

  swift_release();
  swift_release();
  if (v11 != 1)
  {
LABEL_6:
    sub_1000A4E94(0);
    return;
  }
  id v9 = [v2 sharedApplication];
  id v10 = [v9 delegate];

  if (v10)
  {
    swift_dynamicCastClassUnconditional();
    sub_10008EAA4();
    swift_unknownObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.setter();
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
}

void sub_1000A7128(void *a1, id a2)
{
  id v3 = [a2 settingsDiff];
  id v17 = [a1 settings];
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    id v5 = (void *)v4;
    if (qword_1000E46D8 != -1) {
      swift_once();
    }
    id v6 = qword_1000EA798;
    id v7 = v17;
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v9 = 134349056;
      v18[0] = [v5 deactivationReasons];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v6, v8, "Scene settings updated, deactivation reasons: %{public}lu", v9, 0xCu);
      swift_slowDealloc();
    }
    else
    {
    }
    id v10 = [v5 deactivationReasons];
    id v11 = [self sharedApplication];
    id v12 = [v11 delegate];

    if (v10 == (id)128)
    {
      if (v12)
      {
        type metadata accessor for ClimateAppDelegate();
        swift_dynamicCastClassUnconditional();
        id v13 = sub_10008EAA4();
        swift_unknownObjectRelease();
        swift_getKeyPath();
        swift_getKeyPath();
        id v15 = (void (*)(id *, void))static Published.subscript.modify();
        if ((*v14 & 2) != 0)
        {
          unint64_t v16 = *v14 & 0xFFFFFFFFFFFFFFFDLL;
LABEL_17:
          unint64_t *v14 = v16;
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      __break(1u);
    }
    else if (v12)
    {
      type metadata accessor for ClimateAppDelegate();
      swift_dynamicCastClassUnconditional();
      id v13 = sub_10008EAA4();
      swift_unknownObjectRelease();
      swift_getKeyPath();
      swift_getKeyPath();
      id v15 = (void (*)(id *, void))static Published.subscript.modify();
      if ((*v14 & 2) == 0)
      {
        unint64_t v16 = *v14 | 2;
        goto LABEL_17;
      }
LABEL_18:
      v15(v18, 0);

      swift_release();
      swift_release();
      return;
    }
    __break(1u);
  }
  else
  {
  }
}

void sub_1000A748C()
{
  uint64_t v0 = sub_100006730(&qword_1000E5AC0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v65 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006730((uint64_t *)&unk_1000E5530);
  __chkstk_darwin(v3 - 8);
  uint64_t v67 = (uint64_t)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v68 = (uint64_t)&v65 - v6;
  __chkstk_darwin(v7);
  id v9 = (char *)&v65 - v8;
  uint64_t v10 = type metadata accessor for ClimateZone();
  uint64_t v69 = *(void *)(v10 - 8);
  uint64_t v70 = v10;
  __chkstk_darwin(v10);
  uint64_t v66 = (uint64_t)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006730((uint64_t *)&unk_1000E7C60);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for CAUVehicleLayoutKey();
  uint64_t v72 = *(void *)(v15 - 8);
  uint64_t v73 = v15;
  __chkstk_darwin(v15);
  uint64_t v71 = (uint64_t)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100006730(&qword_1000E64B8);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v65 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for URL();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  id v23 = (char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v26 = (char *)&v65 - v25;
  uint64_t v27 = swift_bridgeObjectRetain();
  double v28 = (void *)sub_1000A3EF4(v27);
  swift_bridgeObjectRelease();
  if (!v28)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v19, 1, 1, v20);
    goto LABEL_6;
  }
  id v29 = [v28 URL];

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v30 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
  v30(v19, v23, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v19, 0, 1, v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
LABEL_6:
    id v33 = &qword_1000E64B8;
    uint64_t v34 = (uint64_t)v19;
    goto LABEL_7;
  }
  v30(v26, v19, v20);
  sub_10007DCF4((uint64_t)v14);
  uint64_t v32 = v72;
  uint64_t v31 = v73;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v72 + 48))(v14, 1, v73) != 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v71, v14, v31);
    id v38 = self;
    id v39 = [v38 sharedApplication];
    id v40 = [v39 delegate];

    if (v40)
    {
      type metadata accessor for ClimateAppDelegate();
      swift_dynamicCastClassUnconditional();
      id v41 = sub_10008EAA4();
      swift_unknownObjectRelease();
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();

      swift_release();
      swift_release();
      uint64_t v42 = type metadata accessor for ClimateSystemManager();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v42 - 8) + 48))(v2, 1, v42) == 1)
      {
        sub_10000A404((uint64_t)v2, &qword_1000E5AC0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v69 + 56))(v9, 1, 1, v70);
LABEL_20:
        (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v71, v73);
        (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v20);
        id v33 = (uint64_t *)&unk_1000E5530;
        uint64_t v34 = (uint64_t)v9;
        goto LABEL_7;
      }
      uint64_t v43 = *(void *)&v2[*(int *)(v42 + 36)];
      if (*(void *)(v43 + 16) && (unint64_t v44 = sub_10007C5C4(v71), (v45 & 1) != 0))
      {
        uint64_t v46 = *(void *)(v43 + 56);
        uint64_t v47 = v69;
        sub_10000ABC4(v46 + *(void *)(v69 + 72) * v44, (uint64_t)v9);
        uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v47 + 56);
        id v49 = v9;
        uint64_t v50 = 0;
      }
      else
      {
        uint64_t v47 = v69;
        uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v69 + 56);
        id v49 = v9;
        uint64_t v50 = 1;
      }
      uint64_t v51 = v70;
      v48(v49, v50, 1, v70);
      sub_10000D204((uint64_t)v2, (uint64_t (*)(void))type metadata accessor for ClimateSystemManager);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v9, 1, v51) == 1) {
        goto LABEL_20;
      }
      uint64_t v52 = (uint64_t)v9;
      uint64_t v53 = v66;
      sub_10000D1A0(v52, v66);
      id v54 = [v38 sharedApplication];
      id v55 = [v54 delegate];

      if (v55)
      {
        swift_dynamicCastClassUnconditional();
        sub_10008EAA4();
        swift_unknownObjectRelease();
        swift_getKeyPath();
        swift_getKeyPath();
        uint64_t v74 = 0;
        static Published.subscript.setter();
        v56 = *(void **)(v65 + OBJC_IVAR____TtC7Climate20ClimateSceneDelegate_window);
        if (v56)
        {
          id v57 = [v56 rootViewController];
          if (v57)
          {
            uint64_t v58 = v57;
            self;
            uint64_t v59 = (void *)swift_dynamicCastObjCClass();
            if (v59) {
          }
            }
        }
        id v60 = [v38 sharedApplication];
        id v61 = [v60 delegate];

        if (v61)
        {
          swift_dynamicCastClassUnconditional();
          id v62 = sub_10008EAA4();
          swift_unknownObjectRelease();
          uint64_t v63 = v68;
          sub_10000ABC4(v53, v68);
          v48((char *)v63, 0, 1, v70);
          swift_getKeyPath();
          swift_getKeyPath();
          sub_10002FB7C(v63, v67);
          id v64 = v62;
          static Published.subscript.setter();
          sub_10000A404(v63, (uint64_t *)&unk_1000E5530);

          sub_10000D204(v53, (uint64_t (*)(void))type metadata accessor for ClimateZone);
          (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v71, v73);
          (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v20);
          return;
        }
        goto LABEL_31;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_31:
    __break(1u);
    return;
  }
  (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v20);
  id v33 = (uint64_t *)&unk_1000E7C60;
  uint64_t v34 = (uint64_t)v14;
LABEL_7:
  sub_10000A404(v34, v33);
  if (qword_1000E46D8 != -1) {
    swift_once();
  }
  uint64_t v35 = qword_1000EA798;
  os_log_type_t v36 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v35, v36))
  {
    NSString v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "No available climate zone in URL.", v37, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_1000A7EA0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000A7EAC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000A7EE4()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

void sub_1000A7F1C()
{
  sub_1000A519C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_1000A7F28(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000A7F38()
{
  return swift_release();
}

uint64_t sub_1000A7F40(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_1000A7F90(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007310(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000A7FD4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000A8014(uint64_t a1)
{
  sub_1000A45B0(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1000A801C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t Measurement<>.localeStep(_:by:)()
{
  return Measurement<>.localeStep(_:by:)();
}

uint64_t Measurement<>.invalidString.getter()
{
  return Measurement<>.invalidString.getter();
}

uint64_t Measurement<>.readableString(in:)()
{
  return Measurement<>.readableString(in:)();
}

NSMeasurement __swiftcall Measurement._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)Measurement._bridgeToObjectiveC()();
  result._doubleValue = v2;
  result._unit = v1;
  result.super.isa = v0;
  return result;
}

uint64_t static Measurement.< infix<A, B>(_:_:)()
{
  return static Measurement.< infix<A, B>(_:_:)();
}

uint64_t static Measurement._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Measurement.unit.getter()
{
  return Measurement.unit.getter();
}

uint64_t Measurement.init(value:unit:)()
{
  return Measurement.init(value:unit:)();
}

uint64_t Measurement.value.getter()
{
  return Measurement.value.getter();
}

uint64_t type metadata accessor for Measurement()
{
  return type metadata accessor for Measurement();
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

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
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

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static Locale._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)IndexPath._bridgeToObjectiveC()();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t IndexPath.init(item:section:)()
{
  return IndexPath.init(item:section:)();
}

uint64_t IndexPath.item.getter()
{
  return IndexPath.item.getter();
}

uint64_t IndexPath.section.getter()
{
  return IndexPath.section.getter();
}

uint64_t type metadata accessor for IndexPath()
{
  return type metadata accessor for IndexPath();
}

NSNumber __swiftcall CGFloat._bridgeToObjectiveC()()
{
  return (NSNumber)CGFloat._bridgeToObjectiveC()();
}

uint64_t type metadata accessor for CAUResource()
{
  return type metadata accessor for CAUResource();
}

uint64_t CAUFeatureFlag.Climate.groupedVentsLayout.getter()
{
  return CAUFeatureFlag.Climate.groupedVentsLayout.getter();
}

uint64_t type metadata accessor for CAUFeatureFlag.Climate()
{
  return type metadata accessor for CAUFeatureFlag.Climate();
}

uint64_t CAUFeatureFlag.climate.getter()
{
  return CAUFeatureFlag.climate.getter();
}

uint64_t type metadata accessor for CAUFeatureFlag()
{
  return type metadata accessor for CAUFeatureFlag();
}

uint64_t CAUAssetLibrary.asset(for:)()
{
  return CAUAssetLibrary.asset(for:)();
}

uint64_t dispatch thunk of CAUAssetLibrary.asset<A>(for:)()
{
  return dispatch thunk of CAUAssetLibrary.asset<A>(for:)();
}

uint64_t CAUVehicleLayout.cabinSeatsImage.getter()
{
  return CAUVehicleLayout.cabinSeatsImage.getter();
}

uint64_t CAUVehicleLayout.infos.getter()
{
  return CAUVehicleLayout.infos.getter();
}

uint64_t type metadata accessor for CAUVehicleLayout()
{
  return type metadata accessor for CAUVehicleLayout();
}

uint64_t CAUBaselineAnchor.init(x:y:)()
{
  return CAUBaselineAnchor.init(x:y:)();
}

uint64_t CAUBaselineAnchor.x.getter()
{
  return CAUBaselineAnchor.x.getter();
}

uint64_t CAUBaselineAnchor.y.getter()
{
  return CAUBaselineAnchor.y.getter();
}

uint64_t type metadata accessor for CAUBaselineAnchor()
{
  return type metadata accessor for CAUBaselineAnchor();
}

uint64_t static CAUVehicleLayoutKey.Side.== infix(_:_:)()
{
  return static CAUVehicleLayoutKey.Side.== infix(_:_:)();
}

uint64_t type metadata accessor for CAUVehicleLayoutKey.Side()
{
  return type metadata accessor for CAUVehicleLayoutKey.Side();
}

uint64_t CAUVehicleLayoutKey.side.getter()
{
  return CAUVehicleLayoutKey.side.getter();
}

uint64_t CAUVehicleLayoutKey.init(rawValue:)()
{
  return CAUVehicleLayoutKey.init(rawValue:)();
}

uint64_t CAUVehicleLayoutKey.rawValue.getter()
{
  return CAUVehicleLayoutKey.rawValue.getter();
}

uint64_t type metadata accessor for CAUVehicleLayoutKey()
{
  return type metadata accessor for CAUVehicleLayoutKey();
}

uint64_t CAUVehicleLayoutInfo.baselineAnchor.getter()
{
  return CAUVehicleLayoutInfo.baselineAnchor.getter();
}

uint64_t CAUVehicleLayoutInfo.init(x:y:height:width:baselineAnchor:)()
{
  return CAUVehicleLayoutInfo.init(x:y:height:width:baselineAnchor:)();
}

uint64_t CAUVehicleLayoutInfo.x.getter()
{
  return CAUVehicleLayoutInfo.x.getter();
}

uint64_t CAUVehicleLayoutInfo.y.getter()
{
  return CAUVehicleLayoutInfo.y.getter();
}

uint64_t CAUVehicleLayoutInfo.width.getter()
{
  return CAUVehicleLayoutInfo.width.getter();
}

uint64_t CAUVehicleLayoutInfo.height.getter()
{
  return CAUVehicleLayoutInfo.height.getter();
}

uint64_t type metadata accessor for CAUVehicleLayoutInfo()
{
  return type metadata accessor for CAUVehicleLayoutInfo();
}

uint64_t dispatch thunk of CAUAssetLibraryManager.assetLibrary.getter()
{
  return dispatch thunk of CAUAssetLibraryManager.assetLibrary.getter();
}

uint64_t dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter()
{
  return dispatch thunk of CAUAssetLibraryManager.$assetLibrary.getter();
}

uint64_t CAUAssetLibraryManager.init()()
{
  return CAUAssetLibraryManager.init()();
}

uint64_t type metadata accessor for CAUAssetLibraryManager()
{
  return type metadata accessor for CAUAssetLibraryManager();
}

uint64_t type metadata accessor for CAUPhysicalControlBarsButton()
{
  return type metadata accessor for CAUPhysicalControlBarsButton();
}

uint64_t CAUPhysicalControlBarsLayout.climateLayouts.getter()
{
  return CAUPhysicalControlBarsLayout.climateLayouts.getter();
}

uint64_t type metadata accessor for CAUPhysicalControlBarsLayout()
{
  return type metadata accessor for CAUPhysicalControlBarsLayout();
}

uint64_t CAUPhysicalControlBarsButtonLayoutInfo.startingPoint.getter()
{
  return CAUPhysicalControlBarsButtonLayoutInfo.startingPoint.getter();
}

uint64_t CAUPhysicalControlBarsButtonLayoutInfo.edge.getter()
{
  return CAUPhysicalControlBarsButtonLayoutInfo.edge.getter();
}

uint64_t CAUPhysicalControlBarsButtonLayoutInfo.length.getter()
{
  return CAUPhysicalControlBarsButtonLayoutInfo.length.getter();
}

uint64_t type metadata accessor for CAUPhysicalControlBarsButtonLayoutInfo()
{
  return type metadata accessor for CAUPhysicalControlBarsButtonLayoutInfo();
}

uint64_t type metadata accessor for CAUEdge()
{
  return type metadata accessor for CAUEdge();
}

uint64_t CAUAsset.Seat.State.rawValue.getter()
{
  return CAUAsset.Seat.State.rawValue.getter();
}

uint64_t type metadata accessor for CAUAsset.Seat.State()
{
  return type metadata accessor for CAUAsset.Seat.State();
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

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t static CAFUILogger.default(_:function:file:line:)()
{
  return static CAFUILogger.default(_:function:file:line:)();
}

uint64_t static CAFUICellProtocol.reuseIdentifier.getter()
{
  return static CAFUICellProtocol.reuseIdentifier.getter();
}

uint64_t CAFUISettingsCache.rootSettings(in:visibleOnly:)()
{
  return CAFUISettingsCache.rootSettings(in:visibleOnly:)();
}

uint64_t CAFUISettingsCache.visibleChildren(of:)()
{
  return CAFUISettingsCache.visibleChildren(of:)();
}

uint64_t CAFUISettingsCache.categorySettings(for:)()
{
  return CAFUISettingsCache.categorySettings(for:)();
}

uint64_t CAFUISettingsCache.hasEnabledRootSettings(in:limitUIEnabled:)()
{
  return CAFUISettingsCache.hasEnabledRootSettings(in:limitUIEnabled:)();
}

uint64_t CAFUISettingsCache.sections(for:)()
{
  return CAFUISettingsCache.sections(for:)();
}

uint64_t CAFUISettingsCache.settings(excludingLayoutKeys:)()
{
  return CAFUISettingsCache.settings(excludingLayoutKeys:)();
}

uint64_t CAFUISettingsCache.init(settings:sections:)()
{
  return CAFUISettingsCache.init(settings:sections:)();
}

uint64_t CAFUITileViewController.init(carSession:prominentCategories:listItems:settingsSections:settingsCache:assetManager:requestContentManager:preventVolumeNotification:)()
{
  return CAFUITileViewController.init(carSession:prominentCategories:listItems:settingsSections:settingsCache:assetManager:requestContentManager:preventVolumeNotification:)();
}

uint64_t type metadata accessor for CAFUITileViewController()
{
  return type metadata accessor for CAFUITileViewController();
}

uint64_t type metadata accessor for CAFUIProminentSettingCell()
{
  return type metadata accessor for CAFUIProminentSettingCell();
}

uint64_t CAFUIRequestContentManager.init(session:)()
{
  return CAFUIRequestContentManager.init(session:)();
}

uint64_t type metadata accessor for CAFUIRequestContentManager()
{
  return type metadata accessor for CAFUIRequestContentManager();
}

uint64_t type metadata accessor for CAFUIAutomakerSettingObserver()
{
  return type metadata accessor for CAFUIAutomakerSettingObserver();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
}

uint64_t static Published.subscript.modify()
{
  return static Published.subscript.modify();
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

uint64_t Publisher.compactMap<A>(_:)()
{
  return Publisher.compactMap<A>(_:)();
}

uint64_t Publisher.filter(_:)()
{
  return Publisher.filter(_:)();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher.dropFirst(_:)()
{
  return Publisher.dropFirst(_:)();
}

uint64_t Publisher<>.removeDuplicates()()
{
  return Publisher<>.removeDuplicates()();
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

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
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

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
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

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
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

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
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

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
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

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t CAFSeatFan.isVenting.getter()
{
  return CAFSeatFan.isVenting.getter();
}

uint64_t NSDimension.init(forLocale:)()
{
  return NSDimension.init(forLocale:)();
}

uint64_t UIStackView.init(axis:spacing:arrangedSubviews:)()
{
  return UIStackView.init(axis:spacing:arrangedSubviews:)();
}

uint64_t CAFPositioned.layoutKey.getter()
{
  return CAFPositioned.layoutKey.getter();
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

uint64_t CAFDeepLinkSetting.requestContentManager.setter()
{
  return CAFDeepLinkSetting.requestContentManager.setter();
}

uint64_t CAFPositionManager.layoutKeys.getter()
{
  return CAFPositionManager.layoutKeys.getter();
}

uint64_t CAFPositionManager.services(for:includeSharedServices:requireSpecificServices:filter:)()
{
  return CAFPositionManager.services(for:includeSharedServices:requireSpecificServices:filter:)();
}

uint64_t UIFocusEnvironment.contains(_:)()
{
  return UIFocusEnvironment.contains(_:)();
}

uint64_t CAFAutomakerSetting.isHidden.getter()
{
  return CAFAutomakerSetting.isHidden.getter();
}

uint64_t CAFAutoModeIntensity.description.getter()
{
  return CAFAutoModeIntensity.description.getter();
}

uint64_t static CAFAutoModeIntensity.allCases.getter()
{
  return static CAFAutoModeIntensity.allCases.getter();
}

uint64_t CAFAutomakerSettings.allSettings.getter()
{
  return CAFAutomakerSettings.allSettings.getter();
}

uint64_t CAFPositionedRequired.layoutKey.getter()
{
  return CAFPositionedRequired.layoutKey.getter();
}

uint64_t CAFSeatHeatingCooling.isHeating.getter()
{
  return CAFSeatHeatingCooling.isHeating.getter();
}

uint64_t CAFSeatHeatingCooling.isCooling.getter()
{
  return CAFSeatHeatingCooling.isCooling.getter();
}

uint64_t CAFFan.isBlowing.getter()
{
  return CAFFan.isBlowing.getter();
}

uint64_t static UIView.animate(springDuration:bounce:initialSpringVelocity:delay:options:animations:completion:)()
{
  return static UIView.animate(springDuration:bounce:initialSpringVelocity:delay:options:animations:completion:)();
}

Swift::String __swiftcall CAFVent.symbolName(useRightFacingSeat:)(Swift::Bool useRightFacingSeat)
{
  uint64_t v1 = CAFVent.symbolName(useRightFacingSeat:)(useRightFacingSeat);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t static CAFVent.groupedSymbolName(vents:useRightFacingSeat:)()
{
  return static CAFVent.groupedSymbolName(vents:useRightFacingSeat:)();
}

uint64_t static UIColor.cafui_tableBackground.getter()
{
  return static UIColor.cafui_tableBackground.getter();
}

uint64_t static UIColor.cafui_tableCellPlainBackground.getter()
{
  return static UIColor.cafui_tableCellPlainBackground.getter();
}

uint64_t CAFRange.maximumValue<A>()()
{
  return CAFRange.maximumValue<A>()();
}

uint64_t CAFRange.minimumValue<A>()()
{
  return CAFRange.minimumValue<A>()();
}

uint64_t type metadata accessor for CAFRange.StepDirection()
{
  return type metadata accessor for CAFRange.StepDirection();
}

uint64_t CAFRange.stepValue<A>()()
{
  return CAFRange.stepValue<A>()();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t NSString.init(format:_:)()
{
  return NSString.init(format:_:)();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t Optional<A>.featureFlags()()
{
  return Optional<A>.featureFlags()();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t Substring.init(_:)()
{
  return Substring.init(_:)();
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

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t StaticString.description.getter()
{
  return StaticString.description.getter();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
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

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return _CocoaArrayWrapper.subscript.getter();
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

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
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

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

uint64_t CAFFrameworkBundle()
{
  return _CAFFrameworkBundle();
}

uint64_t CAFSignpostEmit_Finalized()
{
  return _CAFSignpostEmit_Finalized();
}

uint64_t CAFSignpostEmit_InstantOn()
{
  return _CAFSignpostEmit_InstantOn();
}

uint64_t CAFSignpostEmit_Launched()
{
  return _CAFSignpostEmit_Launched();
}

uint64_t CAFSignpostEmit_Rendered()
{
  return _CAFSignpostEmit_Rendered();
}

uint64_t CAFSignpostEmit_Scene()
{
  return _CAFSignpostEmit_Scene();
}

uint64_t CAFUIImageForSymbolNameWithConfiguration()
{
  return _CAFUIImageForSymbolNameWithConfiguration();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return _CTFontCreateCopyWithAttributes(font, size, matrix, attributes);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return _CTFontCreateWithNameAndOptions(name, size, matrix, options);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return _CTFontDescriptorCreateWithAttributes(attributes);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isClassType()
{
  return _swift_isClassType();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}