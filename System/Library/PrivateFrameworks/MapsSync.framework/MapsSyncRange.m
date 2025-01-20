@interface MapsSyncRange
- (_TtC8MapsSync13MapsSyncRange)init;
- (_TtC8MapsSync13MapsSyncRange)initWithOffset:(int64_t)a3 limit:(int64_t)a4;
- (int64_t)limit;
- (int64_t)offset;
@end

@implementation MapsSyncRange

- (_TtC8MapsSync13MapsSyncRange)initWithOffset:(int64_t)a3 limit:(int64_t)a4
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync13MapsSyncRange__range);
  int64_t *v4 = a3;
  v4[1] = a4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MapsSyncRange();
  return [(MapsSyncRange *)&v6 init];
}

- (int64_t)offset
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync13MapsSyncRange__range);
}

- (int64_t)limit
{
  return *(void *)&self->_range[OBJC_IVAR____TtC8MapsSync13MapsSyncRange__range];
}

- (_TtC8MapsSync13MapsSyncRange)init
{
  result = (_TtC8MapsSync13MapsSyncRange *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end