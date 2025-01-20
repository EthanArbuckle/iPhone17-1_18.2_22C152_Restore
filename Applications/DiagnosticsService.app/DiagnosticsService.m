uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;

  v5 = UIApplicationMain(a1, a2, 0, 0);
  return v5;
}

unint64_t sub_100001F60(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002C5C(&qword_100008928);
  v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100002B84(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    v12 = (void *)(v2[7] + 16 * result);
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

uint64_t sub_100002090(uint64_t a1)
{
  v2 = v1;
  uint64_t v4 = OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration;
  *(void *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration] = 0x4008000000000000;
  uint64_t v6 = *(void *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey];
  uint64_t v5 = *(void *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey + 8];
  if (!*(void *)(a1 + 16))
  {
    long long v54 = 0u;
    long long v55 = 0u;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_100002B84(v6, v5);
  if ((v8 & 1) == 0)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_100003198(*(void *)(a1 + 56) + 32 * v7, (uint64_t)&v54);
  swift_bridgeObjectRelease();
  if (!*((void *)&v55 + 1))
  {
LABEL_11:
    sub_100002BFC((uint64_t)&v54);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0 || v53 < 1.0 || v53 > 10.0)
  {
LABEL_12:
    static os_log_type_t.error.getter();
    sub_100002C5C(&qword_1000088F0);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100003520;
    *(void *)(v9 + 56) = &type metadata for String;
    *(void *)(v9 + 64) = sub_100002CA0();
    *(void *)(v9 + 32) = v6;
    *(void *)(v9 + 40) = v5;
    sub_100002CF4();
    swift_bridgeObjectRetain();
    char v10 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    if (!*(void *)(a1 + 16)) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  *(double *)&v1[v4] = v53;
  if (!*(void *)(a1 + 16))
  {
LABEL_8:
    long long v54 = 0u;
    long long v55 = 0u;
LABEL_20:
    sub_100002BFC((uint64_t)&v54);
    goto LABEL_21;
  }
LABEL_13:
  uint64_t v11 = *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringPropertiesKey];
  uint64_t v12 = *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringPropertiesKey + 8];
  swift_bridgeObjectRetain();
  unint64_t v13 = sub_100002B84(v11, v12);
  if (v14)
  {
    sub_100003198(*(void *)(a1 + 56) + 32 * v13, (uint64_t)&v54);
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v55 + 1)) {
    goto LABEL_20;
  }
  sub_100002C5C(&qword_100008918);
  if (swift_dynamicCast())
  {
    unint64_t v15 = *(void *)&v53;
    if (*(void *)(*(void *)&v53 + 16)) {
      goto LABEL_22;
    }
    swift_bridgeObjectRelease();
  }
LABEL_21:
  unint64_t v15 = sub_100001F60((uint64_t)_swiftEmptyArrayStorage);
LABEL_22:
  *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringProperties] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey];
  uint64_t v16 = *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey + 8];
  if (!*(void *)(a1 + 16))
  {
    long long v54 = 0u;
    long long v55 = 0u;
LABEL_33:
    sub_100002BFC((uint64_t)&v54);
    goto LABEL_34;
  }
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_100002B84(v17, v16);
  if (v19)
  {
    sub_100003198(*(void *)(a1 + 56) + 32 * v18, (uint64_t)&v54);
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v55 + 1)) {
    goto LABEL_33;
  }
  sub_100002C5C(&qword_100008908);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_34:
    static os_log_type_t.fault.getter();
LABEL_35:
    sub_100002C5C(&qword_1000088F0);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_100003520;
    *(void *)(v23 + 56) = &type metadata for String;
    *(void *)(v23 + 64) = sub_100002CA0();
    *(void *)(v23 + 32) = v17;
    *(void *)(v23 + 40) = v16;
    sub_100002CF4();
    swift_bridgeObjectRetain();
    v24 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    return 0;
  }
  double v20 = v53;
  if (!*(void *)(*(void *)&v53 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  uint64_t v17 = *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey];
  uint64_t v16 = *(void *)&v2[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey + 8];
  if (!*(void *)(a1 + 16))
  {
    long long v54 = 0u;
    long long v55 = 0u;
LABEL_73:
    swift_bridgeObjectRelease();
    sub_100002BFC((uint64_t)&v54);
    static os_log_type_t.error.getter();
    goto LABEL_35;
  }
  swift_bridgeObjectRetain();
  unint64_t v21 = sub_100002B84(v17, v16);
  if (v22)
  {
    sub_100003198(*(void *)(a1 + 56) + 32 * v21, (uint64_t)&v54);
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v55 + 1)) {
    goto LABEL_73;
  }
  sub_100002C5C(&qword_100008910);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_75:
    swift_bridgeObjectRelease();
    static os_log_type_t.error.getter();
    goto LABEL_35;
  }
  if (!*(void *)(*(void *)&v53 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_75;
  }
  uint64_t v50 = *(void *)(*(void *)&v53 + 16);
  if (!v50)
  {
LABEL_76:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_100008800 != -1) {
      goto LABEL_81;
    }
    goto LABEL_77;
  }
  unint64_t v26 = 0;
  uint64_t v27 = *(void *)&v53 + 64;
  v28 = (char *)_swiftEmptyArrayStorage;
