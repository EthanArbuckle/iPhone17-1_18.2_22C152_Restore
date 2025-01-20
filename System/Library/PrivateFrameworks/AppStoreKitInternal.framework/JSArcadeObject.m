@interface JSArcadeObject
- (_TtC19AppStoreKitInternal14JSArcadeObject)init;
- (id)getDownloadPackGames:(id)a3;
- (id)getMarketingItemFromMarketingItems:(id)a3;
- (id)getMarketingItemWithTimeout:(id)a3 :(id)a4;
- (id)getRecentlyPlayedGamesWithTimeout:(id)a3;
@end

@implementation JSArcadeObject

- (id)getMarketingItemFromMarketingItems:(id)a3
{
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_1E1D5CC88();
  v8 = (void *)sub_1E1D5CC98();

  return v8;
}

- (id)getMarketingItemWithTimeout:(id)a3 :(id)a4
{
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10 = (void *)sub_1E1D5CC88();
  v11 = (void *)sub_1E1D5CC98();

  return v11;
}

- (id)getRecentlyPlayedGamesWithTimeout:(id)a3
{
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  id v5 = a3;
  v6 = self;
  id v7 = (void *)sub_1E1D5CC88();
  id v8 = (void *)sub_1E1D5CC98();

  return v8;
}

- (id)getDownloadPackGames:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_1E19D3B48(v4);

  return v6;
}

- (_TtC19AppStoreKitInternal14JSArcadeObject)init
{
  result = (_TtC19AppStoreKitInternal14JSArcadeObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal14JSArcadeObject_arcadeStore);
}

@end