@interface MapsSyncQueryOptions
+ (id)restrictOptionsWithOptions:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (BOOL)lazyLoad;
- (BOOL)notifyOnLoad;
- (NSArray)sortDescriptors;
- (_TtC8MapsSync13MapsSyncRange)range;
- (_TtC8MapsSync20MapsSyncQueryOptions)init;
- (_TtC8MapsSync20MapsSyncQueryOptions)initWithOptions:(id)a3;
- (_TtC8MapsSync20MapsSyncQueryOptions)initWithPredicate:(id)a3 sortDescriptors:(id)a4 range:(id)a5;
- (_TtC8MapsSync22MapsSyncQueryPredicate)predicate;
- (void)setLazyLoad:(BOOL)a3;
- (void)setNotifyOnLoad:(BOOL)a3;
- (void)setPredicate:(id)a3;
- (void)setRange:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation MapsSyncQueryOptions

- (_TtC8MapsSync22MapsSyncQueryPredicate)predicate
{
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)sub_1A70206E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_predicate);
}

- (void)setPredicate:(id)a3
{
}

- (_TtC8MapsSync13MapsSyncRange)range
{
  return (_TtC8MapsSync13MapsSyncRange *)sub_1A70206E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_range);
}

- (void)setRange:(id)a3
{
}

- (NSArray)sortDescriptors
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_sortDescriptors);
  swift_beginAccess();
  if (*v2)
  {
    sub_1A6EE80D0(0, (unint64_t *)&unk_1EB6711F0);
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1A709D4C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (void)setSortDescriptors:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1A6EE80D0(0, (unint64_t *)&unk_1EB6711F0);
    uint64_t v3 = sub_1A709D4D8();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_sortDescriptors);
  swift_beginAccess();
  uint64_t *v5 = v3;
  swift_bridgeObjectRelease();
}

- (BOOL)notifyOnLoad
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_notifyOnLoad);
}

- (void)setNotifyOnLoad:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_notifyOnLoad) = a3;
}

- (BOOL)lazyLoad
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_lazyLoad;
  swift_beginAccess();
  return *v2;
}

- (void)setLazyLoad:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_lazyLoad;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (_TtC8MapsSync20MapsSyncQueryOptions)initWithPredicate:(id)a3 sortDescriptors:(id)a4 range:(id)a5
{
  uint64_t v6 = (uint64_t)a4;
  if (a4)
  {
    sub_1A6EE80D0(0, (unint64_t *)&unk_1EB6711F0);
    uint64_t v6 = sub_1A709D4D8();
  }
  id v8 = a3;
  id v9 = a5;
  v10 = (_TtC8MapsSync20MapsSyncQueryOptions *)sub_1A7022A30(a3, v6, a5);

  return v10;
}

- (_TtC8MapsSync20MapsSyncQueryOptions)initWithOptions:(id)a3
{
  id v3 = a3;
  v4 = (_TtC8MapsSync20MapsSyncQueryOptions *)sub_1A7022CE4((uint64_t)v3);

  return v4;
}

+ (id)restrictOptionsWithOptions:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  unint64_t v5 = (unint64_t)a5;
  if (a5)
  {
    sub_1A6EE80D0(0, (unint64_t *)&unk_1EB6711F0);
    unint64_t v5 = sub_1A709D4D8();
  }
  id v8 = a3;
  id v9 = a4;
  v10 = sub_1A7022EA4(a3, a4, v5);

  swift_bridgeObjectRelease();
  return v10;
}

- (_TtC8MapsSync20MapsSyncQueryOptions)init
{
  result = (_TtC8MapsSync20MapsSyncQueryOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end