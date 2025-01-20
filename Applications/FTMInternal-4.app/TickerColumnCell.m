@interface TickerColumnCell
- (_TtC13FTMInternal_416TickerColumnCell)initWithCoder:(id)a3;
- (_TtC13FTMInternal_416TickerColumnCell)initWithFrame:(CGRect)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation TickerColumnCell

- (_TtC13FTMInternal_416TickerColumnCell)initWithFrame:(CGRect)a3
{
  return (_TtC13FTMInternal_416TickerColumnCell *)sub_1001669E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13FTMInternal_416TickerColumnCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_tableView;
  id v6 = objc_allocWithZone((Class)UITableView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_characters) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_size) = 2;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_isScrolling) = 0;

  result = (_TtC13FTMInternal_416TickerColumnCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_tableView));

  swift_bridgeObjectRelease();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_10016702C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_characters))[2];
}

- (void)scrollViewDidScroll:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_isScrolling) = 1;
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_416TickerColumnCell_isScrolling) = 0;
}

@end