@interface PersistanceStore
- (_TtC13FTMInternal_416PersistanceStore)init;
- (void)dealloc;
@end

@implementation PersistanceStore

- (void)dealloc
{
  v2 = self;
  sub_1001DEAF4();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  sub_10015E120((uint64_t)self + OBJC_IVAR____TtC13FTMInternal_416PersistanceStore_storeDelegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13FTMInternal_416PersistanceStore____lazy_storage___coreTelephonyService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13FTMInternal_416PersistanceStore____lazy_storage___metricService));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13FTMInternal_416PersistanceStore_aBMWrapper);
}

- (_TtC13FTMInternal_416PersistanceStore)init
{
  result = (_TtC13FTMInternal_416PersistanceStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end