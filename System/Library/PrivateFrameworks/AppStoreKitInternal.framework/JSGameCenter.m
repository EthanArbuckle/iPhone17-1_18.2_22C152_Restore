@interface JSGameCenter
- (_TtC19AppStoreKitInternal12JSGameCenter)init;
- (id)fetchAchievementSummaryForGame:(id)a3;
- (id)fetchActivityFeedCards:(id)a3 :(int64_t)a4;
- (id)fetchFriendsThatPlayGame:(id)a3;
- (id)fetchGameInfo:(id)a3;
- (id)fetchGamesPopularWithFriends:(id)a3 :(int64_t)a4;
- (id)fetchRecentlyPlayedGamesWithinSeconds:(id)a3 :(int64_t)a4 :(int64_t)a5;
- (id)fetchRengagementDataForLocalPlayer;
- (id)fetchSuggestedFriends:(int64_t)a3;
@end

@implementation JSGameCenter

- (id)fetchFriendsThatPlayGame:(id)a3
{
  return sub_1E17C39A0(self);
}

- (id)fetchAchievementSummaryForGame:(id)a3
{
  return sub_1E17C39A0(self);
}

- (id)fetchRecentlyPlayedGamesWithinSeconds:(id)a3 :(int64_t)a4 :(int64_t)a5
{
  uint64_t v8 = sub_1E1D57D28();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = &v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_1E1D5BE58();
  uint64_t v14 = v13;
  sub_1E1D5A8D8();
  v15 = self;
  sub_1E1D5A8C8();
  sub_1E1D57D08();
  sub_1E1D5C9D8();
  v16 = (void *)sub_1E1D5A8C8();
  sub_1E1D57CF8();

  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  v17 = (void *)sub_1E1D5CC88();
  uint64_t v21 = v12;
  uint64_t v22 = v14;
  v23 = v15;
  int64_t v24 = a4;
  int64_t v25 = a5;
  v26 = v11;
  v18 = (void *)sub_1E1D5CC98();

  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  swift_bridgeObjectRelease();
  return v18;
}

- (id)fetchGamesPopularWithFriends:(id)a3 :(int64_t)a4
{
  return sub_1E17C5768(self);
}

- (id)fetchActivityFeedCards:(id)a3 :(int64_t)a4
{
  return sub_1E17C5768(self);
}

- (id)fetchSuggestedFriends:(int64_t)a3
{
  uint64_t v3 = qword_1EBF1F948;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1E1D5B958();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EBF64050);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36930);
  sub_1E1D59A58();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1E1D666B0;
  sub_1E1D59998();
  sub_1E1D5B508();
  swift_bridgeObjectRelease();
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  v6 = (void *)sub_1E1D5CC88();
  MEMORY[0x1F4188790](v6);
  v7 = (void *)sub_1E1D5CC98();

  return v7;
}

- (id)fetchRengagementDataForLocalPlayer
{
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  uint64_t v3 = self;
  v4 = (void *)sub_1E1D5CC88();
  uint64_t v5 = (void *)sub_1E1D5CC98();

  return v5;
}

- (id)fetchGameInfo:(id)a3
{
  sub_1E1D5BE58();
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  v4 = self;
  uint64_t v5 = (void *)sub_1E1D5CC88();
  v6 = (void *)sub_1E1D5CC98();

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC19AppStoreKitInternal12JSGameCenter)init
{
  result = (_TtC19AppStoreKitInternal12JSGameCenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end