LABEL_45:
  if (v26 < *(void *)(*(void *)&v20 + 16))
  {
    uint64_t v29 = *(void *)(*(void *)&v53 + 32 + 8 * v26);
    unint64_t v51 = v26 + 1;
    uint64_t v30 = 1 << *(unsigned char *)(*(void *)&v53 + 32);
    if (v30 < 64) {
      uint64_t v31 = ~(-1 << v30);
    }
    else {
      uint64_t v31 = -1;
    }
    unint64_t v32 = v31 & *(void *)(*(void *)&v53 + 64);
    int64_t v33 = (unint64_t)(v30 + 63) >> 6;
    swift_bridgeObjectRetain();
    int64_t v34 = 0;
    if (v32)
    {
LABEL_50:
      unint64_t v35 = __clz(__rbit64(v32));
      v32 &= v32 - 1;
      unint64_t v36 = v35 | (v34 << 6);
      goto LABEL_51;
    }
    while (1)
    {
      int64_t v37 = v34 + 1;
      if (__OFADD__(v34, 1))
      {
        __break(1u);
LABEL_79:
        __break(1u);
        break;
      }
      if (v37 >= v33) {
        goto LABEL_44;
      }
      unint64_t v38 = *(void *)(v27 + 8 * v37);
      ++v34;
      if (!v38)
      {
        int64_t v34 = v37 + 1;
        if (v37 + 1 >= v33) {
          goto LABEL_44;
        }
        unint64_t v38 = *(void *)(v27 + 8 * v34);
        if (!v38)
        {
          int64_t v34 = v37 + 2;
          if (v37 + 2 >= v33) {
            goto LABEL_44;
          }
          unint64_t v38 = *(void *)(v27 + 8 * v34);
          if (!v38)
          {
            int64_t v39 = v37 + 3;
            if (v39 >= v33)
            {
LABEL_44:
              swift_release();
              unint64_t v26 = v51;
              double v20 = v53;
              if (v51 == v50) {
                goto LABEL_76;
              }
              goto LABEL_45;
            }
            unint64_t v38 = *(void *)(v27 + 8 * v39);
            if (!v38)
            {
              while (1)
              {
                int64_t v34 = v39 + 1;
                if (__OFADD__(v39, 1)) {
                  goto LABEL_79;
                }
                if (v34 >= v33) {
                  goto LABEL_44;
                }
                unint64_t v38 = *(void *)(v27 + 8 * v34);
                ++v39;
                if (v38) {
                  goto LABEL_66;
                }
              }
            }
            int64_t v34 = v39;
          }
        }
      }
LABEL_66:
      unint64_t v32 = (v38 - 1) & v38;
      unint64_t v36 = __clz(__rbit64(v38)) + (v34 << 6);
LABEL_51:
      if (*(void *)(*(void *)(*(void *)&v53 + 56) + 8 * v36) == v29)
      {
        v40 = (uint64_t *)(*(void *)(*(void *)&v53 + 48) + 16 * v36);
        uint64_t v41 = v40[1];
        uint64_t v52 = *v40;
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v28 = sub_100002E18(0, *((void *)v28 + 2) + 1, 1, v28);
        }
        unint64_t v43 = *((void *)v28 + 2);
        unint64_t v42 = *((void *)v28 + 3);
        v44 = v28;
        if (v43 >= v42 >> 1) {
          v44 = sub_100002E18((char *)(v42 > 1), v43 + 1, 1, v28);
        }
        *((void *)v44 + 2) = v43 + 1;
        v28 = v44;
        v45 = &v44[16 * v43];
        *((void *)v45 + 4) = v52;
        *((void *)v45 + 5) = v41;
        if (v32) {
          goto LABEL_50;
        }
      }
      else if (v32)
      {
        goto LABEL_50;
      }
    }
  }
  __break(1u);
LABEL_81:
  swift_once();
LABEL_77:
  uint64_t v46 = qword_100008A78;
  v47 = v2;
  uint64_t v48 = swift_bridgeObjectRetain();
  v49 = sub_100003040(v48, (uint64_t)v47);
  swift_bridgeObjectRelease_n();

  *(void *)(v46 + 32) = v49;
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_100002868(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)(a1 + *a4) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
  return 1;
}

