@interface OnDeviceSearchHistoryManager
- (_TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager)init;
- (id)fetchRecentsWithLimit:(int64_t)a3;
- (void)clearRecents;
- (void)removeRecentSearchTerm:(id)a3;
- (void)saveRecentSearchWithLimit:(id)a3 :(int64_t)a4;
@end

@implementation OnDeviceSearchHistoryManager

- (id)fetchRecentsWithLimit:(int64_t)a3
{
  sub_1E1A3D718();
  v4 = self;
  v5 = (void *)sub_1E1D5CC88();
  v6 = (void *)sub_1E1D5CC98();

  return v6;
}

- (void)saveRecentSearchWithLimit:(id)a3 :(int64_t)a4
{
  sub_1E1A3D718();
  id v6 = a3;
  v7 = self;
  v8 = (void *)sub_1E1D5CC88();
  v9 = (void *)sub_1E1D5CC98();
}

- (void)removeRecentSearchTerm:(id)a3
{
  sub_1E1D5BE58();
  sub_1E1A3D718();
  v4 = self;
  v5 = (void *)sub_1E1D5CC88();
  id v6 = (void *)sub_1E1D5CC98();

  swift_bridgeObjectRelease();
}

- (void)clearRecents
{
  sub_1E1A3D718();
  v3 = self;
  v4 = (void *)sub_1E1D5CC88();
  v5 = (void *)sub_1E1D5CC98();
}

- (_TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager)init
{
  result = (_TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager_defaults));
  swift_bridgeObjectRelease();
  swift_release();
}

@end