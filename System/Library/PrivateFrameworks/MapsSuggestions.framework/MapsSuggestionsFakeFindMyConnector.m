@interface MapsSuggestionsFakeFindMyConnector
- (CLLocation)cachedLocation;
- (CLLocation)refreshedLocation;
- (NSArray)friends;
- (NSString)uniqueName;
- (_TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector)init;
- (void)expireCachedLocation;
- (void)latestLocationFor:(NSString *)a3 completionHandler:(id)a4;
- (void)listOfFriendsWithCompletionHandler:(id)a3;
- (void)locationFor:(NSString *)a3 completionHandler:(id)a4;
- (void)nilCachedLocation;
- (void)setCachedLocation:(double)a3 :(double)a4;
- (void)setCachedLocation:(id)a3;
- (void)setFriends:(id)a3;
- (void)setRefreshedLocation:(id)a3;
- (void)setTestFriends;
- (void)setUniqueName:(id)a3;
@end

@implementation MapsSuggestionsFakeFindMyConnector

- (NSString)uniqueName
{
  return (NSString *)sub_1A714A6AC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_uniqueName);
}

- (void)setUniqueName:(id)a3
{
}

- (NSArray)friends
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A721F040();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setFriends:(id)a3
{
  uint64_t v4 = sub_1A721F050();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_friends);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (CLLocation)cachedLocation
{
  return (CLLocation *)sub_1A714AB9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_cachedLocation);
}

- (void)setCachedLocation:(id)a3
{
}

- (CLLocation)refreshedLocation
{
  return (CLLocation *)sub_1A714AB9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_refreshedLocation);
}

- (void)setRefreshedLocation:(id)a3
{
}

- (_TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector)init
{
  return (_TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector *)MapsSuggestionsFakeFindMyConnector.init()();
}

- (void)nilCachedLocation
{
  v2 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_cachedLocation);
  swift_beginAccess();
  v3 = *v2;
  void *v2 = 0;
}

- (void)setCachedLocation:(double)a3 :(double)a4
{
  uint64_t v7 = sub_1A721ED40();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = self;
  sub_1A721ED20();
  id v12 = objc_allocWithZone(MEMORY[0x1E4F1E5F0]);
  v13 = (void *)sub_1A721ECB0();
  id v14 = objc_msgSend(v12, sel_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_, v13, a3, a4, 0.0, 0.0, 0.0);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v15 = (void **)((char *)&v11->super.isa
                + OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_cachedLocation);
  swift_beginAccess();
  v16 = *v15;
  *v15 = v14;
}

- (void)expireCachedLocation
{
  v2 = self;
  MapsSuggestionsFakeFindMyConnector.expireCachedLocation()();
}

- (void)setTestFriends
{
  v2 = self;
  MapsSuggestionsFakeFindMyConnector.setTestFriends()();
}

- (void)listOfFriendsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6EFD50);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A721F0E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E96EC098;
  v11[5] = v9;
  id v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E96EC0A0;
  v12[5] = v11;
  v13 = self;
  sub_1A714C0B4((uint64_t)v7, (uint64_t)&unk_1E96EC0A8, (uint64_t)v12);
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
  v13[4] = &unk_1E96EC078;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96EC080;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A714C0B4((uint64_t)v9, (uint64_t)&unk_1E96EC088, (uint64_t)v14);
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
  v13[4] = &unk_1E96EC048;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E96EBB80;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1A714C0B4((uint64_t)v9, (uint64_t)&unk_1E96EBB88, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_cachedLocation));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15MapsSuggestions34MapsSuggestionsFakeFindMyConnector_refreshedLocation);
}

@end