id sub_1000028CC()
{
  *(void *)&v0[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration] = 0;
  *(void *)&v0[OBJC_IVAR___MicrophoneTestInputs_stringProperties] = 0;
  *(void *)&v0[OBJC_IVAR___MicrophoneTestInputs_microphoneSequence] = _swiftEmptyArrayStorage;
  v1 = &v0[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey];
  *(void *)v1 = 0xD000000000000016;
  *((void *)v1 + 1) = 0x8000000100003770;
  v2 = &v0[OBJC_IVAR___MicrophoneTestInputs_stringPropertiesKey];
  *(void *)v2 = 0xD000000000000010;
  *((void *)v2 + 1) = 0x8000000100003790;
  uint64_t v3 = &v0[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey];
  *(void *)uint64_t v3 = 0x65636E6575716573;
  *((void *)v3 + 1) = 0xE800000000000000;
  uint64_t v4 = &v0[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey];
  *(void *)uint64_t v4 = 0x6D6F437475706E69;
  *((void *)v4 + 1) = 0xEF73746E656E6F70;
  uint64_t v5 = OBJC_IVAR___MicrophoneTestInputs_microphoneNameMapping;
  uint64_t v6 = v0;
  *(void *)&v0[v5] = sub_100001F60((uint64_t)&off_100004240);
  *(void *)&v6[OBJC_IVAR___MicrophoneTestInputs_predicates] = &_swiftEmptyDictionarySingleton;
  *(void *)&v6[OBJC_IVAR___MicrophoneTestInputs_parameters] = &_swiftEmptyDictionarySingleton;
  *(void *)&v6[OBJC_IVAR___MicrophoneTestInputs_specifications] = &_swiftEmptyDictionarySingleton;

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for MicrophoneTestInputs();
  return [super init];
}

id sub_100002A50()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestInputs();
  return [super dealloc];
}

uint64_t type metadata accessor for MicrophoneTestInputs()
{
  return self;
}

unint64_t sub_100002B84(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100002D34(a1, a2, v4);
}

uint64_t sub_100002BFC(uint64_t a1)
{
  uint64_t v2 = sub_100002C5C(&qword_1000088E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100002C5C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002CA0()
{
  unint64_t result = qword_1000088F8;
  if (!qword_1000088F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000088F8);
  }
  return result;
}

unint64_t sub_100002CF4()
{
  unint64_t result = qword_100008900;
  if (!qword_100008900)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008900);
  }
  return result;
}

unint64_t sub_100002D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
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

char *sub_100002E18(char *result, int64_t a2, char a3, char *a4)
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
    sub_100002C5C(&qword_100008920);
    char v10 = (char *)swift_allocObject();
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
    char v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
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

char *sub_100002F1C(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100002F3C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_100002F3C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100002C5C(&qword_100008920);
    char v10 = (char *)swift_allocObject();
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
    char v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
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

void *sub_100003040(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100002F1C(0, v2, 0);
    uint64_t v5 = *(void *)(a2 + OBJC_IVAR___MicrophoneTestInputs_microphoneNameMapping);
    unint64_t v6 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v7 = *v6;
      if (*(void *)(v5 + 16))
      {
        uint64_t v8 = *(v6 - 1);
        swift_bridgeObjectRetain_n();
        unint64_t v9 = sub_100002B84(v8, v7);
        if (v10)
        {
          int64_t v11 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v9);
          uint64_t v12 = *v11;
          unint64_t v13 = v11[1];
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v12 = 0;
          unint64_t v13 = 0xE000000000000000;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v12 = 0;
        unint64_t v13 = 0xE000000000000000;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease_n();
      unint64_t v15 = _swiftEmptyArrayStorage[2];
      unint64_t v14 = _swiftEmptyArrayStorage[3];
      if (v15 >= v14 >> 1) {
        sub_100002F1C((char *)(v14 > 1), v15 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v15 + 1;
      uint64_t v16 = (char *)&_swiftEmptyArrayStorage[2 * v15];
      *((void *)v16 + 4) = v12;
      *((void *)v16 + 5) = v13;
      v6 += 2;
      --v2;
    }
    while (v2);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100003198(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_1000031F8()
{
  type metadata accessor for MicrophoneTestSharedData();
  unint64_t result = (void *)swift_allocObject();
  result[2] = 0x4008000000000000;
  result[3] = 100;
  result[4] = _swiftEmptyArrayStorage;
  qword_100008A78 = (uint64_t)result;
  return result;
}

uint64_t sub_10000323C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for MicrophoneTestSharedData()
{
  return self;
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
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

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

{
}

{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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