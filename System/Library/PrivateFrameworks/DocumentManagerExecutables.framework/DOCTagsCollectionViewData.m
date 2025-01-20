@interface DOCTagsCollectionViewData
- (BOOL)_hasPendingExternalChange;
- (_TtC26DocumentManagerExecutables25DOCTagsCollectionViewData)init;
- (_TtP26DocumentManagerExecutables33DOCTagsCollectionViewDataDelegate_)delegate;
- (id)tagAtIndex:(int64_t)a3;
- (int64_t)countOfTags;
- (int64_t)indexOfTag:(id)a3;
- (int64_t)presenceOf:(id)a3;
- (void)applyPendingExternalChange:(id)a3 timeout:(double)a4;
- (void)applyTagsFromNodes:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DOCTagsCollectionViewData

- (BOOL)_hasPendingExternalChange
{
  return *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC26DocumentManagerExecutables25DOCTagsCollectionViewData_pendingExternalChange) != 0;
}

- (_TtP26DocumentManagerExecutables33DOCTagsCollectionViewDataDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC26DocumentManagerExecutables25DOCTagsCollectionViewData_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x230F57630](v2);

  return (_TtP26DocumentManagerExecutables33DOCTagsCollectionViewDataDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)applyTagsFromNodes:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268487058);
  sub_22BE92EB8();
  v4 = self;
  sub_22BE65388();

  swift_bridgeObjectRelease();
}

- (void)applyPendingExternalChange:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  v7 = self;
  sub_22BE656CC((uint64_t)v6, a4);
}

- (int64_t)countOfTags
{
  v2 = self;
  int64_t v3 = sub_22BE662E4();

  return v3;
}

- (id)tagAtIndex:(int64_t)a3
{
  v4 = self;
  v5 = (void *)sub_22BE663B4(a3);

  return v5;
}

- (int64_t)indexOfTag:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_22BE66560((uint64_t)v4);

  return v6;
}

- (int64_t)presenceOf:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_22BE666A0(v4);

  return v6;
}

- (_TtC26DocumentManagerExecutables25DOCTagsCollectionViewData)init
{
  v2 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC26DocumentManagerExecutables25DOCTagsCollectionViewData_tagsUnionCollection);
  int64_t v3 = self;
  uint64_t *v2 = sub_22BE69490(MEMORY[0x263F8EE78]);
  v2[1] = v4;
  v2[2] = v5;
  *(Class *)((char *)&v3->super.isa
           + OBJC_IVAR____TtC26DocumentManagerExecutables25DOCTagsCollectionViewData_pendingExternalChange) = 0;
  swift_unknownObjectWeakInit();

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for DOCTagsCollectionViewData();
  return [(DOCTagsCollectionViewData *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  int64_t v3 = (char *)self + OBJC_IVAR____TtC26DocumentManagerExecutables25DOCTagsCollectionViewData_delegate;

  sub_22BE69F64((uint64_t)v3);
}

@end