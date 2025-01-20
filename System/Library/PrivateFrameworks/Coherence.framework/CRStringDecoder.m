@interface CRStringDecoder
- (_TtC9Coherence15CRStringDecoder)init;
- (id)addedByVersionWithError:(id *)a3;
- (id)fromAddedByVersionWithError:(id *)a3;
- (id)fromVersionWithError:(id *)a3;
- (id)storageWithError:(id *)a3;
- (id)substringAddedByReplica:(int64_t)a3 withError:(id *)a4;
- (id)substringCharReplicaWithError:(id *)a3;
- (id)substringRemovedAddedByReplica:(int64_t)a3 withError:(id *)a4;
- (id)versionWithError:(id *)a3;
- (int64_t)substringAddedByCount;
- (int64_t)substringChildCount;
- (int64_t)substringContentOptions;
- (int64_t)substringCount;
- (int64_t)substringRemovedAddedByCount;
- (unsigned)substringAddedByCounter:(int64_t)a3;
- (unsigned)substringCharClock;
- (unsigned)substringChild:(int64_t)a3;
- (unsigned)substringLength;
- (unsigned)substringRemovedAddedByCounter:(int64_t)a3;
- (void)decodeSubstring:(int64_t)a3;
@end

@implementation CRStringDecoder

- (void).cxx_destruct
{
}

- (int64_t)substringRemovedAddedByCount
{
  return sub_1C3F9DA98(self, (uint64_t)a2, &OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__removedAddedBy);
}

- (int64_t)substringContentOptions
{
  uint64_t v3 = type metadata accessor for Proto_Subsequence(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = (char *)self + OBJC_IVAR____TtC9Coherence15CRStringDecoder_subsequence;
  swift_beginAccess();
  sub_1C3F96414((uint64_t)v7, (uint64_t)v6, type metadata accessor for Proto_Subsequence);
  v8 = (int64_t *)(*(void *)&v6[*(int *)(v4 + 28)]
                        + OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__contentOptions);
  swift_beginAccess();
  int64_t v9 = *v8;
  sub_1C3F9633C((uint64_t)v6, type metadata accessor for Proto_Subsequence);
  return v9;
}

- (int64_t)substringAddedByCount
{
  return sub_1C3F9DA98(self, (uint64_t)a2, &OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__addedBy);
}

- (id)substringCharReplicaWithError:(id *)a3
{
  uint64_t v4 = sub_1C4496678();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1C3F9E3C8((uint64_t)v7);

  int64_t v9 = (void *)sub_1C4496608();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (int64_t)substringChildCount
{
  return sub_1C3F9DA98(self, (uint64_t)a2, &OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__child);
}

- (unsigned)substringCharClock
{
  v2 = self;
  unsigned int v3 = sub_1C3F9E0C4();

  return v3;
}

- (unsigned)substringLength
{
  uint64_t v3 = type metadata accessor for Proto_Subsequence(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = (char *)self + OBJC_IVAR____TtC9Coherence15CRStringDecoder_subsequence;
  swift_beginAccess();
  sub_1C3F96414((uint64_t)v7, (uint64_t)v6, type metadata accessor for Proto_Subsequence);
  v8 = (_DWORD *)(*(void *)&v6[*(int *)(v4 + 28)]
                + OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__length);
  swift_beginAccess();
  LODWORD(v8) = *v8;
  sub_1C3F9633C((uint64_t)v6, type metadata accessor for Proto_Subsequence);
  return v8;
}

- (void)decodeSubstring:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1C3F9EA50(a3);
}

- (unsigned)substringChild:(int64_t)a3
{
  uint64_t v5 = type metadata accessor for Proto_Subsequence(0);
  uint64_t v6 = v5 - 8;
  MEMORY[0x1F4188790](v5);
  v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  int64_t v9 = (char *)self + OBJC_IVAR____TtC9Coherence15CRStringDecoder_subsequence;
  swift_beginAccess();
  sub_1C3F96414((uint64_t)v9, (uint64_t)v8, type metadata accessor for Proto_Subsequence);
  v10 = (uint64_t *)(*(void *)&v8[*(int *)(v6 + 28)]
                  + OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__child);
  swift_beginAccess();
  uint64_t v11 = *v10;
  v12 = self;
  swift_bridgeObjectRetain();
  unsigned int result = sub_1C3F9633C((uint64_t)v8, type metadata accessor for Proto_Subsequence);
  if (a3 < 0)
  {
    __break(1u);
  }
  else if (*(void *)(v11 + 16) > (unint64_t)a3)
  {
    unsigned int v14 = *(_DWORD *)(v11 + 4 * a3 + 32);

    swift_bridgeObjectRelease();
    return v14;
  }
  __break(1u);
  return result;
}

- (id)substringAddedByReplica:(int64_t)a3 withError:(id *)a4
{
  return sub_1C3FA5D28(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_1C3FA5EA0);
}

- (unsigned)substringAddedByCounter:(int64_t)a3
{
  uint64_t v4 = self;
  LODWORD(a3) = sub_1C3FA6464(a3);

  return a3;
}

- (id)versionWithError:(id *)a3
{
  return sub_1C3FA4768(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_1C3FA8F68);
}

- (int64_t)substringCount
{
  uint64_t v3 = type metadata accessor for Proto_Sequence(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3F96414((uint64_t)self + OBJC_IVAR____TtC9Coherence15CRStringDecoder_encoded, (uint64_t)v6, type metadata accessor for Proto_Sequence);
  uint64_t v7 = *(void *)&v6[*(int *)(v4 + 28)];
  swift_beginAccess();
  uint64_t v8 = *(void *)(v7 + 40);
  int64_t v9 = self;
  swift_bridgeObjectRetain();
  sub_1C3F9633C((uint64_t)v6, type metadata accessor for Proto_Sequence);
  int64_t v10 = *(void *)(v8 + 16);

  swift_bridgeObjectRelease();
  return v10;
}

- (id)addedByVersionWithError:(id *)a3
{
  return sub_1C3FA4768(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_1C3FA90B8);
}

- (id)storageWithError:(id *)a3
{
  uint64_t v3 = self;
  sub_1C412DE70(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  uint64_t v4 = (void *)sub_1C44982D8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (id)fromVersionWithError:(id *)a3
{
  return sub_1C3FA4768(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_1C412E040);
}

- (id)fromAddedByVersionWithError:(id *)a3
{
  return sub_1C3FA4768(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_1C412E090);
}

- (id)substringRemovedAddedByReplica:(int64_t)a3 withError:(id *)a4
{
  return sub_1C3FA5D28(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_1C412E0E0);
}

- (unsigned)substringRemovedAddedByCounter:(int64_t)a3
{
  uint64_t v4 = self;
  LODWORD(a3) = sub_1C412E118(a3);

  return a3;
}

- (_TtC9Coherence15CRStringDecoder)init
{
  unsigned int result = (_TtC9Coherence15CRStringDecoder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end