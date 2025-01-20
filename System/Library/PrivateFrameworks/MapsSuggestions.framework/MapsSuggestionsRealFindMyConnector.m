@interface MapsSuggestionsRealFindMyConnector
- (NSString)uniqueName;
- (_TtC15MapsSuggestions34MapsSuggestionsRealFindMyConnector)init;
- (void)latestLocationFor:(NSString *)a3 completionHandler:(id)a4;
- (void)listOfFriendsWithCompletionHandler:(id)a3;
- (void)locationFor:(NSString *)a3 completionHandler:(id)a4;
- (void)setUniqueName:(id)a3;
@end

@implementation MapsSuggestionsRealFindMyConnector

- (NSString)uniqueName
{
  return (NSString *)sub_1A714A6AC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsRealFindMyConnector_uniqueName);
}

- (void)setUniqueName:(id)a3
{
}

- (_TtC15MapsSuggestions34MapsSuggestionsRealFindMyConnector)init
{
  return (_TtC15MapsSuggestions34MapsSuggestionsRealFindMyConnector *)MapsSuggestionsRealFindMyConnector.init()();
}

- (void)listOfFriendsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6EFD50);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A721F0E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E96EC0F8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96EC100;
  v12[5] = v11;
  v13 = self;
  sub_1A714C0B4((uint64_t)v7, (uint64_t)&unk_1E96EC108, (uint64_t)v12);
  swift_release();
}

- (void)locationFor:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6EFD50);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1A721F0E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96EC0D8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96EC0E0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A714C0B4((uint64_t)v9, (uint64_t)&unk_1E96EC0E8, (uint64_t)v14);
  swift_release();
}

- (void)latestLocationFor:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6EFD50);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1A721F0E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E96EC0B8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96EC0C0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A714C0B4((uint64_t)v9, (uint64_t)&unk_1E96EC0C8, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end