@interface MapsSyncMutableHistoryItem
- (_TtC8MapsSync26MapsSyncMutableHistoryItem)initWithProxyObject:(id)a3;
- (double)position;
- (void)setPosition:(double)a3;
@end

@implementation MapsSyncMutableHistoryItem

- (_TtC8MapsSync26MapsSyncMutableHistoryItem)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (double)position
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory), sel_position);
  return result;
}

- (void)setPosition:(double)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory));
}

@end