@interface SearchTableViewDiffableDataSource
- (_TtC11MobilePhone33SearchTableViewDiffableDataSource)init;
- (void)didCompleteSearchFor:(id)a3;
- (void)reloadData;
@end

@implementation SearchTableViewDiffableDataSource

- (void)didCompleteSearchFor:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  SearchTableViewDiffableDataSource.didCompleteSearch(for:)(a3);
  swift_unknownObjectRelease();
}

- (void)reloadData
{
  v2 = self;
  SearchTableViewDiffableDataSource.reloadData()();
}

- (_TtC11MobilePhone33SearchTableViewDiffableDataSource)init
{
  result = (_TtC11MobilePhone33SearchTableViewDiffableDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MobilePhone33SearchTableViewDiffableDataSource_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobilePhone33SearchTableViewDiffableDataSource_tableView));
  outlined destroy of weak (UIViewController & ContactAvatarCardControllerProtocol)?((uint64_t)self + OBJC_IVAR____TtC11MobilePhone33SearchTableViewDiffableDataSource_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobilePhone33SearchTableViewDiffableDataSource_lastSearchStartTime));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobilePhone33SearchTableViewDiffableDataSource____lazy_storage___datasource));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end