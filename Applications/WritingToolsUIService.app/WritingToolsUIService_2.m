uint64_t sub_10016B810()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);

  *(void *)(v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__session) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__task) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__suggestions) = &_swiftEmptyArrayStorage;
  swift_retain();
  *(void *)(v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__suggestionContextMapping) = sub_100005DF4((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)(v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__expandedSuggestion) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__suggestionStates) = sub_100005E08((uint64_t)&_swiftEmptyArrayStorage);
  v1 = (void *)(v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__modelInfoString);
  *v1 = 0;
  v1[1] = 0xE000000000000000;
  v2 = (void *)(v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__inputStringForFeedback);
  *v2 = 0;
  v2[1] = 0xE000000000000000;
  *(void *)(v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__analyticsInstance) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__showingOriginal) = 0;
  v3 = v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__mostRecentlyReviewedSuggestionUUID;
  v4 = type metadata accessor for UUID();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5(v3, 1, 1, v4);
  ObservationRegistrar.init()();
  swift_release();
  swift_unknownObjectWeakInit();
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  *(unsigned char *)(v0 + 72) = -1;
  *(void *)(v0 + 80) = 0;
  *(unsigned char *)(v0 + 88) = 0;
  *(void *)(v0 + 96) = 0;
  *(unsigned char *)(v0 + 104) = 0;
  *(void *)(v0 + 112) = 0;
  *(unsigned char *)(v0 + 120) = 0;
  ObservationRegistrar.init()();
  return v0;
}

uint64_t sub_10016B9B4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10002784C(v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__mostRecentlyReviewedSuggestionUUID, (uint64_t *)&unk_1001FB400);
  uint64_t v1 = v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

uint64_t ProofreadingModel.deinit()
{
  sub_10002F7E4(v0 + 16);

  swift_bridgeObjectRelease();
  sub_100024DB4(*(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_bridgeObjectRelease();
  swift_errorRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC21WritingToolsUIService9ToolModel___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10002784C(v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__mostRecentlyReviewedSuggestionUUID, (uint64_t *)&unk_1001FB400);
  v3(v0 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel___observationRegistrar, v2);
  return v0;
}

uint64_t ProofreadingModel.__deallocating_deinit()
{
  ProofreadingModel.deinit();

  return swift_deallocClassInstance();
}

uint64_t sub_10016BCA4()
{
  return type metadata accessor for ProofreadingModel();
}

uint64_t type metadata accessor for ProofreadingModel()
{
  uint64_t result = qword_100205328;
  if (!qword_100205328) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10016BCF8()
{
  sub_10000EB90();
  if (v0 <= 0x3F)
  {
    type metadata accessor for ObservationRegistrar();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

id sub_10016BDF8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100164764(a1, &OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__session, a2);
}

uint64_t sub_10016BE24@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100164E4C(a1, &OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__task, a2);
}

void sub_10016BE50()
{
  sub_1001641BC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10016BE74@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_1001644F8(a1, &OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__suggestions, a2);
}

uint64_t sub_10016BEA0()
{
  return sub_100069518(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__suggestions);
}

uint64_t sub_10016BEC4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_1001644F8(a1, &OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__suggestionContextMapping, a2);
}

uint64_t sub_10016BEF0()
{
  return sub_100069518(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__suggestionContextMapping);
}

id sub_10016BF14@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100164764(a1, &OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__expandedSuggestion, a2);
}

void sub_10016BF40()
{
}

uint64_t sub_10016BF58@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_1001644F8(a1, &OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__suggestionStates, a2);
}

uint64_t sub_10016BF84()
{
  return sub_100069518(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__suggestionStates);
}

