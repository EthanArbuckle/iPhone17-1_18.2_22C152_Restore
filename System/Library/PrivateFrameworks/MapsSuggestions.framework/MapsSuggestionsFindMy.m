@interface MapsSuggestionsFindMy
- (_TtC15MapsSuggestions21MapsSuggestionsFindMy)init;
- (id)initFromResourceDepot:(id)a3;
- (void)locationOf:(MapsSuggestionsEntry *)a3 completionHandler:(id)a4;
- (void)verifyFriendshipWith:(NSArray *)a3 completionHandler:(id)a4;
@end

@implementation MapsSuggestionsFindMy

- (id)initFromResourceDepot:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id result = objc_msgSend(a3, sel_oneFindMyConnector);
  if (result)
  {
    *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC15MapsSuggestions21MapsSuggestionsFindMy__connector) = (Class)result;

    v8.receiver = v5;
    v8.super_class = (Class)type metadata accessor for MapsSuggestionsFindMy();
    v7 = [(MapsSuggestionsFindMy *)&v8 init];
    swift_unknownObjectRelease();
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)verifyFriendshipWith:(NSArray *)a3 completionHandler:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6EFD50);
  MEMORY[0x1F4188790]();
  objc_super v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_1A721F0E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96EBB98;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96EBBA0;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_1A714C0B4((uint64_t)v8, (uint64_t)&unk_1E96EBBA8, (uint64_t)v13);
  swift_release();
}

- (void)locationOf:(MapsSuggestionsEntry *)a3 completionHandler:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6EFD50);
  MEMORY[0x1F4188790]();
  objc_super v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_1A721F0E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96EBB78;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96EBB80;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_1A714C0B4((uint64_t)v8, (uint64_t)&unk_1E96EBB88, (uint64_t)v13);
  swift_release();
}

- (_TtC15MapsSuggestions21MapsSuggestionsFindMy)init
{
  id result = (_TtC15MapsSuggestions21MapsSuggestionsFindMy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end