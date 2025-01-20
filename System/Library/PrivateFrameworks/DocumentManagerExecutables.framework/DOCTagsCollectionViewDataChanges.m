@interface DOCTagsCollectionViewDataChanges
- (BOOL)empty;
- (NSArray)deletions;
- (_TtC26DocumentManagerExecutables32DOCTagsCollectionViewDataChanges)init;
- (void)setDeletions:(id)a3;
@end

@implementation DOCTagsCollectionViewDataChanges

- (NSArray)deletions
{
  swift_beginAccess();
  sub_22BDD9D50(0, (unint64_t *)&unk_2684870B0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22BE92EA8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setDeletions:(id)a3
{
  sub_22BDD9D50(0, (unint64_t *)&unk_2684870B0);
  uint64_t v4 = sub_22BE92EB8();
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCTagsCollectionViewDataChanges_deletions);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)empty
{
  v3 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCTagsCollectionViewDataChanges_deletions);
  swift_beginAccess();
  unint64_t v4 = *v3;
  if (v4 >> 62)
  {
    v7 = self;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_22BE937E8();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v5 == 0;
}

- (_TtC26DocumentManagerExecutables32DOCTagsCollectionViewDataChanges)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCTagsCollectionViewDataChanges_deletions) = (Class)MEMORY[0x263F8EE78];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCTagsCollectionViewDataChanges();
  return [(DOCTagsCollectionViewDataChanges *)&v3 init];
}

- (void).cxx_destruct
{
}

@end