id sub_10016BFA8(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v5 == v29) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0) {
    uint64_t v6 = v3;
  }
  if (!v4) {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v8 = v9;
  }
  if (v6 == v8)
  {
LABEL_38:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v30 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v3 + 32); ; id result = (id)specialized _ArrayBuffer._getElementSlowPath(_:)())
  {
    v11 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_22:
    v13 = v12;
    sub_1000085FC(0, &qword_1001FD300);
    char v14 = static NSObject.== infix(_:_:)();

    if ((v14 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v15 = v5 - 1;
    if (v5 == 1) {
      return (id)(v5 & 1);
    }
    if (((a2 | v3) & 0xC000000000000001) != 0)
    {
      uint64_t v16 = 0;
      unint64_t v17 = v5 - 2;
      while (v15 != v16)
      {
        unint64_t v5 = v16 + 1;
        if (v30) {
          id v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v18 = *(id *)(v3 + 40 + 8 * v16);
        }
        v19 = v18;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v16);
        }
        v21 = v20;
        unint64_t v5 = static NSObject.== infix(_:_:)();

        if ((v5 & 1) != 0 && v17 != v16++) {
          continue;
        }
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v23 = *(void *)(v7 + 16);
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      unint64_t v24 = v23 - 1;
      v25 = (void **)(v3 + 40);
      uint64_t v7 = a2 + 40;
      while (v15)
      {
        if (!v24) {
          goto LABEL_53;
        }
        v27 = *v25++;
        v26 = v27;
        v28 = *(void **)v7;
        v7 += 8;
        a2 = v26;
        uint64_t v3 = v28;
        unint64_t v5 = static NSObject.== infix(_:_:)();

        if (v5)
        {
          --v24;
          if (--v15) {
            continue;
          }
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    ;
  }
  if (*(void *)(v7 + 16))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

double sub_10016C294@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_100007C48(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10017017C();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1000085E4((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_10016EA30(v8, v11);
    *unint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_10016C3A0(uint64_t a1)
{
  return sub_10016C400(a1, (uint64_t)&qword_1001FAFB0, (void (*)(uint64_t))sub_10017094C);
}

uint64_t sub_10016C3C0(uint64_t a1)
{
  return sub_10016C400(a1, (uint64_t)&qword_1001FAFA0, (void (*)(uint64_t))sub_10017094C);
}

uint64_t sub_10016C3E0(uint64_t a1)
{
  return sub_10016C400(a1, (uint64_t)&qword_1001FB008, (void (*)(uint64_t))sub_100171108);
}

uint64_t sub_10016C400(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v6 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_100007B70(a1);
  LOBYTE(a1) = v9;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v6;
  uint64_t v16 = *v6;
  *uint64_t v6 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a3(a2);
    uint64_t v11 = v16;
  }
  uint64_t v12 = *(void *)(v11 + 48);
  uint64_t v13 = type metadata accessor for UUID();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12 + *(void *)(*(void *)(v13 - 8) + 72) * v8, v13);
  uint64_t v14 = *(void *)(*(void *)(v11 + 56) + 8 * v8);
  sub_10016EC1C(v8, v11);
  *uint64_t v6 = v11;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_10016C510(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_100007B70(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100170E70();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = type metadata accessor for UUID();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_10016EC1C(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10016C608(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000063C0(&qword_1001FAF78);
  char v39 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
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
  v36 = v2;
  int64_t v37 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    v31 = *(void **)(*(void *)(v5 + 48) + v30);
    v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((v39 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v14 = Hasher._finalize()();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10016C938(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000063C0(&qword_1001FAF18);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    id v34 = (void *)(v5 + 64);
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
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *id v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
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
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_100007CC0(v24, v35);
      }
      else
      {
        sub_100027E0C((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
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
            goto LABEL_40;
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
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_100007CC0(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10016CC38(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000063C0(&qword_1001FAFB8);
  char v37 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  id v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    unint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
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
    uint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_1000085E4(v25, (uint64_t)v38);
    }
    else
    {
      sub_1000251D0((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *uint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_1000085E4(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10016CF60(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_1000063C0(&qword_1001FAFE8);
  int v42 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    char v37 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    char v39 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v38 = (unint64_t)(v12 + 63) >> 6;
    v40 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    uint64_t v44 = v5;
    for (i = v6; ; uint64_t v6 = i)
    {
      if (v15)
      {
        unint64_t v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v21 = v20 | (v18 << 6);
      }
      else
      {
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v38) {
          goto LABEL_34;
        }
        unint64_t v23 = v39[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v38) {
            goto LABEL_34;
          }
          unint64_t v23 = v39[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v37;
              if (v42)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v9 + 32);
                if (v36 >= 64) {
                  bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v39 = -1 << v36;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v38) {
                  goto LABEL_34;
                }
                unint64_t v23 = v39[v18];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v24;
          }
        }
LABEL_21:
        unint64_t v15 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      uint64_t v25 = *(void *)(v6 + 72);
      unint64_t v26 = *(void *)(v9 + 48) + v25 * v21;
      if (v42) {
        (*v43)(v8, v26, v44);
      }
      else {
        (*v40)(v8, v26, v44);
      }
      uint64_t v27 = v9;
      uint64_t v28 = *(void *)(*(void *)(v9 + 56) + 8 * v21);
      sub_100174B54(&qword_1001FAF58, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v29 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v16 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v19 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v43)(*(void *)(v11 + 48) + v25 * v19, v8, v44);
      *(void *)(*(void *)(v11 + 56) + 8 * v19) = v28;
      ++*(void *)(v11 + 16);
      uint64_t v9 = v27;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_10016D384(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v5 = v3;
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v3;
  sub_1000063C0(a3);
  int v48 = a2;
  uint64_t v12 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v13 = v11;
  uint64_t v14 = v12;
  if (!*(void *)(v13 + 16)) {
    goto LABEL_41;
  }
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v16 = *(void *)(v13 + 64);
  uint64_t v44 = (void *)(v13 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1 << v15);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v16;
  int v42 = v5;
  int64_t v43 = (unint64_t)(v15 + 63) >> 6;
  v45 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v47 = v8;
  unint64_t v19 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v20 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v22 = 0;
  for (i = v13; ; uint64_t v13 = i)
  {
    if (v18)
    {
      unint64_t v24 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v25 = v24 | (v22 << 6);
      goto LABEL_22;
    }
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v26 >= v43) {
      break;
    }
    uint64_t v27 = v44;
    unint64_t v28 = v44[v26];
    ++v22;
    if (!v28)
    {
      int64_t v22 = v26 + 1;
      if (v26 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v28 = v44[v22];
      if (!v28)
      {
        int64_t v29 = v26 + 2;
        if (v29 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v5 = v42;
          if ((v48 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v28 = v44[v29];
        if (!v28)
        {
          while (1)
          {
            int64_t v22 = v29 + 1;
            if (__OFADD__(v29, 1)) {
              goto LABEL_43;
            }
            if (v22 >= v43) {
              goto LABEL_34;
            }
            unint64_t v28 = v44[v22];
            ++v29;
            if (v28) {
              goto LABEL_21;
            }
          }
        }
        int64_t v22 = v29;
      }
    }
LABEL_21:
    unint64_t v18 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v22 << 6);
LABEL_22:
    uint64_t v30 = *(void *)(v47 + 72);
    unint64_t v31 = *(void *)(v13 + 48) + v30 * v25;
    if (v48)
    {
      (*v19)(v10, v31, v7);
      uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v25);
    }
    else
    {
      (*v45)(v10, v31, v7);
      uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v25);
      swift_retain();
    }
    sub_100174B54(&qword_1001FAF58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v33 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v20 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v23 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v20 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v19)(*(void *)(v14 + 48) + v30 * v23, v10, v7);
    *(void *)(*(void *)(v14 + 56) + 8 * v23) = v32;
    ++*(void *)(v14 + 16);
  }
  swift_release();
  uint64_t v5 = v42;
  uint64_t v27 = v44;
  if ((v48 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v13 + 32);
  if (v40 >= 64) {
    bzero(v27, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v27 = -1 << v40;
  }
  *(void *)(v13 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v5 = v14;
  return result;
}

uint64_t sub_10016D7AC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000063C0(&qword_1001FAF80);
  char v42 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    unint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    unint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    void *v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *uint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10016DAD4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000063C0(&qword_1001FB1A8);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    char v35 = a2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v15 << 6);
      }
      else
      {
        int64_t v20 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v20 >= v12) {
          goto LABEL_31;
        }
        unint64_t v21 = v9[v20];
        ++v15;
        if (!v21)
        {
          int64_t v15 = v20 + 1;
          if (v20 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v21 = v9[v15];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v12)
            {
LABEL_31:
              swift_release();
              if ((v35 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
              if (v34 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v9 = -1 << v34;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v9[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v15 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_40;
                }
                if (v15 >= v12) {
                  goto LABEL_31;
                }
                unint64_t v21 = v9[v15];
                ++v22;
                if (v21) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v15 = v22;
          }
        }
LABEL_21:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v15 << 6);
      }
      int64_t v23 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v19);
      uint64_t v25 = *v23;
      uint64_t v24 = v23[1];
      uint64_t v26 = *(void *)(*(void *)(v5 + 56) + 8 * v19);
      Hasher.init(_seed:)();
      UnitPoint.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v27 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v13 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v13 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v13 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      unint64_t v17 = (void *)(*(void *)(v7 + 48) + 16 * v16);
      *unint64_t v17 = v25;
      v17[1] = v24;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v26;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10016DDC0(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_1000063C0(&qword_1001FB018);
  int v42 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    uint64_t v37 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    uint64_t v39 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v38 = (unint64_t)(v12 + 63) >> 6;
    int64_t v40 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    int64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    uint64_t v44 = v5;
    for (i = v6; ; uint64_t v6 = i)
    {
      if (v15)
      {
        unint64_t v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v21 = v20 | (v18 << 6);
      }
      else
      {
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v38) {
          goto LABEL_34;
        }
        unint64_t v23 = v39[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v38) {
            goto LABEL_34;
          }
          unint64_t v23 = v39[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v37;
              if (v42)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v9 + 32);
                if (v36 >= 64) {
                  bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v39 = -1 << v36;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v38) {
                  goto LABEL_34;
                }
                unint64_t v23 = v39[v18];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v24;
          }
        }
LABEL_21:
        unint64_t v15 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      uint64_t v25 = *(void *)(v6 + 72);
      unint64_t v26 = *(void *)(v9 + 48) + v25 * v21;
      if (v42) {
        (*v43)(v8, v26, v44);
      }
      else {
        (*v40)(v8, v26, v44);
      }
      uint64_t v27 = v9;
      char v28 = *(unsigned char *)(*(void *)(v9 + 56) + v21);
      sub_100174B54(&qword_1001FAF58, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v29 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v16 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v19 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v43)(*(void *)(v11 + 48) + v25 * v19, v8, v44);
      *(unsigned char *)(*(void *)(v11 + 56) + v19) = v28;
      ++*(void *)(v11 + 16);
      uint64_t v9 = v27;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_10016E1E4(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_1000063C0(&qword_1001FAF70);
  int v46 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  int v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  int64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  int64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  unint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    uint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_100174B54(&qword_1001FAF58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v21 * v28, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  uint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_10016E608(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v5 = v3;
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v3;
  sub_1000063C0(a3);
  int v48 = a2;
  uint64_t v12 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v13 = v11;
  uint64_t v14 = v12;
  if (!*(void *)(v13 + 16)) {
    goto LABEL_41;
  }
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v16 = *(void *)(v13 + 64);
  uint64_t v44 = (void *)(v13 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1 << v15);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v16;
  int v42 = v5;
  int64_t v43 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v47 = v8;
  unint64_t v19 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v20 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v22 = 0;
  for (i = v13; ; uint64_t v13 = i)
  {
    if (v18)
    {
      unint64_t v24 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v25 = v24 | (v22 << 6);
      goto LABEL_22;
    }
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v26 >= v43) {
      break;
    }
    int64_t v27 = v44;
    unint64_t v28 = v44[v26];
    ++v22;
    if (!v28)
    {
      int64_t v22 = v26 + 1;
      if (v26 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v28 = v44[v22];
      if (!v28)
      {
        int64_t v29 = v26 + 2;
        if (v29 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v5 = v42;
          if ((v48 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v28 = v44[v29];
        if (!v28)
        {
          while (1)
          {
            int64_t v22 = v29 + 1;
            if (__OFADD__(v29, 1)) {
              goto LABEL_43;
            }
            if (v22 >= v43) {
              goto LABEL_34;
            }
            unint64_t v28 = v44[v22];
            ++v29;
            if (v28) {
              goto LABEL_21;
            }
          }
        }
        int64_t v22 = v29;
      }
    }
LABEL_21:
    unint64_t v18 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v22 << 6);
LABEL_22:
    uint64_t v30 = *(void *)(v47 + 72);
    unint64_t v31 = *(void *)(v13 + 48) + v30 * v25;
    if (v48)
    {
      (*v19)(v10, v31, v7);
      id v32 = *(id *)(*(void *)(v13 + 56) + 8 * v25);
    }
    else
    {
      (*v45)(v10, v31, v7);
      id v32 = *(id *)(*(void *)(v13 + 56) + 8 * v25);
    }
    sub_100174B54(&qword_1001FAF58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v33 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v20 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v23 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v20 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v19)(*(void *)(v14 + 48) + v30 * v23, v10, v7);
    *(void *)(*(void *)(v14 + 56) + 8 * v23) = v32;
    ++*(void *)(v14 + 16);
  }
  swift_release();
  uint64_t v5 = v42;
  int64_t v27 = v44;
  if ((v48 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v13 + 32);
  if (v40 >= 64) {
    bzero(v27, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v27 = -1 << v40;
  }
  *(void *)(v13 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v5 = v14;
  return result;
}

unint64_t sub_10016EA30(unint64_t result, uint64_t a2)
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
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v11 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          uint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *uint64_t v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          unint64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  uint64_t *v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10016EC1C(int64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = _HashTable.previousHole(before:)();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      id v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_100174B54(&qword_1001FAF58, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v17 = dispatch thunk of Hashable._rawHashValue(seed:)();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            BOOL v23 = (void *)(v22 + 8 * a1);
            uint64_t v24 = (void *)(v22 + 8 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *BOOL v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    unint64_t v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    unint64_t v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  *unint64_t v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_10016EF14(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_100007C44((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_10016FDEC();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_10016C608(v12, a3 & 1);
  unint64_t v17 = sub_100007C44((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    type metadata accessor for IAPayloadKey(0);
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v22;

  id v23 = a2;
}

_OWORD *sub_10016F078(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_100007C48(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10016FF94();
      goto LABEL_7;
    }
    sub_10016C938(v15, a4 & 1);
    unint64_t v21 = sub_100007C48(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    unint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_100027DBC((uint64_t)v19);
    return sub_100007CC0(a1, v19);
  }
LABEL_13:
  sub_10016FBA0(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_10016F1CC(uint64_t a1, uint64_t a2, char a3)
{
  return sub_10016F4E4(a1, a2, a3, &qword_1001FAF90);
}

uint64_t sub_10016F1D8(long long *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_100007C48(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10017017C();
      goto LABEL_7;
    }
    sub_10016CC38(v15, a4 & 1);
    unint64_t v21 = sub_100007C48(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7] + 40 * v12;
    sub_100027DBC(v19);
    return sub_1000085E4(a1, v19);
  }
LABEL_13:
  sub_10016FC0C(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_10016F330(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_100007B70(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= result && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      *(void *)(v20[7] + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100170368();
    goto LABEL_7;
  }
  sub_10016CF60(result, a3 & 1);
  uint64_t result = sub_100007B70(a2);
  if ((v18 & 1) != (v21 & 1))
  {
LABEL_14:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = result;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_10016FC7C(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_10016F4CC(uint64_t a1, uint64_t a2, char a3)
{
  return sub_10016F4E4(a1, a2, a3, &qword_1001FAFB0);
}

uint64_t sub_10016F4D8(uint64_t a1, uint64_t a2, char a3)
{
  return sub_10016F4E4(a1, a2, a3, &qword_1001FAFA0);
}

uint64_t sub_10016F4E4(uint64_t a1, uint64_t a2, char a3, uint64_t *a4)
{
  unint64_t v6 = (void **)v4;
  uint64_t v27 = a1;
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = (void *)*v4;
  unint64_t v15 = sub_100007B70(a2);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a3 & 1) != 0)
  {
LABEL_7:
    char v21 = *v6;
    if (v19)
    {
LABEL_8:
      uint64_t v22 = v21[7];
      uint64_t result = swift_release();
      *(void *)(v22 + 8 * v15) = v27;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a3 & 1) == 0)
  {
    sub_10017094C(a4);
    goto LABEL_7;
  }
  sub_10016D384(v18, a3 & 1, a4);
  unint64_t v24 = sub_100007B70(a2);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v15 = v24;
  char v21 = *v6;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, v9);
  return sub_10016FC7C(v15, (uint64_t)v12, v27, v21);
}

uint64_t sub_10016F6A0(char a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_100007B70(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= result && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      *(unsigned char *)(v20[7] + v14) = a1 & 1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100170BE0();
    goto LABEL_7;
  }
  sub_10016DDC0(result, a3 & 1);
  uint64_t result = sub_100007B70(a2);
  if ((v18 & 1) != (v21 & 1))
  {
LABEL_14:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = result;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_10016FD34(v14, (uint64_t)v11, a1 & 1, v20);
}

void sub_10016F840(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_100007B70(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_100171108(&qword_1001FB008);
    goto LABEL_7;
  }
  sub_10016E608(v17, a3 & 1, &qword_1001FB008);
  unint64_t v22 = sub_100007B70(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_10016FC7C(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_10016F9F8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_100007B70(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_100170E70();
    goto LABEL_7;
  }
  sub_10016E1E4(v17, a3 & 1);
  unint64_t v23 = sub_100007B70(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_10016FC7C(v14, (uint64_t)v11, a1, v20);
}

_OWORD *sub_10016FBA0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100007CC0(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_10016FC0C(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1000085E4(a4, a5[7] + 40 * a1);
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_10016FC7C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_10016FD34(unint64_t a1, uint64_t a2, char a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(unsigned char *)(a4[7] + a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

id sub_10016FDEC()
{
  unint64_t v1 = v0;
  sub_1000063C0(&qword_1001FAF78);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
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
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    char v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
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

void *sub_10016FF94()
{
  unint64_t v1 = v0;
  sub_1000063C0(&qword_1001FAF18);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  id result = (void *)(v3 + 64);
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
      goto LABEL_30;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_100027E0C(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_100007CC0(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    unint64_t v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

void *sub_10017017C()
{
  unint64_t v1 = v0;
  sub_1000063C0(&qword_1001FAFB8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  id result = (void *)(v3 + 64);
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
      goto LABEL_30;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 40 * v15;
    sub_1000251D0(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_1000085E4(v26, *(void *)(v4 + 56) + v20);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    unint64_t v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

void *sub_100170368()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000063C0(&qword_1001FAFE8);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (void *)swift_release();
    *unint64_t v23 = v7;
    return result;
  }
  id result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + v17);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_1001705FC()
{
  uint64_t v1 = v0;
  sub_1000063C0(&qword_1001FAF80);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    unint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *uint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1001707B8()
{
  uint64_t v1 = v0;
  sub_1000063C0(&qword_1001FB1A8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    unint64_t v22 = __clz(__rbit64(v20));
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = v22 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v17);
    *(_OWORD *)(*(void *)(v4 + 48) + v16) = *(_OWORD *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v17) = v18;
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

void *sub_10017094C(uint64_t *a1)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000063C0(a1);
  unint64_t v26 = v1;
  uint64_t v7 = *v1;
  uint64_t v8 = static _DictionaryStorage.copy(original:)();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v26 = v9;
    return result;
  }
  id result = (void *)(v8 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    id result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  int64_t v13 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v7 + 64);
  uint64_t v27 = v7 + 64;
  int64_t v28 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v29 = v4 + 32;
  uint64_t v30 = v4 + 16;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v27 + 8 * v13);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v16 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    unint64_t v19 = *(void *)(v4 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v7 + 48) + v19, v3);
    uint64_t v20 = 8 * v18;
    uint64_t v21 = *(void *)(*(void *)(v7 + 56) + 8 * v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v9 + 48) + v19, v6, v3);
    *(void *)(*(void *)(v9 + 56) + v20) = v21;
    id result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v28) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v27 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100170BE0()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000063C0(&qword_1001FB018);
  int64_t v22 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (void *)swift_release();
    *int64_t v22 = v7;
    return result;
  }
  id result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v23 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v26 = v2 + 16;
  int64_t v24 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v25 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v18 >= v24) {
      goto LABEL_23;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_23;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v10);
      if (!v19) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    char v17 = *(unsigned char *)(*(void *)(v5 + 56) + v15);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(unsigned char *)(*(void *)(v7 + 56) + v15) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v24) {
    goto LABEL_23;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v24) {
      goto LABEL_23;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_100170E70()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000063C0(&qword_1001FAF70);
  int64_t v24 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v5 + 16);
  if (!v8)
  {
LABEL_23:
    id result = (void *)swift_release();
    *int64_t v24 = v7;
    return result;
  }
  id result = (void *)(v6 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10)
  {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v10);
    uint64_t v8 = *(void *)(v5 + 16);
  }
  int64_t v11 = 0;
  *(void *)(v7 + 16) = v8;
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  uint64_t v25 = v5 + 64;
  int64_t v26 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v27 = v2 + 32;
  uint64_t v28 = v2 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v20 >= v26) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v11);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v17, v1);
    uint64_t v18 = 8 * v16;
    uint64_t v19 = *(void *)(*(void *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v17, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v18) = v19;
    id result = (void *)swift_retain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v26) {
    goto LABEL_23;
  }
  unint64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_100171108(uint64_t *a1)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000063C0(a1);
  int64_t v26 = v1;
  uint64_t v7 = *v1;
  uint64_t v8 = static _DictionaryStorage.copy(original:)();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v26 = v9;
    return result;
  }
  id result = (id)(v8 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    id result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  uint64_t v27 = v7 + 64;
  int64_t v13 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v7 + 64);
  uint64_t v30 = v4 + 16;
  int64_t v28 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v29 = v4 + 32;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v27 + 8 * v13);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v16 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    unint64_t v19 = *(void *)(v4 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v7 + 48) + v19, v3);
    uint64_t v20 = 8 * v18;
    unint64_t v21 = *(void **)(*(void *)(v7 + 56) + v20);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v9 + 48) + v19, v6, v3);
    *(void *)(*(void *)(v9 + 56) + v20) = v21;
    id result = v21;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v28) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v27 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10017139C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return _swiftEmptyArrayStorage;
    }
    uint64_t v8 = 2 * v5;
    if (v5 <= 0)
    {
      uint64_t v9 = _swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 16 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        swift_arrayInitWithCopy();
        return v9;
      }
    }
    else
    {
      sub_1000063C0(&qword_100201018);
      uint64_t v9 = (void *)swift_allocObject();
      int64_t v10 = j__malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 17;
      }
      v9[2] = v5;
      v9[3] = 2 * (v11 >> 4);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  id result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_100171510(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_1000063C0(&qword_100203FD8);
  uint64_t v3 = *(void *)(sub_1000063C0(&qword_1001FEFA8) - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  id result = (void *)j__malloc_size(v6);
  if (v4)
  {
    if ((void *)((char *)result - v5) != (void *)0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)((uint64_t)result - v5) / v4);
      uint64_t v9 = *(void *)(sub_1000063C0(&qword_1001FEFA8) - 8);
      uint64_t v10 = sub_100172964(&v11, (uint64_t)v6 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), v1, a1);
      swift_bridgeObjectRetain();
      sub_100174EC4();
      if (v10 == v1) {
        return v6;
      }
      __break(1u);
      return _swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1001716A4(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int v4 = _minimumMergeRunLength(_:)(v3);
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_132;
    }
    if (v3) {
      sub_100171E18(0, v3, 1, a1);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_140;
  }
  Swift::Int v104 = v4;
  v99 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = (char *)_swiftEmptyArrayStorage;
    uint64_t v111 = (uint64_t)_swiftEmptyArrayStorage;
    v110 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v11 = _swiftEmptyArrayStorage[2];
LABEL_98:
      if (v11 >= 2)
      {
        uint64_t v93 = *v99;
        do
        {
          unint64_t v94 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_127;
          }
          if (!v93) {
            goto LABEL_139;
          }
          uint64_t v95 = *(void *)&v8[16 * v94 + 32];
          uint64_t v96 = *(void *)&v8[16 * v11 + 24];
          sub_100171F0C((id *)(v93 + 8 * v95), (id *)(v93 + 8 * *(void *)&v8[16 * v11 + 16]), v93 + 8 * v96, v110);
          if (v1) {
            break;
          }
          if (v96 < v95) {
            goto LABEL_128;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v8 = sub_10017260C((uint64_t)v8);
          }
          if (v94 >= *((void *)v8 + 2)) {
            goto LABEL_129;
          }
          v97 = &v8[16 * v94 + 32];
          *(void *)v97 = v95;
          *((void *)v97 + 1) = v96;
          unint64_t v98 = *((void *)v8 + 2);
          if (v11 > v98) {
            goto LABEL_130;
          }
          memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v98 - v11));
          *((void *)v8 + 2) = v98 - 1;
          unint64_t v11 = v98 - 1;
        }
        while (v98 > 2);
      }
LABEL_109:
      swift_bridgeObjectRelease();
      *(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    sub_1000085FC(0, (unint64_t *)&qword_100201570);
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    v110 = (void **)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v111 = v7;
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v100 = *a1 - 8;
  uint64_t v101 = *a1 + 16;
  uint64_t v8 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v107 = v3;
  while (1)
  {
    Swift::Int v12 = v9++;
    Swift::Int v108 = v12;
    if (v9 < v3)
    {
      int64_t v13 = *(void **)(v10 + 8 * v12);
      id v14 = *(id *)(v10 + 8 * v9);
      id v15 = v13;
      id v105 = [v14 originalRange];
      id v16 = [v15 originalRange];

      Swift::Int v3 = v107;
      Swift::Int v9 = v12 + 2;
      if (v12 + 2 < v107)
      {
        v102 = v8;
        unint64_t v17 = (id *)(v101 + 8 * v12);
        while (1)
        {
          unint64_t v18 = *(v17 - 1);
          id v19 = *v17;
          id v20 = v18;
          id v21 = [v19 originalRange];
          id v22 = [v20 originalRange];

          if ((uint64_t)v105 < (uint64_t)v16 == (uint64_t)v21 >= (uint64_t)v22) {
            break;
          }
          ++v9;
          ++v17;
          Swift::Int v3 = v107;
          if (v107 == v9)
          {
            Swift::Int v9 = v107;
            uint64_t v8 = v102;
            goto LABEL_22;
          }
        }
        uint64_t v8 = v102;
        Swift::Int v3 = v107;
LABEL_22:
        Swift::Int v12 = v108;
      }
      if ((uint64_t)v105 < (uint64_t)v16)
      {
        if (v9 < v12) {
          goto LABEL_133;
        }
        if (v12 < v9)
        {
          unint64_t v23 = (uint64_t *)(v100 + 8 * v9);
          Swift::Int v24 = v9;
          Swift::Int v25 = v12;
          int64_t v26 = (uint64_t *)(v10 + 8 * v12);
          do
          {
            if (v25 != --v24)
            {
              if (!v10) {
                goto LABEL_138;
              }
              uint64_t v27 = *v26;
              uint64_t *v26 = *v23;
              *unint64_t v23 = v27;
            }
            ++v25;
            --v23;
            ++v26;
          }
          while (v25 < v24);
        }
      }
    }
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v12)) {
        goto LABEL_131;
      }
      if (v9 - v12 < v104) {
        break;
      }
    }
LABEL_48:
    if (v9 < v12) {
      goto LABEL_126;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v8 = sub_10017222C(0, *((void *)v8 + 2) + 1, 1, v8);
    }
    unint64_t v40 = *((void *)v8 + 2);
    unint64_t v39 = *((void *)v8 + 3);
    unint64_t v11 = v40 + 1;
    if (v40 >= v39 >> 1) {
      uint64_t v8 = sub_10017222C((char *)(v39 > 1), v40 + 1, 1, v8);
    }
    *((void *)v8 + 2) = v11;
    uint64_t v41 = v8 + 32;
    int v42 = &v8[16 * v40 + 32];
    *(void *)int v42 = v12;
    *((void *)v42 + 1) = v9;
    if (v40)
    {
      Swift::Int v109 = v9;
      while (1)
      {
        unint64_t v43 = v11 - 1;
        if (v11 >= 4)
        {
          int v48 = &v41[16 * v11];
          uint64_t v49 = *((void *)v48 - 8);
          uint64_t v50 = *((void *)v48 - 7);
          BOOL v54 = __OFSUB__(v50, v49);
          uint64_t v51 = v50 - v49;
          if (v54) {
            goto LABEL_115;
          }
          uint64_t v53 = *((void *)v48 - 6);
          uint64_t v52 = *((void *)v48 - 5);
          BOOL v54 = __OFSUB__(v52, v53);
          uint64_t v46 = v52 - v53;
          char v47 = v54;
          if (v54) {
            goto LABEL_116;
          }
          unint64_t v55 = v11 - 2;
          v56 = &v41[16 * v11 - 32];
          uint64_t v58 = *(void *)v56;
          uint64_t v57 = *((void *)v56 + 1);
          BOOL v54 = __OFSUB__(v57, v58);
          uint64_t v59 = v57 - v58;
          if (v54) {
            goto LABEL_118;
          }
          BOOL v54 = __OFADD__(v46, v59);
          uint64_t v60 = v46 + v59;
          if (v54) {
            goto LABEL_121;
          }
          if (v60 >= v51)
          {
            v78 = &v41[16 * v43];
            uint64_t v80 = *(void *)v78;
            uint64_t v79 = *((void *)v78 + 1);
            BOOL v54 = __OFSUB__(v79, v80);
            uint64_t v81 = v79 - v80;
            if (v54) {
              goto LABEL_125;
            }
            BOOL v71 = v46 < v81;
            goto LABEL_86;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v72 = *((void *)v8 + 4);
            uint64_t v73 = *((void *)v8 + 5);
            BOOL v54 = __OFSUB__(v73, v72);
            uint64_t v65 = v73 - v72;
            char v66 = v54;
            goto LABEL_80;
          }
          uint64_t v45 = *((void *)v8 + 4);
          uint64_t v44 = *((void *)v8 + 5);
          BOOL v54 = __OFSUB__(v44, v45);
          uint64_t v46 = v44 - v45;
          char v47 = v54;
        }
        if (v47) {
          goto LABEL_117;
        }
        unint64_t v55 = v11 - 2;
        v61 = &v41[16 * v11 - 32];
        uint64_t v63 = *(void *)v61;
        uint64_t v62 = *((void *)v61 + 1);
        BOOL v64 = __OFSUB__(v62, v63);
        uint64_t v65 = v62 - v63;
        char v66 = v64;
        if (v64) {
          goto LABEL_120;
        }
        v67 = &v41[16 * v43];
        uint64_t v69 = *(void *)v67;
        uint64_t v68 = *((void *)v67 + 1);
        BOOL v54 = __OFSUB__(v68, v69);
        uint64_t v70 = v68 - v69;
        if (v54) {
          goto LABEL_123;
        }
        if (__OFADD__(v65, v70)) {
          goto LABEL_124;
        }
        if (v65 + v70 >= v46)
        {
          BOOL v71 = v46 < v70;
LABEL_86:
          if (v71) {
            unint64_t v43 = v55;
          }
          goto LABEL_88;
        }
LABEL_80:
        if (v66) {
          goto LABEL_119;
        }
        v74 = &v41[16 * v43];
        uint64_t v76 = *(void *)v74;
        uint64_t v75 = *((void *)v74 + 1);
        BOOL v54 = __OFSUB__(v75, v76);
        uint64_t v77 = v75 - v76;
        if (v54) {
          goto LABEL_122;
        }
        if (v77 < v65) {
          goto LABEL_14;
        }
LABEL_88:
        unint64_t v82 = v43 - 1;
        if (v43 - 1 >= v11)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
          goto LABEL_135;
        }
        uint64_t v83 = v10;
        if (!v10) {
          goto LABEL_137;
        }
        v84 = v8;
        v85 = &v41[16 * v82];
        uint64_t v86 = *(void *)v85;
        v87 = v41;
        unint64_t v88 = v43;
        v89 = &v41[16 * v43];
        uint64_t v90 = *((void *)v89 + 1);
        uint64_t v91 = v83;
        sub_100171F0C((id *)(v83 + 8 * *(void *)v85), (id *)(v83 + 8 * *(void *)v89), v83 + 8 * v90, v110);
        if (v1) {
          goto LABEL_109;
        }
        if (v90 < v86) {
          goto LABEL_112;
        }
        if (v88 > *((void *)v84 + 2)) {
          goto LABEL_113;
        }
        *(void *)v85 = v86;
        *(void *)&v87[16 * v82 + 8] = v90;
        unint64_t v92 = *((void *)v84 + 2);
        if (v88 >= v92) {
          goto LABEL_114;
        }
        uint64_t v8 = v84;
        unint64_t v11 = v92 - 1;
        memmove(v89, v89 + 16, 16 * (v92 - 1 - v88));
        uint64_t v41 = v87;
        *((void *)v84 + 2) = v92 - 1;
        uint64_t v10 = v91;
        Swift::Int v9 = v109;
        if (v92 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v11 = 1;
LABEL_14:
    Swift::Int v3 = v107;
    if (v9 >= v107) {
      goto LABEL_98;
    }
  }
  if (__OFADD__(v12, v104)) {
    goto LABEL_134;
  }
  if (v12 + v104 >= v3) {
    Swift::Int v28 = v3;
  }
  else {
    Swift::Int v28 = v12 + v104;
  }
  if (v28 >= v12)
  {
    if (v9 != v28)
    {
      v103 = v8;
      uint64_t v29 = v100 + 8 * v9;
      Swift::Int v106 = v28;
      do
      {
        uint64_t v30 = *(void **)(v10 + 8 * v9);
        Swift::Int v31 = v12;
        uint64_t v32 = v29;
        do
        {
          uint64_t v33 = *(void **)v32;
          id v34 = v30;
          id v35 = v33;
          id v36 = [v34 originalRange];
          id v37 = [v35 originalRange];

          if ((uint64_t)v36 >= (uint64_t)v37) {
            break;
          }
          if (!v10) {
            goto LABEL_136;
          }
          BOOL v38 = *(void **)v32;
          uint64_t v30 = *(void **)(v32 + 8);
          *(void *)uint64_t v32 = v30;
          *(void *)(v32 + 8) = v38;
          v32 -= 8;
          ++v31;
        }
        while (v9 != v31);
        ++v9;
        v29 += 8;
        Swift::Int v12 = v108;
      }
      while (v9 != v106);
      Swift::Int v9 = v106;
      uint64_t v8 = v103;
    }
    goto LABEL_48;
  }
LABEL_135:
  __break(1u);
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_100171E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    uint64_t v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v7 = *(void **)(v5 + 8 * v4);
    uint64_t v8 = a1;
    uint64_t v17 = v6;
    while (1)
    {
      Swift::Int v9 = *(void **)v6;
      id v10 = v7;
      id v11 = v9;
      id v12 = [v10 originalRange];
      id v13 = [v11 originalRange];

      if ((uint64_t)v12 >= (uint64_t)v13)
      {
LABEL_4:
        ++v4;
        uint64_t v6 = v17 + 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v5) {
        break;
      }
      id v14 = *(void **)v6;
      uint64_t v7 = *(void **)(v6 + 8);
      *(void *)uint64_t v6 = v7;
      *(void *)(v6 + 8) = v14;
      v6 -= 8;
      if (v4 == ++v8) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_100171F0C(id *__src, id *a2, unint64_t a3, void **a4)
{
  uint64_t v4 = a2;
  uint64_t v5 = __src;
  int64_t v6 = (char *)a2 - (char *)__src;
  int64_t v7 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v7 = (char *)a2 - (char *)__src;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = a3 - (void)a2;
  uint64_t v10 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v10 = a3 - (void)a2;
  }
  uint64_t v11 = v10 >> 3;
  BOOL v38 = __src;
  id v37 = a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != a2 || &a2[v11] <= a4) {
        memmove(a4, a2, 8 * v11);
      }
      id v22 = &a4[v11];
      id v36 = (char *)v22;
      BOOL v38 = v4;
      if (v5 < v4 && v9 >= 8)
      {
        unint64_t v23 = (id *)(a3 - 8);
        Swift::Int v24 = v4;
        uint64_t v32 = v5;
        do
        {
          id v35 = v4;
          Swift::Int v25 = v23 + 1;
          int64_t v26 = *--v24;
          id v27 = *(v22 - 1);
          id v28 = v26;
          id v29 = [v27 originalRange];
          id v30 = [v28 originalRange];

          if ((uint64_t)v29 >= (uint64_t)v30)
          {
            id v36 = (char *)(v22 - 1);
            if (v25 < v22 || v23 >= v22 || v25 != v22) {
              *unint64_t v23 = *(v22 - 1);
            }
            Swift::Int v24 = v35;
            --v22;
          }
          else
          {
            if (v25 != v35 || v23 >= v35) {
              *unint64_t v23 = *v24;
            }
            BOOL v38 = v24;
          }
          if (v24 <= v32) {
            break;
          }
          --v23;
          uint64_t v4 = v24;
        }
        while (v22 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != __src || &__src[v8] <= a4) {
      memmove(a4, __src, 8 * v8);
    }
    id v12 = &a4[v8];
    id v36 = (char *)v12;
    if ((unint64_t)v4 < a3 && v6 >= 8)
    {
      id v13 = a4;
      do
      {
        id v14 = v5;
        id v15 = *v13;
        id v16 = *v4;
        id v17 = v15;
        id v18 = [v16 originalRange];
        id v19 = [v17 originalRange];

        if ((uint64_t)v18 >= (uint64_t)v19)
        {
          id v21 = v14;
          if (v14 != v13) {
            *id v14 = *v13;
          }
          id v37 = ++v13;
          id v20 = v4;
        }
        else
        {
          id v20 = v4 + 1;
          id v21 = v14;
          if (v14 < v4 || v14 >= v20 || v14 != v4) {
            *id v14 = *v4;
          }
        }
        uint64_t v5 = v21 + 1;
        if (v13 >= v12) {
          break;
        }
        uint64_t v4 = v20;
      }
      while ((unint64_t)v20 < a3);
      BOOL v38 = v5;
    }
LABEL_43:
    sub_100172550((void **)&v38, (const void **)&v37, &v36);
    return 1;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_10017222C(char *result, int64_t a2, char a3, char *a4)
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
    sub_1000063C0(&qword_1002059A8);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  id v13 = v10 + 32;
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_100172328(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -24)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 24;
    if (result != v3 || result >= &v3[24 * v6])
    {
      return (char *)memmove(result, v3, 24 * v6);
    }
  }
  return result;
}

uint64_t sub_1001723F8(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  return sub_100172410(a1, a2, a3, &qword_1001FEFA8);
}

uint64_t sub_100172404(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  return sub_100172410(a1, a2, a3, &qword_100203E98);
}

uint64_t sub_100172410(unint64_t *a1, unint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  unint64_t v4 = *a1;
  unint64_t v5 = *a2;
  uint64_t v6 = *a3;
  uint64_t result = sub_1000063C0(a4);
  uint64_t v8 = *(void *)(*(void *)(result - 8) + 72);
  if (!v8)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v9 = v6 - v5;
  if (v6 - v5 == 0x8000000000000000 && v8 == -1) {
    goto LABEL_18;
  }
  if (v9 / v8 < 0)
  {
LABEL_19:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  if (v4 < v5 || v4 >= v5 + v9 / v8 * v8)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v4 != v5)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_100172550(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_10017260C(uint64_t a1)
{
  return sub_10017222C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100172620(unint64_t a1, uint64_t a2, unint64_t a3)
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
        sub_100174D14();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_1000063C0(&qword_100205998);
          uint64_t v12 = sub_100172834(v16, i, a3);
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
    sub_1000085FC(0, (unint64_t *)&qword_100201570);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void (*sub_100172834(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1001728E4(v6, a2, a3);
  return sub_10017289C;
}

void sub_10017289C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_1001728E4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  Swift::Int v3 = result;
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
    *(void *)Swift::Int v3 = v4;
    return destroy for CompositionResponseImageView;
  }
  __break(1u);
  return result;
}

uint64_t sub_100172964(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1000063C0(&qword_1001FEFA8);
  uint64_t v39 = *(void *)(v8 - 8);
  uint64_t v40 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  int64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v9);
  id v14 = (char *)&v33 - v13;
  uint64_t v15 = *(void *)(a4 + 64);
  uint64_t v38 = a4 + 64;
  uint64_t v16 = -1 << *(unsigned char *)(a4 + 32);
  if (-v16 < 64) {
    uint64_t v17 = ~(-1 << -(char)v16);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v15;
  if (!a2)
  {
    int64_t v19 = 0;
    a3 = 0;
LABEL_39:
    uint64_t v32 = v38;
    *a1 = a4;
    a1[1] = v32;
    a1[2] = ~v16;
    a1[3] = v19;
    a1[4] = v18;
    return a3;
  }
  if (!a3)
  {
    int64_t v19 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v35 = -1 << *(unsigned char *)(a4 + 32);
  id v36 = a1;
  int64_t v19 = 0;
  uint64_t v20 = 0;
  int64_t v37 = (unint64_t)(63 - v16) >> 6;
  int64_t v34 = v37 - 1;
  uint64_t v21 = a3;
  if (!v18) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v22 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  unint64_t v23 = v22 | (v19 << 6);
  while (1)
  {
    ++v20;
    uint64_t v27 = *(void *)(a4 + 56);
    id v28 = (uint64_t *)(*(void *)(a4 + 48) + 16 * v23);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = type metadata accessor for LayoutSubview();
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v31 - 8) + 16))(&v11[*(int *)(v40 + 48)], v27 + *(void *)(*(void *)(v31 - 8) + 72) * v23, v31);
    *(void *)int64_t v11 = v29;
    *((void *)v11 + 1) = v30;
    sub_100026FD0((uint64_t)v11, (uint64_t)v14, &qword_1001FEFA8);
    uint64_t result = sub_100026FD0((uint64_t)v14, a2, &qword_1001FEFA8);
    if (v20 == v21)
    {
      a3 = v21;
      goto LABEL_38;
    }
    a2 += *(void *)(v39 + 72);
    if (v18) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v24 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v24 >= v37) {
      goto LABEL_33;
    }
    unint64_t v25 = *(void *)(v38 + 8 * v24);
    if (!v25)
    {
      v19 += 2;
      if (v24 + 1 >= v37)
      {
        unint64_t v18 = 0;
        int64_t v19 = v24;
      }
      else
      {
        unint64_t v25 = *(void *)(v38 + 8 * v19);
        if (v25) {
          goto LABEL_14;
        }
        int64_t v26 = v24 + 2;
        if (v24 + 2 >= v37) {
          goto LABEL_33;
        }
        unint64_t v25 = *(void *)(v38 + 8 * v26);
        if (v25)
        {
LABEL_17:
          int64_t v24 = v26;
          goto LABEL_18;
        }
        int64_t v19 = v24 + 3;
        if (v24 + 3 < v37)
        {
          unint64_t v25 = *(void *)(v38 + 8 * v19);
          if (v25)
          {
LABEL_14:
            int64_t v24 = v19;
            goto LABEL_18;
          }
          int64_t v26 = v24 + 4;
          if (v24 + 4 >= v37)
          {
LABEL_33:
            unint64_t v18 = 0;
            goto LABEL_37;
          }
          unint64_t v25 = *(void *)(v38 + 8 * v26);
          if (!v25)
          {
            while (1)
            {
              int64_t v24 = v26 + 1;
              if (__OFADD__(v26, 1)) {
                goto LABEL_42;
              }
              if (v24 >= v37)
              {
                unint64_t v18 = 0;
                int64_t v19 = v34;
                goto LABEL_37;
              }
              unint64_t v25 = *(void *)(v38 + 8 * v24);
              ++v26;
              if (v25) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v18 = 0;
        int64_t v19 = v24 + 2;
      }
LABEL_37:
      a3 = v20;
LABEL_38:
      uint64_t v16 = v35;
      a1 = v36;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v18 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v24 << 6);
    int64_t v19 = v24;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_100172CC0(uint64_t result)
{
  uint64_t v2 = result;
  unint64_t v3 = *(void *)(v1 + 24);
  id v4 = *(void **)v1;
  int64_t v5 = v3 >> 1;
  if ((v3 & 1) == 0 || (result = swift_isUniquelyReferenced_nonNull(), *(void *)uint64_t v1 = v4, (result & 1) == 0))
  {
    uint64_t v9 = v4;
    goto LABEL_9;
  }
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v8 = *(void *)(v1 + 8);
  type metadata accessor for __ContiguousArrayStorageBase();
  swift_unknownObjectRetain();
  uint64_t result = swift_dynamicCastClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    uint64_t result = (uint64_t)_swiftEmptyArrayStorage;
  }
  uint64_t v9 = *(void **)(result + 16);
  if (v8 + 8 * v6 + 8 * v7 == result + 8 * (void)v9 + 32) {
    goto LABEL_31;
  }
  uint64_t result = swift_release();
  while (1)
  {
    if (v7 >= v2) {
      goto LABEL_28;
    }
    uint64_t v9 = *(void **)v1;
LABEL_9:
    uint64_t v10 = *(void *)(v1 + 16);
    uint64_t v7 = v5 - v10;
    if (__OFSUB__(v5, v10))
    {
      __break(1u);
      goto LABEL_35;
    }
    uint64_t v11 = *(void *)(v1 + 8);
    if (v7 <= v2 ? v2 : v5 - v10) {
      break;
    }
    id v4 = _swiftEmptyArrayStorage;
    if (v5 >= v10) {
      goto LABEL_17;
    }
LABEL_30:
    __break(1u);
LABEL_31:
    unint64_t v19 = *(void *)(result + 24);
    uint64_t result = swift_release();
    unint64_t v20 = (v19 >> 1) - (void)v9;
    BOOL v21 = __OFADD__(v7, v20);
    v7 += v20;
    if (v21) {
      goto LABEL_40;
    }
  }
  sub_1000063C0(&qword_1001FAFD0);
  id v4 = (void *)swift_allocObject();
  uint64_t result = j__malloc_size(v4);
  uint64_t v13 = result - 32;
  if (result < 32) {
    uint64_t v13 = result - 25;
  }
  v4[2] = v7;
  v4[3] = (2 * (v13 >> 3)) | 1;
  if (v5 < v10) {
    goto LABEL_30;
  }
LABEL_17:
  if ((v7 & 0x8000000000000000) == 0)
  {
    unint64_t v14 = (unint64_t)(v4 + 4);
    unint64_t v15 = v11 + 8 * v10;
    if (v15 >= (unint64_t)&v4[v7 + 4] || v14 >= v15 + 8 * v7)
    {
      sub_1000085FC(0, (unint64_t *)&qword_100201570);
      swift_arrayInitWithCopy();
      if (!__OFSUB__(0, v10))
      {
        uint64_t v17 = v4[2];
        uint64_t v18 = v10 + v17;
        if (!__OFADD__(v10, v17))
        {
          if (v18 >= v10)
          {
            uint64_t result = swift_unknownObjectRelease();
            if ((v18 & 0x8000000000000000) == 0)
            {
              *(void *)(v1 + 8) = v14 - 8 * v10;
              *(void *)(v1 + 16) = v10;
              *(void *)(v1 + 24) = (2 * v18) | 1;
LABEL_28:
              *(void *)uint64_t v1 = v4;
              return result;
            }
            goto LABEL_38;
          }
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
LABEL_41:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100172F58(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = v4[2];
  uint64_t v6 = v4[3] >> 1;
  uint64_t v7 = (void *)(v6 - v5);
  if (__OFSUB__(v6, v5))
  {
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v9 = *a1;
  uint64_t v10 = *(void *)(*a1 + 16);
  BOOL v11 = __OFSUB__(v10, a2);
  uint64_t v12 = v10 - a2;
  if (v11)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v14 = v12 - a3;
  if (__OFSUB__(v12, a3))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  unint64_t v15 = (char *)v7 - a2;
  if (__OFSUB__(v7, a2))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v33 = &v15[-v14];
  if (__OFSUB__(v15, v14))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  __dst = (char *)(v9 + 32);
  uint64_t v17 = v9 + 32 + 8 * a2;
  uint64_t v31 = (char *)(v17 + 8 * a3);
  uint64_t v18 = sub_100173564(v7);
  uint64_t v32 = a4;
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v30 = v9;
    uint64_t v20 = v4[2];
    BOOL v21 = (char *)(v4[1] + 8 * v20);
    sub_1000085FC(0, (unint64_t *)&qword_100201570);
    swift_arrayDestroy();
    if (a2 < 0) {
      goto LABEL_43;
    }
    unint64_t v22 = &v21[8 * a2];
    if (__dst != v21 || __dst >= v22) {
      memmove(__dst, v21, 8 * a2);
    }
    swift_arrayDestroy();
    v32(v17, a3);
    if (v14 < 0) {
      goto LABEL_43;
    }
    unint64_t v23 = &v22[8 * (void)v33];
    if (v31 != v23 || v31 >= &v23[8 * v14]) {
      memmove(v31, v23, 8 * v14);
    }
    swift_arrayDestroy();
    *(void *)(v19 + 16) = 0;
    swift_release();
    uint64_t v9 = v30;
LABEL_23:
    swift_retain();
    uint64_t result = swift_unknownObjectRelease();
    if (!__OFSUB__(0, v20))
    {
      uint64_t v28 = *(void *)(v9 + 16);
      BOOL v11 = __OFADD__(v20, v28);
      uint64_t v29 = v20 + v28;
      if (!v11)
      {
        if (v29 >= v20)
        {
          if ((v29 & 0x8000000000000000) == 0)
          {
            *id v4 = v9;
            v4[1] = &__dst[-8 * v20];
            v4[2] = v20;
            v4[3] = (2 * v29) | 1;
            return result;
          }
          goto LABEL_36;
        }
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v20 = v4[2];
  BOOL v11 = __OFADD__(v20, a2);
  uint64_t v24 = v20 + a2;
  if (v11)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v24 < v20)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if (__OFSUB__(v24, v20))
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  sub_1000085FC(0, (unint64_t *)&qword_100201570);
  swift_arrayInitWithCopy();
  a4((uint64_t)&__dst[8 * (v24 - v20)], a3);
  unint64_t v25 = &v33[v24];
  if (__OFADD__(v24, v33))
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v26 = (char *)(v4[3] >> 1);
  if ((uint64_t)v26 < (uint64_t)v25)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (!__OFSUB__(v26, v25))
  {
    swift_arrayInitWithCopy();
    goto LABEL_23;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_100173288(void *result)
{
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = v3 >> 1;
  BOOL v5 = __OFSUB__(v3 >> 1, v2);
  uint64_t v6 = (v3 >> 1) - v2;
  if (v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v7 = (char *)result - v6;
  if (__OFSUB__(result, v6))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!v7) {
    return result;
  }
  type metadata accessor for __ContiguousArrayStorageBase();
  swift_unknownObjectRetain();
  uint64_t result = (void *)swift_dynamicCastClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    uint64_t result = _swiftEmptyArrayStorage;
  }
  uint64_t v8 = result[2];
  BOOL v5 = __OFADD__(v8, v7);
  uint64_t v9 = &v7[v8];
  if (v5) {
    goto LABEL_13;
  }
  result[2] = v9;
  uint64_t result = (void *)swift_release();
  uint64_t v10 = &v7[v4];
  if (__OFADD__(v4, v7))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (((unint64_t)v10 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  *(void *)(v1 + 24) = v3 & 1 | (2 * (void)v10);
  return result;
}

void *sub_100173340(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
  {
    __break(1u);
LABEL_34:
    if (v8 >= v7) {
      goto LABEL_21;
    }
LABEL_18:
    if (v8 + 0x4000000000000000 >= 0)
    {
      v8 *= 2;
      goto LABEL_21;
    }
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v7 = a2;
  uint64_t v6 = result;
  if ((a6 & 1) == 0) {
    goto LABEL_34;
  }
  type metadata accessor for __ContiguousArrayStorageBase();
  swift_unknownObjectRetain();
  BOOL v11 = (void *)swift_dynamicCastClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    BOOL v11 = _swiftEmptyArrayStorage;
  }
  uint64_t v12 = v11[2];
  uint64_t v13 = a4 + 8 * a5 + 8 * v8;
  if ((void *)v13 == &v11[v12 + 4])
  {
    unint64_t v15 = v11[3];
    uint64_t result = (void *)swift_release();
    uint64_t v16 = (v15 >> 1) - v12;
    uint64_t v14 = v8 + v16;
    if (__OFADD__(v8, v16))
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
  }
  else
  {
    swift_release();
    uint64_t v14 = v8;
  }
  swift_unknownObjectRetain();
  uint64_t v17 = (void *)swift_dynamicCastClass();
  if (v14 < v7)
  {
    if (!v17)
    {
      swift_unknownObjectRelease();
      uint64_t v17 = _swiftEmptyArrayStorage;
    }
    uint64_t v18 = v17[2];
    if ((void *)v13 == &v17[v18 + 4])
    {
      unint64_t v20 = v17[3];
      uint64_t result = (void *)swift_release();
      uint64_t v21 = (v20 >> 1) - v18;
      BOOL v22 = __OFADD__(v8, v21);
      v8 += v21;
      if (v22)
      {
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t result = (void *)swift_release();
    }
    goto LABEL_18;
  }
  if (!v17)
  {
    swift_unknownObjectRelease();
    uint64_t v17 = _swiftEmptyArrayStorage;
  }
  uint64_t v19 = v17[2];
  if ((void *)v13 == &v17[v19 + 4])
  {
    unint64_t v23 = v17[3];
    uint64_t result = (void *)swift_release();
    uint64_t v24 = (v23 >> 1) - v19;
    BOOL v22 = __OFADD__(v8, v24);
    v8 += v24;
    if (!v22) {
      goto LABEL_21;
    }
LABEL_39:
    __break(1u);
    return result;
  }
  swift_release();
LABEL_21:
  if (v8 <= v7) {
    uint64_t v25 = v7;
  }
  else {
    uint64_t v25 = v8;
  }
  if (v25 <= (uint64_t)v6) {
    int64_t v26 = v6;
  }
  else {
    int64_t v26 = (void *)v25;
  }
  if (!v26) {
    return _swiftEmptyArrayStorage;
  }
  sub_1000063C0(&qword_1001FAFD0);
  uint64_t v27 = (void *)swift_allocObject();
  int64_t v28 = j__malloc_size(v27);
  uint64_t v29 = v28 - 32;
  if (v28 < 32) {
    uint64_t v29 = v28 - 25;
  }
  v27[2] = v6;
  v27[3] = (2 * (v29 >> 3)) | 1;
  return v27;
}

uint64_t (*sub_100173548())()
{
  return nullsub_1;
}

uint64_t sub_100173564(void *a1)
{
  uint64_t isUniquelyReferenced_nonNull = swift_isUniquelyReferenced_nonNull();
  if (!isUniquelyReferenced_nonNull) {
    return 0;
  }
  uint64_t v6 = v1[2];
  unint64_t v5 = v1[3];
  uint64_t v7 = (v5 >> 1) - v6;
  if (__OFSUB__(v5 >> 1, v6))
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v8 = v1[1];
  if ((v5 & 1) == 0) {
    goto LABEL_8;
  }
  type metadata accessor for __ContiguousArrayStorageBase();
  swift_unknownObjectRetain();
  uint64_t v9 = (void *)swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = _swiftEmptyArrayStorage;
  }
  uint64_t v10 = v9[2];
  if ((void *)(v8 + 8 * v6 + 8 * v7) != &v9[v10 + 4])
  {
    swift_release();
LABEL_8:
    uint64_t v11 = v7;
    goto LABEL_10;
  }
  unint64_t v12 = v9[3];
  uint64_t result = swift_release();
  uint64_t v14 = (v12 >> 1) - v10;
  BOOL v15 = __OFADD__(v7, v14);
  uint64_t v11 = v7 + v14;
  if (!v15)
  {
LABEL_10:
    if (v11 < (uint64_t)a1) {
      return 0;
    }
    type metadata accessor for __ContiguousArrayStorageBase();
    swift_unknownObjectRetain();
    a1 = (void *)swift_dynamicCastClass();
    if (!a1)
    {
      swift_unknownObjectRelease();
      a1 = _swiftEmptyArrayStorage;
    }
    uint64_t v16 = v8 + 8 * v6 - (void)a1;
    uint64_t v17 = v16 - 32;
    uint64_t v18 = v16 - 25;
    if (v17 >= 0) {
      uint64_t v18 = v17;
    }
    uint64_t isUniquelyReferenced_nonNull = v7 + (v18 >> 3);
    if (!__OFADD__(v7, v18 >> 3))
    {
      uint64_t v4 = a1[2];
      if (isUniquelyReferenced_nonNull >= v4) {
        return (uint64_t)a1;
      }
LABEL_21:
      sub_1001743B8(isUniquelyReferenced_nonNull, v4, 0);
      return (uint64_t)a1;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_1001736D4(void *a1)
{
  return sub_100129DDC(0, a1[2], 0, a1);
}

uint64_t sub_1001736E8(void *a1)
{
  return sub_100129F84(0, a1[2], 0, a1);
}

uint64_t sub_1001736FC(void *a1)
{
  return sub_100129F98(0, a1[2], 0, a1);
}

void sub_100173720()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  unint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__expandedSuggestion);
  *(void *)(v1 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__expandedSuggestion) = v2;
  id v4 = v2;
}

uint64_t sub_100173760()
{
  return sub_100174E78(&OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__task);
}

uint64_t sub_100173790@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100164E4C(a1, &OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__analyticsInstance, a2);
}

uint64_t sub_1001737C4()
{
  return sub_100174E78(&OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__analyticsInstance);
}

void (**sub_1001737E4(unint64_t a1, uint64_t a2))(char *, uint64_t)
{
  uint64_t v3 = v2;
  uint64_t v24 = a2;
  uint64_t v23 = type metadata accessor for UUID();
  unint64_t v5 = *(void (***)(char *, uint64_t))(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v8; uint64_t v8 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v21 = v24 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel___observationRegistrar;
    unint64_t v22 = a1 & 0xC000000000000001;
    v19[1] = v3;
    unint64_t v20 = (uint64_t *)(v24 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__suggestionStates);
    swift_beginAccess();
    uint64_t v9 = v5 + 1;
    uint64_t v10 = 4;
    while (1)
    {
      uint64_t v3 = v10 - 4;
      uint64_t v11 = v22
          ? (void (**)(char *, uint64_t))specialized _ArrayBuffer._getElementSlowPath(_:)()
          : (void (**)(char *, uint64_t))*(id *)(a1 + 8 * v10);
      unint64_t v5 = v11;
      uint64_t v12 = v10 - 3;
      if (__OFADD__(v3, 1)) {
        break;
      }
      id v13 = [v11 uuid];
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      swift_getKeyPath();
      uint64_t v25 = v24;
      sub_100174B54((unint64_t *)&qword_1001FBD30, (void (*)(uint64_t))type metadata accessor for ProofreadingModel);
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      uint64_t v14 = *v20;
      if (*(void *)(*v20 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v15 = sub_100007B70((uint64_t)v7);
        if (v16) {
          uint64_t v17 = *(void *)(*(void *)(v14 + 56) + 8 * v15);
        }
        else {
          uint64_t v17 = 0;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v17 = 0;
      }
      (*v9)(v7, v23);
      if (v17 == 1)
      {
        swift_bridgeObjectRelease();
        return v5;
      }

      ++v10;
      if (v12 == v8) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
LABEL_20:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_100173A9C(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v39 = type metadata accessor for UUID();
  uint64_t v6 = *(void ***)(v39 - 8);
  uint64_t v7 = __chkstk_darwin(v39);
  uint64_t v31 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v29 - v9;
  uint64_t v41 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_30;
  }
  uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  uint64_t v12 = OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel___observationRegistrar;
  uint64_t v38 = (uint64_t *)(a2 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__suggestionStates);
  swift_beginAccess();
  if (v11)
  {
    v29[1] = v3;
    uint64_t v30 = v11;
    unint64_t v3 = 0;
    uint64_t v36 = a2 + v12;
    uint64_t v37 = a2;
    uint64_t v33 = a1 & 0xFFFFFFFFFFFFFF8;
    unint64_t v34 = a1 & 0xC000000000000001;
    uint64_t v35 = (void (**)(char *, uint64_t))(v6 + 1);
    unint64_t v32 = a1;
    while (1)
    {
      if (v34)
      {
        id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (v3 >= *(void *)(v33 + 16))
        {
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
          goto LABEL_3;
        }
        id v13 = *(id *)(a1 + 8 * v3 + 32);
      }
      uint64_t v14 = v13;
      unint64_t v15 = v3 + 1;
      if (__OFADD__(v3, 1)) {
        goto LABEL_29;
      }
      id v16 = [v13 uuid];
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      swift_getKeyPath();
      uint64_t v40 = a2;
      sub_100174B54((unint64_t *)&qword_1001FBD30, (void (*)(uint64_t))type metadata accessor for ProofreadingModel);
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      uint64_t v17 = *v38;
      if (*(void *)(*v38 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v18 = sub_100007B70((uint64_t)v10);
        if (v19) {
          uint64_t v20 = *(void *)(*(void *)(v17 + 56) + 8 * v18);
        }
        else {
          uint64_t v20 = 0;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v20 = 0;
      }
      uint64_t v21 = *v35;
      (*v35)(v10, v39);
      if (v20)
      {
        unint64_t v22 = v10;
        id v23 = [v14 uuid];
        uint64_t v24 = (uint64_t)v31;
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        swift_getKeyPath();
        uint64_t v40 = v37;
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v6 = (void **)*v38;
        if (!*(void *)(*v38 + 16)) {
          goto LABEL_23;
        }
        swift_bridgeObjectRetain();
        unint64_t v25 = sub_100007B70(v24);
        if ((v26 & 1) == 0)
        {
          swift_bridgeObjectRelease();
LABEL_23:
          v21((char *)v24, v39);
          uint64_t v10 = v22;
          uint64_t v11 = v30;
LABEL_24:

          goto LABEL_6;
        }
        uint64_t v27 = v6[7][v25];
        swift_bridgeObjectRelease();
        v21((char *)v24, v39);
        uint64_t v10 = v22;
        uint64_t v11 = v30;
        if (v27 != 1) {
          goto LABEL_24;
        }
      }
      uint64_t v6 = &v41;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
LABEL_6:
      ++v3;
      a2 = v37;
      a1 = v32;
      if (v15 == v11) {
        return v41;
      }
    }
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100173E94(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v37 = a2;
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v25 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_1000063C0((uint64_t *)&unk_1001FEE80);
  __chkstk_darwin(v36);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000063C0((uint64_t *)&unk_1001FB400);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (uint64_t)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v23 - v14;
  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v16 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v16)
    {
LABEL_3:
      uint64_t v29 = v13;
      id v23 = v3;
      uint64_t v34 = v37 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel___observationRegistrar;
      unint64_t v35 = a1 & 0xC000000000000001;
      uint64_t v33 = v37 + OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__mostRecentlyReviewedSuggestionUUID;
      swift_beginAccess();
      uint64_t v13 = 0;
      uint64_t v31 = (unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
      unint64_t v32 = (void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
      uint64_t v24 = (void (**)(char *, uint64_t, uint64_t))(v6 + 32);
      uint64_t v27 = (void (**)(uint64_t, uint64_t))(v6 + 8);
      uint64_t v28 = v16;
      uint64_t v30 = (id *)a1;
      while (1)
      {
        uint64_t v17 = v35
            ? (id *)specialized _ArrayBuffer._getElementSlowPath(_:)()
            : (id *)*(id *)(a1 + 8 * v13 + 32);
        a1 = (unint64_t)v17;
        id v18 = [v17 uuid];
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        (*v32)(v15, 0, 1, v5);
        swift_getKeyPath();
        uint64_t v38 = v37;
        sub_100174B54((unint64_t *)&qword_1001FBD30, (void (*)(uint64_t))type metadata accessor for ProofreadingModel);
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v6 = (uint64_t)&v9[*(int *)(v36 + 48)];
        sub_10000EC20((uint64_t)v15, (uint64_t)v9);
        sub_10000EC20(v33, v6);
        unint64_t v3 = *v31;
        if ((*v31)(v9, 1, v5) == 1) {
          break;
        }
        uint64_t v19 = v29;
        sub_10000EC20((uint64_t)v9, v29);
        if (v3((char *)v6, 1, v5) == 1)
        {
          sub_10002784C((uint64_t)v15, (uint64_t *)&unk_1001FB400);
          (*v27)(v19, v5);
          uint64_t v16 = v28;
LABEL_12:
          sub_10002784C((uint64_t)v9, (uint64_t *)&unk_1001FEE80);

          goto LABEL_14;
        }
        uint64_t v20 = v25;
        (*v24)(v25, v6, v5);
        sub_100174B54(&qword_1001FAF60, (void (*)(uint64_t))&type metadata accessor for UUID);
        int v26 = dispatch thunk of static Equatable.== infix(_:_:)();
        uint64_t v6 = (uint64_t)v27;
        unint64_t v3 = (unsigned int (*)(char *, uint64_t, uint64_t))*v27;
        (*v27)((uint64_t)v20, v5);
        sub_10002784C((uint64_t)v15, (uint64_t *)&unk_1001FB400);
        ((void (*)(uint64_t, uint64_t))v3)(v19, v5);
        sub_10002784C((uint64_t)v9, (uint64_t *)&unk_1001FB400);

        uint64_t v16 = v28;
        if (v26) {
          return v13;
        }
LABEL_14:
        uint64_t v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
          __break(1u);
          goto LABEL_19;
        }
        ++v13;
        a1 = (unint64_t)v30;
        if (v21 == v16) {
          return 0;
        }
      }
      sub_10002784C((uint64_t)v15, (uint64_t *)&unk_1001FB400);
      if (v3((char *)v6, 1, v5) == 1)
      {
        sub_10002784C((uint64_t)v9, (uint64_t *)&unk_1001FB400);

        return v13;
      }
      goto LABEL_12;
    }
  }
  return 0;
}

char *sub_1001743B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v7 = *v3;
  uint64_t v8 = v7 + 32 + 8 * a1;
  sub_1000085FC(0, (unint64_t *)&qword_100201570);
  uint64_t result = (char *)swift_arrayDestroy();
  BOOL v10 = __OFSUB__(a3, v4);
  uint64_t v11 = a3 - v4;
  if (v10)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!v11) {
    goto LABEL_14;
  }
  uint64_t v12 = *(void *)(v7 + 16);
  BOOL v10 = __OFSUB__(v12, a2);
  uint64_t v13 = v12 - a2;
  if (v10) {
    goto LABEL_18;
  }
  if (v13 < 0)
  {
LABEL_21:
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  uint64_t result = (char *)(v8 + 8 * a3);
  uint64_t v14 = (char *)(v7 + 32 + 8 * a2);
  if (result != v14 || result >= &v14[8 * v13]) {
    uint64_t result = (char *)memmove(result, v14, 8 * v13);
  }
  uint64_t v16 = *(void *)(v7 + 16);
  BOOL v10 = __OFADD__(v16, v11);
  uint64_t v17 = v16 + v11;
  if (v10) {
    goto LABEL_19;
  }
  *(void *)(v7 + 16) = v17;
LABEL_14:
  if (a3 > 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

void *sub_1001744E0(void *result)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24) >> 1;
  uint64_t v4 = v3 - v2;
  if (__OFSUB__(v3, v2)) {
    goto LABEL_56;
  }
  uint64_t v5 = result[4];
  uint64_t v6 = result[3] >> 1;
  if (v5 == v6) {
    return result;
  }
  uint64_t v41 = result[2];
  if (v5 < v41 || v5 >= v6) {
    goto LABEL_57;
  }
  uint64_t v8 = result[3] >> 1;
  uint64_t v9 = v5 + 1;
  uint64_t v35 = result[1];
  BOOL v10 = *(void **)(v35 + 8 * v5);
  uint64_t result = v10;
  uint64_t v34 = v8 - 1;
  uint64_t v36 = v8;
  while (1)
  {
    uint64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    int v42 = sub_100173340((void *)v4, v4 + 1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24));
    uint64_t v12 = sub_100173548();
    sub_100172F58((uint64_t *)&v42, v4, 0, (void (*)(uint64_t, uint64_t))v12);
    swift_release();
    uint64_t result = (void *)swift_release();
    uint64_t v14 = *(void *)(v1 + 16);
    unint64_t v13 = *(void *)(v1 + 24);
    unint64_t v38 = v13 >> 1;
    uint64_t v15 = (v13 >> 1) - v14;
    if (__OFSUB__(v13 >> 1, v14)) {
      goto LABEL_50;
    }
    uint64_t v39 = v10;
    uint64_t v16 = *(void *)(v1 + 8);
    if (v13)
    {
      type metadata accessor for __ContiguousArrayStorageBase();
      swift_unknownObjectRetain();
      uint64_t v17 = (void *)swift_dynamicCastClass();
      if (!v17)
      {
        swift_unknownObjectRelease();
        uint64_t v17 = _swiftEmptyArrayStorage;
      }
      uint64_t v18 = v17[2];
      if ((void *)(v16 + 8 * v14 + 8 * v15) == &v17[v18 + 4])
      {
        char v21 = v13;
        unint64_t v22 = v17[3];
        uint64_t result = (void *)swift_release();
        uint64_t v23 = (v22 >> 1) - v18;
        uint64_t v19 = v15 + v23;
        if (__OFADD__(v15, v23)) {
          goto LABEL_55;
        }
        LOBYTE(v13) = v21;
        if (v4 >= v19)
        {
LABEL_25:
          BOOL v10 = v39;
          uint64_t v20 = v4 - v15;
          if (__OFSUB__(v4, v15)) {
            goto LABEL_51;
          }
          goto LABEL_39;
        }
      }
      else
      {
        uint64_t result = (void *)swift_release();
        uint64_t v19 = (v13 >> 1) - v14;
        if (v4 >= v15) {
          goto LABEL_25;
        }
      }
    }
    else
    {
      uint64_t v19 = (v13 >> 1) - v14;
      if (v4 >= v15) {
        goto LABEL_25;
      }
    }
    *(void *)(v16 + 8 * v14 + 8 * v4) = v39;
    if (v9 == v36)
    {
      BOOL v10 = 0;
      ++v4;
      uint64_t v9 = v36;
      uint64_t v20 = v11 - v15;
      if (__OFSUB__(v11, v15)) {
        goto LABEL_51;
      }
    }
    else
    {
      uint64_t v40 = v19;
      uint64_t v37 = v4;
      if (v9 < v41 || v9 >= v36)
      {
LABEL_48:
        __break(1u);
        break;
      }
      uint64_t v24 = 0;
      uint64_t v25 = v16 + 8 * v4 + 8 * v14 + 8;
      uint64_t v26 = v35 + 8 * v9;
      uint64_t v27 = v9 + 1;
      while (1)
      {
        uint64_t v28 = *(void **)(v26 + 8 * v24);
        if (~v37 + v40 == v24)
        {
          uint64_t v4 = v40;
          v9 += v24 + 1;
          BOOL v10 = *(void **)(v26 + 8 * v24);
          goto LABEL_38;
        }
        *(void *)(v25 + 8 * v24) = v28;
        if (v34 - v9 == v24) {
          break;
        }
        uint64_t v29 = v27 + v24;
        uint64_t result = v28;
        if (v27 + v24 >= v41)
        {
          ++v24;
          if (v29 < v36) {
            continue;
          }
        }
        goto LABEL_48;
      }
      BOOL v10 = 0;
      uint64_t v4 = v37 + v24 + 2;
      uint64_t v9 = v36;
LABEL_38:
      uint64_t result = v28;
      uint64_t v20 = v4 - v15;
      if (__OFSUB__(v4, v15)) {
        goto LABEL_51;
      }
    }
LABEL_39:
    if (v20)
    {
      type metadata accessor for __ContiguousArrayStorageBase();
      swift_unknownObjectRetain();
      uint64_t result = (void *)swift_dynamicCastClass();
      if (!result)
      {
        swift_unknownObjectRelease();
        uint64_t result = _swiftEmptyArrayStorage;
      }
      uint64_t v30 = result[2];
      BOOL v31 = __OFADD__(v30, v20);
      uint64_t v32 = v30 + v20;
      if (v31) {
        goto LABEL_52;
      }
      result[2] = v32;
      uint64_t result = (void *)swift_release();
      uint64_t v33 = v38 + v20;
      if (__OFADD__(v38, v20)) {
        goto LABEL_53;
      }
      if (v33 < 0) {
        goto LABEL_54;
      }
      *(void *)(v1 + 24) = v13 & 1 | (2 * v33);
    }
    if (!v10) {
      return result;
    }
  }
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
  return result;
}

void *sub_100174848(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v8 = v4[2];
  unint64_t v7 = v4[3];
  uint64_t v9 = (v7 >> 1) - v8;
  if (__OFSUB__(v7 >> 1, v8))
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if ((v7 & 1) == 0)
  {
LABEL_8:
    uint64_t v15 = v9;
    goto LABEL_10;
  }
  uint64_t v12 = v4[1];
  type metadata accessor for __ContiguousArrayStorageBase();
  swift_unknownObjectRetain();
  unint64_t v13 = (void *)swift_dynamicCastClass();
  if (!v13)
  {
    swift_unknownObjectRelease();
    unint64_t v13 = _swiftEmptyArrayStorage;
  }
  uint64_t v14 = v13[2];
  if ((void *)(v12 + 8 * v8 + 8 * v9) != &v13[v14 + 4])
  {
    swift_release();
    goto LABEL_8;
  }
  unint64_t v16 = v13[3];
  swift_release();
  uint64_t v17 = (v16 >> 1) - v14;
  BOOL v18 = __OFADD__(v9, v17);
  uint64_t v15 = v9 + v17;
  if (v18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
LABEL_10:
  uint64_t v19 = v9 + v6;
  if (__OFADD__(v9, v6))
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v15 < v19)
  {
    if (v15 + 0x4000000000000000 < 0)
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    uint64_t v20 = 2 * v15;
    if (v20 > v19) {
      uint64_t v19 = v20;
    }
  }
  uint64_t result = (void *)sub_100172CC0(v19);
  uint64_t v23 = v4[2];
  unint64_t v22 = v4[3];
  uint64_t v24 = (v22 >> 1) - v23;
  if (__OFSUB__(v22 >> 1, v23)) {
    goto LABEL_40;
  }
  unint64_t v25 = v4[1] + 8 * v23 + 8 * v24;
  if ((v22 & 1) == 0)
  {
LABEL_21:
    uint64_t v28 = v24;
    goto LABEL_23;
  }
  type metadata accessor for __ContiguousArrayStorageBase();
  swift_unknownObjectRetain();
  uint64_t v26 = (void *)swift_dynamicCastClass();
  if (!v26)
  {
    swift_unknownObjectRelease();
    uint64_t v26 = _swiftEmptyArrayStorage;
  }
  uint64_t v27 = v26[2];
  if ((void *)v25 != &v26[v27 + 4])
  {
    uint64_t result = (void *)swift_release();
    goto LABEL_21;
  }
  unint64_t v29 = v26[3];
  uint64_t result = (void *)swift_release();
  uint64_t v30 = (v29 >> 1) - v27;
  BOOL v18 = __OFADD__(v24, v30);
  uint64_t v28 = v24 + v30;
  if (v18)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
LABEL_23:
  uint64_t v31 = v28 - v24;
  if (__OFSUB__(v28, v24))
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v5 == a3)
  {
    if (v6 <= 0)
    {
      uint64_t v6 = 0;
      unint64_t v5 = a3;
      goto LABEL_34;
    }
    goto LABEL_42;
  }
  if (v31 < v6)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (v6 < 0) {
    goto LABEL_48;
  }
  unint64_t v32 = a2 + 8 * a3;
  if (v32 < v25 + 8 * v6 && v25 < v32 + 8 * v6) {
    goto LABEL_48;
  }
  sub_1000085FC(0, (unint64_t *)&qword_100201570);
  uint64_t result = (void *)swift_arrayInitWithCopy();
  if (v6)
  {
    if (__OFADD__(v24, v6))
    {
LABEL_47:
      __break(1u);
LABEL_48:
      uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
    uint64_t result = sub_100173288((void *)(v24 + v6));
  }
LABEL_34:
  if (v6 == v31)
  {
    v35[0] = a1;
    v35[1] = a2;
    _OWORD v35[2] = a3;
    v35[3] = a4;
    v35[4] = v5;
    return sub_1001744E0(v35);
  }
  return result;
}

uint64_t sub_100174B54(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100174B9C()
{
  return sub_100165864(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100174BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000063C0((uint64_t *)&unk_1001FB400);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100174C20@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void **)(v2 + 16);
  uint64_t v4 = *result;
  if (*result >= v3[2] && v4 < v3[3] >> 1)
  {
    uint64_t v6 = *(void **)(v3[1] + 8 * v4);
    *a2 = v6;
    return (uint64_t *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100174C7C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100164BE0(a1, &OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__modelInfoString, a2);
}

uint64_t sub_100174CA8()
{
  return sub_1000A9FE4(&OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__modelInfoString);
}

uint64_t sub_100174CC8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100164BE0(a1, &OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__inputStringForFeedback, a2);
}

uint64_t sub_100174CF4()
{
  return sub_1000A9FE4(&OBJC_IVAR____TtC21WritingToolsUIService17ProofreadingModel__inputStringForFeedback);
}

unint64_t sub_100174D14()
{
  unint64_t result = qword_1002059A0;
  if (!qword_1002059A0)
  {
    sub_100006C14(&qword_100205998);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002059A0);
  }
  return result;
}

uint64_t sub_100174D70()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100174DB8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100027204;
  return sub_100166F1C(a1, v4, v5, v7, v6);
}

uint64_t sub_100174E78(void *a1)
{
  *(void *)(*(void *)(v1 + 16) + *a1) = *(void *)(v1 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_100174EC4()
{
  return swift_release();
}

uint64_t sub_100174ECC()
{
  return sub_10016BF84();
}

uint64_t sub_100174EE4()
{
  return sub_10016BEF0();
}

uint64_t sub_100174EFC()
{
  return sub_10016BEA0();
}

void sub_100174F14()
{
}

uint64_t sub_100174F2C()
{
  return sub_100174B9C();
}

void sub_100174F44(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for MultichoiceRow(0);
  *(void *)(a2 + *(int *)(v4 + 24)) = 0x401C000000000000;
  type metadata accessor for QuestionnaireEntry();
  sub_100183BC0(&qword_1001FD2E8, (void (*)(uint64_t))type metadata accessor for QuestionnaireEntry);
  swift_retain();
  Bindable<A>.init(wrappedValue:)();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (!*(void *)(a1 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedAnswer + 8))
  {
    swift_release();
    goto LABEL_6;
  }
  uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry_entry);
  swift_bridgeObjectRetain();
  id v6 = [v5 answerOptions];
  if (v6)
  {
    uint64_t v7 = v6;
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    unsigned __int8 v9 = [v7 containsObject:v8];
    swift_release();

    if ((v9 & 1) == 0)
    {
      char v10 = 1;
LABEL_7:
      uint64_t v11 = a2 + *(int *)(v4 + 20);
      *(unsigned char *)uint64_t v11 = v10;
      *(void *)(v11 + 8) = 0;
      return;
    }
LABEL_6:
    char v10 = 0;
    goto LABEL_7;
  }
  __break(1u);
}

uint64_t sub_1001750E8()
{
  uint64_t result = LocalizedStringKey.init(stringLiteral:)();
  qword_100212BA8 = result;
  unk_100212BB0 = v1;
  byte_100212BB8 = v2 & 1;
  qword_100212BC0 = v3;
  return result;
}

uint64_t sub_100175128()
{
  uint64_t result = LocalizedStringKey.init(stringLiteral:)();
  qword_100212BC8 = result;
  unk_100212BD0 = v1;
  byte_100212BD8 = v2 & 1;
  qword_100212BE0 = v3;
  return result;
}

uint64_t sub_100175178()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource();
  sub_1000281F0(v0, qword_100212BE8);
  sub_10000EBE8(v0, (uint64_t)qword_100212BE8);
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_1001751DC(uint64_t a1)
{
  uint64_t v2 = sub_1000063C0(&qword_1002061C8);
  uint64_t v3 = v2 - 8;
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000063C0(&qword_1002061D0);
  __chkstk_darwin(v6);
  NSString v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v10 = sub_1000063C0(&qword_1002061D8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v5, a1, v10);
  uint64_t v11 = &v5[*(int *)(v3 + 44)];
  *(void *)uint64_t v11 = KeyPath;
  *((void *)v11 + 1) = 0;
  v11[16] = 1;
  sub_100008DD4((uint64_t)v5, (uint64_t)v8, &qword_1002061C8);
  *(_WORD *)&v8[*(int *)(v6 + 36)] = 256;
  sub_10002784C((uint64_t)v5, &qword_1002061C8);
  static Font.Weight.medium.getter();
  sub_1001807B0(&qword_1002061E0, &qword_1002061D0, (void (*)(void))sub_100183C10);
  View.fontWeight(_:)();
  return sub_10002784C((uint64_t)v8, &qword_1002061D0);
}

uint64_t sub_1001753B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v32 = a1;
  uint64_t v5 = type metadata accessor for CommonUIBlendModifier(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for RoundedRectangle();
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = (double *)((char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = sub_1000063C0(&qword_100202510);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000063C0(&qword_100206168);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v18 = (char *)v11 + *(int *)(v9 + 28);
  uint64_t v19 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v20 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
  double *v11 = a3;
  v11[1] = a3;
  if (qword_1001FAD48 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_1002129F0;
  sub_10017F434((uint64_t)v11, (uint64_t)v14, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(void *)&v14[*(int *)(v12 + 52)] = v21;
  *(_WORD *)&v14[*(int *)(v12 + 56)] = 256;
  swift_retain();
  sub_1000BEA48((uint64_t)v11);
  uint64_t v22 = static Alignment.center.getter();
  uint64_t v24 = v23;
  uint64_t v25 = (uint64_t)&v17[*(int *)(v15 + 36)];
  sub_100008DD4((uint64_t)v14, v25, &qword_100202510);
  uint64_t v26 = (uint64_t *)(v25 + *(int *)(sub_1000063C0(&qword_1001FC7C0) + 36));
  uint64_t *v26 = v22;
  v26[1] = v24;
  uint64_t v27 = sub_1000063C0(&qword_100206170);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v17, v32, v27);
  sub_10002784C((uint64_t)v14, &qword_100202510);
  *uint64_t v7 = 0;
  uint64_t v28 = (uint64_t *)&v7[*(int *)(v5 + 20)];
  uint64_t *v28 = swift_getKeyPath();
  sub_1000063C0((uint64_t *)&unk_1001FB730);
  swift_storeEnumTagMultiPayload();
  uint64_t v29 = sub_1000063C0(&qword_100206178);
  sub_10017F4A0((uint64_t)v7, a2 + *(int *)(v29 + 36), type metadata accessor for CommonUIBlendModifier);
  return sub_100026FD0((uint64_t)v17, a2, &qword_100206168);
}

uint64_t sub_100175718@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1001753B0(a1, a2, *v2);
}

uint64_t sub_100175720@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v83 = a1;
  uint64_t v72 = type metadata accessor for GlobalCoordinateSpace();
  __chkstk_darwin(v72);
  uint64_t v70 = (char *)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DragGesture();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v77 = v4;
  uint64_t v78 = v5;
  __chkstk_darwin(v4);
  uint64_t v69 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000063C0(&qword_100205FE0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v79 = v7;
  uint64_t v80 = v8;
  __chkstk_darwin(v7);
  uint64_t v73 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000063C0(&qword_100205FE8);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v81 = v10;
  uint64_t v82 = v11;
  __chkstk_darwin(v10);
  uint64_t v76 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_1000063C0(&qword_1001FC7C0) - 8;
  __chkstk_darwin(v68);
  uint64_t v67 = (uint64_t)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for RoundedRectangle();
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  uint64_t v17 = (double *)((char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = sub_1000063C0(&qword_100202510);
  uint64_t v19 = v18 - 8;
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_1000063C0(&qword_100205FF0);
  __chkstk_darwin(v66);
  uint64_t v23 = (char *)&v59 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1000063C0(&qword_100205FF8);
  uint64_t v74 = *(void *)(v24 - 8);
  uint64_t v75 = v24;
  __chkstk_darwin(v24);
  BOOL v71 = (char *)&v59 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = static VerticalAlignment.center.getter();
  uint64_t v64 = static HorizontalAlignment.center.getter();
  sub_100176058(v1, (uint64_t)&v98);
  uint64_t v84 = *((void *)&v99 + 1);
  uint64_t v85 = v99;
  uint64_t v86 = v100;
  uint64_t v61 = v98;
  uint64_t v62 = *((void *)&v100 + 1);
  int v59 = v101;
  int v60 = BYTE8(v98);
  uint64_t v27 = v1[3];
  uint64_t v26 = v1[4];
  sub_100044740(v1, v27);
  double v28 = (*(double (**)(uint64_t, uint64_t))(v26 + 24))(v27, v26);
  uint64_t v29 = (char *)v17 + *(int *)(v15 + 28);
  uint64_t v30 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v31 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(v29, v30, v31);
  *uint64_t v17 = v28;
  v17[1] = v28;
  static Color.gray.getter();
  uint64_t v65 = v2;
  uint64_t v32 = *(void *)(v2 + 64);
  LOBYTE(v98) = *(unsigned char *)(v2 + 56);
  *((void *)&v98 + 1) = v32;
  sub_1000063C0(&qword_1001FB5A8);
  State.wrappedValue.getter();
  char v97 = 1;
  char v96 = 1;
  char v95 = 1;
  char v94 = v60;
  char v93 = v59;
  char v92 = 1;
  long long v98 = (unint64_t)v63;
  LOBYTE(v99) = 1;
  *((void *)&v99 + 1) = 0;
  LOBYTE(v100) = 1;
  *((void *)&v100 + 1) = v64;
  *(void *)&long long v101 = 0;
  BYTE8(v101) = 1;
  *(void *)&long long v102 = v61;
  BYTE8(v102) = v60;
  *(void *)&long long v103 = v85;
  *((void *)&v103 + 1) = v84;
  *(void *)&long long v104 = v86;
  *((void *)&v104 + 1) = v62;
  LOBYTE(v105) = v59;
  *((void *)&v105 + 1) = 0;
  char v106 = 1;
  uint64_t v33 = Color.opacity(_:)();
  swift_release();
  sub_10017F434((uint64_t)v17, (uint64_t)v21, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(void *)&v21[*(int *)(v19 + 60)] = v33;
  *(_WORD *)&v21[*(int *)(v19 + 64)] = 256;
  sub_1000BEA48((uint64_t)v17);
  uint64_t v34 = static Alignment.center.getter();
  uint64_t v36 = v35;
  uint64_t v37 = v67;
  sub_100008DD4((uint64_t)v21, v67, &qword_100202510);
  unint64_t v38 = (uint64_t *)(v37 + *(int *)(v68 + 44));
  *unint64_t v38 = v34;
  v38[1] = v36;
  sub_100008DD4(v37, (uint64_t)&v23[*(int *)(v66 + 36)], &qword_1001FC7C0);
  long long v39 = v103;
  long long v40 = v105;
  *((_OWORD *)v23 + 6) = v104;
  *((_OWORD *)v23 + 7) = v40;
  long long v41 = v99;
  long long v42 = v101;
  long long v43 = v102;
  *((_OWORD *)v23 + 2) = v100;
  *((_OWORD *)v23 + 3) = v42;
  v23[128] = v106;
  *((_OWORD *)v23 + 4) = v43;
  *((_OWORD *)v23 + 5) = v39;
  *(_OWORD *)uint64_t v23 = v98;
  *((_OWORD *)v23 + 1) = v41;
  sub_100182F74((uint64_t)&v98);
  sub_10002784C(v37, &qword_1001FC7C0);
  sub_10002784C((uint64_t)v21, &qword_100202510);
  swift_release();
  swift_release();
  swift_release();
  static CoordinateSpaceProtocol<>.global.getter();
  uint64_t v44 = v69;
  DragGesture.init<A>(minimumDistance:coordinateSpace:)();
  uint64_t v45 = v65;
  sub_100180C44(v65, (uint64_t)&v87);
  uint64_t v46 = swift_allocObject();
  long long v47 = v90;
  *(_OWORD *)(v46 + 48) = v89;
  *(_OWORD *)(v46 + 64) = v47;
  *(void *)(v46 + 80) = v91;
  long long v48 = v88;
  *(_OWORD *)(v46 + 16) = v87;
  *(_OWORD *)(v46 + 32) = v48;
  sub_100183BC0(&qword_100206000, (void (*)(uint64_t))&type metadata accessor for DragGesture);
  sub_100183BC0(&qword_100206008, (void (*)(uint64_t))&type metadata accessor for DragGesture.Value);
  uint64_t v49 = v73;
  uint64_t v50 = v77;
  Gesture<>.onChanged(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v44, v50);
  sub_100180C44(v45, (uint64_t)&v87);
  uint64_t v51 = swift_allocObject();
  long long v52 = v90;
  *(_OWORD *)(v51 + 48) = v89;
  *(_OWORD *)(v51 + 64) = v52;
  *(void *)(v51 + 80) = v91;
  long long v53 = v88;
  *(_OWORD *)(v51 + 16) = v87;
  *(_OWORD *)(v51 + 32) = v53;
  sub_100027F2C(&qword_100206010, &qword_100205FE0);
  BOOL v54 = v76;
  uint64_t v55 = v79;
  Gesture.onEnded(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v80 + 8))(v49, v55);
  static GestureMask.all.getter();
  sub_10018301C();
  sub_100027F2C(&qword_100206030, &qword_100205FE8);
  v56 = v71;
  uint64_t v57 = v81;
  View.gesture<A>(_:including:)();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v54, v57);
  sub_10002784C((uint64_t)v23, &qword_100205FF0);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v74 + 32))(v83, v56, v75);
}

uint64_t sub_100176058@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000063C0(&qword_1001FD8A8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_100044740(a1, v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
  Image.init(systemName:)();
  uint64_t v9 = enum case for Image.TemplateRenderingMode.template(_:);
  uint64_t v10 = type metadata accessor for Image.TemplateRenderingMode();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v6, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  uint64_t v12 = Image.renderingMode(_:)();
  swift_release();
  sub_10002784C((uint64_t)v6, &qword_1001FD8A8);
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  sub_100044740(a1, v13);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 16))(v13, v14);
  uint64_t result = swift_getKeyPath();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  *(void *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = result;
  *(void *)(a2 + 32) = v15;
  *(void *)(a2 + 40) = 0;
  *(unsigned char *)(a2 + 48) = 1;
  return result;
}

uint64_t sub_100176224()
{
  return State.wrappedValue.setter();
}

uint64_t sub_10017627C(uint64_t a1, uint64_t a2)
{
  sub_1000063C0(&qword_1001FB5A8);
  uint64_t v3 = State.wrappedValue.setter();
  return (*(uint64_t (**)(uint64_t))(a2 + 40))(v3);
}

uint64_t sub_1001762E4()
{
  sub_1000063C0(&qword_1001FF890);
  State.wrappedValue.getter();
  swift_bridgeObjectRelease();
  uint64_t v0 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v0 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v0)
  {
    State.wrappedValue.getter();
    sub_1001763E0(v2, v3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1001763E0(0, 0);
    sub_1000063C0(&qword_100201898);
    return Binding.wrappedValue.setter();
  }
}

uint64_t sub_1001763E0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (a1 || a2 != 0xE000000000000000)
    {
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v4 = a1;
        uint64_t v5 = a2;
      }
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v4 = a1;
  }
  sub_1000063C0(&qword_100205FB0);
  Binding.wrappedValue.getter();
  if (!v9)
  {
    if (!v5) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  if (v8 != v4 || v9 != v5)
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6)
    {
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
LABEL_18:
    Binding.wrappedValue.setter();
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_19:
  sub_1000063C0(&qword_1001FB608);
  return FocusState.wrappedValue.setter();
}

uint64_t sub_10017656C()
{
  sub_1000063C0(&qword_1001FF890);
  State.wrappedValue.getter();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v1 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v1 = *(void *)v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v1)
  {
    State.wrappedValue.setter();
    sub_1000063C0(&qword_100201898);
    return Binding.wrappedValue.setter();
  }
  return result;
}

uint64_t sub_100176644@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v79 = a2;
  uint64_t v3 = type metadata accessor for Divider();
  uint64_t v80 = *(void *)(v3 - 8);
  uint64_t v81 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v85 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  long long v87 = (char *)&v68 - v6;
  uint64_t v7 = sub_1000063C0(&qword_1001FC950);
  uint64_t v70 = *(void *)(v7 - 8);
  uint64_t v71 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000063C0(&qword_100205F60);
  uint64_t v73 = *(void *)(v10 - 8);
  uint64_t v74 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_1000063C0(&qword_100205F68);
  __chkstk_darwin(v69);
  uint64_t v14 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_1000063C0(&qword_100205F70);
  __chkstk_darwin(v77);
  uint64_t v78 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000063C0(&qword_100205F78);
  uint64_t v83 = *(void *)(v16 - 8);
  uint64_t v84 = v16;
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v82 = (char *)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v76 = (char *)&v68 - v20;
  __chkstk_darwin(v19);
  uint64_t v86 = (char *)&v68 - v21;
  if (qword_1001FADF8 != -1) {
    swift_once();
  }
  long long v113 = *(_OWORD *)(a1 + 80);
  uint64_t v114 = *(void *)(a1 + 96);
  long long v88 = *(_OWORD *)(a1 + 80);
  uint64_t v89 = *(void *)(a1 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v72 = sub_1000063C0(&qword_1001FF890);
  State.projectedValue.getter();
  TextField<>.init(_:text:onEditingChanged:onCommit:)();
  long long v111 = *(_OWORD *)(a1 + 104);
  char v112 = *(unsigned char *)(a1 + 120);
  long long v88 = *(_OWORD *)(a1 + 104);
  LOBYTE(v89) = *(unsigned char *)(a1 + 120);
  uint64_t v75 = sub_1000063C0(&qword_1001FB608);
  FocusState.projectedValue.getter();
  sub_100027F2C(&qword_100204058, &qword_1001FC950);
  uint64_t v22 = v71;
  View.focused(_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v9, v22);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v24 = v73;
  uint64_t v23 = v74;
  (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v14, v12, v74);
  uint64_t v25 = &v14[*(int *)(v69 + 36)];
  long long v26 = v107[5];
  *(_OWORD *)uint64_t v25 = v107[4];
  *((_OWORD *)v25 + 1) = v26;
  *((_OWORD *)v25 + 2) = v107[6];
  (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v23);
  LOBYTE(v22) = static Edge.Set.leading.getter();
  unsigned __int8 v27 = static Edge.Set.trailing.getter();
  char v28 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v22) {
    char v28 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v27) {
    char v28 = Edge.Set.init(rawValue:)();
  }
  EdgeInsets.init(_all:)();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v37 = v78;
  sub_100008DD4((uint64_t)v14, (uint64_t)v78, &qword_100205F68);
  unint64_t v38 = &v37[*(int *)(v77 + 36)];
  *unint64_t v38 = v28;
  *((void *)v38 + 1) = v30;
  *((void *)v38 + 2) = v32;
  *((void *)v38 + 3) = v34;
  *((void *)v38 + 4) = v36;
  v38[40] = 0;
  sub_10002784C((uint64_t)v14, &qword_100205F68);
  long long v103 = v113;
  *(void *)&long long v104 = v114;
  State.wrappedValue.getter();
  long long v103 = v88;
  long long v39 = (_OWORD *)swift_allocObject();
  long long v40 = *(_OWORD *)(a1 + 80);
  v39[5] = *(_OWORD *)(a1 + 64);
  v39[6] = v40;
  v39[7] = *(_OWORD *)(a1 + 96);
  *(_OWORD *)((char *)v39 + 121) = *(_OWORD *)(a1 + 105);
  long long v41 = *(_OWORD *)(a1 + 16);
  v39[1] = *(_OWORD *)a1;
  v39[2] = v41;
  long long v42 = *(_OWORD *)(a1 + 48);
  v39[3] = *(_OWORD *)(a1 + 32);
  v39[4] = v42;
  sub_100181174(a1);
  sub_1001807B0(&qword_100205F80, &qword_100205F70, (void (*)(void))sub_100182D3C);
  long long v43 = v76;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10002784C((uint64_t)v37, &qword_100205F70);
  (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v86, v43, v84);
  Divider.init()();
  long long v103 = v111;
  LOBYTE(v104) = v112;
  FocusState.wrappedValue.getter();
  if (v88 == 1)
  {
    uint64_t v44 = static Color.blue.getter();
    *((void *)&v104 + 1) = &type metadata for CustomEntryView.CheckmarkWidgetAppearance;
    *(void *)&long long v105 = &off_1001F1460;
    uint64_t v45 = (void *)swift_allocObject();
    *(void *)&long long v103 = v45;
    v45[2] = 0x72616D6B63656863;
    v45[3] = 0xE90000000000006BLL;
    v45[4] = v44;
    v45[5] = 0x4024000000000000;
    uint64_t v46 = (_OWORD *)swift_allocObject();
    long long v47 = *(_OWORD *)(a1 + 80);
    v46[5] = *(_OWORD *)(a1 + 64);
    v46[6] = v47;
    v46[7] = *(_OWORD *)(a1 + 96);
    *(_OWORD *)((char *)v46 + 121) = *(_OWORD *)(a1 + 105);
    long long v48 = *(_OWORD *)(a1 + 16);
    v46[1] = *(_OWORD *)a1;
    v46[2] = v48;
    long long v49 = *(_OWORD *)(a1 + 48);
    v46[3] = *(_OWORD *)(a1 + 32);
    v46[4] = v49;
    LOBYTE(v95) = 0;
    sub_100181174(a1);
    State.init(wrappedValue:)();
    char v92 = v88;
    uint64_t v93 = *((void *)&v88 + 1);
    sub_1000085E4(&v103, (uint64_t)&v88);
    long long v90 = sub_100182F50;
    uint64_t v91 = v46;
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    sub_100180C44((uint64_t)&v88, (uint64_t)&v103);
    *(_OWORD *)((char *)v107 + 8) = v108;
    *(_OWORD *)((char *)&v107[1] + 8) = v109;
    *(_OWORD *)((char *)&v107[2] + 8) = v110;
    sub_100180C7C((uint64_t)&v88);
    long long v99 = v107[0];
    long long v100 = v107[1];
    long long v101 = v107[2];
    uint64_t v102 = *(void *)&v107[3];
    long long v95 = v103;
    long long v96 = v104;
    long long v97 = v105;
    long long v98 = v106;
    sub_100008DD4((uint64_t)&v95, (uint64_t)&v88, &qword_100205DC0);
    char v94 = 0;
  }
  else
  {
    uint64_t v50 = static Color.gray.getter();
    *((void *)&v104 + 1) = &type metadata for CustomEntryView.XmarkWidgetAppearance;
    *(void *)&long long v105 = &off_1001F1480;
    uint64_t v51 = (void *)swift_allocObject();
    *(void *)&long long v103 = v51;
    v51[2] = 0x6B72616D78;
    v51[3] = 0xE500000000000000;
    v51[4] = v50;
    v51[5] = 0x4024000000000000;
    long long v52 = (_OWORD *)swift_allocObject();
    long long v53 = *(_OWORD *)(a1 + 80);
    v52[5] = *(_OWORD *)(a1 + 64);
    v52[6] = v53;
    v52[7] = *(_OWORD *)(a1 + 96);
    *(_OWORD *)((char *)v52 + 121) = *(_OWORD *)(a1 + 105);
    long long v54 = *(_OWORD *)(a1 + 16);
    v52[1] = *(_OWORD *)a1;
    v52[2] = v54;
    long long v55 = *(_OWORD *)(a1 + 48);
    v52[3] = *(_OWORD *)(a1 + 32);
    v52[4] = v55;
    LOBYTE(v95) = 0;
    sub_100181174(a1);
    State.init(wrappedValue:)();
    char v92 = v88;
    uint64_t v93 = *((void *)&v88 + 1);
    sub_1000085E4(&v103, (uint64_t)&v88);
    long long v90 = sub_100182E20;
    uint64_t v91 = v52;
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    sub_100180C44((uint64_t)&v88, (uint64_t)&v103);
    *(_OWORD *)((char *)v107 + 8) = v108;
    *(_OWORD *)((char *)&v107[1] + 8) = v109;
    *(_OWORD *)((char *)&v107[2] + 8) = v110;
    sub_100180C7C((uint64_t)&v88);
    long long v99 = v107[0];
    long long v100 = v107[1];
    long long v101 = v107[2];
    uint64_t v102 = *(void *)&v107[3];
    long long v95 = v103;
    long long v96 = v104;
    long long v97 = v105;
    long long v98 = v106;
    sub_100008DD4((uint64_t)&v95, (uint64_t)&v88, &qword_100205DC0);
    char v94 = 1;
  }
  sub_1000063C0(&qword_100205DC0);
  sub_1001807B0(&qword_100205F90, &qword_100205DC0, (void (*)(void))sub_100182E44);
  _ConditionalContent<>.init(storage:)();
  sub_10002784C((uint64_t)&v95, &qword_100205DC0);
  v56 = v82;
  uint64_t v57 = v83;
  uint64_t v58 = *(void (**)(char *, char *, uint64_t))(v83 + 16);
  uint64_t v59 = v84;
  v58(v82, v86, v84);
  uint64_t v61 = v80;
  uint64_t v60 = v81;
  uint64_t v78 = *(char **)(v80 + 16);
  ((void (*)(char *, char *, uint64_t))v78)(v85, v87, v81);
  sub_100008DD4((uint64_t)&v103, (uint64_t)&v88, &qword_100205FA0);
  uint64_t v62 = v79;
  v58(v79, v56, v59);
  uint64_t v63 = sub_1000063C0(&qword_100205FA8);
  uint64_t v64 = v85;
  ((void (*)(char *, char *, uint64_t))v78)(&v62[*(int *)(v63 + 48)], v85, v60);
  sub_100008DD4((uint64_t)&v88, (uint64_t)&v62[*(int *)(v63 + 64)], &qword_100205FA0);
  sub_10002784C((uint64_t)&v103, &qword_100205FA0);
  uint64_t v65 = *(void (**)(char *, uint64_t))(v61 + 8);
  v65(v87, v60);
  uint64_t v66 = *(void (**)(char *, uint64_t))(v57 + 8);
  v66(v86, v59);
  sub_10002784C((uint64_t)&v88, &qword_100205FA0);
  v65(v64, v60);
  return ((uint64_t (*)(char *, uint64_t))v66)(v82, v59);
}

uint64_t sub_100177264(uint64_t *a1)
{
  return State.wrappedValue.setter();
}

uint64_t sub_100177348@<X0>(uint64_t a1@<X8>)
{
  long long v3 = v1[5];
  v8[4] = v1[4];
  v8[5] = v3;
  v9[0] = v1[6];
  *(_OWORD *)((char *)v9 + 9) = *(_OWORD *)((char *)v1 + 105);
  long long v4 = v1[1];
  v8[0] = *v1;
  v8[1] = v4;
  long long v5 = v1[3];
  v8[2] = v1[2];
  v8[3] = v5;
  *(void *)a1 = static VerticalAlignment.center.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v6 = sub_1000063C0(&qword_100205F58);
  return sub_100176644((uint64_t)v8, (char *)(a1 + *(int *)(v6 + 44)));
}

uint64_t sub_1001773C0(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    goto LABEL_6;
  }
  if (!a1 && a2 == 0xE000000000000000)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    goto LABEL_7;
  }
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
LABEL_6:
    swift_bridgeObjectRetain();
    uint64_t v4 = a1;
    uint64_t v5 = a2;
  }
LABEL_7:
  sub_1000063C0(&qword_100205FB0);
  Binding.wrappedValue.getter();
  if (!v9)
  {
    if (!v5) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if (v8 != v4 || v9 != v5)
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6)
    {
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
LABEL_17:
    Binding.wrappedValue.setter();
    goto LABEL_18;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_18:
  sub_1000063C0(&qword_100201898);
  return Binding.wrappedValue.setter();
}

uint64_t sub_100177540@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (_OWORD *)v1;
  uint64_t v69 = a1;
  uint64_t v3 = type metadata accessor for SubmitTriggers();
  uint64_t v67 = *(void *)(v3 - 8);
  uint64_t v68 = v3;
  __chkstk_darwin(v3);
  uint64_t v66 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = type metadata accessor for RoundedBorderTextFieldStyle();
  uint64_t v51 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  char v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_1000063C0(&qword_1001FC950);
  uint64_t v50 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_1000063C0(&qword_100206180);
  uint64_t v54 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_1000063C0(&qword_100206188);
  uint64_t v57 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  long long v55 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_1000063C0(&qword_1001FBCB8);
  __chkstk_darwin(v52);
  uint64_t v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000063C0((uint64_t *)&unk_1001FBCC0);
  __chkstk_darwin(v14 - 8);
  uint64_t v59 = (uint64_t)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_1000063C0(&qword_100206190);
  __chkstk_darwin(v61);
  uint64_t v62 = (uint64_t)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000063C0(&qword_100206198);
  uint64_t v64 = *(void *)(v17 - 8);
  uint64_t v65 = v17;
  __chkstk_darwin(v17);
  uint64_t v63 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001FADF8 != -1) {
    swift_once();
  }
  long long v70 = *(_OWORD *)(v1 + 64);
  uint64_t v71 = *(void *)(v1 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000063C0(&qword_1001FF890);
  State.projectedValue.getter();
  TextField<>.init(_:text:onEditingChanged:onCommit:)();
  RoundedBorderTextFieldStyle.init()();
  uint64_t v19 = sub_100027F2C(&qword_100204058, &qword_1001FC950);
  uint64_t v20 = sub_100183BC0(&qword_1002061A0, (void (*)(uint64_t))&type metadata accessor for RoundedBorderTextFieldStyle);
  uint64_t v21 = v53;
  uint64_t v22 = v58;
  View.textFieldStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v6, v22);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v8, v21);
  long long v70 = *(_OWORD *)(v1 + 88);
  LOBYTE(v71) = *(unsigned char *)(v1 + 104);
  sub_1000063C0(&qword_1001FB608);
  FocusState.projectedValue.getter();
  *(void *)&long long v72 = v21;
  *((void *)&v72 + 1) = v22;
  *(void *)&long long v73 = v19;
  *((void *)&v73 + 1) = v20;
  swift_getOpaqueTypeConformance2();
  uint64_t v23 = v55;
  uint64_t v24 = v56;
  View.focused(_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v10, v24);
  static Alignment.trailing.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v25 = v57;
  uint64_t v26 = v60;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v13, v23, v60);
  unsigned __int8 v27 = &v13[*(int *)(v52 + 36)];
  long long v28 = v73;
  *(_OWORD *)unsigned __int8 v27 = v72;
  *((_OWORD *)v27 + 1) = v28;
  *((_OWORD *)v27 + 2) = v74;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v26);
  uint64_t v29 = static Alignment.center.getter();
  uint64_t v30 = v59;
  sub_10001A1B4(0.0, 1, 0.0, 1, 200.0, 0, 0.0, 1, v59, 0.0, 1, 0.0, 1, v29, v31);
  sub_10002784C((uint64_t)v13, &qword_1001FBCB8);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v33 = v62;
  sub_100008DD4(v30, v62, (uint64_t *)&unk_1001FBCC0);
  uint64_t v34 = v33 + *(int *)(v61 + 36);
  *(void *)uint64_t v34 = KeyPath;
  *(unsigned char *)(v34 + 8) = 2;
  sub_10002784C(v30, (uint64_t *)&unk_1001FBCC0);
  uint64_t v35 = (_OWORD *)swift_allocObject();
  long long v36 = v2[5];
  void v35[5] = v2[4];
  v35[6] = v36;
  *(_OWORD *)((char *)v35 + 105) = *(_OWORD *)((char *)v2 + 89);
  long long v37 = v2[1];
  v35[1] = *v2;
  _OWORD v35[2] = v37;
  long long v38 = v2[3];
  v35[3] = v2[2];
  v35[4] = v38;
  sub_100183818((uint64_t)v2);
  long long v39 = v66;
  static SubmitTriggers.text.getter();
  sub_1001838A4();
  long long v40 = v63;
  View.onSubmit(of:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v39, v68);
  sub_10002784C(v33, &qword_100206190);
  long long v41 = (_OWORD *)swift_allocObject();
  long long v42 = v2[5];
  v41[5] = v2[4];
  v41[6] = v42;
  *(_OWORD *)((char *)v41 + 105) = *(_OWORD *)((char *)v2 + 89);
  long long v43 = v2[1];
  v41[1] = *v2;
  v41[2] = v43;
  long long v44 = v2[3];
  v41[3] = v2[2];
  v41[4] = v44;
  uint64_t v46 = v64;
  uint64_t v45 = v65;
  uint64_t v47 = v69;
  (*(void (**)(uint64_t, char *, uint64_t))(v64 + 16))(v69, v40, v65);
  long long v48 = (uint64_t (**)())(v47 + *(int *)(sub_1000063C0(&qword_1002061C0) + 36));
  *long long v48 = sub_100183AD4;
  v48[1] = (uint64_t (*)())v41;
  v48[2] = 0;
  v48[3] = 0;
  sub_100183818((uint64_t)v2);
  return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v40, v45);
}

uint64_t sub_100177E80()
{
  sub_1000063C0(&qword_1001FF890);
  State.wrappedValue.getter();
  sub_1001773C0(v1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100177EF0(_OWORD *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000085FC(0, (unint64_t *)&qword_1001FF440);
  uint64_t v9 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v10 = (_OWORD *)swift_allocObject();
  long long v11 = a1[5];
  v10[5] = a1[4];
  v10[6] = v11;
  *(_OWORD *)((char *)v10 + 105) = *(_OWORD *)((char *)a1 + 89);
  long long v12 = a1[1];
  v10[1] = *a1;
  v10[2] = v12;
  long long v13 = a1[3];
  v10[3] = a1[2];
  v10[4] = v13;
  aBlock[4] = sub_100183B50;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100048B2C;
  aBlock[3] = &unk_1001F1328;
  uint64_t v14 = _Block_copy(aBlock);
  sub_100183818((uint64_t)a1);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_100183BC0((unint64_t *)&unk_1001FD330, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000063C0((uint64_t *)&unk_100201550);
  sub_100027F2C(&qword_1001FD340, (uint64_t *)&unk_100201550);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v17);
}

uint64_t sub_1001781F0@<X0>(uint64_t a1@<X8>)
{
  return sub_100177540(a1);
}

uint64_t sub_10017823C()
{
  return swift_retain();
}

double sub_100178244()
{
  return *(double *)(v0 + 24);
}

uint64_t sub_10017824C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000063C0(&qword_100203EB0);
  Bindable.wrappedValue.getter();
  swift_getKeyPath();
  sub_100183BC0(&qword_1001FD2E8, (void (*)(uint64_t))type metadata accessor for QuestionnaireEntry);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v7 = *(void *)(v18 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedAnswer);
  uint64_t v6 = *(void *)(v18 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedAnswer + 8);
  swift_bridgeObjectRetain();
  swift_release();
  if (!v6) {
    goto LABEL_7;
  }
  if (v7 == a1 && v6 == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v9)
  {
LABEL_9:
    Bindable.wrappedValue.getter();
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    swift_release();
    Bindable.wrappedValue.getter();
    uint64_t v15 = swift_getKeyPath();
    __chkstk_darwin(v15);
    goto LABEL_10;
  }
LABEL_7:
  Bindable.wrappedValue.getter();
  uint64_t v10 = v18;
  uint64_t v11 = swift_getKeyPath();
  v17[0] = v17;
  __chkstk_darwin(v11);
  v17[1] = a3;
  uint64_t v18 = v10;
  swift_bridgeObjectRetain();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  Bindable.wrappedValue.getter();
  uint64_t v12 = v18;
  uint64_t v13 = swift_getKeyPath();
  __chkstk_darwin(v13);
  uint64_t v18 = v12;
LABEL_10:
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  return swift_release();
}

uint64_t sub_100178618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000063C0(&qword_100205D48);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v22[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_1000063C0(&qword_100205D50);
  uint64_t v8 = v7 - 8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = &v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  uint64_t v13 = &v22[-v12];
  uint64_t v25 = static VerticalAlignment.center.getter();
  sub_10017D2C4((uint64_t)v26);
  uint64_t v14 = v26[0];
  uint64_t v15 = v26[1];
  char v16 = v27;
  uint64_t v17 = v28;
  uint64_t v24 = v29;
  int v23 = v30;
  *(void *)uint64_t v6 = static VerticalAlignment.center.getter();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v18 = sub_1000063C0(&qword_100205D58);
  sub_100178858(a1, (uint64_t)&v6[*(int *)(v18 + 44)]);
  sub_100008DD4((uint64_t)v6, (uint64_t)v11, &qword_100205D48);
  *(void *)&v11[*(int *)(v8 + 44)] = 0x4024000000000000;
  sub_10002784C((uint64_t)v6, &qword_100205D48);
  sub_100026FD0((uint64_t)v11, (uint64_t)v13, &qword_100205D50);
  sub_100008DD4((uint64_t)v13, (uint64_t)v11, &qword_100205D50);
  *(void *)a2 = v25;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v14;
  *(void *)(a2 + 32) = v15;
  *(unsigned char *)(a2 + 40) = v16;
  uint64_t v19 = v24;
  *(void *)(a2 + 48) = v17;
  *(void *)(a2 + 56) = v19;
  *(unsigned char *)(a2 + 64) = v23;
  uint64_t v20 = sub_1000063C0(&qword_100205D60);
  sub_100008DD4((uint64_t)v11, a2 + *(int *)(v20 + 48), &qword_100205D50);
  sub_10002783C(v14, v15, v16);
  swift_bridgeObjectRetain();
  sub_10002784C((uint64_t)v13, &qword_100205D50);
  sub_10002784C((uint64_t)v11, &qword_100205D50);
  sub_100026F18(v14, v15, v16);
  return swift_bridgeObjectRelease();
}

void sub_100178858(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v102 = a2;
  uint64_t v101 = sub_1000063C0(&qword_100205D68);
  __chkstk_darwin(v101);
  long long v95 = (char *)v82 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Divider();
  uint64_t v88 = *(void *)(v4 - 8);
  uint64_t v89 = v4;
  __chkstk_darwin(v4);
  long long v87 = (char *)v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_1000063C0(&qword_100205D70);
  uint64_t v6 = __chkstk_darwin(v86);
  uint64_t v91 = (uint64_t)v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v85 = (char *)v82 - v9;
  __chkstk_darwin(v8);
  uint64_t v90 = (uint64_t)v82 - v10;
  uint64_t v11 = sub_1000063C0(&qword_100205D78);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  long long v97 = (char *)v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v99 = (uint64_t)v82 - v14;
  uint64_t v15 = type metadata accessor for MultichoiceRow(0);
  uint64_t v16 = v15 - 8;
  uint64_t v96 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v96 + 64);
  __chkstk_darwin(v15);
  uint64_t v98 = (uint64_t)v82 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000063C0(&qword_100205D80);
  uint64_t v93 = *(void *)(v18 - 8);
  uint64_t v94 = v18;
  uint64_t v19 = __chkstk_darwin(v18);
  char v92 = (char *)v82 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  long long v103 = (char *)v82 - v21;
  uint64_t v100 = sub_1000063C0(&qword_100205D88);
  __chkstk_darwin(v100);
  int v23 = (long long *)((char *)v82 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v24 = sub_1000063C0(&qword_100203EB0);
  __chkstk_darwin(v24);
  uint64_t v26 = (char *)v82 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = a1;
  uint64_t v28 = a1 + *(int *)(v16 + 28);
  char v29 = *(unsigned char *)v28;
  uint64_t v30 = *(void *)(v28 + 8);
  LOBYTE(v109) = *(unsigned char *)v28;
  *((void *)&v109 + 1) = v30;
  sub_1000063C0(&qword_1001FB5A8);
  State.wrappedValue.getter();
  if (v104 == 1)
  {
    LOBYTE(v104) = v29;
    *((void *)&v104 + 1) = v30;
    State.projectedValue.getter();
    long long v31 = v109;
    char v32 = v110;
    Bindable.projectedValue.getter();
    sub_100180CAC(v31, *((uint64_t *)&v31 + 1), v32, (uint64_t)v26, &v109);
    long long v33 = v114;
    long long v34 = v115[0];
    long long v35 = v112;
    v23[4] = v113;
    v23[5] = v33;
    v23[6] = v34;
    *(long long *)((char *)v23 + 105) = *(_OWORD *)((char *)v115 + 9);
    long long v36 = v110;
    long long v37 = v111;
    *int v23 = v109;
    v23[1] = v36;
    v23[2] = v37;
    v23[3] = v35;
    swift_storeEnumTagMultiPayload();
    sub_100180AC4();
    sub_100027F2C(&qword_100205DB8, &qword_100205D68);
    _ConditionalContent<>.init(storage:)();
    return;
  }
  uint64_t v84 = v23;
  v82[1] = v24;
  Bindable.wrappedValue.getter();
  id v38 = *(id *)(v109 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry_entry);
  swift_release();
  id v39 = [v38 answerOptions];

  if (v39)
  {
    id v40 = [v39 array];

    uint64_t v41 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v42 = *(void *)(v41 + 16);
    *(void *)&long long v109 = 0;
    *((void *)&v109 + 1) = v42;
    swift_getKeyPath();
    uint64_t v83 = v27;
    uint64_t v43 = v98;
    sub_10017F434(v27, v98, type metadata accessor for MultichoiceRow);
    uint64_t v44 = *(unsigned __int8 *)(v96 + 80);
    uint64_t v45 = (v44 + 16) & ~v44;
    uint64_t v96 = v45 + v17;
    v82[0] = v44 | 7;
    uint64_t v46 = swift_allocObject();
    sub_10017F4A0(v43, v46 + v45, type metadata accessor for MultichoiceRow);
    sub_1000063C0(&qword_100202ED0);
    sub_1000063C0(&qword_100205D90);
    sub_10010688C();
    sub_100027F2C(&qword_100205D98, &qword_100205D90);
    ForEach<>.init(_:id:content:)();
    *((void *)&v110 + 1) = &type metadata for WritingTools;
    *(void *)&long long v111 = sub_1000268F4();
    LOBYTE(v109) = 11;
    LOBYTE(v40) = isFeatureEnabled(_:)();
    sub_100027DBC((uint64_t)&v109);
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v49 = sub_1000063C0(&qword_100205DA0);
      uint64_t v50 = v99;
      (*(void (**)(void))(*(void *)(v49 - 8) + 56))();
      uint64_t v51 = (uint64_t)v95;
      uint64_t v52 = (uint64_t)v97;
      uint64_t v53 = (uint64_t)v84;
LABEL_28:
      uint64_t v77 = v92;
      uint64_t v76 = v93;
      uint64_t v78 = *(void (**)(char *, char *, uint64_t))(v93 + 16);
      uint64_t v79 = v94;
      v78(v92, v103, v94);
      sub_100008DD4(v50, v52, &qword_100205D78);
      v78((char *)v51, v77, v79);
      uint64_t v80 = sub_1000063C0(&qword_100205DA8);
      sub_100008DD4(v52, v51 + *(int *)(v80 + 48), &qword_100205D78);
      sub_10002784C(v52, &qword_100205D78);
      uint64_t v81 = *(void (**)(char *, uint64_t))(v76 + 8);
      v81(v77, v79);
      sub_100008DD4(v51, v53, &qword_100205D68);
      swift_storeEnumTagMultiPayload();
      sub_100180AC4();
      sub_100027F2C(&qword_100205DB8, &qword_100205D68);
      _ConditionalContent<>.init(storage:)();
      sub_10002784C(v51, &qword_100205D68);
      sub_10002784C(v99, &qword_100205D78);
      v81(v103, v79);
      return;
    }
    uint64_t v47 = v45;
    uint64_t v48 = (uint64_t)v97;
    if (!v42)
    {
      long long v110 = 0u;
      long long v109 = 0u;
LABEL_10:
      swift_bridgeObjectRelease();
      if (*((void *)&v110 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v54 = *((void *)&v104 + 1);
          uint64_t v55 = v104;
LABEL_15:
          Bindable.wrappedValue.getter();
          uint64_t v56 = v109;
          swift_getKeyPath();
          *(void *)&long long v109 = v56;
          sub_100183BC0(&qword_1001FD2E8, (void (*)(uint64_t))type metadata accessor for QuestionnaireEntry);
          ObservationRegistrar.access<A, B>(_:keyPath:)();
          swift_release();
          uint64_t v58 = *(void *)(v56 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedAnswer);
          uint64_t v57 = *(void *)(v56 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedAnswer + 8);
          swift_bridgeObjectRetain();
          swift_release();
          if (v54)
          {
            if (v57)
            {
              if (v55 == v58 && v54 == v57)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                double v59 = 0.0;
              }
              else
              {
                char v60 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v60) {
                  double v59 = 0.0;
                }
                else {
                  double v59 = 1.0;
                }
              }
            }
            else
            {
              swift_bridgeObjectRelease();
              double v59 = 1.0;
            }
            uint64_t v51 = (uint64_t)v95;
          }
          else
          {
            uint64_t v51 = (uint64_t)v95;
            if (v57)
            {
              swift_bridgeObjectRelease();
              double v59 = 1.0;
            }
            else
            {
              double v59 = 0.0;
            }
          }
          uint64_t v61 = v87;
          Divider.init()();
          uint64_t v63 = v88;
          uint64_t v62 = v89;
          uint64_t v64 = v85;
          (*(void (**)(char *, char *, uint64_t))(v88 + 16))(v85, v61, v89);
          *(double *)&v64[*(int *)(v86 + 36)] = v59;
          (*(void (**)(char *, uint64_t))(v63 + 8))(v61, v62);
          uint64_t v65 = (uint64_t)v64;
          uint64_t v66 = v90;
          sub_100026FD0(v65, v90, &qword_100205D70);
          uint64_t v67 = static Color.gray.getter();
          *((void *)&v105 + 1) = &type metadata for MultichoiceRow.MoreWidgetAppearance;
          *(void *)&long long v106 = &off_1001F1100;
          uint64_t v68 = (void *)swift_allocObject();
          *(void *)&long long v104 = v68;
          v68[2] = 0x73697370696C6C65;
          v68[3] = 0xEF656C637269632ELL;
          v68[4] = v67;
          v68[5] = 0x4014000000000000;
          uint64_t v69 = v98;
          sub_10017F434(v83, v98, type metadata accessor for MultichoiceRow);
          uint64_t v70 = swift_allocObject();
          sub_10017F4A0(v69, v70 + v47, type metadata accessor for MultichoiceRow);
          LOBYTE(v116) = 0;
          State.init(wrappedValue:)();
          BYTE8(v112) = v109;
          *(void *)&long long v113 = *((void *)&v109 + 1);
          sub_1000085E4(&v104, (uint64_t)&v109);
          *((void *)&v111 + 1) = sub_100180C18;
          *(void *)&long long v112 = v70;
          static Alignment.center.getter();
          _FrameLayout.init(width:height:alignment:)();
          sub_100180C44((uint64_t)&v109, (uint64_t)&v104);
          *(_OWORD *)&v108[8] = v116;
          *(_OWORD *)&v108[24] = v117;
          *(_OWORD *)&v108[40] = v118;
          sub_100180C7C((uint64_t)&v109);
          long long v114 = *(_OWORD *)&v108[16];
          v115[0] = *(_OWORD *)&v108[32];
          long long v109 = v104;
          long long v110 = v105;
          long long v111 = v106;
          *(void *)&v115[1] = *(void *)&v108[48];
          long long v112 = v107;
          long long v113 = *(_OWORD *)v108;
          uint64_t v71 = v91;
          sub_100008DD4(v66, v91, &qword_100205D70);
          sub_100008DD4((uint64_t)&v109, (uint64_t)&v104, &qword_100205DC0);
          sub_100008DD4(v71, v48, &qword_100205D70);
          uint64_t v72 = sub_1000063C0(&qword_100205DC8);
          sub_100008DD4((uint64_t)&v104, v48 + *(int *)(v72 + 48), &qword_100205DC0);
          sub_10002784C((uint64_t)&v109, &qword_100205DC0);
          sub_10002784C(v66, &qword_100205D70);
          sub_10002784C((uint64_t)&v104, &qword_100205DC0);
          sub_10002784C(v71, &qword_100205D70);
          uint64_t v73 = sub_1000063C0(&qword_100205DA0);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v48, 0, 1, v73);
          uint64_t v74 = v99;
          sub_100026FD0(v48, v99, &qword_100205D78);
          uint64_t v75 = v48;
          uint64_t v50 = v74;
          uint64_t v53 = (uint64_t)v84;
          uint64_t v52 = v75;
          goto LABEL_28;
        }
      }
      else
      {
        sub_10002784C((uint64_t)&v109, &qword_1001FD2E0);
      }
      uint64_t v55 = 0;
      uint64_t v54 = 0;
      goto LABEL_15;
    }
    if (v42 <= *(void *)(v41 + 16))
    {
      sub_100027E0C(v41 + 32 * v42, (uint64_t)&v109);
      goto LABEL_10;
    }
    __break(1u);
  }
  __break(1u);
}

void sub_1001795C4(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for MultichoiceRow(0);
  uint64_t v85 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  uint64_t v86 = v7;
  uint64_t v87 = (uint64_t)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_1000063C0(&qword_1001FC6B8);
  uint64_t v91 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  uint64_t v90 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000063C0(&qword_100205DD0);
  uint64_t v95 = *(void *)(v9 - 8);
  uint64_t v96 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v94 = (char *)&v78 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v89 = (char *)&v78 - v13;
  __chkstk_darwin(v12);
  char v92 = (char *)&v78 - v14;
  uint64_t v15 = type metadata accessor for Divider();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_1000063C0(&qword_100201C10);
  __chkstk_darwin(v80);
  uint64_t v20 = (char *)&v78 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_1000063C0(&qword_100205DD8);
  uint64_t v84 = *(void *)(v83 - 8);
  uint64_t v21 = __chkstk_darwin(v83);
  int v23 = (char *)&v78 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v79 = (uint64_t)&v78 - v24;
  uint64_t v25 = sub_1000063C0(&qword_100205DE0);
  uint64_t v26 = __chkstk_darwin(v25 - 8);
  uint64_t v88 = (uint64_t)&v78 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  uint64_t v98 = (char *)&v78 - v28;
  uint64_t v29 = *a1;
  uint64_t v99 = sub_1000063C0(&qword_100203EB0);
  uint64_t v97 = a2;
  Bindable.wrappedValue.getter();
  id v30 = *(id *)(v102 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry_entry);
  swift_release();
  id v31 = [v30 answerOptions];

  if (!v31) {
    goto LABEL_23;
  }
  id v32 = [v31 objectAtIndexedSubscript:v29];

  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  uint64_t v33 = v101;
  uint64_t v82 = v100;
  uint64_t v81 = a3;
  if (v29 >= 1)
  {
    Divider.init()();
    unsigned __int8 v34 = static Edge.Set.top.getter();
    unsigned __int8 v35 = static Edge.Set.bottom.getter();
    char v36 = Edge.Set.init(rawValue:)();
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v34) {
      char v36 = Edge.Set.init(rawValue:)();
    }
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v35) {
      char v36 = Edge.Set.init(rawValue:)();
    }
    EdgeInsets.init(_all:)();
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    uint64_t v44 = v43;
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v20, v18, v15);
    uint64_t v45 = &v20[*(int *)(v80 + 36)];
    *uint64_t v45 = v36;
    *((void *)v45 + 1) = v38;
    *((void *)v45 + 2) = v40;
    *((void *)v45 + 3) = v42;
    *((void *)v45 + 4) = v44;
    v45[40] = 0;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    uint64_t v46 = v97;
    Bindable.wrappedValue.getter();
    uint64_t v47 = v102;
    swift_getKeyPath();
    *(void *)&long long v102 = v47;
    sub_100183BC0(&qword_1001FD2E8, (void (*)(uint64_t))type metadata accessor for QuestionnaireEntry);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    uint64_t v48 = *(void *)(v47 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedIndex);
    char v49 = *(unsigned char *)(v47 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedIndex + 8);
    swift_release();
    uint64_t v50 = (uint64_t)v98;
    if (v49)
    {
LABEL_8:
      double v51 = 1.0;
LABEL_13:
      sub_100008DD4((uint64_t)v20, (uint64_t)v23, &qword_100201C10);
      uint64_t v53 = v83;
      *(double *)&v23[*(int *)(v83 + 36)] = v51;
      sub_10002784C((uint64_t)v20, &qword_100201C10);
      uint64_t v54 = v79;
      sub_100026FD0((uint64_t)v23, v79, &qword_100205DD8);
      sub_100026FD0(v54, v50, &qword_100205DD8);
      uint64_t v52 = 0;
      goto LABEL_14;
    }
    double v51 = 0.0;
    if (v48 == v29) {
      goto LABEL_13;
    }
    if (!__OFADD__(v48, 1))
    {
      if (v48 + 1 == v29) {
        goto LABEL_13;
      }
      goto LABEL_8;
    }
    __break(1u);
LABEL_23:
    __break(1u);
    return;
  }
  uint64_t v52 = 1;
  uint64_t v46 = v97;
  uint64_t v50 = (uint64_t)v98;
  uint64_t v53 = v83;
LABEL_14:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v84 + 56))(v50, v52, 1, v53);
  uint64_t v55 = v82;
  *(void *)&long long v102 = v82;
  *((void *)&v102 + 1) = v33;
  uint64_t v56 = v87;
  sub_10017F434(v46, v87, type metadata accessor for MultichoiceRow);
  unint64_t v57 = (*(unsigned __int8 *)(v85 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80);
  unint64_t v58 = (v86 + v57 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v59 = swift_allocObject();
  sub_10017F4A0(v56, v59 + v57, type metadata accessor for MultichoiceRow);
  char v60 = (void *)(v59 + v58);
  *char v60 = v55;
  v60[1] = v33;
  *(void *)(v59 + ((v58 + 23) & 0xFFFFFFFFFFFFFFF8)) = v29;
  sub_10002DF54();
  swift_bridgeObjectRetain_n();
  uint64_t v61 = v90;
  Button<>.init<A>(_:action:)();
  Bindable.wrappedValue.getter();
  uint64_t v62 = v102;
  swift_getKeyPath();
  *(void *)&long long v102 = v62;
  sub_100183BC0(&qword_1001FD2E8, (void (*)(uint64_t))type metadata accessor for QuestionnaireEntry);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v64 = *(void *)(v62 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedAnswer);
  uint64_t v63 = *(void *)(v62 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedAnswer + 8);
  swift_bridgeObjectRetain();
  swift_release();
  if (v63)
  {
    uint64_t v65 = v81;
    if (v64 == v55 && v63 == v33) {
      char v66 = 1;
    }
    else {
      char v66 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v66 = 0;
    uint64_t v65 = v81;
  }
  swift_bridgeObjectRelease();
  long long v102 = xmmword_100195260;
  char v103 = v66 & 1;
  sub_100027F2C((unint64_t *)&unk_1001FDDF0, &qword_1001FC6B8);
  sub_100181444();
  uint64_t v67 = v89;
  uint64_t v68 = v93;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v91 + 8))(v61, v68);
  uint64_t v69 = v95;
  uint64_t v70 = v92;
  uint64_t v71 = v67;
  uint64_t v72 = v96;
  (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v92, v71, v96);
  uint64_t v73 = v88;
  sub_100008DD4(v50, v88, &qword_100205DE0);
  uint64_t v74 = *(void (**)(char *, char *, uint64_t))(v69 + 16);
  uint64_t v75 = v94;
  v74(v94, v70, v72);
  sub_100008DD4(v73, v65, &qword_100205DE0);
  uint64_t v76 = sub_1000063C0(&qword_100205DF0);
  v74((char *)(v65 + *(int *)(v76 + 48)), v75, v72);
  uint64_t v77 = *(void (**)(char *, uint64_t))(v69 + 8);
  v77(v70, v72);
  sub_10002784C(v50, &qword_100205DE0);
  v77(v75, v72);
  sub_10002784C(v73, &qword_100205DE0);
}

uint64_t sub_10017A080()
{
  return State.wrappedValue.setter();
}

uint64_t sub_10017A0EC@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = static HorizontalAlignment.center.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = sub_1000063C0(&qword_100205D40);
  return sub_100178618(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_10017A138@<X0>(int a1@<W1>, uint64_t a2@<X8>, double a3@<D1>)
{
  int v70 = a1;
  uint64_t v78 = a2;
  uint64_t v76 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v76);
  uint64_t v5 = (double *)((char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v77 = sub_1000063C0(&qword_100202510);
  __chkstk_darwin(v77);
  uint64_t v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ButtonStyleConfiguration.Label();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000063C0((uint64_t *)&unk_1002024D0);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_1000063C0(&qword_1002024C0);
  __chkstk_darwin(v67);
  uint64_t v16 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_1000063C0(&qword_100205FB8);
  __chkstk_darwin(v68);
  uint64_t v18 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000063C0(&qword_100205FC0);
  uint64_t v74 = *(void *)(v19 - 8);
  uint64_t v75 = v19;
  __chkstk_darwin(v19);
  uint64_t v71 = (char *)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_1000063C0(&qword_100205FC8);
  __chkstk_darwin(v69);
  uint64_t v22 = (char *)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_1000063C0(&qword_100205FD0);
  __chkstk_darwin(v72);
  uint64_t v73 = (uint64_t)&v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  ButtonStyleConfiguration.label.getter();
  static Alignment.center.getter();
  __n128 v24 = sub_100019DD0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v14, 0.0, 1, INFINITY, 0);
  (*(void (**)(char *, uint64_t, __n128))(v9 + 8))(v11, v8, v24);
  LOBYTE(v8) = static Edge.Set.leading.getter();
  unsigned __int8 v25 = static Edge.Set.trailing.getter();
  char v26 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v8) {
    char v26 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v25) {
    char v26 = Edge.Set.init(rawValue:)();
  }
  uint64_t v27 = v68;
  EdgeInsets.init(_all:)();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  sub_100008DD4((uint64_t)v14, (uint64_t)v16, (uint64_t *)&unk_1002024D0);
  char v36 = &v16[*(int *)(v67 + 36)];
  char *v36 = v26;
  *((void *)v36 + 1) = v29;
  *((void *)v36 + 2) = v31;
  *((void *)v36 + 3) = v33;
  *((void *)v36 + 4) = v35;
  v36[40] = 0;
  sub_10002784C((uint64_t)v14, (uint64_t *)&unk_1002024D0);
  unsigned __int8 v37 = static Edge.Set.top.getter();
  unsigned __int8 v38 = static Edge.Set.bottom.getter();
  char v39 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v37) {
    char v39 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v38) {
    char v39 = Edge.Set.init(rawValue:)();
  }
  EdgeInsets.init(_all:)();
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  sub_100008DD4((uint64_t)v16, (uint64_t)v18, &qword_1002024C0);
  uint64_t v48 = &v18[*(int *)(v27 + 36)];
  *uint64_t v48 = v39;
  *((void *)v48 + 1) = v41;
  *((void *)v48 + 2) = v43;
  *((void *)v48 + 3) = v45;
  *((void *)v48 + 4) = v47;
  v48[40] = 0;
  sub_10002784C((uint64_t)v16, &qword_1002024C0);
  if (v70) {
    static Font.Weight.medium.getter();
  }
  else {
    static Font.Weight.regular.getter();
  }
  sub_1001807B0(&qword_100205FD8, &qword_100205FB8, (void (*)(void))sub_1000FB344);
  char v49 = v71;
  View.fontWeight(_:)();
  sub_10002784C((uint64_t)v18, &qword_100205FB8);
  uint64_t v50 = (char *)v5 + *(int *)(v76 + 20);
  uint64_t v51 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v52 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v52 - 8) + 104))(v50, v51, v52);
  *uint64_t v5 = a3;
  v5[1] = a3;
  static Color.gray.getter();
  uint64_t v53 = Color.opacity(_:)();
  swift_release();
  sub_10017F434((uint64_t)v5, (uint64_t)v7, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v54 = v77;
  *(void *)&v7[*(int *)(v77 + 52)] = v53;
  *(_WORD *)&v7[*(int *)(v54 + 56)] = 256;
  sub_1000BEA48((uint64_t)v5);
  uint64_t v55 = static Alignment.center.getter();
  uint64_t v57 = v56;
  uint64_t v58 = (uint64_t)&v22[*(int *)(v69 + 36)];
  sub_100008DD4((uint64_t)v7, v58, &qword_100202510);
  uint64_t v59 = (uint64_t *)(v58 + *(int *)(sub_1000063C0(&qword_1001FC7C0) + 36));
  *uint64_t v59 = v55;
  v59[1] = v57;
  uint64_t v61 = v74;
  uint64_t v60 = v75;
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v22, v49, v75);
  sub_10002784C((uint64_t)v7, &qword_100202510);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v49, v60);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v62 = v73;
  sub_100008DD4((uint64_t)v22, v73, &qword_100205FC8);
  uint64_t v63 = (_OWORD *)(v62 + *(int *)(v72 + 36));
  long long v64 = v80;
  *uint64_t v63 = v79;
  v63[1] = v64;
  v63[2] = v81;
  sub_10002784C((uint64_t)v22, &qword_100205FC8);
  return sub_100026FD0(v62, v78, &qword_100205FD0);
}

uint64_t sub_10017A924@<X0>(uint64_t a1@<X8>)
{
  return sub_10017A138(*(unsigned __int8 *)(v1 + 16), a1, *(double *)(v1 + 8));
}

uint64_t sub_10017A930@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0x6472616F6279656BLL;
  a2[1] = 0xE800000000000000;
  a2[2] = static Color.gray.getter();
  a2[3] = 0x402E000000000000;
  uint64_t v4 = type metadata accessor for PickerRowCore(0);
  uint64_t v5 = (char *)a2 + *(int *)(v4 + 32);
  State.init(wrappedValue:)();
  *uint64_t v5 = v9;
  *((void *)v5 + 1) = *((void *)&v9 + 1);
  uint64_t v6 = (char *)a2 + *(int *)(v4 + 36);
  State.init(wrappedValue:)();
  *(_OWORD *)uint64_t v6 = v9;
  type metadata accessor for QuestionnaireEntry();
  sub_100183BC0(&qword_1001FD2E8, (void (*)(uint64_t))type metadata accessor for QuestionnaireEntry);
  swift_retain();
  Bindable<A>.init(wrappedValue:)();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v7 = *(void *)(a1 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedIndex);
  LOBYTE(v4) = *(unsigned char *)(a1 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedIndex + 8);
  uint64_t result = swift_release();
  if ((v4 & 1) == 0)
  {
    uint64_t result = swift_release();
    *(void *)uint64_t v6 = v7;
    *((void *)v6 + 1) = 0;
  }
  return result;
}

uint64_t sub_10017AAC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000063C0(&qword_100205E28);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000063C0(&qword_100205E30);
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000063C0(&qword_100205E38);
  uint64_t v10 = v9 - 8;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v25 - v14;
  uint64_t v30 = static VerticalAlignment.center.getter();
  sub_10017D2C4((uint64_t)&v31);
  uint64_t v25 = *((void *)&v31 + 1);
  uint64_t v26 = v31;
  char v16 = v32;
  uint64_t v27 = *((void *)&v32 + 1);
  uint64_t v29 = v33;
  int v28 = BYTE8(v33);
  *(void *)uint64_t v4 = static VerticalAlignment.center.getter();
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  uint64_t v17 = &v4[*(int *)(sub_1000063C0(&qword_100205E40) + 44)];
  sub_1000063C0(&qword_100203EB0);
  Bindable.wrappedValue.getter();
  sub_10017A930(v31, v17);
  sub_100008DD4((uint64_t)v4, (uint64_t)v8, &qword_100205E28);
  *(void *)&v8[*(int *)(v6 + 44)] = 0x4024000000000000;
  sub_10002784C((uint64_t)v4, &qword_100205E28);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100008DD4((uint64_t)v8, (uint64_t)v13, &qword_100205E30);
  uint64_t v18 = &v13[*(int *)(v10 + 44)];
  long long v19 = v32;
  *(_OWORD *)uint64_t v18 = v31;
  *((_OWORD *)v18 + 1) = v19;
  *((_OWORD *)v18 + 2) = v33;
  sub_10002784C((uint64_t)v8, &qword_100205E30);
  sub_100026FD0((uint64_t)v13, (uint64_t)v15, &qword_100205E38);
  sub_100008DD4((uint64_t)v15, (uint64_t)v13, &qword_100205E38);
  *(void *)a1 = v30;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v21 = v25;
  uint64_t v20 = v26;
  *(void *)(a1 + 24) = v26;
  *(void *)(a1 + 32) = v21;
  *(unsigned char *)(a1 + 40) = v16;
  uint64_t v22 = v29;
  *(void *)(a1 + 48) = v27;
  *(void *)(a1 + 56) = v22;
  *(unsigned char *)(a1 + 64) = v28;
  uint64_t v23 = sub_1000063C0(&qword_100205E48);
  sub_100008DD4((uint64_t)v13, a1 + *(int *)(v23 + 48), &qword_100205E38);
  sub_10002783C(v20, v21, v16);
  swift_bridgeObjectRetain();
  sub_10002784C((uint64_t)v15, &qword_100205E38);
  sub_10002784C((uint64_t)v13, &qword_100205E38);
  sub_100026F18(v20, v21, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10017ADDC()
{
  uint64_t v0 = sub_1000063C0(&qword_100205DF8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000063C0(&qword_100205E00);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = static HorizontalAlignment.center.getter();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v6 = sub_1000063C0(&qword_100205E08);
  sub_10017AAC0((uint64_t)&v5[*(int *)(v6 + 44)]);
  sub_100008DD4((uint64_t)v5, (uint64_t)v2, &qword_100205E00);
  swift_storeEnumTagMultiPayload();
  sub_1000063C0(&qword_100205E10);
  sub_100027F2C(&qword_100205E18, &qword_100205E10);
  sub_100027F2C(&qword_100205E20, &qword_100205E00);
  _ConditionalContent<>.init(storage:)();
  return sub_10002784C((uint64_t)v5, &qword_100205E00);
}

uint64_t sub_10017AF94()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PickerRowCore(0);
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v2);
  uint64_t v6 = sub_1000063C0(&qword_100206038);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = static VerticalAlignment.center.getter();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v9 = sub_1000063C0(&qword_100206040);
  sub_10017B1EC(v1, (uint64_t)&v8[*(int *)(v9 + 44)]);
  uint64_t v10 = v1 + *(int *)(v3 + 40);
  char v11 = *(unsigned char *)v10;
  uint64_t v12 = *(void *)(v10 + 8);
  char v17 = v11;
  uint64_t v18 = v12;
  sub_1000063C0(&qword_1001FB5A8);
  State.wrappedValue.getter();
  char v17 = v19;
  sub_10017F434(v1, (uint64_t)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for PickerRowCore);
  unint64_t v13 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v14 = swift_allocObject();
  sub_10017F4A0((uint64_t)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13, type metadata accessor for PickerRowCore);
  sub_100027F2C(&qword_100206048, &qword_100206038);
  View.onChange<A>(of:initial:_:)();
  swift_release();
  return sub_10002784C((uint64_t)v8, &qword_100206038);
}

uint64_t sub_10017B1EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v25 = sub_1000063C0(&qword_100206058);
  __chkstk_darwin(v25);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1000063C0(&qword_100206060);
  __chkstk_darwin(v23);
  uint64_t v6 = (_OWORD *)((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_1000063C0(&qword_100203EB0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(int *)(type metadata accessor for PickerRowCore(0) + 32);
  uint64_t v22 = a1;
  char v11 = (char *)(a1 + v10);
  char v12 = *v11;
  uint64_t v13 = *((void *)v11 + 1);
  LOBYTE(v28) = *v11;
  *((void *)&v28 + 1) = v13;
  sub_1000063C0(&qword_1001FB5A8);
  State.wrappedValue.getter();
  if (LOBYTE(v27[0]) == 1)
  {
    LOBYTE(v27[0]) = v12;
    *((void *)&v27[0] + 1) = v13;
    State.projectedValue.getter();
    long long v14 = v28;
    char v15 = v29;
    Bindable.projectedValue.getter();
    sub_100180CAC(v14, *((uint64_t *)&v14 + 1), v15, (uint64_t)v9, v27);
    sub_100107D98((uint64_t)v27);
    sub_100026FD0((uint64_t)v27, (uint64_t)&v26, &qword_100206090);
    sub_100183218();
    sub_100180AC4();
    _ConditionalContent<>.init(storage:)();
    long long v16 = v33;
    v6[4] = v32;
    v6[5] = v16;
    v6[6] = v34[0];
    *(_OWORD *)((char *)v6 + 106) = *(_OWORD *)((char *)v34 + 10);
    long long v17 = v29;
    *uint64_t v6 = v28;
    v6[1] = v17;
    long long v18 = v31;
    v6[2] = v30;
    v6[3] = v18;
    swift_storeEnumTagMultiPayload();
    sub_1000063C0(&qword_100206070);
    sub_10018319C();
    sub_100027F2C(&qword_100206088, &qword_100206058);
    return _ConditionalContent<>.init(storage:)();
  }
  else
  {
    *(void *)uint64_t v4 = static HorizontalAlignment.center.getter();
    *((void *)v4 + 1) = 0;
    v4[16] = 1;
    uint64_t v20 = sub_1000063C0(&qword_100206068);
    sub_10017B56C(v22, &v4[*(int *)(v20 + 44)]);
    sub_100008DD4((uint64_t)v4, (uint64_t)v6, &qword_100206058);
    swift_storeEnumTagMultiPayload();
    sub_1000063C0(&qword_100206070);
    sub_10018319C();
    sub_100027F2C(&qword_100206088, &qword_100206058);
    _ConditionalContent<>.init(storage:)();
    return sub_10002784C((uint64_t)v4, &qword_100206058);
  }
}

uint64_t sub_10017B56C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v3 = type metadata accessor for PickerRowCore(0);
  uint64_t v4 = v3 - 8;
  uint64_t v49 = *(void *)(v3 - 8);
  uint64_t v48 = *(void *)(v49 + 64);
  __chkstk_darwin(v3);
  uint64_t v47 = (uint64_t)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_1000063C0(&qword_1001FBCA8);
  uint64_t v42 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000063C0(&qword_1001FBCB0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_1000063C0(&qword_100206098);
  __chkstk_darwin(v43);
  uint64_t v41 = (uint64_t)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_1000063C0(&qword_1002060A0);
  uint64_t v38 = *(void *)(v46 - 8);
  uint64_t v12 = __chkstk_darwin(v46);
  long long v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v45 = (char *)&v37 - v15;
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v40 = *(int *)(v4 + 44);
  long long v52 = *(_OWORD *)(a1 + v40);
  uint64_t v39 = sub_1000063C0(&qword_100206050);
  State.projectedValue.getter();
  uint64_t v51 = a1;
  sub_1000063C0(&qword_1002060A8);
  sub_100027F2C(&qword_1002060B0, &qword_1002060A8);
  Picker<>.init(_:selection:content:)();
  uint64_t v16 = static Alignment.center.getter();
  double v18 = sub_10001A224(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v10, 0.0, 1, 0.0, 1, v16, v17);
  (*(void (**)(char *, uint64_t, double))(v42 + 8))(v7, v44, v18);
  uint64_t v19 = *(void *)(a1 + 16);
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)&long long v53 = v19;
  swift_retain_n();
  uint64_t v21 = AnyShapeStyle.init<A>(_:)();
  uint64_t v22 = v41;
  sub_100008DD4((uint64_t)v10, v41, &qword_1001FBCB0);
  swift_release();
  uint64_t v23 = (uint64_t *)(v22 + *(int *)(v43 + 36));
  *uint64_t v23 = KeyPath;
  v23[1] = v21;
  sub_10002784C((uint64_t)v10, &qword_1001FBCB0);
  long long v53 = *(_OWORD *)(a1 + v40);
  State.wrappedValue.getter();
  uint64_t v24 = v47;
  sub_10017F434(a1, v47, type metadata accessor for PickerRowCore);
  unint64_t v25 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
  uint64_t v26 = swift_allocObject();
  sub_10017F4A0(v24, v26 + v25, type metadata accessor for PickerRowCore);
  sub_100183470();
  View.onChange<A>(of:initial:_:)();
  swift_release();
  sub_10002784C(v22, &qword_100206098);
  uint64_t v27 = v38;
  long long v29 = v45;
  uint64_t v28 = v46;
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v45, v14, v46);
  long long v30 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  v30(v14, v29, v28);
  long long v31 = v50;
  *uint64_t v50 = 0;
  *((unsigned char *)v31 + 8) = 1;
  long long v32 = (char *)v31;
  uint64_t v33 = sub_1000063C0(&qword_1002060E0);
  v30(&v32[*(int *)(v33 + 48)], v14, v28);
  uint64_t v34 = &v32[*(int *)(v33 + 64)];
  *(void *)uint64_t v34 = 0;
  v34[8] = 1;
  uint64_t v35 = *(void (**)(char *, uint64_t))(v27 + 8);
  v35(v29, v28);
  return ((uint64_t (*)(char *, uint64_t))v35)(v14, v28);
}

uint64_t sub_10017BB74@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v3 = sub_1000063C0(&qword_1002060E8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v46 = (uint64_t)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v37 - v6;
  uint64_t v8 = sub_1000063C0(&qword_1002060F0);
  uint64_t v9 = *(void **)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v41 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  long long v14 = (char *)&v37 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v37 - v15;
  uint64_t v40 = sub_1000063C0(&qword_1002060F8);
  uint64_t v17 = *(void **)(v40 - 8);
  uint64_t v18 = __chkstk_darwin(v40);
  uint64_t v44 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v37 - v20;
  sub_1000063C0(&qword_100206100);
  sub_1001835B0();
  uint64_t v43 = v21;
  Section<>.init(content:)();
  uint64_t v47 = a1;
  sub_1000063C0(&qword_100206140);
  sub_100027F2C(&qword_100206148, &qword_100206140);
  Section<>.init(content:)();
  uint64_t v22 = (void (*)(char *, char *, uint64_t))v9[4];
  uint64_t v45 = v16;
  uint64_t v23 = v16;
  uint64_t v24 = v8;
  v22(v23, v14, v8);
  uint64_t v49 = &type metadata for WritingTools;
  unint64_t v50 = sub_1000268F4();
  v48[0] = 11;
  LOBYTE(v21) = isFeatureEnabled(_:)();
  sub_100027DBC((uint64_t)v48);
  if (v21)
  {
    Section<>.init(content:)();
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = 1;
  }
  uint64_t v26 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v17[7];
  uint64_t v39 = v7;
  uint64_t v27 = v40;
  v26(v7, v25, 1, v40);
  uint64_t v28 = (void (*)(char *, char *, uint64_t))v17[2];
  v28(v44, v43, v27);
  uint64_t v38 = (void (*)(char *, char *, uint64_t))v9[2];
  long long v29 = v41;
  v38(v41, v45, v8);
  sub_100008DD4((uint64_t)v7, v46, &qword_1002060E8);
  long long v30 = v42;
  long long v31 = v44;
  v28(v42, v44, v27);
  uint64_t v32 = sub_1000063C0(&qword_100206150);
  v38(&v30[*(int *)(v32 + 48)], v29, v24);
  uint64_t v33 = v46;
  sub_100008DD4(v46, (uint64_t)&v30[*(int *)(v32 + 64)], &qword_1002060E8);
  sub_10002784C((uint64_t)v39, &qword_1002060E8);
  uint64_t v34 = (void (*)(char *, uint64_t))v9[1];
  v34(v45, v24);
  uint64_t v35 = (void (*)(char *, uint64_t))v17[1];
  v35(v43, v27);
  sub_10002784C(v33, &qword_1002060E8);
  v34(v29, v24);
  return ((uint64_t (*)(char *, uint64_t))v35)(v31, v27);
}

uint64_t sub_10017C02C@<X0>(uint64_t a1@<X8>)
{
  if (qword_1001FAE00 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = -1;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = -1;
  *(_WORD *)(a1 + 56) = 0;
  return result;
}

void sub_10017C108(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v3 = type metadata accessor for PickerRowCore(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3);
  uint64_t v6 = sub_1000063C0(&qword_100206158);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v44 = v6;
  uint64_t v45 = v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v41 - v11;
  sub_1000063C0(&qword_100203EB0);
  Bindable.wrappedValue.getter();
  id v13 = *(id *)(v47 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry_entry);
  swift_release();
  id v14 = [v13 answerOptions];

  if (v14)
  {
    id v15 = [v14 array];

    uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = *(void *)(v16 + 16);
    swift_bridgeObjectRelease();
    uint64_t v47 = 0;
    uint64_t v48 = v17;
    swift_getKeyPath();
    sub_10017F434(a1, (uint64_t)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for PickerRowCore);
    unint64_t v18 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v19 = swift_allocObject();
    sub_10017F4A0((uint64_t)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18, type metadata accessor for PickerRowCore);
    sub_1000063C0(&qword_100202ED0);
    sub_1000063C0(&qword_100206100);
    sub_10010688C();
    sub_1001835B0();
    uint64_t v20 = v12;
    ForEach<>.init(_:id:content:)();
    Bindable.wrappedValue.getter();
    uint64_t v21 = v47;
    swift_getKeyPath();
    uint64_t v47 = v21;
    sub_100183BC0(&qword_1001FD2E8, (void (*)(uint64_t))type metadata accessor for QuestionnaireEntry);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    uint64_t v23 = *(void *)(v21 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__userCreatedAnswer);
    uint64_t v22 = *(void *)(v21 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__userCreatedAnswer + 8);
    swift_bridgeObjectRetain();
    swift_release();
    if (v22)
    {
      uint64_t v47 = v23;
      uint64_t v48 = v22;
      sub_10002DF54();
      uint64_t v42 = Text.init<A>(_:)();
      uint64_t v25 = v24;
      uint64_t v27 = v26;
      uint64_t v29 = v28 & 1;
      uint64_t v30 = -3;
    }
    else
    {
      uint64_t v42 = 0;
      uint64_t v25 = 0;
      uint64_t v29 = 0;
      uint64_t v27 = 0;
      uint64_t v30 = 0;
    }
    uint64_t v31 = v45;
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
    uint64_t v33 = v20;
    uint64_t v34 = v20;
    uint64_t v35 = v44;
    v32(v10, v34, v44);
    char v36 = v10;
    uint64_t v43 = v10;
    uint64_t v37 = v46;
    v32(v46, v36, v35);
    uint64_t v38 = &v37[*(int *)(sub_1000063C0(&qword_100206160) + 48)];
    uint64_t v39 = v42;
    *(void *)uint64_t v38 = v42;
    *((void *)v38 + 1) = v25;
    *((void *)v38 + 2) = v29;
    *((void *)v38 + 3) = v27;
    *((void *)v38 + 4) = v30;
    *((void *)v38 + 5) = 0;
    *((void *)v38 + 6) = v30;
    *((_WORD *)v38 + 28) = 0;
    sub_10018377C(v39, v25, v29, v27);
    uint64_t v40 = *(void (**)(char *, uint64_t))(v31 + 8);
    v40(v33, v35);
    sub_1001837C0(v39, v25, v29, v27);
    v40(v43, v35);
  }
  else
  {
    __break(1u);
  }
}

void sub_10017C5D4(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  type metadata accessor for PickerRowCore(0);
  sub_1000063C0(&qword_100203EB0);
  Bindable.wrappedValue.getter();
  id v4 = *(id *)(v10 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry_entry);
  swift_release();
  id v5 = [v4 answerOptions];

  if (v5)
  {
    id v6 = [v5 objectAtIndexedSubscript:v3];

    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    if (swift_dynamicCast())
    {
      sub_10002DF54();
      *(void *)a2 = Text.init<A>(_:)();
      *(void *)(a2 + 8) = v7;
      *(unsigned char *)(a2 + 16) = v8 & 1;
      *(void *)(a2 + 24) = v9;
      *(void *)(a2 + 32) = v3;
      *(unsigned char *)(a2 + 40) = 0;
      *(void *)(a2 + 48) = v3;
      *(_WORD *)(a2 + 56) = 0;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_10017C71C@<X0>(uint64_t a1@<X8>)
{
  if (qword_1001FADF8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = -2;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = -2;
  *(_WORD *)(a1 + 56) = 0;
  return result;
}

void sub_10017C7F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = type metadata accessor for PickerRowCore(0);
  sub_1000063C0(&qword_100203EB0);
  Bindable.wrappedValue.getter();
  uint64_t v5 = (uint64_t *)(a3 + *(int *)(v4 + 36));
  sub_1000063C0(&qword_100206050);
  State.wrappedValue.getter();
  swift_getKeyPath();
  sub_100183BC0(&qword_1001FD2E8, (void (*)(uint64_t))type metadata accessor for QuestionnaireEntry);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_release();
  uint64_t v6 = *v5;
  State.wrappedValue.getter();
  switch(v14)
  {
    case -3:
      Bindable.wrappedValue.getter();
      Bindable.wrappedValue.getter();
      swift_getKeyPath();
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      swift_bridgeObjectRetain();
      swift_release();
      uint64_t KeyPath = swift_getKeyPath();
      __chkstk_darwin(KeyPath);
      ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
      swift_release();
      swift_release();
LABEL_10:
      swift_bridgeObjectRelease();
      return;
    case -1:
      Bindable.wrappedValue.getter();
      uint64_t v9 = swift_getKeyPath();
      __chkstk_darwin(v9);
      goto LABEL_7;
    case -2:
      sub_1000063C0(&qword_1001FB5A8);
      State.wrappedValue.setter();
      Bindable.wrappedValue.getter();
      uint64_t v7 = swift_getKeyPath();
      __chkstk_darwin(v7);
LABEL_7:
      ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
      swift_release();
      swift_release();
      return;
  }
  Bindable.wrappedValue.getter();
  id v10 = *(id *)(v6 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry_entry);
  swift_release();
  id v11 = [v10 answerOptions];

  if (v11)
  {
    State.wrappedValue.getter();
    id v12 = [v11 objectAtIndexedSubscript:v14];

    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    swift_dynamicCast();
    Bindable.wrappedValue.getter();
    uint64_t v13 = swift_getKeyPath();
    __chkstk_darwin(v13);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    swift_release();
    goto LABEL_10;
  }
  __break(1u);
}

uint64_t sub_10017CD6C()
{
  type metadata accessor for PickerRowCore(0);
  sub_1000063C0(&qword_1001FB5A8);
  uint64_t result = State.wrappedValue.getter();
  if ((v2 & 1) == 0)
  {
    sub_1000063C0(&qword_100203EB0);
    Bindable.wrappedValue.getter();
    swift_getKeyPath();
    sub_100183BC0(&qword_1001FD2E8, (void (*)(uint64_t))type metadata accessor for QuestionnaireEntry);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_release();
    sub_1000063C0(&qword_100206050);
    State.wrappedValue.setter();
    Bindable.wrappedValue.getter();
    State.wrappedValue.getter();
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_10017CFA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = sub_1000063C0(&qword_100203EB0);
  __chkstk_darwin(v34);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = static VerticalAlignment.center.getter();
  sub_10017D2C4((uint64_t)v48);
  uint64_t v39 = *(void *)&v48[8];
  uint64_t v40 = *(void *)v48;
  uint64_t v37 = *(void *)&v48[32];
  uint64_t v38 = *(void *)&v48[24];
  int v35 = v48[40];
  int v36 = v48[16];
  uint64_t v33 = static VerticalAlignment.center.getter();
  uint64_t v6 = (char *)(a1 + *(int *)(type metadata accessor for CustomRow(0) + 20));
  char v7 = *v6;
  uint64_t v8 = *((void *)v6 + 1);
  LOBYTE(v52) = v7;
  uint64_t v53 = v8;
  sub_1000063C0(&qword_1001FB5A8);
  State.projectedValue.getter();
  uint64_t v9 = *(void *)v48;
  uint64_t v10 = *(void *)&v48[8];
  char v11 = v48[16];
  Bindable.projectedValue.getter();
  sub_100180CAC(v9, v10, v11, (uint64_t)v5, v42);
  *(_OWORD *)((char *)&v44[4] + 7) = v42[4];
  *(_OWORD *)((char *)&v44[5] + 7) = v42[5];
  *(_OWORD *)((char *)&v44[6] + 7) = v43[0];
  v44[7] = *(_OWORD *)((char *)v43 + 9);
  *(_OWORD *)((char *)v44 + 7) = v42[0];
  *(_OWORD *)((char *)&v44[1] + 7) = v42[1];
  *(_OWORD *)((char *)&v44[2] + 7) = v42[2];
  *(_OWORD *)((char *)&v44[3] + 7) = v42[3];
  uint64_t v12 = v33;
  v46[0] = v33;
  v46[1] = 0;
  LOBYTE(v47[0]) = 1;
  *(_OWORD *)((char *)&v47[7] + 1) = *(_OWORD *)((char *)v43 + 9);
  long long v13 = v44[5];
  *(_OWORD *)((char *)&v47[4] + 1) = v44[4];
  long long v14 = v44[4];
  *(_OWORD *)((char *)&v47[5] + 1) = v44[5];
  long long v15 = v44[2];
  *(_OWORD *)((char *)&v47[3] + 1) = v44[3];
  long long v16 = v44[3];
  *(_OWORD *)((char *)&v47[2] + 1) = v44[2];
  long long v17 = v44[0];
  *(_OWORD *)((char *)&v47[1] + 1) = v44[1];
  long long v18 = v44[1];
  *(_OWORD *)((char *)v47 + 1) = v44[0];
  long long v19 = *(_OWORD *)((char *)v43 + 9);
  long long v20 = v44[6];
  *(_OWORD *)((char *)&v47[6] + 1) = v44[6];
  *((void *)&v47[8] + 1) = 0x4024000000000000;
  *(_OWORD *)&v48[103] = v47[5];
  *(_OWORD *)&v48[119] = v47[6];
  *(_OWORD *)&v48[135] = v47[7];
  *(_OWORD *)&v48[39] = v47[1];
  *(_OWORD *)&v48[55] = v47[2];
  *(_OWORD *)&v48[71] = v47[3];
  *(_OWORD *)&v48[87] = v47[4];
  *(_OWORD *)&v48[7] = (unint64_t)v33;
  *(_OWORD *)&v48[23] = v47[0];
  *(_OWORD *)&v48[151] = v47[8];
  long long v21 = *(_OWORD *)&v48[96];
  *(_OWORD *)(a2 + 177) = *(_OWORD *)&v48[112];
  long long v22 = *(_OWORD *)&v48[144];
  *(_OWORD *)(a2 + 193) = *(_OWORD *)&v48[128];
  *(_OWORD *)(a2 + 209) = v22;
  long long v23 = *(_OWORD *)&v48[32];
  *(_OWORD *)(a2 + 113) = *(_OWORD *)&v48[48];
  long long v24 = *(_OWORD *)&v48[80];
  *(_OWORD *)(a2 + 129) = *(_OWORD *)&v48[64];
  *(_OWORD *)(a2 + 145) = v24;
  *(_OWORD *)(a2 + 161) = v21;
  long long v25 = *(_OWORD *)&v48[16];
  *(_OWORD *)(a2 + 65) = *(_OWORD *)v48;
  *(_OWORD *)(a2 + 81) = v25;
  *(_OWORD *)(a2 + 97) = v23;
  long long v59 = v14;
  long long v60 = v13;
  long long v61 = v20;
  long long v62 = v19;
  long long v55 = v17;
  long long v56 = v18;
  long long v57 = v15;
  char v45 = 1;
  char v51 = 1;
  LOBYTE(v10) = v36;
  char v50 = v36;
  char v49 = v35;
  char v26 = v35;
  uint64_t v27 = v40;
  *(void *)a2 = v41;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v29 = v38;
  uint64_t v28 = v39;
  *(void *)(a2 + 24) = v27;
  *(void *)(a2 + 32) = v28;
  *(unsigned char *)(a2 + 40) = v10;
  uint64_t v30 = v37;
  *(void *)(a2 + 48) = v29;
  *(void *)(a2 + 56) = v30;
  *(unsigned char *)(a2 + 64) = v26;
  *(void *)(a2 + 224) = *(void *)&v48[159];
  uint64_t v52 = v12;
  uint64_t v53 = 0;
  char v54 = 1;
  long long v58 = v16;
  uint64_t v63 = 0x4024000000000000;
  uint64_t v31 = v28;
  sub_10002783C(v27, v28, v10);
  swift_bridgeObjectRetain();
  sub_1001814EC((uint64_t)v46);
  sub_100181578((uint64_t)&v52);
  sub_100026F18(v27, v31, v10);
  return swift_bridgeObjectRelease();
}

void sub_10017D2C4(uint64_t a1@<X8>)
{
  sub_1000063C0(&qword_100203EB0);
  Bindable.wrappedValue.getter();
  id v2 = *(id *)(v10 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry_entry);
  swift_release();
  id v3 = [v2 question];

  if (v3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10002DF54();
    uint64_t v4 = Text.init<A>(_:)();
    uint64_t v6 = v5;
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v5;
    char v8 = v7 & 1;
    *(unsigned char *)(a1 + 16) = v7 & 1;
    *(void *)(a1 + 24) = v9;
    *(void *)(a1 + 32) = 0;
    *(unsigned char *)(a1 + 40) = 1;
    sub_10002783C(v4, v5, v7 & 1);
    swift_bridgeObjectRetain();
    sub_100026F18(v4, v6, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

void *sub_10017D3DC@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = static HorizontalAlignment.center.getter();
  sub_10017CFA8(v2, (uint64_t)v7);
  *(_OWORD *)((char *)&v9[11] + 7) = v7[11];
  *(_OWORD *)((char *)&v9[12] + 7) = v7[12];
  *(_OWORD *)((char *)&v9[13] + 7) = v7[13];
  *(void *)((char *)&v9[14] + 7) = v8;
  *(_OWORD *)((char *)&v9[7] + 7) = v7[7];
  *(_OWORD *)((char *)&v9[8] + 7) = v7[8];
  *(_OWORD *)((char *)&v9[9] + 7) = v7[9];
  *(_OWORD *)((char *)&v9[10] + 7) = v7[10];
  *(_OWORD *)((char *)&v9[3] + 7) = v7[3];
  *(_OWORD *)((char *)&v9[4] + 7) = v7[4];
  *(_OWORD *)((char *)&v9[5] + 7) = v7[5];
  *(_OWORD *)((char *)&v9[6] + 7) = v7[6];
  *(_OWORD *)((char *)v9 + 7) = v7[0];
  *(_OWORD *)((char *)&v9[1] + 7) = v7[1];
  *(_OWORD *)((char *)&v9[2] + 7) = v7[2];
  long long v24 = v9[11];
  long long v25 = v9[12];
  v26[0] = v9[13];
  *(_OWORD *)((char *)v26 + 15) = *(_OWORD *)((char *)&v9[13] + 15);
  long long v20 = v9[7];
  long long v21 = v9[8];
  long long v22 = v9[9];
  long long v23 = v9[10];
  long long v16 = v9[3];
  long long v17 = v9[4];
  long long v18 = v9[5];
  long long v19 = v9[6];
  long long v13 = v9[0];
  long long v14 = v9[1];
  char v10 = 1;
  v11[0] = v4;
  v11[1] = 0;
  char v12 = 1;
  long long v15 = v9[2];
  sub_1001814E0((uint64_t)v11);
  sub_100026FD0((uint64_t)v11, (uint64_t)v6, &qword_100205E50);
  sub_1000063C0(&qword_100205E58);
  sub_1000063C0(&qword_100205E60);
  sub_100027F2C(&qword_100205E68, &qword_100205E58);
  sub_100027F2C(&qword_100205E70, &qword_100205E60);
  _ConditionalContent<>.init(storage:)();
  return memcpy(a1, __src, 0x101uLL);
}

uint64_t sub_10017D620@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v57 = a1;
  uint64_t v55 = type metadata accessor for CommonUIBlendModifier(0);
  __chkstk_darwin(v55);
  long long v56 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_1000063C0(&qword_1001FC7C0);
  __chkstk_darwin(v53);
  uint64_t v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v49);
  char v7 = (uint64_t *)((char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v50 = sub_1000063C0(&qword_100202510);
  __chkstk_darwin(v50);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_1000063C0(&qword_100205AF0);
  __chkstk_darwin(v51);
  char v54 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_1000063C0(&qword_100205AF8);
  __chkstk_darwin(v52);
  char v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = static VerticalAlignment.center.getter();
  uint64_t v15 = *(void *)(v2 + 24);
  uint64_t v14 = *(void *)(v2 + 32);
  swift_bridgeObjectRetain();
  sub_10017F3BC(v2);
  swift_bridgeObjectRelease();
  uint64_t v60 = v13;
  uint64_t v61 = 0;
  char v62 = 1;
  uint64_t v63 = v15;
  uint64_t v64 = v14;
  uint64_t v65 = 0;
  char v66 = 1;
  double v16 = *(double *)(v2 + 8) + *(double *)v2 + *(double *)(v2 + 8);
  static Alignment.center.getter();
  sub_10001A47C(0.0, 1, 0.0, 1, INFINITY, 0, v16, 0, (uint64_t)v67, 0.0, 1, INFINITY, 0);
  swift_bridgeObjectRelease();
  LOBYTE(v16) = static Edge.Set.leading.getter();
  unsigned __int8 v17 = static Edge.Set.trailing.getter();
  char v18 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != LOBYTE(v16)) {
    char v18 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v17) {
    char v18 = Edge.Set.init(rawValue:)();
  }
  EdgeInsets.init(_all:)();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  unsigned __int8 v27 = static Edge.Set.top.getter();
  unsigned __int8 v28 = static Edge.Set.bottom.getter();
  char v29 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v27) {
    char v29 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v28) {
    char v29 = Edge.Set.init(rawValue:)();
  }
  v59[8] = v67[8];
  v59[9] = v67[9];
  *(void *)&v59[10] = v68;
  v59[4] = v67[4];
  v59[5] = v67[5];
  v59[6] = v67[6];
  v59[7] = v67[7];
  v59[0] = v67[0];
  v59[1] = v67[1];
  v59[2] = v67[2];
  v59[3] = v67[3];
  char v58 = 0;
  EdgeInsets.init(_all:)();
  BYTE8(v59[10]) = v18;
  *(void *)&v59[11] = v20;
  *((void *)&v59[11] + 1) = v22;
  *(void *)&v59[12] = v24;
  *((void *)&v59[12] + 1) = v26;
  LOBYTE(v59[13]) = v58;
  BYTE8(v59[13]) = v29;
  *(void *)&v59[14] = v30;
  *((void *)&v59[14] + 1) = v31;
  *(void *)&v59[15] = v32;
  *((void *)&v59[15] + 1) = v33;
  LOBYTE(v59[16]) = 0;
  uint64_t v34 = *(void *)(v2 + 16);
  int v35 = (char *)v7 + *(int *)(v49 + 20);
  uint64_t v36 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v37 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 104))(v35, v36, v37);
  *char v7 = v34;
  v7[1] = v34;
  if (qword_1001FAD48 != -1) {
    swift_once();
  }
  uint64_t v38 = qword_1002129F0;
  sub_10017F434((uint64_t)v7, (uint64_t)v9, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v39 = v50;
  *(void *)&v9[*(int *)(v50 + 52)] = v38;
  *(_WORD *)&v9[*(int *)(v39 + 56)] = 256;
  swift_retain();
  sub_1000BEA48((uint64_t)v7);
  uint64_t v40 = static Alignment.center.getter();
  uint64_t v42 = v41;
  sub_100008DD4((uint64_t)v9, (uint64_t)v5, &qword_100202510);
  uint64_t v43 = (uint64_t *)&v5[*(int *)(v53 + 36)];
  *uint64_t v43 = v40;
  v43[1] = v42;
  uint64_t v44 = v54;
  sub_100008DD4((uint64_t)v5, (uint64_t)&v54[*(int *)(v51 + 36)], &qword_1001FC7C0);
  memcpy(v44, v59, 0x101uLL);
  sub_10017F3BC((uint64_t)v59);
  sub_10002784C((uint64_t)v5, &qword_1001FC7C0);
  sub_10002784C((uint64_t)v9, &qword_100202510);
  sub_10017F3E8((uint64_t)v67);
  uint64_t v45 = v55;
  uint64_t v46 = (uint64_t)v56;
  unsigned char *v56 = 0;
  uint64_t v47 = (uint64_t *)(v46 + *(int *)(v45 + 20));
  *uint64_t v47 = swift_getKeyPath();
  sub_1000063C0((uint64_t *)&unk_1001FB730);
  swift_storeEnumTagMultiPayload();
  sub_10017F4A0(v46, (uint64_t)&v12[*(int *)(v52 + 36)], type metadata accessor for CommonUIBlendModifier);
  sub_100026FD0((uint64_t)v44, (uint64_t)v12, &qword_100205AF0);
  return sub_100026FD0((uint64_t)v12, v57, &qword_100205AF8);
}

uint64_t sub_10017DC8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1000063C0(&qword_1001FBA90);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[2] = a1;
  v23[3] = a2;
  sub_10002DF54();
  swift_bridgeObjectRetain();
  uint64_t v9 = Text.init<A>(_:)();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  uint64_t v14 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  static Font.system(size:weight:design:)();
  sub_10002784C((uint64_t)v8, &qword_1001FBA90);
  uint64_t v15 = Text.font(_:)();
  uint64_t v17 = v16;
  char v19 = v18;
  uint64_t v21 = v20;
  swift_release();
  sub_100026F18(v9, v11, v13);
  swift_bridgeObjectRelease();
  *(void *)a3 = v15;
  *(void *)(a3 + 8) = v17;
  *(unsigned char *)(a3 + 16) = v19 & 1;
  *(void *)(a3 + 24) = v21;
  *(void *)(a3 + 32) = 0;
  *(unsigned char *)(a3 + 40) = 1;
  sub_10002783C(v15, v17, v19 & 1);
  swift_bridgeObjectRetain();
  sub_100026F18(v15, v17, v19 & 1);
  return swift_bridgeObjectRelease();
}

__n128 sub_10017DE60@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v5 = static VerticalAlignment.center.getter();
  sub_10017DC8C(v4, v3, (uint64_t)&v11);
  char v6 = v12;
  uint64_t v7 = v13;
  uint64_t v8 = v14;
  char v9 = v15;
  __n128 result = v11;
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  *(unsigned char *)(a1 + 64) = v9;
  return result;
}

id sub_10017DEE8()
{
  id v0 = [self pondering];
  id v27 = [objc_allocWithZone((Class)_UIDirectionalLightConfiguration) initWithPalette:v0];

  id v1 = [self directionalLightWithConfiguration:v27];
  id v2 = [objc_allocWithZone((Class)_UIIntelligenceContentLightEffect) initWithLightSource:v1];
  id v3 = [objc_allocWithZone((Class)UIVisualEffectView) initWithEffect:v2];
  id v4 = objc_allocWithZone((Class)sub_1000063C0(&qword_100205E78));
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)_UIHostingView.init(rootView:)();
  id v6 = [v3 contentView];
  [v6 addSubview:v5];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v26 = self;
  sub_1000063C0(&qword_1001FAFD0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100189610;
  id v8 = [v3 contentView];
  id v9 = [v8 topAnchor];

  id v10 = [v5 topAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];

  *(void *)(v7 + 32) = v11;
  id v12 = [v3 contentView];
  id v13 = [v12 leadingAnchor];

  id v14 = [v5 leadingAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14];

  *(void *)(v7 + 40) = v15;
  id v16 = [v3 contentView];
  id v17 = [v16 trailingAnchor];

  id v18 = [v5 trailingAnchor];
  id v19 = [v17 constraintEqualToAnchor:v18];

  *(void *)(v7 + 48) = v19;
  id v20 = [v3 contentView];
  id v21 = [v20 bottomAnchor];

  id v22 = [v5 bottomAnchor];
  id v23 = [v21 constraintEqualToAnchor:v22];

  *(void *)(v7 + 56) = v23;
  specialized Array._endMutation()();
  sub_1000085FC(0, (unint64_t *)&qword_1001FAFD8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v26 activateConstraints:isa];

  return v3;
}

uint64_t sub_10017E2E4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LoadingBar.IntelligentLoadingLabel.Coordinator()
{
  return self;
}

uint64_t destroy for LoadingBar()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LoadingBar(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for LoadingBar(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for LoadingBar(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LoadingBar(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LoadingBar(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LoadingBar()
{
  return &type metadata for LoadingBar;
}

uint64_t *sub_10017E498(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  id v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    id v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = type metadata accessor for LocalizedStringResource();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    id v10 = (uint64_t *)((char *)v4 + v8);
    id v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *id v10 = *v11;
    v10[1] = v12;
    id v13 = (uint64_t *)((char *)v4 + v9);
    id v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_10017E584(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LocalizedStringResource();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_release();

  return swift_release();
}

uint64_t sub_10017E60C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LocalizedStringResource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  id v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  id v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_10017E6AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LocalizedStringResource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  id v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10017E764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LocalizedStringResource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_10017E7E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LocalizedStringResource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_10017E888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10017E89C);
}

uint64_t sub_10017E89C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LocalizedStringResource();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10017E95C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10017E970);
}

uint64_t sub_10017E970(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for LocalizedStringResource();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for QuestionnaireSafetyUI(uint64_t a1)
{
  return sub_10005AFA8(a1, qword_100205AB0);
}

uint64_t sub_10017EA4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100180550(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for LocalizedStringResource);
}

uint64_t sub_10017EA74()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_10017EA90()
{
  return sub_10017DEE8();
}

uint64_t sub_10017EA98@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LoadingBar.IntelligentLoadingLabel.Coordinator();
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_10017EACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100181608();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10017EB30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100181608();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10017EB94()
{
}

uint64_t sub_10017EBBC@<X0>(uint64_t a1@<X8>)
{
  return sub_10017D620(a1);
}

uint64_t sub_10017EBF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v18[1] = a2;
  uint64_t v3 = sub_1000063C0(&qword_100205B28);
  __chkstk_darwin(v3);
  int v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ToolbarItemPlacement();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000063C0((uint64_t *)&unk_1001FDDE0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v13 = (char *)v18 - v12;
  static ToolbarItemPlacement.confirmationAction.getter();
  v18[8] = a1;
  sub_1000063C0(&qword_1001FC6B8);
  sub_100027F2C((unint64_t *)&unk_1001FDDF0, &qword_1001FC6B8);
  ToolbarItem<>.init(placement:content:)();
  static ToolbarItemPlacement.cancellationAction.getter();
  v18[4] = a1;
  ToolbarItem<>.init(placement:content:)();
  uint64_t v14 = &v5[*(int *)(v3 + 48)];
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v15(v5, v13, v7);
  v15(v14, v11, v7);
  TupleToolbarContent.init(_:)();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v11, v7);
  return ((uint64_t (*)(char *, uint64_t))v16)(v13, v7);
}

uint64_t sub_10017EE9C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QuestionnaireSafetyUI(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  if (qword_1001FAD88 != -1) {
    swift_once();
  }
  sub_10017F434(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for QuestionnaireSafetyUI);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_10017F4A0((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for QuestionnaireSafetyUI);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return Button<>.init(_:action:)();
}

uint64_t sub_10017F03C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QuestionnaireSafetyUI(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  if (qword_1001FAD98 != -1) {
    swift_once();
  }
  sub_10017F434(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for QuestionnaireSafetyUI);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_10017F4A0((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for QuestionnaireSafetyUI);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return Button<>.init(_:action:)();
}

uint64_t sub_10017F1DC()
{
  uint64_t v1 = sub_1000063C0(&qword_100205B00);
  __chkstk_darwin(v1);
  uint64_t v3 = &v7[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)uint64_t v3 = static HorizontalAlignment.center.getter();
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  uint64_t v4 = &v3[*(int *)(sub_1000063C0(&qword_100205B08) + 44)];
  uint64_t v5 = type metadata accessor for LocalizedStringResource();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(v4, v0, v5);
  uint64_t v8 = v0;
  sub_1000063C0(&qword_100205B10);
  sub_100027F2C(&qword_100205B18, &qword_100205B00);
  sub_100027F2C(&qword_100205B20, &qword_100205B10);
  View.toolbar<A>(content:)();
  return sub_10002784C((uint64_t)v3, &qword_100205B00);
}

uint64_t sub_10017F378()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for MultichoiceRow(uint64_t a1)
{
  return sub_10005AFA8(a1, qword_100205CA8);
}

uint64_t sub_10017F3BC(uint64_t a1)
{
  return a1;
}

uint64_t sub_10017F3E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10017F41C@<X0>(uint64_t a1@<X8>)
{
  return sub_10017EBF8(*(void *)(v1 + 16), a1);
}

uint64_t sub_10017F424()
{
  return sub_10017EE9C(*(void *)(v0 + 16));
}

uint64_t sub_10017F42C()
{
  return sub_10017F03C(*(void *)(v0 + 16));
}

uint64_t sub_10017F434(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10017F4A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10017F508()
{
  uint64_t v1 = type metadata accessor for QuestionnaireSafetyUI(0);
  return (*(uint64_t (**)(void))(v0
                              + *(int *)(v1 + 24)
                              + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))))();
}

uint64_t sub_10017F578()
{
  uint64_t v1 = *(void *)(type metadata accessor for QuestionnaireSafetyUI(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = type metadata accessor for LocalizedStringResource();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_10017F67C()
{
  uint64_t v1 = type metadata accessor for QuestionnaireSafetyUI(0);
  return (*(uint64_t (**)(void))(v0
                              + *(int *)(v1 + 20)
                              + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))))();
}

uint64_t *sub_10017F6E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_1000063C0(&qword_100203EB0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *uint64_t v9 = *v10;
    *((void *)v9 + 1) = *((void *)v10 + 1);
  }
  swift_retain();
  return a1;
}

uint64_t sub_10017F7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  swift_retain();
  return a1;
}

uint64_t sub_10017F860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10017F900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10017F980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  swift_release();
  return a1;
}

uint64_t sub_10017FA18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10017FA2C);
}

uint64_t sub_10017FA30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10017FA44);
}

uint64_t type metadata accessor for CustomRow(uint64_t a1)
{
  return sub_10005AFA8(a1, qword_100205B88);
}

void sub_10017FA68()
{
  sub_10017FAFC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10017FAFC()
{
  if (!qword_100203F20)
  {
    type metadata accessor for QuestionnaireEntry();
    unint64_t v0 = type metadata accessor for Bindable();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100203F20);
    }
  }
}

uint64_t sub_10017FB54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000063C0(&qword_100203EB0);
  int v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_10017FBC4(uint64_t a1)
{
  uint64_t v2 = sub_1000063C0(&qword_100203EB0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_10017FC2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10017FC94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_10017FCFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10017FD64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_10017FDCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10017FDE0);
}

uint64_t sub_10017FDE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000063C0(&qword_100203EB0);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10017FE50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10017FE64);
}

uint64_t sub_10017FE64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000063C0(&qword_100203EB0);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for PickerRow(uint64_t a1)
{
  return sub_10005AFA8(a1, qword_100205C18);
}

void sub_10017FEF8()
{
  sub_10017FAFC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_10017FF84(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_1000063C0(&qword_100203EB0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v8;
    uint64_t v11 = (char *)a2 + v8;
    *uint64_t v10 = *v11;
    *((void *)v10 + 1) = *((void *)v11 + 1);
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
  }
  swift_retain();
  return a1;
}

uint64_t sub_10018006C(uint64_t a1)
{
  uint64_t v2 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_release();
}

uint64_t sub_1001800E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(unsigned char *)uint64_t v9 = *(unsigned char *)v10;
  *(void *)(v9 + 8) = *(void *)(v10 + 8);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  swift_retain();
  return a1;
}

uint64_t sub_100180184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100180230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_1001802B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)uint64_t v8 = *(unsigned char *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  swift_release();
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_10018035C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100180370);
}

uint64_t sub_100180374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000063C0(&qword_100203EB0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_100180448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10018045C);
}

uint64_t sub_100180460(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000063C0(&qword_100203EB0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

uint64_t sub_100180524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100180550(a1, a2, a3, (uint64_t (*)(uint64_t))sub_10017FAFC);
}

uint64_t sub_100180550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for LoadingBar.IntelligentLoadingLabel()
{
  return &type metadata for LoadingBar.IntelligentLoadingLabel;
}

unint64_t sub_100180608()
{
  unint64_t result = qword_100205CE8;
  if (!qword_100205CE8)
  {
    sub_100006C14(&qword_100205AF8);
    sub_1001806B4();
    sub_100183BC0(&qword_100204EC8, (void (*)(uint64_t))type metadata accessor for CommonUIBlendModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100205CE8);
  }
  return result;
}

unint64_t sub_1001806B4()
{
  unint64_t result = qword_100205CF0;
  if (!qword_100205CF0)
  {
    sub_100006C14(&qword_100205AF0);
    sub_1001807B0(&qword_100205CF8, &qword_100205D00, (void (*)(void))sub_100180780);
    sub_100027F2C(&qword_100200E60, &qword_1001FC7C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100205CF0);
  }
  return result;
}

uint64_t sub_100180780()
{
  return sub_1001807B0(&qword_100205D08, &qword_100205D10, (void (*)(void))sub_10018082C);
}

uint64_t sub_1001807B0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006C14(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10018082C()
{
  unint64_t result = qword_100205D18;
  if (!qword_100205D18)
  {
    sub_100006C14(&qword_100205D20);
    sub_100027F2C(&qword_100205D28, &qword_100205D30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100205D18);
  }
  return result;
}

uint64_t sub_1001808CC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100180998()
{
  unint64_t result = qword_100205D38;
  if (!qword_100205D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100205D38);
  }
  return result;
}

uint64_t sub_1001809EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100180A08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100180A24()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_100180A44(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for MultichoiceRow(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  sub_1001795C4(a1, v6, a2);
}

unint64_t sub_100180AC4()
{
  unint64_t result = qword_100205DB0;
  if (!qword_100205DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100205DB0);
  }
  return result;
}

uint64_t sub_100180B20()
{
  uint64_t v1 = *(void *)(type metadata accessor for MultichoiceRow(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100180C18()
{
  return sub_100183118(type metadata accessor for MultichoiceRow, (uint64_t (*)(uint64_t))sub_10017A080);
}

uint64_t sub_100180C44(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100180C7C(uint64_t a1)
{
  return a1;
}

id sub_100180CAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, _OWORD *a5@<X8>)
{
  *(void *)&v38[8] = 0xE000000000000000;
  State.init(wrappedValue:)();
  uint64_t v37 = *(void *)v44;
  char v8 = FocusState.init<>()();
  char v27 = v9;
  char v28 = v8;
  uint64_t v11 = v10;
  swift_getKeyPath();
  uint64_t v35 = a1;
  swift_retain();
  uint64_t v36 = a2;
  swift_retain();
  uint64_t v34 = v11;
  swift_retain();
  uint64_t v12 = sub_1000063C0(&qword_100203EB0);
  Bindable<A>.subscript.getter();
  swift_release();
  long long v30 = *(_OWORD *)&v44[16];
  swift_bridgeObjectRetain();
  uint64_t v31 = *(void *)&v44[8];
  swift_retain();
  uint64_t v33 = *(void *)v44;
  swift_retain();
  Bindable.wrappedValue.getter();
  swift_getKeyPath();
  *(void *)uint64_t v38 = *(void *)v44;
  sub_100183BC0(&qword_1001FD2E8, (void (*)(uint64_t))type metadata accessor for QuestionnaireEntry);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v13 = *(void *)(*(void *)v44 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedAnswer);
  uint64_t v14 = *(void *)(*(void *)v44 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedAnswer + 8);
  swift_bridgeObjectRetain();
  swift_release();
  if (!v14)
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a4, v12);
    uint64_t v23 = v35;
    uint64_t v22 = a2;
    uint64_t v21 = *(void *)&v44[16];
    uint64_t v17 = *(void *)&v44[8];
    goto LABEL_9;
  }
  Bindable.wrappedValue.getter();
  swift_getKeyPath();
  *(void *)uint64_t v38 = *(void *)v44;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (!*(void *)(*(void *)v44 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry__selectedAnswer + 8))
  {
    swift_release();
    uint64_t v17 = *(void *)&v44[8];
    goto LABEL_8;
  }
  uint64_t v15 = *(void **)(*(void *)v44 + OBJC_IVAR____TtC21WritingToolsUIService18QuestionnaireEntry_entry);
  swift_bridgeObjectRetain();
  id result = [v15 answerOptions];
  uint64_t v17 = *(void *)&v44[8];
  if (result)
  {
    id v18 = result;
    NSString v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    unsigned __int8 v20 = [v18 containsObject:v19];
    swift_release();

    if ((v20 & 1) == 0)
    {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a4, v12);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v21 = 0;
      uint64_t v37 = v13;
      uint64_t v17 = v14;
      uint64_t v23 = v35;
      uint64_t v22 = v36;
LABEL_9:
      *(void *)uint64_t v38 = 64;
      *(_OWORD *)&v38[8] = xmmword_100195270;
      *(void *)&v38[24] = v23;
      *(void *)&long long v39 = v22;
      BYTE8(v39) = a3 & 1;
      long long v40 = *(_OWORD *)v44;
      long long v41 = *(_OWORD *)&v44[16];
      *(void *)&long long v42 = v37;
      *((void *)&v42 + 1) = v17;
      *(void *)uint64_t v43 = v21;
      v43[8] = v28 & 1;
      *(void *)&v43[16] = v34;
      v43[24] = v27 & 1;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_100181174((uint64_t)v38);
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      *(void *)uint64_t v44 = 64;
      *(_OWORD *)&_OWORD v44[8] = xmmword_100195270;
      *(void *)&v44[24] = v23;
      uint64_t v45 = v22;
      char v46 = a3 & 1;
      uint64_t v47 = v33;
      uint64_t v48 = v31;
      long long v49 = v30;
      uint64_t v50 = v37;
      uint64_t v51 = v17;
      uint64_t v52 = v21;
      char v53 = v28 & 1;
      uint64_t v54 = v34;
      char v55 = v27 & 1;
      id result = (id)sub_100181200((uint64_t)v44);
      long long v24 = v42;
      a5[4] = v41;
      a5[5] = v24;
      a5[6] = *(_OWORD *)v43;
      *(_OWORD *)((char *)a5 + 105) = *(_OWORD *)&v43[9];
      long long v25 = *(_OWORD *)&v38[16];
      *a5 = *(_OWORD *)v38;
      a5[1] = v25;
      long long v26 = v40;
      a5[2] = v39;
      a5[3] = v26;
      return result;
    }
LABEL_8:
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a4, v12);
    swift_bridgeObjectRelease();
    uint64_t v23 = v35;
    uint64_t v22 = v36;
    uint64_t v21 = *(void *)&v44[16];
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_100181174(uint64_t a1)
{
  return a1;
}

uint64_t sub_100181200(uint64_t a1)
{
  return a1;
}

uint64_t sub_100181290()
{
  uint64_t v1 = *(void *)(type metadata accessor for MultichoiceRow(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_1001813A8()
{
  uint64_t v1 = *(void *)(type metadata accessor for MultichoiceRow(0) - 8);
  unint64_t v2 = (*(void *)(v1 + 64)
      + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_10017824C(*(void *)(v0 + v2), *(void *)(v0 + v2 + 8), *(void *)(v0 + ((v2 + 23) & 0xFFFFFFFFFFFFFFF8)));
}

unint64_t sub_100181444()
{
  unint64_t result = qword_100205DE8;
  if (!qword_100205DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100205DE8);
  }
  return result;
}

uint64_t sub_1001814A0()
{
  return sub_1001627B8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t type metadata accessor for PickerRowCore(uint64_t a1)
{
  return sub_10005AFA8(a1, qword_100205EE0);
}

uint64_t sub_1001814E0(uint64_t result)
{
  *(unsigned char *)(result + 256) = 1;
  return result;
}

uint64_t sub_1001814EC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100181578(uint64_t a1)
{
  return a1;
}

unint64_t sub_100181608()
{
  unint64_t result = qword_100205E80;
  if (!qword_100205E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100205E80);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LoadingBar.IntelligentLoadingLabel.LoadingLabel(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LoadingBar.IntelligentLoadingLabel.LoadingLabel()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for LoadingBar.IntelligentLoadingLabel.LoadingLabel(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for LoadingBar.IntelligentLoadingLabel.LoadingLabel(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LoadingBar.IntelligentLoadingLabel.LoadingLabel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LoadingBar.IntelligentLoadingLabel.LoadingLabel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LoadingBar.IntelligentLoadingLabel.LoadingLabel()
{
  return &type metadata for LoadingBar.IntelligentLoadingLabel.LoadingLabel;
}

ValueMetadata *type metadata accessor for MultichoiceRow.MoreWidgetAppearance()
{
  return &type metadata for MultichoiceRow.MoreWidgetAppearance;
}

uint64_t destroy for TappableWidget(uint64_t a1)
{
  sub_100027DBC(a1);
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for TappableWidget(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TappableWidget(uint64_t a1, uint64_t a2)
{
  sub_100097958((uint64_t *)a1, (uint64_t *)a2);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for TappableWidget(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for TappableWidget(uint64_t a1, uint64_t a2)
{
  sub_100027DBC(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TappableWidget(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TappableWidget(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TappableWidget()
{
  return &type metadata for TappableWidget;
}

uint64_t getEnumTagSinglePayload for MultipleChoiceButtonStyle(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MultipleChoiceButtonStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MultipleChoiceButtonStyle()
{
  return &type metadata for MultipleChoiceButtonStyle;
}

uint64_t *sub_100181AE8(uint64_t *a1, uint64_t *a2, int *a3)
{
  BOOL v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    BOOL v4 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *BOOL v4 = *a2;
    v4[1] = v7;
    uint64_t v8 = a2[3];
    v4[2] = a2[2];
    v4[3] = v8;
    uint64_t v9 = a3[7];
    uint64_t v10 = (char *)v4 + v9;
    uint64_t v11 = (char *)a2 + v9;
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v12 = sub_1000063C0(&qword_100203EB0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[8];
    uint64_t v14 = a3[9];
    uint64_t v15 = (char *)v4 + v13;
    uint64_t v16 = (char *)a2 + v13;
    *uint64_t v15 = *v16;
    *((void *)v15 + 1) = *((void *)v16 + 1);
    uint64_t v17 = (uint64_t *)((char *)v4 + v14);
    id v18 = (uint64_t *)((char *)a2 + v14);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100181C10(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();

  return swift_release();
}

void *sub_100181CBC(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[7];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v11 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = a3[9];
  uint64_t v14 = (char *)a1 + v12;
  uint64_t v15 = (char *)a2 + v12;
  *uint64_t v14 = *v15;
  *((void *)v14 + 1) = *((void *)v15 + 1);
  uint64_t v16 = (void *)((char *)a1 + v13);
  uint64_t v17 = (void *)((char *)a2 + v13);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_100181D98(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  uint64_t v6 = a3[7];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[8];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  char *v11 = *v12;
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_100181EB8(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[7];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  return a1;
}

void *sub_100181F5C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  uint64_t v7 = a3[7];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[8];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  *uint64_t v12 = *v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_release();
  uint64_t v14 = a3[9];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  *uint64_t v15 = v18;
  v15[1] = v17;
  swift_release();
  return a1;
}

uint64_t sub_10018204C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100182060);
}

uint64_t sub_100182060(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1000063C0(&qword_100203EB0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100182114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100182128);
}

uint64_t sub_100182128(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1000063C0(&qword_100203EB0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1001821D4()
{
  sub_10017FAFC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for SelectorBackgroundModifier()
{
  return &type metadata for SelectorBackgroundModifier;
}

uint64_t destroy for CustomEntryView()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for CustomEntryView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v5;
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CustomEntryView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  return a1;
}

uint64_t assignWithTake for CustomEntryView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_release();
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for CustomEntryView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 121)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CustomEntryView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 120) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 121) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 121) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomEntryView()
{
  return &type metadata for CustomEntryView;
}

uint64_t destroy for CustomEntryViewMacOS()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for CustomEntryViewMacOS(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CustomEntryViewMacOS(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  return a1;
}

__n128 initializeWithTake for CustomEntryViewMacOS(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(_OWORD *)(a1 + 89) = *(long long *)((char *)a2 + 89);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for CustomEntryViewMacOS(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_release();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for CustomEntryViewMacOS(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 105)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CustomEntryViewMacOS(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 104) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 105) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 105) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomEntryViewMacOS()
{
  return &type metadata for CustomEntryViewMacOS;
}

ValueMetadata *type metadata accessor for QuestionTitleModifier()
{
  return &type metadata for QuestionTitleModifier;
}

uint64_t sub_100182A84()
{
  return sub_100027F2C(&qword_100205F28, &qword_100205F30);
}

unint64_t sub_100182AC4()
{
  unint64_t result = qword_100205F38;
  if (!qword_100205F38)
  {
    sub_100006C14(&qword_100205F40);
    sub_100027F2C(&qword_100205E18, &qword_100205E10);
    sub_100027F2C(&qword_100205E20, &qword_100205E00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100205F38);
  }
  return result;
}

unint64_t sub_100182B8C()
{
  unint64_t result = qword_100205F48;
  if (!qword_100205F48)
  {
    sub_100006C14(&qword_100205F50);
    sub_100027F2C(&qword_100205E68, &qword_100205E58);
    sub_100027F2C(&qword_100205E70, &qword_100205E60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100205F48);
  }
  return result;
}

uint64_t sub_100182C50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100182C6C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100182C88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100182CA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100182CC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100182CDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100182CF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100182D14()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100182D34()
{
  return sub_100177264((uint64_t *)(v0 + 16));
}

unint64_t sub_100182D3C()
{
  unint64_t result = qword_100205F88;
  if (!qword_100205F88)
  {
    sub_100006C14(&qword_100205F68);
    sub_100006C14(&qword_1001FC950);
    sub_100027F2C(&qword_100204058, &qword_1001FC950);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100205F88);
  }
  return result;
}

uint64_t sub_100182E20()
{
  return sub_10017656C();
}

unint64_t sub_100182E44()
{
  unint64_t result = qword_100205F98;
  if (!qword_100205F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100205F98);
  }
  return result;
}

uint64_t sub_100182E9C()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100182EE0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 137, 7);
}

uint64_t sub_100182F50()
{
  return sub_1001762E4();
}

uint64_t sub_100182F74(uint64_t a1)
{
  return a1;
}

uint64_t sub_100182FC0()
{
  return sub_100176224();
}

uint64_t sub_100182FCC()
{
  sub_100027DBC(v0 + 16);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_100183014(uint64_t a1)
{
  return sub_10017627C(a1, v1 + 16);
}

unint64_t sub_10018301C()
{
  unint64_t result = qword_100206018;
  if (!qword_100206018)
  {
    sub_100006C14(&qword_100205FF0);
    sub_100027F2C(&qword_100206020, &qword_100206028);
    sub_100027F2C(&qword_100200E60, &qword_1001FC7C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100206018);
  }
  return result;
}

uint64_t sub_1001830EC()
{
  return sub_100183118(type metadata accessor for PickerRowCore, (uint64_t (*)(uint64_t))sub_10017CD6C);
}

uint64_t sub_100183118(uint64_t (*a1)(void), uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *(void *)(a1(0) - 8);
  uint64_t v4 = v2 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a2(v4);
}

unint64_t sub_10018319C()
{
  unint64_t result = qword_100206078;
  if (!qword_100206078)
  {
    sub_100006C14(&qword_100206070);
    sub_100183218();
    sub_100180AC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100206078);
  }
  return result;
}

unint64_t sub_100183218()
{
  unint64_t result = qword_100206080;
  if (!qword_100206080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100206080);
  }
  return result;
}

uint64_t sub_10018326C@<X0>(char *a1@<X8>)
{
  return sub_10017BB74(*(void *)(v1 + 16), a1);
}

uint64_t sub_100183274@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1001832A0()
{
  return EnvironmentValues.tint.setter();
}

uint64_t sub_1001832D0()
{
  uint64_t v1 = (int *)(type metadata accessor for PickerRowCore(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v7 = v6 + v1[9];
  uint64_t v8 = sub_1000063C0(&qword_100203EB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v4, v5);
}

void sub_1001833F0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for PickerRowCore(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  sub_10017C7F8(a1, a2, v6);
}

unint64_t sub_100183470()
{
  unint64_t result = qword_1002060B8;
  if (!qword_1002060B8)
  {
    sub_100006C14(&qword_100206098);
    sub_100183510();
    sub_100027F2C(&qword_1002060D0, &qword_1002060D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002060B8);
  }
  return result;
}

unint64_t sub_100183510()
{
  unint64_t result = qword_1002060C0;
  if (!qword_1002060C0)
  {
    sub_100006C14(&qword_1001FBCB0);
    sub_100027F2C(&qword_1002060C8, &qword_1001FBCA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002060C0);
  }
  return result;
}

unint64_t sub_1001835B0()
{
  unint64_t result = qword_100206108;
  if (!qword_100206108)
  {
    sub_100006C14(&qword_100206100);
    sub_100183650();
    sub_100027F2C(&qword_100206130, &qword_100206138);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100206108);
  }
  return result;
}

unint64_t sub_100183650()
{
  unint64_t result = qword_100206110;
  if (!qword_100206110)
  {
    sub_100006C14(&qword_100206118);
    sub_100027F2C(&qword_100206120, &qword_100206128);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100206110);
  }
  return result;
}

void sub_1001836F0(char *a1@<X8>)
{
  sub_10017C108(*(void *)(v1 + 16), a1);
}

void sub_1001836FC(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for PickerRowCore(0);

  sub_10017C5D4(a1, a2);
}

uint64_t sub_10018377C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10002783C(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1001837C0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100026F18(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100183810()
{
  return sub_100177E80();
}

uint64_t sub_100183818(uint64_t a1)
{
  return a1;
}

unint64_t sub_1001838A4()
{
  unint64_t result = qword_1002061A8;
  if (!qword_1002061A8)
  {
    sub_100006C14(&qword_100206190);
    sub_1001807B0(&qword_1002061B0, (uint64_t *)&unk_1001FBCC0, (void (*)(void))sub_100183970);
    sub_100027F2C(&qword_1001FBB78, &qword_1001FBB80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002061A8);
  }
  return result;
}

unint64_t sub_100183970()
{
  unint64_t result = qword_1002061B8;
  if (!qword_1002061B8)
  {
    sub_100006C14(&qword_1001FBCB8);
    sub_100006C14(&qword_100206180);
    sub_100006C14(&qword_1001FC950);
    type metadata accessor for RoundedBorderTextFieldStyle();
    sub_100027F2C(&qword_100204058, &qword_1001FC950);
    sub_100183BC0(&qword_1002061A0, (void (*)(uint64_t))&type metadata accessor for RoundedBorderTextFieldStyle);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002061B8);
  }
  return result;
}

uint64_t sub_100183AD4()
{
  return sub_100177EF0((_OWORD *)(v0 + 16));
}

uint64_t sub_100183AE0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 121, 7);
}

uint64_t sub_100183B50()
{
  return FocusState.wrappedValue.setter();
}

uint64_t sub_100183BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100183BB8()
{
  return swift_release();
}

uint64_t sub_100183BC0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100183C10()
{
  unint64_t result = qword_1002061E8;
  if (!qword_1002061E8)
  {
    sub_100006C14(&qword_1002061C8);
    sub_100027F2C(&qword_1002061F0, &qword_1002061D8);
    sub_100027F2C(&qword_1001FD848, &qword_1001FD850);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002061E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomEntryView.CheckmarkWidgetAppearance()
{
  return &type metadata for CustomEntryView.CheckmarkWidgetAppearance;
}

uint64_t _s21WritingToolsUIService14MultichoiceRowV20MoreWidgetAppearanceVwxx_0()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *_s21WritingToolsUIService14MultichoiceRowV20MoreWidgetAppearanceVwcp_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *_s21WritingToolsUIService14MultichoiceRowV20MoreWidgetAppearanceVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  return a1;
}

uint64_t _s21WritingToolsUIService14MultichoiceRowV20MoreWidgetAppearanceVwta_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

ValueMetadata *type metadata accessor for CustomEntryView.XmarkWidgetAppearance()
{
  return &type metadata for CustomEntryView.XmarkWidgetAppearance;
}

uint64_t sub_100183E30()
{
  return sub_100027F2C(&qword_1002061F8, &qword_100206200);
}

uint64_t sub_100183E6C()
{
  return sub_1001807B0(&qword_100206208, &qword_100205FD0, (void (*)(void))sub_100183EB0);
}

unint64_t sub_100183EB0()
{
  unint64_t result = qword_100206210;
  if (!qword_100206210)
  {
    sub_100006C14(&qword_100205FC8);
    sub_100006C14(&qword_100205FB8);
    sub_1001807B0(&qword_100205FD8, &qword_100205FB8, (void (*)(void))sub_1000FB344);
    swift_getOpaqueTypeConformance2();
    sub_100027F2C(&qword_100200E60, &qword_1001FC7C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100206210);
  }
  return result;
}

uint64_t sub_100183FB8()
{
  return sub_100027F2C(&qword_100206218, &qword_100206220);
}

uint64_t sub_100183FF4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100184098()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100184130()
{
  unint64_t result = qword_100206228;
  if (!qword_100206228)
  {
    sub_100006C14(&qword_100206178);
    sub_1001841DC();
    sub_100183BC0(&qword_100204EC8, (void (*)(uint64_t))type metadata accessor for CommonUIBlendModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100206228);
  }
  return result;
}

unint64_t sub_1001841DC()
{
  unint64_t result = qword_100206230;
  if (!qword_100206230)
  {
    sub_100006C14(&qword_100206168);
    sub_100027F2C(&qword_100206238, &qword_100206170);
    sub_100027F2C(&qword_100200E60, &qword_1001FC7C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100206230);
  }
  return result;
}

unint64_t sub_1001842A4()
{
  unint64_t result = qword_100206240;
  if (!qword_100206240)
  {
    sub_100006C14(&qword_1002061C0);
    sub_100006C14(&qword_100206190);
    sub_1001838A4();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100206240);
  }
  return result;
}

uint64_t sub_100184354()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1001843E0()
{
  return sub_1001814A0();
}

uint64_t sub_1001843FC()
{
  return sub_10004F860();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t PhotosPickerItem.itemIdentifier.getter()
{
  return PhotosPickerItem.itemIdentifier.getter();
}

uint64_t static PhotosPickerItem.EncodingDisambiguationPolicy.automatic.getter()
{
  return static PhotosPickerItem.EncodingDisambiguationPolicy.automatic.getter();
}

uint64_t type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy()
{
  return type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy();
}

uint64_t type metadata accessor for PhotosPickerItem()
{
  return type metadata accessor for PhotosPickerItem();
}

uint64_t static PhotosPickerSelectionBehavior.default.getter()
{
  return static PhotosPickerSelectionBehavior.default.getter();
}

uint64_t type metadata accessor for PhotosPickerSelectionBehavior()
{
  return type metadata accessor for PhotosPickerSelectionBehavior();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t static JSONEncoder.OutputFormatting.sortedKeys.getter()
{
  return static JSONEncoder.OutputFormatting.sortedKeys.getter();
}

uint64_t static JSONEncoder.OutputFormatting.prettyPrinted.getter()
{
  return static JSONEncoder.OutputFormatting.prettyPrinted.getter();
}

uint64_t type metadata accessor for JSONEncoder.OutputFormatting()
{
  return type metadata accessor for JSONEncoder.OutputFormatting();
}

uint64_t dispatch thunk of JSONEncoder.outputFormatting.setter()
{
  return dispatch thunk of JSONEncoder.outputFormatting.setter();
}

uint64_t type metadata accessor for JSONEncoder.DateEncodingStrategy()
{
  return type metadata accessor for JSONEncoder.DateEncodingStrategy();
}

uint64_t dispatch thunk of JSONEncoder.dateEncodingStrategy.setter()
{
  return dispatch thunk of JSONEncoder.dateEncodingStrategy.setter();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
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

uint64_t DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.errorDescription.getter()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t AttributeScopes.FoundationAttributes.presentationIntent.getter()
{
  return AttributeScopes.FoundationAttributes.presentationIntent.getter();
}

uint64_t AttributeScopes.FoundationAttributes.inlinePresentationIntent.getter()
{
  return AttributeScopes.FoundationAttributes.inlinePresentationIntent.getter();
}

uint64_t AttributeScopes.UIKitAttributes.paragraphStyle.getter()
{
  return AttributeScopes.UIKitAttributes.paragraphStyle.getter();
}

uint64_t AttributeScopes.UIKitAttributes.font.getter()
{
  return AttributeScopes.UIKitAttributes.font.getter();
}

uint64_t AttributeScopes.SwiftUIAttributes.strikethroughStyle.getter()
{
  return AttributeScopes.SwiftUIAttributes.strikethroughStyle.getter();
}

uint64_t AttributedString.characters.modify()
{
  return AttributedString.characters.modify();
}

uint64_t AttributedString.startIndex.getter()
{
  return AttributedString.startIndex.getter();
}

uint64_t AttributedString.CharacterView.replaceSubrange<A>(_:with:)()
{
  return AttributedString.CharacterView.replaceSubrange<A>(_:with:)();
}

uint64_t type metadata accessor for AttributedString.CharacterView()
{
  return type metadata accessor for AttributedString.CharacterView();
}

uint64_t AttributedString.subscript.setter()
{
  return AttributedString.subscript.setter();
}

uint64_t AttributedString.init(stringLiteral:)()
{
  return AttributedString.init(stringLiteral:)();
}

uint64_t AttributedString.replaceAttributes(_:with:)()
{
  return AttributedString.replaceAttributes(_:with:)();
}

uint64_t type metadata accessor for AttributedString.MarkdownParsingOptions.FailurePolicy()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions.FailurePolicy();
}

uint64_t type metadata accessor for AttributedString.MarkdownParsingOptions.InterpretedSyntax()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions.InterpretedSyntax();
}

uint64_t AttributedString.MarkdownParsingOptions.init(allowsExtendedAttributes:interpretedSyntax:failurePolicy:languageCode:)()
{
  return AttributedString.MarkdownParsingOptions.init(allowsExtendedAttributes:interpretedSyntax:failurePolicy:languageCode:)();
}

uint64_t type metadata accessor for AttributedString.MarkdownParsingOptions()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions();
}

uint64_t AttributedString.Runs.AttributesSlice1.makeIterator()()
{
  return AttributedString.Runs.AttributesSlice1.makeIterator()();
}

uint64_t AttributedString.Runs.AttributesSlice1.Iterator.next()()
{
  return AttributedString.Runs.AttributesSlice1.Iterator.next()();
}

uint64_t type metadata accessor for AttributedString.Runs()
{
  return type metadata accessor for AttributedString.Runs();
}

uint64_t AttributedString.Runs.subscript.getter()
{
  return AttributedString.Runs.subscript.getter();
}

uint64_t AttributedString.runs.getter()
{
  return AttributedString.runs.getter();
}

uint64_t type metadata accessor for AttributedString.Index()
{
  return type metadata accessor for AttributedString.Index();
}

uint64_t AttributedString.insert<A>(_:at:)()
{
  return AttributedString.insert<A>(_:at:)();
}

uint64_t AttributedString.init(markdown:options:baseURL:)()
{
  return AttributedString.init(markdown:options:baseURL:)();
}

uint64_t type metadata accessor for AttributedString()
{
  return type metadata accessor for AttributedString();
}

uint64_t AttributedString.subscript.modify()
{
  return AttributedString.subscript.modify();
}

uint64_t AttributedString.subscript.getter()
{
  return AttributedString.subscript.getter();
}

uint64_t URLResourceValues.contentType.getter()
{
  return URLResourceValues.contentType.getter();
}

uint64_t URLResourceValues.fileSize.getter()
{
  return URLResourceValues.fileSize.getter();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t AttributeContainer.subscript.setter()
{
  return AttributeContainer.subscript.setter();
}

uint64_t AttributeContainer.init()()
{
  return AttributeContainer.init()();
}

uint64_t type metadata accessor for AttributeContainer()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t PresentationIntent.IntentType.kind.getter()
{
  return PresentationIntent.IntentType.kind.getter();
}

uint64_t PresentationIntent.IntentType.identity.getter()
{
  return PresentationIntent.IntentType.identity.getter();
}

uint64_t type metadata accessor for PresentationIntent.IntentType()
{
  return type metadata accessor for PresentationIntent.IntentType();
}

uint64_t PresentationIntent.components.getter()
{
  return PresentationIntent.components.getter();
}

uint64_t PresentationIntent.indentationLevel.getter()
{
  return PresentationIntent.indentationLevel.getter();
}

uint64_t type metadata accessor for PresentationIntent.Kind()
{
  return type metadata accessor for PresentationIntent.Kind();
}

uint64_t type metadata accessor for PresentationIntent()
{
  return type metadata accessor for PresentationIntent();
}

uint64_t AttributedSubstring.subscript.setter()
{
  return AttributedSubstring.subscript.setter();
}

uint64_t type metadata accessor for AttributedSubstring()
{
  return type metadata accessor for AttributedSubstring();
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return AttributeDynamicLookup.subscript.getter();
}

{
  return AttributeDynamicLookup.subscript.getter();
}

{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.pathExtension.getter()
{
  return URL.pathExtension.getter();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.deletingPathExtension()()
{
  return URL.deletingPathExtension()();
}

uint64_t URL.appendingPathExtension(_:)()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t static URL.== infix(_:_:)()
{
  return static URL.== infix(_:_:)();
}

Swift::Void __swiftcall URL.stopAccessingSecurityScopedResource()()
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Bool __swiftcall URL.startAccessingSecurityScopedResource()()
{
  return URL.startAccessingSecurityScopedResource()();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

uint64_t Data.Deallocator._deallocator.getter()
{
  return Data.Deallocator._deallocator.getter();
}

uint64_t type metadata accessor for Data.Deallocator()
{
  return type metadata accessor for Data.Deallocator();
}

uint64_t Data._copyContents(initializing:)()
{
  return Data._copyContents(initializing:)();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return type metadata accessor for Data.Iterator();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
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

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t Calendar.date(from:)()
{
  return Calendar.date(from:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)IndexPath._bridgeToObjectiveC()();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t IndexPath.item.getter()
{
  return IndexPath.item.getter();
}

uint64_t type metadata accessor for IndexPath()
{
  return type metadata accessor for IndexPath();
}

uint64_t withObservationTracking<A>(_:onChange:)()
{
  return withObservationTracking<A>(_:onChange:)();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.didSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.willSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t static Catalog.Resource.TokenInputDenyList.WritingToolsComposeInputDenyList()()
{
  return static Catalog.Resource.TokenInputDenyList.WritingToolsComposeInputDenyList()();
}

uint64_t static Catalog.Resource.TokenOutputDenyList.WritingToolsComposeOutputDenyList()()
{
  return static Catalog.Resource.TokenOutputDenyList.WritingToolsComposeOutputDenyList()();
}

uint64_t static Catalog.Resource.LLM.Model.ChatGPT()()
{
  return static Catalog.Resource.LLM.Model.ChatGPT()();
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

uint64_t dispatch thunk of WTStartupOptions.allowedResultOptions.getter()
{
  return dispatch thunk of WTStartupOptions.allowedResultOptions.getter();
}

uint64_t dispatch thunk of WTStartupOptions.contextUUID.getter()
{
  return dispatch thunk of WTStartupOptions.contextUUID.getter();
}

uint64_t dispatch thunk of WTStartupOptions.sessionUUID.getter()
{
  return dispatch thunk of WTStartupOptions.sessionUUID.getter();
}

uint64_t dispatch thunk of WTStartupOptions.analyticsUUID.getter()
{
  return dispatch thunk of WTStartupOptions.analyticsUUID.getter();
}

uint64_t dispatch thunk of WTStartupOptions.requestedTool.getter()
{
  return dispatch thunk of WTStartupOptions.requestedTool.getter();
}

uint64_t dispatch thunk of WTStartupOptions.isForAssistant.getter()
{
  return dispatch thunk of WTStartupOptions.isForAssistant.getter();
}

uint64_t dispatch thunk of WTStartupOptions.suggestionUUID.getter()
{
  return dispatch thunk of WTStartupOptions.suggestionUUID.getter();
}

uint64_t dispatch thunk of WTStartupOptions.formSheetUIType.getter()
{
  return dispatch thunk of WTStartupOptions.formSheetUIType.getter();
}

uint64_t dispatch thunk of WTStartupOptions.requestPromptEntry.getter()
{
  return dispatch thunk of WTStartupOptions.requestPromptEntry.getter();
}

uint64_t dispatch thunk of WTStartupOptions.wantsInlineEditing.getter()
{
  return dispatch thunk of WTStartupOptions.wantsInlineEditing.getter();
}

uint64_t dispatch thunk of WTStartupOptions.isForInputDashboard.getter()
{
  return dispatch thunk of WTStartupOptions.isForInputDashboard.getter();
}

uint64_t dispatch thunk of WTStartupOptions.isQuestionnairePopover.getter()
{
  return dispatch thunk of WTStartupOptions.isQuestionnairePopover.getter();
}

uint64_t dispatch thunk of WTStartupOptions.isWindowingModeEnabled.getter()
{
  return dispatch thunk of WTStartupOptions.isWindowingModeEnabled.getter();
}

uint64_t dispatch thunk of WTStartupOptions.smartReplyConfiguration.getter()
{
  return dispatch thunk of WTStartupOptions.smartReplyConfiguration.getter();
}

uint64_t dispatch thunk of WTStartupOptions.sourceUserInterfaceIdiom.getter()
{
  return dispatch thunk of WTStartupOptions.sourceUserInterfaceIdiom.getter();
}

uint64_t dispatch thunk of WTStartupOptions.wantsFormSheetPresentation.getter()
{
  return dispatch thunk of WTStartupOptions.wantsFormSheetPresentation.getter();
}

uint64_t dispatch thunk of WTStartupOptions.isResumingFromModelEnrollment.getter()
{
  return dispatch thunk of WTStartupOptions.isResumingFromModelEnrollment.getter();
}

uint64_t dispatch thunk of WTStartupOptions.sourceResponderHorizontalSizeClass.getter()
{
  return dispatch thunk of WTStartupOptions.sourceResponderHorizontalSizeClass.getter();
}

uint64_t dispatch thunk of WTStartupOptions.prompt.getter()
{
  return dispatch thunk of WTStartupOptions.prompt.getter();
}

uint64_t dispatch thunk of WTStartupOptions.bundleID.getter()
{
  return dispatch thunk of WTStartupOptions.bundleID.getter();
}

uint64_t dispatch thunk of WTStartupOptions.editable.getter()
{
  return dispatch thunk of WTStartupOptions.editable.getter();
}

uint64_t type metadata accessor for WTStartupOptions()
{
  return type metadata accessor for WTStartupOptions();
}

uint64_t type metadata accessor for WTSceneConnectionOptionsDefinition()
{
  return type metadata accessor for WTSceneConnectionOptionsDefinition();
}

uint64_t type metadata accessor for FeedbackFeatureFlags()
{
  return type metadata accessor for FeedbackFeatureFlags();
}

uint64_t type metadata accessor for FBKSEvaluation.Action()
{
  return type metadata accessor for FBKSEvaluation.Action();
}

uint64_t type metadata accessor for FBKSEvaluation.Subject()
{
  return type metadata accessor for FBKSEvaluation.Subject();
}

uint64_t static FBKSInteraction.FeatureDomain.== infix(_:_:)()
{
  return static FBKSInteraction.FeatureDomain.== infix(_:_:)();
}

uint64_t type metadata accessor for FBKSInteraction.FeatureDomain()
{
  return type metadata accessor for FBKSInteraction.FeatureDomain();
}

uint64_t FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalAnnotatedContent:generatedAnnotatedContent:extraContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)()
{
  return FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalAnnotatedContent:generatedAnnotatedContent:extraContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)();
}

uint64_t FBKSInteraction.AnnotatedContent.init(payload:displayName:description:fileName:group:iconType:additionalInfo:)()
{
  return FBKSInteraction.AnnotatedContent.init(payload:displayName:description:fileName:group:iconType:additionalInfo:)();
}

uint64_t type metadata accessor for FBKSInteraction.AnnotatedContent.IconType()
{
  return type metadata accessor for FBKSInteraction.AnnotatedContent.IconType();
}

uint64_t type metadata accessor for FBKSInteraction.AnnotatedContent()
{
  return type metadata accessor for FBKSInteraction.AnnotatedContent();
}

uint64_t dispatch thunk of FBKSInteraction.prefillQuestions.setter()
{
  return dispatch thunk of FBKSInteraction.prefillQuestions.setter();
}

uint64_t type metadata accessor for FBKSInteraction.Content()
{
  return type metadata accessor for FBKSInteraction.Content();
}

uint64_t dispatch thunk of FBKSInteraction.presented(_:)()
{
  return dispatch thunk of FBKSInteraction.presented(_:)();
}

uint64_t type metadata accessor for FBKSInteraction()
{
  return type metadata accessor for FBKSInteraction();
}

uint64_t type metadata accessor for FBKSForm.Question()
{
  return type metadata accessor for FBKSForm.Question();
}

uint64_t TokenStream.events.getter()
{
  return TokenStream.events.getter();
}

uint64_t static CachePolicy.inMemory.getter()
{
  return static CachePolicy.inMemory.getter();
}

uint64_t type metadata accessor for CachePolicy()
{
  return type metadata accessor for CachePolicy();
}

uint64_t ModelBundle.init(resource:)()
{
  return ModelBundle.init(resource:)();
}

uint64_t type metadata accessor for ModelBundle()
{
  return type metadata accessor for ModelBundle();
}

uint64_t PromptCompletion.candidates.getter()
{
  return PromptCompletion.candidates.getter();
}

uint64_t PromptCompletion.TextContent.value.getter()
{
  return PromptCompletion.TextContent.value.getter();
}

uint64_t type metadata accessor for PromptCompletion.TextContent()
{
  return type metadata accessor for PromptCompletion.TextContent();
}

uint64_t type metadata accessor for PromptCompletion.ImageContent()
{
  return type metadata accessor for PromptCompletion.ImageContent();
}

uint64_t type metadata accessor for PromptCompletion.Content()
{
  return type metadata accessor for PromptCompletion.Content();
}

uint64_t PromptCompletion.Segment.content.getter()
{
  return PromptCompletion.Segment.content.getter();
}

uint64_t type metadata accessor for PromptCompletion.Segment()
{
  return type metadata accessor for PromptCompletion.Segment();
}

uint64_t PromptCompletion.metadata.getter()
{
  return PromptCompletion.metadata.getter();
}

uint64_t PromptCompletion.Candidate.segments.getter()
{
  return PromptCompletion.Candidate.segments.getter();
}

uint64_t type metadata accessor for PromptCompletion.Candidate()
{
  return type metadata accessor for PromptCompletion.Candidate();
}

uint64_t type metadata accessor for PromptCompletion()
{
  return type metadata accessor for PromptCompletion();
}

uint64_t type metadata accessor for SamplingStrategy()
{
  return type metadata accessor for SamplingStrategy();
}

uint64_t SamplingParameters.speculativeSampling.setter()
{
  return SamplingParameters.speculativeSampling.setter();
}

uint64_t SamplingParameters.tokenHealing.setter()
{
  return SamplingParameters.tokenHealing.setter();
}

uint64_t SamplingParameters.promptLookupDraftSteps.setter()
{
  return SamplingParameters.promptLookupDraftSteps.setter();
}

uint64_t SamplingParameters.init(strategy:temperature:frequencyPenalty:lengthPenalty:maximumTokens:stopSequences:randomSeed:timeout:)()
{
  return SamplingParameters.init(strategy:temperature:frequencyPenalty:lengthPenalty:maximumTokens:stopSequences:randomSeed:timeout:)();
}

uint64_t type metadata accessor for SamplingParameters()
{
  return type metadata accessor for SamplingParameters();
}

uint64_t SessionConfiguration.init(identifier:useCaseID:preferredModelBundles:handlesSensitiveData:cachePolicy:onBehalfOf:parentOfOnBehalfOf:)()
{
  return SessionConfiguration.init(identifier:useCaseID:preferredModelBundles:handlesSensitiveData:cachePolicy:onBehalfOf:parentOfOnBehalfOf:)();
}

uint64_t type metadata accessor for SessionConfiguration()
{
  return type metadata accessor for SessionConfiguration();
}

{
  return type metadata accessor for SessionConfiguration();
}

uint64_t type metadata accessor for PromptCompletionStream()
{
  return type metadata accessor for PromptCompletionStream();
}

uint64_t FileRepresentation.init(importedContentType:shouldAttemptToOpenInPlace:importing:)()
{
  return FileRepresentation.init(importedContentType:shouldAttemptToOpenInPlace:importing:)();
}

uint64_t ReceivedTransferredFile.file.getter()
{
  return ReceivedTransferredFile.file.getter();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Availability.RestrictedInfo.RestrictedReason()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability.RestrictedInfo.RestrictedReason();
}

uint64_t GenerativeModelsAvailability.Availability.RestrictedInfo.reasons.getter()
{
  return GenerativeModelsAvailability.Availability.RestrictedInfo.reasons.getter();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Availability.RestrictedInfo()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability.RestrictedInfo();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Availability.UnavailableInfo()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability.UnavailableInfo();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Availability()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability();
}

uint64_t GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)()
{
  return GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Parameters()
{
  return type metadata accessor for GenerativeModelsAvailability.Parameters();
}

uint64_t GenerativeModelsAvailability.availability.getter()
{
  return GenerativeModelsAvailability.availability.getter();
}

uint64_t static GenerativeModelsAvailability.current(parameters:)()
{
  return static GenerativeModelsAvailability.current(parameters:)();
}

uint64_t type metadata accessor for GenerativeModelsAvailability()
{
  return type metadata accessor for GenerativeModelsAvailability();
}

uint64_t InputDenyListBundle.init<A>(resource:)()
{
  return InputDenyListBundle.init<A>(resource:)();
}

uint64_t type metadata accessor for InputDenyListBundle()
{
  return type metadata accessor for InputDenyListBundle();
}

uint64_t OutputDenyListBundle.init<A>(resource:)()
{
  return OutputDenyListBundle.init<A>(resource:)();
}

uint64_t type metadata accessor for OutputDenyListBundle()
{
  return type metadata accessor for OutputDenyListBundle();
}

uint64_t type metadata accessor for StringResponseSanitizer.Guardrails()
{
  return type metadata accessor for StringResponseSanitizer.Guardrails();
}

uint64_t type metadata accessor for StringResponseSanitizer.DefaultableOverrides()
{
  return type metadata accessor for StringResponseSanitizer.DefaultableOverrides();
}

uint64_t type metadata accessor for StringResponseSanitizer.DefaultableGuardrails()
{
  return type metadata accessor for StringResponseSanitizer.DefaultableGuardrails();
}

uint64_t StringResponseSanitizer.Overrides.init(denyList:)()
{
  return StringResponseSanitizer.Overrides.init(denyList:)();
}

uint64_t type metadata accessor for StringResponseSanitizer.Overrides()
{
  return type metadata accessor for StringResponseSanitizer.Overrides();
}

uint64_t StringResponseSanitizer.init(overrides:guardrails:)()
{
  return StringResponseSanitizer.init(overrides:guardrails:)();
}

uint64_t type metadata accessor for StringResponseSanitizer()
{
  return type metadata accessor for StringResponseSanitizer();
}

uint64_t type metadata accessor for StringRenderedPromptSanitizer.Guardrails()
{
  return type metadata accessor for StringRenderedPromptSanitizer.Guardrails();
}

uint64_t type metadata accessor for StringRenderedPromptSanitizer.DefaultableOverrides()
{
  return type metadata accessor for StringRenderedPromptSanitizer.DefaultableOverrides();
}

uint64_t type metadata accessor for StringRenderedPromptSanitizer.DefaultableGuardrails()
{
  return type metadata accessor for StringRenderedPromptSanitizer.DefaultableGuardrails();
}

uint64_t StringRenderedPromptSanitizer.Overrides.init(denyList:)()
{
  return StringRenderedPromptSanitizer.Overrides.init(denyList:)();
}

uint64_t type metadata accessor for StringRenderedPromptSanitizer.Overrides()
{
  return type metadata accessor for StringRenderedPromptSanitizer.Overrides();
}

uint64_t StringRenderedPromptSanitizer.init(overrides:guardrails:)()
{
  return StringRenderedPromptSanitizer.init(overrides:guardrails:)();
}

uint64_t type metadata accessor for StringRenderedPromptSanitizer()
{
  return type metadata accessor for StringRenderedPromptSanitizer();
}

uint64_t Regex.init(_regexString:version:)()
{
  return Regex.init(_regexString:version:)();
}

uint64_t Regex.Match.output.getter()
{
  return Regex.Match.output.getter();
}

uint64_t DefaultPerformAppIntentDelegate.init()()
{
  return DefaultPerformAppIntentDelegate.init()();
}

uint64_t type metadata accessor for DefaultPerformAppIntentDelegate()
{
  return type metadata accessor for DefaultPerformAppIntentDelegate();
}

uint64_t dispatch thunk of CustomAppEntityRepresentationBase.displayRepresentation.getter()
{
  return dispatch thunk of CustomAppEntityRepresentationBase.displayRepresentation.getter();
}

uint64_t dispatch thunk of CustomAppEntityRepresentationBase.identifier.getter()
{
  return dispatch thunk of CustomAppEntityRepresentationBase.identifier.getter();
}

uint64_t dispatch thunk of CustomAppEntityRepresentationBase.properties.getter()
{
  return dispatch thunk of CustomAppEntityRepresentationBase.properties.getter();
}

uint64_t dispatch thunk of CustomAppEntityRepresentationBase.isTransient.getter()
{
  return dispatch thunk of CustomAppEntityRepresentationBase.isTransient.getter();
}

uint64_t type metadata accessor for CustomAppEntityRepresentationBase.InstanceInfo()
{
  return type metadata accessor for CustomAppEntityRepresentationBase.InstanceInfo();
}

uint64_t dispatch thunk of CustomAppEntityRepresentationBase.exportedContent.getter()
{
  return dispatch thunk of CustomAppEntityRepresentationBase.exportedContent.getter();
}

uint64_t static CustomAppEntityRepresentationBase.from(_:context:)()
{
  return static CustomAppEntityRepresentationBase.from(_:context:)();
}

uint64_t dispatch thunk of CustomAppEntityRepresentationBase.origin.getter()
{
  return dispatch thunk of CustomAppEntityRepresentationBase.origin.getter();
}

uint64_t CustomAppEntityRepresentationBase.lnValue.getter()
{
  return CustomAppEntityRepresentationBase.lnValue.getter();
}

uint64_t CustomAppEntityRepresentationBase.deinit()
{
  return CustomAppEntityRepresentationBase.deinit();
}

uint64_t CustomAppEntityRepresentationBase.init(_:)()
{
  return CustomAppEntityRepresentationBase.init(_:)();
}

uint64_t AppIntentSuccessResult.output.getter()
{
  return AppIntentSuccessResult.output.getter();
}

uint64_t AppIntentPerformOptions.init(allowsPrepareBeforePerform:connectionOperationTimeout:donateToTranscript:exportedContentType:interactionMode:kind:preferredBundleIdentifier:preferNoticePresentation:requestUnlockIfNeeded:)()
{
  return AppIntentPerformOptions.init(allowsPrepareBeforePerform:connectionOperationTimeout:donateToTranscript:exportedContentType:interactionMode:kind:preferredBundleIdentifier:preferNoticePresentation:requestUnlockIfNeeded:)();
}

uint64_t static AppIntentPerformOptions.defaultConnectionOperationTimeout.getter()
{
  return static AppIntentPerformOptions.defaultConnectionOperationTimeout.getter();
}

uint64_t type metadata accessor for AppIntentPerformOptions()
{
  return type metadata accessor for AppIntentPerformOptions();
}

uint64_t AppIntentRepresentation.exportToSpecification()()
{
  return AppIntentRepresentation.exportToSpecification()();
}

uint64_t type metadata accessor for IntentsServices.PayloadPrivacy()
{
  return type metadata accessor for IntentsServices.PayloadPrivacy();
}

uint64_t static IntentsServices.localDispatcher(clientLabel:source:environment:options:)()
{
  return static IntentsServices.localDispatcher(clientLabel:source:environment:options:)();
}

uint64_t IntentsServices.DispatcherOptions.init(payloadPrivacy:)()
{
  return IntentsServices.DispatcherOptions.init(payloadPrivacy:)();
}

uint64_t type metadata accessor for IntentsServices.DispatcherOptions()
{
  return type metadata accessor for IntentsServices.DispatcherOptions();
}

uint64_t IntentOutput.value.getter()
{
  return IntentOutput.value.getter();
}

uint64_t EntityProperty.init(identifier:)()
{
  return EntityProperty.init(identifier:)();
}

uint64_t EntityProperty.wrappedValue.getter()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t IntentParameter.init(wrappedValue:)()
{
  return IntentParameter.init(wrappedValue:)();
}

uint64_t type metadata accessor for IntentFileRepresentation()
{
  return type metadata accessor for IntentFileRepresentation();
}

uint64_t UTType.init(mimeType:conformingTo:)()
{
  return UTType.init(mimeType:conformingTo:)();
}

uint64_t UTType.identifier.getter()
{
  return UTType.identifier.getter();
}

uint64_t static UTType.javaScript.getter()
{
  return static UTType.javaScript.getter();
}

uint64_t static UTType.tarArchive.getter()
{
  return static UTType.tarArchive.getter();
}

uint64_t static UTType.commaSeparatedText.getter()
{
  return static UTType.commaSeparatedText.getter();
}

uint64_t static UTType.css.getter()
{
  return static UTType.css.getter();
}

uint64_t static UTType.gif.getter()
{
  return static UTType.gif.getter();
}

uint64_t static UTType.pdf.getter()
{
  return static UTType.pdf.getter();
}

uint64_t static UTType.png.getter()
{
  return static UTType.png.getter();
}

uint64_t static UTType.xml.getter()
{
  return static UTType.xml.getter();
}

uint64_t static UTType.zip.getter()
{
  return static UTType.zip.getter();
}

uint64_t static UTType.data.getter()
{
  return static UTType.data.getter();
}

uint64_t static UTType.html.getter()
{
  return static UTType.html.getter();
}

uint64_t static UTType.jpeg.getter()
{
  return static UTType.jpeg.getter();
}

uint64_t static UTType.plainText.getter()
{
  return static UTType.plainText.getter();
}

uint64_t type metadata accessor for UTType()
{
  return type metadata accessor for UTType();
}

uint64_t DocumentResource.init(url:)()
{
  return DocumentResource.init(url:)();
}

uint64_t type metadata accessor for DocumentResource()
{
  return type metadata accessor for DocumentResource();
}

uint64_t type metadata accessor for DocumentRegistration.Status()
{
  return type metadata accessor for DocumentRegistration.Status();
}

uint64_t DocumentRegistration.status.getter()
{
  return DocumentRegistration.status.getter();
}

uint64_t DocumentRegistration.Progress.progress.getter()
{
  return DocumentRegistration.Progress.progress.getter();
}

uint64_t type metadata accessor for DocumentRegistration.Progress()
{
  return type metadata accessor for DocumentRegistration.Progress();
}

uint64_t type metadata accessor for DocumentRegistration()
{
  return type metadata accessor for DocumentRegistration();
}

uint64_t static DocumentResourceIdentifier.== infix(_:_:)()
{
  return static DocumentResourceIdentifier.== infix(_:_:)();
}

uint64_t type metadata accessor for DocumentResourceIdentifier()
{
  return type metadata accessor for DocumentResourceIdentifier();
}

uint64_t GenerativeAssistantSettingsOnboarding.init(enablementDelegate:)()
{
  return GenerativeAssistantSettingsOnboarding.init(enablementDelegate:)();
}

uint64_t type metadata accessor for GenerativeAssistantSettingsOnboarding()
{
  return type metadata accessor for GenerativeAssistantSettingsOnboarding();
}

uint64_t type metadata accessor for GenerativeAssistantSettingsDestination.Origin()
{
  return type metadata accessor for GenerativeAssistantSettingsDestination.Origin();
}

uint64_t GenerativeAssistantSettingsDestination.fullURL(origin:)()
{
  return GenerativeAssistantSettingsDestination.fullURL(origin:)();
}

uint64_t type metadata accessor for GenerativeAssistantSettingsDestination()
{
  return type metadata accessor for GenerativeAssistantSettingsDestination();
}

uint64_t static GenerativeAssistantSettingsUserDefaults.setEnabled(_:)()
{
  return static GenerativeAssistantSettingsUserDefaults.setEnabled(_:)();
}

uint64_t static GenerativeAssistantSettingsUserDefaults.forcedRateLimitState()()
{
  return static GenerativeAssistantSettingsUserDefaults.forcedRateLimitState()();
}

uint64_t static GenerativeAssistantSettingsUserDefaults.isEnabled()()
{
  return static GenerativeAssistantSettingsUserDefaults.isEnabled()();
}

uint64_t type metadata accessor for GenerativeAssistantSettingsUserDefaults()
{
  return type metadata accessor for GenerativeAssistantSettingsUserDefaults();
}

uint64_t type metadata accessor for EnablementUIDismissType()
{
  return type metadata accessor for EnablementUIDismissType();
}

uint64_t type metadata accessor for GenerativeError.ErrorType()
{
  return type metadata accessor for GenerativeError.ErrorType();
}

uint64_t GenerativeError.type.getter()
{
  return GenerativeError.type.getter();
}

uint64_t type metadata accessor for GenerativeError()
{
  return type metadata accessor for GenerativeError();
}

uint64_t static ToolChoice.automatic.getter()
{
  return static ToolChoice.automatic.getter();
}

uint64_t type metadata accessor for ToolChoice()
{
  return type metadata accessor for ToolChoice();
}

uint64_t GeneratedValues.extract<A>(field:)()
{
  return GeneratedValues.extract<A>(field:)();
}

uint64_t type metadata accessor for GeneratedValues()
{
  return type metadata accessor for GeneratedValues();
}

uint64_t Schema.Field.init<A>(name:description:type:)()
{
  return Schema.Field.init<A>(name:description:type:)();
}

uint64_t Schema.Field.init<A>(name:type:)()
{
  return Schema.Field.init<A>(name:type:)();
}

uint64_t type metadata accessor for Schema.Field()
{
  return type metadata accessor for Schema.Field();
}

uint64_t Schema.init(fields:)()
{
  return Schema.init(fields:)();
}

uint64_t type metadata accessor for Schema()
{
  return type metadata accessor for Schema();
}

uint64_t static ToolType.imageGenerator.getter()
{
  return static ToolType.imageGenerator.getter();
}

uint64_t static ToolType.tooling(_:)()
{
  return static ToolType.tooling(_:)();
}

uint64_t type metadata accessor for ToolType()
{
  return type metadata accessor for ToolType();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return os_signpost(_:dso:log:name:signpostID:_:_:)();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.init()()
{
  return Logger.init()();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t ClientProcessInfo.init(processIdentifier:)()
{
  return ClientProcessInfo.init(processIdentifier:)();
}

uint64_t type metadata accessor for ClientProcessInfo()
{
  return type metadata accessor for ClientProcessInfo();
}

uint64_t type metadata accessor for SummarizationClient.TextAssistantSummarizationOptions.Source()
{
  return type metadata accessor for SummarizationClient.TextAssistantSummarizationOptions.Source();
}

uint64_t SummarizationClient.TextAssistantSummarizationOptions.init(source:originatingProcess:)()
{
  return SummarizationClient.TextAssistantSummarizationOptions.init(source:originatingProcess:)();
}

uint64_t type metadata accessor for SummarizationClient.TextAssistantSummarizationOptions()
{
  return type metadata accessor for SummarizationClient.TextAssistantSummarizationOptions();
}

uint64_t SummarizationClient.partialSummaries(for:options:requestIdentifier:)()
{
  return SummarizationClient.partialSummaries(for:options:requestIdentifier:)();
}

uint64_t SummarizationClient.TextAssistantPartialSummary.safetyClassification.getter()
{
  return SummarizationClient.TextAssistantPartialSummary.safetyClassification.getter();
}

uint64_t SummarizationClient.TextAssistantPartialSummary.inferenceEnvironmentInfo.getter()
{
  return SummarizationClient.TextAssistantPartialSummary.inferenceEnvironmentInfo.getter();
}

uint64_t SummarizationClient.TextAssistantPartialSummary.content.getter()
{
  return SummarizationClient.TextAssistantPartialSummary.content.getter();
}

uint64_t SummarizationClient.init()()
{
  return SummarizationClient.init()();
}

uint64_t type metadata accessor for SummarizationClient()
{
  return type metadata accessor for SummarizationClient();
}

uint64_t SessionConfiguration.init(tokenGeneratorConfig:identifier:instructions:templateID:)()
{
  return SessionConfiguration.init(tokenGeneratorConfig:identifier:instructions:templateID:)();
}

uint64_t static TextCompositionClient.textCompositionClientFinishedKey.getter()
{
  return static TextCompositionClient.textCompositionClientFinishedKey.getter();
}

uint64_t type metadata accessor for TextCompositionClient.RewritingType()
{
  return type metadata accessor for TextCompositionClient.RewritingType();
}

uint64_t type metadata accessor for TextCompositionClient.TCDocumentType()
{
  return type metadata accessor for TextCompositionClient.TCDocumentType();
}

uint64_t dispatch thunk of TextCompositionClient.streamForReview(of:range:options:)()
{
  return dispatch thunk of TextCompositionClient.streamForReview(of:range:options:)();
}

uint64_t dispatch thunk of TextCompositionClient.requestPrewarming(for:)()
{
  return dispatch thunk of TextCompositionClient.requestPrewarming(for:)();
}

uint64_t dispatch thunk of TextCompositionClient.streamForRewriting(of:range:rewritingType:options:)()
{
  return dispatch thunk of TextCompositionClient.streamForRewriting(of:range:rewritingType:options:)();
}

uint64_t dispatch thunk of TextCompositionClient.actualRangeForRewritingOrReview(of:range:rewritingType:options:)()
{
  return dispatch thunk of TextCompositionClient.actualRangeForRewritingOrReview(of:range:rewritingType:options:)();
}

uint64_t type metadata accessor for TextCompositionClient()
{
  return type metadata accessor for TextCompositionClient();
}

uint64_t InferenceEnvironmentInfo.modelVersion.getter()
{
  return InferenceEnvironmentInfo.modelVersion.getter();
}

uint64_t InferenceEnvironmentInfo.modelIdentifier.getter()
{
  return InferenceEnvironmentInfo.modelIdentifier.getter();
}

uint64_t InferenceEnvironmentInfo.baseModelVersion.getter()
{
  return InferenceEnvironmentInfo.baseModelVersion.getter();
}

uint64_t InferenceEnvironmentInfo.tokenizerVersion.getter()
{
  return InferenceEnvironmentInfo.tokenizerVersion.getter();
}

uint64_t InferenceEnvironmentInfo.draftModelVersion.getter()
{
  return InferenceEnvironmentInfo.draftModelVersion.getter();
}

uint64_t InferenceEnvironmentInfo.baseModelIdentifier.getter()
{
  return InferenceEnvironmentInfo.baseModelIdentifier.getter();
}

uint64_t InferenceEnvironmentInfo.tokenizerIdentifier.getter()
{
  return InferenceEnvironmentInfo.tokenizerIdentifier.getter();
}

uint64_t InferenceEnvironmentInfo.draftModelIdentifier.getter()
{
  return InferenceEnvironmentInfo.draftModelIdentifier.getter();
}

uint64_t type metadata accessor for InferenceEnvironmentInfo()
{
  return type metadata accessor for InferenceEnvironmentInfo();
}

uint64_t SummarySafetyClassification.isSafe.getter()
{
  return SummarySafetyClassification.isSafe.getter();
}

uint64_t type metadata accessor for SummarySafetyClassification()
{
  return type metadata accessor for SummarySafetyClassification();
}

uint64_t static GenerativeExperiencesSession.terminateSession(for:)()
{
  return static GenerativeExperiencesSession.terminateSession(for:)();
}

uint64_t GenerativeExperiencesSession.toolChoice.setter()
{
  return GenerativeExperiencesSession.toolChoice.setter();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> GenerativeExperiencesSession.unregister(documents:)(Swift::OpaquePointer documents)
{
}

uint64_t GenerativeExperiencesSession.init(configuration:)()
{
  return GenerativeExperiencesSession.init(configuration:)();
}

Swift::String __swiftcall GenerativeExperiencesSession.sessionIdentifier()()
{
  uint64_t v0 = GenerativeExperiencesSession.sessionIdentifier()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t GenerativeExperiencesSession.tools.setter()
{
  return GenerativeExperiencesSession.tools.setter();
}

Swift::Bool __swiftcall GenerativeExperiencesSession.canRedo()()
{
  return GenerativeExperiencesSession.canRedo()();
}

Swift::Bool __swiftcall GenerativeExperiencesSession.canUndo()()
{
  return GenerativeExperiencesSession.canUndo()();
}

uint64_t GenerativeExperiencesSession.complete<A>(generating:parameters:promptSanitizer:responseSanitizer:query:)()
{
  return GenerativeExperiencesSession.complete<A>(generating:parameters:promptSanitizer:responseSanitizer:query:)();
}

uint64_t GenerativeExperiencesSession.register(documents:)()
{
  return GenerativeExperiencesSession.register(documents:)();
}

uint64_t type metadata accessor for GenerativeExperiencesSession()
{
  return type metadata accessor for GenerativeExperiencesSession();
}

uint64_t OpenAIAuthenticator.RateLimitBudgets.isRateLimited.getter()
{
  return OpenAIAuthenticator.RateLimitBudgets.isRateLimited.getter();
}

uint64_t type metadata accessor for OpenAIAuthenticator.RateLimitBudgets()
{
  return type metadata accessor for OpenAIAuthenticator.RateLimitBudgets();
}

uint64_t static OpenAIAuthenticator.shared.getter()
{
  return static OpenAIAuthenticator.shared.getter();
}

uint64_t type metadata accessor for OpenAIAuthenticator()
{
  return type metadata accessor for OpenAIAuthenticator();
}

uint64_t dispatch thunk of IntelligenceUI.PromptEntryView.backgroundView.getter()
{
  return dispatch thunk of IntelligenceUI.PromptEntryView.backgroundView.getter();
}

uint64_t IntelligenceUI.PromptEntryView.textView.getter()
{
  return IntelligenceUI.PromptEntryView.textView.getter();
}

uint64_t dispatch thunk of IntelligenceUI.PromptEntryView.accessoryView.getter()
{
  return dispatch thunk of IntelligenceUI.PromptEntryView.accessoryView.getter();
}

uint64_t dispatch thunk of IntelligenceUI.PromptEntryView.accessoryView.setter()
{
  return dispatch thunk of IntelligenceUI.PromptEntryView.accessoryView.setter();
}

uint64_t dispatch thunk of IntelligenceUI.PromptEntryView.placeholder.setter()
{
  return dispatch thunk of IntelligenceUI.PromptEntryView.placeholder.setter();
}

uint64_t IntelligenceUI.PromptEntryView.leadingButton.getter()
{
  return IntelligenceUI.PromptEntryView.leadingButton.getter();
}

uint64_t IntelligenceUI.PromptEntryView.trailingButton.getter()
{
  return IntelligenceUI.PromptEntryView.trailingButton.getter();
}

uint64_t dispatch thunk of IntelligenceUI.PromptEntryView.visibleLineLimit.setter()
{
  return dispatch thunk of IntelligenceUI.PromptEntryView.visibleLineLimit.setter();
}

uint64_t dispatch thunk of IntelligenceUI.PromptEntryView.isLeadingButtonVisible.setter()
{
  return dispatch thunk of IntelligenceUI.PromptEntryView.isLeadingButtonVisible.setter();
}

uint64_t IntelligenceUI.PromptEntryView.PlaceholderConfiguration.init(textColor:)()
{
  return IntelligenceUI.PromptEntryView.PlaceholderConfiguration.init(textColor:)();
}

uint64_t type metadata accessor for IntelligenceUI.PromptEntryView.PlaceholderConfiguration()
{
  return type metadata accessor for IntelligenceUI.PromptEntryView.PlaceholderConfiguration();
}

uint64_t dispatch thunk of IntelligenceUI.PromptEntryView.placeholderConfiguration.setter()
{
  return dispatch thunk of IntelligenceUI.PromptEntryView.placeholderConfiguration.setter();
}

uint64_t type metadata accessor for IntelligenceUI.PromptEntryView.AmbiguityAppearanceConfiguration()
{
  return type metadata accessor for IntelligenceUI.PromptEntryView.AmbiguityAppearanceConfiguration();
}

uint64_t dispatch thunk of IntelligenceUI.PromptEntryView.isLeadingButtonConfiguredAsToggle.setter()
{
  return dispatch thunk of IntelligenceUI.PromptEntryView.isLeadingButtonConfiguredAsToggle.setter();
}

uint64_t dispatch thunk of IntelligenceUI.PromptEntryView.trailingButtonActivatesDictationWhenEmpty.setter()
{
  return dispatch thunk of IntelligenceUI.PromptEntryView.trailingButtonActivatesDictationWhenEmpty.setter();
}

uint64_t dispatch thunk of IntelligenceUI.PromptEntryView.delegate.setter()
{
  return dispatch thunk of IntelligenceUI.PromptEntryView.delegate.setter();
}

uint64_t type metadata accessor for IntelligenceUI.PromptEntryView()
{
  return type metadata accessor for IntelligenceUI.PromptEntryView();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t static UIPromptBackgroundView.Configuration.intelligent.getter()
{
  return static UIPromptBackgroundView.Configuration.intelligent.getter();
}

uint64_t UIPromptBackgroundView.Configuration.shadowColor.setter()
{
  return UIPromptBackgroundView.Configuration.shadowColor.setter();
}

uint64_t UIPromptBackgroundView.Configuration.shadowRadius.setter()
{
  return UIPromptBackgroundView.Configuration.shadowRadius.setter();
}

uint64_t static UIPromptBackgroundView.Configuration.default.getter()
{
  return static UIPromptBackgroundView.Configuration.default.getter();
}

uint64_t UIPromptBackgroundView.Configuration.fillStyle.setter()
{
  return UIPromptBackgroundView.Configuration.fillStyle.setter();
}

uint64_t type metadata accessor for UIPromptBackgroundView.Configuration()
{
  return type metadata accessor for UIPromptBackgroundView.Configuration();
}

uint64_t dispatch thunk of UIPromptBackgroundView.configuration.getter()
{
  return dispatch thunk of UIPromptBackgroundView.configuration.getter();
}

uint64_t dispatch thunk of UIPromptBackgroundView.configuration.setter()
{
  return dispatch thunk of UIPromptBackgroundView.configuration.setter();
}

uint64_t type metadata accessor for UIPromptBackgroundView.FillStyle()
{
  return type metadata accessor for UIPromptBackgroundView.FillStyle();
}

uint64_t NSDiffableDataSourceSnapshot.appendItems(_:toSection:)()
{
  return NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.deleteItems(_:)(Swift::OpaquePointer a1)
{
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.appendSections(_:)(Swift::OpaquePointer a1)
{
}

uint64_t NSDiffableDataSourceSnapshot.itemIdentifiers.getter()
{
  return NSDiffableDataSourceSnapshot.itemIdentifiers.getter();
}

uint64_t UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)()
{
  return UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.snapshot()()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t NWPathMonitor.pathUpdateHandler.setter()
{
  return NWPathMonitor.pathUpdateHandler.setter();
}

uint64_t NWPathMonitor.start(queue:)()
{
  return NWPathMonitor.start(queue:)();
}

uint64_t NWPathMonitor.init()()
{
  return NWPathMonitor.init()();
}

uint64_t type metadata accessor for NWPathMonitor()
{
  return type metadata accessor for NWPathMonitor();
}

uint64_t static NWPath.Status.== infix(_:_:)()
{
  return static NWPath.Status.== infix(_:_:)();
}

uint64_t type metadata accessor for NWPath.Status()
{
  return type metadata accessor for NWPath.Status();
}

uint64_t NWPath.status.getter()
{
  return NWPath.status.getter();
}

uint64_t type metadata accessor for NWPath()
{
  return type metadata accessor for NWPath();
}

uint64_t Animatable<>.animatableData.modify()
{
  return Animatable<>.animatableData.modify();
}

uint64_t static Animatable<>._makeAnimatable(value:inputs:)()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t static ButtonRole.cancel.getter()
{
  return static ButtonRole.cancel.getter();
}

uint64_t type metadata accessor for ButtonRole()
{
  return type metadata accessor for ButtonRole();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t FocusState.wrappedValue.getter()
{
  return FocusState.wrappedValue.getter();
}

uint64_t FocusState.wrappedValue.setter()
{
  return FocusState.wrappedValue.setter();
}

uint64_t FocusState.projectedValue.getter()
{
  return FocusState.projectedValue.getter();
}

uint64_t FocusState.Binding.wrappedValue.getter()
{
  return FocusState.Binding.wrappedValue.getter();
}

uint64_t FocusState.Binding.wrappedValue.setter()
{
  return FocusState.Binding.wrappedValue.setter();
}

uint64_t FocusState.Binding.projectedValue.getter()
{
  return FocusState.Binding.projectedValue.getter();
}

uint64_t FocusState.init<>()()
{
  return FocusState.init<>()();
}

uint64_t static ScenePhase.== infix(_:_:)()
{
  return static ScenePhase.== infix(_:_:)();
}

uint64_t type metadata accessor for ScenePhase()
{
  return type metadata accessor for ScenePhase();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t TapGesture.init(count:)()
{
  return TapGesture.init(count:)();
}

uint64_t type metadata accessor for TapGesture()
{
  return type metadata accessor for TapGesture();
}

uint64_t static ColorScheme.== infix(_:_:)()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t DragGesture.init<A>(minimumDistance:coordinateSpace:)()
{
  return DragGesture.init<A>(minimumDistance:coordinateSpace:)();
}

uint64_t type metadata accessor for DragGesture()
{
  return type metadata accessor for DragGesture();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t Environment.init<A>(_:)()
{
  return Environment.init<A>(_:)();
}

{
  return Environment.init<A>(_:)();
}

uint64_t static GestureMask.all.getter()
{
  return static GestureMask.all.getter();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t ToolbarItem<>.init(placement:content:)()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t ProgressView<>.init<>()()
{
  return ProgressView<>.init<>()();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t AnyShapeStyle.init<A>(_:)()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t type metadata accessor for DismissAction()
{
  return type metadata accessor for DismissAction();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t GeometryProxy.frame<A>(in:)()
{
  return GeometryProxy.frame<A>(in:)();
}

uint64_t type metadata accessor for GeometryProxy()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t LayoutSubview.sizeThatFits(_:)()
{
  return LayoutSubview.sizeThatFits(_:)();
}

uint64_t LayoutSubview.place(at:anchor:proposal:)()
{
  return LayoutSubview.place(at:anchor:proposal:)();
}

uint64_t LayoutSubview.priority.getter()
{
  return LayoutSubview.priority.getter();
}

uint64_t type metadata accessor for LayoutSubview()
{
  return type metadata accessor for LayoutSubview();
}

uint64_t OpenURLAction.init(handler:)()
{
  return OpenURLAction.init(handler:)();
}

uint64_t type metadata accessor for OpenURLAction()
{
  return type metadata accessor for OpenURLAction();
}

uint64_t static PreferenceKey._isReadableByHost.getter()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t static PreferenceKey._includesRemovedValues.getter()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t type metadata accessor for _TaskModifier()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t static EnvironmentKey._valuesEqual(_:_:)()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t LabeledContent<>.init(content:label:)()
{
  return LabeledContent<>.init(content:label:)();
}

uint64_t type metadata accessor for LayoutSubviews()
{
  return type metadata accessor for LayoutSubviews();
}

uint64_t LayoutSubviews.subscript.getter()
{
  return LayoutSubviews.subscript.getter();
}

Swift::Void __swiftcall NavigationPath.removeLast(_:)(Swift::Int a1)
{
}

uint64_t type metadata accessor for NavigationPath.CollectionProxy()
{
  return type metadata accessor for NavigationPath.CollectionProxy();
}

uint64_t NavigationPath.withCollectionProxy(_:)()
{
  return NavigationPath.withCollectionProxy(_:)();
}

uint64_t NavigationPath.count.getter()
{
  return NavigationPath.count.getter();
}

uint64_t NavigationPath.append<A>(_:)()
{
  return NavigationPath.append<A>(_:)();
}

uint64_t NavigationPath.isEmpty.getter()
{
  return NavigationPath.isEmpty.getter();
}

uint64_t NavigationPath.init()()
{
  return NavigationPath.init()();
}

uint64_t type metadata accessor for NavigationPath()
{
  return type metadata accessor for NavigationPath();
}

uint64_t static SubmitTriggers.text.getter()
{
  return static SubmitTriggers.text.getter();
}

uint64_t type metadata accessor for SubmitTriggers()
{
  return type metadata accessor for SubmitTriggers();
}

uint64_t TintShapeStyle.init()()
{
  return TintShapeStyle.init()();
}

uint64_t type metadata accessor for TintShapeStyle()
{
  return type metadata accessor for TintShapeStyle();
}

uint64_t _UIHostingView.init(rootView:)()
{
  return _UIHostingView.init(rootView:)();
}

uint64_t DynamicTypeSize.isAccessibilitySize.getter()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t ModifiedContent<>.accessibilityAddTraits(_:)()
{
  return ModifiedContent<>.accessibilityAddTraits(_:)();
}

uint64_t ModifiedContent<>.accessibilityRemoveTraits(_:)()
{
  return ModifiedContent<>.accessibilityRemoveTraits(_:)();
}

uint64_t NavigationStack.init<>(path:root:)()
{
  return NavigationStack.init<>(path:root:)();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t ButtonToggleStyle.init()()
{
  return ButtonToggleStyle.init()();
}

uint64_t type metadata accessor for ButtonToggleStyle()
{
  return type metadata accessor for ButtonToggleStyle();
}

uint64_t EnvironmentValues.imageScale.getter()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t EnvironmentValues.scenePhase.getter()
{
  return EnvironmentValues.scenePhase.getter();
}

uint64_t EnvironmentValues.scenePhase.setter()
{
  return EnvironmentValues.scenePhase.setter();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.dynamicTypeSize.getter()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t EnvironmentValues.dynamicTypeSize.setter()
{
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.minimumScaleFactor.getter()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t EnvironmentValues.minimumScaleFactor.setter()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t EnvironmentValues.horizontalSizeClass.getter()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t EnvironmentValues.horizontalSizeClass.setter()
{
  return EnvironmentValues.horizontalSizeClass.setter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.tint.getter()
{
  return EnvironmentValues.tint.getter();
}

uint64_t EnvironmentValues.tint.setter()
{
  return EnvironmentValues.tint.setter();
}

uint64_t EnvironmentValues.dismiss.getter()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t EnvironmentValues.openURL.getter()
{
  return EnvironmentValues.openURL.getter();
}

uint64_t EnvironmentValues.openURL.setter()
{
  return EnvironmentValues.openURL.setter();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t EnvironmentValues.subscript.getter()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t EnvironmentValues.subscript.setter()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t type metadata accessor for NavigationBarItem.TitleDisplayMode()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t static VerticalAlignment.top.getter()
{
  return static VerticalAlignment.top.getter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t IconOnlyLabelStyle.init()()
{
  return IconOnlyLabelStyle.init()();
}

uint64_t type metadata accessor for IconOnlyLabelStyle()
{
  return type metadata accessor for IconOnlyLabelStyle();
}

uint64_t LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:formatter:)()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:formatter:)();
}

uint64_t LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for LocalizedStringKey.StringInterpolation()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t LocalizedStringKey.init(stringInterpolation:)()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t static PresentationDetent.large.getter()
{
  return static PresentationDetent.large.getter();
}

uint64_t static PresentationDetent.medium.getter()
{
  return static PresentationDetent.medium.getter();
}

uint64_t type metadata accessor for PresentationDetent()
{
  return type metadata accessor for PresentationDetent();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static AccessibilityTraits.isSelected.getter()
{
  return static AccessibilityTraits.isSelected.getter();
}

uint64_t static AccessibilityTraits.isButton.getter()
{
  return static AccessibilityTraits.isButton.getter();
}

uint64_t static AccessibilityTraits.isHeader.getter()
{
  return static AccessibilityTraits.isHeader.getter();
}

uint64_t type metadata accessor for AccessibilityTraits()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t TupleToolbarContent.init(_:)()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t dispatch thunk of UIHostingController.sizingOptions.setter()
{
  return dispatch thunk of UIHostingController.sizingOptions.setter();
}

uint64_t UIHostingController.safeAreaRegions.setter()
{
  return UIHostingController.safeAreaRegions.setter();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t type metadata accessor for _ConditionalContent.Storage()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for _ConditionalContent()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t static ParagraphTypesetting.balanced.getter()
{
  return static ParagraphTypesetting.balanced.getter();
}

uint64_t type metadata accessor for ParagraphTypesetting()
{
  return type metadata accessor for ParagraphTypesetting();
}

uint64_t RectangleCornerRadii.init(topLeft:topRight:bottomRight:bottomLeft:)()
{
  return RectangleCornerRadii.init(topLeft:topRight:bottomRight:bottomLeft:)();
}

uint64_t static ScrollBounceBehavior.basedOnSize.getter()
{
  return static ScrollBounceBehavior.basedOnSize.getter();
}

uint64_t type metadata accessor for ScrollBounceBehavior()
{
  return type metadata accessor for ScrollBounceBehavior();
}

uint64_t static ToolbarItemPlacement.cancellationAction.getter()
{
  return static ToolbarItemPlacement.cancellationAction.getter();
}

uint64_t static ToolbarItemPlacement.confirmationAction.getter()
{
  return static ToolbarItemPlacement.confirmationAction.getter();
}

uint64_t type metadata accessor for ToolbarItemPlacement()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t type metadata accessor for GlobalCoordinateSpace()
{
  return type metadata accessor for GlobalCoordinateSpace();
}

uint64_t static ToolbarContentBuilder.buildBlock<A>(_:)()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t static ToolbarContentBuilder.buildIf<A>(_:)()
{
  return static ToolbarContentBuilder.buildIf<A>(_:)();
}

uint64_t static HierarchicalShapeStyle.primary.getter()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t static HierarchicalShapeStyle.secondary.getter()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t TitleAndIconLabelStyle.init()()
{
  return TitleAndIconLabelStyle.init()();
}

uint64_t type metadata accessor for TitleAndIconLabelStyle()
{
  return type metadata accessor for TitleAndIconLabelStyle();
}

uint64_t type metadata accessor for UnevenRoundedRectangle()
{
  return type metadata accessor for UnevenRoundedRectangle();
}

uint64_t type metadata accessor for UserInterfaceSizeClass()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t static CoordinateSpaceProtocol<>.global.getter()
{
  return static CoordinateSpaceProtocol<>.global.getter();
}

uint64_t type metadata accessor for LabelStyleConfiguration.Icon()
{
  return type metadata accessor for LabelStyleConfiguration.Icon();
}

uint64_t LabelStyleConfiguration.icon.getter()
{
  return LabelStyleConfiguration.icon.getter();
}

uint64_t type metadata accessor for LabelStyleConfiguration.Title()
{
  return type metadata accessor for LabelStyleConfiguration.Title();
}

uint64_t LabelStyleConfiguration.title.getter()
{
  return LabelStyleConfiguration.title.getter();
}

uint64_t type metadata accessor for ButtonStyleConfiguration.Label()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t ButtonStyleConfiguration.label.getter()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t ButtonStyleConfiguration.isPressed.getter()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t CircularProgressViewStyle.init()()
{
  return CircularProgressViewStyle.init()();
}

uint64_t type metadata accessor for CircularProgressViewStyle()
{
  return type metadata accessor for CircularProgressViewStyle();
}

uint64_t static AccessibilityChildBehavior.ignore.getter()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t static AccessibilityChildBehavior.combine.getter()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t UIViewRepresentableContext.coordinator.getter()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t RoundedBorderTextFieldStyle.init()()
{
  return RoundedBorderTextFieldStyle.init()();
}

uint64_t type metadata accessor for RoundedBorderTextFieldStyle()
{
  return type metadata accessor for RoundedBorderTextFieldStyle();
}

uint64_t static ScrollDismissesKeyboardMode.interactively.getter()
{
  return static ScrollDismissesKeyboardMode.interactively.getter();
}

uint64_t type metadata accessor for ScrollDismissesKeyboardMode()
{
  return type metadata accessor for ScrollDismissesKeyboardMode();
}

uint64_t static ContainerBackgroundPlacement.navigation.getter()
{
  return static ContainerBackgroundPlacement.navigation.getter();
}

uint64_t type metadata accessor for ContainerBackgroundPlacement()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t static UIViewControllerRepresentable._layoutOptions(_:)()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t UIViewControllerRepresentable._identifiedViewTree(in:)()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewControllerRepresentable.body.getter()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t UIViewControllerRepresentable<>.makeCoordinator()()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t static UIHostingControllerSizingOptions.preferredContentSize.getter()
{
  return static UIHostingControllerSizingOptions.preferredContentSize.getter();
}

uint64_t type metadata accessor for UIHostingControllerSizingOptions()
{
  return type metadata accessor for UIHostingControllerSizingOptions();
}

uint64_t UIViewControllerRepresentableContext.coordinator.getter()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Axis.Set.horizontal.getter()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t Axis.Set.init(rawValue:)()
{
  return Axis.Set.init(rawValue:)();
}

uint64_t static Axis.Set.vertical.getter()
{
  return static Axis.Set.vertical.getter();
}

uint64_t Axis.rawValue.getter()
{
  return Axis.rawValue.getter();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t Edge.Set.init(rawValue:)()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
}

uint64_t static Font.subheadline.getter()
{
  return static Font.subheadline.getter();
}

uint64_t static Font.title.getter()
{
  return static Font.title.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.Weight.bold.getter()
{
  return static Font.Weight.bold.getter();
}

uint64_t static Font.Weight.light.getter()
{
  return static Font.Weight.light.getter();
}

uint64_t static Font.Weight.medium.getter()
{
  return static Font.Weight.medium.getter();
}

uint64_t static Font.Weight.regular.getter()
{
  return static Font.Weight.regular.getter();
}

uint64_t static Font.Weight.semibold.getter()
{
  return static Font.Weight.semibold.getter();
}

uint64_t Font.italic()()
{
  return Font.italic()();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t static Font.title2.getter()
{
  return static Font.title2.getter();
}

uint64_t static Font.callout.getter()
{
  return static Font.callout.getter();
}

uint64_t static Font.caption.getter()
{
  return static Font.caption.getter();
}

uint64_t static Font.footnote.getter()
{
  return static Font.footnote.getter();
}

uint64_t static Font.headline.getter()
{
  return static Font.headline.getter();
}

uint64_t Menu.init(content:label:)()
{
  return Menu.init(content:label:)();
}

uint64_t Text.fontWeight(_:)()
{
  return Text.fontWeight(_:)();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t static Text.+ infix(_:_:)()
{
  return static Text.+ infix(_:_:)();
}

uint64_t Text.bold()()
{
  return Text.bold()();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t static Text.LineStyle.single.getter()
{
  return static Text.LineStyle.single.getter();
}

uint64_t type metadata accessor for Text.LineStyle()
{
  return type metadata accessor for Text.LineStyle();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t Text.init(_:)()
{
  return Text.init(_:)();
}

{
  return Text.init(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t View.photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:)()
{
  return View.photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:)();
}

uint64_t View.inlineFeedback(controller:completion:)()
{
  return View.inlineFeedback(controller:completion:)();
}

uint64_t View.representablePreferredFocusableView<A>(_:resolver:)()
{
  return View.representablePreferredFocusableView<A>(_:resolver:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.progressViewStyle<A>(_:)()
{
  return View.progressViewStyle<A>(_:)();
}

uint64_t View.fontWeight(_:)()
{
  return View.fontWeight(_:)();
}

uint64_t View.labelStyle<A>(_:)()
{
  return View.labelStyle<A>(_:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t View.environment<A>(_:)()
{
  return View.environment<A>(_:)();
}

uint64_t View.toggleStyle<A>(_:)()
{
  return View.toggleStyle<A>(_:)();
}

uint64_t View.fileImporter(isPresented:allowedContentTypes:allowsMultipleSelection:onCompletion:)()
{
  return View.fileImporter(isPresented:allowedContentTypes:allowsMultipleSelection:onCompletion:)();
}

uint64_t View.accessibility(addTraits:)()
{
  return View.accessibility(addTraits:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.scrollDisabled(_:)()
{
  return View.scrollDisabled(_:)();
}

uint64_t View.textFieldStyle<A>(_:)()
{
  return View.textFieldStyle<A>(_:)();
}

uint64_t View.navigationTitle(_:)()
{
  return View.navigationTitle(_:)();
}

uint64_t View.navigationTitle<A>(_:)()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t View.accessibilityLabel(_:)()
{
  return View.accessibilityLabel(_:)();
}

{
  return View.accessibilityLabel(_:)();
}

uint64_t View.accessibilityLabel<A>(_:)()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t View.accessibilityHidden(_:)()
{
  return View.accessibilityHidden(_:)();
}

uint64_t View.containerBackground<A>(_:for:)()
{
  return View.containerBackground<A>(_:for:)();
}

uint64_t View.defaultScrollAnchor(_:)()
{
  return View.defaultScrollAnchor(_:)();
}

uint64_t View.navigationBarHidden(_:)()
{
  return View.navigationBarHidden(_:)();
}

uint64_t View.presentationDetents(_:selection:)()
{
  return View.presentationDetents(_:selection:)();
}

uint64_t View.simultaneousGesture<A>(_:including:)()
{
  return View.simultaneousGesture<A>(_:including:)();
}

uint64_t View.accessibilityElement(children:)()
{
  return View.accessibilityElement(children:)();
}

uint64_t View.paragraphTypesetting(_:isEnabled:)()
{
  return View.paragraphTypesetting(_:isEnabled:)();
}

uint64_t View.scrollBounceBehavior(_:axes:)()
{
  return View.scrollBounceBehavior(_:axes:)();
}

uint64_t View.navigationDestination<A, B>(for:destination:)()
{
  return View.navigationDestination<A, B>(for:destination:)();
}

uint64_t View.scrollContentBackground(_:)()
{
  return View.scrollContentBackground(_:)();
}

uint64_t View.scrollDismissesKeyboard(_:)()
{
  return View.scrollDismissesKeyboard(_:)();
}

uint64_t View.navigationBarBackButtonHidden(_:)()
{
  return View.navigationBarBackButtonHidden(_:)();
}

uint64_t View.navigationBarTitleDisplayMode(_:)()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t View.bold(_:)()
{
  return View.bold(_:)();
}

uint64_t View.help(_:)()
{
  return View.help(_:)();
}

uint64_t View.alert<A, B, C>(_:isPresented:presenting:actions:message:)()
{
  return View.alert<A, B, C>(_:isPresented:presenting:actions:message:)();
}

uint64_t View.alert<A>(_:isPresented:actions:)()
{
  return View.alert<A>(_:isPresented:actions:)();
}

uint64_t View.sheet<A>(isPresented:onDismiss:content:)()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t View.focused(_:)()
{
  return View.focused(_:)();
}

uint64_t View.gesture<A>(_:including:)()
{
  return View.gesture<A>(_:including:)();
}

uint64_t View.toolbar<A>(content:)()
{
  return View.toolbar<A>(content:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t View.onSubmit(of:_:)()
{
  return View.onSubmit(of:_:)();
}

uint64_t View.lineLimit(_:)()
{
  return View.lineLimit(_:)();
}

uint64_t Color.init(uiColor:)()
{
  return Color.init(uiColor:)();
}

uint64_t static Color.accentColor.getter()
{
  return static Color.accentColor.getter();
}

uint64_t static Color.== infix(_:_:)()
{
  return static Color.== infix(_:_:)();
}

uint64_t Color.mix(with:by:in:)()
{
  return Color.mix(with:by:in:)();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.blue.getter()
{
  return static Color.blue.getter();
}

uint64_t static Color.gray.getter()
{
  return static Color.gray.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t Color.init(_:bundle:)()
{
  return Color.init(_:bundle:)();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.renderingMode(_:)()
{
  return Image.renderingMode(_:)();
}

uint64_t Image.init(_internalSystemName:)()
{
  return Image.init(_internalSystemName:)();
}

uint64_t type metadata accessor for Image.TemplateRenderingMode()
{
  return type metadata accessor for Image.TemplateRenderingMode();
}

uint64_t static Image.Scale.== infix(_:_:)()
{
  return static Image.Scale.== infix(_:_:)();
}

uint64_t type metadata accessor for Image.Scale()
{
  return type metadata accessor for Image.Scale();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t Image.init(_:bundle:)()
{
  return Image.init(_:bundle:)();
}

uint64_t Label.init(title:icon:)()
{
  return Label.init(title:icon:)();
}

uint64_t Label<>.init(_:systemImage:)()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t Label<>.init<A>(_:systemImage:)()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t Button<>.init(_:role:action:)()
{
  return Button<>.init(_:role:action:)();
}

uint64_t Button<>.init(_:action:)()
{
  return Button<>.init(_:action:)();
}

uint64_t Button<>.init<A>(_:action:)()
{
  return Button<>.init<A>(_:action:)();
}

uint64_t HStack.init(alignment:spacing:content:)()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for HStack()
{
  return type metadata accessor for HStack();
}

uint64_t static Layout._makeLayoutView(root:inputs:body:)()
{
  return static Layout._makeLayoutView(root:inputs:body:)();
}

uint64_t Layout.updateCache(_:subviews:)()
{
  return Layout.updateCache(_:subviews:)();
}

uint64_t static Layout.layoutProperties.getter()
{
  return static Layout.layoutProperties.getter();
}

uint64_t Layout.spacing(subviews:cache:)()
{
  return Layout.spacing(subviews:cache:)();
}

uint64_t Layout<>.makeCache(subviews:)()
{
  return Layout<>.makeCache(subviews:)();
}

uint64_t Picker.init(selection:label:content:)()
{
  return Picker.init(selection:label:content:)();
}

uint64_t Picker<>.init(_:selection:content:)()
{
  return Picker<>.init(_:selection:content:)();
}

uint64_t Toggle.init(isOn:label:)()
{
  return Toggle.init(isOn:label:)();
}

uint64_t VStack.init(alignment:spacing:content:)()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for VStack()
{
  return type metadata accessor for VStack();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.wrappedValue.setter()
{
  return Binding.wrappedValue.setter();
}

uint64_t Binding.subscript.getter()
{
  return Binding.subscript.getter();
}

uint64_t Binding.projectedValue.getter()
{
  return Binding.projectedValue.getter();
}

uint64_t Binding.init(get:set:)()
{
  return Binding.init(get:set:)();
}

uint64_t static Binding.constant(_:)()
{
  return static Binding.constant(_:)();
}

uint64_t Binding<A>.subscript.getter()
{
  return Binding<A>.subscript.getter();
}

uint64_t type metadata accessor for Binding()
{
  return type metadata accessor for Binding();
}

uint64_t type metadata accessor for Capsule()
{
  return type metadata accessor for Capsule();
}

uint64_t Divider.init()()
{
  return Divider.init()();
}

uint64_t type metadata accessor for Divider()
{
  return type metadata accessor for Divider();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t Gesture.onEnded(_:)()
{
  return Gesture.onEnded(_:)();
}

uint64_t Gesture<>.onChanged(_:)()
{
  return Gesture<>.onChanged(_:)();
}

uint64_t Section<>.init(header:content:)()
{
  return Section<>.init(header:content:)();
}

uint64_t Section<>.init(content:)()
{
  return Section<>.init(content:)();
}

uint64_t Bindable.wrappedValue.getter()
{
  return Bindable.wrappedValue.getter();
}

uint64_t Bindable.projectedValue.getter()
{
  return Bindable.projectedValue.getter();
}

uint64_t Bindable<A>.init(wrappedValue:)()
{
  return Bindable<A>.init(wrappedValue:)();
}

uint64_t Bindable<A>.subscript.getter()
{
  return Bindable<A>.subscript.getter();
}

uint64_t type metadata accessor for Bindable()
{
  return type metadata accessor for Bindable();
}

uint64_t static Gradient.ColorSpace.perceptual.getter()
{
  return static Gradient.ColorSpace.perceptual.getter();
}

uint64_t type metadata accessor for Gradient.ColorSpace()
{
  return type metadata accessor for Gradient.ColorSpace();
}

uint64_t static Alignment.topTrailing.getter()
{
  return static Alignment.topTrailing.getter();
}

uint64_t static Alignment.top.getter()
{
  return static Alignment.top.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Alignment.leading.getter()
{
  return static Alignment.leading.getter();
}

uint64_t static Alignment.trailing.getter()
{
  return static Alignment.trailing.getter();
}

uint64_t Animation.delay(_:)()
{
  return Animation.delay(_:)();
}

uint64_t static Animation.spring(response:dampingFraction:blendDuration:)()
{
  return static Animation.spring(response:dampingFraction:blendDuration:)();
}

uint64_t static Animation.easeInOut(duration:)()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t type metadata accessor for BlendMode()
{
  return type metadata accessor for BlendMode();
}

uint64_t TextField<>.init(_:text:onEditingChanged:onCommit:)()
{
  return TextField<>.init(_:text:onEditingChanged:onCommit:)();
}

uint64_t TextField<>.init<A>(_:text:onEditingChanged:onCommit:)()
{
  return TextField<>.init<A>(_:text:onEditingChanged:onCommit:)();
}

uint64_t TextField<>.init<A>(_:text:axis:)()
{
  return TextField<>.init<A>(_:text:axis:)();
}

uint64_t static UnitPoint.== infix(_:_:)()
{
  return static UnitPoint.== infix(_:_:)();
}

uint64_t static UnitPoint.top.getter()
{
  return static UnitPoint.top.getter();
}

uint64_t UnitPoint.hash(into:)()
{
  return UnitPoint.hash(into:)();
}

uint64_t static UnitPoint.bottom.getter()
{
  return static UnitPoint.bottom.getter();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
}

uint64_t static UnitPoint.leading.getter()
{
  return static UnitPoint.leading.getter();
}

uint64_t static UnitPoint.trailing.getter()
{
  return static UnitPoint.trailing.getter();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
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

uint64_t static FBKEvaluationController.systemImageName(for:hasResponse:)()
{
  return static FBKEvaluationController.systemImageName(for:hasResponse:)();
}

uint64_t FBKEvaluationController.init(subject:)()
{
  return FBKEvaluationController.init(subject:)();
}

uint64_t type metadata accessor for FBKEvaluationController()
{
  return type metadata accessor for FBKEvaluationController();
}

uint64_t static PHPickerFilter.images.getter()
{
  return static PHPickerFilter.images.getter();
}

uint64_t type metadata accessor for PHPickerFilter()
{
  return type metadata accessor for PHPickerFilter();
}

uint64_t ChatMessagePrompt.init(role:prompt:)()
{
  return ChatMessagePrompt.init(role:prompt:)();
}

uint64_t type metadata accessor for ChatMessagePrompt()
{
  return type metadata accessor for ChatMessagePrompt();
}

uint64_t type metadata accessor for ChatMessagesPrompt()
{
  return type metadata accessor for ChatMessagesPrompt();
}

uint64_t static ChatMessagesPromptBuilder.buildBlock(_:)()
{
  return static ChatMessagesPromptBuilder.buildBlock(_:)();
}

uint64_t static ChatMessagesPromptBuilder.buildExpression<A>(_:)()
{
  return static ChatMessagesPromptBuilder.buildExpression<A>(_:)();
}

uint64_t static CustomPromptBuilder.buildBlock(_:)()
{
  return static CustomPromptBuilder.buildBlock(_:)();
}

uint64_t static CustomPromptBuilder.buildExpression(_:)()
{
  return static CustomPromptBuilder.buildExpression(_:)();
}

{
  return static CustomPromptBuilder.buildExpression(_:)();
}

uint64_t Prompt.init(stringLiteral:)()
{
  return Prompt.init(stringLiteral:)();
}

uint64_t Prompt.StringInterpolation.appendInterpolation(_:priority:privacy:)()
{
  return Prompt.StringInterpolation.appendInterpolation(_:priority:privacy:)();
}

Swift::Void __swiftcall Prompt.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t Prompt.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return Prompt.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for Prompt.StringInterpolation()
{
  return type metadata accessor for Prompt.StringInterpolation();
}

uint64_t Prompt.init(stringInterpolation:)()
{
  return Prompt.init(stringInterpolation:)();
}

uint64_t type metadata accessor for Prompt.Component.Privacy()
{
  return type metadata accessor for Prompt.Component.Privacy();
}

uint64_t type metadata accessor for Prompt()
{
  return type metadata accessor for Prompt();
}

uint64_t type metadata accessor for ChatMessageRole()
{
  return type metadata accessor for ChatMessageRole();
}

uint64_t type metadata accessor for User()
{
  return type metadata accessor for User();
}

uint64_t User.init(_:)()
{
  return User.init(_:)();
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

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t BidirectionalCollection<>.matches<A, B>(of:)()
{
  return BidirectionalCollection<>.matches<A, B>(of:)();
}

uint64_t dispatch thunk of BidirectionalCollection.formIndex(before:)()
{
  return dispatch thunk of BidirectionalCollection.formIndex(before:)();
}

uint64_t BidirectionalCollection<>.difference<A>(from:)()
{
  return BidirectionalCollection<>.difference<A>(from:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
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

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t String.init(localized:)()
{
  return String.init(localized:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return static String._fromUTF8Repairing(_:)();
}

uint64_t String.text.getter()
{
  return String.text.getter();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(before:)()
{
  return String.index(before:)();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
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

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
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

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return Array._checkSubscript(_:wasNativeTypeChecked:)();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return Array._hoistableIsNativeTypeChecked()();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t Array.endIndex.getter()
{
  return Array.endIndex.getter();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t TaskGroup.makeAsyncIterator()()
{
  return TaskGroup.makeAsyncIterator()();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return static Task<>.isCancelled.getter();
}

uint64_t ThrowingTaskGroup.makeAsyncIterator()()
{
  return ThrowingTaskGroup.makeAsyncIterator()();
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t AsyncThrowingStream.Continuation.yield(_:)()
{
  return AsyncThrowingStream.Continuation.yield(_:)();
}

uint64_t AsyncThrowingStream.Continuation.finish(throwing:)()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t AsyncThrowingStream.makeAsyncIterator()()
{
  return AsyncThrowingStream.makeAsyncIterator()();
}

uint64_t AsyncThrowingStream.init<>(_:bufferingPolicy:_:)()
{
  return AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.distance(from:to:)()
{
  return dispatch thunk of Collection.distance(from:to:)();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t dispatch thunk of RangeReplaceableCollection.replaceSubrange<A>(_:with:)()
{
  return dispatch thunk of RangeReplaceableCollection.replaceSubrange<A>(_:with:)();
}

uint64_t Range<>.init(_:in:)()
{
  return Range<>.init(_:in:)();
}

uint64_t NSDictionary.init(dictionaryLiteral:)()
{
  return NSDictionary.init(dictionaryLiteral:)();
}

uint64_t NSOrderedSet.makeIterator()()
{
  return NSOrderedSet.makeIterator()();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
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

uint64_t static UIVisualEffect.intelligenceContentLight(source:activationDirection:deactivationDirection:)()
{
  return static UIVisualEffect.intelligenceContentLight(source:activationDirection:deactivationDirection:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
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

uint64_t NSAttributedString.init(_:)()
{
  return NSAttributedString.init(_:)();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t type metadata accessor for NSNotificationCenter.Publisher()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t NSNotificationCenter.publisher(for:object:)()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t UISceneConnectionOptions.subscript.getter()
{
  return UISceneConnectionOptions.subscript.getter();
}

UIMenu __swiftcall UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

uint64_t NSArray.init(arrayLiteral:)()
{
  return NSArray.init(arrayLiteral:)();
}

uint64_t NSArray.makeIterator()()
{
  return NSArray.makeIterator()();
}

uint64_t UIColor.init(_:)()
{
  return UIColor.init(_:)();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t UIButton.Configuration.preferredSymbolConfigurationForImage.setter()
{
  return UIButton.Configuration.preferredSymbolConfigurationForImage.setter();
}

uint64_t static UIButton.Configuration.borderless()()
{
  return static UIButton.Configuration.borderless()();
}

uint64_t UIButton.Configuration.baseForegroundColor.setter()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t UIButton.Configuration.image.setter()
{
  return UIButton.Configuration.image.setter();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t UIButton.configuration.setter()
{
  return UIButton.configuration.setter();
}

uint64_t _NSRange.init(_:)()
{
  return _NSRange.init(_:)();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
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

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t StringProtocol.enumerateSubstrings<A>(in:options:_:)()
{
  return StringProtocol.enumerateSubstrings<A>(in:options:_:)();
}

uint64_t StringProtocol.hash.getter()
{
  return StringProtocol.hash.getter();
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

uint64_t CaseIterable<>.init(from:)()
{
  return CaseIterable<>.init(from:)();
}

uint64_t StaticString.description.getter()
{
  return StaticString.description.getter();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return _ArrayBuffer._getElementSlowPath(_:)();
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

uint64_t _assertionFailure(_:_:flags:)()
{
  return _assertionFailure(_:_:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return _CocoaArrayWrapper.subscript.getter();
}

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

uint64_t dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter()
{
  return dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter();
}

uint64_t CollectionDifference.insertions.getter()
{
  return CollectionDifference.insertions.getter();
}

uint64_t CollectionDifference.removals.getter()
{
  return CollectionDifference.removals.getter();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return _getErrorEmbeddedNSError<A>(_:)();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSUnionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
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

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return __CFURLAttachSecurityScopeToFileURL();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return __CFURLCopySecurityScopeFromFileURL();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return __swift_isClassOrObjCExistentialType();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_deallocUninitializedObject()
{
  return _swift_deallocUninitializedObject();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
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

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return _swift_isUniquelyReferenced_nonNull();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
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

id objc_msgSend_insertAnimatedTextPlaceholderAtLocation_numLines_(void *a1, const char *a2, ...)
{
  return [a1 insertAnimatedTextPlaceholderAtLocation:numLines:];
}

id objc_msgSend_insertAnimatedTextPlaceholderAtLocation_numLines_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertAnimatedTextPlaceholderAtLocation:numLines:completion:");
}

id objc_msgSend_insertAttributedText_(void *a1, const char *a2, ...)
{
  return [a1 insertAttributedText:];
}

id objc_msgSend_insertAttributedText_withAnimationStyle_completion_(void *a1, const char *a2, ...)
{
  return [a1 insertAttributedText:withAnimationStyle:completion:];
}

id objc_msgSend_replaceAnimatedTextPlaceholderWith_(void *a1, const char *a2, ...)
{
  return [a1 replaceAnimatedTextPlaceholderWith:];
}

id objc_msgSend_replaceAnimatedTextPlaceholderWith_completion_(void *a1, const char *a2, ...)
{
  return [a1 replaceAnimatedTextPlaceholderWith:completion:];
}