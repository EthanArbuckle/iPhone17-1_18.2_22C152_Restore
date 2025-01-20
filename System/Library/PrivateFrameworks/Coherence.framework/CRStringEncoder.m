@interface CRStringEncoder
- (BOOL)setStorage:(id)a3 error:(id *)a4;
- (_TtC9Coherence15CRStringEncoder)init;
- (void)addAddedById:(id)a3 clock:(unsigned int)a4;
- (void)addChildWithId:(unsigned int)a3;
- (void)addRemovedAddedById:(id)a3 clock:(unsigned int)a4;
- (void)finishSubstring;
- (void)setCharWithId:(id)a3 clock:(unsigned int)a4;
- (void)setFromAddedByVersion:(id)a3;
- (void)setFromVersion:(id)a3;
- (void)setWithAddedByVersion:(id)a3;
- (void)setWithContentOptions:(int64_t)a3;
- (void)setWithLength:(unsigned int)a3;
- (void)setWithVersion:(id)a3;
@end

@implementation CRStringEncoder

- (void)setWithAddedByVersion:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C3F56510();
}

- (void)setWithVersion:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C3FBCF34((uint64_t)v4);
}

- (void)addChildWithId:(unsigned int)a3
{
  id v4 = self;
  sub_1C3F6A0E4(a3);
}

- (void)setCharWithId:(id)a3 clock:(unsigned int)a4
{
}

- (void)setWithLength:(unsigned int)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9Coherence15CRStringEncoder_subsequence;
  swift_beginAccess();
  uint64_t v6 = *(int *)(type metadata accessor for Proto_Subsequence(0) + 20);
  v7 = self;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for Proto_Subsequence._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = swift_retain();
    uint64_t v9 = sub_1C3F7273C(v8);
    swift_release();
    *(void *)&v5[v6] = v9;
    swift_release();
  }
  v10 = (unsigned int *)(*(void *)&v5[v6]
                       + OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__length);
  swift_beginAccess();
  unsigned int *v10 = a3;
  swift_endAccess();
}

- (void)finishSubstring
{
  v2 = self;
  sub_1C3F6AA88();
}

- (void).cxx_destruct
{
}

- (void)addAddedById:(id)a3 clock:(unsigned int)a4
{
}

- (void)addRemovedAddedById:(id)a3 clock:(unsigned int)a4
{
}

- (void)setWithContentOptions:(int64_t)a3
{
  id v4 = self;
  sub_1C412E1D8(a3);
}

- (BOOL)setStorage:(id)a3 error:(id *)a4
{
  return sub_1C4131A40(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(unsigned char *))sub_1C412E318);
}

- (void)setFromVersion:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C412E4C0((uint64_t)v4);
}

- (void)setFromAddedByVersion:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C412E540((uint64_t)v4);
}

- (_TtC9Coherence15CRStringEncoder)init
{
  result = (_TtC9Coherence15CRStringEncoder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end